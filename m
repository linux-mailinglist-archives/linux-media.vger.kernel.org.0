Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFBE24A4989
	for <lists+linux-media@lfdr.de>; Mon, 31 Jan 2022 15:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240510AbiAaOoB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jan 2022 09:44:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235301AbiAaOoA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jan 2022 09:44:00 -0500
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E78C8C061714
        for <linux-media@vger.kernel.org>; Mon, 31 Jan 2022 06:43:59 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 5BC16C000C;
        Mon, 31 Jan 2022 14:43:53 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     slongerbeam@gmail.com
Cc:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        xavier.roumegue@oss.nxp.com, tomi.valkeinen@ideasonboard.com,
        hugues.fruchet@st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
        aford173@gmail.com, festevam@gmail.com,
        eugen.hristev@microchip.com, jbrunet@baylibre.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH 12/21] media: ov5640: Fix durations to comply with FPS
Date:   Mon, 31 Jan 2022 15:44:40 +0100
Message-Id: <20220131144444.129036-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131143245.128089-1-jacopo@jmondi.org>
References: <20220131143245.128089-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that the frame duration can be controlled by tuning the VBLANK
duration, fix all modes to comply with the reported FPS.

All modes run at 30 FPS except for full-resolution mode 2592x1944
which runs at 15FPS.

Tested on a 2 data lanes setup in UYVY and RGB565 modes.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 6eeb50724195..2176fa0b8eae 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -611,8 +611,8 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 			.width	= 160,
 			.height	= 120,
 		},
-		.ppl		= 1896,
-		.vblank_def	= 864,
+		.ppl		= 1600,
+		.vblank_def	= 878,
 		.reg_data	= ov5640_setting_QQVGA_160_120,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QQVGA_160_120),
 		.max_fps	= OV5640_30_FPS
@@ -633,8 +633,8 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 			.width	= 176,
 			.height	= 144,
 		},
-		.ppl		= 1896,
-		.vblank_def	= 840,
+		.ppl		= 1600,
+		.vblank_def	= 854,
 		.reg_data	= ov5640_setting_QCIF_176_144,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QCIF_176_144),
 		.max_fps	= OV5640_30_FPS
@@ -655,8 +655,8 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 			.width	= 320,
 			.height	= 240,
 		},
-		.ppl		= 1896,
-		.vblank_def	= 744,
+		.ppl		= 1600,
+		.vblank_def	= 760,
 		.reg_data	= ov5640_setting_QVGA_320_240,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QVGA_320_240),
 		.max_fps	= OV5640_30_FPS
@@ -677,8 +677,8 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 			.width	= 640,
 			.height	= 480,
 		},
-		.ppl		= 1896,
-		.vblank_def	= 600,
+		.ppl		= 1600,
+		.vblank_def	= 520,
 		.reg_data	= ov5640_setting_VGA_640_480,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_VGA_640_480),
 		.max_fps	= OV5640_60_FPS
@@ -700,7 +700,7 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 			.height	= 480,
 		},
 		.ppl		= 1896,
-		.vblank_def	= 504,
+		.vblank_def	= 1206,
 		.reg_data	= ov5640_setting_NTSC_720_480,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_NTSC_720_480),
 		.max_fps	= OV5640_30_FPS
@@ -722,7 +722,7 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 			.height	= 576,
 		},
 		.ppl		= 1896,
-		.vblank_def	= 408,
+		.vblank_def	= 1110,
 		.reg_data	= ov5640_setting_PAL_720_576,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_PAL_720_576),
 		.max_fps	= OV5640_30_FPS
@@ -744,7 +744,7 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 			.height	= 768,
 		},
 		.ppl		= 1896,
-		.vblank_def	= 312,
+		.vblank_def	= 918,
 		.reg_data	= ov5640_setting_XGA_1024_768,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_XGA_1024_768),
 		.max_fps	= OV5640_30_FPS
@@ -765,8 +765,8 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 			.width	= 1280,
 			.height	= 720,
 		},
-		.ppl		= 1896,
-		.vblank_def	= 20,
+		.ppl		= 1600,
+		.vblank_def	= 560,
 		.reg_data	= ov5640_setting_720P_1280_720,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_720P_1280_720),
 		.max_fps	= OV5640_30_FPS
@@ -787,8 +787,8 @@ ov5640_mode_data[OV5640_NUM_MODES] = {
 			.width	= 1920,
 			.height	= 1080,
 		},
-		.ppl		= 2500,
-		.vblank_def	= 40,
+		.ppl		= 2234,
+		.vblank_def	= 24,
 		.reg_data	= ov5640_setting_1080P_1920_1080,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_1080P_1920_1080),
 		.max_fps	= OV5640_30_FPS
-- 
2.35.0

