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

\newcommand\internalscale{1.2}  % Doesn't change bounding box
\newcommand\externalscale{1.2}  % Changes bounding box
\newcommand\@drawverbal{
  \tikz[scale=\externalscale]{
    \path[use as bounding box] (-0.65ex,-0.65ex) rectangle (0.65ex,0.65ex);
    \begin{scope}[scale=\internalscale]
      \begin{scope}[scale=0.6,shift={(-0.2,0)}]
        \draw [very thick] (0,0) ++(-30:0.1) arc (-30:30:0.1);
        \draw [very thick] (0,0) ++(-30:0.2) arc (-30:30:0.2);
        \draw [very thick] (0,0) ++(-30:0.3) arc (-30:30:0.3);
      \end{scope}
    \end{scope}
  } 
}
\newcommand\@drawsomatic{
  \tikz[scale=\externalscale]{
    \path[use as bounding box] (-0.5ex,-0.65ex) rectangle (0.5ex,0.65ex);
    \begin{scope}[scale=\internalscale]
      \begin{scope}[scale=0.43,shift={(-0.125,-0.08)}]
        \draw [semithick] (0,0)
              -- (0,0.2) arc (180:0:0.025) -- (0.05,0.1)
              -- (0.05,0.25) arc (180:0:0.025) -- (0.1,0.1)
              -- (0.1,0.275) arc (180:0:0.025) -- (0.15,0.1)
              -- (0.15,0.25) arc (180:0:0.025) -- (0.2,0.025)
              -- (0.2,0.15) arc (180:0:0.025) -- (0.25,0)
              .. controls (0.25,-0.15) and (0,-0.15) .. (0,0);
      \end{scope}
    \end{scope}
  }
  %\tikz[x=1ex,y=1ex]{
  %  \begin{scope}[shift={(0.2,0.2)}]
  %  \draw [thin,white] (0,0.1)
  %        -- (0,0.5) arc (180:0:0.05) -- (0.1,0.3)
  %        -- (0.1,0.6) arc (180:0:0.05) -- (0.2,0.3)
  %        -- (0.2,0.65) arc (180:0:0.05) -- (0.3,0.3)
  %        -- (0.3,0.6) arc (180:0:0.05) -- (0.4,0.15)
  %        -- (0.4,0.4) arc (180:0:0.05) -- (0.5,0.1)
  %        .. controls (0.5,-0.2) and (0,-0.2) .. (0,0.1);
  %  \end{scope}
  %  \draw[thin,white] (0,0) rectangle (1,1);
  %}
}
\newcommand\@drawdivinefocus{
  \tikz[scale=\externalscale]{
    \path[use as bounding box] (-0.5ex,-0.65ex) rectangle (0.5ex,0.65ex);
    \begin{scope}[scale=\internalscale]
      \begin{scope}[scale=0.5,shift={(-0.15,-0.2)}]
        \fill[white,rounded corners=0.75] (0.1,0) rectangle (0.2,0.4);
        \fill[white,rounded corners=0.75] (0,0.3) rectangle (0.3,0.2);
      \end{scope}
    \end{scope}
  }
}
\newcommand\@drawfocus{
  \tikz[scale=\externalscale]{
    \path[use as bounding box] (-0.65ex,-0.65ex) rectangle (0.65ex,0.65ex);
    \begin{scope}[scale=\internalscale]
      \begin{scope}[scale=0.8]
        \filldraw[white] (0,0) circle [radius=0.025];
        \draw[white,very thick] (0,0) circle [radius=0.1];
      \end{scope}
    \end{scope}
  }
}
\newcommand\@drawmaterial{
  \tikz[scale=\externalscale]{
    \path[use as bounding box] (-0.6ex,-0.8ex) rectangle (0.6ex,0.5ex);
    \begin{scope}[scale=\internalscale]
      \begin{scope}[scale=0.5,shift={(-0.175,0.025)}]
        \draw[white,semithick] (0,0) -- (0.2,-0.2) .. controls (0.3,-0.3) and (0.4,-0.2) .. (0.3,-0.1) -- (0.1,0.1);
        \filldraw[white] (0.1,-0.1) -- (0.3,-0.1) .. controls (0.4,-0.2) and (0.3,-0.3) .. (0.2,-0.2) -- cycle;
      \end{scope}
    \end{scope}
  }
}

\newcommand\@drawluck{
  \tikz[scale=\externalscale]{
    \path[use as bounding box] (-0.6ex,-0.8ex) rectangle (0.6ex,0.5ex);
    \begin{scope}[scale=\internalscale]
      \begin{scope}[scale=0.25]
        \draw[white,line width=1,cap=round] (-0.2,0.2) .. controls (-0.6,-0.6) and (0.6,-0.6) .. (0.2,0.2);
      \end{scope}
    \end{scope}
  }
}
\newcommand\@drawtravel{
  \tikz[scale=\externalscale]{
    \path[use as bounding box] (-0.65ex,-0.65ex) rectangle (0.65ex,0.65ex);
    \begin{scope}[scale=\internalscale]
      \begin{scope}[scale=1.1,x=1ex,y=1ex]
        \draw[white,->,thick] (-0.5,-0.5) to [in=215,out=55] (0.5,0.5);
      \end{scope}
    \end{scope}
  }
}
\newcommand\@drawcleric{
  \tikz[scale=\externalscale]{
    \path[use as bounding box] (-0.65ex,-0.65ex) rectangle (0.65ex,0.65ex);
    \begin{scope}[scale=\internalscale]
      \fill[white] (0,0) ++(0:0.1) arc (270:180:0.1) arc (0:-90:0.1) arc (90:0:0.1) arc (180:90:0.1);
      \draw[white,semithick] (0,0) circle [radius=0.1];
    \end{scope}
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Custom Environments %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\@typesetspell{
  \par\noindent\begin{tikzpicture}
    \node [text width=0.97\linewidth,fill=gray,text=white] (title) at (0,0)
    {
      \textsc{\@spellname}
      \hfill
      \if@cleric\@drawcleric\fi
      \if@luck\@drawluck\fi
      \if@travel\@drawtravel\fi
      \hspace{2ex}
      \if@verbal\@drawverbal\fi
      \if@somatic\@drawsomatic\fi
      \if@divinefocus\@drawdivinefocus\fi
      \if@focus\@drawfocus\fi
      \if@material\@drawmaterial\fi
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
    \if@divinefocus{} DF\fi
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
    \newcommand\shortrange{Close (25~ft. + 5 ft./2 levels)}
    \newcommand\mediumrange{Medium (100~ft. + 10 ft./level)}
    \newcommand\longrange{Long (400~ft. + 40 ft./level)}
    
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
    \newcommand\divinefocus\@divinefocustrue
    \newif\if@material
    \newcommand\@material{}
    \newcommand\material[1]{\renewcommand\@material{##1}\@materialtrue}
    \newif\if@focus
    \newcommand\@focus{}
    \newcommand\focus[1]{\renewcommand\@focus{##1}\@focustrue}
    
    % Spell domains
    \newif\if@luck
    \newcommand\luck\@lucktrue
    \newif\if@travel
    \newcommand\travel\@traveltrue
    
    % Base cleric spells
    \newif\if@cleric
    \newcommand\cleric\@clerictrue
  }
  {\noindent\@typesetspell}
