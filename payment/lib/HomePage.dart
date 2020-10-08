import 'package:flutter/material.dart';

import 'payment.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String eamount;

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("UPI Payment")),
        ),
        body: CustomPaint(
            painter: BackgroundColorform(),
            child: Stack(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Payment',
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ),
                    ),
                    Container(
                        child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        verticalDirection: VerticalDirection.down,
                        children: <Widget>[
                          SizedBox(
                            height: 120,
                          ),
                          TextFormField(
                            initialValue: "",
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                labelText: 'Enter Amount',
                                labelStyle: TextStyle(color: Colors.black)),
                            validator: (val) => val.isEmpty
                                ? 'Please enter bottle count'
                                : null,
                            onChanged: (val) => setState(() => eamount = val),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    )),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Proceed',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                          FlatButton(
                              child: CircleAvatar(
                                backgroundColor: Colors.grey.shade800,
                                radius: 40,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Payment(eamount: eamount)));
                                }
                              }),
                        ],
                      ),
                    )
                  ]))
            ])));
  }
}

class BackgroundColorform extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Colors.grey.shade100;
    canvas.drawPath(mainBackground, paint);

    Path blueWave = Path();
    blueWave.lineTo(sw, 0);
    blueWave.lineTo(sw, sh * 0.5);
    blueWave.quadraticBezierTo(sw * 0.5, sh * 0.45, sw * 0.2, 0);
    blueWave.close();
    paint.color = Colors.lightBlue.shade300;
    canvas.drawPath(blueWave, paint);

    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh * 0.1);
    greyWave.cubicTo(
        sw * 0.95, sh * 0.15, sw * 0.65, sh * 0.15, sw * 0.6, sh * 0.38);
    greyWave.cubicTo(sw * 0.52, sh * 0.52, sw * 0.05, sh * 0.45, 0, sh * 0.4);
    greyWave.close();
    paint.color = Colors.grey.shade800;
    canvas.drawPath(greyWave, paint);

    Path yellowWave = Path();
    yellowWave.lineTo(sw * 0.7, 0);
    yellowWave.cubicTo(
        sw * 0.6, sh * 0.05, sw * 0.27, sh * 0.01, sw * 0.18, sh * 0.12);
    yellowWave.quadraticBezierTo(sw * 0.12, sh * 0.2, 0, sh * 0.2);
    yellowWave.close();
    paint.color = Colors.orange.shade300;
    canvas.drawPath(yellowWave, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
