import 'package:flutter/material.dart';
import 'package:proje/constants.dart';
import 'package:proje/responsive.dart';
import 'styles.dart';
import 'custom_rect_tween copy 5.dart';
import 'hero_dialog_route copy 5.dart';


class DeletePerson extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
         onTap: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return const _AddTodoPopupCard();
          }));
        },
        child: Hero(
          tag: _heroAdTodo,
         
            child:   Icon(Icons.delete, color: Colors.white54)
        ),
      
    );
  }
}


const String _heroAdTodo = 'add-todo-hero';


class _AddTodoPopupCard extends StatelessWidget {

  const _AddTodoPopupCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          width: 300,
          height: 140,
          child: Hero(
            
            tag: _heroAdTodo,
            createRectTween: (begin, end) {
              return CuustomRectTween(begin: end, end: end);
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
                          SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        
                        child: Text(
                "Are you sure to delete this person ?",
                style: TextStyle(
                    color: Colors.white54, fontWeight: FontWeight.bold),
              ),
                      ),
                        
                          SizedBox(height: 18,),
                          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          
                     IconButton(
          icon:  Icon(Icons.cancel_outlined, color: Colors.white54),
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          color: Colors.transparent,
          onPressed: () {
         Navigator.of(context).pop(false);
            }
          
        ),
              
                    IconButton(
          icon:  Icon(Icons.task_alt_outlined, color: Colors.white54),
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          color: Colors.transparent,
          onPressed: () {
         
            }
          
        ),
            ],
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