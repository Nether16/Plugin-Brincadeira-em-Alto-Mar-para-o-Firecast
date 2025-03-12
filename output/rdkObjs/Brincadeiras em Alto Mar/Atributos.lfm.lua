require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_Atributos()
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
    obj:setName("Atributos");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(10000);
    obj.rectangle1:setHeight(10000);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");


		function AlterarValorTotal(valor)
			local valorBase = valor .."Base"
			local valorPassivo = valor .."Passivo"
			local valorEquips = valor .."Equips"
			local valorTreino = valor .."Treino"
			local valorTotal = valor .."Total"
			
			local soma = tonumber(sheet[valorBase]) + tonumber(sheet[valorPassivo]) + tonumber(sheet[valorEquips]) + tonumber(sheet[valorTreino])
			self[valorTotal].text = tostring(soma)
			sheet.Defesa = tostring(math.floor(sheet.VigorBase / 2))
			
			sheet.PontosDisponiveis = tostring(23 + (sheet.nivel * 2) -sheet.ForcaBase - sheet.AgilidadeBase -sheet.VigorBase -sheet.CombateBase -sheet.PercepcaoBase -sheet.CarismaBase -sheet.InteligenciaBase -sheet.PrecisaoBase -sheet.ForcaDeVontadeBase)
			sheet.PontosDistribuidos = tostring(sheet.ForcaBase + sheet.AgilidadeBase + sheet.VigorBase + sheet.CombateBase + sheet.PercepcaoBase + sheet.CarismaBase + sheet.InteligenciaBase + sheet.PrecisaoBase + sheet.ForcaDeVontadeBase - 9)
			sheet.PontosOutros = tostring(tonumber(sheet.ForcaPassivo) + tonumber(sheet.ForcaEquips) + tonumber(sheet.ForcaTreino) +
										  tonumber(sheet.AgilidadePassivo) + tonumber(sheet.AgilidadeEquips) + tonumber(sheet.AgilidadeTreino) +
										  tonumber(sheet.VigorPassivo) + tonumber(sheet.VigorEquips) + tonumber(sheet.VigorTreino) +
										  tonumber(sheet.CombatePassivo) + tonumber(sheet.CombateEquips) + tonumber(sheet.CombateTreino) +
										  tonumber(sheet.PercepcaoPassivo) + tonumber(sheet.PercepcaoEquips) + tonumber(sheet.PercepcaoTreino) +
										  tonumber(sheet.CarismaPassivo) + tonumber(sheet.CarismaEquips) + tonumber(sheet.CarismaTreino) +
										  tonumber(sheet.InteligenciaPassivo) + tonumber(sheet.InteligenciaEquips) + tonumber(sheet.InteligenciaTreino) +
										  tonumber(sheet.PrecisaoPassivo) + tonumber(sheet.PrecisaoEquips) + tonumber(sheet.PrecisaoTreino) +
										  tonumber(sheet.ForcaDeVontadePassivo) + tonumber(sheet.ForcaDeVontadeEquips) + tonumber(sheet.ForcaDeVontadeTreino)
										 ) 
			sheet.PontosTotais = tostring(sheet.ForcaTotal + sheet.AgilidadeTotal + sheet.VigorTotal + sheet.CombateTotal + sheet.PercepcaoTotal + sheet.CarismaTotal + sheet.InteligenciaTotal + sheet.PrecisaoTotal + sheet.ForcaDeVontadeTotal)

			sheet.hp = (sheet.VigorTotal * 7) + 45 + (5 * sheet.nivel)
			sheet.eng = (sheet.VigorTotal * 7) + 57 + (5 * sheet.nivel)
			if (sheet.ForcaDeVontadeTotal >= 20) then sheet.haki = sheet.ForcaDeVontadeTotal * 5 else sheet.haki = 0 end
		end
		
		function RolarAtributo(valor)
			local valorTotal = valor .."Total"
			if (valor == "Forca") then valor = "Força" end
			if (valor == "Precisao") then valor = "Precisão" end
			if (valor == "Percepcao") then valor = "Percepção" end
			if (valor == "Inteligencia") then valor = "Inteligência" end
	
			local mesas = Firecast.getRooms();
			if (valor == "Defesa") then mesas[1].chat:rolarDados("1d20 + " .. sheet.Defesa, "Teste de ".. valor) else
			                            mesas[1].chat:rolarDados("1d20 + " .. sheet[valorTotal], "Teste de ".. valor) end
		end
	


    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setLeft(12);
    obj.layout1:setTop(12);
    obj.layout1:setWidth(430);
    obj.layout1:setHeight(525);
    obj.layout1:setName("layout1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(430);
    obj.rectangle2:setHeight(525);
    obj.rectangle2:setColor("#4169E1");
    obj.rectangle2:setName("rectangle2");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout1);
    obj.rectangle3:setLeft(2);
    obj.rectangle3:setTop(2);
    obj.rectangle3:setWidth(426);
    obj.rectangle3:setHeight(521);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(2);
    obj.label1:setTop(2);
    obj.label1:setWidth(426);
    obj.label1:setHeight(36);
    obj.label1:setText("Atributos");
    obj.label1:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label1, "fontStyle", "bold underline");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setFontSize(23);
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setLeft(130);
    obj.label2:setTop(54);
    obj.label2:setWidth(45);
    obj.label2:setHeight(20);
    obj.label2:setText("Base");
    obj.label2:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label2, "fontStyle", "bold");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setFontSize(15);
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setLeft(180);
    obj.label3:setTop(54);
    obj.label3:setWidth(65);
    obj.label3:setHeight(20);
    obj.label3:setText("Passivo");
    obj.label3:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label3, "fontStyle", "bold");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setFontSize(15);
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setLeft(240);
    obj.label4:setTop(54);
    obj.label4:setWidth(65);
    obj.label4:setHeight(20);
    obj.label4:setText("Equips");
    obj.label4:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label4, "fontStyle", "bold");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setFontSize(15);
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout1);
    obj.label5:setLeft(300);
    obj.label5:setTop(54);
    obj.label5:setWidth(65);
    obj.label5:setHeight(20);
    obj.label5:setText("Treino");
    obj.label5:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label5, "fontStyle", "bold");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setFontSize(15);
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout1);
    obj.label6:setLeft(360);
    obj.label6:setTop(54);
    obj.label6:setWidth(65);
    obj.label6:setHeight(20);
    obj.label6:setText("Total");
    obj.label6:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label6, "fontStyle", "bold");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setFontSize(15);
    obj.label6:setName("label6");

    obj.ForcaButton = GUI.fromHandle(_obj_newObject("button"));
    obj.ForcaButton:setParent(obj.layout1);
    obj.ForcaButton:setName("ForcaButton");
    obj.ForcaButton:setLeft(10);
    obj.ForcaButton:setTop(80);
    obj.ForcaButton:setText("Força");
    obj.ForcaButton:setWidth(110);

    obj.AgilButton = GUI.fromHandle(_obj_newObject("button"));
    obj.AgilButton:setParent(obj.layout1);
    obj.AgilButton:setName("AgilButton");
    obj.AgilButton:setLeft(10);
    obj.AgilButton:setTop(110);
    obj.AgilButton:setText("Agilidade");
    obj.AgilButton:setWidth(110);

    obj.VigorButton = GUI.fromHandle(_obj_newObject("button"));
    obj.VigorButton:setParent(obj.layout1);
    obj.VigorButton:setName("VigorButton");
    obj.VigorButton:setLeft(10);
    obj.VigorButton:setTop(140);
    obj.VigorButton:setText("Vigor");
    obj.VigorButton:setWidth(110);

    obj.ComButton = GUI.fromHandle(_obj_newObject("button"));
    obj.ComButton:setParent(obj.layout1);
    obj.ComButton:setName("ComButton");
    obj.ComButton:setLeft(10);
    obj.ComButton:setTop(170);
    obj.ComButton:setText("Combate");
    obj.ComButton:setWidth(110);

    obj.PercepButton = GUI.fromHandle(_obj_newObject("button"));
    obj.PercepButton:setParent(obj.layout1);
    obj.PercepButton:setName("PercepButton");
    obj.PercepButton:setLeft(10);
    obj.PercepButton:setTop(200);
    obj.PercepButton:setText("Percepção");
    obj.PercepButton:setWidth(110);

    obj.CarisButton = GUI.fromHandle(_obj_newObject("button"));
    obj.CarisButton:setParent(obj.layout1);
    obj.CarisButton:setName("CarisButton");
    obj.CarisButton:setLeft(10);
    obj.CarisButton:setTop(230);
    obj.CarisButton:setText("Carisma");
    obj.CarisButton:setWidth(110);

    obj.IntButton = GUI.fromHandle(_obj_newObject("button"));
    obj.IntButton:setParent(obj.layout1);
    obj.IntButton:setName("IntButton");
    obj.IntButton:setLeft(10);
    obj.IntButton:setTop(260);
    obj.IntButton:setText("Intelegência");
    obj.IntButton:setWidth(110);

    obj.PrecButton = GUI.fromHandle(_obj_newObject("button"));
    obj.PrecButton:setParent(obj.layout1);
    obj.PrecButton:setName("PrecButton");
    obj.PrecButton:setLeft(10);
    obj.PrecButton:setTop(290);
    obj.PrecButton:setText("Precisão");
    obj.PrecButton:setWidth(110);

    obj.ForDVonButton = GUI.fromHandle(_obj_newObject("button"));
    obj.ForDVonButton:setParent(obj.layout1);
    obj.ForDVonButton:setName("ForDVonButton");
    obj.ForDVonButton:setLeft(10);
    obj.ForDVonButton:setTop(320);
    obj.ForDVonButton:setText("Força de Vontade");
    obj.ForDVonButton:setWidth(110);

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout1);
    obj.rectangle4:setLeft(130);
    obj.rectangle4:setTop(79);
    obj.rectangle4:setWidth(45);
    obj.rectangle4:setHeight(24);
    obj.rectangle4:setColor("#F5F5DC");
    obj.rectangle4:setXradius(7);
    obj.rectangle4:setYradius(7);
    obj.rectangle4:setCornerType("round");
    obj.rectangle4:setName("rectangle4");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setField("ForcaBase");
    obj.edit1:setLeft(130);
    obj.edit1:setTop(79);
    obj.edit1:setWidth(45);
    obj.edit1:setHeight(24);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontColor("black");
    obj.edit1:setFontSize(17);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setType("number");
    lfm_setPropAsString(obj.edit1, "fontStyle", "bold");
    obj.edit1:setName("edit1");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout1);
    obj.rectangle5:setLeft(130);
    obj.rectangle5:setTop(109);
    obj.rectangle5:setWidth(45);
    obj.rectangle5:setHeight(24);
    obj.rectangle5:setColor("#F5F5DC");
    obj.rectangle5:setXradius(7);
    obj.rectangle5:setYradius(7);
    obj.rectangle5:setCornerType("round");
    obj.rectangle5:setName("rectangle5");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setField("AgilidadeBase");
    obj.edit2:setLeft(130);
    obj.edit2:setTop(109);
    obj.edit2:setWidth(45);
    obj.edit2:setHeight(24);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontColor("black");
    obj.edit2:setFontSize(17);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setType("number");
    lfm_setPropAsString(obj.edit2, "fontStyle", "bold");
    obj.edit2:setName("edit2");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout1);
    obj.rectangle6:setLeft(130);
    obj.rectangle6:setTop(139);
    obj.rectangle6:setWidth(45);
    obj.rectangle6:setHeight(24);
    obj.rectangle6:setColor("#F5F5DC");
    obj.rectangle6:setXradius(7);
    obj.rectangle6:setYradius(7);
    obj.rectangle6:setCornerType("round");
    obj.rectangle6:setName("rectangle6");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout1);
    obj.edit3:setField("VigorBase");
    obj.edit3:setLeft(130);
    obj.edit3:setTop(139);
    obj.edit3:setWidth(45);
    obj.edit3:setHeight(24);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontColor("black");
    obj.edit3:setFontSize(17);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setType("number");
    lfm_setPropAsString(obj.edit3, "fontStyle", "bold");
    obj.edit3:setName("edit3");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout1);
    obj.rectangle7:setLeft(130);
    obj.rectangle7:setTop(169);
    obj.rectangle7:setWidth(45);
    obj.rectangle7:setHeight(24);
    obj.rectangle7:setColor("#F5F5DC");
    obj.rectangle7:setXradius(7);
    obj.rectangle7:setYradius(7);
    obj.rectangle7:setCornerType("round");
    obj.rectangle7:setName("rectangle7");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout1);
    obj.edit4:setField("CombateBase");
    obj.edit4:setLeft(130);
    obj.edit4:setTop(169);
    obj.edit4:setWidth(45);
    obj.edit4:setHeight(24);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontColor("black");
    obj.edit4:setFontSize(17);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setType("number");
    lfm_setPropAsString(obj.edit4, "fontStyle", "bold");
    obj.edit4:setName("edit4");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout1);
    obj.rectangle8:setLeft(130);
    obj.rectangle8:setTop(199);
    obj.rectangle8:setWidth(45);
    obj.rectangle8:setHeight(24);
    obj.rectangle8:setColor("#F5F5DC");
    obj.rectangle8:setXradius(7);
    obj.rectangle8:setYradius(7);
    obj.rectangle8:setCornerType("round");
    obj.rectangle8:setName("rectangle8");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout1);
    obj.edit5:setField("PercepcaoBase");
    obj.edit5:setLeft(130);
    obj.edit5:setTop(199);
    obj.edit5:setWidth(45);
    obj.edit5:setHeight(24);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontColor("black");
    obj.edit5:setFontSize(17);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setType("number");
    lfm_setPropAsString(obj.edit5, "fontStyle", "bold");
    obj.edit5:setName("edit5");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout1);
    obj.rectangle9:setLeft(130);
    obj.rectangle9:setTop(229);
    obj.rectangle9:setWidth(45);
    obj.rectangle9:setHeight(24);
    obj.rectangle9:setColor("#F5F5DC");
    obj.rectangle9:setXradius(7);
    obj.rectangle9:setYradius(7);
    obj.rectangle9:setCornerType("round");
    obj.rectangle9:setName("rectangle9");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout1);
    obj.edit6:setField("CarismaBase");
    obj.edit6:setLeft(130);
    obj.edit6:setTop(229);
    obj.edit6:setWidth(45);
    obj.edit6:setHeight(24);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontColor("black");
    obj.edit6:setFontSize(17);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setType("number");
    lfm_setPropAsString(obj.edit6, "fontStyle", "bold");
    obj.edit6:setName("edit6");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout1);
    obj.rectangle10:setLeft(130);
    obj.rectangle10:setTop(259);
    obj.rectangle10:setWidth(45);
    obj.rectangle10:setHeight(24);
    obj.rectangle10:setColor("#F5F5DC");
    obj.rectangle10:setXradius(7);
    obj.rectangle10:setYradius(7);
    obj.rectangle10:setCornerType("round");
    obj.rectangle10:setName("rectangle10");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout1);
    obj.edit7:setField("InteligenciaBase");
    obj.edit7:setLeft(130);
    obj.edit7:setTop(259);
    obj.edit7:setWidth(45);
    obj.edit7:setHeight(24);
    obj.edit7:setTransparent(true);
    obj.edit7:setFontColor("black");
    obj.edit7:setFontSize(17);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setType("number");
    lfm_setPropAsString(obj.edit7, "fontStyle", "bold");
    obj.edit7:setName("edit7");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout1);
    obj.rectangle11:setLeft(130);
    obj.rectangle11:setTop(289);
    obj.rectangle11:setWidth(45);
    obj.rectangle11:setHeight(24);
    obj.rectangle11:setColor("#F5F5DC");
    obj.rectangle11:setXradius(7);
    obj.rectangle11:setYradius(7);
    obj.rectangle11:setCornerType("round");
    obj.rectangle11:setName("rectangle11");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout1);
    obj.edit8:setField("PrecisaoBase");
    obj.edit8:setLeft(130);
    obj.edit8:setTop(289);
    obj.edit8:setWidth(45);
    obj.edit8:setHeight(24);
    obj.edit8:setTransparent(true);
    obj.edit8:setFontColor("black");
    obj.edit8:setFontSize(17);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setType("number");
    lfm_setPropAsString(obj.edit8, "fontStyle", "bold");
    obj.edit8:setName("edit8");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout1);
    obj.rectangle12:setLeft(130);
    obj.rectangle12:setTop(319);
    obj.rectangle12:setWidth(45);
    obj.rectangle12:setHeight(24);
    obj.rectangle12:setColor("#F5F5DC");
    obj.rectangle12:setXradius(7);
    obj.rectangle12:setYradius(7);
    obj.rectangle12:setCornerType("round");
    obj.rectangle12:setName("rectangle12");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout1);
    obj.edit9:setField("ForcaDeVontadeBase");
    obj.edit9:setLeft(130);
    obj.edit9:setTop(319);
    obj.edit9:setWidth(45);
    obj.edit9:setHeight(24);
    obj.edit9:setTransparent(true);
    obj.edit9:setFontColor("black");
    obj.edit9:setFontSize(17);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setType("number");
    lfm_setPropAsString(obj.edit9, "fontStyle", "bold");
    obj.edit9:setName("edit9");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout1);
    obj.rectangle13:setLeft(190);
    obj.rectangle13:setTop(79);
    obj.rectangle13:setWidth(45);
    obj.rectangle13:setHeight(24);
    obj.rectangle13:setColor("#F5F5DC");
    obj.rectangle13:setXradius(7);
    obj.rectangle13:setYradius(7);
    obj.rectangle13:setCornerType("round");
    obj.rectangle13:setName("rectangle13");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout1);
    obj.edit10:setField("ForcaPassivo");
    obj.edit10:setLeft(190);
    obj.edit10:setTop(79);
    obj.edit10:setWidth(45);
    obj.edit10:setHeight(24);
    obj.edit10:setTransparent(true);
    obj.edit10:setFontColor("black");
    obj.edit10:setFontSize(17);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setType("number");
    lfm_setPropAsString(obj.edit10, "fontStyle", "bold");
    obj.edit10:setName("edit10");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout1);
    obj.rectangle14:setLeft(190);
    obj.rectangle14:setTop(109);
    obj.rectangle14:setWidth(45);
    obj.rectangle14:setHeight(24);
    obj.rectangle14:setColor("#F5F5DC");
    obj.rectangle14:setXradius(7);
    obj.rectangle14:setYradius(7);
    obj.rectangle14:setCornerType("round");
    obj.rectangle14:setName("rectangle14");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout1);
    obj.edit11:setField("AgilidadePassivo");
    obj.edit11:setLeft(190);
    obj.edit11:setTop(109);
    obj.edit11:setWidth(45);
    obj.edit11:setHeight(24);
    obj.edit11:setTransparent(true);
    obj.edit11:setFontColor("black");
    obj.edit11:setFontSize(17);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setType("number");
    lfm_setPropAsString(obj.edit11, "fontStyle", "bold");
    obj.edit11:setName("edit11");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout1);
    obj.rectangle15:setLeft(190);
    obj.rectangle15:setTop(139);
    obj.rectangle15:setWidth(45);
    obj.rectangle15:setHeight(24);
    obj.rectangle15:setColor("#F5F5DC");
    obj.rectangle15:setXradius(7);
    obj.rectangle15:setYradius(7);
    obj.rectangle15:setCornerType("round");
    obj.rectangle15:setName("rectangle15");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout1);
    obj.edit12:setField("VigorPassivo");
    obj.edit12:setLeft(190);
    obj.edit12:setTop(139);
    obj.edit12:setWidth(45);
    obj.edit12:setHeight(24);
    obj.edit12:setTransparent(true);
    obj.edit12:setFontColor("black");
    obj.edit12:setFontSize(17);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setType("number");
    lfm_setPropAsString(obj.edit12, "fontStyle", "bold");
    obj.edit12:setName("edit12");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout1);
    obj.rectangle16:setLeft(190);
    obj.rectangle16:setTop(169);
    obj.rectangle16:setWidth(45);
    obj.rectangle16:setHeight(24);
    obj.rectangle16:setColor("#F5F5DC");
    obj.rectangle16:setXradius(7);
    obj.rectangle16:setYradius(7);
    obj.rectangle16:setCornerType("round");
    obj.rectangle16:setName("rectangle16");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout1);
    obj.edit13:setField("CombatePassivo");
    obj.edit13:setLeft(190);
    obj.edit13:setTop(169);
    obj.edit13:setWidth(45);
    obj.edit13:setHeight(24);
    obj.edit13:setTransparent(true);
    obj.edit13:setFontColor("black");
    obj.edit13:setFontSize(17);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setType("number");
    lfm_setPropAsString(obj.edit13, "fontStyle", "bold");
    obj.edit13:setName("edit13");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout1);
    obj.rectangle17:setLeft(190);
    obj.rectangle17:setTop(199);
    obj.rectangle17:setWidth(45);
    obj.rectangle17:setHeight(24);
    obj.rectangle17:setColor("#F5F5DC");
    obj.rectangle17:setXradius(7);
    obj.rectangle17:setYradius(7);
    obj.rectangle17:setCornerType("round");
    obj.rectangle17:setName("rectangle17");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout1);
    obj.edit14:setField("PercepcaoPassivo");
    obj.edit14:setLeft(190);
    obj.edit14:setTop(199);
    obj.edit14:setWidth(45);
    obj.edit14:setHeight(24);
    obj.edit14:setTransparent(true);
    obj.edit14:setFontColor("black");
    obj.edit14:setFontSize(17);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setType("number");
    lfm_setPropAsString(obj.edit14, "fontStyle", "bold");
    obj.edit14:setName("edit14");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout1);
    obj.rectangle18:setLeft(190);
    obj.rectangle18:setTop(229);
    obj.rectangle18:setWidth(45);
    obj.rectangle18:setHeight(24);
    obj.rectangle18:setColor("#F5F5DC");
    obj.rectangle18:setXradius(7);
    obj.rectangle18:setYradius(7);
    obj.rectangle18:setCornerType("round");
    obj.rectangle18:setName("rectangle18");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout1);
    obj.edit15:setField("CarismaPassivo");
    obj.edit15:setLeft(190);
    obj.edit15:setTop(229);
    obj.edit15:setWidth(45);
    obj.edit15:setHeight(24);
    obj.edit15:setTransparent(true);
    obj.edit15:setFontColor("black");
    obj.edit15:setFontSize(17);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setType("number");
    lfm_setPropAsString(obj.edit15, "fontStyle", "bold");
    obj.edit15:setName("edit15");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout1);
    obj.rectangle19:setLeft(190);
    obj.rectangle19:setTop(259);
    obj.rectangle19:setWidth(45);
    obj.rectangle19:setHeight(24);
    obj.rectangle19:setColor("#F5F5DC");
    obj.rectangle19:setXradius(7);
    obj.rectangle19:setYradius(7);
    obj.rectangle19:setCornerType("round");
    obj.rectangle19:setName("rectangle19");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout1);
    obj.edit16:setField("InteligenciaPassivo");
    obj.edit16:setLeft(190);
    obj.edit16:setTop(259);
    obj.edit16:setWidth(45);
    obj.edit16:setHeight(24);
    obj.edit16:setTransparent(true);
    obj.edit16:setFontColor("black");
    obj.edit16:setFontSize(17);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setType("number");
    lfm_setPropAsString(obj.edit16, "fontStyle", "bold");
    obj.edit16:setName("edit16");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout1);
    obj.rectangle20:setLeft(190);
    obj.rectangle20:setTop(289);
    obj.rectangle20:setWidth(45);
    obj.rectangle20:setHeight(24);
    obj.rectangle20:setColor("#F5F5DC");
    obj.rectangle20:setXradius(7);
    obj.rectangle20:setYradius(7);
    obj.rectangle20:setCornerType("round");
    obj.rectangle20:setName("rectangle20");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout1);
    obj.edit17:setField("PrecisaoPassivo");
    obj.edit17:setLeft(190);
    obj.edit17:setTop(289);
    obj.edit17:setWidth(45);
    obj.edit17:setHeight(24);
    obj.edit17:setTransparent(true);
    obj.edit17:setFontColor("black");
    obj.edit17:setFontSize(17);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setType("number");
    lfm_setPropAsString(obj.edit17, "fontStyle", "bold");
    obj.edit17:setName("edit17");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout1);
    obj.rectangle21:setLeft(190);
    obj.rectangle21:setTop(319);
    obj.rectangle21:setWidth(45);
    obj.rectangle21:setHeight(24);
    obj.rectangle21:setColor("#F5F5DC");
    obj.rectangle21:setXradius(7);
    obj.rectangle21:setYradius(7);
    obj.rectangle21:setCornerType("round");
    obj.rectangle21:setName("rectangle21");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout1);
    obj.edit18:setField("ForcaDeVontadePassivo");
    obj.edit18:setLeft(190);
    obj.edit18:setTop(319);
    obj.edit18:setWidth(45);
    obj.edit18:setHeight(24);
    obj.edit18:setTransparent(true);
    obj.edit18:setFontColor("black");
    obj.edit18:setFontSize(17);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setType("number");
    lfm_setPropAsString(obj.edit18, "fontStyle", "bold");
    obj.edit18:setName("edit18");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout1);
    obj.rectangle22:setLeft(250);
    obj.rectangle22:setTop(79);
    obj.rectangle22:setWidth(45);
    obj.rectangle22:setHeight(24);
    obj.rectangle22:setColor("#F5F5DC");
    obj.rectangle22:setXradius(7);
    obj.rectangle22:setYradius(7);
    obj.rectangle22:setCornerType("round");
    obj.rectangle22:setName("rectangle22");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout1);
    obj.edit19:setField("ForcaEquips");
    obj.edit19:setLeft(250);
    obj.edit19:setTop(79);
    obj.edit19:setWidth(45);
    obj.edit19:setHeight(24);
    obj.edit19:setTransparent(true);
    obj.edit19:setFontColor("black");
    obj.edit19:setFontSize(17);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setType("number");
    lfm_setPropAsString(obj.edit19, "fontStyle", "bold");
    obj.edit19:setName("edit19");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout1);
    obj.rectangle23:setLeft(250);
    obj.rectangle23:setTop(109);
    obj.rectangle23:setWidth(45);
    obj.rectangle23:setHeight(24);
    obj.rectangle23:setColor("#F5F5DC");
    obj.rectangle23:setXradius(7);
    obj.rectangle23:setYradius(7);
    obj.rectangle23:setCornerType("round");
    obj.rectangle23:setName("rectangle23");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout1);
    obj.edit20:setField("AgilidadeEquips");
    obj.edit20:setLeft(250);
    obj.edit20:setTop(109);
    obj.edit20:setWidth(45);
    obj.edit20:setHeight(24);
    obj.edit20:setTransparent(true);
    obj.edit20:setFontColor("black");
    obj.edit20:setFontSize(17);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setType("number");
    lfm_setPropAsString(obj.edit20, "fontStyle", "bold");
    obj.edit20:setName("edit20");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout1);
    obj.rectangle24:setLeft(250);
    obj.rectangle24:setTop(139);
    obj.rectangle24:setWidth(45);
    obj.rectangle24:setHeight(24);
    obj.rectangle24:setColor("#F5F5DC");
    obj.rectangle24:setXradius(7);
    obj.rectangle24:setYradius(7);
    obj.rectangle24:setCornerType("round");
    obj.rectangle24:setName("rectangle24");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout1);
    obj.edit21:setField("VigorEquips");
    obj.edit21:setLeft(250);
    obj.edit21:setTop(139);
    obj.edit21:setWidth(45);
    obj.edit21:setHeight(24);
    obj.edit21:setTransparent(true);
    obj.edit21:setFontColor("black");
    obj.edit21:setFontSize(17);
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setType("number");
    lfm_setPropAsString(obj.edit21, "fontStyle", "bold");
    obj.edit21:setName("edit21");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout1);
    obj.rectangle25:setLeft(250);
    obj.rectangle25:setTop(169);
    obj.rectangle25:setWidth(45);
    obj.rectangle25:setHeight(24);
    obj.rectangle25:setColor("#F5F5DC");
    obj.rectangle25:setXradius(7);
    obj.rectangle25:setYradius(7);
    obj.rectangle25:setCornerType("round");
    obj.rectangle25:setName("rectangle25");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout1);
    obj.edit22:setField("CombateEquips");
    obj.edit22:setLeft(250);
    obj.edit22:setTop(169);
    obj.edit22:setWidth(45);
    obj.edit22:setHeight(24);
    obj.edit22:setTransparent(true);
    obj.edit22:setFontColor("black");
    obj.edit22:setFontSize(17);
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setType("number");
    lfm_setPropAsString(obj.edit22, "fontStyle", "bold");
    obj.edit22:setName("edit22");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout1);
    obj.rectangle26:setLeft(250);
    obj.rectangle26:setTop(199);
    obj.rectangle26:setWidth(45);
    obj.rectangle26:setHeight(24);
    obj.rectangle26:setColor("#F5F5DC");
    obj.rectangle26:setXradius(7);
    obj.rectangle26:setYradius(7);
    obj.rectangle26:setCornerType("round");
    obj.rectangle26:setName("rectangle26");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout1);
    obj.edit23:setField("PercepcaoEquips");
    obj.edit23:setLeft(250);
    obj.edit23:setTop(199);
    obj.edit23:setWidth(45);
    obj.edit23:setHeight(24);
    obj.edit23:setTransparent(true);
    obj.edit23:setFontColor("black");
    obj.edit23:setFontSize(17);
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setType("number");
    lfm_setPropAsString(obj.edit23, "fontStyle", "bold");
    obj.edit23:setName("edit23");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout1);
    obj.rectangle27:setLeft(250);
    obj.rectangle27:setTop(229);
    obj.rectangle27:setWidth(45);
    obj.rectangle27:setHeight(24);
    obj.rectangle27:setColor("#F5F5DC");
    obj.rectangle27:setXradius(7);
    obj.rectangle27:setYradius(7);
    obj.rectangle27:setCornerType("round");
    obj.rectangle27:setName("rectangle27");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout1);
    obj.edit24:setField("CarismaEquips");
    obj.edit24:setLeft(250);
    obj.edit24:setTop(229);
    obj.edit24:setWidth(45);
    obj.edit24:setHeight(24);
    obj.edit24:setTransparent(true);
    obj.edit24:setFontColor("black");
    obj.edit24:setFontSize(17);
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setType("number");
    lfm_setPropAsString(obj.edit24, "fontStyle", "bold");
    obj.edit24:setName("edit24");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout1);
    obj.rectangle28:setLeft(250);
    obj.rectangle28:setTop(259);
    obj.rectangle28:setWidth(45);
    obj.rectangle28:setHeight(24);
    obj.rectangle28:setColor("#F5F5DC");
    obj.rectangle28:setXradius(7);
    obj.rectangle28:setYradius(7);
    obj.rectangle28:setCornerType("round");
    obj.rectangle28:setName("rectangle28");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout1);
    obj.edit25:setField("InteligenciaEquips");
    obj.edit25:setLeft(250);
    obj.edit25:setTop(259);
    obj.edit25:setWidth(45);
    obj.edit25:setHeight(24);
    obj.edit25:setTransparent(true);
    obj.edit25:setFontColor("black");
    obj.edit25:setFontSize(17);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setType("number");
    lfm_setPropAsString(obj.edit25, "fontStyle", "bold");
    obj.edit25:setName("edit25");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout1);
    obj.rectangle29:setLeft(250);
    obj.rectangle29:setTop(289);
    obj.rectangle29:setWidth(45);
    obj.rectangle29:setHeight(24);
    obj.rectangle29:setColor("#F5F5DC");
    obj.rectangle29:setXradius(7);
    obj.rectangle29:setYradius(7);
    obj.rectangle29:setCornerType("round");
    obj.rectangle29:setName("rectangle29");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout1);
    obj.edit26:setField("PrecisaoEquips");
    obj.edit26:setLeft(250);
    obj.edit26:setTop(289);
    obj.edit26:setWidth(45);
    obj.edit26:setHeight(24);
    obj.edit26:setTransparent(true);
    obj.edit26:setFontColor("black");
    obj.edit26:setFontSize(17);
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setType("number");
    lfm_setPropAsString(obj.edit26, "fontStyle", "bold");
    obj.edit26:setName("edit26");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout1);
    obj.rectangle30:setLeft(250);
    obj.rectangle30:setTop(319);
    obj.rectangle30:setWidth(45);
    obj.rectangle30:setHeight(24);
    obj.rectangle30:setColor("#F5F5DC");
    obj.rectangle30:setXradius(7);
    obj.rectangle30:setYradius(7);
    obj.rectangle30:setCornerType("round");
    obj.rectangle30:setName("rectangle30");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout1);
    obj.edit27:setField("ForcaDeVontadeEquips");
    obj.edit27:setLeft(250);
    obj.edit27:setTop(319);
    obj.edit27:setWidth(45);
    obj.edit27:setHeight(24);
    obj.edit27:setTransparent(true);
    obj.edit27:setFontColor("black");
    obj.edit27:setFontSize(17);
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setType("number");
    lfm_setPropAsString(obj.edit27, "fontStyle", "bold");
    obj.edit27:setName("edit27");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout1);
    obj.rectangle31:setLeft(310);
    obj.rectangle31:setTop(79);
    obj.rectangle31:setWidth(45);
    obj.rectangle31:setHeight(24);
    obj.rectangle31:setColor("#F5F5DC");
    obj.rectangle31:setXradius(7);
    obj.rectangle31:setYradius(7);
    obj.rectangle31:setCornerType("round");
    obj.rectangle31:setName("rectangle31");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout1);
    obj.edit28:setField("ForcaTreino");
    obj.edit28:setLeft(310);
    obj.edit28:setTop(79);
    obj.edit28:setWidth(45);
    obj.edit28:setHeight(24);
    obj.edit28:setTransparent(true);
    obj.edit28:setFontColor("black");
    obj.edit28:setFontSize(17);
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setType("number");
    lfm_setPropAsString(obj.edit28, "fontStyle", "bold");
    obj.edit28:setName("edit28");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout1);
    obj.rectangle32:setLeft(310);
    obj.rectangle32:setTop(109);
    obj.rectangle32:setWidth(45);
    obj.rectangle32:setHeight(24);
    obj.rectangle32:setColor("#F5F5DC");
    obj.rectangle32:setXradius(7);
    obj.rectangle32:setYradius(7);
    obj.rectangle32:setCornerType("round");
    obj.rectangle32:setName("rectangle32");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout1);
    obj.edit29:setField("AgilidadeTreino");
    obj.edit29:setLeft(310);
    obj.edit29:setTop(109);
    obj.edit29:setWidth(45);
    obj.edit29:setHeight(24);
    obj.edit29:setTransparent(true);
    obj.edit29:setFontColor("black");
    obj.edit29:setFontSize(17);
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setType("number");
    lfm_setPropAsString(obj.edit29, "fontStyle", "bold");
    obj.edit29:setName("edit29");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout1);
    obj.rectangle33:setLeft(310);
    obj.rectangle33:setTop(139);
    obj.rectangle33:setWidth(45);
    obj.rectangle33:setHeight(24);
    obj.rectangle33:setColor("#F5F5DC");
    obj.rectangle33:setXradius(7);
    obj.rectangle33:setYradius(7);
    obj.rectangle33:setCornerType("round");
    obj.rectangle33:setName("rectangle33");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout1);
    obj.edit30:setField("VigorTreino");
    obj.edit30:setLeft(310);
    obj.edit30:setTop(139);
    obj.edit30:setWidth(45);
    obj.edit30:setHeight(24);
    obj.edit30:setTransparent(true);
    obj.edit30:setFontColor("black");
    obj.edit30:setFontSize(17);
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setType("number");
    lfm_setPropAsString(obj.edit30, "fontStyle", "bold");
    obj.edit30:setName("edit30");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout1);
    obj.rectangle34:setLeft(310);
    obj.rectangle34:setTop(169);
    obj.rectangle34:setWidth(45);
    obj.rectangle34:setHeight(24);
    obj.rectangle34:setColor("#F5F5DC");
    obj.rectangle34:setXradius(7);
    obj.rectangle34:setYradius(7);
    obj.rectangle34:setCornerType("round");
    obj.rectangle34:setName("rectangle34");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout1);
    obj.edit31:setField("CombateTreino");
    obj.edit31:setLeft(310);
    obj.edit31:setTop(169);
    obj.edit31:setWidth(45);
    obj.edit31:setHeight(24);
    obj.edit31:setTransparent(true);
    obj.edit31:setFontColor("black");
    obj.edit31:setFontSize(17);
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setType("number");
    lfm_setPropAsString(obj.edit31, "fontStyle", "bold");
    obj.edit31:setName("edit31");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout1);
    obj.rectangle35:setLeft(310);
    obj.rectangle35:setTop(199);
    obj.rectangle35:setWidth(45);
    obj.rectangle35:setHeight(24);
    obj.rectangle35:setColor("#F5F5DC");
    obj.rectangle35:setXradius(7);
    obj.rectangle35:setYradius(7);
    obj.rectangle35:setCornerType("round");
    obj.rectangle35:setName("rectangle35");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout1);
    obj.edit32:setField("PercepcaoTreino");
    obj.edit32:setLeft(310);
    obj.edit32:setTop(199);
    obj.edit32:setWidth(45);
    obj.edit32:setHeight(24);
    obj.edit32:setTransparent(true);
    obj.edit32:setFontColor("black");
    obj.edit32:setFontSize(17);
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setType("number");
    lfm_setPropAsString(obj.edit32, "fontStyle", "bold");
    obj.edit32:setName("edit32");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout1);
    obj.rectangle36:setLeft(310);
    obj.rectangle36:setTop(229);
    obj.rectangle36:setWidth(45);
    obj.rectangle36:setHeight(24);
    obj.rectangle36:setColor("#F5F5DC");
    obj.rectangle36:setXradius(7);
    obj.rectangle36:setYradius(7);
    obj.rectangle36:setCornerType("round");
    obj.rectangle36:setName("rectangle36");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout1);
    obj.edit33:setField("CarismaTreino");
    obj.edit33:setLeft(310);
    obj.edit33:setTop(229);
    obj.edit33:setWidth(45);
    obj.edit33:setHeight(24);
    obj.edit33:setTransparent(true);
    obj.edit33:setFontColor("black");
    obj.edit33:setFontSize(17);
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setType("number");
    lfm_setPropAsString(obj.edit33, "fontStyle", "bold");
    obj.edit33:setName("edit33");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout1);
    obj.rectangle37:setLeft(310);
    obj.rectangle37:setTop(259);
    obj.rectangle37:setWidth(45);
    obj.rectangle37:setHeight(24);
    obj.rectangle37:setColor("#F5F5DC");
    obj.rectangle37:setXradius(7);
    obj.rectangle37:setYradius(7);
    obj.rectangle37:setCornerType("round");
    obj.rectangle37:setName("rectangle37");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout1);
    obj.edit34:setField("InteligenciaTreino");
    obj.edit34:setLeft(310);
    obj.edit34:setTop(259);
    obj.edit34:setWidth(45);
    obj.edit34:setHeight(24);
    obj.edit34:setTransparent(true);
    obj.edit34:setFontColor("black");
    obj.edit34:setFontSize(17);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setType("number");
    lfm_setPropAsString(obj.edit34, "fontStyle", "bold");
    obj.edit34:setName("edit34");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout1);
    obj.rectangle38:setLeft(310);
    obj.rectangle38:setTop(289);
    obj.rectangle38:setWidth(45);
    obj.rectangle38:setHeight(24);
    obj.rectangle38:setColor("#F5F5DC");
    obj.rectangle38:setXradius(7);
    obj.rectangle38:setYradius(7);
    obj.rectangle38:setCornerType("round");
    obj.rectangle38:setName("rectangle38");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout1);
    obj.edit35:setField("PrecisaoTreino");
    obj.edit35:setLeft(310);
    obj.edit35:setTop(289);
    obj.edit35:setWidth(45);
    obj.edit35:setHeight(24);
    obj.edit35:setTransparent(true);
    obj.edit35:setFontColor("black");
    obj.edit35:setFontSize(17);
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setType("number");
    lfm_setPropAsString(obj.edit35, "fontStyle", "bold");
    obj.edit35:setName("edit35");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout1);
    obj.rectangle39:setLeft(310);
    obj.rectangle39:setTop(319);
    obj.rectangle39:setWidth(45);
    obj.rectangle39:setHeight(24);
    obj.rectangle39:setColor("#F5F5DC");
    obj.rectangle39:setXradius(7);
    obj.rectangle39:setYradius(7);
    obj.rectangle39:setCornerType("round");
    obj.rectangle39:setName("rectangle39");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout1);
    obj.edit36:setField("ForcaDeVontadeTreino");
    obj.edit36:setLeft(310);
    obj.edit36:setTop(319);
    obj.edit36:setWidth(45);
    obj.edit36:setHeight(24);
    obj.edit36:setTransparent(true);
    obj.edit36:setFontColor("black");
    obj.edit36:setFontSize(17);
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setType("number");
    lfm_setPropAsString(obj.edit36, "fontStyle", "bold");
    obj.edit36:setName("edit36");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout1);
    obj.rectangle40:setLeft(370);
    obj.rectangle40:setTop(79);
    obj.rectangle40:setWidth(45);
    obj.rectangle40:setHeight(24);
    obj.rectangle40:setColor("#F5F5DC");
    obj.rectangle40:setXradius(7);
    obj.rectangle40:setYradius(7);
    obj.rectangle40:setCornerType("round");
    obj.rectangle40:setName("rectangle40");

    obj.ForcaTotal = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForcaTotal:setParent(obj.layout1);
    obj.ForcaTotal:setField("ForcaTotal");
    obj.ForcaTotal:setName("ForcaTotal");
    obj.ForcaTotal:setLeft(370);
    obj.ForcaTotal:setTop(79);
    obj.ForcaTotal:setWidth(45);
    obj.ForcaTotal:setHeight(22);
    obj.ForcaTotal:setTransparent(true);
    obj.ForcaTotal:setFontColor("black");
    obj.ForcaTotal:setFontSize(17);
    obj.ForcaTotal:setHorzTextAlign("center");
    obj.ForcaTotal:setType("number");
    lfm_setPropAsString(obj.ForcaTotal, "fontStyle", "bold");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout1);
    obj.rectangle41:setLeft(370);
    obj.rectangle41:setTop(109);
    obj.rectangle41:setWidth(45);
    obj.rectangle41:setHeight(24);
    obj.rectangle41:setColor("#F5F5DC");
    obj.rectangle41:setXradius(7);
    obj.rectangle41:setYradius(7);
    obj.rectangle41:setCornerType("round");
    obj.rectangle41:setName("rectangle41");

    obj.AgilidadeTotal = GUI.fromHandle(_obj_newObject("edit"));
    obj.AgilidadeTotal:setParent(obj.layout1);
    obj.AgilidadeTotal:setField("AgilidadeTotal");
    obj.AgilidadeTotal:setName("AgilidadeTotal");
    obj.AgilidadeTotal:setLeft(370);
    obj.AgilidadeTotal:setTop(109);
    obj.AgilidadeTotal:setWidth(45);
    obj.AgilidadeTotal:setHeight(22);
    obj.AgilidadeTotal:setTransparent(true);
    obj.AgilidadeTotal:setFontColor("black");
    obj.AgilidadeTotal:setFontSize(17);
    obj.AgilidadeTotal:setHorzTextAlign("center");
    obj.AgilidadeTotal:setType("number");
    lfm_setPropAsString(obj.AgilidadeTotal, "fontStyle", "bold");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout1);
    obj.rectangle42:setLeft(370);
    obj.rectangle42:setTop(139);
    obj.rectangle42:setWidth(45);
    obj.rectangle42:setHeight(24);
    obj.rectangle42:setColor("#F5F5DC");
    obj.rectangle42:setXradius(7);
    obj.rectangle42:setYradius(7);
    obj.rectangle42:setCornerType("round");
    obj.rectangle42:setName("rectangle42");

    obj.VigorTotal = GUI.fromHandle(_obj_newObject("edit"));
    obj.VigorTotal:setParent(obj.layout1);
    obj.VigorTotal:setField("VigorTotal");
    obj.VigorTotal:setName("VigorTotal");
    obj.VigorTotal:setLeft(370);
    obj.VigorTotal:setTop(139);
    obj.VigorTotal:setWidth(45);
    obj.VigorTotal:setHeight(22);
    obj.VigorTotal:setTransparent(true);
    obj.VigorTotal:setFontColor("black");
    obj.VigorTotal:setFontSize(17);
    obj.VigorTotal:setHorzTextAlign("center");
    obj.VigorTotal:setType("number");
    lfm_setPropAsString(obj.VigorTotal, "fontStyle", "bold");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout1);
    obj.rectangle43:setLeft(370);
    obj.rectangle43:setTop(169);
    obj.rectangle43:setWidth(45);
    obj.rectangle43:setHeight(24);
    obj.rectangle43:setColor("#F5F5DC");
    obj.rectangle43:setXradius(7);
    obj.rectangle43:setYradius(7);
    obj.rectangle43:setCornerType("round");
    obj.rectangle43:setName("rectangle43");

    obj.CombateTotal = GUI.fromHandle(_obj_newObject("edit"));
    obj.CombateTotal:setParent(obj.layout1);
    obj.CombateTotal:setField("CombateTotal");
    obj.CombateTotal:setName("CombateTotal");
    obj.CombateTotal:setLeft(370);
    obj.CombateTotal:setTop(169);
    obj.CombateTotal:setWidth(45);
    obj.CombateTotal:setHeight(22);
    obj.CombateTotal:setTransparent(true);
    obj.CombateTotal:setFontColor("black");
    obj.CombateTotal:setFontSize(17);
    obj.CombateTotal:setHorzTextAlign("center");
    obj.CombateTotal:setType("number");
    lfm_setPropAsString(obj.CombateTotal, "fontStyle", "bold");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout1);
    obj.rectangle44:setLeft(370);
    obj.rectangle44:setTop(199);
    obj.rectangle44:setWidth(45);
    obj.rectangle44:setHeight(24);
    obj.rectangle44:setColor("#F5F5DC");
    obj.rectangle44:setXradius(7);
    obj.rectangle44:setYradius(7);
    obj.rectangle44:setCornerType("round");
    obj.rectangle44:setName("rectangle44");

    obj.PercepcaoTotal = GUI.fromHandle(_obj_newObject("edit"));
    obj.PercepcaoTotal:setParent(obj.layout1);
    obj.PercepcaoTotal:setField("PercepcaoTotal");
    obj.PercepcaoTotal:setName("PercepcaoTotal");
    obj.PercepcaoTotal:setLeft(370);
    obj.PercepcaoTotal:setTop(199);
    obj.PercepcaoTotal:setWidth(45);
    obj.PercepcaoTotal:setHeight(22);
    obj.PercepcaoTotal:setTransparent(true);
    obj.PercepcaoTotal:setFontColor("black");
    obj.PercepcaoTotal:setFontSize(17);
    obj.PercepcaoTotal:setHorzTextAlign("center");
    obj.PercepcaoTotal:setType("number");
    lfm_setPropAsString(obj.PercepcaoTotal, "fontStyle", "bold");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout1);
    obj.rectangle45:setLeft(370);
    obj.rectangle45:setTop(229);
    obj.rectangle45:setWidth(45);
    obj.rectangle45:setHeight(24);
    obj.rectangle45:setColor("#F5F5DC");
    obj.rectangle45:setXradius(7);
    obj.rectangle45:setYradius(7);
    obj.rectangle45:setCornerType("round");
    obj.rectangle45:setName("rectangle45");

    obj.CarismaTotal = GUI.fromHandle(_obj_newObject("edit"));
    obj.CarismaTotal:setParent(obj.layout1);
    obj.CarismaTotal:setField("CarismaTotal");
    obj.CarismaTotal:setName("CarismaTotal");
    obj.CarismaTotal:setLeft(370);
    obj.CarismaTotal:setTop(229);
    obj.CarismaTotal:setWidth(45);
    obj.CarismaTotal:setHeight(22);
    obj.CarismaTotal:setTransparent(true);
    obj.CarismaTotal:setFontColor("black");
    obj.CarismaTotal:setFontSize(17);
    obj.CarismaTotal:setHorzTextAlign("center");
    obj.CarismaTotal:setType("number");
    lfm_setPropAsString(obj.CarismaTotal, "fontStyle", "bold");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout1);
    obj.rectangle46:setLeft(370);
    obj.rectangle46:setTop(259);
    obj.rectangle46:setWidth(45);
    obj.rectangle46:setHeight(24);
    obj.rectangle46:setColor("#F5F5DC");
    obj.rectangle46:setXradius(7);
    obj.rectangle46:setYradius(7);
    obj.rectangle46:setCornerType("round");
    obj.rectangle46:setName("rectangle46");

    obj.InteligenciaTotal = GUI.fromHandle(_obj_newObject("edit"));
    obj.InteligenciaTotal:setParent(obj.layout1);
    obj.InteligenciaTotal:setField("InteligenciaTotal");
    obj.InteligenciaTotal:setName("InteligenciaTotal");
    obj.InteligenciaTotal:setLeft(370);
    obj.InteligenciaTotal:setTop(259);
    obj.InteligenciaTotal:setWidth(45);
    obj.InteligenciaTotal:setHeight(22);
    obj.InteligenciaTotal:setTransparent(true);
    obj.InteligenciaTotal:setFontColor("black");
    obj.InteligenciaTotal:setFontSize(17);
    obj.InteligenciaTotal:setHorzTextAlign("center");
    obj.InteligenciaTotal:setType("number");
    lfm_setPropAsString(obj.InteligenciaTotal, "fontStyle", "bold");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout1);
    obj.rectangle47:setLeft(370);
    obj.rectangle47:setTop(289);
    obj.rectangle47:setWidth(45);
    obj.rectangle47:setHeight(24);
    obj.rectangle47:setColor("#F5F5DC");
    obj.rectangle47:setXradius(7);
    obj.rectangle47:setYradius(7);
    obj.rectangle47:setCornerType("round");
    obj.rectangle47:setName("rectangle47");

    obj.PrecisaoTotal = GUI.fromHandle(_obj_newObject("edit"));
    obj.PrecisaoTotal:setParent(obj.layout1);
    obj.PrecisaoTotal:setField("PrecisaoTotal");
    obj.PrecisaoTotal:setName("PrecisaoTotal");
    obj.PrecisaoTotal:setLeft(370);
    obj.PrecisaoTotal:setTop(289);
    obj.PrecisaoTotal:setWidth(45);
    obj.PrecisaoTotal:setHeight(22);
    obj.PrecisaoTotal:setTransparent(true);
    obj.PrecisaoTotal:setFontColor("black");
    obj.PrecisaoTotal:setFontSize(17);
    obj.PrecisaoTotal:setHorzTextAlign("center");
    obj.PrecisaoTotal:setType("number");
    lfm_setPropAsString(obj.PrecisaoTotal, "fontStyle", "bold");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout1);
    obj.rectangle48:setLeft(370);
    obj.rectangle48:setTop(319);
    obj.rectangle48:setWidth(45);
    obj.rectangle48:setHeight(24);
    obj.rectangle48:setColor("#F5F5DC");
    obj.rectangle48:setXradius(7);
    obj.rectangle48:setYradius(7);
    obj.rectangle48:setCornerType("round");
    obj.rectangle48:setName("rectangle48");

    obj.ForcaDeVontadeTotal = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForcaDeVontadeTotal:setParent(obj.layout1);
    obj.ForcaDeVontadeTotal:setField("ForcaDeVontadeTotal");
    obj.ForcaDeVontadeTotal:setName("ForcaDeVontadeTotal");
    obj.ForcaDeVontadeTotal:setLeft(370);
    obj.ForcaDeVontadeTotal:setTop(319);
    obj.ForcaDeVontadeTotal:setWidth(45);
    obj.ForcaDeVontadeTotal:setHeight(22);
    obj.ForcaDeVontadeTotal:setTransparent(true);
    obj.ForcaDeVontadeTotal:setFontColor("black");
    obj.ForcaDeVontadeTotal:setFontSize(17);
    obj.ForcaDeVontadeTotal:setHorzTextAlign("center");
    obj.ForcaDeVontadeTotal:setType("number");
    lfm_setPropAsString(obj.ForcaDeVontadeTotal, "fontStyle", "bold");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout1);
    obj.label7:setLeft(15);
    obj.label7:setTop(355);
    obj.label7:setWidth(110);
    obj.label7:setText("Disponíveis:");
    obj.label7:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label7, "fontStyle", "underline");
    obj.label7:setFontSize(12);
    obj.label7:setName("label7");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout1);
    obj.rectangle49:setLeft(83);
    obj.rectangle49:setTop(355);
    obj.rectangle49:setWidth(40);
    obj.rectangle49:setHeight(19);
    obj.rectangle49:setColor("#5F9EA0");
    obj.rectangle49:setXradius(7);
    obj.rectangle49:setYradius(7);
    obj.rectangle49:setCornerType("round");
    obj.rectangle49:setName("rectangle49");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout1);
    obj.label8:setField("PontosDisponiveis");
    obj.label8:setLeft(83);
    obj.label8:setTop(354);
    obj.label8:setWidth(40);
    obj.label8:setHeight(20);
    obj.label8:setFontColor("black");
    obj.label8:setFontSize(15);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout1);
    obj.label9:setLeft(131);
    obj.label9:setTop(355);
    obj.label9:setWidth(110);
    obj.label9:setText("Distribuídos:");
    obj.label9:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label9, "fontStyle", "underline");
    obj.label9:setFontSize(12);
    obj.label9:setName("label9");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout1);
    obj.rectangle50:setLeft(202);
    obj.rectangle50:setTop(355);
    obj.rectangle50:setWidth(40);
    obj.rectangle50:setHeight(19);
    obj.rectangle50:setColor("#5F9EA0");
    obj.rectangle50:setXradius(7);
    obj.rectangle50:setYradius(7);
    obj.rectangle50:setCornerType("round");
    obj.rectangle50:setName("rectangle50");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout1);
    obj.label10:setField("PontosDistribuidos");
    obj.label10:setLeft(202);
    obj.label10:setTop(354);
    obj.label10:setWidth(40);
    obj.label10:setHeight(20);
    obj.label10:setFontColor("black");
    obj.label10:setFontSize(15);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout1);
    obj.label11:setLeft(249);
    obj.label11:setTop(355);
    obj.label11:setWidth(110);
    obj.label11:setText("Outros:");
    obj.label11:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label11, "fontStyle", "underline");
    obj.label11:setFontSize(12);
    obj.label11:setName("label11");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout1);
    obj.rectangle51:setLeft(293);
    obj.rectangle51:setTop(355);
    obj.rectangle51:setWidth(40);
    obj.rectangle51:setHeight(19);
    obj.rectangle51:setColor("#5F9EA0");
    obj.rectangle51:setXradius(7);
    obj.rectangle51:setYradius(7);
    obj.rectangle51:setCornerType("round");
    obj.rectangle51:setName("rectangle51");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout1);
    obj.label12:setField("PontosOutros");
    obj.label12:setLeft(293);
    obj.label12:setTop(354);
    obj.label12:setWidth(40);
    obj.label12:setHeight(20);
    obj.label12:setFontColor("black");
    obj.label12:setFontSize(15);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout1);
    obj.label13:setLeft(341);
    obj.label13:setTop(355);
    obj.label13:setWidth(110);
    obj.label13:setText("Total:");
    obj.label13:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label13, "fontStyle", "underline");
    obj.label13:setFontSize(12);
    obj.label13:setName("label13");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout1);
    obj.rectangle52:setLeft(375);
    obj.rectangle52:setTop(355);
    obj.rectangle52:setWidth(40);
    obj.rectangle52:setHeight(19);
    obj.rectangle52:setColor("#5F9EA0");
    obj.rectangle52:setXradius(7);
    obj.rectangle52:setYradius(7);
    obj.rectangle52:setCornerType("round");
    obj.rectangle52:setName("rectangle52");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout1);
    obj.label14:setField("PontosTotais");
    obj.label14:setLeft(375);
    obj.label14:setTop(354);
    obj.label14:setWidth(40);
    obj.label14:setHeight(20);
    obj.label14:setFontColor("black");
    obj.label14:setFontSize(15);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.DefButton = GUI.fromHandle(_obj_newObject("button"));
    obj.DefButton:setParent(obj.layout1);
    obj.DefButton:setName("DefButton");
    obj.DefButton:setLeft(10);
    obj.DefButton:setTop(386);
    obj.DefButton:setText("Defesa");
    obj.DefButton:setWidth(110);

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout1);
    obj.rectangle53:setLeft(130);
    obj.rectangle53:setTop(385);
    obj.rectangle53:setWidth(45);
    obj.rectangle53:setHeight(24);
    obj.rectangle53:setColor("#5F9EA0");
    obj.rectangle53:setXradius(7);
    obj.rectangle53:setYradius(7);
    obj.rectangle53:setCornerType("round");
    obj.rectangle53:setName("rectangle53");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout1);
    obj.label15:setField("Defesa");
    obj.label15:setLeft(130);
    obj.label15:setTop(386);
    obj.label15:setWidth(45);
    obj.label15:setHeight(22);
    obj.label15:setFontColor("black");
    obj.label15:setFontSize(17);
    obj.label15:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label15, "fontStyle", "bold");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout1);
    obj.label16:setLeft(175);
    obj.label16:setTop(384);
    obj.label16:setWidth(250);
    obj.label16:setHeight(24);
    obj.label16:setText(" = 1d20 + Vigor/2");
    obj.label16:setFontColor("#D1B27E");
    lfm_setPropAsString(obj.label16, "fontStyle", "bold");
    obj.label16:setFontSize(15);
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout1);
    obj.label17:setLeft(10);
    obj.label17:setTop(425);
    obj.label17:setWidth(100);
    obj.label17:setHeight(24);
    obj.label17:setText("HP:");
    obj.label17:setFontColor("#D70000");
    obj.label17:setFontSize(13);
    lfm_setPropAsString(obj.label17, "fontStyle", "bold");
    obj.label17:setName("label17");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout1);
    obj.rectangle54:setLeft(75);
    obj.rectangle54:setTop(426);
    obj.rectangle54:setWidth(45);
    obj.rectangle54:setHeight(20);
    obj.rectangle54:setColor("#5F9EA0");
    obj.rectangle54:setXradius(7);
    obj.rectangle54:setYradius(7);
    obj.rectangle54:setCornerType("round");
    obj.rectangle54:setName("rectangle54");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout1);
    obj.label18:setField("hp");
    obj.label18:setLeft(75);
    obj.label18:setTop(425);
    obj.label18:setWidth(45);
    obj.label18:setHeight(20);
    obj.label18:setText("");
    obj.label18:setFontColor("black");
    obj.label18:setFontSize(15);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout1);
    obj.label19:setLeft(120);
    obj.label19:setTop(425);
    obj.label19:setWidth(300);
    obj.label19:setHeight(24);
    obj.label19:setText(" = (Vigor X 7) + 50 | A cada nv. = +5");
    obj.label19:setFontColor("#D1B27E");
    lfm_setPropAsString(obj.label19, "fontStyle", "bold");
    obj.label19:setFontSize(15);
    obj.label19:setName("label19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout1);
    obj.label20:setLeft(10);
    obj.label20:setTop(449);
    obj.label20:setWidth(100);
    obj.label20:setHeight(24);
    obj.label20:setText("ENERGIA:");
    obj.label20:setFontColor("#0080FF");
    obj.label20:setFontSize(13);
    lfm_setPropAsString(obj.label20, "fontStyle", "bold");
    obj.label20:setName("label20");

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout1);
    obj.rectangle55:setLeft(75);
    obj.rectangle55:setTop(450);
    obj.rectangle55:setWidth(45);
    obj.rectangle55:setHeight(20);
    obj.rectangle55:setColor("#5F9EA0");
    obj.rectangle55:setXradius(7);
    obj.rectangle55:setYradius(7);
    obj.rectangle55:setCornerType("round");
    obj.rectangle55:setName("rectangle55");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout1);
    obj.label21:setField("eng");
    obj.label21:setLeft(75);
    obj.label21:setTop(450);
    obj.label21:setWidth(45);
    obj.label21:setHeight(20);
    obj.label21:setText("");
    obj.label21:setFontColor("black");
    obj.label21:setFontSize(15);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout1);
    obj.label22:setLeft(120);
    obj.label22:setTop(448);
    obj.label22:setWidth(300);
    obj.label22:setHeight(24);
    obj.label22:setText(" = (Vigor X 7) + 62 | A cada nv. = +5");
    obj.label22:setFontColor("#D1B27E");
    lfm_setPropAsString(obj.label22, "fontStyle", "bold");
    obj.label22:setFontSize(15);
    obj.label22:setName("label22");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout1);
    obj.label23:setLeft(10);
    obj.label23:setTop(473);
    obj.label23:setWidth(100);
    obj.label23:setHeight(24);
    obj.label23:setText("HAKI:");
    obj.label23:setFontColor("#FAB609");
    obj.label23:setFontSize(13);
    lfm_setPropAsString(obj.label23, "fontStyle", "bold");
    obj.label23:setName("label23");

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout1);
    obj.rectangle56:setLeft(75);
    obj.rectangle56:setTop(474);
    obj.rectangle56:setWidth(45);
    obj.rectangle56:setHeight(20);
    obj.rectangle56:setColor("#5F9EA0");
    obj.rectangle56:setXradius(7);
    obj.rectangle56:setYradius(7);
    obj.rectangle56:setCornerType("round");
    obj.rectangle56:setName("rectangle56");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout1);
    obj.label24:setField("haki");
    obj.label24:setLeft(75);
    obj.label24:setTop(474);
    obj.label24:setWidth(45);
    obj.label24:setHeight(20);
    obj.label24:setText("");
    obj.label24:setFontColor("black");
    obj.label24:setFontSize(15);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout1);
    obj.label25:setLeft(120);
    obj.label25:setTop(472);
    obj.label25:setWidth(300);
    obj.label25:setHeight(24);
    obj.label25:setText(" = FDV x 5 (apartir de FDV = 20)");
    obj.label25:setFontColor("#D1B27E");
    lfm_setPropAsString(obj.label25, "fontStyle", "bold");
    obj.label25:setFontSize(15);
    obj.label25:setName("label25");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj);
    obj.layout2:setLeft(455);
    obj.layout2:setTop(12);
    obj.layout2:setWidth(450);
    obj.layout2:setHeight(525);
    obj.layout2:setName("layout2");

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout2);
    obj.rectangle57:setLeft(0);
    obj.rectangle57:setTop(0);
    obj.rectangle57:setWidth(250);
    obj.rectangle57:setHeight(525);
    obj.rectangle57:setColor("#4169E1");
    obj.rectangle57:setName("rectangle57");

    obj.rectangle58 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout2);
    obj.rectangle58:setLeft(2);
    obj.rectangle58:setTop(2);
    obj.rectangle58:setWidth(246);
    obj.rectangle58:setHeight(521);
    obj.rectangle58:setColor("black");
    obj.rectangle58:setName("rectangle58");

    obj.rectangle59 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout2);
    obj.rectangle59:setLeft(12);
    obj.rectangle59:setTop(19);
    obj.rectangle59:setWidth(73);
    obj.rectangle59:setHeight(73);
    obj.rectangle59:setColor("#F5F5DC");
    obj.rectangle59:setName("rectangle59");

    obj.rectangle60 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout2);
    obj.rectangle60:setLeft(13);
    obj.rectangle60:setTop(20);
    obj.rectangle60:setWidth(71);
    obj.rectangle60:setHeight(71);
    obj.rectangle60:setColor("black");
    obj.rectangle60:setName("rectangle60");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.layout2);
    obj.image1:setField("FotoChapeu");
    obj.image1:setLeft(13);
    obj.image1:setTop(20);
    obj.image1:setWidth(71);
    obj.image1:setHeight(71);
    obj.image1:setName("image1");

    obj.rectangle61 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout2);
    obj.rectangle61:setLeft(12);
    obj.rectangle61:setTop(102);
    obj.rectangle61:setWidth(73);
    obj.rectangle61:setHeight(73);
    obj.rectangle61:setColor("#F5F5DC");
    obj.rectangle61:setName("rectangle61");

    obj.rectangle62 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout2);
    obj.rectangle62:setLeft(13);
    obj.rectangle62:setTop(103);
    obj.rectangle62:setWidth(71);
    obj.rectangle62:setHeight(71);
    obj.rectangle62:setColor("black");
    obj.rectangle62:setName("rectangle62");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout2);
    obj.image2:setField("FotoColar");
    obj.image2:setLeft(13);
    obj.image2:setTop(103);
    obj.image2:setWidth(71);
    obj.image2:setHeight(71);
    obj.image2:setName("image2");

    obj.rectangle63 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout2);
    obj.rectangle63:setLeft(12);
    obj.rectangle63:setTop(185);
    obj.rectangle63:setWidth(73);
    obj.rectangle63:setHeight(73);
    obj.rectangle63:setColor("#F5F5DC");
    obj.rectangle63:setName("rectangle63");

    obj.rectangle64 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout2);
    obj.rectangle64:setLeft(13);
    obj.rectangle64:setTop(186);
    obj.rectangle64:setWidth(71);
    obj.rectangle64:setHeight(71);
    obj.rectangle64:setColor("black");
    obj.rectangle64:setName("rectangle64");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout2);
    obj.image3:setField("FotoRoupa");
    obj.image3:setLeft(13);
    obj.image3:setTop(186);
    obj.image3:setWidth(71);
    obj.image3:setHeight(71);
    obj.image3:setName("image3");

    obj.rectangle65 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout2);
    obj.rectangle65:setLeft(12);
    obj.rectangle65:setTop(268);
    obj.rectangle65:setWidth(73);
    obj.rectangle65:setHeight(73);
    obj.rectangle65:setColor("#F5F5DC");
    obj.rectangle65:setName("rectangle65");

    obj.rectangle66 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout2);
    obj.rectangle66:setLeft(13);
    obj.rectangle66:setTop(269);
    obj.rectangle66:setWidth(71);
    obj.rectangle66:setHeight(71);
    obj.rectangle66:setColor("black");
    obj.rectangle66:setName("rectangle66");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout2);
    obj.image4:setField("FotoMaoPrimaria");
    obj.image4:setLeft(13);
    obj.image4:setTop(269);
    obj.image4:setWidth(71);
    obj.image4:setHeight(71);
    obj.image4:setName("image4");

    obj.rectangle67 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout2);
    obj.rectangle67:setLeft(12);
    obj.rectangle67:setTop(351);
    obj.rectangle67:setWidth(73);
    obj.rectangle67:setHeight(73);
    obj.rectangle67:setColor("#F5F5DC");
    obj.rectangle67:setName("rectangle67");

    obj.rectangle68 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout2);
    obj.rectangle68:setLeft(13);
    obj.rectangle68:setTop(352);
    obj.rectangle68:setWidth(71);
    obj.rectangle68:setHeight(71);
    obj.rectangle68:setColor("black");
    obj.rectangle68:setName("rectangle68");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout2);
    obj.image5:setField("FotoCalca");
    obj.image5:setLeft(13);
    obj.image5:setTop(352);
    obj.image5:setWidth(71);
    obj.image5:setHeight(71);
    obj.image5:setName("image5");

    obj.rectangle69 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.layout2);
    obj.rectangle69:setLeft(12);
    obj.rectangle69:setTop(434);
    obj.rectangle69:setWidth(73);
    obj.rectangle69:setHeight(73);
    obj.rectangle69:setColor("#F5F5DC");
    obj.rectangle69:setName("rectangle69");

    obj.rectangle70 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout2);
    obj.rectangle70:setLeft(13);
    obj.rectangle70:setTop(435);
    obj.rectangle70:setWidth(71);
    obj.rectangle70:setHeight(71);
    obj.rectangle70:setColor("black");
    obj.rectangle70:setName("rectangle70");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.layout2);
    obj.image6:setField("FotoBota");
    obj.image6:setLeft(13);
    obj.image6:setTop(435);
    obj.image6:setWidth(71);
    obj.image6:setHeight(71);
    obj.image6:setName("image6");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("ForcaBase");
    obj.dataLink1:setDefaultValue("1");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("AgilidadeBase");
    obj.dataLink2:setDefaultValue("1");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setField("VigorBase");
    obj.dataLink3:setDefaultValue("1");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setField("CombateBase");
    obj.dataLink4:setDefaultValue("1");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setField("PercepcaoBase");
    obj.dataLink5:setDefaultValue("1");
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setField("CarismaBase");
    obj.dataLink6:setDefaultValue("1");
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj);
    obj.dataLink7:setField("InteligenciaBase");
    obj.dataLink7:setDefaultValue("1");
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj);
    obj.dataLink8:setField("PrecisaoBase");
    obj.dataLink8:setDefaultValue("1");
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj);
    obj.dataLink9:setField("ForcaDeVontadeBase");
    obj.dataLink9:setDefaultValue("1");
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj);
    obj.dataLink10:setField("ForcaPassivo");
    obj.dataLink10:setDefaultValue("0");
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj);
    obj.dataLink11:setField("AgilidadePassivo");
    obj.dataLink11:setDefaultValue("0");
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj);
    obj.dataLink12:setField("VigorPassivo");
    obj.dataLink12:setDefaultValue("0");
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj);
    obj.dataLink13:setField("CombatePassivo");
    obj.dataLink13:setDefaultValue("0");
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj);
    obj.dataLink14:setField("PercepcaoPassivo");
    obj.dataLink14:setDefaultValue("0");
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj);
    obj.dataLink15:setField("CarismaPassivo");
    obj.dataLink15:setDefaultValue("0");
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj);
    obj.dataLink16:setField("InteligenciaPassivo");
    obj.dataLink16:setDefaultValue("0");
    obj.dataLink16:setName("dataLink16");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj);
    obj.dataLink17:setField("PrecisaoPassivo");
    obj.dataLink17:setDefaultValue("0");
    obj.dataLink17:setName("dataLink17");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj);
    obj.dataLink18:setField("ForcaDeVontadePassivo");
    obj.dataLink18:setDefaultValue("0");
    obj.dataLink18:setName("dataLink18");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj);
    obj.dataLink19:setField("ForcaEquips");
    obj.dataLink19:setDefaultValue("0");
    obj.dataLink19:setName("dataLink19");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj);
    obj.dataLink20:setField("AgilidadeEquips");
    obj.dataLink20:setDefaultValue("0");
    obj.dataLink20:setName("dataLink20");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj);
    obj.dataLink21:setField("VigorEquips");
    obj.dataLink21:setDefaultValue("0");
    obj.dataLink21:setName("dataLink21");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj);
    obj.dataLink22:setField("CombateEquips");
    obj.dataLink22:setDefaultValue("0");
    obj.dataLink22:setName("dataLink22");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj);
    obj.dataLink23:setField("PercepcaoEquips");
    obj.dataLink23:setDefaultValue("0");
    obj.dataLink23:setName("dataLink23");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj);
    obj.dataLink24:setField("CarismaEquips");
    obj.dataLink24:setDefaultValue("0");
    obj.dataLink24:setName("dataLink24");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj);
    obj.dataLink25:setField("InteligenciaEquips");
    obj.dataLink25:setDefaultValue("0");
    obj.dataLink25:setName("dataLink25");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj);
    obj.dataLink26:setField("PrecisaoEquips");
    obj.dataLink26:setDefaultValue("0");
    obj.dataLink26:setName("dataLink26");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj);
    obj.dataLink27:setField("ForcaDeVontadeEquips");
    obj.dataLink27:setDefaultValue("0");
    obj.dataLink27:setName("dataLink27");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj);
    obj.dataLink28:setField("ForcaTreino");
    obj.dataLink28:setDefaultValue("0");
    obj.dataLink28:setName("dataLink28");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj);
    obj.dataLink29:setField("AgilidadeTreino");
    obj.dataLink29:setDefaultValue("0");
    obj.dataLink29:setName("dataLink29");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj);
    obj.dataLink30:setField("VigorTreino");
    obj.dataLink30:setDefaultValue("0");
    obj.dataLink30:setName("dataLink30");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj);
    obj.dataLink31:setField("CombateTreino");
    obj.dataLink31:setDefaultValue("0");
    obj.dataLink31:setName("dataLink31");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj);
    obj.dataLink32:setField("PercepcaoTreino");
    obj.dataLink32:setDefaultValue("0");
    obj.dataLink32:setName("dataLink32");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj);
    obj.dataLink33:setField("CarismaTreino");
    obj.dataLink33:setDefaultValue("0");
    obj.dataLink33:setName("dataLink33");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj);
    obj.dataLink34:setField("InteligenciaTreino");
    obj.dataLink34:setDefaultValue("0");
    obj.dataLink34:setName("dataLink34");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj);
    obj.dataLink35:setField("PrecisaoTreino");
    obj.dataLink35:setDefaultValue("0");
    obj.dataLink35:setName("dataLink35");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj);
    obj.dataLink36:setField("PontosDisponiveis");
    obj.dataLink36:setDefaultValue("16");
    obj.dataLink36:setName("dataLink36");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj);
    obj.dataLink37:setField("PontosDistribuidos");
    obj.dataLink37:setDefaultValue("0");
    obj.dataLink37:setName("dataLink37");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj);
    obj.dataLink38:setField("PontosOutros");
    obj.dataLink38:setDefaultValue("0");
    obj.dataLink38:setName("dataLink38");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj);
    obj.dataLink39:setField("PontosTotais");
    obj.dataLink39:setDefaultValue("0");
    obj.dataLink39:setName("dataLink39");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj);
    obj.dataLink40:setField("FotoChapeu");
    obj.dataLink40:setDefaultValue("https://blob.firecast.com.br/blobs/BSEWIEVG_3735362/Chapeu.png");
    obj.dataLink40:setName("dataLink40");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj);
    obj.dataLink41:setField("FotoColar");
    obj.dataLink41:setDefaultValue("https://blob.firecast.com.br/blobs/ELGUBICD_3735361/Colar.png");
    obj.dataLink41:setName("dataLink41");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj);
    obj.dataLink42:setField("FotoRoupa");
    obj.dataLink42:setDefaultValue("https://blob.firecast.com.br/blobs/SIRPGIRT_3735359/Ropa.png");
    obj.dataLink42:setName("dataLink42");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj);
    obj.dataLink43:setField("FotoMaoPrimaria");
    obj.dataLink43:setDefaultValue("https://blob.firecast.com.br/blobs/SMOQJGJO_3735363/M_o.png");
    obj.dataLink43:setName("dataLink43");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj);
    obj.dataLink44:setField("FotoCalca");
    obj.dataLink44:setDefaultValue("https://blob.firecast.com.br/blobs/TQPAWOQT_3735360/Car_a.png");
    obj.dataLink44:setName("dataLink44");

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj);
    obj.dataLink45:setField("FotoBota");
    obj.dataLink45:setDefaultValue("0");
    obj.dataLink45:setName("dataLink45");

    obj._e_event0 = obj.ForcaButton:addEventListener("onMouseEnter",
        function ()
            self.ForcaButton.text = 'Rolar FOR'
        end);

    obj._e_event1 = obj.ForcaButton:addEventListener("onMouseLeave",
        function ()
            self.ForcaButton.text = 'Força'
        end);

    obj._e_event2 = obj.ForcaButton:addEventListener("onClick",
        function (event)
            RolarAtributo('Forca')
        end);

    obj._e_event3 = obj.AgilButton:addEventListener("onMouseEnter",
        function ()
            self.AgilButton.text = 'Rolar AGI'
        end);

    obj._e_event4 = obj.AgilButton:addEventListener("onMouseLeave",
        function ()
            self.AgilButton.text = 'Agilidade'
        end);

    obj._e_event5 = obj.AgilButton:addEventListener("onClick",
        function (event)
            RolarAtributo('Agilidade')
        end);

    obj._e_event6 = obj.VigorButton:addEventListener("onMouseEnter",
        function ()
            self.VigorButton.text = 'Rolar VIG'
        end);

    obj._e_event7 = obj.VigorButton:addEventListener("onMouseLeave",
        function ()
            self.VigorButton.text = 'Vigor'
        end);

    obj._e_event8 = obj.VigorButton:addEventListener("onClick",
        function (event)
            RolarAtributo('Vigor')
        end);

    obj._e_event9 = obj.ComButton:addEventListener("onMouseEnter",
        function ()
            self.ComButton.text = 'Rolar COM'
        end);

    obj._e_event10 = obj.ComButton:addEventListener("onMouseLeave",
        function ()
            self.ComButton.text = 'Combate'
        end);

    obj._e_event11 = obj.ComButton:addEventListener("onClick",
        function (event)
            RolarAtributo('Combate')
        end);

    obj._e_event12 = obj.PercepButton:addEventListener("onMouseEnter",
        function ()
            self.PercepButton.text = 'Rolar PER'
        end);

    obj._e_event13 = obj.PercepButton:addEventListener("onMouseLeave",
        function ()
            self.PercepButton.text = 'Percepção'
        end);

    obj._e_event14 = obj.PercepButton:addEventListener("onClick",
        function (event)
            RolarAtributo('Percepcao')
        end);

    obj._e_event15 = obj.CarisButton:addEventListener("onMouseEnter",
        function ()
            self.CarisButton.text = 'Rolar CAR'
        end);

    obj._e_event16 = obj.CarisButton:addEventListener("onMouseLeave",
        function ()
            self.CarisButton.text = 'Carisma'
        end);

    obj._e_event17 = obj.CarisButton:addEventListener("onClick",
        function (event)
            RolarAtributo('Carisma')
        end);

    obj._e_event18 = obj.IntButton:addEventListener("onMouseEnter",
        function ()
            self.IntButton.text = 'Rolar INT'
        end);

    obj._e_event19 = obj.IntButton:addEventListener("onMouseLeave",
        function ()
            self.IntButton.text = 'Intelegência'
        end);

    obj._e_event20 = obj.IntButton:addEventListener("onClick",
        function (event)
            RolarAtributo('Inteligencia')
        end);

    obj._e_event21 = obj.PrecButton:addEventListener("onMouseEnter",
        function ()
            self.PrecButton.text = 'Rolar PRE'
        end);

    obj._e_event22 = obj.PrecButton:addEventListener("onMouseLeave",
        function ()
            self.PrecButton.text = 'Precisão'
        end);

    obj._e_event23 = obj.PrecButton:addEventListener("onClick",
        function (event)
            RolarAtributo('Precisao')
        end);

    obj._e_event24 = obj.ForDVonButton:addEventListener("onMouseEnter",
        function ()
            self.ForDVonButton.text = 'Rolar FDV'
        end);

    obj._e_event25 = obj.ForDVonButton:addEventListener("onMouseLeave",
        function ()
            self.ForDVonButton.text = 'Força de Vontade'
        end);

    obj._e_event26 = obj.ForDVonButton:addEventListener("onClick",
        function (event)
            RolarAtributo('ForcaDeVontade')
        end);

    obj._e_event27 = obj.DefButton:addEventListener("onMouseEnter",
        function ()
            self.DefButton.text = 'Rolar Defesa'
        end);

    obj._e_event28 = obj.DefButton:addEventListener("onMouseLeave",
        function ()
            self.DefButton.text = 'Defesa'
        end);

    obj._e_event29 = obj.DefButton:addEventListener("onClick",
        function (event)
            RolarAtributo('Defesa')
        end);

    obj._e_event30 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaBase == "" then sheet.ForcaBase = 1 end
            		AlterarValorTotal("Forca")
        end);

    obj._e_event31 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.AgilidadeBase == "" then sheet.AgilidadeBase = 1 end
            			AlterarValorTotal("Agilidade")
        end);

    obj._e_event32 = obj.dataLink3:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.VigorBase == "" then sheet.VigorBase = 1 end
            			AlterarValorTotal("Vigor")
        end);

    obj._e_event33 = obj.dataLink4:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CombateBase == "" then sheet.CombateBase = 1 end
            			AlterarValorTotal("Combate")
        end);

    obj._e_event34 = obj.dataLink5:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PercepcaoBase == "" then sheet.PercepcaoBase = 1 end
            			AlterarValorTotal("Percepcao")
        end);

    obj._e_event35 = obj.dataLink6:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CarismaBase == "" then sheet.CarismaBase = 1 end
            			AlterarValorTotal("Carisma")
        end);

    obj._e_event36 = obj.dataLink7:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.InteligenciaBase == "" then sheet.InteligenciaBase = 1 end
            			AlterarValorTotal("Inteligencia")
        end);

    obj._e_event37 = obj.dataLink8:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PrecisaoBase == "" then sheet.PrecisaoBase = 1 end
            			AlterarValorTotal("Precisao")
        end);

    obj._e_event38 = obj.dataLink9:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaDeVontadeBase == "" then sheet.ForcaDeVontadeBase = 1 end
            			AlterarValorTotal("ForcaDeVontade")
        end);

    obj._e_event39 = obj.dataLink10:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaPassivo == "" then sheet.ForcaPassivo = 0 end
            			AlterarValorTotal("Forca")
        end);

    obj._e_event40 = obj.dataLink11:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.AgilidadePassivo == "" then sheet.AgilidadePassivo = 0 end
            			AlterarValorTotal("Agilidade")
        end);

    obj._e_event41 = obj.dataLink12:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.VigorPassivo == "" then sheet.VigorPassivo = 0 end
            			AlterarValorTotal("Vigor")
        end);

    obj._e_event42 = obj.dataLink13:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CombatePassivo == "" then sheet.CombatePassivo = 0 end
            			AlterarValorTotal("Combate")
        end);

    obj._e_event43 = obj.dataLink14:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PercepcaoPassivo == "" then sheet.PercepcaoPassivo = 0 end
            			AlterarValorTotal("Percepcao")
        end);

    obj._e_event44 = obj.dataLink15:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CarismaPassivo == "" then sheet.CarismaPassivo = 0 end
            			AlterarValorTotal("Carisma")
        end);

    obj._e_event45 = obj.dataLink16:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.InteligenciaPassivo == "" then sheet.InteligenciaPassivo = 0 end
            			AlterarValorTotal("Inteligencia")
        end);

    obj._e_event46 = obj.dataLink17:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PrecisaoPassivo == "" then sheet.PrecisaoPassivo = 0 end
            			AlterarValorTotal("Precisao")
        end);

    obj._e_event47 = obj.dataLink18:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaDeVontadePassivo == "" then sheet.ForcaDeVontadePassivo = 0 end
            			AlterarValorTotal("ForcaDeVontade")
        end);

    obj._e_event48 = obj.dataLink19:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaEquips == "" then sheet.ForcaEquips = 0 end
            			AlterarValorTotal("Forca")
        end);

    obj._e_event49 = obj.dataLink20:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.AgilidadeEquips == "" then sheet.AgilidadeEquips = 0 end
            			AlterarValorTotal("Agilidade")
        end);

    obj._e_event50 = obj.dataLink21:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.VigorEquips == "" then sheet.VigorEquips = 0 end
            			AlterarValorTotal("Vigor")
        end);

    obj._e_event51 = obj.dataLink22:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CombateEquips == "" then sheet.CombateEquips = 0 end
            			AlterarValorTotal("Combate")
        end);

    obj._e_event52 = obj.dataLink23:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PercepcaoEquips == "" then sheet.PercepcaoEquips = 0 end
            			AlterarValorTotal("Percepcao")
        end);

    obj._e_event53 = obj.dataLink24:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CarismaEquips == "" then sheet.CarismaEquips = 0 end
            			AlterarValorTotal("Carisma")
        end);

    obj._e_event54 = obj.dataLink25:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.InteligenciaEquips == "" then sheet.InteligenciaEquips = 0 end
            			AlterarValorTotal("Inteligencia")
        end);

    obj._e_event55 = obj.dataLink26:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PrecisaoEquips == "" then sheet.PrecisaoEquips = 0 end
            			AlterarValorTotal("Precisao")
        end);

    obj._e_event56 = obj.dataLink27:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaDeVontadeEquips == "" then sheet.ForcaDeVontadeEquips = 0 end
            			AlterarValorTotal("ForcaDeVontade")
        end);

    obj._e_event57 = obj.dataLink28:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaTreino == "" then sheet.ForcaTreino = 0 end
            			AlterarValorTotal("Forca")
        end);

    obj._e_event58 = obj.dataLink29:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.AgilidadeTreino == "" then sheet.AgilidadeTreino = 0 end
            			AlterarValorTotal("Agilidade")
        end);

    obj._e_event59 = obj.dataLink30:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.VigorTreino == "" then sheet.VigorTreino = 0 end
            			AlterarValorTotal("Vigor")
        end);

    obj._e_event60 = obj.dataLink31:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CombateTreino == "" then sheet.CombateTreino = 0 end
            			AlterarValorTotal("Combate")
        end);

    obj._e_event61 = obj.dataLink32:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PercepcaoTreino == "" then sheet.PercepcaoTreino = 0 end
            			AlterarValorTotal("Percepcao")
        end);

    obj._e_event62 = obj.dataLink33:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CarismaTreino == "" then sheet.CarismaTreino = 0 end
            			AlterarValorTotal("Carisma")
        end);

    obj._e_event63 = obj.dataLink34:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.InteligenciaTreino == "" then sheet.InteligenciaTreino = 0 end
            			AlterarValorTotal("Inteligencia")
        end);

    obj._e_event64 = obj.dataLink35:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PrecisaoTreino == "" then sheet.PrecisaoTreino = 0 end
            			AlterarValorTotal("Precisao")
        end);

    obj._e_event65 = obj.dataLink40:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoChapeu == nil then sheet.FotoChapeu = "https://blob.firecast.com.br/blobs/BSEWIEVG_3735362/Chapeu.png" end
        end);

    obj._e_event66 = obj.dataLink41:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoColar == nil then sheet.FotoColar = "https://blob.firecast.com.br/blobs/ELGUBICD_3735361/Colar.png" end
        end);

    obj._e_event67 = obj.dataLink42:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoRoupa == nil then sheet.FotoRoupa = "https://blob.firecast.com.br/blobs/SIRPGIRT_3735359/Ropa.png" end
        end);

    obj._e_event68 = obj.dataLink43:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoMaoPrimaria == nil then sheet.FotoMaoPrimaria = "https://blob.firecast.com.br/blobs/SMOQJGJO_3735363/M_o.png" end
        end);

    obj._e_event69 = obj.dataLink44:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoCalca == nil then sheet.FotoCalca = "https://blob.firecast.com.br/blobs/TQPAWOQT_3735360/Car_a.png" end
        end);

    obj._e_event70 = obj.dataLink45:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoBota == nil then sheet.FotoBota = "https://blob.firecast.com.br/blobs/OHNVCDNS_3735367/Bota.png" end
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event70);
        __o_rrpgObjs.removeEventListenerById(self._e_event69);
        __o_rrpgObjs.removeEventListenerById(self._e_event68);
        __o_rrpgObjs.removeEventListenerById(self._e_event67);
        __o_rrpgObjs.removeEventListenerById(self._e_event66);
        __o_rrpgObjs.removeEventListenerById(self._e_event65);
        __o_rrpgObjs.removeEventListenerById(self._e_event64);
        __o_rrpgObjs.removeEventListenerById(self._e_event63);
        __o_rrpgObjs.removeEventListenerById(self._e_event62);
        __o_rrpgObjs.removeEventListenerById(self._e_event61);
        __o_rrpgObjs.removeEventListenerById(self._e_event60);
        __o_rrpgObjs.removeEventListenerById(self._e_event59);
        __o_rrpgObjs.removeEventListenerById(self._e_event58);
        __o_rrpgObjs.removeEventListenerById(self._e_event57);
        __o_rrpgObjs.removeEventListenerById(self._e_event56);
        __o_rrpgObjs.removeEventListenerById(self._e_event55);
        __o_rrpgObjs.removeEventListenerById(self._e_event54);
        __o_rrpgObjs.removeEventListenerById(self._e_event53);
        __o_rrpgObjs.removeEventListenerById(self._e_event52);
        __o_rrpgObjs.removeEventListenerById(self._e_event51);
        __o_rrpgObjs.removeEventListenerById(self._e_event50);
        __o_rrpgObjs.removeEventListenerById(self._e_event49);
        __o_rrpgObjs.removeEventListenerById(self._e_event48);
        __o_rrpgObjs.removeEventListenerById(self._e_event47);
        __o_rrpgObjs.removeEventListenerById(self._e_event46);
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
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

        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.ForcaDeVontadeTotal ~= nil then self.ForcaDeVontadeTotal:destroy(); self.ForcaDeVontadeTotal = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.DefButton ~= nil then self.DefButton:destroy(); self.DefButton = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.PrecButton ~= nil then self.PrecButton:destroy(); self.PrecButton = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.VigorButton ~= nil then self.VigorButton:destroy(); self.VigorButton = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.PercepcaoTotal ~= nil then self.PercepcaoTotal:destroy(); self.PercepcaoTotal = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.AgilidadeTotal ~= nil then self.AgilidadeTotal:destroy(); self.AgilidadeTotal = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.ForcaTotal ~= nil then self.ForcaTotal:destroy(); self.ForcaTotal = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.ComButton ~= nil then self.ComButton:destroy(); self.ComButton = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.CarismaTotal ~= nil then self.CarismaTotal:destroy(); self.CarismaTotal = nil; end;
        if self.PrecisaoTotal ~= nil then self.PrecisaoTotal:destroy(); self.PrecisaoTotal = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.ForDVonButton ~= nil then self.ForDVonButton:destroy(); self.ForDVonButton = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.ForcaButton ~= nil then self.ForcaButton:destroy(); self.ForcaButton = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.InteligenciaTotal ~= nil then self.InteligenciaTotal:destroy(); self.InteligenciaTotal = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.PercepButton ~= nil then self.PercepButton:destroy(); self.PercepButton = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.VigorTotal ~= nil then self.VigorTotal:destroy(); self.VigorTotal = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.IntButton ~= nil then self.IntButton:destroy(); self.IntButton = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.CombateTotal ~= nil then self.CombateTotal:destroy(); self.CombateTotal = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.CarisButton ~= nil then self.CarisButton:destroy(); self.CarisButton = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.AgilButton ~= nil then self.AgilButton:destroy(); self.AgilButton = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newAtributos()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_Atributos();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _Atributos = {
    newEditor = newAtributos, 
    new = newAtributos, 
    name = "Atributos", 
    dataType = "", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "Brincadeiras Em Alto Mar", 
    description=""};

Atributos = _Atributos;
Firecast.registrarForm(_Atributos);

return _Atributos;
