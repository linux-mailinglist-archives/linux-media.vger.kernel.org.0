Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC47C2CD43E
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388855AbgLCLE2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:04:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388755AbgLCLE1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 06:04:27 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E72D0C094240
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 03:02:56 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkmNt-0002L4-7l; Thu, 03 Dec 2020 12:02:55 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kkmNs-00CKiK-36; Thu, 03 Dec 2020 12:02:48 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Dec 2020 12:01:06 +0100
Message-Id: <20201203110106.2939463-19-m.tretter@pengutronix.de>
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
Subject: [PATCH 18/18] media: allegro: add support for HEVC encoding
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Allegro Codec supports HEVC encoding. The messages to the MCU are
the same for H.264 and HEVC, but some options have to be changed. These
are actually only a few options.

The driver, however, must add the HEVC VPS/SPS/PPS NAL Units to the
coded stream and must properly provide the HEVC format and controls to
user space.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../media/platform/allegro-dvt/allegro-core.c | 545 ++++++++++++++++--
 .../media/platform/allegro-dvt/allegro-mail.c |   6 +
 .../media/platform/allegro-dvt/allegro-mail.h |   1 +
 3 files changed, 516 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 5ff4509be13d..83370b0bd704 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -30,6 +30,7 @@
 
 #include "allegro-mail.h"
 #include "nal-h264.h"
+#include "nal-hevc.h"
 
 /*
  * Support up to 4k video streams. The hardware actually supports higher
@@ -209,6 +210,8 @@ struct allegro_channel {
 
 	bool enable_loop_filter_across_tiles;
 	bool enable_loop_filter_across_slices;
+	bool enable_deblocking_filter_override;
+	bool enable_reordering;
 	bool dbf_ovr_en;
 
 	unsigned int num_ref_idx_l0;
@@ -235,6 +238,16 @@ struct allegro_channel {
 	struct v4l2_ctrl *mpeg_video_h264_min_qp;
 	struct v4l2_ctrl *mpeg_video_h264_p_frame_qp;
 	struct v4l2_ctrl *mpeg_video_h264_b_frame_qp;
+
+	struct v4l2_ctrl *mpeg_video_hevc_profile;
+	struct v4l2_ctrl *mpeg_video_hevc_level;
+	struct v4l2_ctrl *mpeg_video_hevc_tier;
+	struct v4l2_ctrl *mpeg_video_hevc_i_frame_qp;
+	struct v4l2_ctrl *mpeg_video_hevc_max_qp;
+	struct v4l2_ctrl *mpeg_video_hevc_min_qp;
+	struct v4l2_ctrl *mpeg_video_hevc_p_frame_qp;
+	struct v4l2_ctrl *mpeg_video_hevc_b_frame_qp;
+
 	struct v4l2_ctrl *mpeg_video_frame_rc_enable;
 	struct { /* video bitrate mode control cluster */
 		struct v4l2_ctrl *mpeg_video_bitrate_mode;
@@ -267,31 +280,46 @@ struct allegro_channel {
 static inline int
 allegro_channel_get_i_frame_qp(struct allegro_channel *channel)
 {
-	return v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_i_frame_qp);
+	if (channel->codec == V4L2_PIX_FMT_HEVC)
+		return v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_i_frame_qp);
+	else
+		return v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_i_frame_qp);
 }
 
 static inline int
 allegro_channel_get_p_frame_qp(struct allegro_channel *channel)
 {
-	return v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_p_frame_qp);
+	if (channel->codec == V4L2_PIX_FMT_HEVC)
+		return v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_p_frame_qp);
+	else
+		return v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_p_frame_qp);
 }
 
 static inline int
 allegro_channel_get_b_frame_qp(struct allegro_channel *channel)
 {
-	return v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_b_frame_qp);
+	if (channel->codec == V4L2_PIX_FMT_HEVC)
+		return v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_b_frame_qp);
+	else
+		return v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_b_frame_qp);
 }
 
 static inline int
 allegro_channel_get_min_qp(struct allegro_channel *channel)
 {
-	return v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_min_qp);
+	if (channel->codec == V4L2_PIX_FMT_HEVC)
+		return v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_min_qp);
+	else
+		return v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_min_qp);
 }
 
 static inline int
 allegro_channel_get_max_qp(struct allegro_channel *channel)
 {
-	return v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_max_qp);
+	if (channel->codec == V4L2_PIX_FMT_HEVC)
+		return v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_max_qp);
+	else
+		return v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_max_qp);
 }
 
 struct allegro_m2m_buffer {
@@ -585,6 +613,86 @@ static unsigned int h264_maximum_cpb_size(enum v4l2_mpeg_video_h264_level level)
 	}
 }
 
+static enum v4l2_mpeg_video_hevc_level
+select_minimum_hevc_level(unsigned int width, unsigned int height)
+{
+	unsigned int luma_picture_size = width * height;
+	enum v4l2_mpeg_video_hevc_level level;
+
+	if (luma_picture_size <= 36864)
+		level = V4L2_MPEG_VIDEO_HEVC_LEVEL_1;
+	else if (luma_picture_size <= 122880)
+		level = V4L2_MPEG_VIDEO_HEVC_LEVEL_2;
+	else if (luma_picture_size <= 245760)
+		level = V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1;
+	else if (luma_picture_size <= 552960)
+		level = V4L2_MPEG_VIDEO_HEVC_LEVEL_3;
+	else if (luma_picture_size <= 983040)
+		level = V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1;
+	else if (luma_picture_size <= 2228224)
+		level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4;
+	else if (luma_picture_size <= 8912896)
+		level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5;
+	else
+		level = V4L2_MPEG_VIDEO_HEVC_LEVEL_6;
+
+	return level;
+}
+
+static unsigned int hevc_maximum_bitrate(enum v4l2_mpeg_video_h264_level level)
+{
+	/*
+	 * See Rec. ITU-T H.265 v5 (02/2018), A.4.2 Profile-specific level
+	 * limits for the video profiles.
+	 */
+	switch (level) {
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_1:
+		return 128;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2:
+		return 1500;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1:
+		return 3000;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3:
+		return 6000;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1:
+		return 10000;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4:
+		return 12000;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1:
+		return 20000;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5:
+		return 25000;
+	default:
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1:
+		return 40000;
+	}
+}
+
+static unsigned int hevc_maximum_cpb_size(enum v4l2_mpeg_video_h264_level level)
+{
+	switch (level) {
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_1:
+		return 350;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2:
+		return 1500;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1:
+		return 3000;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3:
+		return 6000;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1:
+		return 10000;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4:
+		return 12000;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1:
+		return 20000;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5:
+		return 25000;
+	default:
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1:
+		return 40000;
+	}
+}
+
 static const struct fw_info *
 allegro_get_firmware_info(struct allegro_dev *dev,
 			  const struct firmware *fw,
@@ -908,6 +1016,55 @@ static u16 v4l2_level_to_mcu_level(enum v4l2_mpeg_video_h264_level level)
 	}
 }
 
+static u8 hevc_profile_to_mcu_profile(enum v4l2_mpeg_video_hevc_profile profile)
+{
+	switch (profile) {
+	default:
+	case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN:
+		return 1;
+	case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10:
+		return 2;
+	case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE:
+		return 3;
+	}
+}
+
+static u16 hevc_level_to_mcu_level(enum v4l2_mpeg_video_hevc_level level)
+{
+	switch (level) {
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_1:
+		return 10;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2:
+		return 20;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1:
+		return 21;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3:
+		return 30;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1:
+		return 31;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4:
+		return 40;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1:
+		return 41;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5:
+		return 50;
+	default:
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1:
+		return 51;
+	}
+}
+
+static u8 hevc_tier_to_mcu_tier(enum v4l2_mpeg_video_hevc_tier tier)
+{
+	switch (tier) {
+	default:
+	case V4L2_MPEG_VIDEO_HEVC_TIER_MAIN:
+		return 0;
+	case V4L2_MPEG_VIDEO_HEVC_TIER_HIGH:
+		return 1;
+	}
+}
+
 static u32
 v4l2_bitrate_mode_to_mcu_mode(enum v4l2_mpeg_video_bitrate_mode mode)
 {
@@ -949,6 +1106,10 @@ static u32 allegro_channel_get_entropy_mode(struct allegro_channel *channel)
 #define ALLEGRO_ENTROPY_MODE_CAVLC 0
 #define ALLEGRO_ENTROPY_MODE_CABAC 1
 
+	/* HEVC always uses CABAC, but this has to be explicitly set */
+	if (channel->codec == V4L2_PIX_FMT_HEVC)
+		return ALLEGRO_ENTROPY_MODE_CABAC;
+
 	return ALLEGRO_ENTROPY_MODE_CAVLC;
 }
 
@@ -960,8 +1121,6 @@ static int fill_create_channel_param(struct allegro_channel *channel,
 	int b_frame_qp = allegro_channel_get_b_frame_qp(channel);
 	int bitrate_mode = v4l2_ctrl_g_ctrl(channel->mpeg_video_bitrate_mode);
 	unsigned int cpb_size = v4l2_ctrl_g_ctrl(channel->mpeg_video_cpb_size);
-	enum v4l2_mpeg_video_h264_profile profile;
-	enum v4l2_mpeg_video_h264_level level;
 
 	param->width = channel->width;
 	param->height = channel->height;
@@ -971,17 +1130,37 @@ static int fill_create_channel_param(struct allegro_channel *channel,
 	param->src_mode = 0x0;
 
 	param->codec = channel->codec;
-	profile = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_profile);
-	level = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_level);
-	param->profile = v4l2_profile_to_mcu_profile(profile);
-	param->constraint_set_flags = BIT(1);
-	param->level = v4l2_level_to_mcu_level(level);
+	if (channel->codec == V4L2_PIX_FMT_H264) {
+		enum v4l2_mpeg_video_h264_profile profile;
+		enum v4l2_mpeg_video_h264_level level;
+
+		profile = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_profile);
+		level = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_level);
+
+		param->profile = v4l2_profile_to_mcu_profile(profile);
+		param->constraint_set_flags = BIT(1);
+		param->level = v4l2_level_to_mcu_level(level);
+	} else {
+		enum v4l2_mpeg_video_hevc_profile profile;
+		enum v4l2_mpeg_video_hevc_level level;
+		enum v4l2_mpeg_video_hevc_tier tier;
+
+		profile = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_profile);
+		level = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_level);
+		tier = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_tier);
+
+		param->profile = hevc_profile_to_mcu_profile(profile);
+		param->level = hevc_level_to_mcu_level(level);
+		param->tier = hevc_tier_to_mcu_tier(tier);
+	}
 
 	param->log2_max_poc = LOG2_MAX_PIC_ORDER_CNT;
 	param->log2_max_frame_num = channel->log2_max_frame_num;
 	param->temporal_mvp_enable = channel->temporal_mvp_enable;
 
 	param->dbf_ovr_en = channel->dbf_ovr_en;
+	param->override_lf = channel->enable_deblocking_filter_override;
+	param->enable_reordering = channel->enable_reordering;
 	param->entropy_mode = allegro_channel_get_entropy_mode(channel);
 	param->rdo_cost_mode = 1;
 	param->custom_lda = 1;
@@ -1454,6 +1633,158 @@ static void allegro_channel_eos_event(struct allegro_channel *channel)
 	v4l2_event_queue_fh(&channel->fh, &eos_event);
 }
 
+static ssize_t allegro_hevc_write_vps(struct allegro_channel *channel,
+				      void *dest, size_t n)
+{
+	struct allegro_dev *dev = channel->dev;
+	struct nal_hevc_vps *vps;
+	struct nal_hevc_profile_tier_level *ptl;
+	ssize_t size;
+	unsigned int num_ref_frames = channel->num_ref_idx_l0;
+	s32 profile = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_profile);
+	s32 level = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_level);
+	s32 tier = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_tier);
+
+	vps = kzalloc(sizeof(*vps), GFP_KERNEL);
+	if (!vps)
+		return -ENOMEM;
+
+	vps->base_layer_internal_flag = 1;
+	vps->base_layer_available_flag = 1;
+	vps->temporal_id_nesting_flag = 1;
+
+	ptl = &vps->profile_tier_level;
+	ptl->general_profile_idc = nal_hevc_profile_from_v4l2(profile);
+	ptl->general_profile_compatibility_flag[ptl->general_profile_idc] = 1;
+	ptl->general_tier_flag = nal_hevc_tier_from_v4l2(tier);
+	ptl->general_progressive_source_flag = 1;
+	ptl->general_frame_only_constraint_flag = 1;
+	ptl->general_level_idc = nal_hevc_level_from_v4l2(level);
+
+	vps->sub_layer_ordering_info_present_flag = 0;
+	vps->max_dec_pic_buffering_minus1[0] = num_ref_frames;
+	vps->max_num_reorder_pics[0] = num_ref_frames;
+
+	size = nal_hevc_write_vps(&dev->plat_dev->dev, dest, n, vps);
+
+	kfree(vps);
+
+	return size;
+}
+
+static ssize_t allegro_hevc_write_sps(struct allegro_channel *channel,
+				      void *dest, size_t n)
+{
+	struct allegro_dev *dev = channel->dev;
+	struct nal_hevc_sps *sps;
+	struct nal_hevc_profile_tier_level *ptl;
+	ssize_t size;
+	unsigned int num_ref_frames = channel->num_ref_idx_l0;
+	s32 profile = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_profile);
+	s32 level = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_level);
+	s32 tier = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_tier);
+
+	sps = kzalloc(sizeof(*sps), GFP_KERNEL);
+	if (!sps)
+		return -ENOMEM;
+
+	sps->temporal_id_nesting_flag = 1;
+
+	ptl = &sps->profile_tier_level;
+	ptl->general_profile_idc = nal_hevc_profile_from_v4l2(profile);
+	ptl->general_profile_compatibility_flag[ptl->general_profile_idc] = 1;
+	ptl->general_tier_flag = nal_hevc_tier_from_v4l2(tier);
+	ptl->general_progressive_source_flag = 1;
+	ptl->general_frame_only_constraint_flag = 1;
+	ptl->general_level_idc = nal_hevc_level_from_v4l2(level);
+
+	sps->seq_parameter_set_id = 0;
+	sps->chroma_format_idc = 1; /* Only 4:2:0 sampling supported */
+	sps->pic_width_in_luma_samples = round_up(channel->width, 8);
+	sps->pic_height_in_luma_samples = round_up(channel->height, 8);
+	sps->conf_win_right_offset =
+		sps->pic_width_in_luma_samples - channel->width;
+	sps->conf_win_bottom_offset =
+		sps->pic_height_in_luma_samples - channel->height;
+	sps->conformance_window_flag =
+		sps->conf_win_right_offset || sps->conf_win_bottom_offset;
+
+	sps->log2_max_pic_order_cnt_lsb_minus4 = LOG2_MAX_PIC_ORDER_CNT - 4;
+
+	sps->sub_layer_ordering_info_present_flag = 1;
+	sps->max_dec_pic_buffering_minus1[0] = num_ref_frames;
+	sps->max_num_reorder_pics[0] = num_ref_frames;
+
+	sps->log2_min_luma_coding_block_size_minus3 =
+		channel->min_cu_size - 3;
+	sps->log2_diff_max_min_luma_coding_block_size =
+		channel->max_cu_size - channel->min_cu_size;
+	sps->log2_min_luma_transform_block_size_minus2 =
+		channel->min_tu_size - 2;
+	sps->log2_diff_max_min_luma_transform_block_size =
+		channel->max_tu_size - channel->min_tu_size;
+	sps->max_transform_hierarchy_depth_intra =
+		channel->max_transfo_depth_intra;
+	sps->max_transform_hierarchy_depth_inter =
+		channel->max_transfo_depth_inter;
+
+	sps->sps_temporal_mvp_enabled_flag = channel->temporal_mvp_enable;
+	sps->strong_intra_smoothing_enabled_flag = channel->max_cu_size > 4;
+
+	size = nal_hevc_write_sps(&dev->plat_dev->dev, dest, n, sps);
+
+	kfree(sps);
+
+	return size;
+}
+
+static ssize_t allegro_hevc_write_pps(struct allegro_channel *channel,
+				      struct mcu_msg_encode_frame_response *msg,
+				      void *dest, size_t n)
+{
+	struct allegro_dev *dev = channel->dev;
+	struct nal_hevc_pps *pps;
+	ssize_t size;
+	int i;
+
+	pps = kzalloc(sizeof(*pps), GFP_KERNEL);
+	if (!pps)
+		return -ENOMEM;
+
+	pps->pps_pic_parameter_set_id = 0;
+	pps->pps_seq_parameter_set_id = 0;
+
+	if (msg->num_column > 1 || msg->num_row > 1) {
+		pps->tiles_enabled_flag = 1;
+		pps->num_tile_columns_minus1 = msg->num_column - 1;
+		pps->num_tile_rows_minus1 = msg->num_row - 1;
+
+		for (i = 0; i < msg->num_column; i++)
+			pps->column_width_minus1[i] = msg->tile_width[i] - 1;
+
+		for (i = 0; i < msg->num_row; i++)
+			pps->row_height_minus1[i] = msg->tile_height[i] - 1;
+	}
+
+	pps->loop_filter_across_tiles_enabled_flag =
+		channel->enable_loop_filter_across_tiles;
+	pps->pps_loop_filter_across_slices_enabled_flag =
+		channel->enable_loop_filter_across_slices;
+	pps->deblocking_filter_control_present_flag = 1;
+	pps->deblocking_filter_override_enabled_flag =
+		channel->enable_deblocking_filter_override;
+	pps->pps_beta_offset_div2 = BETA_OFFSET_DIV_2;
+	pps->pps_tc_offset_div2 = TC_OFFSET_DIV_2;
+
+	pps->lists_modification_present_flag = channel->enable_reordering;
+
+	size = nal_hevc_write_pps(&dev->plat_dev->dev, dest, n, pps);
+
+	kfree(pps);
+
+	return size;
+}
+
 static u64 allegro_put_buffer(struct allegro_channel *channel,
 			      struct list_head *list,
 			      struct vb2_v4l2_buffer *buffer)
@@ -1577,8 +1908,27 @@ static void allegro_channel_finish_frame(struct allegro_channel *channel,
 
 	curr = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
 	free = partition->offset;
+
+	if (channel->codec == V4L2_PIX_FMT_HEVC && msg->is_idr) {
+		len = allegro_hevc_write_vps(channel, curr, free);
+		if (len < 0) {
+			v4l2_err(&dev->v4l2_dev,
+				 "not enough space for video parameter set: %zd left\n",
+				 free);
+			goto err;
+		}
+		curr += len;
+		free -= len;
+		v4l2_dbg(1, debug, &dev->v4l2_dev,
+			 "channel %d: wrote %zd byte VPS nal unit\n",
+			 channel->mcu_channel_id, len);
+	}
+
 	if (msg->is_idr) {
-		len = allegro_h264_write_sps(channel, curr, free);
+		if (channel->codec == V4L2_PIX_FMT_H264)
+			len = allegro_h264_write_sps(channel, curr, free);
+		else
+			len = allegro_hevc_write_sps(channel, curr, free);
 		if (len < 0) {
 			v4l2_err(&dev->v4l2_dev,
 				 "not enough space for sequence parameter set: %zd left\n",
@@ -1593,7 +1943,10 @@ static void allegro_channel_finish_frame(struct allegro_channel *channel,
 	}
 
 	if (msg->slice_type == AL_ENC_SLICE_TYPE_I) {
-		len = allegro_h264_write_pps(channel, curr, free);
+		if (channel->codec == V4L2_PIX_FMT_H264)
+			len = allegro_h264_write_pps(channel, curr, free);
+		else
+			len = allegro_hevc_write_pps(channel, msg, curr, free);
 		if (len < 0) {
 			v4l2_err(&dev->v4l2_dev,
 				 "not enough space for picture parameter set: %zd left\n",
@@ -1611,7 +1964,10 @@ static void allegro_channel_finish_frame(struct allegro_channel *channel,
 		dst_buf->vb2_buf.planes[0].data_offset = free;
 		free = 0;
 	} else {
-		len = nal_h264_write_filler(&dev->plat_dev->dev, curr, free);
+		if (channel->codec == V4L2_PIX_FMT_H264)
+			len = nal_h264_write_filler(&dev->plat_dev->dev, curr, free);
+		else
+			len = nal_hevc_write_filler(&dev->plat_dev->dev, curr, free);
 		if (len < 0) {
 			v4l2_err(&dev->v4l2_dev,
 				 "failed to write %zd filler data\n", free);
@@ -2011,6 +2367,16 @@ static void allegro_destroy_channel(struct allegro_channel *channel)
 	v4l2_ctrl_grab(channel->mpeg_video_h264_min_qp, false);
 	v4l2_ctrl_grab(channel->mpeg_video_h264_p_frame_qp, false);
 	v4l2_ctrl_grab(channel->mpeg_video_h264_b_frame_qp, false);
+
+	v4l2_ctrl_grab(channel->mpeg_video_hevc_profile, false);
+	v4l2_ctrl_grab(channel->mpeg_video_hevc_level, false);
+	v4l2_ctrl_grab(channel->mpeg_video_hevc_tier, false);
+	v4l2_ctrl_grab(channel->mpeg_video_hevc_i_frame_qp, false);
+	v4l2_ctrl_grab(channel->mpeg_video_hevc_max_qp, false);
+	v4l2_ctrl_grab(channel->mpeg_video_hevc_min_qp, false);
+	v4l2_ctrl_grab(channel->mpeg_video_hevc_p_frame_qp, false);
+	v4l2_ctrl_grab(channel->mpeg_video_hevc_b_frame_qp, false);
+
 	v4l2_ctrl_grab(channel->mpeg_video_frame_rc_enable, false);
 	v4l2_ctrl_grab(channel->mpeg_video_bitrate_mode, false);
 	v4l2_ctrl_grab(channel->mpeg_video_bitrate, false);
@@ -2067,6 +2433,16 @@ static int allegro_create_channel(struct allegro_channel *channel)
 	v4l2_ctrl_grab(channel->mpeg_video_h264_min_qp, true);
 	v4l2_ctrl_grab(channel->mpeg_video_h264_p_frame_qp, true);
 	v4l2_ctrl_grab(channel->mpeg_video_h264_b_frame_qp, true);
+
+	v4l2_ctrl_grab(channel->mpeg_video_hevc_profile, true);
+	v4l2_ctrl_grab(channel->mpeg_video_hevc_level, true);
+	v4l2_ctrl_grab(channel->mpeg_video_hevc_tier, true);
+	v4l2_ctrl_grab(channel->mpeg_video_hevc_i_frame_qp, true);
+	v4l2_ctrl_grab(channel->mpeg_video_hevc_max_qp, true);
+	v4l2_ctrl_grab(channel->mpeg_video_hevc_min_qp, true);
+	v4l2_ctrl_grab(channel->mpeg_video_hevc_p_frame_qp, true);
+	v4l2_ctrl_grab(channel->mpeg_video_hevc_b_frame_qp, true);
+
 	v4l2_ctrl_grab(channel->mpeg_video_frame_rc_enable, true);
 	v4l2_ctrl_grab(channel->mpeg_video_bitrate_mode, true);
 	v4l2_ctrl_grab(channel->mpeg_video_bitrate, true);
@@ -2113,8 +2489,13 @@ static void allegro_channel_adjust(struct allegro_channel *channel)
 	channel->sizeimage_encoded =
 		estimate_stream_size(channel->width, channel->height);
 
-	ctrl = channel->mpeg_video_h264_level;
-	min = select_minimum_h264_level(channel->width, channel->height);
+	if (codec == V4L2_PIX_FMT_H264) {
+		ctrl = channel->mpeg_video_h264_level;
+		min = select_minimum_h264_level(channel->width, channel->height);
+	} else {
+		ctrl = channel->mpeg_video_hevc_level;
+		min = select_minimum_hevc_level(channel->width, channel->height);
+	}
 	if (ctrl->minimum > min)
 		v4l2_dbg(1, debug, &dev->v4l2_dev,
 			 "%s.minimum: %lld -> %lld\n",
@@ -2125,7 +2506,10 @@ static void allegro_channel_adjust(struct allegro_channel *channel)
 	v4l2_ctrl_unlock(ctrl);
 
 	ctrl = channel->mpeg_video_bitrate;
-	max = h264_maximum_bitrate(v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_level));
+	if (codec == V4L2_PIX_FMT_H264)
+		max = h264_maximum_bitrate(v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_level));
+	else
+		max = hevc_maximum_bitrate(v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_level));
 	if (ctrl->maximum < max)
 		v4l2_dbg(1, debug, &dev->v4l2_dev,
 			 "%s: maximum: %lld -> %lld\n",
@@ -2156,21 +2540,51 @@ static void allegro_channel_adjust(struct allegro_channel *channel)
 	v4l2_ctrl_activate(channel->mpeg_video_h264_b_frame_qp,
 			   codec == V4L2_PIX_FMT_H264);
 
-	channel->log2_max_frame_num = LOG2_MAX_FRAME_NUM;
+	v4l2_ctrl_activate(channel->mpeg_video_hevc_profile,
+			   codec == V4L2_PIX_FMT_HEVC);
+	v4l2_ctrl_activate(channel->mpeg_video_hevc_level,
+			   codec == V4L2_PIX_FMT_HEVC);
+	v4l2_ctrl_activate(channel->mpeg_video_hevc_tier,
+			   codec == V4L2_PIX_FMT_HEVC);
+	v4l2_ctrl_activate(channel->mpeg_video_hevc_i_frame_qp,
+			   codec == V4L2_PIX_FMT_HEVC);
+	v4l2_ctrl_activate(channel->mpeg_video_hevc_max_qp,
+			   codec == V4L2_PIX_FMT_HEVC);
+	v4l2_ctrl_activate(channel->mpeg_video_hevc_min_qp,
+			   codec == V4L2_PIX_FMT_HEVC);
+	v4l2_ctrl_activate(channel->mpeg_video_hevc_p_frame_qp,
+			   codec == V4L2_PIX_FMT_HEVC);
+	v4l2_ctrl_activate(channel->mpeg_video_hevc_b_frame_qp,
+			   codec == V4L2_PIX_FMT_HEVC);
+
+	if (codec == V4L2_PIX_FMT_H264)
+		channel->log2_max_frame_num = LOG2_MAX_FRAME_NUM;
 	channel->temporal_mvp_enable = true;
-
-	channel->dbf_ovr_en = true;
+	channel->dbf_ovr_en = (codec == V4L2_PIX_FMT_H264);
+	channel->enable_deblocking_filter_override = (codec == V4L2_PIX_FMT_HEVC);
+	channel->enable_reordering = (codec == V4L2_PIX_FMT_HEVC);
 	channel->enable_loop_filter_across_tiles = true;
 	channel->enable_loop_filter_across_slices = true;
 
-	channel->b_hrz_me_range = 8;
-	channel->b_vrt_me_range = 8;
-	channel->p_hrz_me_range = 16;
-	channel->p_vrt_me_range = 16;
-	channel->max_cu_size = ilog2(16);
-	channel->min_cu_size = ilog2(8);
-	channel->max_tu_size = ilog2(4);
-	channel->min_tu_size = ilog2(4);
+	if (codec == V4L2_PIX_FMT_H264) {
+		channel->b_hrz_me_range = 8;
+		channel->b_vrt_me_range = 8;
+		channel->p_hrz_me_range = 16;
+		channel->p_vrt_me_range = 16;
+		channel->max_cu_size = ilog2(16);
+		channel->min_cu_size = ilog2(8);
+		channel->max_tu_size = ilog2(4);
+		channel->min_tu_size = ilog2(4);
+	} else {
+		channel->b_hrz_me_range = 16;
+		channel->b_vrt_me_range = 16;
+		channel->p_hrz_me_range = 32;
+		channel->p_vrt_me_range = 32;
+		channel->max_cu_size = ilog2(32);
+		channel->min_cu_size = ilog2(8);
+		channel->max_tu_size = ilog2(32);
+		channel->min_tu_size = ilog2(4);
+	}
 	channel->max_transfo_depth_intra = 1;
 	channel->max_transfo_depth_inter = 1;
 }
@@ -2525,6 +2939,51 @@ static int allegro_open(struct file *file)
 				  &allegro_ctrl_ops,
 				  V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP,
 				  0, 51, 1, 30);
+
+	channel->mpeg_video_hevc_profile =
+		v4l2_ctrl_new_std_menu(handler,
+				       &allegro_ctrl_ops,
+				       V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+				       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN, 0x0,
+				       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN);
+	channel->mpeg_video_hevc_level =
+		v4l2_ctrl_new_std_menu(handler,
+				       &allegro_ctrl_ops,
+				       V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
+				       V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1, 0x0,
+				       V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1);
+	channel->mpeg_video_hevc_tier =
+		v4l2_ctrl_new_std_menu(handler,
+				       &allegro_ctrl_ops,
+				       V4L2_CID_MPEG_VIDEO_HEVC_TIER,
+				       V4L2_MPEG_VIDEO_HEVC_TIER_HIGH, 0x0,
+				       V4L2_MPEG_VIDEO_HEVC_TIER_MAIN);
+	channel->mpeg_video_hevc_i_frame_qp =
+		v4l2_ctrl_new_std(handler,
+				  &allegro_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP,
+				  0, 51, 1, 30);
+	channel->mpeg_video_hevc_max_qp =
+		v4l2_ctrl_new_std(handler,
+				  &allegro_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP,
+				  0, 51, 1, 51);
+	channel->mpeg_video_hevc_min_qp =
+		v4l2_ctrl_new_std(handler,
+				  &allegro_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP,
+				  0, 51, 1, 0);
+	channel->mpeg_video_hevc_p_frame_qp =
+		v4l2_ctrl_new_std(handler,
+				  &allegro_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP,
+				  0, 51, 1, 30);
+	channel->mpeg_video_hevc_b_frame_qp =
+		v4l2_ctrl_new_std(handler,
+				  &allegro_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP,
+				  0, 51, 1, 30);
+
 	channel->mpeg_video_frame_rc_enable =
 		v4l2_ctrl_new_std(handler,
 				  &allegro_ctrl_ops,
@@ -2537,10 +2996,17 @@ static int allegro_open(struct file *file)
 			V4L2_MPEG_VIDEO_BITRATE_MODE_CBR, 0,
 			V4L2_MPEG_VIDEO_BITRATE_MODE_CBR);
 
-	bitrate_max = h264_maximum_bitrate(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
-	bitrate_def = h264_maximum_bitrate(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
-	cpb_size_max = h264_maximum_cpb_size(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
-	cpb_size_def = h264_maximum_cpb_size(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
+	if (channel->codec == V4L2_PIX_FMT_H264) {
+		bitrate_max = h264_maximum_bitrate(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
+		bitrate_def = h264_maximum_bitrate(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
+		cpb_size_max = h264_maximum_cpb_size(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
+		cpb_size_def = h264_maximum_cpb_size(V4L2_MPEG_VIDEO_H264_LEVEL_5_1);
+	} else {
+		bitrate_max = hevc_maximum_bitrate(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1);
+		bitrate_def = hevc_maximum_bitrate(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1);
+		cpb_size_max = hevc_maximum_cpb_size(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1);
+		cpb_size_def = hevc_maximum_cpb_size(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1);
+	}
 	channel->mpeg_video_bitrate = v4l2_ctrl_new_std(handler,
 			&allegro_ctrl_ops,
 			V4L2_CID_MPEG_VIDEO_BITRATE,
@@ -2645,9 +3111,12 @@ static int allegro_enum_fmt_vid(struct file *file, void *fh,
 		f->pixelformat = V4L2_PIX_FMT_NV12;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
-		if (f->index >= 1)
+		if (f->index >= 2)
 			return -EINVAL;
-		f->pixelformat = V4L2_PIX_FMT_H264;
+		if (f->index == 0)
+			f->pixelformat = V4L2_PIX_FMT_H264;
+		if (f->index == 1)
+			f->pixelformat = V4L2_PIX_FMT_HEVC;
 		break;
 	default:
 		return -EINVAL;
@@ -2686,7 +3155,10 @@ static int allegro_try_fmt_vid_cap(struct file *file, void *fh,
 	f->fmt.pix.height = clamp_t(__u32, f->fmt.pix.height,
 				    ALLEGRO_HEIGHT_MIN, ALLEGRO_HEIGHT_MAX);
 
-	f->fmt.pix.pixelformat = V4L2_PIX_FMT_H264;
+	if (f->fmt.pix.pixelformat != V4L2_PIX_FMT_HEVC &&
+	    f->fmt.pix.pixelformat != V4L2_PIX_FMT_H264)
+		f->fmt.pix.pixelformat = V4L2_PIX_FMT_H264;
+
 	f->fmt.pix.bytesperline = 0;
 	f->fmt.pix.sizeimage =
 		estimate_stream_size(f->fmt.pix.width, f->fmt.pix.height);
@@ -2826,6 +3298,7 @@ static int allegro_enum_framesizes(struct file *file, void *fh,
 				   struct v4l2_frmsizeenum *fsize)
 {
 	switch (fsize->pixel_format) {
+	case V4L2_PIX_FMT_HEVC:
 	case V4L2_PIX_FMT_H264:
 	case V4L2_PIX_FMT_NV12:
 		break;
diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.c b/drivers/media/platform/allegro-dvt/allegro-mail.c
index 5dbc1c029020..7e08c5050f2e 100644
--- a/drivers/media/platform/allegro-dvt/allegro-mail.c
+++ b/drivers/media/platform/allegro-dvt/allegro-mail.c
@@ -67,12 +67,16 @@ static inline u32 settings_get_mcu_codec(struct create_channel_param *param)
 
 	if (version < MCU_MSG_VERSION_2019_2) {
 		switch (pixelformat) {
+		case V4L2_PIX_FMT_HEVC:
+			return 2;
 		case V4L2_PIX_FMT_H264:
 		default:
 			return 1;
 		}
 	} else {
 		switch (pixelformat) {
+		case V4L2_PIX_FMT_HEVC:
+			return 1;
 		case V4L2_PIX_FMT_H264:
 		default:
 			return 0;
@@ -117,7 +121,9 @@ allegro_encode_config_blob(u32 *dst, struct create_channel_param *param)
 	dst[i++] = val;
 
 	val = 0;
+	val |= param->enable_reordering ? BIT(0) : 0;
 	val |= param->dbf_ovr_en ? BIT(2) : 0;
+	val |= param->override_lf ? BIT(12) : 0;
 	dst[i++] = val;
 
 	if (version >= MCU_MSG_VERSION_2019_2) {
diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.h b/drivers/media/platform/allegro-dvt/allegro-mail.h
index f7485cf78c4f..2c7bc509eac3 100644
--- a/drivers/media/platform/allegro-dvt/allegro-mail.h
+++ b/drivers/media/platform/allegro-dvt/allegro-mail.h
@@ -65,6 +65,7 @@ struct create_channel_param {
 	u32 temporal_mvp_enable;
 	u32 enable_reordering;
 	u32 dbf_ovr_en;
+	u32 override_lf;
 	u32 num_ref_idx_l0;
 	u32 num_ref_idx_l1;
 	u32 custom_lda;
-- 
2.20.1

