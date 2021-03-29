Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2D834D6B5
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 20:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbhC2SOm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 14:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbhC2SOO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 14:14:14 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32DDC061574;
        Mon, 29 Mar 2021 11:14:13 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 183C61F455BD
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v4 2/9] media: uapi: mpeg2: Cleanup flags
Date:   Mon, 29 Mar 2021 15:13:22 -0300
Message-Id: <20210329181329.48006-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210329181329.48006-1-ezequiel@collabora.com>
References: <20210329181329.48006-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Our current MPEG-2 uAPI uses 1-byte fields for MPEG-2
boolean syntax elements. Clean these by adding a 'flags'
field and flag macro for each boolean syntax element.

A follow-up change will refactor this uAPI so we don't need
to add padding fields just yet.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Tested-by: Jonas Karlman <jonas@kwiboo.se>
---
 .../media/v4l/ext-ctrls-codec.rst             | 77 +++++++++++++------
 drivers/media/v4l2-core/v4l2-ctrls.c          | 14 ++--
 .../media/hantro/hantro_g1_mpeg2_dec.c        | 76 +++++++++---------
 .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    | 76 +++++++++---------
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 38 ++++-----
 include/media/mpeg2-ctrls.h                   | 36 +++++----
 6 files changed, 175 insertions(+), 142 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 29d017654141..2289e1279fa5 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1654,13 +1654,28 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       - ``profile_and_level_indication``
       - The current profile and level indication as extracted from the
 	bitstream.
-    * - __u8
-      - ``progressive_sequence``
-      - Indication that all the frames for the sequence are progressive instead
-	of interlaced.
     * - __u8
       - ``chroma_format``
       - The chrominance sub-sampling format (1: 4:2:0, 2: 4:2:2, 3: 4:4:4).
+    * - __u32
+      - ``flags``
+      - See :ref:`MPEG-2 Sequence Flags <mpeg2_sequence_flags>`.
+
+.. _mpeg2_sequence_flags:
+
+``MPEG-2 Sequence Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE``
+      - 0x00000001
+      - Indication that all the frames for the sequence are progressive instead
+	of interlaced.
 
 .. c:type:: v4l2_mpeg2_picture
 
@@ -1693,29 +1708,45 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       - ``picture_structure``
       - Picture structure (1: interlaced top field, 2: interlaced bottom field,
 	3: progressive frame).
-    * - __u8
-      - ``top_field_first``
-      - If set to 1 and interlaced stream, top field is output first.
-    * - __u8
-      - ``frame_pred_frame_dct``
-      - If set to 1, only frame-DCT and frame prediction are used.
-    * - __u8
-      - ``concealment_motion_vectors``
-      -  If set to 1, motion vectors are coded for intra macroblocks.
-    * - __u8
-      - ``q_scale_type``
+    * - __u32
+      - ``flags``
+      - See :ref:`MPEG-2 Picture Flags <mpeg2_picture_flags>`.
+
+
+.. _mpeg2_picture_flags:
+
+``MPEG-2 Picture Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST``
+      - 0x00000001
+      - If set and it's an interlaced stream, top field is output first.
+    * - ``V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT``
+      - 0x00000002
+      - If set only frame-DCT and frame prediction are used.
+    * - ``V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV``
+      - 0x00000004
+      -  If set motion vectors are coded for intra macroblocks.
+    * - ``V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE``
+      - 0x00000008
       - This flag affects the inverse quantization process.
-    * - __u8
-      - ``intra_vlc_format``
+    * - ``V4L2_MPEG2_PIC_FLAG_INTRA_VLC``
+      - 0x00000010
       - This flag affects the decoding of transform coefficient data.
-    * - __u8
-      - ``alternate_scan``
+    * - ``V4L2_MPEG2_PIC_FLAG_ALT_SCAN``
+      - 0x00000020
       - This flag affects the decoding of transform coefficient data.
-    * - __u8
-      - ``repeat_first_field``
+    * - ``V4L2_MPEG2_PIC_FLAG_REPEAT_FIRST``
+      - 0x00000040
       - This flag affects the decoding process of progressive frames.
-    * - __u16
-      - ``progressive_frame``
+    * - ``V4L2_MPEG2_PIC_FLAG_PROGRESSIVE``
+      - 0x00000080
       - Indicates whether the current frame is progressive.
 
 .. raw:: latex
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 6da4f994e1fc..a265574eea5c 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1691,7 +1691,7 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		/* interlaced top field */
 		p_mpeg2_slice_params->picture.picture_structure = 1;
 		p_mpeg2_slice_params->picture.picture_coding_type =
-					V4L2_MPEG2_PICTURE_CODING_TYPE_I;
+					V4L2_MPEG2_PIC_CODING_TYPE_I;
 		break;
 	case V4L2_CTRL_TYPE_MPEG2_QUANTIZATION:
 		p_mpeg2_quant = p;
@@ -1901,18 +1901,18 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		}
 
 		switch (p_mpeg2_slice_params->picture.picture_structure) {
-		case 1: /* interlaced top field */
-		case 2: /* interlaced bottom field */
-		case 3: /* progressive */
+		case V4L2_MPEG2_PIC_TOP_FIELD:
+		case V4L2_MPEG2_PIC_BOTTOM_FIELD:
+		case V4L2_MPEG2_PIC_FRAME:
 			break;
 		default:
 			return -EINVAL;
 		}
 
 		switch (p_mpeg2_slice_params->picture.picture_coding_type) {
-		case V4L2_MPEG2_PICTURE_CODING_TYPE_I:
-		case V4L2_MPEG2_PICTURE_CODING_TYPE_P:
-		case V4L2_MPEG2_PICTURE_CODING_TYPE_B:
+		case V4L2_MPEG2_PIC_CODING_TYPE_I:
+		case V4L2_MPEG2_PIC_CODING_TYPE_P:
+		case V4L2_MPEG2_PIC_CODING_TYPE_B:
 			break;
 		default:
 			return -EINVAL;
diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
index 6386a3989bfe..9fe442244eb9 100644
--- a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
@@ -77,10 +77,6 @@
 
 #define G1_REG_APF_THRESHOLD(v)		(((v) << 0) & GENMASK(13, 0))
 
-#define PICT_TOP_FIELD     1
-#define PICT_BOTTOM_FIELD  2
-#define PICT_FRAME         3
-
 static void
 hantro_g1_mpeg2_dec_set_quantization(struct hantro_dev *vpu,
 				     struct hantro_ctx *ctx)
@@ -99,19 +95,19 @@ static void
 hantro_g1_mpeg2_dec_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx,
 				struct vb2_buffer *src_buf,
 				struct vb2_buffer *dst_buf,
-				const struct v4l2_mpeg2_sequence *sequence,
-				const struct v4l2_mpeg2_picture *picture,
+				const struct v4l2_mpeg2_sequence *seq,
+				const struct v4l2_mpeg2_picture *pic,
 				const struct v4l2_ctrl_mpeg2_slice_params *slice_params)
 {
 	dma_addr_t forward_addr = 0, backward_addr = 0;
 	dma_addr_t current_addr, addr;
 
-	switch (picture->picture_coding_type) {
-	case V4L2_MPEG2_PICTURE_CODING_TYPE_B:
+	switch (pic->picture_coding_type) {
+	case V4L2_MPEG2_PIC_CODING_TYPE_B:
 		backward_addr = hantro_get_ref(ctx,
 					       slice_params->backward_ref_ts);
 		fallthrough;
-	case V4L2_MPEG2_PICTURE_CODING_TYPE_P:
+	case V4L2_MPEG2_PIC_CODING_TYPE_P:
 		forward_addr = hantro_get_ref(ctx,
 					      slice_params->forward_ref_ts);
 	}
@@ -124,7 +120,7 @@ hantro_g1_mpeg2_dec_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx,
 	addr = hantro_get_dec_buf_addr(ctx, dst_buf);
 	current_addr = addr;
 
-	if (picture->picture_structure == PICT_BOTTOM_FIELD)
+	if (pic->picture_structure == V4L2_MPEG2_PIC_BOTTOM_FIELD)
 		addr += ALIGN(ctx->dst_fmt.width, 16);
 	vdpu_write_relaxed(vpu, addr, G1_REG_DEC_OUT_BASE);
 
@@ -134,18 +130,18 @@ hantro_g1_mpeg2_dec_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx,
 		backward_addr = current_addr;
 
 	/* Set forward ref frame (top/bottom field) */
-	if (picture->picture_structure == PICT_FRAME ||
-	    picture->picture_coding_type == V4L2_MPEG2_PICTURE_CODING_TYPE_B ||
-	    (picture->picture_structure == PICT_TOP_FIELD &&
-	     picture->top_field_first) ||
-	    (picture->picture_structure == PICT_BOTTOM_FIELD &&
-	     !picture->top_field_first)) {
+	if (pic->picture_structure == V4L2_MPEG2_PIC_FRAME ||
+	    pic->picture_coding_type == V4L2_MPEG2_PIC_CODING_TYPE_B ||
+	    (pic->picture_structure == V4L2_MPEG2_PIC_TOP_FIELD &&
+	     pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST) ||
+	    (pic->picture_structure == V4L2_MPEG2_PIC_BOTTOM_FIELD &&
+	     !(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST))) {
 		vdpu_write_relaxed(vpu, forward_addr, G1_REG_REFER0_BASE);
 		vdpu_write_relaxed(vpu, forward_addr, G1_REG_REFER1_BASE);
-	} else if (picture->picture_structure == PICT_TOP_FIELD) {
+	} else if (pic->picture_structure == V4L2_MPEG2_PIC_TOP_FIELD) {
 		vdpu_write_relaxed(vpu, forward_addr, G1_REG_REFER0_BASE);
 		vdpu_write_relaxed(vpu, current_addr, G1_REG_REFER1_BASE);
-	} else if (picture->picture_structure == PICT_BOTTOM_FIELD) {
+	} else if (pic->picture_structure == V4L2_MPEG2_PIC_BOTTOM_FIELD) {
 		vdpu_write_relaxed(vpu, current_addr, G1_REG_REFER0_BASE);
 		vdpu_write_relaxed(vpu, forward_addr, G1_REG_REFER1_BASE);
 	}
@@ -160,8 +156,8 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	const struct v4l2_ctrl_mpeg2_slice_params *slice_params;
-	const struct v4l2_mpeg2_sequence *sequence;
-	const struct v4l2_mpeg2_picture *picture;
+	const struct v4l2_mpeg2_sequence *seq;
+	const struct v4l2_mpeg2_picture *pic;
 	u32 reg;
 
 	src_buf = hantro_get_src_buf(ctx);
@@ -172,8 +168,8 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	slice_params = hantro_get_ctrl(ctx,
 				       V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
-	sequence = &slice_params->sequence;
-	picture = &slice_params->picture;
+	seq = &slice_params->sequence;
+	pic = &slice_params->picture;
 
 	reg = G1_REG_DEC_AXI_RD_ID(0) |
 	      G1_REG_DEC_TIMEOUT_E(1) |
@@ -193,11 +189,11 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	reg = G1_REG_DEC_MODE(5) |
 	      G1_REG_RLC_MODE_E(0) |
-	      G1_REG_PIC_INTERLACE_E(!sequence->progressive_sequence) |
-	      G1_REG_PIC_FIELDMODE_E(picture->picture_structure != PICT_FRAME) |
-	      G1_REG_PIC_B_E(picture->picture_coding_type == V4L2_MPEG2_PICTURE_CODING_TYPE_B) |
-	      G1_REG_PIC_INTER_E(picture->picture_coding_type != V4L2_MPEG2_PICTURE_CODING_TYPE_I) |
-	      G1_REG_PIC_TOPFIELD_E(picture->picture_structure == PICT_TOP_FIELD) |
+	      G1_REG_PIC_INTERLACE_E(!(seq->flags & V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE)) |
+	      G1_REG_PIC_FIELDMODE_E(pic->picture_structure != V4L2_MPEG2_PIC_FRAME) |
+	      G1_REG_PIC_B_E(pic->picture_coding_type == V4L2_MPEG2_PIC_CODING_TYPE_B) |
+	      G1_REG_PIC_INTER_E(pic->picture_coding_type != V4L2_MPEG2_PIC_CODING_TYPE_I) |
+	      G1_REG_PIC_TOPFIELD_E(pic->picture_structure == V4L2_MPEG2_PIC_TOP_FIELD) |
 	      G1_REG_FWD_INTERLACE_E(0) |
 	      G1_REG_FILTERING_DIS(1) |
 	      G1_REG_WRITE_MVS_E(0) |
@@ -206,27 +202,27 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	reg = G1_REG_PIC_MB_WIDTH(MB_WIDTH(ctx->dst_fmt.width)) |
 	      G1_REG_PIC_MB_HEIGHT_P(MB_HEIGHT(ctx->dst_fmt.height)) |
-	      G1_REG_ALT_SCAN_E(picture->alternate_scan) |
-	      G1_REG_TOPFIELDFIRST_E(picture->top_field_first);
+	      G1_REG_ALT_SCAN_E(pic->flags & V4L2_MPEG2_PIC_FLAG_ALT_SCAN) |
+	      G1_REG_TOPFIELDFIRST_E(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
 	vdpu_write_relaxed(vpu, reg, G1_SWREG(4));
 
 	reg = G1_REG_STRM_START_BIT(slice_params->data_bit_offset) |
-	      G1_REG_QSCALE_TYPE(picture->q_scale_type) |
-	      G1_REG_CON_MV_E(picture->concealment_motion_vectors) |
-	      G1_REG_INTRA_DC_PREC(picture->intra_dc_precision) |
-	      G1_REG_INTRA_VLC_TAB(picture->intra_vlc_format) |
-	      G1_REG_FRAME_PRED_DCT(picture->frame_pred_frame_dct);
+	      G1_REG_QSCALE_TYPE(pic->flags & V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE) |
+	      G1_REG_CON_MV_E(pic->flags & V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV) |
+	      G1_REG_INTRA_DC_PREC(pic->intra_dc_precision) |
+	      G1_REG_INTRA_VLC_TAB(pic->flags & V4L2_MPEG2_PIC_FLAG_INTRA_VLC) |
+	      G1_REG_FRAME_PRED_DCT(pic->flags & V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT);
 	vdpu_write_relaxed(vpu, reg, G1_SWREG(5));
 
 	reg = G1_REG_INIT_QP(1) |
 	      G1_REG_STREAM_LEN(slice_params->bit_size >> 3);
 	vdpu_write_relaxed(vpu, reg, G1_SWREG(6));
 
-	reg = G1_REG_ALT_SCAN_FLAG_E(picture->alternate_scan) |
-	      G1_REG_FCODE_FWD_HOR(picture->f_code[0][0]) |
-	      G1_REG_FCODE_FWD_VER(picture->f_code[0][1]) |
-	      G1_REG_FCODE_BWD_HOR(picture->f_code[1][0]) |
-	      G1_REG_FCODE_BWD_VER(picture->f_code[1][1]) |
+	reg = G1_REG_ALT_SCAN_FLAG_E(pic->flags & V4L2_MPEG2_PIC_FLAG_ALT_SCAN) |
+	      G1_REG_FCODE_FWD_HOR(pic->f_code[0][0]) |
+	      G1_REG_FCODE_FWD_VER(pic->f_code[0][1]) |
+	      G1_REG_FCODE_BWD_HOR(pic->f_code[1][0]) |
+	      G1_REG_FCODE_BWD_VER(pic->f_code[1][1]) |
 	      G1_REG_MV_ACCURACY_FWD(1) |
 	      G1_REG_MV_ACCURACY_BWD(1);
 	vdpu_write_relaxed(vpu, reg, G1_SWREG(18));
@@ -242,7 +238,7 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	hantro_g1_mpeg2_dec_set_buffers(vpu, ctx, &src_buf->vb2_buf,
 					&dst_buf->vb2_buf,
-					sequence, picture, slice_params);
+					seq, pic, slice_params);
 
 	hantro_end_prepare_run(ctx);
 
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
index f610fa5b4335..9fdbf942cb99 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
@@ -79,10 +79,6 @@
 #define VDPU_REG_MV_ACCURACY_FWD(v)	((v) ? BIT(2) : 0)
 #define VDPU_REG_MV_ACCURACY_BWD(v)	((v) ? BIT(1) : 0)
 
-#define PICT_TOP_FIELD     1
-#define PICT_BOTTOM_FIELD  2
-#define PICT_FRAME         3
-
 static void
 rk3399_vpu_mpeg2_dec_set_quantization(struct hantro_dev *vpu,
 				      struct hantro_ctx *ctx)
@@ -101,19 +97,19 @@ rk3399_vpu_mpeg2_dec_set_buffers(struct hantro_dev *vpu,
 				 struct hantro_ctx *ctx,
 				 struct vb2_buffer *src_buf,
 				 struct vb2_buffer *dst_buf,
-				 const struct v4l2_mpeg2_sequence *sequence,
-				 const struct v4l2_mpeg2_picture *picture,
+				 const struct v4l2_mpeg2_sequence *seq,
+				 const struct v4l2_mpeg2_picture *pic,
 				 const struct v4l2_ctrl_mpeg2_slice_params *slice_params)
 {
 	dma_addr_t forward_addr = 0, backward_addr = 0;
 	dma_addr_t current_addr, addr;
 
-	switch (picture->picture_coding_type) {
-	case V4L2_MPEG2_PICTURE_CODING_TYPE_B:
+	switch (pic->picture_coding_type) {
+	case V4L2_MPEG2_PIC_CODING_TYPE_B:
 		backward_addr = hantro_get_ref(ctx,
 					       slice_params->backward_ref_ts);
 		fallthrough;
-	case V4L2_MPEG2_PICTURE_CODING_TYPE_P:
+	case V4L2_MPEG2_PIC_CODING_TYPE_P:
 		forward_addr = hantro_get_ref(ctx,
 					      slice_params->forward_ref_ts);
 	}
@@ -126,7 +122,7 @@ rk3399_vpu_mpeg2_dec_set_buffers(struct hantro_dev *vpu,
 	addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
 	current_addr = addr;
 
-	if (picture->picture_structure == PICT_BOTTOM_FIELD)
+	if (pic->picture_structure == V4L2_MPEG2_PIC_BOTTOM_FIELD)
 		addr += ALIGN(ctx->dst_fmt.width, 16);
 	vdpu_write_relaxed(vpu, addr, VDPU_REG_DEC_OUT_BASE);
 
@@ -136,18 +132,18 @@ rk3399_vpu_mpeg2_dec_set_buffers(struct hantro_dev *vpu,
 		backward_addr = current_addr;
 
 	/* Set forward ref frame (top/bottom field) */
-	if (picture->picture_structure == PICT_FRAME ||
-	    picture->picture_coding_type == V4L2_MPEG2_PICTURE_CODING_TYPE_B ||
-	    (picture->picture_structure == PICT_TOP_FIELD &&
-	     picture->top_field_first) ||
-	    (picture->picture_structure == PICT_BOTTOM_FIELD &&
-	     !picture->top_field_first)) {
+	if (pic->picture_structure == V4L2_MPEG2_PIC_FRAME ||
+	    pic->picture_coding_type == V4L2_MPEG2_PIC_CODING_TYPE_B ||
+	    (pic->picture_structure == V4L2_MPEG2_PIC_TOP_FIELD &&
+	     pic->flags & V4L2_MPEG2_PIC_TOP_FIELD) ||
+	    (pic->picture_structure == V4L2_MPEG2_PIC_BOTTOM_FIELD &&
+	     !(pic->flags & V4L2_MPEG2_PIC_TOP_FIELD))) {
 		vdpu_write_relaxed(vpu, forward_addr, VDPU_REG_REFER0_BASE);
 		vdpu_write_relaxed(vpu, forward_addr, VDPU_REG_REFER1_BASE);
-	} else if (picture->picture_structure == PICT_TOP_FIELD) {
+	} else if (pic->picture_structure == V4L2_MPEG2_PIC_TOP_FIELD) {
 		vdpu_write_relaxed(vpu, forward_addr, VDPU_REG_REFER0_BASE);
 		vdpu_write_relaxed(vpu, current_addr, VDPU_REG_REFER1_BASE);
-	} else if (picture->picture_structure == PICT_BOTTOM_FIELD) {
+	} else if (pic->picture_structure == V4L2_MPEG2_PIC_BOTTOM_FIELD) {
 		vdpu_write_relaxed(vpu, current_addr, VDPU_REG_REFER0_BASE);
 		vdpu_write_relaxed(vpu, forward_addr, VDPU_REG_REFER1_BASE);
 	}
@@ -162,8 +158,8 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	const struct v4l2_ctrl_mpeg2_slice_params *slice_params;
-	const struct v4l2_mpeg2_sequence *sequence;
-	const struct v4l2_mpeg2_picture *picture;
+	const struct v4l2_mpeg2_sequence *seq;
+	const struct v4l2_mpeg2_picture *pic;
 	u32 reg;
 
 	src_buf = hantro_get_src_buf(ctx);
@@ -173,8 +169,8 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	slice_params = hantro_get_ctrl(ctx,
 				       V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
-	sequence = &slice_params->sequence;
-	picture = &slice_params->picture;
+	seq = &slice_params->sequence;
+	pic = &slice_params->picture;
 
 	reg = VDPU_REG_DEC_ADV_PRE_DIS(0) |
 	      VDPU_REG_DEC_SCMD_DIS(0) |
@@ -209,11 +205,11 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(56));
 
 	reg = VDPU_REG_RLC_MODE_E(0) |
-	      VDPU_REG_PIC_INTERLACE_E(!sequence->progressive_sequence) |
-	      VDPU_REG_PIC_FIELDMODE_E(picture->picture_structure != PICT_FRAME) |
-	      VDPU_REG_PIC_B_E(picture->picture_coding_type == V4L2_MPEG2_PICTURE_CODING_TYPE_B) |
-	      VDPU_REG_PIC_INTER_E(picture->picture_coding_type != V4L2_MPEG2_PICTURE_CODING_TYPE_I) |
-	      VDPU_REG_PIC_TOPFIELD_E(picture->picture_structure == PICT_TOP_FIELD) |
+	      VDPU_REG_PIC_INTERLACE_E(!(seq->flags & V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE)) |
+	      VDPU_REG_PIC_FIELDMODE_E(pic->picture_structure != V4L2_MPEG2_PIC_FRAME) |
+	      VDPU_REG_PIC_B_E(pic->picture_coding_type == V4L2_MPEG2_PIC_CODING_TYPE_B) |
+	      VDPU_REG_PIC_INTER_E(pic->picture_coding_type != V4L2_MPEG2_PIC_CODING_TYPE_I) |
+	      VDPU_REG_PIC_TOPFIELD_E(pic->picture_structure == V4L2_MPEG2_PIC_TOP_FIELD) |
 	      VDPU_REG_FWD_INTERLACE_E(0) |
 	      VDPU_REG_WRITE_MVS_E(0) |
 	      VDPU_REG_DEC_TIMEOUT_E(1) |
@@ -222,23 +218,23 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	reg = VDPU_REG_PIC_MB_WIDTH(MB_WIDTH(ctx->dst_fmt.width)) |
 	      VDPU_REG_PIC_MB_HEIGHT_P(MB_HEIGHT(ctx->dst_fmt.height)) |
-	      VDPU_REG_ALT_SCAN_E(picture->alternate_scan) |
-	      VDPU_REG_TOPFIELDFIRST_E(picture->top_field_first);
+	      VDPU_REG_ALT_SCAN_E(pic->flags & V4L2_MPEG2_PIC_FLAG_ALT_SCAN) |
+	      VDPU_REG_TOPFIELDFIRST_E(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
 	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(120));
 
 	reg = VDPU_REG_STRM_START_BIT(slice_params->data_bit_offset) |
-	      VDPU_REG_QSCALE_TYPE(picture->q_scale_type) |
-	      VDPU_REG_CON_MV_E(picture->concealment_motion_vectors) |
-	      VDPU_REG_INTRA_DC_PREC(picture->intra_dc_precision) |
-	      VDPU_REG_INTRA_VLC_TAB(picture->intra_vlc_format) |
-	      VDPU_REG_FRAME_PRED_DCT(picture->frame_pred_frame_dct);
+	      VDPU_REG_QSCALE_TYPE(pic->flags & V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE) |
+	      VDPU_REG_CON_MV_E(pic->flags & V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV) |
+	      VDPU_REG_INTRA_DC_PREC(pic->intra_dc_precision) |
+	      VDPU_REG_INTRA_VLC_TAB(pic->flags & V4L2_MPEG2_PIC_FLAG_INTRA_VLC) |
+	      VDPU_REG_FRAME_PRED_DCT(pic->flags & V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT);
 	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(122));
 
-	reg = VDPU_REG_ALT_SCAN_FLAG_E(picture->alternate_scan) |
-	      VDPU_REG_FCODE_FWD_HOR(picture->f_code[0][0]) |
-	      VDPU_REG_FCODE_FWD_VER(picture->f_code[0][1]) |
-	      VDPU_REG_FCODE_BWD_HOR(picture->f_code[1][0]) |
-	      VDPU_REG_FCODE_BWD_VER(picture->f_code[1][1]) |
+	reg = VDPU_REG_ALT_SCAN_FLAG_E(pic->flags & V4L2_MPEG2_PIC_FLAG_ALT_SCAN) |
+	      VDPU_REG_FCODE_FWD_HOR(pic->f_code[0][0]) |
+	      VDPU_REG_FCODE_FWD_VER(pic->f_code[0][1]) |
+	      VDPU_REG_FCODE_BWD_HOR(pic->f_code[1][0]) |
+	      VDPU_REG_FCODE_BWD_VER(pic->f_code[1][1]) |
 	      VDPU_REG_MV_ACCURACY_FWD(1) |
 	      VDPU_REG_MV_ACCURACY_BWD(1);
 	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(136));
@@ -247,7 +243,7 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	rk3399_vpu_mpeg2_dec_set_buffers(vpu, ctx, &src_buf->vb2_buf,
 					 &dst_buf->vb2_buf,
-					 sequence, picture, slice_params);
+					 seq, pic, slice_params);
 
 	/* Kick the watchdog and start decoding */
 	hantro_end_prepare_run(ctx);
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 28fb228bbab7..ff15ca08201c 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -51,8 +51,8 @@ static void cedrus_mpeg2_irq_disable(struct cedrus_ctx *ctx)
 static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 {
 	const struct v4l2_ctrl_mpeg2_slice_params *slice_params;
-	const struct v4l2_mpeg2_sequence *sequence;
-	const struct v4l2_mpeg2_picture *picture;
+	const struct v4l2_mpeg2_sequence *seq;
+	const struct v4l2_mpeg2_picture *pic;
 	const struct v4l2_ctrl_mpeg2_quantization *quantization;
 	dma_addr_t src_buf_addr, dst_luma_addr, dst_chroma_addr;
 	dma_addr_t fwd_luma_addr, fwd_chroma_addr;
@@ -66,8 +66,8 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	u32 reg;
 
 	slice_params = run->mpeg2.slice_params;
-	sequence = &slice_params->sequence;
-	picture = &slice_params->picture;
+	seq = &slice_params->sequence;
+	pic = &slice_params->picture;
 
 	quantization = run->mpeg2.quantization;
 
@@ -94,19 +94,19 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	/* Set MPEG picture header. */
 
-	reg = VE_DEC_MPEG_MP12HDR_SLICE_TYPE(picture->picture_coding_type);
-	reg |= VE_DEC_MPEG_MP12HDR_F_CODE(0, 0, picture->f_code[0][0]);
-	reg |= VE_DEC_MPEG_MP12HDR_F_CODE(0, 1, picture->f_code[0][1]);
-	reg |= VE_DEC_MPEG_MP12HDR_F_CODE(1, 0, picture->f_code[1][0]);
-	reg |= VE_DEC_MPEG_MP12HDR_F_CODE(1, 1, picture->f_code[1][1]);
-	reg |= VE_DEC_MPEG_MP12HDR_INTRA_DC_PRECISION(picture->intra_dc_precision);
-	reg |= VE_DEC_MPEG_MP12HDR_INTRA_PICTURE_STRUCTURE(picture->picture_structure);
-	reg |= VE_DEC_MPEG_MP12HDR_TOP_FIELD_FIRST(picture->top_field_first);
-	reg |= VE_DEC_MPEG_MP12HDR_FRAME_PRED_FRAME_DCT(picture->frame_pred_frame_dct);
-	reg |= VE_DEC_MPEG_MP12HDR_CONCEALMENT_MOTION_VECTORS(picture->concealment_motion_vectors);
-	reg |= VE_DEC_MPEG_MP12HDR_Q_SCALE_TYPE(picture->q_scale_type);
-	reg |= VE_DEC_MPEG_MP12HDR_INTRA_VLC_FORMAT(picture->intra_vlc_format);
-	reg |= VE_DEC_MPEG_MP12HDR_ALTERNATE_SCAN(picture->alternate_scan);
+	reg = VE_DEC_MPEG_MP12HDR_SLICE_TYPE(pic->picture_coding_type);
+	reg |= VE_DEC_MPEG_MP12HDR_F_CODE(0, 0, pic->f_code[0][0]);
+	reg |= VE_DEC_MPEG_MP12HDR_F_CODE(0, 1, pic->f_code[0][1]);
+	reg |= VE_DEC_MPEG_MP12HDR_F_CODE(1, 0, pic->f_code[1][0]);
+	reg |= VE_DEC_MPEG_MP12HDR_F_CODE(1, 1, pic->f_code[1][1]);
+	reg |= VE_DEC_MPEG_MP12HDR_INTRA_DC_PRECISION(pic->intra_dc_precision);
+	reg |= VE_DEC_MPEG_MP12HDR_INTRA_PICTURE_STRUCTURE(pic->picture_structure);
+	reg |= VE_DEC_MPEG_MP12HDR_TOP_FIELD_FIRST(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
+	reg |= VE_DEC_MPEG_MP12HDR_FRAME_PRED_FRAME_DCT(pic->flags & V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT);
+	reg |= VE_DEC_MPEG_MP12HDR_CONCEALMENT_MOTION_VECTORS(pic->flags & V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV);
+	reg |= VE_DEC_MPEG_MP12HDR_Q_SCALE_TYPE(pic->flags & V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE);
+	reg |= VE_DEC_MPEG_MP12HDR_INTRA_VLC_FORMAT(pic->flags & V4L2_MPEG2_PIC_FLAG_INTRA_VLC);
+	reg |= VE_DEC_MPEG_MP12HDR_ALTERNATE_SCAN(pic->flags & V4L2_MPEG2_PIC_FLAG_ALT_SCAN);
 	reg |= VE_DEC_MPEG_MP12HDR_FULL_PEL_FORWARD_VECTOR(0);
 	reg |= VE_DEC_MPEG_MP12HDR_FULL_PEL_BACKWARD_VECTOR(0);
 
@@ -114,8 +114,8 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	/* Set frame dimensions. */
 
-	reg = VE_DEC_MPEG_PICCODEDSIZE_WIDTH(sequence->horizontal_size);
-	reg |= VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(sequence->vertical_size);
+	reg = VE_DEC_MPEG_PICCODEDSIZE_WIDTH(seq->horizontal_size);
+	reg |= VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(seq->vertical_size);
 
 	cedrus_write(dev, VE_DEC_MPEG_PICCODEDSIZE, reg);
 
diff --git a/include/media/mpeg2-ctrls.h b/include/media/mpeg2-ctrls.h
index 757043eef682..97cb35fb5b5e 100644
--- a/include/media/mpeg2-ctrls.h
+++ b/include/media/mpeg2-ctrls.h
@@ -18,10 +18,7 @@
 #define V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS 0x0103
 #define	V4L2_CTRL_TYPE_MPEG2_QUANTIZATION 0x0104
 
-#define V4L2_MPEG2_PICTURE_CODING_TYPE_I	1
-#define V4L2_MPEG2_PICTURE_CODING_TYPE_P	2
-#define V4L2_MPEG2_PICTURE_CODING_TYPE_B	3
-#define V4L2_MPEG2_PICTURE_CODING_TYPE_D	4
+#define V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE		0x0001
 
 struct v4l2_mpeg2_sequence {
 	/* ISO/IEC 13818-2, ITU-T Rec. H.262: Sequence header */
@@ -31,10 +28,29 @@ struct v4l2_mpeg2_sequence {
 
 	/* ISO/IEC 13818-2, ITU-T Rec. H.262: Sequence extension */
 	__u16	profile_and_level_indication;
-	__u8	progressive_sequence;
 	__u8	chroma_format;
+
+	__u32	flags;
 };
 
+#define V4L2_MPEG2_PIC_CODING_TYPE_I			1
+#define V4L2_MPEG2_PIC_CODING_TYPE_P			2
+#define V4L2_MPEG2_PIC_CODING_TYPE_B			3
+#define V4L2_MPEG2_PIC_CODING_TYPE_D			4
+
+#define V4L2_MPEG2_PIC_TOP_FIELD			0x1
+#define V4L2_MPEG2_PIC_BOTTOM_FIELD			0x2
+#define V4L2_MPEG2_PIC_FRAME				0x3
+
+#define V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST		0x0001
+#define V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT		0x0002
+#define V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV		0x0004
+#define V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE		0x0008
+#define V4L2_MPEG2_PIC_FLAG_INTRA_VLC			0x0010
+#define V4L2_MPEG2_PIC_FLAG_ALT_SCAN			0x0020
+#define V4L2_MPEG2_PIC_FLAG_REPEAT_FIRST		0x0040
+#define V4L2_MPEG2_PIC_FLAG_PROGRESSIVE			0x0080
+
 struct v4l2_mpeg2_picture {
 	/* ISO/IEC 13818-2, ITU-T Rec. H.262: Picture header */
 	__u8	picture_coding_type;
@@ -43,14 +59,8 @@ struct v4l2_mpeg2_picture {
 	__u8	f_code[2][2];
 	__u8	intra_dc_precision;
 	__u8	picture_structure;
-	__u8	top_field_first;
-	__u8	frame_pred_frame_dct;
-	__u8	concealment_motion_vectors;
-	__u8	q_scale_type;
-	__u8	intra_vlc_format;
-	__u8	alternate_scan;
-	__u8	repeat_first_field;
-	__u16	progressive_frame;
+
+	__u32	flags;
 };
 
 struct v4l2_ctrl_mpeg2_slice_params {
-- 
2.30.0

