Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89BA854CC69
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 17:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346864AbiFOPPq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 11:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346898AbiFOPPl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 11:15:41 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD2F3D1E2
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 08:15:37 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 70F6D24001A;
        Wed, 15 Jun 2022 15:15:33 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     dave.stevenson@raspberrypi.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>, david.plowman@raspberrypi.com,
        laurent.pinchart@ideasonboard.com,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 4/5] media: ov5647: Reintroduce 8 bit 640x480
Date:   Wed, 15 Jun 2022 17:14:56 +0200
Message-Id: <20220615151457.415038-5-jacopo@jmondi.org>
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
Remove 640x480 SBGGR8 mode") as it hangs the sensor and no streaming was
possible.

This is a partial revert of that commit as it re-introduces the mode
with the value of register 0x3034 modified.

Streaming operations are correctly working
pi@raspberrypi:~ $ v4l2-ctl --get-subdev-fmt pad=0 -d /dev/v4l-subdev0
pi@raspberrypi:~ $ yavta -s640x480 -fSGBRG8 --capture=10 --skip=7 -F /dev/video0
...
Captured 10 frames in 0.319589 seconds (31.290098 fps, 9612318.005293 B/s).
...

Frames when captured on a raspberry pi result in being completely
black. It is worth re-introducing the mode as compared to the previous
version it does not hang the sensor anymore and can be used for further
improvements.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 109 +++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index e0a693640661..0a3e4acec036 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -588,6 +588,94 @@ static struct regval_list ov5647_2592x1944_8bpp[] = {
 	{0x0100, 0x01},
 };
 
+static const struct regval_list ov5647_640x480_8bpp[] = {
+	{0x0100, 0x00},
+	{0x0103, 0x01},
+	{0x3034, 0x0a},
+	{0x3035, 0x21},
+	{0x3036, 0x46},
+	{0x303c, 0x11},
+	{0x3106, 0xf5},
+	{0x3821, 0x01},
+	{0x3820, 0x41},
+	{0x3827, 0xec},
+	{0x370c, 0x0f},
+	{0x3612, 0x59},
+	{0x3618, 0x00},
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
+	{0x380c, 0x07},
+	{0x380d, 0x68},
+	{0x3814, 0x31},
+	{0x3815, 0x31},
+	{0x3708, 0x64},
+	{0x3709, 0x52},
+	{0x3808, 0x02},
+	{0x3809, 0x80},
+	{0x380a, 0x01},
+	{0x380b, 0xe0},
+	{0x3801, 0x00},
+	{0x3802, 0x00},
+	{0x3803, 0x00},
+	{0x3804, 0x0a},
+	{0x3805, 0x3f},
+	{0x3806, 0x07},
+	{0x3807, 0xa1},
+	{0x3811, 0x08},
+	{0x3813, 0x02},
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
+	{0x3a09, 0x27},
+	{0x3a0a, 0x00},
+	{0x3a0b, 0xf6},
+	{0x3a0d, 0x04},
+	{0x3a0e, 0x03},
+	{0x3a0f, 0x58},
+	{0x3a10, 0x50},
+	{0x3a1b, 0x58},
+	{0x3a1e, 0x50},
+	{0x3a11, 0x60},
+	{0x3a1f, 0x28},
+	{0x4001, 0x02},
+	{0x4004, 0x02},
+	{0x4000, 0x09},
+	{0x4837, 0x24},
+	{0x4050, 0x6e},
+	{0x4051, 0x8f},
+	{0x0100, 0x01},
+};
+
 static const struct ov5647_mode ov5647_10_bpp_modes[] = {
 	/* 2592x1944 full resolution full FOV 10-bit mode. */
 	{
@@ -697,6 +785,27 @@ static const struct ov5647_mode ov5647_8_bpp_modes[] = {
 		.reg_list	= ov5647_2592x1944_8bpp,
 		.num_regs	= ARRAY_SIZE(ov5647_2592x1944_8bpp)
 	},
+	/* 8-bit VGA mode: Uncentred crop 2x2 binned 1296x972 image. */
+	{
+		.format = {
+			.code           = MEDIA_BUS_FMT_SBGGR8_1X8,
+			.colorspace     = V4L2_COLORSPACE_SRGB,
+			.field          = V4L2_FIELD_NONE,
+			.width          = 640,
+			.height         = 480
+		},
+		.crop = {
+			.left           = OV5647_PIXEL_ARRAY_LEFT,
+			.top            = OV5647_PIXEL_ARRAY_TOP,
+			.width          = 1280,
+			.height         = 960,
+		},
+		.pixel_rate     = 77291670,
+		.hts            = 1896,
+		.vts            = 0x3d8,
+		.reg_list       = ov5647_640x480_8bpp,
+		.num_regs       = ARRAY_SIZE(ov5647_640x480_8bpp)
+	},
 };
 
 /* Default sensor mode is 2x2 binned 640x480 SBGGR10_1X10. */
-- 
2.35.1

