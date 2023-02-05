import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    TextEditingController title = TextEditingController();
    TextEditingController content = TextEditingController();

    CollectionReference ref = FirebaseFirestore.instance.collection('Notes');




    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            ref.add({
              'title': title.text,
              'content': content.text,
            }).whenComplete(() => Navigator.pop(context));
          }, child: Text('Save',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: title,
                decoration: InputDecoration(hintText: 'Title'),
              ),
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: content,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(hintText: 'Content'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

