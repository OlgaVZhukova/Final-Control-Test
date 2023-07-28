
-- Задание 7.
-- Создать базу данных “Друзья человека”
DROP DATABASE IF EXISTS human_friends;
CREATE DATABASE human_friends;

-- Задание 8.
-- Создать таблицы с иерархией из диаграммы в БД
USE human_friends;

-- создание таблицы "животные"
DROP TABLE IF EXISTS animals;
CREATE TABLE animals (
	id INT AUTO_INCREMENT PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    type VARCHAR(50)
);

INSERT INTO animals (type)
VALUES ('Домашние животные'), ('Вьючные животные');

-- создание таблицы "домашние животные"
DROP TABLE IF EXISTS pets;
CREATE TABLE pets (
	id INT AUTO_INCREMENT PRIMARY KEY,
	species VARCHAR(50),
	type_id INT DEFAULT 1,
    FOREIGN KEY (type_id) REFERENCES animals (id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO pets (species)
VALUES ('Собаки'), ('Кошки'), ('Хомяки');

-- создание таблицы "вьючные животные"
DROP TABLE IF EXISTS pack_animals;
CREATE TABLE pack_animals (
	id INT AUTO_INCREMENT PRIMARY KEY,
	species VARCHAR(50),
	type_id INT DEFAULT 2,
    FOREIGN KEY (type_id) REFERENCES animals(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO pack_animals (species)
VALUES ('Лошади'), ('Верблюды'), ('Ослы');

-- создание таблицы "собаки"
DROP TABLE IF EXISTS dogs;
CREATE TABLE dogs 
(       
    id INT AUTO_INCREMENT PRIMARY KEY, 
    nickname VARCHAR(50), 
    commands VARCHAR(1000),
    birthday DATE,
    species_id INT DEFAULT 1,
    FOREIGN KEY (species_id) REFERENCES pets (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- создание таблицы "кошки"
DROP TABLE IF EXISTS cats;
CREATE TABLE cats 
(       
    id INT AUTO_INCREMENT PRIMARY KEY, 
    nickname VARCHAR(50), 
    commands VARCHAR(1000),
    birthday DATE,
    species_id INT DEFAULT 2,
    FOREIGN KEY (species_id) REFERENCES pets (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- создание таблицы "хомяки"
DROP TABLE IF EXISTS hamsters;
CREATE TABLE hamsters 
(       
    id INT AUTO_INCREMENT PRIMARY KEY, 
    nickname VARCHAR(50), 
    commands VARCHAR(1000),
    birthday DATE,
    species_id INT DEFAULT 3,
    FOREIGN KEY (species_id) REFERENCES pets (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- создание таблицы "лошади"
DROP TABLE IF EXISTS horses;
CREATE TABLE horses 
(       
    id INT AUTO_INCREMENT PRIMARY KEY, 
    nickname VARCHAR(50), 
    commands VARCHAR(1000),
    birthday DATE,
    species_id INT DEFAULT 1,
    FOREIGN KEY (species_id) REFERENCES pack_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- создание таблицы "верблюды"
DROP TABLE IF EXISTS camels;
CREATE TABLE camels 
(       
    id INT AUTO_INCREMENT PRIMARY KEY, 
    nickname VARCHAR(50), 
    commands VARCHAR(1000),
    birthday DATE,
    species_id INT DEFAULT 2,
    FOREIGN KEY (species_id) REFERENCES pack_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- создание таблицы "ослы"
DROP TABLE IF EXISTS donkeys;
CREATE TABLE donkeys 
(       
    id INT AUTO_INCREMENT PRIMARY KEY, 
    nickname VARCHAR(50), 
    commands VARCHAR(1000),
    birthday DATE,
    species_id INT DEFAULT 3,
    FOREIGN KEY (species_id) REFERENCES pack_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Задание 9.
-- Заполнить низкоуровневые таблицы именами (животных), командами которые они выполняют и датами рождения

-- наполнение данными таблицы "собаки"
INSERT INTO dogs (nickname, commands, birthday)
VALUES
('Граф', 'апорт, рядом, дай лапу, сидеть, лежать', '2022-12-10'),
('Вольт', 'фу, фас, апорт, лежать, кувырок', '2020-05-08'),
('Шарик', 'дай лапу, зайка, фас', '2023-01-18'),
('Тайсон', 'брось, гулять, ко мне, фас', '2019-10-06'),
('Вий', 'охранять, змейка, голос, нельзя', '2022-09-30');

-- наполнение данными таблицы "кошки"
INSERT INTO cats (nickname, commands, birthday)
VALUES
('Веста', 'апорт, дай лапу, сидеть, лежать', '2021-10-02'),
('Куки', 'стоять, фас, сидеть, лежать', '2020-09-30'),
('Смоки', 'дай лапу, ищи, фас', '2018-03-06'),
('Спок', 'прыжок, гулять, домой', '2021-11-01'),
('Жасмин', 'принеси, жди, нельзя', '2019-06-22');

-- наполнение данными таблицы "хомяки"
INSERT INTO hamsters (nickname, commands, birthday)
VALUES
('Веста', 'стоять, нельзя', '2023-02-05'),
('Куки', 'стоять, прыжок', '2021-11-18'),
('Смоки', 'стоять, прыжок', '2023-03-28'),
('Спок', 'круг', '2021-12-31'),
('Жасмин', 'прыжок, круг, нельзя', '2022-12-01');

-- наполнение данными таблицы "лошади"
INSERT INTO horses (nickname, commands, birthday)
VALUES
('Буран', 'вперед, рысь', '2015-09-06'),
('Гамлет', 'стой, вперед', '2020-08-10'),
('Ночка', 'стой, галоп, рысь, шагом', '2019-05-25'),
('Зевс', 'стой, тише, галоп', '2017-12-01'),
('Гамлет', 'галоп, хоп, шагом', '2016-07-19');

-- наполнение данными таблицы "camels"
INSERT INTO camels (nickname, commands, birthday)
VALUES
('Янко', 'гит, дурр', '2021-07-16'),
('Чупа-чупс', 'каш, дурр', '2019-05-21'),
('Эмо', 'гит, каш', '2018-02-19'),
('Хлоя', 'хап-хап', '2020-10-09'),
('Луша', 'дурр, цок-цок', '2015-12-06');

-- наполнение данными таблицы "ослы"
INSERT INTO donkeys (nickname, commands, birthday)
VALUES
('Бони', 'стой', '2015-09-10'),
('Луна', 'вперед, стой', '2017-04-01'),
('Техас', 'стой', '2019-02-28'),
('Дамбо', 'вперед', '2021-01-14'),
('Флэш', 'вперед, стой', '2018-04-26');


-- проверки
SHOW tables FROM human_friends;
SELECT id, type FROM animals;
SELECT id, species, type_id FROM pets;
SELECT id, species, type_id FROM pack_animals;
SELECT id, nickname, commands, birthday, species_id FROM dogs;
SELECT id, nickname, commands, birthday, species_id FROM cats;
SELECT id, nickname, commands, birthday, species_id FROM hamsters;
SELECT id, nickname, commands, birthday, species_id FROM horses;
SELECT id, nickname, commands, birthday, species_id FROM camels;
SELECT id, nickname, commands, birthday, species_id FROM donkeys;


-- Задание 10.
-- Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой
-- питомник на зимовку, объединить таблицы лошади и ослы в одну таблицу
DELETE FROM camels;

DROP TABLE IF EXISTS horses_and_donkeys;
CREATE TABLE horses_and_donkeys
SELECT id, nickname, commands, birthday, species_id FROM horses
UNION
SELECT id, nickname, commands, birthday, species_id FROM donkeys;

-- проверка
SELECT id, nickname, commands, birthday, species_id FROM horses_and_donkeys;


-- Задание 11.
-- Создать новую таблицу “молодые животные” в которую попадут все
-- животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью
-- до месяца подсчитать возраст животных в новой таблице

CREATE TEMPORARY TABLE all_animals
SELECT id, nickname, commands, birthday, species_id FROM dogs
UNION SELECT id, nickname, commands, birthday, species_id FROM cats
UNION SELECT id, nickname, commands, birthday, species_id FROM hamsters
UNION SELECT id, nickname, commands, birthday, species_id FROM horses
UNION SELECT id, nickname, commands, birthday, species_id FROM camels
UNION SELECT id, nickname, commands, birthday, species_id FROM donkeys;

CREATE TABLE young_animals
SELECT nickname, commands, birthday, species_id, TIMESTAMPDIFF(MONTH, birthday, CURDATE()) AS age_in_month
FROM all_animals
WHERE birthday BETWEEN ADDDATE(CURDATE(), INTERVAL -3 YEAR) AND ADDDATE(CURDATE(), INTERVAL -1 YEAR);

-- вывод выборки
SELECT nickname, birthday, age_in_month FROM young_animals;


-- Задание 12.
-- Объединить все таблицы в одну, при этом сохраняя поля, указывающие на прошлую принадлежность к старым таблицам.
SELECT dogs.nickname, dogs.commands, dogs.birthday, pets.species, animals.type
FROM dogs
LEFT JOIN pets ON pets.id = dogs.species_id
LEFT JOIN animals ON animals.id=pets.type_id
UNION
SELECT cats.nickname, cats.commands, cats.birthday, pets.species, animals.type
FROM cats
LEFT JOIN pets ON pets.id = cats.species_id
LEFT JOIN animals ON animals.id=pets.type_id
UNION
SELECT hamsters.nickname, hamsters.commands, hamsters.birthday, pets.species, animals.type
FROM hamsters
LEFT JOIN pets ON pets.id = hamsters.species_id
LEFT JOIN animals ON animals.id=pets.type_id
UNION
SELECT horses.nickname, horses.commands, horses.birthday, pack_animals.species, animals.type
FROM horses
LEFT JOIN pack_animals ON pack_animals.id = horses.species_id
LEFT JOIN animals ON animals.id=pack_animals.type_id
UNION
SELECT camels.nickname, camels.commands, camels.birthday, pack_animals.species, animals.type
FROM camels
LEFT JOIN pack_animals ON pack_animals.id = camels.species_id
LEFT JOIN animals ON animals.id=pack_animals.type_id
UNION
SELECT donkeys.nickname, donkeys.commands, donkeys.birthday, pack_animals.species, animals.type
FROM donkeys
LEFT JOIN pack_animals ON pack_animals.id = donkeys.species_id
LEFT JOIN animals ON animals.id=pack_animals.type_id;







