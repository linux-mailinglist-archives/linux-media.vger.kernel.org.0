Return-Path: <linux-media+bounces-22864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5907B9E8E9D
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 10:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E78EB281C99
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 09:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E431215F65;
	Mon,  9 Dec 2024 09:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="nD2aFhU+"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE8E1EB3D;
	Mon,  9 Dec 2024 09:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733736237; cv=none; b=iQcxvS0/PhD/HwsC/1qUepCEenl6kRnMNsh3cfurKX5hpCm1Hni+RxoihDx6SgasuHRJsMde1msTCCMNgMeJSr7zceUiu17wxa/vYEBqGccMxU5a1upkzD8l72PJjUw0+RnRmX1Bq2u8XVFP42piknDRM35ayQXXA1RGJaVrmD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733736237; c=relaxed/simple;
	bh=YZ7y/T0t9DKmMJENGaF77mHqgmBeeyDvVEKNQCKvbW4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dnAyePtBEYyVtXU2HJmOZriG+J1LNRWPWvu6Kp99/RiBhk/Bzy6C+D+901rG1aSY8VGm5MwhaqNOyfyv64KfqXTQo7szHT7c0V0j32s5gKYcubI7fqBOaD3cwiP0cQtarFrGFdlE+jSBnOkYv5yZRVIr2b+htdMokaYERcYA3M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=nD2aFhU+; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733736235; x=1765272235;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YZ7y/T0t9DKmMJENGaF77mHqgmBeeyDvVEKNQCKvbW4=;
  b=nD2aFhU+xxJwwBtIera4zUz0vy90aAiVcFnJ3hW6N9wo0hEu9yNoDaHx
   DinS/19uyycgFXI4QmVY86MN1X0i9+TVvhfifdS4rma2LgfhBvQvbQQhF
   msBq926121CTQx5fbyCxSe0DjmkQarXvuJTnaVhWYzeVYAJefzwLO3O+w
   WcW+uDlPznf5M2v3T80f3/yNrqETIZBngn7jhWbLiz3s4l/g3W+UW8GX1
   26HW7uuJPpOxy1j8rDC/Wsc7bqper6XPjhU9ZdIbJ8jiINEDyNTPs+2Mk
   t8bso29zZ5VEB1zNbrgCS+/NU4KV9/QSJUPFXl4jiHxZlaI2ptwDvPBb0
   w==;
X-CSE-ConnectionGUID: TuCIRiqBRDaUjw+gxWZNtg==
X-CSE-MsgGUID: cgx42TAzRA+bi0zphClOEw==
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="202745247"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Dec 2024 02:23:48 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 9 Dec 2024 02:22:58 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 9 Dec 2024 02:22:55 -0700
From: shravan kumar <shravan.chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>
CC: <kieran.bingham@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <conor.dooley@microchip.com>,
	<valentina.fernandezalanis@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>
Subject: [PATCH V2] media: i2c: imx334: Add support for 1280x720 & 640x480 resolutions
Date: Mon, 9 Dec 2024 14:58:58 +0530
Message-ID: <20241209092858.338596-1-shravan.chippa@microchip.com>
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
 drivers/media/i2c/imx334.c | 120 ++++++++++++++++++++++++++++++-------
 1 file changed, 100 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index a544fc3df39c..377a3eb47f36 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -167,8 +167,9 @@ static const s64 link_freq[] = {
 	IMX334_LINK_FREQ_445M,
 };
 
-/* Sensor mode registers for 1920x1080@30fps */
-static const struct imx334_reg mode_1920x1080_regs[] = {
+
+/* Sensor common mode registers for 445M link frequency */
+static const struct imx334_reg common_mode_regs_445m[] = {
 	{0x3000, 0x01},
 	{0x3018, 0x04},
 	{0x3030, 0xca},
@@ -176,26 +177,10 @@ static const struct imx334_reg mode_1920x1080_regs[] = {
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
@@ -210,7 +195,7 @@ static const struct imx334_reg mode_1920x1080_regs[] = {
 	{0x300d, 0x29},
 	{0x314c, 0x29},
 	{0x314d, 0x01},
-	{0x315a, 0x06},
+	{0x315a, 0x0a},
 	{0x3168, 0xa0},
 	{0x316a, 0x7e},
 	{0x319e, 0x02},
@@ -330,6 +315,66 @@ static const struct imx334_reg mode_1920x1080_regs[] = {
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
@@ -505,6 +550,32 @@ static const struct imx334_mode supported_modes[] = {
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
 
@@ -989,6 +1060,15 @@ static int imx334_start_streaming(struct imx334 *imx334)
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


