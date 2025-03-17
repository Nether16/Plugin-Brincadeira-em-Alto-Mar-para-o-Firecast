require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_Vinculos()
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
    obj:setName("Vinculos");


		function criarListagem(nodo)
			local node = self[nodo]:append()
			node.id = tostring(node)
		end
	


    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(5000);
    obj.rectangle1:setHeight(3000);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setLeft(12);
    obj.layout1:setTop(12);
    obj.layout1:setWidth(200);
    obj.layout1:setHeight(525);
    obj.layout1:setName("layout1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(200);
    obj.rectangle2:setHeight(525);
    obj.rectangle2:setColor("#4169E1");
    obj.rectangle2:setName("rectangle2");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout1);
    obj.rectangle3:setLeft(2);
    obj.rectangle3:setTop(2);
    obj.rectangle3:setWidth(196);
    obj.rectangle3:setHeight(521);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(10);
    obj.label1:setTop(10);
    obj.label1:setWidth(180);
    obj.label1:setHeight(25);
    obj.label1:setText("Vinculos");
    obj.label1:setFontSize(18);
    lfm_setPropAsString(obj.label1, "fontStyle", "bold underline");
    obj.label1:setFontColor("#5F9EA0");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setLeft(50);
    obj.button1:setTop(40);
    obj.button1:setHeight(25);
    obj.button1:setText("Nova Listagem");
    obj.button1:setWidth(100);
    obj.button1:setName("button1");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.layout1);
    obj.scrollBox1:setLeft(5);
    obj.scrollBox1:setTop(70);
    obj.scrollBox1:setWidth(193);
    obj.scrollBox1:setHeight(460);
    obj.scrollBox1:setName("scrollBox1");

    obj.Vinculo = GUI.fromHandle(_obj_newObject("recordList"));
    obj.Vinculo:setParent(obj.scrollBox1);
    obj.Vinculo:setName("Vinculo");
    obj.Vinculo:setField("vinculos");
    obj.Vinculo:setTemplateForm("ListagemVinculos");
    obj.Vinculo:setWidth(190);
    obj.Vinculo:setAutoHeight(true);
    obj.Vinculo:setSelectable(true);

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj);
    obj.layout2:setLeft(222);
    obj.layout2:setTop(12);
    obj.layout2:setWidth(620);
    obj.layout2:setHeight(525);
    obj.layout2:setName("layout2");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout2);
    obj.rectangle4:setLeft(0);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(600);
    obj.rectangle4:setHeight(525);
    obj.rectangle4:setColor("#4169E1");
    obj.rectangle4:setName("rectangle4");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout2);
    obj.rectangle5:setLeft(2);
    obj.rectangle5:setTop(2);
    obj.rectangle5:setWidth(596);
    obj.rectangle5:setHeight(521);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setName("rectangle5");

    obj.labelListagem = GUI.fromHandle(_obj_newObject("label"));
    obj.labelListagem:setParent(obj.layout2);
    obj.labelListagem:setName("labelListagem");
    obj.labelListagem:setLeft(95);
    obj.labelListagem:setTop(9);
    obj.labelListagem:setWidth(501);
    obj.labelListagem:setHeight(40);
    obj.labelListagem:setFontColor("#D1B27E");
    obj.labelListagem:setFontSize(22);
    lfm_setPropAsString(obj.labelListagem, "fontStyle", "bold");
    obj.labelListagem:setHorzTextAlign("center");
    obj.labelListagem:setVertTextAlign("center");

    obj.nomeListagem = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomeListagem:setParent(obj.layout2);
    obj.nomeListagem:setName("nomeListagem");
    obj.nomeListagem:setReadOnly(true);
    obj.nomeListagem:setLeft(95);
    obj.nomeListagem:setTop(9);
    obj.nomeListagem:setWidth(521);
    obj.nomeListagem:setHeight(40);
    obj.nomeListagem:setFontSize(22);
    lfm_setPropAsString(obj.nomeListagem, "fontStyle", "bold");
    obj.nomeListagem:setHorzTextAlign("center");
    obj.nomeListagem:setTransparent(true);
    obj.nomeListagem:setVertTextAlign("center");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setLeft(15);
    obj.button2:setTop(15);
    obj.button2:setText("Novo Npc");
    obj.button2:setWidth(80);
    obj.button2:setHeight(30);
    obj.button2:setName("button2");

    obj.Npcs = GUI.fromHandle(_obj_newObject("recordList"));
    obj.Npcs:setParent(obj.layout2);
    obj.Npcs:setName("Npcs");
    obj.Npcs:setLeft(5);
    obj.Npcs:setTop(60);
    obj.Npcs:setWidth(590);
    obj.Npcs:setHeight(431);
    obj.Npcs:setTemplateForm("ListagemNpcs");
    obj.Npcs:setAutoHeight(false);
    obj.Npcs:setSelectable(true);
    obj.Npcs:setLayout("horizontalTiles");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj);
    obj.layout3:setLeft(832);
    obj.layout3:setTop(12);
    obj.layout3:setWidth(300);
    obj.layout3:setHeight(525);
    obj.layout3:setName("layout3");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout3);
    obj.rectangle6:setLeft(0);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(300);
    obj.rectangle6:setHeight(525);
    obj.rectangle6:setColor("#4169E1");
    obj.rectangle6:setName("rectangle6");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout3);
    obj.rectangle7:setLeft(2);
    obj.rectangle7:setTop(2);
    obj.rectangle7:setWidth(296);
    obj.rectangle7:setHeight(521);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setName("rectangle7");

    obj.LayoutNpc = GUI.fromHandle(_obj_newObject("layout"));
    obj.LayoutNpc:setParent(obj.layout3);
    obj.LayoutNpc:setName("LayoutNpc");
    obj.LayoutNpc:setLeft(0);
    obj.LayoutNpc:setTop(0);
    obj.LayoutNpc:setWidth(300);
    obj.LayoutNpc:setHeight(525);
    obj.LayoutNpc:setVisible(false);

    obj.NomeNpc = GUI.fromHandle(_obj_newObject("edit"));
    obj.NomeNpc:setParent(obj.LayoutNpc);
    obj.NomeNpc:setName("NomeNpc");
    obj.NomeNpc:setAlign("top");
    obj.NomeNpc:setFontSize(25);
    lfm_setPropAsString(obj.NomeNpc, "fontStyle", "bold");
    obj.NomeNpc:setMargins({top=18,left=3,right=3});
    obj.NomeNpc:setText("Nome");
    obj.NomeNpc:setTransparent(true);
    obj.NomeNpc:setHorzTextAlign("center");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.LayoutNpc);
    obj.rectangle8:setLeft(28);
    obj.rectangle8:setTop(77);
    obj.rectangle8:setWidth(244);
    obj.rectangle8:setHeight(144);
    obj.rectangle8:setColor("#D1B27E");
    obj.rectangle8:setName("rectangle8");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.LayoutNpc);
    obj.rectangle9:setLeft(30);
    obj.rectangle9:setTop(78);
    obj.rectangle9:setWidth(240);
    obj.rectangle9:setHeight(140);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setName("rectangle9");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.LayoutNpc);
    obj.label2:setLeft(30);
    obj.label2:setTop(78);
    obj.label2:setWidth(240);
    obj.label2:setHeight(140);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setText("Clique para adicionar imagem");
    obj.label2:setFontSize(14);
    obj.label2:setFontColor("#D1B27E");
    obj.label2:setName("label2");

    obj.ImagemNpc = GUI.fromHandle(_obj_newObject("image"));
    obj.ImagemNpc:setParent(obj.LayoutNpc);
    obj.ImagemNpc:setName("ImagemNpc");
    obj.ImagemNpc:setLeft(30);
    obj.ImagemNpc:setTop(78);
    obj.ImagemNpc:setWidth(240);
    obj.ImagemNpc:setHeight(140);
    obj.ImagemNpc:setStyle("autoFit");
    obj.ImagemNpc:setEditable(true);

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.LayoutNpc);
    obj.label3:setLeft(10);
    obj.label3:setTop(230);
    obj.label3:setWidth(280);
    obj.label3:setHeight(270);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setText("Descrição");
    obj.label3:setFontSize(15);
    obj.label3:setFontColor("#D1B27E");
    obj.label3:setName("label3");

    obj.DescriNpc = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.DescriNpc:setParent(obj.LayoutNpc);
    obj.DescriNpc:setName("DescriNpc");
    obj.DescriNpc:setField("");
    obj.DescriNpc:setLeft(10);
    obj.DescriNpc:setTop(245);
    obj.DescriNpc:setWidth(280);
    obj.DescriNpc:setHeight(270);
    obj.DescriNpc:setFontSize(14);

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (event)
            criarListagem('Vinculo'); self.Npcs.field = self.Vinculo.selectedNode
        end);

    obj._e_event1 = obj.Vinculo:addEventListener("onSelect",
        function ()
            
            					if self.Vinculo.selectedNode then
            						self.nomeListagem.readOnly = false;
            						self.LayoutNpc.visible=false
            						
            						local Field = tostring(self.Vinculo.selectedNode.id)
            						
            						self.nomeListagem.field = self.Vinculo.selectedNode;
            						self.Npcs.field = Field;
            						
            						self.nomeListagem.text = self.Vinculo.selectedNode.nomeListagem;
            					end
        end);

    obj._e_event2 = obj.Vinculo:addEventListener("onItemRemoved",
        function (node, form)
            self.nomeListagem.text = nil; self.nomeListagem.readOnly = true; self.Npcs.field = ''; self.LayoutNpc.visible=false
        end);

    obj._e_event3 = obj.Vinculo:addEventListener("onItemAdded",
        function (node, form)
            self.Vinculo.selectedNode = nil; self.LayoutNpc.visible=false
        end);

    obj._e_event4 = obj.nomeListagem:addEventListener("onChange",
        function ()
            self.Vinculo.selectedNode.nomeListagem = self.nomeListagem.text
        end);

    obj._e_event5 = obj.button2:addEventListener("onClick",
        function (event)
            if (self.Vinculo.selectedNode) then criarListagem('Npcs') end
        end);

    obj._e_event6 = obj.Npcs:addEventListener("onSelect",
        function ()
            
            							if (self.Npcs.selectedNode) then
            								local Field = tostring(self.Npcs.selectedNode.id)
            								self.Npcs.selectedNode.id = Field;
            								
            								self.LayoutNpc.visible=true
            								
            								self.ImagemNpc.src = self.Npcs.selectedNode.imagemNpc
            								self.NomeNpc.text = self.Npcs.selectedNode.nomeNpc
            								self.DescriNpc.text = self.Npcs.selectedNode.descriNpc
            							end
        end);

    obj._e_event7 = obj.Npcs:addEventListener("onItemRemoved",
        function (node, form)
            self.LayoutNpc.visible=false
        end);

    obj._e_event8 = obj.NomeNpc:addEventListener("onChange",
        function ()
            self.Npcs.selectedNode.nomeNpc = self.NomeNpc.text
        end);

    obj._e_event9 = obj.ImagemNpc:addEventListener("onPictureLoadedChange",
        function ()
            self.Npcs.selectedNode.imagemNpc = self.ImagemNpc.src
        end);

    obj._e_event10 = obj.DescriNpc:addEventListener("onChange",
        function ()
            self.Npcs.selectedNode.descriNpc = self.DescriNpc.text
        end);

    function obj:_releaseEvents()
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

        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.LayoutNpc ~= nil then self.LayoutNpc:destroy(); self.LayoutNpc = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.Vinculo ~= nil then self.Vinculo:destroy(); self.Vinculo = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.ImagemNpc ~= nil then self.ImagemNpc:destroy(); self.ImagemNpc = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.labelListagem ~= nil then self.labelListagem:destroy(); self.labelListagem = nil; end;
        if self.DescriNpc ~= nil then self.DescriNpc:destroy(); self.DescriNpc = nil; end;
        if self.Npcs ~= nil then self.Npcs:destroy(); self.Npcs = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.nomeListagem ~= nil then self.nomeListagem:destroy(); self.nomeListagem = nil; end;
        if self.NomeNpc ~= nil then self.NomeNpc:destroy(); self.NomeNpc = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newVinculos()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_Vinculos();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _Vinculos = {
    newEditor = newVinculos, 
    new = newVinculos, 
    name = "Vinculos", 
    dataType = "", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "Brincadeiras Em Alto Mar", 
    description=""};

Vinculos = _Vinculos;
Firecast.registrarForm(_Vinculos);

return _Vinculos;
