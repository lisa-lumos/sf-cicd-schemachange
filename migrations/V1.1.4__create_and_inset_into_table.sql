create table if not exists demo_db.lisa_test.student_info (
	student_id int primary key,
	student_name varchar(100)
);


insert into demo_db.lisa_test.student_info values 
	(1, 'name1'),
	(2, 'name2'),
	(3, 'name3');
	