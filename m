Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02C7E2CD42F
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730257AbgLCLDe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:03:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729085AbgLCLDd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 06:03:33 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 601B8C061A52
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 03:02:53 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkmNs-0002Ks-Tl; Thu, 03 Dec 2020 12:02:51 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kkmNr-00CKhk-Si; Thu, 03 Dec 2020 12:02:47 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Dec 2020 12:00:54 +0100
Message-Id: <20201203110106.2939463-7-m.tretter@pengutronix.de>
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
Subject: [PATCH 06/18] media: allegro: move encoding options to channel
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several encoding options that are hard coded in the parameter
that is used to configure the hardware codec. However, some of the
options must be written to the SPS/PPS by the driver. Furthermore, some
of the options depend on the codec that is used (i.e. H.264 or HEVC).

Therefore, move options that depend on the codec to the channel and add
constants for options that are independent of the codec but must be
written to the SPS/PPS.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../media/platform/allegro-dvt/allegro-core.c | 85 ++++++++++++++-----
 1 file changed, 65 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 3253262d56f9..a2a9000bbb15 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -94,6 +94,12 @@
 
 #define SIZE_MACROBLOCK 16
 
+/* Encoding options */
+#define LOG2_MAX_FRAME_NUM		4
+#define LOG2_MAX_PIC_ORDER_CNT		10
+#define BETA_OFFSET_DIV_2		-1
+#define TC_OFFSET_DIV_2			-1
+
 static int debug;
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "Debug level (0-2)");
@@ -202,9 +208,30 @@ struct allegro_channel {
 
 	struct allegro_buffer config_blob;
 
+	unsigned int log2_max_frame_num;
+	bool temporal_mvp_enable;
+
+	bool enable_loop_filter_across_tiles;
+	bool enable_loop_filter_across_slices;
+	bool dbf_ovr_en;
+
 	unsigned int num_ref_idx_l0;
 	unsigned int num_ref_idx_l1;
 
+	/* Maximum range for motion estimation */
+	int b_hrz_me_range;
+	int b_vrt_me_range;
+	int p_hrz_me_range;
+	int p_vrt_me_range;
+	/* Size limits of coding unit */
+	int min_cu_size;
+	int max_cu_size;
+	/* Size limits of transform unit */
+	int min_tu_size;
+	int max_tu_size;
+	int max_transfo_depth_intra;
+	int max_transfo_depth_inter;
+
 	struct v4l2_ctrl *mpeg_video_h264_profile;
 	struct v4l2_ctrl *mpeg_video_h264_level;
 	struct v4l2_ctrl *mpeg_video_h264_i_frame_qp;
@@ -911,32 +938,32 @@ static int fill_create_channel_param(struct allegro_channel *channel,
 	param->level = v4l2_level_to_mcu_level(channel->level);
 	param->tier = 0;
 
-	param->log2_max_poc = 10;
-	param->log2_max_frame_num = 4;
-	param->temporal_mvp_enable = 1;
+	param->log2_max_poc = LOG2_MAX_PIC_ORDER_CNT;
+	param->log2_max_frame_num = channel->log2_max_frame_num;
+	param->temporal_mvp_enable = channel->temporal_mvp_enable;
 
-	param->dbf_ovr_en = 1;
+	param->dbf_ovr_en = channel->dbf_ovr_en;
 	param->rdo_cost_mode = 1;
 	param->custom_lda = 1;
 	param->lf = 1;
-	param->lf_x_tile = 1;
-	param->lf_x_slice = 1;
+	param->lf_x_tile = channel->enable_loop_filter_across_tiles;
+	param->lf_x_slice = channel->enable_loop_filter_across_slices;
 
 	param->src_bit_depth = 8;
 
-	param->beta_offset = -1;
-	param->tc_offset = -1;
+	param->beta_offset = BETA_OFFSET_DIV_2;
+	param->tc_offset = TC_OFFSET_DIV_2;
 	param->num_slices = 1;
-	param->me_range[0] = 8;
-	param->me_range[1] = 8;
-	param->me_range[2] = 16;
-	param->me_range[3] = 16;
-	param->max_cu_size = ilog2(SIZE_MACROBLOCK);
-	param->min_cu_size = ilog2(8);
-	param->max_tu_size = 2;
-	param->min_tu_size = 2;
-	param->max_transfo_depth_intra = 1;
-	param->max_transfo_depth_inter = 1;
+	param->me_range[0] = channel->b_hrz_me_range;
+	param->me_range[1] = channel->b_vrt_me_range;
+	param->me_range[2] = channel->p_hrz_me_range;
+	param->me_range[3] = channel->p_vrt_me_range;
+	param->max_cu_size = channel->max_cu_size;
+	param->min_cu_size = channel->min_cu_size;
+	param->max_tu_size = channel->max_tu_size;
+	param->min_tu_size = channel->min_tu_size;
+	param->max_transfo_depth_intra = channel->max_transfo_depth_intra;
+	param->max_transfo_depth_inter = channel->max_transfo_depth_inter;
 
 	param->prefetch_auto = 0;
 	param->prefetch_mem_offset = 0;
@@ -1266,9 +1293,9 @@ static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
 	sps->constraint_set5_flag = 0;
 	sps->level_idc = nal_h264_level_from_v4l2(channel->level);
 	sps->seq_parameter_set_id = 0;
-	sps->log2_max_frame_num_minus4 = 0;
+	sps->log2_max_frame_num_minus4 = LOG2_MAX_FRAME_NUM - 4;
 	sps->pic_order_cnt_type = 0;
-	sps->log2_max_pic_order_cnt_lsb_minus4 = 6;
+	sps->log2_max_pic_order_cnt_lsb_minus4 = LOG2_MAX_PIC_ORDER_CNT - 4;
 	sps->max_num_ref_frames = 3;
 	sps->gaps_in_frame_num_value_allowed_flag = 0;
 	sps->pic_width_in_mbs_minus1 =
@@ -2065,6 +2092,24 @@ static void allegro_channel_adjust(struct allegro_channel *channel)
 	__v4l2_ctrl_modify_range(ctrl, ctrl->minimum, max,
 				 ctrl->step, ctrl->default_value);
 	v4l2_ctrl_unlock(ctrl);
+
+	channel->log2_max_frame_num = LOG2_MAX_FRAME_NUM;
+	channel->temporal_mvp_enable = true;
+
+	channel->dbf_ovr_en = true;
+	channel->enable_loop_filter_across_tiles = true;
+	channel->enable_loop_filter_across_slices = true;
+
+	channel->b_hrz_me_range = 8;
+	channel->b_vrt_me_range = 8;
+	channel->p_hrz_me_range = 16;
+	channel->p_vrt_me_range = 16;
+	channel->max_cu_size = ilog2(16);
+	channel->min_cu_size = ilog2(8);
+	channel->max_tu_size = ilog2(4);
+	channel->min_tu_size = ilog2(4);
+	channel->max_transfo_depth_intra = 1;
+	channel->max_transfo_depth_inter = 1;
 }
 
 static void allegro_set_default_params(struct allegro_channel *channel)
-- 
2.20.1

