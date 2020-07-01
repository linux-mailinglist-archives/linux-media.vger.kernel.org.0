Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2906D210BF6
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 15:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730968AbgGANQw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 09:16:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730889AbgGANQd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 09:16:33 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5892BC03E979;
        Wed,  1 Jul 2020 06:16:33 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8EE582A56CE
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 4/6] hantro: Move hantro_enc_buf_finish to JPEG codec_ops.done
Date:   Wed,  1 Jul 2020 10:16:05 -0300
Message-Id: <20200701131607.121988-5-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200701131607.121988-1-ezequiel@collabora.com>
References: <20200701131607.121988-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hantro_enc_buf_finish is used only for JPEG, and so should
be moved to JPEG codec_ops.done.

This cleanup is also taking care of addressing
a subtle issue: checking the non-NULL bounce buffer
using ctx->jpeg_enc, which is a member of a union is
confusing and error-prone.

Note that the issue is currently innocuous because an
encoder context only supports JPEG.

The codec_ops.done has an argument that codec-specific code
shouldn't need, so drop that as well.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro.h         |  7 ----
 drivers/staging/media/hantro/hantro_drv.c     | 37 ++-----------------
 .../staging/media/hantro/hantro_h1_jpeg_enc.c | 17 +++++++++
 drivers/staging/media/hantro/hantro_hw.h      |  3 +-
 drivers/staging/media/hantro/rk3288_vpu_hw.c  |  1 +
 5 files changed, 24 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 2284e23d8500..65f9f7ea7dcf 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -212,9 +212,6 @@ struct hantro_dev {
  * @ctrl_handler:	Control handler used to register controls.
  * @jpeg_quality:	User-specified JPEG compression quality.
  *
- * @buf_finish:		Buffer finish. This depends on encoder or decoder
- *			context, and it's called right before
- *			calling v4l2_m2m_job_finish.
  * @codec_ops:		Set of operations related to codec mode.
  * @postproc:		Post-processing context.
  * @jpeg_enc:		JPEG-encoding context.
@@ -237,10 +234,6 @@ struct hantro_ctx {
 	struct v4l2_ctrl_handler ctrl_handler;
 	int jpeg_quality;
 
-	int (*buf_finish)(struct hantro_ctx *ctx,
-			  struct vb2_buffer *buf,
-			  unsigned int bytesused);
-
 	const struct hantro_codec_ops *codec_ops;
 	struct hantro_postproc_ctx postproc;
 
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 9145d02e5d3c..88b5c5989d83 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -56,37 +56,12 @@ dma_addr_t hantro_get_ref(struct hantro_ctx *ctx, u64 ts)
 	return hantro_get_dec_buf_addr(ctx, buf);
 }
 
-static int
-hantro_enc_buf_finish(struct hantro_ctx *ctx, struct vb2_buffer *buf,
-		      unsigned int bytesused)
-{
-	size_t avail_size;
-
-	avail_size = vb2_plane_size(buf, 0) - ctx->vpu_dst_fmt->header_size;
-	if (bytesused > avail_size)
-		return -EINVAL;
-	/*
-	 * The bounce buffer is only for the JPEG encoder.
-	 * TODO: Rework the JPEG encoder to eliminate the need
-	 * for a bounce buffer.
-	 */
-	if (ctx->jpeg_enc.bounce_buffer.cpu) {
-		memcpy(vb2_plane_vaddr(buf, 0) +
-		       ctx->vpu_dst_fmt->header_size,
-		       ctx->jpeg_enc.bounce_buffer.cpu, bytesused);
-	}
-	buf->planes[0].bytesused =
-		ctx->vpu_dst_fmt->header_size + bytesused;
-	return 0;
-}
-
 static void hantro_job_finish(struct hantro_dev *vpu,
 			      struct hantro_ctx *ctx,
 			      unsigned int bytesused,
 			      enum vb2_buffer_state result)
 {
 	struct vb2_v4l2_buffer *src, *dst;
-	int ret;
 
 	pm_runtime_mark_last_busy(vpu->dev);
 	pm_runtime_put_autosuspend(vpu->dev);
@@ -103,12 +78,6 @@ static void hantro_job_finish(struct hantro_dev *vpu,
 	src->sequence = ctx->sequence_out++;
 	dst->sequence = ctx->sequence_cap++;
 
-	if (ctx->buf_finish) {
-		ret = ctx->buf_finish(ctx, &dst->vb2_buf, bytesused);
-		if (ret)
-			result = VB2_BUF_STATE_ERROR;
-	}
-
 	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx,
 					 result);
 }
@@ -124,8 +93,11 @@ void hantro_irq_done(struct hantro_dev *vpu, unsigned int bytesused,
 	 * the timeout expired. The watchdog is running,
 	 * and will take care of finishing the job.
 	 */
-	if (cancel_delayed_work(&vpu->watchdog_work))
+	if (cancel_delayed_work(&vpu->watchdog_work)) {
+		if (result == VB2_BUF_STATE_DONE && ctx->codec_ops->done)
+			ctx->codec_ops->done(ctx);
 		hantro_job_finish(vpu, ctx, bytesused, result);
+	}
 }
 
 void hantro_watchdog(struct work_struct *work)
@@ -414,7 +386,6 @@ static int hantro_open(struct file *filp)
 	ctx->dev = vpu;
 	if (func->id == MEDIA_ENT_F_PROC_VIDEO_ENCODER) {
 		allowed_codecs = vpu->variant->codec & HANTRO_ENCODERS;
-		ctx->buf_finish = hantro_enc_buf_finish;
 		ctx->is_encoder = true;
 	} else if (func->id == MEDIA_ENT_F_PROC_VIDEO_DECODER) {
 		allowed_codecs = vpu->variant->codec & HANTRO_DECODERS;
diff --git a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
index b22418436823..b88dc4ed06db 100644
--- a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
+++ b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
@@ -137,3 +137,20 @@ void hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx)
 
 	vepu_write(vpu, reg, H1_REG_ENC_CTRL);
 }
+
+void hantro_jpeg_enc_done(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	u32 bytesused = vepu_read(vpu, H1_REG_STR_BUF_LIMIT) / 8;
+	struct vb2_v4l2_buffer *dst_buf = hantro_get_dst_buf(ctx);
+
+	/*
+	 * TODO: Rework the JPEG encoder to eliminate the need
+	 * for a bounce buffer.
+	 */
+	memcpy(vb2_plane_vaddr(&dst_buf->vb2_buf, 0) +
+	       ctx->vpu_dst_fmt->header_size,
+	       ctx->jpeg_enc.bounce_buffer.cpu, bytesused);
+	vb2_set_plane_payload(&dst_buf->vb2_buf, 0,
+			      ctx->vpu_dst_fmt->header_size + bytesused);
+}
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 4053d8710e04..2d6323cd6732 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -138,7 +138,7 @@ struct hantro_codec_ops {
 	int (*init)(struct hantro_ctx *ctx);
 	void (*exit)(struct hantro_ctx *ctx);
 	void (*run)(struct hantro_ctx *ctx);
-	void (*done)(struct hantro_ctx *ctx, enum vb2_buffer_state);
+	void (*done)(struct hantro_ctx *ctx);
 	void (*reset)(struct hantro_ctx *ctx);
 };
 
@@ -172,6 +172,7 @@ void hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx);
 void rk3399_vpu_jpeg_enc_run(struct hantro_ctx *ctx);
 int hantro_jpeg_enc_init(struct hantro_ctx *ctx);
 void hantro_jpeg_enc_exit(struct hantro_ctx *ctx);
+void hantro_jpeg_enc_done(struct hantro_ctx *ctx);
 
 dma_addr_t hantro_h264_get_ref_buf(struct hantro_ctx *ctx,
 				   unsigned int dpb_idx);
diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
index 2f914b37b9e5..b1cf2abb972f 100644
--- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
@@ -180,6 +180,7 @@ static const struct hantro_codec_ops rk3288_vpu_codec_ops[] = {
 		.run = hantro_h1_jpeg_enc_run,
 		.reset = rk3288_vpu_enc_reset,
 		.init = hantro_jpeg_enc_init,
+		.done = hantro_jpeg_enc_done,
 		.exit = hantro_jpeg_enc_exit,
 	},
 	[HANTRO_MODE_H264_DEC] = {
-- 
2.26.0.rc2

