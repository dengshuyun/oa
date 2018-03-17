---------�л�ϵͳ �û� System
create user crm identified by crm;
grant connect,resource to crm;
----�����û�sale
create user sale identified by sale;
grant connect,resource to sale;

--�л��û�sale
-----����orders
create table orders
(
       odr_id number(11) primary key,
       odr_customer nvarchar2(100),
       odr_date date,
       odr_addr nvarchar2(200),
       odr_status nvarchar2(1)
);
-----����orders_line
create table orders_line
(
       odd_id number(11) primary key,
       odd_order_id number(11),
       odd_prod_id number(11),
       odd_count number(11),
       odd_unit nvarchar2(10),
       odd_price number(11,2)
       
);
  
--------����product
create table product
(
       prod_id number(11) primary key,
       prod_name nvarchar2(200),
       prod_type nvarchar2(100),
       prod_batch nvarchar2(100),
       prod_unit nvarchar2(10),
       prod_price number(11,2),
       prod_memo nvarchar2(200)
);

--------����storage
create table storage
(
       stk_id number(11) primary key,
       stk_prod_id number(11),
       stk_warehouse nvarchar2(50),
       stk_ware nvarchar2(50),
       stk_count number(11),
       stk_memo nvarchar2(200)
 
);
-----���
alter table orders_line add constraint fk_order_id foreign key(odd_order_id) 
      references orders(odr_id);
alter table orders_line add constraint fk__prod_id foreign key(odd_prod_id) 
      references product(prod_id);
alter table storage add constraint stk_prod_id foreign key(stk_prod_id) 
      references product(prod_id);
---������
create sequence seq_odr_id;
create sequence seq_odd_id;
create sequence seq_prod_id;
create sequence seq_stk_id;

----��������
insert into orders values(1,'�Ϻ���Ϣ�Ƽ����޹�˾',to_date('2007-3-13','yyyy-mm-dd'),'�����������Ͷ�·205��','6');

insert into product values(seq_prod_id.nextval,'�Ҹ��Ƶ��ӻ�','818 fft','2388 ea03','̨',7500,'������');
insert into product values(seq_prod_id.nextval,'�Ҹ���������','����007','7878 006a','̨',36,'������');
insert into product values(seq_prod_id.nextval,'�����ʼǱ�����','i60','2688 9966','̨',9800,null);
insert into product values(4,'�Ҹ���������','����007','7878 006a','̨',36,'������');
insert into product values(7,'�����ʼǱ�����','i60','2688 9966','̨',9800,null);

insert into orders_line values(1,1,4,2,'̨',10800);
insert into orders_line values(2,1,7,2,'̨',16800);

insert into storage values(seq_stk_id.nextval,1,'����-��ֱ�ſ�','ec-d2',16,null);
insert into storage values(seq_stk_id.nextval,4,'����-�����¿�','ea-b8',12,null);
insert into storage values(seq_stk_id.nextval,4,'����-����','ea-a6',8,null);
insert into storage values(seq_stk_id.nextval,7,'���-��Զ����c��','��26λ',36,null);
insert into storage values(seq_stk_id.nextval,7,'���-��Զ����c��','��27λ',36,null);
insert into storage values(seq_stk_id.nextval,7,'���-��Զ����c��','��28λ',30,null);
commit;



---------�л��û�crm
-----dict����
create table bas_dict
(
       dict_id number(11) primary key,
       dict_type nvarchar2(50),
       dict_item nvarchar2(50),
       dict_value nvarchar2(50),
       dict_is_editable number(2)
);


---------activity
create table cst_activity
(
       atv_id number(11) primary key,
       atv_cust_no nvarchar2(50),
       atv_cust_name nvarchar2(100),
       atv_date date,
       atv_place nvarchar2(200),
       atv_title nvarchar2(500),
       atv_desc nvarchar2(2000)       
);
------�ͻ���
create table cst_customer
(
       cust_no nvarchar2(17) primary key,
       cust_name nvarchar2(100),
       cust_region nvarchar2(50),
       cust_manager_id number(11),
       cust_manager_name nvarchar2(50),
       cust_level number(11),
       cust_level_label nvarchar2(50),
       cust_satisfy number(11),
       cust_credit number(11),
       cust_addr nvarchar2(300),
       cust_zip nvarchar2(10),
       cust_tel nvarchar2(50),
       cust_fax nvarchar2(50),
       cust_website nvarchar2(50),
       cust_licence_no nvarchar2(50),
       cust_chieftain nvarchar2(50),
       cust_bankroll number(11),
       cust_turnover number(11),
       cust_bank nvarchar2(200),
       cust_bank_account nvarchar2(50),
       cust_local_tax_no nvarchar2(50),
       cust_national_tax_no nvarchar2(50),
       cust_status nvarchar2(2)
);
------��ϵ�˱�
create table cst_linkman
(
       lkm_id number(11) primary key,
       lkm_cust_no nvarchar2(50),
       lkm_cust_name nvarchar2(100),
       lkm_name nvarchar2(50),
       lkm_sex nvarchar2(5),
       lkm_postion nvarchar2(50),
       lkm_tel nvarchar2(50),
       lkm_mobile nvarchar2(50),
       lkm_memo nvarchar2(300)   
);

------------��ʧ��
create table cst_lost
(
       lst_id number(11) primary key,
       lst_cust_no nvarchar2(50),
       lst_cust_name nvarchar2(100),
       lst_cust_manager_id number(11)��
       lst_cust_manager_name nvarchar2(50),
       lst_last_order_date date,
       lst_lost_date date,
       lst_delay nvarchar2(2000),
       lst_reason nvarchar2(2000),
       lst_status nvarchar2(10)  
);

------------�����
create table cst_service
(
       svr_id number(11) primary key,
       svr_type nvarchar2(20),
       svr_title nvarchar2(500),
       svr_cust_no nvarchar2(50),
       svr_cust_name nvarchar2(100),
       svr_status nvarchar2(10),
       svr_request nvarchar2(2000),
       svr_create_id number(11),
       svr_create_by nvarchar2(50),
       svr_create_date date,
       svr_due_id number(11),
       svr_due_to nvarchar2(50),
       svr_due_date date,
       svr_deal nvarchar2(2000),
       svr_deal_id number(11),
       svr_deal_by nvarchar2(50),
       svr_deal_date date,
       svr_result nvarchar2(500),
       svr_satisfy number(11)
       
);


-----------�����     
create table sal_chance
(
       chc_id number(11) primary key,
       chc_source nvarchar2(50),
       chc_cust_name nvarchar2(100),
       chc_title nvarchar2(200),
       chc_rate number(11),
       chc_linkman nvarchar2(50),
       chc_tel nvarchar2(50),
       chc_desc nvarchar2(2000),
       chc_create_id number(11),
       chc_create_by nvarchar2(50),
       chc_create_date date,
       chc_due_id number(11),
       chc_due_to nvarchar2(50),
       chc_due_date date
);

------------�ƻ���
create table sal_plan
(
       pla_id number(11) primary key,
       pla_chc_id number(11),
       pla_date date,
       pla_todo nvarchar2(500),
       pla_result nvarchar2(500)

);
------------Ȩ�ޱ�
create table sys_right
(
       right_code nvarchar2(50) primary key,
       right_parent_code nvarchar2(50),
       right_type nvarchar2(20),
       right_text nvarchar2(50),
       right_url nvarchar2(100)��
       right_tip nvarchar2(50)

);

------------��ɫ��
create table sys_role
(
       role_id number(11) primary key,
       role_name nvarchar2(50),
       role_desc nvarchar2(50),
       role_flag number(11)

);

------------��ɫȨ�ޱ�
create table sys_role_right
(
       rf_id number(11) primary key,
       rf_role_id number(11),
       rf_right_code nvarchar2(50)

);
-------ϵͳ�û�
create table sys_user
(
       user_id number(11) primary key,
       user_name nvarchar2(50),
       user_password nvarchar2(50),
       user_role_id number(11),
       user_flag number(11)
);
-----���
alter table cst_activity add constraint fk_atv_cust_no foreign key(atv_cust_no) 
      references cst_customer(cust_no);
alter table cst_linkman add constraint fk_lkm_cust_no foreign key(lkm_cust_no) 
      references cst_customer(cust_no);
alter table cst_lost add constraint fk_lst_cust_no foreign key(lst_cust_no) 
      references cst_customer(cust_no);
      
alter table cst_service add constraint fk_svr_cust_no foreign key(svr_cust_no) 
      references cst_customer(cust_no);
      
alter table sal_plan add constraint fk_plan_chance foreign key(pla_chc_id) 
      references sal_chance(chc_id);
      
           
alter table sys_role_right add constraint fk_sys_role_right_sys_role foreign key(rf_role_id) 
      references sys_role(role_id);
alter table sys_role_right add constraint fk_sys_role_right_sys_right foreign key(rf_right_code) 
      references sys_right(right_code);

alter table sys_user add constraint fk_sys_user_sys_role foreign key(user_role_id) 
      references sys_role(role_id);
      
      
------------������
create sequence seq_dict_id;
create sequence seq_atv_id;
create sequence seq_lkm_id;
create sequence seq_lst_id;
create sequence seq_svr_id;
create sequence seq_chc_id;
create sequence seq_pla_id;
create sequence seq_role_id;
create sequence seq_rf_id;
create sequence seq_user_id;


------��������
insert into bas_dict values(2,'��������','��ѯ','��ѯ','1');
insert into bas_dict values(3,'��������','����','����','1');
insert into bas_dict values(4,'��������','��ѯ','��ѯ','1');
insert into bas_dict values(7,'�ͻ��ȼ�','��ͨ�ͻ�','1','0');
insert into bas_dict values(9,'�ͻ��ȼ�','�ص㿪���ͻ�','2','0');
insert into bas_dict values(10,'�ͻ��ȼ�','��ͻ�','3','0');
insert into bas_dict values(11,'�ͻ��ȼ�','�������','4','0');
insert into bas_dict values(12,'�ͻ��ȼ�','ս�Ժ������','5','0');
insert into bas_dict values(13,'����','�ӱ�','�ӱ�','1');
insert into bas_dict values(14,'����','����','����','1');
insert into bas_dict values(15,'����','����','����','1');
insert into bas_dict values(16,'����','����','����','1');
insert into bas_dict values(17,'����','�Ϻ�','�Ϻ�','1');

insert into cst_customer values('kh071207032218637','�� ','�ӱ�',null,null,3,'��ͻ�',4,2,null,null,null,null,null,null,null,null,null,null,null,null,null,'2');
insert into cst_customer values('kh071207032218638','�Ϻ���Ϣ�Ƽ����޹�˾ ','�ӱ�',2,'hlliu',4,'�������',5,5,'1','2','3','4','5','6','7',8,9,'10','11','12','13','1');

insert into cst_activity values(seq_atv_id.nextval,'kh071207032218637',null,to_date('2007-12-08','yyyy-mm-dd'),'didian','title','desc');
insert into cst_activity values(seq_atv_id.nextval,'kh071207032218637',null,to_date('2007-12-09','yyyy-mm-dd'),'��','��','��ά��');

insert into sys_right values('l01','root_menu','folder','Ӫ������','','Ӫ������');
insert into sys_right values('l0101','l01','document','���ۻ������','chance.do?o=tolist','���ۻ������');
insert into sys_right values('l0102','l01','document','�ͻ������ƻ�','plan.do?o=tolist','�ͻ������ƻ�');
insert into sys_right values('l02','root_menu','folder','�ͻ�����','','�ͻ�����');
insert into sys_right values('l0201','l02','document','�ͻ���Ϣ����','customer.do?o=tolist','�ͻ���Ϣ����');
insert into sys_right values('l0202','l02','folder','�ͻ���ʧ����','lost.do?o=tolist','�ͻ���ʧ����');
insert into sys_right values('l03','root_menu','folder','�������','','�������');
insert into sys_right values('l0301','l03','document','���񴴽�','service.do?o=toadd','���񴴽�');
insert into sys_right values('l0302','l03','document','�������','service.do?o=todispatch','�������');
insert into sys_right values('l0303','l03','document','������','service.do?o=todeallist','������');
insert into sys_right values('l0304','l03','document','������','service.do?o=tofeedbacklist','������');
insert into sys_right values('l0305','l03','document','����鵵','service.do?o=toarchlist','����鵵');
insert into sys_right values('l04','root_menu','folder','ͳ�Ʊ���','','ͳ�Ʊ���');
insert into sys_right values('l0401','l04','document','�ͻ����׷���','contrrpt.do?o=tolist','�ͻ����׷���');
insert into sys_right values('l0402','l04','document','�ͻ����ɷ���','consrpt.do?o=tolist','�ͻ����ɷ���');
insert into sys_right values('l0403','l04','document','�ͻ��������','svrrpt.do?o=tolist','�ͻ��������');
insert into sys_right values('l0404','l04','document','�ͻ���ʧ����','lostrpt.do?o=tolist','�ͻ���ʧ����');
insert into sys_right values('l05','root_menu','folder','��������','','��������');
insert into sys_right values('l0501','l05','document','�����ֵ����','dict.do?o=tolist','�����ֵ����');
insert into sys_right values('l0502','l05','document','��ѯ��Ʒ��Ϣ','product.do?o=tolist','��ѯ��Ʒ��Ϣ');
insert into sys_right values('l0503','l05','document','��ѯ���','storage.do?o=tolist','��ѯ���');
insert into sys_right values('l06','root_menu','folder','Ȩ�޹���','','Ȩ�޹���');

insert into sys_right values('l0601','l06','folder','�û�����','user.do?o=tolist','�û�����');
insert into sys_right values('l0602','l06','folder','��ɫ����','role.do?o=tolist','��ɫ����');

insert into sys_role values(seq_role_id.nextval,'����Ա','ӵ������Ȩ��',1);

insert into sys_user values(seq_user_id.nextval, 'hlliu','pwd',1,1);
insert into sys_user values(seq_user_id.nextval, 'admin','admin',1,1);


insert into sys_role_right values(seq_rf_id.nextval,1,'l01');
insert into sys_role_right values(seq_rf_id.nextval,1,'l0101');
insert into sys_role_right values(seq_rf_id.nextval,1,'l0102');
insert into sys_role_right values(seq_rf_id.nextval,1,'l02');
insert into sys_role_right values(seq_rf_id.nextval,1,'l0201');
insert into sys_role_right values(seq_rf_id.nextval,1,'l0202');
insert into sys_role_right values(seq_rf_id.nextval,1,'l03');
insert into sys_role_right values(seq_rf_id.nextval,1,'l0301');
insert into sys_role_right values(seq_rf_id.nextval,1,'l0302');
insert into sys_role_right values(seq_rf_id.nextval,1,'l0303');
insert into sys_role_right values(seq_rf_id.nextval,1,'l0304');
insert into sys_role_right values(seq_rf_id.nextval,1,'l0305');
insert into sys_role_right values(seq_rf_id.nextval,1,'l04');
insert into sys_role_right values(seq_rf_id.nextval,1,'l04');

insert into sys_role_right values(seq_rf_id.nextval,1,'l0401');
insert into sys_role_right values(seq_rf_id.nextval,1,'l0402');
insert into sys_role_right values(seq_rf_id.nextval,1,'l0403');

insert into sys_role_right values(seq_rf_id.nextval,1,'l0404');

insert into sys_role_right values(seq_rf_id.nextval,1,'l05');

insert into sys_role_right values(seq_rf_id.nextval,1,'l0501');
insert into sys_role_right values(seq_rf_id.nextval,1,'l0502');
insert into sys_role_right values(seq_rf_id.nextval,1,'l0503');
insert into sys_role_right values(seq_rf_id.nextval,1,'l06');
insert into sys_role_right values(seq_rf_id.nextval,1,'l0601');
insert into sys_role_right values(seq_rf_id.nextval,1,'l0602');


select * from sys_role_right;

commit;



---------�л�ϵͳ�û� system
grant select on sale.orders to crm;
grant select on sale.orders_line to crm;
grant select on sale.product to crm;
grant select on sale.storage to crm;
grant create view to crm;

-----------�л���crm
create view vi_orders as select * from sale.orders;
create view vi_orders_line as select * from sale.orders_line;
create view vi_product as select * from sale.product;
create view vi_storage as select * from sale.storage;

select * from vi_orders;

select * from sys_user;






