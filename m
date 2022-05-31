Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1DCD539872
	for <lists+linux-media@lfdr.de>; Tue, 31 May 2022 23:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347889AbiEaVKw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 May 2022 17:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347896AbiEaVKv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 May 2022 17:10:51 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B7699D05A
        for <linux-media@vger.kernel.org>; Tue, 31 May 2022 14:10:49 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id s23so15448877iog.13
        for <linux-media@vger.kernel.org>; Tue, 31 May 2022 14:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=O0+eF24QMJ93ftKZNB/2JIXjYnbcK4AFsyPYyn6cJq0=;
        b=L83vl6ILs/aoHtAz3HpANQvVFbnBxaWnrdqi3elnDUHkMo3nsllneNSatBoB0ReStW
         b8lKYCGecFKLPX14z8ELkzzuBcmz4AKDAtOgQEWAQyxNnLUwPIFerMwnnNbfofCnD+69
         nRm09TLv4CL5jr9cwpSIZE2g61Z2sRLriD63c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=O0+eF24QMJ93ftKZNB/2JIXjYnbcK4AFsyPYyn6cJq0=;
        b=R49BXOGmpFFB0QzRU4n4E87wc00SqPu1n8W5MUKl2rZu8mh++4FogRd7X1za4F/n5V
         SNfajZChjhVb0jfjoMuuq8nlQBSp8V1CWpm5t9Mfe4thUCn+3ElEZutQrNVmogu/nVyb
         Kfdwty9mQ0qneorhKPUUhP0ErsYbtb3U2g+wgAfgMjPpZEsHgpWgseGsA5y7BNGyT95E
         i2ljypAka/mFKKKRHB3c6qq4geDhh9S8Ara4/G62kw+ID+RvXm2GJNkELNHXsfV76JSl
         P6qB/ROQgu95wzug/ZByBrD2F6628cP/TAdU4kPhCmnUXoDEt+vbTDKhUz+SERPxlTov
         tMxQ==
X-Gm-Message-State: AOAM532kyFWml7gnEaASsew2YTgflIPXPX5HSF/oorE/NIy0YGe6Y/KH
        St5Pk+VR3xrO0cV2ytpjzIHDjEo7Oqx2ghQnHNtXm8AknoPJpQ==
X-Google-Smtp-Source: ABdhPJydcYBOmgicxjck0uPbAygNEQa9fBl7VUBvXIbM1RHcynUiscCzBhshxGLwAIJTsf9iYujs0c3nX4OYb7t3W5c=
X-Received: by 2002:a05:6638:3f06:b0:32e:cd19:dff3 with SMTP id
 ck6-20020a0566383f0600b0032ecd19dff3mr22729610jab.162.1654031448090; Tue, 31
 May 2022 14:10:48 -0700 (PDT)
MIME-Version: 1.0
From:   Justin Green <greenjustin@chromium.org>
Date:   Tue, 31 May 2022 17:10:37 -0400
Message-ID: <CAHC42RegxBFjqMwR2gv8EwqE0FG+oS7QA9rcopapktf7tD_y-g@mail.gmail.com>
Subject: [PATCH] mediatek/vcodec: Enable incoherent buffer allocation
To:     linux-media@vger.kernel.org
Cc:     "tiffany.lin@mediatek.com" <tiffany.lin@mediatek.com>,
        "andrew-ct.chen@mediatek.com" <andrew-ct.chen@mediatek.com>,
        mchehab@kernel.org,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set allow_cache_hints to 1 for the vb2_queue source and destination queues
in the mediatek vcodec V4L2 driver. This allows us to allocate buffers
with the V4L2_MEMORY_FLAG_NON_COHERENT set. On Mediatek SoCs, this enables
caching for this memory, which vastly improves performance when being read
from CPU. Read performance for these buffers is in turn important for
detiling MM21 video frames in software.

This change should be safe from race conditions since videobuf2 already
invalidates or flushes the appropriate cache lines in its prepare() and
finish() methods.

Tested on a MT8183 SoC. Resulted in both correct detiling and a 10X
speedup.

Signed-off-by: Justin Green <greenjustin@chromium.org>
---
 .../platform/mediatek/vcodec/mtk_vcodec_dec.c | 38 ++++++++++---------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 52e5d36aa912..f093aa715e1f 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -929,30 +929,32 @@ int mtk_vcodec_dec_queue_init(void *priv, struct
vb2_queue *src_vq,

  mtk_v4l2_debug(3, "[%d]", ctx->id);

- src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
- src_vq->io_modes = VB2_DMABUF | VB2_MMAP;
- src_vq->drv_priv = ctx;
- src_vq->buf_struct_size = sizeof(struct mtk_video_dec_buf);
- src_vq->ops = ctx->dev->vdec_pdata->vdec_vb2_ops;
- src_vq->mem_ops = &vb2_dma_contig_memops;
- src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
- src_vq->lock = &ctx->dev->dev_mutex;
- src_vq->dev             = &ctx->dev->plat_dev->dev;
+ src_vq->type   = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+ src_vq->io_modes   = VB2_DMABUF | VB2_MMAP;
+ src_vq->drv_priv   = ctx;
+ src_vq->buf_struct_size   = sizeof(struct mtk_video_dec_buf);
+ src_vq->ops   = ctx->dev->vdec_pdata->vdec_vb2_ops;
+ src_vq->mem_ops   = &vb2_dma_contig_memops;
+ src_vq->timestamp_flags   = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+ src_vq->lock   = &ctx->dev->dev_mutex;
+ src_vq->dev               = &ctx->dev->plat_dev->dev;
+ src_vq->allow_cache_hints = 1;

  ret = vb2_queue_init(src_vq);
  if (ret) {
  mtk_v4l2_err("Failed to initialize videobuf2 queue(output)");
  return ret;
  }
- dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
- dst_vq->io_modes = VB2_DMABUF | VB2_MMAP;
- dst_vq->drv_priv = ctx;
- dst_vq->buf_struct_size = sizeof(struct mtk_video_dec_buf);
- dst_vq->ops = ctx->dev->vdec_pdata->vdec_vb2_ops;
- dst_vq->mem_ops = &vb2_dma_contig_memops;
- dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
- dst_vq->lock = &ctx->dev->dev_mutex;
- dst_vq->dev             = &ctx->dev->plat_dev->dev;
+ dst_vq->type   = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+ dst_vq->io_modes   = VB2_DMABUF | VB2_MMAP;
+ dst_vq->drv_priv   = ctx;
+ dst_vq->buf_struct_size   = sizeof(struct mtk_video_dec_buf);
+ dst_vq->ops   = ctx->dev->vdec_pdata->vdec_vb2_ops;
+ dst_vq->mem_ops   = &vb2_dma_contig_memops;
+ dst_vq->timestamp_flags   = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+ dst_vq->lock   = &ctx->dev->dev_mutex;
+ dst_vq->dev               = &ctx->dev->plat_dev->dev;
+ dst_vq->allow_cache_hints = 1;

  ret = vb2_queue_init(dst_vq);
  if (ret)
-- 
2.36.1.255.ge46751e96f-goog
