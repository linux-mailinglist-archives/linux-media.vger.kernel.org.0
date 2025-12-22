Return-Path: <linux-media+bounces-49296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D029DCD4F88
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0A7430213E7
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2477930E0D3;
	Mon, 22 Dec 2025 08:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RHDxoPN3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D0530C379;
	Mon, 22 Dec 2025 08:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391414; cv=none; b=Whaa0jV2vGCd+PAODCE5mcPb2bT1PeEovnsRVKXl2FyTVBX1nUNbOu/bfeNgdAyKuUO32HhL0TV6Fany32AZ8VreoaWnSo5JqmO9wcBihwWf0kdogWEcrSOOKHdqHw+o2hsmYpsfZDkAVmOID3UaYwvysDU1sZsAn3vex1EIzEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391414; c=relaxed/simple;
	bh=wnnCkem1OSlj+Pno+tjD48rUSdzA68L6Bk+t/AUAofM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iTNnwBpDyTi5qnz/T8S89tUGOxf0f1Xy3GgDFBe9xAU8RsESUDRSA8sR6oh/ysIU/kGXw6krrw2MkdRSwItIhHZzOl8zoCDk1b2ouV01obGrIQdEFypXtTkVYwIDReox82IcuG/eeUEoPMxMJZ2OZpE9Ac0O+wrZS7y52k7v8+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RHDxoPN3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:aa51:d08b:9316:9524:9005])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D362B3C8;
	Mon, 22 Dec 2025 09:16:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766391401;
	bh=wnnCkem1OSlj+Pno+tjD48rUSdzA68L6Bk+t/AUAofM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RHDxoPN397RTZ1AYpzvsAZYiVflMdiSm4CAjlYLGY7Tv6Ow3p9+gcsGmr6oCFnNwc
	 h1RQNGlC5EOALvQrliu1H+jaT6xzl2gg0yVhaqazdpTT7lZA9PoKpjwJ7a/zvG2Gba
	 QhQ3XTZEXKVhqkkIymY+yXKf0pjpVp98oSMZsKOs=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 22 Dec 2025 13:45:34 +0530
Subject: [PATCH v4 10/17] media: i2c: ov5647: Support HFLIP and VFLIP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-b4-rpi-ov5647-v4-10-b949c7309280@ideasonboard.com>
References: <20251222-b4-rpi-ov5647-v4-0-b949c7309280@ideasonboard.com>
In-Reply-To: <20251222-b4-rpi-ov5647-v4-0-b949c7309280@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Naushir Patuck <naush@raspberrypi.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6914;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=tmGEBTfuPtECtGCcRf4q5iuxdNx+EaoRPI/3jfruZJ0=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpSP4qVaPFhaBsRwbXbKui6xU2zVVNkt2dFKfhl
 iEZ38ugA86JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaUj+KgAKCRBD3pH5JJpx
 Rdj5EACMIqAeGBCtxnTr9uAMmsbPFGCQmxi8uct1vi+bkPJI5HI3EgQnCZnh4CoCMAWqFk/ecDk
 RRkgQ7L/V7kft1WN28tssLQcWs5nXEmsBGOsjtSpEojFPOCB+fTPfEoGJrrTLv8UoWl6WobB5go
 gnx1NdJR8uG2/zAgFkHs3YYTeXnGX7xWe1CBWlC4ho47MOwpec0C3++kKuX0joM3vkYJt4wbCoB
 9QVk+7ZilfSLHfgV3SBaLMru8ZNm2nfdtNj7yKRVmsGxi91qXkmDh8Qcll7TkC8jAWmtiSdQhnX
 pbwRZbDLzmzVymbIvaj1xw4YAGlBHiE6Y27klZArzppNUAlR/GIrQov1M9ypdXUtyLU7Vk45lf+
 QVsJ49WwAPOdvdb8I3bqogTjGSAmjyc80abJ+r7J3AA549b3q5C8B7RBmyt9pNa3t8/Ojz/3/iB
 hSKDvqgNDO+Zak4B+54o7344Oq4/9nYQM2C+sNw1Z/pBDZjCPoLEw1lmluRwSwsiz4p2y36U4OG
 JbkK+rcptNB0ujgbUrPVpr+gJM1w17cet//OW6WixCibPPQzDCgtWz/HZ+QgE1W/Okv4o765wVW
 eAfdQRt+BKdHICSWgRrGV15E+yQR2agpuv+dSd6HbJ+BvbqQ6rKCH4qozBCqzGgp0xSTB5oCY7J
 YbN6ttN20XABfwQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: David Plowman <david.plowman@raspberrypi.com>

Add missing controls for horizontal and vertical flipping.

The sensor readout mirrors in the horizontal direction by default (if
0x3821[1] = 0) which can make things unnecessarily difficult for
applications. The register table prior to this commit was setting that
bit explicitly, to achieve a normally oriented image.

Now that we have userspace controls for HFLIP, we keep the convention
and report the non-mirrored image (with 0x3821[1] = 1) as
horizontal_flip=0, and vice versa.

Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Co-developed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 81 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 74 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 6f07cac12c6c157e1b20abe000f95de82abd877a..5bb80b943c8b5b922bd74e3c185c5e88f4f1a671 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -55,6 +55,8 @@
 #define OV5647_REG_GAIN_LO		0x350b
 #define OV5647_REG_VTS_HI		0x380e
 #define OV5647_REG_VTS_LO		0x380f
+#define OV5647_REG_TIMING_TC_V		0x3820
+#define OV5647_REG_TIMING_TC_H		0x3821
 #define OV5647_REG_FRAME_OFF_NUMBER	0x4202
 #define OV5647_REG_MIPI_CTRL00		0x4800
 #define OV5647_REG_MIPI_CTRL14		0x4814
@@ -120,6 +122,8 @@ struct ov5647 {
 	struct v4l2_ctrl		*hblank;
 	struct v4l2_ctrl		*vblank;
 	struct v4l2_ctrl		*exposure;
+	struct v4l2_ctrl		*hflip;
+	struct v4l2_ctrl		*vflip;
 };
 
 static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
@@ -161,7 +165,7 @@ static struct regval_list ov5647_2592x1944_10bpp[] = {
 	{0x3036, 0x69},
 	{0x303c, 0x11},
 	{0x3106, 0xf5},
-	{0x3821, 0x06},
+	{0x3821, 0x02},
 	{0x3820, 0x00},
 	{0x3827, 0xec},
 	{0x370c, 0x03},
@@ -250,7 +254,7 @@ static struct regval_list ov5647_1080p30_10bpp[] = {
 	{0x3036, 0x62},
 	{0x303c, 0x11},
 	{0x3106, 0xf5},
-	{0x3821, 0x06},
+	{0x3821, 0x02},
 	{0x3820, 0x00},
 	{0x3827, 0xec},
 	{0x370c, 0x03},
@@ -414,7 +418,7 @@ static struct regval_list ov5647_2x2binned_10bpp[] = {
 	{0x4800, 0x24},
 	{0x3503, 0x03},
 	{0x3820, 0x41},
-	{0x3821, 0x07},
+	{0x3821, 0x03},
 	{0x350a, 0x00},
 	{0x350b, 0x10},
 	{0x3500, 0x00},
@@ -430,7 +434,7 @@ static struct regval_list ov5647_640x480_10bpp[] = {
 	{0x3035, 0x11},
 	{0x3036, 0x46},
 	{0x303c, 0x11},
-	{0x3821, 0x07},
+	{0x3821, 0x03},
 	{0x3820, 0x41},
 	{0x370c, 0x03},
 	{0x3612, 0x59},
@@ -956,6 +960,26 @@ static const struct v4l2_subdev_video_ops ov5647_subdev_video_ops = {
 	.s_stream =		ov5647_s_stream,
 };
 
+/*
+ * This function returns the mbus code for the current settings of the HFLIP
+ * and VFLIP controls.
+ */
+static u32 ov5647_get_mbus_code(struct v4l2_subdev *sd)
+{
+	struct ov5647 *sensor = to_sensor(sd);
+	/* The control values are only 0 or 1. */
+	int index =  sensor->hflip->val | (sensor->vflip->val << 1);
+
+	static const u32 codes[4] = {
+		MEDIA_BUS_FMT_SGBRG10_1X10,
+		MEDIA_BUS_FMT_SBGGR10_1X10,
+		MEDIA_BUS_FMT_SRGGB10_1X10,
+		MEDIA_BUS_FMT_SGRBG10_1X10
+	};
+
+	return codes[index];
+}
+
 static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -963,7 +987,7 @@ static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	code->code = ov5647_get_mbus_code(sd);
 
 	return 0;
 }
@@ -974,7 +998,7 @@ static int ov5647_enum_frame_size(struct v4l2_subdev *sd,
 {
 	const struct v4l2_mbus_framefmt *fmt;
 
-	if (fse->code != MEDIA_BUS_FMT_SBGGR10_1X10 ||
+	if (fse->code != ov5647_get_mbus_code(sd) ||
 	    fse->index >= ARRAY_SIZE(ov5647_modes))
 		return -EINVAL;
 
@@ -1007,6 +1031,8 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
 	}
 
 	*fmt = *sensor_format;
+	/* The code we pass back must reflect the current h/vflips. */
+	fmt->code = ov5647_get_mbus_code(sd);
 	mutex_unlock(&sensor->lock);
 
 	return 0;
@@ -1054,6 +1080,8 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 					 exposure_def);
 	}
 	*fmt = mode->format;
+	/* The code we pass back must reflect the current h/vflips. */
+	fmt->code = ov5647_get_mbus_code(sd);
 	mutex_unlock(&sensor->lock);
 
 	return 0;
@@ -1229,6 +1257,31 @@ static int ov5647_s_exposure(struct v4l2_subdev *sd, u32 val)
 	return ov5647_write(sd, OV5647_REG_EXP_LO, (val & 0xf) << 4);
 }
 
+static int ov5647_s_flip(struct v4l2_subdev *sd, u16 reg, u32 ctrl_val)
+{
+	u8 reg_val;
+	int ret;
+
+	/*
+	 * TIMING TC REG20 (Vertical) and REG21 (Horizontal):
+	 * - [2]:	ISP mirror/flip
+	 * - [1]:	Sensor mirror/flip
+	 *
+	 * We only use sensor flip.
+	 *
+	 * Using ISP flip retains the BGGR pattern at the cost of changing the
+	 * pixel array readout. This affects the selection rectangles in ways
+	 * that are not very well documented, and would be tougher to deal with
+	 * for applications compared to reading a different bayer pattern.
+	 */
+	ret = ov5647_read(sd, reg, &reg_val);
+	if (ret)
+		return ret;
+
+	return ov5647_write(sd, reg, ctrl_val ? reg_val | BIT(1)
+					      : reg_val & ~BIT(1));
+}
+
 static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov5647 *sensor = container_of(ctrl->handler,
@@ -1291,6 +1344,14 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 		/* Read-only, but we adjust it based on mode. */
 		break;
 
+	case V4L2_CID_HFLIP:
+		/* There's an in-built hflip in the sensor, so account for that here. */
+		ret = ov5647_s_flip(sd, OV5647_REG_TIMING_TC_H, !ctrl->val);
+		break;
+	case V4L2_CID_VFLIP:
+		ret = ov5647_s_flip(sd, OV5647_REG_TIMING_TC_V, ctrl->val);
+		break;
+
 	default:
 		dev_info(&client->dev,
 			 "Control (id:0x%x, val:0x%x) not supported\n",
@@ -1324,7 +1385,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 	int hblank, exposure_max, exposure_def;
 	struct device *dev = &client->dev;
 
-	v4l2_ctrl_handler_init(&sensor->ctrls, 11);
+	v4l2_ctrl_handler_init(&sensor->ctrls, 13);
 
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
@@ -1373,6 +1434,12 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 				     ARRAY_SIZE(ov5647_test_pattern_menu) - 1,
 				     0, 0, ov5647_test_pattern_menu);
 
+	sensor->hflip = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
+					  V4L2_CID_HFLIP, 0, 1, 1, 0);
+
+	sensor->vflip = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
+					  V4L2_CID_VFLIP, 0, 1, 1, 0);
+
 	v4l2_fwnode_device_parse(dev, &props);
 
 	v4l2_ctrl_new_fwnode_properties(&sensor->ctrls, &ov5647_ctrl_ops,

-- 
2.52.0


