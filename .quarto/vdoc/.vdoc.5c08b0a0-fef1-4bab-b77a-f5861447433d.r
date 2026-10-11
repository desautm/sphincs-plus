#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| label: setup-r
#| output: false
library("reticulate")
use_python("C:/Users/mdesautels/AppData/Local/Programs/Python/Python313/python.exe", required = TRUE)
py_require("pandas")
py_require("IPython")
py_config()
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-width: 5
#| label: "cryptographie-symetrique"
#| cache: true

\usetikzlibrary{positioning}
\begin{tikzpicture}[
    node distance=2.5cm,
    personnes/.style={font=\Large},
    crypto/.style={draw, rectangle, align=center, minimum width=2.5cm, minimum height=1cm, font=\Large},
    arrow/.style={->, very thick}
]

\newcommand{\cle}[2]{
\begin{scope}[scale=#2]
\draw[very thick,fill=#1] (0,0)--++(4,0)--++(0,-0.5)--++(-0.5,0)--++(0,-1)--++(-0.5,0)--++(0,0.5)--++(-0.5,0)--++(0,-0.5)--++(-0.5,0)--++(0,1)--++(-2,0);
\draw[very thick,fill=#1] (0,0) arc(30:330:1) --++ (0,0.5);
\end{scope}
}

% Noeuds
\node[crypto,fill=blue!40!white] (message) {\textbf{Allo}\\\textbf{Alice}};
\node[personnes] (bob) [above=0.5cm of message] {\textbf{Bob}};
\node[crypto,fill=yellow!40!white] (chiffrement) [right=1cm of message] {\textbf{Chiffrement}};
\node[crypto,fill=green!40!white] (chiffre) [below=1cm of chiffrement] {\textbf{03XYTAB1}\\\textbf{85F6E7D4}};
\node[crypto,fill=yellow!40!white] (dechiffrement) [below=2cm of chiffre] {\textbf{Déchiffrement}};
\node[crypto,fill=blue!40!white] (message2) [below=4cm of message] {\textbf{Allo}\\\textbf{Alice}};
\node[personnes] (alice) [above=0.5cm of message2] {\textbf{Alice}};

\node (A) [above left=0.2cm and 0.5cm of alice] {};
\node (B) [right=7cm of A] {};
\draw[very thick] (A)--(B);

% % Flèches principales
\draw[arrow] (message) -- (chiffrement);
\draw[arrow] (chiffrement) -- (chiffre);
\draw[arrow] (chiffre) -- (dechiffrement);
\draw[arrow] (dechiffrement) -- (message2);

% \cle{15}{-3.75}{green}{0.5}
\node (cle) at (8,-2.25) {
\begin{tikzpicture}
\cle{green}{0.5}
\end{tikzpicture}
};
\node[personnes] (cle2) [above=0.15cm of cle] {\textbf{Clé secrète}};

% % Flèches clés
\draw[arrow] (cle.north west) -- (chiffrement.south east);
\draw[arrow] (cle.south west) -- (dechiffrement.north east);

\end{tikzpicture}
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-width: 5
#| label: "cryptographie-asymetrique"
#| cache: true
#| 
\usetikzlibrary{positioning}
\begin{tikzpicture}[
    node distance=2.5cm,
    personnes/.style={font=\Large},
    crypto/.style={draw, rectangle, align=center, minimum width=2.5cm, minimum height=1cm, font=\Large},
    arrow/.style={->, very thick}
]

\newcommand{\clepublique}[2]{
\begin{scope}[scale=#2]
\draw[very thick,fill=#1] (0,0)--++(4,0)--++(0,-0.5)--++(-0.5,0)--++(0,-1)--++(-0.5,0)--++(0,0.5)--++(-0.5,0)--++(0,-0.5)--++(-0.5,0)--++(0,1)--++(-2,0);
\draw[very thick,fill=#1] (0,0) arc(30:330:1) --++ (0,0.5);
\end{scope}
}

\newcommand{\cleprivee}[2]{
\begin{scope}[scale=#2]
\draw[very thick,fill=#1] (0,0)--++(4,0)--++(0,-0.5)--++(-0.5,0)--++(0,-0.5)--++(-0.5,0)--++(0,-0.5)--++(-0.5,0)--++(0,0.5)--++(-0.5,0)--++(0,0.5)--++(-2,0);
\draw[very thick,fill=#1] (0,0) arc(30:330:1) --++ (0,0.5);
\end{scope}
}

% Noeuds
\node[crypto,fill=blue!40!white] (message) {\textbf{Allo}\\\textbf{Alice}};
\node[personnes] (bob) [above=0.5cm of message] {\textbf{Bob}};
\node[crypto,fill=yellow!40!white] (chiffrement) [right=1cm of message] {\textbf{Chiffrement}};
\node[crypto,fill=green!40!white] (chiffre) [below=1cm of chiffrement] {\textbf{03XYTAB1}\\\textbf{85F6E7D4}};
\node[crypto,fill=yellow!40!white] (dechiffrement) [below=2cm of chiffre] {\textbf{Déchiffrement}};
\node[crypto,fill=blue!40!white] (message2) [below=4cm of message] {\textbf{Allo}\\\textbf{Alice}};
\node[personnes] (alice) [above=0.5cm of message2] {\textbf{Alice}};

\node (A) [above left=0.2cm and 0.5cm of alice] {};
\node (B) [right=7cm of A] {};
\draw[very thick] (A)--(B);

% % Flèches principales
\draw[arrow] (message) -- (chiffrement);
\draw[arrow] (chiffrement) -- (chiffre);
\draw[arrow] (chiffre) -- (dechiffrement);
\draw[arrow] (dechiffrement) -- (message2);

\node (clepublique) at (8,0) {
\begin{tikzpicture}
\clepublique{green}{0.5}
\end{tikzpicture}
};
\node[personnes,align=center] (clepublique2) [above=0.15cm of clepublique] {\textbf{Clé publique}\\\textbf{de Alice}};

\node (cleprivee) at (8,-5.25) {
\begin{tikzpicture}
\cleprivee{red}{0.5}
\end{tikzpicture}
};
\node[personnes,align=center] (cleprivee2) [above=0.15cm of cleprivee] {\textbf{Clé privée}\\\textbf{de Alice}};

% % Flèches clés
\draw[arrow] (clepublique.west) -- (chiffrement.east);
\draw[arrow] (cleprivee.west) -- (dechiffrement.east);

\end{tikzpicture}
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-width: 5
#| label: "schema-signature"
#| cache: true
#| 
\usetikzlibrary{positioning}
\begin{tikzpicture}[
    node distance=2.5cm,
    personnes/.style={font=\Large},
    crypto/.style={draw, rectangle, align=center, minimum width=2.5cm, minimum height=1cm, font=\Large},
    signature/.style={draw, rectangle, align=center, minimum width=3cm, minimum height=0.5cm, font=\Large},
    arrow/.style={->, very thick}
]

\newcommand{\clepublique}[2]{
\begin{scope}[scale=#2]
\draw[very thick,fill=#1] (0,0)--++(4,0)--++(0,-0.5)--++(-0.5,0)--++(0,-1)--++(-0.5,0)--++(0,0.5)--++(-0.5,0)--++(0,-0.5)--++(-0.5,0)--++(0,1)--++(-2,0);
\draw[very thick,fill=#1] (0,0) arc(30:330:1) --++ (0,0.5);
\end{scope}
}

\newcommand{\cleprivee}[2]{
\begin{scope}[scale=#2]
\draw[very thick,fill=#1] (0,0)--++(4,0)--++(0,-0.5)--++(-0.5,0)--++(0,-0.5)--++(-0.5,0)--++(0,-0.5)--++(-0.5,0)--++(0,0.5)--++(-0.5,0)--++(0,0.5)--++(-2,0);
\draw[very thick,fill=#1] (0,0) arc(30:330:1) --++ (0,0.5);
\end{scope}
}

% Noeuds
\node[crypto,fill=blue!40!white] (message) {\textbf{Allo}\\\textbf{Bob!}};
\node[personnes] (bob) [above=0.5cm of message] {\textbf{Alice}};
\node[crypto,fill=yellow!40!white] (chiffrement) [right=1cm of message] {\textbf{Chiffrement}};
\node[signature,fill=blue!40!white] (chiffre) [below=1cm of chiffrement] {\textbf{Allo Bob!}};
\node[signature,fill=purple!40!white] (signature1) [below=0cm of chiffre] {\tiny\textbf{03XYTAB185F6E7D4}};
\node[crypto,fill=yellow!40!white] (dechiffrement) [below=2.65cm of chiffre] {\textbf{Déchiffrement}};
\node[crypto,fill=blue!40!white] (message2) [below=4cm of message] {\textbf{Allo}\\\textbf{Bob!}};
\node[personnes] (alice) [above=0.5cm of message2] {\textbf{Bob}};

\node (A) [above left=0.2cm and 0.5cm of alice] {};
\node (B) [right=7cm of A] {};
\draw[very thick] (A)--(B);

% % Flèches principales
\draw[arrow] (message) -- (chiffrement);
\draw[arrow] (chiffrement) -- (chiffre);
\draw[arrow] (signature1) -- (dechiffrement);
\draw[arrow] (dechiffrement) -- (message2);

\node (clepublique) at (8,0) {
\begin{tikzpicture}
\clepublique{red}{0.5}
\end{tikzpicture}
};
\node[personnes,align=center] (clepublique2) [above=0.15cm of clepublique] {\textbf{Clé privée}\\\textbf{de Alice}};

\node (cleprivee) at (8,-5.25) {
\begin{tikzpicture}
\cleprivee{green}{0.5}
\end{tikzpicture}
};
\node[personnes,align=center] (cleprivee2) [above=0.15cm of cleprivee] {\textbf{Clé publique}\\\textbf{de Alice}};

% % Flèches clés
\draw[arrow] (clepublique.west) -- (chiffrement.east);
\draw[arrow] (cleprivee.west) -- (dechiffrement.east);

\end{tikzpicture}
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-width: 6
#| label: "hash-one-way"
#| cache: true
#| 
\usetikzlibrary{positioning,calc}
\begin{tikzpicture}[
    node distance=2.5cm,
    hash/.style={draw, rectangle, align=center, minimum width=2.5cm, minimum height=1cm, font=\Large},
    arrow/.style={->, very thick}
]

\node[hash] (message) {\textbf{MESSAGE}};
\node[hash] (hash) [right= 2cm of message] {\textbf{EMPREINTE}};
\draw[arrow] (message)--(hash) node[midway,above,align=center] {Fonction de\\ hachage};

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-width: 6
#| label: "hash-not-backwards"
#| cache: true
#| 
\usetikzlibrary{positioning,calc}
\begin{tikzpicture}[
    node distance=2.5cm,
    hash/.style={draw, rectangle, align=center, minimum width=2.5cm, minimum height=1cm, font=\Large},
    arrow/.style={->, very thick}
]

\node[hash] (message) {\textbf{MESSAGE}};
\node[hash] (hash) [right= 2cm of message] {\textbf{EMPREINTE}};
\draw[arrow] (hash)--(message) {};
\node at ($(message)!0.48!(hash)$) {\begin{tikzpicture}
    \draw[red, line width=5pt, line cap=round] (0,0) -- (1,1);
    \draw[red, line width=5pt, line cap=round] (1,0) -- (0,1);
\end{tikzpicture}};

\end{tikzpicture}
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "lamport-one-bit"
#| cache: true
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 0.75cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    message/.style={fill=yellow!50!white,minimum width=1cm, minimum height = 1cm},
    arrow/.style={->, very thick},
    myfit/.style={draw, dashed, thick, gray, inner sep=8pt},
    messagearrow/.style={very thick, blue}
]

\node[clesecrete] (cs0) {$cs_0$};
\foreach \i [evaluate=\i as \j using {int(\i-1)}] in {1}{
    \node[clesecrete] (cs\i) [right=0.3cm of cs\j] {$cs_{\i}$};
}
\foreach \i in {0,1}{
    \node[clepublique] (cp\i) [below=1cm of cs\i] {$cp_{\i}$};
    \draw[arrow] (cs\i)--(cp\i);
}
\node[left=0.5cm of cs0] (nom1) {Clé secrète\phantom{...}};
\node[left=0.5cm of cp0] (nom2) {Clé publique};

\node [myfit, fit=(nom1) (cs1)] {};
\node [myfit, fit=(nom2) (cp1)] {};

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "lamport-one-bit-0-before"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 0.75cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    message/.style={fill=yellow!50!white,minimum width=1cm, minimum height = 1cm},
    arrow/.style={->, very thick},
    myfit/.style={draw, dashed, thick, gray, inner sep=8pt},
    messagearrow/.style={very thick, blue}
]

\node[clesecrete] (cs0) {$cs_0$};
\foreach \i [evaluate=\i as \j using {int(\i-1)}] in {1}{
    \node[clesecrete] (cs\i) [right=0.3cm of cs\j] {$cs_{\i}$};
}

\node[message] (m) [above=1.5cm of $(cs0)!0.5!(cs1)$] {$0$};
\node[clesecrete,white,opacity=0] (z) [right=-0.36cm of m] {};
\node[left=0.5cm of m] (nom0) {Message\phantom{..............}};

\foreach \i in {0,1}{
    \node[clepublique] (cp\i) [below=1cm of cs\i] {$cp_{\i}$};
    \draw[arrow] (cs\i)--(cp\i);
}
\node[left=0.5cm of cs0] (nom1) {Clé secrète\phantom{...}};
\node[left=0.5cm of cp0] (nom2) {Clé publique};

\node [myfit, fit=(nom1) (cs1)] {};
\node [myfit, fit=(nom2) (cp1)] {};
\node [myfit, fit=(nom0) (z)] {};

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "lamport-one-bit-0-after"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 0.75cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    message/.style={fill=yellow!50!white,minimum width=1cm, minimum height = 1cm},
    arrow/.style={->, very thick},
    myfit/.style={draw, dashed, thick, gray, inner sep=8pt},
    messagearrow/.style={very thick, blue}
]

\node[clesecrete,fill=blue!50!white] (cs0) {$cs_0$};
\foreach \i [evaluate=\i as \j using {int(\i-1)}] in {1}{
    \node[clesecrete] (cs\i) [right=0.3cm of cs\j] {$cs_{\i}$};
}

\node[message] (m) [above=1.5cm of $(cs0)!0.5!(cs1)$] {$0$};
\node[clesecrete,white,opacity=0] (z) [right=-0.36cm of m] {};
\node[left=0.5cm of m] (nom0) {Message\phantom{..............}};

\foreach \i in {0,1}{
    \node[clepublique] (cp\i) [below=1cm of cs\i] {$cp_{\i}$};
    \draw[arrow] (cs\i)--(cp\i);
}
\node[left=0.5cm of cs0] (nom1) {Clé secrète\phantom{...}};
\node[left=0.5cm of cp0] (nom2) {Clé publique};

\node [myfit, fit=(nom1) (cs1)] {};
\node [myfit, fit=(nom2) (cp1)] {};
\node [myfit, fit=(nom0) (z)] {};

\draw[messagearrow] (m)--(cs0);

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "lamport-one-bit-1-before"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 0.75cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    message/.style={fill=yellow!50!white,minimum width=1cm, minimum height = 1cm},
    arrow/.style={->, very thick},
    myfit/.style={draw, dashed, thick, gray, inner sep=8pt},
    messagearrow/.style={very thick, blue}
]

\node[clesecrete] (cs0) {$cs_0$};
\foreach \i [evaluate=\i as \j using {int(\i-1)}] in {1}{
    \node[clesecrete] (cs\i) [right=0.3cm of cs\j] {$cs_{\i}$};
}

\node[message] (m) [above=1.5cm of $(cs0)!0.5!(cs1)$] {$1$};
\node[clesecrete,white,opacity=0] (z) [right=-0.36cm of m] {};
\node[left=0.5cm of m] (nom0) {Message\phantom{..............}};

\foreach \i in {0,1}{
    \node[clepublique] (cp\i) [below=1cm of cs\i] {$cp_{\i}$};
    \draw[arrow] (cs\i)--(cp\i);
}
\node[left=0.5cm of cs0] (nom1) {Clé secrète\phantom{...}};
\node[left=0.5cm of cp0] (nom2) {Clé publique};

\node [myfit, fit=(nom1) (cs1)] {};
\node [myfit, fit=(nom2) (cp1)] {};
\node [myfit, fit=(nom0) (z)] {};

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "lamport-one-bit-1-after"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 0.75cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    message/.style={fill=yellow!50!white,minimum width=1cm, minimum height = 1cm},
    arrow/.style={->, very thick},
    myfit/.style={draw, dashed, thick, gray, inner sep=8pt},
    messagearrow/.style={very thick, blue}
]

\node[clesecrete] (cs0) {$cs_0$};
\foreach \i [evaluate=\i as \j using {int(\i-1)}] in {1}{
    \node[clesecrete,fill=blue!50!white] (cs\i) [right=0.3cm of cs\j] {$cs_{\i}$};
}

\node[message] (m) [above=1.5cm of $(cs0)!0.5!(cs1)$] {$1$};
\node[clesecrete,white,opacity=0] (z) [right=-0.36cm of m] {};
\node[left=0.5cm of m] (nom0) {Message\phantom{..............}};

\foreach \i in {0,1}{
    \node[clepublique] (cp\i) [below=1cm of cs\i] {$cp_{\i}$};
    \draw[arrow] (cs\i)--(cp\i);
}
\node[left=0.5cm of cs0] (nom1) {Clé secrète\phantom{...}};
\node[left=0.5cm of cp0] (nom2) {Clé publique};

\node [myfit, fit=(nom1) (cs1)] {};
\node [myfit, fit=(nom2) (cp1)] {};
\node [myfit, fit=(nom0) (z)] {};

\draw[messagearrow] (m)--(cs1);

\end{tikzpicture}
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "lamport-one-bit-good-signature"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 0.75cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    message/.style={fill=yellow!50!white,minimum width=1cm, minimum height = 1cm},
    arrow/.style={->, very thick},
    myfit/.style={draw, dashed, thick, gray, inner sep=8pt},
    messagearrow/.style={very thick, blue},
    hash/.style={fill=green}
]
\node[message] (m) {0};
\node[signature] (sign) [below=0.5cm of m] {$cs_0$};
\node[hash] (h0) [below left=0.5cm and 0.5cm of sign] {$cp_0$};
\node[hash] (h1) [below right=0.5cm and 0.5cm of sign] {$cp_1$};
\node[clepublique] (cp0) [below=0.5cm of h0] {$cp_0$};
\node[clepublique] (cp1) [below=0.5cm of h1] {$cp_1$};
\node (nom0) [left=0.5cm of cp0] {Clé publique};
\node (nom1) [left=0.5cm of h0] {Empreinte};
\node (nom2) [left=1.75cm of sign] {Signature};
\node (nom3) [left=1.75cm of m] {Message};

\draw[messagearrow] (m)--(sign);
\draw[arrow] (sign)--(h0.north east);
\node at ($(h0)!0.5!(cp0)$) {$=$};

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "lamport-one-bit-bad-signature"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 0.75cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    message/.style={fill=yellow!50!white,minimum width=1cm, minimum height = 1cm},
    arrow/.style={->, very thick},
    myfit/.style={draw, dashed, thick, gray, inner sep=8pt},
    messagearrow/.style={very thick, blue},
    hash/.style={fill=purple}
]
\node[message] (m) {0};
\node[signature] (sign) [below=0.5cm of m] {$cs'_0$};
\node[hash] (h0) [below left=0.5cm and 0.5cm of sign] {$cp'_0$};
\node[hash] (h1) [below right=0.5cm and 0.5cm of sign] {$cp'_1$};
\node[clepublique] (cp0) [below=0.5cm of h0] {$cp_0$};
\node[clepublique] (cp1) [below=0.5cm of h1] {$cp_1$};
\node (nom0) [left=0.5cm of cp0] {Clé publique};
\node (nom1) [left=0.5cm of h0] {Empreinte};
\node (nom2) [left=1.75cm of sign] {Signature};
\node (nom3) [left=1.75cm of m] {Message};

\draw[messagearrow] (m)--(sign);
\draw[arrow] (sign)--(h0.north east);
\node at ($(h0)!0.5!(cp0)$) {$\neq$};

\end{tikzpicture}
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "lamport-256-bits"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=1.5cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    message/.style={fill=yellow!50!white,minimum width=1cm, minimum height = 1cm},
    arrow/.style={->, very thick},
    myfit/.style={draw, dashed, thick, gray, inner sep=8pt},
    messagearrow/.style={very thick, blue},
    hash/.style={fill=purple}
]

\node[clesecrete] (cs0-0) {$cs_{0,0}$};
\node[clesecrete] (cs1-0) [right=0.1cm of cs0-0] {$cs_{1,0}$};
\node[clesecrete] (cs0-1) [right=0.5cm of cs1-0] {$cs_{0,1}$};
\node[clesecrete] (cs1-1) [right=0.1cm of cs0-1] {$cs_{1,1}$};
\node[clesecrete] (cs0-2) [right=0.5cm of cs1-1] {$cs_{0,2}$};
\node[clesecrete] (cs1-2) [right=0.1cm of cs0-2] {$cs_{1,2}$};
\node[clesecrete] (cs0-255) [right=2cm of cs1-2] {$cs_{0,255}$};
\node[clesecrete] (cs1-255) [right=0.1cm of cs0-255] {$cs_{1,255}$};

\foreach \i/\j in {0/0,1/0,0/1,1/1,0/2,1/2,0/255,1/255}{
    \node[clepublique] (cp\i-\j) [below=1cm of cs\i-\j] {$cp_{\i,\j}$};
}
% \foreach \i/\lbl in {0/1,1/1,2/0,255/1}{
%     \node[message] (m\i) at ($(cs0-\i)!0.5!(cs1-\i)+(0,2cm)$) {\lbl};
% }

\newcommand{\etc}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (2pt);
        }
    \end{tikzpicture}
}
\node at ($(cs1-2)!0.5!(cs0-255)$) {\etc};
\node at ($(cp1-2)!0.5!(cp0-255)$) {\etc};
% \node at ($(m2)!0.5!(m255)$) {\etc};

\foreach \i/\j in {0/0,1/0,0/1,1/1,0/2,1/2,0/255,1/255}{
    \draw[arrow] (cs\i-\j)--(cp\i-\j);
}

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "lamport-256-bits-avec-message"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=1.5cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    message/.style={fill=yellow!50!white,minimum width=1cm, minimum height = 1cm},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\node[clesecrete] (cs0-0) {$cs_{0,0}$};
\node[clesecrete] (cs1-0) [right=0.1cm of cs0-0] {$cs_{1,0}$};
\node[clesecrete] (cs0-1) [right=0.5cm of cs1-0] {$cs_{0,1}$};
\node[clesecrete] (cs1-1) [right=0.1cm of cs0-1] {$cs_{1,1}$};
\node[clesecrete] (cs0-2) [right=0.5cm of cs1-1] {$cs_{0,2}$};
\node[clesecrete] (cs1-2) [right=0.1cm of cs0-2] {$cs_{1,2}$};
\node[clesecrete] (cs0-255) [right=2cm of cs1-2] {$cs_{0,255}$};
\node[clesecrete] (cs1-255) [right=0.1cm of cs0-255] {$cs_{1,255}$};

\foreach \i/\j in {0/0,1/0,0/1,1/1,0/2,1/2,0/255,1/255}{
    \node[clepublique] (cp\i-\j) [below=1cm of cs\i-\j] {$cp_{\i,\j}$};
}
\foreach \i/\lbl in {0/1,1/1,2/0,255/1}{
   \node[message] (m\i) at ($(cs0-\i)!0.5!(cs1-\i)+(0,2cm)$) {\lbl};
}

\newcommand{\etc}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (2pt);
        }
    \end{tikzpicture}
}
\node at ($(cs1-2)!0.5!(cs0-255)$) {\etc};
\node at ($(cp1-2)!0.5!(cp0-255)$) {\etc};
\node at ($(m2)!0.5!(m255)$) {\etc};

\foreach \i/\j in {0/0,1/0,0/1,1/1,0/2,1/2,0/255,1/255}{
    \draw[arrow] (cs\i-\j)--(cp\i-\j);
}

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "lamport-256-bits-avec-message-etape1"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=1.5cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    message/.style={fill=yellow!50!white,minimum width=1cm, minimum height = 1cm},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\node[clesecrete] (cs0-0) {$cs_{0,0}$};
\node[clesecrete] (cs1-0) [right=0.1cm of cs0-0] {$cs_{1,0}$};
\node[clesecrete] (cs0-1) [right=0.5cm of cs1-0] {$cs_{0,1}$};
\node[clesecrete] (cs1-1) [right=0.1cm of cs0-1] {$cs_{1,1}$};
\node[clesecrete] (cs0-2) [right=0.5cm of cs1-1] {$cs_{0,2}$};
\node[clesecrete] (cs1-2) [right=0.1cm of cs0-2] {$cs_{1,2}$};
\node[clesecrete] (cs0-255) [right=2cm of cs1-2] {$cs_{0,255}$};
\node[clesecrete] (cs1-255) [right=0.1cm of cs0-255] {$cs_{1,255}$};

\foreach \i/\j in {0/0,1/0,0/1,1/1,0/2,1/2,0/255,1/255}{
    \node[clepublique] (cp\i-\j) [below=1cm of cs\i-\j] {$cp_{\i,\j}$};
}
\foreach \i/\lbl in {0/1,1/1,2/0,255/1}{
   \node[message] (m\i) at ($(cs0-\i)!0.5!(cs1-\i)+(0,2cm)$) {\lbl};
}

\newcommand{\etc}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (2pt);
        }
    \end{tikzpicture}
}
\node at ($(cs1-2)!0.5!(cs0-255)$) {\etc};
\node at ($(cp1-2)!0.5!(cp0-255)$) {\etc};
\node at ($(m2)!0.5!(m255)$) {\etc};

\foreach \i/\j in {0/0,1/0,0/1,1/1,0/2,1/2,0/255,1/255}{
    \draw[arrow] (cs\i-\j)--(cp\i-\j);
}
\draw[messagearrow] (m0)--(cs1-0);
\node[clesecrete,fill=blue!50!white] (cs1-0) [right=0.1cm of cs0-0] {$cs_{1,0}$};
\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "lamport-256-bits-avec-message-etape2"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=1.5cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    message/.style={fill=yellow!50!white,minimum width=1cm, minimum height = 1cm},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\node[clesecrete] (cs0-0) {$cs_{0,0}$};
\node[clesecrete] (cs1-0) [right=0.1cm of cs0-0] {$cs_{1,0}$};
\node[clesecrete] (cs0-1) [right=0.5cm of cs1-0] {$cs_{0,1}$};
\node[clesecrete] (cs1-1) [right=0.1cm of cs0-1] {$cs_{1,1}$};
\node[clesecrete] (cs0-2) [right=0.5cm of cs1-1] {$cs_{0,2}$};
\node[clesecrete] (cs1-2) [right=0.1cm of cs0-2] {$cs_{1,2}$};
\node[clesecrete] (cs0-255) [right=2cm of cs1-2] {$cs_{0,255}$};
\node[clesecrete] (cs1-255) [right=0.1cm of cs0-255] {$cs_{1,255}$};

\foreach \i/\j in {0/0,1/0,0/1,1/1,0/2,1/2,0/255,1/255}{
    \node[clepublique] (cp\i-\j) [below=1cm of cs\i-\j] {$cp_{\i,\j}$};
}
\foreach \i/\lbl in {0/1,1/1,2/0,255/1}{
   \node[message] (m\i) at ($(cs0-\i)!0.5!(cs1-\i)+(0,2cm)$) {\lbl};
}

\newcommand{\etc}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (2pt);
        }
    \end{tikzpicture}
}
\node at ($(cs1-2)!0.5!(cs0-255)$) {\etc};
\node at ($(cp1-2)!0.5!(cp0-255)$) {\etc};
\node at ($(m2)!0.5!(m255)$) {\etc};

\foreach \i/\j in {0/0,1/0,0/1,1/1,0/2,1/2,0/255,1/255}{
    \draw[arrow] (cs\i-\j)--(cp\i-\j);
}
\draw[messagearrow] (m0)--(cs1-0);
\node[clesecrete,fill=blue!50!white] (cs1-0) [right=0.1cm of cs0-0] {$cs_{1,0}$};
\draw[messagearrow] (m1)--(cs1-1);
\node[clesecrete,fill=blue!50!white] (cs1-1) [right=0.1cm of cs0-1] {$cs_{1,1}$};
\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "lamport-256-bits-avec-message-etape3"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=1.5cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    message/.style={fill=yellow!50!white,minimum width=1cm, minimum height = 1cm},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\node[clesecrete] (cs0-0) {$cs_{0,0}$};
\node[clesecrete] (cs1-0) [right=0.1cm of cs0-0] {$cs_{1,0}$};
\node[clesecrete] (cs0-1) [right=0.5cm of cs1-0] {$cs_{0,1}$};
\node[clesecrete] (cs1-1) [right=0.1cm of cs0-1] {$cs_{1,1}$};
\node[clesecrete] (cs0-2) [right=0.5cm of cs1-1] {$cs_{0,2}$};
\node[clesecrete] (cs1-2) [right=0.1cm of cs0-2] {$cs_{1,2}$};
\node[clesecrete] (cs0-255) [right=2cm of cs1-2] {$cs_{0,255}$};
\node[clesecrete] (cs1-255) [right=0.1cm of cs0-255] {$cs_{1,255}$};

\foreach \i/\j in {0/0,1/0,0/1,1/1,0/2,1/2,0/255,1/255}{
    \node[clepublique] (cp\i-\j) [below=1cm of cs\i-\j] {$cp_{\i,\j}$};
}
\foreach \i/\lbl in {0/1,1/1,2/0,255/1}{
   \node[message] (m\i) at ($(cs0-\i)!0.5!(cs1-\i)+(0,2cm)$) {\lbl};
}

\newcommand{\etc}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (2pt);
        }
    \end{tikzpicture}
}
\node at ($(cs1-2)!0.5!(cs0-255)$) {\etc};
\node at ($(cp1-2)!0.5!(cp0-255)$) {\etc};
\node at ($(m2)!0.5!(m255)$) {\etc};

\foreach \i/\j in {0/0,1/0,0/1,1/1,0/2,1/2,0/255,1/255}{
    \draw[arrow] (cs\i-\j)--(cp\i-\j);
}
\draw[messagearrow] (m0)--(cs1-0);
\node[clesecrete,fill=blue!50!white] (cs1-0) [right=0.1cm of cs0-0] {$cs_{1,0}$};
\draw[messagearrow] (m1)--(cs1-1);
\node[clesecrete,fill=blue!50!white] (cs1-1) [right=0.1cm of cs0-1] {$cs_{1,1}$};
\draw[messagearrow] (m2)--(cs0-2);
\node[clesecrete,fill=blue!50!white] (cs0-2) [right=0.5cm of cs1-1] {$cs_{0,2}$};
\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "lamport-256-bits-avec-message-etape4"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=1.5cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    message/.style={fill=yellow!50!white,minimum width=1cm, minimum height = 1cm},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\node[clesecrete] (cs0-0) {$cs_{0,0}$};
\node[clesecrete] (cs1-0) [right=0.1cm of cs0-0] {$cs_{1,0}$};
\node[clesecrete] (cs0-1) [right=0.5cm of cs1-0] {$cs_{0,1}$};
\node[clesecrete] (cs1-1) [right=0.1cm of cs0-1] {$cs_{1,1}$};
\node[clesecrete] (cs0-2) [right=0.5cm of cs1-1] {$cs_{0,2}$};
\node[clesecrete] (cs1-2) [right=0.1cm of cs0-2] {$cs_{1,2}$};
\node[clesecrete] (cs0-255) [right=2cm of cs1-2] {$cs_{0,255}$};
\node[clesecrete] (cs1-255) [right=0.1cm of cs0-255] {$cs_{1,255}$};

\foreach \i/\j in {0/0,1/0,0/1,1/1,0/2,1/2,0/255,1/255}{
    \node[clepublique] (cp\i-\j) [below=1cm of cs\i-\j] {$cp_{\i,\j}$};
}
\foreach \i/\lbl in {0/1,1/1,2/0,255/1}{
   \node[message] (m\i) at ($(cs0-\i)!0.5!(cs1-\i)+(0,2cm)$) {\lbl};
}

\newcommand{\etc}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (2pt);
        }
    \end{tikzpicture}
}
\node at ($(cs1-2)!0.5!(cs0-255)$) {\etc};
\node at ($(cp1-2)!0.5!(cp0-255)$) {\etc};
\node at ($(m2)!0.5!(m255)$) {\etc};

\foreach \i/\j in {0/0,1/0,0/1,1/1,0/2,1/2,0/255,1/255}{
    \draw[arrow] (cs\i-\j)--(cp\i-\j);
}
\draw[messagearrow] (m0)--(cs1-0);
\node[clesecrete,fill=blue!50!white] (cs1-0) [right=0.1cm of cs0-0] {$cs_{1,0}$};
\draw[messagearrow] (m1)--(cs1-1);
\node[clesecrete,fill=blue!50!white] (cs1-1) [right=0.1cm of cs0-1] {$cs_{1,1}$};
\draw[messagearrow] (m2)--(cs0-2);
\node[clesecrete,fill=blue!50!white] (cs0-2) [right=0.5cm of cs1-1] {$cs_{0,2}$};
\draw[messagearrow] (m255)--(cs1-255);
\node[clesecrete,fill=blue!50!white] (cs1-255) [right=0.1cm of cs0-255] {$cs_{1,255}$};
\end{tikzpicture}
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "wots-64-blocks"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    message/.style={fill=yellow!50!white},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\def\H{0cm}
\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (1.5pt);
        }
    \end{tikzpicture}
}
\newcommand{\etcV}{
    \begin{tikzpicture}
        \begin{scope}[rotate=90]
            \foreach \i in {-0.25,0,0.25}{
                \draw[fill=black] (\i,0) circle (1.5pt);
            }
        \end{scope}
    \end{tikzpicture}
}

\node[clesecrete] (cs0-0) {$cs_{0}^0$};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2}{
    \node[clesecrete] (cs\i-0) [right=0.1cm of cs\j-0] {$cs_{\i}^0$};
}
\begin{scope}[xshift=8cm]
\node[clesecrete] (cs63-0) {$cs_{63}^0$};
\end{scope}

\foreach \j [evaluate=\j as \k using int(\j-1)] in {1,2}{
\foreach \i in {0,1,2,63}{
    \node[clesecrete] (cs\i-\j) [below=\H of cs\i-\k] {$cs_{\i}^{\j}$};
}
}
\foreach \i in {0,1,2,63}{
    \node[clesecrete] (cs\i-15) [below=1cm of cs\i-2] {$cs_{\i}^{15}$};
}
\foreach \i/\lbl in {0/{0101},1/{1100},2/{1101},63/{0110}}{
    \node[message] (m\i) [above=0.5cm of cs\i-0] {\lbl};
    \node [above=0cm of m\i] {Bloc \i};
}

\foreach \j in {0,1,2,15}{
    \node at ($(cs2-\j)!0.5!(cs63-\j)$) {\etcH};
}
\foreach \i in {0,1,2,63}{
    \node at ($(cs\i-2)!0.5!(cs\i-15)$) {\etcV};
}
\node at ($(m2)!0.5!(m63)$) {\etcH};

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "wots-first-secret-key"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    message/.style={fill=yellow!50!white},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\def\H{0cm}
\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (1.5pt);
        }
    \end{tikzpicture}
}
\newcommand{\etcV}{
    \begin{tikzpicture}
        \begin{scope}[rotate=90]
            \foreach \i in {-0.25,0,0.25}{
                \draw[fill=black] (\i,0) circle (1.5pt);
            }
        \end{scope}
    \end{tikzpicture}
}

\node[clesecrete] (cs0-0) {$cs_{0}$};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2}{
    \node[clesecrete] (cs\i-0) [right=0.1cm of cs\j-0] {$cs_{\i}$};
}
\begin{scope}[xshift=8cm]
\node[clesecrete] (cs63-0) {$cs_{63}$};
\end{scope}

\foreach \j in {0}{
    \node at ($(cs2-\j)!0.5!(cs63-\j)$) {\etcH};
}
\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "wots-all-secret-key"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    message/.style={fill=yellow!50!white},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\def\H{0.5cm}
\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (1.5pt);
        }
    \end{tikzpicture}
}
\newcommand{\etcV}{
    \begin{tikzpicture}
        \begin{scope}[rotate=90]
            \foreach \i in {-0.25,0,0.25}{
                \draw[fill=black] (\i,0) circle (1.5pt);
            }
        \end{scope}
    \end{tikzpicture}
}

\node[clesecrete] (cs0-0) {$cs_{0}$};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2}{
    \node[clesecrete] (cs\i-0) [right=0.1cm of cs\j-0] {$cs_{\i}$};
}
\begin{scope}[xshift=8cm]
\node[clesecrete] (cs63-0) {$cs_{63}$};
\end{scope}

\foreach \j [evaluate=\j as \k using int(\j-1)] in {1,2}{
\foreach \i in {0,1,2,63}{
    \node[clesecrete] (cs\i-\j) [below=\H of cs\i-\k] {$H^{\j}(cs_{\i})$};
}
}
\foreach \i in {0,1,2,63}{
    \node[clesecrete] (cs\i-15) [below=1cm of cs\i-2] {$H^{15}(cs_{\i})$};
}

\foreach \j in {0,1,2,15}{
    \node at ($(cs2-\j)!0.5!(cs63-\j)$) {\etcH};
}
\foreach \i in {0,1,2,63}{
    \node at ($(cs\i-2)!0.5!(cs\i-15)$) {\etcV};
}
\foreach \i in {0,1,2,63}{
\foreach \j [evaluate=\j as \k using int(\j+1)] in {0,1}{
\draw[arrow] (cs\i-\j)--(cs\i-\k);
}
}

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "wots-all-secret-key-and-signature"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    message/.style={fill=yellow!50!white},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\def\H{0.5cm}
\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (1.5pt);
        }
    \end{tikzpicture}
}
\newcommand{\etcV}{
    \begin{tikzpicture}
        \begin{scope}[rotate=90]
            \foreach \i in {-0.25,0,0.25}{
                \draw[fill=black] (\i,0) circle (1.5pt);
            }
        \end{scope}
    \end{tikzpicture}
}

\node[clesecrete] (cs0-0) {$cs_{0}$};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2}{
    \node[clesecrete] (cs\i-0) [right=0.1cm of cs\j-0] {$cs_{\i}$};
}
\begin{scope}[xshift=8cm]
\node[clesecrete] (cs63-0) {$cs_{63}$};
\end{scope}

\foreach \j [evaluate=\j as \k using int(\j-1)] in {1,2}{
\foreach \i in {0,1,2,63}{
    \node[clesecrete] (cs\i-\j) [below=\H of cs\i-\k] {$H^{\j}(cs_{\i})$};
}
}
\foreach \i in {0,1,2,63}{
    \node[clesecrete] (cs\i-15) [below=1cm of cs\i-2] {$H^{15}(cs_{\i})$};
    \node[clepublique] (cp\i-16) [below=\H of cs\i-15] {$H^{16}(cs_{\i})$};
}

\foreach \j in {0,1,2,15}{
    \node at ($(cs2-\j)!0.5!(cs63-\j)$) {\etcH};
}
\foreach \i in {0,1,2,63}{
    \node at ($(cs\i-2)!0.5!(cs\i-15)$) {\etcV};
}
\foreach \i in {0,1,2,63}{
\foreach \j [evaluate=\j as \k using int(\j+1)] in {0,1}{
\draw[arrow] (cs\i-\j)--(cs\i-\k);
}
\draw[arrow] (cs\i-15)--(cp\i-16);
}
\node at ($(cp2-16)!0.5!(cp63-16)$) {\etcH};

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "wots-message-etape-0"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    message/.style={fill=yellow!50!white},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\def\H{0.5cm}
\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (1.5pt);
        }
    \end{tikzpicture}
}
\newcommand{\etcV}{
    \begin{tikzpicture}
        \begin{scope}[rotate=90]
            \foreach \i in {-0.25,0,0.25}{
                \draw[fill=black] (\i,0) circle (1.5pt);
            }
        \end{scope}
    \end{tikzpicture}
}

\node[clesecrete] (cs0-0) {$cs_{0}$};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2}{
    \node[clesecrete] (cs\i-0) [right=0.1cm of cs\j-0] {$cs_{\i}$};
}
\begin{scope}[xshift=8cm]
\node[clesecrete] (cs63-0) {$cs_{63}$};
\end{scope}

\foreach \i/\lbl in {0/{0011},1/{1100},2/{1001},63/{1110}}{
    \node[message] (m\i) [above=3cm of cs\i-0] {\lbl};
    \node [above=0cm of m\i] {Bloc \i};
}
\node at ($(m2)!0.5!(m63)$) {\etcH};

\foreach \j [evaluate=\j as \k using int(\j-1)] in {1,2}{
\foreach \i in {0,1,2,63}{
    \node[clesecrete] (cs\i-\j) [below=\H of cs\i-\k] {$H^{\j}(cs_{\i})$};
}
}
\foreach \i in {0,1,2,63}{
    \node[clesecrete] (cs\i-15) [below=1cm of cs\i-2] {$H^{15}(cs_{\i})$};
    \node[clepublique] (cp\i-16) [below=\H of cs\i-15] {$H^{16}(cs_{\i})$};
}

\foreach \j in {0,1,2,15}{
    \node at ($(cs2-\j)!0.5!(cs63-\j)$) {\etcH};
}
\foreach \i in {0,1,2,63}{
    \node at ($(cs\i-2)!0.5!(cs\i-15)$) {\etcV};
}
\foreach \i in {0,1,2,63}{
\foreach \j [evaluate=\j as \k using int(\j+1)] in {0,1}{
\draw[arrow] (cs\i-\j)--(cs\i-\k);
}
\draw[arrow] (cs\i-15)--(cp\i-16);
}
\node at ($(cp2-16)!0.5!(cp63-16)$) {\etcH};

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "wots-message-etape-1"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    message/.style={fill=yellow!50!white},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\def\H{0.5cm}
\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (1.5pt);
        }
    \end{tikzpicture}
}
\newcommand{\etcV}{
    \begin{tikzpicture}
        \begin{scope}[rotate=90]
            \foreach \i in {-0.25,0,0.25}{
                \draw[fill=black] (\i,0) circle (1.5pt);
            }
        \end{scope}
    \end{tikzpicture}
}

\node[clesecrete] (cs0-0) {$cs_{0}$};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2}{
    \node[clesecrete] (cs\i-0) [right=0.1cm of cs\j-0] {$cs_{\i}$};
}
\begin{scope}[xshift=8cm]
\node[clesecrete] (cs63-0) {$cs_{63}$};
\end{scope}

\foreach \i/\lbl/\bin in {0/{0011}/3,1/{1100}/12,2/{1001}/9,63/{1110}/14}{
    \node[message] (m\i) [above=3cm of cs\i-0] {\lbl};
    \node [above=0cm of m\i] {Bloc \i};
    \node[signature] (s\i) [below=0cm of m\i] {$H^{\bin}(cs_{\i})$};
}
\node at ($(m2)!0.5!(m63)$) {\etcH};
\node at ($(s2)!0.5!(s63)$) {\etcH};

\foreach \j [evaluate=\j as \k using int(\j-1)] in {1,2}{
\foreach \i in {0,1,2,63}{
    \node[clesecrete] (cs\i-\j) [below=\H of cs\i-\k] {$H^{\j}(cs_{\i})$};
}
}
\foreach \i in {0,1,2,63}{
    \node[clesecrete] (cs\i-15) [below=1cm of cs\i-2] {$H^{15}(cs_{\i})$};
    \node[clepublique] (cp\i-16) [below=\H of cs\i-15] {$H^{16}(cs_{\i})$};
}

\foreach \j in {0,1,2,15}{
    \node at ($(cs2-\j)!0.5!(cs63-\j)$) {\etcH};
}
\foreach \i in {0,1,2,63}{
    \node at ($(cs\i-2)!0.5!(cs\i-15)$) {\etcV};
}
\foreach \i in {0,1,2,63}{
\foreach \j [evaluate=\j as \k using int(\j+1)] in {0,1}{
\draw[arrow] (cs\i-\j)--(cs\i-\k);
}
\draw[arrow] (cs\i-15)--(cp\i-16);
}
\node at ($(cp2-16)!0.5!(cp63-16)$) {\etcH};

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "winternitz-message-etape-2"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    message/.style={fill=yellow!50!white},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\def\H{0.5cm}
\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (1.5pt);
        }
    \end{tikzpicture}
}
\newcommand{\etcV}{
    \begin{tikzpicture}
        \begin{scope}[rotate=90]
            \foreach \i in {-0.25,0,0.25}{
                \draw[fill=black] (\i,0) circle (1.5pt);
            }
        \end{scope}
    \end{tikzpicture}
}

\node[clesecrete] (cs0-0) {$cs_{0}$};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2}{
    \node[clesecrete] (cs\i-0) [right=0.1cm of cs\j-0] {$cs_{\i}$};
}
\begin{scope}[xshift=8cm]
\node[clesecrete] (cs63-0) {$cs_{63}$};
\end{scope}

\foreach \i/\lbl/\bin [evaluate=\bin as \j using int(16-\bin)] in {0/{0011}/3,1/{1100}/12,2/{1001}/9,63/{1110}/14}{
    \node[message] (m\i) [above=3cm of cs\i-0] {\lbl};
    \node [above=0cm of m\i] {Bloc \i};
    \node[signature] (s\i) [below=0cm of m\i] {$H^{\bin}(cs_{\i})$};
    \node[clepublique] (p\i) [below=0.75cm of s\i] {$H^{16}(cs_{\i})$};
    \draw[arrow] (s\i)--(p\i) node[midway,left=-0.6cm,font=\small] {\j\ $\times$};
}
\node at ($(m2)!0.5!(m63)$) {\etcH};
\node at ($(s2)!0.5!(s63)$) {\etcH};
\node at ($(p2)!0.5!(p63)$) {\etcH};

\foreach \j [evaluate=\j as \k using int(\j-1)] in {1,2}{
\foreach \i in {0,1,2,63}{
    \node[clesecrete] (cs\i-\j) [below=\H of cs\i-\k] {$H^{\j}(cs_{\i})$};
}
}
\foreach \i in {0,1,2,63}{
    \node[clesecrete] (cs\i-15) [below=1cm of cs\i-2] {$H^{15}(cs_{\i})$};
    \node[clepublique] (cp\i-16) [below=\H of cs\i-15] {$H^{16}(cs_{\i})$};
}

\foreach \j in {0,1,2,15}{
    \node at ($(cs2-\j)!0.5!(cs63-\j)$) {\etcH};
}
\foreach \i in {0,1,2,63}{
    \node at ($(cs\i-2)!0.5!(cs\i-15)$) {\etcV};
}
\foreach \i in {0,1,2,63}{
\foreach \j [evaluate=\j as \k using int(\j+1)] in {0,1}{
\draw[arrow] (cs\i-\j)--(cs\i-\k);
}
\draw[arrow] (cs\i-15)--(cp\i-16);
}
\node at ($(cp2-16)!0.5!(cp63-16)$) {\etcH};

\end{tikzpicture}
#
#
#
#
#
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "wots-imposteur-etape-0"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    imposteur/.style={fill=orange},
    message/.style={fill=yellow!50!white},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\def\H{0.5cm}
\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (1.5pt);
        }
    \end{tikzpicture}
}
\newcommand{\etcV}{
    \begin{tikzpicture}
        \begin{scope}[rotate=90]
            \foreach \i in {-0.25,0,0.25}{
                \draw[fill=black] (\i,0) circle (1.5pt);
            }
        \end{scope}
    \end{tikzpicture}
}

\node[clesecrete] (cs0-0) {$cs_{0}$};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2}{
    \node[clesecrete] (cs\i-0) [right=0.1cm of cs\j-0] {$cs_{\i}$};
}
\begin{scope}[xshift=8cm]
\node[clesecrete] (cs63-0) {$cs_{63}$};
\end{scope}

\foreach \i/\lbl/\bin/\imp [evaluate=\bin as \j using int(16-\bin)] in {0/{0011}/3/0111,1/{1100}/12/1101,2/{1001}/9/1011,63/{1110}/14/1111}{
    \node[message] (m\i) [above=4cm of cs\i-0] {\lbl};
    \node[imposteur] (i\i) [below=0cm of m\i] {\imp};
    \node [above=0cm of m\i] {Bloc \i};
    \node[signature] (s\i) [below=0cm of i\i] {$H^{\bin}(cs_{\i})$};
    \node[clepublique] (p\i) [below=0.75cm of s\i] {$H^{16}(cs_{\i})$};
    \draw[arrow] (s\i)--(p\i) node[midway,left=-0.6cm,font=\small] {\j\ $\times$};
}
\node at ($(m2)!0.5!(m63)$) {\etcH};
\node at ($(i2)!0.5!(i63)$) {\etcH};
\node at ($(s2)!0.5!(s63)$) {\etcH};
\node at ($(p2)!0.5!(p63)$) {\etcH};

\foreach \j [evaluate=\j as \k using int(\j-1)] in {1,2}{
\foreach \i in {0,1,2,63}{
    \node[clesecrete] (cs\i-\j) [below=\H of cs\i-\k] {$H^{\j}(cs_{\i})$};
}
}
\foreach \i in {0,1,2,63}{
    \node[clesecrete] (cs\i-15) [below=1cm of cs\i-2] {$H^{15}(cs_{\i})$};
    \node[clepublique] (cp\i-16) [below=\H of cs\i-15] {$H^{16}(cs_{\i})$};
}

\foreach \j in {0,1,2,15}{
    \node at ($(cs2-\j)!0.5!(cs63-\j)$) {\etcH};
}
\foreach \i in {0,1,2,63}{
    \node at ($(cs\i-2)!0.5!(cs\i-15)$) {\etcV};
}
\foreach \i in {0,1,2,63}{
\foreach \j [evaluate=\j as \k using int(\j+1)] in {0,1}{
\draw[arrow] (cs\i-\j)--(cs\i-\k);
}
\draw[arrow] (cs\i-15)--(cp\i-16);
}
\node at ($(cp2-16)!0.5!(cp63-16)$) {\etcH};

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "imposteur-etape-1"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    imposteur/.style={fill=orange},
    signatureimposteur/.style={fill=orange!50!blue},
    message/.style={fill=yellow!50!white},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\def\H{0.5cm}
\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (1.5pt);
        }
    \end{tikzpicture}
}
\newcommand{\etcV}{
    \begin{tikzpicture}
        \begin{scope}[rotate=90]
            \foreach \i in {-0.25,0,0.25}{
                \draw[fill=black] (\i,0) circle (1.5pt);
            }
        \end{scope}
    \end{tikzpicture}
}

\node[clesecrete] (cs0-0) {$cs_{0}$};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2}{
    \node[clesecrete] (cs\i-0) [right=0.1cm of cs\j-0] {$cs_{\i}$};
}
\begin{scope}[xshift=8cm]
\node[clesecrete] (cs63-0) {$cs_{63}$};
\end{scope}

\foreach \i/\lbl/\bin/\imp [evaluate=\bin as \j using int(16-\bin)] in {0/{0011}/3/0111,1/{1100}/12/1101,2/{1001}/9/1011,63/{1110}/14/1111}{
    \node[message] (m\i) [above=4cm of cs\i-0] {\lbl};
    \node[imposteur] (i\i) [below=0cm of m\i] {\imp};
    \node [above=0cm of m\i] {Bloc \i};
}
\foreach \i/\bin [evaluate=\bin as \j using int(16-\bin)] in {1/12,2/9,63/14}{
    \node[signature] (s\i) [below=0cm of i\i] {$H^{\bin}(cs_{\i})$};
    \node[clepublique] (p\i) [below=0.75cm of s\i] {$H^{16}(cs_{\i})$};
    \draw[arrow] (s\i)--(p\i) node[midway,left=-0.6cm,font=\small] {\j\ $\times$};
}
\foreach \i/\bin [evaluate=\bin as \j using int(16-\bin)] in {0/7}{
    \node[signatureimposteur] (s\i) [below=0cm of i\i] {$H^{\bin}(cs_{\i})$};
    \node[clepublique] (p\i) [below=0.75cm of s\i] {$H^{16}(cs_{\i})$};
    \draw[arrow] (s\i)--(p\i) node[midway,left=-0.6cm,font=\small] {\j\ $\times$};
}
\node at ($(m2)!0.5!(m63)$) {\etcH};
\node at ($(i2)!0.5!(i63)$) {\etcH};
\node at ($(s2)!0.5!(s63)$) {\etcH};
\node at ($(p2)!0.5!(p63)$) {\etcH};

\foreach \j [evaluate=\j as \k using int(\j-1)] in {1,2}{
\foreach \i in {0,1,2,63}{
    \node[clesecrete] (cs\i-\j) [below=\H of cs\i-\k] {$H^{\j}(cs_{\i})$};
}
}
\foreach \i in {0,1,2,63}{
    \node[clesecrete] (cs\i-15) [below=1cm of cs\i-2] {$H^{15}(cs_{\i})$};
    \node[clepublique] (cp\i-16) [below=\H of cs\i-15] {$H^{16}(cs_{\i})$};
}

\foreach \j in {0,1,2,15}{
    \node at ($(cs2-\j)!0.5!(cs63-\j)$) {\etcH};
}
\foreach \i in {0,1,2,63}{
    \node at ($(cs\i-2)!0.5!(cs\i-15)$) {\etcV};
}
\foreach \i in {0,1,2,63}{
\foreach \j [evaluate=\j as \k using int(\j+1)] in {0,1}{
\draw[arrow] (cs\i-\j)--(cs\i-\k);
}
\draw[arrow] (cs\i-15)--(cp\i-16);
}
\node at ($(cp2-16)!0.5!(cp63-16)$) {\etcH};

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "wots-imposteur-etape-2"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    imposteur/.style={fill=orange},
    signatureimposteur/.style={fill=orange!50!blue},
    message/.style={fill=yellow!50!white},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\def\H{0.5cm}
\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (1.5pt);
        }
    \end{tikzpicture}
}
\newcommand{\etcV}{
    \begin{tikzpicture}
        \begin{scope}[rotate=90]
            \foreach \i in {-0.25,0,0.25}{
                \draw[fill=black] (\i,0) circle (1.5pt);
            }
        \end{scope}
    \end{tikzpicture}
}

\node[clesecrete] (cs0-0) {$cs_{0}$};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2}{
    \node[clesecrete] (cs\i-0) [right=0.1cm of cs\j-0] {$cs_{\i}$};
}
\begin{scope}[xshift=8cm]
\node[clesecrete] (cs63-0) {$cs_{63}$};
\end{scope}

\foreach \i/\lbl/\bin/\imp [evaluate=\bin as \j using int(16-\bin)] in {0/{0011}/3/0111,1/{1100}/12/1101,2/{1001}/9/1011,63/{1110}/14/1111}{
    \node[message] (m\i) [above=4cm of cs\i-0] {\lbl};
    \node[imposteur] (i\i) [below=0cm of m\i] {\imp};
    \node [above=0cm of m\i] {Bloc \i};
}
\foreach \i/\bin [evaluate=\bin as \j using int(16-\bin)] in {2/9,63/14}{
    \node[signature] (s\i) [below=0cm of i\i] {$H^{\bin}(cs_{\i})$};
    \node[clepublique] (p\i) [below=0.75cm of s\i] {$H^{16}(cs_{\i})$};
    \draw[arrow] (s\i)--(p\i) node[midway,left=-0.6cm,font=\small] {\j\ $\times$};
}
\foreach \i/\bin [evaluate=\bin as \j using int(16-\bin)] in {0/7,1/13}{
    \node[signatureimposteur] (s\i) [below=0cm of i\i] {$H^{\bin}(cs_{\i})$};
    \node[clepublique] (p\i) [below=0.75cm of s\i] {$H^{16}(cs_{\i})$};
    \draw[arrow] (s\i)--(p\i) node[midway,left=-0.6cm,font=\small] {\j\ $\times$};
}
\node at ($(m2)!0.5!(m63)$) {\etcH};
\node at ($(i2)!0.5!(i63)$) {\etcH};
\node at ($(s2)!0.5!(s63)$) {\etcH};
\node at ($(p2)!0.5!(p63)$) {\etcH};

\foreach \j [evaluate=\j as \k using int(\j-1)] in {1,2}{
\foreach \i in {0,1,2,63}{
    \node[clesecrete] (cs\i-\j) [below=\H of cs\i-\k] {$H^{\j}(cs_{\i})$};
}
}
\foreach \i in {0,1,2,63}{
    \node[clesecrete] (cs\i-15) [below=1cm of cs\i-2] {$H^{15}(cs_{\i})$};
    \node[clepublique] (cp\i-16) [below=\H of cs\i-15] {$H^{16}(cs_{\i})$};
}

\foreach \j in {0,1,2,15}{
    \node at ($(cs2-\j)!0.5!(cs63-\j)$) {\etcH};
}
\foreach \i in {0,1,2,63}{
    \node at ($(cs\i-2)!0.5!(cs\i-15)$) {\etcV};
}
\foreach \i in {0,1,2,63}{
\foreach \j [evaluate=\j as \k using int(\j+1)] in {0,1}{
\draw[arrow] (cs\i-\j)--(cs\i-\k);
}
\draw[arrow] (cs\i-15)--(cp\i-16);
}
\node at ($(cp2-16)!0.5!(cp63-16)$) {\etcH};

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "wots-imposteur-etape-3"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    imposteur/.style={fill=orange},
    signatureimposteur/.style={fill=orange!50!blue},
    message/.style={fill=yellow!50!white},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\def\H{0.5cm}
\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (1.5pt);
        }
    \end{tikzpicture}
}
\newcommand{\etcV}{
    \begin{tikzpicture}
        \begin{scope}[rotate=90]
            \foreach \i in {-0.25,0,0.25}{
                \draw[fill=black] (\i,0) circle (1.5pt);
            }
        \end{scope}
    \end{tikzpicture}
}

\node[clesecrete] (cs0-0) {$cs_{0}$};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2}{
    \node[clesecrete] (cs\i-0) [right=0.1cm of cs\j-0] {$cs_{\i}$};
}
\begin{scope}[xshift=8cm]
\node[clesecrete] (cs63-0) {$cs_{63}$};
\end{scope}

\foreach \i/\lbl/\bin/\imp [evaluate=\bin as \j using int(16-\bin)] in {0/{0011}/3/0111,1/{1100}/12/1101,2/{1001}/9/1011,63/{1110}/14/1111}{
    \node[message] (m\i) [above=4cm of cs\i-0] {\lbl};
    \node[imposteur] (i\i) [below=0cm of m\i] {\imp};
    \node [above=0cm of m\i] {Bloc \i};
}
\foreach \i/\bin [evaluate=\bin as \j using int(16-\bin)] in {63/14}{
    \node[signature] (s\i) [below=0cm of i\i] {$H^{\bin}(cs_{\i})$};
    \node[clepublique] (p\i) [below=0.75cm of s\i] {$H^{16}(cs_{\i})$};
    \draw[arrow] (s\i)--(p\i) node[midway,left=-0.6cm,font=\small] {\j\ $\times$};
}
\foreach \i/\bin [evaluate=\bin as \j using int(16-\bin)] in {0/7,1/13,2/11}{
    \node[signatureimposteur] (s\i) [below=0cm of i\i] {$H^{\bin}(cs_{\i})$};
    \node[clepublique] (p\i) [below=0.75cm of s\i] {$H^{16}(cs_{\i})$};
    \draw[arrow] (s\i)--(p\i) node[midway,left=-0.6cm,font=\small] {\j\ $\times$};
}
\node at ($(m2)!0.5!(m63)$) {\etcH};
\node at ($(i2)!0.5!(i63)$) {\etcH};
\node at ($(s2)!0.5!(s63)$) {\etcH};
\node at ($(p2)!0.5!(p63)$) {\etcH};

\foreach \j [evaluate=\j as \k using int(\j-1)] in {1,2}{
\foreach \i in {0,1,2,63}{
    \node[clesecrete] (cs\i-\j) [below=\H of cs\i-\k] {$H^{\j}(cs_{\i})$};
}
}
\foreach \i in {0,1,2,63}{
    \node[clesecrete] (cs\i-15) [below=1cm of cs\i-2] {$H^{15}(cs_{\i})$};
    \node[clepublique] (cp\i-16) [below=\H of cs\i-15] {$H^{16}(cs_{\i})$};
}

\foreach \j in {0,1,2,15}{
    \node at ($(cs2-\j)!0.5!(cs63-\j)$) {\etcH};
}
\foreach \i in {0,1,2,63}{
    \node at ($(cs\i-2)!0.5!(cs\i-15)$) {\etcV};
}
\foreach \i in {0,1,2,63}{
\foreach \j [evaluate=\j as \k using int(\j+1)] in {0,1}{
\draw[arrow] (cs\i-\j)--(cs\i-\k);
}
\draw[arrow] (cs\i-15)--(cp\i-16);
}
\node at ($(cp2-16)!0.5!(cp63-16)$) {\etcH};

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "wots-imposteur-etape-4"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    imposteur/.style={fill=orange},
    signatureimposteur/.style={fill=orange!50!blue},
    message/.style={fill=yellow!50!white},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\def\H{0.5cm}
\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (1.5pt);
        }
    \end{tikzpicture}
}
\newcommand{\etcV}{
    \begin{tikzpicture}
        \begin{scope}[rotate=90]
            \foreach \i in {-0.25,0,0.25}{
                \draw[fill=black] (\i,0) circle (1.5pt);
            }
        \end{scope}
    \end{tikzpicture}
}

\node[clesecrete] (cs0-0) {$cs_{0}$};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2}{
    \node[clesecrete] (cs\i-0) [right=0.1cm of cs\j-0] {$cs_{\i}$};
}
\begin{scope}[xshift=8cm]
\node[clesecrete] (cs63-0) {$cs_{63}$};
\end{scope}

\foreach \i/\lbl/\bin/\imp [evaluate=\bin as \j using int(16-\bin)] in {0/{0011}/3/0111,1/{1100}/12/1101,2/{1001}/9/1011,63/{1110}/14/1111}{
    \node[message] (m\i) [above=4cm of cs\i-0] {\lbl};
    \node[imposteur] (i\i) [below=0cm of m\i] {\imp};
    \node [above=0cm of m\i] {Bloc \i};
}
\foreach \i/\bin [evaluate=\bin as \j using int(16-\bin)] in {0/7,1/13,2/11,63/15}{
    \node[signatureimposteur] (s\i) [below=0cm of i\i] {$H^{\bin}(cs_{\i})$};
    \node[clepublique] (p\i) [below=0.75cm of s\i] {$H^{16}(cs_{\i})$};
    \draw[arrow] (s\i)--(p\i) node[midway,left=-0.6cm,font=\small] {\j\ $\times$};
}
\node at ($(m2)!0.5!(m63)$) {\etcH};
\node at ($(i2)!0.5!(i63)$) {\etcH};
\node at ($(s2)!0.5!(s63)$) {\etcH};
\node at ($(p2)!0.5!(p63)$) {\etcH};

\foreach \j [evaluate=\j as \k using int(\j-1)] in {1,2}{
\foreach \i in {0,1,2,63}{
    \node[clesecrete] (cs\i-\j) [below=\H of cs\i-\k] {$H^{\j}(cs_{\i})$};
}
}
\foreach \i in {0,1,2,63}{
    \node[clesecrete] (cs\i-15) [below=1cm of cs\i-2] {$H^{15}(cs_{\i})$};
    \node[clepublique] (cp\i-16) [below=\H of cs\i-15] {$H^{16}(cs_{\i})$};
}

\foreach \j in {0,1,2,15}{
    \node at ($(cs2-\j)!0.5!(cs63-\j)$) {\etcH};
}
\foreach \i in {0,1,2,63}{
    \node at ($(cs\i-2)!0.5!(cs\i-15)$) {\etcV};
}
\foreach \i in {0,1,2,63}{
\foreach \j [evaluate=\j as \k using int(\j+1)] in {0,1}{
\draw[arrow] (cs\i-\j)--(cs\i-\k);
}
\draw[arrow] (cs\i-15)--(cp\i-16);
}
\node at ($(cp2-16)!0.5!(cp63-16)$) {\etcH};

\end{tikzpicture}
#
#
#
#
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "tally-etape-0"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
 \begin{tikzpicture}[
mytally/.style={draw,minimum width = 5cm,minimum height = 3cm,line width = 2pt},
count/.style={font=\Huge}
]
\def\h{0.75cm}

\node[mytally] (A) at (0,0) {
\tikz {
    \foreach \i in {1,...,3}{
        \draw[line width = 4pt, blue] (\i*\h,0)--++(0,2);
    }
}   
};
\node[count,below = 0.5cm  of A] (tallyA) {\textbf{3}};

\node[mytally] (B) [right=0cm of A] {
\tikz {
    \foreach \i/\col in {1/blue}{
        \draw[line width = 4pt, \col] (\i*\h,0)--++(0,2);
    }
}   
};
\node[count,below = 0.5cm  of B] (tallyB) {\textbf{1}};

\node[mytally] (C) [right=0cm of B] {
\tikz {
    \foreach \i in {1,2,3,4}{
        \draw[line width = 4pt, blue] (\i*\h,0)--++(0,2);
    }
}   
};
\node[count,below = 0.5cm  of C] (tallyC) {\textbf{4}};

\end{tikzpicture}
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "tally-etape-1"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
 \begin{tikzpicture}[
mytally/.style={draw,minimum width = 5cm,minimum height = 3cm,line width = 2pt},
count/.style={font=\Huge}
]
\def\h{0.75cm}

\node[mytally] (A) at (0,0) {
\tikz {
    \foreach \i in {1,...,3}{
        \draw[line width = 4pt, blue] (\i*\h,0)--++(0,2);
    }
}   
};
\node[count,below = 0.5cm  of A] (tallyA) {\textbf{3}};

\node[mytally] (B) [right=0cm of A] {
\tikz {
    \foreach \i/\col in {1/blue,2/red}{
        \draw[line width = 4pt, \col] (\i*\h,0)--++(0,2);
    }
}   
};
\node[count,below = 0.5cm  of B] (tallyB) {\textbf{1}};
\draw[red, line width = 2pt] (tallyB.west) -- (tallyB.east);
\node[count,below = 0.25cm  of tallyB] (tallyBB) {\textbf{2}};

\node[mytally] (C) [right=0cm of B] {
\tikz {
    \foreach \i in {1,2,3,4}{
        \draw[line width = 4pt, blue] (\i*\h,0)--++(0,2);
    }
}   
};
\node[count,below = 0.5cm  of C] (tallyC) {\textbf{4}};

\end{tikzpicture}
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "tally-etape-2"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
mytally/.style={draw,minimum width = 5cm,minimum height = 3cm,line width = 2pt},
count/.style={font=\Huge}
]
\def\h{0.75cm}
\def\H{0.5cm}

\node[mytally] (A) at (0,0) {
\tikz {
    \foreach \i in {1,...,3}{
        \draw[line width = 4pt, blue] (\i*\h,0)--++(0,2);
    }
}   
};
\node[count,below = 0.5cm  of A] (tallyA) {\textbf{3}};

\node[mytally] (B) [right=0cm of A] {
\tikz {
    \foreach \i/\col in {1/blue}{
        \draw[line width = 4pt, \col] (\i*\h,0)--++(0,2);
    }
}   
};
\node[count,below = 0.5cm  of B] (tallyB) {\textbf{1}};

\node[mytally] (C) [right=0cm of B] {
\tikz {
    \foreach \i in {1,2,3,4}{
        \draw[line width = 4pt, blue] (\i*\h,0)--++(0,2);
    }
}   
};
\node[count,below = 0.5cm  of C] (tallyC) {\textbf{4}};

\node[mytally] (D) [right=1cm of C] {
\tikz {
    \foreach \i in {1,...,4}{
        \draw[line width = 4pt, blue] (\i*\H,0)--++(0,2);
    }
    \draw[line width = 4pt, blue] (\H,0)--(4*\H,2);
    \foreach \i in {6,7}{
        \draw[line width = 4pt, blue] (\i*\H,0)--++(0,2);
    }
}   
};
\node[count,below = 0.5cm  of D] (tallyD) {\textbf{7}};

\end{tikzpicture}
#
#
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "tally-etape-3"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
mytally/.style={draw,minimum width = 5cm,minimum height = 3cm,line width = 2pt},
count/.style={font=\Huge}
]
\def\h{0.75cm}
\def\H{0.5cm}

\node[mytally] (A) at (0,0) {
\tikz {
    \foreach \i in {1,...,3}{
        \draw[line width = 4pt, blue] (\i*\h,0)--++(0,2);
    }
}   
};
\node[count,below = 0.5cm  of A] (tallyA) {\textbf{3}};

\node[mytally] (B) [right=0cm of A] {
\tikz {
    \foreach \i/\col in {1/blue}{
        \draw[line width = 4pt, \col] (\i*\h,0)--++(0,2);
    }
}   
};
\node[count,below = 0.5cm  of B] (tallyB) {\textbf{1}};

\node[mytally] (C) [right=0cm of B] {
\tikz {
    \foreach \i in {1,2,3,4}{
        \draw[line width = 4pt, blue] (\i*\h,0)--++(0,2);
    }
}   
};
\node[count,below = 0.5cm  of C] (tallyC) {\textbf{4}};

\node[mytally] (D) [right=1cm of C] {
\tikz {
    \foreach \i in {1,...,4}{
        \draw[line width = 4pt, blue] (\i*\H,0)--++(0,2);
    }
    \draw[line width = 4pt, blue] (\H,0)--(4*\H,2);
    \foreach \i in {6,7}{
        \draw[line width = 4pt, blue] (\i*\H,0)--++(0,2);
    }
}   
};
\node[count,below = 0.5cm  of D] (tallyD) {\textbf{7}};

\end{tikzpicture}
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "somme-de-controle"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    imposteur/.style={fill=orange},
    signatureimposteur/.style={fill=orange!50!blue},
    message/.style={fill=yellow!50!white},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\def\H{0.5cm}
\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (1.5pt);
        }
    \end{tikzpicture}
}
\newcommand{\etcV}{
    \begin{tikzpicture}
        \begin{scope}[rotate=90]
            \foreach \i in {-0.25,0,0.25}{
                \draw[fill=black] (\i,0) circle (1.5pt);
            }
        \end{scope}
    \end{tikzpicture}
}

\node[clesecrete] (cs0-0) {$cs_{0}$};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2}{
    \node[clesecrete] (cs\i-0) [right=0.1cm of cs\j-0] {$cs_{\i}$};
}
\begin{scope}[xshift=8cm]
\node[clesecrete] (cs63-0) {$cs_{63}$};
\end{scope}
\foreach \i [evaluate=\i as \j using int(\i-1)] in {64,65,66}{
    \node[clesecrete] (cs\i-0) [right=0.1cm of cs\j-0] {$cs_{\i}$};
}

\foreach \i/\lbl/\imp/\bin  in {0/{0011}/3/0111,1/{1100}/12/1101,2/{1001}/9/1011,63/{1110}/14/1111,64/{Somme}/{Nombre},65/{de}/{$<$},66/{contrôle}/{petit}}{
    \node[message] (m\i) [above=4cm of cs\i-0] {\lbl};
    \node[imposteur] (i\i) [below=0cm of m\i] {\bin};
    \node [above=0cm of m\i] {Bloc \i};
}
% \foreach \i/\bin [evaluate=\bin as \j using int(16-\bin)] in {0/3,1/12,2/9,63/14}{
%     \node[signature] (s\i) [below=0cm of i\i] {$H^{\bin}(cs_0)$};
%     \node[clepublique] (p\i) [below=0.75cm of s\i] {$H^{16}(cs_{\i})$};
%     \draw[arrow] (s\i)--(p\i) node[midway,left=-0.6cm,font=\small] {\j\ $\times$};
% }
\foreach \i/\bin [evaluate=\bin as \j using int(16-\bin)] in {0/7,1/13,2/11,63/15}{
    \node[signatureimposteur] (s\i) [below=0cm of i\i] {$H^{\bin}(cs_{\i})$};
    \node[clepublique] (p\i) [below=0.75cm of s\i] {$H^{16}(cs_{\i})$};
    \draw[arrow] (s\i)--(p\i) node[midway,left=-0.6cm,font=\small] {\j\ $\times$};
}
\foreach \i in {64,65,66}{
    \node[signatureimposteur] (s\i) [below=0cm of i\i] {$H^{???}(cs_{\i})$};
    \node[clepublique] (p\i) [below=0.75cm of s\i] {$H^{16}(cs_{\i})$};
    \draw[arrow,red] (p\i)--(s\i);
}
\node at ($(m2)!0.5!(m63)$) {\etcH};
\node at ($(i2)!0.5!(i63)$) {\etcH};
\node at ($(s2)!0.5!(s63)$) {\etcH};
\node at ($(p2)!0.5!(p63)$) {\etcH};

\foreach \j [evaluate=\j as \k using int(\j-1)] in {1,2}{
\foreach \i in {0,1,2,63,64,65,66}{
    \node[clesecrete] (cs\i-\j) [below=\H of cs\i-\k] {$H^{\j}(cs_{\i})$};
}
}
\foreach \i in {0,1,2,63,64,65,66}{
    \node[clesecrete] (cs\i-15) [below=1cm of cs\i-2] {$H^{15}(cs_{\i})$};
    \node[clepublique] (cp\i-16) [below=\H of cs\i-15] {$H^{16}(cs_{\i})$};
}

\foreach \j in {0,1,2,15}{
    \node at ($(cs2-\j)!0.5!(cs63-\j)$) {\etcH};
}
\foreach \i in {0,1,2,63,64,65,66}{
    \node at ($(cs\i-2)!0.5!(cs\i-15)$) {\etcV};
}
\foreach \i in {0,1,2,63,64,65,66}{
\foreach \j [evaluate=\j as \k using int(\j+1)] in {0,1}{
\draw[arrow] (cs\i-\j)--(cs\i-\k);
}
\draw[arrow] (cs\i-15)--(cp\i-16);
}
\node at ($(cp2-16)!0.5!(cp63-16)$) {\etcH};

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "wots-plus-message"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    imposteur/.style={fill=orange},
    signatureimposteur/.style={fill=orange!50!blue},
    message/.style={fill=yellow!50!white},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\def\H{0.5cm}
\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (1.5pt);
        }
    \end{tikzpicture}
}
\newcommand{\etcV}{
    \begin{tikzpicture}
        \begin{scope}[rotate=90]
            \foreach \i in {-0.25,0,0.25}{
                \draw[fill=black] (\i,0) circle (1.5pt);
            }
        \end{scope}
    \end{tikzpicture}
}

\node[clesecrete] (cs0-0) {$cs_{0}$};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2}{
    \node[clesecrete] (cs\i-0) [right=0.1cm of cs\j-0] {$cs_{\i}$};
}
\begin{scope}[xshift=8cm]
\node[clesecrete] (cs63-0) {$cs_{63}$};
\end{scope}
\foreach \i [evaluate=\i as \j using int(\i-1)] in {64,65,66}{
    \node[clesecrete] (cs\i-0) [right=0.1cm of cs\j-0] {$cs_{\i}$};
}

\foreach \i/\lbl/\imp/\bin  in {0/{0011}/3/0111,1/{1100}/12/1101,2/{1001}/9/1011,63/{1110}/14/1111,64/{Somme}/{Nombre},65/{de}/{$<$},66/{contrôle}/{petit}}{
    \node[message] (m\i) [above=3cm of cs\i-0] {\lbl};
    \node [above=0cm of m\i] {Bloc \i};
}
\foreach \i/\bin [evaluate=\bin as \j using int(16-\bin)] in {0/3,1/12,2/9,63/14,64/2,65/13,66/11}{
    \node[signature] (s\i) [below=0cm of m\i] {$H^{\bin}(cs_{\i})$};
    \node[clepublique] (p\i) [below=0.75cm of s\i] {$H^{16}(cs_{\i})$};
    \draw[arrow] (s\i)--(p\i) node[midway,left=-0.6cm,font=\small] {\j\ $\times$};
}
\node at ($(m2)!0.5!(m63)$) {\etcH};
\node at ($(s2)!0.5!(s63)$) {\etcH};
\node at ($(p2)!0.5!(p63)$) {\etcH};

\foreach \j [evaluate=\j as \k using int(\j-1)] in {1,2}{
\foreach \i in {0,1,2,63,64,65,66}{
    \node[clesecrete] (cs\i-\j) [below=\H of cs\i-\k] {$H^{\j}(cs_{\i})$};
}
}
\foreach \i in {0,1,2,63,64,65,66}{
    \node[clesecrete] (cs\i-15) [below=1cm of cs\i-2] {$H^{15}(cs_{\i})$};
    \node[clepublique] (cp\i-16) [below=\H of cs\i-15] {$H^{16}(cs_{\i})$};
}

\foreach \j in {0,1,2,15}{
    \node at ($(cs2-\j)!0.5!(cs63-\j)$) {\etcH};
}
\foreach \i in {0,1,2,63,64,65,66}{
    \node at ($(cs\i-2)!0.5!(cs\i-15)$) {\etcV};
}
\foreach \i in {0,1,2,63,64,65,66}{
\foreach \j [evaluate=\j as \k using int(\j+1)] in {0,1}{
\draw[arrow] (cs\i-\j)--(cs\i-\k);
}
\draw[arrow] (cs\i-15)--(cp\i-16);
}
\node at ($(cp2-16)!0.5!(cp63-16)$) {\etcH};

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "wots-complet"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    imposteur/.style={fill=orange},
    signatureimposteur/.style={fill=orange!50!blue},
    message/.style={fill=yellow!50!white},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\def\H{0.5cm}
\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (1.5pt);
        }
    \end{tikzpicture}
}
\newcommand{\etcV}{
    \begin{tikzpicture}
        \begin{scope}[rotate=90]
            \foreach \i in {-0.25,0,0.25}{
                \draw[fill=black] (\i,0) circle (1.5pt);
            }
        \end{scope}
    \end{tikzpicture}
}

\node[clesecrete] (cs0-0) {$cs_{0}$};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2}{
    \node[clesecrete] (cs\i-0) [right=0.1cm of cs\j-0] {$cs_{\i}$};
}
\begin{scope}[xshift=8cm]
\node[clesecrete] (cs63-0) {$cs_{63}$};
\end{scope}
\foreach \i [evaluate=\i as \j using int(\i-1)] in {64,65,66}{
    \node[clesecrete] (cs\i-0) [right=0.1cm of cs\j-0] {$cs_{\i}$};
}

\foreach \j [evaluate=\j as \k using int(\j-1)] in {1,2}{
\foreach \i in {0,1,2,63,64,65,66}{
    \node[clesecrete] (cs\i-\j) [below=\H of cs\i-\k] {$H^{\j}(cs_{\i})$};
}
}
\foreach \i in {0,1,2,63,64,65,66}{
    \node[clesecrete] (cs\i-15) [below=1cm of cs\i-2] {$H^{15}(cs_{\i})$};
    \node[clepublique] (cp\i-16) [below=\H of cs\i-15] {$H^{16}(cs_{\i})$};
}

\foreach \j in {0,1,2,15}{
    \node at ($(cs2-\j)!0.5!(cs63-\j)$) {\etcH};
}
\foreach \i in {0,1,2,63,64,65,66}{
    \node at ($(cs\i-2)!0.5!(cs\i-15)$) {\etcV};
}
\foreach \i in {0,1,2,63,64,65,66}{
\foreach \j [evaluate=\j as \k using int(\j+1)] in {0,1}{
\draw[arrow] (cs\i-\j)--(cs\i-\k);
}
\draw[arrow] (cs\i-15)--(cp\i-16);
}
\node at ($(cp2-16)!0.5!(cp63-16)$) {\etcH};

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "wots-complet-hash-cle-publique"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    imposteur/.style={fill=orange},
    signatureimposteur/.style={fill=orange!50!blue},
    message/.style={fill=yellow!50!white},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\def\H{0.5cm}
\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (1.5pt);
        }
    \end{tikzpicture}
}
\newcommand{\etcV}{
    \begin{tikzpicture}
        \begin{scope}[rotate=90]
            \foreach \i in {-0.25,0,0.25}{
                \draw[fill=black] (\i,0) circle (1.5pt);
            }
        \end{scope}
    \end{tikzpicture}
}

\node[clesecrete] (cs0-0) {$cs_{0}$};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2}{
    \node[clesecrete] (cs\i-0) [right=0.1cm of cs\j-0] {$cs_{\i}$};
}
\begin{scope}[xshift=8cm]
\node[clesecrete] (cs63-0) {$cs_{63}$};
\end{scope}
\foreach \i [evaluate=\i as \j using int(\i-1)] in {64,65,66}{
    \node[clesecrete] (cs\i-0) [right=0.1cm of cs\j-0] {$cs_{\i}$};
}

\foreach \j [evaluate=\j as \k using int(\j-1)] in {1,2}{
\foreach \i in {0,1,2,63,64,65,66}{
    \node[clesecrete] (cs\i-\j) [below=\H of cs\i-\k] {$H^{\j}(cs_{\i})$};
}
}
\foreach \i in {0,1,2,63,64,65,66}{
    \node[clesecrete] (cs\i-15) [below=1cm of cs\i-2] {$H^{15}(cs_{\i})$};
    \node[clepublique] (cp\i-16) [below=\H of cs\i-15] {$H^{16}(cs_{\i})$};
}

\foreach \j in {0,1,2,15}{
    \node at ($(cs2-\j)!0.5!(cs63-\j)$) {\etcH};
}
\foreach \i in {0,1,2,63,64,65,66}{
    \node at ($(cs\i-2)!0.5!(cs\i-15)$) {\etcV};
}
\foreach \i in {0,1,2,63,64,65,66}{
\foreach \j [evaluate=\j as \k using int(\j+1)] in {0,1}{
\draw[arrow] (cs\i-\j)--(cs\i-\k);
}
\draw[arrow] (cs\i-15)--(cp\i-16);
}
\node at ($(cp2-16)!0.5!(cp63-16)$) {\etcH};

\node[clepublique] (mcp) at ($(cp0-16)!0.5!(cp66-16)+(0,-2)$) {Clé Publique};

\draw[arrow] (cp0-16.south)--++(0,-0.45)-|(mcp.north);
\foreach \i in {1,2,63,64,65}{
    \draw[very thick] (cp\i-16.south)--++(0,-0.45);
}
\draw[very thick] (cp66-16.south)--++(0,-0.45)-|(mcp.north);

\end{tikzpicture}
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "wots-schematise-BT"
#| cache: true
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
clesecrete/.style={draw,thick,circle,fill=red!50!white,minimum width=0.5cm},
signature/.style={draw,thick,circle,fill=blue!50!white,minimum width=0.5cm},
clepublique/.style={draw,thick,circle,fill=green!50!white,minimum width=0.5cm}
]

\def\V{4}        % hauteur totale
\def\dx{0.75}     % espacement horizontal

% #1 = liste des hauteurs (ex: {1,3,2})
\newcommand{\wots}[2]{
    \def\n{0}
    \foreach \val [count=\i] in {#1} {
        \pgfmathsetmacro{\x}{(\i-1)*\dx}
        % Partie secrète (rouge)
        \fill[red!50!white] (\x-0.25,0) rectangle ++(0.5,\val);
        % Partie publique (vert)
        \fill[green!50!white] (\x-0.25,\val) rectangle (\x+0.25,\V);
        % Noeuds
        \node[clesecrete] (cs-\i) at (\x,0) {};
        \node[clepublique] (cp-\i) at (\x,\V) {};
        % Lien
        \draw[dotted,thick] (cs-\i) -- (cp-\i);
        \node[signature] (s-\i) at (\x,\val) {};
        \xdef\n{\i}
    }
    % Position du rectangle à droite
    \pgfmathsetmacro{\xright}{(\n)*\dx}
    % Rectangle dégradé global
    \shade[
        bottom color=red!50!white,
        top color=green!50!white
    ] (\xright-0.25,0) rectangle (\xright+0.5,\V);
    \draw[dotted,thick] (\xright-0.25,0)--(\xright+0.5,0);
    \draw[dotted,thick] (\xright-0.25,\V)--(\xright+0.5,\V);
    \pgfmathsetmacro{\xlast}{(\n+1)*\dx+0.25}
    % Partie secrète (rouge)
    \fill[red!50!white] (\xlast-0.25,0) rectangle ++(0.5,#2);
    % Partie publique (vert)
    \fill[green!50!white] (\xlast-0.25,#2) rectangle (\xlast+0.25,\V);
    \node[clesecrete] (cs-fin) at (\xlast,0) {};
    \node[clepublique] (cp-fin) at (\xlast,\V) {};
    \draw[dotted,thick] (cs-fin) -- (cp-fin);
    \node[signature] at (\xlast,#2) {};

    \node[clepublique] (cp-haut) at ($(cp-1)!0.5!(cp-fin)+(0,1)$) {};
    \foreach \i in {1,2,3,fin}{
        \draw[thick] (cp-haut.south)--(cp-\i.north);
    }
    \draw[thick,dotted] (cp-haut.south)--(\xright+0.125,\V);
}

% Exemple
\wots{1,3,2}{2.75}

\end{tikzpicture}
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "hors-16-octets-etape-0"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    imposteur/.style={fill=orange},
    signatureimposteur/.style={fill=orange!50!blue},
    message/.style={fill=yellow!50!white},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\def\H{0cm}
\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (1.5pt);
        }
    \end{tikzpicture}
}
\newcommand{\etcV}{
    \begin{tikzpicture}
        \begin{scope}[rotate=90]
            \foreach \i in {-0.25,0,0.25}{
                \draw[fill=black] (\i,0) circle (1.5pt);
            }
        \end{scope}
    \end{tikzpicture}
}

\node[clesecrete] (cs0) {$cs_{0}$};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2,3}{
    \node[clesecrete] (cs\i) [right=0.1cm of cs\j] {$cs_{\i}$};
}
\node[clesecrete] (cs13) [right=1.5cm of cs3] {$cs_{65\ 533}$};
\node[clesecrete] (cs14) [right=0.1cm of cs13] {$cs_{65\ 534}$};
\node[clesecrete] (cs15) [right=0.1cm of cs14] {$cs_{65\ 535}$};

\foreach \i/\lbl in {0,1,2,3,13/{65\ 533},14/{65\ 534},15/{65\ 535}}{
    \node[clepublique] (cp\i) [below=1cm of cs\i] {$cp_{\lbl}$};
}

\node[message] (m0) [above right=3.5cm and -2cm of cs0] {1011 1100 1010 0011};
\node [above=0cm of m0] {Bloc 0};
\foreach \i/\lbl [evaluate=\i as \j using int(\i-1)] in {1/{0001 1100 1001 0010},2/{1101 1010 1100 0111}}{
    \node[message] (m\i) [right=0.5cm of m\j] {\lbl};
    \node [above=0cm of m\i] {Bloc \i};
}
\node[message] (m15) [right=1.5cm of m2] {0101 0011 1101 0010};
    \node [above=0cm of m15] {Bloc 15};
\node at ($(m2)!0.5!(m15)$) {\etcH};
\node at ($(cs3)!0.5!(cs13)$) {\etcH};
\node at ($(cp3)!0.5!(cp13)$) {\etcH};

\foreach \i/\lbl in {0/{48\ 291},1/{7314},2/{56\ 007},15/{21\ 458}}{
    %\node[signature] (s\i) [below=0cm of m\i] {$cs_{\lbl}$};
    %\node[clepublique] (p\i) [below=1cm of s\i] {$cp_{\lbl}$};
    %\draw[arrow] (s\i)--(p\i);
}
%\node at ($(s2)!0.5!(s15)$) {\etcH};
%\node at ($(p2)!0.5!(p15)$) {\etcH};

\foreach \i in {0,1,2,3,13,14,15}{
    \draw[arrow] (cs\i)--(cp\i);
}

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "hors-16-octets-etape-1"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    imposteur/.style={fill=orange},
    signatureimposteur/.style={fill=orange!50!blue},
    message/.style={fill=yellow!50!white},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\def\H{0cm}
\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (1.5pt);
        }
    \end{tikzpicture}
}
\newcommand{\etcV}{
    \begin{tikzpicture}
        \begin{scope}[rotate=90]
            \foreach \i in {-0.25,0,0.25}{
                \draw[fill=black] (\i,0) circle (1.5pt);
            }
        \end{scope}
    \end{tikzpicture}
}

\node[clesecrete] (cs0) {$cs_{0}$};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2,3}{
    \node[clesecrete] (cs\i) [right=0.1cm of cs\j] {$cs_{\i}$};
}
\node[clesecrete] (cs13) [right=1.5cm of cs3] {$cs_{65\ 533}$};
\node[clesecrete] (cs14) [right=0.1cm of cs13] {$cs_{65\ 534}$};
\node[clesecrete] (cs15) [right=0.1cm of cs14] {$cs_{65\ 535}$};

\foreach \i/\lbl in {0,1,2,3,13/{65\ 533},14/{65\ 534},15/{65\ 535}}{
    \node[clepublique] (cp\i) [below=1cm of cs\i] {$cp_{\lbl}$};
}

\node[message] (m0) [above right=3.5cm and -2cm of cs0] {1011 1100 1010 0011};
\node [above=0cm of m0] {Bloc 0};
\foreach \i/\lbl [evaluate=\i as \j using int(\i-1)] in {1/{0001 1100 1001 0010},2/{1101 1010 1100 0111}}{
    \node[message] (m\i) [right=0.5cm of m\j] {\lbl};
    \node [above=0cm of m\i] {Bloc \i};
}
\node[message] (m15) [right=1.5cm of m2] {0101 0011 1101 0010};
    \node [above=0cm of m15] {Bloc 15};
\node at ($(m2)!0.5!(m15)$) {\etcH};
\node at ($(cs3)!0.5!(cs13)$) {\etcH};
\node at ($(cp3)!0.5!(cp13)$) {\etcH};

\foreach \i/\lbl in {0/{48\ 291},1/{7314},2/{56\ 007},15/{21\ 458}}{
    \node[signature] (s\i) [below=0cm of m\i] {$cs_{\lbl}$};
    %\node[clepublique] (p\i) [below=1cm of s\i] {$cp_{\lbl}$};
    %\draw[arrow] (s\i)--(p\i);
}
\node at ($(s2)!0.5!(s15)$) {\etcH};
%\node at ($(p2)!0.5!(p15)$) {\etcH};

\foreach \i in {0,1,2,3,13,14,15}{
    \draw[arrow] (cs\i)--(cp\i);
}

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "hors-16-octets-etape-2"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={very thick, rectangle, align=center, minimum width=2cm, minimum height = 1cm, font=\normalsize},
    signature/.style={fill=blue!50!white},
    clesecrete/.style={fill=red},
    clepublique/.style={fill=green},
    imposteur/.style={fill=orange},
    signatureimposteur/.style={fill=orange!50!blue},
    message/.style={fill=yellow!50!white},
    arrow/.style={->, very thick},
    messagearrow/.style={very thick, blue},
]

\def\H{0cm}
\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.25,0,0.25}{
        \draw[fill=black] (\i,0) circle (1.5pt);
        }
    \end{tikzpicture}
}
\newcommand{\etcV}{
    \begin{tikzpicture}
        \begin{scope}[rotate=90]
            \foreach \i in {-0.25,0,0.25}{
                \draw[fill=black] (\i,0) circle (1.5pt);
            }
        \end{scope}
    \end{tikzpicture}
}

\node[clesecrete] (cs0) {$cs_{0}$};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2,3}{
    \node[clesecrete] (cs\i) [right=0.1cm of cs\j] {$cs_{\i}$};
}
\node[clesecrete] (cs13) [right=1.5cm of cs3] {$cs_{65\ 533}$};
\node[clesecrete] (cs14) [right=0.1cm of cs13] {$cs_{65\ 534}$};
\node[clesecrete] (cs15) [right=0.1cm of cs14] {$cs_{65\ 535}$};

\foreach \i/\lbl in {0,1,2,3,13/{65\ 533},14/{65\ 534},15/{65\ 535}}{
    \node[clepublique] (cp\i) [below=1cm of cs\i] {$cp_{\lbl}$};
}

\node[message] (m0) [above right=3.5cm and -2cm of cs0] {1011 1100 1010 0011};
\node [above=0cm of m0] {Bloc 0};
\foreach \i/\lbl [evaluate=\i as \j using int(\i-1)] in {1/{0001 1100 1001 0010},2/{1101 1010 1100 0111}}{
    \node[message] (m\i) [right=0.5cm of m\j] {\lbl};
    \node [above=0cm of m\i] {Bloc \i};
}
\node[message] (m15) [right=1.5cm of m2] {0101 0011 1101 0010};
    \node [above=0cm of m15] {Bloc 15};
\node at ($(m2)!0.5!(m15)$) {\etcH};
\node at ($(cs3)!0.5!(cs13)$) {\etcH};
\node at ($(cp3)!0.5!(cp13)$) {\etcH};

\foreach \i/\lbl in {0/{48\ 291},1/{7314},2/{56\ 007},15/{21\ 458}}{
    \node[signature] (s\i) [below=0cm of m\i] {$cs_{\lbl}$};
    \node[clepublique] (p\i) [below=1cm of s\i] {$cp_{\lbl}$};
    \draw[arrow] (s\i)--(p\i);
}
\node at ($(s2)!0.5!(s15)$) {\etcH};
\node at ($(p2)!0.5!(p15)$) {\etcH};

\foreach \i in {0,1,2,3,13,14,15}{
    \draw[arrow] (cs\i)--(cp\i);
}

\end{tikzpicture}
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "horst-8"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={circle, draw=black, thick, minimum size=8mm, inner sep=0pt},
    level 1/.style={sibling distance=4cm, level distance=1.5cm},
    level 2/.style={sibling distance=2cm, level distance=1.5cm},
    level 3/.style={sibling distance=1cm, level distance=1.5cm},
    edge from parent/.style={draw,<-,very thick},
    clesecrete/.style={rectangle,fill=red}
]

% Root
\node[fill=green] (racine) {}
    child {node {}
        child {node {}
            node {}
                child {node {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
        child {node {}
                child {node {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
    }
    child {node {}
        child {node {}
                child {node {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
        child {node {}
                child {node {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
    };

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "horst-8-signature"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={circle, draw=black, thick, minimum size=8mm, inner sep=0pt},
    level 1/.style={sibling distance=4cm, level distance=1.5cm},
    level 2/.style={sibling distance=2cm, level distance=1.5cm},
    level 3/.style={sibling distance=1cm, level distance=1.5cm},
    edge from parent/.style={draw,<-,very thick},
    clesecrete/.style={rectangle}
]

% Root
\node[label={[label distance=-0.75cm]90:Clé publique},fill=green] (racine) {}
    child {node[fill=black!50!white,draw=red!50!white,line width=4pt] {}
        child {node[fill=blue!50!white] {}
            node {}
                child {node (cs) {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
        child {node {}
                child {node[fill=blue!50!white] {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete,fill=blue] {011}}}}
    }
    child {node[fill=blue!50!white] {}
        child {node[fill=red!50!white] {}
                child {node {} child {node[clesecrete,fill=black,text=white] {100}}}
                child {node[fill=black!50!white] {} child {node[clesecrete] {}}}}
        child {node[fill=black!50!white] {}
                child {node {} child {node[clesecrete,fill=red] {110}}}
                child {node[fill=red!50!white] {} child {node[clesecrete] {}}}}
    };

% \draw[very thick,|-|] ($(cs.west)+(-0.5,0)$)--++(0,3) node[draw=white,midway,left=0.1cm] {$h=16$};

\end{tikzpicture}
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "fors-8-signature"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={circle, draw=black, thick, minimum size=8mm, inner sep=0pt},
    level 1/.style={sibling distance=4cm, level distance=1.5cm},
    level 2/.style={sibling distance=2cm, level distance=1.5cm},
    level 3/.style={sibling distance=1cm, level distance=1.5cm},
    edge from parent/.style={draw,<-,very thick},
    clesecrete/.style={rectangle}
]

% Root
\node[label={[label distance=-0.75cm]90:Clé publique 0},fill=green] (racine0) {}
    child {node {}
        child {node[fill=blue!50!white] {}
            node {}
                child {node (cs) {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
        child {node {}
                child {node[fill=blue!50!white] {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete,fill=blue] {011}}}}
    }
    child {node[fill=blue!50!white] {}
        child {node {}
                child {node {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
        child {node {}
                child {node {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
    };

\node[label={[label distance=-0.75cm]90:Clé publique 1},fill=green] (racine1) [right=8cm of racine0] {}
    child {node[fill=red!50!white] {}
        child {node {}
            node {}
                child {node (cs) {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
        child {node {}
                child {node {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
    }
    child {node {}
        child {node[fill=red!50!white] {}
                child {node {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
        child {node {}
                child {node {} child {node[clesecrete,fill=red] {110}}}
                child {node[fill=red!50!white] {} child {node[clesecrete] {}}}}
    };

\node[label={[label distance=-0.75cm]90:Clé publique 2},fill=green] (racine2) [right=8cm of racine1] {}
    child {node[fill=black!50!white] {}
        child {node {}
            node {}
                child {node (cs) {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
        child {node {}
                child {node {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
    }
    child {node {}
        child {node {}
                child {node {} child {node[clesecrete,fill=black,text=white] {100}}}
                child {node[fill=black!50!white] {} child {node[clesecrete] {}}}}
        child {node[fill=black!50!white] {}
                child {node {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
    };

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "fors-8-signature-unique"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
    every node/.style={circle, draw=black, thick, minimum size=8mm, inner sep=0pt},
    level 1/.style={sibling distance=4cm, level distance=1.5cm},
    level 2/.style={sibling distance=2cm, level distance=1.5cm},
    level 3/.style={sibling distance=1cm, level distance=1.5cm},
    edge from parent/.style={draw,<-,very thick},
    clesecrete/.style={rectangle}
]

% Root
\node[fill=green] (racine0) {}
    child {node {}
        child {node[fill=blue!50!white] {}
            node {}
                child {node (cs) {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
        child {node {}
                child {node[fill=blue!50!white] {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete,fill=blue] {011}}}}
    }
    child {node[fill=blue!50!white] {}
        child {node {}
                child {node {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
        child {node {}
                child {node {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
    };

\node[fill=green] (racine1) [right=8cm of racine0] {}
    child {node[fill=red!50!white] {}
        child {node {}
            node {}
                child {node (cs) {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
        child {node {}
                child {node {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
    }
    child {node {}
        child {node[fill=red!50!white] {}
                child {node {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
        child {node {}
                child {node {} child {node[clesecrete,fill=red] {110}}}
                child {node[fill=red!50!white] {} child {node[clesecrete] {}}}}
    };

\node[fill=green] (racine2) [right=8cm of racine1] {}
    child {node[fill=black!50!white] {}
        child {node {}
            node {}
                child {node (cs) {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
        child {node {}
                child {node {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
    }
    child {node {}
        child {node {}
                child {node {} child {node[clesecrete,fill=black,text=white] {100}}}
                child {node[fill=black!50!white] {} child {node[clesecrete] {}}}}
        child {node[fill=black!50!white] {}
                child {node {} child {node[clesecrete] {}}}
                child {node {} child {node[clesecrete] {}}}}
    };

\draw[very thick] (racine0)--($(racine0)+(0,1)$)|-($(racine2)+(0,1)$)--(racine2);
\draw[very thick,->] (racine1)--($(racine1)+(0,2)$) node[above,fill=green] {CP};

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "fors-schematise"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}

%------------------------------------------------
% Mini arbre binaire
% #1 = centre de l'arbre
%------------------------------------------------
\newcommand{\MiniTree}[1]{

    % Racine
    \node[draw,circle,fill=white,inner sep=2pt]
        (root) at (#1) {};

    % Feuilles
    \node[draw,circle,fill=white,inner sep=2pt]
        (leafL) at ($(root)+(-0.12,-0.28)$) {};

    \node[draw,circle,fill=white,inner sep=2pt]
        (leafR) at ($(root)+(0.12,-0.28)$) {};

    % Arêtes
    \draw (root) -- (leafL);
    \draw (root) -- (leafR);
}

%------------------------------------------------
% #1 = node au sommet supérieur
% #2 = largeur du triangle
% #3 = hauteur du triangle
%------------------------------------------------
\newcommand{\TopTriangle}[3]{

    % Sommets du triangle
    \coordinate (left)  at ($(#1)+(-#2/2,-#3)$);
    \coordinate (right) at ($(#1)+(#2/2,-#3)$);

    % Triangle
    \draw[very thick,fill=green!30]
        (#1) -- (left) -- (right) -- cycle;

    %------------------------------------------------
    % Ligne légèrement au-dessus de la base
    %------------------------------------------------
    \coordinate (basecenter) at ($(left)!0.5!(right)$);
    \coordinate (yline) at ($(basecenter)+(0,0.35)$);

    %------------------------------------------------
    % Mini arbres
    %------------------------------------------------

    % Arbre 1
    \node (t1) at ($(yline)+(-1,0.1)$) {};
    \MiniTree{t1}

    % Arbre 2
    \node (t2) at ($(yline)+(-0.45,0.1)$) {};
    \MiniTree{t2}

    % Arbre 3
    \node (t3) at ($(yline)+(0.85,0.1)$) {};
    \MiniTree{t3}

    % Trois petits points
    \node at ($(yline)+(0.2,-0.12)$) {$\ldots$};

    %------------------------------------------------
    % Node centrale
    %------------------------------------------------
    \node[
        draw,
        very thick,
        circle,
        fill=green,
        inner sep=5pt
    ]
    (midnode)
    at ($(#1)+(-0.05,-1)$) {};

    %------------------------------------------------
    % Connexions
    %------------------------------------------------
    \draw (t1.north) -- (midnode);
    \draw (t2.north) -- (midnode);
    \draw (t3.north) -- (midnode);
}

\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.5,0,0.5}{
        \draw[fill=black] (\i,0) circle (3pt);
        }
    \end{tikzpicture}
}

\node (A) at (0,0) {};
\TopTriangle{A}{3}{3}


\end{tikzpicture}
#
#
#
#
#
#
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "fors-2-a-la-64"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}

%------------------------------------------------
% Mini arbre binaire
% #1 = centre de l'arbre
%------------------------------------------------
\newcommand{\MiniTree}[1]{

    % Racine
    \node[draw,circle,fill=white,inner sep=2pt]
        (root) at (#1) {};

    % Feuilles
    \node[draw,circle,fill=white,inner sep=2pt]
        (leafL) at ($(root)+(-0.12,-0.28)$) {};

    \node[draw,circle,fill=white,inner sep=2pt]
        (leafR) at ($(root)+(0.12,-0.28)$) {};

    % Arêtes
    \draw (root) -- (leafL);
    \draw (root) -- (leafR);
}

%------------------------------------------------
% #1 = node au sommet supérieur
% #2 = largeur du triangle
% #3 = hauteur du triangle
%------------------------------------------------
\newcommand{\TopTriangle}[3]{

    % Sommets du triangle
    \coordinate (left)  at ($(#1)+(-#2/2,-#3)$);
    \coordinate (right) at ($(#1)+(#2/2,-#3)$);

    % Triangle
    \draw[very thick,fill=green!30]
        (#1) -- (left) -- (right) -- cycle;

    %------------------------------------------------
    % Ligne légèrement au-dessus de la base
    %------------------------------------------------
    \coordinate (basecenter) at ($(left)!0.5!(right)$);
    \coordinate (yline) at ($(basecenter)+(0,0.35)$);

    %------------------------------------------------
    % Mini arbres
    %------------------------------------------------

    % Arbre 1
    \node (t1) at ($(yline)+(-1,0.1)$) {};
    \MiniTree{t1}

    % Arbre 2
    \node (t2) at ($(yline)+(-0.45,0.1)$) {};
    \MiniTree{t2}

    % Arbre 3
    \node (t3) at ($(yline)+(0.85,0.1)$) {};
    \MiniTree{t3}

    % Trois petits points
    \node at ($(yline)+(0.2,-0.12)$) {$\ldots$};

    %------------------------------------------------
    % Node centrale
    %------------------------------------------------
    \node[
        draw,
        very thick,
        circle,
        fill=green,
        inner sep=5pt
    ]
    (midnode)
    at ($(#1)+(-0.05,-1)$) {};

    %------------------------------------------------
    % Connexions
    %------------------------------------------------
    \draw (t1.north) -- (midnode);
    \draw (t2.north) -- (midnode);
    \draw (t3.north) -- (midnode);
}

\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.5,0,0.5}{
        \draw[fill=black] (\i,0) circle (3pt);
        }
    \end{tikzpicture}
}

\node (A) at (0,0) {};
\node[right=3cm of A] (B) {};
\node[right=3cm of B] (C) {};
\node[right=3cm of C] (D) {};
\node[below=1.25cm of D] {\etcH};
\node[right=3cm of D] (E) {};
\node[below right=1cm and 2cm of E] {\Huge $2^{64}$};

\TopTriangle{A}{3}{3}
\TopTriangle{B}{3}{3}
\TopTriangle{C}{3}{3}
\TopTriangle{E}{3}{3}


\end{tikzpicture}
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "fors-2-a-la-64-V2"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}

%------------------------------------------------
% Mini arbre binaire
% #1 = centre de l'arbre
%------------------------------------------------
\newcommand{\MiniTree}[1]{

    % Racine
    \node[draw,circle,fill=white,inner sep=2pt]
        (root) at (#1) {};

    % Feuilles
    \node[draw,circle,fill=white,inner sep=2pt]
        (leafL) at ($(root)+(-0.12,-0.28)$) {};

    \node[draw,circle,fill=white,inner sep=2pt]
        (leafR) at ($(root)+(0.12,-0.28)$) {};

    % Arêtes
    \draw (root) -- (leafL);
    \draw (root) -- (leafR);
}

%------------------------------------------------
% #1 = node au sommet supérieur
% #2 = largeur du triangle
% #3 = hauteur du triangle
%------------------------------------------------
\newcommand{\TopTriangle}[3]{

    % Sommets du triangle
    \coordinate (left)  at ($(#1)+(-#2/2,-#3)$);
    \coordinate (right) at ($(#1)+(#2/2,-#3)$);

    % Triangle
    \draw[very thick,fill=green!30]
        (#1) -- (left) -- (right) -- cycle;

    %------------------------------------------------
    % Ligne légèrement au-dessus de la base
    %------------------------------------------------
    \coordinate (basecenter) at ($(left)!0.5!(right)$);
    \coordinate (yline) at ($(basecenter)+(0,0.35)$);

    %------------------------------------------------
    % Mini arbres
    %------------------------------------------------

    % Arbre 1
    \node (t1) at ($(yline)+(-1,0.1)$) {};
    \MiniTree{t1}

    % Arbre 2
    \node (t2) at ($(yline)+(-0.45,0.1)$) {};
    \MiniTree{t2}

    % Arbre 3
    \node (t3) at ($(yline)+(0.85,0.1)$) {};
    \MiniTree{t3}

    % Trois petits points
    \node at ($(yline)+(0.2,-0.12)$) {$\ldots$};

    %------------------------------------------------
    % Node centrale
    %------------------------------------------------
    \node[
        draw,
        very thick,
        circle,
        fill=green,
        inner sep=5pt
    ]
    (midnode)
    at ($(#1)+(-0.05,-1)$) {};

    %------------------------------------------------
    % Connexions
    %------------------------------------------------
    \draw (t1.north) -- (midnode);
    \draw (t2.north) -- (midnode);
    \draw (t3.north) -- (midnode);
}

\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.5,0,0.5}{
        \draw[fill=black] (\i,0) circle (3pt);
        }
    \end{tikzpicture}
}

\node (A) at (0,0) {};
\node[right=3cm of A] (B) {};
\node[right=3cm of B] (C) {};
\node[right=3cm of C] (D) {};
\node[below=1.25cm of D] {\etcH};
\node[right=3cm of D] (E) {};
\node[below right=1cm and 2cm of E] {\Huge $2^{64}$};

\TopTriangle{A}{3}{3}
\TopTriangle{B}{3}{3}
\TopTriangle{C}{3}{3}
\TopTriangle{E}{3}{3}


\end{tikzpicture}
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "fors-16"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
mynode/.style={draw,circle,very thick, align=center, minimum width=0.75cm,fill=blue!50!white},
clesecrete/.style={draw,thick,circle,fill=red!50!white,minimum width=0.1cm},
signature/.style={draw,thick,circle,fill=blue!50!white,minimum width=0.1cm},
clepublique/.style={draw,thick,circle,fill=green!50!white,minimum width=0.1cm}
]

%------------------------------------------------
% Mini arbre binaire
% #1 = centre de l'arbre
%------------------------------------------------
\newcommand{\MiniTree}[1]{
    \node[draw,circle,fill=white,inner sep=2pt]
        (root) at (#1) {};
    \node[draw,circle,fill=white,inner sep=2pt]
        (leafL) at ($(root)+(-0.12,-0.28)$) {};
    \node[draw,circle,fill=white,inner sep=2pt]
        (leafR) at ($(root)+(0.12,-0.28)$) {};
    \draw (root) -- (leafL);
    \draw (root) -- (leafR);
}

%------------------------------------------------
% #1 = node au sommet supérieur
% #2 = largeur du triangle
% #3 = hauteur du triangle
%------------------------------------------------
\newcommand{\TopTriangle}[3]{
    \coordinate (left)  at ($(#1)+(-#2/2,-#3)$);
    \coordinate (right) at ($(#1)+(#2/2,-#3)$);
    \draw[very thick,fill=green!50]
        (#1) -- (left) -- (right) -- cycle;
    \coordinate (basecenter) at ($(left)!0.5!(right)$);
    \coordinate (yline) at ($(basecenter)+(0,0.35)$);
    \node (t1) at ($(yline)+(-1,0.1)$) {};
    \MiniTree{t1}
    \node (t2) at ($(yline)+(-0.45,0.1)$) {};
    \MiniTree{t2}
    \node (t3) at ($(yline)+(0.85,0.1)$) {};
    \MiniTree{t3}
    \node at ($(yline)+(0.2,-0.12)$) {$\ldots$};
    \node[
        draw,
        very thick,
        circle,
        fill=green,
        inner sep=5pt
    ]
    (midnode)
    at ($(#1)+(-0.05,-1)$) {};
    \draw (t1.north) -- (midnode);
    \draw (t2.north) -- (midnode);
    \draw (t3.north) -- (midnode);
}

\node[inner sep=0pt] (f-0) at (0,0) {};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2,...,15}{
    \node[inner sep=0pt] (f-\i) [right=1.25cm of f-\j] {};
}
\foreach \i in {0,1,...,15}{
    \TopTriangle{f-\i}{3}{3}
}

\foreach \i  in {0,1,...,7}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \node[mynode] (h-1-\i) at ($(f-\Left)!0.5!(f-\Right)+(0,1)$) {};
}
\foreach \i in {0,1,...,7}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \draw[very thick,->] (f-\Left.north)--(h-1-\i);
    \draw[very thick,->] (f-\Right.north)--(h-1-\i);
}
\foreach \i  in {0,1,...,3}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \node[mynode] (h-2-\i) at ($(h-1-\Left)!0.5!(h-1-\Right)+(0,1.5)$) {};
}
\foreach \i in {0,1,...,3}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \draw[very thick,->] (h-1-\Left.north)--(h-2-\i);
    \draw[very thick,->] (h-1-\Right.north)--(h-2-\i);
}

\node[mynode] (h-3-0) at ($(h-2-0)!0.5!(h-2-1)+(0,1.5)$) {};
\node[mynode] (h-3-1) at ($(h-2-2)!0.5!(h-2-3)+(0,1.5)$) {};
\foreach \i in {0,1}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \draw[very thick,->] (h-2-\Left.north)--(h-3-\i);
    \draw[very thick,->] (h-2-\Right.north)--(h-3-\i);
}

\node[mynode,fill=green] (h-4-0) at ($(h-3-0)!0.5!(h-3-1)+(0,1.5)$) {};

\draw[very thick,->] (h-3-0.north)--(h-4-0);
\draw[very thick,->] (h-3-1.north)--(h-4-0);

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "fors-16-top-tree"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
mynode/.style={draw,circle,very thick, align=center, minimum width=0.75cm,fill=blue!50!white},
clesecrete/.style={draw,thick,circle,fill=red!50!white,minimum width=0.1cm},
signature/.style={draw,thick,circle,fill=blue!50!white,minimum width=0.1cm},
clepublique/.style={draw,thick,circle,fill=green!50!white,minimum width=0.1cm}
]

%------------------------------------------------
% Mini arbre binaire
% #1 = centre de l'arbre
%------------------------------------------------
\newcommand{\MiniTree}[1]{
    \node[draw,circle,fill=white,inner sep=2pt]
        (root) at (#1) {};
    \node[draw,circle,fill=white,inner sep=2pt]
        (leafL) at ($(root)+(-0.12,-0.28)$) {};
    \node[draw,circle,fill=white,inner sep=2pt]
        (leafR) at ($(root)+(0.12,-0.28)$) {};
    \draw (root) -- (leafL);
    \draw (root) -- (leafR);
}

%------------------------------------------------
% #1 = node au sommet supérieur
% #2 = largeur du triangle
% #3 = hauteur du triangle
%------------------------------------------------
\newcommand{\TopTriangle}[3]{
    \coordinate (left)  at ($(#1)+(-#2/2,-#3)$);
    \coordinate (right) at ($(#1)+(#2/2,-#3)$);
    \draw[very thick,fill=green!50]
        (#1) -- (left) -- (right) -- cycle;
    \coordinate (basecenter) at ($(left)!0.5!(right)$);
    \coordinate (yline) at ($(basecenter)+(0,0.35)$);
    \node (t1) at ($(yline)+(-1,0.1)$) {};
    \MiniTree{t1}
    \node (t2) at ($(yline)+(-0.45,0.1)$) {};
    \MiniTree{t2}
    \node (t3) at ($(yline)+(0.85,0.1)$) {};
    \MiniTree{t3}
    \node at ($(yline)+(0.2,-0.12)$) {$\ldots$};
    \node[
        draw,
        very thick,
        circle,
        fill=green,
        inner sep=5pt
    ]
    (midnode)
    at ($(#1)+(-0.05,-1)$) {};
    \draw (t1.north) -- (midnode);
    \draw (t2.north) -- (midnode);
    \draw (t3.north) -- (midnode);
}

\node[inner sep=0pt] (f-0) at (0,0) {};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2,...,15}{
    \node[inner sep=0pt] (f-\i) [right=1.25cm of f-\j] {};
}
\foreach \i in {0,1,...,15}{
    \TopTriangle{f-\i}{3}{3}
}

\foreach \i  in {0,1,...,7}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \node[mynode] (h-1-\i) at ($(f-\Left)!0.5!(f-\Right)+(0,1)$) {};
}
\foreach \i in {0,1,...,7}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \draw[very thick,->] (f-\Left.north)--(h-1-\i);
    \draw[very thick,->] (f-\Right.north)--(h-1-\i);
}
\foreach \i  in {0,1,...,3}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \node[mynode] (h-2-\i) at ($(h-1-\Left)!0.5!(h-1-\Right)+(0,1.5)$) {};
}
\node[mynode] (h-3-0) at ($(h-2-0)!0.5!(h-2-1)+(0,1.5)$) {};
\node[mynode] (h-3-1) at ($(h-2-2)!0.5!(h-2-3)+(0,1.5)$) {};
\foreach \i in {0,1}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \draw[very thick,->] (h-2-\Left.north)--(h-3-\i);
    \draw[very thick,->] (h-2-\Right.north)--(h-3-\i);
}

\node[mynode,fill=green] (h-4-0) at ($(h-3-0)!0.5!(h-3-1)+(0,1.5)$) {};

\draw[very thick,->] (h-3-0.north)--(h-4-0);
\draw[very thick,->] (h-3-1.north)--(h-4-0);

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "fors-16-top-tree-sub-trees"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
mynode/.style={draw,circle,very thick, align=center, minimum width=0.75cm,fill=blue!50!white},
clesecrete/.style={draw,thick,circle,fill=red!50!white,minimum width=0.1cm},
signature/.style={draw,thick,circle,fill=blue!50!white,minimum width=0.1cm},
clepublique/.style={draw,thick,circle,fill=green!50!white,minimum width=0.1cm}
]

%------------------------------------------------
% Mini arbre binaire
% #1 = centre de l'arbre
%------------------------------------------------
\newcommand{\MiniTree}[1]{
    \node[draw,circle,fill=white,inner sep=2pt]
        (root) at (#1) {};
    \node[draw,circle,fill=white,inner sep=2pt]
        (leafL) at ($(root)+(-0.12,-0.28)$) {};
    \node[draw,circle,fill=white,inner sep=2pt]
        (leafR) at ($(root)+(0.12,-0.28)$) {};
    \draw (root) -- (leafL);
    \draw (root) -- (leafR);
}

%------------------------------------------------
% #1 = node au sommet supérieur
% #2 = largeur du triangle
% #3 = hauteur du triangle
%------------------------------------------------
\newcommand{\TopTriangle}[3]{
    \coordinate (left)  at ($(#1)+(-#2/2,-#3)$);
    \coordinate (right) at ($(#1)+(#2/2,-#3)$);
    \draw[very thick,fill=green!50]
        (#1) -- (left) -- (right) -- cycle;
    \coordinate (basecenter) at ($(left)!0.5!(right)$);
    \coordinate (yline) at ($(basecenter)+(0,0.35)$);
    \node (t1) at ($(yline)+(-1,0.1)$) {};
    \MiniTree{t1}
    \node (t2) at ($(yline)+(-0.45,0.1)$) {};
    \MiniTree{t2}
    \node (t3) at ($(yline)+(0.85,0.1)$) {};
    \MiniTree{t3}
    \node at ($(yline)+(0.2,-0.12)$) {$\ldots$};
    \node[
        draw,
        very thick,
        circle,
        fill=green,
        inner sep=5pt
    ]
    (midnode)
    at ($(#1)+(-0.05,-1)$) {};
    \draw (t1.north) -- (midnode);
    \draw (t2.north) -- (midnode);
    \draw (t3.north) -- (midnode);
}

\node[inner sep=0pt] (f-0) at (0,0) {};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2,...,15}{
    \node[inner sep=0pt] (f-\i) [right=1.25cm of f-\j] {};
}
\foreach \i in {0,1,...,15}{
    \TopTriangle{f-\i}{3}{3}
}

\foreach \i  in {0,1,...,7}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \node[mynode] (h-1-\i) at ($(f-\Left)!0.5!(f-\Right)+(0,1)$) {};
}
\foreach \i in {0,1,...,7}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \draw[very thick,->] (f-\Left.north)--(h-1-\i);
    \draw[very thick,->] (f-\Right.north)--(h-1-\i);
}
\foreach \i  in {0,1,...,3}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \node[mynode] (h-2-\i) at ($(h-1-\Left)!0.5!(h-1-\Right)+(0,1.5)$) {};
}

\node[mynode] (h-3-0) at ($(h-2-0)!0.5!(h-2-1)+(0,1.5)$) {};
\node[mynode] (h-3-1) at ($(h-2-2)!0.5!(h-2-3)+(0,1.5)$) {};
\foreach \i in {0,1}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \draw[very thick,->] (h-2-\Left.north)--(h-3-\i);
    \draw[very thick,->] (h-2-\Right.north)--(h-3-\i);
}

\node[mynode,fill=green] (h-4-0) at ($(h-3-0)!0.5!(h-3-1)+(0,1.5)$) {};

\draw[very thick,->] (h-3-0.north)--(h-4-0);
\draw[very thick,->] (h-3-1.north)--(h-4-0);

\foreach \i/\j in {1/2,3/4,5/6}{
    \draw[line width=2pt,red,dashed] ($(h-1-\i)!0.5!(h-1-\j)$)--++(0,-4);
}

% \node[below=0.1cm of h-2-0] {\wots[1]{1,0.8,0.9}{1.5}};
% \node[below=0.1cm of h-2-1] {\wots{0.5,1.2,0.7}{1.25}};

% \node at (1.85,4.8) {\wots[1]{1,0.8,0.9}{1.5}};
% \node at (7.05,4.8) {\wots{0.5,1.2,0.7}{1.25}};

% \begin{scope}[rotate=180,scale=0.5,xshift=-5.5cm,yshift=-4cm]
% \wots{1,3,2}{2.75}
% \end{scope}

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "fors-16-top-tree-sub-trees-virtual"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
mynode/.style={draw,circle,very thick, align=center, minimum width=0.75cm,fill=blue!50!white}
]

%------------------------------------------------
% Mini arbre binaire
% #1 = centre de l'arbre
%------------------------------------------------
\newcommand{\MiniTree}[1]{

    % Racine
    \node[draw,circle,fill=white,inner sep=2pt]
        (root) at (#1) {};

    % Feuilles
    \node[draw,circle,fill=white,inner sep=2pt]
        (leafL) at ($(root)+(-0.12,-0.28)$) {};

    \node[draw,circle,fill=white,inner sep=2pt]
        (leafR) at ($(root)+(0.12,-0.28)$) {};

    % Arêtes
    \draw (root) -- (leafL);
    \draw (root) -- (leafR);
}

%------------------------------------------------
% #1 = node au sommet supérieur
% #2 = largeur du triangle
% #3 = hauteur du triangle
%------------------------------------------------
\newcommand{\TopTriangle}[3]{

    % Sommets du triangle
    \coordinate (left)  at ($(#1)+(-#2/2,-#3)$);
    \coordinate (right) at ($(#1)+(#2/2,-#3)$);

    % Triangle
    \draw[very thick,fill=green!15]
        (#1) -- (left) -- (right) -- cycle;

    %------------------------------------------------
    % Ligne légèrement au-dessus de la base
    %------------------------------------------------
    \coordinate (basecenter) at ($(left)!0.5!(right)$);
    \coordinate (yline) at ($(basecenter)+(0,0.35)$);

    %------------------------------------------------
    % Mini arbres
    %------------------------------------------------

    % Arbre 1
    \node (t1) at ($(yline)+(-1,0.1)$) {};
    \MiniTree{t1}

    % Arbre 2
    \node (t2) at ($(yline)+(-0.45,0.1)$) {};
    \MiniTree{t2}

    % Arbre 3
    \node (t3) at ($(yline)+(0.85,0.1)$) {};
    \MiniTree{t3}

    % Trois petits points
    \node at ($(yline)+(0.2,-0.12)$) {$\ldots$};

    %------------------------------------------------
    % Node centrale
    %------------------------------------------------
    \node[
        draw,
        very thick,
        circle,
        fill=green!25,
        inner sep=5pt
    ]
    (midnode)
    at ($(#1)+(-0.05,-1)$) {};

    %------------------------------------------------
    % Connexions
    %------------------------------------------------
    \draw (t1.north) -- (midnode);
    \draw (t2.north) -- (midnode);
    \draw (t3.north) -- (midnode);
}

\newcommand{\TopTriangleT}[3]{

    % Sommets du triangle
    \coordinate (left)  at ($(#1)+(-#2/2,-#3)$);
    \coordinate (right) at ($(#1)+(#2/2,-#3)$);

    % Triangle
    \draw[very thick,fill=green!50]
        (#1) -- (left) -- (right) -- cycle;

    %------------------------------------------------
    % Ligne légèrement au-dessus de la base
    %------------------------------------------------
    \coordinate (basecenter) at ($(left)!0.5!(right)$);
    \coordinate (yline) at ($(basecenter)+(0,0.35)$);

    %------------------------------------------------
    % Mini arbres
    %------------------------------------------------

    % Arbre 1
    \node (t1) at ($(yline)+(-1,0.1)$) {};
    \MiniTree{t1}

    % Arbre 2
    \node (t2) at ($(yline)+(-0.45,0.1)$) {};
    \MiniTree{t2}

    % Arbre 3
    \node (t3) at ($(yline)+(0.85,0.1)$) {};
    \MiniTree{t3}

    % Trois petits points
    \node at ($(yline)+(0.2,-0.12)$) {$\ldots$};

    %------------------------------------------------
    % Node centrale
    %------------------------------------------------
    \node[
        draw,
        very thick,
        circle,
        fill=green,
        inner sep=5pt
    ]
    (midnode)
    at ($(#1)+(-0.05,-1)$) {};

    %------------------------------------------------
    % Connexions
    %------------------------------------------------
    \draw (t1.north) -- (midnode);
    \draw (t2.north) -- (midnode);
    \draw (t3.north) -- (midnode);
}

\newcommand{\etcH}{
    \begin{tikzpicture}
        \foreach \i in {-0.5,0,0.5}{
        \draw[fill=black] (\i,0) circle (3pt);
        }
    \end{tikzpicture}
}

\node[inner sep=0pt] (f-0) at (0,0) {};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2,...,15}{
    \node[inner sep=0pt] (f-\i) [right=1.25cm of f-\j] {};
}
\foreach \i in {0,1,...,15}{
    \TopTriangle{f-\i}{3}{3}
}
\foreach \i in {4,5,6,7}{
    \TopTriangleT{f-\i}{3}{3}
}

\node[mynode,fill=blue!20] (h-1-0) at ($(f-0)!0.5!(f-1)+(0,1)$) {};
\node[mynode,fill=blue!20] (h-1-1) at ($(f-2)!0.5!(f-3)+(0,1)$) {};
\node[mynode] (h-1-2) at ($(f-4)!0.5!(f-5)+(0,1)$) {};
\node[mynode] (h-1-3) at ($(f-6)!0.5!(f-7)+(0,1)$) {};
\node[mynode,fill=blue!20] (h-1-4) at ($(f-8)!0.5!(f-9)+(0,1)$) {};
\node[mynode,fill=blue!20] (h-1-5) at ($(f-10)!0.5!(f-11)+(0,1)$) {};
\node[mynode,fill=blue!20] (h-1-6) at ($(f-12)!0.5!(f-13)+(0,1)$) {};
\node[mynode,fill=blue!20] (h-1-7) at ($(f-14)!0.5!(f-15)+(0,1)$) {};

\draw[very thick,->] (f-0.north)--(h-1-0);
\draw[very thick,->] (f-1.north)--(h-1-0);
\draw[very thick,->] (f-2.north)--(h-1-1);
\draw[very thick,->] (f-3.north)--(h-1-1);
\draw[very thick,->] (f-4.north)--(h-1-2);
\draw[very thick,->] (f-5.north)--(h-1-2);
\draw[very thick,->] (f-6.north)--(h-1-3);
\draw[very thick,->] (f-7.north)--(h-1-3);
\draw[very thick,->] (f-8.north)--(h-1-4);
\draw[very thick,->] (f-9.north)--(h-1-4);
\draw[very thick,->] (f-10.north)--(h-1-5);
\draw[very thick,->] (f-11.north)--(h-1-5);
\draw[very thick,->] (f-12.north)--(h-1-6);
\draw[very thick,->] (f-13.north)--(h-1-6);
\draw[very thick,->] (f-14.north)--(h-1-7);
\draw[very thick,->] (f-15.north)--(h-1-7);

\node[mynode] (h-2-0) at ($(h-1-0)!0.5!(h-1-1)+(0,1.5)$) {};
\node[mynode] (h-2-1) at ($(h-1-2)!0.5!(h-1-3)+(0,1.5)$) {};
\node[mynode] (h-2-2) at ($(h-1-4)!0.5!(h-1-5)+(0,1.5)$) {};
\node[mynode] (h-2-3) at ($(h-1-6)!0.5!(h-1-7)+(0,1.5)$) {};

% \draw[very thick,->] (h-1-0.north)--(h-2-0);
% \draw[very thick,->] (h-1-1.north)--(h-2-0);
% \draw[very thick,->] (h-1-2.north)--(h-2-1);
% \draw[very thick,->] (h-1-3.north)--(h-2-1);
% \draw[very thick,->] (h-1-4.north)--(h-2-2);
% \draw[very thick,->] (h-1-5.north)--(h-2-2);
% \draw[very thick,->] (h-1-6.north)--(h-2-3);
% \draw[very thick,->] (h-1-7.north)--(h-2-3);

\node[mynode] (h-3-0) at ($(h-2-0)!0.5!(h-2-1)+(0,1.5)$) {};
\node[mynode] (h-3-1) at ($(h-2-2)!0.5!(h-2-3)+(0,1.5)$) {};

\draw[very thick,->] (h-2-0.north)--(h-3-0);
\draw[very thick,->] (h-2-1.north)--(h-3-0);
\draw[very thick,->] (h-2-2.north)--(h-3-1);
\draw[very thick,->] (h-2-3.north)--(h-3-1);

\node[mynode,fill=green] (h-4-0) at ($(h-3-0)!0.5!(h-3-1)+(0,1.5)$) {};

\draw[very thick,->] (h-3-0.north)--(h-4-0);
\draw[very thick,->] (h-3-1.north)--(h-4-0);

\draw[line width=2pt,red,dashed] ($(h-1-1)!0.5!(h-1-2)$)--++(0,-4);
\draw[line width=2pt,red,dashed] ($(h-1-3)!0.5!(h-1-4)$)--++(0,-4);
\draw[line width=2pt,red,dashed] ($(h-1-5)!0.5!(h-1-6)$)--++(0,-4);

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "fors-16-before-wots"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
mynode/.style={draw,circle,very thick, align=center, minimum width=0.75cm,fill=blue!50!white},
]

%------------------------------------------------
% Mini arbre binaire
% #1 = centre de l'arbre
%------------------------------------------------
\newcommand{\MiniTree}[1]{
    \node[draw,circle,fill=white,inner sep=2pt]
        (root) at (#1) {};
    \node[draw,circle,fill=white,inner sep=2pt]
        (leafL) at ($(root)+(-0.12,-0.28)$) {};
    \node[draw,circle,fill=white,inner sep=2pt]
        (leafR) at ($(root)+(0.12,-0.28)$) {};
    \draw (root) -- (leafL);
    \draw (root) -- (leafR);
}

%------------------------------------------------
% #1 = node au sommet supérieur
% #2 = largeur du triangle
% #3 = hauteur du triangle
%------------------------------------------------
\newcommand{\TopTriangle}[3]{
    \coordinate (left)  at ($(#1)+(-#2/2,-#3)$);
    \coordinate (right) at ($(#1)+(#2/2,-#3)$);
    \draw[very thick,fill=green!50]
        (#1) -- (left) -- (right) -- cycle;
    \coordinate (basecenter) at ($(left)!0.5!(right)$);
    \coordinate (yline) at ($(basecenter)+(0,0.35)$);
    \node (t1) at ($(yline)+(-1,0.1)$) {};
    \MiniTree{t1}
    \node (t2) at ($(yline)+(-0.45,0.1)$) {};
    \MiniTree{t2}
    \node (t3) at ($(yline)+(0.85,0.1)$) {};
    \MiniTree{t3}
    \node at ($(yline)+(0.2,-0.12)$) {$\ldots$};
    \node[
        draw,
        very thick,
        circle,
        fill=green,
        inner sep=5pt
    ]
    (midnode)
    at ($(#1)+(-0.05,-1)$) {};
    \draw (t1.north) -- (midnode);
    \draw (t2.north) -- (midnode);
    \draw (t3.north) -- (midnode);
}

\newcommand{\wots}[1]{
\tikzset{
clesecrete/.style={draw,thick,circle,fill=red!50!white,inner sep=3pt},
signature/.style={draw,thick,circle,fill=blue!50!white,inner sep=3pt},
clepublique/.style={draw,thick,circle,fill=green!50!white,inner sep=3pt}
}

\node[clepublique,minimum width=0.75cm] (cp) at #1 {};
\pgfmathsetmacro{\h}{2}
\pgfmathsetmacro{\mydx}{0.5}
\pgfmathsetmacro{\mydy}{0.75}

\foreach \i/\idx in {-2/0,-1/1,0/2,2/3}{
    \draw[green!50!white,fill=green!50!white] ($(cp)+(\i*\mydx-0.25*\mydx,-\mydy)$) rectangle++(0.5*\mydx,-\h);
    \node[clepublique] (cp-\idx) at ($(cp)+(\i*\mydx,-\mydy)$) {};
    \draw[thick] (cp-\idx)--(cp);
}
\foreach \i/\pos in {0/1.3,1/0.8,2/0.4,3/1.2}{
    \draw[red!50!white,fill=red!50!white] ($(cp-\i)+(-0.25*\mydx,-\pos)$) rectangle++(0.5*\mydx,-\h+\pos);
    \draw[dotted] (cp-\i.south)--($(cp-\i)-(0,\h)$);
    \node[signature] (s-\i) at ($(cp-\i)+(0,-\pos)$) {};
    \node[clesecrete] (cs-\i) at ($(cp-\i)+(0,-\h)$) {};
}

\shade[
        bottom color=red!50!white,
        top color=green!50!white
    ]
    ($(cp)+(\mydx-0.25*\mydx,-\mydy)$) rectangle++ (0.5*\mydx,-\h);
\draw[dotted] (cp)--($(cp)+(\mydx,-\mydy)$)--++(0,-\h);
}

\node[inner sep=0pt] (f-0) at (0,0) {};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2,...,15}{
    \node[inner sep=0pt] (f-\i) [right=1.25cm of f-\j] {};
}
\foreach \i in {0,1,...,15}{
    \TopTriangle{f-\i}{3}{3}
}

\foreach \i  in {0,1,...,7}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \node[mynode] (h-1-\i) at ($(f-\Left)!0.5!(f-\Right)+(0,1)$) {};
}
\foreach \i in {0,1,...,7}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \draw[very thick,->] (f-\Left.north)--(h-1-\i);
    \draw[very thick,->] (f-\Right.north)--(h-1-\i);
}
\foreach \i  in {0,1,...,3}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \node[mynode] (h-2-\i) at ($(h-1-\Left)!0.5!(h-1-\Right)+(0,5)$) {};
}
% \foreach \i in {0,1,...,3}{
%     \pgfmathtruncatemacro{\Left}{2*\i}
%     \pgfmathtruncatemacro{\Right}{2*\i+1}
%     \draw[very thick,->] (h-1-\Left.north)--(h-2-\i);
%     \draw[very thick,->] (h-1-\Right.north)--(h-2-\i);
% }

\node[mynode] (h-3-0) at ($(h-2-0)!0.5!(h-2-1)+(0,1.5)$) {};
\node[mynode] (h-3-1) at ($(h-2-2)!0.5!(h-2-3)+(0,1.5)$) {};
\foreach \i in {0,1}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \draw[very thick,->] (h-2-\Left.north)--(h-3-\i);
    \draw[very thick,->] (h-2-\Right.north)--(h-3-\i);
}

\node[mynode,fill=green] (h-4-0) at ($(h-3-0)!0.5!(h-3-1)+(0,1.5)$) {};

\draw[very thick,->] (h-3-0.north)--(h-4-0);
\draw[very thick,->] (h-3-1.north)--(h-4-0);

\foreach \i/\j in {1/2,3/4,5/6}{
    \draw[line width=2pt,red,dashed] ($(h-1-\i)!0.5!(h-1-\j)$)--++(0,-4);
}
\foreach \i in {0,1,2,3}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    % \node[mynode] (w-\i) at ($(h-1-\Left)!0.5!(h-1-\Right)+(0,1.25)$) {};
    % \draw[very thick,->] (h-1-\Left)--(w-\i);
    % \draw[very thick,->] (h-1-\Right)--(w-\i);
    % \wots{(h-2-\i)}
    % \foreach \j in {0,1,2,3}{
    %     \draw[thick] (w-\i)--(cs-\j);
    % }
}

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "fors-16-after-wots"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
mynode/.style={draw,circle,very thick, align=center, minimum width=0.75cm,fill=blue!50!white},
]

%------------------------------------------------
% Mini arbre binaire
% #1 = centre de l'arbre
%------------------------------------------------
\newcommand{\MiniTree}[1]{
    \node[draw,circle,fill=white,inner sep=2pt]
        (root) at (#1) {};
    \node[draw,circle,fill=white,inner sep=2pt]
        (leafL) at ($(root)+(-0.12,-0.28)$) {};
    \node[draw,circle,fill=white,inner sep=2pt]
        (leafR) at ($(root)+(0.12,-0.28)$) {};
    \draw (root) -- (leafL);
    \draw (root) -- (leafR);
}

%------------------------------------------------
% #1 = node au sommet supérieur
% #2 = largeur du triangle
% #3 = hauteur du triangle
%------------------------------------------------
\newcommand{\TopTriangle}[3]{
    \coordinate (left)  at ($(#1)+(-#2/2,-#3)$);
    \coordinate (right) at ($(#1)+(#2/2,-#3)$);
    \draw[very thick,fill=green!50]
        (#1) -- (left) -- (right) -- cycle;
    \coordinate (basecenter) at ($(left)!0.5!(right)$);
    \coordinate (yline) at ($(basecenter)+(0,0.35)$);
    \node (t1) at ($(yline)+(-1,0.1)$) {};
    \MiniTree{t1}
    \node (t2) at ($(yline)+(-0.45,0.1)$) {};
    \MiniTree{t2}
    \node (t3) at ($(yline)+(0.85,0.1)$) {};
    \MiniTree{t3}
    \node at ($(yline)+(0.2,-0.12)$) {$\ldots$};
    \node[
        draw,
        very thick,
        circle,
        fill=green,
        inner sep=5pt
    ]
    (midnode)
    at ($(#1)+(-0.05,-1)$) {};
    \draw (t1.north) -- (midnode);
    \draw (t2.north) -- (midnode);
    \draw (t3.north) -- (midnode);
}

\newcommand{\wots}[1]{
\tikzset{
clesecrete/.style={draw,thick,circle,fill=red!50!white,inner sep=3pt},
signature/.style={draw,thick,circle,fill=blue!50!white,inner sep=3pt},
clepublique/.style={draw,thick,circle,fill=green!50!white,inner sep=3pt}
}

\node[clepublique,minimum width=0.75cm] (cp) at #1 {};
\pgfmathsetmacro{\h}{2}
\pgfmathsetmacro{\mydx}{0.5}
\pgfmathsetmacro{\mydy}{0.75}

\foreach \i/\idx in {-2/0,-1/1,0/2,2/3}{
    \draw[green!50!white,fill=green!50!white] ($(cp)+(\i*\mydx-0.25*\mydx,-\mydy)$) rectangle++(0.5*\mydx,-\h);
    \node[clepublique] (cp-\idx) at ($(cp)+(\i*\mydx,-\mydy)$) {};
    \draw[thick] (cp-\idx)--(cp);
}
\foreach \i/\pos in {0/1.3,1/0.8,2/0.4,3/1.2}{
    \pgfmathsetmacro{\pos}{rnd*1.6+0.2}
    \draw[red!50!white,fill=red!50!white] ($(cp-\i)+(-0.25*\mydx,-\pos)$) rectangle++(0.5*\mydx,-\h+\pos);
    \draw[dotted] (cp-\i.south)--($(cp-\i)-(0,\h)$);
    \node[signature] (s-\i) at ($(cp-\i)+(0,-\pos)$) {};
    \node[clesecrete] (cs-\i) at ($(cp-\i)+(0,-\h)$) {};
}

\shade[
        bottom color=red!50!white,
        top color=green!50!white
    ]
    ($(cp)+(\mydx-0.25*\mydx,-\mydy)$) rectangle++ (0.5*\mydx,-\h);
\draw[dotted] (cp)--($(cp)+(\mydx,-\mydy)$)--++(0,-\h);
}

\node[inner sep=0pt] (f-0) at (0,0) {};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2,...,15}{
    \node[inner sep=0pt] (f-\i) [right=1.25cm of f-\j] {};
}
\foreach \i in {0,1,...,15}{
    \TopTriangle{f-\i}{3}{3}
}

\foreach \i  in {0,1,...,7}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \node[mynode] (h-1-\i) at ($(f-\Left)!0.5!(f-\Right)+(0,1)$) {};
}
\foreach \i in {0,1,...,7}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \draw[very thick,->] (f-\Left.north)--(h-1-\i);
    \draw[very thick,->] (f-\Right.north)--(h-1-\i);
}
\foreach \i  in {0,1,...,3}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \node[mynode] (h-2-\i) at ($(h-1-\Left)!0.5!(h-1-\Right)+(0,5)$) {};
}
% \foreach \i in {0,1,...,3}{
%     \pgfmathtruncatemacro{\Left}{2*\i}
%     \pgfmathtruncatemacro{\Right}{2*\i+1}
%     \draw[very thick,->] (h-1-\Left.north)--(h-2-\i);
%     \draw[very thick,->] (h-1-\Right.north)--(h-2-\i);
% }

\node[mynode] (h-3-0) at ($(h-2-0)!0.5!(h-2-1)+(0,1.5)$) {};
\node[mynode] (h-3-1) at ($(h-2-2)!0.5!(h-2-3)+(0,1.5)$) {};
\foreach \i in {0,1}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \draw[very thick,->] (h-2-\Left.north)--(h-3-\i);
    \draw[very thick,->] (h-2-\Right.north)--(h-3-\i);
}

\node[mynode,fill=green] (h-4-0) at ($(h-3-0)!0.5!(h-3-1)+(0,1.5)$) {};

\draw[very thick,->] (h-3-0.north)--(h-4-0);
\draw[very thick,->] (h-3-1.north)--(h-4-0);

\foreach \i/\j in {1/2,3/4,5/6}{
    \draw[line width=2pt,red,dashed] ($(h-1-\i)!0.5!(h-1-\j)$)--++(0,-4);
}
\foreach \i in {0,1,2,3}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    % \node[mynode] (w-\i) at ($(h-1-\Left)!0.5!(h-1-\Right)+(0,1.25)$) {};
    % \draw[very thick,->] (h-1-\Left)--(w-\i);
    % \draw[very thick,->] (h-1-\Right)--(w-\i);
    \wots{(h-2-\i)}
    % \foreach \j in {0,1,2,3}{
    %     \draw[thick] (w-\i)--(cs-\j);
    % }
}

\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "fors-16-after-wots-with-hash"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
mynode/.style={draw,circle,very thick, align=center, minimum width=0.75cm,fill=blue!50!white},
]

%------------------------------------------------
% Mini arbre binaire
% #1 = centre de l'arbre
%------------------------------------------------
\newcommand{\MiniTree}[1]{
    \node[draw,circle,fill=white,inner sep=2pt]
        (root) at (#1) {};
    \node[draw,circle,fill=white,inner sep=2pt]
        (leafL) at ($(root)+(-0.12,-0.28)$) {};
    \node[draw,circle,fill=white,inner sep=2pt]
        (leafR) at ($(root)+(0.12,-0.28)$) {};
    \draw (root) -- (leafL);
    \draw (root) -- (leafR);
}

%------------------------------------------------
% #1 = node au sommet supérieur
% #2 = largeur du triangle
% #3 = hauteur du triangle
%------------------------------------------------
\newcommand{\TopTriangle}[3]{
    \coordinate (left)  at ($(#1)+(-#2/2,-#3)$);
    \coordinate (right) at ($(#1)+(#2/2,-#3)$);
    \draw[very thick,fill=green!50]
        (#1) -- (left) -- (right) -- cycle;
    \coordinate (basecenter) at ($(left)!0.5!(right)$);
    \coordinate (yline) at ($(basecenter)+(0,0.35)$);
    \node (t1) at ($(yline)+(-1,0.1)$) {};
    \MiniTree{t1}
    \node (t2) at ($(yline)+(-0.45,0.1)$) {};
    \MiniTree{t2}
    \node (t3) at ($(yline)+(0.85,0.1)$) {};
    \MiniTree{t3}
    \node at ($(yline)+(0.2,-0.12)$) {$\ldots$};
    \node[
        draw,
        very thick,
        circle,
        fill=green,
        inner sep=5pt
    ]
    (midnode)
    at ($(#1)+(-0.05,-1)$) {};
    \draw (t1.north) -- (midnode);
    \draw (t2.north) -- (midnode);
    \draw (t3.north) -- (midnode);
}

\newcommand{\wots}[1]{
\tikzset{
clesecrete/.style={draw,thick,circle,fill=red!50!white,inner sep=3pt},
signature/.style={draw,thick,circle,fill=blue!50!white,inner sep=3pt},
clepublique/.style={draw,thick,circle,fill=green!50!white,inner sep=3pt}
}

\node[clepublique,minimum width=0.75cm] (cp) at #1 {};
\pgfmathsetmacro{\h}{2}
\pgfmathsetmacro{\mydx}{0.5}
\pgfmathsetmacro{\mydy}{0.75}

\foreach \i/\idx in {-2/0,-1/1,0/2,2/3}{
    \draw[green!50!white,fill=green!50!white] ($(cp)+(\i*\mydx-0.25*\mydx,-\mydy)$) rectangle++(0.5*\mydx,-\h);
    \node[clepublique] (cp-\idx) at ($(cp)+(\i*\mydx,-\mydy)$) {};
    \draw[thick] (cp-\idx)--(cp);
}
\foreach \i/\pos in {0/1.3,1/0.8,2/0.4,3/1.2}{
    \pgfmathsetmacro{\pos}{rnd*1.6+0.2}
    \draw[red!50!white,fill=red!50!white] ($(cp-\i)+(-0.25*\mydx,-\pos)$) rectangle++(0.5*\mydx,-\h+\pos);
    \draw[dotted] (cp-\i.south)--($(cp-\i)-(0,\h)$);
    \node[signature] (s-\i) at ($(cp-\i)+(0,-\pos)$) {};
    \node[clesecrete] (cs-\i) at ($(cp-\i)+(0,-\h)$) {};
}

\shade[
        bottom color=red!50!white,
        top color=green!50!white
    ]
    ($(cp)+(\mydx-0.25*\mydx,-\mydy)$) rectangle++ (0.5*\mydx,-\h);
\draw[dotted] (cp)--($(cp)+(\mydx,-\mydy)$)--++(0,-\h);
}

\node[inner sep=0pt] (f-0) at (0,0) {};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2,...,15}{
    \node[inner sep=0pt] (f-\i) [right=1.25cm of f-\j] {};
}
\foreach \i in {0,1,...,15}{
    \TopTriangle{f-\i}{3}{3}
}

\foreach \i  in {0,1,...,7}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \node[mynode] (h-1-\i) at ($(f-\Left)!0.5!(f-\Right)+(0,1)$) {};
}
\foreach \i in {0,1,...,7}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \draw[very thick,->] (f-\Left.north)--(h-1-\i);
    \draw[very thick,->] (f-\Right.north)--(h-1-\i);
}
\foreach \i  in {0,1,...,3}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \node[mynode] (h-2-\i) at ($(h-1-\Left)!0.5!(h-1-\Right)+(0,5)$) {};
}
% \foreach \i in {0,1,...,3}{
%     \pgfmathtruncatemacro{\Left}{2*\i}
%     \pgfmathtruncatemacro{\Right}{2*\i+1}
%     \draw[very thick,->] (h-1-\Left.north)--(h-2-\i);
%     \draw[very thick,->] (h-1-\Right.north)--(h-2-\i);
% }

\node[mynode] (h-3-0) at ($(h-2-0)!0.5!(h-2-1)+(0,1.5)$) {};
\node[mynode] (h-3-1) at ($(h-2-2)!0.5!(h-2-3)+(0,1.5)$) {};
\foreach \i in {0,1}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \draw[very thick,->] (h-2-\Left.north)--(h-3-\i);
    \draw[very thick,->] (h-2-\Right.north)--(h-3-\i);
}

\node[mynode,fill=green] (h-4-0) at ($(h-3-0)!0.5!(h-3-1)+(0,1.5)$) {};

\draw[very thick,->] (h-3-0.north)--(h-4-0);
\draw[very thick,->] (h-3-1.north)--(h-4-0);

\foreach \i/\j in {1/2,3/4,5/6}{
    \draw[line width=2pt,red,dashed] ($(h-1-\i)!0.5!(h-1-\j)$)--++(0,-4);
}
\foreach \i in {0,1,2,3}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \node[mynode] (w-\i) at ($(h-1-\Left)!0.5!(h-1-\Right)+(0,1.25)$) {};
    \draw[very thick,->] (h-1-\Left)--(w-\i);
    \draw[very thick,->] (h-1-\Right)--(w-\i);
    \wots{(h-2-\i)}
    \foreach \j in {0,1,2,3}{
        \draw[thick] (w-\i)--(cs-\j);
    }
}

\end{tikzpicture}
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "fors-16-bad-actor-1"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
mynode/.style={draw,circle,very thick, align=center, minimum width=0.75cm,fill=blue!50!white},
]

%------------------------------------------------
% Mini arbre binaire
% #1 = centre de l'arbre
%------------------------------------------------
\newcommand{\MiniTree}[1]{
    \node[draw,circle,fill=white,inner sep=2pt]
        (root) at (#1) {};
    \node[draw,circle,fill=white,inner sep=2pt]
        (leafL) at ($(root)+(-0.12,-0.28)$) {};
    \node[draw,circle,fill=white,inner sep=2pt]
        (leafR) at ($(root)+(0.12,-0.28)$) {};
    \draw (root) -- (leafL);
    \draw (root) -- (leafR);
}

%------------------------------------------------
% #1 = node au sommet supérieur
% #2 = largeur du triangle
% #3 = hauteur du triangle
%------------------------------------------------
\newcommand{\TopTriangle}[3]{
    \coordinate (left)  at ($(#1)+(-#2/2,-#3)$);
    \coordinate (right) at ($(#1)+(#2/2,-#3)$);
    \draw[very thick,fill=green!50]
        (#1) -- (left) -- (right) -- cycle;
    \coordinate (basecenter) at ($(left)!0.5!(right)$);
    \coordinate (yline) at ($(basecenter)+(0,0.35)$);
    \node (t1) at ($(yline)+(-1,0.1)$) {};
    \MiniTree{t1}
    \node (t2) at ($(yline)+(-0.45,0.1)$) {};
    \MiniTree{t2}
    \node (t3) at ($(yline)+(0.85,0.1)$) {};
    \MiniTree{t3}
    \node at ($(yline)+(0.2,-0.12)$) {$\ldots$};
    \node[
        draw,
        very thick,
        circle,
        fill=green,
        inner sep=5pt
    ]
    (midnode)
    at ($(#1)+(-0.05,-1)$) {};
    \draw (t1.north) -- (midnode);
    \draw (t2.north) -- (midnode);
    \draw (t3.north) -- (midnode);
}

\newcommand{\TopTriangleEspion}[3]{
    \coordinate (left)  at ($(#1)+(-#2/2,-#3)$);
    \coordinate (right) at ($(#1)+(#2/2,-#3)$);
    \draw[very thick,fill=orange]
        (#1) -- (left) -- (right) -- cycle;
    \coordinate (basecenter) at ($(left)!0.5!(right)$);
    \coordinate (yline) at ($(basecenter)+(0,0.35)$);
    \node (t1) at ($(yline)+(-1,0.1)$) {};
    \MiniTree{t1}
    \node (t2) at ($(yline)+(-0.45,0.1)$) {};
    \MiniTree{t2}
    \node (t3) at ($(yline)+(0.85,0.1)$) {};
    \MiniTree{t3}
    \node at ($(yline)+(0.2,-0.12)$) {$\ldots$};
    \node[
        draw,
        very thick,
        circle,
        fill=green,
        inner sep=5pt
    ]
    (midnode)
    at ($(#1)+(-0.05,-1)$) {};
    \draw (t1.north) -- (midnode);
    \draw (t2.north) -- (midnode);
    \draw (t3.north) -- (midnode);
}

\newcommand{\wots}[1]{
\tikzset{
clesecrete/.style={draw,thick,circle,fill=red!50!white,inner sep=3pt},
signature/.style={draw,thick,circle,fill=blue!50!white,inner sep=3pt},
clepublique/.style={draw,thick,circle,fill=green!50!white,inner sep=3pt}
}

\node[clepublique,minimum width=0.75cm] (cp) at #1 {};
\pgfmathsetmacro{\h}{2}
\pgfmathsetmacro{\mydx}{0.5}
\pgfmathsetmacro{\mydy}{0.75}

\foreach \i/\idx in {-2/0,-1/1,0/2,2/3}{
    \draw[green!50!white,fill=green!50!white] ($(cp)+(\i*\mydx-0.25*\mydx,-\mydy)$) rectangle++(0.5*\mydx,-\h);
    \node[clepublique] (cp-\idx) at ($(cp)+(\i*\mydx,-\mydy)$) {};
    \draw[thick] (cp-\idx)--(cp);
}
\foreach \i/\pos in {0/1.3,1/0.8,2/0.4,3/1.2}{
    \pgfmathsetmacro{\pos}{rnd*1.6+0.2}
    \draw[red!50!white,fill=red!50!white] ($(cp-\i)+(-0.25*\mydx,-\pos)$) rectangle++(0.5*\mydx,-\h+\pos);
    \draw[dotted] (cp-\i.south)--($(cp-\i)-(0,\h)$);
    \node[signature] (s-\i) at ($(cp-\i)+(0,-\pos)$) {};
    \node[clesecrete] (cs-\i) at ($(cp-\i)+(0,-\h)$) {};
}

\shade[
        bottom color=red!50!white,
        top color=green!50!white
    ]
    ($(cp)+(\mydx-0.25*\mydx,-\mydy)$) rectangle++ (0.5*\mydx,-\h);
    \draw[dotted] (cp)--($(cp)+(\mydx,-\mydy)$)--++(0,-\h);
}
\node[inner sep=0pt] (f-0) at (0,0) {};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2,...,15}{
    \node[inner sep=0pt] (f-\i) [right=1.25cm of f-\j] {};
}
\foreach \i in {0,1,...,15}{
    \TopTriangle{f-\i}{3}{3}
}
\foreach \i  in {0,1,...,7}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \node[mynode] (h-1-\i) at ($(f-\Left)!0.5!(f-\Right)+(0,1)$) {};
}
\foreach \i in {0,1,...,7}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \draw[very thick,->] (f-\Left.north)--(h-1-\i);
    \draw[very thick,->] (f-\Right.north)--(h-1-\i);
}
\foreach \i  in {0,1,...,3}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \node[mynode] (h-2-\i) at ($(h-1-\Left)!0.5!(h-1-\Right)+(0,5)$) {};
}

\node[mynode] (h-3-0) at ($(h-2-0)!0.5!(h-2-1)+(0,1.5)$) {};
\node[mynode] (h-3-1) at ($(h-2-2)!0.5!(h-2-3)+(0,1.5)$) {};
\foreach \i in {0,1}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \draw[very thick,->] (h-2-\Left.north)--(h-3-\i);
    \draw[very thick,->] (h-2-\Right.north)--(h-3-\i);
}
\node[mynode,fill=green] (h-4-0) at ($(h-3-0)!0.5!(h-3-1)+(0,1.5)$) {};

\draw[very thick,->] (h-3-0.north)--(h-4-0);
\draw[very thick,->] (h-3-1.north)--(h-4-0);

\foreach \i/\j in {1/2,3/4,5/6}{
    \draw[line width=2pt,red,dashed] ($(h-1-\i)!0.5!(h-1-\j)$)--++(0,-4);
}
\foreach \i in {0,1,2,3}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \node[mynode] (w-\i) at ($(h-1-\Left)!0.5!(h-1-\Right)+(0,1.25)$) {};
    \draw[very thick,->] (h-1-\Left)--(w-\i);
    \draw[very thick,->] (h-1-\Right)--(w-\i);
    \wots{(h-2-\i)}
    \foreach \j in {0,1,2,3}{
        \draw[thick] (w-\i)--(cs-\j);
    }
}

\TopTriangleEspion{f-5}{3}{3}
% \node[mynode,fill=orange] (h-1-2) at ($(f-4)!0.5!(f-5)+(0,1)$) {};
% \node[mynode,fill=orange] (w-1) at ($(h-1-2)!0.5!(h-1-3)+(0,1.25)$) {};
\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "fors-16-bad-actor-2"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
mynode/.style={draw,circle,very thick, align=center, minimum width=0.75cm,fill=blue!50!white},
]

%------------------------------------------------
% Mini arbre binaire
% #1 = centre de l'arbre
%------------------------------------------------
\newcommand{\MiniTree}[1]{
    \node[draw,circle,fill=white,inner sep=2pt]
        (root) at (#1) {};
    \node[draw,circle,fill=white,inner sep=2pt]
        (leafL) at ($(root)+(-0.12,-0.28)$) {};
    \node[draw,circle,fill=white,inner sep=2pt]
        (leafR) at ($(root)+(0.12,-0.28)$) {};
    \draw (root) -- (leafL);
    \draw (root) -- (leafR);
}

%------------------------------------------------
% #1 = node au sommet supérieur
% #2 = largeur du triangle
% #3 = hauteur du triangle
%------------------------------------------------
\newcommand{\TopTriangle}[3]{
    \coordinate (left)  at ($(#1)+(-#2/2,-#3)$);
    \coordinate (right) at ($(#1)+(#2/2,-#3)$);
    \draw[very thick,fill=green!50]
        (#1) -- (left) -- (right) -- cycle;
    \coordinate (basecenter) at ($(left)!0.5!(right)$);
    \coordinate (yline) at ($(basecenter)+(0,0.35)$);
    \node (t1) at ($(yline)+(-1,0.1)$) {};
    \MiniTree{t1}
    \node (t2) at ($(yline)+(-0.45,0.1)$) {};
    \MiniTree{t2}
    \node (t3) at ($(yline)+(0.85,0.1)$) {};
    \MiniTree{t3}
    \node at ($(yline)+(0.2,-0.12)$) {$\ldots$};
    \node[
        draw,
        very thick,
        circle,
        fill=green,
        inner sep=5pt
    ]
    (midnode)
    at ($(#1)+(-0.05,-1)$) {};
    \draw (t1.north) -- (midnode);
    \draw (t2.north) -- (midnode);
    \draw (t3.north) -- (midnode);
}

\newcommand{\TopTriangleEspion}[3]{
    \coordinate (left)  at ($(#1)+(-#2/2,-#3)$);
    \coordinate (right) at ($(#1)+(#2/2,-#3)$);
    \draw[very thick,fill=orange]
        (#1) -- (left) -- (right) -- cycle;
    \coordinate (basecenter) at ($(left)!0.5!(right)$);
    \coordinate (yline) at ($(basecenter)+(0,0.35)$);
    \node (t1) at ($(yline)+(-1,0.1)$) {};
    \MiniTree{t1}
    \node (t2) at ($(yline)+(-0.45,0.1)$) {};
    \MiniTree{t2}
    \node (t3) at ($(yline)+(0.85,0.1)$) {};
    \MiniTree{t3}
    \node at ($(yline)+(0.2,-0.12)$) {$\ldots$};
    \node[
        draw,
        very thick,
        circle,
        fill=green,
        inner sep=5pt
    ]
    (midnode)
    at ($(#1)+(-0.05,-1)$) {};
    \draw (t1.north) -- (midnode);
    \draw (t2.north) -- (midnode);
    \draw (t3.north) -- (midnode);
}

\newcommand{\wots}[1]{
\tikzset{
clesecrete/.style={draw,thick,circle,fill=red!50!white,inner sep=3pt},
signature/.style={draw,thick,circle,fill=blue!50!white,inner sep=3pt},
clepublique/.style={draw,thick,circle,fill=green!50!white,inner sep=3pt}
}

\node[clepublique,minimum width=0.75cm] (cp) at #1 {};
\pgfmathsetmacro{\h}{2}
\pgfmathsetmacro{\mydx}{0.5}
\pgfmathsetmacro{\mydy}{0.75}

\foreach \i/\idx in {-2/0,-1/1,0/2,2/3}{
    \draw[green!50!white,fill=green!50!white] ($(cp)+(\i*\mydx-0.25*\mydx,-\mydy)$) rectangle++(0.5*\mydx,-\h);
    \node[clepublique] (cp-\idx) at ($(cp)+(\i*\mydx,-\mydy)$) {};
    \draw[thick] (cp-\idx)--(cp);
}
\foreach \i/\pos in {0/1.3,1/0.8,2/0.4,3/1.2}{
    \pgfmathsetmacro{\pos}{rnd*1.6+0.2}
    \draw[red!50!white,fill=red!50!white] ($(cp-\i)+(-0.25*\mydx,-\pos)$) rectangle++(0.5*\mydx,-\h+\pos);
    \draw[dotted] (cp-\i.south)--($(cp-\i)-(0,\h)$);
    \node[signature] (s-\i) at ($(cp-\i)+(0,-\pos)$) {};
    \node[clesecrete] (cs-\i) at ($(cp-\i)+(0,-\h)$) {};
}

\shade[
        bottom color=red!50!white,
        top color=green!50!white
    ]
    ($(cp)+(\mydx-0.25*\mydx,-\mydy)$) rectangle++ (0.5*\mydx,-\h);
    \draw[dotted] (cp)--($(cp)+(\mydx,-\mydy)$)--++(0,-\h);
}
\node[inner sep=0pt] (f-0) at (0,0) {};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2,...,15}{
    \node[inner sep=0pt] (f-\i) [right=1.25cm of f-\j] {};
}
\foreach \i in {0,1,...,15}{
    \TopTriangle{f-\i}{3}{3}
}
\foreach \i  in {0,1,...,7}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \node[mynode] (h-1-\i) at ($(f-\Left)!0.5!(f-\Right)+(0,1)$) {};
}
\foreach \i in {0,1,...,7}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \draw[very thick,->] (f-\Left.north)--(h-1-\i);
    \draw[very thick,->] (f-\Right.north)--(h-1-\i);
}
\foreach \i  in {0,1,...,3}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \node[mynode] (h-2-\i) at ($(h-1-\Left)!0.5!(h-1-\Right)+(0,5)$) {};
}

\node[mynode] (h-3-0) at ($(h-2-0)!0.5!(h-2-1)+(0,1.5)$) {};
\node[mynode] (h-3-1) at ($(h-2-2)!0.5!(h-2-3)+(0,1.5)$) {};
\foreach \i in {0,1}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \draw[very thick,->] (h-2-\Left.north)--(h-3-\i);
    \draw[very thick,->] (h-2-\Right.north)--(h-3-\i);
}
\node[mynode,fill=green] (h-4-0) at ($(h-3-0)!0.5!(h-3-1)+(0,1.5)$) {};

\draw[very thick,->] (h-3-0.north)--(h-4-0);
\draw[very thick,->] (h-3-1.north)--(h-4-0);

\foreach \i/\j in {1/2,3/4,5/6}{
    \draw[line width=2pt,red,dashed] ($(h-1-\i)!0.5!(h-1-\j)$)--++(0,-4);
}
\foreach \i in {0,1,2,3}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \node[mynode] (w-\i) at ($(h-1-\Left)!0.5!(h-1-\Right)+(0,1.25)$) {};
    \draw[very thick,->] (h-1-\Left)--(w-\i);
    \draw[very thick,->] (h-1-\Right)--(w-\i);
    \wots{(h-2-\i)}
    \foreach \j in {0,1,2,3}{
        \draw[thick] (w-\i)--(cs-\j);
    }
}

\TopTriangleEspion{f-5}{3}{3}
\node[mynode,fill=orange] (h-1-2) at ($(f-4)!0.5!(f-5)+(0,1)$) {};
% \node[mynode,fill=orange] (w-1) at ($(h-1-2)!0.5!(h-1-3)+(0,1.25)$) {};
\end{tikzpicture}
#
#
#
#
#
#| fig-align: "center"
#| fig-with: 5
#| label: "fors-16-bad-actor-3"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit}
\begin{tikzpicture}[
mynode/.style={draw,circle,very thick, align=center, minimum width=0.75cm,fill=blue!50!white},
]

%------------------------------------------------
% Mini arbre binaire
% #1 = centre de l'arbre
%------------------------------------------------
\newcommand{\MiniTree}[1]{
    \node[draw,circle,fill=white,inner sep=2pt]
        (root) at (#1) {};
    \node[draw,circle,fill=white,inner sep=2pt]
        (leafL) at ($(root)+(-0.12,-0.28)$) {};
    \node[draw,circle,fill=white,inner sep=2pt]
        (leafR) at ($(root)+(0.12,-0.28)$) {};
    \draw (root) -- (leafL);
    \draw (root) -- (leafR);
}

%------------------------------------------------
% #1 = node au sommet supérieur
% #2 = largeur du triangle
% #3 = hauteur du triangle
%------------------------------------------------
\newcommand{\TopTriangle}[3]{
    \coordinate (left)  at ($(#1)+(-#2/2,-#3)$);
    \coordinate (right) at ($(#1)+(#2/2,-#3)$);
    \draw[very thick,fill=green!50]
        (#1) -- (left) -- (right) -- cycle;
    \coordinate (basecenter) at ($(left)!0.5!(right)$);
    \coordinate (yline) at ($(basecenter)+(0,0.35)$);
    \node (t1) at ($(yline)+(-1,0.1)$) {};
    \MiniTree{t1}
    \node (t2) at ($(yline)+(-0.45,0.1)$) {};
    \MiniTree{t2}
    \node (t3) at ($(yline)+(0.85,0.1)$) {};
    \MiniTree{t3}
    \node at ($(yline)+(0.2,-0.12)$) {$\ldots$};
    \node[
        draw,
        very thick,
        circle,
        fill=green,
        inner sep=5pt
    ]
    (midnode)
    at ($(#1)+(-0.05,-1)$) {};
    \draw (t1.north) -- (midnode);
    \draw (t2.north) -- (midnode);
    \draw (t3.north) -- (midnode);
}

\newcommand{\TopTriangleEspion}[3]{
    \coordinate (left)  at ($(#1)+(-#2/2,-#3)$);
    \coordinate (right) at ($(#1)+(#2/2,-#3)$);
    \draw[very thick,fill=orange]
        (#1) -- (left) -- (right) -- cycle;
    \coordinate (basecenter) at ($(left)!0.5!(right)$);
    \coordinate (yline) at ($(basecenter)+(0,0.35)$);
    \node (t1) at ($(yline)+(-1,0.1)$) {};
    \MiniTree{t1}
    \node (t2) at ($(yline)+(-0.45,0.1)$) {};
    \MiniTree{t2}
    \node (t3) at ($(yline)+(0.85,0.1)$) {};
    \MiniTree{t3}
    \node at ($(yline)+(0.2,-0.12)$) {$\ldots$};
    \node[
        draw,
        very thick,
        circle,
        fill=green,
        inner sep=5pt
    ]
    (midnode)
    at ($(#1)+(-0.05,-1)$) {};
    \draw (t1.north) -- (midnode);
    \draw (t2.north) -- (midnode);
    \draw (t3.north) -- (midnode);
}

\newcommand{\wots}[1]{
\tikzset{
clesecrete/.style={draw,thick,circle,fill=red!50!white,inner sep=3pt},
signature/.style={draw,thick,circle,fill=blue!50!white,inner sep=3pt},
clepublique/.style={draw,thick,circle,fill=green!50!white,inner sep=3pt}
}

\node[clepublique,minimum width=0.75cm] (cp) at #1 {};
\pgfmathsetmacro{\h}{2}
\pgfmathsetmacro{\mydx}{0.5}
\pgfmathsetmacro{\mydy}{0.75}

\foreach \i/\idx in {-2/0,-1/1,0/2,2/3}{
    \draw[green!50!white,fill=green!50!white] ($(cp)+(\i*\mydx-0.25*\mydx,-\mydy)$) rectangle++(0.5*\mydx,-\h);
    \node[clepublique] (cp-\idx) at ($(cp)+(\i*\mydx,-\mydy)$) {};
    \draw[thick] (cp-\idx)--(cp);
}
\foreach \i/\pos in {0/1.3,1/0.8,2/0.4,3/1.2}{
    \pgfmathsetmacro{\pos}{rnd*1.6+0.2}
    \draw[red!50!white,fill=red!50!white] ($(cp-\i)+(-0.25*\mydx,-\pos)$) rectangle++(0.5*\mydx,-\h+\pos);
    \draw[dotted] (cp-\i.south)--($(cp-\i)-(0,\h)$);
    \node[signature] (s-\i) at ($(cp-\i)+(0,-\pos)$) {};
    \node[clesecrete] (cs-\i) at ($(cp-\i)+(0,-\h)$) {};
}

\shade[
        bottom color=red!50!white,
        top color=green!50!white
    ]
    ($(cp)+(\mydx-0.25*\mydx,-\mydy)$) rectangle++ (0.5*\mydx,-\h);
    \draw[dotted] (cp)--($(cp)+(\mydx,-\mydy)$)--++(0,-\h);
}
\node[inner sep=0pt] (f-0) at (0,0) {};
\foreach \i [evaluate=\i as \j using int(\i-1)] in {1,2,...,15}{
    \node[inner sep=0pt] (f-\i) [right=1.25cm of f-\j] {};
}
\foreach \i in {0,1,...,15}{
    \TopTriangle{f-\i}{3}{3}
}
\foreach \i  in {0,1,...,7}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \node[mynode] (h-1-\i) at ($(f-\Left)!0.5!(f-\Right)+(0,1)$) {};
}
\foreach \i in {0,1,...,7}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \draw[very thick,->] (f-\Left.north)--(h-1-\i);
    \draw[very thick,->] (f-\Right.north)--(h-1-\i);
}
\foreach \i  in {0,1,...,3}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \node[mynode] (h-2-\i) at ($(h-1-\Left)!0.5!(h-1-\Right)+(0,5)$) {};
}

\node[mynode] (h-3-0) at ($(h-2-0)!0.5!(h-2-1)+(0,1.5)$) {};
\node[mynode] (h-3-1) at ($(h-2-2)!0.5!(h-2-3)+(0,1.5)$) {};
\foreach \i in {0,1}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \draw[very thick,->] (h-2-\Left.north)--(h-3-\i);
    \draw[very thick,->] (h-2-\Right.north)--(h-3-\i);
}
\node[mynode,fill=green] (h-4-0) at ($(h-3-0)!0.5!(h-3-1)+(0,1.5)$) {};

\draw[very thick,->] (h-3-0.north)--(h-4-0);
\draw[very thick,->] (h-3-1.north)--(h-4-0);

\foreach \i/\j in {1/2,3/4,5/6}{
    \draw[line width=2pt,red,dashed] ($(h-1-\i)!0.5!(h-1-\j)$)--++(0,-4);
}
\foreach \i in {0,1,2,3}{
    \pgfmathtruncatemacro{\Left}{2*\i}
    \pgfmathtruncatemacro{\Right}{2*\i+1}
    \node[mynode] (w-\i) at ($(h-1-\Left)!0.5!(h-1-\Right)+(0,1.25)$) {};
    \draw[very thick,->] (h-1-\Left)--(w-\i);
    \draw[very thick,->] (h-1-\Right)--(w-\i);
    \wots{(h-2-\i)}
    \foreach \j in {0,1,2,3}{
        \draw[thick] (w-\i)--(cs-\j);
    }
}

\TopTriangleEspion{f-5}{3}{3}
\node[mynode,fill=orange] (h-1-2) at ($(f-4)!0.5!(f-5)+(0,1)$) {};
\node[mynode,fill=orange] (w-1) at ($(h-1-2)!0.5!(h-1-3)+(0,1.25)$) {};
\end{tikzpicture}
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| fig-align: "center"
#| fig-width: 6
#| label: "sphincs"
#| cache: true
#| 
\usetikzlibrary{positioning,calc,fit,trees,shapes}
\begin{tikzpicture}

\tikzset{
level distance=5mm,
level 1/.style={sibling distance=16mm},
level 2/.style={sibling distance=8mm},
level 3/.style={sibling distance=4mm},
hash/.style={circle,draw},
wots/.style={draw,minimum width=3mm,minimum height=3mm},
fors/.style={draw,diamond},
stade/.style={rounded rectangle,draw,minimum height=3mm,minimum width=8mm,fill=green},
merkle/.style={fill=blue}
}

\newcommand{\enveloppe}[1]{%
\begin{scope}[shift={#1}]

    % Dimensions
    \def\L{5mm}   % largeur
    \def\H{3mm}   % hauteur

    % Couleurs
    \definecolor{mailfill}{RGB}{220,228,242}
    \definecolor{mailline}{RGB}{90,120,170}

    % Rectangle principal
    \filldraw[
        fill=mailfill,
        draw=mailline,
        line width=0.5pt
    ]
    (-\L/2,-\H/2) rectangle (\L/2,\H/2);

    % Rabat
    \draw[mailline,line width=0.5pt]
        (-\L/2,\H/2) -- (0,0) -- (\L/2,\H/2);

    % Lettre m
    \node[
        text=gray!70,
        font=\tiny
    ] at (0,-0.05) {m};

\end{scope}
}

\coordinate (A) at (0,0);
\node[stade] (PK) at (A) {} 
    child {node[hash] (h0) {}
        child {node[hash] (h2) {}
            child {node[wots,merkle] (h6) {}}
            child {node[wots] (h7) {}}
        }
        child {node[hash,merkle] (h3) {}
            child {node[wots] (h8) {}}
            child {node[wots] (h9) {}}
        }
    }
    child {node[hash,merkle] (h1) {}
        child {node[hash] (h4) {}
            child {node[wots] (h10) {}}
            child {node[wots] (h11) {}}  
        }
        child {node[hash] (h5) {}
            child {node[wots] (h12) {}}
            child {node[wots] (h13) {}}
        }
    }
;

\node[below=0.5cm of h7] (B) {};
\draw[line width=1pt,densely dashed] (h7)--(B.north);
\node[hash] (PK) at (B.center) {} 
    child {node[hash,merkle] (h0) {}
        child {node[hash] (h2) {}
            child {node[wots] (h6) {}}
            child {node[wots] (h7) {}}
        }
        child {node[hash] (h3) {}
            child {node[wots] (h8) {}}
            child {node[wots] (h9) {}}
        }
    }
    child {node[hash] (h1) {}
        child {node[hash,merkle] (h4) {}
            child {node[wots] (h10) {}}
            child {node[wots] (h11) {}}  
        }
        child {node[hash] (h5) {}
            child {node[wots] (h12) {}}
            child {node[wots,merkle] (h13) {}}
        }
    }
;

\node[below=0.5cm of h12] (C) {};
\draw[line width=1pt,densely dashed] (h12)--(C.north);
\node[hash] (PK) at (C) {} 
    child {node[hash] (h0) {}
        child {node[hash,merkle] (h2) {}
            child {node[wots] (h6) {}}
            child {node[wots] (h7) {}}
        }
        child {node[hash] (h3) {}
            child {node[wots,merkle] (h8) {} }
            child {node[wots] (h9) {} edge from parent[very thick]} 
        }
    }
    child {node[hash,merkle] (h1) {}
        child {node[hash] (h4) {}
            child {node[wots] (h10) {}}
            child {node[wots] (h11) {}}  
        }
        child {node[hash] (h5) {}
            child {node[wots] (h12) {}}
            child {node[wots] (h13) {}}
        }
    }
;
\draw (h0) edge[very thick] (h3);
\draw (PK) edge[very thick] (h0);

\node[below=0.5cm of h9,fors] (D) {};
\draw[line width=1pt,densely dashed] (h9)--(D.north);
\node[below=0.5cm of D] (E) {};
\draw[line width=1pt,densely dashed] (E)--(D.south);
\enveloppe{(E)}

\node[fors] (fors-legende) at (2.5,0) {};
\node[right=0.1cm of fors-legende] (fors-legende-text) {FORS};
\node[below of=fors-legende,wots] (ots-legende) {};
\node[right=0.1cm of ots-legende] (ots-legende-text) {WOTS};
\node[below of=ots-legende,hash] (hash-legende) {};
\node[right=0.1cm of hash-legende] (hash-legende-text) {EMPREINTE};

\end{tikzpicture}
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
