--[[
    Author: Rask/AfraiEda
    Creation Date: 24/11/2022

    Description:
        No description provided.

    Documentation:
        No documentation provided.
--]]

--= Root =--
local testserver = {}

--= Roblox Services =--

--= Modules & Config =--

--= Constants =--

--= Variables =--

--= Functions =--

--= Job API =--
function testserver:run()
    testserver:salut("pupute")
    print(testserver)
    print("salut c le server")
end
function testserver:salut(phrase)
    print(phrase)
end

return testserver