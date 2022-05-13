Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46EFA5263C0
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351689AbiEMORN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:17:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351536AbiEMOQz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:16:55 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1557087234
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:16:43 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id F2E2A20012;
        Fri, 13 May 2022 14:16:41 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     sakari.ailus@iki.fi, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v7 13/28] media: ov5640: Remove duplicated mode settings
Date:   Fri, 13 May 2022 16:14:01 +0200
Message-Id: <20220513141416.120552-14-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513141416.120552-1-jacopo@jmondi.org>
References: <20220513141416.120552-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The register tables for all resolutions smaller than 720p are now
identical.

Remove the duplicated ones and create a single ov5640_setting_low_res[]
register table.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 120 +++++--------------------------------
 1 file changed, 15 insertions(+), 105 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index d9b3e2a9aea7..0cab0f83c223 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -484,7 +484,7 @@ static const struct reg_value ov5640_init_setting_30fps_VGA[] = {
 	{0x3a1f, 0x14, 0, 0}, {0x3008, 0x02, 0, 0}, {0x3c00, 0x04, 0, 300},
 };
 
-static const struct reg_value ov5640_setting_QQVGA_160_120[] = {
+static const struct reg_value ov5640_setting_low_res[] = {
 	{0x3c07, 0x08, 0, 0},
 	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
 	{0x3814, 0x31, 0, 0},
@@ -498,96 +498,6 @@ static const struct reg_value ov5640_setting_QQVGA_160_120[] = {
 	{0x4407, 0x04, 0, 0}, {0x5001, 0xa3, 0, 0},
 };
 
-static const struct reg_value ov5640_setting_QCIF_176_144[] = {
-	{0x3c07, 0x08, 0, 0},
-	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
-	{0x3814, 0x31, 0, 0},
-	{0x3815, 0x31, 0, 0},
-	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
-	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
-	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
-	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
-	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
-	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
-	{0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
-	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
-};
-
-static const struct reg_value ov5640_setting_QVGA_320_240[] = {
-	{0x3c07, 0x08, 0, 0},
-	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
-	{0x3814, 0x31, 0, 0},
-	{0x3815, 0x31, 0, 0},
-	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
-	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
-	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
-	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
-	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
-	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
-	{0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
-	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
-};
-
-static const struct reg_value ov5640_setting_VGA_640_480[] = {
-	{0x3c07, 0x08, 0, 0},
-	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
-	{0x3814, 0x31, 0, 0},
-	{0x3815, 0x31, 0, 0},
-	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
-	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
-	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
-	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
-	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
-	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
-	{0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
-	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
-};
-
-static const struct reg_value ov5640_setting_NTSC_720_480[] = {
-	{0x3c07, 0x08, 0, 0},
-	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
-	{0x3814, 0x31, 0, 0},
-	{0x3815, 0x31, 0, 0},
-	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
-	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
-	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
-	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
-	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
-	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
-	{0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
-	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
-};
-
-static const struct reg_value ov5640_setting_PAL_720_576[] = {
-	{0x3c07, 0x08, 0, 0},
-	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
-	{0x3814, 0x31, 0, 0},
-	{0x3815, 0x31, 0, 0},
-	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
-	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
-	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
-	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
-	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
-	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
-	{0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
-	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
-};
-
-static const struct reg_value ov5640_setting_XGA_1024_768[] = {
-	{0x3c07, 0x08, 0, 0},
-	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
-	{0x3814, 0x31, 0, 0},
-	{0x3815, 0x31, 0, 0},
-	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
-	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
-	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
-	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
-	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
-	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
-	{0x4407, 0x04, 0, 0}, {0x460b, 0x35, 0, 0}, {0x460c, 0x22, 0, 0},
-	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
-};
-
 static const struct reg_value ov5640_setting_720P_1280_720[] = {
 	{0x3c07, 0x07, 0, 0},
 	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
@@ -728,8 +638,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 			.htot		= 1896,
 			.vblank_def	= 864,
 		},
-		.reg_data	= ov5640_setting_QQVGA_160_120,
-		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QQVGA_160_120),
+		.reg_data	= ov5640_setting_low_res,
+		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
 		.max_fps	= OV5640_30_FPS
 	}, {
 		/* 176x144 */
@@ -772,8 +682,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 			.htot		= 1896,
 			.vblank_def	= 840,
 		},
-		.reg_data	= ov5640_setting_QCIF_176_144,
-		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QCIF_176_144),
+		.reg_data	= ov5640_setting_low_res,
+		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
 		.max_fps	= OV5640_30_FPS
 	}, {
 		/* 320x240 */
@@ -816,8 +726,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 			.htot		= 1896,
 			.vblank_def	= 744,
 		},
-		.reg_data	= ov5640_setting_QVGA_320_240,
-		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QVGA_320_240),
+		.reg_data	= ov5640_setting_low_res,
+		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
 		.max_fps	= OV5640_30_FPS
 	}, {
 		/* 640x480 */
@@ -860,8 +770,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 			.htot		= 1896,
 			.vblank_def	= 600,
 		},
-		.reg_data	= ov5640_setting_VGA_640_480,
-		.reg_data_size	= ARRAY_SIZE(ov5640_setting_VGA_640_480),
+		.reg_data	= ov5640_setting_low_res,
+		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
 		.max_fps	= OV5640_60_FPS
 	}, {
 		/* 720x480 */
@@ -903,8 +813,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 			.htot		= 1896,
 			.vblank_def	= 504,
 		},
-		.reg_data	= ov5640_setting_NTSC_720_480,
-		.reg_data_size	= ARRAY_SIZE(ov5640_setting_NTSC_720_480),
+		.reg_data	= ov5640_setting_low_res,
+		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
 		.max_fps	= OV5640_30_FPS
 	}, {
 		/* 720x576 */
@@ -946,8 +856,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 			.htot		= 1896,
 			.vblank_def	= 408,
 		},
-		.reg_data	= ov5640_setting_PAL_720_576,
-		.reg_data_size	= ARRAY_SIZE(ov5640_setting_PAL_720_576),
+		.reg_data	= ov5640_setting_low_res,
+		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
 		.max_fps	= OV5640_30_FPS
 	}, {
 		/* 1024x768 */
@@ -988,8 +898,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 			.htot		= 1896,
 			.vblank_def	= 312,
 		},
-		.reg_data	= ov5640_setting_XGA_1024_768,
-		.reg_data_size	= ARRAY_SIZE(ov5640_setting_XGA_1024_768),
+		.reg_data	= ov5640_setting_low_res,
+		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
 		.max_fps	= OV5640_30_FPS
 	}, {
 		/* 1280x720 */
-- 
2.35.1

