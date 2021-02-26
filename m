Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9253260D8
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 11:05:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbhBZKEs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 05:04:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230460AbhBZKDb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 05:03:31 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E183C0617A9
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 02:02:15 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id g20so5056684plo.2
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 02:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xf1n7bqrZGXhTFrLGkD8rrNmTTWbjeJmtR2LOAnS+z8=;
        b=bAb5HW9H3zX2Mi+oHT0RuLWj0CxYLc06xYLa4jt7JRoPAgPGt7EE2mUodB/K9spz53
         nB2eKVtVZqGrwrONhBFeADX3Ets9+zO9B59bzFegorgd8OXi5okgUFq0Gjio91b7R3T0
         evvJON31ySpZ66tosLF5mtqO66oGDANTwlVcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xf1n7bqrZGXhTFrLGkD8rrNmTTWbjeJmtR2LOAnS+z8=;
        b=M2WofTBW5wu0vYg0vKfPZG7mJfCyQFlHeQGTb4ahq8qTZnnV45ZwuPp34ZeUenSUxd
         +lkQ2OkZ7fSDFVJsQsIGcW6ibezCMzKGJJrH5s1JEypu9auWMJpAsiJxdXwD9Xfvdyc/
         x+8vAisvAcBOc2Hlki6mJfZ3erpIn+ktfqegWFsJKcCvvgr9T9pncfv+EKvwy3zFugwU
         jA6bmmMSIvgeLHdS6Np7h+MZfu5O7S8X7bQFy9QDjILGnJvM4/9NZY8NfAtYWlF9cG2U
         9i7wC3T+nDrgjgtk0zECoAZCYQ1I48CSFn4HvX3QncNFZPtr2Kye3FYkwLC01fCZG3RP
         HYmQ==
X-Gm-Message-State: AOAM533g78XyrBN7kjqWaBvxqKySuHBBryJRN6zuulGdn7OpFVjLVgFx
        efZG+x+gmPpOtt9MHCo8a4Brg6uVeQDsqw==
X-Google-Smtp-Source: ABdhPJxw+Hs8GFSIHFygJ4/1o580n1P9AY66U9PKyjxWujWHCrmkpspX/4bG09I1/LYbgA8aN/dfuQ==
X-Received: by 2002:a17:90a:174d:: with SMTP id 13mr2698911pjm.181.1614333734685;
        Fri, 26 Feb 2021 02:02:14 -0800 (PST)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:5c91:233c:dd5b:b1b0])
        by smtp.gmail.com with ESMTPSA id o23sm9201565pfp.89.2021.02.26.02.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 02:02:14 -0800 (PST)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v3 05/15] media: mtk-vcodec: vdec: support stateless API
Date:   Fri, 26 Feb 2021 19:01:38 +0900
Message-Id: <20210226100148.1663389-6-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210226100148.1663389-1-acourbot@chromium.org>
References: <20210226100148.1663389-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

Support the stateless codec API that will be used by MT8183.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[acourbot: refactor, cleanup and split]
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/Makefile    |   1 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      |  66 ++-
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   9 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 427 ++++++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   3 +
 5 files changed, 503 insertions(+), 3 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c

diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
index 9c3cbb5b800e..4ba93d838ab6 100644
--- a/drivers/media/platform/mtk-vcodec/Makefile
+++ b/drivers/media/platform/mtk-vcodec/Makefile
@@ -12,6 +12,7 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 		vdec_vpu_if.o \
 		mtk_vcodec_dec.o \
 		mtk_vcodec_dec_stateful.o \
+		mtk_vcodec_dec_stateless.o \
 		mtk_vcodec_dec_pm.o \
 
 mtk-vcodec-enc-y := venc/venc_vp8_if.o \
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 4a91d294002b..c286cc0f239f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -46,6 +46,13 @@ static struct mtk_q_data *mtk_vdec_get_q_data(struct mtk_vcodec_ctx *ctx,
 static int vidioc_try_decoder_cmd(struct file *file, void *priv,
 				struct v4l2_decoder_cmd *cmd)
 {
+	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+
+	/* Use M2M stateless helper if relevant */
+	if (ctx->dev->vdec_pdata->uses_stateless_api)
+		return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv,
+								cmd);
+
 	switch (cmd->cmd) {
 	case V4L2_DEC_CMD_STOP:
 	case V4L2_DEC_CMD_START:
@@ -72,6 +79,10 @@ static int vidioc_decoder_cmd(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
+	/* Use M2M stateless helper if relevant */
+	if (ctx->dev->vdec_pdata->uses_stateless_api)
+		return v4l2_m2m_ioctl_stateless_decoder_cmd(file, priv, cmd);
+
 	mtk_v4l2_debug(1, "decoder cmd=%u", cmd->cmd);
 	dst_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
 				V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
@@ -414,7 +425,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 	 * Setting OUTPUT format after OUTPUT buffers are allocated is invalid
 	 * if using the stateful API.
 	 */
-	if ((f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) &&
+	if (!dec_pdata->uses_stateless_api &&
+	    (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) &&
 	    vb2_is_busy(&ctx->m2m_ctx->out_q_ctx.q)) {
 		mtk_v4l2_err("out_q_ctx buffers already requested");
 		ret = -EBUSY;
@@ -457,6 +469,7 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 		ctx->quantization = pix_mp->quantization;
 		ctx->xfer_func = pix_mp->xfer_func;
 
+		ctx->current_codec = fmt->fourcc;
 		if (ctx->state == MTK_STATE_FREE) {
 			ret = vdec_if_init(ctx, q_data->fmt->fourcc);
 			if (ret) {
@@ -468,6 +481,49 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 		}
 	}
 
+	/*
+	 * If using the stateless API, S_FMT should have the effect of setting
+	 * the CAPTURE queue resolution no matter which queue it was called on.
+	 */
+	if (dec_pdata->uses_stateless_api) {
+		ctx->picinfo.pic_w = pix_mp->width;
+		ctx->picinfo.pic_h = pix_mp->height;
+
+		ret = vdec_if_get_param(ctx, GET_PARAM_PIC_INFO, &ctx->picinfo);
+		if (ret) {
+			mtk_v4l2_err("[%d]Error!! Get GET_PARAM_PICTURE_INFO Fail",
+				ctx->id);
+			return -EINVAL;
+		}
+
+		ctx->last_decoded_picinfo = ctx->picinfo;
+
+		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1) {
+			ctx->q_data[MTK_Q_DATA_DST].sizeimage[0] =
+				ctx->picinfo.fb_sz[0] +
+				ctx->picinfo.fb_sz[1];
+			ctx->q_data[MTK_Q_DATA_DST].bytesperline[0] =
+				ctx->picinfo.buf_w;
+		} else {
+			ctx->q_data[MTK_Q_DATA_DST].sizeimage[0] =
+				ctx->picinfo.fb_sz[0];
+			ctx->q_data[MTK_Q_DATA_DST].bytesperline[0] =
+				ctx->picinfo.buf_w;
+			ctx->q_data[MTK_Q_DATA_DST].sizeimage[1] =
+				ctx->picinfo.fb_sz[1];
+			ctx->q_data[MTK_Q_DATA_DST].bytesperline[1] =
+				ctx->picinfo.buf_w;
+		}
+
+		ctx->q_data[MTK_Q_DATA_DST].coded_width = ctx->picinfo.buf_w;
+		ctx->q_data[MTK_Q_DATA_DST].coded_height = ctx->picinfo.buf_h;
+		mtk_v4l2_debug(2, "[%d] vdec_if_init() num_plane = %d wxh=%dx%d pic wxh=%dx%d sz[0]=0x%x sz[1]=0x%x",
+			ctx->id, pix_mp->num_planes,
+			ctx->picinfo.buf_w, ctx->picinfo.buf_h,
+			ctx->picinfo.pic_w, ctx->picinfo.pic_h,
+			ctx->q_data[MTK_Q_DATA_DST].sizeimage[0],
+			ctx->q_data[MTK_Q_DATA_DST].sizeimage[1]);
+	}
 	return 0;
 }
 
@@ -765,9 +821,15 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
 			struct mtk_video_dec_buf *buf_info = container_of(
 				 src_buf, struct mtk_video_dec_buf, m2m_buf.vb);
-			if (!buf_info->lastframe)
+			if (!buf_info->lastframe) {
+				struct media_request *req =
+					src_buf->vb2_buf.req_obj.req;
 				v4l2_m2m_buf_done(src_buf,
 						VB2_BUF_STATE_ERROR);
+				if (req)
+					v4l2_ctrl_request_complete(req,
+								&ctx->ctrl_hdl);
+			}
 		}
 		return;
 	}
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
index 97a8304f6600..a2949e1bc7fe 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
@@ -45,6 +45,7 @@ struct vdec_fb {
  * @lastframe:		Intput buffer is last buffer - EOS
  * @error:		An unrecoverable error occurs on this buffer.
  * @frame_buffer:	Decode status, and buffer information of Capture buffer
+ * @bs_buffer:	Output buffer info
  *
  * Note : These status information help us track and debug buffer state
  */
@@ -55,12 +56,18 @@ struct mtk_video_dec_buf {
 	bool	queued_in_vb2;
 	bool	queued_in_v4l2;
 	bool	lastframe;
+
 	bool	error;
-	struct vdec_fb	frame_buffer;
+
+	union {
+		struct vdec_fb	frame_buffer;
+		struct mtk_vcodec_mem	bs_buffer;
+	};
 };
 
 extern const struct v4l2_ioctl_ops mtk_vdec_ioctl_ops;
 extern const struct v4l2_m2m_ops mtk_vdec_m2m_ops;
+extern const struct media_device_ops mtk_vcodec_media_ops;
 
 
 /*
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
new file mode 100644
index 000000000000..e2e08f54109b
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
@@ -0,0 +1,427 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "media/videobuf2-v4l2.h"
+#include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-mem2mem.h>
+#include <linux/module.h>
+
+#include "mtk_vcodec_drv.h"
+#include "mtk_vcodec_dec.h"
+#include "mtk_vcodec_intr.h"
+#include "mtk_vcodec_util.h"
+#include "vdec_drv_if.h"
+#include "mtk_vcodec_dec_pm.h"
+
+/**
+ * struct mtk_stateless_control  - CID control type
+ * @cfg: Control configuration
+ * @codec_type: codec type (V4L2 pixel format) for CID control type
+ * @needed_in_request: whether the control must be present with each request
+ */
+struct mtk_stateless_control {
+	struct v4l2_ctrl_config cfg;
+	int codec_type;
+	bool needed_in_request;
+};
+
+static const struct mtk_stateless_control mtk_stateless_controls[] = {
+	{
+		.cfg = {
+			.id = V4L2_CID_STATELESS_H264_SPS,
+		},
+		.codec_type = V4L2_PIX_FMT_H264_SLICE,
+		.needed_in_request = true,
+	},
+	{
+		.cfg = {
+			.id = V4L2_CID_STATELESS_H264_PPS,
+		},
+		.codec_type = V4L2_PIX_FMT_H264_SLICE,
+		.needed_in_request = true,
+	},
+	{
+		.cfg = {
+			.id = V4L2_CID_STATELESS_H264_SCALING_MATRIX,
+		},
+		.codec_type = V4L2_PIX_FMT_H264_SLICE,
+		.needed_in_request = true,
+	},
+	{
+		.cfg = {
+			.id = V4L2_CID_STATELESS_H264_DECODE_PARAMS,
+		},
+		.codec_type = V4L2_PIX_FMT_H264_SLICE,
+		.needed_in_request = true,
+	},
+	{
+		.cfg = {
+			.id = V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+			.def = V4L2_MPEG_VIDEO_H264_PROFILE_MAIN,
+			.max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
+			.menu_skip_mask =
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED),
+		},
+		.codec_type = V4L2_PIX_FMT_H264_SLICE,
+	},
+	{
+		.cfg = {
+			.id = V4L2_CID_STATELESS_H264_DECODE_MODE,
+			.min = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
+			.def = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
+			.max = V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
+		},
+		.codec_type = V4L2_PIX_FMT_H264_SLICE,
+	},
+};
+#define NUM_CTRLS ARRAY_SIZE(mtk_stateless_controls)
+
+static const struct mtk_video_fmt mtk_video_formats[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_H264_SLICE,
+		.type = MTK_FMT_DEC,
+		.num_planes = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_MM21,
+		.type = MTK_FMT_FRAME,
+		.num_planes = 2,
+	},
+};
+#define NUM_FORMATS ARRAY_SIZE(mtk_video_formats)
+#define DEFAULT_OUT_FMT_IDX    0
+#define DEFAULT_CAP_FMT_IDX    1
+
+static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
+	{
+		.fourcc	= V4L2_PIX_FMT_H264_SLICE,
+		.stepwise = {
+			MTK_VDEC_MIN_W, MTK_VDEC_MAX_W, 16,
+			MTK_VDEC_MIN_H, MTK_VDEC_MAX_H, 16,
+		},
+	},
+};
+
+#define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
+
+static void mtk_vdec_stateless_set_dst_payload(struct mtk_vcodec_ctx *ctx,
+					       struct vdec_fb *fb)
+{
+	struct mtk_video_dec_buf *vdec_frame_buf =
+		container_of(fb, struct mtk_video_dec_buf, frame_buffer);
+	struct vb2_v4l2_buffer *vb = &vdec_frame_buf->m2m_buf.vb;
+	unsigned int cap_y_size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
+
+	vb2_set_plane_payload(&vb->vb2_buf, 0, cap_y_size);
+	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
+		unsigned int cap_c_size =
+			ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
+
+		vb2_set_plane_payload(&vb->vb2_buf, 1, cap_c_size);
+	}
+}
+
+static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_ctx *ctx,
+					   struct vb2_v4l2_buffer *vb2_v4l2)
+{
+	struct mtk_video_dec_buf *framebuf =
+		container_of(vb2_v4l2, struct mtk_video_dec_buf, m2m_buf.vb);
+	struct vdec_fb *pfb = &framebuf->frame_buffer;
+	struct vb2_buffer *dst_buf = &vb2_v4l2->vb2_buf;
+
+	pfb = &framebuf->frame_buffer;
+	pfb->base_y.va = vb2_plane_vaddr(dst_buf, 0);
+	pfb->base_y.dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
+	pfb->base_y.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
+
+	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
+		pfb->base_c.va = vb2_plane_vaddr(dst_buf, 1);
+		pfb->base_c.dma_addr =
+			vb2_dma_contig_plane_dma_addr(dst_buf, 1);
+		pfb->base_c.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
+	}
+	mtk_v4l2_debug(1,
+		"id=%d Framebuf  pfb=%p VA=%p Y_DMA=%pad C_DMA=%pad Size=%zx frame_count = %d",
+		dst_buf->index, pfb,
+		pfb->base_y.va, &pfb->base_y.dma_addr,
+		&pfb->base_c.dma_addr, pfb->base_y.size,
+		ctx->decoded_frame_cnt);
+
+	return pfb;
+}
+
+static void vb2ops_vdec_buf_request_complete(struct vb2_buffer *vb)
+{
+	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+
+	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_hdl);
+}
+
+static int fops_media_request_validate(struct media_request *mreq)
+{
+	const unsigned int buffer_cnt = vb2_request_buffer_cnt(mreq);
+	struct mtk_vcodec_ctx *ctx = NULL;
+	struct media_request_object *req_obj;
+	struct v4l2_ctrl_handler *parent_hdl, *hdl;
+	struct v4l2_ctrl *ctrl;
+	unsigned int i;
+
+	switch (buffer_cnt) {
+	case 1:
+		/* We expect exactly one buffer with the request */
+		break;
+	case 0:
+		mtk_v4l2_err("No buffer provided with the request");
+		return -ENOENT;
+	default:
+		mtk_v4l2_err("Too many buffers (%d) provided with the request",
+			     buffer_cnt);
+		return -EINVAL;
+	}
+
+	list_for_each_entry(req_obj, &mreq->objects, list) {
+		struct vb2_buffer *vb;
+
+		if (vb2_request_object_is_buffer(req_obj)) {
+			vb = container_of(req_obj, struct vb2_buffer, req_obj);
+			ctx = vb2_get_drv_priv(vb->vb2_queue);
+			break;
+		}
+	}
+
+	if (!ctx) {
+		mtk_v4l2_err("Cannot find buffer for request");
+		return -ENOENT;
+	}
+
+	parent_hdl = &ctx->ctrl_hdl;
+
+	hdl = v4l2_ctrl_request_hdl_find(mreq, parent_hdl);
+	if (!hdl) {
+		mtk_v4l2_err("Cannot find control handler for request\n");
+		return -ENOENT;
+	}
+
+	for (i = 0; i < NUM_CTRLS; i++) {
+		if (mtk_stateless_controls[i].codec_type != ctx->current_codec)
+			continue;
+		if (!mtk_stateless_controls[i].needed_in_request)
+			continue;
+
+		ctrl = v4l2_ctrl_request_hdl_ctrl_find(hdl,
+					  mtk_stateless_controls[i].cfg.id);
+		if (!ctrl) {
+			mtk_v4l2_err("Missing required codec control\n");
+			return -ENOENT;
+		}
+	}
+
+	v4l2_ctrl_request_hdl_put(hdl);
+
+	return vb2_request_validate(mreq);
+}
+
+static void mtk_vdec_worker(struct work_struct *work)
+{
+	struct mtk_vcodec_ctx *ctx =
+		container_of(work, struct mtk_vcodec_ctx, decode_work);
+	struct mtk_vcodec_dev *dev = ctx->dev;
+	struct vb2_v4l2_buffer *vb2_v4l2_src, *vb2_v4l2_dst;
+	struct vb2_buffer *vb2_src;
+	struct mtk_vcodec_mem *bs_src;
+	struct mtk_video_dec_buf *dec_buf_src;
+	struct media_request *src_buf_req;
+	struct vdec_fb *dst_buf;
+	bool res_chg = false;
+	int ret;
+
+	vb2_v4l2_src = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
+	if (vb2_v4l2_src == NULL) {
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		mtk_v4l2_debug(1, "[%d] no available source buffer", ctx->id);
+		return;
+	}
+
+	vb2_v4l2_dst = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+	if (vb2_v4l2_dst == NULL) {
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		mtk_v4l2_debug(1, "[%d] no available destination buffer", ctx->id);
+		return;
+	}
+
+	vb2_src = &vb2_v4l2_src->vb2_buf;
+	dec_buf_src = container_of(vb2_v4l2_src, struct mtk_video_dec_buf,
+				   m2m_buf.vb);
+	bs_src = &dec_buf_src->bs_buffer;
+
+	mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p buf_info = %p",
+			ctx->id, src_buf->vb2_queue->type,
+			src_buf->index, src_buf, src_buf_info);
+
+	bs_src->va = vb2_plane_vaddr(vb2_src, 0);
+	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
+	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
+	if (!bs_src->va) {
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		mtk_v4l2_err("[%d] id=%d source buffer is NULL", ctx->id,
+			     vb2_src->index);
+		return;
+	}
+
+	mtk_v4l2_debug(3, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
+			ctx->id, buf->va, &buf->dma_addr, buf->size, src_buf);
+	/* Apply request controls. */
+	src_buf_req = vb2_src->req_obj.req;
+	if (src_buf_req)
+		v4l2_ctrl_request_setup(src_buf_req, &ctx->ctrl_hdl);
+	else
+		mtk_v4l2_err("vb2 buffer media request is NULL");
+
+	dst_buf = vdec_get_cap_buffer(ctx, vb2_v4l2_dst);
+	v4l2_m2m_buf_copy_metadata(vb2_v4l2_src, vb2_v4l2_dst, true);
+	ret = vdec_if_decode(ctx, bs_src, dst_buf, &res_chg);
+	if (ret) {
+		mtk_v4l2_err(
+			" <===[%d], src_buf[%d] sz=0x%zx pts=%llu vdec_if_decode() ret=%d res_chg=%d===>",
+			ctx->id, vb2_src->index, bs_src->size,
+			vb2_src->timestamp, ret, res_chg);
+		if (ret == -EIO) {
+			mutex_lock(&ctx->lock);
+			dec_buf_src->error = true;
+			mutex_unlock(&ctx->lock);
+		}
+	}
+
+	mtk_vdec_stateless_set_dst_payload(ctx, dst_buf);
+
+	v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx,
+		ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
+
+	v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+}
+
+static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
+{
+	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vb2_v4l2 = to_vb2_v4l2_buffer(vb);
+
+	mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p",
+			ctx->id, vb->vb2_queue->type,
+			vb->index, vb);
+
+	mutex_lock(&ctx->lock);
+	v4l2_m2m_buf_queue(ctx->m2m_ctx, vb2_v4l2);
+	mutex_unlock(&ctx->lock);
+	if (vb->vb2_queue->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return;
+
+	mtk_v4l2_debug(3, "(%d) id=%d, bs=%p",
+		vb->vb2_queue->type, vb->index, src_buf);
+
+	/* If an OUTPUT buffer, we may need to update the state */
+	if (ctx->state == MTK_STATE_INIT) {
+		ctx->state = MTK_STATE_HEADER;
+		mtk_v4l2_debug(1, "Init driver from init to header.");
+	} else {
+		mtk_v4l2_debug(3, "[%d] already init driver %d",
+				ctx->id, ctx->state);
+	}
+}
+
+static int mtk_vdec_flush_decoder(struct mtk_vcodec_ctx *ctx)
+{
+	bool res_chg;
+
+	return vdec_if_decode(ctx, NULL, NULL, &res_chg);
+}
+
+static const struct v4l2_ctrl_ops mtk_vcodec_dec_ctrl_ops = {
+	.g_volatile_ctrl = mtk_vdec_g_v_ctrl,
+};
+
+static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_ctx *ctx)
+{
+	struct v4l2_ctrl *ctrl;
+	unsigned int i;
+
+	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, NUM_CTRLS);
+	if (ctx->ctrl_hdl.error) {
+		mtk_v4l2_err("v4l2_ctrl_handler_init failed\n");
+		return ctx->ctrl_hdl.error;
+	}
+
+	ctrl = v4l2_ctrl_new_std(&ctx->ctrl_hdl,
+				&mtk_vcodec_dec_ctrl_ops,
+				V4L2_CID_MIN_BUFFERS_FOR_CAPTURE,
+				0, 32, 1, 1);
+	ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
+
+	for (i = 0; i < NUM_CTRLS; i++) {
+		struct v4l2_ctrl_config cfg = mtk_stateless_controls[i].cfg;
+
+		v4l2_ctrl_new_custom(&ctx->ctrl_hdl, &cfg, NULL);
+		if (ctx->ctrl_hdl.error) {
+			mtk_v4l2_err("Adding control %d failed %d",
+					i, ctx->ctrl_hdl.error);
+			return ctx->ctrl_hdl.error;
+		}
+	}
+
+	v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
+
+	return 0;
+}
+
+const struct media_device_ops mtk_vcodec_media_ops = {
+	.req_validate	= fops_media_request_validate,
+	.req_queue	= v4l2_m2m_request_queue,
+};
+
+static void mtk_init_vdec_params(struct mtk_vcodec_ctx *ctx)
+{
+	struct vb2_queue *src_vq;
+
+	src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
+				 V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+
+	/* Support request api for output plane */
+	src_vq->supports_requests = true;
+	src_vq->requires_requests = true;
+}
+
+static int vb2ops_vdec_out_buf_validate(struct vb2_buffer *vb)
+{
+	return 0;
+}
+
+static struct vb2_ops mtk_vdec_request_vb2_ops = {
+	.queue_setup	= vb2ops_vdec_queue_setup,
+	.buf_prepare	= vb2ops_vdec_buf_prepare,
+	.wait_prepare	= vb2_ops_wait_prepare,
+	.wait_finish	= vb2_ops_wait_finish,
+	.start_streaming	= vb2ops_vdec_start_streaming,
+
+	.buf_queue	= vb2ops_vdec_stateless_buf_queue,
+	.buf_out_validate = vb2ops_vdec_out_buf_validate,
+	.buf_init	= vb2ops_vdec_buf_init,
+	.buf_finish	= vb2ops_vdec_buf_finish,
+	.stop_streaming	= vb2ops_vdec_stop_streaming,
+	.buf_request_complete = vb2ops_vdec_buf_request_complete,
+};
+
+const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
+	.chip = MTK_MT8183,
+	.init_vdec_params = mtk_init_vdec_params,
+	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
+	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
+	.vdec_formats = mtk_video_formats,
+	.num_formats = NUM_FORMATS,
+	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
+	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
+	.vdec_framesizes = mtk_vdec_framesizes,
+	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
+	.uses_stateless_api = true,
+	.worker = mtk_vdec_worker,
+	.flush_decoder = mtk_vdec_flush_decoder,
+};
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 60bc39efa20d..3b884a321883 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -251,6 +251,7 @@ struct vdec_pic_info {
  * @encode_work: worker for the encoding
  * @last_decoded_picinfo: pic information get from latest decode
  * @empty_flush_buf: a fake size-0 capture buffer that indicates flush
+ * @current_codec: current set input codec, in V4L2 pixel format
  *
  * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
  * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
@@ -290,6 +291,8 @@ struct mtk_vcodec_ctx {
 	struct vdec_pic_info last_decoded_picinfo;
 	struct mtk_video_dec_buf *empty_flush_buf;
 
+	u32 current_codec;
+
 	enum v4l2_colorspace colorspace;
 	enum v4l2_ycbcr_encoding ycbcr_enc;
 	enum v4l2_quantization quantization;
-- 
2.30.1.766.gb4fecdf3b7-goog

