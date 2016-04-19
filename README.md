data_adapter Cookbook
=========================

This cookbook provides a uniform, simple, and abstract interface to
loading data from arbitrary sources into node attributes.


Motivation
---

This cookbook arose from a need to override node attributes at the
same _precedence_ as in an environment file, but in a context when
using environment files was not an option. After scrutinizing the
attribute hierarchy, we concluded that we could simulate environment
attribute assignments by using the `force_default` for default
attributes and `force_override` for override attributes in an
attributes file.

Although our initial use case involved loading data from data bag
items, we realized the value of providing Chef recipes with a uniform,
simple, and abstract interface to data sources. The _Supported Data
Sources_ section describes the data source formats.

Requirements
------------

This cookbook depends on no other cookbooks or packages.

Attributes
----------

_Pending_

#### data_adapter::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['data_adapter']['sources']</tt></td>
    <td>Array</td>
    <td>Load data from the specified list of sources</td>
    <td><tt>[]</tt></td>
  </tr>
</table>

Usage
-----
#### data_adapter::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `data_adapter` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[data_adapter]"
  ]
}
```

Supported Data Sources
---

In principle, this cookbook can load data from any source whose
requests can be encoded in a URL and whose response format is
JSON. For sources that return data in other formats, one can write
_adapter middleware_ to transform the response into JSON and,
ultimately, a Ruby `Hash` object. A subsequent section explains how to
write middleware.

As we noted above, you designate the sources to load by populating the
`data_adapter/sources` node attribute array using Chef's `normal` or
`override` precedence.

Data Bag Items
---

*URL format:* `bag://<bag name>/<item name>`

Use this source to load the `<item name>` item from the `<bag name>`
data bag.

*Examples:*

  * `bag://widgets/doodad`: load the `doodad` item from the `widgets`
    data bag

Simulating Chef Environment Attributes
---

_Pending_

Extending the Cookbook with Adapter Middleware
---

_Pending_

Contributing
------------

We welcome community contributions following the customary pull
request workflow:

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Develop your feature
4. Write tests for your feature
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

Workday's Chef Service Team developed this cookbook. We can be reached
at <workday.chefs@workday.com>.
