Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5895C20EE69
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 08:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730285AbgF3G2F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 02:28:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730274AbgF3G2B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 02:28:01 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4454C03E979
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 23:28:01 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id e9so9452844pgo.9
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 23:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4+m+EOx/bPV2OJ8zGLqFJloVPu2avFww3EyhIHm4v8o=;
        b=cmed1dydaqDKDtx1RmHs1kqZauxFjY4lnEAVe/49uNG8NEKq62Gk1okvzz2J/Uzv95
         95sQDG1MYukobUoCRUvbCU8d+iUybF1b4xKkpolf/4pXLfnMZ+NbQ08CDlnwvRtpSeuP
         Bn2I/3xjd02mw0WCHUUr9RYxWl0bQe5kjxemk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4+m+EOx/bPV2OJ8zGLqFJloVPu2avFww3EyhIHm4v8o=;
        b=ktNuZTYWOSiiJwVkHuccxR1HIx4RzuC8WkTxL5ZfJyEzdgyvveoY6AgyzBXZk9GSwo
         kdMJU23Ff6DK4m30A4PGNoQdkTl6yhBghSdvgq7xPp0YbC3le+CI/S9GTXcX7y3YdZqu
         vkmTS6xtRBBlNKI0C0OzsKV2xFUCtEjqZ7V8PAwYgBqw7pzqA04pMu6sQn+fa+2kfaNG
         FzcD0X9+6n5DsIHyoUmaSXB0+qsSK+w9vrnYIwaJtsKuNuGQKNl+i2KppPZd+c7P6CWV
         mns7X4BpKWZShj41+OQLmobM0qg3Y58DA01iKQFa13DtO7QLjXPKHIxKh2L5ciSdSeEx
         utXQ==
X-Gm-Message-State: AOAM533RsBWUrCMn6a5MTAWHdCeLltNbZpK6/WvGjxSPidAv8nI5qFQ4
        mq+vXRPg2rRaBbqsY/liBVSSzQ==
X-Google-Smtp-Source: ABdhPJywvI4QonObi2Y9OESNM/N548cmryxDIhqh7TOrf6BOT3a70TgoJWrz0fA11Y28qfLNqCdoMA==
X-Received: by 2002:a62:6446:: with SMTP id y67mr10603794pfb.299.1593498481133;
        Mon, 29 Jun 2020 23:28:01 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id d1sm1463366pfq.113.2020.06.29.23.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 23:28:00 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH 5/9] media: mtk-vcodec: vdec: support stateless API
Date:   Tue, 30 Jun 2020 15:27:07 +0900
Message-Id: <20200630062711.4169601-6-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200630062711.4169601-1-acourbot@chromium.org>
References: <20200630062711.4169601-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
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
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 469 ++++++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   3 +
 5 files changed, 545 insertions(+), 3 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c

diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
index a9e189af5ba4..057e2519aafd 100644
--- a/drivers/media/platform/mtk-vcodec/Makefile
+++ b/drivers/media/platform/mtk-vcodec/Makefile
@@ -12,6 +12,7 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 		vdec_vpu_if.o \
 		mtk_vcodec_dec.o \
 		mtk_vcodec_dec_stateful.o \
+		mtk_vcodec_dec_stateless.o \
 		mtk_vcodec_dec_pm.o \
 		mtk_vcodec_fw.o
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 7e01ac03887e..8de72879b1a0 100644
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
@@ -420,7 +431,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 	 * Setting OUTPUT format after OUTPUT buffers are allocated is invalid
 	 * if using the stateful API.
 	 */
-	if ((f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) &&
+	if (!dec_pdata->uses_stateless_api &&
+	    (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) &&
 	    vb2_is_busy(&ctx->m2m_ctx->out_q_ctx.q)) {
 		mtk_v4l2_err("out_q_ctx buffers already requested");
 		ret = -EBUSY;
@@ -463,6 +475,7 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 		ctx->quantization = pix_mp->quantization;
 		ctx->xfer_func = pix_mp->xfer_func;
 
+		ctx->current_codec = fmt->fourcc;
 		if (ctx->state == MTK_STATE_FREE) {
 			ret = vdec_if_init(ctx, q_data->fmt->fourcc);
 			if (ret) {
@@ -474,6 +487,49 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
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
 
@@ -770,9 +826,15 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
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
index 000000000000..9fad965af1c8
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
@@ -0,0 +1,469 @@
+// SPDX-License-Identifier: GPL-2.0
+
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
+ * @id: CID control id
+ * @v4l2_ctrl_type: CID control type
+ * @codec_type codec type (V4L2 pixel format) for CID control type
+ */
+struct mtk_stateless_control {
+	u32 id;
+	enum v4l2_ctrl_type type;
+	int codec_type;
+};
+
+static const struct mtk_stateless_control mtk_stateless_controls[] = {
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_SPS,
+		.type = V4L2_CTRL_TYPE_H264_SPS,
+		.codec_type = V4L2_PIX_FMT_H264_SLICE,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_PPS,
+		.type = V4L2_CTRL_TYPE_H264_PPS,
+		.codec_type = V4L2_PIX_FMT_H264_SLICE,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX,
+		.type = V4L2_CTRL_TYPE_H264_SCALING_MATRIX,
+		.codec_type = V4L2_PIX_FMT_H264_SLICE,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS,
+		.type = V4L2_CTRL_TYPE_H264_SLICE_PARAMS,
+		.codec_type = V4L2_PIX_FMT_H264_SLICE,
+	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_H264_DECODE_PARAMS,
+		.type = V4L2_CTRL_TYPE_H264_DECODE_PARAMS,
+		.codec_type = V4L2_PIX_FMT_H264_SLICE,
+	},
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
+static void mtk_vdec_stateless_out_to_done(struct mtk_vcodec_ctx *ctx,
+					   struct mtk_vcodec_mem *bs, int error)
+{
+	struct mtk_video_dec_buf *out_buf;
+	struct vb2_v4l2_buffer *vb;
+
+	if (bs == NULL) {
+		mtk_v4l2_err("Free bitstream buffer fail.");
+		return;
+	}
+	out_buf = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+	vb = &out_buf->m2m_buf.vb;
+
+	mtk_v4l2_debug(2,
+		"Free bitsteam buffer id = %d to done_list",
+		vb->vb2_buf.index);
+
+	v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+	if (error) {
+		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
+		if (error == -EIO)
+			out_buf->error = true;
+	} else
+		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_DONE);
+}
+
+static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_ctx *ctx,
+					   struct vdec_fb *fb, int error)
+{
+	struct mtk_video_dec_buf *vdec_frame_buf;
+	struct vb2_v4l2_buffer *vb;
+	unsigned int cap_y_size = 0, cap_c_size = 0;
+
+	if (fb == NULL) {
+		mtk_v4l2_err("Free frame buffer fail.");
+		return;
+	}
+	vdec_frame_buf = container_of(fb, struct mtk_video_dec_buf,
+				      frame_buffer);
+	vb = &vdec_frame_buf->m2m_buf.vb;
+	if (error == 1) {
+		cap_y_size = 0;
+		cap_c_size = 0;
+	} else {
+		cap_y_size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
+		cap_c_size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
+	}
+
+	v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
+
+	vb2_set_plane_payload(&vb->vb2_buf, 0, cap_y_size);
+	if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
+		vb2_set_plane_payload(&vb->vb2_buf, 1, cap_c_size);
+
+	mtk_v4l2_debug(2,
+		"Free frame buffer id = %d to done_list",
+		vb->vb2_buf.index);
+	if (error == 1)
+		vb->flags |= V4L2_BUF_FLAG_LAST;
+	v4l2_m2m_buf_done(vb, VB2_BUF_STATE_DONE);
+}
+
+static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_ctx *ctx)
+{
+	struct mtk_video_dec_buf *framebuf;
+	struct vb2_v4l2_buffer *vb2_v4l2;
+	struct vb2_buffer *dst_buf;
+	struct vdec_fb *pfb;
+
+	vb2_v4l2 = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+	if (vb2_v4l2 == NULL) {
+		mtk_v4l2_debug(1, "[%d] dst_buf empty!!", ctx->id);
+		return NULL;
+	}
+
+	dst_buf = &vb2_v4l2->vb2_buf;
+	framebuf = container_of(vb2_v4l2, struct mtk_video_dec_buf, m2m_buf.vb);
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
+	struct mtk_vcodec_ctx *ctx = NULL;
+	struct media_request_object *req_obj;
+	struct v4l2_ctrl_handler *parent_hdl, *hdl;
+	struct v4l2_ctrl *ctrl_test;
+	unsigned int buffer_cnt;
+	unsigned int i;
+
+	buffer_cnt = vb2_request_buffer_cnt(mreq);
+	if (!buffer_cnt) {
+		mtk_v4l2_err("Request count is zero");
+		return -ENOENT;
+	} else if (buffer_cnt > 1) {
+		mtk_v4l2_err("Request count is too much %d", buffer_cnt);
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
+	if (!ctx)
+		return -ENOENT;
+
+	parent_hdl = &ctx->ctrl_hdl;
+
+	hdl = v4l2_ctrl_request_hdl_find(mreq, parent_hdl);
+	if (!hdl) {
+		mtk_v4l2_err("Missing codec control(s)\n");
+		return -ENOENT;
+	}
+
+	for (i = 0; i < NUM_CTRLS; i++) {
+		if (mtk_stateless_controls[i].codec_type != ctx->current_codec)
+			continue;
+
+		ctrl_test = v4l2_ctrl_request_hdl_ctrl_find(hdl,
+					  mtk_stateless_controls[i].id);
+		if (!ctrl_test) {
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
+	struct vb2_buffer *src_buf;
+	struct vdec_fb *dst_buf;
+	struct mtk_vcodec_mem *buf;
+	struct mtk_video_dec_buf *src_buf_info;
+	struct vb2_v4l2_buffer *src_vb2_v4l2;
+	struct media_request *src_buf_req;
+	bool res_chg = false;
+	int ret;
+
+	src_vb2_v4l2 = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
+	if (src_vb2_v4l2 == NULL) {
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		mtk_v4l2_debug(1, "[%d] src_buf empty!!", ctx->id);
+		return;
+	}
+
+	src_buf = &src_vb2_v4l2->vb2_buf;
+	src_buf_info = container_of(src_vb2_v4l2, struct mtk_video_dec_buf,
+				    m2m_buf.vb);
+
+	mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p buf_info = %p",
+			ctx->id, src_buf->vb2_queue->type,
+			src_buf->index, src_buf, src_buf_info);
+
+	buf = &src_buf_info->bs_buffer;
+	buf->va = vb2_plane_vaddr(src_buf, 0);
+	buf->dma_addr = vb2_dma_contig_plane_dma_addr(src_buf, 0);
+	buf->size = (size_t)src_buf->planes[0].bytesused;
+	if (!buf->va) {
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		mtk_v4l2_err("[%d] id=%d src_addr is NULL!!",
+				ctx->id, src_buf->index);
+		return;
+	}
+
+	mtk_v4l2_debug(3, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
+			ctx->id, buf->va, &buf->dma_addr, buf->size, src_buf);
+	/* Apply request controls. */
+	src_buf_req = src_vb2_v4l2->vb2_buf.req_obj.req;
+	if (src_buf_req)
+		v4l2_ctrl_request_setup(src_buf_req, &ctx->ctrl_hdl);
+	else
+		mtk_v4l2_err("vb2 buffer media request is NULL");
+
+	dst_buf = vdec_get_cap_buffer(ctx);
+
+	v4l2_m2m_buf_copy_metadata(src_vb2_v4l2,
+				   v4l2_m2m_next_dst_buf(ctx->m2m_ctx), true);
+	ret = vdec_if_decode(ctx, buf, dst_buf, &res_chg);
+	if (ret) {
+		mtk_v4l2_err(
+			" <===[%d], src_buf[%d] sz=0x%zx pts=%llu vdec_if_decode() ret=%d res_chg=%d===>",
+			ctx->id,
+			src_buf->index,
+			buf->size,
+			src_buf->timestamp,
+			ret, res_chg);
+		if (ret == -EIO) {
+			mutex_lock(&ctx->lock);
+			src_buf_info->error = true;
+			mutex_unlock(&ctx->lock);
+		}
+	}
+
+	mtk_vdec_stateless_out_to_done(ctx, buf, ret);
+	if (!ret)
+		mtk_vdec_stateless_cap_to_disp(ctx, dst_buf, 0);
+
+	v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+
+	v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+}
+
+static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
+{
+	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vb2_v4l2 = NULL;
+	struct mtk_video_dec_buf *dst_buf = NULL;
+	struct mtk_video_dec_buf *src_buf = NULL;
+
+	mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p",
+			ctx->id, vb->vb2_queue->type,
+			vb->index, vb);
+
+	/*
+	 * check if this buffer is ready to be used after decode
+	 */
+	vb2_v4l2 = to_vb2_v4l2_buffer(vb);
+	if (vb->vb2_queue->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		dst_buf = container_of(vb2_v4l2, struct mtk_video_dec_buf,
+				       m2m_buf.vb);
+		mutex_lock(&ctx->lock);
+		v4l2_m2m_buf_queue(ctx->m2m_ctx, vb2_v4l2);
+		mutex_unlock(&ctx->lock);
+		return;
+	}
+
+	src_buf = container_of(vb2_v4l2, struct mtk_video_dec_buf, m2m_buf.vb);
+	mutex_lock(&ctx->lock);
+	v4l2_m2m_buf_queue(ctx->m2m_ctx, vb2_v4l2);
+	mutex_unlock(&ctx->lock);
+
+	mtk_v4l2_debug(3, "(%d) id=%d, bs=%p",
+		vb->vb2_queue->type, vb->index, src_buf);
+
+	if (ctx->state == MTK_STATE_INIT) {
+		ctx->state = MTK_STATE_HEADER;
+		mtk_v4l2_debug(1, "Init driver from init to header.");
+	} else
+		mtk_v4l2_debug(3, "[%d] already init driver %d",
+				ctx->id, ctx->state);
+
+}
+
+static void mtk_vdec_flush_decoder(struct mtk_vcodec_ctx *ctx)
+{
+	bool res_chg;
+
+	vdec_if_decode(ctx, NULL, NULL, &res_chg);
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
+	if (ctx->ctrl_hdl.error) {
+		mtk_v4l2_err("Adding control failed %d",
+				ctx->ctrl_hdl.error);
+		return ctx->ctrl_hdl.error;
+	}
+
+	for (i = 0; i < NUM_CTRLS; i++) {
+		struct v4l2_ctrl_config cfg = { 0 };
+
+		cfg.ops = &mtk_vcodec_dec_ctrl_ops;
+		cfg.id = mtk_stateless_controls[i].id;
+		cfg.type = mtk_stateless_controls[i].type;
+
+		v4l2_ctrl_new_custom(&ctx->ctrl_hdl, &cfg, NULL);
+		if (ctx->ctrl_hdl.error) {
+			mtk_v4l2_err("Adding control failed %d",
+					ctx->ctrl_hdl.error);
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
index 386712f9bffc..755631d0fe92 100644
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
2.27.0.212.ge8ba1cc988-goog

