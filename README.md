# Flutter SQLite Database Connection

This Flutter project demonstrates how to establish and use a SQLite database connection for efficient local storage in your application. SQLite is a lightweight database engine that's perfect for storing structured data locally on devices.

## Features

- Create, Read, Update, and Delete (CRUD) operations.
- Persistent local storage using SQLite.
- Easy-to-use and extend database helper class.
- Integrated with Flutter's modern development practices.

## Installation

1. **Clone the repository**:

   ```bash
   git clone <repository-url>
   cd <project-folder>
   ```

2. **Install dependencies**:

   Run the following command to install the required packages:

   ```bash
   flutter pub get
   ```

3. **Add SQLite package**:

   Ensure the `pubspec.yaml` file includes the SQLite dependency:

   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     sqflite: ^2.2.0
     path: ^1.8.2
   ```

4. **Run the application**:

   ```bash
   flutter run
   ```

## Database Structure

The SQLite database is managed using a helper class, `DatabaseHelper`. It includes methods to handle CRUD operations for your application data.

### Example Table Schema

```sql
CREATE TABLE example_table (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  description TEXT
);
```

## Usage

1. **Initialize the database**:

   ```dart
   final dbHelper = DatabaseHelper.instance;
   ```

2. **Insert data**:

   ```dart
   Map<String, dynamic> row = {
     'title': 'Sample Title',
     'description': 'Sample Description',
   };
   final id = await dbHelper.insert(row);
   print('Inserted row id: $id');
   ```

3. **Query data**:

   ```dart
   final allRows = await dbHelper.queryAllRows();
   print('Query all rows:');
   allRows.forEach(print);
   ```

4. **Update data**:

   ```dart
   Map<String, dynamic> row = {
     'id': 1,
     'title': 'Updated Title',
     'description': 'Updated Description',
   };
   final rowsAffected = await dbHelper.update(row);
   print('Updated $rowsAffected row(s)');
   ```

5. **Delete data**:

   ```dart
   final id = 1;
   final rowsDeleted = await dbHelper.delete(id);
   print('Deleted $rowsDeleted row(s)');
   ```

## File Structure

```
lib/
├── main.dart
├── models/
│   └── example_model.dart
├── screens/
│   └── home_screen.dart
├── helpers/
    └── database_helper.dart
```


Happy coding! 🚀
