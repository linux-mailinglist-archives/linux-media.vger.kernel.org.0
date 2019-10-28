Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33643E741E
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2019 15:56:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729708AbfJ1O4G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Oct 2019 10:56:06 -0400
Received: from gofer.mess.org ([88.97.38.141]:37591 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727227AbfJ1O4G (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 10:56:06 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 4CBE6C63A9; Mon, 28 Oct 2019 14:56:04 +0000 (GMT)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v4l-utils] 50-rc_keymap.conf prevents debian testing from booting
Date:   Mon, 28 Oct 2019 14:56:04 +0000
Message-Id: <20191028145604.22907-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If SystemCallFilter is not set for systemd-udevd, then 50-rc_keymap.conf
restricts the service to _only_ the bpf syscall, preventing the system
from booting.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sean Young <sean@mess.org>
---
 configure.ac               | 6 ++++++
 utils/keytable/Makefile.am | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/configure.ac b/configure.ac
index 01a24a28..8585a79d 100644
--- a/configure.ac
+++ b/configure.ac
@@ -521,6 +521,12 @@ AM_CONDITIONAL([WITH_BPF],          [test x$enable_bpf != xno -a x$libelf_pkgcon
 AS_IF([test x$enable_libdvbv5 = xno], [AC_SUBST([ENFORCE_LIBDVBV5_STATIC], ["-static"])])
 AS_IF([test x$enable_libv4l = xno],   [AC_SUBST([ENFORCE_LIBV4L_STATIC],   ["-static"])])
 
+# Since systemd v239, udevd is not allowed to execute BPF systems calls;
+# add an override to allow bpf(2) in that case. On earlier versions, the
+# override will restrict udevd to bpf syscall only and will stop the system
+# from booting. This is also true on current debian versions.
+AM_CONDITIONAL([HAVE_UDEVDSYSCALLFILTER], [grep -s SystemCallFilter $with_systemdsystemunitdir/systemd-udevd.service])
+
 # misc
 
 if test "x$linux_os" = "xyes"; then
diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
index dfcd7609..4724897e 100644
--- a/utils/keytable/Makefile.am
+++ b/utils/keytable/Makefile.am
@@ -3,7 +3,9 @@ man_MANS = ir-keytable.1 rc_keymap.5
 sysconf_DATA = rc_maps.cfg
 keytablesystem_DATA = $(srcdir)/rc_keymaps/*
 udevrules_DATA = 70-infrared.rules
+if HAVE_UDEVDSYSCALLFILTER
 systemdsystemunit_DATA = 50-rc_keymap.conf
+endif
 
 ir_keytable_SOURCES = keytable.c parse.h ir-encode.c ir-encode.h toml.c toml.h keymap.c keymap.h
 
-- 
2.23.0

