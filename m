Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6FE3E2268
	for <lists+linux-media@lfdr.de>; Fri,  6 Aug 2021 06:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242766AbhHFEQs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Aug 2021 00:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242751AbhHFEQq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Aug 2021 00:16:46 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEABBC061798
        for <linux-media@vger.kernel.org>; Thu,  5 Aug 2021 21:16:29 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id 21-20020ac857150000b029024e8c2383c1so3766094qtw.5
        for <linux-media@vger.kernel.org>; Thu, 05 Aug 2021 21:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=GTLl3eNSoOtEcD4f/EwLDhZ5HVKcKh5UhzMMj82Q/+U=;
        b=UNJsp1GdlEVYf96AIy5vnfpIiN1GUwudh16mjwEwEnCoiDuD1GPRvmmqhBfp66o0sD
         ok6QXtJq+EzfFfOV4xnCw+N+iqJkz0uShyr5pMofOeSv8Du4xe5v2XF5H2skzQ+A3NSS
         ko0ic2Vk+kzKdXFiSLoRvpnxcTfWDGy4dlaipQzLZNQNPc16tILOfAqHR9d8TDEK2G//
         m8IRCeU4CMFhElCX7eyuSaYWkFWP39BHOjj7cEzYve1OCQgxlrs6TlUvXIdpoLHxSLRq
         uUErIfGC14N8MnBV7ePrpladj4IcrrP+rRUBNdtqJBIpBL6/1NgITa5h2FGI4VsDs+ar
         99ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=GTLl3eNSoOtEcD4f/EwLDhZ5HVKcKh5UhzMMj82Q/+U=;
        b=jJKHjIZrj4+OhvV5xEDTg+P9P/9ByCn/NMpVZYOvdIyoZqWVFNI6SaxXiUzo7fqQh8
         JvqIasoWY+n+41dP1cblUDcj7CRM74Ocz8olgew4RhOJ5k0ddSwHtZsA+lEZJSdhGjVE
         PtdBUk7D8Yy1SrcsUXqgYlKQqEVaOUn98jOPMCvizSzJF3Fi79kIm+Ky3hfBFEQlmZtY
         gbcI8burZg1ui0XVFGVBuJdIewrDB0prCnPd1ve/eXDqIwgrEMKhGa7CHvb91w4HN3+Y
         kKQZhk/TqWEk0YkMb6YiOfRSy6DbK00wY0QNGVxOIcsZT89BwXllFdvLEy8j2iuCfaz4
         pT9w==
X-Gm-Message-State: AOAM530oi8oql3UDNgaZcCmFHeifwimMkRQ0iFi+WiftYxZdUd+FgMcG
        0R0GOWzl242swx5Eg+GXomIhHViJQzrz
X-Google-Smtp-Source: ABdhPJx8gwF3x1OquPDqAT66DAKCQPwYSky9S5sdHjad8v1K9MPrBa7Gnr7bN+gI9CvI6Ggvv3oRwg0sA7y3
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:ebc2:859f:4153:773e])
 (user=tzungbi job=sendgmr) by 2002:ad4:44aa:: with SMTP id
 n10mr9142859qvt.18.1628223389008; Thu, 05 Aug 2021 21:16:29 -0700 (PDT)
Date:   Fri,  6 Aug 2021 12:15:26 +0800
In-Reply-To: <20210806041530.4170869-1-tzungbi@google.com>
Message-Id: <20210806041530.4170869-11-tzungbi@google.com>
Mime-Version: 1.0
References: <20210806041530.4170869-1-tzungbi@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v7 10/14] media: mtk-vcodec: vdec: support stateless API
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     hverkuil-cisco@xs4all.nl, yunfei.dong@mediatek.com,
        acourbot@chromium.org
Cc:     tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        dafna.hirschfeld@collabora.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

Support the stateless codec API that will be used by MT8183.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[acourbot: refactor, cleanup and split]
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/media/platform/mtk-vcodec/Makefile    |   1 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      |  66 +++-
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   8 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 360 ++++++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   3 +
 5 files changed, 434 insertions(+), 4 deletions(-)
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
index a220532802f9..2b334a8a81c6 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -47,7 +47,14 @@ static struct mtk_q_data *mtk_vdec_get_q_data(struct mtk_vcodec_ctx *ctx,
 static int vidioc_try_decoder_cmd(struct file *file, void *priv,
 				struct v4l2_decoder_cmd *cmd)
 {
-	return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
+	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+
+	/* Use M2M stateless helper if relevant */
+	if (ctx->dev->vdec_pdata->uses_stateless_api)
+		return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv,
+								cmd);
+	else
+		return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
 }
 
 
@@ -62,6 +69,10 @@ static int vidioc_decoder_cmd(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
+	/* Use M2M stateless helper if relevant */
+	if (ctx->dev->vdec_pdata->uses_stateless_api)
+		return v4l2_m2m_ioctl_stateless_decoder_cmd(file, priv, cmd);
+
 	mtk_v4l2_debug(1, "decoder cmd=%u", cmd->cmd);
 	dst_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
 				V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
@@ -401,7 +412,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 	 * Setting OUTPUT format after OUTPUT buffers are allocated is invalid
 	 * if using the stateful API.
 	 */
-	if ((f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) &&
+	if (!dec_pdata->uses_stateless_api &&
+	    f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
 	    vb2_is_busy(&ctx->m2m_ctx->out_q_ctx.q)) {
 		mtk_v4l2_err("out_q_ctx buffers already requested");
 		ret = -EBUSY;
@@ -444,6 +456,7 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 		ctx->quantization = pix_mp->quantization;
 		ctx->xfer_func = pix_mp->xfer_func;
 
+		ctx->current_codec = fmt->fourcc;
 		if (ctx->state == MTK_STATE_FREE) {
 			ret = vdec_if_init(ctx, q_data->fmt->fourcc);
 			if (ret) {
@@ -455,6 +468,48 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
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
+				     ctx->id);
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
+			       ctx->id, pix_mp->num_planes, ctx->picinfo.buf_w, ctx->picinfo.buf_h,
+			       ctx->picinfo.pic_w, ctx->picinfo.pic_h,
+			       ctx->q_data[MTK_Q_DATA_DST].sizeimage[0],
+			       ctx->q_data[MTK_Q_DATA_DST].sizeimage[1]);
+	}
 	return 0;
 }
 
@@ -746,9 +801,14 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
-			if (src_buf != &ctx->empty_flush_buf.vb)
+			if (src_buf != &ctx->empty_flush_buf.vb) {
+				struct media_request *req =
+					src_buf->vb2_buf.req_obj.req;
 				v4l2_m2m_buf_done(src_buf,
 						VB2_BUF_STATE_ERROR);
+				if (req)
+					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
+			}
 		}
 		return;
 	}
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
index 76856c0b2db8..9fbd24186c1a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
@@ -44,6 +44,7 @@ struct vdec_fb {
  *			queue yet
  * @error:		An unrecoverable error occurs on this buffer.
  * @frame_buffer:	Decode status, and buffer information of Capture buffer
+ * @bs_buffer:	Output buffer info
  *
  * Note : These status information help us track and debug buffer state
  */
@@ -54,11 +55,16 @@ struct mtk_video_dec_buf {
 	bool	queued_in_vb2;
 	bool	queued_in_v4l2;
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
index 000000000000..8f4a1f0a0769
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
@@ -0,0 +1,360 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-mem2mem.h>
+#include <linux/module.h>
+
+#include "mtk_vcodec_drv.h"
+#include "mtk_vcodec_dec.h"
+#include "mtk_vcodec_intr.h"
+#include "mtk_vcodec_util.h"
+#include "mtk_vcodec_dec_pm.h"
+#include "vdec_drv_if.h"
+
+/**
+ * struct mtk_stateless_control  - CID control type
+ * @cfg: control configuration
+ * @codec_type: codec type (V4L2 pixel format) for CID control type
+ */
+struct mtk_stateless_control {
+	struct v4l2_ctrl_config cfg;
+	int codec_type;
+};
+
+static const struct mtk_stateless_control mtk_stateless_controls[] = {
+	{
+		.cfg = {
+			.id = V4L2_CID_STATELESS_H264_SPS,
+		},
+		.codec_type = V4L2_PIX_FMT_H264_SLICE,
+	},
+	{
+		.cfg = {
+			.id = V4L2_CID_STATELESS_H264_PPS,
+		},
+		.codec_type = V4L2_PIX_FMT_H264_SLICE,
+	},
+	{
+		.cfg = {
+			.id = V4L2_CID_STATELESS_H264_SCALING_MATRIX,
+		},
+		.codec_type = V4L2_PIX_FMT_H264_SLICE,
+	},
+	{
+		.cfg = {
+			.id = V4L2_CID_STATELESS_H264_DECODE_PARAMS,
+		},
+		.codec_type = V4L2_PIX_FMT_H264_SLICE,
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
+	{
+		.cfg = {
+			.id = V4L2_CID_STATELESS_H264_START_CODE,
+			.min = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
+			.def = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
+			.max = V4L2_STATELESS_H264_START_CODE_ANNEX_B,
+		},
+		.codec_type = V4L2_PIX_FMT_H264_SLICE,
+	}
+};
+
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
+
+#define NUM_FORMATS ARRAY_SIZE(mtk_video_formats)
+#define DEFAULT_OUT_FMT_IDX    0
+#define DEFAULT_CAP_FMT_IDX    1
+
+static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
+	{
+		.fourcc	= V4L2_PIX_FMT_H264_SLICE,
+		.stepwise = {  MTK_VDEC_MIN_W, MTK_VDEC_MAX_W, 16,
+				MTK_VDEC_MIN_H, MTK_VDEC_MAX_H, 16 },
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
+	pfb->base_y.va = NULL;
+	pfb->base_y.dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
+	pfb->base_y.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
+
+	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2) {
+		pfb->base_c.va = NULL;
+		pfb->base_c.dma_addr =
+			vb2_dma_contig_plane_dma_addr(dst_buf, 1);
+		pfb->base_c.size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
+	}
+	mtk_v4l2_debug(1, "id=%d Framebuf  pfb=%p VA=%p Y_DMA=%pad C_DMA=%pad Size=%zx frame_count = %d",
+		       dst_buf->index, pfb, pfb->base_y.va, &pfb->base_y.dma_addr,
+		       &pfb->base_c.dma_addr, pfb->base_y.size, ctx->decoded_frame_cnt);
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
+	if (!vb2_v4l2_src) {
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		mtk_v4l2_debug(1, "[%d] no available source buffer", ctx->id);
+		return;
+	}
+
+	vb2_v4l2_dst = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+	if (!vb2_v4l2_dst) {
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
+	mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p", ctx->id,
+		       vb2_src->vb2_queue->type, vb2_src->index, vb2_src);
+
+	bs_src->va = NULL;
+	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
+	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
+
+	mtk_v4l2_debug(3, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
+		       ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);
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
+		mtk_v4l2_err(" <===[%d], src_buf[%d] sz=0x%zx pts=%llu vdec_if_decode() ret=%d res_chg=%d===>",
+			     ctx->id, vb2_src->index, bs_src->size,
+			     vb2_src->timestamp, ret, res_chg);
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
+					 ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);
+
+	v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+}
+
+static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
+{
+	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vb2_v4l2 = to_vb2_v4l2_buffer(vb);
+
+	mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p", ctx->id, vb->vb2_queue->type, vb->index, vb);
+
+	mutex_lock(&ctx->lock);
+	v4l2_m2m_buf_queue(ctx->m2m_ctx, vb2_v4l2);
+	mutex_unlock(&ctx->lock);
+	if (vb->vb2_queue->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		return;
+
+	/* If an OUTPUT buffer, we may need to update the state */
+	if (ctx->state == MTK_STATE_INIT) {
+		ctx->state = MTK_STATE_HEADER;
+		mtk_v4l2_debug(1, "Init driver from init to header.");
+	} else {
+		mtk_v4l2_debug(3, "[%d] already init driver %d", ctx->id, ctx->state);
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
+static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_ctx *ctx)
+{
+	unsigned int i;
+
+	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, NUM_CTRLS);
+	if (ctx->ctrl_hdl.error) {
+		mtk_v4l2_err("v4l2_ctrl_handler_init failed\n");
+		return ctx->ctrl_hdl.error;
+	}
+
+	for (i = 0; i < NUM_CTRLS; i++) {
+		struct v4l2_ctrl_config cfg = mtk_stateless_controls[i].cfg;
+
+		v4l2_ctrl_new_custom(&ctx->ctrl_hdl, &cfg, NULL);
+		if (ctx->ctrl_hdl.error) {
+			mtk_v4l2_err("Adding control %d failed %d", i, ctx->ctrl_hdl.error);
+			return ctx->ctrl_hdl.error;
+		}
+	}
+
+	v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
+
+	return 0;
+}
+
+static int fops_media_request_validate(struct media_request *mreq)
+{
+	const unsigned int buffer_cnt = vb2_request_buffer_cnt(mreq);
+
+	switch (buffer_cnt) {
+	case 1:
+		/* We expect exactly one buffer with the request */
+		break;
+	case 0:
+		mtk_v4l2_debug(1, "No buffer provided with the request");
+		return -ENOENT;
+	default:
+		mtk_v4l2_debug(1, "Too many buffers (%d) provided with the request",
+			       buffer_cnt);
+		return -EINVAL;
+	}
+
+	return vb2_request_validate(mreq);
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
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	vbuf->field = V4L2_FIELD_NONE;
+	return 0;
+}
+
+static struct vb2_ops mtk_vdec_request_vb2_ops = {
+	.queue_setup	= vb2ops_vdec_queue_setup,
+	.wait_prepare	= vb2_ops_wait_prepare,
+	.wait_finish	= vb2_ops_wait_finish,
+	.start_streaming	= vb2ops_vdec_start_streaming,
+	.stop_streaming	= vb2ops_vdec_stop_streaming,
+
+	.buf_queue	= vb2ops_vdec_stateless_buf_queue,
+	.buf_out_validate = vb2ops_vdec_out_buf_validate,
+	.buf_init	= vb2ops_vdec_buf_init,
+	.buf_prepare	= vb2ops_vdec_buf_prepare,
+	.buf_finish	= vb2ops_vdec_buf_finish,
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
index 17c960aa5262..8fb333a99a40 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -253,6 +253,7 @@ struct vdec_pic_info {
  * @empty_flush_buf: a fake size-0 capture buffer that indicates flush. Only
  *		     to be used with encoder and stateful decoder.
  * @is_flushing: set to true if flushing is in progress.
+ * @current_codec: current set input codec, in V4L2 pixel format
  *
  * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
  * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
@@ -294,6 +295,8 @@ struct mtk_vcodec_ctx {
 	struct v4l2_m2m_buffer empty_flush_buf;
 	bool is_flushing;
 
+	u32 current_codec;
+
 	enum v4l2_colorspace colorspace;
 	enum v4l2_ycbcr_encoding ycbcr_enc;
 	enum v4l2_quantization quantization;
-- 
2.32.0.605.g8dce9f2422-goog

