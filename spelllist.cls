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
\ExecuteOptions{1}

% Process options
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Load Base Class %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClass{article}

%%%%%%%%%%%%%%%%%%%%
%%%%% Packages %%%%%
%%%%%%%%%%%%%%%%%%%%
\RequirePackage{geometry}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Custom Commands %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Custom Environments %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\@typesetspell{
  \@spellname
  
  \@spellschool
  
  \@castingtime
  
  %\@spellcomponents
  
  \@castingrange
  
  \@spelltarget
  
  \@spellduration
  
  %\@savingthrow
  
  %\@description
}

\newenvironment{spell}
  {
    % Spell information
    \newcommand\@spellname{}
    \newcommand\spellname[1]{\renewcommand\@spellname{##1}}
    
    \newcommand\@spellschool{}
    \newcommand\spellschool[1]{\renewcommand\@spellschool{##1}}
    
    \newcommand\@castingtime{}
    \newcommand\castingtime[1]{\renewcommand\@castingtime{##1}}
    \newcommand\oneaction{1 standard action}
    \newcommand\oneround{1 round}
    
    \newcommand\@castingrange{}
    \newcommand\castingrange[1]{\renewcommand\@castingrange{##1}}
    \newcommand\shortrange{short}
    \newcommand\mediumrange{medium (100 ft. + 10 ft./level)}
    \newcommand\longrange{long}
    
    \newcommand\@spelltarget{}
    \newcommand\spelltarget[1]{\renewcommand\@spelltarget{##1}}
    
    \newcommand\@spellduration{}
    \newcommand\spellduration[1]{\renewcommand\@spellduration{##1}}
    
    % Spell components
    \newif\ifverbal
    \newif\ifsomatic
    \newif\ifdivinefocus
    \newif\ifmaterial
    \newcommand\@material{}
    \newcommand\material[1]{\renewcommand\@material{##1}\materialtrue}
    \newif\iffocus
    \newcommand\@focus{}
    \newcommand\focus[1]{\renewcommand\@focus{##1}\focustrue}
  }
  {\@typesetspell}
