mkdir -p data
curl -o example-data.zip --header 'Private-Token: yiuskGfW5Z31io2bmwgh'  http://tesla.parallel.ru/api/v4/projects/145/packages/generic/example-data/0.1.0/example-data.zip
unzip example-data.zip
mv -u example-data/* data/
mkdir -p pics
cd pics
