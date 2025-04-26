import 'dart:io';

abstract class Book
{
  String id;
  String title;
  String author;

  Book(this.id, this.title, this.author);

  void displayInfo();
}

class Textbook extends Book
{
  String subject;

  Textbook(String id, String title, String author, this.subject)
      : super(id, title, author);

  @override
  void displayInfo()
  {
    print("Textbook - $title by $author (Subject: $subject)");
  }
}

class ReferenceBook extends Book
{
  String topic;

  ReferenceBook(String id, String title, String author, this.topic)
      : super(id, title, author);

  @override
  void displayInfo()
  {
    print("Reference Book - $title by $author (Topic: $topic)");
  }
}

class Student
{
  String name;
  List<Book> borrowedBooks = [];

  Student(this.name);

  void borrowBook(Book book)
  {
    borrowedBooks.add(book);
    print('$name đã mượn sách: ${book.title}');
  }

  void returnBook(Book book)
  {
    borrowedBooks.remove(book);
    print('$name đã trả sách: ${book.title}');
  }

  void listBorrowedBooks()
  {
    if (borrowedBooks.isEmpty)
    {
      print('$name chưa mượn sách nào.');
    }
    else
    {
      print('Danh sách sách đã mượn của $name:');
      for (var book in borrowedBooks)
      {
        book.displayInfo();
      }
    }
  }
}

class Library
{
  List<Book> books = [];

  void addBook(Book book)
  {
    books.add(book);
    print('Đã thêm sách: ${book.title}');
  }

  void showAllBooks()
  {
    if (books.isEmpty)
    {
      print("Thư viện chưa có sách.");
    }
    else
    {
      print('Tất cả sách trong thư viện:');
      for (var book in books)
      {
        book.displayInfo();
      }
    }
  }

  Book? findBookByTitle(String title)
  {
    String trimmedTitle = title.trim();
    if (trimmedTitle.isEmpty || books.isEmpty)
    {
      return null;
    }
    for (var book in books)
    {
      if (book.title.toLowerCase() == trimmedTitle.toLowerCase())
      {
        return book;
      }
    }
    return null;
  }
}

void main()
{
  Library library = Library();
  Student student = Student("Nguyễn Văn A");

  while (true)
  {
    print("\n======= MENU =======");
    print("1. Thêm sách vào thư viện");
    print("2. Hiển thị tất cả sách");
    print("3. Sinh viên mượn sách");
    print("4. Sinh viên trả sách");
    print("5. Xem sách đã mượn");
    print("0. Thoát");
    stdout.write("Chọn: ");
    String choice = stdin.readLineSync() ?? "0";

    switch (choice)
    {
      case '1':
        print("\nChọn loại sách (1: Textbook, 2: ReferenceBook): ");
        String type = stdin.readLineSync() ?? "0";
        stdout.write("ID: ");
        String id = stdin.readLineSync() ?? "Unknown ID";
        stdout.write("Tiêu đề: ");
        String title = stdin.readLineSync() ?? "Unknown Title";
        stdout.write("Tác giả: ");
        String author = stdin.readLineSync() ?? "Unknown Author";
        if (type == '1')
        {
          stdout.write("Môn học: ");
          String subject = stdin.readLineSync() ?? "Unknown Subject";
          library.addBook(Textbook(id, title, author, subject));
        }
        else if (type == '2')
        {
          stdout.write("Chủ đề: ");
          String topic = stdin.readLineSync() ?? "Unknown Topic";
          library.addBook(ReferenceBook(id, title, author, topic));
        }
        else
        {
          print("Loại sách không hợp lệ.");
        }
        break;

      case '2':
        library.showAllBooks();
        break;

      case '3':
        stdout.write("Nhập tiêu đề sách cần mượn: ");
        String borrowTitle = stdin.readLineSync() ?? "";
        Book? bookToBorrow = library.findBookByTitle(borrowTitle);
        if (bookToBorrow != null)
        {
          student.borrowBook(bookToBorrow);
        }
        else
        {
          print(borrowTitle.trim().isEmpty
              ? "Tiêu đề sách không hợp lệ."
              : library.books.isEmpty
                  ? "Thư viện chưa có sách."
                  : "Không tìm thấy sách với tiêu đề: ${borrowTitle.trim()}");
        }
        break;

      case '4':
        stdout.write("Nhập tiêu đề sách cần trả: ");
        String returnTitle = stdin.readLineSync() ?? "";
        String trimmedReturnTitle = returnTitle.trim();
        Book? bookToReturn;
        if (trimmedReturnTitle.isEmpty || student.borrowedBooks.isEmpty)
        {
          bookToReturn = null;
        }
        else
        {
          for (var book in student.borrowedBooks)
          {
            if (book.title.toLowerCase() == trimmedReturnTitle.toLowerCase())
            {
              bookToReturn = book;
              break;
            }
          }
        }
        if (bookToReturn != null)
        {
          student.returnBook(bookToReturn);
        }
        else
        {
          print(trimmedReturnTitle.isEmpty
              ? "Tiêu đề sách không hợp lệ."
              : student.borrowedBooks.isEmpty
                  ? "Bạn chưa mượn sách nào."
                  : "Bạn không mượn sách với tiêu đề: $trimmedReturnTitle");
        }
        break;

      case '5':
        student.listBorrowedBooks();
        break;

      case '0':
        print("Thoát chương trình.");
        return;

      default:
        print("Lựa chọn không hợp lệ.");
    }
  }
}