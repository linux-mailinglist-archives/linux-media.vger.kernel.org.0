Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D26C27DCF6
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 01:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729082AbgI2Xtx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 19:49:53 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39630 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728192AbgI2Xtx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 19:49:53 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 4622728A1BF
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
Subject: [PATCH 3/3] media: uapi: mpeg2: Split sequence and picture parameters
Date:   Tue, 29 Sep 2020 20:49:38 -0300
Message-Id: <20200929234938.7538-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Typically, bitstreams are composed of one sequence header NAL unit,
followed by a number of picture header and picture coding extension
NAL units. Each picture can be composed by a number of slices.

Let's split the MPEG-2 uAPI to follow these semantics more closely,
allowing more usage flexibility. Having these controls splitted
allows applications to set a sequence control at the beginning
of a sequence, and then set a picture control for each frame.

While here add padding fields where needed, and document
the uAPI header thoroughly.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 .../media/v4l/ext-ctrls-codec.rst             |  47 ++++++--
 .../media/v4l/pixfmt-compressed.rst           |   5 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          |  45 +++++--
 drivers/staging/media/hantro/hantro_drv.c     |  10 ++
 .../media/hantro/hantro_g1_mpeg2_dec.c        |  14 ++-
 .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    |  14 ++-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  14 +++
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   2 +
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c |   8 +-
 include/media/mpeg2-ctrls.h                   | 110 +++++++++++++++---
 include/media/v4l2-ctrls.h                    |   4 +
 11 files changed, 212 insertions(+), 61 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 4c32b93f41a6..d919cbc119bd 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -2218,14 +2218,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     :stub-columns: 0
     :widths:       1 1 2
 
-    * - struct :c:type:`v4l2_mpeg2_sequence`
-      - ``sequence``
-      - Structure with MPEG-2 sequence metadata, merging relevant fields from
-	the sequence header and sequence extension parts of the bitstream.
-    * - struct :c:type:`v4l2_mpeg2_picture`
-      - ``picture``
-      - Structure with MPEG-2 picture metadata, merging relevant fields from
-	the picture header and picture coding extension parts of the bitstream.
     * - __u64
       - ``backward_ref_ts``
       - Timestamp of the V4L2 capture buffer to use as backward reference, used
@@ -2243,14 +2235,28 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - __u32
       - ``quantiser_scale_code``
       - Code used to determine the quantization scale to use for the IDCT.
+    * - __u8
+      - ``reserved``
+      - Applications and drivers must set this to zero.
 
-.. c:type:: v4l2_mpeg2_sequence
+``V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE (struct)``
+    Specifies the sequence parameters (as extracted from the bitstream) for the
+    associated MPEG-2 slice data. This includes fields matching the syntax
+    elements from the sequence header and sequence extension parts of the
+    bitstream as specified by :ref:`mpeg2part2`.
+
+    .. note::
+
+       This compound control is not yet part of the public kernel API and
+       it is expected to change.
+
+.. c:type:: v4l2_ctrl_mpeg2_sequence
 
 .. cssclass:: longtable
 
 .. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
 
-.. flat-table:: struct v4l2_mpeg2_sequence
+.. flat-table:: struct v4l2_ctrl_mpeg2_sequence
     :header-rows:  0
     :stub-columns: 0
     :widths:       1 1 2
@@ -2272,6 +2278,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - __u8
       - ``chroma_format``
       - The chrominance sub-sampling format (1: 4:2:0, 2: 4:2:2, 3: 4:4:4).
+    * - __u8
+      - ``reserved``
+      - Applications and drivers must set this to zero.
     * - __u32
       - ``flags``
       - See :ref:`MPEG-2 Sequence Flags <mpeg2_sequence_flags>`.
@@ -2292,13 +2301,24 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       - Indication that all the frames for the sequence are progressive instead
 	of interlaced.
 
-.. c:type:: v4l2_mpeg2_picture
+``V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE (struct)``
+    Specifies the picture parameters (as extracted from the bitstream) for the
+    associated MPEG-2 slice data. This includes fields matching the syntax
+    elements from the picture header and picture coding extension parts of the
+    bitstream as specified by :ref:`mpeg2part2`.
+
+    .. note::
+
+       This compound control is not yet part of the public kernel API and
+       it is expected to change.
+
+.. c:type:: v4l2_ctrl_mpeg2_picture
 
 .. cssclass:: longtable
 
 .. tabularcolumns:: |p{1.5cm}|p{6.3cm}|p{9.4cm}|
 
-.. flat-table:: struct v4l2_mpeg2_picture
+.. flat-table:: struct v4l2_ctrl_mpeg2_picture
     :header-rows:  0
     :stub-columns: 0
     :widths:       1 1 2
@@ -2319,6 +2339,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       - ``picture_structure``
       - Picture structure (1: interlaced top field, 2: interlaced bottom field,
 	3: progressive frame).
+    * - __u8
+      - ``reserved``
+      - Applications and drivers must set this to zero.
     * - __u32
       - ``flags``
       - See :ref:`MPEG-2 Picture Flags <mpeg2_picture_flags>`.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index d585909bc4e2..1da4722bc8f3 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -113,8 +113,9 @@ Compressed Formats
 	This format is adapted for stateless video decoders that implement a
 	MPEG-2 pipeline (using the :ref:`mem2mem` and :ref:`media-request-api`).
 	Metadata associated with the frame to decode is required to be passed
-	through the ``V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS`` control and
-	quantization matrices can optionally be specified through the
+	through the ``V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE``,
+        ``V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE``, and ``V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS``
+        controls. Quantization matrices can optionally be specified through the
 	``V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION`` control.
 	See the :ref:`associated Codec Control IDs <v4l2-mpeg-mpeg2>`.
 	Exactly one output and one capture buffer must be provided for use with
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index c24caffc956d..da50fb9edb96 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1620,7 +1620,8 @@ static bool std_equal(const struct v4l2_ctrl *ctrl, u32 idx,
 static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 			      union v4l2_ctrl_ptr ptr)
 {
-	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
+	struct v4l2_ctrl_mpeg2_sequence *p_mpeg2_sequence;
+	struct v4l2_ctrl_mpeg2_picture *p_mpeg2_picture;
 	void *p = ptr.p + idx * ctrl->elem_size;
 
 	if (ctrl->p_def.p_const)
@@ -1634,13 +1635,18 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	 * v4l2_ctrl_type enum.
 	 */
 	switch ((u32)ctrl->type) {
-	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
-		p_mpeg2_slice_params = p;
+	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
+		p_mpeg2_sequence = p;
+
 		/* 4:2:0 */
-		p_mpeg2_slice_params->sequence.chroma_format = 1;
+		p_mpeg2_sequence->chroma_format = 1;
+		break;
+	case V4L2_CTRL_TYPE_MPEG2_PICTURE:
+		p_mpeg2_picture = p;
+
 		/* interlaced top field */
-		p_mpeg2_slice_params->picture.picture_structure = 1;
-		p_mpeg2_slice_params->picture.picture_coding_type =
+		p_mpeg2_picture->picture_structure = 1;
+		p_mpeg2_picture->picture_coding_type =
 					V4L2_MPEG2_PIC_CODING_TYPE_I;
 		break;
 	}
@@ -1768,6 +1774,8 @@ static void std_log(const struct v4l2_ctrl *ctrl)
 static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 				 union v4l2_ctrl_ptr ptr)
 {
+	struct v4l2_ctrl_mpeg2_sequence *p_mpeg2_sequence;
+	struct v4l2_ctrl_mpeg2_picture *p_mpeg2_picture;
 	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
 	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
 	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
@@ -1780,10 +1788,10 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	unsigned int i;
 
 	switch ((u32)ctrl->type) {
-	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
-		p_mpeg2_slice_params = p;
+	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
+		p_mpeg2_sequence = p;
 
-		switch (p_mpeg2_slice_params->sequence.chroma_format) {
+		switch (p_mpeg2_sequence->chroma_format) {
 		case 1: /* 4:2:0 */
 		case 2: /* 4:2:2 */
 		case 3: /* 4:4:4 */
@@ -1791,8 +1799,14 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		default:
 			return -EINVAL;
 		}
+		zero_reserved(*p_mpeg2_sequence);
+		break;
+
+	case V4L2_CTRL_TYPE_MPEG2_PICTURE:
+		p_mpeg2_picture = p;
+		break;
 
-		switch (p_mpeg2_slice_params->picture.intra_dc_precision) {
+		switch (p_mpeg2_picture->intra_dc_precision) {
 		case 0: /* 8 bits */
 		case 1: /* 9 bits */
 		case 2: /* 10 bits */
@@ -1801,8 +1815,9 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		default:
 			return -EINVAL;
 		}
+		break;
 
-		switch (p_mpeg2_slice_params->picture.picture_structure) {
+		switch (p_mpeg2_picture->picture_structure) {
 		case V4L2_MPEG2_PIC_TOP_FIELD:
 		case V4L2_MPEG2_PIC_BOTTOM_FIELD:
 		case V4L2_MPEG2_PIC_FRAME:
@@ -1811,7 +1826,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 			return -EINVAL;
 		}
 
-		switch (p_mpeg2_slice_params->picture.picture_coding_type) {
+		switch (p_mpeg2_picture->picture_coding_type) {
 		case V4L2_MPEG2_PIC_CODING_TYPE_I:
 		case V4L2_MPEG2_PIC_CODING_TYPE_P:
 		case V4L2_MPEG2_PIC_CODING_TYPE_B:
@@ -1819,7 +1834,13 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		default:
 			return -EINVAL;
 		}
+		zero_reserved(*p_mpeg2_picture);
+		break;
+
+	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
+		p_mpeg2_slice_params = p;
 
+		zero_reserved(*p_mpeg2_slice_params);
 		break;
 
 	case V4L2_CTRL_TYPE_MPEG2_QUANTIZATION:
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 3cd00cc0a364..68543a8836e4 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -286,6 +286,16 @@ static const struct hantro_ctrl controls[] = {
 			.def = 50,
 			.ops = &hantro_jpeg_ctrl_ops,
 		},
+	}, {
+		.codec = HANTRO_MPEG2_DECODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE,
+		},
+	}, {
+		.codec = HANTRO_MPEG2_DECODER,
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE,
+		},
 	}, {
 		.codec = HANTRO_MPEG2_DECODER,
 		.cfg = {
diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
index b6086474d31f..1a6ca49441f4 100644
--- a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
@@ -95,8 +95,8 @@ static void
 hantro_g1_mpeg2_dec_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx,
 				struct vb2_buffer *src_buf,
 				struct vb2_buffer *dst_buf,
-				const struct v4l2_mpeg2_sequence *seq,
-				const struct v4l2_mpeg2_picture *pic,
+				const struct v4l2_ctrl_mpeg2_sequence *seq,
+				const struct v4l2_ctrl_mpeg2_picture *pic,
 				const struct v4l2_ctrl_mpeg2_slice_params *slice_params)
 {
 	dma_addr_t forward_addr = 0, backward_addr = 0;
@@ -156,8 +156,8 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	const struct v4l2_ctrl_mpeg2_slice_params *slice_params;
-	const struct v4l2_mpeg2_sequence *seq;
-	const struct v4l2_mpeg2_picture *pic;
+	const struct v4l2_ctrl_mpeg2_sequence *seq;
+	const struct v4l2_ctrl_mpeg2_picture *pic;
 	u32 reg;
 
 	src_buf = hantro_get_src_buf(ctx);
@@ -168,8 +168,10 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	slice_params = hantro_get_ctrl(ctx,
 				       V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
-	seq = &slice_params->sequence;
-	pic = &slice_params->picture;
+	seq = hantro_get_ctrl(ctx,
+			      V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE);
+	pic = hantro_get_ctrl(ctx,
+			      V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE);
 
 	reg = G1_REG_DEC_AXI_RD_ID(0) |
 	      G1_REG_DEC_TIMEOUT_E(1) |
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
index cfd9f5115103..8e76f76b8d0e 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
@@ -97,8 +97,8 @@ rk3399_vpu_mpeg2_dec_set_buffers(struct hantro_dev *vpu,
 				 struct hantro_ctx *ctx,
 				 struct vb2_buffer *src_buf,
 				 struct vb2_buffer *dst_buf,
-				 const struct v4l2_mpeg2_sequence *seq,
-				 const struct v4l2_mpeg2_picture *pic,
+				 const struct v4l2_ctrl_mpeg2_sequence *seq,
+				 const struct v4l2_ctrl_mpeg2_picture *pic,
 				 const struct v4l2_ctrl_mpeg2_slice_params *slice_params)
 {
 	dma_addr_t forward_addr = 0, backward_addr = 0;
@@ -158,8 +158,8 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	const struct v4l2_ctrl_mpeg2_slice_params *slice_params;
-	const struct v4l2_mpeg2_sequence *seq;
-	const struct v4l2_mpeg2_picture *pic;
+	const struct v4l2_ctrl_mpeg2_sequence *seq;
+	const struct v4l2_ctrl_mpeg2_picture *pic;
 	u32 reg;
 
 	src_buf = hantro_get_src_buf(ctx);
@@ -169,8 +169,10 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	slice_params = hantro_get_ctrl(ctx,
 				       V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
-	seq = &slice_params->sequence;
-	pic = &slice_params->picture;
+	seq = hantro_get_ctrl(ctx,
+			      V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE);
+	pic = hantro_get_ctrl(ctx,
+			      V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE);
 
 	reg = VDPU_REG_DEC_ADV_PRE_DIS(0) |
 	      VDPU_REG_DEC_SCMD_DIS(0) |
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index e0e35502e34a..c5503d57d930 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -29,6 +29,20 @@
 #include "cedrus_hw.h"
 
 static const struct cedrus_control cedrus_controls[] = {
+	{
+		.cfg = {
+			.id	= V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE,
+		},
+		.codec		= CEDRUS_CODEC_MPEG2,
+		.required	= true,
+	},
+	{
+		.cfg = {
+			.id	= V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE,
+		},
+		.codec		= CEDRUS_CODEC_MPEG2,
+		.required	= true,
+	},
 	{
 		.cfg = {
 			.id	= V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 93c843ae14bb..c27d9b159c26 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -66,6 +66,8 @@ struct cedrus_h264_run {
 };
 
 struct cedrus_mpeg2_run {
+	const struct v4l2_ctrl_mpeg2_sequence		*sequence;
+	const struct v4l2_ctrl_mpeg2_picture		*picture;
 	const struct v4l2_ctrl_mpeg2_slice_params	*slice_params;
 	const struct v4l2_ctrl_mpeg2_quantization	*quantization;
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 6a99893cdc77..ea52778b36f9 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -75,8 +75,8 @@ static void cedrus_mpeg2_irq_disable(struct cedrus_ctx *ctx)
 static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 {
 	const struct v4l2_ctrl_mpeg2_slice_params *slice_params;
-	const struct v4l2_mpeg2_sequence *seq;
-	const struct v4l2_mpeg2_picture *pic;
+	const struct v4l2_ctrl_mpeg2_sequence *seq;
+	const struct v4l2_ctrl_mpeg2_picture *pic;
 	const struct v4l2_ctrl_mpeg2_quantization *quantization;
 	dma_addr_t src_buf_addr, dst_luma_addr, dst_chroma_addr;
 	dma_addr_t fwd_luma_addr, fwd_chroma_addr;
@@ -90,8 +90,8 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	u32 reg;
 
 	slice_params = run->mpeg2.slice_params;
-	seq = &slice_params->sequence;
-	pic = &slice_params->picture;
+	seq = run->mpeg2.sequence;
+	pic = run->mpeg2.picture;
 
 	quantization = run->mpeg2.quantization;
 
diff --git a/include/media/mpeg2-ctrls.h b/include/media/mpeg2-ctrls.h
index 5b0c916a44dd..cd8f0cea5665 100644
--- a/include/media/mpeg2-ctrls.h
+++ b/include/media/mpeg2-ctrls.h
@@ -12,24 +12,46 @@
 #define _MPEG2_CTRLS_H_
 
 #define V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS		(V4L2_CID_MPEG_BASE+250)
-#define V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION		(V4L2_CID_MPEG_BASE+251)
+#define V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE		(V4L2_CID_MPEG_BASE+251)
+#define V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE		(V4L2_CID_MPEG_BASE+252)
+#define V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION		(V4L2_CID_MPEG_BASE+253)
 
 /* enum v4l2_ctrl_type type values */
-#define V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS 0x0103
-#define	V4L2_CTRL_TYPE_MPEG2_QUANTIZATION 0x0104
+#define V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS 0x0130
+#define V4L2_CTRL_TYPE_MPEG2_SEQUENCE 0x0131
+#define V4L2_CTRL_TYPE_MPEG2_PICTURE 0x0132
+#define V4L2_CTRL_TYPE_MPEG2_QUANTIZATION 0x0133
 
 #define V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE		0x0001
 
-struct v4l2_mpeg2_sequence {
-	/* ISO/IEC 13818-2, ITU-T Rec. H.262: Sequence header */
+/**
+ * struct v4l2_ctrl_mpeg2_sequence - MPEG-2 sequence header
+ *
+ * All the members on this structure match the sequence header and sequence
+ * extension syntaxes as specified by the MPEG-2 specification.
+ *
+ * Fields horizontal_size, vertical_size and vbv_buffer_size are a
+ * combination of respective _value and extension syntax elements,
+ * as described in section 6.3.3 "Sequence header".
+ *
+ * @horizontal_size: combination of elements horizontal_size_value and
+ * horizontal_size_extension.
+ * @vertical_size: combination of elements vertical_size_value and
+ * vertical_size_extension.
+ * @vbv_buffer_size: combination of elements vbv_buffer_size_value and
+ * vbv_buffer_size_extension.
+ * @profile_and_level_indication: see MPEG-2 specification.
+ * @chroma_format: see MPEG-2 specification.
+ * @reserved: padding field. Should be zeroed by applications.
+ * @flags: see V4L2_MPEG2_SEQ_FLAG_{}.
+ */
+struct v4l2_ctrl_mpeg2_sequence {
 	__u16	horizontal_size;
 	__u16	vertical_size;
 	__u32	vbv_buffer_size;
-
-	/* ISO/IEC 13818-2, ITU-T Rec. H.262: Sequence extension */
 	__u16	profile_and_level_indication;
 	__u8	chroma_format;
-
+	__u8	reserved;
 	__u32	flags;
 };
 
@@ -55,30 +77,80 @@ struct v4l2_mpeg2_sequence {
 #define V4L2_MPEG2_PIC_FLAG_LOAD_CHROMA_INTRA		0x0400
 #define V4L2_MPEG2_PIC_FLAG_LOAD_CHROMA_NON_INTRA	0x0800
 
-struct v4l2_mpeg2_picture {
-	/* ISO/IEC 13818-2, ITU-T Rec. H.262: Picture header */
+/**
+ * struct v4l2_ctrl_mpeg2_picture - MPEG-2 picture header
+ *
+ * All the members on this structure match the picture header and picture
+ * coding extension syntaxes as specified by the MPEG-2 specification.
+ *
+ * In particular, the set of quantization load flags V4L2_MPEG2_PIC_FLAG_LOAD_{}
+ * are specified here in order to allow applications to pass non-default
+ * quantization matrices. In this case, applications are expected to use
+ * V4L2_CTRL_TYPE_MPEG2_QUANTIZATION to pass the values of non-default
+ * matrices.
+ *
+ * @picture_coding_type: see MPEG-2 specification.
+ * @f_code[2][2]: see MPEG-2 specification.
+ * @intra_dc_precision: see MPEG-2 specification.
+ * @picture_structure: see V4L2_MPEG2_PIC_{}_FIELD.
+ * @reserved: padding field. Should be zeroed by applications.
+ * @flags: see V4L2_MPEG2_PIC_FLAG_{}.
+ */
+struct v4l2_ctrl_mpeg2_picture {
 	__u8	picture_coding_type;
-
-	/* ISO/IEC 13818-2, ITU-T Rec. H.262: Picture coding extension */
 	__u8	f_code[2][2];
 	__u8	intra_dc_precision;
 	__u8	picture_structure;
-
+	__u8	reserved;
 	__u32	flags;
 };
 
+/**
+ * struct v4l2_ctrl_mpeg2_slice_params - MPEG-2 slice header
+ *
+ * @backward_ref_ts: timestamp of the V4L2 capture buffer to use as
+ * reference for backward prediction.
+ * @forward_ref_ts: timestamp of the V4L2 capture buffer to use as
+ * reference for forward prediction. These timestamp refers to the
+ * timestamp field in struct v4l2_buffer. Use v4l2_timeval_to_ns()
+ * to convert the struct timeval to a __u64.
+ * @quantiser_scale_code: quantiser scale integer matching an
+ * homonymous syntax element.
+ * @reserved: padding field. Should be zeroed by applications.
+ */
 struct v4l2_ctrl_mpeg2_slice_params {
 	__u64	backward_ref_ts;
 	__u64	forward_ref_ts;
-
-	struct v4l2_mpeg2_sequence sequence;
-	struct v4l2_mpeg2_picture picture;
-
-	/* ISO/IEC 13818-2, ITU-T Rec. H.262: Slice */
 	__u32	quantiser_scale_code;
+	__u32	reserved;
 };
 
-/* ISO/IEC 13818-2, ITU-T Rec. H.262: Quant matrix extension */
+/**
+ * struct v4l2_ctrl_mpeg2_quantization - MPEG-2 quantization
+ *
+ * Quantization matrices as specified by section 6.3.7
+ * "Quant matrix extension".
+ *
+ * Applications are expected to set the quantization matrices load
+ * flags V4L2_MPEG2_PIC_FLAG_LOAD_{} in struct v4l2_ctrl_mpeg2_picture
+ * to tell the kernel that a non-default matrix shall be used
+ * to decode the picture.
+ *
+ * @intra_quantiser_matrix: The quantization matrix coefficients
+ * for intra-coded frames, in zigzag scanning order. It is relevant
+ * for both luma and chroma components, although it can be superseded
+ * by the chroma-specific matrix for non-4:2:0 YUV formats.
+ * @non_intra_quantiser_matrix: The quantization matrix coefficients
+ * for non-intra-coded frames, in zigzag scanning order. It is relevant
+ * for both luma and chroma components, although it can be superseded
+ * by the chroma-specific matrix for non-4:2:0 YUV formats.
+ * @chroma_intra_quantiser_matrix: The quantization matrix coefficients
+ * for the chominance component of intra-coded frames, in zigzag scanning
+ * order. Only relevant for 4:2:2 and 4:4:4 YUV formats.
+ * @chroma_non_intra_quantiser_matrix: The quantization matrix coefficients
+ * for the chrominance component of non-intra-coded frames, in zigzag scanning
+ * order. Only relevant for 4:2:2 and 4:4:4 YUV formats.
+ */
 struct v4l2_ctrl_mpeg2_quantization {
 	__u8	intra_quantiser_matrix[64];
 	__u8	non_intra_quantiser_matrix[64];
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index cb25f345e9ad..92f4b508f5de 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -43,6 +43,8 @@ struct video_device;
  * @p_u16:			Pointer to a 16-bit unsigned value.
  * @p_u32:			Pointer to a 32-bit unsigned value.
  * @p_char:			Pointer to a string.
+ * @p_mpeg2_sequence:		Pointer to a MPEG2 sequence structure.
+ * @p_mpeg2_picture:		Pointer to a MPEG2 picture structure.
  * @p_mpeg2_slice_params:	Pointer to a MPEG2 slice parameters structure.
  * @p_mpeg2_quantization:	Pointer to a MPEG2 quantization data structure.
  * @p_fwht_params:		Pointer to a FWHT stateless parameters structure.
@@ -67,6 +69,8 @@ union v4l2_ctrl_ptr {
 	u16 *p_u16;
 	u32 *p_u32;
 	char *p_char;
+	struct v4l2_ctrl_mpeg2_sequence *p_sequence;
+	struct v4l2_ctrl_mpeg2_picture *p_picture;
 	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
 	struct v4l2_ctrl_mpeg2_quantization *p_mpeg2_quantization;
 	struct v4l2_ctrl_fwht_params *p_fwht_params;
-- 
2.27.0

