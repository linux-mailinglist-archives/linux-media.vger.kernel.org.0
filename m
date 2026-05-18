Return-Path: <linux-media+bounces-61967-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDBaFDr5CmpZ+QQAu9opvQ
	(envelope-from <linux-media+bounces-61967-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:34:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF58056BA38
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1524A3034D96
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05AFA3F65F1;
	Mon, 18 May 2026 11:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ecIia/c7"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED343EFFDB;
	Mon, 18 May 2026 11:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103842; cv=none; b=sFinogkAvW6Y2139AVSfTFQLEeCxFuVwMHokw2QojtlDM6jIiSj1YcVM7sl7yAok4LJMAz9P9Te2S0z9ooaR4RZnIRAmCLqSLVwLjRcFJxt4x/dT1/bOMImvIxQTZRtGzbWXvC41X9E7LJjQQPeCT8R9MIktGS95hi21ldskUpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103842; c=relaxed/simple;
	bh=yZ+C7TBFiu0S3V53+8D1z0dCw/GlwKuCCqWizLalE9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=L2ywWMzMJaEIAH29M/hxWCCCSOcd3sD67cbeZMgJZvlWwEHHmIZCzcIL9QrHcJR7bd93z/sicOKMCs3PwNACMbpYUXhRCcjdVzg6WkfGqIjogN3kIYRG3ABiRm/Ga1VnI0/SYSkNseeiT7Juruh2kbwthV2yLWTBH/2y2vn+jDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=ecIia/c7; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779103839; x=1810639839;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=yZ+C7TBFiu0S3V53+8D1z0dCw/GlwKuCCqWizLalE9s=;
  b=ecIia/c7zeBwLnlNq54S37BDxYTHwepSzMAEA4sGqYNFiLCuLQY+J0w3
   Hi28bXLSCuAe/YHL3iil0UDCXMoea9NUhehMTMxf6L0j5f6YvOAJzhfCE
   WmtU+zUHXyo9SuXbcl5cgRHoiHsxmExBZtSzRhVZKu95k1wJdMKzVQfTE
   0hEtNSKG7E7hBlPwl8V6Zkk3U/LMMVhIqKyBtIW/mojtEzVcQ1T1jsi9E
   2x6h0Ib4HaNl8jN8jMwv6TBBPTyn7UV64oBpdUzlG3wjBmsnwwYJA1QbD
   Z5w65hrwSyGh5mSMNIftjq7Yuj/Yr0oN8QCz0J5TUo/RiqQizCnGUndeg
   Q==;
X-CSE-ConnectionGUID: jxjBGUNeTiO/slq8gEZH5Q==
X-CSE-MsgGUID: /VC9iqjMSrS2mpM9+HTreg==
X-IronPort-AV: E=Sophos;i="6.23,241,1770620400"; 
   d="scan'208";a="56879082"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 May 2026 04:30:38 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 18 May 2026 04:30:37 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 18 May 2026 04:30:33 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Mon, 18 May 2026 16:59:46 +0530
Subject: [PATCH v4 08/12] media: microchip-isc: add gamma 1.8 and 2.4
 correction curves
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260518-balki-isc-series1-v4-v4-8-97f189185b7e@microchip.com>
References: <20260518-balki-isc-series1-v4-v4-0-97f189185b7e@microchip.com>
In-Reply-To: <20260518-balki-isc-series1-v4-v4-0-97f189185b7e@microchip.com>
To: Eugen Hristev <eugen.hristev@linaro.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Laurent
 Pinchart" <laurent.pinchart@ideasonboard.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: EF58056BA38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61967-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:mid,microchip.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add gamma 1.8 and 2.4 curves alongside the existing 2.2 (sRGB).
V4L2_CID_GAMMA selects preset curves: 0=2.4, 1=2.2, 2=1.8.

Co-developed-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../media/platform/microchip/microchip-isc-base.c  |  3 +-
 .../platform/microchip/microchip-sama7g5-isc.c     | 54 ++++++++++++++++------
 2 files changed, 41 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 23a09ed12946..ae2a0c6ba566 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1647,8 +1647,7 @@ static int isc_ctrl_init(struct isc_device *isc)
 	ctrls->brightness = 0;
 
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_BRIGHTNESS, -1024, 1023, 1, 0);
-	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAMMA, 0, isc->gamma_max, 1,
-			  isc->gamma_max);
+	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAMMA, 0, isc->gamma_max, 1, 1);
 	isc->awb_ctrl = v4l2_ctrl_new_std(hdl, &isc_awb_ops,
 					  V4L2_CID_AUTO_WHITE_BALANCE,
 					  0, 1, 1, 1);
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index 04930aa0f289..8b73b625d92b 100644
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
@@ -434,7 +460,7 @@ static int microchip_xisc_probe(struct platform_device *pdev)
 	}
 
 	isc->gamma_table = isc_sama7g5_gamma_table;
-	isc->gamma_max = 0;
+	isc->gamma_max = 2;
 
 	if (of_machine_is_compatible("microchip,sam9x7")) {
 		isc->max_width = ISC_SAM9X7_MAX_SUPPORT_WIDTH;

-- 
2.34.1


