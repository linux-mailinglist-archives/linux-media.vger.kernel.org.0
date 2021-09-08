Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFC9E403A48
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 15:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351792AbhIHNFX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 09:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234530AbhIHNFJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 09:05:09 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1158DC061575
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 06:04:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF9-0005CF-Dn; Wed, 08 Sep 2021 15:03:59 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF8-0004Tn-Ln; Wed, 08 Sep 2021 15:03:58 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF5-00DpIr-KG; Wed, 08 Sep 2021 15:03:55 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     kernel@pengutronix.de, m.tretter@pengutronix.de
Subject: [PATCH 6/7] media: allegro: nal-hevc: implement generator for vui
Date:   Wed,  8 Sep 2021 15:03:54 +0200
Message-Id: <20210908130355.3295403-7-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210908130355.3295403-1-m.tretter@pengutronix.de>
References: <20210908130355.3295403-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The NAL unit generator for HEVC does not support the generation of vui
parameters. Implement it to allow drivers to set the vui parameters in
the coded video stream.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/allegro-dvt/nal-hevc.c | 132 +++++++++++++++++-
 1 file changed, 131 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.c b/drivers/media/platform/allegro-dvt/nal-hevc.c
index 0999a2bdc812..9cdf2756e0a3 100644
--- a/drivers/media/platform/allegro-dvt/nal-hevc.c
+++ b/drivers/media/platform/allegro-dvt/nal-hevc.c
@@ -207,6 +207,136 @@ static void nal_hevc_rbsp_vps(struct rbsp *rbsp, struct nal_hevc_vps *vps)
 		rbsp_unsupported(rbsp);
 }
 
+static void nal_hevc_rbsp_sub_layer_hrd_parameters(struct rbsp *rbsp,
+						   struct nal_hevc_sub_layer_hrd_parameters *hrd)
+{
+	unsigned int i;
+	unsigned int cpb_cnt = 1;
+
+	for (i = 0; i < cpb_cnt; i++) {
+		rbsp_uev(rbsp, &hrd->bit_rate_value_minus1[i]);
+		rbsp_uev(rbsp, &hrd->cpb_size_value_minus1[i]);
+		rbsp_bit(rbsp, &hrd->cbr_flag[i]);
+	}
+}
+
+static void nal_hevc_rbsp_hrd_parameters(struct rbsp *rbsp,
+					 struct nal_hevc_hrd_parameters *hrd)
+{
+	unsigned int i;
+	unsigned int max_num_sub_layers_minus_1 = 0;
+
+	rbsp_bit(rbsp, &hrd->nal_hrd_parameters_present_flag);
+	rbsp_bit(rbsp, &hrd->vcl_hrd_parameters_present_flag);
+	if (hrd->nal_hrd_parameters_present_flag || hrd->vcl_hrd_parameters_present_flag) {
+		rbsp_bit(rbsp, &hrd->sub_pic_hrd_params_present_flag);
+		if (hrd->sub_pic_hrd_params_present_flag) {
+			rbsp_bits(rbsp, 8, &hrd->tick_divisor_minus2);
+			rbsp_bits(rbsp, 5, &hrd->du_cpb_removal_delay_increment_length_minus1);
+			rbsp_bit(rbsp, &hrd->sub_pic_cpb_params_in_pic_timing_sei_flag);
+			rbsp_bits(rbsp, 5, &hrd->dpb_output_delay_du_length_minus1);
+		}
+		rbsp_bits(rbsp, 4, &hrd->bit_rate_scale);
+		rbsp_bits(rbsp, 4, &hrd->cpb_size_scale);
+		if (hrd->sub_pic_hrd_params_present_flag)
+			rbsp_bits(rbsp, 4, &hrd->cpb_size_du_scale);
+		rbsp_bits(rbsp, 5, &hrd->initial_cpb_removal_delay_length_minus1);
+		rbsp_bits(rbsp, 5, &hrd->au_cpb_removal_delay_length_minus1);
+		rbsp_bits(rbsp, 5, &hrd->dpb_output_delay_length_minus1);
+	}
+	for (i = 0; i <= max_num_sub_layers_minus_1; i++) {
+		rbsp_bit(rbsp, &hrd->fixed_pic_rate_general_flag[i]);
+		if (!hrd->fixed_pic_rate_general_flag[i])
+			rbsp_bit(rbsp, &hrd->fixed_pic_rate_within_cvs_flag[i]);
+		if (hrd->fixed_pic_rate_within_cvs_flag[i])
+			rbsp_uev(rbsp, &hrd->elemental_duration_in_tc_minus1[i]);
+		else
+			rbsp_bit(rbsp, &hrd->low_delay_hrd_flag[i]);
+		if (!hrd->low_delay_hrd_flag[i])
+			rbsp_uev(rbsp, &hrd->cpb_cnt_minus1[i]);
+		if (hrd->nal_hrd_parameters_present_flag)
+			nal_hevc_rbsp_sub_layer_hrd_parameters(rbsp, &hrd->vcl_hrd[i]);
+		if (hrd->vcl_hrd_parameters_present_flag)
+			nal_hevc_rbsp_sub_layer_hrd_parameters(rbsp, &hrd->vcl_hrd[i]);
+	}
+}
+
+static void nal_hevc_rbsp_vui_parameters(struct rbsp *rbsp,
+					 struct nal_hevc_vui_parameters *vui)
+{
+	if (!vui) {
+		rbsp->error = -EINVAL;
+		return;
+	}
+
+	rbsp_bit(rbsp, &vui->aspect_ratio_info_present_flag);
+	if (vui->aspect_ratio_info_present_flag) {
+		rbsp_bits(rbsp, 8, &vui->aspect_ratio_idc);
+		if (vui->aspect_ratio_idc == 255) {
+			rbsp_bits(rbsp, 16, &vui->sar_width);
+			rbsp_bits(rbsp, 16, &vui->sar_height);
+		}
+	}
+
+	rbsp_bit(rbsp, &vui->overscan_info_present_flag);
+	if (vui->overscan_info_present_flag)
+		rbsp_bit(rbsp, &vui->overscan_appropriate_flag);
+
+	rbsp_bit(rbsp, &vui->video_signal_type_present_flag);
+	if (vui->video_signal_type_present_flag) {
+		rbsp_bits(rbsp, 3, &vui->video_format);
+		rbsp_bit(rbsp, &vui->video_full_range_flag);
+
+		rbsp_bit(rbsp, &vui->colour_description_present_flag);
+		if (vui->colour_description_present_flag) {
+			rbsp_bits(rbsp, 8, &vui->colour_primaries);
+			rbsp_bits(rbsp, 8, &vui->transfer_characteristics);
+			rbsp_bits(rbsp, 8, &vui->matrix_coeffs);
+		}
+	}
+
+	rbsp_bit(rbsp, &vui->chroma_loc_info_present_flag);
+	if (vui->chroma_loc_info_present_flag) {
+		rbsp_uev(rbsp, &vui->chroma_sample_loc_type_top_field);
+		rbsp_uev(rbsp, &vui->chroma_sample_loc_type_bottom_field);
+	}
+
+	rbsp_bit(rbsp, &vui->neutral_chroma_indication_flag);
+	rbsp_bit(rbsp, &vui->field_seq_flag);
+	rbsp_bit(rbsp, &vui->frame_field_info_present_flag);
+	rbsp_bit(rbsp, &vui->default_display_window_flag);
+	if (vui->default_display_window_flag) {
+		rbsp_uev(rbsp, &vui->def_disp_win_left_offset);
+		rbsp_uev(rbsp, &vui->def_disp_win_right_offset);
+		rbsp_uev(rbsp, &vui->def_disp_win_top_offset);
+		rbsp_uev(rbsp, &vui->def_disp_win_bottom_offset);
+	}
+
+	rbsp_bit(rbsp, &vui->vui_timing_info_present_flag);
+	if (vui->vui_timing_info_present_flag) {
+		rbsp_bits(rbsp, 32, &vui->vui_num_units_in_tick);
+		rbsp_bits(rbsp, 32, &vui->vui_time_scale);
+		rbsp_bit(rbsp, &vui->vui_poc_proportional_to_timing_flag);
+		if (vui->vui_poc_proportional_to_timing_flag)
+			rbsp_uev(rbsp, &vui->vui_num_ticks_poc_diff_one_minus1);
+		rbsp_bit(rbsp, &vui->vui_hrd_parameters_present_flag);
+		if (vui->vui_hrd_parameters_present_flag)
+			nal_hevc_rbsp_hrd_parameters(rbsp, &vui->nal_hrd_parameters);
+	}
+
+	rbsp_bit(rbsp, &vui->bitstream_restriction_flag);
+	if (vui->bitstream_restriction_flag) {
+		rbsp_bit(rbsp, &vui->tiles_fixed_structure_flag);
+		rbsp_bit(rbsp, &vui->motion_vectors_over_pic_boundaries_flag);
+		rbsp_bit(rbsp, &vui->restricted_ref_pic_lists_flag);
+		rbsp_uev(rbsp, &vui->min_spatial_segmentation_idc);
+		rbsp_uev(rbsp, &vui->max_bytes_per_pic_denom);
+		rbsp_uev(rbsp, &vui->max_bits_per_min_cu_denom);
+		rbsp_uev(rbsp, &vui->log2_max_mv_length_horizontal);
+		rbsp_uev(rbsp, &vui->log2_max_mv_length_vertical);
+	}
+}
+
 static void nal_hevc_rbsp_sps(struct rbsp *rbsp, struct nal_hevc_sps *sps)
 {
 	unsigned int i;
@@ -275,7 +405,7 @@ static void nal_hevc_rbsp_sps(struct rbsp *rbsp, struct nal_hevc_sps *sps)
 	rbsp_bit(rbsp, &sps->strong_intra_smoothing_enabled_flag);
 	rbsp_bit(rbsp, &sps->vui_parameters_present_flag);
 	if (sps->vui_parameters_present_flag)
-		rbsp_unsupported(rbsp);
+		nal_hevc_rbsp_vui_parameters(rbsp, &sps->vui);
 
 	rbsp_bit(rbsp, &sps->extension_present_flag);
 	if (sps->extension_present_flag) {
-- 
2.30.2

