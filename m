Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50DE42C5548
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 14:27:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390023AbgKZN1e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 08:27:34 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:52513 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390000AbgKZN1d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 08:27:33 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id iHIrkPCQhN7XgiHJ3kYrXk; Thu, 26 Nov 2020 14:27:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606397249; bh=olKj3jBdqoVnwJKmCSE4+nfPtoAjqAJpobGFSAia5vo=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=uRa5V14LP8MmqpOVy+F67IjiyEWBviwXLW/PPy+CdfCZMFMQ7cIWu3DjTL0EzUD/M
         5tEj2t+QEczXrTmqChbYxjOZjNyLGrUUAnff8JTj+F5uZm1TJB3zN1uug/Om4SVT6I
         6bjQ8PKcG804MueKkrh+wb2FjWUJ7/Zq6bSudPFa8A26dQeadGQcH1wuuLYqBKZkFh
         nuxlxKNn9cWKB0f13AWkay3reD/RWa8CV7IIRq9axOYxbZ7mdOJCTjme8PEwxNClMs
         4dFDczcksd7XbG4wCwO5CdDB/z0IOe09KBzFCXceG9kwDGsbUsGbmhTkomINPW+YL/
         OD8TW/dItlvrg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/6] vicodec: mark the stateless FWHT API as stable
Date:   Thu, 26 Nov 2020 14:27:13 +0100
Message-Id: <20201126132717.1216907-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126132717.1216907-1-hverkuil-cisco@xs4all.nl>
References: <20201126132717.1216907-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfPKsg8oJiWG9OdslvPLewlhgUU054b3LqQP4rktgPBMGRZ8Vt+F3eBeqw9An1OHSIcFptow873r56aX/AXRSfpyhXVJzRDqTBTgWN9Ju6qgMMGIUt7XO
 kwR0j9UCgbt4kSaXBB01jErLR3coCvr79UTQNEIWPSLLduvWok59M+dZdkaWIhYNcgMFW1t80qamJGURsRZukDP5QoxBOgU1+UTkZBdy9bdSm4AVcL5MMW9M
 eyW5ERt/fFhsJtsRcAaIWYi8fl1Ghq/Yr73IUxQFFHM=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch finalizes the move of the stateless FWHT to a
stable public API:

Rename V4L2_CID_MPEG_VIDEO_FWHT_PARAMS to V4L2_CID_STATELESS_FWHT_PARAMS.

Move the contents of fwht-ctrls.h to v4l2-controls.h.

Move the public parts of drivers/media/test-drivers/vicodec/codec-fwht.h
to v4l2-controls.h.

Add V4L2_CTRL_TYPE_FWHT_PARAMS control initialization and validation.

Add p_fwht_params to struct v4l2_ext_control.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/test-drivers/vicodec/codec-fwht.c   |  1 +
 .../media/test-drivers/vicodec/codec-fwht.h   | 32 ---------
 .../media/test-drivers/vicodec/vicodec-core.c |  6 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          | 20 +++++-
 include/media/fwht-ctrls.h                    | 31 --------
 include/media/v4l2-ctrls.h                    |  1 -
 include/uapi/linux/v4l2-controls.h            | 70 +++++++++++++++++++
 include/uapi/linux/videodev2.h                |  3 +
 8 files changed, 95 insertions(+), 69 deletions(-)
 delete mode 100644 include/media/fwht-ctrls.h

diff --git a/drivers/media/test-drivers/vicodec/codec-fwht.c b/drivers/media/test-drivers/vicodec/codec-fwht.c
index 5dbf76fd8185..1ce682e1b85c 100644
--- a/drivers/media/test-drivers/vicodec/codec-fwht.c
+++ b/drivers/media/test-drivers/vicodec/codec-fwht.c
@@ -11,6 +11,7 @@
 
 #include <linux/string.h>
 #include <linux/kernel.h>
+#include <linux/videodev2.h>
 #include "codec-fwht.h"
 
 #define OVERFLOW_BIT BIT(14)
diff --git a/drivers/media/test-drivers/vicodec/codec-fwht.h b/drivers/media/test-drivers/vicodec/codec-fwht.h
index 78e2841762fb..0eab24020e9e 100644
--- a/drivers/media/test-drivers/vicodec/codec-fwht.h
+++ b/drivers/media/test-drivers/vicodec/codec-fwht.h
@@ -56,38 +56,6 @@
 #define FWHT_MAGIC1 0x4f4f4f4f
 #define FWHT_MAGIC2 0xffffffff
 
-#define V4L2_FWHT_VERSION 3
-
-/* Set if this is an interlaced format */
-#define V4L2_FWHT_FL_IS_INTERLACED		BIT(0)
-/* Set if this is a bottom-first (NTSC) interlaced format */
-#define V4L2_FWHT_FL_IS_BOTTOM_FIRST		BIT(1)
-/* Set if each 'frame' contains just one field */
-#define V4L2_FWHT_FL_IS_ALTERNATE		BIT(2)
-/*
- * If V4L2_FWHT_FL_IS_ALTERNATE was set, then this is set if this
- * 'frame' is the bottom field, else it is the top field.
- */
-#define V4L2_FWHT_FL_IS_BOTTOM_FIELD		BIT(3)
-/* Set if this frame is uncompressed */
-#define V4L2_FWHT_FL_LUMA_IS_UNCOMPRESSED	BIT(4)
-#define V4L2_FWHT_FL_CB_IS_UNCOMPRESSED	BIT(5)
-#define V4L2_FWHT_FL_CR_IS_UNCOMPRESSED	BIT(6)
-#define V4L2_FWHT_FL_CHROMA_FULL_HEIGHT	BIT(7)
-#define V4L2_FWHT_FL_CHROMA_FULL_WIDTH	BIT(8)
-#define V4L2_FWHT_FL_ALPHA_IS_UNCOMPRESSED	BIT(9)
-#define V4L2_FWHT_FL_I_FRAME			BIT(10)
-
-/* A 4-values flag - the number of components - 1 */
-#define V4L2_FWHT_FL_COMPONENTS_NUM_MSK	GENMASK(18, 16)
-#define V4L2_FWHT_FL_COMPONENTS_NUM_OFFSET	16
-
-#define V4L2_FWHT_FL_PIXENC_MSK	GENMASK(20, 19)
-#define V4L2_FWHT_FL_PIXENC_OFFSET	19
-#define V4L2_FWHT_FL_PIXENC_YUV	(1 << V4L2_FWHT_FL_PIXENC_OFFSET)
-#define V4L2_FWHT_FL_PIXENC_RGB	(2 << V4L2_FWHT_FL_PIXENC_OFFSET)
-#define V4L2_FWHT_FL_PIXENC_HSV	(3 << V4L2_FWHT_FL_PIXENC_OFFSET)
-
 /*
  * A macro to calculate the needed padding in order to make sure
  * both luma and chroma components resolutions are rounded up to
diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index 084b75c226c5..025f3ff77302 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -1746,7 +1746,7 @@ static int vicodec_try_ctrl(struct v4l2_ctrl *ctrl)
 			V4L2_BUF_TYPE_VIDEO_CAPTURE);
 
 	switch (ctrl->id) {
-	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:
+	case V4L2_CID_STATELESS_FWHT_PARAMS:
 		if (!q_dst->info)
 			return -EINVAL;
 		params = ctrl->p_new.p_fwht_params;
@@ -1799,7 +1799,7 @@ static int vicodec_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_FWHT_P_FRAME_QP:
 		ctx->state.p_frame_qp = ctrl->val;
 		return 0;
-	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:
+	case V4L2_CID_STATELESS_FWHT_PARAMS:
 		params = ctrl->p_new.p_fwht_params;
 		update_header_from_stateless_params(ctx, params);
 		ctx->state.ref_frame_ts = params->backward_ref_ts;
@@ -1815,7 +1815,7 @@ static const struct v4l2_ctrl_ops vicodec_ctrl_ops = {
 
 static const struct v4l2_ctrl_config vicodec_ctrl_stateless_state = {
 	.ops		= &vicodec_ctrl_ops,
-	.id		= V4L2_CID_MPEG_VIDEO_FWHT_PARAMS,
+	.id		= V4L2_CID_STATELESS_FWHT_PARAMS,
 	.elem_size      = sizeof(struct v4l2_ctrl_fwht_params),
 };
 
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 88231ba7b0fa..5cbe0ffbf501 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -943,7 +943,6 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:		return "Force Key Frame";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice Parameters";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-2 Quantization Matrices";
-	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:			return "FWHT Stateless Parameters";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
 	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
 
@@ -1185,6 +1184,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:		return "H264 Prediction Weight Table";
 	case V4L2_CID_STATELESS_H264_SLICE_PARAMS:		return "H264 Slice Parameters";
 	case V4L2_CID_STATELESS_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
+	case V4L2_CID_STATELESS_FWHT_PARAMS:			return "FWHT Stateless Parameters";
 	default:
 		return NULL;
 	}
@@ -1433,7 +1433,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:
 		*type = V4L2_CTRL_TYPE_MPEG2_QUANTIZATION;
 		break;
-	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:
+	case V4L2_CID_STATELESS_FWHT_PARAMS:
 		*type = V4L2_CTRL_TYPE_FWHT_PARAMS;
 		break;
 	case V4L2_CID_STATELESS_H264_SPS:
@@ -1627,6 +1627,7 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 {
 	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
 	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
+	struct v4l2_ctrl_fwht_params *p_fwht_params;
 	void *p = ptr.p + idx * ctrl->elem_size;
 
 	if (ctrl->p_def.p_const)
@@ -1653,6 +1654,12 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		p_vp8_frame_header = p;
 		p_vp8_frame_header->num_dct_parts = 1;
 		break;
+	case V4L2_CTRL_TYPE_FWHT_PARAMS:
+		p_fwht_params = p;
+		p_fwht_params->version = V4L2_FWHT_VERSION;
+		p_fwht_params->width = 1280;
+		p_fwht_params->height = 720;
+		break;
 	}
 }
 
@@ -1755,6 +1762,9 @@ static void std_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
 		pr_cont("H264_PRED_WEIGHTS");
 		break;
+	case V4L2_CTRL_TYPE_FWHT_PARAMS:
+		pr_cont("FWHT_PARAMS");
+		break;
 	default:
 		pr_cont("unknown type %d", ctrl->type);
 		break;
@@ -1798,6 +1808,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 {
 	struct v4l2_ctrl_mpeg2_slice_params *p_mpeg2_slice_params;
 	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
+	struct v4l2_ctrl_fwht_params *p_fwht_params;
 	struct v4l2_ctrl_h264_sps *p_h264_sps;
 	struct v4l2_ctrl_h264_pps *p_h264_pps;
 	struct v4l2_ctrl_h264_pred_weights *p_h264_pred_weights;
@@ -1857,6 +1868,11 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		break;
 
 	case V4L2_CTRL_TYPE_FWHT_PARAMS:
+		p_fwht_params = p;
+		if (p_fwht_params->version < V4L2_FWHT_VERSION)
+			return -EINVAL;
+		if (!p_fwht_params->width || !p_fwht_params->height)
+			return -EINVAL;
 		break;
 
 	case V4L2_CTRL_TYPE_H264_SPS:
diff --git a/include/media/fwht-ctrls.h b/include/media/fwht-ctrls.h
deleted file mode 100644
index a918b49609e1..000000000000
--- a/include/media/fwht-ctrls.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * These are the FWHT state controls for use with stateless FWHT
- * codec drivers.
- *
- * It turns out that these structs are not stable yet and will undergo
- * more changes. So keep them private until they are stable and ready to
- * become part of the official public API.
- */
-
-#ifndef _FWHT_CTRLS_H_
-#define _FWHT_CTRLS_H_
-
-#define V4L2_CTRL_TYPE_FWHT_PARAMS 0x0105
-
-#define V4L2_CID_MPEG_VIDEO_FWHT_PARAMS	(V4L2_CID_CODEC_BASE + 292)
-
-struct v4l2_ctrl_fwht_params {
-	__u64 backward_ref_ts;
-	__u32 version;
-	__u32 width;
-	__u32 height;
-	__u32 flags;
-	__u32 colorspace;
-	__u32 xfer_func;
-	__u32 ycbcr_enc;
-	__u32 quantization;
-};
-
-
-#endif
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index d25b38f78229..167ca8c8424f 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -18,7 +18,6 @@
  * This will move to the public headers once this API is fully stable.
  */
 #include <media/mpeg2-ctrls.h>
-#include <media/fwht-ctrls.h>
 #include <media/vp8-ctrls.h>
 #include <media/hevc-ctrls.h>
 
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 3f24663fba4a..823b214aac0c 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1565,6 +1565,76 @@ struct v4l2_ctrl_h264_decode_params {
 };
 
 
+/* Stateless FWHT control, used by the vicodec driver */
+
+/* Current FWHT version */
+#define V4L2_FWHT_VERSION			3
+
+/* Set if this is an interlaced format */
+#define V4L2_FWHT_FL_IS_INTERLACED		BIT(0)
+/* Set if this is a bottom-first (NTSC) interlaced format */
+#define V4L2_FWHT_FL_IS_BOTTOM_FIRST		BIT(1)
+/* Set if each 'frame' contains just one field */
+#define V4L2_FWHT_FL_IS_ALTERNATE		BIT(2)
+/*
+ * If V4L2_FWHT_FL_IS_ALTERNATE was set, then this is set if this
+ * 'frame' is the bottom field, else it is the top field.
+ */
+#define V4L2_FWHT_FL_IS_BOTTOM_FIELD		BIT(3)
+/* Set if the Y' plane is uncompressed */
+#define V4L2_FWHT_FL_LUMA_IS_UNCOMPRESSED	BIT(4)
+/* Set if the Cb plane is uncompressed */
+#define V4L2_FWHT_FL_CB_IS_UNCOMPRESSED		BIT(5)
+/* Set if the Cr plane is uncompressed */
+#define V4L2_FWHT_FL_CR_IS_UNCOMPRESSED		BIT(6)
+/* Set if the chroma plane is full height, if cleared it is half height */
+#define V4L2_FWHT_FL_CHROMA_FULL_HEIGHT		BIT(7)
+/* Set if the chroma plane is full width, if cleared it is half width */
+#define V4L2_FWHT_FL_CHROMA_FULL_WIDTH		BIT(8)
+/* Set if the alpha plane is uncompressed */
+#define V4L2_FWHT_FL_ALPHA_IS_UNCOMPRESSED	BIT(9)
+/* Set if this is an I Frame */
+#define V4L2_FWHT_FL_I_FRAME			BIT(10)
+
+/* A 4-values flag - the number of components - 1 */
+#define V4L2_FWHT_FL_COMPONENTS_NUM_MSK		GENMASK(18, 16)
+#define V4L2_FWHT_FL_COMPONENTS_NUM_OFFSET	16
+
+/* A 4-values flag - the pixel encoding type */
+#define V4L2_FWHT_FL_PIXENC_MSK			GENMASK(20, 19)
+#define V4L2_FWHT_FL_PIXENC_OFFSET		19
+#define V4L2_FWHT_FL_PIXENC_YUV			(1 << V4L2_FWHT_FL_PIXENC_OFFSET)
+#define V4L2_FWHT_FL_PIXENC_RGB			(2 << V4L2_FWHT_FL_PIXENC_OFFSET)
+#define V4L2_FWHT_FL_PIXENC_HSV			(3 << V4L2_FWHT_FL_PIXENC_OFFSET)
+
+#define V4L2_CID_STATELESS_FWHT_PARAMS		(V4L2_CID_CODEC_STATELESS_BASE + 100)
+/**
+ * struct v4l2_ctrl_fwht_params - FWHT parameters
+ *
+ * @backward_ref_ts: timestamp of the V4L2 capture buffer to use as reference.
+ * The timestamp refers to the timestamp field in struct v4l2_buffer.
+ * Use v4l2_timeval_to_ns() to convert the struct timeval to a __u64.
+ * @version: must be V4L2_FWHT_VERSION.
+ * @width: width of frame.
+ * @height: height of frame.
+ * @flags: FWHT flags (see V4L2_FWHT_FL_*).
+ * @colorspace: the colorspace (enum v4l2_colorspace).
+ * @xfer_func: the transfer function (enum v4l2_xfer_func).
+ * @ycbcr_enc: the Y'CbCr encoding (enum v4l2_ycbcr_encoding).
+ * @quantization: the quantization (enum v4l2_quantization).
+ */
+struct v4l2_ctrl_fwht_params {
+	__u64 backward_ref_ts;
+	__u32 version;
+	__u32 width;
+	__u32 height;
+	__u32 flags;
+	__u32 colorspace;
+	__u32 xfer_func;
+	__u32 ycbcr_enc;
+	__u32 quantization;
+};
+
 /* MPEG-compression definitions kept for backwards compatibility */
 #ifndef __KERNEL__
 #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 76231ca6e101..e40e95be79f9 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1740,6 +1740,7 @@ struct v4l2_ext_control {
 		struct v4l2_ctrl_h264_pred_weights __user *p_h264_pred_weights;
 		struct v4l2_ctrl_h264_slice_params __user *p_h264_slice_params;
 		struct v4l2_ctrl_h264_decode_params __user *p_h264_decode_params;
+		struct v4l2_ctrl_fwht_params __user *p_fwht_params;
 		void __user *ptr;
 	};
 } __attribute__ ((packed));
@@ -1793,6 +1794,8 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_H264_SLICE_PARAMS    = 0x0203,
 	V4L2_CTRL_TYPE_H264_DECODE_PARAMS   = 0x0204,
 	V4L2_CTRL_TYPE_H264_PRED_WEIGHTS    = 0x0205,
+
+	V4L2_CTRL_TYPE_FWHT_PARAMS	    = 0x0220,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
-- 
2.29.2

