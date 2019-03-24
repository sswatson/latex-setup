
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{worksheet}[2017/04/30 worksheet class]

\LoadClassWithOptions{article}

%--OPTIONS-----------------------------------------------
% asy -- for including asymptote code in
%        \begin{asy} ... \end{asy} environment
% julia -- for use of julia code, via \jltex{...} or \begin{jlcode}...\end{jlcode} 
% solutions -- include content in solution environments 
% unbreakable -- to stop boxes from automatically splitting across pages
% normalmargins -- use margins which are wider than the default
%                  narrow ones
%--------------------------------------------------------
\newif\if@asyoption
\DeclareOption{asy}{\@asyoptiontrue}
\newif\if@juliaoption
\DeclareOption{julia}{\@juliaoptiontrue}
\newif\if@jlminoption
\DeclareOption{jlmin}{\@jlminoptiontrue}
\newif\if@solutionoption
\DeclareOption{solutions}{\@solutionoptiontrue}
\newif\if@unbreakableoption
\DeclareOption{unbreakable}{\@unbreakableoptiontrue}
\newif\if@prettycodeoption
\DeclareOption{prettycode}{\@prettycodeoptiontrue}
\newif\if@shellescapeoption
\DeclareOption{shellescape}{\@shellescapeoptiontrue}
\newif\if@normalmarginsoption
\DeclareOption{normalmargins}{\@normalmarginsoptiontrue}
\newif\if@nocoloroption
\DeclareOption{nocolor}{\@nocoloroptiontrue}
\ProcessOptions


%--LOADING PACKAGES------------------------------
\RequirePackage[svgnames]{xcolor} % colors
\RequirePackage{xparse} % for optional arguments
\RequirePackage[margin=0.5in]{geometry} % set margins
\RequirePackage{iftex}
\if@normalmarginsoption \geometry{margin=1in,marginpar=0.5in,marginparsep=2.6mm} \fi 
\RequirePackage{graphicx} % include figures
\if@asyoption
  \RequirePackage{asysettings}
\fi % include figures from asy source
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\if@juliaoption \RequirePackage{juliatex} \fi
\if@jlminoption \RequirePackage[minimal]{juliatex} \fi
\ifLuaTeX \else \RequirePackage{colonequals} \fi % for the symbols := and =: 
\RequirePackage{bm} % bold math symbols
\RequirePackage[shortlabels]{enumitem} % customizing enumerate environments
\RequirePackage{url} % proper typesetting of links
\RequirePackage{hyperref} % internal links
% for resetting counters per section, etc.
% this is included in the latest version of LaTeX 
\@ifundefined{counterwithout}{\RequirePackage{chngcntr}}{}


% % -- My Personal Packages -------------------------------------
\RequirePackage{graphicx} 
\RequirePackage{insetfigure}
\RequirePackage{repeat}
\if@prettycodeoption
  \newcommand{\prettycode}{prettycode} 
\else
  \newcommand{\prettycode}{} 
\fi
\if@shellescapeoption
  \newcommand{\shellescapeopt}{shellescape} 
\else
  \newcommand{\shellescapeopt}{} 
\fi
\if@unbreakableoption
  \newcommand{\breakable}{} 
\else
  \newcommand{\breakable}{breakable} 
\fi
\RequirePackage[\prettycode,\shellescapeopt,\breakable]{codeboxes}
\RequirePackage{sidenotes}
\RequirePackage{enumboxes}
\if@solutionoption
  \newcommand{\solutions}{solutions}
\else
  \newcommand{\solutions}{}
\fi
\if@nocoloroption
  \newcommand{\nocolor}{nocolor}
\else
  \newcommand{\nocolor}{}
\fi
\RequirePackage[\solutions,\nocolor]{testboxes}
\RequirePackage{mathmacros}
\RequirePackage{hiding} 
\RequirePackage{sectionheadings}

% % for equation numbering within each problem
\renewcommand{\theequation}{\theitm.\arabic{equation}}

% --SETTINGS-----------------------------------------

\@ifundefined{myparskiplength}{
  \newlength{\myparskiplength}
  \setlength{\myparskiplength}{3.6pt}
}{}
\@ifundefined{myparindentlength}{
  \newlength{\myparindentlength}
  \setlength{\myparindentlength}{0pt}
}{}

\parindent = \myparindentlength
\parskip   = \myparskiplength

\pagestyle{empty}

% ----POINTS-----------------------------------------
\ifLuaTeX
\directlua{POINTS = 0}
\newcommand{\points}[1]{\directlua{POINTS = POINTS + #1}#1 points}
\newcommand{\totalpoints}{\directlua{tex.sprint(POINTS)}}
\fi

% ----FONTS------------------------------------------
\RequirePackage{newunicodechar}
\RequirePackage{giambattista}
\ifLuaTeX
  \setmainfont{TeX Gyre Pagella}
  \setsansfont{Latin Modern Sans}
  \setmonofont[Scale=0.8,Ligatures=NoCommon]{Cavalcade Mono}
%  \newfontfamily{\alternatesansfont}{DejaVu Sans Mono}
%  \newunicodechar{≠}{{\alternatesansfont ≠}}
%  \newunicodechar{∇}{{\alternatesansfont ∇}}
\fi