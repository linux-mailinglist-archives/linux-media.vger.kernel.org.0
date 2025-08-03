Return-Path: <linux-media+bounces-38808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8C0B19315
	for <lists+linux-media@lfdr.de>; Sun,  3 Aug 2025 10:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C75CD7AA581
	for <lists+linux-media@lfdr.de>; Sun,  3 Aug 2025 08:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66DC28152A;
	Sun,  3 Aug 2025 08:18:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C6E6ADD
	for <linux-media@vger.kernel.org>; Sun,  3 Aug 2025 08:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754209100; cv=none; b=oRVJlwQusqH5VNgLz804vukHcsFgAPC2glY5VMIH8JoSiFp3BZ5Enn7qDXbdq2M1ehzKHUuduAy4aT4qSHmdfaqY1KaPYgzyYD5PdJjLEScWo1TtsqiX5HBI6szGNr9mmk4NI2vNP4+C5RIitk+Fbx/pvWwj9qCNZdbhQKF5WYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754209100; c=relaxed/simple;
	bh=iO33BcMoM+ih8oBCH5/RlzpqjAtBVSImVotM394Q2/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KDrlbOKgrmgExcQWllDTtrxG34VlYpBhDiu5+M4tIA9l1W8lDpg2n1yV4NGSafaNChWPlgt+R6CZ3EpqQCXbxFPQG1RPcq2xPOMC+284WuzjXLK9Z/rY+fwupixUGEywm64WlgaoA7e0wtkLBhuSLob8weMIoyhjm8Cc/tj4T6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from symphony.aura.home.arpa (a.6.b.d.3.4.1.d.e.4.1.0.f.0.2.f.c.6.e.0.c.6.2.0.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:26c:e6c:f20f:14e:d143:db6a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: chewi)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 62706340D23;
	Sun, 03 Aug 2025 08:18:17 +0000 (UTC)
From: James Le Cuirot <chewi@gentoo.org>
To: linux-media@vger.kernel.org
Cc: Sam James <sam@gentoo.org>,
	James Le Cuirot <chewi@gentoo.org>
Subject: [PATCH] meson: Allow BPF code to be built with GCC
Date: Sun,  3 Aug 2025 09:17:59 +0100
Message-ID: <20250803081759.13952-1-chewi@gentoo.org>
X-Mailer: git-send-email 2.50.1
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

Disclaimer: I haven't actually tested the result of the GCC build.

Signed-off-by: James Le Cuirot <chewi@gentoo.org>
---
 meson.build                                   | 23 ++++++++++++++++++-
 .../keytable/bpf_protocols/cc_sys_includes.sh | 10 ++++++++
 .../bpf_protocols/clang_sys_includes.sh       |  9 --------
 utils/keytable/bpf_protocols/meson.build      | 12 +++++-----
 utils/keytable/meson.build                    |  2 +-
 5 files changed, 39 insertions(+), 17 deletions(-)
 create mode 100755 utils/keytable/bpf_protocols/cc_sys_includes.sh
 delete mode 100755 utils/keytable/bpf_protocols/clang_sys_includes.sh

diff --git a/meson.build b/meson.build
index 88781e59..0aff6970 100644
--- a/meson.build
+++ b/meson.build
@@ -83,11 +83,32 @@ endif
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
+    if not prog_bpf.found()
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


