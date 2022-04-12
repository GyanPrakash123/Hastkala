class Activity {
  String imageUrl;
  String username;
  String country;
  String closeTime;
  int rating;
  int Rating;
  int price;
  Activity(
      {required this.imageUrl,
      required this.username,
      required this.country,
      required this.closeTime,
      required this.rating,
      required this.Rating,
      required this.price});
}

List<Activity> activities = [
  Activity(
      imageUrl: 'images/j1.jpg',
      username: 'Gyan456',
      country: 'India',
      closeTime: 'Closed Date: 30-01-2022',
      rating: 100,
      Rating: 5,
      price: 10),
  Activity(
      imageUrl: 'images/j2.jpg',
      username: 'Ashwin456',
      country: 'USA',
      closeTime: 'Closed Date: 20-01-2022',
      rating: 300,
      Rating: 4,
      price: 30),
  Activity(
      imageUrl: 'images/j3.jpg',
      username: 'Sandy456',
      country: 'ENG',
      closeTime: 'Closed Date: 25-01-2022',
      rating: 500,
      Rating: 3,
      price: 50),
  Activity(
      imageUrl: 'images/j4.jpg',
      username: 'Kajal456',
      country: 'France',
      closeTime: 'Closed Date: 2-02-2022',
      rating: 1000,
      Rating: 2,
      price: 50),
  Activity(
      imageUrl: 'images/j5.jpg',
      username: 'Nishank456',
      country: 'Germany',
      closeTime: 'Closed Date: 3-02-2022',
      rating: 150,
      Rating: 4,
      price: 100),
  Activity(
      imageUrl: 'images/j6.jpg',
      username: 'Rohan456',
      country: 'Switzerland',
      closeTime: 'Closed Date: 5-02-2022',
      rating: 1500,
      Rating: 1,
      price: 200),
];

class job {
  List<Activity> activities;
  job({required this.activities});
}
