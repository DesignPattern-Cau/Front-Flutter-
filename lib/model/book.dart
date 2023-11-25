class Book{
  int book_idx=0;
  String title="default";
  int price=10000;
  int quantity=3;
  int author_id=3;
  int sales=32;
  int category_id=3;
  int likes=32;
  String description="재밌는 책입니다";
  DateTime register_at=DateTime.now();
  String ISBN="asd";
  int page=324;

  Book(
      this.book_idx,
      this.title,
      this.price,
      this.quantity,
      this.author_id,
      this.sales,
      this.category_id,
      this.likes,
      this.description,
      this.register_at,
      this.ISBN,
      this.page);
}