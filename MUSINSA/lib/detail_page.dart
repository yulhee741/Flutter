import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String assetName;

  DetailPage(this.assetName);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final data = {
    'images/1.jpg': {
      'name': '파란색옷',
      'description':
          '- 브랜드 / 품번 NATIONALGEOGRAPHIC / 1231868\n- 시즌도움말 보기 / 성별 2020 F/W / 남\n- 조회수(1개월) 21.7만 회 이상\n- 누적판매(1년) 3.9천 개 이상(결제완료-반품)',
      'price': '59,000원',
    },
    'images/2.jpg': {
      'name': '검정색 모자',
      'description':
          '- 브랜드 / 품번 NATIONALGEOGRAPHIC / 1231868\n- 시즌도움말 보기 / 성별 2020 F/W / 남\n- 조회수(1개월) 21.7만 회 이상\n- 누적판매(1년) 3.9천 개 이상(결제완료-반품)',
      'price': '27,000원',
    },
    'images/3.jpg': {
      'name': '검정색 후드티',
      'description':
          '- 브랜드 / 품번 NATIONALGEOGRAPHIC / 1231868\n- 시즌도움말 보기 / 성별 2020 F/W / 남\n- 조회수(1개월) 21.7만 회 이상\n- 누적판매(1년) 3.9천 개 이상(결제완료-반품)',
      'price': '72,000원',
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          child: Row(
            children: [
              Hero(
                tag: widget.assetName,
                child: Image.asset(
                  widget.assetName,
                  width: 500.0,
                  height: 500.0,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 30.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    data[widget.assetName]['name'],
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    data[widget.assetName]['description'],
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    data[widget.assetName]['price'],
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 50.0),
                  Row(
                    children: [
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.blue,
                            width: 1.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '구매하기',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(width: 16.0),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '장바구니에 담기',
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
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
