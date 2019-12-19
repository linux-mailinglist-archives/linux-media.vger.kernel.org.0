Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7248A125AE5
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 06:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfLSFqK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 00:46:10 -0500
Received: from mga03.intel.com ([134.134.136.65]:42099 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbfLSFqK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 00:46:10 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Dec 2019 21:46:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; 
   d="scan'208";a="222180730"
Received: from shawn-bm6650-pc.itwn.intel.com ([10.5.230.127])
  by fmsmga001.fm.intel.com with ESMTP; 18 Dec 2019 21:46:08 -0800
From:   Shawnx Tu <shawnx.tu@intel.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andy.yeh@intel.com,
        shawnx.tu@intel.com
Subject: [PATCH v1] ov5675: add vflip/hflip control support
Date:   Thu, 19 Dec 2019 13:46:06 +0800
Message-Id: <1576734366-5313-1-git-send-email-shawnx.tu@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Shawnx <shawnx.tu@intel.com>

Add V4L2 controls: horizontal/vertical flip

Signed-off-by: Shawn Tu <shawnx.tu@intel.com>
---
 drivers/media/i2c/ov5675.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 1ae2523..16874f5 100644
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
@@ -604,6 +609,40 @@ static int ov5675_test_pattern(struct ov5675 *ov5675, u32 pattern)
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
+	if (ctrl_val)
+		val &= ~OV5675_REG_FORMAT1_HFLIP;
+
+	return ov5675_write_reg(ov5675, OV5675_REG_FORMAT1,
+				OV5675_REG_VALUE_08BIT, val);
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
+	if (ctrl_val)
+		val |= OV5675_REG_FORMAT1_VFLIP;
+
+	return ov5675_write_reg(ov5675, OV5675_REG_FORMAT1,
+				OV5675_REG_VALUE_08BIT, val);
+}
+
 static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov5675 *ov5675 = container_of(ctrl->handler,
@@ -654,6 +693,14 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -722,6 +769,11 @@ static int ov5675_init_controls(struct ov5675 *ov5675)
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

