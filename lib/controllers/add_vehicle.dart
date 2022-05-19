import 'package:flutter/material.dart';
import 'package:proje/constants.dart';
import 'package:proje/responsive.dart';
import 'styles.dart';
import 'custom_rect_tween copy 7.dart';
import 'hero_dialog_route copy 6.dart';


class AddVehicle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: GestureDetector(
        onTap: () {
         
        },
        child: Hero(
          tag: _heroAddTodo,
          
          child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
              primary: Color(0xFF2697FF),
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
              onPressed: () { Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return const _AddTodoPopupCard();
          }));},
              icon: Icon(Icons.add),
              label: Text("Add New"),
              
            ),
        ),
      ),
    );
  }
}


const String _heroAddTodo = 'ad-todo-hero';


class _AddTodoPopupCard extends StatelessWidget {

  const _AddTodoPopupCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          width: 300,
          height: 220,
          child: Hero(
            
            tag: _heroAddTodo,
            createRectTween: (begin, end) {
              return CustomReccctTween(begin: end, end: end);
            },
            child: Material(
              
              color: Color(0xFF2A2D3E),
              elevation: 2,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      
                    
                          const TextField(
                          decoration: InputDecoration(
                            hintText: 'Vehicle model',
                            fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                          cursorColor: Colors.white,
                          
                        ),
                         const Divider(
                          color: Colors.white,
                          thickness: 0.2,
                        ),SizedBox(height: 10,),
                          const TextField(
                          decoration: InputDecoration(
                            hintText: 'registration number',
                            fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                          cursorColor: Colors.white,
                          
                        ),
                         const Divider(
                          color: Colors.white,
                          thickness: 0.2,
                        ),
                        SizedBox(height: 10,),
                        FlatButton(
                          onPressed: () {},
                          child: const Text('Add'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}