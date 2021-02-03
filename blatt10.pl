blau(sonnalm).
blau(vorkogel).
blau(arbiskogel).
blau(plattenalm).
blau(wiesenalm).

rot(isskogel).

schwarz(teufeltal).

start(sonnalm).
start(teufeltal).

endetin(sonnalm, vorkogel).
endetin(vorkogel, isskogel).
endetin(sonnalm, arbiskogel).
endetin(arbiskogel, plattenalm).
endetin(plattenalm, wiesenalm).
endetin(teufeltal, wiesenalm).
endetin(wiesenalm, tal).
endetin(isskogel, tal).

gleicherStartpunkt(X, Y) :- start(X), start(Y).
gleicherStartpunkt(X, Y) :- endetin(Z, X), endetin(Z, Y).

erreichbar(X, X) :- X \= tal.
erreichbar(X, Y) :- endetin(X, Z), erreichbar(Z, Y).

moeglicheSchlusspiste(X, S) :- erreichbar(X, S), endetin(S, tal).

treffPisten(X, Y, T) :- erreichbar(X, T), erreichbar(Y, T).

anfaengergeignet(X) :- blau(X), blau(Y), endetin(X, Y), anfaengergeignet(Y).
anfaengergeignet(X) :- blau(X), endetin(X, tal).