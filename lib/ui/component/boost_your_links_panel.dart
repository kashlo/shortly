import 'package:flutter/material.dart';

import '../theme.dart';

class BoostYourLinksPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ThemeProvider.horizontalPadding,
        vertical: 110
      ),
      decoration: BoxDecoration(
        color: ThemeProvider.purple,
        image: DecorationImage(
          image: AssetImage('assets/images/bg_boost_your_links.png'),
          fit: BoxFit.fitHeight
        )
      ),
      child: Column(
        children: [
          Text('Boost your links today',
            style: TextStyle(
              color: ThemeProvider.white,
              fontWeight: FontWeight.bold,
              fontSize: 30
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){}, child: Text('Get Started'))
        ],
      ),
    );
  }
}
