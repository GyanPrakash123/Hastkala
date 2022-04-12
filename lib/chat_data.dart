class Chat {
  final String name, lastmessage, image, time;
  final bool isActive;

  Chat(
      {required this.name,
      required this.lastmessage,
      required this.image,
      required this.time,
      required this.isActive});
}

List chatsData = [
  Chat(
    name: 'Jenny Wilson',
    lastmessage: 'Hope You are doing well',
    image: 'images/c1.jfif',
    time: '3m ago',
    isActive: false,
  ),
  Chat(
    name: 'Jenny Wilson',
    lastmessage: 'Hope You are doing well',
    image: 'images/c2.jfif',
    time: '3m ago',
    isActive: true,
  ),
  Chat(
    name: 'Jenny Wilson',
    lastmessage: 'Hope You are doing well',
    image: 'images/c3.jfif',
    time: '3m ago',
    isActive: false,
  ),
  Chat(
    name: 'Jenny Wilson',
    lastmessage: 'Hope You are doing well',
    image: 'images/c4.jpg',
    time: '3m ago',
    isActive: true,
  ),
  Chat(
    name: 'Jenny Wilson',
    lastmessage: 'Hope You are doing well',
    image: 'images/c5.jfif',
    time: '3m ago',
    isActive: true,
  ),
  Chat(
    name: 'Jenny Wilson',
    lastmessage: 'Hope You are doing well',
    image: 'images/c6.jfif',
    time: '3m ago',
    isActive: false,
  ),
  Chat(
    name: 'Jenny Wilson',
    lastmessage: 'Hope You are doing well',
    image: 'images/c7.jfif',
    time: '3m ago',
    isActive: true,
  ),
  Chat(
    name: 'Jenny Wilson',
    lastmessage: 'Hope You are doing well',
    image: 'images/j1.jpg',
    time: '3m ago',
    isActive: false,
  ),
  Chat(
    name: 'Jenny Wilson',
    lastmessage: 'Hope You are doing well',
    image: 'images/j2.jpg',
    time: '3m ago',
    isActive: false,
  ),
];
