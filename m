Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05FA95F5A5F
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 21:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231410AbiJETHB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 15:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbiJETG5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 15:06:57 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76FA67FE69
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 12:06:56 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 84587FF808;
        Wed,  5 Oct 2022 19:06:51 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Subject: [PATCH 07/10] media: ar0521: Adjust exposure and blankings limits
Date:   Wed,  5 Oct 2022 21:06:10 +0200
Message-Id: <20221005190613.394277-8-jacopo@jmondi.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005190613.394277-1-jacopo@jmondi.org>
References: <20221005190613.394277-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adjust the control limits for V4L2_CID_VBLANK, V4L2_CID_HBLANK and
V4L2_CID_EXPOSURE when a new format is applied to the sensor.

Also update the exposure control when a new blanking value is applied.

Also change the controls initialization to use valid values for the
default format.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ar0521.c | 77 ++++++++++++++++++++++++++++----------
 1 file changed, 57 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index b1580c99f5e3..26bb1b8f7453 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -42,7 +42,8 @@
 
 #define AR0521_WIDTH_BLANKING_MIN     572u
 #define AR0521_HEIGHT_BLANKING_MIN     38u /* must be even */
-#define AR0521_TOTAL_WIDTH_MIN	     2968u
+#define AR0521_TOTAL_HEIGHT_MAX      2464u /* max value of y_addr_end reg */
+#define AR0521_TOTAL_WIDTH_MAX       3280u /* max value of x_addr_end reg */
 
 #define AR0521_ANA_GAIN_MIN		0x00
 #define AR0521_ANA_GAIN_MAX		0x3f
@@ -131,8 +132,6 @@ struct ar0521_dev {
 	struct v4l2_mbus_framefmt fmt;
 	struct ar0521_ctrls ctrls;
 	unsigned int lane_count;
-	u16 total_width;
-	u16 total_height;
 	struct {
 		u16 pre;
 		u16 mult;
@@ -544,7 +543,8 @@ static int ar0521_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_format *format)
 {
 	struct ar0521_dev *sensor = to_ar0521_dev(sd);
-	int ret = 0;
+	int exposure_max, exposure_val;
+	int max_vblank, max_hblank;
 
 	ar0521_adj_fmt(&format->format);
 
@@ -555,13 +555,44 @@ static int ar0521_set_fmt(struct v4l2_subdev *sd,
 
 		fmt = v4l2_subdev_get_try_format(sd, sd_state, 0 /* pad */);
 		*fmt = format->format;
-	} else {
-		sensor->fmt = format->format;
-		ar0521_calc_mode(sensor);
+
+		mutex_unlock(&sensor->lock);
+
+		return 0;
 	}
 
+	sensor->fmt = format->format;
+	ar0521_calc_mode(sensor);
+
+	/*
+	 * Update the exposure and blankings limits. Blankings are also reset
+	 * to the minimum.
+	 */
+	max_hblank = AR0521_TOTAL_WIDTH_MAX - sensor->fmt.width;
+	__v4l2_ctrl_modify_range(sensor->ctrls.hblank,
+				 sensor->ctrls.hblank->minimum,
+				 max_hblank, sensor->ctrls.hblank->step,
+				 sensor->ctrls.hblank->minimum);
+	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, sensor->ctrls.hblank->minimum);
+
+	max_vblank = AR0521_TOTAL_HEIGHT_MAX - sensor->fmt.height;
+	__v4l2_ctrl_modify_range(sensor->ctrls.vblank,
+				 sensor->ctrls.vblank->minimum,
+				 max_vblank, sensor->ctrls.vblank->step,
+				 sensor->ctrls.vblank->minimum);
+	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, sensor->ctrls.vblank->minimum);
+
+	exposure_max = sensor->fmt.height + AR0521_HEIGHT_BLANKING_MIN - 4;
+	exposure_val = min(sensor->ctrls.exposure->val, exposure_max);
+	__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
+				 sensor->ctrls.exposure->minimum,
+				 exposure_max, sensor->ctrls.exposure->step,
+				 exposure_val);
+	__v4l2_ctrl_s_ctrl(sensor->ctrls.exposure, exposure_val);
+
 	mutex_unlock(&sensor->lock);
-	return ret;
+
+	return 0;
 }
 
 static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -573,15 +604,13 @@ static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
 	/* v4l2_ctrl_lock() locks our own mutex */
 
 	switch (ctrl->id) {
-	case V4L2_CID_HBLANK:
 	case V4L2_CID_VBLANK:
-		sensor->total_width = sensor->fmt.width +
-			sensor->ctrls.hblank->val;
-		sensor->total_height = sensor->fmt.width +
-			sensor->ctrls.vblank->val;
-		break;
-	default:
-		ret = -EINVAL;
+		int exp_max = sensor->fmt.height + ctrl->val - 4;
+		int exp_val = min(sensor->ctrls.exposure->val, exp_max);
+		__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
+					 sensor->ctrls.exposure->minimum,
+					 exp_max, sensor->ctrls.exposure->step,
+					 exp_val);
 		break;
 	}
 
@@ -633,6 +662,7 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
 	const struct v4l2_ctrl_ops *ops = &ar0521_ctrl_ops;
 	struct ar0521_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
+	int max_vblank, max_hblank, exposure_max;
 	int ret;
 
 	v4l2_ctrl_handler_init(hdl, 32);
@@ -655,11 +685,17 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
 						-512, 511, 1, 0);
 	v4l2_ctrl_cluster(3, &ctrls->gain);
 
+	/* Initialize blanking limits using the default 2592x1944 format. */
+	max_hblank = AR0521_TOTAL_WIDTH_MAX - AR0521_WIDTH_MAX;
 	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK,
-					  AR0521_WIDTH_BLANKING_MIN, 4094, 1,
+					  AR0521_WIDTH_BLANKING_MIN,
+					  max_hblank, 1,
 					  AR0521_WIDTH_BLANKING_MIN);
+
+	max_vblank = AR0521_TOTAL_HEIGHT_MAX - AR0521_HEIGHT_MAX;
 	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
-					  AR0521_HEIGHT_BLANKING_MIN, 4094, 2,
+					  AR0521_HEIGHT_BLANKING_MIN,
+					  max_vblank, 2,
 					  AR0521_HEIGHT_BLANKING_MIN);
 	v4l2_ctrl_cluster(2, &ctrls->hblank);
 
@@ -669,9 +705,10 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
 					   AR0521_PIXEL_CLOCK_MAX, 1,
 					   AR0521_PIXEL_CLOCK_RATE);
 
-	/* Manual exposure time */
+	/* Manual exposure time: max exposure time = visible + blank - 4 */
+	exposure_max = AR0521_HEIGHT_MAX + AR0521_HEIGHT_BLANKING_MIN - 4;
 	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE, 0,
-					    65535, 1, 360);
+					    exposure_max, 1, 360);
 
 	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
 					ARRAY_SIZE(ar0521_link_frequencies) - 1,
-- 
2.37.3

