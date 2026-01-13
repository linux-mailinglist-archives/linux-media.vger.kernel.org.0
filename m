Return-Path: <linux-media+bounces-50623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBF0D1B921
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 23:19:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6961302FBF6
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 22:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE590354AEB;
	Tue, 13 Jan 2026 22:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCA4tIGO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B5A352C30
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 22:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768342762; cv=none; b=oxNbNHfBkDfW85nfJLExb5KF4IQ+M3oloudYuO1BVDcJdp6/VntgLmb8ptQU4KEmODoWw69rVA0YB24BkQTYsQXkPJknCxyveEAdiYgYxJfw743xNRE8mTLyP61SxA4a0mauVurIsuvXFI2nJMMH+LyiXaU1pM1kTmYOLBQdAZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768342762; c=relaxed/simple;
	bh=BBQeA3S7wkPk3ylGqFxEBJEVJdA6W7zYKUStbYHAlv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RetwyZX1eXgO7fsWBRfngwkJXQF+6/y7KTkUkIpfGz+l35ULP6RTriC12v34v4aUTuSa9Q/Yhc/JLELJFLK3TwfrMpYVoufXOzh6J1h4m0K1Co4KzlqgEOQkKHZ1aLMlCIMqvvdUaRWnPge0x30qTeFW9ovD10EU3rGvyyOECB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCA4tIGO; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b87174fbacdso49492366b.2
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 14:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768342759; x=1768947559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OTSi22MXyVIFLI49ZaUvuLMSU1XbYOIX8FSnyulljAg=;
        b=dCA4tIGO0iqH18s2wwV06fNVOyF3e1Gh3E1003hhzWO7JZ0L0lSb2LSWkOodE8ThI5
         2ZyjEhGYcGEwpbAYuDoqdUt3ct0BF1TySAuNa97kd6YjO7OTWzdEQ8M1LZwUCSG4Y7zn
         8SZ9C0rZ6pD6A6rJzdl952adePwIt3tyqshE26Y/dekxlnIJUJ4upxSM2nKzJg6EoHvM
         xZjcE7UckdtlHIiYxHI9G180hBnwu4ofqyFSiAQApITqAb9vMfTVZD3d6/XsYpu2VtqO
         dtIE2spsOu+v4qcYzMdvJaveB+tn4ztOiZ3YRQwWX99OaL+M/Ki6tNTUOCjBQivtnvX5
         KmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768342759; x=1768947559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTSi22MXyVIFLI49ZaUvuLMSU1XbYOIX8FSnyulljAg=;
        b=ABMaucb0Hair0WCxb2vU4LP5aHJpYdKG9IfKaOt3z76WJAJWFtjSD+iLzKdFEIK0w8
         2VTdKXJaRRRpXGRzibQSptT5fQBnTkOadJG8sqre+AimS6EeroSRnc2Ftk6OROdkEOcX
         zYrSm44zlBO7QFgowBGAOxvSu/I3R5bXpXnOyz5MFDSp+Ak4abKoyt4vPJ2YoTx41tSF
         aH+MUB5pLBKpuYCV0ZKUh0deDPWCxGjhhbE5O2VYqoIjxUHxrrzoyGVN4LzDUDvkF6fS
         HF5m1myf1haNc+484jQ0rSE9sBEIBHbXDDGWq7K7HLqrvWBzh4qchlmcmUM58Xs4DI0K
         jyaA==
X-Gm-Message-State: AOJu0YwIAJNUt+xgIeydj2RwtGyPBdv6AAx3gW3BZhjRKFwEa3+2Ltt4
	V3vgq3CfH0WuVjR+Ar83/NBNVqu5ODsp4MWJuo8NqhQtxCdCSU9Ew/lZwpzQww==
X-Gm-Gg: AY/fxX7s0IA+QWxvF/Hy4dvX2xE4N376PcgcSoPxy75IxoqxDbNCh+ytlDBUswqOo/J
	8251+IcJvY952v6BXH6ExFUBElNN5foHF+9PD3C2fLxYMczHYk3ALUn3o/sXZf2cmhWtKxdHdM0
	DgDIqkFtiLZwYohqHiP9zL8Ttf1VEcoWrsIss+Kx+h+H4H6yYmGMCWn8AN1vXnK/Nr6GyW4NYcb
	XSJJRUMmP0Q6GZjBBEg7RDBtc7PFA/1yK2FGISx62hYnzRysNnyq/GcvzcmQP+v0PCzkPe2nKo9
	yrYEybvwrPEtHKTjM+YVjFrGMNQRyh3o/qeKa9VjCDERdsyCUD9Q7sQLuobGhS7RTpGnj8QAWrq
	V4p8/eqW46MEI01NujvWJfK32ECBwgAkHXECnwNefX5EnfcPdaJuXCHByQO4O3Pw9gqDQy9iDK5
	n08WGAwrImQB+gW2L9GMK8WgXJIlXXn8cyfL34c11d3qQyq7kOMsnf4MAcFVbyE0rP
X-Received: by 2002:a17:907:3e14:b0:b87:515e:654a with SMTP id a640c23a62f3a-b8760fe6a05mr30181366b.2.1768342758835;
        Tue, 13 Jan 2026 14:19:18 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871188ec63sm823759966b.1.2026.01.13.14.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 14:19:18 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: linux-media@vger.kernel.org
Cc: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Subject: [PATCH] edid-decode: Always show VRR min/max values
Date: Tue, 13 Jan 2026 23:19:16 +0100
Message-ID: <20260113221916.175175-1-tomasz.pakula.oficjalny@gmail.com>
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


