import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_course/scoped_models/connected_products.dart';

class MainModel extends Model with ConnectedProductsModel, ProductsModel, UserModel, UtilityModel {}
