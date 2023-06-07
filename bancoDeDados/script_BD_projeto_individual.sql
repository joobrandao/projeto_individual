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


-- TRIGGER PARA CRIAÇÃO DA PONTUAÇÃO DO QUIZ
DELIMITER //

create trigger trigger_insert_usuario
after insert on usuario
for each row
begin
    insert into quiz (pontuacao, fkUsuario)
    values (0, new.idUsuario);
end //

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

select pontuacao from usuario;
select pontuacao from quiz
 where fkUsuario = 6;
