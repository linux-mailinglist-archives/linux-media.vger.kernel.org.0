Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC670321686
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 13:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbhBVMZh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 07:25:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbhBVMZB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 07:25:01 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C9BC06178B;
        Mon, 22 Feb 2021 04:24:20 -0800 (PST)
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:5956:412c:4850:9073])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E7E461F44D68;
        Mon, 22 Feb 2021 12:24:17 +0000 (GMT)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, peng.fan@nxp.com,
        hverkuil-cisco@xs4all.nl, dan.carpenter@oracle.com
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 1/9] media: hevc: Modify structures to follow H265 ITU spec
Date:   Mon, 22 Feb 2021 13:23:58 +0100
Message-Id: <20210222122406.41782-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222122406.41782-1-benjamin.gaignard@collabora.com>
References: <20210222122406.41782-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The H.265 ITU specification (section 7.4) define the general
slice segment header semantics.
Modified/added fields are:
- video_parameter_set_id: (7.4.3.1) identifies the VPS for
reference by other syntax elements.
- seq_parameter_set_id: (7.4.3.2.1) specifies the value of
the vps_video_parameter_set_id of the active VPS.
- chroma_format_idc: (7.4.3.2.1) specifies the chroma sampling
 relative to the luma sampling
- pic_parameter_set_id: (7.4.3.3.1) identifies the PPS for
reference by other syntax elements
- num_ref_idx_l0_default_active_minus1: (7.4.3.3.1) specifies
the inferred value of num_ref_idx_l0_active_minus1
- num_ref_idx_l1_default_active_minus1: (7.4.3.3.1) specifies
the inferred value of num_ref_idx_l1_active_minus1
- slice_segment_addr: (7.4.7.1) specifies the address of
the first coding tree block in the slice segment
- num_entry_point_offsets: (7.4.7.1) specifies the number of
entry_point_offset_minus1[ i ] syntax elements in the slice header

Add HEVC decode params contains the information used in section
"8.3 Slice decoding process" of the specification to let the hardware
perform decoding of a slices.

Adapt Cedrus driver according to these changes.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 3:
- Add documentation about the new structuers and fields.

version 2:
- remove all change related to scaling
- squash commits to a coherent split
- be more verbose about the added fields

 .../media/v4l/ext-ctrls-codec.rst             | 126 +++++++++++++++---
 .../media/v4l/vidioc-queryctrl.rst            |   6 +
 drivers/media/v4l2-core/v4l2-ctrls.c          |  26 +++-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |   6 +
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   1 +
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |   2 +
 .../staging/media/sunxi/cedrus/cedrus_h265.c  |   6 +-
 include/media/hevc-ctrls.h                    |  45 +++++--
 8 files changed, 186 insertions(+), 32 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 00944e97d638..5e6d77e858c0 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -3109,6 +3109,15 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     :stub-columns: 0
     :widths:       1 1 2
 
+    * - __u8
+      - ``video_parameter_set_id``
+      - Identifies the VPS for reference by other syntax elements
+    * - __u8
+      - ``seq_parameter_set_id̀``
+      - Specifies the value of the vps_video_parameter_set_id of the active VPS
+    * - __u8
+      - ``chroma_format_idc``
+      - Specifies the chroma sampling relative to the luma sampling
     * - __u16
       - ``pic_width_in_luma_samples``
       -
@@ -3172,6 +3181,9 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     * - __u8
       - ``chroma_format_idc``
       -
+    * - __u8
+      - ``num_slices``
+      -
     * - __u64
       - ``flags``
       - See :ref:`Sequence Parameter Set Flags <hevc_sps_flags>`
@@ -3231,9 +3243,18 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     :stub-columns: 0
     :widths:       1 1 2
 
+    * - __u8
+      - ``pic_parameter_set_id``
+      - Identifies the PPS for reference by other syntax elements
     * - __u8
       - ``num_extra_slice_header_bits``
       -
+    * - __u8
+      - ``num_ref_idx_l0_default_active_minus1``
+      - Specifies the inferred value of num_ref_idx_l0_active_minus1
+    * - __u8
+      - ``num_ref_idx_l1_default_active_minus1``
+      - Specifies the inferred value of num_ref_idx_l1_active_minus1
     * - __s8
       - ``init_qp_minus26``
       -
@@ -3342,6 +3363,12 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     * - ``V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRESENT``
       - 0x00040000
       -
+    * - ``V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT``
+      - 0x00080000
+      -
+    * - ``V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING``
+      - 0x00100000
+      -
 
 ``V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS (struct)``
     Specifies various slice-specific parameters, especially from the NAL unit
@@ -3366,6 +3393,12 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     * - __u32
       - ``data_bit_offset``
       - Offset (in bits) to the video data in the current slice data.
+    * - __u32
+      - ``slice_segment_addr``
+      - Specifies the address of the first coding tree block in the slice segment
+    * - __u32
+      - ``num_entry_point_offsets``
+      - Specifies the number of entry_point_offset_minus1[ i ] syntax elements in the slice header
     * - __u8
       - ``nal_unit_type``
       -
@@ -3422,28 +3455,20 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     * - __u8
       - ``pic_struct``
       -
-    * - __u8
-      - ``num_active_dpb_entries``
-      - The number of entries in ``dpb``.
     * - __u8
       - ``ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
       - The list of L0 reference elements as indices in the DPB.
     * - __u8
       - ``ref_idx_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
       - The list of L1 reference elements as indices in the DPB.
+    * - __u16
+      - ``short_term_ref_pic_set_size``
+      -
+    * - __u16
+      - ``long_term_ref_pic_set_size``
+      -
     * - __u8
-      - ``num_rps_poc_st_curr_before``
-      - The number of reference pictures in the short-term set that come before
-        the current frame.
-    * - __u8
-      - ``num_rps_poc_st_curr_after``
-      - The number of reference pictures in the short-term set that come after
-        the current frame.
-    * - __u8
-      - ``num_rps_poc_lt_curr``
-      - The number of reference pictures in the long-term set.
-    * - __u8
-      - ``padding[7]``
+      - ``padding``
       - Applications and drivers must set this to zero.
     * - struct :c:type:`v4l2_hevc_dpb_entry`
       - ``dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
@@ -3646,3 +3671,74 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
     so this has to come from client.
     This is applicable to H264 and valid Range is from 0 to 63.
     Source Rec. ITU-T H.264 (06/2019); G.7.4.1.1, G.8.8.1.
+
+``V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS (struct)``
+    Specifies various decode parameters, especially the references picture order
+    count (POC) for all the lists (short, long, before, current, after) and the
+    number of entries for each of them.
+    These parameters are defined according to :ref:`hevc`.
+    They are described in section 8.3 "Slice decoding process" of the
+    specification.
+
+.. c:type:: v4l2_ctrl_hevc_decode_params
+
+.. cssclass:: longtable
+
+.. flat-table:: struct v4l2_ctrl_hevc_decode_params
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - __s32
+      - ``pic_order_cnt_val``
+      -
+    * - __u8
+      - ``num_active_dpb_entries``
+      - The number of entries in ``dpb``.
+    * - struct :c:type:`v4l2_hevc_dpb_entry`
+      - ``dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
+      - The decoded picture buffer, for meta-data about reference frames.
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
+      - ``rps_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
+      -
+    * - __u8
+      - ``rps_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
+      -
+    * - __u8
+      - ``rps_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
+      -
+    * - __u64
+      - ``flags``
+      - See :ref:`Decode Parameters Flags <hevc_decode_params_flags>`
+
+.. _hevc_decode_params_flags:
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
+    * - ``V4L2_HEVC_DECODE_PARAM_FLAG_IRAP_PIC``
+      - 0x00000001
+      -
+    * - ``V4L2_HEVC_DECODE_PARAM_FLAG_IDR_PIC``
+      - 0x00000002
+      -
+    * - ``V4L2_HEVC_DECODE_PARAM_FLAG_NO_OUTPUT_OF_PRIOR``
+      - 0x00000004
+      -
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 82f61f1e2fb8..d84ae255bc79 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -486,6 +486,12 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_ctrl_hevc_slice_params`, containing HEVC
 	slice parameters for stateless video decoders.
+    * - ``V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_ctrl_hevc_decode_params`, containing HEVC
+	decoding parameters for stateless video decoders.
 
 .. tabularcolumns:: |p{6.6cm}|p{2.2cm}|p{8.7cm}|
 
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 016cf6204cbb..4060b5bcc3c0 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1028,6 +1028,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_HEVC_SPS:			return "HEVC Sequence Parameter Set";
 	case V4L2_CID_MPEG_VIDEO_HEVC_PPS:			return "HEVC Picture Parameter Set";
 	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
+	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS:		return "HEVC Decode Parameters";
 	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
 	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
 
@@ -1482,6 +1483,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:
 		*type = V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS;
 		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS:
+		*type = V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS;
+		break;
 	case V4L2_CID_UNIT_CELL_SIZE:
 		*type = V4L2_CTRL_TYPE_AREA;
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
@@ -1833,6 +1837,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
 	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
 	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
+	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
 	struct v4l2_area *area;
 	void *p = ptr.p + idx * ctrl->elem_size;
 	unsigned int i;
@@ -2108,23 +2113,27 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		zero_padding(*p_hevc_pps);
 		break;
 
-	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
-		p_hevc_slice_params = p;
+	case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
+		p_hevc_decode_params = p;
 
-		if (p_hevc_slice_params->num_active_dpb_entries >
+		if (p_hevc_decode_params->num_active_dpb_entries >
 		    V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
 			return -EINVAL;
 
-		zero_padding(p_hevc_slice_params->pred_weight_table);
-
-		for (i = 0; i < p_hevc_slice_params->num_active_dpb_entries;
+		for (i = 0; i < p_hevc_decode_params->num_active_dpb_entries;
 		     i++) {
 			struct v4l2_hevc_dpb_entry *dpb_entry =
-				&p_hevc_slice_params->dpb[i];
+				&p_hevc_decode_params->dpb[i];
 
 			zero_padding(*dpb_entry);
 		}
 
+		break;
+
+	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
+		p_hevc_slice_params = p;
+
+		zero_padding(p_hevc_slice_params->pred_weight_table);
 		zero_padding(*p_hevc_slice_params);
 		break;
 
@@ -2821,6 +2830,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
 		elem_size = sizeof(struct v4l2_ctrl_hevc_slice_params);
 		break;
+	case V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS:
+		elem_size = sizeof(struct v4l2_ctrl_hevc_decode_params);
+		break;
 	case V4L2_CTRL_TYPE_AREA:
 		elem_size = sizeof(struct v4l2_area);
 		break;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 7bd9291c8d5f..4cd3cab1a257 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -151,6 +151,12 @@ static const struct cedrus_control cedrus_controls[] = {
 		},
 		.codec		= CEDRUS_CODEC_VP8,
 	},
+	{
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS,
+		},
+		.codec		= CEDRUS_CODEC_H265,
+	},
 };
 
 #define CEDRUS_CONTROLS_COUNT	ARRAY_SIZE(cedrus_controls)
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 251a6a660351..2ca33ac38b9a 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -76,6 +76,7 @@ struct cedrus_h265_run {
 	const struct v4l2_ctrl_hevc_sps			*sps;
 	const struct v4l2_ctrl_hevc_pps			*pps;
 	const struct v4l2_ctrl_hevc_slice_params	*slice_params;
+	const struct v4l2_ctrl_hevc_decode_params	*decode_params;
 };
 
 struct cedrus_vp8_run {
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
index a9090daf626a..cd821f417a14 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
@@ -68,6 +68,8 @@ void cedrus_device_run(void *priv)
 			V4L2_CID_MPEG_VIDEO_HEVC_PPS);
 		run.h265.slice_params = cedrus_find_control_data(ctx,
 			V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS);
+		run.h265.decode_params = cedrus_find_control_data(ctx,
+			V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS);
 		break;
 
 	case V4L2_PIX_FMT_VP8_FRAME:
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index ce497d0197df..dce5db6be13a 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -245,6 +245,7 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 	const struct v4l2_ctrl_hevc_sps *sps;
 	const struct v4l2_ctrl_hevc_pps *pps;
 	const struct v4l2_ctrl_hevc_slice_params *slice_params;
+	const struct v4l2_ctrl_hevc_decode_params *decode_params;
 	const struct v4l2_hevc_pred_weight_table *pred_weight_table;
 	dma_addr_t src_buf_addr;
 	dma_addr_t src_buf_end_addr;
@@ -256,6 +257,7 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 	sps = run->h265.sps;
 	pps = run->h265.pps;
 	slice_params = run->h265.slice_params;
+	decode_params = run->h265.decode_params;
 	pred_weight_table = &slice_params->pred_weight_table;
 
 	/* MV column buffer size and allocation. */
@@ -487,7 +489,7 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 
 	reg = VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_TC_OFFSET_DIV2(slice_params->slice_tc_offset_div2) |
 	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_BETA_OFFSET_DIV2(slice_params->slice_beta_offset_div2) |
-	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_POC_BIGEST_IN_RPS_ST(slice_params->num_rps_poc_st_curr_after == 0) |
+	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_POC_BIGEST_IN_RPS_ST(decode_params->num_rps_poc_st_curr_after == 0) |
 	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_CR_QP_OFFSET(slice_params->slice_cr_qp_offset) |
 	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_CB_QP_OFFSET(slice_params->slice_cb_qp_offset) |
 	      VE_DEC_H265_DEC_SLICE_HDR_INFO1_SLICE_QP_DELTA(slice_params->slice_qp_delta);
@@ -528,7 +530,7 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 
 	/* Write decoded picture buffer in pic list. */
 	cedrus_h265_frame_info_write_dpb(ctx, slice_params->dpb,
-					 slice_params->num_active_dpb_entries);
+					 decode_params->num_active_dpb_entries);
 
 	/* Output frame. */
 
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index b4cb2ef02f17..7fe704a08f77 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -19,6 +19,7 @@
 #define V4L2_CID_MPEG_VIDEO_HEVC_SPS		(V4L2_CID_CODEC_BASE + 1008)
 #define V4L2_CID_MPEG_VIDEO_HEVC_PPS		(V4L2_CID_CODEC_BASE + 1009)
 #define V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS	(V4L2_CID_CODEC_BASE + 1010)
+#define V4L2_CID_MPEG_VIDEO_HEVC_DECODE_PARAMS	(V4L2_CID_CODEC_BASE + 1012)
 #define V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE	(V4L2_CID_CODEC_BASE + 1015)
 #define V4L2_CID_MPEG_VIDEO_HEVC_START_CODE	(V4L2_CID_CODEC_BASE + 1016)
 
@@ -26,6 +27,7 @@
 #define V4L2_CTRL_TYPE_HEVC_SPS 0x0120
 #define V4L2_CTRL_TYPE_HEVC_PPS 0x0121
 #define V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS 0x0122
+#define V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS 0x0124
 
 enum v4l2_mpeg_video_hevc_decode_mode {
 	V4L2_MPEG_VIDEO_HEVC_DECODE_MODE_SLICE_BASED,
@@ -54,6 +56,9 @@ enum v4l2_mpeg_video_hevc_start_code {
 /* The controls are not stable at the moment and will likely be reworked. */
 struct v4l2_ctrl_hevc_sps {
 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Sequence parameter set */
+	__u8	video_parameter_set_id;
+	__u8	seq_parameter_set_id;
+	__u8	chroma_format_idc;
 	__u16	pic_width_in_luma_samples;
 	__u16	pic_height_in_luma_samples;
 	__u8	bit_depth_luma_minus8;
@@ -74,9 +79,9 @@ struct v4l2_ctrl_hevc_sps {
 	__u8	log2_diff_max_min_pcm_luma_coding_block_size;
 	__u8	num_short_term_ref_pic_sets;
 	__u8	num_long_term_ref_pics_sps;
-	__u8	chroma_format_idc;
 
-	__u8	padding;
+	__u8	num_slices;
+	__u8	padding[6];
 
 	__u64	flags;
 };
@@ -100,10 +105,15 @@ struct v4l2_ctrl_hevc_sps {
 #define V4L2_HEVC_PPS_FLAG_PPS_DISABLE_DEBLOCKING_FILTER	(1ULL << 16)
 #define V4L2_HEVC_PPS_FLAG_LISTS_MODIFICATION_PRESENT		(1ULL << 17)
 #define V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRESENT (1ULL << 18)
+#define V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT	(1ULL << 19)
+#define V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING			(1ULL << 20)
 
 struct v4l2_ctrl_hevc_pps {
 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Picture parameter set */
+	__u8	pic_parameter_set_id;
 	__u8	num_extra_slice_header_bits;
+	__u8	num_ref_idx_l0_default_active_minus1;
+	__u8	num_ref_idx_l1_default_active_minus1;
 	__s8	init_qp_minus26;
 	__u8	diff_cu_qp_delta_depth;
 	__s8	pps_cb_qp_offset;
@@ -116,7 +126,7 @@ struct v4l2_ctrl_hevc_pps {
 	__s8	pps_tc_offset_div2;
 	__u8	log2_parallel_merge_level_minus2;
 
-	__u8	padding[4];
+	__u8	padding;
 	__u64	flags;
 };
 
@@ -165,6 +175,10 @@ struct v4l2_ctrl_hevc_slice_params {
 	__u32	bit_size;
 	__u32	data_bit_offset;
 
+	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
+	__u32	slice_segment_addr;
+	__u32	num_entry_point_offsets;
+
 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: NAL unit header */
 	__u8	nal_unit_type;
 	__u8	nuh_temporal_id_plus1;
@@ -190,15 +204,13 @@ struct v4l2_ctrl_hevc_slice_params {
 	__u8	pic_struct;
 
 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
-	__u8	num_active_dpb_entries;
 	__u8	ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
 	__u8	ref_idx_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
 
-	__u8	num_rps_poc_st_curr_before;
-	__u8	num_rps_poc_st_curr_after;
-	__u8	num_rps_poc_lt_curr;
+	__u16	short_term_ref_pic_set_size;
+	__u16	long_term_ref_pic_set_size;
 
-	__u8	padding;
+	__u8	padding[5];
 
 	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
 	struct v4l2_hevc_dpb_entry dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
@@ -209,4 +221,21 @@ struct v4l2_ctrl_hevc_slice_params {
 	__u64	flags;
 };
 
+#define V4L2_HEVC_DECODE_PARAM_FLAG_IRAP_PIC		0x1
+#define V4L2_HEVC_DECODE_PARAM_FLAG_IDR_PIC		0x2
+#define V4L2_HEVC_DECODE_PARAM_FLAG_NO_OUTPUT_OF_PRIOR  0x4
+
+struct v4l2_ctrl_hevc_decode_params {
+	__s32	pic_order_cnt_val;
+	__u8	num_active_dpb_entries;
+	struct	v4l2_hevc_dpb_entry dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__u8	num_rps_poc_st_curr_before;
+	__u8	num_rps_poc_st_curr_after;
+	__u8	num_rps_poc_lt_curr;
+	__u8	rps_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__u8	rps_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__u8	rps_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__u64	flags;
+};
+
 #endif
-- 
2.25.1

