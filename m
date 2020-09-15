Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4EA26A17B
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 11:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgIOJFV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 05:05:21 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:17843 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgIOJFT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 05:05:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1600160718; x=1631696718;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V/BSQqibqorIMq/EJ5p3iRt9qa3GhZrD2bYI1ikaWrM=;
  b=G3OSgb6PC0nC0Rbm1m5aSokADRGxw6+V8sloJU1xu/XUffvJES39iruA
   k4oFSi5wgvgo8ngBkMCiWFZcGca5wZ4/fS7ltQ5BuJaqaUzicSk2pyg6e
   /5sEa8e+AwZzOUlhnTd9zEcUCq/9Mh45rJew47SNGgpoWblywKPePYBuH
   /3hbSn1z5XMCT3/Gjv6OGLIGByfR8owDt6TG6uoO/nCC8xdevaIMmgHst
   W82twzKjURv8P/ivi4c53xonp6Gs0sHfirbvVrlpgpQ5zxr5ITxauqCBv
   nt664h2vtUNGXlrdRpJUIRTFHgrZ3zjmtqVZjRmWjH+V0/Ez7UxIzBn3j
   Q==;
IronPort-SDR: C4SfAl61A1PpKRgvKMc1O1hiRLFU/cGcOgS85TIba7nAc1Wtw33LpraWpigw/VevNb7KY7e8m2
 aJH5qavxP64ljv2b+lxPnu5XOQvO3nU73wsQz1o3mWOCovw8Has+yIaPFj26swDeX1U/UZDeLE
 djfz15fWCzD0u9Y7wVulnU63KS5G6D/RBj6kzQ1iZjEQVgSqgDjDsT+aQ1brUUiRoG/wjanch8
 BiI4XkPBBHn3QUyxKjy+I15CJwbTB9hbGcZ7cgDz5ikS1KWiKIFUMuexx2MP0HRGCW2ouOv03d
 oas=
X-IronPort-AV: E=Sophos;i="5.76,429,1592895600"; 
   d="scan'208";a="91030353"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Sep 2020 02:05:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 15 Sep 2020 02:05:00 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 15 Sep 2020 02:04:55 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <sakari.ailus@iki.fi>, <luca@lucaceresoli.net>,
        <leonl@leopardimaging.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Eugen Hristev" <eugen.hristev@microchip.com>
Subject: [PATCH v2 2/2] media: imx274: add support for sensor mode6, 1280x540
Date:   Tue, 15 Sep 2020 12:04:42 +0300
Message-ID: <20200915090442.52322-2-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200915090442.52322-1-eugen.hristev@microchip.com>
References: <20200915090442.52322-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for the mode 6 for the sensor, this mode uses
3/8 subsampling and 3 horizontal binning.
Aspect ratio is changed.
Split the bin_ratio variable into two parts, one for
width and one for height, as the ratio is no longer preserved
when doing subsampling in this mode.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v2:
- changed ratios to u8 instead of int
- changed dbg message to show ratio x ratio instead of ratio:ratio
- fixed typo in comment 1920 instead of 1620

 drivers/media/i2c/imx274.c | 84 +++++++++++++++++++++++++++++++-------
 1 file changed, 70 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 69221c2c192c..0a2a14789ea2 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -151,7 +151,8 @@ static const struct regmap_config imx274_regmap_config = {
  * implemented modes.
  *
  * @init_regs: registers to initialize the mode
- * @bin_ratio: downscale factor (e.g. 3 for 3:1 binning)
+ * @wbin_ratio: width downscale factor (e.g. 3 for 1280; 3 = 3840/1280)
+ * @hbin_ratio: height downscale factor (e.g. 3 for 720; 3 = 2160/720)
  * @min_frame_len: Minimum frame length for each mode (see "Frame Rate
  *                 Adjustment (CSI-2)" in the datasheet)
  * @min_SHR: Minimum SHR register value (see "Shutter Setting (CSI-2)" in the
@@ -162,7 +163,8 @@ static const struct regmap_config imx274_regmap_config = {
  */
 struct imx274_mode {
 	const struct reg_8 *init_regs;
-	unsigned int bin_ratio;
+	u8 wbin_ratio;
+	u8 hbin_ratio;
 	int min_frame_len;
 	int min_SHR;
 	int max_fps;
@@ -325,6 +327,46 @@ static const struct reg_8 imx274_mode5_1280x720_raw10[] = {
 	{IMX274_TABLE_END, 0x00}
 };
 
+/*
+ * Vertical 2/8 subsampling horizontal 3 binning
+ * imx274 mode6(refer to datasheet) register configuration with
+ * 1280x540 resolution, raw10 data and mipi four lane output
+ */
+static const struct reg_8 imx274_mode6_1280x540_raw10[] = {
+	{0x3004, 0x04}, /* mode setting */
+	{0x3005, 0x31},
+	{0x3006, 0x00},
+	{0x3007, 0x02}, /* mode setting */
+
+	{0x3018, 0xA2}, /* output XVS, HVS */
+
+	{0x306B, 0x05},
+	{0x30E2, 0x04}, /* mode setting */
+
+	{0x30EE, 0x01},
+	{0x3342, 0x0A},
+	{0x3343, 0x00},
+	{0x3344, 0x16},
+	{0x3345, 0x00},
+	{0x33A6, 0x01},
+	{0x3528, 0x0E},
+	{0x3554, 0x1F},
+	{0x3555, 0x01},
+	{0x3556, 0x01},
+	{0x3557, 0x01},
+	{0x3558, 0x01},
+	{0x3559, 0x00},
+	{0x355A, 0x00},
+	{0x35BA, 0x0E},
+	{0x366A, 0x1B},
+	{0x366B, 0x1A},
+	{0x366C, 0x19},
+	{0x366D, 0x17},
+	{0x3A41, 0x04},
+
+	{IMX274_TABLE_END, 0x00}
+};
+
 /*
  * imx274 first step register configuration for
  * starting stream
@@ -438,7 +480,8 @@ static const struct reg_8 imx274_tp_regs[] = {
 static const struct imx274_mode imx274_modes[] = {
 	{
 		/* mode 1, 4K */
-		.bin_ratio = 1,
+		.wbin_ratio = 1, /* 3840 */
+		.hbin_ratio = 1, /* 2160 */
 		.init_regs = imx274_mode1_3840x2160_raw10,
 		.min_frame_len = 4550,
 		.min_SHR = 12,
@@ -447,7 +490,8 @@ static const struct imx274_mode imx274_modes[] = {
 	},
 	{
 		/* mode 3, 1080p */
-		.bin_ratio = 2,
+		.wbin_ratio = 2, /* 1920 */
+		.hbin_ratio = 2, /* 1080 */
 		.init_regs = imx274_mode3_1920x1080_raw10,
 		.min_frame_len = 2310,
 		.min_SHR = 8,
@@ -456,13 +500,24 @@ static const struct imx274_mode imx274_modes[] = {
 	},
 	{
 		/* mode 5, 720p */
-		.bin_ratio = 3,
+		.wbin_ratio = 3, /* 1280 */
+		.hbin_ratio = 3, /* 720 */
 		.init_regs = imx274_mode5_1280x720_raw10,
 		.min_frame_len = 2310,
 		.min_SHR = 8,
 		.max_fps = 120,
 		.nocpiop = 112,
 	},
+	{
+		/* mode 6, 540p */
+		.wbin_ratio = 3, /* 1280 */
+		.hbin_ratio = 4, /* 540 */
+		.init_regs = imx274_mode6_1280x540_raw10,
+		.min_frame_len = 2310,
+		.min_SHR = 4,
+		.max_fps = 120,
+		.nocpiop = 112,
+	},
 };
 
 /*
@@ -885,12 +940,13 @@ static int __imx274_change_compose(struct stimx274 *imx274,
 	}
 
 	for (i = 0; i < ARRAY_SIZE(imx274_modes); i++) {
-		unsigned int ratio = imx274_modes[i].bin_ratio;
+		u8 wratio = imx274_modes[i].wbin_ratio;
+		u8 hratio = imx274_modes[i].hbin_ratio;
 
 		int goodness = imx274_binning_goodness(
 			imx274,
-			cur_crop->width / ratio, *width,
-			cur_crop->height / ratio, *height,
+			cur_crop->width / wratio, *width,
+			cur_crop->height / hratio, *height,
 			flags);
 
 		if (goodness >= best_goodness) {
@@ -899,14 +955,14 @@ static int __imx274_change_compose(struct stimx274 *imx274,
 		}
 	}
 
-	*width = cur_crop->width / best_mode->bin_ratio;
-	*height = cur_crop->height / best_mode->bin_ratio;
+	*width = cur_crop->width / best_mode->wbin_ratio;
+	*height = cur_crop->height / best_mode->hbin_ratio;
 
 	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		imx274->mode = best_mode;
 
-	dev_dbg(dev, "%s: selected %u:1 binning\n",
-		__func__, best_mode->bin_ratio);
+	dev_dbg(dev, "%s: selected %ux%u binning\n",
+		__func__, best_mode->wbin_ratio, best_mode->hbin_ratio);
 
 	tgt_fmt->width = *width;
 	tgt_fmt->height = *height;
@@ -1833,8 +1889,8 @@ static int imx274_probe(struct i2c_client *client)
 	imx274->mode = &imx274_modes[0];
 	imx274->crop.width = IMX274_MAX_WIDTH;
 	imx274->crop.height = IMX274_MAX_HEIGHT;
-	imx274->format.width = imx274->crop.width / imx274->mode->bin_ratio;
-	imx274->format.height = imx274->crop.height / imx274->mode->bin_ratio;
+	imx274->format.width = imx274->crop.width / imx274->mode->wbin_ratio;
+	imx274->format.height = imx274->crop.height / imx274->mode->hbin_ratio;
 	imx274->format.field = V4L2_FIELD_NONE;
 	imx274->format.code = MEDIA_BUS_FMT_SRGGB10_1X10;
 	imx274->format.colorspace = V4L2_COLORSPACE_SRGB;
-- 
2.25.1

