-- Normalize as tabelas da planilha SpotifyClone

DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos (
    plano_id INT AUTO_INCREMENT PRIMARY KEY,
    plano_nome VARCHAR(100) NOT NULL,
    valor DOUBLE NOT NULL
)  ENGINE=INNODB;

CREATE TABLE pessoas_usuarias (
    pessoa_usuaria_id INT AUTO_INCREMENT PRIMARY KEY,
    pessoa_usuaria_nome VARCHAR(100) NOT NULL,
    idade_pessoa_usuaria INT NOT NULL,
    plano_id INT NOT NULL,
    data_assinatura DATE NOT NULL,
    FOREIGN KEY (plano_id)
        REFERENCES planos (plano_id)
)  ENGINE=INNODB;

CREATE TABLE artistas (
    artista_id INT AUTO_INCREMENT PRIMARY KEY,
    artista_nome VARCHAR(100) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE albuns (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    album_nome VARCHAR(200) NOT NULL,
    artista_id INT NOT NULL,
    ano_lancamento YEAR NOT NULL,
    FOREIGN KEY (artista_id)
        REFERENCES artistas (artista_id)
)  ENGINE=INNODB;

CREATE TABLE seguindo_artistas (
    pessoa_usuaria_id INT NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY (pessoa_usuaria_id , artista_id),
    FOREIGN KEY (artista_id)
        REFERENCES artistas (artista_id),
    FOREIGN KEY (pessoa_usuaria_id)
        REFERENCES pessoas_usuarias (pessoa_usuaria_id)
)  ENGINE=INNODB;

CREATE TABLE cancoes (
    cancao_id INT AUTO_INCREMENT PRIMARY KEY,
    cancao_nome VARCHAR(200) NOT NULL,
    album_id INT NOT NULL,
    artista_id INT NOT NULL,
    duracao_segundos INT NOT NULL,
    FOREIGN KEY (album_id)
        REFERENCES albuns (album_id),
    FOREIGN KEY (artista_id)
        REFERENCES artistas (artista_id)
)  ENGINE=INNODB;

CREATE TABLE historico_de_reproducao (
    pessoa_usuaria_id INT NOT NULL,
    cancao_id INT NOT NULL,
    data_reproducao DATETIME NOT NULL,
    PRIMARY KEY (cancao_id , pessoa_usuaria_id),
    FOREIGN KEY (pessoa_usuaria_id)
        REFERENCES pessoas_usuarias (pessoa_usuaria_id),
    FOREIGN KEY (cancao_id)
        REFERENCES cancoes (cancao_id)
)  ENGINE=INNODB;

INSERT INTO planos VALUES
(1, 'gratuito', 0),
(2, 'universitário', 5.99),
(3, 'pessoal', 6.99),
(4, 'familiar', 7.99);

INSERT INTO pessoas_usuarias VALUES
(1, 'Barbara Liskov', 82, 1, '2019-10-20'),
(2, 'Robert Cecil Martin', 58, 1, '2017-01-06'),
(3, 'Ada Lovelace', 37, 4, '2017-12-30'),
(4, 'Martin Fowler', 46, 4, '2017-01-17'),
(5, 'Sandi Metz', 58, 4, '2018-04-29'),
(6, 'Paulo Freire', 19, 2, '2018-02-14'),
(7, 'Bell Hooks', 26, 2, '2018-01-05'),
(8, 'Christopher Alexander', 85, 3, '2019-06-05'),
(9, 'Judith Butler', 45, 3, '2020-05-13'),
(10, 'Jorge Amado', 58, 3, '2017-02-17');


INSERT INTO artistas VALUES
(1, 'Beyoncé'),
(2, 'Queen'),
(3, 'Elis Regina'),
(4, 'Baco Exu do Blues'),
(5, 'Blind Guardian'),
(6, 'Nina Simone');

INSERT INTO albuns VALUES
(1, 'Renaissance', 1, 2022),
(2, 'Jazz', 2, 1978),
(3, 'Hot Space', 2, 1982),
(4, 'Falso Brilhante', 3, 1998),
(5, 'Vento de Maio', 3, 2001),
(6, 'QVVJFA?', 4, 2003),
(7, 'Somewhere Far Beyond', 5, 2007),
(8, 'I Put A Spell On You', 6, 2012);

INSERT INTO seguindo_artistas VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(4, 4),
(5, 5),
(5, 6),
(6, 1),
(6, 6),
(7, 6),
(9, 3),
(10, 2);

INSERT INTO cancoes VALUES 
(1, 'BREAK MY SOUL', 1, 1, 279),
(2, "VIRGO'S GROOVE", 1, 1, 369),
(3, 'ALIEN SUPERSTAR', 1, 1, 116),
(4, "Don't Stop Me Now", 2, 2, 203),
(5, "Under Pressure", 3, 2, 152),
(6, "Como Nossos Pais", 4, 3, 105),
(7, "O Medo de Amar é o Medo de Ser Livre", 5, 3, 207),
(8, "Samba em Paris", 6, 4, 267),
(9, "The Bard's Song", 7, 5, 244),
(10, "Feeling Good", 8, 6, 100);

INSERT INTO historico_de_reproducao VALUES
(1, 8, '2022-02-28 10:45:55'),
(1, 2, '2020-05-02 05:30:35'),
(1, 10, '2020-03-06 11:22:33'),
(2, 10, '2022-08-05 08:05:17'),
(2, 7, '2020-01-02 07:40:33'),
(3, 10, '2020-11-13 16:55:13'),
(3, 2, '2020-12-05 18:38:30'),
(4, 8, '2021-08-15 17:10:10'),
(5, 8, '2022-01-09 01:44:33'),
(5, 5, '2020-08-06 15:23:43'),
(6, 7, '2017-01-24 00:31:17'),
(6, 1, '2017-10-12 12:35:20'),
(7, 4, '2011-12-15 22:30:49'),
(8, 4, '2012-03-17 14:56:41'),
(9, 9, '2022-02-24 21:14:22'),
(10, 3, '2015-12-13 08:30:22');
