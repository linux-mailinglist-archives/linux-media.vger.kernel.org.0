Return-Path: <linux-media+bounces-26216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B2AA384A7
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 14:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 746F2167D9E
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 13:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D2E21CA05;
	Mon, 17 Feb 2025 13:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Pw/TyuNi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E513121A931;
	Mon, 17 Feb 2025 13:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739798921; cv=none; b=EosAjlN4/QWjeeyxaLzcYxKnpU4BV/8JNXbiVqiCV2J+ryVq2TQ5+C721xL2uPXu4Y6ZEqVhG9YDwnQJOeZzITU4LBOzjp8X8xXD/W+2RtBIXnfrAzcZXLzfrv7U2N+kBdnjrQEoIK4XEPXJlVXuxCtPIB5XJFOq3JNfrm8bV3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739798921; c=relaxed/simple;
	bh=vIyFYBeQc9jLvlrN5HnokpDA4PpMC0ptcjbL0vZkDgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FWG+sIgos3W97ugFFMKFI6STeQxFO+wCEEG5MPc9jhEDX53Y6J1xF55RoQXgZXL/3eeJUAMank9WmUb/tqdKwtTmA/GE7b+R85GrKvaGRfyut9HN3GxvWheVnJyrcMm7OJRCktQk1hOMtJc21CYU3O4KbKpVhaddnansuELYs2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Pw/TyuNi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.80.185])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B1FA22F;
	Mon, 17 Feb 2025 14:27:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739798837;
	bh=vIyFYBeQc9jLvlrN5HnokpDA4PpMC0ptcjbL0vZkDgI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Pw/TyuNiTUCr6yEW4dDYoHCX7iMl9jFe25iYPWG58sQKP1nT8efXWp7+i/ydQ3B0G
	 hh79NJ14tmZqhARKhf0tkKPItHmkA8p8eyUQ+3bNhz2rBn7RMi7ASr6d/wdiPXf1Mk
	 E5+3vxHaa14Eg86O7FKMb2qFWwYrjs9jD1MiclmQ=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 17 Feb 2025 18:57:33 +0530
Subject: [PATCH v7 3/5] media: i2c: imx219: make HBLANK r/w to allow longer
 exposures
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-imx219_fixes-v7-3-83c3c63b737e@ideasonboard.com>
References: <20250217-imx219_fixes-v7-0-83c3c63b737e@ideasonboard.com>
In-Reply-To: <20250217-imx219_fixes-v7-0-83c3c63b737e@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5281;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=TXRnc+Lo+W2/ztJl98NFA7mkkNy355PHmhaY9k2pnUc=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnszlLD5uqZHOSt6fEMN8v6ZP+eeT8fSEhxrm4v
 PrpYfhUdwKJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ7M5SwAKCRBD3pH5JJpx
 RTLPD/49KRjw5fyMmcjr9xE/695kA50RbzNqIu8FKd3PM1nTnHsP359kp4IsOs8fqTofefkoE61
 sUQHt2Sr7HcGsb/rD0uxyShUSnbnfCBrNv3pORHerZJwnHp/xWLhd/Ig0o4P+5WHnznFRH8qz3a
 vI1k0wp9cJ8RNjy2ZrSCGIviqVJR2KmXpjNHeJ2VN6rzfnq70gXo3ubqEcT21wa1ysJ6WTMcufV
 XSpGgsab+tiggsd4L3opwgJclyK/+Ij4Ls3YVROKnMYdi2fwpvjY/msGvJGuturifzp3P5AqMno
 h6/nGghWGDftoe5Fqy/rQdVmV/Qtwpekb3/5nOaSBT2UYP7Im+bPQ80dAOF5kskPv0axJ4eDUBh
 Yok7nAEzavyGGsTVuYtOXOFMURyMpkZyoTS3uqFoASzS6MiRmVJ5oiyYF16ANnCyz13DVLbF80b
 DQzTEU/k0gJGH0orTXLIJmpi9jjRhHCpUufhQOotXZ2+f1+damhk7dIE+RQJVSldKBXYcOYaiDJ
 KmpZB+ptP2lzhP2ixIscgYN2PUFK+oni18HHBgHM+l8zBSQ4jJ33DJpHjmtKPmMfKFS2FZW76ql
 BUCWI8qoBFHEXfiP7XRDV2lwqaZsb6TAihEUaK9ouZp0LNaDi148RkgGryuJjoQJf0sNeSyAtAG
 SuvRRhYOjs/uwNQ==
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
 drivers/media/i2c/imx219.c | 48 +++++++++++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 66460a179e8a9fc1f1216f6beffce4bcd35ff6aa..8239e7ea8ec03849b339c1f314485266d4c4d8bd 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -73,11 +73,10 @@
 #define IMX219_REG_FRM_LENGTH_A		CCI_REG16(0x0160)
 #define IMX219_FLL_MAX			0xffff
 #define IMX219_VBLANK_MIN		32
-
-/* HBLANK control - read only */
-#define IMX219_PPL_DEFAULT		3448
-
 #define IMX219_REG_LINE_LENGTH_A	CCI_REG16(0x0162)
+#define IMX219_LLP_MIN			0x0d78
+#define IMX219_LLP_MAX			0x7ff0
+
 #define IMX219_REG_X_ADD_STA_A		CCI_REG16(0x0164)
 #define IMX219_REG_X_ADD_END_A		CCI_REG16(0x0166)
 #define IMX219_REG_Y_ADD_STA_A		CCI_REG16(0x0168)
@@ -191,7 +190,6 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
 	{ CCI_REG8(0x479b), 0x0e },
 
 	/* Frame Bank Register Group "A" */
-	{ IMX219_REG_LINE_LENGTH_A, 3448 },
 	{ IMX219_REG_X_ODD_INC_A, 1 },
 	{ IMX219_REG_Y_ODD_INC_A, 1 },
 
@@ -420,6 +418,10 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,
 			  format->height + ctrl->val, &ret);
 		break;
+	case V4L2_CID_HBLANK:
+		cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A,
+			  format->width + ctrl->val, &ret);
+		break;
 	case V4L2_CID_TEST_PATTERN_RED:
 		cci_write(imx219->regmap, IMX219_REG_TESTP_RED,
 			  ctrl->val, &ret);
@@ -465,7 +467,7 @@ static int imx219_init_controls(struct imx219 *imx219)
 	const struct imx219_mode *mode = &supported_modes[0];
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	struct v4l2_fwnode_device_properties props;
-	int exposure_max, exposure_def, hblank;
+	int exposure_max, exposure_def;
 	int i, ret;
 
 	ctrl_hdlr = &imx219->ctrl_handler;
@@ -489,17 +491,16 @@ static int imx219_init_controls(struct imx219 *imx219)
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
@@ -815,6 +816,10 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 	unsigned int bin_h, bin_v;
+	u32 prev_line_len;
+
+	format = v4l2_subdev_state_get_format(state, 0);
+	prev_line_len = format->width + imx219->hblank->val;
 
 	mode = v4l2_find_nearest_size(supported_modes,
 				      ARRAY_SIZE(supported_modes),
@@ -822,8 +827,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 				      fmt->format.width, fmt->format.height);
 
 	imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
-
-	format = v4l2_subdev_state_get_format(state, 0);
 	*format = fmt->format;
 
 	/*
@@ -859,13 +862,18 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
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
2.48.1


