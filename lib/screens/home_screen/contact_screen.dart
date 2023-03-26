import 'package:flutter/material.dart';
import 'package:visionmeet/common/resources/firestore_methods.dart';
import 'package:intl/intl.dart';


class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().contacts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) => ListTile(
            title: Container(
              padding: EdgeInsets.fromLTRB(10, 15, 10,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    child: FadeInImage(
                      placeholder: AssetImage('assets/images/img.png'),
                      image:  NetworkImage((snapshot.data! as dynamic).docs[index]['profilePhoto']),
                      fit: BoxFit.cover,
                    ),
                  ),
                  
                  SizedBox(width: 5,),
                  
                  Text("${(snapshot.data! as dynamic).docs[index]['username']}")
                ],
              ),
            ),

              
            subtitle: Container(
              padding:EdgeInsets.fromLTRB(10, 4, 10,4),
              child: Text(
                'Uid :  ${(snapshot.data! as dynamic).docs[index]['uid']}',
              ),
            ),
          ),
        );
      },
    );
  }
}