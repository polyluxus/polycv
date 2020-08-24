%%
%% This is file `polycv.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% polycv.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2020 by Martin C Schwarzer <polyluxus@gmail.com>
%% ---------------------------------------------------------------------------
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Martin C Schwarzer.
%% 
%% This work consists of the files polycv.dtx and polycv.ins
%% and the derived filebase polycv.cls.
%% 
%% The code is available at <https://github.com/polyluxus/polycv>.
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{polycv}
    [2020/08/24 v1.1.dev Curriculum Vitae Class]
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=polycv,
  prefix=polycv@
}
\DeclareStringOption[1.0cm]{margins}
\DeclareStringOption[3.0cm]{headerheight}
\DeclareStringOption[0.5cm]{footerheight}
\DeclareStringOption[5.0cm]{sidebarwidth}
\DeclareStringOption[2.7cm]{hintcol}
\DeclareStringOption[0.2cm]{hintcolsep}
\DeclareStringOption[1.6cm]{sidebarhint}
\DeclareStringOption[0.2cm]{sidebarindent}
\DeclareStringOption[0.8cm]{iconspace}
\DeclareStringOption[1.5ex]{progbarheight}
\DeclareStringOption[0.2mm]{progbarlinewidth}
\DeclareStringOption[5]{progbarunits}
\DeclareStringOption[blue]{primary}
\DeclareStringOption[white]{secondary}
\DeclareStringOption[orange]{highlight}
\DeclareStringOption[black]{shade}
\DeclareStringOption[10]{mixing}
\DeclareBoolOption{draft}
\DeclareComplementaryOption{final}{draft}
\DeclareBoolOption{biblatex}
\DeclareStringOption[dvipsnames]{xcolor}
\DeclareBoolOption{signcv}
\DeclareStringOption[1em]{letterindent}
\DeclareVoidOption{twocolumn}{%
  \ClassError{polycv}{%
    Option 'twocolumn' is incompatible because of the special page setup.}}
\DeclareVoidOption{titlepage}{%
  \ClassWarning{polycv}{%
    Option 'titlepage' is incompatible because of the special page setup.}}
\DeclareDefaultOption{%
  \PassOptionsToClass{\CurrentOptionKey}{article}}
\ProcessKeyvalOptions{polycv}
\LoadClass{article}
\RequirePackage{etoolbox}
\RequirePackage{calc}
  \RequirePackage{xstring}
\RequirePackage{hyperref}
\PassOptionsToPackage{\polycv@xcolor,hyperref}{xcolor}
\RequirePackage{xcolor}
\RequirePackage{tikz}
\RequirePackage{graphicx}
\RequirePackage[indent=0pt]{parskip}
\RequirePackage{geometry}
\RequirePackage{fontawesome}
\RequirePackage{pdfpages}
  \AtEndPreamble{%
    \ifpolycv@signcv%
      \ClassInfo{polycv}{%
        Option 'signcv' enabled; CV will be signed.}%
    \fi
    }%
\pagestyle{empty}
\newcommand*{\setcolprimary}[1]{%
  \renewcommand*{\polycv@primary}{#1}}
\newcommand*{\setcolsecondary}[1]%
  {\renewcommand*{\polycv@secondary}{#1}}
\newcommand*{\setcolhighlight}[1]%
  {\renewcommand*{\polycv@highlight}{#1}}
\newcommand*{\setcolshade}[1]%
  {\renewcommand*{\polycv@shade}{#1}}
\@onlypreamble\setcolprimary
\@onlypreamble\setcolsecondary
\@onlypreamble\setcolhighlight
\@onlypreamble\setcolshade
\AtEndPreamble{%
  \colorlet{polycvpagecolor}{\polycv@secondary}
  \colorlet{polycvheaderbackground}{\polycv@primary}
  \colorlet{polycvheadertext}{\polycv@secondary}
  \colorlet{polycvsectioncolor}{\polycv@primary}
  \colorlet{polycvtextcolor}{%
    \polycv@primary!\polycv@mixing!\polycv@shade}
  \colorlet{polycvhighlight}{\polycv@highlight}
  \colorlet{polycvsidebarbackground}{\polycv@secondary}
  \colorlet{polycvprogbarfilled}{\polycv@primary}
  \colorlet{polycvprogbarnofill}{%
    \polycv@primary!10!\polycv@secondary}
}
\AfterPreamble{%
  \color{polycvtextcolor}\pagecolor{polycvpagecolor}}
\ifpolycv@draft%
  \ClassInfo{polycv}{Option 'draft' is enabled}
  \setlength\overfullrule{1em}
  \PassOptionsToPackage{showframe}{geometry}
  \AtEndPreamble{%
    \colorlet{polycvsidebarbackground}{%
      \polycv@primary!20!\polycv@secondary}%
  }
\fi
\ifpolycv@biblatex%
  \ClassInfo{polycv}{Option 'biblatex' is enabled}
  \AtEndPreamble{%
    \setlength{\biblabelsep}{\polycvhintcolsep}%
    \DeclareFieldFormat{labelnumberwidth}{%
      \makebox[\polycvhintcol][r]{[#1]}}%
  }%
\fi
\newlength{\polycvheaderheight}
\setlength{\polycvheaderheight}{\polycv@headerheight}
\newlength{\polycvfooterheight}
\setlength{\polycvfooterheight}{\polycv@footerheight}
\newlength{\polycvmargins}
\setlength{\polycvmargins}{\polycv@margins}
\newlength{\polycvsidebarwidth}
\setlength{\polycvsidebarwidth}{\polycv@sidebarwidth}
\newlength{\polycvhintcol}
\setlength{\polycvhintcol}{\polycv@hintcol}
\newlength{\polycvhintcolsep}
\setlength{\polycvhintcolsep}{\polycv@hintcolsep}
\newlength{\polycvsidebarhint}
\setlength{\polycvsidebarhint}{\polycv@sidebarhint}
\newlength{\polycvsidebarindent}
\setlength{\polycvsidebarindent}{\polycv@sidebarindent}
\newlength{\polycviconspace}
\setlength{\polycviconspace}{\polycv@iconspace}
\newlength{\polycvprogbarheight}
\setlength{\polycvprogbarheight}{\polycv@progbarheight}
\newlength{\polycvprogbarlinewidth}
\setlength{\polycvprogbarlinewidth}{\polycv@progbarlinewidth}
\newlength{\polycvletterindent}
\setlength{\polycvletterindent}{\polycv@letterindent}
\newcommand*{\setheaderheight}[1]{%
  \setlength{\polycvheaderheight}{#1}}
\newcommand*{\setfooterheight}[1]{%
  \setlength{\polycvfooterheight}{#1}}
\newcommand*{\setmargins}[1]{%
  \setlength{\polycvmargins}{#1}}
\newcommand*{\sethintcolwidth}[1]{%
  \setlength{\polycvhintcol}{#1}}
\newcommand*{\sethintcolsep}[1]{%
  \setlength{\polycvhintcolsep}{#1}}
\newcommand*{\seticonspace}[1]{%
  \setlength{\polycviconspace}{#1}}
\newcommand*{\setprogbarheight}[1]{%
  \setlength{\polycvprogbarheight}{#1}}
\@onlypreamble\setheaderheight
\@onlypreamble\setfooterheight
\@onlypreamble\setmargins
\@onlypreamble\sethintcolwidth
\@onlypreamble\sethintcolsep
\@onlypreamble\seticonspace
\@onlypreamble\setprogbarheight
\newlength{\polycvleftmargin}
\newlength{\polycvtopmargin}
\newlength{\polycvbottommargin}
\AtEndPreamble{%
  \setlength{\polycvleftmargin}{%
    \polycvsidebarwidth+2\polycvmargins}
  \setlength{\polycvtopmargin}{%
    \polycvheaderheight+\polycvmargins}
  \setlength{\polycvbottommargin}{%
    \polycvfooterheight+\polycvmargins}
}
\providecommand\polycv@headerfont{}
\renewcommand{\polycv@headerfont}{\sffamily\bfseries}
\providecommand\setheaderfont{}
\renewcommand*{\setheaderfont}[1]{%
  \renewcommand*{\polycv@headerfont}{#1}}
\@onlypreamble\setheaderfont
\providecommand\polycv@entry@ragged{}
\newcommand*{\setentryragged}{%
  \renewcommand{\polycv@entry@ragged}{\raggedright}}
\newcommand*{\setentryjustified}{%
  \renewcommand{\polycv@entry@ragged}{}}
\@onlypreamble\setentryragged
\@onlypreamble\setentryjustified
\providecommand\polycv@sig@align{right}
\newcommand*{\setsigright}{%
  \renewcommand{\polycv@sig@align}{right}}
\newcommand*{\setsigleft}{%
  \renewcommand{\polycv@sig@align}{left}}
\@onlypreamble\setsigright
\@onlypreamble\setsigleft
\newcommand*{\setprogbarunits}[1]{%
  \renewcommand*{\polycv@progbarunits}{#1}}
\@onlypreamble\setprogbarunits
\providecommand*\insertauthor{}
\renewcommand{\insertauthor}{\@author}
\providecommand\inserttitle{}
\renewcommand{\inserttitle}{\@title}
\providecommand*\insertposition{}
\providecommand*\position{}
\renewcommand{\position}[1]{%
  \renewcommand{\insertposition}{#1}}
\@onlypreamble\position
\providecommand\cvitemline[3][\polycviconspace]{%
  \parbox[t]{#1}{\centering#2}%
  \parbox[t]{\linewidth-#1}{#3}\par\vspace{0.3\baselineskip}}
\providecommand\insertaddress{}
\providecommand\insertstreet{}
\providecommand\insertlocation{}
\providecommand\address{}
\providecommand\street{}
\providecommand\location{}
\renewcommand{\address}[1]{%
  \renewcommand{\insertaddress}{#1}}
\renewcommand{\street}[1]{%
  \renewcommand{\insertstreet}{#1}}
\renewcommand{\location}[1]{%
  \renewcommand{\insertlocation}{#1}}
\renewcommand{\insertaddress}{\insertstreet\\\insertlocation}
\providecommand{\cvlineaddress}{%
  \cvitemline{\faMapMarker}{\insertaddress}}
\providecommand*\insertemail{}
\providecommand*\email{}
\renewcommand{\email}[1]{%
  \renewcommand{\insertemail}{\href{mailto:#1}{#1}}}
\providecommand{\cvlineemail}{%
  \cvitemline{\faEnvelope}{\insertemail}}
\providecommand*\insertphone{}
\providecommand*\phone{}
\renewcommand{\phone}[1]{\renewcommand{\insertphone}{#1}}
\providecommand{\cvlinephone}{%
  \cvitemline{\faPhone}{\insertphone}}
\providecommand*\insertmobile{}
\providecommand*\mobile{}
\renewcommand{\mobile}[1]{\renewcommand{\insertmobile}{#1}}
\providecommand{\cvlinemobile}{%
  \cvitemline{\faMobile}{\insertmobile}}
\providecommand*\insertgithub{}
\providecommand*\github{}
\renewcommand{\github}[1]{\renewcommand{\insertgithub}{%
  \href{https://github.com/#1}{github.com/#1}}}
\providecommand{\cvlinegithub}{%
  \cvitemline{\faGithub}{\insertgithub}}
\providecommand*\orcidiconfilename{}
\IfFileExists{orcidicon.pdf}{%
  \renewcommand{\orcidiconfilename}{%
    \raisebox{-0.2em}{%
      \includegraphics[height=1.0em]{orcidicon.pdf}}}%
}{%
  \renewcommand{\orcidiconfilename}{%
    \raisebox{-0.2em}{%
      \resizebox{1em}{1em}{\textbf{ORCID}}}}%
}
\providecommand*\insertorcid{}
\providecommand*\orcid{}
\renewcommand{\orcid}[1]{\renewcommand{\insertorcid}{%
  \href{http://orcid.org/#1}{orcid.org/#1}}}
\providecommand{\cvlineorcid}{%
  \cvitemline{\orcidiconfilename}{\insertorcid}}
\providecommand\insertsigfilename{}
\providecommand\signaturefile{}
\renewcommand{\signaturefile}[1]{%
  \renewcommand{\insertsigfilename}{#1}}
\renewcommand{\section}[1]{%
  \ignorespaces%
  \parbox[b]{1\linewidth}{%
    \strut%
    \color{polycvsectioncolor}%
    \Large\polycv@headerfont%
    \rule{\polycvhintcol}{1ex}\hspace{\polycvhintcolsep}%
    \parbox{1.0\linewidth-\polycvhintcol-\polycvhintcolsep}{%
      \strut%
      #1%
    }%
  }\vspace{0.5\baselineskip}}
\renewcommand{\subsection}[1]{%
  \parbox[b]{1\linewidth}{%
    \strut%
    \color{polycvsectioncolor}%
    \polycv@headerfont%
    \hspace{\polycvhintcol}\hspace{\polycvhintcolsep}%
    \parbox{1.0\linewidth-\polycvhintcol-\polycvhintcolsep}{%
      \strut%
      #1%
    }%
  }\vspace{0.3\baselineskip}}
\newcommand{\polycv@header}[3][\polycvheaderheight]{%
  \begin{tikzpicture}[remember picture,overlay]%
    \node [rectangle, %
           fill           = polycvheaderbackground, %
           anchor         = north, %
           minimum width  = \paperwidth, %
           minimum height = #1%
          ] (headerbox) at (current page.north){};%
    \node [anchor = mid] (cv-name) at (headerbox) {%
      \Huge\polycv@headerfont\color{polycvheadertext}\textbf{%
        #2
      }%
    };%
    \node [anchor = north] at (cv-name.south) {%
      \Large\polycv@headerfont\color{polycvheadertext}%
      #3%
    };%
  \end{tikzpicture}%
  \ignorespaces%
}
\newcommand{\polycv@footer}[2][\polycvfooterheight]{%
  \begin{tikzpicture}[remember picture,overlay]%
    \node [rectangle, %
           fill           = polycvheaderbackground, %
           anchor         = south, %
           minimum width  = \paperwidth, %
           minimum height = #1%
          ] (footerbox) at (current page.south){};%
    \node [anchor = center] (pagenumber) at (footerbox) {%
      \polycv@headerfont\color{polycvheadertext}%
      \if\relax\detokenize{#2}\relax%
      \else%
      - #2 -%
      \fi%
    };%
  \end{tikzpicture}%
  \ignorespaces%
}
\newcommand{\polycv@signature}[2][\polycvsidebarwidth]{%
  \begin{tikzpicture}[remember picture, overlay]%
    \node [rectangle, %
           anchor = south west, %
           text width = #1, %
           align = \polycv@sig@align, %
           minimum height = 0.75#1, %
           yshift = \polycvbottommargin, %
           xshift = \polycvmargins, %
           fill = polycvsidebarbackground %
          ] (cv-signbox) at (current page.south west) {%
      \includegraphics[width=#1]{#2}\\%
      \insertauthor%
    };
  \end{tikzpicture}%
  \ignorespaces%
}
\newcommand{\polycv@square@nofill}[1][\polycvprogbarheight]{%
  \begin{tikzpicture}[x=#1, y=#1]%
    \filldraw[polycvprogbarnofill] (0,0) rectangle (1,1);%
    \draw[polycvtextcolor, line width=\polycvprogbarlinewidth] (0,0) rectangle (1,1);%
  \end{tikzpicture}}
\newcommand{\polycv@square@filled}[1][\polycvprogbarheight]{%
  \begin{tikzpicture}[x=#1, y=#1]%
    \filldraw[polycvprogbarfilled] (0,0) rectangle (1,1);%
    \draw[polycvtextcolor, line width=\polycvprogbarlinewidth] (0,0) rectangle (1,1);%
  \end{tikzpicture}}
\newcommand{\polycv@circle@nofill}[1][\polycvprogbarheight]{%
  \begin{tikzpicture}[x=#1, y=#1]%
    \filldraw[polycvprogbarnofill] (0.5,0.5) circle [radius=0.5];%
    \draw[polycvtextcolor, line width=\polycvprogbarlinewidth] (0.5,0.5) circle [radius=0.5];%
  \end{tikzpicture}}
\newcommand{\polycv@circle@filled}[1][\polycvprogbarheight]{%
  \begin{tikzpicture}[x=#1, y=#1]%
    \filldraw[polycvprogbarfilled] (0.5,0.5) circle [radius=0.5];%
    \draw[polycvtextcolor, line width=\polycvprogbarlinewidth] (0.5,0.5) circle [radius=0.5];%
  \end{tikzpicture}}
\newcommand{\polycv@repeating}[2][5]{%
  \ifnum#1 > 0%
    \newcount\rep%
    \rep0%
    \loop\ifnum\rep < \number\numexpr#1-1\relax%
      #2\hfill%
      \advance\rep by 1%
    \repeat%
    #2%
  \fi%
}
\newlength\polycv@temp@len@a
\newlength\polycv@temp@len@b
\newlength\polycv@temp@len@res
\def\polycv@multiply#1#2#3{%
  \setlength\polycv@temp@len@a{#1\p@}%
  \setlength\polycv@temp@len@res{#2\polycv@temp@len@a}%
  \edef#3{\expandafter\strip@pt\polycv@temp@len@res}\ignorespaces}%
\def\polycv@divide#1#2#3{%
  \setlength\polycv@temp@len@a{#1\p@}%
  \setlength\polycv@temp@len@b{#2\p@}%
  \setlength\polycv@temp@len@res{%
    \p@ * \ratio{\polycv@temp@len@a}{\polycv@temp@len@b}}%
  \edef#3{\expandafter\strip@pt\polycv@temp@len@res}\ignorespaces}%
\newcommand{\polycv@level@bar}[4][\polycvhintcol]{%
  \newcount\total@units%
  \total@units\polycv@progbarunits%
  \newcount\temp@count%
  \IfDecimal{#2}{%
    \ifdim #2\p@ < \z@ %
      \edef\temp@count{0}%
    \else%
      \ifnum\integerpart = 0%
      \polycv@multiply{#2}{\total@units}{\mult@res}%
      \IfDecimal{\mult@res}{\temp@count\integerpart}{\temp@count\z@}%
      \else%
      \temp@count\integerpart%
      \fi%
    \fi%
  }{\temp@count\total@units}%
  \newcount\level%
  \ifnum\temp@count < \total@units \level\temp@count%
  \else \level\total@units \fi%
  \newcount\elevel%
  \elevel\numexpr\total@units-\level\relax%
  \def\symbol@filled{#3}%
  \def\symbol@nofill{#4}%
  \parbox{#1}{%
    \ifnum\level = 0%
      \polycv@repeating[\total@units]{\symbol@nofill}%
    \else
      \ifnum\level = \total@units%
        \polycv@repeating[\total@units]{\symbol@filled}%
      \else
        \polycv@repeating[\level]{\symbol@filled}%
        \hfill%
        \polycv@repeating[\elevel]{\symbol@nofill}%
      \fi%
    \fi%
  }%
}
\newcommand{\levelbarsquares}[2][\polycvhintcol]{%
  \polycv@level@bar[#1]{#2}{%
    \polycv@square@filled}{\polycv@square@nofill}%
}
\newcommand{\levelbarcircles}[2][\polycvhintcol]{%
  \polycv@level@bar[#1]{#2}{%
    \polycv@circle@filled}{\polycv@circle@nofill}%
}
\newcommand{\progressbar}[2][\polycvhintcol]{%
  \newcount\total@units%
  \total@units\polycv@progbarunits%
  \newcount\temp@count%
  \IfDecimal{#2}{%
    \ifdim #2\p@ < \z@ %
      \edef\level@coord{0}
    \else%
      \ifnum\integerpart = 0%
        \edef\level@coord{#2}%
      \else%
        \ifnum\integerpart < \total@units%
          \temp@count\integerpart%
        \else%
          \temp@count\total@units%
        \fi%
        \polycv@divide{\temp@count}{\total@units}{\level@coord}%
      \fi%
    \fi%
  }{\edef\level@coord{1}}%
  \hfill%
  \begin{tikzpicture}[%
      x=#1-2*\polycvprogbarlinewidth,%
      y=\polycvprogbarheight-2*\polycvprogbarlinewidth]%
    \filldraw[polycvprogbarnofill]%
      (0, 0) rectangle (1, 1) ;%
    \filldraw[polycvprogbarfilled]%
      (0, 0) rectangle (\level@coord, 1);%
    \draw[polycvtextcolor, line width=\polycvprogbarlinewidth]%
      (0, 0) rectangle (1, 1) ;%
  \end{tikzpicture}%
}%
\providecommand\cvline{}
\renewcommand{\cvline}[3][\polycvhintcol]{%
  \par%
  \parbox[t]{#1}{\strut\raggedleft #2}%
  \hspace{\polycvhintcolsep}%
  \parbox[t]{\linewidth-\polycvhintcolsep-#1}{%
    \strut\polycv@entry@ragged #3}%
  \par\vspace{0.2\baselineskip}%
}
\providecommand\cventry{}
\renewcommand{\cventry}[7][\polycvhintcol]{%
  \cvline[#1]{#2}{%
    \textbf{#3}, \textit{#4}, #5%
    \if\relax\detokenize{#6}\relax%
    \else%
    , #6%
    \fi%
    \if\relax\detokenize{#7}\relax%
    .%
    \else%
    .\newline\small #7%
    \fi%
  }%
}
\providecommand\cvskill[2]{%
  \cvline[\polycvhintcol]{%
    \progressbar[0.5\linewidth]{#2}}{#1}}
\providecommand\cvlanguage[2]{%
  \cvskill{#1}{#2}}
\newenvironment{polycvfirstpage}{%
  \newgeometry{%
    left=\polycvleftmargin,
    top=\polycvtopmargin,
    right=\polycvmargins,
    bottom=\polycvbottommargin,
    nohead,nofoot}%
  \polycv@header{\insertauthor}{\insertposition}%
  \polycv@footer{}%
}{%
  \restoregeometry%
  \ignorespaces%
}
\newenvironment{polycvpage}{%
  \newgeometry{%
    top=\polycvtopmargin,%
    left=2\polycvmargins,%
    right=2\polycvmargins,%
    bottom=\polycvbottommargin,%
    nohead,nofoot}%
  \polycv@header{}{}%
  \polycv@footer{}%
}{%
  \restoregeometry%
  \ignorespaces%
}
\providecommand\sbline{}
\renewcommand{\sbline}[3][\polycvsidebarhint]{%
  \parbox{1.0\linewidth}{%
    \hspace{\polycvsidebarindent}%
    \parbox[t]{\linewidth-2\polycvsidebarindent-#1}{%
      \strut\polycv@entry@ragged #2}%
    \hspace{\polycvsidebarindent}\hfill%
    \parbox[t]{#1}{\strut\raggedleft #3}%
    \vspace{0.2\baselineskip}%
  }%
}
\providecommand\sidebarskill[3][\polycvsidebarhint]{%
  \sbline[#1]{#2}{\progressbar[\linewidth]{#3}}%
}
\providecommand\sidebarlanguage[3][\polycvsidebarhint]{%
  \sbline[#1]{#2}{\progressbar[\linewidth]{#3}}%
}
\newenvironment{polycvsidebar}{%
  \let\section\save@section%
  \newcommand{\section}[1]{%
  \parbox[b]{1\linewidth}{%
    \strut%
    \color{polycvsectioncolor}\large\polycv@headerfont{##1}%
  }\par\vspace{0.5\baselineskip}}%
  \let\cvlanguage\save@polycvlanguage%
  \newcommand{\cvlanguage}[2]{%
    \sidebarlanguage{##1}{##2}}%
  \let\cvskill\save@polycvskill%
  \newcommand{\cvskill}[2]{%
    \sidebarskill{##1}{##2}}%
  \begin{tikzpicture}[remember picture, overlay]%
    \node [anchor = north west, %
           text width = \polycvsidebarwidth, %
           xshift = \polycvmargins, %
           yshift = -\polycvheaderheight-\polycvmargins, %
           fill = polycvsidebarbackground %
          ] (polycvsidebarbox) at (current page.north west) %
    \bgroup%
}{%
    \egroup;%
  \end{tikzpicture}%
  \let\save@section\section%
  \let\save@polycvlanguage\cvlanguage%
  \let\save@polycvlanguage\cvskill%
  \ifpolycv@signcv%
    \polycv@signature{\insertsigfilename}%
  \fi%
  \ignorespaces%
}%
\newcommand{\polycv@letter@from}[3][\polycvheaderheight]{%
  \begin{tikzpicture}[remember picture, overlay]%
    \node [rectangle, %
           fill           = polycvheadertext, %
           anchor         = north, %
           minimum width  = \paperwidth, %
           minimum height = #1-1ex%
          ] (headerbox) at (current page.north){};
    \node [rectangle, %
           fill           = polycvheaderbackground, %
           anchor         = north, %
           minimum width  = \paperwidth, %
           minimum height = 1ex%
          ] (headerline) at (headerbox.south){};
    \node [anchor = east, %
           text width = 5cm, %
           xshift     = -2\polycvmargins
          ] (polycv-letter-address) at (headerbox.east) {%
      \polycv@headerfont\color{polycvheaderbackground}%
      \parbox[t]{1.0\linewidth}{%
        \raggedleft%
        \textbf{\Large #2}\\%
        \textit{\normalsize #3}%
        }%
    };%
  \end{tikzpicture}%
  \ignorespaces%
}
\newcommand{\polycv@letter@to}[1]{%
  \noindent\parbox[t][4cm][c]{0.4\linewidth}{\raggedright#1}\par%
  \vspace{1\baselineskip}%
}
\newcommand{\polycv@letter@date}{%
  \noindent\parbox[t]{1.00\linewidth}{\raggedleft\today}\par%
}
\newcommand{\polycv@letter@subject}[1]{%
  \noindent\parbox[t]{1.00\linewidth}{%
    \raggedright\textbf{#1}}\par%
}
\providecommand\opening{}
\renewcommand{\opening}[1]{\noindent{}#1\par}
\providecommand\closing{}
\renewcommand{\closing}[1]{\noindent{}#1\par}
\newcommand{\polycv@letter@psmark}{P.S.~}
\providecommand\setpsmark{}
\renewcommand*{\setpsmark}[1]{%
  \renewcommand{\polycv@letter@psmark}{#1}}
\providecommand\polycv@letter@ps{}%
\providecommand\ps{}
\renewcommand{\ps}[1]{%
  \renewcommand{\polycv@letter@ps}{%
    \noindent\footnotesize\polycv@letter@psmark#1\par%
  }%
}%
\newenvironment{polycvletter}[3][\insertaddress]{%
  \newgeometry{%
    top=\polycvtopmargin,%
    left=2\polycvmargins,%
    right=2\polycvmargins,%
    bottom=\polycvbottommargin,%
    nohead,nofoot}%
  \polycv@letter@from{\insertauthor}{#1}%
  \polycv@footer{}%
  \polycv@letter@to{#3}%
  \polycv@letter@date%
  \polycv@letter@subject{#2}%
  \setlength{\parindent}{\polycvletterindent}%
}{%
  \vspace{0.5\baselineskip}%
  \noindent\includegraphics[width=5cm]{\insertsigfilename}\\%
  \noindent\insertauthor\par%
  \if\relax\detokenize{\polycv@letter@ps}\relax%
  \else%
  \polycv@letter@ps\par%
  \fi%
  \restoregeometry%
}
\providecommand*\pdfappendix{}
\renewcommand*{\pdfappendix}[2][pages={1-}]{%
  \nopagecolor%
  \includepdf[#1]{#2}}%
\endinput
%%
%% End of file `polycv.cls'.
