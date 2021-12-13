import 'package:flutter/material.dart';
import 'package:my_todo_app/create_todo_view.dart';
import 'utills.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedItem = "Todo";

  final List<Map<String, dynamic>> _completed = [];

  final List<Map<String, dynamic>> _unCompleted = [];

  final List<Map<String, dynamic>> data = [
    {
      'title': 'What is Lorem Ipsum',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. when an unknown printer took a gall',
      'status': true,
      'date_time': 'Today'
    },
    {
      'title': 'What is Lorem Ipsum',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. when an unknown printer took a gall',
      'status': false,
      'date_time': 'Today'
    },
    {
      'title': 'What is Lorem Ipsum',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. when an unknown printer took a gall',
      'status': false,
      'date_time': 'Today'
    },
    {
      'title': 'What is Lorem Ipsum',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. when an unknown printer took a gall',
      'status': true,
      'date_time': 'Today'
    },
    {
      'title': 'What is Lorem Ipsum',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. when an unknown printer took a gall',
      'status': false,
      'date_time': 'Today'
    },
    {
      'title': 'What is Lorem Ipsum',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. when an unknown printer took a gall',
      'status': false,
      'date_time': 'Today'
    },
    {
      'title': 'What is Lorem Ipsum',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. when an unknown printer took a gall',
      'status': false,
      'date_time': 'Today'
    },
    {
      'title': 'What is Lorem Ipsum',
      'description':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. when an unknown printer took a gall',
      'status': true,
      'date_time': 'Today'
    }
  ];

  @override
  void initState() {
    for (Map<String, dynamic> elements in data) {
      if (!elements['status']) {
        _unCompleted.add(elements);
      } else {
        _completed.add(elements);
      }
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Todo',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
        ),
        leading: const Center(
            child: CircleAvatar(
          backgroundImage: AssetImage('assets/logo.jpg'),
        )),
        actions: [
      PopupMenuButton<String>(
      icon: const Icon(Icons.menu),
      onSelected: (value){
        setState(() {
          selectedItem = value;
        });
      },
      itemBuilder: (context){
        return [
          const PopupMenuItem(child: Text('Todo'),value: 'Todo',),
          const PopupMenuItem(child: Text('Completed'),value: 'Completed',)

        ];
      },

    ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return CreateTodoView();
          }));
        },
        child: const Icon(Icons.add),
        backgroundColor:Colors.brown,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return TodoCardWidget(
              datetime:selectedItem=='Todo'? _unCompleted[index]['date_time']:_completed[index]['date_time'],
              title:selectedItem=='Todo'? _unCompleted[index]['title']:_completed[index]['title'],
              description:selectedItem=='Todo'? _unCompleted[index]['description']:_completed[index]['description'],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 15,
            );
          },
          itemCount: selectedItem == 'Todo'
              ? _unCompleted.length
              : _completed.length,),
      bottomNavigationBar: SafeArea(
        child: InkWell(
          onTap: (){
            showBarModalBottomSheet(context: context, builder: (context){
              return ListView.separated(itemBuilder: (context,index){
                return TodoCardWidget(
                  datetime: _completed[index]['date_time'],
                  description: _completed[index]['description'],
                  title: _completed[index]['title'],

                );

              }, separatorBuilder: (context, index){
                return SizedBox(height: 5,);

              }, itemCount: _completed.length);
            });
          },
          child: Container(
            height: 56,
            color:  Colors.brown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Completed',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  '${_completed.length}',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TodoCardWidget extends StatelessWidget {
  const TodoCardWidget({Key? key, required this.title, required this.description, required this.datetime}) : super(key: key);

  final String title;
  final String description;
  final String datetime;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(16.00),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(children: [
          Icon(
            Icons.check_circle_outlined,
            size: 30,
            color: customColor(
                date: datetime),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0XFF2c3e50),
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  description,
                  style:
                      const TextStyle(fontSize: 16, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.notifications_outlined,
                color: customColor(
                    date: datetime),
              ),
              Text(
                datetime,
                style: TextStyle(
                  color: customColor(
                      date: datetime),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
