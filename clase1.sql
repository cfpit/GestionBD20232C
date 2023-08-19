-- funciones de agrupacion
-- precio del libro mas caro
select max(price) from titles;-- 22.95

-- precio del libro mas barato
select min(price) from titles;-- 2.99

-- cantidad de titulos
select count(title_id) from titles;-- 19

-- promedio de precios de los titulos
select truncate(avg(price),3) from titles;-- 14.766

-- sumatoria de precio de los titulos
select round(sum(price),3) from titles;-- 236.260

-- todas las funciones en una sola query
select	max(price) as 'libro mas caro',
		min(price) as 'libro mas barato',
        count(title_id) cantidad,
        avg(price) promedio,
        sum(price) as total
from	titles;

-- Agrupaciones
-- cantidad de titulos por categoria
select		type as categoria,
			count(title_id) as cantidad
from		titles
where		type not like '%cook%'
group by	type
having		count(title_id) > 2
order by	1
limit		1,2;

-- joins
-- inner join
-- ansi
select		p.pub_name editorial,
			t.title libro
from		publishers p
inner join	titles t
on			t.pub_id = p.pub_id;        


select		p.pub_name editorial,
			t.title libro
from		publishers p, titles t
where		t.pub_id = p.pub_id;



select		provincia,
			localidad,
			count(Dni) as poblacion
from		censo
group by	provincia,localidad;

-- outer join
-- tabla ppal: titles
-- tabla secundaria: sales
select	title libro
		-- ,s.*
-- from	titles t  left join sales s
from	sales s right join titles t 
on		s.title_id = t.title_id
where	s.stor_id is null;







