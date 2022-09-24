Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87F215E8A2F
	for <lists+linux-media@lfdr.de>; Sat, 24 Sep 2022 10:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233438AbiIXIew (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Sep 2022 04:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233336AbiIXIeu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Sep 2022 04:34:50 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E87D1E3DF
        for <linux-media@vger.kernel.org>; Sat, 24 Sep 2022 01:34:47 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oc0cX-009SMW-Jn; Sat, 24 Sep 2022 08:34:45 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oc0cW-00FSZd-1X; Sat, 24 Sep 2022 08:34:43 +0000
Date:   Sat, 24 Sep 2022 08:34:43 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <112332480.0.1664008483405@builder.linuxtv.org>
In-Reply-To: <633663900.0.1653841965143@builder.linuxtv.org>
References: <633663900.0.1653841965143@builder.linuxtv.org>
Subject: Build failed in Jenkins: ZBar #69
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: ZBar
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/ZBar/69/display/redirect>

Changes:


------------------------------------------
[...truncated 14.75 KB...]
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
config.status: creating po/Makefile.in
config.status: creating zbar/Makefile
config.status: creating zbar.pc
config.status: creating zbar-gtk.pc
config.status: creating doc/doxygen.conf
config.status: creating test/test_examples.sh
config.status: creating test/check_dbus.sh
config.status: creating include/config.h
config.status: include/config.h is unchanged
config.status: executing depfiles commands
config.status: executing libtool commands
config.status: executing po-directories commands
config.status: creating po/POTFILES
config.status: creating po/Makefile
config.status: executing doc/version.xml commands
config.status: executing doc/reldate.xml commands

please verify that the detected configuration matches your expectations:
------------------------------------------------------------------------
gettext                yes
X                      --with-x=yes
pthreads               --enable-pthread=yes
doc                    --enable-doc=yes
v4l                    --enable-video=yes
jpeg                   --with-jpeg=yes
Python                 --with-python=python3 	python3.9
GTK                    --with-gtk=gtk3       	Gtk3.24.24
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
/bin/mkdir -p zbarcam
i -Izbarcam -DQT_WIDGETS_LIB -DQT_X11EXTRAS_LIB -DQT_GUI_LIB -DQT_CORE_LIB -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtX11Extras -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtGui -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I/usr/include/x86_64-linux-gnu/qt5 -I./include zbarcam/zbarcam-qt.cpp -o zbarcam/moc_zbarcam_qt.h
/bin/bash: line 1: i: command not found
make: [Makefile:2462: zbarcam/moc_zbarcam_qt.h] Error 127 (ignored)
/bin/mkdir -p qt
Iqt -DQT_WIDGETS_LIB -DQT_X11EXTRAS_LIB -DQT_GUI_LIB -DQT_CORE_LIB -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtX11Extras -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtGui -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I/usr/include/x86_64-linux-gnu/qt5 -I./include include/zbar/QZBar.h -o qt/moc_QZBar.cpp
/bin/bash: line 1: Iqt: command not found
make: [Makefile:2491: qt/moc_QZBar.cpp] Error 127 (ignored)
Iqt -DQT_WIDGETS_LIB -DQT_X11EXTRAS_LIB -DQT_GUI_LIB -DQT_CORE_LIB -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtX11Extras -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtGui -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I/usr/include/x86_64-linux-gnu/qt5 -I./include qt/QZBarThread.h -o qt/moc_QZBarThread.cpp
/bin/bash: line 1: Iqt: command not found
make: [Makefile:2487: qt/moc_QZBarThread.cpp] Error 127 (ignored)
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
  CC       processor/libzbar_la-lock.lo
  CC       libzbar_la-refcnt.lo
  CC       libzbar_la-window.lo
  CC       libzbar_la-video.lo
  CC       libzbar_la-img_scanner.lo
  CC       libzbar_la-scanner.lo
  CC       libzbar_la-decoder.lo
  CC       libzbar_la-misc.lo
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
  CC       libzbar_la-sqcode.lo
  CC       decoder/libzbar_la-sq_finder.lo
  CC       processor/libzbar_la-posix.lo
  CC       video/libzbar_la-v4l.lo
  CC       video/libzbar_la-v4l2.lo
  CC       libzbar_la-jpeg.lo
  CC       processor/libzbar_la-x.lo
  CC       window/libzbar_la-x.lo
  CC       window/libzbar_la-ximage.lo
  CC       window/libzbar_la-xv.lo
  CCLD     libzbar.la
copying selected object files to avoid basename conflicts...
make[2]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/zbar'>
Making all in po
make[2]: Entering directory '<https://builder.linuxtv.org/job/ZBar/ws/po'>
make[2]: Nothing to be done for 'all'.
make[2]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/po'>
Making all in gtk
make[2]: Entering directory '<https://builder.linuxtv.org/job/ZBar/ws/gtk'>
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
make  all-am
make[3]: Entering directory '<https://builder.linuxtv.org/job/ZBar/ws/java'>
  CC       libzbarjni_la-zbarjni.lo
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
/bin/mkdir -p zbarcam
i -Izbarcam -DQT_WIDGETS_LIB -DQT_X11EXTRAS_LIB -DQT_GUI_LIB -DQT_CORE_LIB -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtX11Extras -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtGui -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I/usr/include/x86_64-linux-gnu/qt5 -I./include zbarcam/zbarcam-qt.cpp -o zbarcam/moc_zbarcam_qt.h
/bin/bash: line 1: i: command not found
make[2]: [Makefile:2462: zbarcam/moc_zbarcam_qt.h] Error 127 (ignored)
  CXX      zbarcam/zbarcam_qt-zbarcam-qt.o
  CC       zbarcam/zbarcam_qt-scan_video.o
  CXX      qt/libzbarqt_la-QZBar.lo
  CXX      qt/libzbarqt_la-QZBarThread.lo
/bin/mkdir -p qt
Iqt -DQT_WIDGETS_LIB -DQT_X11EXTRAS_LIB -DQT_GUI_LIB -DQT_CORE_LIB -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtX11Extras -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtGui -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I/usr/include/x86_64-linux-gnu/qt5 -I./include include/zbar/QZBar.h -o qt/moc_QZBar.cpp
/bin/bash: line 1: Iqt: command not found
make[2]: [Makefile:2491: qt/moc_QZBar.cpp] Error 127 (ignored)
  CXX      qt/libzbarqt_la-moc_QZBar.lo
Iqt -DQT_WIDGETS_LIB -DQT_X11EXTRAS_LIB -DQT_GUI_LIB -DQT_CORE_LIB -I/usr/include/x86_64-linux-gnu/qt5/QtWidgets -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtX11Extras -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtGui -I/usr/include/x86_64-linux-gnu/qt5 -I/usr/include/x86_64-linux-gnu/qt5/QtCore -I/usr/include/x86_64-linux-gnu/qt5 -I./include qt/QZBarThread.h -o qt/moc_QZBarThread.cpp
/bin/bash: line 1: Iqt: command not found
make[2]: [Makefile:2487: qt/moc_QZBarThread.cpp] Error 127 (ignored)
  CXX      qt/libzbarqt_la-moc_QZBarThread.lo
  CXXLD    qt/libzbarqt.la
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
make[2]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/'>
make[1]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/'>
+ make check-local
/usr/bin/python3 <https://builder.linuxtv.org/job/ZBar/ws/test/barcodetest.py>
E
======================================================================
ERROR: runTest (__main__.BuiltinTestCase)
<https://builder.linuxtv.org/job/ZBar/ws/examples/ean-13.png>
----------------------------------------------------------------------
Traceback (most recent call last):
  File "<https://builder.linuxtv.org/job/ZBar/ws/test/barcodetest.py",> line 163, in runTest
    actual = run_zbarimg((expect.get('href'),))
  File "<https://builder.linuxtv.org/job/ZBar/ws/test/barcodetest.py",> line 137, in run_zbarimg
    'zbarimg returned error status (%d)\n' % rc + err
TypeError: can only concatenate str (not "bytes") to str

----------------------------------------------------------------------
Ran 1 test in 0.953s

FAILED (errors=1)
make: *** [Makefile:2517: check-images-py] Error 1
Build step 'Execute shell' marked build as failure
