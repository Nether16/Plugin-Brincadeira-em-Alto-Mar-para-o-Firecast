require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_EdLeAkuma()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", obj.setNodeObject);

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setFormType("sheetTemplate");
    obj:setTitle("Brincadeiras Em Alto Mar");
    obj:setName("EdLeAkuma");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(10000);
    obj.rectangle1:setHeight(10000);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");


	EdLImagens = {
		BlackLeg = {
			imagem = "https://media.tenor.com/0qQyt427SHkAAAAC/one-piece-sanji.gif"
		},
		BoFudoRyu = {
			imagem = "https://blob.firecast.com.br/blobs/WFPKKTJD_3733833/yamato.gif"
		},
		BoKenryu = {
			imagem = "https://blob.firecast.com.br/blobs/CJFVPMIU_3733719/Sem_t_tul13123123o.jpg"
		},
		Boxe = {
			imagem = "https://pa1.aminoapps.com/6326/b952dd643c8bc613840ce082d0927e2655803f5a_hq.gif"
		},
		Capoeira = {
			imagem = "https://blob.firecast.com.br/blobs/SLLOFDJF_3733730/dancing.gif"
		},
		ColorsTrap = {
			imagem = "https://media.tenor.com/t_HGhrVJns8AAAAM/one-piece-marianne.gif"
		},
		Demonharubado = {
			imagem = "https://pa1.narvii.com/6868/542b309968267825692736c8674ce0b6fcc67a1ar1-500-281_hq.gif"
		},
		EngeinoFureteRyu = {
			imagem = "https://blob.firecast.com.br/blobs/FKTCTWGL_3733800/sword.gif"
		},
		FrogLeg = {
			imagem = "https://blob.firecast.com.br/blobs/KBFNPWKL_3702865/greninja-pokemon.gif"
		},
		Hachitoryu = {
			imagem = "https://onepiecebytheghosthunter.weebly.com/uploads/2/7/1/1/27112571/2940841_orig.jpg"
		},
		HaganeNoKiba = {
			imagem = "https://blob.firecast.com.br/blobs/HSWHCKOE_3733810/matchups-for-vega-balrog-street-fighter-v0.gif"
		},
		Hasshoken = {
			imagem = "https://pa1.narvii.com/6411/0f53e382be8557160d2d5cf570f38afe62225ea8_hq.gif"
		},
		Ittoryu = {
			imagem = "https://media.tenor.com/tgevhaBd3g0AAAAC/ittoryu.gif"
		},
		JaoKunDo = {
			imagem = "https://media.tenor.com/QxEuc6YNYf8AAAAd/jao-kun-do.gif"
		},
		JioKen = {
			imagem = "https://blob.firecast.com.br/blobs/TPQAWDPD_3727751/tumblr_nfh452KyYK1rr37qoo4_r1_500.gif"
		},
		KarateTritao = {
			imagem = "https://pa1.narvii.com/6708/34262be4d9d8776b5a5b0b073374450b30eecbcf_hq.gif"
		},
		Kapparyu = {
			imagem = "https://media.tenor.com/q2PHPRDB9TwAAAAC/amano-gawa-kawamatsu.gif"
		},
		KenkinoGattsu = {
			imagem = "http://blob.firecast.com.br/blobs/CEMKQKNK_3065178/guts-berserk.gif"
		},
		KikaiKoboRyu = {
			imagem = "https://blob.firecast.com.br/blobs/OOHIHPTD_3733191/stark-frieren.gif"
		},
		Kitsunebiryu = {
			imagem = "https://blob.firecast.com.br/blobs/HPKTINEF_3637389/e8cb549a0e3b80058a21110154e3f6ff6adc22e7_h.gif"
		},
		KoenoEnseiRyu = {
			imagem = "https://giffiles.alphacoders.com/136/136090.gif"
		},
		KosenjuRyu = {
			imagem = "https://pa1.aminoapps.com/6264/eecfa19e2fd02dcddfd20b58dc6d3f1f76fd8c9f_hq.gif"
		},
		Kyokugi = {
			imagem = "http://blob.firecast.com.br/blobs/UVBHBWGK_3110025/00_-_Kyokugi_Apresentacao.gif"
		},
		MermanCombat = {
			imagem = "https://static.wikia.nocookie.net/powerlisting/images/4/4e/Merman_Combat_Ultramarine_2_%28One_Piece%29.gif/revision/latest/scale-to-width-down/250?cb=20180707050855"
		},
		NingyoGujutsu = {
			imagem = "https://blob.firecast.com.br/blobs/KNHEGOEM_3733080/images.jpg"
		},
		Nitoryu = {
			imagem = "https://media.tenor.com/Ztnilz9RI6UAAAAd/oden-nitoryu-oden-two-sword-style.gif"
		},
		OkamaKenpo = {
			imagem = "https://pa1.narvii.com/7230/3b4538d2abcf8f8cc99f7b1a50490053be678b30r1-435-250_hq.gif"
		},
		RairyuuRyu = {
			imagem = "https://blob.firecast.com.br/blobs/AIKOQSUR_3391738/lancer-fate-diarmuid.gif"
		},
		RamenKenpo = {
			imagem = "http://blob.firecast.com.br/blobs/AOUWPLSN_3076631/one-piece-wanze.gif"
		},
		ReitetsunoKen = {
			imagem = "http://blob.firecast.com.br/blobs/PRCKFKTL_3110154/00_-_Reitetsu_no_Ken_Apresentacao.gif"
		},
		Rokushiki = {
			imagem = "https://static.wikia.nocookie.net/onepiece/images/6/65/Rankyaku.gif/revision/latest?cb=20160626195046&path-prefix=pt"
		},
		Rokutoryu = {
			imagem = "http://blob.firecast.com.br/blobs/HBRCSGEV_2627847/6437283b9f3d3e1e0105375f.jpg"
		},
		Ryusoken = {
			imagem = "https://static.wikia.nocookie.net/onepiece/images/b/b5/Punho_da_Garra_do_Drag%C3%A3o.gif/revision/latest?cb=20160415153631&path-prefix=pt"
		},
		Sakejutsu = {
			imagem = "http://blob.firecast.com.br/blobs/WWPNLULN_3210353/naruto-rock-lee.gif"
		},
		Santoryu = {
			imagem = "https://media.tenor.com/QIzUoOtRWGgAAAAC/one-piece-santoryu.gif"
		},
		SeiginoTokenRyu = {
			imagem = "http://blob.firecast.com.br/blobs/LREEFFNW_3133574/one-piece-justice.gif"
		},
		Senritsuken = {
			imagem = "https://64.media.tumblr.com/7e14767ef57464e24be00c23bb7b8a68/cd199a8845b2618e-62/s640x960/ea553ade2692a9b29750f291ef0585c87ffaa10b.gif"
		},
		SonGokunoUgoki = {
			imagem = "https://steamuserimages-a.akamaihd.net/ugc/608350301004475238/027316ACF082A6EFC7EAEFDA6CEABE092EA70BE1/?imw=5000&imh=5000&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false"
		},
		StreetBrawling = {
			imagem = "https://i0.wp.com/the-avocado.org/wp-content/uploads/2020/07/0d2f2e25384393037370749e50b9a82c.gif?fit=500%2C269&ssl=1"
		},
		SumoRyu = {
			imagem = "https://64.media.tumblr.com/3289a22883915af6d0829451f0d33426/tumblr_pjfc9i5Rr81sau2q2o2_640.gif"
		},
		TatenoMamoriRyu = {
			imagem = "https://blob.firecast.com.br/blobs/OKQFBLVC_3039337/braum-lol.gif"
		},
		TenshiNunchakuRyu = {
			imagem = "https://pa1.aminoapps.com/6543/2b523ace978ad8b0366019e9b1f8fd20a3a4eeed_00.gif"
		},
		TeppanyakinoKen = {
			imagem = "http://blob.firecast.com.br/blobs/CTPNDVHM_3076650/black-butler-sebastian.gif"
		},
		TontattaCombat = {
			imagem = "https://blob.firecast.com.br/blobs/KLBHRSKN_3702972/123.jpg"
		},
		Tokarado = {
			imagem = "https://i.pinimg.com/originals/e9/65/a8/e965a8c9e5c755cefdcd034f0e3a20bf.gif"
		},
		Tsuinburedo = {
			imagem = "https://media.tenor.com/7wqsMTZpOGkAAAAM/darth-maul.gif"
		},
		Yontoryu = {
			imagem = "https://media.tenor.com/8fumyVdhRJ8AAAAC/kaku-one-piece.gif"
		}
	}
	


    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setLeft(12);
    obj.layout1:setTop(12);
    obj.layout1:setWidth(175);
    obj.layout1:setHeight(525);
    obj.layout1:setName("layout1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(175);
    obj.rectangle2:setHeight(525);
    obj.rectangle2:setColor("#4169E1");
    obj.rectangle2:setName("rectangle2");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout1);
    obj.rectangle3:setLeft(2);
    obj.rectangle3:setTop(2);
    obj.rectangle3:setWidth(171);
    obj.rectangle3:setHeight(521);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(10);
    obj.label1:setTop(10);
    obj.label1:setWidth(155);
    obj.label1:setHeight(25);
    obj.label1:setText("Estilo De Luta");
    obj.label1:setFontSize(18);
    lfm_setPropAsString(obj.label1, "fontStyle", "bold underline");
    obj.label1:setFontColor("#5F9EA0");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout1);
    obj.rectangle4:setLeft(10);
    obj.rectangle4:setTop(40);
    obj.rectangle4:setWidth(155);
    obj.rectangle4:setHeight(105);
    obj.rectangle4:setColor("#F5F5DC");
    obj.rectangle4:setName("rectangle4");

    obj.EstLuta = GUI.fromHandle(_obj_newObject("edit"));
    obj.EstLuta:setParent(obj.layout1);
    obj.EstLuta:setName("EstLuta");
    obj.EstLuta:setField("EstLuta");
    obj.EstLuta:setLeft(12);
    obj.EstLuta:setTop(119);
    obj.EstLuta:setWidth(151);
    obj.EstLuta:setHeight(24);
    obj.EstLuta:setFontColor("#D1B27E");
    lfm_setPropAsString(obj.EstLuta, "fontStyle", "bold");
    obj.EstLuta:setHorzTextAlign("center");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout1);
    obj.rectangle5:setLeft(12);
    obj.rectangle5:setTop(42);
    obj.rectangle5:setWidth(151);
    obj.rectangle5:setHeight(77);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setName("rectangle5");

    obj.imagemEdL = GUI.fromHandle(_obj_newObject("image"));
    obj.imagemEdL:setParent(obj.layout1);
    obj.imagemEdL:setField("imagemEdL");
    obj.imagemEdL:setName("imagemEdL");
    obj.imagemEdL:setLeft(12);
    obj.imagemEdL:setTop(42);
    obj.imagemEdL:setWidth(151);
    obj.imagemEdL:setHeight(77);
    obj.imagemEdL:setEditable(true);
    obj.imagemEdL.animate = true;
    obj.imagemEdL:setStyle("autoFit");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setLeft(12);
    obj.button1:setTop(42);
    obj.button1:setWidth(40);
    obj.button1:setHeight(20);
    obj.button1:setText("Ver");
    obj.button1:setName("button1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setLeft(10);
    obj.label2:setTop(159);
    obj.label2:setWidth(155);
    obj.label2:setHeight(25);
    obj.label2:setText("Akuma no Mi");
    obj.label2:setFontSize(18);
    lfm_setPropAsString(obj.label2, "fontStyle", "bold underline");
    obj.label2:setFontColor("#5F9EA0");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout1);
    obj.rectangle6:setLeft(10);
    obj.rectangle6:setTop(189);
    obj.rectangle6:setWidth(155);
    obj.rectangle6:setHeight(105);
    obj.rectangle6:setColor("#F5F5DC");
    obj.rectangle6:setName("rectangle6");

    obj.Akuma = GUI.fromHandle(_obj_newObject("edit"));
    obj.Akuma:setParent(obj.layout1);
    obj.Akuma:setName("Akuma");
    obj.Akuma:setField("Akuma");
    obj.Akuma:setLeft(12);
    obj.Akuma:setTop(268);
    obj.Akuma:setWidth(151);
    obj.Akuma:setHeight(24);
    obj.Akuma:setFontColor("#D1B27E");
    lfm_setPropAsString(obj.Akuma, "fontStyle", "bold");
    obj.Akuma:setFontSize(10);
    obj.Akuma:setHorzTextAlign("center");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout1);
    obj.rectangle7:setLeft(12);
    obj.rectangle7:setTop(191);
    obj.rectangle7:setWidth(151);
    obj.rectangle7:setHeight(77);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setName("rectangle7");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.layout1);
    obj.image1:setField("imagemAkuma");
    obj.image1:setLeft(12);
    obj.image1:setTop(191);
    obj.image1:setWidth(151);
    obj.image1:setHeight(77);
    obj.image1:setEditable(true);
    obj.image1.animate = true;
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout1);
    obj.button2:setLeft(12);
    obj.button2:setTop(191);
    obj.button2:setWidth(40);
    obj.button2:setHeight(20);
    obj.button2:setText("Ver");
    obj.button2:setName("button2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setLeft(10);
    obj.label3:setTop(308);
    obj.label3:setWidth(155);
    obj.label3:setHeight(25);
    obj.label3:setText("Miscelânea");
    obj.label3:setFontSize(18);
    lfm_setPropAsString(obj.label3, "fontStyle", "bold underline");
    obj.label3:setFontColor("#5F9EA0");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout1);
    obj.rectangle8:setLeft(10);
    obj.rectangle8:setTop(338);
    obj.rectangle8:setWidth(155);
    obj.rectangle8:setHeight(105);
    obj.rectangle8:setColor("#F5F5DC");
    obj.rectangle8:setName("rectangle8");

    obj.Misc = GUI.fromHandle(_obj_newObject("edit"));
    obj.Misc:setParent(obj.layout1);
    obj.Misc:setName("Misc");
    obj.Misc:setField("Misc");
    obj.Misc:setLeft(12);
    obj.Misc:setTop(417);
    obj.Misc:setWidth(151);
    obj.Misc:setHeight(24);
    obj.Misc:setFontColor("#D1B27E");
    lfm_setPropAsString(obj.Misc, "fontStyle", "bold");
    obj.Misc:setHorzTextAlign("center");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout1);
    obj.rectangle9:setLeft(12);
    obj.rectangle9:setTop(340);
    obj.rectangle9:setWidth(151);
    obj.rectangle9:setHeight(77);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setName("rectangle9");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout1);
    obj.image2:setField("imagemMisc");
    obj.image2:setLeft(12);
    obj.image2:setTop(340);
    obj.image2:setWidth(151);
    obj.image2:setHeight(77);
    obj.image2:setEditable(true);
    obj.image2.animate = true;
    obj.image2:setStyle("autoFit");
    obj.image2:setName("image2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout1);
    obj.button3:setLeft(12);
    obj.button3:setTop(340);
    obj.button3:setWidth(40);
    obj.button3:setHeight(20);
    obj.button3:setText("Ver");
    obj.button3:setName("button3");

    obj.EstilosDeLuta = GUI.fromHandle(_obj_newObject("layout"));
    obj.EstilosDeLuta:setParent(obj);
    obj.EstilosDeLuta:setName("EstilosDeLuta");
    obj.EstilosDeLuta:setLeft(197);
    obj.EstilosDeLuta:setTop(12);
    obj.EstilosDeLuta:setWidth(1000);
    obj.EstilosDeLuta:setHeight(525);

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.EstilosDeLuta);
    obj.rectangle10:setLeft(0);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(1000);
    obj.rectangle10:setHeight(525);
    obj.rectangle10:setColor("#4169E1");
    obj.rectangle10:setName("rectangle10");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.EstilosDeLuta);
    obj.rectangle11:setLeft(2);
    obj.rectangle11:setTop(2);
    obj.rectangle11:setWidth(996);
    obj.rectangle11:setHeight(521);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setName("rectangle11");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj.EstilosDeLuta);
    obj.tabControl1:setLeft(2);
    obj.tabControl1:setTop(2);
    obj.tabControl1:setWidth(996);
    obj.tabControl1:setHeight(521);
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Principal");
    obj.tab1:setName("tab1");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.tab1);
    obj.rectangle12:setLeft(0);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(996);
    obj.rectangle12:setHeight(525);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setName("rectangle12");

    obj.estLPrincipal = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.estLPrincipal:setParent(obj.tab1);
    obj.estLPrincipal:setName("estLPrincipal");
    obj.estLPrincipal:setField("");
    obj.estLPrincipal:setAlign("client");
    obj.estLPrincipal.backgroundColor = "black";
    obj.estLPrincipal.defaultFontColor = "white";
    obj.estLPrincipal.animateImages = true;

    obj.estiloDeLuta = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.estiloDeLuta:setParent(obj.tab1);
    obj.estiloDeLuta:setField("estiloDeLuta");
    obj.estiloDeLuta:setName("estiloDeLuta");
    obj.estiloDeLuta:setValues(EdLSemCaracteresEspeciais);
    obj.estiloDeLuta:setLeft(750);
    obj.estiloDeLuta:setTop(1.2);
    obj.estiloDeLuta:setWidth(150);
    obj.estiloDeLuta:setHeight(29);
    obj.estiloDeLuta:setFontColor("white");
    obj.estiloDeLuta:setHorzTextAlign("center");
    obj.estiloDeLuta:setItems(EstilosDeLuta);

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Secundario");
    obj.tab2:setName("tab2");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.tab2);
    obj.rectangle13:setLeft(0);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setWidth(996);
    obj.rectangle13:setHeight(525);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setName("rectangle13");

    obj.estLSecundario = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.estLSecundario:setParent(obj.tab2);
    obj.estLSecundario:setName("estLSecundario");
    obj.estLSecundario:setAlign("client");
    obj.estLSecundario.backgroundColor = "black";
    obj.estLSecundario.defaultFontColor = "white";
    obj.estLSecundario.animateImages = true;

    obj.estiloDeLutaSec = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.estiloDeLutaSec:setParent(obj.tab2);
    obj.estiloDeLutaSec:setField("estiloDeLutaSec");
    obj.estiloDeLutaSec:setName("estiloDeLutaSec");
    obj.estiloDeLutaSec:setValues(EdLSemCaracteresEspeciais);
    obj.estiloDeLutaSec:setLeft(750);
    obj.estiloDeLutaSec:setTop(1.2);
    obj.estiloDeLutaSec:setWidth(150);
    obj.estiloDeLutaSec:setHeight(29);
    obj.estiloDeLutaSec:setFontColor("white");
    obj.estiloDeLutaSec:setHorzTextAlign("center");
    obj.estiloDeLutaSec:setItems(EstilosDeLuta);

    obj.AkumaLayout = GUI.fromHandle(_obj_newObject("layout"));
    obj.AkumaLayout:setParent(obj);
    obj.AkumaLayout:setName("AkumaLayout");
    obj.AkumaLayout:setLeft(197);
    obj.AkumaLayout:setTop(12);
    obj.AkumaLayout:setWidth(1000);
    obj.AkumaLayout:setHeight(525);
    obj.AkumaLayout:setVisible(false);

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.AkumaLayout);
    obj.rectangle14:setLeft(0);
    obj.rectangle14:setTop(0);
    obj.rectangle14:setWidth(1000);
    obj.rectangle14:setHeight(525);
    obj.rectangle14:setColor("#4169E1");
    obj.rectangle14:setName("rectangle14");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.AkumaLayout);
    obj.rectangle15:setLeft(2);
    obj.rectangle15:setTop(2);
    obj.rectangle15:setWidth(996);
    obj.rectangle15:setHeight(521);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setName("rectangle15");

    obj.tabControl2 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl2:setParent(obj.AkumaLayout);
    obj.tabControl2:setLeft(2);
    obj.tabControl2:setTop(2);
    obj.tabControl2:setWidth(996);
    obj.tabControl2:setHeight(521);
    obj.tabControl2:setName("tabControl2");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl2);
    obj.tab3:setTitle("Descrição");
    obj.tab3:setName("tab3");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.tab3);
    obj.richEdit1:setField("editDescri");
    obj.richEdit1:setAlign("client");
    obj.richEdit1.backgroundColor = "black";
    obj.richEdit1.defaultFontColor = "white";
    obj.richEdit1.animateImages = true;
    obj.richEdit1:setName("richEdit1");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl2);
    obj.tab4:setTitle("Formas ou Habilidades");
    obj.tab4:setName("tab4");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.tab4);
    obj.richEdit2:setField("editFormas");
    obj.richEdit2:setAlign("client");
    obj.richEdit2.backgroundColor = "black";
    obj.richEdit2.defaultFontColor = "white";
    obj.richEdit2.animateImages = true;
    obj.richEdit2:setName("richEdit2");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl2);
    obj.tab5:setTitle("Golpes");
    obj.tab5:setName("tab5");

    obj.richEdit3 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit3:setParent(obj.tab5);
    obj.richEdit3:setField("editGolpes");
    obj.richEdit3:setAlign("client");
    obj.richEdit3.backgroundColor = "black";
    obj.richEdit3.defaultFontColor = "white";
    obj.richEdit3.animateImages = true;
    obj.richEdit3:setName("richEdit3");

    obj.MiscLayout = GUI.fromHandle(_obj_newObject("layout"));
    obj.MiscLayout:setParent(obj);
    obj.MiscLayout:setName("MiscLayout");
    obj.MiscLayout:setLeft(197);
    obj.MiscLayout:setTop(12);
    obj.MiscLayout:setWidth(1000);
    obj.MiscLayout:setHeight(525);
    obj.MiscLayout:setVisible(false);

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.MiscLayout);
    obj.rectangle16:setLeft(0);
    obj.rectangle16:setTop(0);
    obj.rectangle16:setWidth(1000);
    obj.rectangle16:setHeight(525);
    obj.rectangle16:setColor("#4169E1");
    obj.rectangle16:setName("rectangle16");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.MiscLayout);
    obj.rectangle17:setLeft(2);
    obj.rectangle17:setTop(2);
    obj.rectangle17:setWidth(996);
    obj.rectangle17:setHeight(521);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setName("rectangle17");

    obj.richEdit4 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit4:setParent(obj.MiscLayout);
    obj.richEdit4:setField("MiscAkuma");
    obj.richEdit4:setLeft(2);
    obj.richEdit4:setTop(2);
    obj.richEdit4:setAlign("client");
    obj.richEdit4.backgroundColor = "black";
    obj.richEdit4.defaultFontColor = "white";
    obj.richEdit4.animateImages = true;
    obj.richEdit4:setName("richEdit4");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("estiloDeLuta");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setField("estiloDeLutaSec");
    obj.dataLink3:setName("dataLink3");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (event)
            self.EstilosDeLuta.visible = true; self.AkumaLayout.visible = false; self.MiscLayout.visible = false
        end);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (event)
            self.EstilosDeLuta.visible = false; self.AkumaLayout.visible = true; self.MiscLayout.visible = false
        end);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (event)
            self.EstilosDeLuta.visible = false; self.AkumaLayout.visible = false; self.MiscLayout.visible = true
        end);

    obj._e_event3 = obj.estiloDeLuta:addEventListener("onChange",
        function ()
            self.EstLuta.text = self.estiloDeLuta.text
            									self.imagemEdL.src = EdLImagens[self.estiloDeLuta.value].imagem
        end);

    obj._e_event4 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            self.estLPrincipal.field = self.estiloDeLuta.value
            			self.LabelEdL.text = self.estluta.text
            			if (self.imagemEdL.src == "") then
            				self.imagemEdL.src = EdLImagens[self.estiloDeLuta.value].imagem
            			end
        end);

    obj._e_event5 = obj.dataLink3:addEventListener("onChange",
        function (field, oldValue, newValue)
            self.estLSecundario.field = self.estiloDeLutaSec.value
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.estLSecundario ~= nil then self.estLSecundario:destroy(); self.estLSecundario = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.imagemEdL ~= nil then self.imagemEdL:destroy(); self.imagemEdL = nil; end;
        if self.richEdit4 ~= nil then self.richEdit4:destroy(); self.richEdit4 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.Misc ~= nil then self.Misc:destroy(); self.Misc = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.estiloDeLutaSec ~= nil then self.estiloDeLutaSec:destroy(); self.estiloDeLutaSec = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.EstLuta ~= nil then self.EstLuta:destroy(); self.EstLuta = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.MiscLayout ~= nil then self.MiscLayout:destroy(); self.MiscLayout = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.estiloDeLuta ~= nil then self.estiloDeLuta:destroy(); self.estiloDeLuta = nil; end;
        if self.Akuma ~= nil then self.Akuma:destroy(); self.Akuma = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.estLPrincipal ~= nil then self.estLPrincipal:destroy(); self.estLPrincipal = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.tabControl2 ~= nil then self.tabControl2:destroy(); self.tabControl2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.richEdit3 ~= nil then self.richEdit3:destroy(); self.richEdit3 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.AkumaLayout ~= nil then self.AkumaLayout:destroy(); self.AkumaLayout = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.EstilosDeLuta ~= nil then self.EstilosDeLuta:destroy(); self.EstilosDeLuta = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newEdLeAkuma()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_EdLeAkuma();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _EdLeAkuma = {
    newEditor = newEdLeAkuma, 
    new = newEdLeAkuma, 
    name = "EdLeAkuma", 
    dataType = "", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "Brincadeiras Em Alto Mar", 
    description=""};

EdLeAkuma = _EdLeAkuma;
Firecast.registrarForm(_EdLeAkuma);

return _EdLeAkuma;
