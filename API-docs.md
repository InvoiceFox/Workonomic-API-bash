General API documentation
=========================

A basic call
------------

We will use curl for examples, so you can try them for yourself, and curl is sort of alphabeth.

	# list projects
	$ curl -v -k \
	  -u pdabm35106fnc7kzy7uatv9rdasdsadasdasde:x \
	  -d "" \
	  "http://workonomic.cc/API?_r=project&_m=select-all"

	>> [[{"id":14,"shortname":"abel","name":"Abelie.biz","id_client":16,"special":0,"qtymu":null,"qlylabels":null,"deftime":30,"color":"","billable":1},{"id":15,"shortname":"mgam","name":"Usrjoy","id_client":17,"special":0,"qtymu":null,"qlylabels":null,"deftime":30,"color":"","billable":0},]]

asdasd
