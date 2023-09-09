import 'Customer.dart';
import 'Car.dart';

class Booking {
  Customer customer;
  Car car;
  DateTime pickupDate;
  DateTime returnDate;
  int late_Fine_Amount = 0;
  int damage_Fine_Amount = 0;

  Booking(this.customer, this.car, this.pickupDate, this.returnDate);
}
