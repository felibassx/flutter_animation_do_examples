import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Notificaciones Page'),
        ),
        floatingActionButton: _BotonFlotante(),
        bottomNavigationBar: _BotonNavigation(),
      ),
    );
  }
}

class _BotonNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificationModel>(context).numero;

    return BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.pink,
        items: [
          BottomNavigationBarItem(
              title: Text('Bone'), icon: FaIcon(FontAwesomeIcons.bone)),
          BottomNavigationBarItem(
              title: Text('Notification'),
              icon: Stack(
                children: <Widget>[
                  FaIcon(FontAwesomeIcons.bell),
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    // child: Icon(
                    //   Icons.brightness_1,
                    //   size: 8,
                    //   color: Colors.redAccent,
                    // )
                    child: BounceInDown(
                      from: 10,
                      animate: (numero > 0) ? true : false,
                      child: Bounce(
                        from: 10,
                        controller: (controller) => Provider.of<_NotificationModel>(context).bounceController = controller,
                        child: Container(
                          child: Text(
                            '$numero',
                            style: TextStyle(color: Colors.white, fontSize: 8),
                          ),
                          alignment: Alignment.center,
                          width: 13,
                          height: 13,
                          decoration: BoxDecoration(
                              color: Colors.redAccent, shape: BoxShape.circle),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          BottomNavigationBarItem(
              title: Text('My Dog'), icon: FaIcon(FontAwesomeIcons.dog)),
        ]);
  }
}

class _BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {   

    return FloatingActionButton(
      onPressed: () {
        
        final _NotificationModel notModel = Provider.of<_NotificationModel>(context, listen: false);

        int numero =
            notModel.numero;
        numero++;

        notModel.numero = numero;

        if (numero >= 2) {
          final controller = notModel.bounceController;
          controller.forward(from: 0.0);
        }

      },
      backgroundColor: Colors.pink,
      child: FaIcon(FontAwesomeIcons.play),
    );
  }
}

class _NotificationModel extends ChangeNotifier {

  AnimationController _bounceController;
  AnimationController get bounceController => this._bounceController;
  set bounceController(AnimationController value) {
    this._bounceController = value;
    // notifyListeners();
  }

  int _numero = 0;
  int get numero => this._numero;
  set numero(int valor) {
    this._numero = valor;
    notifyListeners();
  }
}
