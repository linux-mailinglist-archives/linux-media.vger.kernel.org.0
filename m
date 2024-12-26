Return-Path: <linux-media+bounces-24097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF799FC981
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 08:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54758163197
	for <lists+linux-media@lfdr.de>; Thu, 26 Dec 2024 07:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35FA1D45EA;
	Thu, 26 Dec 2024 07:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="etTOvFku"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A627170A1A;
	Thu, 26 Dec 2024 07:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735199453; cv=none; b=NTnji9qoMhNpc/8nEmNnmyZLceKvfjHSHJVX18/GUvp4NaImfn28/sdiw0xAUYhQv041mqU1wzwB02EyQZmEAfxX57dU3L9PaHy6YbUj+Q6px/KSQY/Jb5xdFjE5WHLhB17DVO8H425hMydJJHvr9JKY5HjOzzjNTsP7wVQDnOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735199453; c=relaxed/simple;
	bh=l8pRiF06P9+gNCp/60PThg5USXY2PQRXtqUeRkCzLVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k5eBG+HXS/DzaIOl4oR6jS7VLUoHcp4xawKoeSe3wUx09ijFdcDV18feUJHkMmYvXLju6ZLEqP4jZUpKsrU0qKv53QGuS6l+EKWiR5YJir/W8gW0RXUG3T4sHlZb9UysRkWDpAIIBeQyv9O50bAjFF4PkpGpXBlDgqRc6gJ6hHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=etTOvFku; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:416f:6c:4037:639a:e90f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BEF49FF;
	Thu, 26 Dec 2024 08:50:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735199406;
	bh=l8pRiF06P9+gNCp/60PThg5USXY2PQRXtqUeRkCzLVo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=etTOvFkuz0dKB9KsU14nYmetMflol7N+LyEArq7uGct4PG6bKU289zaPdE64i3y2g
	 EVLOJwdGDOLAloEhSioNXzYt4CZqsyYEW31t1/BX//+i2t9aqVNuGYYr4DgE+qUfGX
	 apHcGjK0DT0tGvSv4kypKYvvquL/kD9DwO1mTWJI=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 26 Dec 2024 13:19:35 +0530
Subject: [PATCH v4 3/5] media: i2c: imx219: make HBLANK r/w to allow longer
 exposures
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241226-imx219_fixes-v4-3-dd28383f06f7@ideasonboard.com>
References: <20241226-imx219_fixes-v4-0-dd28383f06f7@ideasonboard.com>
In-Reply-To: <20241226-imx219_fixes-v4-0-dd28383f06f7@ideasonboard.com>
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
 bh=N/aj8QO3pgzkAlcQ85YfmhL0md4CJuiv8c96ULXE/+M=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnbQrCGTbYLw7l6a0fQP38j9ZicZf40Wfqsi/pA
 0BL+ObzOoiJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ20KwgAKCRBD3pH5JJpx
 RWEKD/9vHWCVAUVIK6e+QYCb9O2VF2STxjW8xTceMFBrBcWG91n6bWXnmWWdM9TZ88snxgAW4Qh
 i8IYsWH1IiZa1wOjUEjriDfQi+NnSYaKcWxmsY6HRZiF0iG+tLZHMzwe6SW0YUZ+FrOiva/fm/V
 Ybbn9BvYysqvsEdsTvLkxRJ3GJ0mvvhihaVAylT5u2qVFRm0vlHkzu9IokXAt8DI6L1JiDk4E6H
 KJKUX0EZokRuSe5/j0wnst2QYWMu5wrj5zVfer5NDVOsUW2vDQd5faY2qPx2/DaONI38+2kwYgd
 wA1LKwrR0eUBJnkj+R/nUVJNByPKtw3+NcNZ+5EFOzez2nQLkT7c8PUFI0U+8MII4TggxJ4WMN4
 QH8xLBuS8mneBJq5yUA/5hLiq7KiGo2R5kOXgIbPYOyhnx6OID317A82Sgx6BIjYNO76ShCcSVV
 J0SokngetzwXGvpFrRsjtWZ7FmpXsJSnyDNnSfzOWYmWDEdMIwt+cCoayaV7zV6qnuaTJ5GyElG
 XOeoG+e0jGkgTHxMikjN/IRQSIPzfN6tyZLi00TEijJMspqVaNjnykIHKbkyK54jj1bRTPOijL3
 QT827qvt0i6aLw37aZnoZ57t7CvDGKIXOBpIgiI6IuQ/mP+JzdOTpX4UaRYyY4bodlIqrHVO7N+
 vpRr7m+0xTwohoA==
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
index 6c4a72d88cdd2bdd05f2273786110c9f2818e44f..84681e5da3e238905139fe174e9ee3cfe5fa0246 100644
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
 					   mode->vts_def - mode->height);
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
 	exposure_max = mode->vts_def - 4;
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


