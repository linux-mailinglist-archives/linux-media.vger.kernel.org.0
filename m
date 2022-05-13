Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE9B5263B9
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353581AbiEMORF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353072AbiEMOQ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:16:59 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6226D11B407
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:16:47 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 6ACBC20016;
        Fri, 13 May 2022 14:16:45 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     sakari.ailus@iki.fi, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v7 17/28] media: ov5640: Adjust vblank with s_frame_interval
Date:   Fri, 13 May 2022 16:14:05 +0200
Message-Id: <20220513141416.120552-18-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513141416.120552-1-jacopo@jmondi.org>
References: <20220513141416.120552-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hugues Fruchet <hugues.fruchet@st.com>

Adjust the vertical blanking when s_frame_interval is used.

s_frame_interval allows to set a fixed frame rate, which gets stored as
the sensor's current one. When a new mode is applied, the current frame
rate is reset to the mode's default one. In order to correctly report
the currently configured vertical blanking for s_frame_interval users,
verify that the desired frame rate has not been changed. If that's the
case, compute the correct blanking value and reflect it through the
corresponding v4l2 control.

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 58 +++++++++++++++++++++++++++-----------
 1 file changed, 42 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 36da9ad6cd5b..5e0014df136f 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -319,6 +319,7 @@ struct ov5640_mode_info {
 
 	/* Used by s_frame_interval only. */
 	u32 max_fps;
+	u32 def_fps;
 };
 
 struct ov5640_ctrls {
@@ -602,7 +603,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 		},
 		.reg_data	= ov5640_setting_low_res,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
-		.max_fps	= OV5640_30_FPS
+		.max_fps	= OV5640_30_FPS,
+		.def_fps	= OV5640_30_FPS
 	}, {
 		/* 176x144 */
 		.id		= OV5640_MODE_QCIF_176_144,
@@ -646,7 +648,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 		},
 		.reg_data	= ov5640_setting_low_res,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
-		.max_fps	= OV5640_30_FPS
+		.max_fps	= OV5640_30_FPS,
+		.def_fps	= OV5640_30_FPS
 	}, {
 		/* 320x240 */
 		.id		= OV5640_MODE_QVGA_320_240,
@@ -690,7 +693,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 		},
 		.reg_data	= ov5640_setting_low_res,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
-		.max_fps	= OV5640_30_FPS
+		.max_fps	= OV5640_30_FPS,
+		.def_fps	= OV5640_30_FPS
 	}, {
 		/* 640x480 */
 		.id		= OV5640_MODE_VGA_640_480,
@@ -734,7 +738,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 		},
 		.reg_data	= ov5640_setting_low_res,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
-		.max_fps	= OV5640_60_FPS
+		.max_fps	= OV5640_60_FPS,
+		.def_fps	= OV5640_30_FPS
 	}, {
 		/* 720x480 */
 		.id		= OV5640_MODE_NTSC_720_480,
@@ -777,7 +782,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 		},
 		.reg_data	= ov5640_setting_low_res,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
-		.max_fps	= OV5640_30_FPS
+		.max_fps	= OV5640_30_FPS,
+		.def_fps	= OV5640_30_FPS
 	}, {
 		/* 720x576 */
 		.id		= OV5640_MODE_PAL_720_576,
@@ -820,7 +826,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 		},
 		.reg_data	= ov5640_setting_low_res,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
-		.max_fps	= OV5640_30_FPS
+		.max_fps	= OV5640_30_FPS,
+		.def_fps	= OV5640_30_FPS
 	}, {
 		/* 1024x768 */
 		.id		= OV5640_MODE_XGA_1024_768,
@@ -862,7 +869,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 		},
 		.reg_data	= ov5640_setting_low_res,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_low_res),
-		.max_fps	= OV5640_30_FPS
+		.max_fps	= OV5640_30_FPS,
+		.def_fps	= OV5640_30_FPS
 	}, {
 		/* 1280x720 */
 		.id		= OV5640_MODE_720P_1280_720,
@@ -904,7 +912,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 		},
 		.reg_data	= ov5640_setting_720P_1280_720,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_720P_1280_720),
-		.max_fps	= OV5640_30_FPS
+		.max_fps	= OV5640_30_FPS,
+		.def_fps	= OV5640_30_FPS
 	}, {
 		/* 1920x1080 */
 		.id		= OV5640_MODE_1080P_1920_1080,
@@ -948,7 +957,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 		},
 		.reg_data	= ov5640_setting_1080P_1920_1080,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_1080P_1920_1080),
-		.max_fps	= OV5640_30_FPS
+		.max_fps	= OV5640_30_FPS,
+		.def_fps	= OV5640_30_FPS
 	}, {
 		/* 2592x1944 */
 		.id		= OV5640_MODE_QSXGA_2592_1944,
@@ -991,7 +1001,8 @@ static const struct ov5640_mode_info ov5640_mode_data[OV5640_NUM_MODES] = {
 		},
 		.reg_data	= ov5640_setting_QSXGA_2592_1944,
 		.reg_data_size	= ARRAY_SIZE(ov5640_setting_QSXGA_2592_1944),
-		.max_fps	= OV5640_15_FPS
+		.max_fps	= OV5640_15_FPS,
+		.def_fps	= OV5640_15_FPS
 	},
 };
 
@@ -2712,6 +2723,7 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
 	u32 pixel_rate;
 	s64 link_freq;
 	u32 num_lanes;
+	u32 vblank;
 	u32 bpp;
 
 	/*
@@ -2770,15 +2782,29 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
 	__v4l2_ctrl_modify_range(sensor->ctrls.hblank,
 				 hblank, hblank, 1, hblank);
 
+	vblank = timings->vblank_def;
+
+	if (sensor->current_fr != mode->def_fps) {
+		/*
+		 * Compute the vertical blanking according to the framerate
+		 * configured with s_frame_interval.
+		 */
+		int fie_num = sensor->frame_interval.numerator;
+		int fie_denom = sensor->frame_interval.denominator;
+
+		vblank = ((fie_num * pixel_rate / fie_denom) / timings->htot) -
+			mode->height;
+	}
+
 	__v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV5640_MIN_VBLANK,
-				 OV5640_MAX_VTS - mode->height, 1,
-				 timings->vblank_def);
-	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, timings->vblank_def);
+				 OV5640_MAX_VTS - mode->height, 1, vblank);
+	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, vblank);
 
-	exposure_max = timings->crop.height + timings->vblank_def - 4;
+	exposure_max = timings->crop.height + vblank - 4;
 	exposure_val = clamp_t(s32, sensor->ctrls.exposure->val,
 			       sensor->ctrls.exposure->minimum,
 			       exposure_max);
+
 	__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
 				 sensor->ctrls.exposure->minimum,
 				 exposure_max, 1, exposure_val);
@@ -2816,6 +2842,7 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
 	}
 
 	if (new_mode != sensor->current_mode) {
+		sensor->current_fr = new_mode->def_fps;
 		sensor->current_mode = new_mode;
 		sensor->pending_mode_change = true;
 	}
@@ -3468,8 +3495,7 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
 		sensor->current_mode = mode;
 		sensor->pending_mode_change = true;
 
-		__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
-					 ov5640_calc_pixel_rate(sensor));
+		ov5640_update_pixel_rate(sensor);
 	}
 out:
 	mutex_unlock(&sensor->lock);
-- 
2.35.1

