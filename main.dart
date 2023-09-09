import 'Booking.dart';
import 'CarRentalSystem.dart';
import 'Customer.dart';
import 'Car.dart';

void main() {
  // system object
  var system = CarRentalSystem();

  // Add cars to the system
  system.add_Cars(Car('Toyota', 'Camry', 'ABC123', 500, true));
  system.add_Cars(Car('Honda', 'Civic', 'XYZ789', 600, true));
  system.add_Cars(Car('Honda', 'Civic', 'HFZ789', 650, true));

  // Add customers to the system
  system.add_Customer(Customer('John Doe', 'john@example.com', 27));
  system.add_Customer(Customer('Jane Smith', 'jane@example.com', 27));
  system.add_Customer(Customer('Sam Wilson', 'sam@example.com', 16));   // booking will refusd because illegal age
  print('-' * 25);

  // List available cars
  system.list_Of_Available_Cars();
  print('-' * 25);

  // Make bookings
  system.make_Booking(system.customers[0], system.cars[0], DateTime.now(),
      DateTime.now().add(Duration(days: 3)));
  system.make_Booking(system.customers[1], system.cars[1], DateTime.now(),
      DateTime.now().add(Duration(days: 5)));
  system.make_Booking(system.customers[2], system.cars[2], DateTime.now(),
      DateTime.now().add(Duration(days: 1)));
  print('-' * 25);

  // List available cars
  system.list_Of_Available_Cars();
  print('-' * 25);

  // List customer bookings
  system.Find_Customer_Bookings(system.customers[0]);
  print('-' * 25);

  // all booking
  system.list_Of_Customers_Booking();
  print('-' * 25);

  // Simulate a late return with damage
  Booking booking = system.bookings[0];
  bool lateReturn = true;
  bool hasDamage = true;
  system.return_car(booking, lateReturn, hasDamage, 800);
}
