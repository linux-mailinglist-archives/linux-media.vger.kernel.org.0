Return-Path: <linux-media+bounces-5209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8FB85628C
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 13:08:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BFF91C21CA8
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 12:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6669A12BEB2;
	Thu, 15 Feb 2024 12:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sj0rjGcc"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0DC12B162
	for <linux-media@vger.kernel.org>; Thu, 15 Feb 2024 12:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707998885; cv=none; b=TkJGSQPojoaVwA2J3lZyo4zgI6DOVijASasOeOQjgH/et+h0bfCrARoNlYYocvfXv61Wx5BdkMgIx7ighslnoMLPbXmLISGQXWDOqRbfYBYhbJusXxJzwOJhsqVcoLKh06WakuCfJbPE2sNKLfR5WJhm7XACxwR5wantLjwTKhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707998885; c=relaxed/simple;
	bh=bJmrASaQhSEQRJj3ap4li0eFqw93WMgxi+kQIFtVYc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NB5Z7/AxiLCwGBSbTE3YiiqOm/b8leA6VunR86TXStL0Y1YpRso6MyVPGjeFiEiI/hicuRy+3Oo1Axg9s9+RMEqjvLDM/r9qovQAQt3WjPQ4STX+tjS+0smBtdlN3UPdjnOQCxQPkYGMuoH9JPC2nqttA5sAv+Kt7Fz6fFTlYHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sj0rjGcc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707998883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4qJMpus889aE/NT2s41N+Eik74VAp6DBDi9J+E5rInc=;
	b=Sj0rjGccJ7p/Cc2SnXlxFIVAPmZ13mckCYZ0Py89AFqfitlQsdsZVaqXqHSICjAFRgi74k
	r8MULfbQcguy3XA0+Mbihb/9Hpn7p9Fwk9apwSn7bNhTN5bShwLn4UVs+sQUqd+8LUW0p8
	vKweBQrrpAfqLBALj9U+17197894AdE=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-iMmcR6NFOaqnuCQyRYyQug-1; Thu, 15 Feb 2024 07:08:01 -0500
X-MC-Unique: iMmcR6NFOaqnuCQyRYyQug-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5116d7eb706so732090e87.1
        for <linux-media@vger.kernel.org>; Thu, 15 Feb 2024 04:08:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707998879; x=1708603679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qJMpus889aE/NT2s41N+Eik74VAp6DBDi9J+E5rInc=;
        b=r9+jHfWHbjzcvafBX8a0Z7CjZXjXlP11goyK9omwUMbIw3q7oySkUJYNhd66pNQO9j
         7cqZBsbN2ct0FQvMVGsl4t8Ygk4/1mv13BpvW/b7X2UNB9xhfzeXsBGw6uSnoimrNOXW
         1wi6dHf3zQEwdn2EWWYMQDB0cjHNEW8tC1RUdraKqah2QcYiCRh0pGJUGY+lHUWcRbtT
         qcS2Ei4KmvBP/JEdj4PTgEIhTaGlkIAbIfEZYvY+rRZ3omLKlNvMP8s9qyYsEfzcAJpg
         E9ZfyOKBcr8zD8cJxK19q5yfZ8BZBpOZioWsv+GhKF/499RP2xhzdwIY7Xyypswropf/
         L22A==
X-Gm-Message-State: AOJu0YznHLhEbsvFMbt+u56TzERLXNZPNfsBOESisMTP+Wgo6DQStbjL
	eQsXgPQJHs1n9mXR3yeRys73QaR1IRUjjjPG2AARG5Miu2JvcdQkCcGit0yntDAe/qQfSOVeZgw
	Lqi7f2mpqK75IKozBOSsrDiMBzC7ePeBSD12oNRvvMu9WXglDbF5o/ULxlG+weWSaRD4TJhQiC+
	SS+oixgH9tmoGpbvIw5h/G5VFZ+WYzGfCdciJvY3aIM0PD/vdr5FgSzbw=
X-Received: by 2002:ac2:529b:0:b0:511:3a20:e116 with SMTP id q27-20020ac2529b000000b005113a20e116mr1091736lfm.11.1707998879015;
        Thu, 15 Feb 2024 04:07:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDJPperG0UvQSHgsnFXo9uAnwIcmnNHsxdas5oMQ8Pcufc/wOqPhAGyvI1XxxPTZ/Hms2ocw==
X-Received: by 2002:ac2:529b:0:b0:511:3a20:e116 with SMTP id q27-20020ac2529b000000b005113a20e116mr1091724lfm.11.1707998878581;
        Thu, 15 Feb 2024 04:07:58 -0800 (PST)
Received: from toolbox.fritz.box ([2001:9e8:89b9:6a00:ea28:7766:892e:6f08])
        by smtp.gmail.com with ESMTPSA id m19-20020a05600c4f5300b00411e1782d33sm1788267wmq.23.2024.02.15.04.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 04:07:58 -0800 (PST)
From: Sebastian Wick <sebastian.wick@redhat.com>
To: linux-media@vger.kernel.org
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Subject: [PATCH][edid-decode] build: add support for building with meson
Date: Thu, 15 Feb 2024 13:06:32 +0100
Message-ID: <20240215120637.1559408-2-sebastian.wick@redhat.com>
X-Mailer: git-send-email 2.43.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The immediate reason for adding support for meson is that this allows us
to include edid-decode as a subproject in libdisplay-info.

Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
---
 emscripten/wasm-crossfile.txt | 14 ++++++++
 meson.build                   | 61 +++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 emscripten/wasm-crossfile.txt
 create mode 100644 meson.build

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
index 0000000..cda12de
--- /dev/null
+++ b/meson.build
@@ -0,0 +1,61 @@
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
+		fs.copyfile('emscripten' / filename)
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


