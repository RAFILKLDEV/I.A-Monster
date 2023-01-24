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

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setColor("yellow");
    obj.rectangle1:setPadding({left = 5, right = 5, top = 5, bottom = 5});
    obj.rectangle1:setName("rectangle1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setText("Nova Monstro");
    obj.button1:setWidth(150);
    obj.button1:setName("button1");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("top");
    obj.scrollBox1:setHeight(800);
    obj.scrollBox1:setName("scrollBox1");

    obj.rclMagias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMagias:setParent(obj.scrollBox1);
    obj.rclMagias:setName("rclMagias");
    obj.rclMagias:setField("Lista");
    obj.rclMagias:setTemplateForm("frmItemDeMagia");
    obj.rclMagias:setAlign("top");
    obj.rclMagias:setAutoHeight(true);
    obj.rclMagias:setSelectable(true);
    obj.rclMagias:setSelectedNode();



     


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

        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rclMagias ~= nil then self.rclMagias:destroy(); self.rclMagias = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
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
