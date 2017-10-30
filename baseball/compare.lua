local M = {}
function M.compareInput(base, cmp)
  local str_cnt = 0;
  local ball_cnt = 0;

  for i = 1, 3 do
    for j = 1, 3 do
      if (base[i] == cmp[j] and i == j) then
        str_cnt = str_cnt + 1;
      elseif (base[i] == cmp[j] and i ~= j) then
        ball_cnt = ball_cnt + 1;
      end
    end
  end

  print("Your Result is B : " .. ball_cnt .. " / S :" .. str_cnt)

  if str_cnt == 3 then return true;
  else return false;
  end
end

return M
