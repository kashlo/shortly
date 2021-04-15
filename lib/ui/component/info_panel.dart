import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: ThemeProvider.horizontalPadding
      ),
      child: Column(
        children: [
          Text('Advanced Statistics',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 20),
          Text('Track how your links are performing across the web with our advances statistics dashboard.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ThemeProvider.darkGrey,
              height: 1.6,
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),
          ),
          buildInfoPanel(
            title: 'Brand Recognition',
            description: 'Boost your brand recognition with each click. Generic links don\'t mean a thing. Branded links help instil confidence in your content',
            icon: 'brand_recognition',
            isFirst: true
          ),
          buildInfoPanel(
            title: 'Detailed Records',
            description: 'Gain insights into who is clicking your links. Knowing when and where people engage with your content helps inform better decisions.',
            icon: 'detailed_records'
          ),
          buildInfoPanel(
            title: 'Fully Customizable',
            description: 'Improve brand awareness and content discoverability through customizable links, supercharging audience engagement.',
            icon: 'fully_customizable'
          ),
        ],
      ),
    );
  }

  Widget buildInfoPanel({String title = '', String description = '', String icon = '', bool isFirst = false}) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        if (!isFirst) Container(color: ThemeProvider.teal, width: 10, height: 100, child: Container()),
        Container(
          margin: EdgeInsets.only(top: 100),
          padding: EdgeInsets.fromLTRB(30, 80, 30, 50),
          decoration: BoxDecoration(
            color: ThemeProvider.white,
            borderRadius: BorderRadius.circular(ThemeProvider.cornerRadius6)
          ),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: ThemeProvider.purple2,
                  fontSize: 26,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ThemeProvider.darkGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 95,
          height: 95,
          margin: EdgeInsets.only(top: 50),
          padding: EdgeInsets.all(26),
          decoration: BoxDecoration(
            color: ThemeProvider.purple,
            shape: BoxShape.circle
          ),
          child: SvgPicture.asset(
            'assets/icons/$icon.svg',
            width: 20,
            color: ThemeProvider.teal
          )
        ),
      ],
    );
  }
}
