#Create a simple library management system using Python that allows users to manage books and borrowers within a single session. The project will not include saving or loading data from files.

class Book:
  def __init__(self,title,author,isbn):
    self.title=title
    self.author=author
    self.isbn=isbn
    self.is_available=True

class Borrower:
  def __init__(self,name,borrower_id):
    self.name=name
    self.borrower_id=borrower_id
    self.borrowed_books=[]

class library:
  def __init__(self):
    self.books=[]
    self.borrowers=[]
  def add_books(self,title,author,isbn):
    book=Book(title,author,isbn)
    self.books.append(book)
    print(f"Book {title} is successfully added")
  def register_borrower(self,name,borrower_id):
    borrower=Borrower(name,borrower_id)
    self.borrowers.append(borrower)
    print(f"{name} is registered successfully")
  def borrow_book(self,borrower_id,isbn):
    borrower=next((b for b in self.borrowers if b.borrower_id==b.borrower_id),None)
    book=next((b for b in self.books if b.isbn==isbn and b.is_available),None)
    if borrower and book:
      borrower.borrowed_books.append(book)
      book.is_available=False
      print(f"{book.title} is successfully borrowed by {borrower.name}")
    else:
      print("Either the borrower_id is wrong or book is not available")
  def returning_book(self,borrower_id,isbn):
    borrower=next((b for b in self.borrowers if b.borrower_id==borrower_id),None)
    if borrower:
      book=next((b for b in borrower.borrowed_books if b.isbn==b.isbn),None)
      if book:
        borrower.borrowed_books.remove(book)
        book.is_available=True
        print(f"{book.title} is returned successfull")
      else:
        print("borrower does not have this book")
    else:
      print("Invalid borrower Id")
  def view_books(self):
    print("Available books: ")
    for book in self.books:
      if book.is_available:
        print(f"{book.title} by {book.author} (ISBN: {book.isbn})")







my_lib=library()
my_lib.add_books("The Great Gatsby","F. Scott Fitzgerald","978-0743273565")
my_lib.add_books("To Kill a Mockingbird","Harper Lee","978-0446310789")
my_lib.add_books("Stormlight Archive","Brandon Sanderson","978-0446310788")
my_lib.register_borrower("John Doe","B001")
my_lib.register_borrower("Jane Smith","B002")
my_lib.register_borrower("Alice Johnson","B003")
my_lib.view_books()
my_lib.borrow_book("B001","978-0743273565")
my_lib.view_books()
my_lib.returning_book("B001","978-0743273565")
my_lib.view_books()