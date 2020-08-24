Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C89FD24F18C
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 05:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbgHXDcb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Aug 2020 23:32:31 -0400
Received: from mga03.intel.com ([134.134.136.65]:52504 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726684AbgHXDca (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Aug 2020 23:32:30 -0400
IronPort-SDR: OebyS+LGvvmz9kdlZkVQZbdc6baibMV4pUoJQJjHBuqGtv0/HWlAMSWI4lvRXRoAJkyXuSw3bi
 BVTUytIuCJAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="155817023"
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; 
   d="scan'208";a="155817023"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2020 20:32:29 -0700
IronPort-SDR: 6B21SWdOH7Wq7yt394qVt97Avl28lO82akDvzpnmYEbe9gVqMPi+ZIYlUmmOkhhlggYFCjbPfX
 sp6s9KyB0GLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; 
   d="scan'208";a="294449938"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by orsmga003.jf.intel.com with ESMTP; 23 Aug 2020 20:32:27 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        tfiga@chromium.org, shawnx.tu@intel.com
Cc:     senozhatsky@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com, hongju.wang@intel.com
Subject: [PATCH v3] media: ov5675: correct the maximum exposure value
Date:   Mon, 24 Aug 2020 11:31:32 +0800
Message-Id: <1598239892-4493-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The unit of exposure value is different from other OmniVision sensors
driver will divide by 2 before set register, the exposure range exposed
by v4l2 ctrl to user should be same as others, so the calculation for
the maximum exposure value in current driver need be fixed.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/ov5675.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 8537cc4ca108..813b4cc99a87 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -662,12 +662,13 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(&ov5675->sd);
 	s64 exposure_max;
 	int ret = 0;
+	s32 val;
 
 	/* Propagate change of current control to all related controls */
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		/* Update max exposure while meeting expected vblanking */
-		exposure_max = (ov5675->cur_mode->height + ctrl->val -
-			       OV5675_EXPOSURE_MAX_MARGIN) / 2;
+		exposure_max = ov5675->cur_mode->height + ctrl->val -
+			OV5675_EXPOSURE_MAX_MARGIN;
 		__v4l2_ctrl_modify_range(ov5675->exposure,
 					 ov5675->exposure->minimum,
 					 exposure_max, ov5675->exposure->step,
@@ -689,9 +690,15 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_EXPOSURE:
-		/* 3 least significant bits of expsoure are fractional part */
+		/* 4 least significant bits of exposure are fractional part
+		 * for ov5675, the unit of exposure is different from other
+		 * OmniVision sensors, its exposure value is twice of the
+		 * register value, the exposure should be divided by 2 before
+		 * set register.
+		 */
+		val = (ctrl->val << 4) / 2;
 		ret = ov5675_write_reg(ov5675, OV5675_REG_EXPOSURE,
-				       OV5675_REG_VALUE_24BIT, ctrl->val << 3);
+				       OV5675_REG_VALUE_24BIT, val);
 		break;
 
 	case V4L2_CID_VBLANK:
@@ -770,8 +777,7 @@ static int ov5675_init_controls(struct ov5675 *ov5675)
 	v4l2_ctrl_new_std(ctrl_hdlr, &ov5675_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
 			  OV5675_DGTL_GAIN_MIN, OV5675_DGTL_GAIN_MAX,
 			  OV5675_DGTL_GAIN_STEP, OV5675_DGTL_GAIN_DEFAULT);
-	exposure_max = (ov5675->cur_mode->vts_def -
-			OV5675_EXPOSURE_MAX_MARGIN) / 2;
+	exposure_max = (ov5675->cur_mode->vts_def - OV5675_EXPOSURE_MAX_MARGIN);
 	ov5675->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov5675_ctrl_ops,
 					     V4L2_CID_EXPOSURE,
 					     OV5675_EXPOSURE_MIN, exposure_max,
-- 
2.7.4

