drop table if exists util_compl;


create table util_compl as
select a.Fecha_Reclamacion,
a.Afiliado_Id,
--a.Diagnostico_Codigo,
c.Diagnostico_Desc,
--a.Reclamacion_codigo,
b.Reclamacion_Desc,
a.Cantidad,
a.Precio
from utilizaciones a 
left join reclamaciones b
on a.Reclamacion_codigo = b.Reclamacion_Id
left join diagnosticos c
on a.Diagnostico_Codigo = c.Diagnostico_Codigo;


drop table if exists socio_compl;

create table socio_compl as
select
a.Afiliado_Id,
--a.Sexo_codigo,
b.Sexo_desc,
a.FechaNacimiento,
--a.Regional_codigo,
c.Regional_Desc,
a.CANCER,
a.EPOC,
a.DIABETES,
a.HIPERTENSION,
a.ENF_CARDIOVASCULAR
from sociodemograficas a 
left join genero b
on a.Sexo_codigo = b.Sexo_Cd
left join regional c
on a.Regional_codigo = c.Regional_id;

drop table if exists compl;

create table compl as
select 
a.Afiliado_Id,
b.Sexo_desc,
b.FechaNacimiento,
b.Regional_Desc,
b.CANCER,
b.EPOC,
b.DIABETES,
b.HIPERTENSION,
b.ENF_CARDIOVASCULAR,
a.Fecha_Reclamacion,
a.Reclamacion_Desc,
a.Diagnostico_Desc,
a.Cantidad,
a.Precio
from util_compl a 
left join socio_compl b
on a.Afiliado_Id = b.Afiliado_Id;



