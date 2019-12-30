Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADC9D12CF02
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2019 11:51:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbfL3Kvg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Dec 2019 05:51:36 -0500
Received: from mga01.intel.com ([192.55.52.88]:32580 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726196AbfL3Kvg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Dec 2019 05:51:36 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 02:51:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,374,1571727600"; 
   d="scan'208";a="215313105"
Received: from shawn-bm6650-pc.itwn.intel.com ([10.5.230.127])
  by fmsmga007.fm.intel.com with ESMTP; 30 Dec 2019 02:51:35 -0800
From:   Shawnx Tu <shawnx.tu@intel.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andy.yeh@intel.com,
        shawnx.tu@intel.com
Subject: [PATCH v2] ov5675: add vflip/hflip control support
Date:   Mon, 30 Dec 2019 18:51:57 +0800
Message-Id: <1577703117-18845-1-git-send-email-shawnx.tu@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Shawn Tu <shawnx.tu@intel.com>

Add V4L2 controls: horizontal/vertical flip

Signed-off-by: Shawn Tu <shawnx.tu@intel.com>
---
 drivers/media/i2c/ov5675.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 1ae2523..9d948b4 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -63,6 +63,11 @@
 #define OV5675_TEST_PATTERN_ENABLE	BIT(7)
 #define OV5675_TEST_PATTERN_BAR_SHIFT	2
 
+/* Flip Mirror Controls from sensor */
+#define OV5675_REG_FORMAT1		0x3820
+#define OV5675_REG_FORMAT1_HFLIP	BIT(3)
+#define OV5675_REG_FORMAT1_VFLIP	BIT(4)
+
 #define to_ov5675(_sd)			container_of(_sd, struct ov5675, sd)
 
 enum {
@@ -604,6 +609,36 @@ static int ov5675_test_pattern(struct ov5675 *ov5675, u32 pattern)
 				OV5675_REG_VALUE_08BIT, pattern);
 }
 
+static int ov5675_set_ctrl_hflip(struct ov5675 *ov5675, u32 ctrl_val)
+{
+	int ret;
+	u32 val;
+
+	ret = ov5675_read_reg(ov5675, OV5675_REG_FORMAT1,
+			      OV5675_REG_VALUE_08BIT, &val);
+	if (ret)
+		return ret;
+
+	return ov5675_write_reg(ov5675, OV5675_REG_FORMAT1,
+				OV5675_REG_VALUE_08BIT,
+				ctrl_val ? val & ~OV5675_REG_FORMAT1_HFLIP : val);
+}
+
+static int ov5675_set_ctrl_vflip(struct ov5675 *ov5675, u8 ctrl_val)
+{
+	int ret;
+	u32 val;
+
+	ret = ov5675_read_reg(ov5675, OV5675_REG_FORMAT1,
+			      OV5675_REG_VALUE_08BIT, &val);
+	if (ret)
+		return ret;
+
+	return ov5675_write_reg(ov5675, OV5675_REG_FORMAT1,
+				OV5675_REG_VALUE_08BIT,
+				ctrl_val ? val | OV5675_REG_FORMAT1_VFLIP : val);
+}
+
 static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov5675 *ov5675 = container_of(ctrl->handler,
@@ -654,6 +689,14 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ov5675_test_pattern(ov5675, ctrl->val);
 		break;
 
+	case V4L2_CID_HFLIP:
+		ov5675_set_ctrl_hflip(ov5675, ctrl->val);
+		break;
+
+	case V4L2_CID_VFLIP:
+		ov5675_set_ctrl_vflip(ov5675, ctrl->val);
+		break;
+
 	default:
 		ret = -EINVAL;
 		break;
@@ -722,6 +765,11 @@ static int ov5675_init_controls(struct ov5675 *ov5675)
 				     V4L2_CID_TEST_PATTERN,
 				     ARRAY_SIZE(ov5675_test_pattern_menu) - 1,
 				     0, 0, ov5675_test_pattern_menu);
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov5675_ctrl_ops,
+			  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov5675_ctrl_ops,
+			  V4L2_CID_VFLIP, 0, 1, 1, 0);
+
 	if (ctrl_hdlr->error)
 		return ctrl_hdlr->error;
 
-- 
2.7.4

