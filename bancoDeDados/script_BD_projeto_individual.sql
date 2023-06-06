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
(null, 'joao', 'joao@email.com', '12345678', 'Rock');

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
CREATE TRIGGER trigger_after_insert
AFTER INSERT ON usuario
FOR EACH ROW
BEGIN
    insert into quiz values (null, 0, NEW.idUsuario)
END //

DELIMITER;

                