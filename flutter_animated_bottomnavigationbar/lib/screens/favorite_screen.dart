import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({Key key}) : super(key: key);
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with AutomaticKeepAliveClientMixin {
  _favoriteBuild(int index) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              width: 1.0,
              color: Colors.grey[200],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.heartBroken,
                      color: Theme.of(context).primaryColor,
                      size: 70,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nemesin Nudal aowdwidoqpikjdowife dqdhoqjdiqjwodiqwodiqwj',
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text('Nemesin Nudal'),
                            Text('Nemesin Nudal'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.userEdit,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          'Favorite',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 500,
          itemBuilder: (context, index) {
            return _favoriteBuild(index);
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
