Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8109A2B8425
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 19:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbgKRSsL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 13:48:11 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37782 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727049AbgKRSsL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 13:48:11 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id DA9311F4499B
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v3 13/13] media: docs: Move the H264 stateless codec uAPI
Date:   Wed, 18 Nov 2020 15:47:00 -0300
Message-Id: <20201118184700.331213-14-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201118184700.331213-1-ezequiel@collabora.com>
References: <20201118184700.331213-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that we've destaged the H264 stateless codec controls,
and with all the pieces in place, update the documentation
and move it to its own section.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 .../userspace-api/media/v4l/common.rst        |   1 +
 .../media/v4l/ext-ctrls-codec-stateless.rst   | 674 +++++++++++++++++
 .../media/v4l/ext-ctrls-codec.rst             | 692 ------------------
 .../media/v4l/pixfmt-compressed.rst           |  21 +-
 4 files changed, 683 insertions(+), 705 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst

diff --git a/Documentation/userspace-api/media/v4l/common.rst b/Documentation/userspace-api/media/v4l/common.rst
index d84aeb703165..8c263c5a85d8 100644
--- a/Documentation/userspace-api/media/v4l/common.rst
+++ b/Documentation/userspace-api/media/v4l/common.rst
@@ -44,6 +44,7 @@ applicable to all devices.
     ext-ctrls-image-source
     ext-ctrls-image-process
     ext-ctrls-codec
+    ext-ctrls-codec-stateless
     ext-ctrls-jpeg
     ext-ctrls-dv
     ext-ctrls-rf-tuner
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
new file mode 100644
index 000000000000..ab433afe625f
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
@@ -0,0 +1,674 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+
+.. _codec-stateless-controls:
+
+*********************************
+Stateless Codec Control Reference
+*********************************
+
+The Stateless Codec control class is intended to support
+stateless decoder and encoders (i.e. hardware accelerators).
+
+These drivers are typically supported by the :ref:`stateless_decoder`,
+and deal with parsed pixel formats such as V4L2_PIX_FMT_H264_SLICE.
+
+Stateless Codec Control ID
+==========================
+
+.. _codec-stateless-control-id:
+
+``V4L2_CID_CODEC_STATELESS_CLASS (class)``
+    The Codec class descriptor.
+
+.. _v4l2-codec-stateless-h264:
+
+``V4L2_CID_STATELESS_H264_SPS (struct)``
+    Specifies the sequence parameter set (as extracted from the
+    bitstream) for the associated H264 slice data. This includes the
+    necessary parameters for configuring a stateless hardware decoding
+    pipeline for H264. The bitstream parameters are defined according
+    to :ref:`h264`, section 7.4.2.1.1 "Sequence Parameter Set Data
+    Semantics". For further documentation, refer to the above
+    specification, unless there is an explicit comment stating
+    otherwise.
+
+.. c:type:: v4l2_ctrl_h264_sps
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_h264_sps
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``profile_idc``
+      -
+    * - __u8
+      - ``constraint_set_flags``
+      - See :ref:`Sequence Parameter Set Constraints Set Flags <h264_sps_constraints_set_flags>`
+    * - __u8
+      - ``level_idc``
+      -
+    * - __u8
+      - ``seq_parameter_set_id``
+      -
+    * - __u8
+      - ``chroma_format_idc``
+      -
+    * - __u8
+      - ``bit_depth_luma_minus8``
+      -
+    * - __u8
+      - ``bit_depth_chroma_minus8``
+      -
+    * - __u8
+      - ``log2_max_frame_num_minus4``
+      -
+    * - __u8
+      - ``pic_order_cnt_type``
+      -
+    * - __u8
+      - ``log2_max_pic_order_cnt_lsb_minus4``
+      -
+    * - __u8
+      - ``max_num_ref_frames``
+      -
+    * - __u8
+      - ``num_ref_frames_in_pic_order_cnt_cycle``
+      -
+    * - __s32
+      - ``offset_for_ref_frame[255]``
+      -
+    * - __s32
+      - ``offset_for_non_ref_pic``
+      -
+    * - __s32
+      - ``offset_for_top_to_bottom_field``
+      -
+    * - __u16
+      - ``pic_width_in_mbs_minus1``
+      -
+    * - __u16
+      - ``pic_height_in_map_units_minus1``
+      -
+    * - __u32
+      - ``flags``
+      - See :ref:`Sequence Parameter Set Flags <h264_sps_flags>`
+
+.. _h264_sps_constraints_set_flags:
+
+``Sequence Parameter Set Constraints Set Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_H264_SPS_CONSTRAINT_SET0_FLAG``
+      - 0x00000001
+      -
+    * - ``V4L2_H264_SPS_CONSTRAINT_SET1_FLAG``
+      - 0x00000002
+      -
+    * - ``V4L2_H264_SPS_CONSTRAINT_SET2_FLAG``
+      - 0x00000004
+      -
+    * - ``V4L2_H264_SPS_CONSTRAINT_SET3_FLAG``
+      - 0x00000008
+      -
+    * - ``V4L2_H264_SPS_CONSTRAINT_SET4_FLAG``
+      - 0x00000010
+      -
+    * - ``V4L2_H264_SPS_CONSTRAINT_SET5_FLAG``
+      - 0x00000020
+      -
+
+.. _h264_sps_flags:
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
+    * - ``V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE``
+      - 0x00000001
+      -
+    * - ``V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS``
+      - 0x00000002
+      -
+    * - ``V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO``
+      - 0x00000004
+      -
+    * - ``V4L2_H264_SPS_FLAG_GAPS_IN_FRAME_NUM_VALUE_ALLOWED``
+      - 0x00000008
+      -
+    * - ``V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY``
+      - 0x00000010
+      -
+    * - ``V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD``
+      - 0x00000020
+      -
+    * - ``V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE``
+      - 0x00000040
+      -
+
+``V4L2_CID_STATELESS_H264_PPS (struct)``
+    Specifies the picture parameter set (as extracted from the
+    bitstream) for the associated H264 slice data. This includes the
+    necessary parameters for configuring a stateless hardware decoding
+    pipeline for H264.  The bitstream parameters are defined according
+    to :ref:`h264`, section 7.4.2.2 "Picture Parameter Set RBSP
+    Semantics". For further documentation, refer to the above
+    specification, unless there is an explicit comment stating
+    otherwise.
+
+.. c:type:: v4l2_ctrl_h264_pps
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_h264_pps
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``pic_parameter_set_id``
+      -
+    * - __u8
+      - ``seq_parameter_set_id``
+      -
+    * - __u8
+      - ``num_slice_groups_minus1``
+      -
+    * - __u8
+      - ``num_ref_idx_l0_default_active_minus1``
+      -
+    * - __u8
+      - ``num_ref_idx_l1_default_active_minus1``
+      -
+    * - __u8
+      - ``weighted_bipred_idc``
+      -
+    * - __s8
+      - ``pic_init_qp_minus26``
+      -
+    * - __s8
+      - ``pic_init_qs_minus26``
+      -
+    * - __s8
+      - ``chroma_qp_index_offset``
+      -
+    * - __s8
+      - ``second_chroma_qp_index_offset``
+      -
+    * - __u16
+      - ``flags``
+      - See :ref:`Picture Parameter Set Flags <h264_pps_flags>`
+
+.. _h264_pps_flags:
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
+    * - ``V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE``
+      - 0x00000001
+      -
+    * - ``V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT``
+      - 0x00000002
+      -
+    * - ``V4L2_H264_PPS_FLAG_WEIGHTED_PRED``
+      - 0x00000004
+      -
+    * - ``V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT``
+      - 0x00000008
+      -
+    * - ``V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED``
+      - 0x00000010
+      -
+    * - ``V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT``
+      - 0x00000020
+      -
+    * - ``V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE``
+      - 0x00000040
+      -
+    * - ``V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT``
+      - 0x00000080
+      - Indicates that ``V4L2_CID_STATELESS_H264_SCALING_MATRIX``
+        must be used for this picture.
+
+``V4L2_CID_STATELESS_H264_SCALING_MATRIX (struct)``
+    Specifies the scaling matrix (as extracted from the bitstream) for
+    the associated H264 slice data. The bitstream parameters are
+    defined according to :ref:`h264`, section 7.4.2.1.1.1 "Scaling
+    List Semantics". For further documentation, refer to the above
+    specification, unless there is an explicit comment stating
+    otherwise.
+
+.. c:type:: v4l2_ctrl_h264_scaling_matrix
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_h264_scaling_matrix
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``scaling_list_4x4[6][16]``
+      - Scaling matrix after applying the inverse scanning process.
+        Expected list order is Intra Y, Intra Cb, Intra Cr, Inter Y,
+        Inter Cb, Inter Cr. The values on each scaling list are
+        expected in raster scan order.
+    * - __u8
+      - ``scaling_list_8x8[6][64]``
+      - Scaling matrix after applying the inverse scanning process.
+        Expected list order is Intra Y, Inter Y, Intra Cb, Inter Cb,
+        Intra Cr, Inter Cr. The values on each scaling list are
+        expected in raster scan order.
+
+``V4L2_CID_STATELESS_H264_SLICE_PARAMS (struct)``
+    Specifies the slice parameters (as extracted from the bitstream)
+    for the associated H264 slice data. This includes the necessary
+    parameters for configuring a stateless hardware decoding pipeline
+    for H264.  The bitstream parameters are defined according to
+    :ref:`h264`, section 7.4.3 "Slice Header Semantics". For further
+    documentation, refer to the above specification, unless there is
+    an explicit comment stating otherwise.
+
+.. c:type:: v4l2_ctrl_h264_slice_params
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_h264_slice_params
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u32
+      - ``header_bit_size``
+      - Offset in bits to slice_data() from the beginning of this slice.
+    * - __u32
+      - ``first_mb_in_slice``
+      -
+    * - __u8
+      - ``slice_type``
+      -
+    * - __u8
+      - ``colour_plane_id``
+      -
+    * - __u8
+      - ``redundant_pic_cnt``
+      -
+    * - __u8
+      - ``cabac_init_idc``
+      -
+    * - __s8
+      - ``slice_qp_delta``
+      -
+    * - __s8
+      - ``slice_qs_delta``
+      -
+    * - __u8
+      - ``disable_deblocking_filter_idc``
+      -
+    * - __s8
+      - ``slice_alpha_c0_offset_div2``
+      -
+    * - __s8
+      - ``slice_beta_offset_div2``
+      -
+    * - __u8
+      - ``num_ref_idx_l0_active_minus1``
+      - If num_ref_idx_active_override_flag is not set, this field must be
+        set to the value of num_ref_idx_l0_default_active_minus1.
+    * - __u8
+      - ``num_ref_idx_l1_active_minus1``
+      - If num_ref_idx_active_override_flag is not set, this field must be
+        set to the value of num_ref_idx_l1_default_active_minus1.
+    * - __u8
+      - ``reserved``
+      - Applications and drivers must set this to zero.
+    * - struct :c:type:`v4l2_h264_reference`
+      - ``ref_pic_list0[32]``
+      - Reference picture list after applying the per-slice modifications
+    * - struct :c:type:`v4l2_h264_reference`
+      - ``ref_pic_list1[32]``
+      - Reference picture list after applying the per-slice modifications
+    * - __u32
+      - ``flags``
+      - See :ref:`Slice Parameter Flags <h264_slice_flags>`
+
+.. _h264_slice_flags:
+
+``Slice Parameter Set Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED``
+      - 0x00000001
+      -
+    * - ``V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH``
+      - 0x00000002
+      -
+
+``V4L2_CID_STATELESS_H264_PRED_WEIGHTS (struct)``
+    Prediction weight table defined according to :ref:`h264`,
+    section 7.4.3.2 "Prediction Weight Table Semantics".
+    The prediction weight table must be passed by applications
+    under the conditions explained in section 7.3.3 "Slice header
+    syntax".
+
+.. c:type:: v4l2_ctrl_h264_pred_weights
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_h264_pred_weights
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u16
+      - ``luma_log2_weight_denom``
+      -
+    * - __u16
+      - ``chroma_log2_weight_denom``
+      -
+    * - struct :c:type:`v4l2_h264_weight_factors`
+      - ``weight_factors[2]``
+      - The weight factors at index 0 are the weight factors for the reference
+        list 0, the one at index 1 for the reference list 1.
+
+.. c:type:: v4l2_h264_weight_factors
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_h264_weight_factors
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __s16
+      - ``luma_weight[32]``
+      -
+    * - __s16
+      - ``luma_offset[32]``
+      -
+    * - __s16
+      - ``chroma_weight[32][2]``
+      -
+    * - __s16
+      - ``chroma_offset[32][2]``
+      -
+
+``Picture Reference``
+
+.. c:type:: v4l2_h264_reference
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_h264_reference
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u8
+      - ``fields``
+      - Specifies how the picture is referenced. See :ref:`Reference Fields <h264_ref_fields>`
+    * - __u8
+      - ``index``
+      - Index into the :c:type:`v4l2_ctrl_h264_decode_params`.dpb array.
+
+.. _h264_ref_fields:
+
+``Reference Fields``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_H264_TOP_FIELD_REF``
+      - 0x1
+      - The top field in field pair is used for short-term reference.
+    * - ``V4L2_H264_BOTTOM_FIELD_REF``
+      - 0x2
+      - The bottom field in field pair is used for short-term reference.
+    * - ``V4L2_H264_FRAME_REF``
+      - 0x3
+      - The frame (or the top/bottom fields, if it's a field pair)
+        is used for short-term reference.
+
+``V4L2_CID_STATELESS_H264_DECODE_PARAMS (struct)``
+    Specifies the decode parameters (as extracted from the bitstream)
+    for the associated H264 slice data. This includes the necessary
+    parameters for configuring a stateless hardware decoding pipeline
+    for H264. The bitstream parameters are defined according to
+    :ref:`h264`. For further documentation, refer to the above
+    specification, unless there is an explicit comment stating
+    otherwise.
+
+.. c:type:: v4l2_ctrl_h264_decode_params
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_h264_decode_params
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - struct :c:type:`v4l2_h264_dpb_entry`
+      - ``dpb[16]``
+      -
+    * - __u16
+      - ``nal_ref_idc``
+      - NAL reference ID value coming from the NAL Unit header
+    * - __u16
+      - ``frame_num``
+      -
+    * - __s32
+      - ``top_field_order_cnt``
+      - Picture Order Count for the coded top field
+    * - __s32
+      - ``bottom_field_order_cnt``
+      - Picture Order Count for the coded bottom field
+    * - __u16
+      - ``idr_pic_id``
+      -
+    * - __u16
+      - ``pic_order_cnt_lsb``
+      -
+    * - __s32
+      - ``delta_pic_order_cnt_bottom``
+      -
+    * - __s32
+      - ``delta_pic_order_cnt0``
+      -
+    * - __s32
+      - ``delta_pic_order_cnt1``
+      -
+    * - __u32
+      - ``dec_ref_pic_marking_bit_size``
+      - Size in bits of the dec_ref_pic_marking() syntax element.
+    * - __u32
+      - ``pic_order_cnt_bit_size``
+      - Combined size in bits of the picture order count related syntax
+        elements: pic_order_cnt_lsb, delta_pic_order_cnt_bottom,
+        delta_pic_order_cnt0, and delta_pic_order_cnt1.
+    * - __u32
+      - ``slice_group_change_cycle``
+      -
+    * - __u32
+      - ``reserved``
+      - Applications and drivers must set this to zero.
+    * - __u32
+      - ``flags``
+      - See :ref:`Decode Parameters Flags <h264_decode_params_flags>`
+
+.. _h264_decode_params_flags:
+
+``Decode Parameters Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC``
+      - 0x00000001
+      - That picture is an IDR picture
+    * - ``V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC``
+      - 0x00000002
+      -
+    * - ``V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD``
+      - 0x00000004
+      -
+
+.. c:type:: v4l2_h264_dpb_entry
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_h264_dpb_entry
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __u64
+      - ``reference_ts``
+      - Timestamp of the V4L2 capture buffer to use as reference, used
+        with B-coded and P-coded frames. The timestamp refers to the
+        ``timestamp`` field in struct :c:type:`v4l2_buffer`. Use the
+        :c:func:`v4l2_timeval_to_ns()` function to convert the struct
+        :c:type:`timeval` in struct :c:type:`v4l2_buffer` to a __u64.
+    * - __u32
+      - ``pic_num``
+      -
+    * - __u16
+      - ``frame_num``
+      -
+    * - __u8
+      - ``fields``
+      - Specifies how the DPB entry is referenced. See :ref:`Reference Fields <h264_ref_fields>`
+    * - __u8
+      - ``reserved[5]``
+      - Applications and drivers must set this to zero.
+    * - __s32
+      - ``top_field_order_cnt``
+      -
+    * - __s32
+      - ``bottom_field_order_cnt``
+      -
+    * - __u32
+      - ``flags``
+      - See :ref:`DPB Entry Flags <h264_dpb_flags>`
+
+.. _h264_dpb_flags:
+
+``DPB Entries Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_H264_DPB_ENTRY_FLAG_VALID``
+      - 0x00000001
+      - The DPB entry is valid (non-empty) and should be considered.
+    * - ``V4L2_H264_DPB_ENTRY_FLAG_ACTIVE``
+      - 0x00000002
+      - The DPB entry is used for reference.
+    * - ``V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM``
+      - 0x00000004
+      - The DPB entry is used for long-term reference.
+    * - ``V4L2_H264_DPB_ENTRY_FLAG_FIELD``
+      - 0x00000008
+      - The DPB entry is a single field or a complementary field pair.
+
+``V4L2_CID_STATELESS_H264_DECODE_MODE (enum)``
+    Specifies the decoding mode to use. Currently exposes slice-based and
+    frame-based decoding but new modes might be added later on.
+    This control is used as a modifier for V4L2_PIX_FMT_H264_SLICE
+    pixel format. Applications that support V4L2_PIX_FMT_H264_SLICE
+    are required to set this control in order to specify the decoding mode
+    that is expected for the buffer.
+    Drivers may expose a single or multiple decoding modes, depending
+    on what they can support.
+
+.. c:type:: v4l2_mpeg_video_h264_decode_mode
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED``
+      - 0
+      - Decoding is done at the slice granularity.
+        The OUTPUT buffer must contain a single slice.
+        When this mode is selected, the ``V4L2_CID_STATELESS_H264_SLICE_PARAMS``
+        control shall be set. When multiple slices compose a frame,
+        use of ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF`` flag
+        is required.
+    * - ``V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED``
+      - 1
+      - Decoding is done at the frame granularity,
+        The OUTPUT buffer must contain all slices needed to decode the
+        frame. The OUTPUT buffer must also contain both fields.
+        This mode will be supported by devices that
+        parse the slice(s) header(s) in hardware. When this mode is
+        selected, the ``V4L2_CID_STATELESS_H264_SLICE_PARAMS``
+        control shall not be set.
+
+``V4L2_CID_STATELESS_H264_START_CODE (enum)``
+    Specifies the H264 slice start code expected for each slice.
+    This control is used as a modifier for V4L2_PIX_FMT_H264_SLICE
+    pixel format. Applications that support V4L2_PIX_FMT_H264_SLICE
+    are required to set this control in order to specify the start code
+    that is expected for the buffer.
+    Drivers may expose a single or multiple start codes, depending
+    on what they can support.
+
+.. c:type:: v4l2_mpeg_video_h264_start_code
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_STATELESS_H264_START_CODE_NONE``
+      - 0
+      - Selecting this value specifies that H264 slices are passed
+        to the driver without any start code.
+    * - ``V4L2_STATELESS_H264_START_CODE_ANNEX_B``
+      - 1
+      - Selecting this value specifies that H264 slices are expected
+        to be prefixed by Annex B start codes. According to :ref:`h264`
+        valid start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001.
+
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index b31c52d9b1da..e815fffd1cd8 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1502,698 +1502,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       - Layer number
 
 
-.. _v4l2-mpeg-h264:
-
-``V4L2_CID_MPEG_VIDEO_H264_SPS (struct)``
-    Specifies the sequence parameter set (as extracted from the
-    bitstream) for the associated H264 slice data. This includes the
-    necessary parameters for configuring a stateless hardware decoding
-    pipeline for H264. The bitstream parameters are defined according
-    to :ref:`h264`, section 7.4.2.1.1 "Sequence Parameter Set Data
-    Semantics". For further documentation, refer to the above
-    specification, unless there is an explicit comment stating
-    otherwise.
-
-    .. note::
-
-       This compound control is not yet part of the public kernel API and
-       it is expected to change.
-
-.. c:type:: v4l2_ctrl_h264_sps
-
-.. cssclass:: longtable
-
-.. flat-table:: struct v4l2_ctrl_h264_sps
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - __u8
-      - ``profile_idc``
-      -
-    * - __u8
-      - ``constraint_set_flags``
-      - See :ref:`Sequence Parameter Set Constraints Set Flags <h264_sps_constraints_set_flags>`
-    * - __u8
-      - ``level_idc``
-      -
-    * - __u8
-      - ``seq_parameter_set_id``
-      -
-    * - __u8
-      - ``chroma_format_idc``
-      -
-    * - __u8
-      - ``bit_depth_luma_minus8``
-      -
-    * - __u8
-      - ``bit_depth_chroma_minus8``
-      -
-    * - __u8
-      - ``log2_max_frame_num_minus4``
-      -
-    * - __u8
-      - ``pic_order_cnt_type``
-      -
-    * - __u8
-      - ``log2_max_pic_order_cnt_lsb_minus4``
-      -
-    * - __u8
-      - ``max_num_ref_frames``
-      -
-    * - __u8
-      - ``num_ref_frames_in_pic_order_cnt_cycle``
-      -
-    * - __s32
-      - ``offset_for_ref_frame[255]``
-      -
-    * - __s32
-      - ``offset_for_non_ref_pic``
-      -
-    * - __s32
-      - ``offset_for_top_to_bottom_field``
-      -
-    * - __u16
-      - ``pic_width_in_mbs_minus1``
-      -
-    * - __u16
-      - ``pic_height_in_map_units_minus1``
-      -
-    * - __u32
-      - ``flags``
-      - See :ref:`Sequence Parameter Set Flags <h264_sps_flags>`
-
-.. _h264_sps_constraints_set_flags:
-
-``Sequence Parameter Set Constraints Set Flags``
-
-.. cssclass:: longtable
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - ``V4L2_H264_SPS_CONSTRAINT_SET0_FLAG``
-      - 0x00000001
-      -
-    * - ``V4L2_H264_SPS_CONSTRAINT_SET1_FLAG``
-      - 0x00000002
-      -
-    * - ``V4L2_H264_SPS_CONSTRAINT_SET2_FLAG``
-      - 0x00000004
-      -
-    * - ``V4L2_H264_SPS_CONSTRAINT_SET3_FLAG``
-      - 0x00000008
-      -
-    * - ``V4L2_H264_SPS_CONSTRAINT_SET4_FLAG``
-      - 0x00000010
-      -
-    * - ``V4L2_H264_SPS_CONSTRAINT_SET5_FLAG``
-      - 0x00000020
-      -
-
-.. _h264_sps_flags:
-
-``Sequence Parameter Set Flags``
-
-.. cssclass:: longtable
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - ``V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE``
-      - 0x00000001
-      -
-    * - ``V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS``
-      - 0x00000002
-      -
-    * - ``V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO``
-      - 0x00000004
-      -
-    * - ``V4L2_H264_SPS_FLAG_GAPS_IN_FRAME_NUM_VALUE_ALLOWED``
-      - 0x00000008
-      -
-    * - ``V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY``
-      - 0x00000010
-      -
-    * - ``V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD``
-      - 0x00000020
-      -
-    * - ``V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE``
-      - 0x00000040
-      -
-
-``V4L2_CID_MPEG_VIDEO_H264_PPS (struct)``
-    Specifies the picture parameter set (as extracted from the
-    bitstream) for the associated H264 slice data. This includes the
-    necessary parameters for configuring a stateless hardware decoding
-    pipeline for H264.  The bitstream parameters are defined according
-    to :ref:`h264`, section 7.4.2.2 "Picture Parameter Set RBSP
-    Semantics". For further documentation, refer to the above
-    specification, unless there is an explicit comment stating
-    otherwise.
-
-    .. note::
-
-       This compound control is not yet part of the public kernel API and
-       it is expected to change.
-
-.. c:type:: v4l2_ctrl_h264_pps
-
-.. cssclass:: longtable
-
-.. flat-table:: struct v4l2_ctrl_h264_pps
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - __u8
-      - ``pic_parameter_set_id``
-      -
-    * - __u8
-      - ``seq_parameter_set_id``
-      -
-    * - __u8
-      - ``num_slice_groups_minus1``
-      -
-    * - __u8
-      - ``num_ref_idx_l0_default_active_minus1``
-      -
-    * - __u8
-      - ``num_ref_idx_l1_default_active_minus1``
-      -
-    * - __u8
-      - ``weighted_bipred_idc``
-      -
-    * - __s8
-      - ``pic_init_qp_minus26``
-      -
-    * - __s8
-      - ``pic_init_qs_minus26``
-      -
-    * - __s8
-      - ``chroma_qp_index_offset``
-      -
-    * - __s8
-      - ``second_chroma_qp_index_offset``
-      -
-    * - __u16
-      - ``flags``
-      - See :ref:`Picture Parameter Set Flags <h264_pps_flags>`
-
-.. _h264_pps_flags:
-
-``Picture Parameter Set Flags``
-
-.. cssclass:: longtable
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - ``V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE``
-      - 0x00000001
-      -
-    * - ``V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT``
-      - 0x00000002
-      -
-    * - ``V4L2_H264_PPS_FLAG_WEIGHTED_PRED``
-      - 0x00000004
-      -
-    * - ``V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT``
-      - 0x00000008
-      -
-    * - ``V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED``
-      - 0x00000010
-      -
-    * - ``V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT``
-      - 0x00000020
-      -
-    * - ``V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE``
-      - 0x00000040
-      -
-    * - ``V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT``
-      - 0x00000080
-      - Indicates that ``V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX``
-        must be used for this picture.
-
-``V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX (struct)``
-    Specifies the scaling matrix (as extracted from the bitstream) for
-    the associated H264 slice data. The bitstream parameters are
-    defined according to :ref:`h264`, section 7.4.2.1.1.1 "Scaling
-    List Semantics". For further documentation, refer to the above
-    specification, unless there is an explicit comment stating
-    otherwise.
-
-    .. note::
-
-       This compound control is not yet part of the public kernel API and
-       it is expected to change.
-
-.. c:type:: v4l2_ctrl_h264_scaling_matrix
-
-.. cssclass:: longtable
-
-.. flat-table:: struct v4l2_ctrl_h264_scaling_matrix
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - __u8
-      - ``scaling_list_4x4[6][16]``
-      - Scaling matrix after applying the inverse scanning process.
-        Expected list order is Intra Y, Intra Cb, Intra Cr, Inter Y,
-        Inter Cb, Inter Cr. The values on each scaling list are
-        expected in raster scan order.
-    * - __u8
-      - ``scaling_list_8x8[6][64]``
-      - Scaling matrix after applying the inverse scanning process.
-        Expected list order is Intra Y, Inter Y, Intra Cb, Inter Cb,
-        Intra Cr, Inter Cr. The values on each scaling list are
-        expected in raster scan order.
-
-``V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS (struct)``
-    Specifies the slice parameters (as extracted from the bitstream)
-    for the associated H264 slice data. This includes the necessary
-    parameters for configuring a stateless hardware decoding pipeline
-    for H264.  The bitstream parameters are defined according to
-    :ref:`h264`, section 7.4.3 "Slice Header Semantics". For further
-    documentation, refer to the above specification, unless there is
-    an explicit comment stating otherwise.
-
-    .. note::
-
-       This compound control is not yet part of the public kernel API
-       and it is expected to change.
-
-.. c:type:: v4l2_ctrl_h264_slice_params
-
-.. cssclass:: longtable
-
-.. flat-table:: struct v4l2_ctrl_h264_slice_params
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - __u32
-      - ``header_bit_size``
-      - Offset in bits to slice_data() from the beginning of this slice.
-    * - __u32
-      - ``first_mb_in_slice``
-      -
-    * - __u8
-      - ``slice_type``
-      -
-    * - __u8
-      - ``colour_plane_id``
-      -
-    * - __u8
-      - ``redundant_pic_cnt``
-      -
-    * - __u8
-      - ``cabac_init_idc``
-      -
-    * - __s8
-      - ``slice_qp_delta``
-      -
-    * - __s8
-      - ``slice_qs_delta``
-      -
-    * - __u8
-      - ``disable_deblocking_filter_idc``
-      -
-    * - __s8
-      - ``slice_alpha_c0_offset_div2``
-      -
-    * - __s8
-      - ``slice_beta_offset_div2``
-      -
-    * - __u8
-      - ``num_ref_idx_l0_active_minus1``
-      - If num_ref_idx_active_override_flag is not set, this field must be
-        set to the value of num_ref_idx_l0_default_active_minus1.
-    * - __u8
-      - ``num_ref_idx_l1_active_minus1``
-      - If num_ref_idx_active_override_flag is not set, this field must be
-        set to the value of num_ref_idx_l1_default_active_minus1.
-    * - __u8
-      - ``reserved``
-      - Applications and drivers must set this to zero.
-    * - struct :c:type:`v4l2_h264_reference`
-      - ``ref_pic_list0[32]``
-      - Reference picture list after applying the per-slice modifications
-    * - struct :c:type:`v4l2_h264_reference`
-      - ``ref_pic_list1[32]``
-      - Reference picture list after applying the per-slice modifications
-    * - __u32
-      - ``flags``
-      - See :ref:`Slice Parameter Flags <h264_slice_flags>`
-
-.. _h264_slice_flags:
-
-``Slice Parameter Set Flags``
-
-.. cssclass:: longtable
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - ``V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED``
-      - 0x00000001
-      -
-    * - ``V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH``
-      - 0x00000002
-      -
-
-``V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS (struct)``
-    Prediction weight table defined according to :ref:`h264`,
-    section 7.4.3.2 "Prediction Weight Table Semantics".
-    The prediction weight table must be passed by applications
-    under the conditions explained in section 7.3.3 "Slice header
-    syntax".
-
-    .. note::
-
-       This compound control is not yet part of the public kernel API and
-       it is expected to change.
-
-.. c:type:: v4l2_ctrl_h264_pred_weights
-
-.. cssclass:: longtable
-
-.. flat-table:: struct v4l2_ctrl_h264_pred_weights
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - __u16
-      - ``luma_log2_weight_denom``
-      -
-    * - __u16
-      - ``chroma_log2_weight_denom``
-      -
-    * - struct :c:type:`v4l2_h264_weight_factors`
-      - ``weight_factors[2]``
-      - The weight factors at index 0 are the weight factors for the reference
-        list 0, the one at index 1 for the reference list 1.
-
-.. c:type:: v4l2_h264_weight_factors
-
-.. cssclass:: longtable
-
-.. flat-table:: struct v4l2_h264_weight_factors
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - __s16
-      - ``luma_weight[32]``
-      -
-    * - __s16
-      - ``luma_offset[32]``
-      -
-    * - __s16
-      - ``chroma_weight[32][2]``
-      -
-    * - __s16
-      - ``chroma_offset[32][2]``
-      -
-
-``Picture Reference``
-
-.. c:type:: v4l2_h264_reference
-
-.. cssclass:: longtable
-
-.. flat-table:: struct v4l2_h264_reference
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - __u8
-      - ``fields``
-      - Specifies how the picture is referenced. See :ref:`Reference Fields <h264_ref_fields>`
-    * - __u8
-      - ``index``
-      - Index into the :c:type:`v4l2_ctrl_h264_decode_params`.dpb array.
-
-.. _h264_ref_fields:
-
-``Reference Fields``
-
-.. cssclass:: longtable
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - ``V4L2_H264_TOP_FIELD_REF``
-      - 0x1
-      - The top field in field pair is used for short-term reference.
-    * - ``V4L2_H264_BOTTOM_FIELD_REF``
-      - 0x2
-      - The bottom field in field pair is used for short-term reference.
-    * - ``V4L2_H264_FRAME_REF``
-      - 0x3
-      - The frame (or the top/bottom fields, if it's a field pair)
-        is used for short-term reference.
-
-``V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS (struct)``
-    Specifies the decode parameters (as extracted from the bitstream)
-    for the associated H264 slice data. This includes the necessary
-    parameters for configuring a stateless hardware decoding pipeline
-    for H264. The bitstream parameters are defined according to
-    :ref:`h264`. For further documentation, refer to the above
-    specification, unless there is an explicit comment stating
-    otherwise.
-
-    .. note::
-
-       This compound control is not yet part of the public kernel API and
-       it is expected to change.
-
-.. c:type:: v4l2_ctrl_h264_decode_params
-
-.. cssclass:: longtable
-
-.. flat-table:: struct v4l2_ctrl_h264_decode_params
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - struct :c:type:`v4l2_h264_dpb_entry`
-      - ``dpb[16]``
-      -
-    * - __u16
-      - ``nal_ref_idc``
-      - NAL reference ID value coming from the NAL Unit header
-    * - __u16
-      - ``frame_num``
-      -
-    * - __s32
-      - ``top_field_order_cnt``
-      - Picture Order Count for the coded top field
-    * - __s32
-      - ``bottom_field_order_cnt``
-      - Picture Order Count for the coded bottom field
-    * - __u16
-      - ``idr_pic_id``
-      -
-    * - __u16
-      - ``pic_order_cnt_lsb``
-      -
-    * - __s32
-      - ``delta_pic_order_cnt_bottom``
-      -
-    * - __s32
-      - ``delta_pic_order_cnt0``
-      -
-    * - __s32
-      - ``delta_pic_order_cnt1``
-      -
-    * - __u32
-      - ``dec_ref_pic_marking_bit_size``
-      - Size in bits of the dec_ref_pic_marking() syntax element.
-    * - __u32
-      - ``pic_order_cnt_bit_size``
-      - Combined size in bits of the picture order count related syntax
-        elements: pic_order_cnt_lsb, delta_pic_order_cnt_bottom,
-        delta_pic_order_cnt0, and delta_pic_order_cnt1.
-    * - __u32
-      - ``slice_group_change_cycle``
-      -
-    * - __u32
-      - ``reserved``
-      - Applications and drivers must set this to zero.
-    * - __u32
-      - ``flags``
-      - See :ref:`Decode Parameters Flags <h264_decode_params_flags>`
-
-.. _h264_decode_params_flags:
-
-``Decode Parameters Flags``
-
-.. cssclass:: longtable
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - ``V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC``
-      - 0x00000001
-      - That picture is an IDR picture
-    * - ``V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC``
-      - 0x00000002
-      -
-    * - ``V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD``
-      - 0x00000004
-      -
-
-.. c:type:: v4l2_h264_dpb_entry
-
-.. cssclass:: longtable
-
-.. flat-table:: struct v4l2_h264_dpb_entry
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - __u64
-      - ``reference_ts``
-      - Timestamp of the V4L2 capture buffer to use as reference, used
-        with B-coded and P-coded frames. The timestamp refers to the
-        ``timestamp`` field in struct :c:type:`v4l2_buffer`. Use the
-        :c:func:`v4l2_timeval_to_ns()` function to convert the struct
-        :c:type:`timeval` in struct :c:type:`v4l2_buffer` to a __u64.
-    * - __u32
-      - ``pic_num``
-      -
-    * - __u16
-      - ``frame_num``
-      -
-    * - __u8
-      - ``fields``
-      - Specifies how the DPB entry is referenced. See :ref:`Reference Fields <h264_ref_fields>`
-    * - __u8
-      - ``reserved[5]``
-      - Applications and drivers must set this to zero.
-    * - __s32
-      - ``top_field_order_cnt``
-      -
-    * - __s32
-      - ``bottom_field_order_cnt``
-      -
-    * - __u32
-      - ``flags``
-      - See :ref:`DPB Entry Flags <h264_dpb_flags>`
-
-.. _h264_dpb_flags:
-
-``DPB Entries Flags``
-
-.. cssclass:: longtable
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - ``V4L2_H264_DPB_ENTRY_FLAG_VALID``
-      - 0x00000001
-      - The DPB entry is valid (non-empty) and should be considered.
-    * - ``V4L2_H264_DPB_ENTRY_FLAG_ACTIVE``
-      - 0x00000002
-      - The DPB entry is used for reference.
-    * - ``V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM``
-      - 0x00000004
-      - The DPB entry is used for long-term reference.
-    * - ``V4L2_H264_DPB_ENTRY_FLAG_FIELD``
-      - 0x00000008
-      - The DPB entry is a single field or a complementary field pair.
-
-``V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE (enum)``
-    Specifies the decoding mode to use. Currently exposes slice-based and
-    frame-based decoding but new modes might be added later on.
-    This control is used as a modifier for V4L2_PIX_FMT_H264_SLICE
-    pixel format. Applications that support V4L2_PIX_FMT_H264_SLICE
-    are required to set this control in order to specify the decoding mode
-    that is expected for the buffer.
-    Drivers may expose a single or multiple decoding modes, depending
-    on what they can support.
-
-    .. note::
-
-       This menu control is not yet part of the public kernel API and
-       it is expected to change.
-
-.. c:type:: v4l2_mpeg_video_h264_decode_mode
-
-.. cssclass:: longtable
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - ``V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED``
-      - 0
-      - Decoding is done at the slice granularity.
-        The OUTPUT buffer must contain a single slice.
-        When this mode is selected, the ``V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS``
-        control shall be set. When multiple slices compose a frame,
-        use of ``V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF`` flag
-        is required.
-    * - ``V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED``
-      - 1
-      - Decoding is done at the frame granularity,
-        The OUTPUT buffer must contain all slices needed to decode the
-        frame. The OUTPUT buffer must also contain both fields.
-        This mode will be supported by devices that
-        parse the slice(s) header(s) in hardware. When this mode is
-        selected, the ``V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS``
-        control shall not be set.
-
-``V4L2_CID_MPEG_VIDEO_H264_START_CODE (enum)``
-    Specifies the H264 slice start code expected for each slice.
-    This control is used as a modifier for V4L2_PIX_FMT_H264_SLICE
-    pixel format. Applications that support V4L2_PIX_FMT_H264_SLICE
-    are required to set this control in order to specify the start code
-    that is expected for the buffer.
-    Drivers may expose a single or multiple start codes, depending
-    on what they can support.
-
-    .. note::
-
-       This menu control is not yet part of the public kernel API and
-       it is expected to change.
-
-.. c:type:: v4l2_mpeg_video_h264_start_code
-
-.. cssclass:: longtable
-
-.. flat-table::
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - ``V4L2_MPEG_VIDEO_H264_START_CODE_NONE``
-      - 0
-      - Selecting this value specifies that H264 slices are passed
-        to the driver without any start code.
-    * - ``V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B``
-      - 1
-      - Selecting this value specifies that H264 slices are expected
-        to be prefixed by Annex B start codes. According to :ref:`h264`
-        valid start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001.
-
 .. _v4l2-mpeg-mpeg2:
 
 ``V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS (struct)``
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index d585909bc4e2..e28749ebf8d8 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -57,16 +57,16 @@ Compressed Formats
       - H264 parsed slice data, including slice headers, either with or
 	without the start code, as extracted from the H264 bitstream.
 	This format is adapted for stateless video decoders that implement an
-	H264 pipeline (using the :ref:`mem2mem` and :ref:`media-request-api`).
+	H264 pipeline with the :ref:`stateless_decoder`.
 	This pixelformat has two modifiers that must be set at least once
-	through the ``V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE``
-        and ``V4L2_CID_MPEG_VIDEO_H264_START_CODE`` controls.
+	through the ``V4L2_CID_STATELESS_H264_DECODE_MODE``
+        and ``V4L2_CID_STATELESS_H264_START_CODE`` controls.
 	In addition, metadata associated with the frame to decode are
-	required to be passed through the ``V4L2_CID_MPEG_VIDEO_H264_SPS``,
-	``V4L2_CID_MPEG_VIDEO_H264_PPS``,
-	``V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX``,
-	``V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS`` and
-	``V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS`` controls.  See the
+	required to be passed through the ``V4L2_CID_STATELESS_H264_SPS``,
+	``V4L2_CID_STATELESS_H264_PPS``,
+	``V4L2_CID_STATELESS_H264_SCALING_MATRIX``,
+	``V4L2_CID_STATELESS_H264_SLICE_PARAMS`` and
+	``V4L2_CID_STATELESS_H264_DECODE_PARAMS`` controls.  See the
 	:ref:`associated Codec Control IDs <v4l2-mpeg-h264>`.  Exactly
 	one output and one capture buffer must be provided for use
 	with this pixel format. The output buffer must contain the
@@ -77,11 +77,6 @@ Compressed Formats
 	7.3.2.8 "Slice layer without partitioning RBSP syntax" and the following
 	sections.
 
-	.. note::
-
-	   This format is not yet part of the public kernel API and it
-	   is expected to change.
-
     * .. _V4L2-PIX-FMT-H263:
 
       - ``V4L2_PIX_FMT_H263``
-- 
2.27.0

