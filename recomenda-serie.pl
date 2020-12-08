tvshow('The Office', 'comedia', 201).
tvshow('Better Call Saul', 'comedia', 44).
tvshow('Fleabag', 'comedia', 12).

tvshow('Greys Anatomy', 'drama', 367).
tvshow('Downton Abbey', 'drama', 38).
tvshow('The Queens Gambit', 'drama', 7).

tvshow('24', 'acao', 205).
tvshow('The Last Kingdom', 'acao', 36).
tvshow('The Boys', 'acao', 16).

tvshow('One Punch Man', 'anime', 18).
tvshow('Shingeki no Kyojin', 'anime', 31).
tvshow('Naruto', 'anime', 220).

tvshow('Dirigir Para Viver', 'esporte', 10).
tvshow('Arremesso Final', 'esporte', 22).
tvshow('Esportes no mundo', 'esporte', 56).

tvshow('The Witcher', 'ficcao', 8).
tvshow('Stranger Things', 'ficcao', 24).
tvshow('The Walking Dead', 'ficcao', 114).

tvshow('Nosso Planeta', 'ciencia', 8).
tvshow('Tales by light', 'ciencia', 24).
tvshow('100 Humanos', 'ciencia', 55).

tvshow('Segunda Guerra em Cores', 'documentario', 10).
tvshow('Desvendando enigmas', 'documentario', 22).
tvshow('Alienigenas do passado', 'documentario', 60).

tvshow('Segurança em jogo', 'misterio', 10).
tvshow('O segredo do templo', 'misterio', 22).
tvshow('Elementary', 'misterio', 60).

tvshow('Black summer', 'terror', 15).
tvshow('The purge', 'terror', 27).
tvshow('American Horror Story', 'terror', 60).

tvshow('Emily em Paris', 'romance', 10).
tvshow('Virgin River', 'romance', 35).
tvshow('Julie and the panthoms', 'romance', 80).

duracao(T,B,A):- tvshow(A,B,C), 0 < C, 20 > C, T == 1.
duracao(T,B,A):- tvshow(A,B,C), 19 < C, 50 > C , T == 2.
duracao(T,B,A):- tvshow(A,B,C), 49 < C, T == 3.

% X = GENERO | Y = HUMOR | Z = IDADE DA PESSOA | O = RESULTADO BASEADO NOS INPUTS |

recomendacao(X, Y, Z, O):- (X == 2, Y == 2), 0 < Z, 30 > Z, O = 'comedia, misterio, drama'.
recomendacao(X, Y, Z, O):- (X == 2, Y == 2), 29 < Z, O = 'comedia, documentario, ciencia'. 
recomendacao(X, Y, Z, O):- (X == 2, Y == 1), 0 < Z, 30 > Z, O = 'romance, anime, ficcao'.
recomendacao(X, Y, Z, O):- (X == 2, Y == 1), 29 < Z, O = 'romance, misterio, drama'. 
recomendacao(X, Y, Z, O):- (X == 2, Y == 3), 0 < Z, 30 > Z, O = 'terror, documentario, esporte'.
recomendacao(X, Y, Z, O):- (X == 2, Y == 3), 29 < Z, O = 'acao, drama, comedia'.
recomendacao(X, Y, Z, O):- (X == 1, Y == 2), 0 < Z, 30 > Z, O = 'acao, anime, terror'.
recomendacao(X, Y, Z, O):- (X == 1, Y == 2), 29 < Z, O = 'documentario, esporte, misterio'.
recomendacao(X, Y, Z, O):- (X == 1, Y == 1), 0 < Z, 30 > Z, O = 'acao, comedia, ciencia'. 
recomendacao(X, Y, Z, O):- (X == 1, Y == 1), 29 < Z, O = 'ficcao, comedia, romance'. 
recomendacao(X, Y, Z, O):- (X == 1, Y == 3), 0 < Z, 30 > Z, O = 'terror, esporte, drama'.
recomendacao(X, Y, Z, O):- (X == 1, Y == 3), 29 < Z, O = 'documentario, ciencia, acao'.

%Recomendação de Animes

recomendandoSerie(A):-	
  write('Faremos uma recomendação de series para você!!'),nl,
  write('Por favor, responda as questões abaixo'),nl,

  write('Qual o seu gênero? '),nl,
  write('1. Masculino'),nl,
  write('2. Feminino'),nl,
  read(GeneroSexual),nl,
    
  write('Qual sua idade? '),nl,
  read(IdadePessoa),nl,

  write('Como você está se sentindo?'),nl,
  write('1. Triste'),nl,
  write('2. Feliz'),nl,
  write('3. Normal'),nl,
  read(Humor),nl,

  write('Os gêneros recomendados para você são: '), 
  recomendacao(GeneroSexual, Humor, IdadePessoa, ResultadoGenero),nl,
  write(ResultadoGenero),nl,
  write('Quais das opções mais te agrada?'),nl,
  read(GeneroSerie),nl,
  
  write('Quanto tempo você tem disponível para assistir?'),nl,
  write('1. Bem pouco.'),nl,
  write('2. Nada muito pequeno nem muito grande.'),nl,
  write('3. Tenho bastante tempo!'),nl,
  read(TempoDisponivel),nl,
  duracao(TempoDisponivel, GeneroSerie, A).

/** <examples>
?- recomendandoSerie(A)
*/