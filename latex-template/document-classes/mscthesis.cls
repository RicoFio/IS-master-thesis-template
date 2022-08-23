%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mscthesis.cls
% Thesis document definition adapted from multiple 
% sources (ACM, ETH DISCO thesis) for the use of Univesity of Amsterdam
% Information Science and Data Science students
% Adapted by Riccardo Fiorista (riccardo.fiorista@proton.me)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{mscthesis}
              [2022/08/31 Modified from the ACM paper definition by Riccardo Fiorista]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LOAD PACKAGES AND DEFINE ADDITIONAL COMMANDS
% Modified from ETH Zurich DISCO Thesis Template
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtEndOfClass{
% \RequirePackage{titling}

\RequirePackage{amsmath}
\RequirePackage{amsthm}
% Clashes with the updated package in the ACM class
% \RequirePackage{amssymb}
\RequirePackage{setspace}
\RequirePackage{booktabs}
\RequirePackage[title]{appendix}

% GANNT Charts
\RequirePackage{pgfgantt}


% Define mathematical commands
%% Define variable representing a matrix
\usepackage{bm}
\newcommand{\matvar}[1]{\bm{\mathit{#1}}}

%% Define math-styled operator for argmax optimization
\DeclareMathOperator*{\argmax}{argmax} % thin space, limits underneath in displays

%% Theorem, lemmas, and more ...
\theoremstyle{plain}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{observation}[theorem]{Observation}

\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{problem}[theorem]{Problem}
\newtheorem{assumption}[theorem]{Assumption}
\newtheorem{example}[theorem]{Example}

\theoremstyle{remark}
\newtheorem{claim}[theorem]{Claim}
\newtheorem{remark}[theorem]{Remark}

% Enables the use of colours
\RequirePackage{xcolor}
\definecolor{darkblue}{rgb}{0,0,.5}

% Enables clickable links in the PDF and additional PDF specific configuration options.
\PassOptionsToPackage{
    colorlinks=true,
    linkcolor=darkblue, 
    urlcolor=darkblue, 
    citecolor=darkblue,
    raiselinks=true,
    bookmarks=true,
    bookmarksopenlevel=1,
    bookmarksopen=true,
    bookmarksnumbered=true,
    hyperindex=true,
    plainpages=false,
    pdfpagelabels=true,
    pdfstartview=FitH,
    pdfstartpage=1,
    pdfpagelayout=OneColumn
}{hyperref}

% Allows to use nice todo notes on the paper margin
\RequirePackage{todonotes}

% Allows line numbering
\RequirePackage{lineno}
\iflinenumbering
    \linenumbers
\fi

\RequirePackage{flushend}
\RequirePackage{balance}

% Additional packages
\newcommand\xst{\textsuperscript{st}}
\newcommand\xnd{\textsuperscript{nd}}
\newcommand\xrd{\textsuperscript{rd}}
\newcommand\xth{\textsuperscript{th}}

\newcommand{\citein}[1]{\citeauthor{#1} in \cite{#1}}

\usepackage[english]{babel}
\usepackage{chronology}
\usepackage{graphicx}
\usepackage{subcaption}
\usepackage{xspace}
\usepackage{tabularx}

% Code listings for pseudo code
\usepackage{algorithm2e}
\SetKwComment{Comment}{/* }{ */}
\RestyleAlgo{ruled}
\usepackage{algpseudocode}

\usepackage{listings}
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}
\lstdefinestyle{mystyle}{
    backgroundcolor=\color{backcolour},   
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=b,                    
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2
}
\lstset{style=mystyle}

\addto\extrasenglish{
    \def\sectionautorefname{Section}
    \def\subsectionautorefname{Section}
    \def\subsubsectionautorefname{Section}
}

% Defines to specific todo commands
\setlength{\marginparwidth}{3cm}
\newcommand{\TODO}[1]
{\todo[prepend, caption={\textbf{Todo}}, size=\footnotesize]{\renewcommand{\baselinestretch}{0.85} \selectfont#1\par}}
\newcommand{\REMARK}[1]
{\todo[prepend, color=green, caption={\textbf{Remark}}, size=\footnotesize]{\renewcommand{\baselinestretch}{0.85} \selectfont#1\par}}

% Suppresses ACM-specific content
\settopmatter{printacmref=false}
\renewcommand\footnotetextcopyrightpermission[1]{} 
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DECLARE DATA COMMANDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Thesis data
% `title` and `keywords` are already defined
\newcommand\thesistype{\@empty}
\newcommand\thesiskeywords[1]{\keywords{#1}\gdef\@thesiskeywords{#1}}
\newcommand\thesistitle[1]{\title{#1}\gdef\@thesistitle{#1}}
\newcommand\thesissubtitle[1]{\subtitle{#1}\gdef\@thesissubtitle{#1}}
\newcommand\thesisdate[1]{\title{#1}\gdef\@thesisdate{#1}}

% Titlepage data

% Student data
% \newcommand{\@cost}[1]{\def\cost{#1}}
% \@cost{400}
\newcommand\authorname[1]{\author{#1}\gdef \@authorname{#1}}
\newcommand\authorid[1]{\gdef \@authorid{#1}}
\newcommand\authoremail[1]{\email{#1}\gdef \@authoremail{\href{mailto:#1}{#1}}}

% Supervisor data
\newcommand\firstsupervisorname[1]{\gdef\@firstsupervisorname{#1}}
\newcommand\firstsupervisoraffiliation[1]{\gdef\@firstsupervisoraffiliation{#1}}
\newcommand\firstsupervisoremail[1]{\gdef\@firstsupervisoremail{\href{mailto:#1}{#1}}}

\newcommand\externalsupervisorname[1]{\gdef\@externalsupervisorname{#1}}
\newcommand\externalsupervisoraffiliation[1]{\gdef\@externalsupervisoraffiliation{#1}}
\newcommand\externalsupervisoremail[1]{\gdef\@externalsupervisoremail{\href{mailto:#1}{#1}}}

\newcommand\examinername[1]{\gdef\@examinername{#1}}
\newcommand\examineraffiliation[1]{\gdef\@examineraffiliation{#1}}
\newcommand\examineremail[1]{\gdef\@examineremail{\href{mailto:#1}{#1}}}

% Institutional data
\def\thesisdegree{Master Information Studies}
\def\thesisfaculty{Faculty of Science}
\def\thesisinstitution{University of Amsterdam}
\def\thesiscity{Amsterdam}
\def\thesiscountry{The Netherlands}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DECLARE HELPER VARIABLES AND COMMANDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\informationstudies{is}
\def\datascience{ds}

\newif\iflinenumbering
\linenumberingtrue
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DECLARE OPTIONS FOR IS AND DS STYLES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption{is}{\renewcommand\thesistype{is}}
\DeclareOption{ds}{\renewcommand\thesistype{ds}}
\DeclareOption{nolinenumbering}{\linenumberingfalse}

% Catch all options that are not defined here and send them over to the base-class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}[sigconf]{acmart}}

\ProcessOptions\relax
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DECLARE OPTIONS FOR IS AND DS STYLES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\maketitlepage{

    \begin{titlepage}%
        \begin{center}
         
        \textsc{\Huge \@title \\[4px] \Large \@subtitle}
        
        \vfill
        
        \textsc{%
            \large
            submitted in partial fulfillment for the degree of master of science\\
            %
            \bigskip
            %
            \@authorname\\
            %
            \@authorid\\
            %
            \bigskip
            \thesisdegree\\
            %
            \ifthenelse{\equal{\thesistype}{\datascience}}{data science}{information systems}\\
            %
            \thesisfaculty\\
            %
            \thesisinstitution\\
            %
            \bigskip
            Submitted on \Large \@date
        }
        
        \end{center}
         
        \vfill
        
        % \begin{center}
        % \includegraphics[height=.4\textheight]{TitlePages/logos/cover.jpeg} %width=\linewidth
        % \end{center}
        
        \vfill

        \ifx\@externalsupervisorname\undefined
            \begin{center}
            \begin{tabular}{|l||ll|}
            \hline
            {}                      & \textbf{Internal Supervisor}  & \textbf{Examiner}     \\   
            \hline
            \textbf{Title, Name}    & \@firstsupervisorname         & \@examinername        \\
            \textbf{Affiliation}    & \@firstsupervisoraffiliation  & \@examineraffiliation \\ 
            \textbf{Email}          & \@firstsupervisoremail        & \@examineremail       \\
            \hline
            \end{tabular}
            \end{center}
        \else
            \begin{center}
            \begin{tabular}{|l||lll|}
            \hline
            {}                      & \textbf{Internal Supervisor}  & \textbf{External Supervisor}  & \textbf{Examiner}     \\   
            \hline
            \textbf{Title, Name}    & \@firstsupervisorname         & \@externalsupervisorname        & \@examinername        \\
            \textbf{Affiliation}    & \@firstsupervisoraffiliation  & \@externalsupervisoraffiliation & \@examineraffiliation \\ 
            \textbf{Email}          & \@firstsupervisoremail        & \@externalsupervisoremail       & \@examineremail       \\
            \hline
            \end{tabular}
            \end{center}
        \fi
        
        \vfill
        
        % logos
        \begin{center}
        \mbox{\includegraphics[width=.1\paperwidth]{media/titlepage/logo-uva.png} 
        % \includegraphics[width=.2\paperwidth]{TitlePages/logos/ads.png}
        % \includegraphics[width=.2\paperwidth]{TitlePages/logos/ads.png} % replace by the logo of your internship company or remove
        }
        \end{center}
        
  \end{titlepage}

  % \setcounter{footnote}{0}%
  % \global\let\maketitle\relax
  % \global\let\thanks\relax
  % \global\let\@thanks\@empty
  % \global\let\title\relax
  % \global\let\@title\@empty
  % \global\let\author\relax
  % \global\let\@author\@empty
  % \global\let\date\relax
  % \global\let\@date\relax
  % \global\let\and\relax
  % \global\let\logo\relax
  % \global\let\@logo\relax
  % \global\let\email\relax
  % \global\let\@email\relax
  % \global\let\institute\relax
  % \global\let\@institute\relax
  % \global\let\supervisors\relax
  % \global\let\@supervisors\relax
  % \global\let\thesistype\relax
  % \global\let\@thesistype\relax
}

% Patch for lineno to work with the AmsMath environments from https://latex.org/forum/viewtopic.php?t=163
\newcommand*\patchAmsMathEnvironmentForLineno[1]{%
  \expandafter\let\csname old#1\expandafter\endcsname\csname #1\endcsname
  \expandafter\let\csname oldend#1\expandafter\endcsname\csname end#1\endcsname
  \renewenvironment{#1}%
     {\linenomath\csname old#1\endcsname}%
     {\csname oldend#1\endcsname\endlinenomath}}% 
\newcommand*\patchBothAmsMathEnvironmentsForLineno[1]{%
  \patchAmsMathEnvironmentForLineno{#1}%
  \patchAmsMathEnvironmentForLineno{#1*}}%
\AtBeginDocument{%
\patchBothAmsMathEnvironmentsForLineno{equation}%
\patchBothAmsMathEnvironmentsForLineno{align}%
\patchBothAmsMathEnvironmentsForLineno{flalign}%
\patchBothAmsMathEnvironmentsForLineno{alignat}%
\patchBothAmsMathEnvironmentsForLineno{gather}%
\patchBothAmsMathEnvironmentsForLineno{multline}%
}

% Weird formatting error with lineno when linenumbering is enabled -> it adds an empty page
% after the title page. With this command we account for that
\newcommand\fixemptypage{
    \iflinenumbering
        \AtBeginShipoutNext{\AtBeginShipoutDiscard}
    \fi
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[sigconf, screen=true, review=false, twocolumn]{acmart}
