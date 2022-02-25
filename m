Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9FE94C4B28
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 17:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243245AbiBYQq4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Feb 2022 11:46:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243198AbiBYQqs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Feb 2022 11:46:48 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3013B22D646;
        Fri, 25 Feb 2022 08:46:15 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:947c:7c9e:f96:1bc])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 894AC1F462E0;
        Fri, 25 Feb 2022 16:46:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1645807574;
        bh=Kn9kzP3ipoxfyJ/OT6ys5Ke3c40g8u+aDjz7cKiGGXY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NauKTB5D4A/dk1Y0CGJrzEzh//gzjcfA8jOx89tDG0RwGGGVi1FE/hNsljLYibk2j
         ZCHTyEfbCoNvIzjw6ga64HjX/MmVAeJe411ax+MMDUb0QPN5g1Oo9QM6hu/8eAzZXN
         rxUoxAEtOCTT79pS/PiKyVf2QI7KvbuPPV5VjKIR2XjHItiGkf7UKcQA5Ni/pY+Ghv
         kWVpfMWWwedkG/3jvgqYH9c4Ix29s1kfQg+3Qr09rwtW7Hzbbe+WpA6cUAZvPFbBzW
         x1l/vZOVbGBG726SOeXOKTgW/RLrkLq8vqODuhGZi6nLaM8mIaFdNGdP9mFSumNJ57
         6SK0pSn/lNdDg==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, jonas@kwiboo.se, nicolas@ndufresne.ca
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@collabora.com, knaerzche@gmail.com, jc@kynesim.co.uk,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 06/14] media: uapi: HEVC: Add document uAPI structure
Date:   Fri, 25 Feb 2022 17:45:52 +0100
Message-Id: <20220225164600.1044663-7-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220225164600.1044663-1-benjamin.gaignard@collabora.com>
References: <20220225164600.1044663-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add kernel-doc documentation for all the HEVC structures.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/v4l/ext-ctrls-codec.rst             | 156 +++++++------
 include/media/hevc-ctrls.h                    | 217 +++++++++++++++++-
 2 files changed, 304 insertions(+), 69 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 262ad4f3c1f4..18625d18ddf3 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -2673,70 +2673,76 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
         of H.265 specifications.
     * - __u16
       - ``pic_width_in_luma_samples``
-      -
+      - Specifies the width of each decoded picture in units of luma samples.
     * - __u16
       - ``pic_height_in_luma_samples``
-      -
+      - Specifies the height of each decoded picture in units of luma samples.
     * - __u8
       - ``bit_depth_luma_minus8``
-      -
+      - Specifies the bit depth of the samples of the luma array.
     * - __u8
       - ``bit_depth_chroma_minus8``
-      -
+      - Specifies the bit depth of the samples of the chroma arrays.
     * - __u8
       - ``log2_max_pic_order_cnt_lsb_minus4``
-      -
+      - Specifies the value of the variable MaxPicOrderCntLsb.
     * - __u8
       - ``sps_max_dec_pic_buffering_minus1``
-      -
+      - Plus 1 specifies the maximum required size of the decoded picture buffer for
+        the CVS
     * - __u8
       - ``sps_max_num_reorder_pics``
-      -
+      - Indicates the maximum allowed number of pictures.
     * - __u8
       - ``sps_max_latency_increase_plus1``
-      -
+      - Not equal to 0 is used to compute the value of SpsMaxLatencyPictures[i].
     * - __u8
       - ``log2_min_luma_coding_block_size_minus3``
-      -
+      - Plus 3 specifies the minimum luma coding block size.
     * - __u8
       - ``log2_diff_max_min_luma_coding_block_size``
-      -
+      - Specifies the difference between the maximum and minimum luma coding block size.
     * - __u8
       - ``log2_min_luma_transform_block_size_minus2``
-      -
+      - Plus 2 specifies the minimum luma transform block size.
     * - __u8
       - ``log2_diff_max_min_luma_transform_block_size``
-      -
+      - Specifies the difference between the maximum and minimum luma transform block size.
     * - __u8
       - ``max_transform_hierarchy_depth_inter``
-      -
+      - Specifies the maximum hierarchy depth for transform units of coding units coded
+        in inter prediction mode.
     * - __u8
       - ``max_transform_hierarchy_depth_intra``
-      -
+      - Specifies the maximum hierarchy depth for transform units of coding units coded in
+        intra prediction mode.
     * - __u8
       - ``pcm_sample_bit_depth_luma_minus1``
-      -
+      - Specifies the number of bits used to represent each of PCM sample values of the
+        luma component.
     * - __u8
       - ``pcm_sample_bit_depth_chroma_minus1``
-      -
+      - Specifies the number of bits used to represent each of PCM sample values of
+        the chroma components.
     * - __u8
       - ``log2_min_pcm_luma_coding_block_size_minus3``
-      -
+      - Plus 3 specifies the minimum size of coding blocks.
     * - __u8
       - ``log2_diff_max_min_pcm_luma_coding_block_size``
-      -
+      - Specifies the difference between the maximum and minimum size of coding blocks.
     * - __u8
       - ``num_short_term_ref_pic_sets``
-      -
+      - Specifies the number of st_ref_pic_set() syntax structures included in the SPS.
     * - __u8
       - ``num_long_term_ref_pics_sps``
-      -
+      - Specifies the number of candidate long-term reference pictures that are
+        specified in the SPS.
     * - __u8
       - ``chroma_format_idc``
-      -
+      - Specifies the chroma sampling.
     * - __u8
       - ``sps_max_sub_layers_minus1``
-      -
+      - plus 1 specifies the maximum number of temporal sub-layers.
     * - __u64
       - ``flags``
       - See :ref:`Sequence Parameter Set Flags <hevc_sps_flags>`
@@ -2815,7 +2821,8 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
       - Identifies the PPS for reference by other syntax elements.
     * - __u8
       - ``num_extra_slice_header_bits``
-      -
+      - Specifies the number of extra slice header bits that are present
+        in the slice header RBSP for coded pictures referring to the PPS.
     * - __u8
       - ``num_ref_idx_l0_default_active_minus1``
       - Specifies the inferred value of num_ref_idx_l0_active_minus1
@@ -2824,37 +2831,42 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
       - Specifies the inferred value of num_ref_idx_l1_active_minus1
     * - __s8
       - ``init_qp_minus26``
-      -
+      - Plus 26 specifies the initial value of SliceQp Y for each slice
+        referring to the PPS.
     * - __u8
       - ``diff_cu_qp_delta_depth``
-      -
+      - Specifies the difference between the luma coding tree block size
+        and the minimum luma coding block size of coding units that
+        convey cu_qp_delta_abs and cu_qp_delta_sign_flag.
     * - __s8
       - ``pps_cb_qp_offset``
-      -
+      - Specify the offsets to the luma quantization parameter Cb.
     * - __s8
       - ``pps_cr_qp_offset``
-      -
+      - Specify the offsets to the luma quantization parameter Cr.
     * - __u8
       - ``num_tile_columns_minus1``
-      -
+      - Plus 1 specifies the number of tile columns partitioning the picture.
     * - __u8
       - ``num_tile_rows_minus1``
-      -
+      - Plus 1 specifies the number of tile rows partitioning the picture.
     * - __u8
       - ``column_width_minus1[20]``
-      -
+      - Plus 1 specifies the width of the i-th tile column in units of
+        coding tree blocks.
     * - __u8
       - ``row_height_minus1[22]``
-      -
+      - Plus 1 specifies the height of the i-th tile row in units of coding
+        tree blocks.
     * - __s8
       - ``pps_beta_offset_div2``
-      -
+      - Specify the default deblocking parameter offsets for beta divided by 2.
     * - __s8
       - ``pps_tc_offset_div2``
-      -
+      - Specify the default deblocking parameter offsets for tC divided by 2.
     * - __u8
       - ``log2_parallel_merge_level_minus2``
-      -
+      - Plus 2 specifies the value of the variable Log2ParMrgLevel.
     * - __u8
       - ``padding[4]``
       - Applications and drivers must set this to zero.
@@ -2976,10 +2988,10 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
       - Offset (in bits) to the video data in the current slice data.
     * - __u8
       - ``nal_unit_type``
-      -
+      - Specifies the coding type of the slice (B, P or I).
     * - __u8
       - ``nuh_temporal_id_plus1``
-      -
+      - Minus 1 specifies a temporal identifier for the NAL unit.
     * - __u8
       - ``slice_type``
       -
@@ -2987,52 +2999,56 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
 	V4L2_HEVC_SLICE_TYPE_B).
     * - __u8
       - ``colour_plane_id``
-      -
+      - Specifies the colour plane associated with the current slice.
     * - __u16
       - ``slice_pic_order_cnt``
-      -
+      - Specifies the picture order count.
     * - __u8
       - ``num_ref_idx_l0_active_minus1``
-      -
+      - Specifies the maximum reference index for reference picture list 0
+        that may be used to decode the slice.
     * - __u8
       - ``num_ref_idx_l1_active_minus1``
-      -
+      - Specifies the maximum reference index for reference picture list 1
+        that may be used to decode the slice.
     * - __u8
       - ``collocated_ref_idx``
-      -
+      - Specifies the reference index of the collocated picture used for 
+        temporal motion vector prediction.
     * - __u8
       - ``five_minus_max_num_merge_cand``
-      -
+      - Specifies the maximum number of merging motion vector prediction
+        candidates supported in the slice subtracted from 5.
     * - __s8
       - ``slice_qp_delta``
-      -
+      - Specifies the initial value of QpY to be used for the coding blocks in the slice.
     * - __s8
       - ``slice_cb_qp_offset``
-      -
+      - Specifies a difference to be added to the value of pps_cb_qp_offset.
     * - __s8
       - ``slice_cr_qp_offset``
-      -
+      - Specifies a difference to be added to the value of pps_cr_qp_offset.
     * - __s8
       - ``slice_act_y_qp_offset``
-      -
+      - screen content extension parameters
     * - __s8
       - ``slice_act_cb_qp_offset``
-      -
+      - screen content extension parameters
     * - __s8
       - ``slice_act_cr_qp_offset``
-      -
+      - screen content extension parameters
     * - __s8
       - ``slice_beta_offset_div2``
-      -
+      - Specify the deblocking parameter offsets for beta divided by 2.
     * - __s8
       - ``slice_tc_offset_div2``
-      -
+      - Specify the deblocking parameter offsets for tC divided by 2.
     * - __u8
       - ``pic_struct``
-      -
+      - Indicates whether a picture should be displayed as a frame or as one or more fields.
     * - __u32
       - ``slice_segment_addr``
-      -
+      - Specifies the address of the first coding tree block in the slice segment.
     * - __u8
       - ``ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
       - The list of L0 reference elements as indices in the DPB.
@@ -3222,36 +3238,44 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     :stub-columns: 0
     :widths:       1 1 2
 
-    * - __u8
-      - ``luma_log2_weight_denom``
-      -
-    * - __s8
-      - ``delta_chroma_log2_weight_denom``
-      -
     * - __s8
       - ``delta_luma_weight_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
-      -
+      - The difference of the weighting factor applied to the luma
+        prediction value for list 0.
     * - __s8
       - ``luma_offset_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
-      -
+      - The additive offset applied to the luma prediction value for list 0.
     * - __s8
       - ``delta_chroma_weight_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2]``
-      -
+      - The difference of the weighting factor applied to the chroma
+        prediction value for list 0.
     * - __s8
       - ``chroma_offset_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2]``
-      -
+      - The difference of the additive offset applied to the chroma
+        prediction values for list 0.
     * - __s8
       - ``delta_luma_weight_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
-      -
+      - The difference of the weighting factor applied to the luma
+        prediction value for list 1.
     * - __s8
       - ``luma_offset_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
-      -
+      - The additive offset applied to the luma prediction value for list 1.
     * - __s8
       - ``delta_chroma_weight_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2]``
-      -
+      - The difference of the weighting factor applied to the chroma
+        prediction value for list 1.
     * - __s8
       - ``chroma_offset_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2]``
-      -
+      - The difference of the additive offset applied to the chroma
+        prediction values for list 1.
+    * - __u8
+      - ``luma_log2_weight_denom``
+      - The base 2 logarithm of the denominator for all luma weighting
+        factors.
+    * - __s8
+      - ``delta_chroma_log2_weight_denom``
+      - The difference of the base 2 logarithm of the denominator for
+        all chroma weighting factors.
     * - __u8
       - ``padding[6]``
       - Applications and drivers must set this to zero.
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index b3540167df9e..1c86566cd7cb 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -55,9 +55,68 @@ enum v4l2_stateless_hevc_start_code {
 #define V4L2_HEVC_SPS_FLAG_SPS_TEMPORAL_MVP_ENABLED		(1ULL << 7)
 #define V4L2_HEVC_SPS_FLAG_STRONG_INTRA_SMOOTHING_ENABLED	(1ULL << 8)
 
-/* The controls are not stable at the moment and will likely be reworked. */
+/**
+ * struct v4l2_ctrl_hevc_sps - ITU-T Rec. H.265: Sequence parameter set
+ *
+ * @video_parameter_set_id: 	specifies the value of the
+ * 				vps_video_parameter_set_id of the active VPS
+ * @seq_parameter_set_id:	Provides an identifier for the SPS for
+ * 				reference by other syntax elements
+ * @pic_width_in_luma_samples:	specifies the width of each decoded picture
+ * 				in units of luma samples
+ * @pic_height_in_luma_samples: specifies the height of each decoded picture
+ * 				in units of luma samples
+ * @bit_depth_luma_minus8:	specifies the bit depth of the samples of the
+ * 				luma array
+ * @bit_depth_chroma_minus8:	specifies the bit depth of the samples of the
+ * 				chroma arrays
+ * @log2_max_pic_order_cnt_lsb_minus4:	specifies the value of the variable
+ * 					MaxPicOrderCntLsb
+ * @sps_max_dec_pic_buffering_minus1:	plus 1 specifies the maximum required
+ * 					size of the decoded picture buffer for
+ * 					the CVS
+ * @sps_max_num_reorder_pics:	indicates the maximum allowed number of pictures
+ * @sps_max_latency_increase_plus1:	not equal to 0 is used to compute the
+ * 					value of SpsMaxLatencyPictures[i]
+ * @log2_min_luma_coding_block_size_minus3:	plus 3 specifies the minimum
+ * 						luma coding block size
+ * @log2_diff_max_min_luma_coding_block_size:	specifies the difference between
+ * 						the maximum and minimum luma
+ * 						coding block size
+ * @log2_min_luma_transform_block_size_minus2:	plus 2 specifies the minimum luma
+ * 						transform block size
+ * @log2_diff_max_min_luma_transform_block_size: specifies the difference between
+ * 						 the maximum and minimum luma
+ * 						 transform block size
+ * @max_transform_hierarchy_depth_inter:	specifies the maximum hierarchy
+ * 						depth for transform units of
+ * 						coding units coded in inter
+ * 						prediction mode
+ * @max_transform_hierarchy_depth_intra:	specifies the maximum hierarchy
+ * 						depth for transform units of
+ * 						coding units coded in intra
+ * 						prediction mode
+ * @pcm_sample_bit_depth_luma_minus1:	specifies the number of bits used to
+ * 					represent each of PCM sample values of the
+ * 					luma component
+ * @pcm_sample_bit_depth_chroma_minus1: specifies the number of bits used to
+ * 					represent each of PCM sample values of
+ * 					the chroma components
+ * @log2_min_pcm_luma_coding_block_size_minus3: plus 3 specifies the minimum size
+ * 						of coding blocks
+ * @log2_diff_max_min_pcm_luma_coding_block_size: specifies the difference between
+ * 						  the maximum and minimum size of
+ * 						  coding blocks
+ * @num_short_term_ref_pic_sets:	speciœfies the number of st_ref_pic_set()
+ * 					syntax structures included in the SPS
+ * @num_long_term_ref_pics_sps:	specifies the number of candidate long-term
+ * 				reference pictures that are specified in the SPS
+ * @chroma_format_idc:	specifies the chroma sampling
+ * @sps_max_sub_layers_minus1: 	plus 1 specifies the maximum number of temporal
+ * 				sub-layers
+ * @flags: see V4L2_HEVC_SPS_FLAG_{}
+ */
 struct v4l2_ctrl_hevc_sps {
-	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Sequence parameter set */
 	__u8	video_parameter_set_id;
 	__u8	seq_parameter_set_id;
 	__u16	pic_width_in_luma_samples;
@@ -108,8 +167,43 @@ struct v4l2_ctrl_hevc_sps {
 #define V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT	(1ULL << 19)
 #define V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING			(1ULL << 20)
 
+/**
+ * struct v4l2_ctrl_hevc_pps - ITU-T Rec. H.265: Picture parameter set
+ *
+ * @pic_parameter_set_id:	identifies the PPS for reference by other
+ * 				syntax elements
+ * @num_extra_slice_header_bits: specifies the number of extra slice header
+ * 				 bits that are present in the slice header RBSP
+ * 				 for coded pictures referring to the PPS.
+ * @num_ref_idx_l0_default_active_minus1: specifies the inferred value of
+ * 					  num_ref_idx_l0_active_minus1
+ * @num_ref_idx_l1_default_active_minus1: specifies the inferred value of
+ * 					  num_ref_idx_l1_active_minus1
+ * @init_qp_minus26:	plus 26 specifies the initial value of SliceQp Y for
+ * 			each slice referring to the PPS
+ * @diff_cu_qp_delta_depth: 	specifies the difference between the luma coding
+ * 				tree block size and the minimum luma coding block
+ * 				size of coding units that convey cu_qp_delta_abs
+ * 				and cu_qp_delta_sign_flag
+ * @pps_cb_qp_offset: specify the offsets to the luma quantization parameter Cb
+ * @pps_cr_qp_offset: specify the offsets to the luma quantization parameter Cr
+ * @num_tile_columns_minus1: plus 1 specifies the number of tile columns
+ * 			     partitioning the picture
+ * @num_tile_rows_minus1: plus 1 specifies the number of tile rows partitioning
+ * 			  the picture
+ * @column_width_minus1: plus 1 specifies the width of the i-th tile column in
+ * 			 units of coding tree blocks
+ * @row_height_minus1: plus 1 specifies the height of the i-th tile row in
+ * 		       units of coding tree blocks
+ * @pps_beta_offset_div2: specify the default deblocking parameter offsets for
+ * 			  beta divided by 2
+ * @pps_tc_offset_div2: specify the default deblocking parameter offsets for tC
+ *			divided by 2
+ * @log2_parallel_merge_level_minus2: plus 2 specifies the value of the variable
+ * 				      Log2ParMrgLevel
+ * @flags: see V4L2_HEVC_PPS_FLAG_{}
+ */
 struct v4l2_ctrl_hevc_pps {
-	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Picture parameter set */
 	__u8	pic_parameter_set_id;
 	__u8	num_extra_slice_header_bits;
 	__u8	num_ref_idx_l0_default_active_minus1;
@@ -134,6 +228,14 @@ struct v4l2_ctrl_hevc_pps {
 
 #define V4L2_HEVC_DPB_ENTRIES_NUM_MAX		16
 
+/**
+ * struct v4l2_hevc_dpb_entry - HEVC decoded picture buffer entry
+ *
+ * @timestamp: timestamp of the V4L2 capture buffer to use as reference.
+ * @flags: long term flag for the reference frame
+ * @field_pic: whether the reference is a field picture or a frame.
+ * @pic_order_cnt: the picture order count of the reference.
+ */
 struct v4l2_hevc_dpb_entry {
 	__u64	timestamp;
 	__u8	flags;
@@ -142,6 +244,31 @@ struct v4l2_hevc_dpb_entry {
 	__u8	padding[2];
 };
 
+/**
+ * struct v4l2_hevc_pred_weight_table - HEVC weighted prediction parameters
+ *
+ * @delta_luma_weight_l0: the difference of the weighting factor applied
+ * 			  to the luma prediction value for list 0
+ * @luma_offset_l0: the additive offset applied to the luma prediction value
+ * 		    for list 0
+ * @delta_chroma_weight_l0: the difference of the weighting factor applied
+ * 			    to the chroma prediction values for list 0
+ * @chroma_offset_l0: the difference of the additive offset applied to
+ * 		      the chroma prediction values for list 0
+ * @delta_luma_weight_l1: the difference of the weighting factor applied
+ * 			  to the luma prediction value for list 1
+ * @luma_offset_l1: the additive offset applied to the luma prediction value
+ * 		    for list 1
+ * @delta_chroma_weight_l1: the difference of the weighting factor applied
+ * 			    to the chroma prediction values for list 1
+ * @chroma_offset_l1:the difference of the additive offset applied to
+ * 		      the chroma prediction values for list 1
+ * @luma_log2_weight_denom: the base 2 logarithm of the denominator for
+ * 			    all luma weighting factors
+ * @delta_chroma_log2_weight_denom: the difference of the base 2 logarithm
+ * 				    of the denominator for all chroma
+ * 				    weighting factors
+ */
 struct v4l2_hevc_pred_weight_table {
 	__s8	delta_luma_weight_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
 	__s8	luma_offset_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
@@ -170,6 +297,50 @@ struct v4l2_hevc_pred_weight_table {
 #define V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_LOOP_FILTER_ACROSS_SLICES_ENABLED (1ULL << 8)
 #define V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT	(1ULL << 9)
 
+/**
+ * v4l2_ctrl_hevc_slice_params - HEVC slice parameters
+ *
+ * @bit_size: size (in bits) of the current slice data
+ * @data_bit_offset: offset (in bits) to the video data in the current slice data
+ * @nal_unit_type: specifies the coding type of the slice (B, P or I)
+ * @nuh_temporal_id_plus1: minus 1 specifies a temporal identifier for the NAL unit
+ * @slice_type: see V4L2_HEVC_SLICE_TYPE_{}
+ * @colour_plane_id: specifies the colour plane associated with the current slice
+ * @slice_pic_order_cnt: specifies the picture order count
+ * @num_ref_idx_l0_active_minus1: specifies the maximum reference index for
+ * 				  reference picture list 0 that may be used to decode
+ * 				  the slice
+ * @num_ref_idx_l1_active_minus1: specifies the maximum reference index for
+ * 				  reference picture list 1 that may be used to decode
+ * 				  the slice
+ * @collocated_ref_idx: specifies the reference index of the collocated picture used
+ * 			for temporal motion vector prediction
+ * @five_minus_max_num_merge_cand: specifies the maximum number of merging
+ * 				   motion vector prediction candidates supported in
+ * 				   the slice subtracted from 5
+ * @slice_qp_delta: specifies the initial value of QpY to be used for the coding
+ * 		    blocks in the slice
+ * @slice_cb_qp_offset: specifies a difference to be added to the value of pps_cb_qp_offset
+ * @slice_cr_qp_offset: specifies a difference to be added to the value of pps_cr_qp_offset
+ * @slice_act_y_qp_offset: screen content extension parameters
+ * @slice_act_cb_qp_offset: screen content extension parameters
+ * @slice_act_cr_qp_offset: screen content extension parameters
+ * @slice_beta_offset_div2: specify the deblocking parameter offsets for beta divided by 2
+ * @slice_tc_offset_div2: specify the deblocking parameter offsets for tC divided by 2
+ * @pic_struct: indicates whether a picture should be displayed as a frame or as one or
+ * 		more fields
+ * @slice_segment_addr: specifies the address of the first coding tree block in
+ * 			the slice segment
+ * @ref_idx_l0: the list of L0 reference elements as indices in the DPB
+ * @ref_idx_l1: the list of L1 reference elements as indices in the DPB
+ * @short_term_ref_pic_set_size: specifies the number of st_ref_pic_set()
+ * 				 syntax structures included in the SPS
+ * @long_term_ref_pic_set_size: specifies the number of candidate long-term
+ * 				reference pictures that are specified in the SPS
+ * @pred_weight_table: the prediction weight coefficients for inter-picture
+ * 		       prediction
+ * @flags: see V4L2_HEVC_SLICE_PARAMS_FLAG_{}
+ */
 struct v4l2_ctrl_hevc_slice_params {
 	__u32	bit_size;
 	__u32	data_bit_offset;
@@ -216,6 +387,24 @@ struct v4l2_ctrl_hevc_slice_params {
 #define V4L2_HEVC_DECODE_PARAM_FLAG_IDR_PIC		0x2
 #define V4L2_HEVC_DECODE_PARAM_FLAG_NO_OUTPUT_OF_PRIOR  0x4
 
+/**
+ * struct v4l2_ctrl_hevc_decode_params - HEVC decode parameters
+ *
+ * @pic_order_cnt_val: picture order count
+ * @num_active_dpb_entries: the number of entries in dpb
+ * @dpb: the decoded picture buffer, for meta-data about reference frames
+ * @num_poc_st_curr_before: the number of reference pictures in the short-term
+ * 			    set that come before the current frame
+ * @num_poc_st_curr_after: the number of reference pictures in the short-term
+ * 			   set that come after the current frame
+ * @num_poc_lt_curr: the number of reference pictures in the long-term set
+ * @poc_st_curr_before: provides the index of the short term before references
+ * 			in DPB array
+ * @poc_st_curr_after: provides the index of the short term after references
+ * 		       in DPB array
+ * @poc_lt_curr: provides the index of the long term references in DPB array
+ * @flags: see V4L2_HEVC_DECODE_PARAM_FLAG_{}
+ */
 struct v4l2_ctrl_hevc_decode_params {
 	__s32	pic_order_cnt_val;
 	__u8	num_active_dpb_entries;
@@ -229,6 +418,28 @@ struct v4l2_ctrl_hevc_decode_params {
 	__u64	flags;
 };
 
+/**
+ * struct v4l2_ctrl_hevc_scaling_matrix - HEVC scaling lists parameters
+ *
+ * @scaling_list_4x4: scaling list is used for the scaling process for
+ * 		      transform coefficients. The values on each scaling
+ * 		      list are expected in raster scan order
+ * @scaling_list_8x8: scaling list is used for the scaling process for
+ * 		      transform coefficients. The values on each scaling
+ * 		      list are expected in raster scan order
+ * @scaling_list_16x16: scaling list is used for the scaling process for
+ * 			transform coefficients. The values on each scaling
+ * 			list are expected in raster scan order
+ * @scaling_list_32x32: scaling list is used for the scaling process for
+ * 			transform coefficients. The values on each scaling
+ * 			list are expected in raster scan order
+ * @scaling_list_dc_coef_16x16: scaling list is used for the scaling process
+ * 				for transform coefficients. The values on each
+ * 				scaling list are expected in raster scan order.
+ * @scaling_list_dc_coef_32x32: scaling list is used for the scaling process
+ * 				for transform coefficients. The values on each
+ * 				scaling list are expected in raster scan order.
+ */
 struct v4l2_ctrl_hevc_scaling_matrix {
 	__u8	scaling_list_4x4[6][16];
 	__u8	scaling_list_8x8[6][64];
-- 
2.32.0

