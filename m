Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5D1A693577
	for <lists+linux-media@lfdr.de>; Sun, 12 Feb 2023 01:52:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjBLAwK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 19:52:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjBLAwJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 19:52:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B94E659E
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 16:52:03 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EB5C1BAD;
        Sun, 12 Feb 2023 01:51:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676163109;
        bh=yefB62Q8Bly8VCyZyeGbS2I8/cgyDYhohmewLheDoEA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nz97h/KwCYDbgi1q8M+yrJc6oG4PBV1rAx0LJBgXVbWSfRMbFdPHJnU3Y+Pw+g1FU
         oEoucvhFYDfeQ92o3UwyNLesZqxDXsoYOP2tiZ4EYiDGtFloJxbM8t4ageGNj/kvs3
         iuXna2hu20Pkz8OEVk7aUunsL+ZLX4yFC/IOm4v0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com, deborah.brouwer@collabora.com
Subject: [v4l-utils] [PATCH v8 6/6] Drop autoconf/automake support
Date:   Sun, 12 Feb 2023 02:51:37 +0200
Message-Id: <20230212005137.12025-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212005137.12025-1-laurent.pinchart@ideasonboard.com>
References: <20230212005137.12025-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that meson covers the full build of v4l-utils, drop support for the
autoconf/automake build system. Maintaining both in parallel would only
bring additional burden and would be sure to introduce bugs and other
issues over time.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .gitignore                               |   61 -
 INSTALL                                  |  105 -
 INSTALL.meson.md => INSTALL.md           |    0
 Makefile.am                              |   20 -
 README.md                                |   79 +-
 aminclude.am                             |  186 --
 bootstrap.sh                             |   28 -
 configure.ac                             |  694 -------
 contrib/Makefile.am                      |   25 -
 contrib/cobalt-ctl/.gitignore            |    1 -
 contrib/cobalt-ctl/Makefile.am           |    3 -
 contrib/decode_tm6000/.gitignore         |    1 -
 contrib/decode_tm6000/Makefile.am        |    4 -
 contrib/freebsd/Makefile.am              |    3 -
 contrib/gconv/Makefile.am                |   17 -
 contrib/rds-saa6588/.gitignore           |    1 -
 contrib/rds-saa6588/Makefile.am          |    3 -
 contrib/test/.gitignore                  |   11 -
 contrib/test/Makefile.am                 |   65 -
 contrib/xc3028-firmware/.gitignore       |    1 -
 contrib/xc3028-firmware/Makefile.am      |    5 -
 doxygen_libdvbv5.cfg                     | 2293 ----------------------
 lib/Makefile.am                          |   13 -
 lib/libdvbv5/Makefile.am                 |  126 --
 lib/libdvbv5/libdvbv5.pc.in              |   11 -
 lib/libv4l-mplane/Makefile.am            |    7 -
 lib/libv4l1/Makefile.am                  |   29 -
 lib/libv4l1/libv4l1.pc.in                |   12 -
 lib/libv4l2/Makefile.am                  |   32 -
 lib/libv4l2/libv4l2.pc.in                |   12 -
 lib/libv4l2rds/Makefile.am               |   12 -
 lib/libv4l2rds/libv4l2rds.pc.in          |   11 -
 lib/libv4lconvert/.gitignore             |    3 -
 lib/libv4lconvert/Makefile.am            |   36 -
 lib/libv4lconvert/libv4lconvert.pc.in    |   11 -
 libdvbv5-po/Makevars                     |   72 -
 m4/ac_define_dir.m4                      |   34 -
 m4/ax_prog_doxygen.m4                    |  532 -----
 m4/ax_pthread.m4                         |  522 -----
 m4/mode_t.m4                             |   26 -
 m4/visibility.m4                         |   82 -
 utils/Makefile.am                        |   41 -
 utils/cec-compliance/.gitignore          |    2 -
 utils/cec-compliance/Makefile.am         |    8 -
 utils/cec-ctl/.gitignore                 |    2 -
 utils/cec-ctl/Makefile.am                |    8 -
 utils/cec-follower/.gitignore            |    2 -
 utils/cec-follower/Makefile.am           |    8 -
 utils/cx18-ctl/.gitignore                |    1 -
 utils/cx18-ctl/Makefile.am               |    3 -
 utils/dvb/.gitignore                     |    9 -
 utils/dvb/Makefile.am                    |   35 -
 utils/ir-ctl/.gitignore                  |    2 -
 utils/ir-ctl/Makefile.am                 |    6 -
 utils/ivtv-ctl/.gitignore                |    1 -
 utils/ivtv-ctl/Makefile.am               |    4 -
 utils/keytable/.gitignore                |    3 -
 utils/keytable/Makefile.am               |   36 -
 utils/keytable/bpf_protocols/Makefile.am |   24 -
 utils/libcecutil/.gitignore              |    4 -
 utils/libcecutil/Makefile.am             |   24 -
 utils/libmedia_dev/Makefile.am           |    7 -
 utils/libv4l2util/Makefile.am            |    7 -
 utils/media-ctl/.gitignore               |    3 -
 utils/media-ctl/Makefile.am              |   30 -
 utils/media-ctl/libmediactl.pc.in        |   10 -
 utils/media-ctl/libv4l2subdev.pc.in      |   11 -
 utils/qv4l2/.gitignore                   |    9 -
 utils/qv4l2/Makefile.am                  |   54 -
 utils/qvidcap/.gitignore                 |    6 -
 utils/qvidcap/Makefile.am                |   42 -
 utils/rds-ctl/.gitignore                 |    2 -
 utils/rds-ctl/Makefile.am                |    6 -
 utils/v4l2-compliance/.gitignore         |    3 -
 utils/v4l2-compliance/Makefile.am        |   31 -
 utils/v4l2-ctl/.gitignore                |    4 -
 utils/v4l2-ctl/Makefile.am               |   44 -
 utils/v4l2-dbg/.gitignore                |    1 -
 utils/v4l2-dbg/Makefile.am               |    6 -
 utils/v4l2-sysfs-path/.gitignore         |    1 -
 utils/v4l2-sysfs-path/Makefile.am        |    4 -
 utils/v4l2-tracer/.gitignore             |    7 -
 utils/v4l2-tracer/Makefile.am            |   36 -
 v4l-utils-po/Makevars                    |   72 -
 84 files changed, 11 insertions(+), 5797 deletions(-)
 delete mode 100644 INSTALL
 rename INSTALL.meson.md => INSTALL.md (100%)
 delete mode 100644 Makefile.am
 delete mode 100644 aminclude.am
 delete mode 100755 bootstrap.sh
 delete mode 100644 configure.ac
 delete mode 100644 contrib/Makefile.am
 delete mode 100644 contrib/cobalt-ctl/.gitignore
 delete mode 100644 contrib/cobalt-ctl/Makefile.am
 delete mode 100644 contrib/decode_tm6000/.gitignore
 delete mode 100644 contrib/decode_tm6000/Makefile.am
 delete mode 100644 contrib/freebsd/Makefile.am
 delete mode 100644 contrib/gconv/Makefile.am
 delete mode 100644 contrib/rds-saa6588/.gitignore
 delete mode 100644 contrib/rds-saa6588/Makefile.am
 delete mode 100644 contrib/test/.gitignore
 delete mode 100644 contrib/test/Makefile.am
 delete mode 100644 contrib/xc3028-firmware/.gitignore
 delete mode 100644 contrib/xc3028-firmware/Makefile.am
 delete mode 100644 doxygen_libdvbv5.cfg
 delete mode 100644 lib/Makefile.am
 delete mode 100644 lib/libdvbv5/Makefile.am
 delete mode 100644 lib/libdvbv5/libdvbv5.pc.in
 delete mode 100644 lib/libv4l-mplane/Makefile.am
 delete mode 100644 lib/libv4l1/Makefile.am
 delete mode 100644 lib/libv4l1/libv4l1.pc.in
 delete mode 100644 lib/libv4l2/Makefile.am
 delete mode 100644 lib/libv4l2/libv4l2.pc.in
 delete mode 100644 lib/libv4l2rds/Makefile.am
 delete mode 100644 lib/libv4l2rds/libv4l2rds.pc.in
 delete mode 100644 lib/libv4lconvert/.gitignore
 delete mode 100644 lib/libv4lconvert/Makefile.am
 delete mode 100644 lib/libv4lconvert/libv4lconvert.pc.in
 delete mode 100644 libdvbv5-po/Makevars
 delete mode 100644 m4/ac_define_dir.m4
 delete mode 100644 m4/ax_prog_doxygen.m4
 delete mode 100644 m4/ax_pthread.m4
 delete mode 100644 m4/mode_t.m4
 delete mode 100644 m4/visibility.m4
 delete mode 100644 utils/Makefile.am
 delete mode 100644 utils/cec-compliance/.gitignore
 delete mode 100644 utils/cec-compliance/Makefile.am
 delete mode 100644 utils/cec-ctl/.gitignore
 delete mode 100644 utils/cec-ctl/Makefile.am
 delete mode 100644 utils/cec-follower/.gitignore
 delete mode 100644 utils/cec-follower/Makefile.am
 delete mode 100644 utils/cx18-ctl/.gitignore
 delete mode 100644 utils/cx18-ctl/Makefile.am
 delete mode 100644 utils/dvb/.gitignore
 delete mode 100644 utils/dvb/Makefile.am
 delete mode 100644 utils/ir-ctl/.gitignore
 delete mode 100644 utils/ir-ctl/Makefile.am
 delete mode 100644 utils/ivtv-ctl/.gitignore
 delete mode 100644 utils/ivtv-ctl/Makefile.am
 delete mode 100644 utils/keytable/.gitignore
 delete mode 100644 utils/keytable/Makefile.am
 delete mode 100644 utils/keytable/bpf_protocols/Makefile.am
 delete mode 100644 utils/libcecutil/.gitignore
 delete mode 100644 utils/libcecutil/Makefile.am
 delete mode 100644 utils/libmedia_dev/Makefile.am
 delete mode 100644 utils/libv4l2util/Makefile.am
 delete mode 100644 utils/media-ctl/.gitignore
 delete mode 100644 utils/media-ctl/Makefile.am
 delete mode 100644 utils/media-ctl/libmediactl.pc.in
 delete mode 100644 utils/media-ctl/libv4l2subdev.pc.in
 delete mode 100644 utils/qv4l2/.gitignore
 delete mode 100644 utils/qv4l2/Makefile.am
 delete mode 100644 utils/qvidcap/.gitignore
 delete mode 100644 utils/qvidcap/Makefile.am
 delete mode 100644 utils/rds-ctl/.gitignore
 delete mode 100644 utils/rds-ctl/Makefile.am
 delete mode 100644 utils/v4l2-compliance/.gitignore
 delete mode 100644 utils/v4l2-compliance/Makefile.am
 delete mode 100644 utils/v4l2-ctl/.gitignore
 delete mode 100644 utils/v4l2-ctl/Makefile.am
 delete mode 100644 utils/v4l2-dbg/.gitignore
 delete mode 100644 utils/v4l2-dbg/Makefile.am
 delete mode 100644 utils/v4l2-sysfs-path/.gitignore
 delete mode 100644 utils/v4l2-sysfs-path/Makefile.am
 delete mode 100644 utils/v4l2-tracer/.gitignore
 delete mode 100644 utils/v4l2-tracer/Makefile.am
 delete mode 100644 v4l-utils-po/Makevars

diff --git a/.gitignore b/.gitignore
index 7c900fe5a004..4b3f5f0f2f64 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,64 +1,3 @@
 *~
-*.1
-*.o
-*.lo
-*.la
-*.d
-*.so
-*.so.0
-*.so.1
-*.pc
-*.a
-*.tar.*
-*.spec
-.libs
-.deps
-.dirstamp
-config.h
-config.h.in
-config.log
-config.status
-Makefile
-Makefile.in
-configure
-m4
-aclocal.m4
-autom4te.cache
-build-aux
-libtool
-stamp-h1
-ABOUT-NLS
-lib/include/dvb-frontend.h
-lib/include/libdvbv5/libdvb-version.h
-doxygen-doc/
 patches/
-gettextize
-libdvbv5-po/*.gmo
-libdvbv5-po/POTFILES
-libdvbv5-po/stamp-po
-libdvbv5-po/*.mo
-libdvbv5-po/remove-potcdate.sed
-libdvbv5-po/Makefile.in.in
-libdvbv5-po/Makevars.template
-libdvbv5-po/Rules-quot
-libdvbv5-po/boldquot.sed
-libdvbv5-po/en@boldquot.header
-libdvbv5-po/en@quot.header
-libdvbv5-po/insert-header.sin
-libdvbv5-po/quot.sed
-libdvbv5-po/remove-potcdate.sin
-v4l-utils-po/*.gmo
-v4l-utils-po/POTFILES
-v4l-utils-po/stamp-po
-v4l-utils-po/*.mo
-v4l-utils-po/remove-potcdate.sed
-v4l-utils-po/Makefile.in.in
-v4l-utils-po/Makevars.template
-v4l-utils-po/Rules-quot
-v4l-utils-po/boldquot.sed
-v4l-utils-po/en@boldquot.header
-v4l-utils-po/en@quot.header
-v4l-utils-po/insert-header.sin
-v4l-utils-po/quot.sed
-v4l-utils-po/remove-potcdate.sin
 build/
diff --git a/INSTALL b/INSTALL
deleted file mode 100644
index 099c968c9f5b..000000000000
--- a/INSTALL
+++ /dev/null
@@ -1,105 +0,0 @@
-Requirements:
--------------
-* make and a C and C++ compiler
-* optionally libjpeg v6 or later
-* optionally Qt5 for building qv4l2
-
-Building:
----------
-
-If you checked out the source repository you need to install the autotools
-environment and gettext first.
-
-The autotools/gettext should be updated to the version that are shipped
-on your distro. This can be done by running:
-	$ ./bootstrap.sh
-
-Then you need to configure any any desired options with:
-	$ ./configure
-
-You can get a summary of possible configurations via the --help option.
-If used without arguments, it will set the install prefix to /usr/local/.
-
-After configuration you need to start the build process with:
-	$ make
-
-Installing:
------------
-
-To install it at the prefix configured by ./configure, do, as root:
-	# make install
-
-Note that v4l-utils' "make install" supports DESTDIR for installing into
-a build root for example:
-	# make install DESTDIR=/mnt/sysimage
-
-Cross Compiling:
-----------------
-
-Cross compiling has been tested with the Code Sourcery and Linaro ARM Linux
-toolchain.
-
-To cross compile with the Code Sourcery toolchain run the following commands:
-
-export PATH=/opt/arm-2009q3/bin:$PATH
-export PKG_CONFIG_LIBDIR=/path/to/cross/root/lib
-./configure --host=arm-none-linux-gnueabi --without-jpeg
-make
-
-To cross compile with the Linaro toolchain run the following commands:
-
-export PATH=/opt/gcc-linaro-arm-linux-gnueabihf-2012.09-20120921_linux/bin:$PATH
-export PKG_CONFIG_LIBDIR=/path/to/cross/root/lib
-./configure --host=arm-linux-gnueabihf --without-jpeg
-make
-
-Building static binaries:
--------------------------
-
-There are two options in building static binaries: either fully static or
-dynamically linking to system shared libraries while statically linking
-libraries that are a part of v4l-utils.
-
-In either case, building static binaries requires telling pkg-config the
-static libraries will be needed, and telling configure to disable building
-of shared libraries. This way system libraries will still be linked
-dynamically:
-
-	$ PKG_CONFIG="pkg-config --static" ./configure --disable-shared
-
-Fully static binares can be built by further setting LDFLAGS for the
-configure:
-
-	$ PKG_CONFIG="pkg-config --static" LDFLAGS="--static -static" \
-	  ./configure --disable-shared
-
-Note that this requires static variants of all the libraries needed for
-linking which may not be available in all systems.
-
-Android Cross Compiling and Installing:
-----------------
-
-v4l-utils will only build using the complete AOSP source tree, because of the
-stlport dependency.
-
-List of v4l-utils that supply an Android.mk makefile:
-* utils/v4l2-compliance
-* utils/v4l2-ctl
-* utils/v4l2-dbg
-
-To cross compile an utility you must first configure the shell with Android's
-envsetup.sh to add the mm alias, before running lunch to select your target
-device.
-
-cd /path/to/aosp
-source build/envsetup.sh
-lunch
-cd /path/to/v4l-utils
-cd <utility>
-mm
-
-Output binary will be located in the Android out directory, below the
-target/product/<name>/system/bin/<v4l-utils executable name> path.
-
-The binary executable can be pushed to the target Android device using
-adb push <v4l-utils executable> /system/bin
diff --git a/INSTALL.meson.md b/INSTALL.md
similarity index 100%
rename from INSTALL.meson.md
rename to INSTALL.md
diff --git a/Makefile.am b/Makefile.am
deleted file mode 100644
index 8e924af80312..000000000000
--- a/Makefile.am
+++ /dev/null
@@ -1,20 +0,0 @@
-AUTOMAKE_OPTIONS = foreign
-ACLOCAL_AMFLAGS = -I m4
-AM_MAKEFLAGS = $(word 1, $(subst 1, -w, $(filter 1, $(V))) --no-print-directory)
-
-SUBDIRS = lib
-
-if USE_NLS
-SUBDIRS += v4l-utils-po libdvbv5-po
-endif
-
-if WITH_V4LUTILS
-SUBDIRS += utils contrib
-endif
-
-EXTRA_DIST = android-config.h sync-with-kernel.sh bootstrap.sh \
-	doxygen_libdvbv5.cfg include COPYING.libv4l \
-	COPYING.libdvbv5 README.libv4l README.lib-multi-threading \
-	TODO.libdvbv5 doc/libdvbv5-index.doc
-
-include $(top_srcdir)/aminclude.am
diff --git a/README.md b/README.md
index e1befab71615..16a55762f620 100644
--- a/README.md
+++ b/README.md
@@ -18,9 +18,7 @@ There is also a wiki page for the v4l-utils:
 
 ## Building
 
-Temporarily, both meson and autotools build systems are supported in parallel.
-*NOTE*: Packagers should be aware that autotools support will be dropped soon,
-to be fully replaced by meson.
+v4l-utils uses the meson build system.
 
 A number of packages is required to fully build v4l-utils. The first step is to
 install those packages. The package names are different on each distro.
@@ -29,15 +27,15 @@ On Debian and derivated distributions, you need to install the following
 packages with `apt-get` or `aptitude`:
 
 ```
-debhelper dh-autoreconf doxygen graphviz libasound2-dev libtool libjpeg-dev
-qtbase5-dev qt5-default libqt5opengl5-dev libudev-dev libx11-dev pkg-config
-udev gcc git
+debhelper doxygen gcc git graphviz libasound2-dev libjpeg-dev
+libqt5opengl5-dev libudev-dev libx11-dev meson pkg-config qt5-default
+qtbase5-dev udev
 ```
 
 On Fedora, the package list for a minimal install with `dnf` or `yum` is:
 
 ```
-git libtool gcc gcc-c++ which perl gettext-devel
+gcc gcc-c++ gettext-devel git meson perl which
 ```
 
 (git is only requiried if you're cloning from the main git repository at
@@ -54,18 +52,6 @@ mesa-libGLU-devel
 The v4l2-tracer also needs the json-c library. On Debian: `libjson-c-dev' ; on
 Fedora: `json-c-devel`.
 
-### Meson build
-
-Extra packages required for meson:
-
-```
-# On Debian/Ubuntu
-apt-get install meson ninja-build
-
-# On Fedora
-dnf install meson ninja-build
-```
-
 After downloading and installing the needed packages on your distribution, you
 should run:
 
@@ -80,52 +66,15 @@ And, to install on your system:
 sudo ninja -C build/ install
 ```
 
-### Autotools build
-
-Extra packages required for autotools:
-
-```
-# On Debian/Ubuntu
-apt-get install autotools-dev autoconf-archive make
-
-# On Fedora
-dnf install automake autoconf make
-```
-
-After downloading and installing the needed packages on your distribution, you
-should run:
-
-```
-./bootstrap.sh
-./configure
-make
-```
-
-If `./configure` exit with some errors try:
-
-```
-autoreconf -i --force
-./configure
-```
-
-And, to install on your system:
-
-```
-sudo make install
-```
-
 ### Optional features
 
 Please notice that there's an extra feature to add an extra table to decode
 Japanese DVB tables via iconv. This is meant to be used when the iconv itself
 doesn't come with the *ARIB-STD-B24* and *EN300-468-TAB00* tables.
 
-That requires not only the gconv package, but it also needs to be manually
-enabled running autoconf with `--enable-gconv` option.
-
-In meson, gconv is an auto feature, so it will be auto-enabled in case the
-dependencies are satisfied. However, the gconv feature can be forced to enabled
-by running the following command during configuration step:
+gconv is an auto feature, so it will be auto-enabled in case the dependencies
+are satisfied. However, the gconv feature can be forced to enabled by running
+the following command during configuration step:
 
 ```
 meson configure -Dgconv=enabled build/
@@ -194,15 +143,9 @@ The libv4l is released under the GNU Lesser General Public License.
 This library is meant to be used by digital TV applications that need to talk
 with media hardware.
 
-Full documentation is provided via Doxygen. It can be built, after configuring
-the package with autotools, running:
-
-```
-make doxygen-run
-```
-
-In meson, Doxygen documentation is enabled by the auto feature: `doxygen-doc`.
-If enabled, it will be built within the project.
+Full documentation is provided via Doxygen. Building documentation is enabled
+by the auto feature: `doxygen-doc`. If enabled, it will be built within the
+project.
 
 It is possible to generate documentation in html, man pages and pdf formats.
 
diff --git a/aminclude.am b/aminclude.am
deleted file mode 100644
index 07ed72c312ab..000000000000
--- a/aminclude.am
+++ /dev/null
@@ -1,186 +0,0 @@
-# Copyright (C) 2004 Oren Ben-Kiki
-# This file is distributed under the same terms as the Automake macro files.
-
-# Generate automatic documentation using Doxygen. Goals and variables values
-# are controlled by the various DX_COND_??? conditionals set by autoconf.
-#
-# The provided goals are:
-# doxygen-doc: Generate all doxygen documentation.
-# doxygen-run: Run doxygen, which will generate some of the documentation
-#              (HTML, CHM, CHI, MAN, RTF, XML) but will not do the post
-#              processing required for the rest of it (PS, PDF, and some MAN).
-# doxygen-man: Rename some doxygen generated man pages.
-# doxygen-ps: Generate doxygen PostScript documentation.
-# doxygen-pdf: Generate doxygen PDF documentation.
-#
-# Note that by default these are not integrated into the automake goals. If
-# doxygen is used to generate man pages, you can achieve this integration by
-# setting man3_MANS to the list of man pages generated and then adding the
-# dependency:
-#
-#   $(man3_MANS): doxygen-doc
-#
-# This will cause make to run doxygen and generate all the documentation.
-#
-# The following variable is intended for use in Makefile.am:
-#
-# DX_CLEANFILES = everything to clean.
-#
-# This is usually added to MOSTLYCLEANFILES.
-
-## --------------------------------- ##
-## Format-independent Doxygen rules. ##
-## --------------------------------- ##
-
-if DX_COND_doc
-
-## ------------------------------- ##
-## Rules specific for HTML output. ##
-## ------------------------------- ##
-
-if DX_COND_html
-
-DX_CLEAN_HTML = @DX_DOCDIR@/html
-
-endif DX_COND_html
-
-## ------------------------------ ##
-## Rules specific for CHM output. ##
-## ------------------------------ ##
-
-if DX_COND_chm
-
-DX_CLEAN_CHM = @DX_DOCDIR@/chm
-
-if DX_COND_chi
-
-DX_CLEAN_CHI = @DX_DOCDIR@/@PACKAGE@.chi
-
-endif DX_COND_chi
-
-endif DX_COND_chm
-
-## ------------------------------ ##
-## Rules specific for MAN output. ##
-## ------------------------------ ##
-
-if DX_COND_man
-
-DX_CLEAN_MAN = @DX_DOCDIR@/man
-
-endif DX_COND_man
-
-## ------------------------------ ##
-## Rules specific for RTF output. ##
-## ------------------------------ ##
-
-if DX_COND_rtf
-
-DX_CLEAN_RTF = @DX_DOCDIR@/rtf
-
-endif DX_COND_rtf
-
-## ------------------------------ ##
-## Rules specific for XML output. ##
-## ------------------------------ ##
-
-if DX_COND_xml
-
-DX_CLEAN_XML = @DX_DOCDIR@/xml
-
-endif DX_COND_xml
-
-## ----------------------------- ##
-## Rules specific for PS output. ##
-## ----------------------------- ##
-
-if DX_COND_ps
-
-DX_CLEAN_PS = @DX_DOCDIR@/@PACKAGE@.ps
-
-DX_PS_GOAL = doxygen-ps
-
-doxygen-ps: @DX_DOCDIR@/@PACKAGE@.ps
-
-@DX_DOCDIR@/@PACKAGE@.ps: @DX_DOCDIR@/@PACKAGE@.tag
-	cd @DX_DOCDIR@/latex; \
-	rm -f *.aux *.toc *.idx *.ind *.ilg *.log *.out; \
-	$(DX_LATEX) refman.tex; \
-	$(MAKEINDEX_PATH) refman.idx; \
-	$(DX_LATEX) refman.tex; \
-	countdown=5; \
-	while $(DX_EGREP) 'Rerun (LaTeX|to get cross-references right)' \
-			  refman.log > /dev/null 2>&1 \
-	   && test $$countdown -gt 0; do \
-	    $(DX_LATEX) refman.tex; \
-	    countdown=`expr $$countdown - 1`; \
-	done; \
-	$(DX_DVIPS) -o ../@PACKAGE@.ps refman.dvi
-
-endif DX_COND_ps
-
-## ------------------------------ ##
-## Rules specific for PDF output. ##
-## ------------------------------ ##
-
-if DX_COND_pdf
-
-DX_CLEAN_PDF = @DX_DOCDIR@/@PACKAGE@.pdf
-
-DX_PDF_GOAL = doxygen-pdf
-
-doxygen-pdf: @DX_DOCDIR@/@PACKAGE@.pdf
-
-@DX_DOCDIR@/@PACKAGE@.pdf: @DX_DOCDIR@/@PACKAGE@.tag
-	cd @DX_DOCDIR@/latex; \
-	rm -f *.aux *.toc *.idx *.ind *.ilg *.log *.out; \
-	$(DX_PDFLATEX) refman.tex; \
-	$(DX_MAKEINDEX) refman.idx; \
-	$(DX_PDFLATEX) refman.tex; \
-	countdown=5; \
-	while $(DX_EGREP) 'Rerun (LaTeX|to get cross-references right)' \
-			  refman.log > /dev/null 2>&1 \
-	   && test $$countdown -gt 0; do \
-	    $(DX_PDFLATEX) refman.tex; \
-	    countdown=`expr $$countdown - 1`; \
-	done; \
-	mv refman.pdf ../@PACKAGE@.pdf
-
-endif DX_COND_pdf
-
-## ------------------------------------------------- ##
-## Rules specific for LaTeX (shared for PS and PDF). ##
-## ------------------------------------------------- ##
-
-if DX_COND_latex
-
-DX_CLEAN_LATEX = @DX_DOCDIR@/latex
-
-endif DX_COND_latex
-
-.PHONY: doxygen-run doxygen-doc $(DX_PS_GOAL) $(DX_PDF_GOAL)
-
-.INTERMEDIATE: doxygen-run $(DX_PS_GOAL) $(DX_PDF_GOAL)
-
-doxygen-run: @DX_DOCDIR@/@PACKAGE@.tag
-
-doxygen-doc: doxygen-run $(DX_PS_GOAL) $(DX_PDF_GOAL)
-
-@DX_DOCDIR@/@PACKAGE@.tag: $(DX_CONFIG) $(pkginclude_HEADERS)
-	rm -rf @DX_DOCDIR@
-	$(DX_ENV) $(DX_DOXYGEN) $(srcdir)/$(DX_CONFIG)
-
-DX_CLEANFILES = \
-    @DX_DOCDIR@/@PACKAGE@.tag \
-    -r \
-    $(DX_CLEAN_HTML) \
-    $(DX_CLEAN_CHM) \
-    $(DX_CLEAN_CHI) \
-    $(DX_CLEAN_MAN) \
-    $(DX_CLEAN_RTF) \
-    $(DX_CLEAN_XML) \
-    $(DX_CLEAN_PS) \
-    $(DX_CLEAN_PDF) \
-    $(DX_CLEAN_LATEX)
-
-endif DX_COND_doc
diff --git a/bootstrap.sh b/bootstrap.sh
deleted file mode 100755
index 0ad344c3080d..000000000000
--- a/bootstrap.sh
+++ /dev/null
@@ -1,28 +0,0 @@
-#!/bin/bash
-
-mkdir build-aux/ 2>/dev/null
-touch build-aux/config.rpath libdvbv5-po/Makefile.in.in v4l-utils-po/Makefile.in.in
-autoreconf -vfi
-
-GETTEXTIZE=$(command -v gettextize)
-if [ "GETTEXTIZE" != "" ]; then
-	VER=$(gettextize --version|perl -ne 'print $1 if (m/(\d\.\d.*)/)')
-
-	cp build-aux/config.rpath build-aux/config.rpath.bak
-
-	sed "s,read dummy < /dev/tty,," < $GETTEXTIZE > ./gettextize
-	chmod 755 ./gettextize
-
-	echo "Generating locale v4l-utils-po build files for gettext version $VER"
-	./gettextize --force --copy --no-changelog --po-dir=v4l-utils-po >/dev/null
-
-	echo "Generating locale libdvbv5-po build files for gettext version $VER"
-	./gettextize --force --copy --no-changelog --po-dir=libdvbv5-po >/dev/null
-
-	for i in v4l-utils-po/Makefile.in.in libdvbv5-po/Makefile.in.in; do
-		sed 's,rm -f Makefile,rm -f,' $i >a && mv a $i
-	done
-	sed 's,PACKAGE = @PACKAGE@,PACKAGE = @LIBDVBV5_DOMAIN@,' <libdvbv5-po/Makefile.in.in >a && mv a libdvbv5-po/Makefile.in.in
-
-	mv build-aux/config.rpath.bak build-aux/config.rpath
-fi
diff --git a/configure.ac b/configure.ac
deleted file mode 100644
index 46ddc7a8b404..000000000000
--- a/configure.ac
+++ /dev/null
@@ -1,694 +0,0 @@
-# -*- Autoconf -*-
-
-# Process this file with autoconf to produce a configure script.
-
-AC_PREREQ(2.59)
-AC_INIT([v4l-utils],[1.23.0])
-
-AC_CONFIG_AUX_DIR([build-aux])
-AC_CONFIG_MACRO_DIR([m4])
-AC_CONFIG_SRCDIR([lib/libv4l2/libv4l2.c])
-AC_CONFIG_HEADERS([config.h])
-AC_CONFIG_FILES([Makefile
-	lib/Makefile
-	lib/libv4lconvert/Makefile
-	lib/libv4l2/Makefile
-	lib/libv4l1/Makefile
-	lib/libdvbv5/Makefile
-	lib/libv4l2rds/Makefile
-	lib/libv4l-mplane/Makefile
-
-	utils/Makefile
-	utils/libv4l2util/Makefile
-	utils/libmedia_dev/Makefile
-	utils/dvb/Makefile
-	utils/keytable/Makefile
-	utils/keytable/bpf_protocols/Makefile
-	utils/ir-ctl/Makefile
-	utils/cx18-ctl/Makefile
-	utils/ivtv-ctl/Makefile
-	utils/media-ctl/Makefile
-	utils/v4l2-compliance/Makefile
-	utils/v4l2-ctl/Makefile
-	utils/v4l2-dbg/Makefile
-	utils/v4l2-sysfs-path/Makefile
-	utils/v4l2-tracer/Makefile
-	utils/v4l2-tracer/v4l2-tracer.1
-	utils/qv4l2/Makefile
-	utils/libcecutil/Makefile
-	utils/cec-ctl/Makefile
-	utils/cec-ctl/cec-ctl.1
-	utils/cec-compliance/Makefile
-	utils/cec-compliance/cec-compliance.1
-	utils/cec-follower/Makefile
-	utils/cec-follower/cec-follower.1
-	utils/qvidcap/Makefile
-	utils/rds-ctl/Makefile
-
-	contrib/Makefile
-	contrib/freebsd/Makefile
-	contrib/test/Makefile
-	contrib/gconv/Makefile
-	contrib/cobalt-ctl/Makefile
-	contrib/decode_tm6000/Makefile
-	contrib/xc3028-firmware/Makefile
-	contrib/rds-saa6588/Makefile
-
-	v4l-utils-po/Makefile.in
-	libdvbv5-po/Makefile.in
-
-	v4l-utils.spec
-	lib/libv4lconvert/libv4lconvert.pc
-	lib/libv4l1/libv4l1.pc
-	lib/libv4l2/libv4l2.pc
-	lib/libdvbv5/libdvbv5.pc
-	lib/libv4l2rds/libv4l2rds.pc
-	utils/media-ctl/libmediactl.pc
-	utils/media-ctl/libv4l2subdev.pc
-
-	lib/include/libdvbv5/libdvb-version.h
-
-	utils/qv4l2/qv4l2.1
-	utils/qvidcap/qvidcap.1
-	utils/v4l2-compliance/v4l2-compliance.1
-	utils/v4l2-ctl/v4l2-ctl.1
-	utils/keytable/ir-keytable.1
-	utils/keytable/rc_keymap.5
-	utils/ir-ctl/ir-ctl.1
-	utils/dvb/dvb-fe-tool.1
-	utils/dvb/dvbv5-scan.1
-	utils/dvb/dvb-format-convert.1
-	utils/dvb/dvbv5-zap.1
-])
-
-AC_GNU_SOURCE
-
-AM_INIT_AUTOMAKE([1.9 subdir-objects no-dist-gzip dist-bzip2 -Wno-portability]) # 1.10 is needed for target_LIBTOOLFLAGS
-
-AM_MAINTAINER_MODE
-m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
-
-# Checks for programs.
-AC_PROG_CXX
-AC_PROG_CC_C99
-AC_PROG_INSTALL
-AC_PROG_LIBTOOL
-AC_PROG_MKDIR_P
-AC_PROG_LN_S
-PKG_PROG_PKG_CONFIG
-DX_DOT_FEATURE(ON)
-DX_INIT_DOXYGEN($PACKAGE_NAME, doxygen_libdvbv5.cfg)
-ALL_LINGUAS=""
-m4_ifdef(AM_GNU_GETTEXT_REQUIRE_VERSION,[AM_GNU_GETTEXT_REQUIRE_VERSION([0.19.8])],[AM_GNU_GETTEXT_VERSION([0.19.8])])
-AM_GNU_GETTEXT([external])
-AM_CONDITIONAL([USE_NLS], [test "$USE_NLS" = "yes"])
-
-LIBDVBV5_DOMAIN="libdvbv5"
-AC_DEFINE([LIBDVBV5_DOMAIN], "libdvbv5", [libdvbv5 domain])
-AC_SUBST(LIBDVBV5_DOMAIN)
-
-# Define localedir
-AC_DEFUN([V4L_EXPAND_PREFIX], [
-	$1=$2
-	dnl expanding twice, since from autoconf 2.60 on, $datadir refers to
-	dnl $datarootdir which in turn refers to $prefix
-	$1=`(	test "x$prefix" = xNONE && prefix="$ac_default_prefix"
-		eval tmp_v4l_prefix=\""[$]$1"\"
-		eval echo $tmp_v4l_prefix
-		)`
-])
-
-V4L_EXPAND_PREFIX(v4l_localedir, "$datadir/locale")
-localedir="\$(datadir)/locale"
-
-AC_ARG_WITH(localedir,
-	[  --with-localedir=PATH      Where the locale files are installed ])
-if test "x$with_localedir" != "x"; then
-	v4l_localedir="$with_localedir"
-	localedir="$with_localedir"
-fi
-
-AC_DEFINE_UNQUOTED(LOCALEDIR, "$v4l_localedir", [locale directory])
-AC_SUBST(localedir)
-
-# sync-with-kernel.sh and keytable install could make use of them
-#AC_PROG_GREP
-#AC_PROG_SED
-gl_PROMOTED_TYPE_MODE_T
-gl_VISIBILITY
-
-AC_CHECK_HEADERS([sys/klog.h])
-AC_CHECK_FUNCS([klogctl])
-
-AC_CACHE_CHECK([for ioctl with POSIX signature],
-  [gl_cv_func_ioctl_posix_signature],
-  [AC_COMPILE_IFELSE(
-     [AC_LANG_PROGRAM(
-        [[#include <sys/ioctl.h>]],
-        [[int ioctl (int, int, ...);]])
-     ],
-     [gl_cv_func_ioctl_posix_signature=yes],
-     [gl_cv_func_ioctl_posix_signature=no])
-  ])
-if test "x$gl_cv_func_ioctl_posix_signature" = xyes; then
-  AC_DEFINE([HAVE_POSIX_IOCTL], [1], [Have ioctl with POSIX signature])
-fi
-
-AC_CHECK_FUNCS([__secure_getenv secure_getenv])
-AC_HEADER_MAJOR
-
-# Check host os
-case "$host_os" in
-  *linux*)
-    linux_os="yes"
-    ;;
-  *freebsd*)
-    freebsd_os="yes"
-    ;;
-esac
-
-AM_CONDITIONAL([LINUX_OS], [test x$linux_os = xyes])
-
-# Checks for dependencies
-
-PKG_CHECK_MODULES(X11, [x11], [x11_pkgconfig=yes], [x11_pkgconfig=no])
-AC_SUBST([X11_CFLAGS])
-AC_SUBST([X11_LIBS])
-AM_CONDITIONAL([HAVE_X11], [test x$x11_pkgconfig = xyes])
-
-PKG_CHECK_MODULES([LIBELF], [libelf], [libelf_pkgconfig=yes], [libelf_pkgconfig=no])
-AC_SUBST([LIBELF_CFLAGS])
-AC_SUBST([LIBELF_LIBS])
-if test "x$libelf_pkgconfig" = "xyes"; then
-  AC_CHECK_PROG([CLANG], clang, clang)
-else
-  AC_MSG_WARN(libelf library not available)
-fi
-
-AS_IF([test "x$x11_pkgconfig" = xyes],
-      [PKG_CHECK_MODULES(GL, [gl], [gl_pkgconfig=yes], [gl_pkgconfig=no])], [gl_pkgconfig=no])
-AC_SUBST([GL_CFLAGS])
-AC_SUBST([GL_LIBS])
-AM_CONDITIONAL([HAVE_GL], [test x$gl_pkgconfig = xyes])
-
-AS_IF([test "x$gl_pkgconfig" = xyes],
-      [PKG_CHECK_MODULES(GLU, [glu], [glu_pkgconfig=yes], [glu_pkgconfig=no])], [glu_pkgconfig=no])
-
-AC_SUBST([GLU_CFLAGS])
-AC_SUBST([GLU_LIBS])
-AM_CONDITIONAL([HAVE_GLU], [test x$glu_pkgconfig = xyes])
-
-AC_ARG_WITH([jpeg],
-            AS_HELP_STRING([--without-jpeg], [Do not use jpeg library]),
-            [],
-            [with_jpeg=yes])
-
-AS_IF([test "x$with_jpeg" != xno],
-      [AC_CHECK_HEADER([jpeglib.h],
-                       [AC_CHECK_LIB([jpeg],
-                                     [jpeg_read_header],
-                                     [have_jpeg=yes
-                                      JPEG_LIBS="-ljpeg"
-                                      AC_DEFINE([HAVE_JPEG],[1],[whether we use libjpeg])],
-                                     [have_jpeg=no
-                                      AC_MSG_WARN(cannot find libjpeg (v6 or later required))])],
-                       [have_jpeg=no
-                        AC_MSG_WARN(cannot find libjpeg)])])
-
-AM_CONDITIONAL([HAVE_JPEG], [test x$have_jpeg = xyes])
-
-QT_VERSION="none"
-
-PKG_CHECK_MODULES(QT5, [Qt5Core >= 5.0 Qt5Gui >= 5.0 Qt5Widgets >= 5.0], [qt_pkgconfig=true], [qt_pkgconfig=false])
-PKG_CHECK_MODULES(QT5, [Qt5Core >= 5.4 Qt5Gui >= 5.4 Qt5Widgets >= 5.4], [qt54_pkgconfig=true], [qt54_pkgconfig=false])
-if test "x$qt_pkgconfig" = "xtrue"; then
-   QT_CFLAGS="$QT5_CFLAGS -fPIC"
-   QT_LIBS="$QT5_LIBS"
-   AC_SUBST(QT_CFLAGS)
-   AC_SUBST(QT_LIBS)
-   AC_CHECK_PROGS(MOC, [moc-qt5 moc])
-   AC_CHECK_PROGS(UIC, [uic-qt5 uic])
-   AC_CHECK_PROGS(RCC, [rcc-qt5 rcc])
-   AC_SUBST(MOC)
-   AC_SUBST(UIC)
-   AC_SUBST(RCC)
-   if test "x$qt54_pkgconfig" = "xtrue"; then
-      PKG_CHECK_MODULES(QT5GL, [Qt5OpenGL >= 5.4 gl], [qt_pkgconfig_gl=true], [qt_pkgconfig_gl=false])
-   else
-      PKG_CHECK_MODULES(QT5GL, [Qt5OpenGL >= 5.0 gl], [qt_pkgconfig_gl=true], [qt_pkgconfig_gl=false])
-   fi
-   if test "x$qt_pkgconfig_gl" = "xtrue"; then
-      SAVED_CXXFLAGS="${CXXFLAGS}"
-      CXXFLAGS="${CXXFLAGS} ${QT_CFLAGS} ${QT5GL_CFLAGS}"
-      AC_LANG_PUSH([C++])
-      AC_MSG_CHECKING([for Qt5 Desktop OpenGL])
-      AC_COMPILE_IFELSE([AC_LANG_SOURCE(
-[[
-#define GL_GLEXT_PROTOTYPES
-#define QT_NO_OPENGL_ES_2
-
-#include <QGLWidget>
-#include <QGLShader>
-#include <QGLShaderProgram>
-#include <QGLFunctions>
-
-#ifndef GL_UNSIGNED_INT_8_8_8_8
-#error Missing OpenGL Extensions
-#endif
-]])],
-         [qt_desktop_opengl=yes],
-         [qt_desktop_opengl=no])
-      AC_MSG_RESULT([$qt_desktop_opengl])
-      CXXFLAGS="${SAVED_CXXFLAGS}"
-      AC_LANG_POP
-   fi
-
-   if test "x$qt_desktop_opengl" = "xyes"; then
-      QTGL_CFLAGS="$QT5GL_CFLAGS -fPIC"
-      QTGL_LIBS="$QT5GL_LIBS"
-      AC_SUBST(QTGL_CFLAGS)
-      AC_SUBST(QTGL_LIBS)
-      AC_DEFINE([HAVE_QTGL], [1], [qt has opengl support])
-      if test "x$qt54_pkgconfig" = "xtrue"; then
-        QT_VERSION="v5.4 with QtGL"
-      else
-        QT_VERSION="v5 with QtGL"
-      fi
-   else
-      if test "x$qt54_pkgconfig" = "xtrue"; then
-        QT_VERSION="v5.4"
-      else
-        QT_VERSION="v5"
-      fi
-      AC_MSG_WARN(Qt5 Desktop OpenGL is not available)
-   fi
-else
-   AC_MSG_WARN(Qt5 or higher is not available)
-fi
-
-
-PKG_CHECK_MODULES(ALSA, [alsa], [alsa_pkgconfig=true], [alsa_pkgconfig=false])
-if test "x$alsa_pkgconfig" = "xtrue"; then
-   AC_DEFINE([HAVE_ALSA], [1], [alsa library is present])
-else
-   AC_MSG_WARN(ALSA library not available)
-fi
-
-AC_ARG_WITH([libudev],
-            AS_HELP_STRING([--without-libudev], [Do not use udev library]),
-            [],
-            [with_libudev=yes])
-
-have_libudev=no
-
-AS_IF([test "x$with_libudev" != xno -o "x$enable_libdvbv5" != xno],
-      [PKG_CHECK_MODULES(libudev, libudev, have_libudev=yes, have_libudev=no)
-       AS_IF([test "x$have_libudev" = xyes],
-             [AC_DEFINE([HAVE_LIBUDEV], [], [Use libudev])
-              LIBUDEV_CFLAGS="$libudev_CFLAGS"
-              LIBUDEV_LIBS="$libudev_LIBS"
-              AC_SUBST(LIBUDEV_CFLAGS)
-              AC_SUBST(LIBUDEV_LIBS)],
-             AC_MSG_WARN(udev library not available)
-            )])
-
-AC_SUBST([JPEG_LIBS])
-
-JSONC_VERSION_REQUIRED="0.15";
-PKG_CHECK_MODULES(JSONC, [json-c >= $JSONC_VERSION_REQUIRED], [jsonc_pkgconfig=yes], [jsonc_pkgconfig=no])
-AC_SUBST([JSONC_CFLAGS])
-AC_SUBST([JSONC_LIBS])
-AM_CONDITIONAL([HAVE_JSONC], [test x$jsonc_pkgconfig = xyes])
-if test "x$jsonc_pkgconfig" = "xno"; then
-    AC_MSG_WARN(json-c $JSONC_VERSION_REQUIRED or higher required for v4l2-tracer)
-fi
-
-AC_CHECK_FUNCS([strerrorname_np], AC_DEFINE([HAVE_STRERRORNAME_NP],[1],[glibc has function strerrorname_np]))
-
-# Check for pthread
-
-AS_IF([test x$enable_shared != xno],
-	[AX_PTHREAD([have_pthread=yes
-		    AC_DEFINE([HAVE_PTHREAD],[1],[Define if you have POSIX threads libraries and header files.])],
-		   [have_pthread=no])],
-	[have_pthread=no])
-
-# The dlopen() function is in the C library for *BSD and in
-# libdl on GLIBC-based systems
-
-dl_saved_libs=$LIBS
-  AC_SEARCH_LIBS([dlopen],
-                 [dl],
-                 [test "$ac_cv_search_dlopen" = "none required" || DLOPEN_LIBS=$ac_cv_search_dlopen],
-                 [AC_MSG_WARN([unable to find the dlopen() function])])
-  AC_SUBST([DLOPEN_LIBS])
-LIBS=$dl_saved_libs
-
-AC_CHECK_HEADER([argp.h],,AC_MSG_ERROR(Cannot continue: argp.h not found))
-argp_saved_libs=$LIBS
-  AC_SEARCH_LIBS([argp_parse],
-                 [argp],
-                 [test "$ac_cv_search_argp_parse" = "none required" || ARGP_LIBS=$ac_cv_search_argp_parse],
-                 [AC_MSG_ERROR([unable to find the argp_parse() function])])
-  AC_SUBST([ARGP_LIBS])
-LIBS=$argp_saved_libs
-
-AC_CHECK_FUNCS([fork], AC_DEFINE([HAVE_LIBV4LCONVERT_HELPERS],[1],[whether to use libv4lconvert helpers]))
-AM_CONDITIONAL([HAVE_LIBV4LCONVERT_HELPERS], [test x$ac_cv_func_fork = xyes])
-
-AC_CHECK_HEADER([linux/i2c-dev.h], [linux_i2c_dev=yes], [linux_i2c_dev=no])
-AM_CONDITIONAL([HAVE_LINUX_I2C_DEV], [test x$linux_i2c_dev = xyes])
-
-AM_ICONV
-
-# does this compiler support -m32 ?
-AC_MSG_CHECKING([if gcc accepts -m32])
-safe_CFLAGS=$CFLAGS
-CFLAGS="-m32"
-AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[
-  return 0;
-]])], [
-   AC_MSG_RESULT([yes])
-   have_m32=yes
-], [
-   AC_MSG_RESULT([no])
-   have_m32=no
-])
-CFLAGS=$safe_CFLAGS
-AM_CONDITIONAL([HAVE_M32], [test x$have_m32 = xyes])
-
-# directories
-
-AC_ARG_WITH(libv4l1subdir,
-	AS_HELP_STRING([--with-libv4l1subdir=DIR], [set libv4l1 library subdir (default=libv4l)]),
-	[],
-	[with_libv4l1subdir="libv4l"])
-
-AC_ARG_WITH(libv4l2subdir,
-	AS_HELP_STRING([--with-libv4l2subdir=DIR], [set libv4l2 library subdir (default=libv4l)]),
-   	[],
-	[with_libv4l2subdir="libv4l"])
-
-AC_ARG_WITH(libv4lconvertsubdir,
-	AS_HELP_STRING([--with-libv4lconvertsubdir=DIR], [set libv4lconvert library subdir (default=libv4l)]),
-	[],
-	[with_libv4lconvertsubdir="libv4l"])
-
-AC_ARG_WITH(udevdir,
-	AS_HELP_STRING([--with-udevdir=DIR], [set udev directory]),
-   	[],
-	[with_udevdir=`$PKG_CONFIG --variable=udevdir udev || echo /lib/udev`])
-
-AC_ARG_WITH(systemdsystemunitdir,
-	AS_HELP_STRING([--with-systemdsystemunitdir=DIR], [set systemd system unit directory]),
-	[],
-	[with_systemdsystemunitdir=auto])
-AS_IF([test "x$with_systemdsystemunitdir" = "xyes" -o "x$with_systemdsystemunitdir" = "xauto"],
-      [def_systemdsystemunitdir=$($PKG_CONFIG --variable=systemdsystemunitdir systemd)
-       AS_IF([test "x$def_systemdsystemunitdir" = "x"],
-             [AS_IF([test "x$with_systemdsystemunitdir" = "xyes"],
-                    [AC_MSG_ERROR([systemd support requested but pkg-config unable to query systemd package])])
-              with_systemdsystemunitdir=no],
-             [with_systemdsystemunitdir="$def_systemdsystemunitdir"])])
-AM_CONDITIONAL([HAVE_SYSTEMD], [test "x$with_systemdsystemunitdir" != "xno"])
-
-# Generic check: works with most distributions
-def_gconv_dir=`for i in /lib64 /usr/lib64 /usr/local/lib64 /lib /usr/lib /usr/local/lib; do if @<:@ -d \$i/gconv @:>@; then echo \$i/gconv; break; fi; done`
-
-# Debian/Ubuntu-specific check: should be aligned with the debian package
-AS_IF([test "x${def_gconv_dir}" = "x" ],
-      def_gconv_dir=`for i in mips64el-linux-gnuabi64 mips64el-linux-gnuabin32 mips64-linux-gnuabi64 mips64-linux-gnuabin32 mipsisa64r6el-linux-gnuabi64 mipsisa64r6el-linux-gnuabin32 mipsisa64r6-linux-gnuabi64 mipsisa64r6-linux-gnuabin32 powerpc64-linux-gnu sparc64-linux-gnu x86_64-linux-gnu x86_64-linux-gnux32 alphaev67-linux-gnu arm-linux-gnueabi arm-linux-gnueabihf i686-kfreebsd-gnu i686-linux-gnu mipsel-linux-gnu mipsisa32r6el-linux-gnu mipsisa32r6-linux-gnu mips-linux-gnu powerpc-linux-gnu s390-linux-gnu sparcv9-linux-gnu; do if @<:@ -d /usr/lib/\$i/gconv @:>@; then echo /usr/lib/\$i/gconv; break; fi; done`)
-
-AC_ARG_WITH(gconvdir,
-	AS_HELP_STRING([--with-gconvdir=DIR],
-		       [set system's gconv directory (default is to autodetect)]),
-	[],
-	[with_gconvdir=$def_gconv_dir])
-
-AC_SUBST([libv4l1subdir], [$with_libv4l1subdir])
-AC_SUBST([libv4l2subdir], [$with_libv4l2subdir])
-AC_SUBST([libv4l1privdir], [$libdir/$with_libv4l1subdir])
-AC_SUBST([libv4l2privdir], [$libdir/$with_libv4l2subdir])
-AC_SUBST([libv4l2plugindir], [$libdir/$with_libv4l2subdir/plugins])
-AC_SUBST([libv4lconvertprivdir], [$libdir/$with_libv4lconvertsubdir])
-AC_SUBST([keytablesystemdir], [$with_udevdir/rc_keymaps])
-AC_SUBST([keytableuserdir], [$sysconfdir/rc_keymaps])
-AC_SUBST([udevrulesdir], [$with_udevdir/rules.d])
-AC_SUBST([systemdsystemunitdir], [$with_systemdsystemunitdir/systemd-udevd.service.d/])
-AC_SUBST([pkgconfigdir], [$libdir/pkgconfig])
-AC_SUBST([gconvsysdir], [$with_gconvdir])
-
-AC_DEFINE_UNQUOTED([V4L_UTILS_VERSION], ["$PACKAGE_VERSION"], [v4l-utils version string])
-AC_DEFINE_DIR([LIBV4L1_PRIV_DIR], [libv4l1privdir], [libv4l1 private lib directory])
-AC_DEFINE_DIR([LIBV4L2_PRIV_DIR], [libv4l2privdir], [libv4l2 private lib directory])
-AC_DEFINE_DIR([LIBV4L2_PLUGIN_DIR], [libv4l2plugindir], [libv4l2 plugin directory])
-AC_DEFINE_DIR([LIBV4LCONVERT_PRIV_DIR], [libv4lconvertprivdir], [libv4lconvert private lib directory])
-AC_DEFINE_DIR([IR_KEYTABLE_SYSTEM_DIR], [keytablesystemdir], [ir-keytable preinstalled tables directory])
-AC_DEFINE_DIR([IR_KEYTABLE_USER_DIR], [keytableuserdir], [ir-keytable user defined tables directory])
-
-MAJOR=`echo "$PACKAGE_VERSION" | perl -ne 'print $1 if (m/^(\d+)\.(\d+)\.(\d+)/)'`
-MINOR=`echo "$PACKAGE_VERSION" | perl -ne 'print $2 if (m/^(\d+)\.(\d+)\.(\d+)/)'`
-PATCH=`echo "$PACKAGE_VERSION" | perl -ne 'print $3 if (m/^(\d+)\.(\d+)\.(\d+)/)'`
-
-AC_SUBST(MAJOR)
-AC_SUBST(MINOR)
-AC_SUBST(PATCH)
-AC_SUBST(V4L_UTILS_VERSION)
-
-# options
-
-AC_ARG_ENABLE(libdvbv5,
-  AS_HELP_STRING([--disable-libdvbv5], [disable libdvbv5 compilation]),
-  [case "${enableval}" in
-     yes | no ) ;;
-     *) AC_MSG_ERROR(bad value ${enableval} for --disable-libdvbv5) ;;
-   esac]
-)
-
-AC_ARG_ENABLE(dyn-libv4l,
-  AS_HELP_STRING([--disable-dyn-libv4l], [disable dynamic libv4l support]),
-  [case "${enableval}" in
-     yes | no ) ;;
-     *) AC_MSG_ERROR(bad value ${enableval} for --disable-dyn-libv4l) ;;
-   esac]
-)
-
-AC_ARG_ENABLE(v4l-utils,
-  AS_HELP_STRING([--disable-v4l-utils], [disable v4l-utils compilation]),
-  [case "${enableval}" in
-     yes | no ) ;;
-     *) AC_MSG_ERROR(bad value ${enableval} for --disable-v4l-utils) ;;
-   esac]
-)
-
-AC_ARG_ENABLE(v4l2-compliance-libv4l,
-  AS_HELP_STRING([--disable-v4l2-compliance-libv4l], [disable use of libv4l in v4l2-compliance]),
-  [case "${enableval}" in
-     yes | no ) ;;
-     *) AC_MSG_ERROR(bad value ${enableval} for --disable-v4l2-compliance-libv4l) ;;
-   esac]
-)
-
-AC_ARG_ENABLE(v4l2-compliance-32,
-  AS_HELP_STRING([--enable-v4l2-compliance-32], [enable v4l2-compliance-32 compilation (for debugging purposes only)]),
-  [case "${enableval}" in
-     yes | no ) ;;
-     *) AC_MSG_ERROR(bad value ${enableval} for --enable-v4l2-compliance-32) ;;
-   esac]
-)
-
-AC_ARG_ENABLE(v4l2-tracer,
-  AS_HELP_STRING([--disable-v4l2-tracer], [disable v4l2-tracer compilation]),
-  [case "${enableval}" in
-     yes | no ) ;;
-     *) AC_MSG_ERROR(bad value ${enableval} for --disable-v4l2-tracer) ;;
-   esac]
-)
-
-AC_ARG_ENABLE(v4l2-ctl-libv4l,
-  AS_HELP_STRING([--disable-v4l2-ctl-libv4l], [disable use of libv4l in v4l2-ctl]),
-  [case "${enableval}" in
-     yes | no ) ;;
-     *) AC_MSG_ERROR(bad value ${enableval} for --disable-v4l2-ctl-libv4l) ;;
-   esac]
-)
-
-AC_ARG_ENABLE(v4l2-ctl-stream-to,
-  AS_HELP_STRING([--disable-v4l2-ctl-stream-to], [disable use of --stream-to in v4l2-ctl]),
-  [case "${enableval}" in
-     yes | no ) ;;
-     *) AC_MSG_ERROR(bad value ${enableval} for --disable-v4l2-ctl-stream-to) ;;
-   esac]
-)
-
-AC_ARG_ENABLE(v4l2-ctl-32,
-  AS_HELP_STRING([--enable-v4l2-ctl-32], [enable v4l2-ctl-32 compilation (for debugging purposes only)]),
-  [case "${enableval}" in
-     yes | no ) ;;
-     *) AC_MSG_ERROR(bad value ${enableval} for --enable-v4l2-ctl-32) ;;
-   esac]
-)
-
-AC_ARG_ENABLE(qv4l2,
-  AS_HELP_STRING([--disable-qv4l2], [disable qv4l2 compilation]),
-  [case "${enableval}" in
-     yes | no ) ;;
-     *) AC_MSG_ERROR(bad value ${enableval} for --disable-qv4l2) ;;
-   esac]
-)
-
-AC_ARG_ENABLE(qvidcap,
-  AS_HELP_STRING([--disable-qvidcap], [disable qvidcap compilation]),
-  [case "${enableval}" in
-     yes | no ) ;;
-     *) AC_MSG_ERROR(bad value ${enableval} for --disable-qvidcap) ;;
-   esac]
-)
-
-AC_ARG_ENABLE(gconv,
-  AS_HELP_STRING([--enable-gconv], [enable compilation of gconv modules]),
-  [case "${enableval}" in
-    yes | no ) ;;
-    *) AC_MSG_ERROR(bad value ${enableval} for --enable-gconv) ;;
-   esac]
-)
-
-AC_ARG_ENABLE(bpf,
-  AS_HELP_STRING([--disable-bpf], [disable IR BPF decoders]),
-  [case "${enableval}" in
-    yes | no ) ;;
-    *) AC_MSG_ERROR(bad value ${enableval} for --enable-bpf) ;;
-   esac]
-)
-
-PKG_CHECK_MODULES([SDL2], [sdl2 SDL2_image], [sdl_pc=yes], [sdl_pc=no])
-AM_CONDITIONAL([HAVE_SDL], [test x$sdl_pc = xyes])
-
-# Check if backtrace functions are defined
-AC_SEARCH_LIBS([backtrace], [execinfo], [
-  AC_DEFINE(HAVE_BACKTRACE, [1], [glibc has functions to provide stack backtrace])
-])
-
-AM_CONDITIONAL([WITH_LIBDVBV5],     [test x$enable_libdvbv5  != xno -a x$have_libudev = xyes])
-AM_CONDITIONAL([WITH_DVBV5_REMOTE], [test x$enable_libdvbv5  != xno -a x$have_libudev = xyes -a x$have_pthread = xyes])
-
-AM_CONDITIONAL([WITH_DYN_LIBV4L],   [test x$enable_dyn_libv4l != xno])
-AM_CONDITIONAL([WITH_V4LUTILS],	    [test x$enable_v4l_utils != xno -a x$linux_os = xyes])
-AM_CONDITIONAL([WITH_QV4L2],	    [test x${qt_pkgconfig} = xtrue -a x$enable_qv4l2 != xno])
-AM_CONDITIONAL([WITH_QVIDCAP],	    [test x${qt_desktop_opengl} = xyes -a x$enable_qvidcap != xno])
-AM_CONDITIONAL([WITH_V4L_PLUGINS],  [test x$enable_dyn_libv4l != xno -a x$enable_shared != xno])
-AM_CONDITIONAL([WITH_V4L_WRAPPERS], [test x$enable_dyn_libv4l != xno -a x$enable_shared != xno])
-AM_CONDITIONAL([WITH_QTGL],	    [test x${qt_desktop_opengl} = xyes])
-AM_CONDITIONAL([WITH_GCONV],        [test x$enable_gconv = xyes -a x$enable_shared = xyes -a x$with_gconvdir != x -a -f $with_gconvdir/gconv-modules])
-AM_CONDITIONAL([WITH_V4L2_CTL_LIBV4L], [test x${enable_v4l2_ctl_libv4l} != xno])
-AM_CONDITIONAL([WITH_V4L2_CTL_STREAM_TO], [test x${enable_v4l2_ctl_stream_to} != xno])
-AM_CONDITIONAL([WITH_V4L2_CTL_32], [test x${enable_v4l2_ctl_32} = xyes])
-AM_CONDITIONAL([WITH_V4L2_COMPLIANCE], [test x$ac_cv_func_fork = xyes])
-AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_LIBV4L], [test x$ac_cv_func_fork = xyes -a x${enable_v4l2_compliance_libv4l} != xno])
-AM_CONDITIONAL([WITH_V4L2_COMPLIANCE_32], [test x$ac_cv_func_fork = xyes -a x${enable_v4l2_compliance_32} = xyes])
-AM_CONDITIONAL([WITH_V4L2_TRACER], [test x$jsonc_pkgconfig = xyes -a x$enable_v4l2_tracer != xno])
-PKG_CHECK_MODULES([LIBBPF], [libbpf >= 0.7], [bpf_pc=yes], [bpf_pc=no])
-AM_CONDITIONAL([WITH_BPF],          [test x$enable_bpf != xno -a x$libelf_pkgconfig = xyes -a x$CLANG = xclang -a x$bpf_pc = xyes])
-
-# append -static to libtool compile and link command to enforce static libs
-AS_IF([test x$enable_libdvbv5 = xno], [AC_SUBST([ENFORCE_LIBDVBV5_STATIC], ["-static"])])
-AS_IF([test x$enable_libv4l = xno],   [AC_SUBST([ENFORCE_LIBV4L_STATIC],   ["-static"])])
-
-# Since systemd v239, udevd is not allowed to execute BPF systems calls;
-# add an override to allow bpf(2) in that case. On earlier versions, the
-# override will restrict udevd to bpf syscall only and will stop the system
-# from booting. This is also true on current debian versions.
-AM_CONDITIONAL([HAVE_UDEVDSYSCALLFILTER], [grep -s SystemCallFilter $with_systemdsystemunitdir/systemd-udevd.service])
-
-# misc
-
-if test "x$linux_os" = "xyes"; then
-  CPPFLAGS="-I\$(top_srcdir)/include $CPPFLAGS"
-elif test "x$freebsd_os" = "xyes"; then
-  CPPFLAGS="-I\$(top_srcdir)/contrib/freebsd/include $CPPFLAGS"
-fi
-
-CPPFLAGS="-I\$(top_srcdir)/lib/include -Wall -Wpointer-arith -D_GNU_SOURCE $CPPFLAGS"
-
-# Obtain git SHA of HEAD
-AC_SUBST(GIT_SHA, ["-DGIT_SHA=\$(shell if test -e \$(top_srcdir)/.git ; then git -C \$(top_srcdir) rev-parse --short=12 HEAD ; fi)"])
-
-# Obtain git commit count of HEAD
-AC_SUBST(GIT_COMMIT_CNT, ["-DGIT_COMMIT_CNT=\$(shell if test -e \$(top_srcdir)/.git ; then printf '-'; git -C \$(top_srcdir) rev-list --count HEAD ; fi)"])
-
-# Obtain git commit date of HEAD
-AC_SUBST(GIT_COMMIT_DATE, ["-DGIT_COMMIT_DATE=\$(shell if test -e \$(top_srcdir)/.git ; then TZ=UTC git -C \$(top_srcdir) show --quiet --date='format-local:\"%F %T\"' --format='%cd'; fi)"])
-
-AM_COND_IF([WITH_LIBDVBV5], [USE_LIBDVBV5="yes"], [USE_LIBDVBV5="no"])
-AM_COND_IF([WITH_DVBV5_REMOTE], [USE_DVBV5_REMOTE="yes"
-				 AC_DEFINE([HAVE_DVBV5_REMOTE], [1], [Usage of DVBv5 remote enabled])],
-			        [USE_DVBV5_REMOTE="no"])
-AM_COND_IF([WITH_DYN_LIBV4L], [USE_DYN_LIBV4L="yes"], [USE_DYN_LIBV4L="no"])
-AM_COND_IF([WITH_V4LUTILS], [USE_V4LUTILS="yes"], [USE_V4LUTILS="no"])
-AM_COND_IF([WITH_QV4L2], [USE_QV4L2="yes"], [USE_QV4L2="no"])
-AM_COND_IF([WITH_QVIDCAP], [USE_QVIDCAP="yes"], [USE_QVIDCAP="no"])
-AM_COND_IF([WITH_V4L_PLUGINS], [USE_V4L_PLUGINS="yes"
-				AC_DEFINE([HAVE_V4L_PLUGINS], [1], [V4L plugin support enabled])],
-				[USE_V4L_PLUGINS="no"])
-AM_COND_IF([WITH_V4L_WRAPPERS], [USE_V4L_WRAPPERS="yes"], [USE_V4L_WRAPPERS="no"])
-AM_COND_IF([WITH_GCONV], [USE_GCONV="yes"], [USE_GCONV="no"])
-AM_COND_IF([WITH_V4L2_CTL_LIBV4L], [USE_V4L2_CTL_LIBV4L="yes"], [USE_V4L2_CTL_LIBV4L="no"])
-AM_COND_IF([WITH_V4L2_CTL_32], [USE_V4L2_CTL_32="yes"], [USE_V4L2_CTL_32="no"])
-AM_COND_IF([WITH_V4L2_COMPLIANCE], [USE_V4L2_COMPLIANCE="yes"], [USE_V4L2_COMPLIANCE="no"])
-AM_COND_IF([WITH_V4L2_COMPLIANCE_LIBV4L], [USE_V4L2_COMPLIANCE_LIBV4L="yes"], [USE_V4L2_COMPLIANCE_LIBV4L="no"])
-AM_COND_IF([WITH_V4L2_COMPLIANCE_32], [USE_V4L2_COMPLIANCE_32="yes"], [USE_V4L2_COMPLIANCE_32="no"])
-AM_COND_IF([WITH_V4L2_TRACER], [USE_V4L2_TRACER="yes"], [USE_V4L2_TRACER="no"])
-AM_COND_IF([WITH_BPF],         [USE_BPF="yes"
-                                AC_DEFINE([HAVE_BPF], [1], [BPF IR decoder support enabled])],
-				[USE_BPF="no"])
-AS_IF([test "x$alsa_pkgconfig" = "xtrue"], [USE_ALSA="yes"], [USE_ALSA="no"])
-
-AC_OUTPUT
-
-if test x$enable_gconv = xyes -a x$USE_GCONV = xno; then
-	echo
-	echo "Failed to enable gconv. Disabling it"
-fi
-
-dnl ---------------------------------------------------------------------
-dnl compile time options summary
-
-cat <<EOF
-
-compile time options summary
-============================
-
-    Host OS                    : $host_os
-    X11                        : $x11_pkgconfig
-    GL                         : $gl_pkgconfig
-    glu                        : $glu_pkgconfig
-    libelf		       : $libelf_pkgconfig
-    libjpeg                    : $have_jpeg
-    libudev                    : $have_libudev
-    pthread                    : $have_pthread
-    QT version                 : $QT_VERSION
-    ALSA support               : $USE_ALSA
-    SDL support		       : $sdl_pc
-    JSON-C                     : $jsonc_pkgconfig >= $JSONC_VERSION_REQUIRED
-
-    build dynamic libs         : $enable_shared
-    build static libs          : $enable_static
-
-    gconv                      : $USE_GCONV
-
-    dynamic libv4l             : $USE_DYN_LIBV4L
-    v4l_plugins                : $USE_V4L_PLUGINS
-    v4l_wrappers               : $USE_V4L_WRAPPERS
-    libdvbv5                   : $USE_LIBDVBV5
-    dvbv5-daemon               : $USE_DVBV5_REMOTE
-    v4lutils                   : $USE_V4LUTILS
-    qv4l2                      : $USE_QV4L2
-    qvidcap                    : $USE_QVIDCAP
-    v4l2-ctl uses libv4l       : $USE_V4L2_CTL_LIBV4L
-    v4l2-ctl-32                : $USE_V4L2_CTL_32
-    v4l2-compliance            : $USE_V4L2_COMPLIANCE
-    v4l2-compliance uses libv4l: $USE_V4L2_COMPLIANCE_LIBV4L
-    v4l2-compliance-32         : $USE_V4L2_COMPLIANCE_32
-    v4l2-tracer                : $USE_V4L2_TRACER
-    BPF IR Decoders:           : $USE_BPF
-EOF
diff --git a/contrib/Makefile.am b/contrib/Makefile.am
deleted file mode 100644
index b418b5186cf4..000000000000
--- a/contrib/Makefile.am
+++ /dev/null
@@ -1,25 +0,0 @@
-if LINUX_OS
-SUBDIRS = test xc3028-firmware
-
-if HAVE_LINUX_I2C_DEV
-SUBDIRS += \
-	rds-saa6588
-endif
-
-else
-SUBDIRS = freebsd
-endif
-
-if WITH_GCONV
-SUBDIRS += gconv
-endif
-
-SUBDIRS += decode_tm6000
-
-
-EXTRA_DIST = \
-	cobalt-ctl \
-	parsers \
-	pci_traffic \
-	v4l_rec.pl \
-	lircd2toml.py
diff --git a/contrib/cobalt-ctl/.gitignore b/contrib/cobalt-ctl/.gitignore
deleted file mode 100644
index 8493b21071a7..000000000000
--- a/contrib/cobalt-ctl/.gitignore
+++ /dev/null
@@ -1 +0,0 @@
-cobalt-ctl
diff --git a/contrib/cobalt-ctl/Makefile.am b/contrib/cobalt-ctl/Makefile.am
deleted file mode 100644
index 2cc69000b9f7..000000000000
--- a/contrib/cobalt-ctl/Makefile.am
+++ /dev/null
@@ -1,3 +0,0 @@
-bin_PROGRAMS = cobalt-ctl
-
-cobalt_ctl_SOURCES = cobalt-ctl.c s-record.c
diff --git a/contrib/decode_tm6000/.gitignore b/contrib/decode_tm6000/.gitignore
deleted file mode 100644
index 7c8811132fe1..000000000000
--- a/contrib/decode_tm6000/.gitignore
+++ /dev/null
@@ -1 +0,0 @@
-decode_tm6000
diff --git a/contrib/decode_tm6000/Makefile.am b/contrib/decode_tm6000/Makefile.am
deleted file mode 100644
index 863933cc0349..000000000000
--- a/contrib/decode_tm6000/Makefile.am
+++ /dev/null
@@ -1,4 +0,0 @@
-bin_PROGRAMS = decode_tm6000
-decode_tm6000_SOURCES = decode_tm6000.c
-decode_tm6000_LDADD = ../../utils/libv4l2util/libv4l2util.la
-decode_tm6000_LDFLAGS = $(ARGP_LIBS)
diff --git a/contrib/freebsd/Makefile.am b/contrib/freebsd/Makefile.am
deleted file mode 100644
index abf0d57bdaed..000000000000
--- a/contrib/freebsd/Makefile.am
+++ /dev/null
@@ -1,3 +0,0 @@
-EXTRA_DIST = \
-	include \
-	patches
diff --git a/contrib/gconv/Makefile.am b/contrib/gconv/Makefile.am
deleted file mode 100644
index 68b5bd5f049b..000000000000
--- a/contrib/gconv/Makefile.am
+++ /dev/null
@@ -1,17 +0,0 @@
-gconvdir = $(libdir)/gconv
-gconv_LTLIBRARIES = ARIB-STD-B24.la EN300-468-TAB00.la
-gconv_DATA = gconv-modules
-
-gconv_ldflags = -module -shared -avoid-version -no-install --version-script=gconv.map
-
-gconv_base_sources = iconv/skeleton.c iconv/loop.c
-
-arib-std-b24.c, en300-468-tab00.c: $(gconv_base_sources)
-
-ARIB_STD_B24_la_SOURCES = arib-std-b24.c jis0201.h jis0208.h jisx0213.h
-ARIB_STD_B24_la_LDFLAGS = $(gconv_ldflags) -L@gconvsysdir@ -R@gconvsysdir@ -lJIS -lJISX0213
-
-EN300_468_TAB00_la_SOURCES = en300-468-tab00.c
-EN300_468_TAB00_la_LDFLAGS = $(gconv_ldflags)
-
-EXTRA_DIST = $(gconv_base_sources) $(gconv_DATA) gconv.map
diff --git a/contrib/rds-saa6588/.gitignore b/contrib/rds-saa6588/.gitignore
deleted file mode 100644
index 101db6e9e16e..000000000000
--- a/contrib/rds-saa6588/.gitignore
+++ /dev/null
@@ -1 +0,0 @@
-rds-saa6588
diff --git a/contrib/rds-saa6588/Makefile.am b/contrib/rds-saa6588/Makefile.am
deleted file mode 100644
index a551d9fba883..000000000000
--- a/contrib/rds-saa6588/Makefile.am
+++ /dev/null
@@ -1,3 +0,0 @@
-noinst_PROGRAMS = rds-saa6588
-
-rds_saa6588_SOURCES = rds-saa6588.c
diff --git a/contrib/test/.gitignore b/contrib/test/.gitignore
deleted file mode 100644
index 5bd81d01b81e..000000000000
--- a/contrib/test/.gitignore
+++ /dev/null
@@ -1,11 +0,0 @@
-capture-example
-driver-test
-ioctl-test
-pixfmt-test
-sliced-vbi-detect
-sliced-vbi-test
-stress-buffer
-v4l2gl
-v4l2grab
-mc_nextgen_test
-sdlcam
diff --git a/contrib/test/Makefile.am b/contrib/test/Makefile.am
deleted file mode 100644
index 5771ee4d5292..000000000000
--- a/contrib/test/Makefile.am
+++ /dev/null
@@ -1,65 +0,0 @@
-noinst_PROGRAMS = \
-	ioctl-test		\
-	sliced-vbi-test		\
-	sliced-vbi-detect	\
-	v4l2grab		\
-	driver-test		\
-	mc_nextgen_test		\
-	stress-buffer		\
-	capture-example
-
-if HAVE_X11
-noinst_PROGRAMS += pixfmt-test
-endif
-
-if HAVE_GLU
-noinst_PROGRAMS += v4l2gl
-endif
-
-if HAVE_SDL
-if HAVE_JPEG
-noinst_PROGRAMS += sdlcam
-endif
-endif
-
-driver_test_SOURCES = driver-test.c
-driver_test_LDADD = ../../utils/libv4l2util/libv4l2util.la
-
-pixfmt_test_SOURCES = pixfmt-test.c
-pixfmt_test_CFLAGS = $(X11_CFLAGS)
-pixfmt_test_LDFLAGS = $(X11_LIBS)
-
-v4l2grab_SOURCES = v4l2grab.c
-v4l2grab_LDFLAGS = $(ARGP_LIBS)
-v4l2grab_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la -lpthread
-
-v4l2gl_SOURCES = v4l2gl.c
-v4l2gl_LDFLAGS = $(X11_LIBS) $(GL_LIBS) $(GLU_LIBS) $(ARGP_LIBS)
-v4l2gl_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la
-
-sdlcam_LDFLAGS = $(JPEG_LIBS) $(SDL2_LIBS) -lm -ldl -lrt
-sdlcam_CFLAGS = -I../.. $(SDL2_CFLAGS)
-sdlcam_LDADD = ../../lib/libv4l2/libv4l2.la  ../../lib/libv4lconvert/libv4lconvert.la
-
-mc_nextgen_test_CFLAGS = $(LIBUDEV_CFLAGS)
-mc_nextgen_test_LDFLAGS = $(ARGP_LIBS) $(LIBUDEV_LIBS)
-
-
-ioctl_test_SOURCES = ioctl-test.c ioctl-test.h ioctl_32.h ioctl_64.h
-
-sliced_vbi_test_SOURCES = sliced-vbi-test.c
-
-sliced_vbi_detect_SOURCES = sliced-vbi-detect.c
-
-stress_buffer_SOURCES = stress-buffer.c
-
-capture_example_SOURCES = capture-example.c
-
-ioctl-test.c: ioctl-test.h
-
-EXTRA_DIST = \
-	gen_ioctl_list.pl \
-	test-media \
-	test-media-unload.pl \
-	vim2m_test_with_gstreamer.sh \
-	vim2m_test_with_qvidcap.sh
diff --git a/contrib/xc3028-firmware/.gitignore b/contrib/xc3028-firmware/.gitignore
deleted file mode 100644
index e9c07c4f969c..000000000000
--- a/contrib/xc3028-firmware/.gitignore
+++ /dev/null
@@ -1 +0,0 @@
-firmware-tool
diff --git a/contrib/xc3028-firmware/Makefile.am b/contrib/xc3028-firmware/Makefile.am
deleted file mode 100644
index 8b23d1e1cf58..000000000000
--- a/contrib/xc3028-firmware/Makefile.am
+++ /dev/null
@@ -1,5 +0,0 @@
-noinst_PROGRAMS = firmware-tool
-
-firmware_tool_SOURCES = firmware-tool.c standards.c extract_head.h standards.h tuner-xc2028-types.h
-
-EXTRA_DIST = README
diff --git a/doxygen_libdvbv5.cfg b/doxygen_libdvbv5.cfg
deleted file mode 100644
index fba16c4aaa39..000000000000
--- a/doxygen_libdvbv5.cfg
+++ /dev/null
@@ -1,2293 +0,0 @@
-# Doxyfile 1.8.6
-
-# This file describes the settings to be used by the documentation system
-# doxygen (www.doxygen.org) for a project.
-#
-# All text after a double hash (##) is considered a comment and is placed in
-# front of the TAG it is preceding.
-#
-# All text after a single hash (#) is considered a comment and will be ignored.
-# The format is:
-# TAG = value [value, ...]
-# For lists, items can also be appended using:
-# TAG += value [value, ...]
-# Values that contain spaces should be placed between quotes (\" \").
-
-#---------------------------------------------------------------------------
-# Project related configuration options
-#---------------------------------------------------------------------------
-
-# This tag specifies the encoding used for all characters in the config file
-# that follow. The default is UTF-8 which is also the encoding used for all text
-# before the first occurrence of this tag. Doxygen uses libiconv (or the iconv
-# built into libc) for the transcoding. See http://www.gnu.org/software/libiconv
-# for the list of possible encodings.
-# The default value is: UTF-8.
-
-DOXYFILE_ENCODING      = UTF-8
-
-# The PROJECT_NAME tag is a single word (or a sequence of words surrounded by
-# double-quotes, unless you are using Doxywizard) that should identify the
-# project for which the documentation is generated. This name is used in the
-# title of most generated pages and in a few other places.
-# The default value is: My Project.
-
-PROJECT_NAME           = libdvbv5
-
-# The PROJECT_NUMBER tag can be used to enter a project or revision number. This
-# could be handy for archiving the generated documentation or if some version
-# control system is used.
-
-PROJECT_NUMBER         = $(VERSION)
-
-# Using the PROJECT_BRIEF tag one can provide an optional one line description
-# for a project that appears at the top of each page and should give viewer a
-# quick idea about the purpose of the project. Keep the description short.
-
-PROJECT_BRIEF          = "Library to work with Digital TV devices on Linux"
-
-# With the PROJECT_LOGO tag one can specify an logo or icon that is included in
-# the documentation. The maximum height of the logo should not exceed 55 pixels
-# and the maximum width should not exceed 200 pixels. Doxygen will copy the logo
-# to the output directory.
-
-PROJECT_LOGO           =
-
-# The OUTPUT_DIRECTORY tag is used to specify the (relative or absolute) path
-# into which the generated documentation will be written. If a relative path is
-# entered, it will be relative to the location where doxygen was started. If
-# left blank the current directory will be used.
-
-OUTPUT_DIRECTORY       = $(DOCDIR)
-
-# If the CREATE_SUBDIRS tag is set to YES, then doxygen will create 4096 sub-
-# directories (in 2 levels) under the output directory of each output format and
-# will distribute the generated files over these directories. Enabling this
-# option can be useful when feeding doxygen a huge amount of source files, where
-# putting all generated files in the same directory would otherwise causes
-# performance problems for the file system.
-# The default value is: NO.
-
-CREATE_SUBDIRS         = NO
-
-# The OUTPUT_LANGUAGE tag is used to specify the language in which all
-# documentation generated by doxygen is written. Doxygen will use this
-# information to generate all constant output in the proper language.
-# Possible values are: Afrikaans, Arabic, Armenian, Brazilian, Catalan, Chinese,
-# Chinese-Traditional, Croatian, Czech, Danish, Dutch, English (United States),
-# Esperanto, Farsi (Persian), Finnish, French, German, Greek, Hungarian,
-# Indonesian, Italian, Japanese, Japanese-en (Japanese with English messages),
-# Korean, Korean-en (Korean with English messages), Latvian, Lithuanian,
-# Macedonian, Norwegian, Persian (Farsi), Polish, Portuguese, Romanian, Russian,
-# Serbian, Serbian-Cyrillic, Slovak, Slovene, Spanish, Swedish, Turkish,
-# Ukrainian and Vietnamese.
-# The default value is: English.
-
-OUTPUT_LANGUAGE        = English
-
-# If the BRIEF_MEMBER_DESC tag is set to YES doxygen will include brief member
-# descriptions after the members that are listed in the file and class
-# documentation (similar to Javadoc). Set to NO to disable this.
-# The default value is: YES.
-
-BRIEF_MEMBER_DESC      = YES
-
-# If the REPEAT_BRIEF tag is set to YES doxygen will prepend the brief
-# description of a member or function before the detailed description
-#
-# Note: If both HIDE_UNDOC_MEMBERS and BRIEF_MEMBER_DESC are set to NO, the
-# brief descriptions will be completely suppressed.
-# The default value is: YES.
-
-REPEAT_BRIEF           = YES
-
-# This tag implements a quasi-intelligent brief description abbreviator that is
-# used to form the text in various listings. Each string in this list, if found
-# as the leading text of the brief description, will be stripped from the text
-# and the result, after processing the whole list, is used as the annotated
-# text. Otherwise, the brief description is used as-is. If left blank, the
-# following values are used ($name is automatically replaced with the name of
-# the entity):The $name class, The $name widget, The $name file, is, provides,
-# specifies, contains, represents, a, an and the.
-
-ABBREVIATE_BRIEF       =
-
-# If the ALWAYS_DETAILED_SEC and REPEAT_BRIEF tags are both set to YES then
-# doxygen will generate a detailed section even if there is only a brief
-# description.
-# The default value is: NO.
-
-ALWAYS_DETAILED_SEC    = NO
-
-# If the INLINE_INHERITED_MEMB tag is set to YES, doxygen will show all
-# inherited members of a class in the documentation of that class as if those
-# members were ordinary class members. Constructors, destructors and assignment
-# operators of the base classes will not be shown.
-# The default value is: NO.
-
-INLINE_INHERITED_MEMB  = YES
-
-# If the FULL_PATH_NAMES tag is set to YES doxygen will prepend the full path
-# before files name in the file list and in the header files. If set to NO the
-# shortest path that makes the file name unique will be used
-# The default value is: YES.
-
-FULL_PATH_NAMES        = YES
-
-# The STRIP_FROM_PATH tag can be used to strip a user-defined part of the path.
-# Stripping is only done if one of the specified strings matches the left-hand
-# part of the path. The tag can be used to show relative paths in the file list.
-# If left blank the directory from which doxygen is run is used as the path to
-# strip.
-#
-# Note that you can specify absolute paths here, but also relative paths, which
-# will be relative from the directory where doxygen is started.
-# This tag requires that the tag FULL_PATH_NAMES is set to YES.
-
-STRIP_FROM_PATH        = $(SRCDIR)
-
-# The STRIP_FROM_INC_PATH tag can be used to strip a user-defined part of the
-# path mentioned in the documentation of a class, which tells the reader which
-# header file to include in order to use a class. If left blank only the name of
-# the header file containing the class definition is used. Otherwise one should
-# specify the list of include paths that are normally passed to the compiler
-# using the -I flag.
-
-STRIP_FROM_INC_PATH    =
-
-# If the SHORT_NAMES tag is set to YES, doxygen will generate much shorter (but
-# less readable) file names. This can be useful is your file systems doesn't
-# support long names like on DOS, Mac, or CD-ROM.
-# The default value is: NO.
-
-SHORT_NAMES            = NO
-
-# If the JAVADOC_AUTOBRIEF tag is set to YES then doxygen will interpret the
-# first line (until the first dot) of a Javadoc-style comment as the brief
-# description. If set to NO, the Javadoc-style will behave just like regular Qt-
-# style comments (thus requiring an explicit @brief command for a brief
-# description.)
-# The default value is: NO.
-
-JAVADOC_AUTOBRIEF      = YES
-
-# If the QT_AUTOBRIEF tag is set to YES then doxygen will interpret the first
-# line (until the first dot) of a Qt-style comment as the brief description. If
-# set to NO, the Qt-style will behave just like regular Qt-style comments (thus
-# requiring an explicit \brief command for a brief description.)
-# The default value is: NO.
-
-QT_AUTOBRIEF           = NO
-
-# The MULTILINE_CPP_IS_BRIEF tag can be set to YES to make doxygen treat a
-# multi-line C++ special comment block (i.e. a block of //! or /// comments) as
-# a brief description. This used to be the default behavior. The new default is
-# to treat a multi-line C++ comment block as a detailed description. Set this
-# tag to YES if you prefer the old behavior instead.
-#
-# Note that setting this tag to YES also means that rational rose comments are
-# not recognized any more.
-# The default value is: NO.
-
-MULTILINE_CPP_IS_BRIEF = NO
-
-# If the INHERIT_DOCS tag is set to YES then an undocumented member inherits the
-# documentation from any documented member that it re-implements.
-# The default value is: YES.
-
-INHERIT_DOCS           = YES
-
-# If the SEPARATE_MEMBER_PAGES tag is set to YES, then doxygen will produce a
-# new page for each member. If set to NO, the documentation of a member will be
-# part of the file/class/namespace that contains it.
-# The default value is: NO.
-
-SEPARATE_MEMBER_PAGES  = NO
-
-# The TAB_SIZE tag can be used to set the number of spaces in a tab. Doxygen
-# uses this value to replace tabs by spaces in code fragments.
-# Minimum value: 1, maximum value: 16, default value: 4.
-
-TAB_SIZE               = 8
-
-# This tag can be used to specify a number of aliases that act as commands in
-# the documentation. An alias has the form:
-# name=value
-# For example adding
-# "sideeffect=@par Side Effects:\n"
-# will allow you to put the command \sideeffect (or @sideeffect) in the
-# documentation, which will result in a user-defined paragraph with heading
-# "Side Effects:". You can put \n's in the value part of an alias to insert
-# newlines.
-
-ALIASES                =
-
-# Set the OPTIMIZE_OUTPUT_FOR_C tag to YES if your project consists of C sources
-# only. Doxygen will then generate output that is more tailored for C. For
-# instance, some of the names that are used will be different. The list of all
-# members will be omitted, etc.
-# The default value is: NO.
-
-OPTIMIZE_OUTPUT_FOR_C  = YES
-
-# Set the OPTIMIZE_OUTPUT_JAVA tag to YES if your project consists of Java or
-# Python sources only. Doxygen will then generate output that is more tailored
-# for that language. For instance, namespaces will be presented as packages,
-# qualified scopes will look different, etc.
-# The default value is: NO.
-
-OPTIMIZE_OUTPUT_JAVA   = NO
-
-# Set the OPTIMIZE_FOR_FORTRAN tag to YES if your project consists of Fortran
-# sources. Doxygen will then generate output that is tailored for Fortran.
-# The default value is: NO.
-
-OPTIMIZE_FOR_FORTRAN   = NO
-
-# Set the OPTIMIZE_OUTPUT_VHDL tag to YES if your project consists of VHDL
-# sources. Doxygen will then generate output that is tailored for VHDL.
-# The default value is: NO.
-
-OPTIMIZE_OUTPUT_VHDL   = NO
-
-# Doxygen selects the parser to use depending on the extension of the files it
-# parses. With this tag you can assign which parser to use for a given
-# extension. Doxygen has a built-in mapping, but you can override or extend it
-# using this tag. The format is ext=language, where ext is a file extension, and
-# language is one of the parsers supported by doxygen: IDL, Java, Javascript,
-# C#, C, C++, D, PHP, Objective-C, Python, Fortran, VHDL. For instance to make
-# doxygen treat .inc files as Fortran files (default is PHP), and .f files as C
-# (default is Fortran), use: inc=Fortran f=C.
-#
-# Note For files without extension you can use no_extension as a placeholder.
-#
-# Note that for custom extensions you also need to set FILE_PATTERNS otherwise
-# the files are not read by doxygen.
-
-EXTENSION_MAPPING      =
-
-# If the MARKDOWN_SUPPORT tag is enabled then doxygen pre-processes all comments
-# according to the Markdown format, which allows for more readable
-# documentation. See http://daringfireball.net/projects/markdown/ for details.
-# The output of markdown processing is further processed by doxygen, so you can
-# mix doxygen, HTML, and XML commands with Markdown formatting. Disable only in
-# case of backward compatibilities issues.
-# The default value is: YES.
-
-MARKDOWN_SUPPORT       = YES
-
-# When enabled doxygen tries to link words that correspond to documented
-# classes, or namespaces to their corresponding documentation. Such a link can
-# be prevented in individual cases by by putting a % sign in front of the word
-# or globally by setting AUTOLINK_SUPPORT to NO.
-# The default value is: YES.
-
-AUTOLINK_SUPPORT       = YES
-
-# If you use STL classes (i.e. std::string, std::vector, etc.) but do not want
-# to include (a tag file for) the STL sources as input, then you should set this
-# tag to YES in order to let doxygen match functions declarations and
-# definitions whose arguments contain STL classes (e.g. func(std::string);
-# versus func(std::string) {}). This also make the inheritance and collaboration
-# diagrams that involve STL classes more complete and accurate.
-# The default value is: NO.
-
-BUILTIN_STL_SUPPORT    = NO
-
-# If you use Microsoft's C++/CLI language, you should set this option to YES to
-# enable parsing support.
-# The default value is: NO.
-
-CPP_CLI_SUPPORT        = NO
-
-# Set the SIP_SUPPORT tag to YES if your project consists of sip (see:
-# http://www.riverbankcomputing.co.uk/software/sip/intro) sources only. Doxygen
-# will parse them like normal C++ but will assume all classes use public instead
-# of private inheritance when no explicit protection keyword is present.
-# The default value is: NO.
-
-SIP_SUPPORT            = NO
-
-# For Microsoft's IDL there are propget and propput attributes to indicate
-# getter and setter methods for a property. Setting this option to YES will make
-# doxygen to replace the get and set methods by a property in the documentation.
-# This will only work if the methods are indeed getting or setting a simple
-# type. If this is not the case, or you want to show the methods anyway, you
-# should set this option to NO.
-# The default value is: YES.
-
-IDL_PROPERTY_SUPPORT   = YES
-
-# If member grouping is used in the documentation and the DISTRIBUTE_GROUP_DOC
-# tag is set to YES, then doxygen will reuse the documentation of the first
-# member in the group (if any) for the other members of the group. By default
-# all members of a group must be documented explicitly.
-# The default value is: NO.
-
-DISTRIBUTE_GROUP_DOC   = NO
-
-# Set the SUBGROUPING tag to YES to allow class member groups of the same type
-# (for instance a group of public functions) to be put as a subgroup of that
-# type (e.g. under the Public Functions section). Set it to NO to prevent
-# subgrouping. Alternatively, this can be done per class using the
-# \nosubgrouping command.
-# The default value is: YES.
-
-SUBGROUPING            = YES
-
-# When the INLINE_GROUPED_CLASSES tag is set to YES, classes, structs and unions
-# are shown inside the group in which they are included (e.g. using \ingroup)
-# instead of on a separate page (for HTML and Man pages) or section (for LaTeX
-# and RTF).
-#
-# Note that this feature does not work in combination with
-# SEPARATE_MEMBER_PAGES.
-# The default value is: NO.
-
-INLINE_GROUPED_CLASSES = NO
-
-# When the INLINE_SIMPLE_STRUCTS tag is set to YES, structs, classes, and unions
-# with only public data fields or simple typedef fields will be shown inline in
-# the documentation of the scope in which they are defined (i.e. file,
-# namespace, or group documentation), provided this scope is documented. If set
-# to NO, structs, classes, and unions are shown on a separate page (for HTML and
-# Man pages) or section (for LaTeX and RTF).
-# The default value is: NO.
-
-INLINE_SIMPLE_STRUCTS  = NO
-
-# When TYPEDEF_HIDES_STRUCT tag is enabled, a typedef of a struct, union, or
-# enum is documented as struct, union, or enum with the name of the typedef. So
-# typedef struct TypeS {} TypeT, will appear in the documentation as a struct
-# with name TypeT. When disabled the typedef will appear as a member of a file,
-# namespace, or class. And the struct will be named TypeS. This can typically be
-# useful for C code in case the coding convention dictates that all compound
-# types are typedef'ed and only the typedef is referenced, never the tag name.
-# The default value is: NO.
-
-TYPEDEF_HIDES_STRUCT   = NO
-
-# The size of the symbol lookup cache can be set using LOOKUP_CACHE_SIZE. This
-# cache is used to resolve symbols given their name and scope. Since this can be
-# an expensive process and often the same symbol appears multiple times in the
-# code, doxygen keeps a cache of pre-resolved symbols. If the cache is too small
-# doxygen will become slower. If the cache is too large, memory is wasted. The
-# cache size is given by this formula: 2^(16+LOOKUP_CACHE_SIZE). The valid range
-# is 0..9, the default is 0, corresponding to a cache size of 2^16=65536
-# symbols. At the end of a run doxygen will report the cache usage and suggest
-# the optimal cache size from a speed point of view.
-# Minimum value: 0, maximum value: 9, default value: 0.
-
-LOOKUP_CACHE_SIZE      = 0
-
-#---------------------------------------------------------------------------
-# Build related configuration options
-#---------------------------------------------------------------------------
-
-# If the EXTRACT_ALL tag is set to YES doxygen will assume all entities in
-# documentation are documented, even if no documentation was available. Private
-# class members and static file members will be hidden unless the
-# EXTRACT_PRIVATE respectively EXTRACT_STATIC tags are set to YES.
-# Note: This will also disable the warnings about undocumented members that are
-# normally produced when WARNINGS is set to YES.
-# The default value is: NO.
-
-EXTRACT_ALL            = YES
-
-# If the EXTRACT_PRIVATE tag is set to YES all private members of a class will
-# be included in the documentation.
-# The default value is: NO.
-
-EXTRACT_PRIVATE        = YES
-
-# If the EXTRACT_PACKAGE tag is set to YES all members with package or internal
-# scope will be included in the documentation.
-# The default value is: NO.
-
-EXTRACT_PACKAGE        = NO
-
-# If the EXTRACT_STATIC tag is set to YES all static members of a file will be
-# included in the documentation.
-# The default value is: NO.
-
-EXTRACT_STATIC         = YES
-
-# If the EXTRACT_LOCAL_CLASSES tag is set to YES classes (and structs) defined
-# locally in source files will be included in the documentation. If set to NO
-# only classes defined in header files are included. Does not have any effect
-# for Java sources.
-# The default value is: YES.
-
-EXTRACT_LOCAL_CLASSES  = YES
-
-# This flag is only useful for Objective-C code. When set to YES local methods,
-# which are defined in the implementation section but not in the interface are
-# included in the documentation. If set to NO only methods in the interface are
-# included.
-# The default value is: NO.
-
-EXTRACT_LOCAL_METHODS  = NO
-
-# If this flag is set to YES, the members of anonymous namespaces will be
-# extracted and appear in the documentation as a namespace called
-# 'anonymous_namespace{file}', where file will be replaced with the base name of
-# the file that contains the anonymous namespace. By default anonymous namespace
-# are hidden.
-# The default value is: NO.
-
-EXTRACT_ANON_NSPACES   = NO
-
-# If the HIDE_UNDOC_MEMBERS tag is set to YES, doxygen will hide all
-# undocumented members inside documented classes or files. If set to NO these
-# members will be included in the various overviews, but no documentation
-# section is generated. This option has no effect if EXTRACT_ALL is enabled.
-# The default value is: NO.
-
-HIDE_UNDOC_MEMBERS     = NO
-
-# If the HIDE_UNDOC_CLASSES tag is set to YES, doxygen will hide all
-# undocumented classes that are normally visible in the class hierarchy. If set
-# to NO these classes will be included in the various overviews. This option has
-# no effect if EXTRACT_ALL is enabled.
-# The default value is: NO.
-
-HIDE_UNDOC_CLASSES     = NO
-
-# If the HIDE_FRIEND_COMPOUNDS tag is set to YES, doxygen will hide all friend
-# (class|struct|union) declarations. If set to NO these declarations will be
-# included in the documentation.
-# The default value is: NO.
-
-HIDE_FRIEND_COMPOUNDS  = NO
-
-# If the HIDE_IN_BODY_DOCS tag is set to YES, doxygen will hide any
-# documentation blocks found inside the body of a function. If set to NO these
-# blocks will be appended to the function's detailed documentation block.
-# The default value is: NO.
-
-HIDE_IN_BODY_DOCS      = NO
-
-# The INTERNAL_DOCS tag determines if documentation that is typed after a
-# \internal command is included. If the tag is set to NO then the documentation
-# will be excluded. Set it to YES to include the internal documentation.
-# The default value is: NO.
-
-INTERNAL_DOCS          = NO
-
-# If the CASE_SENSE_NAMES tag is set to NO then doxygen will only generate file
-# names in lower-case letters. If set to YES upper-case letters are also
-# allowed. This is useful if you have classes or files whose names only differ
-# in case and if your file system supports case sensitive file names. Windows
-# and Mac users are advised to set this option to NO.
-# The default value is: system dependent.
-
-CASE_SENSE_NAMES       = YES
-
-# If the HIDE_SCOPE_NAMES tag is set to NO then doxygen will show members with
-# their full class and namespace scopes in the documentation. If set to YES the
-# scope will be hidden.
-# The default value is: NO.
-
-HIDE_SCOPE_NAMES       = NO
-
-# If the SHOW_INCLUDE_FILES tag is set to YES then doxygen will put a list of
-# the files that are included by a file in the documentation of that file.
-# The default value is: YES.
-
-SHOW_INCLUDE_FILES     = YES
-
-# If the SHOW_GROUPED_MEMB_INC tag is set to YES then Doxygen will add for each
-# grouped member an include statement to the documentation, telling the reader
-# which file to include in order to use the member.
-# The default value is: NO.
-
-SHOW_GROUPED_MEMB_INC  = NO
-
-# If the FORCE_LOCAL_INCLUDES tag is set to YES then doxygen will list include
-# files with double quotes in the documentation rather than with sharp brackets.
-# The default value is: NO.
-
-FORCE_LOCAL_INCLUDES   = NO
-
-# If the INLINE_INFO tag is set to YES then a tag [inline] is inserted in the
-# documentation for inline members.
-# The default value is: YES.
-
-INLINE_INFO            = YES
-
-# If the SORT_MEMBER_DOCS tag is set to YES then doxygen will sort the
-# (detailed) documentation of file and class members alphabetically by member
-# name. If set to NO the members will appear in declaration order.
-# The default value is: YES.
-
-SORT_MEMBER_DOCS       = YES
-
-# If the SORT_BRIEF_DOCS tag is set to YES then doxygen will sort the brief
-# descriptions of file, namespace and class members alphabetically by member
-# name. If set to NO the members will appear in declaration order. Note that
-# this will also influence the order of the classes in the class list.
-# The default value is: NO.
-
-SORT_BRIEF_DOCS        = NO
-
-# If the SORT_MEMBERS_CTORS_1ST tag is set to YES then doxygen will sort the
-# (brief and detailed) documentation of class members so that constructors and
-# destructors are listed first. If set to NO the constructors will appear in the
-# respective orders defined by SORT_BRIEF_DOCS and SORT_MEMBER_DOCS.
-# Note: If SORT_BRIEF_DOCS is set to NO this option is ignored for sorting brief
-# member documentation.
-# Note: If SORT_MEMBER_DOCS is set to NO this option is ignored for sorting
-# detailed member documentation.
-# The default value is: NO.
-
-SORT_MEMBERS_CTORS_1ST = NO
-
-# If the SORT_GROUP_NAMES tag is set to YES then doxygen will sort the hierarchy
-# of group names into alphabetical order. If set to NO the group names will
-# appear in their defined order.
-# The default value is: NO.
-
-SORT_GROUP_NAMES       = NO
-
-# If the SORT_BY_SCOPE_NAME tag is set to YES, the class list will be sorted by
-# fully-qualified names, including namespaces. If set to NO, the class list will
-# be sorted only by class name, not including the namespace part.
-# Note: This option is not very useful if HIDE_SCOPE_NAMES is set to YES.
-# Note: This option applies only to the class list, not to the alphabetical
-# list.
-# The default value is: NO.
-
-SORT_BY_SCOPE_NAME     = NO
-
-# If the STRICT_PROTO_MATCHING option is enabled and doxygen fails to do proper
-# type resolution of all parameters of a function it will reject a match between
-# the prototype and the implementation of a member function even if there is
-# only one candidate or it is obvious which candidate to choose by doing a
-# simple string match. By disabling STRICT_PROTO_MATCHING doxygen will still
-# accept a match between prototype and implementation in such cases.
-# The default value is: NO.
-
-STRICT_PROTO_MATCHING  = NO
-
-# The GENERATE_TODOLIST tag can be used to enable ( YES) or disable ( NO) the
-# todo list. This list is created by putting \todo commands in the
-# documentation.
-# The default value is: YES.
-
-GENERATE_TODOLIST      = YES
-
-# The GENERATE_TESTLIST tag can be used to enable ( YES) or disable ( NO) the
-# test list. This list is created by putting \test commands in the
-# documentation.
-# The default value is: YES.
-
-GENERATE_TESTLIST      = YES
-
-# The GENERATE_BUGLIST tag can be used to enable ( YES) or disable ( NO) the bug
-# list. This list is created by putting \bug commands in the documentation.
-# The default value is: YES.
-
-GENERATE_BUGLIST       = YES
-
-# The GENERATE_DEPRECATEDLIST tag can be used to enable ( YES) or disable ( NO)
-# the deprecated list. This list is created by putting \deprecated commands in
-# the documentation.
-# The default value is: YES.
-
-GENERATE_DEPRECATEDLIST= YES
-
-# The ENABLED_SECTIONS tag can be used to enable conditional documentation
-# sections, marked by \if <section_label> ... \endif and \cond <section_label>
-# ... \endcond blocks.
-
-ENABLED_SECTIONS       =
-
-# The MAX_INITIALIZER_LINES tag determines the maximum number of lines that the
-# initial value of a variable or macro / define can have for it to appear in the
-# documentation. If the initializer consists of more lines than specified here
-# it will be hidden. Use a value of 0 to hide initializers completely. The
-# appearance of the value of individual variables and macros / defines can be
-# controlled using \showinitializer or \hideinitializer command in the
-# documentation regardless of this setting.
-# Minimum value: 0, maximum value: 10000, default value: 30.
-
-MAX_INITIALIZER_LINES  = 0
-
-# Set the SHOW_USED_FILES tag to NO to disable the list of files generated at
-# the bottom of the documentation of classes and structs. If set to YES the list
-# will mention the files that were used to generate the documentation.
-# The default value is: YES.
-
-SHOW_USED_FILES        = YES
-
-# Set the SHOW_FILES tag to NO to disable the generation of the Files page. This
-# will remove the Files entry from the Quick Index and from the Folder Tree View
-# (if specified).
-# The default value is: YES.
-
-SHOW_FILES             = YES
-
-# Set the SHOW_NAMESPACES tag to NO to disable the generation of the Namespaces
-# page. This will remove the Namespaces entry from the Quick Index and from the
-# Folder Tree View (if specified).
-# The default value is: YES.
-
-SHOW_NAMESPACES        = YES
-
-# The FILE_VERSION_FILTER tag can be used to specify a program or script that
-# doxygen should invoke to get the current version for each file (typically from
-# the version control system). Doxygen will invoke the program by executing (via
-# popen()) the command command input-file, where command is the value of the
-# FILE_VERSION_FILTER tag, and input-file is the name of an input file provided
-# by doxygen. Whatever the program writes to standard output is used as the file
-# version. For an example see the documentation.
-
-FILE_VERSION_FILTER    =
-
-# The LAYOUT_FILE tag can be used to specify a layout file which will be parsed
-# by doxygen. The layout file controls the global structure of the generated
-# output files in an output format independent way. To create the layout file
-# that represents doxygen's defaults, run doxygen with the -l option. You can
-# optionally specify a file name after the option, if omitted DoxygenLayout.xml
-# will be used as the name of the layout file.
-#
-# Note that if you run doxygen from a directory containing a file called
-# DoxygenLayout.xml, doxygen will parse it automatically even if the LAYOUT_FILE
-# tag is left empty.
-
-LAYOUT_FILE            =
-
-# The CITE_BIB_FILES tag can be used to specify one or more bib files containing
-# the reference definitions. This must be a list of .bib files. The .bib
-# extension is automatically appended if omitted. This requires the bibtex tool
-# to be installed. See also http://en.wikipedia.org/wiki/BibTeX for more info.
-# For LaTeX the style of the bibliography can be controlled using
-# LATEX_BIB_STYLE. To use this feature you need bibtex and perl available in the
-# search path. Do not use file names with spaces, bibtex cannot handle them. See
-# also \cite for info how to create references.
-
-CITE_BIB_FILES         =
-
-#---------------------------------------------------------------------------
-# Configuration options related to warning and progress messages
-#---------------------------------------------------------------------------
-
-# The QUIET tag can be used to turn on/off the messages that are generated to
-# standard output by doxygen. If QUIET is set to YES this implies that the
-# messages are off.
-# The default value is: NO.
-
-QUIET                  = YES
-
-# The WARNINGS tag can be used to turn on/off the warning messages that are
-# generated to standard error ( stderr) by doxygen. If WARNINGS is set to YES
-# this implies that the warnings are on.
-#
-# Tip: Turn warnings on while writing the documentation.
-# The default value is: YES.
-
-WARNINGS               = YES
-
-# If the WARN_IF_UNDOCUMENTED tag is set to YES, then doxygen will generate
-# warnings for undocumented members. If EXTRACT_ALL is set to YES then this flag
-# will automatically be disabled.
-# The default value is: YES.
-
-WARN_IF_UNDOCUMENTED   = YES
-
-# If the WARN_IF_DOC_ERROR tag is set to YES, doxygen will generate warnings for
-# potential errors in the documentation, such as not documenting some parameters
-# in a documented function, or documenting parameters that don't exist or using
-# markup commands wrongly.
-# The default value is: YES.
-
-WARN_IF_DOC_ERROR      = YES
-
-# This WARN_NO_PARAMDOC option can be enabled to get warnings for functions that
-# are documented, but have no documentation for their parameters or return
-# value. If set to NO doxygen will only warn about wrong or incomplete parameter
-# documentation, but not about the absence of documentation.
-# The default value is: NO.
-
-WARN_NO_PARAMDOC       = NO
-
-# The WARN_FORMAT tag determines the format of the warning messages that doxygen
-# can produce. The string should contain the $file, $line, and $text tags, which
-# will be replaced by the file and line number from which the warning originated
-# and the warning text. Optionally the format may contain $version, which will
-# be replaced by the version of the file (if it could be obtained via
-# FILE_VERSION_FILTER)
-# The default value is: $file:$line: $text.
-
-WARN_FORMAT            = "$file:$line: $text"
-
-# The WARN_LOGFILE tag can be used to specify a file to which warning and error
-# messages should be written. If left blank the output is written to standard
-# error (stderr).
-
-WARN_LOGFILE           =
-
-#---------------------------------------------------------------------------
-# Configuration options related to the input files
-#---------------------------------------------------------------------------
-
-# The INPUT tag is used to specify the files and/or directories that contain
-# documented source files. You may enter file names like myfile.cpp or
-# directories like /usr/src/myproject. Separate the files or directories with
-# spaces.
-# Note: If this tag is empty the current directory is searched.
-
-INPUT                  = $(SRCDIR)/doc/libdvbv5-index.doc \
-			 $(SRCDIR)/lib/include/libdvbv5/dvb-demux.h \
-			 $(SRCDIR)/lib/include/libdvbv5/dvb-dev.h \
-			 $(SRCDIR)/lib/include/libdvbv5/dvb-fe.h \
-			 $(SRCDIR)/lib/include/libdvbv5/dvb-file.h \
-			 $(SRCDIR)/lib/include/libdvbv5/dvb-log.h \
-			 $(SRCDIR)/lib/include/libdvbv5/dvb-sat.h \
-			 $(SRCDIR)/lib/include/libdvbv5/dvb-scan.h \
-			 $(SRCDIR)/lib/include/libdvbv5/dvb-v5-std.h \
-			 $(SRCDIR)/lib/include/libdvbv5/descriptors.h \
-			 $(SRCDIR)/lib/include/libdvbv5/header.h \
-			 $(SRCDIR)/lib/include/libdvbv5/atsc_header.h \
-			 $(SRCDIR)/lib/include/libdvbv5/atsc_eit.h \
-			 $(SRCDIR)/lib/include/libdvbv5/cat.h \
-			 $(SRCDIR)/lib/include/libdvbv5/eit.h \
-			 $(SRCDIR)/lib/include/libdvbv5/mgt.h \
-			 $(SRCDIR)/lib/include/libdvbv5/nit.h \
-			 $(SRCDIR)/lib/include/libdvbv5/pat.h \
-			 $(SRCDIR)/lib/include/libdvbv5/pmt.h \
-			 $(SRCDIR)/lib/include/libdvbv5/sdt.h \
-			 $(SRCDIR)/lib/include/libdvbv5/vct.h \
-			 $(SRCDIR)/lib/include/libdvbv5/crc32.h \
-			 $(SRCDIR)/lib/include/libdvbv5/countries.h \
-			 $(SRCDIR)/lib/include/libdvbv5/mpeg_es.h \
-			 $(SRCDIR)/lib/include/libdvbv5/mpeg_pes.h \
-			 $(SRCDIR)/lib/include/libdvbv5/mpeg_ts.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_atsc_service_location.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_ca.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_ca_identifier.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_cable_delivery.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_event_extended.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_event_short.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_extension.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_frequency_list.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_hierarchy.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_isdbt_delivery.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_language.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_logical_channel.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_network_name.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_partial_reception.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_registration_id.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_sat.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_service.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_t2_delivery.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_terrestrial_delivery.h \
-			 $(SRCDIR)/lib/include/libdvbv5/desc_ts_info.h \
-
-# This tag can be used to specify the character encoding of the source files
-# that doxygen parses. Internally doxygen uses the UTF-8 encoding. Doxygen uses
-# libiconv (or the iconv built into libc) for the transcoding. See the libiconv
-# documentation (see: http://www.gnu.org/software/libiconv) for the list of
-# possible encodings.
-# The default value is: UTF-8.
-
-INPUT_ENCODING         = UTF-8
-
-# If the value of the INPUT tag contains directories, you can use the
-# FILE_PATTERNS tag to specify one or more wildcard patterns (like *.cpp and
-# *.h) to filter out the source-files in the directories. If left blank the
-# following patterns are tested:*.c, *.cc, *.cxx, *.cpp, *.c++, *.java, *.ii,
-# *.ixx, *.ipp, *.i++, *.inl, *.idl, *.ddl, *.odl, *.h, *.hh, *.hxx, *.hpp,
-# *.h++, *.cs, *.d, *.php, *.php4, *.php5, *.phtml, *.inc, *.m, *.markdown,
-# *.md, *.mm, *.dox, *.py, *.f90, *.f, *.for, *.tcl, *.vhd, *.vhdl, *.ucf,
-# *.qsf, *.as and *.js.
-
-FILE_PATTERNS          =
-
-# The RECURSIVE tag can be used to specify whether or not subdirectories should
-# be searched for input files as well.
-# The default value is: NO.
-
-RECURSIVE              = YES
-
-# The EXCLUDE tag can be used to specify files and/or directories that should be
-# excluded from the INPUT source files. This way you can easily exclude a
-# subdirectory from a directory tree whose root is specified with the INPUT tag.
-#
-# Note that relative paths are relative to the directory from which doxygen is
-# run.
-
-EXCLUDE                =
-
-# The EXCLUDE_SYMLINKS tag can be used to select whether or not files or
-# directories that are symbolic links (a Unix file system feature) are excluded
-# from the input.
-# The default value is: NO.
-
-EXCLUDE_SYMLINKS       = NO
-
-# If the value of the INPUT tag contains directories, you can use the
-# EXCLUDE_PATTERNS tag to specify one or more wildcard patterns to exclude
-# certain files from those directories.
-#
-# Note that the wildcards are matched against the file with absolute path, so to
-# exclude all test directories for example use the pattern */test/*
-
-EXCLUDE_PATTERNS       =
-
-# The EXCLUDE_SYMBOLS tag can be used to specify one or more symbol names
-# (namespaces, classes, functions, etc.) that should be excluded from the
-# output. The symbol name can be a fully qualified name, a word, or if the
-# wildcard * is used, a substring. Examples: ANamespace, AClass,
-# AClass::ANamespace, ANamespace::*Test
-#
-# Note that the wildcards are matched against the file with absolute path, so to
-# exclude all test directories use the pattern */test/*
-
-EXCLUDE_SYMBOLS        =
-
-# The EXAMPLE_PATH tag can be used to specify one or more files or directories
-# that contain example code fragments that are included (see the \include
-# command).
-
-EXAMPLE_PATH           = $(SRCDIR)/utils/dvb/
-
-# If the value of the EXAMPLE_PATH tag contains directories, you can use the
-# EXAMPLE_PATTERNS tag to specify one or more wildcard pattern (like *.cpp and
-# *.h) to filter out the source-files in the directories. If left blank all
-# files are included.
-
-EXAMPLE_PATTERNS       =
-
-# If the EXAMPLE_RECURSIVE tag is set to YES then subdirectories will be
-# searched for input files to be used with the \include or \dontinclude commands
-# irrespective of the value of the RECURSIVE tag.
-# The default value is: NO.
-
-EXAMPLE_RECURSIVE      = NO
-
-# The IMAGE_PATH tag can be used to specify one or more files or directories
-# that contain images that are to be included in the documentation (see the
-# \image command).
-
-IMAGE_PATH             =
-
-# The INPUT_FILTER tag can be used to specify a program that doxygen should
-# invoke to filter for each input file. Doxygen will invoke the filter program
-# by executing (via popen()) the command:
-#
-# <filter> <input-file>
-#
-# where <filter> is the value of the INPUT_FILTER tag, and <input-file> is the
-# name of an input file. Doxygen will then use the output that the filter
-# program writes to standard output. If FILTER_PATTERNS is specified, this tag
-# will be ignored.
-#
-# Note that the filter must not add or remove lines; it is applied before the
-# code is scanned, but not when the output code is generated. If lines are added
-# or removed, the anchors will not be placed correctly.
-
-INPUT_FILTER           =
-
-# The FILTER_PATTERNS tag can be used to specify filters on a per file pattern
-# basis. Doxygen will compare the file name with each pattern and apply the
-# filter if there is a match. The filters are a list of the form: pattern=filter
-# (like *.cpp=my_cpp_filter). See INPUT_FILTER for further information on how
-# filters are used. If the FILTER_PATTERNS tag is empty or if none of the
-# patterns match the file name, INPUT_FILTER is applied.
-
-FILTER_PATTERNS        =
-
-# If the FILTER_SOURCE_FILES tag is set to YES, the input filter (if set using
-# INPUT_FILTER ) will also be used to filter the input files that are used for
-# producing the source files to browse (i.e. when SOURCE_BROWSER is set to YES).
-# The default value is: NO.
-
-FILTER_SOURCE_FILES    = NO
-
-# The FILTER_SOURCE_PATTERNS tag can be used to specify source filters per file
-# pattern. A pattern will override the setting for FILTER_PATTERN (if any) and
-# it is also possible to disable source filtering for a specific pattern using
-# *.ext= (so without naming a filter).
-# This tag requires that the tag FILTER_SOURCE_FILES is set to YES.
-
-FILTER_SOURCE_PATTERNS =
-
-# If the USE_MDFILE_AS_MAINPAGE tag refers to the name of a markdown file that
-# is part of the input, its contents will be placed on the main page
-# (index.html). This can be useful if you have a project on for instance GitHub
-# and want to reuse the introduction page also for the doxygen output.
-
-USE_MDFILE_AS_MAINPAGE =
-
-#---------------------------------------------------------------------------
-# Configuration options related to source browsing
-#---------------------------------------------------------------------------
-
-# If the SOURCE_BROWSER tag is set to YES then a list of source files will be
-# generated. Documented entities will be cross-referenced with these sources.
-#
-# Note: To get rid of all source code in the generated output, make sure that
-# also VERBATIM_HEADERS is set to NO.
-# The default value is: NO.
-
-SOURCE_BROWSER         = YES
-
-# Setting the INLINE_SOURCES tag to YES will include the body of functions,
-# classes and enums directly into the documentation.
-# The default value is: NO.
-
-INLINE_SOURCES         = NO
-
-# Setting the STRIP_CODE_COMMENTS tag to YES will instruct doxygen to hide any
-# special comment blocks from generated source code fragments. Normal C, C++ and
-# Fortran comments will always remain visible.
-# The default value is: YES.
-
-STRIP_CODE_COMMENTS    = YES
-
-# If the REFERENCED_BY_RELATION tag is set to YES then for each documented
-# function all documented functions referencing it will be listed.
-# The default value is: NO.
-
-REFERENCED_BY_RELATION = YES
-
-# If the REFERENCES_RELATION tag is set to YES then for each documented function
-# all documented entities called/used by that function will be listed.
-# The default value is: NO.
-
-REFERENCES_RELATION    = YES
-
-# If the REFERENCES_LINK_SOURCE tag is set to YES and SOURCE_BROWSER tag is set
-# to YES, then the hyperlinks from functions in REFERENCES_RELATION and
-# REFERENCED_BY_RELATION lists will link to the source code. Otherwise they will
-# link to the documentation.
-# The default value is: YES.
-
-REFERENCES_LINK_SOURCE = YES
-
-# If SOURCE_TOOLTIPS is enabled (the default) then hovering a hyperlink in the
-# source code will show a tooltip with additional information such as prototype,
-# brief description and links to the definition and documentation. Since this
-# will make the HTML file larger and loading of large files a bit slower, you
-# can opt to disable this feature.
-# The default value is: YES.
-# This tag requires that the tag SOURCE_BROWSER is set to YES.
-
-SOURCE_TOOLTIPS        = YES
-
-# If the USE_HTAGS tag is set to YES then the references to source code will
-# point to the HTML generated by the htags(1) tool instead of doxygen built-in
-# source browser. The htags tool is part of GNU's global source tagging system
-# (see http://www.gnu.org/software/global/global.html). You will need version
-# 4.8.6 or higher.
-#
-# To use it do the following:
-# - Install the latest version of global
-# - Enable SOURCE_BROWSER and USE_HTAGS in the config file
-# - Make sure the INPUT points to the root of the source tree
-# - Run doxygen as normal
-#
-# Doxygen will invoke htags (and that will in turn invoke gtags), so these
-# tools must be available from the command line (i.e. in the search path).
-#
-# The result: instead of the source browser generated by doxygen, the links to
-# source code will now point to the output of htags.
-# The default value is: NO.
-# This tag requires that the tag SOURCE_BROWSER is set to YES.
-
-USE_HTAGS              = NO
-
-# If the VERBATIM_HEADERS tag is set the YES then doxygen will generate a
-# verbatim copy of the header file for each class for which an include is
-# specified. Set to NO to disable this.
-# See also: Section \class.
-# The default value is: YES.
-
-VERBATIM_HEADERS       = YES
-
-#---------------------------------------------------------------------------
-# Configuration options related to the alphabetical class index
-#---------------------------------------------------------------------------
-
-# If the ALPHABETICAL_INDEX tag is set to YES, an alphabetical index of all
-# compounds will be generated. Enable this if the project contains a lot of
-# classes, structs, unions or interfaces.
-# The default value is: YES.
-
-ALPHABETICAL_INDEX     = YES
-
-# In case all classes in a project start with a common prefix, all classes will
-# be put under the same header in the alphabetical index. The IGNORE_PREFIX tag
-# can be used to specify a prefix (or a list of prefixes) that should be ignored
-# while generating the index headers.
-# This tag requires that the tag ALPHABETICAL_INDEX is set to YES.
-
-IGNORE_PREFIX          =
-
-#---------------------------------------------------------------------------
-# Configuration options related to the HTML output
-#---------------------------------------------------------------------------
-
-# If the GENERATE_HTML tag is set to YES doxygen will generate HTML output
-# The default value is: YES.
-
-GENERATE_HTML          = $(GENERATE_HTML)
-
-# The HTML_OUTPUT tag is used to specify where the HTML docs will be put. If a
-# relative path is entered the value of OUTPUT_DIRECTORY will be put in front of
-# it.
-# The default directory is: html.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-HTML_OUTPUT            = html
-
-# The HTML_FILE_EXTENSION tag can be used to specify the file extension for each
-# generated HTML page (for example: .htm, .php, .asp).
-# The default value is: .html.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-HTML_FILE_EXTENSION    = .html
-
-# The HTML_HEADER tag can be used to specify a user-defined HTML header file for
-# each generated HTML page. If the tag is left blank doxygen will generate a
-# standard header.
-#
-# To get valid HTML the header file that includes any scripts and style sheets
-# that doxygen needs, which is dependent on the configuration options used (e.g.
-# the setting GENERATE_TREEVIEW). It is highly recommended to start with a
-# default header using
-# doxygen -w html new_header.html new_footer.html new_stylesheet.css
-# YourConfigFile
-# and then modify the file new_header.html. See also section "Doxygen usage"
-# for information on how to generate the default header that doxygen normally
-# uses.
-# Note: The header is subject to change so you typically have to regenerate the
-# default header when upgrading to a newer version of doxygen. For a description
-# of the possible markers and block names see the documentation.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-HTML_HEADER            =
-
-# The HTML_FOOTER tag can be used to specify a user-defined HTML footer for each
-# generated HTML page. If the tag is left blank doxygen will generate a standard
-# footer. See HTML_HEADER for more information on how to generate a default
-# footer and what special commands can be used inside the footer. See also
-# section "Doxygen usage" for information on how to generate the default footer
-# that doxygen normally uses.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-HTML_FOOTER            =
-
-# The HTML_STYLESHEET tag can be used to specify a user-defined cascading style
-# sheet that is used by each HTML page. It can be used to fine-tune the look of
-# the HTML output. If left blank doxygen will generate a default style sheet.
-# See also section "Doxygen usage" for information on how to generate the style
-# sheet that doxygen normally uses.
-# Note: It is recommended to use HTML_EXTRA_STYLESHEET instead of this tag, as
-# it is more robust and this tag (HTML_STYLESHEET) will in the future become
-# obsolete.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-HTML_STYLESHEET        =
-
-# The HTML_EXTRA_STYLESHEET tag can be used to specify an additional user-
-# defined cascading style sheet that is included after the standard style sheets
-# created by doxygen. Using this option one can overrule certain style aspects.
-# This is preferred over using HTML_STYLESHEET since it does not replace the
-# standard style sheet and is therefor more robust against future updates.
-# Doxygen will copy the style sheet file to the output directory. For an example
-# see the documentation.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-HTML_EXTRA_STYLESHEET  =
-
-# The HTML_EXTRA_FILES tag can be used to specify one or more extra images or
-# other source files which should be copied to the HTML output directory. Note
-# that these files will be copied to the base HTML output directory. Use the
-# $relpath^ marker in the HTML_HEADER and/or HTML_FOOTER files to load these
-# files. In the HTML_STYLESHEET file, use the file name only. Also note that the
-# files will be copied as-is; there are no commands or markers available.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-HTML_EXTRA_FILES       =
-
-# The HTML_COLORSTYLE_HUE tag controls the color of the HTML output. Doxygen
-# will adjust the colors in the stylesheet and background images according to
-# this color. Hue is specified as an angle on a colorwheel, see
-# http://en.wikipedia.org/wiki/Hue for more information. For instance the value
-# 0 represents red, 60 is yellow, 120 is green, 180 is cyan, 240 is blue, 300
-# purple, and 360 is red again.
-# Minimum value: 0, maximum value: 359, default value: 220.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-HTML_COLORSTYLE_HUE    = 220
-
-# The HTML_COLORSTYLE_SAT tag controls the purity (or saturation) of the colors
-# in the HTML output. For a value of 0 the output will use grayscales only. A
-# value of 255 will produce the most vivid colors.
-# Minimum value: 0, maximum value: 255, default value: 100.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-HTML_COLORSTYLE_SAT    = 100
-
-# The HTML_COLORSTYLE_GAMMA tag controls the gamma correction applied to the
-# luminance component of the colors in the HTML output. Values below 100
-# gradually make the output lighter, whereas values above 100 make the output
-# darker. The value divided by 100 is the actual gamma applied, so 80 represents
-# a gamma of 0.8, The value 220 represents a gamma of 2.2, and 100 does not
-# change the gamma.
-# Minimum value: 40, maximum value: 240, default value: 80.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-HTML_COLORSTYLE_GAMMA  = 80
-
-# If the HTML_TIMESTAMP tag is set to YES then the footer of each generated HTML
-# page will contain the date and time when the page was generated. Setting this
-# to NO can help when comparing the output of multiple runs.
-# The default value is: YES.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-HTML_TIMESTAMP         = NO
-
-# If the HTML_DYNAMIC_SECTIONS tag is set to YES then the generated HTML
-# documentation will contain sections that can be hidden and shown after the
-# page has loaded.
-# The default value is: NO.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-HTML_DYNAMIC_SECTIONS  = NO
-
-# With HTML_INDEX_NUM_ENTRIES one can control the preferred number of entries
-# shown in the various tree structured indices initially; the user can expand
-# and collapse entries dynamically later on. Doxygen will expand the tree to
-# such a level that at most the specified number of entries are visible (unless
-# a fully collapsed tree already exceeds this amount). So setting the number of
-# entries 1 will produce a full collapsed tree by default. 0 is a special value
-# representing an infinite number of entries and will result in a full expanded
-# tree by default.
-# Minimum value: 0, maximum value: 9999, default value: 100.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-HTML_INDEX_NUM_ENTRIES = 100
-
-# If the GENERATE_DOCSET tag is set to YES, additional index files will be
-# generated that can be used as input for Apple's Xcode 3 integrated development
-# environment (see: http://developer.apple.com/tools/xcode/), introduced with
-# OSX 10.5 (Leopard). To create a documentation set, doxygen will generate a
-# Makefile in the HTML output directory. Running make will produce the docset in
-# that directory and running make install will install the docset in
-# ~/Library/Developer/Shared/Documentation/DocSets so that Xcode will find it at
-# startup. See http://developer.apple.com/tools/creatingdocsetswithdoxygen.html
-# for more information.
-# The default value is: NO.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-GENERATE_DOCSET        = NO
-
-# This tag determines the name of the docset feed. A documentation feed provides
-# an umbrella under which multiple documentation sets from a single provider
-# (such as a company or product suite) can be grouped.
-# The default value is: Doxygen generated docs.
-# This tag requires that the tag GENERATE_DOCSET is set to YES.
-
-DOCSET_FEEDNAME        = "Doxygen generated docs"
-
-# This tag specifies a string that should uniquely identify the documentation
-# set bundle. This should be a reverse domain-name style string, e.g.
-# com.mycompany.MyDocSet. Doxygen will append .docset to the name.
-# The default value is: org.doxygen.Project.
-# This tag requires that the tag GENERATE_DOCSET is set to YES.
-
-DOCSET_BUNDLE_ID       = org.doxygen.Project
-
-# The DOCSET_PUBLISHER_ID tag specifies a string that should uniquely identify
-# the documentation publisher. This should be a reverse domain-name style
-# string, e.g. com.mycompany.MyDocSet.documentation.
-# The default value is: org.doxygen.Publisher.
-# This tag requires that the tag GENERATE_DOCSET is set to YES.
-
-DOCSET_PUBLISHER_ID    = org.doxygen.Publisher
-
-# The DOCSET_PUBLISHER_NAME tag identifies the documentation publisher.
-# The default value is: Publisher.
-# This tag requires that the tag GENERATE_DOCSET is set to YES.
-
-DOCSET_PUBLISHER_NAME  = Publisher
-
-# If the GENERATE_HTMLHELP tag is set to YES then doxygen generates three
-# additional HTML index files: index.hhp, index.hhc, and index.hhk. The
-# index.hhp is a project file that can be read by Microsoft's HTML Help Workshop
-# (see: http://www.microsoft.com/en-us/download/details.aspx?id=21138) on
-# Windows.
-#
-# The HTML Help Workshop contains a compiler that can convert all HTML output
-# generated by doxygen into a single compiled HTML file (.chm). Compiled HTML
-# files are now used as the Windows 98 help format, and will replace the old
-# Windows help format (.hlp) on all Windows platforms in the future. Compressed
-# HTML files also contain an index, a table of contents, and you can search for
-# words in the documentation. The HTML workshop also contains a viewer for
-# compressed HTML files.
-# The default value is: NO.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-GENERATE_HTMLHELP      = $(GENERATE_HTMLHELP)
-
-# The CHM_FILE tag can be used to specify the file name of the resulting .chm
-# file. You can add a path in front of the file if the result should not be
-# written to the html output directory.
-# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
-
-CHM_FILE               = ../$(PROJECT).chm
-
-# The HHC_LOCATION tag can be used to specify the location (absolute path
-# including file name) of the HTML help compiler ( hhc.exe). If non-empty
-# doxygen will try to run the HTML help compiler on the generated index.hhp.
-# The file has to be specified with full path.
-# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
-
-HHC_LOCATION           = $(HHC_PATH)
-
-# The GENERATE_CHI flag controls if a separate .chi index file is generated (
-# YES) or that it should be included in the master .chm file ( NO).
-# The default value is: NO.
-# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
-
-GENERATE_CHI           = $(GENERATE_CHI)
-
-# The CHM_INDEX_ENCODING is used to encode HtmlHelp index ( hhk), content ( hhc)
-# and project file content.
-# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
-
-CHM_INDEX_ENCODING     =
-
-# The BINARY_TOC flag controls whether a binary table of contents is generated (
-# YES) or a normal table of contents ( NO) in the .chm file.
-# The default value is: NO.
-# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
-
-BINARY_TOC             = NO
-
-# The TOC_EXPAND flag can be set to YES to add extra items for group members to
-# the table of contents of the HTML help documentation and to the tree view.
-# The default value is: NO.
-# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
-
-TOC_EXPAND             = YES
-
-# If the GENERATE_QHP tag is set to YES and both QHP_NAMESPACE and
-# QHP_VIRTUAL_FOLDER are set, an additional index file will be generated that
-# can be used as input for Qt's qhelpgenerator to generate a Qt Compressed Help
-# (.qch) of the generated HTML documentation.
-# The default value is: NO.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-GENERATE_QHP           = NO
-
-# If the QHG_LOCATION tag is specified, the QCH_FILE tag can be used to specify
-# the file name of the resulting .qch file. The path specified is relative to
-# the HTML output folder.
-# This tag requires that the tag GENERATE_QHP is set to YES.
-
-QCH_FILE               =
-
-# The QHP_NAMESPACE tag specifies the namespace to use when generating Qt Help
-# Project output. For more information please see Qt Help Project / Namespace
-# (see: http://qt-project.org/doc/qt-4.8/qthelpproject.html#namespace).
-# The default value is: org.doxygen.Project.
-# This tag requires that the tag GENERATE_QHP is set to YES.
-
-QHP_NAMESPACE          = org.doxygen.Project
-
-# The QHP_VIRTUAL_FOLDER tag specifies the namespace to use when generating Qt
-# Help Project output. For more information please see Qt Help Project / Virtual
-# Folders (see: http://qt-project.org/doc/qt-4.8/qthelpproject.html#virtual-
-# folders).
-# The default value is: doc.
-# This tag requires that the tag GENERATE_QHP is set to YES.
-
-QHP_VIRTUAL_FOLDER     = doc
-
-# If the QHP_CUST_FILTER_NAME tag is set, it specifies the name of a custom
-# filter to add. For more information please see Qt Help Project / Custom
-# Filters (see: http://qt-project.org/doc/qt-4.8/qthelpproject.html#custom-
-# filters).
-# This tag requires that the tag GENERATE_QHP is set to YES.
-
-QHP_CUST_FILTER_NAME   =
-
-# The QHP_CUST_FILTER_ATTRS tag specifies the list of the attributes of the
-# custom filter to add. For more information please see Qt Help Project / Custom
-# Filters (see: http://qt-project.org/doc/qt-4.8/qthelpproject.html#custom-
-# filters).
-# This tag requires that the tag GENERATE_QHP is set to YES.
-
-QHP_CUST_FILTER_ATTRS  =
-
-# The QHP_SECT_FILTER_ATTRS tag specifies the list of the attributes this
-# project's filter section matches. Qt Help Project / Filter Attributes (see:
-# http://qt-project.org/doc/qt-4.8/qthelpproject.html#filter-attributes).
-# This tag requires that the tag GENERATE_QHP is set to YES.
-
-QHP_SECT_FILTER_ATTRS  =
-
-# The QHG_LOCATION tag can be used to specify the location of Qt's
-# qhelpgenerator. If non-empty doxygen will try to run qhelpgenerator on the
-# generated .qhp file.
-# This tag requires that the tag GENERATE_QHP is set to YES.
-
-QHG_LOCATION           =
-
-# If the GENERATE_ECLIPSEHELP tag is set to YES, additional index files will be
-# generated, together with the HTML files, they form an Eclipse help plugin. To
-# install this plugin and make it available under the help contents menu in
-# Eclipse, the contents of the directory containing the HTML and XML files needs
-# to be copied into the plugins directory of eclipse. The name of the directory
-# within the plugins directory should be the same as the ECLIPSE_DOC_ID value.
-# After copying Eclipse needs to be restarted before the help appears.
-# The default value is: NO.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-GENERATE_ECLIPSEHELP   = NO
-
-# A unique identifier for the Eclipse help plugin. When installing the plugin
-# the directory name containing the HTML and XML files should also have this
-# name. Each documentation set should have its own identifier.
-# The default value is: org.doxygen.Project.
-# This tag requires that the tag GENERATE_ECLIPSEHELP is set to YES.
-
-ECLIPSE_DOC_ID         = org.doxygen.Project
-
-# If you want full control over the layout of the generated HTML pages it might
-# be necessary to disable the index and replace it with your own. The
-# DISABLE_INDEX tag can be used to turn on/off the condensed index (tabs) at top
-# of each HTML page. A value of NO enables the index and the value YES disables
-# it. Since the tabs in the index contain the same information as the navigation
-# tree, you can set this option to YES if you also set GENERATE_TREEVIEW to YES.
-# The default value is: NO.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-DISABLE_INDEX          = NO
-
-# The GENERATE_TREEVIEW tag is used to specify whether a tree-like index
-# structure should be generated to display hierarchical information. If the tag
-# value is set to YES, a side panel will be generated containing a tree-like
-# index structure (just like the one that is generated for HTML Help). For this
-# to work a browser that supports JavaScript, DHTML, CSS and frames is required
-# (i.e. any modern browser). Windows users are probably better off using the
-# HTML help feature. Via custom stylesheets (see HTML_EXTRA_STYLESHEET) one can
-# further fine-tune the look of the index. As an example, the default style
-# sheet generated by doxygen has an example that shows how to put an image at
-# the root of the tree instead of the PROJECT_NAME. Since the tree basically has
-# the same information as the tab index, you could consider setting
-# DISABLE_INDEX to YES when enabling this option.
-# The default value is: NO.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-GENERATE_TREEVIEW      = YES
-
-# The ENUM_VALUES_PER_LINE tag can be used to set the number of enum values that
-# doxygen will group on one line in the generated HTML documentation.
-#
-# Note that a value of 0 will completely suppress the enum values from appearing
-# in the overview section.
-# Minimum value: 0, maximum value: 20, default value: 4.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-ENUM_VALUES_PER_LINE   = 4
-
-# If the treeview is enabled (see GENERATE_TREEVIEW) then this tag can be used
-# to set the initial width (in pixels) of the frame in which the tree is shown.
-# Minimum value: 0, maximum value: 1500, default value: 250.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-TREEVIEW_WIDTH         = 250
-
-# When the EXT_LINKS_IN_WINDOW option is set to YES doxygen will open links to
-# external symbols imported via tag files in a separate window.
-# The default value is: NO.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-EXT_LINKS_IN_WINDOW    = NO
-
-# Use this tag to change the font size of LaTeX formulas included as images in
-# the HTML documentation. When you change the font size after a successful
-# doxygen run you need to manually remove any form_*.png images from the HTML
-# output directory to force them to be regenerated.
-# Minimum value: 8, maximum value: 50, default value: 10.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-FORMULA_FONTSIZE       = 10
-
-# Use the FORMULA_TRANPARENT tag to determine whether or not the images
-# generated for formulas are transparent PNGs. Transparent PNGs are not
-# supported properly for IE 6.0, but are supported on all modern browsers.
-#
-# Note that when changing this option you need to delete any form_*.png files in
-# the HTML output directory before the changes have effect.
-# The default value is: YES.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-FORMULA_TRANSPARENT    = YES
-
-# Enable the USE_MATHJAX option to render LaTeX formulas using MathJax (see
-# http://www.mathjax.org) which uses client side Javascript for the rendering
-# instead of using prerendered bitmaps. Use this if you do not have LaTeX
-# installed or if you want to formulas look prettier in the HTML output. When
-# enabled you may also need to install MathJax separately and configure the path
-# to it using the MATHJAX_RELPATH option.
-# The default value is: NO.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-USE_MATHJAX            = NO
-
-# When MathJax is enabled you can set the default output format to be used for
-# the MathJax output. See the MathJax site (see:
-# http://docs.mathjax.org/en/latest/output.html) for more details.
-# Possible values are: HTML-CSS (which is slower, but has the best
-# compatibility), NativeMML (i.e. MathML) and SVG.
-# The default value is: HTML-CSS.
-# This tag requires that the tag USE_MATHJAX is set to YES.
-
-MATHJAX_FORMAT         = HTML-CSS
-
-# When MathJax is enabled you need to specify the location relative to the HTML
-# output directory using the MATHJAX_RELPATH option. The destination directory
-# should contain the MathJax.js script. For instance, if the mathjax directory
-# is located at the same level as the HTML output directory, then
-# MATHJAX_RELPATH should be ../mathjax. The default value points to the MathJax
-# Content Delivery Network so you can quickly see the result without installing
-# MathJax. However, it is strongly recommended to install a local copy of
-# MathJax from http://www.mathjax.org before deployment.
-# The default value is: http://cdn.mathjax.org/mathjax/latest.
-# This tag requires that the tag USE_MATHJAX is set to YES.
-
-MATHJAX_RELPATH        = http://cdn.mathjax.org/mathjax/latest
-
-# The MATHJAX_EXTENSIONS tag can be used to specify one or more MathJax
-# extension names that should be enabled during MathJax rendering. For example
-# MATHJAX_EXTENSIONS = TeX/AMSmath TeX/AMSsymbols
-# This tag requires that the tag USE_MATHJAX is set to YES.
-
-MATHJAX_EXTENSIONS     =
-
-# The MATHJAX_CODEFILE tag can be used to specify a file with javascript pieces
-# of code that will be used on startup of the MathJax code. See the MathJax site
-# (see: http://docs.mathjax.org/en/latest/output.html) for more details. For an
-# example see the documentation.
-# This tag requires that the tag USE_MATHJAX is set to YES.
-
-MATHJAX_CODEFILE       =
-
-# When the SEARCHENGINE tag is enabled doxygen will generate a search box for
-# the HTML output. The underlying search engine uses javascript and DHTML and
-# should work on any modern browser. Note that when using HTML help
-# (GENERATE_HTMLHELP), Qt help (GENERATE_QHP), or docsets (GENERATE_DOCSET)
-# there is already a search function so this one should typically be disabled.
-# For large projects the javascript based search engine can be slow, then
-# enabling SERVER_BASED_SEARCH may provide a better solution. It is possible to
-# search using the keyboard; to jump to the search box use <access key> + S
-# (what the <access key> is depends on the OS and browser, but it is typically
-# <CTRL>, <ALT>/<option>, or both). Inside the search box use the <cursor down
-# key> to jump into the search results window, the results can be navigated
-# using the <cursor keys>. Press <Enter> to select an item or <escape> to cancel
-# the search. The filter options can be selected when the cursor is inside the
-# search box by pressing <Shift>+<cursor down>. Also here use the <cursor keys>
-# to select a filter and <Enter> or <escape> to activate or cancel the filter
-# option.
-# The default value is: YES.
-# This tag requires that the tag GENERATE_HTML is set to YES.
-
-SEARCHENGINE           = NO
-
-# When the SERVER_BASED_SEARCH tag is enabled the search engine will be
-# implemented using a web server instead of a web client using Javascript. There
-# are two flavours of web server based searching depending on the
-# EXTERNAL_SEARCH setting. When disabled, doxygen will generate a PHP script for
-# searching and an index file used by the script. When EXTERNAL_SEARCH is
-# enabled the indexing and searching needs to be provided by external tools. See
-# the section "External Indexing and Searching" for details.
-# The default value is: NO.
-# This tag requires that the tag SEARCHENGINE is set to YES.
-
-SERVER_BASED_SEARCH    = NO
-
-# When EXTERNAL_SEARCH tag is enabled doxygen will no longer generate the PHP
-# script for searching. Instead the search results are written to an XML file
-# which needs to be processed by an external indexer. Doxygen will invoke an
-# external search engine pointed to by the SEARCHENGINE_URL option to obtain the
-# search results.
-#
-# Doxygen ships with an example indexer ( doxyindexer) and search engine
-# (doxysearch.cgi) which are based on the open source search engine library
-# Xapian (see: http://xapian.org/).
-#
-# See the section "External Indexing and Searching" for details.
-# The default value is: NO.
-# This tag requires that the tag SEARCHENGINE is set to YES.
-
-EXTERNAL_SEARCH        = NO
-
-# The SEARCHENGINE_URL should point to a search engine hosted by a web server
-# which will return the search results when EXTERNAL_SEARCH is enabled.
-#
-# Doxygen ships with an example indexer ( doxyindexer) and search engine
-# (doxysearch.cgi) which are based on the open source search engine library
-# Xapian (see: http://xapian.org/). See the section "External Indexing and
-# Searching" for details.
-# This tag requires that the tag SEARCHENGINE is set to YES.
-
-SEARCHENGINE_URL       =
-
-# When SERVER_BASED_SEARCH and EXTERNAL_SEARCH are both enabled the unindexed
-# search data is written to a file for indexing by an external tool. With the
-# SEARCHDATA_FILE tag the name of this file can be specified.
-# The default file is: searchdata.xml.
-# This tag requires that the tag SEARCHENGINE is set to YES.
-
-SEARCHDATA_FILE        = searchdata.xml
-
-# When SERVER_BASED_SEARCH and EXTERNAL_SEARCH are both enabled the
-# EXTERNAL_SEARCH_ID tag can be used as an identifier for the project. This is
-# useful in combination with EXTRA_SEARCH_MAPPINGS to search through multiple
-# projects and redirect the results back to the right project.
-# This tag requires that the tag SEARCHENGINE is set to YES.
-
-EXTERNAL_SEARCH_ID     =
-
-# The EXTRA_SEARCH_MAPPINGS tag can be used to enable searching through doxygen
-# projects other than the one defined by this configuration file, but that are
-# all added to the same external search index. Each project needs to have a
-# unique id set via EXTERNAL_SEARCH_ID. The search mapping then maps the id of
-# to a relative location where the documentation can be found. The format is:
-# EXTRA_SEARCH_MAPPINGS = tagname1=loc1 tagname2=loc2 ...
-# This tag requires that the tag SEARCHENGINE is set to YES.
-
-EXTRA_SEARCH_MAPPINGS  =
-
-#---------------------------------------------------------------------------
-# Configuration options related to the LaTeX output
-#---------------------------------------------------------------------------
-
-# If the GENERATE_LATEX tag is set to YES doxygen will generate LaTeX output.
-# The default value is: YES.
-
-GENERATE_LATEX         = $(GENERATE_LATEX)
-
-# The LATEX_OUTPUT tag is used to specify where the LaTeX docs will be put. If a
-# relative path is entered the value of OUTPUT_DIRECTORY will be put in front of
-# it.
-# The default directory is: latex.
-# This tag requires that the tag GENERATE_LATEX is set to YES.
-
-LATEX_OUTPUT           = latex
-
-# The LATEX_CMD_NAME tag can be used to specify the LaTeX command name to be
-# invoked.
-#
-# Note that when enabling USE_PDFLATEX this option is only used for generating
-# bitmaps for formulas in the HTML output, but not in the Makefile that is
-# written to the output directory.
-# The default file is: latex.
-# This tag requires that the tag GENERATE_LATEX is set to YES.
-
-LATEX_CMD_NAME         =
-
-# The MAKEINDEX_CMD_NAME tag can be used to specify the command name to generate
-# index for LaTeX.
-# The default file is: makeindex.
-# This tag requires that the tag GENERATE_LATEX is set to YES.
-
-MAKEINDEX_CMD_NAME     =
-
-# If the COMPACT_LATEX tag is set to YES doxygen generates more compact LaTeX
-# documents. This may be useful for small projects and may help to save some
-# trees in general.
-# The default value is: NO.
-# This tag requires that the tag GENERATE_LATEX is set to YES.
-
-COMPACT_LATEX          = YES
-
-# The PAPER_TYPE tag can be used to set the paper type that is used by the
-# printer.
-# Possible values are: a4 (210 x 297 mm), letter (8.5 x 11 inches), legal (8.5 x
-# 14 inches) and executive (7.25 x 10.5 inches).
-# The default value is: a4.
-# This tag requires that the tag GENERATE_LATEX is set to YES.
-
-PAPER_TYPE             = $(PAPER_SIZE)
-
-# The EXTRA_PACKAGES tag can be used to specify one or more LaTeX package names
-# that should be included in the LaTeX output. To get the times font for
-# instance you can specify
-# EXTRA_PACKAGES=times
-# If left blank no extra packages will be included.
-# This tag requires that the tag GENERATE_LATEX is set to YES.
-
-EXTRA_PACKAGES         =
-
-# The LATEX_HEADER tag can be used to specify a personal LaTeX header for the
-# generated LaTeX document. The header should contain everything until the first
-# chapter. If it is left blank doxygen will generate a standard header. See
-# section "Doxygen usage" for information on how to let doxygen write the
-# default header to a separate file.
-#
-# Note: Only use a user-defined header if you know what you are doing! The
-# following commands have a special meaning inside the header: $title,
-# $datetime, $date, $doxygenversion, $projectname, $projectnumber. Doxygen will
-# replace them by respectively the title of the page, the current date and time,
-# only the current date, the version number of doxygen, the project name (see
-# PROJECT_NAME), or the project number (see PROJECT_NUMBER).
-# This tag requires that the tag GENERATE_LATEX is set to YES.
-
-LATEX_HEADER           =
-
-# The LATEX_FOOTER tag can be used to specify a personal LaTeX footer for the
-# generated LaTeX document. The footer should contain everything after the last
-# chapter. If it is left blank doxygen will generate a standard footer.
-#
-# Note: Only use a user-defined footer if you know what you are doing!
-# This tag requires that the tag GENERATE_LATEX is set to YES.
-
-LATEX_FOOTER           =
-
-# The LATEX_EXTRA_FILES tag can be used to specify one or more extra images or
-# other source files which should be copied to the LATEX_OUTPUT output
-# directory. Note that the files will be copied as-is; there are no commands or
-# markers available.
-# This tag requires that the tag GENERATE_LATEX is set to YES.
-
-LATEX_EXTRA_FILES      =
-
-# If the PDF_HYPERLINKS tag is set to YES, the LaTeX that is generated is
-# prepared for conversion to PDF (using ps2pdf or pdflatex). The PDF file will
-# contain links (just like the HTML output) instead of page references. This
-# makes the output suitable for online browsing using a PDF viewer.
-# The default value is: YES.
-# This tag requires that the tag GENERATE_LATEX is set to YES.
-
-PDF_HYPERLINKS         = YES
-
-# If the LATEX_PDFLATEX tag is set to YES, doxygen will use pdflatex to generate
-# the PDF file directly from the LaTeX files. Set this option to YES to get a
-# higher quality PDF documentation.
-# The default value is: YES.
-# This tag requires that the tag GENERATE_LATEX is set to YES.
-
-USE_PDFLATEX           = $(GENERATE_PDF)
-
-# If the LATEX_BATCHMODE tag is set to YES, doxygen will add the \batchmode
-# command to the generated LaTeX files. This will instruct LaTeX to keep running
-# if errors occur, instead of asking the user for help. This option is also used
-# when generating formulas in HTML.
-# The default value is: NO.
-# This tag requires that the tag GENERATE_LATEX is set to YES.
-
-LATEX_BATCHMODE        = YES
-
-# If the LATEX_HIDE_INDICES tag is set to YES then doxygen will not include the
-# index chapters (such as File Index, Compound Index, etc.) in the output.
-# The default value is: NO.
-# This tag requires that the tag GENERATE_LATEX is set to YES.
-
-LATEX_HIDE_INDICES     = NO
-
-# The LATEX_BIB_STYLE tag can be used to specify the style to use for the
-# bibliography, e.g. plainnat, or ieeetr. See
-# http://en.wikipedia.org/wiki/BibTeX and \cite for more info.
-# The default value is: plain.
-# This tag requires that the tag GENERATE_LATEX is set to YES.
-
-LATEX_BIB_STYLE        = plain
-
-#---------------------------------------------------------------------------
-# Configuration options related to the RTF output
-#---------------------------------------------------------------------------
-
-# If the GENERATE_RTF tag is set to YES doxygen will generate RTF output. The
-# RTF output is optimized for Word 97 and may not look too pretty with other RTF
-# readers/editors.
-# The default value is: NO.
-
-GENERATE_RTF           = $(GENERATE_RTF)
-
-# The RTF_OUTPUT tag is used to specify where the RTF docs will be put. If a
-# relative path is entered the value of OUTPUT_DIRECTORY will be put in front of
-# it.
-# The default directory is: rtf.
-# This tag requires that the tag GENERATE_RTF is set to YES.
-
-RTF_OUTPUT             = rtf
-
-# If the COMPACT_RTF tag is set to YES doxygen generates more compact RTF
-# documents. This may be useful for small projects and may help to save some
-# trees in general.
-# The default value is: NO.
-# This tag requires that the tag GENERATE_RTF is set to YES.
-
-COMPACT_RTF            = YES
-
-# If the RTF_HYPERLINKS tag is set to YES, the RTF that is generated will
-# contain hyperlink fields. The RTF file will contain links (just like the HTML
-# output) instead of page references. This makes the output suitable for online
-# browsing using Word or some other Word compatible readers that support those
-# fields.
-#
-# Note: WordPad (write) and others do not support links.
-# The default value is: NO.
-# This tag requires that the tag GENERATE_RTF is set to YES.
-
-RTF_HYPERLINKS         = NO
-
-# Load stylesheet definitions from file. Syntax is similar to doxygen's config
-# file, i.e. a series of assignments. You only have to provide replacements,
-# missing definitions are set to their default value.
-#
-# See also section "Doxygen usage" for information on how to generate the
-# default style sheet that doxygen normally uses.
-# This tag requires that the tag GENERATE_RTF is set to YES.
-
-RTF_STYLESHEET_FILE    =
-
-# Set optional variables used in the generation of an RTF document. Syntax is
-# similar to doxygen's config file. A template extensions file can be generated
-# using doxygen -e rtf extensionFile.
-# This tag requires that the tag GENERATE_RTF is set to YES.
-
-RTF_EXTENSIONS_FILE    =
-
-#---------------------------------------------------------------------------
-# Configuration options related to the man page output
-#---------------------------------------------------------------------------
-
-# If the GENERATE_MAN tag is set to YES doxygen will generate man pages for
-# classes and files.
-# The default value is: NO.
-
-GENERATE_MAN           = $(GENERATE_MAN)
-
-# The MAN_OUTPUT tag is used to specify where the man pages will be put. If a
-# relative path is entered the value of OUTPUT_DIRECTORY will be put in front of
-# it. A directory man3 will be created inside the directory specified by
-# MAN_OUTPUT.
-# The default directory is: man.
-# This tag requires that the tag GENERATE_MAN is set to YES.
-
-MAN_OUTPUT             = man
-
-# The MAN_EXTENSION tag determines the extension that is added to the generated
-# man pages. In case the manual section does not start with a number, the number
-# 3 is prepended. The dot (.) at the beginning of the MAN_EXTENSION tag is
-# optional.
-# The default value is: .3.
-# This tag requires that the tag GENERATE_MAN is set to YES.
-
-MAN_EXTENSION          = .3
-
-# If the MAN_LINKS tag is set to YES and doxygen generates man output, then it
-# will generate one additional man file for each entity documented in the real
-# man page(s). These additional files only source the real man page, but without
-# them the man command would be unable to find the correct page.
-# The default value is: NO.
-# This tag requires that the tag GENERATE_MAN is set to YES.
-
-MAN_LINKS              = NO
-
-#---------------------------------------------------------------------------
-# Configuration options related to the XML output
-#---------------------------------------------------------------------------
-
-# If the GENERATE_XML tag is set to YES doxygen will generate an XML file that
-# captures the structure of the code including all documentation.
-# The default value is: NO.
-
-GENERATE_XML           = $(GENERATE_XML)
-
-# The XML_OUTPUT tag is used to specify where the XML pages will be put. If a
-# relative path is entered the value of OUTPUT_DIRECTORY will be put in front of
-# it.
-# The default directory is: xml.
-# This tag requires that the tag GENERATE_XML is set to YES.
-
-XML_OUTPUT             = xml
-
-# If the XML_PROGRAMLISTING tag is set to YES doxygen will dump the program
-# listings (including syntax highlighting and cross-referencing information) to
-# the XML output. Note that enabling this will significantly increase the size
-# of the XML output.
-# The default value is: YES.
-# This tag requires that the tag GENERATE_XML is set to YES.
-
-XML_PROGRAMLISTING     = YES
-
-#---------------------------------------------------------------------------
-# Configuration options related to the DOCBOOK output
-#---------------------------------------------------------------------------
-
-# If the GENERATE_DOCBOOK tag is set to YES doxygen will generate Docbook files
-# that can be used to generate PDF.
-# The default value is: NO.
-
-GENERATE_DOCBOOK       = NO
-
-# The DOCBOOK_OUTPUT tag is used to specify where the Docbook pages will be put.
-# If a relative path is entered the value of OUTPUT_DIRECTORY will be put in
-# front of it.
-# The default directory is: docbook.
-# This tag requires that the tag GENERATE_DOCBOOK is set to YES.
-
-DOCBOOK_OUTPUT         = docbook
-
-#---------------------------------------------------------------------------
-# Configuration options for the AutoGen Definitions output
-#---------------------------------------------------------------------------
-
-# If the GENERATE_AUTOGEN_DEF tag is set to YES doxygen will generate an AutoGen
-# Definitions (see http://autogen.sf.net) file that captures the structure of
-# the code including all documentation. Note that this feature is still
-# experimental and incomplete at the moment.
-# The default value is: NO.
-
-GENERATE_AUTOGEN_DEF   = NO
-
-#---------------------------------------------------------------------------
-# Configuration options related to the Perl module output
-#---------------------------------------------------------------------------
-
-# If the GENERATE_PERLMOD tag is set to YES doxygen will generate a Perl module
-# file that captures the structure of the code including all documentation.
-#
-# Note that this feature is still experimental and incomplete at the moment.
-# The default value is: NO.
-
-GENERATE_PERLMOD       = NO
-
-# If the PERLMOD_LATEX tag is set to YES doxygen will generate the necessary
-# Makefile rules, Perl scripts and LaTeX code to be able to generate PDF and DVI
-# output from the Perl module output.
-# The default value is: NO.
-# This tag requires that the tag GENERATE_PERLMOD is set to YES.
-
-PERLMOD_LATEX          = NO
-
-# If the PERLMOD_PRETTY tag is set to YES the Perl module output will be nicely
-# formatted so it can be parsed by a human reader. This is useful if you want to
-# understand what is going on. On the other hand, if this tag is set to NO the
-# size of the Perl module output will be much smaller and Perl will parse it
-# just the same.
-# The default value is: YES.
-# This tag requires that the tag GENERATE_PERLMOD is set to YES.
-
-PERLMOD_PRETTY         = YES
-
-# The names of the make variables in the generated doxyrules.make file are
-# prefixed with the string contained in PERLMOD_MAKEVAR_PREFIX. This is useful
-# so different doxyrules.make files included by the same Makefile don't
-# overwrite each other's variables.
-# This tag requires that the tag GENERATE_PERLMOD is set to YES.
-
-PERLMOD_MAKEVAR_PREFIX =
-
-#---------------------------------------------------------------------------
-# Configuration options related to the preprocessor
-#---------------------------------------------------------------------------
-
-# If the ENABLE_PREPROCESSING tag is set to YES doxygen will evaluate all
-# C-preprocessor directives found in the sources and include files.
-# The default value is: YES.
-
-ENABLE_PREPROCESSING   = YES
-
-# If the MACRO_EXPANSION tag is set to YES doxygen will expand all macro names
-# in the source code. If set to NO only conditional compilation will be
-# performed. Macro expansion can be done in a controlled way by setting
-# EXPAND_ONLY_PREDEF to YES.
-# The default value is: NO.
-# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
-
-MACRO_EXPANSION        = YES
-
-# If the EXPAND_ONLY_PREDEF and MACRO_EXPANSION tags are both set to YES then
-# the macro expansion is limited to the macros specified with the PREDEFINED and
-# EXPAND_AS_DEFINED tags.
-# The default value is: NO.
-# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
-
-EXPAND_ONLY_PREDEF     = YES
-
-# If the SEARCH_INCLUDES tag is set to YES the includes files in the
-# INCLUDE_PATH will be searched if a #include is found.
-# The default value is: YES.
-# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
-
-SEARCH_INCLUDES        = YES
-
-# The INCLUDE_PATH tag can be used to specify one or more directories that
-# contain include files that are not input files but should be processed by the
-# preprocessor.
-# This tag requires that the tag SEARCH_INCLUDES is set to YES.
-
-INCLUDE_PATH           = .
-
-# You can use the INCLUDE_FILE_PATTERNS tag to specify one or more wildcard
-# patterns (like *.h and *.hpp) to filter out the header-files in the
-# directories. If left blank, the patterns specified with FILE_PATTERNS will be
-# used.
-# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
-
-INCLUDE_FILE_PATTERNS  =
-
-# The PREDEFINED tag can be used to specify one or more macro names that are
-# defined before the preprocessor is started (similar to the -D option of e.g.
-# gcc). The argument of the tag is a list of macros of the form: name or
-# name=definition (no spaces). If the definition and the "=" are omitted, "=1"
-# is assumed. To prevent a macro definition from being undefined via #undef or
-# recursively expanded use the := operator instead of the = operator.
-# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
-
-PREDEFINED             = _DOXYGEN \
-			 __attribute__(x)= \
-			 __cdecl=
-
-# If the MACRO_EXPANSION and EXPAND_ONLY_PREDEF tags are set to YES then this
-# tag can be used to specify a list of macro names that should be expanded. The
-# macro definition that is found in the sources will be used. Use the PREDEFINED
-# tag if you want to use a different macro definition that overrules the
-# definition found in the source code.
-# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
-
-EXPAND_AS_DEFINED      = EASY_TYPE \
-                         EASY_DESTRUCTOR \
-                         EASY_METHOD
-
-# If the SKIP_FUNCTION_MACROS tag is set to YES then doxygen's preprocessor will
-# remove all refrences to function-like macros that are alone on a line, have an
-# all uppercase name, and do not end with a semicolon. Such function macros are
-# typically used for boiler-plate code, and will confuse the parser if not
-# removed.
-# The default value is: YES.
-# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
-
-SKIP_FUNCTION_MACROS   = YES
-
-#---------------------------------------------------------------------------
-# Configuration options related to external references
-#---------------------------------------------------------------------------
-
-# The TAGFILES tag can be used to specify one or more tag files. For each tag
-# file the location of the external documentation should be added. The format of
-# a tag file without this location is as follows:
-# TAGFILES = file1 file2 ...
-# Adding location for the tag files is done as follows:
-# TAGFILES = file1=loc1 "file2 = loc2" ...
-# where loc1 and loc2 can be relative or absolute paths or URLs. See the
-# section "Linking to external documentation" for more information about the use
-# of tag files.
-# Note: Each tag file must have an unique name (where the name does NOT include
-# the path). If a tag file is not located in the directory in which doxygen is
-# run, you must also specify the path to the tagfile here.
-
-TAGFILES               =
-
-# When a file name is specified after GENERATE_TAGFILE, doxygen will create a
-# tag file that is based on the input files it reads. See section "Linking to
-# external documentation" for more information about the usage of tag files.
-
-GENERATE_TAGFILE       = $(DOCDIR)/$(PROJECT).tag
-
-# If the ALLEXTERNALS tag is set to YES all external class will be listed in the
-# class index. If set to NO only the inherited external classes will be listed.
-# The default value is: NO.
-
-ALLEXTERNALS           = NO
-
-# If the EXTERNAL_GROUPS tag is set to YES all external groups will be listed in
-# the modules index. If set to NO, only the current project's groups will be
-# listed.
-# The default value is: YES.
-
-EXTERNAL_GROUPS        = YES
-
-# If the EXTERNAL_PAGES tag is set to YES all external pages will be listed in
-# the related pages index. If set to NO, only the current project's pages will
-# be listed.
-# The default value is: YES.
-
-EXTERNAL_PAGES         = YES
-
-#---------------------------------------------------------------------------
-# Configuration options related to the dot tool
-#---------------------------------------------------------------------------
-
-# You can include diagrams made with dia in doxygen documentation. Doxygen will
-# then run dia to produce the diagram and insert it in the documentation. The
-# DIA_PATH tag allows you to specify the directory where the dia binary resides.
-# If left empty dia is assumed to be found in the default search path.
-
-DIA_PATH               =
-
-# If set to YES, the inheritance and collaboration graphs will hide inheritance
-# and usage relations if the target is undocumented or is not a class.
-# The default value is: YES.
-
-HIDE_UNDOC_RELATIONS   = YES
-
-# If you set the HAVE_DOT tag to YES then doxygen will assume the dot tool is
-# available from the path. This tool is part of Graphviz (see:
-# http://www.graphviz.org/), a graph visualization toolkit from AT&T and Lucent
-# Bell Labs. The other options in this section have no effect if this option is
-# set to NO
-# The default value is: NO.
-
-HAVE_DOT               = $(HAVE_DOT)
-
-# The DOT_NUM_THREADS specifies the number of dot invocations doxygen is allowed
-# to run in parallel. When set to 0 doxygen will base this on the number of
-# processors available in the system. You can set it explicitly to a value
-# larger than 0 to get control over the balance between CPU load and processing
-# speed.
-# Minimum value: 0, maximum value: 32, default value: 0.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-DOT_NUM_THREADS        = 0
-
-# When you want a differently looking font n the dot files that doxygen
-# generates you can specify the font name using DOT_FONTNAME. You need to make
-# sure dot is able to find the font, which can be done by putting it in a
-# standard location or by setting the DOTFONTPATH environment variable or by
-# setting DOT_FONTPATH to the directory containing the font.
-# The default value is: Helvetica.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-DOT_FONTNAME           = Helvetica
-
-# The DOT_FONTSIZE tag can be used to set the size (in points) of the font of
-# dot graphs.
-# Minimum value: 4, maximum value: 24, default value: 10.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-DOT_FONTSIZE           = 10
-
-# By default doxygen will tell dot to use the default font as specified with
-# DOT_FONTNAME. If you specify a different font using DOT_FONTNAME you can set
-# the path where dot can find it using this tag.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-DOT_FONTPATH           =
-
-# If the CLASS_GRAPH tag is set to YES then doxygen will generate a graph for
-# each documented class showing the direct and indirect inheritance relations.
-# Setting this tag to YES will force the CLASS_DIAGRAMS tag to NO.
-# The default value is: YES.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-CLASS_GRAPH            = YES
-
-# If the COLLABORATION_GRAPH tag is set to YES then doxygen will generate a
-# graph for each documented class showing the direct and indirect implementation
-# dependencies (inheritance, containment, and class references variables) of the
-# class with other documented classes.
-# The default value is: YES.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-COLLABORATION_GRAPH    = YES
-
-# If the GROUP_GRAPHS tag is set to YES then doxygen will generate a graph for
-# groups, showing the direct groups dependencies.
-# The default value is: YES.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-GROUP_GRAPHS           = YES
-
-# If the UML_LOOK tag is set to YES doxygen will generate inheritance and
-# collaboration diagrams in a style similar to the OMG's Unified Modeling
-# Language.
-# The default value is: NO.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-UML_LOOK               = NO
-
-# If the UML_LOOK tag is enabled, the fields and methods are shown inside the
-# class node. If there are many fields or methods and many nodes the graph may
-# become too big to be useful. The UML_LIMIT_NUM_FIELDS threshold limits the
-# number of items for each type to make the size more manageable. Set this to 0
-# for no limit. Note that the threshold may be exceeded by 50% before the limit
-# is enforced. So when you set the threshold to 10, up to 15 fields may appear,
-# but if the number exceeds 15, the total amount of fields shown is limited to
-# 10.
-# Minimum value: 0, maximum value: 100, default value: 10.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-UML_LIMIT_NUM_FIELDS   = 10
-
-# If the TEMPLATE_RELATIONS tag is set to YES then the inheritance and
-# collaboration graphs will show the relations between templates and their
-# instances.
-# The default value is: NO.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-TEMPLATE_RELATIONS     = YES
-
-# If the INCLUDE_GRAPH, ENABLE_PREPROCESSING and SEARCH_INCLUDES tags are set to
-# YES then doxygen will generate a graph for each documented file showing the
-# direct and indirect include dependencies of the file with other documented
-# files.
-# The default value is: YES.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-INCLUDE_GRAPH          = YES
-
-# If the INCLUDED_BY_GRAPH, ENABLE_PREPROCESSING and SEARCH_INCLUDES tags are
-# set to YES then doxygen will generate a graph for each documented file showing
-# the direct and indirect include dependencies of the file with other documented
-# files.
-# The default value is: YES.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-INCLUDED_BY_GRAPH      = YES
-
-# If the CALL_GRAPH tag is set to YES then doxygen will generate a call
-# dependency graph for every global function or class method.
-#
-# Note that enabling this option will significantly increase the time of a run.
-# So in most cases it will be better to enable call graphs for selected
-# functions only using the \callgraph command.
-# The default value is: NO.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-CALL_GRAPH             = NO
-
-# If the CALLER_GRAPH tag is set to YES then doxygen will generate a caller
-# dependency graph for every global function or class method.
-#
-# Note that enabling this option will significantly increase the time of a run.
-# So in most cases it will be better to enable caller graphs for selected
-# functions only using the \callergraph command.
-# The default value is: NO.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-CALLER_GRAPH           = NO
-
-# If the GRAPHICAL_HIERARCHY tag is set to YES then doxygen will graphical
-# hierarchy of all classes instead of a textual one.
-# The default value is: YES.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-GRAPHICAL_HIERARCHY    = YES
-
-# If the DIRECTORY_GRAPH tag is set to YES then doxygen will show the
-# dependencies a directory has on other directories in a graphical way. The
-# dependency relations are determined by the #include relations between the
-# files in the directories.
-# The default value is: YES.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-DIRECTORY_GRAPH        = YES
-
-# The DOT_IMAGE_FORMAT tag can be used to set the image format of the images
-# generated by dot.
-# Note: If you choose svg you need to set HTML_FILE_EXTENSION to xhtml in order
-# to make the SVG files visible in IE 9+ (other browsers do not have this
-# requirement).
-# Possible values are: png, jpg, gif and svg.
-# The default value is: png.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-DOT_IMAGE_FORMAT       = png
-
-# If DOT_IMAGE_FORMAT is set to svg, then this option can be set to YES to
-# enable generation of interactive SVG images that allow zooming and panning.
-#
-# Note that this requires a modern browser other than Internet Explorer. Tested
-# and working are Firefox, Chrome, Safari, and Opera.
-# Note: For IE 9+ you need to set HTML_FILE_EXTENSION to xhtml in order to make
-# the SVG files visible. Older versions of IE do not have SVG support.
-# The default value is: NO.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-INTERACTIVE_SVG        = NO
-
-# The DOT_PATH tag can be used to specify the path where the dot tool can be
-# found. If left blank, it is assumed the dot tool can be found in the path.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-DOT_PATH               = $(DOT_PATH)
-
-# The DOTFILE_DIRS tag can be used to specify one or more directories that
-# contain dot files that are included in the documentation (see the \dotfile
-# command).
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-DOTFILE_DIRS           =
-
-# The MSCFILE_DIRS tag can be used to specify one or more directories that
-# contain msc files that are included in the documentation (see the \mscfile
-# command).
-
-MSCFILE_DIRS           =
-
-# The DIAFILE_DIRS tag can be used to specify one or more directories that
-# contain dia files that are included in the documentation (see the \diafile
-# command).
-
-DIAFILE_DIRS           =
-
-# The DOT_GRAPH_MAX_NODES tag can be used to set the maximum number of nodes
-# that will be shown in the graph. If the number of nodes in a graph becomes
-# larger than this value, doxygen will truncate the graph, which is visualized
-# by representing a node as a red box. Note that doxygen if the number of direct
-# children of the root node in a graph is already larger than
-# DOT_GRAPH_MAX_NODES then the graph will not be shown at all. Also note that
-# the size of a graph can be further restricted by MAX_DOT_GRAPH_DEPTH.
-# Minimum value: 0, maximum value: 10000, default value: 50.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-DOT_GRAPH_MAX_NODES    = 50
-
-# The MAX_DOT_GRAPH_DEPTH tag can be used to set the maximum depth of the graphs
-# generated by dot. A depth value of 3 means that only nodes reachable from the
-# root by following a path via at most 3 edges will be shown. Nodes that lay
-# further from the root node will be omitted. Note that setting this option to 1
-# or 2 may greatly reduce the computation time needed for large code bases. Also
-# note that the size of a graph can be further restricted by
-# DOT_GRAPH_MAX_NODES. Using a depth of 0 means no depth restriction.
-# Minimum value: 0, maximum value: 1000, default value: 0.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-MAX_DOT_GRAPH_DEPTH    = 0
-
-# Set the DOT_TRANSPARENT tag to YES to generate images with a transparent
-# background. This is disabled by default, because dot on Windows does not seem
-# to support this out of the box.
-#
-# Warning: Depending on the platform used, enabling this option may lead to
-# badly anti-aliased labels on the edges of a graph (i.e. they become hard to
-# read).
-# The default value is: NO.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-DOT_TRANSPARENT        = NO
-
-# Set the DOT_MULTI_TARGETS tag to YES allow dot to generate multiple output
-# files in one run (i.e. multiple -o and -T options on the command line). This
-# makes dot run faster, but since only newer versions of dot (>1.8.10) support
-# this, this feature is disabled by default.
-# The default value is: NO.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-DOT_MULTI_TARGETS      = NO
-
-# If the GENERATE_LEGEND tag is set to YES doxygen will generate a legend page
-# explaining the meaning of the various boxes and arrows in the dot generated
-# graphs.
-# The default value is: YES.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-GENERATE_LEGEND        = YES
-
-# If the DOT_CLEANUP tag is set to YES doxygen will remove the intermediate dot
-# files that are used to generate the various graphs.
-# The default value is: YES.
-# This tag requires that the tag HAVE_DOT is set to YES.
-
-DOT_CLEANUP            = YES
diff --git a/lib/Makefile.am b/lib/Makefile.am
deleted file mode 100644
index a105c95a17ef..000000000000
--- a/lib/Makefile.am
+++ /dev/null
@@ -1,13 +0,0 @@
-SUBDIRS = \
-	libv4lconvert \
-	libv4l2 \
-	libv4l1 \
-	libv4l2rds \
-	libv4l-mplane
-
-if WITH_LIBDVBV5
-SUBDIRS += \
-	libdvbv5
-endif
-
-EXTRA_DIST = Android.mk
diff --git a/lib/libdvbv5/Makefile.am b/lib/libdvbv5/Makefile.am
deleted file mode 100644
index 683ae3fb007b..000000000000
--- a/lib/libdvbv5/Makefile.am
+++ /dev/null
@@ -1,126 +0,0 @@
-if WITH_LIBDVBV5
-lib_LTLIBRARIES = libdvbv5.la
-
-otherincludedir = $(includedir)/libdvbv5
-otherinclude_HEADERS = \
-	../include/libdvbv5/libdvb-version.h \
-	../include/libdvbv5/dvb-demux.h \
-	../include/libdvbv5/dvb-v5-std.h \
-	../include/libdvbv5/dvb-file.h \
-	../include/libdvbv5/countries.h \
-	../include/libdvbv5/crc32.h \
-	../include/libdvbv5/dvb-dev.h \
-	../include/libdvbv5/dvb-frontend.h \
-	../include/libdvbv5/dvb-fe.h \
-	../include/libdvbv5/dvb-sat.h \
-	../include/libdvbv5/dvb-scan.h \
-	../include/libdvbv5/dvb-log.h \
-	../include/libdvbv5/descriptors.h \
-	../include/libdvbv5/header.h \
-	../include/libdvbv5/pat.h \
-	../include/libdvbv5/pmt.h \
-	../include/libdvbv5/desc_language.h \
-	../include/libdvbv5/desc_network_name.h \
-	../include/libdvbv5/desc_cable_delivery.h \
-	../include/libdvbv5/desc_sat.h \
-	../include/libdvbv5/desc_terrestrial_delivery.h \
-	../include/libdvbv5/desc_t2_delivery.h \
-	../include/libdvbv5/desc_service.h \
-	../include/libdvbv5/desc_frequency_list.h \
-	../include/libdvbv5/desc_registration_id.h \
-	../include/libdvbv5/desc_event_short.h \
-	../include/libdvbv5/desc_event_extended.h \
-	../include/libdvbv5/desc_atsc_service_location.h \
-	../include/libdvbv5/desc_hierarchy.h \
-	../include/libdvbv5/desc_extension.h \
-	../include/libdvbv5/desc_isdbt_delivery.h \
-	../include/libdvbv5/desc_logical_channel.h \
-	../include/libdvbv5/desc_ts_info.h \
-	../include/libdvbv5/desc_partial_reception.h \
-	../include/libdvbv5/desc_ca.h \
-	../include/libdvbv5/desc_ca_identifier.h \
-	../include/libdvbv5/nit.h \
-	../include/libdvbv5/sdt.h \
-	../include/libdvbv5/vct.h \
-	../include/libdvbv5/atsc_header.h \
-	../include/libdvbv5/mgt.h \
-	../include/libdvbv5/eit.h \
-	../include/libdvbv5/cat.h \
-	../include/libdvbv5/atsc_eit.h \
-	../include/libdvbv5/mpeg_ts.h \
-	../include/libdvbv5/mpeg_pes.h \
-	../include/libdvbv5/mpeg_es.h
-
-pkgconfig_DATA = libdvbv5.pc
-LIBDVBV5_VERSION = -version-info 0
-else
-noinst_LTLIBRARIES = libdvbv5.la
-endif
-
-libdvbv5_la_SOURCES = \
-        compat-soname.c \
-	crc32.c \
-	countries.c \
-	dvb-legacy-channel-format.c \
-	dvb-zap-format.c \
-	dvb-vdr-format.c \
-	dvb-v5.c	 \
-	dvb-v5.h	 \
-	parse_string.c	 \
-	parse_string.h	 \
-	dvb-demux.c	 \
-	dvb-dev.c	 \
-	dvb-dev-local.c	 \
-	dvb-dev-priv.h   \
-	dvb-fe.c	 \
-	dvb-fe-priv.h    \
-	dvb-log.c	 \
-	dvb-file.c	 \
-	dvb-v5-std.c	 \
-	dvb-sat.c	 \
-	dvb-scan.c	 \
-	descriptors.c	 \
-	tables/header.c		\
-	tables/pat.c		\
-	tables/pmt.c		\
-	tables/nit.c		\
-	tables/sdt.c		\
-	tables/vct.c		\
-	tables/mgt.c		\
-	tables/eit.c		\
-	tables/cat.c		\
-	tables/atsc_eit.c	\
-	tables/mpeg_ts.c	\
-	tables/mpeg_pes.c	\
-	tables/mpeg_es.c	\
-	descriptors/desc_language.c		\
-	descriptors/desc_network_name.c		\
-	descriptors/desc_cable_delivery.c	\
-	descriptors/desc_sat.c			\
-	descriptors/desc_terrestrial_delivery.c \
-	descriptors/desc_t2_delivery.c		\
-	descriptors/desc_service.c		\
-	descriptors/desc_registration_id.c	\
-	descriptors/desc_frequency_list.c	\
-	descriptors/desc_event_short.c		\
-	descriptors/desc_event_extended.c	\
-	descriptors/desc_atsc_service_location.c \
-	descriptors/desc_hierarchy.c		\
-	descriptors/desc_extension.c		\
-	descriptors/desc_isdbt_delivery.c	\
-	descriptors/desc_logical_channel.c	\
-	descriptors/desc_ts_info.c		\
-	descriptors/desc_partial_reception.c	\
-	descriptors/desc_ca.c			\
-	descriptors/desc_ca_identifier.c
-
-if WITH_DVBV5_REMOTE
-libdvbv5_la_SOURCES += \
-	dvb-dev-remote.c
-endif
-
-libdvbv5_la_CPPFLAGS = -I../.. $(ENFORCE_LIBDVBV5_STATIC) $(LIBUDEV_CFLAGS) $(PTHREAD_CFLAGS)
-libdvbv5_la_LDFLAGS = $(LIBDVBV5_VERSION) $(ENFORCE_LIBDVBV5_STATIC) $(LIBUDEV_LIBS) -lm -lrt
-libdvbv5_la_LIBADD = $(LTLIBICONV)
-
-EXTRA_DIST = README gen_dvb_structs.pl
diff --git a/lib/libdvbv5/libdvbv5.pc.in b/lib/libdvbv5/libdvbv5.pc.in
deleted file mode 100644
index 6b5f292d79a9..000000000000
--- a/lib/libdvbv5/libdvbv5.pc.in
+++ /dev/null
@@ -1,11 +0,0 @@
-prefix=@prefix@
-exec_prefix=@exec_prefix@
-includedir=@includedir@
-libdir=@libdir@
-
-Name: libdvbv5
-Description: DVBv5 utility library
-Version: @PACKAGE_VERSION@
-Requires.private: libudev
-Libs: -L${libdir} -ldvbv5
-Cflags: -I${includedir}
diff --git a/lib/libv4l-mplane/Makefile.am b/lib/libv4l-mplane/Makefile.am
deleted file mode 100644
index 5264ecf227af..000000000000
--- a/lib/libv4l-mplane/Makefile.am
+++ /dev/null
@@ -1,7 +0,0 @@
-if WITH_V4L_PLUGINS
-libv4l2plugin_LTLIBRARIES = libv4l-mplane.la
-endif
-
-libv4l_mplane_la_SOURCES = libv4l-mplane.c
-libv4l_mplane_la_CPPFLAGS = $(CFLAG_VISIBILITY)
-libv4l_mplane_la_LDFLAGS = -avoid-version -module -shared -export-dynamic -lpthread
diff --git a/lib/libv4l1/Makefile.am b/lib/libv4l1/Makefile.am
deleted file mode 100644
index 42cb3dbb88be..000000000000
--- a/lib/libv4l1/Makefile.am
+++ /dev/null
@@ -1,29 +0,0 @@
-if WITH_DYN_LIBV4L
-lib_LTLIBRARIES = libv4l1.la
-include_HEADERS = ../include/libv4l1.h ../include/libv4l1-videodev.h
-pkgconfig_DATA = libv4l1.pc
-LIBV4L1_VERSION = -version-info 0
-if WITH_V4L_WRAPPERS
-libv4l1priv_LTLIBRARIES = v4l1compat.la
-
-install-exec-hook:
-	$(mkdir_p) $(DESTDIR)/$(libdir)
-	(cd $(DESTDIR)/$(libdir) && rm -f v4l1compat.so && $(LN_S) $(libv4l1subdir)/v4l1compat.so v4l1compat.so)
-
-endif
-else
-noinst_LTLIBRARIES = libv4l1.la
-endif
-
-libv4l1_la_SOURCES = libv4l1.c log.c libv4l1-priv.h
-libv4l1_la_CPPFLAGS = $(CFLAG_VISIBILITY) $(ENFORCE_LIBV4L_STATIC)
-libv4l1_la_LDFLAGS = $(LIBV4L1_VERSION) -lpthread $(ENFORCE_LIBV4L_STATIC)
-libv4l1_la_LIBADD = ../libv4l2/libv4l2.la
-
-v4l1compat_la_SOURCES = v4l1compat.c
-
-v4l1compat_la_LIBADD = libv4l1.la
-v4l1compat_la_LDFLAGS = -avoid-version -module -shared -export-dynamic
-v4l1compat_la_LIBTOOLFLAGS = --tag=disable-static
-
-EXTRA_DIST = libv4l1-kernelcode-license.txt
diff --git a/lib/libv4l1/libv4l1.pc.in b/lib/libv4l1/libv4l1.pc.in
deleted file mode 100644
index b4d745374078..000000000000
--- a/lib/libv4l1/libv4l1.pc.in
+++ /dev/null
@@ -1,12 +0,0 @@
-prefix=@prefix@
-exec_prefix=@exec_prefix@
-includedir=@includedir@
-libdir=@libdir@
-
-Name: libv4l1
-Description: v4l1 compatibility library
-Version: @PACKAGE_VERSION@
-Requires.private: libv4l2
-Libs: -L${libdir} -lv4l1
-Libs.private: -lpthread
-Cflags: -I${includedir}
diff --git a/lib/libv4l2/Makefile.am b/lib/libv4l2/Makefile.am
deleted file mode 100644
index 3a1bb901afd2..000000000000
--- a/lib/libv4l2/Makefile.am
+++ /dev/null
@@ -1,32 +0,0 @@
-if WITH_DYN_LIBV4L
-lib_LTLIBRARIES = libv4l2.la
-include_HEADERS = ../include/libv4l2.h ../include/libv4l-plugin.h
-pkgconfig_DATA = libv4l2.pc
-LIBV4L2_VERSION = -version-info 0
-if WITH_V4L_WRAPPERS
-libv4l2priv_LTLIBRARIES = v4l2convert.la
-
-install-exec-hook:
-	$(mkdir_p) $(DESTDIR)/$(libdir)
-	(cd $(DESTDIR)/$(libdir) && rm -f v4l2convert.so && $(LN_S) $(libv4l2subdir)/v4l2convert.so v4l2convert.so)
-
-endif
-else
-noinst_LTLIBRARIES = libv4l2.la
-endif
-
-libv4l2_la_SOURCES = libv4l2.c log.c libv4l2-priv.h
-if WITH_V4L_PLUGINS
-libv4l2_la_SOURCES += v4l2-plugin.c
-endif
-
-libv4l2_la_CPPFLAGS = $(CFLAG_VISIBILITY) $(ENFORCE_LIBV4L_STATIC)
-libv4l2_la_LDFLAGS = $(LIBV4L2_VERSION) -lpthread $(DLOPEN_LIBS) $(ENFORCE_LIBV4L_STATIC)
-libv4l2_la_LIBADD = ../libv4lconvert/libv4lconvert.la
-
-v4l2convert_la_SOURCES = v4l2convert.c
-v4l2convert_la_LIBADD = libv4l2.la
-v4l2convert_la_LDFLAGS = -avoid-version -module -shared -export-dynamic
-v4l2convert_la_LIBTOOLFLAGS = --tag=disable-static
-
-EXTRA_DIST = Android.mk v4l2-plugin-android.c
diff --git a/lib/libv4l2/libv4l2.pc.in b/lib/libv4l2/libv4l2.pc.in
deleted file mode 100644
index 37ba4fe5db3e..000000000000
--- a/lib/libv4l2/libv4l2.pc.in
+++ /dev/null
@@ -1,12 +0,0 @@
-prefix=@prefix@
-exec_prefix=@exec_prefix@
-includedir=@includedir@
-libdir=@libdir@
-
-Name: libv4l2
-Description: v4l2 device access library
-Version: @PACKAGE_VERSION@
-Requires.private: libv4lconvert
-Libs: -L${libdir} -lv4l2
-Libs.private: -lpthread
-Cflags: -I${includedir}
diff --git a/lib/libv4l2rds/Makefile.am b/lib/libv4l2rds/Makefile.am
deleted file mode 100644
index 73fdd3e263b0..000000000000
--- a/lib/libv4l2rds/Makefile.am
+++ /dev/null
@@ -1,12 +0,0 @@
-if WITH_DYN_LIBV4L
-lib_LTLIBRARIES = libv4l2rds.la
-include_HEADERS = ../include/libv4l2rds.h
-pkgconfig_DATA = libv4l2rds.pc
-LIBV4L2RDS_VERSION = -version-info 0
-else
-noinst_LTLIBRARIES = libv4l2rds.la
-endif
-
-libv4l2rds_la_SOURCES = libv4l2rds.c
-libv4l2rds_la_CPPFLAGS = $(CFLAG_VISIBILITY) $(ENFORCE_LIBV4L_STATIC)
-libv4l2rds_la_LDFLAGS = $(LIBV4L2RDS_VERSION) -lpthread $(ENFORCE_LIBV4L_STATIC)
diff --git a/lib/libv4l2rds/libv4l2rds.pc.in b/lib/libv4l2rds/libv4l2rds.pc.in
deleted file mode 100644
index cc1d5f691c18..000000000000
--- a/lib/libv4l2rds/libv4l2rds.pc.in
+++ /dev/null
@@ -1,11 +0,0 @@
-prefix=@prefix@
-exec_prefix=@exec_prefix@
-includedir=@includedir@
-libdir=@libdir@
-
-Name: libv4l2rds
-Description: v4l2 RDS decode library
-Version: @PACKAGE_VERSION@
-Libs: -L${libdir} -lv4l2rds
-Libs.private: -lpthread
-Cflags: -I${includedir}
diff --git a/lib/libv4lconvert/.gitignore b/lib/libv4lconvert/.gitignore
deleted file mode 100644
index 5d677136a0cd..000000000000
--- a/lib/libv4lconvert/.gitignore
+++ /dev/null
@@ -1,3 +0,0 @@
-ov511-decomp
-ov518-decomp
-
diff --git a/lib/libv4lconvert/Makefile.am b/lib/libv4lconvert/Makefile.am
deleted file mode 100644
index 71152b54860a..000000000000
--- a/lib/libv4lconvert/Makefile.am
+++ /dev/null
@@ -1,36 +0,0 @@
-if WITH_DYN_LIBV4L
-lib_LTLIBRARIES = libv4lconvert.la
-if HAVE_LIBV4LCONVERT_HELPERS
-libv4lconvertpriv_PROGRAMS = ov511-decomp ov518-decomp
-endif
-include_HEADERS = ../include/libv4lconvert.h
-pkgconfig_DATA = libv4lconvert.pc
-LIBV4LCONVERT_VERSION = -version-info 0
-else
-noinst_LTLIBRARIES = libv4lconvert.la
-endif
-
-libv4lconvert_la_SOURCES = \
-  libv4lconvert.c tinyjpeg.c sn9c10x.c sn9c20x.c pac207.c  mr97310a.c \
-  flip.c crop.c jidctflt.c spca561-decompress.c \
-  rgbyuv.c sn9c2028-decomp.c spca501.c sq905c.c bayer.c nv12_16l16.c \
-  stv0680.c cpia1.c se401.c jpgl.c jpeg.c jl2005bcd.c \
-  control/libv4lcontrol.c control/libv4lcontrol.h control/libv4lcontrol-priv.h \
-  processing/libv4lprocessing.c processing/whitebalance.c processing/autogain.c \
-  processing/gamma.c processing/libv4lprocessing.h processing/libv4lprocessing-priv.h \
-  helper-funcs.h libv4lconvert-priv.h libv4lsyscall-priv.h \
-  tinyjpeg.h tinyjpeg-internal.h
-if HAVE_JPEG
-libv4lconvert_la_SOURCES += jpeg_memsrcdest.c jpeg_memsrcdest.h
-endif
-if HAVE_LIBV4LCONVERT_HELPERS
-libv4lconvert_la_SOURCES += helper.c
-endif
-libv4lconvert_la_CPPFLAGS = $(CFLAG_VISIBILITY) $(ENFORCE_LIBV4L_STATIC)
-libv4lconvert_la_LDFLAGS = $(LIBV4LCONVERT_VERSION) -lrt -lm $(JPEG_LIBS) $(ENFORCE_LIBV4L_STATIC)
-
-ov511_decomp_SOURCES = ov511-decomp.c
-
-ov518_decomp_SOURCES = ov518-decomp.c
-
-EXTRA_DIST = Android.mk
diff --git a/lib/libv4lconvert/libv4lconvert.pc.in b/lib/libv4lconvert/libv4lconvert.pc.in
deleted file mode 100644
index 2b65d8b846d7..000000000000
--- a/lib/libv4lconvert/libv4lconvert.pc.in
+++ /dev/null
@@ -1,11 +0,0 @@
-prefix=@prefix@
-exec_prefix=@exec_prefix@
-includedir=@includedir@
-libdir=@libdir@
-
-Name: libv4lconvert
-Description: v4l format conversion library
-Version: @PACKAGE_VERSION@
-Libs: -L${libdir} -lv4lconvert
-Libs.private: -lrt -lm @JPEG_LIBS@
-Cflags: -I${includedir}
diff --git a/libdvbv5-po/Makevars b/libdvbv5-po/Makevars
deleted file mode 100644
index eba76a13225f..000000000000
--- a/libdvbv5-po/Makevars
+++ /dev/null
@@ -1,72 +0,0 @@
-# Makefile variables for PO directory in any package using GNU gettext.
-
-# Usually the message domain is the same as the package name.
-DOMAIN = $(PACKAGE)
-
-# These two variables depend on the location of this directory.
-subdir = libdvbv5-po
-top_builddir = ..
-
-# These options get passed to xgettext.
-XGETTEXT_OPTIONS = --keyword=_ --keyword=N_ --keyword=P_:1,2
-
-# This is the copyright holder that gets inserted into the header of the
-# $(DOMAIN).pot file.  Set this to the copyright holder of the surrounding
-# package.  (Note that the msgstr strings, extracted from the package's
-# sources, belong to the copyright holder of the package.)  Translators are
-# expected to transfer the copyright for their translations to this person
-# or entity, or to disclaim their copyright.  The empty string stands for
-# the public domain; in this case the translators are expected to disclaim
-# their copyright.
-COPYRIGHT_HOLDER = Mauro Carvalho Chehab
-
-# This tells whether or not to prepend "GNU " prefix to the package
-# name that gets inserted into the header of the $(DOMAIN).pot file.
-# Possible values are "yes", "no", or empty.  If it is empty, try to
-# detect it automatically by scanning the files in $(top_srcdir) for
-# "GNU packagename" string.
-PACKAGE_GNU =
-
-# This is the email address or URL to which the translators shall report
-# bugs in the untranslated strings:
-# - Strings which are not entire sentences, see the maintainer guidelines
-#   in the GNU gettext documentation, section 'Preparing Strings'.
-# - Strings which use unclear terms or require additional context to be
-#   understood.
-# - Strings which make invalid assumptions about notation of date, time or
-#   money.
-# - Pluralisation problems.
-# - Incorrect English spelling.
-# - Incorrect formatting.
-# It can be your email address, or a mailing list address where translators
-# can write to without being subscribed, or the URL of a web page through
-# which the translators can contact you.
-MSGID_BUGS_ADDRESS = linux-media@vger.Kernel.org
-
-# This is the list of locale categories, beyond LC_MESSAGES, for which the
-# message catalogs shall be used.  It is usually empty.
-EXTRA_LOCALE_CATEGORIES =
-
-# This tells whether the $(DOMAIN).pot file contains messages with an 'msgctxt'
-# context.  Possible values are "yes" and "no".  Set this to yes if the
-# package uses functions taking also a message context, like pgettext(), or
-# if in $(XGETTEXT_OPTIONS) you define keywords with a context argument.
-USE_MSGCTXT = no
-
-# These options get passed to msgmerge.
-# Useful options are in particular:
-#   --previous            to keep previous msgids of translated messages,
-#   --quiet               to reduce the verbosity.
-MSGMERGE_OPTIONS =
-
-# This tells whether or not to regenerate a PO file when $(DOMAIN).pot
-# has changed.  Possible values are "yes" and "no".  Set this to no if
-# the POT file is checked in the repository and the version control
-# program ignores timestamps.
-PO_DEPENDS_ON_POT = yes
-
-# This tells whether or not to forcibly update $(DOMAIN).pot and
-# regenerate PO files on "make dist".  Possible values are "yes" and
-# "no".  Set this to no if the POT file and PO files are maintained
-# externally.
-DIST_DEPENDS_ON_UPDATE_PO = yes
diff --git a/m4/ac_define_dir.m4 b/m4/ac_define_dir.m4
deleted file mode 100644
index e15cea2c9a28..000000000000
--- a/m4/ac_define_dir.m4
+++ /dev/null
@@ -1,34 +0,0 @@
-dnl @synopsis AC_DEFINE_DIR(VARNAME, DIR [, DESCRIPTION])
-dnl
-dnl This macro sets VARNAME to the expansion of the DIR variable,
-dnl taking care of fixing up ${prefix} and such.
-dnl
-dnl VARNAME is then offered as both an output variable and a C
-dnl preprocessor symbol.
-dnl
-dnl Example:
-dnl
-dnl    AC_DEFINE_DIR([DATADIR], [datadir], [Where data are placed to.])
-dnl
-dnl @category Misc
-dnl @author Stepan Kasal <kasal@ucw.cz>
-dnl @author Andreas Schwab <schwab@suse.de>
-dnl @author Guido U. Draheim <guidod@gmx.de>
-dnl @author Alexandre Oliva
-dnl @version 2006-10-13
-dnl @license AllPermissive
-
-AC_DEFUN([AC_DEFINE_DIR], [
-  prefix_NONE=
-  exec_prefix_NONE=
-  test "x$prefix" = xNONE && prefix_NONE=yes && prefix=$ac_default_prefix
-  test "x$exec_prefix" = xNONE && exec_prefix_NONE=yes && exec_prefix=$prefix
-dnl In Autoconf 2.60, ${datadir} refers to ${datarootdir}, which in turn
-dnl refers to ${prefix}.  Thus we have to use `eval' twice.
-  eval ac_define_dir="\"[$]$2\""
-  eval ac_define_dir="\"$ac_define_dir\""
-  AC_SUBST($1, "$ac_define_dir")
-  AC_DEFINE_UNQUOTED($1, "$ac_define_dir", [$3])
-  test "$prefix_NONE" && prefix=NONE
-  test "$exec_prefix_NONE" && exec_prefix=NONE
-])
diff --git a/m4/ax_prog_doxygen.m4 b/m4/ax_prog_doxygen.m4
deleted file mode 100644
index 44b22b00abc6..000000000000
--- a/m4/ax_prog_doxygen.m4
+++ /dev/null
@@ -1,532 +0,0 @@
-# ===========================================================================
-#      http://www.gnu.org/software/autoconf-archive/ax_prog_doxygen.html
-# ===========================================================================
-#
-# SYNOPSIS
-#
-#   DX_INIT_DOXYGEN(PROJECT-NAME, DOXYFILE-PATH, [OUTPUT-DIR])
-#   DX_DOXYGEN_FEATURE(ON|OFF)
-#   DX_DOT_FEATURE(ON|OFF)
-#   DX_HTML_FEATURE(ON|OFF)
-#   DX_CHM_FEATURE(ON|OFF)
-#   DX_CHI_FEATURE(ON|OFF)
-#   DX_MAN_FEATURE(ON|OFF)
-#   DX_RTF_FEATURE(ON|OFF)
-#   DX_XML_FEATURE(ON|OFF)
-#   DX_PDF_FEATURE(ON|OFF)
-#   DX_PS_FEATURE(ON|OFF)
-#
-# DESCRIPTION
-#
-#   The DX_*_FEATURE macros control the default setting for the given
-#   Doxygen feature. Supported features are 'DOXYGEN' itself, 'DOT' for
-#   generating graphics, 'HTML' for plain HTML, 'CHM' for compressed HTML
-#   help (for MS users), 'CHI' for generating a seperate .chi file by the
-#   .chm file, and 'MAN', 'RTF', 'XML', 'PDF' and 'PS' for the appropriate
-#   output formats. The environment variable DOXYGEN_PAPER_SIZE may be
-#   specified to override the default 'a4wide' paper size.
-#
-#   By default, HTML, PDF and PS documentation is generated as this seems to
-#   be the most popular and portable combination. MAN pages created by
-#   Doxygen are usually problematic, though by picking an appropriate subset
-#   and doing some massaging they might be better than nothing. CHM and RTF
-#   are specific for MS (note that you can't generate both HTML and CHM at
-#   the same time). The XML is rather useless unless you apply specialized
-#   post-processing to it.
-#
-#   The macros mainly control the default state of the feature. The use can
-#   override the default by specifying --enable or --disable. The macros
-#   ensure that contradictory flags are not given (e.g.,
-#   --enable-doxygen-html and --enable-doxygen-chm,
-#   --enable-doxygen-anything with --disable-doxygen, etc.) Finally, each
-#   feature will be automatically disabled (with a warning) if the required
-#   programs are missing.
-#
-#   Once all the feature defaults have been specified, call DX_INIT_DOXYGEN
-#   with the following parameters: a one-word name for the project for use
-#   as a filename base etc., an optional configuration file name (the
-#   default is 'Doxyfile', the same as Doxygen's default), and an optional
-#   output directory name (the default is 'doxygen-doc').
-#
-#   Automake Support
-#
-#   The following is a template aminclude.am file for use with Automake.
-#   Make targets and variables values are controlled by the various
-#   DX_COND_* conditionals set by autoconf.
-#
-#   The provided targets are:
-#
-#     doxygen-doc: Generate all doxygen documentation.
-#
-#     doxygen-run: Run doxygen, which will generate some of the
-#                  documentation (HTML, CHM, CHI, MAN, RTF, XML)
-#                  but will not do the post processing required
-#                  for the rest of it (PS, PDF, and some MAN).
-#
-#     doxygen-man: Rename some doxygen generated man pages.
-#
-#     doxygen-ps:  Generate doxygen PostScript documentation.
-#
-#     doxygen-pdf: Generate doxygen PDF documentation.
-#
-#   Note that by default these are not integrated into the automake targets.
-#   If doxygen is used to generate man pages, you can achieve this
-#   integration by setting man3_MANS to the list of man pages generated and
-#   then adding the dependency:
-#
-#     $(man3_MANS): doxygen-doc
-#
-#   This will cause make to run doxygen and generate all the documentation.
-#
-#   The following variable is intended for use in Makefile.am:
-#
-#     DX_CLEANFILES = everything to clean.
-#
-#   Then add this variable to MOSTLYCLEANFILES.
-#
-#     ----- begin aminclude.am -------------------------------------
-#
-#     ## --------------------------------- ##
-#     ## Format-independent Doxygen rules. ##
-#     ## --------------------------------- ##
-#
-#     if DX_COND_doc
-#
-#     ## ------------------------------- ##
-#     ## Rules specific for HTML output. ##
-#     ## ------------------------------- ##
-#
-#     if DX_COND_html
-#
-#     DX_CLEAN_HTML = @DX_DOCDIR@/html
-#
-#     endif DX_COND_html
-#
-#     ## ------------------------------ ##
-#     ## Rules specific for CHM output. ##
-#     ## ------------------------------ ##
-#
-#     if DX_COND_chm
-#
-#     DX_CLEAN_CHM = @DX_DOCDIR@/chm
-#
-#     if DX_COND_chi
-#
-#     DX_CLEAN_CHI = @DX_DOCDIR@/@PACKAGE@.chi
-#
-#     endif DX_COND_chi
-#
-#     endif DX_COND_chm
-#
-#     ## ------------------------------ ##
-#     ## Rules specific for MAN output. ##
-#     ## ------------------------------ ##
-#
-#     if DX_COND_man
-#
-#     DX_CLEAN_MAN = @DX_DOCDIR@/man
-#
-#     endif DX_COND_man
-#
-#     ## ------------------------------ ##
-#     ## Rules specific for RTF output. ##
-#     ## ------------------------------ ##
-#
-#     if DX_COND_rtf
-#
-#     DX_CLEAN_RTF = @DX_DOCDIR@/rtf
-#
-#     endif DX_COND_rtf
-#
-#     ## ------------------------------ ##
-#     ## Rules specific for XML output. ##
-#     ## ------------------------------ ##
-#
-#     if DX_COND_xml
-#
-#     DX_CLEAN_XML = @DX_DOCDIR@/xml
-#
-#     endif DX_COND_xml
-#
-#     ## ----------------------------- ##
-#     ## Rules specific for PS output. ##
-#     ## ----------------------------- ##
-#
-#     if DX_COND_ps
-#
-#     DX_CLEAN_PS = @DX_DOCDIR@/@PACKAGE@.ps
-#
-#     DX_PS_GOAL = doxygen-ps
-#
-#     doxygen-ps: @DX_DOCDIR@/@PACKAGE@.ps
-#
-#     @DX_DOCDIR@/@PACKAGE@.ps: @DX_DOCDIR@/@PACKAGE@.tag
-#         cd @DX_DOCDIR@/latex; \
-#         rm -f *.aux *.toc *.idx *.ind *.ilg *.log *.out; \
-#         $(DX_LATEX) refman.tex; \
-#         $(MAKEINDEX_PATH) refman.idx; \
-#         $(DX_LATEX) refman.tex; \
-#         countdown=5; \
-#         while $(DX_EGREP) 'Rerun (LaTeX|to get cross-references right)' \
-#                           refman.log > /dev/null 2>&1 \
-#            && test $$countdown -gt 0; do \
-#             $(DX_LATEX) refman.tex; \
-#             countdown=`expr $$countdown - 1`; \
-#         done; \
-#         $(DX_DVIPS) -o ../@PACKAGE@.ps refman.dvi
-#
-#     endif DX_COND_ps
-#
-#     ## ------------------------------ ##
-#     ## Rules specific for PDF output. ##
-#     ## ------------------------------ ##
-#
-#     if DX_COND_pdf
-#
-#     DX_CLEAN_PDF = @DX_DOCDIR@/@PACKAGE@.pdf
-#
-#     DX_PDF_GOAL = doxygen-pdf
-#
-#     doxygen-pdf: @DX_DOCDIR@/@PACKAGE@.pdf
-#
-#     @DX_DOCDIR@/@PACKAGE@.pdf: @DX_DOCDIR@/@PACKAGE@.tag
-#         cd @DX_DOCDIR@/latex; \
-#         rm -f *.aux *.toc *.idx *.ind *.ilg *.log *.out; \
-#         $(DX_PDFLATEX) refman.tex; \
-#         $(DX_MAKEINDEX) refman.idx; \
-#         $(DX_PDFLATEX) refman.tex; \
-#         countdown=5; \
-#         while $(DX_EGREP) 'Rerun (LaTeX|to get cross-references right)' \
-#                           refman.log > /dev/null 2>&1 \
-#            && test $$countdown -gt 0; do \
-#             $(DX_PDFLATEX) refman.tex; \
-#             countdown=`expr $$countdown - 1`; \
-#         done; \
-#         mv refman.pdf ../@PACKAGE@.pdf
-#
-#     endif DX_COND_pdf
-#
-#     ## ------------------------------------------------- ##
-#     ## Rules specific for LaTeX (shared for PS and PDF). ##
-#     ## ------------------------------------------------- ##
-#
-#     if DX_COND_latex
-#
-#     DX_CLEAN_LATEX = @DX_DOCDIR@/latex
-#
-#     endif DX_COND_latex
-#
-#     .PHONY: doxygen-run doxygen-doc $(DX_PS_GOAL) $(DX_PDF_GOAL)
-#
-#     .INTERMEDIATE: doxygen-run $(DX_PS_GOAL) $(DX_PDF_GOAL)
-#
-#     doxygen-run: @DX_DOCDIR@/@PACKAGE@.tag
-#
-#     doxygen-doc: doxygen-run $(DX_PS_GOAL) $(DX_PDF_GOAL)
-#
-#     @DX_DOCDIR@/@PACKAGE@.tag: $(DX_CONFIG) $(pkginclude_HEADERS)
-#         rm -rf @DX_DOCDIR@
-#         $(DX_ENV) $(DX_DOXYGEN) $(srcdir)/$(DX_CONFIG)
-#
-#     DX_CLEANFILES = \
-#         @DX_DOCDIR@/@PACKAGE@.tag \
-#         -r \
-#         $(DX_CLEAN_HTML) \
-#         $(DX_CLEAN_CHM) \
-#         $(DX_CLEAN_CHI) \
-#         $(DX_CLEAN_MAN) \
-#         $(DX_CLEAN_RTF) \
-#         $(DX_CLEAN_XML) \
-#         $(DX_CLEAN_PS) \
-#         $(DX_CLEAN_PDF) \
-#         $(DX_CLEAN_LATEX)
-#
-#     endif DX_COND_doc
-#
-#     ----- end aminclude.am ---------------------------------------
-#
-# LICENSE
-#
-#   Copyright (c) 2009 Oren Ben-Kiki <oren@ben-kiki.org>
-#
-#   Copying and distribution of this file, with or without modification, are
-#   permitted in any medium without royalty provided the copyright notice
-#   and this notice are preserved. This file is offered as-is, without any
-#   warranty.
-
-#serial 12
-
-## ----------##
-## Defaults. ##
-## ----------##
-
-DX_ENV=""
-AC_DEFUN([DX_FEATURE_doc],  ON)
-AC_DEFUN([DX_FEATURE_dot],  OFF)
-AC_DEFUN([DX_FEATURE_man],  OFF)
-AC_DEFUN([DX_FEATURE_html], ON)
-AC_DEFUN([DX_FEATURE_chm],  OFF)
-AC_DEFUN([DX_FEATURE_chi],  OFF)
-AC_DEFUN([DX_FEATURE_rtf],  OFF)
-AC_DEFUN([DX_FEATURE_xml],  OFF)
-AC_DEFUN([DX_FEATURE_pdf],  ON)
-AC_DEFUN([DX_FEATURE_ps],   ON)
-
-## --------------- ##
-## Private macros. ##
-## --------------- ##
-
-# DX_ENV_APPEND(VARIABLE, VALUE)
-# ------------------------------
-# Append VARIABLE="VALUE" to DX_ENV for invoking doxygen.
-AC_DEFUN([DX_ENV_APPEND], [AC_SUBST([DX_ENV], ["$DX_ENV $1='$2'"])])
-
-# DX_DIRNAME_EXPR
-# ---------------
-# Expand into a shell expression prints the directory part of a path.
-AC_DEFUN([DX_DIRNAME_EXPR],
-         [[expr ".$1" : '\(\.\)[^/]*$' \| "x$1" : 'x\(.*\)/[^/]*$']])
-
-# DX_IF_FEATURE(FEATURE, IF-ON, IF-OFF)
-# -------------------------------------
-# Expands according to the M4 (static) status of the feature.
-AC_DEFUN([DX_IF_FEATURE], [ifelse(DX_FEATURE_$1, ON, [$2], [$3])])
-
-# DX_REQUIRE_PROG(VARIABLE, PROGRAM)
-# ----------------------------------
-# Require the specified program to be found for the DX_CURRENT_FEATURE to work.
-AC_DEFUN([DX_REQUIRE_PROG], [
-AC_PATH_TOOL([$1], [$2])
-if test "$DX_FLAG_[]DX_CURRENT_FEATURE$$1" = 1; then
-    AC_MSG_WARN([$2 not found - will not DX_CURRENT_DESCRIPTION])
-    AC_SUBST(DX_FLAG_[]DX_CURRENT_FEATURE, 0)
-fi
-])
-
-# DX_TEST_FEATURE(FEATURE)
-# ------------------------
-# Expand to a shell expression testing whether the feature is active.
-AC_DEFUN([DX_TEST_FEATURE], [test "$DX_FLAG_$1" = 1])
-
-# DX_CHECK_DEPEND(REQUIRED_FEATURE, REQUIRED_STATE)
-# -------------------------------------------------
-# Verify that a required features has the right state before trying to turn on
-# the DX_CURRENT_FEATURE.
-AC_DEFUN([DX_CHECK_DEPEND], [
-test "$DX_FLAG_$1" = "$2" \
-|| AC_MSG_ERROR([doxygen-DX_CURRENT_FEATURE ifelse([$2], 1,
-                            requires, contradicts) doxygen-DX_CURRENT_FEATURE])
-])
-
-# DX_CLEAR_DEPEND(FEATURE, REQUIRED_FEATURE, REQUIRED_STATE)
-# ----------------------------------------------------------
-# Turn off the DX_CURRENT_FEATURE if the required feature is off.
-AC_DEFUN([DX_CLEAR_DEPEND], [
-test "$DX_FLAG_$1" = "$2" || AC_SUBST(DX_FLAG_[]DX_CURRENT_FEATURE, 0)
-])
-
-# DX_FEATURE_ARG(FEATURE, DESCRIPTION,
-#                CHECK_DEPEND, CLEAR_DEPEND,
-#                REQUIRE, DO-IF-ON, DO-IF-OFF)
-# --------------------------------------------
-# Parse the command-line option controlling a feature. CHECK_DEPEND is called
-# if the user explicitly turns the feature on (and invokes DX_CHECK_DEPEND),
-# otherwise CLEAR_DEPEND is called to turn off the default state if a required
-# feature is disabled (using DX_CLEAR_DEPEND). REQUIRE performs additional
-# requirement tests (DX_REQUIRE_PROG). Finally, an automake flag is set and
-# DO-IF-ON or DO-IF-OFF are called according to the final state of the feature.
-AC_DEFUN([DX_ARG_ABLE], [
-    AC_DEFUN([DX_CURRENT_FEATURE], [$1])
-    AC_DEFUN([DX_CURRENT_DESCRIPTION], [$2])
-    AC_ARG_ENABLE(doxygen-$1,
-                  [AS_HELP_STRING(DX_IF_FEATURE([$1], [--disable-doxygen-$1],
-                                                      [--enable-doxygen-$1]),
-                                  DX_IF_FEATURE([$1], [don't $2], [$2]))],
-                  [
-case "$enableval" in
-#(
-y|Y|yes|Yes|YES)
-    AC_SUBST([DX_FLAG_$1], 1)
-    $3
-;; #(
-n|N|no|No|NO)
-    AC_SUBST([DX_FLAG_$1], 0)
-;; #(
-*)
-    AC_MSG_ERROR([invalid value '$enableval' given to doxygen-$1])
-;;
-esac
-], [
-AC_SUBST([DX_FLAG_$1], [DX_IF_FEATURE([$1], 1, 0)])
-$4
-])
-if DX_TEST_FEATURE([$1]); then
-    $5
-    :
-fi
-AM_CONDITIONAL(DX_COND_$1, DX_TEST_FEATURE([$1]))
-if DX_TEST_FEATURE([$1]); then
-    $6
-    :
-else
-    $7
-    :
-fi
-])
-
-## -------------- ##
-## Public macros. ##
-## -------------- ##
-
-# DX_XXX_FEATURE(DEFAULT_STATE)
-# -----------------------------
-AC_DEFUN([DX_DOXYGEN_FEATURE], [AC_DEFUN([DX_FEATURE_doc],  [$1])])
-AC_DEFUN([DX_DOT_FEATURE],     [AC_DEFUN([DX_FEATURE_dot], [$1])])
-AC_DEFUN([DX_MAN_FEATURE],     [AC_DEFUN([DX_FEATURE_man],  [$1])])
-AC_DEFUN([DX_HTML_FEATURE],    [AC_DEFUN([DX_FEATURE_html], [$1])])
-AC_DEFUN([DX_CHM_FEATURE],     [AC_DEFUN([DX_FEATURE_chm],  [$1])])
-AC_DEFUN([DX_CHI_FEATURE],     [AC_DEFUN([DX_FEATURE_chi],  [$1])])
-AC_DEFUN([DX_RTF_FEATURE],     [AC_DEFUN([DX_FEATURE_rtf],  [$1])])
-AC_DEFUN([DX_XML_FEATURE],     [AC_DEFUN([DX_FEATURE_xml],  [$1])])
-AC_DEFUN([DX_XML_FEATURE],     [AC_DEFUN([DX_FEATURE_xml],  [$1])])
-AC_DEFUN([DX_PDF_FEATURE],     [AC_DEFUN([DX_FEATURE_pdf],  [$1])])
-AC_DEFUN([DX_PS_FEATURE],      [AC_DEFUN([DX_FEATURE_ps],   [$1])])
-
-# DX_INIT_DOXYGEN(PROJECT, [CONFIG-FILE], [OUTPUT-DOC-DIR])
-# ---------------------------------------------------------
-# PROJECT also serves as the base name for the documentation files.
-# The default CONFIG-FILE is "Doxyfile" and OUTPUT-DOC-DIR is "doxygen-doc".
-AC_DEFUN([DX_INIT_DOXYGEN], [
-
-# Files:
-AC_SUBST([DX_PROJECT], [$1])
-AC_SUBST([DX_CONFIG], [ifelse([$2], [], Doxyfile, [$2])])
-AC_SUBST([DX_DOCDIR], [ifelse([$3], [], doxygen-doc, [$3])])
-
-# Environment variables used inside doxygen.cfg:
-DX_ENV_APPEND(SRCDIR, $srcdir)
-DX_ENV_APPEND(PROJECT, $DX_PROJECT)
-DX_ENV_APPEND(DOCDIR, $DX_DOCDIR)
-DX_ENV_APPEND(VERSION, $PACKAGE_VERSION)
-
-# Doxygen itself:
-DX_ARG_ABLE(doc, [generate any doxygen documentation],
-            [],
-            [],
-            [DX_REQUIRE_PROG([DX_DOXYGEN], doxygen)
-             DX_REQUIRE_PROG([DX_PERL], perl)],
-            [DX_ENV_APPEND(PERL_PATH, $DX_PERL)])
-
-# Dot for graphics:
-DX_ARG_ABLE(dot, [generate graphics for doxygen documentation],
-            [DX_CHECK_DEPEND(doc, 1)],
-            [DX_CLEAR_DEPEND(doc, 1)],
-            [DX_REQUIRE_PROG([DX_DOT], dot)],
-            [DX_ENV_APPEND(HAVE_DOT, YES)
-             DX_ENV_APPEND(DOT_PATH, [`DX_DIRNAME_EXPR($DX_DOT)`])],
-            [DX_ENV_APPEND(HAVE_DOT, NO)])
-
-# Man pages generation:
-DX_ARG_ABLE(man, [generate doxygen manual pages],
-            [DX_CHECK_DEPEND(doc, 1)],
-            [DX_CLEAR_DEPEND(doc, 1)],
-            [],
-            [DX_ENV_APPEND(GENERATE_MAN, YES)],
-            [DX_ENV_APPEND(GENERATE_MAN, NO)])
-
-# RTF file generation:
-DX_ARG_ABLE(rtf, [generate doxygen RTF documentation],
-            [DX_CHECK_DEPEND(doc, 1)],
-            [DX_CLEAR_DEPEND(doc, 1)],
-            [],
-            [DX_ENV_APPEND(GENERATE_RTF, YES)],
-            [DX_ENV_APPEND(GENERATE_RTF, NO)])
-
-# XML file generation:
-DX_ARG_ABLE(xml, [generate doxygen XML documentation],
-            [DX_CHECK_DEPEND(doc, 1)],
-            [DX_CLEAR_DEPEND(doc, 1)],
-            [],
-            [DX_ENV_APPEND(GENERATE_XML, YES)],
-            [DX_ENV_APPEND(GENERATE_XML, NO)])
-
-# (Compressed) HTML help generation:
-DX_ARG_ABLE(chm, [generate doxygen compressed HTML help documentation],
-            [DX_CHECK_DEPEND(doc, 1)],
-            [DX_CLEAR_DEPEND(doc, 1)],
-            [DX_REQUIRE_PROG([DX_HHC], hhc)],
-            [DX_ENV_APPEND(HHC_PATH, $DX_HHC)
-             DX_ENV_APPEND(GENERATE_HTML, YES)
-             DX_ENV_APPEND(GENERATE_HTMLHELP, YES)],
-            [DX_ENV_APPEND(GENERATE_HTMLHELP, NO)])
-
-# Seperate CHI file generation.
-DX_ARG_ABLE(chi, [generate doxygen seperate compressed HTML help index file],
-            [DX_CHECK_DEPEND(chm, 1)],
-            [DX_CLEAR_DEPEND(chm, 1)],
-            [],
-            [DX_ENV_APPEND(GENERATE_CHI, YES)],
-            [DX_ENV_APPEND(GENERATE_CHI, NO)])
-
-# Plain HTML pages generation:
-DX_ARG_ABLE(html, [generate doxygen plain HTML documentation],
-            [DX_CHECK_DEPEND(doc, 1) DX_CHECK_DEPEND(chm, 0)],
-            [DX_CLEAR_DEPEND(doc, 1) DX_CLEAR_DEPEND(chm, 0)],
-            [],
-            [DX_ENV_APPEND(GENERATE_HTML, YES)],
-            [DX_TEST_FEATURE(chm) || DX_ENV_APPEND(GENERATE_HTML, NO)])
-
-# PostScript file generation:
-DX_ARG_ABLE(ps, [generate doxygen PostScript documentation],
-            [DX_CHECK_DEPEND(doc, 1)],
-            [DX_CLEAR_DEPEND(doc, 1)],
-            [DX_REQUIRE_PROG([DX_LATEX], latex)
-             DX_REQUIRE_PROG([DX_MAKEINDEX], makeindex)
-             DX_REQUIRE_PROG([DX_DVIPS], dvips)
-             DX_REQUIRE_PROG([DX_EGREP], egrep)])
-
-# PDF file generation:
-DX_ARG_ABLE(pdf, [generate doxygen PDF documentation],
-            [DX_CHECK_DEPEND(doc, 1)],
-            [DX_CLEAR_DEPEND(doc, 1)],
-            [DX_REQUIRE_PROG([DX_PDFLATEX], pdflatex)
-             DX_REQUIRE_PROG([DX_MAKEINDEX], makeindex)
-             DX_REQUIRE_PROG([DX_EGREP], egrep)])
-
-# LaTeX generation for PS and/or PDF:
-AM_CONDITIONAL(DX_COND_latex, DX_TEST_FEATURE(ps) || DX_TEST_FEATURE(pdf))
-if DX_TEST_FEATURE(ps) || DX_TEST_FEATURE(pdf); then
-    DX_ENV_APPEND(GENERATE_LATEX, YES)
-else
-    DX_ENV_APPEND(GENERATE_LATEX, NO)
-fi
-
-# Paper size for PS and/or PDF:
-AC_ARG_VAR(DOXYGEN_PAPER_SIZE,
-           [a4wide (default), a4, letter, legal or executive])
-case "$DOXYGEN_PAPER_SIZE" in
-#(
-"")
-    AC_SUBST(DOXYGEN_PAPER_SIZE, "")
-;; #(
-a4wide|a4|letter|legal|executive)
-    DX_ENV_APPEND(PAPER_SIZE, $DOXYGEN_PAPER_SIZE)
-;; #(
-*)
-    AC_MSG_ERROR([unknown DOXYGEN_PAPER_SIZE='$DOXYGEN_PAPER_SIZE'])
-;;
-esac
-
-#For debugging:
-#echo DX_FLAG_doc=$DX_FLAG_doc
-#echo DX_FLAG_dot=$DX_FLAG_dot
-#echo DX_FLAG_man=$DX_FLAG_man
-#echo DX_FLAG_html=$DX_FLAG_html
-#echo DX_FLAG_chm=$DX_FLAG_chm
-#echo DX_FLAG_chi=$DX_FLAG_chi
-#echo DX_FLAG_rtf=$DX_FLAG_rtf
-#echo DX_FLAG_xml=$DX_FLAG_xml
-#echo DX_FLAG_pdf=$DX_FLAG_pdf
-#echo DX_FLAG_ps=$DX_FLAG_ps
-#echo DX_ENV=$DX_ENV
-])
diff --git a/m4/ax_pthread.m4 b/m4/ax_pthread.m4
deleted file mode 100644
index 9f35d139149f..000000000000
--- a/m4/ax_pthread.m4
+++ /dev/null
@@ -1,522 +0,0 @@
-# ===========================================================================
-#        https://www.gnu.org/software/autoconf-archive/ax_pthread.html
-# ===========================================================================
-#
-# SYNOPSIS
-#
-#   AX_PTHREAD([ACTION-IF-FOUND[, ACTION-IF-NOT-FOUND]])
-#
-# DESCRIPTION
-#
-#   This macro figures out how to build C programs using POSIX threads. It
-#   sets the PTHREAD_LIBS output variable to the threads library and linker
-#   flags, and the PTHREAD_CFLAGS output variable to any special C compiler
-#   flags that are needed. (The user can also force certain compiler
-#   flags/libs to be tested by setting these environment variables.)
-#
-#   Also sets PTHREAD_CC and PTHREAD_CXX to any special C compiler that is
-#   needed for multi-threaded programs (defaults to the value of CC
-#   respectively CXX otherwise). (This is necessary on e.g. AIX to use the
-#   special cc_r/CC_r compiler alias.)
-#
-#   NOTE: You are assumed to not only compile your program with these flags,
-#   but also to link with them as well. For example, you might link with
-#   $PTHREAD_CC $CFLAGS $PTHREAD_CFLAGS $LDFLAGS ... $PTHREAD_LIBS $LIBS
-#   $PTHREAD_CXX $CXXFLAGS $PTHREAD_CFLAGS $LDFLAGS ... $PTHREAD_LIBS $LIBS
-#
-#   If you are only building threaded programs, you may wish to use these
-#   variables in your default LIBS, CFLAGS, and CC:
-#
-#     LIBS="$PTHREAD_LIBS $LIBS"
-#     CFLAGS="$CFLAGS $PTHREAD_CFLAGS"
-#     CXXFLAGS="$CXXFLAGS $PTHREAD_CFLAGS"
-#     CC="$PTHREAD_CC"
-#     CXX="$PTHREAD_CXX"
-#
-#   In addition, if the PTHREAD_CREATE_JOINABLE thread-attribute constant
-#   has a nonstandard name, this macro defines PTHREAD_CREATE_JOINABLE to
-#   that name (e.g. PTHREAD_CREATE_UNDETACHED on AIX).
-#
-#   Also HAVE_PTHREAD_PRIO_INHERIT is defined if pthread is found and the
-#   PTHREAD_PRIO_INHERIT symbol is defined when compiling with
-#   PTHREAD_CFLAGS.
-#
-#   ACTION-IF-FOUND is a list of shell commands to run if a threads library
-#   is found, and ACTION-IF-NOT-FOUND is a list of commands to run it if it
-#   is not found. If ACTION-IF-FOUND is not specified, the default action
-#   will define HAVE_PTHREAD.
-#
-#   Please let the authors know if this macro fails on any platform, or if
-#   you have any other suggestions or comments. This macro was based on work
-#   by SGJ on autoconf scripts for FFTW (http://www.fftw.org/) (with help
-#   from M. Frigo), as well as ac_pthread and hb_pthread macros posted by
-#   Alejandro Forero Cuervo to the autoconf macro repository. We are also
-#   grateful for the helpful feedback of numerous users.
-#
-#   Updated for Autoconf 2.68 by Daniel Richard G.
-#
-# LICENSE
-#
-#   Copyright (c) 2008 Steven G. Johnson <stevenj@alum.mit.edu>
-#   Copyright (c) 2011 Daniel Richard G. <skunk@iSKUNK.ORG>
-#   Copyright (c) 2019 Marc Stevens <marc.stevens@cwi.nl>
-#
-#   This program is free software: you can redistribute it and/or modify it
-#   under the terms of the GNU General Public License as published by the
-#   Free Software Foundation, either version 3 of the License, or (at your
-#   option) any later version.
-#
-#   This program is distributed in the hope that it will be useful, but
-#   WITHOUT ANY WARRANTY; without even the implied warranty of
-#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
-#   Public License for more details.
-#
-#   You should have received a copy of the GNU General Public License along
-#   with this program. If not, see <https://www.gnu.org/licenses/>.
-#
-#   As a special exception, the respective Autoconf Macro's copyright owner
-#   gives unlimited permission to copy, distribute and modify the configure
-#   scripts that are the output of Autoconf when processing the Macro. You
-#   need not follow the terms of the GNU General Public License when using
-#   or distributing such scripts, even though portions of the text of the
-#   Macro appear in them. The GNU General Public License (GPL) does govern
-#   all other use of the material that constitutes the Autoconf Macro.
-#
-#   This special exception to the GPL applies to versions of the Autoconf
-#   Macro released by the Autoconf Archive. When you make and distribute a
-#   modified version of the Autoconf Macro, you may extend this special
-#   exception to the GPL to apply to your modified version as well.
-
-#serial 31
-
-AU_ALIAS([ACX_PTHREAD], [AX_PTHREAD])
-AC_DEFUN([AX_PTHREAD], [
-AC_REQUIRE([AC_CANONICAL_HOST])
-AC_REQUIRE([AC_PROG_CC])
-AC_REQUIRE([AC_PROG_SED])
-AC_LANG_PUSH([C])
-ax_pthread_ok=no
-
-# We used to check for pthread.h first, but this fails if pthread.h
-# requires special compiler flags (e.g. on Tru64 or Sequent).
-# It gets checked for in the link test anyway.
-
-# First of all, check if the user has set any of the PTHREAD_LIBS,
-# etcetera environment variables, and if threads linking works using
-# them:
-if test "x$PTHREAD_CFLAGS$PTHREAD_LIBS" != "x"; then
-        ax_pthread_save_CC="$CC"
-        ax_pthread_save_CFLAGS="$CFLAGS"
-        ax_pthread_save_LIBS="$LIBS"
-        AS_IF([test "x$PTHREAD_CC" != "x"], [CC="$PTHREAD_CC"])
-        AS_IF([test "x$PTHREAD_CXX" != "x"], [CXX="$PTHREAD_CXX"])
-        CFLAGS="$CFLAGS $PTHREAD_CFLAGS"
-        LIBS="$PTHREAD_LIBS $LIBS"
-        AC_MSG_CHECKING([for pthread_join using $CC $PTHREAD_CFLAGS $PTHREAD_LIBS])
-        AC_LINK_IFELSE([AC_LANG_CALL([], [pthread_join])], [ax_pthread_ok=yes])
-        AC_MSG_RESULT([$ax_pthread_ok])
-        if test "x$ax_pthread_ok" = "xno"; then
-                PTHREAD_LIBS=""
-                PTHREAD_CFLAGS=""
-        fi
-        CC="$ax_pthread_save_CC"
-        CFLAGS="$ax_pthread_save_CFLAGS"
-        LIBS="$ax_pthread_save_LIBS"
-fi
-
-# We must check for the threads library under a number of different
-# names; the ordering is very important because some systems
-# (e.g. DEC) have both -lpthread and -lpthreads, where one of the
-# libraries is broken (non-POSIX).
-
-# Create a list of thread flags to try. Items with a "," contain both
-# C compiler flags (before ",") and linker flags (after ","). Other items
-# starting with a "-" are C compiler flags, and remaining items are
-# library names, except for "none" which indicates that we try without
-# any flags at all, and "pthread-config" which is a program returning
-# the flags for the Pth emulation library.
-
-ax_pthread_flags="pthreads none -Kthread -pthread -pthreads -mthreads pthread --thread-safe -mt pthread-config"
-
-# The ordering *is* (sometimes) important.  Some notes on the
-# individual items follow:
-
-# pthreads: AIX (must check this before -lpthread)
-# none: in case threads are in libc; should be tried before -Kthread and
-#       other compiler flags to prevent continual compiler warnings
-# -Kthread: Sequent (threads in libc, but -Kthread needed for pthread.h)
-# -pthread: Linux/gcc (kernel threads), BSD/gcc (userland threads), Tru64
-#           (Note: HP C rejects this with "bad form for `-t' option")
-# -pthreads: Solaris/gcc (Note: HP C also rejects)
-# -mt: Sun Workshop C (may only link SunOS threads [-lthread], but it
-#      doesn't hurt to check since this sometimes defines pthreads and
-#      -D_REENTRANT too), HP C (must be checked before -lpthread, which
-#      is present but should not be used directly; and before -mthreads,
-#      because the compiler interprets this as "-mt" + "-hreads")
-# -mthreads: Mingw32/gcc, Lynx/gcc
-# pthread: Linux, etcetera
-# --thread-safe: KAI C++
-# pthread-config: use pthread-config program (for GNU Pth library)
-
-case $host_os in
-
-        freebsd*)
-
-        # -kthread: FreeBSD kernel threads (preferred to -pthread since SMP-able)
-        # lthread: LinuxThreads port on FreeBSD (also preferred to -pthread)
-
-        ax_pthread_flags="-kthread lthread $ax_pthread_flags"
-        ;;
-
-        hpux*)
-
-        # From the cc(1) man page: "[-mt] Sets various -D flags to enable
-        # multi-threading and also sets -lpthread."
-
-        ax_pthread_flags="-mt -pthread pthread $ax_pthread_flags"
-        ;;
-
-        openedition*)
-
-        # IBM z/OS requires a feature-test macro to be defined in order to
-        # enable POSIX threads at all, so give the user a hint if this is
-        # not set. (We don't define these ourselves, as they can affect
-        # other portions of the system API in unpredictable ways.)
-
-        AC_EGREP_CPP([AX_PTHREAD_ZOS_MISSING],
-            [
-#            if !defined(_OPEN_THREADS) && !defined(_UNIX03_THREADS)
-             AX_PTHREAD_ZOS_MISSING
-#            endif
-            ],
-            [AC_MSG_WARN([IBM z/OS requires -D_OPEN_THREADS or -D_UNIX03_THREADS to enable pthreads support.])])
-        ;;
-
-        solaris*)
-
-        # On Solaris (at least, for some versions), libc contains stubbed
-        # (non-functional) versions of the pthreads routines, so link-based
-        # tests will erroneously succeed. (N.B.: The stubs are missing
-        # pthread_cleanup_push, or rather a function called by this macro,
-        # so we could check for that, but who knows whether they'll stub
-        # that too in a future libc.)  So we'll check first for the
-        # standard Solaris way of linking pthreads (-mt -lpthread).
-
-        ax_pthread_flags="-mt,-lpthread pthread $ax_pthread_flags"
-        ;;
-esac
-
-# Are we compiling with Clang?
-
-AC_CACHE_CHECK([whether $CC is Clang],
-    [ax_cv_PTHREAD_CLANG],
-    [ax_cv_PTHREAD_CLANG=no
-     # Note that Autoconf sets GCC=yes for Clang as well as GCC
-     if test "x$GCC" = "xyes"; then
-        AC_EGREP_CPP([AX_PTHREAD_CC_IS_CLANG],
-            [/* Note: Clang 2.7 lacks __clang_[a-z]+__ */
-#            if defined(__clang__) && defined(__llvm__)
-             AX_PTHREAD_CC_IS_CLANG
-#            endif
-            ],
-            [ax_cv_PTHREAD_CLANG=yes])
-     fi
-    ])
-ax_pthread_clang="$ax_cv_PTHREAD_CLANG"
-
-
-# GCC generally uses -pthread, or -pthreads on some platforms (e.g. SPARC)
-
-# Note that for GCC and Clang -pthread generally implies -lpthread,
-# except when -nostdlib is passed.
-# This is problematic using libtool to build C++ shared libraries with pthread:
-# [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=25460
-# [2] https://bugzilla.redhat.com/show_bug.cgi?id=661333
-# [3] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=468555
-# To solve this, first try -pthread together with -lpthread for GCC
-
-AS_IF([test "x$GCC" = "xyes"],
-      [ax_pthread_flags="-pthread,-lpthread -pthread -pthreads $ax_pthread_flags"])
-
-# Clang takes -pthread (never supported any other flag), but we'll try with -lpthread first
-
-AS_IF([test "x$ax_pthread_clang" = "xyes"],
-      [ax_pthread_flags="-pthread,-lpthread -pthread"])
-
-
-# The presence of a feature test macro requesting re-entrant function
-# definitions is, on some systems, a strong hint that pthreads support is
-# correctly enabled
-
-case $host_os in
-        darwin* | hpux* | linux* | osf* | solaris*)
-        ax_pthread_check_macro="_REENTRANT"
-        ;;
-
-        aix*)
-        ax_pthread_check_macro="_THREAD_SAFE"
-        ;;
-
-        *)
-        ax_pthread_check_macro="--"
-        ;;
-esac
-AS_IF([test "x$ax_pthread_check_macro" = "x--"],
-      [ax_pthread_check_cond=0],
-      [ax_pthread_check_cond="!defined($ax_pthread_check_macro)"])
-
-
-if test "x$ax_pthread_ok" = "xno"; then
-for ax_pthread_try_flag in $ax_pthread_flags; do
-
-        case $ax_pthread_try_flag in
-                none)
-                AC_MSG_CHECKING([whether pthreads work without any flags])
-                ;;
-
-                *,*)
-                PTHREAD_CFLAGS=`echo $ax_pthread_try_flag | sed "s/^\(.*\),\(.*\)$/\1/"`
-                PTHREAD_LIBS=`echo $ax_pthread_try_flag | sed "s/^\(.*\),\(.*\)$/\2/"`
-                AC_MSG_CHECKING([whether pthreads work with "$PTHREAD_CFLAGS" and "$PTHREAD_LIBS"])
-                ;;
-
-                -*)
-                AC_MSG_CHECKING([whether pthreads work with $ax_pthread_try_flag])
-                PTHREAD_CFLAGS="$ax_pthread_try_flag"
-                ;;
-
-                pthread-config)
-                AC_CHECK_PROG([ax_pthread_config], [pthread-config], [yes], [no])
-                AS_IF([test "x$ax_pthread_config" = "xno"], [continue])
-                PTHREAD_CFLAGS="`pthread-config --cflags`"
-                PTHREAD_LIBS="`pthread-config --ldflags` `pthread-config --libs`"
-                ;;
-
-                *)
-                AC_MSG_CHECKING([for the pthreads library -l$ax_pthread_try_flag])
-                PTHREAD_LIBS="-l$ax_pthread_try_flag"
-                ;;
-        esac
-
-        ax_pthread_save_CFLAGS="$CFLAGS"
-        ax_pthread_save_LIBS="$LIBS"
-        CFLAGS="$CFLAGS $PTHREAD_CFLAGS"
-        LIBS="$PTHREAD_LIBS $LIBS"
-
-        # Check for various functions.  We must include pthread.h,
-        # since some functions may be macros.  (On the Sequent, we
-        # need a special flag -Kthread to make this header compile.)
-        # We check for pthread_join because it is in -lpthread on IRIX
-        # while pthread_create is in libc.  We check for pthread_attr_init
-        # due to DEC craziness with -lpthreads.  We check for
-        # pthread_cleanup_push because it is one of the few pthread
-        # functions on Solaris that doesn't have a non-functional libc stub.
-        # We try pthread_create on general principles.
-
-        AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <pthread.h>
-#                       if $ax_pthread_check_cond
-#                        error "$ax_pthread_check_macro must be defined"
-#                       endif
-                        static void *some_global = NULL;
-                        static void routine(void *a)
-                          {
-                             /* To avoid any unused-parameter or
-                                unused-but-set-parameter warning.  */
-                             some_global = a;
-                          }
-                        static void *start_routine(void *a) { return a; }],
-                       [pthread_t th; pthread_attr_t attr;
-                        pthread_create(&th, 0, start_routine, 0);
-                        pthread_join(th, 0);
-                        pthread_attr_init(&attr);
-                        pthread_cleanup_push(routine, 0);
-                        pthread_cleanup_pop(0) /* ; */])],
-            [ax_pthread_ok=yes],
-            [])
-
-        CFLAGS="$ax_pthread_save_CFLAGS"
-        LIBS="$ax_pthread_save_LIBS"
-
-        AC_MSG_RESULT([$ax_pthread_ok])
-        AS_IF([test "x$ax_pthread_ok" = "xyes"], [break])
-
-        PTHREAD_LIBS=""
-        PTHREAD_CFLAGS=""
-done
-fi
-
-
-# Clang needs special handling, because older versions handle the -pthread
-# option in a rather... idiosyncratic way
-
-if test "x$ax_pthread_clang" = "xyes"; then
-
-        # Clang takes -pthread; it has never supported any other flag
-
-        # (Note 1: This will need to be revisited if a system that Clang
-        # supports has POSIX threads in a separate library.  This tends not
-        # to be the way of modern systems, but it's conceivable.)
-
-        # (Note 2: On some systems, notably Darwin, -pthread is not needed
-        # to get POSIX threads support; the API is always present and
-        # active.  We could reasonably leave PTHREAD_CFLAGS empty.  But
-        # -pthread does define _REENTRANT, and while the Darwin headers
-        # ignore this macro, third-party headers might not.)
-
-        # However, older versions of Clang make a point of warning the user
-        # that, in an invocation where only linking and no compilation is
-        # taking place, the -pthread option has no effect ("argument unused
-        # during compilation").  They expect -pthread to be passed in only
-        # when source code is being compiled.
-        #
-        # Problem is, this is at odds with the way Automake and most other
-        # C build frameworks function, which is that the same flags used in
-        # compilation (CFLAGS) are also used in linking.  Many systems
-        # supported by AX_PTHREAD require exactly this for POSIX threads
-        # support, and in fact it is often not straightforward to specify a
-        # flag that is used only in the compilation phase and not in
-        # linking.  Such a scenario is extremely rare in practice.
-        #
-        # Even though use of the -pthread flag in linking would only print
-        # a warning, this can be a nuisance for well-run software projects
-        # that build with -Werror.  So if the active version of Clang has
-        # this misfeature, we search for an option to squash it.
-
-        AC_CACHE_CHECK([whether Clang needs flag to prevent "argument unused" warning when linking with -pthread],
-            [ax_cv_PTHREAD_CLANG_NO_WARN_FLAG],
-            [ax_cv_PTHREAD_CLANG_NO_WARN_FLAG=unknown
-             # Create an alternate version of $ac_link that compiles and
-             # links in two steps (.c -> .o, .o -> exe) instead of one
-             # (.c -> exe), because the warning occurs only in the second
-             # step
-             ax_pthread_save_ac_link="$ac_link"
-             ax_pthread_sed='s/conftest\.\$ac_ext/conftest.$ac_objext/g'
-             ax_pthread_link_step=`AS_ECHO(["$ac_link"]) | sed "$ax_pthread_sed"`
-             ax_pthread_2step_ac_link="($ac_compile) && (echo ==== >&5) && ($ax_pthread_link_step)"
-             ax_pthread_save_CFLAGS="$CFLAGS"
-             for ax_pthread_try in '' -Qunused-arguments -Wno-unused-command-line-argument unknown; do
-                AS_IF([test "x$ax_pthread_try" = "xunknown"], [break])
-                CFLAGS="-Werror -Wunknown-warning-option $ax_pthread_try -pthread $ax_pthread_save_CFLAGS"
-                ac_link="$ax_pthread_save_ac_link"
-                AC_LINK_IFELSE([AC_LANG_SOURCE([[int main(void){return 0;}]])],
-                    [ac_link="$ax_pthread_2step_ac_link"
-                     AC_LINK_IFELSE([AC_LANG_SOURCE([[int main(void){return 0;}]])],
-                         [break])
-                    ])
-             done
-             ac_link="$ax_pthread_save_ac_link"
-             CFLAGS="$ax_pthread_save_CFLAGS"
-             AS_IF([test "x$ax_pthread_try" = "x"], [ax_pthread_try=no])
-             ax_cv_PTHREAD_CLANG_NO_WARN_FLAG="$ax_pthread_try"
-            ])
-
-        case "$ax_cv_PTHREAD_CLANG_NO_WARN_FLAG" in
-                no | unknown) ;;
-                *) PTHREAD_CFLAGS="$ax_cv_PTHREAD_CLANG_NO_WARN_FLAG $PTHREAD_CFLAGS" ;;
-        esac
-
-fi # $ax_pthread_clang = yes
-
-
-
-# Various other checks:
-if test "x$ax_pthread_ok" = "xyes"; then
-        ax_pthread_save_CFLAGS="$CFLAGS"
-        ax_pthread_save_LIBS="$LIBS"
-        CFLAGS="$CFLAGS $PTHREAD_CFLAGS"
-        LIBS="$PTHREAD_LIBS $LIBS"
-
-        # Detect AIX lossage: JOINABLE attribute is called UNDETACHED.
-        AC_CACHE_CHECK([for joinable pthread attribute],
-            [ax_cv_PTHREAD_JOINABLE_ATTR],
-            [ax_cv_PTHREAD_JOINABLE_ATTR=unknown
-             for ax_pthread_attr in PTHREAD_CREATE_JOINABLE PTHREAD_CREATE_UNDETACHED; do
-                 AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <pthread.h>],
-                                                 [int attr = $ax_pthread_attr; return attr /* ; */])],
-                                [ax_cv_PTHREAD_JOINABLE_ATTR=$ax_pthread_attr; break],
-                                [])
-             done
-            ])
-        AS_IF([test "x$ax_cv_PTHREAD_JOINABLE_ATTR" != "xunknown" && \
-               test "x$ax_cv_PTHREAD_JOINABLE_ATTR" != "xPTHREAD_CREATE_JOINABLE" && \
-               test "x$ax_pthread_joinable_attr_defined" != "xyes"],
-              [AC_DEFINE_UNQUOTED([PTHREAD_CREATE_JOINABLE],
-                                  [$ax_cv_PTHREAD_JOINABLE_ATTR],
-                                  [Define to necessary symbol if this constant
-                                   uses a non-standard name on your system.])
-               ax_pthread_joinable_attr_defined=yes
-              ])
-
-        AC_CACHE_CHECK([whether more special flags are required for pthreads],
-            [ax_cv_PTHREAD_SPECIAL_FLAGS],
-            [ax_cv_PTHREAD_SPECIAL_FLAGS=no
-             case $host_os in
-             solaris*)
-             ax_cv_PTHREAD_SPECIAL_FLAGS="-D_POSIX_PTHREAD_SEMANTICS"
-             ;;
-             esac
-            ])
-        AS_IF([test "x$ax_cv_PTHREAD_SPECIAL_FLAGS" != "xno" && \
-               test "x$ax_pthread_special_flags_added" != "xyes"],
-              [PTHREAD_CFLAGS="$ax_cv_PTHREAD_SPECIAL_FLAGS $PTHREAD_CFLAGS"
-               ax_pthread_special_flags_added=yes])
-
-        AC_CACHE_CHECK([for PTHREAD_PRIO_INHERIT],
-            [ax_cv_PTHREAD_PRIO_INHERIT],
-            [AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <pthread.h>]],
-                                             [[int i = PTHREAD_PRIO_INHERIT;
-                                               return i;]])],
-                            [ax_cv_PTHREAD_PRIO_INHERIT=yes],
-                            [ax_cv_PTHREAD_PRIO_INHERIT=no])
-            ])
-        AS_IF([test "x$ax_cv_PTHREAD_PRIO_INHERIT" = "xyes" && \
-               test "x$ax_pthread_prio_inherit_defined" != "xyes"],
-              [AC_DEFINE([HAVE_PTHREAD_PRIO_INHERIT], [1], [Have PTHREAD_PRIO_INHERIT.])
-               ax_pthread_prio_inherit_defined=yes
-              ])
-
-        CFLAGS="$ax_pthread_save_CFLAGS"
-        LIBS="$ax_pthread_save_LIBS"
-
-        # More AIX lossage: compile with *_r variant
-        if test "x$GCC" != "xyes"; then
-            case $host_os in
-                aix*)
-                AS_CASE(["x/$CC"],
-                    [x*/c89|x*/c89_128|x*/c99|x*/c99_128|x*/cc|x*/cc128|x*/xlc|x*/xlc_v6|x*/xlc128|x*/xlc128_v6],
-                    [#handle absolute path differently from PATH based program lookup
-                     AS_CASE(["x$CC"],
-                         [x/*],
-                         [
-			   AS_IF([AS_EXECUTABLE_P([${CC}_r])],[PTHREAD_CC="${CC}_r"])
-			   AS_IF([test "x${CXX}" != "x"], [AS_IF([AS_EXECUTABLE_P([${CXX}_r])],[PTHREAD_CXX="${CXX}_r"])])
-			 ],
-                         [
-			   AC_CHECK_PROGS([PTHREAD_CC],[${CC}_r],[$CC])
-			   AS_IF([test "x${CXX}" != "x"], [AC_CHECK_PROGS([PTHREAD_CXX],[${CXX}_r],[$CXX])])
-			 ]
-                     )
-                    ])
-                ;;
-            esac
-        fi
-fi
-
-test -n "$PTHREAD_CC" || PTHREAD_CC="$CC"
-test -n "$PTHREAD_CXX" || PTHREAD_CXX="$CXX"
-
-AC_SUBST([PTHREAD_LIBS])
-AC_SUBST([PTHREAD_CFLAGS])
-AC_SUBST([PTHREAD_CC])
-AC_SUBST([PTHREAD_CXX])
-
-# Finally, execute ACTION-IF-FOUND/ACTION-IF-NOT-FOUND:
-if test "x$ax_pthread_ok" = "xyes"; then
-        ifelse([$1],,[AC_DEFINE([HAVE_PTHREAD],[1],[Define if you have POSIX threads libraries and header files.])],[$1])
-        :
-else
-        ax_pthread_ok=no
-        $2
-fi
-AC_LANG_POP
-])dnl AX_PTHREAD
diff --git a/m4/mode_t.m4 b/m4/mode_t.m4
deleted file mode 100644
index 40f612a61248..000000000000
--- a/m4/mode_t.m4
+++ /dev/null
@@ -1,26 +0,0 @@
-# mode_t.m4 serial 2
-dnl Copyright (C) 2009-2012 Free Software Foundation, Inc.
-dnl This file is free software; the Free Software Foundation
-dnl gives unlimited permission to copy and/or distribute it,
-dnl with or without modifications, as long as this notice is preserved.
-
-# For using mode_t, it's sufficient to use AC_TYPE_MODE_T and
-# include <sys/types.h>.
-
-# Define PROMOTED_MODE_T to the type that is the result of "default argument
-# promotion" (ISO C 6.5.2.2.(6)) of the type mode_t.
-AC_DEFUN([gl_PROMOTED_TYPE_MODE_T],
-[
-  AC_REQUIRE([AC_TYPE_MODE_T])
-  AC_CACHE_CHECK([for promoted mode_t type], [gl_cv_promoted_mode_t], [
-    dnl Assume mode_t promotes to 'int' if and only if it is smaller than 'int',
-    dnl and to itself otherwise. This assumption is not guaranteed by the ISO C
-    dnl standard, but we don't know of any real-world counterexamples.
-    AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <sys/types.h>]],
-      [[typedef int array[2 * (sizeof (mode_t) < sizeof (int)) - 1];]])],
-      [gl_cv_promoted_mode_t='int'],
-      [gl_cv_promoted_mode_t='mode_t'])
-  ])
-  AC_DEFINE_UNQUOTED([PROMOTED_MODE_T], [$gl_cv_promoted_mode_t],
-    [Define to the type that is the result of default argument promotions of type mode_t.])
-])
diff --git a/m4/visibility.m4 b/m4/visibility.m4
deleted file mode 100644
index d161bd7f72a0..000000000000
--- a/m4/visibility.m4
+++ /dev/null
@@ -1,82 +0,0 @@
-# visibility.m4 serial 8
-dnl Copyright (C) 2005, 2008, 2010-2021 Free Software Foundation, Inc.
-dnl This file is free software; the Free Software Foundation
-dnl gives unlimited permission to copy and/or distribute it,
-dnl with or without modifications, as long as this notice is preserved.
-
-dnl From Bruno Haible.
-
-dnl Tests whether the compiler supports the command-line option
-dnl -fvisibility=hidden and the function and variable attributes
-dnl __attribute__((__visibility__("hidden"))) and
-dnl __attribute__((__visibility__("default"))).
-dnl Does *not* test for __visibility__("protected") - which has tricky
-dnl semantics (see the 'vismain' test in glibc) and does not exist e.g. on
-dnl Mac OS X.
-dnl Does *not* test for __visibility__("internal") - which has processor
-dnl dependent semantics.
-dnl Does *not* test for #pragma GCC visibility push(hidden) - which is
-dnl "really only recommended for legacy code".
-dnl Set the variable CFLAG_VISIBILITY.
-dnl Defines and sets the variable HAVE_VISIBILITY.
-
-AC_DEFUN([gl_VISIBILITY],
-[
-  AC_REQUIRE([AC_PROG_CC])
-  CFLAG_VISIBILITY=
-  HAVE_VISIBILITY=0
-  if test -n "$GCC"; then
-    dnl First, check whether -Werror can be added to the command line, or
-    dnl whether it leads to an error because of some other option that the
-    dnl user has put into $CC $CFLAGS $CPPFLAGS.
-    AC_CACHE_CHECK([whether the -Werror option is usable],
-      [gl_cv_cc_vis_werror],
-      [gl_save_CFLAGS="$CFLAGS"
-       CFLAGS="$CFLAGS -Werror"
-       AC_COMPILE_IFELSE(
-         [AC_LANG_PROGRAM([[]], [[]])],
-         [gl_cv_cc_vis_werror=yes],
-         [gl_cv_cc_vis_werror=no])
-       CFLAGS="$gl_save_CFLAGS"
-      ])
-    dnl Now check whether visibility declarations are supported.
-    AC_CACHE_CHECK([for simple visibility declarations],
-      [gl_cv_cc_visibility],
-      [gl_save_CFLAGS="$CFLAGS"
-       CFLAGS="$CFLAGS -fvisibility=hidden"
-       dnl We use the option -Werror and a function dummyfunc, because on some
-       dnl platforms (Cygwin 1.7) the use of -fvisibility triggers a warning
-       dnl "visibility attribute not supported in this configuration; ignored"
-       dnl at the first function definition in every compilation unit, and we
-       dnl don't want to use the option in this case.
-       if test $gl_cv_cc_vis_werror = yes; then
-         CFLAGS="$CFLAGS -Werror"
-       fi
-       AC_COMPILE_IFELSE(
-         [AC_LANG_PROGRAM(
-            [[extern __attribute__((__visibility__("hidden"))) int hiddenvar;
-              extern __attribute__((__visibility__("default"))) int exportedvar;
-              extern __attribute__((__visibility__("hidden"))) int hiddenfunc (void);
-              extern __attribute__((__visibility__("default"))) int exportedfunc (void);
-              void dummyfunc (void);
-              int hiddenvar;
-              int exportedvar;
-              int hiddenfunc (void) { return 51; }
-              int exportedfunc (void) { return 1225736919; }
-              void dummyfunc (void) {}
-            ]],
-            [[]])],
-         [gl_cv_cc_visibility=yes],
-         [gl_cv_cc_visibility=no])
-       CFLAGS="$gl_save_CFLAGS"
-      ])
-    if test $gl_cv_cc_visibility = yes; then
-      CFLAG_VISIBILITY="-fvisibility=hidden"
-      HAVE_VISIBILITY=1
-    fi
-  fi
-  AC_SUBST([CFLAG_VISIBILITY])
-  AC_SUBST([HAVE_VISIBILITY])
-  AC_DEFINE_UNQUOTED([HAVE_VISIBILITY], [$HAVE_VISIBILITY],
-    [Define to 1 or 0, depending whether the compiler supports simple visibility declarations.])
-])
diff --git a/utils/Makefile.am b/utils/Makefile.am
deleted file mode 100644
index b2a6ac211473..000000000000
--- a/utils/Makefile.am
+++ /dev/null
@@ -1,41 +0,0 @@
-SUBDIRS = \
-	libv4l2util \
-	libmedia_dev \
-	ivtv-ctl \
-	ir-ctl \
-	cx18-ctl \
-	keytable \
-	media-ctl \
-	v4l2-ctl \
-	v4l2-dbg \
-	v4l2-sysfs-path \
-	libcecutil \
-	cec-ctl \
-	cec-compliance \
-	cec-follower \
-	rds-ctl
-
-if WITH_V4L2_TRACER
-SUBDIRS += \
-	v4l2-tracer
-endif
-
-if WITH_LIBDVBV5
-SUBDIRS += \
-	dvb
-endif
-
-if WITH_V4L2_COMPLIANCE
-SUBDIRS += \
-	v4l2-compliance
-endif
-
-if WITH_QV4L2
-SUBDIRS += qv4l2
-endif
-
-if WITH_QVIDCAP
-SUBDIRS += qvidcap
-endif
-
-EXTRA_DIST = common
diff --git a/utils/cec-compliance/.gitignore b/utils/cec-compliance/.gitignore
deleted file mode 100644
index 2093e3b44067..000000000000
--- a/utils/cec-compliance/.gitignore
+++ /dev/null
@@ -1,2 +0,0 @@
-cec-compliance
-cec-compliance.1
diff --git a/utils/cec-compliance/Makefile.am b/utils/cec-compliance/Makefile.am
deleted file mode 100644
index 81a68370ed37..000000000000
--- a/utils/cec-compliance/Makefile.am
+++ /dev/null
@@ -1,8 +0,0 @@
-bin_PROGRAMS = cec-compliance
-man_MANS = cec-compliance.1
-
-cec_compliance_SOURCES = cec-compliance.cpp cec-compliance.h cec-test.cpp cec-test-adapter.cpp cec-test-audio.cpp cec-test-power.cpp cec-test-fuzzing.cpp cec-test-tuner-record-timer.cpp
-cec_compliance_CPPFLAGS = -I$(top_srcdir)/utils/libcecutil $(GIT_SHA) $(GIT_COMMIT_CNT) $(GIT_COMMIT_DATE)
-cec_compliance_LDADD = -lrt ../libcecutil/libcecutil.la
-
-EXTRA_DIST = cec-compliance.1
diff --git a/utils/cec-ctl/.gitignore b/utils/cec-ctl/.gitignore
deleted file mode 100644
index f37a33eb0349..000000000000
--- a/utils/cec-ctl/.gitignore
+++ /dev/null
@@ -1,2 +0,0 @@
-cec-ctl
-cec-ctl.1
diff --git a/utils/cec-ctl/Makefile.am b/utils/cec-ctl/Makefile.am
deleted file mode 100644
index 27e69494e9ba..000000000000
--- a/utils/cec-ctl/Makefile.am
+++ /dev/null
@@ -1,8 +0,0 @@
-bin_PROGRAMS = cec-ctl
-man_MANS = cec-ctl.1
-
-cec_ctl_SOURCES = cec-ctl.cpp cec-pin.cpp cec-ctl.h
-cec_ctl_CPPFLAGS = -I$(top_srcdir)/utils/libcecutil $(GIT_SHA) $(GIT_COMMIT_CNT) $(GIT_COMMIT_DATE)
-cec_ctl_LDADD = -lrt -lpthread ../libcecutil/libcecutil.la
-
-EXTRA_DIST = cec-ctl.1
diff --git a/utils/cec-follower/.gitignore b/utils/cec-follower/.gitignore
deleted file mode 100644
index 29546d1fd20a..000000000000
--- a/utils/cec-follower/.gitignore
+++ /dev/null
@@ -1,2 +0,0 @@
-cec-follower
-cec-follower.1
diff --git a/utils/cec-follower/Makefile.am b/utils/cec-follower/Makefile.am
deleted file mode 100644
index 903d37154d2e..000000000000
--- a/utils/cec-follower/Makefile.am
+++ /dev/null
@@ -1,8 +0,0 @@
-bin_PROGRAMS = cec-follower
-man_MANS = cec-follower.1
-
-cec_follower_SOURCES = cec-follower.cpp cec-follower.h cec-processing.cpp cec-tuner.cpp
-cec_follower_CPPFLAGS = -I$(top_srcdir)/utils/libcecutil $(GIT_SHA) $(GIT_COMMIT_CNT) $(GIT_COMMIT_DATE)
-cec_follower_LDADD = -lrt ../libcecutil/libcecutil.la
-
-EXTRA_DIST = cec-follower.1
diff --git a/utils/cx18-ctl/.gitignore b/utils/cx18-ctl/.gitignore
deleted file mode 100644
index 15fd535bd13c..000000000000
--- a/utils/cx18-ctl/.gitignore
+++ /dev/null
@@ -1 +0,0 @@
-cx18-ctl
diff --git a/utils/cx18-ctl/Makefile.am b/utils/cx18-ctl/Makefile.am
deleted file mode 100644
index 94fce36d4bf4..000000000000
--- a/utils/cx18-ctl/Makefile.am
+++ /dev/null
@@ -1,3 +0,0 @@
-bin_PROGRAMS = cx18-ctl
-
-cx18_ctl_SOURCES = cx18-ctl.c
diff --git a/utils/dvb/.gitignore b/utils/dvb/.gitignore
deleted file mode 100644
index 6123e5ab61b8..000000000000
--- a/utils/dvb/.gitignore
+++ /dev/null
@@ -1,9 +0,0 @@
-dvb-fe-tool
-dvb-fe-tool.1
-dvb-format-convert
-dvb-format-convert.1
-dvbv5-scan
-dvbv5-scan.1
-dvbv5-zap
-dvbv5-zap.1
-dvbv5-daemon
diff --git a/utils/dvb/Makefile.am b/utils/dvb/Makefile.am
deleted file mode 100644
index 1895018a1c68..000000000000
--- a/utils/dvb/Makefile.am
+++ /dev/null
@@ -1,35 +0,0 @@
-bin_PROGRAMS = dvb-fe-tool dvbv5-zap dvbv5-scan dvb-format-convert
-
-if WITH_DVBV5_REMOTE
-bin_PROGRAMS += \
-	dvbv5-daemon
-endif
-
-man_MANS = dvb-fe-tool.1 dvbv5-zap.1 dvbv5-scan.1 dvb-format-convert.1
-
-dvb_fe_tool_SOURCES = dvb-fe-tool.c
-dvb_fe_tool_LDADD = ../../lib/libdvbv5/libdvbv5.la @LIBINTL@ $(LIBUDEV_LIBS) $(XMLRPC_LDADD) $(PTHREAD_LDADD)
-dvb_fe_tool_LDFLAGS = $(ARGP_LIBS) -lm $(LIBUDEV_CFLAGS) $(XMLRPC_LDFLAGS) $(PTHREAD_LDFLAGS)
-dvb_fe_tool_CFLAGS =  $(XMLRPC_CFLAGS) $(LIBUDEV_CFLAGS) $(PTHREAD_CFLAGS)
-
-dvbv5_zap_SOURCES = dvbv5-zap.c
-dvbv5_zap_LDADD = ../../lib/libdvbv5/libdvbv5.la @LIBINTL@ $(LIBUDEV_LIBS) $(XMLRPC_LDADD) $(PTHREAD_LDADD)
-dvbv5_zap_LDFLAGS = $(ARGP_LIBS) -lm $(LIBUDEV_CFLAGS) $(XMLRPC_LDFLAGS) $(PTHREAD_LDFLAGS)
-dvbv5_zap_CFLAGS =  $(XMLRPC_CFLAGS) $(LIBUDEV_CFLAGS) $(PTHREAD_CFLAGS)
-
-dvbv5_scan_SOURCES = dvbv5-scan.c
-dvbv5_scan_LDADD = ../../lib/libdvbv5/libdvbv5.la @LIBINTL@ $(LIBUDEV_LIBS) $(XMLRPC_LDADD) $(PTHREAD_LDADD)
-dvbv5_scan_LDFLAGS = $(ARGP_LIBS) -lm $(LIBUDEV_CFLAGS) $(XMLRPC_LDFLAGS) $(PTHREAD_LDFLAGS)
-dvbv5_scan_CFLAGS =  $(XMLRPC_CFLAGS) $(LIBUDEV_CFLAGS) $(PTHREAD_CFLAGS)
-
-dvb_format_convert_SOURCES = dvb-format-convert.c
-dvb_format_convert_LDADD = ../../lib/libdvbv5/libdvbv5.la @LIBINTL@ $(LIBUDEV_LIBS) $(XMLRPC_LDADD) $(PTHREAD_LDADD)
-dvb_format_convert_LDFLAGS = $(ARGP_LIBS) -lm $(LIBUDEV_CFLAGS) $(XMLRPC_LDFLAGS) $(PTHREAD_LDFLAGS)
-dvb_format_convert_CFLAGS =  $(XMLRPC_CFLAGS) $(LIBUDEV_CFLAGS) $(PTHREAD_CFLAGS)
-
-dvbv5_daemon_SOURCES = dvbv5-daemon.c
-dvbv5_daemon_LDADD = ../../lib/libdvbv5/libdvbv5.la @LIBINTL@ $(LIBUDEV_LIBS) $(XMLRPC_LDADD) $(PTHREAD_LDADD)
-dvbv5_daemon_LDFLAGS = $(ARGP_LIBS) -lm $(XMLRPC_LDFLAGS) $(PTHREAD_LDFLAGS)
-dvbv5_daemon_CFLAGS =  $(XMLRPC_CFLAGS) $(LIBUDEV_CFLAGS) $(PTHREAD_CFLAGS)
-
-EXTRA_DIST = README
diff --git a/utils/ir-ctl/.gitignore b/utils/ir-ctl/.gitignore
deleted file mode 100644
index 3220d69f7385..000000000000
--- a/utils/ir-ctl/.gitignore
+++ /dev/null
@@ -1,2 +0,0 @@
-ir-ctl
-ir-ctl.1
diff --git a/utils/ir-ctl/Makefile.am b/utils/ir-ctl/Makefile.am
deleted file mode 100644
index ad90b84e6c98..000000000000
--- a/utils/ir-ctl/Makefile.am
+++ /dev/null
@@ -1,6 +0,0 @@
-bin_PROGRAMS = ir-ctl
-man_MANS = ir-ctl.1
-
-ir_ctl_SOURCES = ir-ctl.c ir-encode.c ir-encode.h toml.c toml.h keymap.c keymap.h bpf_encoder.c bpf_encoder.h
-ir_ctl_LDADD = @LIBINTL@
-ir_ctl_LDFLAGS = $(ARGP_LIBS)
diff --git a/utils/ivtv-ctl/.gitignore b/utils/ivtv-ctl/.gitignore
deleted file mode 100644
index 17a8eb65b3d9..000000000000
--- a/utils/ivtv-ctl/.gitignore
+++ /dev/null
@@ -1 +0,0 @@
-ivtv-ctl
diff --git a/utils/ivtv-ctl/Makefile.am b/utils/ivtv-ctl/Makefile.am
deleted file mode 100644
index c1196673a9cc..000000000000
--- a/utils/ivtv-ctl/Makefile.am
+++ /dev/null
@@ -1,4 +0,0 @@
-bin_PROGRAMS = ivtv-ctl
-
-ivtv_ctl_SOURCES = ivtv-ctl.c
-ivtv_ctl_LDFLAGS = -lm
diff --git a/utils/keytable/.gitignore b/utils/keytable/.gitignore
deleted file mode 100644
index 460e4a13736a..000000000000
--- a/utils/keytable/.gitignore
+++ /dev/null
@@ -1,3 +0,0 @@
-ir-keytable
-ir-keytable.1
-rc_keymap.5
diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
deleted file mode 100644
index eee61f0e0551..000000000000
--- a/utils/keytable/Makefile.am
+++ /dev/null
@@ -1,36 +0,0 @@
-bin_PROGRAMS = ir-keytable
-man_MANS = ir-keytable.1 rc_keymap.5
-sysconf_DATA = rc_maps.cfg
-keytablesystem_DATA = $(srcdir)/rc_keymaps/*
-udevrules_DATA = 70-infrared.rules
-if WITH_BPF
-if HAVE_SYSTEMD
-if HAVE_UDEVDSYSCALLFILTER
-systemdsystemunit_DATA = 50-rc_keymap.conf
-endif
-endif
-endif
-
-ir_keytable_SOURCES = keytable.c parse.h ir-encode.c ir-encode.h toml.c toml.h keymap.c keymap.h
-
-if WITH_BPF
-ir_keytable_SOURCES += bpf_load.c bpf_load.h
-endif
-
-ir_keytable_LDADD = @LIBINTL@
-ir_keytable_LDFLAGS = $(ARGP_LIBS)
-
-if WITH_BPF
-ir_keytable_LDFLAGS += $(LIBELF_LIBS) $(LIBBPF_LIBS)
-ir_keytable_CFLAGS = $(LIBBPF_CFLAGS)
-SUBDIRS = bpf_protocols
-endif
-
-EXTRA_DIST = 70-infrared.rules 50-rc_keymap.conf rc_keymaps rc_keymaps_userspace gen_input_events.pl gen_keytables.pl ir-keytable.1 rc_maps.cfg rc_keymap.5
-
-check:
-	@$(foreach keymap,$(wildcard $(keytablesystem_DATA)),./ir-keytable --test-keymap=$(keymap);)
-
-# custom target
-install-data-local:
-	$(install_sh) -d "$(DESTDIR)$(keytableuserdir)"
diff --git a/utils/keytable/bpf_protocols/Makefile.am b/utils/keytable/bpf_protocols/Makefile.am
deleted file mode 100644
index 6096c0de5813..000000000000
--- a/utils/keytable/bpf_protocols/Makefile.am
+++ /dev/null
@@ -1,24 +0,0 @@
-# Get Clang's default includes on this system, as opposed to those seen by
-# '-target bpf'. This fixes "missing" files on some architectures/distros,
-# such as asm/byteorder.h, asm/socket.h, asm/sockios.h, sys/cdefs.h etc.
-#
-# Use '-idirafter': Don't interfere with include mechanics except where the
-# build would have failed anyways.
-CLANG_SYS_INCLUDES := $(shell $(CLANG) -v -E - </dev/null 2>&1 \
-        | sed -n '/<...> search starts here:/,/End of search list./{ s| \(/.*\)|-idirafter \1|p }')
-
-%.o: %.c bpf_helpers.h
-	$(CLANG) $(CLANG_SYS_INCLUDES) -D__linux__ -I$(top_srcdir)/include -target bpf -fno-stack-protector -O2 -c $<
-
-PROTOCOLS = grundig.o pulse_distance.o pulse_length.o rc_mm.o manchester.o xbox-dvd.o imon_rsc.o raw.o samsung36.o
-
-all: $(PROTOCOLS)
-
-CLEANFILES = $(PROTOCOLS)
-EXTRA_DIST = $(PROTOCOLS:%.o=%.c) bitmap.h bpf_helpers.h
-
-# custom target
-install-data-local:
-	$(install_sh) -d "$(DESTDIR)$(keytableuserdir)/protocols"
-	$(install_sh) -d "$(DESTDIR)$(keytablesystemdir)/protocols"
-	$(install_sh) -m 0644 $(PROTOCOLS) "$(DESTDIR)$(keytablesystemdir)/protocols"
diff --git a/utils/libcecutil/.gitignore b/utils/libcecutil/.gitignore
deleted file mode 100644
index 49a48b9a1973..000000000000
--- a/utils/libcecutil/.gitignore
+++ /dev/null
@@ -1,4 +0,0 @@
-cec-log-gen.h
-cec-parse-gen.h
-cec-parse-src-gen.h
-cec-msgs-gen.h
diff --git a/utils/libcecutil/Makefile.am b/utils/libcecutil/Makefile.am
deleted file mode 100644
index d2c7ddccd7ab..000000000000
--- a/utils/libcecutil/Makefile.am
+++ /dev/null
@@ -1,24 +0,0 @@
-noinst_LTLIBRARIES = libcecutil.la
-
-libcecutil_la_SOURCES = cec-info.cpp cec-log.cpp cec-parse.cpp cec-info.h cec-log.h cec-parse.h \
-			cec-htng.h cec-htng-funcs.h
-libcecutil_la_CPPFLAGS = -static -I$(top_srcdir)/utils/common
-libcecutil_la_LDFLAGS = -static
-
-CEC_GEN_PREREQS = $(top_srcdir)/include/linux/cec.h $(top_srcdir)/utils/libcecutil/cec-htng.h \
-		$(top_srcdir)/include/linux/cec-funcs.h $(top_srcdir)/utils/libcecutil/cec-htng-funcs.h
-CEC_GEN_HDRS = cec-log-gen.h cec-parse-gen.h cec-parse-src-gen.h cec-msgs-gen.h
-
-cec-info.cpp cec-log.cpp cec-parse.cpp: $(CEC_GEN_HDRS)
-
-$(CEC_GEN_HDRS): gen.intermediate ;
-
-.INTERMEDIATE: gen.intermediate
-
-gen.intermediate: cec-gen.pl $(CEC_GEN_PREREQS)
-	$(AM_V_GEN) $(top_srcdir)/utils/libcecutil/cec-gen.pl $(CEC_GEN_PREREQS)
-
-clean-local:
-	-rm -vf $(CEC_GEN_HDRS)
-
-EXTRA_DIST = cec-gen.pl
diff --git a/utils/libmedia_dev/Makefile.am b/utils/libmedia_dev/Makefile.am
deleted file mode 100644
index 3796efbdd651..000000000000
--- a/utils/libmedia_dev/Makefile.am
+++ /dev/null
@@ -1,7 +0,0 @@
-noinst_LTLIBRARIES = libmedia_dev.la
-
-libmedia_dev_la_SOURCES = get_media_devices.c get_media_devices.h
-libmedia_dev_la_CPPFLAGS = -static
-libmedia_dev_la_LDFLAGS = -static
-
-EXTRA_DIST = README
diff --git a/utils/libv4l2util/Makefile.am b/utils/libv4l2util/Makefile.am
deleted file mode 100644
index eb11017aa869..000000000000
--- a/utils/libv4l2util/Makefile.am
+++ /dev/null
@@ -1,7 +0,0 @@
-noinst_LTLIBRARIES = libv4l2util.la
-
-libv4l2util_la_SOURCES = frequencies.c v4l2_driver.c v4l2_driver.h libv4l2util.h
-libv4l2util_la_CPPFLAGS = -static
-libv4l2util_la_LDFLAGS = -static
-
-EXTRA_DIST = TODO
diff --git a/utils/media-ctl/.gitignore b/utils/media-ctl/.gitignore
deleted file mode 100644
index 5354fec12a6a..000000000000
--- a/utils/media-ctl/.gitignore
+++ /dev/null
@@ -1,3 +0,0 @@
-media-ctl
-media-bus-format-names.h
-media-bus-format-codes.h
diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
deleted file mode 100644
index c48c8d629284..000000000000
--- a/utils/media-ctl/Makefile.am
+++ /dev/null
@@ -1,30 +0,0 @@
-noinst_LTLIBRARIES = libmediactl.la libv4l2subdev.la
-
-libmediactl_la_SOURCES = libmediactl.c mediactl-priv.h
-libmediactl_la_CFLAGS = -static $(LIBUDEV_CFLAGS)
-libmediactl_la_LDFLAGS = -static $(LIBUDEV_LIBS)
-
-media-bus-format-names.h: ../../include/linux/media-bus-format.h
-	$(AM_V_GEN) sed -e '/#define MEDIA_BUS_FMT/ ! d; s/.*FMT_//; /FIXED/ d; s/\t.*//; s/.*/{ \"&\", MEDIA_BUS_FMT_& },/;' \
-	< $< > $@
-
-media-bus-format-codes.h: ../../include/linux/media-bus-format.h
-	$(AM_V_GEN) sed -e '/#define MEDIA_BUS_FMT/ ! d; s/.*#define //; /FIXED/ d; s/\t.*//; s/.*/ &,/;' \
-	< $< > $@
-
-BUILT_SOURCES = media-bus-format-names.h media-bus-format-codes.h
-CLEANFILES = $(BUILT_SOURCES)
-
-nodist_libv4l2subdev_la_SOURCES = $(BUILT_SOURCES)
-libv4l2subdev_la_SOURCES = libv4l2subdev.c
-libv4l2subdev_la_LIBADD = libmediactl.la
-libv4l2subdev_la_CFLAGS = -static
-libv4l2subdev_la_LDFLAGS = -static
-
-mediactl_includedir=$(includedir)/mediactl
-noinst_HEADERS = mediactl.h v4l2subdev.h
-
-bin_PROGRAMS = media-ctl
-media_ctl_SOURCES = media-ctl.c options.c options.h tools.h
-media_ctl_LDADD = libmediactl.la libv4l2subdev.la
-media_ctl_CFLAGS = $(GIT_COMMIT_CNT)
diff --git a/utils/media-ctl/libmediactl.pc.in b/utils/media-ctl/libmediactl.pc.in
deleted file mode 100644
index dab2ff0a1f5e..000000000000
--- a/utils/media-ctl/libmediactl.pc.in
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=@prefix@
-exec_prefix=@exec_prefix@
-libdir=@libdir@
-includedir=@includedir@
-
-Name: libmediactl
-Description: Media controller library.
-Version: @PACKAGE_VERSION@
-Cflags: -I${includedir}
-Libs: -L${libdir} -lmediactl
diff --git a/utils/media-ctl/libv4l2subdev.pc.in b/utils/media-ctl/libv4l2subdev.pc.in
deleted file mode 100644
index a601b7815e2b..000000000000
--- a/utils/media-ctl/libv4l2subdev.pc.in
+++ /dev/null
@@ -1,11 +0,0 @@
-prefix=@prefix@
-exec_prefix=@exec_prefix@
-libdir=@libdir@
-includedir=@includedir@
-
-Name: libv4l2subdev
-Description: V4L2 subdevice library.
-Requires: libmediactl
-Version: @PACKAGE_VERSION@
-Cflags: -I${includedir}
-Libs: -L${libdir} -lv4l2subdev
diff --git a/utils/qv4l2/.gitignore b/utils/qv4l2/.gitignore
deleted file mode 100644
index 23360843161a..000000000000
--- a/utils/qv4l2/.gitignore
+++ /dev/null
@@ -1,9 +0,0 @@
-Makefile
-moc_capture-win.cpp
-moc_general-tab.cpp
-moc_vbi-tab.cpp
-moc_qv4l2.cpp
-qrc_qv4l2.cpp
-qv4l2
-qv4l2.1
-
diff --git a/utils/qv4l2/Makefile.am b/utils/qv4l2/Makefile.am
deleted file mode 100644
index bef699c09357..000000000000
--- a/utils/qv4l2/Makefile.am
+++ /dev/null
@@ -1,54 +0,0 @@
-bin_PROGRAMS = qv4l2
-man_MANS = qv4l2.1
-
-qv4l2_SOURCES = qv4l2.cpp general-tab.cpp ctrl-tab.cpp vbi-tab.cpp capture-win.cpp tpg-tab.cpp \
-  capture-win-qt.cpp capture-win-qt.h capture-win-gl.cpp capture-win-gl.h alsa_stream.c alsa_stream.h \
-  raw2sliced.cpp qv4l2.h capture-win.h general-tab.h vbi-tab.h raw2sliced.h \
-  v4l2-tpg-core.c v4l2-tpg-colors.c
-nodist_qv4l2_SOURCES = moc_qv4l2.cpp moc_general-tab.cpp moc_capture-win.cpp moc_vbi-tab.cpp qrc_qv4l2.cpp
-qv4l2_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la \
-  ../libv4l2util/libv4l2util.la ../libmedia_dev/libmedia_dev.la
-qv4l2_CPPFLAGS = -I$(top_srcdir)/utils/common
-
-if WITH_QTGL
-qv4l2_CPPFLAGS += $(QTGL_CFLAGS)
-qv4l2_LDFLAGS = $(QTGL_LIBS)
-else
-qv4l2_CPPFLAGS += $(QT_CFLAGS)
-qv4l2_LDFLAGS = $(QT_LIBS)
-endif
-
-qv4l2_CPPFLAGS += $(ALSA_CFLAGS) -Wno-psabi
-qv4l2_LDFLAGS += $(ALSA_LIBS) -pthread
-
-EXTRA_DIST = enterbutt.png exit.png fileopen.png qv4l2_24x24.png qv4l2_64x64.png qv4l2.png qv4l2.svg \
-  snapshot.png video-television.png fileclose.png qv4l2_16x16.png qv4l2_32x32.png qv4l2.desktop \
-  qv4l2.qrc saveraw.png qv4l2.pro qv4l2.1 fullscreenexit.png fullscreen.png start.png step.png
-
-clean-local:
-	-rm -vf moc_*.cpp qrc_*.cpp qrc_*.o ui_*.h
-
-# Call the moc preprocessor
-moc_qv4l2.cpp: $(srcdir)/qv4l2.h
-	$(AM_V_GEN)$(MOC) -o $@ $(srcdir)/qv4l2.h
-
-moc_general-tab.cpp: $(srcdir)/general-tab.h
-	$(AM_V_GEN)$(MOC) -o $@ $(srcdir)/general-tab.h
-
-moc_vbi-tab.cpp: $(srcdir)/vbi-tab.h
-	$(AM_V_GEN)$(MOC) -o $@ $(srcdir)/vbi-tab.h
-
-moc_capture-win.cpp: $(srcdir)/capture-win.h
-	$(AM_V_GEN)$(MOC) -o $@ $(srcdir)/capture-win.h
-
-# Call the Qt resource compiler
-qrc_qv4l2.cpp: $(srcdir)/qv4l2.qrc
-	$(AM_V_GEN)$(RCC) -name qv4l2 -o $@ $(srcdir)/qv4l2.qrc
-
-install-data-local:
-	$(INSTALL_DATA) -D -p "$(srcdir)/qv4l2.desktop"   "$(DESTDIR)$(datadir)/applications/qv4l2.desktop"
-	$(INSTALL_DATA) -D -p "$(srcdir)/qv4l2_16x16.png" "$(DESTDIR)$(datadir)/icons/hicolor/16x16/apps/qv4l2.png"
-	$(INSTALL_DATA) -D -p "$(srcdir)/qv4l2_24x24.png" "$(DESTDIR)$(datadir)/icons/hicolor/24x24/apps/qv4l2.png"
-	$(INSTALL_DATA) -D -p "$(srcdir)/qv4l2_32x32.png" "$(DESTDIR)$(datadir)/icons/hicolor/32x32/apps/qv4l2.png"
-	$(INSTALL_DATA) -D -p "$(srcdir)/qv4l2_64x64.png" "$(DESTDIR)$(datadir)/icons/hicolor/64x64/apps/qv4l2.png"
-	$(INSTALL_DATA) -D -p "$(srcdir)/qv4l2.svg"       "$(DESTDIR)$(datadir)/icons/hicolor/scalable/apps/qv4l2.svg"
diff --git a/utils/qvidcap/.gitignore b/utils/qvidcap/.gitignore
deleted file mode 100644
index 9436aa319ea1..000000000000
--- a/utils/qvidcap/.gitignore
+++ /dev/null
@@ -1,6 +0,0 @@
-Makefile
-moc_capture.cpp
-qrc_qvidcap.cpp
-qvidcap
-qvidcap.1
-v4l2-convert.h
diff --git a/utils/qvidcap/Makefile.am b/utils/qvidcap/Makefile.am
deleted file mode 100644
index 9e873ca1d539..000000000000
--- a/utils/qvidcap/Makefile.am
+++ /dev/null
@@ -1,42 +0,0 @@
-bin_PROGRAMS = qvidcap
-man_MANS = qvidcap.1
-
-qvidcap_SOURCES = qvidcap.cpp qvidcap.h capture.cpp capture.h paint.cpp \
-  v4l2-tpg-colors.c v4l2-tpg-core.c v4l-stream.c v4l2-info.cpp codec-fwht.c codec-v4l2-fwht.c
-nodist_qvidcap_SOURCES = qrc_qvidcap.cpp moc_capture.cpp v4l2-convert.h
-qvidcap_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la ../libv4l2util/libv4l2util.la \
-  ../libmedia_dev/libmedia_dev.la
-qvidcap_CPPFLAGS = -I\$(top_srcdir)/utils/common
-
-qvidcap_CPPFLAGS += $(QTGL_CFLAGS)
-qvidcap_LDFLAGS = $(QTGL_LIBS)
-
-qvidcap_CPPFLAGS += $(ALSA_CFLAGS)
-qvidcap_LDFLAGS += $(ALSA_LIBS) -pthread
-
-EXTRA_DIST = qvidcap_24x24.png qvidcap_64x64.png qvidcap.png qvidcap.svg \
-  qvidcap_16x16.png qvidcap_32x32.png qvidcap.desktop \
-  qvidcap.qrc qvidcap.pro qvidcap.1 v4l2-convert.glsl v4l2-convert.pl
-
-clean-local:
-	-rm -vf moc_*.cpp qrc_*.cpp qrc_*.o ui_*.h v4l2-convert.h formats.h
-
-v4l2-convert.h: v4l2-convert.glsl v4l2-convert.pl
-	$(AM_V_GEN) perl \$(top_srcdir)/utils/qvidcap/v4l2-convert.pl \$(top_srcdir)/utils/qvidcap/v4l2-convert.glsl >$@
-
-paint.cpp: v4l2-convert.h
-
-moc_capture.cpp: $(srcdir)/capture.h
-	$(AM_V_GEN)$(MOC) -o $@ $(srcdir)/capture.h
-
-# Call the Qt resource compiler
-qrc_qvidcap.cpp: $(srcdir)/qvidcap.qrc
-	$(AM_V_GEN)$(RCC) -name qvidcap -o $@ $(srcdir)/qvidcap.qrc
-
-install-data-local:
-	$(INSTALL_DATA) -D -p "$(srcdir)/qvidcap.desktop"   "$(DESTDIR)$(datadir)/applications/qvidcap.desktop"
-	$(INSTALL_DATA) -D -p "$(srcdir)/qvidcap_16x16.png" "$(DESTDIR)$(datadir)/icons/hicolor/16x16/apps/qvidcap.png"
-	$(INSTALL_DATA) -D -p "$(srcdir)/qvidcap_24x24.png" "$(DESTDIR)$(datadir)/icons/hicolor/24x24/apps/qvidcap.png"
-	$(INSTALL_DATA) -D -p "$(srcdir)/qvidcap_32x32.png" "$(DESTDIR)$(datadir)/icons/hicolor/32x32/apps/qvidcap.png"
-	$(INSTALL_DATA) -D -p "$(srcdir)/qvidcap_64x64.png" "$(DESTDIR)$(datadir)/icons/hicolor/64x64/apps/qvidcap.png"
-	$(INSTALL_DATA) -D -p "$(srcdir)/qvidcap.svg"       "$(DESTDIR)$(datadir)/icons/hicolor/scalable/apps/qvidcap.svg"
diff --git a/utils/rds-ctl/.gitignore b/utils/rds-ctl/.gitignore
deleted file mode 100644
index 6e37033dfec7..000000000000
--- a/utils/rds-ctl/.gitignore
+++ /dev/null
@@ -1,2 +0,0 @@
-rds-ctl
-
diff --git a/utils/rds-ctl/Makefile.am b/utils/rds-ctl/Makefile.am
deleted file mode 100644
index b3da4cdef31b..000000000000
--- a/utils/rds-ctl/Makefile.am
+++ /dev/null
@@ -1,6 +0,0 @@
-bin_PROGRAMS = rds-ctl
-
-rds_ctl_SOURCES = rds-ctl.cpp v4l2-info.cpp
-rds_ctl_LDADD = ../../lib/libv4l2rds/libv4l2rds.la
-rds_ctl_CPPFLAGS = -I$(top_srcdir)/utils/common
-
diff --git a/utils/v4l2-compliance/.gitignore b/utils/v4l2-compliance/.gitignore
deleted file mode 100644
index e5c535121c89..000000000000
--- a/utils/v4l2-compliance/.gitignore
+++ /dev/null
@@ -1,3 +0,0 @@
-v4l2-compliance
-v4l2-compliance-32
-v4l2-compliance.1
diff --git a/utils/v4l2-compliance/Makefile.am b/utils/v4l2-compliance/Makefile.am
deleted file mode 100644
index ef3ba919b164..000000000000
--- a/utils/v4l2-compliance/Makefile.am
+++ /dev/null
@@ -1,31 +0,0 @@
-bin_PROGRAMS = v4l2-compliance
-man_MANS = v4l2-compliance.1
-DEFS :=
-
-if HAVE_M32
-if WITH_V4L2_COMPLIANCE_32
-bin_PROGRAMS += v4l2-compliance-32
-endif
-endif
-
-
-v4l2_compliance_SOURCES = v4l2-compliance.cpp v4l2-compliance.h \
-	v4l2-test-debug.cpp v4l2-test-input-output.cpp \
-	v4l2-test-controls.cpp v4l2-test-io-config.cpp v4l2-test-formats.cpp v4l2-test-buffers.cpp \
-	v4l2-test-codecs.cpp v4l2-test-subdevs.cpp v4l2-test-media.cpp v4l2-test-colors.cpp \
-	media-info.cpp v4l2-info.cpp v4l2-test-time32-64.cpp
-v4l2_compliance_CPPFLAGS = -I$(top_srcdir)/utils/common $(GIT_SHA) $(GIT_COMMIT_CNT) $(GIT_COMMIT_DATE)
-
-if WITH_V4L2_COMPLIANCE_LIBV4L
-v4l2_compliance_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la -lrt -lpthread
-else
-v4l2_compliance_LDADD = -lrt -lpthread
-DEFS += -DNO_LIBV4L2
-endif
-
-EXTRA_DIST = Android.mk fixme.txt v4l2-compliance.1
-
-nodist_v4l2_compliance_32_SOURCES = v4l2-compliance-32.c
-
-v4l2-compliance-32$(EXEEXT): $(addprefix $(top_srcdir)/utils/v4l2-compliance/,$(v4l2_compliance_SOURCES))
-	$(CXXCOMPILE) -o $@ -static -m32 -DNO_LIBV4L2 -I$(top_srcdir) -I$(top_srcdir)/include $(v4l2_compliance_CPPFLAGS) $(addprefix $(top_srcdir)/utils/v4l2-compliance/,$(filter %.cpp,$(v4l2_compliance_SOURCES))) -lpthread
diff --git a/utils/v4l2-ctl/.gitignore b/utils/v4l2-ctl/.gitignore
deleted file mode 100644
index 94616e96db5b..000000000000
--- a/utils/v4l2-ctl/.gitignore
+++ /dev/null
@@ -1,4 +0,0 @@
-v4l2-ctl
-v4l2-ctl-32
-v4l2-ctl.1
-media-bus-format-names.h
diff --git a/utils/v4l2-ctl/Makefile.am b/utils/v4l2-ctl/Makefile.am
deleted file mode 100644
index 55d234cf6a3f..000000000000
--- a/utils/v4l2-ctl/Makefile.am
+++ /dev/null
@@ -1,44 +0,0 @@
-bin_PROGRAMS = v4l2-ctl
-man_MANS = v4l2-ctl.1
-DEFS :=
-
-if HAVE_M32
-if WITH_V4L2_CTL_32
-bin_PROGRAMS += v4l2-ctl-32
-endif
-endif
-
-v4l2_ctl_SOURCES = v4l2-ctl.cpp v4l2-ctl.h v4l2-ctl-common.cpp v4l2-ctl-tuner.cpp \
-	v4l2-ctl-io.cpp v4l2-ctl-stds.cpp v4l2-ctl-vidcap.cpp v4l2-ctl-vidout.cpp \
-	v4l2-ctl-overlay.cpp v4l2-ctl-vbi.cpp v4l2-ctl-selection.cpp v4l2-ctl-misc.cpp \
-	v4l2-ctl-streaming.cpp v4l2-ctl-sdr.cpp v4l2-ctl-edid.cpp v4l2-ctl-modes.cpp \
-	v4l2-ctl-subdev.cpp v4l2-tpg-colors.c v4l2-tpg-core.c v4l-stream.c v4l2-ctl-meta.cpp \
-	media-info.cpp v4l2-info.cpp codec-fwht.c codec-v4l2-fwht.c
-v4l2_ctl_CPPFLAGS = -I$(top_srcdir)/utils/common $(GIT_COMMIT_CNT)
-
-media-bus-format-names.h: $(top_srcdir)/include/linux/media-bus-format.h
-	$(AM_V_GEN) sed -e '/#define MEDIA_BUS_FMT/ ! d; s/.*FMT_//; /FIXED/ d; s/\t.*//; s/.*/{ \"&\", MEDIA_BUS_FMT_& },/;' \
-	< $< > $@
-
-BUILT_SOURCES = media-bus-format-names.h
-CLEANFILES = $(BUILT_SOURCES)
-
-if WITH_V4L2_CTL_LIBV4L
-v4l2_ctl_LDADD = ../../lib/libv4l2/libv4l2.la ../../lib/libv4lconvert/libv4lconvert.la -lrt -lpthread
-else
-DEFS += -DNO_LIBV4L2
-endif
-
-if !WITH_V4L2_CTL_STREAM_TO
-DEFS += -DNO_STREAM_TO
-endif
-
-nodist_v4l2_ctl_32_SOURCES = v4l2-ctl-32.c
-
-v4l2-ctl-32$(EXEEXT): $(addprefix $(top_srcdir)/utils/v4l2-ctl/,$(v4l2_ctl_SOURCES)) media-bus-format-names.h
-	$(AM_V_GEN) cat $(addprefix $(top_srcdir)/utils/v4l2-ctl/,$(filter %.c,$(v4l2_ctl_SOURCES))) >$@.c
-	$(COMPILE) -static -m32 -DNO_LIBV4L2 -c -I$(top_srcdir) -I$(top_srcdir)/include $(v4l2_ctl_CPPFLAGS) $@.c
-	$(CXXCOMPILE) -static -m32 -DNO_LIBV4L2 -o $@ -I$(top_srcdir) -I$(top_srcdir)/include $(v4l2_ctl_CPPFLAGS) $(addprefix $(top_srcdir)/utils/v4l2-ctl/,$(filter %.cpp,$(v4l2_ctl_SOURCES))) $@.o
-	rm -f $@.c $@.o
-
-EXTRA_DIST = Android.mk v4l2-ctl.1
diff --git a/utils/v4l2-dbg/.gitignore b/utils/v4l2-dbg/.gitignore
deleted file mode 100644
index 14e3ccce03ae..000000000000
--- a/utils/v4l2-dbg/.gitignore
+++ /dev/null
@@ -1 +0,0 @@
-v4l2-dbg
diff --git a/utils/v4l2-dbg/Makefile.am b/utils/v4l2-dbg/Makefile.am
deleted file mode 100644
index 284cf18b1931..000000000000
--- a/utils/v4l2-dbg/Makefile.am
+++ /dev/null
@@ -1,6 +0,0 @@
-sbin_PROGRAMS = v4l2-dbg
-v4l2_dbg_SOURCES = v4l2-dbg.cpp v4l2-info.cpp v4l2-dbg-ac97.h v4l2-dbg-bttv.h \
-	v4l2-dbg-em28xx.h v4l2-dbg.h v4l2-dbg-micron.h v4l2-dbg-saa7134.h v4l2-dbg-tvp5150.h
-v4l2_dbg_CPPFLAGS = -I$(top_srcdir)/utils/common
-
-EXTRA_DIST = Android.mk
diff --git a/utils/v4l2-sysfs-path/.gitignore b/utils/v4l2-sysfs-path/.gitignore
deleted file mode 100644
index e061bb982d43..000000000000
--- a/utils/v4l2-sysfs-path/.gitignore
+++ /dev/null
@@ -1 +0,0 @@
-v4l2-sysfs-path
diff --git a/utils/v4l2-sysfs-path/Makefile.am b/utils/v4l2-sysfs-path/Makefile.am
deleted file mode 100644
index 6ef4228e57b4..000000000000
--- a/utils/v4l2-sysfs-path/Makefile.am
+++ /dev/null
@@ -1,4 +0,0 @@
-bin_PROGRAMS = v4l2-sysfs-path
-v4l2_sysfs_path_SOURCES = v4l2-sysfs-path.c
-v4l2_sysfs_path_LDADD = ../libmedia_dev/libmedia_dev.la
-v4l2_sysfs_path_LDFLAGS = $(ARGP_LIBS)
diff --git a/utils/v4l2-tracer/.gitignore b/utils/v4l2-tracer/.gitignore
deleted file mode 100644
index 48fbfc4752b6..000000000000
--- a/utils/v4l2-tracer/.gitignore
+++ /dev/null
@@ -1,7 +0,0 @@
-trace-gen.h
-trace-gen.cpp
-retrace-gen.cpp
-retrace-gen.h
-v4l2-tracer-info-gen.h
-v4l2-tracer
-v4l2-tracer.1
diff --git a/utils/v4l2-tracer/Makefile.am b/utils/v4l2-tracer/Makefile.am
deleted file mode 100644
index b72ee1e9a0f5..000000000000
--- a/utils/v4l2-tracer/Makefile.am
+++ /dev/null
@@ -1,36 +0,0 @@
-if HAVE_JSONC
-
-lib_LTLIBRARIES = libv4l2tracer.la
-libv4l2tracer_la_SOURCES = libv4l2tracer.cpp trace-gen.cpp trace-helper.cpp trace.cpp \
-v4l2-tracer-common.cpp $(top_srcdir)/utils/common/v4l2-info.cpp \
-$(top_srcdir)/utils/common/media-info.cpp
-libv4l2tracer_la_CPPFLAGS = -I$(top_srcdir)/utils/common $(JSONC_CFLAGS)
-libv4l2tracer_la_LDFLAGS = -avoid-version -module -shared -export-dynamic -ldl $(JSONC_LIBS)
-libv4l2tracer_la_LIBTOOLFLAGS = --tag=disable-static
-
-bin_PROGRAMS = v4l2-tracer
-man_MANS = v4l2-tracer.1
-
-v4l2_tracer_SOURCES = v4l2-tracer.cpp retrace-gen.cpp retrace-helper.cpp retrace.cpp \
-v4l2-tracer-common.cpp $(top_srcdir)/utils/common/v4l2-info.cpp \
-$(top_srcdir)/utils/common/media-info.cpp
-v4l2_tracer_CPPFLAGS = -I$(top_srcdir)/utils/common -DLIBTRACER_PATH=$(libdir) $(JSONC_CFLAGS) \
-$(GIT_SHA) $(GIT_COMMIT_CNT) $(GIT_COMMIT_DATE)
-v4l2_tracer_LDFLAGS = -lrt -lpthread $(JSONC_LIBS)
-
-V4L2_TRACER_GEN_PREREQS = $(top_srcdir)/include/linux/v4l2-controls.h \
-$(top_srcdir)/include/linux/videodev2.h $(top_srcdir)/include/linux/media.h \
-$(top_srcdir)/include/linux/v4l2-common.h
-V4L2_TRACER_GEN = trace-gen.cpp trace-gen.h retrace-gen.cpp retrace-gen.h v4l2-tracer-info-gen.h
-v4l2-tracer.cpp: $(V4L2_TRACER_GEN)
-$(V4L2_TRACER_GEN): gen.intermediate;
-.INTERMEDIATE: gen.intermediate
-gen.intermediate: v4l2-tracer-gen.pl $(V4L2_TRACER_GEN_PREREQS)
-	$(AM_V_GEN) $(top_srcdir)/utils/v4l2-tracer/v4l2-tracer-gen.pl $(V4L2_TRACER_GEN_PREREQS)
-
-clean-local:
-	-rm -vf $(V4L2_TRACER_GEN)
-
-EXTRA_DIST = v4l2-tracer.1, v4l2-tracer-gen.pl
-
-endif
diff --git a/v4l-utils-po/Makevars b/v4l-utils-po/Makevars
deleted file mode 100644
index b1ce882ae9e2..000000000000
--- a/v4l-utils-po/Makevars
+++ /dev/null
@@ -1,72 +0,0 @@
-# Makefile variables for PO directory in any package using GNU gettext.
-
-# Usually the message domain is the same as the package name.
-DOMAIN = $(PACKAGE)
-
-# These two variables depend on the location of this directory.
-subdir = v4l-utils-po
-top_builddir = ..
-
-# These options get passed to xgettext.
-XGETTEXT_OPTIONS = --keyword=_ --keyword=N_ --keyword=P_:1,2
-
-# This is the copyright holder that gets inserted into the header of the
-# $(DOMAIN).pot file.  Set this to the copyright holder of the surrounding
-# package.  (Note that the msgstr strings, extracted from the package's
-# sources, belong to the copyright holder of the package.)  Translators are
-# expected to transfer the copyright for their translations to this person
-# or entity, or to disclaim their copyright.  The empty string stands for
-# the public domain; in this case the translators are expected to disclaim
-# their copyright.
-COPYRIGHT_HOLDER = Mauro Carvalho Chehab
-
-# This tells whether or not to prepend "GNU " prefix to the package
-# name that gets inserted into the header of the $(DOMAIN).pot file.
-# Possible values are "yes", "no", or empty.  If it is empty, try to
-# detect it automatically by scanning the files in $(top_srcdir) for
-# "GNU packagename" string.
-PACKAGE_GNU =
-
-# This is the email address or URL to which the translators shall report
-# bugs in the untranslated strings:
-# - Strings which are not entire sentences, see the maintainer guidelines
-#   in the GNU gettext documentation, section 'Preparing Strings'.
-# - Strings which use unclear terms or require additional context to be
-#   understood.
-# - Strings which make invalid assumptions about notation of date, time or
-#   money.
-# - Pluralisation problems.
-# - Incorrect English spelling.
-# - Incorrect formatting.
-# It can be your email address, or a mailing list address where translators
-# can write to without being subscribed, or the URL of a web page through
-# which the translators can contact you.
-MSGID_BUGS_ADDRESS = linux-media@vger.Kernel.org
-
-# This is the list of locale categories, beyond LC_MESSAGES, for which the
-# message catalogs shall be used.  It is usually empty.
-EXTRA_LOCALE_CATEGORIES =
-
-# This tells whether the $(DOMAIN).pot file contains messages with an 'msgctxt'
-# context.  Possible values are "yes" and "no".  Set this to yes if the
-# package uses functions taking also a message context, like pgettext(), or
-# if in $(XGETTEXT_OPTIONS) you define keywords with a context argument.
-USE_MSGCTXT = no
-
-# These options get passed to msgmerge.
-# Useful options are in particular:
-#   --previous            to keep previous msgids of translated messages,
-#   --quiet               to reduce the verbosity.
-MSGMERGE_OPTIONS =
-
-# This tells whether or not to regenerate a PO file when $(DOMAIN).pot
-# has changed.  Possible values are "yes" and "no".  Set this to no if
-# the POT file is checked in the repository and the version control
-# program ignores timestamps.
-PO_DEPENDS_ON_POT = yes
-
-# This tells whether or not to forcibly update $(DOMAIN).pot and
-# regenerate PO files on "make dist".  Possible values are "yes" and
-# "no".  Set this to no if the POT file and PO files are maintained
-# externally.
-DIST_DEPENDS_ON_UPDATE_PO = yes
-- 
Regards,

Laurent Pinchart

