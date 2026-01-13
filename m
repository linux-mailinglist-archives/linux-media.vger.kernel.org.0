Return-Path: <linux-media+bounces-50625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AFBD1B945
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 23:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2AAC3038F63
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 22:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18453563ED;
	Tue, 13 Jan 2026 22:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="feXbpW2z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E3B241690
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 22:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768343162; cv=none; b=LWiqX3n5Y0M3bYqf4pupVs5yS4BlyRSVYeBSl37LNRQWLx6a75mxRaJitmTs59uvsb7rB1zgIAM0LRDYb4hvy6rLpBJDSHXwvCQOVMjXpJXQAgm7DHw9/r7Yhgu3jH283KfsEH1/6WYbDgcDjnLit/dpfKKcgIrYfqBOt9KdRK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768343162; c=relaxed/simple;
	bh=BBQeA3S7wkPk3ylGqFxEBJEVJdA6W7zYKUStbYHAlv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IxEaJoJVseP/m8SOIpr7v0scA+DZZo2a2Bwi2xjvjZ4B1JxcBasbWtnOXksDaUf+3xsbwa1yxdXN2LRodpTPaQcw6GKomqzQC9jVEeVRHChly96PpOAH7tCP5P8FV/TcFPsAd59B+RmHaEhDOoxY84LOp2AqFwGsKGilO7SipLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=feXbpW2z; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64b5b68a9bdso1339100a12.3
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 14:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768343159; x=1768947959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OTSi22MXyVIFLI49ZaUvuLMSU1XbYOIX8FSnyulljAg=;
        b=feXbpW2zKd8+A8sycJliwxJQS9vCea5yrC0Acm8nNDxikOOBD3XVcBjrDjYnkQGo6O
         UIb9DHbrL/h3OmP/hGDaCpS3u2FAH2XBIGimfgOtPDxkWvxvjkNDCYRxQMi5T67VAXyf
         7Zlk9/Pcmi8nJm7rYktgfEckLjm5QK6211fGIsWPvdur8QbvBHrV1Nwl0d9Ub7i3fTiG
         HJK5ekzx3Q2S0uupLQGXGPx6CaRjpIEsxkuhf3cj1R2qrU3ww7xaHwmdtXl7HM+E6huf
         A81ZxLSkCLirk7/idZPwLbAzqnVjtC6+gzbnJPVG5usj5Hy2yzE2q3ZgtETRhplkxzKq
         B0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768343159; x=1768947959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTSi22MXyVIFLI49ZaUvuLMSU1XbYOIX8FSnyulljAg=;
        b=uEREUW2qB3QQ+BjUNPUhQ7ew0YTDWO0gE4WNz2NOn17XhvBVj1t1SkX0lUiiHjn+eH
         6mICVmZCnStS+YetDQbVr44W8bjl/0tkEKVd5zdTJzNkAdHFag0CddQgRx2UYYtbF2mQ
         IKn2V5GAqcPEeJh2IT1bPU5dAbk4qTfQWo/n/pzdwM4j0lpsdVsyjcbu+sAQIkxxj9BK
         DUQe5SjtfYmeJqgdPPLGglzp2nRf8yx7xr24stDkpKVW6VrGZGVcvcFbP5b6YW5kXuQ5
         yFMK/LWXnuThL8WuIEE36SU00eXI4HxjXjq3NBmp9fzZSTnIkrmQry3qPQEcfDgrPmGP
         U7Fg==
X-Gm-Message-State: AOJu0YwKRXT8LiVxGuaQbp3AeX2RFP8310S0Z/nTgTQuw/hHVYcEADta
	9xAdbpb1txX16gi+BtNH9YpAdJaZKhCb/wNkldA6zBl1RrrLdQoUQpKlMYIlPg==
X-Gm-Gg: AY/fxX44yckPJRYiCmtsu5bqbzLGhaWMoOUUJg3RGJKJwrvMxJtKtoZb7V+NPVwrfj+
	4jn8nDfX4YbMJH3d0ScmRTJEJq+uqsiOQKDxX3aGVUujQM5WrgQKfCEvipx9L4iS/4uN5INrpAw
	Ub5CKvxgUPRValCfLAaL7PjDdxcILr/Hzw5AY3q7+58fvGCJZbm3Zf+Sq8Mzc3O+oEFJPFz9RuU
	+UnkI27lkyDD6t4x2mcfOmXG9ftKvnEYZNyVbnuPsTDK3JX7E0k4qzfoGv9JF81bYbkV7wP230x
	ALqNsZsTzRDoscyRSNMjmHGr46/htL72exw3zrvacPRR5rK65uF8lce0mamQSWr/zMWPHdgLpyk
	T4L6jB8ah0EFn1a45lYcWx+XRcZffIWIDsTyRiEw2VcU3I1HHtWFbjrNylRFJrhtbSBC4MPesWv
	Gb79xxnp7f/sGL0VfYZaI0WA3HeXE2013IchzqC16WC1D9eyW8zIRvlTwWgBZZqgGfJ7RKbcBw6
	v8=
X-Received: by 2002:a05:6402:35d1:b0:64b:4e7a:bbc8 with SMTP id 4fb4d7f45d1cf-653ec461c8emr206465a12.5.1768343158725;
        Tue, 13 Jan 2026 14:25:58 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5d4sm21336995a12.32.2026.01.13.14.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 14:25:58 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: linux-media@vger.kernel.org
Cc: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Subject: [PATCH v4l-utils] edid-decode: Always show VRR min/max values
Date: Tue, 13 Jan 2026 23:25:56 +0100
Message-ID: <20260113222556.181609-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's useful to always see VRRmin and VRRmax values, even if they are 0
especially becasue VRRmax==0 is a valid value that indicates the upper
VRR boundary is based on the current selected video mode.

Currently, VRRmax is completely hidden if it's 0. Some Philips TVs do
actually set it to this value though it is very rare among TVs.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 utils/edid-decode/parse-cta-block.cpp | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/utils/edid-decode/parse-cta-block.cpp b/utils/edid-decode/parse-cta-block.cpp
index ecf32b9f..404dee55 100644
--- a/utils/edid-decode/parse-cta-block.cpp
+++ b/utils/edid-decode/parse-cta-block.cpp
@@ -1377,19 +1377,15 @@ void edid_state::cta_hf_scdb(const unsigned char *x, unsigned length)
 		return;
 
 	v = x[5] & 0x3f;
-	if (v) {
-		printf("    VRRmin: %u Hz\n", v);
-		if (v > 48)
-			fail("VRRmin > 48.\n");
-	}
+	printf("    VRRmin: %u Hz\n", v);
+	if (v > 48)
+		fail("VRRmin > 48.\n");
 	v = (x[5] & 0xc0) << 2 | x[6];
-	if (v) {
-		printf("    VRRmax: %u Hz\n", v);
-		if (!(x[5] & 0x3f))
-			fail("VRRmin == 0, but VRRmax isn't.\n");
-		else if (v < 100)
-			fail("VRRmax < 100.\n");
-	}
+	printf("    VRRmax: %u Hz\n", v);
+	if (!(x[5] & 0x3f))
+		fail("VRRmin == 0, but VRRmax isn't.\n");
+	else if (v > 0 && v < 100)
+		fail("0 < VRRmax < 100.\n");
 
 	if (length <= 7)
 		return;
-- 
2.52.0


