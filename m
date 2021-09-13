Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9148C40893D
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 12:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239019AbhIMKm1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 06:42:27 -0400
Received: from mga06.intel.com ([134.134.136.31]:59829 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238472AbhIMKm0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 06:42:26 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="282637415"
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; 
   d="scan'208";a="282637415"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2021 03:41:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; 
   d="scan'208";a="481270026"
Received: from ipu5-build.bj.intel.com ([10.238.232.202])
  by orsmga008.jf.intel.com with ESMTP; 13 Sep 2021 03:41:08 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Cc:     senozhatsky@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com, qingwu.zhang@intel.com
Subject: [PATCH] media: imx208: support adjust range of exposure per VBLANK control
Date:   Mon, 13 Sep 2021 18:39:59 +0800
Message-Id: <1631529599-2276-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Qingwu Zhang <qingwu.zhang@intel.com>

Current the max value of imx208 exposure time was hardcoded to 15ms,
it will cause the sensor can not support longer exposure time such as
30ms and 66ms, this patch add support of setting the VBLANK control to
increase the exposure range to meet expected longer exposure.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Qingwu Zhang <qingwu.zhang@intel.com>
---
 drivers/media/i2c/imx208.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx208.c b/drivers/media/i2c/imx208.c
index 6f3d9c1b5879..83d581967c6d 100644
--- a/drivers/media/i2c/imx208.c
+++ b/drivers/media/i2c/imx208.c
@@ -277,6 +277,7 @@ struct imx208 {
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *vflip;
 	struct v4l2_ctrl *hflip;
 
@@ -432,8 +433,17 @@ static int imx208_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct imx208 *imx208 =
 		container_of(ctrl->handler, struct imx208, ctrl_handler);
 	struct i2c_client *client = v4l2_get_subdevdata(&imx208->sd);
+	s64 max;
 	int ret;
 
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		/* Update max exposure while meeting expected vblanking */
+		max = imx208->cur_mode->height + ctrl->val - 8;
+		__v4l2_ctrl_modify_range(imx208->exposure,
+					 imx208->exposure->minimum,
+					 max, imx208->exposure->step, max);
+	}
+
 	/*
 	 * Applying V4L2 control value only happens
 	 * when power is up for streaming
@@ -914,9 +924,11 @@ static int imx208_init_controls(struct imx208 *imx208)
 		imx208->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	exposure_max = imx208->cur_mode->vts_def - 8;
-	v4l2_ctrl_new_std(ctrl_hdlr, &imx208_ctrl_ops, V4L2_CID_EXPOSURE,
-			  IMX208_EXPOSURE_MIN, exposure_max,
-			  IMX208_EXPOSURE_STEP, IMX208_EXPOSURE_DEFAULT);
+	imx208->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx208_ctrl_ops,
+					     V4L2_CID_EXPOSURE,
+					     IMX208_EXPOSURE_MIN, exposure_max,
+					     IMX208_EXPOSURE_STEP,
+					     IMX208_EXPOSURE_DEFAULT);
 
 	imx208->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx208_ctrl_ops,
 					  V4L2_CID_HFLIP, 0, 1, 1, 0);
-- 
2.7.4

