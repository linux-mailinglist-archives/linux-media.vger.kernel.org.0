Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9E8E36AB2A
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 05:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbhDZDhe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Apr 2021 23:37:34 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38294 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231530AbhDZDhd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Apr 2021 23:37:33 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 0C3811F41F90
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
Subject: [PATCH v6 07/10] media: uapi: mpeg2: Remove V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS
Date:   Mon, 26 Apr 2021 00:35:19 -0300
Message-Id: <20210426033522.69395-8-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210426033522.69395-1-ezequiel@collabora.com>
References: <20210426033522.69395-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Hantro and Cedrus drivers work in frame-mode,
meaning they expect all the slices in a picture (either frame
or field structure) to be passed in each OUTPUT buffer.

These two are the only V4L2 MPEG-2 stateless decoders currently
supported. Given the VA-API drivers also work per-frame,
coalescing all the MPEG-2 slices in a buffer before the decoding
operation, it makes sense to not expect slice-mode drivers and
therefore remove V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS.

This is done to avoid carrying an unused interface. If needed,
this control can be added without breaking backwards compatibility.
Note that this would mean introducing a enumerator control to
specify the decoding mode (see V4L2_CID_STATELESS_H264_DECODE_MODE).

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Co-developed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../media/v4l/ext-ctrls-codec.rst             | 35 -------------------
 .../media/v4l/pixfmt-compressed.rst           |  6 ++--
 .../media/v4l/vidioc-queryctrl.rst            |  6 ----
 .../media/videodev2.h.rst.exceptions          |  1 -
 drivers/media/v4l2-core/v4l2-ctrls.c          | 19 ----------
 drivers/staging/media/hantro/hantro_drv.c     |  5 ---
 .../media/hantro/hantro_g1_mpeg2_dec.c        |  9 ++---
 .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    |  8 ++---
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  6 ----
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 -
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |  2 --
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c |  2 --
 include/media/mpeg2-ctrls.h                   | 16 ---------
 include/media/v4l2-ctrls.h                    |  2 --
 14 files changed, 7 insertions(+), 111 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 6628ead96b8b..af12c869e304 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1608,41 +1608,6 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
 
 .. _v4l2-mpeg-mpeg2:
 
-``V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS (struct)``
-    Specifies the slice parameters (as extracted from the bitstream) for the
-    associated MPEG-2 slice data. This includes the necessary parameters for
-    configuring a stateless hardware decoding pipeline for MPEG-2.
-    The bitstream parameters are defined according to :ref:`mpeg2part2`.
-
-    .. note::
-
-       This compound control is not yet part of the public kernel API and
-       it is expected to change.
-
-.. c:type:: v4l2_ctrl_mpeg2_slice_params
-
-.. tabularcolumns:: |p{5.6cm}|p{4.6cm}|p{7.1cm}|
-
-.. cssclass:: longtable
-
-.. flat-table:: struct v4l2_ctrl_mpeg2_slice_params
-    :header-rows:  0
-    :stub-columns: 0
-    :widths:       1 1 2
-
-    * - __u32
-      - ``bit_size``
-      - Size (in bits) of the current slice data.
-    * - __u32
-      - ``data_bit_offset``
-      - Offset (in bits) to the video data in the current slice data.
-    * - __u32
-      - ``quantiser_scale_code``
-      - Code used to determine the quantization scale to use for the IDCT.
-    * - __u8
-      - ``reserved``
-      - Applications and drivers must set this to zero.
-
 ``V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE (struct)``
     Specifies the sequence parameters (as extracted from the bitstream) for the
     associated MPEG-2 slice data. This includes fields matching the syntax
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
index bbbacbd65d6f..6c10a062adac 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-compressed.rst
@@ -114,9 +114,9 @@ Compressed Formats
 	This format is adapted for stateless video decoders that implement a
 	MPEG-2 pipeline (using the :ref:`mem2mem` and :ref:`media-request-api`).
 	Metadata associated with the frame to decode is required to be passed
-	through the ``V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE``,
-        ``V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE``, and ``V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS``
-        controls. Quantisation matrices can optionally be specified through the
+	through the ``V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE`` and
+        ``V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE`` controls.
+        Quantisation matrices can optionally be specified through the
 	``V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION`` control.
 	See the :ref:`associated Codec Control IDs <v4l2-mpeg-mpeg2>`.
 	Exactly one output and one capture buffer must be provided for use with
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index afc1505a3a7e..07e54029e1e9 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -417,12 +417,6 @@ See also the examples in :ref:`control`.
       - any
       - An unsigned 32-bit valued control ranging from minimum to maximum
 	inclusive. The step value indicates the increment between values.
-    * - ``V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS``
-      - n/a
-      - n/a
-      - n/a
-      - A struct :c:type:`v4l2_ctrl_mpeg2_slice_params`, containing MPEG-2
-	slice parameters for stateless video decoders.
     * - ``V4L2_CTRL_TYPE_MPEG2_QUANTISATION``
       - n/a
       - n/a
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 928fdc419ee3..2217b56c2686 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -136,7 +136,6 @@ replace symbol V4L2_CTRL_TYPE_U32 :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U8 :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_SEQUENCE :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_PICTURE :c:type:`v4l2_ctrl_type`
-replace symbol V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTISATION :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_H264_SPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_H264_PPS :c:type:`v4l2_ctrl_type`
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 59b16f70b093..6a033102d31b 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -979,7 +979,6 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE:		return "MPEG-2 Sequence Header";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE:			return "MPEG-2 Picture Header";
-	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice Parameters";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION:		return "MPEG-2 Quantisation Matrices";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
 	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
@@ -1507,9 +1506,6 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE:
 		*type = V4L2_CTRL_TYPE_MPEG2_PICTURE;
 		break;
-	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:
-		*type = V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS;
-		break;
 	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION:
 		*type = V4L2_CTRL_TYPE_MPEG2_QUANTISATION;
 		break;
@@ -1723,11 +1719,6 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	else
 		memset(p, 0, ctrl->elem_size);
 
-	/*
-	 * The cast is needed to get rid of a gcc warning complaining that
-	 * V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS is not part of the
-	 * v4l2_ctrl_type enum.
-	 */
 	switch ((u32)ctrl->type) {
 	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
 		p_mpeg2_sequence = p;
@@ -1925,7 +1916,6 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 {
 	struct v4l2_ctrl_mpeg2_sequence *p_mpeg2_sequence;
 	struct v4l2_ctrl_mpeg2_picture *p_mpeg2_picture;
-	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
 	struct v4l2_ctrl_vp8_frame *p_vp8_frame;
 	struct v4l2_ctrl_fwht_params *p_fwht_params;
 	struct v4l2_ctrl_h264_sps *p_h264_sps;
@@ -1988,12 +1978,6 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		zero_reserved(*p_mpeg2_picture);
 		break;
 
-	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
-		p_mpeg2_slice_params = p;
-
-		zero_reserved(*p_mpeg2_slice_params);
-		break;
-
 	case V4L2_CTRL_TYPE_MPEG2_QUANTISATION:
 		break;
 
@@ -2966,9 +2950,6 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_MPEG2_PICTURE:
 		elem_size = sizeof(struct v4l2_ctrl_mpeg2_picture);
 		break;
-	case V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS:
-		elem_size = sizeof(struct v4l2_ctrl_mpeg2_slice_params);
-		break;
 	case V4L2_CTRL_TYPE_MPEG2_QUANTISATION:
 		elem_size = sizeof(struct v4l2_ctrl_mpeg2_quantisation);
 		break;
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 067205fb89f6..f5fa7e0940c4 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -296,11 +296,6 @@ static const struct hantro_ctrl controls[] = {
 		.cfg = {
 			.id = V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE,
 		},
-	}, {
-		.codec = HANTRO_MPEG2_DECODER,
-		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS,
-		},
 	}, {
 		.codec = HANTRO_MPEG2_DECODER,
 		.cfg = {
diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
index c4040fba7c80..6d89cae7df45 100644
--- a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
@@ -93,8 +93,7 @@ hantro_g1_mpeg2_dec_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx,
 				struct vb2_buffer *src_buf,
 				struct vb2_buffer *dst_buf,
 				const struct v4l2_ctrl_mpeg2_sequence *seq,
-				const struct v4l2_ctrl_mpeg2_picture *pic,
-				const struct v4l2_ctrl_mpeg2_slice_params *slice_params)
+				const struct v4l2_ctrl_mpeg2_picture *pic)
 {
 	dma_addr_t forward_addr = 0, backward_addr = 0;
 	dma_addr_t current_addr, addr;
@@ -150,7 +149,6 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
-	const struct v4l2_ctrl_mpeg2_slice_params *slice_params;
 	const struct v4l2_ctrl_mpeg2_sequence *seq;
 	const struct v4l2_ctrl_mpeg2_picture *pic;
 	u32 reg;
@@ -161,8 +159,6 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 	/* Apply request controls if any */
 	hantro_start_prepare_run(ctx);
 
-	slice_params = hantro_get_ctrl(ctx,
-				       V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
 	seq = hantro_get_ctrl(ctx,
 			      V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE);
 	pic = hantro_get_ctrl(ctx,
@@ -232,10 +228,9 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 	vdpu_write_relaxed(vpu, reg, G1_SWREG(55));
 
 	hantro_g1_mpeg2_dec_set_quantisation(vpu, ctx);
-
 	hantro_g1_mpeg2_dec_set_buffers(vpu, ctx, &src_buf->vb2_buf,
 					&dst_buf->vb2_buf,
-					seq, pic, slice_params);
+					seq, pic);
 
 	hantro_end_prepare_run(ctx);
 
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
index 314269811244..d16d76760278 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
@@ -96,8 +96,7 @@ rk3399_vpu_mpeg2_dec_set_buffers(struct hantro_dev *vpu,
 				 struct vb2_buffer *src_buf,
 				 struct vb2_buffer *dst_buf,
 				 const struct v4l2_ctrl_mpeg2_sequence *seq,
-				 const struct v4l2_ctrl_mpeg2_picture *pic,
-				 const struct v4l2_ctrl_mpeg2_slice_params *slice_params)
+				 const struct v4l2_ctrl_mpeg2_picture *pic)
 {
 	dma_addr_t forward_addr = 0, backward_addr = 0;
 	dma_addr_t current_addr, addr;
@@ -153,7 +152,6 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
-	const struct v4l2_ctrl_mpeg2_slice_params *slice_params;
 	const struct v4l2_ctrl_mpeg2_sequence *seq;
 	const struct v4l2_ctrl_mpeg2_picture *pic;
 	u32 reg;
@@ -163,8 +161,6 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	hantro_start_prepare_run(ctx);
 
-	slice_params = hantro_get_ctrl(ctx,
-				       V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
 	seq = hantro_get_ctrl(ctx,
 			      V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE);
 	pic = hantro_get_ctrl(ctx,
@@ -241,7 +237,7 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	rk3399_vpu_mpeg2_dec_set_buffers(vpu, ctx, &src_buf->vb2_buf,
 					 &dst_buf->vb2_buf,
-					 seq, pic, slice_params);
+					 seq, pic);
 
 	/* Kick the watchdog and start decoding */
 	hantro_end_prepare_run(ctx);
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 878752b30c10..4430c8fa2cc7 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -41,12 +41,6 @@ static const struct cedrus_control cedrus_controls[] = {
 		},
 		.codec		= CEDRUS_CODEC_MPEG2,
 	},
-	{
-		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS,
-		},
-		.codec		= CEDRUS_CODEC_MPEG2,
-	},
 	{
 		.cfg = {
 			.id	= V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 989873ccb98c..bbcdcd0787cf 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -70,7 +70,6 @@ struct cedrus_h264_run {
 struct cedrus_mpeg2_run {
 	const struct v4l2_ctrl_mpeg2_sequence		*sequence;
 	const struct v4l2_ctrl_mpeg2_picture		*picture;
-	const struct v4l2_ctrl_mpeg2_slice_params	*slice_params;
 	const struct v4l2_ctrl_mpeg2_quantisation	*quantisation;
 };
 
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
index f4cc6aebfac9..e98185c1f5a7 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
@@ -44,8 +44,6 @@ void cedrus_device_run(void *priv)
 			V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE);
 		run.mpeg2.picture = cedrus_find_control_data(ctx,
 			V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE);
-		run.mpeg2.slice_params = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
 		run.mpeg2.quantisation = cedrus_find_control_data(ctx,
 			V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION);
 		break;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index fd71cb175318..5dad2f296c6d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -50,7 +50,6 @@ static void cedrus_mpeg2_irq_disable(struct cedrus_ctx *ctx)
 
 static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 {
-	const struct v4l2_ctrl_mpeg2_slice_params *slice_params;
 	const struct v4l2_ctrl_mpeg2_sequence *seq;
 	const struct v4l2_ctrl_mpeg2_picture *pic;
 	const struct v4l2_ctrl_mpeg2_quantisation *quantisation;
@@ -65,7 +64,6 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	unsigned int i;
 	u32 reg;
 
-	slice_params = run->mpeg2.slice_params;
 	seq = run->mpeg2.sequence;
 	pic = run->mpeg2.picture;
 
diff --git a/include/media/mpeg2-ctrls.h b/include/media/mpeg2-ctrls.h
index 13178022e30a..388a796cf75d 100644
--- a/include/media/mpeg2-ctrls.h
+++ b/include/media/mpeg2-ctrls.h
@@ -11,13 +11,11 @@
 #ifndef _MPEG2_CTRLS_H_
 #define _MPEG2_CTRLS_H_
 
-#define V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS		(V4L2_CID_CODEC_BASE+250)
 #define V4L2_CID_MPEG_VIDEO_MPEG2_QUANTISATION		(V4L2_CID_CODEC_BASE+251)
 #define V4L2_CID_MPEG_VIDEO_MPEG2_SEQUENCE		(V4L2_CID_CODEC_BASE+252)
 #define V4L2_CID_MPEG_VIDEO_MPEG2_PICTURE		(V4L2_CID_CODEC_BASE+253)
 
 /* enum v4l2_ctrl_type type values */
-#define V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS 0x0130
 #define V4L2_CTRL_TYPE_MPEG2_QUANTISATION 0x0131
 #define V4L2_CTRL_TYPE_MPEG2_SEQUENCE 0x0132
 #define V4L2_CTRL_TYPE_MPEG2_PICTURE 0x0133
@@ -101,20 +99,6 @@ struct v4l2_ctrl_mpeg2_picture {
 	__u8	reserved;
 };
 
-/**
- * struct v4l2_ctrl_mpeg2_slice_params - MPEG-2 slice header
- *
- * @quantiser_scale_code: quantiser scale integer matching an
- * homonymous syntax element.
- * @reserved: padding field. Should be zeroed by applications.
- */
-struct v4l2_ctrl_mpeg2_slice_params {
-	__u32	bit_size;
-	__u32	data_bit_offset;
-	__u32	quantiser_scale_code;
-	__u32	reserved;
-};
-
 /**
  * struct v4l2_ctrl_mpeg2_quantisation - MPEG-2 quantisation
  *
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 572ff7eb7be1..215e44172c66 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -42,7 +42,6 @@ struct video_device;
  * @p_char:			Pointer to a string.
  * @p_mpeg2_sequence:		Pointer to a MPEG2 sequence structure.
  * @p_mpeg2_picture:		Pointer to a MPEG2 picture structure.
- * @p_mpeg2_slice_params:	Pointer to a MPEG2 slice parameters structure.
  * @p_mpeg2_quantisation:	Pointer to a MPEG2 quantisation data structure.
  * @p_fwht_params:		Pointer to a FWHT stateless parameters structure.
  * @p_h264_sps:			Pointer to a struct v4l2_ctrl_h264_sps.
@@ -70,7 +69,6 @@ union v4l2_ctrl_ptr {
 	char *p_char;
 	struct v4l2_ctrl_mpeg2_sequence *p_mpeg2_sequence;
 	struct v4l2_ctrl_mpeg2_picture *p_mpeg2_picture;
-	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
 	struct v4l2_ctrl_mpeg2_quantisation *p_mpeg2_quantisation;
 	struct v4l2_ctrl_fwht_params *p_fwht_params;
 	struct v4l2_ctrl_h264_sps *p_h264_sps;
-- 
2.30.0

