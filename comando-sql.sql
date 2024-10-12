select * from cursos order by nome;
select * from cursos order by nome desc;
select * from cursos order by nome asc;

select nome,carga,ano from cursos order by nome;
select ano,carga,nome from cursos order by ano;
select ano,carga,nome from cursos order by ano,nome;

select * from cursos where ano="2016" order by nome;
select nome,carga from cursos where ano="2016" order by nome;
select nome,descricao,ano from cursos where ano<=2015 order by ano,nome;

select nome,ano, descricao from cursos where ano between 2014 and 2016 order by ano,nome;
select nome,ano, descricao from cursos where ano in ( 2014, 2016,2020) order by ano,nome;

select nome,ano,carga,totaulas from cursos where carga>35 and totaulas<30 order by nome;
select nome,ano,carga,totaulas from cursos where carga>35 or totaulas<30 order by nome;


select * from cursos where nome like'p%';
select * from cursos where nome like'%a';
select * from cursos where nome like'%a%';
select * from cursos where nome not like'%a%';
select * from cursos where nome like'PH%p%';
select * from cursos where nome like'PH%p_';
select * from cursos where nome like'P_p_';

select * from gafanhotos where nome like'%_silva%';

update cursos set nome='PáOO' where idcurso = '9';

select distinct nacionalidade from gafanhotos order by nacionalidade; 
select distinct carga from cursos order by carga ; 


select count(nome) from cursos where carga >40;
select max(carga) from cursos;
select max(totaulas) from cursos;
select nome,min(totaulas) from cursos where ano ='2016';
select sum(totaulas) from cursos where ano ='2016';
select avg(totaulas) from cursos where ano ='2016';

select * from gafanhoto 

select * from gafanhotos where sexo='f';
select * from gafanhotos where  nascimento BETWEEN '2000-01-01' AND '2015-12-31';
SELECT nome, profissao FROM gafanhotos WHERE sexo = 'M' AND profissao = 'programador';
select * from gafanhotos where sexo='f' and nacionalidade='Brasil' and nome like 'j%';
select nome, nacionalidade, peso from gafanhotos where nome like '%Silva%' and nacionalidade !='Brasil' and peso<'100';
select max(altura) from gafanhotos where nacionalidade='Brasil';
select avg(peso) from gafanhotos;
select min(peso) from gafanhotos where sexo='F' and nacionalidade !='Brasil' and nascimento between '1990-01-01' And '2000-12-31' ;
select count(altura) from gafanhotos where sexo='f' and altura>'1.90';




select distinct carga from cursos order by carga;

select carga from cursos group by carga;
select carga,count(nome) from cursos group by carga;

select * from cursos where carga=40;
select carga,count(nome) from cursos where totaulas=30 group by carga;
select ano, count(*) from cursos group by ano having count(ano) >=5 order by count(*) desc;
select avg(carga) from cursos;
select carga ,count(*) FROM cursos where ano>2015 group by carga having carga>(select avg(carga) from cursos); 

select * from gafanhotos;
select profissao,count(*) from gafanhotos group by profissao;
select sexo,count(*) from gafanhotos where nascimento > 2025-01-01 group by sexo;
select nacionalidade,count(*) from gafanhotos;
select nacionalidade,count(*) from gafanhotos where nacionalidade != 'Brasil' group by nacionalidade having count(nacionalidade)>3;
select avg(altura) from gafanhotos;
select altura,count(*) from gafanhotos where peso>100 group by altura having altura>(select avg(altura) from gafanhotos);

describe gafanhotos;
 alter table gafanhotos add column cursopreferido int;
 alter table gafanhotos add foreign key (cursopreferido) references cursos(idcurso);
 
 select * from gafanhotos;
 select * from cursos;
 update gafanhotos set cursopreferido='6' where id='1';

select gafanhotos.nome, cursos.nome, cursos.ano from gafanhotos join cursos on cursos.idcurso = gafanhotos.cursopreferido;
select g.nome, c.nome, c.ano from gafanhotos as g join cursos as c on c.idcurso = g.cursopreferido;
select g.nome, c.nome, c.ano from gafanhotos as g left join cursos as c on c.idcurso = g.cursopreferido;

create table gafanhoto_assiste_curso(
id int not null auto_increment,
data date,
idgafanhoto int,
idcurso int,
primary key (id),
foreign key (idgafanhoto) references gafanhotos(id),
foreign key (idcurso) references cursos(idcurso)
)default charset=utf8;

insert into gafanhoto_assiste_curso values (default, '2014-03-01','1', '2');
select * from gafanhoto_assiste_curso;

select g.id,g.nome,a.idgafanhoto,a.idcurso from gafanhotos g join gafanhoto_assiste_curso a on g.id=a.idgafanhoto join cursos c on c.idcurso=a.idcurso order by g.nome;
select g.nome,c.nome from gafanhotos g join gafanhoto_assiste_curso a on g.id=a.idgafanhoto join cursos c on c.idcurso=a.idcurso order by g.nome;