import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({super.key, required this.butonText, required this.butonColor, required this.textColor, required this.radius,required this.butonIcon, required this.onPressed});
  final String butonText;
  final Color butonColor;
  final Color textColor;
  final double radius;
  final Widget butonIcon;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
              onPressed:onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: butonColor, // Butonun arka plan rengi
                // Butonun yazı rengi
                elevation: 5, // Gölgelendirme miktarı
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(radius), // Köşelerin yuvarlaklığı
                ),
              ),
              child:  Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  butonIcon,
                  Text(butonText,style: TextStyle(color: textColor),),
                  Opacity(opacity:0 ,child: butonIcon),
                ],
              ),
            );
            
  }
}
