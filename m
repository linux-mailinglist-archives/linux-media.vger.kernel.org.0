Return-Path: <linux-media+bounces-42243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B27B5260E
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 03:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C966C1889852
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 01:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F2321C16A;
	Thu, 11 Sep 2025 01:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giSizMQo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2161E1F237A
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 01:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757555367; cv=none; b=ovqX1pkQM5ezPaZk5o4Zzqo2CYPNKVv+IAg1gapOhHb/io/nsxZZdbqXO4Ug/uQA0eio8FO9DP5ZocJsydY2bjJB1TjBswHc8/5Tb3/eOKfxBnwww1iwjLPiULr5kb6eSxz1kmRLGlFK02nI+n4i1VU2U/NvJli+TmsOWjVFfQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757555367; c=relaxed/simple;
	bh=o8nK7aMapXNcyBEBHmmRUwx6+KJVR0K7SQqpSSITPIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=To6smKMqC1zMzGf7utufLO+uLHk1KVh4idjg1v1LPey1UFeWbx7F2/oxKNWExi8/ByiCMLH12p6D1vxdHW7eluL7p8OjfC2zPnhebf12sNbWqZqIUdgga/0k2MjlW/MXaQ/qpVbM1qRfEnDu3QgCIgcaUv3v98CtAxImvw8h1NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giSizMQo; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-248e01cd834so245825ad.0
        for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 18:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757555365; x=1758160165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xvn608sinTRV2AHwoaIjd6iDZbiz/CAbFCyfyHIG7Es=;
        b=giSizMQoEhH8o47EO6aY47MRuFp4bmREvKHIhp3ZMUkmvJu00JNXBYnaUSjjPlVwJc
         DA5Q4q2xKMMqReu9tii/QSuPowHN7uGlHMouLaavl5FTKKivCPnZ6M1wMAhClYQWVVz/
         1aKozMMIDs7mjyQtkXn2gE6cHfcTJ37Mnqxo7211XaXpeUaiPfbyzL0tEjTtYH6Sq8x9
         jKYv1DUBeA6W3kbY6/rweWpyj35eiVKygpgj2WsVudmF/onli+fEf5bY8w4HgnyHtGPV
         rSCxVOmifvqAN+x1DDNPJpO0eTgPTzGmeW8zPOqmTMu9ROl3McGV0PO5QaXtu6jhsQCh
         8qDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757555365; x=1758160165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvn608sinTRV2AHwoaIjd6iDZbiz/CAbFCyfyHIG7Es=;
        b=VjTYS00wJUhxtD9/w+bj63dcU1eQSOyAQX/DKM+AZfH5N4IDaMjT88mKvXgFLZr31g
         rXVO0TxnEMCrNP+t0mnV1yTvTLo2VzNBAAT2Rc+8XVYZSG/kVulbO4chQxPouA0VzkDt
         oMJ8OY+g1AmoUD+8XbybFyPgvCvdfBTtNcxlOqWYpx0uC/JShXDXo8Rb5WPZzrSAyR/1
         wo5EdQR9mF1PfIgG4fvXAIMDW6Mp2fGHWO3yTePNZHGwWXZa8L546/9z7CKQutkrIq1A
         NP55ZGgee8xM+V4iUVRLZ/+PKavPKIoxPm3XnexQpHwsb+3dWdBmuQ/O/EfohhYF0Xnv
         jREg==
X-Gm-Message-State: AOJu0Yz8LHojKkcObyN1jUVnUp/0x+ye6WWAzuL7dyZh6jvX3NLs8+ox
	7W/ZOWFMBptrYu6LTZKyxBT2fk5ZFeNpR6WkUYSOjr9dm3juBTSigSnfq7zURLPdJmQ=
X-Gm-Gg: ASbGncvH+1nwC2rcBQVmKIlaMWcjOCjO21yKENvnMpINjxunJaTO/fQKU47t73WVFDu
	DYUVgFzUAu11H0m75jSD0VRISPLrOPkv/mpOCKu+6yTPBQjuPr2rliaYBxtlfIbzYNQLut+oxDv
	SB4cUkhDtRIlCH1Ur8Nt88ToKVybw0nGtxqYDwd/jGU2KyNun8aR92QpZaZYHRJmg1mZx9hHwBm
	uB61qFTOD4K8iYK3F6crX3NnsOumQZiPeJY1EAxN/fmxAiGMDtiPbSTSA/bT+DX0hmYEMMOVB95
	h9VcUiu3Ilju3bwM1F9GZiVO04YKW4KtKchh/lVPOpDo1nAHcCHPlJxRVI3BmBfKjCT5KxNkSN2
	Rl5T1U2SDs0G/ORLXHtk=
X-Google-Smtp-Source: AGHT+IEhvXLhoisvZJ8NbDtV7jZpbjAg/Kv+OU/gUOEvYhtBLYvvD5P3t7kY+n3TjHgKSxGXmT6+Pg==
X-Received: by 2002:a17:902:ecd1:b0:25a:4437:dbb7 with SMTP id d9443c01a7336-25a4437dd42mr39308085ad.4.1757555365056;
        Wed, 10 Sep 2025 18:49:25 -0700 (PDT)
Received: from debian ([2a09:bac5:4467:dc::16:1c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c37295fa8sm1285705ad.57.2025.09.10.18.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 18:49:24 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-media@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>
Subject: [PATCH v4l-utils] Change install dir of libv4l2tracer.so
Date: Thu, 11 Sep 2025 09:48:18 +0800
Message-ID: <20250911014853.323700-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The default install dir of libv4l2tracer.so is libdir, which will
be packaged to libv4l-dev in debian or libv4l-devel in fedora by default.
While libv4l2tracer.so is different from other library files like
libv4lconvert.so in this path, it is only used by v4l2-tracer at runtime,
 and it is not a good idea to let binary file in v4l-utils depend on
libv4l development package.

Installing libv4l2tracer.so to the default libdir won't pass debian
lintian test because this library doesn't have a SONAME, so it's
better to change the install dir of it, just like other v4l plugin
libraries.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 meson_options.txt             | 2 ++
 utils/v4l2-tracer/meson.build | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meson_options.txt b/meson_options.txt
index 1e4aa87f..db18d939 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -46,6 +46,8 @@ option('libv4l2subdir', type : 'string', value : 'libv4l',
        description : 'Set libv4l2 library subdir')
 option('libv4lconvertsubdir', type : 'string', value : 'libv4l',
        description : 'Set libv4lconvert library subdir')
+option('libv4l2tracersubdir', type : 'string', value : 'v4l2-tracer',
+       description : 'Set libv4l2tracer library subdir')
 option('systemdsystemunitdir', type : 'string',
        description : 'Set systemd system unit directory')
 option('udevdir', type : 'string',
diff --git a/utils/v4l2-tracer/meson.build b/utils/v4l2-tracer/meson.build
index d059eb6d..92deac31 100644
--- a/utils/v4l2-tracer/meson.build
+++ b/utils/v4l2-tracer/meson.build
@@ -24,9 +24,12 @@ libv4l2_tracer_incdir = [
     v4l2_utils_incdir,
 ]
 
+libv4l2tracerdir = get_option('prefix') / get_option('libdir') / get_option('libv4l2tracersubdir')
+
 libv4l2tracer = shared_module('v4l2tracer',
                               libv4l2tracer_sources,
                               install : true,
+                              install_dir : libv4l2tracerdir,
                               cpp_args : v4l2_wrapper_args,
                               dependencies : libv4l2tracer_deps,
                               include_directories : libv4l2_tracer_incdir)
@@ -51,7 +54,7 @@ v4l2_tracer_deps = [
 ]
 
 v4l2_tracer_cpp_args = [
-    '-DLIBTRACER_PATH="@0@"'.format(get_option('prefix') / get_option('libdir')),
+    '-DLIBTRACER_PATH="@0@"'.format(libv4l2tracerdir),
 ]
 
 if have_visibility
-- 
2.51.0

base-commit: 34aa1df2b23fb85b030cddf64c427137ddf04e93
branch: v4l2-tracer-install-path

