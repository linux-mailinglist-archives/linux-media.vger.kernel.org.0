Return-Path: <linux-media+bounces-1679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 249D58056CF
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 15:08:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5FAA281CFF
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 14:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C6761FC4;
	Tue,  5 Dec 2023 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="niYzShIv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A9DA1
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 06:08:15 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B3AFC16F9;
	Tue,  5 Dec 2023 15:07:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701785251;
	bh=d0hlo5sZtaQUIriZJIwclOcO7SlIIKuTMvlDwiT+2Eo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=niYzShIv3IQiv/XII7uBsinI1f3+kmhU4oIpvHVNUojmECZydWLv9LJppawGT9xmB
	 1AKTNaCRwhR2mlBoiQw8/mhUqSx/1irsWKbwSa4+IvfzCjUnGCZbWpYu9RiS+aqweA
	 kTSKaG8kvHx6tBDq26Sn5Wwz90dUQMmJcwqS4AKw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 7/7] media: i2c: thp7312: Store frame interval in subdev state
Date: Tue,  5 Dec 2023 16:08:10 +0200
Message-ID: <20231205140810.22368-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231205140810.22368-1-laurent.pinchart@ideasonboard.com>
References: <20231205140810.22368-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the newly added storage for frame interval in the subdev state to
simplify the driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/i2c/thp7312.c | 160 +++++++++++++++++++-----------------
 1 file changed, 86 insertions(+), 74 deletions(-)

diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
index 3d46e428e0ac..2806887514dc 100644
--- a/drivers/media/i2c/thp7312.c
+++ b/drivers/media/i2c/thp7312.c
@@ -266,9 +266,6 @@ struct thp7312_device {
 	struct v4l2_ctrl_handler ctrl_handler;
 	bool ctrls_applied;
 
-	/* These are protected by v4l2 active state */
-	const struct thp7312_mode_info *current_mode;
-	const struct thp7312_frame_rate *current_rate;
 	s64 link_freq;
 
 	struct {
@@ -310,6 +307,47 @@ static inline struct thp7312_device *to_thp7312_dev(struct v4l2_subdev *sd)
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
@@ -442,17 +480,30 @@ static int thp7312_set_framefmt(struct thp7312_device *thp7312,
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
 	fmt = v4l2_subdev_state_get_format(sd_state, 0);
+	interval = v4l2_subdev_state_get_interval(sd_state, 0);
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
 
 static int thp7312_stream_enable(struct thp7312_device *thp7312, bool enable)
@@ -621,28 +672,6 @@ static bool thp7312_find_bus_code(u32 code)
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
-static void thp7312_set_frame_rate(struct thp7312_device *thp7312,
-				   const struct thp7312_frame_rate *rate)
-{
-	thp7312->link_freq = rate->link_freq;
-	thp7312->current_rate = rate;
-}
-
 static int thp7312_enum_mbus_code(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
@@ -707,6 +736,7 @@ static int thp7312_set_fmt(struct v4l2_subdev *sd,
 	struct thp7312_device *thp7312 = to_thp7312_dev(sd);
 	struct v4l2_mbus_framefmt *mbus_fmt = &format->format;
 	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_fract *interval;
 	const struct thp7312_mode_info *mode;
 
 	if (!thp7312_find_bus_code(mbus_fmt->code))
@@ -726,37 +756,25 @@ static int thp7312_set_fmt(struct v4l2_subdev *sd,
 
 	*mbus_fmt = *fmt;
 
-	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		thp7312->current_mode = mode;
-		thp7312_set_frame_rate(thp7312, &mode->rates[0]);
-	}
+	interval = v4l2_subdev_state_get_interval(sd_state, 0);
+	interval->numerator = 1;
+	interval->denominator = mode->rates[0].fps;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		thp7312->link_freq = mode->rates[0].link_freq;
 
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
@@ -764,25 +782,18 @@ static int thp7312_s_frame_interval(struct v4l2_subdev *sd,
 	    ? DIV_ROUND_CLOSEST(fi->interval.denominator, fi->interval.numerator)
 	    : UINT_MAX;
 
-	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_state_get_format(sd_state, 0);
+	mode = thp7312_find_mode(fmt->width, fmt->height, false);
+	rate = thp7312_find_rate(mode, fps, true);
 
-	mode = thp7312->current_mode;
+	interval = v4l2_subdev_state_get_interval(sd_state, 0);
+	interval->numerator = 1;
+	interval->denominator = rate->fps;
 
-	for (rate = mode->rates; rate->fps && best_delta; ++rate) {
-		unsigned int delta = abs(rate->fps - fps);
+	if (fi->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		thp7312->link_freq = rate->link_freq;
 
-		if (delta <= best_delta) {
-			best_delta = delta;
-			best_rate = rate;
-		}
-	}
-
-	thp7312_set_frame_rate(thp7312, best_rate);
-
-	v4l2_subdev_unlock_state(sd_state);
-
-	fi->interval.numerator = 1;
-	fi->interval.denominator = best_rate->fps;
+	fi->interval = *interval;
 
 	return 0;
 }
@@ -842,8 +853,10 @@ static int thp7312_init_state(struct v4l2_subdev *sd,
 {
 	const struct thp7312_mode_info *default_mode = &thp7312_mode_info_data[0];
 	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_fract *interval;
 
 	fmt = v4l2_subdev_state_get_format(sd_state, 0);
+	interval = v4l2_subdev_state_get_interval(sd_state, 0);
 
 	/*
 	 * default init sequence initialize thp7312 to
@@ -858,6 +871,9 @@ static int thp7312_init_state(struct v4l2_subdev *sd,
 	fmt->height = default_mode->height;
 	fmt->field = V4L2_FIELD_NONE;
 
+	interval->numerator = 1;
+	interval->denominator = default_mode->rates[0].fps;
+
 	return 0;
 }
 
@@ -868,8 +884,6 @@ static const struct v4l2_subdev_core_ops thp7312_core_ops = {
 };
 
 static const struct v4l2_subdev_video_ops thp7312_video_ops = {
-	.g_frame_interval = thp7312_g_frame_interval,
-	.s_frame_interval = thp7312_s_frame_interval,
 	.s_stream = thp7312_s_stream,
 };
 
@@ -877,6 +891,8 @@ static const struct v4l2_subdev_pad_ops thp7312_pad_ops = {
 	.enum_mbus_code = thp7312_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = thp7312_set_fmt,
+	.get_frame_interval = v4l2_subdev_get_frame_interval,
+	.set_frame_interval = thp7312_set_frame_interval,
 	.enum_frame_size = thp7312_enum_frame_size,
 	.enum_frame_interval = thp7312_enum_frame_interval,
 };
@@ -1303,6 +1319,8 @@ static int thp7312_init_controls(struct thp7312_device *thp7312)
 			       V4L2_CID_POWER_LINE_FREQUENCY_60HZ, 0,
 			       V4L2_CID_POWER_LINE_FREQUENCY_50HZ);
 
+	thp7312->link_freq = thp7312_mode_info_data[0].rates[0].link_freq;
+
 	link_freq = v4l2_ctrl_new_int_menu(hdl, &thp7312_ctrl_ops,
 					   V4L2_CID_LINK_FREQ, 0, 0,
 					   &thp7312->link_freq);
@@ -2072,7 +2090,6 @@ static int thp7312_parse_dt(struct thp7312_device *thp7312)
 static int thp7312_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct v4l2_subdev_state *sd_state;
 	struct thp7312_device *thp7312;
 	int ret;
 
@@ -2148,11 +2165,6 @@ static int thp7312_probe(struct i2c_client *client)
 		goto err_free_ctrls;
 	}
 
-	sd_state = v4l2_subdev_lock_and_get_active_state(&thp7312->sd);
-	thp7312->current_mode = &thp7312_mode_info_data[0];
-	thp7312_set_frame_rate(thp7312, &thp7312->current_mode->rates[0]);
-	v4l2_subdev_unlock_state(sd_state);
-
 	/*
 	 * Enable runtime PM with autosuspend. As the device has been powered
 	 * manually, mark it as active, and increase the usage count without
-- 
Regards,

Laurent Pinchart


