CREATE TABLE IF NOT EXISTS Subscribtion(
	IDsubscription			char(5)			primary key		   ,
	cost					int(4)			not null		   ,
	type_plan				varchar(20)		not null		   ,
	number_devices_allowed	int(4)			not null		   ,
)

CREATE TABLE IF NOT EXISTS User(
	IDuser					char(5)			primary key							   ,
	name					varchar(20)		not null							   ,
	last_name				varchar(20)											   ,
	city_residence			varchar(20)											   ,
	subscribed				bit				not null							   ,
	date_of_payment			date												   ,
	IDsubscribtion			char(5)			references Subscribtion(IDsubscribtion),
)

CREATE TABLE IF NOT EXISTS Credit_card(
	IDcard					char(5)			primary key			   ,
	credit_number			int									   ,
	cv						int									   ,
	expire_date				date								   ,
	IDuser					char(5)			references User(IDuser),
)