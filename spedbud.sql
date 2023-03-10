-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 20 Cze 2020, 16:37
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `spedbud`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategorie`
--

CREATE TABLE `kategorie` (
  `id_kategorii` int(11) NOT NULL,
  `nazwa` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `kategorie`
--

INSERT INTO `kategorie` (`id_kategorii`, `nazwa`) VALUES
(1, 'Koparko ładowarka'),
(2, 'Koparka kołowa'),
(3, 'Samochód firmowy Fiat'),
(4, 'Samochód firmowy Citroen'),
(5, 'MINIKOPARKA GĄSIENICOWA '),
(6, 'KOPARKA GĄSIENICOWA'),
(7, 'MINIŁADOWARKA KOŁOWA'),
(8, 'ŁADOWARKA TELESKOPOWA'),
(11, 'WOZIDŁA BUDOWLANE 2tony'),
(12, 'PODNOŚNIKI KOSZOWE ELEKTRYCZNE PRZEGUBOW'),
(13, 'Żuraw samojezdny 35 ton');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `id_pracownicy` int(11) NOT NULL,
  `imie` varchar(30) NOT NULL,
  `nazwisko` varchar(40) NOT NULL,
  `numer telefonu` int(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `pracownicy`
--

INSERT INTO `pracownicy` (`id_pracownicy`, `imie`, `nazwisko`, `numer telefonu` ) VALUES
(1, 'Marcin', 'Opolski', '578963124'),
(2, 'Stanisław', 'Janicki', '582364158'),
(3, 'Michał', 'Morawski', '987541021'),
(4, 'Dominik', 'Nowacki', '471369564');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(20) NOT NULL,
  `haslo` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`id`, `nazwa`, `haslo`) VALUES
(1, 'admin', 'admin123456');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zlecenia`
--

CREATE TABLE `zlecenia` (
  `id_zlecenia` int(11) NOT NULL,
  `adres` varchar(120) NOT NULL,
  `kategoria_id` int(11) NOT NULL,
  `opis` text NOT NULL,
  `pracownicy_id` int(11) NOT NULL,
  `data` date NOT NULL,
  `realizacja` tinyint(1) NOT NULL,
  `datakoncowa` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `zlecenia`
--

INSERT INTO `zlecenia` (`id_zlecenia`, `adres`, `kategoria_id`, `opis`, `pracownicy_id`, `data`, `realizacja`, `datakoncowa`) VALUES
(1, 'Hetmańska 19, 15-727 Białystok ', 1, 'Koparko ładowarka rozpoczęcie wykopu na fundamenty pod dom jednorodzinny', 1, '2022-01-07', 1, '2022-01-14'),
(2, 'Łyski, 16-070', 2, 'Koparka kołowa wykop pod kanalizacje na długości 15km', 2, '2022-02-06', 1, '2022-02-18'),
(8, 'Veiverių g. 132, Kaunas 46337, Litwa', 7, 'Zasypanie wykopu ', 3, '2022-06-06', 1, '2022-06-08'),
(12, 'Veiverių g. 132, Kaunas 46337, Litwa', 3, 'Transport samochodu firmowego fiat', 4, '2022-07-06', 1, '2022-07-15'),
(13, 'Elewatorska 13, 19-203 Grajewo', 5, 'Wykop pod instalacje ziemne', 3, '2022-06-06', 0, '2022-06-15'),
(14, 'Spickenstraße 11, 99817 Eisenach, Niemcy', 3, 'transport pracownikow na roboty budowlane zwiazane z rozbiórka dachu i stawieniem nowego', 1, '2022-08-06', 0, '2022-10-15'),
(3, 'Świętego Marka 70/1,15-528 Sowlany ', 12, 'Żuraw samojezdny 35 ton rozładunek więźby dachowej i bloczków silikatowych do murowania', 4, '2022-06-03', 1, '2022-06-04'); 

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`id_kategorii`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`id_pracownicy`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zlecenia`
--
ALTER TABLE `zlecenia`
  ADD PRIMARY KEY (`id_zlecenia`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `id_kategorii` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy``
  MODIFY `id_pracownicy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `zlecenia`
--
ALTER TABLE `zlecenia`
  MODIFY `id_zlecenia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
