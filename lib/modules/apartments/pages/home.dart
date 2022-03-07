import 'package:flutter/material.dart';
import 'package:rent_app/modules/apartments/pages/detail.dart';
import 'package:rent_app/modules/user/pages/login.dart';
import 'package:rent_app/modules/user/pages/sign_up.dart';
import 'package:rent_app/shared/widget.dart';
import 'package:rent_app/shared_preferences/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Status bar color
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _rowTitle(),
                  const SizedBox(
                    height: 10,
                  ),
                  _rowSubtitle(),
                  const SizedBox(
                    height: 30,
                  ),
                  _columnSlider()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _rowTitle() {
            var userPreferences = UserPreferences();
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Text("Explore",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 30)),
      IconButton(
          onPressed: () {
            final route = MaterialPageRoute(builder: (context) => SignUpPage() );
            Navigator.push(context, route);
          },
          icon:  Icon(Icons.account_circle, 
          color: userPreferences.login?Colors.green:Colors.black45 
          ))
    ]);
  }

  Widget _rowSubtitle() {
    return Row(children: const [
      Text("All this apartments near to you",
          style: TextStyle(
            color: Colors.black26,
            fontWeight: FontWeight.w200,
            //fontSize: 24
          ))
    ]);
  }

  Widget _columnSlider() {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              "The best prices",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        ClipRRect(
            child: Image.asset("assets/apartment_1.jpeg"),
            borderRadius: BorderRadius.circular(25)),
        const SizedBox(
          height: 10,
        ),
        apartmentPrice(context),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: const [
            Text("Ansgus Gorrie Soft",
                style: TextStyle(                    
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ],
        ),
        Row(children: const [
          Text("The Gardenias Avenu 5ol",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w200,
                //fontSize: 24
              ))
        ]),
        const SizedBox(
          height: 15,
        ),
        _apartmenList()
      ],
    );
  }

  Widget _apartmenList() {
    List items = [1, 2, 3, 4, 5, 6, 7];
    List<Widget> children = items
        .map(
          (e) => _apartmenCard(e),
        )
        .toList();
    return Wrap(runSpacing: 15, children: children);
  }

  Widget _apartmenCard(int index) {
    return InkWell(
      onTap: () {
        //showDialog(context: context, builder: (context) => DetailPage(), useSafeArea: false);
        final route = MaterialPageRoute(
          builder: (context) => DetailPage(index: index),
        );
        Navigator.push(context, route);
      },
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                child: Hero(
                  tag: "IMG$index",
                  child: ClipRRect(
                      child: Image.network(
                          "https://picsum.photos/seed/${index}/100"),
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: const [
                  Text("Name of apartment",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15))
                ]),
                const SizedBox(
                  height: 5,
                ),
                Row(children: const [
                  Text("This is a address",
                      // maxLines: 2,
                      // overflow: TextOverflow.fade,
                      style: TextStyle(fontWeight: FontWeight.w200))
                ]),
                const SizedBox(
                  height: 5,
                ),
                apartmentPrice(context),
              ],
            ),
          )
        ],
      ),
    );
  }
}
