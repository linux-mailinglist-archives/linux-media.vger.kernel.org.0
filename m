Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9515D33F6AA
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 18:23:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbhCQRXZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 13:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232085AbhCQRWx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 13:22:53 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F78C06174A
        for <linux-media@vger.kernel.org>; Wed, 17 Mar 2021 10:22:52 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: adalessandro)
        with ESMTPSA id 502781F453F2
From:   Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        gjasny@googlemail.com, xavier.claessens@collabora.com,
        nicolas.dufresne@collabora.com, user.vdr@gmail.com,
        sakari.ailus@iki.fi, ariel.dalessandro@collabora.com
Subject: [v4l-utils v4 2/5] Add support for meson building
Date:   Wed, 17 Mar 2021 14:22:24 -0300
Message-Id: <20210317172227.620584-3-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317172227.620584-1-ariel.dalessandro@collabora.com>
References: <20210317172227.620584-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Supports building libraries and tools found in contrib/, lib/ and
utils/ directories, along with the implemented gettext translations.

Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Acked-by: Gregor Jasny <gjasny@googlemail.com>
[Gregor: Control symbol visibility]
Signed-off-by: Gregor Jasny <gjasny@googlemail.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .gitignore                                    |   1 +
 INSTALL.meson.md                              | 118 +++++++
 README.md                                     |  83 ++++-
 contrib/cobalt-ctl/meson.build                |   8 +
 contrib/decode_tm6000/meson.build             |  14 +
 contrib/gconv/meson.build                     |  44 +++
 contrib/meson.build                           |  13 +
 contrib/rds-saa6588/meson.build               |   7 +
 contrib/test/meson.build                      | 143 ++++++++
 contrib/xc3028-firmware/meson.build           |  11 +
 lib/libdvbv5/meson.build                      | 158 +++++++++
 lib/libv4l-mplane/meson.build                 |  23 ++
 lib/libv4l1/meson.build                       |  61 ++++
 lib/libv4l2/meson.build                       |  70 ++++
 lib/libv4l2rds/meson.build                    |  36 ++
 lib/libv4lconvert/meson.build                 | 117 +++++++
 lib/meson.build                               |  11 +
 libdvbv5-po/meson.build                       |   3 +
 meson.build                                   | 315 ++++++++++++++++++
 meson_options.txt                             |  42 +++
 utils/cec-compliance/meson.build              |  22 ++
 utils/cec-ctl/meson.build                     |  18 +
 utils/cec-follower/meson.build                |  19 ++
 utils/cx18-ctl/meson.build                    |   8 +
 utils/dvb/meson.build                         |  70 ++++
 utils/gen_media_bus_format_codes.sh           |   7 +
 utils/gen_media_bus_format_names.sh           |   7 +
 utils/ir-ctl/meson.build                      |  23 ++
 utils/ivtv-ctl/meson.build                    |  13 +
 .../bpf_protocols/clang_sys_includes.sh       |   9 +
 utils/keytable/bpf_protocols/meson.build      |  39 +++
 .../user_dir_protocols/README.md              |   1 +
 utils/keytable/meson.build                    |  76 +++++
 utils/keytable/rc_keymaps/meson.build         | 151 +++++++++
 utils/libcecutil/meson.build                  |  45 +++
 utils/libmedia_dev/meson.build                |  14 +
 utils/libv4l2util/meson.build                 |  16 +
 utils/media-ctl/meson.build                   |  43 +++
 utils/meson.build                             |  46 +++
 utils/qv4l2/meson.build                       |  80 +++++
 utils/qvidcap/meson.build                     |  82 +++++
 utils/rds-ctl/meson.build                     |  13 +
 utils/v4l2-compliance/meson.build             |  58 ++++
 utils/v4l2-ctl/meson.build                    |  75 +++++
 utils/v4l2-dbg/meson.build                    |  16 +
 utils/v4l2-sysfs-path/meson.build             |  14 +
 v4l-utils-po/meson.build                      |   3 +
 47 files changed, 2230 insertions(+), 16 deletions(-)
 create mode 100644 INSTALL.meson.md
 create mode 100644 contrib/cobalt-ctl/meson.build
 create mode 100644 contrib/decode_tm6000/meson.build
 create mode 100644 contrib/gconv/meson.build
 create mode 100644 contrib/meson.build
 create mode 100644 contrib/rds-saa6588/meson.build
 create mode 100644 contrib/test/meson.build
 create mode 100644 contrib/xc3028-firmware/meson.build
 create mode 100644 lib/libdvbv5/meson.build
 create mode 100644 lib/libv4l-mplane/meson.build
 create mode 100644 lib/libv4l1/meson.build
 create mode 100644 lib/libv4l2/meson.build
 create mode 100644 lib/libv4l2rds/meson.build
 create mode 100644 lib/libv4lconvert/meson.build
 create mode 100644 lib/meson.build
 create mode 100644 libdvbv5-po/meson.build
 create mode 100644 meson.build
 create mode 100644 meson_options.txt
 create mode 100644 utils/cec-compliance/meson.build
 create mode 100644 utils/cec-ctl/meson.build
 create mode 100644 utils/cec-follower/meson.build
 create mode 100644 utils/cx18-ctl/meson.build
 create mode 100644 utils/dvb/meson.build
 create mode 100755 utils/gen_media_bus_format_codes.sh
 create mode 100755 utils/gen_media_bus_format_names.sh
 create mode 100644 utils/ir-ctl/meson.build
 create mode 100644 utils/ivtv-ctl/meson.build
 create mode 100755 utils/keytable/bpf_protocols/clang_sys_includes.sh
 create mode 100644 utils/keytable/bpf_protocols/meson.build
 create mode 100644 utils/keytable/bpf_protocols/user_dir_protocols/README.md
 create mode 100644 utils/keytable/meson.build
 create mode 100644 utils/keytable/rc_keymaps/meson.build
 create mode 100644 utils/libcecutil/meson.build
 create mode 100644 utils/libmedia_dev/meson.build
 create mode 100644 utils/libv4l2util/meson.build
 create mode 100644 utils/media-ctl/meson.build
 create mode 100644 utils/meson.build
 create mode 100644 utils/qv4l2/meson.build
 create mode 100644 utils/qvidcap/meson.build
 create mode 100644 utils/rds-ctl/meson.build
 create mode 100644 utils/v4l2-compliance/meson.build
 create mode 100644 utils/v4l2-ctl/meson.build
 create mode 100644 utils/v4l2-dbg/meson.build
 create mode 100644 utils/v4l2-sysfs-path/meson.build
 create mode 100644 v4l-utils-po/meson.build

diff --git a/.gitignore b/.gitignore
index f899ecfc..7c900fe5 100644
--- a/.gitignore
+++ b/.gitignore
@@ -61,3 +61,4 @@ v4l-utils-po/en@quot.header
 v4l-utils-po/insert-header.sin
 v4l-utils-po/quot.sed
 v4l-utils-po/remove-potcdate.sin
+build/
diff --git a/INSTALL.meson.md b/INSTALL.meson.md
new file mode 100644
index 00000000..926cebdc
--- /dev/null
+++ b/INSTALL.meson.md
@@ -0,0 +1,118 @@
+# Installation
+
+## Requirements
+
+* meson and a C and C++ compiler
+* optionally libjpeg v6 or later
+* optionally Qt5 for building qv4l2
+
+## Basic installation
+
+v4l-utils can be built and installed using meson as follows:
+
+```
+meson build/
+ninja -C build/
+sudo ninja -C build/ install
+```
+
+## Configuration
+
+You can get a summary of possible configurations running:
+
+```
+meson configure build/
+```
+
+To change the options values use the `-D` option:
+
+```
+meson configure -Doption=newvalue
+```
+
+After configuration you need to start the build process with:
+
+```
+ninja -C build/
+```
+
+More info about meson options:
+[https://mesonbuild.com/Build-options.html](https://mesonbuild.com/Build-options.html)
+
+## Installing
+
+If you need to install to a different directory than the install prefix, use
+the `DESTDIR` environment variable:
+
+```
+DESTDIR=/path/to/staging/area ninja -C build/ install
+```
+
+## Cross Compiling
+
+Meson supports cross-compilation by specifying a number of binary paths and
+settings in a file and passing this file to `meson` or `meson configure` with
+the `--cross-file` parameter.
+
+Below are a few example of cross files, but keep in mind that you will likely
+have to alter them for your system.
+
+32-bit build on x86 linux:
+
+```
+[binaries]
+c = '/usr/bin/gcc'
+cpp = '/usr/bin/g++'
+ar = '/usr/bin/gcc-ar'
+strip = '/usr/bin/strip'
+pkgconfig = '/usr/bin/pkg-config-32'
+llvm-config = '/usr/bin/llvm-config32'
+
+[properties]
+c_args = ['-m32']
+c_link_args = ['-m32']
+cpp_args = ['-m32']
+cpp_link_args = ['-m32']
+
+[host_machine]
+system = 'linux'
+cpu_family = 'x86'
+cpu = 'i686'
+endian = 'little'
+```
+
+64-bit build on ARM linux:
+
+```
+[binaries]
+c = '/usr/bin/aarch64-linux-gnu-gcc'
+cpp = '/usr/bin/aarch64-linux-gnu-g++'
+ar = '/usr/bin/aarch64-linux-gnu-gcc-ar'
+strip = '/usr/bin/aarch64-linux-gnu-strip'
+pkgconfig = '/usr/bin/aarch64-linux-gnu-pkg-config'
+exe_wrapper = '/usr/bin/qemu-aarch64-static'
+
+[host_machine]
+system = 'linux'
+cpu_family = 'aarch64'
+cpu = 'aarch64'
+endian = 'little'
+```
+
+64-bit build on x86 windows:
+
+```
+[binaries]
+c = '/usr/bin/x86_64-w64-mingw32-gcc'
+cpp = '/usr/bin/x86_64-w64-mingw32-g++'
+ar = '/usr/bin/x86_64-w64-mingw32-ar'
+strip = '/usr/bin/x86_64-w64-mingw32-strip'
+pkgconfig = '/usr/bin/x86_64-w64-mingw32-pkg-config'
+exe_wrapper = 'wine'
+
+[host_machine]
+system = 'windows'
+cpu_family = 'x86_64'
+cpu = 'i686'
+endian = 'little'
+```
diff --git a/README.md b/README.md
index a2322c6e..a4ff7511 100644
--- a/README.md
+++ b/README.md
@@ -18,6 +18,10 @@ There is also a wiki page for the v4l-utils:
 
 ## Building
 
+Temporarily, both meson and autotools build systems are supported in parallel.
+*NOTE*: Packagers should be aware that autotools support will be dropped soon,
+to be fully replaced by meson.
+
 A number of packages is required to fully build v4l-utils. The first step is to
 install those packages. The package names are different on each distro.
 
@@ -25,15 +29,15 @@ On Debian and derivated distributions, you need to install the following
 packages with `apt-get` or `aptitude`:
 
 ```
-debhelper dh-autoreconf autotools-dev autoconf-archive doxygen graphviz
-libasound2-dev libtool libjpeg-dev qtbase5-dev qt5-default libqt5opengl5-dev
-libudev-dev libx11-dev pkg-config udev make gcc git
+debhelper dh-autoreconf doxygen graphviz libasound2-dev libtool libjpeg-dev
+qtbase5-dev qt5-default libqt5opengl5-dev libudev-dev libx11-dev pkg-config
+udev gcc git
 ```
 
 On Fedora, the package list for a minimal install with `dnf` or `yum` is:
 
 ```
-git automake autoconf libtool make gcc gcc-c++ which perl gettext-devel
+git libtool gcc gcc-c++ which perl gettext-devel
 ```
 
 (git is only requiried if you're cloning from the main git repository at
@@ -47,7 +51,46 @@ alsa-lib-devel doxygen libjpeg-turbo-devel qt5-qtbase-devel libudev-devel
 mesa-libGLU-devel
 ```
 
-After downloading and installing the needed packages, you should run:
+### Meson build
+
+Extra packages required for meson:
+
+```
+# On Debian/Ubuntu
+apt-get install meson ninja-build
+
+# On Fedora
+dnf install meson ninja-build
+```
+
+After downloading and installing the needed packages on your distribution, you
+should run:
+
+```
+meson build/
+ninja -C build/
+```
+
+And, to install on your system:
+
+```
+sudo ninja -C build/ install
+```
+
+### Autotools build
+
+Extra packages required for autotools:
+
+```
+# On Debian/Ubuntu
+apt-get install autotools-dev autoconf-archive make
+
+# On Fedora
+dnf install automake autoconf make
+```
+
+After downloading and installing the needed packages on your distribution, you
+should run:
 
 ```
 ./bootstrap.sh
@@ -75,7 +118,15 @@ Japanese DVB tables via iconv. This is meant to be used when the iconv itself
 doesn't come with the *ARIB-STD-B24* and *EN300-468-TAB00* tables.
 
 That requires not only the gconv package, but it also needs to be manually
-enabled with `--enable-gconv`.
+enabled running autoconf with `--enable-gconv` option.
+
+In meson, gconv is an auto feature, so it will be auto-enabled in case the
+dependencies are satisfied. However, the gconv feature can be forced to enabled
+by running the following command during configuration step:
+
+```
+meson configure -Dgconv=enabled build/
+```
 
 ## Versioning
 
@@ -141,7 +192,7 @@ This library is meant to be used by digital TV applications that need to talk
 with media hardware.
 
 Full documentation is provided via Doxygen. It can be built, after configuring
-the package, with:
+the package with autotools, running:
 
 ```
 make doxygen-run
@@ -178,7 +229,7 @@ v4l-utils includes the following utilities:
 
 Decodes tm6000 proprietary format streams.
 
-Installed by make install under `<prefix>/bin`.
+Installed under `<prefix>/bin`.
 
 ### ir-keytable
 
@@ -186,7 +237,7 @@ Dump, Load or Modify ir receiver input tables. The ir tables for remotes which
 are known by the kernel (and loaded by default depending on dvb card type) can
 be found under `utils/keytable/keycodes`.
 
-v4l-keytable does not get installed by `make install`.
+v4l-keytable does not get installed during the install step.
 
 ### ir-ctl
 
@@ -196,25 +247,25 @@ A swiss-knife tool to handle raw IR and to set lirc options.
 
 QT v4l2 control panel application.
 
-Installed by `make install` under `<prefix>/bin`.
+Installed under `<prefix>/bin`.
 
 ### rds-saa6588
 
 Poll i2c RDS receiver [Philips saa6588].
 
-rds-saa6588 does not get installed by `make install`.
+rds-saa6588 does not get installed during the install step.
 
 ### v4l2-compliance
 
 Tool to test v4l2 API compliance of drivers.
 
-Installed by `make install` under `<prefix>/bin`.
+Installed under `<prefix>/bin`.
 
 ### v4l2-ctl
 
 Tool to control v4l2 controls from the cmdline.
 
-Installed by `make install` under `<prefix>/bin`.
+Installed under `<prefix>/bin`.
 
 ### v4l2-dbg
 
@@ -222,19 +273,19 @@ Tool to directly get and set registers of v4l2 devices, this requires a
 *kernel >= 2.6.29* with the `ADV_DEBUG` option enabled. This tool can only be
 used by root and is meant for development purposes only!
 
-Installed by `make install` under `<prefix>/sbin`.
+Installed under `<prefix>/sbin`.
 
 ### v4l2-sysfs-path
 
 *FIXME* add description.
 
-Installed by `make install` under `<prefix>/bin`.
+Installed under `<prefix>/bin`.
 
 ### xc3028-firmware
 
 Xceive XC2028/3028 tuner module firmware manipulation tool.
 
-xc3028-firmware does not get installed by `make install`.
+xc3028-firmware does not get installed during the install step.
 
 ## Syncing with Kernel
 
diff --git a/contrib/cobalt-ctl/meson.build b/contrib/cobalt-ctl/meson.build
new file mode 100644
index 00000000..f76fcba3
--- /dev/null
+++ b/contrib/cobalt-ctl/meson.build
@@ -0,0 +1,8 @@
+cobalt_ctl_sources = files(
+    'cobalt-ctl.c',
+    's-record.c',
+)
+
+cobalt_ctl = executable('cobalt-ctl',
+                        cobalt_ctl_sources,
+                        include_directories : v4l2_utils_incdir)
diff --git a/contrib/decode_tm6000/meson.build b/contrib/decode_tm6000/meson.build
new file mode 100644
index 00000000..5147278b
--- /dev/null
+++ b/contrib/decode_tm6000/meson.build
@@ -0,0 +1,14 @@
+decode_tm6000_sources = files(
+    'decode_tm6000.c',
+)
+
+decode_tm6000_deps = [
+    dep_argp,
+    dep_libv4l2util,
+]
+
+decode_tm6000 = executable('decode_tm6000',
+                           decode_tm6000_sources,
+                           install : true,
+                           dependencies: decode_tm6000_deps,
+                           include_directories : v4l2_utils_incdir)
diff --git a/contrib/gconv/meson.build b/contrib/gconv/meson.build
new file mode 100644
index 00000000..e95278fd
--- /dev/null
+++ b/contrib/gconv/meson.build
@@ -0,0 +1,44 @@
+gconv_install_dir = get_option('libdir') / 'gconv'
+
+arib_std_b24_sources = files(
+    'arib-std-b24.c',
+    'jis0201.h',
+    'jis0208.h',
+    'jisx0213.h',
+)
+
+arib_std_b24_deps = [
+    dep_jis,
+    dep_jisx0213,
+]
+
+arib_std_b24 = shared_module('ARIB-STD-B24',
+                             arib_std_b24_sources,
+                             name_prefix : '',
+                             dependencies : arib_std_b24_deps,
+                             install : true,
+                             install_dir : gconv_install_dir,
+                             include_directories : v4l2_utils_incdir)
+
+dep_arib_std_b24 = declare_dependency(link_with : arib_std_b24)
+
+en300_468_tab00_sources = files(
+    'en300-468-tab00.c',
+)
+
+en300_468_tab00_deps = [
+    dep_jis,
+    dep_jisx0213,
+]
+
+en300_468_tab00 = shared_module('EN300-468-TAB00',
+                                en300_468_tab00_sources,
+                                name_prefix : '',
+                                dependencies : en300_468_tab00_deps,
+                                install : true,
+                                install_dir : gconv_install_dir,
+                                include_directories : v4l2_utils_incdir)
+
+dep_en300_468_tab00 = declare_dependency(link_with : en300_468_tab00)
+
+install_data('gconv-modules', install_dir : gconv_install_dir)
diff --git a/contrib/meson.build b/contrib/meson.build
new file mode 100644
index 00000000..e3aa05ac
--- /dev/null
+++ b/contrib/meson.build
@@ -0,0 +1,13 @@
+if host_machine.system() == 'linux'
+    subdir('test')
+    subdir('xc3028-firmware')
+    if have_i2c_dev
+        subdir('rds-saa6588')
+    endif
+endif
+
+subdir('decode_tm6000')
+
+if have_gconv
+    subdir('gconv', if_found : [dep_jis, dep_jisx0213])
+endif
diff --git a/contrib/rds-saa6588/meson.build b/contrib/rds-saa6588/meson.build
new file mode 100644
index 00000000..037d2e20
--- /dev/null
+++ b/contrib/rds-saa6588/meson.build
@@ -0,0 +1,7 @@
+rds_saa6588_sources = files(
+    'rds-saa6588.c',
+)
+
+rds_saa6588 = executable('rds-saa6588',
+                         rds_saa6588_sources,
+                         include_directories : v4l2_utils_incdir)
diff --git a/contrib/test/meson.build b/contrib/test/meson.build
new file mode 100644
index 00000000..35243adf
--- /dev/null
+++ b/contrib/test/meson.build
@@ -0,0 +1,143 @@
+ioctl_test_sources = files(
+    'ioctl-test.c',
+    'ioctl-test.h',
+    'ioctl_32.h',
+    'ioctl_64.h',
+)
+
+ioctl_test = executable('ioctl-test',
+                        ioctl_test_sources,
+                        include_directories : v4l2_utils_incdir)
+
+sliced_vbi_test_sources = files(
+    'sliced-vbi-test.c',
+)
+
+sliced_vbi_test = executable('sliced-vbi-test',
+                             sliced_vbi_test_sources,
+                             include_directories : v4l2_utils_incdir)
+
+sliced_vbi_detect_sources = files(
+    'sliced-vbi-detect.c',
+)
+
+sliced_vbi_detect = executable('sliced-vbi-detect',
+                               sliced_vbi_detect_sources,
+                               include_directories : v4l2_utils_incdir)
+
+v4l2grab_sources = files(
+    'v4l2grab.c',
+
+)
+
+v4l2grab_deps = [
+    dep_argp,
+    dep_libv4l2,
+    dep_libv4lconvert,
+    dep_threads,
+]
+
+v4l2grab = executable('v4l2grab',
+                      v4l2grab_sources,
+                      dependencies : v4l2grab_deps,
+                      include_directories : v4l2_utils_incdir)
+
+driver_test_sources = files(
+    'driver-test.c',
+
+)
+
+driver_test_deps = [
+    dep_libv4l2util,
+]
+
+driver_test = executable('driver-test',
+                         driver_test_sources,
+                         dependencies : driver_test_deps,
+                         include_directories : v4l2_utils_incdir)
+
+mc_nextgen_test_sources = files(
+    'mc_nextgen_test.c',
+)
+
+mc_nextgen_test_deps = [
+    dep_argp,
+    dep_libudev,
+]
+
+mc_nextgen_test = executable('mc-nextgen-test',
+                             mc_nextgen_test_sources,
+                             dependencies : mc_nextgen_test_deps,
+                             include_directories : v4l2_utils_incdir)
+
+stress_buffer_sources = files(
+    'stress-buffer.c',
+)
+
+stress_buffer = executable('stress-buffer',
+                           stress_buffer_sources,
+                           include_directories : v4l2_utils_incdir)
+
+capture_example_sources = files(
+    'capture-example.c',
+)
+
+capture_example = executable('capture-example',
+                             capture_example_sources,
+                             include_directories : v4l2_utils_incdir)
+
+if dep_x11.found()
+    pixfmt_test_sources = files(
+        'pixfmt-test.c',
+    )
+
+    pixfmt_test_deps = [
+        dep_x11,
+    ]
+
+    pixfmt_test = executable('pixfmt-test',
+                             pixfmt_test_sources,
+                             dependencies : pixfmt_test_deps,
+                             include_directories : v4l2_utils_incdir)
+endif
+
+if dep_x11.found() and dep_glu.found()
+    v4l2gl_sources = files(
+        'v4l2gl.c',
+    )
+
+    v4l2gl_deps = [
+        dep_gl,
+        dep_glu,
+        dep_libv4l2,
+        dep_libv4lconvert,
+        dep_x11,
+    ]
+
+    v4l2gl = executable('v4l2gl',
+                        v4l2gl_sources,
+                        dependencies : v4l2gl_deps,
+                        include_directories : v4l2_utils_incdir)
+endif
+
+if dep_jpeg.found() and dep_sdl.found() and dep_sdl_image.found()
+    sdlcam_sources = files(
+        'sdlcam.c',
+    )
+
+    sdlcam_deps = [
+        dep_jpeg,
+        dep_libdl,
+        dep_libm,
+        dep_librt,
+        dep_libv4l2,
+        dep_libv4lconvert,
+        dep_sdl,
+        dep_sdl_image,
+    ]
+
+    sdlcam = executable('sdlcam',
+                        sdlcam_sources,
+                        dependencies : sdlcam_deps,
+                        include_directories : v4l2_utils_incdir)
+endif
diff --git a/contrib/xc3028-firmware/meson.build b/contrib/xc3028-firmware/meson.build
new file mode 100644
index 00000000..a86e02d4
--- /dev/null
+++ b/contrib/xc3028-firmware/meson.build
@@ -0,0 +1,11 @@
+xc3028_firmware_sources = files(
+    'extract_head.h',
+    'firmware-tool.c',
+    'standards.c',
+    'standards.h',
+    'tuner-xc2028-types.h',
+)
+
+xc3028_firmware = executable('xc3028-firmware',
+                             xc3028_firmware_sources,
+                             include_directories : v4l2_utils_incdir)
diff --git a/lib/libdvbv5/meson.build b/lib/libdvbv5/meson.build
new file mode 100644
index 00000000..6653d09f
--- /dev/null
+++ b/lib/libdvbv5/meson.build
@@ -0,0 +1,158 @@
+libdvbv5_option = get_option('libdvbv5')
+if libdvbv5_option.disabled() or (libdvbv5_option.auto() and not dep_libudev.found())
+    dep_libdvbv5 = dependency('', required : false)
+    subdir_done()
+endif
+if libdvbv5_option.enabled() and not dep_libudev.found()
+    error('libdvbv5 enabled but ' + dep_libudev.name() + ' not found')
+endif
+
+libdvbv5_sources = files(
+    'compat-soname.c',
+    'countries.c',
+    'crc32.c',
+    'descriptors.c',
+    'descriptors/desc_atsc_service_location.c',
+    'descriptors/desc_ca.c',
+    'descriptors/desc_ca_identifier.c',
+    'descriptors/desc_cable_delivery.c',
+    'descriptors/desc_event_extended.c',
+    'descriptors/desc_event_short.c',
+    'descriptors/desc_extension.c',
+    'descriptors/desc_frequency_list.c',
+    'descriptors/desc_hierarchy.c',
+    'descriptors/desc_isdbt_delivery.c',
+    'descriptors/desc_language.c',
+    'descriptors/desc_logical_channel.c',
+    'descriptors/desc_network_name.c',
+    'descriptors/desc_partial_reception.c',
+    'descriptors/desc_registration_id.c',
+    'descriptors/desc_sat.c',
+    'descriptors/desc_service.c',
+    'descriptors/desc_t2_delivery.c',
+    'descriptors/desc_terrestrial_delivery.c',
+    'descriptors/desc_ts_info.c',
+    'dvb-demux.c',
+    'dvb-dev-local.c',
+    'dvb-dev-priv.h',
+    'dvb-dev-remote.c',
+    'dvb-dev.c',
+    'dvb-fe-priv.h',
+    'dvb-fe.c',
+    'dvb-file.c',
+    'dvb-legacy-channel-format.c',
+    'dvb-log.c',
+    'dvb-sat.c',
+    'dvb-scan.c',
+    'dvb-v5-std.c',
+    'dvb-v5.c',
+    'dvb-v5.h',
+    'dvb-vdr-format.c',
+    'dvb-zap-format.c',
+    'parse_string.c',
+    'parse_string.h',
+    'tables/atsc_eit.c',
+    'tables/cat.c',
+    'tables/eit.c',
+    'tables/header.c',
+    'tables/mgt.c',
+    'tables/mpeg_es.c',
+    'tables/mpeg_pes.c',
+    'tables/mpeg_ts.c',
+    'tables/nit.c',
+    'tables/pat.c',
+    'tables/pmt.c',
+    'tables/sdt.c',
+    'tables/vct.c',
+)
+
+configure_file(
+    output : 'libdvb-version.h',
+    input : '../include/libdvbv5/libdvb-version.h.in',
+    configuration : conf,
+    install: true,
+    install_dir: 'include/libdvbv5',
+)
+
+libdvbv5_api = files(
+    '../include/libdvbv5/atsc_eit.h',
+    '../include/libdvbv5/atsc_header.h',
+    '../include/libdvbv5/cat.h',
+    '../include/libdvbv5/countries.h',
+    '../include/libdvbv5/crc32.h',
+    '../include/libdvbv5/desc_atsc_service_location.h',
+    '../include/libdvbv5/desc_ca.h',
+    '../include/libdvbv5/desc_ca_identifier.h',
+    '../include/libdvbv5/desc_cable_delivery.h',
+    '../include/libdvbv5/desc_event_extended.h',
+    '../include/libdvbv5/desc_event_short.h',
+    '../include/libdvbv5/desc_extension.h',
+    '../include/libdvbv5/desc_frequency_list.h',
+    '../include/libdvbv5/desc_hierarchy.h',
+    '../include/libdvbv5/desc_isdbt_delivery.h',
+    '../include/libdvbv5/desc_language.h',
+    '../include/libdvbv5/desc_logical_channel.h',
+    '../include/libdvbv5/desc_network_name.h',
+    '../include/libdvbv5/desc_partial_reception.h',
+    '../include/libdvbv5/desc_registration_id.h',
+    '../include/libdvbv5/desc_sat.h',
+    '../include/libdvbv5/desc_service.h',
+    '../include/libdvbv5/desc_t2_delivery.h',
+    '../include/libdvbv5/desc_terrestrial_delivery.h',
+    '../include/libdvbv5/desc_ts_info.h',
+    '../include/libdvbv5/descriptors.h',
+    '../include/libdvbv5/dvb-demux.h',
+    '../include/libdvbv5/dvb-dev.h',
+    '../include/libdvbv5/dvb-fe.h',
+    '../include/libdvbv5/dvb-file.h',
+    '../include/libdvbv5/dvb-frontend.h',
+    '../include/libdvbv5/dvb-log.h',
+    '../include/libdvbv5/dvb-sat.h',
+    '../include/libdvbv5/dvb-scan.h',
+    '../include/libdvbv5/dvb-v5-std.h',
+    '../include/libdvbv5/eit.h',
+    '../include/libdvbv5/header.h',
+    '../include/libdvbv5/mgt.h',
+    '../include/libdvbv5/mpeg_es.h',
+    '../include/libdvbv5/mpeg_pes.h',
+    '../include/libdvbv5/mpeg_ts.h',
+    '../include/libdvbv5/nit.h',
+    '../include/libdvbv5/pat.h',
+    '../include/libdvbv5/pmt.h',
+    '../include/libdvbv5/sdt.h',
+    '../include/libdvbv5/vct.h',
+)
+
+install_headers(libdvbv5_api, subdir: 'libdvbv5')
+
+libdvbv5_deps = [
+    dep_iconv,
+    dep_libm,
+    dep_librt,
+    dep_libudev,
+    dep_threads,
+]
+
+libdvbv5_c_args = [
+    '-DHAVE_DVBV5_REMOTE',
+    '-DHAVE_PTHREAD',
+    '-DLIBDVBV5_DOMAIN="libdvbv5"',
+]
+
+libdvbv5 = library('dvbv5',
+                   libdvbv5_sources,
+                   soversion: '0',
+                   version: '0.0.0',
+                   install : true,
+                   dependencies : libdvbv5_deps,
+                   c_args : libdvbv5_c_args,
+                   include_directories : v4l2_utils_incdir)
+
+dep_libdvbv5 = declare_dependency(link_with : libdvbv5)
+
+pkg.generate(
+    libdvbv5,
+    name : 'libdvbv5',
+    version : meson.project_version(),
+    requires_private : 'libudev',
+    description : 'DVBv5 utility library')
diff --git a/lib/libv4l-mplane/meson.build b/lib/libv4l-mplane/meson.build
new file mode 100644
index 00000000..0e0e558b
--- /dev/null
+++ b/lib/libv4l-mplane/meson.build
@@ -0,0 +1,23 @@
+libv4l_mplane_sources = files(
+    'libv4l-mplane.c',
+)
+
+libv4l_mplane_deps = [
+    dep_threads,
+]
+
+libv4l_mplane_c_args = []
+
+if have_visibility
+    libv4l_mplane_c_args += ['-fvisibility=hidden']
+endif
+
+libv4l_mplane = shared_module('v4l-mplane',
+                              libv4l_mplane_sources,
+                              install : true,
+                              install_dir : libv4l2plugindir,
+                              dependencies : libv4l_mplane_deps,
+                              c_args : libv4l_mplane_c_args,
+                              include_directories : v4l2_utils_incdir)
+
+dep_libv4l_mplane = declare_dependency(link_with : libv4l_mplane)
diff --git a/lib/libv4l1/meson.build b/lib/libv4l1/meson.build
new file mode 100644
index 00000000..433b9391
--- /dev/null
+++ b/lib/libv4l1/meson.build
@@ -0,0 +1,61 @@
+libv4l1_sources = files(
+    'libv4l1-priv.h',
+    'libv4l1.c',
+    'log.c',
+)
+
+libv4l1_api = files(
+    '../include/libv4l1-videodev.h',
+    '../include/libv4l1.h',
+)
+
+install_headers(libv4l1_api)
+
+libv4l1_deps = [
+    dep_libv4l2,
+    dep_threads,
+]
+
+libv4l1_c_args = []
+
+if have_visibility
+    libv4l1_c_args += ['-fvisibility=hidden']
+endif
+
+libv4l1 = library('v4l1',
+                  libv4l1_sources,
+                  install : true,
+                  soversion: '0',
+                  version: '0.0.0',
+                  dependencies : libv4l1_deps,
+                  c_args : libv4l1_c_args,
+                  include_directories : v4l2_utils_incdir)
+
+dep_libv4l1 = declare_dependency(link_with : libv4l1)
+
+pkg.generate(
+    libv4l1,
+    name : 'libv4l1',
+    version : meson.project_version(),
+    requires_private : 'libv4l2',
+    description : 'v4l1 compatibility library')
+
+v4l1compat_sources = files(
+    'v4l1compat.c',
+)
+
+v4l1compat_deps = [
+    dep_libv4l1,
+]
+
+libv4l1privdir = get_option('prefix') / get_option('libdir') / get_option('libv4l1subdir')
+
+v4l1compat = shared_module('v4l1compat',
+                           v4l1compat_sources,
+                           name_prefix : '',
+                           install : true,
+                           install_dir : libv4l1privdir,
+                           dependencies : v4l1compat_deps,
+                           include_directories : v4l2_utils_incdir)
+
+dep_v4l1compat = declare_dependency(link_with : v4l1compat)
diff --git a/lib/libv4l2/meson.build b/lib/libv4l2/meson.build
new file mode 100644
index 00000000..119607da
--- /dev/null
+++ b/lib/libv4l2/meson.build
@@ -0,0 +1,70 @@
+libv4l2_sources = files(
+    'libv4l2-priv.h',
+    'libv4l2.c',
+    'log.c',
+)
+
+libv4l2_api = files(
+    '../include/libv4l-plugin.h',
+    '../include/libv4l2.h',
+)
+
+install_headers(libv4l2_api)
+
+libv4l2_deps = [
+    dep_libdl,
+    dep_libv4lconvert,
+    dep_threads,
+]
+
+libv4l2_c_args = []
+
+if get_option('v4l-plugins')
+    libv4l2_sources += files('v4l2-plugin.c')
+    libv4l2_c_args += [
+        '-DHAVE_V4L_PLUGINS',
+        '-DLIBV4L2_PLUGIN_DIR="@0@"'.format(libv4l2plugindir)
+    ]
+endif
+
+if have_visibility
+    libv4l2_c_args += ['-fvisibility=hidden']
+endif
+
+libv4l2 = library('v4l2',
+                  libv4l2_sources,
+                  soversion: '0',
+                  version: '0.0.0',
+                  install : true,
+                  dependencies : libv4l2_deps,
+                  c_args : libv4l2_c_args,
+                  include_directories : v4l2_utils_incdir)
+
+dep_libv4l2 = declare_dependency(link_with : libv4l2)
+
+pkg.generate(
+    libv4l2,
+    name : 'libv4l2',
+    version : meson.project_version(),
+    requires_private : 'libv4lconvert',
+    description : 'v4l2 device access library')
+
+v4l2convert_sources = files(
+    'v4l2convert.c',
+)
+
+v4l2convert_deps = [
+    dep_libv4l2,
+]
+
+libv4l2privdir = get_option('prefix') / get_option('libdir') / get_option('libv4l2subdir')
+
+v4l2convert = shared_module('v4l2convert',
+                            v4l2convert_sources,
+                            name_prefix : '',
+                            install : true,
+                            install_dir : libv4l2privdir,
+                            dependencies : v4l2convert_deps,
+                            include_directories : v4l2_utils_incdir)
+
+dep_v4l2convert = declare_dependency(link_with : v4l2convert)
diff --git a/lib/libv4l2rds/meson.build b/lib/libv4l2rds/meson.build
new file mode 100644
index 00000000..cc36ad43
--- /dev/null
+++ b/lib/libv4l2rds/meson.build
@@ -0,0 +1,36 @@
+libv4l2rds_sources = files(
+    'libv4l2rds.c',
+)
+
+libv4l2rds_api = files(
+    '../include/libv4l2rds.h',
+)
+
+install_headers(libv4l2rds_api)
+
+libv4l2rds_deps = [
+    dep_threads,
+]
+
+libv4l2rds_c_args = []
+
+if have_visibility
+    libv4l2rds_c_args += ['-fvisibility=hidden']
+endif
+
+libv4l2rds = library('v4l2rds',
+                     libv4l2rds_sources,
+                     soversion: '0',
+                     version: '0.0.0',
+                     install : true,
+                     dependencies : libv4l2rds_deps,
+                     c_args : libv4l2rds_c_args,
+                     include_directories : v4l2_utils_incdir)
+
+dep_libv4l2rds = declare_dependency(link_with : libv4l2rds)
+
+pkg.generate(
+    libv4l2rds,
+    name : 'libv4l2rds',
+    version : meson.project_version(),
+    description : 'v4l2 RDS decode library')
diff --git a/lib/libv4lconvert/meson.build b/lib/libv4lconvert/meson.build
new file mode 100644
index 00000000..b7161747
--- /dev/null
+++ b/lib/libv4lconvert/meson.build
@@ -0,0 +1,117 @@
+libv4lconvert_sources = files(
+    'bayer.c',
+    'control/libv4lcontrol-priv.h',
+    'control/libv4lcontrol.c',
+    'control/libv4lcontrol.h',
+    'cpia1.c',
+    'crop.c',
+    'flip.c',
+    'helper-funcs.h',
+    'hm12.c',
+    'jidctflt.c',
+    'jl2005bcd.c',
+    'jpeg.c',
+    'jpgl.c',
+    'libv4lconvert-priv.h',
+    'libv4lconvert.c',
+    'libv4lsyscall-priv.h',
+    'mr97310a.c',
+    'pac207.c',
+    'processing/autogain.c',
+    'processing/gamma.c',
+    'processing/libv4lprocessing-priv.h',
+    'processing/libv4lprocessing.c',
+    'processing/libv4lprocessing.h',
+    'processing/whitebalance.c',
+    'rgbyuv.c',
+    'se401.c',
+    'sn9c10x.c',
+    'sn9c2028-decomp.c',
+    'sn9c20x.c',
+    'spca501.c',
+    'spca561-decompress.c',
+    'sq905c.c',
+    'stv0680.c',
+    'tinyjpeg-internal.h',
+    'tinyjpeg.c',
+    'tinyjpeg.h',
+)
+
+libv4lconvert_api = files(
+    '../include/libv4lconvert.h',
+)
+
+install_headers(libv4lconvert_api)
+
+libv4lconvert_deps = [
+    dep_libm,
+    dep_librt,
+]
+
+libv4lconvert_priv_libs = [
+    '-lm',
+    '-lrt',
+]
+
+libv4lconvertprivdir = get_option('prefix') / get_option('libdir') / get_option('libv4lconvertsubdir')
+
+libv4lconvert_c_args = ['-DLIBV4LCONVERT_PRIV_DIR="@0@"'.format(libv4lconvertprivdir)]
+
+if dep_jpeg.found()
+    libv4lconvert_deps += dep_jpeg
+    libv4lconvert_priv_libs += dep_jpeg_priv_libs
+    libv4lconvert_sources += files(
+        'jpeg_memsrcdest.c',
+        'jpeg_memsrcdest.h'
+    )
+    libv4lconvert_c_args += [
+        '-DHAVE_JPEG',
+    ]
+endif
+
+if have_fork
+    libv4lconvert_sources += files(
+        'helper.c',
+    )
+    ov511_decomp_sources = files(
+        'ov511-decomp.c',
+    )
+    ov511_decomp = executable('ov511-decomp',
+                              ov511_decomp_sources,
+                              install : true,
+                              install_dir : libv4lconvertprivdir,
+                              include_directories : v4l2_utils_incdir)
+    ov518_decomp_sources = files(
+        'ov518-decomp.c',
+    )
+    ov518_decomp = executable('ov518-decomp',
+                              ov518_decomp_sources,
+                              install : true,
+                              install_dir : libv4lconvertprivdir,
+                              include_directories : v4l2_utils_incdir)
+endif
+
+if have_visibility
+    libv4lconvert_c_args += [
+      '-fvisibility=hidden',
+      '-DHAVE_LIBV4LCONVERT_HELPERS',
+    ]
+endif
+
+libv4lconvert = library('v4lconvert',
+                        libv4lconvert_sources,
+                        soversion: '0',
+                        version: '0.0.0',
+                        install : true,
+                        dependencies : libv4lconvert_deps,
+                        c_args : libv4lconvert_c_args,
+                        include_directories : v4l2_utils_incdir)
+
+dep_libv4lconvert = declare_dependency(link_with : libv4lconvert)
+
+pkg.generate(
+    libv4lconvert,
+    name : 'libv4lconvert',
+    libraries_private : libv4lconvert_priv_libs,
+    version : meson.project_version(),
+    description : 'v4l format conversion library')
diff --git a/lib/meson.build b/lib/meson.build
new file mode 100644
index 00000000..47cee16d
--- /dev/null
+++ b/lib/meson.build
@@ -0,0 +1,11 @@
+libv4l2plugindir = get_option('prefix') / get_option('libdir') / get_option('libv4l2subdir') / 'plugins'
+
+subdir('libdvbv5')
+subdir('libv4lconvert')
+subdir('libv4l2')
+subdir('libv4l1')
+subdir('libv4l2rds')
+
+if get_option('v4l-plugins')
+    subdir('libv4l-mplane')
+endif
diff --git a/libdvbv5-po/meson.build b/libdvbv5-po/meson.build
new file mode 100644
index 00000000..e382651e
--- /dev/null
+++ b/libdvbv5-po/meson.build
@@ -0,0 +1,3 @@
+i18n.gettext('libdvbv5',
+    args : i18n_gettext_arguments,
+)
diff --git a/meson.build b/meson.build
new file mode 100644
index 00000000..34c61352
--- /dev/null
+++ b/meson.build
@@ -0,0 +1,315 @@
+project('v4l-utils', 'c', 'cpp',
+    version: '1.21.0',
+    meson_version : '>= 0.53',
+    default_options : [
+        'warning_level=1',
+    ],
+    license : 'LGPL 2.1+')
+
+cc = meson.get_compiler('c')
+cpp = meson.get_compiler('cpp')
+have_m32 = cc.has_link_argument('-m32')
+have_visibility = cc.has_argument('-fvisibility=hidden')
+
+sys_root = meson.get_cross_property('sys_root', '/')
+
+fs = import('fs')
+i18n = import('i18n')
+pkg = import('pkgconfig')
+qt5 = import('qt5')
+
+as_version = meson.project_version()
+ver_arr = as_version.split('.')
+as_major_version = ver_arr[0]
+as_minor_version = ver_arr[1]
+as_patch_version = ver_arr[2]
+
+conf = configuration_data()
+conf.set_quoted('PACKAGE', meson.project_name())
+conf.set_quoted('PACKAGE_VERSION', as_version)
+conf.set_quoted('V4L_UTILS_VERSION', as_version)
+conf.set('MAJOR', as_major_version)
+conf.set('MINOR', as_minor_version)
+conf.set('PATCH', as_patch_version)
+
+common_arguments = [
+    '-Wpointer-arith',
+    '-D_GNU_SOURCE',
+    '-I.', # Needed for config.h
+    '-DPROMOTED_MODE_T=int',
+    '-DENABLE_NLS',
+]
+
+v4l2_utils_incdir_arr = [
+    'lib' / 'include',
+]
+
+if host_machine.system() == 'linux'
+    v4l2_utils_incdir_arr += 'include'
+elif host_machine.system() == 'freebsd'
+    v4l2_utils_incdir_arr += 'contrib/freebsd/include'
+endif
+
+v4l2_utils_incdir = include_directories(v4l2_utils_incdir_arr)
+
+prog_bash = find_program('bash')
+prog_clang = find_program('clang', required : get_option('bpf'))
+prog_git = find_program('git')
+prog_grep = find_program('grep')
+prog_perl = find_program('perl')
+
+dep_alsa = dependency('alsa', required : false)
+if dep_alsa.found()
+    conf.set('HAVE_ALSA', 1)
+endif
+
+dep_gl = dependency('gl', required : get_option('qvidcap').enabled() or get_option('qv4l2').enabled())
+dep_glu = dependency('glu', required : false)
+dep_libdl = cc.find_library('dl')
+dep_libbpf = cc.find_library('bpf', required : get_option('bpf'))
+dep_libelf = cc.find_library('elf', required : get_option('bpf'))
+dep_libm = cc.find_library('m')
+dep_librt = cc.find_library('rt')
+dep_qt5 = dependency('qt5', modules: ['Core', 'Gui', 'Widgets', 'OpenGL'],
+                     required : get_option('qvidcap').enabled() or get_option('qv4l2').enabled())
+dep_sdl = cc.find_library('SDL2', required : false)
+dep_sdl_image = cc.find_library('SDL2_image', required : false)
+dep_threads = dependency('threads')
+dep_x11 = dependency('x11', required : false)
+dep_xmlrpc = dependency('xmlrpc', required : false)
+
+have_fork = cc.has_function('fork')
+have_i2c_dev = cc.has_header('linux/i2c-dev.h')
+
+if have_visibility
+    conf.set('HAVE_VISIBILITY', 1)
+endif
+
+if cc.has_function('klogctl')
+    conf.set('HAVE_KLOGCTL', 1)
+endif
+
+if cc.has_function('secure_getenv')
+    conf.set('HAVE_SECURE_GETENV', 1)
+endif
+
+if cc.has_function('__secure_getenv')
+    conf.set('HAVE___SECURE_GETENV', 1)
+endif
+
+if cc.has_header('sys/klog.h')
+    conf.set('HAVE_SYS_KLOG_H', 1)
+endif
+
+if cc.has_header_symbol('execinfo.h', 'backtrace')
+    conf.set('HAVE_BACKTRACE', 1)
+endif
+
+if cc.has_function('argp_parse')
+    dep_argp = dependency('', required : false)
+else
+    dep_argp = cc.find_library('argp')
+endif
+
+if cc.has_function('iconv_open')
+    dep_iconv = dependency('', required : false)
+    have_iconv = true
+else
+    dep_iconv = cc.find_library('iconv', required : false)
+    have_iconv = dep_iconv.found()
+endif
+
+conf.set_quoted('LOCALEDIR', get_option('prefix') / get_option('datadir') / 'locale')
+
+if have_iconv
+    conf.set('HAVE_ICONV', 1)
+    iconv_const_test = '''#include <iconv.h>
+size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);
+'''
+    if cc.compiles(iconv_const_test, dependencies : dep_iconv)
+        conf.set('ICONV_CONST', '')
+    else
+        conf.set('ICONV_CONST', 'const')
+    endif
+endif
+
+have_gconv = cc.has_header('gconv.h', required : get_option('gconv'))
+
+# Detect system gconv directory
+gconvsysdir = get_option('gconvsysdir')
+
+# Generic check: works with most distributions
+gconv_dirs_generic = [
+    'lib64',
+    'usr/lib64',
+    'usr/local/lib64',
+    'lib',
+    'usr/lib',
+    'usr/local/lib',
+]
+
+if gconvsysdir == ''
+    foreach dir : gconv_dirs_generic
+        dir = sys_root / dir / 'gconv'
+        if fs.is_dir(dir)
+            gconvsysdir = dir
+            break
+        endif
+    endforeach
+endif
+
+# Debian/Ubuntu-specific check: should be aligned with the debian package
+gconv_dirs_debian = [
+    'aarch64-linux-gnu',
+    'alphaev67-linux-gnu',
+    'arm-linux-gnueabi',
+    'arm-linux-gnueabihf',
+    'i686-kfreebsd-gnu',
+    'i686-linux-gnu',
+    'mips-linux-gnu',
+    'mips64-linux-gnuabi64',
+    'mips64-linux-gnuabin32',
+    'mips64el-linux-gnuabi64',
+    'mips64el-linux-gnuabin32',
+    'mipsel-linux-gnu',
+    'mipsisa32r6-linux-gnu',
+    'mipsisa32r6el-linux-gnu',
+    'mipsisa64r6-linux-gnuabi64',
+    'mipsisa64r6-linux-gnuabin32',
+    'mipsisa64r6el-linux-gnuabi64',
+    'mipsisa64r6el-linux-gnuabin32',
+    'powerpc-linux-gnu',
+    'powerpc64-linux-gnu',
+    's390-linux-gnu',
+    'sparc64-linux-gnu',
+    'sparcv9-linux-gnu',
+    'x86_64-linux-gnu',
+    'x86_64-linux-gnux32',
+]
+
+if gconvsysdir == ''
+    foreach dir : gconv_dirs_debian
+        dir = sys_root / 'usr' / 'lib' / dir / 'gconv'
+        if fs.is_dir(dir)
+            gconvsysdir = dir
+            break
+        endif
+    endforeach
+endif
+
+if gconvsysdir == ''
+    dep_jis = cc.find_library('JIS', required : get_option('gconv'))
+    dep_jisx0213 = cc.find_library('JISX0213', required : get_option('gconv'))
+else
+    dep_jis = cc.find_library('JIS', required : get_option('gconv'), dirs : gconvsysdir)
+    dep_jisx0213 = cc.find_library('JISX0213', required : get_option('gconv'), dirs : gconvsysdir)
+endif
+
+dep_jpeg = dependency('libjpeg', required : get_option('jpeg'))
+if dep_jpeg.found()
+    dep_jpeg_priv_libs = '-ljpeg'
+endif
+
+systemd_systemdir = get_option('systemdsystemunitdir')
+if systemd_systemdir == ''
+    dep_systemd = dependency('systemd', required : false)
+    if dep_systemd.found()
+        systemd_systemdir = dep_systemd.get_pkgconfig_variable('systemdsystemunitdir')
+    endif
+endif
+if systemd_systemdir == ''
+    systemd_systemdir = '/lib/systemd/system'
+endif
+# Since systemd v239, udevd is not allowed to execute BPF systems calls;
+# add an override to allow bpf(2) in that case. On earlier versions, the
+# override will restrict udevd to bpf syscall only and will stop the system
+# from booting. This is also true on current debian versions.
+have_udevdsyscallfilter = run_command(prog_grep, '-s', 'SystemCallFilter',
+                                      systemd_systemdir / 'systemd-udevd.service').returncode() == 0
+
+dep_libudev = dependency('libudev', required : get_option('libdvbv5').enabled())
+if dep_libudev.found()
+    conf.set('HAVE_LIBUDEV', 1)
+endif
+
+udevdir = get_option('udevdir')
+if udevdir == ''
+    dep_udev = dependency('udev', required : false)
+    if dep_udev.found()
+        udevdir = dep_udev.get_pkgconfig_variable('udevdir')
+    endif
+endif
+if udevdir == ''
+    udevdir = '/lib/udev'
+endif
+
+qt5_opengl_test = '''
+#define GL_GLEXT_PROTOTYPES
+#define QT_NO_OPENGL_ES_2
+
+#include <QGLWidget>
+#include <QGLShader>
+#include <QGLShaderProgram>
+#include <QGLFunctions>
+
+#ifndef GL_UNSIGNED_INT_8_8_8_8
+#error Missing OpenGL Extensions
+#endif
+'''
+have_qt5_opengl = cpp.compiles(qt5_opengl_test,
+                               dependencies : [dep_gl, dep_qt5],
+                               args : '-fPIC')
+if have_qt5_opengl
+    conf.set('HAVE_QTGL', 1)
+endif
+
+ioctl_posix_test = '''
+#include <sys/ioctl.h>
+int ioctl (int, int, ...);
+'''
+if cc.compiles(ioctl_posix_test)
+    conf.set('HAVE_POSIX_IOCTL', 1)
+endif
+
+c_arguments = []
+cpp_arguments = []
+
+c_arguments += common_arguments
+cpp_arguments += common_arguments
+
+add_project_arguments(c_arguments, language : 'c')
+add_project_arguments(cpp_arguments, language : 'cpp')
+add_project_link_arguments(cpp_arguments, language : 'cpp')
+
+git_sha = run_command(prog_git, '-C', meson.build_root(), 'rev-parse', '--short=12', 'HEAD',
+                      check : true).stdout().strip()
+conf.set_quoted('GIT_SHA', git_sha)
+git_commit_cnt = run_command(prog_git, '-C', meson.build_root(), 'rev-list', '--count', 'HEAD',
+                             check : true).stdout().strip()
+conf.set_quoted('GIT_COMMIT_CNT', '-' + git_commit_cnt)
+git_commit_date = run_command(prog_git, '-C', meson.build_root(), 'show', '--quiet',
+                              '--date=format-local:%F %T', '--format=%cd',
+                              env : ['TZ=UTC'], check : true).stdout().strip()
+conf.set_quoted('GIT_COMMIT_DATE', git_commit_date)
+
+man_pages = []
+
+i18n_gettext_arguments = ['--directory=' + meson.source_root(), '--keyword=_', '--keyword=N_', '--keyword=P_:1,2']
+subdir('libdvbv5-po')
+subdir('v4l-utils-po')
+
+subdir('lib')
+
+if get_option('v4l-utils')
+    subdir('utils')
+    subdir('contrib')
+endif
+
+configure_file(output : 'config.h', configuration : conf)
+
+foreach m : man_pages
+    configure_file(input : join_paths(m[0], '@0@.@1@.in'.format(m[1], m[2])),
+                   output : '@0@.@1@'.format(m[1], m[2]),
+                   install_dir : join_paths(get_option('mandir'), 'man@0@'.format(m[2])),
+                   configuration : conf)
+endforeach
diff --git a/meson_options.txt b/meson_options.txt
new file mode 100644
index 00000000..d1119990
--- /dev/null
+++ b/meson_options.txt
@@ -0,0 +1,42 @@
+# Features
+option('bpf', type : 'feature', value : 'auto',
+       description : 'Enable IR BPF decoders')
+option('gconv', type : 'feature', value : 'auto',
+       description : 'Enable compilation of gconv modules')
+option('jpeg', type : 'feature', value : 'auto')
+option('libdvbv5', type : 'feature', value : 'auto',
+       description : 'Enable libdvbv5 compilation')
+option('qv4l2', type : 'feature', value : 'auto',
+       description : 'Enable qv4l2 compilation')
+option('qvidcap', type : 'feature', value : 'auto',
+       description : 'Enable qvidcap compilation')
+
+# Options
+option('v4l-plugins', type : 'boolean',
+       description : 'V4L plugin support')
+option('v4l-utils', type : 'boolean',
+       description : 'Enable v4l-utils compilation')
+option('v4l2-compliance-32', type : 'boolean', value : false,
+       description : 'Enable v4l2-compliance-32 compilation (for debugging purposes only)')
+option('v4l2-compliance-libv4l', type : 'boolean',
+       description : 'Enable use of libv4l in v4l2-compliance')
+option('v4l2-ctl-32', type : 'boolean', value : false,
+       description : 'Enable v4l2-ctl-32 compilation (for debugging purposes only)')
+option('v4l2-ctl-libv4l', type : 'boolean',
+       description : 'Enable use of libv4l in v4l2-ctl')
+option('v4l2-ctl-stream-to', type : 'boolean',
+       description : 'Enable use of --stream-to in v4l2-ctl')
+
+# Directories
+option('gconvsysdir', type : 'string',
+       description : 'Set system gconv directory (default is to autodetect)')
+option('libv4l1subdir', type : 'string', value : 'libv4l',
+       description : 'Set libv4l1 library subdir')
+option('libv4l2subdir', type : 'string', value : 'libv4l',
+       description : 'Set libv4l2 library subdir')
+option('libv4lconvertsubdir', type : 'string', value : 'libv4l',
+       description : 'Set libv4lconvert library subdir')
+option('systemdsystemunitdir', type : 'string',
+       description : 'Set systemd system unit directory')
+option('udevdir', type : 'string',
+       description : 'Set udev directory')
diff --git a/utils/cec-compliance/meson.build b/utils/cec-compliance/meson.build
new file mode 100644
index 00000000..6e15fcfd
--- /dev/null
+++ b/utils/cec-compliance/meson.build
@@ -0,0 +1,22 @@
+cec_compliance_sources = files(
+    'cec-compliance.cpp',
+    'cec-compliance.h',
+    'cec-test-adapter.cpp',
+    'cec-test-audio.cpp',
+    'cec-test-fuzzing.cpp',
+    'cec-test-power.cpp',
+    'cec-test.cpp',
+)
+
+cec_compliance_deps = [
+    dep_libcecutil,
+    dep_librt,
+]
+
+cec_compliance = executable('cec-compliance',
+                            cec_compliance_sources,
+                            install : true,
+                            dependencies : cec_compliance_deps,
+                            include_directories : v4l2_utils_incdir)
+
+man_pages += [[ meson.current_source_dir(), 'cec-compliance', 1 ]]
diff --git a/utils/cec-ctl/meson.build b/utils/cec-ctl/meson.build
new file mode 100644
index 00000000..059ca206
--- /dev/null
+++ b/utils/cec-ctl/meson.build
@@ -0,0 +1,18 @@
+cec_ctl_sources = files(
+    'cec-ctl.cpp',
+    'cec-ctl.h',
+    'cec-pin.cpp',
+)
+
+cec_ctl_deps = [
+    dep_libcecutil,
+    dep_librt,
+]
+
+cec_ctl = executable('cec-ctl',
+                     cec_ctl_sources,
+                     install : true,
+                     dependencies : cec_ctl_deps,
+                     include_directories : v4l2_utils_incdir)
+
+man_pages += [[ meson.current_source_dir(), 'cec-ctl', 1 ]]
diff --git a/utils/cec-follower/meson.build b/utils/cec-follower/meson.build
new file mode 100644
index 00000000..2d58fac4
--- /dev/null
+++ b/utils/cec-follower/meson.build
@@ -0,0 +1,19 @@
+cec_follower_sources = files(
+    'cec-follower.cpp',
+    'cec-follower.h',
+    'cec-processing.cpp',
+    'cec-tuner.cpp',
+)
+
+cec_follower_deps = [
+    dep_libcecutil,
+    dep_librt,
+]
+
+cec_follower = executable('cec-follower',
+                          cec_follower_sources,
+                          install : true,
+                          dependencies : cec_follower_deps,
+                          include_directories : v4l2_utils_incdir)
+
+man_pages += [[ meson.current_source_dir(), 'cec-follower', 1 ]]
diff --git a/utils/cx18-ctl/meson.build b/utils/cx18-ctl/meson.build
new file mode 100644
index 00000000..161b91c9
--- /dev/null
+++ b/utils/cx18-ctl/meson.build
@@ -0,0 +1,8 @@
+cx18_ctl_sources = files(
+    'cx18-ctl.c',
+)
+
+cx18_ctl = executable('cx18-ctl',
+                      cx18_ctl_sources,
+                      install : true,
+                      include_directories : v4l2_utils_incdir)
diff --git a/utils/dvb/meson.build b/utils/dvb/meson.build
new file mode 100644
index 00000000..871f5a39
--- /dev/null
+++ b/utils/dvb/meson.build
@@ -0,0 +1,70 @@
+dvb_common_deps =  [
+    dep_argp,
+    dep_libdvbv5,
+    dep_libudev,
+    dep_threads,
+    dep_xmlrpc,
+]
+
+dvb_fe_tool_sources = files(
+    'dvb-fe-tool.c',
+)
+
+dvb_fe_tool = executable('dvb-fe-tool',
+                         dvb_fe_tool_sources,
+                         install : true,
+                         dependencies : dvb_common_deps,
+                         include_directories : v4l2_utils_incdir)
+
+man_pages += [[ meson.current_source_dir(), 'dvb-fe-tool', 1 ]]
+
+dvbv5_zap_sources = files(
+    'dvbv5-zap.c',
+)
+
+dvbv5_zap = executable('dvbv5-zap',
+                       dvbv5_zap_sources,
+                       install : true,
+                       dependencies : dvb_common_deps,
+                       include_directories : v4l2_utils_incdir)
+
+man_pages += [[ meson.current_source_dir(), 'dvbv5-zap', 1 ]]
+
+dvbv5_scan_sources = files(
+    'dvbv5-scan.c',
+)
+
+dvbv5_scan = executable('dvbv5-scan',
+                        dvbv5_scan_sources,
+                        install : true,
+                        dependencies : dvb_common_deps,
+                        include_directories : v4l2_utils_incdir)
+
+man_pages += [[ meson.current_source_dir(), 'dvbv5-scan', 1 ]]
+
+dvb_format_convert_sources = files(
+    'dvb-format-convert.c',
+)
+
+dvb_format_convert = executable('dvb-format-convert',
+                                dvb_format_convert_sources,
+                                install : true,
+                                dependencies : dvb_common_deps,
+                                include_directories : v4l2_utils_incdir)
+
+man_pages += [[ meson.current_source_dir(), 'dvb-format-convert', 1 ]]
+
+dvbv5_daemon_sources = files(
+    'dvbv5-daemon.c',
+)
+
+dvbv5_daemon_c_args = [
+    '-DHAVE_DVBV5_REMOTE',
+]
+
+dvbv5_daemon = executable('dvbv5-daemon',
+                          dvbv5_daemon_sources,
+                          install : true,
+                          dependencies : dvb_common_deps,
+                          c_args : dvbv5_daemon_c_args,
+                          include_directories : v4l2_utils_incdir)
diff --git a/utils/gen_media_bus_format_codes.sh b/utils/gen_media_bus_format_codes.sh
new file mode 100755
index 00000000..4bdcc3b7
--- /dev/null
+++ b/utils/gen_media_bus_format_codes.sh
@@ -0,0 +1,7 @@
+#!/bin/bash
+
+src="$1"
+
+sed -e \
+'/#define MEDIA_BUS_FMT/ ! d; s/.*#define //; /FIXED/ d; s/\t.*//; s/.*/ &,/;' \
+${src}
diff --git a/utils/gen_media_bus_format_names.sh b/utils/gen_media_bus_format_names.sh
new file mode 100755
index 00000000..3fdc830d
--- /dev/null
+++ b/utils/gen_media_bus_format_names.sh
@@ -0,0 +1,7 @@
+#!/bin/bash
+
+src="$1"
+
+sed -e \
+'/#define MEDIA_BUS_FMT/ ! d; s/.*FMT_//; /FIXED/ d; s/\t.*//; s/.*/{ \"&\", MEDIA_BUS_FMT_& },/;' \
+${src}
diff --git a/utils/ir-ctl/meson.build b/utils/ir-ctl/meson.build
new file mode 100644
index 00000000..24d73a15
--- /dev/null
+++ b/utils/ir-ctl/meson.build
@@ -0,0 +1,23 @@
+ir_ctl_sources = files(
+    'bpf_encoder.c',
+    'bpf_encoder.h',
+    'ir-ctl.c',
+    'ir-encode.c',
+    'ir-encode.h',
+    'keymap.c',
+    'keymap.h',
+    'toml.c',
+    'toml.h',
+)
+
+ir_ctl_deps =  [
+    dep_argp,
+]
+
+ir_ctl = executable('ir-ctl',
+                    ir_ctl_sources,
+                    install : true,
+                    dependencies : ir_ctl_deps,
+                    include_directories : v4l2_utils_incdir)
+
+man_pages += [[ meson.current_source_dir(), 'ir-ctl', 1 ]]
diff --git a/utils/ivtv-ctl/meson.build b/utils/ivtv-ctl/meson.build
new file mode 100644
index 00000000..410a8439
--- /dev/null
+++ b/utils/ivtv-ctl/meson.build
@@ -0,0 +1,13 @@
+ivtv_ctl_sources = files(
+    'ivtv-ctl.c',
+)
+
+ivtv_ctl_deps = [
+    dep_libm,
+]
+
+ivtv_ctl = executable('ivtv-ctl',
+                      ivtv_ctl_sources,
+                      install : true,
+                      dependencies : ivtv_ctl_deps,
+                      include_directories : v4l2_utils_incdir)
diff --git a/utils/keytable/bpf_protocols/clang_sys_includes.sh b/utils/keytable/bpf_protocols/clang_sys_includes.sh
new file mode 100755
index 00000000..9dc4af12
--- /dev/null
+++ b/utils/keytable/bpf_protocols/clang_sys_includes.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+# Get Clang's default includes on this system, as opposed to those seen by
+# '-target bpf'. This fixes "missing" files on some architectures/distros,
+# such as asm/byteorder.h, asm/socket.h, asm/sockios.h, sys/cdefs.h etc.
+#
+# Use '-idirafter': Don't interfere with include mechanics except where the
+# build would have failed anyways.
+$CLANG -v -E - </dev/null 2>&1 \
+	| sed -n '/<...> search starts here:/,/End of search list./{ s| \(/.*\)|-idirafter \1|p }'
diff --git a/utils/keytable/bpf_protocols/meson.build b/utils/keytable/bpf_protocols/meson.build
new file mode 100644
index 00000000..ccf93965
--- /dev/null
+++ b/utils/keytable/bpf_protocols/meson.build
@@ -0,0 +1,39 @@
+bpf_protocols_files = [
+    'grundig',
+    'imon_rsc',
+    'manchester',
+    'pulse_distance',
+    'pulse_length',
+    'raw',
+    'rc_mm',
+    'samsung36',
+    'xbox-dvd',
+]
+
+clang_sys_includes = run_command('clang_sys_includes.sh',
+                                 check : true,
+                                 env : ['CLANG=' + prog_clang.path()])
+
+foreach file : bpf_protocols_files
+    output = file + '.o'
+    input = file + '.c'
+    custom_target(output,
+                  output : output,
+                  input : input,
+                  command : [
+                      prog_clang.path(),
+                      clang_sys_includes.stdout().split(),
+                      '-D__linux__', '-target', 'bpf', '-O2',
+                      '-c', '@INPUT@', '-o', '@OUTPUT@',
+                  ],
+                  install : true,
+                  install_dir : ir_keytable_system_dir / 'rc_keymaps' / 'protocols')
+endforeach
+
+# As per meson version 0.50.0, there's no direct method to install an empty
+# directory. A simple work-around, let's install the following dummy directory
+# with no files in it.
+install_subdir('user_dir_protocols',
+               exclude_files : 'README.md',
+               strip_directory : true,
+               install_dir : ir_keytable_user_dir / 'protocols')
diff --git a/utils/keytable/bpf_protocols/user_dir_protocols/README.md b/utils/keytable/bpf_protocols/user_dir_protocols/README.md
new file mode 100644
index 00000000..033997a8
--- /dev/null
+++ b/utils/keytable/bpf_protocols/user_dir_protocols/README.md
@@ -0,0 +1 @@
+This directory is used by meson to install an empty directory.
diff --git a/utils/keytable/meson.build b/utils/keytable/meson.build
new file mode 100644
index 00000000..ed2ff120
--- /dev/null
+++ b/utils/keytable/meson.build
@@ -0,0 +1,76 @@
+ir_keytable_sources = files(
+    'ir-encode.c',
+    'ir-encode.h',
+    'keymap.c',
+    'keymap.h',
+    'keytable.c',
+    'parse.h',
+    'toml.c',
+    'toml.h',
+)
+
+ir_keytable_deps = [
+    dep_argp,
+]
+
+ir_keytable_system_dir = udevdir
+ir_keytable_user_dir = get_option('sysconfdir') / 'rc_keymaps'
+
+ir_keytable_c_args = [
+    '-DIR_KEYTABLE_SYSTEM_DIR="@0@"'.format(ir_keytable_system_dir),
+    '-DIR_KEYTABLE_USER_DIR="@0@"'.format(ir_keytable_user_dir),
+]
+
+if not get_option('bpf').disabled() and prog_clang.found() and dep_libelf.found()
+    ir_keytable_sources += files(
+        'bpf_load.c',
+        'bpf_load.h',
+    )
+    ir_keytable_deps += [
+        dep_libbpf,
+        dep_libelf,
+    ]
+    ir_keytable_c_args += [
+	'-DHAVE_BPF',
+    ]
+    subdir('bpf_protocols')
+endif
+
+ir_keytable_incdir = [
+    utils_common_incdir,
+    v4l2_utils_incdir,
+]
+
+ir_keytable = executable('ir-keytable',
+                         sources : ir_keytable_sources,
+                         install : true,
+                         dependencies : ir_keytable_deps,
+                         c_args : ir_keytable_c_args,
+                         include_directories : ir_keytable_incdir)
+
+man_pages += [[ meson.current_source_dir(), 'ir-keytable', 1 ]]
+man_pages += [[ meson.current_source_dir(), 'rc_keymap', 5 ]]
+
+ir_keytable_sysconf_files = files(
+    'rc_maps.cfg',
+)
+install_data(ir_keytable_sysconf_files,
+             install_dir : get_option('sysconfdir'))
+
+subdir('rc_keymaps')
+install_data(ir_keytable_rc_keymaps,
+             install_dir : ir_keytable_system_dir / 'rc_keymaps')
+
+ir_keytable_udev_rules = files(
+    '70-infrared.rules',
+)
+install_data(ir_keytable_udev_rules,
+             install_dir : ir_keytable_system_dir / 'rules.d')
+
+if have_udevdsyscallfilter
+    ir_keytable_systemd_files = files(
+        '50-rc_keymap.conf',
+    )
+    install_data(ir_keytable_systemd_files,
+                 install_dir : systemd_systemdir / 'systemd-udevd.service.d')
+endif
diff --git a/utils/keytable/rc_keymaps/meson.build b/utils/keytable/rc_keymaps/meson.build
new file mode 100644
index 00000000..a9b508b8
--- /dev/null
+++ b/utils/keytable/rc_keymaps/meson.build
@@ -0,0 +1,151 @@
+ir_keytable_rc_keymaps = files(
+    'adstech_dvb_t_pci.toml',
+    'af9005.toml',
+    'alink_dtu_m.toml',
+    'allwinner_ba10_tv_box.toml',
+    'allwinner_i12_a20_tv_box.toml',
+    'anysee.toml',
+    'apac_viewcomp.toml',
+    'astrometa_t2hybrid.toml',
+    'asus_pc39.toml',
+    'asus_ps3_100.toml',
+    'ati_tv_wonder_hd_600.toml',
+    'ati_x10.toml',
+    'avermedia.toml',
+    'avermedia_a16d.toml',
+    'avermedia_cardbus.toml',
+    'avermedia_dvbt.toml',
+    'avermedia_m135a.toml',
+    'avermedia_m733a_rm_k6.toml',
+    'avermedia_rm_ks.toml',
+    'avertv_303.toml',
+    'az6027.toml',
+    'azurewave_ad_tu700.toml',
+    'beelink_gs1.toml',
+    'behold.toml',
+    'behold_columbus.toml',
+    'budget_ci_old.toml',
+    'cec.toml',
+    'cinergy.toml',
+    'cinergy_1400.toml',
+    'cinergyt2.toml',
+    'd680_dmb.toml',
+    'delock_61959.toml',
+    'dib0700_nec.toml',
+    'dib0700_rc5.toml',
+    'dibusb.toml',
+    'digitalnow_tinytwin.toml',
+    'digittrade.toml',
+    'digitv.toml',
+    'dish_network.toml',
+    'dm1105_nec.toml',
+    'dntv_live_dvb_t.toml',
+    'dntv_live_dvbt_pro.toml',
+    'dtt200u.toml',
+    'dvbsky.toml',
+    'dvico_mce.toml',
+    'dvico_portable.toml',
+    'em_terratec.toml',
+    'encore_enltv.toml',
+    'encore_enltv2.toml',
+    'encore_enltv_fm53.toml',
+    'evga_indtube.toml',
+    'eztv.toml',
+    'flydvb.toml',
+    'flyvideo.toml',
+    'fusionhdtv_mce.toml',
+    'gadmei_rm008z.toml',
+    'geekbox.toml',
+    'genius_tvgo_a11mce.toml',
+    'gotview7135.toml',
+    'haupp.toml',
+    'hauppauge.toml',
+    'hisi_poplar.toml',
+    'hisi_tv_demo.toml',
+    'imon_mce.toml',
+    'imon_pad.toml',
+    'imon_rsc.toml',
+    'iodata_bctv7e.toml',
+    'it913x_v1.toml',
+    'it913x_v2.toml',
+    'kaiomy.toml',
+    'khadas.toml',
+    'khamsin.toml',
+    'kii_pro.toml',
+    'kworld_315u.toml',
+    'kworld_pc150u.toml',
+    'kworld_plus_tv_analog.toml',
+    'leadtek_y04g0051.toml',
+    'lme2510.toml',
+    'manli.toml',
+    'mce_keyboard.toml',
+    'medion_x10.toml',
+    'medion_x10_digitainer.toml',
+    'medion_x10_or2x.toml',
+    'megasky.toml',
+    'minix_neo.toml',
+    'msi_digivox_ii.toml',
+    'msi_digivox_iii.toml',
+    'msi_tvanywhere.toml',
+    'msi_tvanywhere_plus.toml',
+    'nebula.toml',
+    'nec_terratec_cinergy_xs.toml',
+    'norwood.toml',
+    'npgtech.toml',
+    'odroid.toml',
+    'opera1.toml',
+    'pctv_sedna.toml',
+    'pine64.toml',
+    'pinnacle310e.toml',
+    'pinnacle_color.toml',
+    'pinnacle_grey.toml',
+    'pinnacle_pctv_hd.toml',
+    'pixelview.toml',
+    'pixelview_002t.toml',
+    'pixelview_mk12.toml',
+    'pixelview_new.toml',
+    'powercolor_real_angel.toml',
+    'proteus_2309.toml',
+    'purpletv.toml',
+    'pv951.toml',
+    'rc6_mce.toml',
+    'real_audio_220_32_keys.toml',
+    'reddo.toml',
+    'samsung_ak59_00125a.toml',
+    'snapstream_firefly.toml',
+    'streamzap.toml',
+    'su3000.toml',
+    'tango.toml',
+    'tanix_tx3mini.toml',
+    'tanix_tx5max.toml',
+    'tbs_nec.toml',
+    'technisat_ts35.toml',
+    'technisat_usb2.toml',
+    'terratec_cinergy_c_pci.toml',
+    'terratec_cinergy_s2_hd.toml',
+    'terratec_cinergy_xs.toml',
+    'terratec_slim.toml',
+    'terratec_slim_2.toml',
+    'tevii_nec.toml',
+    'tivo.toml',
+    'total_media_in_hand.toml',
+    'total_media_in_hand_02.toml',
+    'trekstor.toml',
+    'tt_1500.toml',
+    'tvwalkertwin.toml',
+    'twinhan_dtv_cab_ci.toml',
+    'twinhan_vp1027_dvbs.toml',
+    'vega_s9x.toml',
+    'videomate_k100.toml',
+    'videomate_s350.toml',
+    'videomate_tv_pvr.toml',
+    'vp702x.toml',
+    'wetek_hub.toml',
+    'wetek_play2.toml',
+    'winfast.toml',
+    'winfast_usbii_deluxe.toml',
+    'wobo_i5.toml',
+    'x96max.toml',
+    'xbox_dvd.toml',
+    'zx_irdec.toml',
+)
diff --git a/utils/libcecutil/meson.build b/utils/libcecutil/meson.build
new file mode 100644
index 00000000..ed3aa88c
--- /dev/null
+++ b/utils/libcecutil/meson.build
@@ -0,0 +1,45 @@
+libcecutil_sources = files(
+    'cec-htng-funcs.h',
+    'cec-htng.h',
+    'cec-info.cpp',
+    'cec-info.h',
+    'cec-log.cpp',
+    'cec-log.h',
+    'cec-parse.cpp',
+    'cec-parse.h',
+)
+
+libcecutil_deps = [
+    dep_libdl,
+    dep_libv4lconvert,
+    dep_threads,
+]
+
+libcecutil_incdir = [
+    utils_common_incdir,
+    v4l2_utils_incdir,
+]
+
+cec_gen_sources = files(
+    '../../include/linux/cec.h',
+    'cec-htng.h',
+    '../../include/linux/cec-funcs.h',
+    'cec-htng-funcs.h',
+)
+
+configure_file(
+    input : 'cec-gen.pl',
+    output : 'cec-gen-dummy.stamp',
+    command : [prog_perl, '@INPUT@', cec_gen_sources, 'utils/libcecutil'],
+)
+
+libcecutil = static_library('cecutil',
+                            libcecutil_sources,
+                            install : false,
+                            dependencies : libcecutil_deps,
+                            include_directories : libcecutil_incdir)
+
+dep_libcecutil = declare_dependency(
+    link_with : libcecutil,
+    include_directories : '.',
+)
diff --git a/utils/libmedia_dev/meson.build b/utils/libmedia_dev/meson.build
new file mode 100644
index 00000000..f97238e6
--- /dev/null
+++ b/utils/libmedia_dev/meson.build
@@ -0,0 +1,14 @@
+libmedia_dev_sources = files(
+    'get_media_devices.c',
+    'get_media_devices.h',
+)
+
+libmedia_dev = static_library('media_dev',
+                              libmedia_dev_sources,
+                              install : false,
+                              include_directories : v4l2_utils_incdir)
+
+dep_libmedia_dev = declare_dependency(
+    link_with : libmedia_dev,
+    include_directories : '.',
+)
diff --git a/utils/libv4l2util/meson.build b/utils/libv4l2util/meson.build
new file mode 100644
index 00000000..9d1c6e12
--- /dev/null
+++ b/utils/libv4l2util/meson.build
@@ -0,0 +1,16 @@
+libv4l2util_sources = files(
+    'frequencies.c',
+    'libv4l2util.h',
+    'v4l2_driver.c',
+    'v4l2_driver.h',
+)
+
+libv4l2util = static_library('v4l2util',
+                             libv4l2util_sources,
+                             install : false,
+                             include_directories : v4l2_utils_incdir)
+
+dep_libv4l2util = declare_dependency(
+    link_with : libv4l2util,
+    include_directories : '.',
+)
diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson.build
new file mode 100644
index 00000000..3a7b0c9a
--- /dev/null
+++ b/utils/media-ctl/meson.build
@@ -0,0 +1,43 @@
+libmediactl_sources = files(
+    'libmediactl.c',
+    'mediactl-priv.h',
+)
+
+libmediactl_deps = [
+    dep_libudev,
+]
+
+libmediactl = static_library('mediactl',
+                             libmediactl_sources,
+                             dependencies : libmediactl_deps,
+                             include_directories : v4l2_utils_incdir)
+
+dep_libmediactl = declare_dependency(link_with : libmediactl)
+
+libv4l2subdev_sources = files('libv4l2subdev.c')
+libv4l2subdev_sources += media_bus_format_names_h
+libv4l2subdev_sources += media_bus_format_codes_h
+
+libv4l2subdev = static_library('v4l2subdev',
+                               libv4l2subdev_sources,
+                               include_directories : v4l2_utils_incdir)
+
+dep_libv4l2subdev = declare_dependency(link_with : libv4l2subdev)
+
+media_ctl_sources = files(
+    'media-ctl.c',
+    'options.c',
+    'options.h',
+    'tools.h',
+)
+
+media_ctl_deps = [
+    dep_libmediactl,
+    dep_libv4l2subdev,
+]
+
+media_ctl = executable('media-ctl',
+                       media_ctl_sources,
+                       dependencies : media_ctl_deps,
+                       install : true,
+                       include_directories : v4l2_utils_incdir)
diff --git a/utils/meson.build b/utils/meson.build
new file mode 100644
index 00000000..7b7ac8e0
--- /dev/null
+++ b/utils/meson.build
@@ -0,0 +1,46 @@
+utils_common_incdir = include_directories('common')
+
+# Generate targets for media-bus-format-{names,codes}.h
+foreach x: [ 'names', 'codes' ]
+    output_file = 'media-bus-format-@0@.h'.format(x)
+    input_file = 'gen_media_bus_format_@0@.sh'.format(x)
+    target = custom_target(
+        output_file,
+        output : output_file,
+        input : input_file,
+        command : [
+            prog_bash, '@INPUT@', files('..' / 'include' / 'linux' / 'media-bus-format.h'),
+        ],
+        capture : true,
+    )
+    set_variable(output_file.underscorify(), target)
+endforeach
+
+# Libraries
+subdir('libcecutil')
+subdir('libmedia_dev')
+subdir('libv4l2util')
+
+# Utils
+subdir('cec-ctl')
+subdir('cec-follower')
+subdir('cx18-ctl')
+subdir('dvb', if_found : dep_libdvbv5)
+subdir('ir-ctl')
+subdir('ivtv-ctl')
+subdir('keytable')
+subdir('media-ctl')
+subdir('qv4l2')
+if have_qt5_opengl
+    subdir('qvidcap')
+endif
+subdir('rds-ctl')
+subdir('v4l2-ctl')
+subdir('v4l2-dbg')
+subdir('v4l2-sysfs-path')
+
+# Compliance tools
+subdir('cec-compliance')
+if have_fork
+    subdir('v4l2-compliance')
+endif
diff --git a/utils/qv4l2/meson.build b/utils/qv4l2/meson.build
new file mode 100644
index 00000000..a0a6a637
--- /dev/null
+++ b/utils/qv4l2/meson.build
@@ -0,0 +1,80 @@
+qv4l2_option = get_option('qv4l2')
+if qv4l2_option.disabled() or not dep_qt5.found() or not dep_gl.found()
+    subdir_done()
+endif
+
+qv4l2_sources = files(
+    'alsa_stream.c',
+    'alsa_stream.h',
+    'capture-win-gl.cpp',
+    'capture-win-gl.h',
+    'capture-win-qt.cpp',
+    'capture-win-qt.h',
+    'capture-win.cpp',
+    'capture-win.h',
+    'ctrl-tab.cpp',
+    'general-tab.cpp',
+    'general-tab.h',
+    'qv4l2.cpp',
+    'qv4l2.h',
+    'raw2sliced.cpp',
+    'raw2sliced.h',
+    'tpg-tab.cpp',
+    'v4l2-tpg-colors.c',
+    'v4l2-tpg-core.c',
+    'vbi-tab.cpp',
+    'vbi-tab.h',
+)
+
+qv4l2_deps = [
+    dep_alsa,
+    dep_gl,
+    dep_libmedia_dev,
+    dep_libv4l2,
+    dep_libv4l2util,
+    dep_libv4lconvert,
+    dep_qt5,
+    dep_threads,
+]
+
+qv4l2_incdir = [
+    utils_common_incdir,
+    v4l2_utils_incdir,
+]
+
+qt5_files = qt5.preprocess(
+    moc_headers : ['qv4l2.h', 'general-tab.h', 'vbi-tab.h', 'capture-win.h'],
+    qresources : 'qv4l2.qrc',
+)
+qv4l2_sources += qt5_files
+
+qv4l2 = executable('qv4l2',
+                   sources : qv4l2_sources,
+                   install : true,
+                   dependencies : qv4l2_deps,
+                   include_directories : qv4l2_incdir)
+
+man_pages += [[ meson.current_source_dir(), 'qv4l2', 1 ]]
+
+qv4l2_applications_files = files(
+    'qv4l2.desktop',
+)
+
+install_data('qv4l2.desktop',
+             install_dir : get_option('datadir') / 'applications')
+
+qv4l2_icons_dir = get_option('datadir') / 'icons' / 'hicolor'
+
+qv4l2_icons_files = [
+    ['qv4l2_16x16.png', '16x16',    'qv4l2.png'],
+    ['qv4l2_24x24.png', '24x24',    'qv4l2.png'],
+    ['qv4l2_32x32.png', '32x32',    'qv4l2.png'],
+    ['qv4l2_64x64.png', '64x64',    'qv4l2.png'],
+    ['qv4l2.svg',       'scalable', 'qv4l2.svg'],
+]
+
+foreach f : qv4l2_icons_files
+    install_data(f[0],
+                 rename: f[1] / 'apps' / f[2],
+                 install_dir : qv4l2_icons_dir)
+endforeach
diff --git a/utils/qvidcap/meson.build b/utils/qvidcap/meson.build
new file mode 100644
index 00000000..098d0534
--- /dev/null
+++ b/utils/qvidcap/meson.build
@@ -0,0 +1,82 @@
+qvidcap_option = get_option('qvidcap')
+if qvidcap_option.disabled() or not dep_qt5.found() or not dep_gl.found()
+    subdir_done()
+endif
+
+qvidcap_sources = files(
+    'capture.cpp',
+    'capture.h',
+    'codec-fwht.c',
+    'codec-v4l2-fwht.c',
+    'paint.cpp',
+    'qvidcap.cpp',
+    'qvidcap.h',
+    'v4l-stream.c',
+    'v4l2-info.cpp',
+    'v4l2-tpg-colors.c',
+    'v4l2-tpg-core.c',
+)
+
+qvidcap_deps = [
+    dep_alsa,
+    dep_gl,
+    dep_libmedia_dev,
+    dep_libv4l2,
+    dep_libv4l2util,
+    dep_libv4lconvert,
+    dep_qt5,
+    dep_threads,
+]
+
+qvidcap_incdir = [
+    utils_common_incdir,
+    v4l2_utils_incdir,
+]
+
+qt5_files = qt5.preprocess(
+    moc_headers : 'capture.h',
+    qresources : 'qvidcap.qrc',
+)
+qvidcap_sources += qt5_files
+
+v4l2_convert_sources = files(
+    'v4l2-convert.glsl',
+)
+
+configure_file(
+    input : 'v4l2-convert.pl',
+    output : 'v4l2-convert.h',
+    capture : true,
+    command : [prog_perl, '@INPUT@', v4l2_convert_sources],
+)
+
+qvidcap = executable('qvidcap',
+                     sources : qvidcap_sources,
+                     install : true,
+                     dependencies : qvidcap_deps,
+                     include_directories : qvidcap_incdir)
+
+man_pages += [[ meson.current_source_dir(), 'qvidcap', 1 ]]
+
+qvidcap_applications_files = files(
+    'qvidcap.desktop',
+)
+
+install_data('qvidcap.desktop',
+             install_dir : get_option('datadir') / 'applications')
+
+qvidcap_icons_dir = get_option('datadir') / 'icons' / 'hicolor'
+
+qvidcap_icons_files = [
+    ['qvidcap_16x16.png', '16x16',    'qvidcap.png'],
+    ['qvidcap_24x24.png', '24x24',    'qvidcap.png'],
+    ['qvidcap_32x32.png', '32x32',    'qvidcap.png'],
+    ['qvidcap_64x64.png', '64x64',    'qvidcap.png'],
+    ['qvidcap.svg',       'scalable', 'qvidcap.svg'],
+]
+
+foreach f : qvidcap_icons_files
+    install_data(f[0],
+                 rename: f[1] / 'apps' / f[2],
+                 install_dir : qvidcap_icons_dir)
+endforeach
diff --git a/utils/rds-ctl/meson.build b/utils/rds-ctl/meson.build
new file mode 100644
index 00000000..be797035
--- /dev/null
+++ b/utils/rds-ctl/meson.build
@@ -0,0 +1,13 @@
+rds_ctl_sources = files(
+    'rds-ctl.cpp',
+)
+
+rds_ctl_deps = [
+    dep_libv4l2rds,
+]
+
+rds_ctl = executable('rds-ctl',
+                     rds_ctl_sources,
+                     install : true,
+                     dependencies : rds_ctl_deps,
+                     include_directories : v4l2_utils_incdir)
diff --git a/utils/v4l2-compliance/meson.build b/utils/v4l2-compliance/meson.build
new file mode 100644
index 00000000..cdcee4cb
--- /dev/null
+++ b/utils/v4l2-compliance/meson.build
@@ -0,0 +1,58 @@
+v4l2_compliance_sources = files(
+    'media-info.cpp',
+    'v4l2-compliance.cpp',
+    'v4l2-compliance.h',
+    'v4l2-info.cpp',
+    'v4l2-test-buffers.cpp',
+    'v4l2-test-codecs.cpp',
+    'v4l2-test-colors.cpp',
+    'v4l2-test-controls.cpp',
+    'v4l2-test-debug.cpp',
+    'v4l2-test-formats.cpp',
+    'v4l2-test-input-output.cpp',
+    'v4l2-test-io-config.cpp',
+    'v4l2-test-media.cpp',
+    'v4l2-test-subdevs.cpp',
+)
+
+v4l2_compliance_deps = [
+    dep_librt,
+    dep_threads,
+]
+
+v4l2_compliance_cpp_args = []
+
+if get_option('v4l2-compliance-libv4l')
+    v4l2_compliance_deps += [
+        dep_libv4lconvert,
+        dep_libv4l2,
+    ]
+else
+    v4l2_compliance_cpp_args += '-DNO_LIBV4L2'
+endif
+
+v4l2_compliance_incdir = [
+    utils_common_incdir,
+    v4l2_utils_incdir,
+]
+
+v4l2_compliance = executable('v4l2-compliance',
+                             v4l2_compliance_sources,
+                             install : true,
+                             dependencies : v4l2_compliance_deps,
+                             cpp_args : v4l2_compliance_cpp_args,
+                             include_directories : v4l2_compliance_incdir)
+
+man_pages += [[ meson.current_source_dir(), 'v4l2-compliance', 1 ]]
+
+v4l2_compliance_32_cpp_args = ['-m32', '-DNO_LIBV4L2']
+v4l2_compliance_32_link_args = ['-m32', '-static']
+
+if get_option('v4l2-compliance-32') and have_m32
+    v4l2_compliance_32 = executable('v4l2-compliance-32',
+                                    v4l2_compliance_sources,
+                                    install : true,
+                                    cpp_args : v4l2_compliance_32_cpp_args,
+                                    link_args : v4l2_compliance_32_link_args,
+                                    include_directories : v4l2_compliance_incdir)
+endif
diff --git a/utils/v4l2-ctl/meson.build b/utils/v4l2-ctl/meson.build
new file mode 100644
index 00000000..3e366c6c
--- /dev/null
+++ b/utils/v4l2-ctl/meson.build
@@ -0,0 +1,75 @@
+v4l2_ctl_sources = files(
+    'codec-fwht.c',
+    'codec-v4l2-fwht.c',
+    'media-info.cpp',
+    'v4l-stream.c',
+    'v4l2-ctl-common.cpp',
+    'v4l2-ctl-edid.cpp',
+    'v4l2-ctl-io.cpp',
+    'v4l2-ctl-meta.cpp',
+    'v4l2-ctl-misc.cpp',
+    'v4l2-ctl-modes.cpp',
+    'v4l2-ctl-overlay.cpp',
+    'v4l2-ctl-sdr.cpp',
+    'v4l2-ctl-selection.cpp',
+    'v4l2-ctl-stds.cpp',
+    'v4l2-ctl-streaming.cpp',
+    'v4l2-ctl-subdev.cpp',
+    'v4l2-ctl-tuner.cpp',
+    'v4l2-ctl-vbi.cpp',
+    'v4l2-ctl-vidcap.cpp',
+    'v4l2-ctl-vidout.cpp',
+    'v4l2-ctl.cpp',
+    'v4l2-ctl.h',
+    'v4l2-info.cpp',
+    'v4l2-tpg-colors.c',
+    'v4l2-tpg-core.c',
+)
+v4l2_ctl_sources += media_bus_format_names_h
+
+v4l2_ctl_deps = [
+    dep_librt,
+    dep_threads,
+]
+
+v4l2_ctl_cpp_args = []
+
+if get_option('v4l2-ctl-libv4l')
+    v4l2_ctl_deps += [
+        dep_libv4l2,
+        dep_libv4lconvert,
+    ]
+else
+    v4l2_ctl_cpp_args += '-DNO_LIBV4L2'
+endif
+
+if not get_option('v4l2-ctl-stream-to')
+    v4l2_ctl_cpp_args += '-DNO_STREAM_TO'
+endif
+
+v4l2_ctl_incdir = [
+    utils_common_incdir,
+    v4l2_utils_incdir,
+]
+
+v4l2_ctl = executable('v4l2-ctl',
+                      v4l2_ctl_sources,
+                      install : true,
+                      dependencies : v4l2_ctl_deps,
+                      cpp_args : v4l2_ctl_cpp_args,
+                      include_directories : v4l2_ctl_incdir)
+
+man_pages += [[ meson.current_source_dir(), 'v4l2-ctl', 1 ]]
+
+v4l2_ctl_32_c_cpp_args = ['-m32', '-DNO_LIBV4L2']
+v4l2_ctl_32_link_args = ['-m32', '-static']
+
+if get_option('v4l2-ctl-32') and have_m32
+    v4l2_ctl_32 = executable('v4l2-ctl-32',
+                             v4l2_ctl_sources,
+                             install : true,
+                             c_args : v4l2_ctl_32_c_cpp_args,
+                             cpp_args : v4l2_ctl_32_c_cpp_args,
+                             link_args : v4l2_ctl_32_link_args,
+                             include_directories : v4l2_ctl_incdir)
+endif
diff --git a/utils/v4l2-dbg/meson.build b/utils/v4l2-dbg/meson.build
new file mode 100644
index 00000000..5c721592
--- /dev/null
+++ b/utils/v4l2-dbg/meson.build
@@ -0,0 +1,16 @@
+v4l2_dbg_sources = files(
+    'v4l2-dbg-ac97.h',
+    'v4l2-dbg-bttv.h',
+    'v4l2-dbg-em28xx.h',
+    'v4l2-dbg-micron.h',
+    'v4l2-dbg-saa7134.h',
+    'v4l2-dbg-tvp5150.h',
+    'v4l2-dbg.cpp',
+    'v4l2-dbg.h',
+)
+
+v4l2_dbg = executable('v4l2-dbg',
+                      v4l2_dbg_sources,
+                      install : true,
+                      install_dir : 'sbin',
+                      include_directories : v4l2_utils_incdir)
diff --git a/utils/v4l2-sysfs-path/meson.build b/utils/v4l2-sysfs-path/meson.build
new file mode 100644
index 00000000..5a74af12
--- /dev/null
+++ b/utils/v4l2-sysfs-path/meson.build
@@ -0,0 +1,14 @@
+v4l2_sysfs_path_sources = files(
+    'v4l2-sysfs-path.c',
+)
+
+v4l2_sysfs_path_deps = [
+    dep_argp,
+    dep_libmedia_dev,
+]
+
+v4l2_sysfs_path = executable('v4l2-sysfs-path',
+                             v4l2_sysfs_path_sources,
+                             install : true,
+                             dependencies : v4l2_sysfs_path_deps,
+                             include_directories : v4l2_utils_incdir)
diff --git a/v4l-utils-po/meson.build b/v4l-utils-po/meson.build
new file mode 100644
index 00000000..4fad42eb
--- /dev/null
+++ b/v4l-utils-po/meson.build
@@ -0,0 +1,3 @@
+i18n.gettext('v4l-utils',
+    args : i18n_gettext_arguments,
+)
-- 
2.30.2

