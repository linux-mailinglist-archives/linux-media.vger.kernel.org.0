Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEDB62CD435
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:05:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388760AbgLCLEN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:04:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388316AbgLCLEM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 06:04:12 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF0FC08C5F2
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 03:02:53 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkmNs-0002Kr-W4; Thu, 03 Dec 2020 12:02:51 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kkmNr-00CKhh-S7; Thu, 03 Dec 2020 12:02:47 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Dec 2020 12:00:53 +0100
Message-Id: <20201203110106.2939463-6-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203110106.2939463-1-m.tretter@pengutronix.de>
References: <20201203110106.2939463-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
        metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_SOFTFAIL,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.2
Subject: [PATCH 05/18] media: allegro: adjust channel after format change
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A format change (i.e. the frame size or the codec) has multiple effects
on a channel:

- The available controls

- The limits of the available controls

- The default encoding options

To avoid scattering the changes all over the driver, add a new function
that goes over the channel and does all required adjustments.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../media/platform/allegro-dvt/allegro-core.c | 69 ++++++++++++++-----
 1 file changed, 52 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index a733049c8727..3253262d56f9 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -1963,7 +1963,6 @@ static int allegro_create_channel(struct allegro_channel *channel)
 {
 	struct allegro_dev *dev = channel->dev;
 	unsigned long timeout;
-	enum v4l2_mpeg_video_h264_level min_level;
 
 	if (channel_exists(channel)) {
 		v4l2_warn(&dev->v4l2_dev,
@@ -1986,16 +1985,6 @@ static int allegro_create_channel(struct allegro_channel *channel)
 		 DIV_ROUND_UP(channel->framerate.numerator,
 			      channel->framerate.denominator));
 
-	min_level = select_minimum_h264_level(channel->width, channel->height);
-	if (channel->level < min_level) {
-		v4l2_warn(&dev->v4l2_dev,
-			  "user %d: selected Level %s too low: increasing to Level %s\n",
-			  channel->user_id,
-			  v4l2_ctrl_get_menu(V4L2_CID_MPEG_VIDEO_H264_LEVEL)[channel->level],
-			  v4l2_ctrl_get_menu(V4L2_CID_MPEG_VIDEO_H264_LEVEL)[min_level]);
-		channel->level = min_level;
-	}
-
 	v4l2_ctrl_grab(channel->mpeg_video_h264_profile, true);
 	v4l2_ctrl_grab(channel->mpeg_video_h264_level, true);
 	v4l2_ctrl_grab(channel->mpeg_video_h264_i_frame_qp, true);
@@ -2031,6 +2020,53 @@ static int allegro_create_channel(struct allegro_channel *channel)
 	return channel->error;
 }
 
+/**
+ * allegro_channel_adjust() - Adjust channel parameters to current format
+ * @channel: the channel to adjust
+ *
+ * Various parameters of a channel and their limits depend on the currently
+ * set format. Adjust the parameters after a format change in one go.
+ */
+static void allegro_channel_adjust(struct allegro_channel *channel)
+{
+	struct allegro_dev *dev = channel->dev;
+	struct v4l2_ctrl *ctrl;
+	s64 min;
+	s64 max;
+
+	channel->sizeimage_encoded =
+		estimate_stream_size(channel->width, channel->height);
+
+	ctrl = channel->mpeg_video_h264_level;
+	min = select_minimum_h264_level(channel->width, channel->height);
+	if (ctrl->minimum > min)
+		v4l2_dbg(1, debug, &dev->v4l2_dev,
+			 "%s.minimum: %lld -> %lld\n",
+			 v4l2_ctrl_get_name(ctrl->id), ctrl->minimum, min);
+	v4l2_ctrl_lock(ctrl);
+	__v4l2_ctrl_modify_range(ctrl, min, ctrl->maximum,
+				 ctrl->step, ctrl->default_value);
+	v4l2_ctrl_unlock(ctrl);
+	channel->level = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_level);
+
+	ctrl = channel->mpeg_video_bitrate;
+	max = maximum_bitrate(v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_level));
+	if (ctrl->maximum < max)
+		v4l2_dbg(1, debug, &dev->v4l2_dev,
+			 "%s: maximum: %lld -> %lld\n",
+			 v4l2_ctrl_get_name(ctrl->id), ctrl->maximum, max);
+	v4l2_ctrl_lock(ctrl);
+	__v4l2_ctrl_modify_range(ctrl, ctrl->minimum, max,
+				 ctrl->step, ctrl->default_value);
+	v4l2_ctrl_unlock(ctrl);
+
+	ctrl = channel->mpeg_video_bitrate_peak;
+	v4l2_ctrl_lock(ctrl);
+	__v4l2_ctrl_modify_range(ctrl, ctrl->minimum, max,
+				 ctrl->step, ctrl->default_value);
+	v4l2_ctrl_unlock(ctrl);
+}
+
 static void allegro_set_default_params(struct allegro_channel *channel)
 {
 	channel->width = ALLEGRO_WIDTH_DEFAULT;
@@ -2050,8 +2086,6 @@ static void allegro_set_default_params(struct allegro_channel *channel)
 	channel->profile = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE;
 	channel->level =
 		select_minimum_h264_level(channel->width, channel->height);
-	channel->sizeimage_encoded =
-		estimate_stream_size(channel->width, channel->height);
 
 	channel->bitrate = maximum_bitrate(channel->level);
 	channel->bitrate_peak = maximum_bitrate(channel->level);
@@ -2460,6 +2494,8 @@ static int allegro_open(struct file *file)
 	file->private_data = &channel->fh;
 	v4l2_fh_add(&channel->fh);
 
+	allegro_channel_adjust(channel);
+
 	return 0;
 
 error:
@@ -2571,6 +2607,8 @@ static int allegro_s_fmt_vid_cap(struct file *file, void *fh,
 
 	channel->codec = f->fmt.pix.pixelformat;
 
+	allegro_channel_adjust(channel);
+
 	return 0;
 }
 
@@ -2641,10 +2679,7 @@ static int allegro_s_fmt_vid_out(struct file *file, void *fh,
 	channel->quantization = f->fmt.pix.quantization;
 	channel->xfer_func = f->fmt.pix.xfer_func;
 
-	channel->level =
-		select_minimum_h264_level(channel->width, channel->height);
-	channel->sizeimage_encoded =
-		estimate_stream_size(channel->width, channel->height);
+	allegro_channel_adjust(channel);
 
 	return 0;
 }
-- 
2.20.1

