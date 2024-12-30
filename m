Return-Path: <linux-media+bounces-24151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9AF9FE2D8
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 07:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 402551881E20
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 06:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5182519CC02;
	Mon, 30 Dec 2024 06:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f8NVcU+q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D55719C546;
	Mon, 30 Dec 2024 06:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735539129; cv=none; b=ULqbSyZEdgiwg6/vzKBJ481cl4n9dEffe7iuFHr8PpSrtivebalNoiIGEhKofgJOL3XSdNFMEwZLa7K75ULmXJMgBN2nM2TWem/OgeZMKzhd6lEUwP1tWJFU8C/RKJ+aLyLbqcFXexhxUag26nNIyMCYd2bA5vlRkNCIeLsbOLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735539129; c=relaxed/simple;
	bh=IENB0nUvzRyRVKBYXng5EyAoZcEesCtDNNIx0/27H4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AbuDm7+B8b0LcoteEBzj7gkwivLLqI8Aml5SbGw7hCR12DT+O7zrR2vzw7cSYOZZdtZ8NpZCAPRzqnz+4rKWPmfGCzMvq4ab6cLHc4MXYNMFgBCdK+OkFj8eNv/NDkYmisKIFqGAoBU66LCCPwIOR9/LwIu3U+eTVAAU+9bbHtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f8NVcU+q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.82.226])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7C493DC;
	Mon, 30 Dec 2024 07:11:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735539080;
	bh=IENB0nUvzRyRVKBYXng5EyAoZcEesCtDNNIx0/27H4A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f8NVcU+qIpJV0YKsh73ng6LX1GP+tmstdGAXUuaeqGmBQiKsD0zK+9nHx4W27wjWh
	 ubl5sKDsME3/3dKybs7I4qyHuqGdaYl3qPNwdx5gn4UOZhCAlABcDT9mgK6eeT6PsN
	 1+OCvdPQQhsv4ggoVU7YIxn51mw0k0keVC6K8K/w=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 30 Dec 2024 11:41:19 +0530
Subject: [PATCH v5 2/5] media: i2c: imx219: Rename VTS to FRM_LENGTH
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-imx219_fixes-v5-2-98446d816489@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3675;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=IENB0nUvzRyRVKBYXng5EyAoZcEesCtDNNIx0/27H4A=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBncjmKCEIMIUqZR20vY8jtFmPaj7x23T5RFnmgd
 N8NSp1P/0aJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ3I5igAKCRBD3pH5JJpx
 RVHvEACvBg/FeJjmh0unfbJ2ELHXM+UcJCV2oA2Fvy9PU+gfqhSFdK1YWAYNZxCSo49D05PovIs
 MM8AmSmz20yV0dY1Jl+G4J+Lj5p19PT1/4xBOgN/EHkkI+9cG0WIeHwDa0PB68onuenINWKTeWQ
 0KjfUEZJF6tL3vrTNd/SdJDkQHVmI/Ja0VeGjhnR6xW6YiIHEjB9xM+zGSqPJdfVQfGBOhFVPaH
 BNwVklyvGyeqYOUQVcNeCZ6MVzPr76jOLhjfW3Pezfi7UIAIGOQ48GqErE52plP9KheTClxAniL
 p+zFYciCTzOAkdtU7FaLtlbYqQ77EAVoiFDP1fyFpbdCNt9KzXq8iZtRiZkiW/4LfQCyVuEqTLz
 po7ZEusngb126lFn6l26aX6sPZnj/9yz9rlhwLaxheyNgzPzcUgYuN8R1ozxLaRBXQPF6NFtMZE
 7yvwNqhD8x2Eq8Gjddcr2pigQ0M6kBoM+gQXXIxJ/5pn9Tb6REf2i8TUDCqEq4KyrH2cj1kc7dG
 Nm5Rq3Yyn17cOtLFvroDUgo1W85O8s4Sy41O5m6MDEKSlvEwhTMZ4DoI7RFAn1LIDsaEAEi7sPm
 HqZsGpv9w3QgY6TdAAv/dYTWd1VHrAf5p/tgrRJbbjenTWm6cn11iFgns2vhc6liEV3nw3MyseA
 /pwmmKnbViRYueg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The IMX219 datasheet uses the terms FRM_LENGTH and LINE_LENGTH instead
of VTS/HTS.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 0486bbc046cb9c36afd911eb799c1b010a01d496..8565b1b030be2ee24bcc37415e99ee4ef83cc683 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -70,9 +70,8 @@
 #define IMX219_EXPOSURE_MAX		65535
 
 /* V_TIMING internal */
-#define IMX219_REG_VTS			CCI_REG16(0x0160)
-#define IMX219_VTS_MAX			0xffff
-
+#define IMX219_REG_FRM_LENGTH		CCI_REG16(0x0160)
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
+		cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH,
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
2.47.1


