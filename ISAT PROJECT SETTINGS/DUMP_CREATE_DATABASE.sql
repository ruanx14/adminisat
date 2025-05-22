CREATE SCHEMA IF NOT EXISTS `isatadmin` DEFAULT CHARACTER SET utf8;
USE `isatadmin`;


CREATE TABLE IF NOT EXISTS `JobPosition` (
  idJobPosition INT NOT NULL AUTO_INCREMENT,
  namePosition VARCHAR(45),
  PRIMARY KEY (idJobPosition)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `Project` (
  idProject INT NOT NULL AUTO_INCREMENT,
  nameProject VARCHAR(100),
  timeProject VARCHAR(50),
  PRIMARY KEY (idProject)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `Worker` (
  idWorker INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(95),
  cpf VARCHAR(14),
  password VARCHAR(95),
  Project_idProject INT,
  JobPosition_idJobPosition INT,
  PRIMARY KEY (idWorker),
  FOREIGN KEY (Project_idProject) REFERENCES Project(idProject),
  FOREIGN KEY (JobPosition_idJobPosition) REFERENCES JobPosition(idJobPosition)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `User` (
  idUser INT NOT NULL AUTO_INCREMENT,
  signedUp VARCHAR(45),
  dateSigned VARCHAR(45),
  name VARCHAR(45),
  gender VARCHAR(45),
  bornDate VARCHAR(45),
  age VARCHAR(45),
  race VARCHAR(45),
  nationality VARCHAR(45),
  rg VARCHAR(45),
  cpf VARCHAR(45),
  education VARCHAR(45),
  tel VARCHAR(45),
  profession VARCHAR(45),
  civilStatus VARCHAR(45),
  religion VARCHAR(45),
  nispis VARCHAR(45),
  suscard VARCHAR(45),
  situation VARCHAR(45),
  Worker_idWorker INT NOT NULL,
  PRIMARY KEY (idUser),
  FOREIGN KEY (Worker_idWorker) REFERENCES Worker(idWorker)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `Address` (
  idAddress INT NOT NULL AUTO_INCREMENT,
  district VARCHAR(45),
  street VARCHAR(45),
  zone VARCHAR(45),
  User_idUser INT NOT NULL,
  PRIMARY KEY (idAddress),
  FOREIGN KEY (User_idUser) REFERENCES User(idUser)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `Affiliation` (
  idAffiliation INT NOT NULL AUTO_INCREMENT,
  degreeAfl VARCHAR(45),
  nameAfl VARCHAR(45),
  rgAfl VARCHAR(45),
  cpfAfl VARCHAR(45),
  bornDateAfl VARCHAR(45),
  educationAfl VARCHAR(45),
  telAfl VARCHAR(45),
  professionAfl VARCHAR(45),
  PRIMARY KEY (idAffiliation)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `Health` (
  idHealth INT NOT NULL AUTO_INCREMENT,
  suspect VARCHAR(45),
  hospital VARCHAR(45),
  doctor VARCHAR(45),
  startDateTreatment VARCHAR(45),
  intervalDoctor VARCHAR(45),
  returnDateTreatment VARCHAR(45),
  lastConsult VARCHAR(45),
  medicines VARCHAR(45),
  monitoringPsycho VARCHAR(45),
  User_idUser INT NOT NULL,
  PRIMARY KEY (idHealth),
  FOREIGN KEY (User_idUser) REFERENCES User(idUser)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `Family` (
  idFamily INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45),
  bornDate VARCHAR(45),
  degreeFamily VARCHAR(45),
  profession VARCHAR(45),
  rent VARCHAR(45),
  PRIMARY KEY (idFamily)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `Housing` (
  idHousing INT NOT NULL AUTO_INCREMENT,
  situation VARCHAR(45),
  land VARCHAR(45),
  rooms VARCHAR(45),
  hygiene VARCHAR(45),
  construction VARCHAR(45),
  roof VARCHAR(45),
  floor VARCHAR(45),
  energy VARCHAR(45),
  water VARCHAR(45),
  trash VARCHAR(45),
  sewage VARCHAR(45),
  paving VARCHAR(45),
  publiclight VARCHAR(45),
  User_idUser INT NOT NULL,
  PRIMARY KEY (idHousing),
  FOREIGN KEY (User_idUser) REFERENCES User(idUser)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `Expense` (
  idExpense INT NOT NULL AUTO_INCREMENT,
  expense VARCHAR(45),
  howMuch VARCHAR(45),
  PRIMARY KEY (idExpense)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `Benefit` (
  idBenefit INT NOT NULL AUTO_INCREMENT,
  benefit VARCHAR(45),
  aproved VARCHAR(45),
  PRIMARY KEY (idBenefit)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `Vulnerability` (
  idVulnerability INT NOT NULL AUTO_INCREMENT,
  accessForm VARCHAR(45),
  situation VARCHAR(45),
  secrecy VARCHAR(45),
  User_idUser INT NOT NULL,
  PRIMARY KEY (idVulnerability),
  FOREIGN KEY (User_idUser) REFERENCES User(idUser)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `Service` (
  idService INT NOT NULL AUTO_INCREMENT,
  type VARCHAR(45),
  date VARCHAR(45),
  description VARCHAR(45),
  User_idUser INT NOT NULL,
  PRIMARY KEY (idService),
  FOREIGN KEY (User_idUser) REFERENCES User(idUser)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `UserHasExpense` (
  User_idUser INT NOT NULL,
  Expense_idExpense INT NOT NULL,
  PRIMARY KEY (User_idUser, Expense_idExpense),
  FOREIGN KEY (User_idUser) REFERENCES User(idUser),
  FOREIGN KEY (Expense_idExpense) REFERENCES Expense(idExpense)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `UserHasFamily` (
  User_idUser INT NOT NULL,
  Family_idFamily INT NOT NULL,
  PRIMARY KEY (User_idUser, Family_idFamily),
  FOREIGN KEY (User_idUser) REFERENCES User(idUser),
  FOREIGN KEY (Family_idFamily) REFERENCES Family(idFamily)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `UserHasBenefit` (
  User_idUser INT NOT NULL,
  Benefit_idBenefit INT NOT NULL,
  PRIMARY KEY (User_idUser, Benefit_idBenefit),
  FOREIGN KEY (User_idUser) REFERENCES User(idUser),
  FOREIGN KEY (Benefit_idBenefit) REFERENCES Benefit(idBenefit)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `UserHasAffiliation` (
  User_idUser INT NOT NULL,
  Affiliation_idAffiliation INT NOT NULL,
  PRIMARY KEY (User_idUser, Affiliation_idAffiliation),
  FOREIGN KEY (User_idUser) REFERENCES User(idUser),
  FOREIGN KEY (Affiliation_idAffiliation) REFERENCES Affiliation(idAffiliation)
) ENGINE=InnoDB;

INSERT INTO JobPosition (namePosition) VALUES
('Desenvolvedor'),
('Diretora'),
('Assistente Social'),
('Psicóloga'),
('Coordenador'),
('Estagiário');

INSERT INTO Project (nameProject, timeProject) VALUES
('Projeto Dev', '6 meses'),
('Projeto Admin', 'X anos'),
('Projeto Beta', '1 ano'),
('Projeto Alfa', '2 anos'),
('Projeto Gama', '3 meses');

INSERT INTO Worker (name, cpf, password, Project_idProject, JobPosition_idJobPosition) VALUES
('Dev', '032.912.702-07', '$2y$10$rITSqxBS0YgWNHMf5bPaZuHPlnfuS3e9vumDCC48K36cSuLVHQzS6', 1, 1),
('Admin', '123.123.123-00', '$2y$10$JmDEDkY0AeEU5bfRk1X6nexd3WW3azSB6wFw/.Pr1zegb91YUG9om', 2, 2),
('Marcia Fernandes', '123.456.789-00', 'senha123', 3, 3),
('Eliete Jessica', '123.456.789-00', 'senha123', 4, 3),
('Katiana Ferreira Souza', '123.456.789-00', 'senha123', 4, 4),
('Monica Silva', '987.654.321-00', 'senha456', 3, 4);

INSERT INTO Worker (name, cpf, password, Project_idProject, JobPosition_idJobPosition) VALUES
('Carlos Eduardo', '111.222.333-44', 'senha123', 5, 5), 
('Fernanda Souza', '555.666.777-88', 'senha123', 3, 6), 
('Lucas Pereira', '999.888.777-66', 'senha123', 2, 4),  
('Ana Beatriz', '444.333.222-11', 'senha123', 3, 4);    
