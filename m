Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33136204EC6
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 12:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732215AbgFWKFe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 06:05:34 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:40085 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732005AbgFWKFe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 06:05:34 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4E675C0003;
        Tue, 23 Jun 2020 10:05:29 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mrodin@de.adit-jv.com,
        hugues.fruchet@st.com, mripard@kernel.org, aford173@gmail.com,
        sudipi@jp.adit-jv.com, andrew_gabbasov@mentor.com,
        erosca@de.adit-jv.com, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Subject: [PATCH 07/25] media: ov5647: Fix style issues
Date:   Tue, 23 Jun 2020 12:07:57 +0200
Message-Id: <20200623100815.10674-8-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623100815.10674-1-jacopo@jmondi.org>
References: <20200623100815.10674-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver has some obvious style issues which are worth fixing before
expanding the driver capabilities.

Fix:
- Variable declaration order
- Function parameters alignment
- Multi-line comments and spurious line breaks
- Use lowercase for hexadecimal values

Cosmetic change, no functional changes intended.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 101 +++++++++++++++++--------------------
 1 file changed, 45 insertions(+), 56 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index c92856d3aa81c..e9679382623f9 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -34,8 +34,6 @@
 #include <media/v4l2-image-sizes.h>
 #include <media/v4l2-mediabus.h>
 
-#define SENSOR_NAME "ov5647"
-
 /*
  * From the datasheet, "20ms after PWDN goes low or 20ms after RESETB goes
  * high if reset is inserted after PWDN goes high, host can access sensor's
@@ -50,9 +48,9 @@
 
 #define OV5647_SW_STANDBY		0x0100
 #define OV5647_SW_RESET			0x0103
-#define OV5647_REG_CHIPID_H		0x300A
-#define OV5647_REG_CHIPID_L		0x300B
-#define OV5640_REG_PAD_OUT		0x300D
+#define OV5647_REG_CHIPID_H		0x300a
+#define OV5647_REG_CHIPID_L		0x300b
+#define OV5640_REG_PAD_OUT		0x300d
 #define OV5647_REG_FRAME_OFF_NUMBER	0x4202
 #define OV5647_REG_MIPI_CTRL00		0x4800
 #define OV5647_REG_MIPI_CTRL14		0x4814
@@ -158,7 +156,7 @@ static struct regval_list ov5647_640x480[] = {
 	{0x3808, 0x02},
 	{0x3809, 0x80},
 	{0x380a, 0x01},
-	{0x380b, 0xE0},
+	{0x380b, 0xe0},
 	{0x3801, 0x00},
 	{0x3802, 0x00},
 	{0x3803, 0x00},
@@ -209,9 +207,9 @@ static struct regval_list ov5647_640x480[] = {
 
 static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
 {
-	int ret;
 	unsigned char data[3] = { reg >> 8, reg & 0xff, val};
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	int ret;
 
 	ret = i2c_master_send(client, data, 3);
 	if (ret < 0)
@@ -223,9 +221,9 @@ static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
 
 static int ov5647_read(struct v4l2_subdev *sd, u16 reg, u8 *val)
 {
-	int ret;
 	unsigned char data_w[2] = { reg >> 8, reg & 0xff };
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	int ret;
 
 	ret = i2c_master_send(client, data_w, 2);
 	if (ret < 0) {
@@ -243,7 +241,7 @@ static int ov5647_read(struct v4l2_subdev *sd, u16 reg, u8 *val)
 }
 
 static int ov5647_write_array(struct v4l2_subdev *sd,
-				struct regval_list *regs, int array_size)
+			      struct regval_list *regs, int array_size)
 {
 	int i, ret;
 
@@ -266,6 +264,7 @@ static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
 		return ret;
 
 	channel_id &= ~(3 << 6);
+
 	return ov5647_write(sd, OV5647_REG_MIPI_CTRL14, channel_id | (channel << 6));
 }
 
@@ -294,8 +293,8 @@ static int ov5647_stream_off(struct v4l2_subdev *sd)
 {
 	int ret;
 
-	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, MIPI_CTRL00_CLOCK_LANE_GATE
-			   | MIPI_CTRL00_BUS_IDLE | MIPI_CTRL00_CLOCK_LANE_DISABLE);
+	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, MIPI_CTRL00_CLOCK_LANE_GATE |
+			       MIPI_CTRL00_BUS_IDLE | MIPI_CTRL00_CLOCK_LANE_DISABLE);
 	if (ret < 0)
 		return ret;
 
@@ -325,16 +324,16 @@ static int set_sw_standby(struct v4l2_subdev *sd, bool standby)
 
 static int __sensor_init(struct v4l2_subdev *sd)
 {
-	int ret;
-	u8 resetval, rdval;
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	u8 resetval, rdval;
+	int ret;
 
 	ret = ov5647_read(sd, OV5647_SW_STANDBY, &rdval);
 	if (ret < 0)
 		return ret;
 
 	ret = ov5647_write_array(sd, ov5647_640x480,
-					ARRAY_SIZE(ov5647_640x480));
+				 ARRAY_SIZE(ov5647_640x480));
 	if (ret < 0) {
 		dev_err(&client->dev, "write sensor default regs error\n");
 		return ret;
@@ -355,17 +354,15 @@ static int __sensor_init(struct v4l2_subdev *sd)
 			return ret;
 	}
 
-	/*
-	 * stream off to make the clock lane into LP-11 state.
-	 */
+	/* Stream off to make the clock lane into LP-11 state. */
 	return ov5647_stream_off(sd);
 }
 
 static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 {
-	int ret = 0;
-	struct ov5647 *ov5647 = to_state(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ov5647 *ov5647 = to_state(sd);
+	int ret = 0;
 
 	mutex_lock(&ov5647->lock);
 
@@ -384,7 +381,7 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 		}
 
 		ret = ov5647_write_array(sd, sensor_oe_enable_regs,
-				ARRAY_SIZE(sensor_oe_enable_regs));
+					 ARRAY_SIZE(sensor_oe_enable_regs));
 		if (ret < 0) {
 			clk_disable_unprepare(ov5647->xclk);
 			dev_err(&client->dev,
@@ -403,18 +400,15 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 		dev_dbg(&client->dev, "OV5647 power off\n");
 
 		ret = ov5647_write_array(sd, sensor_oe_disable_regs,
-				ARRAY_SIZE(sensor_oe_disable_regs));
-
+					 ARRAY_SIZE(sensor_oe_disable_regs));
 		if (ret < 0)
 			dev_dbg(&client->dev, "disable oe failed\n");
 
 		ret = set_sw_standby(sd, true);
-
 		if (ret < 0)
 			dev_dbg(&client->dev, "soft stby failed\n");
 
 		clk_disable_unprepare(ov5647->xclk);
-
 		gpiod_set_value_cansleep(ov5647->pwdn, 1);
 	}
 
@@ -430,10 +424,10 @@ static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
 static int ov5647_sensor_get_register(struct v4l2_subdev *sd,
-				struct v4l2_dbg_register *reg)
+				      struct v4l2_dbg_register *reg)
 {
-	u8 val;
 	int ret;
+	u8 val;
 
 	ret = ov5647_read(sd, reg->reg & 0xff, &val);
 	if (ret < 0)
@@ -446,15 +440,13 @@ static int ov5647_sensor_get_register(struct v4l2_subdev *sd,
 }
 
 static int ov5647_sensor_set_register(struct v4l2_subdev *sd,
-				const struct v4l2_dbg_register *reg)
+				      const struct v4l2_dbg_register *reg)
 {
 	return ov5647_write(sd, reg->reg & 0xff, reg->val & 0xff);
 }
 #endif
 
-/*
- * Subdev core operations registration
- */
+/* Subdev core operations registration */
 static const struct v4l2_subdev_core_ops ov5647_subdev_core_ops = {
 	.s_power		= ov5647_sensor_power,
 #ifdef CONFIG_VIDEO_ADV_DEBUG
@@ -476,8 +468,8 @@ static const struct v4l2_subdev_video_ops ov5647_subdev_video_ops = {
 };
 
 static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
-				struct v4l2_subdev_pad_config *cfg,
-				struct v4l2_subdev_mbus_code_enum *code)
+				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	if (code->index > 0)
 		return -EINVAL;
@@ -493,7 +485,7 @@ static int ov5647_set_get_fmt(struct v4l2_subdev *sd,
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
 
-	/* Only one format is supported, so return that */
+	/* Only one format is supported, so return that. */
 	memset(fmt, 0, sizeof(*fmt));
 	fmt->code = MEDIA_BUS_FMT_SBGGR8_1X8;
 	fmt->colorspace = V4L2_COLORSPACE_SRGB;
@@ -518,9 +510,9 @@ static const struct v4l2_subdev_ops ov5647_subdev_ops = {
 
 static int ov5647_detect(struct v4l2_subdev *sd)
 {
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	u8 read;
 	int ret;
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
 
 	ret = ov5647_write(sd, OV5647_SW_RESET, 0x01);
 	if (ret < 0)
@@ -549,10 +541,8 @@ static int ov5647_detect(struct v4l2_subdev *sd)
 
 static int ov5647_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	struct v4l2_mbus_framefmt *format =
-				v4l2_subdev_get_try_format(sd, fh->pad, 0);
-	struct v4l2_rect *crop =
-				v4l2_subdev_get_try_crop(sd, fh->pad, 0);
+	struct v4l2_mbus_framefmt *format = v4l2_subdev_get_try_format(sd, fh->pad, 0);
+	struct v4l2_rect *crop = v4l2_subdev_get_try_crop(sd, fh->pad, 0);
 
 	crop->left = OV5647_COLUMN_START_DEF;
 	crop->top = OV5647_ROW_START_DEF;
@@ -578,7 +568,6 @@ static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
 	struct device_node *ep;
-
 	int ret;
 
 	ep = of_graph_get_next_endpoint(np, NULL);
@@ -594,17 +583,18 @@ static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)
 
 out:
 	of_node_put(ep);
+
 	return ret;
 }
 
 static int ov5647_probe(struct i2c_client *client)
 {
+	struct device_node *np = client->dev.of_node;
 	struct device *dev = &client->dev;
 	struct ov5647 *sensor;
-	int ret;
 	struct v4l2_subdev *sd;
-	struct device_node *np = client->dev.of_node;
 	u32 xclk_freq;
+	int ret;
 
 	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
 	if (!sensor)
@@ -618,7 +608,6 @@ static int ov5647_probe(struct i2c_client *client)
 		}
 	}
 
-	/* get system clock (xclk) */
 	sensor->xclk = devm_clk_get(dev, NULL);
 	if (IS_ERR(sensor->xclk)) {
 		dev_err(dev, "could not get xclk");
@@ -631,22 +620,21 @@ static int ov5647_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
-	/* Request the power down GPIO asserted */
-	sensor->pwdn = devm_gpiod_get_optional(&client->dev, "pwdn",
-					       GPIOD_OUT_HIGH);
+	/* Request the power down GPIO asserted. */
+	sensor->pwdn = devm_gpiod_get_optional(dev, "pwdn", GPIOD_OUT_HIGH);
 
 	mutex_init(&sensor->lock);
 
 	sd = &sensor->sd;
 	v4l2_i2c_subdev_init(sd, client, &ov5647_subdev_ops);
-	sensor->sd.internal_ops = &ov5647_subdev_internal_ops;
-	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->internal_ops = &ov5647_subdev_internal_ops;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
 	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
 	ret = media_entity_pads_init(&sd->entity, 1, &sensor->pad);
 	if (ret < 0)
-		goto mutex_remove;
+		goto mutex_destroy;
 
 	if (sensor->pwdn) {
 		gpiod_set_value_cansleep(sensor->pwdn, 0);
@@ -654,22 +642,23 @@ static int ov5647_probe(struct i2c_client *client)
 	}
 
 	ret = ov5647_detect(sd);
-
 	gpiod_set_value_cansleep(sensor->pwdn, 1);
-
 	if (ret < 0)
-		goto error;
+		goto entity_cleanup;
 
 	ret = v4l2_async_register_subdev(sd);
 	if (ret < 0)
-		goto error;
+		goto entity_cleanup;
 
 	dev_dbg(dev, "OmniVision OV5647 camera driver probed\n");
+
 	return 0;
-error:
+
+entity_cleanup:
 	media_entity_cleanup(&sd->entity);
-mutex_remove:
+mutex_destroy:
 	mutex_destroy(&sensor->lock);
+
 	return ret;
 }
 
@@ -688,7 +677,7 @@ static int ov5647_remove(struct i2c_client *client)
 
 static const struct i2c_device_id ov5647_id[] = {
 	{ "ov5647", 0 },
-	{ }
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, ov5647_id);
 
@@ -703,7 +692,7 @@ MODULE_DEVICE_TABLE(of, ov5647_of_match);
 static struct i2c_driver ov5647_driver = {
 	.driver = {
 		.of_match_table = of_match_ptr(ov5647_of_match),
-		.name	= SENSOR_NAME,
+		.name	= "ov5647",
 	},
 	.probe_new	= ov5647_probe,
 	.remove		= ov5647_remove,
-- 
2.27.0

