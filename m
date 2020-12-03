Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BBB92CD43B
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:05:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388847AbgLCLEP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:04:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388810AbgLCLEO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 06:04:14 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77AF1C08E864
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 03:02:55 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkmNt-0002Kx-72; Thu, 03 Dec 2020 12:02:53 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kkmNr-00CKhz-Vh; Thu, 03 Dec 2020 12:02:47 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Dec 2020 12:00:59 +0100
Message-Id: <20201203110106.2939463-12-m.tretter@pengutronix.de>
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
Subject: [PATCH 11/18] media: allegro: remove cpb_size and gop_size from channel
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cpb_size and the gop_size are straight copies of the values in the
v4l2-ctrls. To avoid this duplication, directly get the values from the
v4l2-ctrls and remove the copies.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../media/platform/allegro-dvt/allegro-core.c | 30 +++++++------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 4e5590e8f875..8cabc6ba9f7e 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -203,8 +203,6 @@ struct allegro_channel {
 	bool frame_rc_enable;
 	unsigned int bitrate;
 	unsigned int bitrate_peak;
-	unsigned int cpb_size;
-	unsigned int gop_size;
 
 	struct allegro_buffer config_blob;
 
@@ -925,6 +923,7 @@ static int fill_create_channel_param(struct allegro_channel *channel,
 	int p_frame_qp = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_p_frame_qp);
 	int b_frame_qp = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_b_frame_qp);
 	int bitrate_mode = v4l2_ctrl_g_ctrl(channel->mpeg_video_bitrate_mode);
+	unsigned int cpb_size = v4l2_ctrl_g_ctrl(channel->mpeg_video_cpb_size);
 
 	param->width = channel->width;
 	param->height = channel->height;
@@ -972,8 +971,7 @@ static int fill_create_channel_param(struct allegro_channel *channel,
 	param->rate_control_mode = channel->frame_rc_enable ?
 		v4l2_bitrate_mode_to_mcu_mode(bitrate_mode) : 0;
 
-	param->cpb_size = v4l2_cpb_size_to_mcu(channel->cpb_size,
-					       channel->bitrate_peak);
+	param->cpb_size = v4l2_cpb_size_to_mcu(cpb_size, channel->bitrate_peak);
 	/* Shall be ]0;cpb_size in 90 kHz units]. Use maximum value. */
 	param->initial_rem_delay = param->cpb_size;
 	param->framerate = DIV_ROUND_UP(channel->framerate.numerator,
@@ -996,10 +994,10 @@ static int fill_create_channel_param(struct allegro_channel *channel,
 	param->max_pixel_value = 255;
 
 	param->gop_ctrl_mode = 0x00000002;
-	param->freq_idr = channel->gop_size;
+	param->freq_idr = v4l2_ctrl_g_ctrl(channel->mpeg_video_gop_size);
 	param->freq_lt = 0;
 	param->gdr_mode = 0x00000000;
-	param->gop_length = channel->gop_size;
+	param->gop_length = v4l2_ctrl_g_ctrl(channel->mpeg_video_gop_size);
 	param->subframe_latency = 0x00000000;
 
 	param->lda_factors[0] = 51;
@@ -1342,7 +1340,7 @@ static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
 	sps->vui.vcl_hrd_parameters.bit_rate_value_minus1[0] =
 		channel->bitrate_peak / (1 << (6 + sps->vui.vcl_hrd_parameters.bit_rate_scale)) - 1;
 	/* See Rec. ITU-T H.264 (04/2017) p. 410 E-54 */
-	cpb_size = channel->cpb_size;
+	cpb_size = v4l2_ctrl_g_ctrl(channel->mpeg_video_cpb_size);
 	cpb_size_scale = ffs(cpb_size) - 4;
 	sps->vui.vcl_hrd_parameters.cpb_size_scale = cpb_size_scale;
 	sps->vui.vcl_hrd_parameters.cpb_size_value_minus1[0] =
@@ -2135,9 +2133,6 @@ static void allegro_set_default_params(struct allegro_channel *channel)
 	channel->profile = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE;
 	channel->level =
 		select_minimum_h264_level(channel->width, channel->height);
-
-	channel->cpb_size = maximum_cpb_size(channel->level);
-	channel->gop_size = ALLEGRO_GOP_SIZE_DEFAULT;
 }
 
 static int allegro_queue_setup(struct vb2_queue *vq,
@@ -2394,12 +2389,6 @@ static int allegro_s_ctrl(struct v4l2_ctrl *ctrl)
 		v4l2_ctrl_activate(channel->mpeg_video_bitrate_peak,
 				   ctrl->val == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR);
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE:
-		channel->cpb_size = ctrl->val;
-		break;
-	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
-		channel->gop_size = ctrl->val;
-		break;
 	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP:
 	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP:
 	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP:
@@ -2425,6 +2414,8 @@ static int allegro_open(struct file *file)
 	int ret;
 	unsigned int bitrate_max;
 	unsigned int bitrate_def;
+	unsigned int cpb_size_max;
+	unsigned int cpb_size_def;
 
 	channel = kzalloc(sizeof(*channel), GFP_KERNEL);
 	if (!channel)
@@ -2493,6 +2484,8 @@ static int allegro_open(struct file *file)
 
 	bitrate_max = maximum_bitrate(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
 	bitrate_def = maximum_bitrate(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
+	cpb_size_max = maximum_cpb_size(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
+	cpb_size_def = maximum_cpb_size(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
 	channel->mpeg_video_bitrate = v4l2_ctrl_new_std(handler,
 			&allegro_ctrl_ops,
 			V4L2_CID_MPEG_VIDEO_BITRATE,
@@ -2504,13 +2497,12 @@ static int allegro_open(struct file *file)
 	channel->mpeg_video_cpb_size = v4l2_ctrl_new_std(handler,
 			&allegro_ctrl_ops,
 			V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE,
-			0, maximum_cpb_size(V4L2_MPEG_VIDEO_H264_LEVEL_5_1),
-			1, channel->cpb_size);
+			0, cpb_size_max, 1, cpb_size_def);
 	channel->mpeg_video_gop_size = v4l2_ctrl_new_std(handler,
 			&allegro_ctrl_ops,
 			V4L2_CID_MPEG_VIDEO_GOP_SIZE,
 			0, ALLEGRO_GOP_SIZE_MAX,
-			1, channel->gop_size);
+			1, ALLEGRO_GOP_SIZE_DEFAULT);
 	v4l2_ctrl_new_std(handler,
 			  &allegro_ctrl_ops,
 			  V4L2_CID_MIN_BUFFERS_FOR_OUTPUT,
-- 
2.20.1

