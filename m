Return-Path: <linux-media+bounces-26215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D86E2A384A3
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 14:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C51B1670C1
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 13:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2833621CA05;
	Mon, 17 Feb 2025 13:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B7uRyyz3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A4621C9EF;
	Mon, 17 Feb 2025 13:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739798907; cv=none; b=ZYtX90CTT6WV1pNqIDcDAylOgOZU+n2nwzGyty4izwhjjLKgIEVrNuDK2UhZB5ZPzglWT5dfGQ0oAaZQAoadMG9PIue7jKb4YH0f3nCoYMmBMr+8Xhoy086nF/d3o4FKqqPJUTZgRnaPiB+DOdha1hORfNmpYeq2cttwJvJ3Ghs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739798907; c=relaxed/simple;
	bh=FMi9kfKdBsn02RX8aQTbnGRyvhmncFsH1pGkK4Gpvbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HciTbspp4xFvAdLFS5hsdiqDVbWgHOdd6fKWVV9qd2KpswuQ/ILgMYVtHLhE7ddCkP2l1AH7nc91v8mVoSGLesZ0NshVuvUYAZTYs7b9gK3MB/yPoxHZgsbCN01obumyOdlMQ3cPSQ0lt/4aV3mv3xbG4bsSh3B3Rt3d7GEkKX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B7uRyyz3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.80.185])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90E5FD53;
	Mon, 17 Feb 2025 14:27:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739798823;
	bh=FMi9kfKdBsn02RX8aQTbnGRyvhmncFsH1pGkK4Gpvbk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B7uRyyz3HHxOJj4bNEQ55bjjyZbivvYIrmPTtkbPNxKqdTISsm/vdKAnA8fIT0+Hs
	 k91cbdzuksM84utY109QxvzgkoZ8kOqR6c1aF3PCGea9uxjVeMZygf8T9Zq+mxPaN9
	 5S9JJnn2b5A7+Gw/9KsSSBh/HqVRaKFI9h6e6PYM=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 17 Feb 2025 18:57:32 +0530
Subject: [PATCH v7 2/5] media: i2c: imx219: Rename VTS to FRM_LENGTH
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-imx219_fixes-v7-2-83c3c63b737e@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3750;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=FMi9kfKdBsn02RX8aQTbnGRyvhmncFsH1pGkK4Gpvbk=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnszlLiOPVrCZMoDe5aLBno9QYhOzs0sm5H3CXh
 kUec22erp6JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ7M5SwAKCRBD3pH5JJpx
 RarpEACCMGyvUhs5VttcpE2EPFHk5cU/dU4O8oT7ZHtijafVttrie59Cvk7ykoUlc1+3qGSne4k
 mwQoGED8WYfHC090bS8KSPdVuK78b3njgIKIQPLBp5AbSwH+v5OAfIHl7HxsQB/91FxCMz+1UWD
 HiTbQ10wUYJKt+3Pk9pS19bAtZQggyrwIt0Kg3E1vkRwLOC0mMLcmSaYnTB0rbGCkdyCMRCYJgA
 f+K4kAtVEz++2L32gTpDMNFoNz44dbfYMQHHa6r50/GMAf4UU1RN+D/7g07mfG57tpQIZomWhgP
 Cps3jdQv+BDqdm5jkqQAig2+Wp3TXnUBip5n1O35d7nXupLW2MVxYUJgrkEg8KnInlw1xJcuwp6
 WbbHAfgWuRjstaT9yOStkIxTCYGzznhY4qmmiKwFqCoqFbs98Kvkm2xHCsqb5lLZRRox0J/ylCX
 GcmfHR3/DVsx+9EVU5zVglMX8Y5UuiyVHc1563yZiLG4gMkhftERDfdfbLemjaTCg4p1hbO+8kM
 Fy7ur9kL9+VlToaoG9EzfeDZTUow6mCBHb25wlYXkr7LNmkbhUYrLRYYe8ot66KakcKL5qVz4tN
 +8LoPcYEG6nJOjyAnAsoOpHMImKLD5k+Lc7fmLUlBIPOl70CBpSdhW6QmR+mP+ugeYAkYWPRtcs
 sKsraROl5AxBBAQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The IMX219 datasheet refers to the vertical length + blanking as
FRM_LENGTH instead of VTS.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 0486bbc046cb9c36afd911eb799c1b010a01d496..66460a179e8a9fc1f1216f6beffce4bcd35ff6aa 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -70,9 +70,8 @@
 #define IMX219_EXPOSURE_MAX		65535
 
 /* V_TIMING internal */
-#define IMX219_REG_VTS			CCI_REG16(0x0160)
-#define IMX219_VTS_MAX			0xffff
-
+#define IMX219_REG_FRM_LENGTH_A		CCI_REG16(0x0160)
+#define IMX219_FLL_MAX			0xffff
 #define IMX219_VBLANK_MIN		32
 
 /* HBLANK control - read only */
@@ -154,7 +153,7 @@ struct imx219_mode {
 	unsigned int height;
 
 	/* V-timing */
-	unsigned int vts_def;
+	unsigned int fll_def;
 };
 
 static const struct cci_reg_sequence imx219_common_regs[] = {
@@ -289,25 +288,25 @@ static const struct imx219_mode supported_modes[] = {
 		/* 8MPix 15fps mode */
 		.width = 3280,
 		.height = 2464,
-		.vts_def = 3526,
+		.fll_def = 3526,
 	},
 	{
 		/* 1080P 30fps cropped */
 		.width = 1920,
 		.height = 1080,
-		.vts_def = 1763,
+		.fll_def = 1763,
 	},
 	{
 		/* 2x2 binned 30fps mode */
 		.width = 1640,
 		.height = 1232,
-		.vts_def = 1763,
+		.fll_def = 1763,
 	},
 	{
 		/* 640x480 30fps mode */
 		.width = 640,
 		.height = 480,
-		.vts_def = 1763,
+		.fll_def = 1763,
 	},
 };
 
@@ -418,7 +417,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 			  imx219->hflip->val | imx219->vflip->val << 1, &ret);
 		break;
 	case V4L2_CID_VBLANK:
-		cci_write(imx219->regmap, IMX219_REG_VTS,
+		cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,
 			  format->height + ctrl->val, &ret);
 		break;
 	case V4L2_CID_TEST_PATTERN_RED:
@@ -493,15 +492,15 @@ static int imx219_init_controls(struct imx219 *imx219)
 	/* Initial vblank/hblank/exposure parameters based on current mode */
 	imx219->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
 					   V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
-					   IMX219_VTS_MAX - mode->height, 1,
-					   mode->vts_def - mode->height);
+					   IMX219_FLL_MAX - mode->height, 1,
+					   mode->fll_def - mode->height);
 	hblank = IMX219_PPL_DEFAULT - mode->width;
 	imx219->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
 					   V4L2_CID_HBLANK, hblank, hblank,
 					   1, hblank);
 	if (imx219->hblank)
 		imx219->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-	exposure_max = mode->vts_def - 4;
+	exposure_max = mode->fll_def - 4;
 	exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
 		exposure_max : IMX219_EXPOSURE_DEFAULT;
 	imx219->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
@@ -847,12 +846,12 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 
 		/* Update limits and set FPS to default */
 		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
-					 IMX219_VTS_MAX - mode->height, 1,
-					 mode->vts_def - mode->height);
+					 IMX219_FLL_MAX - mode->height, 1,
+					 mode->fll_def - mode->height);
 		__v4l2_ctrl_s_ctrl(imx219->vblank,
-				   mode->vts_def - mode->height);
+				   mode->fll_def - mode->height);
 		/* Update max exposure while meeting expected vblanking */
-		exposure_max = mode->vts_def - 4;
+		exposure_max = mode->fll_def - 4;
 		exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
 			exposure_max : IMX219_EXPOSURE_DEFAULT;
 		__v4l2_ctrl_modify_range(imx219->exposure,

-- 
2.48.1


