import 'package:flutter/material.dart';
import 'package:food_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {

  static const routeName = '/filters';

  final Function setFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.filters, this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  var _vegan = false;
  var _vegeterian = false;
  var _glutenFree = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.filters["gluten"];
    _lactoseFree = widget.filters["lactose"];
    _vegeterian = widget.filters["vegetarian"];
    _vegan = widget.filters["vegan"];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Your Filters"),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.save,
                ),
                onPressed: () {
                  Map<String, bool> _filters = {
                    "gluten" : _glutenFree,
                    "lactose" : _lactoseFree,
                    "vegan" : _vegan,
                    "vegetarian" : _vegeterian,
                  };
                  widget.setFilters(_filters);
                }
              )
            ],
          ),
          drawer: MainDrawer(),
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Adjust your meal selection",
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    _buildSwitchListTile(
                      "Gluten-free",
                      "Show items that are gluten-free",
                      _glutenFree,
                      (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                    _buildSwitchListTile(
                      "Lactose-free-free",
                      "Show items that are lactose-free",
                      _lactoseFree,
                      (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
                    _buildSwitchListTile(
                      "Vegeterian",
                      "Show items that are vegeterian",
                      _vegeterian,
                      (newValue) {
                      setState(() {
                        _vegeterian = newValue;
                      });
                    }),
                    _buildSwitchListTile(
                      "Gluten-free",
                      "Show items that are vegan",
                      _vegan,
                      (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
              ],
            ),
          ),
        ],
      )
    );
  }
}