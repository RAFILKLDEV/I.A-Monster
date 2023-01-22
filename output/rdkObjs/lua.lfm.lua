require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_IAMONSTER()
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
    obj:setFormType("sheetTemplate");
    obj:setDataType("DATA_TYPE_AQUI");
    obj:setTitle("I.A Monster");
    obj:setName("IAMONSTER");
    obj:setWidth(1000);
    obj:setHeight(800);

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("top");
    obj.layout1:setWidth(500);
    obj.layout1:setPadding({left=40, top=4, right=4, bottom=4});
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("top");
    obj.label1:setText("Kek");
    obj.label1:setFontColor("white");
    obj.label1:setAutoSize(true);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setAlign("top");
    obj.edit1:setField("Destreza");
    obj.edit1:setName("edit1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj);
    obj.layout2:setAlign("top");
    obj.layout2:setName("layout2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setAlign("top");
    obj.label2:setText("Label de cor verde com quebra de linha");
    obj.label2:setFontColor("white");
    obj.label2:setAutoSize(true);
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setAlign("top");
    obj.edit2:setField("Destreza");
    obj.edit2:setName("edit2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(500);
    obj.layout3:setName("layout3");

    obj.rclMagias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMagias:setParent(obj.layout3);
    obj.rclMagias:setName("rclMagias");
    obj.rclMagias:setField("magias");
    obj.rclMagias:setTemplateForm("frmItemDeMagia");
    obj.rclMagias:setAlign("top");
    obj.rclMagias:setAutoHeight(true);

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout3);
    obj.button1:setLeft(20);
    obj.button1:setTop(20);
    obj.button1:setHeight(25);
    obj.button1:setText("Nova Magia");
    obj.button1:setWidth(80);
    obj.button1:setName("button1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclMagias:append();
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rclMagias ~= nil then self.rclMagias:destroy(); self.rclMagias = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newIAMONSTER()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_IAMONSTER();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _IAMONSTER = {
    newEditor = newIAMONSTER, 
    new = newIAMONSTER, 
    name = "IAMONSTER", 
    dataType = "DATA_TYPE_AQUI", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "I.A Monster", 
    description=""};

IAMONSTER = _IAMONSTER;
Firecast.registrarForm(_IAMONSTER);
Firecast.registrarDataType(_IAMONSTER);

return _IAMONSTER;
