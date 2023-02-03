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
    obj:setHeight(1000);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setColor("green");
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setHeight(50);
    obj.rectangle1:setName("rectangle1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setAlign("left");
    obj.button1:setWidth(80);
    obj.button1:setText("Novo");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setAlign("left");
    obj.button2:setText("Rolar I.A");
    obj.button2:setName("button2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj);
    obj.rectangle2:setColor("green");
    obj.rectangle2:setAlign("top");
    obj.rectangle2:setHeight(800);
    obj.rectangle2:setName("rectangle2");

    obj.rclItens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclItens:setParent(obj.rectangle2);
    obj.rclItens:setAlign("right");
    obj.rclItens:setName("rclItens");
    obj.rclItens:setField("itens");
    obj.rclItens:setTemplateForm("frmItemDeMagia");
    obj.rclItens:setAutoHeight(true);

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle2);
    obj.button3:setAlign("right");
    obj.button3:setText("Apagar");
    obj.button3:setWidth(80);
    obj.button3:setName("button3");


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
    
                local total = 0
                
                for i = 1, #valores do
                    total = total + valores[i]
                end
                
                mesa.chat:rolarDados("1d" .. total, "Escolhendo Ação...",
                function (rolagem)                                   
            
                    for i = 1, #valores do

                        for v = 1, valores[i] do

                            if i == 1 then
                                if v == rolagem.resultado then
                                    return chat:enviarMensagem(sheet.nome .. " " .. sheet.resultado)
                                end
                            else 

                                local total1 = 0
                                local total2 = 0

                                for t = 1, i-1 do
                                    total1 = total1 + valores[t]
                                end
                                
                                for t = 1, i do
                                    total2 = total2 + valores[t]
                                end

                                if tonumber(v + total1) == rolagem.resultado then
                                    if rolagem.resultado > total1 and rolagem.resultado <= total2 then      
                                        if i == 2 then 
                                            return chat:enviarMensagem(sheet.nome .. " " .. sheet.resultado2)
                                        elseif i == 3  then
                                            return chat:enviarMensagem(sheet.nome .. " " .. sheet.resultado3)   
                                        elseif i == 4  then
                                            return chat:enviarMensagem(sheet.nome .. " " .. sheet.resultado4)
                                        elseif i == 5  then
                                            return chat:enviarMensagem(sheet.nome .. " " .. sheet.resultado5)
                                        elseif i == 6  then
                                            return chat:enviarMensagem(sheet.nome .. " " .. sheet.resultado6)
                                        end
                                    end
        
                                end
        
                            end
        
                        end
        
                    end
                end)
     
    
            end
            



    


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclItens:append();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            rolarIA()
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet);
        end, obj);

    function obj:_releaseEvents()
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

        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rclItens ~= nil then self.rclItens:destroy(); self.rclItens = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
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
