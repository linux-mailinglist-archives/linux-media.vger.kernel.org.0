Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53E5B2AC16B
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 17:54:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730693AbgKIQwv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 11:52:51 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:50251 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730696AbgKIQwv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 11:52:51 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2318320006;
        Mon,  9 Nov 2020 16:52:46 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 23/29] media: ov5647: Advertise the correct exposure range
Date:   Mon,  9 Nov 2020 17:49:28 +0100
Message-Id: <20201109164934.134919-24-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109164934.134919-1-jacopo@jmondi.org>
References: <20201109164934.134919-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Exposure is clipped by the VTS of the mode, so it needs to be updated
when this is changed.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 39 +++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 50edb19a933fb..7745a85ef4f02 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -73,6 +73,11 @@
 #define OV5647_VBLANK_MIN		4
 #define OV5647_VTS_MAX			32767
 
+#define OV5647_EXPOSURE_MIN		4
+#define OV5647_EXPOSURE_STEP		1
+#define OV5647_EXPOSURE_DEFAULT		1000
+#define OV5647_EXPOSURE_MAX		65535
+
 struct regval_list {
 	u16 addr;
 	u8 data;
@@ -107,6 +112,7 @@ struct ov5647 {
 	struct v4l2_ctrl		*pixel_rate;
 	struct v4l2_ctrl		*hblank;
 	struct v4l2_ctrl		*vblank;
+	struct v4l2_ctrl		*exposure;
 };
 
 static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
@@ -1092,9 +1098,9 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *fmt = &format->format;
 	const struct ov5647_mode *ov5647_mode_list;
 	struct ov5647 *sensor = to_sensor(sd);
+	int hblank, exposure_max, exposure_def;
 	const struct ov5647_mode *mode;
 	unsigned int num_modes;
-	int hblank;
 
 	/*
 	 * Default mbus code MEDIA_BUS_FMT_SBGGR10_1X10 if the requested one
@@ -1136,6 +1142,13 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 				 1, mode->vts - mode->format.height);
 	__v4l2_ctrl_s_ctrl(sensor->vblank, mode->vts - mode->format.height);
 
+	exposure_max = mode->vts - 4;
+	exposure_def = exposure_max < OV5647_EXPOSURE_DEFAULT ? exposure_max
+							      : OV5647_EXPOSURE_DEFAULT;
+	__v4l2_ctrl_modify_range(sensor->exposure, sensor->exposure->minimum,
+				 exposure_max, sensor->exposure->step,
+				 exposure_def);
+
 	*fmt = mode->format;
 	mutex_unlock(&sensor->lock);
 
@@ -1319,6 +1332,18 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	/* v4l2_ctrl_lock() locks our own mutex */
 
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		int exposure_max, exposure_def;
+
+		/* Update max exposure while meeting expected vblanking */
+		exposure_max = sensor->mode->format.height + ctrl->val - 4;
+		exposure_def = exposure_max < OV5647_EXPOSURE_DEFAULT
+			     ? exposure_max : OV5647_EXPOSURE_DEFAULT;
+		__v4l2_ctrl_modify_range(sensor->exposure, sensor->exposure->minimum,
+					 exposure_max, sensor->exposure->step,
+					 exposure_def);
+	}
+
 	/*
 	 * If the device is not powered up by the host driver do
 	 * not apply any controls to H/W at this time. Instead
@@ -1364,7 +1389,7 @@ static const struct v4l2_ctrl_ops ov5647_ctrl_ops = {
 static int ov5647_init_controls(struct ov5647 *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
-	int hblank;
+	int hblank, exposure_max, exposure_def;
 
 	v4l2_ctrl_handler_init(&sensor->ctrls, 8);
 
@@ -1378,9 +1403,13 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 			       V4L2_CID_EXPOSURE_AUTO, V4L2_EXPOSURE_MANUAL,
 			       0, V4L2_EXPOSURE_MANUAL);
 
-	/* min: 4 lines; max: 0xffff lines; default: 1000 lines. */
-	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
-			  V4L2_CID_EXPOSURE, 4, 65535, 1, 1000);
+	exposure_max = sensor->mode->vts - 4;
+	exposure_def = exposure_max < OV5647_EXPOSURE_DEFAULT ? exposure_max
+							      : OV5647_EXPOSURE_DEFAULT;
+	sensor->exposure = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
+					     V4L2_CID_EXPOSURE, OV5647_EXPOSURE_MIN,
+					     exposure_max, OV5647_EXPOSURE_STEP,
+					     exposure_def);
 
 	/* min: 16 = 1.0x; max (10 bits); default: 32 = 2.0x. */
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
-- 
2.29.1

