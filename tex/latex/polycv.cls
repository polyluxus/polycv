\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{polycv}[2019/10/30 v0.1 Polyluxus CV class]

%%%%% OPTION DEFINITIONS
%
%   Simple definitions for key-value pairs with kvoptions
%   See J. Wright, C. Feuersänger, TUGBoat, Vol. 30 (2009), No. 1, p. 110-122
%
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=polycv,
  prefix=polycv@
}
%
%   Define preset margins for geometry (page setup)
%
\DeclareStringOption[1.0cm]{margins}
\DeclareStringOption[3.0cm]{headerheight}
\DeclareStringOption[0.5cm]{footerheight}
\DeclareStringOption[5.0cm]{sidebarwidth}
\DeclareStringOption[2.7cm]{hintcol}
\DeclareStringOption[0.2cm]{hintcolsep}
\DeclareStringOption[0.8cm]{iconspace}
%
%   Define the colors for the highlights
%
\DeclareStringOption[blue]{primary}
\DeclareStringOption[white]{secondary}
\DeclareStringOption[orange]{highlight}
\DeclareStringOption[black]{shade}
\DeclareStringOption[10]{mixing}
%
%   Draft mode
% 
\DeclareBoolOption{draft}
\DeclareComplementaryOption{final}{draft}
%
%   Define Biblatex Mode
%
\DeclareBoolOption{biblatex}
%
%   Option to pass to xcolor
%
\DeclareStringOption[dvipsnames]{xcolor}
%
%   Option to sign the CV
%
\DeclareBoolOption{signcv}
%
%   Option to set the indentation in the letter
%
\DeclareStringOption[1em]{letterindent}
%
%   Warn about options which will not be used/ passed on because of potential clashes
%
\DeclareVoidOption{twocolumn}{%
  \ClassError{polycv}{Incompatible because of special page setup.}}
\DeclareVoidOption{titlepage}{%
  \ClassWarning{polycv}{Incompatible with a title page.}}
%
%   Pass all other options to article
%
\DeclareDefaultOption{%
  \PassOptionsToClass{\CurrentOptionKey}{article}}
%
%   Process these options
%   
\ProcessKeyvalOptions{polycv}
%
%   Inherit standard class
%
\LoadClass{article}
%
%%%%%

%%%%% PREREQUISITES
%
%  Necessary packages 
%
%  Package etoolbox is necessary for additional hooks like \AtEndPreamble
\RequirePackage{etoolbox}
%  Package calc is necessary to do mathematics with lengths
\RequirePackage{calc}
%  Provide Hyperlinks in templates
\RequirePackage{hyperref}
%  Color definitions
\PassOptionsToPackage{\polycv@xcolor,hyperref}{xcolor}
\RequirePackage{xcolor}
%  Use tikz for headerbox, etc. (must be loaded after xcolor)
\RequirePackage{tikz}
%  Graphics
\RequirePackage{graphicx}
%  Better Spacing
\RequirePackage[indent=0pt]{parskip}
%  Relative font sizes
\RequirePackage{relsize}
%  Page Layout
\RequirePackage{geometry}
%  Progressbar for languages/skills (should be replaced with tikz code)
\RequirePackage[%
]{progressbar}
%
%%%%%

%%%%% COLORS
%
%  Set some default colours
%
\newcommand*{\setpolycvprimary}[1]{\renewcommand*{\polycv@primary}{#1}}
\newcommand*{\setpolycvsecondary}[1]{\renewcommand*{\polycv@secondary}{#1}}
\newcommand*{\setpolycvhighlight}[1]{\renewcommand*{\polycv@highlight}{#1}}
\newcommand*{\setpolycvshade}[1]{\renewcommand*{\polycv@shade}{#1}}
\AtEndPreamble{%
  \colorlet{polycvpagecolor}{\polycv@secondary}
  \colorlet{polycvheaderbackground}{\polycv@primary}
  \colorlet{polycvheadertext}{\polycv@secondary}
  \colorlet{polycvsectioncolor}{\polycv@primary}
  \colorlet{polycvtextcolor}{\polycv@primary!\polycv@mixing!\polycv@shade}
  \colorlet{polycvhighlight}{\polycv@highlight}
  \colorlet{polycvsidebarbackground}{\polycv@secondary}
  \colorlet{polycvprogressbarfilled}{\polycv@primary}
  \colorlet{polycvprogressbarempty}{\polycv@primary!10!\polycv@secondary}
}
\AfterPreamble{\color{polycvtextcolor}\pagecolor{polycvpagecolor}}
%
%%%%%

%%%%% MACROS
%
%  Emulate and extend draft mode
\ifpolycv@draft%
  % Issue information for log
  \ClassInfo{polycv}{Option 'draft' is enabled}
  % Set the overfull boxes identifier 
  % [How to test whether report has been called with “draft” option](https://tex.stackexchange.com/a/240128/33413)
  \setlength\overfullrule{1em}
  % Make the page visible
  \PassOptionsToPackage{showframe}{geometry}
  \AtEndPreamble{%
    % Make the tikz boxes visible in draft mode
    \colorlet{polycvsidebarbackground}{\polycv@primary!20!\polycv@secondary}%
  }
\fi

%  Make biblatex use the same width as the date column
\ifpolycv@biblatex%
  \ClassInfo{polycv}{Option 'biblatex' is enabled}
  \AtEndPreamble{%
    \setlength{\biblabelsep}{\polycvhintcolsep}%
    \DeclareFieldFormat{labelnumberwidth}{\makebox[\polycvhintcol][r]{[#1]}}%
  }%
\fi

%  Sign the CV
\ifpolycv@signcv%
  \ClassInfo{polycv}{Option 'signcv' enabled; CV will be signed.}
  \AfterEndPreamble{\polycvsignature{\polycvsignatureimage}}%
\fi

%%%%% New lengths needs rewrite?
% Define some lengths (and defaults) for the layout
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
\newlength{\polycviconspace}
\setlength{\polycviconspace}{\polycv@iconspace}
\newlength{\polycvletterindent}
\setlength{\polycvletterindent}{\polycv@letterindent}

% Commands to alter the lengths
\newcommand*{\setpolycvheaderheight}[1]{\setlength{\polycvheaderheight}{#1}}
\newcommand*{\setpolycvfooterheight}[1]{\setlength{\polycvfooterheight}{#1}}
\newcommand*{\setpolycvmargins}[1]{\setlength{\polycvmargins}{#1}}
\newcommand*{\setpolycvhintcolumnwidth}[1]{\setlength{\polycvhintcol}{#1}}
\newcommand*{\setpolycvhintcolumnsep}[1]{\setlength{\polycvhintcolsep}{#1}}
\newcommand*{\setpolycviconspace}[1]{\setlength{\polycviconspace}{#1}}

% additional lengths computed automatically
\newlength{\polycvleftmargin}
\newlength{\polycvtopmargin}
\newlength{\polycvbottommargin}
\AtEndPreamble{%
  \setlength{\polycvleftmargin}{\polycvsidebarwidth+2\polycvmargins}
  \setlength{\polycvtopmargin}{\polycvheaderheight+\polycvmargins}
  \setlength{\polycvbottommargin}{\polycvfooterheight+\polycvmargins}
}

% Define how the progressbar should look like
\progressbarchange{%
  heightr=1,%
  filledcolor=polycvprogressbarfilled,%
  emptycolor=polycvprogressbarempty,%
  linecolor=polycvtextcolor,%
  roundnessr=0,%
  borderwidth=0pt,%
  tickswidth=0pt,%
  ticksheight=0pt%
}

% Remove pagenumbers
\pagestyle{empty}

%  Use fancy symbols
%
\usepackage{fontawesome}

%  Define different fonts
\providecommand\polycvheaderfont{}
\renewcommand{\polycvheaderfont}{\sffamily\bfseries}

%  Define standard raggedness
\providecommand\polycv@entry@ragged{}
\newcommand*{\setpolycventryraggedright}{\renewcommand{\polycv@entry@ragged}{\raggedright}}
\newcommand*{\setpolycventryjustify}{\renewcommand{\polycv@entry@ragged}{}}
%  Define default alignment for the signature (may be used differently in CV and Letter)
\providecommand\polycv@signature@alignment{right}
\newcommand*{\setpolycvsignatureright}{\renewcommand{\polycv@signature@alignment}{right}}
\newcommand*{\setpolycvsignatureleft}{\renewcommand{\polycv@signature@alignment}{left}}

%%%%%
%
%  Define special commands and environments
%

%  Variables which make setting the template easier
%  (author and title already exist)%
\providecommand*\polycvauthor{}
\renewcommand{\polycvauthor}{\@author}
\providecommand\polycvtitle{}
\renewcommand{\polycvtitle}{\@title}

\providecommand*\polycvposition{}
\providecommand*\position{}
\renewcommand{\position}[1]{\renewcommand{\polycvposition}{#1}}

\providecommand\polycvitemline[3][\polycviconspace]{%
  \parbox[t]{#1}{\centering#2}%
  \parbox[t]{\linewidth-#1}{#3}\par\vspace{0.3\baselineskip}}

\providecommand\polycvaddress{}
\providecommand\polycvstreet{}
\providecommand\polycvlocation{}
\providecommand\address{}
\providecommand\street{}
\providecommand\location{}
\renewcommand{\address}[1]{\renewcommand{\polycvaddress}{#1}}
\renewcommand{\street}[1]{\renewcommand{\polycvstreet}{#1}}
\renewcommand{\location}[1]{\renewcommand{\polycvlocation}{#1}}
\renewcommand{\polycvaddress}{\polycvstreet\\\polycvlocation}
\providecommand{\polycvlineaddress}{\polycvitemline{\faMapMarker}{\polycvaddress}}

\providecommand*\polycvemail{}
\providecommand*\email{}
\renewcommand{\email}[1]{\renewcommand{\polycvemail}{\href{mailto:#1}{#1}}}
\providecommand{\polycvlineemail}{\polycvitemline{\faEnvelope}{\polycvemail}}

\providecommand*\polycvphone{}
\providecommand*\phone{}
\renewcommand{\phone}[1]{\renewcommand{\polycvphone}{#1}}
\providecommand{\polycvlinephone}{\polycvitemline{\faPhone}{\polycvphone}}

\providecommand*\polycvmobile{}
\providecommand*\mobile{}
\renewcommand{\mobile}[1]{\renewcommand{\polycvmobile}{#1}}
\providecommand{\polycvlinemobile}{\polycvitemline{\faMobile}{\polycvmobile}}

\providecommand*\polycvgithub{}
\providecommand*\github{}
\renewcommand{\github}[1]{\renewcommand{\polycvgithub}{\href{https://github.com/#1}{github.com/#1}}}
\providecommand{\polycvlinegithub}{\polycvitemline{\faGithub}{\polycvgithub}}

\providecommand*\polycvorcidicon{\raisebox{-0.2em}{\includegraphics[height=1.0em]{orcidicon}}}
\providecommand*\polycvorcid{}
\providecommand*\orcid{}
\renewcommand{\orcid}[1]{\renewcommand{\polycvorcid}{\href{http://orcid.org/#1}{orcid.org/#1}}}
\providecommand{\polycvlineorcid}{\polycvitemline{\polycvorcidicon}{\polycvorcid}}

\providecommand\polycvsignatureimage{}
\providecommand\signatureimage{}
\renewcommand{\signatureimage}[1]{\renewcommand{\polycvsignatureimage}{#1}}

%  Redefine sections (no numbers and with color)
%
\renewcommand{\section}[1]{%
  \parbox[b]{1\linewidth}{%
    \color{polycvsectioncolor}%
    \Large%
    \rule{\polycvhintcol}{1ex}\hspace{\polycvhintcolsep}\polycvheaderfont%
    \parbox{1.0\linewidth-\polycvhintcol-\polycvhintcolsep}{#1}% 
  }\par\vspace{0.5\baselineskip}}

\renewcommand{\subsection}[1]{%
  \parbox[b]{1\linewidth}{%
    \color{polycvsectioncolor}%
    \hspace{\polycvhintcol}\hspace{\polycvhintcolsep}\polycvheaderfont%
    \parbox{1.0\linewidth-\polycvhintcol-\polycvhintcolsep}{#1}% 
  }\par\vspace{0.3\baselineskip}}

%  Fancy header box
\newcommand{\polycvheader}[3][\polycvheaderheight]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, %
           fill           = polycvheaderbackground, %
           anchor         = north, %
           minimum width  = \paperwidth, %
           minimum height = #1%
          ] (headerbox) at (current page.north){};
    \node [anchor = mid] (cv-name) at (headerbox) {%
      \Huge\polycvheaderfont\color{polycvheadertext}\textbf{#2}%
    };
    \node [anchor = north] at (cv-name.south) {%
      \Large\polycvheaderfont\color{polycvheadertext} #3%
    };
  \end{tikzpicture}%
  \ignorespaces%
}

%  Fancy footer box
\newcommand{\polycvfooter}[2][\polycvfooterheight]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, %
           fill           = polycvheaderbackground, %
           anchor         = south, %
           minimum width  = \paperwidth, %
           minimum height = #1%
          ] (footerbox) at (current page.south){};
    \node [anchor = center] (pagenumber) at (footerbox) {%
      \polycvheaderfont\color{polycvheadertext}%
      \if\relax\detokenize{#2}\relax
      \else
      - #2 -
      \fi
    };
  \end{tikzpicture}%
  \ignorespaces%
}

%internal use
\providecommand\polycv@sidebar@skill[3][\polycvhintcolsep]{%
  \parbox{1.0\linewidth}{%
    \hspace{#1}%
    \parbox[b]{2\linewidth/3-4#1}{#2}%
    \hspace{#1}%
    \parbox[b]{\linewidth/3}{\flushright\progressbar[width=\linewidth]{#3}}\par\vspace{0.2\baselineskip}}
}

%  Fancy sidebar box
\newenvironment{polycvsidebar}{%
  \let\section\savesection%
  \newcommand{\section}[1]{%
  \parbox[b]{1\linewidth}{%
    \color{polycvsectioncolor}\large\polycvheaderfont{##1}% 
  }\par\vspace{0.5\baselineskip}}%
  \let\polycvlanguage\savepolycvlanguage%
  \newcommand{\polycvlanguage}[2]{\polycv@sidebar@skill{##1}{##2}}%
  \let\polycvskill\savepolycvskill%
  \newcommand{\polycvskill}[2]{\polycv@sidebar@skill{##1}{##2}}%
  \begin{tikzpicture}[remember picture, overlay]
    \node [anchor = north west, %
           text width = \polycvsidebarwidth, %
           xshift = \polycvmargins, %
           yshift = -\polycvheaderheight-\polycvmargins,
           fill = polycvsidebarbackground %DRAFT
          ] (polycvsidebarbox) at (current page.north west) \bgroup
}{%
    \egroup;%
  \end{tikzpicture}%
  \let\savesection\section%
  \let\savepolycvlanguage\polycvlanguage%
  \let\savepolycvlanguage\polycvskill%
  \ignorespaces%
}

%  Fancy signature box
\newcommand{\polycvsignature}[2][\polycvsidebarwidth]{%
  \begin{tikzpicture}[remember picture, overlay]
    \node [rectangle, 
           anchor = south west, %
           text width = #1, %
           align = \polycv@signature@alignment, %
           minimum height = 0.75#1, %
           yshift = \polycvbottommargin, %
           xshift = \polycvmargins,
           fill = polycvsidebarbackground %DRAFT
          ] (polycvsignaturebox) at (current page.south west) {%
      \includegraphics[width=#1]{#2}\\
      \polycvauthor%
    };
  \end{tikzpicture}%
  \ignorespaces%
}

%  Define entries
%  Usage:
%    \polycvline[width]{hint}{description}
\providecommand\polycvline{}
\renewcommand{\polycvline}[3][\polycvhintcol]{%
  \par%
  \parbox[t]{#1}{\strut\raggedleft #2}%
  \hspace{\polycvhintcolsep}%
  \parbox[t]{\linewidth-\polycvhintcolsep-#1}{\strut\polycv@entry@ragged #3}%
  \par\vspace{0.2\baselineskip}%
}

%  Usage (example):
%    \polycventry[width]{WHEN}{WHAT  }{WHO      }{WHERE}{OPTIONAL  }{OPTIONAL        }
%    \polycventry[width]{time}{degree}{institute}{where}{opt: grade}{opt: comment    }
%    \polycventry[width]{time}{title }{employer }{where}{opt: .....}{opt: description}
\providecommand\polycventry{}
\renewcommand{\polycventry}[7][\polycvhintcol]{%
\polycvline[#1]{#2}{%
\textbf{#3}, \textit{#4}, #5%
\if\relax\detokenize{#6}\relax
\else
, #6%
\fi
\if\relax\detokenize{#7}\relax
.%
\else
.\newline\small #7 
\fi
}
}

\providecommand\polycvskill[2]{%
  \polycvline[\polycvhintcol]{\progressbar[width=0.5\linewidth]{#2}}{#1}}

\providecommand\polycvlanguage[2]{%
  \polycvskill{#1}{#2}}

%  Change the geometry of the second page (large left column not necessary)
\providecommand\polycvafterfirstpage{}
\renewcommand{\polycvafterfirstpage}{%
  \newgeometry{%
    top=\polycvtopmargin,%
    left=2\polycvmargins,%
    right=2\polycvmargins,%
    bottom=\polycvbottommargin,%
    nohead,nofoot}%
  \polycvheader{}{}
  \polycvfooter{}
}

%%%%%
%
%  Define the letter environment
%

\newcommand{\polycv@letter@from}[3][\polycvheaderheight]{%
  \begin{tikzpicture}[remember picture,overlay]
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
      \polycvheaderfont\color{polycvheaderbackground}\parbox[t]{1.0\linewidth}{%
        \raggedleft%
        \textbf{\Large #2}\\%
        \textit{\normalsize #3}%%
        }%
    };
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
  \noindent\parbox[t]{1.00\linewidth}{\raggedright\textbf{#1}}\par%
}

\newenvironment{polycvletter}[3][\polycvaddress]{%
  \newgeometry{%
    top=\polycvtopmargin,%
    left=2\polycvmargins,%
    right=2\polycvmargins,%
    bottom=\polycvbottommargin,%
    nohead,nofoot}%
  \polycv@letter@from{\polycvauthor}{#1}%
  \polycv@letter@to{#3}%
  \polycv@letter@date%
  \polycv@letter@subject{#2}%
  \setlength{\parindent}{\polycvletterindent}%
}{%
  \vspace{1\baselineskip}%
  \raggedright%
  \includegraphics[width=5cm]{\polycvsignatureimage}\\%
  \polycvauthor%
  \polycvfooter{}%
  \restoregeometry
}

\providecommand\opening{}
\renewcommand{\opening}[1]{\noindent{}#1\par}
\providecommand\closing{}
\renewcommand{\closing}[1]{\noindent{}#1\par}

%%%%%
%
%  Set the page and start
%
\AtEndPreamble{%
  \geometry{%
    left=\polycvleftmargin,
    top=\polycvtopmargin,
    right=\polycvmargins,
    bottom=\polycvbottommargin,
    nohead,nofoot}
}

\AfterEndPreamble{\polycvheader{\polycvauthor}{\polycvposition}}
\AfterEndPreamble{\polycvfooter{}}

