# Warsztaty z Robot Framework i REST API: Zadania praktyczne

Witajcie na warsztatach z automatyzacji testów API!

Przed Wami trzy praktyczne zadania, które pozwolą Wam przećwiczyć pisanie testów dla publicznego REST API.
Waszym celem jest napisanie od zera skryptów, które zrealizują poniższe scenariusze, używając do tego Robot Framework i RequestsLibrary.

API testowe to **Restful-booker**.

Powodzenia!

---

### Konfiguracja początkowa (do użycia we wszystkich zadaniach)

Na początku każdego pliku z testami umieść poniższe sekcje ***Settings*** i ***Variables***. W przeciwieństwie do Appium, tutaj konfiguracja jest znacznie prostsza.

```robot
*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${BASE_URL}       https://restful-booker.herokuapp.com
&{HEADERS}        Content-Type=application/json    Accept=application/json
```
---

## Zadanie 1: Tworzenie i weryfikacja rezerwacji (CRUD - Create, Read)

### Cel zadania
Sprawdzenie, czy nowa rezerwacja może zostać poprawnie utworzona (POST), a następnie czy jej dane można poprawnie odczytać (GET).

### Kroki do zautomatyzowania
1. Napisz test, który wysyła żądanie POST na endpoint /booking.
2. W ciele żądania (body) umieść dane nowej rezerwacji (imię, nazwisko, cena, daty itd.).
3. Po wysłaniu żądania zweryfikuj, czy status odpowiedzi to 200 OK.
4. Z odpowiedzi wyodrębnij i zapisz bookingid nowo utworzonej rezerwacji.
5. Napisz drugi test, który wysyła żądanie GET na endpoint /booking/{bookingid}, używając zapisanego ID.
6. Zweryfikuj, czy status odpowiedzi to 200 OK i czy dane w odpowiedzi (np. imię, cena) zgadzają się z tymi, które zostały wysłane w kroku 2.

### Wskazówki
* Użyj słowa kluczowego Create Dictionary do zbudowania ciała żądania JSON.
* Do przekazywania bookingid między testami użyj Set Suite Variable.
* Do weryfikacji wartości używaj Should Be Equal As Strings lub Should Be Equal As Numbers.
* Pamiętaj o dodaniu nagłówków (headers=${HEADERS}) do swojego żądania.

## Zadanie 2: Pełna i częściowa aktualizacja rezerwacji (CRUD - Update)

### Cel zadania
Sprawdzenie pełnego cyklu aktualizacji zasobu: przy użyciu metody PUT (całkowita zamiana danych) oraz PATCH (częściowa modyfikacja), z uwzględnieniem autoryzacji.

### Kroki do zautomatyzowania
1. Napisz słowo kluczowe, które pobiera token autoryzacyjny z endpointu /auth (dane logowania: admin/password123). Uruchom je w Suite Setup.
2. Użyj bookingid z poprzedniego zadania.
3. Wyślij żądanie PUT na /booking/{bookingid}, przesyłając w ciele kompletnie nowe dane rezerwacji.
4. Do żądania dołącz pobrany token (jako Cookie w nagłówku).
5. Zweryfikuj status 200 OK i upewnij się, że wszystkie pola rezerwacji zostały zaktualizowane.
6. Następnie wyślij żądanie PATCH, aktualizując tylko imię i cenę.
7. Zweryfikuj status 200 OK i sprawdź, czy zmieniły się tylko te dwa pola, a pozostałe (np. nazwisko) pozostały bez zmian.

### Wskazówki
* Token autoryzacyjny należy przesłać w nagłówku w formacie: Cookie=token=TWOJ_TOKEN.
* Możesz stworzyć osobny słownik dla nagłówków autoryzacyjnych wewnątrz testu.
* Porównaj odpowiedź z PUT i PATCH, aby upewnić się, że aktualizacja przebiegła zgodnie z oczekiwaniami.

## Zadanie 3: Usunięcie rezerwacji i weryfikacja (CRUD - Delete)

### Cel zadania
Przetestowanie usuwania zasobu (DELETE) oraz weryfikacja, czy zasób faktycznie przestał być dostępny.

### Kroki do zautomatyzowania
1. Użyj bookingid stworzonego w pierwszym zadaniu oraz tokena z zadania drugiego.
2. Wyślij żądanie DELETE na endpoint /booking/{bookingid}. Pamiętaj o dołączeniu tokena autoryzacyjnego.
3. Zweryfikuj, czy odpowiedź serwera ma status 201 Created (ten kod jest zwracany przez to API po pomyślnym usunięciu).
4. Aby potwierdzić usunięcie, wyślij ponownie żądanie GET na ten sam endpoint (/booking/{bookingid}).
5. Tym razem zweryfikuj, czy serwer odpowiedział statusem 404 Not Found, co oznacza, że rezerwacja już nie istnieje.

### Wskazówki
* Żądanie DELETE również wymaga autoryzacji za pomocą tokena.
* Aby poprawnie zweryfikować oczekiwany błąd, użyj parametru expected_status=404 w słowie kluczowym GET On Session. Dzięki temu test nie zakończy się błędem, gdy otrzyma status 404.