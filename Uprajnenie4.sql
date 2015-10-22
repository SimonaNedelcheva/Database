--�������� ������, ����� �� ����� ����, ��-����� �� 120 ������, �������
--��������, ������, ��� � ����� �� ������.
--��������� ��� �����, ����������� �� ���� ������, ��������� �� ��� �� ������
select distinct m.studioname, si.starname
from movie m join starsin si on m.title=si.movietitle and m.year=si.movieyear
order by m.studioname;
--����� Harrison Ford.
from movie m join starsin s on m.title=s.movietitle and m.year=s.movieyear
			 join movieexec me on m.producerc#=me.cert#
where starname='Harrison Ford';
--�������� ������, ����� ������� ������� �� ���������, ������ ��� ����� ��
--MGM

select ms.name
from MOVIE m join STARSIN s
on m.TITLE = s.MOVIETITLE
JOIN MOVIESTAR ms 
on s.STARNAME = ms.NAME
where m.STUDIONAME = 'MGM' and ms.GENDER = 'F'

--�������� ������, ����� ������� ����� �� ���������� � ������� �� �������,
--����������� �� ���������� �� �Star Wars�.

select title, name
from movie m join MOVIEEXEC me
on m.PRODUCERC# = me.CERT#
where CERT# in (select PRODUCERC# from MOVIE where TITLE = 'Star Wars')


select title, t.name
from movie m join
(select name, cert#
from movieexec
where cert# in (select producerc#
               from movie
               where title='Star Wars')) t
on m.producerc#=t.cert#;


--�������� ������, ����� ������� ������� �� ��������� �� ��������� � ���� ���� ����.
--�������������, �� ����� ���������� ������� �� �� ������� (���� �� � ���������
--PC, ������ ��� �������).
from product p left join pc on p.model=pc.model
			   left join printer pr on p.model=pr.model
			   left join laptop l on p.model=l.model
where pc.code is null and pr.code is null and l.code is null;

--�� ������ �� ����� SHIPS
--������ � �������� �� ������� (launched).
from classes c join ships s on c.class=s.class
			   left join outcomes o on s.name=o.ship
where o.ship is NULL
order by c.country;