Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD9719F241
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 11:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgDFJPU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 05:15:20 -0400
Received: from www.linuxtv.org ([130.149.80.248]:53360 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726744AbgDFJPU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Apr 2020 05:15:20 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jLNo0-008Vzl-7f; Mon, 06 Apr 2020 09:12:32 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jLNsL-0003AW-Sk; Mon, 06 Apr 2020 09:17:01 +0000
Date:   Mon, 6 Apr 2020 09:17:01 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1296461545.2.1586164621733.JavaMail.jenkins@builder.linuxtv.org>
In-Reply-To: <523140859.0.1585567232636.JavaMail.jenkins@builder.linuxtv.org>
References: <523140859.0.1585567232636.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: ZBar #13
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: ZBar
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/ZBar/13/display/redirect?page=changes>

Changes:

[noreply] Mention Python 3 support in Python bindings

[Mauro Carvalho Chehab] README.md: add a note about travisCI


------------------------------------------
[...truncated 12.58 KB...]
checking for sys/ioctl.h... yes
checking sys/time.h usability... yes
checking sys/time.h presence... yes
checking for sys/time.h... yes
checking sys/times.h usability... yes
checking sys/times.h presence... yes
checking for sys/times.h... yes
checking sys/ipc.h usability... yes
checking sys/ipc.h presence... yes
checking for sys/ipc.h... yes
checking sys/shm.h usability... yes
checking sys/shm.h presence... yes
checking for sys/shm.h... yes
checking sys/mman.h usability... yes
checking sys/mman.h presence... yes
checking for sys/mman.h... yes
checking whether sys/types.h defines makedev... no
checking sys/mkdev.h usability... no
checking sys/mkdev.h presence... no
checking for sys/mkdev.h... no
checking sys/sysmacros.h usability... yes
checking sys/sysmacros.h presence... yes
checking for sys/sysmacros.h... yes
checking for stdbool.h that conforms to C99... yes
checking for _Bool... yes
checking for int32_t... yes
checking for uint32_t... yes
checking for uint8_t... yes
checking for uintptr_t... yes
checking for uid_t in sys/types.h... yes
checking for int32_t... (cached) yes
checking for int64_t... yes
checking for off_t... yes
checking for size_t... yes
checking for uint16_t... yes
checking for uint32_t... (cached) yes
checking for uint64_t... yes
checking for uint8_t... (cached) yes
checking for struct stat.st_rdev... yes
checking for an ANSI C-conforming const... yes
checking for inline... inline
checking for stdlib.h... (cached) yes
checking for unistd.h... (cached) yes
checking for sys/param.h... yes
checking for getpagesize... yes
checking for working mmap... yes
checking for alarm... yes
checking for clock_gettime... yes
checking for floor... no
checking for getcwd... yes
checking for gettimeofday... yes
checking for localeconv... yes
checking for memchr... yes
checking for memmove... yes
checking for memset... yes
checking for modf... yes
checking for munmap... yes
checking for pow... no
checking for select... yes
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
config.status: creating zbar/Makefile
config.status: creating zbar.pc
config.status: creating zbar-gtk.pc
config.status: creating doc/doxygen.conf
config.status: creating test/test_examples.sh
config.status: creating test/check_dbus.sh
config.status: creating include/config.h
config.status: executing depfiles commands
config.status: executing libtool commands
config.status: executing doc/version.xml commands
writing new doc/version.xml
config.status: executing doc/reldate.xml commands
writing new doc/reldate.xml

please verify that the detected configuration matches your expectations:
------------------------------------------------------------------------
X                      --with-x=yes
pthreads               --enable-pthread=yes
doc                    --enable-doc=yes
v4l                    --enable-video=yes
jpeg                   --with-jpeg=yes
Python                 --with-python=python3    python3.7
GTK                    --with-gtk=gtk3          Gtk3.24.5
GObject introspection  --with-gir=yes
Qt                     --with-qt=yes            Qt5.11.3
Java                   --with-java=yes
Dbus                   --with-dbus=yes
ImageMagick            --with-imagemagick=check
Enabled codes:         ean databar code128 code93 code39 codabar i25 qrcode sqcode
Disabled codes:        pdf417
JAVA_HOME              /usr/lib/jvm/java-11-openjdk-amd64

        => the Java unit test will *NOT* be enabled
+ make
moc -i -Izbarcam -DQT_WIDGETS_LIB -DQT_X11EXTRAS_LIB -DQT_GUI_LIB -DQT_CORE_LIB -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtX11Extras -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtGui -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I/usr/include/x86_64-linux-gnu/qt5 -I./include zbarcam/zbarcam-qt.cpp -o zbarcam/moc_zbarcam_qt.h
moc -Iqt -DQT_WIDGETS_LIB -DQT_X11EXTRAS_LIB -DQT_GUI_LIB -DQT_CORE_LIB -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtX11Extras -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtGui -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I/usr/include/x86_64-linux-gnu/qt5 -I./include include/zbar/QZBar.h -o qt/moc_QZBar.cpp
moc -Iqt -DQT_WIDGETS_LIB -DQT_X11EXTRAS_LIB -DQT_GUI_LIB -DQT_CORE_LIB -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtX11Extras -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtGui -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I/usr/include/x86_64-linux-gnu/qt5 -I./include qt/QZBarThread.h -o qt/moc_QZBarThread.cpp
make  all-recursive
make[1]: Entering directory '<https://builder.linuxtv.org/job/ZBar/ws/'>
Making all in zbar
make[2]: Entering directory '<https://builder.linuxtv.org/job/ZBar/ws/zbar'>
  CC       libzbar_la-config.lo
  CC       libzbar_la-error.lo
  CC       libzbar_la-image.lo
  CC       libzbar_la-processor.lo
  CC       libzbar_la-convert.lo
  CC       libzbar_la-symbol.lo
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
ar: `u' modifier ignored since `D' is the default (see `U')
make[2]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/zbar'>
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
ar: `u' modifier ignored since `D' is the default (see `U')
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
  CCLD     libzbarjni.la
ar: `u' modifier ignored since `D' is the default (see `U')
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
/usr/lib/jvm/java-11-openjdk-amd64/bin/jar cf zbar.jar net/sourceforge/zbar/Config.class net/sourceforge/zbar/Modifier.class net/sourceforge/zbar/Orientation.class net/sourceforge/zbar/Symbol.class net/sourceforge/zbar/SymbolIterator.class net/sourceforge/zbar/SymbolSet.class net/sourceforge/zbar/Image.class net/sourceforge/zbar/ImageScanner.class || rm -f zbar.jar
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
  CC       zbarcam/zbarcam_qt-scan_video.o
  CXX      qt/libzbarqt_la-QZBar.lo
  CXX      qt/libzbarqt_la-QZBarThread.lo
  CXX      qt/libzbarqt_la-moc_QZBar.lo
  CXX      qt/libzbarqt_la-moc_QZBarThread.lo
  CXXLD    qt/libzbarqt.la
ar: `u' modifier ignored since `D' is the default (see `U')
  CXXLD    zbarcam/zbarcam-qt
  CC       python/zbar_la-zbarmodule.lo
  CC       python/zbar_la-enum.lo
  CC       python/zbar_la-exception.lo
  CC       python/zbar_la-symbol.lo
  CC       python/zbar_la-symbolset.lo
  CC       python/zbar_la-symboliter.lo
  CC       python/zbar_la-image.lo
  CC       python/zbar_la-processor.lo
  CC       python/zbar_la-imagescanner.lo
  CC       python/zbar_la-decoder.lo
  CC       python/zbar_la-scanner.lo
  CCLD     python/zbar.la
xmlto --searchpath <https://builder.linuxtv.org/job/ZBar/ws/doc> -m <https://builder.linuxtv.org/job/ZBar/ws/doc/style.xsl> --skip-validation  -o doc/man man doc/manual.xml
Note: Writing zbarcam.1
Note: Writing zbarimg.1
make[2]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/'>
make[1]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/'>
+ make check-local
/usr/bin/python3 <https://builder.linuxtv.org/job/ZBar/ws/test/barcodetest.py>
.
----------------------------------------------------------------------
Ran 1 test in 0.471s

OK
  CC       test/test_decode-test_decode.o
  CCLD     test/test_decode
<https://builder.linuxtv.org/job/ZBar/ws/test/test_decode> -q
decoder PASSED.
<https://builder.linuxtv.org/job/ZBar/ws/test/test_examples.sh>
FAILED: <https://builder.linuxtv.org/job/ZBar/ws/examples/qr-code-binary.png> (da39a3ee5e6b4b0d3255bfef95601890afd80709 instead of df896e459e47a7d392031a7d4962722a143e276b)
	cmd: <https://builder.linuxtv.org/job/ZBar/ws/zbarimg/zbarimg> --nodbus --raw --oneshot -Sbinary '<https://builder.linuxtv.org/job/ZBar/ws/examples/qr-code-binary.png'>
	results: make: *** [Makefile:2475: check-images] Error 1
Build step 'Execute shell' marked build as failure
