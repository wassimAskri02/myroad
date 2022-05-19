import 'package:flutter/material.dart';
import 'package:proje/constants.dart';
import 'package:proje/responsive.dart';
import 'styles.dart';
import 'custom_rect_tween copy 6.dart';
import 'hero_dialog_route copy 7.dart';


class AddPerson extends StatelessWidget {

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


const String _heroAddTodo = 'add-tdo-hero';


class _AddTodoPopupCard extends StatelessWidget {

  const _AddTodoPopupCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          width: 300,
          height: 250,
          child: Hero(
            
            tag: _heroAddTodo,
            createRectTween: (begin, end) {
              return CustommRectTween(begin: end, end: end);
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
                            hintText: 'Full Name',
                            border: InputBorder.none,
                          ),
                          cursorColor: Colors.white,
                          
                        ),
                        const Divider(
                          color: Colors.white,
                          thickness: 0.2,
                        ),
                          const TextField(
                          decoration: InputDecoration(
                            hintText: 'CIN',
                            fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                          cursorColor: Colors.white,
                          
                        ),
                         const Divider(
                          color: Colors.white,
                          thickness: 0.2,
                        ),
                          const TextField(
                          decoration: InputDecoration(
                            hintText: 'Phone number',
                            fillColor: Colors.white,
                            border: InputBorder.none,
                          ),
                          cursorColor: Colors.white,
                          
                        ),
                        
                        SizedBox(height: 15,),
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