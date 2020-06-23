Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D98B22057F0
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 18:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732940AbgFWQxA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 12:53:00 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:36159 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732962AbgFWQw6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 12:52:58 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 95D46200014;
        Tue, 23 Jun 2020 16:52:53 +0000 (UTC)
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
Subject: [PATCH 24/25] media: ov5647: Support V4L2_CID_VBLANK control
Date:   Tue, 23 Jun 2020 18:55:49 +0200
Message-Id: <20200623165550.45835-5-jacopo@jmondi.org>
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

Adds vblank control to allow for frame rate control.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 46 +++++++++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 3467a8090b38d..209218fb073d6 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -50,6 +50,8 @@
 #define OV5647_REG_AEC_AGC		0x3503
 #define OV5647_REG_GAIN_HI		0x350a
 #define OV5647_REG_GAIN_LO		0x350b
+#define OV5647_REG_VTS_HI		0x380e
+#define OV5647_REG_VTS_LO		0x380f
 #define OV5647_REG_FRAME_OFF_NUMBER	0x4202
 #define OV5647_REG_MIPI_CTRL00		0x4800
 #define OV5647_REG_MIPI_CTRL14		0x4814
@@ -68,6 +70,9 @@
 #define OV5647_PIXEL_ARRAY_WIDTH	2592U
 #define OV5647_PIXEL_ARRAY_HEIGHT	1944U
 
+#define OV5647_VBLANK_MIN		4
+#define OV5647_VTS_MAX			32767
+
 struct regval_list {
 	u16 addr;
 	u8 data;
@@ -78,6 +83,7 @@ struct ov5647_mode {
 	struct v4l2_rect		crop;
 	u64				pixel_rate;
 	int				hts;
+	int				vts;
 	struct regval_list		*reg_list;
 	unsigned int			num_regs;
 };
@@ -101,6 +107,7 @@ struct ov5647 {
 	struct ov5647_mode		*current_mode;
 	struct v4l2_ctrl		*pixel_rate;
 	struct v4l2_ctrl		*hblank;
+	struct v4l2_ctrl		*vblank;
 };
 
 static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
@@ -152,8 +159,6 @@ static struct regval_list ov5647_640x480_sbggr8[] = {
 	{0x3b07, 0x0c},
 	{0x380c, 0x07},
 	{0x380d, 0x68},
-	{0x380e, 0x03},
-	{0x380f, 0xd8},
 	{0x3814, 0x31},
 	{0x3815, 0x31},
 	{0x3708, 0x64},
@@ -589,6 +594,7 @@ static struct ov5647_mode ov5647_sbggr8_modes[] = {
 		},
 		.pixel_rate	= 77291670,
 		.hts		= 1896,
+		.vts		= 0x3d8,
 		.reg_list	= ov5647_640x480_sbggr8,
 		.num_regs	= ARRAY_SIZE(ov5647_640x480_sbggr8)
 	},
@@ -612,6 +618,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
 		},
 		.pixel_rate	= 87500000,
 		.hts		= 2844,
+		.vts		= 0x7b0,
 		.reg_list	= ov5647_2592x1944_sbggr10,
 		.num_regs	= ARRAY_SIZE(ov5647_2592x1944_sbggr10)
 	},
@@ -632,6 +639,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
 		},
 		.pixel_rate	= 81666700,
 		.hts		= 2416,
+		.vts		= 0x450,
 		.reg_list	= ov5647_1080p30_sbggr10,
 		.num_regs	= ARRAY_SIZE(ov5647_1080p30_sbggr10)
 	},
@@ -652,6 +660,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
 		},
 		.pixel_rate	= 81666700,
 		.hts		= 1896,
+		.vts		= 0x59b,
 		.reg_list	= ov5647_2x2binned_sbggr10,
 		.num_regs	= ARRAY_SIZE(ov5647_2x2binned_sbggr10)
 	},
@@ -672,6 +681,7 @@ static struct ov5647_mode ov5647_sbggr10_modes[] = {
 		},
 		.pixel_rate	= 55000000,
 		.hts		= 1852,
+		.vts		= 0x1f8,
 		.reg_list	= ov5647_640x480_sbggr10,
 		.num_regs	= ARRAY_SIZE(ov5647_640x480_sbggr10)
 	},
@@ -695,6 +705,22 @@ static const struct ov5647_format_list ov5647_formats[] = {
 #define OV5647_DEFAULT_MODE	(&ov5647_formats[0].modes[0])
 #define OV5647_DEFAULT_FORMAT	(ov5647_formats[0].modes[0].format)
 
+static int ov5647_write16(struct v4l2_subdev *sd, u16 reg, u16 val)
+{
+	unsigned char data[4] = { reg >> 8, reg & 0xff, val >> 8, val & 0xff};
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	int ret;
+
+	ret = i2c_master_send(client, data, 4);
+	if (ret < 0) {
+		dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
+			__func__, reg);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
 {
 	unsigned char data[3] = { reg >> 8, reg & 0xff, val};
@@ -1116,6 +1142,11 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 	hblank = mode->hts - mode->format.width;
 	__v4l2_ctrl_modify_range(sensor->hblank, hblank, hblank, 1, hblank);
 
+	__v4l2_ctrl_modify_range(sensor->vblank, OV5647_VBLANK_MIN,
+				 OV5647_VTS_MAX - mode->format.height,
+				 1, mode->vts - mode->format.height);
+	__v4l2_ctrl_s_ctrl(sensor->vblank, mode->vts - mode->format.height);
+
 	*fmt = mode->format;
 	mutex_unlock(&sensor->lock);
 
@@ -1323,6 +1354,9 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_HBLANK:
 		/* Read-only, but we adjust it based on mode. */
 		return 0;
+	case V4L2_CID_VBLANK:
+		return ov5647_write16(sd, OV5647_REG_VTS_HI,
+				      sensor->mode->format.height + ctrl->val);
 	default:
 		dev_info(&client->dev,
 			 "Control (id:0x%x, val:0x%x) not supported\n",
@@ -1342,7 +1376,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
 	int hblank;
 
-	v4l2_ctrl_handler_init(&sensor->ctrls, 7);
+	v4l2_ctrl_handler_init(&sensor->ctrls, 8);
 
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
@@ -1381,6 +1415,12 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 		goto handler_free;
 	sensor->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
+	sensor->vblank = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
+					   V4L2_CID_VBLANK, OV5647_VBLANK_MIN,
+					   OV5647_VTS_MAX - sensor->mode->format.height,
+					   1, sensor->mode->vts -
+					      sensor->mode->format.height);
+
 	if (sensor->ctrls.error)
 		goto handler_free;
 
-- 
2.27.0

