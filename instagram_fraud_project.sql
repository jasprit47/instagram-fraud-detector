-- ============================================================
-- Instagram Fraud Detection — SQL Project
-- Author: Jaspreet Kaur
-- Dataset: 150 accounts | 30 fake accounts | 200 top influencers
-- ============================================================

CREATE DATABASE IF NOT EXISTS instagram_fraud;
USE instagram_fraud;

-- ── TABLE 1: accounts (150 mixed Real/Unknown accounts) ──────
DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
    username        VARCHAR(100),
    followers       INT,
    following       INT,
    posts           INT,
    avg_likes       INT,
    avg_comments    INT,
    category        VARCHAR(50),
    label           VARCHAR(20)
);

INSERT INTO accounts VALUES
('@real_user_73',47928,68328,156,1302,154,'Gaming','Real'),
('@real_user_18',100859,82987,343,4243,535,'Beauty','Real'),
('@real_user_118',475494,427335,573,45538,5440,'Tech','Real'),
('@real_user_78',47563,72630,418,2869,354,'Travel','Real'),
('@real_user_76',23030,12222,680,1938,173,'Fitness','Real'),
('@real_user_31',153746,221444,435,12724,814,'Food','Real'),
('@real_user_64',5404,10763,726,647,68,'Food','Real'),
('@fake_user_21',1105409,350,14,1479,1,'Beauty','Unknown'),
('@real_user_68',115215,145452,496,5734,511,'Food','Real'),
('@real_user_82',23935,51337,694,1880,183,'Lifestyle','Real'),
('@real_user_110',198843,245664,164,13581,1765,'Fashion','Real'),
('@real_user_12',411428,976844,748,28570,2008,'Tech','Real'),
('@real_user_36',137235,335796,685,9157,1122,'Food','Real'),
('@real_user_9',334633,431272,82,28126,3797,'Beauty','Real'),
('@real_user_19',289045,409876,513,27602,1796,'Fitness','Real'),
('@real_user_56',44298,35080,183,2024,277,'Food','Real'),
('@real_user_104',16485,37492,211,472,36,'Travel','Real'),
('@real_user_69',144456,90077,233,11539,1672,'Fashion','Real'),
('@real_user_55',20485,40720,410,1104,137,'Gaming','Real'),
('@fake_user_12',533816,916,97,2636,12,'Travel','Unknown'),
('@real_user_29',23589,24241,351,2350,341,'Fitness','Real'),
('@fake_user_7',769708,207,75,2038,9,'Gaming','Unknown'),
('@real_user_26',258871,367439,519,18564,1935,'Gaming','Real'),
('@fake_user_8',959297,373,41,97,0,'Beauty','Unknown'),
('@fake_user_11',504032,769,77,323,1,'Food','Unknown'),
('@fake_user_25',576840,455,72,732,6,'Tech','Unknown'),
('@real_user_108',194931,169732,435,20082,1690,'Tech','Real'),
('@fake_user_23',606079,965,49,2509,10,'Tech','Unknown'),
('@real_user_45',32472,29876,245,2301,302,'Food','Real'),
('@real_user_30',5699,3834,784,330,26,'Lifestyle','Real'),
('@real_user_22',80306,200103,303,7968,606,'Travel','Real'),
('@real_user_15',45294,37914,423,2867,220,'Beauty','Real'),
('@real_user_65',37201,66133,83,3735,272,'Travel','Real'),
('@real_user_11',290982,156362,624,17466,917,'Beauty','Real'),
('@real_user_42',28289,67230,307,1917,213,'Fashion','Real'),
('@fake_user_26',233541,860,40,1032,9,'Gaming','Unknown'),
('@real_user_51',134076,257624,782,15736,874,'Tech','Real'),
('@real_user_27',187965,236021,326,18381,2584,'Lifestyle','Real'),
('@real_user_4',452801,308539,130,35294,4705,'Travel','Real'),
('@real_user_32',409141,903202,574,19994,2619,'Travel','Real'),
('@fake_user_22',1392964,692,49,886,8,'Fitness','Unknown'),
('@real_user_85',190937,106300,599,4415,221,'Gaming','Real'),
('@real_user_86',92078,228357,637,7068,1012,'Tech','Real'),
('@real_user_16',35303,64670,436,801,59,'Fashion','Real'),
('@real_user_10',323684,369789,511,19822,2103,'Tech','Real'),
('@real_user_81',471255,146871,167,44541,6313,'Fashion','Real'),
('@fake_user_13',601946,809,48,2379,4,'Beauty','Unknown'),
('@fake_user_17',955699,518,59,2554,8,'Food','Unknown'),
('@real_user_75',490843,306789,56,33384,1877,'Tech','Real'),
('@real_user_109',42334,40125,549,2279,213,'Food','Real'),
('@real_user_96',44915,70419,427,4562,297,'Fashion','Real'),
('@real_user_105',155947,133889,492,13422,1411,'Gaming','Real'),
('@real_user_66',174454,379402,103,11921,1216,'Travel','Real'),
('@real_user_0',20795,27248,422,1378,82,'Travel','Real'),
('@fake_user_2',137641,490,23,388,2,'Gaming','Unknown'),
('@real_user_67',486429,954034,627,21707,1147,'Tech','Real'),
('@real_user_28',37352,74361,561,1434,153,'Fashion','Real'),
('@real_user_40',12253,8402,267,311,46,'Food','Real'),
('@real_user_44',37320,18950,84,801,41,'Gaming','Real'),
('@real_user_60',24129,35696,773,2823,338,'Fitness','Real'),
('@fake_user_3',764180,926,96,797,1,'Fitness','Unknown'),
('@real_user_24',193946,459321,202,14718,1283,'Fitness','Real'),
('@real_user_25',71357,133208,447,5703,413,'Fitness','Real'),
('@real_user_23',491999,1064023,453,15740,1889,'Beauty','Real'),
('@real_user_94',21478,17186,72,2189,184,'Gaming','Real'),
('@real_user_39',229375,354449,484,13739,752,'Fitness','Real'),
('@real_user_95',140474,47739,732,9419,1046,'Travel','Real'),
('@real_user_117',116017,140165,110,6303,536,'Tech','Real'),
('@real_user_47',314352,329996,239,15810,2018,'Beauty','Real'),
('@real_user_97',378954,269021,50,10108,672,'Gaming','Real'),
('@real_user_113',101226,140441,734,7160,811,'Fashion','Real'),
('@real_user_33',27009,60785,192,664,36,'Travel','Real'),
('@fake_user_18',507906,188,82,1601,12,'Travel','Unknown'),
('@real_user_101',9944,7018,376,734,75,'Fashion','Real'),
('@real_user_62',24255,59958,226,509,66,'Tech','Real'),
('@real_user_84',201917,224593,59,17723,1938,'Fitness','Real'),
('@fake_user_28',1116412,145,36,146,0,'Fashion','Unknown'),
('@real_user_53',143105,225944,414,4564,334,'Fashion','Real'),
('@real_user_5',69457,139281,211,3868,568,'Food','Real'),
('@real_user_93',402967,761186,179,29034,2117,'Tech','Real'),
('@real_user_111',7573,18672,491,263,35,'Fitness','Real'),
('@real_user_49',5698,13618,433,440,36,'Travel','Real'),
('@real_user_35',120313,107968,669,7050,936,'Fitness','Real'),
('@real_user_80',201605,417907,713,13569,797,'Gaming','Real'),
('@real_user_77',15267,34490,261,524,32,'Fashion','Real'),
('@real_user_34',192038,412047,619,7656,1134,'Lifestyle','Real'),
('@real_user_114',151332,106782,742,7660,1117,'Travel','Real'),
('@real_user_7',14268,29461,114,616,39,'Fashion','Real'),
('@real_user_43',199143,419277,317,11168,1464,'Tech','Real'),
('@real_user_70',26833,45441,160,2632,218,'Fashion','Real'),
('@real_user_98',42430,69083,624,2977,383,'Travel','Real'),
('@fake_user_0',893554,584,89,2886,22,'Lifestyle','Unknown'),
('@real_user_83',264323,490558,703,10403,1071,'Beauty','Real'),
('@fake_user_14',811998,810,61,3676,36,'Travel','Unknown'),
('@fake_user_15',1498974,429,66,4613,25,'Food','Unknown'),
('@real_user_89',418134,478579,665,22481,3146,'Beauty','Real'),
('@real_user_8',45774,84914,724,1318,173,'Tech','Real'),
('@real_user_13',93585,66487,380,7596,990,'Beauty','Real'),
('@real_user_119',445690,644851,61,48231,5742,'Lifestyle','Real'),
('@fake_user_5',621826,904,52,429,0,'Beauty','Unknown'),
('@real_user_3',6899,3057,437,170,11,'Fashion','Real'),
('@real_user_17',6636,7028,434,628,33,'Tech','Real'),
('@real_user_38',39699,27880,286,1969,116,'Fitness','Real'),
('@real_user_72',107108,140709,395,3056,189,'Lifestyle','Real'),
('@fake_user_16',576072,153,56,2389,19,'Gaming','Unknown'),
('@real_user_6',149299,172453,387,4357,359,'Gaming','Real'),
('@real_user_112',176678,332940,678,4313,430,'Food','Real'),
('@real_user_100',6990,2298,518,353,39,'Fashion','Real'),
('@real_user_2',356730,464945,736,10191,882,'Lifestyle','Real'),
('@real_user_63',185230,70574,560,16433,926,'Fashion','Real'),
('@real_user_54',366981,310903,580,20432,2462,'Gaming','Real'),
('@fake_user_6',590457,596,13,248,0,'Fitness','Unknown'),
('@real_user_50',326020,776458,193,22710,1618,'Fashion','Real'),
('@real_user_115',257492,245561,276,10456,1274,'Lifestyle','Real'),
('@real_user_46',357164,328760,443,35244,4593,'Fitness','Real'),
('@fake_user_19',1631876,734,38,3820,17,'Fashion','Unknown'),
('@real_user_61',40547,76900,499,4251,616,'Food','Real'),
('@fake_user_27',178249,181,11,217,1,'Lifestyle','Unknown'),
('@real_user_79',150776,210505,790,14463,1076,'Fashion','Real'),
('@real_user_59',188186,134339,139,11134,865,'Beauty','Real'),
('@real_user_91',225053,417553,460,17770,2225,'Gaming','Real'),
('@real_user_41',40247,16085,272,2184,247,'Food','Real'),
('@real_user_58',18843,29875,705,1399,157,'Gaming','Real'),
('@real_user_90',61302,40876,672,3121,372,'Fitness','Real'),
('@real_user_48',49811,69358,778,1850,191,'Lifestyle','Real'),
('@real_user_88',24282,30743,575,2095,275,'Beauty','Real'),
('@real_user_107',62175,30348,200,3129,160,'Fitness','Real'),
('@fake_user_4',1471741,589,26,6237,24,'Lifestyle','Unknown'),
('@real_user_21',271295,149115,200,22021,1852,'Gaming','Real'),
('@real_user_57',496764,229680,276,45852,6845,'Tech','Real'),
('@fake_user_24',599616,191,68,1591,14,'Tech','Unknown'),
('@fake_user_9',1393741,417,66,499,0,'Beauty','Unknown'),
('@real_user_37',273847,193208,176,16436,1234,'Fashion','Real'),
('@fake_user_20',1113089,636,14,304,1,'Tech','Unknown'),
('@real_user_1',91090,226164,210,8325,416,'Travel','Real'),
('@real_user_52',29394,14257,702,2491,149,'Beauty','Real'),
('@fake_user_10',709719,458,93,1456,2,'Fitness','Unknown'),
('@real_user_103',143607,211935,162,6785,697,'Food','Real'),
('@real_user_99',189649,70599,228,12944,1407,'Lifestyle','Real'),
('@real_user_116',33769,72649,556,1426,94,'Fitness','Real'),
('@real_user_87',10415,6874,774,363,25,'Fitness','Real'),
('@real_user_74',9432,13964,105,262,38,'Lifestyle','Real'),
('@fake_user_1',1171256,588,35,2926,8,'Gaming','Unknown'),
('@fake_user_29',228232,464,44,444,0,'Beauty','Unknown'),
('@real_user_20',333883,356274,760,13621,1783,'Travel','Real'),
('@real_user_71',29214,19839,683,2652,309,'Tech','Real'),
('@real_user_106',13519,33462,337,949,123,'Beauty','Real'),
('@real_user_14',125766,264062,794,3228,299,'Tech','Real'),
('@real_user_92',153677,323761,208,14323,1206,'Gaming','Real'),
('@real_user_102',333554,558685,526,26325,2548,'Lifestyle','Real');

-- ── TABLE 2: fake_accounts (30 accounts with engagement data) ─
DROP TABLE IF EXISTS fake_accounts;
CREATE TABLE fake_accounts (
    username        VARCHAR(100),
    followers       INT,
    engagement_rate FLOAT,
    avg_likes       INT,
    avg_comments    INT
);

INSERT INTO fake_accounts VALUES
('@real_user_64',5404,13.23094,647,68),
('@fake_user_21',1105409,0.133887,1479,1),
('@fake_user_12',533816,0.496051,2636,12),
('@real_user_29',23589,11.40786,2350,341),
('@fake_user_7',769708,0.265945,2038,9),
('@fake_user_8',959297,0.010112,97,0),
('@fake_user_25',576840,0.127938,732,6),
('@fake_user_26',233541,0.445746,1032,9),
('@real_user_51',134076,12.388496,15736,874),
('@fake_user_22',1392964,0.06418,886,8),
('@real_user_81',471255,10.791185,44541,6313),
('@fake_user_13',601946,0.395883,2379,4),
('@fake_user_2',137641,0.283346,388,2),
('@real_user_40',12253,2.913572,311,46),
('@real_user_60',24129,13.100419,2823,338),
('@real_user_95',140474,7.449777,9419,1046),
('@fake_user_18',507906,0.317578,1601,12),
('@fake_user_28',1116412,0.013078,146,0),
('@fake_user_14',811998,0.457144,3676,36),
('@fake_user_15',1498974,0.309412,4613,25),
('@fake_user_16',576072,0.418003,2389,19),
('@real_user_100',6990,5.608011,353,39),
('@real_user_63',185230,9.371592,16433,926),
('@fake_user_6',590457,0.042001,248,0),
('@real_user_61',40547,12.003354,4251,616),
('@fake_user_4',1471741,0.425415,6237,24),
('@real_user_57',496764,10.608055,45852,6845),
('@fake_user_24',599616,0.267671,1591,14),
('@fake_user_9',1393741,0.035803,499,0),
('@fake_user_29',228232,0.194539,444,0);

-- ── TABLE 3: top_200_influencers (global top 200 accounts) ───
DROP TABLE IF EXISTS top_200_influencers;
CREATE TABLE top_200_influencers (
    username        VARCHAR(100),
    followers       BIGINT,
    avg_likes       BIGINT,
    avg_comments    INT,
    engagement_rate FLOAT,
    country         VARCHAR(10),
    category        VARCHAR(100),
    posts           INT
);

INSERT INTO top_200_influencers VALUES
('@cristiano',465027234,8671953,51758,0.014916,'ES','Sports',3328),
('@kyliejenner',356687629,8296736,47534,0.017617,'US','Unknown',6921),
('@leomessi',347032978,6895178,47045,0.015534,'Unknown','Unknown',875),
('@selenagomez',334551681,6252711,39167,0.013913,'US','Unknown',1835),
('@therock',327064138,1874151,8530,0.004426,'US','Unknown',6660),
('@kimkardashian',323090977,3536820,16965,0.008304,'US','Unknown',5603),
('@arianagrande',321374794,3712126,19078,0.009326,'US','Unknown',4961),
('@beyonce',267023539,3627595,24558,0.010758,'US','Unknown',2036),
('@khloekardashian',260359924,2391194,10442,0.006557,'US','Sports',4092),
('@kendalljenner',247599374,5520992,21191,0.016729,'US','Unknown',666),
('@justinbieber',247448517,1887638,10085,0.006191,'CA','Unknown',7305),
('@natgeo',232020700,304664,1225,0.001092,'US','Education',10002),
('@nike',228524022,333382,5521,0.001431,'US','Sports',932),
('@taylorswift',218097325,2397441,335,0.008864,'US','Unknown',537),
('@jlo',217547805,1691842,11943,0.005914,'US','Music',3151),
('@virat.kohli',206743723,3472382,18090,0.012603,'Unknown','Education',1390),
('@nickiminaj',197697257,2161401,19625,0.008325,'US','Trailers',6327),
('@kourtneykardash',188868254,1767538,6617,0.007639,'US','Unknown',4349),
('@mileycyrus',178122866,1311898,6344,0.005723,'Unknown','Unknown',1217),
('@neymarjr',176162107,2705534,48,0.012796,'BR','Gaming',5247),
('@katyperry',167005817,720700,4825,0.003596,'Unknown','Nonprofits & Activism',2028),
('@kevinhart4real',148755284,533487,3750,0.002873,'US','Sports',8126),
('@zendaya',147816903,5744110,16106,0.028354,'US','Unknown',3537),
('@iamcardib',137199449,3094441,18911,0.01596,'US','Unknown',1596),
('@ddlovato',136695965,1146627,9535,0.006487,'US','Unknown',66),
('@badgalriri',133436105,3691546,20974,0.020384,'US','Entertainment',4837),
('@kingjames',127326148,2102660,13786,0.013242,'Unknown','Unknown',2331),
('@theellenshow',123619409,424886,3788,0.002642,'US','Pets & Animals',9987),
('@realmadrid',121711711,1009068,3553,0.006819,'ES','Sports',6593),
('@champagnepapi',116476688,1723164,83,0.011733,'NL','Unknown',5194),
('@chrisbrownofficial',115007167,465597,3863,0.003186,'US','Unknown',7282),
('@fcbarcelona',109950457,1176560,4342,0.008817,'Unknown','Sports',9988),
('@billieeilish',104462435,8520778,45267,0.064805,'Unknown','Unknown',684),
('@dualipa',85085187,2091782,4827,0.018538,'GB','Music',1224),
('@gal_gadot',83763785,1377080,4787,0.012007,'US','Entertainment',1676),
('@vindiesel',81632030,1384973,7997,0.012694,'US','Film & Animation',1817),
('@priyankachopra',80262430,1580292,4660,0.014784,'US','Autos & Vehicles',3545),
('@lalalalisa_m',79870794,5650260,51630,0.058718,'Unknown','Unknown',860),
('@nasa',78572117,1172500,3965,0.01258,'US','Science & Technology',3522),
('@shakira',75751033,973226,6292,0.010292,'Unknown','Unknown',1976),
('@gigihadid',74890004,2555316,6587,0.026047,'US','Unknown',3248),
('@snoopdogg',74552708,205719,2674,0.002394,'Unknown','Movies',9995),
('@davidbeckham',74516736,1237162,4077,0.012811,'US','Unknown',1522),
('@shraddhakapoor',73424750,1609147,6224,0.016021,'Unknown','Unknown',1872),
('@victoriassecret',73016997,148112,389,0.001551,'US','Unknown',2796),
('@k.mbappe',72335779,2454368,10607,0.028675,'Unknown','Sports',1149),
('@nehakakkar',70376999,1530347,7334,0.016693,'IN','Music',2298),
('@shawnmendes',69407554,3500515,23996,0.039421,'CA','Unknown',2532),
('@nba',68938585,374009,1015,0.004285,'US','Sports',12610),
('@narendramodi',68330604,2953852,24367,0.032834,'IN','Pets & Animals',537),
('@jennierubyjane',68085856,5080828,42239,0.058717,'Unknown','Unknown',857),
('@deepikapadukone',67796542,1544529,4756,0.016577,'IN','Unknown',258),
('@tomholland2013',67657871,5408241,27397,0.064857,'Unknown','Unknown',1218),
('@aliaabhatt',67428908,1759431,6893,0.019699,'IN','Entertainment',1820),
('@ronaldinho',67398061,891414,4287,0.010176,'BR','Sports',2921),
('@emmawatson',67107508,1858345,6711,0.020234,'US','Unknown',344),
('@bts.bighitofficial',65962589,4172263,35250,0.051423,'UY','Unknown',1150),
('@katrinakaif',65597009,1674335,8972,0.021554,'IN','Entertainment',997),
('@justintimberlake',65477707,614677,6040,0.00789,'US','Unknown',780),
('@marvel',65358436,328738,1066,0.00471,'TR','Movies',6907),
('@camila_cabello',64375364,1853524,7368,0.021927,'US','Unknown',2884),
('@willsmith',64260079,1408560,12990,0.01766,'US','Unknown',1362),
('@raffinagita1717',62899363,387144,3717,0.004511,'ID','Entertainment',9946),
('@anitta',62896138,857234,7633,0.010235,'US','Unknown',5091),
('@maluma',62706097,1195151,8057,0.01371,'CO','Unknown',8164),
('@akshaykumar',62614053,1516770,7211,0.019009,'Unknown','Entertainment',1860),
('@jacquelinef143',62118961,1143262,4781,0.013907,'IN','Entertainment',2433),
('@sooyaaa__',62062471,4493907,35146,0.060021,'Unknown','Film & Animation',824),
('@psg',61178714,508990,1457,0.007728,'FR','Sports',9761),
('@roses_are_rosie',60940323,4586885,31562,0.06063,'Unknown','Sports',816),
('@anushkasharma',59276468,1925205,5907,0.023877,'Unknown','Education',1159),
('@manchesterunited',58974258,384605,1878,0.005464,'GB','Sports',9900),
('@whinderssonnunes',58591940,1616371,16203,0.021311,'BR','Unknown',2717),
('@9gag',58181054,678711,5559,0.008779,'US','Pets & Animals',10021),
('@marcelotwelve',57439765,693038,2503,0.01023,'BR','Shows',2671),
('@karimbenzema',55869867,876565,5393,0.013317,'ES','Music',2000),
('@chrishemsworth',55165178,2745384,8746,0.036724,'AU','Trailers',859),
('@paulpogba',54634350,1397068,5837,0.019361,'FR','Unknown',1279),
('@iamzlatanibrahimovic',54512391,1541239,7580,0.02039,'Unknown','Sports',868),
('@karolg',54422099,3028631,20350,0.043755,'IN','People & Blogs',3297),
('@leonardodicaprio',54158640,398191,3510,0.006375,'Unknown','Pets & Animals',1680),
('@milliebobbybrown',54105006,3987303,18188,0.053836,'US','Unknown',275),
('@juventus',54054171,201091,953,0.003212,'Unknown','Gaming',9974),
('@zacefron',53887887,2262104,9847,0.030471,'US','Movies',663),
('@tatawerneck',53554512,976812,6599,0.0131,'BR','Entertainment',5565),
('@bellahadid',53359256,1132707,2688,0.015993,'GB','Unknown',3125),
('@robertdowneyjr',53210425,2984656,12541,0.041368,'US','Entertainment',422),
('@sunnyleone',53190031,769200,3678,0.010291,'Unknown','Entertainment',4559),
('@ladygaga',53092230,1435303,13384,0.020374,'US','Music',3546),
('@beingsalmankhan',52980205,1399898,17133,0.020452,'IN','Entertainment',1173),
('@jbalvin',52762698,920868,5562,0.014752,'Unknown','Gaming',9999),
('@sergioramos',52261132,966415,3087,0.015555,'Unknown','Gaming',2218),
('@ayutingting92',52170594,149140,849,0.002178,'ID','Music',10018),
('@dishapatani',52062772,1615190,6307,0.022231,'US','Entertainment',2128),
('@mosalah',51823495,1786297,12480,0.029781,'Unknown','Unknown',832),
('@433',50846051,863448,4092,0.01387,'NL','Unknown',10319),
('@hudabeauty',50651842,187184,2296,0.00274,'US','Fashion & Beauty',2330),
('@adele',50542177,4739484,32031,0.067521,'US','Unknown',418),
('@michelleobama',50389066,707603,6838,0.012859,'Unknown','Entertainment',592),
('@jamesrodriguez10',49753046,1414736,10242,0.022404,'CO','Sports',1054),
('@kritisanon',49721095,898828,3057,0.013389,'IN','Fashion & Beauty',2652),
('@krisjenner',49106907,354127,1545,0.006015,'US','Entertainment',6327),
('@lelepons',49030990,2414815,13185,0.037232,'US','Comedy',2517),
('@charlidamelio',48873294,4278895,14339,0.059701,'Unknown','Entertainment',142),
('@gucci',48757827,116555,482,0.002287,'IT','Comedy',8791),
('@louisvuitton',48520702,131579,653,0.002418,'FR','Unknown',6378),
('@prillylatuconsina96',48422538,377882,1243,0.005364,'ID','Entertainment',6420),
('@dovecameron',48100914,1609563,2932,0.025255,'US','Entertainment',170),
('@garethbale11',47821374,764641,3406,0.012807,'Unknown','Sports',975),
('@paulodybala',47720068,1791514,7572,0.032378,'Unknown','Sports',1263),
('@blackpinkofficial',47647921,2116102,13237,0.035468,'Unknown','Music',1380),
('@jokowi',47352198,458724,4423,0.008145,'Unknown','Gaming',3471),
('@nusr_et',46891641,730787,5602,0.012721,'AE','Unknown',2302),
('@5.min.crafts',46618064,157499,342,0.002579,'US','Trailers',14519),
('@vanessahudgens',46343441,636093,1562,0.01043,'US','Entertainment',4186),
('@thv',46328487,15538683,0,0.308518,'Unknown','Gaming',57),
('@harrystyles',46292534,4896516,61609,0.087132,'US','Unknown',578),
('@zayn',46197756,4713926,69133,0.077751,'US','Unknown',162),
('@larissamanoela',46091767,579901,6269,0.009754,'BR','Autos & Vehicles',5156),
('@haileybieber',45916230,2012107,218,0.034464,'Unknown','Entertainment',2060),
('@thenotoriousmma',45822094,1137054,4821,0.018763,'US','Unknown',3106),
('@daddyyankee',45807054,650651,5624,0.011222,'PR','Music',20),
('@travisscott',45803997,3014370,12261,0.050787,'US','Unknown',3154),
('@natgeotravel',45782549,189864,456,0.00333,'US','Travel & Events',16939),
('@nikefootball',45180601,431240,903,0.006958,'US','Sports',1797),
('@stephencurry30',44569769,1090496,3599,0.019265,'Unknown','Nonprofits & Activism',1037),
('@vancityreynolds',44507303,1366929,5185,0.026023,'Unknown','Gaming',678),
('@luissuarez9',44043371,801790,3327,0.015129,'Unknown','Travel & Events',961),
('@maisa',43950253,564756,2425,0.010316,'BR','Nonprofits & Activism',1452),
('@gusttavolima',43727522,476984,6854,0.008851,'BR','Shows',4853),
('@hrithikroshan',43427057,1615512,6874,0.027433,'CI','News & Politics',583),
('@nickyjam',43340622,383992,2543,0.006809,'CO','Unknown',11282),
('@jannatzubair29',43312974,1326974,10852,0.02508,'Unknown','Fashion & Beauty',1600),
('@varundvn',43215034,1065018,5573,0.020928,'IN','Trailers',1899),
('@brunamarquezine',43067731,1002055,7223,0.017398,'US','Entertainment',3016),
('@caradelevingne',42991683,806313,2654,0.014206,'US','Unknown',4380),
('@buzzfeedtasty',42970746,67247,455,0.001227,'ES','Travel & Events',8617),
('@kapilsharma',42000622,664476,3187,0.018015,'Unknown','Comedy',958),
('@britneyspears',41807497,523267,9892,0.010752,'TR','Unknown',2998),
('@mariliamendoncacantora',41681598,1058071,10442,0.018818,'BR','Music',1429),
('@badbunnypr',41310397,3644588,58247,0.066435,'Unknown','Comedy',16),
('@dior',41223938,88831,533,0.001948,'Unknown','Gaming',9623),
('@norafatehi',41161527,1364005,5437,0.024253,'AI','Comedy',1682),
('@jenniferaniston',40741767,4565592,36019,0.084107,'Unknown','Gaming',98),
('@marinaruybarbosa',40573646,586382,3470,0.010868,'BR','Unknown',2098),
('@addisonraee',40402560,3150451,8362,0.060824,'Unknown','Gaming',298),
('@theweeknd',40223677,1141439,7543,0.023413,'Unknown','News & Politics',630),
('@ranveersingh',40112340,1015088,3004,0.018816,'CH','Movies',1738),
('@andresiniesta8',39745058,250762,716,0.00558,'ES','Fashion & Beauty',1977),
('@princessyahrini',39581466,118171,693,0.002861,'ID','Unknown',4455),
('@liverpoolfc',39515025,346708,1254,0.007418,'GB','Unknown',9953),
('@teddysphotos',39439449,738567,4255,0.015654,'US','Unknown',2301),
('@georginagio',39025459,2237436,7402,0.047357,'Unknown','Fashion & Beauty',726),
('@natashawilona12',38846946,489665,3433,0.009924,'Unknown','Fashion & Beauty',1143),
('@ruben_onsu',38776943,139325,764,0.002738,'ID','Unknown',13440),
('@mahi7781',38747041,4054863,67653,0.089113,'Unknown','Gaming',107),
('@chrissyteigen',38516696,631386,3799,0.012565,'US','Entertainment',5078),
('@hm',38465468,89144,280,0.00184,'SE','Unknown',7234),
('@wizkhalifa',38459483,402889,2102,0.008034,'US','Unknown',424),
('@j.m',38138950,14124890,1,0.345696,'Unknown','Gaming',22),
('@anushkasen0408',37993409,695413,5034,0.014706,'Unknown','Travel & Events',5203),
('@worldstar',37818287,157546,2493,0.003166,'US','Comedy',99022),
('@prattprattpratt',37405186,813539,4915,0.01885,'Unknown','Trailers',718),
('@marvelstudios',37389526,594215,1984,0.014387,'Unknown','Trailers',2593),
('@WesleySafadao',37149804,256130,7319,0.005563,'Unknown','Unknown',8842),
('@parineetichopra',36973458,505700,1639,0.010462,'Unknown','Autos & Vehicles',1325),
('@cznburak',36935601,816501,8524,0.023209,'Unknown','Trailers',1746),
('@laudyacynthiabella',36677982,172774,545,0.00329,'ID','Movies',379),
('@antogriezmann',36381765,1132433,4323,0.024641,'FR','Sports',865),
('@gisel_la',36318320,152329,2452,0.003163,'Unknown','Sports',9874),
('@eminem',36182573,1093016,9202,0.025279,'US','Music',649),
('@rkive',36005772,10938709,0,0.282514,'Unknown','Gaming',103),
('@colesprouse',35979076,2286898,7860,0.05574,'Unknown','Unknown',1139),
('@nattinatasha',35925441,517671,2717,0.010886,'CZ','Music',26),
('@mercedesbenz',35833928,197898,385,0.004443,'VG','Autos & Vehicles',9990),
('@tigerjackieshroff',35453527,1110819,6014,0.02461,'IN','Sports',2071),
('@barackobama',35433452,1130236,10507,0.027317,'US','Unknown',654),
('@shahidkapoor',35378098,1294705,5296,0.034332,'Unknown','Trailers',1139),
('@kimberly.loaiza',35190427,2668449,30748,0.056578,'MX','Trailers',586),
('@sachintendulkar',35033518,800380,2111,0.018467,'Unknown','Unknown',995),
('@simoneses',34784799,425578,4540,0.010601,'BR','Unknown',4394),
('@ivetesangalo',34714162,234006,3542,0.00572,'BR','Shows',7555),
('@paollaoliveirareal',34565086,367805,3025,0.008254,'Unknown','Music',4544),
('@lunamaya',34486065,145526,948,0.003213,'Unknown','Fashion & Beauty',4035),
('@dannapaola',34446899,1458304,3328,0.030553,'MX','Unknown',1934),
('@blakelively',34420991,3222808,9166,0.068239,'US','Unknown',112),
('@toni.kr8s',34281435,597180,2315,0.01418,'Unknown','Nonprofits & Activism',931),
('@adidasoriginals',34246782,151287,667,0.003434,'Unknown','Unknown',259),
('@disney',33912535,185166,1054,0.005568,'US','Movies',7196),
('@shaymitchell',33777981,754880,1958,0.017073,'US','Science & Technology',6292),
('@khabib_nurmagomedov',33561258,693616,5064,0.017385,'RU','Sports',4509),
('@bmw',33536702,232947,587,0.005627,'DE','Autos & Vehicles',9247),
('@zidane',33177179,1059596,6400,0.025347,'FR','Gaming',366),
('@nancyajram',33102343,391202,3792,0.009286,'FR','Music',3810),
('@sonamkapoor',33043019,264547,869,0.006285,'IN','Entertainment',4799),
('@luansantana',33024460,205588,4795,0.00505,'BR','Unknown',714),
('@danbilzerian',32938902,2044189,24681,0.053036,'CA','Pets & Animals',1372),
('@nickjonas',32906383,744226,2191,0.01799,'US','Unknown',2315),
('@gururandhawa',32845959,637758,3837,0.015257,'US','Education',2140),
('@iambeckyg',32812027,625421,1588,0.014031,'US','Unknown',2270);

-- ============================================================
-- ANALYSIS QUERIES
-- ============================================================

-- ── QUERY 1: Engagement Rate per account ─────────────────────
-- Who has the highest genuine engagement relative to their followers?
SELECT 
    username,
    category,
    label,
    followers,
    ROUND((avg_likes + avg_comments) * 100.0 / followers, 2) AS engagement_rate_pct
FROM accounts
ORDER BY engagement_rate_pct DESC;


-- ── QUERY 2: Fraud Signal — Following > Followers ────────────
-- Fake accounts often follow more people than follow them (follow-for-follow tactic)
SELECT 
    username,
    followers,
    following,
    label,
    ROUND(following / followers, 2) AS ff_ratio
FROM accounts
WHERE following > followers
ORDER BY ff_ratio DESC;


-- ── QUERY 3: Category-wise Performance Summary ───────────────
-- Which content category has best avg engagement across platform?
SELECT 
    category,
    COUNT(*) AS total_accounts,
    ROUND(AVG(followers), 0) AS avg_followers,
    ROUND(AVG(avg_likes), 0) AS avg_likes,
    ROUND(AVG(avg_likes) * 100.0 / AVG(followers), 2) AS avg_engagement_pct
FROM accounts
GROUP BY category
ORDER BY avg_engagement_pct DESC;


-- ── QUERY 4: Real vs Unknown — Behavioral Comparison ─────────
-- Core fraud detection: do Unknown accounts behave differently?
SELECT 
    label,
    COUNT(*) AS total,
    ROUND(AVG(following / followers), 2) AS avg_ff_ratio,
    ROUND(AVG(avg_likes * 100.0 / followers), 2) AS avg_engagement_pct,
    ROUND(AVG(posts), 0) AS avg_posts,
    ROUND(AVG(followers), 0) AS avg_followers
FROM accounts
GROUP BY label;


-- ── QUERY 5: Window Function — Rank accounts within category ──
-- Find the top performer in each content category
SELECT 
    username,
    category,
    followers,
    avg_likes,
    RANK() OVER (PARTITION BY category ORDER BY avg_likes DESC) AS rank_in_category
FROM accounts
ORDER BY category, rank_in_category;


-- ── QUERY 6: JOIN — Cross-check accounts vs fake_accounts ────
-- Which usernames appear in both tables? These are confirmed suspicious.
SELECT 
    a.username,
    a.followers,
    a.label,
    a.category,
    f.engagement_rate AS fake_table_engagement,
    ROUND((a.avg_likes + a.avg_comments) * 100.0 / a.followers, 2) AS accounts_engagement
FROM accounts a
JOIN fake_accounts f ON a.username = f.username;


-- ── QUERY 7: Fake accounts — High Followers, Low Engagement ──
-- Classic bot pattern: bought followers, no real interaction
SELECT 
    username,
    followers,
    engagement_rate,
    avg_comments,
    CASE 
        WHEN engagement_rate < 1.0 AND followers > 100000 THEN 'HIGH RISK — Likely Bot'
        WHEN engagement_rate < 3.0 AND followers > 50000  THEN 'MEDIUM RISK — Suspicious'
        ELSE 'LOW RISK'
    END AS fraud_flag
FROM fake_accounts
ORDER BY fraud_flag, followers DESC;


-- ── QUERY 8: Top 200 Influencers — Country-wise Avg Engagement
-- Which country produces the most engaging influencers globally?
SELECT 
    country,
    COUNT(*) AS influencer_count,
    ROUND(AVG(followers), 0) AS avg_followers,
    ROUND(AVG(engagement_rate) * 100, 3) AS avg_engagement_pct
FROM top_200_influencers
WHERE country != 'Unknown'
GROUP BY country
HAVING COUNT(*) >= 2
ORDER BY avg_engagement_pct DESC;
