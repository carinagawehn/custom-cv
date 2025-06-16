\LoadClass{article}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{customcv}[2025/06/16 Custom CV Class]

\RequirePackage{titlesec}
\RequirePackage{xparse}
\RequirePackage{expl3}
\RequirePackage{fontawesome5}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{xstring}
\RequirePackage[x11names]{xcolor}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}

% Styling %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\faStyle{regular}

\colorlet{PrimaryColor}{black}
\newcommand{\primary}[1]{
  \colorlet{PrimaryColor}{#1}
}
\RequirePackage[margin=2cm]{geometry}

\setlength{\parindent}{0pt} % otherwise entries are shifted
\setlist[itemize]{noitemsep, topsep=0pt} % remove spacing before itemize

\hyphenpenalty 9000 % use less word breakings

% Header %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ExplSyntaxOn
\NewDocumentCommand{\makecontactheader}{m}
{
  \centerline{\color{PrimaryColor} \Huge\textbf{\@author}}
  \bigskip

  {\color{PrimaryColor}{
    \begin{center}
    \clist_map_inline:nn{ #1 }
    {
      \mbox{##1} \ 
    }
    \end{center}
  }}
}
\ExplSyntaxOff

% Header Icons
\newcommand{\location}[1]{
  \faMapMarker*{}~#1
}

\newcommand{\mail}[1]{
  \href{mailto:#1}{\faEnvelope{}~#1}
}

\newcommand{\linkedin}[1]{
  \href{https://www.linkedin.com/in/#1}{\faLinkedinIn{}~#1}
}

\newcommand{\phone}[1]{
  \faPhone*{}~#1
}

\newcommand{\github}[1]{
  \href{https://www.github.com/#1}{\faGithub{}~#1}
}

\newcommand{\birthday}[1]{
  \faBirthdayCake{}~#1
}

% Footer %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pagestyle{fancy}
\fancyfoot[L]{Zuletzt aktualisiert am \@date}
\fancyfoot[C]{}
\fancyfoot[R]{\thepage}
% remove header from this packages default
\renewcommand{\headrulewidth}{0pt}
\fancyhead{}

% Format Section Headers %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\titleformat{\section}
  {\color{PrimaryColor} \Large\bfseries\scshape\raggedright}
  {}{0em}
  {}
  [\titlerule]


% Entries %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Education
\newcommand{\eduentry}[5]{
  \renewcommand{\arraystretch}{0.5}
  \begin{tabular}{p{2cm} p{11cm} p{4cm}}
    \textbf{#1} & \textbf{#2}, #3 & {#4} \\
                & #5 & \\
  \end{tabular}
  \medskip
}

% Experience
\newcommand{\expentry}[4]{
  \renewcommand{\arraystretch}{0.5}
  \begin{tabular}{p{13.5cm} p{4cm}}
    \textbf{#1}, #2 & {#3} \\
    #4 & \\
  \end{tabular}
  \medskip
}

% Normal entry with bold keyword
\newcommand{\entry}[2]{
  \textbf{#1} \  #2
  \smallskip
}
