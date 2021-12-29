Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 737E5481128
	for <lists+linux-media@lfdr.de>; Wed, 29 Dec 2021 10:00:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237953AbhL2JAg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Dec 2021 04:00:36 -0500
Received: from mga11.intel.com ([192.55.52.93]:22669 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234861AbhL2JAg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Dec 2021 04:00:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640768436; x=1672304436;
  h=from:to:cc:subject:date:message-id;
  bh=c0M8sr6MRhxMbO6L4U951s+MPoseBf5LciR+e49Em7Q=;
  b=awEDsCFNiNzhpib3GCxtKIyo/daFUr6FmeT71cyPH9vtzSrweR0qNOTC
   JWWbhi2QU0fo3dUH9qNtmX24Weh+7i8jqgPefgDN2vlEDdMbtez8SKzTY
   6tNm/wGQnK0I9O8qyKiHizJdlH15DH/L4oDXts32ZzLECTTGzqp1N+O6V
   6ZIGQJpwDgY6jXJB4QiwOzgoMIXoksG4I0su4b1Aa17Qk1KFD0WFJCsUP
   ZBvFwNcDISOA/JUUS26d5ZxtfTcM/RdgWDB3obMMGYirfYrn3TKy+ePqK
   +pudHG6FtLBfG4003C7cDwDNGjxNSDjuPF7/cqtUCkrYyavr0CHhLOdux
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10211"; a="239032788"
X-IronPort-AV: E=Sophos;i="5.88,244,1635231600"; 
   d="scan'208";a="239032788"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2021 01:00:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,244,1635231600"; 
   d="scan'208";a="618981518"
Received: from ipu5-build.bj.intel.com ([10.238.232.188])
  by orsmga004.jf.intel.com with ESMTP; 29 Dec 2021 01:00:33 -0800
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Cc:     shawnx.tu@intel.com, senozhatsky@chromium.org, tfiga@chromium.org,
        bingbu.cao@intel.com, bingbu.cao@linux.intel.com,
        andy.yeh@intel.com
Subject: [PATCH] media: ov5675: use group write to update digital gain
Date:   Wed, 29 Dec 2021 16:57:39 +0800
Message-Id: <1640768259-18070-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MWB gain register are used to set gain for each mwb channel mannually.
However, it will involve some artifacts at low light environment as gain
cannot be applied to each channel synchronously. Update the driver to use
group write for digital gain to make the sure RGB digital gain be applied
together at frame boundary.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/ov5675.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 00925850fa7c..82ba9f56baec 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -50,14 +50,21 @@
 #define	OV5675_ANAL_GAIN_STEP		1
 
 /* Digital gain controls from sensor */
+#define OV5675_REG_DIGITAL_GAIN		0x350a
 #define OV5675_REG_MWB_R_GAIN		0x5019
 #define OV5675_REG_MWB_G_GAIN		0x501b
 #define OV5675_REG_MWB_B_GAIN		0x501d
-#define OV5675_DGTL_GAIN_MIN		0
+#define OV5675_DGTL_GAIN_MIN		1024
 #define OV5675_DGTL_GAIN_MAX		4095
 #define OV5675_DGTL_GAIN_STEP		1
 #define OV5675_DGTL_GAIN_DEFAULT	1024
 
+/* Group Access */
+#define OV5675_REG_GROUP_ACCESS		0x3208
+#define OV5675_GROUP_HOLD_START		0x0
+#define OV5675_GROUP_HOLD_END		0x10
+#define OV5675_GROUP_HOLD_LAUNCH	0xa0
+
 /* Test Pattern Control */
 #define OV5675_REG_TEST_PATTERN		0x4503
 #define OV5675_TEST_PATTERN_ENABLE	BIT(7)
@@ -587,6 +594,12 @@ static int ov5675_update_digital_gain(struct ov5675 *ov5675, u32 d_gain)
 {
 	int ret;
 
+	ret = ov5675_write_reg(ov5675, OV5675_REG_GROUP_ACCESS,
+			       OV5675_REG_VALUE_08BIT,
+			       OV5675_GROUP_HOLD_START);
+	if (ret)
+		return ret;
+
 	ret = ov5675_write_reg(ov5675, OV5675_REG_MWB_R_GAIN,
 			       OV5675_REG_VALUE_16BIT, d_gain);
 	if (ret)
@@ -597,8 +610,21 @@ static int ov5675_update_digital_gain(struct ov5675 *ov5675, u32 d_gain)
 	if (ret)
 		return ret;
 
-	return ov5675_write_reg(ov5675, OV5675_REG_MWB_B_GAIN,
-				OV5675_REG_VALUE_16BIT, d_gain);
+	ret = ov5675_write_reg(ov5675, OV5675_REG_MWB_B_GAIN,
+			       OV5675_REG_VALUE_16BIT, d_gain);
+	if (ret)
+		return ret;
+
+	ret = ov5675_write_reg(ov5675, OV5675_REG_GROUP_ACCESS,
+			       OV5675_REG_VALUE_08BIT,
+			       OV5675_GROUP_HOLD_END);
+	if (ret)
+		return ret;
+
+	ret = ov5675_write_reg(ov5675, OV5675_REG_GROUP_ACCESS,
+			       OV5675_REG_VALUE_08BIT,
+			       OV5675_GROUP_HOLD_LAUNCH);
+	return ret;
 }
 
 static int ov5675_test_pattern(struct ov5675 *ov5675, u32 pattern)
-- 
2.7.4

