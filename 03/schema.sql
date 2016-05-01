--drop table vsisp09.estate;
drop table vsisp09.apartment;
drop table vsisp09.house;
drop table vsisp09.estate_agent;
drop table vsisp09.person;
--drop table vsisp09.contract;
drop table vsisp09.tenancy_contract;
drop table vsisp09.purchase_contract;
-- estate and sub-types
create table vsisp09.apartment (ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, CITY VARCHAR(50), POSTAL_CODE VARCHAR(50), STREET VARCHAR(50), STREET_NUMBER INTEGER, SQUARE_AREA VARCHAR(50), ESTATE_AGENT INTEGER, FLOOR INTEGER, RENT DOUBLE, ROOMS INTEGER, BALCONY SMALLINT, BUILT_IN_KITCHEN SMALLINT, TENANCY_CONTRACT INTEGER, PERSON INTEGER);
create table vsisp09.house (ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, CITY VARCHAR(50), POSTAL_CODE VARCHAR(50), STREET VARCHAR(50), STREET_NUMBER INTEGER, SQUARE_AREA VARCHAR(50), ESTATE_AGENT INTEGER, FLOORS INTEGER, PRICE DOUBLE, GARDEN SMALLINT, PURCHASE_CONTRACT INTEGER, PERSON INTEGER);
create table vsisp09.estate_agent(ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, NAME VARCHAR(50), ADDRESS VARCHAR(50), LOGIN VARCHAR(50), PASSWORD VARCHAR(50));
create table vsisp09.person(ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, FIRST_NAME VARCHAR(50), NAME VARCHAR(50), ADDRESS VARCHAR(50));
-- contract and subtypes
create table vsisp09.tenancy_contract (ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, DATE DATE, PLACE VARCHAR(50), START_DATE DATE, DURATION INTEGER, ADDITIONAL_COSTS DOUBLE, PERSON INTEGER, APARTMENT INTEGER);
create table vsisp09.purchase_contract (ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, DATE DATE, PLACE VARCHAR(50), NUMBER_OF_INSTALLMENTS INTEGER, INTEREST_RATE INTEGER, PERSON INTEGER, HOUSE INTEGER);
-- relation ships
alter table vsisp09.apartment add foreign key (ESTATE_AGENT) references vsisp09.estate_agent(ID) on delete restrict; 
alter table vsisp09.house add foreign key (ESTATE_AGENT) references vsisp09.estate_agent(ID) on delete restrict; 
alter table vsisp09.tenancy_contract add foreign key (PERSON) references vsisp09.person(ID) on delete restrict; 
alter table vsisp09.tenancy_contract add foreign key (APARTMENT) references vsisp09.apartment(ID) on delete restrict; 
alter table vsisp09.purchase_contract add foreign key (PERSON) references vsisp09.person(ID) on delete restrict; 
alter table vsisp09.purchase_contract add foreign key (HOUSE) references vsisp09.house(ID) on delete restrict; 
