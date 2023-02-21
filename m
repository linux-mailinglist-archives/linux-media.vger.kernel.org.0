Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBE4F69E259
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 15:32:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233998AbjBUOcP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 09:32:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbjBUOcO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 09:32:14 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E69B328D0B
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 06:32:11 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D3F26E0;
        Tue, 21 Feb 2023 15:32:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676989928;
        bh=KhzZeFXHBUO0ZOOjPeGRFgDq7UcZc/XreXOAor8WZ3U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cNNefe2Ekx0gXCdAZ2sbqCgsWGZOqGNEoHGLoKd2VvWTCMD8CoiE3nHSVRsHRvZ7w
         O36VrnGeScm0I4pi1XsjXSae1AgDAOzJjD7VbG55TmY/wqYpHq3APNH0vnCw5U4wFh
         1W4GAmnYiXj4v7O79ZOlX7QlO03Vx0wIdvHxLkfM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com, deborah.brouwer@collabora.com,
        ariel@vanguardiasur.com.ar, ezequiel@vanguardiasur.com.ar,
        tomi.valkeinen@ideasonboard.com
Subject: [v4l-utils] [PATCH v9 2/7] Move README to markdown syntax
Date:   Tue, 21 Feb 2023 16:31:59 +0200
Message-Id: <20230221143204.26591-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
References: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

This commit just rewrites (and renames) the README file to use markdown
syntax. Note that no further changes are added, keeping content
unmodified as much as possible.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
---
Changes since v6:

- Update v4l-utils.spec.in
---
 README            | 282 ---------------------------------------------
 README.md         | 288 ++++++++++++++++++++++++++++++++++++++++++++++
 v4l-utils.spec.in |   6 +-
 3 files changed, 291 insertions(+), 285 deletions(-)
 delete mode 100644 README
 create mode 100644 README.md

diff --git a/README b/README
deleted file mode 100644
index 8c5561aef7fd..000000000000
--- a/README
+++ /dev/null
@@ -1,282 +0,0 @@
-v4l-utils
----------
-
-Linux utilities and libraries to handle media devices (TV devices,
-capture devices, radio devices, remote controllers).
-
-You can always find the latest development v4l-utils in the git repo:
-	http://git.linuxtv.org/v4l-utils.git
-
-Those utilities follow the latest Linux Kernel media API, as documented
-at:
-	http://linuxtv.org/downloads/v4l-dvb-apis/
-
-Any questions/remarks/patches can be sent to the linux-media mailinglist.
-See https://linuxtv.org/lists.php for more information about the mailinglist.
-
-There is also a wiki page for the v4l-utils:
-
-	https://linuxtv.org/wiki/index.php/V4l-utils
-
-
---------
-Building
---------
-
-A number of packages is required to fully build v4l-utils. The first
-step is to install those packages. The package names are different on
-each distro.
-
-On Debian and derivated distributions, you need to install the following
-packages with apt-get or aptitude:
-    debhelper dh-autoreconf autotools-dev autoconf-archive doxygen graphviz
-    libasound2-dev libtool libjpeg-dev qtbase5-dev qt5-default
-    libqt5opengl5-dev libudev-dev libx11-dev pkg-config udev make gcc git
-
-
-On Fedora, the package list for a minimal install with dnf or yum is:
-	git automake autoconf libtool make gcc gcc-c++ which perl gettext-devel
-
-(git is only requiried if you're cloning from the main git repository at
- linuxtv.org).
-
-And, to be able to compile it with all usual functionality with qt5,
-you'll need also:
-	alsa-lib-devel doxygen libjpeg-turbo-devel qt5-qtbase-devel
-	libudev-devel mesa-libGLU-devel
-
-The v4l2-tracer also needs the json-c library.
-On Debian: libjson-c-dev; on Fedora: json-c-devel.
-
-After downloading and installing the needed packages, you should run:
-
-	./bootstrap.sh
-	./configure
-	make
-
-If ./configure exit with some errors try:
-
-	autoreconf -i --force
-	./configure
-
-And, to install on your system:
-	sudo make install
-
-Optional features
-^^^^^^^^^^^^^^^^^
-
-Please notice that there's an extra feature to add an extra table to
-decode Japanese DVB tables via iconv. This is meant to be used when
-the iconv itself doesn't come with the ARIB-STD-B24 and EN300-468-TAB00
-tables.
-
-That requires not only the gconv package, but it also needs to be manually
-enabled with:
-	--enable-gconv
-
-----------
-versioning
-----------
-
-The v4l-utils doesn't quite follow the release versioning defined
-at semver.org.
-
-Instead, since version 1.0, it uses:
-
-	MAJOR.MINOR.PATCH
-
-Where:
-
-	MINOR - an odd number means a development version. When
-		the development is closed, we release an even
-		numbered version and start a newer odd version;
-
-	MAJOR - It is incremented when MINOR number starts to be
-		too big. The last change occurred from 0.9.x to 1.0.
-
-	All numbers start with 0.
-
-All versions have their own tags, except for the current
-deveopment version (with uses the master branch at the git tree).
-
-The PATCH meaning actually depends if the version is stable
-or developent.
-
-For even MAJOR.MINOR versions (1.0, 1.2, 1.4, 1.6, ...)
-
-	PATCH is incremented when just bug fixes are added;
-
-For odd MAJOR.MINOR versions (1.1, 1.3, 1.5, 1.7, ...)
-	PATCH is incremented for release candidate versions.
-
-API/ABI stability:
------------------
-
-There should not have any API/ABI changes when PATCH is incremented.
-
-When MAJOR and/or MINOR are incremented, the API/ABI for the
-libraries might change, although we do all the efforts for not
-doing it, except when inevitable.
-
-The TODO files should specify the events that will generate
-API/ABI breaks.
-
----------------
-media libraries
----------------
-
-There are currently three media libraries defined at /lib directory,
-meant to be used internally and by other applications.
-
-libv4l
-------
-
-This library is meant to be used by applications that need to
-talk with V4L2 devices (webcams, analog TV, stream grabbers).
-
-It can be found on the following directories:
-	lib/libv4l1
-	lib/libv4l2
-	lib/libv4l-mplane
-	lib/libv4lconvert
-
-See README.libv4l for more information on libv4l.
-
-The libv4l is released under the GNU Lesser General Public License.
-
-libdvbv5
---------
-
-This library is meant to be used by digital TV applications that
-need to talk with media hardware.
-
-Full documentation is provided via Doxygen. It can be built,
-after configuring the package, with:
-	$ make doxygen-run
-
-It is possible to generate documentation in html, man pages and pdf
-formats.
-
-The documentation is also available via web, at:
-	http://linuxtv.org/docs/libdvbv5/
-
-It can be found on the following directory:
-	lib/libdvbv5
-
-The libdvbv5 is released under GPL version 2.
-
-
-libv4l2rds
-----------
-
-This library provides support for RDS radio applications.
-
-It can be found on the following directory:
-	lib/libv4l2rds
-
-The libv4l is released under the GNU Lesser General Public License.
-
----------
-Utilities
----------
-
-The utilities are stored under /util directory.
-
-The (for now for v4l-utils private use only) libv4l2util library is
-released under the GNU Lesser General Public License, all other code is
-released under the GNU General Public License.
-
-v4l-utils includes the following utilities:
-
-decode_tm6000:
-Decodes tm6000 proprietary format streams.
-Installed by make install under <prefix>/bin.
-
-ir-keytable:
-Dump, Load or Modify ir receiver input tables.
-The ir tables for remotes which are known by the kernel
-(and loaded by default depending on dvb card type) can be found
-under utils/keytable/keycodes.
-v4l-keytable does not get installed by make install.
-
-ir-ctl:
-A swiss-knife tool to handle raw IR and to set lirc options
-
-qv4l2:
-QT v4l2 control panel application.
-Installed by make install under <prefix>/bin.
-
-rds-saa6588:
-Poll i2c RDS receiver [Philips saa6588].
-rds-saa6588 does not get installed by make install.
-
-v4l2-compliance:
-Tool to test v4l2 API compliance of drivers.
-Installed by make install under <prefix>/bin.
-
-v4l2-ctl:
-Tool to control v4l2 controls from the cmdline.
-Installed by make install under <prefix>/bin.
-
-v4l2-dbg:
-Tool to directly get and set registers of v4l2 devices,
-this requires a kernel >= 2.6.29 with the ADV_DEBUG option
-enabled. This tool can only be used by root and is meant
-for development purposes only!
-Installed by make install under <prefix>/sbin.
-
-v4l2-sysfs-path:
-FIXME add description.
-Installed by make install under <prefix>/bin.
-
-v4l2-tracer:
-Tool to trace, record and replay userspace applications
-that implement the v4l2 memory-to-memory stateless video
-decoder interface.
-Installed by 'make install' under <prefix>/bin.
-
-xc3028-firmware:
-Xceive XC2028/3028 tuner module firmware manipulation tool.
-xc3028-firmware does not get installed by make install.
-
--------------------
-Syncing with Kernel
--------------------
-
-There are a number of files on this package that depends on the Linux Kernel.
-
-In order to make easier to keep it in sync, there's a target on this
-package to do the synchronism.
-
-For the sync to work, you need to run it on with 64 bits userspace and
-be sure that glibc has the development package for 32 bits.
-
-For Fedora, this is provided via this package: glibc-devel.i686
-
-There are some steps required:
-
-step 1) at the Kernel git tree:
-
-We need to sanitize the headers to be installed. To do that, you should
-run
-
-	$ make headers_install INSTALL_HDR_PATH=usr/
-
-This will create the dir "usr/" inside the Kernel tree.
-
-step 2)
-
-Be sure that you have installed both glibc development packages for
-32 and 64 bits, as otherwise the next step will fail.
-
-step 3) at v4l-utils tree:
-
-	$ ./sync-with-kernel.sh location/of/the/kernel/tree
-
-Alternatively, steps 1 to 3 can be replaced with:
-
-KERNEL_DIR=location/of/the/kernel/tree && (cd $KERNEL_DIR && make headers_install INSTALL_HDR_PATH=usr/) && ./sync-with-kernel.sh $KERNEL_DIR
-
-step 4)
-
-Remove the usr/ from the Kernel tree.
diff --git a/README.md b/README.md
new file mode 100644
index 000000000000..e351d8022d2b
--- /dev/null
+++ b/README.md
@@ -0,0 +1,288 @@
+# v4l-utils
+
+Linux utilities and libraries to handle media devices (TV devices, capture
+devices, radio devices, remote controllers).
+
+You can always find the latest development v4l-utils in the git repo:
+[http://git.linuxtv.org/v4l-utils.git](http://git.linuxtv.org/v4l-utils.git).
+
+Those utilities follow the latest Linux Kernel media API, as documented at:
+[http://linuxtv.org/downloads/v4l-dvb-apis/](http://linuxtv.org/downloads/v4l-dvb-apis/).
+
+Any questions/remarks/patches can be sent to the linux-media mailinglist. See
+[https://linuxtv.org/lists.php](https://linuxtv.org/lists.php) for more
+information about the mailinglist.
+
+There is also a wiki page for the v4l-utils:
+[https://linuxtv.org/wiki/index.php/V4l-utils](https://linuxtv.org/wiki/index.php/V4l-utils).
+
+## Building
+
+A number of packages is required to fully build v4l-utils. The first step is to
+install those packages. The package names are different on each distro.
+
+On Debian and derivated distributions, you need to install the following
+packages with `apt-get` or `aptitude`:
+
+```
+debhelper dh-autoreconf autotools-dev autoconf-archive doxygen graphviz
+libasound2-dev libtool libjpeg-dev qtbase5-dev qt5-default libqt5opengl5-dev
+libudev-dev libx11-dev pkg-config udev make gcc git
+```
+
+On Fedora, the package list for a minimal install with `dnf` or `yum` is:
+
+```
+git automake autoconf libtool make gcc gcc-c++ which perl gettext-devel
+```
+
+(git is only requiried if you're cloning from the main git repository at
+linuxtv.org).
+
+And, to be able to compile it with all usual functionality with qt5, you'll need
+also:
+
+```
+alsa-lib-devel doxygen libjpeg-turbo-devel qt5-qtbase-devel libudev-devel
+mesa-libGLU-devel
+```
+
+The v4l2-tracer also needs the json-c library. On Debian: `libjson-c-dev' ; on
+Fedora: `json-c-devel`.
+
+After downloading and installing the needed packages, you should run:
+
+```
+./bootstrap.sh
+./configure
+make
+```
+
+If `./configure` exit with some errors try:
+
+```
+autoreconf -i --force
+./configure
+```
+
+And, to install on your system:
+
+```
+sudo make install
+```
+
+### Optional features
+
+Please notice that there's an extra feature to add an extra table to decode
+Japanese DVB tables via iconv. This is meant to be used when the iconv itself
+doesn't come with the *ARIB-STD-B24* and *EN300-468-TAB00* tables.
+
+That requires not only the gconv package, but it also needs to be manually
+enabled with `--enable-gconv`.
+
+## Versioning
+
+The v4l-utils doesn't quite follow the release versioning defined at
+[semver.org](https://semver.org/).
+
+Instead, since version 1.0, it uses `MAJOR.MINOR.PATCH`. Where:
+
+* `MINOR` - an odd number means a development version. When the development is
+closed, we release an even numbered version and start a newer odd version;
+
+* `MAJOR` - It is incremented when `MINOR` number starts to be too big. The last
+change occurred from 0.9.x to 1.0.
+
+* All numbers start with 0.
+
+All versions have their own tags, except for the current development version
+(with uses the master branch at the git tree).
+
+The `PATCH` meaning actually depends if the version is stable or development.
+
+* For even `MAJOR.MINOR` versions (1.0, 1.2, 1.4, 1.6, ...): `PATCH` is
+incremented when just bug fixes are added;
+
+* For odd `MAJOR.MINOR` versions (1.1, 1.3, 1.5, 1.7, ...): `PATCH` is
+incremented for release candidate versions.
+
+### API/ABI stability:
+
+There should not have any API/ABI changes when `PATCH` is incremented.
+
+When `MAJOR` and/or `MINOR` are incremented, the API/ABI for the libraries might
+change, although we do all the efforts for not doing it, except when inevitable.
+
+The `TODO` files should specify the events that will generate API/ABI breaks.
+
+## Media libraries
+
+There are currently three media libraries defined at `lib/` directory, meant to
+be used internally and by other applications.
+
+### libv4l
+
+This library is meant to be used by applications that need to talk with V4L2
+devices (webcams, analog TV, stream grabbers).
+
+It can be found on the following directories:
+
+```
+lib/libv4l1/
+lib/libv4l2/
+lib/libv4l-mplane/
+lib/libv4lconvert/
+```
+
+See `README.libv4l` for more information on libv4l.
+
+The libv4l is released under the GNU Lesser General Public License.
+
+### libdvbv5
+
+This library is meant to be used by digital TV applications that need to talk
+with media hardware.
+
+Full documentation is provided via Doxygen. It can be built, after configuring
+the package, with:
+
+```
+make doxygen-run
+```
+
+It is possible to generate documentation in html, man pages and pdf formats.
+
+The documentation is also available via web, at:
+[http://linuxtv.org/docs/libdvbv5/](http://linuxtv.org/docs/libdvbv5/).
+
+It can be found on the following directory `lib/libdvbv5/`.
+
+The libdvbv5 is released under GPL version 2.
+
+### libv4l2rds
+
+This library provides support for RDS radio applications.
+
+It can be found on the following directory `lib/libv4l2rds/`.
+
+The libv4l is released under the GNU Lesser General Public License.
+
+## Utilities
+
+The utilities are stored under `utils/` directory.
+
+The (for now for v4l-utils private use only) libv4l2util library is released
+under the GNU Lesser General Public License, all other code is released under
+the GNU General Public License.
+
+v4l-utils includes the following utilities:
+
+### decode\_tm6000
+
+Decodes tm6000 proprietary format streams.
+
+Installed by make install under `<prefix>/bin`.
+
+### ir-keytable
+
+Dump, Load or Modify ir receiver input tables. The ir tables for remotes which
+are known by the kernel (and loaded by default depending on dvb card type) can
+be found under `utils/keytable/keycodes`.
+
+v4l-keytable does not get installed by `make install`.
+
+### ir-ctl
+
+A swiss-knife tool to handle raw IR and to set lirc options.
+
+### qv4l2
+
+QT v4l2 control panel application.
+
+Installed by `make install` under `<prefix>/bin`.
+
+### rds-saa6588
+
+Poll i2c RDS receiver [Philips saa6588].
+
+rds-saa6588 does not get installed by `make install`.
+
+### v4l2-compliance
+
+Tool to test v4l2 API compliance of drivers.
+
+Installed by `make install` under `<prefix>/bin`.
+
+### v4l2-ctl
+
+Tool to control v4l2 controls from the cmdline.
+
+Installed by `make install` under `<prefix>/bin`.
+
+### v4l2-dbg
+
+Tool to directly get and set registers of v4l2 devices, this requires a
+*kernel >= 2.6.29* with the `ADV_DEBUG` option enabled. This tool can only be
+used by root and is meant for development purposes only!
+
+Installed by `make install` under `<prefix>/sbin`.
+
+### v4l2-sysfs-path
+
+*FIXME* add description.
+
+Installed by `make install` under `<prefix>/bin`.
+
+### v4l2-tracer
+
+Tool to trace, record and replay userspace applications that implement the v4l2
+memory-to-memory stateless video decoder interface.
+
+Installed by `make install` under `<prefix>/bin`.
+
+### xc3028-firmware
+
+Xceive XC2028/3028 tuner module firmware manipulation tool.
+
+xc3028-firmware does not get installed by `make install`.
+
+## Syncing with Kernel
+
+There are a number of files on this package that depends on the Linux Kernel.
+
+In order to make easier to keep it in sync, there's a target on this package to
+do the synchronism.
+
+For the sync to work, you need to run it on with 64 bits userspace and be sure
+that glibc has the development package for 32 bits.
+
+For Fedora, this is provided via this package: *glibc-devel.i686*
+
+There are some steps required:
+
+1. At the Kernel git tree:
+
+    We need to sanitize the headers to be installed. To do that, you should run:
+
+    ```
+    make headers_install INSTALL_HDR_PATH=usr/
+    ```
+
+    This will create the dir `usr/` inside the Kernel tree.
+
+1. Be sure that you have installed both glibc development packages for 32 and 64
+bits, as otherwise the next step will fail.
+
+1. At v4l-utils tree:
+
+    ```
+    ./sync-with-kernel.sh location/of/the/kernel/tree
+    ```
+
+    Alternatively, steps 1 to 3 can be replaced with:
+
+    ```
+    KERNEL_DIR=location/of/the/kernel/tree && (cd $KERNEL_DIR && make headers_install INSTALL_HDR_PATH=usr/) && ./sync-with-kernel.sh $KERNEL_DIR
+    ```
+
+1. Remove the `usr/` from the Kernel tree.
diff --git a/v4l-utils.spec.in b/v4l-utils.spec.in
index a368d3fe8650..b9adeeeef207 100644
--- a/v4l-utils.spec.in
+++ b/v4l-utils.spec.in
@@ -138,7 +138,7 @@ desktop-file-validate $RPM_BUILD_ROOT%{_datadir}/applications/qv4l2.desktop
 %ldconfig_scriptlets -n libdvbv5
 
 %files -f %{name}.lang
-%doc README
+%doc README.md
 %dir %{_sysconfdir}/rc_keymaps
 %config(noreplace) %{_sysconfdir}/rc_maps.cfg
 %{_udevrulesdir}/70-infrared.rules
@@ -160,14 +160,14 @@ desktop-file-validate $RPM_BUILD_ROOT%{_datadir}/applications/qv4l2.desktop
 %exclude %{_mandir}/man1/v4l2-compliance.1*
 
 %files devel-tools
-%doc README
+%doc README.md
 %{_bindir}/decode_tm6000
 %{_bindir}/v4l2-compliance
 %{_mandir}/man1/v4l2-compliance.1*
 %{_sbindir}/v4l2-dbg
 
 %files -n qv4l2
-%doc README
+%doc README.md
 %{_bindir}/qv4l2
 %{_bindir}/qvidcap
 %{_datadir}/applications/qv4l2.desktop
-- 
Regards,

Laurent Pinchart

