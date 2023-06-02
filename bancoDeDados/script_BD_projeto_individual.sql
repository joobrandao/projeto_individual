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
(null, 'LIAJERT', 'ALKSJR', '234536', 'Rock'),
(null, 'SDTGRS', 'SDRG', '5636', 'Rock'),
(null, 'SDF', 'GTSR', '64323', 'Rock'),
(null, 'GWER', 'ASDG', '7564433', 'Gospel'),
(null, 'SDGFSR', 'STHDGRFSD', '2357453', 'Folk');

create table comentario (
id int auto_increment,
assunto varchar(45),
mensagem varchar(200),
fkUsuario int, constraint foreign key (fkUsuario) references usuario(idUsuario),
constraint pkComentario primary key (idComentario, fkUsuario)
);

create table artista (
idArtista int primary key auto_increment,
nome varchar(45)
)auto_increment = 100;
insert into artista values 
(null, 'Bruno Mars'),
(null, 'John Mayer'),
(null, 'Projeto Sola'),
(null, 'Metallica'),
(null, 'Rex Orange County'),
(null, 'Daniel Caesar'),
(null, 'Frank Sinatra'),
(null, 'Alok'),
(null, 'Kendrick Lamar');
select * from artista;

create table musica (
idMusica int primary key auto_increment,
nome varchar(45),
qtdViews int
)auto_increment = 1000;

select musica.nome, musica.qtdViews from musica;


insert into musica values
(null, 'Lazy Song'),
(null, 'Just the way you are'),
(null, 'Count on me'),
(null, 'Back to You'),
(null, 'Neon'),
(null, 'Your Body Is A Wonderland'),
(null, 'Êxodo'),
(null, 'Cansado'),
(null, 'Por Todos Os Dias'),
(null, 'Nothing Else Matters'),
(null, 'Enter Sandman'),
(null, 'The Unforgiven'),
(null, 'Television / So Far So Good'),
(null, 'Never Enough'),
(null, 'Waiting Room'),
(null, 'Get You'),
(null, 'Best Part'),
(null, 'Take Me Away'),
(null, 'The Train'),
(null, 'For a While'),
(null, 'Elizabeth'),
(null, 'HUMBLE.'),
(null, 'DNA.'),
(null, 'LOYALTY.');



select musica.nome, musica.qtdViews from musica where qtdViews > 1;

create table album (
idAlbum int auto_increment,
fkMusica int, constraint fkAlbumMusica foreign key (fkMusica) references musica (idMusica),
fkArtista int, constraint fkArtistaMusica foreign key (fkArtista) references artista (idArtista),
nome varchar(45),
dtLancamento date,
constraint pkAlbum primary key (idAlbum, fkMusica, fkArtista)
)auto_increment = 10;

insert into album values
(null, 1000, 100, 'Doo-Wops & Hooligans', '2010-09-04'),
(null, 1001, 100, 'Doo-Wops & Hooligans', '2010-09-04'),
(null, 1002, 100, 'Doo-Wops & Hooligans', '2010-09-04'),
(null, 1003, 101, 'Room of Squares', '2001-06-05'),
(null, 1004, 101, 'Room of Squares', '2001-06-05'),
(null, 1005, 101, 'Room of Squares', '2001-06-05'),
(null, 1006, 102, 'Homem Litúrgico', '2020-02-15'),
(null, 1007, 102, 'Homem Litúrgico', '2020-02-15'),
(null, 1008, 102, 'Homem Litúrgico', '2020-02-15'),
(null, 1009, 103, 'Master of Puppets', '1986-03-03'),
(null, 1010, 103, 'Master of Puppets', '1986-03-03'),
(null, 1011, 103, 'Master of Puppets', '1986-03-03'),
(null, 1012, 104, 'Apricot Princess', '2017-04-26'),
(null, 1013, 104, 'Apricot Princess', '2017-04-26'),
(null, 1014, 104, 'Apricot Princess', '2017-04-26'),
(null, 1015, 105, 'Freudian', '2017-08-25'),
(null, 1016, 105, 'Freudian', '2017-08-25'),
(null, 1017, 105, 'Freudian', '2017-08-25'),
(null, 1018, 106, 'Watertown', '1970-03-10'),
(null, 1019, 106, 'Watertown', '1970-03-10'),
(null, 1020, 106, 'Watertown', '1970-03-10'),
(null, 1021, 107, 'Damn', '2017-04-14'),
(null, 1022, 107, 'Damn', '2017-04-14'),
(null, 1023, 107, 'Damn', '2017-04-14');

select album.nome, artista.nome, musica.nome from artista
join album on idArtista = fkArtista
join musica on fkMusica = idMusica;

select artista.nome, musica.nome from artista
join album on idArtista = fkArtista
join musica on fkMusica = idMusica
where idArtista = 101;



select generoMusical, count(generoMusical) as qtdVotos from usuario group by generoMusical; 
use projeto_individual;
select * from usuario; 
