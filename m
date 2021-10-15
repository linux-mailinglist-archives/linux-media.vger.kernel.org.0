Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8358242E9B3
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 09:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235839AbhJOHLd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 03:11:33 -0400
Received: from mga07.intel.com ([134.134.136.100]:58058 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234497AbhJOHLc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 03:11:32 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="291348920"
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; 
   d="scan'208";a="291348920"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2021 00:09:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; 
   d="scan'208";a="492354309"
Received: from ipu5-build.bj.intel.com ([10.238.232.188])
  by orsmga008.jf.intel.com with ESMTP; 15 Oct 2021 00:09:24 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Cc:     senozhatsky@chromium.org, tfiga@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH v2] media: imx258: add vblank control to support more frame rate range
Date:   Fri, 15 Oct 2021 15:05:30 +0800
Message-Id: <1634281530-2238-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Current imx258 driver enable the automatic frame length tracking control
by default and did not support VBLANK change, it's always working at 30fps.
However, in reality we need a wider frame rate range from 15 to 30.
This patch disable the automatic frame length tracking control and enable
the v4l2 VBLANK control to allow user changing frame rate per requirement.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/imx258.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)
---
v1->v2: remove a wrong 'break'
---
diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 81cdf37216ca..3f46744b1a26 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -29,6 +29,7 @@
 #define IMX258_VTS_MAX			0xffff
 
 /*Frame Length Line*/
+#define IMX258_REG_FLL			0x0340
 #define IMX258_FLL_MIN			0x08a6
 #define IMX258_FLL_MAX			0xffff
 #define IMX258_FLL_STEP			1
@@ -241,7 +242,7 @@ static const struct imx258_reg mode_4208x3118_regs[] = {
 	{ 0x034D, 0x70 },
 	{ 0x034E, 0x0C },
 	{ 0x034F, 0x30 },
-	{ 0x0350, 0x01 },
+	{ 0x0350, 0x00 },
 	{ 0x0202, 0x0C },
 	{ 0x0203, 0x46 },
 	{ 0x0204, 0x00 },
@@ -360,7 +361,7 @@ static const struct imx258_reg mode_2104_1560_regs[] = {
 	{ 0x034D, 0x38 },
 	{ 0x034E, 0x06 },
 	{ 0x034F, 0x18 },
-	{ 0x0350, 0x01 },
+	{ 0x0350, 0x00 },
 	{ 0x0202, 0x06 },
 	{ 0x0203, 0x2E },
 	{ 0x0204, 0x00 },
@@ -479,7 +480,7 @@ static const struct imx258_reg mode_1048_780_regs[] = {
 	{ 0x034D, 0x18 },
 	{ 0x034E, 0x03 },
 	{ 0x034F, 0x0C },
-	{ 0x0350, 0x01 },
+	{ 0x0350, 0x00 },
 	{ 0x0202, 0x03 },
 	{ 0x0203, 0x42 },
 	{ 0x0204, 0x00 },
@@ -753,8 +754,17 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct imx258 *imx258 =
 		container_of(ctrl->handler, struct imx258, ctrl_handler);
 	struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
+	s64 max;
 	int ret = 0;
 
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		/* Update max exposure to meet expected vblanking */
+		max = imx258->cur_mode->height + ctrl->val - 10;
+		__v4l2_ctrl_modify_range(imx258->exposure,
+					 imx258->exposure->minimum,
+					 max, imx258->exposure->step, max);
+	}
+
 	/*
 	 * Applying V4L2 control value only happens
 	 * when power is up for streaming
@@ -773,6 +783,10 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
 				IMX258_REG_VALUE_16BIT,
 				ctrl->val);
 		break;
+	case V4L2_CID_VBLANK:
+		ret = imx258_write_reg(imx258, IMX258_REG_FLL, 2,
+				       imx258->cur_mode->height + ctrl->val);
+		break;
 	case V4L2_CID_DIGITAL_GAIN:
 		ret = imx258_update_digital_gain(imx258, IMX258_REG_VALUE_16BIT,
 				ctrl->val);
@@ -1189,9 +1203,6 @@ static int imx258_init_controls(struct imx258 *imx258)
 				IMX258_VTS_MAX - imx258->cur_mode->height, 1,
 				vblank_def);
 
-	if (imx258->vblank)
-		imx258->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-
 	imx258->hblank = v4l2_ctrl_new_std(
 				ctrl_hdlr, &imx258_ctrl_ops, V4L2_CID_HBLANK,
 				IMX258_PPL_DEFAULT - imx258->cur_mode->width,
-- 
2.7.4

