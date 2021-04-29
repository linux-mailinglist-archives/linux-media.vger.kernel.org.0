Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F69A36ECA2
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 16:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240388AbhD2OtY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 10:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232556AbhD2OtT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 10:49:19 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55233C06138B;
        Thu, 29 Apr 2021 07:48:33 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id C9D261F4352B
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
Subject: [PATCH v7 01/10] media: uapi: mpeg2: Rename "quantization" to "quantisation"
Date:   Thu, 29 Apr 2021 11:48:09 -0300
Message-Id: <20210429144818.67105-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210429144818.67105-1-ezequiel@collabora.com>
References: <20210429144818.67105-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MPEG-2 specification refers to the quantisation matrices
using the word "quantisation". Make the V4L2 interface more
ergonomic by matching the MPEG-2 spec.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Tested-by: Jernej Skrabec <jernej.skrabec@siol.net>
Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 .../media/v4l/ext-ctrls-codec.rst             | 16 ++++++------
 .../media/v4l/pixfmt-compressed.rst           |  4 +--
 .../media/v4l/vidioc-queryctrl.rst            |  6 ++---
 .../media/videodev2.h.rst.exceptions          |  2 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          | 12 ++++-----
 drivers/staging/media/hantro/hantro_drv.c     |  2 +-
 .../media/hantro/hantro_g1_mpeg2_dec.c        | 17 +++++-------
 drivers/staging/media/hantro/hantro_hw.h      |  2 +-
 drivers/staging/media/hantro/hantro_mpeg2.c   |  2 +-
 .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    | 14 +++++-----
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  2 +-
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |  4 +--
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c | 26 +++++++++----------
 include/media/mpeg2-ctrls.h                   |  6 ++---
 include/media/v4l2-ctrls.h                    |  4 +--
 16 files changed, 58 insertions(+), 63 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index b0de4e6e7ebd..e40c81146a31 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1755,8 +1755,8 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
 
     \normalsize
 
-``V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION (struct)``
-    Specifies quantization matrices (as extracted from the bitstream) for the
+``V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION (struct)``
+    Specifies quantisation matrices (as extracted from the bitstream) for the
     associated MPEG-2 slice data.
 
     .. note::
@@ -1764,7 +1764,7 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
        This compound control is not yet part of the public kernel API and
        it is expected to change.
 
-.. c:type:: v4l2_ctrl_mpeg2_quantization
+.. c:type:: v4l2_ctrl_mpeg2_quantisation
 
 .. tabularcolumns:: |p{0.8cm}|p{8.0cm}|p{8.5cm}|
 
@@ -1774,7 +1774,7 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
 
     \small
 
-.. flat-table:: struct v4l2_ctrl_mpeg2_quantization
+.. flat-table:: struct v4l2_ctrl_mpeg2_quantisation
     :header-rows:  0
     :stub-columns: 0
     :widths:       1 1 2
@@ -1798,24 +1798,24 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
 	YUV formats.
     * - __u8
       - ``intra_quantiser_matrix[64]``
-      - The quantization matrix coefficients for intra-coded frames, in zigzag
+      - The quantisation matrix coefficients for intra-coded frames, in zigzag
 	scanning order. It is relevant for both luma and chroma components,
 	although it can be superseded by the chroma-specific matrix for
 	non-4:2:0 YUV formats.
     * - __u8
       - ``non_intra_quantiser_matrix[64]``
-      - The quantization matrix coefficients for non-intra-coded frames, in
+      - The quantisation matrix coefficients for non-intra-coded frames, in
 	zigzag scanning order. It is relevant for both luma and chroma
 	components, although it can be superseded by the chroma-specific matrix
 	for non-4:2:0 YUV formats.
     * - __u8
       - ``chroma_intra_quantiser_matrix[64]``
-      - The quantization matrix coefficients for the chominance component of
+      - The quantisation matrix coefficients for the chominance component of
 	intra-coded frames, in zigzag scanning order. Only relevant for
 	non-4:2:0 YUV formats.
     * - __u8
       - ``chroma_non_intra_quantiser_matrix[64]``
-      - The quantization matrix coefficients for the chrominance component of
+      - The quantisation matrix coefficients for the chrominance component of
 	non-intra-coded frames, in zigzag scanning order. Only relevant for
 	non-4:2:0 YUV formats.
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index 6dba70da822b..cba607f789f0 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -115,8 +115,8 @@ Compressed Formats
 	MPEG-2 pipeline (using the :ref:`mem2mem` and :ref:`media-request-api`).
 	Metadata associated with the frame to decode is required to be passed
 	through the ``V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS`` control and
-	quantization matrices can optionally be specified through the
-	``V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION`` control.
+	quantisation matrices can optionally be specified through the
+	``V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION`` control.
 	See the :ref:`associated Codec Control IDs <v4l2-mpeg-mpeg2>`.
 	Exactly one output and one capture buffer must be provided for use with
 	this pixel format. The output buffer must contain the appropriate number
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 8a285daedc6a..4362945fd39b 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -423,12 +423,12 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_ctrl_mpeg2_slice_params`, containing MPEG-2
 	slice parameters for stateless video decoders.
-    * - ``V4L2_CTRL_TYPE_MPEG2_QUANTIZATION``
+    * - ``V4L2_CTRL_TYPE_MPEG2_QUANTISATION``
       - n/a
       - n/a
       - n/a
-      - A struct :c:type:`v4l2_ctrl_mpeg2_quantization`, containing MPEG-2
-	quantization matrices for stateless video decoders.
+      - A struct :c:type:`v4l2_ctrl_mpeg2_quantisation`, containing MPEG-2
+	quantisation matrices for stateless video decoders.
     * - ``V4L2_CTRL_TYPE_AREA``
       - n/a
       - n/a
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index f59940352faa..5b2ebaa35d24 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -135,7 +135,7 @@ replace symbol V4L2_CTRL_TYPE_U16 :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U32 :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U8 :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTIZATION :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTISATION :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_H264_SPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_H264_PPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_H264_SCALING_MATRIX :c:type:`v4l2_ctrl_type`
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 0d7fe1bd975a..1ed62f0ed66f 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -966,7 +966,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "Frame LTR Index";
 	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice Parameters";
-	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-2 Quantization Matrices";
+	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION:		return "MPEG-2 Quantisation Matrices";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
 	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
 
@@ -1490,8 +1490,8 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:
 		*type = V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:
-		*type = V4L2_CTRL_TYPE_MPEG2_QUANTIZATION;
+	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION:
+		*type = V4L2_CTRL_TYPE_MPEG2_QUANTISATION;
 		break;
 	case V4L2_CID_STATELESS_FWHT_PARAMS:
 		*type = V4L2_CTRL_TYPE_FWHT_PARAMS;
@@ -1942,7 +1942,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 
 		break;
 
-	case V4L2_CTRL_TYPE_MPEG2_QUANTIZATION:
+	case V4L2_CTRL_TYPE_MPEG2_QUANTISATION:
 		break;
 
 	case V4L2_CTRL_TYPE_FWHT_PARAMS:
@@ -2911,8 +2911,8 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
 		elem_size = sizeof(struct v4l2_ctrl_mpeg2_slice_params);
 		break;
-	case V4L2_CTRL_TYPE_MPEG2_QUANTIZATION:
-		elem_size = sizeof(struct v4l2_ctrl_mpeg2_quantization);
+	case V4L2_CTRL_TYPE_MPEG2_QUANTISATION:
+		elem_size = sizeof(struct v4l2_ctrl_mpeg2_quantisation);
 		break;
 	case V4L2_CTRL_TYPE_FWHT_PARAMS:
 		elem_size = sizeof(struct v4l2_ctrl_fwht_params);
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 595e82a82728..9e3552cd5cf8 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -294,7 +294,7 @@ static const struct hantro_ctrl controls[] = {
 	}, {
 		.codec = HANTRO_MPEG2_DECODER,
 		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION,
+			.id = V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION,
 		},
 	}, {
 		.codec = HANTRO_VP8_DECODER,
diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
index 6386a3989bfe..dedb5c502ae0 100644
--- a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
@@ -82,17 +82,14 @@
 #define PICT_FRAME         3
 
 static void
-hantro_g1_mpeg2_dec_set_quantization(struct hantro_dev *vpu,
+hantro_g1_mpeg2_dec_set_quantisation(struct hantro_dev *vpu,
 				     struct hantro_ctx *ctx)
 {
-	struct v4l2_ctrl_mpeg2_quantization *quantization;
-
-	quantization = hantro_get_ctrl(ctx,
-				       V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION);
-	hantro_mpeg2_dec_copy_qtable(ctx->mpeg2_dec.qtable.cpu,
-				     quantization);
-	vdpu_write_relaxed(vpu, ctx->mpeg2_dec.qtable.dma,
-			   G1_REG_QTABLE_BASE);
+	struct v4l2_ctrl_mpeg2_quantisation *q;
+
+	q = hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION);
+	hantro_mpeg2_dec_copy_qtable(ctx->mpeg2_dec.qtable.cpu, q);
+	vdpu_write_relaxed(vpu, ctx->mpeg2_dec.qtable.dma, G1_REG_QTABLE_BASE);
 }
 
 static void
@@ -238,7 +235,7 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 	reg = G1_REG_APF_THRESHOLD(8);
 	vdpu_write_relaxed(vpu, reg, G1_SWREG(55));
 
-	hantro_g1_mpeg2_dec_set_quantization(vpu, ctx);
+	hantro_g1_mpeg2_dec_set_quantisation(vpu, ctx);
 
 	hantro_g1_mpeg2_dec_set_buffers(vpu, ctx, &src_buf->vb2_buf,
 					&dst_buf->vb2_buf,
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 83b3e42b63a3..062ed19ca0ab 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -219,7 +219,7 @@ hantro_h264_mv_size(unsigned int width, unsigned int height)
 void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
 void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx);
 void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
-	const struct v4l2_ctrl_mpeg2_quantization *ctrl);
+	const struct v4l2_ctrl_mpeg2_quantisation *ctrl);
 int hantro_mpeg2_dec_init(struct hantro_ctx *ctx);
 void hantro_mpeg2_dec_exit(struct hantro_ctx *ctx);
 
diff --git a/drivers/staging/media/hantro/hantro_mpeg2.c b/drivers/staging/media/hantro/hantro_mpeg2.c
index 1d334e6fcd06..bc77401b02a5 100644
--- a/drivers/staging/media/hantro/hantro_mpeg2.c
+++ b/drivers/staging/media/hantro/hantro_mpeg2.c
@@ -19,7 +19,7 @@ static const u8 zigzag[64] = {
 };
 
 void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
-	const struct v4l2_ctrl_mpeg2_quantization *ctrl)
+	const struct v4l2_ctrl_mpeg2_quantisation *ctrl)
 {
 	int i, n;
 
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
index f610fa5b4335..61a54549774d 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
@@ -84,16 +84,14 @@
 #define PICT_FRAME         3
 
 static void
-rk3399_vpu_mpeg2_dec_set_quantization(struct hantro_dev *vpu,
+rk3399_vpu_mpeg2_dec_set_quantisation(struct hantro_dev *vpu,
 				      struct hantro_ctx *ctx)
 {
-	struct v4l2_ctrl_mpeg2_quantization *quantization;
+	struct v4l2_ctrl_mpeg2_quantisation *q;
 
-	quantization = hantro_get_ctrl(ctx,
-				       V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION);
-	hantro_mpeg2_dec_copy_qtable(ctx->mpeg2_dec.qtable.cpu, quantization);
-	vdpu_write_relaxed(vpu, ctx->mpeg2_dec.qtable.dma,
-			   VDPU_REG_QTABLE_BASE);
+	q = hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION);
+	hantro_mpeg2_dec_copy_qtable(ctx->mpeg2_dec.qtable.cpu, q);
+	vdpu_write_relaxed(vpu, ctx->mpeg2_dec.qtable.dma, VDPU_REG_QTABLE_BASE);
 }
 
 static void
@@ -243,7 +241,7 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 	      VDPU_REG_MV_ACCURACY_BWD(1);
 	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(136));
 
-	rk3399_vpu_mpeg2_dec_set_quantization(vpu, ctx);
+	rk3399_vpu_mpeg2_dec_set_quantisation(vpu, ctx);
 
 	rk3399_vpu_mpeg2_dec_set_buffers(vpu, ctx, &src_buf->vb2_buf,
 					 &dst_buf->vb2_buf,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 92812d1a39d4..62a5407664ae 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -37,7 +37,7 @@ static const struct cedrus_control cedrus_controls[] = {
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION,
+			.id	= V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION,
 		},
 		.codec		= CEDRUS_CODEC_MPEG2,
 	},
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 15f147dad4cb..6516bff3d319 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -69,7 +69,7 @@ struct cedrus_h264_run {
 
 struct cedrus_mpeg2_run {
 	const struct v4l2_ctrl_mpeg2_slice_params	*slice_params;
-	const struct v4l2_ctrl_mpeg2_quantization	*quantization;
+	const struct v4l2_ctrl_mpeg2_quantisation	*quantisation;
 };
 
 struct cedrus_h265_run {
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
index d696b3ec70c0..238f779d2ba4 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
@@ -42,8 +42,8 @@ void cedrus_device_run(void *priv)
 	case V4L2_PIX_FMT_MPEG2_SLICE:
 		run.mpeg2.slice_params = cedrus_find_control_data(ctx,
 			V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
-		run.mpeg2.quantization = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION);
+		run.mpeg2.quantisation = cedrus_find_control_data(ctx,
+			V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION);
 		break;
 
 	case V4L2_PIX_FMT_H264_SLICE:
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index 8bcd6b8f9e2d..459f71679a4f 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -13,9 +13,9 @@
 #include "cedrus_hw.h"
 #include "cedrus_regs.h"
 
-/* Default MPEG-2 quantization coefficients, from the specification. */
+/* Default MPEG-2 quantisation coefficients, from the specification. */
 
-static const u8 intra_quantization_matrix_default[64] = {
+static const u8 intra_quantisation_matrix_default[64] = {
 	8,  16, 16, 19, 16, 19, 22, 22,
 	22, 22, 22, 22, 26, 24, 26, 27,
 	27, 27, 26, 26, 26, 26, 27, 27,
@@ -26,7 +26,7 @@ static const u8 intra_quantization_matrix_default[64] = {
 	46, 46, 56, 56, 58, 69, 69, 83
 };
 
-static const u8 non_intra_quantization_matrix_default[64] = {
+static const u8 non_intra_quantisation_matrix_default[64] = {
 	16, 16, 16, 16, 16, 16, 16, 16,
 	16, 16, 16, 16, 16, 16, 16, 16,
 	16, 16, 16, 16, 16, 16, 16, 16,
@@ -77,7 +77,7 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	const struct v4l2_ctrl_mpeg2_slice_params *slice_params;
 	const struct v4l2_mpeg2_sequence *sequence;
 	const struct v4l2_mpeg2_picture *picture;
-	const struct v4l2_ctrl_mpeg2_quantization *quantization;
+	const struct v4l2_ctrl_mpeg2_quantisation *quantisation;
 	dma_addr_t src_buf_addr, dst_luma_addr, dst_chroma_addr;
 	dma_addr_t fwd_luma_addr, fwd_chroma_addr;
 	dma_addr_t bwd_luma_addr, bwd_chroma_addr;
@@ -93,17 +93,17 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	sequence = &slice_params->sequence;
 	picture = &slice_params->picture;
 
-	quantization = run->mpeg2.quantization;
+	quantisation = run->mpeg2.quantisation;
 
 	/* Activate MPEG engine. */
 	cedrus_engine_enable(ctx, CEDRUS_CODEC_MPEG2);
 
-	/* Set intra quantization matrix. */
+	/* Set intra quantisation matrix. */
 
-	if (quantization && quantization->load_intra_quantiser_matrix)
-		matrix = quantization->intra_quantiser_matrix;
+	if (quantisation && quantisation->load_intra_quantiser_matrix)
+		matrix = quantisation->intra_quantiser_matrix;
 	else
-		matrix = intra_quantization_matrix_default;
+		matrix = intra_quantisation_matrix_default;
 
 	for (i = 0; i < 64; i++) {
 		reg = VE_DEC_MPEG_IQMINPUT_WEIGHT(i, matrix[i]);
@@ -112,12 +112,12 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 		cedrus_write(dev, VE_DEC_MPEG_IQMINPUT, reg);
 	}
 
-	/* Set non-intra quantization matrix. */
+	/* Set non-intra quantisation matrix. */
 
-	if (quantization && quantization->load_non_intra_quantiser_matrix)
-		matrix = quantization->non_intra_quantiser_matrix;
+	if (quantisation && quantisation->load_non_intra_quantiser_matrix)
+		matrix = quantisation->non_intra_quantiser_matrix;
 	else
-		matrix = non_intra_quantization_matrix_default;
+		matrix = non_intra_quantisation_matrix_default;
 
 	for (i = 0; i < 64; i++) {
 		reg = VE_DEC_MPEG_IQMINPUT_WEIGHT(i, matrix[i]);
diff --git a/include/media/mpeg2-ctrls.h b/include/media/mpeg2-ctrls.h
index 2a4ae6701166..b8adf3ac2c1d 100644
--- a/include/media/mpeg2-ctrls.h
+++ b/include/media/mpeg2-ctrls.h
@@ -12,11 +12,11 @@
 #define _MPEG2_CTRLS_H_
 
 #define V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS		(V4L2_CID_CODEC_BASE+250)
-#define V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION		(V4L2_CID_CODEC_BASE+251)
+#define V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION		(V4L2_CID_CODEC_BASE+251)
 
 /* enum v4l2_ctrl_type type values */
 #define V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS 0x0103
-#define	V4L2_CTRL_TYPE_MPEG2_QUANTIZATION 0x0104
+#define	V4L2_CTRL_TYPE_MPEG2_QUANTISATION 0x0104
 
 #define V4L2_MPEG2_PICTURE_CODING_TYPE_I	1
 #define V4L2_MPEG2_PICTURE_CODING_TYPE_P	2
@@ -66,7 +66,7 @@ struct v4l2_ctrl_mpeg2_slice_params {
 	__u32	quantiser_scale_code;
 };
 
-struct v4l2_ctrl_mpeg2_quantization {
+struct v4l2_ctrl_mpeg2_quantisation {
 	/* ISO/IEC 13818-2, ITU-T Rec. H.262: Quant matrix extension */
 	__u8	load_intra_quantiser_matrix;
 	__u8	load_non_intra_quantiser_matrix;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index a5953b812878..a38e6bd02a6a 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -41,7 +41,7 @@ struct video_device;
  * @p_u32:			Pointer to a 32-bit unsigned value.
  * @p_char:			Pointer to a string.
  * @p_mpeg2_slice_params:	Pointer to a MPEG2 slice parameters structure.
- * @p_mpeg2_quantization:	Pointer to a MPEG2 quantization data structure.
+ * @p_mpeg2_quantisation:	Pointer to a MPEG2 quantisation data structure.
  * @p_fwht_params:		Pointer to a FWHT stateless parameters structure.
  * @p_h264_sps:			Pointer to a struct v4l2_ctrl_h264_sps.
  * @p_h264_pps:			Pointer to a struct v4l2_ctrl_h264_pps.
@@ -67,7 +67,7 @@ union v4l2_ctrl_ptr {
 	u32 *p_u32;
 	char *p_char;
 	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
-	struct v4l2_ctrl_mpeg2_quantization *p_mpeg2_quantization;
+	struct v4l2_ctrl_mpeg2_quantisation *p_mpeg2_quantisation;
 	struct v4l2_ctrl_fwht_params *p_fwht_params;
 	struct v4l2_ctrl_h264_sps *p_h264_sps;
 	struct v4l2_ctrl_h264_pps *p_h264_pps;
-- 
2.30.0

