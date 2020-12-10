CREATE TABLE IF NOT EXISTS Subscribtion(
	IDsubscription			int(4)		 		    primary key	auto_increment	,
	cost					int(4)					not null		   			,
	type_plan				varchar(20)				not null		   			,
	number_devices_allowed	int(4)					not null		   
);

INSERT INTO `subscribtion` (`IDsubscription`, `cost`, `type_plan`, `number_devices_allowed`) VALUES (NULL, '5', 'Base', '1'), (NULL, '12', 'Family', '4');

CREATE TABLE IF NOT EXISTS Application_user(
	IDapplication_user		int(4)					primary key	auto_increment			   ,
	name					varchar(20)				not null							   ,
	last_name				varchar(20)													   ,
	city_residence			varchar(20)													   ,
	subscribed				bit						not null							   ,
	date_of_payment			date														   ,
	IDsubscription			int(4)					references Subscribtion(IDsubscription)
);

INSERT INTO `application_user` (`IDapplication_user`, `name`, `last_name`, `city_residence`, `subscribed`, `date_of_payment`, `IDsubscription`) VALUES (NULL, 'Kevin', 'Wang', 'Pavia', b'0', NULL, NULL), (NULL, 'Andrea', 'Perna', 'Pavia', b'1', '2020-12-17', '1');

CREATE TABLE IF NOT EXISTS Device(
	IDdevice     			int(4) 					primary key	auto_increment	     ,
	mac_address				varchar(20)				not null		  				 ,
	type_of_device			varchar(20)				not null		  				 ,
	model					varchar(20)				not null		   
);

INSERT INTO `device` (`IDDevice`, `mac_address`, `type_of_device`, `model`) VALUES (NULL, '00:A0:C9:14:C8:29', 'Mac', 'MacBook Pro 2020'), (NULL, '00:0a:95:9d:68:16', 'Samsung', 'Samsung Galaxy S9');

CREATE TABLE IF NOT EXISTS Credit_card(
	IDcard					int(4) 					primary key	auto_increment		  				 		     ,
	credit_number			int						not null								  					 ,
	cv						int(5)					not null								  					 ,
	expire_date				date					not null								   					 ,
	IDapplication_user		int(4)					not null references Application_user(IDapplication_user)
);

INSERT INTO `credit_card` (`IDcard`, `credit_number`, `cv`, `expire_date`, `IDapplication_user`) VALUES (NULL, '123456789', '32', '2023-03-16', '1'), (NULL, '012345678', '12', '2022-05-17', '2');

CREATE TABLE IF NOT EXISTS Content(
	IDContent     			int(4) 					primary key	auto_increment			,
	title				    varchar(20)				not null							,
	year_of_creation		int(5)					not null							,
	total_duration			int(7)					not null							,
	insert_date				date														,
	remove_date				date														,
	season					int						not null							,
	number_of_episodes		int 					not null					
);

INSERT INTO `content` (`IDContent`, `title`, `year_of_creation`, `total_duration`, `insert_date`, `remove_date`, `season`, `number_of_episodes`) VALUES (NULL, 'Harry Potter', '2008', '120', NULL, NULL, '1', '1'), (NULL, 'Interstellar', '2015', '115', NULL, NULL, '1', '1');

CREATE TABLE IF NOT EXISTS Category(
	IDcategory     			int(4) 					primary key auto_increment				,
	type_of_category		varchar(20)				not null				
);

INSERT INTO `category` (`IDcategory`, `type_of_category`) VALUES (NULL, 'Horror'), (NULL, 'Sci-fi');

CREATE TABLE IF NOT EXISTS Actor(
	IDactor     			int(4) 					primary key	auto_increment		,
	name					varchar(20)				not null						,
	last_name				varchar(20)				not null						,
	birth					date								
);

INSERT INTO `actor` (`IDactor`, `name`, `last_name`, `birth`) VALUES (NULL, 'Matthew ', 'McConaughey', NULL), (NULL, 'Emma', 'Watson', NULL);

CREATE TABLE IF NOT EXISTS Episode(
	IDepisode     			int(4) 					primary key	auto_increment			,
	current_minute     		int															,
	lenght					int						not null							,
	episode_number			int						not null							,
	IDcontent				int(4)					references Content(IDcontent)
);

INSERT INTO `episode` (`IDepisode`, `current_minute`, `lenght`, `episode_number`, `IDcontent`) VALUES (NULL, NULL, '24', '1', '1'), (NULL, NULL, '25', '1', '2');

CREATE TABLE IF NOT EXISTS Device_usage(
	IDdevice		     		int(4)				references Device(IDdevice)						,
	IDApplication_user     	int(4)				references Application_user(IDApplication_user)	,
	time_spent				int																	,
	primary key(IDdevice, IDApplication_user)												
);

INSERT INTO `device_usage` (`IDdevice`, `IDApplication_user`, `time_spent`) VALUES ('1', '2', NULL), ('2', '2', NULL);

CREATE TABLE IF NOT EXISTS View_content(
	IDapplication_user     			int(4)			references Application_user(IDapplication_user)		,
	IDcontent				     	int(4)			references Content(IDcontent)						,
	number_minutes_spent			int																	,
	visualized						bit				not null											,
	primary key(IDcontent, IDApplication_user)				
);

INSERT INTO `view_content` (`IDapplication_user`, `IDcontent`, `number_minutes_spent`, `visualized`) VALUES ('1', '1', NULL, b'0'), ('1', '2', NULL, b'0');

CREATE TABLE IF NOT EXISTS List(
	IDcategory     			int(4) 					references Category(IDcategory)			,
	IDcontent				int(4)					references Content(IDcontent)			,
	primary key(IDcategory, IDcontent)
);

INSERT INTO `list` (`IDcategory`, `IDcontent`) VALUES ('2', '1'), ('2', '2');

CREATE TABLE IF NOT EXISTS Act(
	IDactor     			int(4) 					references Actor(IDactor)			,
	IDcontent     			int(4)					references Content(IDcontent)		,
	role					varchar(40)				not null							,
	primary key(IDactor, IDcontent)
);

INSERT INTO `act` (`IDactor`, `IDcontent`, `role`) VALUES ('1', '2', 'Personaggio Principale'), ('2', '1', 'Personaggio Principale');