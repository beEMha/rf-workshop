# Agenda Warsztatów: Automatyzacja z Robot Framework

---

## Blok 1: Poniedziałkowe Spotkanie Wprowadzające (2-3h)

### 1. Wprowadzenie Teoretyczne
* **Czym jest Robot Framework?** Architektura, czytelna składnia, kluczowe zalety.
* **Omówienie bibliotek:**
    * `SeleniumLibrary` (web)
    * `AppiumLibrary` (mobile)
    * `BuiltIn` (podstawa)
    * `FlaUI` (Windows)

### 2. Konfiguracja Środowiska
* Wspólne przejście przez setup **VS Code**.
* Zarządzanie zależnościami projektu (np. `pip`, `requirements.txt`).

### 3. Praktyka - Pierwszy Test
* **Wyjaśnienie podstawowych bloków:** `Test Cases`, `Keywords`, `Variables`.
* Wspólne kodowanie i uruchomienie kompletnego testu **E2E**.
* Demonstracja uruchamiania testów z konsoli.
* **Analiza wyników:** przeglądanie raportów i logów.

### 4. Zadania na Resztę Tygodnia
* **Przekazanie materiałów:** aplikacje testowe, dostęp do repozytorium, "ściągi".
* Omówienie planu i celów zadań praktycznych.

---

## Blok 2: Zadania Praktyczne na Tydzień (Wtorek - Piątek)
> **Twoja rola:** stałe wsparcie techniczne, odpowiedzi na pytania, code review.

### Główne Tematy Zadań dla Uczestników:

#### **Testy Webowe (`SeleniumLibrary`)**
* Nawigacja, asercje i interakcja z elementami.
* Obsługa list rozwijanych, scrollowania i mechanizmów `Wait`.
* Praktyka w pisaniu skutecznych lokatorów **XPath**.

#### **Organizacja Projektu i Dobre Praktyki**
* Implementacja wzorca **Page Object Model** przy użyciu plików `.resource`.
* Tworzenie reużywalnych, generycznych słów kluczowych.
* Zarządzanie danymi testowymi z plików zewnętrznych (np. `CSV`, `JSON`).

#### **Testy REST API (`RequestsLibrary`)**
* Wysyłanie zapytań `GET`, `POST`, `PUT`, `DELETE`.
* Weryfikacja kodów statusu i zawartości odpowiedzi.

#### **Testy Aplikacji Desktopowych (`FlaUILibrary`)**
* Wprowadzenie do biblioteki i jej konfiguracja.
* Podstawowe interakcje z aplikacją Windows.
* Lokalizowanie kontrolek za pomocą **Automation ID** oraz **XPath**.
* Strategie radzenia sobie z dynamicznymi elementami (`Retry`, `Wait`, `Timeout`).
* Konfiguracja automatycznych zrzutów ekranu przy niepowodzeniu testu.