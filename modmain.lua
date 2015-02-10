
modimport'themod.lua'
require=GLOBAL.require
GLOBAL.require 'constants'
--[[
GLOBAL.require 'map/tasks/the_task'
GLOBAL.require 'map/rooms/the_room']]
require("map/level")
require("map/levels")

TheMod=TheMod()

if TheMod.DEBUG then
    GLOBAL.CHEATS_ENABLED=true
    require "debugkeys"
end


GLOBAL.TheMod=TheMod

io=GLOBAL.io
LEVELTYPE = GLOBAL.LEVELTYPE

print(LEVELTYPE)

TheMod:LoadPrefabsFile()
      :LoadStringFile()
      :AddMemFix()

      :RemoveRecipetabs("MAGIC")
      --[[
      :AddLevel(LEVELTYPE.SURVIVAL,{
          id="MY",
          name="m",
          desc="mm",
          overrides={
            --{"start_setpeice","DefaultStart"},
           -- {"start_node","Clearing"},
          },
          tasks={
            "The_Task",
          },
        })]]



function SimInit(player)

  TheMod:SqawnST2Player("dreamtent")
  TheMod:SqawnST2Player("dreamtrrebox")
 TheMod:SqawnST2Player("bearger")

  TheMod:AddKeyClick(1108,function ()
      TheMod:GetWorldPrefabNum("rabbit")
    end)

  TheMod:AddKeyClick(2102,function ()

  TheMod:FreeBuild()
  end)

  TheMod:AddKeyClick(1109,function ()
      print("1109")
     local x,y,z = player.Transform:GetWorldPosition()
     print(pt)

      TheMod:RebuildLayer({x=x,y=y,z=z},25)
    end)


end

AddSimPostInit(SimInit )


