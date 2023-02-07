require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_Randonmizador()
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
    obj:setDataType("Randonmizador");
    obj:setTitle("Randonmizador");
    obj:setName("Randonmizador");
    obj:setWidth(1000);
    obj:setHeight(1000);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setColor("#457eac");
    obj.rectangle1:setPadding({top=30});
    obj.rectangle1:setHeight(90);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setAlign("top");
    obj.label1:setText("Randonmizador");
    obj.label1:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontColor("black");
    obj.label1:setFontSize(50);
    obj.label1:setName("label1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj);
    obj.rectangle2:setAlign("top");
    obj.rectangle2:setColor("#457eac");
    obj.rectangle2:setHeight(70);
    obj.rectangle2:setPadding({bottom=20});
    obj.rectangle2:setName("rectangle2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle2);
    obj.button1:setText("Nova Ação");
    obj.button1:setAlign("left");
    obj.button1:setWidth(100);
    obj.button1:setMargins({left=50});
    obj.button1:setName("button1");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj);
    obj.rectangle3:setAlign("top");
    obj.rectangle3:setColor("#457eac");
    obj.rectangle3:setHeight(800);
    obj.rectangle3:setName("rectangle3");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.rectangle3);
    obj.scrollBox1:setAlign("top");
    obj.scrollBox1:setHeight(800);
    obj.scrollBox1:setName("scrollBox1");

    obj.rclAcoes = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAcoes:setParent(obj.scrollBox1);
    obj.rclAcoes:setName("rclAcoes");
    obj.rclAcoes:setField("Lista");
    obj.rclAcoes:setTemplateForm("frmItemDeMagia");
    obj.rclAcoes:setAlign("top");
    obj.rclAcoes:setAutoHeight(true);



     


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclAcoes:append();
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

        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rclAcoes ~= nil then self.rclAcoes:destroy(); self.rclAcoes = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newRandonmizador()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_Randonmizador();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _Randonmizador = {
    newEditor = newRandonmizador, 
    new = newRandonmizador, 
    name = "Randonmizador", 
    dataType = "Randonmizador", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Randonmizador", 
    description=""};

Randonmizador = _Randonmizador;
Firecast.registrarForm(_Randonmizador);
Firecast.registrarDataType(_Randonmizador);

return _Randonmizador;
