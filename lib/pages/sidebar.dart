import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:factory_manager/control/page_redirector.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  bool onMenu = false;
  var selectedIndex = 0;

  void _menuEnter(PointerEnterEvent enterEvent) {
    setState(() {
      onMenu = true;
    });
  }

  void _menuExit(PointerExitEvent exitEvent) {
    setState(() {
      onMenu = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var pageRedirector = context.watch<PageRedirector>();

    return SafeArea(
      child: MouseRegion(
        onEnter: _menuEnter,
        onExit: _menuExit,
        child: NavigationRail(
          extended: onMenu,
          destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.home),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.edit_document),
              label: Text('Cadastrar Produtos'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.local_shipping),
              label: Text('Coletas'),
            ),
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            selectedIndex = value;
            pageRedirector.setPage(value);
          },
        ),
      ),
    );
  }
}
