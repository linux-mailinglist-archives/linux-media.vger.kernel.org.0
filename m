Return-Path: <linux-media+bounces-21746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8029D4C8F
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 13:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 942AA1F21056
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 12:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C571D86F2;
	Thu, 21 Nov 2024 12:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lJJ7Akzw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07DD1A3BC8;
	Thu, 21 Nov 2024 12:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732190964; cv=none; b=Qk/4YHdQizLysYlHJldMWg9NEqOCuNrO4HTxmFxh871KpySecjzZN+eGOFzNG0hUD8ytj5+oIoJRZU9ukhpRYjuSkU6criuy89PWCYY2HdDw737NNUkXzDpx+AZfPowpTi6M8I1ub7eAQUuBZyOsNhZd9obi+BwVDUt/7Rk7IHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732190964; c=relaxed/simple;
	bh=6p0goZfRhfmcY+8BF+dgtOTPBYivAv61Hi5k/4sl6I4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BmivuG8goelVCfLJVKqeCguL4V9ut9VIv5VZI/HCKtTf7z/I/orDeTh8K9JS0DpT7Ta7YxIOQIw5tTZMHvMkCVkiKYRwSUP27m1XDcqsdULY/Ky1f0VdJ1uWDyYAvK0R8cCWdRS3IKhjWsTHDFhPOtmsh/tpc/cT59JsuuWZfRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lJJ7Akzw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:883a:10f2:5b4b:5292:ac46:e988])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E6FF9736;
	Thu, 21 Nov 2024 13:09:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732190942;
	bh=6p0goZfRhfmcY+8BF+dgtOTPBYivAv61Hi5k/4sl6I4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lJJ7AkzwqSKSq7PhFA81EHzRBjimXPLwF9aSa2QdW2DImfFkOXm3OVLQVInyol9vJ
	 EQgBw/4AYY8ye6q4XSzknpCGnHHJXRShEX0wiazFehEnVDLjObMhKvDY9kWYVuZaf6
	 lHTOXNo70wtfn4PQE7snJltaWyujB45wbFzGY7fA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 21 Nov 2024 17:38:04 +0530
Subject: [PATCH v2 3/3] media: i2c: imx219: Scale the pixel rate for analog
 binning
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241121-imx219_fixes-v2-3-7b068a60ea40@ideasonboard.com>
References: <20241121-imx219_fixes-v2-0-7b068a60ea40@ideasonboard.com>
In-Reply-To: <20241121-imx219_fixes-v2-0-7b068a60ea40@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Vinay Varma <varmavinaym@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8446;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=6p0goZfRhfmcY+8BF+dgtOTPBYivAv61Hi5k/4sl6I4=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnPyLWfvpJf3Q1ULt1yaEgOD8K55SORH6TnM6QW
 a+SDvEGWYmJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZz8i1gAKCRBD3pH5JJpx
 RYxYEAC4Hp1TeBUEWE51xfjCd828bvGvIT64RVLGXQgn5221iMcV0N93QY7r7l8ct+LPUjGH3h+
 0Dp7hqblq/jUHpYZz8MQvIjr5qRNSEive1F2o3AVibGhOhO2lcUy9dSfbUW9hNxYwMvDIdLYksn
 1fhCJuYS9DSS9PgORGQF395pm0RVERI+95BfOLEU5ddtIniau1/7lgqN9y3gFM9EkyfvxlllJEA
 wnlapS2LiLC4ZyC/tdREThq9hK6mQm2IZ3iGCUABeypKf6jb/ifAKgwrRqLVdlPCQWj+a3q+zCh
 9F80VxTrugb8I9waH8FizPQxVOzhzW/YYVlaheIFEPfYglfdqxnOv2YN1BJlAl2mScOv9Z0Z2wY
 YaS4ALj7LeMHaFq/LjmYBa3QCHVv2WaI1vp+5hSErbeJj/ZS/+WSdnnw1wk86i//XT60dlGJFOR
 y062wo3Cy+UH4ck+ykJUISAedpTpz0vEuoqz/GgUJRz9rrIfhRk46l0he9R/oL8traGd21ZCIim
 8q1fPc+CBi+S30GMy+OyzkSwDPViUfZXqmtUULwLqeo8dvbiCFAft088ODLZPCE+N1kMYrHYlG1
 J8aGJundeICkIB2/mDdiXqiNiFtAQmB8z4z4GL8jgd+tw4HBgG75O60Y6gPfa60LlwK3rAaAoWM
 v1jWF4CBVwTzOyg==
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
 drivers/media/i2c/imx219.c | 138 ++++++++++++++++++++++++++++++---------------
 1 file changed, 94 insertions(+), 44 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 970e6362d0ae3a9078daf337155e83d637bc1ca1..ec795569361987ae30bff234e97fa34600bf5975 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -149,6 +149,18 @@
 #define IMX219_PIXEL_ARRAY_WIDTH	3280U
 #define IMX219_PIXEL_ARRAY_HEIGHT	2464U
 
+enum binning_mode {
+	BINNING_NONE = IMX219_BINNING_NONE,
+	BINNING_X2 = IMX219_BINNING_X2,
+	BINNING_ANALOG_X2 = IMX219_BINNING_X2_ANALOG,
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
@@ -592,29 +659,12 @@ static int imx219_set_framefmt(struct imx219 *imx219,
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
@@ -625,28 +675,8 @@ static int imx219_set_framefmt(struct imx219 *imx219,
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
+	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, imx219->binning, &ret);
+	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, imx219->binning, &ret);
 
 	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
 		  format->width, &ret);
@@ -851,6 +881,21 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
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
@@ -879,6 +924,11 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
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


