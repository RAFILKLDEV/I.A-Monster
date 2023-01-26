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

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setName("layout1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setLeft(20);
    obj.button1:setTop(20);
    obj.button1:setHeight(25);
    obj.button1:setText("Nova Magia");
    obj.button1:setWidth(80);
    obj.button1:setName("button1");

    obj.rclMagias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMagias:setParent(obj.layout1);
    obj.rclMagias:setName("rclMagias");
    obj.rclMagias:setField("ite");
    obj.rclMagias:setTemplateForm("frmItemDeMagia");
    obj.rclMagias:setLeft(20);
    obj.rclMagias:setTop(60);
    obj.rclMagias:setWidth(300);
    obj.rclMagias:setAutoHeight(true);

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("top");
    obj.scrollBox1:setHeight(50);
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setColor("DimGray");
    obj.rectangle1:setHeight(50);
    obj.rectangle1:setName("rectangle1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setAlign("left");
    obj.button2:setText("Rolar I.A");
    obj.button2:setName("button2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setAlign("left");
    obj.label1:setText("Nome");
    obj.label1:setWidth(100);
    obj.label1:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontColor("black");
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
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setFontColor("black");
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
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setFontColor("black");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setAlign("left");
    obj.edit3:setWidth(100);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setField("resultado");
    obj.edit3:setName("edit3");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle1);
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
            self.rclMagias:append();
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

        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rclMagias ~= nil then self.rclMagias:destroy(); self.rclMagias = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
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
