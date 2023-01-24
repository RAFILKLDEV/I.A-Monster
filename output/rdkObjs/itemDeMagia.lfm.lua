require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmItemDeMagia()
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
    obj:setName("frmItemDeMagia");
    obj:setMargins({top=5,bottom=2});
    obj:setHeight(50);

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("top");
    obj.scrollBox1:setHeight(50);
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setColor("blue");
    obj.rectangle1:setHeight(50);
    obj.rectangle1:setName("rectangle1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setAlign("left");
    obj.button1:setText("Rolar I.A");
    obj.button1:setName("button1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setAlign("left");
    obj.label1:setText("Nome");
    obj.label1:setWidth(100);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(100);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setAlign("left");
    obj.label2:setText("Chance");
    obj.label2:setWidth(100);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(35);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setField("chance");
    obj.edit2:setName("edit2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setAlign("left");
    obj.label3:setText("Resultado");
    obj.label3:setWidth(80);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setAlign("left");
    obj.edit3:setWidth(100);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setField("resultado");
    obj.edit3:setName("edit3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setAlign("left");
    obj.label4:setText("Chance2");
    obj.label4:setWidth(100);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setAlign("left");
    obj.edit4:setWidth(35);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setField("chance2");
    obj.edit4:setName("edit4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setAlign("left");
    obj.label5:setText("Resultado2");
    obj.label5:setWidth(80);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle1);
    obj.edit5:setAlign("left");
    obj.edit5:setWidth(100);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setField("resultado2");
    obj.edit5:setName("edit5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle1);
    obj.label6:setAlign("left");
    obj.label6:setText("Chance3");
    obj.label6:setWidth(100);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle1);
    obj.edit6:setAlign("left");
    obj.edit6:setWidth(35);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setField("chance3");
    obj.edit6:setName("edit6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle1);
    obj.label7:setAlign("left");
    obj.label7:setText("Resultado3");
    obj.label7:setWidth(80);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle1);
    obj.edit7:setAlign("left");
    obj.edit7:setWidth(100);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setField("resultado3");
    obj.edit7:setName("edit7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle1);
    obj.label8:setAlign("left");
    obj.label8:setText("Chance4");
    obj.label8:setWidth(100);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle1);
    obj.edit8:setAlign("left");
    obj.edit8:setWidth(35);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setField("chance4");
    obj.edit8:setName("edit8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle1);
    obj.label9:setAlign("left");
    obj.label9:setText("Resultado4");
    obj.label9:setWidth(80);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle1);
    obj.edit9:setAlign("left");
    obj.edit9:setWidth(100);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setField("resultado4");
    obj.edit9:setName("edit9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle1);
    obj.label10:setAlign("left");
    obj.label10:setText("Chance5");
    obj.label10:setWidth(100);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle1);
    obj.edit10:setAlign("left");
    obj.edit10:setWidth(35);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setField("chance5");
    obj.edit10:setName("edit10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle1);
    obj.label11:setAlign("left");
    obj.label11:setText("Resultado5");
    obj.label11:setWidth(80);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle1);
    obj.edit11:setAlign("left");
    obj.edit11:setWidth(100);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setField("resultado5");
    obj.edit11:setName("edit11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle1);
    obj.label12:setAlign("left");
    obj.label12:setText("Chance6");
    obj.label12:setWidth(100);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle1);
    obj.edit12:setAlign("left");
    obj.edit12:setWidth(35);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setField("chance6");
    obj.edit12:setName("edit12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle1);
    obj.label13:setAlign("left");
    obj.label13:setText("Resultado6");
    obj.label13:setWidth(80);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle1);
    obj.edit13:setAlign("left");
    obj.edit13:setWidth(100);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setField("resultado6");
    obj.edit13:setName("edit13");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setAlign("right");
    obj.button2:setText("Apagar");
    obj.button2:setWidth(80);
    obj.button2:setName("button2");


        require("firecast.lua");
        require("utils.lua");

        


           
        local function rolarIA()
                mesa = Firecast.getRoomOf(sheet)
                chat = mesa.chat
    
                chat:enviarMensagem("Definindo Comportamento de " .. sheet.nome .. "...")
    
                local valores = {}
    
                if sheet.chance ~= nil then
                table.insert(valores, tonumber(sheet.chance))
                end
    
                if sheet.chance2 ~= nil then
                table.insert(valores, tonumber(sheet.chance2))
                end
    
                if sheet.chance3 ~= nil then
                table.insert(valores, tonumber(sheet.chance3))
                end
    
                if sheet.chance4 ~= nil then
                table.insert(valores, tonumber(sheet.chance4))
                end
    
                if sheet.chance5 ~= nil then
                table.insert(valores, tonumber(sheet.chance5))
                end
    
                if sheet.chance6 ~= nil then
                table.insert(valores, tonumber(sheet.chance6))
                end
    
                local resultado = 6
     
                for i = 1, #valores do
    
    
                    for v = 1, valores[i] do
    
                    
                        if i == 1 then
    
                            if v == resultado then
    
                                result = "resultado" .. v
    
                                chat:enviarMensagem(sheet.nome .. " " .. result)
    
                            end
                        
                        else 
    
                            if v + valores[i-1] == resultado then
    
                                if resultado > valores[i-1] and resultado <= valores[i] then 
                                
                                    if i == 2 then 
                                        chat:enviarMensagem(sheet.nome .. " " .. result)
                                    end
                            
                                end
    
                            end
    
                        end
    
                    end
    
                end
    
            end
            



    


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            rolarIA()
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet);
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

        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmItemDeMagia()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmItemDeMagia();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmItemDeMagia = {
    newEditor = newfrmItemDeMagia, 
    new = newfrmItemDeMagia, 
    name = "frmItemDeMagia", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmItemDeMagia = _frmItemDeMagia;
Firecast.registrarForm(_frmItemDeMagia);

return _frmItemDeMagia;
