// Modal Class

class Model {
  // Attributes
  final String quotes;
  final String author;
  final String category;

  // Parameterized Constructor
  Model({
    required this.quotes,
    required this.author,
    required this.category,
  });

  // Factory Constructor
  factory Model.fromMap({required Map data}) {
    return Model(
      quotes: data['quote'],
      author: data['author'],
      category: data['category'],
    );
  }
}
