Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5D3E1615DA
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 16:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbgBQPOK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 10:14:10 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41881 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727488AbgBQPOD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 10:14:03 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1j3i5x-0005WE-9T; Mon, 17 Feb 2020 16:14:01 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1j3i5w-0001aW-Bb; Mon, 17 Feb 2020 16:14:00 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 11/18] media: allegro: make frame rate configurable
Date:   Mon, 17 Feb 2020 16:13:51 +0100
Message-Id: <20200217151358.5695-12-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200217151358.5695-1-m.tretter@pengutronix.de>
References: <20200217151358.5695-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The allegro dvt codec adjust the encoding speed according to a
configured frame rate. Furthermore, the frame rate is written into the
coded stream.

Ensure that the coded video data has the correct frame rate by
implementing s_parm for setting the frame rate from user space.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../staging/media/allegro-dvt/allegro-core.c  | 60 +++++++++++++++++--
 1 file changed, 55 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 71ed3abc61f0..3ecc38047436 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -7,6 +7,7 @@
 
 #include <linux/bits.h>
 #include <linux/firmware.h>
+#include <linux/gcd.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -41,6 +42,8 @@
 #define ALLEGRO_HEIGHT_DEFAULT 1080
 #define ALLEGRO_HEIGHT_MAX 2160
 
+#define ALLEGRO_FRAMERATE_DEFAULT (struct v4l2_fract) { 30, 1 };
+
 #define ALLEGRO_GOP_SIZE_DEFAULT 25
 #define ALLEGRO_GOP_SIZE_MAX 1000
 
@@ -177,6 +180,7 @@ struct allegro_channel {
 	unsigned int width;
 	unsigned int height;
 	unsigned int stride;
+	struct v4l2_fract framerate;
 
 	enum v4l2_colorspace colorspace;
 	enum v4l2_ycbcr_encoding ycbcr_enc;
@@ -1123,8 +1127,9 @@ static int allegro_mcu_send_create_channel(struct allegro_dev *dev,
 		(channel->cpb_size * 90000) / (channel->bitrate_peak / 1000 / BITS_PER_BYTE);
 	/* Shall be ]0;cpb_size in 90 kHz units]. Use maximum value. */
 	msg.initial_rem_delay = msg.cpb_size;
-	msg.framerate = 25;
-	msg.clk_ratio = 1000;
+	msg.framerate = DIV_ROUND_UP(channel->framerate.numerator,
+				     channel->framerate.denominator);
+	msg.clk_ratio = channel->framerate.denominator == 1001 ? 1001 : 1000;
 	msg.target_bitrate = channel->bitrate;
 	msg.max_bitrate = channel->bitrate_peak;
 	msg.initial_qp = 25;
@@ -1433,9 +1438,11 @@ static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
 	sps->vui.chroma_loc_info_present_flag = 1;
 	sps->vui.chroma_sample_loc_type_top_field = 0;
 	sps->vui.chroma_sample_loc_type_bottom_field = 0;
+
 	sps->vui.timing_info_present_flag = 1;
-	sps->vui.num_units_in_tick = 1;
-	sps->vui.time_scale = 50;
+	sps->vui.num_units_in_tick = channel->framerate.denominator;
+	sps->vui.time_scale = 2 * channel->framerate.numerator;
+
 	sps->vui.fixed_frame_rate_flag = 1;
 	sps->vui.nal_hrd_parameters_present_flag = 0;
 	sps->vui.vcl_hrd_parameters_present_flag = 1;
@@ -2100,7 +2107,8 @@ static int allegro_create_channel(struct allegro_channel *channel)
 	v4l2_dbg(1, debug, &dev->v4l2_dev,
 		 "user %d: creating channel (%4.4s, %dx%d@%d)\n",
 		 channel->user_id,
-		 (char *)&channel->codec, channel->width, channel->height, 25);
+		 (char *)&channel->codec, channel->width, channel->height,
+		 DIV_ROUND_UP(channel->framerate.numerator, channel->framerate.denominator));
 
 	min_level = select_minimum_h264_level(channel->width, channel->height);
 	if (channel->level < min_level) {
@@ -2146,6 +2154,7 @@ static void allegro_set_default_params(struct allegro_channel *channel)
 	channel->width = ALLEGRO_WIDTH_DEFAULT;
 	channel->height = ALLEGRO_HEIGHT_DEFAULT;
 	channel->stride = round_up(channel->width, 32);
+	channel->framerate = ALLEGRO_FRAMERATE_DEFAULT;
 
 	channel->colorspace = V4L2_COLORSPACE_REC709;
 	channel->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
@@ -2736,6 +2745,44 @@ static int allegro_ioctl_streamon(struct file *file, void *priv,
 	return v4l2_m2m_streamon(file, fh->m2m_ctx, type);
 }
 
+static int allegro_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+{
+	struct allegro_channel *channel = fh_to_channel(fh);
+	struct v4l2_fract *timeperframe;
+
+	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		return -EINVAL;
+
+	a->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
+	timeperframe = &a->parm.output.timeperframe;
+	timeperframe->numerator = channel->framerate.denominator;
+	timeperframe->denominator = channel->framerate.numerator;
+
+	return 0;
+}
+
+static int allegro_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+{
+	struct allegro_channel *channel = fh_to_channel(fh);
+	struct v4l2_fract *timeperframe;
+	int div;
+
+	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		return -EINVAL;
+
+	a->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
+	timeperframe = &a->parm.output.timeperframe;
+
+	if (timeperframe->numerator == 0 || timeperframe->denominator == 0)
+		return allegro_g_parm(file, fh, a);
+
+	div = gcd(timeperframe->denominator, timeperframe->numerator);
+	channel->framerate.numerator = timeperframe->denominator / div;
+	channel->framerate.denominator = timeperframe->numerator / div;
+
+	return 0;
+}
+
 static int allegro_subscribe_event(struct v4l2_fh *fh,
 				   const struct v4l2_event_subscription *sub)
 {
@@ -2774,6 +2821,9 @@ static const struct v4l2_ioctl_ops allegro_ioctl_ops = {
 	.vidioc_encoder_cmd = allegro_encoder_cmd,
 	.vidioc_enum_framesizes = allegro_enum_framesizes,
 
+	.vidioc_g_parm		= allegro_g_parm,
+	.vidioc_s_parm		= allegro_s_parm,
+
 	.vidioc_subscribe_event = allegro_subscribe_event,
 	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
 };
-- 
2.20.1

