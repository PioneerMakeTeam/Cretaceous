infile=io.open("build.bin","rb")

head= infile:read(20)

while i~= 1 do
str=infile:read(1)
i=str:byte()
end

endstr=infile:read("*a")

out=io.open("out.build.bin","wb")
out:write(head)
out:write("dreamtrrebox")
out:write(string.char(1))
out:write(endstr)
