Return-Path: <linux-media+bounces-22017-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D81A9D88D3
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 16:09:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2415B16BDBD
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 15:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8DC1B4124;
	Mon, 25 Nov 2024 15:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mz3M9hPc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E2A1B395C;
	Mon, 25 Nov 2024 15:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732547248; cv=none; b=Vxuamgz/Wc51VCQgR7LVcrrjr3PLSwX4pjiJnk6SuA7myLSlzvvYpGh/SSkDnAz8dnAuETvh7ixKtKFINFckjuvJUWb74Epz9y1nqvGu34eligp9n3lLDVv/d3JJuh3OyrljG9qs+izm20joqNUCKRl6EzJmaExIq5T7z8yjTdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732547248; c=relaxed/simple;
	bh=ObNp099S/7voqB0WAWP8tLNv0cQWGdENu8N3L04Q4LY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BiwCJjIqjCJ/469neD/f2Mr61qsgOoYHiOk6jrZntLf0KgUSZX7Oj+9x0aguG/4G+IWNHUuDLVCy0JNnDWIrPGmVa1EtJ6QBuKKzObAUgB783SgEkV2EniG4+62clTLXb/9zGw+75Y/rEe7Ug6i/R5mDqhySlSaI4agYRTs7kbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mz3M9hPc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:883a:fbdb:56c3:2e5a:271e:2a92])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AAC9912E9;
	Mon, 25 Nov 2024 16:07:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732547224;
	bh=ObNp099S/7voqB0WAWP8tLNv0cQWGdENu8N3L04Q4LY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mz3M9hPczUH5L27gtsS7LL+BmqNUsStt57oGCsAj43PWyiJWXXZuyyCx+FgLDxTev
	 uskyMGGXR5HhwRZto8tMYbksYTKc3y2MeixCNg1JQkr4xQ/hBlY7Ach+mO6OSeQqwK
	 D4f1k4jIh2krno45SnQ6n2Gr/eGSX9E9xkj4Uvp4=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 25 Nov 2024 20:36:27 +0530
Subject: [PATCH v3 3/3] media: i2c: imx219: Scale the pixel rate for analog
 binning
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-imx219_fixes-v3-3-434fc0b541c8@ideasonboard.com>
References: <20241125-imx219_fixes-v3-0-434fc0b541c8@ideasonboard.com>
In-Reply-To: <20241125-imx219_fixes-v3-0-434fc0b541c8@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Vinay Varma <varmavinaym@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7554;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=ObNp099S/7voqB0WAWP8tLNv0cQWGdENu8N3L04Q4LY=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnRJKTFRLBkqeXmq42B+w7zuf2QSR9hVD0w0gFQ
 V40AFMvkLOJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ0SSkwAKCRBD3pH5JJpx
 RWD1D/0RJIXkWNfhsEgzjU20x9uTKsamYNNqypABIFVhsvhSdmfIsemwdIOJ47XqUQnvMabN5xD
 pesFfEdXdsoqasjedJXDdPzf/q/IeGCzQrMXsoxz9vhJwgWtivRAuPnY+kX5ixcgzgKV30A/IjW
 OylrJ6HuEWOppUK8PKSUpS1YGA1SS9dqG3vpecrIAn3aXJiWsAl6b4rqsus7zx5K5hehW/40qhp
 TbyJ8+jmbl3UhKeT6DhyVoCKHDzL7enYzXh4Z/wbeC05uYCP2Hjtrcn0GUvui2GLSa0v9yCVrce
 0/TVOKIejG4Rvl7QF2mwqP6VGaK7h9uIEPa0sdAWvy/vBQUn9hbXRqf1geDgZgd4qsOjxoQAcXO
 igYclHuc/UL5PaBPy5AYNETi8VQjuWbFR5AjEwOaCGOoobn0jXFuB0ABKoO3LYhCSMAlfvpnXmG
 bATsSf46bjQm4oBDlX9gHF+/BXDwzjZ3lGv4UcROkSzfl1RgOXRxs1njZUZCLnY7kCdRKJbEMX2
 nqSzg5p8F/FwkxIFFPiGL0qDWPIPorjw2xtVU3gYzHLS2qNtVS6tN5oQbfoMHWkiFPjaiu4H/3M
 MdXKpwhxxI9pK2lbcIRsh5LUNWocykrdnw80CJ29XjjDPhhl+2oBjSORvRHOUFETwb5HJEvxHym
 HzAoIeVQMvxcYbw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

When the analog binning mode is used for high framerate operation,
the pixel rate is effectively doubled. Account for this when setting up
the pixel clock rate, and applying the vblank and exposure controls.

The previous logic only used analog binning for 8-bit modes, but normal
binning limits the framerate on 10-bit 480p [1]. So with this patch we
switch to using special binning (with 2x pixel rate) for all formats of
480p mode and 8-bit 1232p.

[1]: https://github.com/raspberrypi/linux/issues/5493

Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Vinay Varma <varmavinaym@gmail.com>
Signed-off-by: Vinay Varma <varmavinaym@gmail.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 120 ++++++++++++++++++++++++++++-----------------
 1 file changed, 76 insertions(+), 44 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 970e6362d0ae3a9078daf337155e83d637bc1ca1..39b85cdee58318b080c867afd68ca33d14d3eda7 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -149,6 +149,12 @@
 #define IMX219_PIXEL_ARRAY_WIDTH	3280U
 #define IMX219_PIXEL_ARRAY_HEIGHT	2464U
 
+enum binning_mode {
+	BINNING_NONE = IMX219_BINNING_NONE,
+	BINNING_X2 = IMX219_BINNING_X2,
+	BINNING_ANALOG_X2 = IMX219_BINNING_X2_ANALOG,
+};
+
 /* Mode : resolution and related config&values */
 struct imx219_mode {
 	/* Frame width */
@@ -337,6 +343,10 @@ struct imx219 {
 
 	/* Two or Four lanes */
 	u8 lanes;
+
+	/* Binning mode */
+	enum binning_mode bin_h;
+	enum binning_mode bin_v;
 };
 
 static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
@@ -362,6 +372,36 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
 	return imx219_mbus_formats[i];
 }
 
+static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *format)
+{
+	switch (format->code) {
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+		return 8;
+
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	default:
+		return 10;
+	}
+}
+
+static int imx219_get_rate_factor(struct imx219 *imx219)
+{
+	switch (imx219->bin_v) {
+	case BINNING_NONE:
+	case BINNING_X2:
+		return 1;
+	case BINNING_ANALOG_X2:
+		return 2;
+	}
+	return -EINVAL;
+}
+
 /* -----------------------------------------------------------------------------
  * Controls
  */
@@ -373,10 +413,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
 	const struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
+	int rate_factor;
 	int ret = 0;
 
 	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
 	format = v4l2_subdev_state_get_format(state, 0);
+	rate_factor = imx219_get_rate_factor(imx219);
 
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		int exposure_max, exposure_def;
@@ -405,7 +447,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_EXPOSURE:
 		cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
-			  ctrl->val, &ret);
+			  ctrl->val / rate_factor, &ret);
 		break;
 	case V4L2_CID_DIGITAL_GAIN:
 		cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
@@ -422,7 +464,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_VBLANK:
 		cci_write(imx219->regmap, IMX219_REG_VTS,
-			  format->height + ctrl->val, &ret);
+			  (format->height + ctrl->val) / rate_factor, &ret);
 		break;
 	case V4L2_CID_HBLANK:
 		cci_write(imx219->regmap, IMX219_REG_HTS,
@@ -463,7 +505,8 @@ static const struct v4l2_ctrl_ops imx219_ctrl_ops = {
 
 static unsigned long imx219_get_pixel_rate(struct imx219 *imx219)
 {
-	return (imx219->lanes == 2) ? IMX219_PIXEL_RATE : IMX219_PIXEL_RATE_4LANE;
+	return ((imx219->lanes == 2) ? IMX219_PIXEL_RATE :
+		IMX219_PIXEL_RATE_4LANE) * imx219_get_rate_factor(imx219);
 }
 
 /* Initialize control handlers */
@@ -592,29 +635,12 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 {
 	const struct v4l2_mbus_framefmt *format;
 	const struct v4l2_rect *crop;
-	unsigned int bpp;
-	u64 bin_h, bin_v;
+	u32 bpp;
 	int ret = 0;
 
 	format = v4l2_subdev_state_get_format(state, 0);
 	crop = v4l2_subdev_state_get_crop(state, 0);
-
-	switch (format->code) {
-	case MEDIA_BUS_FMT_SRGGB8_1X8:
-	case MEDIA_BUS_FMT_SGRBG8_1X8:
-	case MEDIA_BUS_FMT_SGBRG8_1X8:
-	case MEDIA_BUS_FMT_SBGGR8_1X8:
-		bpp = 8;
-		break;
-
-	case MEDIA_BUS_FMT_SRGGB10_1X10:
-	case MEDIA_BUS_FMT_SGRBG10_1X10:
-	case MEDIA_BUS_FMT_SGBRG10_1X10:
-	case MEDIA_BUS_FMT_SBGGR10_1X10:
-	default:
-		bpp = 10;
-		break;
-	}
+	bpp = imx219_get_format_bpp(format);
 
 	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
 		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
@@ -625,28 +651,8 @@ static int imx219_set_framefmt(struct imx219 *imx219,
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
-	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
-	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
+	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, imx219->bin_h, &ret);
+	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, imx219->bin_v, &ret);
 
 	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
 		  format->width, &ret);
@@ -851,6 +857,27 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 		int exposure_max;
 		int exposure_def;
 		int hblank;
+		int pixel_rate;
+		u32 bpp = imx219_get_format_bpp(format);
+		enum binning_mode binning = BINNING_NONE;
+
+		/*
+		 * For 8-bit formats, analog horizontal binning is required,
+		 * else the output image is garbage.
+		 * For 10-bit formats, analog horizontal binning is optional,
+		 * but still useful as it doubles the effective framerate.
+		 * We can only use it with width <= 1624, as for higher values
+		 * there are blocky artefacts.
+		 *
+		 * Vertical binning should match the horizontal binning mode.
+		 */
+		if (bin_h == 2 && (format->width <= 1624 || bpp == 8))
+			binning = BINNING_ANALOG_X2;
+		else
+			binning = BINNING_X2;
+
+		imx219->bin_h = (bin_h == 2) ? binning : BINNING_NONE;
+		imx219->bin_v = (bin_v == 2) ? binning : BINNING_NONE;
 
 		/* Update limits and set FPS to default */
 		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
@@ -879,6 +906,11 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 					 IMX219_PPL_MAX - mode->width,
 					 1, IMX219_PPL_MIN - mode->width);
 		__v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
+
+		/* Scale the pixel rate based on the mode specific factor */
+		pixel_rate = imx219_get_pixel_rate(imx219);
+		__v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
+					 pixel_rate, 1, pixel_rate);
 	}
 
 	return 0;

-- 
2.47.0


