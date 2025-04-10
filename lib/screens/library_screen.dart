import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/book.dart';
import 'package:flutter_application_1/widgets/book_tile.dart';

class LibraryScreen extends StatefulWidget {
  final void Function(String) onNavigate;

  const LibraryScreen({super.key, required this.onNavigate});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  late List<Book> books;

  @override
  void initState() {
    super.initState();
    // Inicialização da lista de livros no initState, pois não pode ser const
    books = [
      Book.getSample1(),
      Book.getSample2(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Olive Library'),
          leading: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => widget.onNavigate('/auth'),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Lendo'),
              Tab(text: 'Lidos'),
            ],
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
        body: TabBarView(
          children: [
            // Livros sendo lidos
            _buildBookList(context, books.where((b) => !b.isRead).toList()),
            // Livros lidos
            _buildBookList(context, books.where((b) => b.isRead).toList()),
          ],
        ),
      ),
    );
  }

  Widget _buildBookList(BuildContext context, List<Book> filteredBooks) {
    return Container(
      color: Colors.grey[200],
      child: filteredBooks.isEmpty
          ? const Center(child: Text('Nenhum livro aqui', style: TextStyle(fontSize: 18)))
          : ListView.builder(
              padding: const EdgeInsets.all(12.0),
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) => BookTile(book: filteredBooks[index]),
            ),
    );
  }
}