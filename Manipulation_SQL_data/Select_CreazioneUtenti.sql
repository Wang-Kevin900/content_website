"
Svolgere i due seguenti esercizi sulle basi di dati da ciascuno realizzate come progetto individuale nel primo quadrimestre.

Esercizio 1:
Riprendendo ciascuno il proprio database realizzato per il primo quadrimestre, svolgere le seguenti interrogazioni sui dati:"
"1- Scrivere una query di tipo select all (select *) su una tabella del proprio database priva di vincoli di foreign key"
select * from Device

"2- Scrivere una query di tipo select contenente una join (inner join o equi-join) su due (o tre )tabelle del proprio database legate da vincoli di foreign key"
Select Application_user.*
from Application_user INNER JOIN Subscription on Application_user.IDapplication_user = Subscription.IDsubscription

"3- Scrivere una query di tipo select count su una tabella del proprio database contenente almeno 5 record (in caso non ne aveste una presente, inserire nuovi dati)"
Select count(Application_user.IDapplication_user) as Subscriber_number
from Application_user
where Application_user.subscribed="1"

"4- Scrivere una query di tipo select su una tabella del proprio database contenente di dati personali che visualizzi i record della query in ordine alfabetico rispetto al nome degli utenti
Consegnare le query su classrom in un file denominato [nome del database]Query.sql"
select Application_user.*
from Application_user
order by Application_user.name


---
CREATE USER 'Admin'@'%' identified by '123456';

grant all privlieges on *.* to 'copiaAdmin'@'%' identified by 'myAdmin' "(with grant option;)";

grant select, insert, update, delete to 'marioRossi'@'localhost' on aziende5CI.*; 

revoke grant option on *.* from "admin"@"%"

revoke insert on *.* from "admin"@"%"

revoke all privlieges on aziende5CI.* from 'marioRossi'@'localhost';

create view aziendeAlimentari attribuisce select * from azienda where settore = "alimentare";

select application_user.*, count(credit_card.*) as numero_carta
from application_user, credit_card
where application_user.IDapplication_user=credit_card.IDapplication_user
group by application_user.IDapplication_user
having numero_carta>1

"per ogni categoria, visualizzare titolo che ha avuto il maggior numero di visualizzazioni"
select content.title, category.type_of_category, count(view_content.visualized)
from application_user, view_content, category, content, list
where view_content.IDapplication_user=application_user.IDapplication_user and view_content.IDcontent=content.IDcontent 
and list.IDcontent=content.IDcontent and list.IDcategory=category.IDcategory
group by category.type_of_category
---

"
Esercizio 2:
Riprendendo ciascuno il proprio database realizzato per il primo quadrimestre, creare almeno 6 profili utente autorizzati ad operare su tutto o parte del database secondo le seguenti richieste:"
"1- creare una copia dell'amministratore priva però di grant option che possa operare da qualsiasi device"
Create User "admin"@"%"; grant all privileges on *.* to "admin"@"%"; revoke grant option on *.* from "admin"@"%"

"2- creare un utente sviluppatore con privilegi di tipo DDL, DML, QL che possa operare da localhost"
Create User "sviluppatore"@"localhost"; grant create, insert, select on *.* to "sviluppatore"@"localhost"

"3- creare un utente gestore con privilegi di tipo DML, QL che possa operare da qualsiasi postazione su tutta la base di dati"
Create User "gestore2"@"%"; grant insert, select, delete on *.* to "gestore2"@"%"; revoke delete on *.* from "gestore2"@"%"

"4- creare un utente gestore con privilegi di tipo DML, QL che possa operare da localhost su una tabella della base di dati"
Create User "Gestore"@"localhost"; grant insert, select on progetto_informatica.act to "Gestore"@"localhost"

"5- creare un utente cliente con privilegi di tipo QL che possa operare localhost su tutta la base di dati"
Create User "cliente"@"localhost"; grant select on *.* to "cliente"@"localhost"

"6- creare un utente cliente con privilegi di tipo QL che possa operare da localhost su una tabella della base di dati"
Create User "user"@"localhost"; grant select on progetto_informatica.act to "user"@"localhost";

"Consegnare le query su classrom in un file denominato [nome del database]Users.sql
Aggiungere in un commento nello stesso file quali tipologie di utenti (anche diverse da quelle proposte) vorreste ammettere ad operare sulla vostra base di dati.
"