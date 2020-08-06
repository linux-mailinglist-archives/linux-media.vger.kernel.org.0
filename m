Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A072423DF16
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730673AbgHFRg4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 13:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729824AbgHFRfI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 13:35:08 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D29FC00869E;
        Thu,  6 Aug 2020 08:18:46 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 6FF31299598
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
Subject: [PATCH v2 03/14] media: uapi: h264: Split prediction weight parameters
Date:   Thu,  6 Aug 2020 12:12:59 -0300
Message-Id: <20200806151310.98624-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806151310.98624-1-ezequiel@collabora.com>
References: <20200806151310.98624-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The prediction weight parameters are only required under
certain conditions, which depend on slice header parameters.

As specified in section 7.3.3 Slice header syntax, the prediction
weight table is present if:

((weighted_pred_flag && (slice_type == P || slice_type == SP)) || \
(weighted_bipred_idc == 1 && slice_type == B))

Given its size, it makes sense to move this table to its control,
so applications can avoid passing it if the slice doesn't specify it.

Before this change struct v4l2_ctrl_h264_slice_params was 960 bytes.
With this change, it's 188 bytes and struct v4l2_ctrl_h264_pred_weight
is 772 bytes.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
v2: Fix missing Cedrus changes and mssing control declaration,
    as noted by Hans and Jernej.
---
 .../media/v4l/ext-ctrls-codec.rst             | 19 ++++++++++++-------
 drivers/media/v4l2-core/v4l2-ctrls.c          |  8 ++++++++
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  7 +++++++
 drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |  2 ++
 .../staging/media/sunxi/cedrus/cedrus_h264.c  |  6 ++----
 include/media/h264-ctrls.h                    |  5 +++--
 include/media/v4l2-ctrls.h                    |  2 ++
 8 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index d1438b1e259f..c36ce5a95fc5 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1879,18 +1879,23 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       - 0x00000008
       -
 
-``Prediction Weight Table``
+``V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS (struct)``
+    Prediction weight table defined according to :ref:`h264`,
+    section 7.4.3.2 "Prediction Weight Table Semantics".
+    The prediction weight table must be passed by applications
+    under the conditions explained in section 7.3.3 "Slice header
+    syntax".
 
-    The bitstream parameters are defined according to :ref:`h264`,
-    section 7.4.3.2 "Prediction Weight Table Semantics". For further
-    documentation, refer to the above specification, unless there is
-    an explicit comment stating otherwise.
+    .. note::
+
+       This compound control is not yet part of the public kernel API and
+       it is expected to change.
 
-.. c:type:: v4l2_h264_pred_weight_table
+.. c:type:: v4l2_ctrl_h264_pred_weights
 
 .. cssclass:: longtable
 
-.. flat-table:: struct v4l2_h264_pred_weight_table
+.. flat-table:: struct v4l2_ctrl_h264_pred_weights
     :header-rows:  0
     :stub-columns: 0
     :widths:       1 1 2
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 3f3fbcd60cc6..76c8dc8fb31c 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -897,6 +897,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
 	case V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE:		return "H264 Decode Mode";
 	case V4L2_CID_MPEG_VIDEO_H264_START_CODE:		return "H264 Start Code";
+	case V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS:		return "H264 Prediction Weight Table";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:			return "MPEG2 Level";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:			return "MPEG2 Profile";
 	case V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:		return "MPEG4 I-Frame QP Value";
@@ -1412,6 +1413,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:
 		*type = V4L2_CTRL_TYPE_H264_DECODE_PARAMS;
 		break;
+	case V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS:
+		*type = V4L2_CTRL_TYPE_H264_PRED_WEIGHTS;
+		break;
 	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:
 		*type = V4L2_CTRL_TYPE_VP8_FRAME_HEADER;
 		break;
@@ -1790,6 +1794,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	case V4L2_CTRL_TYPE_H264_SPS:
 	case V4L2_CTRL_TYPE_H264_PPS:
 	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
+	case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
 	case V4L2_CTRL_TYPE_H264_SLICE_PARAMS:
 	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
 		break;
@@ -2553,6 +2558,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
 		elem_size = sizeof(struct v4l2_ctrl_h264_decode_params);
 		break;
+	case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
+		elem_size = sizeof(struct v4l2_ctrl_h264_pred_weights);
+		break;
 	case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
 		elem_size = sizeof(struct v4l2_ctrl_vp8_frame_header);
 		break;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index bc27f9430eeb..027cdd1be5a0 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -78,6 +78,13 @@ static const struct cedrus_control cedrus_controls[] = {
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= true,
 	},
+	{
+		.cfg = {
+			.id	= V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS,
+		},
+		.codec		= CEDRUS_CODEC_H264,
+		.required	= true,
+	},
 	{
 		.cfg = {
 			.id	= V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 96765555ab8a..93c843ae14bb 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -62,6 +62,7 @@ struct cedrus_h264_run {
 	const struct v4l2_ctrl_h264_scaling_matrix	*scaling_matrix;
 	const struct v4l2_ctrl_h264_slice_params	*slice_params;
 	const struct v4l2_ctrl_h264_sps			*sps;
+	const struct v4l2_ctrl_h264_pred_weights	*pred_weights;
 };
 
 struct cedrus_mpeg2_run {
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
index 58c48e4fdfe9..6385026d1b6b 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
@@ -57,6 +57,8 @@ void cedrus_device_run(void *priv)
 			V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS);
 		run.h264.sps = cedrus_find_control_data(ctx,
 			V4L2_CID_MPEG_VIDEO_H264_SPS);
+		run.h264.pred_weights = cedrus_find_control_data(ctx,
+			V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS);
 		break;
 
 	case V4L2_PIX_FMT_HEVC_SLICE:
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index cce527bbdf86..a9ba78b15907 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -256,10 +256,8 @@ static void cedrus_write_scaling_lists(struct cedrus_ctx *ctx,
 static void cedrus_write_pred_weight_table(struct cedrus_ctx *ctx,
 					   struct cedrus_run *run)
 {
-	const struct v4l2_ctrl_h264_slice_params *slice =
-		run->h264.slice_params;
-	const struct v4l2_h264_pred_weight_table *pred_weight =
-		&slice->pred_weight_table;
+	const struct v4l2_ctrl_h264_pred_weights *pred_weight =
+		run->h264.pred_weights;
 	struct cedrus_dev *dev = ctx->dev;
 	int i, j, k;
 
diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index 4c0bb7f5fb05..54cd9bec0b23 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -36,6 +36,7 @@
 #define V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS	(V4L2_CID_MPEG_BASE+1004)
 #define V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE	(V4L2_CID_MPEG_BASE+1005)
 #define V4L2_CID_MPEG_VIDEO_H264_START_CODE	(V4L2_CID_MPEG_BASE+1006)
+#define V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS	(V4L2_CID_MPEG_BASE+1007)
 
 /* enum v4l2_ctrl_type type values */
 #define V4L2_CTRL_TYPE_H264_SPS			0x0110
@@ -43,6 +44,7 @@
 #define V4L2_CTRL_TYPE_H264_SCALING_MATRIX	0x0112
 #define V4L2_CTRL_TYPE_H264_SLICE_PARAMS	0x0113
 #define V4L2_CTRL_TYPE_H264_DECODE_PARAMS	0x0114
+#define V4L2_CTRL_TYPE_H264_PRED_WEIGHTS	0x0115
 
 enum v4l2_mpeg_video_h264_decode_mode {
 	V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED,
@@ -125,7 +127,7 @@ struct v4l2_h264_weight_factors {
 	__s16 chroma_offset[32][2];
 };
 
-struct v4l2_h264_pred_weight_table {
+struct v4l2_ctrl_h264_pred_weights {
 	__u16 luma_log2_weight_denom;
 	__u16 chroma_log2_weight_denom;
 	struct v4l2_h264_weight_factors weight_factors[2];
@@ -177,7 +179,6 @@ struct v4l2_ctrl_h264_slice_params {
 	__s32 delta_pic_order_cnt0;
 	__s32 delta_pic_order_cnt1;
 
-	struct v4l2_h264_pred_weight_table pred_weight_table;
 	/* Size in bits of dec_ref_pic_marking() syntax element. */
 	__u32 dec_ref_pic_marking_bit_size;
 	/* Size in bits of pic order count syntax. */
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index f40e2cbb21d3..cb25f345e9ad 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -51,6 +51,7 @@ struct video_device;
  * @p_h264_scaling_matrix:	Pointer to a struct v4l2_ctrl_h264_scaling_matrix.
  * @p_h264_slice_params:	Pointer to a struct v4l2_ctrl_h264_slice_params.
  * @p_h264_decode_params:	Pointer to a struct v4l2_ctrl_h264_decode_params.
+ * @p_h264_pred_weights:	Pointer to a struct v4l2_ctrl_h264_pred_weights.
  * @p_vp8_frame_header:		Pointer to a VP8 frame header structure.
  * @p_hevc_sps:			Pointer to an HEVC sequence parameter set structure.
  * @p_hevc_pps:			Pointer to an HEVC picture parameter set structure.
@@ -74,6 +75,7 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_h264_scaling_matrix *p_h264_scaling_matrix;
 	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
 	struct v4l2_ctrl_h264_decode_params *p_h264_decode_params;
+	struct v4l2_ctrl_h264_pred_weights *p_h264_pred_weights;
 	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
 	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
 	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
-- 
2.27.0

