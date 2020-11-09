Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 049012AC171
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 17:54:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730748AbgKIQxF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 11:53:05 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:51777 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730700AbgKIQxF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 11:53:05 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id AA9062000B;
        Mon,  9 Nov 2020 16:53:01 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: [PATCH v3 29/29] media: ov5647: Remove 640x480 SBGGR8 mode
Date:   Mon,  9 Nov 2020 17:49:34 +0100
Message-Id: <20201109164934.134919-30-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109164934.134919-1-jacopo@jmondi.org>
References: <20201109164934.134919-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Capturing in 640x480 SBGGR8_1X8 hangs the system when capturing
with the unicam driver on RaspberryPi 4 platform.

Remove it.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 139 ++-----------------------------------
 1 file changed, 4 insertions(+), 135 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 5235045ef0012..43bebf1f36f8d 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -134,94 +134,6 @@ static const struct regval_list sensor_oe_enable_regs[] = {
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
@@ -583,30 +495,6 @@ static struct regval_list ov5647_640x480_10bpp[] = {
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
 static const struct ov5647_mode ov5647_10bpp_modes[] = {
 	/* 2592x1944 full resolution full FOV 10-bit mode. */
 	{
@@ -695,23 +583,17 @@ static const struct ov5647_mode ov5647_10bpp_modes[] = {
 };
 
 static const struct ov5647_format_list ov5647_formats[] = {
-	{
-		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
-		.modes		= ov5647_8bpp_modes,
-		.num_modes	= ARRAY_SIZE(ov5647_8bpp_modes),
-	},
 	{
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
 		.modes		= ov5647_10bpp_modes,
 		.num_modes	= ARRAY_SIZE(ov5647_10bpp_modes),
 	},
 };
-
 #define OV5647_NUM_FORMATS	(ARRAY_SIZE(ov5647_formats))
 
 /* Default sensor mode is 2x2 binned 640x480 SBGGR10_1X10. */
-#define OV5647_DEFAULT_MODE	(&ov5647_formats[1].modes[3])
-#define OV5647_DEFAULT_FORMAT	(ov5647_formats[1].modes[3].format)
+#define OV5647_DEFAULT_MODE	(&ov5647_formats[0].modes[3])
+#define OV5647_DEFAULT_FORMAT	(ov5647_formats[0].modes[3].format)
 
 static int ov5647_write16(struct v4l2_subdev *sd, u16 reg, u16 val)
 {
@@ -1116,25 +998,12 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt = &format->format;
-	const struct ov5647_mode *ov5647_mode_list;
 	struct ov5647 *sensor = to_sensor(sd);
 	int hblank, exposure_max, exposure_def;
 	const struct ov5647_mode *mode;
-	unsigned int num_modes;
-
-	/*
-	 * Default mbus code MEDIA_BUS_FMT_SBGGR10_1X10 if the requested one
-	 * is not supported.
-	 */
-	if (fmt->code == MEDIA_BUS_FMT_SBGGR8_1X8) {
-		ov5647_mode_list = ov5647_8bpp_modes;
-		num_modes = ARRAY_SIZE(ov5647_8bpp_modes);
-	} else {
-		ov5647_mode_list = ov5647_10bpp_modes;
-		num_modes = ARRAY_SIZE(ov5647_10bpp_modes);
-	}
 
-	mode = v4l2_find_nearest_size(ov5647_mode_list, num_modes,
+	mode = v4l2_find_nearest_size(ov5647_10bpp_modes,
+				      ARRAY_SIZE(ov5647_10bpp_modes),
 				      format.width, format.height,
 				      fmt->width, fmt->height);
 
-- 
2.29.1

