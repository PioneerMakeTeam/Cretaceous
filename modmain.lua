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
  
  TheMod:AddKeyClick(1109,function ()
      print("1109")
     local x,y,z = player.Transform:GetWorldPosition()
     print(pt)
     
      TheMod:RebuildLayer({x=x,y=y,z=z},25)
    end)
  
  
end

AddSimPostInit(SimInit )


