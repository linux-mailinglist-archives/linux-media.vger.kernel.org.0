Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1AEA2057ED
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 18:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732946AbgFWQww (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 12:52:52 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:56701 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733053AbgFWQwv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 12:52:51 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id C5874200008;
        Tue, 23 Jun 2020 16:52:46 +0000 (UTC)
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
Subject: [PATCH 22/25] media: ov5647: Support V4L2_CID_PIXEL_RATE
Date:   Tue, 23 Jun 2020 18:55:47 +0200
Message-Id: <20200623165550.45835-3-jacopo@jmondi.org>
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

Clients need to know the pixel rate in order to compute exposure
and frame rate values. Advertise it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 40 +++++++++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 35865e56de5f9..218576a05e66b 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -76,6 +76,7 @@ struct regval_list {
 struct ov5647_mode {
 	struct v4l2_mbus_framefmt	format;
 	struct v4l2_rect		crop;
+	u64				pixel_rate;
 	struct regval_list		*reg_list;
 	unsigned int			num_regs;
 };
@@ -97,6 +98,7 @@ struct ov5647 {
 	struct v4l2_ctrl_handler	ctrls;
 	struct ov5647_mode		*mode;
 	struct ov5647_mode		*current_mode;
+	struct v4l2_ctrl		*pixel_rate;
 };
 
 static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
@@ -583,6 +585,7 @@ static struct ov5647_mode ov5647_sbggr8_modes[] = {
 			.width		= 1280,
 			.height		= 960,
 		},
+		.pixel_rate	= 77291670,
 		.reg_list	= ov5647_640x480_sbggr8,
 		.num_regs	= ARRAY_SIZE(ov5647_640x480_sbggr8)
 	},
@@ -604,6 +607,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
 			.width		= 2592,
 			.height		= 1944
 		},
+		.pixel_rate	= 87500000,
 		.reg_list	= ov5647_2592x1944_sbggr10,
 		.num_regs	= ARRAY_SIZE(ov5647_2592x1944_sbggr10)
 	},
@@ -622,6 +626,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
 			.width		= 1928,
 			.height		= 1080,
 		},
+		.pixel_rate	= 81666700,
 		.reg_list	= ov5647_1080p30_sbggr10,
 		.num_regs	= ARRAY_SIZE(ov5647_1080p30_sbggr10)
 	},
@@ -640,6 +645,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
 			.width		= 2592,
 			.height		= 1944,
 		},
+		.pixel_rate	= 81666700,
 		.reg_list	= ov5647_2x2binned_sbggr10,
 		.num_regs	= ARRAY_SIZE(ov5647_2x2binned_sbggr10)
 	},
@@ -658,6 +664,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
 			.width		= 2560,
 			.height		= 1920,
 		},
+		.pixel_rate	= 55000000,
 		.reg_list	= ov5647_640x480_sbggr10,
 		.num_regs	= ARRAY_SIZE(ov5647_640x480_sbggr10)
 	},
@@ -1094,6 +1101,10 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 	/* Update the sensor mode and apply at it at streamon time. */
 	mutex_lock(&sensor->lock);
 	sensor->mode = mode;
+
+	__v4l2_ctrl_modify_range(sensor->pixel_rate, mode->pixel_rate,
+				 mode->pixel_rate, 1, mode->pixel_rate);
+
 	*fmt = mode->format;
 	mutex_unlock(&sensor->lock);
 
@@ -1295,6 +1306,9 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 		return  ov5647_s_analogue_gain(sd, ctrl->val);
 	case V4L2_CID_EXPOSURE:
 		return ov5647_s_exposure(sd, ctrl->val);
+	case V4L2_CID_PIXEL_RATE:
+		/* Read-only, but we adjust it based on mode. */
+		return 0;
 	default:
 		dev_info(&client->dev,
 			 "Control (id:0x%x, val:0x%x) not supported\n",
@@ -1313,7 +1327,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
 
-	v4l2_ctrl_handler_init(&sensor->ctrls, 5);
+	v4l2_ctrl_handler_init(&sensor->ctrls, 6);
 
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
@@ -1333,17 +1347,29 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_ANALOGUE_GAIN, 16, 1023, 1, 32);
 
-	if (sensor->ctrls.error) {
-		dev_err(&client->dev, "%s Controls initialization failed (%d)\n",
-			__func__, sensor->ctrls.error);
-		v4l2_ctrl_handler_free(&sensor->ctrls);
+	/* By default, PIXEL_RATE is read only, but it does change per mode */
+	sensor->pixel_rate = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
+					       V4L2_CID_PIXEL_RATE,
+					       sensor->mode->pixel_rate,
+					       sensor->mode->pixel_rate, 1,
+					       sensor->mode->pixel_rate);
+	if (!sensor->pixel_rate)
+		goto handler_free;
+	sensor->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-		return sensor->ctrls.error;
-	}
+	if (sensor->ctrls.error)
+		goto handler_free;
 
 	sensor->sd.ctrl_handler = &sensor->ctrls;
 
 	return 0;
+
+handler_free:
+	dev_err(&client->dev, "%s Controls initialization failed (%d)\n",
+		__func__, sensor->ctrls.error);
+	v4l2_ctrl_handler_free(&sensor->ctrls);
+
+	return sensor->ctrls.error;
 }
 
 static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)
-- 
2.27.0

