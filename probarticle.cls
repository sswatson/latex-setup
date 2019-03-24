
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{probarticle}[2017/09/22 probarticle Class]

\LoadClassWithOptions{article}

\RequirePackage[svgnames]{xcolor} 
\RequirePackage{hyperref}
\RequirePackage{url}
\RequirePackage[margin=1in,marginpar=0.5in,marginparsep=2.6mm]{geometry} 
\RequirePackage{giambattista}
\RequirePackage{calc} 
\RequirePackage{amsmath}
\RequirePackage{amssymb} 
%\RequirePackage{amsthm} 
\RequirePackage{wrapfig} 
\RequirePackage{colonequals} 
\RequirePackage{ifthen}
\RequirePackage{bm}
\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage[labelfont=bf,labelsep=none,justification=RaggedRight]{caption}
\RequirePackage{xparse}
\RequirePackage[shortlabels]{enumitem} 
\RequirePackage{marginnote}
\RequirePackage{tocloft}
\RequirePackage[explicit,calcwidth]{titlesec}
\RequirePackage[T1]{fontenc}
\RequirePackage[scaled=0.8]{beramono}
\RequirePackage{listings}
\RequirePackage{tikz}

\RequirePackage{framed}
\RequirePackage[framed]{ntheorem}

% \newtheoremstyle{custom}{6pt}% ⟨Space above ⟩
% {6pt}% ⟨Space below ⟩
% {}% ⟨Body font ⟩
% {}% ⟨Indent amount⟩
% {\bfseries}% ⟨Theorem head font⟩
% {.}% ⟨Punctuation after theorem head ⟩
% {.5em}% ⟨Space after theorem head ⟩
% {}% ⟨Theorem head spec (can be left empty, meaning ‘normal’ )⟩
% \theoremstyle{custom}

\theorempreskip{0pt}
\theorempostskip{0pt}
\theorembodyfont{}
\theoremseparator{.}

\theoremprework{%                                                               
  \def\FrameCommand{{\color{DarkRed}{\vrule width 2pt \hspace{6pt}}}}
}%
\newframedtheorem{theorem}{Theorem}
\theoremprework{%                                                               
  \def\FrameCommand{{\color{DarkRed}{\vrule width 2pt \hspace{6pt}}}}
}%
\newframedtheorem{defn}[theorem]{Definition}
\theoremprework{%                                                               
  \def\FrameCommand{{\color{DarkRed}{\vrule width 2pt \hspace{6pt}}}}
}%
\newframedtheorem{prop}[theorem]{Proposition}
\theoremprework{%                                                               
  \def\FrameCommand{{\color{DarkGreen}{\vrule width 2pt \hspace{6pt}}}}
}%
\newframedtheorem{exercise}{Exercise}

%----PACKAGE CUSTOMIZATION SETUP---------------------

% \newtheorem{theorem}{Theorem} % amsthm 
% \newtheorem{prop}[theorem]{Proposition} % amsthm 
% \newtheorem{defn}[theorem]{Definition} % amsthm
% \newtheorem{exercise}{Exercise}
% \newtheorem{lemma}[theorem]{Lemma} % amsthm 
% \newtheorem{corollary}[theorem]{Corollary} % amsthm 
% \newtheorem{remark}[theorem]{Remark} % amsthm
\numberwithin{theorem}{section} % ntheorem  
\numberwithin{exercise}{section} % ntheorem 
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}} % array
\newcolumntype{N}{@{}m{0pt}@{}} % array
\DeclareCaptionFormat{suggested}{{\small #1#2 #3}} % caption
\captionsetup{format=suggested} % caption 
\renewcommand\cftsecafterpnum{\vskip5pt} % tocloft
\renewcommand\cftsubsecafterpnum{\vskip5pt} % tocloft
\setenumerate{labelsep=3pt,itemsep=4pt,parsep=0pt,topsep=-6pt} % enumitem 
\setitemize{labelsep=3pt,itemsep=0pt,parsep=0pt,topsep=0pt} % enumitem
\definecolor{shadecolor}{rgb}{0.92,0.92,0.92} % listings
\lstset{%
    language         = python,
    basicstyle       = \ttfamily,
    keywordstyle     = \bfseries\color{blue},
    stringstyle      = \color{magenta},
    commentstyle     = \color{ForestGreen},
    showstringspaces = false,
    backgroundcolor  = \color{shadecolor},
    belowskip        = -3mm
}
% Some colors for backgrounds
\definecolor{softblue}{rgb}{0.92, 0.95, 0.99}
\definecolor{softyellow}{rgb}{0.98, 0.98, 0.9}
\definecolor{softseagreen}{rgb}{0.96, 0.995, 0.98}
\definecolor{softred}{rgb}{0.99, 0.92, 0.91}
\definecolor{softbrown}{rgb}{0.97, 0.97, 0.9}

\newsavebox{\insetfiguresavebox}%
\newlength{\myfigurewidth}%


%--- MATH COMMANDS ---------------------------
\DeclareMathOperator{\arcsec}{arcsec}
\DeclareMathOperator{\cis}{cis}
\DeclareMathOperator{\Real}{Re}
\DeclareMathOperator{\Imag}{Im}
\DeclareMathOperator{\trace}{trace}
\DeclareMathOperator{\e}{e}
\newcommand{\eps}{\varepsilon}
\newcommand\pd[2]{\frac{\partial #1}{\partial #2}}
\renewcommand{\vec}[1]{\mathbf{#1}}
\newcommand{\R}{\mathbb{R}}
\providecommand{\C}{}
\renewcommand{\C}{\mathbb{C}}
\renewcommand{\H}{\mathbb{H}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\N}{\mathbb{N}}
\renewcommand{\d}{\mathrm{d}}
\renewcommand{\P}{\mathbb{P}}
\newcommand{\E}{\mathbb{E}}


%--- SIDE NOTES ----------------------------------

\newlength{\marginvoffset} 
\DeclareDocumentCommand{\sidenote}{O{rectangle,text width =
    17.5mm,draw,fill=softblue,rounded corners} m O{0pt}}{%
       \setlength{\marginvoffset}{#3 - 12pt}%
        \marginnote[{%
          \makebox[0pt][r]{%
            \scriptsize \tikz \node at (0,-1) [#1]{#2};%
          }%
          }]{}[\marginvoffset]%
}
\reversemarginpar


%----- SPACING CUSTOMIZATIONS -----------------

\newlength{\myparskiplength}
\setlength{\myparskiplength}{6pt} 
\parindent = 0 pt 
\parskip   = \myparskiplength

%----- SECTION HEADING CUSTOMIZATION ----------
\titleformat{\section}
  {\addtolength{\titlewidth}{2pc}\normalfont\Large\sffamily\bfseries}
  {\colorbox{MidnightBlue}{\parbox{7mm}{\strut\color{white}\hfill\thesection}}}
  {1em}{#1}
  [{\titleline*[l]{\color{MidnightBlue}\titlerule[2pt]}}]
\titleformat{\subsection}
  {\addtolength{\titlewidth}{2pc}\normalfont\large\bfseries\sffamily}
  {\colorbox{MidnightBlue}{\parbox{1cm}{\strut\color{white}\hfill\thesubsection}}}
  {1em}{#1}
  [{\titleline*[l]{\color{MidnightBlue}\titlerule[2pt]}}]

%----- CUSTOM WRAPFIGURES --------------------

% arguments for insetfiguremanual:
% width of first box (optional)
% width of second box (optional)
% alignment, c, t, or b (optional)
% text to appear in first box
% figure to appear in second box
% text to appear after figure 
\NewDocumentCommand{\insetfiguremanual}{O{0.7\textwidth}O{0.29\textwidth}O{t}O{0pt}+m+m+m}
{\begin{minipage}[#3]{#1} \parskip = \myparskiplength
#5 
\end{minipage} \hfill
\begin{minipage}[#3]{#2}
\centering
\raisebox{\dimexpr -\height + 1.5ex + #4 \relax}{#6}
#7
\end{minipage}
}

% arguments for insetfigure
% text content for first box
% figure content for second box
% text to appear after figure (optional) 
% alignment: c, t, or b (optional) 
% spacing between two boxes (optional)
\NewDocumentCommand{\insetfigure}{+m+m+O{}O{t}O{16pt}O{0pt}}{%
  \begin{lrbox}{\insetfiguresavebox}%
    #2%
  \end{lrbox}%
  \setlength{\myfigurewidth}{\wd\insetfiguresavebox}%
  \insetfiguremanual
  [\textwidth - \myfigurewidth - #5]
  [\myfigurewidth]
  [#4]
  [#6]
  {#1}
  {\usebox{\insetfiguresavebox}}
  {#3}
}
