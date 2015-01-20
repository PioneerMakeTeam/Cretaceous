modimport'themod.lua'
TheMod=TheMod()

io=GLOBAL.io

TheMod:LoadPrefabsFile()
TheMod:LoadStringFile()


function SimInit(player)
  TheMod:SqawnST2Player("dreamtent")
end

AddSimPostInit(SimInit )


