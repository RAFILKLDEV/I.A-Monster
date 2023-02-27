require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmItens()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

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
    obj:setName("frmItens");
    obj:setMargins({left=5,right=5,top=2,bottom=2});
    obj:setAlign("top");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setColor("#9191e9");
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setName("rectangle1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setAlign("right");
    obj.button1:setText("X");
    obj.button1:setWidth(50);
    obj.button1:setName("button1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setAlign("left");
    obj.label1:setText("Nome");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setWidth(50);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setAlign("left");
    obj.edit1:setField("nome");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setWidth(200);
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setAlign("left");
    obj.label2:setText("Chance");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setWidth(50);
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setAlign("left");
    obj.edit2:setField("chance");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setWidth(50);
    obj.edit2:setName("edit2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setAlign("left");
    obj.label3:setText("Descrição");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setWidth(70);
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setAlign("left");
    obj.edit3:setField("desc");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setWidth(200);
    obj.edit3:setName("edit3");


        local function porcentagem()
            local arquivo = NDB.load("itemDeMagia.lfm")
            local file = NDB.getRoot(arquivo)
            local info = NDB.getParent(sheet)
            local result = NDB.getAttributes(arquivo)

            local varr NDB.getChildNodes(arquivo)


            showMessage(tableToStr(arquivo, true))
            showMessage(tableToStr(self.arquivo, true))
            arquivo.label.text = "desgracaaaaaaaaaaaaaaa"
        end
    


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet);
        end, obj);

    obj._e_event1 = obj.edit2:addEventListener("onChange",
        function (_)
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmItens()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmItens();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmItens = {
    newEditor = newfrmItens, 
    new = newfrmItens, 
    name = "frmItens", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmItens = _frmItens;
Firecast.registrarForm(_frmItens);

return _frmItens;
