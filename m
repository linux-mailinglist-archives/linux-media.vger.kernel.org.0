Return-Path: <linux-media+bounces-17414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1606968F49
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 23:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 428901F234B9
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 21:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41184188A01;
	Mon,  2 Sep 2024 21:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOwVH75s"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8B8187FEE;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725314032; cv=none; b=hkr6wsRNNcQ6qDFngcCCwP79pnlmv2adbqPkGNphOYqUZH5B15O9x5Fgj2HSeehEU/1EDPUU+OJqkspqP4ob00QrIB1jGJgJOUqQ+WPZgcGtJuu420OwIhgG51ah34fMLPeydbozVWVjy8erLIy4JIEeejK51DNhcp60UVMQofM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725314032; c=relaxed/simple;
	bh=xIQpd+6F/rJuhu1Lnvl6Lh9tIuVnFXCVzRvNOsSe3Eg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kJwWRvMi28wUIZqL3Hj5U4Ptnl9CDJxIIh9H+i2GAoM2YMCtltZ8iRaEyIFVcL3F3F8pTfHRq5hOWiY8TG8gXoyIM2n9TRpk3+HVreaZX2QcIWN3E5NUD5yFhgVww/L4UUVq+Za/BDqbCSGimHR/kiUjSlN+fx0OA8/JcwSJZHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EOwVH75s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C22A8C4AF0C;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725314031;
	bh=xIQpd+6F/rJuhu1Lnvl6Lh9tIuVnFXCVzRvNOsSe3Eg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EOwVH75swyJ7Q4jAvTKiQ2+VzPqvw4bcSoi7NO893II68lXEGK0n3C8aUPX3rxh4l
	 eH2++SsWniJG8FOmnUHzLc1PF1Q7IxjisoDyRgln1/8wO0zPfZ2C0r6W7lSknxnPL6
	 ZqyA/9GYqoFy1hDyHz3tESiidVNujVvPDnmmLKKiNBAkm0FZOmayvuo/vulBhLQ3+P
	 KwP4AEqPBhHfu+iSP/GU3KDKXOl1GN6NVj9Pp6/sa9iT+cykT+MqBUKzuPr+RFGahT
	 8RX+VWcy6Fmr80PLulhElEnu8gQBdQ8MksIiDxdYBXcNi0536NgOLYQG/2MYup7oxU
	 8EYOHiV7f+cEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85C6CD3420;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 02 Sep 2024 23:54:36 +0200
Subject: [PATCH 09/13] media: i2c: imx214: Extract format and crop settings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240902-imx214-v1-9-c96cba989315@apitzsch.eu>
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725314079; l=8319;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=tx8U555AKCRQmtqlBNaqTC3U56zndeMKNcNs+hIE70M=;
 b=iBUrQTwzUL/nNPABMRdIW3mKC58g8AoXvUqbjww5HAtktrl8og2fEPjpcCurKW8daABL6T8jy
 YZzKjiuu+wtCByt2PMxyUhr+0EC/k91T+P6eJxeI9qQlEfWFD7FFmiL
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Remove format and crop settings from register sequences and set them
programmatically.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 137 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 105 insertions(+), 32 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 9f5a57aebb86..733f55257585 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -132,6 +132,9 @@
 #define IMX214_BINNING_NONE		0
 #define IMX214_BINNING_ENABLE		1
 #define IMX214_REG_BINNING_TYPE		CCI_REG8(0x0901)
+#define IMX214_BINNING_1X1		0
+#define IMX214_BINNING_2X2		0x22
+#define IMX214_BINNING_4X4		0x44
 #define IMX214_REG_BINNING_WEIGHTING	CCI_REG8(0x0902)
 #define IMX214_BINNING_AVERAGE		0x00
 #define IMX214_BINNING_SUMMED		0x01
@@ -214,36 +217,22 @@ static const struct cci_reg_sequence mode_4096x2304[] = {
 	{ IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
 	{ IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
 	{ IMX214_REG_EXPOSURE_RATIO, 1 },
-	{ IMX214_REG_X_ADD_STA, 56 },
-	{ IMX214_REG_Y_ADD_STA, 408 },
-	{ IMX214_REG_X_ADD_END, 4151 },
-	{ IMX214_REG_Y_ADD_END, 2711 },
 	{ IMX214_REG_X_EVEN_INC, 1 },
 	{ IMX214_REG_X_ODD_INC, 1 },
 	{ IMX214_REG_Y_EVEN_INC, 1 },
 	{ IMX214_REG_Y_ODD_INC, 1 },
-	{ IMX214_REG_BINNING_MODE, IMX214_BINNING_NONE },
-	{ IMX214_REG_BINNING_TYPE, 0 },
 	{ IMX214_REG_BINNING_WEIGHTING, IMX214_BINNING_AVERAGE },
 	{ CCI_REG8(0x3000), 0x35 },
 	{ CCI_REG8(0x3054), 0x01 },
 	{ CCI_REG8(0x305C), 0x11 },
 
-	{ IMX214_REG_CSI_DATA_FORMAT, IMX214_CSI_DATA_FORMAT_RAW10 },
-	{ IMX214_REG_X_OUTPUT_SIZE, 4096 },
-	{ IMX214_REG_Y_OUTPUT_SIZE, 2304 },
 	{ IMX214_REG_SCALE_MODE, IMX214_SCALE_NONE },
 	{ IMX214_REG_SCALE_M, 2 },
-	{ IMX214_REG_DIG_CROP_X_OFFSET, 0 },
-	{ IMX214_REG_DIG_CROP_Y_OFFSET, 0 },
-	{ IMX214_REG_DIG_CROP_WIDTH, 4096 },
-	{ IMX214_REG_DIG_CROP_HEIGHT, 2304 },
 
 	{ IMX214_REG_VTPXCK_DIV, 5 },
 	{ IMX214_REG_VTSYCK_DIV, 2 },
 	{ IMX214_REG_PREPLLCK_VT_DIV, 3 },
 	{ IMX214_REG_PLL_VT_MPY, 150 },
-	{ IMX214_REG_OPPXCK_DIV, 10 },
 	{ IMX214_REG_OPSYCK_DIV, 1 },
 	{ IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
 
@@ -284,36 +273,22 @@ static const struct cci_reg_sequence mode_1920x1080[] = {
 	{ IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
 	{ IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
 	{ IMX214_REG_EXPOSURE_RATIO, 1 },
-	{ IMX214_REG_X_ADD_STA, 1144 },
-	{ IMX214_REG_Y_ADD_STA, 1020 },
-	{ IMX214_REG_X_ADD_END, 3063 },
-	{ IMX214_REG_Y_ADD_END, 2099 },
 	{ IMX214_REG_X_EVEN_INC, 1 },
 	{ IMX214_REG_X_ODD_INC, 1 },
 	{ IMX214_REG_Y_EVEN_INC, 1 },
 	{ IMX214_REG_Y_ODD_INC, 1 },
-	{ IMX214_REG_BINNING_MODE, IMX214_BINNING_NONE },
-	{ IMX214_REG_BINNING_TYPE, 0 },
 	{ IMX214_REG_BINNING_WEIGHTING, IMX214_BINNING_AVERAGE },
 	{ CCI_REG8(0x3000), 0x35 },
 	{ CCI_REG8(0x3054), 0x01 },
 	{ CCI_REG8(0x305C), 0x11 },
 
-	{ IMX214_REG_CSI_DATA_FORMAT, IMX214_CSI_DATA_FORMAT_RAW10 },
-	{ IMX214_REG_X_OUTPUT_SIZE, 1920 },
-	{ IMX214_REG_Y_OUTPUT_SIZE, 1080 },
 	{ IMX214_REG_SCALE_MODE, IMX214_SCALE_NONE },
 	{ IMX214_REG_SCALE_M, 2 },
-	{ IMX214_REG_DIG_CROP_X_OFFSET, 0 },
-	{ IMX214_REG_DIG_CROP_Y_OFFSET, 0 },
-	{ IMX214_REG_DIG_CROP_WIDTH, 1920 },
-	{ IMX214_REG_DIG_CROP_HEIGHT, 1080 },
 
 	{ IMX214_REG_VTPXCK_DIV, 5 },
 	{ IMX214_REG_VTSYCK_DIV, 2 },
 	{ IMX214_REG_PREPLLCK_VT_DIV, 3 },
 	{ IMX214_REG_PLL_VT_MPY, 150 },
-	{ IMX214_REG_OPPXCK_DIV, 10 },
 	{ IMX214_REG_OPSYCK_DIV, 1 },
 	{ IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
 
@@ -626,6 +601,7 @@ static int imx214_set_format(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *__format;
 	struct v4l2_rect *__crop;
 	const struct imx214_mode *mode;
+	unsigned int bin_h, bin_v, bin;
 
 	mode = v4l2_find_nearest_size(imx214_modes,
 				      ARRAY_SIZE(imx214_modes), width, height,
@@ -637,9 +613,32 @@ static int imx214_set_format(struct v4l2_subdev *sd,
 	__format = v4l2_subdev_state_get_format(sd_state, 0);
 	*__format = format->format;
 
+	/*
+	 * Use binning to maximize the crop rectangle size, and centre it in the
+	 * sensor.
+	 */
+	bin_h = IMX214_PIXEL_ARRAY_WIDTH / __format->width;
+	bin_v = IMX214_PIXEL_ARRAY_HEIGHT / __format->height;
+
+	switch (min(bin_h, bin_v)) {
+	case 1:
+		bin = 1;
+		break;
+	case 2:
+	case 3:
+		bin = 2;
+		break;
+	case 4:
+	default:
+		bin = 4;
+		break;
+	}
+
 	__crop = v4l2_subdev_state_get_crop(sd_state, 0);
-	__crop->width = mode->width;
-	__crop->height = mode->height;
+	__crop->width = __format->width * bin;
+	__crop->height = __format->height * bin;
+	__crop->left = (IMX214_NATIVE_WIDTH - __crop->width) / 2;
+	__crop->top = (IMX214_NATIVE_HEIGHT - __crop->height) / 2;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		int exposure_max;
@@ -845,6 +844,71 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 	return 0;
 };
 
+static int imx214_set_framefmt(struct imx214 *imx214,
+			       struct v4l2_subdev_state *state)
+{
+	const struct v4l2_mbus_framefmt *format;
+	const struct v4l2_rect *crop;
+	unsigned int bpp;
+	u64 bin_mode;
+	u64 bin_type;
+	int ret = 0;
+
+	format = v4l2_subdev_state_get_format(state, 0);
+	crop = v4l2_subdev_state_get_crop(state, 0);
+
+	switch (format->code) {
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	default:
+		bpp = 10;
+		break;
+	}
+
+	cci_write(imx214->regmap, IMX214_REG_X_ADD_STA,
+		  crop->left - IMX214_PIXEL_ARRAY_LEFT, &ret);
+	cci_write(imx214->regmap, IMX214_REG_X_ADD_END,
+		  crop->left - IMX214_PIXEL_ARRAY_LEFT + crop->width - 1, &ret);
+	cci_write(imx214->regmap, IMX214_REG_Y_ADD_STA,
+		  crop->top - IMX214_PIXEL_ARRAY_TOP, &ret);
+	cci_write(imx214->regmap, IMX214_REG_Y_ADD_END,
+		  crop->top - IMX214_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
+
+	/* Proper setting is required even if cropping is not used */
+	cci_write(imx214->regmap, IMX214_REG_DIG_CROP_WIDTH, crop->width, &ret);
+	cci_write(imx214->regmap, IMX214_REG_DIG_CROP_HEIGHT, crop->height, &ret);
+
+	switch (crop->width / format->width) {
+	case 1:
+	default:
+		bin_mode = IMX214_BINNING_NONE;
+		bin_type = IMX214_BINNING_1X1;
+		break;
+	case 2:
+		bin_mode = IMX214_BINNING_ENABLE;
+		bin_type = IMX214_BINNING_2X2;
+		break;
+	case 4:
+		bin_mode = IMX214_BINNING_ENABLE;
+		bin_type = IMX214_BINNING_4X4;
+		break;
+	}
+
+	cci_write(imx214->regmap, IMX214_REG_BINNING_MODE, bin_mode, &ret);
+	cci_write(imx214->regmap, IMX214_REG_BINNING_TYPE, bin_type, &ret);
+
+	cci_write(imx214->regmap, IMX214_REG_X_OUTPUT_SIZE, format->width, &ret);
+	cci_write(imx214->regmap, IMX214_REG_Y_OUTPUT_SIZE, format->height, &ret);
+
+	cci_write(imx214->regmap, IMX214_REG_CSI_DATA_FORMAT,
+		  (bpp << 8) | bpp, &ret);
+	cci_write(imx214->regmap, IMX214_REG_OPPXCK_DIV, bpp, &ret);
+
+	return ret;
+};
+
 static int imx214_configure_lanes(struct imx214 *imx214)
 {
 	return cci_write(imx214->regmap, IMX214_REG_CSI_LANE_MODE,
@@ -852,7 +916,8 @@ static int imx214_configure_lanes(struct imx214 *imx214)
 			 IMX214_CSI_4_LANE_MODE, NULL);
 };
 
-static int imx214_start_streaming(struct imx214 *imx214)
+static int imx214_start_streaming(struct imx214 *imx214,
+				  struct v4l2_subdev_state *state)
 {
 	const struct imx214_mode *mode;
 	int ret;
@@ -871,6 +936,14 @@ static int imx214_start_streaming(struct imx214 *imx214)
 		return ret;
 	}
 
+	/* Apply format and crop settings */
+	ret = imx214_set_framefmt(imx214, state);
+	if (ret) {
+		dev_err(imx214->dev, "%s failed to set frame format: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
 	mode = v4l2_find_nearest_size(imx214_modes,
 				ARRAY_SIZE(imx214_modes), width, height,
 				imx214->fmt.width, imx214->fmt.height);
@@ -922,7 +995,7 @@ static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
 			return ret;
 
 		state = v4l2_subdev_lock_and_get_active_state(subdev);
-		ret = imx214_start_streaming(imx214);
+		ret = imx214_start_streaming(imx214, state);
 		v4l2_subdev_unlock_state(state);
 		if (ret < 0)
 			goto err_rpm_put;

-- 
2.46.0



