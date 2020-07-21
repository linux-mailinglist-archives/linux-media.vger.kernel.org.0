Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3278F228363
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 17:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729987AbgGUPPl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 11:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728089AbgGUPPk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 11:15:40 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A93A1C061794
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 08:15:39 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id 11so10164423qkn.2
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 08:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uwOb4CeJouOoKWwZje8QdMOYJf1Nfh3kOWlJdaij7W0=;
        b=ZlncMqrFYEzFd9uRPktTb3wvzLkvoq9DsjlrelqA9kvyo4yzr8wnfxZuspijC/nmeR
         878g7nvWz5bsy2mCwDPLihilBzpjf5+QSmtrILnk5fiPXJUgpcq72fLn9tfopS1fP+cM
         5Qc3ENkOCh20yCE12drcdf4roXnWvalHQE3DjYy5nZUehL18Ercvu5jx49ezdfBPbqSi
         ml6DYW4I7JpMamFi6ICfJ7t3Bl43OHJ802XeVe/Kvvi2RZaT9jgipnH/DO5fei8/PevS
         7s9kjCc4ItASf/XNyTD41x+b6E8H6fqdEAJjK3aP1jHLMiEBAJ97MPcN33v5sxwPBR6m
         YyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uwOb4CeJouOoKWwZje8QdMOYJf1Nfh3kOWlJdaij7W0=;
        b=AnOR2NkDeE9/36vyNqf+9Yy/Pc2EdLvz9ifG5HFXq0uICWyAo0hm1xrbZGN4EOJUHF
         MpBkaXK+6zuY1vDQ0Mu4IbAwrqp8Hpj4qL5NNMNafR5nZO54GF2kbcgXXjQla6jA1T8H
         //qbYwkiTq7HStnGrvdFhQuwjCN5f1FsheIsEJRoQY/hn8hoemgx5eNzFJzvtNez3TJV
         kBk5bWxQedrOb+aVcKSslem8bg6X8S6oaGgNMNjdCrB7G8uLJugmy6ZetwVyaXfhCjfm
         ApvrkLVTIejec0zB3D/68hzZilgHSagQEIw4dmlrZcHEkqOA8BJpBs/UN9kn5lmRhEuZ
         dhYA==
X-Gm-Message-State: AOAM531kQebUBqpge+mfUG4zDt8H9xWQR9jMBE6OK5y0iH0UOuvPLipi
        S7vYFut1UzXIZbIprlMB4t6UFJ7XvL4LBQ==
X-Google-Smtp-Source: ABdhPJxj5nhr2Mb1LaGkza3syyy8csKQPhJMRQTc4xHK9wy+tzmocpUtuq92Fite3dba9oFrfaYQoA==
X-Received: by 2002:a05:620a:137c:: with SMTP id d28mr21099222qkl.419.1595344534361;
        Tue, 21 Jul 2020 08:15:34 -0700 (PDT)
Received: from ariel-arch.fibertel.com.ar (201-212-81-161.cab.prima.net.ar. [201.212.81.161])
        by smtp.gmail.com with ESMTPSA id o5sm23310441qtb.26.2020.07.21.08.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 08:15:32 -0700 (PDT)
From:   Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, sean@mess.org, p.zabel@pengutronix.de,
        laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        ariel@vanguardiasur.com.ar, gjasny@googlemail.com,
        xavier.claessens@collabora.com, nicolas.dufresne@collabora.com,
        user.vdr@gmail.com
Subject: [PATCH v2 1/1] Add support for meson building
Date:   Tue, 21 Jul 2020 12:14:34 -0300
Message-Id: <20200721151434.115651-2-ariel@vanguardiasur.com.ar>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200721151434.115651-1-ariel@vanguardiasur.com.ar>
References: <20200721151434.115651-1-ariel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Supports building libraries and tools found in contrib/, lib/ and
utils/ directories, along with the implemented gettext translations.

Also supports generating plain HTML documentation and manual pages using
Doxygen.

Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Acked-by: Gregor Jasny <gjasny@googlemail.com>
[Gregor: Control symbol visibility]
Signed-off-by: Gregor Jasny <gjasny@googlemail.com>
Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
---
 .gitignore                                    |    1 +
 Makefile.am                                   |    3 +-
 contrib/Makefile.am                           |    3 +-
 contrib/cobalt-ctl/Makefile.am                |    2 +
 contrib/cobalt-ctl/meson.build                |    8 +
 contrib/decode_tm6000/Makefile.am             |    2 +
 contrib/decode_tm6000/meson.build             |   14 +
 contrib/gconv/Makefile.am                     |    2 +-
 contrib/gconv/meson.build                     |   44 +
 contrib/meson.build                           |   13 +
 contrib/rds-saa6588/Makefile.am               |    2 +
 contrib/rds-saa6588/meson.build               |    7 +
 contrib/test/Makefile.am                      |    3 +-
 contrib/test/meson.build                      |  143 +
 contrib/xc3028-firmware/Makefile.am           |    2 +-
 contrib/xc3028-firmware/meson.build           |   11 +
 doc/Doxyfile.in                               | 2351 +++++++++++++++++
 doc/meson.build                               |   34 +
 gen-version.sh                                |   36 +
 lib/Makefile.am                               |    2 +-
 lib/libdvbv5/Makefile.am                      |    2 +-
 lib/libdvbv5/meson.build                      |  154 ++
 lib/libv4l-mplane/Makefile.am                 |    2 +
 lib/libv4l-mplane/meson.build                 |   23 +
 lib/libv4l1/Makefile.am                       |    2 +-
 lib/libv4l1/meson.build                       |   61 +
 lib/libv4l2/Makefile.am                       |    2 +-
 lib/libv4l2/meson.build                       |   70 +
 lib/libv4l2rds/Makefile.am                    |    2 +
 lib/libv4l2rds/meson.build                    |   36 +
 lib/libv4lconvert/Makefile.am                 |    2 +-
 lib/libv4lconvert/meson.build                 |  113 +
 lib/meson.build                               |   11 +
 libdvbv5-po/meson.build                       |    3 +
 meson.build                                   |  263 ++
 meson_options.txt                             |   50 +
 utils/Makefile.am                             |    2 +-
 utils/cec-compliance/Makefile.am              |    2 +-
 utils/cec-compliance/meson.build              |   24 +
 utils/cec-ctl/Makefile.am                     |    2 +-
 utils/cec-ctl/meson.build                     |   18 +
 utils/cec-follower/Makefile.am                |    2 +-
 utils/cec-follower/meson.build                |   21 +
 utils/cx18-ctl/Makefile.am                    |    2 +
 utils/cx18-ctl/meson.build                    |    8 +
 utils/dvb/Makefile.am                         |    2 +-
 utils/dvb/meson.build                         |   70 +
 utils/gen_media_bus_format_codes.sh           |    7 +
 utils/gen_media_bus_format_names.sh           |    7 +
 utils/ir-ctl/Makefile.am                      |    2 +
 utils/ir-ctl/meson.build                      |   23 +
 utils/ivtv-ctl/Makefile.am                    |    2 +
 utils/ivtv-ctl/meson.build                    |   13 +
 utils/keytable/Makefile.am                    |    3 +-
 utils/keytable/bpf_protocols/Makefile.am      |    3 +-
 .../bpf_protocols/clang_sys_includes.sh       |    9 +
 utils/keytable/bpf_protocols/meson.build      |   39 +
 .../user_dir_protocols/README.md              |    1 +
 utils/keytable/meson.build                    |   74 +
 utils/keytable/rc_keymaps/meson.build         |  147 ++
 utils/libcecutil/Makefile.am                  |    2 +-
 utils/libcecutil/meson.build                  |   45 +
 utils/libmedia_dev/Makefile.am                |    2 +-
 utils/libmedia_dev/meson.build                |   14 +
 utils/libv4l2util/Makefile.am                 |    2 +-
 utils/libv4l2util/meson.build                 |   16 +
 utils/media-ctl/Makefile.am                   |    2 +
 utils/media-ctl/meson.build                   |   43 +
 utils/meson.build                             |   46 +
 utils/qv4l2/Makefile.am                       |    3 +-
 utils/qv4l2/meson.build                       |   80 +
 utils/qvidcap/Makefile.am                     |    3 +-
 utils/qvidcap/meson.build                     |   82 +
 utils/rds-ctl/Makefile.am                     |    1 +
 utils/rds-ctl/meson.build                     |   13 +
 utils/v4l2-compliance/Makefile.am             |    2 +-
 utils/v4l2-compliance/meson.build             |   60 +
 utils/v4l2-ctl/Makefile.am                    |    2 +-
 utils/v4l2-ctl/meson.build                    |   75 +
 utils/v4l2-dbg/Makefile.am                    |    2 +-
 utils/v4l2-dbg/meson.build                    |   16 +
 utils/v4l2-sysfs-path/Makefile.am             |    2 +
 utils/v4l2-sysfs-path/meson.build             |   14 +
 v4l-utils-po/meson.build                      |    3 +
 version.h.in                                  |    1 +
 85 files changed, 4468 insertions(+), 25 deletions(-)
 create mode 100644 contrib/cobalt-ctl/meson.build
 create mode 100644 contrib/decode_tm6000/meson.build
 create mode 100644 contrib/gconv/meson.build
 create mode 100644 contrib/meson.build
 create mode 100644 contrib/rds-saa6588/meson.build
 create mode 100644 contrib/test/meson.build
 create mode 100644 contrib/xc3028-firmware/meson.build
 create mode 100644 doc/Doxyfile.in
 create mode 100644 doc/meson.build
 create mode 100755 gen-version.sh
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
 create mode 100644 version.h.in

diff --git a/.gitignore b/.gitignore
index f899ecfc..7c900fe5 100644
--- a/.gitignore
+++ b/.gitignore
@@ -61,3 +61,4 @@ v4l-utils-po/en@quot.header
 v4l-utils-po/insert-header.sin
 v4l-utils-po/quot.sed
 v4l-utils-po/remove-potcdate.sin
+build/
diff --git a/Makefile.am b/Makefile.am
index 3c3d3ce6..6f8367a7 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -9,7 +9,8 @@ endif
 
 EXTRA_DIST = android-config.h bootstrap.sh doxygen_libdvbv5.cfg include COPYING.libv4l \
         COPYING.libdvbv5 README.libv4l README.lib-multi-threading TODO.libdvbv5 \
-        doc/libdvbv5-index.doc
+        doc meson.build meson_options.txt gen-version.sh version.h.in \
+        libdvbv5-po/meson.build v4l-utils-po/meson.build
 
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
diff --git a/contrib/gconv/Makefile.am b/contrib/gconv/Makefile.am
index 68b5bd5f..9c822b8b 100644
--- a/contrib/gconv/Makefile.am
+++ b/contrib/gconv/Makefile.am
@@ -14,4 +14,4 @@ ARIB_STD_B24_la_LDFLAGS = $(gconv_ldflags) -L@gconvsysdir@ -R@gconvsysdir@ -lJIS
 EN300_468_TAB00_la_SOURCES = en300-468-tab00.c
 EN300_468_TAB00_la_LDFLAGS = $(gconv_ldflags)
 
-EXTRA_DIST = $(gconv_base_sources) $(gconv_DATA) gconv.map
+EXTRA_DIST = $(gconv_base_sources) $(gconv_DATA) gconv.map meson.build
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
diff --git a/contrib/rds-saa6588/Makefile.am b/contrib/rds-saa6588/Makefile.am
index a551d9fb..8bda60a2 100644
--- a/contrib/rds-saa6588/Makefile.am
+++ b/contrib/rds-saa6588/Makefile.am
@@ -1,3 +1,5 @@
 noinst_PROGRAMS = rds-saa6588
 
 rds_saa6588_SOURCES = rds-saa6588.c
+
+EXTRA_DIST = meson.build
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
diff --git a/contrib/test/Makefile.am b/contrib/test/Makefile.am
index ded3c1f4..6eddfce8 100644
--- a/contrib/test/Makefile.am
+++ b/contrib/test/Makefile.am
@@ -71,4 +71,5 @@ EXTRA_DIST = \
 	test-media \
 	test-media-unload.pl \
 	vim2m_test_with_gstreamer.sh \
-	vim2m_test_with_qvidcap.sh
+	vim2m_test_with_qvidcap.sh \
+	meson.build
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
diff --git a/contrib/xc3028-firmware/Makefile.am b/contrib/xc3028-firmware/Makefile.am
index 43ff8b12..0baf3965 100644
--- a/contrib/xc3028-firmware/Makefile.am
+++ b/contrib/xc3028-firmware/Makefile.am
@@ -2,7 +2,7 @@ noinst_PROGRAMS = firmware-tool
 
 firmware_tool_SOURCES = firmware-tool.c standards.c extract_head.h standards.h tuner-xc2028-types.h
 
-EXTRA_DIST = README
+EXTRA_DIST = README meson.build
 
 # custom targets
 
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
diff --git a/doc/Doxyfile.in b/doc/Doxyfile.in
new file mode 100644
index 00000000..085b76d1
--- /dev/null
+++ b/doc/Doxyfile.in
@@ -0,0 +1,2351 @@
+# Doxyfile 1.8.6
+
+# This file describes the settings to be used by the documentation system
+# doxygen (www.doxygen.org) for a project.
+#
+# All text after a double hash (##) is considered a comment and is placed in
+# front of the TAG it is preceding.
+#
+# All text after a single hash (#) is considered a comment and will be ignored.
+# The format is:
+# TAG = value [value, ...]
+# For lists, items can also be appended using:
+# TAG += value [value, ...]
+# Values that contain spaces should be placed between quotes (\" \").
+
+#---------------------------------------------------------------------------
+# Project related configuration options
+#---------------------------------------------------------------------------
+
+# This tag specifies the encoding used for all characters in the config file
+# that follow. The default is UTF-8 which is also the encoding used for all text
+# before the first occurrence of this tag. Doxygen uses libiconv (or the iconv
+# built into libc) for the transcoding. See http://www.gnu.org/software/libiconv
+# for the list of possible encodings.
+# The default value is: UTF-8.
+
+DOXYFILE_ENCODING      = UTF-8
+
+# The PROJECT_NAME tag is a single word (or a sequence of words surrounded by
+# double-quotes, unless you are using Doxywizard) that should identify the
+# project for which the documentation is generated. This name is used in the
+# title of most generated pages and in a few other places.
+# The default value is: My Project.
+
+PROJECT_NAME           = libdvbv5
+
+# The PROJECT_NUMBER tag can be used to enter a project or revision number. This
+# could be handy for archiving the generated documentation or if some version
+# control system is used.
+
+PROJECT_NUMBER         = @VERSION@
+
+# Using the PROJECT_BRIEF tag one can provide an optional one line description
+# for a project that appears at the top of each page and should give viewer a
+# quick idea about the purpose of the project. Keep the description short.
+
+PROJECT_BRIEF          = "Library to work with Digital TV devices on Linux"
+
+# With the PROJECT_LOGO tag one can specify an logo or icon that is included in
+# the documentation. The maximum height of the logo should not exceed 55 pixels
+# and the maximum width should not exceed 200 pixels. Doxygen will copy the logo
+# to the output directory.
+
+PROJECT_LOGO           =
+
+# The OUTPUT_DIRECTORY tag is used to specify the (relative or absolute) path
+# into which the generated documentation will be written. If a relative path is
+# entered, it will be relative to the location where doxygen was started. If
+# left blank the current directory will be used.
+
+OUTPUT_DIRECTORY       = @DOCDIR@
+
+# If the CREATE_SUBDIRS tag is set to YES, then doxygen will create 4096 sub-
+# directories (in 2 levels) under the output directory of each output format and
+# will distribute the generated files over these directories. Enabling this
+# option can be useful when feeding doxygen a huge amount of source files, where
+# putting all generated files in the same directory would otherwise causes
+# performance problems for the file system.
+# The default value is: NO.
+
+CREATE_SUBDIRS         = NO
+
+# The OUTPUT_LANGUAGE tag is used to specify the language in which all
+# documentation generated by doxygen is written. Doxygen will use this
+# information to generate all constant output in the proper language.
+# Possible values are: Afrikaans, Arabic, Armenian, Brazilian, Catalan, Chinese,
+# Chinese-Traditional, Croatian, Czech, Danish, Dutch, English (United States),
+# Esperanto, Farsi (Persian), Finnish, French, German, Greek, Hungarian,
+# Indonesian, Italian, Japanese, Japanese-en (Japanese with English messages),
+# Korean, Korean-en (Korean with English messages), Latvian, Lithuanian,
+# Macedonian, Norwegian, Persian (Farsi), Polish, Portuguese, Romanian, Russian,
+# Serbian, Serbian-Cyrillic, Slovak, Slovene, Spanish, Swedish, Turkish,
+# Ukrainian and Vietnamese.
+# The default value is: English.
+
+OUTPUT_LANGUAGE        = English
+
+# If the BRIEF_MEMBER_DESC tag is set to YES doxygen will include brief member
+# descriptions after the members that are listed in the file and class
+# documentation (similar to Javadoc). Set to NO to disable this.
+# The default value is: YES.
+
+BRIEF_MEMBER_DESC      = YES
+
+# If the REPEAT_BRIEF tag is set to YES doxygen will prepend the brief
+# description of a member or function before the detailed description
+#
+# Note: If both HIDE_UNDOC_MEMBERS and BRIEF_MEMBER_DESC are set to NO, the
+# brief descriptions will be completely suppressed.
+# The default value is: YES.
+
+REPEAT_BRIEF           = YES
+
+# This tag implements a quasi-intelligent brief description abbreviator that is
+# used to form the text in various listings. Each string in this list, if found
+# as the leading text of the brief description, will be stripped from the text
+# and the result, after processing the whole list, is used as the annotated
+# text. Otherwise, the brief description is used as-is. If left blank, the
+# following values are used ($name is automatically replaced with the name of
+# the entity):The $name class, The $name widget, The $name file, is, provides,
+# specifies, contains, represents, a, an and the.
+
+ABBREVIATE_BRIEF       =
+
+# If the ALWAYS_DETAILED_SEC and REPEAT_BRIEF tags are both set to YES then
+# doxygen will generate a detailed section even if there is only a brief
+# description.
+# The default value is: NO.
+
+ALWAYS_DETAILED_SEC    = NO
+
+# If the INLINE_INHERITED_MEMB tag is set to YES, doxygen will show all
+# inherited members of a class in the documentation of that class as if those
+# members were ordinary class members. Constructors, destructors and assignment
+# operators of the base classes will not be shown.
+# The default value is: NO.
+
+INLINE_INHERITED_MEMB  = YES
+
+# If the FULL_PATH_NAMES tag is set to YES doxygen will prepend the full path
+# before files name in the file list and in the header files. If set to NO the
+# shortest path that makes the file name unique will be used
+# The default value is: YES.
+
+FULL_PATH_NAMES        = YES
+
+# The STRIP_FROM_PATH tag can be used to strip a user-defined part of the path.
+# Stripping is only done if one of the specified strings matches the left-hand
+# part of the path. The tag can be used to show relative paths in the file list.
+# If left blank the directory from which doxygen is run is used as the path to
+# strip.
+#
+# Note that you can specify absolute paths here, but also relative paths, which
+# will be relative from the directory where doxygen is started.
+# This tag requires that the tag FULL_PATH_NAMES is set to YES.
+
+STRIP_FROM_PATH        = @SRCDIR@
+
+# The STRIP_FROM_INC_PATH tag can be used to strip a user-defined part of the
+# path mentioned in the documentation of a class, which tells the reader which
+# header file to include in order to use a class. If left blank only the name of
+# the header file containing the class definition is used. Otherwise one should
+# specify the list of include paths that are normally passed to the compiler
+# using the -I flag.
+
+STRIP_FROM_INC_PATH    =
+
+# If the SHORT_NAMES tag is set to YES, doxygen will generate much shorter (but
+# less readable) file names. This can be useful is your file systems doesn't
+# support long names like on DOS, Mac, or CD-ROM.
+# The default value is: NO.
+
+SHORT_NAMES            = NO
+
+# If the JAVADOC_AUTOBRIEF tag is set to YES then doxygen will interpret the
+# first line (until the first dot) of a Javadoc-style comment as the brief
+# description. If set to NO, the Javadoc-style will behave just like regular Qt-
+# style comments (thus requiring an explicit @brief command for a brief
+# description.)
+# The default value is: NO.
+
+JAVADOC_AUTOBRIEF      = YES
+
+# If the QT_AUTOBRIEF tag is set to YES then doxygen will interpret the first
+# line (until the first dot) of a Qt-style comment as the brief description. If
+# set to NO, the Qt-style will behave just like regular Qt-style comments (thus
+# requiring an explicit \brief command for a brief description.)
+# The default value is: NO.
+
+QT_AUTOBRIEF           = NO
+
+# The MULTILINE_CPP_IS_BRIEF tag can be set to YES to make doxygen treat a
+# multi-line C++ special comment block (i.e. a block of //! or /// comments) as
+# a brief description. This used to be the default behavior. The new default is
+# to treat a multi-line C++ comment block as a detailed description. Set this
+# tag to YES if you prefer the old behavior instead.
+#
+# Note that setting this tag to YES also means that rational rose comments are
+# not recognized any more.
+# The default value is: NO.
+
+MULTILINE_CPP_IS_BRIEF = NO
+
+# If the INHERIT_DOCS tag is set to YES then an undocumented member inherits the
+# documentation from any documented member that it re-implements.
+# The default value is: YES.
+
+INHERIT_DOCS           = YES
+
+# If the SEPARATE_MEMBER_PAGES tag is set to YES, then doxygen will produce a
+# new page for each member. If set to NO, the documentation of a member will be
+# part of the file/class/namespace that contains it.
+# The default value is: NO.
+
+SEPARATE_MEMBER_PAGES  = NO
+
+# The TAB_SIZE tag can be used to set the number of spaces in a tab. Doxygen
+# uses this value to replace tabs by spaces in code fragments.
+# Minimum value: 1, maximum value: 16, default value: 4.
+
+TAB_SIZE               = 8
+
+# This tag can be used to specify a number of aliases that act as commands in
+# the documentation. An alias has the form:
+# name=value
+# For example adding
+# "sideeffect=@par Side Effects:\n"
+# will allow you to put the command \sideeffect (or @sideeffect) in the
+# documentation, which will result in a user-defined paragraph with heading
+# "Side Effects:". You can put \n's in the value part of an alias to insert
+# newlines.
+
+ALIASES                =
+
+# This tag can be used to specify a number of word-keyword mappings (TCL only).
+# A mapping has the form "name=value". For example adding "class=itcl::class"
+# will allow you to use the command class in the itcl::class meaning.
+
+TCL_SUBST              =
+
+# Set the OPTIMIZE_OUTPUT_FOR_C tag to YES if your project consists of C sources
+# only. Doxygen will then generate output that is more tailored for C. For
+# instance, some of the names that are used will be different. The list of all
+# members will be omitted, etc.
+# The default value is: NO.
+
+OPTIMIZE_OUTPUT_FOR_C  = YES
+
+# Set the OPTIMIZE_OUTPUT_JAVA tag to YES if your project consists of Java or
+# Python sources only. Doxygen will then generate output that is more tailored
+# for that language. For instance, namespaces will be presented as packages,
+# qualified scopes will look different, etc.
+# The default value is: NO.
+
+OPTIMIZE_OUTPUT_JAVA   = NO
+
+# Set the OPTIMIZE_FOR_FORTRAN tag to YES if your project consists of Fortran
+# sources. Doxygen will then generate output that is tailored for Fortran.
+# The default value is: NO.
+
+OPTIMIZE_FOR_FORTRAN   = NO
+
+# Set the OPTIMIZE_OUTPUT_VHDL tag to YES if your project consists of VHDL
+# sources. Doxygen will then generate output that is tailored for VHDL.
+# The default value is: NO.
+
+OPTIMIZE_OUTPUT_VHDL   = NO
+
+# Doxygen selects the parser to use depending on the extension of the files it
+# parses. With this tag you can assign which parser to use for a given
+# extension. Doxygen has a built-in mapping, but you can override or extend it
+# using this tag. The format is ext=language, where ext is a file extension, and
+# language is one of the parsers supported by doxygen: IDL, Java, Javascript,
+# C#, C, C++, D, PHP, Objective-C, Python, Fortran, VHDL. For instance to make
+# doxygen treat .inc files as Fortran files (default is PHP), and .f files as C
+# (default is Fortran), use: inc=Fortran f=C.
+#
+# Note For files without extension you can use no_extension as a placeholder.
+#
+# Note that for custom extensions you also need to set FILE_PATTERNS otherwise
+# the files are not read by doxygen.
+
+EXTENSION_MAPPING      =
+
+# If the MARKDOWN_SUPPORT tag is enabled then doxygen pre-processes all comments
+# according to the Markdown format, which allows for more readable
+# documentation. See http://daringfireball.net/projects/markdown/ for details.
+# The output of markdown processing is further processed by doxygen, so you can
+# mix doxygen, HTML, and XML commands with Markdown formatting. Disable only in
+# case of backward compatibilities issues.
+# The default value is: YES.
+
+MARKDOWN_SUPPORT       = YES
+
+# When enabled doxygen tries to link words that correspond to documented
+# classes, or namespaces to their corresponding documentation. Such a link can
+# be prevented in individual cases by by putting a % sign in front of the word
+# or globally by setting AUTOLINK_SUPPORT to NO.
+# The default value is: YES.
+
+AUTOLINK_SUPPORT       = YES
+
+# If you use STL classes (i.e. std::string, std::vector, etc.) but do not want
+# to include (a tag file for) the STL sources as input, then you should set this
+# tag to YES in order to let doxygen match functions declarations and
+# definitions whose arguments contain STL classes (e.g. func(std::string);
+# versus func(std::string) {}). This also make the inheritance and collaboration
+# diagrams that involve STL classes more complete and accurate.
+# The default value is: NO.
+
+BUILTIN_STL_SUPPORT    = NO
+
+# If you use Microsoft's C++/CLI language, you should set this option to YES to
+# enable parsing support.
+# The default value is: NO.
+
+CPP_CLI_SUPPORT        = NO
+
+# Set the SIP_SUPPORT tag to YES if your project consists of sip (see:
+# http://www.riverbankcomputing.co.uk/software/sip/intro) sources only. Doxygen
+# will parse them like normal C++ but will assume all classes use public instead
+# of private inheritance when no explicit protection keyword is present.
+# The default value is: NO.
+
+SIP_SUPPORT            = NO
+
+# For Microsoft's IDL there are propget and propput attributes to indicate
+# getter and setter methods for a property. Setting this option to YES will make
+# doxygen to replace the get and set methods by a property in the documentation.
+# This will only work if the methods are indeed getting or setting a simple
+# type. If this is not the case, or you want to show the methods anyway, you
+# should set this option to NO.
+# The default value is: YES.
+
+IDL_PROPERTY_SUPPORT   = YES
+
+# If member grouping is used in the documentation and the DISTRIBUTE_GROUP_DOC
+# tag is set to YES, then doxygen will reuse the documentation of the first
+# member in the group (if any) for the other members of the group. By default
+# all members of a group must be documented explicitly.
+# The default value is: NO.
+
+DISTRIBUTE_GROUP_DOC   = NO
+
+# Set the SUBGROUPING tag to YES to allow class member groups of the same type
+# (for instance a group of public functions) to be put as a subgroup of that
+# type (e.g. under the Public Functions section). Set it to NO to prevent
+# subgrouping. Alternatively, this can be done per class using the
+# \nosubgrouping command.
+# The default value is: YES.
+
+SUBGROUPING            = YES
+
+# When the INLINE_GROUPED_CLASSES tag is set to YES, classes, structs and unions
+# are shown inside the group in which they are included (e.g. using \ingroup)
+# instead of on a separate page (for HTML and Man pages) or section (for LaTeX
+# and RTF).
+#
+# Note that this feature does not work in combination with
+# SEPARATE_MEMBER_PAGES.
+# The default value is: NO.
+
+INLINE_GROUPED_CLASSES = NO
+
+# When the INLINE_SIMPLE_STRUCTS tag is set to YES, structs, classes, and unions
+# with only public data fields or simple typedef fields will be shown inline in
+# the documentation of the scope in which they are defined (i.e. file,
+# namespace, or group documentation), provided this scope is documented. If set
+# to NO, structs, classes, and unions are shown on a separate page (for HTML and
+# Man pages) or section (for LaTeX and RTF).
+# The default value is: NO.
+
+INLINE_SIMPLE_STRUCTS  = NO
+
+# When TYPEDEF_HIDES_STRUCT tag is enabled, a typedef of a struct, union, or
+# enum is documented as struct, union, or enum with the name of the typedef. So
+# typedef struct TypeS {} TypeT, will appear in the documentation as a struct
+# with name TypeT. When disabled the typedef will appear as a member of a file,
+# namespace, or class. And the struct will be named TypeS. This can typically be
+# useful for C code in case the coding convention dictates that all compound
+# types are typedef'ed and only the typedef is referenced, never the tag name.
+# The default value is: NO.
+
+TYPEDEF_HIDES_STRUCT   = NO
+
+# The size of the symbol lookup cache can be set using LOOKUP_CACHE_SIZE. This
+# cache is used to resolve symbols given their name and scope. Since this can be
+# an expensive process and often the same symbol appears multiple times in the
+# code, doxygen keeps a cache of pre-resolved symbols. If the cache is too small
+# doxygen will become slower. If the cache is too large, memory is wasted. The
+# cache size is given by this formula: 2^(16+LOOKUP_CACHE_SIZE). The valid range
+# is 0..9, the default is 0, corresponding to a cache size of 2^16=65536
+# symbols. At the end of a run doxygen will report the cache usage and suggest
+# the optimal cache size from a speed point of view.
+# Minimum value: 0, maximum value: 9, default value: 0.
+
+LOOKUP_CACHE_SIZE      = 0
+
+#---------------------------------------------------------------------------
+# Build related configuration options
+#---------------------------------------------------------------------------
+
+# If the EXTRACT_ALL tag is set to YES doxygen will assume all entities in
+# documentation are documented, even if no documentation was available. Private
+# class members and static file members will be hidden unless the
+# EXTRACT_PRIVATE respectively EXTRACT_STATIC tags are set to YES.
+# Note: This will also disable the warnings about undocumented members that are
+# normally produced when WARNINGS is set to YES.
+# The default value is: NO.
+
+EXTRACT_ALL            = YES
+
+# If the EXTRACT_PRIVATE tag is set to YES all private members of a class will
+# be included in the documentation.
+# The default value is: NO.
+
+EXTRACT_PRIVATE        = YES
+
+# If the EXTRACT_PACKAGE tag is set to YES all members with package or internal
+# scope will be included in the documentation.
+# The default value is: NO.
+
+EXTRACT_PACKAGE        = NO
+
+# If the EXTRACT_STATIC tag is set to YES all static members of a file will be
+# included in the documentation.
+# The default value is: NO.
+
+EXTRACT_STATIC         = YES
+
+# If the EXTRACT_LOCAL_CLASSES tag is set to YES classes (and structs) defined
+# locally in source files will be included in the documentation. If set to NO
+# only classes defined in header files are included. Does not have any effect
+# for Java sources.
+# The default value is: YES.
+
+EXTRACT_LOCAL_CLASSES  = YES
+
+# This flag is only useful for Objective-C code. When set to YES local methods,
+# which are defined in the implementation section but not in the interface are
+# included in the documentation. If set to NO only methods in the interface are
+# included.
+# The default value is: NO.
+
+EXTRACT_LOCAL_METHODS  = NO
+
+# If this flag is set to YES, the members of anonymous namespaces will be
+# extracted and appear in the documentation as a namespace called
+# 'anonymous_namespace{file}', where file will be replaced with the base name of
+# the file that contains the anonymous namespace. By default anonymous namespace
+# are hidden.
+# The default value is: NO.
+
+EXTRACT_ANON_NSPACES   = NO
+
+# If the HIDE_UNDOC_MEMBERS tag is set to YES, doxygen will hide all
+# undocumented members inside documented classes or files. If set to NO these
+# members will be included in the various overviews, but no documentation
+# section is generated. This option has no effect if EXTRACT_ALL is enabled.
+# The default value is: NO.
+
+HIDE_UNDOC_MEMBERS     = NO
+
+# If the HIDE_UNDOC_CLASSES tag is set to YES, doxygen will hide all
+# undocumented classes that are normally visible in the class hierarchy. If set
+# to NO these classes will be included in the various overviews. This option has
+# no effect if EXTRACT_ALL is enabled.
+# The default value is: NO.
+
+HIDE_UNDOC_CLASSES     = NO
+
+# If the HIDE_FRIEND_COMPOUNDS tag is set to YES, doxygen will hide all friend
+# (class|struct|union) declarations. If set to NO these declarations will be
+# included in the documentation.
+# The default value is: NO.
+
+HIDE_FRIEND_COMPOUNDS  = NO
+
+# If the HIDE_IN_BODY_DOCS tag is set to YES, doxygen will hide any
+# documentation blocks found inside the body of a function. If set to NO these
+# blocks will be appended to the function's detailed documentation block.
+# The default value is: NO.
+
+HIDE_IN_BODY_DOCS      = NO
+
+# The INTERNAL_DOCS tag determines if documentation that is typed after a
+# \internal command is included. If the tag is set to NO then the documentation
+# will be excluded. Set it to YES to include the internal documentation.
+# The default value is: NO.
+
+INTERNAL_DOCS          = NO
+
+# If the CASE_SENSE_NAMES tag is set to NO then doxygen will only generate file
+# names in lower-case letters. If set to YES upper-case letters are also
+# allowed. This is useful if you have classes or files whose names only differ
+# in case and if your file system supports case sensitive file names. Windows
+# and Mac users are advised to set this option to NO.
+# The default value is: system dependent.
+
+CASE_SENSE_NAMES       = YES
+
+# If the HIDE_SCOPE_NAMES tag is set to NO then doxygen will show members with
+# their full class and namespace scopes in the documentation. If set to YES the
+# scope will be hidden.
+# The default value is: NO.
+
+HIDE_SCOPE_NAMES       = NO
+
+# If the SHOW_INCLUDE_FILES tag is set to YES then doxygen will put a list of
+# the files that are included by a file in the documentation of that file.
+# The default value is: YES.
+
+SHOW_INCLUDE_FILES     = YES
+
+# If the SHOW_GROUPED_MEMB_INC tag is set to YES then Doxygen will add for each
+# grouped member an include statement to the documentation, telling the reader
+# which file to include in order to use the member.
+# The default value is: NO.
+
+SHOW_GROUPED_MEMB_INC  = NO
+
+# If the FORCE_LOCAL_INCLUDES tag is set to YES then doxygen will list include
+# files with double quotes in the documentation rather than with sharp brackets.
+# The default value is: NO.
+
+FORCE_LOCAL_INCLUDES   = NO
+
+# If the INLINE_INFO tag is set to YES then a tag [inline] is inserted in the
+# documentation for inline members.
+# The default value is: YES.
+
+INLINE_INFO            = YES
+
+# If the SORT_MEMBER_DOCS tag is set to YES then doxygen will sort the
+# (detailed) documentation of file and class members alphabetically by member
+# name. If set to NO the members will appear in declaration order.
+# The default value is: YES.
+
+SORT_MEMBER_DOCS       = YES
+
+# If the SORT_BRIEF_DOCS tag is set to YES then doxygen will sort the brief
+# descriptions of file, namespace and class members alphabetically by member
+# name. If set to NO the members will appear in declaration order. Note that
+# this will also influence the order of the classes in the class list.
+# The default value is: NO.
+
+SORT_BRIEF_DOCS        = NO
+
+# If the SORT_MEMBERS_CTORS_1ST tag is set to YES then doxygen will sort the
+# (brief and detailed) documentation of class members so that constructors and
+# destructors are listed first. If set to NO the constructors will appear in the
+# respective orders defined by SORT_BRIEF_DOCS and SORT_MEMBER_DOCS.
+# Note: If SORT_BRIEF_DOCS is set to NO this option is ignored for sorting brief
+# member documentation.
+# Note: If SORT_MEMBER_DOCS is set to NO this option is ignored for sorting
+# detailed member documentation.
+# The default value is: NO.
+
+SORT_MEMBERS_CTORS_1ST = NO
+
+# If the SORT_GROUP_NAMES tag is set to YES then doxygen will sort the hierarchy
+# of group names into alphabetical order. If set to NO the group names will
+# appear in their defined order.
+# The default value is: NO.
+
+SORT_GROUP_NAMES       = NO
+
+# If the SORT_BY_SCOPE_NAME tag is set to YES, the class list will be sorted by
+# fully-qualified names, including namespaces. If set to NO, the class list will
+# be sorted only by class name, not including the namespace part.
+# Note: This option is not very useful if HIDE_SCOPE_NAMES is set to YES.
+# Note: This option applies only to the class list, not to the alphabetical
+# list.
+# The default value is: NO.
+
+SORT_BY_SCOPE_NAME     = NO
+
+# If the STRICT_PROTO_MATCHING option is enabled and doxygen fails to do proper
+# type resolution of all parameters of a function it will reject a match between
+# the prototype and the implementation of a member function even if there is
+# only one candidate or it is obvious which candidate to choose by doing a
+# simple string match. By disabling STRICT_PROTO_MATCHING doxygen will still
+# accept a match between prototype and implementation in such cases.
+# The default value is: NO.
+
+STRICT_PROTO_MATCHING  = NO
+
+# The GENERATE_TODOLIST tag can be used to enable ( YES) or disable ( NO) the
+# todo list. This list is created by putting \todo commands in the
+# documentation.
+# The default value is: YES.
+
+GENERATE_TODOLIST      = YES
+
+# The GENERATE_TESTLIST tag can be used to enable ( YES) or disable ( NO) the
+# test list. This list is created by putting \test commands in the
+# documentation.
+# The default value is: YES.
+
+GENERATE_TESTLIST      = YES
+
+# The GENERATE_BUGLIST tag can be used to enable ( YES) or disable ( NO) the bug
+# list. This list is created by putting \bug commands in the documentation.
+# The default value is: YES.
+
+GENERATE_BUGLIST       = YES
+
+# The GENERATE_DEPRECATEDLIST tag can be used to enable ( YES) or disable ( NO)
+# the deprecated list. This list is created by putting \deprecated commands in
+# the documentation.
+# The default value is: YES.
+
+GENERATE_DEPRECATEDLIST= YES
+
+# The ENABLED_SECTIONS tag can be used to enable conditional documentation
+# sections, marked by \if <section_label> ... \endif and \cond <section_label>
+# ... \endcond blocks.
+
+ENABLED_SECTIONS       =
+
+# The MAX_INITIALIZER_LINES tag determines the maximum number of lines that the
+# initial value of a variable or macro / define can have for it to appear in the
+# documentation. If the initializer consists of more lines than specified here
+# it will be hidden. Use a value of 0 to hide initializers completely. The
+# appearance of the value of individual variables and macros / defines can be
+# controlled using \showinitializer or \hideinitializer command in the
+# documentation regardless of this setting.
+# Minimum value: 0, maximum value: 10000, default value: 30.
+
+MAX_INITIALIZER_LINES  = 0
+
+# Set the SHOW_USED_FILES tag to NO to disable the list of files generated at
+# the bottom of the documentation of classes and structs. If set to YES the list
+# will mention the files that were used to generate the documentation.
+# The default value is: YES.
+
+SHOW_USED_FILES        = YES
+
+# Set the SHOW_FILES tag to NO to disable the generation of the Files page. This
+# will remove the Files entry from the Quick Index and from the Folder Tree View
+# (if specified).
+# The default value is: YES.
+
+SHOW_FILES             = YES
+
+# Set the SHOW_NAMESPACES tag to NO to disable the generation of the Namespaces
+# page. This will remove the Namespaces entry from the Quick Index and from the
+# Folder Tree View (if specified).
+# The default value is: YES.
+
+SHOW_NAMESPACES        = YES
+
+# The FILE_VERSION_FILTER tag can be used to specify a program or script that
+# doxygen should invoke to get the current version for each file (typically from
+# the version control system). Doxygen will invoke the program by executing (via
+# popen()) the command command input-file, where command is the value of the
+# FILE_VERSION_FILTER tag, and input-file is the name of an input file provided
+# by doxygen. Whatever the program writes to standard output is used as the file
+# version. For an example see the documentation.
+
+FILE_VERSION_FILTER    =
+
+# The LAYOUT_FILE tag can be used to specify a layout file which will be parsed
+# by doxygen. The layout file controls the global structure of the generated
+# output files in an output format independent way. To create the layout file
+# that represents doxygen's defaults, run doxygen with the -l option. You can
+# optionally specify a file name after the option, if omitted DoxygenLayout.xml
+# will be used as the name of the layout file.
+#
+# Note that if you run doxygen from a directory containing a file called
+# DoxygenLayout.xml, doxygen will parse it automatically even if the LAYOUT_FILE
+# tag is left empty.
+
+LAYOUT_FILE            =
+
+# The CITE_BIB_FILES tag can be used to specify one or more bib files containing
+# the reference definitions. This must be a list of .bib files. The .bib
+# extension is automatically appended if omitted. This requires the bibtex tool
+# to be installed. See also http://en.wikipedia.org/wiki/BibTeX for more info.
+# For LaTeX the style of the bibliography can be controlled using
+# LATEX_BIB_STYLE. To use this feature you need bibtex and perl available in the
+# search path. Do not use file names with spaces, bibtex cannot handle them. See
+# also \cite for info how to create references.
+
+CITE_BIB_FILES         =
+
+#---------------------------------------------------------------------------
+# Configuration options related to warning and progress messages
+#---------------------------------------------------------------------------
+
+# The QUIET tag can be used to turn on/off the messages that are generated to
+# standard output by doxygen. If QUIET is set to YES this implies that the
+# messages are off.
+# The default value is: NO.
+
+QUIET                  = YES
+
+# The WARNINGS tag can be used to turn on/off the warning messages that are
+# generated to standard error ( stderr) by doxygen. If WARNINGS is set to YES
+# this implies that the warnings are on.
+#
+# Tip: Turn warnings on while writing the documentation.
+# The default value is: YES.
+
+WARNINGS               = YES
+
+# If the WARN_IF_UNDOCUMENTED tag is set to YES, then doxygen will generate
+# warnings for undocumented members. If EXTRACT_ALL is set to YES then this flag
+# will automatically be disabled.
+# The default value is: YES.
+
+WARN_IF_UNDOCUMENTED   = YES
+
+# If the WARN_IF_DOC_ERROR tag is set to YES, doxygen will generate warnings for
+# potential errors in the documentation, such as not documenting some parameters
+# in a documented function, or documenting parameters that don't exist or using
+# markup commands wrongly.
+# The default value is: YES.
+
+WARN_IF_DOC_ERROR      = YES
+
+# This WARN_NO_PARAMDOC option can be enabled to get warnings for functions that
+# are documented, but have no documentation for their parameters or return
+# value. If set to NO doxygen will only warn about wrong or incomplete parameter
+# documentation, but not about the absence of documentation.
+# The default value is: NO.
+
+WARN_NO_PARAMDOC       = NO
+
+# The WARN_FORMAT tag determines the format of the warning messages that doxygen
+# can produce. The string should contain the $file, $line, and $text tags, which
+# will be replaced by the file and line number from which the warning originated
+# and the warning text. Optionally the format may contain $version, which will
+# be replaced by the version of the file (if it could be obtained via
+# FILE_VERSION_FILTER)
+# The default value is: $file:$line: $text.
+
+WARN_FORMAT            = "$file:$line: $text"
+
+# The WARN_LOGFILE tag can be used to specify a file to which warning and error
+# messages should be written. If left blank the output is written to standard
+# error (stderr).
+
+WARN_LOGFILE           =
+
+#---------------------------------------------------------------------------
+# Configuration options related to the input files
+#---------------------------------------------------------------------------
+
+# The INPUT tag is used to specify the files and/or directories that contain
+# documented source files. You may enter file names like myfile.cpp or
+# directories like /usr/src/myproject. Separate the files or directories with
+# spaces.
+# Note: If this tag is empty the current directory is searched.
+
+INPUT                  = @SRCDIR@/doc/libdvbv5-index.doc \
+			 @SRCDIR@/lib/include/libdvbv5/dvb-demux.h \
+			 @SRCDIR@/lib/include/libdvbv5/dvb-dev.h \
+			 @SRCDIR@/lib/include/libdvbv5/dvb-fe.h \
+			 @SRCDIR@/lib/include/libdvbv5/dvb-file.h \
+			 @SRCDIR@/lib/include/libdvbv5/dvb-log.h \
+			 @SRCDIR@/lib/include/libdvbv5/dvb-sat.h \
+			 @SRCDIR@/lib/include/libdvbv5/dvb-scan.h \
+			 @SRCDIR@/lib/include/libdvbv5/dvb-v5-std.h \
+			 @SRCDIR@/lib/include/libdvbv5/descriptors.h \
+			 @SRCDIR@/lib/include/libdvbv5/header.h \
+			 @SRCDIR@/lib/include/libdvbv5/atsc_header.h \
+			 @SRCDIR@/lib/include/libdvbv5/atsc_eit.h \
+			 @SRCDIR@/lib/include/libdvbv5/cat.h \
+			 @SRCDIR@/lib/include/libdvbv5/eit.h \
+			 @SRCDIR@/lib/include/libdvbv5/mgt.h \
+			 @SRCDIR@/lib/include/libdvbv5/nit.h \
+			 @SRCDIR@/lib/include/libdvbv5/pat.h \
+			 @SRCDIR@/lib/include/libdvbv5/pmt.h \
+			 @SRCDIR@/lib/include/libdvbv5/sdt.h \
+			 @SRCDIR@/lib/include/libdvbv5/vct.h \
+			 @SRCDIR@/lib/include/libdvbv5/crc32.h \
+			 @SRCDIR@/lib/include/libdvbv5/countries.h \
+			 @SRCDIR@/lib/include/libdvbv5/mpeg_es.h \
+			 @SRCDIR@/lib/include/libdvbv5/mpeg_pes.h \
+			 @SRCDIR@/lib/include/libdvbv5/mpeg_ts.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_atsc_service_location.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_ca.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_ca_identifier.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_cable_delivery.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_event_extended.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_event_short.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_extension.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_frequency_list.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_hierarchy.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_isdbt_delivery.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_language.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_logical_channel.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_network_name.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_partial_reception.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_sat.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_service.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_t2_delivery.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_terrestrial_delivery.h \
+			 @SRCDIR@/lib/include/libdvbv5/desc_ts_info.h \
+
+# This tag can be used to specify the character encoding of the source files
+# that doxygen parses. Internally doxygen uses the UTF-8 encoding. Doxygen uses
+# libiconv (or the iconv built into libc) for the transcoding. See the libiconv
+# documentation (see: http://www.gnu.org/software/libiconv) for the list of
+# possible encodings.
+# The default value is: UTF-8.
+
+INPUT_ENCODING         = UTF-8
+
+# If the value of the INPUT tag contains directories, you can use the
+# FILE_PATTERNS tag to specify one or more wildcard patterns (like *.cpp and
+# *.h) to filter out the source-files in the directories. If left blank the
+# following patterns are tested:*.c, *.cc, *.cxx, *.cpp, *.c++, *.java, *.ii,
+# *.ixx, *.ipp, *.i++, *.inl, *.idl, *.ddl, *.odl, *.h, *.hh, *.hxx, *.hpp,
+# *.h++, *.cs, *.d, *.php, *.php4, *.php5, *.phtml, *.inc, *.m, *.markdown,
+# *.md, *.mm, *.dox, *.py, *.f90, *.f, *.for, *.tcl, *.vhd, *.vhdl, *.ucf,
+# *.qsf, *.as and *.js.
+
+FILE_PATTERNS          =
+
+# The RECURSIVE tag can be used to specify whether or not subdirectories should
+# be searched for input files as well.
+# The default value is: NO.
+
+RECURSIVE              = YES
+
+# The EXCLUDE tag can be used to specify files and/or directories that should be
+# excluded from the INPUT source files. This way you can easily exclude a
+# subdirectory from a directory tree whose root is specified with the INPUT tag.
+#
+# Note that relative paths are relative to the directory from which doxygen is
+# run.
+
+EXCLUDE                =
+
+# The EXCLUDE_SYMLINKS tag can be used to select whether or not files or
+# directories that are symbolic links (a Unix file system feature) are excluded
+# from the input.
+# The default value is: NO.
+
+EXCLUDE_SYMLINKS       = NO
+
+# If the value of the INPUT tag contains directories, you can use the
+# EXCLUDE_PATTERNS tag to specify one or more wildcard patterns to exclude
+# certain files from those directories.
+#
+# Note that the wildcards are matched against the file with absolute path, so to
+# exclude all test directories for example use the pattern */test/*
+
+EXCLUDE_PATTERNS       =
+
+# The EXCLUDE_SYMBOLS tag can be used to specify one or more symbol names
+# (namespaces, classes, functions, etc.) that should be excluded from the
+# output. The symbol name can be a fully qualified name, a word, or if the
+# wildcard * is used, a substring. Examples: ANamespace, AClass,
+# AClass::ANamespace, ANamespace::*Test
+#
+# Note that the wildcards are matched against the file with absolute path, so to
+# exclude all test directories use the pattern */test/*
+
+EXCLUDE_SYMBOLS        =
+
+# The EXAMPLE_PATH tag can be used to specify one or more files or directories
+# that contain example code fragments that are included (see the \include
+# command).
+
+EXAMPLE_PATH           = @SRCDIR@/utils/dvb/
+
+# If the value of the EXAMPLE_PATH tag contains directories, you can use the
+# EXAMPLE_PATTERNS tag to specify one or more wildcard pattern (like *.cpp and
+# *.h) to filter out the source-files in the directories. If left blank all
+# files are included.
+
+EXAMPLE_PATTERNS       =
+
+# If the EXAMPLE_RECURSIVE tag is set to YES then subdirectories will be
+# searched for input files to be used with the \include or \dontinclude commands
+# irrespective of the value of the RECURSIVE tag.
+# The default value is: NO.
+
+EXAMPLE_RECURSIVE      = NO
+
+# The IMAGE_PATH tag can be used to specify one or more files or directories
+# that contain images that are to be included in the documentation (see the
+# \image command).
+
+IMAGE_PATH             =
+
+# The INPUT_FILTER tag can be used to specify a program that doxygen should
+# invoke to filter for each input file. Doxygen will invoke the filter program
+# by executing (via popen()) the command:
+#
+# <filter> <input-file>
+#
+# where <filter> is the value of the INPUT_FILTER tag, and <input-file> is the
+# name of an input file. Doxygen will then use the output that the filter
+# program writes to standard output. If FILTER_PATTERNS is specified, this tag
+# will be ignored.
+#
+# Note that the filter must not add or remove lines; it is applied before the
+# code is scanned, but not when the output code is generated. If lines are added
+# or removed, the anchors will not be placed correctly.
+
+INPUT_FILTER           =
+
+# The FILTER_PATTERNS tag can be used to specify filters on a per file pattern
+# basis. Doxygen will compare the file name with each pattern and apply the
+# filter if there is a match. The filters are a list of the form: pattern=filter
+# (like *.cpp=my_cpp_filter). See INPUT_FILTER for further information on how
+# filters are used. If the FILTER_PATTERNS tag is empty or if none of the
+# patterns match the file name, INPUT_FILTER is applied.
+
+FILTER_PATTERNS        =
+
+# If the FILTER_SOURCE_FILES tag is set to YES, the input filter (if set using
+# INPUT_FILTER ) will also be used to filter the input files that are used for
+# producing the source files to browse (i.e. when SOURCE_BROWSER is set to YES).
+# The default value is: NO.
+
+FILTER_SOURCE_FILES    = NO
+
+# The FILTER_SOURCE_PATTERNS tag can be used to specify source filters per file
+# pattern. A pattern will override the setting for FILTER_PATTERN (if any) and
+# it is also possible to disable source filtering for a specific pattern using
+# *.ext= (so without naming a filter).
+# This tag requires that the tag FILTER_SOURCE_FILES is set to YES.
+
+FILTER_SOURCE_PATTERNS =
+
+# If the USE_MDFILE_AS_MAINPAGE tag refers to the name of a markdown file that
+# is part of the input, its contents will be placed on the main page
+# (index.html). This can be useful if you have a project on for instance GitHub
+# and want to reuse the introduction page also for the doxygen output.
+
+USE_MDFILE_AS_MAINPAGE =
+
+#---------------------------------------------------------------------------
+# Configuration options related to source browsing
+#---------------------------------------------------------------------------
+
+# If the SOURCE_BROWSER tag is set to YES then a list of source files will be
+# generated. Documented entities will be cross-referenced with these sources.
+#
+# Note: To get rid of all source code in the generated output, make sure that
+# also VERBATIM_HEADERS is set to NO.
+# The default value is: NO.
+
+SOURCE_BROWSER         = YES
+
+# Setting the INLINE_SOURCES tag to YES will include the body of functions,
+# classes and enums directly into the documentation.
+# The default value is: NO.
+
+INLINE_SOURCES         = NO
+
+# Setting the STRIP_CODE_COMMENTS tag to YES will instruct doxygen to hide any
+# special comment blocks from generated source code fragments. Normal C, C++ and
+# Fortran comments will always remain visible.
+# The default value is: YES.
+
+STRIP_CODE_COMMENTS    = YES
+
+# If the REFERENCED_BY_RELATION tag is set to YES then for each documented
+# function all documented functions referencing it will be listed.
+# The default value is: NO.
+
+REFERENCED_BY_RELATION = YES
+
+# If the REFERENCES_RELATION tag is set to YES then for each documented function
+# all documented entities called/used by that function will be listed.
+# The default value is: NO.
+
+REFERENCES_RELATION    = YES
+
+# If the REFERENCES_LINK_SOURCE tag is set to YES and SOURCE_BROWSER tag is set
+# to YES, then the hyperlinks from functions in REFERENCES_RELATION and
+# REFERENCED_BY_RELATION lists will link to the source code. Otherwise they will
+# link to the documentation.
+# The default value is: YES.
+
+REFERENCES_LINK_SOURCE = YES
+
+# If SOURCE_TOOLTIPS is enabled (the default) then hovering a hyperlink in the
+# source code will show a tooltip with additional information such as prototype,
+# brief description and links to the definition and documentation. Since this
+# will make the HTML file larger and loading of large files a bit slower, you
+# can opt to disable this feature.
+# The default value is: YES.
+# This tag requires that the tag SOURCE_BROWSER is set to YES.
+
+SOURCE_TOOLTIPS        = YES
+
+# If the USE_HTAGS tag is set to YES then the references to source code will
+# point to the HTML generated by the htags(1) tool instead of doxygen built-in
+# source browser. The htags tool is part of GNU's global source tagging system
+# (see http://www.gnu.org/software/global/global.html). You will need version
+# 4.8.6 or higher.
+#
+# To use it do the following:
+# - Install the latest version of global
+# - Enable SOURCE_BROWSER and USE_HTAGS in the config file
+# - Make sure the INPUT points to the root of the source tree
+# - Run doxygen as normal
+#
+# Doxygen will invoke htags (and that will in turn invoke gtags), so these
+# tools must be available from the command line (i.e. in the search path).
+#
+# The result: instead of the source browser generated by doxygen, the links to
+# source code will now point to the output of htags.
+# The default value is: NO.
+# This tag requires that the tag SOURCE_BROWSER is set to YES.
+
+USE_HTAGS              = NO
+
+# If the VERBATIM_HEADERS tag is set the YES then doxygen will generate a
+# verbatim copy of the header file for each class for which an include is
+# specified. Set to NO to disable this.
+# See also: Section \class.
+# The default value is: YES.
+
+VERBATIM_HEADERS       = YES
+
+#---------------------------------------------------------------------------
+# Configuration options related to the alphabetical class index
+#---------------------------------------------------------------------------
+
+# If the ALPHABETICAL_INDEX tag is set to YES, an alphabetical index of all
+# compounds will be generated. Enable this if the project contains a lot of
+# classes, structs, unions or interfaces.
+# The default value is: YES.
+
+ALPHABETICAL_INDEX     = YES
+
+# The COLS_IN_ALPHA_INDEX tag can be used to specify the number of columns in
+# which the alphabetical index list will be split.
+# Minimum value: 1, maximum value: 20, default value: 5.
+# This tag requires that the tag ALPHABETICAL_INDEX is set to YES.
+
+COLS_IN_ALPHA_INDEX    = 5
+
+# In case all classes in a project start with a common prefix, all classes will
+# be put under the same header in the alphabetical index. The IGNORE_PREFIX tag
+# can be used to specify a prefix (or a list of prefixes) that should be ignored
+# while generating the index headers.
+# This tag requires that the tag ALPHABETICAL_INDEX is set to YES.
+
+IGNORE_PREFIX          =
+
+#---------------------------------------------------------------------------
+# Configuration options related to the HTML output
+#---------------------------------------------------------------------------
+
+# If the GENERATE_HTML tag is set to YES doxygen will generate HTML output
+# The default value is: YES.
+
+GENERATE_HTML          = @GENERATE_HTML@
+
+# The HTML_OUTPUT tag is used to specify where the HTML docs will be put. If a
+# relative path is entered the value of OUTPUT_DIRECTORY will be put in front of
+# it.
+# The default directory is: html.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_OUTPUT            = html
+
+# The HTML_FILE_EXTENSION tag can be used to specify the file extension for each
+# generated HTML page (for example: .htm, .php, .asp).
+# The default value is: .html.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_FILE_EXTENSION    = .html
+
+# The HTML_HEADER tag can be used to specify a user-defined HTML header file for
+# each generated HTML page. If the tag is left blank doxygen will generate a
+# standard header.
+#
+# To get valid HTML the header file that includes any scripts and style sheets
+# that doxygen needs, which is dependent on the configuration options used (e.g.
+# the setting GENERATE_TREEVIEW). It is highly recommended to start with a
+# default header using
+# doxygen -w html new_header.html new_footer.html new_stylesheet.css
+# YourConfigFile
+# and then modify the file new_header.html. See also section "Doxygen usage"
+# for information on how to generate the default header that doxygen normally
+# uses.
+# Note: The header is subject to change so you typically have to regenerate the
+# default header when upgrading to a newer version of doxygen. For a description
+# of the possible markers and block names see the documentation.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_HEADER            =
+
+# The HTML_FOOTER tag can be used to specify a user-defined HTML footer for each
+# generated HTML page. If the tag is left blank doxygen will generate a standard
+# footer. See HTML_HEADER for more information on how to generate a default
+# footer and what special commands can be used inside the footer. See also
+# section "Doxygen usage" for information on how to generate the default footer
+# that doxygen normally uses.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_FOOTER            =
+
+# The HTML_STYLESHEET tag can be used to specify a user-defined cascading style
+# sheet that is used by each HTML page. It can be used to fine-tune the look of
+# the HTML output. If left blank doxygen will generate a default style sheet.
+# See also section "Doxygen usage" for information on how to generate the style
+# sheet that doxygen normally uses.
+# Note: It is recommended to use HTML_EXTRA_STYLESHEET instead of this tag, as
+# it is more robust and this tag (HTML_STYLESHEET) will in the future become
+# obsolete.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_STYLESHEET        =
+
+# The HTML_EXTRA_STYLESHEET tag can be used to specify an additional user-
+# defined cascading style sheet that is included after the standard style sheets
+# created by doxygen. Using this option one can overrule certain style aspects.
+# This is preferred over using HTML_STYLESHEET since it does not replace the
+# standard style sheet and is therefor more robust against future updates.
+# Doxygen will copy the style sheet file to the output directory. For an example
+# see the documentation.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_EXTRA_STYLESHEET  =
+
+# The HTML_EXTRA_FILES tag can be used to specify one or more extra images or
+# other source files which should be copied to the HTML output directory. Note
+# that these files will be copied to the base HTML output directory. Use the
+# $relpath^ marker in the HTML_HEADER and/or HTML_FOOTER files to load these
+# files. In the HTML_STYLESHEET file, use the file name only. Also note that the
+# files will be copied as-is; there are no commands or markers available.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_EXTRA_FILES       =
+
+# The HTML_COLORSTYLE_HUE tag controls the color of the HTML output. Doxygen
+# will adjust the colors in the stylesheet and background images according to
+# this color. Hue is specified as an angle on a colorwheel, see
+# http://en.wikipedia.org/wiki/Hue for more information. For instance the value
+# 0 represents red, 60 is yellow, 120 is green, 180 is cyan, 240 is blue, 300
+# purple, and 360 is red again.
+# Minimum value: 0, maximum value: 359, default value: 220.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_COLORSTYLE_HUE    = 220
+
+# The HTML_COLORSTYLE_SAT tag controls the purity (or saturation) of the colors
+# in the HTML output. For a value of 0 the output will use grayscales only. A
+# value of 255 will produce the most vivid colors.
+# Minimum value: 0, maximum value: 255, default value: 100.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_COLORSTYLE_SAT    = 100
+
+# The HTML_COLORSTYLE_GAMMA tag controls the gamma correction applied to the
+# luminance component of the colors in the HTML output. Values below 100
+# gradually make the output lighter, whereas values above 100 make the output
+# darker. The value divided by 100 is the actual gamma applied, so 80 represents
+# a gamma of 0.8, The value 220 represents a gamma of 2.2, and 100 does not
+# change the gamma.
+# Minimum value: 40, maximum value: 240, default value: 80.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_COLORSTYLE_GAMMA  = 80
+
+# If the HTML_TIMESTAMP tag is set to YES then the footer of each generated HTML
+# page will contain the date and time when the page was generated. Setting this
+# to NO can help when comparing the output of multiple runs.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_TIMESTAMP         = NO
+
+# If the HTML_DYNAMIC_SECTIONS tag is set to YES then the generated HTML
+# documentation will contain sections that can be hidden and shown after the
+# page has loaded.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_DYNAMIC_SECTIONS  = NO
+
+# With HTML_INDEX_NUM_ENTRIES one can control the preferred number of entries
+# shown in the various tree structured indices initially; the user can expand
+# and collapse entries dynamically later on. Doxygen will expand the tree to
+# such a level that at most the specified number of entries are visible (unless
+# a fully collapsed tree already exceeds this amount). So setting the number of
+# entries 1 will produce a full collapsed tree by default. 0 is a special value
+# representing an infinite number of entries and will result in a full expanded
+# tree by default.
+# Minimum value: 0, maximum value: 9999, default value: 100.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+HTML_INDEX_NUM_ENTRIES = 100
+
+# If the GENERATE_DOCSET tag is set to YES, additional index files will be
+# generated that can be used as input for Apple's Xcode 3 integrated development
+# environment (see: http://developer.apple.com/tools/xcode/), introduced with
+# OSX 10.5 (Leopard). To create a documentation set, doxygen will generate a
+# Makefile in the HTML output directory. Running make will produce the docset in
+# that directory and running make install will install the docset in
+# ~/Library/Developer/Shared/Documentation/DocSets so that Xcode will find it at
+# startup. See http://developer.apple.com/tools/creatingdocsetswithdoxygen.html
+# for more information.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+GENERATE_DOCSET        = NO
+
+# This tag determines the name of the docset feed. A documentation feed provides
+# an umbrella under which multiple documentation sets from a single provider
+# (such as a company or product suite) can be grouped.
+# The default value is: Doxygen generated docs.
+# This tag requires that the tag GENERATE_DOCSET is set to YES.
+
+DOCSET_FEEDNAME        = "Doxygen generated docs"
+
+# This tag specifies a string that should uniquely identify the documentation
+# set bundle. This should be a reverse domain-name style string, e.g.
+# com.mycompany.MyDocSet. Doxygen will append .docset to the name.
+# The default value is: org.doxygen.Project.
+# This tag requires that the tag GENERATE_DOCSET is set to YES.
+
+DOCSET_BUNDLE_ID       = org.doxygen.Project
+
+# The DOCSET_PUBLISHER_ID tag specifies a string that should uniquely identify
+# the documentation publisher. This should be a reverse domain-name style
+# string, e.g. com.mycompany.MyDocSet.documentation.
+# The default value is: org.doxygen.Publisher.
+# This tag requires that the tag GENERATE_DOCSET is set to YES.
+
+DOCSET_PUBLISHER_ID    = org.doxygen.Publisher
+
+# The DOCSET_PUBLISHER_NAME tag identifies the documentation publisher.
+# The default value is: Publisher.
+# This tag requires that the tag GENERATE_DOCSET is set to YES.
+
+DOCSET_PUBLISHER_NAME  = Publisher
+
+# If the GENERATE_HTMLHELP tag is set to YES then doxygen generates three
+# additional HTML index files: index.hhp, index.hhc, and index.hhk. The
+# index.hhp is a project file that can be read by Microsoft's HTML Help Workshop
+# (see: http://www.microsoft.com/en-us/download/details.aspx?id=21138) on
+# Windows.
+#
+# The HTML Help Workshop contains a compiler that can convert all HTML output
+# generated by doxygen into a single compiled HTML file (.chm). Compiled HTML
+# files are now used as the Windows 98 help format, and will replace the old
+# Windows help format (.hlp) on all Windows platforms in the future. Compressed
+# HTML files also contain an index, a table of contents, and you can search for
+# words in the documentation. The HTML workshop also contains a viewer for
+# compressed HTML files.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+GENERATE_HTMLHELP      = NO
+
+# The CHM_FILE tag can be used to specify the file name of the resulting .chm
+# file. You can add a path in front of the file if the result should not be
+# written to the html output directory.
+# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
+
+CHM_FILE               =
+
+# The HHC_LOCATION tag can be used to specify the location (absolute path
+# including file name) of the HTML help compiler ( hhc.exe). If non-empty
+# doxygen will try to run the HTML help compiler on the generated index.hhp.
+# The file has to be specified with full path.
+# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
+
+HHC_LOCATION           =
+
+# The GENERATE_CHI flag controls if a separate .chi index file is generated (
+# YES) or that it should be included in the master .chm file ( NO).
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
+
+GENERATE_CHI           = NO
+
+# The CHM_INDEX_ENCODING is used to encode HtmlHelp index ( hhk), content ( hhc)
+# and project file content.
+# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
+
+CHM_INDEX_ENCODING     =
+
+# The BINARY_TOC flag controls whether a binary table of contents is generated (
+# YES) or a normal table of contents ( NO) in the .chm file.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
+
+BINARY_TOC             = NO
+
+# The TOC_EXPAND flag can be set to YES to add extra items for group members to
+# the table of contents of the HTML help documentation and to the tree view.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTMLHELP is set to YES.
+
+TOC_EXPAND             = YES
+
+# If the GENERATE_QHP tag is set to YES and both QHP_NAMESPACE and
+# QHP_VIRTUAL_FOLDER are set, an additional index file will be generated that
+# can be used as input for Qt's qhelpgenerator to generate a Qt Compressed Help
+# (.qch) of the generated HTML documentation.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+GENERATE_QHP           = NO
+
+# If the QHG_LOCATION tag is specified, the QCH_FILE tag can be used to specify
+# the file name of the resulting .qch file. The path specified is relative to
+# the HTML output folder.
+# This tag requires that the tag GENERATE_QHP is set to YES.
+
+QCH_FILE               =
+
+# The QHP_NAMESPACE tag specifies the namespace to use when generating Qt Help
+# Project output. For more information please see Qt Help Project / Namespace
+# (see: http://qt-project.org/doc/qt-4.8/qthelpproject.html#namespace).
+# The default value is: org.doxygen.Project.
+# This tag requires that the tag GENERATE_QHP is set to YES.
+
+QHP_NAMESPACE          = org.doxygen.Project
+
+# The QHP_VIRTUAL_FOLDER tag specifies the namespace to use when generating Qt
+# Help Project output. For more information please see Qt Help Project / Virtual
+# Folders (see: http://qt-project.org/doc/qt-4.8/qthelpproject.html#virtual-
+# folders).
+# The default value is: doc.
+# This tag requires that the tag GENERATE_QHP is set to YES.
+
+QHP_VIRTUAL_FOLDER     = doc
+
+# If the QHP_CUST_FILTER_NAME tag is set, it specifies the name of a custom
+# filter to add. For more information please see Qt Help Project / Custom
+# Filters (see: http://qt-project.org/doc/qt-4.8/qthelpproject.html#custom-
+# filters).
+# This tag requires that the tag GENERATE_QHP is set to YES.
+
+QHP_CUST_FILTER_NAME   =
+
+# The QHP_CUST_FILTER_ATTRS tag specifies the list of the attributes of the
+# custom filter to add. For more information please see Qt Help Project / Custom
+# Filters (see: http://qt-project.org/doc/qt-4.8/qthelpproject.html#custom-
+# filters).
+# This tag requires that the tag GENERATE_QHP is set to YES.
+
+QHP_CUST_FILTER_ATTRS  =
+
+# The QHP_SECT_FILTER_ATTRS tag specifies the list of the attributes this
+# project's filter section matches. Qt Help Project / Filter Attributes (see:
+# http://qt-project.org/doc/qt-4.8/qthelpproject.html#filter-attributes).
+# This tag requires that the tag GENERATE_QHP is set to YES.
+
+QHP_SECT_FILTER_ATTRS  =
+
+# The QHG_LOCATION tag can be used to specify the location of Qt's
+# qhelpgenerator. If non-empty doxygen will try to run qhelpgenerator on the
+# generated .qhp file.
+# This tag requires that the tag GENERATE_QHP is set to YES.
+
+QHG_LOCATION           =
+
+# If the GENERATE_ECLIPSEHELP tag is set to YES, additional index files will be
+# generated, together with the HTML files, they form an Eclipse help plugin. To
+# install this plugin and make it available under the help contents menu in
+# Eclipse, the contents of the directory containing the HTML and XML files needs
+# to be copied into the plugins directory of eclipse. The name of the directory
+# within the plugins directory should be the same as the ECLIPSE_DOC_ID value.
+# After copying Eclipse needs to be restarted before the help appears.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+GENERATE_ECLIPSEHELP   = NO
+
+# A unique identifier for the Eclipse help plugin. When installing the plugin
+# the directory name containing the HTML and XML files should also have this
+# name. Each documentation set should have its own identifier.
+# The default value is: org.doxygen.Project.
+# This tag requires that the tag GENERATE_ECLIPSEHELP is set to YES.
+
+ECLIPSE_DOC_ID         = org.doxygen.Project
+
+# If you want full control over the layout of the generated HTML pages it might
+# be necessary to disable the index and replace it with your own. The
+# DISABLE_INDEX tag can be used to turn on/off the condensed index (tabs) at top
+# of each HTML page. A value of NO enables the index and the value YES disables
+# it. Since the tabs in the index contain the same information as the navigation
+# tree, you can set this option to YES if you also set GENERATE_TREEVIEW to YES.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+DISABLE_INDEX          = NO
+
+# The GENERATE_TREEVIEW tag is used to specify whether a tree-like index
+# structure should be generated to display hierarchical information. If the tag
+# value is set to YES, a side panel will be generated containing a tree-like
+# index structure (just like the one that is generated for HTML Help). For this
+# to work a browser that supports JavaScript, DHTML, CSS and frames is required
+# (i.e. any modern browser). Windows users are probably better off using the
+# HTML help feature. Via custom stylesheets (see HTML_EXTRA_STYLESHEET) one can
+# further fine-tune the look of the index. As an example, the default style
+# sheet generated by doxygen has an example that shows how to put an image at
+# the root of the tree instead of the PROJECT_NAME. Since the tree basically has
+# the same information as the tab index, you could consider setting
+# DISABLE_INDEX to YES when enabling this option.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+GENERATE_TREEVIEW      = YES
+
+# The ENUM_VALUES_PER_LINE tag can be used to set the number of enum values that
+# doxygen will group on one line in the generated HTML documentation.
+#
+# Note that a value of 0 will completely suppress the enum values from appearing
+# in the overview section.
+# Minimum value: 0, maximum value: 20, default value: 4.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+ENUM_VALUES_PER_LINE   = 4
+
+# If the treeview is enabled (see GENERATE_TREEVIEW) then this tag can be used
+# to set the initial width (in pixels) of the frame in which the tree is shown.
+# Minimum value: 0, maximum value: 1500, default value: 250.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+TREEVIEW_WIDTH         = 250
+
+# When the EXT_LINKS_IN_WINDOW option is set to YES doxygen will open links to
+# external symbols imported via tag files in a separate window.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+EXT_LINKS_IN_WINDOW    = NO
+
+# Use this tag to change the font size of LaTeX formulas included as images in
+# the HTML documentation. When you change the font size after a successful
+# doxygen run you need to manually remove any form_*.png images from the HTML
+# output directory to force them to be regenerated.
+# Minimum value: 8, maximum value: 50, default value: 10.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+FORMULA_FONTSIZE       = 10
+
+# Use the FORMULA_TRANPARENT tag to determine whether or not the images
+# generated for formulas are transparent PNGs. Transparent PNGs are not
+# supported properly for IE 6.0, but are supported on all modern browsers.
+#
+# Note that when changing this option you need to delete any form_*.png files in
+# the HTML output directory before the changes have effect.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+FORMULA_TRANSPARENT    = YES
+
+# Enable the USE_MATHJAX option to render LaTeX formulas using MathJax (see
+# http://www.mathjax.org) which uses client side Javascript for the rendering
+# instead of using prerendered bitmaps. Use this if you do not have LaTeX
+# installed or if you want to formulas look prettier in the HTML output. When
+# enabled you may also need to install MathJax separately and configure the path
+# to it using the MATHJAX_RELPATH option.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+USE_MATHJAX            = NO
+
+# When MathJax is enabled you can set the default output format to be used for
+# the MathJax output. See the MathJax site (see:
+# http://docs.mathjax.org/en/latest/output.html) for more details.
+# Possible values are: HTML-CSS (which is slower, but has the best
+# compatibility), NativeMML (i.e. MathML) and SVG.
+# The default value is: HTML-CSS.
+# This tag requires that the tag USE_MATHJAX is set to YES.
+
+MATHJAX_FORMAT         = HTML-CSS
+
+# When MathJax is enabled you need to specify the location relative to the HTML
+# output directory using the MATHJAX_RELPATH option. The destination directory
+# should contain the MathJax.js script. For instance, if the mathjax directory
+# is located at the same level as the HTML output directory, then
+# MATHJAX_RELPATH should be ../mathjax. The default value points to the MathJax
+# Content Delivery Network so you can quickly see the result without installing
+# MathJax. However, it is strongly recommended to install a local copy of
+# MathJax from http://www.mathjax.org before deployment.
+# The default value is: http://cdn.mathjax.org/mathjax/latest.
+# This tag requires that the tag USE_MATHJAX is set to YES.
+
+MATHJAX_RELPATH        = http://cdn.mathjax.org/mathjax/latest
+
+# The MATHJAX_EXTENSIONS tag can be used to specify one or more MathJax
+# extension names that should be enabled during MathJax rendering. For example
+# MATHJAX_EXTENSIONS = TeX/AMSmath TeX/AMSsymbols
+# This tag requires that the tag USE_MATHJAX is set to YES.
+
+MATHJAX_EXTENSIONS     =
+
+# The MATHJAX_CODEFILE tag can be used to specify a file with javascript pieces
+# of code that will be used on startup of the MathJax code. See the MathJax site
+# (see: http://docs.mathjax.org/en/latest/output.html) for more details. For an
+# example see the documentation.
+# This tag requires that the tag USE_MATHJAX is set to YES.
+
+MATHJAX_CODEFILE       =
+
+# When the SEARCHENGINE tag is enabled doxygen will generate a search box for
+# the HTML output. The underlying search engine uses javascript and DHTML and
+# should work on any modern browser. Note that when using HTML help
+# (GENERATE_HTMLHELP), Qt help (GENERATE_QHP), or docsets (GENERATE_DOCSET)
+# there is already a search function so this one should typically be disabled.
+# For large projects the javascript based search engine can be slow, then
+# enabling SERVER_BASED_SEARCH may provide a better solution. It is possible to
+# search using the keyboard; to jump to the search box use <access key> + S
+# (what the <access key> is depends on the OS and browser, but it is typically
+# <CTRL>, <ALT>/<option>, or both). Inside the search box use the <cursor down
+# key> to jump into the search results window, the results can be navigated
+# using the <cursor keys>. Press <Enter> to select an item or <escape> to cancel
+# the search. The filter options can be selected when the cursor is inside the
+# search box by pressing <Shift>+<cursor down>. Also here use the <cursor keys>
+# to select a filter and <Enter> or <escape> to activate or cancel the filter
+# option.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_HTML is set to YES.
+
+SEARCHENGINE           = NO
+
+# When the SERVER_BASED_SEARCH tag is enabled the search engine will be
+# implemented using a web server instead of a web client using Javascript. There
+# are two flavours of web server based searching depending on the
+# EXTERNAL_SEARCH setting. When disabled, doxygen will generate a PHP script for
+# searching and an index file used by the script. When EXTERNAL_SEARCH is
+# enabled the indexing and searching needs to be provided by external tools. See
+# the section "External Indexing and Searching" for details.
+# The default value is: NO.
+# This tag requires that the tag SEARCHENGINE is set to YES.
+
+SERVER_BASED_SEARCH    = NO
+
+# When EXTERNAL_SEARCH tag is enabled doxygen will no longer generate the PHP
+# script for searching. Instead the search results are written to an XML file
+# which needs to be processed by an external indexer. Doxygen will invoke an
+# external search engine pointed to by the SEARCHENGINE_URL option to obtain the
+# search results.
+#
+# Doxygen ships with an example indexer ( doxyindexer) and search engine
+# (doxysearch.cgi) which are based on the open source search engine library
+# Xapian (see: http://xapian.org/).
+#
+# See the section "External Indexing and Searching" for details.
+# The default value is: NO.
+# This tag requires that the tag SEARCHENGINE is set to YES.
+
+EXTERNAL_SEARCH        = NO
+
+# The SEARCHENGINE_URL should point to a search engine hosted by a web server
+# which will return the search results when EXTERNAL_SEARCH is enabled.
+#
+# Doxygen ships with an example indexer ( doxyindexer) and search engine
+# (doxysearch.cgi) which are based on the open source search engine library
+# Xapian (see: http://xapian.org/). See the section "External Indexing and
+# Searching" for details.
+# This tag requires that the tag SEARCHENGINE is set to YES.
+
+SEARCHENGINE_URL       =
+
+# When SERVER_BASED_SEARCH and EXTERNAL_SEARCH are both enabled the unindexed
+# search data is written to a file for indexing by an external tool. With the
+# SEARCHDATA_FILE tag the name of this file can be specified.
+# The default file is: searchdata.xml.
+# This tag requires that the tag SEARCHENGINE is set to YES.
+
+SEARCHDATA_FILE        = searchdata.xml
+
+# When SERVER_BASED_SEARCH and EXTERNAL_SEARCH are both enabled the
+# EXTERNAL_SEARCH_ID tag can be used as an identifier for the project. This is
+# useful in combination with EXTRA_SEARCH_MAPPINGS to search through multiple
+# projects and redirect the results back to the right project.
+# This tag requires that the tag SEARCHENGINE is set to YES.
+
+EXTERNAL_SEARCH_ID     =
+
+# The EXTRA_SEARCH_MAPPINGS tag can be used to enable searching through doxygen
+# projects other than the one defined by this configuration file, but that are
+# all added to the same external search index. Each project needs to have a
+# unique id set via EXTERNAL_SEARCH_ID. The search mapping then maps the id of
+# to a relative location where the documentation can be found. The format is:
+# EXTRA_SEARCH_MAPPINGS = tagname1=loc1 tagname2=loc2 ...
+# This tag requires that the tag SEARCHENGINE is set to YES.
+
+EXTRA_SEARCH_MAPPINGS  =
+
+#---------------------------------------------------------------------------
+# Configuration options related to the LaTeX output
+#---------------------------------------------------------------------------
+
+# If the GENERATE_LATEX tag is set to YES doxygen will generate LaTeX output.
+# The default value is: YES.
+
+GENERATE_LATEX         = NO
+
+# The LATEX_OUTPUT tag is used to specify where the LaTeX docs will be put. If a
+# relative path is entered the value of OUTPUT_DIRECTORY will be put in front of
+# it.
+# The default directory is: latex.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_OUTPUT           = latex
+
+# The LATEX_CMD_NAME tag can be used to specify the LaTeX command name to be
+# invoked.
+#
+# Note that when enabling USE_PDFLATEX this option is only used for generating
+# bitmaps for formulas in the HTML output, but not in the Makefile that is
+# written to the output directory.
+# The default file is: latex.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_CMD_NAME         =
+
+# The MAKEINDEX_CMD_NAME tag can be used to specify the command name to generate
+# index for LaTeX.
+# The default file is: makeindex.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+MAKEINDEX_CMD_NAME     =
+
+# If the COMPACT_LATEX tag is set to YES doxygen generates more compact LaTeX
+# documents. This may be useful for small projects and may help to save some
+# trees in general.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+COMPACT_LATEX          = YES
+
+# The PAPER_TYPE tag can be used to set the paper type that is used by the
+# printer.
+# Possible values are: a4 (210 x 297 mm), letter (8.5 x 11 inches), legal (8.5 x
+# 14 inches) and executive (7.25 x 10.5 inches).
+# The default value is: a4.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+PAPER_TYPE             = a4
+
+# The EXTRA_PACKAGES tag can be used to specify one or more LaTeX package names
+# that should be included in the LaTeX output. To get the times font for
+# instance you can specify
+# EXTRA_PACKAGES=times
+# If left blank no extra packages will be included.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+EXTRA_PACKAGES         =
+
+# The LATEX_HEADER tag can be used to specify a personal LaTeX header for the
+# generated LaTeX document. The header should contain everything until the first
+# chapter. If it is left blank doxygen will generate a standard header. See
+# section "Doxygen usage" for information on how to let doxygen write the
+# default header to a separate file.
+#
+# Note: Only use a user-defined header if you know what you are doing! The
+# following commands have a special meaning inside the header: $title,
+# $datetime, $date, $doxygenversion, $projectname, $projectnumber. Doxygen will
+# replace them by respectively the title of the page, the current date and time,
+# only the current date, the version number of doxygen, the project name (see
+# PROJECT_NAME), or the project number (see PROJECT_NUMBER).
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_HEADER           =
+
+# The LATEX_FOOTER tag can be used to specify a personal LaTeX footer for the
+# generated LaTeX document. The footer should contain everything after the last
+# chapter. If it is left blank doxygen will generate a standard footer.
+#
+# Note: Only use a user-defined footer if you know what you are doing!
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_FOOTER           =
+
+# The LATEX_EXTRA_FILES tag can be used to specify one or more extra images or
+# other source files which should be copied to the LATEX_OUTPUT output
+# directory. Note that the files will be copied as-is; there are no commands or
+# markers available.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_EXTRA_FILES      =
+
+# If the PDF_HYPERLINKS tag is set to YES, the LaTeX that is generated is
+# prepared for conversion to PDF (using ps2pdf or pdflatex). The PDF file will
+# contain links (just like the HTML output) instead of page references. This
+# makes the output suitable for online browsing using a PDF viewer.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+PDF_HYPERLINKS         = YES
+
+# If the LATEX_PDFLATEX tag is set to YES, doxygen will use pdflatex to generate
+# the PDF file directly from the LaTeX files. Set this option to YES to get a
+# higher quality PDF documentation.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+USE_PDFLATEX           = YES
+
+# If the LATEX_BATCHMODE tag is set to YES, doxygen will add the \batchmode
+# command to the generated LaTeX files. This will instruct LaTeX to keep running
+# if errors occur, instead of asking the user for help. This option is also used
+# when generating formulas in HTML.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_BATCHMODE        = YES
+
+# If the LATEX_HIDE_INDICES tag is set to YES then doxygen will not include the
+# index chapters (such as File Index, Compound Index, etc.) in the output.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_HIDE_INDICES     = NO
+
+# If the LATEX_SOURCE_CODE tag is set to YES then doxygen will include source
+# code with syntax highlighting in the LaTeX output.
+#
+# Note that which sources are shown also depends on other settings such as
+# SOURCE_BROWSER.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_SOURCE_CODE      = NO
+
+# The LATEX_BIB_STYLE tag can be used to specify the style to use for the
+# bibliography, e.g. plainnat, or ieeetr. See
+# http://en.wikipedia.org/wiki/BibTeX and \cite for more info.
+# The default value is: plain.
+# This tag requires that the tag GENERATE_LATEX is set to YES.
+
+LATEX_BIB_STYLE        = plain
+
+#---------------------------------------------------------------------------
+# Configuration options related to the RTF output
+#---------------------------------------------------------------------------
+
+# If the GENERATE_RTF tag is set to YES doxygen will generate RTF output. The
+# RTF output is optimized for Word 97 and may not look too pretty with other RTF
+# readers/editors.
+# The default value is: NO.
+
+GENERATE_RTF           = NO
+
+# The RTF_OUTPUT tag is used to specify where the RTF docs will be put. If a
+# relative path is entered the value of OUTPUT_DIRECTORY will be put in front of
+# it.
+# The default directory is: rtf.
+# This tag requires that the tag GENERATE_RTF is set to YES.
+
+RTF_OUTPUT             = rtf
+
+# If the COMPACT_RTF tag is set to YES doxygen generates more compact RTF
+# documents. This may be useful for small projects and may help to save some
+# trees in general.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_RTF is set to YES.
+
+COMPACT_RTF            = YES
+
+# If the RTF_HYPERLINKS tag is set to YES, the RTF that is generated will
+# contain hyperlink fields. The RTF file will contain links (just like the HTML
+# output) instead of page references. This makes the output suitable for online
+# browsing using Word or some other Word compatible readers that support those
+# fields.
+#
+# Note: WordPad (write) and others do not support links.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_RTF is set to YES.
+
+RTF_HYPERLINKS         = NO
+
+# Load stylesheet definitions from file. Syntax is similar to doxygen's config
+# file, i.e. a series of assignments. You only have to provide replacements,
+# missing definitions are set to their default value.
+#
+# See also section "Doxygen usage" for information on how to generate the
+# default style sheet that doxygen normally uses.
+# This tag requires that the tag GENERATE_RTF is set to YES.
+
+RTF_STYLESHEET_FILE    =
+
+# Set optional variables used in the generation of an RTF document. Syntax is
+# similar to doxygen's config file. A template extensions file can be generated
+# using doxygen -e rtf extensionFile.
+# This tag requires that the tag GENERATE_RTF is set to YES.
+
+RTF_EXTENSIONS_FILE    =
+
+#---------------------------------------------------------------------------
+# Configuration options related to the man page output
+#---------------------------------------------------------------------------
+
+# If the GENERATE_MAN tag is set to YES doxygen will generate man pages for
+# classes and files.
+# The default value is: NO.
+
+GENERATE_MAN           = @GENERATE_MAN@
+
+# The MAN_OUTPUT tag is used to specify where the man pages will be put. If a
+# relative path is entered the value of OUTPUT_DIRECTORY will be put in front of
+# it. A directory man3 will be created inside the directory specified by
+# MAN_OUTPUT.
+# The default directory is: man.
+# This tag requires that the tag GENERATE_MAN is set to YES.
+
+MAN_OUTPUT             = man
+
+# The MAN_EXTENSION tag determines the extension that is added to the generated
+# man pages. In case the manual section does not start with a number, the number
+# 3 is prepended. The dot (.) at the beginning of the MAN_EXTENSION tag is
+# optional.
+# The default value is: .3.
+# This tag requires that the tag GENERATE_MAN is set to YES.
+
+MAN_EXTENSION          = .3
+
+# If the MAN_LINKS tag is set to YES and doxygen generates man output, then it
+# will generate one additional man file for each entity documented in the real
+# man page(s). These additional files only source the real man page, but without
+# them the man command would be unable to find the correct page.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_MAN is set to YES.
+
+MAN_LINKS              = NO
+
+#---------------------------------------------------------------------------
+# Configuration options related to the XML output
+#---------------------------------------------------------------------------
+
+# If the GENERATE_XML tag is set to YES doxygen will generate an XML file that
+# captures the structure of the code including all documentation.
+# The default value is: NO.
+
+GENERATE_XML           = NO
+
+# The XML_OUTPUT tag is used to specify where the XML pages will be put. If a
+# relative path is entered the value of OUTPUT_DIRECTORY will be put in front of
+# it.
+# The default directory is: xml.
+# This tag requires that the tag GENERATE_XML is set to YES.
+
+XML_OUTPUT             = xml
+
+# The XML_SCHEMA tag can be used to specify a XML schema, which can be used by a
+# validating XML parser to check the syntax of the XML files.
+# This tag requires that the tag GENERATE_XML is set to YES.
+
+XML_SCHEMA             =
+
+# The XML_DTD tag can be used to specify a XML DTD, which can be used by a
+# validating XML parser to check the syntax of the XML files.
+# This tag requires that the tag GENERATE_XML is set to YES.
+
+XML_DTD                =
+
+# If the XML_PROGRAMLISTING tag is set to YES doxygen will dump the program
+# listings (including syntax highlighting and cross-referencing information) to
+# the XML output. Note that enabling this will significantly increase the size
+# of the XML output.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_XML is set to YES.
+
+XML_PROGRAMLISTING     = YES
+
+#---------------------------------------------------------------------------
+# Configuration options related to the DOCBOOK output
+#---------------------------------------------------------------------------
+
+# If the GENERATE_DOCBOOK tag is set to YES doxygen will generate Docbook files
+# that can be used to generate PDF.
+# The default value is: NO.
+
+GENERATE_DOCBOOK       = NO
+
+# The DOCBOOK_OUTPUT tag is used to specify where the Docbook pages will be put.
+# If a relative path is entered the value of OUTPUT_DIRECTORY will be put in
+# front of it.
+# The default directory is: docbook.
+# This tag requires that the tag GENERATE_DOCBOOK is set to YES.
+
+DOCBOOK_OUTPUT         = docbook
+
+#---------------------------------------------------------------------------
+# Configuration options for the AutoGen Definitions output
+#---------------------------------------------------------------------------
+
+# If the GENERATE_AUTOGEN_DEF tag is set to YES doxygen will generate an AutoGen
+# Definitions (see http://autogen.sf.net) file that captures the structure of
+# the code including all documentation. Note that this feature is still
+# experimental and incomplete at the moment.
+# The default value is: NO.
+
+GENERATE_AUTOGEN_DEF   = NO
+
+#---------------------------------------------------------------------------
+# Configuration options related to the Perl module output
+#---------------------------------------------------------------------------
+
+# If the GENERATE_PERLMOD tag is set to YES doxygen will generate a Perl module
+# file that captures the structure of the code including all documentation.
+#
+# Note that this feature is still experimental and incomplete at the moment.
+# The default value is: NO.
+
+GENERATE_PERLMOD       = NO
+
+# If the PERLMOD_LATEX tag is set to YES doxygen will generate the necessary
+# Makefile rules, Perl scripts and LaTeX code to be able to generate PDF and DVI
+# output from the Perl module output.
+# The default value is: NO.
+# This tag requires that the tag GENERATE_PERLMOD is set to YES.
+
+PERLMOD_LATEX          = NO
+
+# If the PERLMOD_PRETTY tag is set to YES the Perl module output will be nicely
+# formatted so it can be parsed by a human reader. This is useful if you want to
+# understand what is going on. On the other hand, if this tag is set to NO the
+# size of the Perl module output will be much smaller and Perl will parse it
+# just the same.
+# The default value is: YES.
+# This tag requires that the tag GENERATE_PERLMOD is set to YES.
+
+PERLMOD_PRETTY         = YES
+
+# The names of the make variables in the generated doxyrules.make file are
+# prefixed with the string contained in PERLMOD_MAKEVAR_PREFIX. This is useful
+# so different doxyrules.make files included by the same Makefile don't
+# overwrite each other's variables.
+# This tag requires that the tag GENERATE_PERLMOD is set to YES.
+
+PERLMOD_MAKEVAR_PREFIX =
+
+#---------------------------------------------------------------------------
+# Configuration options related to the preprocessor
+#---------------------------------------------------------------------------
+
+# If the ENABLE_PREPROCESSING tag is set to YES doxygen will evaluate all
+# C-preprocessor directives found in the sources and include files.
+# The default value is: YES.
+
+ENABLE_PREPROCESSING   = YES
+
+# If the MACRO_EXPANSION tag is set to YES doxygen will expand all macro names
+# in the source code. If set to NO only conditional compilation will be
+# performed. Macro expansion can be done in a controlled way by setting
+# EXPAND_ONLY_PREDEF to YES.
+# The default value is: NO.
+# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
+
+MACRO_EXPANSION        = YES
+
+# If the EXPAND_ONLY_PREDEF and MACRO_EXPANSION tags are both set to YES then
+# the macro expansion is limited to the macros specified with the PREDEFINED and
+# EXPAND_AS_DEFINED tags.
+# The default value is: NO.
+# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
+
+EXPAND_ONLY_PREDEF     = YES
+
+# If the SEARCH_INCLUDES tag is set to YES the includes files in the
+# INCLUDE_PATH will be searched if a #include is found.
+# The default value is: YES.
+# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
+
+SEARCH_INCLUDES        = YES
+
+# The INCLUDE_PATH tag can be used to specify one or more directories that
+# contain include files that are not input files but should be processed by the
+# preprocessor.
+# This tag requires that the tag SEARCH_INCLUDES is set to YES.
+
+INCLUDE_PATH           = .
+
+# You can use the INCLUDE_FILE_PATTERNS tag to specify one or more wildcard
+# patterns (like *.h and *.hpp) to filter out the header-files in the
+# directories. If left blank, the patterns specified with FILE_PATTERNS will be
+# used.
+# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
+
+INCLUDE_FILE_PATTERNS  =
+
+# The PREDEFINED tag can be used to specify one or more macro names that are
+# defined before the preprocessor is started (similar to the -D option of e.g.
+# gcc). The argument of the tag is a list of macros of the form: name or
+# name=definition (no spaces). If the definition and the "=" are omitted, "=1"
+# is assumed. To prevent a macro definition from being undefined via #undef or
+# recursively expanded use the := operator instead of the = operator.
+# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
+
+PREDEFINED             = _DOXYGEN \
+			 __attribute__(x)= \
+			 __cdecl=
+
+# If the MACRO_EXPANSION and EXPAND_ONLY_PREDEF tags are set to YES then this
+# tag can be used to specify a list of macro names that should be expanded. The
+# macro definition that is found in the sources will be used. Use the PREDEFINED
+# tag if you want to use a different macro definition that overrules the
+# definition found in the source code.
+# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
+
+EXPAND_AS_DEFINED      = EASY_TYPE \
+                         EASY_DESTRUCTOR \
+                         EASY_METHOD
+
+# If the SKIP_FUNCTION_MACROS tag is set to YES then doxygen's preprocessor will
+# remove all refrences to function-like macros that are alone on a line, have an
+# all uppercase name, and do not end with a semicolon. Such function macros are
+# typically used for boiler-plate code, and will confuse the parser if not
+# removed.
+# The default value is: YES.
+# This tag requires that the tag ENABLE_PREPROCESSING is set to YES.
+
+SKIP_FUNCTION_MACROS   = YES
+
+#---------------------------------------------------------------------------
+# Configuration options related to external references
+#---------------------------------------------------------------------------
+
+# The TAGFILES tag can be used to specify one or more tag files. For each tag
+# file the location of the external documentation should be added. The format of
+# a tag file without this location is as follows:
+# TAGFILES = file1 file2 ...
+# Adding location for the tag files is done as follows:
+# TAGFILES = file1=loc1 "file2 = loc2" ...
+# where loc1 and loc2 can be relative or absolute paths or URLs. See the
+# section "Linking to external documentation" for more information about the use
+# of tag files.
+# Note: Each tag file must have an unique name (where the name does NOT include
+# the path). If a tag file is not located in the directory in which doxygen is
+# run, you must also specify the path to the tagfile here.
+
+TAGFILES               =
+
+# When a file name is specified after GENERATE_TAGFILE, doxygen will create a
+# tag file that is based on the input files it reads. See section "Linking to
+# external documentation" for more information about the usage of tag files.
+
+GENERATE_TAGFILE       = @DOCDIR@/@PROJECT@.tag
+
+# If the ALLEXTERNALS tag is set to YES all external class will be listed in the
+# class index. If set to NO only the inherited external classes will be listed.
+# The default value is: NO.
+
+ALLEXTERNALS           = NO
+
+# If the EXTERNAL_GROUPS tag is set to YES all external groups will be listed in
+# the modules index. If set to NO, only the current project's groups will be
+# listed.
+# The default value is: YES.
+
+EXTERNAL_GROUPS        = YES
+
+# If the EXTERNAL_PAGES tag is set to YES all external pages will be listed in
+# the related pages index. If set to NO, only the current project's pages will
+# be listed.
+# The default value is: YES.
+
+EXTERNAL_PAGES         = YES
+
+# The PERL_PATH should be the absolute path and name of the perl script
+# interpreter (i.e. the result of 'which perl').
+# The default file (with absolute path) is: /usr/bin/perl.
+
+PERL_PATH              = /usr/bin/false
+
+#---------------------------------------------------------------------------
+# Configuration options related to the dot tool
+#---------------------------------------------------------------------------
+
+# If the CLASS_DIAGRAMS tag is set to YES doxygen will generate a class diagram
+# (in HTML and LaTeX) for classes with base or super classes. Setting the tag to
+# NO turns the diagrams off. Note that this option also works with HAVE_DOT
+# disabled, but it is recommended to install and use dot, since it yields more
+# powerful graphs.
+# The default value is: YES.
+
+CLASS_DIAGRAMS         = YES
+
+# You can define message sequence charts within doxygen comments using the \msc
+# command. Doxygen will then run the mscgen tool (see:
+# http://www.mcternan.me.uk/mscgen/)) to produce the chart and insert it in the
+# documentation. The MSCGEN_PATH tag allows you to specify the directory where
+# the mscgen tool resides. If left empty the tool is assumed to be found in the
+# default search path.
+
+MSCGEN_PATH            =
+
+# You can include diagrams made with dia in doxygen documentation. Doxygen will
+# then run dia to produce the diagram and insert it in the documentation. The
+# DIA_PATH tag allows you to specify the directory where the dia binary resides.
+# If left empty dia is assumed to be found in the default search path.
+
+DIA_PATH               =
+
+# If set to YES, the inheritance and collaboration graphs will hide inheritance
+# and usage relations if the target is undocumented or is not a class.
+# The default value is: YES.
+
+HIDE_UNDOC_RELATIONS   = YES
+
+# If you set the HAVE_DOT tag to YES then doxygen will assume the dot tool is
+# available from the path. This tool is part of Graphviz (see:
+# http://www.graphviz.org/), a graph visualization toolkit from AT&T and Lucent
+# Bell Labs. The other options in this section have no effect if this option is
+# set to NO
+# The default value is: NO.
+
+HAVE_DOT               = NO
+
+# The DOT_NUM_THREADS specifies the number of dot invocations doxygen is allowed
+# to run in parallel. When set to 0 doxygen will base this on the number of
+# processors available in the system. You can set it explicitly to a value
+# larger than 0 to get control over the balance between CPU load and processing
+# speed.
+# Minimum value: 0, maximum value: 32, default value: 0.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_NUM_THREADS        = 0
+
+# When you want a differently looking font n the dot files that doxygen
+# generates you can specify the font name using DOT_FONTNAME. You need to make
+# sure dot is able to find the font, which can be done by putting it in a
+# standard location or by setting the DOTFONTPATH environment variable or by
+# setting DOT_FONTPATH to the directory containing the font.
+# The default value is: Helvetica.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_FONTNAME           = Helvetica
+
+# The DOT_FONTSIZE tag can be used to set the size (in points) of the font of
+# dot graphs.
+# Minimum value: 4, maximum value: 24, default value: 10.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_FONTSIZE           = 10
+
+# By default doxygen will tell dot to use the default font as specified with
+# DOT_FONTNAME. If you specify a different font using DOT_FONTNAME you can set
+# the path where dot can find it using this tag.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_FONTPATH           =
+
+# If the CLASS_GRAPH tag is set to YES then doxygen will generate a graph for
+# each documented class showing the direct and indirect inheritance relations.
+# Setting this tag to YES will force the CLASS_DIAGRAMS tag to NO.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+CLASS_GRAPH            = YES
+
+# If the COLLABORATION_GRAPH tag is set to YES then doxygen will generate a
+# graph for each documented class showing the direct and indirect implementation
+# dependencies (inheritance, containment, and class references variables) of the
+# class with other documented classes.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+COLLABORATION_GRAPH    = YES
+
+# If the GROUP_GRAPHS tag is set to YES then doxygen will generate a graph for
+# groups, showing the direct groups dependencies.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+GROUP_GRAPHS           = YES
+
+# If the UML_LOOK tag is set to YES doxygen will generate inheritance and
+# collaboration diagrams in a style similar to the OMG's Unified Modeling
+# Language.
+# The default value is: NO.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+UML_LOOK               = NO
+
+# If the UML_LOOK tag is enabled, the fields and methods are shown inside the
+# class node. If there are many fields or methods and many nodes the graph may
+# become too big to be useful. The UML_LIMIT_NUM_FIELDS threshold limits the
+# number of items for each type to make the size more manageable. Set this to 0
+# for no limit. Note that the threshold may be exceeded by 50% before the limit
+# is enforced. So when you set the threshold to 10, up to 15 fields may appear,
+# but if the number exceeds 15, the total amount of fields shown is limited to
+# 10.
+# Minimum value: 0, maximum value: 100, default value: 10.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+UML_LIMIT_NUM_FIELDS   = 10
+
+# If the TEMPLATE_RELATIONS tag is set to YES then the inheritance and
+# collaboration graphs will show the relations between templates and their
+# instances.
+# The default value is: NO.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+TEMPLATE_RELATIONS     = YES
+
+# If the INCLUDE_GRAPH, ENABLE_PREPROCESSING and SEARCH_INCLUDES tags are set to
+# YES then doxygen will generate a graph for each documented file showing the
+# direct and indirect include dependencies of the file with other documented
+# files.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+INCLUDE_GRAPH          = YES
+
+# If the INCLUDED_BY_GRAPH, ENABLE_PREPROCESSING and SEARCH_INCLUDES tags are
+# set to YES then doxygen will generate a graph for each documented file showing
+# the direct and indirect include dependencies of the file with other documented
+# files.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+INCLUDED_BY_GRAPH      = YES
+
+# If the CALL_GRAPH tag is set to YES then doxygen will generate a call
+# dependency graph for every global function or class method.
+#
+# Note that enabling this option will significantly increase the time of a run.
+# So in most cases it will be better to enable call graphs for selected
+# functions only using the \callgraph command.
+# The default value is: NO.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+CALL_GRAPH             = NO
+
+# If the CALLER_GRAPH tag is set to YES then doxygen will generate a caller
+# dependency graph for every global function or class method.
+#
+# Note that enabling this option will significantly increase the time of a run.
+# So in most cases it will be better to enable caller graphs for selected
+# functions only using the \callergraph command.
+# The default value is: NO.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+CALLER_GRAPH           = NO
+
+# If the GRAPHICAL_HIERARCHY tag is set to YES then doxygen will graphical
+# hierarchy of all classes instead of a textual one.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+GRAPHICAL_HIERARCHY    = YES
+
+# If the DIRECTORY_GRAPH tag is set to YES then doxygen will show the
+# dependencies a directory has on other directories in a graphical way. The
+# dependency relations are determined by the #include relations between the
+# files in the directories.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DIRECTORY_GRAPH        = YES
+
+# The DOT_IMAGE_FORMAT tag can be used to set the image format of the images
+# generated by dot.
+# Note: If you choose svg you need to set HTML_FILE_EXTENSION to xhtml in order
+# to make the SVG files visible in IE 9+ (other browsers do not have this
+# requirement).
+# Possible values are: png, jpg, gif and svg.
+# The default value is: png.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_IMAGE_FORMAT       = png
+
+# If DOT_IMAGE_FORMAT is set to svg, then this option can be set to YES to
+# enable generation of interactive SVG images that allow zooming and panning.
+#
+# Note that this requires a modern browser other than Internet Explorer. Tested
+# and working are Firefox, Chrome, Safari, and Opera.
+# Note: For IE 9+ you need to set HTML_FILE_EXTENSION to xhtml in order to make
+# the SVG files visible. Older versions of IE do not have SVG support.
+# The default value is: NO.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+INTERACTIVE_SVG        = NO
+
+# The DOT_PATH tag can be used to specify the path where the dot tool can be
+# found. If left blank, it is assumed the dot tool can be found in the path.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_PATH               =
+
+# The DOTFILE_DIRS tag can be used to specify one or more directories that
+# contain dot files that are included in the documentation (see the \dotfile
+# command).
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOTFILE_DIRS           =
+
+# The MSCFILE_DIRS tag can be used to specify one or more directories that
+# contain msc files that are included in the documentation (see the \mscfile
+# command).
+
+MSCFILE_DIRS           =
+
+# The DIAFILE_DIRS tag can be used to specify one or more directories that
+# contain dia files that are included in the documentation (see the \diafile
+# command).
+
+DIAFILE_DIRS           =
+
+# The DOT_GRAPH_MAX_NODES tag can be used to set the maximum number of nodes
+# that will be shown in the graph. If the number of nodes in a graph becomes
+# larger than this value, doxygen will truncate the graph, which is visualized
+# by representing a node as a red box. Note that doxygen if the number of direct
+# children of the root node in a graph is already larger than
+# DOT_GRAPH_MAX_NODES then the graph will not be shown at all. Also note that
+# the size of a graph can be further restricted by MAX_DOT_GRAPH_DEPTH.
+# Minimum value: 0, maximum value: 10000, default value: 50.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_GRAPH_MAX_NODES    = 50
+
+# The MAX_DOT_GRAPH_DEPTH tag can be used to set the maximum depth of the graphs
+# generated by dot. A depth value of 3 means that only nodes reachable from the
+# root by following a path via at most 3 edges will be shown. Nodes that lay
+# further from the root node will be omitted. Note that setting this option to 1
+# or 2 may greatly reduce the computation time needed for large code bases. Also
+# note that the size of a graph can be further restricted by
+# DOT_GRAPH_MAX_NODES. Using a depth of 0 means no depth restriction.
+# Minimum value: 0, maximum value: 1000, default value: 0.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+MAX_DOT_GRAPH_DEPTH    = 0
+
+# Set the DOT_TRANSPARENT tag to YES to generate images with a transparent
+# background. This is disabled by default, because dot on Windows does not seem
+# to support this out of the box.
+#
+# Warning: Depending on the platform used, enabling this option may lead to
+# badly anti-aliased labels on the edges of a graph (i.e. they become hard to
+# read).
+# The default value is: NO.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_TRANSPARENT        = NO
+
+# Set the DOT_MULTI_TARGETS tag to YES allow dot to generate multiple output
+# files in one run (i.e. multiple -o and -T options on the command line). This
+# makes dot run faster, but since only newer versions of dot (>1.8.10) support
+# this, this feature is disabled by default.
+# The default value is: NO.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_MULTI_TARGETS      = NO
+
+# If the GENERATE_LEGEND tag is set to YES doxygen will generate a legend page
+# explaining the meaning of the various boxes and arrows in the dot generated
+# graphs.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+GENERATE_LEGEND        = YES
+
+# If the DOT_CLEANUP tag is set to YES doxygen will remove the intermediate dot
+# files that are used to generate the various graphs.
+# The default value is: YES.
+# This tag requires that the tag HAVE_DOT is set to YES.
+
+DOT_CLEANUP            = YES
diff --git a/doc/meson.build b/doc/meson.build
new file mode 100644
index 00000000..03c196a7
--- /dev/null
+++ b/doc/meson.build
@@ -0,0 +1,34 @@
+doxygen_doc_option = get_option('doxygen-doc')
+if doxygen_doc_option.disabled() or not prog_doxygen.found()
+    subdir_done()
+endif
+
+cdata = configuration_data()
+cdata.set('DOCDIR', 'doc')
+cdata.set('GENERATE_HTML', get_option('doxygen-html'))
+cdata.set('GENERATE_MAN', get_option('doxygen-man'))
+cdata.set('PROJECT', meson.project_name())
+cdata.set('SRCDIR', meson.source_root())
+cdata.set('VERSION', as_version)
+
+doxyfile = configure_file(input : 'Doxyfile.in',
+                          output : 'Doxyfile',
+                          configuration : cdata)
+
+doxygen_install_dir = join_paths(get_option('datadir'), 'doc',
+                                 '@0@'.format(meson.project_name()))
+
+doxygen_output = []
+if get_option('doxygen-html')
+    doxygen_output += 'html'
+endif
+if get_option('doxygen-man')
+    doxygen_output += 'man'
+endif
+
+custom_target('doxygen',
+              input : doxyfile,
+              output : doxygen_output,
+              command : [prog_doxygen, doxyfile],
+              install : true,
+              install_dir : doxygen_install_dir)
diff --git a/gen-version.sh b/gen-version.sh
new file mode 100755
index 00000000..9223ab7d
--- /dev/null
+++ b/gen-version.sh
@@ -0,0 +1,36 @@
+#!/bin/sh
+# gen-version.sh script taken from the libcamera project.
+# Generate a version string using git describe.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+build_dir="$1"
+
+# Bail out if the directory isn't under git control
+src_dir=$(git rev-parse --git-dir 2>&1) || exit 1
+src_dir=$(readlink -f "$src_dir/..")
+
+# Get a short description from the tree.
+version=$(git describe --abbrev=8 --match "v[0-9]*" 2>/dev/null)
+
+if [ -z "$version" ]
+then
+	# Handle an un-tagged repository
+	sha=$(git describe --abbrev=8 --always 2>/dev/null)
+	commits=$(git log --oneline | wc -l 2>/dev/null)
+	version="v4l-utils-0.0.0-$commits-g$sha"
+fi
+
+# Append a '-dirty' suffix if the working tree is dirty. Prevent false
+# positives due to changed timestamps by running git update-index.
+if [ -z "$build_dir" ] || (echo "$build_dir" | grep -q "$src_dir")
+then
+	git update-index --refresh > /dev/null 2>&1
+fi
+git diff-index --quiet HEAD || version="$version-dirty"
+
+# Replace first '-' with a '+' to denote build metadata, strip the 'g' in from
+# of the git SHA1 and remove the initial 'v'.
+version=$(echo "$version" | sed -e 's/-/+/' | sed -e 's/-g/-/' | cut -c 11-)
+
+echo "$version"
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
index e65066e9..7645de1d 100644
--- a/lib/libdvbv5/Makefile.am
+++ b/lib/libdvbv5/Makefile.am
@@ -121,7 +121,7 @@ libdvbv5_la_CPPFLAGS = -I../.. $(ENFORCE_LIBDVBV5_STATIC) $(LIBUDEV_CFLAGS) $(PT
 libdvbv5_la_LDFLAGS = $(LIBDVBV5_VERSION) $(ENFORCE_LIBDVBV5_STATIC) $(LIBUDEV_LIBS) -lm -lrt
 libdvbv5_la_LIBADD = $(LTLIBICONV)
 
-EXTRA_DIST = README gen_dvb_structs.pl
+EXTRA_DIST = README gen_dvb_structs.pl meson.build
 
 sync-with-kernel:
 	./gen_dvb_structs.pl $(KERNEL_DIR)/usr/include/
diff --git a/lib/libdvbv5/meson.build b/lib/libdvbv5/meson.build
new file mode 100644
index 00000000..8854a801
--- /dev/null
+++ b/lib/libdvbv5/meson.build
@@ -0,0 +1,154 @@
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
diff --git a/lib/libv4l1/Makefile.am b/lib/libv4l1/Makefile.am
index 42cb3dbb..a9e60fb4 100644
--- a/lib/libv4l1/Makefile.am
+++ b/lib/libv4l1/Makefile.am
@@ -26,4 +26,4 @@ v4l1compat_la_LIBADD = libv4l1.la
 v4l1compat_la_LDFLAGS = -avoid-version -module -shared -export-dynamic
 v4l1compat_la_LIBTOOLFLAGS = --tag=disable-static
 
-EXTRA_DIST = libv4l1-kernelcode-license.txt
+EXTRA_DIST = libv4l1-kernelcode-license.txt meson.build
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
diff --git a/lib/libv4l2/Makefile.am b/lib/libv4l2/Makefile.am
index 3a1bb901..0b473782 100644
--- a/lib/libv4l2/Makefile.am
+++ b/lib/libv4l2/Makefile.am
@@ -29,4 +29,4 @@ v4l2convert_la_LIBADD = libv4l2.la
 v4l2convert_la_LDFLAGS = -avoid-version -module -shared -export-dynamic
 v4l2convert_la_LIBTOOLFLAGS = --tag=disable-static
 
-EXTRA_DIST = Android.mk v4l2-plugin-android.c
+EXTRA_DIST = Android.mk v4l2-plugin-android.c meson.build
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
diff --git a/lib/libv4lconvert/Makefile.am b/lib/libv4lconvert/Makefile.am
index f266f3e7..e769d2fd 100644
--- a/lib/libv4lconvert/Makefile.am
+++ b/lib/libv4lconvert/Makefile.am
@@ -33,4 +33,4 @@ ov511_decomp_SOURCES = ov511-decomp.c
 
 ov518_decomp_SOURCES = ov518-decomp.c
 
-EXTRA_DIST = Android.mk
+EXTRA_DIST = Android.mk meson.build
diff --git a/lib/libv4lconvert/meson.build b/lib/libv4lconvert/meson.build
new file mode 100644
index 00000000..2f4b61db
--- /dev/null
+++ b/lib/libv4lconvert/meson.build
@@ -0,0 +1,113 @@
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
+libv4lconvert_c_args = []
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
+    libv4lconvertprivdir = get_option('prefix') / get_option('libdir') / get_option('libv4lconvertsubdir')
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
+    libv4lconvert_c_args += ['-fvisibility=hidden']
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
index 00000000..c9886178
--- /dev/null
+++ b/meson.build
@@ -0,0 +1,263 @@
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
+conf.set_quoted('V4L_UTILS_VERSION', as_version)
+conf.set('PACKAGE_VERSION', as_version)
+conf.set('MAJOR', as_major_version)
+conf.set('MINOR', as_minor_version)
+conf.set('PATCH', as_patch_version)
+
+if have_visibility
+    conf.set('HAVE_VISIBILITY', 1)
+endif
+
+common_arguments = [
+    '-Wpointer-arith',
+    '-D_GNU_SOURCE',
+    '-I.', # Needed for config.h
+    '-DPROMOTED_MODE_T=int',
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
+prog_doxygen = find_program('doxygen', required : get_option('doxygen-doc'))
+prog_grep = find_program('grep')
+prog_perl = find_program('perl')
+
+dep_alsa = dependency('alsa', required : false)
+dep_gl = dependency('gl', required : get_option('qvidcap').enabled() or get_option('qv4l2').enabled())
+dep_glu = dependency('glu', required : false)
+dep_libdl = cc.find_library('dl')
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
+    '/lib64',
+    '/usr/lib64',
+    '/usr/local/lib64',
+    '/lib',
+    '/usr/lib',
+    '/usr/local/lib',
+]
+
+if gconvsysdir == ''
+    foreach dir : gconv_dirs_generic
+        dir = dir / 'gconv'
+        if fs.is_dir(dir)
+            gconvsysdir = dir
+            break
+        endif
+    endforeach
+endif
+
+# Debian/Ubuntu-specific check: should be aligned with the debian package
+gconv_dirs_debian = [
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
+        dir = '/usr' / 'lib' / dir / 'gconv'
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
+version_h = vcs_tag(command : ['gen-version.sh', meson.build_root()],
+                    input : 'version.h.in',
+                    output : 'version.h')
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
+subdir('doc')
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
index 00000000..2c86bfbb
--- /dev/null
+++ b/meson_options.txt
@@ -0,0 +1,50 @@
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
+
+# Doxygen options
+option('doxygen-doc', type : 'feature', value : 'auto',
+       description : 'Generate doxygen project documentation')
+option('doxygen-html', type : 'boolean',
+       description : 'Generate doxygen plain HTML documentation')
+option('doxygen-man', type : 'boolean', value : false,
+       description : 'Generate doxygen manual pages')
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
index e10c624c..a283fe94 100644
--- a/utils/cec-compliance/Makefile.am
+++ b/utils/cec-compliance/Makefile.am
@@ -18,4 +18,4 @@ version.h:
 clean-local:
 	-rm -vf version.h
 
-EXTRA_DIST = cec-compliance.1
+EXTRA_DIST = cec-compliance.1 meson.build
diff --git a/utils/cec-compliance/meson.build b/utils/cec-compliance/meson.build
new file mode 100644
index 00000000..e4fc68de
--- /dev/null
+++ b/utils/cec-compliance/meson.build
@@ -0,0 +1,24 @@
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
+cec_compliance_sources += version_h
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
diff --git a/utils/cec-ctl/Makefile.am b/utils/cec-ctl/Makefile.am
index 24341ed7..47e39829 100644
--- a/utils/cec-ctl/Makefile.am
+++ b/utils/cec-ctl/Makefile.am
@@ -5,4 +5,4 @@ cec_ctl_SOURCES = cec-ctl.cpp cec-pin.cpp cec-ctl.h
 cec_ctl_CPPFLAGS = -I$(top_srcdir)/utils/libcecutil
 cec_ctl_LDADD = -lrt ../libcecutil/libcecutil.la
 
-EXTRA_DIST = cec-ctl.1
+EXTRA_DIST = cec-ctl.1 meson.build
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
diff --git a/utils/cec-follower/Makefile.am b/utils/cec-follower/Makefile.am
index a550cd1d..77ea0f98 100644
--- a/utils/cec-follower/Makefile.am
+++ b/utils/cec-follower/Makefile.am
@@ -18,4 +18,4 @@ version.h:
 clean-local:
 	-rm -vf version.h
 
-EXTRA_DIST = cec-follower.1
+EXTRA_DIST = cec-follower.1 meson.build
diff --git a/utils/cec-follower/meson.build b/utils/cec-follower/meson.build
new file mode 100644
index 00000000..0ecaf7a4
--- /dev/null
+++ b/utils/cec-follower/meson.build
@@ -0,0 +1,21 @@
+cec_follower_sources = files(
+    'cec-follower.cpp',
+    'cec-follower.h',
+    'cec-processing.cpp',
+    'cec-tuner.cpp',
+)
+
+cec_follower_sources += version_h
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
diff --git a/utils/cx18-ctl/Makefile.am b/utils/cx18-ctl/Makefile.am
index 94fce36d..4d2a159a 100644
--- a/utils/cx18-ctl/Makefile.am
+++ b/utils/cx18-ctl/Makefile.am
@@ -1,3 +1,5 @@
 bin_PROGRAMS = cx18-ctl
 
 cx18_ctl_SOURCES = cx18-ctl.c
+
+EXTRA_DIST = meson.build
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
diff --git a/utils/dvb/Makefile.am b/utils/dvb/Makefile.am
index 1895018a..5f99e7be 100644
--- a/utils/dvb/Makefile.am
+++ b/utils/dvb/Makefile.am
@@ -32,4 +32,4 @@ dvbv5_daemon_LDADD = ../../lib/libdvbv5/libdvbv5.la @LIBINTL@ $(LIBUDEV_LIBS) $(
 dvbv5_daemon_LDFLAGS = $(ARGP_LIBS) -lm $(XMLRPC_LDFLAGS) $(PTHREAD_LDFLAGS)
 dvbv5_daemon_CFLAGS =  $(XMLRPC_CFLAGS) $(LIBUDEV_CFLAGS) $(PTHREAD_CFLAGS)
 
-EXTRA_DIST = README
+EXTRA_DIST = README meson.build
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
diff --git a/utils/ivtv-ctl/Makefile.am b/utils/ivtv-ctl/Makefile.am
index c1196673..a8ddc9d2 100644
--- a/utils/ivtv-ctl/Makefile.am
+++ b/utils/ivtv-ctl/Makefile.am
@@ -2,3 +2,5 @@ bin_PROGRAMS = ivtv-ctl
 
 ivtv_ctl_SOURCES = ivtv-ctl.c
 ivtv_ctl_LDFLAGS = -lm
+
+EXTRA_DIST = meson.build
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
diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
index 4724897e..7762a1e4 100644
--- a/utils/keytable/Makefile.am
+++ b/utils/keytable/Makefile.am
@@ -21,7 +21,8 @@ ir_keytable_LDFLAGS += $(LIBELF_LIBS)
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
index 00000000..eb860f3c
--- /dev/null
+++ b/utils/keytable/meson.build
@@ -0,0 +1,74 @@
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
+if not get_option('bpf').disabled() and prog_clang.found() and dep_libelf.found()
+    ir_keytable_sources += files(
+        'bpf.c',
+        'bpf.h',
+        'bpf_load.c',
+        'bpf_load.h',
+    )
+    ir_keytable_deps += [
+        dep_libelf,
+    ]
+    subdir('bpf_protocols')
+endif
+
+ir_keytable_c_args = [
+    '-DIR_KEYTABLE_SYSTEM_DIR="@0@"'.format(ir_keytable_system_dir),
+    '-DIR_KEYTABLE_USER_DIR="@0@"'.format(ir_keytable_user_dir),
+]
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
index 00000000..581bd895
--- /dev/null
+++ b/utils/keytable/rc_keymaps/meson.build
@@ -0,0 +1,147 @@
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
diff --git a/utils/libcecutil/Makefile.am b/utils/libcecutil/Makefile.am
index f2b6e8ba..1de5ca9e 100644
--- a/utils/libcecutil/Makefile.am
+++ b/utils/libcecutil/Makefile.am
@@ -21,4 +21,4 @@ gen.intermediate: cec-gen.pl $(CEC_GEN_PREREQS)
 clean-local:
 	-rm -vf $(CEC_GEN_HDRS)
 
-EXTRA_DIST = cec-gen.pl
+EXTRA_DIST = cec-gen.pl meson.build
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
diff --git a/utils/libmedia_dev/Makefile.am b/utils/libmedia_dev/Makefile.am
index 3796efbd..f4e4a3f4 100644
--- a/utils/libmedia_dev/Makefile.am
+++ b/utils/libmedia_dev/Makefile.am
@@ -4,4 +4,4 @@ libmedia_dev_la_SOURCES = get_media_devices.c get_media_devices.h
 libmedia_dev_la_CPPFLAGS = -static
 libmedia_dev_la_LDFLAGS = -static
 
-EXTRA_DIST = README
+EXTRA_DIST = README meson.build
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
diff --git a/utils/libv4l2util/Makefile.am b/utils/libv4l2util/Makefile.am
index eb11017a..fb25c3b6 100644
--- a/utils/libv4l2util/Makefile.am
+++ b/utils/libv4l2util/Makefile.am
@@ -4,4 +4,4 @@ libv4l2util_la_SOURCES = frequencies.c v4l2_driver.c v4l2_driver.h libv4l2util.h
 libv4l2util_la_CPPFLAGS = -static
 libv4l2util_la_LDFLAGS = -static
 
-EXTRA_DIST = TODO
+EXTRA_DIST = TODO meson.build
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
diff --git a/utils/media-ctl/Makefile.am b/utils/media-ctl/Makefile.am
index ee7dcc96..e4079bc5 100644
--- a/utils/media-ctl/Makefile.am
+++ b/utils/media-ctl/Makefile.am
@@ -27,3 +27,5 @@ noinst_HEADERS = mediactl.h v4l2subdev.h
 bin_PROGRAMS = media-ctl
 media_ctl_SOURCES = media-ctl.c options.c options.h tools.h
 media_ctl_LDADD = libmediactl.la libv4l2subdev.la
+
+EXTRA_DIST = meson.build
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
diff --git a/utils/qv4l2/Makefile.am b/utils/qv4l2/Makefile.am
index ccd1a2ab..c5c948a7 100644
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
diff --git a/utils/qvidcap/Makefile.am b/utils/qvidcap/Makefile.am
index 66038796..ef7ea238 100644
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
diff --git a/utils/rds-ctl/Makefile.am b/utils/rds-ctl/Makefile.am
index 1afdf808..f9685f48 100644
--- a/utils/rds-ctl/Makefile.am
+++ b/utils/rds-ctl/Makefile.am
@@ -3,3 +3,4 @@ bin_PROGRAMS = rds-ctl
 rds_ctl_SOURCES = rds-ctl.cpp
 rds_ctl_LDADD = ../../lib/libv4l2rds/libv4l2rds.la
 
+EXTRA_DIST = meson.build
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
diff --git a/utils/v4l2-compliance/Makefile.am b/utils/v4l2-compliance/Makefile.am
index 5c97cf3b..9a434b80 100644
--- a/utils/v4l2-compliance/Makefile.am
+++ b/utils/v4l2-compliance/Makefile.am
@@ -22,7 +22,7 @@ v4l2_compliance_LDADD = -lrt -lpthread
 DEFS += -DNO_LIBV4L2
 endif
 
-EXTRA_DIST = Android.mk fixme.txt v4l2-compliance.1
+EXTRA_DIST = Android.mk fixme.txt v4l2-compliance.1 meson.build
 
 v4l2-compliance.cpp: version.h
 
diff --git a/utils/v4l2-compliance/meson.build b/utils/v4l2-compliance/meson.build
new file mode 100644
index 00000000..5b03b570
--- /dev/null
+++ b/utils/v4l2-compliance/meson.build
@@ -0,0 +1,60 @@
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
+v4l2_compliance_sources += version_h
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
diff --git a/utils/v4l2-ctl/Makefile.am b/utils/v4l2-ctl/Makefile.am
index 3ba3c96b..59cbd136 100644
--- a/utils/v4l2-ctl/Makefile.am
+++ b/utils/v4l2-ctl/Makefile.am
@@ -41,4 +41,4 @@ v4l2-ctl-32$(EXEEXT): $(addprefix $(top_srcdir)/utils/v4l2-ctl/,$(v4l2_ctl_SOURC
 	$(CXXCOMPILE) -static -m32 -DNO_LIBV4L2 -o $@ -I$(top_srcdir) -I$(top_srcdir)/include -I$(top_srcdir)/utils/common $(addprefix $(top_srcdir)/utils/v4l2-ctl/,$(filter %.cpp,$(v4l2_ctl_SOURCES))) $@.o
 	rm -f $@.c $@.o
 
-EXTRA_DIST = Android.mk v4l2-ctl.1
+EXTRA_DIST = Android.mk v4l2-ctl.1 meson.build
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
diff --git a/utils/v4l2-dbg/Makefile.am b/utils/v4l2-dbg/Makefile.am
index 94a5fb53..0b3dcfaa 100644
--- a/utils/v4l2-dbg/Makefile.am
+++ b/utils/v4l2-dbg/Makefile.am
@@ -1,4 +1,4 @@
 sbin_PROGRAMS = v4l2-dbg
 v4l2_dbg_SOURCES = v4l2-dbg.cpp v4l2-dbg-ac97.h  v4l2-dbg-bttv.h  v4l2-dbg-em28xx.h  v4l2-dbg.h  v4l2-dbg-micron.h  v4l2-dbg-saa7134.h	v4l2-dbg-tvp5150.h
 
-EXTRA_DIST = Android.mk
+EXTRA_DIST = Android.mk meson.build
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
diff --git a/version.h.in b/version.h.in
new file mode 100644
index 00000000..2506ed9b
--- /dev/null
+++ b/version.h.in
@@ -0,0 +1 @@
+#define SHA @VCS_TAG@
-- 
2.26.2

