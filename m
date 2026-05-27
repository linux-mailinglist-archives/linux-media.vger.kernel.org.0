Return-Path: <linux-media+bounces-62884-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAwFL+7QFmowsgcAu9opvQ
	(envelope-from <linux-media+bounces-62884-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 13:09:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE965E31FF
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 13:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 39782302814C
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 11:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC93A3E3D8D;
	Wed, 27 May 2026 11:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="mr8RK9JB"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8D13F7AAB;
	Wed, 27 May 2026 11:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779880081; cv=none; b=lR6YNwI5j/kVXU6lFR5QY5t0Q2WDuc+zak27odX+4xLsxvifxG6zf+VPV2fqKi3fBZjGtDzDk0Xkf0MZ8qXglR3qM92tnihfrPv3di5GSWuuBhuuXtala6ysYh6CjjqZNnoN0OqPixnRChCO6zFDwP2ZAzwCcrdlMKiIHhc/kWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779880081; c=relaxed/simple;
	bh=ZqH+yL0Lzbq6SNGKJGY6TU/qVgWm+YEoZ09E0XBTFMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iraYc3jF7Ds6/m1Wu1oaAFZCGMn1mKHGZJlN3dCzihj5LUPecEZPpR9G1AyYcc0YM4Q30lkM3A0rJX6ccA1k8lm8J0C/fdkkF9Vs085n2gPLQtRmpqLEFO/E220U06IZU6bUzNcmqlbEIpIhvMcyl0j2/jw4HLiTN9FL95j1qSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=mr8RK9JB; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779880079; x=1811416079;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=ZqH+yL0Lzbq6SNGKJGY6TU/qVgWm+YEoZ09E0XBTFMI=;
  b=mr8RK9JBfrb6R4YtJr/ROP1TGsjRHKAKlD5wi1JT/mtFeXWPhJT2JtVU
   sjgkSqCElxCvPgcH7PXyfXyhWqHVRMh+rI0Rumz/pC5W8k4tORlLQQnOD
   U7hVbhy01zKXNGk3cisiqpp4yaj7kY6WprF+HWcbEOgebF70e2vENAw/g
   1vFtpSSoYTdISCPnpMDNpwgTHD8b8T4fglPe9xqPFNCPxYYhNuwyICrR6
   g9kTtfYB+XKjhpLKeIYwUlv86LPxxnMWVUx2yAMBePMTOX+GML7NCJOWl
   Uvgp4K1uCKC3OySFIlecytcJlkkwjJmkOnuvuukpcxvUliqxVpTyb1oPV
   w==;
X-CSE-ConnectionGUID: IkHmY59wTXaNgxtHpBF2TQ==
X-CSE-MsgGUID: r4xRdowBR6iYOoLXCj8E2A==
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="66995047"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 May 2026 04:07:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 27 May 2026 04:07:58 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 27 May 2026 04:07:54 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Wed, 27 May 2026 16:37:24 +0530
Subject: [PATCH v5 08/12] media: microchip-isc: add gamma 1.8 and 2.4
 correction curves
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260527-microchip-isc-fixes-v5-8-b0ec1bb954be@microchip.com>
References: <20260527-microchip-isc-fixes-v5-0-b0ec1bb954be@microchip.com>
In-Reply-To: <20260527-microchip-isc-fixes-v5-0-b0ec1bb954be@microchip.com>
To: Eugen Hristev <ehristev@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Balamanikandan Gunasundar
	<balamanikandan.gunasundar@microchip.com>, <stable@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Balakrishnan
 Sambath" <balakrishnan.s@microchip.com>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62884-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:mid,microchip.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9FE965E31FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Display profiles for older macOS content (gamma 1.8) and HDR
pipelines (gamma 2.4) need curves not covered by the existing sRGB
2.2 default. Add the two extra curves to the SAMA7G5 table so
userspace can pick a curve matching the target display profile.

The two SoCs put gamma 1/2.2 at different indices in their tables
(SAMA5D2 at index 2, SAMA7G5 at index 1), so introduce a
gamma_default field on struct isc_device and let each platform set
it. The SAMA5D2 default of index 2 matches the historical behaviour.

Co-developed-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../media/platform/microchip/microchip-isc-base.c  |  2 +-
 drivers/media/platform/microchip/microchip-isc.h   |  1 +
 .../platform/microchip/microchip-sama5d2-isc.c     |  2 +
 .../platform/microchip/microchip-sama7g5-isc.c     | 56 ++++++++++++++++------
 4 files changed, 46 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index ff920019fe37..04187127070d 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1648,7 +1648,7 @@ static int isc_ctrl_init(struct isc_device *isc)
 
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_BRIGHTNESS, -1024, 1023, 1, 0);
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAMMA, 0, isc->gamma_max, 1,
-			  isc->gamma_max);
+			  isc->gamma_default);
 	isc->awb_ctrl = v4l2_ctrl_new_std(hdl, &isc_awb_ops,
 					  V4L2_CID_AUTO_WHITE_BALANCE,
 					  0, 1, 1, 1);
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
index a943b072f6be..2282ef7dd596 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -342,6 +342,7 @@ struct isc_device {
 	/* pointer to the defined gamma table */
 	const u32	(*gamma_table)[GAMMA_ENTRIES];
 	u32		gamma_max;
+	u32		gamma_default;
 
 	u32		max_width;
 	u32		max_height;
diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
index 71609a93358a..9fa8413c74c7 100644
--- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
@@ -442,6 +442,8 @@ static int microchip_isc_probe(struct platform_device *pdev)
 
 	isc->gamma_table = isc_sama5d2_gamma_table;
 	isc->gamma_max = 2;
+	/* Index 2 in the SAMA5D2 table is gamma 1/2.2 (sRGB). */
+	isc->gamma_default = 2;
 
 	isc->max_width = ISC_SAMA5D2_MAX_SUPPORT_WIDTH;
 	isc->max_height = ISC_SAMA5D2_MAX_SUPPORT_HEIGHT;
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index daa3978a89bd..06aa801b88f9 100644
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
+	  0x3dd001a, 0x3eb0018, 0x3f90018, 0x4070016 },
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
@@ -434,7 +460,9 @@ static int microchip_xisc_probe(struct platform_device *pdev)
 	}
 
 	isc->gamma_table = isc_sama7g5_gamma_table;
-	isc->gamma_max = 0;
+	isc->gamma_max = 2;
+	/* Index 1 in the SAMA7G5 table is gamma 1/2.2 (sRGB). */
+	isc->gamma_default = 1;
 
 	if (of_machine_is_compatible("microchip,sam9x7")) {
 		isc->max_width = ISC_SAM9X7_MAX_SUPPORT_WIDTH;

-- 
2.34.1


