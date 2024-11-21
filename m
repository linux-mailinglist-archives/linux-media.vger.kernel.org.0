Return-Path: <linux-media+bounces-21745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5748D9D4C8C
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 13:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD5351F22B6D
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 12:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D7B1D7E4E;
	Thu, 21 Nov 2024 12:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="P/Aqwb80"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E371A3BC8;
	Thu, 21 Nov 2024 12:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732190957; cv=none; b=eXPRFi0/yRRlzelwO8xTYZrvt+DgKifw4Ep3NLQ8QG7wSRwJDmbv2+TOwViTWaoj+R0DilCU2w2wlwaFh/HBrce/J83k6Ew5H2X79geyLQnA82NkLYUm2qWN9CDgU7+EwhOveitgd8T6alY2IJXjkfkDs96pVqC44hjy0Gmz+uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732190957; c=relaxed/simple;
	bh=QqI5d5eVtyBQ2t+mhUBKeyKswM4PkAT79Vz06aYH8TY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lvj+2uG3kl5E9cp6+kHKhOpqxInSaaSpOrqXvAs4Ov9cnQNADlpcR2otOgdra+CzX2oDQb9/SBxdP2kaEDJM+YA9ORAr4H1a6OSPo5xjvZu3+2NmwxEt/5+cTRz5qAaA4mJxSUUklDqOQLwGTQrX4ng+biVa+d3K3QLv1iyd/hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=P/Aqwb80; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:883a:10f2:5b4b:5292:ac46:e988])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F18A219;
	Thu, 21 Nov 2024 13:08:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732190935;
	bh=QqI5d5eVtyBQ2t+mhUBKeyKswM4PkAT79Vz06aYH8TY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P/Aqwb80qSQ4wi5xdrbGt1az2wWMMTw9pPdyw0mtWF40i3L3cHaCHv2feSt0q0CmA
	 WG6XEmyPMWpm2KxumdfTPnpu4DlfUKfox7DZmnMwBhQRNIjFMrs9rX26rn1d1VOXET
	 L5b2W17+6Dbdr2qZX/1umOPzKPQvKdH4GegZDpxY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 21 Nov 2024 17:38:03 +0530
Subject: [PATCH v2 2/3] media: i2c: imx219: make HBLANK r/w to allow longer
 exposures
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241121-imx219_fixes-v2-2-7b068a60ea40@ideasonboard.com>
References: <20241121-imx219_fixes-v2-0-7b068a60ea40@ideasonboard.com>
In-Reply-To: <20241121-imx219_fixes-v2-0-7b068a60ea40@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4015;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=XlUePLGV68JgrfulNWEVW2gJa0c01VaOd4IHeTB6KKE=;
 b=kA0DAAgBQ96R+SSacUUByyZiAGc/ItagkfT6TVQoKZSpLh1gQj94fUYpNGqtTiB+cx8gPfk48
 4kCMwQAAQgAHRYhBE3g2Bjl1XXo1FqvxUPekfkkmnFFBQJnPyLWAAoJEEPekfkkmnFFN2IP/0Mg
 JxoBWoa8DUE0EzeUSztYgCIhVcqBrh+nZwXL6I1+bJEJ63nLfi9sNkSMde62MYpsgENhlxLjb3a
 a/rHWd1G7jRlJPFl66bCEAkFGOnDah/56fpEqwTJCLToG5QlULvco7cgNhAI3RKf/5LhLr2gBx8
 MwZAu3dYh2yWyZ0wgpvxXV6aKLY+ovLsH1/oWKAE45I9+y1Z1qfJ5wWCWkVi5CqgvcA1+dTOgNJ
 lNuD/HNQxGWnXBsq5Fvd75RNbyzoeLorBo1/5TmX4Jv/i6yoY5K5Z5LHNQ0g0nMtKxBVaZK2pq9
 Prn9ch82gmm79VzQCOH66HtHbf7x5D1MrnxEa+Bvs9w6LlSHRnDiOWbZgDyjU4uOZTzurIr1yF0
 WtXCk54Y41896YGXmFrPkPklxg7CNmjMvQDxUutWze1lEB6xmS6n1f8paYqFFrEZHBAvhElTvPV
 0+TszNUtWQaecC+GeQ1C+TFVMnn45bqqdQ/YNczCv0k8ot3XkY7ldykek49JYfLeTq4gmXAAjII
 eqAMqRMmrh72BtfXRpUx9cYyXPbFQRTLDcKfUNZ58YhybyPlba0eiQrkQatcoEjfQYMvlqjXkPo
 uvOWHjS0xf/MBVVSVBbng/mU9rDuc+50SthZjKdGRMMjICe2WRRxzz2K9l/+btIOsoy8M/IPTIG
 XN9Up
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The HBLANK control was read-only, and always configured such
that the sensor HTS register was 3448. This limited the maximum
exposure time that could be achieved to around 1.26 secs.

Make HBLANK read/write so that the line time can be extended,
and thereby allow longer exposures (and slower frame rates).
Retain the overall HTS setting when changing modes rather than
resetting it to a default.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f98aad74fe584a18e2fe7126f92bf294762a54e3..970e6362d0ae3a9078daf337155e83d637bc1ca1 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -76,8 +76,10 @@
 
 #define IMX219_VBLANK_MIN		32
 
-/* HBLANK control - read only */
-#define IMX219_PPL_DEFAULT		3448
+/* HBLANK control range */
+#define IMX219_PPL_MIN			0x0d78
+#define IMX219_PPL_MAX			0x7ff0
+#define IMX219_REG_HTS			CCI_REG16(0x0162)
 
 #define IMX219_REG_LINE_LENGTH_A	CCI_REG16(0x0162)
 #define IMX219_REG_X_ADD_STA_A		CCI_REG16(0x0164)
@@ -422,6 +424,10 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		cci_write(imx219->regmap, IMX219_REG_VTS,
 			  format->height + ctrl->val, &ret);
 		break;
+	case V4L2_CID_HBLANK:
+		cci_write(imx219->regmap, IMX219_REG_HTS,
+			  format->width + ctrl->val, &ret);
+		break;
 	case V4L2_CID_TEST_PATTERN_RED:
 		cci_write(imx219->regmap, IMX219_REG_TESTP_RED,
 			  ctrl->val, &ret);
@@ -496,12 +502,10 @@ static int imx219_init_controls(struct imx219 *imx219)
 					   V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
 					   IMX219_VTS_MAX - mode->height, 1,
 					   mode->vts_def - mode->height);
-	hblank = IMX219_PPL_DEFAULT - mode->width;
+	hblank = IMX219_PPL_MIN - mode->width;
 	imx219->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
 					   V4L2_CID_HBLANK, hblank, hblank,
 					   1, hblank);
-	if (imx219->hblank)
-		imx219->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	exposure_max = mode->vts_def - 4;
 	exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
 		exposure_max : IMX219_EXPOSURE_DEFAULT;
@@ -817,6 +821,10 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 	unsigned int bin_h, bin_v;
+	u32 prev_hts;
+
+	format = v4l2_subdev_state_get_format(state, 0);
+	prev_hts = format->width + imx219->hblank->val;
 
 	mode = v4l2_find_nearest_size(supported_modes,
 				      ARRAY_SIZE(supported_modes),
@@ -824,8 +832,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 				      fmt->format.width, fmt->format.height);
 
 	imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
-
-	format = v4l2_subdev_state_get_format(state, 0);
 	*format = fmt->format;
 
 	/*
@@ -861,13 +867,18 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
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
+		hblank = prev_hts - mode->width;
+		__v4l2_ctrl_modify_range(imx219->hblank,
+					 IMX219_PPL_MIN - mode->width,
+					 IMX219_PPL_MAX - mode->width,
+					 1, IMX219_PPL_MIN - mode->width);
+		__v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
 	}
 
 	return 0;

-- 
2.47.0


