Return-Path: <linux-media+bounces-38812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2484FB196CB
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 00:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 520FB174628
	for <lists+linux-media@lfdr.de>; Sun,  3 Aug 2025 22:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177D71FECAB;
	Sun,  3 Aug 2025 22:50:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562533EA8D
	for <linux-media@vger.kernel.org>; Sun,  3 Aug 2025 22:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754261417; cv=none; b=mp9o8J1718dCb/wzDqwYH8yrOTJP1DvHL8RJTa0rPYyOuaZ7w3GyG5u473YzUt4+lQE+dMIDChXQaruBMujWzzF2nNJ58oTGZkjJiFNKJewbQl6X+X/+TZR+Ie8yr9Mpl/l1+koS+GUn4f82j0wMASvLlhfYehCI/VifUOj3KYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754261417; c=relaxed/simple;
	bh=iBFtemwH656oIGg6PlHR6XLOPXRbCbOQwif/qtbhOUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ib62EttBKnpQonOFj7y1SiI18Qv0lJ8CZyGQrIOuIjpXgyNc2a/PSH42ffJwY4nWA4jP2Qo8FXgOxKacsbOwgoj5JoLqTY42+ik/ws91Lg5YpLDfDMF/lri7mVqkzDC59WEixJUogwoUMVpWajRPE8O3gwYIG0OcJ5xRNutMKho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from symphony.aura.home.arpa (e.a.f.e.b.8.b.b.5.e.7.b.d.6.1.8.c.6.e.0.c.6.2.0.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:26c:e6c:816d:b7e5:bb8b:efae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: chewi)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 46189340B98;
	Sun, 03 Aug 2025 22:50:13 +0000 (UTC)
From: James Le Cuirot <chewi@gentoo.org>
To: linux-media@vger.kernel.org
Cc: James Le Cuirot <chewi@gentoo.org>
Subject: [PATCH] compiler.h: Fix libc++ build now that _LIBCPP_FALLTHROUGH has gone
Date: Sun,  3 Aug 2025 23:49:56 +0100
Message-ID: <20250803224956.19974-1-chewi@gentoo.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This has been dropped in favour of [[__fallthrough__]].

https://github.com/llvm/llvm-project/commit/cb43fe33b5d5084cf3b5a2723a03b692edb68018

Signed-off-by: James Le Cuirot <chewi@gentoo.org>
---
 include/compiler.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/compiler.h b/include/compiler.h
index 169247a8..18718496 100644
--- a/include/compiler.h
+++ b/include/compiler.h
@@ -3,7 +3,11 @@
 #else
 	#include <ciso646>
 	#ifdef _LIBCPP_VERSION
-		#define fallthrough _LIBCPP_FALLTHROUGH()
+		#ifdef _LIBCPP_FALLTHROUGH
+			#define fallthrough _LIBCPP_FALLTHROUGH()
+		#else
+			#define fallthrough [[__fallthrough__]]
+		#endif // _LIBCPP_FALLTHROUGH
 	#else
 		#ifdef __clang__
 			#define fallthrough [[clang::fallthrough]]
-- 
2.50.1


