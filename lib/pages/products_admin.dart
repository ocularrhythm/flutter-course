import 'package:flutter/material.dart';

import 'package:flutter_course/pages/product_edit.dart';
import 'package:flutter_course/pages/product_list.dart';
import 'package:flutter_course/scoped_models/main.dart';

class ProductsAdminPage extends StatelessWidget {
	final MainModel model;

	ProductsAdminPage(this.model);

	Drawer _buildDrawer(BuildContext context) {
		return Drawer(
			child: Column(
				children: <Widget>[
					AppBar(
						automaticallyImplyLeading: false,
						title: Text('Choose'),
					),
					ListTile(
						leading: Icon(Icons.shop),
						title: Text('All Products'),
						onTap: () => Navigator.pushReplacementNamed(context, '/'),
					),
				],
			),
		);
	}

	@override
	Widget build(BuildContext context) {
		return DefaultTabController(
			length: 2,
			child: Scaffold(
				drawer: _buildDrawer(context),
				appBar: AppBar(
					title: Text('Manage Products'),
					bottom: TabBar(
						tabs: <Widget>[
							Tab(
								icon: Icon(Icons.create),
								text: 'Create Product',
							),
							Tab(
								icon: Icon(Icons.list),
								text: 'My Products',
							),
						],
					),
				),
				body: TabBarView(
					children: <Widget>[
						ProductEditPage(),
						ProductListPage(model),
					],
				),
			),
		);
	}
}
