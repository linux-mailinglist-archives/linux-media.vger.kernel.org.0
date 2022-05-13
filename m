Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B154F5263BC
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353032AbiEMORH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:17:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346193AbiEMOQ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:16:59 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 871C7126C14
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:16:46 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id A02672001E;
        Fri, 13 May 2022 14:16:44 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     sakari.ailus@iki.fi, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v7 16/28] media: ov5640: Add VBLANK control
Date:   Fri, 13 May 2022 16:14:04 +0200
Message-Id: <20220513141416.120552-17-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513141416.120552-1-jacopo@jmondi.org>
References: <20220513141416.120552-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the VBLANK control which allows to select the duration of the
frame vertical blankings and allows to control the framerate.

The VBLANK control also modifies the exposure time range, which cannot
exceed the maximum frame length.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 52 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 86a489d8963b..36da9ad6cd5b 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -36,6 +36,10 @@
 #define OV5640_PIXEL_ARRAY_WIDTH	2592
 #define OV5640_PIXEL_ARRAY_HEIGHT	1944
 
+/* FIXME: not documented. */
+#define OV5640_MIN_VBLANK	24
+#define OV5640_MAX_VTS		3375
+
 #define OV5640_DEFAULT_SLAVE_ID 0x3c
 
 #define OV5640_LINK_RATE_MAX		490000000U
@@ -322,6 +326,7 @@ struct ov5640_ctrls {
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
 	struct {
 		struct v4l2_ctrl *auto_exp;
 		struct v4l2_ctrl *exposure;
@@ -2701,6 +2706,7 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
 	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
 	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
 	const struct ov5640_timings *timings;
+	s32 exposure_val, exposure_max;
 	unsigned int hblank;
 	unsigned int i = 0;
 	u32 pixel_rate;
@@ -2764,6 +2770,19 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
 	__v4l2_ctrl_modify_range(sensor->ctrls.hblank,
 				 hblank, hblank, 1, hblank);
 
+	__v4l2_ctrl_modify_range(sensor->ctrls.vblank, OV5640_MIN_VBLANK,
+				 OV5640_MAX_VTS - mode->height, 1,
+				 timings->vblank_def);
+	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, timings->vblank_def);
+
+	exposure_max = timings->crop.height + timings->vblank_def - 4;
+	exposure_val = clamp_t(s32, sensor->ctrls.exposure->val,
+			       sensor->ctrls.exposure->minimum,
+			       exposure_max);
+	__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
+				 sensor->ctrls.exposure->minimum,
+				 exposure_max, 1, exposure_val);
+
 	return 0;
 }
 
@@ -3136,6 +3155,15 @@ static int ov5640_set_ctrl_vflip(struct ov5640_dev *sensor, int value)
 			      (BIT(2) | BIT(1)) : 0);
 }
 
+static int ov5640_set_ctrl_vblank(struct ov5640_dev *sensor, int value)
+{
+	const struct ov5640_mode_info *mode = sensor->current_mode;
+
+	/* Update the VTOT timing register value. */
+	return ov5640_write_reg16(sensor, OV5640_REG_TIMING_VTS,
+				  mode->height + value);
+}
+
 static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
@@ -3166,10 +3194,25 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
+	const struct ov5640_mode_info *mode = sensor->current_mode;
+	const struct ov5640_timings *timings;
+	unsigned int exp_max;
 	int ret;
 
 	/* v4l2_ctrl_lock() locks our own mutex */
 
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK:
+		/* Update the exposure range to the newly programmed vblank. */
+		timings = ov5640_timings(sensor, mode);
+		exp_max = mode->height + ctrl->val - 4;
+		__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
+					 sensor->ctrls.exposure->minimum,
+					 exp_max, sensor->ctrls.exposure->step,
+					 timings->vblank_def);
+		break;
+	}
+
 	/*
 	 * If the device is not powered up by the host driver do
 	 * not apply any controls to H/W at this time. Instead
@@ -3209,6 +3252,9 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VFLIP:
 		ret = ov5640_set_ctrl_vflip(sensor, ctrl->val);
 		break;
+	case V4L2_CID_VBLANK:
+		ret = ov5640_set_ctrl_vblank(sensor, ctrl->val);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -3229,6 +3275,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 	struct ov5640_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
 	const struct ov5640_timings *timings;
+	unsigned int max_vblank;
 	unsigned int hblank;
 	int ret;
 
@@ -3254,6 +3301,11 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK, hblank,
 					  hblank, 1, hblank);
 
+	max_vblank = OV5640_MAX_VTS - mode->height;
+	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
+					  OV5640_MIN_VBLANK, max_vblank,
+					  1, timings->vblank_def);
+
 	/* Auto/manual white balance */
 	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
 					   V4L2_CID_AUTO_WHITE_BALANCE,
-- 
2.35.1

