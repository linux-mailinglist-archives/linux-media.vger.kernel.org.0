Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA5593BB74F
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 08:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbhGEGwn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 02:52:43 -0400
Received: from mga09.intel.com ([134.134.136.24]:18004 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229823AbhGEGwl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 5 Jul 2021 02:52:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10035"; a="208887850"
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; 
   d="scan'208";a="208887850"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2021 23:50:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; 
   d="scan'208";a="410108599"
Received: from ipu5-build.bj.intel.com ([10.238.232.202])
  by orsmga003.jf.intel.com with ESMTP; 04 Jul 2021 23:50:01 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Cc:     senozhatsky@chromium.org, tfiga@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com
Subject: [PATCH] media: ov2740: use group write for digital gain
Date:   Mon,  5 Jul 2021 14:50:59 +0800
Message-Id: <1625467859-27486-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As the RGB digital gains of ov2740 were not applied as group, some
artifacts were observed in low light environment, use group write for
digital gain can make the RGB digital can be guaranteed to applied
together at frame boundary.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/ov2740.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 599369a3d192..934c9d65cb09 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -51,7 +51,7 @@
 #define OV2740_REG_MWB_R_GAIN		0x500a
 #define OV2740_REG_MWB_G_GAIN		0x500c
 #define OV2740_REG_MWB_B_GAIN		0x500e
-#define OV2740_DGTL_GAIN_MIN		0
+#define OV2740_DGTL_GAIN_MIN		1024
 #define OV2740_DGTL_GAIN_MAX		4095
 #define OV2740_DGTL_GAIN_STEP		1
 #define OV2740_DGTL_GAIN_DEFAULT	1024
@@ -61,6 +61,12 @@
 #define OV2740_TEST_PATTERN_ENABLE	BIT(7)
 #define OV2740_TEST_PATTERN_BAR_SHIFT	2
 
+/* Group Access */
+#define OV2740_REG_GROUP_ACCESS		0x3208
+#define OV2740_GROUP_HOLD_START		0x0
+#define OV2740_GROUP_HOLD_END		0x10
+#define OV2740_GROUP_HOLD_LAUNCH	0xa0
+
 /* ISP CTRL00 */
 #define OV2740_REG_ISP_CTRL00		0x5000
 /* ISP CTRL01 */
@@ -438,6 +444,11 @@ static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 {
 	int ret = 0;
 
+	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+			       OV2740_GROUP_HOLD_START);
+	if (ret)
+		return ret;
+
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
 	if (ret)
 		return ret;
@@ -446,7 +457,18 @@ static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 	if (ret)
 		return ret;
 
-	return ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
+	if (ret)
+		return ret;
+
+	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+			       OV2740_GROUP_HOLD_END);
+	if (ret)
+		return ret;
+
+	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+			       OV2740_GROUP_HOLD_LAUNCH);
+	return ret;
 }
 
 static int ov2740_test_pattern(struct ov2740 *ov2740, u32 pattern)
-- 
2.7.4

