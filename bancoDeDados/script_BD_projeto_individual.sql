create database projeto_individual;
use projeto_individual;
show tables;

create table usuario (
idUsuario int primary key auto_increment,
nome varchar(45),
email varchar(45),
senha varchar(45),
generoMusical varchar(45)
);
insert into usuario values
(null, 'jao', 'jao@email.com', '12345678', 'Gospel'),
(null, 'eliane', 'eliane@email.com', '28594738', 'Pop'),
(null, 'bia', 'bia@email.com', '20485729', 'Folk'),
(null, 'lupi', 'lupi@email.com', '75849302', 'Indie');

create table comentario (
id int primary key auto_increment,
assunto varchar(45),
mensagem varchar(200),
fkUsuario int, constraint foreign key (fkUsuario) references usuario(idUsuario)
);

create table quiz (
idQuiz int primary key auto_increment,
pontuacao int,
fkUsuario int, constraint foreign key (fkUsuario) references usuario(idUsuario) 
);

DELIMITER //

CREATE TRIGGER trigger_insert_usuario
AFTER INSERT ON usuario
FOR EACH ROW
BEGIN
    INSERT INTO quiz (pontuacao, fkUsuario)
    VALUES (0, NEW.idUsuario);
END //

DELIMITER ;       

select * from usuario;         
select * from comentario;         
select * from quiz; 

select round(avg(pontuacao)) from quiz;    

update quiz set pontuacao = 5 where fkUsuario = 7; 

SELECT u.nome, (SUM(q.pontuacao) / COUNT(*) * 100) AS porcentagem_acerto
FROM usuario u
JOIN quiz q ON q.fkUsuario = u.idUsuario
GROUP BY u.idUsuario, u.nome;

SELECT u.nome, (q.pontuacao / (SELECT SUM(pontuacao) FROM quiz) * 100) AS porcentagem_acerto
FROM usuario u
JOIN quiz q ON q.fkUsuario = u.idUsuario;
 
 -- select para exibir as médias de acerto de cada usuário em específico
SELECT u.nome, round((SUM(q.pontuacao) / (COUNT(*) * 10) * 100)) AS porcentagem_acerto
FROM usuario u
JOIN quiz q ON q.fkUsuario = u.idUsuario
GROUP BY u.idUsuario, u.nome;

-- select com subquery que pega todas as médias de acerto dos usuários e faz a média delas
SELECT round(AVG(porcentagem_acerto)) AS media_porcentagem_acerto
FROM (
    SELECT (q.pontuacao / 10) * 100 AS porcentagem_acerto
    FROM usuario u
    JOIN quiz q ON q.fkUsuario = u.idUsuario
) AS subquery;

-- Comentário 1
INSERT INTO comentario (assunto, mensagem, fkUsuario)
VALUES ('Reclamação', 'Estou cansado de ouvir as mesmas músicas na rádio. Precisamos de mais diversidade e artistas independentes sendo valorizados. #MusicIndustry', 1);

-- Comentário 2
INSERT INTO comentario (assunto, mensagem, fkUsuario)
VALUES ('Artista Aleatório', 'Descobri um artista indie chamado Jack Johnson recentemente e estou adorando suas músicas relaxantes. Recomendo a todos que buscam uma vibe tranquila. #IndieMusic', 2);

-- Comentário 3
INSERT INTO comentario (assunto, mensagem, fkUsuario)
VALUES ('Reclamação', 'Por que tantas músicas populares hoje em dia têm letras vazias e sem sentido? Sinto falta de composições mais profundas e significativas. #LyricsMatter', 3);

-- Comentário 4
INSERT INTO comentario (assunto, mensagem, fkUsuario)
VALUES ('Artista Aleatório', 'Descobri uma banda chamada Alt-J e estou fascinado pela sua sonoridade única e experimental. Recomendo a todos que buscam algo diferente. #AlternativeMusic', 4);

-- Comentário 5
INSERT INTO comentario (assunto, mensagem, fkUsuario)
VALUES ('Reclamação', 'Os preços dos ingressos para shows estão cada vez mais altos. É triste ver que nem todos podem ter acesso às experiências musicais ao vivo. #Concerts', 5);

-- Comentário 6
INSERT INTO comentario (assunto, mensagem, fkUsuario)
VALUES ('Artista Aleatório', 'Descobri uma cantora chamada Lizzo e estou apaixonado pela sua voz poderosa e suas letras empoderadoras. Ela é uma verdadeira inspiração! #NewArtist', 1);

-- Comentário 7
INSERT INTO comentario (assunto, mensagem, fkUsuario)
VALUES ('Reclamação', 'Não entendo por que certos artistas são tão superestimados. Há tantos talentos escondidos por aí que não recebem o reconhecimento que merecem. #UnderratedArtists', 2);

-- Comentário 8
INSERT INTO comentario (assunto, mensagem, fkUsuario)
VALUES ('Artista Aleatório', 'Tenho ouvido muito a banda Tame Impala ultimamente. Suas músicas psicodélicas e os arranjos bem construídos são incríveis. #PsychedelicRock', 3);

-- Comentário 9
INSERT INTO comentario (assunto, mensagem, fkUsuario)
VALUES ('Reclamação', 'O streaming mudou a forma como consumimos música, mas sinto falta de ter álbuns físicos e a experiência de folhear o encarte enquanto ouço. #PhysicalMedia', 4);

-- Comentário 10
INSERT INTO comentario (assunto, mensagem, fkUsuario)
VALUES ('Artista Aleatório', 'Descobri uma rapper chamada Noname recentemente e estou impressionado com suas letras inteligentes e seu flow impecável. Vale a pena conferir! #HipHop', 5);
