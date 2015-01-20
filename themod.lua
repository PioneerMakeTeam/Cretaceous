require=GLOBAL.require
io    =GLOBAL.io
--os    =GLOBAL.os
GetTime=  GLOBAL.GetTime
GetPlayer=GLOBAL.GetPlayer
SpawnPrefab = GLOBAL.SpawnPrefab
require 'class'

--- 整个Mod的基本类
-- 定义了整个mod的环境与常用功能
-- @classmod  TheMod
-- @usage TheMod=(require 'themod' )()
TheMod=Class(function (self)
  
	self.DEBUG=true   --debug模式
	self.EFFIC=false  --性能优化
  
  self.languagedata=GetModConfigData("Language")
  
  if self.languagedata==2 then 
    self.ischinese=true 
  else
    self.isenglish=true
  end
  
  self.oldlogstate=""
  self.logfile=io.open("Modlog"..tostring(GetTime())..".txt","wb")
  print(self.logfile)
  if self.logfile then 
    
  end
  
  

end)

---写入日志
-- @param state 日志状态
-- @param logstr 日志信息
function TheMod:Log(state,logstr)
	if self.logfile then
    if state==self.oldlogstate then 
      self.logfile:write("\t\""..logstr.."\",\n")
    else 
      self.logfile:write("[\""..state.."\"] = ".."\""..logstr.."\",\n")
      self.oldlogstate=state
    end
		if self.DEBUG and self.EFFIC then
			self.logfile:flush()
		end
	end
end

---载入模块
-- @param module_name 模块名
function TheMod:Require(module_name,import)
	if module_name then
    if import then 
      self:Log("Mod Import File" ,module_name)
      modimport(module_name..".lua")
      return 
    end
		if require then
			self:Log("Mod Require File" ,module_name)
			require (module_name)
		end
	end
end


function TheMod:SqawnST2Player(STname)
  if  not self.player then 
     self.player=GetPlayer()
  end
  local x, y, z = self.player.Transform:GetWorldPosition()
	print("spawning item")
	local prefab = SpawnPrefab(STname)
  prefab.Transform:SetPosition( x, y, z )
end

function TheMod:LoadPrefabsFile()
  self:Require("prefabfiles",true)
end

function TheMod:LoadStringFile()
  if self.ischinese then 
     self:Require("string_cn",true)
  else 
     self:Require("string_en",true)
  end
end



return TheMod