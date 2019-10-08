%tex
\ProvidesClass{polycv}[2019/09/30 v0.1 Polyluxus CV class]
\NeedsTeXFormat{LaTeX2e}

%%%%%
%
%  Necessary packages before loading options
%
%  Package etoolbox is necessary for additional hooks like \AtEndPreamble
\RequirePackage{etoolbox}
%  Package calc is necessary to do mathematics with lengths
\RequirePackage{calc}
%
%%%%%

%%%%%
%
%  Options will be defined here (later)
%

\DeclareOption{draft}{%
  \def\polycv@draft{}%
  \PassOptionsToClass{draft}{article}%
}
\DeclareOption{biblatex}{%
  \AtEndPreamble{%
    \setlength{\biblabelsep}{\polycv@hintcolsep}%
    \DeclareFieldFormat{labelnumberwidth}{\makebox[\polycv@hintcol][r]{[#1]}}%
  }%
}
\DeclareOption{signcv}{%
  \AfterEndPreamble{\polycvsignature{\polycvsignatureimage}}%
}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}
%
%%%%%

%%%%%
%
%  Necessary packages
%
%  Provide Hyperlinks in templates
\RequirePackage{hyperref}
%  Color definitions
\RequirePackage[dvipsnames]{xcolor}
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

%  Set some default colours
%  (Need new and better names)
\colorlet{headerbg}{MidnightBlue}
\colorlet{headerfg}{white}
\colorlet{sectioncolor}{headerbg}
\colorlet{textcolor}{headerbg!20!black}
\colorlet{highlight}{Maroon}

% Define some lengths (and defaults) for the layout
\newlength{\polycv@headerheight}
\setlength{\polycv@headerheight}{3cm}
\newlength{\polycv@footerheight}
\setlength{\polycv@footerheight}{0.5cm}
\newlength{\polycv@margins}
\setlength{\polycv@margins}{1cm}
\newlength{\polycv@sidebarwidth}
\setlength{\polycv@sidebarwidth}{5cm}
\newlength{\polycv@hintcol}
\setlength{\polycv@hintcol}{2.7cm}
\newlength{\polycv@hintcolsep}
\setlength{\polycv@hintcolsep}{0.2cm}
\newlength{\polycv@iconspace}
\setlength{\polycv@iconspace}{0.8cm}

% Commands to alter the lengths
\newcommand{\polycvheaderheight}[1]{\setlength{\polycv@headerheight}{#1}}
\newcommand{\polycvfooterheight}[1]{\setlength{\polycv@footerheight}{#1}}
\newcommand{\polycvmargins}[1]{\setlength{\polycv@margins}{#1}}
\newcommand{\polycvhintcolumnwidth}[1]{\setlength{\polycv@hintcol}{#1}}
\newcommand{\polycvhintcolumnsep}[1]{\setlength{\polycv@hintcolsep}{#1}}
\newcommand{\polycviconspace}[1]{\setlength{\polycv@iconspace}{#1}}

% additional lengths computed automatically
\newlength{\polycv@leftmargin}
\newlength{\polycv@topmargin}
\newlength{\polycv@bottommargin}
\AtEndPreamble{%
  \setlength{\polycv@leftmargin}{\polycv@sidebarwidth+2\polycv@margins}
  \setlength{\polycv@topmargin}{\polycv@headerheight+\polycv@margins}
  \setlength{\polycv@bottommargin}{\polycv@footerheight+\polycv@margins}
}

% Define how the progressbar should look like
\progressbarchange{%
  heightr=1,%
  filledcolor=sectioncolor,%
  emptycolor=sectioncolor!10,%
  linecolor=sectioncolor,%
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
\newcommand{\polycventryraggedright}{\renewcommand{\polycv@entry@ragged}{\raggedright}}
\newcommand{\polycventryjustify}{\renewcommand{\polycv@entry@ragged}{}}
%  Define default alignment for the signature (may be used differently in CV and Letter)
\providecommand\polycv@signature@alignment{right}
\newcommand{\polycvsignatureright}{\renewcommand{\polycv@signature@alignment}{right}}
\newcommand{\polycvsignatureleft}{\renewcommand{\polycv@signature@alignment}{left}}

%%%%%
%
%  Define special commands and environments
%

%  Variables which make setting the template easier
%  (author and title already exist)%
\providecommand\polycvauthor{}
\renewcommand{\polycvauthor}{\@author}
\providecommand\polycvtitle{}
\renewcommand{\polycvtitle}{\@title}

\providecommand\polycvposition{}
\providecommand\position{}
\renewcommand{\position}[1]{\renewcommand{\polycvposition}{#1}}

\providecommand\polycvitemline[3][\polycv@iconspace]{%
  \parbox[t]{#1}{\centering#2}%
  \parbox[t]{\linewidth-#1}{#3}\par\vspace{0.3\baselineskip}}

\providecommand\polycvaddress{}
\providecommand\polycvstreet{}
\providecommand\polycvlocation{}
\providecommand\address{}
\providecommand\street{}
\providecommand\location{}
\renewcommand{\polycvaddress}{\polycvstreet\\\polycvlocation}
\renewcommand{\address}[1]{\renewcommand{\polycvaddress}{#1}}
\renewcommand{\street}[1]{\renewcommand{\polycvstreet}{#1}}
\renewcommand{\location}[1]{\renewcommand{\polycvlocation}{#1}}
\providecommand{\polycvlineaddress}{\polycvitemline{\faMapMarker}{\polycvaddress}}

\providecommand\polycvemail{}
\providecommand\email{}
\renewcommand{\email}[1]{\renewcommand{\polycvemail}{\href{mailto:#1}{#1}}}
\providecommand{\polycvlineemail}{\polycvitemline{\faEnvelope}{\polycvemail}}

\providecommand\polycvphone{}
\providecommand\phone{}
\renewcommand{\phone}[1]{\renewcommand{\polycvphone}{#1}}
\providecommand{\polycvlinephone}{\polycvitemline{\faPhone}{\polycvphone}}

\providecommand\polycvmobile{}
\providecommand\mobile{}
\renewcommand{\mobile}[1]{\renewcommand{\polycvmobile}{#1}}
\providecommand{\polycvlinemobile}{\polycvitemline{\faMobile}{\polycvmobile}}

\providecommand\polycvgithub{}
\providecommand\github{}
\renewcommand{\github}[1]{\renewcommand{\polycvgithub}{\href{https://github.com/#1}{github.com/#1}}}
\providecommand{\polycvlinegithub}{\polycvitemline{\faGithub}{\polycvgithub}}

\providecommand\polycvorcidicon{\raisebox{-0.2em}{\includegraphics[height=1.0em]{orcidicon}}}
\providecommand\polycvorcid{}
\providecommand\orcid{}
\renewcommand{\orcid}[1]{\renewcommand{\polycvorcid}{\href{http://orcid.org/#1}{orcid.org/#1}}}
\providecommand{\polycvlineorcid}{\polycvitemline{\polycvorcidicon}{\polycvorcid}}

\providecommand\polycvsignatureimage{}
\providecommand\signatureimage{}
\renewcommand{\signatureimage}[1]{\renewcommand{\polycvsignatureimage}{#1}}

%  Redefine sections (no numbers and with color)
%
\renewcommand{\section}[1]{%
  \parbox[b]{1\linewidth}{%
    \color{sectioncolor}%
    \Large%
    \rule{\polycv@hintcol}{1ex}\hspace{\polycv@hintcolsep}\polycvheaderfont%
    \parbox{1.0\linewidth-\polycv@hintcol-\polycv@hintcolsep}{#1}% 
  }\par\vspace{0.5\baselineskip}}

\renewcommand{\subsection}[1]{%
  \parbox[b]{1\linewidth}{%
    \color{sectioncolor}%
    \hspace{\polycv@hintcol}\hspace{\polycv@hintcolsep}\polycvheaderfont%
    \parbox{1.0\linewidth-\polycv@hintcol-\polycv@hintcolsep}{#1}% 
  }\par\vspace{0.3\baselineskip}}

%  Fancy header box
\newcommand{\polycvheader}[3][\polycv@headerheight]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, %
           fill           = headerbg, %
           anchor         = north, %
           minimum width  = \paperwidth, %
           minimum height = #1%
          ] (headerbox) at (current page.north){};
    \node [anchor = mid] (cv-name) at (headerbox) {%
      \Huge\polycvheaderfont\color{headerfg}\textbf{#2}%
    };
    \node [anchor = north] at (cv-name.south) {%
      \Large\polycvheaderfont\color{headerfg} #3%
    };
  \end{tikzpicture}%
  \ignorespaces%
}

%  Fancy footer box
\newcommand{\polycvfooter}[2][\polycv@footerheight]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, %
           fill           = headerbg, %
           anchor         = south, %
           minimum width  = \paperwidth, %
           minimum height = #1%
          ] (footerbox) at (current page.south){};
    \node [anchor = center] (pagenumber) at (footerbox) {%
      \polycvheaderfont\color{headerfg}%
      \if\relax\detokenize{#2}\relax
      \else
      - #2 -
      \fi
    };
  \end{tikzpicture}%
  \ignorespaces%
}

%internal use
\providecommand\polycv@sidebar@skill[3][\polycv@hintcolsep]{%
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
    \color{sectioncolor}\large\polycvheaderfont{##1}% 
  }\par\vspace{0.5\baselineskip}}%
  \let\polycvlanguage\savepolycvlanguage%
  \newcommand{\polycvlanguage}[2]{\polycv@sidebar@skill{##1}{##2}}%
  \let\polycvskill\savepolycvskill%
  \newcommand{\polycvskill}[2]{\polycv@sidebar@skill{##1}{##2}}%
  \ifdefined\polycv@draft%
    \colorlet{polycvsidebackground}{sectioncolor!20}%
  \else%
    \colorlet{polycvsidebackground}{white!00}%
  \fi%
  \begin{tikzpicture}[remember picture, overlay]
    \node [anchor = north west, %
           text width = \polycv@sidebarwidth, %
           xshift = \polycv@margins, %
           yshift = -\polycv@headerheight-\polycv@margins,
           fill = polycvsidebackground %DRAFT
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
\newcommand{\polycvsignature}[2][\polycv@sidebarwidth]{%
  \ifdefined\polycv@draft%
    \colorlet{polycvsidebackground}{sectioncolor!20}%
  \else%
    \colorlet{polycvsidebackground}{white!00}%
  \fi%
  \begin{tikzpicture}[remember picture, overlay]
    \node [rectangle, 
           anchor = south west, %
           text width = #1, %
           align = \polycv@signature@alignment, %
           minimum height = 0.75#1, %
           yshift = \polycv@bottommargin, %
           xshift = \polycv@margins,
           fill = polycvsidebackground %DRAFT
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
\renewcommand{\polycvline}[3][\polycv@hintcol]{%
  \par%
  \parbox[t]{#1}{\strut\raggedleft #2}%
  \hspace{\polycv@hintcolsep}%
  \parbox[t]{\linewidth-\polycv@hintcolsep-#1}{\strut\polycv@entry@ragged #3}%
  \par\vspace{0.2\baselineskip}%
}

%  Usage (example):
%    \polycventry[width]{WHEN}{WHAT  }{WHO      }{WHERE}{OPTIONAL  }{OPTIONAL        }
%    \polycventry[width]{time}{degree}{institute}{where}{opt: grade}{opt: comment    }
%    \polycventry[width]{time}{title }{employer }{where}{opt: .....}{opt: description}
\providecommand\polycventry{}
\renewcommand{\polycventry}[7][\polycv@hintcol]{%
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
  \polycvline[\polycv@hintcol]{\progressbar[width=0.5\linewidth]{#2}}{#1}}

\providecommand\polycvlanguage[2]{%
  \polycvskill{#1}{#2}}

%  Change the geometry of the second page (large left column not necessary)
\providecommand\polycvafterfirstpage{}
\renewcommand{\polycvafterfirstpage}{%
  \newgeometry{%
    top=\polycv@topmargin,%
    left=2\polycv@margins,%
    right=2\polycv@margins,%
    bottom=\polycv@bottommargin,%
    nohead,nofoot}%
  \polycvheader{}{}
  \polycvfooter{}
}

%%%%%
%
%  Set the page and start
%
\ifdefined\polycv@draft
  \geometry{showframe}
\fi
\AtEndPreamble{\geometry{%
  left=\polycv@leftmargin,
  top=\polycv@topmargin,
  right=\polycv@margins,
  bottom=\polycv@bottommargin,
  nohead,nofoot}
}

\AfterEndPreamble{\polycvheader{\polycvauthor}{\polycvposition}}
\AfterEndPreamble{\polycvfooter{}}

