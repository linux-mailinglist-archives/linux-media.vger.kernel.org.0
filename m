Return-Path: <linux-media+bounces-8436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDF3895D69
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 22:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F2781C21DB6
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 20:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76E415D5A4;
	Tue,  2 Apr 2024 20:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i8PJ0vKB"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4816D5C8E6
	for <linux-media@vger.kernel.org>; Tue,  2 Apr 2024 20:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712088837; cv=none; b=aegrCKfHP54CLAeREx3sGfQCd9+QgMSeAv3pQBhDvfW+XPNFdG1YrZ/LDdX4cDT1uNHvHHn5yZf/4M5yDDxyioJiYfZn2KImWbKiKE8FmiyAN/OnI9juQEmJl6o4H+rPlsnf4y1LqlhoaUfDRUok6jaXUJQKZ7jHjisLmu6oDZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712088837; c=relaxed/simple;
	bh=/uFz2GQrkXEVmKPiOU4KZpsAcjjTisYS8EsaaAVFOBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p5W8DepZCu+2lFba2ax0W90QAKfgrRRexdx0qsnC2j3Nmhv7Q++n/Y1UV15ZLSQlO4clYyAv8yV39T2A6UaKuDXP8YIBXy1IPkil7t4pap3FsgC5+7T6fL+ji46q6akQW1yomiNcY4HpF0IIVXMownAbsNSu/U+GOtd1yHqkhGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i8PJ0vKB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712088834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=STPA65/L/iVr4IKWwzvbIIQoMjpABjCuHyQllTZ5F9Q=;
	b=i8PJ0vKBhPZ2tjkxssyhiP1dekKT8unvFCL+RxU4OraM2Tc/O6vlhgPo8bwCMOskVhLNFv
	EfBlw7o8Ha/eQu0A5e80X3qq92T/dAvTe7X0jK78hNqFI2gSb5CJIdCTyS0+IBYKy/E0zh
	KvXP8kXJv7oiaDytVp6JDZ2a6qbXZ7c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-ghAWGm4QOFuEMdqRKFitTg-1; Tue, 02 Apr 2024 16:13:53 -0400
X-MC-Unique: ghAWGm4QOFuEMdqRKFitTg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-414aa7bd274so27728645e9.1
        for <linux-media@vger.kernel.org>; Tue, 02 Apr 2024 13:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712088831; x=1712693631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STPA65/L/iVr4IKWwzvbIIQoMjpABjCuHyQllTZ5F9Q=;
        b=b9Ka/E39SVca8mWRoqPpDqDoUGe3TEXjphtC+lCbKpVpqC3M7xJ0TG0p8HI9E9sSNP
         fSu10TNaoEb1FiTrqMqZaPn8qfyANWXElBY1RNkCpSY9f7Bz3QPDufKFPWY/8OxrhILv
         IP++IdlLmG+VfEqIXhj84YiX7tE4JkRF0hfCMlCHL2Mg8LADRGH2fNPrMr8GIUr3TcaW
         KBOZ6VlVg1FC1cAlBoFAnJOuaU2ssBwLddfAAJiHduvQe5nCc3mm5M+RvlHsgbCQ2B9O
         bPGareFcajiU5vbTmHIH0KD+iGWBOh+E/CxyuHSu6EdZakR/iwm2Sb4gmC0aekMD00zQ
         RJgw==
X-Gm-Message-State: AOJu0YxQbuKAm6JnZHj+ur8CdNKyDTwokVPcj9YiMvggHRfm+hC0eHo3
	zJoctLXzCYXYnRIGpEZdp2AI68+yNuWkpGcWh0OgcTYkj9ywnMrrwLvRjdYjD5Z9pj9dFnhar+W
	IrVKvOC5/cXxcepan8MU7PcW17ttT8b5IHlmw83wOHrzw0euqly2a1str2VbMxwXh8jP5DNz81W
	OvQxAuOdxmXeegklR8Fsx0UGf0qNW85qMxNtE10wmHn7OhNswJnyxA
X-Received: by 2002:a05:600c:a4c:b0:413:3941:d9ae with SMTP id c12-20020a05600c0a4c00b004133941d9aemr9657328wmq.31.1712088830883;
        Tue, 02 Apr 2024 13:13:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKYAUecp5gp7LGqrd6bBs58ydvQe8NwpgBjPJbh2x1Xm0M/tl3kgOESQBTzfyJ353U/P6/lg==
X-Received: by 2002:a05:600c:a4c:b0:413:3941:d9ae with SMTP id c12-20020a05600c0a4c00b004133941d9aemr9657316wmq.31.1712088830396;
        Tue, 02 Apr 2024 13:13:50 -0700 (PDT)
Received: from toolbox.fritz.box ([2001:9e8:8986:2d00:eaf4:1368:dd5b:eb36])
        by smtp.gmail.com with ESMTPSA id n38-20020a05600c3ba600b00415509b11c3sm15242845wms.22.2024.04.02.13.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 13:13:49 -0700 (PDT)
From: Sebastian Wick <sebastian.wick@redhat.com>
To: linux-media@vger.kernel.org
Cc: Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v3] edid-decode: build: add support for building with meson
Date: Tue,  2 Apr 2024 22:13:47 +0200
Message-ID: <20240402201348.355618-1-sebastian.wick@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This also removes the old Makefile based build-system.

The immediate reason for adding support for meson is that this allows us
to include edid-decode as a subproject in libdisplay-info.

v3:
 * Declare a meson variable for the executable to make it possible to
   get it via subproject.get_variable()
v2:
 * Remove the make build-system
 * Adjust the README on how to build/install with meson
 * Fix installing for the wasm-build

Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
---
 Makefile                      | 50 ---------------------------
 README                        | 28 +++++++++------
 emscripten/wasm-crossfile.txt | 14 ++++++++
 meson.build                   | 65 +++++++++++++++++++++++++++++++++++
 4 files changed, 96 insertions(+), 61 deletions(-)
 delete mode 100644 Makefile
 create mode 100644 emscripten/wasm-crossfile.txt
 create mode 100644 meson.build

diff --git a/Makefile b/Makefile
deleted file mode 100644
index 375fedb..0000000
--- a/Makefile
+++ /dev/null
@@ -1,50 +0,0 @@
-ifeq ($(OS),Windows_NT)
-	bindir ?= /usr/bin
-	mandir ?= /usr/share/man
-else
-	UNAME_S := $(shell uname -s)
-	ifeq ($(UNAME_S),Darwin)
-		bindir ?= /usr/local/sbin
-		mandir ?= /usr/local/share/man
-	else
-		bindir ?= /usr/bin
-		mandir ?= /usr/share/man
-	endif
-endif
-
-EMXX ?= em++
-
-SOURCES = $(wildcard *.cpp)
-OBJECTS := $(patsubst %.cpp, %.o, $(SOURCES))
-EMOBJECTS := $(patsubst %.cpp, emscripten/%.o, $(SOURCES))
-
-WARN_FLAGS = -Wall -Wextra -Wno-missing-field-initializers -Wno-unused-parameter -Wimplicit-fallthrough
-
-all: edid-decode
-
-sha = -DSHA=$(shell if test -d .git ; then git rev-parse --short=12 HEAD ; fi)
-date = -DDATE=$(shell if test -d .git ; then TZ=UTC git show --quiet --date='format-local:"%F %T"' --format='%cd'; fi)
-
-edid-decode: $(OBJECTS)
-	$(CXX) $(LDFLAGS) -g -o $@ $(OBJECTS) -lm
-
-edid-decode.js: emscripten/edid-decode.js
-
-emscripten/edid-decode.js: $(EMOBJECTS)
-	$(EMXX) $(LDFLAGS) -s EXPORTED_FUNCTIONS='["_parse_edid"]' -s EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]' -o $@ $(EMOBJECTS) -lm
-
-%.o: %.cpp edid-decode.h oui.h Makefile
-	$(CXX) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $(WARN_FLAGS) -g $(sha) $(date) -o $@ -c $<
-
-emscripten/%.o: %.cpp edid-decode.h oui.h Makefile
-	$(EMXX) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $(WARN_FLAGS) $(sha) $(date) -o $@ -c $<
-
-clean:
-	rm -f *.o emscripten/*.o
-	rm -f edid-decode emscripten/edid-decode.js emscripten/edid-decode.wasm
-
-install:
-	mkdir -p $(DESTDIR)$(bindir)
-	install -m 0755 edid-decode $(DESTDIR)$(bindir)
-	mkdir -p $(DESTDIR)$(mandir)/man1
-	install -m 0644 edid-decode.1 $(DESTDIR)$(mandir)/man1
diff --git a/README b/README
index 4c2b7fe..bf4e668 100644
--- a/README
+++ b/README
@@ -6,8 +6,9 @@ To build this do:
 
 git clone git://linuxtv.org/edid-decode.git
 cd edid-decode
-make
-make install
+meson setup _build
+meson compile -C _build
+meson install -C _build
 
 Patches and bug reports can be sent to the linux-media@vger.kernel.org
 mailinglist (see https://www.linuxtv.org/lists.php). Please make sure
@@ -46,15 +47,20 @@ https://hverkuil.home.xs4all.nl/edid-decode/edid-decode.html
 
 This is updated regularly with the latest edid-decode. It uses emscripten
 and the html file is maintained in the emscripten directory of edid-decode.
-To build edid-decode.js/wasm run 'make edid-decode.js'. This assumes
-that emscripten is installed, of course.
-
-You can use the konqueror browser to run it locally:
-
-	konqueror emscripten/edid-decode.html
-
-For other browsers you need to serve the files using a local webserver.
-See also https://emscripten.org/docs/getting_started/Tutorial.html
+To build it, set the project up using the provided crossfile:
+
+	meson setup _build-wasm \
+		--cross-file ./emscripten/wasm-crossfile.txt \
+		--prefix=$(pwd)/_install-wasm
+	meson install _build-wasm
+	# serve the files using a local webserver
+	cd _install-wasm/bin
+	python3 -m http.server
+
+This assumes that emscripten is installed, of course. The location of the
+toolchain can be adjusted in emscripten/wasm-crossfile.txt.
+See also https://emscripten.org/docs/getting_started/Tutorial.html and
+https://mesonbuild.com/Cross-compilation.html.
 
 You can find a very large collection of EDIDs here:
 https://github.com/linuxhw/EDID
diff --git a/emscripten/wasm-crossfile.txt b/emscripten/wasm-crossfile.txt
new file mode 100644
index 0000000..a41f46c
--- /dev/null
+++ b/emscripten/wasm-crossfile.txt
@@ -0,0 +1,14 @@
+[binaries]
+c = '/usr/lib/emscripten/emcc'
+cpp = '/usr/lib/emscripten/em++'
+ar = '/usr/lib/emscripten/emar'
+strip = '/usr/lib/emscripten/emstrip'
+
+[built-in options]
+default_library = 'static'
+
+[host_machine]
+system = 'emscripten'
+cpu_family = 'wasm32'
+cpu = 'wasm32'
+endian = 'little'
\ No newline at end of file
diff --git a/meson.build b/meson.build
new file mode 100644
index 0000000..ca57652
--- /dev/null
+++ b/meson.build
@@ -0,0 +1,65 @@
+project(
+	'edid-decode',
+	'cpp',
+)
+
+edid_decode_args = [
+	'-Wno-missing-field-initializers',
+	'-Wno-unused-parameter',
+	'-Wimplicit-fallthrough',
+]
+edid_decode_link_args = []
+
+git = find_program('git', native: true, required: false)
+if git.found()
+	git_commit = run_command(
+		[git, 'rev-parse', '--short=12', 'HEAD'],
+		check: false,
+	)
+	git_date = run_command(
+		[git, 'show', '--quiet', '--date=format-local:%F %T', '--format=%cd'],
+		env: {'TZ': 'UTC'},
+		check: false,
+	)
+
+	if git_commit.returncode() == 0
+		edid_decode_args += ['-DSHA=' + git_commit.stdout().strip()]
+	endif
+	if git_date.returncode() == 0
+		edid_decode_args += ['-DDATE=' + git_date.stdout().strip()]
+	endif
+endif
+
+if target_machine.system() == 'emscripten'
+	edid_decode_link_args += [
+		'-sEXPORTED_FUNCTIONS=_parse_edid',
+		'-sEXPORTED_RUNTIME_METHODS=ccall,cwrap'
+	]
+
+	fs = import('fs')
+	foreach filename : ['edid-decode.html', 'edid-decode.ico']
+		fs.copyfile(
+			'emscripten' / filename,
+			install: true,
+			install_dir: 'bin',
+		)
+	endforeach
+endif
+
+edid_decode = executable(
+	'edid-decode',
+	'calc-gtf-cvt.cpp',
+	'calc-ovt.cpp',
+	'edid-decode.cpp',
+	'parse-base-block.cpp',
+	'parse-cta-block.cpp',
+	'parse-di-ext-block.cpp',
+	'parse-displayid-block.cpp',
+	'parse-ls-ext-block.cpp',
+	'parse-vtb-ext-block.cpp',
+	cpp_args : edid_decode_args,
+	link_args: edid_decode_link_args,
+	install : true,
+)
+
+install_man('edid-decode.1')
\ No newline at end of file
-- 
2.44.0


