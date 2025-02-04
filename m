Return-Path: <linux-media+bounces-25617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1ACA26C74
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 08:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73486165D20
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 07:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF622066D8;
	Tue,  4 Feb 2025 07:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Qd7WrgDl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B6D2066D4;
	Tue,  4 Feb 2025 07:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738652735; cv=none; b=oaR2SR5AEv31nts++zGAaISgXVUikoCA5bah2EogqMyIuSGALPQ+uqQVuOyXD0fceJzi1FXyu3T0XSVJu9yVBsO1O68Xywz4oXycbPLFLe+qT9x6nvsrniVMtiEQNhDrowNt5oLudl8fYrYmTjeHNsVDUAL4uKlVhESMxxUQwYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738652735; c=relaxed/simple;
	bh=dNzl8wbdvAfOo90NwAYKxLskMd36HUw/cWSeimj+kVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DNm96uOtDN4L027S07WbUUA4RpeVUK7Y3W5wPkjfKSeD0afUojuMsulRP+FpiTpxbRdZcj/dWHtqLot9pKZyhSaCupWgbKBQlxthAcqH2u+AoSvy0ZR+5pOFHzrsnJADxOXP0FWmFrVRqnpDzenicsl26Kpz5UBSH2MBP/RKEss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Qd7WrgDl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:8839:be31:a1f6:6475:ef19:2df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D70211193;
	Tue,  4 Feb 2025 08:04:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738652661;
	bh=dNzl8wbdvAfOo90NwAYKxLskMd36HUw/cWSeimj+kVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Qd7WrgDl7JHWpP7B3fxSivPnJT033Ebrashi5FBn5kGLPVRgnU+6svR3FVMObeJYV
	 BHTp1rjtx9b/CSp0iVt7lzTiLOzN31Hzsnlt8RLwxGAfQH796ygM954813+UGsc8Xl
	 3zoNbWVHMXq199Hx2lWJnXXf4MlL3+QDoaeWSDyQ=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 04 Feb 2025 12:34:40 +0530
Subject: [PATCH v6 5/5] media: i2c: imx219: Scale the pixel rate for analog
 binning
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-imx219_fixes-v6-5-84ffa5030972@ideasonboard.com>
References: <20250204-imx219_fixes-v6-0-84ffa5030972@ideasonboard.com>
In-Reply-To: <20250204-imx219_fixes-v6-0-84ffa5030972@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Vinay Varma <varmavinaym@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7472;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=dNzl8wbdvAfOo90NwAYKxLskMd36HUw/cWSeimj+kVI=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnobweUDS50whYjJhs7/fx2RqsGBA8ejrfXXe1w
 vmVjPliGFuJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ6G8HgAKCRBD3pH5JJpx
 RWetD/97baWPxtJCoyyFw6UcwVigUN4Dilp678/H+9YY1AxBJRKlL9l8ZlwBZjhdb00jEeF/+Ee
 aQtGOMj64l8IH9u2jYPKf8FdAF9ksSdEy8JNlLhJnlaWU3SemK9+QiMv+6P9UgY4MofPdVpFyxE
 yJnG38AcGO2o/MZdvtG+QvjM+x0VGvbhox7QQd8kZpQwLpVlTYPj8lMpAF3ag3jJlMuPiUWO97W
 aa/50X9beYn0KYzzvf/uJT9qsbHwqPImv8hAnQcs8U0FEKsHAVDE+8Yu6t7ZzWUQ0wqNNqPHS9F
 2DtwW1TUO49LbkmGxLLpivByHskA9Wu5HbRdHWi2qPJnlRo9tk0trPG/WnK1PqkReAQN8zdMwsP
 9cmMDAoGkfKIyAVU1Mslz/d6xOaSyWqLHOafpt+ytr9qnzTLPv4vkAn/fVgngUb20dQM2vxl0nw
 iNlUAIJjXdtoQ55fePETnizev5fscvFeFncfMcn4/KfhWHLdpjggHybNHuhtD9dcQS2SXkxbhOh
 Ws6vNNsyx8cVi6lglCUhmMSewkLiJJ0hzS5hJ6vakpp4GYxn/LZmTk2XaDKA3a84AbsdIkUp8j9
 mGH/e8aAtCm/dtEMXJql5n5NbBDnFku0Nwz/jUkGCz+Xdvk0i6qR6LJw0iXwQsWRK5u10dSHED1
 w0/rLCAmkFk889Q==
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
 drivers/media/i2c/imx219.c | 126 +++++++++++++++++++++++++++++----------------
 1 file changed, 81 insertions(+), 45 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index e4aa6e66b673bb7a8942bf8daf27267c2884ec95..c445987de2c3e933ea9c49ba3e00a15663ef5f2e 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -144,6 +144,12 @@
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
@@ -295,13 +301,13 @@ static const struct imx219_mode supported_modes[] = {
 		.fll_def = 1707,
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
@@ -356,6 +362,59 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
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
+static enum binning_mode imx219_get_binning(struct imx219 *imx219, u8 *bin_h,
+					    u8 *bin_v)
+{
+	struct v4l2_subdev_state *state =
+		v4l2_subdev_get_locked_active_state(&imx219->sd);
+	const struct v4l2_mbus_framefmt *format =
+		v4l2_subdev_state_get_format(state, 0);
+	const struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
+
+	*bin_h = crop->width / format->width;
+	*bin_v = crop->height / format->height;
+
+	if (*bin_h == 2 && *bin_v == 2)
+		return BINNING_ANALOG_X2;
+	else if (*bin_h == 2 || *bin_v == 2)
+		/*
+		 * Don't use analog binning if only one dimension
+		 * is binned, as it crops the other dimension
+		 */
+		return BINNING_X2;
+	else
+		return BINNING_NONE;
+}
+
+static inline u32 imx219_get_rate_factor(struct imx219 *imx219)
+{
+	u8 bin_h, bin_v;
+	enum binning_mode binning = imx219_get_binning(imx219, &bin_h, &bin_v);
+
+	if (binning == BINNING_ANALOG_X2)
+		return 2;
+
+	return 1;
+}
+
 /* -----------------------------------------------------------------------------
  * Controls
  */
@@ -367,10 +426,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -399,7 +460,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_EXPOSURE:
 		cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
-			  ctrl->val, &ret);
+			  ctrl->val / rate_factor, &ret);
 		break;
 	case V4L2_CID_DIGITAL_GAIN:
 		cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
@@ -416,7 +477,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_VBLANK:
 		cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,
-			  format->height + ctrl->val, &ret);
+			  (format->height + ctrl->val) / rate_factor, &ret);
 		break;
 	case V4L2_CID_HBLANK:
 		cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A,
@@ -587,29 +648,14 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 {
 	const struct v4l2_mbus_framefmt *format;
 	const struct v4l2_rect *crop;
-	unsigned int bpp;
-	u64 bin_h, bin_v;
+	enum binning_mode binning;
+	u8 bin_h, bin_v;
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
@@ -620,28 +666,11 @@ static int imx219_set_framefmt(struct imx219 *imx219,
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
+	binning = imx219_get_binning(imx219, &bin_h, &bin_v);
+	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H,
+		  (bin_h == 2) ? binning : BINNING_NONE, &ret);
+	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V,
+		  (bin_v == 2) ? binning : BINNING_NONE, &ret);
 
 	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
 		  format->width, &ret);
@@ -846,6 +875,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 		int exposure_max;
 		int exposure_def;
 		int hblank;
+		int pixel_rate;
 
 		/* Update limits and set FPS to default */
 		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
@@ -874,6 +904,12 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 					 IMX219_LLP_MAX - mode->width, 1,
 					 IMX219_LLP_MIN - mode->width);
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


