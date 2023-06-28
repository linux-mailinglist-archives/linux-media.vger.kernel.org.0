Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC773740EDA
	for <lists+linux-media@lfdr.de>; Wed, 28 Jun 2023 12:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbjF1KdJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jun 2023 06:33:09 -0400
Received: from www.linuxtv.org ([130.149.80.248]:52868 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231343AbjF1KbG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jun 2023 06:31:06 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qESS0-0099tq-Pd; Wed, 28 Jun 2023 10:31:04 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.96)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qESRz-000QTG-2C;
        Wed, 28 Jun 2023 10:31:03 +0000
Date:   Wed, 28 Jun 2023 10:31:02 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1857218629.4.1687948262967@builder.linuxtv.org>
Subject: Build failed in Jenkins: ZBar #72
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: ZBar
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/ZBar/72/display/redirect>

Changes:


------------------------------------------
[...truncated 15.69 KB...]
checking for setenv... yes
checking for sqrt... no
checking for strcasecmp... yes
checking for strchr... yes
checking for strdup... yes
checking for strerror... yes
checking for strrchr... yes
checking for strstr... yes
checking for strtol... yes
checking for strtoul... yes
checking for malloc... yes
checking for realloc... yes
Generating config files
checking that generated files are newer than configure... done
configure: creating ./config.status
config.status: creating zbar-qt.pc
config.status: creating Makefile
config.status: creating gtk/Makefile
config.status: creating java/Makefile
config.status: creating po/Makefile.in
config.status: creating zbar/Makefile
config.status: creating zbar.pc
config.status: creating zbar-gtk.pc
config.status: creating doc/doxygen.conf
config.status: creating test/test_examples.sh
config.status: creating test/check_dbus.sh
config.status: creating include/config.h
config.status: executing depfiles commands
config.status: executing libtool commands
config.status: executing po-directories commands
config.status: creating po/POTFILES
config.status: creating po/Makefile
config.status: executing doc/version.xml commands
writing new doc/version.xml
config.status: executing doc/reldate.xml commands
writing new doc/reldate.xml

please verify that the detected configuration matches your expectations:
------------------------------------------------------------------------
gettext                yes
X                      --with-x=yes
pthreads               --enable-pthread=yes
doc                    --enable-doc=yes
v4l                    --enable-video=yes
jpeg                   --with-jpeg=yes
Python                 --with-python=python3 	python3.11
GTK                    --with-gtk=gtk3       	Gtk3.24.37
GObject introspection  --with-gir=yes
Qt                     --with-qt=yes         	Qt
Java                   --with-java=yes
Dbus                   --with-dbus=yes
ImageMagick            --with-imagemagick=yes
Enabled codes:         ean databar code128 code93 code39 codabar i25 qrcode sqcode
Disabled codes:        pdf417
JAVA_HOME              /usr/lib/jvm/java-11-openjdk-amd64

        => the Java unit test will *NOT* be enabled
+ make
/usr/bin/mkdir -p zbarcam
i -Izbarcam -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtGui -DQT_WIDGETS_LIB -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -DQT_X11EXTRAS_LIB -I/usr/include/x86_64-linux-gnu/qt5/QtX11Extras -DQT_GUI_LIB -DQT_CORE_LIB  -I./include zbarcam/zbarcam-qt.cpp -o zbarcam/moc_zbarcam_qt.h
/bin/bash: line 1: i: command not found
make: [Makefile:2469: zbarcam/moc_zbarcam_qt.h] Error 127 (ignored)
/usr/bin/mkdir -p qt
Iqt -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtGui -DQT_WIDGETS_LIB -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -DQT_X11EXTRAS_LIB -I/usr/include/x86_64-linux-gnu/qt5/QtX11Extras -DQT_GUI_LIB -DQT_CORE_LIB  -I./include include/zbar/QZBar.h -o qt/moc_QZBar.cpp
/bin/bash: line 1: Iqt: command not found
make: [Makefile:2498: qt/moc_QZBar.cpp] Error 127 (ignored)
Iqt -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtGui -DQT_WIDGETS_LIB -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -DQT_X11EXTRAS_LIB -I/usr/include/x86_64-linux-gnu/qt5/QtX11Extras -DQT_GUI_LIB -DQT_CORE_LIB  -I./include qt/QZBarThread.h -o qt/moc_QZBarThread.cpp
/bin/bash: line 1: Iqt: command not found
make: [Makefile:2494: qt/moc_QZBarThread.cpp] Error 127 (ignored)
make  all-recursive
make[1]: Entering directory '<https://builder.linuxtv.org/job/ZBar/ws/'>
Making all in zbar
make[2]: Entering directory '<https://builder.linuxtv.org/job/ZBar/ws/zbar'>
  CC       libzbar_la-config.lo
  CC       libzbar_la-error.lo
  CC       libzbar_la-symbol.lo
  CC       libzbar_la-image.lo
  CC       libzbar_la-convert.lo
  CC       libzbar_la-processor.lo
  CC       libzbar_la-refcnt.lo
  CC       libzbar_la-window.lo
  CC       libzbar_la-video.lo
  CC       libzbar_la-img_scanner.lo
  CC       libzbar_la-scanner.lo
  CC       libzbar_la-decoder.lo
  CC       libzbar_la-misc.lo
  CC       libzbar_la-sqcode.lo
  CC       decoder/libzbar_la-sq_finder.lo
  CC       processor/libzbar_la-posix.lo
  CC       libzbar_la-jpeg.lo
  CC       processor/libzbar_la-x.lo
  CC       processor/libzbar_la-lock.lo
  CC       decoder/libzbar_la-ean.lo
  CC       decoder/libzbar_la-databar.lo
  CC       decoder/libzbar_la-code128.lo
  CC       decoder/libzbar_la-code93.lo
  CC       decoder/libzbar_la-code39.lo
  CC       decoder/libzbar_la-codabar.lo
  CC       decoder/libzbar_la-i25.lo
  CC       decoder/libzbar_la-qr_finder.lo
  CC       qrcode/libzbar_la-qrdec.lo
  CC       qrcode/libzbar_la-qrdectxt.lo
  CC       qrcode/libzbar_la-rs.lo
  CC       qrcode/libzbar_la-isaac.lo
  CC       qrcode/libzbar_la-bch15_5.lo
  CC       qrcode/libzbar_la-binarize.lo
  CC       qrcode/libzbar_la-util.lo
  CC       video/libzbar_la-v4l.lo
  CC       video/libzbar_la-v4l2.lo
  CC       window/libzbar_la-x.lo
  CC       window/libzbar_la-ximage.lo
  CC       window/libzbar_la-xv.lo
  CCLD     libzbar.la
copying selected object files to avoid basename conflicts...
make[2]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/zbar'>
Making all in po
make[2]: Entering directory '<https://builder.linuxtv.org/job/ZBar/ws/po'>
make zbar.pot-update
make[3]: Entering directory '<https://builder.linuxtv.org/job/ZBar/ws/po'>
sed -e '/^#/d' remove-potcdate.sin > t-remove-potcdate.sed
mv t-remove-potcdate.sed remove-potcdate.sed
package_gnu=""; \
test -n "$package_gnu" || { \
  if { if (LC_ALL=C find --version) 2>/dev/null | grep GNU >/dev/null; then \
         LC_ALL=C find -L .. -maxdepth 1 -type f -size -10000000c -exec grep -i 'GNU zbar' /dev/null '{}' ';' 2>/dev/null; \
       else \
         LC_ALL=C grep -i 'GNU zbar' ../* 2>/dev/null; \
       fi; \
     } | grep -v 'libtool:' >/dev/null; then \
     package_gnu=yes; \
   else \
     package_gnu=no; \
   fi; \
}; \
if test "$package_gnu" = "yes"; then \
  package_prefix='GNU '; \
else \
  package_prefix=''; \
fi; \
if test -n 'https://github.com/mchehab/zbar/issues' || test 'mchehab+huawei@kernel.org' = '@'PACKAGE_BUGREPORT'@'; then \
  msgid_bugs_address='https://github.com/mchehab/zbar/issues'; \
else \
  msgid_bugs_address='mchehab+huawei@kernel.org'; \
fi; \
case `/usr/bin/xgettext --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
  '' | 0.[0-9] | 0.[0-9].* | 0.1[0-5] | 0.1[0-5].* | 0.16 | 0.16.[0-1]*) \
    /usr/bin/xgettext --default-domain=zbar --directory=.. \
      --add-comments=TRANSLATORS: \
      --files-from=./POTFILES.in \
      --copyright-holder='Mauro Carvalho Chehab' \
      --msgid-bugs-address="$msgid_bugs_address" \
      --keyword=_ --keyword=N_ --keyword=P_:1,2  \
    ;; \
  *) \
    /usr/bin/xgettext --default-domain=zbar --directory=.. \
      --add-comments=TRANSLATORS: \
      --files-from=./POTFILES.in \
      --copyright-holder='Mauro Carvalho Chehab' \
      --package-name="${package_prefix}zbar" \
      --package-version='0.23.92' \
      --msgid-bugs-address="$msgid_bugs_address" \
      --keyword=_ --keyword=N_ --keyword=P_:1,2  \
    ;; \
esac
test ! -f zbar.po || { \
  if test -f ./zbar.pot-header; then \
    sed -e '1,/^#$/d' < zbar.po > zbar.1po && \
    cat ./zbar.pot-header zbar.1po > zbar.po && \
    rm -f zbar.1po \
    || exit 1; \
  fi; \
  if test -f ./zbar.pot; then \
    sed -f remove-potcdate.sed < ./zbar.pot > zbar.1po && \
    sed -f remove-potcdate.sed < zbar.po > zbar.2po && \
    if cmp zbar.1po zbar.2po >/dev/null 2>&1; then \
      rm -f zbar.1po zbar.2po zbar.po; \
    else \
      rm -f zbar.1po zbar.2po ./zbar.pot && \
      mv zbar.po ./zbar.pot; \
    fi; \
  else \
    mv zbar.po ./zbar.pot; \
  fi; \
}
make[3]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/po'>
test ! -f ./zbar.pot || \
  test -z "pt_BR.gmo" || make pt_BR.gmo
make[3]: Entering directory '<https://builder.linuxtv.org/job/ZBar/ws/po'>
/usr/bin/msgmerge --update  --lang=pt_BR --previous pt_BR.po zbar.pot
......... done.
rm -f pt_BR.gmo && /usr/bin/msgmerge --for-msgfmt -o pt_BR.1po pt_BR.po zbar.pot && /usr/bin/msgfmt -c --statistics --verbose -o pt_BR.gmo pt_BR.1po && rm -f pt_BR.1po
pt_BR.1po: 14 translated messages.
make[3]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/po'>
touch ./stamp-po
make[2]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/po'>
Making all in gtk
make[2]: Entering directory '<https://builder.linuxtv.org/job/ZBar/ws/gtk'>
/usr/bin/glib-genmarshal --g-fatal-warnings --prefix=zbar_marshal \
    --body zbarmarshal.list > zbarmarshal.c
/usr/bin/glib-genmarshal --g-fatal-warnings --prefix=zbar_marshal \
    --header zbarmarshal.list > zbarmarshal.h
INFO: Reading zbarmarshal.list...
INFO: Reading zbarmarshal.list...
make  all-am
make[3]: Entering directory '<https://builder.linuxtv.org/job/ZBar/ws/gtk'>
  CC       libzbargtk_la-zbargtk.lo
  CC       libzbargtk_la-zbarmarshal.lo
  CCLD     libzbargtk.la
  GISCAN   ZBar-1.0.gir
  GICOMP   ZBar-1.0.gir
make[3]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/gtk'>
make[2]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/gtk'>
Making all in java
make[2]: Entering directory '<https://builder.linuxtv.org/job/ZBar/ws/java'>
/usr/lib/jvm/java-11-openjdk-amd64/bin/javac -h <https://builder.linuxtv.org/job/ZBar/ws/java> <https://builder.linuxtv.org/job/ZBar/ws/java/net/sourceforge/zbar/*.java>
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
cat <https://builder.linuxtv.org/job/ZBar/ws/java/net_sourceforge_zbar_*.h> > <https://builder.linuxtv.org/job/ZBar/ws/java/zbarjni.h>
rm <https://builder.linuxtv.org/job/ZBar/ws/java/net_sourceforge_zbar_*.h>
make  all-am
make[3]: Entering directory '<https://builder.linuxtv.org/job/ZBar/ws/java'>
cd <https://builder.linuxtv.org/job/ZBar/ws/java;> /usr/lib/jvm/java-11-openjdk-amd64/bin/javac -d <https://builder.linuxtv.org/job/ZBar/ws/java> net/sourceforge/zbar/Config.java net/sourceforge/zbar/Modifier.java net/sourceforge/zbar/Orientation.java net/sourceforge/zbar/Symbol.java net/sourceforge/zbar/SymbolIterator.java net/sourceforge/zbar/SymbolSet.java net/sourceforge/zbar/Image.java net/sourceforge/zbar/ImageScanner.java
  CC       libzbarjni_la-zbarjni.lo
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
/usr/lib/jvm/java-11-openjdk-amd64/bin/jar cf zbar.jar net/sourceforge/zbar/Config.class net/sourceforge/zbar/Modifier.class net/sourceforge/zbar/Orientation.class net/sourceforge/zbar/Symbol.class net/sourceforge/zbar/SymbolIterator.class net/sourceforge/zbar/SymbolSet.class net/sourceforge/zbar/Image.class net/sourceforge/zbar/ImageScanner.class || rm -f zbar.jar
  CCLD     libzbarjni.la
make[3]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/java'>
make[2]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/java'>
Making all in .
make[2]: Entering directory '<https://builder.linuxtv.org/job/ZBar/ws/'>
  CC       zbarimg/zbarimg-zbarimg.o
  CCLD     zbarimg/zbarimg
  CC       zbarcam/zbarcam-zbarcam.o
  CCLD     zbarcam/zbarcam
  CC       zbarcam/zbarcam_gtk-zbarcam-gtk.o
  CC       zbarcam/zbarcam_gtk-scan_video.o
  CCLD     zbarcam/zbarcam-gtk
  CXX      zbarcam/zbarcam_qt-zbarcam-qt.o
zbarcam/zbarcam-qt.cpp:1009:10: fatal error: moc_zbarcam_qt.h: No such file or directory
 1009 | #include "moc_zbarcam_qt.h"
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [Makefile:1706: zbarcam/zbarcam_qt-zbarcam-qt.o] Error 1
make[2]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/'>
make[1]: *** [Makefile:1911: all-recursive] Error 1
make[1]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/'>
make: *** [Makefile:991: all] Error 2
Build step 'Execute shell' marked build as failure
