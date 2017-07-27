player_number = 100;
initial_mony = 100;
round_number = 50000;

player_mony = initial_mony * ones(player_number, 1);
share_idx = [1:player_number]';
player_idx = [1:player_number]';
player_time = zeros(player_number, round_number);

for i = 1:round_number
  player_mony = player_mony - 1;
  mony_to_tmp = randi(player_number-1, player_number, 1);
  mony_to = mony_to_tmp + ((mony_to_tmp - player_idx) >= 0);
  mony_col = histc(mony_to, player_idx);
  player_mony = player_mony + mony_col;
  player_time(:, i) = player_mony;
end

bar(player_idx, player_mony);

color_list = ['r', 'b', 'y'];
figure;
for i = 1:3
  hold on, plot ([1:round_number], player_time(i, :), color_list(i) )
end
