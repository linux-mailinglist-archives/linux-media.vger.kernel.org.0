Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C484B6199CA
	for <lists+linux-media@lfdr.de>; Fri,  4 Nov 2022 15:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232254AbiKDO2Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Nov 2022 10:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232100AbiKDO1d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Nov 2022 10:27:33 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D575C31DC4
        for <linux-media@vger.kernel.org>; Fri,  4 Nov 2022 07:25:25 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id E80D1100005;
        Fri,  4 Nov 2022 14:25:22 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 07/10] media: ar0521: Adjust exposure and blankings limits
Date:   Fri,  4 Nov 2022 15:24:50 +0100
Message-Id: <20221104142452.117135-8-jacopo@jmondi.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104142452.117135-1-jacopo@jmondi.org>
References: <20221104142452.117135-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adjust the control limits for V4L2_CID_VBLANK, V4L2_CID_HBLANK and
V4L2_CID_EXPOSURE when a new format is applied to the sensor.

Update the exposure control limits when a new blanking value is
applied and change the controls initialization to use valid values for the
default format.

The exposure control default value is changed to report the default
value of register 0x3012.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ar0521.c | 84 ++++++++++++++++++++++++++++++--------
 1 file changed, 68 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index c9c578b223ef..0ef4acac1bd3 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -40,7 +40,8 @@
 
 #define AR0521_WIDTH_BLANKING_MIN     572u
 #define AR0521_HEIGHT_BLANKING_MIN     38u /* must be even */
-#define AR0521_TOTAL_WIDTH_MIN	     2968u
+#define AR0521_TOTAL_HEIGHT_MAX     65535u /* max_frame_length_lines */
+#define AR0521_TOTAL_WIDTH_MAX      65532u /* max_line_length_pck */
 
 #define AR0521_ANA_GAIN_MIN		0x00
 #define AR0521_ANA_GAIN_MAX		0x3f
@@ -125,8 +126,6 @@ struct ar0521_dev {
 	struct v4l2_mbus_framefmt fmt;
 	struct ar0521_ctrls ctrls;
 	unsigned int lane_count;
-	u16 total_width;
-	u16 total_height;
 	struct {
 		u16 pre;
 		u16 mult;
@@ -483,6 +482,8 @@ static int ar0521_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_format *format)
 {
 	struct ar0521_dev *sensor = to_ar0521_dev(sd);
+	int max_vblank, max_hblank, exposure_max;
+	int ret;
 
 	ar0521_adj_fmt(&format->format);
 
@@ -493,30 +494,73 @@ static int ar0521_set_fmt(struct v4l2_subdev *sd,
 
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
+	ret = __v4l2_ctrl_modify_range(sensor->ctrls.hblank,
+				       sensor->ctrls.hblank->minimum,
+				       max_hblank, sensor->ctrls.hblank->step,
+				       sensor->ctrls.hblank->minimum);
+	if (ret)
+		goto unlock;
+
+	ret = __v4l2_ctrl_s_ctrl(sensor->ctrls.hblank,
+				 sensor->ctrls.hblank->minimum);
+	if (ret)
+		goto unlock;
+
+	max_vblank = AR0521_TOTAL_HEIGHT_MAX - sensor->fmt.height;
+	ret = __v4l2_ctrl_modify_range(sensor->ctrls.vblank,
+				       sensor->ctrls.vblank->minimum,
+				       max_vblank, sensor->ctrls.vblank->step,
+				       sensor->ctrls.vblank->minimum);
+	if (ret)
+		goto unlock;
+
+	ret = __v4l2_ctrl_s_ctrl(sensor->ctrls.vblank,
+				 sensor->ctrls.vblank->minimum);
+	if (ret)
+		goto unlock;
+
+	exposure_max = sensor->fmt.height + AR0521_HEIGHT_BLANKING_MIN - 4;
+	ret = __v4l2_ctrl_modify_range(sensor->ctrls.exposure,
+				       sensor->ctrls.exposure->minimum,
+				       exposure_max,
+				       sensor->ctrls.exposure->step,
+				       sensor->ctrls.exposure->default_value);
+unlock:
 	mutex_unlock(&sensor->lock);
-	return 0;
+
+	return ret;
 }
 
 static int ar0521_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
 	struct ar0521_dev *sensor = to_ar0521_dev(sd);
+	int exp_max;
 	int ret;
 
 	/* v4l2_ctrl_lock() locks our own mutex */
 
 	switch (ctrl->id) {
-	case V4L2_CID_HBLANK:
 	case V4L2_CID_VBLANK:
-		sensor->total_width = sensor->fmt.width +
-			sensor->ctrls.hblank->val;
-		sensor->total_height = sensor->fmt.width +
-			sensor->ctrls.vblank->val;
+		exp_max = sensor->fmt.height + ctrl->val - 4;
+		__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
+					 sensor->ctrls.exposure->minimum,
+					 exp_max, sensor->ctrls.exposure->step,
+					 sensor->ctrls.exposure->default_value);
 		break;
 	}
 
@@ -574,6 +618,7 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
 	const struct v4l2_ctrl_ops *ops = &ar0521_ctrl_ops;
 	struct ar0521_ctrls *ctrls = &sensor->ctrls;
 	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
+	int max_vblank, max_hblank, exposure_max;
 	struct v4l2_ctrl *link_freq;
 	int ret;
 
@@ -595,11 +640,17 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
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
 
@@ -609,9 +660,10 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
 					   AR0521_PIXEL_CLOCK_MAX, 1,
 					   AR0521_PIXEL_CLOCK_RATE);
 
-	/* Manual exposure time */
+	/* Manual exposure time: max exposure time = visible + blank - 4 */
+	exposure_max = AR0521_HEIGHT_MAX + AR0521_HEIGHT_BLANKING_MIN - 4;
 	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE, 0,
-					    65535, 1, 360);
+					    exposure_max, 1, 0x70);
 
 	link_freq = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
 					ARRAY_SIZE(ar0521_link_frequencies) - 1,
-- 
2.38.1

