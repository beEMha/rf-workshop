# Warsztaty z Robot Framework i FlaUI: Zadania praktyczne

Witajcie na warsztatach z Robot Framework i FlaUI!

Przed Wami cztery praktyczne zadania, które pozwolą Wam przećwiczyć pisanie testów automatycznych dla aplikacji desktopowej.
Waszym celem jest stworzenie od podstaw skryptów testowych realizujących poniższe scenariusze, korzystając z Robot Framework oraz FlaUILibrary.

Do testów wykorzystamy standardową aplikację **Kalkulator** w systemie Windows.

Powodzenia!

---

## Zadanie 1: Proste działanie arytmetyczne

### Cel zadania
Nauczyć się obsługi podstawowych przycisków, klikania w nie i weryfikacji wyniku na wyświetlaczu.

### Aplikacja do testowania
Kalkulator (`C:\Windows\System32\calc.exe`)

### Kroki do zautomatyzowania
1.  Uruchom aplikację Kalkulator.
2.  Upewnij się, że Kalkulator jest w trybie **Standardowym**.
3.  Kliknij przycisk z cyfrą **7**.
4.  Kliknij przycisk dodawania (**Plus**).
5.  Kliknij przycisk z cyfrą **8**.
6.  Kliknij przycisk **Równa się**.
7.  Sprawdź (zweryfikuj), czy na wyświetlaczu pojawił się wynik "**15**".

### Wskazówki
* Do uruchomienia aplikacji użyj słowa kluczowego `Launch Application`.
* Użyj słów kluczowych `Click` oraz `Get Name From Element`. Do weryfikacji wyniku idealnie nada się `Should Be Equal`.
* Do inspekcji elementów i znalezienia ich lokatorów (np. `AutomationId`) użyj narzędzia **FlaUInspect**. Dla cyfr i podstawowych operacji `AutomationId` to np. `num7Button`, `plusButton`, `equalButton`.
* Wynik do weryfikacji znajduje się w elemencie o `AutomationId`: `CalculatorResults`. Jego atrybut `Name` będzie zawierał tekst w formacie "Wyświetlana wartość to 15".

---

## Zadanie 2: Zmiana trybu kalkulatora

### Cel zadania
Przećwiczenie interakcji z menu nawigacyjnym aplikacji w celu zmiany jej widoku/trybu.

### Aplikacja do testowania
Kalkulator (`C:\Windows\System32\calc.exe`)

### Kroki do zautomatyzowania
1.  Uruchom aplikację Kalkulator.
2.  Kliknij w przycisk menu nawigacyjnego ("hamburger menu", `AutomationId`: `TogglePaneButton`).
3.  Poczekaj, aż menu się pojawi.
4.  Z listy trybów wybierz i kliknij opcję **Naukowy**.
5.  Zweryfikuj, czy Kalkulator przeszedł w tryb naukowy, sprawdzając, czy widoczny jest przycisk charakterystyczny dla tego trybu, np. pierwiastek kwadratowy (**²√x**).

### Wskazówki
* Po kliknięciu w menu użyj `Wait Until Element Exists`, aby dać panelowi czas na pojawienie się.
* Elementy menu, takie jak "Naukowy", można zlokalizować po ich atrybucie `Name`.
* Przycisk pierwiastka kwadratowego w trybie naukowym ma `AutomationId`: `squareRootButton`. Sprawdzenie jego istnienia jest dobrym sposobem na potwierdzenie zmiany trybu.

---

## Zadanie 3: Obsługa błędu i weryfikacja stanu

### Cel zadania
Opanowanie weryfikacji komunikatów o błędach oraz sprawdzanie, czy dany element jest nieaktywny.

### Aplikacja do testowania
Kalkulator (`C:\Windows\System32\calc.exe`)

### Kroki do zautomatyzowania
1.  Uruchom aplikację Kalkulator.
2.  Kliknij przycisk z cyfrą **9**.
3.  Kliknij przycisk dzielenia (**Dzielenie przez**).
4.  Kliknij przycisk z cyfrą **0**.
5.  Kliknij przycisk **Równa się**.
6.  Sprawdź, czy na wyświetlaczu pojawił się komunikat o błędzie: "**Nie można dzielić przez zero**".
7.  Dodatkowo zweryfikuj, czy przycisk **Równa się** stał się nieaktywny (wyszarzony).

### Wskazówki
* Do weryfikacji komunikatu na wyświetlaczu użyj `Get Name From Element` oraz `Should Contain`.
* Do sprawdzenia, czy przycisk jest nieaktywny, idealnie nada się słowo kluczowe `Element Should Be Disabled`.

---

## Zadanie 4: Praca z historią obliczeń

### Cel zadania
Nauczenie się interakcji z dynamicznie generowaną listą (historią) oraz wybierania z niej konkretnych elementów.

### Aplikacja do testowania
Kalkulator (`C:\Windows\System32\calc.exe`)

### Kroki do zautomatyzowania
1.  Uruchom aplikację Kalkulator i upewnij się, że historia jest pusta (jeśli nie jest, kliknij ikonę kosza).
2.  Wykonaj pierwsze działanie: **5 \* 6 =**. Wynik to 30.
3.  Wykonaj drugie działanie: **2 + 3 =**. Wynik to 5.
4.  Otwórz panel **Historia**.
5.  Na liście historii znajdź wpis odpowiadający pierwszemu działaniu ("5 × 6 = 30").
6.  Kliknij ten wpis.
7.  Sprawdź, czy na głównym wyświetlaczu kalkulatora ponownie pojawił się wynik "**30**".

### Wskazówki
* To zadanie może wymagać zbudowania lokalizatora **XPath**, aby precyzyjnie wskazać element na liście historii.
* Struktura XPath może wyglądać mniej więcej tak: `//ListItem[contains(@Name, "5 × 6")]`. Użyj FlaUInspect, aby dokładnie zbadać drzewo elementów panelu historii.
* Pamiętaj o użyciu `Wait Until Element Is Visible`, aby dać panelowi historii czas na pojawienie się, zanim spróbujesz z nim wejść w interakcję.