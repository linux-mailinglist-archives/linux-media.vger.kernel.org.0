Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0E542AC157
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 17:50:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730792AbgKIQuP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 11:50:15 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:35675 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730773AbgKIQuP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 11:50:15 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 254DE1BF20F;
        Mon,  9 Nov 2020 16:50:10 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: [PATCH v3 13/29] media: ov5647: Break out format handling
Date:   Mon,  9 Nov 2020 17:49:18 +0100
Message-Id: <20201109164934.134919-14-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109164934.134919-1-jacopo@jmondi.org>
References: <20201109164934.134919-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Break format handling out from the main driver structure.

This commit prepares for the introduction of more sensor formats and
resolutions by instrumenting the existing operation to work on multiple
modes instead of assuming a single one supported.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 90 +++++++++++++++++++++++++++-----------
 1 file changed, 65 insertions(+), 25 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 91193706b6fe1..d41c11afe1216 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -84,18 +84,28 @@ struct regval_list {
 	u8 data;
 };
 
+struct ov5647_mode {
+	struct v4l2_mbus_framefmt	format;
+	const struct regval_list	*reg_list;
+	unsigned int			num_regs;
+};
+
+struct ov5647_format_list {
+	unsigned int			mbus_code;
+	const struct ov5647_mode	*modes;
+	unsigned int			num_modes;
+};
+
 struct ov5647 {
 	struct v4l2_subdev		sd;
 	struct media_pad		pad;
 	struct mutex			lock;
-	struct v4l2_mbus_framefmt	format;
-	unsigned int			width;
-	unsigned int			height;
 	int				power_count;
 	struct clk			*xclk;
 	struct gpio_desc		*pwdn;
 	bool				clock_ncont;
 	struct v4l2_ctrl_handler	ctrls;
+	const struct ov5647_mode	*mode;
 };
 
 static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
@@ -115,7 +125,7 @@ static struct regval_list sensor_oe_enable_regs[] = {
 	{0x3002, 0xe4},
 };
 
-static struct regval_list ov5647_640x480[] = {
+static const struct regval_list ov5647_640x480[] = {
 	{0x0100, 0x00},
 	{0x0103, 0x01},
 	{0x3034, 0x08},
@@ -205,6 +215,33 @@ static struct regval_list ov5647_640x480[] = {
 	{0x0100, 0x01},
 };
 
+static const struct ov5647_mode ov5647_8bit_modes[] = {
+	{
+		.format	= {
+			.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
+			.colorspace	= V4L2_COLORSPACE_SRGB,
+			.field		= V4L2_FIELD_NONE,
+			.width		= 640,
+			.height		= 480
+		},
+		.reg_list	= ov5647_640x480,
+		.num_regs	= ARRAY_SIZE(ov5647_640x480)
+	},
+};
+
+static const struct ov5647_format_list ov5647_formats[] = {
+	{
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
+		.modes		= ov5647_8bit_modes,
+		.num_modes	= ARRAY_SIZE(ov5647_8bit_modes),
+	},
+};
+
+#define OV5647_NUM_FORMATS	(ARRAY_SIZE(ov5647_formats))
+
+#define OV5647_DEFAULT_MODE	(&ov5647_formats[0].modes[0])
+#define OV5647_DEFAULT_FORMAT	(ov5647_formats[0].modes[0].format)
+
 static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
 {
 	unsigned char data[3] = { reg >> 8, reg & 0xff, val};
@@ -245,7 +282,7 @@ static int ov5647_read(struct v4l2_subdev *sd, u16 reg, u8 *val)
 }
 
 static int ov5647_write_array(struct v4l2_subdev *sd,
-			      struct regval_list *regs, int array_size)
+			      const struct regval_list *regs, int array_size)
 {
 	int i, ret;
 
@@ -275,6 +312,7 @@ static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
 static int ov5647_set_mode(struct v4l2_subdev *sd)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ov5647 *sensor = to_sensor(sd);
 	u8 resetval, rdval;
 	int ret;
 
@@ -282,8 +320,8 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
 	if (ret < 0)
 		return ret;
 
-	ret = ov5647_write_array(sd, ov5647_640x480,
-				 ARRAY_SIZE(ov5647_640x480));
+	ret = ov5647_write_array(sd, sensor->mode->reg_list,
+				 sensor->mode->num_regs);
 	if (ret < 0) {
 		dev_err(&client->dev, "write sensor default regs error\n");
 		return ret;
@@ -494,10 +532,10 @@ static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_pad_config *cfg,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (code->index > 0)
+	if (code->index >= OV5647_NUM_FORMATS)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_SBGGR8_1X8;
+	code->code = ov5647_formats[code->index].mbus_code;
 
 	return 0;
 }
@@ -506,16 +544,24 @@ static int ov5647_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_pad_config *cfg,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->index)
+	const struct v4l2_mbus_framefmt *fmt;
+	unsigned int i = 0;
+
+	for (; i < OV5647_NUM_FORMATS; ++i) {
+		if (ov5647_formats[i].mbus_code == fse->code)
+			break;
+	}
+	if (i == OV5647_NUM_FORMATS)
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_SBGGR8_1X8)
+	if (fse->index >= ov5647_formats[i].num_modes)
 		return -EINVAL;
 
-	fse->min_width = 640;
-	fse->max_width = 640;
-	fse->min_height = 480;
-	fse->max_height = 480;
+	fmt = &ov5647_formats[i].modes[fse->index].format;
+	fse->min_width = fmt->width;
+	fse->max_width = fmt->width;
+	fse->min_height = fmt->height;
+	fse->max_height = fmt->height;
 
 	return 0;
 }
@@ -528,11 +574,7 @@ static int ov5647_set_get_fmt(struct v4l2_subdev *sd,
 
 	/* Only one format is supported, so return that. */
 	memset(fmt, 0, sizeof(*fmt));
-	fmt->code = MEDIA_BUS_FMT_SBGGR8_1X8;
-	fmt->colorspace = V4L2_COLORSPACE_SRGB;
-	fmt->field = V4L2_FIELD_NONE;
-	fmt->width = 640;
-	fmt->height = 480;
+	*fmt = OV5647_DEFAULT_FORMAT;
 
 	return 0;
 }
@@ -591,11 +633,7 @@ static int ov5647_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	crop->width = OV5647_WINDOW_WIDTH_DEF;
 	crop->height = OV5647_WINDOW_HEIGHT_DEF;
 
-	format->code = MEDIA_BUS_FMT_SBGGR8_1X8;
-	format->width = 640;
-	format->height = 480;
-	format->field = V4L2_FIELD_NONE;
-	format->colorspace = V4L2_COLORSPACE_SRGB;
+	*format = OV5647_DEFAULT_FORMAT;
 
 	return 0;
 }
@@ -817,6 +855,8 @@ static int ov5647_probe(struct i2c_client *client)
 
 	mutex_init(&sensor->lock);
 
+	sensor->mode = OV5647_DEFAULT_MODE;
+
 	ret = ov5647_init_controls(sensor);
 	if (ret)
 		goto mutex_destroy;
-- 
2.29.1

