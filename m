Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60B9D20575F
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 18:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732589AbgFWQjU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 12:39:20 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:34115 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732174AbgFWQjU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 12:39:20 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id D938460009;
        Tue, 23 Jun 2020 16:39:14 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com
Cc:     mrodin@de.adit-jv.com, hugues.fruchet@st.com, mripard@kernel.org,
        aford173@gmail.com, sudipi@jp.adit-jv.com,
        andrew_gabbasov@mentor.com, erosca@de.adit-jv.com,
        linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        David Plowman <david.plowman@raspberrypi.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 13/25] media: ov5647: Support gain, exposure and AWB controls
Date:   Tue, 23 Jun 2020 18:42:22 +0200
Message-Id: <20200623164224.44476-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623100815.10674-1-jacopo@jmondi.org>
References: <20200623100815.10674-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: David Plowman <david.plowman@raspberrypi.com>

Add controls to support AWB, AEC and AGC. Also add control support to
set exposure (in lines) and analogue gain (as a register code).

Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 170 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 168 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 2d2829f934c3c..8cfe315cfd00b 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -21,6 +21,7 @@
 #include <linux/of_graph.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
+#include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-image-sizes.h>
@@ -43,9 +44,16 @@
 #define OV5647_REG_CHIPID_H		0x300a
 #define OV5647_REG_CHIPID_L		0x300b
 #define OV5640_REG_PAD_OUT		0x300d
+#define OV5647_REG_EXP_HI		0x3500
+#define OV5647_REG_EXP_MID		0x3501
+#define OV5647_REG_EXP_LO		0x3502
+#define OV5647_REG_AEC_AGC		0x3503
+#define OV5647_REG_GAIN_HI		0x350a
+#define OV5647_REG_GAIN_LO		0x350b
 #define OV5647_REG_FRAME_OFF_NUMBER	0x4202
 #define OV5647_REG_MIPI_CTRL00		0x4800
 #define OV5647_REG_MIPI_CTRL14		0x4814
+#define OV5647_REG_AWB			0x5001
 
 #define REG_TERM 0xfffe
 #define VAL_TERM 0xfe
@@ -87,6 +95,7 @@ struct ov5647 {
 	struct clk			*xclk;
 	struct gpio_desc		*pwdn;
 	bool				clock_ncont;
+	struct v4l2_ctrl_handler	ctrls;
 };
 
 static inline struct ov5647 *to_state(struct v4l2_subdev *sd)
@@ -121,7 +130,6 @@ static struct regval_list ov5647_640x480[] = {
 	{0x3612, 0x59},
 	{0x3618, 0x00},
 	{0x5000, 0x06},
-	{0x5001, 0x01},
 	{0x5002, 0x41},
 	{0x5003, 0x08},
 	{0x5a00, 0x08},
@@ -312,6 +320,11 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
 		return ret;
 	}
 
+	/* Apply customized values from user when stream starts. */
+	ret =  __v4l2_ctrl_handler_setup(sd->ctrl_handler);
+	if (ret)
+		return ret;
+
 	if (ov5647->clock_ncont)
 		val |= MIPI_CTRL00_CLOCK_LANE_GATE |
 		       MIPI_CTRL00_LINE_SYNC_ENABLE;
@@ -591,6 +604,152 @@ static const struct v4l2_subdev_internal_ops ov5647_subdev_internal_ops = {
 	.open = ov5647_open,
 };
 
+static int ov5647_s_auto_white_balance(struct v4l2_subdev *sd, u32 val)
+{
+	return ov5647_write(sd, OV5647_REG_AWB, val ? 1 : 0);
+}
+
+static int ov5647_s_autogain(struct v4l2_subdev *sd, u32 val)
+{
+	int ret;
+	u8 reg;
+
+	/* Non-zero turns on AGC by clearing bit 1.*/
+	ret = ov5647_read(sd, OV5647_REG_AEC_AGC, &reg);
+	if (ret)
+		return ret;
+
+	return ov5647_write(sd, OV5647_REG_AEC_AGC, val ? reg & ~BIT(1)
+							: reg | BIT(1));
+}
+
+static int ov5647_s_exposure_auto(struct v4l2_subdev *sd, u32 val)
+{
+	int ret;
+	u8 reg;
+
+	/*
+	 * Everything except V4L2_EXPOSURE_MANUAL turns on AEC by
+	 * clearing bit 0.
+	 */
+	ret = ov5647_read(sd, OV5647_REG_AEC_AGC, &reg);
+	if (ret)
+		return ret;
+
+	return ov5647_write(sd, OV5647_REG_AEC_AGC, val == V4L2_EXPOSURE_MANUAL ?
+						    reg | BIT(0) : reg & ~BIT(0));
+}
+
+static int ov5647_s_analogue_gain(struct v4l2_subdev *sd, u32 val)
+{
+	int ret;
+
+	/* 10 bits of gain, 2 in the high register. */
+	ret = ov5647_write(sd, OV5647_REG_GAIN_HI, (val >> 8) & 3);
+	if (ret)
+		return ret;
+
+	return ov5647_write(sd, OV5647_REG_GAIN_LO, val & 0xff);
+}
+
+static int ov5647_s_exposure(struct v4l2_subdev *sd, u32 val)
+{
+	int ret;
+
+	/*
+	 * Sensor has 20 bits, but the bottom 4 bits are fractions of a line
+	 * which we leave as zero (and don't receive in "val").
+	 */
+	ret = ov5647_write(sd, OV5647_REG_EXP_HI, (val >> 12) & 0xf);
+	if (ret)
+		return ret;
+
+	ret = ov5647_write(sd, OV5647_REG_EXP_MID, (val >> 4) & 0xff);
+	if (ret)
+		return ret;
+
+	return ov5647_write(sd, OV5647_REG_EXP_LO, (val & 0xf) << 4);
+}
+
+static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ov5647 *sensor = container_of(ctrl->handler,
+					    struct ov5647, ctrls);
+	struct v4l2_subdev *sd = &sensor->sd;
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+
+	/* v4l2_ctrl_lock() locks our own mutex */
+
+	/*
+	 * If the device is not powered up by the host driver do
+	 * not apply any controls to H/W at this time. Instead
+	 * the controls will be restored at s_stream(1) time.
+	 */
+	if (!sensor->power_count)
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_AUTO_WHITE_BALANCE:
+		return ov5647_s_auto_white_balance(sd, ctrl->val);
+	case V4L2_CID_AUTOGAIN:
+		return ov5647_s_autogain(sd, ctrl->val);
+	case V4L2_CID_EXPOSURE_AUTO:
+		return ov5647_s_exposure_auto(sd, ctrl->val);
+	case V4L2_CID_ANALOGUE_GAIN:
+		return  ov5647_s_analogue_gain(sd, ctrl->val);
+	case V4L2_CID_EXPOSURE:
+		return ov5647_s_exposure(sd, ctrl->val);
+	default:
+		dev_info(&client->dev,
+			 "Control (id:0x%x, val:0x%x) not supported\n",
+			 ctrl->id, ctrl->val);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops ov5647_ctrl_ops = {
+	.s_ctrl = ov5647_s_ctrl,
+};
+
+static int ov5647_init_controls(struct ov5647 *sensor)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
+
+	v4l2_ctrl_handler_init(&sensor->ctrls, 5);
+
+	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
+			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
+
+	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
+			  V4L2_CID_AUTO_WHITE_BALANCE, 0, 1, 1, 0);
+
+	v4l2_ctrl_new_std_menu(&sensor->ctrls, &ov5647_ctrl_ops,
+			       V4L2_CID_EXPOSURE_AUTO, V4L2_EXPOSURE_MANUAL,
+			       0, V4L2_EXPOSURE_MANUAL);
+
+	/* min: 4 lines; max: 0xffff lines; default: 1000 lines. */
+	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
+			  V4L2_CID_EXPOSURE, 4, 65535, 1, 1000);
+
+	/* min: 16 = 1.0x; max (10 bits); default: 32 = 2.0x. */
+	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
+			  V4L2_CID_ANALOGUE_GAIN, 16, 1023, 1, 32);
+
+	if (sensor->ctrls.error) {
+		dev_err(&client->dev, "%s Controls initialization failed (%d)\n",
+			__func__, sensor->ctrls.error);
+		v4l2_ctrl_handler_free(&sensor->ctrls);
+
+		return sensor->ctrls.error;
+	}
+
+	sensor->sd.ctrl_handler = &sensor->ctrls;
+
+	return 0;
+}
+
 static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)
 {
 	struct v4l2_fwnode_endpoint bus_cfg = {
@@ -654,6 +813,10 @@ static int ov5647_probe(struct i2c_client *client)
 
 	mutex_init(&sensor->lock);
 
+	ret = ov5647_init_controls(sensor);
+	if (ret)
+		goto mutex_destroy;
+
 	sd = &sensor->sd;
 	v4l2_i2c_subdev_init(sd, client, &ov5647_subdev_ops);
 	sd->internal_ops = &ov5647_subdev_internal_ops;
@@ -663,7 +826,7 @@ static int ov5647_probe(struct i2c_client *client)
 	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
 	ret = media_entity_pads_init(&sd->entity, 1, &sensor->pad);
 	if (ret < 0)
-		goto mutex_destroy;
+		goto ctrl_handler_free;
 
 	if (sensor->pwdn) {
 		gpiod_set_value_cansleep(sensor->pwdn, 0);
@@ -685,6 +848,8 @@ static int ov5647_probe(struct i2c_client *client)
 
 entity_cleanup:
 	media_entity_cleanup(&sd->entity);
+ctrl_handler_free:
+	v4l2_ctrl_handler_free(&sensor->ctrls);
 mutex_destroy:
 	mutex_destroy(&sensor->lock);
 
@@ -698,6 +863,7 @@ static int ov5647_remove(struct i2c_client *client)
 
 	v4l2_async_unregister_subdev(&ov5647->sd);
 	media_entity_cleanup(&ov5647->sd.entity);
+	v4l2_ctrl_handler_free(&ov5647->ctrls);
 	v4l2_device_unregister_subdev(sd);
 	mutex_destroy(&ov5647->lock);
 
-- 
2.27.0

