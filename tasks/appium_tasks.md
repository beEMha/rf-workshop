# Warsztaty z Robot Framework i Appium: Zadania praktyczne

Przed Wami trzy praktyczne zadania, które pozwolą Wam przećwiczyć pisanie testów dla natywnej aplikacji na Androida.  
Waszym celem jest napisanie od zera skryptów, które zrealizują poniższe scenariusze, używając do tego **Robot Framework** i **AppiumLibrary**.

Aplikacja testowa to **Sauce Labs My Demo App**.

Powodzenia!

---

## Konfiguracja początkowa (do użycia we wszystkich zadaniach)

Na początku każdego pliku z testami umieść poniższe sekcje `***Settings***` i `***Variables***`, dostosowując wartości do swojego środowiska (szczególnie `platformVersion` i `deviceName`).

```robot
*** Settings ***
Library           AppiumLibrary
Test Teardown     Close Application

*** Variables ***
${APPIUM_SERVER}      http://127.0.0.1:4723
${PLATFORM_NAME}      Android
${PLATFORM_VERSION}   16
${DEVICE_NAME}        emulator-5554
${AUTOMATION_NAME}    UiAutomator2
${APP_PATH}           ${CURDIR}/android_app/mda-2.2.0-25.apk
```

---

## Zadanie 1: Negatywny scenariusz logowania

### Cel zadania
Sprawdzenie, czy aplikacja poprawnie obsługuje próbę logowania zablokowanego użytkownika.

### Kroki do zautomatyzowania
1.  Napisz słowo kluczowe, które otwiera aplikację (użyj `Open Application` z odpowiednimi zmiennymi).
2.  Stwórz słowo kluczowe, które nawiguje do ekranu logowania (kliknięcie w **menu hamburgerowe**, a następnie w opcję **"Log In"**).
3.  Użyj `Test Setup`, aby uruchomić powyższe słowa kluczowe przed każdym testem.
4.  W teście głównym spróbuj zalogować się, używając danych:
    - **Nazwa użytkownika:** `alice@example.com` (locked out)
    - **Hasło:** `123`
5.  Po próbie logowania zweryfikuj, czy na ekranie pojawił się komunikat o błędzie:  
    `Sorry this user has been locked out.`

### Wskazówki
* Użyj `Wait Until Page Contains Element` przed każdą interakcją, aby upewnić się, że element jest widoczny.  
* Do zlokalizowania elementów użyj **Appium Inspector**. Preferowane strategie: `id`, `accessibility_id`, `xpath`.  
* Do weryfikacji komunikatu o błędzie użyj `Element Text Should Be`.

---

## Zadanie 2: Pozytywny cykl logowania i wylogowania ✅

### Cel zadania
Sprawdzenie pełnego cyklu: od zalogowania poprawnego użytkownika, przez weryfikację strony głównej, aż po wylogowanie.

### Kroki do zautomatyzowania
1.  Użyj tego samego `Test Setup`, co w poprzednim zadaniu.  
2.  Zaloguj się, używając poprawnych danych:
    - **Nazwa użytkownika:** `standard_user`
    - **Hasło:** `secret_sauce`
3.  Po zalogowaniu sprawdź, czy na ekranie widoczny jest nagłówek **"Products"**.
4.  Napisz słowo kluczowe realizujące proces wylogowania:
    - Otwórz **menu hamburgerowe**.  
    - Kliknij opcję **"Logout"**.  
    - W oknie dialogowym, które się pojawi, kliknij przycisk potwierdzający wylogowanie.  
5.  Na koniec zweryfikuj, czy aplikacja powróciła do ekranu logowania (np. sprawdzając widoczność przycisku **"Login"**).

### Wskazówki
* Pamiętaj o obsłudze **okna dialogowego** przy wylogowaniu – przycisk potwierdzający ma `id=android:id/button1`.  
* Do weryfikacji nagłówka **"Products"** możesz użyć `Element Should Be Visible`.

---

## Zadanie 3: Dodanie produktu do koszyka

### Cel zadania
Przećwiczenie interakcji z listą produktów i weryfikacja stanu koszyka.

### Kroki do zautomatyzowania
1.  Użyj `Test Setup` i zaloguj się jako `standard_user`.  
2.  Sprawdź, czy jesteś na stronie produktów.  
3.  Kliknij w **obrazek pierwszego produktu** na liście (np. *Sauce Labs Backpack*).  
4.  Na ekranie szczegółów produktu poczekaj na pojawienie się przycisku **"Add To Cart"** i kliknij go.  
5.  Na koniec zweryfikuj, czy w prawym górnym rogu ekranu, na ikonie koszyka, pojawiła się plakietka z cyfrą **"1"**.

### Wskazówki
* Do znalezienia pierwszego produktu możesz użyć **XPath** – przyjrzyj się atrybutowi `content-desc`.  
* Do weryfikacji cyfry na ikonie koszyka użyj `Element Text Should Be`.  
* Rozważ stworzenie uniwersalnego słowa kluczowego, które czeka na element i od razu go klika (np. `Wait And Click Element`), aby uprościć kod.
