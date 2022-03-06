import 'package:flutter/material.dart';
import 'package:rent_app/pages/home.dart';

class DetailPage extends StatefulWidget {
  final int index;
  const DetailPage({Key? key, required this.index}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black)),
          backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            _rowImage(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: _columnDetail(),
            )
          ]),
        ),
      ),
    );
  }

  Widget _rowImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width -
              MediaQuery.of(context).size.width / 10,
          child: Hero(
            tag: "IMG${widget.index}",
            child: ClipRRect(
                child: Image.network(
                    "https://picsum.photos/seed/${widget.index}/800"),
                borderRadius: BorderRadius.circular(25)),
          ),
        ),
      ],
    );
  }

  Widget _columnDetail() {
    return Column(
      children: [
        Row(
          children: const [
            Text("Ansgus Gorrie Soft",
                style: TextStyle(
                    fontFamily: 'Kanit',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
          ],
        ),
        Row(children: const [
          Text("The Gardenias Avenu 5ol",
              style: TextStyle(
                color: Colors.black26,
                fontWeight: FontWeight.w100,
                //fontSize: 24
              ))
        ]),
        _apartmentPrice(),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: const [
            Text(
              "About the apartment",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            )
          ],
        ),
        _rowDetail(),
        _cardService(),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: const [
            Text(
              "About the owner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            )
          ],
        ),
        _rowContact()
      ],
    );
  }

  Widget _apartmentPrice() {
    return Row(
      children:  [
        Text(
          "\$250",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
          color: Theme.of(context).primaryColor ),
        ),
        Text("/Month",
            style: TextStyle(
              color: Colors.black26,
              fontWeight: FontWeight.w100,
            )),
      ],
    );
  }

  Widget _rowDetail() {
    return Row(
      children: const [
        Flexible(
          child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black26,
                fontWeight: FontWeight.w100,
              )),
        )
      ],
    );
  }

  Widget _cardService() {
    return Card(
      color: const Color.fromRGBO(202, 249, 230, 50),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(
              Icons.check_box_rounded,
              color: Color.fromRGBO(25, 196, 156, 1),
            ),
            Text("This apartment includes aditional services")
          ],
        ),
      ),
    );
  }

  Widget _rowContact() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          flex: 1,
          child: Column(
            children: const [
              CircleAvatar(
                backgroundColor: Color.fromRGBO(25, 196, 156, 1),
                child: Icon(Icons.person, color: Colors.white),
              )
            ],
          ),
        ),
        Flexible(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    "Dantee Astudillo",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Row(
                children: const [
                  Text(
                    "0985090096",
                    style: TextStyle(
                      color: Color.fromRGBO(25, 196, 156, 1),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Flexible(
          child: Column(
            children: const [
              IconButton(onPressed: null, icon: Icon(Icons.call))
            ],
          ),
        )
      ],
    );
  }
}
