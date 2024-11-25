Return-Path: <linux-media+bounces-22016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 035299D88CC
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 16:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B09CF28BFED
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 15:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31BA1B4150;
	Mon, 25 Nov 2024 15:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Bu/U8Bbf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47271B3949;
	Mon, 25 Nov 2024 15:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732547242; cv=none; b=B/9nqGtbpGnuER4lPui67Mk73Ap0Xqehjz8HTh/CQVf1702L5ow48JzCFMH+C7fmamrfz0cohhpop2q0/pEfIbSc6+iFWW0vAWAbTKQaKzSd+EypgmghgaNwbBpSBlEilcZe89f682ferRt9sMYe9gLAHkcZwVE00YeMk94PDmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732547242; c=relaxed/simple;
	bh=FSYYhUiGRYV2D6HVG9VVs0ICSoCkSR10pJa8IEKTvYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IcespEbQ8tT4UwHLwkoR3u1cJVCIjN4/sbz3TCMkGcRaNdTqEYuoeRbYK1dl0O2LDy4MRJkLCvB+h5AoDyrFnM4iiy4sYjP4JeKmYOHDYXxVqzK/bN79As0+ZzydDCE/dZ9j8BToOMshWp755uQpNBA0c6doCnyPteIwJX41L2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Bu/U8Bbf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:883a:fbdb:56c3:2e5a:271e:2a92])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5869A6B5;
	Mon, 25 Nov 2024 16:06:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732547217;
	bh=FSYYhUiGRYV2D6HVG9VVs0ICSoCkSR10pJa8IEKTvYU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Bu/U8BbfLUZLLgrFIjDeKTYFWW6e5OuYVRyxJqRtxP0hf9twUGYeSZu31nrZsFped
	 2rBBtHKrWfTR18eXmJ3EgkchDsbBU6wnaK/mveqU+58ygnP+fZTS1aMYAM2lWbEw5I
	 zTidTOibE2kTdmHfMo8CkH4QMf64L5qnc4HY+Z0Y=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 25 Nov 2024 20:36:26 +0530
Subject: [PATCH v3 2/3] media: i2c: imx219: make HBLANK r/w to allow longer
 exposures
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-imx219_fixes-v3-2-434fc0b541c8@ideasonboard.com>
References: <20241125-imx219_fixes-v3-0-434fc0b541c8@ideasonboard.com>
In-Reply-To: <20241125-imx219_fixes-v3-0-434fc0b541c8@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4074;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=/McndCobi0rteU1aA7pbQyLlYRSTH8TmxfP/vtIS8+E=;
 b=kA0DAAgBQ96R+SSacUUByyZiAGdEkpOhDlirYOOcJ4W4pDIzJfIDYe1KnSZeL+rIIwZTuxMQV
 YkCMwQAAQgAHRYhBE3g2Bjl1XXo1FqvxUPekfkkmnFFBQJnRJKTAAoJEEPekfkkmnFFhi0P/irV
 DQk5fadp3KNfUFQrzsBWsrjXVdchRR7imXGNSIGYAxf/XDCblvoFRDFly14oJCd+3ANXxtm2kcX
 BJGNS0tfjif1CsXp/zqlom3T9NveOGjRtspBgm8Z9uJcUOjytTkOaAA8bie8Pho/iDhfFRYe2gj
 9xo2OLUBbKfT1kuMsBi7bx4jJpMsLH61RLqw5UJbTteE+IJMW15wiWuVJLMUR+0ZatiXhZ7fO95
 2AA6RTHWoFGkSlLCM66Bz7vxkDbgEsLGcRqCMtzMY2Y7PhhwfwSJGfIOSmxMD/pUG9L5WINT8wI
 KcMXtLlJNdJr5W1O5pKDnw+uD5KslR0TuKUG1fw+G9+9oe82Pd52bEZKRtfUUtpvpqAZRi5PPC+
 z52ELNX9mDlb/xFVDAv06Ykx4FJ/f6NQBLlVhdNTdZh+MlbOu5qkcyyWqr/0QIXa+14UMpTUfpq
 mSXEBVDsOlS+sPT/QDwubuub+1/JIQfg1hQjTw78AQCN9j4bacTivwmbTLtX3NgKYe4NbNcGAQp
 8BdKlktvqiFGkSabP3y8Nz+Eila2+dIiI4zdsrH1uKnfIT42ai0q/hhjM+XPuEy84pQnB1sntxL
 JFNc/yNcbBYiJVTQi+TPebgvQnoiklPkJ2u0TUEz4XiDN4a7rihPZNvXzcwrp760QS8luD7b6Vt
 XjSvV
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
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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


