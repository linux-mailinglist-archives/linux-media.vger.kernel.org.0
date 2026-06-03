Return-Path: <linux-media+bounces-63505-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z2oJK2HUH2pKqgAAu9opvQ
	(envelope-from <linux-media+bounces-63505-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:14:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C50C66350E4
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:14:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=microchip.com header.s=mchp header.b=1P4sVWVv;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63505-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63505-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=microchip.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8F58A30D4C7D
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 07:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AF6403E8D;
	Wed,  3 Jun 2026 06:59:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A65D3F6614;
	Wed,  3 Jun 2026 06:59:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469970; cv=none; b=ECgROdJ9MoctjqAljqYeJgBGIdKpxkjdgXiLEVZh4457ttZEtbShB99mDEB++GjkQvCevJR4Cx0KK0Mu7DfQ3f2ZsZba5ipmXoENjNUr9td3zc9mktfGtAEE0ft8nZp9emdYOnS+8szguxqmeetc9b0s0I1R2wmoFn9C0boQ678=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469970; c=relaxed/simple;
	bh=J6vCUA6gfC2cZmkRL6m4MRLlUhymh1mKtMheC4UaCNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aYd7V3aUORAXBEFChO5CTdSu0IDN72zr67DjqXBr1gzp2ElFLwFtu24HBecdOwBTr/A4Cnt5oxK+ZcVo/2yuO4Evvom5DbN66mHt9EX+jjgRtg/9UtmgeCdhEl5xIwCkiphBY9mPceY9/Sf6y7GDUgC+AOsKaby64LBvSRG0SGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=1P4sVWVv; arc=none smtp.client-ip=68.232.153.233
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1780469970; x=1812005970;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=J6vCUA6gfC2cZmkRL6m4MRLlUhymh1mKtMheC4UaCNY=;
  b=1P4sVWVvdR98OgPhMBu+Lf760JPk4FSpl4kTVDsHubrXPQ1DJsH1lXxY
   ZFpqaMZCLCXb+n7HyOrP6HyDZQYueC2JeA/sEaKSw6vXHZwu9m2nPNHam
   vClfiCsQWpzogEYXCEsCbFrsFRLvfZrLWH/PaBKG+HCyIMeaIqwKWp4TL
   McWsdEfiJ0V76nMEviLrK0dJ28HDRlxaLymoTYuZKRxjZbE3H397VxVSt
   rGzgESKqOLivm0ZlxagKo6ZjfYpUewnWB00FrZsgF1llrh/RGHZw0U/3Y
   KxZQDrZ7HrRY41Uf8eHWK/7PrCP9oB4JYQJ3R/l+wj01UckkVS1L7ygrM
   w==;
X-CSE-ConnectionGUID: ODQ1mTl1QfmHVo+OD6Pyrg==
X-CSE-MsgGUID: nLDel/tWTDy5OSJC94Sw8g==
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="58510261"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 23:59:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Tue, 2 Jun 2026 23:59:28 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 2 Jun 2026 23:59:24 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Wed, 3 Jun 2026 12:28:51 +0530
Subject: [PATCH v6 08/12] media: microchip-isc: add gamma 1.8 and 2.4
 correction curves
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260603-microchip-isc-fixes-v6-8-8c3d7474a768@microchip.com>
References: <20260603-microchip-isc-fixes-v6-0-8c3d7474a768@microchip.com>
In-Reply-To: <20260603-microchip-isc-fixes-v6-0-8c3d7474a768@microchip.com>
To: Eugen Hristev <ehristev@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Balamanikandan Gunasundar
	<balamanikandan.gunasundar@microchip.com>, <stable@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Balakrishnan
 Sambath" <balakrishnan.s@microchip.com>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63505-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ehristev@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:balamanikandan.gunasundar@microchip.com,m:stable@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:balakrishnan.s@microchip.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,microchip.com:mid,microchip.com:dkim,microchip.com:from_mime,microchip.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C50C66350E4

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
index 287fc76da479..ac21fe1dade0 100644
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


