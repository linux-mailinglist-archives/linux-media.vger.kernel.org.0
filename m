Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27C145263A8
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347989AbiEMOQm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344037AbiEMOQL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:16:11 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A8D31172E3
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652451369; x=1683987369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lCe4izZxORuN8V3Yz1UIIC2WWueI04W7AJ6p3m1HL94=;
  b=nLBcu6vPDMulPDAUBQZLq1oWev6JDeVWUNAiFJ3JQVjz0BlljJnMOZBi
   FZbr8MwXtlbDwHGNMBDscBT2bQINcZGsVhZ9/+6Ke60KcvjnxrhBaolto
   zyCTV+jMtLkse2AqO0fdCxhcYdsCmHeJTh4B8EJdKbnyQxUrcu0fIvovF
   uyo6kEKi/YG9pwZM5JQwKxG87EzaIEnmN63if7NgawJgmK910xTShm89P
   WUiFgHDifKM2ycvtj0q9GZeJyaE+oSgvdA4kSH5ZOEVsQZzLmMBrcBtTS
   Z9HV0nY9jvbZ+zYI53WrnLKwSyAGKr+f/TC5XmUujwE8WHUb1SGpJvDEB
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="333348185"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="333348185"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="603853839"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:04 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 0C910216A5;
        Fri, 13 May 2022 17:15:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1npW58-0001ga-BF; Fri, 13 May 2022 17:15:50 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        mirela.rabulea@nxp.com, xavier.roumegue@oss.nxp.com,
        tomi.valkeinen@ideasonboard.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, paul.elder@ideasonboard.com,
        eddy.khan@vergesense.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v7 17/28] media: ov5640: Adjust vblank with s_frame_interval
Date:   Fri, 13 May 2022 17:15:37 +0300
Message-Id: <20220513141548.6344-18-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
References: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
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
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov5640.c | 58 +++++++++++++++++++++++++++-----------
 1 file changed, 42 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 4534821f4af0f..63d43bddb8386 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -307,6 +307,7 @@ struct ov5640_mode_info {
 
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
2.30.2

