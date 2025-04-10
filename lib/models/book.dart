class Book {
  final String title;
  final String author;
  final int pages;
  final bool isRead;

  Book({
    required this.title,
    required this.author,
    required this.pages,
    this.isRead = false,
  });

  static Book getSample1() => Book(title: 'The Silent Path', author: 'Elias Grey', pages: 240);
  static Book getSample2() => Book(title: 'Echoes of Time', author: 'Luna Hart', pages: 450, isRead: true);
  bool isLongBook() => pages > 300;
}