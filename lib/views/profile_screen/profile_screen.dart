import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/views/auth_screen/login_screen.dart';
import 'package:emart_app/views/profile_screen/components/details_card.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:emart_app/consts/consts.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: const Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.close,
                      color: whiteColor,
                    )).onTap(() {}),
              ),
              Row(
                children: [
                  Image.asset(
                    imgProfile2,
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.widthBox,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Dummy User"
                          .text
                          .fontFamily(semibold)
                          .color(whiteColor)
                          .make(),
                      "customer@example.com"
                          .text
                          .fontFamily(regular)
                          .color(whiteColor)
                          .make(),
                    ],
                  )),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: whiteColor,
                        ),
                      ),
                      onPressed: () async{
                        await Get.put(AuthController()).signoutMethod(context);
                        Get.offAll(()=>const LoginScreen());
                      },
                      child: logout.text.fontFamily(semibold).white.make(),
                    ),
                  )
                ],
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  detailsCard(
                      width: context.screenWidth / 3.4,
                      count: "00",
                      title: "In your cart"),
                  detailsCard(
                      width: context.screenWidth / 3.4,
                      count: "32",
                      title: "In your wishlist"),
                  detailsCard(
                      width: context.screenWidth / 3.4,
                      count: "675",
                      title: "Your orders"),
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: lightGrey,
                  );
                },
                itemCount: profileButtonsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Image.asset(
                      profileButtonsIcon[index],
                      width: 22,
                    ),
                    title: profileButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                  );
                },
              )
                  .box
                  .white
                  .rounded
                  .margin(const EdgeInsets.all(12))
                  .padding(const EdgeInsets.symmetric(horizontal: 16))
                  .shadowSm
                  .make().box.color(redColor).make(),
            ],
          ),
        ),
      ),
    );
  }
}
