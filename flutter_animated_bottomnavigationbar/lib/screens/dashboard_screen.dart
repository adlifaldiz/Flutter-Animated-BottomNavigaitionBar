import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key}) : super(key: key);
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        shadowColor: Colors.transparent,
        title: Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double maxHeight = constraints.maxHeight;
              final double maxWidth = constraints.maxWidth;
              return Container(
                color: Theme.of(context).primaryColor,
                width: maxWidth,
                height: maxHeight,
              );
            },
          ),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double maxHeight = constraints.maxHeight;
              final double maxWidth = constraints.maxWidth;
              return Container(
                width: maxWidth,
                height: maxHeight,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, -2),
                        blurRadius: 4.0,
                      )
                    ]),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
