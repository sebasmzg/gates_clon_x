import 'package:flutter/material.dart';
import '../widgets/tweet_card.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0; //control pestaña activa

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  //cambio de pestaña(
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              titleSpacing: 10,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 18,
                    child: Icon(Icons.person, size: 25, color: Colors.white),
                  ),
                  Expanded(
                    child: Center(
                      child: Image.network(
                        'https://img.freepik.com/vector-gratis/twitter-nuevo-logotipo-2023-x-vector-fondo-blanco_1017-45422.jpg?t=st=1732542419~exp=1732546019~hmac=686f33fd4b5cce53cc981ad91f90546432c8200b39367b98f3456178dd647056&w=740',
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      // Acción para el botón 'Upgrade'
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      minimumSize: const Size(50, 30),
                      side: const BorderSide(color: Colors.grey, width: 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Upgrade',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            bottom: TabBar(
              controller: _tabController,
              tabs: const [Tab(text: 'For you'), Tab(text: 'Following')],
            ),
          )
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: TabBarView(
          controller: _tabController,
          children: [
            // For you section
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return TweetCard(
                  username: 'User $index',
                  handle: '@user$index',
                  tweetText: 'This is tweet #$index. for you',
                  time: '1h',
                  profilePic: Icons.person,
                  likes: 100 + index,
                  comments: 20 + index,
                  retweets: 50 + index,
                );
              },
            ),
            // Following section
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return TweetCard(
                  username: 'User $index',
                  handle: '@user$index',
                  tweetText: 'This is tweet #$index. flowing',
                  time: '1h',
                  profilePic: Icons.person,
                  likes: 100 + index,
                  comments: 20 + index,
                  retweets: 50 + index,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(
              onPressed: () {},
            backgroundColor: Colors.blue,
            shape: 
            RoundedRectangleBorder(
              borderRadius: 
                BorderRadius.circular(50)
            ),
            child: const Icon(Icons.add, color: Colors.white,),
          ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(_currentIndex == 0 ? Icons.home : Icons.home_outlined, size: 27),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(_currentIndex == 1 ? Icons.search : Icons.search_outlined,size: 27),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(_currentIndex == 2 ? Icons.people : Icons.people_outlined,size: 27),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(_currentIndex == 3 ? Icons.notifications : Icons.notifications_none_outlined, size: 27),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(_currentIndex == 4 ? Icons.mail : Icons.mail_outline, size: 27),
              label: ''),
        ],
      ),
    );
  }
}
