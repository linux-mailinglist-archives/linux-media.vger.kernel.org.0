Return-Path: <linux-media+bounces-27538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0F5A4F66B
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 06:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70BD01890100
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 05:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44201D7E42;
	Wed,  5 Mar 2025 05:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="I78ijKRo"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B037A19CC2E;
	Wed,  5 Mar 2025 05:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741151805; cv=none; b=aK0L8MkO+l9zRZT3AbDLMMyJ837olGijlMykNjwRUId9Jyim7NfoHpX3WSfmXYVGB2QqYWt4is9YEtuNTwShbSaTBKVAPvQq4a2puWAE2MlMb4nYgy9fIar6OCGeYGMvUX/b81ljzvEbItoRkp0OKeodDrgEl965756VEY+wV+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741151805; c=relaxed/simple;
	bh=XQcEfTYfaBlSazQMxBxzv/V//+2fyyZXJcUSTp/Buug=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DNUybkrIZoabunRLfEQm5UR/G/b9NK13RFtRmh/6HJQAWQKoL5On/rl2bEWXST3voQZJ3CTrWydJ7LLE9HlxPs6Zb5lzZNK5m8lv9OSbmB75lEWLNkzowAfGjucFe7mEr4rJWmbOsdsUiXwxO2VL1ULxBXNghCg1i6zS0wZq1HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=I78ijKRo; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1741151803; x=1772687803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XQcEfTYfaBlSazQMxBxzv/V//+2fyyZXJcUSTp/Buug=;
  b=I78ijKRoCSyZ3sdBm8CPXEkM1qhXr/s9KOowvKGIpiePe+sxWtu8TFyn
   cf6cQ5dQRuPehZXYedU30Nh86M4hRsjgnWn0Cr9xgRFuuDsLLOPBXLH+V
   nHUZHIUGIBl8+ubaKY7ioO/65YVArywQdqxgCknqOWOa2rt7bV9Kix1qc
   1T4fEccnexQ4MGANv2Gaz2GEx/OXzPTJxwxUtW+fcoiRpo4HGaSYqzBgH
   6CdYX2xVVMu6IFvQrh1U9JmXJEsKbAQVLSIuKxIS43z33IlIgyA2ucK3S
   uJGQOOuNCaA6u/UbiwosrEXdHlfVOmgx3Fla6bhTL1NibSdWbhjslVwqj
   A==;
X-CSE-ConnectionGUID: Blbl5gjCRMSkEPMLME7zkg==
X-CSE-MsgGUID: IHzxSL/oSym8y1hyyk3fag==
X-IronPort-AV: E=Sophos;i="6.14,222,1736838000"; 
   d="scan'208";a="205972041"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Mar 2025 22:16:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 4 Mar 2025 22:16:29 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 4 Mar 2025 22:16:26 -0700
From: shravan kumar <shravan.chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>
CC: <kieran.bingham@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <conor.dooley@microchip.com>,
	<valentina.fernandezalanis@microchip.com>, <praveen.kumar@microchip.com>,
	<shravan.chippa@microchip.com>
Subject: [PATCH V7 1/4] media: i2c: imx334: Optimized 4k and 2k mode register arrays
Date: Wed, 5 Mar 2025 10:44:39 +0530
Message-ID: <20250305051442.3716817-2-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305051442.3716817-1-shravan.chippa@microchip.com>
References: <20250305051442.3716817-1-shravan.chippa@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shravan Chippa <shravan.chippa@microchip.com>

Optimized the resolution arrays by integrating a common register array.

Adjusted the register array values for 1920x1080@30 and 3840x2160@30
resolutions to align with the common register array values.

Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
---
 drivers/media/i2c/imx334.c | 131 +++++++++----------------------------
 1 file changed, 30 insertions(+), 101 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index a544fc3df39c..db61b298ceb3 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -167,8 +167,8 @@ static const s64 link_freq[] = {
 	IMX334_LINK_FREQ_445M,
 };
 
-/* Sensor mode registers for 1920x1080@30fps */
-static const struct imx334_reg mode_1920x1080_regs[] = {
+/* Sensor common mode registers values */
+static const struct imx334_reg common_mode_regs[] = {
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
@@ -330,24 +314,31 @@ static const struct imx334_reg mode_1920x1080_regs[] = {
 	{0x3002, 0x00},
 };
 
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
-	{0x3000, 0x01},
-	{0x3002, 0x00},
-	{0x3018, 0x04},
-	{0x37b0, 0x36},
-	{0x304c, 0x00},
-	{0x300c, 0x3b},
-	{0x300d, 0x2a},
 	{0x3034, 0x26},
 	{0x3035, 0x02},
-	{0x314c, 0x29},
-	{0x314d, 0x01},
 	{0x315a, 0x02},
-	{0x3168, 0xa0},
-	{0x316a, 0x7e},
-	{0x3288, 0x21},
-	{0x328a, 0x02},
 	{0x302c, 0x3c},
 	{0x302d, 0x00},
 	{0x302e, 0x00},
@@ -356,82 +347,13 @@ static const struct imx334_reg mode_3840x2160_regs[] = {
 	{0x3077, 0x08},
 	{0x3090, 0x70},
 	{0x3091, 0x08},
-	{0x30d8, 0x20},
-	{0x30d9, 0x12},
 	{0x3308, 0x70},
 	{0x3309, 0x08},
-	{0x3414, 0x05},
-	{0x3416, 0x18},
-	{0x35ac, 0x0e},
-	{0x3648, 0x01},
-	{0x364a, 0x04},
-	{0x364c, 0x04},
-	{0x3678, 0x01},
-	{0x367c, 0x31},
-	{0x367e, 0x31},
-	{0x3708, 0x02},
-	{0x3714, 0x01},
-	{0x3715, 0x02},
-	{0x3716, 0x02},
-	{0x3717, 0x02},
-	{0x371c, 0x3d},
-	{0x371d, 0x3f},
-	{0x372c, 0x00},
-	{0x372d, 0x00},
-	{0x372e, 0x46},
-	{0x372f, 0x00},
-	{0x3730, 0x89},
-	{0x3731, 0x00},
-	{0x3732, 0x08},
-	{0x3733, 0x01},
-	{0x3734, 0xfe},
-	{0x3735, 0x05},
-	{0x375d, 0x00},
-	{0x375e, 0x00},
-	{0x375f, 0x61},
-	{0x3760, 0x06},
-	{0x3768, 0x1b},
-	{0x3769, 0x1b},
-	{0x376a, 0x1a},
-	{0x376b, 0x19},
-	{0x376c, 0x18},
-	{0x376d, 0x14},
-	{0x376e, 0x0f},
-	{0x3776, 0x00},
-	{0x3777, 0x00},
-	{0x3778, 0x46},
-	{0x3779, 0x00},
-	{0x377a, 0x08},
-	{0x377b, 0x01},
-	{0x377c, 0x45},
-	{0x377d, 0x01},
-	{0x377e, 0x23},
-	{0x377f, 0x02},
-	{0x3780, 0xd9},
-	{0x3781, 0x03},
-	{0x3782, 0xf5},
-	{0x3783, 0x06},
-	{0x3784, 0xa5},
-	{0x3788, 0x0f},
-	{0x378a, 0xd9},
-	{0x378b, 0x03},
-	{0x378c, 0xeb},
-	{0x378d, 0x05},
-	{0x378e, 0x87},
-	{0x378f, 0x06},
-	{0x3790, 0xf5},
-	{0x3792, 0x43},
-	{0x3794, 0x7a},
-	{0x3796, 0xa1},
-	{0x3e04, 0x0e},
 	{0x319e, 0x00},
 	{0x3a00, 0x01},
 	{0x3a18, 0xbf},
-	{0x3a19, 0x00},
 	{0x3a1a, 0x67},
-	{0x3a1b, 0x00},
 	{0x3a1c, 0x6f},
-	{0x3a1d, 0x00},
 	{0x3a1e, 0xd7},
 	{0x3a1f, 0x01},
 	{0x3a20, 0x6f},
@@ -989,6 +911,13 @@ static int imx334_start_streaming(struct imx334 *imx334)
 	const struct imx334_reg_list *reg_list;
 	int ret;
 
+	ret = imx334_write_regs(imx334, common_mode_regs,
+				ARRAY_SIZE(common_mode_regs));
+	if (ret) {
+		dev_err(imx334->dev, "fail to write common registers");
+		return ret;
+	}
+
 	/* Write sensor mode registers */
 	reg_list = &imx334->cur_mode->reg_list;
 	ret = imx334_write_regs(imx334, reg_list->regs,
-- 
2.34.1


