Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5740B3260E9
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 11:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbhBZKGs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 05:06:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbhBZKEt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 05:04:49 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B607C0611BC
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 02:02:38 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id r5so5909136pfh.13
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 02:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nfYIINXoKZUoitqaaBfvTmVbHkP8UmypLFrLruTJwl0=;
        b=A3edotnD4wiiz+AsyY9fcfd6EDVo3xsfqJozydADAsJk5rVh7NRDVXrgmUqy8jVh4f
         Gg/x7MGB7gqy50TasbmsOye0g1pWmkaBGzuXiqf978n/V9Y26vZ9h8JoSyKJAKhVbGFm
         oGuGbqbk+4TJNYfM/g4KJAQcQMT7AALvC4Aas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nfYIINXoKZUoitqaaBfvTmVbHkP8UmypLFrLruTJwl0=;
        b=DqtOqfDyoA2WUa+x0P+8HztGJMtdmKtoDypDMUv1NlEbN5HECv0ll0Ui15ITnJjIEG
         tJkwsqRbn8mMXqK45d3f9naAMrw8IzpoHGCXHhclck8VTlGK5GrWoTc9gRjwopbdLrGW
         1Jc+/UZQN8UYBQ7nNuJfTGC96ziCyw8HeQumo2e1bBwaVUxfGtxu7YzInSc9eAn0kAbv
         c6eA16xeeRANxawrEgzpegIzPrpoL04ibKOLVJAcUG29UDanKGFAxjodn/r6T9q8gypk
         zG1+Yc3DWI9pfvBz14DNIaA+Ty803CbAOCLlPBiSVgMxvcG4xaFei0vWu7C84iEajZnv
         rNYQ==
X-Gm-Message-State: AOAM530QfJG6aMfJMRp88bdHkLmJRdjGFNd1UBCTsMTi2WUsMbl987M1
        qqh3sZ1pmCbGwIN6ZJ7p5hRb9A==
X-Google-Smtp-Source: ABdhPJxVhua7C9+wleBKGRNjyjfreahVMKvs8KG6N6ecXUlQh863hvOcLxoqSBcoG55l9muJ20Rl2g==
X-Received: by 2002:a65:6205:: with SMTP id d5mr2259264pgv.40.1614333757887;
        Fri, 26 Feb 2021 02:02:37 -0800 (PST)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:5c91:233c:dd5b:b1b0])
        by smtp.gmail.com with ESMTPSA id o23sm9201565pfp.89.2021.02.26.02.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 02:02:37 -0800 (PST)
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
Subject: [PATCH v3 13/15] media: mtk-vcodec: make flush buffer reusable by encoder
Date:   Fri, 26 Feb 2021 19:01:46 +0900
Message-Id: <20210226100148.1663389-14-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210226100148.1663389-1-acourbot@chromium.org>
References: <20210226100148.1663389-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The flush buffer is a special buffer that tells the decoder driver to
send an empty CAPTURE frame to the client with V4L2_BUF_FLAG_LAST set.

We need similar functionality for the encoder ; however currently the
flush buffer depends on decoder-specific structures and thus cannot be
reused with the encoder.

Fix this by testing for this buffer by its VB2 address, and not through
a dedicated flag stored in a higher-level decoder structure. This also
allows us to remove said flag and simplify the code a bit.

Since the flush buffer should never be used in the stateless decoder,
also add safeguards to check against it.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../media/platform/mtk-vcodec/mtk_vcodec_dec.c    |  9 ++-------
 .../media/platform/mtk-vcodec/mtk_vcodec_dec.h    |  2 --
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c      | 12 +-----------
 .../platform/mtk-vcodec/mtk_vcodec_dec_stateful.c | 15 +++++++++------
 .../media/platform/mtk-vcodec/mtk_vcodec_drv.h    |  6 ++++--
 5 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 209ccf3d2d67..1c86130bb52d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -86,8 +86,7 @@ static int vidioc_decoder_cmd(struct file *file, void *priv,
 			mtk_v4l2_debug(1, "Capture stream is off. No need to flush.");
 			return 0;
 		}
-		v4l2_m2m_buf_queue(ctx->m2m_ctx,
-				   &ctx->empty_flush_buf->m2m_buf.vb);
+		v4l2_m2m_buf_queue(ctx->m2m_ctx, &ctx->empty_flush_buf.vb);
 		v4l2_m2m_try_schedule(ctx->m2m_ctx);
 		break;
 
@@ -779,8 +778,6 @@ int vb2ops_vdec_buf_init(struct vb2_buffer *vb)
 	if (vb->vb2_queue->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		buf->used = false;
 		buf->queued_in_v4l2 = false;
-	} else {
-		buf->lastframe = false;
 	}
 
 	return 0;
@@ -807,9 +804,7 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
-			struct mtk_video_dec_buf *buf_info = container_of(
-				 src_buf, struct mtk_video_dec_buf, m2m_buf.vb);
-			if (!buf_info->lastframe) {
+			if (src_buf != &ctx->empty_flush_buf.vb) {
 				struct media_request *req =
 					src_buf->vb2_buf.req_obj.req;
 				v4l2_m2m_buf_done(src_buf,
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
index a2949e1bc7fe..a510e74251e6 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
@@ -42,7 +42,6 @@ struct vdec_fb {
  * @queued_in_vb2:	Capture buffer is queue in vb2
  * @queued_in_v4l2:	Capture buffer is in v4l2 driver, but not in vb2
  *			queue yet
- * @lastframe:		Intput buffer is last buffer - EOS
  * @error:		An unrecoverable error occurs on this buffer.
  * @frame_buffer:	Decode status, and buffer information of Capture buffer
  * @bs_buffer:	Output buffer info
@@ -55,7 +54,6 @@ struct mtk_video_dec_buf {
 	bool	used;
 	bool	queued_in_vb2;
 	bool	queued_in_v4l2;
-	bool	lastframe;
 
 	bool	error;
 
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index e0526c0900c8..4789e669c258 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -82,21 +82,14 @@ static int fops_vcodec_open(struct file *file)
 {
 	struct mtk_vcodec_dev *dev = video_drvdata(file);
 	struct mtk_vcodec_ctx *ctx = NULL;
-	struct mtk_video_dec_buf *mtk_buf = NULL;
 	int ret = 0;
 	struct vb2_queue *src_vq;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
-	mtk_buf = kzalloc(sizeof(*mtk_buf), GFP_KERNEL);
-	if (!mtk_buf) {
-		kfree(ctx);
-		return -ENOMEM;
-	}
 
 	mutex_lock(&dev->dev_mutex);
-	ctx->empty_flush_buf = mtk_buf;
 	ctx->id = dev->id_counter++;
 	v4l2_fh_init(&ctx->fh, video_devdata(file));
 	file->private_data = &ctx->fh;
@@ -122,8 +115,7 @@ static int fops_vcodec_open(struct file *file)
 	}
 	src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
 				V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
-	ctx->empty_flush_buf->m2m_buf.vb.vb2_buf.vb2_queue = src_vq;
-	ctx->empty_flush_buf->lastframe = true;
+	ctx->empty_flush_buf.vb.vb2_buf.vb2_queue = src_vq;
 	mtk_vcodec_dec_set_default_params(ctx);
 
 	if (v4l2_fh_is_singular(&ctx->fh)) {
@@ -161,7 +153,6 @@ static int fops_vcodec_open(struct file *file)
 err_ctrls_setup:
 	v4l2_fh_del(&ctx->fh);
 	v4l2_fh_exit(&ctx->fh);
-	kfree(ctx->empty_flush_buf);
 	kfree(ctx);
 	mutex_unlock(&dev->dev_mutex);
 
@@ -192,7 +183,6 @@ static int fops_vcodec_release(struct file *file)
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 
 	list_del_init(&ctx->list);
-	kfree(ctx->empty_flush_buf);
 	kfree(ctx);
 	mutex_unlock(&dev->dev_mutex);
 	return 0;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
index 3666c7e73bff..8d4ec8c7728b 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
@@ -337,8 +337,6 @@ static void mtk_vdec_worker(struct work_struct *work)
 		return;
 	}
 
-	src_buf_info = container_of(src_buf, struct mtk_video_dec_buf,
-				    m2m_buf.vb);
 	dst_buf_info = container_of(dst_buf, struct mtk_video_dec_buf,
 				    m2m_buf.vb);
 
@@ -359,7 +357,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 			pfb->base_y.va, &pfb->base_y.dma_addr,
 			&pfb->base_c.dma_addr, pfb->base_y.size);
 
-	if (src_buf_info->lastframe) {
+	if (src_buf == &ctx->empty_flush_buf.vb) {
 		mtk_v4l2_debug(1, "Got empty flush input buffer.");
 		src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
 
@@ -380,6 +378,10 @@ static void mtk_vdec_worker(struct work_struct *work)
 		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		return;
 	}
+
+	src_buf_info = container_of(src_buf, struct mtk_video_dec_buf,
+				    m2m_buf.vb);
+
 	buf.va = vb2_plane_vaddr(&src_buf->vb2_buf, 0);
 	buf.dma_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
 	buf.size = (size_t)src_buf->vb2_buf.planes[0].bytesused;
@@ -459,7 +461,6 @@ static void vb2ops_vdec_stateful_buf_queue(struct vb2_buffer *vb)
 	unsigned int dpbsize = 1, i = 0;
 	struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vb2_v4l2 = NULL;
-	struct mtk_video_dec_buf *buf = NULL;
 	struct mtk_q_data *dst_q_data;
 
 	mtk_v4l2_debug(3, "[%d] (%d) id=%d, vb=%p",
@@ -469,6 +470,8 @@ static void vb2ops_vdec_stateful_buf_queue(struct vb2_buffer *vb)
 	 * check if this buffer is ready to be used after decode
 	 */
 	if (vb->vb2_queue->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		struct mtk_video_dec_buf *buf;
+
 		vb2_v4l2 = to_vb2_v4l2_buffer(vb);
 		buf = container_of(vb2_v4l2, struct mtk_video_dec_buf,
 				   m2m_buf.vb);
@@ -498,8 +501,8 @@ static void vb2ops_vdec_stateful_buf_queue(struct vb2_buffer *vb)
 		mtk_v4l2_err("No src buffer");
 		return;
 	}
-	buf = container_of(src_buf, struct mtk_video_dec_buf, m2m_buf.vb);
-	if (buf->lastframe) {
+
+	if (src_buf == &ctx->empty_flush_buf.vb) {
 		/* This shouldn't happen. Just in case. */
 		mtk_v4l2_err("Invalid flush buffer.");
 		v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 79d6a1e6c916..8dab9f520283 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -13,6 +13,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
+#include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-core.h>
 #include "mtk_vcodec_util.h"
 
@@ -250,7 +251,8 @@ struct vdec_pic_info {
  * @decode_work: worker for the decoding
  * @encode_work: worker for the encoding
  * @last_decoded_picinfo: pic information get from latest decode
- * @empty_flush_buf: a fake size-0 capture buffer that indicates flush
+ * @empty_flush_buf: a fake size-0 capture buffer that indicates flush. Only
+ *		     to be used with encoder and stateful decoder.
  * @current_codec: current set input codec, in V4L2 pixel format
  *
  * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
@@ -289,7 +291,7 @@ struct mtk_vcodec_ctx {
 	struct work_struct decode_work;
 	struct work_struct encode_work;
 	struct vdec_pic_info last_decoded_picinfo;
-	struct mtk_video_dec_buf *empty_flush_buf;
+	struct v4l2_m2m_buffer empty_flush_buf;
 
 	u32 current_codec;
 
-- 
2.30.1.766.gb4fecdf3b7-goog

