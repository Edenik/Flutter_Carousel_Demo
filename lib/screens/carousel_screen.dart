import 'package:flutter/material.dart';
import 'package:flutter_carousel_demo/data.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselScreen extends StatefulWidget {
  @override
  _CarouselScreenState createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  int _currentImage = 0;
  bool _autoPlay = false;
  CarouselController carouselController = CarouselController();

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < carouselImages.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Carousel Demo'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                initialPage: 0,
                enlargeCenterPage: true,
                autoPlay: _autoPlay,
                reverse: false,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 1500),
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, _) {
                  setState(() {
                    _currentImage = index;
                  });
                },
              ),
              carouselController: carouselController,
              items: carouselImages.map((imageOBJ) {
                return Builder(builder: (BuildContext context) {
                  return Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                        ),
                        child: Image.network(
                          imageOBJ.url,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        child: Text(
                          '${imageOBJ.title}',
                          style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.black45,
                            fontSize: 18,
                          ),
                        ),
                        bottom: 10.0,
                        left: 20.0,
                      )
                    ],
                  );
                });
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(carouselImages.toList(), (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentImage == index
                          ? Colors.black
                          : Colors.black45),
                );
              }),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: goToPrevious,
                  child: Text(
                    '<',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                OutlineButton(
                  onPressed: goToNext,
                  child: Text(
                    '>',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                    value: _autoPlay,
                    onChanged: (val) {
                      setState(() {
                        _autoPlay = val;
                      });
                    }),
                Text('Auto Play?')
              ],
            )
          ],
        ),
      ),
    );
  }

  goToPrevious() {
    carouselController.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    carouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}
