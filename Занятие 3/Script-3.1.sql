create table if not exists employees (
	id serial,
	name varchar(255) not null,
	department varchar(255),
	chief integer,
	constraint employees_pk primary key (id, department),
	foreign key (chief, department) references employees(id, department)
);
