Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5C8123DFD1
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730078AbgHFRx5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 13:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728021AbgHFQaz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 12:30:55 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68182C0086D0;
        Thu,  6 Aug 2020 08:14:07 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 9CA8429959A
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 10/14] media: uapi: h264: Clean slice invariants syntax elements
Date:   Thu,  6 Aug 2020 12:13:06 -0300
Message-Id: <20200806151310.98624-11-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806151310.98624-1-ezequiel@collabora.com>
References: <20200806151310.98624-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The H.264 specification requires in section 7.4.3 "Slice header semantics",
that the following values shall be the same in all slice headers:

  pic_parameter_set_id
  frame_num
  field_pic_flag
  bottom_field_flag
  idr_pic_id
  pic_order_cnt_lsb
  delta_pic_order_cnt_bottom
  delta_pic_order_cnt[ 0 ]
  delta_pic_order_cnt[ 1 ]
  sp_for_switch_flag
  slice_group_change_cycle

These bitstream fields are part of the slice header, and therefore
passed redundantly on each slice. The purpose of the redundancy
is to make the codec fault-tolerant in network scenarios.

This is of course not needed to be reflected in the V4L2 controls,
given the bitstream has already been parsed by applications.
Therefore, move the redundant fields to the per-frame decode
parameters control (DECODE_PARAMS).

Field 'pic_parameter_set_id' is simply removed in this case,
because the PPS control must currently contain the active PPS.

Syntax elements dec_ref_pic_marking() and those related
to pic order count, remain invariant as well, and therefore,
the fields dec_ref_pic_marking_bit_size and pic_order_cnt_bit_size
are also common to all slices.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../media/v4l/ext-ctrls-codec.rst             | 86 +++++++++----------
 drivers/media/v4l2-core/v4l2-ctrls.c          |  7 ++
 drivers/media/v4l2-core/v4l2-h264.c           |  8 +-
 .../staging/media/hantro/hantro_g1_h264_dec.c | 21 +++--
 drivers/staging/media/hantro/hantro_h264.c    |  3 +-
 drivers/staging/media/rkvdec/rkvdec-h264.c    |  6 +-
 .../staging/media/sunxi/cedrus/cedrus_h264.c  |  9 +-
 include/media/h264-ctrls.h                    | 39 +++++----
 include/media/v4l2-h264.h                     |  1 -
 9 files changed, 90 insertions(+), 90 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index b3963c1acc2c..8761e6a4e130 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1766,44 +1766,12 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - __u8
       - ``slice_type``
       -
-    * - __u8
-      - ``pic_parameter_set_id``
-      -
     * - __u8
       - ``colour_plane_id``
       -
     * - __u8
       - ``redundant_pic_cnt``
       -
-    * - __u16
-      - ``frame_num``
-      -
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
-    * - struct :c:type:`v4l2_h264_pred_weight_table`
-      - ``pred_weight_table``
-      -
-    * - __u32
-      - ``dec_ref_pic_marking_bit_size``
-      - Size in bits of the dec_ref_pic_marking() syntax element.
-    * - __u32
-      - ``pic_order_cnt_bit_size``
-      - Combined size in bits of the picture order count related syntax
-        elements: pic_order_cnt_lsb, delta_pic_order_cnt_bottom,
-        delta_pic_order_cnt0, and delta_pic_order_cnt1.
     * - __u8
       - ``cabac_init_idc``
       -
@@ -1830,9 +1798,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       - ``num_ref_idx_l1_active_minus1``
       - If num_ref_idx_active_override_flag is not set, this field must be
         set to the value of num_ref_idx_l1_default_active_minus1.
-    * - __u32
-      - ``slice_group_change_cycle``
-      -
+    * - __u8
+      - ``reserved``
+      - Applications and drivers must set this to zero.
     * - struct :c:type:`v4l2_h264_reference`
       - ``ref_pic_list0[32]``
       - Reference picture list after applying the per-slice modifications
@@ -1854,17 +1822,11 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     :stub-columns: 0
     :widths:       1 1 2
 
-    * - ``V4L2_H264_SLICE_FLAG_FIELD_PIC``
-      - 0x00000001
-      -
-    * - ``V4L2_H264_SLICE_FLAG_BOTTOM_FIELD``
-      - 0x00000002
-      -
     * - ``V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED``
-      - 0x00000004
+      - 0x00000001
       -
     * - ``V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH``
-      - 0x00000008
+      - 0x00000002
       -
 
 ``V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS (struct)``
@@ -1990,12 +1952,44 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - __u16
       - ``nal_ref_idc``
       - NAL reference ID value coming from the NAL Unit header
+    * - __u16
+      - ``frame_num``
+      -
     * - __s32
       - ``top_field_order_cnt``
       - Picture Order Count for the coded top field
     * - __s32
       - ``bottom_field_order_cnt``
       - Picture Order Count for the coded bottom field
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
     * - __u32
       - ``flags``
       - See :ref:`Decode Parameters Flags <h264_decode_params_flags>`
@@ -2014,6 +2008,12 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - ``V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC``
       - 0x00000001
       - That picture is an IDR picture
+    * - ``V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC``
+      - 0x00000002
+      -
+    * - ``V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD``
+      - 0x00000004
+      -
 
 .. c:type:: v4l2_h264_dpb_entry
 
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index b9457789fa55..b846f5b089c9 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1737,6 +1737,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 {
 	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
 	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
+	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
 	struct v4l2_ctrl_h264_decode_params *p_h264_dec_params;
 	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
 	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
@@ -1798,7 +1799,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	case V4L2_CTRL_TYPE_H264_PPS:
 	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
 	case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
+		break;
+
 	case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
+		p_h264_slice_params = p;
+
+		zero_reserved(*p_h264_slice_params);
 		break;
 
 	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
@@ -1810,6 +1816,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 
 			zero_reserved(*dpb_entry);
 		}
+		zero_reserved(*p_h264_dec_params);
 		break;
 
 	case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
diff --git a/drivers/media/v4l2-core/v4l2-h264.c b/drivers/media/v4l2-core/v4l2-h264.c
index 1432810c1ce2..90d08de221ed 100644
--- a/drivers/media/v4l2-core/v4l2-h264.c
+++ b/drivers/media/v4l2-core/v4l2-h264.c
@@ -18,14 +18,12 @@
  *
  * @b: the builder context to initialize
  * @dec_params: decode parameters control
- * @slice_params: first slice parameters control
  * @sps: SPS control
  * @dpb: DPB to use when creating the reference list
  */
 void
 v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder *b,
 		const struct v4l2_ctrl_h264_decode_params *dec_params,
-		const struct v4l2_ctrl_h264_slice_params *slice_params,
 		const struct v4l2_ctrl_h264_sps *sps,
 		const struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES])
 {
@@ -33,13 +31,13 @@ v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder *b,
 	unsigned int i;
 
 	max_frame_num = 1 << (sps->log2_max_frame_num_minus4 + 4);
-	cur_frame_num = slice_params->frame_num;
+	cur_frame_num = dec_params->frame_num;
 
 	memset(b, 0, sizeof(*b));
-	if (!(slice_params->flags & V4L2_H264_SLICE_FLAG_FIELD_PIC))
+	if (!(dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC))
 		b->cur_pic_order_count = min(dec_params->bottom_field_order_cnt,
 					     dec_params->top_field_order_cnt);
-	else if (slice_params->flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
+	else if (dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD)
 		b->cur_pic_order_count = dec_params->bottom_field_order_cnt;
 	else
 		b->cur_pic_order_count = dec_params->top_field_order_cnt;
diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
index 424c648ce9fc..f9839e9c6da5 100644
--- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
@@ -23,7 +23,6 @@ static void set_params(struct hantro_ctx *ctx)
 {
 	const struct hantro_h264_dec_ctrls *ctrls = &ctx->h264_dec.ctrls;
 	const struct v4l2_ctrl_h264_decode_params *dec_param = ctrls->decode;
-	const struct v4l2_ctrl_h264_slice_params *slices = ctrls->slices;
 	const struct v4l2_ctrl_h264_sps *sps = ctrls->sps;
 	const struct v4l2_ctrl_h264_pps *pps = ctrls->pps;
 	struct vb2_v4l2_buffer *src_buf = hantro_get_src_buf(ctx);
@@ -42,11 +41,11 @@ static void set_params(struct hantro_ctx *ctx)
 
 	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) &&
 	    (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD ||
-	     slices[0].flags & V4L2_H264_SLICE_FLAG_FIELD_PIC))
+	     dec_param->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC))
 		reg |= G1_REG_DEC_CTRL0_PIC_INTERLACE_E;
-	if (slices[0].flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)
+	if (dec_param->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC)
 		reg |= G1_REG_DEC_CTRL0_PIC_FIELDMODE_E;
-	if (!(slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD))
+	if (!(dec_param->flags & V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD))
 		reg |= G1_REG_DEC_CTRL0_PIC_TOPFIELD_E;
 	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
 
@@ -75,7 +74,7 @@ static void set_params(struct hantro_ctx *ctx)
 
 	/* Decoder control register 4. */
 	reg = G1_REG_DEC_CTRL4_FRAMENUM_LEN(sps->log2_max_frame_num_minus4 + 4) |
-	      G1_REG_DEC_CTRL4_FRAMENUM(slices[0].frame_num) |
+	      G1_REG_DEC_CTRL4_FRAMENUM(dec_param->frame_num) |
 	      G1_REG_DEC_CTRL4_WEIGHT_BIPR_IDC(pps->weighted_bipred_idc);
 	if (pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE)
 		reg |= G1_REG_DEC_CTRL4_CABAC_E;
@@ -88,8 +87,8 @@ static void set_params(struct hantro_ctx *ctx)
 	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL4);
 
 	/* Decoder control register 5. */
-	reg = G1_REG_DEC_CTRL5_REFPIC_MK_LEN(slices[0].dec_ref_pic_marking_bit_size) |
-	      G1_REG_DEC_CTRL5_IDR_PIC_ID(slices[0].idr_pic_id);
+	reg = G1_REG_DEC_CTRL5_REFPIC_MK_LEN(dec_param->dec_ref_pic_marking_bit_size) |
+	      G1_REG_DEC_CTRL5_IDR_PIC_ID(dec_param->idr_pic_id);
 	if (pps->flags & V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED)
 		reg |= G1_REG_DEC_CTRL5_CONST_INTRA_E;
 	if (pps->flags & V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT)
@@ -103,10 +102,10 @@ static void set_params(struct hantro_ctx *ctx)
 	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL5);
 
 	/* Decoder control register 6. */
-	reg = G1_REG_DEC_CTRL6_PPS_ID(slices[0].pic_parameter_set_id) |
+	reg = G1_REG_DEC_CTRL6_PPS_ID(pps->pic_parameter_set_id) |
 	      G1_REG_DEC_CTRL6_REFIDX0_ACTIVE(pps->num_ref_idx_l0_default_active_minus1 + 1) |
 	      G1_REG_DEC_CTRL6_REFIDX1_ACTIVE(pps->num_ref_idx_l1_default_active_minus1 + 1) |
-	      G1_REG_DEC_CTRL6_POC_LENGTH(slices[0].pic_order_cnt_bit_size);
+	      G1_REG_DEC_CTRL6_POC_LENGTH(dec_param->pic_order_cnt_bit_size);
 	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL6);
 
 	/* Error concealment register. */
@@ -246,7 +245,7 @@ static void set_buffers(struct hantro_ctx *ctx)
 	/* Destination (decoded frame) buffer. */
 	dst_dma = hantro_get_dec_buf_addr(ctx, &dst_buf->vb2_buf);
 	/* Adjust dma addr to start at second line for bottom field */
-	if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
+	if (ctrls->decode->flags & V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD)
 		offset = ALIGN(ctx->src_fmt.width, MB_DIM);
 	vdpu_write_relaxed(vpu, dst_dma + offset, G1_REG_ADDR_DST);
 
@@ -265,7 +264,7 @@ static void set_buffers(struct hantro_ctx *ctx)
 		 * DMV buffer is split in two for field encoded frames,
 		 * adjust offset for bottom field
 		 */
-		if (ctrls->slices[0].flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
+		if (ctrls->decode->flags & V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD)
 			offset += 32 * MB_WIDTH(ctx->src_fmt.width) *
 				  MB_HEIGHT(ctx->src_fmt.height);
 		vdpu_write_relaxed(vpu, dst_dma + offset, G1_REG_ADDR_DIR_MV);
diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
index 194d05848077..0cbe514dc79a 100644
--- a/drivers/staging/media/hantro/hantro_h264.c
+++ b/drivers/staging/media/hantro/hantro_h264.c
@@ -372,8 +372,7 @@ int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx)
 
 	/* Build the P/B{0,1} ref lists. */
 	v4l2_h264_init_reflist_builder(&reflist_builder, ctrls->decode,
-				       &ctrls->slices[0], ctrls->sps,
-				       ctx->h264_dec.dpb);
+				       ctrls->sps, ctx->h264_dec.dpb);
 	v4l2_h264_build_p_ref_list(&reflist_builder, h264_ctx->reflists.p);
 	v4l2_h264_build_b_ref_lists(&reflist_builder, h264_ctx->reflists.b0,
 				    h264_ctx->reflists.b1);
diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 7e555f18e357..33e1d10f6253 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -730,7 +730,6 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
 			    struct rkvdec_h264_run *run)
 {
 	const struct v4l2_ctrl_h264_decode_params *dec_params = run->decode_params;
-	const struct v4l2_ctrl_h264_slice_params *sl_params = &run->slices_params[0];
 	const struct v4l2_h264_dpb_entry *dpb = dec_params->dpb;
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	const struct v4l2_ctrl_h264_sps *sps = run->sps;
@@ -754,7 +753,7 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
 			continue;
 
 		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM ||
-		    dpb[i].frame_num < sl_params->frame_num) {
+		    dpb[i].frame_num < dec_params->frame_num) {
 			p[i] = dpb[i].frame_num;
 			continue;
 		}
@@ -1094,8 +1093,7 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
 
 	/* Build the P/B{0,1} ref lists. */
 	v4l2_h264_init_reflist_builder(&reflist_builder, run.decode_params,
-				       &run.slices_params[0], run.sps,
-				       run.decode_params->dpb);
+				       run.sps, run.decode_params->dpb);
 	h264_ctx->reflists.num_valid = reflist_builder.num_valid;
 	v4l2_h264_build_p_ref_list(&reflist_builder, h264_ctx->reflists.p);
 	v4l2_h264_build_b_ref_lists(&reflist_builder, h264_ctx->reflists.b0,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index 8b6f05aadbe8..8e31f81358b7 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -95,7 +95,6 @@ static void cedrus_write_frame_list(struct cedrus_ctx *ctx,
 {
 	struct cedrus_h264_sram_ref_pic pic_list[CEDRUS_H264_FRAME_NUM];
 	const struct v4l2_ctrl_h264_decode_params *decode = run->h264.decode_params;
-	const struct v4l2_ctrl_h264_slice_params *slice = run->h264.slice_params;
 	const struct v4l2_ctrl_h264_sps *sps = run->h264.sps;
 	struct vb2_queue *cap_q;
 	struct cedrus_buffer *output_buf;
@@ -144,7 +143,7 @@ static void cedrus_write_frame_list(struct cedrus_ctx *ctx,
 	output_buf = vb2_to_cedrus_buffer(&run->dst->vb2_buf);
 	output_buf->codec.h264.position = position;
 
-	if (slice->flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)
+	if (decode->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC)
 		output_buf->codec.h264.pic_type = CEDRUS_H264_PIC_TYPE_FIELD;
 	else if (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD)
 		output_buf->codec.h264.pic_type = CEDRUS_H264_PIC_TYPE_MBAFF;
@@ -411,7 +410,7 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
 		reg |= VE_H264_SPS_DIRECT_8X8_INFERENCE;
 	cedrus_write(dev, VE_H264_SPS, reg);
 
-	mbaff_pic = !(slice->flags & V4L2_H264_SLICE_FLAG_FIELD_PIC) &&
+	mbaff_pic = !(decode->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC) &&
 		    (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD);
 	pic_width_in_mbs = sps->pic_width_in_mbs_minus1 + 1;
 
@@ -425,9 +424,9 @@ static void cedrus_set_params(struct cedrus_ctx *ctx,
 	reg |= slice->cabac_init_idc & 0x3;
 	if (ctx->fh.m2m_ctx->new_frame)
 		reg |= VE_H264_SHS_FIRST_SLICE_IN_PIC;
-	if (slice->flags & V4L2_H264_SLICE_FLAG_FIELD_PIC)
+	if (decode->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC)
 		reg |= VE_H264_SHS_FIELD_PIC;
-	if (slice->flags & V4L2_H264_SLICE_FLAG_BOTTOM_FIELD)
+	if (decode->flags & V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD)
 		reg |= VE_H264_SHS_BOTTOM_FIELD;
 	if (slice->flags & V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED)
 		reg |= VE_H264_SHS_DIRECT_SPATIAL_MV_PRED;
diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index ea8c8c93305b..fa5663876e73 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -139,10 +139,8 @@ struct v4l2_ctrl_h264_pred_weights {
 #define V4L2_H264_SLICE_TYPE_SP				3
 #define V4L2_H264_SLICE_TYPE_SI				4
 
-#define V4L2_H264_SLICE_FLAG_FIELD_PIC			0x01
-#define V4L2_H264_SLICE_FLAG_BOTTOM_FIELD		0x02
-#define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED	0x04
-#define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH		0x08
+#define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED	0x01
+#define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH		0x02
 
 enum v4l2_h264_dpb_reference {
 	V4L2_H264_DPB_TOP_REF = 0x1,
@@ -164,21 +162,8 @@ struct v4l2_ctrl_h264_slice_params {
 	__u32 first_mb_in_slice;
 
 	__u8 slice_type;
-	__u8 pic_parameter_set_id;
 	__u8 colour_plane_id;
 	__u8 redundant_pic_cnt;
-	__u16 frame_num;
-	__u16 idr_pic_id;
-	__u16 pic_order_cnt_lsb;
-	__s32 delta_pic_order_cnt_bottom;
-	__s32 delta_pic_order_cnt0;
-	__s32 delta_pic_order_cnt1;
-
-	/* Size in bits of dec_ref_pic_marking() syntax element. */
-	__u32 dec_ref_pic_marking_bit_size;
-	/* Size in bits of pic order count syntax. */
-	__u32 pic_order_cnt_bit_size;
-
 	__u8 cabac_init_idc;
 	__s8 slice_qp_delta;
 	__s8 slice_qs_delta;
@@ -187,7 +172,8 @@ struct v4l2_ctrl_h264_slice_params {
 	__s8 slice_beta_offset_div2;
 	__u8 num_ref_idx_l0_active_minus1;
 	__u8 num_ref_idx_l1_active_minus1;
-	__u32 slice_group_change_cycle;
+
+	__u8 reserved;
 
 	struct v4l2_h264_reference ref_pic_list0[V4L2_H264_REF_LIST_LEN];
 	struct v4l2_h264_reference ref_pic_list1[V4L2_H264_REF_LIST_LEN];
@@ -212,13 +198,28 @@ struct v4l2_h264_dpb_entry {
 	__u32 flags; /* V4L2_H264_DPB_ENTRY_FLAG_* */
 };
 
-#define V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC	0x01
+#define V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC		0x01
+#define V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC		0x02
+#define V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD	0x04
 
 struct v4l2_ctrl_h264_decode_params {
 	struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES];
 	__u16 nal_ref_idc;
+	__u16 frame_num;
 	__s32 top_field_order_cnt;
 	__s32 bottom_field_order_cnt;
+	__u16 idr_pic_id;
+	__u16 pic_order_cnt_lsb;
+	__s32 delta_pic_order_cnt_bottom;
+	__s32 delta_pic_order_cnt0;
+	__s32 delta_pic_order_cnt1;
+	/* Size in bits of dec_ref_pic_marking() syntax element. */
+	__u32 dec_ref_pic_marking_bit_size;
+	/* Size in bits of pic order count syntax. */
+	__u32 pic_order_cnt_bit_size;
+	__u32 slice_group_change_cycle;
+
+	__u32 reserved;
 	__u32 flags; /* V4L2_H264_DECODE_PARAM_FLAG_* */
 };
 
diff --git a/include/media/v4l2-h264.h b/include/media/v4l2-h264.h
index 1a5f26fc2a9a..f08ba181263d 100644
--- a/include/media/v4l2-h264.h
+++ b/include/media/v4l2-h264.h
@@ -44,7 +44,6 @@ struct v4l2_h264_reflist_builder {
 void
 v4l2_h264_init_reflist_builder(struct v4l2_h264_reflist_builder *b,
 		const struct v4l2_ctrl_h264_decode_params *dec_params,
-		const struct v4l2_ctrl_h264_slice_params *slice_params,
 		const struct v4l2_ctrl_h264_sps *sps,
 		const struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES]);
 
-- 
2.27.0

