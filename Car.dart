class Car {
  String make;
  String model;
  String license_Plate;
  int rental_Rate;
  bool is_available;
  bool lateFine = false;
  bool damageFine = false;
  Car(this.make, this.model, this.license_Plate, this.rental_Rate,
      this.is_available);
}
