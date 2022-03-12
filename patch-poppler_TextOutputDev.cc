--- poppler/TextOutputDev.cc.orig	2017-12-03 20:25:06.000000000 +0100
+++ poppler/TextOutputDev.cc	2022-03-11 18:53:53.959431000 +0100
@@ -5868,6 +5868,6 @@ TextPage *TextOutputDev::takeText() {
   TextPage *ret;
 
   ret = text;
-  text = new TextPage(rawOrder);
+//  text = new TextPage(rawOrder);
   return ret;
 }
