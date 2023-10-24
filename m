Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4113F7D447E
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 03:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbjJXBHx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 21:07:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231824AbjJXAvf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 20:51:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F319910E
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 17:51:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 744B7128D;
        Tue, 24 Oct 2023 02:51:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698108677;
        bh=To/N0JtBBDNKSyDB9ylDmIGcJHGess6jPoj9ixGYWCw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J1qZa/FkKjVmP6QLor2A4ycvKO9HU+cByn5Hw/eNeZ9y2ITZpMGJZHWrQouvE96hP
         sJShbTtVmrZE198AHFA2NTD9XpFnCtj4oh71McJEEnkzcsevAeknNOPnGOA1qlnegV
         1OZC9siIWVZFAjoENhFWOkDQej/7kARH772EmVVM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Hans de Goede <hansg@kernel.org>
Subject: [RFC PATCH v1 4/4] media: i2c: thp7312: Store frame interval in subdev state
Date:   Tue, 24 Oct 2023 03:51:30 +0300
Message-ID: <20231024005130.28026-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231024005130.28026-1-laurent.pinchart@ideasonboard.com>
References: <20231024005130.28026-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the newly added storage for frame interval in the subdev state to
simplify the driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/thp7312.c | 145 ++++++++++++++++++++----------------
 1 file changed, 79 insertions(+), 66 deletions(-)

diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
index c5b1b6321633..28f869f69d02 100644
--- a/drivers/media/i2c/thp7312.c
+++ b/drivers/media/i2c/thp7312.c
@@ -278,10 +278,6 @@ struct thp7312_device {
 
 	struct v4l2_ctrl_handler ctrl_handler;
 
-	/* These are protected by v4l2 active state */
-	const struct thp7312_mode_info *current_mode;
-	const struct thp7312_frame_rate *current_rate;
-
 	struct {
 		struct v4l2_ctrl *focus_auto;
 		struct v4l2_ctrl *focus_absolute;
@@ -329,6 +325,47 @@ static inline struct thp7312_device *to_thp7312_dev(struct v4l2_subdev *sd)
 	return container_of(sd, struct thp7312_device, sd);
 }
 
+static const struct thp7312_mode_info *
+thp7312_find_mode(unsigned int width, unsigned int height, bool nearest)
+{
+	const struct thp7312_mode_info *mode;
+
+	mode = v4l2_find_nearest_size(thp7312_mode_info_data,
+				      ARRAY_SIZE(thp7312_mode_info_data),
+				      width, height, width, height);
+
+	if (!nearest && (mode->width != width || mode->height != height))
+		return NULL;
+
+	return mode;
+}
+
+static const struct thp7312_frame_rate *
+thp7312_find_rate(const struct thp7312_mode_info *mode, unsigned int fps,
+		  bool nearest)
+{
+	const struct thp7312_frame_rate *best_rate = NULL;
+	const struct thp7312_frame_rate *rate;
+	unsigned int best_delta = UINT_MAX;
+
+	if (!mode)
+		return NULL;
+
+	for (rate = mode->rates; rate->fps && best_delta; ++rate) {
+		unsigned int delta = abs(rate->fps - fps);
+
+		if (delta <= best_delta) {
+			best_delta = delta;
+			best_rate = rate;
+		}
+	}
+
+	if (!nearest && best_delta)
+		return NULL;
+
+	return best_rate;
+}
+
 /* -----------------------------------------------------------------------------
  * Device Access & Configuration
  */
@@ -475,17 +512,30 @@ static int thp7312_set_framefmt(struct thp7312_device *thp7312,
 static int thp7312_init_mode(struct thp7312_device *thp7312,
 			     struct v4l2_subdev_state *sd_state)
 {
+	const struct thp7312_mode_info *mode;
+	const struct thp7312_frame_rate *rate;
 	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_fract *interval;
 	int ret;
 
+	/*
+	 * TODO: The mode and rate should be cached in the subdev state, once
+	 * support for extending states will be available.
+	 */
 	fmt = v4l2_subdev_get_pad_format(&thp7312->sd, sd_state, 0);
+	interval = v4l2_subdev_get_pad_interval(&thp7312->sd, sd_state, 0);
+
+	mode = thp7312_find_mode(fmt->width, fmt->height, false);
+	rate = thp7312_find_rate(mode, interval->denominator, false);
+
+	if (WARN_ON(!mode || !rate))
+		return -EINVAL;
 
 	ret = thp7312_set_framefmt(thp7312, fmt);
 	if (ret)
 		return ret;
 
-	return thp7312_change_mode(thp7312, thp7312->current_mode,
-				   thp7312->current_rate);
+	return thp7312_change_mode(thp7312, mode, rate);
 }
 
 static int thp7312_stream_enable(struct thp7312_device *thp7312, int enable)
@@ -703,21 +753,6 @@ static bool thp7312_find_bus_code(u32 code)
 	return false;
 }
 
-static const struct thp7312_mode_info *
-thp7312_find_mode(unsigned int width, unsigned int height, bool nearest)
-{
-	const struct thp7312_mode_info *mode;
-
-	mode = v4l2_find_nearest_size(thp7312_mode_info_data,
-				      ARRAY_SIZE(thp7312_mode_info_data),
-				      width, height, width, height);
-
-	if (!nearest && (mode->width != width || mode->height != height))
-		return NULL;
-
-	return mode;
-}
-
 static int thp7312_enum_mbus_code(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
@@ -781,6 +816,7 @@ static int thp7312_set_fmt(struct v4l2_subdev *sd,
 	struct thp7312_device *thp7312 = to_thp7312_dev(sd);
 	struct v4l2_mbus_framefmt *mbus_fmt = &format->format;
 	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_fract *interval;
 	const struct thp7312_mode_info *mode;
 
 	if (!thp7312_find_bus_code(mbus_fmt->code))
@@ -800,37 +836,22 @@ static int thp7312_set_fmt(struct v4l2_subdev *sd,
 
 	*mbus_fmt = *fmt;
 
-	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		thp7312->current_mode = mode;
-		thp7312->current_rate = &mode->rates[0];
-	}
+	interval = v4l2_subdev_get_pad_interval(sd, sd_state, 0);
+	interval->numerator = 1;
+	interval->denominator = mode->rates[0].fps;
 
 	return 0;
 }
 
-static int thp7312_g_frame_interval(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_frame_interval *fi)
-{
-	struct thp7312_device *thp7312 = to_thp7312_dev(sd);
-	struct v4l2_subdev_state *sd_state;
-
-	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
-	fi->interval.numerator = 1;
-	fi->interval.denominator = thp7312->current_rate->fps;
-	v4l2_subdev_unlock_state(sd_state);
-
-	return 0;
-}
-
-static int thp7312_s_frame_interval(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_frame_interval *fi)
+static int thp7312_set_frame_interval(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *sd_state,
+				      struct v4l2_subdev_frame_interval *fi)
 {
 	struct thp7312_device *thp7312 = to_thp7312_dev(sd);
 	const struct thp7312_mode_info *mode;
-	const struct thp7312_frame_rate *best_rate = NULL;
 	const struct thp7312_frame_rate *rate;
-	struct v4l2_subdev_state *sd_state;
-	unsigned int best_delta = UINT_MAX;
+	const struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_fract *interval;
 	unsigned int fps;
 
 	/* Avoid divisions by 0, pick the highest frame if the interval is 0. */
@@ -838,25 +859,15 @@ static int thp7312_s_frame_interval(struct v4l2_subdev *sd,
 	    ? DIV_ROUND_CLOSEST(fi->interval.denominator, fi->interval.numerator)
 	    : UINT_MAX;
 
-	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_get_pad_format(&thp7312->sd, sd_state, 0);
+	mode = thp7312_find_mode(fmt->width, fmt->height, false);
+	rate = thp7312_find_rate(mode, fps, true);
 
-	mode = thp7312->current_mode;
+	interval = v4l2_subdev_get_pad_interval(sd, sd_state, 0);
+	interval->numerator = 1;
+	interval->denominator = rate->fps;
 
-	for (rate = mode->rates; rate->fps && best_delta; ++rate) {
-		unsigned int delta = abs(rate->fps - fps);
-
-		if (delta <= best_delta) {
-			best_delta = delta;
-			best_rate = rate;
-		}
-	}
-
-	thp7312->current_rate = best_rate;
-
-	v4l2_subdev_unlock_state(sd_state);
-
-	fi->interval.numerator = 1;
-	fi->interval.denominator = best_rate->fps;
+	fi->interval = *interval;
 
 	return 0;
 }
@@ -911,8 +922,10 @@ static int thp7312_init_cfg(struct v4l2_subdev *sd,
 {
 	const struct thp7312_mode_info *default_mode = &thp7312_mode_info_data[0];
 	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_fract *interval;
 
 	fmt = v4l2_subdev_get_pad_format(sd, sd_state, 0);
+	interval = v4l2_subdev_get_pad_interval(sd, sd_state, 0);
 
 	/*
 	 * default init sequence initialize thp7312 to
@@ -927,6 +940,9 @@ static int thp7312_init_cfg(struct v4l2_subdev *sd,
 	fmt->height = default_mode->height;
 	fmt->field = V4L2_FIELD_NONE;
 
+	interval->numerator = 1;
+	interval->denominator = default_mode->rates[0].fps;
+
 	return 0;
 }
 
@@ -937,8 +953,6 @@ static const struct v4l2_subdev_core_ops thp7312_core_ops = {
 };
 
 static const struct v4l2_subdev_video_ops thp7312_video_ops = {
-	.g_frame_interval = thp7312_g_frame_interval,
-	.s_frame_interval = thp7312_s_frame_interval,
 	.s_stream = thp7312_s_stream,
 };
 
@@ -947,6 +961,8 @@ static const struct v4l2_subdev_pad_ops thp7312_pad_ops = {
 	.init_cfg = thp7312_init_cfg,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = thp7312_set_fmt,
+	.get_frame_interval = v4l2_subdev_get_frame_interval,
+	.set_frame_interval = thp7312_set_frame_interval,
 	.enum_frame_size = thp7312_enum_frame_size,
 	.enum_frame_interval = thp7312_enum_frame_interval,
 };
@@ -2234,9 +2250,6 @@ static int thp7312_probe(struct i2c_client *client)
 	if (thp7312->boot_mode == THP7312_BOOT_MODE_2WIRE_SLAVE)
 		return thp7312_register_flash_mode(thp7312);
 
-	thp7312->current_mode = &thp7312_mode_info_data[0];
-	thp7312->current_rate = &thp7312->current_mode->rates[0];
-
 	ret = thp7312_init_sensors(thp7312);
 	if (ret < 0)
 		return ret;
-- 
Regards,

Laurent Pinchart

