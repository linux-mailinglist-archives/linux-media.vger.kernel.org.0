Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38A512C5174
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 10:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389686AbgKZJhg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 04:37:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389633AbgKZJhf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 04:37:35 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7607CC0613D4;
        Thu, 26 Nov 2020 01:37:35 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 769A31F4575B
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
Subject: [PATCH v5 13/14] media: uapi: move H264 stateless controls out of staging
Date:   Thu, 26 Nov 2020 06:36:17 -0300
Message-Id: <20201126093618.137292-14-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201126093618.137292-1-ezequiel@collabora.com>
References: <20201126093618.137292-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The H264 stateless controls is ready to be part
of the stable uAPI.

Re-number the control IDs, move them to the newly
created stateless control class, and updates all
the drivers accordingly.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Tested-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/media/v4l2-core/v4l2-ctrls.c          |  36 +-
 drivers/staging/media/hantro/hantro_drv.c     |  26 +-
 drivers/staging/media/hantro/hantro_h264.c    |   8 +-
 drivers/staging/media/rkvdec/rkvdec-h264.c    |   8 +-
 drivers/staging/media/rkvdec/rkvdec.c         |  26 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |  24 +-
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |  12 +-
 include/media/h264-ctrls.h                    | 404 ------------------
 include/media/v4l2-ctrls.h                    |   1 -
 include/uapi/linux/v4l2-controls.h            | 381 +++++++++++++++++
 include/uapi/linux/videodev2.h                |   6 +
 11 files changed, 457 insertions(+), 475 deletions(-)
 delete mode 100644 include/media/h264-ctrls.h

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 2a5e3d3cc756..88231ba7b0fa 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -693,9 +693,9 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		return h264_fp_arrangement_type;
 	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
 		return h264_fmo_map_type;
-	case V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE:
+	case V4L2_CID_STATELESS_H264_DECODE_MODE:
 		return h264_decode_mode;
-	case V4L2_CID_MPEG_VIDEO_H264_START_CODE:
+	case V4L2_CID_STATELESS_H264_START_CODE:
 		return h264_start_code;
 	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
 		return mpeg_mpeg2_level;
@@ -920,14 +920,6 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP:		return "H264 I-Frame Maximum QP Value";
 	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP:		return "H264 P-Frame Minimum QP Value";
 	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP:		return "H264 P-Frame Maximum QP Value";
-	case V4L2_CID_MPEG_VIDEO_H264_SPS:			return "H264 Sequence Parameter Set";
-	case V4L2_CID_MPEG_VIDEO_H264_PPS:			return "H264 Picture Parameter Set";
-	case V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX:		return "H264 Scaling Matrix";
-	case V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS:		return "H264 Slice Parameters";
-	case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
-	case V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE:		return "H264 Decode Mode";
-	case V4L2_CID_MPEG_VIDEO_H264_START_CODE:		return "H264 Start Code";
-	case V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS:		return "H264 Prediction Weight Table";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:			return "MPEG2 Level";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:			return "MPEG2 Profile";
 	case V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:		return "MPEG4 I-Frame QP Value";
@@ -1185,6 +1177,14 @@ const char *v4l2_ctrl_get_name(u32 id)
 	/* Stateless Codec controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
 	case V4L2_CID_CODEC_STATELESS_CLASS:	return "Stateless Codec Controls";
+	case V4L2_CID_STATELESS_H264_DECODE_MODE:		return "H264 Decode Mode";
+	case V4L2_CID_STATELESS_H264_START_CODE:		return "H264 Start Code";
+	case V4L2_CID_STATELESS_H264_SPS:			return "H264 Sequence Parameter Set";
+	case V4L2_CID_STATELESS_H264_PPS:			return "H264 Picture Parameter Set";
+	case V4L2_CID_STATELESS_H264_SCALING_MATRIX:		return "H264 Scaling Matrix";
+	case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:		return "H264 Prediction Weight Table";
+	case V4L2_CID_STATELESS_H264_SLICE_PARAMS:		return "H264 Slice Parameters";
+	case V4L2_CID_STATELESS_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
 	default:
 		return NULL;
 	}
@@ -1310,8 +1310,6 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:
 	case V4L2_CID_MPEG_VIDEO_H264_SEI_FP_ARRANGEMENT_TYPE:
 	case V4L2_CID_MPEG_VIDEO_H264_FMO_MAP_TYPE:
-	case V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE:
-	case V4L2_CID_MPEG_VIDEO_H264_START_CODE:
 	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:
 	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:
 	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
@@ -1342,6 +1340,8 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE:
 	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:
 	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:
+	case V4L2_CID_STATELESS_H264_DECODE_MODE:
+	case V4L2_CID_STATELESS_H264_START_CODE:
 	case V4L2_CID_CAMERA_ORIENTATION:
 		*type = V4L2_CTRL_TYPE_MENU;
 		break;
@@ -1436,22 +1436,22 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:
 		*type = V4L2_CTRL_TYPE_FWHT_PARAMS;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_SPS:
+	case V4L2_CID_STATELESS_H264_SPS:
 		*type = V4L2_CTRL_TYPE_H264_SPS;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_PPS:
+	case V4L2_CID_STATELESS_H264_PPS:
 		*type = V4L2_CTRL_TYPE_H264_PPS;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX:
+	case V4L2_CID_STATELESS_H264_SCALING_MATRIX:
 		*type = V4L2_CTRL_TYPE_H264_SCALING_MATRIX;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS:
+	case V4L2_CID_STATELESS_H264_SLICE_PARAMS:
 		*type = V4L2_CTRL_TYPE_H264_SLICE_PARAMS;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS:
+	case V4L2_CID_STATELESS_H264_DECODE_PARAMS:
 		*type = V4L2_CTRL_TYPE_H264_DECODE_PARAMS;
 		break;
-	case V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS:
+	case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:
 		*type = V4L2_CTRL_TYPE_H264_PRED_WEIGHTS;
 		break;
 	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 3cd00cc0a364..e5f200e64993 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -231,7 +231,7 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 
 static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
 {
-	if (ctrl->id == V4L2_CID_MPEG_VIDEO_H264_SPS) {
+	if (ctrl->id == V4L2_CID_STATELESS_H264_SPS) {
 		const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p_h264_sps;
 
 		if (sps->chroma_format_idc > 1)
@@ -304,39 +304,39 @@ static const struct hantro_ctrl controls[] = {
 	}, {
 		.codec = HANTRO_H264_DECODER,
 		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
+			.id = V4L2_CID_STATELESS_H264_DECODE_PARAMS,
 		},
 	}, {
 		.codec = HANTRO_H264_DECODER,
 		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_H264_SPS,
+			.id = V4L2_CID_STATELESS_H264_SPS,
 			.ops = &hantro_ctrl_ops,
 		},
 	}, {
 		.codec = HANTRO_H264_DECODER,
 		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_H264_PPS,
+			.id = V4L2_CID_STATELESS_H264_PPS,
 		},
 	}, {
 		.codec = HANTRO_H264_DECODER,
 		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
+			.id = V4L2_CID_STATELESS_H264_SCALING_MATRIX,
 		},
 	}, {
 		.codec = HANTRO_H264_DECODER,
 		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE,
-			.min = V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
-			.def = V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
-			.max = V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
+			.id = V4L2_CID_STATELESS_H264_DECODE_MODE,
+			.min = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
+			.def = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
+			.max = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
 		},
 	}, {
 		.codec = HANTRO_H264_DECODER,
 		.cfg = {
-			.id = V4L2_CID_MPEG_VIDEO_H264_START_CODE,
-			.min = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
-			.def = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
-			.max = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
+			.id = V4L2_CID_STATELESS_H264_START_CODE,
+			.min = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
+			.def = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
+			.max = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
 		},
 	}, {
 		.codec = HANTRO_H264_DECODER,
diff --git a/drivers/staging/media/hantro/hantro_h264.c b/drivers/staging/media/hantro/hantro_h264.c
index b1bdc00ac262..ed6eaf11d96f 100644
--- a/drivers/staging/media/hantro/hantro_h264.c
+++ b/drivers/staging/media/hantro/hantro_h264.c
@@ -344,22 +344,22 @@ int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx)
 	hantro_start_prepare_run(ctx);
 
 	ctrls->scaling =
-		hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX);
+		hantro_get_ctrl(ctx, V4L2_CID_STATELESS_H264_SCALING_MATRIX);
 	if (WARN_ON(!ctrls->scaling))
 		return -EINVAL;
 
 	ctrls->decode =
-		hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS);
+		hantro_get_ctrl(ctx, V4L2_CID_STATELESS_H264_DECODE_PARAMS);
 	if (WARN_ON(!ctrls->decode))
 		return -EINVAL;
 
 	ctrls->sps =
-		hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_H264_SPS);
+		hantro_get_ctrl(ctx, V4L2_CID_STATELESS_H264_SPS);
 	if (WARN_ON(!ctrls->sps))
 		return -EINVAL;
 
 	ctrls->pps =
-		hantro_get_ctrl(ctx, V4L2_CID_MPEG_VIDEO_H264_PPS);
+		hantro_get_ctrl(ctx, V4L2_CID_STATELESS_H264_PPS);
 	if (WARN_ON(!ctrls->pps))
 		return -EINVAL;
 
diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index 7cc3b478a5f4..76e97cbe2512 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -1067,16 +1067,16 @@ static void rkvdec_h264_run_preamble(struct rkvdec_ctx *ctx,
 	struct v4l2_ctrl *ctrl;
 
 	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
-			      V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS);
+			      V4L2_CID_STATELESS_H264_DECODE_PARAMS);
 	run->decode_params = ctrl ? ctrl->p_cur.p : NULL;
 	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
-			      V4L2_CID_MPEG_VIDEO_H264_SPS);
+			      V4L2_CID_STATELESS_H264_SPS);
 	run->sps = ctrl ? ctrl->p_cur.p : NULL;
 	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
-			      V4L2_CID_MPEG_VIDEO_H264_PPS);
+			      V4L2_CID_STATELESS_H264_PPS);
 	run->pps = ctrl ? ctrl->p_cur.p : NULL;
 	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
-			      V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX);
+			      V4L2_CID_STATELESS_H264_SCALING_MATRIX);
 	run->scaling_matrix = ctrl ? ctrl->p_cur.p : NULL;
 
 	rkvdec_run_preamble(ctx, &run->base);
diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index fe65f55d3b49..aa4f8c287618 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -29,7 +29,7 @@
 
 static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
 {
-	if (ctrl->id == V4L2_CID_MPEG_VIDEO_H264_SPS) {
+	if (ctrl->id == V4L2_CID_STATELESS_H264_SPS) {
 		const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p_h264_sps;
 		/*
 		 * TODO: The hardware supports 10-bit and 4:2:2 profiles,
@@ -56,31 +56,31 @@ static const struct v4l2_ctrl_ops rkvdec_ctrl_ops = {
 static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
 	{
 		.mandatory = true,
-		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
+		.cfg.id = V4L2_CID_STATELESS_H264_DECODE_PARAMS,
 	},
 	{
 		.mandatory = true,
-		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_SPS,
+		.cfg.id = V4L2_CID_STATELESS_H264_SPS,
 		.cfg.ops = &rkvdec_ctrl_ops,
 	},
 	{
 		.mandatory = true,
-		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PPS,
+		.cfg.id = V4L2_CID_STATELESS_H264_PPS,
 	},
 	{
-		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
+		.cfg.id = V4L2_CID_STATELESS_H264_SCALING_MATRIX,
 	},
 	{
-		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE,
-		.cfg.min = V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
-		.cfg.max = V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
-		.cfg.def = V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
+		.cfg.id = V4L2_CID_STATELESS_H264_DECODE_MODE,
+		.cfg.min = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
+		.cfg.max = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
+		.cfg.def = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
 	},
 	{
-		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_START_CODE,
-		.cfg.min = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
-		.cfg.def = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
-		.cfg.max = V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
+		.cfg.id = V4L2_CID_STATELESS_H264_START_CODE,
+		.cfg.min = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
+		.cfg.def = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
+		.cfg.max = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
 	},
 	{
 		.cfg.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 97000f0e0011..233b487cefde 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -45,60 +45,60 @@ static const struct cedrus_control cedrus_controls[] = {
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
+			.id	= V4L2_CID_STATELESS_H264_DECODE_PARAMS,
 		},
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= true,
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS,
+			.id	= V4L2_CID_STATELESS_H264_SLICE_PARAMS,
 		},
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= true,
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_H264_SPS,
+			.id	= V4L2_CID_STATELESS_H264_SPS,
 		},
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= true,
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_H264_PPS,
+			.id	= V4L2_CID_STATELESS_H264_PPS,
 		},
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= true,
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
+			.id	= V4L2_CID_STATELESS_H264_SCALING_MATRIX,
 		},
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= false,
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS,
+			.id	= V4L2_CID_STATELESS_H264_PRED_WEIGHTS,
 		},
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= false,
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE,
-			.max	= V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED,
-			.def	= V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED,
+			.id	= V4L2_CID_STATELESS_H264_DECODE_MODE,
+			.max	= V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
+			.def	= V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
 		},
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= false,
 	},
 	{
 		.cfg = {
-			.id	= V4L2_CID_MPEG_VIDEO_H264_START_CODE,
-			.max	= V4L2_MPEG_VIDEO_H264_START_CODE_NONE,
-			.def	= V4L2_MPEG_VIDEO_H264_START_CODE_NONE,
+			.id	= V4L2_CID_STATELESS_H264_START_CODE,
+			.max	= V4L2_STATELESS_H264_START_CODE_NONE,
+			.def	= V4L2_STATELESS_H264_START_CODE_NONE,
 		},
 		.codec		= CEDRUS_CODEC_H264,
 		.required	= false,
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
index 6385026d1b6b..639ad348ddec 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
@@ -48,17 +48,17 @@ void cedrus_device_run(void *priv)
 
 	case V4L2_PIX_FMT_H264_SLICE:
 		run.h264.decode_params = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS);
+			V4L2_CID_STATELESS_H264_DECODE_PARAMS);
 		run.h264.pps = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_H264_PPS);
+			V4L2_CID_STATELESS_H264_PPS);
 		run.h264.scaling_matrix = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX);
+			V4L2_CID_STATELESS_H264_SCALING_MATRIX);
 		run.h264.slice_params = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS);
+			V4L2_CID_STATELESS_H264_SLICE_PARAMS);
 		run.h264.sps = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_H264_SPS);
+			V4L2_CID_STATELESS_H264_SPS);
 		run.h264.pred_weights = cedrus_find_control_data(ctx,
-			V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS);
+			V4L2_CID_STATELESS_H264_PRED_WEIGHTS);
 		break;
 
 	case V4L2_PIX_FMT_HEVC_SLICE:
diff --git a/include/media/h264-ctrls.h b/include/media/h264-ctrls.h
deleted file mode 100644
index c15fed956bf5..000000000000
--- a/include/media/h264-ctrls.h
+++ /dev/null
@@ -1,404 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * These are the H.264 state controls for use with stateless H.264
- * codec drivers.
- *
- * It turns out that these structs are not stable yet and will undergo
- * more changes. So keep them private until they are stable and ready to
- * become part of the official public API.
- */
-
-#ifndef _H264_CTRLS_H_
-#define _H264_CTRLS_H_
-
-#include <linux/videodev2.h>
-
-/*
- * Maximum DPB size, as specified by section 'A.3.1 Level limits
- * common to the Baseline, Main, and Extended profiles'.
- */
-#define V4L2_H264_NUM_DPB_ENTRIES 16
-
-#define V4L2_H264_REF_LIST_LEN (2 * V4L2_H264_NUM_DPB_ENTRIES)
-
-/*
- * This is put insanely high to avoid conflicting with controls that
- * would be added during the phase where those controls are not
- * stable. It should be fixed eventually.
- */
-#define V4L2_CID_MPEG_VIDEO_H264_SPS		(V4L2_CID_CODEC_BASE+1000)
-#define V4L2_CID_MPEG_VIDEO_H264_PPS		(V4L2_CID_CODEC_BASE+1001)
-#define V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX	(V4L2_CID_CODEC_BASE+1002)
-#define V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS	(V4L2_CID_CODEC_BASE+1003)
-#define V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS	(V4L2_CID_CODEC_BASE+1004)
-#define V4L2_CID_MPEG_VIDEO_H264_DECODE_MODE	(V4L2_CID_CODEC_BASE+1005)
-#define V4L2_CID_MPEG_VIDEO_H264_START_CODE	(V4L2_CID_CODEC_BASE+1006)
-#define V4L2_CID_MPEG_VIDEO_H264_PRED_WEIGHTS	(V4L2_CID_CODEC_BASE+1007)
-
-/**
- * enum v4l2_mpeg_video_h264_decode_mode - Decoding mode
- *
- * @V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED: indicates that decoding
- * is performed one slice at a time. In this mode,
- * V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS must contain the parsed slice
- * parameters and the OUTPUT buffer must contain a single slice.
- * V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF feature is used
- * in order to support multislice frames.
- * @V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED: indicates that
- * decoding is performed per frame. The OUTPUT buffer must contain
- * all slices and also both fields. This mode is typically supported
- * by device drivers that are able to parse the slice(s) header(s)
- * in hardware. When this mode is selected,
- * V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS is not used.
- */
-enum v4l2_mpeg_video_h264_decode_mode {
-	V4L2_MPEG_VIDEO_H264_DECODE_MODE_SLICE_BASED,
-	V4L2_MPEG_VIDEO_H264_DECODE_MODE_FRAME_BASED,
-};
-
-/**
- * enum v4l2_mpeg_video_h264_start_code - Start code
- *
- * @V4L2_MPEG_VIDEO_H264_START_CODE_NONE: slices are passed
- * to the driver without any start code.
- * @V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B: slices are passed
- * to the driver with an Annex B start code prefix
- * (legal start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001).
- * This mode is typically supported by device drivers that parse
- * the start code in hardware.
- */
-enum v4l2_mpeg_video_h264_start_code {
-	V4L2_MPEG_VIDEO_H264_START_CODE_NONE,
-	V4L2_MPEG_VIDEO_H264_START_CODE_ANNEX_B,
-};
-
-#define V4L2_H264_SPS_CONSTRAINT_SET0_FLAG			0x01
-#define V4L2_H264_SPS_CONSTRAINT_SET1_FLAG			0x02
-#define V4L2_H264_SPS_CONSTRAINT_SET2_FLAG			0x04
-#define V4L2_H264_SPS_CONSTRAINT_SET3_FLAG			0x08
-#define V4L2_H264_SPS_CONSTRAINT_SET4_FLAG			0x10
-#define V4L2_H264_SPS_CONSTRAINT_SET5_FLAG			0x20
-
-#define V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE		0x01
-#define V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS	0x02
-#define V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO		0x04
-#define V4L2_H264_SPS_FLAG_GAPS_IN_FRAME_NUM_VALUE_ALLOWED	0x08
-#define V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY			0x10
-#define V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD		0x20
-#define V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE			0x40
-
-#define V4L2_H264_SPS_HAS_CHROMA_FORMAT(sps) \
-	((sps)->profile_idc == 100 || (sps)->profile_idc == 110 || \
-	 (sps)->profile_idc == 122 || (sps)->profile_idc == 244 || \
-	 (sps)->profile_idc == 44  || (sps)->profile_idc == 83  || \
-	 (sps)->profile_idc == 86  || (sps)->profile_idc == 118 || \
-	 (sps)->profile_idc == 128 || (sps)->profile_idc == 138 || \
-	 (sps)->profile_idc == 139 || (sps)->profile_idc == 134 || \
-	 (sps)->profile_idc == 135)
-
-/**
- * struct v4l2_ctrl_h264_sps - H264 sequence parameter set
- *
- * All the members on this sequence parameter set structure match the
- * sequence parameter set syntax as specified by the H264 specification.
- *
- * @profile_idc: see H264 specification.
- * @constraint_set_flags: see H264 specification.
- * @level_idc: see H264 specification.
- * @seq_parameter_set_id: see H264 specification.
- * @chroma_format_idc: see H264 specification.
- * @bit_depth_luma_minus8: see H264 specification.
- * @bit_depth_chroma_minus8: see H264 specification.
- * @log2_max_frame_num_minus4: see H264 specification.
- * @pic_order_cnt_type: see H264 specification.
- * @log2_max_pic_order_cnt_lsb_minus4: see H264 specification.
- * @max_num_ref_frames: see H264 specification.
- * @num_ref_frames_in_pic_order_cnt_cycle: see H264 specification.
- * @offset_for_ref_frame: see H264 specification.
- * @offset_for_non_ref_pic: see H264 specification.
- * @offset_for_top_to_bottom_field: see H264 specification.
- * @pic_width_in_mbs_minus1: see H264 specification.
- * @pic_height_in_map_units_minus1: see H264 specification.
- * @flags: see V4L2_H264_SPS_FLAG_{}.
- */
-struct v4l2_ctrl_h264_sps {
-	__u8 profile_idc;
-	__u8 constraint_set_flags;
-	__u8 level_idc;
-	__u8 seq_parameter_set_id;
-	__u8 chroma_format_idc;
-	__u8 bit_depth_luma_minus8;
-	__u8 bit_depth_chroma_minus8;
-	__u8 log2_max_frame_num_minus4;
-	__u8 pic_order_cnt_type;
-	__u8 log2_max_pic_order_cnt_lsb_minus4;
-	__u8 max_num_ref_frames;
-	__u8 num_ref_frames_in_pic_order_cnt_cycle;
-	__s32 offset_for_ref_frame[255];
-	__s32 offset_for_non_ref_pic;
-	__s32 offset_for_top_to_bottom_field;
-	__u16 pic_width_in_mbs_minus1;
-	__u16 pic_height_in_map_units_minus1;
-	__u32 flags;
-};
-
-#define V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE				0x0001
-#define V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT	0x0002
-#define V4L2_H264_PPS_FLAG_WEIGHTED_PRED				0x0004
-#define V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT		0x0008
-#define V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED			0x0010
-#define V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT			0x0020
-#define V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE				0x0040
-#define V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT			0x0080
-
-/**
- * struct v4l2_ctrl_h264_pps - H264 picture parameter set
- *
- * Except where noted, all the members on this picture parameter set
- * structure match the sequence parameter set syntax as specified
- * by the H264 specification.
- *
- * In particular, V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT flag
- * has a specific meaning. This flag should be set if a non-flat
- * scaling matrix applies to the picture. In this case, applications
- * are expected to use V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
- * to pass the values of the non-flat matrices.
- *
- * @pic_parameter_set_id: see H264 specification.
- * @seq_parameter_set_id: see H264 specification.
- * @num_slice_groups_minus1: see H264 specification.
- * @num_ref_idx_l0_default_active_minus1: see H264 specification.
- * @num_ref_idx_l1_default_active_minus1: see H264 specification.
- * @weighted_bipred_idc: see H264 specification.
- * @pic_init_qp_minus26: see H264 specification.
- * @pic_init_qs_minus26: see H264 specification.
- * @chroma_qp_index_offset: see H264 specification.
- * @second_chroma_qp_index_offset: see H264 specification.
- * @flags: see V4L2_H264_PPS_FLAG_{}.
- */
-struct v4l2_ctrl_h264_pps {
-	__u8 pic_parameter_set_id;
-	__u8 seq_parameter_set_id;
-	__u8 num_slice_groups_minus1;
-	__u8 num_ref_idx_l0_default_active_minus1;
-	__u8 num_ref_idx_l1_default_active_minus1;
-	__u8 weighted_bipred_idc;
-	__s8 pic_init_qp_minus26;
-	__s8 pic_init_qs_minus26;
-	__s8 chroma_qp_index_offset;
-	__s8 second_chroma_qp_index_offset;
-	__u16 flags;
-};
-
-/**
- * struct v4l2_ctrl_h264_scaling_matrix - H264 scaling matrices
- *
- * @scaling_list_4x4: scaling matrix after applying the inverse
- * scanning process. Expected list order is Intra Y, Intra Cb,
- * Intra Cr, Inter Y, Inter Cb, Inter Cr. The values on each
- * scaling list are expected in raster scan order.
- * @scaling_list_8x8: scaling matrix after applying the inverse
- * scanning process. Expected list order is Intra Y, Inter Y,
- * Intra Cb, Inter Cb, Intra Cr, Inter Cr. The values on each
- * scaling list are expected in raster scan order.
- *
- * Note that the list order is different for the 4x4 and 8x8
- * matrices as per the H264 specification, see table 7-2 "Assignment
- * of mnemonic names to scaling list indices and specification of
- * fall-back rule".
- */
-struct v4l2_ctrl_h264_scaling_matrix {
-	__u8 scaling_list_4x4[6][16];
-	__u8 scaling_list_8x8[6][64];
-};
-
-struct v4l2_h264_weight_factors {
-	__s16 luma_weight[32];
-	__s16 luma_offset[32];
-	__s16 chroma_weight[32][2];
-	__s16 chroma_offset[32][2];
-};
-
-#define V4L2_H264_CTRL_PRED_WEIGHTS_REQUIRED(pps, slice) \
-	((((pps)->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED) && \
-	 ((slice)->slice_type == V4L2_H264_SLICE_TYPE_P || \
-	  (slice)->slice_type == V4L2_H264_SLICE_TYPE_SP)) || \
-	 ((pps)->weighted_bipred_idc == 1 && \
-	  (slice)->slice_type == V4L2_H264_SLICE_TYPE_B))
-
-/**
- * struct v4l2_ctrl_h264_pred_weights - Prediction weight table
- *
- * Prediction weight table, which matches the syntax specified
- * by the H264 specification.
- *
- * @luma_log2_weight_denom: see H264 specification.
- * @chroma_log2_weight_denom: see H264 specification.
- * @weight_factors: luma and chroma weight factors.
- */
-struct v4l2_ctrl_h264_pred_weights {
-	__u16 luma_log2_weight_denom;
-	__u16 chroma_log2_weight_denom;
-	struct v4l2_h264_weight_factors weight_factors[2];
-};
-
-#define V4L2_H264_SLICE_TYPE_P				0
-#define V4L2_H264_SLICE_TYPE_B				1
-#define V4L2_H264_SLICE_TYPE_I				2
-#define V4L2_H264_SLICE_TYPE_SP				3
-#define V4L2_H264_SLICE_TYPE_SI				4
-
-#define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED	0x01
-#define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH		0x02
-
-#define V4L2_H264_TOP_FIELD_REF				0x1
-#define V4L2_H264_BOTTOM_FIELD_REF			0x2
-#define V4L2_H264_FRAME_REF				0x3
-
-/**
- * struct v4l2_h264_reference - H264 picture reference
- *
- * @fields: indicates how the picture is referenced.
- * Valid values are V4L2_H264_{}_REF.
- * @index: index into v4l2_ctrl_h264_decode_params.dpb[].
- */
-struct v4l2_h264_reference {
-	__u8 fields;
-	__u8 index;
-};
-
-/**
- * struct v4l2_ctrl_h264_slice_params - H264 slice parameters
- *
- * This structure holds the H264 syntax elements that are specified
- * as non-invariant for the slices in a given frame.
- *
- * Slice invariant syntax elements are contained in struct
- * v4l2_ctrl_h264_decode_params. This is done to reduce the API surface
- * on frame-based decoders, where slice header parsing is done by the
- * hardware.
- *
- * Slice invariant syntax elements are specified in specification section
- * "7.4.3 Slice header semantics".
- *
- * Except where noted, the members on this struct match the slice header syntax.
- *
- * @header_bit_size: offset in bits to slice_data() from the beginning of this slice.
- * @first_mb_in_slice: see H264 specification.
- * @slice_type: see H264 specification.
- * @colour_plane_id: see H264 specification.
- * @redundant_pic_cnt: see H264 specification.
- * @cabac_init_idc: see H264 specification.
- * @slice_qp_delta: see H264 specification.
- * @slice_qs_delta: see H264 specification.
- * @disable_deblocking_filter_idc: see H264 specification.
- * @slice_alpha_c0_offset_div2: see H264 specification.
- * @slice_beta_offset_div2: see H264 specification.
- * @num_ref_idx_l0_active_minus1: see H264 specification.
- * @num_ref_idx_l1_active_minus1: see H264 specification.
- * @reserved: padding field. Should be zeroed by applications.
- * @ref_pic_list0: reference picture list 0 after applying the per-slice modifications.
- * @ref_pic_list1: reference picture list 1 after applying the per-slice modifications.
- * @flags: see V4L2_H264_SLICE_FLAG_{}.
- */
-struct v4l2_ctrl_h264_slice_params {
-	__u32 header_bit_size;
-	__u32 first_mb_in_slice;
-	__u8 slice_type;
-	__u8 colour_plane_id;
-	__u8 redundant_pic_cnt;
-	__u8 cabac_init_idc;
-	__s8 slice_qp_delta;
-	__s8 slice_qs_delta;
-	__u8 disable_deblocking_filter_idc;
-	__s8 slice_alpha_c0_offset_div2;
-	__s8 slice_beta_offset_div2;
-	__u8 num_ref_idx_l0_active_minus1;
-	__u8 num_ref_idx_l1_active_minus1;
-
-	__u8 reserved;
-
-	struct v4l2_h264_reference ref_pic_list0[V4L2_H264_REF_LIST_LEN];
-	struct v4l2_h264_reference ref_pic_list1[V4L2_H264_REF_LIST_LEN];
-
-	__u32 flags;
-};
-
-#define V4L2_H264_DPB_ENTRY_FLAG_VALID		0x01
-#define V4L2_H264_DPB_ENTRY_FLAG_ACTIVE		0x02
-#define V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM	0x04
-#define V4L2_H264_DPB_ENTRY_FLAG_FIELD		0x08
-
-/**
- * struct v4l2_h264_dpb_entry - H264 decoded picture buffer entry
- *
- * @reference_ts: timestamp of the V4L2 capture buffer to use as reference.
- * The timestamp refers to the timestamp field in struct v4l2_buffer.
- * Use v4l2_timeval_to_ns() to convert the struct timeval to a __u64.
- * @pic_num: matches PicNum variable assigned during the reference
- * picture lists construction process.
- * @frame_num: frame identifier which matches frame_num syntax element.
- * @fields: indicates how the DPB entry is referenced. Valid values are
- * V4L2_H264_{}_REF.
- * @reserved: padding field. Should be zeroed by applications.
- * @top_field_order_cnt: matches TopFieldOrderCnt picture value.
- * @bottom_field_order_cnt: matches BottomFieldOrderCnt picture value.
- * Note that picture field is indicated by v4l2_buffer.field.
- * @flags: see V4L2_H264_DPB_ENTRY_FLAG_{}.
- */
-struct v4l2_h264_dpb_entry {
-	__u64 reference_ts;
-	__u32 pic_num;
-	__u16 frame_num;
-	__u8 fields;
-	__u8 reserved[5];
-	__s32 top_field_order_cnt;
-	__s32 bottom_field_order_cnt;
-	__u32 flags;
-};
-
-#define V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC		0x01
-#define V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC		0x02
-#define V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD	0x04
-
-/**
- * struct v4l2_ctrl_h264_decode_params - H264 decoding parameters
- *
- * @dpb: decoded picture buffer.
- * @nal_ref_idc: slice header syntax element.
- * @frame_num: slice header syntax element.
- * @top_field_order_cnt: matches TopFieldOrderCnt picture value.
- * @bottom_field_order_cnt: matches BottomFieldOrderCnt picture value.
- * Note that picture field is indicated by v4l2_buffer.field.
- * @idr_pic_id: slice header syntax element.
- * @pic_order_cnt_lsb: slice header syntax element.
- * @delta_pic_order_cnt_bottom: slice header syntax element.
- * @delta_pic_order_cnt0: slice header syntax element.
- * @delta_pic_order_cnt1: slice header syntax element.
- * @dec_ref_pic_marking_bit_size: size in bits of dec_ref_pic_marking()
- * syntax element.
- * @pic_order_cnt_bit_size: size in bits of pic order count syntax.
- * @slice_group_change_cycle: slice header syntax element.
- * @reserved: padding field. Should be zeroed by applications.
- * @flags: see V4L2_H264_DECODE_PARAM_FLAG_{}.
- */
-struct v4l2_ctrl_h264_decode_params {
-	struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES];
-	__u16 nal_ref_idc;
-	__u16 frame_num;
-	__s32 top_field_order_cnt;
-	__s32 bottom_field_order_cnt;
-	__u16 idr_pic_id;
-	__u16 pic_order_cnt_lsb;
-	__s32 delta_pic_order_cnt_bottom;
-	__s32 delta_pic_order_cnt0;
-	__s32 delta_pic_order_cnt1;
-	__u32 dec_ref_pic_marking_bit_size;
-	__u32 pic_order_cnt_bit_size;
-	__u32 slice_group_change_cycle;
-
-	__u32 reserved;
-	__u32 flags;
-};
-
-#endif
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 4fbace0fc7e5..d25b38f78229 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -19,7 +19,6 @@
  */
 #include <media/mpeg2-ctrls.h>
 #include <media/fwht-ctrls.h>
-#include <media/h264-ctrls.h>
 #include <media/vp8-ctrls.h>
 #include <media/hevc-ctrls.h>
 
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 90478ecc2f81..3f24663fba4a 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1183,6 +1183,387 @@ enum v4l2_detect_md_mode {
 #define V4L2_CID_CODEC_STATELESS_BASE          (V4L2_CTRL_CLASS_CODEC_STATELESS | 0x900)
 #define V4L2_CID_CODEC_STATELESS_CLASS         (V4L2_CTRL_CLASS_CODEC_STATELESS | 1)
 
+#define V4L2_CID_STATELESS_H264_DECODE_MODE	(V4L2_CID_CODEC_STATELESS_BASE + 0)
+/**
+ * enum v4l2_stateless_h264_decode_mode - Decoding mode
+ *
+ * @V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED: indicates that decoding
+ * is performed one slice at a time. In this mode,
+ * V4L2_CID_STATELESS_H264_SLICE_PARAMS must contain the parsed slice
+ * parameters and the OUTPUT buffer must contain a single slice.
+ * V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF feature is used
+ * in order to support multislice frames.
+ * @V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED: indicates that
+ * decoding is performed per frame. The OUTPUT buffer must contain
+ * all slices and also both fields. This mode is typically supported
+ * by device drivers that are able to parse the slice(s) header(s)
+ * in hardware. When this mode is selected,
+ * V4L2_CID_STATELESS_H264_SLICE_PARAMS is not used.
+ */
+enum v4l2_stateless_h264_decode_mode {
+	V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
+	V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
+};
+
+#define V4L2_CID_STATELESS_H264_START_CODE	(V4L2_CID_CODEC_STATELESS_BASE + 1)
+/**
+ * enum v4l2_stateless_h264_start_code - Start code
+ *
+ * @V4L2_STATELESS_H264_START_CODE_NONE: slices are passed
+ * to the driver without any start code.
+ * @V4L2_STATELESS_H264_START_CODE_ANNEX_B: slices are passed
+ * to the driver with an Annex B start code prefix
+ * (legal start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001).
+ * This mode is typically supported by device drivers that parse
+ * the start code in hardware.
+ */
+enum v4l2_stateless_h264_start_code {
+	V4L2_STATELESS_H264_START_CODE_NONE,
+	V4L2_STATELESS_H264_START_CODE_ANNEX_B,
+};
+
+#define V4L2_H264_SPS_CONSTRAINT_SET0_FLAG			0x01
+#define V4L2_H264_SPS_CONSTRAINT_SET1_FLAG			0x02
+#define V4L2_H264_SPS_CONSTRAINT_SET2_FLAG			0x04
+#define V4L2_H264_SPS_CONSTRAINT_SET3_FLAG			0x08
+#define V4L2_H264_SPS_CONSTRAINT_SET4_FLAG			0x10
+#define V4L2_H264_SPS_CONSTRAINT_SET5_FLAG			0x20
+
+#define V4L2_H264_SPS_FLAG_SEPARATE_COLOUR_PLANE		0x01
+#define V4L2_H264_SPS_FLAG_QPPRIME_Y_ZERO_TRANSFORM_BYPASS	0x02
+#define V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO		0x04
+#define V4L2_H264_SPS_FLAG_GAPS_IN_FRAME_NUM_VALUE_ALLOWED	0x08
+#define V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY			0x10
+#define V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD		0x20
+#define V4L2_H264_SPS_FLAG_DIRECT_8X8_INFERENCE			0x40
+
+#define V4L2_H264_SPS_HAS_CHROMA_FORMAT(sps) \
+	((sps)->profile_idc == 100 || (sps)->profile_idc == 110 || \
+	 (sps)->profile_idc == 122 || (sps)->profile_idc == 244 || \
+	 (sps)->profile_idc == 44  || (sps)->profile_idc == 83  || \
+	 (sps)->profile_idc == 86  || (sps)->profile_idc == 118 || \
+	 (sps)->profile_idc == 128 || (sps)->profile_idc == 138 || \
+	 (sps)->profile_idc == 139 || (sps)->profile_idc == 134 || \
+	 (sps)->profile_idc == 135)
+
+#define V4L2_CID_STATELESS_H264_SPS		(V4L2_CID_CODEC_STATELESS_BASE + 2)
+/**
+ * struct v4l2_ctrl_h264_sps - H264 sequence parameter set
+ *
+ * All the members on this sequence parameter set structure match the
+ * sequence parameter set syntax as specified by the H264 specification.
+ *
+ * @profile_idc: see H264 specification.
+ * @constraint_set_flags: see H264 specification.
+ * @level_idc: see H264 specification.
+ * @seq_parameter_set_id: see H264 specification.
+ * @chroma_format_idc: see H264 specification.
+ * @bit_depth_luma_minus8: see H264 specification.
+ * @bit_depth_chroma_minus8: see H264 specification.
+ * @log2_max_frame_num_minus4: see H264 specification.
+ * @pic_order_cnt_type: see H264 specification.
+ * @log2_max_pic_order_cnt_lsb_minus4: see H264 specification.
+ * @max_num_ref_frames: see H264 specification.
+ * @num_ref_frames_in_pic_order_cnt_cycle: see H264 specification.
+ * @offset_for_ref_frame: see H264 specification.
+ * @offset_for_non_ref_pic: see H264 specification.
+ * @offset_for_top_to_bottom_field: see H264 specification.
+ * @pic_width_in_mbs_minus1: see H264 specification.
+ * @pic_height_in_map_units_minus1: see H264 specification.
+ * @flags: see V4L2_H264_SPS_FLAG_{}.
+ */
+struct v4l2_ctrl_h264_sps {
+	__u8 profile_idc;
+	__u8 constraint_set_flags;
+	__u8 level_idc;
+	__u8 seq_parameter_set_id;
+	__u8 chroma_format_idc;
+	__u8 bit_depth_luma_minus8;
+	__u8 bit_depth_chroma_minus8;
+	__u8 log2_max_frame_num_minus4;
+	__u8 pic_order_cnt_type;
+	__u8 log2_max_pic_order_cnt_lsb_minus4;
+	__u8 max_num_ref_frames;
+	__u8 num_ref_frames_in_pic_order_cnt_cycle;
+	__s32 offset_for_ref_frame[255];
+	__s32 offset_for_non_ref_pic;
+	__s32 offset_for_top_to_bottom_field;
+	__u16 pic_width_in_mbs_minus1;
+	__u16 pic_height_in_map_units_minus1;
+	__u32 flags;
+};
+
+#define V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE				0x0001
+#define V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT	0x0002
+#define V4L2_H264_PPS_FLAG_WEIGHTED_PRED				0x0004
+#define V4L2_H264_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT		0x0008
+#define V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED			0x0010
+#define V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT			0x0020
+#define V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE				0x0040
+#define V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT			0x0080
+
+#define V4L2_CID_STATELESS_H264_PPS		(V4L2_CID_CODEC_STATELESS_BASE + 3)
+/**
+ * struct v4l2_ctrl_h264_pps - H264 picture parameter set
+ *
+ * Except where noted, all the members on this picture parameter set
+ * structure match the sequence parameter set syntax as specified
+ * by the H264 specification.
+ *
+ * In particular, V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT flag
+ * has a specific meaning. This flag should be set if a non-flat
+ * scaling matrix applies to the picture. In this case, applications
+ * are expected to use V4L2_CID_STATELESS_H264_SCALING_MATRIX,
+ * to pass the values of the non-flat matrices.
+ *
+ * @pic_parameter_set_id: see H264 specification.
+ * @seq_parameter_set_id: see H264 specification.
+ * @num_slice_groups_minus1: see H264 specification.
+ * @num_ref_idx_l0_default_active_minus1: see H264 specification.
+ * @num_ref_idx_l1_default_active_minus1: see H264 specification.
+ * @weighted_bipred_idc: see H264 specification.
+ * @pic_init_qp_minus26: see H264 specification.
+ * @pic_init_qs_minus26: see H264 specification.
+ * @chroma_qp_index_offset: see H264 specification.
+ * @second_chroma_qp_index_offset: see H264 specification.
+ * @flags: see V4L2_H264_PPS_FLAG_{}.
+ */
+struct v4l2_ctrl_h264_pps {
+	__u8 pic_parameter_set_id;
+	__u8 seq_parameter_set_id;
+	__u8 num_slice_groups_minus1;
+	__u8 num_ref_idx_l0_default_active_minus1;
+	__u8 num_ref_idx_l1_default_active_minus1;
+	__u8 weighted_bipred_idc;
+	__s8 pic_init_qp_minus26;
+	__s8 pic_init_qs_minus26;
+	__s8 chroma_qp_index_offset;
+	__s8 second_chroma_qp_index_offset;
+	__u16 flags;
+};
+
+#define V4L2_CID_STATELESS_H264_SCALING_MATRIX	(V4L2_CID_CODEC_STATELESS_BASE + 4)
+/**
+ * struct v4l2_ctrl_h264_scaling_matrix - H264 scaling matrices
+ *
+ * @scaling_list_4x4: scaling matrix after applying the inverse
+ * scanning process. Expected list order is Intra Y, Intra Cb,
+ * Intra Cr, Inter Y, Inter Cb, Inter Cr. The values on each
+ * scaling list are expected in raster scan order.
+ * @scaling_list_8x8: scaling matrix after applying the inverse
+ * scanning process. Expected list order is Intra Y, Inter Y,
+ * Intra Cb, Inter Cb, Intra Cr, Inter Cr. The values on each
+ * scaling list are expected in raster scan order.
+ *
+ * Note that the list order is different for the 4x4 and 8x8
+ * matrices as per the H264 specification, see table 7-2 "Assignment
+ * of mnemonic names to scaling list indices and specification of
+ * fall-back rule".
+ */
+struct v4l2_ctrl_h264_scaling_matrix {
+	__u8 scaling_list_4x4[6][16];
+	__u8 scaling_list_8x8[6][64];
+};
+
+struct v4l2_h264_weight_factors {
+	__s16 luma_weight[32];
+	__s16 luma_offset[32];
+	__s16 chroma_weight[32][2];
+	__s16 chroma_offset[32][2];
+};
+
+#define V4L2_H264_CTRL_PRED_WEIGHTS_REQUIRED(pps, slice) \
+	((((pps)->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED) && \
+	 ((slice)->slice_type == V4L2_H264_SLICE_TYPE_P || \
+	  (slice)->slice_type == V4L2_H264_SLICE_TYPE_SP)) || \
+	 ((pps)->weighted_bipred_idc == 1 && \
+	  (slice)->slice_type == V4L2_H264_SLICE_TYPE_B))
+
+#define V4L2_CID_STATELESS_H264_PRED_WEIGHTS	(V4L2_CID_CODEC_STATELESS_BASE + 5)
+/**
+ * struct v4l2_ctrl_h264_pred_weights - Prediction weight table
+ *
+ * Prediction weight table, which matches the syntax specified
+ * by the H264 specification.
+ *
+ * @luma_log2_weight_denom: see H264 specification.
+ * @chroma_log2_weight_denom: see H264 specification.
+ * @weight_factors: luma and chroma weight factors.
+ */
+struct v4l2_ctrl_h264_pred_weights {
+	__u16 luma_log2_weight_denom;
+	__u16 chroma_log2_weight_denom;
+	struct v4l2_h264_weight_factors weight_factors[2];
+};
+
+#define V4L2_H264_SLICE_TYPE_P				0
+#define V4L2_H264_SLICE_TYPE_B				1
+#define V4L2_H264_SLICE_TYPE_I				2
+#define V4L2_H264_SLICE_TYPE_SP				3
+#define V4L2_H264_SLICE_TYPE_SI				4
+
+#define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED	0x01
+#define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH		0x02
+
+#define V4L2_H264_TOP_FIELD_REF				0x1
+#define V4L2_H264_BOTTOM_FIELD_REF			0x2
+#define V4L2_H264_FRAME_REF				0x3
+
+/**
+ * struct v4l2_h264_reference - H264 picture reference
+ *
+ * @fields: indicates how the picture is referenced.
+ * Valid values are V4L2_H264_{}_REF.
+ * @index: index into v4l2_ctrl_h264_decode_params.dpb[].
+ */
+struct v4l2_h264_reference {
+	__u8 fields;
+	__u8 index;
+};
+
+/*
+ * Maximum DPB size, as specified by section 'A.3.1 Level limits
+ * common to the Baseline, Main, and Extended profiles'.
+ */
+#define V4L2_H264_NUM_DPB_ENTRIES 16
+#define V4L2_H264_REF_LIST_LEN (2 * V4L2_H264_NUM_DPB_ENTRIES)
+
+#define V4L2_CID_STATELESS_H264_SLICE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 6)
+/**
+ * struct v4l2_ctrl_h264_slice_params - H264 slice parameters
+ *
+ * This structure holds the H264 syntax elements that are specified
+ * as non-invariant for the slices in a given frame.
+ *
+ * Slice invariant syntax elements are contained in struct
+ * v4l2_ctrl_h264_decode_params. This is done to reduce the API surface
+ * on frame-based decoders, where slice header parsing is done by the
+ * hardware.
+ *
+ * Slice invariant syntax elements are specified in specification section
+ * "7.4.3 Slice header semantics".
+ *
+ * Except where noted, the members on this struct match the slice header syntax.
+ *
+ * @header_bit_size: offset in bits to slice_data() from the beginning of this slice.
+ * @first_mb_in_slice: see H264 specification.
+ * @slice_type: see H264 specification.
+ * @colour_plane_id: see H264 specification.
+ * @redundant_pic_cnt: see H264 specification.
+ * @cabac_init_idc: see H264 specification.
+ * @slice_qp_delta: see H264 specification.
+ * @slice_qs_delta: see H264 specification.
+ * @disable_deblocking_filter_idc: see H264 specification.
+ * @slice_alpha_c0_offset_div2: see H264 specification.
+ * @slice_beta_offset_div2: see H264 specification.
+ * @num_ref_idx_l0_active_minus1: see H264 specification.
+ * @num_ref_idx_l1_active_minus1: see H264 specification.
+ * @reserved: padding field. Should be zeroed by applications.
+ * @ref_pic_list0: reference picture list 0 after applying the per-slice modifications.
+ * @ref_pic_list1: reference picture list 1 after applying the per-slice modifications.
+ * @flags: see V4L2_H264_SLICE_FLAG_{}.
+ */
+struct v4l2_ctrl_h264_slice_params {
+	__u32 header_bit_size;
+	__u32 first_mb_in_slice;
+	__u8 slice_type;
+	__u8 colour_plane_id;
+	__u8 redundant_pic_cnt;
+	__u8 cabac_init_idc;
+	__s8 slice_qp_delta;
+	__s8 slice_qs_delta;
+	__u8 disable_deblocking_filter_idc;
+	__s8 slice_alpha_c0_offset_div2;
+	__s8 slice_beta_offset_div2;
+	__u8 num_ref_idx_l0_active_minus1;
+	__u8 num_ref_idx_l1_active_minus1;
+
+	__u8 reserved;
+
+	struct v4l2_h264_reference ref_pic_list0[V4L2_H264_REF_LIST_LEN];
+	struct v4l2_h264_reference ref_pic_list1[V4L2_H264_REF_LIST_LEN];
+
+	__u32 flags;
+};
+
+#define V4L2_H264_DPB_ENTRY_FLAG_VALID		0x01
+#define V4L2_H264_DPB_ENTRY_FLAG_ACTIVE		0x02
+#define V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM	0x04
+#define V4L2_H264_DPB_ENTRY_FLAG_FIELD		0x08
+
+/**
+ * struct v4l2_h264_dpb_entry - H264 decoded picture buffer entry
+ *
+ * @reference_ts: timestamp of the V4L2 capture buffer to use as reference.
+ * The timestamp refers to the timestamp field in struct v4l2_buffer.
+ * Use v4l2_timeval_to_ns() to convert the struct timeval to a __u64.
+ * @pic_num: matches PicNum variable assigned during the reference
+ * picture lists construction process.
+ * @frame_num: frame identifier which matches frame_num syntax element.
+ * @fields: indicates how the DPB entry is referenced. Valid values are
+ * V4L2_H264_{}_REF.
+ * @reserved: padding field. Should be zeroed by applications.
+ * @top_field_order_cnt: matches TopFieldOrderCnt picture value.
+ * @bottom_field_order_cnt: matches BottomFieldOrderCnt picture value.
+ * Note that picture field is indicated by v4l2_buffer.field.
+ * @flags: see V4L2_H264_DPB_ENTRY_FLAG_{}.
+ */
+struct v4l2_h264_dpb_entry {
+	__u64 reference_ts;
+	__u32 pic_num;
+	__u16 frame_num;
+	__u8 fields;
+	__u8 reserved[5];
+	__s32 top_field_order_cnt;
+	__s32 bottom_field_order_cnt;
+	__u32 flags;
+};
+
+#define V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC		0x01
+#define V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC		0x02
+#define V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD	0x04
+
+#define V4L2_CID_STATELESS_H264_DECODE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 7)
+/**
+ * struct v4l2_ctrl_h264_decode_params - H264 decoding parameters
+ *
+ * @dpb: decoded picture buffer.
+ * @nal_ref_idc: slice header syntax element.
+ * @frame_num: slice header syntax element.
+ * @top_field_order_cnt: matches TopFieldOrderCnt picture value.
+ * @bottom_field_order_cnt: matches BottomFieldOrderCnt picture value.
+ * Note that picture field is indicated by v4l2_buffer.field.
+ * @idr_pic_id: slice header syntax element.
+ * @pic_order_cnt_lsb: slice header syntax element.
+ * @delta_pic_order_cnt_bottom: slice header syntax element.
+ * @delta_pic_order_cnt0: slice header syntax element.
+ * @delta_pic_order_cnt1: slice header syntax element.
+ * @dec_ref_pic_marking_bit_size: size in bits of dec_ref_pic_marking()
+ * syntax element.
+ * @pic_order_cnt_bit_size: size in bits of pic order count syntax.
+ * @slice_group_change_cycle: slice header syntax element.
+ * @reserved: padding field. Should be zeroed by applications.
+ * @flags: see V4L2_H264_DECODE_PARAM_FLAG_{}.
+ */
+struct v4l2_ctrl_h264_decode_params {
+	struct v4l2_h264_dpb_entry dpb[V4L2_H264_NUM_DPB_ENTRIES];
+	__u16 nal_ref_idc;
+	__u16 frame_num;
+	__s32 top_field_order_cnt;
+	__s32 bottom_field_order_cnt;
+	__u16 idr_pic_id;
+	__u16 pic_order_cnt_lsb;
+	__s32 delta_pic_order_cnt_bottom;
+	__s32 delta_pic_order_cnt0;
+	__s32 delta_pic_order_cnt1;
+	__u32 dec_ref_pic_marking_bit_size;
+	__u32 pic_order_cnt_bit_size;
+	__u32 slice_group_change_cycle;
+
+	__u32 reserved;
+	__u32 flags;
+};
+
 
 /* MPEG-compression definitions kept for backwards compatibility */
 #ifndef __KERNEL__
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 485654fd2a7e..76231ca6e101 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1734,6 +1734,12 @@ struct v4l2_ext_control {
 		__u16 __user *p_u16;
 		__u32 __user *p_u32;
 		struct v4l2_area __user *p_area;
+		struct v4l2_ctrl_h264_sps __user *p_h264_sps;
+		struct v4l2_ctrl_h264_pps *p_h264_pps;
+		struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_scaling_matrix;
+		struct v4l2_ctrl_h264_pred_weights __user *p_h264_pred_weights;
+		struct v4l2_ctrl_h264_slice_params __user *p_h264_slice_params;
+		struct v4l2_ctrl_h264_decode_params __user *p_h264_decode_params;
 		void __user *ptr;
 	};
 } __attribute__ ((packed));
-- 
2.27.0

