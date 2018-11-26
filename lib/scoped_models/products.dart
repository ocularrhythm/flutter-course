import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_course/models/product.dart';

class ProductsModel extends Model {
	List<Product> _products = [];
	int _selectedProductIndex;
	bool _showFavorites = false;


	List<Product> get products {
		return List.from(_products);
	}


	int get selectedProductIndex {
		return _selectedProductIndex;
	}


	Product get selectedProduct {
		if (_selectedProductIndex == null) {
			return null;
		}

		return _products[_selectedProductIndex];
	}


	List<Product> get displayedProducts {
		if (_showFavorites) {
			return _products.where((Product product) => product.isFavorite).toList();
		}

		return List.from(_products);
	}


	bool get displayFavoritesOnly {
		return _showFavorites;
	}


	void addProduct(Product product) {
		_products.add(product);
		_selectedProductIndex = null;
		notifyListeners();
	}


	void deleteProduct() {
		_products.removeAt(_selectedProductIndex);
		_selectedProductIndex = null;
		notifyListeners();
	}


	void updateProduct(Product product) {
		_products[_selectedProductIndex] = product;
		_selectedProductIndex = null;
		notifyListeners();
	}


	void selectProduct(int index) {
		_selectedProductIndex = index;
		notifyListeners();
	}


	void toggleDisplayMode() {
		_showFavorites = !_showFavorites;
		notifyListeners();
	}


	void toggleProductFavoriteStatus() {
		_products[_selectedProductIndex] = Product(
			title: selectedProduct.title,
			description: selectedProduct.description,
			price: selectedProduct.price,
			image: selectedProduct.image,
			isFavorite: !selectedProduct.isFavorite,
		);
		notifyListeners();
		_selectedProductIndex = null;
	}
}