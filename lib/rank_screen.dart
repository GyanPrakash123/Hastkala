class data {
  String imageUrl;
  String text;
  int rank;
  data({required this.imageUrl, required this.text, required this.rank});
}

class Rank {
  List<data> rankList;
  Rank({required this.rankList});
}

List<data> rankList = [
  data(imageUrl: 'images/j1.jpg', text: 'ashwin456', rank: 4),
  data(imageUrl: 'images/j2.jpg', text: 'nishank456', rank: 5),
  data(imageUrl: 'images/j3.jpg', text: 'rohan456', rank: 6),
  data(imageUrl: 'images/j4.jpg', text: 'sidhant456', rank: 7),
  data(imageUrl: 'images/j5.jpg', text: 'sammy456', rank: 8),
  data(imageUrl: 'images/j6.jpg', text: 'mintu456', rank: 9),
];
