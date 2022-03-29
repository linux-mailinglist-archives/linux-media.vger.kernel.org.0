Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81CCF4EAA04
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 11:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234391AbiC2JEw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 05:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234388AbiC2JEv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 05:04:51 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AE0921FC59
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 02:03:08 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id A99A510000B;
        Tue, 29 Mar 2022 09:03:05 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER)
Subject: [PATCH v3 8/8] media: i2c: ov5670: Add .get_selection() support
Date:   Tue, 29 Mar 2022 11:01:33 +0200
Message-Id: <20220329090133.338073-9-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329090133.338073-1-jacopo@jmondi.org>
References: <20220329090133.338073-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>

Add support for the .get_selection() pad operation to the ov5670 sensor
driver.

Report the native sensor size (pixel array), the crop bounds (readable
pixel array area) and the current and default analog crop rectangles.

Currently all driver's modes use an analog crop rectangle of size
[12, 4, 2600, 1952]. Instead of hardcoding the value in the operation
implementation, ad an .analog_crop field to the sensor's modes
definitions, to make sure that if any mode gets added, its crop
rectangle will be defined as well.

While at it re-sort the modes' field definition order to match the
declaration order and initialize the crop rectangle in init_cfg().

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5670.c | 89 +++++++++++++++++++++++++++++++++++---
 1 file changed, 83 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 7f12b053cb0e..3a601e1600e9 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -71,6 +71,10 @@
 #define OV5670_REG_VALUE_16BIT		2
 #define OV5670_REG_VALUE_24BIT		3
 
+/* Pixel Array */
+#define OV5670_NATIVE_WIDTH		2624
+#define OV5670_NATIVE_HEIGHT		1980
+
 /* Initial number of frames to skip to avoid possible garbage */
 #define OV5670_NUM_OF_SKIP_FRAMES	2
 
@@ -113,10 +117,25 @@ struct ov5670_mode {
 	/* Link frequency needed for this resolution */
 	u32 link_freq_index;
 
+	/* Analog crop rectangle */
+	const struct v4l2_rect *analog_crop;
+
 	/* Sensor register settings for this resolution */
 	const struct ov5670_reg_list reg_list;
 };
 
+/*
+ * All the modes supported by the driver are obtained by subsampling the
+ * full pixel array. The below values are reflected in registers from
+ * 03800-0x3807 in the modes register-value tables.
+ */
+static const struct v4l2_rect ov5670_analog_crop = {
+	.left	= 12,
+	.top	= 4,
+	.width	= 2600,
+	.height	= 1952,
+};
+
 static const struct ov5670_reg mipi_data_rate_840mbps[] = {
 	{0x0300, 0x04},
 	{0x0301, 0x00},
@@ -1764,66 +1783,73 @@ static const struct ov5670_mode supported_modes[] = {
 		.height = 1944,
 		.vts_def = OV5670_VTS_30FPS,
 		.vts_min = OV5670_VTS_30FPS,
+		.link_freq_index = OV5670_LINK_FREQ_422MHZ_INDEX,
+		.analog_crop = &ov5670_analog_crop,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_2592x1944_regs),
 			.regs = mode_2592x1944_regs,
 		},
-		.link_freq_index = OV5670_LINK_FREQ_422MHZ_INDEX,
 	},
 	{
 		.width = 1296,
 		.height = 972,
 		.vts_def = OV5670_VTS_30FPS,
 		.vts_min = 996,
+		.link_freq_index = OV5670_LINK_FREQ_422MHZ_INDEX,
+		.analog_crop = &ov5670_analog_crop,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1296x972_regs),
 			.regs = mode_1296x972_regs,
 		},
-		.link_freq_index = OV5670_LINK_FREQ_422MHZ_INDEX,
 	},
 	{
 		.width = 648,
 		.height = 486,
 		.vts_def = OV5670_VTS_30FPS,
 		.vts_min = 516,
+		.link_freq_index = OV5670_LINK_FREQ_422MHZ_INDEX,
+		.analog_crop = &ov5670_analog_crop,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_648x486_regs),
 			.regs = mode_648x486_regs,
 		},
-		.link_freq_index = OV5670_LINK_FREQ_422MHZ_INDEX,
 	},
 	{
 		.width = 2560,
 		.height = 1440,
 		.vts_def = OV5670_VTS_30FPS,
 		.vts_min = OV5670_VTS_30FPS,
+		.link_freq_index = OV5670_LINK_FREQ_422MHZ_INDEX,
+		.analog_crop = &ov5670_analog_crop,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_2560x1440_regs),
 			.regs = mode_2560x1440_regs,
 		},
-		.link_freq_index = OV5670_LINK_FREQ_422MHZ_INDEX,
 	},
 	{
 		.width = 1280,
 		.height = 720,
 		.vts_def = OV5670_VTS_30FPS,
 		.vts_min = 1020,
+
+		.link_freq_index = OV5670_LINK_FREQ_422MHZ_INDEX,
+		.analog_crop = &ov5670_analog_crop,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
 			.regs = mode_1280x720_regs,
 		},
-		.link_freq_index = OV5670_LINK_FREQ_422MHZ_INDEX,
 	},
 	{
 		.width = 640,
 		.height = 360,
 		.vts_def = OV5670_VTS_30FPS,
 		.vts_min = 510,
+		.link_freq_index = OV5670_LINK_FREQ_422MHZ_INDEX,
+		.analog_crop = &ov5670_analog_crop,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_640x360_regs),
 			.regs = mode_640x360_regs,
 		},
-		.link_freq_index = OV5670_LINK_FREQ_422MHZ_INDEX,
 	}
 };
 
@@ -2161,6 +2187,7 @@ static int ov5670_init_cfg(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *fmt =
 				v4l2_subdev_get_try_format(sd, state, 0);
 	const struct ov5670_mode *default_mode = &supported_modes[0];
+	struct v4l2_rect *crop = v4l2_subdev_get_try_crop(sd, state, 0);
 
 	fmt->width = default_mode->width;
 	fmt->height = default_mode->height;
@@ -2171,6 +2198,8 @@ static int ov5670_init_cfg(struct v4l2_subdev *sd,
 	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
 	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SRGB);
 
+	*crop = *default_mode->analog_crop;
+
 	return 0;
 }
 
@@ -2490,6 +2519,52 @@ static const struct v4l2_subdev_core_ops ov5670_core_ops = {
 	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
 };
 
+static const struct v4l2_rect *
+__ov5670_get_pad_crop(struct ov5670 *sensor, struct v4l2_subdev_state *state,
+		      unsigned int pad, enum v4l2_subdev_format_whence which)
+{
+	const struct ov5670_mode *mode = sensor->cur_mode;
+
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		return v4l2_subdev_get_try_crop(&sensor->sd, state, pad);
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return mode->analog_crop;
+	}
+
+	return NULL;
+}
+
+static int ov5670_get_selection(struct v4l2_subdev *subdev,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_selection *sel)
+{
+	struct ov5670 *sensor = to_ov5670(subdev);
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		mutex_lock(&sensor->mutex);
+		sel->r = *__ov5670_get_pad_crop(sensor, state, sel->pad,
+						sel->which);
+		mutex_unlock(&sensor->mutex);
+		break;
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = OV5670_NATIVE_WIDTH;
+		sel->r.height = OV5670_NATIVE_HEIGHT;
+		break;
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r = ov5670_analog_crop;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct v4l2_subdev_video_ops ov5670_video_ops = {
 	.s_stream = ov5670_set_stream,
 };
@@ -2500,6 +2575,8 @@ static const struct v4l2_subdev_pad_ops ov5670_pad_ops = {
 	.get_fmt = ov5670_get_pad_format,
 	.set_fmt = ov5670_set_pad_format,
 	.enum_frame_size = ov5670_enum_frame_size,
+	.get_selection = ov5670_get_selection,
+	.set_selection = ov5670_get_selection,
 };
 
 static const struct v4l2_subdev_sensor_ops ov5670_sensor_ops = {
-- 
2.35.1

