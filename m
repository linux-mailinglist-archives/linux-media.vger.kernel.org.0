Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88DF424D033
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 10:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgHUIAv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 04:00:51 -0400
Received: from mga17.intel.com ([192.55.52.151]:59505 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727902AbgHUIAv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 04:00:51 -0400
IronPort-SDR: IDzsQuNnrU1goaez5JFL8Iy4O/QWaPaid2LTVDLCk0TZjYPpo/Qz0HuRp+BxjBlVSm93pFSU0Y
 iezForRclSvg==
X-IronPort-AV: E=McAfee;i="6000,8403,9719"; a="135546116"
X-IronPort-AV: E=Sophos;i="5.76,335,1592895600"; 
   d="scan'208";a="135546116"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2020 01:00:51 -0700
IronPort-SDR: siLAv5mWhxgcx2X/RSyCIBvX6nBMgwWjJXESq6i9qurQ04SkYfQbaVRWF9AVQDeoDcamN8+2w/
 ctbfW+ExqRQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,335,1592895600"; 
   d="scan'208";a="311370593"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by orsmga002.jf.intel.com with ESMTP; 21 Aug 2020 01:00:48 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        shawnx.tu@intel.com
Cc:     senozhatsky@chromium.org, tfiga@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com, hongju.wang@intel.com
Subject: [PATCH v2] media: ov5675: correct the maximum exposure value
Date:   Fri, 21 Aug 2020 15:59:50 +0800
Message-Id: <1597996790-21121-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The unit of exposure value is different from other OmniVision sensors,
driver will divide by 2 before set register, the exposure range exposed
by v4l2 ctrl to user should be same as others, so the calculation for
the maximum exposure value in current driver need be fixed.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/ov5675.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 8537cc4ca108..9540ce8918f0 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -666,8 +666,8 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -689,7 +689,13 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_EXPOSURE:
-		/* 3 least significant bits of expsoure are fractional part */
+		/* 4 least significant bits of expsoure are fractional part
+		 * val = val << 4
+		 * for ov5675, the unit of exposure is differnt from other
+		 * OmniVision sensors, its exposure value is twice of the
+		 * register value, the exposure should be divided by 2 before
+		 * set register, e.g. val << 3.
+		 */
 		ret = ov5675_write_reg(ov5675, OV5675_REG_EXPOSURE,
 				       OV5675_REG_VALUE_24BIT, ctrl->val << 3);
 		break;
@@ -770,8 +776,7 @@ static int ov5675_init_controls(struct ov5675 *ov5675)
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

