Return-Path: <linux-media+bounces-20501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2639B4521
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 09:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0212B220F0
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 08:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613A12040BB;
	Tue, 29 Oct 2024 08:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uIfGsr1x"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1822040B4;
	Tue, 29 Oct 2024 08:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730192332; cv=none; b=jFmfE2hAtj6/lNHsQs1EXRJvT52YnneDe5+VdbgmuZ3OXQ3umV35PPxLtZp6SrhBhROrmy0rVlSjvYjHNVNq6afp6wDabpG8nobM8l04zIbvdUv/imL/hjM17qYyX5hv9pTNg1f+xefXMPemm/5ag+EosOs+BIjJ6mlXsxscyIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730192332; c=relaxed/simple;
	bh=Fx+ZSitJDsRhbmKyNtCyWgmJ9SSe+CJOJv/iwxjeeLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=snFzHg2NWt7uOcaDyCDWKzTWhvbauzeLZrLGTJkQoKqSrCo+PnQN/7uPb2nxoCVgSL9VQkOYqTLE7u2xmjR2a3w5EWyVRTcKUIV8+wvR+CSRW3D/y2nMgxZ5tEPWtTExHPpAydiSkHeuPR7fYIUzqyvCvNJjpAD4l2EqE5LzghA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uIfGsr1x; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:883a:9301:2bb5:b494:2d46:ba69])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 581D94D4;
	Tue, 29 Oct 2024 09:58:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730192326;
	bh=Fx+ZSitJDsRhbmKyNtCyWgmJ9SSe+CJOJv/iwxjeeLs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uIfGsr1xBV5EPygzaYWPkejHx0MzaZdbvqsUKTnHdz/9SfIy7HhG9TAO8zxErGn3n
	 Nz2znrYg+40uCcg20A/A4lXFJqBXKW4x+Uy4jeWh2A2/5L/PA0k+9Fw2+SZiFLUU0M
	 UvX3KGB+KsqAG9O9fPcWRJrsKrdOmRsCpwGH5q8k=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 29 Oct 2024 14:27:37 +0530
Subject: [PATCH 3/3] media: i2c: imx219: Scale the pixel rate for analog
 binning
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-imx219_fixes-v1-3-b45dc3658b4e@ideasonboard.com>
References: <20241029-imx219_fixes-v1-0-b45dc3658b4e@ideasonboard.com>
In-Reply-To: <20241029-imx219_fixes-v1-0-b45dc3658b4e@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Vinay Varma <varmavinaym@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9544;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Fx+ZSitJDsRhbmKyNtCyWgmJ9SSe+CJOJv/iwxjeeLs=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnIKOvxiDSE+4uk6EMl1/Qu8IrRbIUZlQ5gdoUK
 FdJnji8XouJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZyCjrwAKCRBD3pH5JJpx
 Rc4gEAC0Pth/HTrLWl3GddonDUmNiN5V6xm4gEZxU5fMIw+jYtCeJfK/JypLwml8hJqOjN/Dxcd
 un6X+Z6VhMIGPHr9mihw7dHGP49wbh+q0GqlUjU4lMuHzE2rv1UUaUMGMXwGGQiEvirxFJUS7/B
 AZAudxbNF8NodhVsGsa+XcsFFMvAC4RYJp4B7u/9FXvYEpHy0Hz14p28LH7q7mQYicx4Eai9bwK
 Pc68rt3TLGGCuM0QxFMcQSr2bSiMWeXGzviR19WlMmeI9iaYh75a82j0sOI+1mCyWM+iiAGceva
 /MDmfK24a+OkVeAQjVZWw4tbpenPNnGBqgoaziGuyDasymF0SJzruf1RAPmp+sSOBqa8llTORGX
 XATRYDaa4HhIXFXtGhqFnp6AW8CnhJu/oenHtrS+DeJI7SToVWbBpQj9SH2MKCbMEtS1k75ccVc
 sgLJ824e4JCBL8tzdgzudI1SsZXahd6eVXbtYgPuWgOSJgUFM6EBy62fr9P8hoWHElQ+7pwlsIC
 bzeU7n3SCr50y9ooRN9nEaNEaMY1USCs9hKdaSjFwQVUo36a/gJTOF6kTWMYmYs8HZT+00q5TSg
 JjO2/XN3uNJa2ek3s3kjmrwJEibwSZkb49Nva2Bj2FM91syYiTroVwAl41hj6pl2Euld8d19+Dk
 yg4hc45lPH47dCA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

When the analog binning mode is used for high framerate operation,
the pixel rate is effectively doubled. Account for this when setting up
the pixel clock rate, and applying the vblank and exposure controls.

The previous logic only used analog binning for 8-bit modes, but normal
binning limits the framerate on 10-bit 480p [1]. So with this patch we
switch to using special binning (with 2x pixel rate) for all formats of
480p mode and 8-bit 1232p.

To do this cleanly, re-introduce the book-keeping for which binning mode
is used with which resolution/format.

[1]: https://github.com/raspberrypi/linux/issues/5493

Co-developed-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Vinay Varma <varmavinaym@gmail.com>
Signed-off-by: Vinay Varma <varmavinaym@gmail.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 149 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 106 insertions(+), 43 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index de9230d4ad81f085640be254db9391ae7ad20773..140d958f80eb57dfb4ecf1796fcdf77081a662d7 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -149,6 +149,18 @@
 #define IMX219_PIXEL_ARRAY_WIDTH	3280U
 #define IMX219_PIXEL_ARRAY_HEIGHT	2464U
 
+enum binning_mode {
+	BINNING_NONE,
+	BINNING_X2,
+	BINNING_ANALOG_X2,
+};
+
+enum binning_bit_depths {
+	BINNING_IDX_8_BIT,
+	BINNING_IDX_10_BIT,
+	BINNING_IDX_MAX
+};
+
 /* Mode : resolution and related config&values */
 struct imx219_mode {
 	/* Frame width */
@@ -158,6 +170,9 @@ struct imx219_mode {
 
 	/* V-timing */
 	unsigned int vts_def;
+
+	/* binning mode based on format code */
+	enum binning_mode binning[BINNING_IDX_MAX];
 };
 
 static const struct cci_reg_sequence imx219_common_regs[] = {
@@ -293,24 +308,40 @@ static const struct imx219_mode supported_modes[] = {
 		.width = 3280,
 		.height = 2464,
 		.vts_def = 3526,
+		.binning = {
+			[BINNING_IDX_8_BIT] = BINNING_NONE,
+			[BINNING_IDX_10_BIT] = BINNING_NONE,
+		},
 	},
 	{
 		/* 1080P 30fps cropped */
 		.width = 1920,
 		.height = 1080,
 		.vts_def = 1763,
+		.binning = {
+			[BINNING_IDX_8_BIT] = BINNING_NONE,
+			[BINNING_IDX_10_BIT] = BINNING_NONE,
+		},
 	},
 	{
 		/* 2x2 binned 30fps mode */
 		.width = 1640,
 		.height = 1232,
 		.vts_def = 1763,
+		.binning = {
+			[BINNING_IDX_8_BIT] = BINNING_ANALOG_X2,
+			[BINNING_IDX_10_BIT] = BINNING_X2,
+		},
 	},
 	{
 		/* 640x480 30fps mode */
 		.width = 640,
 		.height = 480,
 		.vts_def = 1763,
+		.binning = {
+			[BINNING_IDX_8_BIT] = BINNING_ANALOG_X2,
+			[BINNING_IDX_10_BIT] = BINNING_ANALOG_X2,
+		},
 	},
 };
 
@@ -337,6 +368,9 @@ struct imx219 {
 
 	/* Two or Four lanes */
 	u8 lanes;
+
+	/* Binning mode */
+	enum binning_mode binning;
 };
 
 static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
@@ -362,6 +396,36 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
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
+	switch (imx219->binning) {
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
@@ -373,10 +437,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -405,7 +471,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_EXPOSURE:
 		cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
-			  ctrl->val, &ret);
+			  ctrl->val / rate_factor, &ret);
 		break;
 	case V4L2_CID_DIGITAL_GAIN:
 		cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
@@ -422,7 +488,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_VBLANK:
 		cci_write(imx219->regmap, IMX219_REG_VTS,
-			  format->height + ctrl->val, &ret);
+			  (format->height + ctrl->val) / rate_factor, &ret);
 		break;
 	case V4L2_CID_HBLANK:
 		cci_write(imx219->regmap, IMX219_REG_HTS,
@@ -463,7 +529,8 @@ static const struct v4l2_ctrl_ops imx219_ctrl_ops = {
 
 static unsigned long imx219_get_pixel_rate(struct imx219 *imx219)
 {
-	return (imx219->lanes == 2) ? IMX219_PIXEL_RATE : IMX219_PIXEL_RATE_4LANE;
+	return ((imx219->lanes == 2) ? IMX219_PIXEL_RATE :
+		IMX219_PIXEL_RATE_4LANE) * imx219_get_rate_factor(imx219);
 }
 
 /* Initialize control handlers */
@@ -473,7 +540,7 @@ static int imx219_init_controls(struct imx219 *imx219)
 	const struct imx219_mode *mode = &supported_modes[0];
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	struct v4l2_fwnode_device_properties props;
-	int exposure_max, exposure_def, hblank;
+	int exposure_max, exposure_def, hblank, pixel_rate;
 	int i, ret;
 
 	ctrl_hdlr = &imx219->ctrl_handler;
@@ -482,11 +549,11 @@ static int imx219_init_controls(struct imx219 *imx219)
 		return ret;
 
 	/* By default, PIXEL_RATE is read only */
+	pixel_rate = imx219_get_pixel_rate(imx219);
 	imx219->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
 					       V4L2_CID_PIXEL_RATE,
-					       imx219_get_pixel_rate(imx219),
-					       imx219_get_pixel_rate(imx219), 1,
-					       imx219_get_pixel_rate(imx219));
+					       pixel_rate, pixel_rate, 1,
+					       pixel_rate);
 
 	imx219->link_freq =
 		v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx219_ctrl_ops,
@@ -593,29 +660,13 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 {
 	const struct v4l2_mbus_framefmt *format;
 	const struct v4l2_rect *crop;
-	unsigned int bpp;
-	u64 bin_h, bin_v;
+	u64 binning;
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
@@ -626,28 +677,20 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
 		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
 
-	switch (crop->width / format->width) {
-	case 1:
-	default:
-		bin_h = IMX219_BINNING_NONE;
+	switch (imx219->binning) {
+	case BINNING_NONE:
+		binning = IMX219_BINNING_NONE;
 		break;
-	case 2:
-		bin_h = bpp == 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;
-		break;
-	}
-
-	switch (crop->height / format->height) {
-	case 1:
-	default:
-		bin_v = IMX219_BINNING_NONE;
+	case BINNING_X2:
+		binning = IMX219_BINNING_X2;
 		break;
-	case 2:
-		bin_v = bpp == 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;
+	case BINNING_ANALOG_X2:
+		binning = IMX219_BINNING_X2_ANALOG;
 		break;
 	}
 
-	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
-	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
+	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, binning, &ret);
+	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, binning, &ret);
 
 	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
 		  format->width, &ret);
@@ -851,6 +894,21 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 		int exposure_max;
 		int exposure_def;
 		int hblank;
+		int pixel_rate;
+
+		/* Update binning mode based on format */
+		switch (imx219_get_format_bpp(format)) {
+		case 8:
+			imx219->binning = mode->binning[BINNING_IDX_8_BIT];
+			break;
+
+		case 10:
+			imx219->binning = mode->binning[BINNING_IDX_10_BIT];
+			break;
+
+		default:
+			imx219->binning = BINNING_NONE;
+		}
 
 		/* Update limits and set FPS to default */
 		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
@@ -879,6 +937,11 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
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


