import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/widgets/add_note.dart';
import 'package:notes_app/widgets/edit_note.dart';
import 'package:notes_app/widgets/note_card.dart';

import '../style/app_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final ref = FirebaseFirestore.instance.collection('Notes');
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        title: Text('My-Notes'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppStyle.mainColor,
      ),
      floatingActionButton: FloatingActionButton(
         child: Icon(Icons.add),
         onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (_) => AddNote()));
         },

      ),
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: snapshot.hasData?snapshot.data?.docs.length:0,
                    itemBuilder: (_,index){
                      return GestureDetector(
                        onTap: (){
                        },
                        child: Container(
                          margin: EdgeInsets.all(20),
                          height: MediaQuery.of(context).size.height,
                          color: Colors.grey.shade400,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(snapshot.data?.docs[index]['title']),
                                const SizedBox(height: 20,),
                                Text(snapshot.data?.docs[index]['content']),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                );
        }
      ),
    );
  }
}
