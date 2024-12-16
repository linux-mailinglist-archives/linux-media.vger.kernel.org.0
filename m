Return-Path: <linux-media+bounces-23447-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA9F9F294F
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 05:34:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8A38163D69
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 04:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F179D193062;
	Mon, 16 Dec 2024 04:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="p6FKsS0I"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CD6A41;
	Mon, 16 Dec 2024 04:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734323660; cv=none; b=Wj0q7x0RTKN20QwabES4p76DDyk+CJe8Z2CQMwFGz+x7zR9E0+wLlzTP4Oy+QaB0WDddNADJ0JwpabGmGIz7MkmA2h96EkYzAzhmtBYv5evrb0oahR93WbQXio6HL4+wQbt2XQbcr4/AsrN3/RkytBKILgAF4bn0HHaeFRMm2P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734323660; c=relaxed/simple;
	bh=uSkgLv1xFydHfA2kiZRuR16sCLdnO+7Np7RGcNJB+jA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NYRpsjHShquDXvSt45/99lFZEd3TuE0BzNv7Tf/EToA9D/f+mwphCnkT7q0lYLq5g755dyuC92NP00vM/4t45Uo8ufIzijH26RqJ1w0l8igcNVAnkTE+OL5UtQBRdumkXe9VIRuYNtElagueK/TdnZ5DlvmjdbJYWlmal+KtF+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=p6FKsS0I; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734323658; x=1765859658;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uSkgLv1xFydHfA2kiZRuR16sCLdnO+7Np7RGcNJB+jA=;
  b=p6FKsS0IBP3NSS/H36hd6tBXLOri2bBnTALROjSUdkeVAxgiDxzdJwuD
   9guzd99YzQHNfrKFY1//igS6urhd1ykueyes1neLGhlSMUM0cUgWGPrJX
   UDNk9rhNd93gLGU5ZKTs6tJXua66nB56vYXsUw7U8kO76Hcz0gbqyzn8r
   yTElpqRb/xe5/tWdUhbd2WLZmiEygc34Trt5G34jyjAe82x3ZZuiKDuSu
   T9aAuI7Pdo6509w/gZ6IUoWWNlCWfK/sE3JsuMCXrOVYMZBvWPdiuMl7Z
   f1Ykjg/tytmb0diiGCdXhbnlve4hsvg7borTV7ICdhjLPQykB75xUwIbc
   A==;
X-CSE-ConnectionGUID: wCQ2LqPpSZ2ODpKZ5d1ltA==
X-CSE-MsgGUID: /2ZcExdkQIah05YDtxkWgA==
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="35566894"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Dec 2024 21:34:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 15 Dec 2024 21:33:40 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sun, 15 Dec 2024 21:33:37 -0700
From: shravan kumar <shravan.chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>
CC: <kieran.bingham@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <conor.dooley@microchip.com>,
	<valentina.fernandezalanis@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>
Subject: [PATCH V3] media: i2c: imx334: Add support for 1280x720 & 640x480 resolutions
Date: Mon, 16 Dec 2024 10:09:26 +0530
Message-ID: <20241216043926.445001-1-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shravan Chippa <shravan.chippa@microchip.com>

Add support for 1280x720@30 and 640x480@30 resolutions
optimized the resolution arrays by added common register
array

Updated 1920x1080@30 resolution register array with
common register array

Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
---

changelog:

v2 -> v3
Removied blank lines reported by media CI robot 

v1 -> v2
Optimized the resolution arrays by added common register array

---
 drivers/media/i2c/imx334.c | 119 ++++++++++++++++++++++++++++++-------
 1 file changed, 99 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index a544fc3df39c..58ad67dbb331 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -167,8 +167,8 @@ static const s64 link_freq[] = {
 	IMX334_LINK_FREQ_445M,
 };
 
-/* Sensor mode registers for 1920x1080@30fps */
-static const struct imx334_reg mode_1920x1080_regs[] = {
+/* Sensor common mode registers for 445M link frequency */
+static const struct imx334_reg common_mode_regs_445m[] = {
 	{0x3000, 0x01},
 	{0x3018, 0x04},
 	{0x3030, 0xca},
@@ -176,26 +176,10 @@ static const struct imx334_reg mode_1920x1080_regs[] = {
 	{0x3032, 0x00},
 	{0x3034, 0x4c},
 	{0x3035, 0x04},
-	{0x302c, 0xf0},
-	{0x302d, 0x03},
-	{0x302e, 0x80},
-	{0x302f, 0x07},
-	{0x3074, 0xcc},
-	{0x3075, 0x02},
-	{0x308e, 0xcd},
-	{0x308f, 0x02},
-	{0x3076, 0x38},
-	{0x3077, 0x04},
-	{0x3090, 0x38},
-	{0x3091, 0x04},
-	{0x3308, 0x38},
-	{0x3309, 0x04},
-	{0x30C6, 0x00},
+	{0x30c6, 0x00},
 	{0x30c7, 0x00},
 	{0x30ce, 0x00},
 	{0x30cf, 0x00},
-	{0x30d8, 0x18},
-	{0x30d9, 0x0a},
 	{0x304c, 0x00},
 	{0x304e, 0x00},
 	{0x304f, 0x00},
@@ -210,7 +194,7 @@ static const struct imx334_reg mode_1920x1080_regs[] = {
 	{0x300d, 0x29},
 	{0x314c, 0x29},
 	{0x314d, 0x01},
-	{0x315a, 0x06},
+	{0x315a, 0x0a},
 	{0x3168, 0xa0},
 	{0x316a, 0x7e},
 	{0x319e, 0x02},
@@ -330,6 +314,66 @@ static const struct imx334_reg mode_1920x1080_regs[] = {
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
+/* Sensor mode registers for 1920x1080@30fps */
+static const struct imx334_reg mode_1920x1080_regs[] = {
+	{0x302c, 0xf0},
+	{0x302d, 0x03},
+	{0x302e, 0x80},
+	{0x302f, 0x07},
+	{0x3074, 0xcc},
+	{0x3075, 0x02},
+	{0x308e, 0xcd},
+	{0x308f, 0x02},
+	{0x3076, 0x38},
+	{0x3077, 0x04},
+	{0x3090, 0x38},
+	{0x3091, 0x04},
+	{0x3308, 0x38},
+	{0x3309, 0x04},
+	{0x30d8, 0x18},
+	{0x30d9, 0x0a},
+};
+
 /* Sensor mode registers for 3840x2160@30fps */
 static const struct imx334_reg mode_3840x2160_regs[] = {
 	{0x3000, 0x01},
@@ -505,6 +549,32 @@ static const struct imx334_mode supported_modes[] = {
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
 
@@ -989,6 +1059,15 @@ static int imx334_start_streaming(struct imx334 *imx334)
 	const struct imx334_reg_list *reg_list;
 	int ret;
 
+	if (link_freq[imx334->cur_mode->link_freq_idx] == IMX334_LINK_FREQ_445M) {
+		ret = imx334_write_regs(imx334, common_mode_regs_445m,
+					ARRAY_SIZE(common_mode_regs_445m));
+		if (ret) {
+			dev_err(imx334->dev, "fail to write common registers");
+			return ret;
+		}
+	}
+
 	/* Write sensor mode registers */
 	reg_list = &imx334->cur_mode->reg_list;
 	ret = imx334_write_regs(imx334, reg_list->regs,
-- 
2.34.1


