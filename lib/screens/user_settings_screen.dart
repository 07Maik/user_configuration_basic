import 'package:flutter/material.dart';

class UserSettingsScreen extends StatelessWidget {
  const UserSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: const Icon(Icons.arrow_back),
        title: const Text('Settings'),
        elevation: 1,
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(children: [
            account(),
            pushNotifications(),
            logOut(),
          ]),
        ),
      ),
    );
  }

  Widget account() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          groupTitle('ACCOUNT'),
          CustomCard(
            cardItems: [
              ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2017/04/01/21/06/portrait-2194457_960_720.jpg',
                          ))),
                ),
                title: const Text('Michael Caicedo',
                    style: TextStyle(fontSize: 17)),
              ),
              customSwitchListTile('Private Account', true),
            ],
          ),
        ],
      ),
    );
  }

  Widget pushNotifications() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: [
          groupTitle('PUSH NOTIFICATIONS'),
          CustomCard(
            cardItems: [
              customSwitchListTile('Received notification', true),
              customSwitchListTile('Received newsletter', false),
              customSwitchListTile('Received Offer Notification', true),
              customSwitchListTile('Received App Updates', false),
            ],
          ),
        ],
      ),
    );
  }

  CustomCard logOut() {
    return const CustomCard(cardItems: [
      ListTile(
        leading: Icon(Icons.logout),
        title: Text('Logout',style: TextStyle(fontSize: 17)),
      )
    ]);
  }

  Widget groupTitle(text) => Align(
        alignment: Alignment.centerLeft,
        child: Text(
          " $text",
          style: TextStyle(
              shadows: [
                Shadow(color: Colors.black.withOpacity(0.5), blurRadius: 4)
              ],
              color: Colors.black.withOpacity(0.5),
              fontSize: 22.0,
              fontWeight: FontWeight.w500),
        ),
      );

  Widget customSwitchListTile(String text, bool value) {
    return SwitchListTile(
      onChanged: (a) {
        //TODO: manage change of state
      },
      value: value,
      activeColor: Colors.purple,
      title: Text(
        text,
        style: TextStyle(
            color: (value ? Colors.black : Colors.grey), fontSize: 17),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final List<Widget> cardItems;

  const CustomCard({super.key, required this.cardItems});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0 * cardItems.length,
      child: Card(
        elevation: 1,
        shadowColor: Colors.black,
        color: Colors.white,
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, int index) => cardItems[index],
          itemCount: cardItems.length,
          separatorBuilder: (_, __) => Divider(
              endIndent: 10, indent: 10, color: Colors.grey[200], thickness: 2),
        ),
      ),
    );
  }
}
