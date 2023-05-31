import 'package:flutter/material.dart';

class TodoList1 extends StatefulWidget {
  const TodoList1({Key? key}) : super(key: key);

  @override
  _TodoList1State createState() => _TodoList1State();
}

class _TodoList1State extends State<TodoList1> {

  MySnackBar(massage,context){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(massage)));
  }


  final List<String> _todoItems = <String>[];

  void _addTodoItem(String task) {
    if (task.isNotEmpty) {
      setState(() => _todoItems.add(task));
    }
  }

  void _removeTodoItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Mark ${_todoItems[index]} as Delete?'),
              actions: <Widget>[
                TextButton(
                    child: const Text('Cancel'),
                    onPressed: () => Navigator.of(context).pop()),
                TextButton(
                    child: const Text('Delete'),
                    onPressed: () {
                      _removeTodoItem(index);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: _todoItems.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildTodoItem(_todoItems[index], index);
      },
    );
  }

  Widget _buildTodoItem(String todoText, int index) {
    return ListTile(
        title: Text(todoText), onTap: () => _promptRemoveTodoItem(index));
  }

  

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(title: const Text('Bookmark Manager')),
        body:  _buildTodoList(),

        floatingActionButton: FloatingActionButton(
            onPressed: _pushAddTodoScreen,
            tooltip: 'Add task',
            child: const Icon(Icons.add)
            ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        


      ),
    );
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('Add Bookmark')),
            body: 
            // Padding(
            //   padding: const EdgeInsets.all(1.0),
            //   child: TextField(
            //     autofocus: true,
            //     onSubmitted: (String val) {
            //       _addTodoItem(val);
            //       Navigator.pop(context);
            //     },
            //     decoration: const InputDecoration(
            //         hintText: 'Title',
            //         contentPadding: EdgeInsets.all(16.0)),
            //   ),
            // )
            Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Add Bookmark',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 24),
                )),
            // Container(
            //     alignment: Alignment.center,
            //     padding: const EdgeInsets.all(10),
            //     child: const Text(
            //       'Import your Title and URL',
            //       style: TextStyle(fontSize: 20),
            //     )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                
                onSubmitted: (String val) {
                  _addTodoItem(val);
                  Navigator.pop(context);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
              ),
              
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                //obscureText: true,
                
                onSubmitted: (String val) {
                  _addTodoItem(val);
                  Navigator.pop(context);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Url',
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),

            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Select Category',),
            ),

            


            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 50,
                    width: 100,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Cancel'),
                      onPressed: () {MySnackBar("Cancel",context);
                      Navigator.of(context).pop();
                      },
                    )
                ),
                Container(
                    height: 50,
                    width: 100,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Save'),
                      onPressed: () {MySnackBar("Save Done",context);
                      },
                    )
                ),
              ],
            ),
          ],
        ))
            );
      },
    )
    );
  }
}