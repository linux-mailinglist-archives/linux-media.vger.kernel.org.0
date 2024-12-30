Return-Path: <linux-media+bounces-24152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DC59FE2DA
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 07:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB260161B95
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 06:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4266E19C574;
	Mon, 30 Dec 2024 06:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LFG1lJZf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C4419C546;
	Mon, 30 Dec 2024 06:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735539143; cv=none; b=lP/vYXBvk2gS1BbWKIYxrdZA6fyEmC1GN4Iu+x0bTem63Emv7gXMt77J6WtLBS+WuOUh4p0sTGJW4Yya6UlRWv2RmPZLsNCaVKullrSyKmiIjv9IhaQH1/u1a4zuM23mRlp3hmk6W0qkRdj1SfGXyRwviKF9VwX9RVIk3PFUjNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735539143; c=relaxed/simple;
	bh=1fDSuUMI0Cdk1Zam669O5fJ6eaoCw+NsZLJk96wJXB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qjv8hdQo6pNKVMGIBR34r52OEsDjRo1fNrC1g3m4WT5oFRVJKLoU1HYUJ98QsRwA6wM+5l6nSpAwT10Y8ovoZ8iutxsf0DQwoptvYYZKtrxbNyUgf1jExRhsIf5aMkFmAkzlh1l5Z79RuZ9BSnty5S9kH49wuD15/7d2EcxIatc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LFG1lJZf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.82.226])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 440FD3DC;
	Mon, 30 Dec 2024 07:11:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735539094;
	bh=1fDSuUMI0Cdk1Zam669O5fJ6eaoCw+NsZLJk96wJXB8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LFG1lJZf1SNbw7b4glTNvA5BlcYWMqHdL1MB0dp8WwUQdX5lMklyyc0damfch+Spv
	 Sk1YsZKxRBGZk39tu1bk1DU+buHX4T/kCxwM44xtE3WkFvB9oEL7cUlZhAJUmECIJY
	 /LPB0T8xIUAI7MtnrdpZl/ye9XPoDrsvrME/eLCY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 30 Dec 2024 11:41:20 +0530
Subject: [PATCH v5 3/5] media: i2c: imx219: make HBLANK r/w to allow longer
 exposures
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-imx219_fixes-v5-3-98446d816489@ideasonboard.com>
References: <20241230-imx219_fixes-v5-0-98446d816489@ideasonboard.com>
In-Reply-To: <20241230-imx219_fixes-v5-0-98446d816489@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5371;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=po0UcbbPjvedRrNUGAeWRXzY5q5ZoiwB/fj3hUJEa2s=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBncjmKsA7Zq0rzyy1TgfZK7oqI4A/bnLWIiE+M/
 BJTsZCBpvuJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ3I5igAKCRBD3pH5JJpx
 ReE1EACrufTO23PZ8F89Cz1NlB/J+qCvzZPDWdB14bs0aUJVw8k9CU8yH+1MJpX+dfBjvqjUebA
 YRWqNP5olYf/Fn8LzS+kq0l4xmbN0OSsSvTXo8TYSiRxf45jnVBl+c7vWB1qgoWkHAr0MkD2Qub
 E4j/f3ZxjGIZHpiT4m15dIez8iPt7HRgbC7WHqUj6q8wAR4XSiB134Ea2dMWiyxHpy9W2lyLO6M
 iKyzC4ONtfFM/EPW9GycUQ38OglBNxThIJjAUS5MJ5eepBUXustk5Z+xvsYWdWkq8fQrboQ8f7C
 RBtp+T2fR1hr/L757g70jy9c5hWwZNPXBn93lzLHmP3ijSx7dYjsDtOD3HAGSBcS2nQ6v3OiL5r
 OddGeipBNoeAv3DAEo5yH02/BdGFm1RksChwg/ztE9kqI+U27sFokRLDGEJRx63YI3hN+wuyKRp
 zJ/o9hUpAMVUkF/0Ghb1F3y2/r9KKwNJcG8lcLTv7QTvuijWsDn0WfuHpkK5+1moP6kfrHE7DX4
 30bK1Wciom+mu5G2Ov9e+0wB8k5Ni+1yv6ymFmvdusXvsi0oMrcBIE9OwoGSRkPBD411VFOiuky
 sBw6tJVUEwT4Ckbc+uu+Nwbi/T46xXkTMD/tX2S/risCOM7FGZ8qBlAsDmtGYqf5lAGvrmaiQk5
 nrKmY9/x4spCI/A==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The HBLANK control was read-only, and always configured such that the
sensor line length register was 3448. This limited the maximum exposure
time that could be achieved to around 1.26 secs.

Make HBLANK read/write so that the line time can be extended, and
thereby allow longer exposures (and slower frame rates). Retain the
overall line length setting when changing modes rather than resetting it
to a default.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 49 +++++++++++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 8565b1b030be2ee24bcc37415e99ee4ef83cc683..9682a74feb3b7b74cd2ca54779323396c77cd5a5 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -73,11 +73,10 @@
 #define IMX219_REG_FRM_LENGTH		CCI_REG16(0x0160)
 #define IMX219_FLL_MAX			0xffff
 #define IMX219_VBLANK_MIN		32
+#define IMX219_REG_LINE_LENGTH		CCI_REG16(0x0162)
+#define IMX219_LLP_MIN			0x0d78
+#define IMX219_LLP_MAX			0x7ff0
 
-/* HBLANK control - read only */
-#define IMX219_PPL_DEFAULT		3448
-
-#define IMX219_REG_LINE_LENGTH_A	CCI_REG16(0x0162)
 #define IMX219_REG_X_ADD_STA_A		CCI_REG16(0x0164)
 #define IMX219_REG_X_ADD_END_A		CCI_REG16(0x0166)
 #define IMX219_REG_Y_ADD_STA_A		CCI_REG16(0x0168)
@@ -191,7 +190,7 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
 	{ CCI_REG8(0x479b), 0x0e },
 
 	/* Frame Bank Register Group "A" */
-	{ IMX219_REG_LINE_LENGTH_A, 3448 },
+	{ IMX219_REG_LINE_LENGTH, IMX219_LLP_MIN },
 	{ IMX219_REG_X_ODD_INC_A, 1 },
 	{ IMX219_REG_Y_ODD_INC_A, 1 },
 
@@ -420,6 +419,10 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH,
 			  format->height + ctrl->val, &ret);
 		break;
+	case V4L2_CID_HBLANK:
+		cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH,
+			  format->width + ctrl->val, &ret);
+		break;
 	case V4L2_CID_TEST_PATTERN_RED:
 		cci_write(imx219->regmap, IMX219_REG_TESTP_RED,
 			  ctrl->val, &ret);
@@ -465,7 +468,7 @@ static int imx219_init_controls(struct imx219 *imx219)
 	const struct imx219_mode *mode = &supported_modes[0];
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	struct v4l2_fwnode_device_properties props;
-	int exposure_max, exposure_def, hblank;
+	int exposure_max, exposure_def;
 	int i, ret;
 
 	ctrl_hdlr = &imx219->ctrl_handler;
@@ -489,17 +492,16 @@ static int imx219_init_controls(struct imx219 *imx219)
 	if (imx219->link_freq)
 		imx219->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	/* Initial vblank/hblank/exposure parameters based on current mode */
+	/* Initial blanking and exposure. Limits are updated during set_fmt */
 	imx219->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
 					   V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
 					   IMX219_FLL_MAX - mode->height, 1,
 					   mode->fll_def - mode->height);
-	hblank = IMX219_PPL_DEFAULT - mode->width;
 	imx219->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
-					   V4L2_CID_HBLANK, hblank, hblank,
-					   1, hblank);
-	if (imx219->hblank)
-		imx219->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+					   V4L2_CID_HBLANK,
+					   IMX219_LLP_MIN - mode->width,
+					   IMX219_LLP_MAX - mode->width, 1,
+					   IMX219_LLP_MIN - mode->width);
 	exposure_max = mode->fll_def - 4;
 	exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
 		exposure_max : IMX219_EXPOSURE_DEFAULT;
@@ -815,6 +817,10 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 	unsigned int bin_h, bin_v;
+	u32 prev_line_len;
+
+	format = v4l2_subdev_state_get_format(state, 0);
+	prev_line_len = format->width + imx219->hblank->val;
 
 	mode = v4l2_find_nearest_size(supported_modes,
 				      ARRAY_SIZE(supported_modes),
@@ -822,8 +828,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 				      fmt->format.width, fmt->format.height);
 
 	imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
-
-	format = v4l2_subdev_state_get_format(state, 0);
 	*format = fmt->format;
 
 	/*
@@ -859,13 +863,18 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 					 exposure_max, imx219->exposure->step,
 					 exposure_def);
 		/*
-		 * Currently PPL is fixed to IMX219_PPL_DEFAULT, so hblank
-		 * depends on mode->width only, and is not changeble in any
-		 * way other than changing the mode.
+		 * Retain PPL setting from previous mode so that the
+		 * line time does not change on a mode change.
+		 * Limits have to be recomputed as the controls define
+		 * the blanking only, so PPL values need to have the
+		 * mode width subtracted.
 		 */
-		hblank = IMX219_PPL_DEFAULT - mode->width;
-		__v4l2_ctrl_modify_range(imx219->hblank, hblank, hblank, 1,
-					 hblank);
+		hblank = prev_line_len - mode->width;
+		__v4l2_ctrl_modify_range(imx219->hblank,
+					 IMX219_LLP_MIN - mode->width,
+					 IMX219_LLP_MAX - mode->width, 1,
+					 IMX219_LLP_MIN - mode->width);
+		__v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
 	}
 
 	return 0;

-- 
2.47.1


