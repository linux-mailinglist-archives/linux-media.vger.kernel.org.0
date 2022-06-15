Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 424E154CC68
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 17:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347731AbiFOPPo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 11:15:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231665AbiFOPPh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 11:15:37 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49FA3C713
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 08:15:31 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 47EFF24000E;
        Wed, 15 Jun 2022 15:15:28 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     dave.stevenson@raspberrypi.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>, david.plowman@raspberrypi.com,
        laurent.pinchart@ideasonboard.com,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 2/5] media: ov5647: Support HFLIP and VFLIP
Date:   Wed, 15 Jun 2022 17:14:54 +0200
Message-Id: <20220615151457.415038-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615151457.415038-1-jacopo@jmondi.org>
References: <20220615151457.415038-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: David Plowman <david.plowman@raspberrypi.com>

Add these missing V4L2 controls. Tested binned and full resolution
modes in all four orientations using Raspberry Pi running libcamera.

Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 72 ++++++++++++++++++++++++++++++++++----
 1 file changed, 66 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 98b72094ef68..c292e5d09eab 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -54,6 +54,8 @@
 #define OV5647_REG_GAIN_LO		0x350b
 #define OV5647_REG_VTS_HI		0x380e
 #define OV5647_REG_VTS_LO		0x380f
+#define OV5647_REG_VFLIP		0x3820
+#define OV5647_REG_HFLIP		0x3821
 #define OV5647_REG_FRAME_OFF_NUMBER	0x4202
 #define OV5647_REG_MIPI_CTRL00		0x4800
 #define OV5647_REG_MIPI_CTRL14		0x4814
@@ -108,6 +110,8 @@ struct ov5647 {
 	struct v4l2_ctrl		*hblank;
 	struct v4l2_ctrl		*vblank;
 	struct v4l2_ctrl		*exposure;
+	struct v4l2_ctrl		*hflip;
+	struct v4l2_ctrl		*vflip;
 	bool				streaming;
 };
 
@@ -136,7 +140,7 @@ static struct regval_list ov5647_2592x1944_10bpp[] = {
 	{0x3036, 0x69},
 	{0x303c, 0x11},
 	{0x3106, 0xf5},
-	{0x3821, 0x06},
+	{0x3821, 0x00},
 	{0x3820, 0x00},
 	{0x3827, 0xec},
 	{0x370c, 0x03},
@@ -225,7 +229,7 @@ static struct regval_list ov5647_1080p30_10bpp[] = {
 	{0x3036, 0x62},
 	{0x303c, 0x11},
 	{0x3106, 0xf5},
-	{0x3821, 0x06},
+	{0x3821, 0x00},
 	{0x3820, 0x00},
 	{0x3827, 0xec},
 	{0x370c, 0x03},
@@ -389,7 +393,7 @@ static struct regval_list ov5647_2x2binned_10bpp[] = {
 	{0x4800, 0x24},
 	{0x3503, 0x03},
 	{0x3820, 0x41},
-	{0x3821, 0x07},
+	{0x3821, 0x01},
 	{0x350a, 0x00},
 	{0x350b, 0x10},
 	{0x3500, 0x00},
@@ -405,7 +409,7 @@ static struct regval_list ov5647_640x480_10bpp[] = {
 	{0x3035, 0x11},
 	{0x3036, 0x46},
 	{0x303c, 0x11},
-	{0x3821, 0x07},
+	{0x3821, 0x01},
 	{0x3820, 0x41},
 	{0x370c, 0x03},
 	{0x3612, 0x59},
@@ -918,6 +922,21 @@ static const struct v4l2_subdev_video_ops ov5647_subdev_video_ops = {
 	.s_stream =		ov5647_s_stream,
 };
 
+static u32 ov5647_get_mbus_code(struct v4l2_subdev *sd)
+{
+	struct ov5647 *sensor = to_sensor(sd);
+	int index = sensor->hflip->val | (sensor->vflip->val << 1);
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
@@ -925,7 +944,7 @@ static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	code->code = ov5647_get_mbus_code(sd);
 
 	return 0;
 }
@@ -936,7 +955,7 @@ static int ov5647_enum_frame_size(struct v4l2_subdev *sd,
 {
 	const struct v4l2_mbus_framefmt *fmt;
 
-	if (fse->code != MEDIA_BUS_FMT_SBGGR10_1X10 ||
+	if (fse->code != ov5647_get_mbus_code(sd) ||
 	    fse->index >= ARRAY_SIZE(ov5647_modes))
 		return -EINVAL;
 
@@ -969,6 +988,8 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
 	}
 
 	*fmt = *sensor_format;
+	/* The code we pass back must reflect the current h/vflips. */
+	fmt->code = ov5647_get_mbus_code(sd);
 	mutex_unlock(&sensor->lock);
 
 	return 0;
@@ -1016,6 +1037,8 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 					 exposure_def);
 	}
 	*fmt = mode->format;
+	/* The code we pass back must reflect the current h/vflips. */
+	fmt->code = ov5647_get_mbus_code(sd);
 	mutex_unlock(&sensor->lock);
 
 	return 0;
@@ -1191,6 +1214,25 @@ static int ov5647_s_exposure(struct v4l2_subdev *sd, u32 val)
 	return ov5647_write(sd, OV5647_REG_EXP_LO, (val & 0xf) << 4);
 }
 
+static int ov5647_s_flip(struct v4l2_subdev *sd, u16 reg, u32 ctrl_val)
+{
+	u8 reg_val;
+	int ret;
+
+	/* Set or clear bit 1 and leave everything else alone. */
+	ret = ov5647_read(sd, reg, &reg_val);
+	if (ret == 0) {
+		if (ctrl_val)
+			reg_val |= 2;
+		else
+			reg_val &= ~2;
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
@@ -1249,6 +1291,14 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 		/* Read-only, but we adjust it based on mode. */
 		break;
 
+	case V4L2_CID_HFLIP:
+		/* There's an in-built hflip in the sensor, so account for that here. */
+		ov5647_s_flip(sd, OV5647_REG_HFLIP, !ctrl->val);
+		break;
+	case V4L2_CID_VFLIP:
+		ov5647_s_flip(sd, OV5647_REG_VFLIP, ctrl->val);
+		break;
+
 	default:
 		dev_info(&client->dev,
 			 "Control (id:0x%x, val:0x%x) not supported\n",
@@ -1315,6 +1365,16 @@ static int ov5647_init_controls(struct ov5647 *sensor, struct device *dev)
 					   sensor->mode->vts -
 					   sensor->mode->format.height);
 
+	sensor->hflip = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
+					  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	if (sensor->hflip)
+		sensor->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
+	sensor->vflip = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
+					  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	if (sensor->vflip)
+		sensor->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+
 	v4l2_fwnode_device_parse(dev, &props);
 
 	v4l2_ctrl_new_fwnode_properties(&sensor->ctrls, &ov5647_ctrl_ops,
-- 
2.35.1

