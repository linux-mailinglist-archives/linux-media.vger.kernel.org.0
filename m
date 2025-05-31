Return-Path: <linux-media+bounces-33728-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51257AC9BBE
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 18:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2638D17D138
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 16:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3490A18A959;
	Sat, 31 May 2025 16:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0m+Lzwe"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FC53770B
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 16:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748709135; cv=none; b=mOYG52xFGTf6pumqnM6PHT2XrQNONSjp/TkOrRrvYRJ2Kb8xNnlNfwLWBsqwwA3LKclDw8ByI3ToWdfT+Zs/TMO8b9WhbMyltMou4Su7Ly4DvcDjBqzCU/kF++UwIXftQhXdyho/zIAzYgruVj71vw+/4PQYh6BHZgxjQ+PMInY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748709135; c=relaxed/simple;
	bh=NX9A/f7wtsiD+MejYBwX55+oRAsal/aia2mDKoA9Qd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sK0skv44RGAeI4REfuaJeiAOnrYvwOdcinRUJMYraVs8AbAefaloACsG/Djtgp7KF4bc9R+eLeVVMk3DS17mvaOFUHrUNtJH2fSqayc5ME/Qct0PsalWChMJ2MORAPQY6T4GuJgNUIi9yOoeoYBEHaaWHQIo9Bzl28O1mT8glOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0m+Lzwe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9673C4CEEE;
	Sat, 31 May 2025 16:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748709135;
	bh=NX9A/f7wtsiD+MejYBwX55+oRAsal/aia2mDKoA9Qd8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P0m+Lzwe2MGQJoYyhRxvyyG7j4UqIxdnbKGcIoCSzHrvU9hWv5rlByZSX8igHedu0
	 fFuzYm94o1Cnsf9D6hUGM0jgXjLi4TLd9OGZaWrPjCvTf67JUfAiiBCRd3tXeExwhB
	 daXa/fcXBL0yNlnP97T34H/uXT4z6dNHDbT8S+VL3yfoiP/+KHxkVNU00ItuL3KZ6i
	 VNT4MfQ1Vx/2yOrFRlCG8+3McgyQd8lj4V1RzgpwRiFoeHmTUeGIALYA3LCxM4ocLd
	 2zopTAEtoc2pkvHDTIcjjHPqwSL3kuBcEVH45cIpMh6ZAU/Cod/G48fTi3b66QZwVX
	 +pRdjwJjl80fQ==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mathis Foerst <mathis.foerst@mt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v2 09/12] media: mt9m114: Fix scaler bypass mode
Date: Sat, 31 May 2025 18:31:44 +0200
Message-ID: <20250531163148.83497-10-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250531163148.83497-1-hansg@kernel.org>
References: <20250531163148.83497-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As indicated by the comment in mt9m114_ifp_set_fmt():

	/* If the output format is RAW10, bypass the scaler. */
	if (format->code == MEDIA_BUS_FMT_SGRBG10_1X10)
		...

The intend of the driver is that the scalar is bypassed when the ISP
source/output pad's pixel-format is set to MEDIA_BUS_FMT_SGRBG10_1X10.

This patch makes 2 changes which are required to get this to work properly:

1. Set the MT9M114_CAM_OUTPUT_FORMAT_BT656_CROP_SCALE_DISABLE bit in
   the MT9M114_CAM_OUTPUT_FORMAT register.

2. Disable cropping/composing by setting crop and compose selections on
   the ISP sink/input format to the format widthxheight @ 0x0.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Changes in v2:
- When bypassing the scalar make ifp_get_selection() / ifp_set_selection()
  fill sel->r with a rectangle of (0,0)/wxh and return 0 instead of
  returning -EINVAL
---
 drivers/media/i2c/mt9m114.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 7a1451006cfe..d954f2be8f0d 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -467,7 +467,8 @@ static const struct mt9m114_format_info mt9m114_format_infos[] = {
 		/* Keep the format compatible with the IFP sink pad last. */
 		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
 		.output_format = MT9M114_CAM_OUTPUT_FORMAT_BAYER_FORMAT_RAWR10
-			| MT9M114_CAM_OUTPUT_FORMAT_FORMAT_BAYER,
+			| MT9M114_CAM_OUTPUT_FORMAT_FORMAT_BAYER
+			| MT9M114_CAM_OUTPUT_FORMAT_BT656_CROP_SCALE_DISABLE,
 		.flags = MT9M114_FMT_FLAG_PARALLEL | MT9M114_FMT_FLAG_CSI2,
 	}
 };
@@ -850,6 +851,7 @@ static int mt9m114_configure_ifp(struct mt9m114 *sensor,
 	const struct v4l2_mbus_framefmt *format;
 	const struct v4l2_rect *crop;
 	const struct v4l2_rect *compose;
+	unsigned int border;
 	u64 output_format;
 	int ret = 0;
 
@@ -869,10 +871,12 @@ static int mt9m114_configure_ifp(struct mt9m114 *sensor,
 	 * by demosaicing that are taken into account in the crop rectangle but
 	 * not in the hardware.
 	 */
+	border = (format->code == MEDIA_BUS_FMT_SGRBG10_1X10) ? 0 : 4;
+
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_XOFFSET,
-		  crop->left - 4, &ret);
+		  crop->left - border, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_YOFFSET,
-		  crop->top - 4, &ret);
+		  crop->top - border, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_WIDTH,
 		  crop->width, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_HEIGHT,
@@ -911,7 +915,8 @@ static int mt9m114_configure_ifp(struct mt9m114 *sensor,
 			   MT9M114_CAM_OUTPUT_FORMAT_BAYER_FORMAT_MASK |
 			   MT9M114_CAM_OUTPUT_FORMAT_FORMAT_MASK |
 			   MT9M114_CAM_OUTPUT_FORMAT_SWAP_BYTES |
-			   MT9M114_CAM_OUTPUT_FORMAT_SWAP_RED_BLUE);
+			   MT9M114_CAM_OUTPUT_FORMAT_SWAP_RED_BLUE |
+			   MT9M114_CAM_OUTPUT_FORMAT_BT656_CROP_SCALE_DISABLE);
 	output_format |= info->output_format;
 
 	cci_write(sensor->regmap, MT9M114_CAM_OUTPUT_FORMAT,
@@ -1810,6 +1815,7 @@ static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
 {
 	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
 	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *crop;
 
 	format = v4l2_subdev_state_get_format(state, fmt->pad);
 
@@ -1830,8 +1836,15 @@ static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
 		format->code = info->code;
 
 		/* If the output format is RAW10, bypass the scaler. */
-		if (format->code == MEDIA_BUS_FMT_SGRBG10_1X10)
+		if (format->code == MEDIA_BUS_FMT_SGRBG10_1X10) {
 			*format = *v4l2_subdev_state_get_format(state, 0);
+			crop = v4l2_subdev_state_get_crop(state, 0);
+			crop->left = 0;
+			crop->top = 0;
+			crop->width = format->width;
+			crop->height = format->height;
+			*v4l2_subdev_state_get_compose(state, 0) = *crop;
+		}
 	}
 
 	fmt->format = *format;
@@ -1851,6 +1864,12 @@ static int mt9m114_ifp_get_selection(struct v4l2_subdev *sd,
 	if (sel->pad != 0)
 		return -EINVAL;
 
+	/* Crop and compose cannot be changed when bypassing the scaler */
+	if (v4l2_subdev_state_get_format(state, 1)->code == MEDIA_BUS_FMT_SGRBG10_1X10) {
+		sel->r = *v4l2_subdev_state_get_crop(state, 0);
+		return 0;
+	}
+
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
 		sel->r = *v4l2_subdev_state_get_crop(state, 0);
@@ -1911,6 +1930,12 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
 	if (sel->pad != 0)
 		return -EINVAL;
 
+	/* Crop and compose cannot be changed when bypassing the scaler */
+	if (v4l2_subdev_state_get_format(state, 1)->code == MEDIA_BUS_FMT_SGRBG10_1X10) {
+		sel->r = *v4l2_subdev_state_get_crop(state, 0);
+		return 0;
+	}
+
 	format = v4l2_subdev_state_get_format(state, 0);
 	crop = v4l2_subdev_state_get_crop(state, 0);
 	compose = v4l2_subdev_state_get_compose(state, 0);
-- 
2.49.0


