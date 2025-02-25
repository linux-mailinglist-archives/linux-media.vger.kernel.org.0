Return-Path: <linux-media+bounces-26893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 725F4A43543
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 07:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C92ED7ABFC9
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 06:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BA325A328;
	Tue, 25 Feb 2025 06:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="T/3enqJ2"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF5E257437;
	Tue, 25 Feb 2025 06:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740464952; cv=none; b=BgfpwN86VmX6rhoOxggzhQLNVxIV22fLZsjwumeBefKufVTRgyPDjLWPhurlQVTYbQw75NMs74a44OCAECli059ZRmibdijGJ88WcyBRii+PgvLLa8S2JY/R5vAZ1SAgEHKU60J/pd3b1zGlZKS2ZpjUI1YTklyoEW/6zwk2lp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740464952; c=relaxed/simple;
	bh=6H5elsDLfN7x4ABCoiVo5OmOsniFojqAYjePdFe5/Xk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cBZVo6ZgkhJpv1nqoVv1taiCmpARqw2mDjoTjKuOYo7plSib3x69yEUrolhnkiQMbvTNmEwHBfDtAGFWRFns6qUgxtgZX1G/ocm52Ovjj+1QePxjse9JNT6y4tjeWiJVh67KewI2qLtRsxmKJWS1yyrThrIeHklsDEG0H5xqfEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=T/3enqJ2; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740464952; x=1772000952;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6H5elsDLfN7x4ABCoiVo5OmOsniFojqAYjePdFe5/Xk=;
  b=T/3enqJ224qkljWNA4RgZ3p04RvpLkhOcSd7fdIfpmjNazDwd34kN+mt
   5Wxlexek54StqQvClmd4EzOIwq8ZQdyaQ4ZgmZaEXFMahRINXt3UTI60M
   oq7fVCktaVCHGnfXBp49V6NUGSGik2T71T4KZACO4azPSi1kfxNkc03Dt
   z3bTiPibt9WOHbK12syspRJCZIBVvfVYizltY5YM5WgEvxLTNUoMmdZDN
   EyJv461foOhqJQCsm/WqZ/ECAHZnnKbqAS7TFy+DOxNRnoOWZhdKSNzZL
   m/O2GEpQcbsLJ7HGPpHqYrWbSUCgzmie0DYUklRQQStlhzhD2VVM9fvpH
   g==;
X-CSE-ConnectionGUID: ADVUi8D6REKc6zSlr8EjjA==
X-CSE-MsgGUID: m5i9WV8IQVmrAieeOjZClg==
X-IronPort-AV: E=Sophos;i="6.13,313,1732604400"; 
   d="scan'208";a="38087711"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Feb 2025 23:29:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 24 Feb 2025 23:28:27 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 24 Feb 2025 23:28:24 -0700
From: shravan kumar <shravan.chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>
CC: <kieran.bingham@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <conor.dooley@microchip.com>,
	<valentina.fernandezalanis@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>
Subject: [PATCH V5 2/2] media: i2c: imx334: add modes for 720p and 480p resolutions
Date: Tue, 25 Feb 2025 11:56:35 +0530
Message-ID: <20250225062635.3566513-3-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225062635.3566513-1-shravan.chippa@microchip.com>
References: <20250225062635.3566513-1-shravan.chippa@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shravan Chippa <shravan.chippa@microchip.com>

Added support for 1280x720@30 and 640x480@30 resolutions

Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
---
 drivers/media/i2c/imx334.c | 66 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index b2ad19abaca8..0172406780df 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -314,6 +314,46 @@ static const struct imx334_reg common_mode_regs[] = {
 	{0x3002, 0x00},
 };
 
+/* Sensor mode registers for 640x480@30fps */
+static const struct imx334_reg mode_640x480_regs[] = {
+	{0x302c, 0x70},
+	{0x302d, 0x06},
+	{0x302e, 0x80},
+	{0x302f, 0x02},
+	{0x3074, 0x48},
+	{0x3075, 0x07},
+	{0x308e, 0x49},
+	{0x308f, 0x07},
+	{0x3076, 0xe0},
+	{0x3077, 0x01},
+	{0x3090, 0xe0},
+	{0x3091, 0x01},
+	{0x3308, 0xe0},
+	{0x3309, 0x01},
+	{0x30d8, 0x30},
+	{0x30d9, 0x0b},
+};
+
+/* Sensor mode registers for 1280x720@30fps */
+static const struct imx334_reg mode_1280x720_regs[] = {
+	{0x302c, 0x30},
+	{0x302d, 0x05},
+	{0x302e, 0x00},
+	{0x302f, 0x05},
+	{0x3074, 0x84},
+	{0x3075, 0x03},
+	{0x308e, 0x85},
+	{0x308f, 0x03},
+	{0x3076, 0xd0},
+	{0x3077, 0x02},
+	{0x3090, 0xd0},
+	{0x3091, 0x02},
+	{0x3308, 0xd0},
+	{0x3309, 0x02},
+	{0x30d8, 0x30},
+	{0x30d9, 0x0b},
+};
+
 /* Sensor mode registers for 1920x1080@30fps */
 static const struct imx334_reg mode_1920x1080_regs[] = {
 	{0x302c, 0xf0},
@@ -436,6 +476,32 @@ static const struct imx334_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
 			.regs = mode_1920x1080_regs,
 		},
+	}, {
+		.width = 1280,
+		.height = 720,
+		.hblank = 2480,
+		.vblank = 1170,
+		.vblank_min = 45,
+		.vblank_max = 132840,
+		.pclk = 297000000,
+		.link_freq_idx = 1,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
+			.regs = mode_1280x720_regs,
+		},
+	}, {
+		.width = 640,
+		.height = 480,
+		.hblank = 2480,
+		.vblank = 1170,
+		.vblank_min = 45,
+		.vblank_max = 132840,
+		.pclk = 297000000,
+		.link_freq_idx = 1,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_640x480_regs),
+			.regs = mode_640x480_regs,
+		},
 	},
 };
 
-- 
2.34.1


