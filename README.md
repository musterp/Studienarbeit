# TUBAF Vorlage für wiss. Arbeiten
LaTeX-Template für Studien- und Diplomarbeiten an der TU Freiberg, basierend auf der TUBAFarbeiten-Klasse von Thomas Benkert.

## Einrichtung
Die TUBAFarbeiten-Klasse ist nicht bestandteil dieses Repos. Die Klasse muss entweder bereits installiert sein, im texmf-local liegen oder in den lokalen Ordner des Repositoriums (in welchem die Arbeit später kompiliert werden soll) eingefügt werden. Nachfolgend werden die einzelnen Möglichkeiten kurz beschrieben. Das TUBAF-LaTeX Paket ist unter https://tu-freiberg.de/presse/latex verfügbar, wenn eine uniseitige Internetverbindung (Intern, VPN) zur Verfügung steht.

### Kompilieren mit im lokalen Ordner liegenden Paketbestandteilen
Im lokalen Ordner müssen die folgenden Dateien des TUBAFLaTeX Pakets abgelegt werden:
- `TUBAFarbeiten.cls`
- `TUBAFarbeiten.ldf`
- `TUBAFbausteine.sty`
- `TUBAFbausteinebefehle.sty`
- `TUBAFbausteinefarben.sty`
- `TUBAFbausteinelaengen.sty`

Optional können noch folgende Paketbestandteile hinzugefügt werden:
- `TUBAFbib.sty` (für TUBAF-Literaturverzeichnisse)
- Spezielle Font-Pakete (für die TUBAF Hausschrift etc.)

Anschließend sollte `main.tex` ohne Probleme kompiliert werden können.

### Installation des TUBAF-LaTeX Pakets im texmf-local Ordner
Alternativ, um nicht die Klassenbestandteile im lokalen Ordner ablegen zu müssen, kann das gesamte TUBAF-LaTeX Paket auch direkt der TeXLive oder MicTeX-Umgebung per texmf-directory bereitgestellt werden. Dazu sind folgende Schritte notwendig:
1. Herunterladen der Quelldateien (zip-file) und unzip der komprimierten Datei.
2. Die Dateistruktur enthält nun einen texmf-Ordner, darunter liegen die Ordner doc, latex, und je nach gewähltem Paket auch fonts. Diese Bestandteile müssen nun in die Ordnerstruktur des texmf-local Ordners kopiert werden. Nicht einfach drag and drop! Die Struktur von texmf-local muss erhalten bleiben.
   1. Unter MacOS: Kopiere die Dateien in die Struktur unter `/usr/local/texlive/texmf-local`.
   2. Unter Windows: `texmf-local` ist im Installationsverzeichnis zu finden, meist unter `C:\ProgramFiles`oder ähnlichem.
3. Anschließend müssen die Änderungen TeXLive bekannt gemacht werden. Dazu:
   1. Unter MacOS: Im Terminal `sudo texhash`eingeben und mit Eingabe des Nutzer-Passworts bestätigen.
   2. Unter Windows: Powershell als Administrator öffnen und `texhash`eingeben. 

