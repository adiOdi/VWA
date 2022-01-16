\def\fileversion{0.0.1}
\def\filedate{2018/10/21}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vwa}[\filedate\space Version \fileversion\space by Manuel Menzinger]

\LoadClass[
    fontsize=12pt,
    bibliography=totoc,
    open=right,
    parskip=half
]{scrbook} % based on KOMA-Script book class
\RequirePackage[utf8]{inputenc} % enable special characters like ü,ö,ä,ß,...
\RequirePackage[T1]{fontenc} % for correct encoding in PDF documents
\RequirePackage{ae,aecompl} % for better quality of fonts in PDS documents
\RequirePackage[automark]{scrlayer-scrpage} % for auto generated headings
\RequirePackage{graphicx} % to include graphics
\RequirePackage[usenames,dvipsnames,hyperref]{xcolor}
\usepackage{multicol}

\setlength{\marginparwidth}{0pt}
\setlength{\hoffset}{25pt}

\RequirePackage[
    %%% general options
    pdftex=true,      %% sets up hyperref for use with the pdftex program
    %plainpages=false, %% set it to false, if pdflatex complains: ``destination with same identifier already exists''
    %
    %%% extension options
    backref,      %% adds a backlink text to the end of each item in the bibliography
    pagebackref=false, %% if true, creates backward references as a list of page numbers in the bibliography
    colorlinks=true,   %% turn on colored links (true is better for on-screen reading, false is better for printout versions)
    %
    %%% PDF-specific display options
    bookmarks=true,          %% if true, generate PDF bookmarks (requires two passes of pdflatex)
    bookmarksopen=false,     %% if true, show all PDF bookmarks expanded
    bookmarksnumbered=false, %% if true, add the section numbers to the bookmarks
    %pdfstartpage={1},        %% determines, on which page the PDF file is opened
    pdfpagemode=None         %% None, UseOutlines (=show bookmarks), UseThumbs (show thumbnails), FullScreen
]{hyperref}

% PDF settings
\hypersetup{
    pdftitle={\@title},
    pdfauthor={\@author},
    pdfsubject={},
    pdfcreator={Accomplished with LaTeX2e and pdfLaTeX with hyperref-package.},
    pdfproducer={},
    pdfkeywords={},
    urlcolor=Black,
    linkcolor=Black,
    citecolor=Black,
    anchorcolor=Black,
    colorlinks=true % true to prevent ugly borders
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% \mymaketitle
%%
%% Creates a title page using \title (mandatory!), \author, \subtitle and \date if set before.
%%
%% example:
%%	\title{The Life of a Jedi}
%%	\subtitle{Beyond the Force}
%%	\author{Luke Skywalker}
%%	\date{34 ABY}
%%	\mymaketitle
%%
\newcommand{\mymaketitle}{
    \begin{titlepage}
        \begin{multicols}{2}             
            KLEX\\Klusemann Extern\\Marschallgasse 19-21\\A-8020 Graz\\


            \hfill\includegraphics[height=2.5cm]{figures/KLex-Logo.png}
        \end{multicols}
        \vfill
        \par
        \centering
        \LARGE \@title \par
        \@ifundefined{@subtitle}{}
        { % else
            \Large \@subtitle \par
        }
        \@ifundefined{@author}{}
        { % else
            \vspace{1cm}
            \large Vorwissenschaftliche Arbeit\\vorgelegt von \@author \par
        }
        \large BetreuerIn: Manuel Menzinger \par
        \@ifundefined{@date}{}
        { % else
            \vspace{1cm}
            \Large Schuljahr \@date
        }
        \vfill
    \end{titlepage}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% \myfigure{file}{scale}{caption}{label}
%%	file: filename with local path
%%	scale: 0.0 - 1.0 percent of textwidth
%%	caption: description below
%%	label: label for referencing
%%
%% example:
%%	\myfigure{figures/deathstar.png}{0.8}{Plan of the original deathstar}{fig:deathstar}
%%
\newcommand{\myfigure}[5]{
    \begin{figure}[h!]
          \centering
          \includegraphics[keepaspectratio,#2]{#1}
          \caption[#4]{#3}
          \label{#5} %% NOTE: always label *after* caption!
    \end{figure}
}