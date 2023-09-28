Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED7F7B1102
	for <lists+linux-media@lfdr.de>; Thu, 28 Sep 2023 05:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbjI1DAN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 23:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjI1DAN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 23:00:13 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA8D499
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 20:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695870011; x=1727406011;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ktfgmKbMsM3DUlL45aDxOqmqMGhamc6I0Sv30YT1RE8=;
  b=BXyZV7UBlZm/9UZsYgx9RiKxygwWIaNWhr9YBMzomn/a68MotNNJONBw
   IyNZ8rgcVb+QHiSXXNZP5cE1m3jzcv2oHPNXiXMTRltGX503C8CtHeek4
   afKgpysqL2p0sjHEE87KGizhIRSzCs/0XK5E9akQQS3qSi3GAM0E1VP+q
   rRorbdwnreFhth77p7Apb/BUdLHHB6zYJ+ualqYUYCCS9jyQUo6uuJ7vk
   Zqt2RXdqGmDiHIntH+G+gZPRJYx7ODgJ8eckIG+UwhzW5HPen1vYW+MTQ
   N3ELlHKsSTwJn/qrApXiGwNhKJaUBlxv9Wl1uStVRZQ73orAdHVn0F9CN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="468258410"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="468258410"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 20:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="819689903"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="819689903"
Received: from jasonz-ms-7d25.itwn.intel.com ([10.227.107.10])
  by fmsmga004.fm.intel.com with ESMTP; 27 Sep 2023 20:00:08 -0700
From:   "Chen, Jason Z" <jason.z.chen@intel.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andy.yeh@intel.com,
        Jason Chen <jason.z.chen@intel.com>
Subject: [PATCH] media: ov08x40: Modify the tline calculation in 1C mode
Date:   Thu, 28 Sep 2023 10:59:00 +0800
Message-Id: <20230928025900.3200599-1-jason.z.chen@intel.com>
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

ov08x40 sensor ISP has the following work modes:
- 1C mode: full size
- 4C1 mode: binning size

In 1c and 4c1 modes, different tline calculations are
applied.

- 1c mode: Tline value needs to be doubled as per the
vendor's update.

Tline time = 2 * HTS / SCLK
Exposure unit : 1 * HTS = 0.5 Tline

- 4c1 mode:

Tline time = 1 * HTS / SCLK
Exposure unit : 1 * HTS = 1 Tline

Signed-off-by: Jason Chen <jason.z.chen@intel.com>
---
 drivers/media/i2c/ov08x40.c | 58 ++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 637da4df690..acf6799d7fa 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -34,7 +34,7 @@
 
 /* V_TIMING internal */
 #define OV08X40_REG_VTS			0x380e
-#define OV08X40_VTS_30FPS		0x1388
+#define OV08X40_VTS_30FPS		0x09c4	/* the VTS need to be half in 1c */
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
+		.llp = 0x10aa, /* in 1c mode, tline time = 2 * HTS / SCLK */
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
 
@@ -2667,13 +2676,22 @@ static int ov08x40_set_ctrl(struct v4l2_ctrl *ctrl)
 					     struct ov08x40, ctrl_handler);
 	struct i2c_client *client = v4l2_get_subdevdata(&ov08x->sd);
 	s64 max;
+	int exp;
+	int vblank;
 	int ret = 0;
 
 	/* Propagate change of current control to all related controls */
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
 		/* Update max exposure while meeting expected vblanking */
-		max = ov08x->cur_mode->height + ctrl->val - OV08X40_EXPOSURE_MAX_MARGIN;
+		/* because in 1c mode, 1 HTS = 0.5 tline
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
@@ -2697,15 +2715,23 @@ static int ov08x40_set_ctrl(struct v4l2_ctrl *ctrl)
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
+		vblank = ((ov08x->cur_mode->height + ctrl->val) <<
+			   ov08x->cur_mode->exposure_shift);
+		/* frame length line should be aligned according
+		 * to the value provided by the sensor vendor
+		 */
+		vblank |= 0x4;
 		ret = ov08x40_write_reg(ov08x, OV08X40_REG_VTS,
 					OV08X40_REG_VALUE_16BIT,
-					ov08x->cur_mode->height
-					+ ctrl->val);
+					vblank);
 		break;
 	case V4L2_CID_TEST_PATTERN:
 		ret = ov08x40_enable_test_pattern(ov08x, ctrl->val);
@@ -2849,7 +2875,9 @@ ov08x40_set_pad_format(struct v4l2_subdev *sd,
 					 1,
 					 vblank_def);
 		__v4l2_ctrl_s_ctrl(ov08x->vblank, vblank_def);
-		h_blank = ov08x->cur_mode->hts;
+
+		h_blank = ov08x->cur_mode->llp - ov08x->cur_mode->width;
+
 		__v4l2_ctrl_modify_range(ov08x->hblank, h_blank,
 					 h_blank, 1, h_blank);
 	}
@@ -3075,7 +3103,8 @@ static int ov08x40_init_controls(struct ov08x40 *ov08x)
 					  OV08X40_VTS_MAX - mode->height, 1,
 					  vblank_def);
 
-	hblank = ov08x->cur_mode->hts;
+	hblank = ov08x->cur_mode->llp - ov08x->cur_mode->width;
+
 	ov08x->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov08x40_ctrl_ops,
 					  V4L2_CID_HBLANK,
 					  hblank, hblank, 1, hblank);
@@ -3320,6 +3349,7 @@ static struct i2c_driver ov08x40_i2c_driver = {
 module_i2c_driver(ov08x40_i2c_driver);
 
 MODULE_AUTHOR("Jason Chen <jason.z.chen@intel.com>");
+MODULE_AUTHOR("Qingwu Zhang <qingwu.zhang@intel.com>");
 MODULE_AUTHOR("Shawn Tu");
 MODULE_DESCRIPTION("OmniVision OV08X40 sensor driver");
 MODULE_LICENSE("GPL");
-- 
2.34.1

