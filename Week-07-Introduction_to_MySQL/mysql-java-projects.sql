DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material ;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
project_id INT AUTO_INCREMENT NOT NULL,
  project_name VARCHAR(128) NOT NULL,
  estimated_hours DECIMAL(7,2),
  actual_hours DECIMAL(7,2),
  difficulty INT,
  notes TEXT,
  PRIMARY KEY (project_id)
);

CREATE TABLE material (
material_id INT auto_increment NOT NULL,
project_id INT,
material_name VARCHAR(128) NOT NULL,
num_required INT,
cost decimal(7,2),
PRIMARY KEY (material_id),
foreign key (project_id) references project (project_id) ON DELETE CASCADE
);

CREATE TABLE step (
step_id INT auto_increment NOT NULL,
project_id INT,
step_text TEXT,
step_order INT,
PRIMARY KEY (step_id),
foreign key (project_id) references project (project_id) ON DELETE CASCADE
);

CREATE TABLE category (
category_id INT auto_increment NOT NULL,
category_name varchar(128),
PRIMARY KEY (category_id)
);

CREATE TABLE project_category (
project_id int NOT NULL,
category_id int NOT NULL,
 FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
  FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
UNIQUE KEY (project_id, category_id)
);
