Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 915D07A05C3
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 15:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239107AbjINNeA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 09:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239167AbjINNds (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 09:33:48 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62AED1FE5;
        Thu, 14 Sep 2023 06:33:39 -0700 (PDT)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E4E266607368;
        Thu, 14 Sep 2023 14:33:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1694698418;
        bh=Wle9dqOqtE6Ngu/V1SgSMthhf7eaexlar0GwhzoB7nI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JDL4k3LYmy/1q61V9lvgRlSt5QE0PV3WlFNablvY/AVXaRoDNYA6XXOrHzJX/mNyG
         eqcsEzm9UKW11zzw72eZ+A365oBhO3GaMe0m0h/bcNp5OAyNvrYsiFrLKJ0rGLYUTg
         roEZYBFaESKrLEx+LoshPo5/N21VLMc4TB2rLI8smBjQha/SpOYTZAG2Q+5QyvM+2/
         sdE5zIAYGuFuppWDpjwyVWaACeV4getr4STV2Kbxh5XkSg3krEOvqxaQGslNpreO+0
         j8tA0FDMDkFzNDu+MGmrhX8Io6hdStV/exZm3s+79PMR0iKBezeGm5GsUzN/eSTZsd
         /qa+v4mxmQISA==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
        ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v7 13/49] media: verisilicon: Refactor postprocessor to store more buffers
Date:   Thu, 14 Sep 2023 15:32:47 +0200
Message-Id: <20230914133323.198857-14-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since vb2 queue can store than VB2_MAX_FRAME buffers postprocessor
buffer storage must be capable to store more buffers too.
Change static dec_q array to allocated array to be capable to store
up to queue 'max_allowed_buffers'.
Keep allocating queue 'num_buffers' at queue setup time but also allows
to allocate postprocessors buffers on the fly.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/verisilicon/hantro.h   |  7 +-
 .../media/platform/verisilicon/hantro_drv.c   |  4 +-
 .../media/platform/verisilicon/hantro_hw.h    |  4 +-
 .../platform/verisilicon/hantro_postproc.c    | 93 +++++++++++++++----
 .../media/platform/verisilicon/hantro_v4l2.c  |  2 +-
 5 files changed, 85 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 77aee9489516..0948b04a9f8d 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -469,11 +469,14 @@ hantro_get_dst_buf(struct hantro_ctx *ctx)
 bool hantro_needs_postproc(const struct hantro_ctx *ctx,
 			   const struct hantro_fmt *fmt);
 
+dma_addr_t
+hantro_postproc_get_dec_buf_addr(struct hantro_ctx *ctx, int index);
+
 static inline dma_addr_t
 hantro_get_dec_buf_addr(struct hantro_ctx *ctx, struct vb2_buffer *vb)
 {
 	if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt))
-		return ctx->postproc.dec_q[vb->index].dma;
+		return hantro_postproc_get_dec_buf_addr(ctx, vb->index);
 	return vb2_dma_contig_plane_dma_addr(vb, 0);
 }
 
@@ -485,8 +488,8 @@ vb2_to_hantro_decoded_buf(struct vb2_buffer *buf)
 
 void hantro_postproc_disable(struct hantro_ctx *ctx);
 void hantro_postproc_enable(struct hantro_ctx *ctx);
+int hantro_postproc_init(struct hantro_ctx *ctx);
 void hantro_postproc_free(struct hantro_ctx *ctx);
-int hantro_postproc_alloc(struct hantro_ctx *ctx);
 int hanto_postproc_enum_framesizes(struct hantro_ctx *ctx,
 				   struct v4l2_frmsizeenum *fsize);
 
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 423fc85d79ee..18f56edee3fc 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -234,8 +234,10 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	 * The Kernel needs access to the JPEG destination buffer for the
 	 * JPEG encoder to fill in the JPEG headers.
 	 */
-	if (!ctx->is_encoder)
+	if (!ctx->is_encoder) {
 		dst_vq->dma_attrs |= DMA_ATTR_NO_KERNEL_MAPPING;
+		dst_vq->max_allowed_buffers = MAX_POSTPROC_BUFFERS;
+	}
 
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index 7f33f7b07ce4..292a76ef643e 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -40,6 +40,8 @@
 
 #define AV1_MAX_FRAME_BUF_COUNT	(V4L2_AV1_TOTAL_REFS_PER_FRAME + 1)
 
+#define MAX_POSTPROC_BUFFERS	64
+
 struct hantro_dev;
 struct hantro_ctx;
 struct hantro_buf;
@@ -336,7 +338,7 @@ struct hantro_av1_dec_hw_ctx {
  * @dec_q:		References buffers, in decoder format.
  */
 struct hantro_postproc_ctx {
-	struct hantro_aux_buf dec_q[VB2_MAX_FRAME];
+	struct hantro_aux_buf dec_q[MAX_POSTPROC_BUFFERS];
 };
 
 /**
diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
index 0224ff68ab3f..e624cd98f41b 100644
--- a/drivers/media/platform/verisilicon/hantro_postproc.c
+++ b/drivers/media/platform/verisilicon/hantro_postproc.c
@@ -177,9 +177,11 @@ static int hantro_postproc_g2_enum_framesizes(struct hantro_ctx *ctx,
 void hantro_postproc_free(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
+	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
+	struct vb2_queue *queue = &m2m_ctx->cap_q_ctx.q;
 	unsigned int i;
 
-	for (i = 0; i < VB2_MAX_FRAME; ++i) {
+	for (i = 0; i < queue->max_allowed_buffers; ++i) {
 		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
 
 		if (priv->cpu) {
@@ -190,20 +192,17 @@ void hantro_postproc_free(struct hantro_ctx *ctx)
 	}
 }
 
-int hantro_postproc_alloc(struct hantro_ctx *ctx)
+static unsigned int hantro_postproc_buffer_size(struct hantro_ctx *ctx)
 {
-	struct hantro_dev *vpu = ctx->dev;
-	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
-	struct vb2_queue *cap_queue = &m2m_ctx->cap_q_ctx.q;
-	unsigned int num_buffers = cap_queue->num_buffers;
 	struct v4l2_pix_format_mplane pix_mp;
 	const struct hantro_fmt *fmt;
-	unsigned int i, buf_size;
+	unsigned int buf_size;
 
 	/* this should always pick native format */
 	fmt = hantro_get_default_fmt(ctx, false, ctx->bit_depth, HANTRO_AUTO_POSTPROC);
 	if (!fmt)
-		return -EINVAL;
+		return 0;
+
 	v4l2_fill_pixfmt_mp(&pix_mp, fmt->fourcc, ctx->src_fmt.width,
 			    ctx->src_fmt.height);
 
@@ -221,23 +220,77 @@ int hantro_postproc_alloc(struct hantro_ctx *ctx)
 		buf_size += hantro_av1_mv_size(pix_mp.width,
 					       pix_mp.height);
 
-	for (i = 0; i < num_buffers; ++i) {
-		struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
+	return buf_size;
+}
+
+static int hantro_postproc_alloc(struct hantro_ctx *ctx, int index)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct hantro_aux_buf *priv = &ctx->postproc.dec_q[index];
+	unsigned int buf_size = hantro_postproc_buffer_size(ctx);
+
+	if (!buf_size)
+		return -EINVAL;
+
+	/*
+	 * The buffers on this queue are meant as intermediate
+	 * buffers for the decoder, so no mapping is needed.
+	 */
+	priv->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
+	priv->cpu = dma_alloc_attrs(vpu->dev, buf_size, &priv->dma,
+				    GFP_KERNEL, priv->attrs);
+	if (!priv->cpu)
+		return -ENOMEM;
+	priv->size = buf_size;
+
+	return 0;
+}
 
-		/*
-		 * The buffers on this queue are meant as intermediate
-		 * buffers for the decoder, so no mapping is needed.
-		 */
-		priv->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
-		priv->cpu = dma_alloc_attrs(vpu->dev, buf_size, &priv->dma,
-					    GFP_KERNEL, priv->attrs);
-		if (!priv->cpu)
-			return -ENOMEM;
-		priv->size = buf_size;
+int hantro_postproc_init(struct hantro_ctx *ctx)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
+	struct vb2_queue *cap_queue = &m2m_ctx->cap_q_ctx.q;
+	unsigned int num_buffers = cap_queue->num_buffers;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_buffers; i++) {
+		ret = hantro_postproc_alloc(ctx, i);
+		if (ret)
+			return ret;
 	}
+
 	return 0;
 }
 
+dma_addr_t
+hantro_postproc_get_dec_buf_addr(struct hantro_ctx *ctx, int index)
+{
+	struct hantro_aux_buf *priv = &ctx->postproc.dec_q[index];
+	unsigned int buf_size = hantro_postproc_buffer_size(ctx);
+	struct hantro_dev *vpu = ctx->dev;
+	int ret;
+
+	if (priv->size < buf_size && priv->cpu) {
+		/* buffer is too small, release it */
+		dma_free_attrs(vpu->dev, priv->size, priv->cpu,
+			       priv->dma, priv->attrs);
+		priv->cpu = NULL;
+	}
+
+	if (!priv->cpu) {
+		/* buffer not already allocated, try getting a new one */
+		ret = hantro_postproc_alloc(ctx, index);
+		if (ret)
+			return 0;
+	}
+
+	if (!priv->cpu)
+		return 0;
+
+	return priv->dma;
+}
+
 static void hantro_postproc_g1_disable(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index b3ae037a50f6..f0d8b165abcd 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -933,7 +933,7 @@ static int hantro_start_streaming(struct vb2_queue *q, unsigned int count)
 		}
 
 		if (hantro_needs_postproc(ctx, ctx->vpu_dst_fmt)) {
-			ret = hantro_postproc_alloc(ctx);
+			ret = hantro_postproc_init(ctx);
 			if (ret)
 				goto err_codec_exit;
 		}
-- 
2.39.2

