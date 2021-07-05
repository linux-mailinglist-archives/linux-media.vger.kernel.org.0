Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B73AE3BB6D5
	for <lists+linux-media@lfdr.de>; Mon,  5 Jul 2021 07:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhGEFgN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Jul 2021 01:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbhGEFgM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Jul 2021 01:36:12 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED5AC061764
        for <linux-media@vger.kernel.org>; Sun,  4 Jul 2021 22:33:35 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id a14so9437373pls.4
        for <linux-media@vger.kernel.org>; Sun, 04 Jul 2021 22:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pQwCABzRMwEb70X/gDCrWFY8TrSA/nVHyyeEVEg5S/E=;
        b=aMWvNleFC07H9dgex/ahwSZpO6WlgUhvyV7ge33ZCQXytQ5KYhrgkS0kong7NaQH/2
         xxd/4Onr0qQq3bTjlt2yVyMFzEKSKuKH0rN+P/ZldSLAbSGoOBDq6tNXvHdEbG0Cmcs0
         dfVhJ5eLyLgM5FNsXKZkYwgHo2gPA3WHP3ORw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pQwCABzRMwEb70X/gDCrWFY8TrSA/nVHyyeEVEg5S/E=;
        b=cpqvHFUWXHKCJ5C4mN1J/1zt18KpvjBzXZ30xSPA94ZQmVCJD21BUQnPUBA95wYQy4
         xGfsQL3qbJs9N/+bycF0g771F+DUXxBSZgO0KwL3jsqgLQCsinV77+9oqftFAKAGFeRs
         82Ls0yZOBaixWGpSFPBYnk8uC18V4SB/ybfYgdHTwQJWA4xrepBWuWHxX1XCBVCgGVx5
         oU4Db4pM7+lx7lruovxaI1XQOw7cuU/dpHEw2qOU4cT95huHY+lbSfJEasU+Wu1Q+oti
         0SgfFrpEi/ALW4j1GGUsEUT2KkmLkn89wG1/rxj07YqYoLQjEyH5UMYplbAq98Q5oTFE
         UF4A==
X-Gm-Message-State: AOAM532Cu8QjkZoNWQPmUTaf31UI5B0fD+0n9AfUklvAaSEADl9QglJn
        FX3ichwks+BUBuuW9sHjILCXYw==
X-Google-Smtp-Source: ABdhPJzGQNEON04gTrFJ8y+pEojUzgqtsJyFxBI/r+SXLYUJPQNOaMzMTZqq+CD85jsaCtvSJ38ZsQ==
X-Received: by 2002:a17:90a:708d:: with SMTP id g13mr13403581pjk.81.1625463214864;
        Sun, 04 Jul 2021 22:33:34 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:3fed:7130:60f:265a])
        by smtp.gmail.com with ESMTPSA id x19sm6805245pfp.115.2021.07.04.22.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 22:33:34 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v6 05/14] media: mtk-vcodec: venc: support START and STOP commands
Date:   Mon,  5 Jul 2021 14:32:49 +0900
Message-Id: <20210705053258.1614177-6-acourbot@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210705053258.1614177-1-acourbot@chromium.org>
References: <20210705053258.1614177-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2 encoder specification requires encoders to support the
V4L2_ENC_CMD_START and V4L2_ENC_CMD_STOP commands. Add support for these
to the mtk-vcodec encoder by reusing the same flush buffer as used by
the decoder driver.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
[hsinyi: fix double-free issue if flush buffer was not dequeued by the
time streamoff is called]
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   2 +
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 140 +++++++++++++++++-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   6 +-
 3 files changed, 140 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index cad52d8b1463..cb248d8daa7b 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -252,6 +252,7 @@ struct vdec_pic_info {
  * @last_decoded_picinfo: pic information get from latest decode
  * @empty_flush_buf: a fake size-0 capture buffer that indicates flush. Only
  *		     to be used with encoder and stateful decoder.
+ * @is_flushing: set to true if flushing is in progress.
  *
  * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
  * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
@@ -291,6 +292,7 @@ struct mtk_vcodec_ctx {
 	struct work_struct encode_work;
 	struct vdec_pic_info last_decoded_picinfo;
 	struct v4l2_m2m_buffer empty_flush_buf;
+	bool is_flushing;
 
 	enum v4l2_colorspace colorspace;
 	enum v4l2_ycbcr_encoding ycbcr_enc;
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 416f356af363..efa53ea573a2 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -672,6 +672,7 @@ static int vidioc_venc_dqbuf(struct file *file, void *priv,
 			     struct v4l2_buffer *buf)
 {
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+	int ret;
 
 	if (ctx->state == MTK_STATE_ABORT) {
 		mtk_v4l2_err("[%d] Call on QBUF after unrecoverable error",
@@ -679,7 +680,83 @@ static int vidioc_venc_dqbuf(struct file *file, void *priv,
 		return -EIO;
 	}
 
-	return v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
+	ret = v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
+	if (ret)
+		return ret;
+
+	/*
+	 * Complete flush if the user dequeued the 0-payload LAST buffer.
+	 * We check the payload because a buffer with the LAST flag can also
+	 * be seen during resolution changes. If we happen to be flushing at
+	 * that time, the last buffer before the resolution changes could be
+	 * misinterpreted for the buffer generated by the flush and terminate
+	 * it earlier than we want.
+	 */
+	if (!V4L2_TYPE_IS_OUTPUT(buf->type) &&
+	    buf->flags & V4L2_BUF_FLAG_LAST &&
+	    buf->m.planes[0].bytesused == 0 &&
+	    ctx->is_flushing) {
+		/*
+		 * Last CAPTURE buffer is dequeued, we can allow another flush
+		 * to take place.
+		 */
+		ctx->is_flushing = false;
+	}
+
+	return 0;
+}
+
+static int vidioc_encoder_cmd(struct file *file, void *priv,
+			      struct v4l2_encoder_cmd *cmd)
+{
+	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+	struct vb2_queue *src_vq, *dst_vq;
+	int ret;
+
+	if (ctx->state == MTK_STATE_ABORT) {
+		mtk_v4l2_err("[%d] Call to CMD after unrecoverable error",
+			     ctx->id);
+		return -EIO;
+	}
+
+	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, priv, cmd);
+	if (ret)
+		return ret;
+
+	/* Calling START or STOP is invalid if a flush is in progress */
+	if (ctx->is_flushing)
+		return -EBUSY;
+
+	mtk_v4l2_debug(1, "encoder cmd=%u", cmd->cmd);
+
+	dst_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
+				 V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	switch (cmd->cmd) {
+	case V4L2_ENC_CMD_STOP:
+		src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
+					 V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+		if (!vb2_is_streaming(src_vq)) {
+			mtk_v4l2_debug(1, "Output stream is off. No need to flush.");
+			return 0;
+		}
+		if (!vb2_is_streaming(dst_vq)) {
+			mtk_v4l2_debug(1, "Capture stream is off. No need to flush.");
+			return 0;
+		}
+		ctx->is_flushing = true;
+		v4l2_m2m_buf_queue(ctx->m2m_ctx, &ctx->empty_flush_buf.vb);
+		v4l2_m2m_try_schedule(ctx->m2m_ctx);
+		break;
+
+	case V4L2_ENC_CMD_START:
+		vb2_clear_last_buffer_dequeued(dst_vq);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 const struct v4l2_ioctl_ops mtk_venc_ioctl_ops = {
@@ -715,6 +792,9 @@ const struct v4l2_ioctl_ops mtk_venc_ioctl_ops = {
 
 	.vidioc_g_selection		= vidioc_venc_g_selection,
 	.vidioc_s_selection		= vidioc_venc_s_selection,
+
+	.vidioc_encoder_cmd		= vidioc_encoder_cmd,
+	.vidioc_try_encoder_cmd		= v4l2_m2m_ioctl_try_encoder_cmd,
 };
 
 static int vb2ops_venc_queue_setup(struct vb2_queue *vq,
@@ -882,9 +962,38 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
 			dst_buf->vb2_buf.planes[0].bytesused = 0;
 			v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
 		}
+		/* STREAMOFF on the CAPTURE queue completes any ongoing flush */
+		if (ctx->is_flushing) {
+			struct v4l2_m2m_buffer *b, *n;
+
+			mtk_v4l2_debug(1, "STREAMOFF called while flushing");
+			/*
+			 * STREAMOFF could be called before the flush buffer is
+			 * dequeued. Check whether empty flush buf is still in
+			 * queue before removing it.
+			 */
+			v4l2_m2m_for_each_src_buf_safe(ctx->m2m_ctx, b, n) {
+				if (b == &ctx->empty_flush_buf) {
+					v4l2_m2m_src_buf_remove_by_buf(ctx->m2m_ctx, &b->vb);
+					break;
+				}
+			}
+			ctx->is_flushing = false;
+		}
 	} else {
-		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx)))
-			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
+			if (src_buf != &ctx->empty_flush_buf.vb)
+				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+		}
+		if (ctx->is_flushing) {
+			/*
+			 * If we are in the middle of a flush, put the flush
+			 * buffer back into the queue so the next CAPTURE
+			 * buffer gets returned with the LAST flag set.
+			 */
+			v4l2_m2m_buf_queue(ctx->m2m_ctx,
+					   &ctx->empty_flush_buf.vb);
+		}
 	}
 
 	if ((q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
@@ -984,12 +1093,15 @@ static int mtk_venc_param_change(struct mtk_vcodec_ctx *ctx)
 {
 	struct venc_enc_param enc_prm;
 	struct vb2_v4l2_buffer *vb2_v4l2 = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
-	struct mtk_video_enc_buf *mtk_buf =
-			container_of(vb2_v4l2, struct mtk_video_enc_buf,
-				     m2m_buf.vb);
-
+	struct mtk_video_enc_buf *mtk_buf;
 	int ret = 0;
 
+	/* Don't upcast the empty flush buffer */
+	if (vb2_v4l2 == &ctx->empty_flush_buf.vb)
+		return 0;
+
+	mtk_buf = container_of(vb2_v4l2, struct mtk_video_enc_buf, m2m_buf.vb);
+
 	memset(&enc_prm, 0, sizeof(enc_prm));
 	if (mtk_buf->param_change == MTK_ENCODE_PARAM_NONE)
 		return 0;
@@ -1075,6 +1187,20 @@ static void mtk_venc_worker(struct work_struct *work)
 	}
 
 	src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+
+	/*
+	 * If we see the flush buffer, send an empty buffer with the LAST flag
+	 * to the client. is_flushing will be reset at the time the buffer
+	 * is dequeued.
+	 */
+	if (src_buf == &ctx->empty_flush_buf.vb) {
+		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
+		dst_buf->flags |= V4L2_BUF_FLAG_LAST;
+		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
+		v4l2_m2m_job_finish(ctx->dev->m2m_dev_enc, ctx->m2m_ctx);
+		return;
+	}
+
 	memset(&frm_buf, 0, sizeof(frm_buf));
 	for (i = 0; i < src_buf->vb2_buf.num_planes ; i++) {
 		frm_buf.fb_addr[i].dma_addr =
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 45d1870c83dd..4167e865b23f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -131,6 +131,7 @@ static int fops_vcodec_open(struct file *file)
 	struct mtk_vcodec_dev *dev = video_drvdata(file);
 	struct mtk_vcodec_ctx *ctx = NULL;
 	int ret = 0;
+	struct vb2_queue *src_vq;
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -157,13 +158,16 @@ static int fops_vcodec_open(struct file *file)
 		goto err_ctrls_setup;
 	}
 	ctx->m2m_ctx = v4l2_m2m_ctx_init(dev->m2m_dev_enc, ctx,
-				&mtk_vcodec_enc_queue_init);
+					 &mtk_vcodec_enc_queue_init);
 	if (IS_ERR((__force void *)ctx->m2m_ctx)) {
 		ret = PTR_ERR((__force void *)ctx->m2m_ctx);
 		mtk_v4l2_err("Failed to v4l2_m2m_ctx_init() (%d)",
 				ret);
 		goto err_m2m_ctx_init;
 	}
+	src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
+				 V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	ctx->empty_flush_buf.vb.vb2_buf.vb2_queue = src_vq;
 	mtk_vcodec_enc_set_default_params(ctx);
 
 	if (v4l2_fh_is_singular(&ctx->fh)) {
-- 
2.32.0.93.g670b81a890-goog

