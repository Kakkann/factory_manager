import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:factory_manager/control/page_redirector.dart';

class MainView extends StatelessWidget {
  const MainView({super.key, required this.theme});
  final theme;

  @override
  Widget build(BuildContext context) {
    var pageRedirector = context.watch<PageRedirector>();
    var name = pageRedirector.name;
    var page = pageRedirector.page;
    return Expanded(
      child: Container(
        color: theme.colorScheme.primaryContainer,
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 10.0),
            child: Text(
              name,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.secondary),
            ),
          ),
          page
        ]),
      ),
    );
  }
}
