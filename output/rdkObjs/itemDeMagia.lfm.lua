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
    obj:setMargins({top=5,bottom=5});
    obj:setHeight(320);

    obj.label = GUI.fromHandle(_obj_newObject("label"));
    obj.label:setParent(obj);
    obj.label:setName("label");
    obj.label:setAlign("left");
    obj.label:setText("");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setColor("#2d5d7b");
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setHeight(40);
    obj.rectangle1:setName("rectangle1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setMargins({left=10,top=5});
    obj.button1:setAlign("left");
    obj.button1:setWidth(80);
    obj.button1:setText("Novo");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setMargins({left=10,top=5});
    obj.button2:setAlign("left");
    obj.button2:setText("Random");
    obj.button2:setName("button2");

    obj.Toggle = GUI.fromHandle(_obj_newObject("button"));
    obj.Toggle:setParent(obj.rectangle1);
    obj.Toggle:setName("Toggle");
    obj.Toggle:setMargins({left=10,top=5});
    obj.Toggle:setAlign("left");
    obj.Toggle:setWidth(80);
    obj.Toggle:setText("Esconder");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle1);
    obj.button3:setMargins({left=10,top=5});
    obj.button3:setAlign("left");
    obj.button3:setText("Porcentagens");
    obj.button3:setWidth(120);
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle1);
    obj.button4:setMargins({left=10,top=5});
    obj.button4:setAlign("left");
    obj.button4:setText("Apagar");
    obj.button4:setWidth(80);
    obj.button4:setName("button4");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj);
    obj.rectangle2:setColor("#2d5d7b");
    obj.rectangle2:setAlign("top");
    obj.rectangle2:setHeight(40);
    obj.rectangle2:setName("rectangle2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle2);
    obj.edit1:setAlign("left");
    obj.edit1:setField("name");
    obj.edit1:setMargins({left=10,top=5,bottom=5});
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setWidth(442);
    obj.edit1:setFontSize(16);
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setName("edit1");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setVisible(true);
    obj.scrollBox1:setAlign("top");
    obj.scrollBox1:setHeight(250);
    obj.scrollBox1:setName("scrollBox1");

    obj.rclItens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclItens:setParent(obj.scrollBox1);
    obj.rclItens:setAlign("top");
    obj.rclItens:setName("rclItens");
    obj.rclItens:setField("itens");
    obj.rclItens:setTemplateForm("frmItens");
    obj.rclItens:setAutoHeight(true);


        require("firecast.lua");
        require("utils.lua");
        require("ndb.lua"); 

        function teste2() 
            local node = NDB.load("scripts.lfm")
            local nodeChild = NDB.getChildNodes(node)
            local nodeAtt = NDB.getAttributes(node.testedosteste)
            local name = NDB.getNodeName(node)
            showMessage(tableToStr(node, true))
            showMessage(tableToStr(nodeChild, true))
            showMessage(tableToStr(nodeAtt, true))
            showMessage(tableToStr(name, true))
        end

        function getNomeG(nome)
            if nome == nil then
                return "Nome Genérico"
            else
                return nome
            end
        end

        local function teste()
            local info = NDB.getChildNodes(sheet.itens)
            
            local total = 0

            for i = 1, #info do
                total = total + info[i].chance
            end

            local function getPorcentagem(number)
                return math.floor(((number or 0) / total) * 100)
            end
            
            local result = {}
 
            for i = 1, #info do
                table.insert(result, getNomeG(info[i].nome) .. " = " .. getPorcentagem(info[i].chance) .. "%")
            end

            showMessage(tableToStr(result, true))
        end

        local function Toggle()
            self.rclItens.visible = not self.rclItens.visible

            if self.rclItens.visible then   
                self.Toggle.text = "Esconder"
                self.rclItens.height = 300
            else
                self.Toggle.text = "Mostrar"
                self.rclItens.height = 0
            end

        end

            local function randomizar()
                mesa = Firecast.getRoomOf(sheet)
                chat = mesa.chat
        
                local info = NDB.getChildNodes(sheet.itens)
                
                -- showMessage(tableToStr(info))
        
                chat:enviarMensagem("Definindo...")
                
                local valores = {}
    
                for i = 1, #info do
                    table.insert(valores, tonumber(info[i].chance) or 0)
                end

                -- showMessage(tableToStr(valores))
    
                local total = 0

                for i = 1, #valores do
                    total = total + valores[i]
                end
                
                mesa.chat:rolarDados("1d" .. total, "Escolhendo Ação...",
                function (rolagem)    
                    
                    for i = 1, #valores do
                        for v = 1, valores[i] do
                            if v == rolagem.resultado then
                                chat:enviarMensagem(getNomeG(info[i].nome))
                                if info[i].desc ~= nil then
                                    chat:enviarMensagem("[§K7]" .. info[i].desc)
                                end
                                return
                            else 
                                local menorNumero = 0
                                local maiorNumero = 0

                                for t = 1, i-1 do
                                    menorNumero = menorNumero + valores[t]
                                end

                                for t = 1, i do
                                    maiorNumero = maiorNumero + valores[t]
                                end

                                if tonumber(v + menorNumero) == rolagem.resultado then
                                    if rolagem.resultado > menorNumero and rolagem.resultado <= maiorNumero then
                                        chat:enviarMensagem(getNomeG(info[i].nome))
                                        if info[i].desc ~= nil then
                                            chat:enviarMensagem("[§K7]" .. info[i].desc)
                                        end
                                        return
                                    end
                                end
                            end
                        end
                    end
                end)
            end
    


    


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclItens:append()
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            randomizar()
        end, obj);

    obj._e_event2 = obj.Toggle:addEventListener("onClick",
        function (_)
            Toggle()
        end, obj);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (_)
            teste()
        end, obj);

    obj._e_event4 = obj.button4:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet)
        end, obj);

    function obj:_releaseEvents()
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label ~= nil then self.label:destroy(); self.label = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.Toggle ~= nil then self.Toggle:destroy(); self.Toggle = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.rclItens ~= nil then self.rclItens:destroy(); self.rclItens = nil; end;
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
