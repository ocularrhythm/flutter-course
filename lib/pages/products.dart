import 'package:flutter/material.dart';

import 'package:flutter_course/widgets/products/products.dart';

class ProductsPage extends StatelessWidget {

	Drawer _buildDrawer(BuildContext context) {
		return Drawer(
			child: Column(
				children: <Widget>[
					AppBar(
						automaticallyImplyLeading: false,
						title: Text('Choose'),
					),
					ListTile(
						leading: Icon(Icons.edit),
						title: Text('Manage Products'),
						onTap: () {
							Navigator.pushReplacementNamed(context, '/admin');
						},
					),
				],
			),
		);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			drawer: _buildDrawer(context),
			appBar: AppBar(
				title: Text('EasyList'),
				actions: <Widget>[
					IconButton(
						icon: Icon(Icons.favorite),
						onPressed: () {},
					),
				],
			),
			body: Products(),
		);
	}
}
