Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9963D2BED7
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 07:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727631AbfE1F5b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 01:57:31 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34128 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727603AbfE1F5a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 01:57:30 -0400
Received: by mail-pf1-f196.google.com with SMTP id n19so10792608pfa.1
        for <linux-media@vger.kernel.org>; Mon, 27 May 2019 22:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3I3s7m3S+LldSzKlGHpLeTaVocFR8exnD2Q8TnvNiB8=;
        b=PPRF57D7dS61bsASUJPuiPoOMd1AQ5+edgDhhLEjm/cV1ml8/mMB8JCWUDFzBpKUL5
         1D9vt/o164NYjm4EK+Bl0p3QiTSYp4wAhyqNEZxEjQkkJ6FufvUvi/RYA4HOqU9HUlri
         P0VfJpxWX+H/FQ5BbMOWN69TOPGubSYhjIH4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3I3s7m3S+LldSzKlGHpLeTaVocFR8exnD2Q8TnvNiB8=;
        b=pvYWQWFio8W2WEAFkbWXP/bftqy8k6/W+GX44en3+0a7vzRfvnuW3jqsGEe0NlBOZY
         UJ2Nz9hB61eXahcj6itpo3BAReVL0EVocpFp+bXOJg8765TwwyW9qvr3j54ufREWyfa/
         1mCib2xlNgt/ChNxWLXEA0EsLGEU+nVvnUmVvd3pAui6XZtVZLD3merd/y09rhzyFvig
         D5vHQacmtkICOEpOScVmiQ7IYW4p7PLhwX5X4N6FyE4GPqbMPFWrurD5y3heAYngoO3P
         rUMe/kVA9hm3DxZCAk3jNFPnx0oVS2KQmku/cL0NQGPsPmH2UzDJ5YtDwRc6plHzcjD+
         tE3g==
X-Gm-Message-State: APjAAAXIdqjBj8VveZYMgKTiIvmkaHWm6krbP+61atPzQQ1JWEKC5lq/
        ahnKIAjRP3WIfHAuFODIBk761hB2cHE=
X-Google-Smtp-Source: APXvYqxk2AlRgClckhCFwUULMfolQDnmdjek+86orczeS9RFCHcP7FM/8BdL2+89Kvr+7jc8Evi69Q==
X-Received: by 2002:a63:4c1f:: with SMTP id z31mr19713773pga.334.1559023047763;
        Mon, 27 May 2019 22:57:27 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id w1sm13950551pfg.51.2019.05.27.22.57.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 22:57:27 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [RFCv1 06/12] media: mtk-vcodec: move stateful ops into their own file
Date:   Tue, 28 May 2019 14:56:29 +0900
Message-Id: <20190528055635.12109-7-acourbot@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190528055635.12109-1-acourbot@chromium.org>
References: <20190528055635.12109-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

We are planning to add support for stateless formats to this driver.
Part of the driver will be shared between stateful and stateless
formats, but a few ops need to be specialized for both. Extract the
stateful part of the driver and move it into its own file, accessible
through ops that the common driver parts can call.

This patch only moves code around and introduces a set of abstractions ;
behavior or the driver should not be changed in any way.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
[acourbot: refactor, cleanup and split]
---
 drivers/media/platform/mtk-vcodec/Makefile    |   1 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 694 ++----------------
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |  19 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |   9 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      | 629 ++++++++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  41 ++
 6 files changed, 754 insertions(+), 639 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c

diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
index 37b94b555fa1..5dc588897d01 100644
--- a/drivers/media/platform/mtk-vcodec/Makefile
+++ b/drivers/media/platform/mtk-vcodec/Makefile
@@ -11,6 +11,7 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
 		vdec_drv_if.o \
 		vdec_vpu_if.o \
 		mtk_vcodec_dec.o \
+		mtk_vcodec_dec_stateful.o \
 		mtk_vcodec_dec_pm.o \
 
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 2fdf23ce8ac4..f36219486700 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -24,65 +24,17 @@
 #include "vdec_drv_if.h"
 #include "mtk_vcodec_dec_pm.h"
 
-#define OUT_FMT_IDX	0
-#define CAP_FMT_IDX	3
-
-#define MTK_VDEC_MIN_W	64U
-#define MTK_VDEC_MIN_H	64U
 #define DFT_CFG_WIDTH	MTK_VDEC_MIN_W
 #define DFT_CFG_HEIGHT	MTK_VDEC_MIN_H
 
-static const struct mtk_video_fmt mtk_video_formats[] = {
-	{
-		.fourcc = V4L2_PIX_FMT_H264,
-		.type = MTK_FMT_DEC,
-		.num_planes = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_VP8,
-		.type = MTK_FMT_DEC,
-		.num_planes = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_VP9,
-		.type = MTK_FMT_DEC,
-		.num_planes = 1,
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_MT21C,
-		.type = MTK_FMT_FRAME,
-		.num_planes = 2,
-	},
-};
-
-static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
-	{
-		.fourcc	= V4L2_PIX_FMT_H264,
-		.stepwise = {  MTK_VDEC_MIN_W, MTK_VDEC_MAX_W, 16,
-				MTK_VDEC_MIN_H, MTK_VDEC_MAX_H, 16 },
-	},
-	{
-		.fourcc	= V4L2_PIX_FMT_VP8,
-		.stepwise = {  MTK_VDEC_MIN_W, MTK_VDEC_MAX_W, 16,
-				MTK_VDEC_MIN_H, MTK_VDEC_MAX_H, 16 },
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_VP9,
-		.stepwise = {  MTK_VDEC_MIN_W, MTK_VDEC_MAX_W, 16,
-				MTK_VDEC_MIN_H, MTK_VDEC_MAX_H, 16 },
-	},
-};
-
-#define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
-#define NUM_FORMATS ARRAY_SIZE(mtk_video_formats)
-
-static const struct mtk_video_fmt *mtk_vdec_find_format(struct v4l2_format *f)
+static const struct mtk_video_fmt *mtk_vdec_find_format(struct v4l2_format *f,
+				   const struct mtk_vcodec_dec_pdata *dec_pdata)
 {
 	const struct mtk_video_fmt *fmt;
 	unsigned int k;
 
-	for (k = 0; k < NUM_FORMATS; k++) {
-		fmt = &mtk_video_formats[k];
+	for (k = 0; k < dec_pdata->num_formats; k++) {
+		fmt = &dec_pdata->vdec_formats[k];
 		if (fmt->fourcc == f->fmt.pix_mp.pixelformat)
 			return fmt;
 	}
@@ -99,390 +51,6 @@ static struct mtk_q_data *mtk_vdec_get_q_data(struct mtk_vcodec_ctx *ctx,
 	return &ctx->q_data[MTK_Q_DATA_DST];
 }
 
-/*
- * This function tries to clean all display buffers, the buffers will return
- * in display order.
- * Note the buffers returned from codec driver may still be in driver's
- * reference list.
- */
-static struct vb2_buffer *get_display_buffer(struct mtk_vcodec_ctx *ctx)
-{
-	struct vdec_fb *disp_frame_buffer = NULL;
-	struct mtk_video_dec_buf *dstbuf;
-
-	mtk_v4l2_debug(3, "[%d]", ctx->id);
-	if (vdec_if_get_param(ctx,
-			GET_PARAM_DISP_FRAME_BUFFER,
-			&disp_frame_buffer)) {
-		mtk_v4l2_err("[%d]Cannot get param : GET_PARAM_DISP_FRAME_BUFFER",
-			ctx->id);
-		return NULL;
-	}
-
-	if (disp_frame_buffer == NULL) {
-		mtk_v4l2_debug(3, "No display frame buffer");
-		return NULL;
-	}
-
-	dstbuf = container_of(disp_frame_buffer, struct mtk_video_dec_buf,
-				frame_buffer);
-	mutex_lock(&ctx->lock);
-	if (dstbuf->used) {
-		vb2_set_plane_payload(&dstbuf->vb.vb2_buf, 0,
-					ctx->picinfo.fb_sz[0]);
-		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
-			vb2_set_plane_payload(&dstbuf->vb.vb2_buf, 1,
-						ctx->picinfo.fb_sz[1]);
-
-		mtk_v4l2_debug(2,
-				"[%d]status=%x queue id=%d to done_list %d",
-				ctx->id, disp_frame_buffer->status,
-				dstbuf->vb.vb2_buf.index,
-				dstbuf->queued_in_vb2);
-
-		v4l2_m2m_buf_done(&dstbuf->vb, VB2_BUF_STATE_DONE);
-		ctx->decoded_frame_cnt++;
-	}
-	mutex_unlock(&ctx->lock);
-	return &dstbuf->vb.vb2_buf;
-}
-
-/*
- * This function tries to clean all capture buffers that are not used as
- * reference buffers by codec driver any more
- * In this case, we need re-queue buffer to vb2 buffer if user space
- * already returns this buffer to v4l2 or this buffer is just the output of
- * previous sps/pps/resolution change decode, or do nothing if user
- * space still owns this buffer
- */
-static struct vb2_buffer *get_free_buffer(struct mtk_vcodec_ctx *ctx)
-{
-	struct mtk_video_dec_buf *dstbuf;
-	struct vdec_fb *free_frame_buffer = NULL;
-
-	if (vdec_if_get_param(ctx,
-				GET_PARAM_FREE_FRAME_BUFFER,
-				&free_frame_buffer)) {
-		mtk_v4l2_err("[%d] Error!! Cannot get param", ctx->id);
-		return NULL;
-	}
-	if (free_frame_buffer == NULL) {
-		mtk_v4l2_debug(3, " No free frame buffer");
-		return NULL;
-	}
-
-	mtk_v4l2_debug(3, "[%d] tmp_frame_addr = 0x%p",
-			ctx->id, free_frame_buffer);
-
-	dstbuf = container_of(free_frame_buffer, struct mtk_video_dec_buf,
-				frame_buffer);
-
-	mutex_lock(&ctx->lock);
-	if (dstbuf->used) {
-		if ((dstbuf->queued_in_vb2) &&
-		    (dstbuf->queued_in_v4l2) &&
-		    (free_frame_buffer->status == FB_ST_FREE)) {
-			/*
-			 * After decode sps/pps or non-display buffer, we don't
-			 * need to return capture buffer to user space, but
-			 * just re-queue this capture buffer to vb2 queue.
-			 * This reduce overheads that dq/q unused capture
-			 * buffer. In this case, queued_in_vb2 = true.
-			 */
-			mtk_v4l2_debug(2,
-				"[%d]status=%x queue id=%d to rdy_queue %d",
-				ctx->id, free_frame_buffer->status,
-				dstbuf->vb.vb2_buf.index,
-				dstbuf->queued_in_vb2);
-			v4l2_m2m_buf_queue(ctx->m2m_ctx, &dstbuf->vb);
-		} else if ((dstbuf->queued_in_vb2 == false) &&
-			   (dstbuf->queued_in_v4l2 == true)) {
-			/*
-			 * If buffer in v4l2 driver but not in vb2 queue yet,
-			 * and we get this buffer from free_list, it means
-			 * that codec driver do not use this buffer as
-			 * reference buffer anymore. We should q buffer to vb2
-			 * queue, so later work thread could get this buffer
-			 * for decode. In this case, queued_in_vb2 = false
-			 * means this buffer is not from previous decode
-			 * output.
-			 */
-			mtk_v4l2_debug(2,
-					"[%d]status=%x queue id=%d to rdy_queue",
-					ctx->id, free_frame_buffer->status,
-					dstbuf->vb.vb2_buf.index);
-			v4l2_m2m_buf_queue(ctx->m2m_ctx, &dstbuf->vb);
-			dstbuf->queued_in_vb2 = true;
-		} else {
-			/*
-			 * Codec driver do not need to reference this capture
-			 * buffer and this buffer is not in v4l2 driver.
-			 * Then we don't need to do any thing, just add log when
-			 * we need to debug buffer flow.
-			 * When this buffer q from user space, it could
-			 * directly q to vb2 buffer
-			 */
-			mtk_v4l2_debug(3, "[%d]status=%x err queue id=%d %d %d",
-					ctx->id, free_frame_buffer->status,
-					dstbuf->vb.vb2_buf.index,
-					dstbuf->queued_in_vb2,
-					dstbuf->queued_in_v4l2);
-		}
-		dstbuf->used = false;
-	}
-	mutex_unlock(&ctx->lock);
-	return &dstbuf->vb.vb2_buf;
-}
-
-static void clean_display_buffer(struct mtk_vcodec_ctx *ctx)
-{
-	struct vb2_buffer *framptr;
-
-	do {
-		framptr = get_display_buffer(ctx);
-	} while (framptr);
-}
-
-static void clean_free_buffer(struct mtk_vcodec_ctx *ctx)
-{
-	struct vb2_buffer *framptr;
-
-	do {
-		framptr = get_free_buffer(ctx);
-	} while (framptr);
-}
-
-static void mtk_vdec_queue_res_chg_event(struct mtk_vcodec_ctx *ctx)
-{
-	static const struct v4l2_event ev_src_ch = {
-		.type = V4L2_EVENT_SOURCE_CHANGE,
-		.u.src_change.changes =
-		V4L2_EVENT_SRC_CH_RESOLUTION,
-	};
-
-	mtk_v4l2_debug(1, "[%d]", ctx->id);
-	v4l2_event_queue_fh(&ctx->fh, &ev_src_ch);
-}
-
-static void mtk_vdec_flush_decoder(struct mtk_vcodec_ctx *ctx)
-{
-	bool res_chg;
-	int ret = 0;
-
-	ret = vdec_if_decode(ctx, NULL, NULL, &res_chg);
-	if (ret)
-		mtk_v4l2_err("DecodeFinal failed, ret=%d", ret);
-
-	clean_display_buffer(ctx);
-	clean_free_buffer(ctx);
-}
-
-static void mtk_vdec_update_fmt(struct mtk_vcodec_ctx *ctx,
-				unsigned int pixelformat)
-{
-	const struct mtk_video_fmt *fmt;
-	struct mtk_q_data *dst_q_data;
-	unsigned int k;
-
-	dst_q_data = &ctx->q_data[MTK_Q_DATA_DST];
-	for (k = 0; k < NUM_FORMATS; k++) {
-		fmt = &mtk_video_formats[k];
-		if (fmt->fourcc == pixelformat) {
-			mtk_v4l2_debug(1, "Update cap fourcc(%d -> %d)",
-				dst_q_data->fmt.fourcc, pixelformat);
-			dst_q_data->fmt = fmt;
-			return;
-		}
-	}
-
-	mtk_v4l2_err("Cannot get fourcc(%d), using init value", pixelformat);
-}
-
-static int mtk_vdec_pic_info_update(struct mtk_vcodec_ctx *ctx)
-{
-	unsigned int dpbsize = 0;
-	int ret;
-
-	if (vdec_if_get_param(ctx,
-				GET_PARAM_PIC_INFO,
-				&ctx->last_decoded_picinfo)) {
-		mtk_v4l2_err("[%d]Error!! Cannot get param : GET_PARAM_PICTURE_INFO ERR",
-				ctx->id);
-		return -EINVAL;
-	}
-
-	if (ctx->last_decoded_picinfo.pic_w == 0 ||
-		ctx->last_decoded_picinfo.pic_h == 0 ||
-		ctx->last_decoded_picinfo.buf_w == 0 ||
-		ctx->last_decoded_picinfo.buf_h == 0) {
-		mtk_v4l2_err("Cannot get correct pic info");
-		return -EINVAL;
-	}
-
-	if (ctx->last_decoded_picinfo.cap_fourcc != ctx->picinfo.cap_fourcc &&
-		ctx->picinfo.cap_fourcc != 0)
-		mtk_vdec_update_fmt(ctx, ctx->picinfo.cap_fourcc);
-
-	if ((ctx->last_decoded_picinfo.pic_w == ctx->picinfo.pic_w) ||
-	    (ctx->last_decoded_picinfo.pic_h == ctx->picinfo.pic_h))
-		return 0;
-
-	mtk_v4l2_debug(1,
-			"[%d]-> new(%d,%d), old(%d,%d), real(%d,%d)",
-			ctx->id, ctx->last_decoded_picinfo.pic_w,
-			ctx->last_decoded_picinfo.pic_h,
-			ctx->picinfo.pic_w, ctx->picinfo.pic_h,
-			ctx->last_decoded_picinfo.buf_w,
-			ctx->last_decoded_picinfo.buf_h);
-
-	ret = vdec_if_get_param(ctx, GET_PARAM_DPB_SIZE, &dpbsize);
-	if (dpbsize == 0)
-		mtk_v4l2_err("Incorrect dpb size, ret=%d", ret);
-
-	ctx->dpb_size = dpbsize;
-
-	return ret;
-}
-
-static void mtk_vdec_worker(struct work_struct *work)
-{
-	struct mtk_vcodec_ctx *ctx = container_of(work, struct mtk_vcodec_ctx,
-				decode_work);
-	struct mtk_vcodec_dev *dev = ctx->dev;
-	struct vb2_v4l2_buffer *src_buf, *dst_buf;
-	struct mtk_vcodec_mem buf;
-	struct vdec_fb *pfb;
-	bool res_chg = false;
-	int ret;
-	struct mtk_video_dec_buf *dst_buf_info, *src_buf_info;
-
-	src_buf = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
-	if (src_buf == NULL) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
-		mtk_v4l2_debug(1, "[%d] src_buf empty!!", ctx->id);
-		return;
-	}
-
-	dst_buf = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
-	if (dst_buf == NULL) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
-		mtk_v4l2_debug(1, "[%d] dst_buf empty!!", ctx->id);
-		return;
-	}
-
-	src_buf_info = container_of(src_buf, struct mtk_video_dec_buf, vb);
-	dst_buf_info = container_of(dst_buf, struct mtk_video_dec_buf, vb);
-
-	pfb = &dst_buf_info->frame_buffer;
-	pfb->base_y.va = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
-	pfb->base_y.dma_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
-	pfb->base_y.size = ctx->picinfo.fb_sz[0];
-
-	pfb->base_c.va = vb2_plane_vaddr(&dst_buf->vb2_buf, 1);
-	pfb->base_c.dma_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 1);
-	pfb->base_c.size = ctx->picinfo.fb_sz[1];
-	pfb->status = 0;
-	mtk_v4l2_debug(3, "===>[%d] vdec_if_decode() ===>", ctx->id);
-
-	mtk_v4l2_debug(3,
-			"id=%d Framebuf  pfb=%p VA=%p Y_DMA=%pad C_DMA=%pad Size=%zx",
-			dst_buf->vb2_buf.index, pfb,
-			pfb->base_y.va, &pfb->base_y.dma_addr,
-			&pfb->base_c.dma_addr, pfb->base_y.size);
-
-	if (src_buf_info->lastframe) {
-		mtk_v4l2_debug(1, "Got empty flush input buffer.");
-		src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
-
-		/* update dst buf status */
-		dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
-		mutex_lock(&ctx->lock);
-		dst_buf_info->used = false;
-		mutex_unlock(&ctx->lock);
-
-		vdec_if_decode(ctx, NULL, NULL, &res_chg);
-		clean_display_buffer(ctx);
-		vb2_set_plane_payload(&dst_buf_info->vb.vb2_buf, 0, 0);
-		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
-			vb2_set_plane_payload(&dst_buf_info->vb.vb2_buf, 1, 0);
-		dst_buf->flags |= V4L2_BUF_FLAG_LAST;
-		v4l2_m2m_buf_done(&dst_buf_info->vb, VB2_BUF_STATE_DONE);
-		clean_free_buffer(ctx);
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
-		return;
-	}
-	buf.va = vb2_plane_vaddr(&src_buf->vb2_buf, 0);
-	buf.dma_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
-	buf.size = (size_t)src_buf->vb2_buf.planes[0].bytesused;
-	if (!buf.va) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
-		mtk_v4l2_err("[%d] id=%d src_addr is NULL!!",
-				ctx->id, src_buf->vb2_buf.index);
-		return;
-	}
-	mtk_v4l2_debug(3, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
-			ctx->id, buf.va, &buf.dma_addr, buf.size, src_buf);
-	dst_buf_info->vb.vb2_buf.timestamp
-			= src_buf_info->vb.vb2_buf.timestamp;
-	dst_buf_info->vb.timecode
-			= src_buf_info->vb.timecode;
-	mutex_lock(&ctx->lock);
-	dst_buf_info->used = true;
-	mutex_unlock(&ctx->lock);
-	src_buf_info->used = true;
-
-	ret = vdec_if_decode(ctx, &buf, pfb, &res_chg);
-
-	if (ret) {
-		mtk_v4l2_err(
-			" <===[%d], src_buf[%d] sz=0x%zx pts=%llu dst_buf[%d] vdec_if_decode() ret=%d res_chg=%d===>",
-			ctx->id,
-			src_buf->vb2_buf.index,
-			buf.size,
-			src_buf_info->vb.vb2_buf.timestamp,
-			dst_buf->vb2_buf.index,
-			ret, res_chg);
-		src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
-		if (ret == -EIO) {
-			mutex_lock(&ctx->lock);
-			src_buf_info->error = true;
-			mutex_unlock(&ctx->lock);
-		}
-		v4l2_m2m_buf_done(&src_buf_info->vb, VB2_BUF_STATE_ERROR);
-	} else if (res_chg == false) {
-		/*
-		 * we only return src buffer with VB2_BUF_STATE_DONE
-		 * when decode success without resolution change
-		 */
-		src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
-		v4l2_m2m_buf_done(&src_buf_info->vb, VB2_BUF_STATE_DONE);
-	}
-
-	dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
-	clean_display_buffer(ctx);
-	clean_free_buffer(ctx);
-
-	if (!ret && res_chg) {
-		mtk_vdec_pic_info_update(ctx);
-		/*
-		 * On encountering a resolution change in the stream.
-		 * The driver must first process and decode all
-		 * remaining buffers from before the resolution change
-		 * point, so call flush decode here
-		 */
-		mtk_vdec_flush_decoder(ctx);
-		/*
-		 * After all buffers containing decoded frames from
-		 * before the resolution change point ready to be
-		 * dequeued on the CAPTURE queue, the driver sends a
-		 * V4L2_EVENT_SOURCE_CHANGE event for source change
-		 * type V4L2_EVENT_SRC_CH_RESOLUTION
-		 */
-		mtk_vdec_queue_res_chg_event(ctx);
-	}
-	v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
-}
-
 static int vidioc_try_decoder_cmd(struct file *file, void *priv,
 				struct v4l2_decoder_cmd *cmd)
 {
@@ -562,10 +130,12 @@ void mtk_vcodec_dec_set_default_params(struct mtk_vcodec_ctx *ctx)
 {
 	struct mtk_q_data *q_data;
 
+	ctx->dev->vdec_pdata->init_vdec_params(ctx);
+
 	ctx->m2m_ctx->q_lock = &ctx->dev->dev_mutex;
 	ctx->fh.m2m_ctx = ctx->m2m_ctx;
 	ctx->fh.ctrl_handler = &ctx->ctrl_hdl;
-	INIT_WORK(&ctx->decode_work, mtk_vdec_worker);
+	INIT_WORK(&ctx->decode_work, ctx->dev->vdec_pdata->worker);
 	ctx->colorspace = V4L2_COLORSPACE_REC709;
 	ctx->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
 	ctx->quantization = V4L2_QUANTIZATION_DEFAULT;
@@ -575,7 +145,7 @@ void mtk_vcodec_dec_set_default_params(struct mtk_vcodec_ctx *ctx)
 	memset(q_data, 0, sizeof(struct mtk_q_data));
 	q_data->visible_width = DFT_CFG_WIDTH;
 	q_data->visible_height = DFT_CFG_HEIGHT;
-	q_data->fmt = &mtk_video_formats[OUT_FMT_IDX];
+	q_data->fmt = ctx->dev->vdec_pdata->default_out_fmt;
 	q_data->field = V4L2_FIELD_NONE;
 
 	q_data->sizeimage[0] = DFT_CFG_WIDTH * DFT_CFG_HEIGHT;
@@ -587,7 +157,7 @@ void mtk_vcodec_dec_set_default_params(struct mtk_vcodec_ctx *ctx)
 	q_data->visible_height = DFT_CFG_HEIGHT;
 	q_data->coded_width = DFT_CFG_WIDTH;
 	q_data->coded_height = DFT_CFG_HEIGHT;
-	q_data->fmt = &mtk_video_formats[CAP_FMT_IDX];
+	q_data->fmt = ctx->dev->vdec_pdata->default_cap_fmt;
 	q_data->field = V4L2_FIELD_NONE;
 
 	v4l_bound_align_image(&q_data->coded_width,
@@ -729,11 +299,14 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
 	const struct mtk_video_fmt *fmt;
+	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
 
-	fmt = mtk_vdec_find_format(f);
+	fmt = mtk_vdec_find_format(f, dec_pdata);
 	if (!fmt) {
-		f->fmt.pix.pixelformat = mtk_video_formats[CAP_FMT_IDX].fourcc;
-		fmt = mtk_vdec_find_format(f);
+		f->fmt.pix.pixelformat =
+			ctx->q_data[MTK_Q_DATA_DST].fmt->fourcc;
+		fmt = mtk_vdec_find_format(f, dec_pdata);
 	}
 
 	return vidioc_try_fmt(f, fmt);
@@ -744,11 +317,14 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 {
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
 	const struct mtk_video_fmt *fmt;
+	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
 
-	fmt = mtk_vdec_find_format(f);
+	fmt = mtk_vdec_find_format(f, dec_pdata);
 	if (!fmt) {
-		f->fmt.pix.pixelformat = mtk_video_formats[OUT_FMT_IDX].fourcc;
-		fmt = mtk_vdec_find_format(f);
+		f->fmt.pix.pixelformat =
+			ctx->q_data[MTK_Q_DATA_SRC].fmt->fourcc;
+		fmt = mtk_vdec_find_format(f, dec_pdata);
 	}
 
 	if (pix_fmt_mp->plane_fmt[0].sizeimage == 0) {
@@ -838,6 +414,7 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 	struct mtk_q_data *q_data;
 	int ret = 0;
 	const struct mtk_video_fmt *fmt;
+	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
 
 	mtk_v4l2_debug(3, "[%d]", ctx->id);
 
@@ -858,16 +435,16 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 		ret = -EBUSY;
 	}
 
-	fmt = mtk_vdec_find_format(f);
+	fmt = mtk_vdec_find_format(f, dec_pdata);
 	if (fmt == NULL) {
 		if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 			f->fmt.pix.pixelformat =
-				mtk_video_formats[OUT_FMT_IDX].fourcc;
-			fmt = mtk_vdec_find_format(f);
+				dec_pdata->default_out_fmt->fourcc;
+			fmt = mtk_vdec_find_format(f, dec_pdata);
 		} else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 			f->fmt.pix.pixelformat =
-				mtk_video_formats[CAP_FMT_IDX].fourcc;
-			fmt = mtk_vdec_find_format(f);
+				dec_pdata->default_cap_fmt->fourcc;
+			fmt = mtk_vdec_find_format(f, dec_pdata);
 		}
 	}
 
@@ -902,16 +479,17 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 {
 	int i = 0;
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
 
 	if (fsize->index != 0)
 		return -EINVAL;
 
-	for (i = 0; i < NUM_SUPPORTED_FRAMESIZE; ++i) {
-		if (fsize->pixel_format != mtk_vdec_framesizes[i].fourcc)
+	for (i = 0; i < dec_pdata->num_framesizes; ++i) {
+		if (fsize->pixel_format != dec_pdata->vdec_framesizes[i].fourcc)
 			continue;
 
 		fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
-		fsize->stepwise = mtk_vdec_framesizes[i].stepwise;
+		fsize->stepwise = dec_pdata->vdec_framesizes[i].stepwise;
 		if (!(ctx->dev->dec_capability &
 				VCODEC_CAPABILITY_4K_DISABLED)) {
 			mtk_v4l2_debug(3, "4K is enabled");
@@ -934,16 +512,20 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 	return -EINVAL;
 }
 
-static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, bool output_queue)
+static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, void *priv,
+				bool output_queue)
 {
+	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+	const struct mtk_vcodec_dec_pdata *dec_pdata = ctx->dev->vdec_pdata;
 	const struct mtk_video_fmt *fmt;
 	int i, j = 0;
 
-	for (i = 0; i < NUM_FORMATS; i++) {
-		if (output_queue && (mtk_video_formats[i].type != MTK_FMT_DEC))
+	for (i = 0; i < dec_pdata->num_formats; i++) {
+		if (output_queue &&
+			(dec_pdata->vdec_formats[i].type != MTK_FMT_DEC))
 			continue;
 		if (!output_queue &&
-			(mtk_video_formats[i].type != MTK_FMT_FRAME))
+			(dec_pdata->vdec_formats[i].type != MTK_FMT_FRAME))
 			continue;
 
 		if (j == f->index)
@@ -951,25 +533,25 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, bool output_queue)
 		++j;
 	}
 
-	if (i == NUM_FORMATS)
+	if (i == dec_pdata->num_formats)
 		return -EINVAL;
 
-	fmt = &mtk_video_formats[i];
+	fmt = &dec_pdata->vdec_formats[i];
 	f->pixelformat = fmt->fourcc;
 
 	return 0;
 }
 
-static int vidioc_vdec_enum_fmt_vid_cap_mplane(struct file *file, void *pirv,
+static int vidioc_vdec_enum_fmt_vid_cap_mplane(struct file *file, void *priv,
 					       struct v4l2_fmtdesc *f)
 {
-	return vidioc_enum_fmt(f, false);
+	return vidioc_enum_fmt(f, priv, false);
 }
 
 static int vidioc_vdec_enum_fmt_vid_out_mplane(struct file *file, void *priv,
 					       struct v4l2_fmtdesc *f)
 {
-	return vidioc_enum_fmt(f, true);
+	return vidioc_enum_fmt(f, priv, true);
 }
 
 static int vidioc_vdec_g_fmt(struct file *file, void *priv,
@@ -1060,7 +642,7 @@ static int vidioc_vdec_g_fmt(struct file *file, void *priv,
 	return 0;
 }
 
-static int vb2ops_vdec_queue_setup(struct vb2_queue *vq,
+int vb2ops_vdec_queue_setup(struct vb2_queue *vq,
 				unsigned int *nbuffers,
 				unsigned int *nplanes,
 				unsigned int sizes[],
@@ -1084,7 +666,7 @@ static int vb2ops_vdec_queue_setup(struct vb2_queue *vq,
 		}
 	} else {
 		if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
-			*nplanes = 2;
+			*nplanes = q_data->fmt->num_planes;
 		else
 			*nplanes = 1;
 
@@ -1100,7 +682,7 @@ static int vb2ops_vdec_queue_setup(struct vb2_queue *vq,
 	return 0;
 }
 
-static int vb2ops_vdec_buf_prepare(struct vb2_buffer *vb)
+int vb2ops_vdec_buf_prepare(struct vb2_buffer *vb)
 {
 	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct mtk_q_data *q_data;
@@ -1122,127 +704,7 @@ static int vb2ops_vdec_buf_prepare(struct vb2_buffer *vb)
 	return 0;
 }
 
-static void vb2ops_vdec_buf_queue(struct vb2_buffer *vb)
-{
-	struct vb2_v4l2_buffer *src_buf;
-	struct mtk_vcodec_mem src_mem;
-	bool res_chg = false;
-	int ret = 0;
-	unsigned int dpbsize = 1, i = 0;
-	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
-	struct vb2_v4l2_buffer *vb2_v4l2 = NULL;
-	struct mtk_video_dec_buf *buf = NULL;
-	struct mtk_q_data *dst_q_data;
-
-	mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p",
-			ctx->id, vb->vb2_queue->type,
-			vb->index, vb);
-	/*
-	 * check if this buffer is ready to be used after decode
-	 */
-	if (vb->vb2_queue->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
-		vb2_v4l2 = to_vb2_v4l2_buffer(vb);
-		buf = container_of(vb2_v4l2, struct mtk_video_dec_buf, vb);
-		mutex_lock(&ctx->lock);
-		if (buf->used == false) {
-			v4l2_m2m_buf_queue(ctx->m2m_ctx, vb2_v4l2);
-			buf->queued_in_vb2 = true;
-			buf->queued_in_v4l2 = true;
-		} else {
-			buf->queued_in_vb2 = false;
-			buf->queued_in_v4l2 = true;
-		}
-		mutex_unlock(&ctx->lock);
-		return;
-	}
-
-	v4l2_m2m_buf_queue(ctx->m2m_ctx, to_vb2_v4l2_buffer(vb));
-
-	if (ctx->state != MTK_STATE_INIT) {
-		mtk_v4l2_debug(3, "[%d] already init driver %d",
-				ctx->id, ctx->state);
-		return;
-	}
-
-	src_buf = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
-	if (!src_buf) {
-		mtk_v4l2_err("No src buffer");
-		return;
-	}
-	buf = container_of(src_buf, struct mtk_video_dec_buf, vb);
-	if (buf->lastframe) {
-		/* This shouldn't happen. Just in case. */
-		mtk_v4l2_err("Invalid flush buffer.");
-		v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
-		return;
-	}
-
-	src_mem.va = vb2_plane_vaddr(&src_buf->vb2_buf, 0);
-	src_mem.dma_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
-	src_mem.size = (size_t)src_buf->vb2_buf.planes[0].bytesused;
-	mtk_v4l2_debug(2,
-			"[%d] buf id=%d va=%p dma=%pad size=%zx",
-			ctx->id, src_buf->vb2_buf.index,
-			src_mem.va, &src_mem.dma_addr,
-			src_mem.size);
-
-	ret = vdec_if_decode(ctx, &src_mem, NULL, &res_chg);
-	if (ret || !res_chg) {
-		/*
-		 * fb == NULL means to parse SPS/PPS header or
-		 * resolution info in src_mem. Decode can fail
-		 * if there is no SPS header or picture info
-		 * in bs
-		 */
-
-		src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
-		if (ret == -EIO) {
-			mtk_v4l2_err("[%d] Unrecoverable error in vdec_if_decode.",
-					ctx->id);
-			ctx->state = MTK_STATE_ABORT;
-			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
-		} else {
-			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
-		}
-		mtk_v4l2_debug(ret ? 0 : 1,
-			       "[%d] vdec_if_decode() src_buf=%d, size=%zu, fail=%d, res_chg=%d",
-			       ctx->id, src_buf->vb2_buf.index,
-			       src_mem.size, ret, res_chg);
-		return;
-	}
-
-	if (vdec_if_get_param(ctx, GET_PARAM_PIC_INFO, &ctx->picinfo)) {
-		mtk_v4l2_err("[%d]Error!! Cannot get param : GET_PARAM_PICTURE_INFO ERR",
-				ctx->id);
-		return;
-	}
-
-	ctx->last_decoded_picinfo = ctx->picinfo;
-	dst_q_data = &ctx->q_data[MTK_Q_DATA_DST];
-	for (i = 0; i < dst_q_data->fmt->num_planes; i++) {
-		dst_q_data->sizeimage[i] = ctx->picinfo.fb_sz[i];
-		dst_q_data->bytesperline[i] = ctx->picinfo.buf_w;
-	}
-
-	mtk_v4l2_debug(2, "[%d] vdec_if_init() OK wxh=%dx%d pic wxh=%dx%d sz[0]=0x%x sz[1]=0x%x",
-			ctx->id,
-			ctx->picinfo.buf_w, ctx->picinfo.buf_h,
-			ctx->picinfo.pic_w, ctx->picinfo.pic_h,
-			dst_q_data->sizeimage[0],
-			dst_q_data->sizeimage[1]);
-
-	ret = vdec_if_get_param(ctx, GET_PARAM_DPB_SIZE, &dpbsize);
-	if (dpbsize == 0)
-		mtk_v4l2_err("[%d] GET_PARAM_DPB_SIZE fail=%d", ctx->id, ret);
-
-	ctx->dpb_size = dpbsize;
-	ctx->state = MTK_STATE_HEADER;
-	mtk_v4l2_debug(1, "[%d] dpbsize=%d", ctx->id, ctx->dpb_size);
-
-	mtk_vdec_queue_res_chg_event(ctx);
-}
-
-static void vb2ops_vdec_buf_finish(struct vb2_buffer *vb)
+void vb2ops_vdec_buf_finish(struct vb2_buffer *vb)
 {
 	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vb2_v4l2;
@@ -1265,7 +727,7 @@ static void vb2ops_vdec_buf_finish(struct vb2_buffer *vb)
 	}
 }
 
-static int vb2ops_vdec_buf_init(struct vb2_buffer *vb)
+int vb2ops_vdec_buf_init(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vb2_v4l2 = container_of(vb,
 					struct vb2_v4l2_buffer, vb2_buf);
@@ -1282,7 +744,7 @@ static int vb2ops_vdec_buf_init(struct vb2_buffer *vb)
 	return 0;
 }
 
-static int vb2ops_vdec_start_streaming(struct vb2_queue *q, unsigned int count)
+int vb2ops_vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(q);
 
@@ -1292,10 +754,11 @@ static int vb2ops_vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	return 0;
 }
 
-static void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
+void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 {
 	struct vb2_v4l2_buffer *src_buf = NULL, *dst_buf = NULL;
 	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(q);
+	int ret;
 
 	mtk_v4l2_debug(3, "[%d] (%d) state=(%x) ctx->decoded_frame_cnt=%d",
 			ctx->id, q->type, ctx->state, ctx->decoded_frame_cnt);
@@ -1329,7 +792,9 @@ static void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 				ctx->last_decoded_picinfo.buf_w,
 				ctx->last_decoded_picinfo.buf_h);
 
-		mtk_vdec_flush_decoder(ctx);
+		ret = ctx->dev->vdec_pdata->flush_decoder(ctx);
+		if (ret)
+			mtk_v4l2_err("DecodeFinal failed, ret=%d", ret);
 	}
 	ctx->state = MTK_STATE_FLUSH;
 
@@ -1376,7 +841,7 @@ static void m2mops_vdec_job_abort(void *priv)
 	ctx->state = MTK_STATE_ABORT;
 }
 
-static int mtk_vdec_g_v_ctrl(struct v4l2_ctrl *ctrl)
+int mtk_vdec_g_v_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct mtk_vcodec_ctx *ctx = ctrl_to_ctx(ctrl);
 	int ret = 0;
@@ -1396,55 +861,12 @@ static int mtk_vdec_g_v_ctrl(struct v4l2_ctrl *ctrl)
 	return ret;
 }
 
-static const struct v4l2_ctrl_ops mtk_vcodec_dec_ctrl_ops = {
-	.g_volatile_ctrl = mtk_vdec_g_v_ctrl,
-};
-
-int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_ctx *ctx)
-{
-	struct v4l2_ctrl *ctrl;
-
-	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, 1);
-
-	ctrl = v4l2_ctrl_new_std(&ctx->ctrl_hdl,
-				&mtk_vcodec_dec_ctrl_ops,
-				V4L2_CID_MIN_BUFFERS_FOR_CAPTURE,
-				0, 32, 1, 1);
-	ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
-	v4l2_ctrl_new_std_menu(&ctx->ctrl_hdl,
-				&mtk_vcodec_dec_ctrl_ops,
-				V4L2_CID_MPEG_VIDEO_VP9_PROFILE,
-				V4L2_MPEG_VIDEO_VP9_PROFILE_0,
-				0, V4L2_MPEG_VIDEO_VP9_PROFILE_0);
-
-	if (ctx->ctrl_hdl.error) {
-		mtk_v4l2_err("Adding control failed %d",
-				ctx->ctrl_hdl.error);
-		return ctx->ctrl_hdl.error;
-	}
-
-	v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
-	return 0;
-}
-
 const struct v4l2_m2m_ops mtk_vdec_m2m_ops = {
 	.device_run	= m2mops_vdec_device_run,
 	.job_ready	= m2mops_vdec_job_ready,
 	.job_abort	= m2mops_vdec_job_abort,
 };
 
-static const struct vb2_ops mtk_vdec_vb2_ops = {
-	.queue_setup	= vb2ops_vdec_queue_setup,
-	.buf_prepare	= vb2ops_vdec_buf_prepare,
-	.buf_queue	= vb2ops_vdec_buf_queue,
-	.wait_prepare	= vb2_ops_wait_prepare,
-	.wait_finish	= vb2_ops_wait_finish,
-	.buf_init	= vb2ops_vdec_buf_init,
-	.buf_finish	= vb2ops_vdec_buf_finish,
-	.start_streaming	= vb2ops_vdec_start_streaming,
-	.stop_streaming	= vb2ops_vdec_stop_streaming,
-};
-
 const struct v4l2_ioctl_ops mtk_vdec_ioctl_ops = {
 	.vidioc_streamon	= v4l2_m2m_ioctl_streamon,
 	.vidioc_streamoff	= v4l2_m2m_ioctl_streamoff,
@@ -1491,7 +913,7 @@ int mtk_vcodec_dec_queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->io_modes	= VB2_DMABUF | VB2_MMAP;
 	src_vq->drv_priv	= ctx;
 	src_vq->buf_struct_size = sizeof(struct mtk_video_dec_buf);
-	src_vq->ops		= &mtk_vdec_vb2_ops;
+	src_vq->ops		= ctx->dev->vdec_pdata->vdec_vb2_ops;
 	src_vq->mem_ops		= &vb2_dma_contig_memops;
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	src_vq->lock		= &ctx->dev->dev_mutex;
@@ -1506,7 +928,7 @@ int mtk_vcodec_dec_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->io_modes	= VB2_DMABUF | VB2_MMAP;
 	dst_vq->drv_priv	= ctx;
 	dst_vq->buf_struct_size = sizeof(struct mtk_video_dec_buf);
-	dst_vq->ops		= &mtk_vdec_vb2_ops;
+	dst_vq->ops		= ctx->dev->vdec_pdata->vdec_vb2_ops;
 	dst_vq->mem_ops		= &vb2_dma_contig_memops;
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock		= &ctx->dev->dev_mutex;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
index e4984edec4f8..f9f5a7fa0bb1 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
@@ -24,6 +24,8 @@
 #define VCODEC_DEC_4K_CODED_HEIGHT	2304U
 #define MTK_VDEC_MAX_W	2048U
 #define MTK_VDEC_MAX_H	1088U
+#define MTK_VDEC_MIN_W	64U
+#define MTK_VDEC_MIN_H	64U
 
 #define MTK_VDEC_IRQ_STATUS_DEC_SUCCESS        0x10000
 
@@ -82,7 +84,22 @@ int mtk_vcodec_dec_queue_init(void *priv, struct vb2_queue *src_vq,
 			   struct vb2_queue *dst_vq);
 void mtk_vcodec_dec_set_default_params(struct mtk_vcodec_ctx *ctx);
 void mtk_vcodec_dec_release(struct mtk_vcodec_ctx *ctx);
-int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_ctx *ctx);
+
+int mtk_vdec_g_v_ctrl(struct v4l2_ctrl *ctrl);
+
+/*
+ * VB2 ops
+ */
+int vb2ops_vdec_queue_setup(struct vb2_queue *vq,
+				unsigned int *nbuffers,
+				unsigned int *nplanes,
+				unsigned int sizes[],
+				struct device *alloc_devs[]);
+int vb2ops_vdec_buf_prepare(struct vb2_buffer *vb);
+void vb2ops_vdec_buf_finish(struct vb2_buffer *vb);
+int vb2ops_vdec_buf_init(struct vb2_buffer *vb);
+int vb2ops_vdec_start_streaming(struct vb2_queue *q, unsigned int count);
+void vb2ops_vdec_stop_streaming(struct vb2_queue *q);
 
 
 #endif /* _MTK_VCODEC_DEC_H_ */
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 4334b7394861..5a31917da18c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -130,7 +130,7 @@ static int fops_vcodec_open(struct file *file)
 	mutex_init(&ctx->lock);
 
 	ctx->type = MTK_INST_DECODER;
-	ret = mtk_vcodec_dec_ctrls_setup(ctx);
+	ret = dev->vdec_pdata->ctrls_setup(ctx);
 	if (ret) {
 		mtk_v4l2_err("Failed to setup mt vcodec controls");
 		goto err_ctrls_setup;
@@ -369,8 +369,13 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	return ret;
 }
 
+extern const struct mtk_vcodec_dec_pdata mtk_frame_8173_pdata;
+
 static const struct of_device_id mtk_vcodec_match[] = {
-	{.compatible = "mediatek,mt8173-vcodec-dec",},
+	{
+		.compatible = "mediatek,mt8173-vcodec-dec",
+		.data = &mtk_frame_8173_pdata,
+	},
 	{},
 };
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
new file mode 100644
index 000000000000..2022b7dfc2a6
--- /dev/null
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
@@ -0,0 +1,629 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <media/v4l2-event.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "mtk_vcodec_drv.h"
+#include "mtk_vcodec_dec.h"
+#include "mtk_vcodec_intr.h"
+#include "mtk_vcodec_util.h"
+#include "vdec_drv_if.h"
+#include "mtk_vcodec_dec_pm.h"
+
+static const struct mtk_video_fmt mtk_video_formats[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_H264,
+		.type = MTK_FMT_DEC,
+		.num_planes = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_VP8,
+		.type = MTK_FMT_DEC,
+		.num_planes = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_VP9,
+		.type = MTK_FMT_DEC,
+		.num_planes = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_MT21C,
+		.type = MTK_FMT_FRAME,
+		.num_planes = 2,
+	},
+};
+
+#define NUM_FORMATS ARRAY_SIZE(mtk_video_formats)
+#define DEFAULT_OUT_FMT_IDX	0
+#define DEFAULT_CAP_FMT_IDX	3
+
+static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
+	{
+		.fourcc	= V4L2_PIX_FMT_H264,
+		.stepwise = {  MTK_VDEC_MIN_W, MTK_VDEC_MAX_W, 16,
+				MTK_VDEC_MIN_H, MTK_VDEC_MAX_H, 16 },
+	},
+	{
+		.fourcc	= V4L2_PIX_FMT_VP8,
+		.stepwise = {  MTK_VDEC_MIN_W, MTK_VDEC_MAX_W, 16,
+				MTK_VDEC_MIN_H, MTK_VDEC_MAX_H, 16 },
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_VP9,
+		.stepwise = {  MTK_VDEC_MIN_W, MTK_VDEC_MAX_W, 16,
+				MTK_VDEC_MIN_H, MTK_VDEC_MAX_H, 16 },
+	},
+};
+
+#define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
+
+/*
+ * This function tries to clean all display buffers, the buffers will return
+ * in display order.
+ * Note the buffers returned from codec driver may still be in driver's
+ * reference list.
+ */
+static struct vb2_buffer *get_display_buffer(struct mtk_vcodec_ctx *ctx)
+{
+	struct vdec_fb *disp_frame_buffer = NULL;
+	struct mtk_video_dec_buf *dstbuf;
+
+	mtk_v4l2_debug(3, "[%d]", ctx->id);
+	if (vdec_if_get_param(ctx,
+			GET_PARAM_DISP_FRAME_BUFFER,
+			&disp_frame_buffer)) {
+		mtk_v4l2_err("[%d]Cannot get param : GET_PARAM_DISP_FRAME_BUFFER",
+			ctx->id);
+		return NULL;
+	}
+
+	if (disp_frame_buffer == NULL) {
+		mtk_v4l2_debug(3, "No display frame buffer");
+		return NULL;
+	}
+
+	dstbuf = container_of(disp_frame_buffer, struct mtk_video_dec_buf,
+				frame_buffer);
+	mutex_lock(&ctx->lock);
+	if (dstbuf->used) {
+		vb2_set_plane_payload(&dstbuf->vb.vb2_buf, 0,
+					ctx->picinfo.fb_sz[0]);
+		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
+			vb2_set_plane_payload(&dstbuf->vb.vb2_buf, 1,
+						ctx->picinfo.fb_sz[1]);
+
+		mtk_v4l2_debug(2,
+				"[%d]status=%x queue id=%d to done_list %d",
+				ctx->id, disp_frame_buffer->status,
+				dstbuf->vb.vb2_buf.index,
+				dstbuf->queued_in_vb2);
+
+		v4l2_m2m_buf_done(&dstbuf->vb, VB2_BUF_STATE_DONE);
+		ctx->decoded_frame_cnt++;
+	}
+	mutex_unlock(&ctx->lock);
+	return &dstbuf->vb.vb2_buf;
+}
+
+/*
+ * This function tries to clean all capture buffers that are not used as
+ * reference buffers by codec driver any more
+ * In this case, we need re-queue buffer to vb2 buffer if user space
+ * already returns this buffer to v4l2 or this buffer is just the output of
+ * previous sps/pps/resolution change decode, or do nothing if user
+ * space still owns this buffer
+ */
+static struct vb2_buffer *get_free_buffer(struct mtk_vcodec_ctx *ctx)
+{
+	struct mtk_video_dec_buf *dstbuf;
+	struct vdec_fb *free_frame_buffer = NULL;
+
+	if (vdec_if_get_param(ctx,
+				GET_PARAM_FREE_FRAME_BUFFER,
+				&free_frame_buffer)) {
+		mtk_v4l2_err("[%d] Error!! Cannot get param", ctx->id);
+		return NULL;
+	}
+	if (free_frame_buffer == NULL) {
+		mtk_v4l2_debug(3, " No free frame buffer");
+		return NULL;
+	}
+
+	mtk_v4l2_debug(3, "[%d] tmp_frame_addr = 0x%p",
+			ctx->id, free_frame_buffer);
+
+	dstbuf = container_of(free_frame_buffer, struct mtk_video_dec_buf,
+				frame_buffer);
+
+	mutex_lock(&ctx->lock);
+	if (dstbuf->used) {
+		if ((dstbuf->queued_in_vb2) &&
+		    (dstbuf->queued_in_v4l2) &&
+		    (free_frame_buffer->status == FB_ST_FREE)) {
+			/*
+			 * After decode sps/pps or non-display buffer, we don't
+			 * need to return capture buffer to user space, but
+			 * just re-queue this capture buffer to vb2 queue.
+			 * This reduce overheads that dq/q unused capture
+			 * buffer. In this case, queued_in_vb2 = true.
+			 */
+			mtk_v4l2_debug(2,
+				"[%d]status=%x queue id=%d to rdy_queue %d",
+				ctx->id, free_frame_buffer->status,
+				dstbuf->vb.vb2_buf.index,
+				dstbuf->queued_in_vb2);
+			v4l2_m2m_buf_queue(ctx->m2m_ctx, &dstbuf->vb);
+		} else if ((dstbuf->queued_in_vb2 == false) &&
+			   (dstbuf->queued_in_v4l2 == true)) {
+			/*
+			 * If buffer in v4l2 driver but not in vb2 queue yet,
+			 * and we get this buffer from free_list, it means
+			 * that codec driver do not use this buffer as
+			 * reference buffer anymore. We should q buffer to vb2
+			 * queue, so later work thread could get this buffer
+			 * for decode. In this case, queued_in_vb2 = false
+			 * means this buffer is not from previous decode
+			 * output.
+			 */
+			mtk_v4l2_debug(2,
+					"[%d]status=%x queue id=%d to rdy_queue",
+					ctx->id, free_frame_buffer->status,
+					dstbuf->vb.vb2_buf.index);
+			v4l2_m2m_buf_queue(ctx->m2m_ctx, &dstbuf->vb);
+			dstbuf->queued_in_vb2 = true;
+		} else {
+			/*
+			 * Codec driver do not need to reference this capture
+			 * buffer and this buffer is not in v4l2 driver.
+			 * Then we don't need to do any thing, just add log when
+			 * we need to debug buffer flow.
+			 * When this buffer q from user space, it could
+			 * directly q to vb2 buffer
+			 */
+			mtk_v4l2_debug(3, "[%d]status=%x err queue id=%d %d %d",
+					ctx->id, free_frame_buffer->status,
+					dstbuf->vb.vb2_buf.index,
+					dstbuf->queued_in_vb2,
+					dstbuf->queued_in_v4l2);
+		}
+		dstbuf->used = false;
+	}
+	mutex_unlock(&ctx->lock);
+	return &dstbuf->vb.vb2_buf;
+}
+
+static void clean_display_buffer(struct mtk_vcodec_ctx *ctx)
+{
+	struct vb2_buffer *framptr;
+
+	do {
+		framptr = get_display_buffer(ctx);
+	} while (framptr);
+}
+
+static void clean_free_buffer(struct mtk_vcodec_ctx *ctx)
+{
+	struct vb2_buffer *framptr;
+
+	do {
+		framptr = get_free_buffer(ctx);
+	} while (framptr);
+}
+
+static void mtk_vdec_queue_res_chg_event(struct mtk_vcodec_ctx *ctx)
+{
+	static const struct v4l2_event ev_src_ch = {
+		.type = V4L2_EVENT_SOURCE_CHANGE,
+		.u.src_change.changes =
+		V4L2_EVENT_SRC_CH_RESOLUTION,
+	};
+
+	mtk_v4l2_debug(1, "[%d]", ctx->id);
+	v4l2_event_queue_fh(&ctx->fh, &ev_src_ch);
+}
+
+static int mtk_vdec_flush_decoder(struct mtk_vcodec_ctx *ctx)
+{
+	bool res_chg;
+	int ret = 0;
+
+	ret = vdec_if_decode(ctx, NULL, NULL, &res_chg);
+	if (ret)
+		mtk_v4l2_err("DecodeFinal failed, ret=%d", ret);
+
+	clean_display_buffer(ctx);
+	clean_free_buffer(ctx);
+
+	return 0;
+}
+
+static void mtk_vdec_update_fmt(struct mtk_vcodec_ctx *ctx,
+				unsigned int pixelformat)
+{
+	const struct mtk_video_fmt *fmt;
+	struct mtk_q_data *dst_q_data;
+	unsigned int k;
+
+	dst_q_data = &ctx->q_data[MTK_Q_DATA_DST];
+	for (k = 0; k < NUM_FORMATS; k++) {
+		fmt = &mtk_video_formats[k];
+		if (fmt->fourcc == pixelformat) {
+			mtk_v4l2_debug(1, "Update cap fourcc(%d -> %d)",
+				dst_q_data->fmt.fourcc, pixelformat);
+			dst_q_data->fmt = fmt;
+			return;
+		}
+	}
+
+	mtk_v4l2_err("Cannot get fourcc(%d), using init value", pixelformat);
+}
+
+static int mtk_vdec_pic_info_update(struct mtk_vcodec_ctx *ctx)
+{
+	unsigned int dpbsize = 0;
+	int ret;
+
+	if (vdec_if_get_param(ctx,
+				GET_PARAM_PIC_INFO,
+				&ctx->last_decoded_picinfo)) {
+		mtk_v4l2_err("[%d]Error!! Cannot get param : GET_PARAM_PICTURE_INFO ERR",
+				ctx->id);
+		return -EINVAL;
+	}
+
+	if (ctx->last_decoded_picinfo.pic_w == 0 ||
+		ctx->last_decoded_picinfo.pic_h == 0 ||
+		ctx->last_decoded_picinfo.buf_w == 0 ||
+		ctx->last_decoded_picinfo.buf_h == 0) {
+		mtk_v4l2_err("Cannot get correct pic info");
+		return -EINVAL;
+	}
+
+	if (ctx->last_decoded_picinfo.cap_fourcc != ctx->picinfo.cap_fourcc &&
+		ctx->picinfo.cap_fourcc != 0)
+		mtk_vdec_update_fmt(ctx, ctx->picinfo.cap_fourcc);
+
+	if ((ctx->last_decoded_picinfo.pic_w == ctx->picinfo.pic_w) ||
+	    (ctx->last_decoded_picinfo.pic_h == ctx->picinfo.pic_h))
+		return 0;
+
+	mtk_v4l2_debug(1,
+			"[%d]-> new(%d,%d), old(%d,%d), real(%d,%d)",
+			ctx->id, ctx->last_decoded_picinfo.pic_w,
+			ctx->last_decoded_picinfo.pic_h,
+			ctx->picinfo.pic_w, ctx->picinfo.pic_h,
+			ctx->last_decoded_picinfo.buf_w,
+			ctx->last_decoded_picinfo.buf_h);
+
+	ret = vdec_if_get_param(ctx, GET_PARAM_DPB_SIZE, &dpbsize);
+	if (dpbsize == 0)
+		mtk_v4l2_err("Incorrect dpb size, ret=%d", ret);
+
+	ctx->dpb_size = dpbsize;
+
+	return ret;
+}
+
+static void mtk_vdec_worker(struct work_struct *work)
+{
+	struct mtk_vcodec_ctx *ctx = container_of(work, struct mtk_vcodec_ctx,
+				decode_work);
+	struct mtk_vcodec_dev *dev = ctx->dev;
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct mtk_vcodec_mem buf;
+	struct vdec_fb *pfb;
+	bool res_chg = false;
+	int ret;
+	struct mtk_video_dec_buf *dst_buf_info, *src_buf_info;
+
+	src_buf = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
+	if (src_buf == NULL) {
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		mtk_v4l2_debug(1, "[%d] src_buf empty!!", ctx->id);
+		return;
+	}
+
+	dst_buf = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
+	if (dst_buf == NULL) {
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		mtk_v4l2_debug(1, "[%d] dst_buf empty!!", ctx->id);
+		return;
+	}
+
+	src_buf_info = container_of(src_buf, struct mtk_video_dec_buf, vb);
+	dst_buf_info = container_of(dst_buf, struct mtk_video_dec_buf, vb);
+
+	pfb = &dst_buf_info->frame_buffer;
+	pfb->base_y.va = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
+	pfb->base_y.dma_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf,
+							     0);
+	pfb->base_y.size = ctx->picinfo.fb_sz[0];
+
+	pfb->base_c.va = vb2_plane_vaddr(&dst_buf->vb2_buf, 1);
+	pfb->base_c.dma_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf,
+							     1);
+	pfb->base_c.size = ctx->picinfo.fb_sz[1];
+	pfb->status = 0;
+	mtk_v4l2_debug(3, "===>[%d] vdec_if_decode() ===>", ctx->id);
+
+	mtk_v4l2_debug(3,
+			"id=%d Framebuf  pfb=%p VA=%p Y_DMA=%pad C_DMA=%pad Size=%zx",
+			dst_buf->vb2_buf.index, pfb,
+			pfb->base_y.va, &pfb->base_y.dma_addr,
+			&pfb->base_c.dma_addr, pfb->base_y.size);
+
+	if (src_buf_info->lastframe) {
+		mtk_v4l2_debug(1, "Got empty flush input buffer.");
+		src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+
+		/* update dst buf status */
+		dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
+		mutex_lock(&ctx->lock);
+		dst_buf_info->used = false;
+		mutex_unlock(&ctx->lock);
+
+		vdec_if_decode(ctx, NULL, NULL, &res_chg);
+		clean_display_buffer(ctx);
+		vb2_set_plane_payload(&dst_buf_info->vb.vb2_buf, 0, 0);
+		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
+			vb2_set_plane_payload(&dst_buf_info->vb.vb2_buf, 1, 0);
+		dst_buf->flags |= V4L2_BUF_FLAG_LAST;
+		v4l2_m2m_buf_done(&dst_buf_info->vb, VB2_BUF_STATE_DONE);
+		clean_free_buffer(ctx);
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		return;
+	}
+	buf.va = vb2_plane_vaddr(&src_buf->vb2_buf, 0);
+	buf.dma_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
+	buf.size = (size_t)src_buf->vb2_buf.planes[0].bytesused;
+	if (!buf.va) {
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		mtk_v4l2_err("[%d] id=%d src_addr is NULL!!",
+				ctx->id, src_buf->vb2_buf.index);
+		return;
+	}
+	mtk_v4l2_debug(3, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
+			ctx->id, buf.va, &buf.dma_addr, buf.size, src_buf);
+	dst_buf_info->vb.vb2_buf.timestamp
+			= src_buf_info->vb.vb2_buf.timestamp;
+	dst_buf_info->vb.timecode
+			= src_buf_info->vb.timecode;
+	mutex_lock(&ctx->lock);
+	dst_buf_info->used = true;
+	mutex_unlock(&ctx->lock);
+	src_buf_info->used = true;
+
+	ret = vdec_if_decode(ctx, &buf, pfb, &res_chg);
+
+	if (ret) {
+		mtk_v4l2_err(
+			" <===[%d], src_buf[%d] sz=0x%zx pts=%llu dst_buf[%d] vdec_if_decode() ret=%d res_chg=%d===>",
+			ctx->id,
+			src_buf->vb2_buf.index,
+			buf.size,
+			src_buf_info->vb.vb2_buf.timestamp,
+			dst_buf->vb2_buf.index,
+			ret, res_chg);
+		src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		if (ret == -EIO) {
+			mutex_lock(&ctx->lock);
+			src_buf_info->error = true;
+			mutex_unlock(&ctx->lock);
+		}
+		v4l2_m2m_buf_done(&src_buf_info->vb, VB2_BUF_STATE_ERROR);
+	} else if (res_chg == false) {
+		/*
+		 * we only return src buffer with VB2_BUF_STATE_DONE
+		 * when decode success without resolution change
+		 */
+		src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		v4l2_m2m_buf_done(&src_buf_info->vb, VB2_BUF_STATE_DONE);
+	}
+
+	dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
+	clean_display_buffer(ctx);
+	clean_free_buffer(ctx);
+
+	if (!ret && res_chg) {
+		mtk_vdec_pic_info_update(ctx);
+		/*
+		 * On encountering a resolution change in the stream.
+		 * The driver must first process and decode all
+		 * remaining buffers from before the resolution change
+		 * point, so call flush decode here
+		 */
+		mtk_vdec_flush_decoder(ctx);
+		/*
+		 * After all buffers containing decoded frames from
+		 * before the resolution change point ready to be
+		 * dequeued on the CAPTURE queue, the driver sends a
+		 * V4L2_EVENT_SOURCE_CHANGE event for source change
+		 * type V4L2_EVENT_SRC_CH_RESOLUTION
+		 */
+		mtk_vdec_queue_res_chg_event(ctx);
+	}
+	v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+}
+
+static void vb2ops_vdec_stateful_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *src_buf;
+	struct mtk_vcodec_mem src_mem;
+	bool res_chg = false;
+	int ret = 0;
+	unsigned int dpbsize = 1, i = 0;
+	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vb2_v4l2 = NULL;
+	struct mtk_video_dec_buf *buf = NULL;
+	struct mtk_q_data *dst_q_data;
+
+	mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p",
+			ctx->id, vb->vb2_queue->type,
+			vb->index, vb);
+	/*
+	 * check if this buffer is ready to be used after decode
+	 */
+	if (vb->vb2_queue->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		vb2_v4l2 = to_vb2_v4l2_buffer(vb);
+		buf = container_of(vb2_v4l2, struct mtk_video_dec_buf, vb);
+		mutex_lock(&ctx->lock);
+		if (buf->used == false) {
+			v4l2_m2m_buf_queue(ctx->m2m_ctx, vb2_v4l2);
+			buf->queued_in_vb2 = true;
+			buf->queued_in_v4l2 = true;
+		} else {
+			buf->queued_in_vb2 = false;
+			buf->queued_in_v4l2 = true;
+		}
+		mutex_unlock(&ctx->lock);
+		return;
+	}
+
+	v4l2_m2m_buf_queue(ctx->m2m_ctx, to_vb2_v4l2_buffer(vb));
+
+	if (ctx->state != MTK_STATE_INIT) {
+		mtk_v4l2_debug(3, "[%d] already init driver %d",
+				ctx->id, ctx->state);
+		return;
+	}
+
+	src_buf = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
+	if (!src_buf) {
+		mtk_v4l2_err("No src buffer");
+		return;
+	}
+	buf = container_of(src_buf, struct mtk_video_dec_buf, vb);
+	if (buf->lastframe) {
+		/* This shouldn't happen. Just in case. */
+		mtk_v4l2_err("Invalid flush buffer.");
+		v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		return;
+	}
+
+	src_mem.va = vb2_plane_vaddr(&src_buf->vb2_buf, 0);
+	src_mem.dma_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
+	src_mem.size = (size_t)src_buf->vb2_buf.planes[0].bytesused;
+	mtk_v4l2_debug(2,
+			"[%d] buf id=%d va=%p dma=%pad size=%zx",
+			ctx->id, src_buf->vb2_buf.index,
+			src_mem.va, &src_mem.dma_addr,
+			src_mem.size);
+
+	ret = vdec_if_decode(ctx, &src_mem, NULL, &res_chg);
+	if (ret || !res_chg) {
+		/*
+		 * fb == NULL means to parse SPS/PPS header or
+		 * resolution info in src_mem. Decode can fail
+		 * if there is no SPS header or picture info
+		 * in bs
+		 */
+
+		src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		if (ret == -EIO) {
+			mtk_v4l2_err("[%d] Unrecoverable error in vdec_if_decode.",
+					ctx->id);
+			ctx->state = MTK_STATE_ABORT;
+			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+		} else {
+			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
+		}
+		mtk_v4l2_debug(ret ? 0 : 1,
+			       "[%d] vdec_if_decode() src_buf=%d, size=%zu, fail=%d, res_chg=%d",
+			       ctx->id, src_buf->vb2_buf.index,
+			       src_mem.size, ret, res_chg);
+		return;
+	}
+
+	if (vdec_if_get_param(ctx, GET_PARAM_PIC_INFO, &ctx->picinfo)) {
+		mtk_v4l2_err("[%d]Error!! Cannot get param : GET_PARAM_PICTURE_INFO ERR",
+				ctx->id);
+		return;
+	}
+
+	ctx->last_decoded_picinfo = ctx->picinfo;
+	dst_q_data = &ctx->q_data[MTK_Q_DATA_DST];
+	for (i = 0; i < dst_q_data->fmt->num_planes; i++) {
+		dst_q_data->sizeimage[i] = ctx->picinfo.fb_sz[i];
+		dst_q_data->bytesperline[i] = ctx->picinfo.buf_w;
+	}
+
+	mtk_v4l2_debug(2, "[%d] vdec_if_init() OK wxh=%dx%d pic wxh=%dx%d sz[0]=0x%x sz[1]=0x%x",
+			ctx->id,
+			ctx->picinfo.buf_w, ctx->picinfo.buf_h,
+			ctx->picinfo.pic_w, ctx->picinfo.pic_h,
+			dst_q_data->sizeimage[0],
+			dst_q_data->sizeimage[1]);
+
+	ret = vdec_if_get_param(ctx, GET_PARAM_DPB_SIZE, &dpbsize);
+	if (dpbsize == 0)
+		mtk_v4l2_err("[%d] GET_PARAM_DPB_SIZE fail=%d", ctx->id, ret);
+
+	ctx->dpb_size = dpbsize;
+	ctx->state = MTK_STATE_HEADER;
+	mtk_v4l2_debug(1, "[%d] dpbsize=%d", ctx->id, ctx->dpb_size);
+
+	mtk_vdec_queue_res_chg_event(ctx);
+}
+
+static const struct v4l2_ctrl_ops mtk_vcodec_dec_ctrl_ops = {
+	.g_volatile_ctrl = mtk_vdec_g_v_ctrl,
+};
+
+static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_ctx *ctx)
+{
+	struct v4l2_ctrl *ctrl;
+
+	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, 1);
+
+	ctrl = v4l2_ctrl_new_std(&ctx->ctrl_hdl,
+				&mtk_vcodec_dec_ctrl_ops,
+				V4L2_CID_MIN_BUFFERS_FOR_CAPTURE,
+				0, 32, 1, 1);
+	ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
+	v4l2_ctrl_new_std_menu(&ctx->ctrl_hdl,
+				&mtk_vcodec_dec_ctrl_ops,
+				V4L2_CID_MPEG_VIDEO_VP9_PROFILE,
+				V4L2_MPEG_VIDEO_VP9_PROFILE_0,
+				0, V4L2_MPEG_VIDEO_VP9_PROFILE_0);
+
+	if (ctx->ctrl_hdl.error) {
+		mtk_v4l2_err("Adding control failed %d",
+				ctx->ctrl_hdl.error);
+		return ctx->ctrl_hdl.error;
+	}
+
+	v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
+	return 0;
+}
+
+static void mtk_init_vdec_params(struct mtk_vcodec_ctx *ctx)
+{
+}
+
+static struct vb2_ops mtk_vdec_frame_vb2_ops = {
+	.queue_setup	= vb2ops_vdec_queue_setup,
+	.buf_prepare	= vb2ops_vdec_buf_prepare,
+	.wait_prepare	= vb2_ops_wait_prepare,
+	.wait_finish	= vb2_ops_wait_finish,
+	.start_streaming	= vb2ops_vdec_start_streaming,
+
+	.buf_queue	= vb2ops_vdec_stateful_buf_queue,
+	.buf_init	= vb2ops_vdec_buf_init,
+	.buf_finish	= vb2ops_vdec_buf_finish,
+	.stop_streaming	= vb2ops_vdec_stop_streaming,
+};
+
+const struct mtk_vcodec_dec_pdata mtk_frame_8173_pdata = {
+	.init_vdec_params = mtk_init_vdec_params,
+	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
+	.vdec_vb2_ops = &mtk_vdec_frame_vb2_ops,
+	.vdec_formats = mtk_video_formats,
+	.num_formats = NUM_FORMATS,
+	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
+	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
+	.vdec_framesizes = mtk_vdec_framesizes,
+	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
+	.worker = mtk_vdec_worker,
+	.flush_decoder = mtk_vdec_flush_decoder,
+};
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 76905e2d56a7..03ce5d05f58c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -307,6 +307,45 @@ struct mtk_vcodec_ctx {
 
 };
 
+/**
+ * struct mtk_vcodec_dec_pdata - compatible data for each IC
+ * @init_vdec_params: init vdec params
+ * @ctrls_setup: init vcodec dec ctrls
+ * @worker: worker to start a decode job
+ * @flush_decoder: function that flushes the decoder
+ *
+ * @vdec_vb2_ops: struct vb2_ops
+ *
+ * @vdec_formats: supported video decoder formats
+ * @num_formats: count of video decoder formats
+ * @default_out_fmt: default output buffer format
+ * @default_cap_fmt: default capture buffer format
+ *
+ * @vdec_framesizes: supported video decoder frame sizes
+ * @num_framesizes: count of video decoder frame sizes
+ *
+ * @uses_stateless_api: whether the decoder uses the stateless API with requests
+ */
+
+struct mtk_vcodec_dec_pdata {
+	void (*init_vdec_params)(struct mtk_vcodec_ctx *ctx);
+	int (*ctrls_setup)(struct mtk_vcodec_ctx *ctx);
+	void (*worker)(struct work_struct *work);
+	int (*flush_decoder)(struct mtk_vcodec_ctx *ctx);
+
+	struct vb2_ops *vdec_vb2_ops;
+
+	const struct mtk_video_fmt *vdec_formats;
+	const int num_formats;
+	const struct mtk_video_fmt *default_out_fmt;
+	const struct mtk_video_fmt *default_cap_fmt;
+
+	const struct mtk_codec_framesizes *vdec_framesizes;
+	const int num_framesizes;
+
+	bool uses_stateless_api;
+};
+
 /**
  * struct mtk_vcodec_dev - driver data
  * @v4l2_dev: V4L2 device to register video devices for.
@@ -322,6 +361,7 @@ struct mtk_vcodec_ctx {
  * @curr_ctx: The context that is waiting for codec hardware
  *
  * @reg_base: Mapped address of MTK Vcodec registers.
+ * @vdec_pdata: Current arch private data.
  *
  * @id_counter: used to identify current opened instance
  *
@@ -356,6 +396,7 @@ struct mtk_vcodec_dev {
 	spinlock_t irqlock;
 	struct mtk_vcodec_ctx *curr_ctx;
 	void __iomem *reg_base[NUM_MAX_VCODEC_REG_BASE];
+	const struct mtk_vcodec_dec_pdata *vdec_pdata;
 
 	unsigned long id_counter;
 
-- 
2.22.0.rc1.257.g3120a18244-goog

