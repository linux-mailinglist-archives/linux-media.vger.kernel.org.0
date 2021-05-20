Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEF2389B9E
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 05:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbhETDIi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 23:08:38 -0400
Received: from mga06.intel.com ([134.134.136.31]:59835 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229504AbhETDIi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 23:08:38 -0400
IronPort-SDR: HqAI1fxM5zpCeLIcC8Ecwfk++hzYkpNzXQegXPQXLSBMfeQne12a9SdqaeHwdOVysvzJuYG8wU
 DLdMPXFWqBig==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="262354115"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="262354115"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2021 20:07:17 -0700
IronPort-SDR: aA46tY+jGke4UOyMTFT3j3ZmX90pto3spoMtDNsxOs914IVL02H32iL/yZ4i8M4+LnbJz1wv2K
 US0MezjFFPTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="440252287"
Received: from server-intel-chrome-camera.itwn.intel.com ([10.5.215.143])
  by orsmga008.jf.intel.com with ESMTP; 19 May 2021 20:07:15 -0700
From:   Shawnx Tu <shawnx.tu@intel.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andy.yeh@intel.com,
        shawnx.tu@intel.com, jim.lai@intel.com, bingbu.cao@intel.com,
        tfiga@chromium.org, senozhatsky@google.com
Subject: [PATCH v4 2/2] ov8856: add vflip/hflip control support
Date:   Thu, 20 May 2021 11:07:06 +0800
Message-Id: <20210520030706.7613-2-shawnx.tu@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210520030706.7613-1-shawnx.tu@intel.com>
References: <20210520030706.7613-1-shawnx.tu@intel.com>
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
index ef5477cf899c..dfb80cbaf755 100644
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
@@ -1653,6 +1672,93 @@ static int ov8856_test_pattern(struct ov8856 *ov8856, u32 pattern)
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
@@ -1702,6 +1808,14 @@ static int ov8856_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -1778,6 +1892,10 @@ static int ov8856_init_controls(struct ov8856 *ov8856)
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

