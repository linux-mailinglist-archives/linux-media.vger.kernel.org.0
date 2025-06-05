Return-Path: <linux-media+bounces-34131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 357EEACEFBE
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 14:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A06E63ACC27
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E59D22331C;
	Thu,  5 Jun 2025 12:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4VBBwwZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3A7202F83
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 12:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128323; cv=none; b=c7xUJLUDcTBBO28VofXx3CnFWq9svUQ5rk6S7KeA4FNBdINKAtOfmMJRUAumEYXFrD7B0ksh/npdipMPbjpPhlUEA1jxmdklgUwOb1jIz+SDeK3/A5PnSxnL6dJ2hJrpLM8NllBFnm4gl5cpqYsLFafO1FQfo3LC4GgUmnHMEPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128323; c=relaxed/simple;
	bh=A9J7DVTDVhq34nNJygiPnvdx+iPMNPzVaMTF42moXKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=annMly31w03am1csN9XGDF9gJGokKCdkD+c8FNO947NKPN+YgKdfoXGRLtHfLTEc8K1NChr1iB9IZvhB+qodbsgB8Z8ZI01tfm7ssR5lXIlAhrR5kHfRkkwclQ5l4Gu9jjRHjtRz8bGotgtZ39siadsYmuR0NELPCa8N054JkIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4VBBwwZ; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6facba680a1so9872356d6.3
        for <linux-media@vger.kernel.org>; Thu, 05 Jun 2025 05:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749128321; x=1749733121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2oDMPrtHM/uro76IlsDYEW7dA7Qy2XK1qTzFWBDOfI=;
        b=X4VBBwwZGy0GSIM8lwMfXr/pGRsKcuQ84g1y+Dzn0tBOSPGkhvIEXgutzIz//lYDYJ
         acFj1NTfwViYp6kn5/9FmjKsWgDo1EJGkwGcoRBbBAKdmM7qfp4xa87DJTPm8VS9yl2Z
         2iTvXjJsaFmNl2IKocqWoD00eH6D+3LYqrCHvbTbEWvQOD9Z0vVtW2p37dXJ4h/kfc4R
         zIV1EAy/rZqsmV2BxFviIH6zP8hOXQBAdV75B9OrM8Pr7wv/74MYum6Q45kBm0a8BELK
         OuUIX9GfTc3s6by/i6Ptgb9nvcrQ2W71XjNcd0Oq/ZMC4ibYLXQf6MyyosC0mJvyUPm1
         GpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128321; x=1749733121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2oDMPrtHM/uro76IlsDYEW7dA7Qy2XK1qTzFWBDOfI=;
        b=P0KxkJdGD83KTJXoiUgR/0I+Q2pUH4+i66jBrQINZqRyXxorFWimJ3U6bziUiW+79p
         HqJ+CK+cxisD5oWZsNpkrB9RfJQNVBp8/41LZQK/tthtHFzexGE3pzzrAnLKSOVeXN00
         V6KYwsE5Wt7jHx/reD8E7INY/oEcJYhLGVZi/3PuMlhciNZFgc2W7qdeMqNe44hlOzHt
         1+yXN4UPeh8vptdwugUkCJ8ndcXRRDguzN8zrDGdCysTgQR8vCYo8+hiT9mBQqlTkaOT
         +/u8/Kvd82hG4mYZQmR9MOyNHSoVQRsImkXflRtVd6m6jFXJo2u/v5hVtCcje8LLI1U6
         RRQw==
X-Gm-Message-State: AOJu0YwYmCgQIX8q+p8E23+CEUKRMO+6Pz+ywnyF1+Nb/44M0Cv1jRHC
	ERugWYRlMmJczYkci2Bkl/IxYeuZqwDANnlkmLBuTThyJ9wJhpbQs4WlrdeeKw==
X-Gm-Gg: ASbGncuYWJjevnlNK2ZLXfukDA7ZLKLTtwt9ixix3cGj+DDXLS1mHnDU7JeDXKvnk3B
	qib+TRopIuiMn/LzIxbwb2GTDi84qIc320epmc2da8KtKxxaDBU4nJ4PDcSbh84mDXhSQ4qR4hl
	gx16byKJ9nMR0hyau4GL8ZjwbgBufG7mj/1PH73syZCoccgiysVzJatY4sYqUSGVoRm43CuWXF4
	qHzpBYOsUvNNOdjItOw7cqA0hN7kpptJYSgywe5d10h48dSV1tOcANrY9CGb5lxaaa9c+/YaLly
	J9hrIJwxsrcGXy34ph2tkvFvLyTx5jzdwmS0IzLLeiEQ7oGm17U7BIjG9FOzMCrU/DeK4tz9RS/
	6266MwUj5aRMRdLf/WFMOSoIS87E=
X-Google-Smtp-Source: AGHT+IEu8ecxJXRaA6mTGnpFuvXAgYaXV5P5HHdIbvu97qwQjvQfJ4iu5worWiElvzaVpZ5zl4wy2g==
X-Received: by 2002:ad4:5965:0:b0:6fa:bbcd:2786 with SMTP id 6a1803df08f44-6faf702fe08mr109802676d6.38.1749128321021;
        Thu, 05 Jun 2025 05:58:41 -0700 (PDT)
Received: from gauss.local (99-104-239-121.lightspeed.livnmi.sbcglobal.net. [99.104.239.121])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fafd7bf11dsm23936566d6.88.2025.06.05.05.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 05:58:40 -0700 (PDT)
From: Leo Izen <leo.izen@gmail.com>
To: linux-media@vger.kernel.org
Cc: Leo Izen <leo.izen@gmail.com>
Subject: [PATCH] libv4l2: prefix HAVE_POSIX_IOCTL with LIBV4L_ for public header
Date: Thu,  5 Jun 2025 08:56:51 -0400
Message-ID: <20250605125822.104842-1-leo.izen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <f75fa09d-190e-47f9-99f0-e2f1b1637e51@gmail.com>
References: <f75fa09d-190e-47f9-99f0-e2f1b1637e51@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit fd882f9e77b13cbc6a669e6836c3943393b44152 introduced the flag
HAVE_POSIX_IOCTL to change which v4l2_ioctl function is declared in
libv4l2.h, but this is a public header and may conflict with another
project which may use HAVE_POSIX_IOCTL on its own to determine which
ioctl funtion it should declare.

This commit namespaces the flag so it can't conflict with another
project's configuration. Notably, if it uses #if instead of #ifdef and
defines HAVE_POSIX_IOCTL to be 0, then it will create an incompatible
function signature between v4l2_ioctl and the project's.

Signed-off-by: Leo Izen <leo.izen@gmail.com>
---
 lib/include/libv4l2.h     | 2 +-
 lib/libv4l1/v4l1compat.c  | 2 +-
 lib/libv4l2/libv4l2.c     | 2 +-
 lib/libv4l2/v4l2convert.c | 2 +-
 meson.build               | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/include/libv4l2.h b/lib/include/libv4l2.h
index 16565555..25ababc7 100644
--- a/lib/include/libv4l2.h
+++ b/lib/include/libv4l2.h
@@ -63,7 +63,7 @@ LIBV4L_PUBLIC extern FILE *v4l2_log_file;
 LIBV4L_PUBLIC int v4l2_open(const char *file, int oflag, ...);
 LIBV4L_PUBLIC int v4l2_close(int fd);
 LIBV4L_PUBLIC int v4l2_dup(int fd);
-#ifdef HAVE_POSIX_IOCTL
+#ifdef LIBV4L_HAVE_POSIX_IOCTL
 LIBV4L_PUBLIC int v4l2_ioctl(int fd, int request, ...);
 #else
 LIBV4L_PUBLIC int v4l2_ioctl(int fd, unsigned long int request, ...);
diff --git a/lib/libv4l1/v4l1compat.c b/lib/libv4l1/v4l1compat.c
index 2db68423..c4ca3a70 100644
--- a/lib/libv4l1/v4l1compat.c
+++ b/lib/libv4l1/v4l1compat.c
@@ -90,7 +90,7 @@ LIBV4L_PUBLIC int dup(int fd)
 	return v4l1_dup(fd);
 }
 
-#ifdef HAVE_POSIX_IOCTL
+#ifdef LIBV4L_HAVE_POSIX_IOCTL
 LIBV4L_PUBLIC int ioctl(int fd, int request, ...)
 #else
 LIBV4L_PUBLIC int ioctl(int fd, unsigned long int request, ...)
diff --git a/lib/libv4l2/libv4l2.c b/lib/libv4l2/libv4l2.c
index 1607ec35..289501d9 100644
--- a/lib/libv4l2/libv4l2.c
+++ b/lib/libv4l2/libv4l2.c
@@ -1051,7 +1051,7 @@ static int v4l2_s_fmt(int index, struct v4l2_format *dest_fmt)
 	return 0;
 }
 
-#ifdef HAVE_POSIX_IOCTL
+#ifdef LIBV4L_HAVE_POSIX_IOCTL
 int v4l2_ioctl(int fd, int request, ...)
 #else
 int v4l2_ioctl(int fd, unsigned long int request, ...)
diff --git a/lib/libv4l2/v4l2convert.c b/lib/libv4l2/v4l2convert.c
index 396ed3ea..b33472e5 100644
--- a/lib/libv4l2/v4l2convert.c
+++ b/lib/libv4l2/v4l2convert.c
@@ -123,7 +123,7 @@ LIBV4L_PUBLIC int dup(int fd)
 	return v4l2_dup(fd);
 }
 
-#ifdef HAVE_POSIX_IOCTL
+#ifdef LIBV4L_HAVE_POSIX_IOCTL
 LIBV4L_PUBLIC int ioctl(int fd, int request, ...)
 #else
 LIBV4L_PUBLIC int ioctl(int fd, unsigned long int request, ...)
diff --git a/meson.build b/meson.build
index 88781e59..590ef11e 100644
--- a/meson.build
+++ b/meson.build
@@ -365,7 +365,7 @@ ioctl_posix_test = '''
 int ioctl (int, int, ...);
 '''
 if cc.compiles(ioctl_posix_test)
-    conf.set('HAVE_POSIX_IOCTL', 1)
+    conf.set('LIBV4L_HAVE_POSIX_IOCTL', 1)
 endif
 
 c_arguments = []
-- 
2.49.0


