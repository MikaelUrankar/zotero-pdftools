--- utils/pdfinfo.cc.orig	2022-03-11 18:47:15.462598000 +0100
+++ utils/pdfinfo.cc	2022-03-11 18:51:42.174504000 +0100
@@ -618,6 +618,15 @@ int main(int argc, char *argv[]) {
 
   // parse args
   Win32Console win32console(&argc, &argv);
+  if(argc!=3 || argv[1][0]=='-' || argv[2][0]=='-') {
+    fprintf(stderr, "This is a custom Poppler pdfinfo build. Please use the original version!\n%s\n%s\n%s\npdfinfo <PDF-file> <output-file>\n",
+        PACKAGE_VERSION, popplerCopyright, xpdfCopyright);
+    return 1;
+  } else {
+    freopen(argv[argc-1], "w", stdout);
+    argc--;
+  }
+
   ok = parseArgs(argDesc, &argc, argv);
   if (!ok || (argc != 2 && !printEnc) || printVersion || printHelp) {
     fprintf(stderr, "pdfinfo version %s\n", PACKAGE_VERSION);
