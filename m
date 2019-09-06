Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61F14AB796
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 13:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389504AbfIFL4U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 07:56:20 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40512 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391555AbfIFLz7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 07:55:59 -0400
Received: by mail-pl1-f196.google.com with SMTP id y10so3030101pll.7
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2019 04:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+/kbrT5RgVlcD8IHtfquxy/plHOr9A/yzVKeb3vAKmY=;
        b=fzLo+n84UIh5+sq04DE6OGZ95gfZusFjn4tK+P70lY0byQCaBsuCPIvCGk/lXtaFAv
         rxM7UaZqbEyzK4q72vKJ2LLwijQDKcXIM2h9SLuId+cppYzOTnsO8zRKxuilupSfkKV3
         PEbT0e8JrbGd+LDt8ii7bGQU9aRtKulpIgZqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+/kbrT5RgVlcD8IHtfquxy/plHOr9A/yzVKeb3vAKmY=;
        b=LiWofq41cUmj1CHjbLkUum3heNR9xYdOpssuuq90yuKsPqK83OCThn1FNoqRK6ncFP
         x6aM2zVIpIbr+709/X1539uiokJikEY0G9gr4RzubHjwz1dfNfwxEsP0ecEUblv5AbkW
         GYPopo+s7kCdYZJJz8wMh1VawOm3bgG/0pfuZg551XJI+c788KwatWK+DPLBUZ9MnsWX
         qqL8fJksUSMYE57Pb2xNcOC0JwvgPrkvrr/hqmR4WNWkV5T2X7GM4hhSv3bPPAKiRrND
         Cg1LMpSngpMb1+JOZi6Mtp0gK94nXyN6ZErQyt0EdhD70TYoJIN7zzg9HZoU4u/ASqds
         mI1w==
X-Gm-Message-State: APjAAAVQ4RumzjkoNq9KNYMwiuqu2vUSALxE6MqkQebLrlG3pgxGYhGC
        L35iSNEXyHkYFt9o4YnODScCsA==
X-Google-Smtp-Source: APXvYqzdWNych/pgfiaMPgDYh9JVW9g6f0NarLXr7wKpYwS6kP4fPM6ytelhXAv4vEX/bG01cUBvag==
X-Received: by 2002:a17:902:e48d:: with SMTP id cj13mr8687956plb.177.1567770958190;
        Fri, 06 Sep 2019 04:55:58 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id o22sm3667394pjq.21.2019.09.06.04.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 04:55:57 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [RFC PATCH v2 10/13] media: mtk-vcodec: vdec: support stateless API
Date:   Fri,  6 Sep 2019 20:55:10 +0900
Message-Id: <20190906115513.159705-11-acourbot@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190906115513.159705-1-acourbot@chromium.org>
References: <20190906115513.159705-1-acourbot@chromium.org>
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
 drivers/media/platform/mtk-vcodec/Makefile    |   2 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      |  57 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |  11 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 494 ++++++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   4 +
 5 files changed, 565 insertions(+), 3 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c

diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
index a9e189af5ba4..f7c1d27a85d5 100644
--- a/drivers/media/platform/mtk-vcodec/Makefile
+++ b/drivers/media/platform/mtk-vcodec/Makefile
@@ -7,11 +7,13 @@ obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-dec.o \
 mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 		vdec/vdec_vp8_if.o \
 		vdec/vdec_vp9_if.o \
+		vdec/vdec_h264_req_if.o \
 		mtk_vcodec_dec_drv.o \
 		vdec_drv_if.o \
 		vdec_vpu_if.o \
 		mtk_vcodec_dec.o \
 		mtk_vcodec_dec_stateful.o \
+		mtk_vcodec_dec_stateless.o \
 		mtk_vcodec_dec_pm.o \
 		mtk_vcodec_fw.o
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index fed3c006b42b..ed23f2f5639c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -419,7 +419,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 	 * Setting OUTPUT format after OUTPUT buffers are allocated is invalid
 	 * if using the stateful API.
 	 */
-	if ((f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) &&
+	if (!dec_pdata->uses_stateless_api &&
+	    (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) &&
 	    vb2_is_busy(&ctx->m2m_ctx->out_q_ctx.q)) {
 		mtk_v4l2_err("out_q_ctx buffers already requested");
 		ret = -EBUSY;
@@ -462,6 +463,7 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 		ctx->quantization = pix_mp->quantization;
 		ctx->xfer_func = pix_mp->xfer_func;
 
+		ctx->current_codec = fmt->fourcc;
 		if (ctx->state == MTK_STATE_FREE) {
 			ret = vdec_if_init(ctx, q_data->fmt->fourcc);
 			if (ret) {
@@ -473,6 +475,59 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
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
+		printk("S_FMT on %s: ",
+		       f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ?
+			       "OUTPUT" :
+			       "CAPTURE");
+
+		printk("%d %d %d %d %d\n",
+		       ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes,
+		       ctx->picinfo.fb_sz[0], ctx->picinfo.fb_sz[1],
+		       ctx->picinfo.buf_w, ctx->picinfo.buf_h);
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
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
index ef0efda0da05..ffcb7c2e8c7a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
@@ -35,7 +35,7 @@ struct vdec_fb {
 
 /**
  * struct mtk_video_dec_buf - Private data related to each VB2 buffer.
- * @b:		VB2 buffer
+ * @vb:	VB2 buffer
  * @list:	link list
  * @used:	Capture buffer contain decoded frame data and keep in
  *			codec data structure
@@ -45,6 +45,7 @@ struct vdec_fb {
  * @lastframe:		Intput buffer is last buffer - EOS
  * @error:		An unrecoverable error occurs on this buffer.
  * @frame_buffer:	Decode status, and buffer information of Capture buffer
+ * @bs_buffer:	Output buffer info
  *
  * Note : These status information help us track and debug buffer state
  */
@@ -56,12 +57,18 @@ struct mtk_video_dec_buf {
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
index 000000000000..9c21b72ba686
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
@@ -0,0 +1,494 @@
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
+
+	if (bs == NULL) {
+		mtk_v4l2_err("Free bitstream buffer fail.");
+		return;
+	}
+	out_buf = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+
+	if (out_buf->used) {
+		mtk_v4l2_debug(2,
+			"Free bitsteam buffer id = %d to done_list",
+			out_buf->vb.vb2_buf.index);
+
+		v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		if (error) {
+			v4l2_m2m_buf_done(&out_buf->vb, VB2_BUF_STATE_ERROR);
+			if (error == -EIO)
+				out_buf->error = true;
+		} else
+			v4l2_m2m_buf_done(&out_buf->vb, VB2_BUF_STATE_DONE);
+		out_buf->used = false;
+	} else
+		mtk_v4l2_err("Free bitsteam buffer id = %d not used",
+				out_buf->vb.vb2_buf.index);
+}
+
+static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_ctx *ctx,
+					   struct vdec_fb *fb, int error)
+{
+	struct mtk_video_dec_buf *vdec_frame_buf;
+	unsigned int cap_y_size = 0, cap_c_size = 0;
+
+	if (fb == NULL) {
+		mtk_v4l2_err("Free frame buffer fail.");
+		return;
+	}
+	vdec_frame_buf = container_of(fb, struct mtk_video_dec_buf,
+				      frame_buffer);
+	if (error == 1) {
+		cap_y_size = 0;
+		cap_c_size = 0;
+	} else {
+		cap_y_size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[0];
+		cap_c_size = ctx->q_data[MTK_Q_DATA_DST].sizeimage[1];
+	}
+
+	if (vdec_frame_buf->used) {
+		v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
+
+		vb2_set_plane_payload(&vdec_frame_buf->vb.vb2_buf, 0,
+			cap_y_size);
+		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
+			vb2_set_plane_payload(&vdec_frame_buf->vb.vb2_buf, 1,
+				cap_c_size);
+
+		mtk_v4l2_debug(2,
+			"Free frame buffer id = %d to done_list",
+			vdec_frame_buf->vb.vb2_buf.index);
+		if (error == 1)
+			vdec_frame_buf->vb.flags |= V4L2_BUF_FLAG_LAST;
+		v4l2_m2m_buf_done(&vdec_frame_buf->vb, VB2_BUF_STATE_DONE);
+		vdec_frame_buf->used = false;
+	} else
+		mtk_v4l2_err("Free frame buffer id = %d not used",
+				vdec_frame_buf->vb.vb2_buf.index);
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
+	framebuf = container_of(vb2_v4l2, struct mtk_video_dec_buf, vb);
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
+	src_buf_info = container_of(src_vb2_v4l2, struct mtk_video_dec_buf, vb);
+
+	mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p buf_info = %p",
+			ctx->id, src_buf->vb2_queue->type,
+			src_buf->index, src_buf, src_buf_info);
+
+	if (src_buf_info->lastframe) {
+		mtk_v4l2_debug(1, "Got empty flush input buffer.");
+
+		vdec_if_decode(ctx, NULL, NULL, &res_chg);
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		return;
+	}
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
+			src_buf_info->vb.vb2_buf.timestamp,
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
+		dst_buf = container_of(vb2_v4l2, struct mtk_video_dec_buf, vb);
+		mutex_lock(&ctx->lock);
+		if (dst_buf->used)
+			mtk_v4l2_err("Capture buffer in used (%d).", vb->index);
+		else {
+			dst_buf->used = true;
+			v4l2_m2m_buf_queue(ctx->m2m_ctx, vb2_v4l2);
+		}
+		mutex_unlock(&ctx->lock);
+		return;
+	}
+
+	src_buf = container_of(vb2_v4l2, struct mtk_video_dec_buf, vb);
+	mutex_lock(&ctx->lock);
+	if (src_buf->used)
+		mtk_v4l2_err("Output buffer still in used (%d).", vb->index);
+	else {
+		src_buf->used = true;
+		v4l2_m2m_buf_queue(ctx->m2m_ctx, vb2_v4l2);
+	}
+	mutex_unlock(&ctx->lock);
+
+	mtk_v4l2_debug(3, "(%d) id=%d, bs=%p used = %d last_frame = %d",
+		vb->vb2_queue->type,
+		vb->index, src_buf, src_buf->used, src_buf->lastframe);
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
+
+const struct mtk_vcodec_dec_pdata mtk_req_8183_pdata = {
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
index ae7e13b3431f..8167eeaa40e4 100644
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
@@ -302,6 +305,7 @@ struct mtk_vcodec_ctx {
 
 enum mtk_chip {
 	MTK_MT8173,
+	MTK_MT8183,
 };
 
 /**
-- 
2.23.0.187.g17f5b7556c-goog

