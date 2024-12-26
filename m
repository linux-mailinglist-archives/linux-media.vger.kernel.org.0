Return-Path: <linux-media+bounces-24099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B72489FC985
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 08:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C2A91882BA1
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 07:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783541D5166;
	Thu, 26 Dec 2024 07:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DP+cW6n+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1611D151F;
	Thu, 26 Dec 2024 07:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735199464; cv=none; b=SxonIs30G5RadYSmo2nAf8n956WLSugM+c859NW7a1W51w7ZMcCbaB1UkmKqN1IFFM6BD4QfEYWzC3n0aNe56jaH9xhOoyZ/sjwWBS6LMU8e5h+lfiopvU6lc+9xpWEw6x6ES0zS/Jsk88wT6bucJgYUdYsTnc9ZL5DpSma00yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735199464; c=relaxed/simple;
	bh=rbDpw7jHnSgIIVqO7dHJG7GD0KrH66CyYFl2OAvPPpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bp3g0+CfOAVzph5qzcVLE0orUPCT9asTdGBvdL9Qsqp0NzglguPaYaCRqIo6Qf5syOyu0lGC9M3IFhOU20SJHlZEYlRwP/gZEyn++DTQaKy4pq9GTMnW1yP7MwxinAqs7lunvyMzGivIXxozTmYOTIM5ecioQxVrxbVKYnpNQMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DP+cW6n+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:416f:6c:4037:639a:e90f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E9F89FF;
	Thu, 26 Dec 2024 08:50:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735199417;
	bh=rbDpw7jHnSgIIVqO7dHJG7GD0KrH66CyYFl2OAvPPpU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DP+cW6n+4QKb6i7c8hiou0nY0EWMUfmGmIdIfPbz644Qv6a2Lq7Axb8rqlOZDrbA6
	 kwjb1WdJtSOUDz/KgK3W1+TUTaIIqmrVEq+1eMVf/XA1aLExMgOolJUTIq2JqlRbVi
	 8MPP+azgnz8couRtRZ+z6UbmBOw+2NsIfTh3LWSU=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 26 Dec 2024 13:19:37 +0530
Subject: [PATCH v4 5/5] media: i2c: imx219: Scale the pixel rate for analog
 binning
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241226-imx219_fixes-v4-5-dd28383f06f7@ideasonboard.com>
References: <20241226-imx219_fixes-v4-0-dd28383f06f7@ideasonboard.com>
In-Reply-To: <20241226-imx219_fixes-v4-0-dd28383f06f7@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Vinay Varma <varmavinaym@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7108;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=rbDpw7jHnSgIIVqO7dHJG7GD0KrH66CyYFl2OAvPPpU=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnbQrD6hm/+J9hwmVx34cYRIxcjizuPR5xBL6RM
 lC2qbG6YeWJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ20KwwAKCRBD3pH5JJpx
 RcvGD/4uORxU0gzWQIEozJWm9Y9iiej13ziNhJ5JPzKtd0Vls+FBr0ilDFajV4t8pNVUTaovUoF
 0n1gMNOk5kiCJvTCAJUnflWTT1jDJ33jTgf6z/2LC/8nXzvrJN4hx06NDq7Pdq88Wc4pJtWlDXd
 09G7DmZ2wVvFIIei53xnYL0zOYrSPPvfvZbye7hccNMEzWfEiBdEaLNydBfrzaXPGUjkvRcjE6E
 R1+txZ422aLbu7K/7MfO9NLieFVYqpfk/nAkJMQvw2qfiZmnL1spONAmpfZ4SL10WBi18IJXcCo
 FnlHYcBaZDiT4tDPTa9Wdaf9ReqTJgTSdSIMgy6psA+cflZqyBQnki+C6XZ0yaGqdbwmRB5iG3Q
 r5njYnQI2Pk6maVdB+azBpUAhpi4J7PTL+Uxyy1nnuB6mff/C/eUUzx4a9jhQy4g80JPwwZ4uRQ
 NK5cgS6a4jnjIWzAcctH204QaRDu/Dsoh3hdtpu5ARBqWvxGj0CgAKty6AOfwYxNcUwaaIcwtnn
 khAYbFCy3yHlJW8Hb13LAvcYOk0U62pxSZJ54KtXGPS1HrbcLn1SPx/Ny+LOF4iZ25X/840patK
 jHzYmt6aKNwlvq82dVRQBbZO5kIXfKUIDS3uEV1q+m3iA8SnYaSRIZcB1HfGH13JdlL76sl0tjX
 PwqG96zOhWqmA5w==
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
 drivers/media/i2c/imx219.c | 122 +++++++++++++++++++++++++++++----------------
 1 file changed, 79 insertions(+), 43 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index a8fcb7234c78b888cd7424629ced02cdc55a98fd..087ace42e5b6f27a2f7ff4980ed22f16aeafaede 100644
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
@@ -357,6 +363,59 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
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
@@ -368,10 +427,12 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -400,7 +461,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_EXPOSURE:
 		cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
-			  ctrl->val, &ret);
+			  ctrl->val / rate_factor, &ret);
 		break;
 	case V4L2_CID_DIGITAL_GAIN:
 		cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
@@ -417,7 +478,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_VBLANK:
 		cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH,
-			  format->height + ctrl->val, &ret);
+			  (format->height + ctrl->val) / rate_factor, &ret);
 		break;
 	case V4L2_CID_HBLANK:
 		cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH,
@@ -588,29 +649,14 @@ static int imx219_set_framefmt(struct imx219 *imx219,
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
@@ -621,28 +667,11 @@ static int imx219_set_framefmt(struct imx219 *imx219,
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
@@ -847,6 +876,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 		int exposure_max;
 		int exposure_def;
 		int hblank;
+		int pixel_rate;
 
 		/* Update limits and set FPS to default */
 		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
@@ -875,6 +905,12 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
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
2.47.1


