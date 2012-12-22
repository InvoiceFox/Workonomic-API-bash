General API guidelines
======================

_State: first version, this document will improve._

For concrete list and description of resources and methods visit the
[Workonomic API explorer](http://workonomic.cc/api-explorer.html).
You will need and API token for that.

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

Passing arguments
-----------------

You can also notice we defined a method argument here (id=18). We must send arguments over as regular x-www-form-urlencoded 
POST values. All API requests must be POST calls.

```bash
$ curl -v -k \
  -u pdabm35106fnc7kzy7uatv9rd5rgasdasdsadasd:x \
  -d "id=18" \
  "http://workonomic.cc/API?_r=project&_m=select-one&_f=csv"

>> id;shortname;name;id_client;special;qtymu;qlylabels;deftime;color;billable
	14;abel;Abelie.biz;16;0;;;30;;1
```


Output formats
--------------

By default API returns JSON as in first example, but you can look at the second example where we defined csv output. 
But we can define a format, in this case csv (comma separated values).

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

Explore mode
------------

You enter explore mode by setting the _x flag. 

Explore mode can be invoked:

 * withouth resource or method defined: in this case it retuns the list of resoures
 * with just resource defined: returns the list and descriptions of methods
 * with resource and method: retuns the list of arguments

```bash
$ curl -v -k \
  -u pdabm35106fnc7kzy7uatv9rd5rga32jchet208e:x \
  -d "" \
  "http://workonomic.cc/API?_r=project&_x=1"

>> [[{"name":"insert-into","description":"Inserts item into the table and returns the last id."},
	{"name":"insert-select","description":"Insert item into the table and returns the unit as stored in the table."},
	{"name":"update","description":"Updates item with given ID with given values."},
	...]] 
```


Let's recap
-----------

 * all calls must be HTTP POST
 * pass API token as HTTP BASIC AUTH username (when out of alpha workonomic.cc will run over HTTPS!)
 * define resource and method with _r and _m
 * optionally define output format with _f
 * use _x for explore mode (returns information about the current level)
 * form-urlencode arguments and send them as POST data
 * you can stack multiple method calls inside one HTTP call and the result of the last will get returned


Error statuses
--------------


 * 400 - no resource given
 * 400 - no method given
 * 401 - wrong api token
 * 403 - validation error (returned data shows the error, for example: ["validation",{"id":"required"}] )
 * 404 - resource or method not found
 * 500 - internal server error

