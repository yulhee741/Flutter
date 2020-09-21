import 'package:week3/detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MUSINSA STORE'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Text(
                '추천 상품',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HoverCard(
                    'images/2.jpg',
                    onClick: () {
                      Navigator.push(
                        context,
                        FadePageRoute(page: DetailPage('image1.jpg')),
                      );
                    },
                  ),
                  HoverCard(
                    'images/3.jpg',
                    onClick: () {
                      Navigator.push(
                        context,
                        FadePageRoute(page: DetailPage('image2.jpg')),
                      );
                    },
                  ),
                  HoverCard(
                    'images/1.jpg',
                    onClick: () {
                      Navigator.push(
                        context,
                        FadePageRoute(page: DetailPage('image3.jpg')),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HoverCard extends StatefulWidget {
  final String assetName;
  final Function() onClick;

  HoverCard(this.assetName, {@required this.onClick});

  @override
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHover = false;
  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(0, -10, 0);

  void _mouseEnter(bool hover) {
    setState(() {
      _isHover = hover;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: Container(
        child: MouseRegion(
          onEnter: (_) => _mouseEnter(true),
          onExit: (_) => _mouseEnter(false),
          child: AnimatedContainer(
            width: MediaQuery.of(context).size.width / 4.0,
            height: MediaQuery.of(context).size.width / 4.0,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: _isHover
                  ? [
                      BoxShadow(
                          offset: Offset(0.0, 3.0),
                          color: Colors.grey,
                          blurRadius: 6.0),
                    ]
                  : null,
            ),
            duration: Duration(milliseconds: 100),
            child: Hero(
              tag: widget.assetName,
              child: Image.asset(
                widget.assetName,
                fit: BoxFit.fill,
              ),
            ),
            transform: _isHover ? hoverTransform : nonHoverTransform,
          ),
        ),
      ),
    );
  }
}

class FadePageRoute extends PageRouteBuilder {
  final Widget page;

  FadePageRoute({this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
