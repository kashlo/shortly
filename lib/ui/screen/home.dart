import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/bloc/short_link/create/bloc.dart';
import '../../core/bloc/short_link/create/event.dart';
import '../../core/bloc/short_link/create/state.dart';
import '../../core/model/short_link.dart';
import '../component/boost_your_links_panel.dart';
import '../component/info_panel.dart';
import '../component/snack_bar.dart';
import '../theme.dart';
import '../component/footer.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  final List<ShortLink> links = [];
  TextEditingController linkController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isCopied = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: ThemeProvider.horizontalPadding,
        title: SvgPicture.asset(
          'assets/images/logo.svg',
          height: 35,
          color: ThemeProvider.purple2
        ),
        actions: [
          IconButton(
            iconSize: 30,
            padding: EdgeInsets.symmetric(horizontal: ThemeProvider.horizontalPadding),
            icon: SvgPicture.asset(
              'assets/icons/drawer.svg',
              width: 40,
              height: 40,
              color: ThemeProvider.darkGrey
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: buildBody(),
    );
  }

  buildBody() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        buildHeader(),
        SizedBox(height: 20),
        buildShortLinkResult(),
        SizedBox(height: 20),
        buildShortLinkList(),
        SizedBox(height: 50),
        InfoPanel(),
        SizedBox(height: 50),
        BoostYourLinksPanel(),
        Footer()
      ],
    );
  }

  Widget buildAppBar() {
    return Container(
      color: ThemeProvider.white,
      padding: const EdgeInsets.symmetric(horizontal: ThemeProvider.horizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Shortly',
            style: TextStyle(
              color: ThemeProvider.purple2,
              fontWeight: FontWeight.bold,
              fontSize: 36
            ),
          ),
          IconButton(
            iconSize: 40,
            icon: SvgPicture.asset(
              'assets/icons/drawer.svg',
              width: 100,
              height: 100,
              color: ThemeProvider.darkGrey
            ),
            onPressed: (){}
          ),
        ],
      ),
    );
  }

  buildHeader() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            Container(
              color: ThemeProvider.white,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(left: ThemeProvider.horizontalPadding),
                    child: Image.asset(
                      'assets/images/illustration_working.png',
                      alignment: Alignment.topRight,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(height: 60),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: ThemeProvider.horizontalPadding),
                    child: Column(
                      children: [
                        Text(
                          'More than just shorter links',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ThemeProvider.purple2,
                            height: 1,
                            fontSize: 46,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Build your brand\'s recognition and get detailed insights on how your links are performing.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ThemeProvider.darkGrey,
                            height: 1.6,
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(height: 35),
                        ElevatedButton(
                          onPressed: (){},
                          child: Text("Get Started")
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 200),
                ],
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: buildShortLinkForm()
        )
      ],
    );
  }

  Widget buildShortLinkButtonBloc() {
    return BlocBuilder<ShortLinkCreateBloc, ShortLinkCreateState>(
      builder: (BuildContext context, ShortLinkCreateState state) {
        if (state is ShortLinkCreateLoadingState) {
          return buildShortenItButton(isLoading: true);
        }
        return buildShortenItButton();
      },
    );
  }

  Widget buildShortenItButton({isLoading = false}) {
    return ElevatedButton(
      onPressed: isLoading ? null : shortenLink,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeProvider.cornerRadius6)
          )
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text("Shorten It!"),
          if (isLoading) Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator()
            )
          ),
        ],
      )
    );
  }

  Widget buildShortLinkResult() {
    return BlocConsumer<ShortLinkCreateBloc, ShortLinkCreateState>(
      listener: (BuildContext context, ShortLinkCreateState state) {
        if (state is ShortLinkCreateErrorState) {
          showSnackBar(state.message);
        }
        if (state is ShortLinkCreateSuccessState) {
          linkController.clear();
        }
      },
      builder: (BuildContext context, ShortLinkCreateState state) {
        if (state is ShortLinkCreateSuccessState) {
          return buildShortLinkPanel(state.shortLink);
        }
        return Container();
      },
    );
  }

  Widget buildShortLinkPanel(ShortLink shortLink) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: ThemeProvider.horizontalPadding),
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: ThemeProvider.white,
        borderRadius: BorderRadius.circular(ThemeProvider.cornerRadius6)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ThemeProvider.horizontalPadding),
            child: Text(shortLink.link),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ThemeProvider.horizontalPadding),
            child: Text(shortLink.shortLink),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ThemeProvider.horizontalPadding),
            child: ElevatedButton(
              onPressed: () => copyLinkToClipboard(shortLink.shortLink),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  isCopied ? ThemeProvider.purple : ThemeProvider.teal
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ThemeProvider.cornerRadius6)
                  ),
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10)
                ),
              ),
              child: Text(isCopied ? 'Copied!' : 'Copy link')
            ),
          )
        ],
      ),
    );
  }

  buildShortLinkForm() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: ThemeProvider.horizontalPadding),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: ThemeProvider.purple,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          alignment: Alignment.topRight,
          image: AssetImage('assets/images/bg_shorten.png'),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Form(
            key: formKey,
            child: TextFormField(
              controller: linkController,
              autocorrect: false,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                hintText: 'Shorten a link here...',
                hintStyle: TextStyle(
                  color: ThemeProvider.red,
                ),
                errorStyle: TextStyle(
                  color: ThemeProvider.red,
                  fontStyle: FontStyle.italic,
                  fontSize: 18
                ),
              ),
              validator: (String? value){
                if (value != null && value.isEmpty) {
                  return 'Please add a link';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 20),
          buildShortLinkButtonBloc()
        ],
      ),
    );
  }

  buildShortLinkList(){
    return BlocConsumer<ShortLinkCreateBloc, ShortLinkCreateState>(
      listener: (BuildContext context, ShortLinkCreateState state) {
        if (state is ShortLinkCreateSuccessState) {
          links.add(state.shortLink);
        }
      },
      buildWhen: (previousState, state) {
        if (state is ShortLinkCreateSuccessState) {
          return true;
        }
        return false;
      },
      builder: (BuildContext context, ShortLinkCreateState state) {
        if (state is ShortLinkCreateSuccessState) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: ThemeProvider.horizontalPadding),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: ThemeProvider.white,
              borderRadius: BorderRadius.circular(ThemeProvider.cornerRadius6)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: links.reversed.map<Widget>((link) => buildLink(link)).toList(),
            ),
          );
        }
        return Container();
      },
    );
  }

  buildLink(ShortLink link) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(link.link, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(link.shortLink),
        ],
      ),
    );
  }

  void showSnackBar(String? message) {
    ScaffoldMessenger.of(context).showSnackBar(LSSnackBar.init(message));
  }

  void copyLinkToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    setState(() {
      isCopied = true;
    });
  }

  void shortenLink(){
    if (formKey.currentState!.validate() ) {
      isCopied = false;
      FocusScope.of(context).unfocus();
      context.read<ShortLinkCreateBloc>().add(ShortLinkCreateRequested(link: linkController.text));
    }
  }
}
