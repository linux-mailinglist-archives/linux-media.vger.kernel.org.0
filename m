Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E77753BB790
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 09:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhGEHQA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 03:16:00 -0400
Received: from mga04.intel.com ([192.55.52.120]:61398 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229817AbhGEHP7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 5 Jul 2021 03:15:59 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10035"; a="207108096"
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; 
   d="scan'208";a="207108096"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2021 00:13:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; 
   d="scan'208";a="456623021"
Received: from ipu5-build.bj.intel.com ([10.238.232.202])
  by orsmga008.jf.intel.com with ESMTP; 05 Jul 2021 00:13:16 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Cc:     senozhatsky@chromium.org, tfiga@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com
Subject: [PATCH] media: ov9734: use group write for digital gain
Date:   Mon,  5 Jul 2021 15:14:15 +0800
Message-Id: <1625469255-27923-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As the RGB digital gains of ov9734 were not applied as group, some
artifacts were observed in low light environment, use group write for
digital gain can make the RGB digital can be guaranteed to applied
together at frame boundary.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/ov9734.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index af50c66cf5ce..df538ceb71c3 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -60,6 +60,12 @@
 #define OV9734_TEST_PATTERN_ENABLE	BIT(7)
 #define OV9734_TEST_PATTERN_BAR_SHIFT	2
 
+/* Group Access */
+#define OV9734_REG_GROUP_ACCESS		0x3208
+#define OV9734_GROUP_HOLD_START		0x0
+#define OV9734_GROUP_HOLD_END		0x10
+#define OV9734_GROUP_HOLD_LAUNCH	0xa0
+
 enum {
 	OV9734_LINK_FREQ_180MHZ_INDEX,
 };
@@ -433,6 +439,11 @@ static int ov9734_update_digital_gain(struct ov9734 *ov9734, u32 d_gain)
 {
 	int ret;
 
+	ret = ov9734_write_reg(ov9734, OV9734_REG_GROUP_ACCESS, 1,
+			       OV9734_GROUP_HOLD_START);
+	if (ret)
+		return ret;
+
 	ret = ov9734_write_reg(ov9734, OV9734_REG_MWB_R_GAIN, 2, d_gain);
 	if (ret)
 		return ret;
@@ -441,7 +452,18 @@ static int ov9734_update_digital_gain(struct ov9734 *ov9734, u32 d_gain)
 	if (ret)
 		return ret;
 
-	return ov9734_write_reg(ov9734, OV9734_REG_MWB_B_GAIN, 2, d_gain);
+	ret = ov9734_write_reg(ov9734, OV9734_REG_MWB_B_GAIN, 2, d_gain);
+	if (ret)
+		return ret;
+
+	ret = ov9734_write_reg(ov9734, OV9734_REG_GROUP_ACCESS, 1,
+			       OV9734_GROUP_HOLD_END);
+	if (ret)
+		return ret;
+
+	ret = ov9734_write_reg(ov9734, OV9734_REG_GROUP_ACCESS, 1,
+			       OV9734_GROUP_HOLD_LAUNCH);
+	return ret;
 }
 
 static int ov9734_test_pattern(struct ov9734 *ov9734, u32 pattern)
-- 
2.7.4

