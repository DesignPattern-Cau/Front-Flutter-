class Book{
  int book_idx=0;
  String title="default";
  int price=10000;
  int quantity=3;
  String authorName="DEFAULT";
  int sales=32;
  String category="CS";
  int likes=32;
  String description="재밌는 책입니다";
  String registerAt="sd";
  String ISBN="asd";
  int page=324;
  String imgURL="https://www.freepik.com/icon/book-cover_13597";

  Book(
      this.book_idx,
      this.title,
      this.price,
      this.quantity,
      this.authorName,
      this.sales,
      this.category,
      this.likes,
      this.description,
      this.registerAt,
      this.ISBN,
      this.page,
      this.imgURL);
}