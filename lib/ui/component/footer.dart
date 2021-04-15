import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeProvider.darkPurple,
      padding: EdgeInsets.symmetric(
        horizontal: ThemeProvider.horizontalPadding,
        vertical: 60
      ),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/logo.svg',
            height: 35,
            color: ThemeProvider.white
          ),
          SizedBox(height: 50),
          buildSectionHeader('Features'),
          buildSectionLink('Link Shortening'),
          buildSectionLink('Branded Links'),
          buildSectionLink('Analytics'),
          SizedBox(height: 30),
          buildSectionHeader('Resources'),
          buildSectionLink('Blog'),
          buildSectionLink('Developers'),
          buildSectionLink('Support'),
          SizedBox(height: 30),
          buildSectionHeader('Company'),
          buildSectionLink('About'),
          buildSectionLink('Our Team'),
          buildSectionLink('Careers'),
          buildSectionLink('Contact'),
          SizedBox(height: 30),
          buildSocialNetworks()
        ],
      ),
    );
  }


  Widget buildSectionHeader(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: ThemeProvider.white
        ),
      ),
    );
  }

  Widget buildSectionLink(String label){
    return TextButton(
      onPressed: (){},
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero)
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: ThemeProvider.darkGrey
        ),
      ),
    );
  }

  buildSocialNetworks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildSocialNetworkButton(icon: 'facebook'),
        buildSocialNetworkButton(icon: 'twitter'),
        buildSocialNetworkButton(icon: 'pinterest'),
        buildSocialNetworkButton(icon: 'instagram'),
      ],
    );
  }

  IconButton buildSocialNetworkButton({String? icon}) {
    return IconButton(
      icon: SvgPicture.asset('assets/icons/$icon.svg'),
      onPressed: (){}
    );
  }
}
