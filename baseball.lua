local inspect = require('inspect')
maxTrial = 5
curTrial = 5
-- region <Table>
-- List = {2, 3, 4}
-- Dict = {a = 2, b = 3, c = 4}
-- table.insert(tbl, 2) -- Insert(val)
-- **Print Table** `ipairs` to iterate through array-like tables, `pairs` to iterate through record-like tables.
-- for index, data in ipairs(people) do
-- for key, val in pairs(people) do
-- endregion
computer = {}

-- region <function>
-- function's variable will be global unless defining with *local* Directive
-- endregion
function initBaseball()
  -- region <String>
  -- print("Hello ".."World!"); -- String Concat
  -- endregion
  local initMessage = "Hello " .. "Baseball!"
  print(initMessage);

  -- region <Random>
  -- math.random() -- gen between 0, 1
  -- math.random(upper) -- gen between 1, upp
  -- math.random(lower, upper) -- gen between low, upp
  -- endregion
  math.randomseed(os.time()) -- for random Seed

  -- region <for, while>
  -- for i = 1, 100 do; [user_code] done; -- range with increase
  -- for i = 100, 1, -1 do; [user_code] done; -- range with decrease
  -- repeat; [user_code] until i==0; -- range with decrease
  -- endregion
  for i = 1, 3 do
    -- TODO: Duplicate Entry?
    computer[i] = math.random(10)
  end

  print("Computer Ready. Trial : " .. maxTrial .. "\nGood Luck!");
end

function userInput()
  print("Your Input ?")
  local input = {}
  -- region <Input>
  -- s = io.read("*n") -- read a number
  -- s = io.read("*l") -- read a line (default when no parameter is given)
  -- s = io.read("*a") -- read the complete stdin
  -- s = io.read(7) -- read 7 characters from stdin
  -- x,y = io.read(7,12) -- read 7 and 12 characters from stdin and assign them to x and y
  -- a,b = io.read("*n","*n") -- read two numbers and assign them to a and b
  -- https://stackoverflow.com/questions/12069109/getting-input-from-the-user-in-lua
  -- endregion
  input[1], input[2], input[3] = io.read("*n", "*n", "*n")
  print(input[1], input[2], input[3])
  return input;
end

initBaseball()

local cmp = require('baseball/compare')

repeat
  local user = userInput()
  local success = cmp.compareInput(computer, user)

  if success then
    print("You Win!!")
    curTrial = 0;
  else curTrial = curTrial - 1;
  end

until curTrial == 0;

print(inspect(computer)) -- {1, 2, 3}
print(inspect(user)) -- {1, 2, 3}
