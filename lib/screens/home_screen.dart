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
          padding: const EdgeInsets.symmetric(horizontal: 10.0), // Margen en los lados
          child: AppBar(
            backgroundColor: Colors.white,
            title: Image.network(
              'https://img.freepik.com/vector-gratis/twitter-nuevo-logotipo-2023-x-vector-fondo-blanco_1017-45422.jpg?t=st=1732542419~exp=1732546019~hmac=686f33fd4b5cce53cc981ad91f90546432c8200b39367b98f3456178dd647056&w=740',
              height: 50, // Tamaño de la imagen
              fit: BoxFit.cover,
            ),
            centerTitle: true,
            leading: const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black,
              child: Icon(Icons.person, size: 20, color: Colors.white),
            ),
            actions: [
              OutlinedButton(
                onPressed: () {
                  // Acción para el botón 'Upgrade'
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black), // Borde negro
                ),
                child: const Text(
                  'Upgrade',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
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
                  tweetText: 'This is tweet #$index. Check out flutter!',
                  time: '1h',
                  profilePic: Icons.person,
                  likes: 100 + index,
                  comments: 20 + index,
                  retweets: 50 + index,
                );
              },
            ),
            // Following section
            const Center(
              child: Text('Following'),
            ),
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
