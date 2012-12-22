General API documentation
=========================

A basic call
------------

We use curl for examples, so you can try them for yourself. Here we call resource "project" with method "select-all". 
We get the JSON with data back, which is default format. API token is passed an HTTP BASIC AUTH user parameter.

```bash
$ curl -v -k \
  -u pdabm35106fnc7kzy7uatv9rdasdsadasdasde:x \
  -d "" \
  "http://workonomic.cc/API?_r=project&_m=select-all"

>> [[{"id":14,"shortname":"abel","name":"Abelie.biz","id_client":16,"special":0,"qtymu":null,
	qlylabels":null,"deftime":30,"color":"","billable":1},{"id":15,"shortname":"mgam","name":"Usrjoy",
	"id_client":17,"special":0,"qtymu":null,"qlylabels":null,"deftime":30,"color":"","billable":0},]]
```

Ouptut formats and arguments
----------------------------

By default API return JSON as in previous example. But we can define a format, in this case csv (comma separated values).

```bash
$ curl -v -k \
  -u pdabm35106fnc7kzy7uatv9rd5rgasdasdsadasd:x \
  -d "id=18" \
  "http://workonomic.cc/API?_r=project&_m=select-one&_f=csv"

>> id;shortname;name;id_client;special;qtymu;qlylabels;deftime;color;billable
	14;abel;Abelie.biz;16;0;;;30;;1
```

You can also notice we defined a method argument here (id=18). We must send arguments over as regular x-www-form-urlencoded 
POST values. All API requests must be POST calls.


Output formats
--------------

* json - JSON
* csv - comma separated values
* rmap - rebol map
* tsv - tab separated values (todo)
* xml - XML (todo)


Stacking methods
----------------

We can stack multiple methods. They are called sequentiall and the result of the last one is returned.

```bash
$ curl -v -k \
  -u pdabm35106fnc7kzy7uatv9rd5rgasdasdsadasd:x \
  -d "id=18" \
  "http://workonomic.cc/API?_r=project&_m=insert-into&_m2=select-all"

>> id;shortname;name;id_client;special;qtymu;qlylabels;deftime;color;billable
	14;abel;Abelie.biz;16;0;;;30;;1
	15;bobo;Bobo.cc;13;0;;;30;;1
```


