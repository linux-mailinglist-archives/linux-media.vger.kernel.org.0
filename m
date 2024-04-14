Return-Path: <linux-media+bounces-9261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDEF8A4527
	for <lists+linux-media@lfdr.de>; Sun, 14 Apr 2024 22:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5433280E68
	for <lists+linux-media@lfdr.de>; Sun, 14 Apr 2024 20:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BBF6137777;
	Sun, 14 Apr 2024 20:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="kufICm6k"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta86.mxroute.com (mail-108-mta86.mxroute.com [136.175.108.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF636136E3D
	for <linux-media@vger.kernel.org>; Sun, 14 Apr 2024 20:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713126981; cv=none; b=iQXgH4K1AbIwESxOsuSx1Mo4jB9EJsxzvtV9UvXNHgu1tBww5IOcjzeMptIL1363qco0oliQRfvB+oqc2mBx7XiN4Nj8BotKwMleE/zkEIiYbyq3ytcdQuL8kNVF60JV2aBuMdf6WPKz4dBLMlXnxhLpB5SJFnO1ysyRMmSwa54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713126981; c=relaxed/simple;
	bh=9/0nF003Ql8HbM5y65fn6urapdKEJgMJn0NzwQwpE1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mBv7wGIK25GpbuGgqMevkK8VZC0/W++ZUzIfIJMokp9458Cu+z8+sUcmcqrS0LRV14z/jp3HwKqQQ/vm6lzjjWGEGw7IGCcr7GU2tGKIVixX42ddmGWfaGcgiXKQGbLvgrRBS79n3Cq2CK3MnSzgO3YAnoRGWtoFFxfhiukJ6uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=kufICm6k; arc=none smtp.client-ip=136.175.108.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta86.mxroute.com (ZoneMTA) with ESMTPSA id 18ede5288c20003bea.011
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 14 Apr 2024 20:35:34 +0000
X-Zone-Loop: abbc5ecc39d872d58b13a8f8836183382bd092b64474
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KY72WP6mJ4oVW1C7qGXvNvIVblyKYOlCfH1Tv1iEZac=; b=kufICm6k3Kt/U/WYhQXxJTaSIk
	kvL6RpsuJVOwOBIk8++frU3ZoOz32J8zOipui28fsLysyMROBZ2UfwP6tULlJ+YmRCTbFqcbv5p5i
	K1twNkBkDa/xEcM0HIJNaW2RsCtqbWcfYMWH2U3id4OcORHRVLyh0JsCSjeaSBSXoKMoWp5i/4ZYU
	+2zQVuLOKXPZqrlk18dtwKdM8B8sIs2AHG7wkLI0Dv5zTUvyDf2HunY5YTy4wo3HX6UrAb2+rw1n6
	a1mdRZDIJdzOPUMMs0b5Wo634MSid+eZi8E0Xn/2pgzvbl932Q5nez+O2tLW5ZXSvnUkMQWkk4Mwf
	FECZ+Bng==;
From: git@luigi311.com
To: linux-media@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pavel@ucw.cz,
	phone-devel@vger.kernel.org,
	Luis Garcia <git@luigi311.com>
Subject: [PATCH v4 11/25] media: i2c: imx258: Add get_selection for pixel array information
Date: Sun, 14 Apr 2024 14:34:49 -0600
Message-ID: <20240414203503.18402-12-git@luigi311.com>
In-Reply-To: <20240414203503.18402-1-git@luigi311.com>
References: <20240414203503.18402-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Libcamera requires the cropping information for each mode, so
add this information to the driver.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Luis Garcia <git@luigi311.com>
---
 drivers/media/i2c/imx258.c | 90 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index ebc404b548b3..59a78a4cfe44 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -77,6 +77,14 @@
 #define REG_CONFIG_MIRROR_FLIP		0x03
 #define REG_CONFIG_FLIP_TEST_PATTERN	0x02
 
+/* IMX258 native and active pixel array size. */
+#define IMX258_NATIVE_WIDTH		4224U
+#define IMX258_NATIVE_HEIGHT		3192U
+#define IMX258_PIXEL_ARRAY_LEFT		8U
+#define IMX258_PIXEL_ARRAY_TOP		16U
+#define IMX258_PIXEL_ARRAY_WIDTH	4208U
+#define IMX258_PIXEL_ARRAY_HEIGHT	3120U
+
 struct imx258_reg {
 	u16 address;
 	u8 val;
@@ -116,6 +124,9 @@ struct imx258_mode {
 	u32 link_freq_index;
 	/* Default register values */
 	struct imx258_reg_list reg_list;
+
+	/* Analog crop rectangle */
+	struct v4l2_rect crop;
 };
 
 /*
@@ -560,6 +571,12 @@ static const struct imx258_mode supported_modes[] = {
 			.regs = mode_4208x3120_regs,
 		},
 		.link_freq_index = IMX258_LINK_FREQ_1267MBPS,
+		.crop = {
+			.left = IMX258_PIXEL_ARRAY_LEFT,
+			.top = IMX258_PIXEL_ARRAY_TOP,
+			.width = 4208,
+			.height = 3120,
+		},
 	},
 	{
 		.width = 2104,
@@ -571,6 +588,12 @@ static const struct imx258_mode supported_modes[] = {
 			.regs = mode_2104_1560_regs,
 		},
 		.link_freq_index = IMX258_LINK_FREQ_640MBPS,
+		.crop = {
+			.left = IMX258_PIXEL_ARRAY_LEFT,
+			.top = IMX258_PIXEL_ARRAY_TOP,
+			.width = 4208,
+			.height = 3120,
+		},
 	},
 	{
 		.width = 1048,
@@ -582,6 +605,12 @@ static const struct imx258_mode supported_modes[] = {
 			.regs = mode_1048_780_regs,
 		},
 		.link_freq_index = IMX258_LINK_FREQ_640MBPS,
+		.crop = {
+			.left = IMX258_PIXEL_ARRAY_LEFT,
+			.top = IMX258_PIXEL_ARRAY_TOP,
+			.width = 4208,
+			.height = 3120,
+		},
 	},
 };
 
@@ -698,6 +727,7 @@ static int imx258_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct v4l2_mbus_framefmt *try_fmt =
 		v4l2_subdev_state_get_format(fh->state, 0);
+	struct v4l2_rect *try_crop;
 
 	/* Initialize try_fmt */
 	try_fmt->width = supported_modes[0].width;
@@ -705,6 +735,13 @@ static int imx258_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	try_fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
 	try_fmt->field = V4L2_FIELD_NONE;
 
+	/* Initialize try_crop */
+	try_crop = v4l2_subdev_state_get_crop(fh->state, 0);
+	try_crop->left = IMX258_PIXEL_ARRAY_LEFT;
+	try_crop->top = IMX258_PIXEL_ARRAY_TOP;
+	try_crop->width = IMX258_PIXEL_ARRAY_WIDTH;
+	try_crop->height = IMX258_PIXEL_ARRAY_HEIGHT;
+
 	return 0;
 }
 
@@ -952,6 +989,58 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static const struct v4l2_rect *
+__imx258_get_pad_crop(struct imx258 *imx258,
+		      struct v4l2_subdev_state *sd_state,
+		      unsigned int pad, enum v4l2_subdev_format_whence which)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		return v4l2_subdev_state_get_crop(sd_state, pad);
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return &imx258->cur_mode->crop;
+	}
+
+	return NULL;
+}
+
+static int imx258_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP: {
+		struct imx258 *imx258 = to_imx258(sd);
+
+		mutex_lock(&imx258->mutex);
+		sel->r = *__imx258_get_pad_crop(imx258, sd_state, sel->pad,
+						sel->which);
+		mutex_unlock(&imx258->mutex);
+
+		return 0;
+	}
+
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = IMX258_NATIVE_WIDTH;
+		sel->r.height = IMX258_NATIVE_HEIGHT;
+
+		return 0;
+
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.left = IMX258_PIXEL_ARRAY_LEFT;
+		sel->r.top = IMX258_PIXEL_ARRAY_TOP;
+		sel->r.width = IMX258_PIXEL_ARRAY_WIDTH;
+		sel->r.height = IMX258_PIXEL_ARRAY_HEIGHT;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 /* Start streaming */
 static int imx258_start_streaming(struct imx258 *imx258)
 {
@@ -1128,6 +1217,7 @@ static const struct v4l2_subdev_pad_ops imx258_pad_ops = {
 	.get_fmt = imx258_get_pad_format,
 	.set_fmt = imx258_set_pad_format,
 	.enum_frame_size = imx258_enum_frame_size,
+	.get_selection = imx258_get_selection,
 };
 
 static const struct v4l2_subdev_ops imx258_subdev_ops = {
-- 
2.44.0


