// home_screen.dart
import 'package:clone_x/screens/search_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/tweet_card.dart';
import 'home_view.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0; // Controla la pestaña activa

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  // Cambio de pestaña
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // Método para obtener el AppBar según la pestaña seleccionada
  PreferredSizeWidget _getAppBar() {
    if (_currentIndex == 1) {
      // AppBar para Search
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 10,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqxf0ueGDvz-4Fpreu6Lxj4hYKw5fwlwmRjg&s'),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.grey),
              onPressed: () {
                // Acción para el botón de configuración
              },
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'For you'),
            Tab(text: 'Trending'),
            Tab(text: 'News'),
            Tab(text: 'Sports'),
            Tab(text: 'Entertainment'),
          ],
          indicatorColor: Colors.blue,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
        ),
      );
    } else {
      // AppBar para Home
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqxf0ueGDvz-4Fpreu6Lxj4hYKw5fwlwmRjg&s'),
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
      );
    }
  }

  // Método para obtener el cuerpo según la pestaña seleccionada
  Widget _getBody() {
    if (_currentIndex == 0) {
      return const HomeView();
    } else if (_currentIndex == 1) {
      return const SearchView();
    }
    return const Center(child: Text('Vista no implementada'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(Icons.add, color: Colors.white),
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
