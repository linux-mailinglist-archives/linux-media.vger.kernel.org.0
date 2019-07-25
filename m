Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 738EE75764
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 20:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbfGYS41 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 14:56:27 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:47719 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbfGYS40 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 14:56:26 -0400
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B40BA40003;
        Thu, 25 Jul 2019 18:56:20 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@googlegroups.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v7 2/4] media: v4l: Add definitions for the HEVC slice controls
Date:   Thu, 25 Jul 2019 20:56:00 +0200
Message-Id: <20190725185602.22522-3-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190725185602.22522-1-paul.kocialkowski@bootlin.com>
References: <20190725185602.22522-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This introduces the required definitions for HEVC decoding support with
stateless VPUs. The controls associated to the HEVC slice format provide
the required meta-data for decoding slices extracted from the bitstream.

They are not exported to the public V4L2 API since reworking this API
will be needed for covering various use-cases and new hardware.

The interface comes with the following limitations:
* No custom quantization matrices (scaling lists);
* Support for a single temporal layer only;
* No slice entry point offsets support;
* No conformance window support;
* No VUI parameters support;
* No support for SPS extensions: range, multilayer, 3d, scc, 4 bits;
* No support for PPS extensions: range, multilayer, 3d, scc, 4 bits.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 Documentation/media/uapi/v4l/biblio.rst       |   9 +
 .../media/uapi/v4l/ext-ctrls-codec.rst        | 486 +++++++++++++++++-
 .../media/uapi/v4l/vidioc-queryctrl.rst       |  18 +
 .../media/videodev2.h.rst.exceptions          |   3 +
 drivers/media/v4l2-core/v4l2-ctrls.c          |  89 ++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/media/hevc-ctrls.h                    | 198 +++++++
 include/media/v4l2-ctrls.h                    |   7 +
 8 files changed, 808 insertions(+), 3 deletions(-)
 create mode 100644 include/media/hevc-ctrls.h

diff --git a/Documentation/media/uapi/v4l/biblio.rst b/Documentation/media/uapi/v4l/biblio.rst
index ad2ff258afa8..8095f57d3d75 100644
--- a/Documentation/media/uapi/v4l/biblio.rst
+++ b/Documentation/media/uapi/v4l/biblio.rst
@@ -131,6 +131,15 @@ ITU-T Rec. H.264 Specification (04/2017 Edition)
 
 :author:    International Telecommunication Union (http://www.itu.ch)
 
+.. _hevc:
+
+ITU H.265/HEVC
+==============
+
+:title:     ITU-T Rec. H.265 | ISO/IEC 23008-2 "High Efficiency Video Coding"
+
+:author:    International Telecommunication Union (http://www.itu.ch), International Organisation for Standardisation (http://www.iso.ch)
+
 .. _jfif:
 
 JFIF
diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
index c5f39dd50043..6f91a8507310 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
@@ -1981,9 +1981,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       - ``reference_ts``
       - Timestamp of the V4L2 capture buffer to use as reference, used
         with B-coded and P-coded frames. The timestamp refers to the
-	``timestamp`` field in struct :c:type:`v4l2_buffer`. Use the
-	:c:func:`v4l2_timeval_to_ns()` function to convert the struct
-	:c:type:`timeval` in struct :c:type:`v4l2_buffer` to a __u64.
+        ``timestamp`` field in struct :c:type:`v4l2_buffer`. Use the
+        :c:func:`v4l2_timeval_to_ns()` function to convert the struct
+        :c:type:`timeval` in struct :c:type:`v4l2_buffer` to a __u64.
     * - __u16
       - ``frame_num``
       -
@@ -3614,3 +3614,483 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     Indicates whether to generate SPS and PPS at every IDR. Setting it to 0
     disables generating SPS and PPS at every IDR. Setting it to one enables
     generating SPS and PPS at every IDR.
+
+.. _v4l2-mpeg-hevc:
+
+``V4L2_CID_MPEG_VIDEO_HEVC_SPS (struct)``
+    Specifies the Sequence Parameter Set fields (as extracted from the
+    bitstream) for the associated HEVC slice data.
+    These bitstream parameters are defined according to :ref:`hevc`.
+    They are described in section 7.4.3.2 "Sequence parameter set RBSP
+    semantics" of the specification.
+
+.. c:type:: v4l2_ctrl_hevc_sps
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_hevc_sps
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u16
+      - ``pic_width_in_luma_samples``
+      -
+    * - __u16
+      - ``pic_height_in_luma_samples``
+      -
+    * - __u8
+      - ``bit_depth_luma_minus8``
+      -
+    * - __u8
+      - ``bit_depth_chroma_minus8``
+      -
+    * - __u8
+      - ``log2_max_pic_order_cnt_lsb_minus4``
+      -
+    * - __u8
+      - ``sps_max_dec_pic_buffering_minus1``
+      -
+    * - __u8
+      - ``sps_max_num_reorder_pics``
+      -
+    * - __u8
+      - ``sps_max_latency_increase_plus1``
+      -
+    * - __u8
+      - ``log2_min_luma_coding_block_size_minus3``
+      -
+    * - __u8
+      - ``log2_diff_max_min_luma_coding_block_size``
+      -
+    * - __u8
+      - ``log2_min_luma_transform_block_size_minus2``
+      -
+    * - __u8
+      - ``log2_diff_max_min_luma_transform_block_size``
+      -
+    * - __u8
+      - ``max_transform_hierarchy_depth_inter``
+      -
+    * - __u8
+      - ``max_transform_hierarchy_depth_intra``
+      -
+    * - __u8
+      - ``pcm_sample_bit_depth_luma_minus1``
+      -
+    * - __u8
+      - ``pcm_sample_bit_depth_chroma_minus1``
+      -
+    * - __u8
+      - ``log2_min_pcm_luma_coding_block_size_minus3``
+      -
+    * - __u8
+      - ``log2_diff_max_min_pcm_luma_coding_block_size``
+      -
+    * - __u8
+      - ``num_short_term_ref_pic_sets``
+      -
+    * - __u8
+      - ``num_long_term_ref_pics_sps``
+      -
+    * - __u8
+      - ``chroma_format_idc``
+      -
+    * - __u64
+      - ``flags``
+      - See :ref:`Sequence Parameter Set Flags <hevc_sps_flags>`
+
+.. _hevc_sps_flags:
+
+``Sequence Parameter Set Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_HEVC_SPS_FLAG_SEPARATE_COLOUR_PLANE``
+      - 0x00000001
+      -
+    * - ``V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED``
+      - 0x00000002
+      -
+    * - ``V4L2_HEVC_SPS_FLAG_AMP_ENABLED``
+      - 0x00000004
+      -
+    * - ``V4L2_HEVC_SPS_FLAG_SAMPLE_ADAPTIVE_OFFSET``
+      - 0x00000008
+      -
+    * - ``V4L2_HEVC_SPS_FLAG_PCM_ENABLED``
+      - 0x00000010
+      -
+    * - ``V4L2_HEVC_SPS_FLAG_PCM_LOOP_FILTER_DISABLED``
+      - 0x00000020
+      -
+    * - ``V4L2_HEVC_SPS_FLAG_LONG_TERM_REF_PICS_PRESENT``
+      - 0x00000040
+      -
+    * - ``V4L2_HEVC_SPS_FLAG_SPS_TEMPORAL_MVP_ENABLED``
+      - 0x00000080
+      -
+    * - ``V4L2_HEVC_SPS_FLAG_STRONG_INTRA_SMOOTHING_ENABLED``
+      - 0x00000100
+      -
+
+``V4L2_CID_MPEG_VIDEO_HEVC_PPS (struct)``
+    Specifies the Picture Parameter Set fields (as extracted from the
+    bitstream) for the associated HEVC slice data.
+    These bitstream parameters are defined according to :ref:`hevc`.
+    They are described in section 7.4.3.3 "Picture parameter set RBSP
+    semantics" of the specification.
+
+.. c:type:: v4l2_ctrl_hevc_pps
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_hevc_pps
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``num_extra_slice_header_bits``
+      -
+    * - __s8
+      - ``init_qp_minus26``
+      -
+    * - __u8
+      - ``diff_cu_qp_delta_depth``
+      -
+    * - __s8
+      - ``pps_cb_qp_offset``
+      -
+    * - __s8
+      - ``pps_cr_qp_offset``
+      -
+    * - __u8
+      - ``num_tile_columns_minus1``
+      -
+    * - __u8
+      - ``num_tile_rows_minus1``
+      -
+    * - __u8
+      - ``column_width_minus1[20]``
+      -
+    * - __u8
+      - ``row_height_minus1[22]``
+      -
+    * - __s8
+      - ``pps_beta_offset_div2``
+      -
+    * - __s8
+      - ``pps_tc_offset_div2``
+      -
+    * - __u8
+      - ``log2_parallel_merge_level_minus2``
+      -
+    * - __u8
+      - ``padding[4]``
+      - Applications and drivers must set this to zero.
+    * - __u64
+      - ``flags``
+      - See :ref:`Picture Parameter Set Flags <hevc_pps_flags>`
+
+.. _hevc_pps_flags:
+
+``Picture Parameter Set Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT``
+      - 0x00000001
+      -
+    * - ``V4L2_HEVC_PPS_FLAG_OUTPUT_FLAG_PRESENT``
+      - 0x00000002
+      -
+    * - ``V4L2_HEVC_PPS_FLAG_SIGN_DATA_HIDING_ENABLED``
+      - 0x00000004
+      -
+    * - ``V4L2_HEVC_PPS_FLAG_CABAC_INIT_PRESENT``
+      - 0x00000008
+      -
+    * - ``V4L2_HEVC_PPS_FLAG_CONSTRAINED_INTRA_PRED``
+      - 0x00000010
+      -
+    * - ``V4L2_HEVC_PPS_FLAG_TRANSFORM_SKIP_ENABLED``
+      - 0x00000020
+      -
+    * - ``V4L2_HEVC_PPS_FLAG_CU_QP_DELTA_ENABLED``
+      - 0x00000040
+      -
+    * - ``V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT``
+      - 0x00000080
+      -
+    * - ``V4L2_HEVC_PPS_FLAG_WEIGHTED_PRED``
+      - 0x00000100
+      -
+    * - ``V4L2_HEVC_PPS_FLAG_WEIGHTED_BIPRED``
+      - 0x00000200
+      -
+    * - ``V4L2_HEVC_PPS_FLAG_TRANSQUANT_BYPASS_ENABLED``
+      - 0x00000400
+      -
+    * - ``V4L2_HEVC_PPS_FLAG_TILES_ENABLED``
+      - 0x00000800
+      -
+    * - ``V4L2_HEVC_PPS_FLAG_ENTROPY_CODING_SYNC_ENABLED``
+      - 0x00001000
+      -
+    * - ``V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED``
+      - 0x00002000
+      -
+    * - ``V4L2_HEVC_PPS_FLAG_PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED``
+      - 0x00004000
+      -
+    * - ``V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_OVERRIDE_ENABLED``
+      - 0x00008000
+      -
+    * - ``V4L2_HEVC_PPS_FLAG_PPS_DISABLE_DEBLOCKING_FILTER``
+      - 0x00010000
+      -
+    * - ``V4L2_HEVC_PPS_FLAG_LISTS_MODIFICATION_PRESENT``
+      - 0x00020000
+      -
+    * - ``V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRESENT``
+      - 0x00040000
+      -
+
+``V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS (struct)``
+    Specifies various slice-specific parameters, especially from the NAL unit
+    header, general slice segment header and weighted prediction parameter
+    parts of the bitstream.
+    These bitstream parameters are defined according to :ref:`hevc`.
+    They are described in section 7.4.7 "General slice segment header
+    semantics" of the specification.
+
+.. c:type:: v4l2_ctrl_hevc_slice_params
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_hevc_slice_params
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u32
+      - ``bit_size``
+      - Size (in bits) of the current slice data.
+    * - __u32
+      - ``data_bit_offset``
+      - Offset (in bits) to the video data in the current slice data.
+    * - __u8
+      - ``nal_unit_type``
+      -
+    * - __u8
+      - ``nuh_temporal_id_plus1``
+      -
+    * - __u8
+      - ``slice_type``
+      -
+	(V4L2_HEVC_SLICE_TYPE_I, V4L2_HEVC_SLICE_TYPE_P or
+	V4L2_HEVC_SLICE_TYPE_B).
+    * - __u8
+      - ``colour_plane_id``
+      -
+    * - __u16
+      - ``slice_pic_order_cnt``
+      -
+    * - __u8
+      - ``num_ref_idx_l0_active_minus1``
+      -
+    * - __u8
+      - ``num_ref_idx_l1_active_minus1``
+      -
+    * - __u8
+      - ``collocated_ref_idx``
+      -
+    * - __u8
+      - ``five_minus_max_num_merge_cand``
+      -
+    * - __s8
+      - ``slice_qp_delta``
+      -
+    * - __s8
+      - ``slice_cb_qp_offset``
+      -
+    * - __s8
+      - ``slice_cr_qp_offset``
+      -
+    * - __s8
+      - ``slice_act_y_qp_offset``
+      -
+    * - __s8
+      - ``slice_act_cb_qp_offset``
+      -
+    * - __s8
+      - ``slice_act_cr_qp_offset``
+      -
+    * - __s8
+      - ``slice_beta_offset_div2``
+      -
+    * - __s8
+      - ``slice_tc_offset_div2``
+      -
+    * - __u8
+      - ``pic_struct``
+      -
+    * - __u8
+      - ``num_active_dpb_entries``
+      - The number of entries in ``dpb``.
+    * - __u8
+      - ``ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
+      - The list of L0 reference elements as indices in the DPB.
+    * - __u8
+      - ``ref_idx_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
+      - The list of L1 reference elements as indices in the DPB.
+    * - __u8
+      - ``num_rps_poc_st_curr_before``
+      - The number of reference pictures in the short-term set that come before
+        the current frame.
+    * - __u8
+      - ``num_rps_poc_st_curr_after``
+      - The number of reference pictures in the short-term set that come after
+        the current frame.
+    * - __u8
+      - ``num_rps_poc_lt_curr``
+      - The number of reference pictures in the long-term set.
+    * - __u8
+      - ``padding[7]``
+      - Applications and drivers must set this to zero.
+    * - struct :c:type:`v4l2_hevc_dpb_entry`
+      - ``dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
+      - The decoded picture buffer, for meta-data about reference frames.
+    * - struct :c:type:`v4l2_hevc_pred_weight_table`
+      - ``pred_weight_table``
+      - The prediction weight coefficients for inter-picture prediction.
+    * - __u64
+      - ``flags``
+      - See :ref:`Slice Parameters Flags <hevc_slice_params_flags>`
+
+.. _hevc_slice_params_flags:
+
+``Slice Parameters Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_SAO_LUMA``
+      - 0x00000001
+      -
+    * - ``V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_SAO_CHROMA``
+      - 0x00000002
+      -
+    * - ``V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_TEMPORAL_MVP_ENABLED``
+      - 0x00000004
+      -
+    * - ``V4L2_HEVC_SLICE_PARAMS_FLAG_MVD_L1_ZERO``
+      - 0x00000008
+      -
+    * - ``V4L2_HEVC_SLICE_PARAMS_FLAG_CABAC_INIT``
+      - 0x00000010
+      -
+    * - ``V4L2_HEVC_SLICE_PARAMS_FLAG_COLLOCATED_FROM_L0``
+      - 0x00000020
+      -
+    * - ``V4L2_HEVC_SLICE_PARAMS_FLAG_USE_INTEGER_MV``
+      - 0x00000040
+      -
+    * - ``V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_DEBLOCKING_FILTER_DISABLED``
+      - 0x00000080
+      -
+    * - ``V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_LOOP_FILTER_ACROSS_SLICES_ENABLED``
+      - 0x00000100
+      -
+
+.. c:type:: v4l2_hevc_dpb_entry
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_hevc_dpb_entry
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u64
+      - ``timestamp``
+      - Timestamp of the V4L2 capture buffer to use as reference, used
+        with B-coded and P-coded frames. The timestamp refers to the
+	``timestamp`` field in struct :c:type:`v4l2_buffer`. Use the
+	:c:func:`v4l2_timeval_to_ns()` function to convert the struct
+	:c:type:`timeval` in struct :c:type:`v4l2_buffer` to a __u64.
+    * - __u8
+      - ``rps``
+      - The reference set for the reference frame
+        (V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_BEFORE,
+        V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_AFTER or
+        V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
+    * - __u8
+      - ``field_pic``
+      - Whether the reference is a field picture or a frame.
+    * - __u16
+      - ``pic_order_cnt[2]``
+      - The picture order count of the reference. Only the first element of the
+        array is used for frame pictures, while the first element identifies the
+        top field and the second the bottom field in field-coded pictures.
+    * - __u8
+      - ``padding[2]``
+      - Applications and drivers must set this to zero.
+
+.. c:type:: v4l2_hevc_pred_weight_table
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_hevc_pred_weight_table
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``luma_log2_weight_denom``
+      -
+    * - __s8
+      - ``delta_chroma_log2_weight_denom``
+      -
+    * - __s8
+      - ``delta_luma_weight_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
+      -
+    * - __s8
+      - ``luma_offset_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
+      -
+    * - __s8
+      - ``delta_chroma_weight_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2]``
+      -
+    * - __s8
+      - ``chroma_offset_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2]``
+      -
+    * - __s8
+      - ``delta_luma_weight_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
+      -
+    * - __s8
+      - ``luma_offset_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
+      -
+    * - __s8
+      - ``delta_chroma_weight_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2]``
+      -
+    * - __s8
+      - ``chroma_offset_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2]``
+      -
+    * - __u8
+      - ``padding[6]``
+      - Applications and drivers must set this to zero.
diff --git a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
index dc500632095d..e090ef33231c 100644
--- a/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
+++ b/Documentation/media/uapi/v4l/vidioc-queryctrl.rst
@@ -473,6 +473,24 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_ctrl_h264_decode_params`, containing H264
 	decode parameters for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_HEVC_SPS``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_ctrl_hevc_sps`, containing HEVC Sequence
+	Parameter Set for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_HEVC_PPS``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_ctrl_hevc_pps`, containing HEVC Picture
+	Parameter Set for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_ctrl_hevc_slice_params`, containing HEVC
+	slice parameters for stateless video decoders.
 
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
index 55cbe324b9fc..afba7d71971a 100644
--- a/Documentation/media/videodev2.h.rst.exceptions
+++ b/Documentation/media/videodev2.h.rst.exceptions
@@ -141,6 +141,9 @@ replace symbol V4L2_CTRL_TYPE_H264_PPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_H264_SCALING_MATRIX :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_H264_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_H264_DECODE_PARAMS :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
 
 # V4L2 capability defines
 replace define V4L2_CAP_VIDEO_CAPTURE device-capabilities
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index cd1ae016706f..17d9460461da 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -941,6 +941,9 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_HEVC_SIZE_OF_LENGTH_FIELD:	return "HEVC Size of Length Field";
 	case V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES:	return "Reference Frames for a P-Frame";
 	case V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR:		return "Prepend SPS and PPS to IDR";
+	case V4L2_CID_MPEG_VIDEO_HEVC_SPS:			return "HEVC Sequence Parameter Set";
+	case V4L2_CID_MPEG_VIDEO_HEVC_PPS:			return "HEVC Picture Parameter Set";
+	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
 
 	/* CAMERA controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1357,6 +1360,15 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:
 		*type = V4L2_CTRL_TYPE_VP8_FRAME_HEADER;
 		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_SPS:
+		*type = V4L2_CTRL_TYPE_HEVC_SPS;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_PPS:
+		*type = V4L2_CTRL_TYPE_HEVC_PPS;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:
+		*type = V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
@@ -1654,7 +1666,11 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 {
 	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
 	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
+	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
+	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
+	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
 	void *p = ptr.p + idx * ctrl->elem_size;
+	unsigned int i;
 
 	switch ((u32)ctrl->type) {
 	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
@@ -1730,6 +1746,70 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		zero_padding(p_vp8_frame_header->entropy_header);
 		zero_padding(p_vp8_frame_header->coder_state);
 		break;
+
+	case V4L2_CTRL_TYPE_HEVC_SPS:
+		p_hevc_sps = p;
+
+		if (!(p_hevc_sps->flags & V4L2_HEVC_SPS_FLAG_PCM_ENABLED)) {
+			p_hevc_sps->pcm_sample_bit_depth_luma_minus1 = 0;
+			p_hevc_sps->pcm_sample_bit_depth_chroma_minus1 = 0;
+			p_hevc_sps->log2_min_pcm_luma_coding_block_size_minus3 = 0;
+			p_hevc_sps->log2_diff_max_min_pcm_luma_coding_block_size = 0;
+		}
+
+		if (!(p_hevc_sps->flags &
+		      V4L2_HEVC_SPS_FLAG_LONG_TERM_REF_PICS_PRESENT))
+			p_hevc_sps->num_long_term_ref_pics_sps = 0;
+		break;
+
+	case V4L2_CTRL_TYPE_HEVC_PPS:
+		p_hevc_pps = p;
+
+		if (!(p_hevc_pps->flags &
+		      V4L2_HEVC_PPS_FLAG_CU_QP_DELTA_ENABLED))
+			p_hevc_pps->diff_cu_qp_delta_depth = 0;
+
+		if (!(p_hevc_pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED)) {
+			p_hevc_pps->num_tile_columns_minus1 = 0;
+			p_hevc_pps->num_tile_rows_minus1 = 0;
+			memset(&p_hevc_pps->column_width_minus1, 0,
+			       sizeof(p_hevc_pps->column_width_minus1));
+			memset(&p_hevc_pps->row_height_minus1, 0,
+			       sizeof(p_hevc_pps->row_height_minus1));
+
+			p_hevc_pps->flags &=
+				~V4L2_HEVC_PPS_FLAG_PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED;
+		}
+
+		if (p_hevc_pps->flags &
+		    V4L2_HEVC_PPS_FLAG_PPS_DISABLE_DEBLOCKING_FILTER) {
+			p_hevc_pps->pps_beta_offset_div2 = 0;
+			p_hevc_pps->pps_tc_offset_div2 = 0;
+		}
+
+		zero_padding(*p_hevc_pps);
+		break;
+
+	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
+		p_hevc_slice_params = p;
+
+		if (p_hevc_slice_params->num_active_dpb_entries >
+		    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
+			return -EINVAL;
+
+		zero_padding(p_hevc_slice_params->pred_weight_table);
+
+		for (i = 0; i < p_hevc_slice_params->num_active_dpb_entries;
+		     i++) {
+			struct v4l2_hevc_dpb_entry *dpb_entry =
+				&p_hevc_slice_params->dpb[i];
+
+			zero_padding(*dpb_entry);
+		}
+
+		zero_padding(*p_hevc_slice_params);
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -2403,6 +2483,15 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
 		elem_size = sizeof(struct v4l2_ctrl_vp8_frame_header);
 		break;
+	case V4L2_CTRL_TYPE_HEVC_SPS:
+		elem_size = sizeof(struct v4l2_ctrl_hevc_sps);
+		break;
+	case V4L2_CTRL_TYPE_HEVC_PPS:
+		elem_size = sizeof(struct v4l2_ctrl_hevc_pps);
+		break;
+	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
+		elem_size = sizeof(struct v4l2_ctrl_hevc_slice_params);
+		break;
 	default:
 		if (type < V4L2_CTRL_COMPOUND_TYPES)
 			elem_size = sizeof(s32);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 9484cc2619e4..4e8b0a9ad925 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1356,6 +1356,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		case V4L2_PIX_FMT_VP8_FRAME:    descr = "VP8 Frame"; break;
 		case V4L2_PIX_FMT_VP9:		descr = "VP9"; break;
 		case V4L2_PIX_FMT_HEVC:		descr = "HEVC"; break; /* aka H.265 */
+		case V4L2_PIX_FMT_HEVC_SLICE:	descr = "HEVC Parsed Slice Data"; break;
 		case V4L2_PIX_FMT_FWHT:		descr = "FWHT"; break; /* used in vicodec */
 		case V4L2_PIX_FMT_FWHT_STATELESS:	descr = "FWHT Stateless"; break; /* used in vicodec */
 		case V4L2_PIX_FMT_CPIA1:	descr = "GSPCA CPiA YUV"; break;
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
new file mode 100644
index 000000000000..cd5ae28a4e28
--- /dev/null
+++ b/include/media/hevc-ctrls.h
@@ -0,0 +1,198 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * These are the HEVC state controls for use with stateless HEVC
+ * codec drivers.
+ *
+ * It turns out that these structs are not stable yet and will undergo
+ * more changes. So keep them private until they are stable and ready to
+ * become part of the official public API.
+ */
+
+#ifndef _HEVC_CTRLS_H_
+#define _HEVC_CTRLS_H_
+
+#include <linux/videodev2.h>
+
+/* The pixel format isn't stable at the moment and will likely be renamed. */
+#define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
+
+#define V4L2_CID_MPEG_VIDEO_HEVC_SPS		(V4L2_CID_MPEG_BASE + 1008)
+#define V4L2_CID_MPEG_VIDEO_HEVC_PPS		(V4L2_CID_MPEG_BASE + 1009)
+#define V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS	(V4L2_CID_MPEG_BASE + 1010)
+
+/* enum v4l2_ctrl_type type values */
+#define V4L2_CTRL_TYPE_HEVC_SPS 0x0120
+#define V4L2_CTRL_TYPE_HEVC_PPS 0x0121
+#define V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS 0x0122
+
+#define V4L2_HEVC_SLICE_TYPE_B	0
+#define V4L2_HEVC_SLICE_TYPE_P	1
+#define V4L2_HEVC_SLICE_TYPE_I	2
+
+#define V4L2_HEVC_SPS_FLAG_SEPARATE_COLOUR_PLANE		(1 << 0)
+#define V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED			(1 << 1)
+#define V4L2_HEVC_SPS_FLAG_AMP_ENABLED				(1 << 2)
+#define V4L2_HEVC_SPS_FLAG_SAMPLE_ADAPTIVE_OFFSET		(1 << 3)
+#define V4L2_HEVC_SPS_FLAG_PCM_ENABLED				(1 << 4)
+#define V4L2_HEVC_SPS_FLAG_PCM_LOOP_FILTER_DISABLED		(1 << 5)
+#define V4L2_HEVC_SPS_FLAG_LONG_TERM_REF_PICS_PRESENT		(1 << 6)
+#define V4L2_HEVC_SPS_FLAG_SPS_TEMPORAL_MVP_ENABLED		(1 << 7)
+#define V4L2_HEVC_SPS_FLAG_STRONG_INTRA_SMOOTHING_ENABLED	(1 << 8)
+
+/* The controls are not stable at the moment and will likely be reworked. */
+struct v4l2_ctrl_hevc_sps {
+	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Sequence parameter set */
+	__u16	pic_width_in_luma_samples;
+	__u16	pic_height_in_luma_samples;
+	__u8	bit_depth_luma_minus8;
+	__u8	bit_depth_chroma_minus8;
+	__u8	log2_max_pic_order_cnt_lsb_minus4;
+	__u8	sps_max_dec_pic_buffering_minus1;
+	__u8	sps_max_num_reorder_pics;
+	__u8	sps_max_latency_increase_plus1;
+	__u8	log2_min_luma_coding_block_size_minus3;
+	__u8	log2_diff_max_min_luma_coding_block_size;
+	__u8	log2_min_luma_transform_block_size_minus2;
+	__u8	log2_diff_max_min_luma_transform_block_size;
+	__u8	max_transform_hierarchy_depth_inter;
+	__u8	max_transform_hierarchy_depth_intra;
+	__u8	pcm_sample_bit_depth_luma_minus1;
+	__u8	pcm_sample_bit_depth_chroma_minus1;
+	__u8	log2_min_pcm_luma_coding_block_size_minus3;
+	__u8	log2_diff_max_min_pcm_luma_coding_block_size;
+	__u8	num_short_term_ref_pic_sets;
+	__u8	num_long_term_ref_pics_sps;
+	__u8	chroma_format_idc;
+
+	__u64	flags;
+};
+
+#define V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT		(1 << 0)
+#define V4L2_HEVC_PPS_FLAG_OUTPUT_FLAG_PRESENT			(1 << 1)
+#define V4L2_HEVC_PPS_FLAG_SIGN_DATA_HIDING_ENABLED		(1 << 2)
+#define V4L2_HEVC_PPS_FLAG_CABAC_INIT_PRESENT			(1 << 3)
+#define V4L2_HEVC_PPS_FLAG_CONSTRAINED_INTRA_PRED		(1 << 4)
+#define V4L2_HEVC_PPS_FLAG_TRANSFORM_SKIP_ENABLED		(1 << 5)
+#define V4L2_HEVC_PPS_FLAG_CU_QP_DELTA_ENABLED			(1 << 6)
+#define V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT	(1 << 7)
+#define V4L2_HEVC_PPS_FLAG_WEIGHTED_PRED			(1 << 8)
+#define V4L2_HEVC_PPS_FLAG_WEIGHTED_BIPRED			(1 << 9)
+#define V4L2_HEVC_PPS_FLAG_TRANSQUANT_BYPASS_ENABLED		(1 << 10)
+#define V4L2_HEVC_PPS_FLAG_TILES_ENABLED			(1 << 11)
+#define V4L2_HEVC_PPS_FLAG_ENTROPY_CODING_SYNC_ENABLED		(1 << 12)
+#define V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED	(1 << 13)
+#define V4L2_HEVC_PPS_FLAG_PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED (1 << 14)
+#define V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_OVERRIDE_ENABLED	(1 << 15)
+#define V4L2_HEVC_PPS_FLAG_PPS_DISABLE_DEBLOCKING_FILTER	(1 << 16)
+#define V4L2_HEVC_PPS_FLAG_LISTS_MODIFICATION_PRESENT		(1 << 17)
+#define V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRESENT (1 << 18)
+
+struct v4l2_ctrl_hevc_pps {
+	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Picture parameter set */
+	__u8	num_extra_slice_header_bits;
+	__s8	init_qp_minus26;
+	__u8	diff_cu_qp_delta_depth;
+	__s8	pps_cb_qp_offset;
+	__s8	pps_cr_qp_offset;
+	__u8	num_tile_columns_minus1;
+	__u8	num_tile_rows_minus1;
+	__u8	column_width_minus1[20];
+	__u8	row_height_minus1[22];
+	__s8	pps_beta_offset_div2;
+	__s8	pps_tc_offset_div2;
+	__u8	log2_parallel_merge_level_minus2;
+
+	__u8	padding[4];
+	__u64	flags;
+};
+
+#define V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_BEFORE	0x01
+#define V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_AFTER	0x02
+#define V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR		0x03
+
+#define V4L2_HEVC_DPB_ENTRIES_NUM_MAX		16
+
+struct v4l2_hevc_dpb_entry {
+	__u64	timestamp;
+	__u8	rps;
+	__u8	field_pic;
+	__u16	pic_order_cnt[2];
+	__u8	padding[2];
+};
+
+struct v4l2_hevc_pred_weight_table {
+	__u8	luma_log2_weight_denom;
+	__s8	delta_chroma_log2_weight_denom;
+
+	__s8	delta_luma_weight_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__s8	luma_offset_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__s8	delta_chroma_weight_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2];
+	__s8	chroma_offset_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2];
+
+	__s8	delta_luma_weight_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__s8	luma_offset_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__s8	delta_chroma_weight_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2];
+	__s8	chroma_offset_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2];
+
+	__u8	padding[6];
+};
+
+#define V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_SAO_LUMA		(1 << 0)
+#define V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_SAO_CHROMA		(1 << 1)
+#define V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_TEMPORAL_MVP_ENABLED	(1 << 2)
+#define V4L2_HEVC_SLICE_PARAMS_FLAG_MVD_L1_ZERO			(1 << 3)
+#define V4L2_HEVC_SLICE_PARAMS_FLAG_CABAC_INIT			(1 << 4)
+#define V4L2_HEVC_SLICE_PARAMS_FLAG_COLLOCATED_FROM_L0		(1 << 5)
+#define V4L2_HEVC_SLICE_PARAMS_FLAG_USE_INTEGER_MV		(1 << 6)
+#define V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_DEBLOCKING_FILTER_DISABLED (1 << 7)
+#define V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_LOOP_FILTER_ACROSS_SLICES_ENABLED (1 << 8)
+
+struct v4l2_ctrl_hevc_slice_params {
+	__u32	bit_size;
+	__u32	data_bit_offset;
+
+	/* ISO/IEC 23008-2, ITU-T Rec. H.265: NAL unit header */
+	__u8	nal_unit_type;
+	__u8	nuh_temporal_id_plus1;
+
+	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
+	__u8	slice_type;
+	__u8	colour_plane_id;
+	__u16	slice_pic_order_cnt;
+	__u8	num_ref_idx_l0_active_minus1;
+	__u8	num_ref_idx_l1_active_minus1;
+	__u8	collocated_ref_idx;
+	__u8	five_minus_max_num_merge_cand;
+	__s8	slice_qp_delta;
+	__s8	slice_cb_qp_offset;
+	__s8	slice_cr_qp_offset;
+	__s8	slice_act_y_qp_offset;
+	__s8	slice_act_cb_qp_offset;
+	__s8	slice_act_cr_qp_offset;
+	__s8	slice_beta_offset_div2;
+	__s8	slice_tc_offset_div2;
+
+	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Picture timing SEI message */
+	__u8	pic_struct;
+
+	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
+	__u8	num_active_dpb_entries;
+	__u8	ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__u8	ref_idx_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+
+	__u8	num_rps_poc_st_curr_before;
+	__u8	num_rps_poc_st_curr_after;
+	__u8	num_rps_poc_lt_curr;
+
+	__u8	padding[7];
+
+	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
+	struct v4l2_hevc_dpb_entry dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+
+	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Weighted prediction parameter */
+	struct v4l2_hevc_pred_weight_table pred_weight_table;
+
+	__u64	flags;
+};
+
+#endif
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 570ff4b0205a..e212bee4a541 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -21,6 +21,7 @@
 #include <media/fwht-ctrls.h>
 #include <media/h264-ctrls.h>
 #include <media/vp8-ctrls.h>
+#include <media/hevc-ctrls.h>
 
 /* forward references */
 struct file;
@@ -50,6 +51,9 @@ struct poll_table_struct;
  * @p_h264_slice_params:	Pointer to a struct v4l2_ctrl_h264_slice_params.
  * @p_h264_decode_params:	Pointer to a struct v4l2_ctrl_h264_decode_params.
  * @p_vp8_frame_header:		Pointer to a VP8 frame header structure.
+ * @p_hevc_sps:			Pointer to an HEVC sequence parameter set structure.
+ * @p_hevc_pps:			Pointer to an HEVC picture parameter set structure.
+ * @p_hevc_slice_params:	Pointer to an HEVC slice parameters structure.
  * @p:				Pointer to a compound value.
  */
 union v4l2_ctrl_ptr {
@@ -68,6 +72,9 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
 	struct v4l2_ctrl_h264_decode_params *p_h264_decode_params;
 	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
+	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
+	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
+	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
 	void *p;
 };
 
-- 
2.22.0

