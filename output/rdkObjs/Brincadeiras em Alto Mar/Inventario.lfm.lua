require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_Inventario()
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
    obj:setName("Inventario");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(5000);
    obj.rectangle1:setHeight(3000);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");


		function criarListagem(nodo)
			local node = self[nodo]:append()
			node.id = tostring(node)
		end
	


    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setLeft(12);
    obj.layout1:setTop(12);
    obj.layout1:setWidth(1185);
    obj.layout1:setHeight(525);
    obj.layout1:setName("layout1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(1185);
    obj.rectangle2:setHeight(525);
    obj.rectangle2:setColor("#4169E1");
    obj.rectangle2:setName("rectangle2");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout1);
    obj.rectangle3:setLeft(2);
    obj.rectangle3:setTop(2);
    obj.rectangle3:setWidth(1181);
    obj.rectangle3:setHeight(521);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj.layout1);
    obj.tabControl1:setLeft(2);
    obj.tabControl1:setTop(3);
    obj.tabControl1:setWidth(1180);
    obj.tabControl1:setHeight(519);
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Diversos");
    obj.tab1:setName("tab1");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.tab1);
    obj.rectangle4:setLeft(2);
    obj.rectangle4:setTop(2);
    obj.rectangle4:setWidth(1181);
    obj.rectangle4:setHeight(521);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.tab1);
    obj.label1:setLeft(10);
    obj.label1:setTop(10);
    obj.label1:setWidth(200);
    obj.label1:setHeight(25);
    obj.label1:setText("Diversos");
    obj.label1:setFontSize(18);
    lfm_setPropAsString(obj.label1, "fontStyle", "bold underline");
    obj.label1:setFontColor("#5F9EA0");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.tab1);
    obj.button1:setLeft(60);
    obj.button1:setTop(40);
    obj.button1:setHeight(25);
    obj.button1:setText("Novo Item");
    obj.button1:setWidth(100);
    obj.button1:setName("button1");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.tab1);
    obj.scrollBox1:setLeft(5);
    obj.scrollBox1:setTop(70);
    obj.scrollBox1:setWidth(205);
    obj.scrollBox1:setHeight(460);
    obj.scrollBox1:setName("scrollBox1");

    obj.Diversos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.Diversos:setParent(obj.scrollBox1);
    obj.Diversos:setName("Diversos");
    obj.Diversos:setField("diversos");
    obj.Diversos:setTemplateForm("Items");
    obj.Diversos:setWidth(205);
    obj.Diversos:setAutoHeight(true);
    obj.Diversos:setSelectable(true);

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.tab1);
    obj.rectangle5:setLeft(218);
    obj.rectangle5:setTop(23);
    obj.rectangle5:setWidth(954);
    obj.rectangle5:setHeight(465);
    obj.rectangle5:setColor("#4169E1");
    obj.rectangle5:setName("rectangle5");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.tab1);
    obj.rectangle6:setLeft(220);
    obj.rectangle6:setTop(25);
    obj.rectangle6:setWidth(950);
    obj.rectangle6:setHeight(461);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setName("rectangle6");

    obj.LayoutDiversos = GUI.fromHandle(_obj_newObject("layout"));
    obj.LayoutDiversos:setParent(obj.tab1);
    obj.LayoutDiversos:setName("LayoutDiversos");
    obj.LayoutDiversos:setLeft(220);
    obj.LayoutDiversos:setTop(25);
    obj.LayoutDiversos:setWidth(950);
    obj.LayoutDiversos:setHeight(461);
    obj.LayoutDiversos:setVisible(false);

    obj.editDiversos = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.editDiversos:setParent(obj.LayoutDiversos);
    obj.editDiversos:setName("editDiversos");
    obj.editDiversos:setAlign("client");
    obj.editDiversos.backgroundColor = "black";
    obj.editDiversos.defaultFontColor = "white";
    obj.editDiversos.animateImages = true;

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Consumíveis");
    obj.tab2:setName("tab2");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.tab2);
    obj.rectangle7:setLeft(2);
    obj.rectangle7:setTop(2);
    obj.rectangle7:setWidth(1181);
    obj.rectangle7:setHeight(521);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setName("rectangle7");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.tab2);
    obj.label2:setLeft(10);
    obj.label2:setTop(10);
    obj.label2:setWidth(200);
    obj.label2:setHeight(25);
    obj.label2:setText("Consumíveis");
    obj.label2:setFontSize(18);
    lfm_setPropAsString(obj.label2, "fontStyle", "bold underline");
    obj.label2:setFontColor("#5F9EA0");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.tab2);
    obj.button2:setLeft(60);
    obj.button2:setTop(40);
    obj.button2:setHeight(25);
    obj.button2:setText("Novo Item");
    obj.button2:setWidth(100);
    obj.button2:setName("button2");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.tab2);
    obj.scrollBox2:setLeft(5);
    obj.scrollBox2:setTop(70);
    obj.scrollBox2:setWidth(205);
    obj.scrollBox2:setHeight(460);
    obj.scrollBox2:setName("scrollBox2");

    obj.Consumiveis = GUI.fromHandle(_obj_newObject("recordList"));
    obj.Consumiveis:setParent(obj.scrollBox2);
    obj.Consumiveis:setName("Consumiveis");
    obj.Consumiveis:setField("consumiveis");
    obj.Consumiveis:setTemplateForm("Items");
    obj.Consumiveis:setWidth(205);
    obj.Consumiveis:setAutoHeight(true);
    obj.Consumiveis:setSelectable(true);

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.tab2);
    obj.rectangle8:setLeft(218);
    obj.rectangle8:setTop(23);
    obj.rectangle8:setWidth(954);
    obj.rectangle8:setHeight(465);
    obj.rectangle8:setColor("#4169E1");
    obj.rectangle8:setName("rectangle8");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.tab2);
    obj.rectangle9:setLeft(220);
    obj.rectangle9:setTop(25);
    obj.rectangle9:setWidth(950);
    obj.rectangle9:setHeight(461);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setName("rectangle9");

    obj.LayoutConsumiveis = GUI.fromHandle(_obj_newObject("layout"));
    obj.LayoutConsumiveis:setParent(obj.tab2);
    obj.LayoutConsumiveis:setName("LayoutConsumiveis");
    obj.LayoutConsumiveis:setLeft(220);
    obj.LayoutConsumiveis:setTop(25);
    obj.LayoutConsumiveis:setWidth(950);
    obj.LayoutConsumiveis:setHeight(461);
    obj.LayoutConsumiveis:setVisible(false);

    obj.editConsumiveis = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.editConsumiveis:setParent(obj.LayoutConsumiveis);
    obj.editConsumiveis:setName("editConsumiveis");
    obj.editConsumiveis:setAlign("client");
    obj.editConsumiveis.backgroundColor = "black";
    obj.editConsumiveis.defaultFontColor = "white";
    obj.editConsumiveis.animateImages = true;

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Armamentos");
    obj.tab3:setName("tab3");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.tab3);
    obj.rectangle10:setLeft(2);
    obj.rectangle10:setTop(2);
    obj.rectangle10:setWidth(1181);
    obj.rectangle10:setHeight(521);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setName("rectangle10");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.tab3);
    obj.label3:setLeft(10);
    obj.label3:setTop(10);
    obj.label3:setWidth(200);
    obj.label3:setHeight(25);
    obj.label3:setText("Armamentos");
    obj.label3:setFontSize(18);
    lfm_setPropAsString(obj.label3, "fontStyle", "bold underline");
    obj.label3:setFontColor("#5F9EA0");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.tab3);
    obj.button3:setLeft(60);
    obj.button3:setTop(40);
    obj.button3:setHeight(25);
    obj.button3:setText("Novo Item");
    obj.button3:setWidth(100);
    obj.button3:setName("button3");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.tab3);
    obj.scrollBox3:setLeft(5);
    obj.scrollBox3:setTop(70);
    obj.scrollBox3:setWidth(205);
    obj.scrollBox3:setHeight(460);
    obj.scrollBox3:setName("scrollBox3");

    obj.Armamentos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.Armamentos:setParent(obj.scrollBox3);
    obj.Armamentos:setName("Armamentos");
    obj.Armamentos:setField("armamentos");
    obj.Armamentos:setTemplateForm("Items");
    obj.Armamentos:setWidth(205);
    obj.Armamentos:setAutoHeight(true);
    obj.Armamentos:setSelectable(true);

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.tab3);
    obj.rectangle11:setLeft(218);
    obj.rectangle11:setTop(23);
    obj.rectangle11:setWidth(954);
    obj.rectangle11:setHeight(465);
    obj.rectangle11:setColor("#4169E1");
    obj.rectangle11:setName("rectangle11");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.tab3);
    obj.rectangle12:setLeft(220);
    obj.rectangle12:setTop(25);
    obj.rectangle12:setWidth(950);
    obj.rectangle12:setHeight(461);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setName("rectangle12");

    obj.LayoutArmamentos = GUI.fromHandle(_obj_newObject("layout"));
    obj.LayoutArmamentos:setParent(obj.tab3);
    obj.LayoutArmamentos:setName("LayoutArmamentos");
    obj.LayoutArmamentos:setLeft(220);
    obj.LayoutArmamentos:setTop(25);
    obj.LayoutArmamentos:setWidth(950);
    obj.LayoutArmamentos:setHeight(461);
    obj.LayoutArmamentos:setVisible(false);

    obj.editArmamentos = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.editArmamentos:setParent(obj.LayoutArmamentos);
    obj.editArmamentos:setName("editArmamentos");
    obj.editArmamentos:setAlign("client");
    obj.editArmamentos.backgroundColor = "black";
    obj.editArmamentos.defaultFontColor = "white";
    obj.editArmamentos.animateImages = true;

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Equipamentos");
    obj.tab4:setName("tab4");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.tab4);
    obj.rectangle13:setLeft(2);
    obj.rectangle13:setTop(2);
    obj.rectangle13:setWidth(1181);
    obj.rectangle13:setHeight(521);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setName("rectangle13");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.tab4);
    obj.label4:setLeft(10);
    obj.label4:setTop(10);
    obj.label4:setWidth(200);
    obj.label4:setHeight(25);
    obj.label4:setText("Equipamentos");
    obj.label4:setFontSize(18);
    lfm_setPropAsString(obj.label4, "fontStyle", "bold underline");
    obj.label4:setFontColor("#5F9EA0");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.tab4);
    obj.button4:setLeft(60);
    obj.button4:setTop(40);
    obj.button4:setHeight(25);
    obj.button4:setText("Novo Item");
    obj.button4:setWidth(100);
    obj.button4:setName("button4");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.tab4);
    obj.scrollBox4:setLeft(5);
    obj.scrollBox4:setTop(70);
    obj.scrollBox4:setWidth(205);
    obj.scrollBox4:setHeight(460);
    obj.scrollBox4:setName("scrollBox4");

    obj.Equipamentos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.Equipamentos:setParent(obj.scrollBox4);
    obj.Equipamentos:setName("Equipamentos");
    obj.Equipamentos:setField("equipamentos");
    obj.Equipamentos:setTemplateForm("Items");
    obj.Equipamentos:setWidth(205);
    obj.Equipamentos:setAutoHeight(true);
    obj.Equipamentos:setSelectable(true);

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.tab4);
    obj.rectangle14:setLeft(218);
    obj.rectangle14:setTop(23);
    obj.rectangle14:setWidth(954);
    obj.rectangle14:setHeight(465);
    obj.rectangle14:setColor("#4169E1");
    obj.rectangle14:setName("rectangle14");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.tab4);
    obj.rectangle15:setLeft(220);
    obj.rectangle15:setTop(25);
    obj.rectangle15:setWidth(950);
    obj.rectangle15:setHeight(461);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setName("rectangle15");

    obj.LayoutEquipamentos = GUI.fromHandle(_obj_newObject("layout"));
    obj.LayoutEquipamentos:setParent(obj.tab4);
    obj.LayoutEquipamentos:setName("LayoutEquipamentos");
    obj.LayoutEquipamentos:setLeft(220);
    obj.LayoutEquipamentos:setTop(25);
    obj.LayoutEquipamentos:setWidth(950);
    obj.LayoutEquipamentos:setHeight(461);
    obj.LayoutEquipamentos:setVisible(false);

    obj.editEquipamentos = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.editEquipamentos:setParent(obj.LayoutEquipamentos);
    obj.editEquipamentos:setName("editEquipamentos");
    obj.editEquipamentos:setAlign("client");
    obj.editEquipamentos.backgroundColor = "black";
    obj.editEquipamentos.defaultFontColor = "white";
    obj.editEquipamentos.animateImages = true;

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (event)
            criarListagem('Diversos');
        end);

    obj._e_event1 = obj.Diversos:addEventListener("onSelect",
        function ()
            
            						if self.Diversos.selectedNode then
            							self.LayoutDiversos.visible = true
            							self.editDiversos.field = self.Diversos.selectedNode.id
            						end
        end);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (event)
            criarListagem('Consumiveis');
        end);

    obj._e_event3 = obj.Consumiveis:addEventListener("onSelect",
        function ()
            
            						if self.Consumiveis.selectedNode then
            							self.LayoutConsumiveis.visible = true
            							self.editConsumiveis.field = self.Consumiveis.selectedNode.id
            						end
        end);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (event)
            criarListagem('Armamentos');
        end);

    obj._e_event5 = obj.Armamentos:addEventListener("onSelect",
        function ()
            
            						if self.Armamentos.selectedNode then
            							self.LayoutArmamentos.visible = true
            							self.editArmamentos.field = self.Armamentos.selectedNode.id
            						end
        end);

    obj._e_event6 = obj.button4:addEventListener("onClick",
        function (event)
            criarListagem('Equipamentos');
        end);

    obj._e_event7 = obj.Equipamentos:addEventListener("onSelect",
        function ()
            
            						if self.Equipamentos.selectedNode then
            							self.LayoutEquipamentos.visible = true
            							self.editEquipamentos.field = self.Equipamentos.selectedNode.id
            						end
        end);

    function obj:_releaseEvents()
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

        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.editConsumiveis ~= nil then self.editConsumiveis:destroy(); self.editConsumiveis = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.editArmamentos ~= nil then self.editArmamentos:destroy(); self.editArmamentos = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.Equipamentos ~= nil then self.Equipamentos:destroy(); self.Equipamentos = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.LayoutArmamentos ~= nil then self.LayoutArmamentos:destroy(); self.LayoutArmamentos = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.LayoutDiversos ~= nil then self.LayoutDiversos:destroy(); self.LayoutDiversos = nil; end;
        if self.editEquipamentos ~= nil then self.editEquipamentos:destroy(); self.editEquipamentos = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.LayoutEquipamentos ~= nil then self.LayoutEquipamentos:destroy(); self.LayoutEquipamentos = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.Diversos ~= nil then self.Diversos:destroy(); self.Diversos = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.LayoutConsumiveis ~= nil then self.LayoutConsumiveis:destroy(); self.LayoutConsumiveis = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.editDiversos ~= nil then self.editDiversos:destroy(); self.editDiversos = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.Consumiveis ~= nil then self.Consumiveis:destroy(); self.Consumiveis = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.Armamentos ~= nil then self.Armamentos:destroy(); self.Armamentos = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newInventario()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_Inventario();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _Inventario = {
    newEditor = newInventario, 
    new = newInventario, 
    name = "Inventario", 
    dataType = "", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "Brincadeiras Em Alto Mar", 
    description=""};

Inventario = _Inventario;
Firecast.registrarForm(_Inventario);

return _Inventario;
