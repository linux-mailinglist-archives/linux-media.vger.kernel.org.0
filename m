Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4FC8E2497
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2019 22:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390461AbfJWU3V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 16:29:21 -0400
Received: from gofer.mess.org ([88.97.38.141]:33001 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388677AbfJWU3V (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 16:29:21 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 1D56311A001; Wed, 23 Oct 2019 21:29:20 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [v4l-utils PATCH] keytable: cannot load BPF decoders from udevd
Date:   Wed, 23 Oct 2019 21:29:19 +0100
Message-Id: <20191023202919.2678-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
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
 v4l-utils.spec.in                | 1 +
 4 files changed, 12 insertions(+), 1 deletion(-)
 create mode 100644 utils/keytable/50-rc_keymap.conf

diff --git a/configure.ac b/configure.ac
index c84067ae..0ba60d4a 100644
--- a/configure.ac
+++ b/configure.ac
@@ -362,6 +362,11 @@ AC_ARG_WITH(udevdir,
    	[],
 	[with_udevdir=`$PKG_CONFIG --variable=udevdir udev || echo /lib/udev`])
 
+AC_ARG_WITH(systemdsystemunitdir,
+	AS_HELP_STRING([--with-systemdsystemunitdir=DIR], [set systemd system unit directory]),
+	[],
+	[with_systemdsystemunitdir=`$PKG_CONFIG --variable=systemdsystemunitdir systemd || echo /usr/lib/systemd/system`])
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
index f1dd0421..77f6b6b8 100644
--- a/v4l-utils.spec.in
+++ b/v4l-utils.spec.in
@@ -153,6 +153,7 @@ gtk-update-icon-cache %{_datadir}/icons/hicolor &>/dev/null || :
 %config(noreplace) %{_sysconfdir}/rc_keymaps/*
 %config(noreplace) %{_sysconfdir}/rc_maps.cfg
 %config(noreplace) %{_sysconfdir}/udev/rules.d/70-infrared.rules
+%{_libdir}/systemd/system/systemd-udevd.service.d/50-rc-keymap.conf
 %{_bindir}/cx18-ctl
 %{_bindir}/ir-keytable
 %{_bindir}/ir-ctl
-- 
2.23.0

