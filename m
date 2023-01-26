Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01F0667CB3A
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 13:47:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236432AbjAZMri (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 07:47:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236606AbjAZMrT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 07:47:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB896E40F
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 04:47:10 -0800 (PST)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2B68149C;
        Thu, 26 Jan 2023 13:46:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674737218;
        bh=F6jCWMrAui85RLSgfLlMIj7v2PgU9ScllPifAqQym5w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y/3WnTGwfOmQ57OthG3kAb5djwncuDLt4XblSaViaS9vdVt21czD+u7+vKEUoFiZS
         Bk7LkHRHPaKY/GPjpcJPuAUDagsE4hidQB9MbocXMD+Jp8wr1AVKrlLZhnCUXl9m54
         i57ta6u7nJ0Oqcm722thhrXtvSkfZq1jWg87LrhA=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Subject: [PATCH v5 8/9] media: i2c: ov5670: Add .get_selection() support
Date:   Thu, 26 Jan 2023 13:46:31 +0100
Message-Id: <20230126124632.45842-9-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126124632.45842-1-jacopo.mondi@ideasonboard.com>
References: <20230126124632.45842-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_PDS_OTHER_BAD_TLD autolearn=ham autolearn_force=no version=3.4.6
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
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5670.c | 89 +++++++++++++++++++++++++++++++++++---
 1 file changed, 83 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 8f4350898b36..8655993ee9b0 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -74,6 +74,10 @@
 #define OV5670_REG_VALUE_16BIT		2
 #define OV5670_REG_VALUE_24BIT		3
 
+/* Pixel Array */
+#define OV5670_NATIVE_WIDTH		2624
+#define OV5670_NATIVE_HEIGHT		1980
+
 /* Initial number of frames to skip to avoid possible garbage */
 #define OV5670_NUM_OF_SKIP_FRAMES	2
 
@@ -116,10 +120,25 @@ struct ov5670_mode {
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
@@ -1767,66 +1786,73 @@ static const struct ov5670_mode supported_modes[] = {
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
 
@@ -2167,6 +2193,7 @@ static int ov5670_init_cfg(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *fmt =
 				v4l2_subdev_get_try_format(sd, state, 0);
 	const struct ov5670_mode *default_mode = &supported_modes[0];
+	struct v4l2_rect *crop = v4l2_subdev_get_try_crop(sd, state, 0);
 
 	fmt->width = default_mode->width;
 	fmt->height = default_mode->height;
@@ -2177,6 +2204,8 @@ static int ov5670_init_cfg(struct v4l2_subdev *sd,
 	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
 	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SRGB);
 
+	*crop = *default_mode->analog_crop;
+
 	return 0;
 }
 
@@ -2505,6 +2534,52 @@ static const struct v4l2_subdev_core_ops ov5670_core_ops = {
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
@@ -2515,6 +2590,8 @@ static const struct v4l2_subdev_pad_ops ov5670_pad_ops = {
 	.get_fmt = ov5670_get_pad_format,
 	.set_fmt = ov5670_set_pad_format,
 	.enum_frame_size = ov5670_enum_frame_size,
+	.get_selection = ov5670_get_selection,
+	.set_selection = ov5670_get_selection,
 };
 
 static const struct v4l2_subdev_sensor_ops ov5670_sensor_ops = {
-- 
2.39.0

