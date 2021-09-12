Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44969407C02
	for <lists+linux-media@lfdr.de>; Sun, 12 Sep 2021 08:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbhILGJh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Sep 2021 02:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhILGJc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Sep 2021 02:09:32 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9759EC061574;
        Sat, 11 Sep 2021 23:08:17 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id x6so9178638wrv.13;
        Sat, 11 Sep 2021 23:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2b0QQQ7CPhwoViMwtx6MrWV4wVLkUJmIGI9NDCIwvDE=;
        b=OlUEupp7syy5KY2hw6eif8AyPbJUMvDQNBxUlwBc9o9p3pntfnn8uaig0FUND3uJuv
         M9XPlp9HWO5DXnI+TBYtC6tr4Asd0OVaPi9gBljKoNZKCIPsgFaUOKtv7DYD08cHDZ+X
         FnfLdILDlWvKZqaS4MmOZnvpwKjjI0EIaT21Pv2wWv3JmeIsrPm3sTb6fZvnm5F7+2VP
         jk7YW4eh9JsU+EBqZoNdBP6prLHSdlPIKe8MPIoCejJjFcRup78vNCUU6y1ChSmdm6xJ
         XHpMaf4e+pclnLmH33twYWW+xp5QeXFfjRPJKw2g/0vT4iYOQqoGyvTguiL/K+Y91Av5
         o5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2b0QQQ7CPhwoViMwtx6MrWV4wVLkUJmIGI9NDCIwvDE=;
        b=S1oDLhCOu5xl/Li3V37c4ve9/Hx6vFaPWW1mmpofcG6SI5+dvDEELF/qp+lcCM9bWh
         jNSDL4gNGdPYtH0IRrO36fk/ttOh+PVXFF1wGYJMK7ZvCodVTp0/bHFTMjQMopP6Gbg6
         MrwNCbMUzbB94W+A4kx8IIZtPHAM4/xh3DIreU/Ocfo/GBnzrHHMZoJfCVgLfGEcFHUA
         hOJt3Rhq1Ty/5xqfUGzVDXBlH9mXFZUICmLd/DVG4AMGQMX8Mb0WI7KdRo/ppcrhf7eL
         9PM01dshwiafsJO68jltH2U1Ec+Q8pGYupvGFn3B1in8H6XOiGOnQz+Vg4aYKfhpPdgw
         yEVA==
X-Gm-Message-State: AOAM531yiqzwOAKLU9BrgFrsqQ/uxlMb5qhScz+0NdHPrIeQWYArL00D
        M4mtystl/nmLMZtxx5iAAgM=
X-Google-Smtp-Source: ABdhPJwC0ICL2AIM5cFZkPLZVmihz5W3Zbe9NIPxet1PtO4HEcnsyLctFyOwtX4KkPw6n6TtNhwXpA==
X-Received: by 2002:adf:fe82:: with SMTP id l2mr1004661wrr.268.1631426896210;
        Sat, 11 Sep 2021 23:08:16 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id s7sm3545150wra.75.2021.09.11.23.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 23:08:15 -0700 (PDT)
From:   Jernej Skrabec <jernej.skrabec@gmail.com>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com
Cc:     wens@csie.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] media: cedrus: Don't kernel map most buffers
Date:   Sun, 12 Sep 2021 08:08:12 +0200
Message-Id: <20210912060812.222996-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Except VP8 probability coefficients buffer, all other buffers are never
accessed by CPU. That allows us to mark them with DMA_ATTR_NO_KERNEL_MAPPING
flag. This helps with decoding big (like 4k) videos on 32-bit ARM
platforms where default vmalloc size is relatively small - 240 MiB.
Since auxiliary buffer are not yet efficiently allocated, this can be
easily exceeded. Even if allocation is optimized, 4k videos will still
often exceed this limit.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 102 ++++++++++--------
 .../staging/media/sunxi/cedrus/cedrus_h265.c  |  28 ++---
 .../staging/media/sunxi/cedrus/cedrus_video.c |   2 +
 3 files changed, 73 insertions(+), 59 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index de7442d4834d..6e38b37d9fe1 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -538,23 +538,23 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
 
 	ctx->codec.h264.pic_info_buf_size = pic_info_size;
 	ctx->codec.h264.pic_info_buf =
-		dma_alloc_coherent(dev->dev, ctx->codec.h264.pic_info_buf_size,
-				   &ctx->codec.h264.pic_info_buf_dma,
-				   GFP_KERNEL);
+		dma_alloc_attrs(dev->dev, ctx->codec.h264.pic_info_buf_size,
+				&ctx->codec.h264.pic_info_buf_dma,
+				GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
 	if (!ctx->codec.h264.pic_info_buf)
 		return -ENOMEM;
 
 	/*
 	 * That buffer is supposed to be 16kiB in size, and be aligned
-	 * on 16kiB as well. However, dma_alloc_coherent provides the
+	 * on 16kiB as well. However, dma_alloc_attrs provides the
 	 * guarantee that we'll have a CPU and DMA address aligned on
 	 * the smallest page order that is greater to the requested
 	 * size, so we don't have to overallocate.
 	 */
 	ctx->codec.h264.neighbor_info_buf =
-		dma_alloc_coherent(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
-				   &ctx->codec.h264.neighbor_info_buf_dma,
-				   GFP_KERNEL);
+		dma_alloc_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
+				&ctx->codec.h264.neighbor_info_buf_dma,
+				GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
 	if (!ctx->codec.h264.neighbor_info_buf) {
 		ret = -ENOMEM;
 		goto err_pic_buf;
@@ -582,10 +582,11 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
 
 	mv_col_size = field_size * 2 * CEDRUS_H264_FRAME_NUM;
 	ctx->codec.h264.mv_col_buf_size = mv_col_size;
-	ctx->codec.h264.mv_col_buf = dma_alloc_coherent(dev->dev,
-							ctx->codec.h264.mv_col_buf_size,
-							&ctx->codec.h264.mv_col_buf_dma,
-							GFP_KERNEL);
+	ctx->codec.h264.mv_col_buf =
+		dma_alloc_attrs(dev->dev,
+				ctx->codec.h264.mv_col_buf_size,
+				&ctx->codec.h264.mv_col_buf_dma,
+				GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
 	if (!ctx->codec.h264.mv_col_buf) {
 		ret = -ENOMEM;
 		goto err_neighbor_buf;
@@ -600,10 +601,10 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
 		ctx->codec.h264.deblk_buf_size =
 			ALIGN(ctx->src_fmt.width, 32) * 12;
 		ctx->codec.h264.deblk_buf =
-			dma_alloc_coherent(dev->dev,
-					   ctx->codec.h264.deblk_buf_size,
-					   &ctx->codec.h264.deblk_buf_dma,
-					   GFP_KERNEL);
+			dma_alloc_attrs(dev->dev,
+					ctx->codec.h264.deblk_buf_size,
+					&ctx->codec.h264.deblk_buf_dma,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
 		if (!ctx->codec.h264.deblk_buf) {
 			ret = -ENOMEM;
 			goto err_mv_col_buf;
@@ -616,10 +617,10 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
 		ctx->codec.h264.intra_pred_buf_size =
 			ALIGN(ctx->src_fmt.width, 64) * 5 * 2;
 		ctx->codec.h264.intra_pred_buf =
-			dma_alloc_coherent(dev->dev,
-					   ctx->codec.h264.intra_pred_buf_size,
-					   &ctx->codec.h264.intra_pred_buf_dma,
-					   GFP_KERNEL);
+			dma_alloc_attrs(dev->dev,
+					ctx->codec.h264.intra_pred_buf_size,
+					&ctx->codec.h264.intra_pred_buf_dma,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
 		if (!ctx->codec.h264.intra_pred_buf) {
 			ret = -ENOMEM;
 			goto err_deblk_buf;
@@ -629,24 +630,28 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
 	return 0;
 
 err_deblk_buf:
-	dma_free_coherent(dev->dev, ctx->codec.h264.deblk_buf_size,
-			  ctx->codec.h264.deblk_buf,
-			  ctx->codec.h264.deblk_buf_dma);
+	dma_free_attrs(dev->dev, ctx->codec.h264.deblk_buf_size,
+		       ctx->codec.h264.deblk_buf,
+		       ctx->codec.h264.deblk_buf_dma,
+		       DMA_ATTR_NO_KERNEL_MAPPING);
 
 err_mv_col_buf:
-	dma_free_coherent(dev->dev, ctx->codec.h264.mv_col_buf_size,
-			  ctx->codec.h264.mv_col_buf,
-			  ctx->codec.h264.mv_col_buf_dma);
+	dma_free_attrs(dev->dev, ctx->codec.h264.mv_col_buf_size,
+		       ctx->codec.h264.mv_col_buf,
+		       ctx->codec.h264.mv_col_buf_dma,
+		       DMA_ATTR_NO_KERNEL_MAPPING);
 
 err_neighbor_buf:
-	dma_free_coherent(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
-			  ctx->codec.h264.neighbor_info_buf,
-			  ctx->codec.h264.neighbor_info_buf_dma);
+	dma_free_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
+		       ctx->codec.h264.neighbor_info_buf,
+		       ctx->codec.h264.neighbor_info_buf_dma,
+		       DMA_ATTR_NO_KERNEL_MAPPING);
 
 err_pic_buf:
-	dma_free_coherent(dev->dev, ctx->codec.h264.pic_info_buf_size,
-			  ctx->codec.h264.pic_info_buf,
-			  ctx->codec.h264.pic_info_buf_dma);
+	dma_free_attrs(dev->dev, ctx->codec.h264.pic_info_buf_size,
+		       ctx->codec.h264.pic_info_buf,
+		       ctx->codec.h264.pic_info_buf_dma,
+		       DMA_ATTR_NO_KERNEL_MAPPING);
 	return ret;
 }
 
@@ -654,23 +659,28 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
 {
 	struct cedrus_dev *dev = ctx->dev;
 
-	dma_free_coherent(dev->dev, ctx->codec.h264.mv_col_buf_size,
-			  ctx->codec.h264.mv_col_buf,
-			  ctx->codec.h264.mv_col_buf_dma);
-	dma_free_coherent(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
-			  ctx->codec.h264.neighbor_info_buf,
-			  ctx->codec.h264.neighbor_info_buf_dma);
-	dma_free_coherent(dev->dev, ctx->codec.h264.pic_info_buf_size,
-			  ctx->codec.h264.pic_info_buf,
-			  ctx->codec.h264.pic_info_buf_dma);
+	dma_free_attrs(dev->dev, ctx->codec.h264.mv_col_buf_size,
+		       ctx->codec.h264.mv_col_buf,
+		       ctx->codec.h264.mv_col_buf_dma,
+		       DMA_ATTR_NO_KERNEL_MAPPING);
+	dma_free_attrs(dev->dev, CEDRUS_NEIGHBOR_INFO_BUF_SIZE,
+		       ctx->codec.h264.neighbor_info_buf,
+		       ctx->codec.h264.neighbor_info_buf_dma,
+		       DMA_ATTR_NO_KERNEL_MAPPING);
+	dma_free_attrs(dev->dev, ctx->codec.h264.pic_info_buf_size,
+		       ctx->codec.h264.pic_info_buf,
+		       ctx->codec.h264.pic_info_buf_dma,
+		       DMA_ATTR_NO_KERNEL_MAPPING);
 	if (ctx->codec.h264.deblk_buf_size)
-		dma_free_coherent(dev->dev, ctx->codec.h264.deblk_buf_size,
-				  ctx->codec.h264.deblk_buf,
-				  ctx->codec.h264.deblk_buf_dma);
+		dma_free_attrs(dev->dev, ctx->codec.h264.deblk_buf_size,
+			       ctx->codec.h264.deblk_buf,
+			       ctx->codec.h264.deblk_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
 	if (ctx->codec.h264.intra_pred_buf_size)
-		dma_free_coherent(dev->dev, ctx->codec.h264.intra_pred_buf_size,
-				  ctx->codec.h264.intra_pred_buf,
-				  ctx->codec.h264.intra_pred_buf_dma);
+		dma_free_attrs(dev->dev, ctx->codec.h264.intra_pred_buf_size,
+			       ctx->codec.h264.intra_pred_buf,
+			       ctx->codec.h264.intra_pred_buf_dma,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
 }
 
 static void cedrus_h264_trigger(struct cedrus_ctx *ctx)
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 3d9561d4aadb..bb7eb56106c5 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -351,10 +351,10 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 			ctx->codec.h265.mv_col_buf_unit_size;
 
 		ctx->codec.h265.mv_col_buf =
-			dma_alloc_coherent(dev->dev,
-					   ctx->codec.h265.mv_col_buf_size,
-					   &ctx->codec.h265.mv_col_buf_addr,
-					   GFP_KERNEL);
+			dma_alloc_attrs(dev->dev,
+					ctx->codec.h265.mv_col_buf_size,
+					&ctx->codec.h265.mv_col_buf_addr,
+					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
 		if (!ctx->codec.h265.mv_col_buf) {
 			ctx->codec.h265.mv_col_buf_size = 0;
 			// TODO: Abort the process here.
@@ -668,9 +668,9 @@ static int cedrus_h265_start(struct cedrus_ctx *ctx)
 	ctx->codec.h265.mv_col_buf_size = 0;
 
 	ctx->codec.h265.neighbor_info_buf =
-		dma_alloc_coherent(dev->dev, CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE,
-				   &ctx->codec.h265.neighbor_info_buf_addr,
-				   GFP_KERNEL);
+		dma_alloc_attrs(dev->dev, CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE,
+				&ctx->codec.h265.neighbor_info_buf_addr,
+				GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
 	if (!ctx->codec.h265.neighbor_info_buf)
 		return -ENOMEM;
 
@@ -682,16 +682,18 @@ static void cedrus_h265_stop(struct cedrus_ctx *ctx)
 	struct cedrus_dev *dev = ctx->dev;
 
 	if (ctx->codec.h265.mv_col_buf_size > 0) {
-		dma_free_coherent(dev->dev, ctx->codec.h265.mv_col_buf_size,
-				  ctx->codec.h265.mv_col_buf,
-				  ctx->codec.h265.mv_col_buf_addr);
+		dma_free_attrs(dev->dev, ctx->codec.h265.mv_col_buf_size,
+			       ctx->codec.h265.mv_col_buf,
+			       ctx->codec.h265.mv_col_buf_addr,
+			       DMA_ATTR_NO_KERNEL_MAPPING);
 
 		ctx->codec.h265.mv_col_buf_size = 0;
 	}
 
-	dma_free_coherent(dev->dev, CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE,
-			  ctx->codec.h265.neighbor_info_buf,
-			  ctx->codec.h265.neighbor_info_buf_addr);
+	dma_free_attrs(dev->dev, CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE,
+		       ctx->codec.h265.neighbor_info_buf,
+		       ctx->codec.h265.neighbor_info_buf_addr,
+		       DMA_ATTR_NO_KERNEL_MAPPING);
 }
 
 static void cedrus_h265_trigger(struct cedrus_ctx *ctx)
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 66714609b577..800ffa5382de 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -568,6 +568,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
 
 	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
 	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->dma_attrs = DMA_ATTR_NO_KERNEL_MAPPING;
 	src_vq->drv_priv = ctx;
 	src_vq->buf_struct_size = sizeof(struct cedrus_buffer);
 	src_vq->ops = &cedrus_qops;
@@ -584,6 +585,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
 
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->dma_attrs = DMA_ATTR_NO_KERNEL_MAPPING;
 	dst_vq->drv_priv = ctx;
 	dst_vq->buf_struct_size = sizeof(struct cedrus_buffer);
 	dst_vq->ops = &cedrus_qops;
-- 
2.33.0

