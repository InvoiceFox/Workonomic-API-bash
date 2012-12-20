
#
## Workonomic API curl examples
#
# state: just verifying that API and whole concept works. There will be many more examples
#   	 and live documentation is being readied
#

# list projects

$ curl -v -k \
	-u pdabm35106fnc7kzy7uatv9rdasdsadasdasde:x \
	-d "" \
	"http://workonomic.cc/API?_r=project&_m=select-all"

>> [[{"id":14,"shortname":"abel","name":"Abelie.biz","id_client":16,"special":0,"qtymu":null,"qlylabels":null,"deftime":30,"color":"","billable":1},{"id":15,"shortname":"mgam","name":"Usrjoy","id_client":17,"special":0,"qtymu":null,"qlylabels":null,"deftime":30,"color":"","billable":0},]]

# get specific project

$ curl -v -k \
  -u pdabm35106fnc7kzy7uatv9rd5rgasdasdsadasd:x \
  -d "id=18" \
  "http://workonomic.cc/API?_r=project&_m=select-one&_f=csv"

>> id;shortname;name;id_client;special;qtymu;qlylabels;deftime;color;billable
14;abel;Abelie.biz;16;0;;;30;;1

