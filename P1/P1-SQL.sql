select name from Country

select name from Mountain where height between 3000 and 4000

select * from Province 
join Country on Province.country = Country.code
join Encompasses on Country.code = Encompasses.country
where Province.area < 200 and continent = "Europe"

select distinct name as language from Language join Country on Language.country = Country.code

select name, Independence from Independence join Country on Independence.country = Country.code

select distinct code, name from Borders 
join Country on Country.code in (Borders.country1, Borders.country2)
where Borders.country1 in ('TJ','IND') 
or Borders.country2 in ('TJ','IND')

select Mountain, height from GeoMountain 
join Mountain on GeoMountain.mountain = Mountain.name
join Country on Country.code = GeoMountain.country
where Country.name = 'Switzerland' 
and height between 4400 and 4500

select * from Borders 
join Country on Country.code in (Borders.country1, Borders.country2)
where Borders.country1 IN ( select Country.code from Country)  
and Borders.country2 IN ( select Country.code from Country)

(Pas la 9)

select * from Country
join Province on Country.code = Province.country
where Province.name in (select Country.name from Country)

select * from Borders 
join Country on Country.code in (Borders.country1, Borders.country2)
where 'USA' in (Borders.country1, Borders.country2)