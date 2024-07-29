Return-Path: <linux-media+bounces-15479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD1093FD93
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 20:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4941B223B7
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 18:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FEEE186E2C;
	Mon, 29 Jul 2024 18:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D1jM17KZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2289C16B38D;
	Mon, 29 Jul 2024 18:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722278417; cv=none; b=gJXpuzMl5RBCTYY8z9vQDGYh/Cj5wpV7tPzhBmdwDX2TpQKjazSESvO/0BazqpPoRtfyYRu8cEKDqR0jP1CVVOPRNfunqpAUSoPm17mOIC5b0IdILDPs4QRxzDuVqjn2Dut01zw+Hb3B7OZjwbR8uq5bamtvCZQYmKr4YDyTB+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722278417; c=relaxed/simple;
	bh=juRqjNJKyLdqApVch9xOVOcW8ildrqlNqRTk98mgPYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TbjtfkOdvqTt8fwLw8dexU0b+7cFlVZGeift1bc1yB2fxpf7nCaU1Hokp0iucxSbQInYbpjFRQWVkYhWVy7mNLt9FPgHu6N5MDrFv69ZjZkk5oiHfIiGU7cQQkklBIV9hFF2lHNl933dWFHJjg+7dBTN7nVZidLQ2PMXlsC/eGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D1jM17KZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 934BA45A;
	Mon, 29 Jul 2024 20:39:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722278366;
	bh=juRqjNJKyLdqApVch9xOVOcW8ildrqlNqRTk98mgPYc=;
	h=From:To:Cc:Subject:Date:From;
	b=D1jM17KZ04e+KLc8WXorYuCVPX5f6n/Aq89qaPaZbnDWn1bnONxg0VYBZhr7+seBS
	 rqxU1jU1SOQCt4ygyGvpFMl9aonFMhVPvPnRXhVbkgqZlxF2XO8vOfeGDy0w+QJxbu
	 Rd+9nGRfBefs1JIWrgVaeiYrefiVOnaAwcf9SvLA=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH] media: imx283: Provide optical black mode
Date: Tue, 30 Jul 2024 00:09:53 +0530
Message-ID: <20240729183955.456957-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The IMX283 is capable of delivering optical black regions as part of
the image capture. These regions support capture of the black levels
for calibration and are added as extra pixels on top of the full
resolution capture.

Supply an extra mode which accounts for this increased size that will
produce black regions in the output image.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
- YUYV capture sample with Pi5 ISP for side-by-side comparison of OB regions:
https://gcdnb.pbrd.co/images/XQV29MedwXxg.png
---
 drivers/media/i2c/imx283.c | 68 ++++++++++++++++++++++++++++++++------
 1 file changed, 58 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 8490618c5071..9a0fe2c34a41 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -66,6 +66,7 @@
 #define IMX283_REG_HTRIMMING		CCI_REG8(0x300b)
 #define   IMX283_MDVREV			BIT(0) /* VFLIP */
 #define   IMX283_HTRIMMING_EN		BIT(4)
+#define   IMX283_HOB_EN			BIT(5)
 
 #define IMX283_REG_VWINPOS		CCI_REG16_LE(0x300f)
 #define IMX283_REG_VWIDCUT		CCI_REG16_LE(0x3011)
@@ -306,6 +307,7 @@ static const struct imx283_input_frequency imx283_frequencies[] = {
 
 enum imx283_modes {
 	IMX283_MODE_0,
+	IMX283_MODE_0_OB,
 	IMX283_MODE_1,
 	IMX283_MODE_1A,
 	IMX283_MODE_1S,
@@ -327,6 +329,7 @@ struct imx283_readout_mode {
 static const struct imx283_readout_mode imx283_readout_modes[] = {
 	/* All pixel scan modes */
 	[IMX283_MODE_0] = { 0x04, 0x03, 0x10, 0x00 }, /* 12 bit */
+	[IMX283_MODE_0_OB] = { 0x04, 0x03, 0x10, 0x00 }, /* 12 bit */
 	[IMX283_MODE_1] = { 0x04, 0x01, 0x00, 0x00 }, /* 10 bit */
 	[IMX283_MODE_1A] = { 0x04, 0x01, 0x20, 0x50 }, /* 10 bit */
 	[IMX283_MODE_1S] = { 0x04, 0x41, 0x20, 0x50 }, /* 10 bit */
@@ -439,6 +442,36 @@ static const struct imx283_mode supported_modes_12bit[] = {
 			.height = 3648,
 		},
 	},
+	{
+		/* 20MPix 21.40 fps readout mode 0 with optical blacks enabled */
+		.mode = IMX283_MODE_0_OB,
+		.bpp = 12,
+		.width = 5472 + 96, /* width + Horizontal optical black */
+		.height = 3648 + 16, /* height + Vertical optical black */
+		.min_hmax = 5914, /* 887 @ 480MHz/72MHz */
+		.min_vmax = 3793, /* Lines */
+
+		.veff = 3694,
+		.vst = 0,
+		.vct = 0,
+
+		.hbin_ratio = 1,
+		.vbin_ratio = 1,
+
+		/* 20.00 FPS */
+		.default_hmax = 6000, /* 900 @ 480MHz/72MHz */
+		.default_vmax = 4000,
+
+		.min_shr = 11,
+		.horizontal_ob = 96,
+		.vertical_ob = 16,
+		.crop = {
+			.top = 40,
+			.left = 108,
+			.width = 5472 + 96,
+			.height = 3648 + 16,
+		},
+	},
 	{
 		/*
 		 * Readout mode 2 : 2/2 binned mode (2736x1824)
@@ -793,17 +826,20 @@ static int imx283_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_VFLIP:
+		u32 htrim = IMX283_HTRIMMING_EN;
+
 		/*
 		 * VFLIP is managed by BIT(0) of IMX283_REG_HTRIMMING address, hence
 		 * both need to be set simultaneously.
 		 */
-		if (ctrl->val) {
-			cci_write(imx283->cci, IMX283_REG_HTRIMMING,
-				  IMX283_HTRIMMING_EN | IMX283_MDVREV, &ret);
-		} else {
-			cci_write(imx283->cci, IMX283_REG_HTRIMMING,
-				  IMX283_HTRIMMING_EN, &ret);
-		}
+		if (ctrl->val)
+			htrim = IMX283_HTRIMMING_EN | IMX283_MDVREV;
+
+		if (mode->mode == IMX283_MODE_0_OB)
+			htrim |= IMX283_HOB_EN;
+
+		cci_write(imx283->cci, IMX283_REG_HTRIMMING, htrim, &ret);
+
 		break;
 
 	case V4L2_CID_TEST_PATTERN:
@@ -1010,6 +1046,8 @@ static int imx283_start_streaming(struct imx283 *imx283,
 	s32 v_pos;
 	u32 write_v_size;
 	u32 y_out_size;
+	u32 htrim_end;
+	u32 ob_size_v = 0;
 	int ret = 0;
 
 	fmt = v4l2_subdev_state_get_format(state, 0);
@@ -1057,6 +1095,12 @@ static int imx283_start_streaming(struct imx283 *imx283,
 		mode->crop.height);
 
 	y_out_size = mode->crop.height / mode->vbin_ratio;
+
+	if (mode->mode == IMX283_MODE_0_OB) {
+		y_out_size -= mode->vertical_ob;
+		ob_size_v = mode->vertical_ob;
+	}
+
 	write_v_size = y_out_size + mode->vertical_ob;
 	/*
 	 * cropping start position = (VWINPOS – Vst) × 2
@@ -1072,12 +1116,16 @@ static int imx283_start_streaming(struct imx283 *imx283,
 	cci_write(imx283->cci, IMX283_REG_VWIDCUT, v_widcut, &ret);
 	cci_write(imx283->cci, IMX283_REG_VWINPOS, v_pos, &ret);
 
-	cci_write(imx283->cci, IMX283_REG_OB_SIZE_V, mode->vertical_ob, &ret);
+	cci_write(imx283->cci, IMX283_REG_OB_SIZE_V, ob_size_v, &ret);
+
+	htrim_end = mode->crop.left + mode->crop.width;
+
+	if (mode->mode == IMX283_MODE_0_OB)
+		htrim_end -= mode->horizontal_ob * mode->hbin_ratio;
 
 	/* TODO: Validate mode->crop is fully contained within imx283_native_area */
 	cci_write(imx283->cci, IMX283_REG_HTRIMMING_START, mode->crop.left, &ret);
-	cci_write(imx283->cci, IMX283_REG_HTRIMMING_END,
-		  mode->crop.left + mode->crop.width, &ret);
+	cci_write(imx283->cci, IMX283_REG_HTRIMMING_END, htrim_end, &ret);
 
 	/* Disable embedded data */
 	cci_write(imx283->cci, IMX283_REG_EBD_X_OUT_SIZE, 0, &ret);
-- 
2.45.0


