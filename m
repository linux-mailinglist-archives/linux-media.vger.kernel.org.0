Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFD0E27B60C
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 22:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgI1UOn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 16:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgI1UOn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 16:14:43 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F871C061755;
        Mon, 28 Sep 2020 13:14:43 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D7C2E2931D2
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2] media: uapi: h264: Add documentation to the interface header
Date:   Mon, 28 Sep 2020 17:14:33 -0300
Message-Id: <20200928201433.327068-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation for making the interface public,
document all the structures. Special care is taken to
annotate those fields that depart from the H264 syntax.

This commit only adds documentation and doesn't affect
functionality in any way.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
v2:
* Address the feedback, commenting every field, including
  reserved and flags.
* Clarify scaling list ordering.
---
 include/media/h264-ctrls.h | 195 +++++++++++++++++++++++++++++++++++--
 1 file changed, 185 insertions(+), 10 deletions(-)

diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index ec4799154438..893e21354a9b 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -46,11 +46,38 @@
 #define V4L2_CTRL_TYPE_H264_DECODE_PARAMS	0x0114
 #define V4L2_CTRL_TYPE_H264_PRED_WEIGHTS	0x0115
 
+/**
+ * enum v4l2_mpeg_video_h264_decode_mode - Decoding mode
+ *
+ * @V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED: indicates that decoding
+ * is performed one slice at a time. In this mode,
+ * V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS must contain the parsed slice
+ * parameters and the OUTPUT buffer must contain a single slice.
+ * V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF feature is used
+ * in order to support multislice frames.
+ * @V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED: indicates that
+ * decoding is performed per frame. The OUTPUT buffer must contain
+ * all slices and also both fields. This mode is typically supported
+ * by device drivers that are able to parse the slice(s) header(s)
+ * in hardware. When this mode is selected,
+ * V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS is not used.
+ */
 enum v4l2_mpeg_video_h264_decode_mode {
 	V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED,
 	V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
 };
 
+/**
+ * enum v4l2_mpeg_video_h264_start_code - Start code
+ *
+ * @V4L2_MPEG_VIDEO_H264_START_CODE_NONE: slices are passed
+ * to the driver without any start code.
+ * @V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B: slices are passed
+ * to the driver with an Annex B start code prefix
+ * (legal start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001).
+ * This mode is typically supported by device drivers that parse
+ * the start code in hardware.
+ */
 enum v4l2_mpeg_video_h264_start_code {
 	V4L2_MPEG_VIDEO_H264_START_CODE_NONE,
 	V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
@@ -71,6 +98,31 @@ enum v4l2_mpeg_video_h264_start_code {
 #define V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD		0x20
 #define V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE			0x40
 
+/**
+ * struct v4l2_ctrl_h264_sps - H264 sequence parameter set
+ *
+ * All the members on this sequence parameter set structure match the
+ * sequence parameter set syntax as specified by the H264 specification.
+ *
+ * @profile_idc: see H264 specification.
+ * @constraint_set_flags: see H264 specification.
+ * @level_idc: see H264 specification.
+ * @seq_parameter_set_id: see H264 specification.
+ * @chroma_format_idc: see H264 specification.
+ * @bit_depth_luma_minus8: see H264 specification.
+ * @bit_depth_chroma_minus8: see H264 specification.
+ * @log2_max_frame_num_minus4: see H264 specification.
+ * @pic_order_cnt_type: see H264 specification.
+ * @log2_max_pic_order_cnt_lsb_minus4: see H264 specification.
+ * @max_num_ref_frames: see H264 specification.
+ * @num_ref_frames_in_pic_order_cnt_cycle: see H264 specification.
+ * @offset_for_ref_frame: see H264 specification.
+ * @offset_for_non_ref_pic: see H264 specification.
+ * @offset_for_top_to_bottom_field: see H264 specification.
+ * @pic_width_in_mbs_minus1: see H264 specification.
+ * @pic_height_in_map_units_minus1: see H264 specification.
+ * @flags: see V4L2_H264_SPS_FLAG_{}.
+ */
 struct v4l2_ctrl_h264_sps {
 	__u8 profile_idc;
 	__u8 constraint_set_flags;
@@ -101,6 +153,31 @@ struct v4l2_ctrl_h264_sps {
 #define V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE				0x0040
 #define V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT			0x0080
 
+/**
+ * struct v4l2_ctrl_h264_pps - H264 picture parameter set
+ *
+ * Except where noted, all the members on this picture parameter set
+ * structure match the sequence parameter set syntax as specified
+ * by the H264 specification.
+ *
+ * In particular, V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT flag
+ * has a specific meaning. This flag should be set if a non-flat
+ * scaling matrix applies to the picture. In this case, applications
+ * are expected to use V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
+ * to pass the values of the non-flat matrices.
+ *
+ * @pic_parameter_set_id: see H264 specification.
+ * @seq_parameter_set_id: see H264 specification.
+ * @num_slice_groups_minus1: see H264 specification.
+ * @num_ref_idx_l0_default_active_minus1: see H264 specification.
+ * @num_ref_idx_l1_default_active_minus1: see H264 specification.
+ * @weighted_bipred_idc: see H264 specification.
+ * @pic_init_qp_minus26: see H264 specification.
+ * @pic_init_qs_minus26: see H264 specification.
+ * @chroma_qp_index_offset: see H264 specification.
+ * @second_chroma_qp_index_offset: see H264 specification.
+ * @flags: see V4L2_H264_PPS_FLAG_{}.
+ */
 struct v4l2_ctrl_h264_pps {
 	__u8 pic_parameter_set_id;
 	__u8 seq_parameter_set_id;
@@ -115,6 +192,23 @@ struct v4l2_ctrl_h264_pps {
 	__u16 flags;
 };
 
+/**
+ * struct v4l2_ctrl_h264_scaling_matrix - H264 scaling matrices
+ *
+ * @scaling_list_4x4: scaling matrix after applying the inverse
+ * scanning process. Expected list order is Intra Y, Intra Cb,
+ * Intra Cr, Inter Y, Inter Cb, Inter Cr. The values on each
+ * scaling list are expected in raster scan order.
+ * @scaling_list_8x8: scaling matrix after applying the inverse
+ * scanning process. Expected list order is Intra Y, Inter Y,
+ * Intra Cb, Inter Cb, Intra Cr, Inter Cr. The values on each
+ * scaling list are expected in raster scan order.
+ *
+ * Note that the list order is different for the 4x4 and 8x8
+ * matrices as per the H264 specification, see table 7-2 "Assignment
+ * of mnemonic names to scaling list indices and specification of
+ * fall-back rule".
+ */
 struct v4l2_ctrl_h264_scaling_matrix {
 	__u8 scaling_list_4x4[6][16];
 	__u8 scaling_list_8x8[6][64];
@@ -134,6 +228,16 @@ struct v4l2_h264_weight_factors {
 	 ((pps)->weighted_bipred_idc == 1 && \
 	  (slice)->slice_type == V4L2_H264_SLICE_TYPE_B))
 
+/**
+ * struct v4l2_ctrl_h264_pred_weights - Prediction weight table
+ *
+ * Prediction weight table, which matches the syntax specified
+ * by the H264 specification.
+ *
+ * @luma_log2_weight_denom: see H264 specification.
+ * @chroma_log2_weight_denom: see H264 specification.
+ * @weight_factors: luma and chroma weight factors.
+ */
 struct v4l2_ctrl_h264_pred_weights {
 	__u16 luma_log2_weight_denom;
 	__u16 chroma_log2_weight_denom;
@@ -153,19 +257,55 @@ struct v4l2_ctrl_h264_pred_weights {
 #define V4L2_H264_BOTTOM_FIELD_REF			0x2
 #define V4L2_H264_FRAME_REF				0x3
 
+/**
+ * struct v4l2_h264_reference - H264 picture reference
+ *
+ * @fields: indicates how the picture is referenced.
+ * Valid values are V4L2_H264_{}_REF.
+ * @index: index into v4l2_ctrl_h264_decode_params.dpb[].
+ */
 struct v4l2_h264_reference {
 	__u8 fields;
-
-	/* Index into v4l2_ctrl_h264_decode_params.dpb[] */
 	__u8 index;
 };
 
+/**
+ * struct v4l2_ctrl_h264_slice_params - H264 slice parameters
+ *
+ * This structure holds the H264 syntax elements that are specified
+ * as non-invariant for the slices in a given frame.
+ *
+ * Slice invariant syntax elements are contained in struct
+ * v4l2_ctrl_h264_decode_params. This is done to reduce the API surface
+ * on frame-based decoders, where slice header parsing is done by the
+ * hardware.
+ *
+ * Slice invariant syntax elements are specified in specification section
+ * "7.4.3 Slice header semantics".
+ *
+ * Except where noted, the members on this struct match the slice header syntax.
+ *
+ * @header_bit_size: offset in bits to slice_data() from the beginning of this slice.
+ * @first_mb_in_slice: see H264 specification.
+ * @slice_type: see H264 specification.
+ * @colour_plane_id: see H264 specification.
+ * @redundant_pic_cnt: see H264 specification.
+ * @cabac_init_idc: see H264 specification.
+ * @slice_qp_delta: see H264 specification.
+ * @slice_qs_delta: see H264 specification.
+ * @disable_deblocking_filter_idc: see H264 specification.
+ * @slice_alpha_c0_offset_div2: see H264 specification.
+ * @slice_beta_offset_div2: see H264 specification.
+ * @num_ref_idx_l0_active_minus1: see H264 specification.
+ * @num_ref_idx_l1_active_minus1: see H264 specification.
+ * @reserved: padding field. Should be zeroed by applications.
+ * @ref_pic_list0: reference picture list 0 after applying the per-slice modifications.
+ * @ref_pic_list1: reference picture list 1 after applying the per-slice modifications.
+ * @flags: see V4L2_H264_SLICE_FLAG_{}.
+ */
 struct v4l2_ctrl_h264_slice_params {
-	/* Offset in bits to slice_data() from the beginning of this slice. */
 	__u32 header_bit_size;
-
 	__u32 first_mb_in_slice;
-
 	__u8 slice_type;
 	__u8 colour_plane_id;
 	__u8 redundant_pic_cnt;
@@ -191,22 +331,59 @@ struct v4l2_ctrl_h264_slice_params {
 #define V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM	0x04
 #define V4L2_H264_DPB_ENTRY_FLAG_FIELD		0x08
 
+/**
+ * struct v4l2_h264_dpb_entry - H264 decoded picture buffer entry
+ *
+ * @reference_ts: timestamp of the V4L2 capture buffer to use as reference.
+ * The timestamp refers to the timestamp field in struct v4l2_buffer.
+ * Use v4l2_timeval_to_ns() to convert the struct timeval to a __u64.
+ * @pic_num: matches PicNum variable assigned during the reference
+ * picture lists construction process.
+ * @frame_num: frame identifier which matches frame_num syntax element.
+ * @fields: indicates how the DPB entry is referenced. Valid values are
+ * V4L2_H264_{}_REF.
+ * @reserved: padding field. Should be zeroed by applications.
+ * @top_field_order_cnt: matches TopFieldOrderCnt picture value.
+ * @bottom_field_order_cnt: matches BottomFieldOrderCnt picture value.
+ * Note that picture field is indicated by v4l2_buffer.field.
+ * @flags: see V4L2_H264_DPB_ENTRY_FLAG_{}.
+ */
 struct v4l2_h264_dpb_entry {
 	__u64 reference_ts;
 	__u32 pic_num;
 	__u16 frame_num;
 	__u8 fields;
 	__u8 reserved[5];
-	/* Note that field is indicated by v4l2_buffer.field */
 	__s32 top_field_order_cnt;
 	__s32 bottom_field_order_cnt;
-	__u32 flags; /* V4L2_H264_DPB_ENTRY_FLAG_* */
+	__u32 flags;
 };
 
 #define V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC		0x01
 #define V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC		0x02
 #define V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD	0x04
 
+/**
+ * struct v4l2_ctrl_h264_decode_params - H264 decoding parameters
+ *
+ * @dpb: decoded picture buffer.
+ * @nal_ref_idc: slice header syntax element.
+ * @frame_num: slice header syntax element.
+ * @top_field_order_cnt: matches TopFieldOrderCnt picture value.
+ * @bottom_field_order_cnt: matches BottomFieldOrderCnt picture value.
+ * Note that picture field is indicated by v4l2_buffer.field.
+ * @idr_pic_id: slice header syntax element.
+ * @pic_order_cnt_lsb: slice header syntax element.
+ * @delta_pic_order_cnt_bottom: slice header syntax element.
+ * @delta_pic_order_cnt0: slice header syntax element.
+ * @delta_pic_order_cnt1: slice header syntax element.
+ * @dec_ref_pic_marking_bit_size: size in bits of dec_ref_pic_marking()
+ * syntax element.
+ * @pic_order_cnt_bit_size: size in bits of pic order count syntax.
+ * @slice_group_change_cycle: slice header syntax element.
+ * @reserved: padding field. Should be zeroed by applications.
+ * @flags: see V4L2_H264_DECODE_PARAM_FLAG_{}.
+ */
 struct v4l2_ctrl_h264_decode_params {
 	struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES];
 	__u16 nal_ref_idc;
@@ -218,14 +395,12 @@ struct v4l2_ctrl_h264_decode_params {
 	__s32 delta_pic_order_cnt_bottom;
 	__s32 delta_pic_order_cnt0;
 	__s32 delta_pic_order_cnt1;
-	/* Size in bits of dec_ref_pic_marking() syntax element. */
 	__u32 dec_ref_pic_marking_bit_size;
-	/* Size in bits of pic order count syntax. */
 	__u32 pic_order_cnt_bit_size;
 	__u32 slice_group_change_cycle;
 
 	__u32 reserved;
-	__u32 flags; /* V4L2_H264_DECODE_PARAM_FLAG_* */
+	__u32 flags;
 };
 
 #endif
-- 
2.27.0

