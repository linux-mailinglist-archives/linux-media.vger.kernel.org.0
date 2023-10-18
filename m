Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3287C7CD3BF
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 08:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjJRGA1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 02:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbjJRGA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 02:00:26 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89CC7F7
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 23:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697608824; x=1729144824;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=udnanyhGIUx3343KCkzoaJ8+ffapUqwFY/A7kg1hnog=;
  b=k9mPoEaM8uQaVYXlQSu8FoGVo1RCFpaIKdfwiNtZdmZKmGARmr7k9sKm
   1tnyEBCKD0C/O2kGgfAF2raSi3FRHU8HuHdB2OlEGOiR1d2p82DmUBX0K
   nRjeZgfWVng9SKISbXiGOdiMlgqXtxP3F2iC4lohHOnW4dxD57+EjKz7L
   Ce4OAh8CYA72YGMZ2Gecshq8xnuySfwUt815J6aMiBRk/iTtfVgfswxiw
   SMzYPLfVuLBcZqRKuCxQsOHZuLZXiMaYVFrY4VQt8xgShNJ51n2EIgzyW
   pGolD+rmidacsKwiPDLQ7HjoyvPenIr+5Owd3+KQm/W09MJF+ulYs2Vy1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="385778477"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="385778477"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 23:00:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="4208043"
Received: from jasonz-ms-7d25.itwn.intel.com ([10.227.107.10])
  by orviesa001.jf.intel.com with ESMTP; 17 Oct 2023 22:59:15 -0700
From:   "Chen, Jason Z" <jason.z.chen@intel.com>
To:     sakari.ailus@linux.intel.com, andy.yeh@intel.com
Cc:     linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
        qingwu.zhang@intel.com, Jason Chen <jason.z.chen@intel.com>
Subject: [PATCH v8] media: ov08x40: Modify the tline calculation in different modes
Date:   Wed, 18 Oct 2023 13:58:41 +0800
Message-Id: <20231018055841.1983430-1-jason.z.chen@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jason Chen <jason.z.chen@intel.com>

ov08x40 quad bayer sensor ISP has the following work modes:
- normal mode: full size
- 2x2 binned mode: binning size

In normal and binned modes, different tline calculations are
applied.

- normal mode: Tline value needs to be doubled as per the
vendor's update.

Tline time = 2 * HTS / SCLK
Exposure unit : 1 * HTS = 0.5 Tline

- 2x2 binned mode:

Tline time = 1 * HTS / SCLK
Exposure unit : 1 * HTS = 1 Tline

Signed-off-by: Jason Chen <jason.z.chen@intel.com>
---
 drivers/media/i2c/ov08x40.c | 66 ++++++++++++++++++++++++++++---------
 1 file changed, 51 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 637da4df690..0b3b906ebef 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -34,7 +34,7 @@
 
 /* V_TIMING internal */
 #define OV08X40_REG_VTS			0x380e
-#define OV08X40_VTS_30FPS		0x1388
+#define OV08X40_VTS_30FPS		0x09c4	/* the VTS need to be half in normal mode */
 #define OV08X40_VTS_BIN_30FPS		0x115c
 #define OV08X40_VTS_MAX			0x7fff
 
@@ -44,8 +44,9 @@
 
 /* Exposure control */
 #define OV08X40_REG_EXPOSURE		0x3500
-#define OV08X40_EXPOSURE_MAX_MARGIN 31
-#define OV08X40_EXPOSURE_MIN		1
+#define OV08X40_EXPOSURE_MAX_MARGIN	8
+#define OV08X40_EXPOSURE_BIN_MAX_MARGIN	2
+#define OV08X40_EXPOSURE_MIN		4
 #define OV08X40_EXPOSURE_STEP		1
 #define OV08X40_EXPOSURE_DEFAULT	0x40
 
@@ -126,13 +127,17 @@ struct ov08x40_mode {
 	u32 vts_def;
 	u32 vts_min;
 
-	/* HTS */
-	u32 hts;
+	/* Line Length Pixels */
+	u32 llp;
 
 	/* Index of Link frequency config to be used */
 	u32 link_freq_index;
 	/* Default register values */
 	struct ov08x40_reg_list reg_list;
+
+	/* Exposure calculation */
+	u16 exposure_margin;
+	u16 exposure_shift;
 };
 
 static const struct ov08x40_reg mipi_data_rate_800mbps[] = {
@@ -2354,7 +2359,7 @@ static const char * const ov08x40_test_pattern_menu[] = {
 
 /* Configurations for supported link frequencies */
 #define OV08X40_LINK_FREQ_400MHZ	400000000ULL
-
+#define OV08X40_SCLK_96MHZ		96000000ULL
 #define OV08X40_EXT_CLK			19200000
 #define OV08X40_DATA_LANES		4
 
@@ -2392,26 +2397,30 @@ static const struct ov08x40_mode supported_modes[] = {
 		.height = 2416,
 		.vts_def = OV08X40_VTS_30FPS,
 		.vts_min = OV08X40_VTS_30FPS,
-		.hts = 640,
+		.llp = 0x10aa, /* in normal mode, tline time = 2 * HTS / SCLK */
 		.lanes = 4,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3856x2416_regs),
 			.regs = mode_3856x2416_regs,
 		},
 		.link_freq_index = OV08X40_LINK_FREQ_400MHZ_INDEX,
+		.exposure_shift = 1,
+		.exposure_margin = OV08X40_EXPOSURE_MAX_MARGIN,
 	},
 	{
 		.width = 1928,
 		.height = 1208,
 		.vts_def = OV08X40_VTS_BIN_30FPS,
 		.vts_min = OV08X40_VTS_BIN_30FPS,
-		.hts = 720,
+		.llp = 0x960,
 		.lanes = 4,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1928x1208_regs),
 			.regs = mode_1928x1208_regs,
 		},
 		.link_freq_index = OV08X40_LINK_FREQ_400MHZ_INDEX,
+		.exposure_shift = 0,
+		.exposure_margin = OV08X40_EXPOSURE_BIN_MAX_MARGIN,
 	},
 };
 
@@ -2667,13 +2676,23 @@ static int ov08x40_set_ctrl(struct v4l2_ctrl *ctrl)
 					     struct ov08x40, ctrl_handler);
 	struct i2c_client *client = v4l2_get_subdevdata(&ov08x->sd);
 	s64 max;
+	int exp;
+	int fll;
 	int ret = 0;
 
 	/* Propagate change of current control to all related controls */
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
 		/* Update max exposure while meeting expected vblanking */
-		max = ov08x->cur_mode->height + ctrl->val - OV08X40_EXPOSURE_MAX_MARGIN;
+		/*
+		 * because in normal mode, 1 HTS = 0.5 tline
+		 * fps = sclk / hts / vts
+		 * so the vts value needs to be double
+		 */
+		max = ((ov08x->cur_mode->height + ctrl->val) <<
+			ov08x->cur_mode->exposure_shift) -
+			ov08x->cur_mode->exposure_margin;
+
 		__v4l2_ctrl_modify_range(ov08x->exposure,
 					 ov08x->exposure->minimum,
 					 max, ov08x->exposure->step, max);
@@ -2697,15 +2716,20 @@ static int ov08x40_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ov08x40_update_digital_gain(ov08x, ctrl->val);
 		break;
 	case V4L2_CID_EXPOSURE:
+		exp = (ctrl->val << ov08x->cur_mode->exposure_shift) -
+			ov08x->cur_mode->exposure_margin;
+
 		ret = ov08x40_write_reg(ov08x, OV08X40_REG_EXPOSURE,
 					OV08X40_REG_VALUE_24BIT,
-					ctrl->val);
+					exp);
 		break;
 	case V4L2_CID_VBLANK:
+		fll = ((ov08x->cur_mode->height + ctrl->val) <<
+			   ov08x->cur_mode->exposure_shift);
+
 		ret = ov08x40_write_reg(ov08x, OV08X40_REG_VTS,
 					OV08X40_REG_VALUE_16BIT,
-					ov08x->cur_mode->height
-					+ ctrl->val);
+					fll);
 		break;
 	case V4L2_CID_TEST_PATTERN:
 		ret = ov08x40_enable_test_pattern(ov08x, ctrl->val);
@@ -2816,6 +2840,7 @@ ov08x40_set_pad_format(struct v4l2_subdev *sd,
 	s64 h_blank;
 	s64 pixel_rate;
 	s64 link_freq;
+	u64 steps;
 
 	mutex_lock(&ov08x->mutex);
 
@@ -2843,13 +2868,22 @@ ov08x40_set_pad_format(struct v4l2_subdev *sd,
 			     ov08x->cur_mode->height;
 		vblank_min = ov08x->cur_mode->vts_min -
 			     ov08x->cur_mode->height;
+
+		/*
+		 * The frame length line should be aligned to a multiple of 4,
+		 * as provided by the sensor vendor, in normal mode.
+		 */
+		steps = mode->exposure_shift == 1 ? 4 : 1;
+
 		__v4l2_ctrl_modify_range(ov08x->vblank, vblank_min,
 					 OV08X40_VTS_MAX
 					 - ov08x->cur_mode->height,
-					 1,
+					 steps,
 					 vblank_def);
 		__v4l2_ctrl_s_ctrl(ov08x->vblank, vblank_def);
-		h_blank = ov08x->cur_mode->hts;
+
+		h_blank = ov08x->cur_mode->llp - ov08x->cur_mode->width;
+
 		__v4l2_ctrl_modify_range(ov08x->hblank, h_blank,
 					 h_blank, 1, h_blank);
 	}
@@ -3075,7 +3109,8 @@ static int ov08x40_init_controls(struct ov08x40 *ov08x)
 					  OV08X40_VTS_MAX - mode->height, 1,
 					  vblank_def);
 
-	hblank = ov08x->cur_mode->hts;
+	hblank = ov08x->cur_mode->llp - ov08x->cur_mode->width;
+
 	ov08x->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov08x40_ctrl_ops,
 					  V4L2_CID_HBLANK,
 					  hblank, hblank, 1, hblank);
@@ -3320,6 +3355,7 @@ static struct i2c_driver ov08x40_i2c_driver = {
 module_i2c_driver(ov08x40_i2c_driver);
 
 MODULE_AUTHOR("Jason Chen <jason.z.chen@intel.com>");
+MODULE_AUTHOR("Qingwu Zhang <qingwu.zhang@intel.com>");
 MODULE_AUTHOR("Shawn Tu");
 MODULE_DESCRIPTION("OmniVision OV08X40 sensor driver");
 MODULE_LICENSE("GPL");
-- 
2.34.1

