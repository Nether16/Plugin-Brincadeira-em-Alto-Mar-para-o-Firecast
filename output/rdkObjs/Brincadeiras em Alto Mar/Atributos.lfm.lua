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
			-- Variáveis para os campos relacionados ao valor passado como parâmetro
			local valorBase = valor .. "Base"
			local valorPassivo = valor .. "Passivo"
			local valorEquips = valor .. "Equips"
			local valorTreino = valor .. "Treino"
			local valorTotal = valor .. "Total"

			-- Variáveis para os atributos passivos, equipamentos e treino
			local forcaBase = tonumber(sheet.ForcaBase) or 0
			local forcaPassivo = tonumber(sheet.ForcaPassivo) or 0
			local forcaEquips = tonumber(sheet.ForcaEquips) or 0
			local forcaTreino = tonumber(sheet.ForcaTreino) or 0

			local agilidadeBase = tonumber(sheet.AgilidadeBase) or 0
			local agilidadePassivo = tonumber(sheet.AgilidadePassivo) or 0
			local agilidadeEquips = tonumber(sheet.AgilidadeEquips) or 0
			local agilidadeTreino = tonumber(sheet.AgilidadeTreino) or 0

			local vigorBase = tonumber(sheet.VigorBase) or 0
			local vigorPassivo = tonumber(sheet.VigorPassivo) or 0
			local vigorEquips = tonumber(sheet.VigorEquips) or 0
			local vigorTreino = tonumber(sheet.VigorTreino) or 0

			local combateBase = tonumber(sheet.CombateBase) or 0
			local combatePassivo = tonumber(sheet.CombatePassivo) or 0
			local combateEquips = tonumber(sheet.CombateEquips) or 0
			local combateTreino = tonumber(sheet.CombateTreino) or 0
			
			local percepcaoBase = tonumber(sheet.PercepcaoBase) or 0
			local percepcaoPassivo = tonumber(sheet.PercepcaoPassivo) or 0
			local percepcaoEquips = tonumber(sheet.PercepcaoEquips) or 0
			local percepcaoTreino = tonumber(sheet.PercepcaoTreino) or 0

			local carismaBase = tonumber(sheet.CarismaBase) or 0
			local carismaPassivo = tonumber(sheet.CarismaPassivo) or 0
			local carismaEquips = tonumber(sheet.CarismaEquips) or 0
			local carismaTreino = tonumber(sheet.CarismaTreino) or 0

			local inteligenciaBase = tonumber(sheet.InteligenciaBase) or 0
			local inteligenciaPassivo = tonumber(sheet.InteligenciaPassivo) or 0
			local inteligenciaEquips = tonumber(sheet.InteligenciaEquips) or 0
			local inteligenciaTreino = tonumber(sheet.InteligenciaTreino) or 0

			local precisaoBase = tonumber(sheet.PrecisaoBase) or 0
			local precisaoPassivo = tonumber(sheet.PrecisaoPassivo) or 0
			local precisaoEquips = tonumber(sheet.PrecisaoEquips) or 0
			local precisaoTreino = tonumber(sheet.PrecisaoTreino) or 0

			local forcaDeVontadeBase = tonumber(sheet.ForcaDeVontadeBase) or 0
			local forcaDeVontadePassivo = tonumber(sheet.ForcaDeVontadePassivo) or 0
			local forcaDeVontadeEquips = tonumber(sheet.ForcaDeVontadeEquips) or 0
			local forcaDeVontadeTreino = tonumber(sheet.ForcaDeVontadeTreino) or 0
			
			-- Cálculo dos pontos de outros (passivos, equipamentos e treino)
			sheet.PontosOutros = tostring(
				forcaPassivo + forcaEquips + forcaTreino +
				agilidadePassivo + agilidadeEquips + agilidadeTreino +
				vigorPassivo + vigorEquips + vigorTreino +
				combatePassivo + combateEquips + combateTreino +
				percepcaoPassivo + percepcaoEquips + percepcaoTreino +
				carismaPassivo + carismaEquips + carismaTreino +
				inteligenciaPassivo + inteligenciaEquips + inteligenciaTreino +
				precisaoPassivo + precisaoEquips + precisaoTreino +
				forcaDeVontadePassivo + forcaDeVontadeEquips + forcaDeVontadeTreino
			)

			-- Soma dos valores para o total
			local soma = tonumber(sheet[valorBase] or 0) + tonumber(sheet[valorPassivo] or 0) + tonumber(sheet[valorEquips] or 0) + tonumber(sheet[valorTreino] or 0)
			self[valorTotal].text = tostring(soma)
			
			-- Cálculo dos pontos disponíveis
			local nivel = tonumber(sheet.nivel) or 1
			sheet.PontosDisponiveis = tostring(23 + (nivel * 2) - forcaBase - agilidadeBase - vigorBase - combateBase - percepcaoBase - carismaBase - inteligenciaBase - precisaoBase - forcaDeVontadeBase)

			-- Cálculo dos pontos distribuídos
			sheet.PontosDistribuidos = tostring(forcaBase + agilidadeBase + vigorBase + combateBase + percepcaoBase + carismaBase + inteligenciaBase + precisaoBase + forcaDeVontadeBase - 9)
			
			-- Cálculo da defesa
			sheet.Defesa = tostring(math.floor((tonumber(sheet.VigorBase) or 0) / 2))
			
		end
		
		function CalcularPontosTotais()
			sheet.PontosTotais = (sheet.ForcaTotal or 0) + (sheet.AgilidadeTotal or 0) + (sheet.VigorTotal or 0) + 
								 (sheet.CombateTotal or 0) + (sheet.PercepcaoTotal or 0) + (sheet.CarismaTotal or 0) + 
								 (sheet.InteligenciaTotal or 0) + (sheet.PrecisaoTotal or 0) + (sheet.ForcaDeVontadeTotal or 0)
		end

		function CalcularHpEngHaki()
			sheet.hp = ((sheet.VigorTotal or 0) * 7) + 45 + (5 * (sheet.nivel or 0))
			sheet.eng = ((sheet.VigorTotal or 0) * 7) + 57 + (5 * (sheet.nivel or 0))
			
			if ((sheet.ForcaDeVontadeTotal or 0) >= 20) then 
				sheet.haki = (sheet.ForcaDeVontadeTotal or 0) * 5 
			else 
				sheet.haki = 0 
			end
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
    obj.layout1:setWidth(4300);
    obj.layout1:setHeight(5250);
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
    obj.label1:setFontColor("#D1B27E");
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

    obj.ForcaBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForcaBase:setParent(obj.layout1);
    obj.ForcaBase:setField("ForcaBase");
    obj.ForcaBase:setName("ForcaBase");
    obj.ForcaBase:setLeft(130);
    obj.ForcaBase:setTop(79);
    obj.ForcaBase:setWidth(45);
    obj.ForcaBase:setHeight(24);
    obj.ForcaBase:setTransparent(true);
    obj.ForcaBase:setFontColor("black");
    obj.ForcaBase:setFontSize(17);
    obj.ForcaBase:setHorzTextAlign("center");
    obj.ForcaBase:setType("number");
    lfm_setPropAsString(obj.ForcaBase, "fontStyle", "bold");

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

    obj.AgilidadeBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.AgilidadeBase:setParent(obj.layout1);
    obj.AgilidadeBase:setField("AgilidadeBase");
    obj.AgilidadeBase:setName("AgilidadeBase");
    obj.AgilidadeBase:setLeft(130);
    obj.AgilidadeBase:setTop(109);
    obj.AgilidadeBase:setWidth(45);
    obj.AgilidadeBase:setHeight(24);
    obj.AgilidadeBase:setTransparent(true);
    obj.AgilidadeBase:setFontColor("black");
    obj.AgilidadeBase:setFontSize(17);
    obj.AgilidadeBase:setHorzTextAlign("center");
    obj.AgilidadeBase:setType("number");
    lfm_setPropAsString(obj.AgilidadeBase, "fontStyle", "bold");

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

    obj.VigorBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.VigorBase:setParent(obj.layout1);
    obj.VigorBase:setField("VigorBase");
    obj.VigorBase:setName("VigorBase");
    obj.VigorBase:setLeft(130);
    obj.VigorBase:setTop(139);
    obj.VigorBase:setWidth(45);
    obj.VigorBase:setHeight(24);
    obj.VigorBase:setTransparent(true);
    obj.VigorBase:setFontColor("black");
    obj.VigorBase:setFontSize(17);
    obj.VigorBase:setHorzTextAlign("center");
    obj.VigorBase:setType("number");
    lfm_setPropAsString(obj.VigorBase, "fontStyle", "bold");

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

    obj.CombateBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.CombateBase:setParent(obj.layout1);
    obj.CombateBase:setField("CombateBase");
    obj.CombateBase:setName("CombateBase");
    obj.CombateBase:setLeft(130);
    obj.CombateBase:setTop(169);
    obj.CombateBase:setWidth(45);
    obj.CombateBase:setHeight(24);
    obj.CombateBase:setTransparent(true);
    obj.CombateBase:setFontColor("black");
    obj.CombateBase:setFontSize(17);
    obj.CombateBase:setHorzTextAlign("center");
    obj.CombateBase:setType("number");
    lfm_setPropAsString(obj.CombateBase, "fontStyle", "bold");

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

    obj.PercepcaoBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.PercepcaoBase:setParent(obj.layout1);
    obj.PercepcaoBase:setField("PercepcaoBase");
    obj.PercepcaoBase:setName("PercepcaoBase");
    obj.PercepcaoBase:setLeft(130);
    obj.PercepcaoBase:setTop(199);
    obj.PercepcaoBase:setWidth(45);
    obj.PercepcaoBase:setHeight(24);
    obj.PercepcaoBase:setTransparent(true);
    obj.PercepcaoBase:setFontColor("black");
    obj.PercepcaoBase:setFontSize(17);
    obj.PercepcaoBase:setHorzTextAlign("center");
    obj.PercepcaoBase:setType("number");
    lfm_setPropAsString(obj.PercepcaoBase, "fontStyle", "bold");

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

    obj.CarismaBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.CarismaBase:setParent(obj.layout1);
    obj.CarismaBase:setField("CarismaBase");
    obj.CarismaBase:setName("CarismaBase");
    obj.CarismaBase:setLeft(130);
    obj.CarismaBase:setTop(229);
    obj.CarismaBase:setWidth(45);
    obj.CarismaBase:setHeight(24);
    obj.CarismaBase:setTransparent(true);
    obj.CarismaBase:setFontColor("black");
    obj.CarismaBase:setFontSize(17);
    obj.CarismaBase:setHorzTextAlign("center");
    obj.CarismaBase:setType("number");
    lfm_setPropAsString(obj.CarismaBase, "fontStyle", "bold");

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

    obj.InteligenciaBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.InteligenciaBase:setParent(obj.layout1);
    obj.InteligenciaBase:setField("InteligenciaBase");
    obj.InteligenciaBase:setName("InteligenciaBase");
    obj.InteligenciaBase:setLeft(130);
    obj.InteligenciaBase:setTop(259);
    obj.InteligenciaBase:setWidth(45);
    obj.InteligenciaBase:setHeight(24);
    obj.InteligenciaBase:setTransparent(true);
    obj.InteligenciaBase:setFontColor("black");
    obj.InteligenciaBase:setFontSize(17);
    obj.InteligenciaBase:setHorzTextAlign("center");
    obj.InteligenciaBase:setType("number");
    lfm_setPropAsString(obj.InteligenciaBase, "fontStyle", "bold");

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

    obj.PrecisaoBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.PrecisaoBase:setParent(obj.layout1);
    obj.PrecisaoBase:setField("PrecisaoBase");
    obj.PrecisaoBase:setName("PrecisaoBase");
    obj.PrecisaoBase:setLeft(130);
    obj.PrecisaoBase:setTop(289);
    obj.PrecisaoBase:setWidth(45);
    obj.PrecisaoBase:setHeight(24);
    obj.PrecisaoBase:setTransparent(true);
    obj.PrecisaoBase:setFontColor("black");
    obj.PrecisaoBase:setFontSize(17);
    obj.PrecisaoBase:setHorzTextAlign("center");
    obj.PrecisaoBase:setType("number");
    lfm_setPropAsString(obj.PrecisaoBase, "fontStyle", "bold");

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

    obj.ForcaDeVontadeBase = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForcaDeVontadeBase:setParent(obj.layout1);
    obj.ForcaDeVontadeBase:setField("ForcaDeVontadeBase");
    obj.ForcaDeVontadeBase:setName("ForcaDeVontadeBase");
    obj.ForcaDeVontadeBase:setLeft(130);
    obj.ForcaDeVontadeBase:setTop(319);
    obj.ForcaDeVontadeBase:setWidth(45);
    obj.ForcaDeVontadeBase:setHeight(24);
    obj.ForcaDeVontadeBase:setTransparent(true);
    obj.ForcaDeVontadeBase:setFontColor("black");
    obj.ForcaDeVontadeBase:setFontSize(17);
    obj.ForcaDeVontadeBase:setHorzTextAlign("center");
    obj.ForcaDeVontadeBase:setType("number");
    lfm_setPropAsString(obj.ForcaDeVontadeBase, "fontStyle", "bold");

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

    obj.ForcaPassivo = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForcaPassivo:setParent(obj.layout1);
    obj.ForcaPassivo:setField("ForcaPassivo");
    obj.ForcaPassivo:setName("ForcaPassivo");
    obj.ForcaPassivo:setLeft(190);
    obj.ForcaPassivo:setTop(79);
    obj.ForcaPassivo:setWidth(45);
    obj.ForcaPassivo:setHeight(24);
    obj.ForcaPassivo:setTransparent(true);
    obj.ForcaPassivo:setFontColor("black");
    obj.ForcaPassivo:setFontSize(17);
    obj.ForcaPassivo:setHorzTextAlign("center");
    obj.ForcaPassivo:setType("number");
    lfm_setPropAsString(obj.ForcaPassivo, "fontStyle", "bold");

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

    obj.AgilidadePassivo = GUI.fromHandle(_obj_newObject("edit"));
    obj.AgilidadePassivo:setParent(obj.layout1);
    obj.AgilidadePassivo:setField("AgilidadePassivo");
    obj.AgilidadePassivo:setName("AgilidadePassivo");
    obj.AgilidadePassivo:setLeft(190);
    obj.AgilidadePassivo:setTop(109);
    obj.AgilidadePassivo:setWidth(45);
    obj.AgilidadePassivo:setHeight(24);
    obj.AgilidadePassivo:setTransparent(true);
    obj.AgilidadePassivo:setFontColor("black");
    obj.AgilidadePassivo:setFontSize(17);
    obj.AgilidadePassivo:setHorzTextAlign("center");
    obj.AgilidadePassivo:setType("number");
    lfm_setPropAsString(obj.AgilidadePassivo, "fontStyle", "bold");

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

    obj.VigorPassivo = GUI.fromHandle(_obj_newObject("edit"));
    obj.VigorPassivo:setParent(obj.layout1);
    obj.VigorPassivo:setField("VigorPassivo");
    obj.VigorPassivo:setName("VigorPassivo");
    obj.VigorPassivo:setLeft(190);
    obj.VigorPassivo:setTop(139);
    obj.VigorPassivo:setWidth(45);
    obj.VigorPassivo:setHeight(24);
    obj.VigorPassivo:setTransparent(true);
    obj.VigorPassivo:setFontColor("black");
    obj.VigorPassivo:setFontSize(17);
    obj.VigorPassivo:setHorzTextAlign("center");
    obj.VigorPassivo:setType("number");
    lfm_setPropAsString(obj.VigorPassivo, "fontStyle", "bold");

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

    obj.CombatePassivo = GUI.fromHandle(_obj_newObject("edit"));
    obj.CombatePassivo:setParent(obj.layout1);
    obj.CombatePassivo:setField("CombatePassivo");
    obj.CombatePassivo:setName("CombatePassivo");
    obj.CombatePassivo:setLeft(190);
    obj.CombatePassivo:setTop(169);
    obj.CombatePassivo:setWidth(45);
    obj.CombatePassivo:setHeight(24);
    obj.CombatePassivo:setTransparent(true);
    obj.CombatePassivo:setFontColor("black");
    obj.CombatePassivo:setFontSize(17);
    obj.CombatePassivo:setHorzTextAlign("center");
    obj.CombatePassivo:setType("number");
    lfm_setPropAsString(obj.CombatePassivo, "fontStyle", "bold");

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

    obj.PercepcaoPassivo = GUI.fromHandle(_obj_newObject("edit"));
    obj.PercepcaoPassivo:setParent(obj.layout1);
    obj.PercepcaoPassivo:setField("PercepcaoPassivo");
    obj.PercepcaoPassivo:setName("PercepcaoPassivo");
    obj.PercepcaoPassivo:setLeft(190);
    obj.PercepcaoPassivo:setTop(199);
    obj.PercepcaoPassivo:setWidth(45);
    obj.PercepcaoPassivo:setHeight(24);
    obj.PercepcaoPassivo:setTransparent(true);
    obj.PercepcaoPassivo:setFontColor("black");
    obj.PercepcaoPassivo:setFontSize(17);
    obj.PercepcaoPassivo:setHorzTextAlign("center");
    obj.PercepcaoPassivo:setType("number");
    lfm_setPropAsString(obj.PercepcaoPassivo, "fontStyle", "bold");

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

    obj.CarismaPassivo = GUI.fromHandle(_obj_newObject("edit"));
    obj.CarismaPassivo:setParent(obj.layout1);
    obj.CarismaPassivo:setField("CarismaPassivo");
    obj.CarismaPassivo:setName("CarismaPassivo");
    obj.CarismaPassivo:setLeft(190);
    obj.CarismaPassivo:setTop(229);
    obj.CarismaPassivo:setWidth(45);
    obj.CarismaPassivo:setHeight(24);
    obj.CarismaPassivo:setTransparent(true);
    obj.CarismaPassivo:setFontColor("black");
    obj.CarismaPassivo:setFontSize(17);
    obj.CarismaPassivo:setHorzTextAlign("center");
    obj.CarismaPassivo:setType("number");
    lfm_setPropAsString(obj.CarismaPassivo, "fontStyle", "bold");

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

    obj.InteligenciaPassivo = GUI.fromHandle(_obj_newObject("edit"));
    obj.InteligenciaPassivo:setParent(obj.layout1);
    obj.InteligenciaPassivo:setField("InteligenciaPassivo");
    obj.InteligenciaPassivo:setName("InteligenciaPassivo");
    obj.InteligenciaPassivo:setLeft(190);
    obj.InteligenciaPassivo:setTop(259);
    obj.InteligenciaPassivo:setWidth(45);
    obj.InteligenciaPassivo:setHeight(24);
    obj.InteligenciaPassivo:setTransparent(true);
    obj.InteligenciaPassivo:setFontColor("black");
    obj.InteligenciaPassivo:setFontSize(17);
    obj.InteligenciaPassivo:setHorzTextAlign("center");
    obj.InteligenciaPassivo:setType("number");
    lfm_setPropAsString(obj.InteligenciaPassivo, "fontStyle", "bold");

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

    obj.PrecisaoPassivo = GUI.fromHandle(_obj_newObject("edit"));
    obj.PrecisaoPassivo:setParent(obj.layout1);
    obj.PrecisaoPassivo:setField("PrecisaoPassivo");
    obj.PrecisaoPassivo:setName("PrecisaoPassivo");
    obj.PrecisaoPassivo:setLeft(190);
    obj.PrecisaoPassivo:setTop(289);
    obj.PrecisaoPassivo:setWidth(45);
    obj.PrecisaoPassivo:setHeight(24);
    obj.PrecisaoPassivo:setTransparent(true);
    obj.PrecisaoPassivo:setFontColor("black");
    obj.PrecisaoPassivo:setFontSize(17);
    obj.PrecisaoPassivo:setHorzTextAlign("center");
    obj.PrecisaoPassivo:setType("number");
    lfm_setPropAsString(obj.PrecisaoPassivo, "fontStyle", "bold");

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

    obj.ForcaDeVontadePassivo = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForcaDeVontadePassivo:setParent(obj.layout1);
    obj.ForcaDeVontadePassivo:setField("ForcaDeVontadePassivo");
    obj.ForcaDeVontadePassivo:setName("ForcaDeVontadePassivo");
    obj.ForcaDeVontadePassivo:setLeft(190);
    obj.ForcaDeVontadePassivo:setTop(319);
    obj.ForcaDeVontadePassivo:setWidth(45);
    obj.ForcaDeVontadePassivo:setHeight(24);
    obj.ForcaDeVontadePassivo:setTransparent(true);
    obj.ForcaDeVontadePassivo:setFontColor("black");
    obj.ForcaDeVontadePassivo:setFontSize(17);
    obj.ForcaDeVontadePassivo:setHorzTextAlign("center");
    obj.ForcaDeVontadePassivo:setType("number");
    lfm_setPropAsString(obj.ForcaDeVontadePassivo, "fontStyle", "bold");

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

    obj.ForcaEquips = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForcaEquips:setParent(obj.layout1);
    obj.ForcaEquips:setField("ForcaEquips");
    obj.ForcaEquips:setName("ForcaEquips");
    obj.ForcaEquips:setLeft(250);
    obj.ForcaEquips:setTop(79);
    obj.ForcaEquips:setWidth(45);
    obj.ForcaEquips:setHeight(24);
    obj.ForcaEquips:setTransparent(true);
    obj.ForcaEquips:setFontColor("black");
    obj.ForcaEquips:setFontSize(17);
    obj.ForcaEquips:setHorzTextAlign("center");
    obj.ForcaEquips:setType("number");
    lfm_setPropAsString(obj.ForcaEquips, "fontStyle", "bold");

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

    obj.AgilidadeEquips = GUI.fromHandle(_obj_newObject("edit"));
    obj.AgilidadeEquips:setParent(obj.layout1);
    obj.AgilidadeEquips:setField("AgilidadeEquips");
    obj.AgilidadeEquips:setName("AgilidadeEquips");
    obj.AgilidadeEquips:setLeft(250);
    obj.AgilidadeEquips:setTop(109);
    obj.AgilidadeEquips:setWidth(45);
    obj.AgilidadeEquips:setHeight(24);
    obj.AgilidadeEquips:setTransparent(true);
    obj.AgilidadeEquips:setFontColor("black");
    obj.AgilidadeEquips:setFontSize(17);
    obj.AgilidadeEquips:setHorzTextAlign("center");
    obj.AgilidadeEquips:setType("number");
    lfm_setPropAsString(obj.AgilidadeEquips, "fontStyle", "bold");

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

    obj.VigorEquips = GUI.fromHandle(_obj_newObject("edit"));
    obj.VigorEquips:setParent(obj.layout1);
    obj.VigorEquips:setField("VigorEquips");
    obj.VigorEquips:setName("VigorEquips");
    obj.VigorEquips:setLeft(250);
    obj.VigorEquips:setTop(139);
    obj.VigorEquips:setWidth(45);
    obj.VigorEquips:setHeight(24);
    obj.VigorEquips:setTransparent(true);
    obj.VigorEquips:setFontColor("black");
    obj.VigorEquips:setFontSize(17);
    obj.VigorEquips:setHorzTextAlign("center");
    obj.VigorEquips:setType("number");
    lfm_setPropAsString(obj.VigorEquips, "fontStyle", "bold");

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

    obj.CombateEquips = GUI.fromHandle(_obj_newObject("edit"));
    obj.CombateEquips:setParent(obj.layout1);
    obj.CombateEquips:setField("CombateEquips");
    obj.CombateEquips:setName("CombateEquips");
    obj.CombateEquips:setLeft(250);
    obj.CombateEquips:setTop(169);
    obj.CombateEquips:setWidth(45);
    obj.CombateEquips:setHeight(24);
    obj.CombateEquips:setTransparent(true);
    obj.CombateEquips:setFontColor("black");
    obj.CombateEquips:setFontSize(17);
    obj.CombateEquips:setHorzTextAlign("center");
    obj.CombateEquips:setType("number");
    lfm_setPropAsString(obj.CombateEquips, "fontStyle", "bold");

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

    obj.PercepcaoEquips = GUI.fromHandle(_obj_newObject("edit"));
    obj.PercepcaoEquips:setParent(obj.layout1);
    obj.PercepcaoEquips:setField("PercepcaoEquips");
    obj.PercepcaoEquips:setName("PercepcaoEquips");
    obj.PercepcaoEquips:setLeft(250);
    obj.PercepcaoEquips:setTop(199);
    obj.PercepcaoEquips:setWidth(45);
    obj.PercepcaoEquips:setHeight(24);
    obj.PercepcaoEquips:setTransparent(true);
    obj.PercepcaoEquips:setFontColor("black");
    obj.PercepcaoEquips:setFontSize(17);
    obj.PercepcaoEquips:setHorzTextAlign("center");
    obj.PercepcaoEquips:setType("number");
    lfm_setPropAsString(obj.PercepcaoEquips, "fontStyle", "bold");

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

    obj.CarismaEquips = GUI.fromHandle(_obj_newObject("edit"));
    obj.CarismaEquips:setParent(obj.layout1);
    obj.CarismaEquips:setField("CarismaEquips");
    obj.CarismaEquips:setName("CarismaEquips");
    obj.CarismaEquips:setLeft(250);
    obj.CarismaEquips:setTop(229);
    obj.CarismaEquips:setWidth(45);
    obj.CarismaEquips:setHeight(24);
    obj.CarismaEquips:setTransparent(true);
    obj.CarismaEquips:setFontColor("black");
    obj.CarismaEquips:setFontSize(17);
    obj.CarismaEquips:setHorzTextAlign("center");
    obj.CarismaEquips:setType("number");
    lfm_setPropAsString(obj.CarismaEquips, "fontStyle", "bold");

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

    obj.InteligenciaEquips = GUI.fromHandle(_obj_newObject("edit"));
    obj.InteligenciaEquips:setParent(obj.layout1);
    obj.InteligenciaEquips:setField("InteligenciaEquips");
    obj.InteligenciaEquips:setName("InteligenciaEquips");
    obj.InteligenciaEquips:setLeft(250);
    obj.InteligenciaEquips:setTop(259);
    obj.InteligenciaEquips:setWidth(45);
    obj.InteligenciaEquips:setHeight(24);
    obj.InteligenciaEquips:setTransparent(true);
    obj.InteligenciaEquips:setFontColor("black");
    obj.InteligenciaEquips:setFontSize(17);
    obj.InteligenciaEquips:setHorzTextAlign("center");
    obj.InteligenciaEquips:setType("number");
    lfm_setPropAsString(obj.InteligenciaEquips, "fontStyle", "bold");

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

    obj.PrecisaoEquips = GUI.fromHandle(_obj_newObject("edit"));
    obj.PrecisaoEquips:setParent(obj.layout1);
    obj.PrecisaoEquips:setField("PrecisaoEquips");
    obj.PrecisaoEquips:setName("PrecisaoEquips");
    obj.PrecisaoEquips:setLeft(250);
    obj.PrecisaoEquips:setTop(289);
    obj.PrecisaoEquips:setWidth(45);
    obj.PrecisaoEquips:setHeight(24);
    obj.PrecisaoEquips:setTransparent(true);
    obj.PrecisaoEquips:setFontColor("black");
    obj.PrecisaoEquips:setFontSize(17);
    obj.PrecisaoEquips:setHorzTextAlign("center");
    obj.PrecisaoEquips:setType("number");
    lfm_setPropAsString(obj.PrecisaoEquips, "fontStyle", "bold");

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

    obj.ForcaDeVontadeEquips = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForcaDeVontadeEquips:setParent(obj.layout1);
    obj.ForcaDeVontadeEquips:setField("ForcaDeVontadeEquips");
    obj.ForcaDeVontadeEquips:setName("ForcaDeVontadeEquips");
    obj.ForcaDeVontadeEquips:setLeft(250);
    obj.ForcaDeVontadeEquips:setTop(319);
    obj.ForcaDeVontadeEquips:setWidth(45);
    obj.ForcaDeVontadeEquips:setHeight(24);
    obj.ForcaDeVontadeEquips:setTransparent(true);
    obj.ForcaDeVontadeEquips:setFontColor("black");
    obj.ForcaDeVontadeEquips:setFontSize(17);
    obj.ForcaDeVontadeEquips:setHorzTextAlign("center");
    obj.ForcaDeVontadeEquips:setType("number");
    lfm_setPropAsString(obj.ForcaDeVontadeEquips, "fontStyle", "bold");

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

    obj.ForcaTreino = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForcaTreino:setParent(obj.layout1);
    obj.ForcaTreino:setField("ForcaTreino");
    obj.ForcaTreino:setName("ForcaTreino");
    obj.ForcaTreino:setLeft(310);
    obj.ForcaTreino:setTop(79);
    obj.ForcaTreino:setWidth(45);
    obj.ForcaTreino:setHeight(24);
    obj.ForcaTreino:setTransparent(true);
    obj.ForcaTreino:setFontColor("black");
    obj.ForcaTreino:setFontSize(17);
    obj.ForcaTreino:setHorzTextAlign("center");
    obj.ForcaTreino:setType("number");
    lfm_setPropAsString(obj.ForcaTreino, "fontStyle", "bold");

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

    obj.AgilidadeTreino = GUI.fromHandle(_obj_newObject("edit"));
    obj.AgilidadeTreino:setParent(obj.layout1);
    obj.AgilidadeTreino:setField("AgilidadeTreino");
    obj.AgilidadeTreino:setName("AgilidadeTreino");
    obj.AgilidadeTreino:setLeft(310);
    obj.AgilidadeTreino:setTop(109);
    obj.AgilidadeTreino:setWidth(45);
    obj.AgilidadeTreino:setHeight(24);
    obj.AgilidadeTreino:setTransparent(true);
    obj.AgilidadeTreino:setFontColor("black");
    obj.AgilidadeTreino:setFontSize(17);
    obj.AgilidadeTreino:setHorzTextAlign("center");
    obj.AgilidadeTreino:setType("number");
    lfm_setPropAsString(obj.AgilidadeTreino, "fontStyle", "bold");

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

    obj.VigorTreino = GUI.fromHandle(_obj_newObject("edit"));
    obj.VigorTreino:setParent(obj.layout1);
    obj.VigorTreino:setField("VigorTreino");
    obj.VigorTreino:setName("VigorTreino");
    obj.VigorTreino:setLeft(310);
    obj.VigorTreino:setTop(139);
    obj.VigorTreino:setWidth(45);
    obj.VigorTreino:setHeight(24);
    obj.VigorTreino:setTransparent(true);
    obj.VigorTreino:setFontColor("black");
    obj.VigorTreino:setFontSize(17);
    obj.VigorTreino:setHorzTextAlign("center");
    obj.VigorTreino:setType("number");
    lfm_setPropAsString(obj.VigorTreino, "fontStyle", "bold");

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

    obj.CombateTreino = GUI.fromHandle(_obj_newObject("edit"));
    obj.CombateTreino:setParent(obj.layout1);
    obj.CombateTreino:setField("CombateTreino");
    obj.CombateTreino:setName("CombateTreino");
    obj.CombateTreino:setLeft(310);
    obj.CombateTreino:setTop(169);
    obj.CombateTreino:setWidth(45);
    obj.CombateTreino:setHeight(24);
    obj.CombateTreino:setTransparent(true);
    obj.CombateTreino:setFontColor("black");
    obj.CombateTreino:setFontSize(17);
    obj.CombateTreino:setHorzTextAlign("center");
    obj.CombateTreino:setType("number");
    lfm_setPropAsString(obj.CombateTreino, "fontStyle", "bold");

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

    obj.PercepcaoTreino = GUI.fromHandle(_obj_newObject("edit"));
    obj.PercepcaoTreino:setParent(obj.layout1);
    obj.PercepcaoTreino:setField("PercepcaoTreino");
    obj.PercepcaoTreino:setName("PercepcaoTreino");
    obj.PercepcaoTreino:setLeft(310);
    obj.PercepcaoTreino:setTop(199);
    obj.PercepcaoTreino:setWidth(45);
    obj.PercepcaoTreino:setHeight(24);
    obj.PercepcaoTreino:setTransparent(true);
    obj.PercepcaoTreino:setFontColor("black");
    obj.PercepcaoTreino:setFontSize(17);
    obj.PercepcaoTreino:setHorzTextAlign("center");
    obj.PercepcaoTreino:setType("number");
    lfm_setPropAsString(obj.PercepcaoTreino, "fontStyle", "bold");

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

    obj.CarismaTreino = GUI.fromHandle(_obj_newObject("edit"));
    obj.CarismaTreino:setParent(obj.layout1);
    obj.CarismaTreino:setField("CarismaTreino");
    obj.CarismaTreino:setName("CarismaTreino");
    obj.CarismaTreino:setLeft(310);
    obj.CarismaTreino:setTop(229);
    obj.CarismaTreino:setWidth(45);
    obj.CarismaTreino:setHeight(24);
    obj.CarismaTreino:setTransparent(true);
    obj.CarismaTreino:setFontColor("black");
    obj.CarismaTreino:setFontSize(17);
    obj.CarismaTreino:setHorzTextAlign("center");
    obj.CarismaTreino:setType("number");
    lfm_setPropAsString(obj.CarismaTreino, "fontStyle", "bold");

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

    obj.InteligenciaTreino = GUI.fromHandle(_obj_newObject("edit"));
    obj.InteligenciaTreino:setParent(obj.layout1);
    obj.InteligenciaTreino:setField("InteligenciaTreino");
    obj.InteligenciaTreino:setName("InteligenciaTreino");
    obj.InteligenciaTreino:setLeft(310);
    obj.InteligenciaTreino:setTop(259);
    obj.InteligenciaTreino:setWidth(45);
    obj.InteligenciaTreino:setHeight(24);
    obj.InteligenciaTreino:setTransparent(true);
    obj.InteligenciaTreino:setFontColor("black");
    obj.InteligenciaTreino:setFontSize(17);
    obj.InteligenciaTreino:setHorzTextAlign("center");
    obj.InteligenciaTreino:setType("number");
    lfm_setPropAsString(obj.InteligenciaTreino, "fontStyle", "bold");

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

    obj.PrecisaoTreino = GUI.fromHandle(_obj_newObject("edit"));
    obj.PrecisaoTreino:setParent(obj.layout1);
    obj.PrecisaoTreino:setField("PrecisaoTreino");
    obj.PrecisaoTreino:setName("PrecisaoTreino");
    obj.PrecisaoTreino:setLeft(310);
    obj.PrecisaoTreino:setTop(289);
    obj.PrecisaoTreino:setWidth(45);
    obj.PrecisaoTreino:setHeight(24);
    obj.PrecisaoTreino:setTransparent(true);
    obj.PrecisaoTreino:setFontColor("black");
    obj.PrecisaoTreino:setFontSize(17);
    obj.PrecisaoTreino:setHorzTextAlign("center");
    obj.PrecisaoTreino:setType("number");
    lfm_setPropAsString(obj.PrecisaoTreino, "fontStyle", "bold");

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

    obj.ForcaDeVontadeTreino = GUI.fromHandle(_obj_newObject("edit"));
    obj.ForcaDeVontadeTreino:setParent(obj.layout1);
    obj.ForcaDeVontadeTreino:setField("ForcaDeVontadeTreino");
    obj.ForcaDeVontadeTreino:setName("ForcaDeVontadeTreino");
    obj.ForcaDeVontadeTreino:setLeft(310);
    obj.ForcaDeVontadeTreino:setTop(319);
    obj.ForcaDeVontadeTreino:setWidth(45);
    obj.ForcaDeVontadeTreino:setHeight(24);
    obj.ForcaDeVontadeTreino:setTransparent(true);
    obj.ForcaDeVontadeTreino:setFontColor("black");
    obj.ForcaDeVontadeTreino:setFontSize(17);
    obj.ForcaDeVontadeTreino:setHorzTextAlign("center");
    obj.ForcaDeVontadeTreino:setType("number");
    lfm_setPropAsString(obj.ForcaDeVontadeTreino, "fontStyle", "bold");

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
    lfm_setPropAsString(obj.label18, "fontStyle", "bold");
    obj.label18:setAutoSize(true);
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout1);
    obj.label19:setLeft(120);
    obj.label19:setTop(423);
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
    lfm_setPropAsString(obj.label21, "fontStyle", "bold");
    obj.label21:setAutoSize(true);
    obj.label21:setName("label21");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout1);
    obj.label22:setLeft(120);
    obj.label22:setTop(447);
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
    lfm_setPropAsString(obj.label24, "fontStyle", "bold");
    obj.label24:setAutoSize(true);
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
    obj.layout2:setWidth(400);
    obj.layout2:setHeight(525);
    obj.layout2:setName("layout2");

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout2);
    obj.rectangle57:setLeft(0);
    obj.rectangle57:setTop(0);
    obj.rectangle57:setWidth(400);
    obj.rectangle57:setHeight(525);
    obj.rectangle57:setColor("#4169E1");
    obj.rectangle57:setName("rectangle57");

    obj.rectangle58 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout2);
    obj.rectangle58:setLeft(2);
    obj.rectangle58:setTop(2);
    obj.rectangle58:setWidth(396);
    obj.rectangle58:setHeight(521);
    obj.rectangle58:setColor("black");
    obj.rectangle58:setName("rectangle58");

    obj.rectangle59 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout2);
    obj.rectangle59:setLeft(12);
    obj.rectangle59:setTop(25);
    obj.rectangle59:setWidth(73);
    obj.rectangle59:setHeight(73);
    obj.rectangle59:setColor("#F5F5DC");
    obj.rectangle59:setName("rectangle59");

    obj.rectangle60 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout2);
    obj.rectangle60:setLeft(315);
    obj.rectangle60:setTop(25);
    obj.rectangle60:setWidth(73);
    obj.rectangle60:setHeight(73);
    obj.rectangle60:setColor("#F5F5DC");
    obj.rectangle60:setName("rectangle60");

    obj.rectangle61 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout2);
    obj.rectangle61:setLeft(13);
    obj.rectangle61:setTop(26);
    obj.rectangle61:setWidth(71);
    obj.rectangle61:setHeight(71);
    obj.rectangle61:setColor("black");
    obj.rectangle61:setName("rectangle61");

    obj.rectangle62 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout2);
    obj.rectangle62:setLeft(316);
    obj.rectangle62:setTop(26);
    obj.rectangle62:setWidth(71);
    obj.rectangle62:setHeight(71);
    obj.rectangle62:setColor("black");
    obj.rectangle62:setName("rectangle62");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.layout2);
    obj.image1:setField("FotoChapeu");
    obj.image1:setLeft(13);
    obj.image1:setTop(26);
    obj.image1:setWidth(71);
    obj.image1:setHeight(71);
    obj.image1:setName("image1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout2);
    obj.image2:setField("FotoRosto");
    obj.image2:setLeft(316);
    obj.image2:setTop(26);
    obj.image2:setWidth(71);
    obj.image2:setHeight(71);
    obj.image2:setName("image2");

    obj.rectangle63 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout2);
    obj.rectangle63:setLeft(12);
    obj.rectangle63:setTop(108);
    obj.rectangle63:setWidth(73);
    obj.rectangle63:setHeight(73);
    obj.rectangle63:setColor("#F5F5DC");
    obj.rectangle63:setName("rectangle63");

    obj.rectangle64 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout2);
    obj.rectangle64:setLeft(315);
    obj.rectangle64:setTop(108);
    obj.rectangle64:setWidth(73);
    obj.rectangle64:setHeight(73);
    obj.rectangle64:setColor("#F5F5DC");
    obj.rectangle64:setName("rectangle64");

    obj.rectangle65 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout2);
    obj.rectangle65:setLeft(13);
    obj.rectangle65:setTop(109);
    obj.rectangle65:setWidth(71);
    obj.rectangle65:setHeight(71);
    obj.rectangle65:setColor("black");
    obj.rectangle65:setName("rectangle65");

    obj.rectangle66 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout2);
    obj.rectangle66:setLeft(316);
    obj.rectangle66:setTop(109);
    obj.rectangle66:setWidth(71);
    obj.rectangle66:setHeight(71);
    obj.rectangle66:setColor("black");
    obj.rectangle66:setName("rectangle66");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout2);
    obj.image3:setField("FotoColar");
    obj.image3:setLeft(13);
    obj.image3:setTop(109);
    obj.image3:setWidth(71);
    obj.image3:setHeight(71);
    obj.image3:setName("image3");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout2);
    obj.image4:setField("FotoBrinco");
    obj.image4:setLeft(316);
    obj.image4:setTop(109);
    obj.image4:setWidth(71);
    obj.image4:setHeight(71);
    obj.image4:setName("image4");

    obj.rectangle67 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout2);
    obj.rectangle67:setLeft(12);
    obj.rectangle67:setTop(191);
    obj.rectangle67:setWidth(73);
    obj.rectangle67:setHeight(73);
    obj.rectangle67:setColor("#F5F5DC");
    obj.rectangle67:setName("rectangle67");

    obj.rectangle68 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout2);
    obj.rectangle68:setLeft(315);
    obj.rectangle68:setTop(191);
    obj.rectangle68:setWidth(73);
    obj.rectangle68:setHeight(73);
    obj.rectangle68:setColor("#F5F5DC");
    obj.rectangle68:setName("rectangle68");

    obj.rectangle69 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.layout2);
    obj.rectangle69:setLeft(13);
    obj.rectangle69:setTop(192);
    obj.rectangle69:setWidth(71);
    obj.rectangle69:setHeight(71);
    obj.rectangle69:setColor("black");
    obj.rectangle69:setName("rectangle69");

    obj.rectangle70 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout2);
    obj.rectangle70:setLeft(316);
    obj.rectangle70:setTop(192);
    obj.rectangle70:setWidth(71);
    obj.rectangle70:setHeight(71);
    obj.rectangle70:setColor("black");
    obj.rectangle70:setName("rectangle70");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout2);
    obj.image5:setField("FotoRoupa");
    obj.image5:setLeft(13);
    obj.image5:setTop(192);
    obj.image5:setWidth(71);
    obj.image5:setHeight(71);
    obj.image5:setName("image5");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.layout2);
    obj.image6:setField("FotoCapa");
    obj.image6:setLeft(316);
    obj.image6:setTop(192);
    obj.image6:setWidth(71);
    obj.image6:setHeight(71);
    obj.image6:setName("image6");

    obj.rectangle71 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout2);
    obj.rectangle71:setLeft(12);
    obj.rectangle71:setTop(274);
    obj.rectangle71:setWidth(73);
    obj.rectangle71:setHeight(73);
    obj.rectangle71:setColor("#F5F5DC");
    obj.rectangle71:setName("rectangle71");

    obj.rectangle72 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout2);
    obj.rectangle72:setLeft(315);
    obj.rectangle72:setTop(274);
    obj.rectangle72:setWidth(73);
    obj.rectangle72:setHeight(73);
    obj.rectangle72:setColor("#F5F5DC");
    obj.rectangle72:setName("rectangle72");

    obj.rectangle73 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout2);
    obj.rectangle73:setLeft(13);
    obj.rectangle73:setTop(275);
    obj.rectangle73:setWidth(71);
    obj.rectangle73:setHeight(71);
    obj.rectangle73:setColor("black");
    obj.rectangle73:setName("rectangle73");

    obj.rectangle74 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.layout2);
    obj.rectangle74:setLeft(316);
    obj.rectangle74:setTop(275);
    obj.rectangle74:setWidth(71);
    obj.rectangle74:setHeight(71);
    obj.rectangle74:setColor("black");
    obj.rectangle74:setName("rectangle74");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.layout2);
    obj.image7:setField("FotoMaoPrimaria");
    obj.image7:setLeft(13);
    obj.image7:setTop(275);
    obj.image7:setWidth(71);
    obj.image7:setHeight(71);
    obj.image7:setName("image7");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.layout2);
    obj.image8:setField("FotoMaoSecundaria");
    obj.image8:setLeft(316);
    obj.image8:setTop(275);
    obj.image8:setWidth(71);
    obj.image8:setHeight(71);
    obj.image8:setName("image8");

    obj.rectangle75 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout2);
    obj.rectangle75:setLeft(12);
    obj.rectangle75:setTop(357);
    obj.rectangle75:setWidth(73);
    obj.rectangle75:setHeight(73);
    obj.rectangle75:setColor("#F5F5DC");
    obj.rectangle75:setName("rectangle75");

    obj.rectangle76 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.layout2);
    obj.rectangle76:setLeft(315);
    obj.rectangle76:setTop(357);
    obj.rectangle76:setWidth(73);
    obj.rectangle76:setHeight(73);
    obj.rectangle76:setColor("#F5F5DC");
    obj.rectangle76:setName("rectangle76");

    obj.rectangle77 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.layout2);
    obj.rectangle77:setLeft(13);
    obj.rectangle77:setTop(358);
    obj.rectangle77:setWidth(71);
    obj.rectangle77:setHeight(71);
    obj.rectangle77:setColor("black");
    obj.rectangle77:setName("rectangle77");

    obj.rectangle78 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.layout2);
    obj.rectangle78:setLeft(316);
    obj.rectangle78:setTop(358);
    obj.rectangle78:setWidth(71);
    obj.rectangle78:setHeight(71);
    obj.rectangle78:setColor("black");
    obj.rectangle78:setName("rectangle78");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.layout2);
    obj.image9:setField("FotoCalca");
    obj.image9:setLeft(13);
    obj.image9:setTop(358);
    obj.image9:setWidth(71);
    obj.image9:setHeight(71);
    obj.image9:setName("image9");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.layout2);
    obj.image10:setField("FotoLuva");
    obj.image10:setLeft(316);
    obj.image10:setTop(358);
    obj.image10:setWidth(71);
    obj.image10:setHeight(71);
    obj.image10:setName("image10");

    obj.rectangle79 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.layout2);
    obj.rectangle79:setLeft(12);
    obj.rectangle79:setTop(440);
    obj.rectangle79:setWidth(73);
    obj.rectangle79:setHeight(73);
    obj.rectangle79:setColor("#F5F5DC");
    obj.rectangle79:setName("rectangle79");

    obj.rectangle80 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.layout2);
    obj.rectangle80:setLeft(315);
    obj.rectangle80:setTop(440);
    obj.rectangle80:setWidth(73);
    obj.rectangle80:setHeight(73);
    obj.rectangle80:setColor("#F5F5DC");
    obj.rectangle80:setName("rectangle80");

    obj.rectangle81 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.layout2);
    obj.rectangle81:setLeft(13);
    obj.rectangle81:setTop(441);
    obj.rectangle81:setWidth(71);
    obj.rectangle81:setHeight(71);
    obj.rectangle81:setColor("black");
    obj.rectangle81:setName("rectangle81");

    obj.rectangle82 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.layout2);
    obj.rectangle82:setLeft(316);
    obj.rectangle82:setTop(441);
    obj.rectangle82:setWidth(71);
    obj.rectangle82:setHeight(71);
    obj.rectangle82:setColor("black");
    obj.rectangle82:setName("rectangle82");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.layout2);
    obj.image11:setField("FotoBota");
    obj.image11:setLeft(13);
    obj.image11:setTop(441);
    obj.image11:setWidth(71);
    obj.image11:setHeight(71);
    obj.image11:setName("image11");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.layout2);
    obj.image12:setField("FotoAnel");
    obj.image12:setLeft(316);
    obj.image12:setTop(441);
    obj.image12:setWidth(71);
    obj.image12:setHeight(71);
    obj.image12:setName("image12");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout2);
    obj.button1:setLeft(12);
    obj.button1:setTop(25);
    obj.button1:setWidth(73);
    obj.button1:setHeight(73);
    obj.button1:setOpacity(0);
    obj.button1:setCursor("handPoint");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setLeft(315);
    obj.button2:setTop(25);
    obj.button2:setWidth(73);
    obj.button2:setHeight(73);
    obj.button2:setOpacity(0);
    obj.button2:setCursor("handPoint");
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout2);
    obj.button3:setLeft(12);
    obj.button3:setTop(108);
    obj.button3:setWidth(73);
    obj.button3:setHeight(73);
    obj.button3:setOpacity(0);
    obj.button3:setCursor("handPoint");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout2);
    obj.button4:setLeft(315);
    obj.button4:setTop(108);
    obj.button4:setWidth(73);
    obj.button4:setHeight(73);
    obj.button4:setOpacity(0);
    obj.button4:setCursor("handPoint");
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout2);
    obj.button5:setLeft(12);
    obj.button5:setTop(191);
    obj.button5:setWidth(73);
    obj.button5:setHeight(73);
    obj.button5:setOpacity(0);
    obj.button5:setCursor("handPoint");
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout2);
    obj.button6:setLeft(315);
    obj.button6:setTop(191);
    obj.button6:setWidth(73);
    obj.button6:setHeight(73);
    obj.button6:setOpacity(0);
    obj.button6:setCursor("handPoint");
    obj.button6:setName("button6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout2);
    obj.button7:setLeft(12);
    obj.button7:setTop(274);
    obj.button7:setWidth(73);
    obj.button7:setHeight(73);
    obj.button7:setOpacity(0);
    obj.button7:setCursor("handPoint");
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout2);
    obj.button8:setLeft(315);
    obj.button8:setTop(274);
    obj.button8:setWidth(73);
    obj.button8:setHeight(73);
    obj.button8:setOpacity(0);
    obj.button8:setCursor("handPoint");
    obj.button8:setName("button8");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout2);
    obj.button9:setLeft(12);
    obj.button9:setTop(357);
    obj.button9:setWidth(73);
    obj.button9:setHeight(73);
    obj.button9:setOpacity(0);
    obj.button9:setCursor("handPoint");
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout2);
    obj.button10:setLeft(315);
    obj.button10:setTop(357);
    obj.button10:setWidth(73);
    obj.button10:setHeight(73);
    obj.button10:setOpacity(0);
    obj.button10:setCursor("handPoint");
    obj.button10:setName("button10");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout2);
    obj.button11:setLeft(12);
    obj.button11:setTop(440);
    obj.button11:setWidth(73);
    obj.button11:setHeight(73);
    obj.button11:setOpacity(0);
    obj.button11:setCursor("handPoint");
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout2);
    obj.button12:setLeft(315);
    obj.button12:setTop(440);
    obj.button12:setWidth(73);
    obj.button12:setHeight(73);
    obj.button12:setOpacity(0);
    obj.button12:setCursor("handPoint");
    obj.button12:setName("button12");

    obj.imagem = GUI.fromHandle(_obj_newObject("image"));
    obj.imagem:setParent(obj.layout2);
    obj.imagem:setField("imagemPersonagem");
    obj.imagem:setName("imagem");
    obj.imagem:setLeft(85);
    obj.imagem:setTop(25);
    obj.imagem:setWidth(115);
    obj.imagem:setHeight(244);
    obj.imagem:setScale(2);
    obj.imagem:setSRC("https://blob.firecast.com.br/blobs/RORGTSIN_3738646/Ussop-removebg-preview.png");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj);
    obj.layout3:setLeft(868);
    obj.layout3:setTop(12);
    obj.layout3:setWidth(650);
    obj.layout3:setHeight(525);
    obj.layout3:setName("layout3");

    obj.rectangle83 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.layout3);
    obj.rectangle83:setLeft(0);
    obj.rectangle83:setTop(0);
    obj.rectangle83:setWidth(430);
    obj.rectangle83:setHeight(167);
    obj.rectangle83:setColor("#4169E1");
    obj.rectangle83:setName("rectangle83");

    obj.rectangle84 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.layout3);
    obj.rectangle84:setLeft(2);
    obj.rectangle84:setTop(2);
    obj.rectangle84:setWidth(426);
    obj.rectangle84:setHeight(163);
    obj.rectangle84:setColor("black");
    obj.rectangle84:setName("rectangle84");

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.layout3);
    obj.image13:setLeft(4);
    obj.image13:setTop(4);
    obj.image13:setWidth(140);
    obj.image13:setHeight(159);
    obj.image13:setSRC("https://i.namu.wiki/i/r0gPa0bB1bcSk6e517nIupj0zyqafzWY1LL1f0lg9dqPzouu57kCiCbG4TxLCyMA0ljPVi5GON2NftSTCkRp8g.gif");
    obj.image13:setShowStyle("autoFit");
    obj.image13.animate = true;
    obj.image13:setName("image13");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout3);
    obj.label26:setLeft(144);
    obj.label26:setTop(5);
    obj.label26:setWidth(286);
    obj.label26:setText("Haki do Armamento");
    obj.label26:setFontColor("#D1B27E");
    lfm_setPropAsString(obj.label26, "fontStyle", "bold underline");
    obj.label26:setFontSize(18);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout3);
    obj.button13:setLeft(2);
    obj.button13:setTop(2);
    obj.button13:setWidth(70);
    obj.button13:setText("Descrição");
    obj.button13:setName("button13");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout3);
    obj.label27:setLeft(162);
    obj.label27:setTop(40);
    obj.label27:setWidth(256);
    obj.label27:setText("Tier:");
    obj.label27:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label27, "fontStyle", "bold");
    obj.label27:setFontSize(16);
    obj.label27:setName("label27");

    obj.rectangle85 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.layout3);
    obj.rectangle85:setLeft(199);
    obj.rectangle85:setTop(41);
    obj.rectangle85:setWidth(35);
    obj.rectangle85:setHeight(18);
    obj.rectangle85:setColor("#F5F5DC");
    obj.rectangle85:setXradius(7);
    obj.rectangle85:setYradius(7);
    obj.rectangle85:setName("rectangle85");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1:setField("tierArmamento");
    obj.edit1:setLeft(199);
    obj.edit1:setTop(40);
    obj.edit1:setWidth(35);
    obj.edit1:setHeight(18);
    obj.edit1:setTransparent(true);
    obj.edit1:setFontColor("black");
    obj.edit1:setFontSize(15);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout3);
    obj.label28:setLeft(156);
    obj.label28:setTop(65);
    obj.label28:setWidth(256);
    obj.label28:setText("%UP:");
    obj.label28:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label28, "fontStyle", "bold");
    obj.label28:setFontSize(16);
    obj.label28:setName("label28");

    obj.rectangle86 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.layout3);
    obj.rectangle86:setLeft(199);
    obj.rectangle86:setTop(66);
    obj.rectangle86:setWidth(35);
    obj.rectangle86:setHeight(18);
    obj.rectangle86:setColor("#F5F5DC");
    obj.rectangle86:setXradius(7);
    obj.rectangle86:setYradius(7);
    obj.rectangle86:setName("rectangle86");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setField("upArmamento");
    obj.edit2:setLeft(199);
    obj.edit2:setTop(65);
    obj.edit2:setWidth(35);
    obj.edit2:setHeight(18);
    obj.edit2:setTransparent(true);
    obj.edit2:setFontColor("black");
    obj.edit2:setFontSize(15);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout3);
    obj.label29:setLeft(260);
    obj.label29:setTop(40);
    obj.label29:setWidth(256);
    obj.label29:setText("     Estado:");
    obj.label29:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label29, "fontStyle", "bold");
    obj.label29:setFontSize(15);
    obj.label29:setName("label29");

    obj.rectangle87 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle87:setParent(obj.layout3);
    obj.rectangle87:setLeft(335);
    obj.rectangle87:setTop(41);
    obj.rectangle87:setWidth(80);
    obj.rectangle87:setHeight(18);
    obj.rectangle87:setColor("#F5F5DC");
    obj.rectangle87:setXradius(7);
    obj.rectangle87:setYradius(7);
    obj.rectangle87:setName("rectangle87");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout3);
    obj.comboBox1:setField("EstadoArmamento");
    obj.comboBox1:setLeft(331);
    obj.comboBox1:setTop(38);
    obj.comboBox1:setWidth(87);
    obj.comboBox1:setTransparent(true);
    obj.comboBox1:setFontColor("black");
    obj.comboBox1:setItems({'Inexistente','Dormente','Despertado','Controlado'});
    obj.comboBox1:setValues({'I','Do','De','C'});
    obj.comboBox1:setHorzTextAlign("leading");
    obj.comboBox1:setName("comboBox1");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout3);
    obj.label30:setLeft(262);
    obj.label30:setTop(65);
    obj.label30:setWidth(256);
    obj.label30:setText("Condição:");
    obj.label30:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label30, "fontStyle", "bold");
    obj.label30:setFontSize(15);
    obj.label30:setName("label30");

    obj.rectangle88 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle88:setParent(obj.layout3);
    obj.rectangle88:setLeft(335);
    obj.rectangle88:setTop(66);
    obj.rectangle88:setWidth(80);
    obj.rectangle88:setHeight(18);
    obj.rectangle88:setColor("#F5F5DC");
    obj.rectangle88:setXradius(7);
    obj.rectangle88:setYradius(7);
    obj.rectangle88:setName("rectangle88");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout3);
    obj.comboBox2:setField("CondArmamento");
    obj.comboBox2:setLeft(331);
    obj.comboBox2:setTop(63);
    obj.comboBox2:setWidth(85);
    obj.comboBox2:setTransparent(true);
    obj.comboBox2:setFontColor("black");
    obj.comboBox2:setItems({'Normal','Avançado'});
    obj.comboBox2:setValues({'N','A'});
    obj.comboBox2:setHorzTextAlign("leading");
    obj.comboBox2:setName("comboBox2");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout3);
    obj.label31:setLeft(152);
    obj.label31:setTop(90);
    obj.label31:setWidth(256);
    obj.label31:setText("Custo:");
    obj.label31:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label31, "fontStyle", "bold");
    obj.label31:setFontSize(12);
    obj.label31:setName("label31");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout3);
    obj.label32:setField("CustoArmamento");
    obj.label32:setLeft(193);
    obj.label32:setTop(90);
    obj.label32:setWidth(237);
    obj.label32:setHeight(40);
    obj.label32:setFontColor("#5F9EA0");
    obj.label32:setFontSize(11);
    obj.label32:setVertTextAlign("leading");
    obj.label32:setName("label32");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout3);
    obj.label33:setLeft(152);
    obj.label33:setTop(110);
    obj.label33:setWidth(256);
    obj.label33:setText("Bônus:");
    obj.label33:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label33, "fontStyle", "bold");
    obj.label33:setFontSize(12);
    obj.label33:setName("label33");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout3);
    obj.label34:setField("BonusArmamento");
    obj.label34:setLeft(192);
    obj.label34:setTop(110);
    obj.label34:setWidth(237);
    obj.label34:setHeight(40);
    obj.label34:setFontColor("#5F9EA0");
    obj.label34:setFontSize(11);
    obj.label34:setVertTextAlign("leading");
    obj.label34:setName("label34");

    obj.rectangle89 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle89:setParent(obj.layout3);
    obj.rectangle89:setLeft(0);
    obj.rectangle89:setTop(179);
    obj.rectangle89:setWidth(430);
    obj.rectangle89:setHeight(167);
    obj.rectangle89:setColor("#4169E1");
    obj.rectangle89:setName("rectangle89");

    obj.rectangle90 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle90:setParent(obj.layout3);
    obj.rectangle90:setLeft(2);
    obj.rectangle90:setTop(181);
    obj.rectangle90:setWidth(426);
    obj.rectangle90:setHeight(163);
    obj.rectangle90:setColor("black");
    obj.rectangle90:setName("rectangle90");

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.layout3);
    obj.image14:setLeft(4);
    obj.image14:setTop(183);
    obj.image14:setWidth(140);
    obj.image14:setHeight(159);
    obj.image14:setSRC("https://blob.firecast.com.br/blobs/EGIIICJG_3736362/BtKz.gif");
    obj.image14:setShowStyle("autoFit");
    obj.image14.animate = true;
    obj.image14:setName("image14");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout3);
    obj.label35:setLeft(144);
    obj.label35:setTop(184);
    obj.label35:setWidth(286);
    obj.label35:setText("Haki da Observação");
    obj.label35:setFontColor("#D1B27E");
    lfm_setPropAsString(obj.label35, "fontStyle", "bold underline");
    obj.label35:setFontSize(18);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout3);
    obj.button14:setLeft(2);
    obj.button14:setTop(181);
    obj.button14:setWidth(70);
    obj.button14:setText("Descrição");
    obj.button14:setName("button14");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout3);
    obj.label36:setLeft(162);
    obj.label36:setTop(210);
    obj.label36:setWidth(256);
    obj.label36:setText("Tier:");
    obj.label36:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label36, "fontStyle", "bold");
    obj.label36:setFontSize(16);
    obj.label36:setName("label36");

    obj.rectangle91 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle91:setParent(obj.layout3);
    obj.rectangle91:setLeft(199);
    obj.rectangle91:setTop(211);
    obj.rectangle91:setWidth(35);
    obj.rectangle91:setHeight(18);
    obj.rectangle91:setColor("#F5F5DC");
    obj.rectangle91:setXradius(7);
    obj.rectangle91:setYradius(7);
    obj.rectangle91:setName("rectangle91");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setField("tierObservacao");
    obj.edit3:setLeft(199);
    obj.edit3:setTop(210);
    obj.edit3:setWidth(35);
    obj.edit3:setHeight(18);
    obj.edit3:setTransparent(true);
    obj.edit3:setFontColor("black");
    obj.edit3:setFontSize(15);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout3);
    obj.label37:setLeft(156);
    obj.label37:setTop(235);
    obj.label37:setWidth(256);
    obj.label37:setText("%UP:");
    obj.label37:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label37, "fontStyle", "bold");
    obj.label37:setFontSize(16);
    obj.label37:setName("label37");

    obj.rectangle92 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle92:setParent(obj.layout3);
    obj.rectangle92:setLeft(199);
    obj.rectangle92:setTop(236);
    obj.rectangle92:setWidth(35);
    obj.rectangle92:setHeight(18);
    obj.rectangle92:setColor("#F5F5DC");
    obj.rectangle92:setXradius(7);
    obj.rectangle92:setYradius(7);
    obj.rectangle92:setName("rectangle92");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout3);
    obj.edit4:setField("upObsevacao");
    obj.edit4:setLeft(199);
    obj.edit4:setTop(235);
    obj.edit4:setWidth(35);
    obj.edit4:setHeight(18);
    obj.edit4:setTransparent(true);
    obj.edit4:setFontColor("black");
    obj.edit4:setFontSize(15);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout3);
    obj.label38:setLeft(260);
    obj.label38:setTop(210);
    obj.label38:setWidth(256);
    obj.label38:setText("     Estado:");
    obj.label38:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label38, "fontStyle", "bold");
    obj.label38:setFontSize(15);
    obj.label38:setName("label38");

    obj.rectangle93 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle93:setParent(obj.layout3);
    obj.rectangle93:setLeft(335);
    obj.rectangle93:setTop(211);
    obj.rectangle93:setWidth(80);
    obj.rectangle93:setHeight(18);
    obj.rectangle93:setColor("#F5F5DC");
    obj.rectangle93:setXradius(7);
    obj.rectangle93:setYradius(7);
    obj.rectangle93:setName("rectangle93");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout3);
    obj.comboBox3:setField("EstadoObsevacao");
    obj.comboBox3:setLeft(331);
    obj.comboBox3:setTop(208);
    obj.comboBox3:setWidth(87);
    obj.comboBox3:setTransparent(true);
    obj.comboBox3:setFontColor("black");
    obj.comboBox3:setItems({'Inexistente','Dormente','Despertado','Controlado'});
    obj.comboBox3:setValues({'I','Do','De','C'});
    obj.comboBox3:setHorzTextAlign("leading");
    obj.comboBox3:setName("comboBox3");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout3);
    obj.label39:setLeft(262);
    obj.label39:setTop(235);
    obj.label39:setWidth(256);
    obj.label39:setText("Condição:");
    obj.label39:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label39, "fontStyle", "bold");
    obj.label39:setFontSize(15);
    obj.label39:setName("label39");

    obj.rectangle94 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle94:setParent(obj.layout3);
    obj.rectangle94:setLeft(335);
    obj.rectangle94:setTop(236);
    obj.rectangle94:setWidth(80);
    obj.rectangle94:setHeight(18);
    obj.rectangle94:setColor("#F5F5DC");
    obj.rectangle94:setXradius(7);
    obj.rectangle94:setYradius(7);
    obj.rectangle94:setName("rectangle94");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout3);
    obj.comboBox4:setField("CondObsevacao");
    obj.comboBox4:setLeft(331);
    obj.comboBox4:setTop(233);
    obj.comboBox4:setWidth(85);
    obj.comboBox4:setTransparent(true);
    obj.comboBox4:setFontColor("black");
    obj.comboBox4:setItems({'Normal','Avançado'});
    obj.comboBox4:setValues({'N','A'});
    obj.comboBox4:setHorzTextAlign("leading");
    obj.comboBox4:setName("comboBox4");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout3);
    obj.label40:setLeft(152);
    obj.label40:setTop(260);
    obj.label40:setWidth(256);
    obj.label40:setText("Custo:");
    obj.label40:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label40, "fontStyle", "bold");
    obj.label40:setFontSize(12);
    obj.label40:setName("label40");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout3);
    obj.label41:setField("CustoObservacao");
    obj.label41:setLeft(193);
    obj.label41:setTop(260);
    obj.label41:setWidth(237);
    obj.label41:setHeight(40);
    obj.label41:setFontColor("#5F9EA0");
    obj.label41:setFontSize(11);
    obj.label41:setVertTextAlign("leading");
    obj.label41:setName("label41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout3);
    obj.label42:setLeft(152);
    obj.label42:setTop(280);
    obj.label42:setWidth(256);
    obj.label42:setText("Bônus:");
    obj.label42:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label42, "fontStyle", "bold");
    obj.label42:setFontSize(12);
    obj.label42:setName("label42");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout3);
    obj.label43:setField("BonusObservacao");
    obj.label43:setLeft(192);
    obj.label43:setTop(280);
    obj.label43:setWidth(237);
    obj.label43:setHeight(40);
    obj.label43:setFontColor("#5F9EA0");
    obj.label43:setFontSize(11);
    obj.label43:setVertTextAlign("leading");
    obj.label43:setName("label43");

    obj.rectangle95 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle95:setParent(obj.layout3);
    obj.rectangle95:setLeft(0);
    obj.rectangle95:setTop(358);
    obj.rectangle95:setWidth(430);
    obj.rectangle95:setHeight(167);
    obj.rectangle95:setColor("#4169E1");
    obj.rectangle95:setName("rectangle95");

    obj.rectangle96 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle96:setParent(obj.layout3);
    obj.rectangle96:setLeft(2);
    obj.rectangle96:setTop(360);
    obj.rectangle96:setWidth(426);
    obj.rectangle96:setHeight(163);
    obj.rectangle96:setColor("black");
    obj.rectangle96:setName("rectangle96");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.layout3);
    obj.image15:setLeft(4);
    obj.image15:setTop(362);
    obj.image15:setWidth(140);
    obj.image15:setHeight(159);
    obj.image15:setSRC("https://blob.firecast.com.br/blobs/TPUWRIHO_3736361/haki-luffy.gif");
    obj.image15:setShowStyle("autoFit");
    obj.image15.animate = true;
    obj.image15:setName("image15");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout3);
    obj.label44:setLeft(144);
    obj.label44:setTop(363);
    obj.label44:setWidth(286);
    obj.label44:setText("Haki do Conquistador");
    obj.label44:setFontColor("#D1B27E");
    lfm_setPropAsString(obj.label44, "fontStyle", "bold underline");
    obj.label44:setFontSize(18);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout3);
    obj.button15:setLeft(2);
    obj.button15:setTop(360);
    obj.button15:setWidth(70);
    obj.button15:setText("Descrição");
    obj.button15:setName("button15");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout3);
    obj.label45:setLeft(162);
    obj.label45:setTop(398);
    obj.label45:setWidth(256);
    obj.label45:setText("Tier:");
    obj.label45:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label45, "fontStyle", "bold");
    obj.label45:setFontSize(16);
    obj.label45:setName("label45");

    obj.rectangle97 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle97:setParent(obj.layout3);
    obj.rectangle97:setLeft(199);
    obj.rectangle97:setTop(399);
    obj.rectangle97:setWidth(35);
    obj.rectangle97:setHeight(18);
    obj.rectangle97:setColor("#F5F5DC");
    obj.rectangle97:setXradius(7);
    obj.rectangle97:setYradius(7);
    obj.rectangle97:setName("rectangle97");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout3);
    obj.edit5:setField("tierConquistador");
    obj.edit5:setLeft(199);
    obj.edit5:setTop(398);
    obj.edit5:setWidth(35);
    obj.edit5:setHeight(18);
    obj.edit5:setTransparent(true);
    obj.edit5:setFontColor("black");
    obj.edit5:setFontSize(15);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout3);
    obj.label46:setLeft(156);
    obj.label46:setTop(423);
    obj.label46:setWidth(256);
    obj.label46:setText("%UP:");
    obj.label46:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label46, "fontStyle", "bold");
    obj.label46:setFontSize(16);
    obj.label46:setName("label46");

    obj.rectangle98 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle98:setParent(obj.layout3);
    obj.rectangle98:setLeft(199);
    obj.rectangle98:setTop(424);
    obj.rectangle98:setWidth(35);
    obj.rectangle98:setHeight(18);
    obj.rectangle98:setColor("#F5F5DC");
    obj.rectangle98:setXradius(7);
    obj.rectangle98:setYradius(7);
    obj.rectangle98:setName("rectangle98");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout3);
    obj.edit6:setField("upConquistador");
    obj.edit6:setLeft(199);
    obj.edit6:setTop(423);
    obj.edit6:setWidth(35);
    obj.edit6:setHeight(18);
    obj.edit6:setTransparent(true);
    obj.edit6:setFontColor("black");
    obj.edit6:setFontSize(15);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setType("number");
    obj.edit6:setName("edit6");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout3);
    obj.label47:setLeft(260);
    obj.label47:setTop(398);
    obj.label47:setWidth(256);
    obj.label47:setText("     Estado:");
    obj.label47:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label47, "fontStyle", "bold");
    obj.label47:setFontSize(15);
    obj.label47:setName("label47");

    obj.rectangle99 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle99:setParent(obj.layout3);
    obj.rectangle99:setLeft(335);
    obj.rectangle99:setTop(399);
    obj.rectangle99:setWidth(80);
    obj.rectangle99:setHeight(18);
    obj.rectangle99:setColor("#F5F5DC");
    obj.rectangle99:setXradius(7);
    obj.rectangle99:setYradius(7);
    obj.rectangle99:setName("rectangle99");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout3);
    obj.comboBox5:setField("EstadoConquistador");
    obj.comboBox5:setLeft(331);
    obj.comboBox5:setTop(396);
    obj.comboBox5:setWidth(87);
    obj.comboBox5:setTransparent(true);
    obj.comboBox5:setFontColor("black");
    obj.comboBox5:setItems({'Inexistente','Dormente','Despertado','Controlado'});
    obj.comboBox5:setValues({'I','Do','De','C'});
    obj.comboBox5:setHorzTextAlign("leading");
    obj.comboBox5:setName("comboBox5");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout3);
    obj.label48:setLeft(262);
    obj.label48:setTop(423);
    obj.label48:setWidth(256);
    obj.label48:setText("Condição:");
    obj.label48:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label48, "fontStyle", "bold");
    obj.label48:setFontSize(15);
    obj.label48:setName("label48");

    obj.rectangle100 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle100:setParent(obj.layout3);
    obj.rectangle100:setLeft(335);
    obj.rectangle100:setTop(424);
    obj.rectangle100:setWidth(80);
    obj.rectangle100:setHeight(18);
    obj.rectangle100:setColor("#F5F5DC");
    obj.rectangle100:setXradius(7);
    obj.rectangle100:setYradius(7);
    obj.rectangle100:setName("rectangle100");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout3);
    obj.comboBox6:setField("CondConquistador");
    obj.comboBox6:setLeft(331);
    obj.comboBox6:setTop(421);
    obj.comboBox6:setWidth(85);
    obj.comboBox6:setTransparent(true);
    obj.comboBox6:setFontColor("black");
    obj.comboBox6:setItems({'Normal','Avançado'});
    obj.comboBox6:setValues({'N','A'});
    obj.comboBox6:setHorzTextAlign("leading");
    obj.comboBox6:setName("comboBox6");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout3);
    obj.label49:setLeft(152);
    obj.label49:setTop(448);
    obj.label49:setWidth(256);
    obj.label49:setText("Custo:");
    obj.label49:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label49, "fontStyle", "bold");
    obj.label49:setFontSize(12);
    obj.label49:setName("label49");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout3);
    obj.label50:setField("CustoConquistador");
    obj.label50:setLeft(193);
    obj.label50:setTop(448);
    obj.label50:setWidth(237);
    obj.label50:setHeight(40);
    obj.label50:setFontColor("#5F9EA0");
    obj.label50:setFontSize(11);
    obj.label50:setVertTextAlign("leading");
    obj.label50:setName("label50");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout3);
    obj.label51:setLeft(152);
    obj.label51:setTop(468);
    obj.label51:setWidth(256);
    obj.label51:setText("Bônus:");
    obj.label51:setFontColor("#5F9EA0");
    lfm_setPropAsString(obj.label51, "fontStyle", "bold");
    obj.label51:setFontSize(12);
    obj.label51:setName("label51");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout3);
    obj.label52:setField("BonusConquistador");
    obj.label52:setLeft(192);
    obj.label52:setTop(468);
    obj.label52:setWidth(237);
    obj.label52:setHeight(60);
    obj.label52:setFontColor("#5F9EA0");
    obj.label52:setFontSize(11);
    obj.label52:setVertTextAlign("leading");
    obj.label52:setName("label52");

    obj.Equipamento = GUI.fromHandle(_obj_newObject("layout"));
    obj.Equipamento:setParent(obj);
    obj.Equipamento:setName("Equipamento");
    obj.Equipamento:setLeft(600);
    obj.Equipamento:setTop(150);
    obj.Equipamento:setWidth(600);
    obj.Equipamento:setHeight(550);
    obj.Equipamento:setVisible(false);

    obj.rectangle101 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle101:setParent(obj.Equipamento);
    obj.rectangle101:setAlign("client");
    obj.rectangle101:setColor("#404040");
    obj.rectangle101:setXradius(7);
    obj.rectangle101:setYradius(7);
    obj.rectangle101:setName("rectangle101");

    obj.buttonSair = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.buttonSair:setParent(obj.Equipamento);
    obj.buttonSair:setName("buttonSair");
    obj.buttonSair:setLeft(530);
    obj.buttonSair:setTop(2);
    obj.buttonSair:setWidth(60);
    obj.buttonSair:setHeight(25);
    obj.buttonSair:setColor("crimson");
    obj.buttonSair:setXradius(7);
    obj.buttonSair:setYradius(7);

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.Equipamento);
    obj.label53:setLeft(530);
    obj.label53:setTop(-1);
    obj.label53:setWidth(60);
    obj.label53:setHeight(25);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setText("x");
    obj.label53:setFontColor("Black");
    obj.label53:setFontSize(21);
    obj.label53:setName("label53");

    obj.rectangle102 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle102:setParent(obj.Equipamento);
    obj.rectangle102:setLeft(1);
    obj.rectangle102:setTop(28);
    obj.rectangle102:setWidth(208);
    obj.rectangle102:setHeight(520);
    obj.rectangle102:setColor("black");
    obj.rectangle102:setXradius(4);
    obj.rectangle102:setYradius(4);
    obj.rectangle102:setName("rectangle102");

    obj.rectangle103 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle103:setParent(obj.Equipamento);
    obj.rectangle103:setLeft(5);
    obj.rectangle103:setTop(32);
    obj.rectangle103:setWidth(200);
    obj.rectangle103:setHeight(512);
    obj.rectangle103:setColor("#404040");
    obj.rectangle103:setXradius(4);
    obj.rectangle103:setYradius(4);
    obj.rectangle103:setName("rectangle103");

    obj.fotoEquip = GUI.fromHandle(_obj_newObject("image"));
    obj.fotoEquip:setParent(obj.Equipamento);
    obj.fotoEquip:setName("fotoEquip");
    obj.fotoEquip:setLeft(5);
    obj.fotoEquip:setTop(32);
    obj.fotoEquip:setWidth(50);
    obj.fotoEquip:setHeight(128);
    obj.fotoEquip:setScale(4);
    obj.fotoEquip:setEditable(true);
    obj.fotoEquip:setStyle("proportional");

    obj.rectangle104 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle104:setParent(obj.Equipamento);
    obj.rectangle104:setLeft(205);
    obj.rectangle104:setTop(28);
    obj.rectangle104:setWidth(5);
    obj.rectangle104:setHeight(520);
    obj.rectangle104:setColor("black");
    obj.rectangle104:setName("rectangle104");

    obj.editEquip = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.editEquip:setParent(obj.Equipamento);
    obj.editEquip:setName("editEquip");
    obj.editEquip:setField("");
    obj.editEquip:setLeft(210);
    obj.editEquip:setTop(28);
    obj.editEquip:setWidth(390);
    obj.editEquip:setHeight(520);
    obj.editEquip.backgroundColor = "black";
    obj.editEquip.defaultFontColor = "white";
    obj.editEquip.animateImages = true;

    obj.Haki = GUI.fromHandle(_obj_newObject("layout"));
    obj.Haki:setParent(obj);
    obj.Haki:setName("Haki");
    obj.Haki:setLeft(600);
    obj.Haki:setTop(150);
    obj.Haki:setWidth(600);
    obj.Haki:setHeight(550);
    obj.Haki:setVisible(false);

    obj.rectangle105 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle105:setParent(obj.Haki);
    obj.rectangle105:setAlign("client");
    obj.rectangle105:setColor("#404040");
    obj.rectangle105:setXradius(7);
    obj.rectangle105:setYradius(7);
    obj.rectangle105:setName("rectangle105");

    obj.buttonExit = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.buttonExit:setParent(obj.Haki);
    obj.buttonExit:setName("buttonExit");
    obj.buttonExit:setLeft(530);
    obj.buttonExit:setTop(2);
    obj.buttonExit:setWidth(60);
    obj.buttonExit:setHeight(25);
    obj.buttonExit:setColor("crimson");
    obj.buttonExit:setXradius(7);
    obj.buttonExit:setYradius(7);

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.Haki);
    obj.label54:setLeft(530);
    obj.label54:setTop(-1);
    obj.label54:setWidth(60);
    obj.label54:setHeight(25);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setText("x");
    obj.label54:setFontColor("Black");
    obj.label54:setFontSize(21);
    obj.label54:setName("label54");

    obj.editHaki = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.editHaki:setParent(obj.Haki);
    obj.editHaki:setName("editHaki");
    obj.editHaki:setField("");
    obj.editHaki:setLeft(2);
    obj.editHaki:setTop(30);
    obj.editHaki:setWidth(598);
    obj.editHaki:setHeight(520);
    obj.editHaki.backgroundColor = "#404040";
    obj.editHaki.defaultFontColor = "white";
    obj.editHaki.animateImages = true;
    obj.editHaki.readOnly = false;
    obj.editHaki.showToolbar = true;

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
    obj.dataLink36:setField("ForcaDeVontadeTreino");
    obj.dataLink36:setDefaultValue("0");
    obj.dataLink36:setName("dataLink36");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj);
    obj.dataLink37:setField("FotoChapeu");
    obj.dataLink37:setDefaultValue("https://blob.firecast.com.br/blobs/BSEWIEVG_3735362/Chapeu.png");
    obj.dataLink37:setName("dataLink37");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj);
    obj.dataLink38:setField("FotoColar");
    obj.dataLink38:setDefaultValue("https://blob.firecast.com.br/blobs/ELGUBICD_3735361/Colar.png");
    obj.dataLink38:setName("dataLink38");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj);
    obj.dataLink39:setField("FotoRoupa");
    obj.dataLink39:setDefaultValue("https://blob.firecast.com.br/blobs/SIRPGIRT_3735359/Ropa.png");
    obj.dataLink39:setName("dataLink39");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj);
    obj.dataLink40:setField("FotoMaoPrimaria");
    obj.dataLink40:setDefaultValue("https://blob.firecast.com.br/blobs/SMOQJGJO_3735363/M_o.png");
    obj.dataLink40:setName("dataLink40");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj);
    obj.dataLink41:setField("FotoCalca");
    obj.dataLink41:setDefaultValue("https://blob.firecast.com.br/blobs/TQPAWOQT_3735360/Car_a.png");
    obj.dataLink41:setName("dataLink41");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj);
    obj.dataLink42:setField("FotoBota");
    obj.dataLink42:setDefaultValue("https://blob.firecast.com.br/blobs/OHNVCDNS_3735367/Bota.png");
    obj.dataLink42:setName("dataLink42");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj);
    obj.dataLink43:setField("FotoRosto");
    obj.dataLink43:setDefaultValue("https://blob.firecast.com.br/blobs/NHQFHSIH_3735364/Mascara.png");
    obj.dataLink43:setName("dataLink43");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj);
    obj.dataLink44:setField("FotoBrinco");
    obj.dataLink44:setDefaultValue("https://blob.firecast.com.br/blobs/LQUKWDCJ_3735365/Binco.png");
    obj.dataLink44:setName("dataLink44");

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj);
    obj.dataLink45:setField("FotoCapa");
    obj.dataLink45:setDefaultValue("https://blob.firecast.com.br/blobs/SEKLBTCI_3735802/Kapa.png");
    obj.dataLink45:setName("dataLink45");

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj);
    obj.dataLink46:setField("FotoMaoSecundaria");
    obj.dataLink46:setDefaultValue("https://blob.firecast.com.br/blobs/RRQKGODJ_3735460/M_o.png");
    obj.dataLink46:setName("dataLink46");

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj);
    obj.dataLink47:setField("FotoLuva");
    obj.dataLink47:setDefaultValue("https://blob.firecast.com.br/blobs/BCNCKKRT_3735366/Luva.png");
    obj.dataLink47:setName("dataLink47");

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj);
    obj.dataLink48:setField("FotoAnel");
    obj.dataLink48:setDefaultValue("https://blob.firecast.com.br/blobs/QLBWNJUT_3735368/Anal.png");
    obj.dataLink48:setName("dataLink48");

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj);
    obj.dataLink49:setField("tierArmamento");
    obj.dataLink49:setDefaultValue("0");
    obj.dataLink49:setName("dataLink49");

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj);
    obj.dataLink50:setField("upArmamento");
    obj.dataLink50:setDefaultValue("0");
    obj.dataLink50:setName("dataLink50");

    obj.dataLink51 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj);
    obj.dataLink51:setField("EstadoArmamento");
    obj.dataLink51:setDefaultValue("I");
    obj.dataLink51:setName("dataLink51");

    obj.dataLink52 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj);
    obj.dataLink52:setField("CondArmamento");
    obj.dataLink52:setDefaultValue("N");
    obj.dataLink52:setName("dataLink52");

    obj.dataLink53 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj);
    obj.dataLink53:setField("tierObservacao");
    obj.dataLink53:setDefaultValue("0");
    obj.dataLink53:setName("dataLink53");

    obj.dataLink54 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj);
    obj.dataLink54:setField("upObsevacao");
    obj.dataLink54:setDefaultValue("0");
    obj.dataLink54:setName("dataLink54");

    obj.dataLink55 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj);
    obj.dataLink55:setField("EstadoObsevacao");
    obj.dataLink55:setDefaultValue("I");
    obj.dataLink55:setName("dataLink55");

    obj.dataLink56 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj);
    obj.dataLink56:setField("CondObsevacao");
    obj.dataLink56:setDefaultValue("N");
    obj.dataLink56:setName("dataLink56");

    obj.dataLink57 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj);
    obj.dataLink57:setField("tierConquistador");
    obj.dataLink57:setDefaultValue("0");
    obj.dataLink57:setName("dataLink57");

    obj.dataLink58 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj);
    obj.dataLink58:setField("upConquistador");
    obj.dataLink58:setDefaultValue("0");
    obj.dataLink58:setName("dataLink58");

    obj.dataLink59 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj);
    obj.dataLink59:setField("EstadoConquistador");
    obj.dataLink59:setDefaultValue("I");
    obj.dataLink59:setName("dataLink59");

    obj.dataLink60 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj);
    obj.dataLink60:setField("CondConquistador");
    obj.dataLink60:setDefaultValue("N");
    obj.dataLink60:setName("dataLink60");

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

    obj._e_event27 = obj.ForcaBase:addEventListener("onChange",
        function ()
            AlterarValorTotal('Forca')
        end);

    obj._e_event28 = obj.AgilidadeBase:addEventListener("onChange",
        function ()
            AlterarValorTotal('Agilidade')
        end);

    obj._e_event29 = obj.VigorBase:addEventListener("onChange",
        function ()
            AlterarValorTotal('Vigor')
        end);

    obj._e_event30 = obj.CombateBase:addEventListener("onChange",
        function ()
            AlterarValorTotal('Combate')
        end);

    obj._e_event31 = obj.PercepcaoBase:addEventListener("onChange",
        function ()
            AlterarValorTotal('Percepcao')
        end);

    obj._e_event32 = obj.CarismaBase:addEventListener("onChange",
        function ()
            AlterarValorTotal('Carisma')
        end);

    obj._e_event33 = obj.InteligenciaBase:addEventListener("onChange",
        function ()
            AlterarValorTotal('Inteligencia')
        end);

    obj._e_event34 = obj.PrecisaoBase:addEventListener("onChange",
        function ()
            AlterarValorTotal('Precisao')
        end);

    obj._e_event35 = obj.ForcaDeVontadeBase:addEventListener("onChange",
        function ()
            AlterarValorTotal('ForcaDeVontade')
        end);

    obj._e_event36 = obj.ForcaPassivo:addEventListener("onChange",
        function ()
            AlterarValorTotal('Forca')
        end);

    obj._e_event37 = obj.AgilidadePassivo:addEventListener("onChange",
        function ()
            AlterarValorTotal('Agilidade')
        end);

    obj._e_event38 = obj.VigorPassivo:addEventListener("onChange",
        function ()
            AlterarValorTotal('Vigor')
        end);

    obj._e_event39 = obj.CombatePassivo:addEventListener("onChange",
        function ()
            AlterarValorTotal('Combate')
        end);

    obj._e_event40 = obj.PercepcaoPassivo:addEventListener("onChange",
        function ()
            AlterarValorTotal('Percepcao')
        end);

    obj._e_event41 = obj.CarismaPassivo:addEventListener("onChange",
        function ()
            AlterarValorTotal('Carisma')
        end);

    obj._e_event42 = obj.InteligenciaPassivo:addEventListener("onChange",
        function ()
            AlterarValorTotal('Inteligencia')
        end);

    obj._e_event43 = obj.PrecisaoPassivo:addEventListener("onChange",
        function ()
            AlterarValorTotal('Precisao')
        end);

    obj._e_event44 = obj.ForcaDeVontadePassivo:addEventListener("onChange",
        function ()
            AlterarValorTotal('ForcaDeVontade')
        end);

    obj._e_event45 = obj.ForcaEquips:addEventListener("onChange",
        function ()
            AlterarValorTotal('Forca')
        end);

    obj._e_event46 = obj.AgilidadeEquips:addEventListener("onChange",
        function ()
            AlterarValorTotal('Agilidade')
        end);

    obj._e_event47 = obj.VigorEquips:addEventListener("onChange",
        function ()
            AlterarValorTotal('Vigor')
        end);

    obj._e_event48 = obj.CombateEquips:addEventListener("onChange",
        function ()
            AlterarValorTotal('Combate')
        end);

    obj._e_event49 = obj.PercepcaoEquips:addEventListener("onChange",
        function ()
            AlterarValorTotal('Percepcao')
        end);

    obj._e_event50 = obj.CarismaEquips:addEventListener("onChange",
        function ()
            AlterarValorTotal('Carisma')
        end);

    obj._e_event51 = obj.InteligenciaEquips:addEventListener("onChange",
        function ()
            AlterarValorTotal('Inteligencia')
        end);

    obj._e_event52 = obj.PrecisaoEquips:addEventListener("onChange",
        function ()
            AlterarValorTotal('Precisao')
        end);

    obj._e_event53 = obj.ForcaDeVontadeEquips:addEventListener("onChange",
        function ()
            AlterarValorTotal('ForcaDeVontade')
        end);

    obj._e_event54 = obj.ForcaTreino:addEventListener("onChange",
        function ()
            AlterarValorTotal('Forca')
        end);

    obj._e_event55 = obj.AgilidadeTreino:addEventListener("onChange",
        function ()
            AlterarValorTotal('Agilidade')
        end);

    obj._e_event56 = obj.VigorTreino:addEventListener("onChange",
        function ()
            AlterarValorTotal('Vigor')
        end);

    obj._e_event57 = obj.CombateTreino:addEventListener("onChange",
        function ()
            AlterarValorTotal('Combate')
        end);

    obj._e_event58 = obj.PercepcaoTreino:addEventListener("onChange",
        function ()
            AlterarValorTotal('Percepcao')
        end);

    obj._e_event59 = obj.CarismaTreino:addEventListener("onChange",
        function ()
            AlterarValorTotal('Carisma')
        end);

    obj._e_event60 = obj.InteligenciaTreino:addEventListener("onChange",
        function ()
            AlterarValorTotal('Inteligencia')
        end);

    obj._e_event61 = obj.PrecisaoTreino:addEventListener("onChange",
        function ()
            AlterarValorTotal('Precisao')
        end);

    obj._e_event62 = obj.ForcaDeVontadeTreino:addEventListener("onChange",
        function ()
            AlterarValorTotal('ForcaDeVontade')
        end);

    obj._e_event63 = obj.ForcaTotal:addEventListener("onChange",
        function ()
            CalcularPontosTotais()
        end);

    obj._e_event64 = obj.AgilidadeTotal:addEventListener("onChange",
        function ()
            CalcularPontosTotais()
        end);

    obj._e_event65 = obj.VigorTotal:addEventListener("onChange",
        function ()
            CalcularPontosTotais(); CalcularHpEngHaki()
        end);

    obj._e_event66 = obj.CombateTotal:addEventListener("onChange",
        function ()
            CalcularPontosTotais()
        end);

    obj._e_event67 = obj.PercepcaoTotal:addEventListener("onChange",
        function ()
            CalcularPontosTotais()
        end);

    obj._e_event68 = obj.CarismaTotal:addEventListener("onChange",
        function ()
            CalcularPontosTotais()
        end);

    obj._e_event69 = obj.InteligenciaTotal:addEventListener("onChange",
        function ()
            CalcularPontosTotais()
        end);

    obj._e_event70 = obj.PrecisaoTotal:addEventListener("onChange",
        function ()
            CalcularPontosTotais()
        end);

    obj._e_event71 = obj.ForcaDeVontadeTotal:addEventListener("onChange",
        function ()
            CalcularPontosTotais(); CalcularHpEngHaki()
        end);

    obj._e_event72 = obj.DefButton:addEventListener("onMouseEnter",
        function ()
            self.DefButton.text = 'Rolar Defesa'
        end);

    obj._e_event73 = obj.DefButton:addEventListener("onMouseLeave",
        function ()
            self.DefButton.text = 'Defesa'
        end);

    obj._e_event74 = obj.DefButton:addEventListener("onClick",
        function (event)
            RolarAtributo('Defesa')
        end);

    obj._e_event75 = obj.button1:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoChapeu'; self.editEquip.field = 'Chapeu'
        end);

    obj._e_event76 = obj.button2:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoRosto'; self.editEquip.field = 'Rosto'
        end);

    obj._e_event77 = obj.button3:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoColar'; self.editEquip.field = 'Colar'
        end);

    obj._e_event78 = obj.button4:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoBrinco'; self.editEquip.field = 'Brinco'
        end);

    obj._e_event79 = obj.button5:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoRoupa'; self.editEquip.field = 'Roupa'
        end);

    obj._e_event80 = obj.button6:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoCapa'; self.editEquip.field = 'Capa'
        end);

    obj._e_event81 = obj.button7:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoMaoPrimaria'; self.editEquip.field = 'MaoP'
        end);

    obj._e_event82 = obj.button8:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoMaoSecundaria'; self.editEquip.field = 'MaoS'
        end);

    obj._e_event83 = obj.button9:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoCalca'; self.editEquip.field = 'Calca'
        end);

    obj._e_event84 = obj.button10:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoLuva'; self.editEquip.field = 'Luva'
        end);

    obj._e_event85 = obj.button11:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoBota'; self.editEquip.field = 'Bota'
        end);

    obj._e_event86 = obj.button12:addEventListener("onClick",
        function (event)
            self.Equipamento.visible = true; self.fotoEquip.field = 'FotoAnel'; self.editEquip.field = 'Anel'
        end);

    obj._e_event87 = obj.button13:addEventListener("onClick",
        function (event)
            self.Haki.visible = true; self.editHaki.field = 'Armamento'
        end);

    obj._e_event88 = obj.button14:addEventListener("onClick",
        function (event)
            self.Haki.visible = true; self.editHaki.field = 'Observacao'
        end);

    obj._e_event89 = obj.button15:addEventListener("onClick",
        function (event)
            self.Haki.visible = true; self.editHaki.field = 'Conquistador'
        end);

    obj._e_event90 = obj.buttonSair:addEventListener("onMouseEnter",
        function ()
            self.buttonSair.color = '#f3214b'
        end);

    obj._e_event91 = obj.buttonSair:addEventListener("onMouseLeave",
        function ()
            self.buttonSair.color = 'crimson'
        end);

    obj._e_event92 = obj.buttonSair:addEventListener("onClick",
        function (event)
            self.Equipamento.visible= false
        end);

    obj._e_event93 = obj.buttonExit:addEventListener("onMouseEnter",
        function ()
            self.buttonExit.color = '#f3214b'
        end);

    obj._e_event94 = obj.buttonExit:addEventListener("onMouseLeave",
        function ()
            self.buttonExit.color = 'crimson'
        end);

    obj._e_event95 = obj.buttonExit:addEventListener("onClick",
        function (event)
            self.Haki.visible= false
        end);

    obj._e_event96 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaBase == "" then sheet.ForcaBase = 1 end
        end);

    obj._e_event97 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.AgilidadeBase == "" then sheet.AgilidadeBase = 1 end
        end);

    obj._e_event98 = obj.dataLink3:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.VigorBase == "" then sheet.VigorBase = 1 end
        end);

    obj._e_event99 = obj.dataLink4:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CombateBase == "" then sheet.CombateBase = 1 end
        end);

    obj._e_event100 = obj.dataLink5:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PercepcaoBase == "" then sheet.PercepcaoBase = 1 end
        end);

    obj._e_event101 = obj.dataLink6:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CarismaBase == "" then sheet.CarismaBase = 1 end
        end);

    obj._e_event102 = obj.dataLink7:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.InteligenciaBase == "" then sheet.InteligenciaBase = 1 end
        end);

    obj._e_event103 = obj.dataLink8:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PrecisaoBase == "" then sheet.PrecisaoBase = 1 end
        end);

    obj._e_event104 = obj.dataLink9:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaDeVontadeBase == "" then sheet.ForcaDeVontadeBase = 1 end
        end);

    obj._e_event105 = obj.dataLink10:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaPassivo == "" then sheet.ForcaPassivo = 0 end
        end);

    obj._e_event106 = obj.dataLink11:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.AgilidadePassivo == "" then sheet.AgilidadePassivo = 0 end
        end);

    obj._e_event107 = obj.dataLink12:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.VigorPassivo == "" then sheet.VigorPassivo = 0 end
        end);

    obj._e_event108 = obj.dataLink13:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CombatePassivo == "" then sheet.CombatePassivo = 0 end
        end);

    obj._e_event109 = obj.dataLink14:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PercepcaoPassivo == "" then sheet.PercepcaoPassivo = 0 end
        end);

    obj._e_event110 = obj.dataLink15:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CarismaPassivo == "" then sheet.CarismaPassivo = 0 end
        end);

    obj._e_event111 = obj.dataLink16:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.InteligenciaPassivo == "" then sheet.InteligenciaPassivo = 0 end
        end);

    obj._e_event112 = obj.dataLink17:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PrecisaoPassivo == "" then sheet.PrecisaoPassivo = 0 end
        end);

    obj._e_event113 = obj.dataLink18:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaDeVontadePassivo == "" then sheet.ForcaDeVontadePassivo = 0 end
        end);

    obj._e_event114 = obj.dataLink19:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaEquips == "" then sheet.ForcaEquips = 0 end
        end);

    obj._e_event115 = obj.dataLink20:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.AgilidadeEquips == "" then sheet.AgilidadeEquips = 0 end
        end);

    obj._e_event116 = obj.dataLink21:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.VigorEquips == "" then sheet.VigorEquips = 0 end
        end);

    obj._e_event117 = obj.dataLink22:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CombateEquips == "" then sheet.CombateEquips = 0 end
        end);

    obj._e_event118 = obj.dataLink23:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PercepcaoEquips == "" then sheet.PercepcaoEquips = 0 end
        end);

    obj._e_event119 = obj.dataLink24:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CarismaEquips == "" then sheet.CarismaEquips = 0 end
        end);

    obj._e_event120 = obj.dataLink25:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.InteligenciaEquips == "" then sheet.InteligenciaEquips = 0 end
        end);

    obj._e_event121 = obj.dataLink26:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PrecisaoEquips == "" then sheet.PrecisaoEquips = 0 end
        end);

    obj._e_event122 = obj.dataLink27:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaDeVontadeEquips == "" then sheet.ForcaDeVontadeEquips = 0 end
        end);

    obj._e_event123 = obj.dataLink28:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaTreino == "" then sheet.ForcaTreino = 0 end
        end);

    obj._e_event124 = obj.dataLink29:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.AgilidadeTreino == "" then sheet.AgilidadeTreino = 0 end
        end);

    obj._e_event125 = obj.dataLink30:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.VigorTreino == "" then sheet.VigorTreino = 0 end
        end);

    obj._e_event126 = obj.dataLink31:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CombateTreino == "" then sheet.CombateTreino = 0 end
        end);

    obj._e_event127 = obj.dataLink32:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PercepcaoTreino == "" then sheet.PercepcaoTreino = 0 end
        end);

    obj._e_event128 = obj.dataLink33:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.CarismaTreino == "" then sheet.CarismaTreino = 0 end
        end);

    obj._e_event129 = obj.dataLink34:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.InteligenciaTreino == "" then sheet.InteligenciaTreino = 0 end
        end);

    obj._e_event130 = obj.dataLink35:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.PrecisaoTreino == "" then sheet.PrecisaoTreino = 0 end
        end);

    obj._e_event131 = obj.dataLink36:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.ForcaDeVontadeTreino == "" then sheet.ForcaDeVontadeTreino = 0 end
        end);

    obj._e_event132 = obj.dataLink37:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoChapeu == nil then sheet.FotoChapeu = "https://blob.firecast.com.br/blobs/BSEWIEVG_3735362/Chapeu.png" end
        end);

    obj._e_event133 = obj.dataLink38:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoColar == nil then sheet.FotoColar = "https://blob.firecast.com.br/blobs/ELGUBICD_3735361/Colar.png" end
        end);

    obj._e_event134 = obj.dataLink39:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoRoupa == nil then sheet.FotoRoupa = "https://blob.firecast.com.br/blobs/SIRPGIRT_3735359/Ropa.png" end
        end);

    obj._e_event135 = obj.dataLink40:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoMaoPrimaria == nil then sheet.FotoMaoPrimaria = "https://blob.firecast.com.br/blobs/SMOQJGJO_3735363/M_o.png" end
        end);

    obj._e_event136 = obj.dataLink41:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoCalca == nil then sheet.FotoCalca = "https://blob.firecast.com.br/blobs/TQPAWOQT_3735360/Car_a.png" end
        end);

    obj._e_event137 = obj.dataLink42:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoBota == nil then sheet.FotoBota = "https://blob.firecast.com.br/blobs/OHNVCDNS_3735367/Bota.png" end
        end);

    obj._e_event138 = obj.dataLink43:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoRosto == nil then sheet.FotoRosto = "https://blob.firecast.com.br/blobs/NHQFHSIH_3735364/Mascara.png" end
        end);

    obj._e_event139 = obj.dataLink44:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoBrinco == nil then sheet.FotoBrinco = "https://blob.firecast.com.br/blobs/LQUKWDCJ_3735365/Binco.png" end
        end);

    obj._e_event140 = obj.dataLink45:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoCapa == nil then sheet.FotoCapa = "https://blob.firecast.com.br/blobs/SEKLBTCI_3735802/Kapa.png" end
        end);

    obj._e_event141 = obj.dataLink46:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoMaoSecundaria == nil then sheet.FotoMaoSecundaria = "https://blob.firecast.com.br/blobs/RRQKGODJ_3735460/M_o.png" end
        end);

    obj._e_event142 = obj.dataLink47:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoCinto == nil then sheet.FotoCinto = "https://blob.firecast.com.br/blobs/BCNCKKRT_3735366/Luva.png" end
        end);

    obj._e_event143 = obj.dataLink48:addEventListener("onChange",
        function (field, oldValue, newValue)
            if sheet.FotoAnel == nil then sheet.FotoAnel = "https://blob.firecast.com.br/blobs/QLBWNJUT_3735368/Anal.png" end
        end);

    obj._e_event144 = obj.dataLink49:addEventListener("onChange",
        function (field, oldValue, newValue)
            if (sheet.tierArmamento == "" and not (sheet.EstadoArmamento == "I" or sheet.EstadoArmamento == "Do")) then
            				sheet.tierArmamento = 1 else sheet.tierArmamento = 0 end
            			sheet.BonusArmamento = "+".. (sheet.tierArmamento * 5) .." de dano ou em rolagens de resistência"
            			sheet.CustoArmamento = "-".. (sheet.tierArmamento * 3) .." da barra de haki"
        end);

    obj._e_event145 = obj.dataLink53:addEventListener("onChange",
        function (field, oldValue, newValue)
            if (sheet.tierObservacao == "" and not (sheet.EstadoObsevacao == "I" or sheet.EstadoObsevacao == "Do")) then
            				sheet.tierObservacao = 1 else sheet.tierObservacao = 0 end
            			sheet.BonusObservacao = "+".. (sheet.tierObservacao) .." de acerto, esquiva ou em rolagens de     percepção."
            			sheet.CustoObservacao = "-".. (sheet.tierObservacao * 3) .." da barra de haki"
        end);

    obj._e_event146 = obj.dataLink57:addEventListener("onChange",
        function (field, oldValue, newValue)
            if (sheet.tierConquistador == "" and not (sheet.EstadoConquistador == "I" or sheet.EstadoConquistador == "Do")) then
            				sheet.tierConquistador = 1 else sheet.tierConquistador = 0 end
            			sheet.BonusConquistador = "Numa área de 12m, todos fazem um teste de resistência (DT 1d20+ FdV("..sheet.ForcaDeVontadeTotal..")+ ".. sheet.tierConquistador .."). Se passarem ficam acordados; se falharem desmaiam."
            			sheet.CustoConquistador = "-".. (sheet.tierConquistador * 3) .." da barra de haki"
        end);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event146);
        __o_rrpgObjs.removeEventListenerById(self._e_event145);
        __o_rrpgObjs.removeEventListenerById(self._e_event144);
        __o_rrpgObjs.removeEventListenerById(self._e_event143);
        __o_rrpgObjs.removeEventListenerById(self._e_event142);
        __o_rrpgObjs.removeEventListenerById(self._e_event141);
        __o_rrpgObjs.removeEventListenerById(self._e_event140);
        __o_rrpgObjs.removeEventListenerById(self._e_event139);
        __o_rrpgObjs.removeEventListenerById(self._e_event138);
        __o_rrpgObjs.removeEventListenerById(self._e_event137);
        __o_rrpgObjs.removeEventListenerById(self._e_event136);
        __o_rrpgObjs.removeEventListenerById(self._e_event135);
        __o_rrpgObjs.removeEventListenerById(self._e_event134);
        __o_rrpgObjs.removeEventListenerById(self._e_event133);
        __o_rrpgObjs.removeEventListenerById(self._e_event132);
        __o_rrpgObjs.removeEventListenerById(self._e_event131);
        __o_rrpgObjs.removeEventListenerById(self._e_event130);
        __o_rrpgObjs.removeEventListenerById(self._e_event129);
        __o_rrpgObjs.removeEventListenerById(self._e_event128);
        __o_rrpgObjs.removeEventListenerById(self._e_event127);
        __o_rrpgObjs.removeEventListenerById(self._e_event126);
        __o_rrpgObjs.removeEventListenerById(self._e_event125);
        __o_rrpgObjs.removeEventListenerById(self._e_event124);
        __o_rrpgObjs.removeEventListenerById(self._e_event123);
        __o_rrpgObjs.removeEventListenerById(self._e_event122);
        __o_rrpgObjs.removeEventListenerById(self._e_event121);
        __o_rrpgObjs.removeEventListenerById(self._e_event120);
        __o_rrpgObjs.removeEventListenerById(self._e_event119);
        __o_rrpgObjs.removeEventListenerById(self._e_event118);
        __o_rrpgObjs.removeEventListenerById(self._e_event117);
        __o_rrpgObjs.removeEventListenerById(self._e_event116);
        __o_rrpgObjs.removeEventListenerById(self._e_event115);
        __o_rrpgObjs.removeEventListenerById(self._e_event114);
        __o_rrpgObjs.removeEventListenerById(self._e_event113);
        __o_rrpgObjs.removeEventListenerById(self._e_event112);
        __o_rrpgObjs.removeEventListenerById(self._e_event111);
        __o_rrpgObjs.removeEventListenerById(self._e_event110);
        __o_rrpgObjs.removeEventListenerById(self._e_event109);
        __o_rrpgObjs.removeEventListenerById(self._e_event108);
        __o_rrpgObjs.removeEventListenerById(self._e_event107);
        __o_rrpgObjs.removeEventListenerById(self._e_event106);
        __o_rrpgObjs.removeEventListenerById(self._e_event105);
        __o_rrpgObjs.removeEventListenerById(self._e_event104);
        __o_rrpgObjs.removeEventListenerById(self._e_event103);
        __o_rrpgObjs.removeEventListenerById(self._e_event102);
        __o_rrpgObjs.removeEventListenerById(self._e_event101);
        __o_rrpgObjs.removeEventListenerById(self._e_event100);
        __o_rrpgObjs.removeEventListenerById(self._e_event99);
        __o_rrpgObjs.removeEventListenerById(self._e_event98);
        __o_rrpgObjs.removeEventListenerById(self._e_event97);
        __o_rrpgObjs.removeEventListenerById(self._e_event96);
        __o_rrpgObjs.removeEventListenerById(self._e_event95);
        __o_rrpgObjs.removeEventListenerById(self._e_event94);
        __o_rrpgObjs.removeEventListenerById(self._e_event93);
        __o_rrpgObjs.removeEventListenerById(self._e_event92);
        __o_rrpgObjs.removeEventListenerById(self._e_event91);
        __o_rrpgObjs.removeEventListenerById(self._e_event90);
        __o_rrpgObjs.removeEventListenerById(self._e_event89);
        __o_rrpgObjs.removeEventListenerById(self._e_event88);
        __o_rrpgObjs.removeEventListenerById(self._e_event87);
        __o_rrpgObjs.removeEventListenerById(self._e_event86);
        __o_rrpgObjs.removeEventListenerById(self._e_event85);
        __o_rrpgObjs.removeEventListenerById(self._e_event84);
        __o_rrpgObjs.removeEventListenerById(self._e_event83);
        __o_rrpgObjs.removeEventListenerById(self._e_event82);
        __o_rrpgObjs.removeEventListenerById(self._e_event81);
        __o_rrpgObjs.removeEventListenerById(self._e_event80);
        __o_rrpgObjs.removeEventListenerById(self._e_event79);
        __o_rrpgObjs.removeEventListenerById(self._e_event78);
        __o_rrpgObjs.removeEventListenerById(self._e_event77);
        __o_rrpgObjs.removeEventListenerById(self._e_event76);
        __o_rrpgObjs.removeEventListenerById(self._e_event75);
        __o_rrpgObjs.removeEventListenerById(self._e_event74);
        __o_rrpgObjs.removeEventListenerById(self._e_event73);
        __o_rrpgObjs.removeEventListenerById(self._e_event72);
        __o_rrpgObjs.removeEventListenerById(self._e_event71);
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
        if self.PercepcaoBase ~= nil then self.PercepcaoBase:destroy(); self.PercepcaoBase = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.rectangle95 ~= nil then self.rectangle95:destroy(); self.rectangle95 = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.InteligenciaEquips ~= nil then self.InteligenciaEquips:destroy(); self.InteligenciaEquips = nil; end;
        if self.PrecisaoPassivo ~= nil then self.PrecisaoPassivo:destroy(); self.PrecisaoPassivo = nil; end;
        if self.CombateEquips ~= nil then self.CombateEquips:destroy(); self.CombateEquips = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.ForcaPassivo ~= nil then self.ForcaPassivo:destroy(); self.ForcaPassivo = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.imagem ~= nil then self.imagem:destroy(); self.imagem = nil; end;
        if self.rectangle90 ~= nil then self.rectangle90:destroy(); self.rectangle90 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.ForcaDeVontadeBase ~= nil then self.ForcaDeVontadeBase:destroy(); self.ForcaDeVontadeBase = nil; end;
        if self.ForcaDeVontadeTotal ~= nil then self.ForcaDeVontadeTotal:destroy(); self.ForcaDeVontadeTotal = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.InteligenciaTreino ~= nil then self.InteligenciaTreino:destroy(); self.InteligenciaTreino = nil; end;
        if self.VigorEquips ~= nil then self.VigorEquips:destroy(); self.VigorEquips = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.CarismaEquips ~= nil then self.CarismaEquips:destroy(); self.CarismaEquips = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.CombateBase ~= nil then self.CombateBase:destroy(); self.CombateBase = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.DefButton ~= nil then self.DefButton:destroy(); self.DefButton = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle99 ~= nil then self.rectangle99:destroy(); self.rectangle99 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.PrecButton ~= nil then self.PrecButton:destroy(); self.PrecButton = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.Haki ~= nil then self.Haki:destroy(); self.Haki = nil; end;
        if self.rectangle94 ~= nil then self.rectangle94:destroy(); self.rectangle94 = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.CarismaTreino ~= nil then self.CarismaTreino:destroy(); self.CarismaTreino = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.PrecisaoEquips ~= nil then self.PrecisaoEquips:destroy(); self.PrecisaoEquips = nil; end;
        if self.ForcaEquips ~= nil then self.ForcaEquips:destroy(); self.ForcaEquips = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.rectangle93 ~= nil then self.rectangle93:destroy(); self.rectangle93 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.rectangle88 ~= nil then self.rectangle88:destroy(); self.rectangle88 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.VigorButton ~= nil then self.VigorButton:destroy(); self.VigorButton = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.PercepcaoTotal ~= nil then self.PercepcaoTotal:destroy(); self.PercepcaoTotal = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.rectangle101 ~= nil then self.rectangle101:destroy(); self.rectangle101 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.CombateTreino ~= nil then self.CombateTreino:destroy(); self.CombateTreino = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.ForcaDeVontadePassivo ~= nil then self.ForcaDeVontadePassivo:destroy(); self.ForcaDeVontadePassivo = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.rectangle98 ~= nil then self.rectangle98:destroy(); self.rectangle98 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.AgilidadeTotal ~= nil then self.AgilidadeTotal:destroy(); self.AgilidadeTotal = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.VigorBase ~= nil then self.VigorBase:destroy(); self.VigorBase = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.rectangle97 ~= nil then self.rectangle97:destroy(); self.rectangle97 = nil; end;
        if self.rectangle87 ~= nil then self.rectangle87:destroy(); self.rectangle87 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.buttonExit ~= nil then self.buttonExit:destroy(); self.buttonExit = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.rectangle92 ~= nil then self.rectangle92:destroy(); self.rectangle92 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.rectangle89 ~= nil then self.rectangle89:destroy(); self.rectangle89 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.VigorTreino ~= nil then self.VigorTreino:destroy(); self.VigorTreino = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.ForcaDeVontadeEquips ~= nil then self.ForcaDeVontadeEquips:destroy(); self.ForcaDeVontadeEquips = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.CarismaBase ~= nil then self.CarismaBase:destroy(); self.CarismaBase = nil; end;
        if self.PrecisaoBase ~= nil then self.PrecisaoBase:destroy(); self.PrecisaoBase = nil; end;
        if self.Equipamento ~= nil then self.Equipamento:destroy(); self.Equipamento = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.rectangle105 ~= nil then self.rectangle105:destroy(); self.rectangle105 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.ForcaTotal ~= nil then self.ForcaTotal:destroy(); self.ForcaTotal = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.rectangle100 ~= nil then self.rectangle100:destroy(); self.rectangle100 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.ComButton ~= nil then self.ComButton:destroy(); self.ComButton = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.PrecisaoTotal ~= nil then self.PrecisaoTotal:destroy(); self.PrecisaoTotal = nil; end;
        if self.CarismaTotal ~= nil then self.CarismaTotal:destroy(); self.CarismaTotal = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.InteligenciaBase ~= nil then self.InteligenciaBase:destroy(); self.InteligenciaBase = nil; end;
        if self.fotoEquip ~= nil then self.fotoEquip:destroy(); self.fotoEquip = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.rectangle96 ~= nil then self.rectangle96:destroy(); self.rectangle96 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.ForDVonButton ~= nil then self.ForDVonButton:destroy(); self.ForDVonButton = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.ForcaButton ~= nil then self.ForcaButton:destroy(); self.ForcaButton = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.AgilidadeBase ~= nil then self.AgilidadeBase:destroy(); self.AgilidadeBase = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.InteligenciaTotal ~= nil then self.InteligenciaTotal:destroy(); self.InteligenciaTotal = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.AgilidadeEquips ~= nil then self.AgilidadeEquips:destroy(); self.AgilidadeEquips = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.buttonSair ~= nil then self.buttonSair:destroy(); self.buttonSair = nil; end;
        if self.rectangle104 ~= nil then self.rectangle104:destroy(); self.rectangle104 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.rectangle103 ~= nil then self.rectangle103:destroy(); self.rectangle103 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.PercepButton ~= nil then self.PercepButton:destroy(); self.PercepButton = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.CombatePassivo ~= nil then self.CombatePassivo:destroy(); self.CombatePassivo = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.ForcaBase ~= nil then self.ForcaBase:destroy(); self.ForcaBase = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.VigorTotal ~= nil then self.VigorTotal:destroy(); self.VigorTotal = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.IntButton ~= nil then self.IntButton:destroy(); self.IntButton = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.CombateTotal ~= nil then self.CombateTotal:destroy(); self.CombateTotal = nil; end;
        if self.rectangle81 ~= nil then self.rectangle81:destroy(); self.rectangle81 = nil; end;
        if self.rectangle91 ~= nil then self.rectangle91:destroy(); self.rectangle91 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.CarismaPassivo ~= nil then self.CarismaPassivo:destroy(); self.CarismaPassivo = nil; end;
        if self.ForcaDeVontadeTreino ~= nil then self.ForcaDeVontadeTreino:destroy(); self.ForcaDeVontadeTreino = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.InteligenciaPassivo ~= nil then self.InteligenciaPassivo:destroy(); self.InteligenciaPassivo = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.AgilidadeTreino ~= nil then self.AgilidadeTreino:destroy(); self.AgilidadeTreino = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.editHaki ~= nil then self.editHaki:destroy(); self.editHaki = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.VigorPassivo ~= nil then self.VigorPassivo:destroy(); self.VigorPassivo = nil; end;
        if self.AgilidadePassivo ~= nil then self.AgilidadePassivo:destroy(); self.AgilidadePassivo = nil; end;
        if self.PercepcaoEquips ~= nil then self.PercepcaoEquips:destroy(); self.PercepcaoEquips = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.PrecisaoTreino ~= nil then self.PrecisaoTreino:destroy(); self.PrecisaoTreino = nil; end;
        if self.CarisButton ~= nil then self.CarisButton:destroy(); self.CarisButton = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.PercepcaoTreino ~= nil then self.PercepcaoTreino:destroy(); self.PercepcaoTreino = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle102 ~= nil then self.rectangle102:destroy(); self.rectangle102 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.AgilButton ~= nil then self.AgilButton:destroy(); self.AgilButton = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.ForcaTreino ~= nil then self.ForcaTreino:destroy(); self.ForcaTreino = nil; end;
        if self.PercepcaoPassivo ~= nil then self.PercepcaoPassivo:destroy(); self.PercepcaoPassivo = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.editEquip ~= nil then self.editEquip:destroy(); self.editEquip = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
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
