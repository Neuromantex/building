function checkFuel()
fuel = 100
        pcall(function() fuel =turtle.getFuelLevel() end)
        if fuel == "unlimited" then
                fuel = 100
        end
        print(fuel)
        if fuel<80  then
                turtle.select(16)
                turtle.refuel(1)
        end
end

function up(l)
  checkFuel()
  l=l or 1
  for i=1,l do
    local tries = 0
    while turtle.up() ~= true do
      turtle.digUp()
      turtle.attackUp()
      sleep(0.2)
      tries = tries + 1
      if tries>500 then
        print("Error: can't move up.")
        return false
      end
    end
  end
  return true
end

function down(l)
  checkFuel()
  l=l or 1
  for i=1,l do
    local tries = 0
    while turtle.down() ~= true do
      turtle.digDown()
      turtle.attackDown()
      sleep(0.2)
      tries = tries + 1
      if tries>500 then
        print("Error: can't move down.")
        return false
      end
    end
  end
  return true
end
	

function forward(l)
  checkFuel()
  l=l or 1
  for i=1,l do
	local tries = 0
	while turtle.forward() ~= true do
		turtle.dig()
		turtle.attack()
		sleep(0.2)
		tries = tries + 1
		if tries>500 then
			print("Error: can't move forward.")
			return false
		end
	end
  end
  return true
end
function digUp()
  local tries = 0
  while turtle.detectUp() do
    turtle.digUp()
    sleep(0.4)
    tries = tries + 1
    if tries>500 then
      print("Error: dug up for too long.")
      return false
    end
  end
  return true
end

function digForward()
  local tries = 0
  while turtle.detect() do
    turtle.dig()
    sleep(0.4)
    tries = tries + 1
    if tries>500 then
      print("Error: dug down for too long.")
      return false
    end
  end
  return true
end

function turnAround()
  turtle.turnRight()
  turtle.turnRight()
end
function digRow(l) 
	for j=1,l do
		forward()
	end
end

local function outOfResource()
	print("Ran out of a resource. Block: ",block , ".")
	print("Refill, then say something to proceed.")
	read()
end