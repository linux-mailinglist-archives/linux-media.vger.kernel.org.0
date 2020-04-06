Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1188C19FC71
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 20:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbgDFSFS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 14:05:18 -0400
Received: from www.linuxtv.org ([130.149.80.248]:55932 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726436AbgDFSFS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Apr 2020 14:05:18 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jLW4r-0093bZ-VY; Mon, 06 Apr 2020 18:02:30 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1jLW9E-0003Ir-LV; Mon, 06 Apr 2020 18:07:00 +0000
Date:   Mon, 6 Apr 2020 18:07:00 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <931641768.5.1586196420658.JavaMail.jenkins@builder.linuxtv.org>
In-Reply-To: <1240941899.4.1586196031390.JavaMail.jenkins@builder.linuxtv.org>
References: <1240941899.4.1586196031390.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: ZBar #16
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

See <https://builder.linuxtv.org/job/ZBar/16/display/redirect>

Changes:


------------------------------------------
[...truncated 8.89 KB...]
checking poll.h presence... yes
checking for poll.h... yes
checking pthread.h usability... yes
checking pthread.h presence... yes
checking for pthread.h... yes
checking for pthread_create in -lpthread... yes
checking linux/videodev.h usability... no
checking linux/videodev.h presence... no
checking for linux/videodev.h... no
checking linux/videodev2.h usability... yes
checking linux/videodev2.h presence... yes
checking for linux/videodev2.h... yes
checking libv4l2.h usability... yes
checking libv4l2.h presence... yes
checking for libv4l2.h... yes
checking for V4L2... yes
checking for X... libraries , headers 
checking for gethostbyname... yes
checking for connect... yes
checking for remove... yes
checking for shmat... yes
checking for IceConnectionNumber in -lICE... yes
checking for X11/extensions/XShm.h... yes
checking for XShmQueryVersion in -lXext... yes
checking for X11/extensions/Xvlib.h... yes
checking for XvQueryExtension in -lXv... yes
checking for DBUS... yes
checking jpeglib.h usability... yes
checking jpeglib.h presence... yes
checking for jpeglib.h... yes
checking jerror.h usability... yes
checking jerror.h presence... yes
checking for jerror.h... yes
checking for jpeg_read_header in -ljpeg... yes
checking for MAGICK... yes
configure: trying ImageMagick version 6.9.10
checking wand/MagickWand.h usability... yes
checking wand/MagickWand.h presence... yes
checking for wand/MagickWand.h... yes
configure: using ImageMagick version 6.9.10
checking for GTK3... yes
configure: using GTK+ version 3.24.5
checking for python3... /usr/bin/python3
checking whether /usr/bin/python3 version is >= 2.7.0... yes
checking for /usr/bin/python3 version... 3.7
checking for /usr/bin/python3 platform... linux
checking for /usr/bin/python3 script directory... ${prefix}/lib/python3.7/site-packages
checking for /usr/bin/python3 extension module directory... ${exec_prefix}/lib/python3.7/site-packages
checking Python.h usability... yes
checking Python.h presence... yes
checking for Python.h... yes
checking for gobject-introspection... yes
checking for QT... yes
checking for moc-qt5... no
checking for moc... moc
configure: using moc from moc
configure: using Qt version 5.11.3
checking for javac... /usr/lib/jvm/java-11-openjdk-amd64/bin/javac
checking for javah... no
checking for jar... /usr/lib/jvm/java-11-openjdk-amd64/bin/jar
checking for java... /usr/lib/jvm/java-11-openjdk-amd64/bin/java
checking jni.h usability... yes
checking jni.h presence... yes
checking for jni.h... yes
checking whether to enable assertions... yes
checking errno.h usability... yes
checking errno.h presence... yes
checking for errno.h... yes
checking fcntl.h usability... yes
checking fcntl.h presence... yes
checking for fcntl.h... yes
checking features.h usability... yes
checking features.h presence... yes
checking for features.h... yes
checking for inttypes.h... (cached) yes
checking float.h usability... yes
checking float.h presence... yes
checking for float.h... yes
checking limits.h usability... yes
checking limits.h presence... yes
checking for limits.h... yes
checking locale.h usability... yes
checking locale.h presence... yes
checking for locale.h... yes
checking stddef.h usability... yes
checking stddef.h presence... yes
checking for stddef.h... yes
checking for stdlib.h... (cached) yes
checking for string.h... (cached) yes
checking for unistd.h... (cached) yes
checking for sys/types.h... (cached) yes
checking for sys/stat.h... (cached) yes
checking sys/ioctl.h usability... yes
checking sys/ioctl.h presence... yes
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
config.status: include/config.h is unchanged
config.status: executing depfiles commands
config.status: executing libtool commands
config.status: executing doc/version.xml commands
config.status: executing doc/reldate.xml commands

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
make  all-recursive
make[1]: Entering directory '<https://builder.linuxtv.org/job/ZBar/ws/'>
Making all in zbar
make[2]: Entering directory '<https://builder.linuxtv.org/job/ZBar/ws/zbar'>
make[2]: Nothing to be done for 'all'.
make[2]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/zbar'>
Making all in gtk
make[2]: Entering directory '<https://builder.linuxtv.org/job/ZBar/ws/gtk'>
make  all-am
make[3]: Entering directory '<https://builder.linuxtv.org/job/ZBar/ws/gtk'>
make[3]: Nothing to be done for 'all-am'.
make[3]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/gtk'>
make[2]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/gtk'>
Making all in java
make[2]: Entering directory '<https://builder.linuxtv.org/job/ZBar/ws/java'>
make  all-am
make[3]: Entering directory '<https://builder.linuxtv.org/job/ZBar/ws/java'>
make[3]: Nothing to be done for 'all-am'.
make[3]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/java'>
make[2]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/java'>
Making all in .
make[2]: Entering directory '<https://builder.linuxtv.org/job/ZBar/ws/'>
make[2]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/'>
make[1]: Leaving directory '<https://builder.linuxtv.org/job/ZBar/ws/'>
+ make check-local
/usr/bin/python3 <https://builder.linuxtv.org/job/ZBar/ws/test/barcodetest.py>
.
----------------------------------------------------------------------
Ran 1 test in 0.028s

OK
<https://builder.linuxtv.org/job/ZBar/ws/test/test_decode> -q
decoder PASSED.
<https://builder.linuxtv.org/job/ZBar/ws/test/test_examples.sh>
zbarimg PASSED.
PYTHONPATH=<https://builder.linuxtv.org/job/ZBar/ws/python/.libs/> \
	/usr/bin/python3 <https://builder.linuxtv.org/job/ZBar/ws/test/test_python.py> \
	'<https://builder.linuxtv.org/job/ZBar/ws/examples/ean-13.png'> '9789876543217'
Traceback (most recent call last):
  File "<https://builder.linuxtv.org/job/ZBar/ws/test/test_python.py",> line 20, in <module>
    import zbar, sys
ImportError: <https://builder.linuxtv.org/job/ZBar/ws/python/.libs/zbar.so>: undefined symbol: PyInt_Type
make: *** [Makefile:2489: check-python] Error 1
Build step 'Execute shell' marked build as failure
