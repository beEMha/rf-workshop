# Warsztaty z Robot Framework i Selenium: Zadania praktyczne

Witajcie na warsztatach z Robot Framework!

Przed Wami cztery praktyczne zadania, które pozwolą Wam przećwiczyć pisanie testów automatycznych dla aplikacji webowej.
Waszym celem jest stworzenie od podstaw skryptów testowych realizujących poniższe scenariusze, korzystając z Robot Framework oraz SeleniumLibrary.

Powodzenia!

---

## Zadanie 1: Obsługa formularza "Text Box"

### Cel zadania
Nauczyć się wypełniania podstawowych pól formularza, klikania w przycisk i weryfikacji wyświetlonych danych.

### Strona do testowania
`https://demoqa.com/text-box`

### Kroki do zautomatyzowania
1.  Otwórz przeglądarkę na podanej stronie.
2.  Znajdź pole **Full Name** i wpisz w nie swoje imię i nazwisko (np. "Jan Kowalski").
3.  W polu **Email** podaj testowy adres e-mail (np. "jan.kowalski@test.pl").
4.  W polu **Current Address** wpisz dowolny, krótki adres (np. "ul. Testowa 1, Warszawa").
5.  Pole **Permanent Address** uzupełnij innym adresem.
6.  Kliknij niebieski przycisk **Submit**.
7.  Sprawdź (zweryfikuj), czy pod formularzem pojawił się blok z dokładnie tymi danymi, które zostały przez Ciebie wprowadzone.

### Wskazówki
* Użyj słów kluczowych: `Input Text`, `Click Button` oraz `Page Should Contain`.
* Przyjrzyj się elementom za pomocą narzędzi deweloperskich w przeglądarce. Wszystkie pola i przycisk na tej stronie mają unikalne atrybuty **id**, co jest najprostszym i najbardziej stabilnym sposobem ich lokalizacji!

---

## Zadanie 2: Interakcja z drzewkiem "Check Box"

### Cel zadania
Przećwiczenie interakcji z niestandardowymi elementami, takimi jak rozwijane drzewo i customowe checkboxy.

### Strona do testowania
`https://demoqa.com/checkbox`

### Kroki do zautomatyzowania
1.  Otwórz stronę.
2.  Kliknij w ikonę strzałki, aby rozwinąć główny folder **Home**.
3.  Następnie w ten sam sposób rozwiń folder **Downloads**.
4.  Zaznacz (kliknij) checkbox przy pliku **Word File.doc**.
5.  Zweryfikuj, czy na dole strony pojawił się komunikat: `You have selected : wordFile`.

### Wskazówki
* Te elementy nie posiadają `id`. Konieczne będzie użycie selektorów **XPath**.
* Zwróć uwagę, że klikalny obszar checkboxa to element `<span>` ze specyficzną klasą, znajdujący się wewnątrz elementu `<label>`.
* Strzałki do rozwijania folderów to elementy `<button>`.

---

## Zadanie 3: Zaznaczanie "Radio Button"

### Cel zadania
Opanowanie zaznaczania przycisków typu "radio" oraz weryfikacja stanu innych elementów (np. czy są nieaktywne).

### Strona do testowania
`https://demoqa.com/radio-button`

### Kroki do zautomatyzowania
1.  Otwórz stronę.
2.  W pytaniu "Do you like the site?" wybierz opcję **Impressive**.
3.  Sprawdź, czy pod pytaniem pojawił się zielony tekst: `You have selected Impressive`.
4.  Dodatkowo zweryfikuj, czy przycisk z odpowiedzią **No** jest nieaktywny (wyszarzony).

### Wskazówki
* Najprostszym sposobem na interakcję z radio buttonem jest kliknięcie w jego etykietę (`<label>`). Znajdź ją po atrybucie `for`.
* Do precyzyjnej weryfikacji tekstu użyj słowa kluczowego `Element Text Should Be`.
* Do sprawdzenia, czy element jest nieaktywny, idealnie nada się słowo kluczowe `Element Should Be Disabled`.

---

## Zadanie 4: Praca z tabelą "Web Tables"

### Cel zadania
Nauczenie się wyszukiwania konkretnych danych w tabeli i wykonywania akcji na wierszu, który te dane zawiera.

### Strona do testowania
`https://demoqa.com/webtables`

### Kroki do zautomatyzowania
1.  Otwórz stronę.
2.  W tabeli znajdź wiersz, w którym w kolumnie "First Name" znajduje się imię **Alden**.
3.  W znalezionym wierszu (tym należącym do Aldena) kliknij ikonę **ołówka** (Edit).
4.  Sprawdź, czy na stronie pojawiło się okno modalne z nagłówkiem **Registration Form**.

### Wskazówki
* To zadanie wymaga zbudowania bardziej złożonego lokalizatora **XPath**.
* Zacznij od znalezienia komórki `<div>` z tekstem 'Alden'. Następnie "wyjdź" poziom wyżej do wspólnego kontenera dla całego wiersza (`..`), aby stamtąd zlokalizować ikonę edycji.
* Pamiętaj o użyciu `Wait Until Element Is Visible`, aby dać oknu modalnemu czas na pojawienie się, zanim spróbujesz je zweryfikować.
