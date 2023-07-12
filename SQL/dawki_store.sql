drop database if exists dawki;

create database dawki;
use dawki;

drop table if exists customers;
drop table if exists Admins;
drop table if exists orders;
drop table if exists delivery_agent;
drop table if exists delivery_system;
drop table if exists product;
drop table if exists cart; 
drop table if exists wallet;
drop table if exists price_change;


CREATE TABLE price_change (
  product_id INT primary key,
  old_price INT NOT NULL,
  new_price INT NOT NULL
);

create table customers(
	customer_id int primary key,
    username varchar(50) NOT NULL,
	delivery_address varchar(50) NOT NULL,
    pass varchar(50) NOT NULL,
    membership_status varchar(5) NOT NULL default 'BASIC',
    email_id varchar(50) UNIQUE,
	mobile_number varchar(50) UNIQUE
    );



create table delivery_agent(
	agent_id int primary key,
    customer_id int,
    order_id int,
	rating float NOT NULL CHECK (0 < rating < 10) ,
    mobile_number varchar(50) UNIQUE,
    fname varchar(50) NOT NULL,
    mname varchar(50),
    lname varchar(50) NOT NULL
    );
    
create table Admins(
	admin_id int primary key,
    order_id int,
    product_id INT,
    username varchar(50) NOT NULL,
    pass varchar(50) NOT NULL
    );
    

CREATE TABLE orders (order_id INT PRIMARY KEY, 
					product_id INT,
					order_total INT NOT NULL CHECK (Order_total<=500000),
                    mode_of_payment VARCHAR(100) DEFAULT 'Wallet',
                    no_of_days_to_deliver INT NOT NULL
                    );
                    



CREATE TABLE product(product_id INT PRIMARY KEY,
					 product_name VARCHAR(50) NOT NULL,
                     product_price INT NOT NULL CHECK (product_price > 0 AND product_price <= 200000),
                     product_stock INT NOT NULL CHECK (product_stock > 0),
                     product_rating FLOAT CHECK(product_rating > 0 AND product_rating < 5.1)
                     );
                     
                     
CREATE TABLE cart(	 product_id INT,
					 customer_id INT,
					 product_quantity INT CHECK (product_quantity >= 0) DEFAULT 0,
                     cart_total INT DEFAULT 0,
                     coupon FLOAT CHECK (coupon <= 11)
                     );
                     
CREATE TABLE wallet ( 	customer_id INT,
						transaction_amount INT NOT NULL,
						balance INT CHECK (balance >= 0) DEFAULT 0 
                        );
                     
                     
CREATE TABLE delivery_system( order_id INT UNIQUE,
							  agent_id INT,
                              admin_id INT
                              );
                              

-- Foreign Key Constraints

ALTER TABLE delivery_agent
ADD CONSTRAINT fk_order_id_agent
FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE;

ALTER TABLE delivery_agent
ADD CONSTRAINT fk_customer_id_agent
FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

ALTER TABLE Admins
ADD CONSTRAINT fk_order_id_admin
FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE SET NULL;

ALTER TABLE Admins
ADD CONSTRAINT fk_product_id_admin
FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE SET NULL;

ALTER TABLE orders
ADD CONSTRAINT fk_product_id_orders
FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE;


ALTER TABLE cart
ADD CONSTRAINT fk_product_id_cart
FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE SET NULL;

ALTER TABLE cart
ADD CONSTRAINT fk_customer_id_cart
FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE SET NULL;

ALTER TABLE wallet
ADD CONSTRAINT fk_customer_id_wallet
FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

ALTER TABLE delivery_system
ADD CONSTRAINT fk_agent_id_delivery_system
FOREIGN KEY (agent_id) REFERENCES delivery_agent(agent_id) ON DELETE SET NULL;

ALTER TABLE delivery_system
ADD CONSTRAINT fk_admin_id_delivery_system
FOREIGN KEY (admin_id) REFERENCES Admins(admin_id) ON DELETE SET NULL;

ALTER TABLE customers
ADD CONSTRAINT mobile_number_length_customer 
CHECK (LENGTH(mobile_number) > 9);

ALTER TABLE delivery_agent
ADD CONSTRAINT mobile_number_length_agent
CHECK (LENGTH(mobile_number) > 9);


show tables;

insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (1, 'kshotboult0', 'l1Ha2yuDiA30', 'PRIME', 'smadrell0@prweb.com', '5158654922', '89156 Aberg Alley');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (2, 'lwhittall1', 'v4DTMAt', 'BASIC', 'jwitton1@csmonitor.com', '1043995361', '61 Hovde Pass');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (3, 'kdawdary2', '8BspyY2dPt', 'PRIME', 'gfaint2@360.cn', '4095224629', '87 Havey Place');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (4, 'dreford3', 'bbOAgjxy', 'ELITE', 'scookley3@meetup.com', '5719922089', '6 Crescent Oaks Court');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (5, 'boconnell4', 'YV2K2mZe2', 'BASIC', 'owhittington4@businessinsider.com', '3511110411', '24332 Farragut Pass');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (6, 'glennie5', 'xcI49U633Kn', 'ELITE', 'sbury5@etsy.com', '1131705356', '9611 Pine View Park');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (7, 'sgilchrist6', 'f6rHR8jcm', 'ELITE', 'mhitcham6@hao123.com', '3992806726', '5912 Cordelia Center');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (8, 'rmacane7', 'tDzhTV0', 'ELITE', 'lminihane7@google.fr', '5108135646', '86 Bartelt Drive');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (9, 'erouthorn8', 'ZTtaKbP', 'ELITE', 'cransome8@wordpress.com', '4404785851', '70 Randy Parkway');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (10, 'gkenney9', 'gDFSrv4LAC', 'PRIME', 'jdillinton9@ox.ac.uk', '4053673044', '886 Leroy Point');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (11, 'bspincksa', 'T4omBl', 'BASIC', 'gmadgwicka@pinterest.com', '5169028349', '47 Melvin Terrace');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (12, 'mseefeldtb', 'u1dbo5', 'ELITE', 'rrizziellob@gravatar.com', '3795094215', '84240 Sullivan Hill');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (13, 'clickorishc', '2LyPYQrK', 'ELITE', 'geadonc@1688.com', '2254263167', '79 Welch Trail');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (14, 'hveryardd', 'CWWXXub', 'BASIC', 'jsabied@xrea.com', '2592821852', '6 Roth Street');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (15, 'mhackeltone', 'GXo0qw', 'BASIC', 'cilivee@fc2.com', '2607764001', '7407 Mandrake Court');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (16, 'dsteptowef', 'jn9K4ErP', 'PRIME', 'ivickermanf@google.com.br', '9546535064', '1444 Havey Lane');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (17, 'kannearg', 'LaTD33R', 'PRIME', 'rcastillong@flavors.me', '4547179624', '200 Sunnyside Terrace');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (18, 'ikenderdineh', 'dB22UUz8zszr', 'BASIC', 'cspillingh@dmoz.org', '6497335651', '13 Mccormick Alley');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (19, 'loertzeni', 'qY6wt5', 'PRIME', 'cmitrovici@goo.ne.jp', '7602024956', '5251 Hudson Way');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (20, 'ajewettj', 'jK8zSKe3', 'PRIME', 'severedj@blog.com', '5973622428', '418 Sommers Crossing');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (21, 'shagartk', 'SqNgTEwq', 'BASIC', 'mlatusk@hugedomains.com', '1352089503', '13558 Ramsey Plaza');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (22, 'kstanwayl', 'cwHnc1Ii4BC', 'BASIC', 'mbebbelll@t.co', '2985249942', '81621 Schmedeman Circle');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (23, 'nbestonm', 'DC1kXT', 'BASIC', 'mansteem@indiegogo.com', '9812511966', '73 Briar Crest Pass');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (24, 'djancn', 'tje7dJTEbPh', 'BASIC', 'vshiern@lulu.com', '5773711802', '902 Scoville Parkway');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (25, 'tlondingo', 'FZC9ajYvtvvl', 'BASIC', 'erandleso@chronoengine.com', '5142191035', '99 Sachs Street');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (26, 'cjammetp', 'YzUxlv', 'PRIME', 'darnowitzp@hao123.com', '7741901447', '74 Arizona Crossing');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (27, 'gizakq', 'mu2n6Bcd', 'BASIC', 'dbuckamq@yandex.ru', '3001393545', '8 Forest Dale Circle');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (28, 'kchoupinr', '4qleBkr7leF', 'BASIC', 'oharralr@goodreads.com', '7477931915', '991 Village Pass');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (29, 'bbaties', 'xIATkm6M', 'PRIME', 'rgreensteds@paypal.com', '5943991740', '361 Towne Center');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (30, 'khindert', 'slk9rT', 'BASIC', 'bspeachleyt@si.edu', '4839427962', '636 Heffernan Street');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (31, 'gedelheidu', 'OG8U7g', 'BASIC', 'clongmoreu@youku.com', '9259578714', '04 Jackson Parkway');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (32, 'rraoultv', 'bP6gt4GWFzC', 'BASIC', 'hginnv@independent.co.uk', '7058436911', '74 Manufacturers Trail');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (33, 'sgrimbaldestonw', 'kPUOruorS', 'ELITE', 'bmackiewiczw@blogspot.com', '3077097545', '33958 Carioca Plaza');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (34, 'slackeyex', 'k51W20', 'ELITE', 'bsaffrinx@buzzfeed.com', '5385168671', '70 Arrowood Junction');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (35, 'gpighillsy', 'qbUqEZYO', 'PRIME', 'mrollingy@delicious.com', '3891127119', '07 Fairfield Center');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (36, 'dgodwinz', '4tFcQoVu8C', 'ELITE', 'rcheccucciz@sphinn.com', '5319524717', '8 Melrose Point');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (37, 'pplaice10', 'q51yRHF8INz', 'PRIME', 'mcoalburn10@clickbank.net', '4978530231', '172 Longview Park');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (38, 'fgolt11', 'aSiVMIe', 'PRIME', 'mlavery11@prnewswire.com', '7365730352', '84 Northfield Park');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (39, 'ealejandri12', 'cSmt5G1Y', 'ELITE', 'vherreros12@wikimedia.org', '3331962916', '532 Derek Drive');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (40, 'talgore13', 'Fyhzq3kKNfGb', 'PRIME', 'fclaypole13@dedecms.com', '3702625177', '0 Ridgeway Street');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (41, 'afobidge14', '5Pvt5kNxl', 'BASIC', 'kenders14@state.tx.us', '7021946083', '2150 Messerschmidt Road');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (42, 'kcreffield15', 'qjtplYj', 'ELITE', 'sdeards15@epa.gov', '7081685801', '53 Clyde Gallagher Trail');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (43, 'phawler16', '4ruNtt06w', 'BASIC', 'pcoventon16@archive.org', '6149349120', '619 Monterey Road');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (44, 'bmogie17', 'iuMrpHk0', 'ELITE', 'kburry17@vk.com', '2563450917', '821 Ohio Lane');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (45, 'javo18', 'h4mu8EF', 'BASIC', 'nskinley18@tuttocitta.it', '2014077569', '6378 Haas Court');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (46, 'dcrosen19', '4k9xA0Ai', 'BASIC', 'norehead19@apple.com', '2303188960', '468 Veith Terrace');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (47, 'jpiscopello1a', 'YWm1luR4JQ', 'ELITE', 'kcarr1a@bbb.org', '2013346168', '6279 Namekagon Pass');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (48, 'aestick1b', 'WPCFd24qsgc', 'PRIME', 'dwhoolehan1b@imdb.com', '5791194359', '07 Gale Trail');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (49, 'jablitt1c', 'j77MT0R', 'ELITE', 'ccurran1c@thetimes.co.uk', '8057938048', '67 Havey Place');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (50, 'qperham1d', 'ge4uA9oBwBr', 'BASIC', 'ccooney1d@livejournal.com', '8507512903', '6 Melody Alley');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (51, 'gcumes1e', 'PyuR4XVwiuc', 'BASIC', 'lshillum1e@earthlink.net', '5526791666', '2 Gulseth Alley');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (52, 'gbrayson1f', 'yAUUwwVS', 'PRIME', 'gducaen1f@biglobe.ne.jp', '6581165573', '9 Tennessee Hill');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (53, 'jgriswaite1g', 'xCnRd9nt43Jd', 'BASIC', 'pcharon1g@diigo.com', '3676464010', '16 Loftsgordon Road');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (54, 'oboxell1h', 'yQU61tQdvXO1', 'BASIC', 'lhedling1h@reference.com', '2403144088', '3 Johnson Terrace');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (55, 'mcassar1i', 'vXCwcGBKWIl', 'BASIC', 'rlebretondelavieuville1i@github.io', '5032516535', '3169 Twin Pines Lane');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (56, 'cplumstead1j', 'dqG3Xu2', 'BASIC', 'egarrit1j@de.vu', '4934669013', '00 Gerald Terrace');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (57, 'grenault1k', 'CK7AtBIeqJ7', 'BASIC', 'btomashov1k@rambler.ru', '5479279386', '58 Bayside Court');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (58, 'adreamer1l', 'kpVHTT3UY', 'BASIC', 'kglison1l@oracle.com', '5697390814', '2 Schiller Crossing');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (59, 'gdewen1m', 'uBXDE4MOxk', 'PRIME', 'fquinet1m@spotify.com', '1446575736', '477 Waxwing Street');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (60, 'wwhitelaw1n', 'NMy2Y2hzhPde', 'BASIC', 'mrostern1n@ihg.com', '3779976456', '6 Clarendon Junction');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (61, 'kgiacopini1o', 's94X6ufRaq', 'BASIC', 'pslucock1o@squarespace.com', '1346079304', '3 Forest Run Avenue');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (62, 'kcaldroni1p', 'Cr6Gvx1T', 'BASIC', 'mrobertson1p@phoca.cz', '8285481245', '195 Truax Park');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (63, 'ksmalecombe1q', 'ieCMh90', 'PRIME', 'sivett1q@1und1.de', '4974875171', '8616 Summer Ridge Crossing');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (64, 'tguiness1r', 'lqt2Lk', 'ELITE', 'cmelliard1r@jigsy.com', '5437319896', '2633 Montana Park');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (65, 'cpren1s', 'oDUDgdP', 'BASIC', 'ahitzmann1s@example.com', '2399156956', '43 Warner Hill');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (66, 'llightollers1t', 'SxQhjL2', 'BASIC', 'maliman1t@blogger.com', '4532896179', '36 Raven Circle');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (67, 'btreker1u', 'xydVlkRR', 'BASIC', 'vgallardo1u@friendfeed.com', '5917786295', '147 Macpherson Parkway');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (68, 'acockings1v', 'He7hZG3xMS', 'BASIC', 'mghilardini1v@mtv.com', '4367128627', '5 Eggendart Parkway');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (69, 'gquartley1w', 'hFZS8KVckWS', 'BASIC', 'ndoddridge1w@meetup.com', '1514901528', '90 Blue Bill Park Plaza');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (70, 'ccollyear1x', 'SPIbGwWHZa', 'PRIME', 'dtynemouth1x@mozilla.com', '8648042639', '7 Heath Alley');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (71, 'sedelheid1y', 'Ji3K6GLLs', 'BASIC', 'arichmond1y@cdc.gov', '4633157933', '02 Stang Street');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (72, 'bbauchop1z', 'OTCXaPdO054B', 'ELITE', 'mayres1z@lycos.com', '5219242943', '226 Loeprich Terrace');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (73, 'hmars20', '1oaK6Xz', 'PRIME', 'atalbot20@youku.com', '1969904647', '263 Caliangt Circle');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (74, 'atresise21', '4V9V3m5', 'BASIC', 'rduckett21@mapquest.com', '6257350538', '6 Moulton Pass');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (75, 'cchadburn22', 'YzrRns', 'ELITE', 'ainge22@sfgate.com', '6898006352', '57192 Forest Dale Junction');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (76, 'hlasseter23', 'cYtkVeNjVX', 'BASIC', 'jhedaux23@imdb.com', '5732631954', '653 Steensland Terrace');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (77, 'jschwandermann24', 'tYC3wQj', 'ELITE', 'pfrise24@mapquest.com', '4448656929', '5694 Kinsman Way');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (78, 'foffin25', 'hWAQfjD2Z', 'BASIC', 'inern25@telegraph.co.uk', '9428429749', '64742 Ruskin Pass');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (79, 'sastin26', 'fxjmJzz', 'BASIC', 'sblackborn26@yahoo.com', '2001786823', '33739 Morning Point');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (80, 'alindsay27', 'VsCJsT4uA0EK', 'PRIME', 'brodriguez27@freewebs.com', '7054036624', '907 Briar Crest Street');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (81, 'rmacgeffen28', 'yEm3EtA4', 'BASIC', 'mcopozio28@artisteer.com', '2824423615', '1 Golf Crossing');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (82, 'wfewell29', 'r1XPBRhR', 'BASIC', 'wstert29@abc.net.au', '1069133657', '33987 Orin Way');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (83, 'lfeaviour2a', 'GafrnmQ', 'BASIC', 'amullineux2a@tripadvisor.com', '1762845328', '12484 Vahlen Parkway');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (84, 'bdanson2b', 'mU0LlkGOohOE', 'ELITE', 'ruttridge2b@moonfruit.com', '1886568452', '94208 Blue Bill Park Drive');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (85, 'jwichard2c', 'VoRDEUC', 'ELITE', 'abaumler2c@artisteer.com', '3582962934', '43374 Vahlen Court');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (86, 'kairey2d', 'LjMPGESjwv', 'BASIC', 'marend2d@dyndns.org', '8075050915', '35597 Drewry Court');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (87, 'smcilenna2e', '6POLEzMQxUAt', 'BASIC', 'rcofax2e@tripod.com', '9264449812', '66506 Lake View Drive');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (88, 'mrearden2f', '1AbhijW', 'ELITE', 'gdivine2f@wikispaces.com', '8158833471', '81023 Mariners Cove Court');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (89, 'holivetti2g', 'ojoqQg', 'PRIME', 'mrobet2g@t-online.de', '7027798265', '6 Superior Center');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (90, 'bmonsey2h', 'DCrr7r', 'ELITE', 'bklug2h@mlb.com', '5007914210', '2 Maryland Road');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (91, 'jgantlett2i', 'KKbP9uVIU1u', 'PRIME', 'mnairy2i@xing.com', '4607231559', '9013 Melby Pass');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (92, 'swoollons2j', 'uQna99C7YZ5a', 'ELITE', 'nborgbartolo2j@arstechnica.com', '9957111067', '02168 Blaine Terrace');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (93, 'lghione2k', 'pFdClQjA', 'PRIME', 'ldibdale2k@barnesandnoble.com', '3794121343', '62837 Lillian Plaza');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (94, 'gmaplethorp2l', 'UgyxeH2DWH', 'ELITE', 'sapfelmann2l@cnet.com', '3339469233', '51 David Lane');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (95, 'ameasham2m', 'ebQL6g7', 'ELITE', 'kgeeve2m@reddit.com', '5978732443', '59098 Orin Place');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (96, 'kridings2n', 'WdXy5vc', 'PRIME', 'dtomlinson2n@privacy.gov.au', '3268695926', '0608 Schiller Court');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (97, 'fmaddicks2o', 'RpinUbEBp3cY', 'PRIME', 'estansfield2o@berkeley.edu', '1216075769', '1883 Vera Trail');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (98, 'adevaney2p', 'brzev3HsM', 'ELITE', 'mdaggett2p@stanford.edu', '1574560182', '2440 Kenwood Circle');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (99, 'abickerton2q', '1TcX44hOk', 'PRIME', 'jprester2q@nih.gov', '5628677391', '9 Ohio Pass');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (100, 'roleahy2r', 'gDZWgOsiSCrx', 'ELITE', 'mwisniowski2r@reference.com', '3506093190', '9907 Eagle Crest Lane');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (101, 'einglesent2s', 'epOtO9ouj', 'ELITE', 'sales2s@trellian.com', '1165317779', '771 Portage Crossing');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (102, 'fpadmore2t', 'eYyCYacdoybS', 'PRIME', 'ladnam2t@cafepress.com', '4307923793', '186 Nobel Court');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (103, 'jagglione2u', '9fNQgNpM3EE', 'PRIME', 'nbaseggio2u@cyberchimps.com', '5898572670', '706 Scofield Center');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (104, 'flyptratt2v', 'MC102wjeyLyz', 'BASIC', 'ttitmarsh2v@hhs.gov', '8202193937', '950 School Place');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (105, 'gflecknoe2w', 'RkrahydT', 'BASIC', 'mkeough2w@ning.com', '7108615461', '9083 Welch Street');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (106, 'augo2x', 'QpdT2q9KL2v', 'ELITE', 'ggraal2x@moonfruit.com', '9733641828', '75746 Mayer Street');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (107, 'dtrythall2y', '0fmOfoK', 'PRIME', 'kkenlin2y@list-manage.com', '9979485150', '6 East Place');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (108, 'llorand2z', 'i6IO7x18u3qR', 'PRIME', 'lmorison2z@fotki.com', '5063736026', '021 International Hill');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (109, 'otournay30', 'RFJ22uzp5', 'BASIC', 'blayborn30@house.gov', '4725981385', '9 Artisan Drive');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (110, 'lglenny31', 'gu8pqNsl6L', 'PRIME', 'bchaikovski31@over-blog.com', '3736264831', '1 Bluejay Lane');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (111, 'hmaxwell32', 'QAG6LkbHvp', 'PRIME', 'vmiddleton32@apache.org', '2025210237', '1 Raven Place');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (112, 'abonnet33', 'Mo9DNnhUP2', 'BASIC', 'jwaine33@canalblog.com', '5773293559', '60514 Vermont Hill');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (113, 'wgoeff34', '0iInIxx', 'BASIC', 'cmorrow34@mozilla.com', '5081534265', '79040 Westend Hill');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (114, 'bsmeal35', 'AZ6DQj', 'ELITE', 'mcoleiro35@usnews.com', '7801045374', '84867 Bunting Pass');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (115, 'kosbiston36', '9VBdAc', 'ELITE', 'gbricklebank36@photobucket.com', '8351281762', '7 Schurz Crossing');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (116, 'wsture37', 'C5zafC', 'PRIME', 'imurphey37@prlog.org', '3819402344', '69748 Eagan Drive');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (117, 'jgoing38', 'ncipANWiuoaQ', 'BASIC', 'ggimblet38@prlog.org', '2893799947', '1 Crest Line Place');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (118, 'wportress39', 'umuTLPUD9XM', 'BASIC', 'fboerder39@xrea.com', '4047613259', '1771 Oakridge Center');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (119, 'egoldin3a', 'tnktieX', 'PRIME', 'gkevis3a@unc.edu', '9393766294', '93 Randy Pass');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (120, 'cwann3b', 'OkI4UDUaxsJ', 'PRIME', 'sbinge3b@ibm.com', '1097346075', '12874 High Crossing Circle');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (121, 'smckeowon3c', 'oPIV9B', 'ELITE', 'lcowope3c@angelfire.com', '8424136878', '6 Parkside Trail');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (122, 'nlomond3d', 'toAUcT9', 'BASIC', 'mlorenzini3d@gizmodo.com', '2659893090', '26657 Elka Hill');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (123, 'bskacel3e', 'lXn21FF', 'ELITE', 'mrigler3e@miibeian.gov.cn', '1739234569', '754 Maple Avenue');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (124, 'akarlik3f', 'QI5UumM', 'BASIC', 'rhollingdale3f@cornell.edu', '2327663675', '37073 Redwing Way');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (125, 'mtreweek3g', 'Q67gnWWRSD', 'PRIME', 'ajebb3g@bravesites.com', '3444891110', '4253 Buena Vista Hill');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (126, 'hberford3h', 'opiz06HVD', 'PRIME', 'mgentsch3h@google.co.uk', '1927905089', '48546 Cascade Alley');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (127, 'smcardle3i', '21P5Mc', 'ELITE', 'bdyka3i@ft.com', '4571082990', '9 Ilene Crossing');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (128, 'cstainton3j', 'pQzSCU', 'ELITE', 'sscotson3j@time.com', '4663747910', '913 Steensland Plaza');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (129, 'kdigle3k', 'MCFqgBr2fIQA', 'ELITE', 'lklamp3k@networkadvertising.org', '2174872051', '84679 Columbus Terrace');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (130, 'gvanthoog3l', 'ABBHFOLFxum', 'ELITE', 'kpardue3l@1und1.de', '2426800849', '890 Golf Center');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (131, 'mpetrillo3m', 'ZVo66Wzz', 'PRIME', 'rcoller3m@drupal.org', '9878435346', '903 Mosinee Terrace');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (132, 'kmckelvey3n', 'cdpTitRXA9Z', 'PRIME', 'fball3n@hubpages.com', '9669463478', '06 West Way');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (133, 'spavyer3o', 'OfMtpCygB7', 'BASIC', 'dfitzgilbert3o@spotify.com', '4756218122', '0 Continental Way');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (134, 'dtarbatt3p', '8xANWjohSz', 'BASIC', 'nwindrass3p@yahoo.com', '3027327902', '77076 Vera Drive');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (135, 'mrings3q', 'oCUuloyNurA6', 'PRIME', 'tskipp3q@berkeley.edu', '3609898561', '76 Hauk Point');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (136, 'lporch3r', '3TmP8WSFoo', 'PRIME', 'nherrema3r@networkadvertising.org', '5161789353', '873 Tennyson Drive');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (137, 'sstyan3s', 'W4K9F4z2hJ', 'PRIME', 'emathewes3s@exblog.jp', '6612659538', '950 Brown Junction');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (138, 'ljoselevitz3t', 'qiheXMlsmcyv', 'BASIC', 'rjakubovics3t@boston.com', '1645246083', '54 Cottonwood Crossing');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (139, 'kmacgillreich3u', '9S6reQRHzv', 'PRIME', 'lmcginney3u@theguardian.com', '2216516526', '154 Talmadge Plaza');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (140, 'mcoffee3v', 'j5hhqV4kmd', 'BASIC', 'bknights3v@latimes.com', '4001451134', '05 Stoughton Road');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (141, 'dmerring3w', '7GbwxU', 'BASIC', 'gjames3w@blog.com', '4012894518', '4443 Forest Junction');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (142, 'zmartt3x', 'TUO1QEfUNGBV', 'PRIME', 'rkent3x@oakley.com', '6725003204', '8 Sunfield Terrace');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (143, 'dcorke3y', '0LP99R1P4IvE', 'ELITE', 'ashieldon3y@marketwatch.com', '4373312189', '67544 Dakota Alley');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (144, 'zhindhaugh3z', 'kNMs39b', 'ELITE', 'sperrelle3z@washingtonpost.com', '1531907510', '001 Pond Park');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (145, 'csugars40', '6t7AViIGtCPF', 'PRIME', 'mcoldwell40@com.com', '2686185834', '24 Stuart Crossing');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (146, 'tescreet41', 'SimXYWskS', 'PRIME', 'msilcox41@dedecms.com', '4025272043', '6 Thierer Place');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (147, 'cclaesens42', 'wGe580f', 'BASIC', 'grouch42@google.es', '8543835912', '8 Laurel Crossing');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (148, 'esmeaton43', 'kuaxZJzRQM', 'ELITE', 'wcleve43@newsvine.com', '4076636398', '5 David Road');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (149, 'swickey44', 'YmpF4qNGMo4', 'ELITE', 'rpunshon44@netscape.com', '3922901230', '669 Tennessee Avenue');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (150, 'aricciardi45', 'yizcMvy1ixCl', 'BASIC', 'kswatheridge45@t.co', '5598340055', '79762 Mesta Parkway');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (151, 'adecopeman46', 'cd8XeVVS7xa', 'PRIME', 'ltother46@google.cn', '9118510692', '07 Old Gate Hill');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (152, 'admitrievski47', 'sz1k2Q09vXE', 'BASIC', 'fbaglan47@digg.com', '9991914665', '26 Pond Plaza');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (153, 'awhiteman48', 'aSH4Fa', 'ELITE', 'mcollman48@bluehost.com', '9661008976', '67458 Forest Junction');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (154, 'ldicarli49', 'CM2GRtv', 'PRIME', 'bkinny49@eventbrite.com', '1664016667', '1869 Blaine Circle');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (155, 'twigfield4a', 'ufrxRHm', 'ELITE', 'hdebling4a@infoseek.co.jp', '9892703759', '8750 Aberg Avenue');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (156, 'gsowte4b', 'NpAI2ZclM', 'ELITE', 'mghost4b@go.com', '4201856573', '24654 Hansons Street');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (157, 'garpur4c', 'pLYasjB9bO', 'BASIC', 'cforst4c@unblog.fr', '6867850043', '72 Bartillon Crossing');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (158, 'fglewe4d', '2Ehuzm8Md', 'ELITE', 'gverbrugghen4d@census.gov', '7689122381', '1 Manley Center');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (159, 'brumbelow4e', 'iN4chu4BBVwg', 'BASIC', 'zgenike4e@intel.com', '3722144166', '529 Quincy Court');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (160, 'cbarwell4f', 'aXXkTv0Rvk0', 'ELITE', 'alawly4f@acquirethisname.com', '1351057692', '296 Surrey Crossing');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (161, 'tbertram4g', 'm7DEiB6nfG', 'ELITE', 'ashortcliffe4g@cbsnews.com', '3512724701', '2 Twin Pines Circle');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (162, 'aharbage4h', '32nyKhOg', 'PRIME', 'adymoke4h@businessweek.com', '9254528629', '699 Hoard Plaza');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (163, 'dsoggee4i', 'OQi53z', 'ELITE', 'fsich4i@photobucket.com', '9734472997', '7 Dixon Way');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (164, 'amcclinton4j', 'oqArHzk', 'BASIC', 'jclimpson4j@princeton.edu', '8005938994', '24 Crescent Oaks Place');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (165, 'jclayworth4k', 'nwAgJ1V8TMl', 'ELITE', 'gbaudasso4k@google.cn', '6463974830', '50288 Twin Pines Street');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (166, 'lhanburybrown4l', 'eTUxhOh', 'ELITE', 'bhinckes4l@hatena.ne.jp', '5715058571', '96837 Mariners Cove Pass');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (167, 'jmacdonogh4m', '3J4b4xWQyem', 'ELITE', 'roskehan4m@dagondesign.com', '2738954328', '3 Becker Crossing');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (168, 'gcristofolini4n', 'o1yf95Kmt', 'PRIME', 'mdaville4n@indiatimes.com', '7907009537', '75 John Wall Trail');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (169, 'wmcginnis4o', 'xmbgRXqHREvS', 'ELITE', 'jsuermeier4o@edublogs.org', '8526083169', '3776 Comanche Crossing');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (170, 'adow4p', 'LWksMZf2', 'ELITE', 'saronson4p@webmd.com', '5604274771', '6386 Iowa Avenue');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (171, 'mallcorn4q', 'yJmzQQj0KVXN', 'ELITE', 'eleynton4q@fastcompany.com', '4029013074', '988 Portage Street');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (172, 'jbrecher4r', 'WLYwDUeIG9', 'ELITE', 'wjaques4r@bing.com', '6425640549', '63217 Canary Crossing');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (173, 'lcastiglioni4s', 'uaAepb3pOEJ', 'ELITE', 'torgan4s@biglobe.ne.jp', '2861323725', '0 Sunnyside Plaza');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (174, 'kmayfield4t', 'ilEXF4DZC', 'PRIME', 'ccattermole4t@cocolog-nifty.com', '3012368889', '4 Holy Cross Junction');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (175, 'hteape4u', '0y6s7CT1', 'PRIME', 'asheather4u@rediff.com', '4864931842', '0 John Wall Trail');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (176, 'zruoss4v', 'TNGkEpBel5', 'PRIME', 'mbromehead4v@moonfruit.com', '6066909960', '65 Miller Plaza');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (177, 'cgoodanew4w', 'JsAOeP', 'PRIME', 'ndiprose4w@nature.com', '4376196744', '55 Kennedy Junction');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (178, 'nmaccumiskey4x', 'gz7hawlWH', 'ELITE', 'ppounsett4x@ask.com', '6053829072', '443 Gulseth Avenue');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (179, 'msautter4y', 'ao7zOyb4Aq', 'ELITE', 'bnolin4y@zimbio.com', '6266977989', '12497 1st Park');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (180, 'dgreggs4z', '7FejellyAw', 'ELITE', 'bhaggidon4z@va.gov', '5709266006', '6997 Oneill Center');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (181, 'vfoston50', 'avKpxZPSzG', 'ELITE', 'obrett50@free.fr', '1818752859', '4627 Nevada Trail');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (182, 'kblankman51', 'TZF9Z5z0', 'BASIC', 'skeam51@google.de', '6609895690', '75 Messerschmidt Point');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (183, 'kcorps52', 'Mp6ylOXoY', 'PRIME', 'fsaffran52@nationalgeographic.com', '6573837012', '32772 Hallows Trail');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (184, 'adenisovo53', 'XAlFMwkB', 'BASIC', 'hfeatenby53@cornell.edu', '1321284902', '24 Main Terrace');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (185, 'ahallor54', 'eFL3ll', 'ELITE', 'dbritto54@bizjournals.com', '8905382293', '893 Bunting Parkway');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (186, 'ghasluck55', '2k56MTg', 'PRIME', 'lfryett55@europa.eu', '9304748288', '5557 Norway Maple Place');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (187, 'gcolton56', '4EI3QzrtSk', 'PRIME', 'scheyney56@imageshack.us', '7243537647', '00 Darwin Way');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (188, 'sroff57', 'l0OpRuN12', 'PRIME', 'rsevior57@dropbox.com', '1069354340', '191 Dorton Drive');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (189, 'wlawes58', '0R8aLSNN9i', 'BASIC', 'jlemin58@goodreads.com', '3674611451', '6 Blackbird Crossing');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (190, 'mmatteris59', 'hdhSAB1JA', 'BASIC', 'bprynne59@narod.ru', '3615966624', '35121 Eagle Crest Parkway');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (191, 'fgajewski5a', '8G289VZuH', 'BASIC', 'kbranscombe5a@icq.com', '3339269063', '35 Transport Road');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (192, 'cpimmocke5b', 'tvYGTuIp5UWj', 'PRIME', 'oworms5b@livejournal.com', '5626121131', '75392 Valley Edge Junction');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (193, 'ldoerffer5c', '9rhkD8gOFe2', 'BASIC', 'rcollumbell5c@exblog.jp', '7389246761', '506 Dapin Crossing');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (194, 'aclaricoats5d', 'L5Whumkqxyu', 'ELITE', 'sleverentz5d@berkeley.edu', '4028292168', '36193 Moulton Lane');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (195, 'ggidman5e', 'dk6vUp6BzU', 'ELITE', 'gventura5e@nationalgeographic.com', '3134323675', '6848 Fairview Court');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (196, 'gbaggalley5f', 'czYdHn7B', 'ELITE', 'agrgic5f@eventbrite.com', '8652151025', '46 Scoville Point');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (197, 'dsquirrell5g', 'JwdVMb', 'BASIC', 'pfeetham5g@army.mil', '8315678089', '2 Kropf Avenue');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (198, 'vpeyto5h', '9GXrPz', 'PRIME', 'awharin5h@barnesandnoble.com', '1392273436', '35 Evergreen Trail');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (199, 'laloway5i', 'qFYXDvhFsZy', 'ELITE', 'mrevelle5i@businessweek.com', '5647838104', '8921 Brickson Park Lane');
insert into customers (customer_id, username, pass, membership_status, email_id, mobile_number, delivery_address) values (200, 'bmoulton5j', 'Jxxrc9RIYA', 'ELITE', 'pruffell5j@list-manage.com', '9203231056', '9083 Morning Terrace');

-- SELECT * FROM customers;


insert into product (product_id, product_name, product_price, product_stock, product_rating) values (1, 'Tea - Decaf Lipton', 740, 38, 2.4);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (2, 'Cheese - Havarti, Roasted Garlic', 164, 14, 1.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (3, 'Loquat', 186, 23, 4.5);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (4, 'Yucca', 331, 15, 1.5);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (5, 'Tea - Darjeeling, Azzura', 107, 59, 2.1);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (6, 'Split Peas - Green, Dry', 425, 32, 3.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (7, 'Yogurt - Banana, 175 Gr', 864, 31, 2.3);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (8, 'Cookie Double Choco', 195, 27, 3.7);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (9, 'Bread - Petit Baguette', 720, 45, 1.6);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (10, 'Tea - Herbal - 6 Asst', 698, 36, 3.4);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (11, 'Wine - Muscadet Sur Lie', 893, 22, 3.4);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (12, 'Compound - Raspberry', 455, 72, 3.1);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (13, 'Icecream Cone - Areo Chocolate', 852, 17, 1.4);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (14, 'Rosemary - Dry', 354, 20, 2.9);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (15, 'Appetizer - Shrimp Puff', 383, 29, 1.4);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (16, 'Beets - Golden', 235, 38, 2.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (17, 'Pasta - Detalini, White, Fresh', 749, 61, 3.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (18, 'Dish Towel', 606, 18, 2.1);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (19, 'Bamboo Shoots - Sliced', 519, 60, 2.4);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (20, 'Transfer Sheets', 894, 67, 4.3);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (21, 'Tumeric', 204, 71, 1.2);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (22, 'Rappini - Andy Boy', 4, 93, 1.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (23, 'Beans - Wax', 317, 92, 1.3);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (24, 'Pail With Metal Handle 16l White', 681, 47, 3.7);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (25, 'Ice Cream - Life Savers', 749, 46, 2.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (26, 'Muffins - Assorted', 805, 51, 1.1);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (27, 'Juice - V8, Tomato', 697, 45, 2.1);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (28, 'Shrimp - 16/20, Peeled Deviened', 630, 49, 3.2);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (29, 'Mousse - Passion Fruit', 263, 26, 2.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (30, 'Puree - Pear', 949, 71, 3.3);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (31, 'Beets - Candy Cane, Organic', 497, 27, 1.4);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (32, 'Pepper - Green, Chili', 867, 98, 4.1);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (33, 'Liquid Aminios Acid - Braggs', 655, 12, 3.1);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (34, 'Puree - Passion Fruit', 229, 18, 2.2);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (35, 'Soup - Campbells Mac N Cheese', 144, 42, 3.2);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (36, 'Wine - Kwv Chenin Blanc South', 568, 77, 4.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (37, 'Coffee Swiss Choc Almond', 806, 30, 4.2);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (38, 'Turkey - Ground. Lean', 891, 100, 4.9);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (39, 'Garlic Powder', 799, 12, 4.6);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (40, 'Bread - Bagels, Plain', 408, 14, 2.7);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (41, 'Soup - Campbells Pasta Fagioli', 1, 50, 2.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (42, 'Mushroom - Shitake, Dry', 674, 47, 2.5);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (43, 'Flavouring - Orange', 883, 14, 4.5);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (44, 'Squeeze Bottle', 676, 58, 2.2);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (45, 'Sausage - Andouille', 450, 55, 4.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (46, 'Milk - Chocolate 500ml', 282, 44, 2.9);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (47, 'Graham Cracker Mix', 483, 71, 2.5);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (48, 'Green Tea Refresher', 420, 18, 4.9);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (49, 'Wine - German Riesling', 676, 43, 4.4);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (50, 'Bag Clear 10 Lb', 144, 88, 1.2);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (51, 'Carroway Seed', 453, 40, 2.6);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (52, 'Lighter - Bbq', 251, 55, 1.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (53, 'Milk - Skim', 772, 11, 4.9);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (54, 'Water - Spring Water, 355 Ml', 932, 42, 3.3);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (55, 'Quinoa', 96, 10, 3.2);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (56, 'Chips Potato Reg 43g', 723, 89, 4.9);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (57, 'Pasta - Lasagne, Fresh', 717, 55, 3.6);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (58, 'Apple - Custard', 479, 21, 2.1);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (59, 'Bread - Onion Focaccia', 109, 54, 3.5);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (60, 'Apples - Sliced / Wedge', 141, 74, 3.4);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (61, 'Swiss Chard', 757, 58, 1.6);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (62, 'Plums - Red', 140, 56, 1.7);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (63, 'Beans - Navy, Dry', 215, 79, 4.1);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (64, 'Beef - Inside Round', 392, 29, 1.2);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (65, 'Beer - Upper Canada Lager', 586, 24, 3.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (66, 'Pepper - Cayenne', 876, 67, 1.3);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (67, 'Flax Seed', 118, 11, 4.9);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (68, 'Ice Cream - Turtles Stick Bar', 12, 32, 2.1);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (69, 'Juice - Tomato, 48 Oz', 341, 24, 1.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (70, 'Dates', 739, 13, 4.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (71, 'Pate - Cognac', 889, 37, 4.7);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (72, 'Bread - Calabrese Baguette', 84, 12, 1.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (73, 'Carbonated Water - Strawberry', 293, 87, 3.7);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (74, 'Cake - Mini Cheesecake', 336, 82, 3.6);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (75, 'The Pop Shoppe - Cream Soda', 377, 92, 3.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (76, 'Flour - Strong Pizza', 995, 27, 4.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (77, 'Halibut - Steaks', 91, 54, 1.6);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (78, 'Anchovy Fillets', 939, 35, 1.5);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (79, 'Appetizer - Spring Roll, Veg', 95, 33, 1.7);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (80, 'Dc Hikiage Hira Huba', 273, 25, 4.6);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (81, 'Lid Coffeecup 12oz D9542b', 166, 85, 3.1);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (82, 'Scampi Tail', 985, 12, 2.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (83, 'Quail - Eggs, Fresh', 277, 50, 4.5);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (84, 'Apple - Delicious, Golden', 186, 84, 4.1);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (85, 'Corn - On The Cob', 131, 19, 2.4);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (86, 'Laundry - Bag Cloth', 323, 96, 4.6);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (87, 'Energy Drink - Franks Pineapple', 613, 82, 3.4);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (88, 'Wine - Tribal Sauvignon', 253, 88, 1.7);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (89, 'Mustard - Individual Pkg', 728, 100, 1.1);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (90, 'Foil Cont Round', 834, 87, 3.1);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (91, 'Shrimp - Black Tiger 13/15', 15, 52, 3.9);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (92, 'Fish - Soup Base, Bouillon', 924, 99, 3.2);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (93, 'Smoked Tongue', 123, 35, 3.6);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (94, 'Onions - Green', 829, 24, 2.2);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (95, 'Sauce - Hoisin', 377, 10, 4.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (96, 'Celery', 229, 75, 2.6);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (97, 'Whmis Spray Bottle Graduated', 830, 23, 2.4);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (98, 'Salmon - Atlantic, Skin On', 52, 46, 1.9);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (99, 'Transfer Sheets', 447, 50, 1.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (100, 'Persimmons', 546, 49, 3.6);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (101, 'Wine - Beringer Founders Estate', 643, 24, 2.7);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (102, 'Devonshire Cream', 877, 81, 2.5);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (103, 'Muffin Mix - Blueberry', 681, 98, 2.4);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (104, 'Sauce - Marinara', 320, 65, 2.9);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (105, 'Eggplant - Regular', 707, 21, 4.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (106, 'Tofu - Soft', 41, 91, 2.3);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (107, 'Beef - Eye Of Round', 336, 46, 3.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (108, 'Cheese - La Sauvagine', 588, 70, 2.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (109, 'Shrimp, Dried, Small / Lb', 595, 52, 1.9);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (110, 'Cheese - Mozzarella', 253, 68, 1.5);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (111, 'Urban Zen Drinks', 308, 50, 4.4);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (112, 'Rice - 7 Grain Blend', 98, 62, 4.6);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (113, 'Chestnuts - Whole,canned', 437, 24, 1.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (114, 'Bar - Sweet And Salty Chocolate', 310, 89, 4.4);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (115, 'Muffin Puck Ww Carrot', 438, 43, 1.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (116, 'V8 Splash Strawberry Kiwi', 721, 40, 4.3);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (117, 'Chocolate - Pistoles, Lactee, Milk', 799, 44, 4.1);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (118, 'Puree - Raspberry', 165, 16, 4.4);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (119, 'Lamb - Sausage Casings', 226, 46, 1.5);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (120, 'Wine - Red, Mouton Cadet', 104, 15, 4.3);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (121, 'Turkey - Breast, Smoked', 699, 86, 3.5);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (122, 'Straws - Cocktale', 788, 49, 3.4);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (123, 'Glaze - Apricot', 527, 25, 1.1);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (124, 'Nut - Almond, Blanched, Whole', 261, 87, 2.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (125, 'Bananas', 513, 18, 3.3);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (126, 'Sproutsmustard Cress', 212, 25, 4.7);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (127, 'Beans - Fava, Canned', 374, 82, 5.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (128, 'Pepper - Red, Finger Hot', 189, 34, 4.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (129, 'Beets - Mini Golden', 855, 34, 4.9);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (130, 'Beef - Sushi Flat Iron Steak', 206, 22, 2.1);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (131, 'Juice - Tomato, 10 Oz', 599, 77, 3.2);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (132, 'Bread Ww Cluster', 995, 46, 4.9);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (133, 'Wine - Red, Black Opal Shiraz', 390, 23, 4.1);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (134, 'Mince Meat - Filling', 667, 75, 2.4);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (135, 'Wine - Cahors Ac 2000, Clos', 82, 45, 1.9);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (136, 'Tart - Raisin And Pecan', 2, 75, 1.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (137, 'Pork - Tenderloin, Fresh', 502, 17, 1.2);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (138, 'Ice Cream Bar - Oreo Cone', 102, 47, 3.5);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (139, 'Turkey Leg With Drum And Thigh', 595, 31, 4.9);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (140, 'Versatainer Nc - 9388', 152, 38, 2.3);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (141, 'Pasta - Ravioli', 642, 64, 4.5);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (142, 'Soup - Knorr, Classic Can. Chili', 165, 55, 2.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (143, 'Juice - Ocean Spray Cranberry', 894, 28, 2.1);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (144, 'Flavouring - Raspberry', 893, 94, 2.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (145, 'Beef - Tongue, Cooked', 600, 69, 1.2);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (146, 'Bagel - Ched Chs Presliced', 710, 44, 1.3);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (147, 'Coffee - Hazelnut Cream', 565, 24, 3.9);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (148, 'Puree - Passion Fruit', 481, 59, 2.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (149, 'Cookie Trail Mix', 908, 86, 2.7);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (150, 'Napkin White - Starched', 646, 35, 2.6);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (151, 'French Pastries', 250, 87, 3.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (152, 'Crab Meat Claw Pasteurise', 655, 25, 1.2);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (153, 'Bouillion - Fish', 21, 39, 1.3);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (154, 'Basil - Pesto Sauce', 365, 36, 1.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (155, 'Mcgillicuddy Vanilla Schnap', 421, 59, 2.1);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (156, 'Pasta - Lasagne, Fresh', 294, 24, 1.7);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (157, 'Cookie - Oreo 100x2', 355, 61, 1.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (158, 'Bar Mix - Pina Colada, 355 Ml', 867, 32, 2.1);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (159, 'Soup - Boston Clam Chowder', 243, 75, 3.3);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (160, 'Wine - Ruffino Chianti', 393, 87, 4.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (161, 'Nut - Macadamia', 530, 58, 4.9);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (162, 'Longos - Lasagna Beef', 930, 61, 3.6);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (163, 'Wine - Red, Colio Cabernet', 492, 30, 4.4);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (164, 'Hot Chocolate - Individual', 760, 86, 2.2);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (165, 'Extract - Almond', 790, 33, 4.7);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (166, 'Orange Roughy 4/6 Oz', 531, 15, 1.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (167, 'Corn Kernels - Frozen', 836, 82, 1.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (168, 'Towel - Roll White', 161, 28, 4.3);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (169, 'Sugar - Brown', 97, 56, 3.7);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (170, 'C - Plus, Orange', 173, 38, 1.9);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (171, 'Shrimp - Baby, Cold Water', 48, 49, 4.2);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (172, 'Wine - Sicilia Igt Nero Avola', 456, 71, 2.5);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (173, 'Muffin Hinge Container 6', 777, 34, 2.4);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (174, 'Eel Fresh', 685, 42, 4.6);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (175, 'Wine - Masi Valpolocell', 187, 19, 1.3);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (176, 'Pike - Frozen Fillet', 287, 41, 1.7);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (177, 'Wine - Shiraz South Eastern', 239, 27, 3.7);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (178, 'Squash - Sunburst', 194, 18, 3.6);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (179, 'Tart - Raisin And Pecan', 480, 30, 2.3);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (180, 'Sea Urchin', 900, 57, 1.3);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (181, 'Chick Peas - Dried', 794, 54, 3.5);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (182, 'Wine - Bourgogne 2002, La', 460, 55, 3.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (183, 'Cheese - Gorgonzola', 505, 25, 3.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (184, 'Cod - Salted, Boneless', 433, 12, 3.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (185, 'Fish - Scallops, Cold Smoked', 867, 84, 1.6);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (186, 'Banana - Leaves', 600, 34, 2.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (187, 'Yeast Dry - Fermipan', 38, 10, 3.3);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (188, 'Rum - Light, Captain Morgan', 514, 52, 2.6);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (189, 'Plasticknivesblack', 336, 50, 5.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (190, 'Foie Gras', 946, 40, 3.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (191, 'Compound - Rum', 552, 67, 1.2);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (192, 'Doilies - 12, Paper', 824, 22, 3.6);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (193, 'Beans - Fava, Canned', 187, 55, 2.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (194, 'Sour Puss - Tangerine', 317, 55, 3.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (195, 'Appetizer - Assorted Box', 130, 58, 1.8);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (196, 'Pail For Lid 1537', 474, 31, 3.4);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (197, 'Bread - Italian Sesame Poly', 565, 24, 2.6);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (198, 'Wine - Red, Black Opal Shiraz', 17, 25, 3.7);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (199, 'Napkin - Beverage 1 Ply', 886, 29, 1.0);
insert into product (product_id, product_name, product_price, product_stock, product_rating) values (200, 'Tomatoes - Vine Ripe, Yellow', 826, 90, 2.0);

-- SELECT * FROM product;

insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (1, 171, 49828, 'Wallet', 4.8);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (2, 149, 34508, 'Paytm', 9.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (3, 35, 44102, 'UPI', 9.8);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (4, 175, 39488, 'Wallet', 11.6);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (5, 12, 26537, 'UPI', 5.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (6, 123, 45630, 'Cash on Delivery', 10.8);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (7, 40, 10660, 'UPI', 12.0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (8, 80, 22224, 'Paytm', 8.1);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (9, 48, 48761, 'Net Banking', 1.6);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (10, 133, 41378, 'Wallet', 4.9);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (11, 185, 47269, 'Cash on Delivery', 9.9);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (12, 39, 21180, 'Paytm', 6.1);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (13, 97, 35812, 'UPI', 9.1);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (14, 198, 13227, 'UPI', 9.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (15, 24, 5018, 'Cash on Delivery', 12.0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (16, 73, 2115, 'Wallet', 7.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (17, 77, 47050, 'Cash on Delivery', 6.2);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (18, 47, 32056, 'Net Banking', 7.9);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (19, 62, 15648, 'UPI', 6.1);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (20, 4, 26965, 'Net Banking', 6.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (21, 162, 2815, 'UPI', 3.8);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (22, 43, 30530, 'Paytm', 3.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (23, 77, 26583, 'UPI', 9.9);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (24, 88, 21725, 'Paytm', 10.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (25, 173, 28396, 'Paytm', 7.0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (26, 38, 21599, 'UPI', 1.2);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (27, 185, 29154, 'Paytm', 5.0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (28, 18, 48473, 'Paytm', 2.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (29, 130, 40483, 'UPI', 11.6);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (30, 140, 32277, 'Cash on Delivery', 10.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (31, 58, 25310, 'UPI', 8.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (32, 175, 15729, 'Paytm', 10.8);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (33, 135, 39596, 'UPI', 10.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (34, 91, 25940, 'Paytm', 8.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (35, 197, 2808, 'Wallet', 3.2);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (36, 8, 44190, 'Cash on Delivery', 3.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (37, 166, 17531, 'Net Banking', 2.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (38, 62, 12501, 'Wallet', 2.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (39, 81, 21079, 'Net Banking', 5.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (40, 178, 19843, 'Paytm', 6.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (41, 159, 12106, 'Wallet', 10.0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (42, 35, 45994, 'UPI', 8.6);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (43, 114, 20393, 'Paytm', 11.2);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (44, 142, 26064, 'Wallet', 12.0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (45, 164, 905, 'Cash on Delivery', 6.0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (46, 193, 31704, 'Cash on Delivery', 10.6);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (47, 38, 3419, 'Wallet', 9.9);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (48, 22, 13040, 'Net Banking', 10.9);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (49, 171, 751, 'Net Banking', 4.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (50, 1, 12185, 'Wallet', 5.9);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (51, 165, 559, 'Net Banking', 10.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (52, 59, 7963, 'Net Banking', 3.5);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (53, 101, 31613, 'Paytm', 11.5);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (54, 71, 17816, 'Paytm', 9.5);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (55, 106, 41033, 'Net Banking', 2.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (56, 110, 41971, 'Cash on Delivery', 4.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (57, 152, 11810, 'Paytm', 8.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (58, 160, 5348, 'Wallet', 2.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (59, 94, 9112, 'Paytm', 3.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (60, 26, 39668, 'Net Banking', 4.0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (61, 43, 34127, 'Net Banking', 3.5);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (62, 47, 20969, 'Cash on Delivery', 9.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (63, 110, 38069, 'Net Banking', 7.8);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (64, 119, 32857, 'Net Banking', 2.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (65, 165, 28892, 'Cash on Delivery', 0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (66, 25, 8597, 'Wallet', 11.5);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (67, 7, 41637, 'Net Banking', 7.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (68, 96, 47303, 'Paytm', 7.2);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (69, 165, 6469, 'Net Banking', 9.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (70, 3, 12417, 'Wallet', 10.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (71, 191, 7282, 'Cash on Delivery', 10.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (72, 127, 2217, 'Cash on Delivery', 7.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (73, 85, 11103, 'Cash on Delivery', 6.9);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (74, 6, 24726, 'Wallet', 10.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (75, 146, 37217, 'Cash on Delivery', 8.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (76, 81, 15833, 'Paytm', 11.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (77, 47, 29044, 'Net Banking', 10.0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (78, 75, 9944, 'Paytm', 6.1);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (79, 138, 44304, 'Cash on Delivery', 10.0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (80, 70, 24424, 'Cash on Delivery', 11.8);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (81, 58, 11000, 'Cash on Delivery', 10.8);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (82, 65, 43229, 'UPI', 1.9);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (83, 151, 923, 'Cash on Delivery', 0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (84, 13, 24761, 'Paytm', 9.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (85, 195, 23640, 'Wallet', 4.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (86, 104, 26441, 'Paytm', 2.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (87, 52, 21715, 'Wallet', 9.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (88, 100, 1380, 'Wallet', 7.9);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (89, 196, 16025, 'Paytm', 10.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (90, 41, 22530, 'Net Banking', 10.2);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (91, 58, 3350, 'Cash on Delivery', 0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (92, 57, 30576, 'Wallet', 9.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (93, 37, 9198, 'Paytm', 10.5);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (94, 63, 35038, 'Wallet', 5.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (95, 58, 44572, 'UPI', 10.9);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (96, 51, 19543, 'Wallet', 2.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (97, 24, 24136, 'Net Banking', 11.9);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (98, 182, 16964, 'Cash on Delivery', 6.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (99, 66, 27303, 'Paytm', 6.2);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (100, 136, 183, 'Net Banking', 10.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (101, 169, 45034, 'Wallet', 11.0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (102, 18, 19421, 'UPI', 10.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (103, 157, 35168, 'Wallet', 2.9);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (104, 115, 17321, 'Wallet', 3.1);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (105, 16, 15885, 'UPI', 9.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (106, 162, 30421, 'UPI', 5.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (107, 90, 19260, 'UPI', 1.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (108, 74, 39426, 'Wallet', 3.1);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (109, 28, 46952, 'Wallet', 3.8);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (110, 10, 41568, 'Net Banking', 4.8);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (111, 110, 32978, 'UPI', 6.5);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (112, 88, 26835, 'UPI', 5.5);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (113, 52, 32474, 'UPI', 0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (114, 22, 7047, 'Paytm', 3.1);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (115, 138, 7472, 'Wallet', 8.6);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (116, 8, 3043, 'Net Banking', 3.0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (117, 49, 46875, 'Paytm', 10.1);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (118, 174, 20121, 'UPI', 11.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (119, 83, 12669, 'Cash on Delivery', 9.9);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (120, 13, 42419, 'Wallet', 10.2);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (121, 153, 25453, 'Wallet', 10.5);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (122, 168, 5124, 'Paytm', 3.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (123, 46, 9819, 'Paytm', 2.6);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (124, 94, 33555, 'UPI', 11.8);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (125, 75, 18478, 'Paytm', 1.6);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (126, 6, 476, 'Wallet', 5.6);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (127, 174, 3958, 'Cash on Delivery', 8.9);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (128, 38, 47625, 'Cash on Delivery', 50);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (129, 93, 44198, 'Net Banking', 1.6);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (130, 23, 22866, 'Paytm', 10.2);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (131, 93, 33079, 'Wallet', 5.0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (132, 15, 9688, 'Cash on Delivery', 11.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (133, 96, 16372, 'Net Banking', 9.1);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (134, 49, 14960, 'Net Banking', 5.9);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (135, 149, 29026, 'UPI', 10.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (136, 63, 18791, 'UPI', 3.5);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (137, 64, 12742, 'Paytm', 4.5);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (138, 77, 4006, 'Net Banking', 10.5);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (139, 196, 24076, 'Wallet', 7.8);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (140, 40, 30170, 'Wallet', 9.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (141, 97, 28177, 'UPI', 8.9);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (142, 176, 18893, 'UPI', 4.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (143, 93, 4783, 'Net Banking', 4.2);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (144, 113, 45409, 'Paytm', 4.5);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (145, 128, 6457, 'Net Banking', 2.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (146, 40, 11556, 'Wallet', 4.2);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (147, 73, 10018, 'Wallet', 8.1);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (148, 88, 46889, 'Net Banking', 5.2);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (149, 56, 9579, 'Cash on Delivery', 7.9);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (150, 35, 23215, 'UPI', 4.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (151, 180, 1635, 'Cash on Delivery', 9.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (152, 150, 16034, 'Net Banking', 4.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (153, 50, 31157, 'Cash on Delivery', 6.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (154, 132, 19632, 'Cash on Delivery', 4.1);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (155, 40, 43228, 'Wallet', 6.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (156, 52, 44050, 'Cash on Delivery', 10.0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (157, 20, 43996, 'Wallet', 7.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (158, 61, 11020, 'UPI', 1.0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (159, 22, 21944, 'Cash on Delivery', 2.6);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (160, 148, 25245, 'Wallet', 8.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (161, 80, 21960, 'Cash on Delivery', 5.5);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (162, 5, 47447, 'Net Banking', 8.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (163, 1, 36925, 'Net Banking', 2.0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (164, 108, 12807, 'Cash on Delivery', 5.6);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (165, 118, 26401, 'Paytm', 2.0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (166, 96, 30591, 'Cash on Delivery', 9.9);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (167, 72, 25538, 'Cash on Delivery', 5.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (168, 90, 16107, 'Paytm', 7.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (169, 143, 7358, 'Net Banking', 9.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (170, 16, 22927, 'UPI', 9.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (171, 150, 42099, 'UPI', 10.6);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (172, 151, 20904, 'Paytm', 4.0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (173, 58, 30842, 'Paytm', 1.9);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (174, 175, 19286, 'Cash on Delivery', 10.2);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (175, 150, 48684, 'UPI', 8.5);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (176, 86, 46266, 'UPI', 9.9);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (177, 94, 5553, 'Cash on Delivery', 5.8);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (178, 171, 31243, 'Wallet', 4.0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (179, 58, 36486, 'UPI', 1.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (180, 135, 6745, 'Wallet', 2.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (181, 160, 13145, 'UPI', 7.9);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (182, 43, 34637, 'Wallet', 7.8);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (183, 63, 21138, 'Cash on Delivery', 2.2);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (184, 9, 19294, 'Net Banking', 3.5);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (185, 31, 19483, 'Paytm', 5.5);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (186, 74, 22728, 'Cash on Delivery', 10.0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (187, 191, 19362, 'Net Banking', 5.0);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (188, 26, 35333, 'Net Banking', 11.8);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (189, 54, 21481, 'Net Banking', 4.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (190, 137, 14002, 'Paytm', 5.2);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (191, 59, 39811, 'Paytm', 5.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (192, 100, 34132, 'UPI', 6.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (193, 14, 9868, 'UPI', 1.6);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (194, 69, 46398, 'UPI', 9.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (195, 14, 10330, 'Wallet', 9.7);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (196, 187, 19373, 'Cash on Delivery', 6.3);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (197, 164, 39848, 'Paytm', 10.4);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (198, 64, 26962, 'Cash on Delivery', 9.2);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (199, 116, 13436, 'Cash on Delivery', 10.5);
insert into orders (order_id, product_id, order_total, mode_of_payment, no_of_days_to_deliver) values (200, 62, 35579, 'UPI', 5.0);

-- SELECT * FROM orders;

insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (1, 7, 23, 7.46, '3593238202', 'Jeff', 'Léane', 'Manuele');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (2, 72, 167, 4.81, '6088172490', 'Emera', 'Valérie', 'Dinnis');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (3, 92, 130, 3.13, '1778236469', 'Elfrieda', 'Garçon', 'Manser');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (4, 144, 81, 7.16, '7399943297', 'Nikita', 'Léana', 'Serrell');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (5, 16, 199, 3.04, '5665747831', 'Lorne', 'Céline', 'Ekins');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (6, 191, 19, 4.78, '2767123412', 'Lona', 'Eliès', 'Argyle');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (7, 11, 146, 6.91, '6461441671', 'Jeno', null, 'Albury');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (8, 16, 178, 3.94, '1313507224', 'Hollis', null, 'Faldo');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (9, 88, 78, 7.22, '5548038928', 'Bjorn', null, 'Brunn');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (10, 195, 130, 5.49, '5132901874', 'Gene', 'Méline', 'Worden');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (11, 112, 3, 1.51, '6007685861', 'Dionisio', null, 'Cownden');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (12, 20, 33, 2.1, '9109509207', 'Ardisj', null, 'McNamara');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (13, 46, 108, 6.36, '5303456417', 'Sutherland', null, 'Shinton');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (14, 146, 152, 3.0, '9113731324', 'Chip', null, 'Grundy');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (15, 91, 69, 5.47, '4146338410', 'Ashby', 'Mélanie', 'Chong');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (16, 181, 152, 9.18, '4512442805', 'Brig', null, 'Nordass');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (17, 35, 35, 2.47, '7033467356', 'Trevor', null, 'Keddey');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (18, 93, 125, 8.44, '8146584811', 'Margarita', 'Estève', 'McGuiney');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (19, 33, 12, 9.02, '5086778373', 'Lurline', 'Aurélie', 'Scothron');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (20, 121, 183, 6.91, '8039266059', 'Kasey', null, 'Cumbers');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (21, 77, 41, 9.16, '4683040786', 'Archaimbaud', 'Anaël', 'Caughte');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (22, 176, 123, 3.45, '6036904413', 'Alfi', null, 'Flint');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (23, 168, 35, 1.67, '7042062499', 'Kary', null, 'Earl');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (24, 124, 106, 1.09, '3468230390', 'Maynord', null, 'Vallentin');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (25, 13, 55, 1.8, '5594005247', 'Lief', null, 'Boij');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (26, 150, 49, 3.33, '4986032945', 'Magda', 'Méline', 'Cogdon');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (27, 35, 74, 2.28, '9424591689', 'Helene', 'Esbjörn', 'Roarty');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (28, 5, 42, 4.79, '2561066543', 'Brander', 'Renée', 'Kneebone');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (29, 46, 3, 6.53, '6443975172', 'Godwin', null, 'Garvie');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (30, 71, 91, 8.14, '8948127150', 'Cecelia', null, 'Josebury');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (31, 170, 63, 3.71, '8266691739', 'Dasi', 'Léane', 'Vedyaev');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (32, 3, 127, 1.36, '2149092500', 'Auroora', null, 'More');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (33, 194, 76, 3.95, '8127516473', 'Meghan', 'Maëlyss', 'Worner');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (34, 29, 74, 8.01, '6732520872', 'Koral', null, 'Cowburn');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (35, 124, 77, 1.48, '1929990900', 'Phillie', null, 'Kirlin');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (36, 175, 168, 4.85, '9333646261', 'Willi', 'Örjan', 'Franzelini');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (37, 75, 105, 6.34, '8017658509', 'Ardra', null, 'Peirpoint');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (38, 50, 157, 8.63, '9867328512', 'Basia', 'Maïlys', 'Inskipp');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (39, 167, 38, 4.62, '7113445613', 'Walt', null, 'Pointin');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (40, 79, 61, 7.8, '3457950242', 'Pooh', 'Mélanie', 'Puddan');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (41, 24, 191, 5.16, '7708619109', 'Erhard', 'Lài', 'Breeton');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (42, 158, 7, 1.1, '1499678533', 'Vale', 'Adélaïde', 'Brittain');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (43, 55, 4, 9.51, '2934808890', 'Cammie', null, 'Stoop');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (44, 53, 81, 8.56, '5422434180', 'Daniel', 'Sélène', 'Auton');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (45, 45, 40, 9.26, '9731936121', 'Mareah', 'Sòng', 'McGlue');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (46, 109, 178, 7.75, '5171942479', 'Marven', null, 'Woolcocks');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (47, 73, 63, 8.59, '3238692868', 'Cy', null, 'Hallaways');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (48, 84, 33, 6.16, '8965637307', 'Uriah', 'Bénédicte', 'Radden');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (49, 23, 86, 9.46, '6924328050', 'Matias', 'Mélys', 'Girardy');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (50, 58, 26, 3.15, '9312817433', 'Greer', null, 'Rylstone');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (51, 76, 12, 9.35, '6854793923', 'Fredek', null, 'Paddock');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (52, 31, 89, 7.89, '1135192680', 'Duane', 'Mélinda', 'Tregear');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (53, 65, 27, 3.81, '3952415057', 'Elvina', 'André', 'Lowdiane');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (54, 60, 185, 1.44, '2477353334', 'Gary', null, 'Polding');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (55, 193, 120, 7.84, '6333861874', 'Minni', 'Intéressant', 'Pittem');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (56, 24, 195, 5.31, '2719523687', 'Kaycee', null, 'Baugham');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (57, 27, 83, 3.11, '1914809040', 'Xaviera', null, 'Puttick');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (58, 93, 110, 9.73, '5269194940', 'Bale', null, 'Lethcoe');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (59, 84, 25, 7.65, '7157220576', 'Gilberta', 'Cécile', 'Gibson');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (60, 74, 39, 3.24, '9795396201', 'Lyndsie', null, 'Whyler');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (61, 168, 98, 5.28, '3738450925', 'Bone', null, 'O''Hallagan');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (62, 33, 33, 4.69, '9758477781', 'Joshua', null, 'Haysham');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (63, 125, 161, 9.91, '8265959991', 'Olivero', null, 'Mogford');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (64, 141, 99, 9.86, '7288262112', 'Billy', 'Rébecca', 'Elgood');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (65, 1, 146, 9.58, '5912173804', 'Aubry', 'Stéphanie', 'Herrero');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (66, 13, 26, 2.84, '1414743937', 'Purcell', null, 'Pinniger');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (67, 191, 17, 3.91, '8221784322', 'Denice', 'Méthode', 'Gilding');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (68, 118, 11, 5.82, '1436223249', 'Ava', null, 'MacMeanma');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (69, 110, 198, 6.21, '2437300435', 'Lillis', 'Léane', 'Mountstephen');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (70, 69, 138, 9.62, '5605913718', 'Viviana', null, 'Durbyn');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (71, 103, 84, 5.61, '4908868754', 'Svend', 'Anaëlle', 'Berthome');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (72, 97, 140, 7.88, '5755960445', 'Gabbie', null, 'Stangoe');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (73, 48, 1, 6.54, '9188847588', 'Bernette', null, 'Philcock');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (74, 155, 158, 7.08, '6625136537', 'Dov', 'Mélina', 'Gabits');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (75, 6, 157, 1.82, '1222569783', 'Sybille', 'Stéphanie', 'Picken');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (76, 164, 117, 8.68, '7891825885', 'Jandy', 'Méryl', 'Ludgrove');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (77, 85, 31, 5.21, '2727125984', 'Jedidiah', 'Anaé', 'Doncaster');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (78, 98, 112, 8.61, '7793955093', 'Dallas', 'Nuó', 'Hamnet');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (79, 63, 189, 9.09, '1524700429', 'Minnnie', 'Maïté', 'Skyme');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (80, 86, 81, 4.29, '9323864405', 'Candice', null, 'Ewington');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (81, 90, 158, 1.45, '2094235336', 'Hailee', 'Dafnée', 'Torresi');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (82, 169, 175, 6.72, '9615405542', 'Armando', 'Laurélie', 'Limprecht');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (83, 37, 54, 5.84, '7533551942', 'Carolann', 'Crééz', 'Le Grove');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (84, 55, 11, 3.19, '9861247735', 'Quentin', 'Lài', 'Skilbeck');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (85, 92, 58, 7.29, '6046139198', 'Trix', 'Táng', 'Astridge');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (86, 79, 166, 4.6, '3071737904', 'Kimberli', 'Estée', 'Cannings');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (87, 40, 172, 4.41, '6283491355', 'Eveleen', 'Léandre', 'Taysbil');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (88, 168, 181, 2.08, '8534361560', 'Elita', 'Torbjörn', 'Fahy');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (89, 161, 196, 6.85, '2285122133', 'Kassie', 'Vénus', 'Allright');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (90, 114, 9, 4.75, '9287669348', 'Emmalynn', null, 'Skipsea');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (91, 139, 60, 3.52, '1317229499', 'Silvie', 'Noémie', 'Dykes');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (92, 133, 131, 5.43, '8012220443', 'Gibby', 'Yú', 'De Giovanni');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (93, 71, 107, 5.17, '5505520656', 'Kimbell', 'Yè', 'Mixter');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (94, 66, 131, 6.81, '7363605871', 'Gennie', 'Mahélie', 'Issard');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (95, 69, 187, 1.14, '2125189688', 'De', null, 'Christaeas');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (96, 116, 188, 8.79, '7464646838', 'Kathrine', null, 'Tuke');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (97, 160, 132, 2.66, '4945976144', 'Ashly', null, 'Dilworth');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (98, 25, 168, 3.58, '1751758765', 'Cristine', 'Clémentine', 'Measor');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (99, 144, 134, 9.68, '9655495407', 'Curran', 'Örjan', 'Lord');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (100, 114, 186, 9.03, '9219892636', 'Fiorenze', 'Esbjörn', 'Fairweather');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (101, 174, 5, 7.48, '5409161952', 'Jefferson', null, 'Rittmeier');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (102, 182, 38, 7.65, '1268787374', 'Nicolle', 'Tán', 'Austin');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (103, 38, 158, 6.74, '5272925323', 'Maudie', null, 'Feldmesser');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (104, 194, 182, 9.99, '1186655095', 'Mar', 'Maïlis', 'Wyse');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (105, 196, 106, 7.54, '3124183984', 'Gigi', null, 'Blankenship');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (106, 8, 12, 6.85, '6907065453', 'Bibi', null, 'Elkington');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (107, 69, 9, 8.56, '3427890102', 'Osmund', 'Maëlann', 'Tunder');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (108, 37, 16, 3.48, '7964572654', 'Josselyn', 'Judicaël', 'Throughton');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (109, 89, 126, 1.75, '2081977377', 'Marian', 'Dafnée', 'Stilldale');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (110, 85, 51, 1.6, '5014911879', 'Stephan', 'Maïwenn', 'Grunwald');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (111, 122, 169, 8.07, '2793340131', 'Tucky', null, 'Vannah');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (112, 33, 27, 3.57, '7676189846', 'Delaney', 'Léone', 'Binestead');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (113, 131, 44, 5.46, '4044835503', 'Cheri', null, 'Wordington');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (114, 185, 138, 8.52, '8678703470', 'Forster', null, 'Orring');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (115, 28, 1, 5.4, '4154269855', 'Anya', null, 'Peasegood');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (116, 68, 132, 5.16, '2908610309', 'Elizabet', 'Irène', 'Oleksiak');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (117, 26, 149, 4.51, '9501860779', 'Charlotte', null, 'Glassford');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (118, 43, 108, 2.82, '6646461928', 'Madelena', 'Méline', 'Plummer');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (119, 174, 122, 5.61, '9104251431', 'Biron', 'Pélagie', 'Broggio');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (120, 144, 144, 4.89, '8324438876', 'Lauren', null, 'Villa');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (121, 68, 148, 3.07, '9988121721', 'Rodge', 'Joséphine', 'Arrighi');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (122, 59, 19, 1.47, '4355485078', 'Loria', 'Eléonore', 'Blackden');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (123, 106, 132, 3.05, '1152160216', 'Fianna', 'Åke', 'Lisciandri');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (124, 194, 21, 7.68, '5651198969', 'Nerta', 'Publicité', 'Dallmann');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (125, 164, 156, 3.57, '3769539312', 'Loria', 'Bérangère', 'Bernt');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (126, 76, 179, 8.02, '9243553744', 'Ermanno', 'Cécilia', 'McFall');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (127, 29, 148, 2.77, '7293208130', 'Donall', null, 'Vanyatin');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (128, 110, 155, 4.6, '9436467538', 'Beryle', null, 'Tweedell');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (129, 110, 116, 7.69, '7344027014', 'Desiree', null, 'O''Rourke');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (130, 126, 139, 7.0, '4878035361', 'Dodi', 'Stéphanie', 'Beagles');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (131, 170, 43, 4.32, '6041297300', 'Cully', null, 'Cumberledge');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (132, 169, 127, 3.39, '4217056351', 'Gabi', null, 'Caulkett');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (133, 168, 162, 3.29, '7743603036', 'Livvyy', 'Andréanne', 'Johnke');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (134, 66, 117, 1.9, '2947090183', 'Emilio', null, 'Lavigne');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (135, 12, 141, 9.55, '1085057100', 'Mercy', 'Maïly', 'Mehaffey');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (136, 135, 151, 6.53, '3003977581', 'Marcia', 'Mén', 'Heaker');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (137, 13, 100, 2.74, '9627380071', 'Clary', 'Réservés', 'Asbrey');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (138, 18, 30, 4.4, '9635224646', 'Patricio', 'Anaé', 'Twentyman');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (139, 108, 124, 7.41, '2527947563', 'Felita', null, 'Hrihorovich');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (140, 90, 71, 7.57, '6865111299', 'Eden', 'Cécile', 'Boribal');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (141, 22, 26, 5.68, '8662441489', 'Lion', null, 'Clackson');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (142, 155, 128, 5.3, '9282155984', 'Melva', null, 'Folomkin');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (143, 62, 24, 1.98, '9045921885', 'Myrtie', 'Athéna', 'Baude');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (144, 72, 55, 6.35, '7252045832', 'Anabal', null, 'Tozer');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (145, 99, 109, 5.99, '7584052248', 'Sybyl', null, 'Olford');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (146, 38, 163, 6.41, '2884613127', 'Britte', 'Cléopatre', 'Fendlow');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (147, 6, 122, 1.94, '4618696262', 'Elianore', null, 'D''Emanuele');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (148, 67, 68, 6.1, '5883593466', 'Alyce', 'Célestine', 'Peltzer');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (149, 21, 112, 8.13, '4984204747', 'Drusi', null, 'Prince');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (150, 121, 113, 5.04, '6921581954', 'Alejandro', null, 'Elward');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (151, 48, 80, 4.41, '6366364936', 'Adele', 'Mélina', 'Booy');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (152, 194, 67, 3.1, '6547121263', 'Lothaire', 'Clémentine', 'Farloe');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (153, 84, 120, 4.86, '5923885174', 'Louis', null, 'Pietrowski');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (154, 120, 61, 3.33, '6532585041', 'Pietro', 'Céline', 'Miguel');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (155, 35, 124, 5.85, '5284695963', 'Ezri', null, 'Roddell');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (156, 178, 92, 5.29, '5904925276', 'Nathanil', 'Uò', 'Eakens');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (157, 69, 97, 7.35, '5913597035', 'Rip', null, 'Deneve');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (158, 125, 97, 4.45, '6801767401', 'Drucy', null, 'Ales');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (159, 64, 57, 9.22, '3631714059', 'Antone', null, 'Tadgell');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (160, 90, 13, 3.47, '9853257973', 'Cesya', 'Noëlla', 'Greenly');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (161, 92, 130, 7.52, '6171241212', 'Hi', 'Mahélie', 'Womersley');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (162, 113, 31, 2.31, '4127485942', 'Philippe', 'Aimée', 'Djuricic');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (163, 59, 136, 2.41, '5283773423', 'Valida', 'Daphnée', 'Hickinbottom');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (164, 66, 41, 2.26, '6578488508', 'Evie', 'Léonore', 'Cordeux');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (165, 114, 30, 9.86, '4866682884', 'Melany', null, 'Beel');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (166, 87, 46, 8.86, '3581587196', 'Kalil', 'Naëlle', 'Hanbury');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (167, 26, 163, 9.4, '5819176737', 'Mile', 'Audréanne', 'Taks');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (168, 123, 14, 4.58, '9976856011', 'Milli', null, 'Ealam');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (169, 193, 185, 6.55, '5323840688', 'Christan', null, 'Swepstone');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (170, 93, 61, 3.96, '6363686084', 'Aurea', 'Anaël', 'Erlam');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (171, 29, 4, 7.89, '9133719087', 'Emanuele', 'Kù', 'Wilde');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (172, 141, 96, 2.43, '6322517708', 'Eugenius', null, 'Lacase');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (173, 30, 4, 1.31, '4835868984', 'Shalom', 'Örjan', 'Vedenyakin');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (174, 154, 21, 4.79, '9613638868', 'Niki', 'Cunégonde', 'Cromleholme');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (175, 118, 105, 1.6, '3412171514', 'Shane', 'Mélodie', 'Girodon');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (176, 68, 162, 5.52, '8232275079', 'Chantal', null, 'Learie');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (177, 22, 30, 5.79, '3286156105', 'Gaylord', null, 'Hinzer');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (178, 41, 84, 6.19, '4122993024', 'Jemimah', null, 'Itzkovitch');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (179, 144, 142, 6.0, '4554894380', 'Aliza', 'Marie-josée', 'Crampin');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (180, 142, 14, 8.73, '6011149301', 'Maximo', 'Yè', 'Wynch');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (181, 78, 180, 2.34, '6796755692', 'Dael', null, 'Cockland');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (182, 80, 61, 1.83, '4589370015', 'Hadleigh', 'Valérie', 'Ashdown');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (183, 35, 68, 4.8, '9636603281', 'Milissent', 'Liè', 'Cartan');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (184, 181, 123, 4.5, '5016106895', 'Maye', 'Estève', 'Scogin');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (185, 24, 75, 5.23, '7012168740', 'Danette', null, 'Konig');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (186, 51, 76, 7.92, '6935108804', 'Perl', 'Zoé', 'Mityukov');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (187, 7, 71, 6.74, '8917732152', 'Rolfe', 'Anaé', 'Edgerly');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (188, 158, 168, 7.07, '5449826376', 'Margery', 'Maëlle', 'Barabich');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (189, 95, 187, 4.34, '7223781073', 'Elizabeth', null, 'Guillon');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (190, 125, 41, 6.85, '7256607116', 'Eliot', 'Gaëlle', 'Roach');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (191, 200, 176, 4.88, '4682567455', 'Fielding', 'Bénédicte', 'Pilling');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (192, 98, 106, 8.43, '4594974938', 'Reeba', 'Táng', 'Fireman');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (193, 23, 18, 3.45, '1182828052', 'Ashlan', null, 'Wimpey');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (194, 22, 113, 7.04, '4388389857', 'Lida', 'Håkan', 'Budibent');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (195, 140, 178, 4.7, '7394592156', 'Myrle', 'Josée', 'O''Reagan');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (196, 55, 3, 9.43, '9528921526', 'Diana', null, 'Isbell');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (197, 101, 168, 9.21, '8216767344', 'Kirby', null, 'Koppelmann');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (198, 41, 116, 3.46, '8309268276', 'Kristofer', null, 'Faraker');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (199, 113, 17, 1.25, '7407680666', 'Gustave', null, 'Fergusson');
insert into delivery_agent (agent_id, customer_id, order_id, rating, mobile_number, fname, mname, lname) values (200, 35, 200, 4.97, '2359618812', 'Ashlin', null, 'Jaray');


-- SELECT * FROM delivery_agent;

insert into Admins (admin_id, order_id, product_id, username, pass) values (1, 19, 18, 'asteptowe0', 'MsTKeoj9');
insert into Admins (admin_id, order_id, product_id, username, pass) values (2, null, null, 'dedgerly1', '9BTcnxEEE');
insert into Admins (admin_id, order_id, product_id, username, pass) values (3, 30, 27, 'ctorrans2', 'MBf7PwqVJ');
insert into Admins (admin_id, order_id, product_id, username, pass) values (4, 128, 169, 'mdoley3', 'NYERHC9i');
insert into Admins (admin_id, order_id, product_id, username, pass) values (5, 76, 101, 'uabramchik4', '7QGn52wfjqRt');
insert into Admins (admin_id, order_id, product_id, username, pass) values (6, 18, 26, 'cdurant5', 'ECUCJN');
insert into Admins (admin_id, order_id, product_id, username, pass) values (7, null, null, 'dgannicott6', 'cdG5DvATuBpF');
insert into Admins (admin_id, order_id, product_id, username, pass) values (8, 46, 187, 'arounsivall7', 'HnYH7hBtCw');
insert into Admins (admin_id, order_id, product_id, username, pass) values (9, 114, 82, 'jfolcarelli8', '9m0149F');
insert into Admins (admin_id, order_id, product_id, username, pass) values (10, 152, 16, 'vzelland9', 'wGhKDC0Hr');
insert into Admins (admin_id, order_id, product_id, username, pass) values (11, 70, 13, 'ndemeada', 'W6UoU5fCLtkL');
insert into Admins (admin_id, order_id, product_id, username, pass) values (12, 84, 114, 'rfeechumb', 'm9koJCNyeG');
insert into Admins (admin_id, order_id, product_id, username, pass) values (13, 113, 34, 'sscamerdinec', 'y5szEQQ');
insert into Admins (admin_id, order_id, product_id, username, pass) values (14, 83, 149, 'ffayersd', 'AI4LNeZ');
insert into Admins (admin_id, order_id, product_id, username, pass) values (15, 163, 183, 'tdorneye', 'wOahQt5l');
insert into Admins (admin_id, order_id, product_id, username, pass) values (16, 58, 11, 'cjepensenf', '9ooitjCg');
insert into Admins (admin_id, order_id, product_id, username, pass) values (17, 116, 106, 'lyansonsg', '67t23B4axtm7');
insert into Admins (admin_id, order_id, product_id, username, pass) values (18, 144, 139, 'tstenetth', 'Cp6864I');
insert into Admins (admin_id, order_id, product_id, username, pass) values (19, 38, 54, 'gmcalpini', 'bhX7P8onp');
insert into Admins (admin_id, order_id, product_id, username, pass) values (20, null, null, 'gdechastelainj', 'lZiNnGgi5R');
insert into Admins (admin_id, order_id, product_id, username, pass) values (21, 113, 86, 'rpysonk', 'aJL6o35nibqq');
insert into Admins (admin_id, order_id, product_id, username, pass) values (22, 151, 1, 'kmankorl', 'OPeOXEsX');
insert into Admins (admin_id, order_id, product_id, username, pass) values (23, null, null, 'pwedgwoodm', 'fwJSNSB1skoa');
insert into Admins (admin_id, order_id, product_id, username, pass) values (24, 16, 1, 'kguildn', 'qIRGkEP');
insert into Admins (admin_id, order_id, product_id, username, pass) values (25, 81, 77, 'tollandero', 'O255TyECS');
insert into Admins (admin_id, order_id, product_id, username, pass) values (26, 168, 3, 'nshooterp', 'X9mEuJJWUIA');
insert into Admins (admin_id, order_id, product_id, username, pass) values (27, 121, 134, 'gbartoliniq', 'OTn9tbY');
insert into Admins (admin_id, order_id, product_id, username, pass) values (28, 131, 10, 'cdesvignesr', 'lDEPTfQYg');
insert into Admins (admin_id, order_id, product_id, username, pass) values (29, 5, 39, 'egayes', 'P2fgU1aE');
insert into Admins (admin_id, order_id, product_id, username, pass) values (30, 53, 142, 'cbenardeaut', 'PWFgRyN3i');
insert into Admins (admin_id, order_id, product_id, username, pass) values (31, 108, 18, 'semminesu', 'W6P8gTQa');
insert into Admins (admin_id, order_id, product_id, username, pass) values (32, 188, 119, 'gchickenv', 'bcJZkA');
insert into Admins (admin_id, order_id, product_id, username, pass) values (33, 47, 143, 'rpetitw', 'z9TerVbgXtTb');
insert into Admins (admin_id, order_id, product_id, username, pass) values (34, 197, 155, 'cruppertzx', 'FGb3qe');
insert into Admins (admin_id, order_id, product_id, username, pass) values (35, 106, 87, 'amccreadiey', 'uJvY97k');
insert into Admins (admin_id, order_id, product_id, username, pass) values (36, null, null, 'dgoodaz', 'yQw0FfTy5wR');
insert into Admins (admin_id, order_id, product_id, username, pass) values (37, 93, 163, 'rlared10', 'nDaRsDPu');
insert into Admins (admin_id, order_id, product_id, username, pass) values (38, 42, 120, 'mshadrach11', 'Kp8KgBj0');
insert into Admins (admin_id, order_id, product_id, username, pass) values (39, null, null, 'opinnock12', 'F3WkmK1IDIY');
insert into Admins (admin_id, order_id, product_id, username, pass) values (40, 91, 14, 'vpeggram13', 'eVkblm');
insert into Admins (admin_id, order_id, product_id, username, pass) values (41, 72, 36, 'ipyrke14', 'CQCx5BVqHJ');
insert into Admins (admin_id, order_id, product_id, username, pass) values (42, null, null, 'tgrouse15', 'Gmf3R5z3UFDu');
insert into Admins (admin_id, order_id, product_id, username, pass) values (43, 61, 143, 'ehaig16', 'OXs8EMd8QLP');
insert into Admins (admin_id, order_id, product_id, username, pass) values (44, 50, 23, 'ssima17', 'OOy7dqNk');
insert into Admins (admin_id, order_id, product_id, username, pass) values (45, 146, 26, 'alazarus18', 'MBIkRpKKlCt');
insert into Admins (admin_id, order_id, product_id, username, pass) values (46, 186, 156, 'ghevner19', 'fGJfrtYgROO');
insert into Admins (admin_id, order_id, product_id, username, pass) values (47, 11, 138, 'fprydie1a', 'M9gzWaVZa');
insert into Admins (admin_id, order_id, product_id, username, pass) values (48, 120, 122, 'dcursey1b', '1KFrSoTwm');
insert into Admins (admin_id, order_id, product_id, username, pass) values (49, null, null, 'rohrtmann1c', 'mdHgc1Q');
insert into Admins (admin_id, order_id, product_id, username, pass) values (50, 126, 32, 'adominy1d', 'gHuCj0');
insert into Admins (admin_id, order_id, product_id, username, pass) values (51, 193, 6, 'wdowber1e', 'EqFsz8J6X');
insert into Admins (admin_id, order_id, product_id, username, pass) values (52, 86, 128, 'bgrogan1f', 'eP4bRrd');
insert into Admins (admin_id, order_id, product_id, username, pass) values (53, 59, 58, 'hbruni1g', 'HpG1l9X96');
insert into Admins (admin_id, order_id, product_id, username, pass) values (54, 194, 109, 'vjikylls1h', 'pWPeoxBu');
insert into Admins (admin_id, order_id, product_id, username, pass) values (55, 30, 125, 'hbordis1i', 'kbxb0kyam2');
insert into Admins (admin_id, order_id, product_id, username, pass) values (56, 108, 28, 'trutland1j', 'H4N558');
insert into Admins (admin_id, order_id, product_id, username, pass) values (57, 193, 40, 'mfendt1k', 'U12V5U7RuJh');
insert into Admins (admin_id, order_id, product_id, username, pass) values (58, 185, 74, 'abiddwell1l', 'mPrP7qm8');
insert into Admins (admin_id, order_id, product_id, username, pass) values (59, 14, 29, 'ppedrick1m', 'z5kGG3S');
insert into Admins (admin_id, order_id, product_id, username, pass) values (60, 93, 15, 'wsheahan1n', 'Q4dcZ9A2T');
insert into Admins (admin_id, order_id, product_id, username, pass) values (61, 153, 108, 'cfavelle1o', 'XowpIjCJ');
insert into Admins (admin_id, order_id, product_id, username, pass) values (62, 91, 16, 'lvolet1p', 'IZiew2R');
insert into Admins (admin_id, order_id, product_id, username, pass) values (63, 9, 44, 'skiera1q', 'uJ2mBg');
insert into Admins (admin_id, order_id, product_id, username, pass) values (64, 51, 55, 'dwhittlesea1r', 'QRRhIJf');
insert into Admins (admin_id, order_id, product_id, username, pass) values (65, 164, 57, 'tmolfino1s', '4TcGy4XbT49');
insert into Admins (admin_id, order_id, product_id, username, pass) values (66, 152, 176, 'dtakos1t', 'GqkogP1FbO');
insert into Admins (admin_id, order_id, product_id, username, pass) values (67, 192, 22, 'dadelman1u', 'TwBkGWi3');
insert into Admins (admin_id, order_id, product_id, username, pass) values (68, 126, 65, 'csproule1v', 'uDmftj');
insert into Admins (admin_id, order_id, product_id, username, pass) values (69, 37, 70, 'pbazire1w', 'AR8uNivqZE');
insert into Admins (admin_id, order_id, product_id, username, pass) values (70, 100, 70, 'srubinovitch1x', '9qacmKf7');
insert into Admins (admin_id, order_id, product_id, username, pass) values (71, 150, 101, 'lcoetzee1y', '5agIxkQ');
insert into Admins (admin_id, order_id, product_id, username, pass) values (72, 114, 47, 'bstooke1z', 'UNdR1PIzaB');
insert into Admins (admin_id, order_id, product_id, username, pass) values (73, 127, 21, 'acatherick20', 'MtKeHArbHwgJ');
insert into Admins (admin_id, order_id, product_id, username, pass) values (74, 94, 97, 'arate21', 'ey8qnLGfJ65');
insert into Admins (admin_id, order_id, product_id, username, pass) values (75, 47, 103, 'gbrinkler22', '9YRGaEF4IRU');
insert into Admins (admin_id, order_id, product_id, username, pass) values (76, 99, 53, 'pvalentetti23', 'udec3a');
insert into Admins (admin_id, order_id, product_id, username, pass) values (77, null, null, 'hpawden24', 'iwjp7r');
insert into Admins (admin_id, order_id, product_id, username, pass) values (78, null, null, 'rhatch25', '0KwJFxvfz');
insert into Admins (admin_id, order_id, product_id, username, pass) values (79, 2, 113, 'kbottoms26', 'RZxBMSDV0UAw');
insert into Admins (admin_id, order_id, product_id, username, pass) values (80, 51, 57, 'byule27', '7hPlUtiUr');
insert into Admins (admin_id, order_id, product_id, username, pass) values (81, 49, 10, 'hglason28', 'D11SEE8xA4uj');
insert into Admins (admin_id, order_id, product_id, username, pass) values (82, 115, 117, 'mreece29', 'Yve7SC5XVic');
insert into Admins (admin_id, order_id, product_id, username, pass) values (83, 178, 186, 'mhorsewood2a', 'taeaVfg');
insert into Admins (admin_id, order_id, product_id, username, pass) values (84, 125, 93, 'lmackall2b', 'W65AjqG');
insert into Admins (admin_id, order_id, product_id, username, pass) values (85, 165, 110, 'cyitzhakov2c', 'BtdwJ3');
insert into Admins (admin_id, order_id, product_id, username, pass) values (86, 12, 162, 'naksell2d', 'wh6X8toycNEq');
insert into Admins (admin_id, order_id, product_id, username, pass) values (87, 186, 8, 'bsuston2e', 'wUYYq59Vr');
insert into Admins (admin_id, order_id, product_id, username, pass) values (88, 46, 1, 'shorning2f', 'M7Ul8qgE2Wz');
insert into Admins (admin_id, order_id, product_id, username, pass) values (89, 73, 35, 'ekinsman2g', '0ZmfKxcy5E');
insert into Admins (admin_id, order_id, product_id, username, pass) values (90, 19, 7, 'wthomen2h', 'oZEjAsbxwtPt');
insert into Admins (admin_id, order_id, product_id, username, pass) values (91, 145, 200, 'vpingstone2i', 'cAiW1ZAiD');
insert into Admins (admin_id, order_id, product_id, username, pass) values (92, 131, 66, 'blidgate2j', 'xrD0O53Lj');
insert into Admins (admin_id, order_id, product_id, username, pass) values (93, 6, 186, 'sbeamond2k', 'NutFe46or');
insert into Admins (admin_id, order_id, product_id, username, pass) values (94, 1, 91, 'hunger2l', 'FqKhUODH');
insert into Admins (admin_id, order_id, product_id, username, pass) values (95, 163, 189, 'tberre2m', 't1XtfT3sWWYt');
insert into Admins (admin_id, order_id, product_id, username, pass) values (96, 193, 114, 'wwroath2n', 'O4IphPEear');
insert into Admins (admin_id, order_id, product_id, username, pass) values (97, 151, 152, 'ejotham2o', 'NneeIfn91');
insert into Admins (admin_id, order_id, product_id, username, pass) values (98, 109, 31, 'pdevaney2p', 'drZzt2mKSs');
insert into Admins (admin_id, order_id, product_id, username, pass) values (99, 18, 168, 'bmacgraith2q', 'N46XKf');
insert into Admins (admin_id, order_id, product_id, username, pass) values (100, 38, 46, 'tdriffe2r', '6qx5K2OCN');
insert into Admins (admin_id, order_id, product_id, username, pass) values (101, 41, 56, 'jsorrill2s', 'aTL7jrNOUh');
insert into Admins (admin_id, order_id, product_id, username, pass) values (102, 89, 68, 'llimer2t', 'kIfnvw5is');
insert into Admins (admin_id, order_id, product_id, username, pass) values (103, 80, 188, 'educhateau2u', 'KteOTNeTzt1');
insert into Admins (admin_id, order_id, product_id, username, pass) values (104, 163, 185, 'mbending2v', '0oTsdZocW4G');
insert into Admins (admin_id, order_id, product_id, username, pass) values (105, 124, 44, 'ulabro2w', 'neVeuVvkAt');
insert into Admins (admin_id, order_id, product_id, username, pass) values (106, 94, 139, 'rdomanek2x', 'MdRuba8');
insert into Admins (admin_id, order_id, product_id, username, pass) values (107, 19, 152, 'abertome2y', 'fgTihSiRogq');
insert into Admins (admin_id, order_id, product_id, username, pass) values (108, 47, 38, 'scayzer2z', 'hycXWSmCqC');
insert into Admins (admin_id, order_id, product_id, username, pass) values (109, 190, 15, 'dbartke30', 'XXcP2t');
insert into Admins (admin_id, order_id, product_id, username, pass) values (110, null, null, 'dharrisson31', 'lCaOhEfv');
insert into Admins (admin_id, order_id, product_id, username, pass) values (111, 31, 74, 'kmakiver32', 'R18zg7eF7k');
insert into Admins (admin_id, order_id, product_id, username, pass) values (112, 153, 81, 'mrallings33', '8zdDFteucI3');
insert into Admins (admin_id, order_id, product_id, username, pass) values (113, 77, 49, 'xdoody34', '3Rq9yX13Z5T');
insert into Admins (admin_id, order_id, product_id, username, pass) values (114, 88, 193, 'sshovelin35', '5fcjF3EXf');
insert into Admins (admin_id, order_id, product_id, username, pass) values (115, 32, 30, 'freppaport36', 'TR5d1jVybl');
insert into Admins (admin_id, order_id, product_id, username, pass) values (116, null, null, 'dmale37', 'jGJBlg');
insert into Admins (admin_id, order_id, product_id, username, pass) values (117, 134, 3, 'dcosbey38', 'C4wQLiijl23');
insert into Admins (admin_id, order_id, product_id, username, pass) values (118, 104, 106, 'marnow39', 'VzrKTRTWG2');
insert into Admins (admin_id, order_id, product_id, username, pass) values (119, null, null, 'rpersitt3a', 'OVmZiaaB');
insert into Admins (admin_id, order_id, product_id, username, pass) values (120, 166, 131, 'gjewis3b', 'yBDMGN0VEh7');
insert into Admins (admin_id, order_id, product_id, username, pass) values (121, 28, 179, 'plebrun3c', '9ra6cz6012');
insert into Admins (admin_id, order_id, product_id, username, pass) values (122, 184, 63, 'dmckinney3d', 'DJhLznwZx');
insert into Admins (admin_id, order_id, product_id, username, pass) values (123, null, null, 'ebrennan3e', 'XWGZvn');
insert into Admins (admin_id, order_id, product_id, username, pass) values (124, 188, 104, 'lvarns3f', 'mcLx2ce');
insert into Admins (admin_id, order_id, product_id, username, pass) values (125, 23, 160, 'wdolling3g', 'BmBzGjuC');
insert into Admins (admin_id, order_id, product_id, username, pass) values (126, 15, 65, 'kbeake3h', 'l4n42KfQMY');
insert into Admins (admin_id, order_id, product_id, username, pass) values (127, 173, 79, 'taccombe3i', '2pcwPdV8u3');
insert into Admins (admin_id, order_id, product_id, username, pass) values (128, 142, 100, 'dpelosi3j', 'gfTcblA');
insert into Admins (admin_id, order_id, product_id, username, pass) values (129, 131, 57, 'dmcure3k', 'hNHCckW');
insert into Admins (admin_id, order_id, product_id, username, pass) values (130, null, null, 'acuolahan3l', 'inqGTd0O');
insert into Admins (admin_id, order_id, product_id, username, pass) values (131, null, null, 'bpuncher3m', 'IpPelC');
insert into Admins (admin_id, order_id, product_id, username, pass) values (132, 141, 43, 'budale3n', 'vH1lqp');
insert into Admins (admin_id, order_id, product_id, username, pass) values (133, 45, 88, 'ibeauly3o', 'ApLSh0J8');
insert into Admins (admin_id, order_id, product_id, username, pass) values (134, 181, 133, 'aterrazzo3p', 'JyemQz1ftkSA');
insert into Admins (admin_id, order_id, product_id, username, pass) values (135, 21, 200, 'lkiellor3q', 'MLlYVJ');
insert into Admins (admin_id, order_id, product_id, username, pass) values (136, 131, 179, 'rkesby3r', 'fZhPAPy');
insert into Admins (admin_id, order_id, product_id, username, pass) values (137, 48, 53, 'sdockwray3s', '9lplYDWjJT');
insert into Admins (admin_id, order_id, product_id, username, pass) values (138, 176, 101, 'kjenckes3t', 'ZWOvahnBSnuY');
insert into Admins (admin_id, order_id, product_id, username, pass) values (139, 154, 135, 'fdurning3u', 'hfwyYtzGV7');
insert into Admins (admin_id, order_id, product_id, username, pass) values (140, 96, 167, 'wuzelli3v', 'VZQekjKK');
insert into Admins (admin_id, order_id, product_id, username, pass) values (141, 85, 105, 'emieville3w', 'OC0Qo0');
insert into Admins (admin_id, order_id, product_id, username, pass) values (142, 58, 96, 'ghutchinges3x', 'tzNkzK7N');
insert into Admins (admin_id, order_id, product_id, username, pass) values (143, 107, 12, 'jgehrtz3y', 'If52w8');
insert into Admins (admin_id, order_id, product_id, username, pass) values (144, 141, 187, 'gguilayn3z', 'm6OlZy');
insert into Admins (admin_id, order_id, product_id, username, pass) values (145, 64, 58, 'lbon40', 'Qc4tgz3t');
insert into Admins (admin_id, order_id, product_id, username, pass) values (146, 111, 66, 'tsouthernwood41', 'iASsR1');
insert into Admins (admin_id, order_id, product_id, username, pass) values (147, 184, 9, 'shast42', 'l3NU27');
insert into Admins (admin_id, order_id, product_id, username, pass) values (148, null, null, 'fjiran43', '0Hw0WnQZ');
insert into Admins (admin_id, order_id, product_id, username, pass) values (149, 58, 116, 'kcoales44', 'o5UST3gDbRO');
insert into Admins (admin_id, order_id, product_id, username, pass) values (150, 65, 15, 'gwhittleton45', 'iwxLxXoOp31p');
insert into Admins (admin_id, order_id, product_id, username, pass) values (151, 137, 19, 'rnaisbit46', '7QQTpDIoGhy4');
insert into Admins (admin_id, order_id, product_id, username, pass) values (152, 163, 152, 'lvittery47', 'EoMPezF3');
insert into Admins (admin_id, order_id, product_id, username, pass) values (153, 134, 114, 'pkerwick48', 'lgQcAWdYoy');
insert into Admins (admin_id, order_id, product_id, username, pass) values (154, 138, 103, 'fstoddard49', 'Obxm4uydS');
insert into Admins (admin_id, order_id, product_id, username, pass) values (155, 32, 96, 'lwittrington4a', 'bebddTCcAI');
insert into Admins (admin_id, order_id, product_id, username, pass) values (156, 144, 130, 'ceilhart4b', 'yw33Wb');
insert into Admins (admin_id, order_id, product_id, username, pass) values (157, 131, 85, 'vreddington4c', '8snFz7Sq');
insert into Admins (admin_id, order_id, product_id, username, pass) values (158, 164, 103, 'aussher4d', '6XAMpMJnSEh');
insert into Admins (admin_id, order_id, product_id, username, pass) values (159, 14, 6, 'sbutting4e', 'FCmpGygihfGT');
insert into Admins (admin_id, order_id, product_id, username, pass) values (160, 131, 53, 'ntoll4f', 'Bt7qI1QEymwC');
insert into Admins (admin_id, order_id, product_id, username, pass) values (161, 101, 85, 'bboone4g', 'eOGXSd');
insert into Admins (admin_id, order_id, product_id, username, pass) values (162, 78, 197, 'asweedy4h', '2HP5jO');
insert into Admins (admin_id, order_id, product_id, username, pass) values (163, 53, 105, 'ekiff4i', 'ZLGWwCfSYhGv');
insert into Admins (admin_id, order_id, product_id, username, pass) values (164, 191, 168, 'oleban4j', '1mOq7yj5jdvg');
insert into Admins (admin_id, order_id, product_id, username, pass) values (165, 90, 11, 'dsprackling4k', 'YX2NA6DY');
insert into Admins (admin_id, order_id, product_id, username, pass) values (166, 114, 187, 'omatthensen4l', 'RzTAq76fs0h');
insert into Admins (admin_id, order_id, product_id, username, pass) values (167, 65, 55, 'sletchmore4m', 'QjzHkUaQ');
insert into Admins (admin_id, order_id, product_id, username, pass) values (168, 114, 1, 'eclaridge4n', 'VNjLT0nrZ');
insert into Admins (admin_id, order_id, product_id, username, pass) values (169, null, null, 'cminshaw4o', 'WQLA6r4cpE');
insert into Admins (admin_id, order_id, product_id, username, pass) values (170, 95, 129, 'dtremblett4p', 'gsRsxR52');
insert into Admins (admin_id, order_id, product_id, username, pass) values (171, 23, 44, 'ebeckwith4q', 'yXDgO4eJ8gH');
insert into Admins (admin_id, order_id, product_id, username, pass) values (172, 77, 84, 'acunnington4r', 'rWANouvHbZNB');
insert into Admins (admin_id, order_id, product_id, username, pass) values (173, 73, 185, 'kboydon4s', '52vJpP81L');
insert into Admins (admin_id, order_id, product_id, username, pass) values (174, null, null, 'lhubber4t', 'XbGRDGj');
insert into Admins (admin_id, order_id, product_id, username, pass) values (175, 150, 178, 'lvallack4u', 'xRxbDpk5DXH');
insert into Admins (admin_id, order_id, product_id, username, pass) values (176, 32, 132, 'imackain4v', 'aTXXy5NLB');
insert into Admins (admin_id, order_id, product_id, username, pass) values (177, 168, 159, 'cbaines4w', 'HtHLj5Mk');
insert into Admins (admin_id, order_id, product_id, username, pass) values (178, 50, 192, 'lbickle4x', 'HrSByHgeeOao');
insert into Admins (admin_id, order_id, product_id, username, pass) values (179, 175, 124, 'fstoakes4y', 'vRy75ifxe');
insert into Admins (admin_id, order_id, product_id, username, pass) values (180, null, null, 'cheinle4z', 'gLUGrl');
insert into Admins (admin_id, order_id, product_id, username, pass) values (181, 132, 148, 'atiler50', 'n5o8hkilpDo');
insert into Admins (admin_id, order_id, product_id, username, pass) values (182, 193, 49, 'jcurrell51', 'UkpDsysxa');
insert into Admins (admin_id, order_id, product_id, username, pass) values (183, 127, 62, 'dthouless52', '4lmheglr4F');
insert into Admins (admin_id, order_id, product_id, username, pass) values (184, 11, 27, 'rmacdunleavy53', 'kXWrgKGtK');
insert into Admins (admin_id, order_id, product_id, username, pass) values (185, 98, 169, 'hmcclounan54', 'Jwe1tPrxreyD');
insert into Admins (admin_id, order_id, product_id, username, pass) values (186, null, null, 'bchippindale55', 'pv0z3lRxQq6');
insert into Admins (admin_id, order_id, product_id, username, pass) values (187, 179, 118, 'acheston56', 'ITWAihUTnJ');
insert into Admins (admin_id, order_id, product_id, username, pass) values (188, 128, 173, 'adelayglesias57', 'bllmCmz6');
insert into Admins (admin_id, order_id, product_id, username, pass) values (189, 168, 48, 'mdurrant58', 'vjk86POK');
insert into Admins (admin_id, order_id, product_id, username, pass) values (190, 4, 142, 'magent59', 'XMThzZgZe');
insert into Admins (admin_id, order_id, product_id, username, pass) values (191, 146, 101, 'rgoaley5a', '1yC27gIp');
insert into Admins (admin_id, order_id, product_id, username, pass) values (192, 128, 160, 'shyndley5b', '1sr4LqJ9wv');
insert into Admins (admin_id, order_id, product_id, username, pass) values (193, 36, 100, 'afreeburn5c', 'qeFhMeYMNYdu');
insert into Admins (admin_id, order_id, product_id, username, pass) values (194, 124, 81, 'svenes5d', 'cqA8QtC6av');
insert into Admins (admin_id, order_id, product_id, username, pass) values (195, 97, 179, 'dwadwell5e', 'mcHgxe2');
insert into Admins (admin_id, order_id, product_id, username, pass) values (196, 2, 136, 'mboleyn5f', 'lkK5WCIztwD');
insert into Admins (admin_id, order_id, product_id, username, pass) values (197, 109, 9, 'cbeall5g', 'j4TjsIj');
insert into Admins (admin_id, order_id, product_id, username, pass) values (198, 104, 149, 'zmcterrelly5h', 'dbQECc9P2');
insert into Admins (admin_id, order_id, product_id, username, pass) values (199, 120, 191, 'ebolletti5i', 'vfVI8F');
insert into Admins (admin_id, order_id, product_id, username, pass) values (200, 110, 75, 'bzotto5j', 'OdYDpC');

-- SELECT * FROM Admins;


insert into wallet (customer_id, transaction_amount, balance) values (1, 4365, 90382);
insert into wallet (customer_id, transaction_amount, balance) values (2, 679, 73924);
insert into wallet (customer_id, transaction_amount, balance) values (3, 1558, 42836);
insert into wallet (customer_id, transaction_amount, balance) values (4, 3603, 71447);
insert into wallet (customer_id, transaction_amount, balance) values (5, 7795, 96006);
insert into wallet (customer_id, transaction_amount, balance) values (6, 528, 2950);
insert into wallet (customer_id, transaction_amount, balance) values (7, 7106, 53533);
insert into wallet (customer_id, transaction_amount, balance) values (8, 5353, 26269);
insert into wallet (customer_id, transaction_amount, balance) values (9, 9859, 5605);
insert into wallet (customer_id, transaction_amount, balance) values (10, 3079, 42676);
insert into wallet (customer_id, transaction_amount, balance) values (11, 213, 39441);
insert into wallet (customer_id, transaction_amount, balance) values (12, 7649, 99787);
insert into wallet (customer_id, transaction_amount, balance) values (13, 6503, 40024);
insert into wallet (customer_id, transaction_amount, balance) values (14, 527, 53192);
insert into wallet (customer_id, transaction_amount, balance) values (15, 320, 72821);
insert into wallet (customer_id, transaction_amount, balance) values (16, 6235, 16816);
insert into wallet (customer_id, transaction_amount, balance) values (17, 7868, 2548);
insert into wallet (customer_id, transaction_amount, balance) values (18, 7178, 22069);
insert into wallet (customer_id, transaction_amount, balance) values (19, 2350, 31246);
insert into wallet (customer_id, transaction_amount, balance) values (20, 1174, 4073);
insert into wallet (customer_id, transaction_amount, balance) values (21, 1492, 15678);
insert into wallet (customer_id, transaction_amount, balance) values (22, 5977, 66665);
insert into wallet (customer_id, transaction_amount, balance) values (23, 5267, 28885);
insert into wallet (customer_id, transaction_amount, balance) values (24, 6586, 51094);
insert into wallet (customer_id, transaction_amount, balance) values (25, 4122, 73289);
insert into wallet (customer_id, transaction_amount, balance) values (26, 4591, 56827);
insert into wallet (customer_id, transaction_amount, balance) values (27, 2663, 20770);
insert into wallet (customer_id, transaction_amount, balance) values (28, 3587, 78890);
insert into wallet (customer_id, transaction_amount, balance) values (29, 3910, 90264);
insert into wallet (customer_id, transaction_amount, balance) values (30, 1901, 73715);
insert into wallet (customer_id, transaction_amount, balance) values (31, 1526, 4817);
insert into wallet (customer_id, transaction_amount, balance) values (32, 1888, 49837);
insert into wallet (customer_id, transaction_amount, balance) values (33, 7714, 60064);
insert into wallet (customer_id, transaction_amount, balance) values (34, 6608, 89038);
insert into wallet (customer_id, transaction_amount, balance) values (35, 5509, 40443);
insert into wallet (customer_id, transaction_amount, balance) values (36, 6052, 93843);
insert into wallet (customer_id, transaction_amount, balance) values (37, 2722, 25577);
insert into wallet (customer_id, transaction_amount, balance) values (38, 18, 57289);
insert into wallet (customer_id, transaction_amount, balance) values (39, 1320, 72581);
insert into wallet (customer_id, transaction_amount, balance) values (40, 2413, 70737);
insert into wallet (customer_id, transaction_amount, balance) values (41, 732, 21112);
insert into wallet (customer_id, transaction_amount, balance) values (42, 5822, 38286);
insert into wallet (customer_id, transaction_amount, balance) values (43, 7475, 31545);
insert into wallet (customer_id, transaction_amount, balance) values (44, 1931, 16520);
insert into wallet (customer_id, transaction_amount, balance) values (45, 8653, 64395);
insert into wallet (customer_id, transaction_amount, balance) values (46, 8008, 32371);
insert into wallet (customer_id, transaction_amount, balance) values (47, 9898, 47351);
insert into wallet (customer_id, transaction_amount, balance) values (48, 6991, 75164);
insert into wallet (customer_id, transaction_amount, balance) values (49, 4669, 51699);
insert into wallet (customer_id, transaction_amount, balance) values (50, 5126, 54094);
insert into wallet (customer_id, transaction_amount, balance) values (51, 7444, 55191);
insert into wallet (customer_id, transaction_amount, balance) values (52, 4822, 26298);
insert into wallet (customer_id, transaction_amount, balance) values (53, 5460, 95370);
insert into wallet (customer_id, transaction_amount, balance) values (54, 4034, 71311);
insert into wallet (customer_id, transaction_amount, balance) values (55, 1192, 76241);
insert into wallet (customer_id, transaction_amount, balance) values (56, 5717, 55461);
insert into wallet (customer_id, transaction_amount, balance) values (57, 2867, 64871);
insert into wallet (customer_id, transaction_amount, balance) values (58, 8818, 89726);
insert into wallet (customer_id, transaction_amount, balance) values (59, 7455, 7577);
insert into wallet (customer_id, transaction_amount, balance) values (60, 1645, 21056);
insert into wallet (customer_id, transaction_amount, balance) values (61, 2365, 91986);
insert into wallet (customer_id, transaction_amount, balance) values (62, 4282, 65884);
insert into wallet (customer_id, transaction_amount, balance) values (63, 4716, 34222);
insert into wallet (customer_id, transaction_amount, balance) values (64, 3508, 13733);
insert into wallet (customer_id, transaction_amount, balance) values (65, 9195, 60281);
insert into wallet (customer_id, transaction_amount, balance) values (66, 2471, 22120);
insert into wallet (customer_id, transaction_amount, balance) values (67, 4137, 63738);
insert into wallet (customer_id, transaction_amount, balance) values (68, 8021, 49487);
insert into wallet (customer_id, transaction_amount, balance) values (69, 5430, 46652);
insert into wallet (customer_id, transaction_amount, balance) values (70, 2536, 74019);
insert into wallet (customer_id, transaction_amount, balance) values (71, 3516, 21795);
insert into wallet (customer_id, transaction_amount, balance) values (72, 7749, 55329);
insert into wallet (customer_id, transaction_amount, balance) values (73, 9244, 35910);
insert into wallet (customer_id, transaction_amount, balance) values (74, 6157, 77409);
insert into wallet (customer_id, transaction_amount, balance) values (75, 6910, 940);
insert into wallet (customer_id, transaction_amount, balance) values (76, 9141, 899);
insert into wallet (customer_id, transaction_amount, balance) values (77, 570, 27909);
insert into wallet (customer_id, transaction_amount, balance) values (78, 8562, 97027);
insert into wallet (customer_id, transaction_amount, balance) values (79, 3676, 92326);
insert into wallet (customer_id, transaction_amount, balance) values (80, 9924, 61759);
insert into wallet (customer_id, transaction_amount, balance) values (81, 5310, 46268);
insert into wallet (customer_id, transaction_amount, balance) values (82, 9177, 39106);
insert into wallet (customer_id, transaction_amount, balance) values (83, 3043, 59917);
insert into wallet (customer_id, transaction_amount, balance) values (84, 194, 25024);
insert into wallet (customer_id, transaction_amount, balance) values (85, 2399, 45766);
insert into wallet (customer_id, transaction_amount, balance) values (86, 7021, 98196);
insert into wallet (customer_id, transaction_amount, balance) values (87, 1080, 59628);
insert into wallet (customer_id, transaction_amount, balance) values (88, 3973, 82827);
insert into wallet (customer_id, transaction_amount, balance) values (89, 6067, 28545);
insert into wallet (customer_id, transaction_amount, balance) values (90, 9908, 30951);
insert into wallet (customer_id, transaction_amount, balance) values (91, 7445, 60399);
insert into wallet (customer_id, transaction_amount, balance) values (92, 3571, 95985);
insert into wallet (customer_id, transaction_amount, balance) values (93, 1959, 61308);
insert into wallet (customer_id, transaction_amount, balance) values (94, 1434, 35379);
insert into wallet (customer_id, transaction_amount, balance) values (95, 2321, 73639);
insert into wallet (customer_id, transaction_amount, balance) values (96, 7411, 9446);
insert into wallet (customer_id, transaction_amount, balance) values (97, 9140, 47090);
insert into wallet (customer_id, transaction_amount, balance) values (98, 642, 64992);
insert into wallet (customer_id, transaction_amount, balance) values (99, 4089, 94087);
insert into wallet (customer_id, transaction_amount, balance) values (100, 5429, 26880);
insert into wallet (customer_id, transaction_amount, balance) values (101, 846, 12778);
insert into wallet (customer_id, transaction_amount, balance) values (102, 4531, 90639);
insert into wallet (customer_id, transaction_amount, balance) values (103, 2787, 49766);
insert into wallet (customer_id, transaction_amount, balance) values (104, 7403, 90259);
insert into wallet (customer_id, transaction_amount, balance) values (105, 4955, 53858);
insert into wallet (customer_id, transaction_amount, balance) values (106, 9763, 80996);
insert into wallet (customer_id, transaction_amount, balance) values (107, 7711, 44649);
insert into wallet (customer_id, transaction_amount, balance) values (108, 3173, 2817);
insert into wallet (customer_id, transaction_amount, balance) values (109, 6049, 97209);
insert into wallet (customer_id, transaction_amount, balance) values (110, 1089, 21733);
insert into wallet (customer_id, transaction_amount, balance) values (111, 148, 24738);
insert into wallet (customer_id, transaction_amount, balance) values (112, 3269, 53363);
insert into wallet (customer_id, transaction_amount, balance) values (113, 4068, 27491);
insert into wallet (customer_id, transaction_amount, balance) values (114, 8141, 74830);
insert into wallet (customer_id, transaction_amount, balance) values (115, 4508, 58438);
insert into wallet (customer_id, transaction_amount, balance) values (116, 7682, 59282);
insert into wallet (customer_id, transaction_amount, balance) values (117, 3368, 1222);
insert into wallet (customer_id, transaction_amount, balance) values (118, 9513, 79144);
insert into wallet (customer_id, transaction_amount, balance) values (119, 4298, 6608);
insert into wallet (customer_id, transaction_amount, balance) values (120, 9950, 78092);
insert into wallet (customer_id, transaction_amount, balance) values (121, 3023, 11866);
insert into wallet (customer_id, transaction_amount, balance) values (122, 5424, 98066);
insert into wallet (customer_id, transaction_amount, balance) values (123, 3392, 68268);
insert into wallet (customer_id, transaction_amount, balance) values (124, 9441, 63310);
insert into wallet (customer_id, transaction_amount, balance) values (125, 8929, 59714);
insert into wallet (customer_id, transaction_amount, balance) values (126, 9989, 86026);
insert into wallet (customer_id, transaction_amount, balance) values (127, 6356, 9703);
insert into wallet (customer_id, transaction_amount, balance) values (128, 9465, 6384);
insert into wallet (customer_id, transaction_amount, balance) values (129, 8125, 76182);
insert into wallet (customer_id, transaction_amount, balance) values (130, 1096, 56638);
insert into wallet (customer_id, transaction_amount, balance) values (131, 196, 55245);
insert into wallet (customer_id, transaction_amount, balance) values (132, 1475, 14480);
insert into wallet (customer_id, transaction_amount, balance) values (133, 4874, 63503);
insert into wallet (customer_id, transaction_amount, balance) values (134, 5918, 75646);
insert into wallet (customer_id, transaction_amount, balance) values (135, 1545, 70777);
insert into wallet (customer_id, transaction_amount, balance) values (136, 5846, 57823);
insert into wallet (customer_id, transaction_amount, balance) values (137, 885, 86803);
insert into wallet (customer_id, transaction_amount, balance) values (138, 7602, 58606);
insert into wallet (customer_id, transaction_amount, balance) values (139, 625, 62122);
insert into wallet (customer_id, transaction_amount, balance) values (140, 7320, 51008);
insert into wallet (customer_id, transaction_amount, balance) values (141, 9729, 93061);
insert into wallet (customer_id, transaction_amount, balance) values (142, 6483, 58629);
insert into wallet (customer_id, transaction_amount, balance) values (143, 8368, 41322);
insert into wallet (customer_id, transaction_amount, balance) values (144, 7076, 37786);
insert into wallet (customer_id, transaction_amount, balance) values (145, 8002, 19816);
insert into wallet (customer_id, transaction_amount, balance) values (146, 4494, 76074);
insert into wallet (customer_id, transaction_amount, balance) values (147, 2210, 47780);
insert into wallet (customer_id, transaction_amount, balance) values (148, 3919, 16503);
insert into wallet (customer_id, transaction_amount, balance) values (149, 596, 83384);
insert into wallet (customer_id, transaction_amount, balance) values (150, 6056, 16637);
insert into wallet (customer_id, transaction_amount, balance) values (151, 3433, 1997);
insert into wallet (customer_id, transaction_amount, balance) values (152, 2681, 34588);
insert into wallet (customer_id, transaction_amount, balance) values (153, 7362, 50272);
insert into wallet (customer_id, transaction_amount, balance) values (154, 7098, 7449);
insert into wallet (customer_id, transaction_amount, balance) values (155, 9620, 15273);
insert into wallet (customer_id, transaction_amount, balance) values (156, 8322, 90364);
insert into wallet (customer_id, transaction_amount, balance) values (157, 1987, 22043);
insert into wallet (customer_id, transaction_amount, balance) values (158, 3204, 35898);
insert into wallet (customer_id, transaction_amount, balance) values (159, 7718, 41600);
insert into wallet (customer_id, transaction_amount, balance) values (160, 7525, 55938);
insert into wallet (customer_id, transaction_amount, balance) values (161, 4584, 96938);
insert into wallet (customer_id, transaction_amount, balance) values (162, 5113, 48627);
insert into wallet (customer_id, transaction_amount, balance) values (163, 5491, 86375);
insert into wallet (customer_id, transaction_amount, balance) values (164, 94, 19623);
insert into wallet (customer_id, transaction_amount, balance) values (165, 4706, 26348);
insert into wallet (customer_id, transaction_amount, balance) values (166, 1635, 22746);
insert into wallet (customer_id, transaction_amount, balance) values (167, 9713, 73558);
insert into wallet (customer_id, transaction_amount, balance) values (168, 8854, 26048);
insert into wallet (customer_id, transaction_amount, balance) values (169, 6173, 59208);
insert into wallet (customer_id, transaction_amount, balance) values (170, 6761, 93764);
insert into wallet (customer_id, transaction_amount, balance) values (171, 2412, 93506);
insert into wallet (customer_id, transaction_amount, balance) values (172, 5097, 45604);
insert into wallet (customer_id, transaction_amount, balance) values (173, 1690, 5075);
insert into wallet (customer_id, transaction_amount, balance) values (174, 2109, 84976);
insert into wallet (customer_id, transaction_amount, balance) values (175, 253, 77622);
insert into wallet (customer_id, transaction_amount, balance) values (176, 8849, 97619);
insert into wallet (customer_id, transaction_amount, balance) values (177, 4646, 76081);
insert into wallet (customer_id, transaction_amount, balance) values (178, 8929, 57551);
insert into wallet (customer_id, transaction_amount, balance) values (179, 2450, 4752);
insert into wallet (customer_id, transaction_amount, balance) values (180, 5114, 91807);
insert into wallet (customer_id, transaction_amount, balance) values (181, 9493, 88677);
insert into wallet (customer_id, transaction_amount, balance) values (182, 2758, 38251);
insert into wallet (customer_id, transaction_amount, balance) values (183, 6186, 1269);
insert into wallet (customer_id, transaction_amount, balance) values (184, 2331, 41554);
insert into wallet (customer_id, transaction_amount, balance) values (185, 5455, 68331);
insert into wallet (customer_id, transaction_amount, balance) values (186, 9316, 24923);
insert into wallet (customer_id, transaction_amount, balance) values (187, 4593, 83414);
insert into wallet (customer_id, transaction_amount, balance) values (188, 787, 29270);
insert into wallet (customer_id, transaction_amount, balance) values (189, 9543, 43014);
insert into wallet (customer_id, transaction_amount, balance) values (190, 6380, 32029);
insert into wallet (customer_id, transaction_amount, balance) values (191, 2036, 29414);
insert into wallet (customer_id, transaction_amount, balance) values (192, 9771, 24489);
insert into wallet (customer_id, transaction_amount, balance) values (193, 8064, 73483);
insert into wallet (customer_id, transaction_amount, balance) values (194, 4871, 48111);
insert into wallet (customer_id, transaction_amount, balance) values (195, 3233, 32918);
insert into wallet (customer_id, transaction_amount, balance) values (196, 7734, 49889);
insert into wallet (customer_id, transaction_amount, balance) values (197, 3684, 54320);
insert into wallet (customer_id, transaction_amount, balance) values (198, 965, 69894);
insert into wallet (customer_id, transaction_amount, balance) values (199, 233, 25015);

-- SELECT * FROM wallet;

insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (119, 38, 12, 91, 9.55);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (50, 97, 32, 58, 6.73);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (182, 184, 7, 13, 3.99);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (164, 184, 1, 99, 7.32);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (153, 10, 29, 31, 4.8);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (40, 22, 40, 100, 7.28);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (104, 152, 18, 46, 3.97);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (87, 174, 8, 48, 3.67);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (91, 7, 4, 43, 9.31);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (163, 82, 48, 94, 2.89);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (163, 176, 28, 5, 8.13);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (129, 134, 39, 89, 3.83);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (123, 16, 42, 56, 9.58);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (26, 27, 40, 44, 4.19);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (154, 78, 17, 82, 6.31);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (143, 4, 49, 51, 3.17);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (155, 79, 16, 2, 4.51);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (56, 105, 45, 23, 6.43);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (58, 86, 49, 13, 9.89);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (119, 144, 17, 60, 6.93);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (7, 91, 14, 88, 2.45);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (177, 42, 9, 69, 6.38);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (104, 140, 13, 75, 4.37);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (123, 150, 28, 53, 4.33);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (57, 150, 12, 30, 3.46);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (91, 74, 41, 81, 2.22);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (34, 39, 25, 35, 6.09);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (112, 76, 27, 68, 6.75);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (2, 117, 28, 27, 9.94);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (147, 105, 18, 24, 7.26);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (31, 114, 37, 13, 2.11);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (30, 198, 1, 89, 5.15);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (185, 10, 50, 45, 5.25);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (80, 72, 13, 88, 9.97);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (155, 88, 5, 11, 8.23);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (81, 196, 16, 53, 6.79);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (180, 49, 48, 100, 6.35);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (78, 143, 23, 43, 8.51);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (149, 140, 24, 32, 4.59);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (46, 80, 6, 60, 7.25);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (19, 151, 24, 57, 6.9);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (191, 21, 10, 72, 6.1);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (164, 192, 2, 70, 5.33);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (54, 95, 40, 69, 9.47);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (3, 54, 32, 51, 1.14);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (161, 132, 19, 43, 9.8);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (90, 67, 46, 67, 6.51);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (170, 140, 37, 22, 5.67);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (114, 12, 15, 47, 4.74);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (130, 71, 16, 19, 6.4);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (111, 75, 22, 17, 2.72);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (23, 142, 16, 35, 3.39);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (77, 47, 34, 18, 2.86);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (62, 107, 48, 97, 3.66);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (124, 182, 27, 54, 1.85);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (96, 24, 14, 59, 1.14);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (190, 65, 25, 21, 8.06);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (156, 157, 10, 35, 6.56);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (29, 52, 20, 21, 8.39);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (165, 179, 11, 17, 7.43);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (108, 45, 26, 5, 9.7);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (130, 185, 7, 23, 1.84);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (175, 26, 6, 24, 4.91);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (55, 21, 44, 53, 6.13);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (159, 73, 30, 37, 5.92);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (169, 200, 10, 51, 9.36);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (2, 88, 39, 96, 9.19);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (89, 155, 25, 27, 7.47);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (139, 108, 21, 79, 2.13);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (172, 115, 44, 37, 6.85);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (134, 77, 22, 83, 3.12);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (59, 119, 31, 86, 9.29);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (26, 182, 49, 50, 2.33);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (14, 150, 50, 16, 3.27);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (166, 69, 5, 88, 9.97);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (41, 15, 28, 80, 6.26);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (107, 43, 24, 17, 3.16);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (47, 169, 28, 76, 5.19);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (13, 51, 22, 48, 3.54);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (26, 96, 28, 35, 7.03);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (133, 68, 35, 13, 8.69);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (94, 187, 44, 85, 8.82);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (95, 192, 3, 19, 2.29);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (65, 96, 35, 44, 1.55);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (2, 103, 40, 14, 1.57);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (90, 184, 35, 82, 4.25);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (66, 161, 42, 59, 1.39);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (78, 190, 43, 63, 2.73);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (186, 64, 26, 49, 7.93);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (23, 125, 35, 81, 5.31);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (28, 62, 23, 46, 1.42);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (153, 161, 26, 46, 1.51);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (15, 177, 15, 15, 3.93);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (79, 46, 18, 93, 8.01);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (106, 103, 36, 56, 1.93);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (104, 151, 6, 7, 7.42);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (51, 19, 45, 18, 6.85);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (92, 119, 9, 1, 2.78);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (112, 126, 6, 21, 5.08);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (76, 96, 4, 11, 4.39);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (18, 137, 47, 15, 3.32);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (193, 1, 41, 83, 4.44);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (8, 130, 40, 28, 1.6);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (166, 46, 30, 31, 4.9);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (105, 76, 2, 51, 6.47);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (174, 80, 2, 73, 1.69);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (51, 85, 40, 10, 4.39);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (17, 6, 3, 29, 8.59);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (92, 139, 28, 34, 5.34);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (81, 158, 22, 10, 1.99);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (22, 86, 38, 46, 1.53);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (140, 5, 49, 87, 9.07);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (176, 78, 36, 80, 3.41);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (12, 157, 50, 51, 9.48);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (178, 127, 14, 87, 3.5);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (62, 179, 35, 94, 9.39);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (87, 176, 29, 45, 4.75);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (141, 10, 17, 17, 7.91);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (164, 81, 24, 68, 9.81);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (151, 3, 7, 95, 1.32);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (107, 58, 24, 58, 7.29);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (44, 81, 36, 30, 9.13);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (89, 114, 25, 40, 4.02);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (140, 148, 22, 87, 7.72);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (54, 193, 20, 60, 8.09);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (120, 197, 50, 64, 9.31);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (115, 197, 34, 100, 3.08);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (182, 105, 24, 72, 7.34);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (105, 179, 37, 20, 4.72);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (36, 166, 25, 14, 3.7);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (187, 150, 48, 57, 1.74);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (185, 112, 2, 41, 4.54);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (135, 91, 47, 20, 3.74);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (160, 134, 36, 62, 8.34);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (161, 111, 10, 78, 9.2);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (17, 119, 41, 95, 7.83);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (134, 83, 46, 91, 2.59);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (157, 189, 50, 95, 2.24);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (44, 190, 9, 67, 7.22);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (120, 23, 19, 59, 1.38);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (26, 74, 1, 62, 1.57);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (102, 156, 14, 76, 3.85);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (25, 100, 24, 63, 4.25);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (39, 36, 22, 26, 1.9);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (44, 6, 16, 23, 4.69);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (88, 75, 50, 61, 4.96);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (88, 166, 12, 46, 2.2);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (129, 118, 33, 44, 8.88);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (103, 144, 30, 76, 8.78);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (148, 148, 22, 72, 7.46);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (5, 15, 20, 61, 5.48);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (135, 189, 44, 19, 1.99);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (110, 124, 37, 54, 9.74);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (171, 73, 47, 93, 7.31);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (81, 56, 10, 48, 8.49);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (50, 195, 36, 97, 7.86);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (72, 177, 33, 83, 3.06);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (14, 5, 23, 90, 3.46);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (1, 178, 50, 13, 2.29);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (135, 97, 45, 30, 1.73);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (34, 116, 14, 100, 9.58);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (81, 170, 2, 83, 4.63);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (164, 22, 32, 27, 1.66);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (119, 74, 18, 43, 1.93);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (63, 28, 16, 96, 1.26);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (133, 13, 45, 65, 7.38);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (48, 49, 10, 24, 4.87);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (40, 157, 36, 62, 5.08);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (74, 104, 7, 7, 1.37);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (170, 166, 43, 6, 6.3);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (200, 175, 24, 65, 7.98);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (189, 98, 46, 46, 9.91);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (196, 105, 28, 41, 3.38);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (72, 178, 31, 63, 1.6);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (27, 199, 40, 80, 4.54);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (136, 11, 21, 12, 2.94);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (77, 130, 34, 54, 1.57);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (3, 147, 48, 42, 5.63);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (121, 91, 9, 70, 4.15);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (111, 22, 49, 27, 2.33);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (18, 89, 50, 60, 7.59);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (114, 162, 1, 74, 9.87);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (189, 72, 39, 46, 9.48);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (21, 71, 10, 77, 6.19);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (186, 108, 10, 7, 4.62);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (123, 159, 18, 10, 3.43);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (27, 150, 21, 5, 2.62);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (11, 158, 43, 57, 1.5);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (70, 78, 45, 50, 4.74);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (2, 130, 27, 66, 9.57);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (94, 38, 39, 95, 8.62);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (42, 13, 40, 31, 1.15);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (119, 138, 45, 20, 9.96);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (62, 5, 31, 87, 8.11);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (143, 118, 4, 93, 3.13);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (178, 177, 17, 51, 6.05);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (166, 63, 35, 58, 2.74);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (94, 156, 14, 9, 4.88);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (160, 140, 46, 83, 8.4);
insert into cart (product_id, customer_id, product_quantity, cart_total, coupon) values (197, 22, 21, 76, 3.87);

-- SELECT * FROM cart;

insert into delivery_system (order_id, agent_id, admin_id) values (1, 85, 33);
insert into delivery_system (order_id, agent_id, admin_id) values (2, 78, 175);
insert into delivery_system (order_id, agent_id, admin_id) values (3, 153, 14);
insert into delivery_system (order_id, agent_id, admin_id) values (4, 39, 121);
insert into delivery_system (order_id, agent_id, admin_id) values (5, 8, 78);
insert into delivery_system (order_id, agent_id, admin_id) values (6, 32, 22);
insert into delivery_system (order_id, agent_id, admin_id) values (7, 152, 75);
insert into delivery_system (order_id, agent_id, admin_id) values (8, 181, 78);
insert into delivery_system (order_id, agent_id, admin_id) values (9, 197, 94);
insert into delivery_system (order_id, agent_id, admin_id) values (10, 17, 87);
insert into delivery_system (order_id, agent_id, admin_id) values (11, 111, 169);
insert into delivery_system (order_id, agent_id, admin_id) values (12, 97, 186);
insert into delivery_system (order_id, agent_id, admin_id) values (13, 186, 144);
insert into delivery_system (order_id, agent_id, admin_id) values (14, 69, 161);
insert into delivery_system (order_id, agent_id, admin_id) values (15, 118, 23);
insert into delivery_system (order_id, agent_id, admin_id) values (16, 64, 14);
insert into delivery_system (order_id, agent_id, admin_id) values (17, 94, 135);
insert into delivery_system (order_id, agent_id, admin_id) values (18, 141, 19);
insert into delivery_system (order_id, agent_id, admin_id) values (19, 74, 160);
insert into delivery_system (order_id, agent_id, admin_id) values (20, 18, 91);
insert into delivery_system (order_id, agent_id, admin_id) values (21, 165, 55);
insert into delivery_system (order_id, agent_id, admin_id) values (22, 67, 150);
insert into delivery_system (order_id, agent_id, admin_id) values (23, 29, 196);
insert into delivery_system (order_id, agent_id, admin_id) values (24, 175, 110);
insert into delivery_system (order_id, agent_id, admin_id) values (25, 132, 131);
insert into delivery_system (order_id, agent_id, admin_id) values (26, 54, 111);
insert into delivery_system (order_id, agent_id, admin_id) values (27, 83, 81);
insert into delivery_system (order_id, agent_id, admin_id) values (28, 147, 175);
insert into delivery_system (order_id, agent_id, admin_id) values (29, 131, 70);
insert into delivery_system (order_id, agent_id, admin_id) values (30, 78, 80);
insert into delivery_system (order_id, agent_id, admin_id) values (31, 110, 128);
insert into delivery_system (order_id, agent_id, admin_id) values (32, 2, 159);
insert into delivery_system (order_id, agent_id, admin_id) values (33, 6, 19);
insert into delivery_system (order_id, agent_id, admin_id) values (34, 120, 7);
insert into delivery_system (order_id, agent_id, admin_id) values (35, 130, 72);
insert into delivery_system (order_id, agent_id, admin_id) values (36, 117, 140);
insert into delivery_system (order_id, agent_id, admin_id) values (37, 146, 145);
insert into delivery_system (order_id, agent_id, admin_id) values (38, 25, 115);
insert into delivery_system (order_id, agent_id, admin_id) values (39, 10, 142);
insert into delivery_system (order_id, agent_id, admin_id) values (40, 89, 186);
insert into delivery_system (order_id, agent_id, admin_id) values (41, 108, 69);
insert into delivery_system (order_id, agent_id, admin_id) values (42, 5, 173);
insert into delivery_system (order_id, agent_id, admin_id) values (43, 175, 23);
insert into delivery_system (order_id, agent_id, admin_id) values (44, 8, 157);
insert into delivery_system (order_id, agent_id, admin_id) values (45, 196, 30);
insert into delivery_system (order_id, agent_id, admin_id) values (46, 34, 112);
insert into delivery_system (order_id, agent_id, admin_id) values (47, 66, 189);
insert into delivery_system (order_id, agent_id, admin_id) values (48, 56, 122);
insert into delivery_system (order_id, agent_id, admin_id) values (49, 160, 112);
insert into delivery_system (order_id, agent_id, admin_id) values (50, 144, 53);
insert into delivery_system (order_id, agent_id, admin_id) values (51, 66, 68);
insert into delivery_system (order_id, agent_id, admin_id) values (52, 40, 5);
insert into delivery_system (order_id, agent_id, admin_id) values (53, 96, 158);
insert into delivery_system (order_id, agent_id, admin_id) values (54, 122, 146);
insert into delivery_system (order_id, agent_id, admin_id) values (55, 126, 5);
insert into delivery_system (order_id, agent_id, admin_id) values (56, 125, 29);
insert into delivery_system (order_id, agent_id, admin_id) values (57, 42, 88);
insert into delivery_system (order_id, agent_id, admin_id) values (58, 17, 126);
insert into delivery_system (order_id, agent_id, admin_id) values (59, 152, 95);
insert into delivery_system (order_id, agent_id, admin_id) values (60, 106, 142);
insert into delivery_system (order_id, agent_id, admin_id) values (61, 88, 123);
insert into delivery_system (order_id, agent_id, admin_id) values (62, 195, 160);
insert into delivery_system (order_id, agent_id, admin_id) values (63, 121, 86);
insert into delivery_system (order_id, agent_id, admin_id) values (64, 118, 171);
insert into delivery_system (order_id, agent_id, admin_id) values (65, 61, 43);
insert into delivery_system (order_id, agent_id, admin_id) values (66, 167, 30);
insert into delivery_system (order_id, agent_id, admin_id) values (67, 66, 86);
insert into delivery_system (order_id, agent_id, admin_id) values (68, 106, 39);
insert into delivery_system (order_id, agent_id, admin_id) values (69, 169, 133);
insert into delivery_system (order_id, agent_id, admin_id) values (70, 31, 62);
insert into delivery_system (order_id, agent_id, admin_id) values (71, 11, 33);
insert into delivery_system (order_id, agent_id, admin_id) values (72, 93, 87);
insert into delivery_system (order_id, agent_id, admin_id) values (73, 80, 27);
insert into delivery_system (order_id, agent_id, admin_id) values (74, 114, 124);
insert into delivery_system (order_id, agent_id, admin_id) values (75, 7, 50);
insert into delivery_system (order_id, agent_id, admin_id) values (76, 119, 169);
insert into delivery_system (order_id, agent_id, admin_id) values (77, 7, 78);
insert into delivery_system (order_id, agent_id, admin_id) values (78, 158, 122);
insert into delivery_system (order_id, agent_id, admin_id) values (79, 63, 15);
insert into delivery_system (order_id, agent_id, admin_id) values (80, 103, 53);
insert into delivery_system (order_id, agent_id, admin_id) values (81, 68, 118);
insert into delivery_system (order_id, agent_id, admin_id) values (82, 73, 72);
insert into delivery_system (order_id, agent_id, admin_id) values (83, 133, 79);
insert into delivery_system (order_id, agent_id, admin_id) values (84, 48, 133);
insert into delivery_system (order_id, agent_id, admin_id) values (85, 148, 76);
insert into delivery_system (order_id, agent_id, admin_id) values (86, 159, 90);
insert into delivery_system (order_id, agent_id, admin_id) values (87, 198, 135);
insert into delivery_system (order_id, agent_id, admin_id) values (88, 113, 94);
insert into delivery_system (order_id, agent_id, admin_id) values (89, 200, 27);
insert into delivery_system (order_id, agent_id, admin_id) values (90, 70, 88);
insert into delivery_system (order_id, agent_id, admin_id) values (91, 2, 11);
insert into delivery_system (order_id, agent_id, admin_id) values (92, 138, 66);
insert into delivery_system (order_id, agent_id, admin_id) values (93, 130, 100);
insert into delivery_system (order_id, agent_id, admin_id) values (94, 109, 96);
insert into delivery_system (order_id, agent_id, admin_id) values (95, 169, 60);
insert into delivery_system (order_id, agent_id, admin_id) values (96, 51, 135);
insert into delivery_system (order_id, agent_id, admin_id) values (97, 67, 32);
insert into delivery_system (order_id, agent_id, admin_id) values (98, 176, 180);
insert into delivery_system (order_id, agent_id, admin_id) values (99, 181, 161);
insert into delivery_system (order_id, agent_id, admin_id) values (100, 173, 52);
insert into delivery_system (order_id, agent_id, admin_id) values (101, 17, 89);
insert into delivery_system (order_id, agent_id, admin_id) values (102, 120, 185);
insert into delivery_system (order_id, agent_id, admin_id) values (103, 87, 141);
insert into delivery_system (order_id, agent_id, admin_id) values (104, 149, 80);
insert into delivery_system (order_id, agent_id, admin_id) values (105, 31, 95);
insert into delivery_system (order_id, agent_id, admin_id) values (106, 31, 20);
insert into delivery_system (order_id, agent_id, admin_id) values (107, 69, 192);
insert into delivery_system (order_id, agent_id, admin_id) values (108, 161, 114);
insert into delivery_system (order_id, agent_id, admin_id) values (109, 90, 167);
insert into delivery_system (order_id, agent_id, admin_id) values (110, 59, 54);
insert into delivery_system (order_id, agent_id, admin_id) values (111, 160, 56);
insert into delivery_system (order_id, agent_id, admin_id) values (112, 190, 131);
insert into delivery_system (order_id, agent_id, admin_id) values (113, 113, 119);
insert into delivery_system (order_id, agent_id, admin_id) values (114, 99, 46);
insert into delivery_system (order_id, agent_id, admin_id) values (115, 122, 96);
insert into delivery_system (order_id, agent_id, admin_id) values (116, 56, 36);
insert into delivery_system (order_id, agent_id, admin_id) values (117, 72, 172);
insert into delivery_system (order_id, agent_id, admin_id) values (118, 189, 37);
insert into delivery_system (order_id, agent_id, admin_id) values (119, 153, 115);
insert into delivery_system (order_id, agent_id, admin_id) values (120, 56, 70);
insert into delivery_system (order_id, agent_id, admin_id) values (121, 99, 115);
insert into delivery_system (order_id, agent_id, admin_id) values (122, 197, 1);
insert into delivery_system (order_id, agent_id, admin_id) values (123, 176, 127);
insert into delivery_system (order_id, agent_id, admin_id) values (124, 58, 95);
insert into delivery_system (order_id, agent_id, admin_id) values (125, 147, 120);
insert into delivery_system (order_id, agent_id, admin_id) values (126, 71, 131);
insert into delivery_system (order_id, agent_id, admin_id) values (127, 48, 8);
insert into delivery_system (order_id, agent_id, admin_id) values (128, 57, 3);
insert into delivery_system (order_id, agent_id, admin_id) values (129, 83, 124);
insert into delivery_system (order_id, agent_id, admin_id) values (130, 181, 133);
insert into delivery_system (order_id, agent_id, admin_id) values (131, 83, 139);
insert into delivery_system (order_id, agent_id, admin_id) values (132, 101, 193);
insert into delivery_system (order_id, agent_id, admin_id) values (133, 114, 6);
insert into delivery_system (order_id, agent_id, admin_id) values (134, 20, 120);
insert into delivery_system (order_id, agent_id, admin_id) values (135, 89, 15);
insert into delivery_system (order_id, agent_id, admin_id) values (136, 163, 191);
insert into delivery_system (order_id, agent_id, admin_id) values (137, 180, 27);
insert into delivery_system (order_id, agent_id, admin_id) values (138, 13, 67);
insert into delivery_system (order_id, agent_id, admin_id) values (139, 145, 124);
insert into delivery_system (order_id, agent_id, admin_id) values (140, 30, 136);
insert into delivery_system (order_id, agent_id, admin_id) values (141, 25, 153);
insert into delivery_system (order_id, agent_id, admin_id) values (142, 146, 106);
insert into delivery_system (order_id, agent_id, admin_id) values (143, 27, 124);
insert into delivery_system (order_id, agent_id, admin_id) values (144, 75, 141);
insert into delivery_system (order_id, agent_id, admin_id) values (145, 198, 175);
insert into delivery_system (order_id, agent_id, admin_id) values (146, 175, 84);
insert into delivery_system (order_id, agent_id, admin_id) values (147, 182, 87);
insert into delivery_system (order_id, agent_id, admin_id) values (148, 194, 142);
insert into delivery_system (order_id, agent_id, admin_id) values (149, 19, 189);
insert into delivery_system (order_id, agent_id, admin_id) values (150, 94, 129);
insert into delivery_system (order_id, agent_id, admin_id) values (151, 102, 161);
insert into delivery_system (order_id, agent_id, admin_id) values (152, 168, 45);
insert into delivery_system (order_id, agent_id, admin_id) values (153, 39, 161);
insert into delivery_system (order_id, agent_id, admin_id) values (154, 26, 118);
insert into delivery_system (order_id, agent_id, admin_id) values (155, 147, 99);
insert into delivery_system (order_id, agent_id, admin_id) values (156, 84, 77);
insert into delivery_system (order_id, agent_id, admin_id) values (157, 147, 156);
insert into delivery_system (order_id, agent_id, admin_id) values (158, 121, 133);
insert into delivery_system (order_id, agent_id, admin_id) values (159, 119, 34);
insert into delivery_system (order_id, agent_id, admin_id) values (160, 179, 41);
insert into delivery_system (order_id, agent_id, admin_id) values (161, 115, 17);
insert into delivery_system (order_id, agent_id, admin_id) values (162, 16, 8);
insert into delivery_system (order_id, agent_id, admin_id) values (163, 150, 36);
insert into delivery_system (order_id, agent_id, admin_id) values (164, 66, 58);
insert into delivery_system (order_id, agent_id, admin_id) values (165, 2, 23);
insert into delivery_system (order_id, agent_id, admin_id) values (166, 194, 92);
insert into delivery_system (order_id, agent_id, admin_id) values (167, 9, 93);
insert into delivery_system (order_id, agent_id, admin_id) values (168, 170, 191);
insert into delivery_system (order_id, agent_id, admin_id) values (169, 145, 88);
insert into delivery_system (order_id, agent_id, admin_id) values (170, 5, 105);
insert into delivery_system (order_id, agent_id, admin_id) values (171, 128, 79);
insert into delivery_system (order_id, agent_id, admin_id) values (172, 82, 150);
insert into delivery_system (order_id, agent_id, admin_id) values (173, 159, 46);
insert into delivery_system (order_id, agent_id, admin_id) values (174, 94, 65);
insert into delivery_system (order_id, agent_id, admin_id) values (175, 116, 62);
insert into delivery_system (order_id, agent_id, admin_id) values (176, 2, 127);
insert into delivery_system (order_id, agent_id, admin_id) values (177, 98, 16);
insert into delivery_system (order_id, agent_id, admin_id) values (178, 124, 115);
insert into delivery_system (order_id, agent_id, admin_id) values (179, 133, 139);
insert into delivery_system (order_id, agent_id, admin_id) values (180, 174, 185);
insert into delivery_system (order_id, agent_id, admin_id) values (181, 108, 64);
insert into delivery_system (order_id, agent_id, admin_id) values (182, 147, 70);
insert into delivery_system (order_id, agent_id, admin_id) values (183, 118, 153);
insert into delivery_system (order_id, agent_id, admin_id) values (184, 105, 34);
insert into delivery_system (order_id, agent_id, admin_id) values (185, 130, 183);
insert into delivery_system (order_id, agent_id, admin_id) values (186, 121, 163);
insert into delivery_system (order_id, agent_id, admin_id) values (187, 89, 66);
insert into delivery_system (order_id, agent_id, admin_id) values (188, 170, 11);
insert into delivery_system (order_id, agent_id, admin_id) values (189, 41, 79);
insert into delivery_system (order_id, agent_id, admin_id) values (190, 178, 114);
insert into delivery_system (order_id, agent_id, admin_id) values (191, 161, 135);
insert into delivery_system (order_id, agent_id, admin_id) values (192, 147, 158);
insert into delivery_system (order_id, agent_id, admin_id) values (193, 19, 197);
insert into delivery_system (order_id, agent_id, admin_id) values (194, 35, 88);
insert into delivery_system (order_id, agent_id, admin_id) values (195, 96, 152);
insert into delivery_system (order_id, agent_id, admin_id) values (196, 139, 194);
insert into delivery_system (order_id, agent_id, admin_id) values (197, 19, 187);
insert into delivery_system (order_id, agent_id, admin_id) values (198, 126, 73);
insert into delivery_system (order_id, agent_id, admin_id) values (199, 101, 92);
insert into delivery_system (order_id, agent_id, admin_id) values (200, 141, 92);

-- SELECT * FROM delivery_system;











--  What is the average rating of all products:-- 
SELECT AVG(product_rating) FROM product;

-- -- -- List the top 20 popular products (based on rating):
SELECT * FROM product ORDER BY product_rating DESC LIMIT 20;

-- -- -- Details of the orders whose mode of payment is Cash on Delivery:
SELECT * FROM orders WHERE mode_of_payment = 'Cash on Delivery';

-- -- -- -- List the top 10 orders with the highest order total:
SELECT * FROM orders ORDER BY order_total DESC LIMIT 10;

-- -- -- -- Give a list of number of orders on the basis of number of days to deliver them:
SELECT COUNT(*) no_of_orders,no_of_days_to_deliver FROM orders GROUP BY no_of_days_to_deliver ORDER BY no_of_days_to_deliver;

-- -- -- -- List of Admins who are not handling any orders/products:
SELECT * FROM Admins WHERE order_id IS NULL;

-- -- -- -- How many customers have a membership status of 'PRIME', 'BASIC' or 'ELITE':
SELECT membership_status,COUNT(*) no_of_customers FROM customers GROUP BY membership_status;

-- -- -- -- List of all ELITE Customers:
SELECT * FROM customers WHERE membership_status = 'ELITE';

-- -- -- -- List of 20 items with highest coupon discount:
SELECT * FROM cart ORDER BY coupon DESC LIMIT 20;

-- -- -- -- List of all the delivery agents who have a rating between 7 and 9:
SELECT * FROM delivery_agent WHERE rating BETWEEN 7 AND 9 ORDER BY rating;

-- -- -- -- List of all delivery agents whose first name starts with 'S':
SELECT * FROM delivery_agent WHERE fname LIKE 'S%';

-- -- -- -- List of all delivery agents whose middle name is NULL:
SELECT * FROM delivery_agent WHERE mname IS NULL;

-- -- Retrieve all products that are low on stock:
SELECT * FROM product WHERE product_stock < 20;

-- -- Retrieve all products who are cheap and have a rating of 4 or more:
SELECT * FROM product WHERE product_price < 400 AND product_rating >= 4;

-- -- Most expensive product:
SELECT * FROM product ORDER BY product_price DESC LIMIT 1;

-- -- Retrieve the total revenue generated by the store:
SELECT SUM(transaction_amount) FROM wallet;

-- -- What is the average balance in the wallet of all customers:
 SELECT AVG(balance) FROM wallet;

-- -- Add a new product to the database:
INSERT INTO product(product_id,product_name,product_price,product_stock,product_rating) VALUES (201,'Havmor Ice Cream',60,8,3.8),(202,'Granola Bars',113,12,4.7);

-- Change the password of a customer:
UPDATE customers SET pass = 'Sanmay7788' WHERE customer_id = 198;

-- Change the membership status of a customer:
UPDATE customers SET membership_status = 'PRIME' WHERE customer_id = 197;

-- Remove a product from cart:
DELETE FROM cart WHERE product_id IN (26,50,164);
	
-- -- Customer cancels the order because of poor rating of delivery agent:
SELECT MIN(rating) from delivery_agent;
SELECT * FROM delivery_agent WHERE rating < 1.1;
DELETE FROM orders WHERE order_id = 106;

-- Retrieve the delivery details of all the orders delivered to a particular customer:
SELECT * FROM delivery_agent WHERE customer_id = 35;

-- Number of products with a particular rating (rating > 3):
SELECT COUNT(*) no_of_products, product_rating FROM product WHERE product_rating > 3 GROUP BY product_rating ORDER BY product_rating;

-- List of products who have a good rating and their name starts with 'B':
SELECT * FROM product WHERE product_rating > 3 AND product_name LIKE 'B%' ORDER BY product_rating DESC;

-- List of customers whose email id ends with '.edu' (They are mostly students):
SELECT * FROM customers WHERE email_id LIKE '%.edu';

-- Find a customer using his/her phone number and password (for login):
SELECT * FROM customers WHERE mobile_number = 4028292168 AND pass = 'L5Whumkqxyu';


-- -- -- To check constraints:

INSERT INTO product(product_id,product_name,product_price,product_stock,product_rating) VALUES (203,'Kwality cream', 100, 10, 6.7);

INSERT INTO product(product_id,product_name,product_price,product_stock,product_rating) VALUES (203,'Kwality cream', 100, -7, 3.9);

INSERT INTO product(product_id,product_name,product_price,product_stock,product_rating) VALUES (203,'Kwality cream', 1000000, 68, 3.9);

INSERT INTO cart(product_id,customer_id,product_quantity, cart_total,coupon) VALUES (134, 155,12,13244,12);

INSERT INTO orders(order_id, product_id,order_total,mode_of_payment,no_of_days_to_deliver) VALUES (120, 110, 35000, 'Cash on Delivery', 3);

INSERT INTO orders(order_id, product_id,order_total,mode_of_payment,no_of_days_to_deliver) VALUES (201, 110, 35000, 'Cash on Delivery', NULL);

-- Showing details about the customer and his cart and balance
SELECT customers.customer_id, customers.username , wallet.balance, product.product_name, product.product_price ,cart.product_quantity,(product.product_price*cart.product_quantity) as "Product_Total" from customers inner join wallet on wallet.customer_id = customers.customer_id inner join cart on cart.customer_id = customers.customer_id inner join product on product.product_id = cart.product_id;

-- Showing only the orders that have been made using Cash on Delivery
SELECT delivery_agent.agent_ID, orders.order_total,orders.mode_of_payment,orders.no_of_days_to_deliver from delivery_agent, orders where delivery_agent.Order_ID in (SELECT Order_ID from Orders where Mode_of_Payment = "Cash on Delivery");

-- Checking if there are orders that haven't been delivered yet
SELECT  * from orders  where order_id   IN
	( SELECT order_id FROM orders 
    where (no_of_days_to_deliver !=0)
    and  (no_of_days_to_deliver < 6) );


-- If OrderTotal is greater than 1000 than, we will give 10% discount

-- First we will check if the membership is elite

SELECT orders.order_id, customers.username, orders.order_total, (orders.order_total*0.9) as "discounted_price" from Orders 
	inner join delivery_agent on delivery_agent.order_id = orders.order_id 
	inner join customers on customers.customer_id = delivery_agent.customer_id 
		where orders.order_id in (select order_id from orders where (order_total>1000)) 
		and customers.membership_status = "ELITE" ;





CREATE INDEX idx_price_change_product_id ON price_change(product_id);

CREATE INDEX idx_customers_username ON customers(username);

CREATE INDEX idx_customers_email_id ON customers(email_id);

CREATE INDEX idx_customers_mobile_number ON customers(mobile_number);

CREATE INDEX idx_delivery_agent_customer_id ON delivery_agent(customer_id);

CREATE INDEX idx_delivery_agent_order_id ON delivery_agent(order_id);

CREATE INDEX idx_orders_product_id ON orders(product_id);

CREATE INDEX idx_product_product_name ON product(product_name);

CREATE INDEX idx_cart_product_id ON cart(product_id);

CREATE INDEX idx_cart_customer_id ON cart(customer_id);

CREATE INDEX idx_wallet_customer_id ON wallet(customer_id);

CREATE INDEX idx_delivery_system_order_id ON delivery_system(order_id);



CREATE VIEW product_stock_view AS
SELECT p.product_id, p.product_name, p.product_price, p.product_stock, SUM(c.product_quantity) AS total_quantity_sold
FROM product p
JOIN cart c
ON p.product_id = c.product_id
GROUP BY p.product_id;


SELECT * FROM product_stock_view;


CREATE VIEW customer_cart_view AS
SELECT c.username,ca.product_id, p.product_name, p.product_price, ca.product_quantity, (p.product_price * ca.product_quantity) AS total_price
FROM customers c
INNER JOIN cart ca ON c.customer_id = ca.customer_id
INNER JOIN product p ON ca.product_id = p.product_id;


SELECT * FROM customer_cart_view;


GRANT SELECT ON product TO 'root'@'localhost';









