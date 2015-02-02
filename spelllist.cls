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
  \ClassWarning{ritthesis}{Unknown option '\CurrentOption'}
}

% Default options
\ExecuteOptions{12pt,oneside,doublespacing,singlespacebib}

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
