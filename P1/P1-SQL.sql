1) select capital as name from Country
intersect 
select name from Province

2) select C.name from Borders B
join Country C on B.country2 = C.code
join Country D on B.country1 = D.code
where country2 != "USA" 
and country1 in
    (select country2 from Borders 
    join Country on Country.code = Borders.country1
    where 'USA' in (Borders.country1, Borders.country2))

3) select count(distinct name) as cnt from EthnicGroup

4) PAS CORRECT select distinct C.name, count(country1) as cnt from Country C
join Borders B on C.code in (B.country1,B.country2)
group by C.name
having count(country1) <= 3
union 
select C.name, 0 as cnt
from Country C
where C.code not in (select country1 from Borders)

5) select C.code as country, L.name
from Language L
join Country C on L.country == C.code 
where L.percentage in 
                (select max(L.percentage)
                from Language L
                where L.country == C.code)

6) PAS CORRECT select C.code as c1, D.code as c2
from Borders B
join Country D on B.country1 = D.code
join Country C on B.country2 = C.code
where not exists
            (select * 
            from Borders B
            where B.country1 = C.code 
            and B.country2 = D.code)

7) PAS CORRECT select L.name, cast(sum(L.percentage) as float) as unknown_lang_p from Language L
join Country C on C.code = L.country
group by C.name
having cast(sum(L.percentage) as float) < 99.0

8) select name from Country

9) select name from Mountain where height between 3000 and 4000

10) select Province.name as province, Country.name as country from Province 
join Country on Province.country = Country.code
join Encompasses on Country.code = Encompasses.country
where Province.area < 200 and continent = "Europe"

11) select distinct Language.name as language from Language join Country on Language.country = Country.code

12) select name, Independence from Independence join Country on Independence.country = Country.code

13) PAS CORRECT select distinct C2.code, C2.name from Borders B
join Country C1 on C1.code = B.country1
join Country C2 on C2.code = B.country2
where B.country1 in ("IND","TJ")
and B.country1 in ("IND","TJ")

14) select Mountain, height from GeoMountain 
join Mountain on GeoMountain.mountain = Mountain.name
join Country on Country.code = GeoMountain.country
where Country.name = 'Switzerland' 
and height between 4400 and 4500

15) select C.name as name1, A.name as name2
from Borders B
join Country C on C.code = B.country1
join Country A on A.code = B.country2
where C.code < A.code

16) select name from Country where code not in (select country from GeoMountain)