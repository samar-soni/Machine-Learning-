% Load the training and testing datasets
train_data = readtable('train.csv');
test_data = readtable('test.csv');

% Display first few rows to understand structure
head(train_data)

% Handle missing data (example: fill missing age with median)
train_data.Age = fillmissing(train_data.Age, 'constant', median(train_data.Age,'omitnan'));
test_data.Age = fillmissing(test_data.Age, 'constant', median(test_data.Age,'omitnan'));

% Convert categorical columns to numerical (Example: 'Sex' and 'Embarked')
train_data.Sex = double(strcmp(train_data.Sex,'male'));
test_data.Sex = double(strcmp(test_data.Sex,'male'));

train_data.Embarked = grp2idx(categorical(train_data.Embarked)); % 1, 2, 3 for different ports
test_data.Embarked = grp2idx(categorical(test_data.Embarked));

% Drop unnecessary columns like 'Name', 'PassengerId', 'Ticket', 'Cabin'
train_data = removevars(train_data, {'Name', 'PassengerId', 'Ticket', 'Cabin'});
test_data = removevars(test_data, {'Name', 'PassengerId', 'Ticket', 'Cabin'});
