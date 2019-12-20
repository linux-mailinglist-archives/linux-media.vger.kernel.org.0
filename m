Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99BDF127BEF
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2019 14:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727401AbfLTNsq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Dec 2019 08:48:46 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50419 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727344AbfLTNsq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Dec 2019 08:48:46 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1iiIe4-0007TZ-HA; Fri, 20 Dec 2019 14:48:44 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1iiIe4-0006li-9R; Fri, 20 Dec 2019 14:48:44 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
Subject: [RFC PATCH] media: allegro: implement V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE
Date:   Fri, 20 Dec 2019 14:48:43 +0100
Message-Id: <20191220134843.25977-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220144734.31667e9c@litschi.hi.pengutronix.de>
References: <20191220144734.31667e9c@litschi.hi.pengutronix.de>
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

Implement the new V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE control to set the
framerate in the encoded H.264 stream.

The current implementation conflicts with the specification. The
specification states that S_PARM sets the rate at which frames are
submitted to the encoder and V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE only
influences the frame rate that is put into the encoded stream. However,
the implementation uses the frame rate of the control in msg.framerate
for configuring the codec as well.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../staging/media/allegro-dvt/allegro-core.c  | 72 +++++++++++++++++--
 1 file changed, 67 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index 6f0cd0784786..5631c56420cc 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/firmware.h>
+#include <linux/gcd.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -40,6 +41,8 @@
 #define ALLEGRO_HEIGHT_DEFAULT 1080
 #define ALLEGRO_HEIGHT_MAX 2160
 
+#define ALLEGRO_FRAMERATE_DEFAULT (struct v4l2_fract) { 30, 1 };
+
 #define ALLEGRO_GOP_SIZE_DEFAULT 25
 #define ALLEGRO_GOP_SIZE_MAX 1000
 
@@ -176,6 +179,7 @@ struct allegro_channel {
 	unsigned int width;
 	unsigned int height;
 	unsigned int stride;
+	struct v4l2_fract framerate;
 
 	enum v4l2_colorspace colorspace;
 	enum v4l2_ycbcr_encoding ycbcr_enc;
@@ -205,6 +209,7 @@ struct allegro_channel {
 	struct v4l2_ctrl *mpeg_video_bitrate_peak;
 	struct v4l2_ctrl *mpeg_video_cpb_size;
 	struct v4l2_ctrl *mpeg_video_gop_size;
+	struct v4l2_ctrl *mpeg_video_enc_frame_rate;
 
 	/* user_id is used to identify the channel during CREATE_CHANNEL */
 	/* not sure, what to set here and if this is actually required */
@@ -1048,8 +1053,9 @@ static int allegro_mcu_send_create_channel(struct allegro_dev *dev,
 	/* Encoder expects cpb_size in units of a 90 kHz clock. */
 	msg.cpb_size =
 		((channel->cpb_size * 1000) / channel->bitrate_peak) * 90000;
-	msg.framerate = 25;
-	msg.clk_ratio = 1000;
+	msg.framerate = DIV_ROUND_UP(channel->framerate.numerator,
+				     channel->framerate.denominator);
+	msg.clk_ratio = channel->framerate.denominator == 1001 ? 1001 : 1000;
 	msg.target_bitrate = channel->bitrate;
 	msg.max_bitrate = channel->bitrate_peak;
 	msg.initial_qp = 25;
@@ -1360,9 +1366,11 @@ static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
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
@@ -2000,7 +2008,8 @@ static int allegro_create_channel(struct allegro_channel *channel)
 	v4l2_dbg(1, debug, &dev->v4l2_dev,
 		 "user %d: creating channel (%4.4s, %dx%d@%d)\n",
 		 channel->user_id,
-		 (char *)&channel->codec, channel->width, channel->height, 25);
+		 (char *)&channel->codec, channel->width, channel->height,
+		 DIV_ROUND_UP(channel->framerate.numerator, channel->framerate.denominator));
 
 	min_level = select_minimum_h264_level(channel->width, channel->height);
 	if (channel->level < min_level) {
@@ -2046,6 +2055,7 @@ static void allegro_set_default_params(struct allegro_channel *channel)
 	channel->width = ALLEGRO_WIDTH_DEFAULT;
 	channel->height = ALLEGRO_HEIGHT_DEFAULT;
 	channel->stride = round_up(channel->width, 32);
+	channel->framerate = ALLEGRO_FRAMERATE_DEFAULT;
 
 	channel->colorspace = V4L2_COLORSPACE_REC709;
 	channel->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
@@ -2231,6 +2241,7 @@ static int allegro_s_ctrl(struct v4l2_ctrl *ctrl)
 						       struct allegro_channel,
 						       ctrl_handler);
 	struct allegro_dev *dev = channel->dev;
+	int div;
 
 	v4l2_dbg(1, debug, &dev->v4l2_dev,
 		 "s_ctrl: %s = %d\n", v4l2_ctrl_get_name(ctrl->id), ctrl->val);
@@ -2254,6 +2265,11 @@ static int allegro_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
 		channel->gop_size = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE:
+		div = gcd(channel->framerate.numerator, channel->framerate.denominator);
+		channel->framerate.numerator = ctrl->p_new.p_fract->numerator / div;
+		channel->framerate.denominator = ctrl->p_new.p_fract->denominator / div;
+		break;
 	}
 
 	return 0;
@@ -2270,6 +2286,8 @@ static int allegro_open(struct file *file)
 	struct allegro_channel *channel = NULL;
 	struct v4l2_ctrl_handler *handler;
 	u64 mask;
+	struct v4l2_fract framerate_min = { 1, U32_MAX};
+	struct v4l2_fract framerate_max = { U32_MAX, 1};
 
 	channel = kzalloc(sizeof(*channel), GFP_KERNEL);
 	if (!channel)
@@ -2323,6 +2341,12 @@ static int allegro_open(struct file *file)
 			V4L2_CID_MPEG_VIDEO_GOP_SIZE,
 			0, ALLEGRO_GOP_SIZE_MAX,
 			1, channel->gop_size);
+	channel->mpeg_video_enc_frame_rate = v4l2_ctrl_new_std_compound(handler,
+			&allegro_ctrl_ops,
+			V4L2_CID_MPEG_VIDEO_ENC_FRAME_RATE,
+			v4l2_ctrl_ptr_create(&channel->framerate),
+			v4l2_ctrl_ptr_create(&framerate_min),
+			v4l2_ctrl_ptr_create(&framerate_max));
 	v4l2_ctrl_new_std(handler,
 			&allegro_ctrl_ops,
 			V4L2_CID_MIN_BUFFERS_FOR_OUTPUT,
@@ -2636,6 +2660,41 @@ static int allegro_ioctl_streamon(struct file *file, void *priv,
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
+	struct v4l2_fract framerate;
+
+	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		return -EINVAL;
+
+	a->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
+	timeperframe = &a->parm.output.timeperframe;
+	framerate.numerator = timeperframe->denominator;
+	framerate.denominator = timeperframe->numerator;
+
+	v4l2_ctrl_s_ctrl_fract(channel->mpeg_video_enc_frame_rate, &framerate);
+
+	return 0;
+}
+
 static int allegro_subscribe_event(struct v4l2_fh *fh,
 				   const struct v4l2_event_subscription *sub)
 {
@@ -2674,6 +2733,9 @@ static const struct v4l2_ioctl_ops allegro_ioctl_ops = {
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

