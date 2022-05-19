import 'package:flutter/material.dart';
import 'package:proje/Screens/Login.dart';

import 'custom_rect_tween copy 3.dart';
import 'hero_dialog_route copy 3.dart';


class Logout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return  GestureDetector(
         onTap: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return const _AddTodoPopupCard();
          }));
        },
        child: Hero(
          tag: _heroAddTodo,
    
            child:   Icon(Icons.logout_outlined, color: Colors.white)
        ),
      
    );
  }
}


const String _heroAddTodo = 'add-todohero';


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
            
            tag: _heroAddTodo,
            createRectTween: (beggin, eend) {
              return CustomRectTweeen(begin: eend, end: eend);
            },
            child: Material(
              
              color: Color(0xFF2A2D3E),
              elevation: 2,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
              child: Center(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            SizedBox(height: 8,),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            
                            child: Center(
                              child: Center(
                                child: Text(
                  "are you sure want to leave MY ROAD ?",
                  style: TextStyle(
                      color: Colors.white54, fontWeight: FontWeight.bold,),
                ),
                              ),
                            ),
                          ),
                        ),
                          
                            SizedBox(height: 6,),
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
         Navigator.push(context, MaterialPageRoute(
                                  builder: (_) => LoginPage()));
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
      ),
    );
  }
}