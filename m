Return-Path: <linux-media+bounces-48617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C5CCB4C2C
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 06:27:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9CEA43001631
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 05:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2132868B4;
	Thu, 11 Dec 2025 05:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUvl1erO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE5921CC71
	for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 05:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765430842; cv=none; b=b+rrXetjU47W3uC6WgbCOibT2qk4LQt/AGsgx1s8SN7J4cgfUZxyDCm5ECPjRjJLYdBU39CuA4DvxfFZxbUFSPNT6STbVq9RUJAeMnVPFaEt7HHIdEwqrQqZyAc2tEDmdptogpKn7EVVBLiSGJGtvn7R4aP1y1myc/yvo/rFWIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765430842; c=relaxed/simple;
	bh=Pms9rGKQrV/wWRMG+vyjpUCSrq1fJ3AkYkgjY3zlwIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQ3W0GyEqgytc9djsJHDo+vuBEW/exdGFuRgPr7wPHwGi3+mGb4NTs+wVEONnJSC5iTzekCFTKtA3jF5Rpiys5JCH/+lcmbwF+vnMR8ee18BLPN9aqD9oun8jPWAdJIFwwds2auc09sp6P2cVQa3T4plDqEGUaMGPtM0wmt7WZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUvl1erO; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3436cbb723fso498970a91.2
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 21:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765430839; x=1766035639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95BH0/uinAOxOXcQXE12PRP1dAEancDYlQp6ik6Xv4U=;
        b=EUvl1erO/wjmHcz5QKkrrep5MvOl/2mlN5DzlkZh/MmsQzvD71LVaTbg147zjJN3B/
         f31/Jh2DpOZyCilWNUHuh23BMXeGVG6JRElFOJoKOoSJiSLgdR6nqZQdUN/5bF1qYpfe
         f38L5x6JRdYH6eTFHzcyAx0Uu2sRb9kJO5ZTIIK6DeK550ypBZcIFk+5woyIDTpLFq22
         sOQxzVqrg8aciAG/YNCSH5vJXs/QFDtMrG1SCdKRfhaxsBr3qdoo0qfosHgZ0zMc3rhN
         rKk15TMmK2I/h0ZsdFXYXf8ZJKRWHNiICBXFpKcqKM9hAVB9UDIu0R7VC3C2pzY2Rjr3
         hpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765430839; x=1766035639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=95BH0/uinAOxOXcQXE12PRP1dAEancDYlQp6ik6Xv4U=;
        b=AqVy7UNPcXpziD1BxAR8/Q2MM2fSkNJhPceT6UwoohJGkMTmhI4ilW3bWUPvHwFXeM
         3gb03WMIHu1+eye1ASF/ue6HoaCoxz09sy5cL3noSoAEtBT6a5YBrxaYJ1/PH+hXaXEW
         bFT7v2/l4xhkOZBvy2L8dPr2dxAOtD1+uzvA/ALE/NxWTpaOmxgWDmPks/tWZKt2G5l5
         p8x1IJ6KnfsuMf7PSMQ29pmmRsTOh6hhV5FMI0xh5Qe2YcLWYX++7bOmxQDHRtgnzROt
         dTx31NwM5YhLWaoWyFdnPbURsHH+Db9SWijNiYrWPLg3m1oB1k/E60c+n9bdQLBMIORm
         nwMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRa1M2x5CAUmeKiYjPhGmchspV9/SKPhxiNRnv8M5ttiuil0S8kmV47SmnoYR5v8Q1niZG7YkwNVuQsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUno0jquqy/MInXDnBSBP2ugL7ItfvwzsB/7yppMKtJTD2FBar
	YTyk+bwo9CuVTO2R0SHr9+6lWSMYxXpbBJsL4e8/MiZEGI8gHjYLaXtBumgY5fnB5YE=
X-Gm-Gg: AY/fxX6K2Ro9B45TO1x/aK6DvyVJAhQojcmMfC91G2c/6J27oXWU8klSYlp4YFPWXtc
	m70DtYkeLQy7sCLowRfrDoaE2NN0J9RPsGIr7RsSF8j2roakcvbu84FuyZs8lDiodHRTtRrBIrC
	NS2qtQvPHFfYI5x4o7iUqHhuYWruTTd6u6gjNVOM26R7oiZMd07OjApIMAkMXi2aDA+FTLUdgZq
	YIeKdjUteiPAvZVTFqktTl8jnAtyqi6lMhEjBS5icAqQ49NHuvizeMVOztp9wTU4rzvGn1WSCSE
	yz96Sk62qmPqQp5kWRxapZOIfUoWleM+am4QHl9exvIRxwuLyqNjySrdiDrp9v6o3rxG5HA5KLg
	gkaU5x7eRIutCtz+4SnIgumx4mt57BWb4L0dGAqsSfqKdDE3hJQ9NutwBkrkr1A1wsN8ToyaAfn
	Y5rqKYMCbMJWaBqLdcZ48NCYqZ48v0
X-Google-Smtp-Source: AGHT+IHpc88r8xX16Lc+KR4vyNGcDKZ1KjuZYVhX4XpZepWfhgWzWN1KEew9mla9BNXmowCCm58hyA==
X-Received: by 2002:a17:90b:2590:b0:343:7714:4ca6 with SMTP id 98e67ed59e1d1-34a72875249mr4523986a91.22.1765430839260;
        Wed, 10 Dec 2025 21:27:19 -0800 (PST)
Received: from SIQOL-WIN-8.localdomain ([49.36.67.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a92733507sm640351a91.10.2025.12.10.21.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 21:27:18 -0800 (PST)
From: Arjun Changla <arjunchangla7@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Arjun Changla <arjunchangla7@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove trailing whitespace
Date: Thu, 11 Dec 2025 05:26:52 +0000
Message-ID: <20251211052652.3589-2-arjunchangla7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211052652.3589-1-arjunchangla7@gmail.com>
References: <20251211052652.3589-1-arjunchangla7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error by removing trailing whitespace at line 2021.

Signed-off-by: Arjun Changla <arjunchangla7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179ad35..ff4e668f199c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2018,7 +2018,7 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	return ielength;
 }
 
-/* Ported from 8185: IsInPreAuthKeyList(). 
+/* Ported from 8185: IsInPreAuthKeyList().
  * (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.)
  * Added by Annie, 2006-05-07.
  *
-- 
2.43.0


