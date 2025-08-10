Return-Path: <linux-media+bounces-39350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB230B1FA65
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 16:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78652177901
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 14:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D58265CD8;
	Sun, 10 Aug 2025 14:22:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFC326529E
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 14:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754835745; cv=none; b=CTTBWOJnE3L7KfM4GY05mroC6yH77+N3KFQPJEMLwnDgcrsAuxSAnZ0LaCJ5eDGnuRsKCfAi/7FBUhu7XNjvDH9OmXrL3wfs96jT8emfHkdlUon+NrXgr3+Rf4feJk1CMit3DTNusdMp31G/fRPVcZHm4LnK/WvpdTDSPQ43vfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754835745; c=relaxed/simple;
	bh=TauP+lDGacxqjx3rlv1l3d7IUZQzoAEl60Klvgvg1So=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YM0yBe+INVmRf1vmMnX3i+x7aaiijHi50ghqAkS8DBbI5faxaaQrJxg9Xl/6h0OmaKdH8xCy+5ZSJJw4+qKx85ESlpIvoiy7C5yejZsjbAPK4BCToc/+ODAxDzfh+hRAdkqB6SjQzagghY8lK+6H/EhbDYOzUOt2cgvqResBDRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from symphony.aura.home.arpa (0.4.3.c.c.4.1.f.4.f.8.4.c.f.3.f.c.6.e.0.c.6.2.0.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:26c:e6c:f3fc:48f4:f14c:c340])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: chewi)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 2DBC53410A2;
	Sun, 10 Aug 2025 14:22:23 +0000 (UTC)
From: James Le Cuirot <chewi@gentoo.org>
To: linux-media@vger.kernel.org
Cc: Sam James <sam@gentoo.org>,
	James Le Cuirot <chewi@gentoo.org>
Subject: [PATCH v2] meson: Allow BPF code to be built with GCC
Date: Sun, 10 Aug 2025 15:20:06 +0100
Message-ID: <20250810142005.29811-2-chewi@gentoo.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803081759.13952-1-chewi@gentoo.org>
References: <20250803081759.13952-1-chewi@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC can also target BPF, but it does not understand the "-target bpf"
arguments passed to Clang.

Detect it as either bpf-gcc, bpf-none-gcc, or bpf-unknown-none-gcc, the
same as systemd does.

Determine the include paths with the compiler used by the rest of the
build rather than Clang, which might not be installed or might not give
the right answer, especially when cross-compiling.

Check whether Clang actually supports the BPF target so that
auto-detection doesn't cause the build to fail when it doesn't.

Signed-off-by: James Le Cuirot <chewi@gentoo.org>
---
 meson.build                                   | 25 ++++++++++++++++++-
 .../keytable/bpf_protocols/cc_sys_includes.sh | 10 ++++++++
 .../bpf_protocols/clang_sys_includes.sh       |  9 -------
 utils/keytable/bpf_protocols/meson.build      | 12 ++++-----
 utils/keytable/meson.build                    |  2 +-
 5 files changed, 41 insertions(+), 17 deletions(-)
 create mode 100755 utils/keytable/bpf_protocols/cc_sys_includes.sh
 delete mode 100755 utils/keytable/bpf_protocols/clang_sys_includes.sh

This revision adds the -ftree-switch-conversion flag for GCC, which
reportedly fixes the "invalid mem access" error. I couldn't figure out
how to test without any hardware, so I wasn't able to reproduce the
issue myself, but I trust that it works now.

diff --git a/meson.build b/meson.build
index 88781e59..62d271b4 100644
--- a/meson.build
+++ b/meson.build
@@ -83,11 +83,34 @@ endif
 v4l2_utils_incdir = include_directories(v4l2_utils_incdir_arr)

 prog_bash = find_program('bash')
-prog_clang = find_program('clang', required : get_option('bpf'))
 prog_doxygen = find_program('doxygen', required : get_option('doxygen-doc'))
 prog_grep = find_program('grep')
 prog_perl = find_program('perl')

+if get_option('bpf').allowed()
+    bpf_args = []
+    prog_bpf = find_program('bpf-gcc',
+                            'bpf-none-gcc',
+                            'bpf-unknown-none-gcc',
+                            required : false)
+
+    if prog_bpf.found()
+        bpf_args += ['-fno-tree-switch-conversion']
+    else
+        prog_bpf = find_program('clang', required : get_option('bpf'))
+        if prog_bpf.found()
+            target_bpf = run_command(prog_bpf, '-target', 'bpf', '--print-supported-cpus', check : get_option('bpf').enabled())
+            if target_bpf.returncode() == 0
+                bpf_args += ['-target', 'bpf']
+            else
+                prog_bpf = disabler()
+            endif
+        endif
+    endif
+else
+    prog_bpf = disabler()
+endif
+
 dep_alsa = dependency('alsa', required : false)
 if dep_alsa.found()
     conf.set('HAVE_ALSA', 1)
diff --git a/utils/keytable/bpf_protocols/cc_sys_includes.sh b/utils/keytable/bpf_protocols/cc_sys_includes.sh
new file mode 100755
index 00000000..0a8fa277
--- /dev/null
+++ b/utils/keytable/bpf_protocols/cc_sys_includes.sh
@@ -0,0 +1,10 @@
+#!/bin/sh
+# Get C compiler's default includes on this system, as the BPF toolchain
+# generally doesn't see the Linux headers. This fixes "missing" files on some
+# architectures/distros, such as asm/byteorder.h, asm/socket.h, asm/sockios.h,
+# sys/cdefs.h etc.
+#
+# Use '-idirafter': Don't interfere with include mechanics except where the
+# build would have failed anyways.
+"$@" -v -E - </dev/null 2>&1 \
+	| sed -n '/<...> search starts here:/,/End of search list./{ s| \(/.*\)|-idirafter \1|p }'
diff --git a/utils/keytable/bpf_protocols/clang_sys_includes.sh b/utils/keytable/bpf_protocols/clang_sys_includes.sh
deleted file mode 100755
index 9dc4af12..00000000
--- a/utils/keytable/bpf_protocols/clang_sys_includes.sh
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/bin/sh
-# Get Clang's default includes on this system, as opposed to those seen by
-# '-target bpf'. This fixes "missing" files on some architectures/distros,
-# such as asm/byteorder.h, asm/socket.h, asm/sockios.h, sys/cdefs.h etc.
-#
-# Use '-idirafter': Don't interfere with include mechanics except where the
-# build would have failed anyways.
-$CLANG -v -E - </dev/null 2>&1 \
-	| sed -n '/<...> search starts here:/,/End of search list./{ s| \(/.*\)|-idirafter \1|p }'
diff --git a/utils/keytable/bpf_protocols/meson.build b/utils/keytable/bpf_protocols/meson.build
index 1e4f0064..dbb926c4 100644
--- a/utils/keytable/bpf_protocols/meson.build
+++ b/utils/keytable/bpf_protocols/meson.build
@@ -10,9 +10,9 @@ bpf_protocols_files = [
     'xbox-dvd',
 ]

-clang_sys_includes = run_command('clang_sys_includes.sh',
-                                 check : true,
-                                 env : ['CLANG=' + prog_clang.full_path()])
+bpf_args += run_command('cc_sys_includes.sh',
+                        cc.cmd_array(),
+                        check : true).stdout().split()

 foreach file : bpf_protocols_files
     output = file + '.o'
@@ -21,9 +21,9 @@ foreach file : bpf_protocols_files
                   output : output,
                   input : input,
                   command : [
-                      prog_clang,
-                      clang_sys_includes.stdout().split(),
-                      '-D__linux__', '-fno-stack-protector', '-target', 'bpf',
+                      prog_bpf,
+                      bpf_args,
+                      '-D__linux__', '-fno-stack-protector',
                       '-O2', '-c', '@INPUT@', '-o', '@OUTPUT@',
                   ],
                   install : true,
diff --git a/utils/keytable/meson.build b/utils/keytable/meson.build
index e214e0b5..56e61a79 100644
--- a/utils/keytable/meson.build
+++ b/utils/keytable/meson.build
@@ -22,7 +22,7 @@ ir_keytable_c_args = [
     '-DIR_KEYTABLE_USER_DIR="@0@"'.format(ir_keytable_user_dir),
 ]

-ir_bpf_enabled = prog_clang.found() and dep_libbpf.found() and dep_libelf.found()
+ir_bpf_enabled = prog_bpf.found() and dep_libbpf.found() and dep_libelf.found()

 if ir_bpf_enabled
     ir_keytable_sources += files(
--
2.50.1

