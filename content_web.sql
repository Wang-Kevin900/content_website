CREATE TABLE IF NOT EXISTS Subscribtion(
	IDsubscription			int(4)		 		    primary key	auto_increment	,
	cost					int(4)					not null		   			,
	type_plan				varchar(20)				not null		   			,
	number_devices_allowed	int(4)					not null		   
);

CREATE TABLE IF NOT EXISTS Application_user(
	IDapplication_user		int(4)					primary key	auto_increment			   ,
	name					varchar(20)				not null							   ,
	last_name				varchar(20)													   ,
	city_residence			varchar(20)													   ,
	subscribed				bit						not null							   ,
	date_of_payment			date														   ,
	IDsubscription			int(4)					references Subscribtion(IDsubscription)
);

CREATE TABLE IF NOT EXISTS Device(
	IDevice     			int(4) 					primary key	auto_increment	     ,
	mac_address				varchar(15)				not null		  				 ,
	type_of_device			varchar(10)				not null		  				 ,
	model					varchar(15)				not null		   
);

CREATE TABLE IF NOT EXISTS Credit_card(
	IDcard					int(4) 					primary key	auto_increment		  				 ,
	credit_number			int														  				 ,
	cv						int														  				 ,
	expire_date				date													   				 ,
	IDapplication_user		int(4)					references Application_user(IDapplication_user)
);

CREATE TABLE IF NOT EXISTS Content(
	IDContent     			int(4) 					primary key	auto_increment			,
	title				    char(5)					not null							,
	year_of_creation		int						not null							,
	duration				int						not null							,
	insert_date				date														,
	remove_date				date														,
	season					int						not null							,
	number_of_episodes		int 					not null					
);

CREATE TABLE IF NOT EXISTS Category(
	IDcategory     			int(4) 					primary key auto_increment				,
	type_of_category		varchar(20)				not null				
);

CREATE TABLE IF NOT EXISTS Actor(
	IDactor     			int(4) 					primary key	auto_increment		,
	name					varchar(20)				not null						,
	last_name				varchar(20)				not null						,
	birth					date								
);

CREATE TABLE IF NOT EXISTS Episode(
	IDepisode     			int(4) 					primary key	auto_increment			,
	current_minute     		int															,
	lenght					int						not null							,
	episode_number			int						not null							,
	IDcontent				int(4)					references Content(IDcontent)
);

CREATE TABLE IF NOT EXISTS Device_usage(
	IDevice		     		int(4)				references Device(IDevice)						,
	IDApplication_user     	int(4)				references Application_user(IDApplication_user)	,
	time_spent				int																	,
	primary key(IDevice, IDApplication_user)												
);

CREATE TABLE IF NOT EXISTS View_content(
	IDapplication_user     			int(4)			references Application_user(IDapplication_user)		,
	IDcontent				     	int(4)			references Content(IDcontent)						,
	number_minutes_spent			int																	,
	visualized						bit				not null											,
	primary key(IDcontent, IDApplication_user)				
);

CREATE TABLE IF NOT EXISTS List(
	IDcategory     			int(4) 					references Category(IDcategory)			,
	IDcontent				int(4)					references Content(IDcontent)			,
	primary key(IDcategory, IDcontent)
);

CREATE TABLE IF NOT EXISTS Act(
	IDactor     			int(4) 					references Actor(IDactor)			,
	IDcontent     			int(4)					references Content(IDcontent)		,
	role					varchar(20)				not null							,
	primary key(IDactor, IDcontent)
);
