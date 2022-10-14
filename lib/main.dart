import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  final titleAppBar = 'Weather';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'OpenSans'),
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
          title: Text(
            titleAppBar,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
            ),
            onPressed: () {},
          ),
          iconTheme: IconThemeData(
            color: Colors.black54,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 160, 185, 197),
          ),
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _headerImage(),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _weatherDescription(),
                Divider(),
                _temperature(),
                Divider(),
                _temperatureForecast(),
                Divider(),
                _footerRatings(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Image _headerImage() {
  return Image(
    image: NetworkImage(
      'https://www.studyfrench.ru/uploads/server/MnoA9HXEUEoZDrqz.jpg',
    ),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(
        'Tuesday - May 22',
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      Divider(),
      Text(
        'Чтобы узнать всю погоду, которую предлагает наш мир, просто взгляните на огромную библиотеку бесплатных метеорологических снимков Shutterstock.',
        style: TextStyle(
          color: Colors.black54,
        ),
      )
    ],
  );
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: <Widget>[
          Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
          ),
        ],
      ),
      SizedBox(width: 16.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Text(
                '15° Clear',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                ' Kazakhstan, Astana',
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
            ],
          )
        ],
      ),
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 8.0,
    children: List.generate(8, (int index) {
      return Chip(
        label: Text(
          '${index + 20}°C',
          style: TextStyle(fontSize: 15.0),
        ),
        avatar: Icon(
          Icons.wb_cloudy,
          color: Colors.blue.shade300,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(color: Colors.grey),
        ),
        backgroundColor: Colors.grey.shade100,
      );
    }),
  );
}

Row _footerRatings() {
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.star,
        size: 15,
        color: Colors.yellow[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.yellow[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.yellow[600],
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.black,
      ),
      Icon(
        Icons.star,
        size: 15,
        color: Colors.black,
      ),
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        'Info with openweathermap.org',
        style: TextStyle(
          fontSize: 15.0,
        ),
      ),
      stars,
    ],
  );
}
