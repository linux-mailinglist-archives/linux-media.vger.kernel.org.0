Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFB9B4B0BDF
	for <lists+linux-media@lfdr.de>; Thu, 10 Feb 2022 12:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240572AbiBJLJP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Feb 2022 06:09:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237987AbiBJLJO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Feb 2022 06:09:14 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82054128
        for <linux-media@vger.kernel.org>; Thu, 10 Feb 2022 03:09:15 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 149751C0007;
        Thu, 10 Feb 2022 11:09:10 +0000 (UTC)
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
Subject: [PATCH v2 15/23] media: ov5640: Fix durations to comply with FPS
Date:   Thu, 10 Feb 2022 12:10:00 +0100
Message-Id: <20220210111004.152859-3-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220210110458.152494-1-jacopo@jmondi.org>
References: <20220210110458.152494-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
index 30b706a98eb9..dd7ff1bb580f 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -648,8 +648,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 			.width	= 160,
 			.height	= 120,
 		},
-		.htot		= 1896,
-		.vblank_def	= 864,
+		.htot		= 1600,
+		.vblank_def	= 878,
 		.reg_data	= ov5640_setting_QQVGA_160_120,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QQVGA_160_120),
 		.max_fps	= OV5640_30_FPS
@@ -672,8 +672,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 			.width	= 176,
 			.height	= 144,
 		},
-		.htot		= 1896,
-		.vblank_def	= 840,
+		.htot		= 1600,
+		.vblank_def	= 854,
 		.reg_data	= ov5640_setting_QCIF_176_144,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QCIF_176_144),
 		.max_fps	= OV5640_30_FPS
@@ -696,8 +696,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 			.width	= 320,
 			.height	= 240,
 		},
-		.htot		= 1896,
-		.vblank_def	= 744,
+		.htot		= 1600,
+		.vblank_def	= 760,
 		.reg_data	= ov5640_setting_QVGA_320_240,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QVGA_320_240),
 		.max_fps	= OV5640_30_FPS
@@ -720,8 +720,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 			.width	= 640,
 			.height	= 480,
 		},
-		.htot		= 1896,
-		.vblank_def	= 600,
+		.htot		= 1600,
+		.vblank_def	= 520,
 		.reg_data	= ov5640_setting_VGA_640_480,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_VGA_640_480),
 		.max_fps	= OV5640_60_FPS
@@ -745,7 +745,7 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 			.height	= 480,
 		},
 		.htot		= 1896,
-		.vblank_def	= 504,
+		.vblank_def	= 1206,
 		.reg_data	= ov5640_setting_NTSC_720_480,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_NTSC_720_480),
 		.max_fps	= OV5640_30_FPS
@@ -769,7 +769,7 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 			.height	= 576,
 		},
 		.htot		= 1896,
-		.vblank_def	= 408,
+		.vblank_def	= 1110,
 		.reg_data	= ov5640_setting_PAL_720_576,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_PAL_720_576),
 		.max_fps	= OV5640_30_FPS
@@ -793,7 +793,7 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 			.height	= 768,
 		},
 		.htot		= 1896,
-		.vblank_def	= 312,
+		.vblank_def	= 918,
 		.reg_data	= ov5640_setting_XGA_1024_768,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_XGA_1024_768),
 		.max_fps	= OV5640_30_FPS
@@ -816,8 +816,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 			.width	= 1280,
 			.height	= 720,
 		},
-		.htot		= 1892,
-		.vblank_def	= 20,
+		.htot		= 1600,
+		.vblank_def	= 560,
 		.reg_data	= ov5640_setting_720P_1280_720,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_720P_1280_720),
 		.max_fps	= OV5640_30_FPS
@@ -840,8 +840,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 			.width	= 1920,
 			.height	= 1080,
 		},
-		.htot		= 2500,
-		.vblank_def	= 40,
+		.htot		= 2234,
+		.vblank_def	= 24,
 		.reg_data	= ov5640_setting_1080P_1920_1080,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_1080P_1920_1080),
 		.max_fps	= OV5640_30_FPS
-- 
2.35.0

