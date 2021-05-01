import 'package:flutter/material.dart';

void main() {
  runApp(Portfolio());
}

enum SkillState { mobile, design, data }

class Portfolio extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Portfolio',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Icon(Icons.notification_important)
                    ],
                  ),
                  SizedBox(height: 30),
                  Profile(),
                  SizedBox(height: 30),
                  Text(
                    'Experience',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  SkillsAndProjects(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileImage(image: 'asset/images/profile.jpeg'),
                SizedBox(height: 30),
                Text.rich(
                  TextSpan(
                    text: 'Olapade\n',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: 'Abdul-Azeez',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black.withOpacity(.3),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                ProfileText(
                  title: 'About',
                  value: 'Respected Software Developer with 10-plus years of '
                      'experience in collaborating with creative and development teams'
                      'on the execution of ideas and projects.',
                ),
                SizedBox(height: 10),
                ProfileText(
                  title: 'Skills',
                  value: 'Mobile Dev, UI/UX, Data Science',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SkillsAndProjects extends StatefulWidget {
  const SkillsAndProjects({
    Key key,
  }) : super(key: key);

  @override
  _SkillsAndProjectsState createState() => _SkillsAndProjectsState();
}

class _SkillsAndProjectsState extends State<SkillsAndProjects> {
  var selectedIndex = 0;
  Map<String, Map> skills = {
    'Mobile Dev': {
      'description': "I will build apps for Google's Android, Apple's"
          " iOS and Microsoft's Windows Phone platforms",
      'projects': 'MoneyOnTheGo, GetToKnowMe, GadgetStore',
    },
    'UI/UX Design': {
      'description':
          'I will be designing ideas using various methods and latest technology. '
              'plus graphic user interface elements, like menus, tabs, forms, and widgets.',
      'projects': 'MoneyOnTheGo, GetToKnowMe, GadgetStore',
    },
    'Data Science': {
      'description':
          'I will combine domain expertise, programming skills, and knowledge of'
              ' mathematics and statistics to extract meaningful insights from data',
      'projects':
          'Leaf Disease Detection, Road Lane Detection, Parkinsons Disease Detection',
    }
  };

  var selectedState = SkillState.mobile;

  @override
  Widget build(BuildContext context) {
    var list = skills.entries.toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ...List.generate(
              skills.length,
              (index) => Expanded(
                child: Padding(
                  padding: (index == 2)
                      ? EdgeInsets.all(0)
                      : EdgeInsets.only(right: 15.0),
                  child: SkillBox(
                    onTap: () {
                      setState(() {
                        selectedState = SkillState.values[index];
                        selectedIndex = index;
                      });
                    },
                    title: list[index].key,
                    cColor: SkillState.values[index] == selectedState
                        ? Colors.black
                        : null,
                    tColor: SkillState.values[index] == selectedState
                        ? Colors.white
                        : null,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 20,
                color: Colors.grey,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                list[selectedIndex].value['description'],
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Projects',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                list[selectedIndex].value['projects'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key key, @required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 2), shape: BoxShape.circle),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: CircleAvatar(
          child: ClipOval(
            child: Center(
              child: Image.asset(
                image,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          radius: 40,
          backgroundColor: Colors.grey.shade300,
        ),
      ),
    );
  }
}

class ProfileText extends StatelessWidget {
  const ProfileText({
    Key key,
    @required this.title,
    @required this.value,
  }) : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title\n',
          style: TextStyle(
            fontSize: 12,
            color: Colors.black.withOpacity(.2),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 200,
          child: Text(
            value,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class SkillBox extends StatelessWidget {
  const SkillBox({
    Key key,
    @required this.title,
    @required this.onTap,
    this.cColor,
    this.tColor,
  }) : super(key: key);
  final String title;
  final Color cColor;
  final Color tColor;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 150,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: cColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 10,
              color: tColor,
            ),
          ),
        ),
      ),
    );
  }
}
