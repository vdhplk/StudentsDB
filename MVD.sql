CREATE TABLE должности
(
  код_должности INT NOT NULL,
  наименование_должности VARCHAR NOT NULL,
  оклад INT NOT NULL,
  обязанности VARCHAR NOT NULL,
  требования VARCHAR NOT NULL,
  PRIMARY KEY (код_должности)
);

CREATE TABLE звания
(
  код_звания INT NOT NULL,
  наименование VARCHAR NOT NULL,
  надбавка INT NOT NULL,
  обязанности VARCHAR NOT NULL,
  требования VARCHAR NOT NULL,
  PRIMARY KEY (код_звания)
);

CREATE TABLE виды_преступлений
(
  код_вида_преступления INT NOT NULL,
  наименование VARCHAR NOT NULL,
  статья VARCHAR NOT NULL,
  наказание VARCHAR NOT NULL,
  срок INT NOT NULL,
  PRIMARY KEY (код_вида_преступления)
);

CREATE TABLE пострадавшие
(
  код_пострадавшего INT NOT NULL,
  фио VARCHAR NOT NULL,
  дата_рождения DATE NOT NULL,
  пол VARCHAR NOT NULL,
  адрес VARCHAR NOT NULL,
  PRIMARY KEY (код_пострадавшего)
);

CREATE TABLE сотрудники
(
  код_сотрудника INT NOT NULL,
  ФИО VARCHAR NOT NULL,
  Возраст INT NOT NULL,
  Пол VARCHAR NOT NULL,
  адрес VARCHAR NOT NULL,
  телефон INT NOT NULL,
  паспортные_данные VARCHAR NOT NULL,
  код_звания INT NOT NULL,
  код_должности INT NOT NULL,
  PRIMARY KEY (код_сотрудника),
  FOREIGN KEY (код_звания) REFERENCES звания(код_звания),
  FOREIGN KEY (код_должности) REFERENCES должности(код_должности)
);

CREATE TABLE преступники
(
  номер_дела INT NOT NULL,
  фио VARCHAR NOT NULL,
  дата_рождения DATE NOT NULL,
  пол VARCHAR NOT NULL,
  адрес VARCHAR NOT NULL,
  код_преступника INT NOT NULL,
  состояние VARCHAR NOT NULL,
  код_вида_преступления INT NOT NULL,
  код_сотрудника INT NOT NULL,
  код_пострадавшего INT NOT NULL,
  PRIMARY KEY (код_преступника),
  FOREIGN KEY (код_вида_преступления) REFERENCES виды_преступлений(код_вида_преступления),
  FOREIGN KEY (код_сотрудника) REFERENCES сотрудники(код_сотрудника),
  FOREIGN KEY (код_пострадавшего) REFERENCES пострадавшие(код_пострадавшего)
);