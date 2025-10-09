Return-Path: <linux-media+bounces-44119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1200FBC9E77
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 18:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AABE91A64964
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 15:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4722EFD98;
	Thu,  9 Oct 2025 15:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Ru5DUW1k"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBCC225409;
	Thu,  9 Oct 2025 15:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025283; cv=none; b=HqbrMdIghJxR3s3PYPlNbeiHkXvT6zK4DTl+Yq2mtJ5Jn3oMx/wKxWN38JNDAtHe6nRS7lmTQyEBbyUE9yic4cikNk5LzjP1MmXD6bs4zk8ywSdCaSPYH5fJKUkkOvYiZtikc3yNxzqVh7VXCLSRgng7RCkq/9u/swji2q0ExEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025283; c=relaxed/simple;
	bh=NJfyzXUCb89JY0Dq3kP4I1bs+19KM85e+cCytqGep4U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sm4EnWe5RLOG+OC/DFiwuRlQwtD0JLdl8GaTAWp1TN+Yt7jTUZMQTOad4jFeqClsCBSDk64OW592gbnUVW+gl15nex/GEC2z2RbKzjRH2uhJLPBSZhCfL/rBqgTc3u9wQNhN7dLGqjQfccP1rl5HOnZWquQQ//VkawmM1tG36H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Ru5DUW1k; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1760025281; x=1791561281;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NJfyzXUCb89JY0Dq3kP4I1bs+19KM85e+cCytqGep4U=;
  b=Ru5DUW1k5T+dzhD7ItmdhfnXDVWGxSzo7VT/ibFeWNrib936h0NluNqK
   a0qcxCC9D9Pj0HNzN4rE0KBm5fkOsoaK+hU2Osq8W2+HsgELJ3H+b/v+P
   ERD0QyBSHfr0MNg5zX0uel5E4lg5cyJY0+Gu439V7G3r+Bgohx5yXCnqt
   bv5AsYC7QSVS/ZaptQRLWAAUs+tnEpXBk/g47XRaE0l77It90BukvWnRi
   1bE08iTTAAY2xNIgqqwWDC0jzCIsGr5MA81AjDcbMkZD8i4axFoQa6XaH
   2hBsXejGBq55OnQn+NdC0EogvnTA2JsyEuZdQ185UE1Uac5qq0L74CCWQ
   g==;
X-CSE-ConnectionGUID: /X4p8s51R2m1uwZxUki7lw==
X-CSE-MsgGUID: q6g5q7N2RvO0M8yPNYjtAw==
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="214905337"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2025 08:54:39 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Oct 2025 08:54:14 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 9 Oct 2025 08:54:06 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Eugen Hristev <eugen.hristev@linaro.org>, Chas Williams
	<3chas3@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>, Hans Verkuil <hverkuil@kernel.org>, "Ricardo
 Ribalda" <ribalda@chromium.org>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Daniel Scally
	<dan.scally+renesas@ideasonboard.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-atm-general@lists.sourceforge.net>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH 07/18] media: platform: microchip: Extend gamma table and control range
Date: Thu, 9 Oct 2025 21:22:40 +0530
Message-ID: <20251009155251.102472-8-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Balakrishnan Sambath <balakrishnan.s@microchip.com>

Add support for multiple levels of gamma correction options (1/2.4,
1/2.2, 1/1.8) which can be modified through V4L2 controls(with range
0-2), with a default of 1/2.2(index 1).

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 .../platform/microchip/microchip-isc-base.c   |  3 +-
 .../microchip/microchip-sama7g5-isc.c         | 54 ++++++++++++++-----
 2 files changed, 41 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 2706a27a2506..cd379f95fc1c 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1715,8 +1715,7 @@ static int isc_ctrl_init(struct isc_device *isc)
 	ctrls->brightness = 0;
 
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_BRIGHTNESS, -1024, 1023, 1, 0);
-	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAMMA, 0, isc->gamma_max, 1,
-			  isc->gamma_max);
+	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAMMA, 0, isc->gamma_max, 1, 1);
 	isc->awb_ctrl = v4l2_ctrl_new_std(hdl, &isc_awb_ops,
 					  V4L2_CID_AUTO_WHITE_BALANCE,
 					  0, 1, 1, 1);
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index 03f7a46acd47..d3ed9cfe6686 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -320,21 +320,47 @@ static void isc_sama7g5_adapt_pipeline(struct isc_device *isc)
 	isc->try_config.bits_pipeline &= ISC_SAMA7G5_PIPELINE;
 }
 
-/* Gamma table with gamma 1/2.2 */
+/* Gamma tables with gamma values 0.42, 0.45(Default), 0.56 */
 static const u32 isc_sama7g5_gamma_table[][GAMMA_ENTRIES] = {
-	/* index 0 --> gamma bipartite */
+	/* index 0 --> gamma bipartite 1/2.4(=0.42) */
 	{
-	      0x980,  0x4c0320,  0x650260,  0x7801e0,  0x8701a0,  0x940180,
-	   0xa00160,  0xab0120,  0xb40120,  0xbd0120,  0xc60100,  0xce0100,
-	   0xd600e0,  0xdd00e0,  0xe400e0,  0xeb00c0,  0xf100c0,  0xf700c0,
-	   0xfd00c0, 0x10300a0, 0x10800c0, 0x10e00a0, 0x11300a0, 0x11800a0,
-	  0x11d00a0, 0x12200a0, 0x12700a0, 0x12c0080, 0x13000a0, 0x1350080,
-	  0x13900a0, 0x13e0080, 0x1420076, 0x17d0062, 0x1ae0054, 0x1d8004a,
-	  0x1fd0044, 0x21f003e, 0x23e003a, 0x25b0036, 0x2760032, 0x28f0030,
-	  0x2a7002e, 0x2be002c, 0x2d4002c, 0x2ea0028, 0x2fe0028, 0x3120026,
-	  0x3250024, 0x3370024, 0x3490022, 0x35a0022, 0x36b0020, 0x37b0020,
-	  0x38b0020, 0x39b001e, 0x3aa001e, 0x3b9001c, 0x3c7001c, 0x3d5001c,
-	  0x3e3001c, 0x3f1001c, 0x3ff001a, 0x40c001a },
+	      0x940,  0x4b0310,  0x630250,  0x7601d0,  0x840190,  0x910170,
+	   0x9d0150,  0xa80110,  0xb10110,  0xba0110,  0xc300f0,  0xcb00f0,
+	   0xd300e0,  0xda00e0,  0xe100c0,  0xe800c0,  0xee00c0,  0xf400c0,
+	   0xfa00a0, 0x10000a0, 0x10500a0, 0x10b00a0, 0x11000a0, 0x11500a0,
+	  0x11a0080, 0x11f0080, 0x1240080, 0x1290080, 0x12e0080, 0x1330070,
+	  0x1380070, 0x13c0070, 0x1410070, 0x17a0060, 0x1aa0052, 0x1d40046,
+	  0x1f90042, 0x21b003c, 0x23a0038, 0x2570034, 0x2720030, 0x28b002e,
+	  0x2a3002c, 0x2ba002a, 0x2d0002a, 0x2e60028, 0x2fa0026, 0x30e0026,
+	  0x3210024, 0x3330022, 0x3450022, 0x3560020, 0x3670020, 0x3770020,
+	  0x387001e, 0x396001e, 0x3a5001c, 0x3b3001c, 0x3c1001c, 0x3cf001a,
+	  0x3dd001a, 0x3eb0018, 0x3f90018 },
+	/* index 1 --> gamma bipartite 1/2.2(=0.45) */
+	{
+	     0x980,  0x4c0320,  0x650260,  0x7801e0,  0x8701a0,  0x940180,
+	  0xa00160,  0xab0120,  0xb40120,  0xbd0120,  0xc60100,  0xce0100,
+	  0xd600e0,  0xdd00e0,  0xe400e0,  0xeb00c0,  0xf100c0,  0xf700c0,
+	  0xfd00c0, 0x10300a0, 0x10800c0, 0x10e00a0, 0x11300a0, 0x11800a0,
+	 0x11d00a0, 0x12200a0, 0x12700a0, 0x12c0080, 0x13000a0, 0x1350080,
+	 0x13900a0, 0x13e0080, 0x1420076, 0x17d0062, 0x1ae0054, 0x1d8004a,
+	 0x1fd0044, 0x21f003e, 0x23e003a, 0x25b0036, 0x2760032, 0x28f0030,
+	 0x2a7002e, 0x2be002c, 0x2d4002c, 0x2ea0028, 0x2fe0028, 0x3120026,
+	 0x3250024, 0x3370024, 0x3490022, 0x35a0022, 0x36b0020, 0x37b0020,
+	 0x38b0020, 0x39b001e, 0x3aa001e, 0x3b9001c, 0x3c7001c, 0x3d5001c,
+	 0x3e3001c, 0x3f1001c, 0x3ff001a, 0x40c001a },
+	/* index 2 --> gamma bipartite 1/1.8(=0.56) */
+	{
+	      0xa62,  0x4f0350,  0x680280,  0x7e0200,  0x8d01c0,  0x9a01a0,
+	   0xa50180,  0xb00140,  0xb90140,  0xc20120,  0xcb0120,  0xd30100,
+	   0xdb0100,  0xe300e0,  0xea00e0,  0xf100e0,  0xf700c0,  0xfd00c0,
+	  0x10300c0, 0x10900a0, 0x10e00a0, 0x11400a0, 0x11900a0, 0x11e00a0,
+	  0x12300a0, 0x12800a0, 0x12d0080, 0x1320080, 0x1370080, 0x13c0080,
+	  0x1410080, 0x1460080, 0x14a0070, 0x1830060, 0x1b40052, 0x1df0048,
+	  0x2040042, 0x2250040, 0x2440038, 0x2600036, 0x27b0032, 0x2940030,
+	  0x2ac002e, 0x2c4002c, 0x2da002a, 0x2f0002a, 0x3050028, 0x3190026,
+	  0x32c0026, 0x33e0024, 0x3500024, 0x3610022, 0x3720020, 0x3820020,
+	  0x3920020, 0x3a2001e, 0x3b1001e, 0x3c0001c, 0x3ce001c, 0x3dc001c,
+	  0x3ea001a, 0x3f8001a, 0x4060018, 0x4130018 },
 };
 
 static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
@@ -434,7 +460,7 @@ static int microchip_xisc_probe(struct platform_device *pdev)
 	}
 
 	isc->gamma_table = isc_sama7g5_gamma_table;
-	isc->gamma_max = 0;
+	isc->gamma_max = 2;
 
 	if ((of_machine_is_compatible("microchip,sam9x7"))) {
 		isc->max_width = ISC_SAM9X7_MAX_SUPPORT_WIDTH;
-- 
2.34.1


