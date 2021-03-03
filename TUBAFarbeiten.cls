% copyright 2008-2011 by Thomas Benkert/Christian Degenkolb
% copyright 2012-2019 by Thomas Benkert
% http://latex.tu-freiberg.de
% latex at tu bindestrich freiberg punkt de
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dieses Werk ist unter einem Creative Commons 
% Namensnennung - Keine Bearbeitung 3.0 Deutschland Lizenzvertrag lizenziert. 
% Um die Lizenz anzusehen, gehen Sie bitte zu http://creativecommons.org/licenses/by-nd/3.0/de/ 
% oder schicken Sie einen Brief an 
% Creative Commons, 171 Second Street, Suite 300, San Francisco, California 94105, USA.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
%
\newcommand{\TUBAFarbeiten@name}{TUBAFarbeiten}
\newcommand{\TUBAFarbeiten@date}{2019/04/01}
\newcommand{\TUBAFarbeiten@version}{2.5.1}
%
\ProvidesClass{\TUBAFarbeiten@name}[\TUBAFarbeiten@date\space v.\TUBAFarbeiten@version\space Benkert, TUBAF-LaTeX]
%
\typeout{Klasse\space\TUBAFarbeiten@name\space\TUBAFarbeiten@date\space\TUBAFarbeiten@version\space Thomas Benkert^^J
	\@spaces\@spaces\@spaces\@spaces\@spaces TUBAF-LaTeX: Corporate Design 2013^^J
	\@spaces\@spaces\@spaces\@spaces\@spaces Qualifizierungsarbeiten der TU Bergakademie Freiberg}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pakete für die Optionen
\RequirePackage{xkeyval}
\RequirePackage{ifthen}
\RequirePackage{calc}
%
\RequirePackage{TUBAFbausteinebefehle}
% weitere Pakete werden später geladen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% neue Befehle für Optionen
%
\newboolean{TUBAFarbeiten@kapitel}\setboolean{TUBAFarbeiten@kapitel}{false}
%
\newcommand{\TUBAFarbeiten@doktyp}{}
\newcommand{\TUBAFarbeiten@nummern}{}
\newcommand{\TUBAFarbeiten@betreuerform}{}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Optionen deklarieren
%
% für Klassenauswahl
\DeclareOptionX{kapitel}[true]{%
	\XKV@cc*+[\val\nr]{#1}{true,false}{%
	\ifcase\nr\relax
		\setboolean{TUBAFarbeiten@kapitel}{true}%
	   \or
		\setboolean{TUBAFarbeiten@kapitel}{false}%
	\fi    
	}{\ClassWarningNoLine{\TUBAFarbeiten@name}{Der Wert '\val' der Option 'kapitel'\MessageBreak ist falsch und wird ignoriert}}%
}
%
% für Übergabe an Koma
\DeclareOptionX{parskip}[yes]{\renewcommand\TUBAF@parskip{#1}}
\DeclareOptionX{fontsize}[11pt]{\renewcommand\TUBAF@fontsize{#1}}
\DeclareOptionX{draft}[true]{\renewcommand\TUBAF@draft{#1}}
\DeclareOptionX{twoside}[true]{\renewcommand\TUBAF@twoside{#1}}
\DeclareOptionX{leqno}{\InputIfFileExists{leqno.clo}{}{}}% Umgehung der Übergabe an Koma-Klasse
\DeclareOptionX{fleqn}{\InputIfFileExists{fleqn.clo}{}{}}% Umgehung der Übergabe an Koma-Klasse
%
\DeclareOptionX{hausschrift}[true]{\renewcommand\TUBAF@hausschrift{#1}}
%
\DeclareOptionX{doktyp}[unbekannt]{%
	\XKV@cc*+[\doktypval\nr]{#1}{unbekannt,kbeleg,gbeleg,studarbeit,semarbeit,larbeit,parbeit,barbeit,marbeit,darbeit}{%
	\ifcase\nr\relax
		\renewcommand{\TUBAFarbeiten@doktyp}{\doktypval}\or%
		\renewcommand{\TUBAFarbeiten@doktyp}{\doktypval}\or%
		\renewcommand{\TUBAFarbeiten@doktyp}{\doktypval}\or%
		\renewcommand{\TUBAFarbeiten@doktyp}{\doktypval}\or%
		\renewcommand{\TUBAFarbeiten@doktyp}{\doktypval}\or%
		\renewcommand{\TUBAFarbeiten@doktyp}{\doktypval}\or%
		\renewcommand{\TUBAFarbeiten@doktyp}{\doktypval}\or%
		\renewcommand{\TUBAFarbeiten@doktyp}{\doktypval}\or%
		\renewcommand{\TUBAFarbeiten@doktyp}{\doktypval}\or%
		\renewcommand{\TUBAFarbeiten@doktyp}{\doktypval}%
	\fi    
	}{\ClassWarningNoLine{\TUBAFarbeiten@name}{Der Wert '\doktypval' der Option 'doktyp'\MessageBreak ist falsch und wird ignoriert}}%
}
%
\DeclareOptionX{titelseite}[standard]{%
	\XKV@cc*+[\val\nr]{#1}{standard,klassisch}{%
	\ifcase\nr\relax
		\renewcommand{\TUBAF@titelseite}{standard}%
	   \or
		\renewcommand{\TUBAF@titelseite}{klassisch}%
	\fi    
	}{\ClassWarningNoLine{\TUBAFarbeiten@name}{Der Wert '\val' der Option 'titelseite'\MessageBreak ist falsch und wird ignoriert}}%
}
%
% Wort-Bild-Marke
%
\DeclareOptionX{wbm}[blau-grau]{%
	\XKV@cc*+[\val\nr]{#1}{blau-grau,schwarz}{%
	\ifcase\nr\relax
		\renewcommand{\TUBAF@wbm}{blau-grau}\or%
		\renewcommand{\TUBAF@wbm}{schwarz}%
	\fi    
	}{\ClassWarningNoLine{\TUBAFarbeiten@name}{Der Wert '\val' der Option 'wbm'\MessageBreak ist falsch und wird ignoriert}}%
}
%
% Tracht der Wort-Bild-Marke
%
\DeclareOptionX{wbmtracht}[einfach]{%
	\XKV@cc*+[\val\nr]{#1}{einfach,250}{%
	\ifcase\nr\relax
		\renewcommand{\TUBAFwbmtracht}{einfach}\or%
		\renewcommand{\TUBAFwbmtracht}{250}%
	\fi    
	}{\ClassWarningNoLine{\TUBAFarbeiten@name}{Der Wert '\val' der Option 'wbmtracht'\MessageBreak ist falsch und wird ignoriert}}%
}
%
% tikz/pgf laden (false für bessere Performance)
%
\DeclareOptionX{tikz}[true]{%
	\XKV@cc*+[\val\nr]{#1}{true,false}{%
	\ifcase\nr\relax
		\renewcommand{\TUBAF@tikz}{true}\or%
		\renewcommand{\TUBAF@tikz}{false}%
	\fi    
	}{\ClassWarningNoLine{\TUBAFarbeiten@name}{Der Wert '\val' der Option 'tikz'\MessageBreak ist falsch und wird ignoriert}}%
}
%
% Grauabstufungen
%
\DeclareOptionX{helligkeitgrau}{%
	\ifthenelse{\isinteger{#1}}{%
		\renewcommand{\TUBAFhelligkeitgrau}{#1}%
	   }{\ClassWarningNoLine{\TUBAFarbeiten@name}{Der Wert '#1' der Option 'helligkeitgrau'\MessageBreak ist falsch und wird ignoriert.\MessageBreak Geben Sie eine ganze Zahl ein}}%
}
%
\DeclareOptionX{nummern}[fortlaufend]{%
	\XKV@cc*+[\val\nr]{#1}{fortlaufend,abschnitt}{%
	\ifcase\nr\relax
		\renewcommand{\TUBAFarbeiten@nummern}{fortlaufend}%
	   \or
		\renewcommand{\TUBAFarbeiten@nummern}{abschnitt}%
	\fi    
	}{\ClassWarning{\TUBAFarbeiten@name}{Der Wert '\val' der Option 'nummern'\MessageBreak ist falsch und wird ignoriert}}%
}
%
\DeclareOptionX{betreuerform}[liste]{%
	\XKV@cc*+[\val\nr]{#1}{liste,tabelle}{%
	\ifcase\nr\relax
		\renewcommand{\TUBAFarbeiten@betreuerform}{liste}%
	   \or
		\renewcommand{\TUBAFarbeiten@betreuerform}{tabelle}%
	\fi    
	}{\ClassWarningNoLine{\TUBAFarbeiten@name}{Der Wert '\val' der Option 'betreuerform'\MessageBreak ist falsch und wird ignoriert}}%
}
%
\DeclareOptionX{sprache}[ngerman]{%
	\XKV@cc*+[\val\nr]{#1}{nobabel,ngerman,german,american,english,french,norsk,polish,addgreek}{%
	\ifcase\nr\relax
		\renewcommand{\TUBAF@sprache}{nobabel}%
	   \or
		\renewcommand{\TUBAF@sprache}{ngerman}%
	   \or
		\renewcommand{\TUBAF@sprache}{german}%
	   \or
		\renewcommand{\TUBAF@sprache}{american}%
		\setboolean{TUBAF@german}{false}%
	   \or
		\renewcommand{\TUBAF@sprache}{english}%
		\setboolean{TUBAF@german}{false}%
	   \or
		\renewcommand{\TUBAF@sprache}{french}%
		\setboolean{TUBAF@german}{false}%
	   \or
		\renewcommand{\TUBAF@sprache}{norsk}%
		\setboolean{TUBAF@german}{false}%
	   \or
		\renewcommand{\TUBAF@sprache}{polish}%
		\setboolean{TUBAF@german}{false}%
	   \or
		\renewcommand{\TUBAF@addgreek}{greek,}% das Komma ist hier wichtig, da sonst Probleme bei Nichtladen
	\fi
	}{\ClassWarningNoLine{\TUBAFarbeiten@name}{Der Wert '\val' der Option 'sprache'\MessageBreak ist falsch und wird ignoriert}}%
}
%
\DeclareOptionX{farbschema}[rgb]{\renewcommand\TUBAF@farbenfarbschema{#1}}
\DeclareOptionX{farbtafel}[k]{\renewcommand\TUBAF@farbenfarbtafel{#1}}
\DeclareOptionX{textpos}[true]{\renewcommand\TUBAF@bausteinetextpos{#1}}
\DeclareOptionX{textposwert}[1]{\renewcommand\TUBAF@bausteinetextposwert{#1}}
\DeclareOptionX{textposeinheit}[mm]{\renewcommand\TUBAF@bausteinetextposeinheit{#1}}
\DeclareOptionX{bausteineeinheit}[mm]{\renewcommand\TUBAF@bausteinebausteineeinheit{#1}}
\DeclareOptionX{dvipdfm}[true]{\reewcommand\TUBAF@bausteinedvipdfm{#1}}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
\DeclareOptionX*{\ClassWarningNoLine{\TUBAFarbeiten@name}{Die unbekannte Option '\CurrentOption' wird ignoriert}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Optionen ausführen
\ExecuteOptionsX{%
	fontsize=11pt,
	parskip=no,
	twoside=false,
	draft=false,
	hausschrift=false,
	sprache=ngerman,
	titelseite=standard,
	wbm=blau-grau,
	tikz=true,
	nummern=fortlaufend,
	betreuerform=liste
}
%
% alle Optionen abarbeiten
\ProcessOptionsX\relax
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Grundklasse laden
\ifthenelse{\boolean{TUBAFarbeiten@kapitel}}{%
	\LoadClass[a4paper]{scrreprt}
	%
	\KOMAoptions{%
		chapterprefix=false,
		headings=normal,
		headings=chapterwithoutprefixline
	}
	%
	\renewcommand*{\chapterheadstartvskip}{\vspace*{.3\baselineskip}}% org. \vspace*{2.3\baselineskip}
   }{%
	\LoadClass[a4paper]{scrartcl}
}%\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% weitere Pakete laden
\RequirePackage[plainheadsepline,plainfootsepline,hmode]{scrlayer-scrpage}% Kopf- und Fußzeile
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Laden von TUBAFbausteinen mit Optionen
\ifthenelse{\equal{\TUBAF@tikz}{true}}{%
	\RequirePackage[%
		farbschema=\TUBAF@farbenfarbschema,
		farbtafel=\TUBAF@farbenfarbtafel,
		textpos=\TUBAF@bausteinetextpos,
		textposwert=\TUBAF@bausteinetextposwert,
		textposeinheit=\TUBAF@bausteinetextposeinheit,
		bausteineeinheit=\TUBAF@bausteinebausteineeinheit,
		dvipdfm=\TUBAF@bausteinedvipdfm
		]{TUBAFbausteine}%
   }{%
	\RequirePackage{graphicx}
	\RequirePackage{TUBAFbausteinefarben}
	\RequirePackage{TUBAFbausteinelaengen}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Helligkeit anpassen
%
\ifthenelse{\equal{\TUBAFhelligkeitgrau}{}}{}{%
	\TUBAFFarbe{TUBAFgrau}{0}{\TUBAFhelligkeitgrau}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Schriften Anfang
%
\TUBAFSchriftanpassung{arbeiten}{cmr}
% Schriften Ende
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% nachtrügliches Setzen der Klassenoptionen
\KOMAoptions{%
	captions=tableheading,
	fontsize=\TUBAF@fontsize,
	parskip=\TUBAF@parskip,
	draft=\TUBAF@draft,
	twoside=\TUBAF@twoside,
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% muß nach TUBAFbausteine UND KOMAoptions geladen werden
\RequirePackage[%
	paper=a4paper,
	inner=6\TUBAFrasterweite,
	outer=5\TUBAFrasterweite,
	top=4\TUBAFrasterweite,
	bottom=4\TUBAFrasterweite,
	headsep=4.3ex,
	footskip=6.9ex,
	includehead,
	includefoot,
	marginparwidth=1.5cm
	]{geometry}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% setzen des doktyps
%\newcommand{\TUBAFarbeiten@doktyp}{}
\newcommand{\TUBAFarbeitenkbelegname}{Kleiner Beleg}
\newcommand{\TUBAFarbeitengbelegname}{Gro\ss er Beleg}
\newcommand{\TUBAFarbeitenstudarbeitname}{Studienarbeit}
\newcommand{\TUBAFarbeitensemarbeitname}{Seminararbeit}
\newcommand{\TUBAFarbeitenlarbeitname}{Literaturarbeit}
\newcommand{\TUBAFarbeitenparbeitname}{Projektarbeit}
\newcommand{\TUBAFarbeitenbarbeitname}{Bachelorarbeit}
\newcommand{\TUBAFarbeitenmarbeitname}{Masterarbeit}
\newcommand{\TUBAFarbeitendarbeitname}{Diplomarbeit}

\ifthenelse{\equal{\TUBAFarbeiten@doktyp}{unbekannt}\OR\equal{\TUBAFarbeiten@doktyp}{}}{%
	\renewcommand{\TUBAFarbeiten@doktyp}{}%
	}{%
	\ifthenelse{\equal{\TUBAFarbeiten@doktyp}{kbeleg}}{\renewcommand{\TUBAFarbeiten@doktyp}{\TUBAFarbeitenkbelegname}}{%
	\ifthenelse{\equal{\TUBAFarbeiten@doktyp}{gbeleg}}{\renewcommand{\TUBAFarbeiten@doktyp}{\TUBAFarbeitengbelegname}}{%
	\ifthenelse{\equal{\TUBAFarbeiten@doktyp}{studarbeit}}{\renewcommand{\TUBAFarbeiten@doktyp}{\TUBAFarbeitenstudarbeitname}}{%
	\ifthenelse{\equal{\TUBAFarbeiten@doktyp}{semarbeit}}{\renewcommand{\TUBAFarbeiten@doktyp}{\TUBAFarbeitensemarbeitname}}{%
	\ifthenelse{\equal{\TUBAFarbeiten@doktyp}{larbeit}}{\renewcommand{\TUBAFarbeiten@doktyp}{\TUBAFarbeitenlarbeitname}}{%
	\ifthenelse{\equal{\TUBAFarbeiten@doktyp}{parbeit}}{\renewcommand{\TUBAFarbeiten@doktyp}{\TUBAFarbeitenparbeitname}}{%
	\ifthenelse{\equal{\TUBAFarbeiten@doktyp}{barbeit}}{\renewcommand{\TUBAFarbeiten@doktyp}{\TUBAFarbeitenbarbeitname}}{%
	\ifthenelse{\equal{\TUBAFarbeiten@doktyp}{marbeit}}{\renewcommand{\TUBAFarbeiten@doktyp}{\TUBAFarbeitenmarbeitname}}{%
	\ifthenelse{\equal{\TUBAFarbeiten@doktyp}{darbeit}}{\renewcommand{\TUBAFarbeiten@doktyp}{\TUBAFarbeitendarbeitname}}{%
	}}}}}}}}}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sprachanpassungen
\TUBAFSprachanpassung{arbeiten}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% float placement specifier
\renewcommand{\fps@figure}{htb}
\renewcommand{\fps@table}{htb}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% neue Befehle
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% l"angster Autor (zur Breitenbestimmung der parbox auf der Erklaerungsseite
\def\TUBAFlaengsterAutor#1{\def\insertTUBAFlaengsterAutor{#1}\ClassWarningNoLine{\TUBAFarbeiten@name}{Der Befehl 'TUBAFlaengsterAutor' ist veraltet.\MessageBreak Bitte nutzen Sie stattdessen\MessageBreak 'TUBAFLaengsterAutor' (grosses 'L'!)}}
%\TUBAFlaengsterAutor{\insertTUBAFAutor}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% l"angster Autor (zur Breitenbestimmung der parbox auf der Erklaerungsseite
\def\TUBAFLaengsterAutor#1{\def\insertTUBAFLaengsterAutor{#1}}
\TUBAFLaengsterAutor{\insertTUBAFAutor}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Betreuer (kommt aus TUBAFbausteinebefehle)
\renewcommand{\TUBAFBetreuername}{Betreuer/1. Korrektor:}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Korrektor
\def\TUBAFKorrektor#1{\def\insertTUBAFKorrektor{#1}}
\TUBAFKorrektor{}
\newcommand{\TUBAFKorrektorname}{2. Korrektor:}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kokorrektor
\def\TUBAFKokorrektor#1{\def\insertTUBAFKokorrektor{#1}}
\TUBAFKokorrektor{}
\newcommand{\TUBAFKokorrektorname}{3. Korrektor}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Datum (kommt aus TUBAFbausteinebefehle)
\TUBAFDatum{\today}
% Test auf leeres Datum
\AtBeginDocument{\ifthenelse{\equal{\insertTUBAFDatum}{}}{\TUBAFDatum{\today}}{}}
%\def\TUBAFDatumname{Datum:}
%
% f"ur Sprachanpassungen
\def\TUBAFDatumfs{\@dblarg\TUBAFarbeiten@Datumfs}
\long\def\TUBAFarbeiten@Datumfs[#1]#2{%
  \def\TUBAFarbeiten@temp{#2}%
  \ifx\TUBAFarbeiten@temp\@empty
    \def\insertTUBAFDatumfs{}
  \else
    \def\insertTUBAFDatumfs{#2}%
  \fi
 \def\insertshortTUBAFDatumfs{#1}}
\TUBAFDatumfs{\today}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Anmeldedatum
\def\TUBAFAnmeldedatum#1{\def\insertTUBAFAnmeldedatum{#1}}
\TUBAFAnmeldedatum{}
\newcommand{\TUBAFAnmeldedatumname}{Thema angemeldet am:}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% neue Befehle Ende
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% als Absicherung, damit keine Fehler auftreten
\def\and{}
\providecommand*{\next@tdpage}{\next@tpage\if@twoside \ifodd\value{page}\else\null\next@tpage\fi\fi}% aus scrbook.cls
%\providecommand*{\@dedication}{}%
%\providecommand{\dedication}[1]{\gdef\@dedication{#1}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% und hier die Redefinition der Titelseite
%
\AtBeginDocument{%
	\newlength{\TUBAFarbeiten@parboxmatrikel}% evtl. durch \TUBAFtmpdima ersetzen
	\settowidth{\TUBAFarbeiten@parboxmatrikel}{\large\mdseries88\,888}
	\newlength{\TUBAFarbeiten@parboxautortitel}% evtl. durch \TUBAFtmpdimb ersetzen
	\settowidth{\TUBAFarbeiten@parboxautortitel}{\bfseries\sffamily\Large\insertTUBAFLaengsterAutor}
}
%
%
\define@key{TUBAFmaketitle}{seitenzaehler}[1]{%
	\ifthenelse{\isinteger{#1}}{\renewcommand{\TUBAF@seitenzaehler}{#1}}{\PackageError{\TUBAFbausteine@name}{Der Wert '#1' der Option 'maketitle: seitenzaehler'\MessageBreak ist falsch und wird ignoriert}{Geben Sie eine ganze positive oder negative Zahl an}}
}
%
\define@key{TUBAFmaketitle}{intertext}{\renewcommand{\TUBAF@intertext}{#1}}
%
\renewcommand*{\maketitle}[1][]{%[seitenzaehler=1]{%
	\setkeys{TUBAFmaketitle}{#1}%
	\begin{titlepage}%
	\if\TUBAF@seitenzaehler\@empty\else\setcounter{page}{\TUBAF@seitenzaehler}\fi%
	\ifthenelse{\isundefined{\singlespace}}{}{\begin{singlespace}}%
	\ifthenelse{\equal{\TUBAF@hausschrift}{times}}{}{\sffamily}%
	%% Fußnotenumstellung aus scrbook.cls Anfang
      \let\footnotesize\small
      \let\footnoterule\relax
      \let\footnote\thanks
      \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
      \let\@oldmakefnmark\@makefnmark
      \renewcommand*{\@makefnmark}{\rlap\@oldmakefnmark}%
	%% Fußnotenumstellung aus scrbook.cls Ende
	%%% Extratitel aus scrbook Anfang
	\ifx\@extratitle\@empty \else%
		%\vspace*{0pt}\vfill% TB damit es wie org. aussieht
		%\noindent{\centering\@extratitle\par}% TB damit es wie org. aussieht
		\noindent\@extratitle\par%
		%\vskip \z@ \@plus3fill% TB damit es wie org. aussieht
		\next@tdpage
	\fi
	%%% Extratitel aus scrbook Ende
	%%% Kopfteil Anfang
	~\hfill%
	\ifthenelse{\equal{\TUBAFwbmtracht}{einfach}}{%
		\raisebox{\headheight-1cm}[0mm][-\headheight-1cm]{%
		\begin{minipage}[t]{75.1mm}% Werte aus Handbuch S. 39: Briefvorlage + .1mm Reserve
			\noindent\sffamily%
			\ifthenelse{\equal{\TUBAF@titelseite}{standard}}{%
				\ifthenelse{\equal{\TUBAF@wbm}{blau-grau}}{%
					\ifthenelse{\equal{\TUBAF@tikz}{true}}{\TUBAFwbm[scale=\TUBAFwbmscaleLXXV]}{}%
				   }{%
					\ifthenelse{\equal{\TUBAF@tikz}{true}}{\TUBAFwbm[scale=\TUBAFwbmscaleLXXV,fg=schwarz]}{}%
				}%
			   }{%
				\ifthenelse{\equal{\TUBAF@tikz}{true}}{\TUBAFwbm[scale=\TUBAFwbmscaleLXXV,fg=schwarz]}{}%
			}%
			\\[\TUBAFwbmSchutzzone]
			%%% Zweitlogo Anfang
			\ifx\TUBAFZweitlogonotscaled\@empty\else%
				\TUBAFscalecomp{TUBAFZweitlogo}{\TUBAFwbmscaleLXXV\TUBAFwbmBreitewbm}{\TUBAFwbmscaleLXXV\TUBAFwbmBreiteLogo}{\TUBAFZweitlogonotscaled}%
				\begingroup
				\settowidth{\TUBAFtmpdima}{\insertTUBAFZweitlogo}%
				\setlength{\TUBAFtmpdimb}{\TUBAFwbmscaleLXXV\TUBAFwbmBreiteNamen}%
				\ifthenelse{\lengthtest\TUBAFtmpdima>\TUBAFtmpdimb}{%
					\vspace{0pt}\hfill\insertTUBAFZweitlogo%
				   }{%
					\noindent\hspace*{\TUBAFwbmscaleLXXV\TUBAFwbmBreiteLogo}\hspace*{\TUBAFwbmscaleLXXV\TUBAFwbmSchutzzone}\hspace*{-1pt}\insertTUBAFZweitlogo%
				}
				\endgroup%
				\\[\TUBAFwbmSchutzzone]
			\fi%
			%%% Zweitlogo Ende
			%%% Institutsblock Anfang
			\ifthenelse{\equal{\insertTUBAFFakultaet}{}\AND\equal{\insertTUBAFInstitut}{}\AND\equal{\insertTUBAFLehrstuhl}{}}{}{%
			\TUBAFscalecomp{TUBAFinstitutsblock}{\TUBAFwbmscaleLXXV\TUBAFwbmBreiteNamen}{\TUBAFwbmscaleLXXV\TUBAFwbmBreiteLogo}{%
				\ifthenelse{\equal{\TUBAF@wbm}{schwarz}}{}{\color{TUBAFgrau\TUBAFgrauext}}%
				\noindent\begin{tabular}{@{}l@{}}%
					\ifthenelse{\equal{\insertTUBAFFakultaet}{}}{}{\insertTUBAFFakultaet\hfill~\tabularnewline}%
					\ifthenelse{\equal{\insertTUBAFInstitut}{}}{}{\insertTUBAFInstitut\hfill~\tabularnewline}%
					\ifthenelse{\equal{\insertTUBAFLehrstuhl}{}}{}{\insertTUBAFLehrstuhl\hfill~}%
				\end{tabular}%
			}%
			\noindent\hspace*{\TUBAFwbmscaleLXXV\TUBAFwbmBreiteLogo}\hspace*{\TUBAFwbmscaleLXXV\TUBAFwbmSchutzzone}\hspace*{-1pt}% hspace für exakte Positionierung
			\insertTUBAFinstitutsblock\\[\TUBAFwbmSchutzzone]%
			}%
			%%% Institutsblock Ende
			%%% Externes Logo Anfang
			\ifx\TUBAFExternlogonotscaled\@empty\else%
				\TUBAFscalecomp{TUBAFExternlogo}{\TUBAFwbmscaleLXXV\TUBAFwbmBreitewbm}{\TUBAFwbmscaleLXXV\TUBAFwbmBreiteLogo}{\TUBAFExternlogonotscaled}%
				\begingroup
				\settowidth{\TUBAFtmpdima}{\insertTUBAFExternlogo}%
				\setlength{\TUBAFtmpdimb}{\TUBAFwbmscaleLXXV\TUBAFwbmBreiteNamen}%
				\ifthenelse{\lengthtest\TUBAFtmpdima>\TUBAFtmpdimb}{%
					\vspace{0pt}\hfill\insertTUBAFExternlogo%
					\\[\TUBAFwbmSchutzzone]
				   }{%
					\noindent\hspace*{\TUBAFwbmscaleLXXV\TUBAFwbmBreiteLogo}\hspace*{\TUBAFwbmscaleLXXV\TUBAFwbmSchutzzone}\hspace*{-1pt}\insertTUBAFExternlogo%
					\\[\TUBAFwbmSchutzzone]
				}
				\endgroup
			\fi%
			%%% Externes Logo Ende
		\end{minipage}%
		}% raisebox Ende
	   }{% wbmtracht=250 Anfang
		\raisebox{\headheight-15.5mm}[0mm][-\headheight-15.5mm]{% in gv gemessen
		\begin{minipage}[t]{70.5mm}% Werte aus Briefpapiervorlage von Brita Gelius + .1mm Reserve
			\noindent\sffamily%
			\ifthenelse{\equal{\TUBAF@titelseite}{standard}}{%
				\ifthenelse{\equal{\TUBAF@wbm}{blau-grau}}{%
					\ifthenelse{\equal{\TUBAF@tikz}{true}}{\TUBAFwbm[scale=\TUBAFwbmCCLscaleLXXpV,tracht=250]}{}%
				   }{%
					\ifthenelse{\equal{\TUBAF@tikz}{true}}{\TUBAFwbm[scale=\TUBAFwbmCCLscaleLXXpV,fg=schwarz,tracht=250]}{}%
				}%
			   }{%
				\ifthenelse{\equal{\TUBAF@tikz}{true}}{\TUBAFwbm[scale=\TUBAFwbmCCLscaleLXXpV,fg=schwarz,tracht=250]}{}%
			}%
			\\[\TUBAFwbmCCLinnereSchutzzone]
			%%% Zweitlogo Anfang
			\ifx\TUBAFZweitlogonotscaled\@empty\else%
				\TUBAFscalecomp{TUBAFZweitlogo}{\TUBAFwbmCCLscaleLXXpV\TUBAFwbmCCLBreitewbm}{\TUBAFwbmCCLscaleLXXpV\TUBAFwbmCCLBreiteLogo}{\TUBAFZweitlogonotscaled}%
				\begingroup
				\settowidth{\TUBAFtmpdima}{\insertTUBAFZweitlogo}%
				\setlength{\TUBAFtmpdimb}{\TUBAFwbmCCLscaleLXXpV\TUBAFwbmBreiteNamen}
				\ifthenelse{\lengthtest\TUBAFtmpdima>\TUBAFtmpdimb}{%
					\vspace{0pt}\hfill\insertTUBAFZweitlogo%
					\\[\TUBAFwbmCCLinnereSchutzzone]
				   }{%
					\noindent\hspace*{\TUBAFwbmCCLscaleLXXpV\TUBAFwbmCCLBreiteLogo}\hspace*{\TUBAFwbmCCLscaleLXXpV\TUBAFwbmCCLinnereSchutzzone}\hspace*{-.5pt}\insertTUBAFZweitlogo%
					\\[\TUBAFwbmCCLinnereSchutzzone]
				}
				\endgroup
			\fi%
			%%% Zweitlogo Ende
			%%% Institutsblock Anfang
			\ifthenelse{\equal{\insertTUBAFFakultaet}{}\AND\equal{\insertTUBAFInstitut}{}\AND\equal{\insertTUBAFLehrstuhl}{}}{}{%
			\TUBAFscalecomp{TUBAFinstitutsblock}{\TUBAFwbmCCLscaleLXXpV\TUBAFwbmBreiteNamen}{\TUBAFwbmCCLscaleLXXpV\TUBAFwbmCCLBreiteLogo}{%
				\ifthenelse{\equal{\TUBAF@wbm}{schwarz}}{}{\color{TUBAFgrau\TUBAFgrauext}}%
				\noindent\begin{tabular}{@{}l@{}}
					\ifthenelse{\equal{\insertTUBAFFakultaet}{}}{}{\insertTUBAFFakultaet\tabularnewline}%
					\ifthenelse{\equal{\insertTUBAFInstitut}{}}{}{\insertTUBAFInstitut\tabularnewline}%
					\ifthenelse{\equal{\insertTUBAFLehrstuhl}{}}{}{\insertTUBAFLehrstuhl}%
				\end{tabular}%
			}%
			\noindent%
			\noindent\hspace*{\TUBAFwbmCCLscaleLXXpV\TUBAFwbmCCLBreiteLogo}\hspace*{\TUBAFwbmCCLscaleLXXpV\TUBAFwbmCCLinnereSchutzzone}\hspace*{-1pt}% hspace für exakte Positionierung
			\insertTUBAFinstitutsblock\\[\TUBAFwbmCCLinnereSchutzzone]%
			}%
			%%% Institutsblock Ende
			%%% Externes Logo Anfang
			\ifx\TUBAFExternlogonotscaled\@empty\else%
				\TUBAFscalecomp{TUBAFExternlogo}{\TUBAFwbmCCLscaleLXXpV\TUBAFwbmCCLBreitewbm}{\TUBAFwbmCCLscaleLXXpV\TUBAFwbmCCLBreiteLogo}{\TUBAFExternlogonotscaled}%
				\begingroup
				\settowidth{\TUBAFtmpdima}{\insertTUBAFExternlogo}%
				\setlength{\TUBAFtmpdimb}{\TUBAFwbmCCLscaleLXXpV\TUBAFwbmBreiteNamen}
				\ifthenelse{\lengthtest\TUBAFtmpdima>\TUBAFtmpdimb}{%
					\vspace{0pt}\hfill\insertTUBAFExternlogo%
					\\[\TUBAFwbmCCLinnereSchutzzone]
				   }{%
					\noindent\hspace*{\TUBAFwbmCCLscaleLXXpV\TUBAFwbmCCLBreiteLogo}\hspace*{\TUBAFwbmCCLscaleLXXpV\TUBAFwbmCCLinnereSchutzzone}\hspace*{-.5pt}\insertTUBAFExternlogo%
					\\[\TUBAFwbmCCLinnereSchutzzone]
				}
				\endgroup
			\fi%
			%%% Externes Logo Ende
		\end{minipage}%
		}% raisebox Ende
	}% Test auf wbmtracht Ende
	%%% Kopfteil Ende
	\newline
	%% vertikale Korrektur
	\ifthenelse{\isundefined{\insertTUBAFZweitlogo}}{}{\settoheight{\TUBAFtmpdima}{\insertTUBAFZweitlogo}\vspace*{\TUBAFtmpdima}}%
	\ifthenelse{\isundefined{\insertTUBAFinstitutsblock}}{}{\settoheight{\TUBAFtmpdima}{\insertTUBAFinstitutsblock}\vspace*{\TUBAFtmpdima}}%
	\ifthenelse{\isundefined{\insertTUBAFExternlogo}}{}{\settoheight{\TUBAFtmpdima}{\insertTUBAFExternlogo}\vspace*{\TUBAFtmpdima}}%
	% Kopfteil Ende
	\enlargethispage{13mm}%17.5mm}%
	\vspace*{3cm}%4cm}%
	\begin{center}%
		\noindent%
		\bfseries%
		\large\ifthenelse{\equal{\TUBAFarbeiten@doktyp}{}}{~\vspace*{2ex}}{\TUBAFarbeiten@doktyp}\\[3.5ex]
		\if\TUBAF@intertext\@empty\else\vskip-2ex\TUBAF@intertext\\[4.5ex]\fi% \ifthenelse liefert Fehler
		\huge\insertTUBAFTitel%
		\ifthenelse{\equal{\insertTUBAFUntertitel}{}}{\\[3.5ex]}{\\[1.5ex]\Large\insertTUBAFUntertitel\\[3.5ex]}
		\Large\parbox[t]{\TUBAFarbeiten@parboxautortitel}{\centering\insertTUBAFAutor}\\[2.5ex]
		\large\mdseries%
			\ifthenelse{\equal{\insertTUBAFStudiengang}{}}{\vskip-2.5ex}{\insertTUBAFStudiengang}
			\ifthenelse{\equal{\insertTUBAFVertiefung}{}}{}{%
				\ifthenelse{\equal{\insertTUBAFStudiengang}{}}{%
					\ClassError{\TUBAFarbeiten@name}{Studiengang angegeben!}{}}{}
				\linebreak\vspace*{.5pt}\TUBAFVertiefungname~\insertTUBAFVertiefung\\[1ex]}
		~\\[.5ex]
		\large\mdseries%
			\ifthenelse{\equal{\insertTUBAFMatrikel}{}}{%
				~\\[-1.5ex]%
			   }{%
				\TUBAFMatrikelname~\parbox[t]{\TUBAFarbeiten@parboxmatrikel}{\insertTUBAFMatrikel}\\[5.5ex]%
			}
		\large\mdseries%
		\ifthenelse{\boolean{TUBAF@german}}{\insertTUBAFDatum}{\insertTUBAFDatumfs}%
	\end{center}%
	\vspace*{0pt}\vfill
	\noindent%
	\ifthenelse{\equal{\TUBAFarbeiten@betreuerform}{liste}}{%
		\begin{minipage}[b]{.95\linewidth}%
			\ifthenelse{\equal{\insertTUBAFAnmeldedatum}{}}{}{%
				\vskip2.5ex
				\small\TUBAFAnmeldedatumname~\newline
				\normalsize\insertTUBAFAnmeldedatum\strut%
				\vskip2.5ex
			}%
			\ifthenelse{\equal{\insertTUBAFBetreuer}{}}{}{%
				\small\TUBAFBetreuername~\newline
				\normalsize\insertTUBAFBetreuer\strut%
				\ifthenelse{\equal{\insertTUBAFKorrektor}{}}{}{%
					\vskip2.5ex
					\ifthenelse{\equal{\TUBAFKorrektorname}{}}{}{\small\TUBAFKorrektorname~\newline}
					\normalsize\insertTUBAFKorrektor\strut%
					\ifthenelse{\equal{\insertTUBAFKokorrektor}{}}{}{%
						\vskip2.5ex
						\ifthenelse{\equal{\TUBAFKokorrektorname}{}}{}{\small\TUBAFKokorrektorname~\newline}
						\normalsize\insertTUBAFKokorrektor\strut%
					}
				}
			}
		\end{minipage}%
	   }{%
		\begin{tabular}[b]{@{}l@{~}p{10cm}@{}}%
			\ifthenelse{\equal{\insertTUBAFAnmeldedatum}{}}{}{%
				\small\TUBAFAnmeldedatumname&\normalsize\insertTUBAFAnmeldedatum\strut}%
			\ifthenelse{\equal{\insertTUBAFBetreuer}{}}{}{%
				\tabularnewline\small\TUBAFBetreuername&\normalsize\insertTUBAFBetreuer\strut%
				\ifthenelse{\equal{\insertTUBAFKorrektor}{}}{}{%
					\tabularnewline\small\TUBAFKorrektorname&\normalsize\insertTUBAFKorrektor\strut%
					\ifthenelse{\equal{\insertTUBAFKokorrektor}{}}{}{%
						\tabularnewline\small\TUBAFKokorrektorname&\normalsize\insertTUBAFKokorrektor\strut%
					}%
				}%
			}%
		\end{tabular}%
	}
	%%% Titelrückseitekopf/-fuß sowie Widmung aus scrbook.cls Anfang
      %\if@twoside
        \@tempswatrue
        %\expandafter\ifnum \@nameuse{scr@v@3.12}>\scr@compatibility\relax
        %\else
          \ifx\@uppertitleback\@empty\ifx\@lowertitleback\@empty
            \@tempswafalse
          \fi\fi
        %\fi
        \if@tempswa
          \next@tpage
 		\noindent%
         \begin{minipage}[t]{\textwidth}
            \@uppertitleback
          \end{minipage}\par
          \vfill
 		\noindent%
         \begin{minipage}[b]{\textwidth}
            \@lowertitleback
          \end{minipage}\par
          \@thanks\let\@thanks\@empty
        \fi
      %\fi
      \ifx\@dedication\@empty
      \else
        \next@tdpage\null\vfill
        {\centering{\@dedication \par}}
        \vskip \z@ \@plus3fill
        \@thanks\let\@thanks\@empty
	  \cleardoubleoddpage
      \fi
	%%% Titelrückseitekopf/-fuß sowie Widmung aus scrbook.cls Ende
	\ifthenelse{\isundefined{\singlespace}}{}{\end{singlespace}}%
	%%% Rückstellung von Befehlen Anfang
	\let\thanks\relax
	\global\let\@thanks\@empty
	\setcounter{footnote}{0}
	%%% Rückstellung von Befehlen Ende
	\end{titlepage}%
	\if@twoside\cleardoubleoddpage\else\clearpage\fi%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Selbständigkeitserklärung
%
\def\TUBAFarbeitenerklaerungtitel{Eidesstattliche Erkl\"arung}
\edef\TUBAFarbeitenerklaerungtext{%
	Ich versichere, dass ich diese Arbeit selbst\"andig verfasst und keine anderen
	Hilfsmittel als die angegebenen benutzt habe. Die Stellen der Arbeit, die
	anderen Werken dem Wortlaut oder dem Sinn nach entnommen sind, habe
	ich in jedem einzelnen Fall unter Angabe der Quelle als Entlehnung kenntlich
	gemacht. Diese Versicherung bezieht sich auch auf die bildlichen
	Darstellungen.%
}
%
\AtBeginDocument{% sonst falsche Auswertung
\newlength{\TUBAFarbeiten@parboxerklaerungbreite}
\settowidth{\TUBAFarbeiten@parboxerklaerungbreite}{\insertTUBAFLaengsterAutor}
\newcommand{\TUBAFarbeitenerklaerungsseiteinhalt}{%
	\begin{titlepage}
		\section*{\TUBAFarbeitenerklaerungtitel}
		\parbox{\linewidth}{\TUBAFarbeitenerklaerungtext}\hspace*{-12pt}% sonst overfull hbox 10.8...
		\vskip3.33cm
		\noindent%
		\ifthenelse{\boolean{TUBAF@german}}{\insertTUBAFDatum}{\insertTUBAFDatumfs}
		\hfill\parbox[t]{\TUBAFarbeiten@parboxerklaerungbreite}{\insertTUBAFAutor}
	\end{titlepage}
}}
%
\newcommand{\TUBAFErklaerungsseite}{%
	\ifthenelse{\boolean{TUBAF@german}}{%
		\TUBAFarbeitenerklaerungsseiteinhalt%
	   }{%
		\begin{otherlanguage}{ngerman}%
			\setboolean{TUBAF@german}{true}%
			\TUBAFarbeitenerklaerungsseiteinhalt%
		\end{otherlanguage}
		\TUBAFarbeitenerklaerungsseiteinhalt%
	}%
	\if@twoside\cleardoubleoddpage\else\clearpage\fi%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Seitenstile Anfang
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Seitenstile: Festlegung, welche Gliederungsebene wo erscheint
\if@twoside
	\ifthenelse{\boolean{TUBAFarbeiten@kapitel}}{%
		\automark[section]{chapter}% linke/rechte Seite
	   }{%
		\automark[subsection]{section}% linke/rechte Seite
	}
   \else
	\ifthenelse{\boolean{TUBAFarbeiten@kapitel}}{%
		\automark{chapter}% alle Seiten
	   }{%
		\automark{section}% alle Seiten
	}
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Seitenstile: Liniendicke definieren
\providecommand{\TUBAFliniendicke}{}
%
\AtBeginDocument{%sonst keine Linie bei hausschrift
	\ifthenelse{\isundefined{\TUBAFhausschrift@strichstaerke}}{%
		\renewcommand{\TUBAFliniendicke}{0.08ex}%
	   }{%
		\renewcommand{\TUBAFliniendicke}{.66\TUBAFhausschrift@strichstaerke}%
	}%
}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Seitenstile: Definition neuer Seitenstile Anfang
%
\AtBeginDocument{% sonst stimmt \linewidth nicht, später prüfen, ob bessere Variante mgl.
\newpairofpagestyles% kommt von scrlayer-scrpage
	[]% keine Vererbung
	{TUBAFarbeiten}% Name; \(this)pagestyle{plain|Name}
	{%
		\KOMAoption{headtopline}{0pt:\linewidth}
		\ihead[]{\headmark}
		\chead*{}
		\ohead*{\pagemark}
		\KOMAoption{headsepline}{\TUBAFliniendicke:\linewidth}
		\KOMAoption{plainheadsepline}{true}
		\KOMAoption{footsepline}{\TUBAFliniendicke:\linewidth}
		\KOMAoption{plainfootsepline}{true}
		\ifoot*{\insertshortTUBAFAutor:~\insertshortTUBAFTitel}%
		\cfoot*{}
		\ofoot*{}
		\KOMAoption{footbotline}{0pt:\linewidth}
	}
\pagestyle{TUBAFarbeiten}% zur Aktivierung, Setzen fürs Dokument später
%
\newpairofpagestyles% kommt von scrlayer-scrpage
	[TUBAFarbeiten]% keine Vererbung
	{TUBAFarbeitenLeereFusszeile}% Name; \(this)pagestyle{plain|Name}
	{%
		\ifoot*{}%
	}
%
\pagestyle{TUBAFarbeitenLeereFusszeile}% zur Aktivierung, Setzen fürs Dokument später
%
\newpairofpagestyles% kommt von scrlayer-scrpage
	[TUBAFarbeitenLeereFusszeile]% keine Vererbung
	{TUBAFarbeitenKomplettLeereFusszeile}% Name; \(this)pagestyle{plain|Name}
	{%
		\KOMAoption{footsepline}{false}
		\KOMAoption{plainfootsepline}{false}
	}
%
\pagestyle{TUBAFarbeitenKomplettLeereFusszeile}% zur Aktivierung, Setzen fürs Dokument später
%
% Seitenstile: Definition neuer Seitenstile Ende
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Seitenstil anwenden
\pagestyle{TUBAFarbeiten}
%
% Seitenstile Ende
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Schriftanpassungen
\TUBAFSchriftanpassungenKoma
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Numerierungen setzen
\AtBeginDocument{% sonst Probleme mit hyperref
	\ifthenelse{\equal{\TUBAFarbeiten@nummern}{fortlaufend}}{%
		\ifthenelse{\boolean{TUBAFarbeiten@kapitel}}{%
			% report fortlaufend, nicht zur"ucksetzen
			\renewcommand{\theequation}{\arabic{equation}}%
			\renewcommand{\thefigure}{\arabic{figure}}%
			\renewcommand{\thetable}{\arabic{table}}%
			\@removefromreset{equation}{chapter}%
			\@removefromreset{figure}{chapter}%
			\@removefromreset{table}{chapter}%
			\@removefromreset{footnote}{chapter}%
		   }{%
			% article fortlaufend, nichts "andern
		}%
	   }{% nicht fortlaufend
		\ifthenelse{\boolean{TUBAFarbeiten@kapitel}}{%
			% report, je chapter, nichts "andern
		   }{%
			% article, je section
			\renewcommand{\theequation}{\thesection.\arabic{equation}}%
			\renewcommand{\thefigure}{\thesection.\arabic{figure}}%
			\renewcommand{\thetable}{\thesection.\arabic{table}}%
			\@addtoreset{equation}{section}%
			\@addtoreset{figure}{section}%
			\@addtoreset{table}{section}%
			\@addtoreset{footnote}{section}%
		}%
	}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Befehle nur in der Präambel erlauben
\@onlypreamble{\TUBAFFakultaet}
\@onlypreamble{\TUBAFInstitut}
\@onlypreamble{\TUBAFLehrstuhl}
\@onlypreamble{\TUBAFTitel}
\@onlypreamble{\TUBAFAutor}
\@onlypreamble{\TUBAFLaengsterAutor}
\@onlypreamble{\TUBAFBetreuer}
\@onlypreamble{\TUBAFKorrektor}
\@onlypreamble{\TUBAFKokorrektor}
\@onlypreamble{\TUBAFStudiengang}
\@onlypreamble{\TUBAFVertiefung}
\@onlypreamble{\TUBAFMatrikel}
\@onlypreamble{\TUBAFDatum}
\@onlypreamble{\TUBAFDatumfs}
\@onlypreamble{\TUBAFAnmeldedatum}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% aus Kompatibilitätsgründen
\ifx\@author\@empty\else\TUBAFAutor{\@author}\fi
\ifx\@title\@empty\else\TUBAFTitel{\@title}\fi
\ifx\@subtitle\@empty\else\TUBAFUntertitel{\@title}\fi
\ifx\@date\@empty\else\TUBAFDatum{\@date}\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\endinput
