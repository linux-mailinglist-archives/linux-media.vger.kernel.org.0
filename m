Return-Path: <linux-media+bounces-6435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8B6871E52
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 12:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54F401F249BC
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 11:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4019B58AC7;
	Tue,  5 Mar 2024 11:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EuTU0D4L"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091AF5813A
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 11:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709639699; cv=none; b=cwbU0JEJQZnGH4wldpD9k09gBufBkdMMnfo8wfIwHymmB3AsFxjAg3OGGc0BASWUmn7LtUm8QAP/wVahtilGHKfiRDdlogVEH+BsN+QL+s8o2Vv9ns0n7uyfSOlyPtp+iQ6cgUAZw99M9lXFBaeBbyCIS7VWOq+DpusgRhmxkOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709639699; c=relaxed/simple;
	bh=fxpnok/BjsNaGCCOUulXIC0EaBxWX4WwGFiVQDSxnhw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SxtgRYOaF66OrYBvW7a8kqmpdqc80aDU1vso4zXq0avXCRIxbZ6/QSTY1WyPeGSuZxkDl/Wcit9v/PwIGZ2pcLryYNiOTNR94vPXTVc8QOWwVblcB/XBONqzyfvuPRs4BpslsXqMqGRcdtJ33GKGybPiz9TdHr0WXds/SWgdFjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EuTU0D4L; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709639696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lpuk9AAGhjcyIrd6eckQpDU2xcK7Gmign61ioCJD74c=;
	b=EuTU0D4Ld05C8Rnu81aJd5uwU4760THJ7AGOckEyZxw2JK0c+qIknkS8ThmmsKtYu7Myd4
	rLOCtTh7LsMUfo8EaRAPSRKDuqn1TEWYVVfzX++A5lyh41i0tUbgVeTUQE6qB4QCf8NAg5
	gDEMJI39rcUZDs1uIzOF25Fn9NLtBlQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-2O72TGl7PUOl_pk4oPKKRg-1; Tue, 05 Mar 2024 06:54:55 -0500
X-MC-Unique: 2O72TGl7PUOl_pk4oPKKRg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-412d1f1ee7cso19020665e9.3
        for <linux-media@vger.kernel.org>; Tue, 05 Mar 2024 03:54:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709639693; x=1710244493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpuk9AAGhjcyIrd6eckQpDU2xcK7Gmign61ioCJD74c=;
        b=u+GEN64a2sqWBg67GIZA1XCUu+zZVDZHVTWa1N0mAFpLZNR5U9xZeKfWbWM2A3JadS
         NGvZbendqOIpiMIu0Rt2Cgn+Hzwh8pa95THQKa4BTVxY1kbBxcYrfI/zBgc+Hp6NsRQq
         uCeHIzBjfoyABRMyFGqfrpzfLwkS7IiGhkewhSQKGHOCXYCkeYVRLZ0L5RLN/Pl8jf7p
         019f7FEL2Dh6WvkKuEOqr1L3b0TcVv78m3+HpSRdqubU7G1lXgq75XQ3YQ6bl3MsNuSy
         axu7K3hHD5X/lpjSfZJ5GKUZd8eWStSFaaxNpRx6NSMpczlkXeOBm5i6v1ed02ZKsUxZ
         aCjg==
X-Gm-Message-State: AOJu0YwJMbODKXZPgPGWWzmf9sVSywAXMp0WmakUNbZgQwJcFZoA7wBw
	LaGMZMnc9AT2+2DFjp2Js0L1G7G/HBXTZAFfHfExzmzn71g1JwKdXS30SQfrZFcGj26yUuHSUXy
	9DEzTVWNJB1kkSkXaqMi9VoV9FAgMdMs1SowxRdNsh8aZogfERO7hgy7OxnT19bs9LrGzNMjRYU
	/tmEpto1O/89dYzRzy9nTQiG9E3uOy6E9UDCLIWxfKefiaOZeR2PLp
X-Received: by 2002:a05:600c:350a:b0:412:dca9:aa83 with SMTP id h10-20020a05600c350a00b00412dca9aa83mr5976174wmq.21.1709639692743;
        Tue, 05 Mar 2024 03:54:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFv2EmRjWkkw0cZ/cGpNxNOraQS2KobKqcTcbmWyJ1SRF8nn3LDo1c3Z8IxpnTIumJ8kUBzcA==
X-Received: by 2002:a05:600c:350a:b0:412:dca9:aa83 with SMTP id h10-20020a05600c350a00b00412dca9aa83mr5976155wmq.21.1709639692231;
        Tue, 05 Mar 2024 03:54:52 -0800 (PST)
Received: from toolbox.fritz.box ([2001:9e8:898a:6d00:3d3a:c29e:3324:fc0e])
        by smtp.gmail.com with ESMTPSA id f12-20020a05600c4e8c00b00412ae4b45b3sm21155034wmq.30.2024.03.05.03.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 03:54:51 -0800 (PST)
From: Sebastian Wick <sebastian.wick@redhat.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v2] edid-decode: build: add support for building with meson
Date: Tue,  5 Mar 2024 12:54:51 +0100
Message-ID: <20240305115451.210807-1-sebastian.wick@redhat.com>
X-Mailer: git-send-email 2.43.1
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
index 0000000..3a5bc71
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
+executable(
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
2.43.1


