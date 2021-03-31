Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B82834FC41
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 11:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234411AbhCaJMv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 05:12:51 -0400
Received: from mga14.intel.com ([192.55.52.115]:21793 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234359AbhCaJMm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 05:12:42 -0400
IronPort-SDR: 5Mb2vOr5oxToATeaOt5YSivYcsTr/ZlN7etbwFPv/w1U9MlNyRNNp7Fo7ueQbqjUrbzjQlPXaw
 9ENFQkzW6VBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="191441224"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="191441224"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 02:12:42 -0700
IronPort-SDR: DCgtfQN4lnxsIg8Kwyjjq4V71pGpjcCXXD+1HfiR0LCr4U0l4zsfzUV5gIgbrB6dHmaFgjHGUA
 uhVLj3e0ZHZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="438704707"
Received: from server-intel-chrome-camera.itwn.intel.com ([10.5.215.143])
  by fmsmga004.fm.intel.com with ESMTP; 31 Mar 2021 02:12:40 -0700
From:   Shawnx Tu <shawnx.tu@intel.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andy.yeh@intel.com,
        shawnx.tu@intel.com, jim.lai@intel.com, bingbu.cao@intel.com,
        senozhatsky@google.com, tfiga@google.com
Subject: [PATCH v3 2/2] ov8856: add vflip/hflip control support
Date:   Wed, 31 Mar 2021 17:12:44 +0800
Message-Id: <20210331091244.2142-2-shawnx.tu@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210331091244.2142-1-shawnx.tu@intel.com>
References: <20210331091244.2142-1-shawnx.tu@intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Shawn Tu <shawnx.tu@intel.com>

Add V4L2 controls: horizontal/vertical flip,
keep SGRBG10 Bayer order output (via change v/hflip)

Signed-off-by: Shawn Tu <shawnx.tu@intel.com>
---
 drivers/media/i2c/ov8856.c | 118 +++++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 502cc703f2a1..6dcc6f72c017 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -80,6 +80,25 @@
 #define NUM_MODE_REGS				187
 #define NUM_MODE_REGS_2				200
 
+/* Flip Mirror Controls from sensor */
+#define OV8856_REG_FORMAT1			0x3820
+#define OV8856_REG_FORMAT2			0x3821
+#define OV8856_REG_FORMAT1_OP_1			BIT(1)
+#define OV8856_REG_FORMAT1_OP_2			BIT(2)
+#define OV8856_REG_FORMAT1_OP_3			BIT(6)
+#define OV8856_REG_FORMAT2_OP_1			BIT(1)
+#define OV8856_REG_FORMAT2_OP_2			BIT(2)
+#define OV8856_REG_FORMAT2_OP_3			BIT(6)
+#define OV8856_REG_FLIP_OPT_1			0x376b
+#define OV8856_REG_FLIP_OPT_2			0x5001
+#define OV8856_REG_FLIP_OPT_3			0x502e
+#define OV8856_REG_MIRROR_OPT_1			0x5004
+#define OV8856_REG_FLIP_OP_0			BIT(0)
+#define OV8856_REG_FLIP_OP_1			BIT(1)
+#define OV8856_REG_FLIP_OP_2			BIT(2)
+#define OV8856_REG_MIRROR_OP_1			BIT(1)
+#define OV8856_REG_MIRROR_OP_2			BIT(2)
+
 #define to_ov8856(_sd)			container_of(_sd, struct ov8856, sd)
 
 static const char * const ov8856_supply_names[] = {
@@ -1651,6 +1670,93 @@ static int ov8856_test_pattern(struct ov8856 *ov8856, u32 pattern)
 				OV8856_REG_VALUE_08BIT, pattern);
 }
 
+static int ov8856_set_ctrl_hflip(struct ov8856 *ov8856, u32 ctrl_val)
+{
+	int ret;
+	u32 val;
+
+	ret = ov8856_read_reg(ov8856, OV8856_REG_MIRROR_OPT_1,
+			      OV8856_REG_VALUE_08BIT, &val);
+	if (ret)
+		return ret;
+
+	ret = ov8856_write_reg(ov8856, OV8856_REG_MIRROR_OPT_1,
+			       OV8856_REG_VALUE_08BIT,
+			       ctrl_val ? val & ~OV8856_REG_MIRROR_OP_2 :
+			       val | OV8856_REG_MIRROR_OP_2);
+
+	if (ret)
+		return ret;
+
+	ret = ov8856_read_reg(ov8856, OV8856_REG_FORMAT2,
+			      OV8856_REG_VALUE_08BIT, &val);
+	if (ret)
+		return ret;
+
+	return ov8856_write_reg(ov8856, OV8856_REG_FORMAT2,
+				OV8856_REG_VALUE_08BIT,
+				ctrl_val ? val & ~OV8856_REG_FORMAT2_OP_1 &
+				~OV8856_REG_FORMAT2_OP_2 &
+				~OV8856_REG_FORMAT2_OP_3 :
+				val | OV8856_REG_FORMAT2_OP_1 |
+				OV8856_REG_FORMAT2_OP_2 |
+				OV8856_REG_FORMAT2_OP_3);
+}
+
+static int ov8856_set_ctrl_vflip(struct ov8856 *ov8856, u8 ctrl_val)
+{
+	int ret;
+	u32 val;
+
+	ret = ov8856_read_reg(ov8856, OV8856_REG_FLIP_OPT_1,
+			      OV8856_REG_VALUE_08BIT, &val);
+	if (ret)
+		return ret;
+
+	ret = ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_1,
+			       OV8856_REG_VALUE_08BIT,
+			       ctrl_val ? val | OV8856_REG_FLIP_OP_1 |
+			       OV8856_REG_FLIP_OP_2 :
+			       val & ~OV8856_REG_FLIP_OP_1 &
+			       ~OV8856_REG_FLIP_OP_2);
+
+	ret = ov8856_read_reg(ov8856, OV8856_REG_FLIP_OPT_2,
+			      OV8856_REG_VALUE_08BIT, &val);
+	if (ret)
+		return ret;
+
+	ret = ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_2,
+			       OV8856_REG_VALUE_08BIT,
+			       ctrl_val ? val | OV8856_REG_FLIP_OP_2 :
+			       val & ~OV8856_REG_FLIP_OP_2);
+
+	ret = ov8856_read_reg(ov8856, OV8856_REG_FLIP_OPT_3,
+			      OV8856_REG_VALUE_08BIT, &val);
+	if (ret)
+		return ret;
+
+	ret = ov8856_write_reg(ov8856, OV8856_REG_FLIP_OPT_3,
+			       OV8856_REG_VALUE_08BIT,
+			       ctrl_val ? val & ~OV8856_REG_FLIP_OP_0 &
+			       ~OV8856_REG_FLIP_OP_1 :
+			       val | OV8856_REG_FLIP_OP_0 |
+			       OV8856_REG_FLIP_OP_1);
+
+	ret = ov8856_read_reg(ov8856, OV8856_REG_FORMAT1,
+			      OV8856_REG_VALUE_08BIT, &val);
+	if (ret)
+		return ret;
+
+	return ov8856_write_reg(ov8856, OV8856_REG_FORMAT1,
+			       OV8856_REG_VALUE_08BIT,
+			       ctrl_val ? val | OV8856_REG_FORMAT1_OP_1 |
+			       OV8856_REG_FORMAT1_OP_3 |
+			       OV8856_REG_FORMAT1_OP_2 :
+			       val & ~OV8856_REG_FORMAT1_OP_1 &
+			       ~OV8856_REG_FORMAT1_OP_3 &
+			       ~OV8856_REG_FORMAT1_OP_2);
+}
+
 static int ov8856_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov8856 *ov8856 = container_of(ctrl->handler,
@@ -1700,6 +1806,14 @@ static int ov8856_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ov8856_test_pattern(ov8856, ctrl->val);
 		break;
 
+	case V4L2_CID_HFLIP:
+		ret = ov8856_set_ctrl_hflip(ov8856, ctrl->val);
+		break;
+
+	case V4L2_CID_VFLIP:
+		ret = ov8856_set_ctrl_vflip(ov8856, ctrl->val);
+		break;
+
 	default:
 		ret = -EINVAL;
 		break;
@@ -1776,6 +1890,10 @@ static int ov8856_init_controls(struct ov8856 *ov8856)
 				     V4L2_CID_TEST_PATTERN,
 				     ARRAY_SIZE(ov8856_test_pattern_menu) - 1,
 				     0, 0, ov8856_test_pattern_menu);
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov8856_ctrl_ops,
+			  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov8856_ctrl_ops,
+			  V4L2_CID_VFLIP, 0, 1, 1, 0);
 	if (ctrl_hdlr->error)
 		return ctrl_hdlr->error;
 
-- 
2.17.1

