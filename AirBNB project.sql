#AIRBNB PROJECT

use krishna;

#1
select name from ali;
#2
select * from ali;
select * from abk;
#3
select count(listing_id)from abk;
#4
select count(id) from ali ;

#5
select host_id from ali;
#6
select distinct host_name from ali;
#7
select distinct neighbourhood_group from ali;
#8
select distinct neighbourhood from ali;
#9
select distinct room_type from ali;
#10
select * from ali where neighbourhood_group in('brooklyn','manhatten');
#11
select max(price)from abk;
#12
select min(price)from abk;
#13
select avg(price)from abk;
#14
select min(minimum_nights)from abk;
#15
select max(minimum_nights)from abk;
#16
select avg(availability_365)from abk;
#17
select listing_id,availability_365 from abk where availability_365>300;
#18
select count(listing_id) from abk where price between 300 and 400;
#19
select count(listing_id)from abk where minimum_nights<5;
#20
select count(listing_id)from abk where minimum_nights>100;
#21
select * from ali l left join abk b
on l.id=b.listing_id
union
select *from ali l right join abk b
on l.id=b.listing_id;
#22
select l.host_name,b.price from ali l inner join abk b on l.id=b.listing_id;
#23
select l.room_type,b.price from ali l inner join abk b on l.id=b.listing_id;
#24
select l.neighbourhood_group,b.minimum_nights from ali l inner join abk b on l.id=b.listing_id;
#25
select l.neighbourhood,b.availability_365 from ali l 
inner join abk b on l.id=b.listing_id;
#26
select l.neighbourhood_group,sum(b.price) from ali l 
inner join abk b on l.id=b.listing_id group by l.neighbourhood_group;
#27
select l.neighbourhood_group,max(b.price) from ali l 
inner join abk b on l.id=b.listing_id group by l.neighbourhood_group;
#28
select l.neighbourhood_group,max(b.minimum_nights) from ali l 
inner join abk b on l.id=b.listing_id group by l.neighbourhood_group;
#29
select l.neighbourhood,max(b.reviews_per_month) from ali l 
inner join abk b on l.id=b.listing_id group by l.neighbourhood;
#30
select l.room_type,max(b.price)from ali l 
inner join abk b on l.id=b.listing_id group by l.room_type ;
#31
select l.room_type,avg(b.number_of_reviews)from ali l
inner join abk b on l.id=b.listing_id group by l.room_type;
#32
select l.room_type,avg(b.price)from ali l 
inner join abk b on l.id=b.listing_id group by l.room_type;
#33
select l.room_type,avg(b.minimum_nights)from ali l inner join abk b 
on l.id=b.listing_id group by l.room_type;
#34
select l.room_type,avg(b.price)from ali l inner join abk b 
on l.id=b.listing_id group by l.room_type having avg(b.price)<100; 
#35
select l.neighbourhood,avg(b.minimum_nights)from ali l inner join abk b 
on l.id=b.listing_id group by l.neighbourhood having avg(b.minimum_nights)>5;
#36
SELECT * FROM ali WHERE id in (SELECT listing_id FROM abk WHERE price>200);
#37
select * from abk where listing_id in(select id from ali where id=314941) ;
#38
SELECT id, host_id
FROM ali
GROUP BY id, host_id
HAVING COUNT(*) = 1;

#39
select * from ali where name like '%cozy%';
#40
select l.host_id,l.neighbourhood_group,b.price from ali l
inner join abk b on l.id=b.listing_id 
where l.neighbourhood_group='manhattan';
#41
select l.id,l.host_name,l.neighbourhood,b.price from ali l 
inner join abk b on l.id=b.listing_id
where neighbourhood in('west side','williamsburg')and b.price>100;
#42
select l.id,l.host_name,l.neighbourhood,b.price from ali l
inner join abk b on l.id=b.listing_id 
where l.host_name ='elise'and l.neighbourhood='bedford-stuyvesant';
#43
select l.host_name,b.availability_365,b.minimum_nights from ali l inner join abk b on l.id=b.listing_id where b.availability_365>100 and b.minimum_nights>100;
#44
select l.id,l.host_name,b.number_of_reviews,b.reviews_per_month from ali l 
inner join abk b on l.id=b.listing_id 
where b.number_of_reviews>500 and b.reviews_per_month >5;
#45
select l.neighbourhood_group,count(b.number_of_reviews)as total_reviews
from ali l  join abk b on l.id=b.listing_id group by l.neighbourhood_group 
having count(b.number_of_reviews)=(select max(review_count)from
(select count(b.number_of_reviews)as review_count from ali l join abk b on l.id=b.listing_id 
group by l.neighbourhood_group) as maxs);

#46
select l.host_name ,sum(b.price)as total from ali l
inner join abk b on l.id=b.listing_id 
group by l.host_name order by total asc limit 1; 
#47
select l.host_name,sum(b.price)as total_price from ali l 
inner join abk b on l.id=b.listing_id
group by l.host_name order by total_price desc limit 1 ;
#48
select l.host_name,b.price from ali l inner join abk b on l.id=b.listing_id where b.price=(select max(price)from abk);
#49
select l.neighbourhood_group,b.price from ali l inner join abk b on l.id=b.listing_id where b.price<100;
#50
select l.room_type,avg(b.availability_365)as average ,max(b.price)maximum from ali l inner join abk b on l.id=b.listing_id group by l.room_type order by maximum;
