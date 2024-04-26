%

\NeedsTeXFormat{LaTeX2e}[2023-11-01]
\ProvidesClass{utfpr}[2024-04-01 UTFPR Class]
\LoadClass[a4paper,12pt,oneside]{memoir}[2024-01-26]

%-----------------------------------------------------------------
% CARREGA PACOTES E MODIFICA A CLASSE MEMOIR
%-----------------------------------------------------------------

\RequirePackage[english,brazil]{babel}	% texto multilingual
\RequirePackage{lmodern}								% fonte Latin Modern Roman
\RequirePackage[T1]{fontenc}						% permite a hifenização de palavras acentuadas
\RequirePackage{microtype}							% melhora a quebra de linhas
\RequirePackage{graphicx}								% inclusão de figuras
\RequirePackage{csquotes}								% recomendado pelo 'biblatex'
\RequirePackage{longtable}							% tabelas longas, exigido pelo 'acro'
\RequirePackage{acro}										% acrônimos e siglas
\RequirePackage{xcolor}									% suprime warning to 'hyperref'
\RequirePackage[a-1b]{pdfx}							% produz PDF/A

%---
% Alterando \em e \emph{} (itálico já é usado em matemática e estrangeirismos): ênfase com \sl
\DeclareRobustCommand{\em}%
{\@nomath\em \ifdim \fontdimen\@ne\font >\z@ \upshape \else \slshape \fi}
%---

%---
% Ajustes extras no babel-portuges (brazil)
\addto\captionsbrazil{%
	\renewcommand{\listfigurename}{Lista de figuras}
	\renewcommand{\listtablename}{Lista de tabelas}
}
%---

%---
% Configurando o microtype
\DeclareMicrotypeSet{lmodern}{%
	encoding={T1},
	family={rm*},
	series={md*,it*,bf*,sl*},
	size={normalsize,footnotesize}
}
\UseMicrotypeSet[protrusion]{lmodern}
%---

%---
% Configurando o acro (5.6 NBR 14724:2011)
\acsetup{%
	list/template = longtable,
	templates/colspec = {@{}>{}lp{.8\linewidth}@{}},
	list/heading = chapter*,
	list/name = Lista de abreviaturas e siglas
}
%---

%---
% Configurando o hyperref
\hypersetup{%
	breaklinks = true,%
	hidelinks%
}
%---

%-----------------------------------------------------------------
% OPÇÕES DA CLASSE UTFPR
%-----------------------------------------------------------------

%---
% Opções de licença Creative Commons
\DeclareOption{by}{%
	\newcommand\cc{\includegraphics[scale=0.8]{./preambulo/cc/by}}%
	\newcommand\cclink{https://creativecommons.org/licenses/by/4.0/deed.pt_BR}%
	\newcommand\cctext{Esta licença permite compartilhamento, remixe, adaptação e criação a partir do trabalho, mesmo para fins comerciais, desde que sejam atribuídos créditos ao(s) autor(es). Conteúdos elaborados por terceiros, citados e referenciados nesta obra não são cobertos pela licença.}%
}
\DeclareOption{by-sa}{%
	\newcommand\cc{\includegraphics[scale=0.8]{./preambulo/cc/by-sa}}%
	\newcommand\cclink{https://creativecommons.org/licenses/by-sa/4.0/deed.pt_BR}%
	\newcommand\cctext{Esta licença permite remixe, adaptação e criação a partir do trabalho, mesmo para fins comerciais, desde que sejam atribuídos créditos ao(s) autor(es) e que licenciem as novas criações sob termos idênticos. Conteúdos elaborados por terceiros, citados e referenciados nesta obra não são cobertos pela licença.}%
}
\DeclareOption{by-nd}{%
	\newcommand\cc{\includegraphics[scale=0.8]{./preambulo/cc/by-nd}}%
	\newcommand\cclink{https://creativecommons.org/licenses/by-nd/4.0/deed.pt_BR}%
	\newcommand\cctext{Esta licença permite compartilhamento do trabalho, mesmo para fins comerciais, sem a possibilidade de alterá-lo, desde que sejam atribuídos créditos ao(s) autor(es). Conteúdos elaborados por terceiros, citados e referenciados nesta obra não são cobertos pela licença.}%
}
\DeclareOption{by-nc}{%
	\newcommand\cc{\includegraphics[scale=0.8]{./preambulo/cc/by-nc}}%
	\newcommand\cclink{https://creativecommons.org/licenses/by-nc/4.0/deed.pt_BR}%
	\newcommand\cctext{Esta licença permite remixe, adaptação e criação a partir do trabalho, para fins não comerciais, desde que sejam atribuídos créditos ao(s) autor(es). Conteúdos elaborados por terceiros, citados e referenciados nesta obra não são cobertos pela licença.}%
}
\DeclareOption{by-nc-sa}{%
	\newcommand\cc{\includegraphics[scale=0.8]{./preambulo/cc/by-nc-sa}}%
	\newcommand\cclink{https://creativecommons.org/licenses/by-nc-sa/4.0/deed.pt_BR}%
	\newcommand\cctext{Esta licença permite remixe, adaptação e criação a partir do trabalho, para fins não comerciais, desde que sejam atribuídos créditos ao(s) autor(es) e que licenciem as novas criações sob termos idênticos. Conteúdos elaborados por terceiros, citados e referenciados nesta obra não são cobertos pela licença.}%
}
\DeclareOption{by-nc-nd}{%
	\newcommand\cc{\includegraphics[scale=0.8]{./preambulo/cc/by-nc-nd}}%
	\newcommand\cclink{https://creativecommons.org/licenses/by-nc-nd/4.0/deed.pt_BR}%
	\newcommand\cctext{Esta licença permite download e compartilhamento do trabalho desde que sejam atribuídos créditos ao(s) autor(es), sem a possibilidade de alterá-lo ou utilizá-lo para fins comerciais. Conteúdos elaborados por terceiros, citados e referenciados nesta obra não são cobertos pela licença.}%
}
%---
% Citações e Referências (5.5 NBR 14724:2011 + NBR 6023:2018)
\DeclareOption{alf}{\PassOptionsToPackage{style=abnt}{biblatex}}
\DeclareOption{num}{\PassOptionsToPackage{style=abnt-numeric}{biblatex}}
\ProcessOptions\relax
\RequirePackage{biblatex}					%
%---

%-----------------------------------------------------------------
%	COMANDOS PARA OS AUTORES
%-----------------------------------------------------------------

% Ajusta fonte e hifenização para textos em inglês
\NewDocumentCommand{\eng}{m}{\textit{\foreignlanguage{english}{#1}}}
% Ajusta fonte e hifenização para textos em latim
\NewDocumentCommand{\lat}{m}{\textit{#1}}
%\DeclareLanguageMapping{latin}{brazil}	% bug do 'biblatex'

%-----------------------------------------------------------------
% MODIFICAÇÕES GERAIS DE DIAGRAMAÇÃO
%-----------------------------------------------------------------

% ---
% Margens (5.1 NBR 14724:2011)
\setlrmarginsandblock{3cm}{2cm}{*}
\setulmarginsandblock{3cm}{2cm}{*}
\checkandfixthelayout
% ---

%---
% Fonte reduzida uniforme (5.1 NBR 14724:2011)
\newcommand{\smallfont}{\footnotesize}
%---

% ---
% Espaçamento (5.2 NBR 14724:2011)
\OnehalfSpacing
% ---

% ---
% Notas de rodapé (5.2.1 NBR 14724:2011)
\renewcommand{\foottextfont}{\smallfont}
\setlength{\footmarkwidth}{1.2em}
\setlength{\footmarksep}{0em}
\footmarkstyle{\smallfont{\textsuperscript{#1}}\hfill}
\renewcommand*{\footnoterule}{\hrule width 5cm\vspace{\onelineskip}}
\setfootins{\onelineskip}{\onelineskip}
% ---

%---
% Indicativos de seção (5.2.2 NBR 14724:2011)
\setsecnumdepth{subsubsection}
\newcommand{\chapterfont}{\sffamily\Huge}
\makechapterstyle{utfpr}{%
	\renewcommand{\chapnumfont}{\chapterfont}%
	\renewcommand{\chaptitlefont}{\chapterfont}%
	\renewcommand{\chapterheadstart}{}%
	\renewcommand{\printchaptername}{}%
	\renewcommand{\chapternamenum}{}%
	\renewcommand{\afterchapternum}{\quad}%
	\renewcommand{\afterchapskip}{\onelineskip}
}
\makechapterstyle{utfprprepos}{%
	\renewcommand{\chapnumfont}{}%
	\renewcommand{\chaptitlefont}{\centering\chapterfont}%
	\renewcommand{\chapterheadstart}{}%
	\renewcommand{\printchaptername}{}%
	\renewcommand{\chapternamenum}{}%
	\renewcommand{\afterchapternum}{}%
	\renewcommand{\afterchapskip}{\onelineskip}
}
\makechapterstyle{utfprapp}{%
	\renewcommand{\chapnumfont}{\chapterfont}%
	\renewcommand{\chaptitlefont}{\centering\chapterfont}%
	\renewcommand{\chapterheadstart}{}%
	\renewcommand{\printchaptername}{\chapterfont\appendixname}%
	\renewcommand{\chapternamenum}{~}%
	\renewcommand{\afterchapternum}{~---~}%
	\renewcommand{\afterchapskip}{\onelineskip}
}
\AddToHook{cmd/frontmatter/after}{\chapterstyle{utfprprepos}}
\AddToHook{cmd/mainmatter/after}{\chapterstyle{utfpr}}
\AddToHook{cmd/backmatter/after}{%
	\cftinserthook{toc}{B}%
	\chapterstyle{utfprprepos}%
}
\AddToHook{env/appendices/begin}{%
	\chapterstyle{utfprapp}%
	\cftinserthook{toc}{Ap}%
}
\AddToHook{cmd/appendix/after}{%
	\renewcommand{\appendixname}{\enclname}%
	\chapterstyle{utfprapp}%
	\cftinserthook{toc}{At}%
}
\setsecheadstyle{\sffamily\Large}
\setsubsecheadstyle{\sffamily\large}
\setsubsubsecheadstyle{\sffamily\normalsize}
%---

%---
% Paginação (5.3 NBR 14724:2011)
\makepagestyle{utfpr}
\makeevenhead{utfpr}{}{}{\smallfont\thepage}
\makeoddhead{utfpr}{}{}{\smallfont\thepage}
\makeevenfoot{utfpr}{}{}{}
\makeoddfoot{utfpr}{}{}{}
\copypagestyle{chapter}{utfpr}
\renewcommand\frontmatter{%
	\clearpage%
	\pagenumbering{arabic}%
	\pagestyle{empty}%
}
\renewcommand\mainmatter{%
	\pagestyle{utfpr}%
}
\renewcommand\backmatter{%
	\pagestyle{utfpr}%
}
%---

%---
% Figuras e tabelas (5.8 e 5.9 NBR 15724:2011)
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\setfloatadjustment{figure}{\centering}
\setfloatadjustment{table}{\smallfont\centering}
\setfloatlocations{figure}{htbp}
\setfloatlocations{table}{htbp}
\captionnamefont{\smallfont}
\captiontitlefont{\smallfont}
\captiondelim{~---~}
\hangcaption
%---

%---
% Resumo e Abstract (4.2.1.7 e 4.2.1.8 NBR 14724:2011 + NBR 6028:2021)
\renewcommand{\abstractnamefont}{\chapterfont}
\renewcommand{\abstracttextfont}{\normalfont\normalsize}
\AtBeginDocument{%
	\setlength{\absparindent}{0pt}%
	\setlength\absleftindent{0cm}%
	\setlength\absrightindent{0cm}%
}
\newcommand{\printabstract}{%
	\begin{abstract}
		\input{./pretextual/resumo}
	\end{abstract}
	\clearpage
}
\newcommand{\printengabstract}{%
	\begin{otherlanguage}{english}
		\begin{abstract}
			\input{./pretextual/abstract}
		\end{abstract}
	\end{otherlanguage}
	\clearpage
}
%---

%---
% Lista de figuras (4.2.1.9 NBR 14724:2011)
\newcommand{\printlof}{%
	\listoffigures*%
	\thispagestyle{empty}%
	\clearpage%
}
%---

%---
% Lista de tabelas (4.2.1.10 NBR 14724:2011)
\newcommand{\printlot}{%
	\listoftables*%
	\thispagestyle{empty}%
	\clearpage%
}
%---

%---
% Lista de abreviaturas e siglas (4.2.1.11 NBR 14724:2011)
\newcommand{\printloa}{%
	\setlength\LTleft{0pt}
	\printacronyms%
	\thispagestyle{empty}%
	\clearpage%
}
%---

%---
% Sumário (4.2.1.13 NBR 14724:2011 + NBR 6027:2012)
\settocdepth{subsubsection}
\setlength{\cftparskip}{6pt}
\renewcommand{\cftchapterfont}{\sffamily\bfseries\large\MakeTextUppercase} 
\renewcommand{\cftchapterpagefont}{\sffamily\bfseries} 
\cftsetindents{chapter}{0em}{4em}
\renewcommand{\cftsectionfont}{\sffamily\bfseries\large} 
\renewcommand{\cftsectionpagefont}{\sffamily}
\cftsetindents{section}{0em}{4em}
\renewcommand{\cftsubsectionfont}{\sffamily\large} 
\renewcommand{\cftsubsectionpagefont}{\sffamily} 
\cftsetindents{subsection}{0em}{4em}
\renewcommand{\cftsubsubsectionfont}{\sffamily}
\renewcommand{\cftsubsubsectionpagefont}{\sffamily}
\cftsetindents{subsubsection}{0em}{4em}
\cftinsertcode{B}{\setlength{\cftchapterindent}{4em}}
\cftinsertcode{Ap}{%
	\renewcommand*{\cftappendixname}{\appendixname~}%
	\renewcommand*{\cftchapteraftersnum}{\hfil---}%
	\renewcommand*{\cftchapteraftersnumb}{}%
}
\cftinsertcode{At}{%
	\renewcommand*{\cftappendixname}{\enclname~}%
}
\newcommand{\printtoc}{%
	\tableofcontents*%
	\thispagestyle{empty}%
}
%---

%-----------------------------------------------------------------
% PROVÊ COMANDOS INTERNOS PARA A CLASSE UTFPR
%-----------------------------------------------------------------

%---
% Comando para título em inglês
\DeclareRobustCommand*{\engtitle}[1]{\gdef\@engtitle{%
	\foreignlanguage{english}{#1}}}
\addtoiargdef{\engtitle}{\protected@xdef\theengtitle{#1}}
%---

%---
% Comando para orientador
\DeclareRobustCommand*{\advisor}[1]{\gdef\@advisor{#1}}
\addtoiargdef{\advisor}{\protected@xdef\theadvisor{#1}}
%---

%---
% Comando para co-orientador
\DeclareRobustCommand*{\coadvisor}[1]{\gdef\@coadvisor{#1}}
\addtoiargdef{\coadvisor}{\protected@xdef\thecoadvisor{#1}}
%---

%---
% Comando para data de aprovação
\DeclareRobustCommand*{\approvaldate}[1]{\gdef\@approvaldate{#1}}
\addtoiargdef{\approvaldate}{\protected@xdef\theapprovaldate{#1}}
%---

%---
%Comandos para a banca
\newcommand{\boardst}[1]{\def\printboardst{#1}}
\newcommand{\boardnd}[1]{\def\printboardnd{#1}}
\newcommand{\boardrd}[1]{\def\printboardrd{#1}}
%---

%-----------------------------------------------------------------
% CAPA (4.1.1 NBR 14724:2011) + UTFPR
%-----------------------------------------------------------------

\RenewDocumentCommand{\maketitle}{}{%
	\begin{center}\sffamily\bfseries\large%
		\MakeTextUppercase{Universidade Tecnológica Federal do Paraná}%
		\vfill%
		\MakeTextUppercase{\theauthor}%
		\vfill%
		\MakeTextUppercase{\thetitle}
		\vfill%
		\MakeTextUppercase{Campo Mourão}%
		\par%
		\thedate%
	\end{center}%
	\setcounter{page}{0}%
	\thispagestyle{empty}%
}

%-----------------------------------------------------------------
% FOLHA DE ROSTO (4.2.1.1 NBR 14724:2011) + UTFPR
%-----------------------------------------------------------------

\NewDocumentCommand{\maketitlepage}{}{%
	\begin{center}\sffamily\bfseries\large%
		\MakeTextUppercase{\theauthor}%
		\vfill\vfill%
		\MakeTextUppercase{\thetitle}%
		\vfill%
		\theengtitle%
		\vfill%
		\hfill\begin{minipage}{0.5\textwidth}%
			\begin{SingleSpace}\mdseries\normalsize%
				Trabalho de Conclusão de Curso de Graduação apresentado como requisito para obtenção do título de Bacharel em Engenharia Eletrônica do Curso de Bacharelado em Engenharia Eletrônica da Universidade Tecnológica Federal do Paraná.%
				\par\vspace{6pt}
				Orientador:~\theadvisor%
				\ifundef{\thecoadvisor}{}{%
					\par\vspace{6pt}%
					Co-orientador:~\thecoadvisor%
				}%
			\end{SingleSpace}
		\end{minipage}%
		\vfill\vfill%
		\MakeTextUppercase{Campo Mourão}%
		\par%
		\thedate%
		\vfill%
		\begin{tabular}[c]{@{}c@{\,\,\,}l@{}}%
			\begin{tabular}{@{}c@{}}%
				\raisebox{-21pt}{\cc}\\%
				\href{\cclink}{\mdseries\normalsize4.0 Internacional}\\%
			\end{tabular} &%
			\parbox{0.8\textwidth}{%
				\begin{SingleSpace}%
					\mdseries\normalsize\cctext%
				\end{SingleSpace}%
			}\\%
		\end{tabular}%
	\end{center}%
	\clearpage%
}

%-----------------------------------------------------------------
% FOLHA DE APROVAÇÃO (4.2.1.3 NBR 14724:2011) + UTFPR
%-----------------------------------------------------------------

\NewDocumentCommand{\approval}{}{%
	\begin{center}\sffamily\bfseries\large%
		\MakeTextUppercase{\theauthor}%
		\vfill%
		\MakeTextUppercase{\thetitle}
		\vfill%
		\hfill\begin{minipage}{0.5\textwidth}%
			\begin{SingleSpace}%
				\mdseries\normalsize%
				Trabalho de Conclusão de Curso de Graduação apresentado como requisito para obtenção do título de Bacharel em Engenharia Eletrônica do Curso de Bacharelado em Engenharia Eletrônica da Universidade Tecnológica Federal do Paraná.%
			\end{SingleSpace}%
		\end{minipage}%
		\vfill%
		{\mdseries\large Data de aprovação:~\theapprovaldate}%
		\vfill%
		\begin{minipage}{0.75\textwidth}%
			\begin{SingleSpace}%
				\mdseries\normalsize\centering%
				\rule{\textwidth}{1pt}\\%
				\printboardst\\%
				\vspace{1.5cm}%
				\rule{\textwidth}{1pt}\\%
				\printboardnd\\%
				\vspace{1.5cm}%
				\rule{\textwidth}{1pt}\\%
				\printboardrd\\%
			\end{SingleSpace}%
		\end{minipage}%
		\vfill%
		\MakeTextUppercase{Campo Mourão}%
		\par%
		\thedate%
	\end{center}%
	\clearpage%
}

%-----------------------------------------------------------------
% DEDICATÓRIA (4.2.1.4 NBR 14724:2011)
%-----------------------------------------------------------------

\NewDocumentCommand{\dedication}{}{%
	\thispagestyle{empty}
	\vspace*{\fill}
	\begin{center}
		\noindent\em%
		\input{./pretextual/dedicatoria}
	\end{center}
	\vspace*{\fill}
	\clearpage%
}

%-----------------------------------------------------------------
% AGRADECIMENTOS (4.2.1.5 NBR 14724:2011)
%-----------------------------------------------------------------

\NewDocumentCommand{\acknowledgment}{}{%
	\chapter*{Agradecimentos}
	\thispagestyle{empty}
	\indent%
	\input{./pretextual/agradecimentos}
	\clearpage%
}

%-----------------------------------------------------------------
% EPÍGRAFE (4.2.1.6:NBR 14724:2011)
%-----------------------------------------------------------------

\NewDocumentCommand{\printepigraph}{}{%
	\thispagestyle{empty}
	\setlength{\epigraphrule}{0pt}
	\epigraphtextposition{flushright}
	\epigraphfontsize{\smallfont\em}
	\vspace*{\fill}
	\begin{epigraphs}
		\input{./pretextual/epigrafe}
	\end{epigraphs}
	\clearpage%
}

