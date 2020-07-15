Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9749221614
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 22:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbgGOUXL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 16:23:11 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37128 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbgGOUXK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 16:23:10 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 102692A5175
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
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 03/10] media: uapi: h264: Split prediction weight parameters
Date:   Wed, 15 Jul 2020 17:22:26 -0300
Message-Id: <20200715202233.185680-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715202233.185680-1-ezequiel@collabora.com>
References: <20200715202233.185680-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The prediction weight parameters are only required under
certain conditions, which depend on slice header parameters.

The slice header syntax specifies that the prediction
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
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 14 +++++++++-----
 drivers/media/v4l2-core/v4l2-ctrls.c               |  6 ++++++
 drivers/staging/media/sunxi/cedrus/cedrus.h        |  1 +
 drivers/staging/media/sunxi/cedrus/cedrus_dec.c    |  2 ++
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c   |  6 ++----
 include/media/h264-ctrls.h                         |  5 +++--
 6 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 16bfc98ab2f6..d1695ae96700 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1879,18 +1879,22 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       - 0x00000008
       -
 
-``Prediction Weight Table``
-
-    The bitstream parameters are defined according to :ref:`h264`,
+``V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHT (struct)``
+    Prediction weight table defined according to :ref:`h264`,
     section 7.4.3.2 "Prediction Weight Table Semantics". For further
     documentation, refer to the above specification, unless there is
     an explicit comment stating otherwise.
 
-.. c:type:: v4l2_h264_pred_weight_table
+    .. note::
+
+       This compound control is not yet part of the public kernel API and
+       it is expected to change.
+
+.. c:type:: v4l2_ctrl_h264_pred_weight
 
 .. cssclass:: longtable
 
-.. flat-table:: struct v4l2_h264_pred_weight_table
+.. flat-table:: struct v4l2_ctrl_h264_pred_weight
     :header-rows:  0
     :stub-columns: 0
     :widths:       1 1 2
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 3f3fbcd60cc6..3a8a23e34c70 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1412,6 +1412,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:
 		*type = V4L2_CTRL_TYPE_H264_DECODE_PARAMS;
 		break;
+	case V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHT:
+		*type = V4L2_CTRL_TYPE_H264_PRED_WEIGHT;
+		break;
 	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:
 		*type = V4L2_CTRL_TYPE_VP8_FRAME_HEADER;
 		break;
@@ -2553,6 +2556,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_H264_DECODE_PARAMS:
 		elem_size = sizeof(struct v4l2_ctrl_h264_decode_params);
 		break;
+	case V4L2_CTRL_TYPE_H264_PRED_WEIGHT:
+		elem_size = sizeof(struct v4l2_ctrl_h264_pred_weight);
+		break;
 	case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
 		elem_size = sizeof(struct v4l2_ctrl_vp8_frame_header);
 		break;
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 96765555ab8a..80a0ecffa384 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -62,6 +62,7 @@ struct cedrus_h264_run {
 	const struct v4l2_ctrl_h264_scaling_matrix	*scaling_matrix;
 	const struct v4l2_ctrl_h264_slice_params	*slice_params;
 	const struct v4l2_ctrl_h264_sps			*sps;
+	const struct v4l2_ctrl_h264_pred_weight		*pred_weight;
 };
 
 struct cedrus_mpeg2_run {
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
index 58c48e4fdfe9..047f773f64f9 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
@@ -57,6 +57,8 @@ void cedrus_device_run(void *priv)
 			V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS);
 		run.h264.sps = cedrus_find_control_data(ctx,
 			V4L2_CID_MPEG_VIDEO_H264_SPS);
+		run.h264.pred_weight = cedrus_find_control_data(ctx,
+			V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHT);
 		break;
 
 	case V4L2_PIX_FMT_HEVC_SLICE:
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index cce527bbdf86..614b1b496e40 100644
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
+	const struct v4l2_ctrl_h264_pred_weight *pred_weight =
+		run->h264.pred_weight;
 	struct cedrus_dev *dev = ctx->dev;
 	int i, j, k;
 
diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
index bca4a9887e7e..da2ffb77b491 100644
--- a/include/media/h264-ctrls.h
+++ b/include/media/h264-ctrls.h
@@ -36,6 +36,7 @@
 #define V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS	(V4L2_CID_MPEG_BASE+1004)
 #define V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE	(V4L2_CID_MPEG_BASE+1005)
 #define V4L2_CID_MPEG_VIDEO_H264_START_CODE	(V4L2_CID_MPEG_BASE+1006)
+#define V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHT	(V4L2_CID_MPEG_BASE+1007)
 
 /* enum v4l2_ctrl_type type values */
 #define V4L2_CTRL_TYPE_H264_SPS			0x0110
@@ -43,6 +44,7 @@
 #define V4L2_CTRL_TYPE_H264_SCALING_MATRIX	0x0112
 #define V4L2_CTRL_TYPE_H264_SLICE_PARAMS	0x0113
 #define V4L2_CTRL_TYPE_H264_DECODE_PARAMS	0x0114
+#define V4L2_CTRL_TYPE_H264_PRED_WEIGHT		0x0115
 
 enum v4l2_mpeg_video_h264_decode_mode {
 	V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED,
@@ -125,7 +127,7 @@ struct v4l2_h264_weight_factors {
 	__s16 chroma_offset[32][2];
 };
 
-struct v4l2_h264_pred_weight_table {
+struct v4l2_ctrl_h264_pred_weight {
 	__u16 luma_log2_weight_denom;
 	__u16 chroma_log2_weight_denom;
 	struct v4l2_h264_weight_factors weight_factors[2];
@@ -174,7 +176,6 @@ struct v4l2_ctrl_h264_slice_params {
 	__s32 delta_pic_order_cnt0;
 	__s32 delta_pic_order_cnt1;
 
-	struct v4l2_h264_pred_weight_table pred_weight_table;
 	/* Size in bits of dec_ref_pic_marking() syntax element. */
 	__u32 dec_ref_pic_marking_bit_size;
 	/* Size in bits of pic order count syntax. */
-- 
2.27.0

