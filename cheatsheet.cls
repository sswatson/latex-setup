\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cheatsheet}[2018/12/25 cheatsheet class]

\LoadClassWithOptions{worksheet}

\RequirePackage{multicol, lipsum}
\RequirePackage[fontsize=6pt]{scrextend} 
\hypersetup{colorlinks=false} 
\geometry{landscape,top=0.25in}

\RequirePackage{eso-pic, rotating}

\setmainfont[BoldFont=texgyrepagella-bold.otf,
             ItalicFont     = texgyrepagella-italic.otf ,
             BoldItalicFont = texgyrepagella-bolditalic.otf ]{TeX Gyre Pagella} 

\def\framecolor{MidnightBlue!75!white}
\def\bgcolor{softblue} 
	     
\DeclareRobustCommand{\myenumbox}[4]{\tikz[baseline=-0.65ex]
  \node[
  minimum width = 7pt, 
  inner sep=1.3pt,
  draw=#1,
  fill=#2,
  text=#3,
  rounded corners=1pt]{\small \bf \fontspec{American Typewriter Bold} #4};}

 \NewTCBListing{julblock}{O{}}{
    minted language = julia,
    listing only,
    colback = \bgcolor,
    colframe = \bgcolor,
    top = 0pt,
    bottom = 0pt, 
    before skip = 0pt,
    after skip = 0pt, 
    minted options={autogobble},
    #1
  }

 \NewTCBListing{Rblock}{O{}}{
   minted language = R,
   listing only,
   colback = \bgcolor,
   colframe = \bgcolor, 
   top = 0pt,
   bottom = 0pt, 
   before skip = 0pt,
   after skip = 0pt, 
   minted options={autogobble},
   #1
 }

 \NewTCBListing{python}{O{}}{
   minted language = python,
   listing only,
   colback = \bgcolor,
   colframe = \bgcolor, 
   top = 0pt,
   bottom = 0pt, 
   left = -4pt, 
   before skip = 0pt,
   after skip = 0pt, 
   minted options={autogobble},
   #1
   }

 \NewTColorBox{minimalbox}{O{}}{
   colback = \bgcolor,
   colframe = \bgcolor,
   top = 0pt,
   bottom = 0pt, 
   before skip = 0pt,
   after skip = 0pt,
   #1
 }

\newcommand{\jul}[1]{\mintinline{julia}{#1}}

\setlist[enumerate]{label=(\roman*),itemsep=2pt} 
\setlist[enumerate,1]{leftmargin=12pt}
\setlist[enumerate,2]{label=\arabic*.}
\setlist[enumerate,3]{label=(\arabic*)}

\newcounter{boxcounter}
\setcounter{boxcounter}{1}

\newcommand{\itembox}[1][\theboxcounter]{%
  \stepcounter{boxcounter}%
  \myenumbox{MidnightBlue}%
  {\framecolor}%
  {\bgcolor}%
  {#1}\hspace{2.5pt}%
}

\newtcolorbox{panel}[2][]{title={\fontspec{American Typewriter Bold}
    #2},
  colback = \bgcolor,
  colframe = \framecolor,
  breakable,
  left = 2mm,
  right = 2mm,
  boxsep = 0.5pt,
  before upper = {%
    \setcounter{boxcounter}{0}%
    \parskip = \myparskiplength%
    \parindent = \myparindentlength%
  }, 
  enhanced,
  drop fuzzy shadow,
  #1}

\newcommand\setpaneltheme[2]{%
  \def\framecolor{#1}
  \def\bgcolor{#2}%
}

\newcommand\panelthemeblue{\setpaneltheme{MidnightBlue!75!white}{softblue}}
\newcommand\panelthemepurple{\setpaneltheme{Purple!75!black}{Purple!5!white}}
\newcommand\panelthemegreen{\setpaneltheme{SeaGreen}{softseagreen}}
\newcommand\panelthemered{\setpaneltheme{DarkRed!75!white}{softred}}
\newcommand\panelthemeyellow{\setpaneltheme{yellow!40!black}{softyellow}}

\newcommand{\addsideinfo}[1]{%
\AddToShipoutPicture{\put(10,215){\rotatebox{90}{%
      \scalebox{1.2}{\tcbox[boxrule = 0.2pt,
        top=0mm,bottom=0mm,left=0mm,right=0mm]{\fontspec{Augie}
 	    \color{gray} #1}}}}}}

\newenvironment{sidebyside}{\begin{tcbraster}[raster columns = 2, top = 0mm, bottom = 0mm,
    raster before skip = 0mm, raster after skip = 0mm, left = 0mm, raster valign = top]}{\end{tcbraster}}