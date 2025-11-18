Return-Path: <linux-media+bounces-47281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C8CC69456
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 13:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 002554F211D
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C630357A3F;
	Tue, 18 Nov 2025 12:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q4RGIfDu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2198355037;
	Tue, 18 Nov 2025 12:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467454; cv=none; b=qrrr2/yUZ5G+Jozp0ztx4a9f8wvkkaFy0zGZi9zgFysfTO1zmYupRnCqt4pNij4TtvYHOiwBxGwM09ar5kNntlFCntSKclwjKCxASqtsBHmjWYZnOVokqTEwa+D55A9sGOdpnzuvW3wauf4DZHGKg2MbdyxZhr1TaioK2FJfWFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467454; c=relaxed/simple;
	bh=jyzgEO0aQlJegY8Jx7D//InarZS2fTgiPjn0MGiyc4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gkjG5lFmLEwLoSVvNVIY1xxiYV9+x6SgDQkUzd1ZYR8o5z2pQtLraCfhbe92ulBgbfdaRrVWQNTxcRRc41jlax9MdUm1peycmL8f/WzXdFo6KFKcdQ6/+HQGKQY51vAjnvwcGFOgFLVTyHqyu0P5/fu/wsO84iV7qxWukjTDx+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q4RGIfDu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:4b0d:7040:4d69:4c7c:d231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3D99215F;
	Tue, 18 Nov 2025 13:02:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763467328;
	bh=jyzgEO0aQlJegY8Jx7D//InarZS2fTgiPjn0MGiyc4Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q4RGIfDuxO1HUiv5F2xWKk6m25UY8hTXtGKyL1JnnNes9Fg8tgb7VbMEW1cRNfGkG
	 mgvoHBC9mVMkXvEv6wby+63CZe99PWNnr76vbGQn/smZB9DbWOt0MTVDCicbdFImf4
	 CN47LNu3KcCdD4JtH54T3WVwWnlZPi3u2Bc3P3lY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 18 Nov 2025 17:33:02 +0530
Subject: [PATCH v2 09/16] media: i2c: ov5647: Support HFLIP and VFLIP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-b4-rpi-ov5647-v2-9-5e78e7cb7f9b@ideasonboard.com>
References: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
In-Reply-To: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6880;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=vplnmqsjp3Ny6WQgN/SqrpBxHZsZgT6DBzkTzqLEvDk=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpHGCC1lYNanhRwLz5Z92dvRCqfmpmpEMPkVLAT
 sV3yLwOOiOJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaRxgggAKCRBD3pH5JJpx
 RTsGD/9Fe0M/DIRbJdejPvYmW6RbgEYkmjjxVIuf6qMBJzIqcwo/dXMtdBzzVRltQMLvM/lnw1I
 crxioNSjEJ3zt+F7JjAVJrW2++7XjQ9RirUIqz4B8R3H7WylbwHfQnbPlQnku6mVEroqJLnEltj
 2houNRXAbUEiHRsa3BKMxBQSAA22I+oMu9mGLy6DAsAw3msEbA47ShWCIFoEwyfAfa9ZnDnuLKe
 bUb93ujI4f2G9dHDWTwipyMSsU7LCIqWoVLrDNz6mQXM86VxlufVlSyYn91PmZVm1BIMknG16bT
 PMdV+wmXb7BHdMF6SGmSMQEyQMF0ZZkUxuYqJsxgqIcao2TnzceBSfTYzf50/phzQOj1jEYFB+r
 YMPC40nq+CGgiO+Kqgx9KujIb7uS+k3d00E5DMoB9AXFZTwG/jei9k+jy3TWdj9uPPN01CzZEbV
 TFG4AR9SQeZccCnWVJSGqtuJnp5ykcJPOLcdM06yfH5fPTxv7xZ9Nd9LmlncuHum0b9x/l3UOQP
 DMg1Wl1qJ+SXvrPNKhoEBRXO9xjQjgS8MR13OMFgMPTIIM+ACBum/TlAz/zsfI0J3CN/O86OJng
 e/1mOQkl9pUuBaoVulSlXG50I704PIEzeS68coR/ZD4p2n/COePFHEUxmoFQcm363a2NyIsWLxd
 yhEsVdyIFNBGIKQ==
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
Co-developed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 86 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 79 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 5009fd8c05a64d7e06f66f8f75f0a881cd0b95c1..0343583692ab9bcca1a07d874a707ac6093a9035 100644
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
+	{0x3821, 0x00},
 	{0x3820, 0x00},
 	{0x3827, 0xec},
 	{0x370c, 0x03},
@@ -250,7 +254,7 @@ static struct regval_list ov5647_1080p30_10bpp[] = {
 	{0x3036, 0x62},
 	{0x303c, 0x11},
 	{0x3106, 0xf5},
-	{0x3821, 0x06},
+	{0x3821, 0x00},
 	{0x3820, 0x00},
 	{0x3827, 0xec},
 	{0x370c, 0x03},
@@ -414,7 +418,7 @@ static struct regval_list ov5647_2x2binned_10bpp[] = {
 	{0x4800, 0x24},
 	{0x3503, 0x03},
 	{0x3820, 0x41},
-	{0x3821, 0x07},
+	{0x3821, 0x01},
 	{0x350a, 0x00},
 	{0x350b, 0x10},
 	{0x3500, 0x00},
@@ -430,7 +434,7 @@ static struct regval_list ov5647_640x480_10bpp[] = {
 	{0x3035, 0x11},
 	{0x3036, 0x46},
 	{0x303c, 0x11},
-	{0x3821, 0x07},
+	{0x3821, 0x01},
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
@@ -1229,6 +1257,36 @@ static int ov5647_s_exposure(struct v4l2_subdev *sd, u32 val)
 	return ov5647_write(sd, OV5647_REG_EXP_LO, (val & 0xf) << 4);
 }
 
+static int ov5647_s_flip(struct v4l2_subdev *sd, u16 reg, u32 ctrl_val)
+{
+	int ret;
+	u8 reg_val;
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
+	if (ret == 0) {
+		if (ctrl_val)
+			reg_val |= BIT(1);
+		else
+			reg_val &= ~BIT(1);
+
+		ret = ov5647_write(sd, reg, reg_val);
+	}
+
+	return ret;
+}
+
 static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov5647 *sensor = container_of(ctrl->handler,
@@ -1291,6 +1349,14 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 		/* Read-only, but we adjust it based on mode. */
 		break;
 
+	case V4L2_CID_HFLIP:
+		/* There's an in-built hflip in the sensor, so account for that here. */
+		ov5647_s_flip(sd, OV5647_REG_TIMING_TC_H, !ctrl->val);
+		break;
+	case V4L2_CID_VFLIP:
+		ov5647_s_flip(sd, OV5647_REG_TIMING_TC_V, ctrl->val);
+		break;
+
 	default:
 		dev_info(&client->dev,
 			 "Control (id:0x%x, val:0x%x) not supported\n",
@@ -1324,7 +1390,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 	int hblank, exposure_max, exposure_def;
 	struct device *dev = &client->dev;
 
-	v4l2_ctrl_handler_init(&sensor->ctrls, 11);
+	v4l2_ctrl_handler_init(&sensor->ctrls, 13);
 
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
@@ -1373,6 +1439,12 @@ static int ov5647_init_controls(struct ov5647 *sensor)
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
2.51.1


