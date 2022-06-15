Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 325BD54CC72
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 17:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344978AbiFOPPp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 11:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345078AbiFOPPh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 11:15:37 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D362E6BC
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 08:15:34 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id EFE05240016;
        Wed, 15 Jun 2022 15:15:30 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     dave.stevenson@raspberrypi.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>, david.plowman@raspberrypi.com,
        laurent.pinchart@ideasonboard.com,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 3/5] media: ov5647: Add 8 bit SGBRG8 full size mode
Date:   Wed, 15 Jun 2022 17:14:55 +0200
Message-Id: <20220615151457.415038-4-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615151457.415038-1-jacopo@jmondi.org>
References: <20220615151457.415038-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VGA 8 bpp mode was removed in commit 38c223081815 ("media: ov5647:
Remove 640x480 SBGGR8 mode") as it hangs the sensor and no streaming
was possible.

The Renesas BSP rcar-4.1.0 re-introduces full-size SBGGR8 mode in patch
e95242f52cac ("media: ov5647: Add 2592x1944 8-bit SBGGR mode") but again
the mode as-is does hang and does not provide any frame when tested on a
raspberry pi.

Comparing the register table for the 10 bit full-size mode and the
register table for the there introduced 8 bit full size mode, the main
difference is in the value of register 0x3034, documented as:

0x3034: Bit[7]:   Not used
	Bit[6:4]: pll_charge_pump
	Bit[3:0]: mipi_bit_mode
		  0000: 8 bit mode
		  0001: 10 bit mode
		  Others: Reserved to future use

However the value currently assigned to the register in all 10 bits
modes contradicts the register description (0x3034=0x1a) suggesting that
the documentation is possibly wrong and the lower and higher 4 bits are
actually swapped.

In facts, the 8 bits mode as added in the BSP commit assigns to register
0x3034 the value 0x08, causing the sensor to hang.

This patch uses for the register the same value as the 10 bits mode with
BIT(4) cleared, resulting in correct streaming operations with the
expected 15 FPS frame rate.

pi@raspberrypi:~ $ v4l2-ctl --get-subdev-fmt pad=0 -d /dev/v4l-subdev0
pi@raspberrypi:~ $ yavta -s2592x1944 -fSGBRG8 --capture=10 --skip=7 -F /dev/video0
...
Captured 10 frames in 0.631383 seconds (15.838237 fps, 79806470.803431 B/s).
...

However, the images as captured from the raspberry pi are completely
black suggesting gain or exposure time should probably be tuned
differently. It is anyway worth to re-introduce the mode as the sensor
seems to stream correctly.

No regressions detected when testing the existing 10 bits mode.

Based on a patch from:
Valentine Barshak <valentine.barshak@cogentembedded.com>
in Renesas R-Car 4.1.0 BSP.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 204 ++++++++++++++++++++++++++++++++++---
 1 file changed, 189 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index c292e5d09eab..e0a693640661 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -493,7 +493,102 @@ static struct regval_list ov5647_640x480_10bpp[] = {
 	{0x0100, 0x01},
 };
 
-static const struct ov5647_mode ov5647_modes[] = {
+static struct regval_list ov5647_2592x1944_8bpp[] = {
+	{0x0100, 0x00},
+	{0x0103, 0x01},
+	{0x3034, 0x0a},
+	{0x3035, 0x21},
+	{0x3036, 0x69},
+	{0x303c, 0x11},
+	{0x3106, 0xf5},
+	{0x3821, 0x00},
+	{0x3820, 0x00},
+	{0x3827, 0xec},
+	{0x370c, 0x03},
+	{0x3612, 0x5b},
+	{0x3618, 0x04},
+	{0x5000, 0x06},
+	{0x5002, 0x41},
+	{0x5003, 0x08},
+	{0x5a00, 0x08},
+	{0x3000, 0x00},
+	{0x3001, 0x00},
+	{0x3002, 0x00},
+	{0x3016, 0x08},
+	{0x3017, 0xe0},
+	{0x3018, 0x44},
+	{0x301c, 0xf8},
+	{0x301d, 0xf0},
+	{0x3a18, 0x00},
+	{0x3a19, 0xf8},
+	{0x3c01, 0x80},
+	{0x3b07, 0x0c},
+	{0x380c, 0x0b},
+	{0x380d, 0x1c},
+	{0x3814, 0x11},
+	{0x3815, 0x11},
+	{0x3708, 0x64},
+	{0x3709, 0x12},
+	{0x3808, 0x0a},
+	{0x3809, 0x20},
+	{0x380a, 0x07},
+	{0x380b, 0x98},
+	{0x3800, 0x00},
+	{0x3801, 0x00},
+	{0x3802, 0x00},
+	{0x3803, 0x00},
+	{0x3804, 0x0a},
+	{0x3805, 0x3f},
+	{0x3806, 0x07},
+	{0x3807, 0xa3},
+	{0x3811, 0x10},
+	{0x3813, 0x06},
+	{0x3630, 0x2e},
+	{0x3632, 0xe2},
+	{0x3633, 0x23},
+	{0x3634, 0x44},
+	{0x3636, 0x06},
+	{0x3620, 0x64},
+	{0x3621, 0xe0},
+	{0x3600, 0x37},
+	{0x3704, 0xa0},
+	{0x3703, 0x5a},
+	{0x3715, 0x78},
+	{0x3717, 0x01},
+	{0x3731, 0x02},
+	{0x370b, 0x60},
+	{0x3705, 0x1a},
+	{0x3f05, 0x02},
+	{0x3f06, 0x10},
+	{0x3f01, 0x0a},
+	{0x3a08, 0x01},
+	{0x3a09, 0x28},
+	{0x3a0a, 0x00},
+	{0x3a0b, 0xf6},
+	{0x3a0d, 0x08},
+	{0x3a0e, 0x06},
+	{0x3a0f, 0x58},
+	{0x3a10, 0x50},
+	{0x3a1b, 0x58},
+	{0x3a1e, 0x50},
+	{0x3a11, 0x60},
+	{0x3a1f, 0x28},
+	{0x4001, 0x02},
+	{0x4004, 0x04},
+	{0x4000, 0x09},
+	{0x4837, 0x19},
+	{0x4800, 0x24},
+	{0x3503, 0x03},
+	{0x5001, 0x00},	/* White balance off */
+	{0x350a, 0x00},	/* Analogue gain [9:8] */
+	{0x350b, 0x20},	/* Analogue gain [7:0] */
+	{0x3500, 0x00},	/* Exposure [19:16] */
+	{0x3501, 0x3e},	/* Exposure [15:8] */
+	{0x3502, 0x80},	/* Exposure [7:0] */
+	{0x0100, 0x01},
+};
+
+static const struct ov5647_mode ov5647_10_bpp_modes[] = {
 	/* 2592x1944 full resolution full FOV 10-bit mode. */
 	{
 		.format = {
@@ -580,9 +675,33 @@ static const struct ov5647_mode ov5647_modes[] = {
 	},
 };
 
+static const struct ov5647_mode ov5647_8_bpp_modes[] = {
+	/* 2592x1944 full resolution full FOV 8-bit mode. */
+	{
+		.format = {
+			.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
+			.colorspace	= V4L2_COLORSPACE_RAW,
+			.field		= V4L2_FIELD_NONE,
+			.width		= 2592,
+			.height		= 1944
+		},
+		.crop = {
+			.left		= OV5647_PIXEL_ARRAY_LEFT,
+			.top		= OV5647_PIXEL_ARRAY_TOP,
+			.width		= 2592,
+			.height		= 1944
+		},
+		.pixel_rate	= 69600000,
+		.hts		= 2844,
+		.vts		= 0x7b0,
+		.reg_list	= ov5647_2592x1944_8bpp,
+		.num_regs	= ARRAY_SIZE(ov5647_2592x1944_8bpp)
+	},
+};
+
 /* Default sensor mode is 2x2 binned 640x480 SBGGR10_1X10. */
-#define OV5647_DEFAULT_MODE	(&ov5647_modes[3])
-#define OV5647_DEFAULT_FORMAT	(ov5647_modes[3].format)
+#define OV5647_DEFAULT_MODE	(&ov5647_10_bpp_modes[3])
+#define OV5647_DEFAULT_FORMAT	(ov5647_10_bpp_modes[3].format)
 
 static int ov5647_write16(struct v4l2_subdev *sd, u16 reg, u16 val)
 {
@@ -922,17 +1041,33 @@ static const struct v4l2_subdev_video_ops ov5647_subdev_video_ops = {
 	.s_stream =		ov5647_s_stream,
 };
 
-static u32 ov5647_get_mbus_code(struct v4l2_subdev *sd)
+static unsigned int ov5647_code_to_bpp(unsigned int code)
+{
+	return code == MEDIA_BUS_FMT_SGBRG8_1X8 ||
+	       code == MEDIA_BUS_FMT_SBGGR8_1X8 ||
+	       code == MEDIA_BUS_FMT_SRGGB8_1X8 ||
+	       code == MEDIA_BUS_FMT_SGRBG8_1X8 ?
+	       8 : 10;
+}
+
+static u32 ov5647_get_mbus_code(struct v4l2_subdev *sd, unsigned int bpp)
 {
 	struct ov5647 *sensor = to_sensor(sd);
 	int index = sensor->hflip->val | (sensor->vflip->val << 1);
 
-	static const u32 codes[4] = {
+	static const u32 codes_10bpp[4] = {
 		MEDIA_BUS_FMT_SGBRG10_1X10,
 		MEDIA_BUS_FMT_SBGGR10_1X10,
 		MEDIA_BUS_FMT_SRGGB10_1X10,
 		MEDIA_BUS_FMT_SGRBG10_1X10
 	};
+	static const u32 codes_8bpp[4] = {
+		MEDIA_BUS_FMT_SGBRG8_1X8,
+		MEDIA_BUS_FMT_SBGGR8_1X8,
+		MEDIA_BUS_FMT_SRGGB8_1X8,
+		MEDIA_BUS_FMT_SGRBG8_1X8
+	};
+	const u32 *codes = bpp == 8 ? codes_8bpp : codes_10bpp;
 
 	return codes[index];
 }
@@ -941,10 +1076,10 @@ static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (code->index > 0)
+	if (code->index > 1)
 		return -EINVAL;
 
-	code->code = ov5647_get_mbus_code(sd);
+	code->code = ov5647_get_mbus_code(sd, code->index == 0 ? 8 : 10);
 
 	return 0;
 }
@@ -954,12 +1089,42 @@ static int ov5647_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	const struct v4l2_mbus_framefmt *fmt;
+	const struct ov5647_mode *modes;
+	unsigned int num_modes;
+
+	switch (fse->code) {
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+		fallthrough;
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+		fallthrough;
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		fallthrough;
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+		fallthrough;
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+		fallthrough;
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+		fallthrough;
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		fallthrough;
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ov5647_code_to_bpp(fse->code) == 10) {
+		modes = ov5647_10_bpp_modes;
+		num_modes = ARRAY_SIZE(ov5647_10_bpp_modes);
+	} else {
+		modes = ov5647_8_bpp_modes;
+		num_modes = ARRAY_SIZE(ov5647_8_bpp_modes);
+	}
 
-	if (fse->code != ov5647_get_mbus_code(sd) ||
-	    fse->index >= ARRAY_SIZE(ov5647_modes))
+	if (fse->index >= num_modes)
 		return -EINVAL;
 
-	fmt = &ov5647_modes[fse->index].format;
+	fmt = &modes[fse->index].format;
 	fse->min_width = fmt->width;
 	fse->max_width = fmt->width;
 	fse->min_height = fmt->height;
@@ -989,7 +1154,7 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
 
 	*fmt = *sensor_format;
 	/* The code we pass back must reflect the current h/vflips. */
-	fmt->code = ov5647_get_mbus_code(sd);
+	fmt->code = ov5647_get_mbus_code(sd, ov5647_code_to_bpp(fmt->code));
 	mutex_unlock(&sensor->lock);
 
 	return 0;
@@ -1001,11 +1166,20 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
 	struct ov5647 *sensor = to_sensor(sd);
+	const struct ov5647_mode *modes;
 	const struct ov5647_mode *mode;
+	unsigned int num_modes;
+
+	if (ov5647_code_to_bpp(format->format.code) == 8) {
+		modes = ov5647_8_bpp_modes;
+		num_modes = ARRAY_SIZE(ov5647_8_bpp_modes);
+	} else {
+		modes = ov5647_10_bpp_modes;
+		num_modes = ARRAY_SIZE(ov5647_10_bpp_modes);
+	}
 
-	mode = v4l2_find_nearest_size(ov5647_modes, ARRAY_SIZE(ov5647_modes),
-				      format.width, format.height,
-				      fmt->width, fmt->height);
+	mode = v4l2_find_nearest_size(modes, num_modes, format.width,
+				      format.height, fmt->width, fmt->height);
 
 	/* Update the sensor mode and apply at it at streamon time. */
 	mutex_lock(&sensor->lock);
@@ -1038,7 +1212,7 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 	}
 	*fmt = mode->format;
 	/* The code we pass back must reflect the current h/vflips. */
-	fmt->code = ov5647_get_mbus_code(sd);
+	fmt->code = ov5647_get_mbus_code(sd, ov5647_code_to_bpp(fmt->code));
 	mutex_unlock(&sensor->lock);
 
 	return 0;
-- 
2.35.1

