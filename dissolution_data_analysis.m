% Step 1: Load your data from the CSV file
data = readtable('salt_dissolution_data.csv');

% Show the first few rows to make sure it loaded correctly
head(data)

% Step 2: Group the data by Quantity and Pattern
stats = groupsummary(data, {'qtyOfSalt', 'Pattern'}, {'mean', 'std'}, 'Time');

% View the grouped summary
disp(stats)

% Step 3: Select only 6g rows
data6g = stats(stats.qtyOfSalt == 6, :);

% Bar plot of average time per pattern (6g)
figure;
bar(categorical(data6g.Pattern), data6g.mean_Time)
hold on;
errorbar(categorical(data6g.Pattern), data6g.mean_Time, data6g.std_Time, '.')
title('6g Salt - Avg Time per Pattern')
ylabel('Time Taken (seconds)')

% Step 4: Select only 11g rows
data11g = stats(stats.qtyOfSalt == 11, :);

% Bar plot of average time per pattern (11g)
figure;
bar(categorical(data11g.Pattern), data11g.mean_Time)
hold on;
errorbar(categorical(data11g.Pattern), data11g.mean_Time, data11g.std_Time, '.')
title('11g Salt - Avg Time per Pattern')
ylabel('Time Taken (seconds)')


