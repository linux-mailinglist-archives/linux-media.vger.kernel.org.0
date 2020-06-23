Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEB672057F1
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 18:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733004AbgFWQxC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 12:53:02 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:40823 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732510AbgFWQxC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 12:53:02 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 2C20F200018;
        Tue, 23 Jun 2020 16:52:56 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com
Cc:     mrodin@de.adit-jv.com, hugues.fruchet@st.com, mripard@kernel.org,
        aford173@gmail.com, sudipi@jp.adit-jv.com,
        andrew_gabbasov@mentor.com, erosca@de.adit-jv.com,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 25/25] media: ov5647: Advertise the correct exposure range
Date:   Tue, 23 Jun 2020 18:55:50 +0200
Message-Id: <20200623165550.45835-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623100815.10674-1-jacopo@jmondi.org>
References: <20200623100815.10674-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Exposure is clipped by the VTS of the mode, so it needs to be updated
when this is changed.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 41 ++++++++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 209218fb073d6..8f62415c07aad 100644
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
@@ -108,6 +113,7 @@ struct ov5647 {
 	struct v4l2_ctrl		*pixel_rate;
 	struct v4l2_ctrl		*hblank;
 	struct v4l2_ctrl		*vblank;
+	struct v4l2_ctrl		*exposure;
 };
 
 static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
@@ -1102,10 +1108,10 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
 	struct ov5647 *sensor = to_sensor(sd);
+	int hblank, exposure_max, exposure_def;
 	struct ov5647_mode *ov5647_mode_list;
 	struct ov5647_mode *mode;
 	unsigned int num_modes;
-	int hblank;
 
 	/*
 	 * Default mbus code MEDIA_BUS_FMT_SBGGR10_1X10 if the requested one
@@ -1147,6 +1153,13 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
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
 
@@ -1329,6 +1342,18 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 
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
@@ -1374,9 +1399,9 @@ static const struct v4l2_ctrl_ops ov5647_ctrl_ops = {
 static int ov5647_init_controls(struct ov5647 *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
-	int hblank;
+	int hblank, exposure_max, exposure_def;
 
-	v4l2_ctrl_handler_init(&sensor->ctrls, 8);
+	v4l2_ctrl_handler_init(&sensor->ctrls, 9);
 
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
@@ -1388,9 +1413,13 @@ static int ov5647_init_controls(struct ov5647 *sensor)
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
2.27.0

