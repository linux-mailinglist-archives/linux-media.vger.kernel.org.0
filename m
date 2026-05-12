Return-Path: <linux-media+bounces-61293-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DEoDaFMA2pq3AEAu9opvQ
	(envelope-from <linux-media+bounces-61293-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:52:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A05105240BC
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2580531665DB
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CDED3C584E;
	Tue, 12 May 2026 15:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="UJxThwQh"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C833C5826;
	Tue, 12 May 2026 15:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600651; cv=none; b=U0qMvW4LG/5A22/gjH4qnliulIhd5ogwwV15j1o0GpMC1ADA2Q13FnbWp4T0bkCgfuZCi8F3x/RrBaZXBV2PYQi2przVPjRElAgb15DIXHJRRno6I0fJY1KM3BGSr2Es++xKanX000UnJkVkYcFDO8OGw8EA3smK5Ts7z0mbHKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600651; c=relaxed/simple;
	bh=uYJv336XuF21R7tlG7gdsFm+BJb9UM1WlGAQfCOXfXo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T7SiprFVlJT+ar5hTX24PKHzbDAdtTkYxByiAVACyDUiXwOWJyE2tcSLw86whsAchOJ0jA6lnv9NORd7b/+29JbqT2uCFRXEmFe1dUl7LK34ZV0EY1pms4IknsJFL4iKHuUeva1u5io/zpCVlrgkXJ5BvE4SZWg/JIr65Z19Olg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=UJxThwQh; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778600650; x=1810136650;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uYJv336XuF21R7tlG7gdsFm+BJb9UM1WlGAQfCOXfXo=;
  b=UJxThwQhzDRbwsWNGEl5YU0kUyYK47T/iA2IDN2n3HN7kOxGPHOdCTg2
   mLDUInyWQ1I7LblWfbeXPunY+SMyTwJ7+Kj6yyjVbzo8+/3AHdrZ0p/Rc
   kn4DLaedc2dxB11xkr409dSf6ZCNlP2kbFJp/gKM3pcoy4l3Y0M6Pxm32
   46ljunew852iCpgrELls0/LTMx+9ruXWnVBHaLhtNwcS9NoOngdfyXEka
   ByNGLPOkoIT2LbbC2urDkXKLVtMI/+x4ZwcjWcSqCSM07anMnJ6fuT8Z0
   M1kMfn9oV6zMff11HyDaELv5Xis6TQJN5jiSDCgaDh9ywFbf23WQvwTfn
   Q==;
X-CSE-ConnectionGUID: UpSH/YpTSxqlzkc+jPyXEw==
X-CSE-MsgGUID: jAqw9u3UQS2paxLkY75+GQ==
X-IronPort-AV: E=Sophos;i="6.23,231,1770620400"; 
   d="scan'208";a="65713106"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 08:44:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Tue, 12 May 2026 08:44:09 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 12 May 2026 08:44:06 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <eugen.hristev@linaro.org>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>,
	"Balamanikandan Gunasundar" <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH v2 08/15] media: microchip-isc: add gamma 1.8 and 2.4 correction curves
Date: Tue, 12 May 2026 21:13:32 +0530
Message-ID: <20260512154339.210444-9-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512154339.210444-1-balakrishnan.s@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
 <20260512154339.210444-1-balakrishnan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Rspamd-Queue-Id: A05105240BC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61293-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[microchip.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,microchip.com:email,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Action: no action

Add gamma 1.8 and 2.4 curves alongside the existing 2.2 (sRGB).
V4L2_CID_GAMMA selects preset curves: 0=3D2.4, 1=3D2.2, 2=3D1.8.

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microch=
ip.com>
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../platform/microchip/microchip-isc-base.c   |  3 +-
 .../microchip/microchip-sama7g5-isc.c         | 54 ++++++++++++++-----
 2 files changed, 41 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/driver=
s/media/platform/microchip/microchip-isc-base.c
index 23a09ed12946..ae2a0c6ba566 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -1647,8 +1647,7 @@ static int isc_ctrl_init(struct isc_device *isc)
 	ctrls->brightness =3D 0;
=20
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_BRIGHTNESS, -1024, 1023, 1, 0);
-	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAMMA, 0, isc->gamma_max, 1,
-			  isc->gamma_max);
+	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAMMA, 0, isc->gamma_max, 1, 1);
 	isc->awb_ctrl =3D v4l2_ctrl_new_std(hdl, &isc_awb_ops,
 					  V4L2_CID_AUTO_WHITE_BALANCE,
 					  0, 1, 1, 1);
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/dri=
vers/media/platform/microchip/microchip-sama7g5-isc.c
index 04930aa0f289..8b73b625d92b 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -320,21 +320,47 @@ static void isc_sama7g5_adapt_pipeline(struct isc_dev=
ice *isc)
 	isc->try_config.bits_pipeline &=3D ISC_SAMA7G5_PIPELINE;
 }
=20
-/* Gamma table with gamma 1/2.2 */
+/* Gamma tables with gamma values 0.42, 0.45(Default), 0.56 */
 static const u32 isc_sama7g5_gamma_table[][GAMMA_ENTRIES] =3D {
-	/* index 0 --> gamma bipartite */
+	/* index 0 --> gamma bipartite 1/2.4(=3D0.42) */
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
+	/* index 1 --> gamma bipartite 1/2.2(=3D0.45) */
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
+	/* index 2 --> gamma bipartite 1/1.8(=3D0.56) */
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
=20
 static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
@@ -434,7 +460,7 @@ static int microchip_xisc_probe(struct platform_device =
*pdev)
 	}
=20
 	isc->gamma_table =3D isc_sama7g5_gamma_table;
-	isc->gamma_max =3D 0;
+	isc->gamma_max =3D 2;
=20
 	if (of_machine_is_compatible("microchip,sam9x7")) {
 		isc->max_width =3D ISC_SAM9X7_MAX_SUPPORT_WIDTH;
--=20
2.34.1


