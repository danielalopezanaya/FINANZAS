-----Procesamiento------

drop table if exists final;

create table final as select *
                    from utilizaciones a 
                    inner join sociodemograficas b
                    on a.Afiliado_Id =b.Afiliado_Id



