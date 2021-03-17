Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6EB333F6AE
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 18:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231895AbhCQRX2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 13:23:28 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58380 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231648AbhCQRXH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 13:23:07 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: adalessandro)
        with ESMTPSA id 3CC331F453F2
From:   Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        gjasny@googlemail.com, xavier.claessens@collabora.com,
        nicolas.dufresne@collabora.com, user.vdr@gmail.com,
        sakari.ailus@iki.fi, ariel.dalessandro@collabora.com
Subject: [v4l-utils v4 5/5] Makefile.am: Distribute meson related files
Date:   Wed, 17 Mar 2021 14:22:27 -0300
Message-Id: <20210317172227.620584-6-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317172227.620584-1-ariel.dalessandro@collabora.com>
References: <20210317172227.620584-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Several files have been introduced by meson support. Add these files to
be distributed by autotools.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 Makefile.am                              | 5 ++++-
 contrib/Makefile.am                      | 3 ++-
 contrib/cobalt-ctl/Makefile.am           | 2 ++
 contrib/decode_tm6000/Makefile.am        | 2 ++
 contrib/gconv/Makefile.am                | 2 +-
 contrib/rds-saa6588/Makefile.am          | 2 ++
 contrib/test/Makefile.am                 | 3 ++-
 contrib/xc3028-firmware/Makefile.am      | 2 +-
 lib/Makefile.am                          | 2 +-
 lib/libdvbv5/Makefile.am                 | 2 +-
 lib/libv4l-mplane/Makefile.am            | 2 ++
 lib/libv4l1/Makefile.am                  | 2 +-
 lib/libv4l2/Makefile.am                  | 2 +-
 lib/libv4l2rds/Makefile.am               | 2 ++
 lib/libv4lconvert/Makefile.am            | 2 +-
 utils/Makefile.am                        | 2 +-
 utils/cec-compliance/Makefile.am         | 2 +-
 utils/cec-ctl/Makefile.am                | 2 +-
 utils/cec-follower/Makefile.am           | 2 +-
 utils/cx18-ctl/Makefile.am               | 2 ++
 utils/dvb/Makefile.am                    | 2 +-
 utils/ir-ctl/Makefile.am                 | 2 ++
 utils/ivtv-ctl/Makefile.am               | 2 ++
 utils/keytable/Makefile.am               | 3 ++-
 utils/keytable/bpf_protocols/Makefile.am | 3 ++-
 utils/libcecutil/Makefile.am             | 2 +-
 utils/libmedia_dev/Makefile.am           | 2 +-
 utils/libv4l2util/Makefile.am            | 2 +-
 utils/media-ctl/Makefile.am              | 2 ++
 utils/qv4l2/Makefile.am                  | 3 ++-
 utils/qvidcap/Makefile.am                | 3 ++-
 utils/rds-ctl/Makefile.am                | 1 +
 utils/v4l2-compliance/Makefile.am        | 2 +-
 utils/v4l2-ctl/Makefile.am               | 2 +-
 utils/v4l2-dbg/Makefile.am               | 2 +-
 utils/v4l2-sysfs-path/Makefile.am        | 2 ++
 36 files changed, 55 insertions(+), 25 deletions(-)

diff --git a/Makefile.am b/Makefile.am
index 7fb443ab..4b4bac09 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -11,6 +11,9 @@ endif
 EXTRA_DIST = android-config.h sync-with-kernel.sh bootstrap.sh \
 	doxygen_libdvbv5.cfg include COPYING.libv4l \
 	COPYING.libdvbv5 README.libv4l README.lib-multi-threading \
-	TODO.libdvbv5 doc/libdvbv5-index.doc
+	TODO.libdvbv5 doc/libdvbv5-index.doc \
+	doc/Doxyfile.in doc/meson.build \
+	meson.build meson_options.txt \
+	libdvbv5-po/meson.build v4l-utils-po/meson.build
 
 include $(top_srcdir)/aminclude.am
diff --git a/contrib/Makefile.am b/contrib/Makefile.am
index b418b518..1d7299d0 100644
--- a/contrib/Makefile.am
+++ b/contrib/Makefile.am
@@ -22,4 +22,5 @@ EXTRA_DIST = \
 	parsers \
 	pci_traffic \
 	v4l_rec.pl \
-	lircd2toml.py
+	lircd2toml.py \
+	meson.build
diff --git a/contrib/cobalt-ctl/Makefile.am b/contrib/cobalt-ctl/Makefile.am
index 2cc69000..168873e4 100644
--- a/contrib/cobalt-ctl/Makefile.am
+++ b/contrib/cobalt-ctl/Makefile.am
@@ -1,3 +1,5 @@
 bin_PROGRAMS = cobalt-ctl
 
 cobalt_ctl_SOURCES = cobalt-ctl.c s-record.c
+
+EXTRA_DIST = meson.build
diff --git a/contrib/decode_tm6000/Makefile.am b/contrib/decode_tm6000/Makefile.am
index 863933cc..e9bb5fef 100644
--- a/contrib/decode_tm6000/Makefile.am
+++ b/contrib/decode_tm6000/Makefile.am
@@ -2,3 +2,5 @@ bin_PROGRAMS = decode_tm6000
 decode_tm6000_SOURCES = decode_tm6000.c
 decode_tm6000_LDADD = ../../utils/libv4l2util/libv4l2util.la
 decode_tm6000_LDFLAGS = $(ARGP_LIBS)
+
+EXTRA_DIST = meson.build
diff --git a/contrib/gconv/Makefile.am b/contrib/gconv/Makefile.am
index 68b5bd5f..9c822b8b 100644
--- a/contrib/gconv/Makefile.am
+++ b/contrib/gconv/Makefile.am
@@ -14,4 +14,4 @@ ARIB_STD_B24_la_LDFLAGS = $(gconv_ldflags) -L@gconvsysdir@ -R@gconvsysdir@ -lJIS
 EN300_468_TAB00_la_SOURCES = en300-468-tab00.c
 EN300_468_TAB00_la_LDFLAGS = $(gconv_ldflags)
 
-EXTRA_DIST = $(gconv_base_sources) $(gconv_DATA) gconv.map
+EXTRA_DIST = $(gconv_base_sources) $(gconv_DATA) gconv.map meson.build
diff --git a/contrib/rds-saa6588/Makefile.am b/contrib/rds-saa6588/Makefile.am
index a551d9fb..8bda60a2 100644
--- a/contrib/rds-saa6588/Makefile.am
+++ b/contrib/rds-saa6588/Makefile.am
@@ -1,3 +1,5 @@
 noinst_PROGRAMS = rds-saa6588
 
 rds_saa6588_SOURCES = rds-saa6588.c
+
+EXTRA_DIST = meson.build
diff --git a/contrib/test/Makefile.am b/contrib/test/Makefile.am
index 5771ee4d..56203fb3 100644
--- a/contrib/test/Makefile.am
+++ b/contrib/test/Makefile.am
@@ -62,4 +62,5 @@ EXTRA_DIST = \
 	test-media \
 	test-media-unload.pl \
 	vim2m_test_with_gstreamer.sh \
-	vim2m_test_with_qvidcap.sh
+	vim2m_test_with_qvidcap.sh \
+	meson.build
diff --git a/contrib/xc3028-firmware/Makefile.am b/contrib/xc3028-firmware/Makefile.am
index 8b23d1e1..0ea17885 100644
--- a/contrib/xc3028-firmware/Makefile.am
+++ b/contrib/xc3028-firmware/Makefile.am
@@ -2,4 +2,4 @@ noinst_PROGRAMS = firmware-tool
 
 firmware_tool_SOURCES = firmware-tool.c standards.c extract_head.h standards.h tuner-xc2028-types.h
 
-EXTRA_DIST = README
+EXTRA_DIST = README meson.build
diff --git a/lib/Makefile.am b/lib/Makefile.am
index a105c95a..8fc99339 100644
--- a/lib/Makefile.am
+++ b/lib/Makefile.am
@@ -10,4 +10,4 @@ SUBDIRS += \
 	libdvbv5
 endif
 
-EXTRA_DIST = Android.mk
+EXTRA_DIST = Android.mk meson.build
diff --git a/lib/libdvbv5/Makefile.am b/lib/libdvbv5/Makefile.am
index 683ae3fb..3b5a28db 100644
--- a/lib/libdvbv5/Makefile.am
+++ b/lib/libdvbv5/Makefile.am
@@ -123,4 +123,4 @@ libdvbv5_la_CPPFLAGS = -I../.. $(ENFORCE_LIBDVBV5_STATIC) $(LIBUDEV_CFLAGS) $(PT
 libdvbv5_la_LDFLAGS = $(LIBDVBV5_VERSION) $(ENFORCE_LIBDVBV5_STATIC) $(LIBUDEV_LIBS) -lm -lrt
 libdvbv5_la_LIBADD = $(LTLIBICONV)
 
-EXTRA_DIST = README gen_dvb_structs.pl
+EXTRA_DIST = README gen_dvb_structs.pl meson.build
diff --git a/lib/libv4l-mplane/Makefile.am b/lib/libv4l-mplane/Makefile.am
index 5264ecf2..fb858e54 100644
--- a/lib/libv4l-mplane/Makefile.am
+++ b/lib/libv4l-mplane/Makefile.am
@@ -5,3 +5,5 @@ endif
 libv4l_mplane_la_SOURCES = libv4l-mplane.c
 libv4l_mplane_la_CPPFLAGS = $(CFLAG_VISIBILITY)
 libv4l_mplane_la_LDFLAGS = -avoid-version -module -shared -export-dynamic -lpthread
+
+EXTRA_DIST = meson.build
diff --git a/lib/libv4l1/Makefile.am b/lib/libv4l1/Makefile.am
index 42cb3dbb..a9e60fb4 100644
--- a/lib/libv4l1/Makefile.am
+++ b/lib/libv4l1/Makefile.am
@@ -26,4 +26,4 @@ v4l1compat_la_LIBADD = libv4l1.la
 v4l1compat_la_LDFLAGS = -avoid-version -module -shared -export-dynamic
 v4l1compat_la_LIBTOOLFLAGS = --tag=disable-static
 
-EXTRA_DIST = libv4l1-kernelcode-license.txt
+EXTRA_DIST = libv4l1-kernelcode-license.txt meson.build
diff --git a/lib/libv4l2/Makefile.am b/lib/libv4l2/Makefile.am
index 3a1bb901..0b473782 100644
--- a/lib/libv4l2/Makefile.am
+++ b/lib/libv4l2/Makefile.am
@@ -29,4 +29,4 @@ v4l2convert_la_LIBADD = libv4l2.la
 v4l2convert_la_LDFLAGS = -avoid-version -module -shared -export-dynamic
 v4l2convert_la_LIBTOOLFLAGS = --tag=disable-static
 
-EXTRA_DIST = Android.mk v4l2-plugin-android.c
+EXTRA_DIST = Android.mk v4l2-plugin-android.c meson.build
diff --git a/lib/libv4l2rds/Makefile.am b/lib/libv4l2rds/Makefile.am
index 73fdd3e2..3ee535f0 100644
--- a/lib/libv4l2rds/Makefile.am
+++ b/lib/libv4l2rds/Makefile.am
@@ -10,3 +10,5 @@ endif
 libv4l2rds_la_SOURCES = libv4l2rds.c
 libv4l2rds_la_CPPFLAGS = $(CFLAG_VISIBILITY) $(ENFORCE_LIBV4L_STATIC)
 libv4l2rds_la_LDFLAGS = $(LIBV4L2RDS_VERSION) -lpthread $(ENFORCE_LIBV4L_STATIC)
+
+EXTRA_DIST = meson.build
diff --git a/lib/libv4lconvert/Makefile.am b/lib/libv4lconvert/Makefile.am
index f266f3e7..e769d2fd 100644
--- a/lib/libv4lconvert/Makefile.am
+++ b/lib/libv4lconvert/Makefile.am
@@ -33,4 +33,4 @@ ov511_decomp_SOURCES = ov511-decomp.c
 
 ov518_decomp_SOURCES = ov518-decomp.c
 
-EXTRA_DIST = Android.mk
+EXTRA_DIST = Android.mk meson.build
diff --git a/utils/Makefile.am b/utils/Makefile.am
index 0e68a612..5dc55671 100644
--- a/utils/Makefile.am
+++ b/utils/Makefile.am
@@ -33,4 +33,4 @@ if WITH_QVIDCAP
 SUBDIRS += qvidcap
 endif
 
-EXTRA_DIST = common
+EXTRA_DIST = common meson.build gen_media_bus_format_codes.sh gen_media_bus_format_names.sh
diff --git a/utils/cec-compliance/Makefile.am b/utils/cec-compliance/Makefile.am
index 93c1b568..8f0a50e5 100644
--- a/utils/cec-compliance/Makefile.am
+++ b/utils/cec-compliance/Makefile.am
@@ -5,4 +5,4 @@ cec_compliance_SOURCES = cec-compliance.cpp cec-compliance.h cec-test.cpp cec-te
 cec_compliance_CPPFLAGS = -I$(top_srcdir)/utils/libcecutil $(GIT_SHA) $(GIT_COMMIT_CNT) $(GIT_COMMIT_DATE)
 cec_compliance_LDADD = -lrt ../libcecutil/libcecutil.la
 
-EXTRA_DIST = cec-compliance.1
+EXTRA_DIST = cec-compliance.1 meson.build
diff --git a/utils/cec-ctl/Makefile.am b/utils/cec-ctl/Makefile.am
index 27e69494..e42046a4 100644
--- a/utils/cec-ctl/Makefile.am
+++ b/utils/cec-ctl/Makefile.am
@@ -5,4 +5,4 @@ cec_ctl_SOURCES = cec-ctl.cpp cec-pin.cpp cec-ctl.h
 cec_ctl_CPPFLAGS = -I$(top_srcdir)/utils/libcecutil $(GIT_SHA) $(GIT_COMMIT_CNT) $(GIT_COMMIT_DATE)
 cec_ctl_LDADD = -lrt -lpthread ../libcecutil/libcecutil.la
 
-EXTRA_DIST = cec-ctl.1
+EXTRA_DIST = cec-ctl.1 meson.build
diff --git a/utils/cec-follower/Makefile.am b/utils/cec-follower/Makefile.am
index 903d3715..e0df03c4 100644
--- a/utils/cec-follower/Makefile.am
+++ b/utils/cec-follower/Makefile.am
@@ -5,4 +5,4 @@ cec_follower_SOURCES = cec-follower.cpp cec-follower.h cec-processing.cpp cec-tu
 cec_follower_CPPFLAGS = -I$(top_srcdir)/utils/libcecutil $(GIT_SHA) $(GIT_COMMIT_CNT) $(GIT_COMMIT_DATE)
 cec_follower_LDADD = -lrt ../libcecutil/libcecutil.la
 
-EXTRA_DIST = cec-follower.1
+EXTRA_DIST = cec-follower.1 meson.build
diff --git a/utils/cx18-ctl/Makefile.am b/utils/cx18-ctl/Makefile.am
index 94fce36d..4d2a159a 100644
--- a/utils/cx18-ctl/Makefile.am
+++ b/utils/cx18-ctl/Makefile.am
@@ -1,3 +1,5 @@
 bin_PROGRAMS = cx18-ctl
 
 cx18_ctl_SOURCES = cx18-ctl.c
+
+EXTRA_DIST = meson.build
diff --git a/utils/dvb/Makefile.am b/utils/dvb/Makefile.am
index 1895018a..5f99e7be 100644
--- a/utils/dvb/Makefile.am
+++ b/utils/dvb/Makefile.am
@@ -32,4 +32,4 @@ dvbv5_daemon_LDADD = ../../lib/libdvbv5/libdvbv5.la @LIBINTL@ $(LIBUDEV_LIBS) $(
 dvbv5_daemon_LDFLAGS = $(ARGP_LIBS) -lm $(XMLRPC_LDFLAGS) $(PTHREAD_LDFLAGS)
 dvbv5_daemon_CFLAGS =  $(XMLRPC_CFLAGS) $(LIBUDEV_CFLAGS) $(PTHREAD_CFLAGS)
 
-EXTRA_DIST = README
+EXTRA_DIST = README meson.build
diff --git a/utils/ir-ctl/Makefile.am b/utils/ir-ctl/Makefile.am
index ad90b84e..0e3c178a 100644
--- a/utils/ir-ctl/Makefile.am
+++ b/utils/ir-ctl/Makefile.am
@@ -4,3 +4,5 @@ man_MANS = ir-ctl.1
 ir_ctl_SOURCES = ir-ctl.c ir-encode.c ir-encode.h toml.c toml.h keymap.c keymap.h bpf_encoder.c bpf_encoder.h
 ir_ctl_LDADD = @LIBINTL@
 ir_ctl_LDFLAGS = $(ARGP_LIBS)
+
+EXTRA_DIST = meson.build
diff --git a/utils/ivtv-ctl/Makefile.am b/utils/ivtv-ctl/Makefile.am
index c1196673..a8ddc9d2 100644
--- a/utils/ivtv-ctl/Makefile.am
+++ b/utils/ivtv-ctl/Makefile.am
@@ -2,3 +2,5 @@ bin_PROGRAMS = ivtv-ctl
 
 ivtv_ctl_SOURCES = ivtv-ctl.c
 ivtv_ctl_LDFLAGS = -lm
+
+EXTRA_DIST = meson.build
diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
index c5eb414a..4449f2c1 100644
--- a/utils/keytable/Makefile.am
+++ b/utils/keytable/Makefile.am
@@ -22,7 +22,8 @@ ir_keytable_CFLAGS = $(LIBBPF_CFLAGS)
 SUBDIRS = bpf_protocols
 endif
 
-EXTRA_DIST = 70-infrared.rules 50-rc_keymap.conf rc_keymaps rc_keymaps_userspace gen_input_events.pl gen_keytables.pl ir-keytable.1 rc_maps.cfg rc_keymap.5
+EXTRA_DIST = 70-infrared.rules 50-rc_keymap.conf rc_keymaps rc_keymaps_userspace gen_input_events.pl gen_keytables.pl ir-keytable.1 rc_maps.cfg rc_keymap.5 \
+	     meson.build
 
 check:
 	@$(foreach keymap,$(wildcard $(keytablesystem_DATA)),./ir-keytable --test-keymap=$(keymap);)
diff --git a/utils/keytable/bpf_protocols/Makefile.am b/utils/keytable/bpf_protocols/Makefile.am
index 13be2794..727b9d2a 100644
--- a/utils/keytable/bpf_protocols/Makefile.am
+++ b/utils/keytable/bpf_protocols/Makefile.am
@@ -15,7 +15,8 @@ PROTOCOLS = grundig.o pulse_distance.o pulse_length.o rc_mm.o manchester.o xbox-
 all: $(PROTOCOLS)
 
 CLEANFILES = $(PROTOCOLS)
-EXTRA_DIST = $(PROTOCOLS:%.o=%.c) bitmap.h bpf_helpers.h
+EXTRA_DIST = $(PROTOCOLS:%.o=%.c) bitmap.h bpf_helpers.h clang_sys_includes.sh \
+	meson.build user_dir_protocols/README.md
 
 # custom target
 install-data-local:
diff --git a/utils/libcecutil/Makefile.am b/utils/libcecutil/Makefile.am
index d2c7ddcc..03635e57 100644
--- a/utils/libcecutil/Makefile.am
+++ b/utils/libcecutil/Makefile.am
@@ -21,4 +21,4 @@ gen.intermediate: cec-gen.pl $(CEC_GEN_PREREQS)
 clean-local:
 	-rm -vf $(CEC_GEN_HDRS)
 
-EXTRA_DIST = cec-gen.pl
+EXTRA_DIST = cec-gen.pl meson.build
diff --git a/utils/libmedia_dev/Makefile.am b/utils/libmedia_dev/Makefile.am
index 3796efbd..f4e4a3f4 100644
--- a/utils/libmedia_dev/Makefile.am
+++ b/utils/libmedia_dev/Makefile.am
@@ -4,4 +4,4 @@ libmedia_dev_la_SOURCES = get_media_devices.c get_media_devices.h
 libmedia_dev_la_CPPFLAGS = -static
 libmedia_dev_la_LDFLAGS = -static
 
-EXTRA_DIST = README
+EXTRA_DIST = README meson.build
diff --git a/utils/libv4l2util/Makefile.am b/utils/libv4l2util/Makefile.am
index eb11017a..fb25c3b6 100644
--- a/utils/libv4l2util/Makefile.am
+++ b/utils/libv4l2util/Makefile.am
@@ -4,4 +4,4 @@ libv4l2util_la_SOURCES = frequencies.c v4l2_driver.c v4l2_driver.h libv4l2util.h
 libv4l2util_la_CPPFLAGS = -static
 libv4l2util_la_LDFLAGS = -static
 
-EXTRA_DIST = TODO
+EXTRA_DIST = TODO meson.build
diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
index c48c8d62..075274d6 100644
--- a/utils/media-ctl/Makefile.am
+++ b/utils/media-ctl/Makefile.am
@@ -28,3 +28,5 @@ bin_PROGRAMS = media-ctl
 media_ctl_SOURCES = media-ctl.c options.c options.h tools.h
 media_ctl_LDADD = libmediactl.la libv4l2subdev.la
 media_ctl_CFLAGS = $(GIT_COMMIT_CNT)
+
+EXTRA_DIST = meson.build
diff --git a/utils/qv4l2/Makefile.am b/utils/qv4l2/Makefile.am
index bef699c0..977ae243 100644
--- a/utils/qv4l2/Makefile.am
+++ b/utils/qv4l2/Makefile.am
@@ -23,7 +23,8 @@ qv4l2_LDFLAGS += $(ALSA_LIBS) -pthread
 
 EXTRA_DIST = enterbutt.png exit.png fileopen.png qv4l2_24x24.png qv4l2_64x64.png qv4l2.png qv4l2.svg \
   snapshot.png video-television.png fileclose.png qv4l2_16x16.png qv4l2_32x32.png qv4l2.desktop \
-  qv4l2.qrc saveraw.png qv4l2.pro qv4l2.1 fullscreenexit.png fullscreen.png start.png step.png
+  qv4l2.qrc saveraw.png qv4l2.pro qv4l2.1 fullscreenexit.png fullscreen.png start.png step.png \
+  meson.build
 
 clean-local:
 	-rm -vf moc_*.cpp qrc_*.cpp qrc_*.o ui_*.h
diff --git a/utils/qvidcap/Makefile.am b/utils/qvidcap/Makefile.am
index 9e873ca1..c8e0c570 100644
--- a/utils/qvidcap/Makefile.am
+++ b/utils/qvidcap/Makefile.am
@@ -16,7 +16,8 @@ qvidcap_LDFLAGS += $(ALSA_LIBS) -pthread
 
 EXTRA_DIST = qvidcap_24x24.png qvidcap_64x64.png qvidcap.png qvidcap.svg \
   qvidcap_16x16.png qvidcap_32x32.png qvidcap.desktop \
-  qvidcap.qrc qvidcap.pro qvidcap.1 v4l2-convert.glsl v4l2-convert.pl
+  qvidcap.qrc qvidcap.pro qvidcap.1 v4l2-convert.glsl v4l2-convert.pl \
+  meson.build
 
 clean-local:
 	-rm -vf moc_*.cpp qrc_*.cpp qrc_*.o ui_*.h v4l2-convert.h formats.h
diff --git a/utils/rds-ctl/Makefile.am b/utils/rds-ctl/Makefile.am
index 1afdf808..f9685f48 100644
--- a/utils/rds-ctl/Makefile.am
+++ b/utils/rds-ctl/Makefile.am
@@ -3,3 +3,4 @@ bin_PROGRAMS = rds-ctl
 rds_ctl_SOURCES = rds-ctl.cpp
 rds_ctl_LDADD = ../../lib/libv4l2rds/libv4l2rds.la
 
+EXTRA_DIST = meson.build
diff --git a/utils/v4l2-compliance/Makefile.am b/utils/v4l2-compliance/Makefile.am
index 6baf1f5c..1172433d 100644
--- a/utils/v4l2-compliance/Makefile.am
+++ b/utils/v4l2-compliance/Makefile.am
@@ -23,7 +23,7 @@ v4l2_compliance_LDADD = -lrt -lpthread
 DEFS += -DNO_LIBV4L2
 endif
 
-EXTRA_DIST = Android.mk fixme.txt v4l2-compliance.1
+EXTRA_DIST = Android.mk fixme.txt v4l2-compliance.1 meson.build
 
 nodist_v4l2_compliance_32_SOURCES = v4l2-compliance-32.c
 
diff --git a/utils/v4l2-ctl/Makefile.am b/utils/v4l2-ctl/Makefile.am
index 55d234cf..ad8a5a6d 100644
--- a/utils/v4l2-ctl/Makefile.am
+++ b/utils/v4l2-ctl/Makefile.am
@@ -41,4 +41,4 @@ v4l2-ctl-32$(EXEEXT): $(addprefix $(top_srcdir)/utils/v4l2-ctl/,$(v4l2_ctl_SOURC
 	$(CXXCOMPILE) -static -m32 -DNO_LIBV4L2 -o $@ -I$(top_srcdir) -I$(top_srcdir)/include $(v4l2_ctl_CPPFLAGS) $(addprefix $(top_srcdir)/utils/v4l2-ctl/,$(filter %.cpp,$(v4l2_ctl_SOURCES))) $@.o
 	rm -f $@.c $@.o
 
-EXTRA_DIST = Android.mk v4l2-ctl.1
+EXTRA_DIST = Android.mk v4l2-ctl.1 meson.build
diff --git a/utils/v4l2-dbg/Makefile.am b/utils/v4l2-dbg/Makefile.am
index 94a5fb53..0b3dcfaa 100644
--- a/utils/v4l2-dbg/Makefile.am
+++ b/utils/v4l2-dbg/Makefile.am
@@ -1,4 +1,4 @@
 sbin_PROGRAMS = v4l2-dbg
 v4l2_dbg_SOURCES = v4l2-dbg.cpp v4l2-dbg-ac97.h  v4l2-dbg-bttv.h  v4l2-dbg-em28xx.h  v4l2-dbg.h  v4l2-dbg-micron.h  v4l2-dbg-saa7134.h	v4l2-dbg-tvp5150.h
 
-EXTRA_DIST = Android.mk
+EXTRA_DIST = Android.mk meson.build
diff --git a/utils/v4l2-sysfs-path/Makefile.am b/utils/v4l2-sysfs-path/Makefile.am
index 6ef4228e..4ab84dd9 100644
--- a/utils/v4l2-sysfs-path/Makefile.am
+++ b/utils/v4l2-sysfs-path/Makefile.am
@@ -2,3 +2,5 @@ bin_PROGRAMS = v4l2-sysfs-path
 v4l2_sysfs_path_SOURCES = v4l2-sysfs-path.c
 v4l2_sysfs_path_LDADD = ../libmedia_dev/libmedia_dev.la
 v4l2_sysfs_path_LDFLAGS = $(ARGP_LIBS)
+
+EXTRA_DIST = meson.build
-- 
2.30.2

