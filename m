Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0289F4D0DF2
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 03:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243788AbiCHCWt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Mar 2022 21:22:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236987AbiCHCWt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Mar 2022 21:22:49 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121A73205B
        for <linux-media@vger.kernel.org>; Mon,  7 Mar 2022 18:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646706114; x=1678242114;
  h=from:to:cc:subject:date:message-id;
  bh=DGPk7/csTKegUNnSklIpHpZrhvvCsmVEYc8er6c7yLA=;
  b=F1SXQUL5d+Gu4+v5g9QspsvXauaPbIuNKFwLrQVHd8lEyR0eC+9Ty4qk
   r5MVW3xewDTSYo2XHMcQZWg8HNPPnC4PWfZVT7G393tbnViVWhSRk2y58
   OPtXjD3AuQWzF2NJ1PO8Xj9ff8YR2nlaUIxveRNlpWnme4Gow80rfgNqf
   JUGMAvVgiGYoQAjuBjhDN/8PVZC0To2koRU3tLd8M+Zly8RwHv/PFd/pQ
   NjJH1UROojrQZB0w7vRXjKktIR4u1QhUnTk+W1yT4dC+A13Yx6QP3wZ+8
   qQaatp8lcmeob3rctwguhOD6PcnXkv7dLv0K9ysKOu1WAKXpNata4axHe
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254758327"
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; 
   d="scan'208";a="254758327"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2022 18:21:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; 
   d="scan'208";a="711356430"
Received: from arec-bm6650.itwn.intel.com ([10.5.253.20])
  by orsmga005.jf.intel.com with ESMTP; 07 Mar 2022 18:21:52 -0800
From:   Arec Kao <arec.kao@intel.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, andy.yeh@intel.com, tfiga@google.com,
        arec.kao@intel.com
Subject: [PATCH 1/2] Add a V4L2 control to allow configuring BLC from userspace.
Date:   Tue,  8 Mar 2022 11:38:38 +0800
Message-Id: <20220308033839.3773-1-arec.kao@intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Trigger BLC update when analog gain change in specific range.

Signed-off-by: Arec Kao <arec.kao@intel.com>
---
 drivers/media/i2c/ov5675.c                | 41 ++++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c |  1 +
 include/uapi/linux/v4l2-controls.h        |  1 +
 3 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 82ba9f56baec..39a0a7a06249 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -74,6 +74,13 @@
 #define OV5675_REG_FORMAT1		0x3820
 #define OV5675_REG_FORMAT2		0x373d
 
+/* BLC Control */
+#define OV5675_REG_BLC_CTRL10		0x4010
+#define OV5675_BLC_ENABLE		BIT(6) /* Gain change BLC trigger enable */
+
+#define OV5675_REG_BLC_CTRL11		0x4011
+#define OV5675_BLC_MULTI_FRAME_ENABLE	BIT(4) /* Gain change BLC trigger multi-frame enable */
+
 #define to_ov5675(_sd)			container_of(_sd, struct ov5675, sd)
 
 enum {
@@ -684,6 +691,34 @@ static int ov5675_set_ctrl_vflip(struct ov5675 *ov5675, u8 ctrl_val)
 				ctrl_val ? val | BIT(1) : val & ~BIT(1));
 }
 
+static int ov5675_update_blc(struct ov5675 *ov5675, u8 ctrl_val)
+{
+	int ret;
+	u32 val;
+
+	ret = ov5675_read_reg(ov5675, OV5675_REG_BLC_CTRL10,
+			      OV5675_REG_VALUE_08BIT, &val);
+	if (ret)
+		return ret;
+
+	ret = ov5675_write_reg(ov5675, OV5675_REG_BLC_CTRL10,
+			       OV5675_REG_VALUE_08BIT,
+			       ctrl_val ? val | OV5675_BLC_ENABLE :
+			       val & ~OV5675_BLC_ENABLE);
+	if (ret)
+		return ret;
+
+	ret = ov5675_read_reg(ov5675, OV5675_REG_BLC_CTRL11,
+			      OV5675_REG_VALUE_08BIT, &val);
+	if (ret)
+		return ret;
+
+	return ov5675_write_reg(ov5675, OV5675_REG_BLC_CTRL11,
+				OV5675_REG_VALUE_08BIT,
+				ctrl_val ? val | OV5675_BLC_MULTI_FRAME_ENABLE :
+				val & ~OV5675_BLC_MULTI_FRAME_ENABLE);
+}
+
 static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov5675 *ov5675 = container_of(ctrl->handler,
@@ -748,6 +783,9 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
 		ov5675_set_ctrl_vflip(ov5675, ctrl->val);
 		break;
 
+	case V4L2_CID_BLC:
+		ret = ov5675_update_blc(ov5675, ctrl->val);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -819,7 +857,8 @@ static int ov5675_init_controls(struct ov5675 *ov5675)
 			  V4L2_CID_HFLIP, 0, 1, 1, 0);
 	v4l2_ctrl_new_std(ctrl_hdlr, &ov5675_ctrl_ops,
 			  V4L2_CID_VFLIP, 0, 1, 1, 0);
-
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov5675_ctrl_ops,
+			  V4L2_CID_BLC, 0, 1, 1, 1);
 	if (ctrl_hdlr->error)
 		return ctrl_hdlr->error;
 
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 54ca4e6b820b..2b0b295fc047 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1110,6 +1110,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
 	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
 	case V4L2_CID_NOTIFY_GAINS:		return "Notify Gains";
+	case V4L2_CID_BLC:			return "Black Level Calibration";
 
 	/* Image processing controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index c8e0f84d204d..0a0fb1283124 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1126,6 +1126,7 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_TEST_PATTERN_GREENB		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 7)
 #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
 #define V4L2_CID_NOTIFY_GAINS			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
+#define V4L2_CID_BLC				(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 10)
 
 
 /* Image processing controls */
-- 
2.17.1

