import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'screens.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Final Project'),
      ),
      drawer: const SideMenu(),
      body:  Column(
        children: [
          Center(
            child: MyStatefulWidget()
          ),
        ],
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Container(
          color: Colors.white,
          child: FadeTransition(
            opacity: _animation,
            child: SizedBox(
              width: 200.0,
              height: 100.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/movies');
                },
                child: const Text('Movies',style: TextStyle(fontSize: 35),),
                    
                  ),
            ),
          ),
        ),
        SizedBox(height: 50),
        Container(
          color: Colors.white,
          child: FadeTransition(
            opacity: _animation,
            child: SizedBox(
              width: 200.0,
              height: 100.0,
              child: ElevatedButton(
                
                
                    onPressed: () {
                      Navigator.of(context).pushNamed('/weather');
                    },
                    child: const Text('Weather',style: TextStyle(fontSize: 35),),
                
              ),
            ),
          ),
        ),


      ],
    );
  }
}
