Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9FAA1615D6
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 16:14:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728335AbgBQPOG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 10:14:06 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43345 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbgBQPOD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 10:14:03 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1j3i5x-0005WL-Cl; Mon, 17 Feb 2020 16:14:01 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1j3i5w-0001bG-Ef; Mon, 17 Feb 2020 16:14:00 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 18/18] media: allegro: create new struct for channel parameters
Date:   Mon, 17 Feb 2020 16:13:58 +0100
Message-Id: <20200217151358.5695-19-m.tretter@pengutronix.de>
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

Add a new struct for the channel parameters that is contained in the
CREATE_CHANNEL message. This is in preparation for newer firmwares that
pass the channel parameters in a dedicated buffer instead of embedding
the parameters into the CREATE_CHANNEL message.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../staging/media/allegro-dvt/allegro-core.c  | 139 ++++++++++--------
 .../staging/media/allegro-dvt/allegro-mail.h  |  10 +-
 2 files changed, 83 insertions(+), 66 deletions(-)

diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
index e56256d1cdb3..a7aa85ba5391 100644
--- a/drivers/staging/media/allegro-dvt/allegro-core.c
+++ b/drivers/staging/media/allegro-dvt/allegro-core.c
@@ -835,81 +835,94 @@ static s16 get_qp_delta(int minuend, int subtrahend)
 		return minuend - subtrahend;
 }
 
-static int allegro_mcu_send_create_channel(struct allegro_dev *dev,
-					   struct allegro_channel *channel)
-{
-	struct mcu_msg_create_channel msg;
-
-	memset(&msg, 0, sizeof(msg));
-
-	msg.header.type = MCU_MSG_TYPE_CREATE_CHANNEL;
-	msg.header.length = sizeof(msg) - sizeof(msg.header);
-
-	msg.user_id = channel->user_id;
-	msg.width = channel->width;
-	msg.height = channel->height;
-	msg.format = v4l2_pixelformat_to_mcu_format(channel->pixelformat);
-	msg.colorspace = v4l2_colorspace_to_mcu_colorspace(channel->colorspace);
-	msg.src_mode = 0x0;
-	msg.profile = v4l2_profile_to_mcu_profile(channel->profile);
-	msg.constraint_set_flags = BIT(1);
-	msg.codec = v4l2_pixelformat_to_mcu_codec(channel->codec);
-	msg.level = v4l2_level_to_mcu_level(channel->level);
-	msg.tier = 0;
-	msg.sps_param = BIT(20) | 0x4a;
-	msg.pps_param = BIT(2);
-	msg.enc_option = AL_OPT_RDO_COST_MODE | AL_OPT_LF_X_TILE |
-			 AL_OPT_LF_X_SLICE | AL_OPT_LF;
-	msg.beta_offset = -1;
-	msg.tc_offset = -1;
-	msg.num_slices = 1;
-	msg.me_range[0] = 8;
-	msg.me_range[1] = 8;
-	msg.me_range[2] = 16;
-	msg.me_range[3] = 16;
-	msg.max_cu_size = ilog2(SIZE_MACROBLOCK);
-	msg.min_cu_size = ilog2(8);
-	msg.max_tu_size = 2;
-	msg.min_tu_size = 2;
-	msg.max_transfo_depth_intra = 1;
-	msg.max_transfo_depth_inter = 1;
+static int fill_create_channel_param(struct allegro_channel *channel,
+				     struct create_channel_param *param)
+{
+	param->width = channel->width;
+	param->height = channel->height;
+	param->format = v4l2_pixelformat_to_mcu_format(channel->pixelformat);
+	param->colorspace = v4l2_colorspace_to_mcu_colorspace(channel->colorspace);
+	param->src_mode = 0x0;
+	param->profile = v4l2_profile_to_mcu_profile(channel->profile);
+	param->constraint_set_flags = BIT(1);
+	param->codec = v4l2_pixelformat_to_mcu_codec(channel->codec);
+	param->level = v4l2_level_to_mcu_level(channel->level);
+	param->tier = 0;
+	param->sps_param = BIT(20) | 0x4a;
+	param->pps_param = BIT(2);
+	param->enc_option = AL_OPT_RDO_COST_MODE | AL_OPT_LF_X_TILE |
+		AL_OPT_LF_X_SLICE | AL_OPT_LF;
+	param->beta_offset = -1;
+	param->tc_offset = -1;
+	param->num_slices = 1;
+	param->me_range[0] = 8;
+	param->me_range[1] = 8;
+	param->me_range[2] = 16;
+	param->me_range[3] = 16;
+	param->max_cu_size = ilog2(SIZE_MACROBLOCK);
+	param->min_cu_size = ilog2(8);
+	param->max_tu_size = 2;
+	param->min_tu_size = 2;
+	param->max_transfo_depth_intra = 1;
+	param->max_transfo_depth_inter = 1;
+
+	param->prefetch_auto = 0;
+	param->prefetch_mem_offset = 0;
+	param->prefetch_mem_size = 0;
 
 	if (channel->frame_rc_enable)
-		msg.rate_control_mode =
+		param->rate_control_mode =
 			v4l2_bitrate_mode_to_mcu_mode(v4l2_ctrl_g_ctrl(channel->mpeg_video_bitrate_mode));
 	else
-		msg.rate_control_mode = 0;
+		param->rate_control_mode = 0;
 
 	/* Encoder expects cpb_size in units of a 90 kHz clock. */
-	msg.cpb_size =
+	param->cpb_size =
 		(channel->cpb_size * 90000) / (channel->bitrate_peak / 1000 / BITS_PER_BYTE);
 	/* Shall be ]0;cpb_size in 90 kHz units]. Use maximum value. */
-	msg.initial_rem_delay = msg.cpb_size;
-	msg.framerate = DIV_ROUND_UP(channel->framerate.numerator,
-				     channel->framerate.denominator);
-	msg.clk_ratio = channel->framerate.denominator == 1001 ? 1001 : 1000;
-	msg.target_bitrate = channel->bitrate;
-	msg.max_bitrate = channel->bitrate_peak;
-	msg.initial_qp = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_i_frame_qp);
-	msg.min_qp = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_min_qp);
-	msg.max_qp = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_max_qp);
-	msg.ip_delta = get_qp_delta(
+	param->initial_rem_delay = param->cpb_size;
+	param->framerate = DIV_ROUND_UP(channel->framerate.numerator,
+					channel->framerate.denominator);
+	param->clk_ratio = channel->framerate.denominator == 1001 ? 1001 : 1000;
+	param->target_bitrate = channel->bitrate;
+	param->max_bitrate = channel->bitrate_peak;
+	param->initial_qp = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_i_frame_qp);
+	param->min_qp = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_min_qp);
+	param->max_qp = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_max_qp);
+	param->ip_delta = get_qp_delta(
 			v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_i_frame_qp),
 			v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_p_frame_qp));
-	msg.pb_delta = get_qp_delta(
+	param->pb_delta = get_qp_delta(
 			v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_p_frame_qp),
 			v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_b_frame_qp));
-	msg.golden_ref = 0;
-	msg.golden_delta = 2;
-	msg.golden_ref_frequency = 10;
-	msg.rate_control_option = 0x00000000;
-
-	msg.gop_ctrl_mode = 0x00000000;
-	msg.freq_idr = channel->gop_size;
-	msg.freq_lt = 0;
-	msg.gdr_mode = 0x00000000;
-	msg.gop_length = channel->gop_size;
-	msg.subframe_latency = 0x00000000;
+	param->golden_ref = 0;
+	param->golden_delta = 2;
+	param->golden_ref_frequency = 10;
+	param->rate_control_option = 0x00000000;
+
+	param->gop_ctrl_mode = 0x00000000;
+	param->freq_idr = channel->gop_size;
+	param->freq_lt = 0;
+	param->gdr_mode = 0x00000000;
+	param->gop_length = channel->gop_size;
+	param->subframe_latency = 0x00000000;
+
+	return 0;
+}
+
+static int allegro_mcu_send_create_channel(struct allegro_dev *dev,
+					   struct allegro_channel *channel)
+{
+	struct mcu_msg_create_channel msg;
+
+	memset(&msg, 0, sizeof(msg));
+
+	msg.header.type = MCU_MSG_TYPE_CREATE_CHANNEL;
+	msg.header.length = sizeof(msg) - sizeof(msg.header);
+
+	msg.user_id = channel->user_id;
+
+	fill_create_channel_param(channel, &msg.param);
 
 	allegro_mbox_write(dev, &dev->mbox_command, &msg, sizeof(msg));
 	allegro_mcu_interrupt(dev);
diff --git a/drivers/staging/media/allegro-dvt/allegro-mail.h b/drivers/staging/media/allegro-dvt/allegro-mail.h
index d9050d6b5c97..1a80320db4da 100644
--- a/drivers/staging/media/allegro-dvt/allegro-mail.h
+++ b/drivers/staging/media/allegro-dvt/allegro-mail.h
@@ -40,9 +40,7 @@ struct mcu_msg_init_response {
 	u32 reserved0;
 } __attribute__ ((__packed__));
 
-struct mcu_msg_create_channel {
-	struct mcu_msg_header header;
-	u32 user_id;
+struct create_channel_param {
 	u16 width;
 	u16 height;
 	u32 format;
@@ -131,6 +129,12 @@ struct mcu_msg_create_channel {
 	u32 unknown41;
 } __attribute__ ((__packed__));
 
+struct mcu_msg_create_channel {
+	struct mcu_msg_header header;
+	u32 user_id;
+	struct create_channel_param param;
+} __attribute__ ((__packed__));
+
 struct mcu_msg_create_channel_response {
 	struct mcu_msg_header header;
 	u32 channel_id;
-- 
2.20.1

