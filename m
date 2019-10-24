Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAD99E36BF
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 17:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503313AbfJXPdG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 11:33:06 -0400
Received: from gofer.mess.org ([88.97.38.141]:51819 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503311AbfJXPdG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 11:33:06 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 79EE611A002; Thu, 24 Oct 2019 16:33:05 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils v2 2/2] keytable: cannot load BPF decoders from udevd
Date:   Thu, 24 Oct 2019 16:33:05 +0100
Message-Id: <20191024153305.22150-2-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191024153305.22150-1-sean@mess.org>
References: <20191024153305.22150-1-sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

By default udevd is not allowed to execute BPF syscalls. Implement
workaround as suggested in:

	https://github.com/systemd/systemd/issues/13787

Signed-off-by: Sean Young <sean@mess.org>
---
 configure.ac                     | 6 ++++++
 utils/keytable/50-rc_keymap.conf | 3 +++
 utils/keytable/Makefile.am       | 3 ++-
 v4l-utils.spec.in                | 2 ++
 4 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 utils/keytable/50-rc_keymap.conf

diff --git a/configure.ac b/configure.ac
index c84067ae..01a24a28 100644
--- a/configure.ac
+++ b/configure.ac
@@ -362,6 +362,11 @@ AC_ARG_WITH(udevdir,
    	[],
 	[with_udevdir=`$PKG_CONFIG --variable=udevdir udev || echo /lib/udev`])
 
+AC_ARG_WITH(systemdsystemunitdir,
+	AS_HELP_STRING([--with-systemdsystemunitdir=DIR], [set systemd system unit directory]),
+	[],
+	[with_systemdsystemunitdir=`$PKG_CONFIG --variable=systemdsystemunitdir systemd || echo /lib/systemd/system`])
+
 # Generic check: works with most distributions
 def_gconv_dir=`for i in /lib64 /usr/lib64 /usr/local/lib64 /lib /usr/lib /usr/local/lib; do if @<:@ -d \$i/gconv @:>@; then echo \$i/gconv; break; fi; done`
 
@@ -384,6 +389,7 @@ AC_SUBST([libv4lconvertprivdir], [$libdir/$with_libv4lconvertsubdir])
 AC_SUBST([keytablesystemdir], [$with_udevdir/rc_keymaps])
 AC_SUBST([keytableuserdir], [$sysconfdir/rc_keymaps])
 AC_SUBST([udevrulesdir], [$with_udevdir/rules.d])
+AC_SUBST([systemdsystemunitdir], [$with_systemdsystemunitdir/systemd-udevd.service.d/])
 AC_SUBST([pkgconfigdir], [$libdir/pkgconfig])
 AC_SUBST([gconvsysdir], [$with_gconvdir])
 
diff --git a/utils/keytable/50-rc_keymap.conf b/utils/keytable/50-rc_keymap.conf
new file mode 100644
index 00000000..6066c50c
--- /dev/null
+++ b/utils/keytable/50-rc_keymap.conf
@@ -0,0 +1,3 @@
+# ir-keytable needs access to bpf in order load BPF decoders
+[Service]
+SystemCallFilter=bpf
diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
index d7b30e2c..dfcd7609 100644
--- a/utils/keytable/Makefile.am
+++ b/utils/keytable/Makefile.am
@@ -3,6 +3,7 @@ man_MANS = ir-keytable.1 rc_keymap.5
 sysconf_DATA = rc_maps.cfg
 keytablesystem_DATA = $(srcdir)/rc_keymaps/*
 udevrules_DATA = 70-infrared.rules
+systemdsystemunit_DATA = 50-rc_keymap.conf
 
 ir_keytable_SOURCES = keytable.c parse.h ir-encode.c ir-encode.h toml.c toml.h keymap.c keymap.h
 
@@ -18,7 +19,7 @@ ir_keytable_LDFLAGS += $(LIBELF_LIBS)
 SUBDIRS = bpf_protocols
 endif
 
-EXTRA_DIST = 70-infrared.rules rc_keymaps rc_keymaps_userspace gen_input_events.pl gen_keytables.pl ir-keytable.1 rc_maps.cfg rc_keymap.5
+EXTRA_DIST = 70-infrared.rules 50-rc_keymap.conf rc_keymaps rc_keymaps_userspace gen_input_events.pl gen_keytables.pl ir-keytable.1 rc_maps.cfg rc_keymap.5
 
 check:
 	@$(foreach keymap,$(wildcard $(keytablesystem_DATA)),./ir-keytable --test-keymap=$(keymap);)
diff --git a/v4l-utils.spec.in b/v4l-utils.spec.in
index d9d46706..a368d3fe 100644
--- a/v4l-utils.spec.in
+++ b/v4l-utils.spec.in
@@ -121,6 +121,7 @@ make doxygen-run
 
 %install
 %{!?_udevrulesdir: %global _udevrulesdir /lib/udev/rules.d}
+%{!?_systemdsystemunitdir: %global _systemdsystemunitdir /lib/systemd/system}
 %make_install
 find $RPM_BUILD_ROOT -name '*.la' -exec rm -f {} ';'
 rm -f $RPM_BUILD_ROOT%{_libdir}/{v4l1compat.so,v4l2convert.so}
@@ -142,6 +143,7 @@ desktop-file-validate $RPM_BUILD_ROOT%{_datadir}/applications/qv4l2.desktop
 %config(noreplace) %{_sysconfdir}/rc_maps.cfg
 %{_udevrulesdir}/70-infrared.rules
 %{_udevrulesdir}/../rc_keymaps/*
+%{_systemdsystemunitdir}/50-rc_keymap.conf
 %{_bindir}/cx18-ctl
 %{_bindir}/cec*
 %{_bindir}/dvb*
-- 
2.23.0

