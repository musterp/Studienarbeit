# TUBAF Vorlage für wissenschaftliche Arbeiten

LaTeX-Template für Studien- und Diplomarbeiten an der TU Freiberg, basierend auf der TUBAFarbeiten-Klasse von Thomas Benkert (c) 2008 - 2019 (CC-by-nd 3.0).

> Um die Lizenz der TUBAFpakete anzusehen, gehen Sie bitte zu http://creativecommons.org/licenses/by-nd/3.0/de/ oder schicken Sie einen Brief an  Creative Commons, 171 Second Street, Suite 300, San Francisco, California 94105, USA.

Die restlichen Module abseits des unbearbeiteten TUBAFarbeiten-Paketes stehen unter MIT-Lizenz.

## Einrichtung

Die TUBAFarbeiten-Klasse ist Bestandteil dieses Repos und steht unter Creative Commons -- Namensnennung, keine Bearbeitung, 3.0 -- Lizenz (Copyright 2008 - 2019 by Thomas Benkert). Die Klasse muss mit allen ihren Zusatzmodulen auf der gleichen Ebene wie die Datei `main.tex` liegen, damit das hier vorliegende Minimalbeispiel kompiliert werden kann. Ersatzweise kann das vollständige TUBAF-LaTeX auch im lokalen `texmf-local` Ordner des eigenen Rechners installiert werden. Nachfolgend werden die einzelnen Möglichkeiten kurz beschrieben.

Das vollständige TUBAF-LaTeX Paket ist unter folgender Adresse verfügbar, wenn eine uni-interne Internetverbindung (z.B. VPN) zur Verfügung steht:
> https://tu-freiberg.de/presse/latex/download


### Kompilieren mit im lokalen Ordner liegenden Paketbestandteilen

Im lokalen Ordner der TUBAF-Vorlage müssen die folgenden Dateien des TUBAFLaTeX Pakets abgelegt werden:
- `TUBAFarbeiten.cls`
- `TUBAFarbeiten.ldf`
- `TUBAFbausteine.sty`
- `TUBAFbausteinebefehle.sty`
- `TUBAFbausteinefarben.sty`
- `TUBAFbausteinelaengen.sty`

Optional können noch folgende Paketbestandteile hinzugefügt werden:
- `TUBAFbib.sty` (für TUBAF-Literaturverzeichnisse)
- Spezielle Font-Pakete (für die TUBAF Hausschrift etc.)

Anschließend sollte `main.tex` ohne Probleme kompiliert werden können. Die Vorlage funktioniert mit `pdflatex` sowie `latexmk`. Die Bibliografie sollte, da das neuere Paket BibLaTeX und nicht BibTeX genutzt wird, mit `biber` statt mit `bibtex` kompiliert werden.

### Installation des TUBAF-LaTeX Pakets im texmf-local Ordner

Alternativ, um nicht die Klassenbestandteile im lokalen Ordner ablegen zu müssen, kann das gesamte TUBAF-LaTeX Paket auch direkt der TeXLive oder MicTeX-Umgebung per texmf-directory bereitgestellt werden. Dazu sind folgende Schritte notwendig:

1. Herunterladen der Quelldateien (zip-file) und unzip der komprimierten Datei.
2. Die Dateistruktur enthält nun einen texmf-Ordner, darunter liegen die Ordner doc, latex, und je nach gewähltem Paket auch fonts. Diese Bestandteile müssen nun in die Ordnerstruktur des texmf-local Ordners kopiert werden. Nicht einfach drag and drop! Die Struktur von texmf-local muss erhalten bleiben.
   1. *Unter MacOS* mit MacTeX: Kopiere die Dateien in die Struktur unter `/usr/local/texlive/texmf-local`.
   2. *Unter Windows*: `texmf-local` ist im Installationsverzeichnis zu finden, meist unter `C:\ProgramFiles...`oder `C:\MikTeX...` bzw. `C:\texlive\...` oder ähnlichem. Ein paar gute Tipps sind hier zu finden:
      - TexLive: https://tex.stackexchange.com/questions/558658/how-do-i-install-packages-in-texlive-on-windows-10
      - MikTex: https://miktex.org/kb/texmf-roots
3. Anschließend müssen die Änderungen TeXLive bzw. MikTeX bekannt gemacht werden. Dazu:
   1. *Unter MacOS:* Im Terminal "`sudo texhash`" eingeben und mit Eingabe des Nutzer-Passworts bestätigen.
   2. *Unter Windows*: PowerShell als Administrator öffnen und "`texhash`" eingeben.
