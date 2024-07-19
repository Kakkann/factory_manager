import 'package:flutter/cupertino.dart';
import 'package:factory_manager/pages/home.dart';
import 'package:factory_manager/pages/reg_product_page.dart';
import 'package:factory_manager/pages/coleta.dart';

class PageRedirector with ChangeNotifier {
  Widget page = NewsBlock();
  String name = "Home";

  void setPage(int value) {
    switch (value) {
      case 0:
        page = NewsBlock();
        name = "Home";
        break;
      case 1:
        page = RegisterProductPage();
        name = "Cadastro de Produtos";
        break;
      case 2:
        page = Coleta();
        name = "Coletas";
        break;
      default:
        throw UnimplementedError('no widget for $value');
    }

    notifyListeners();
  }
}
