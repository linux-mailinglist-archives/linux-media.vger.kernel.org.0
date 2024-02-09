Return-Path: <linux-media+bounces-4938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 153F884FF66
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 23:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00BBAB2137F
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 22:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A738121350;
	Fri,  9 Feb 2024 22:07:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E53182D2
	for <linux-media@vger.kernel.org>; Fri,  9 Feb 2024 22:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707516434; cv=none; b=upND9zCnypmEkMGk+jtPOAzERph1LcS/HZBWhgFvKuYdnwX/cRmZYgpnEOXH1Hz+3ag44xwD6KKNw+T9XWkXQipm7wFpDTKgKVD0IabgPZ3AYyfz6Fz2FCn9kuObXvKzNO8i6c4sRvlpCDXALZ5qseEO6/okllOkPs8MU+Zu6uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707516434; c=relaxed/simple;
	bh=z01e7mxHy9zypXf1tuvq6cFqkV1th2z3tF0uerhFCF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s4lJadIRvT87bVsRvtNZ0/ZntaN+7GqHtIn50adhVdiijMvBzfXVbts9z2aP7ZjbtJ/OlLwuKjCDPWECrBHexKYsR9zfTk0POtRjfNMQmb6F62zto0yYJYaVxRXZ9KZLWQQbPW58TGxE5adhl3ISqaSIS0pJFknzqfGlCRCkRtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: James Le Cuirot <chewi@gentoo.org>
To: linux-media@vger.kernel.org
Cc: James Le Cuirot <chewi@gentoo.org>
Subject: [PATCH v2] v4l2-compliance: Fix building against libc++
Date: Fri,  9 Feb 2024 22:05:29 +0000
Message-ID: <20240209220601.18704-2-chewi@gentoo.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2-test-time32-64.cpp included compiler.h, which checks
_LIBCPP_VERSION. This only works against libc++ when a C++ header has
already been included, which wasn't the case here.

The <version> header is the C++20 method of defining _LIBCPP_VERSION,
but for older versions, <ciso646> works as an alternative, so include
that in compiler.h.

compiler.h is for C as well as C++ though, so use __cplusplus to check
for a C++ compiler before including <ciso646>.

Signed-off-by: James Le Cuirot <chewi@gentoo.org>
---
 include/compiler.h | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/include/compiler.h b/include/compiler.h
index 5ad54f41..169247a8 100644
--- a/include/compiler.h
+++ b/include/compiler.h
@@ -1,17 +1,14 @@
-#ifdef _LIBCPP_VERSION
-#define fallthrough _LIBCPP_FALLTHROUGH()
+#if !defined(__cplusplus) || __cplusplus < 201103L
+	#define fallthrough ((void)0)
 #else
-
-#if __cplusplus >= 201103L
-
-#ifdef __clang__
-#define fallthrough [[clang::fallthrough]]
-#else
-#define fallthrough [[gnu::fallthrough]]
-#endif // __clang__
-
-#else
-#define fallthrough ((void)0)
-
+	#include <ciso646>
+	#ifdef _LIBCPP_VERSION
+		#define fallthrough _LIBCPP_FALLTHROUGH()
+	#else
+		#ifdef __clang__
+			#define fallthrough [[clang::fallthrough]]
+		#else
+			#define fallthrough [[gnu::fallthrough]]
+		#endif // __clang__
+	#endif // _LIBCPP_VERSION
 #endif // __cplusplus
-#endif // _LIBCPP_VERSION
--
2.43.0

