Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2F8E2B9834
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 17:40:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729063AbgKSQiI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 11:38:08 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:41875 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727768AbgKSQiH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 11:38:07 -0500
X-Originating-IP: 93.34.118.233
Received: from localhost.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 54E8FC0003;
        Thu, 19 Nov 2020 16:38:00 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com, Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v4 30/30] media: ov5647: Remove 640x480 SBGGR8 mode
Date:   Thu, 19 Nov 2020 17:37:53 +0100
Message-Id: <20201119163753.793437-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201119161956.756455-1-jacopo@jmondi.org>
References: <20201119161956.756455-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Capturing in 640x480 SBGGR8_1X8 hangs the system when capturing
with the unicam driver on RaspberryPi 4 platform.

Remove it and remove the support for multiple media bus codes in
the driver.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 180 ++-----------------------------------
 1 file changed, 9 insertions(+), 171 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index be40c60ab7ee6..1cefa15729ce3 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -95,12 +95,6 @@ struct ov5647_mode {
 	unsigned int			num_regs;
 };
 
-struct ov5647_format_list {
-	unsigned int			mbus_code;
-	const struct ov5647_mode	*modes;
-	unsigned int			num_modes;
-};
-
 struct ov5647 {
 	struct v4l2_subdev		sd;
 	struct media_pad		pad;
@@ -134,94 +128,6 @@ static const struct regval_list sensor_oe_enable_regs[] = {
 	{0x3002, 0xe4},
 };
 
-static const struct regval_list ov5647_640x480_8bpp[] = {
-	{0x0100, 0x00},
-	{0x0103, 0x01},
-	{0x3034, 0x08},
-	{0x3035, 0x21},
-	{0x3036, 0x46},
-	{0x303c, 0x11},
-	{0x3106, 0xf5},
-	{0x3821, 0x07},
-	{0x3820, 0x41},
-	{0x3827, 0xec},
-	{0x370c, 0x0f},
-	{0x3612, 0x59},
-	{0x3618, 0x00},
-	{0x5000, 0x06},
-	{0x5002, 0x41},
-	{0x5003, 0x08},
-	{0x5a00, 0x08},
-	{0x3000, 0x00},
-	{0x3001, 0x00},
-	{0x3002, 0x00},
-	{0x3016, 0x08},
-	{0x3017, 0xe0},
-	{0x3018, 0x44},
-	{0x301c, 0xf8},
-	{0x301d, 0xf0},
-	{0x3a18, 0x00},
-	{0x3a19, 0xf8},
-	{0x3c01, 0x80},
-	{0x3b07, 0x0c},
-	{0x380c, 0x07},
-	{0x380d, 0x68},
-	{0x3814, 0x31},
-	{0x3815, 0x31},
-	{0x3708, 0x64},
-	{0x3709, 0x52},
-	{0x3808, 0x02},
-	{0x3809, 0x80},
-	{0x380a, 0x01},
-	{0x380b, 0xe0},
-	{0x3801, 0x00},
-	{0x3802, 0x00},
-	{0x3803, 0x00},
-	{0x3804, 0x0a},
-	{0x3805, 0x3f},
-	{0x3806, 0x07},
-	{0x3807, 0xa1},
-	{0x3811, 0x08},
-	{0x3813, 0x02},
-	{0x3630, 0x2e},
-	{0x3632, 0xe2},
-	{0x3633, 0x23},
-	{0x3634, 0x44},
-	{0x3636, 0x06},
-	{0x3620, 0x64},
-	{0x3621, 0xe0},
-	{0x3600, 0x37},
-	{0x3704, 0xa0},
-	{0x3703, 0x5a},
-	{0x3715, 0x78},
-	{0x3717, 0x01},
-	{0x3731, 0x02},
-	{0x370b, 0x60},
-	{0x3705, 0x1a},
-	{0x3f05, 0x02},
-	{0x3f06, 0x10},
-	{0x3f01, 0x0a},
-	{0x3a08, 0x01},
-	{0x3a09, 0x27},
-	{0x3a0a, 0x00},
-	{0x3a0b, 0xf6},
-	{0x3a0d, 0x04},
-	{0x3a0e, 0x03},
-	{0x3a0f, 0x58},
-	{0x3a10, 0x50},
-	{0x3a1b, 0x58},
-	{0x3a1e, 0x50},
-	{0x3a11, 0x60},
-	{0x3a1f, 0x28},
-	{0x4001, 0x02},
-	{0x4004, 0x02},
-	{0x4000, 0x09},
-	{0x4837, 0x24},
-	{0x4050, 0x6e},
-	{0x4051, 0x8f},
-	{0x0100, 0x01},
-};
-
 static struct regval_list ov5647_2592x1944_10bpp[] = {
 	{0x0100, 0x00},
 	{0x0103, 0x01},
@@ -583,31 +489,7 @@ static struct regval_list ov5647_640x480_10bpp[] = {
 	{0x0100, 0x01},
 };
 
-static const struct ov5647_mode ov5647_8bpp_modes[] = {
-	/* 8-bit VGA mode: Uncentred crop 2x2 binned 1296x972 image. */
-	{
-		.format	= {
-			.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
-			.colorspace	= V4L2_COLORSPACE_SRGB,
-			.field		= V4L2_FIELD_NONE,
-			.width		= 640,
-			.height		= 480
-		},
-		.crop = {
-			.left		= OV5647_PIXEL_ARRAY_LEFT,
-			.top		= OV5647_PIXEL_ARRAY_TOP,
-			.width		= 1280,
-			.height		= 960,
-		},
-		.pixel_rate	= 77291670,
-		.hts		= 1896,
-		.vts		= 0x3d8,
-		.reg_list	= ov5647_640x480_8bpp,
-		.num_regs	= ARRAY_SIZE(ov5647_640x480_8bpp)
-	},
-};
-
-static const struct ov5647_mode ov5647_10bpp_modes[] = {
+static const struct ov5647_mode ov5647_modes[] = {
 	/* 2592x1944 full resolution full FOV 10-bit mode. */
 	{
 		.format = {
@@ -694,24 +576,9 @@ static const struct ov5647_mode ov5647_10bpp_modes[] = {
 	},
 };
 
-static const struct ov5647_format_list ov5647_formats[] = {
-	{
-		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
-		.modes		= ov5647_8bpp_modes,
-		.num_modes	= ARRAY_SIZE(ov5647_8bpp_modes),
-	},
-	{
-		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
-		.modes		= ov5647_10bpp_modes,
-		.num_modes	= ARRAY_SIZE(ov5647_10bpp_modes),
-	},
-};
-
-#define OV5647_NUM_FORMATS	(ARRAY_SIZE(ov5647_formats))
-
 /* Default sensor mode is 2x2 binned 640x480 SBGGR10_1X10. */
-#define OV5647_DEFAULT_MODE	(&ov5647_formats[1].modes[3])
-#define OV5647_DEFAULT_FORMAT	(ov5647_formats[1].modes[3].format)
+#define OV5647_DEFAULT_MODE	(&ov5647_modes[3])
+#define OV5647_DEFAULT_FORMAT	(ov5647_modes[3].format)
 
 static int ov5647_write16(struct v4l2_subdev *sd, u16 reg, u16 val)
 {
@@ -1053,10 +920,10 @@ static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_pad_config *cfg,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (code->index >= OV5647_NUM_FORMATS)
+	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = ov5647_formats[code->index].mbus_code;
+	code->code = MEDIA_BUS_FMT_SBGGR10_1X10;
 
 	return 0;
 }
@@ -1066,19 +933,12 @@ static int ov5647_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	const struct v4l2_mbus_framefmt *fmt;
-	unsigned int i = 0;
 
-	for (; i < OV5647_NUM_FORMATS; ++i) {
-		if (ov5647_formats[i].mbus_code == fse->code)
-			break;
-	}
-	if (i == OV5647_NUM_FORMATS)
+	if (fse->code != MEDIA_BUS_FMT_SBGGR10_1X10 ||
+	    fse->index >= ARRAY_SIZE(ov5647_modes))
 		return -EINVAL;
 
-	if (fse->index >= ov5647_formats[i].num_modes)
-		return -EINVAL;
-
-	fmt = &ov5647_formats[i].modes[fse->index].format;
+	fmt = &ov5647_modes[fse->index].format;
 	fse->min_width = fmt->width;
 	fse->max_width = fmt->width;
 	fse->min_height = fmt->height;
@@ -1116,32 +976,10 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
-	const struct ov5647_mode *ov5647_mode_list;
 	struct ov5647 *sensor = to_sensor(sd);
-
 	const struct ov5647_mode *mode;
-	unsigned int num_modes;
-	unsigned int i;
-
-	for (i = 0; i < OV5647_NUM_FORMATS; ++i) {
-		if (ov5647_formats[i].mbus_code != fmt->code)
-			continue;
-
-		ov5647_mode_list = ov5647_formats[i].modes;
-		num_modes = ov5647_formats[i].num_modes;
-		break;
-	}
-
-	/*
-	 * Default mbus code MEDIA_BUS_FMT_SBGGR10_1X10 if the requested one is
-	 * not supported.
-	 */
-	if (i == OV5647_NUM_FORMATS) {
-		ov5647_mode_list = ov5647_10bpp_modes;
-		num_modes = ARRAY_SIZE(ov5647_10bpp_modes);
-	}
 
-	mode = v4l2_find_nearest_size(ov5647_mode_list, num_modes,
+	mode = v4l2_find_nearest_size(ov5647_modes, ARRAY_SIZE(ov5647_modes),
 				      format.width, format.height,
 				      fmt->width, fmt->height);
 
-- 
2.29.1

