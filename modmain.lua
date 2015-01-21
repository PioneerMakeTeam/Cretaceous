modimport'themod.lua'
GLOBAL.require 'constants'
TheMod=TheMod()

io=GLOBAL.io

TheMod:LoadPrefabsFile()
TheMod:LoadStringFile()


function SimInit(player)
  TheMod:SqawnST2Player("dreamtent")
  TheMod:AddKeyClick(1108,function ()
      TheMod:GetWorldPrefabNum("rabbit")
      end)
  
end

AddSimPostInit(SimInit )


