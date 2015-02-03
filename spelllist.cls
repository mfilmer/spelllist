\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{spelllist}[2015/02/02]

% Font Size
\DeclareOption{10pt}{
  \PassOptionsToClass{\CurrentOption}{article}
}
\DeclareOption{11pt}{
  \PassOptionsToClass{\CurrentOption}{article}
}
\DeclareOption{12pt}{
  \PassOptionsToClass{\CurrentOption}{article}
}

% Paper Size
\DeclareOption{a4paper}{
  \PassOptionsToClass{\CurrentOption}{article}
}
\DeclareOption{letterpaper}{
  \PassOptionsToClass{\CurrentOption}{article}
}

% Equation Alignment
\DeclareOption{fleqn}{
  \PassOptionsToClass{\CurrentOption}{article}
}
\DeclareOption{leqno}{
  \PassOptionsToClass{\CurrentOption}{article}
}

% Title page options
\DeclareOption{titlepage}{
  \PassOptionsToClass{\CurrentOption}{article}
}
\DeclareOption{notitlepage}{
  \PassOptionsToClass{\CurrentOption}{article}
}

% Draft mode
\DeclareOption{draft}{
  \PassOptionsToClass{\CurrentOption}{article}
}

% Fallback
\DeclareOption*{
  \ClassWarning{spelllist}{Unknown option '\CurrentOption'}
}

% Default options
\ExecuteOptions{}

% Process options
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Load Base Class %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClass[twocolumn]{article}

%%%%%%%%%%%%%%%%%%%%
%%%%% Packages %%%%%
%%%%%%%%%%%%%%%%%%%%
%\RequirePackage{geometry}
\RequirePackage{tikz}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Custom Commands %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Custom Environments %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\@typesetspell{
  \begin{tikzpicture}
    \node [text width=\linewidth,fill=gray,text=white,draw=gray,inner sep=0pt,align=center] (title) at (0,0) 
    {
      \par
      \begin{minipage}{0.95\linewidth}
        \textsc{\@spellname}
      \end{minipage}
      \vspace{1ex}
    };
    
    \node [anchor=north west,draw=gray,text width=\linewidth,inner sep=0pt,align=center] at (title.south west)
    {
      \par\vspace{1ex}
      \begin{minipage}{0.95\linewidth}
        \noindent\textbf{School} \@spellschool
        
        \if@castingtime
          \noindent\textbf{Casting Time} \@castingtime
        \fi
        
        \noindent\textbf{Components}
        \if@verbal{} V\fi
        \if@somatic{} S\fi
        \if@divinefocus{} DF\fi
        \if@material{} M (\@material)\fi
        \if@focus{} F (\@focus)\fi
        
        \if@castingrange
          \noindent\textbf{Range} \@castingrange
        \fi
        
        \if@spelltarget
          \noindent\textbf{Target} \@spelltarget
        \fi
        
        \if@spellduration
          \noindent\textbf{Duration} \@spellduration
        \fi
        
        \if@savingthrow
          \noindent\textbf{Saving Throw} \@savingthrow
        \fi
        
        \begin{minipage}{\linewidth}
          \parindent=1em
          \@description
        \end{minipage}
        \vspace{-0.5ex}
      \end{minipage}
    };
  \end{tikzpicture}
}

\newenvironment{spell} 
  {
    % Spell information
    \newcommand\@spellname{}
    \newcommand\spellname[1]{\renewcommand\@spellname{##1}}
    
    \newcommand\@spellschool{}
    \newcommand\spellschool[1]{\renewcommand\@spellschool{##1}}
    
    \newif\if@castingtime
    \newcommand\@castingtime{}
    \newcommand\castingtime[1]{\renewcommand\@castingtime{##1}\@castingtimetrue}
    \newcommand\oneaction{1 standard action}
    \newcommand\oneround{1 round}
    
    \newif\if@castingrange
    \newcommand\@castingrange{}
    \newcommand\castingrange[1]
      {\renewcommand\@castingrange{##1}\@castingrangetrue}
    \newcommand\shortrange{close (25 ft. + 5 ft./2 levels)}
    \newcommand\mediumrange{medium (100 ft. + 10 ft./level)}
    \newcommand\longrange{long}
    
    \newif\if@spelltarget
    \newcommand\@spelltarget{}
    \newcommand\spelltarget[1]{\renewcommand\@spelltarget{##1}\@spelltargettrue}
    
    \newif\if@spellduration
    \newcommand\@spellduration{}
    \newcommand\spellduration[1]
      {\renewcommand\@spellduration{##1}\@spelldurationtrue}
    
    \newif\if@savingthrow
    \newcommand\@savingthrow{}
    \newcommand\savingthrow[1]{\renewcommand\@savingthrow{##1}\@savingthrowtrue}
    
    \newcommand\@description{}
    \newcommand\spelldescription[1]{\renewcommand\@description{##1}}
    
    % Spell components
    \newif\if@verbal
    \newcommand\verbal\@verbaltrue
    \newif\if@somatic
    \newcommand\somatic\@somatictrue
    \newif\if@divinefocus
    \newcommand\divinefocus\@divinefocustrue
    \newif\if@material
    \newcommand\@material{}
    \newcommand\material[1]{\renewcommand\@material{##1}\@materialtrue}
    \newif\if@focus
    \newcommand\@focus{}
    \newcommand\focus[1]{\renewcommand\@focus{##1}\@focustrue}
  }
  {\noindent\@typesetspell}
