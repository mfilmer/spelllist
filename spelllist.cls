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
% These draw commands assume you are already in a tikzpicture
\newcommand\@drawverbal{
  \tikz{
    \draw [very thick] (0,0) ++(-30:0.1) arc (-30:30:0.1);
    \draw [very thick] (0,0) ++(-30:0.2) arc (-30:30:0.2);
    \draw [very thick] (0,0) ++(-30:0.3) arc (-30:30:0.3);
  } 
}
\newcommand\@drawsomatic{}
\newcommand\@drawdivinefocus{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Custom Environments %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\@typesetspell{
  \par\noindent\begin{tikzpicture}
    \node [text width=0.97\linewidth,fill=gray,text=white] (title) at (0,0)
    {
      \textsc{\@spellname}
      \hfill
      \if@verbal\@drawverbal\fi
      \if@somatic\@drawsomatic\fi
      \if@divinefocus\@drawdivinefocus\fi
    };
  \end{tikzpicture}
  
  \vspace{-2.5ex}
  \begin{flushleft}
    \noindent\textbf{School} \@spellschool
    
    \if@castingtime
      \noindent\textbf{Casting Time} \@castingtime
    \fi
    
    \noindent\textbf{Components}
    \if@verbal{} V\fi
    \if@somatic{} S\fi
    \if@divinefocus{} DF \@divinefocus\fi
    \if@material{} M (\@material)\fi
    \if@focus{} F (\@focus)\fi
    
    \if@castingrange
      \noindent\textbf{Range} \@castingrange
    \fi
    
    \if@spellarea
      \noindent\textbf{Area} \@spellarea
    \fi
    
    \if@spelleffect
      \noindent\textbf{Effect} \@spelleffect
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
    
    \if@spellresist
      \noindent\textbf{Spell Resist} \@spellresist
    \fi
  \end{flushleft}
  \vspace{-2ex}
  
  \@description
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
    \newcommand\shortrange{close (25~ft. + 5 ft./2 levels)}
    \newcommand\mediumrange{medium (100~ft. + 10 ft./level)}
    \newcommand\longrange{long (400~ft. + 40 ft./level)}
    
    \newif\if@spellarea
    \newcommand\@spellarea{}
    \newcommand\spellarea[1]
      {\renewcommand\@spellarea{##1}\@spellareatrue}
    
    \newif\if@spelleffect
    \newcommand\@spelleffect{}
    \newcommand\spelleffect[1]
      {\renewcommand\@spelleffect{##1}\@spelleffecttrue}
    
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
    
    \newif\if@spellresist
    \newcommand\@spellresist{}
    \newcommand\resistno{\renewcommand\@spellresist{No}\@spellresisttrue}
    \newcommand\resistyes{\renewcommand\@spellresist{Yes}\@spellresisttrue}
    
    \newcommand\@description{}
    \newcommand\spelldescription[1]{\renewcommand\@description{##1}}
    
    % Spell components
    \newif\if@verbal
    \newcommand\verbal\@verbaltrue
    \newif\if@somatic
    \newcommand\somatic\@somatictrue
    \newif\if@divinefocus
    \newcommand\@divinefocus{}
    \newcommand\divinefocus[1]{\renewcommand\@divinefocus{##1}\@divinefocustrue}
    \newif\if@material
    \newcommand\@material{}
    \newcommand\material[1]{\renewcommand\@material{##1}\@materialtrue}
    \newif\if@focus
    \newcommand\@focus{}
    \newcommand\focus[1]{\renewcommand\@focus{##1}\@focustrue}
  }
  {\noindent\@typesetspell}
