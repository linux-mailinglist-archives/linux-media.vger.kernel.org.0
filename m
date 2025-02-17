Return-Path: <linux-media+bounces-26218-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9787A384AC
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 14:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9980616897E
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 13:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C10621CA19;
	Mon, 17 Feb 2025 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BqtYyz1C"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08AE21A931;
	Mon, 17 Feb 2025 13:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739798952; cv=none; b=HXFJtt5BxB6rYlIONdzDHoQuG1Nod7VvTLm33hgyY6u12xB09B5fFl9GcdRiXlo/QOMmzYI3seY60iP0vatm4GSEZ6N9PdaSMNLVI5TnHtXmecRfqfPmfYSzFAU/OpJ/HNKg24UTnA2FJ5yakchjHBNDjwtmfS0DMGqj2B2EUXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739798952; c=relaxed/simple;
	bh=ktCG+GBGnUm4iX2Mv7vN8PE+5DgHS41N/KgeOTVdvaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a0jmBnP8qwHJqv+jxTyI5py5vB21TdoxR5ThCgMreJJujNwgjgP45af+tfp5sC0P72dUrebNJ1ZmRwaruzXBc/qTDlnlOba/qiLLdEAX6P2EmEtsLRqcCdvTvDDNcXjBDYuoR4aTHq/Cj9JNvkN7mlPCdPyclznc/Asn1YOqrks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BqtYyz1C; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.80.185])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DEF2022F;
	Mon, 17 Feb 2025 14:27:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739798868;
	bh=ktCG+GBGnUm4iX2Mv7vN8PE+5DgHS41N/KgeOTVdvaM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BqtYyz1CHOfDZRLbV36pEASsfsgdnBhqppRVc5rT2NGCp4l7gAuMtC+D2wL/i8WTw
	 ZU9dWoIi10yI7+DGIDgFknKOqlLba09sdAxGZRGObhEkQ6f30z7HF/cq6J31aaGMTa
	 mB97Cu1i2zgT5G8jADqDRcbOHm6KUEvawkozf5XE=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 17 Feb 2025 18:57:35 +0530
Subject: [PATCH v7 5/5] media: i2c: imx219: Scale the pixel rate for analog
 binning
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-imx219_fixes-v7-5-83c3c63b737e@ideasonboard.com>
References: <20250217-imx219_fixes-v7-0-83c3c63b737e@ideasonboard.com>
In-Reply-To: <20250217-imx219_fixes-v7-0-83c3c63b737e@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Vinay Varma <varmavinaym@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6047;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=ktCG+GBGnUm4iX2Mv7vN8PE+5DgHS41N/KgeOTVdvaM=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnszlLJ1aWdAJuSd9JhL8T+85BSzADQjcCoXwV/
 +aadpFW1buJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ7M5SwAKCRBD3pH5JJpx
 RX9fD/9ksDaBMb+95Zvby3XnGPrPXcgXgmIGgKVa4aQnjJJNaTuF6rjjB0vBjGuW0gzr0x2M1uQ
 FzUC5jvyGFhKtQvJ09dxMEAqSMHNuYAVaIAAUoPPS2ZA3jsfW61HWQkWUrTV8LHFR0wwks6lsYE
 W+bKTnmmhZ72L02LpX9jqbqBhuo27j6TXh8K1a5w3he5Qbv++wlVjclEitKME7xqL4o2h8hstKj
 TagEwsxy0VvI4v2l52TGZc1TNuCqGk2jpzPPTmqeYIla50XhxQErY76lZc4uGd4nuVT2l53o5ui
 nBrxfM4pPB39NRDXuX5LOviiaGtR56VBN+KpXwdFgisN6WxbFDwVJ40+EbOqqpVafKTYgY36O8k
 uo+MbUrgLYW+LUy+alACOvUGmTLGNH9M4D3zKnBRaqGQN15XAouzf5/a48PONIdTnwV47el/17i
 bHx0ueI2ViaAmnTaa5hsaG8j+jFgITy+Ek1vKb6SEcmK03n+crhPzk7YGDQtFMvh4exGgbDmZQQ
 7ZBEUBIJ4rbnDFRA4GM/apNoHhujWG5XYT+swHlaJJrmKS2BQxxmPf8WD6uj/yq6SeOZTSyZW8B
 XkA8Y/79qd23HKa2e6w0h8BXCDIIx1W3QHsrysUqAtQyhnBly+u42OMnKaaFw5FQA7wfKoAeVnj
 85KjKRTIsEBbU1A==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

When the analog binning mode is used for high framerate operation, the
pixel rate is effectively doubled. Account for this when setting up the
pixel clock rate, and applying the vblank and exposure controls.

The previous logic only used analog binning for RAW8, but normal binning
limits the framerate on RAW10 480p [1]. So with this patch we switch to
using special binning (with 2x pixel rate) wherever possible.

[1]: https://github.com/raspberrypi/linux/issues/5493

Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Vinay Varma <varmavinaym@gmail.com>
Signed-off-by: Vinay Varma <varmavinaym@gmail.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 80 +++++++++++++++++++++++++++++++---------------
 1 file changed, 54 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 418f88386659d494ff674d64ed69b8441d1ee2cd..f97abcc5703ea32f1d6f19a4c0a671a7e978a974 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -296,13 +296,13 @@ static const struct imx219_mode supported_modes[] = {
 		.fll_def = 1763,
 	},
 	{
-		/* 2x2 binned 30fps mode */
+		/* 2x2 binned 60fps mode */
 		.width = 1640,
 		.height = 1232,
 		.fll_def = 1707,
 	},
 	{
-		/* 640x480 30fps mode */
+		/* 640x480 60fps mode */
 		.width = 640,
 		.height = 480,
 		.fll_def = 1707,
@@ -357,6 +357,45 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
 	return imx219_mbus_formats[i];
 }
 
+static void imx219_get_binning(struct imx219 *imx219, u8 *bin_h, u8 *bin_v)
+{
+	struct v4l2_subdev_state *state =
+		v4l2_subdev_get_locked_active_state(&imx219->sd);
+	const struct v4l2_mbus_framefmt *format =
+		v4l2_subdev_state_get_format(state, 0);
+	const struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
+	u32 hbin = crop->width / format->width;
+	u32 vbin = crop->height / format->height;
+
+	*bin_h = IMX219_BINNING_NONE;
+	*bin_v = IMX219_BINNING_NONE;
+
+	/*
+	 * Use analog binning only if both dimensions are binned, as it crops
+	 * the other dimension.
+	 */
+	if (hbin == 2 && vbin == 2) {
+		*bin_h = IMX219_BINNING_X2_ANALOG;
+		*bin_v = IMX219_BINNING_X2_ANALOG;
+
+		return;
+	}
+
+	if (hbin == 2)
+		*bin_h = IMX219_BINNING_X2;
+	if (vbin == 2)
+		*bin_v = IMX219_BINNING_X2;
+}
+
+static inline u32 imx219_get_rate_factor(struct imx219 *imx219)
+{
+	u8 bin_h, bin_v;
+
+	imx219_get_binning(imx219, &bin_h, &bin_v);
+
+	return (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ? 2 : 1;
+}
+
 /* -----------------------------------------------------------------------------
  * Controls
  */
@@ -368,10 +407,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
 	const struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
+	u32 rate_factor;
 	int ret = 0;
 
 	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
 	format = v4l2_subdev_state_get_format(state, 0);
+	rate_factor = imx219_get_rate_factor(imx219);
 
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		int exposure_max, exposure_def;
@@ -400,7 +441,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_EXPOSURE:
 		cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
-			  ctrl->val, &ret);
+			  ctrl->val / rate_factor, &ret);
 		break;
 	case V4L2_CID_DIGITAL_GAIN:
 		cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
@@ -417,7 +458,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_VBLANK:
 		cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,
-			  format->height + ctrl->val, &ret);
+			  (format->height + ctrl->val) / rate_factor, &ret);
 		break;
 	case V4L2_CID_HBLANK:
 		cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A,
@@ -589,7 +630,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	const struct v4l2_mbus_framefmt *format;
 	const struct v4l2_rect *crop;
 	unsigned int bpp;
-	u64 bin_h, bin_v;
+	u8 bin_h, bin_v;
 	int ret = 0;
 
 	format = v4l2_subdev_state_get_format(state, 0);
@@ -602,7 +643,6 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	case MEDIA_BUS_FMT_SBGGR8_1X8:
 		bpp = 8;
 		break;
-
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
 	case MEDIA_BUS_FMT_SGRBG10_1X10:
 	case MEDIA_BUS_FMT_SGBRG10_1X10:
@@ -621,26 +661,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
 		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
 
-	switch (crop->width / format->width) {
-	case 1:
-	default:
-		bin_h = IMX219_BINNING_NONE;
-		break;
-	case 2:
-		bin_h = bpp == 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;
-		break;
-	}
-
-	switch (crop->height / format->height) {
-	case 1:
-	default:
-		bin_v = IMX219_BINNING_NONE;
-		break;
-	case 2:
-		bin_v = bpp == 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;
-		break;
-	}
-
+	imx219_get_binning(imx219, &bin_h, &bin_v);
 	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
 	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
 
@@ -847,6 +868,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 		int exposure_max;
 		int exposure_def;
 		int hblank, llp_min;
+		int pixel_rate;
 
 		/* Update limits and set FPS to default */
 		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
@@ -882,6 +904,12 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 		 */
 		hblank = prev_line_len - mode->width;
 		__v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
+
+		/* Scale the pixel rate based on the mode specific factor */
+		pixel_rate = imx219_get_pixel_rate(imx219) *
+			     imx219_get_rate_factor(imx219);
+		__v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
+					 pixel_rate, 1, pixel_rate);
 	}
 
 	return 0;

-- 
2.48.1


