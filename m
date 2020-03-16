Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 278F7186E80
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 16:26:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731801AbgCPP0o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 11:26:44 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46703 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731768AbgCPP0n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 11:26:43 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jDrdZ-0000lM-SC; Mon, 16 Mar 2020 16:26:41 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jDrdY-00055P-Pd; Mon, 16 Mar 2020 16:26:40 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 12/18] media: allegro: make QP configurable
Date:   Mon, 16 Mar 2020 16:26:32 +0100
Message-Id: <20200316152638.19457-13-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316152638.19457-1-m.tretter@pengutronix.de>
References: <20200316152638.19457-1-m.tretter@pengutronix.de>
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

The V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE control allows to enable/disable
rate control on a channel. When rate control is disabled, the driver
shall use constant QP, which are set by the application. Also implement
the controls for configuring the QP.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog:

v1 -> v2:
- Fix indentation
---
 .../staging/media/allegro-dvt/allegro-core.c  | 112 ++++++++++++++++--
 1 file changed, 102 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index be4cc957439e..4d83a9f44e7e 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -198,6 +198,7 @@ struct allegro_channel {
 	unsigned int csequence;
 
 	enum v4l2_mpeg_video_bitrate_mode bitrate_mode;
+	bool frame_rc_enable;
 	unsigned int bitrate;
 	unsigned int bitrate_peak;
 	unsigned int cpb_size;
@@ -205,6 +206,12 @@ struct allegro_channel {
 
 	struct v4l2_ctrl *mpeg_video_h264_profile;
 	struct v4l2_ctrl *mpeg_video_h264_level;
+	struct v4l2_ctrl *mpeg_video_h264_i_frame_qp;
+	struct v4l2_ctrl *mpeg_video_h264_max_qp;
+	struct v4l2_ctrl *mpeg_video_h264_min_qp;
+	struct v4l2_ctrl *mpeg_video_h264_p_frame_qp;
+	struct v4l2_ctrl *mpeg_video_h264_b_frame_qp;
+	struct v4l2_ctrl *mpeg_video_frame_rc_enable;
 	struct v4l2_ctrl *mpeg_video_bitrate_mode;
 	struct v4l2_ctrl *mpeg_video_bitrate;
 	struct v4l2_ctrl *mpeg_video_bitrate_peak;
@@ -1097,10 +1104,21 @@ static u32 v4l2_cpb_size_to_mcu(unsigned int cpb_size, unsigned int bitrate)
 	return (cpb_size_kbit * 90000) / bitrate_kbps;
 }
 
+static s16 get_qp_delta(int minuend, int subtrahend)
+{
+	if (minuend == subtrahend)
+		return -1;
+	else
+		return minuend - subtrahend;
+}
+
 static int allegro_mcu_send_create_channel(struct allegro_dev *dev,
 					   struct allegro_channel *channel)
 {
 	struct mcu_msg_create_channel msg;
+	int i_frame_qp = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_i_frame_qp);
+	int p_frame_qp = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_p_frame_qp);
+	int b_frame_qp = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_b_frame_qp);
 
 	memset(&msg, 0, sizeof(msg));
 
@@ -1136,8 +1154,12 @@ static int allegro_mcu_send_create_channel(struct allegro_dev *dev,
 	msg.max_transfo_depth_intra = 1;
 	msg.max_transfo_depth_inter = 1;
 
-	msg.rate_control_mode =
-		v4l2_bitrate_mode_to_mcu_mode(channel->bitrate_mode);
+	if (channel->frame_rc_enable)
+		msg.rate_control_mode =
+			v4l2_bitrate_mode_to_mcu_mode(channel->bitrate_mode);
+	else
+		msg.rate_control_mode = 0;
+
 	msg.cpb_size = v4l2_cpb_size_to_mcu(channel->cpb_size,
 					    channel->bitrate_peak);
 	/* Shall be ]0;cpb_size in 90 kHz units]. Use maximum value. */
@@ -1147,11 +1169,11 @@ static int allegro_mcu_send_create_channel(struct allegro_dev *dev,
 	msg.clk_ratio = channel->framerate.denominator == 1001 ? 1001 : 1000;
 	msg.target_bitrate = channel->bitrate;
 	msg.max_bitrate = channel->bitrate_peak;
-	msg.initial_qp = 25;
-	msg.min_qp = 10;
-	msg.max_qp = 51;
-	msg.ip_delta = -1;
-	msg.pb_delta = -1;
+	msg.initial_qp = i_frame_qp;
+	msg.min_qp = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_min_qp);
+	msg.max_qp = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_max_qp);
+	msg.ip_delta = get_qp_delta(i_frame_qp, p_frame_qp);
+	msg.pb_delta = get_qp_delta(p_frame_qp, b_frame_qp);
 	msg.golden_ref = 0;
 	msg.golden_delta = 2;
 	msg.golden_ref_frequency = 10;
@@ -1470,7 +1492,8 @@ static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
 	/* See Rec. ITU-T H.264 (04/2017) p. 410 E-54 */
 	sps->vui.vcl_hrd_parameters.cpb_size_value_minus1[0] =
 		(channel->cpb_size * 1000) / (1 << (4 + sps->vui.vcl_hrd_parameters.cpb_size_scale)) - 1;
-	sps->vui.vcl_hrd_parameters.cbr_flag[0] = 1;
+	sps->vui.vcl_hrd_parameters.cbr_flag[0] =
+		!v4l2_ctrl_g_ctrl(channel->mpeg_video_frame_rc_enable);
 	sps->vui.vcl_hrd_parameters.initial_cpb_removal_delay_length_minus1 = 31;
 	sps->vui.vcl_hrd_parameters.cpb_removal_delay_length_minus1 = 31;
 	sps->vui.vcl_hrd_parameters.dpb_output_delay_length_minus1 = 31;
@@ -1692,13 +1715,13 @@ static void allegro_channel_finish_frame(struct allegro_channel *channel,
 		dst_buf->flags |= V4L2_BUF_FLAG_PFRAME;
 
 	v4l2_dbg(1, debug, &dev->v4l2_dev,
-		 "channel %d: encoded frame #%03d (%s%s, %d bytes)\n",
+		 "channel %d: encoded frame #%03d (%s%s, QP %d, %d bytes)\n",
 		 channel->mcu_channel_id,
 		 dst_buf->sequence,
 		 msg->is_idr ? "IDR, " : "",
 		 msg->slice_type == AL_ENC_SLICE_TYPE_I ? "I slice" :
 		 msg->slice_type == AL_ENC_SLICE_TYPE_P ? "P slice" : "unknown",
-		 partition->size);
+		 msg->qp, partition->size);
 
 err:
 	v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
@@ -2079,6 +2102,12 @@ static void allegro_destroy_channel(struct allegro_channel *channel)
 
 	v4l2_ctrl_grab(channel->mpeg_video_h264_profile, false);
 	v4l2_ctrl_grab(channel->mpeg_video_h264_level, false);
+	v4l2_ctrl_grab(channel->mpeg_video_h264_i_frame_qp, false);
+	v4l2_ctrl_grab(channel->mpeg_video_h264_max_qp, false);
+	v4l2_ctrl_grab(channel->mpeg_video_h264_min_qp, false);
+	v4l2_ctrl_grab(channel->mpeg_video_h264_p_frame_qp, false);
+	v4l2_ctrl_grab(channel->mpeg_video_h264_b_frame_qp, false);
+	v4l2_ctrl_grab(channel->mpeg_video_frame_rc_enable, false);
 	v4l2_ctrl_grab(channel->mpeg_video_bitrate_mode, false);
 	v4l2_ctrl_grab(channel->mpeg_video_bitrate, false);
 	v4l2_ctrl_grab(channel->mpeg_video_bitrate_peak, false);
@@ -2140,6 +2169,12 @@ static int allegro_create_channel(struct allegro_channel *channel)
 
 	v4l2_ctrl_grab(channel->mpeg_video_h264_profile, true);
 	v4l2_ctrl_grab(channel->mpeg_video_h264_level, true);
+	v4l2_ctrl_grab(channel->mpeg_video_h264_i_frame_qp, true);
+	v4l2_ctrl_grab(channel->mpeg_video_h264_max_qp, true);
+	v4l2_ctrl_grab(channel->mpeg_video_h264_min_qp, true);
+	v4l2_ctrl_grab(channel->mpeg_video_h264_p_frame_qp, true);
+	v4l2_ctrl_grab(channel->mpeg_video_h264_b_frame_qp, true);
+	v4l2_ctrl_grab(channel->mpeg_video_frame_rc_enable, true);
 	v4l2_ctrl_grab(channel->mpeg_video_bitrate_mode, true);
 	v4l2_ctrl_grab(channel->mpeg_video_bitrate, true);
 	v4l2_ctrl_grab(channel->mpeg_video_bitrate_peak, true);
@@ -2352,6 +2387,24 @@ static int allegro_queue_init(void *priv,
 	return 0;
 }
 
+static int allegro_clamp_qp(struct allegro_channel *channel,
+			    struct v4l2_ctrl *ctrl)
+{
+	struct v4l2_ctrl *next_ctrl;
+
+	if (ctrl->id == V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP)
+		next_ctrl = channel->mpeg_video_h264_p_frame_qp;
+	else if (ctrl->id == V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP)
+		next_ctrl = channel->mpeg_video_h264_b_frame_qp;
+	else
+		return 0;
+
+	/* Modify range automatically updates the value */
+	__v4l2_ctrl_modify_range(next_ctrl, ctrl->val, 51, 1, ctrl->val);
+
+	return allegro_clamp_qp(channel, next_ctrl);
+}
+
 static int allegro_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct allegro_channel *channel = container_of(ctrl->handler,
@@ -2366,6 +2419,9 @@ static int allegro_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
 		channel->level = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
+		channel->frame_rc_enable = ctrl->val;
+		break;
 	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
 		channel->bitrate_mode = ctrl->val;
 		break;
@@ -2381,6 +2437,11 @@ static int allegro_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
 		channel->gop_size = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP:
+	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP:
+	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP:
+		allegro_clamp_qp(channel, ctrl);
+		break;
 	}
 
 	return 0;
@@ -2422,6 +2483,37 @@ static int allegro_open(struct file *file)
 			V4L2_CID_MPEG_VIDEO_H264_LEVEL,
 			V4L2_MPEG_VIDEO_H264_LEVEL_5_1, mask,
 			V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
+	channel->mpeg_video_h264_i_frame_qp =
+		v4l2_ctrl_new_std(handler,
+				  &allegro_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP,
+				  0, 51, 1, 30);
+	channel->mpeg_video_h264_max_qp =
+		v4l2_ctrl_new_std(handler,
+				  &allegro_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_MAX_QP,
+				  0, 51, 1, 51);
+	channel->mpeg_video_h264_min_qp =
+		v4l2_ctrl_new_std(handler,
+				  &allegro_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_MIN_QP,
+				  0, 51, 1, 0);
+	channel->mpeg_video_h264_p_frame_qp =
+		v4l2_ctrl_new_std(handler,
+				  &allegro_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP,
+				  0, 51, 1, 30);
+	channel->mpeg_video_h264_b_frame_qp =
+		v4l2_ctrl_new_std(handler,
+				  &allegro_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP,
+				  0, 51, 1, 30);
+	channel->mpeg_video_frame_rc_enable =
+		v4l2_ctrl_new_std(handler,
+				  &allegro_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE,
+				  false, 0x1,
+				  true, false);
 	channel->mpeg_video_bitrate_mode = v4l2_ctrl_new_std_menu(handler,
 			&allegro_ctrl_ops,
 			V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
-- 
2.20.1

