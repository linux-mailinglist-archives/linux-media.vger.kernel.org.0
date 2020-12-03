Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADFAB2CD43F
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388864AbgLCLEj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:04:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388755AbgLCLEj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 06:04:39 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E79C08E9AA
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 03:02:55 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkmNs-0002Kp-R4; Thu, 03 Dec 2020 12:02:54 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kkmNr-00CKhc-Qo; Thu, 03 Dec 2020 12:02:47 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Dec 2020 12:00:51 +0100
Message-Id: <20201203110106.2939463-4-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203110106.2939463-1-m.tretter@pengutronix.de>
References: <20201203110106.2939463-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
        metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_SOFTFAIL,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.2
Subject: [PATCH 03/18] media: allegro: add HEVC NAL unit generator
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When encoding a video as HEVC, the allegro driver needs to generate the
Non-VCL NAL units for HEVC. Do the same as for H.264 and add a module
that takes C structs for the VPS/SPS/PPS and encodes the fields as RBPS
as specified by "ITU-T Rec. H.265 (02/2018) high efficiency video
coding".

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/allegro-dvt/Makefile   |   2 +-
 drivers/media/platform/allegro-dvt/nal-hevc.c | 824 ++++++++++++++++++
 drivers/media/platform/allegro-dvt/nal-hevc.h | 350 ++++++++
 3 files changed, 1175 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/allegro-dvt/nal-hevc.c
 create mode 100644 drivers/media/platform/allegro-dvt/nal-hevc.h

diff --git a/drivers/media/platform/allegro-dvt/Makefile b/drivers/media/platform/allegro-dvt/Makefile
index 10119e84a60f..66108a303774 100644
--- a/drivers/media/platform/allegro-dvt/Makefile
+++ b/drivers/media/platform/allegro-dvt/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 allegro-objs := allegro-core.o allegro-mail.o
-allegro-objs += nal-rbsp.o nal-h264.o
+allegro-objs += nal-rbsp.o nal-h264.o nal-hevc.o
 
 obj-$(CONFIG_VIDEO_ALLEGRO_DVT) += allegro.o
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.c b/drivers/media/platform/allegro-dvt/nal-hevc.c
new file mode 100644
index 000000000000..2dcc516729d7
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/nal-hevc.c
@@ -0,0 +1,824 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2019-2020 Pengutronix, Michael Tretter <kernel@pengutronix.de>
+ *
+ * Convert NAL units between raw byte sequence payloads (RBSP) and C structs.
+ *
+ * The conversion is defined in "ITU-T Rec. H.265 (02/2018) high efficiency
+ * video coding". Decoder drivers may use the parser to parse RBSP from
+ * encoded streams and configure the hardware, if the hardware is not able to
+ * parse RBSP itself. Encoder drivers may use the generator to generate the
+ * RBSP for VPS/SPS/PPS nal units and add them to the encoded stream if the
+ * hardware does not generate the units.
+ */
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <linux/string.h>
+#include <linux/v4l2-controls.h>
+
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/log2.h>
+
+#include "nal-hevc.h"
+#include "nal-rbsp.h"
+
+/*
+ * See Rec. ITU-T H.265 (02/2018) Table 7-1 – NAL unit type codes and NAL unit
+ * type classes
+ */
+enum nal_unit_type {
+	VPS_NUT = 32,
+	SPS_NUT = 33,
+	PPS_NUT = 34,
+	FD_NUT = 38,
+};
+
+int nal_hevc_profile_from_v4l2(enum v4l2_mpeg_video_hevc_profile profile)
+{
+	switch (profile) {
+	case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN:
+		return 1;
+	case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10:
+		return 2;
+	case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE:
+		return 3;
+	default:
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL_GPL(nal_hevc_profile_from_v4l2);
+
+int nal_hevc_tier_from_v4l2(enum v4l2_mpeg_video_hevc_tier tier)
+{
+	switch (tier) {
+	case V4L2_MPEG_VIDEO_HEVC_TIER_MAIN:
+		return 0;
+	case V4L2_MPEG_VIDEO_HEVC_TIER_HIGH:
+		return 1;
+	default:
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL_GPL(nal_hevc_tier_from_v4l2);
+
+int nal_hevc_level_from_v4l2(enum v4l2_mpeg_video_hevc_level level)
+{
+	/*
+	 * T-Rec-H.265 p. 280: general_level_idc and sub_layer_level_idc[ i ]
+	 * shall be set equal to a value of 30 times the level number
+	 * specified in Table A.6.
+	 */
+	int factor = 30 / 10;
+
+	switch (level) {
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_1:
+		return factor * 10;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2:
+		return factor * 20;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1:
+		return factor * 21;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3:
+		return factor * 30;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1:
+		return factor * 31;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4:
+		return factor * 40;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1:
+		return factor * 41;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5:
+		return factor * 50;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1:
+		return factor * 51;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2:
+		return factor * 52;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_6:
+		return factor * 60;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1:
+		return factor * 61;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2:
+		return factor * 62;
+	default:
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL_GPL(nal_hevc_level_from_v4l2);
+
+void nal_hevc_write_start_code_prefix(struct rbsp *rbsp)
+{
+	u8 *p = rbsp->data + DIV_ROUND_UP(rbsp->pos, 8);
+	int i = 4;
+
+	if (DIV_ROUND_UP(rbsp->pos, 8) + i > rbsp->size) {
+		rbsp->error = -EINVAL;
+		return;
+	}
+
+	p[0] = 0x00;
+	p[1] = 0x00;
+	p[2] = 0x00;
+	p[3] = 0x01;
+
+	rbsp->pos += i * 8;
+}
+
+void nal_hevc_read_start_code_prefix(struct rbsp *rbsp)
+{
+	u8 *p = rbsp->data + DIV_ROUND_UP(rbsp->pos, 8);
+	int i = 4;
+
+	if (DIV_ROUND_UP(rbsp->pos, 8) + i > rbsp->size) {
+		rbsp->error = -EINVAL;
+		return;
+	}
+
+	if (p[0] != 0x00 || p[1] != 0x00 || p[2] != 0x00 || p[3] != 0x01) {
+		rbsp->error = -EINVAL;
+		return;
+	}
+
+	rbsp->pos += i * 8;
+}
+
+static void nal_hevc_write_filler_data(struct rbsp *rbsp)
+{
+	u8 *p = rbsp->data + DIV_ROUND_UP(rbsp->pos, 8);
+	int i;
+
+	/* Keep 1 byte extra for terminating the NAL unit */
+	i = rbsp->size - DIV_ROUND_UP(rbsp->pos, 8) - 1;
+	memset(p, 0xff, i);
+	rbsp->pos += i * 8;
+}
+
+static void nal_hevc_read_filler_data(struct rbsp *rbsp)
+{
+	u8 *p = rbsp->data + DIV_ROUND_UP(rbsp->pos, 8);
+
+	while (*p == 0xff) {
+		if (DIV_ROUND_UP(rbsp->pos, 8) > rbsp->size) {
+			rbsp->error = -EINVAL;
+			return;
+		}
+
+		p++;
+		rbsp->pos += 8;
+	}
+}
+
+static void nal_hevc_rbsp_profile_tier_level(struct rbsp *rbsp,
+					     struct nal_hevc_profile_tier_level *ptl)
+{
+	unsigned int i;
+	unsigned int max_num_sub_layers_minus_1 = 0;
+
+	rbsp_bits(rbsp, 2, &ptl->general_profile_space);
+	rbsp_bit(rbsp, &ptl->general_tier_flag);
+	rbsp_bits(rbsp, 5, &ptl->general_profile_idc);
+	for (i = 0; i < 32; i++)
+		rbsp_bit(rbsp, &ptl->general_profile_compatibility_flag[i]);
+	rbsp_bit(rbsp, &ptl->general_progressive_source_flag);
+	rbsp_bit(rbsp, &ptl->general_interlaced_source_flag);
+	rbsp_bit(rbsp, &ptl->general_non_packed_constraint_flag);
+	rbsp_bit(rbsp, &ptl->general_frame_only_constraint_flag);
+	if (ptl->general_profile_idc == 4 ||
+	    ptl->general_profile_compatibility_flag[4] ||
+	    ptl->general_profile_idc == 5 ||
+	    ptl->general_profile_compatibility_flag[5] ||
+	    ptl->general_profile_idc == 6 ||
+	    ptl->general_profile_compatibility_flag[6] ||
+	    ptl->general_profile_idc == 7 ||
+	    ptl->general_profile_compatibility_flag[7] ||
+	    ptl->general_profile_idc == 8 ||
+	    ptl->general_profile_compatibility_flag[8] ||
+	    ptl->general_profile_idc == 9 ||
+	    ptl->general_profile_compatibility_flag[9] ||
+	    ptl->general_profile_idc == 10 ||
+	    ptl->general_profile_compatibility_flag[10]) {
+		rbsp_bit(rbsp, &ptl->general_max_12bit_constraint_flag);
+		rbsp_bit(rbsp, &ptl->general_max_10bit_constraint_flag);
+		rbsp_bit(rbsp, &ptl->general_max_8bit_constraint_flag);
+		rbsp_bit(rbsp, &ptl->general_max_422chroma_constraint_flag);
+		rbsp_bit(rbsp, &ptl->general_max_420chroma_constraint_flag);
+		rbsp_bit(rbsp, &ptl->general_max_monochrome_constraint_flag);
+		rbsp_bit(rbsp, &ptl->general_intra_constraint_flag);
+		rbsp_bit(rbsp, &ptl->general_one_picture_only_constraint_flag);
+		rbsp_bit(rbsp, &ptl->general_lower_bit_rate_constraint_flag);
+		if (ptl->general_profile_idc == 5 ||
+		    ptl->general_profile_compatibility_flag[5] ||
+		    ptl->general_profile_idc == 9 ||
+		    ptl->general_profile_compatibility_flag[9] ||
+		    ptl->general_profile_idc == 10 ||
+		    ptl->general_profile_compatibility_flag[10]) {
+			rbsp_bit(rbsp, &ptl->general_max_14bit_constraint_flag);
+			rbsp_bits(rbsp, 32, &ptl->general_reserved_zero_33bits);
+			rbsp_bits(rbsp, 33 - 32, &ptl->general_reserved_zero_33bits);
+		} else {
+			rbsp_bits(rbsp, 32, &ptl->general_reserved_zero_34bits);
+			rbsp_bits(rbsp, 34 - 2, &ptl->general_reserved_zero_34bits);
+		}
+	} else if (ptl->general_profile_idc == 2 ||
+		   ptl->general_profile_compatibility_flag[2]) {
+		rbsp_bits(rbsp, 7, &ptl->general_reserved_zero_7bits);
+		rbsp_bit(rbsp, &ptl->general_one_picture_only_constraint_flag);
+		rbsp_bits(rbsp, 32, &ptl->general_reserved_zero_35bits);
+		rbsp_bits(rbsp, 35 - 32, &ptl->general_reserved_zero_35bits);
+	} else {
+		rbsp_bits(rbsp, 32, &ptl->general_reserved_zero_43bits);
+		rbsp_bits(rbsp, 43 - 32, &ptl->general_reserved_zero_43bits);
+	}
+	if ((ptl->general_profile_idc >= 1 && ptl->general_profile_idc <= 5) ||
+	    ptl->general_profile_idc == 9 ||
+	    ptl->general_profile_compatibility_flag[1] ||
+	    ptl->general_profile_compatibility_flag[2] ||
+	    ptl->general_profile_compatibility_flag[3] ||
+	    ptl->general_profile_compatibility_flag[4] ||
+	    ptl->general_profile_compatibility_flag[5] ||
+	    ptl->general_profile_compatibility_flag[9])
+		rbsp_bit(rbsp, &ptl->general_inbld_flag);
+	else
+		rbsp_bit(rbsp, &ptl->general_reserved_zero_bit);
+	rbsp_bits(rbsp, 8, &ptl->general_level_idc);
+	if (max_num_sub_layers_minus_1 > 0)
+		rbsp_unsupported(rbsp);
+}
+
+static void nal_hevc_rbsp_vps(struct rbsp *rbsp, struct nal_hevc_vps *vps)
+{
+	unsigned int i, j;
+	unsigned int reserved_0xffff_16bits = 0xffff;
+
+	rbsp_bits(rbsp, 4, &vps->video_parameter_set_id);
+	rbsp_bit(rbsp, &vps->base_layer_internal_flag);
+	rbsp_bit(rbsp, &vps->base_layer_available_flag);
+	rbsp_bits(rbsp, 6, &vps->max_layers_minus1);
+	rbsp_bits(rbsp, 3, &vps->max_sub_layers_minus1);
+	rbsp_bits(rbsp, 1, &vps->temporal_id_nesting_flag);
+	rbsp_bits(rbsp, 16, &reserved_0xffff_16bits);
+	nal_hevc_rbsp_profile_tier_level(rbsp, &vps->profile_tier_level);
+	rbsp_bit(rbsp, &vps->sub_layer_ordering_info_present_flag);
+	for (i = vps->sub_layer_ordering_info_present_flag ? 0 : vps->max_sub_layers_minus1;
+	     i <= vps->max_sub_layers_minus1; i++) {
+		rbsp_uev(rbsp, &vps->max_dec_pic_buffering_minus1[i]);
+		rbsp_uev(rbsp, &vps->max_num_reorder_pics[i]);
+		rbsp_uev(rbsp, &vps->max_latency_increase_plus1[i]);
+	}
+	rbsp_bits(rbsp, 6, &vps->max_layer_id);
+	rbsp_uev(rbsp, &vps->num_layer_sets_minus1);
+	for (i = 0; i <= vps->num_layer_sets_minus1; i++)
+		for (j = 0; j <= vps->max_layer_id; j++)
+			rbsp_bit(rbsp, &vps->layer_id_included_flag[i][j]);
+	rbsp_bit(rbsp, &vps->timing_info_present_flag);
+	if (vps->timing_info_present_flag)
+		rbsp_unsupported(rbsp);
+	rbsp_bit(rbsp, &vps->extension_flag);
+	if (vps->extension_flag)
+		rbsp_unsupported(rbsp);
+}
+
+static void nal_hevc_rbsp_sps(struct rbsp *rbsp, struct nal_hevc_sps *sps)
+{
+	unsigned int i;
+
+	rbsp_bits(rbsp, 4, &sps->video_parameter_set_id);
+	rbsp_bits(rbsp, 3, &sps->max_sub_layers_minus1);
+	rbsp_bit(rbsp, &sps->temporal_id_nesting_flag);
+	nal_hevc_rbsp_profile_tier_level(rbsp, &sps->profile_tier_level);
+	rbsp_uev(rbsp, &sps->seq_parameter_set_id);
+
+	rbsp_uev(rbsp, &sps->chroma_format_idc);
+	if (sps->chroma_format_idc == 3)
+		rbsp_bit(rbsp, &sps->separate_colour_plane_flag);
+	rbsp_uev(rbsp, &sps->pic_width_in_luma_samples);
+	rbsp_uev(rbsp, &sps->pic_height_in_luma_samples);
+	rbsp_bit(rbsp, &sps->conformance_window_flag);
+	if (sps->conformance_window_flag) {
+		rbsp_uev(rbsp, &sps->conf_win_left_offset);
+		rbsp_uev(rbsp, &sps->conf_win_right_offset);
+		rbsp_uev(rbsp, &sps->conf_win_top_offset);
+		rbsp_uev(rbsp, &sps->conf_win_bottom_offset);
+	}
+	rbsp_uev(rbsp, &sps->bit_depth_luma_minus8);
+	rbsp_uev(rbsp, &sps->bit_depth_chroma_minus8);
+
+	rbsp_uev(rbsp, &sps->log2_max_pic_order_cnt_lsb_minus4);
+
+	rbsp_bit(rbsp, &sps->sub_layer_ordering_info_present_flag);
+	for (i = (sps->sub_layer_ordering_info_present_flag ? 0 : sps->max_sub_layers_minus1);
+	     i <= sps->max_sub_layers_minus1; i++) {
+		rbsp_uev(rbsp, &sps->max_dec_pic_buffering_minus1[i]);
+		rbsp_uev(rbsp, &sps->max_num_reorder_pics[i]);
+		rbsp_uev(rbsp, &sps->max_latency_increase_plus1[i]);
+	}
+	rbsp_uev(rbsp, &sps->log2_min_luma_coding_block_size_minus3);
+	rbsp_uev(rbsp, &sps->log2_diff_max_min_luma_coding_block_size);
+	rbsp_uev(rbsp, &sps->log2_min_luma_transform_block_size_minus2);
+	rbsp_uev(rbsp, &sps->log2_diff_max_min_luma_transform_block_size);
+	rbsp_uev(rbsp, &sps->max_transform_hierarchy_depth_inter);
+	rbsp_uev(rbsp, &sps->max_transform_hierarchy_depth_intra);
+
+	rbsp_bit(rbsp, &sps->scaling_list_enabled_flag);
+	if (sps->scaling_list_enabled_flag)
+		rbsp_unsupported(rbsp);
+
+	rbsp_bit(rbsp, &sps->amp_enabled_flag);
+	rbsp_bit(rbsp, &sps->sample_adaptive_offset_enabled_flag);
+	rbsp_bit(rbsp, &sps->pcm_enabled_flag);
+	if (sps->pcm_enabled_flag) {
+		rbsp_bits(rbsp, 4, &sps->pcm_sample_bit_depth_luma_minus1);
+		rbsp_bits(rbsp, 4, &sps->pcm_sample_bit_depth_chroma_minus1);
+		rbsp_uev(rbsp, &sps->log2_min_pcm_luma_coding_block_size_minus3);
+		rbsp_uev(rbsp, &sps->log2_diff_max_min_pcm_luma_coding_block_size);
+		rbsp_bit(rbsp, &sps->pcm_loop_filter_disabled_flag);
+	}
+
+	rbsp_uev(rbsp, &sps->num_short_term_ref_pic_sets);
+	if (sps->num_short_term_ref_pic_sets > 0)
+		rbsp_unsupported(rbsp);
+
+	rbsp_bit(rbsp, &sps->long_term_ref_pics_present_flag);
+	if (sps->long_term_ref_pics_present_flag)
+		rbsp_unsupported(rbsp);
+
+	rbsp_bit(rbsp, &sps->sps_temporal_mvp_enabled_flag);
+	rbsp_bit(rbsp, &sps->strong_intra_smoothing_enabled_flag);
+	rbsp_bit(rbsp, &sps->vui_parameters_present_flag);
+	if (sps->vui_parameters_present_flag)
+		rbsp_unsupported(rbsp);
+
+	rbsp_bit(rbsp, &sps->extension_present_flag);
+	if (sps->extension_present_flag) {
+		rbsp_bit(rbsp, &sps->sps_range_extension_flag);
+		rbsp_bit(rbsp, &sps->sps_multilayer_extension_flag);
+		rbsp_bit(rbsp, &sps->sps_3d_extension_flag);
+		rbsp_bit(rbsp, &sps->sps_scc_extension_flag);
+		rbsp_bits(rbsp, 5, &sps->sps_extension_4bits);
+	}
+	if (sps->sps_range_extension_flag)
+		rbsp_unsupported(rbsp);
+	if (sps->sps_multilayer_extension_flag)
+		rbsp_unsupported(rbsp);
+	if (sps->sps_3d_extension_flag)
+		rbsp_unsupported(rbsp);
+	if (sps->sps_scc_extension_flag)
+		rbsp_unsupported(rbsp);
+	if (sps->sps_extension_4bits)
+		rbsp_unsupported(rbsp);
+}
+
+static void nal_hevc_rbsp_pps(struct rbsp *rbsp, struct nal_hevc_pps *pps)
+{
+	unsigned int i;
+
+	rbsp_uev(rbsp, &pps->pps_pic_parameter_set_id);
+	rbsp_uev(rbsp, &pps->pps_seq_parameter_set_id);
+	rbsp_bit(rbsp, &pps->dependent_slice_segments_enabled_flag);
+	rbsp_bit(rbsp, &pps->output_flag_present_flag);
+	rbsp_bits(rbsp, 3, &pps->num_extra_slice_header_bits);
+	rbsp_bit(rbsp, &pps->sign_data_hiding_enabled_flag);
+	rbsp_bit(rbsp, &pps->cabac_init_present_flag);
+	rbsp_uev(rbsp, &pps->num_ref_idx_l0_default_active_minus1);
+	rbsp_uev(rbsp, &pps->num_ref_idx_l1_default_active_minus1);
+	rbsp_sev(rbsp, &pps->init_qp_minus26);
+	rbsp_bit(rbsp, &pps->constrained_intra_pred_flag);
+	rbsp_bit(rbsp, &pps->transform_skip_enabled_flag);
+	rbsp_bit(rbsp, &pps->cu_qp_delta_enabled_flag);
+	if (pps->cu_qp_delta_enabled_flag)
+		rbsp_uev(rbsp, &pps->diff_cu_qp_delta_depth);
+	rbsp_sev(rbsp, &pps->pps_cb_qp_offset);
+	rbsp_sev(rbsp, &pps->pps_cr_qp_offset);
+	rbsp_bit(rbsp, &pps->pps_slice_chroma_qp_offsets_present_flag);
+	rbsp_bit(rbsp, &pps->weighted_pred_flag);
+	rbsp_bit(rbsp, &pps->weighted_bipred_flag);
+	rbsp_bit(rbsp, &pps->transquant_bypass_enabled_flag);
+	rbsp_bit(rbsp, &pps->tiles_enabled_flag);
+	rbsp_bit(rbsp, &pps->entropy_coding_sync_enabled_flag);
+	if (pps->tiles_enabled_flag) {
+		rbsp_uev(rbsp, &pps->num_tile_columns_minus1);
+		rbsp_uev(rbsp, &pps->num_tile_rows_minus1);
+		rbsp_bit(rbsp, &pps->uniform_spacing_flag);
+		if (!pps->uniform_spacing_flag) {
+			for (i = 0; i < pps->num_tile_columns_minus1; i++)
+				rbsp_uev(rbsp, &pps->column_width_minus1[i]);
+			for (i = 0; i < pps->num_tile_rows_minus1; i++)
+				rbsp_uev(rbsp, &pps->row_height_minus1[i]);
+		}
+		rbsp_bit(rbsp, &pps->loop_filter_across_tiles_enabled_flag);
+	}
+	rbsp_bit(rbsp, &pps->pps_loop_filter_across_slices_enabled_flag);
+	rbsp_bit(rbsp, &pps->deblocking_filter_control_present_flag);
+	if (pps->deblocking_filter_control_present_flag) {
+		rbsp_bit(rbsp, &pps->deblocking_filter_override_enabled_flag);
+		rbsp_bit(rbsp, &pps->pps_deblocking_filter_disabled_flag);
+		if (!pps->pps_deblocking_filter_disabled_flag) {
+			rbsp_sev(rbsp, &pps->pps_beta_offset_div2);
+			rbsp_sev(rbsp, &pps->pps_tc_offset_div2);
+		}
+	}
+	rbsp_bit(rbsp, &pps->pps_scaling_list_data_present_flag);
+	if (pps->pps_scaling_list_data_present_flag)
+		rbsp_unsupported(rbsp);
+	rbsp_bit(rbsp, &pps->lists_modification_present_flag);
+	rbsp_uev(rbsp, &pps->log2_parallel_merge_level_minus2);
+	rbsp_bit(rbsp, &pps->slice_segment_header_extension_present_flag);
+	rbsp_bit(rbsp, &pps->pps_extension_present_flag);
+	if (pps->pps_extension_present_flag) {
+		rbsp_bit(rbsp, &pps->pps_range_extension_flag);
+		rbsp_bit(rbsp, &pps->pps_multilayer_extension_flag);
+		rbsp_bit(rbsp, &pps->pps_3d_extension_flag);
+		rbsp_bit(rbsp, &pps->pps_scc_extension_flag);
+		rbsp_bits(rbsp, 4, &pps->pps_extension_4bits);
+	}
+	if (pps->pps_range_extension_flag)
+		rbsp_unsupported(rbsp);
+	if (pps->pps_multilayer_extension_flag)
+		rbsp_unsupported(rbsp);
+	if (pps->pps_3d_extension_flag)
+		rbsp_unsupported(rbsp);
+	if (pps->pps_scc_extension_flag)
+		rbsp_unsupported(rbsp);
+	if (pps->pps_extension_4bits)
+		rbsp_unsupported(rbsp);
+}
+
+/**
+ * nal_hevc_write_vps() - Write PPS NAL unit into RBSP format
+ * @dev: device pointer
+ * @dest: the buffer that is filled with RBSP data
+ * @n: maximum size of @dest in bytes
+ * @pps: &struct nal_hevc_vps to convert to RBSP
+ *
+ * Convert @vps to RBSP data and write it into @dest.
+ *
+ * The size of the VPS NAL unit is not known in advance and this function will
+ * fail, if @dest does not hold sufficient space for the VPS NAL unit.
+ *
+ * Return: number of bytes written to @dest or negative error code
+ */
+ssize_t nal_hevc_write_vps(const struct device *dev,
+			   void *dest, size_t n, struct nal_hevc_vps *vps)
+{
+	struct rbsp rbsp;
+	unsigned int forbidden_zero_bit = 0;
+	unsigned int nal_unit_type = VPS_NUT;
+	unsigned int nuh_layer_id = 0;
+	unsigned int nuh_temporal_id_plus1 = 1;
+
+	if (!dest)
+		return -EINVAL;
+
+	rbsp_init(&rbsp, dest, n, &write);
+
+	nal_hevc_write_start_code_prefix(&rbsp);
+
+	/* NAL unit header */
+	rbsp_bit(&rbsp, &forbidden_zero_bit);
+	rbsp_bits(&rbsp, 6, &nal_unit_type);
+	rbsp_bits(&rbsp, 6, &nuh_layer_id);
+	rbsp_bits(&rbsp, 3, &nuh_temporal_id_plus1);
+
+	nal_hevc_rbsp_vps(&rbsp, vps);
+
+	rbsp_trailing_bits(&rbsp);
+
+	if (rbsp.error)
+		return rbsp.error;
+
+	return DIV_ROUND_UP(rbsp.pos, 8);
+}
+EXPORT_SYMBOL_GPL(nal_hevc_write_vps);
+
+/**
+ * nal_hevc_read_vps() - Read VPS NAL unit from RBSP format
+ * @dev: device pointer
+ * @vps: the &struct nal_hevc_vps to fill from the RBSP data
+ * @src: the buffer that contains the RBSP data
+ * @n: size of @src in bytes
+ *
+ * Read RBSP data from @src and use it to fill @vps.
+ *
+ * Return: number of bytes read from @src or negative error code
+ */
+ssize_t nal_hevc_read_vps(const struct device *dev,
+			  struct nal_hevc_vps *vps, void *src, size_t n)
+{
+	struct rbsp rbsp;
+	unsigned int forbidden_zero_bit;
+	unsigned int nal_unit_type;
+	unsigned int nuh_layer_id;
+	unsigned int nuh_temporal_id_plus1;
+
+	if (!src)
+		return -EINVAL;
+
+	rbsp_init(&rbsp, src, n, &read);
+
+	nal_hevc_read_start_code_prefix(&rbsp);
+
+	rbsp_bit(&rbsp, &forbidden_zero_bit);
+	rbsp_bits(&rbsp, 6, &nal_unit_type);
+	rbsp_bits(&rbsp, 6, &nuh_layer_id);
+	rbsp_bits(&rbsp, 3, &nuh_temporal_id_plus1);
+
+	if (rbsp.error ||
+	    forbidden_zero_bit != 0 ||
+	    nal_unit_type != VPS_NUT)
+		return -EINVAL;
+
+	nal_hevc_rbsp_vps(&rbsp, vps);
+
+	rbsp_trailing_bits(&rbsp);
+
+	if (rbsp.error)
+		return rbsp.error;
+
+	return DIV_ROUND_UP(rbsp.pos, 8);
+}
+EXPORT_SYMBOL_GPL(nal_hevc_read_vps);
+
+/**
+ * nal_hevc_write_sps() - Write SPS NAL unit into RBSP format
+ * @dev: device pointer
+ * @dest: the buffer that is filled with RBSP data
+ * @n: maximum size of @dest in bytes
+ * @sps: &struct nal_hevc_sps to convert to RBSP
+ *
+ * Convert @sps to RBSP data and write it into @dest.
+ *
+ * The size of the SPS NAL unit is not known in advance and this function will
+ * fail, if @dest does not hold sufficient space for the SPS NAL unit.
+ *
+ * Return: number of bytes written to @dest or negative error code
+ */
+ssize_t nal_hevc_write_sps(const struct device *dev,
+			   void *dest, size_t n, struct nal_hevc_sps *sps)
+{
+	struct rbsp rbsp;
+	unsigned int forbidden_zero_bit = 0;
+	unsigned int nal_unit_type = SPS_NUT;
+	unsigned int nuh_layer_id = 0;
+	unsigned int nuh_temporal_id_plus1 = 1;
+
+	if (!dest)
+		return -EINVAL;
+
+	rbsp_init(&rbsp, dest, n, &write);
+
+	nal_hevc_write_start_code_prefix(&rbsp);
+
+	/* NAL unit header */
+	rbsp_bit(&rbsp, &forbidden_zero_bit);
+	rbsp_bits(&rbsp, 6, &nal_unit_type);
+	rbsp_bits(&rbsp, 6, &nuh_layer_id);
+	rbsp_bits(&rbsp, 3, &nuh_temporal_id_plus1);
+
+	nal_hevc_rbsp_sps(&rbsp, sps);
+
+	rbsp_trailing_bits(&rbsp);
+
+	if (rbsp.error)
+		return rbsp.error;
+
+	return DIV_ROUND_UP(rbsp.pos, 8);
+}
+EXPORT_SYMBOL_GPL(nal_hevc_write_sps);
+
+/**
+ * nal_hevc_read_sps() - Read SPS NAL unit from RBSP format
+ * @dev: device pointer
+ * @sps: the &struct nal_hevc_sps to fill from the RBSP data
+ * @src: the buffer that contains the RBSP data
+ * @n: size of @src in bytes
+ *
+ * Read RBSP data from @src and use it to fill @sps.
+ *
+ * Return: number of bytes read from @src or negative error code
+ */
+ssize_t nal_hevc_read_sps(const struct device *dev,
+			  struct nal_hevc_sps *sps, void *src, size_t n)
+{
+	struct rbsp rbsp;
+	unsigned int forbidden_zero_bit;
+	unsigned int nal_unit_type;
+	unsigned int nuh_layer_id;
+	unsigned int nuh_temporal_id_plus1;
+
+	if (!src)
+		return -EINVAL;
+
+	rbsp_init(&rbsp, src, n, &read);
+
+	nal_hevc_read_start_code_prefix(&rbsp);
+
+	rbsp_bit(&rbsp, &forbidden_zero_bit);
+	rbsp_bits(&rbsp, 6, &nal_unit_type);
+	rbsp_bits(&rbsp, 6, &nuh_layer_id);
+	rbsp_bits(&rbsp, 3, &nuh_temporal_id_plus1);
+
+	if (rbsp.error ||
+	    forbidden_zero_bit != 0 ||
+	    nal_unit_type != SPS_NUT)
+		return -EINVAL;
+
+	nal_hevc_rbsp_sps(&rbsp, sps);
+
+	rbsp_trailing_bits(&rbsp);
+
+	if (rbsp.error)
+		return rbsp.error;
+
+	return DIV_ROUND_UP(rbsp.pos, 8);
+}
+EXPORT_SYMBOL_GPL(nal_hevc_read_sps);
+
+/**
+ * nal_hevc_write_pps() - Write PPS NAL unit into RBSP format
+ * @dev: device pointer
+ * @dest: the buffer that is filled with RBSP data
+ * @n: maximum size of @dest in bytes
+ * @pps: &struct nal_hevc_pps to convert to RBSP
+ *
+ * Convert @pps to RBSP data and write it into @dest.
+ *
+ * The size of the PPS NAL unit is not known in advance and this function will
+ * fail, if @dest does not hold sufficient space for the PPS NAL unit.
+ *
+ * Return: number of bytes written to @dest or negative error code
+ */
+ssize_t nal_hevc_write_pps(const struct device *dev,
+			   void *dest, size_t n, struct nal_hevc_pps *pps)
+{
+	struct rbsp rbsp;
+	unsigned int forbidden_zero_bit = 0;
+	unsigned int nal_unit_type = PPS_NUT;
+	unsigned int nuh_layer_id = 0;
+	unsigned int nuh_temporal_id_plus1 = 1;
+
+	if (!dest)
+		return -EINVAL;
+
+	rbsp_init(&rbsp, dest, n, &write);
+
+	nal_hevc_write_start_code_prefix(&rbsp);
+
+	/* NAL unit header */
+	rbsp_bit(&rbsp, &forbidden_zero_bit);
+	rbsp_bits(&rbsp, 6, &nal_unit_type);
+	rbsp_bits(&rbsp, 6, &nuh_layer_id);
+	rbsp_bits(&rbsp, 3, &nuh_temporal_id_plus1);
+
+	nal_hevc_rbsp_pps(&rbsp, pps);
+
+	rbsp_trailing_bits(&rbsp);
+
+	if (rbsp.error)
+		return rbsp.error;
+
+	return DIV_ROUND_UP(rbsp.pos, 8);
+}
+EXPORT_SYMBOL_GPL(nal_hevc_write_pps);
+
+/**
+ * nal_hevc_read_pps() - Read PPS NAL unit from RBSP format
+ * @dev: device pointer
+ * @pps: the &struct nal_hevc_pps to fill from the RBSP data
+ * @src: the buffer that contains the RBSP data
+ * @n: size of @src in bytes
+ *
+ * Read RBSP data from @src and use it to fill @pps.
+ *
+ * Return: number of bytes read from @src or negative error code
+ */
+ssize_t nal_hevc_read_pps(const struct device *dev,
+			  struct nal_hevc_pps *pps, void *src, size_t n)
+{
+	struct rbsp rbsp;
+	unsigned int forbidden_zero_bit;
+	unsigned int nal_unit_type;
+	unsigned int nuh_layer_id;
+	unsigned int nuh_temporal_id_plus1;
+
+	if (!src)
+		return -EINVAL;
+
+	rbsp_init(&rbsp, src, n, &read);
+
+	nal_hevc_read_start_code_prefix(&rbsp);
+
+	/* NAL unit header */
+	rbsp_bit(&rbsp, &forbidden_zero_bit);
+	rbsp_bits(&rbsp, 6, &nal_unit_type);
+	rbsp_bits(&rbsp, 6, &nuh_layer_id);
+	rbsp_bits(&rbsp, 3, &nuh_temporal_id_plus1);
+
+	nal_hevc_rbsp_pps(&rbsp, pps);
+
+	rbsp_trailing_bits(&rbsp);
+
+	if (rbsp.error)
+		return rbsp.error;
+
+	return DIV_ROUND_UP(rbsp.pos, 8);
+}
+EXPORT_SYMBOL_GPL(nal_hevc_read_pps);
+
+/**
+ * nal_hevc_write_filler() - Write filler data RBSP
+ * @dev: device pointer
+ * @dest: buffer to fill with filler data
+ * @n: size of the buffer to fill with filler data
+ *
+ * Write a filler data RBSP to @dest with a size of @n bytes and return the
+ * number of written filler data bytes.
+ *
+ * Use this function to generate dummy data in an RBSP data stream that can be
+ * safely ignored by hevc decoders.
+ *
+ * The RBSP format of the filler data is specified in Rec. ITU-T H.265
+ * (02/2018) 7.3.2.8 Filler data RBSP syntax.
+ *
+ * Return: number of filler data bytes (including marker) or negative error
+ */
+ssize_t nal_hevc_write_filler(const struct device *dev, void *dest, size_t n)
+{
+	struct rbsp rbsp;
+	unsigned int forbidden_zero_bit = 0;
+	unsigned int nal_unit_type = FD_NUT;
+	unsigned int nuh_layer_id = 0;
+	unsigned int nuh_temporal_id_plus1 = 1;
+
+	if (!dest)
+		return -EINVAL;
+
+	rbsp_init(&rbsp, dest, n, &write);
+
+	nal_hevc_write_start_code_prefix(&rbsp);
+
+	rbsp_bit(&rbsp, &forbidden_zero_bit);
+	rbsp_bits(&rbsp, 6, &nal_unit_type);
+	rbsp_bits(&rbsp, 6, &nuh_layer_id);
+	rbsp_bits(&rbsp, 3, &nuh_temporal_id_plus1);
+
+	nal_hevc_write_filler_data(&rbsp);
+	rbsp_trailing_bits(&rbsp);
+
+	if (rbsp.error)
+		return rbsp.error;
+
+	return DIV_ROUND_UP(rbsp.pos, 8);
+}
+EXPORT_SYMBOL_GPL(nal_hevc_write_filler);
+
+/**
+ * nal_hevc_read_filler() - Read filler data RBSP
+ * @dev: device pointer
+ * @src: buffer with RBSP data that is read
+ * @n: maximum size of src that shall be read
+ *
+ * Read a filler data RBSP from @src up to a maximum size of @n bytes and
+ * return the size of the filler data in bytes including the marker.
+ *
+ * This function is used to parse filler data and skip the respective bytes in
+ * the RBSP data.
+ *
+ * The RBSP format of the filler data is specified in Rec. ITU-T H.265
+ * (02/2018) 7.3.2.8 Filler data RBSP syntax.
+ *
+ * Return: number of filler data bytes (including marker) or negative error
+ */
+ssize_t nal_hevc_read_filler(const struct device *dev, void *src, size_t n)
+{
+	struct rbsp rbsp;
+	unsigned int forbidden_zero_bit;
+	unsigned int nal_unit_type;
+	unsigned int nuh_layer_id;
+	unsigned int nuh_temporal_id_plus1;
+
+	if (!src)
+		return -EINVAL;
+
+	rbsp_init(&rbsp, src, n, &read);
+
+	nal_hevc_read_start_code_prefix(&rbsp);
+
+	rbsp_bit(&rbsp, &forbidden_zero_bit);
+	rbsp_bits(&rbsp, 6, &nal_unit_type);
+	rbsp_bits(&rbsp, 6, &nuh_layer_id);
+	rbsp_bits(&rbsp, 3, &nuh_temporal_id_plus1);
+
+	if (rbsp.error)
+		return rbsp.error;
+	if (forbidden_zero_bit != 0 ||
+	    nal_unit_type != FD_NUT)
+		return -EINVAL;
+
+	nal_hevc_read_filler_data(&rbsp);
+	rbsp_trailing_bits(&rbsp);
+
+	if (rbsp.error)
+		return rbsp.error;
+
+	return DIV_ROUND_UP(rbsp.pos, 8);
+}
+EXPORT_SYMBOL_GPL(nal_hevc_read_filler);
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/media/platform/allegro-dvt/nal-hevc.h
new file mode 100644
index 000000000000..fc994d4242d8
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/nal-hevc.h
@@ -0,0 +1,350 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 Pengutronix, Michael Tretter <kernel@pengutronix.de>
+ *
+ * Convert NAL units between raw byte sequence payloads (RBSP) and C structs.
+ */
+
+#ifndef __NAL_HEVC_H__
+#define __NAL_HEVC_H__
+
+#include <linux/kernel.h>
+#include <linux/types.h>
+#include <media/v4l2-ctrls.h>
+
+struct nal_hevc_profile_tier_level {
+	unsigned int general_profile_space;
+	unsigned int general_tier_flag;
+	unsigned int general_profile_idc;
+	unsigned int general_profile_compatibility_flag[32];
+	unsigned int general_progressive_source_flag;
+	unsigned int general_interlaced_source_flag;
+	unsigned int general_non_packed_constraint_flag;
+	unsigned int general_frame_only_constraint_flag;
+	union {
+		struct {
+			unsigned int general_max_12bit_constraint_flag;
+			unsigned int general_max_10bit_constraint_flag;
+			unsigned int general_max_8bit_constraint_flag;
+			unsigned int general_max_422chroma_constraint_flag;
+			unsigned int general_max_420chroma_constraint_flag;
+			unsigned int general_max_monochrome_constraint_flag;
+			unsigned int general_intra_constraint_flag;
+			unsigned int general_one_picture_only_constraint_flag;
+			unsigned int general_lower_bit_rate_constraint_flag;
+			union {
+				struct {
+					unsigned int general_max_14bit_constraint_flag;
+					unsigned int general_reserved_zero_33bits;
+				};
+				unsigned int general_reserved_zero_34bits;
+			};
+		};
+		struct {
+			unsigned int general_reserved_zero_7bits;
+			/* unsigned int general_one_picture_only_constraint_flag; */
+			unsigned int general_reserved_zero_35bits;
+		};
+		unsigned int general_reserved_zero_43bits;
+	};
+	union {
+		unsigned int general_inbld_flag;
+		unsigned int general_reserved_zero_bit;
+	};
+	unsigned int general_level_idc;
+};
+
+/**
+ * struct nal_hevc_vps - Video parameter set
+ *
+ * C struct representation of the video parameter set NAL unit as defined by
+ * Rec. ITU-T H.265 (02/2018) 7.3.2.1 Video parameter set RBSP syntax
+ */
+struct nal_hevc_vps {
+	unsigned int video_parameter_set_id;
+	unsigned int base_layer_internal_flag;
+	unsigned int base_layer_available_flag;
+	unsigned int max_layers_minus1;
+	unsigned int max_sub_layers_minus1;
+	unsigned int temporal_id_nesting_flag;
+	struct nal_hevc_profile_tier_level profile_tier_level;
+	unsigned int sub_layer_ordering_info_present_flag;
+	struct {
+		unsigned int max_dec_pic_buffering_minus1[7];
+		unsigned int max_num_reorder_pics[7];
+		unsigned int max_latency_increase_plus1[7];
+	};
+	unsigned int max_layer_id;
+	unsigned int num_layer_sets_minus1;
+	unsigned int layer_id_included_flag[1024][64];
+	unsigned int timing_info_present_flag;
+	struct {
+		unsigned int num_units_in_tick;
+		unsigned int time_scale;
+		unsigned int poc_proportional_to_timing_flag;
+		unsigned int num_ticks_poc_diff_one_minus1;
+		unsigned int num_hrd_parameters;
+		struct {
+			unsigned int hrd_layer_set_idx[0];
+			unsigned int cprms_present_flag[0];
+		};
+		/* hrd_parameters( cprms_present_flag[ i ], max_sub_layers_minus1 ) */
+	};
+	unsigned int extension_flag;
+	unsigned int extension_data_flag;
+};
+
+struct nal_hevc_sub_layer_hrd_parameters {
+	unsigned int bit_rate_value_minus1[1];
+	unsigned int cpb_size_value_minus1[1];
+	unsigned int cbr_flag[1];
+};
+
+struct nal_hevc_hrd_parameters {
+	unsigned int nal_hrd_parameters_present_flag;
+	unsigned int vcl_hrd_parameters_present_flag;
+	struct {
+		unsigned int sub_pic_hrd_params_present_flag;
+		struct {
+			unsigned int tick_divisor_minus2;
+			unsigned int du_cpb_removal_delay_increment_length_minus1;
+			unsigned int sub_pic_cpb_params_in_pic_timing_sei_flag;
+			unsigned int dpb_output_delay_du_length_minus1;
+		};
+		unsigned int bit_rate_scale;
+		unsigned int cpb_size_scale;
+		unsigned int cpb_size_du_scale;
+		unsigned int initial_cpb_removal_delay_length_minus1;
+		unsigned int au_cpb_removal_delay_length_minus1;
+		unsigned int dpb_output_delay_length_minus1;
+	};
+	struct {
+		unsigned int fixed_pic_rate_general_flag[1];
+		unsigned int fixed_pic_rate_within_cvs_flag[1];
+		unsigned int elemental_duration_in_tc_minus1[1];
+		unsigned int low_delay_hrd_flag[1];
+		unsigned int cpb_cnt_minus1[1];
+		struct nal_hevc_sub_layer_hrd_parameters nal_hrd[1];
+		struct nal_hevc_sub_layer_hrd_parameters vcl_hrd[1];
+	};
+};
+
+/**
+ * struct nal_hevc_vui_parameters - VUI parameters
+ *
+ * C struct representation of the VUI parameters as defined by Rec. ITU-T
+ * H.265 (02/2018) E.2.1 VUI parameters syntax.
+ */
+struct nal_hevc_vui_parameters {
+	unsigned int aspect_ratio_info_present_flag;
+	struct {
+		unsigned int aspect_ratio_idc;
+		unsigned int sar_width;
+		unsigned int sar_height;
+	};
+	unsigned int overscan_info_present_flag;
+	unsigned int overscan_appropriate_flag;
+	unsigned int video_signal_type_present_flag;
+	struct {
+		unsigned int video_format;
+		unsigned int video_full_range_flag;
+		unsigned int colour_description_present_flag;
+		struct {
+			unsigned int colour_primaries;
+			unsigned int transfer_characteristics;
+			unsigned int matrix_coeffs;
+		};
+	};
+	unsigned int chroma_loc_info_present_flag;
+	struct {
+		unsigned int chroma_sample_loc_type_top_field;
+		unsigned int chroma_sample_loc_type_bottom_field;
+	};
+	unsigned int neutral_chroma_indication_flag;
+	unsigned int field_seq_flag;
+	unsigned int frame_field_info_present_flag;
+	unsigned int default_display_window_flag;
+	struct {
+		unsigned int def_disp_win_left_offset;
+		unsigned int def_disp_win_right_offset;
+		unsigned int def_disp_win_top_offset;
+		unsigned int def_disp_win_bottom_offset;
+	};
+	unsigned int vui_timing_info_present_flag;
+	struct {
+		unsigned int vui_num_units_in_tick;
+		unsigned int vui_time_scale;
+		unsigned int vui_poc_proportional_to_timing_flag;
+		unsigned int vui_num_ticks_poc_diff_one_minus1;
+		unsigned int vui_hrd_parameters_present_flag;
+		struct nal_hevc_hrd_parameters nal_hrd_parameters;
+	};
+	unsigned int bitstream_restriction_flag;
+	struct {
+		unsigned int tiles_fixed_structure_flag;
+		unsigned int motion_vectors_over_pic_boundaries_flag;
+		unsigned int restricted_ref_pic_lists_flag;
+		unsigned int min_spatial_segmentation_idc;
+		unsigned int max_bytes_per_pic_denom;
+		unsigned int max_bits_per_min_cu_denom;
+		unsigned int log2_max_mv_length_horizontal;
+		unsigned int log2_max_mv_length_vertical;
+	};
+};
+
+/**
+ * struct nal_hevc_sps - Sequence parameter set
+ *
+ * C struct representation of the video parameter set NAL unit as defined by
+ * Rec. ITU-T H.265 (02/2018) 7.3.2.2 Sequence parameter set RBSP syntax
+ */
+struct nal_hevc_sps {
+	unsigned int video_parameter_set_id;
+	unsigned int max_sub_layers_minus1;
+	unsigned int temporal_id_nesting_flag;
+	struct nal_hevc_profile_tier_level profile_tier_level;
+	unsigned int seq_parameter_set_id;
+	unsigned int chroma_format_idc;
+	unsigned int separate_colour_plane_flag;
+	unsigned int pic_width_in_luma_samples;
+	unsigned int pic_height_in_luma_samples;
+	unsigned int conformance_window_flag;
+	struct {
+		unsigned int conf_win_left_offset;
+		unsigned int conf_win_right_offset;
+		unsigned int conf_win_top_offset;
+		unsigned int conf_win_bottom_offset;
+	};
+
+	unsigned int bit_depth_luma_minus8;
+	unsigned int bit_depth_chroma_minus8;
+	unsigned int log2_max_pic_order_cnt_lsb_minus4;
+	unsigned int sub_layer_ordering_info_present_flag;
+	struct {
+		unsigned int max_dec_pic_buffering_minus1[7];
+		unsigned int max_num_reorder_pics[7];
+		unsigned int max_latency_increase_plus1[7];
+	};
+	unsigned int log2_min_luma_coding_block_size_minus3;
+	unsigned int log2_diff_max_min_luma_coding_block_size;
+	unsigned int log2_min_luma_transform_block_size_minus2;
+	unsigned int log2_diff_max_min_luma_transform_block_size;
+	unsigned int max_transform_hierarchy_depth_inter;
+	unsigned int max_transform_hierarchy_depth_intra;
+
+	unsigned int scaling_list_enabled_flag;
+	unsigned int scaling_list_data_present_flag;
+	unsigned int amp_enabled_flag;
+	unsigned int sample_adaptive_offset_enabled_flag;
+	unsigned int pcm_enabled_flag;
+	struct {
+		unsigned int pcm_sample_bit_depth_luma_minus1;
+		unsigned int pcm_sample_bit_depth_chroma_minus1;
+		unsigned int log2_min_pcm_luma_coding_block_size_minus3;
+		unsigned int log2_diff_max_min_pcm_luma_coding_block_size;
+		unsigned int pcm_loop_filter_disabled_flag;
+	};
+
+	unsigned int num_short_term_ref_pic_sets;
+	unsigned int long_term_ref_pics_present_flag;
+	unsigned int sps_temporal_mvp_enabled_flag;
+	unsigned int strong_intra_smoothing_enabled_flag;
+	unsigned int vui_parameters_present_flag;
+	struct nal_hevc_vui_parameters vui;
+	unsigned int extension_present_flag;
+	struct {
+		unsigned int sps_range_extension_flag;
+		unsigned int sps_multilayer_extension_flag;
+		unsigned int sps_3d_extension_flag;
+		unsigned int sps_scc_extension_flag;
+		unsigned int sps_extension_4bits;
+	};
+};
+
+struct nal_hevc_pps {
+	unsigned int pps_pic_parameter_set_id;
+	unsigned int pps_seq_parameter_set_id;
+	unsigned int dependent_slice_segments_enabled_flag;
+	unsigned int output_flag_present_flag;
+	unsigned int num_extra_slice_header_bits;
+	unsigned int sign_data_hiding_enabled_flag;
+	unsigned int cabac_init_present_flag;
+	unsigned int num_ref_idx_l0_default_active_minus1;
+	unsigned int num_ref_idx_l1_default_active_minus1;
+	int init_qp_minus26;
+	unsigned int constrained_intra_pred_flag;
+	unsigned int transform_skip_enabled_flag;
+	unsigned int cu_qp_delta_enabled_flag;
+	unsigned int diff_cu_qp_delta_depth;
+	int pps_cb_qp_offset;
+	int pps_cr_qp_offset;
+	unsigned int pps_slice_chroma_qp_offsets_present_flag;
+	unsigned int weighted_pred_flag;
+	unsigned int weighted_bipred_flag;
+	unsigned int transquant_bypass_enabled_flag;
+	unsigned int tiles_enabled_flag;
+	unsigned int entropy_coding_sync_enabled_flag;
+	struct {
+		unsigned int num_tile_columns_minus1;
+		unsigned int num_tile_rows_minus1;
+		unsigned int uniform_spacing_flag;
+		struct {
+			unsigned int column_width_minus1[1];
+			unsigned int row_height_minus1[1];
+		};
+		unsigned int loop_filter_across_tiles_enabled_flag;
+	};
+	unsigned int pps_loop_filter_across_slices_enabled_flag;
+	unsigned int deblocking_filter_control_present_flag;
+	struct {
+		unsigned int deblocking_filter_override_enabled_flag;
+		unsigned int pps_deblocking_filter_disabled_flag;
+		struct {
+			int pps_beta_offset_div2;
+			int pps_tc_offset_div2;
+		};
+	};
+	unsigned int pps_scaling_list_data_present_flag;
+	unsigned int lists_modification_present_flag;
+	unsigned int log2_parallel_merge_level_minus2;
+	unsigned int slice_segment_header_extension_present_flag;
+	unsigned int pps_extension_present_flag;
+	struct {
+		unsigned int pps_range_extension_flag;
+		unsigned int pps_multilayer_extension_flag;
+		unsigned int pps_3d_extension_flag;
+		unsigned int pps_scc_extension_flag;
+		unsigned int pps_extension_4bits;
+	};
+};
+
+int nal_hevc_profile_from_v4l2(enum v4l2_mpeg_video_hevc_profile profile);
+int nal_hevc_tier_from_v4l2(enum v4l2_mpeg_video_hevc_tier tier);
+int nal_hevc_level_from_v4l2(enum v4l2_mpeg_video_hevc_level level);
+
+int nal_range_from_v4l2(enum v4l2_quantization quantization);
+int nal_color_primaries_from_v4l2(enum v4l2_colorspace colorspace);
+int nal_transfer_characteristics_from_v4l2(enum v4l2_colorspace colorspace,
+					   enum v4l2_xfer_func xfer_func);
+int nal_matrix_coeffs_from_v4l2(enum v4l2_colorspace colorspace,
+				enum v4l2_ycbcr_encoding ycbcr_encoding);
+
+ssize_t nal_hevc_write_vps(const struct device *dev,
+			   void *dest, size_t n, struct nal_hevc_vps *vps);
+ssize_t nal_hevc_read_vps(const struct device *dev,
+			  struct nal_hevc_vps *vps, void *src, size_t n);
+
+ssize_t nal_hevc_write_sps(const struct device *dev,
+			   void *dest, size_t n, struct nal_hevc_sps *sps);
+ssize_t nal_hevc_read_sps(const struct device *dev,
+			  struct nal_hevc_sps *sps, void *src, size_t n);
+
+ssize_t nal_hevc_write_pps(const struct device *dev,
+			   void *dest, size_t n, struct nal_hevc_pps *pps);
+ssize_t nal_hevc_read_pps(const struct device *dev,
+			  struct nal_hevc_pps *pps, void *src, size_t n);
+
+ssize_t nal_hevc_write_filler(const struct device *dev, void *dest, size_t n);
+ssize_t nal_hevc_read_filler(const struct device *dev, void *src, size_t n);
+
+#endif /* __NAL_HEVC_H__ */
-- 
2.20.1

