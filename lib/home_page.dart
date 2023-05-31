
import 'package:flutter/material.dart';
import 'package:myapps/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

MySnackBar(massage,context){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(massage)));
  }

  @override
  Widget build(BuildContext context) {

    ButtonStyle buttonStyle=ElevatedButton.styleFrom(
      padding: EdgeInsets.all(20),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))
      )
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        //appBar: AppBar(title: const Text('Bookmark Manager')),


        appBar: 
      AppBar(
        title: Text("Bookmark Manager"),
        titleSpacing: 0,
        centerTitle: true,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 0,
      actions: [
        IconButton(onPressed: (){MySnackBar("Comment",context);}, icon: Icon(Icons.comment)),
        IconButton(onPressed: (){MySnackBar("Search",context);}, icon: Icon(Icons.search)),
      ],),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                accountName: Text("Selise Digital Platform", style: TextStyle(color: Colors.black)), 
                accountEmail: Text("selise@gmail.com", style: TextStyle(color: Colors.black)),
                currentAccountPicture: Image.network("data:image/png;base64,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"),
                )
              ),
            
            
            ListTile( 
              leading: Icon(Icons.home),
              title: Text("Home"),onTap: (){MySnackBar("Home",context);},),
              ListTile( 
              leading: Icon(Icons.contact_phone),
              title: Text("Contact Phone"),onTap: (){MySnackBar("contact_phone",context);},),
              ListTile( 
              leading: Icon(Icons.mail),
              title: Text("Mail"),onTap: (){MySnackBar("mail",context);},),
              ListTile( 
              leading: Icon(Icons.lock_clock),
              title: Text("Lock Clock"),onTap: (){MySnackBar("lock_clock",context);},),
              ListTile( 
              leading: Icon(Icons.timeline),
              title: Text("Time Line"),onTap: (){MySnackBar("timeline",context);},),
              ListTile( 
              leading: Icon(Icons.mark_email_read),
              title: Text("Mark Email Read"),onTap: (){MySnackBar("mark_email_read",context);},),
              ListTile( 
              leading: Icon(Icons.key_off),
              title: Text("Key Off"),onTap: (){MySnackBar("key_off",context);},),
          ],
        ),
      ),
        body:  Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
                alignment: Alignment.topLeft,
              child: Text("Category A",
              style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 24),),
            ),
            Container(
              
              child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text("Javascript Tutorial"),
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: OutlinedButton(
                      child: const Text('Details'),
                      onPressed: () {},
                    )
                ),
              ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text("Angular basics"),
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: OutlinedButton(
                      child: const Text('Details'),
                      onPressed: () {},
                    )
                ),
              ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text("React inroduction"),
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: OutlinedButton(
                      child: const Text('Details'),
                      onPressed: () {},
                    )
                ),
              ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                alignment: Alignment.topLeft,
              child: Text("Category B",
              style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 24),),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text("Best food in Dhaka"),
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: OutlinedButton(
                      child: const Text('Details'),
                      onPressed: () {},
                    )
                ),
              ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text("Burger vs Pizza"),
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: OutlinedButton(
                      child: const Text('Details'),
                      onPressed: () {},
                    )
                ),
              ],
              ),
            ),
            SizedBox(
              height: 15,
            ),

            Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const TodoList1())
  );
                      },
                      child: const Text('See All Bookmark'),
                      style: buttonStyle,
                    ),
                ),
          ],
        ),
      ),
    );
  }
}