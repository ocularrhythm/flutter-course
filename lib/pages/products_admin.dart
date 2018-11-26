import 'package:flutter/material.dart';

import 'package:flutter_course/models/product.dart';
import 'package:flutter_course/pages/product_edit.dart';
import 'package:flutter_course/pages/product_list.dart';

class ProductsAdminPage extends StatelessWidget {
	final Function addProduct;
	final Function deleteProduct;
	final Function updateProduct;
	final List<Product> products;

	ProductsAdminPage(this.addProduct, this.updateProduct, this.deleteProduct, this.products);

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
						ProductListPage(null, null, null),
					],
				),
			),
		);
	}
}
