Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD962057B9
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 18:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733231AbgFWQqi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 12:46:38 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:49549 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733145AbgFWQqQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 12:46:16 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 030E0100006;
        Tue, 23 Jun 2020 16:46:07 +0000 (UTC)
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
Subject: [PATCH 16/25] media: ov5647: Add support for get_selection()
Date:   Tue, 23 Jun 2020 18:49:08 +0200
Message-Id: <20200623164911.45147-1-jacopo@jmondi.org>
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

Support the get_selection() pad operation to report the device
full pixel array size, the currently applied analogue crop rectangle and
the active pixel array dimensions.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 95 ++++++++++++++++++++++++++++----------
 1 file changed, 71 insertions(+), 24 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index a801ed0249aad..3757f0b10fe93 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -59,25 +59,14 @@
 #define VAL_TERM 0xfe
 #define REG_DLY  0xffff
 
-#define OV5647_ROW_START		0x01
-#define OV5647_ROW_START_MIN		0
-#define OV5647_ROW_START_MAX		2004
-#define OV5647_ROW_START_DEF		54
-
-#define OV5647_COLUMN_START		0x02
-#define OV5647_COLUMN_START_MIN		0
-#define OV5647_COLUMN_START_MAX		2750
-#define OV5647_COLUMN_START_DEF		16
-
-#define OV5647_WINDOW_HEIGHT		0x03
-#define OV5647_WINDOW_HEIGHT_MIN	2
-#define OV5647_WINDOW_HEIGHT_MAX	2006
-#define OV5647_WINDOW_HEIGHT_DEF	1944
-
-#define OV5647_WINDOW_WIDTH		0x04
-#define OV5647_WINDOW_WIDTH_MIN		2
-#define OV5647_WINDOW_WIDTH_MAX		2752
-#define OV5647_WINDOW_WIDTH_DEF		2592
+/* OV5647 native and active pixel array size */
+#define OV5647_NATIVE_WIDTH		2624U
+#define OV5647_NATIVE_HEIGHT		1956U
+
+#define OV5647_PIXEL_ARRAY_LEFT		16U
+#define OV5647_PIXEL_ARRAY_TOP		16U
+#define OV5647_PIXEL_ARRAY_WIDTH	2592U
+#define OV5647_PIXEL_ARRAY_HEIGHT	1944U
 
 struct regval_list {
 	u16 addr;
@@ -86,6 +75,7 @@ struct regval_list {
 
 struct ov5647_mode {
 	struct v4l2_mbus_framefmt	format;
+	struct v4l2_rect		crop;
 	struct regval_list		*reg_list;
 	unsigned int			num_regs;
 };
@@ -224,6 +214,12 @@ static struct ov5647_mode ov5647_8bit_modes[] = {
 			.width		= 640,
 			.height		= 480
 		},
+		.crop = {
+			.left		= 0,
+			.top		= 0,
+			.width		= 1280,
+			.height		= 960,
+		},
 		.reg_list	= ov5647_640x480,
 		.num_regs	= ARRAY_SIZE(ov5647_640x480)
 	},
@@ -412,7 +408,7 @@ static int set_sw_standby(struct v4l2_subdev *sd, bool standby)
 static int ov5647_sensor_power(struct v4l2_subdev *sd, int on)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct ov5647 *ov5647 = to_state(sd);
+	struct ov5647 *sensor = to_sensor(sd);
 	int ret = 0;
 
 	mutex_lock(&sensor->lock);
@@ -507,6 +503,20 @@ static const struct v4l2_subdev_core_ops ov5647_subdev_core_ops = {
 #endif
 };
 
+static const struct v4l2_rect *
+__ov5647_get_pad_crop(struct ov5647 *ov5647, struct v4l2_subdev_pad_config *cfg,
+		      unsigned int pad, enum v4l2_subdev_format_whence which)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		return v4l2_subdev_get_try_crop(&ov5647->sd, cfg, pad);
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return &ov5647->mode->crop;
+	}
+
+	return NULL;
+}
+
 static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct ov5647 *sensor = to_sensor(sd);
@@ -577,11 +587,48 @@ static int ov5647_set_get_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ov5647_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP: {
+		struct ov5647 *sensor = to_sensor(sd);
+
+		mutex_lock(&sensor->lock);
+		sel->r = *__ov5647_get_pad_crop(sensor, cfg, sel->pad,
+						sel->which);
+		mutex_unlock(&sensor->lock);
+
+		return 0;
+	}
+
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = OV5647_NATIVE_WIDTH;
+		sel->r.height = OV5647_NATIVE_HEIGHT;
+
+		return 0;
+
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r.top = OV5647_PIXEL_ARRAY_TOP;
+		sel->r.left = OV5647_PIXEL_ARRAY_LEFT;
+		sel->r.width = OV5647_PIXEL_ARRAY_WIDTH;
+		sel->r.height = OV5647_PIXEL_ARRAY_HEIGHT;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 static const struct v4l2_subdev_pad_ops ov5647_subdev_pad_ops = {
 	.enum_mbus_code		= ov5647_enum_mbus_code,
 	.enum_frame_size	= ov5647_enum_frame_size,
 	.set_fmt		= ov5647_set_get_fmt,
 	.get_fmt		= ov5647_set_get_fmt,
+	.get_selection		= ov5647_get_selection,
 };
 
 static const struct v4l2_subdev_ops ov5647_subdev_ops = {
@@ -626,10 +673,10 @@ static int ov5647_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	struct v4l2_mbus_framefmt *format = v4l2_subdev_get_try_format(sd, fh->pad, 0);
 	struct v4l2_rect *crop = v4l2_subdev_get_try_crop(sd, fh->pad, 0);
 
-	crop->left = OV5647_COLUMN_START_DEF;
-	crop->top = OV5647_ROW_START_DEF;
-	crop->width = OV5647_WINDOW_WIDTH_DEF;
-	crop->height = OV5647_WINDOW_HEIGHT_DEF;
+	crop->left = OV5647_PIXEL_ARRAY_LEFT;
+	crop->top = OV5647_PIXEL_ARRAY_TOP;
+	crop->width = OV5647_PIXEL_ARRAY_WIDTH;
+	crop->height = OV5647_PIXEL_ARRAY_HEIGHT;
 
 	*format = OV5647_DEFAULT_FORMAT;
 
-- 
2.27.0

