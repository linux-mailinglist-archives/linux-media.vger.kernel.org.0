Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 400CC428091
	for <lists+linux-media@lfdr.de>; Sun, 10 Oct 2021 12:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231583AbhJJKrY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Oct 2021 06:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231435AbhJJKrX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Oct 2021 06:47:23 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31E22C061570;
        Sun, 10 Oct 2021 03:45:20 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id e3so11943322wrc.11;
        Sun, 10 Oct 2021 03:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vemhJN2zSsmO94aJp4J6LI64yj7A84fvslxbcqYE0vU=;
        b=Tazt2S8JA1NikbBTZIK6CwhX3G4Y9dj1ZQymX8M8teEFuu6RvdYnsH39KGaO5aMHmc
         vwpKim3WM4E4GjCVeRwf1+PTITUOJfis0Z3egaU+KAUE8hyfEjF9km0UudfSxs593BiB
         gzfkIYs5M/GAMzfOkwj8GDPtKoxMY0maQNSK15eiUebVPVVYbSX66ByevZPwndOJmT8I
         HjAZsLZju35Aus9koBC/WaCN1QoKZZlEJgexpTVUGkOPsLX4XBzPuphEFvmsWxyj3SFU
         ggkofU3Trx4a1WUfzCRI4TPk4RVcqnx8j1b/sKd9v+2SfNb4mGAIIaeuzikPm0fO2/M0
         7bdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vemhJN2zSsmO94aJp4J6LI64yj7A84fvslxbcqYE0vU=;
        b=CH38AjZdGfGVJGMcfg1k8yUSVr7qDuZgAqL0RSWXkXK8UBpwDqeulxeqnOW/9UBZxS
         GW/WOT6GIWvaEiTrJrmLy7a3odYyGRRF9lEJTR8E4fZQvzGq7XKgxaCUCDQ4py7Z5uUk
         K9rmqmzcCFwZUm7V2ffxCkZIPmX7J8Lh0QZ+8KVmc6SRSmrjpDgmHYUOOu9n9UU/6gZw
         4AfDn1ETlKyHRF18HC0fy88astgOT0UOgLFlrohjP9c6e5K4WB0FMHk2bClRmKEdH/Ck
         152KvyxRKBiXpY+S5Swv0t/d7W4xWJgFSg9d+hudWDvP7iorzX8opBQE8GSo3h4TQZwI
         bSCA==
X-Gm-Message-State: AOAM531xcq+UwthKGWgDPwUIwz17fsYSxEwr/3S5Xqbj6w5WyCcMOpIw
        FMP3+od6RC3npQssj/v50bA=
X-Google-Smtp-Source: ABdhPJz79MIOdOzbnEdCBc3vxz7k9Cn5abyAY2ezoI0da7DKVMkYXF38Ef2BrRfSttay8Nsmva5NAA==
X-Received: by 2002:a5d:6481:: with SMTP id o1mr17550165wri.140.1633862718759;
        Sun, 10 Oct 2021 03:45:18 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id n7sm4660863wra.37.2021.10.10.03.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 03:45:18 -0700 (PDT)
From:   Jernej Skrabec <jernej.skrabec@gmail.com>
To:     mripard@kernel.org, paul.kocialkowski@bootlin.com,
        hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, wens@csie.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2] media: cedrus: Don't kernel map most buffers
Date:   Sun, 10 Oct 2021 12:45:14 +0200
Message-Id: <20211010104514.2311284-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Except for VP8 probability coefficients buffer, all other buffers are
never accessed by CPU. That allows us to mark them with
DMA_ATTR_NO_KERNEL_MAPPING flag. This helps with decoding big (like 4k)
videos on 32-bit ARM platforms where default vmalloc size is relatively
small - 240 MiB. Since auxiliary buffer are not yet efficiently
allocated, this can be easily exceeded. Even if allocation is optimized,
4k videos will still often exceed this limit.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---

Changes from v1:
- added notes that buffers are accessed only by HW
- adjusted comment
- removed DMA_ATTR_NO_KERNEL_MAPPING flag for capture buffers
- fixed commit message

 .../staging/media/sunxi/cedrus/cedrus_h264.c  | 113 ++++++++++--------
 .../staging/media/sunxi/cedrus/cedrus_h265.c  |  30 +++--
 .../staging/media/sunxi/cedrus/cedrus_video.c |   1 +
 3 files changed, 82 insertions(+), 62 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index de7442d4834d..b4173a8926d6 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -520,6 +520,11 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
 	unsigned int mv_col_size;
 	int ret;
 
+	/*
+	 * NOTE: All buffers allocated here are only used by HW, so we
+	 * can add DMA_ATTR_NO_KERNEL_MAPPING flag when allocating them.
+	 */
+
 	/* Formula for picture buffer size is taken from CedarX source. */
 
 	if (ctx->src_fmt.width > 2048)
@@ -538,23 +543,23 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
 
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
-	 * guarantee that we'll have a CPU and DMA address aligned on
-	 * the smallest page order that is greater to the requested
-	 * size, so we don't have to overallocate.
+	 * on 16kiB as well. However, dma_alloc_attrs provides the
+	 * guarantee that we'll have a DMA address aligned on the
+	 * smallest page order that is greater to the requested size,
+	 * so we don't have to overallocate.
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
@@ -582,10 +587,11 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
 
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
@@ -600,10 +606,10 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
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
@@ -616,10 +622,10 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
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
@@ -629,24 +635,28 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
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
 
@@ -654,23 +664,28 @@ static void cedrus_h264_stop(struct cedrus_ctx *ctx)
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
index 3d9561d4aadb..8829a7bab07e 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -350,11 +350,12 @@ static void cedrus_h265_setup(struct cedrus_ctx *ctx,
 		ctx->codec.h265.mv_col_buf_size = num_buffers *
 			ctx->codec.h265.mv_col_buf_unit_size;
 
+		/* Buffer is never accessed by CPU, so we can skip kernel mapping. */
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
@@ -667,10 +668,11 @@ static int cedrus_h265_start(struct cedrus_ctx *ctx)
 	/* The buffer size is calculated at setup time. */
 	ctx->codec.h265.mv_col_buf_size = 0;
 
+	/* Buffer is never accessed by CPU, so we can skip kernel mapping. */
 	ctx->codec.h265.neighbor_info_buf =
-		dma_alloc_coherent(dev->dev, CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE,
-				   &ctx->codec.h265.neighbor_info_buf_addr,
-				   GFP_KERNEL);
+		dma_alloc_attrs(dev->dev, CEDRUS_H265_NEIGHBOR_INFO_BUF_SIZE,
+				&ctx->codec.h265.neighbor_info_buf_addr,
+				GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
 	if (!ctx->codec.h265.neighbor_info_buf)
 		return -ENOMEM;
 
@@ -682,16 +684,18 @@ static void cedrus_h265_stop(struct cedrus_ctx *ctx)
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
index 66714609b577..33726175d980 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -568,6 +568,7 @@ int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
 
 	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
 	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->dma_attrs = DMA_ATTR_NO_KERNEL_MAPPING;
 	src_vq->drv_priv = ctx;
 	src_vq->buf_struct_size = sizeof(struct cedrus_buffer);
 	src_vq->ops = &cedrus_qops;
-- 
2.33.0

