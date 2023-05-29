Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6D071485A
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 13:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbjE2LLv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 07:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjE2LLu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 07:11:50 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62AB7CF
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 04:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685358709; x=1716894709;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cY5rAtd61tbHaCEt2Ri7xg0vVh9s9z8K4GmcqvRHFKc=;
  b=eaXUtUHAvm2fJa+Bgy2Ys59Nw+qWOhYc057gsiwPdUPFHwWHE9Px7oAM
   jgdAQPX7qTX18nfGC/YhBZlrCNj3eVw1AvQMDQym/JIac6j3ozmbXHQ5V
   4NyTATkX9XEJ6klqPWRq5PtRBPQ0ZPuBAdv6Vza6rshMq8ygmQmu2/T/X
   Y0iHIVJ0jFB0fkCpQr+pQRjKsiDEOP5lwcatzzHzgStcszZZlnFjcMp3a
   uuwbznlLYi8F32JjPnsp7Q2h9FwuVbmbArzyuaax+Crbeqaw80mntbYHN
   A4K27jSqa60aMeYVHM3oblkeSZZ4+d7Eh3lAml5K2K9kpCElHjcLonqz8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="382936750"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="382936750"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 04:11:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="709234796"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="709234796"
Received: from jasonz-ms-7d25.itwn.intel.com ([10.227.107.10])
  by fmsmga007.fm.intel.com with ESMTP; 29 May 2023 04:11:47 -0700
From:   "Chen, Jason Z" <jason.z.chen@intel.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andy.yeh@intel.com,
        Jason Chen <jason.z.chen@intel.com>
Subject: [PATCH v2] media: ov08x40: Fix hblank out of range issue
Date:   Mon, 29 May 2023 19:10:41 +0800
Message-Id: <20230529111041.2839773-1-jason.z.chen@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jason Chen <jason.z.chen@intel.com>

The HTS value cannot be directly compared to the sensor's output
size. It needs to be converted to an absolute time unit.
Additionally, the hblank value need to be modified as it was
previous invalid.

Signed-off-by: Jason Chen <jason.z.chen@intel.com>
---
 drivers/media/i2c/ov08x40.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 72ae7fba94e..3d82a9db339 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -110,8 +110,6 @@ struct ov08x40_reg_list {
 
 /* Link frequency config */
 struct ov08x40_link_freq_config {
-	u32 pixels_per_line;
-
 	/* registers for this link frequency */
 	struct ov08x40_reg_list reg_list;
 };
@@ -128,6 +126,9 @@ struct ov08x40_mode {
 	u32 vts_def;
 	u32 vts_min;
 
+	/* HTS */
+	u32 hts;
+
 	/* Index of Link frequency config to be used */
 	u32 link_freq_index;
 	/* Default register values */
@@ -2391,6 +2392,7 @@ static const struct ov08x40_mode supported_modes[] = {
 		.height = 2416,
 		.vts_def = OV08X40_VTS_30FPS,
 		.vts_min = OV08X40_VTS_30FPS,
+		.hts = 640,
 		.lanes = 4,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3856x2416_regs),
@@ -2403,6 +2405,7 @@ static const struct ov08x40_mode supported_modes[] = {
 		.height = 1208,
 		.vts_def = OV08X40_VTS_BIN_30FPS,
 		.vts_min = OV08X40_VTS_BIN_30FPS,
+		.hts = 720,
 		.lanes = 4,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1928x1208_regs),
@@ -2846,9 +2849,7 @@ ov08x40_set_pad_format(struct v4l2_subdev *sd,
 					 1,
 					 vblank_def);
 		__v4l2_ctrl_s_ctrl(ov08x->vblank, vblank_def);
-		h_blank =
-			link_freq_configs[mode->link_freq_index].pixels_per_line
-			 - ov08x->cur_mode->width;
+		h_blank = ov08x->cur_mode->hts;
 		__v4l2_ctrl_modify_range(ov08x->hblank, h_blank,
 					 h_blank, 1, h_blank);
 	}
@@ -3074,8 +3075,7 @@ static int ov08x40_init_controls(struct ov08x40 *ov08x)
 					  OV08X40_VTS_MAX - mode->height, 1,
 					  vblank_def);
 
-	hblank = link_freq_configs[mode->link_freq_index].pixels_per_line -
-		 mode->width;
+	hblank = ov08x->cur_mode->hts;
 	ov08x->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov08x40_ctrl_ops,
 					  V4L2_CID_HBLANK,
 					  hblank, hblank, 1, hblank);
-- 
2.34.1

