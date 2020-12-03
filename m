Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 473582CD436
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388781AbgLCLEN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:04:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387772AbgLCLEM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 06:04:12 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE09C061A56
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 03:02:53 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkmNt-0002Ky-1s; Thu, 03 Dec 2020 12:02:51 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kkmNs-00CKi2-00; Thu, 03 Dec 2020 12:02:48 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Dec 2020 12:01:00 +0100
Message-Id: <20201203110106.2939463-13-m.tretter@pengutronix.de>
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
X-Spam-Status: No, score=-1.5 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_SOFTFAIL,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.2
Subject: [PATCH 12/18] media: allegro: remove profile and level from channel
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The profile and level are straight copies from the v4l2-ctrls. Avoid
duplication and directly read the value of the v4l2-ctrl.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../media/platform/allegro-dvt/allegro-core.c | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 8cabc6ba9f7e..c0519f7a67b8 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -195,8 +195,6 @@ struct allegro_channel {
 	unsigned int osequence;
 
 	u32 codec;
-	enum v4l2_mpeg_video_h264_profile profile;
-	enum v4l2_mpeg_video_h264_level level;
 	unsigned int sizeimage_encoded;
 	unsigned int csequence;
 
@@ -924,6 +922,8 @@ static int fill_create_channel_param(struct allegro_channel *channel,
 	int b_frame_qp = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_b_frame_qp);
 	int bitrate_mode = v4l2_ctrl_g_ctrl(channel->mpeg_video_bitrate_mode);
 	unsigned int cpb_size = v4l2_ctrl_g_ctrl(channel->mpeg_video_cpb_size);
+	enum v4l2_mpeg_video_h264_profile profile;
+	enum v4l2_mpeg_video_h264_level level;
 
 	param->width = channel->width;
 	param->height = channel->height;
@@ -931,11 +931,13 @@ static int fill_create_channel_param(struct allegro_channel *channel,
 	param->colorspace =
 		v4l2_colorspace_to_mcu_colorspace(channel->colorspace);
 	param->src_mode = 0x0;
-	param->profile = v4l2_profile_to_mcu_profile(channel->profile);
-	param->constraint_set_flags = BIT(1);
+
 	param->codec = channel->codec;
-	param->level = v4l2_level_to_mcu_level(channel->level);
-	param->tier = 0;
+	profile = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_profile);
+	level = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_level);
+	param->profile = v4l2_profile_to_mcu_profile(profile);
+	param->constraint_set_flags = BIT(1);
+	param->level = v4l2_level_to_mcu_level(level);
 
 	param->log2_max_poc = LOG2_MAX_PIC_ORDER_CNT;
 	param->log2_max_frame_num = channel->log2_max_frame_num;
@@ -1277,6 +1279,8 @@ static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
 	/* Calculation of crop units in Rec. ITU-T H.264 (04/2017) p. 76 */
 	unsigned int crop_unit_x = 2;
 	unsigned int crop_unit_y = 2;
+	enum v4l2_mpeg_video_h264_profile profile;
+	enum v4l2_mpeg_video_h264_level level;
 	unsigned int cpb_size;
 	unsigned int cpb_size_scale;
 
@@ -1284,14 +1288,17 @@ static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
 	if (!sps)
 		return -ENOMEM;
 
-	sps->profile_idc = nal_h264_profile_from_v4l2(channel->profile);
+	profile = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_profile);
+	level = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_level);
+
+	sps->profile_idc = nal_h264_profile_from_v4l2(profile);
 	sps->constraint_set0_flag = 0;
 	sps->constraint_set1_flag = 1;
 	sps->constraint_set2_flag = 0;
 	sps->constraint_set3_flag = 0;
 	sps->constraint_set4_flag = 0;
 	sps->constraint_set5_flag = 0;
-	sps->level_idc = nal_h264_level_from_v4l2(channel->level);
+	sps->level_idc = nal_h264_level_from_v4l2(level);
 	sps->seq_parameter_set_id = 0;
 	sps->log2_max_frame_num_minus4 = LOG2_MAX_FRAME_NUM - 4;
 	sps->pic_order_cnt_type = 0;
@@ -2076,7 +2083,6 @@ static void allegro_channel_adjust(struct allegro_channel *channel)
 	__v4l2_ctrl_modify_range(ctrl, min, ctrl->maximum,
 				 ctrl->step, ctrl->default_value);
 	v4l2_ctrl_unlock(ctrl);
-	channel->level = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_level);
 
 	ctrl = channel->mpeg_video_bitrate;
 	max = maximum_bitrate(v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_level));
@@ -2130,9 +2136,6 @@ static void allegro_set_default_params(struct allegro_channel *channel)
 	channel->sizeimage_raw = channel->stride * channel->height * 3 / 2;
 
 	channel->codec = V4L2_PIX_FMT_H264;
-	channel->profile = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE;
-	channel->level =
-		select_minimum_h264_level(channel->width, channel->height);
 }
 
 static int allegro_queue_setup(struct vb2_queue *vq,
@@ -2377,9 +2380,6 @@ static int allegro_s_ctrl(struct v4l2_ctrl *ctrl)
 		 "s_ctrl: %s = %d\n", v4l2_ctrl_get_name(ctrl->id), ctrl->val);
 
 	switch (ctrl->id) {
-	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
-		channel->level = ctrl->val;
-		break;
 	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
 		channel->frame_rc_enable = ctrl->val;
 		break;
-- 
2.20.1

