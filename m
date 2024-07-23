Return-Path: <linux-media+bounces-15283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1E893981F
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2024 04:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2A94B21381
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2024 02:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79171386DF;
	Tue, 23 Jul 2024 02:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgIP0eiK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A50EC2
	for <linux-media@vger.kernel.org>; Tue, 23 Jul 2024 02:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721700325; cv=none; b=UjYkGuf4mI/PhaTtkqv5MwDoZ8GdWeYQvGRQat+gwisLSXoe8nn3rHH7gzMYKsS5JQbwLZe+WV0sSwjthVr/Nh4NoGoG+1zpy6n2WYGYKIOgARP4GplE8rFn85ZP8DwuWasrQ56sh90expFXgyPMZoiqTmt0zyC+8FzZQIPop/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721700325; c=relaxed/simple;
	bh=hWIwkj7U3mcpE5RXD0VU5qkBVOqezXGJgGj+Hym0ijU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Bv3X31gyY/6cImd9ZG1bUrKG2w96EGxW7Q0smgO5JxHGaZ7VkG0WGez7zDBxyHXpB4zrQJy0HgN0H/Ry3V8IyZvfYZfsb6qq7OnsoaGizjngWj0vc0ZmwwMnPgGjE8N52ewMmh3tbePjvh3WXhd6Pf23ayquBtWL5flxyNDGYN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgIP0eiK; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3d91e390601so2734134b6e.1
        for <linux-media@vger.kernel.org>; Mon, 22 Jul 2024 19:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721700323; x=1722305123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TfqasJVK7wNSVI8UHpN8BBNBB7z8VsC4mZw4WMrcmjo=;
        b=FgIP0eiKqpv3CFfdavlSwqJRggTdwW3mmHcOmhqHLeNMKOm4X34JMHTilGqhax0QRu
         PnSnv2rnzOYEUfZ/G+5/CU1GDFGuSuw8aZxDIce6rHFeVBkHwZPHziQAPU/WRSh7bRp9
         /HKN5K9/EspwGSA0Rg/Z9FICJ8zvVtRSrCDAuomFEf5N3ASn7oNW1WojghSHLMGaxbKE
         MtoWntOcwhC9yNkBMPf5NsRX+viiK9WwEEhYUyTsN7tRnn3wHaAiX3I7e4LIqYLyaYG6
         AFC49vbxEgSz/ReNZJzXkmArf7gUnfCWp2kU8J1iJ1FsVTGDrV+/QtevX5cjNgWkfgSV
         P/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721700323; x=1722305123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TfqasJVK7wNSVI8UHpN8BBNBB7z8VsC4mZw4WMrcmjo=;
        b=a2ho59F2FvBbpqiJZFqDYXyDua0X4yvh8Jvi9WK3AQrkQf+TZOgQqxEtD91aKjnsqO
         XwAlhFSy/zt5izqFrkxLew7zWvFuxnQLvk/84OjrRVheOPV+7+iMxEyCaX9DFB/0b18V
         VKp0M1+WFfcfpAW7r2zokxM7JImQ03K9ppA48oNpJKXGtRqCtJP2rwLGLM3QJrwVJctk
         f3YPzVpPjTaFK3SZoarhJXEC+RnTFNFKlEqB1rxGfmvlOICpdh8jQry5oeYS1xrT0RRR
         fLmdgZgzwYBhve423GXwxsNFJtaOLW4TxWdpSmDPZVABAHAKbXu5jQ35mbPlO2YK91W1
         BPMg==
X-Gm-Message-State: AOJu0YyljNRSyG2FBLeWXwctyHcWqKPJWnJwno6ukhA4eVw337sqHnvn
	Tl9uIrQID73qzKnRmwYhECkylC7nmuL+mf9nW94TgRPlDq6bUxJlSnWL3A==
X-Google-Smtp-Source: AGHT+IFofAaDY4hdVys3mFVe4p2/j8rpi61WN9auyIMI6qVO6kRYGM8Rs1zgrTQYdrDqx0JNbv0w6A==
X-Received: by 2002:a05:6808:144a:b0:3da:a47a:99c6 with SMTP id 5614622812f47-3dafd0d171bmr1754317b6e.15.1721700322741;
        Mon, 22 Jul 2024 19:05:22 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d2d316c84sm1946911b3a.81.2024.07.22.19.05.22
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 19:05:22 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-media@vger.kernel.org
Subject: [PATCH] v4l-utils: fix compilation with external intl
Date: Mon, 22 Jul 2024 19:05:21 -0700
Message-ID: <20240723020521.16953-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently there's an assumption that intl is provided by libc. This is
not always the case, especially when deciding to use external Gettext.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 lib/libdvbv5/meson.build   | 1 +
 meson.build                | 2 ++
 utils/dvb/meson.build      | 1 +
 utils/ir-ctl/meson.build   | 1 +
 utils/keytable/meson.build | 1 +
 5 files changed, 6 insertions(+)

diff --git a/lib/libdvbv5/meson.build b/lib/libdvbv5/meson.build
index 0b92e404..8f5929fc 100644
--- a/lib/libdvbv5/meson.build
+++ b/lib/libdvbv5/meson.build
@@ -124,6 +124,7 @@ install_headers(libdvbv5_api, subdir: 'libdvbv5')
 
 libdvbv5_deps = [
     dep_iconv,
+    dep_intl,
     dep_libm,
     dep_librt,
     dep_libudev,
diff --git a/meson.build b/meson.build
index 423876e1..d6c692f1 100644
--- a/meson.build
+++ b/meson.build
@@ -202,6 +202,8 @@ size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesleft, char * *outbuf, si
     endif
 endif
 
+dep_intl = dependency('intl')
+
 have_gconv = cc.has_header('gconv.h', required : get_option('gconv'))
 
 # Detect system gconv directory
diff --git a/utils/dvb/meson.build b/utils/dvb/meson.build
index 871f5a39..762028bd 100644
--- a/utils/dvb/meson.build
+++ b/utils/dvb/meson.build
@@ -1,5 +1,6 @@
 dvb_common_deps =  [
     dep_argp,
+    dep_intl,
     dep_libdvbv5,
     dep_libudev,
     dep_threads,
diff --git a/utils/ir-ctl/meson.build b/utils/ir-ctl/meson.build
index 24d73a15..fd26a624 100644
--- a/utils/ir-ctl/meson.build
+++ b/utils/ir-ctl/meson.build
@@ -12,6 +12,7 @@ ir_ctl_sources = files(
 
 ir_ctl_deps =  [
     dep_argp,
+    dep_intl,
 ]
 
 ir_ctl = executable('ir-ctl',
diff --git a/utils/keytable/meson.build b/utils/keytable/meson.build
index 76ce329e..c02d4ea9 100644
--- a/utils/keytable/meson.build
+++ b/utils/keytable/meson.build
@@ -11,6 +11,7 @@ ir_keytable_sources = files(
 
 ir_keytable_deps = [
     dep_argp,
+    dep_intl,
 ]
 
 ir_keytable_system_dir = udevdir
-- 
2.45.2


