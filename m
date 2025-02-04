Return-Path: <linux-media+bounces-25614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CE9A26C66
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 08:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54C533A7546
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 07:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F976205E0B;
	Tue,  4 Feb 2025 07:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Pu64IzT5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77BC2046B1;
	Tue,  4 Feb 2025 07:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738652722; cv=none; b=GamS9vKHDBy/AXrKTUKc8tfjABfPP8/SltvCxcicPKyyaDAtY3pxPS8MtSM9wApfx6LKi5ss62LmATRdPbbMuPlOShYqJ7G33rVVKe7+5rLEwCJde+m0Y17fcmsrq7UxzYQCuLu9oYBuEVMWnig6ENQy3WLoufqGaBPpj+ekHD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738652722; c=relaxed/simple;
	bh=FMi9kfKdBsn02RX8aQTbnGRyvhmncFsH1pGkK4Gpvbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NINsN1X28kSKKxlgx5vlW5+kBaUqM/smN2ZlN8SNA77y5U/Vws8R9UOUwIZ/T40ats6XIIx0/k35hAvwP5Ie0hUzTu14UfMQjDYJ//OYE+fzjjZlBPDJWKC0s42zCNCqbW8+IEtj8OfbDPeu6/2YL4WO3YKJddlX4PNNMjDfBfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Pu64IzT5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:8839:be31:a1f6:6475:ef19:2df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A8BC1193;
	Tue,  4 Feb 2025 08:04:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738652647;
	bh=FMi9kfKdBsn02RX8aQTbnGRyvhmncFsH1pGkK4Gpvbk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Pu64IzT5mNxGZ2qJbde+csyNP9kmtivFcn8olB0FqudW90q6bbNEWOVd7LEOdaHd1
	 62zsK3vYzgCD4RQcX6Q4IDRQwlxHQgCqwuNNLfaJK+4HeCHnufT9WS8kwim/0wGArJ
	 dPvhwZ9yJeR8SHrJOabAC4N8lQtWlIIAhJ30dDYA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 04 Feb 2025 12:34:37 +0530
Subject: [PATCH v6 2/5] media: i2c: imx219: Rename VTS to FRM_LENGTH
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-imx219_fixes-v6-2-84ffa5030972@ideasonboard.com>
References: <20250204-imx219_fixes-v6-0-84ffa5030972@ideasonboard.com>
In-Reply-To: <20250204-imx219_fixes-v6-0-84ffa5030972@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnobwdVb+eOxOwZtIUFnygZr6p4isHUkJuPf518
 m/UZ4h1JDGJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ6G8HQAKCRBD3pH5JJpx
 Ran/EACYBvxx1m2X9XeejeMl8jB8z53N889oGQteDoSKHw67KUP6GLL/vFuq3a4xnWFLwQ76MR5
 NlVe1jzocRAtjx2luaJvHwf04z4FtnOCDv5L4abkmKRlVRieEba9ru3YDxD7rVT4F7rFui/bB7S
 4mKnZUbBH0j7/xXYQUzj33hdpnLfrHGVBVdEhT5lVFhwz64a6pwup4wD3b3k7gsLmuYL1TkldoK
 f8OFwAfZT7TaSzBZc/F+6IBhfk2AjOa5JtQvz+N5LrdG75kVk0ixygiqJXBsGFYKy7SYbUPJGO4
 dthjIHvBo8ZrRHL/UnUZ9yRoQfFAPBnVh6Zy6wUfsZs1qoeZxVIsADEfxNh7fpgEXkUUnO82HjE
 t9IUBTedItpfqLswgFUFDkwzfWEHDKH4nwxvKKydhX+XhGeFdFIo2V5r06iRz64i2m5vyDk2mKp
 VYTdVUbekokML0DffN91aCD2Il1lEN5qpAmKxllf7xJrPzbVMUP4ac/KbxCuAeJvCWPUU0ftQ+T
 FUfMUnNoyK4ib9E+F35O8/L1rtH+vF3KhqYz8pOgnUL8SKSVPrLG0IbReO/Je8o8sM7JofAr4CT
 MFouod9qGbELocmRJYR6yhylWmmTAK2TA2f2X7nci7Ww56PzB6tOimUkpYmP6D5sdeTu0IzTOuj
 MM2Dwd9RIwON/Cg==
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


