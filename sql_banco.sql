-- public.categoria definition

-- Drop table

-- DROP TABLE public.categoria;

select * from categoria c ;

CREATE TABLE public.categoria (
	id_categoria serial4 NOT NULL,
	nome_categoria varchar(255) NULL,
	imagem varchar NULL,
	CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria)
);


-- public.estoque definition

-- Drop table

-- DROP TABLE public.estoque;

CREATE TABLE public.estoque (
	id_estoque serial4 NOT NULL,
	id_produto int8 NULL,
	quantidade int8 NULL,
	CONSTRAINT estoque_pkey PRIMARY KEY (id_estoque)
);


-- public.fornecedor definition

-- Drop table

-- DROP TABLE public.fornecedor;

CREATE TABLE public.fornecedor (
	id_fornecedor serial4 NOT NULL,
	tipo varchar(255) NULL,
	razao_social varchar(255) NULL,
	cnpj varchar(14) NOT NULL,
	uf varchar(2) NULL,
	telefone varchar(100) NULL,
	email varchar(255) NULL,
	nome_fantasia varchar(255) NULL,
	status_situacao varchar(100) NULL,
	bairro varchar(255) NULL,
	logradouro varchar(255) NULL,
	numero int8 NULL,
	complemento varchar(100) NULL,
	cep varchar(10) NULL,
	municipio varchar(255) NULL,
	data_abertura timestamp NULL,
	CONSTRAINT fornecedor_pkey PRIMARY KEY (id_fornecedor)
);


-- public.perfil definition

-- Drop table

-- DROP TABLE public.perfil;

CREATE TABLE public.perfil (
	id_perfil serial4 NOT NULL,
	nome_perfil varchar(100) NULL,
	CONSTRAINT perfil_pkey PRIMARY KEY (id_perfil)
);


-- public.usuario definition

-- Drop table

-- DROP TABLE public.usuario;

CREATE TABLE public.usuario (
	id_usuario serial4 NOT NULL,
	nome_usuario varchar(100) NULL,
	email varchar(100) NULL,
	senha varchar(255) NULL,
	CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario)
);


-- public.produto definition

-- Drop table

-- DROP TABLE public.produto;

CREATE TABLE public.produto (
	id_produto serial4 NOT NULL,
	sku varchar(255) NULL,
	nome_produto varchar(255) NULL,
	id_fornecedor int8 NOT NULL,
	id_categoria int8 NOT NULL,
	imagem_produto varchar NULL,
	descricao_produto varchar not null,
	preco_produto decimal not null,
	estrelas_produto int8 not null,
	CONSTRAINT produto_pkey PRIMARY KEY (id_produto),
	CONSTRAINT produto_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES public.categoria(id_categoria),
	CONSTRAINT produto_id_fornecedor_fkey FOREIGN KEY (id_fornecedor) REFERENCES public.fornecedor(id_fornecedor)
);


-- public.usuario_rel_perfil definition

-- Drop table

-- DROP TABLE public.usuario_rel_perfil;

CREATE TABLE public.usuario_rel_perfil (
	id_usuario int8 NULL,
	id_perfil int8 NULL,
	CONSTRAINT usuario_rel_perfil_id_perfil_fkey FOREIGN KEY (id_perfil) REFERENCES public.perfil(id_perfil),
	CONSTRAINT usuario_rel_perfil_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario)
);


INSERT INTO categoria (NOME_CATEGORIA,IMAGEM) VALUES
	 ('Mineiro','https://cptstatic.s3.amazonaws.com/imagens/enviadas/materias/materia27698/culinaria-mineira-cpt.jpg'),
	 ('Japonês','https://www.saudeemdia.com.br/media/_versions/shutterstock_1021367641_2_widexl.jpg'),
	 ('Baiano','https://diariodonordeste.verdesmares.com.br/image/contentid/policy:1.2218166:1589929719/prato-do-restaurante-mistura-baiana.jpg?f=16x9&h=720&q=0.8&w=1280&$p$f$h$q$w=9c7700c'),
	 ('Sobremesa','https://receitaculinaria.com.br/wp-content/uploads/2020/11/sobremesa-gelada-sensacao-mega-f.jpg'),
	 ('Fast Food','https://img.jakpost.net/c/2016/09/29/2016_09_29_12990_1475116504._large.jpg'),
	 ('Massas', 'https://img.imageboss.me/kitchenaid/cdn/animation:true/wp-content/uploads/2016/06/massas-e-molhos-espaguete-e-linguini.jpg'),
	 ('Salgados', 'https://diaonline.ig.com.br/wp-content/uploads/2020/07/salgados-em-rio-verde-opcoes-para-comprar-na-hora-ou-encomendar-1024x576.png'),
	 ('Pizzas', 'http://rossopizza.com.br/salao/wp-content/uploads/2019/09/istock-181175167-900x600.jpg');
	
INSERT INTO estoque (ID_PRODUTO,QUANTIDADE) VALUES
	 (1,10),
	 (3,30);
	
INSERT INTO fornecedor (TIPO,RAZAO_SOCIAL,CNPJ,UF,TELEFONE,EMAIL,NOME_FANTASIA,STATUS_SITUACAO,BAIRRO,LOGRADOURO,NUMERO,COMPLEMENTO,CEP,MUNICIPIO,DATA_ABERTURA) VALUES
	 ('Matriz','Primeiro Fornecedor','01111222000100','RJ','2125874125','email@mail.com','Nome Fantasia','Ativo','Centro','Rua Principal',10,'','25600000','Petrópolis','2022-05-27 09:23:36.461');
	
INSERT into perfil (NOME_PERFIL) VALUES
	 ('ROLE_USER');
	
INSERT INTO produto (SKU,NOME_PRODUTO,ID_FORNECEDOR,ID_CATEGORIA,PRECO_PRODUTO,ESTRELAS_PRODUTO,DESCRICAO_PRODUTO,IMAGEM_PRODUTO) VALUES
	 ('AAA123', 'Sashimi', 1, 2, 2.80, 3, 'Tem como principais ingredientes a carne de peixe e os frutos do mar, frescos e fatiados em pequenos pedaços.', 'https://www.sabornamesa.com.br/images/receitas/pins_image/r1108-sashimi-pin.jpg'),
	 ('AAB123', 'Missô', 1, 2, 8.10, 4, ' O Missô tradicional é uma espécie de pasta feita a partir da soja. Existem também versões que incluem outros grãos que são bem nutritivas e saborosas.', 'https://images.aws.nestle.recipes/resized/5afb571c38254395f7268e7ff29d5cae_missoshiro-receitas-nestle_768_384.jpg'),
	 ('AAC123', 'Hot Roll', 1, 2, 5.80, 4, 'Ele leva salmão, arroz, alga marinha e cream cheese. Após fatiado em pedaços circulares, ele é coberto por uma massa de farinha de trigo e empanado em farinha panko, sendo servido com um acompanhamento de molho.', 'https://www.djapa.com.br/wp-content/uploads/2021/01/hot-roll-980x654.jpg'),
	 ('AAD123', 'Espaguete à Carbonara', 1, 6, 29.99, 3, 'Clássico absoluto, carbonara leva só bacon, ovos, queijo parmesão e a água do cozimento para acertar o ponto.', 'https://static.clubedaanamariabraga.com.br/wp-content/uploads/2017/08/espaguete-a-carbonara-1024x576.jpg'),
	 ('AAE123', 'Leite ConMorango', 1, 4, 10.0, 4, 'Sobremesa de morango com leite condensado e creme de leite', 'https://s2.glbimg.com/fZnGZPfpFwQUOavBv3G6o0Z0O1Y=/0x0:1280x960/984x0/smart/filters:strip_icc()/s.glbimg.com/po/rc/media/2012/09/07/18_09_46_143_100_0125.JPG'),
	 ('AAF123', 'Pizza de Calabresa', 1, 8, 35.00, 3, 'Uma pizaa de calabresa', 'https://img.freepik.com/fotos-gratis/pizza-de-linguica-de-calabresa-com-cebola-em-tabua-de-madeira-pizza-brasileira_491130-105.jpg?w=740'),
	 ('AAG123', 'Joelho', 1, 7, 8.0, 5, 'Isso na verdade é um salgado, não um joelho...', 'https://amopaocaseiro.com.br/wp-content/uploads/2021/01/receita-joelho-ou-enroladinho-980x653.jpg'),
	 ('AAH123', 'Esfirra', 1, 7, 8.0, 3, 'Pastel de forno, feito de massa de trigo com recheio de carne moída, queijo ou verdura e temperos diversos.', 'https://img.freepik.com/fotos-gratis/esfiha-de-carne-comida-arabe-tradicional_519721-1076.jpg?w=740'),
	 ('AAI123', 'Batata Frita', 1, 5, 15.0, 1, 'Batatas só que fritas', 'https://clubedaquimica.com/wp-content/uploads/2018/04/ketchup-752x440.jpg'),
	 ('AAJ123', 'Hamburguer', 1, 5, 25.0, 1, 'Hambuerguer com muita coisa dentro', 'https://img.freepik.com/fotos-gratis/vista-lateral-duplo-cheeseburger-com-rissois-de-carne-grelhada-queijo-e-folha-de-alface-entre-bolos-de-hamburguer_141793-4883.jpg?t=st=1656435882~exp=1656436482~hmac=303b41825d4f87bd87be0eedf4089e4aade95627af47a407b0472acaab671280&w=1380'),
	 ('AAK123', 'Leitão a pururuca', 1, 1, 67.99, 2,'Colocaram um leitão o forno e assaram', 'https://www.comidaereceitas.com.br/wp-content/uploads/2007/11/Leitao_assadaaaa.jpg'),
	 ('AAL123', 'Frango Caipira', 1, 1, 49.99, 3, 'Frango mas esse é de Minas', 'https://coolicias.ao/wp-content/uploads/2020/01/Receita-de-Guisado-de-Frango-caipira.jpg'),
	 ('AAM123', 'Bobó de Camarão', 1, 3, 34.99, 4, 'De consistência cremosa, é feito com camarões refogados em temperos verdes e leite de coco, misturados no purê de macaxeira e mais azeite de dendê, gengibre e camarões secos.', 'https://cooknenjoy.com/wp-content/uploads/2021/09/Bobo-Camarao-03-1200x901.jpg'),
	 ('AAN123', 'Lasanha', 1, 6, 39.99, 4, 'O desenvolvedor do aplicativo recomenda', 'https://img.cybercook.com.br/receitas/731/lasanha-3-840x480.jpeg?q=75'),
	 ('AAO123', 'Ackee e Peixe Salgado', 1, 1, 24.99, 4, 'Peixe com umas coisas', 'https://www.globeholidays.net/Central_America/Jamaica/Media/Jamaica_Ackee_and_Saltfish.jpg'),
	 ('AAP123', 'Wiener Schnitzel', 1, 1, 42.50, 5, 'Bem parecido com o bife empanado, o prato mais tradicional da Áustria é preparado com os melhores ingredientes e servido fresco.', 'https://cardapio.menu/storage/media/dishes_main/1299443/conversions/dish_thumbnail.jpg'),
	 ('AAQ123', 'Paella Valenciana', 1, 3, 72.80, 5,'Um ícone da Espanha. Apesar de existirem diversas formas de prepará-la, a verdade é que todas as suas versões são deliciosas.', 'https://static.paodeacucar.com/img/uploads/1/477/23056477.jpg'),
	 ('AAR123', 'Feijoada', 1, 3, 55.0, 5, 'Feijoada é uma designação comum dada a pratos da culinária de regiões e países lusófonos.', 'https://www.comidaereceitas.com.br/wp-content/uploads/2021/07/feijoada_veveta-780x503.jpg'),
	 ('AAS123', 'Onigiri', 1, 2, 15.0, 5, 'Bolinho dearroz do Japão', 'https://www.sabornamesa.com.br/media/k2/items/cache/b9761710e2d567efefc41798919e031b_XL.jpg');
	
INSERT INTO usuario (NOME_USUARIO,EMAIL,SENHA) VALUES
	 ('usuario','usuario@mail.com','$2a$12$3COb/LHNYO/JeLWy1ExGFe6U2iyFczP70/kBUEHbf9miQ4Vp64A42'),
	 ('usuario2','admin','$2a$12$3COb/LHNYO/JeLWy1ExGFe6U2iyFczP70/kBUEHbf9miQ4Vp64A42');
	
INSERT INTO usuario_rel_perfil  (ID_USUARIO,ID_PERFIL) VALUES
	 (1,1);
