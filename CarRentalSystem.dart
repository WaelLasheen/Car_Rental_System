// Define a class for the car rental system
import 'Booking.dart';
import 'Customer.dart';
import 'Car.dart';

class CarRentalSystem {
  List<Car> cars = [];
  List<Customer> customers = [];
  List<Booking> bookings = [];

  // Add a car to the fleet
  void add_Cars(Car car) {
    cars.add(car);
  }

  // Add a customer to the system
  void add_Customer(Customer customer) {
    customers.add(customer);
  }

  // Make a booking
  void make_Booking(
      Customer customer, Car car, DateTime pickupDate, DateTime returnDate) {
    // check if the customer under the legal age
    if (customer.age <= 18) {
      print('Sorry, but you are too young to drive a car  O_O');
      return;
    }
    // check if the car is available
    if (!car.is_available) {
      print('car is not available for the selected dates.');
      return;
    }

    Booking booking = Booking(customer, car, pickupDate, returnDate);
    car.is_available = false;
    bookings.add(booking);
    print('Booking successful! ^_^');
    int money = (booking.returnDate.day - booking.pickupDate.day) *
        booking.car.rental_Rate;
    print('you \'ll pay ${money}');
  }

  // List all available cars
  void list_Of_Available_Cars() {
    bool k = true;
    for (Car car in cars) {
      if (car.is_available) {
        k = false;
        print(
            'Make: ${car.make}, Model: ${car.model}, License Plate: ${car.license_Plate}');
      }
    }
    if (k) {
      print('there are no available cars now');
    }
  }

  // find customer bookings
  void Find_Customer_Bookings(Customer customer) {
    print('Name : ${customer.name}  Booking data :::');
    bool k = false;
    for (Booking booking in bookings) {
      if (booking.customer == customer) {
        k = true;
        print(
            'Car: ${booking.car.make}, Pickup Date: ${booking.pickupDate}, Return Date: ${booking.returnDate}');
      }
    }
    if (!k) {
      print('There is no previous booking  T_T');
    }
  }

  // All customers booking
  void list_Of_Customers_Booking() {
    print('All customers bookings :');
    print('-' * 20);
    for (Booking booking in bookings) {
      print(
          'Name : ${booking.customer.name}  =>  Car: ${booking.car.make}, Pickup Date: ${booking.pickupDate}, Return Date: ${booking.returnDate}');
    }
  }

  // cansel or remove booking
  void remove_booking(Booking booking) {
    bookings.remove(booking);
  }

  // car return
  void return_car(
      Booking booking, bool lateReturn, bool hasDamage, int damageFine) {
    int lateFineRate =
        booking.car.rental_Rate; // Define your late fine rate per day

    if (lateReturn) {
      int lateDays = DateTime.now().add(Duration(days: 5)).day -
          booking.returnDate.difference(booking.pickupDate).inDays;
      booking.late_Fine_Amount = lateDays * lateFineRate;
      booking.car.lateFine = true;
    }

    if (hasDamage) {
      // Calculate damage fine based on the severity of damage or fixed amount
      booking.damage_Fine_Amount = damageFine;
      booking.car.damageFine = true;
    }

    // Mark the car as available
    booking.car.is_available = true;
    
    if (lateReturn) {
      print('Booking returned. Late Fine: \$${booking.late_Fine_Amount}');
    }

    if (hasDamage) {
      print(' Damage Fine: \$${booking.damage_Fine_Amount}');
    }
  }
}
