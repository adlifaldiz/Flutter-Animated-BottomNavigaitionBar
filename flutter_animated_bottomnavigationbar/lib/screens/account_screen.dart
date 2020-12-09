import 'package:flutter/material.dart';
import 'package:flutter_animated_bottomnavigationbar/data/data.dart';
import 'package:flutter_animated_bottomnavigationbar/helpers/color_helper.dart';
import 'package:flutter_animated_bottomnavigationbar/models/course_model.dart';
import 'package:flutter_animated_bottomnavigationbar/models/user_model.dart';
import 'package:flutter_animated_bottomnavigationbar/widgets/column_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          'Your Acoount',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(40.0),
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
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(200)),
                            child: FaIcon(
                              FontAwesomeIcons.personBooth,
                              color: Colors.blue,
                              size: 40,
                            ),
                          ),
                        ),
                        Container(
                          height: 80,
                          child: VerticalDivider(
                            color: Colors.white,
                            thickness: 2,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  currentUser.idNumber,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  currentUser.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  currentUser.birthDate,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    width: 57.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: FlatButton(
                            onPressed: () {},
                            splashColor: Colors.blue[200],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.userEdit,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ColumnBuilder(
              itemBuilder: (BuildContext context, int index) {
                final CourseModel courseModel = courses[index];
                return Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  padding: EdgeInsets.all(10.0),
                  height: 80.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              courseModel.courseName,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                                '${courseModel.courseAccomplished}/${courseModel.courseMax}',
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            final double maxBarWidth = constraints.maxWidth;
                            final double percent =
                                courseModel.courseAccomplished /
                                    courseModel.courseMax;
                            double barWidth = percent * maxBarWidth;
                            double shadowWidth = 0;

                            if (barWidth < 0) {
                              barWidth = 0;
                            }
                            return Stack(
                              children: [
                                Container(
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: barWidth,
                                  decoration: BoxDecoration(
                                    color: getColor(context, percent),
                                    borderRadius: BorderRadius.circular(20.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(shadowWidth, 0),
                                        blurRadius: 6.0,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: courses.length,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
