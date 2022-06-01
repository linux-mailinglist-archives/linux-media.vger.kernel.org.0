Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0AB253A892
	for <lists+linux-media@lfdr.de>; Wed,  1 Jun 2022 16:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354648AbiFAOJt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jun 2022 10:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354681AbiFAOJB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jun 2022 10:09:01 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D48DF3B
        for <linux-media@vger.kernel.org>; Wed,  1 Jun 2022 07:00:33 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id u2so395421iln.2
        for <linux-media@vger.kernel.org>; Wed, 01 Jun 2022 07:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DxbvDYsNyS+JKPZtZboCCAbUGckxEeU9T8ZJAlDs6F8=;
        b=Q0FIn3pbtv4KH+yQjBa/S7D7Zev4zzfriyhAkgOJ0uc1mtZEctV9f04UfZ982fFXmC
         vYPEOV065Qq6KbYZFcCuIstOYeRrr9yZACdf71+6s1ZsQf83BN5kFfaT7OwRC4bnistz
         WyIN/X0kYc4va7pOA6xdam4uiSa58x6TZk6J4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DxbvDYsNyS+JKPZtZboCCAbUGckxEeU9T8ZJAlDs6F8=;
        b=TesWDkqIduzT8hn4uiPWiKI7aiv6Ug5WPpkLpEEmRJUo+Mwp/ucdq4WqdFy+BwGH/q
         8kGIoEMWcRAYVUIRnuKA///55B2lkVoepb3oNXzB9NH788OkYYku70D59axYDMKGe5Oe
         u+qiDwWbA6b1rja/Y76uU9sX9RgzHKPWbnXSgepGCqS8TsvJbRqkUfvNVeZHj5J39pjx
         lMGTXF653FXkFu+PzgbX+gmUp3DoERz67sL0OMH1Shj5C2euAvrGoeAog9aFvA706+hw
         9RhX5mrxwtugJWXnZxOFxHcNO/5qsn3wxcW8Ko9n/vOeW5xTrOht7TDFeSE45zYcFqRI
         CGFQ==
X-Gm-Message-State: AOAM531jJZfLWI0LdmvPMX2jICUxadvQHztj+OHH7SOgLuywQbsUaiFw
        9pzZT3rTF0d+KQO3UqrxexhhQLrpwmYvSREZvJhxpe0Zo5LhMg==
X-Google-Smtp-Source: ABdhPJyhQuATjWpMgeJlom+FcD0u5GwW2zTAYNJHuVUn1RtWAcA5GZHen8NuNMuBuTWezFO1ijyONUjhgX8toByjWbM=
X-Received: by 2002:a05:6e02:1e08:b0:2d3:a866:2f0d with SMTP id
 g8-20020a056e021e0800b002d3a8662f0dmr59914ila.277.1654092031478; Wed, 01 Jun
 2022 07:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAHC42RegxBFjqMwR2gv8EwqE0FG+oS7QA9rcopapktf7tD_y-g@mail.gmail.com>
 <YpbDJ+PUmUTcOD3n@google.com>
In-Reply-To: <YpbDJ+PUmUTcOD3n@google.com>
From:   Justin Green <greenjustin@chromium.org>
Date:   Wed, 1 Jun 2022 10:00:20 -0400
Message-ID: <CAHC42RfnEmBzzLpRikJovq6-E-VWf04Wxrc6Go96y5w2MKT2YQ@mail.gmail.com>
Subject: Re: [PATCH] mediatek/vcodec: Enable incoherent buffer allocation
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     linux-media@vger.kernel.org,
        "tiffany.lin@mediatek.com" <tiffany.lin@mediatek.com>,
        "andrew-ct.chen@mediatek.com" <andrew-ct.chen@mediatek.com>,
        mchehab@kernel.org,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>
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

Sure thing! Sorry about that, I think something got messed up with the
tabs. I've switched the "=" padding to spaces to spacing to make sure
everything is consistent. I think the removals part of the diff might
still look odd on some clients because of the tabs though.


diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 52e5d36aa912..6a47b34c5bc9 100644
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
+ src_vq->type              = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+ src_vq->io_modes          = VB2_DMABUF | VB2_MMAP;
+ src_vq->drv_priv          = ctx;
+ src_vq->buf_struct_size   = sizeof(struct mtk_video_dec_buf);
+ src_vq->ops               = ctx->dev->vdec_pdata->vdec_vb2_ops;
+ src_vq->mem_ops           = &vb2_dma_contig_memops;
+ src_vq->timestamp_flags   = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+ src_vq->lock              = &ctx->dev->dev_mutex;
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
+ dst_vq->type              = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+ dst_vq->io_modes          = VB2_DMABUF | VB2_MMAP;
+ dst_vq->drv_priv          = ctx;
+ dst_vq->buf_struct_size   = sizeof(struct mtk_video_dec_buf);
+ dst_vq->ops               = ctx->dev->vdec_pdata->vdec_vb2_ops;
+ dst_vq->mem_ops           = &vb2_dma_contig_memops;
+ dst_vq->timestamp_flags   = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+ dst_vq->lock              = &ctx->dev->dev_mutex;
+ dst_vq->dev               = &ctx->dev->plat_dev->dev;
+ dst_vq->allow_cache_hints = 1;

  ret = vb2_queue_init(dst_vq);
  if (ret)
-- 
2.36.1.255.ge46751e96f-goog

On Tue, May 31, 2022 at 9:38 PM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (22/05/31 17:10), Justin Green wrote:
> > Set allow_cache_hints to 1 for the vb2_queue source and destination queues
> > in the mediatek vcodec V4L2 driver. This allows us to allocate buffers
> > with the V4L2_MEMORY_FLAG_NON_COHERENT set. On Mediatek SoCs, this enables
> > caching for this memory, which vastly improves performance when being read
> > from CPU. Read performance for these buffers is in turn important for
> > detiling MM21 video frames in software.
> >
> > This change should be safe from race conditions since videobuf2 already
> > invalidates or flushes the appropriate cache lines in its prepare() and
> > finish() methods.
> >
> > Tested on a MT8183 SoC. Resulted in both correct detiling and a 10X
> > speedup.
>
> Hi Justin,
>
> It seems that something has happened to tabs and code formatting,
> could you double check and resend?
>
> > @@ -929,30 +929,32 @@ int mtk_vcodec_dec_queue_init(void *priv, struct
> > vb2_queue *src_vq,
> >
> >   mtk_v4l2_debug(3, "[%d]", ctx->id);
> >
> > - src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> > - src_vq->io_modes = VB2_DMABUF | VB2_MMAP;
> > - src_vq->drv_priv = ctx;
> > - src_vq->buf_struct_size = sizeof(struct mtk_video_dec_buf);
> > - src_vq->ops = ctx->dev->vdec_pdata->vdec_vb2_ops;
> > - src_vq->mem_ops = &vb2_dma_contig_memops;
> > - src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > - src_vq->lock = &ctx->dev->dev_mutex;
> > - src_vq->dev             = &ctx->dev->plat_dev->dev;
> > + src_vq->type   = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> > + src_vq->io_modes   = VB2_DMABUF | VB2_MMAP;
> > + src_vq->drv_priv   = ctx;
> > + src_vq->buf_struct_size   = sizeof(struct mtk_video_dec_buf);
> > + src_vq->ops   = ctx->dev->vdec_pdata->vdec_vb2_ops;
> > + src_vq->mem_ops   = &vb2_dma_contig_memops;
> > + src_vq->timestamp_flags   = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > + src_vq->lock   = &ctx->dev->dev_mutex;
> > + src_vq->dev               = &ctx->dev->plat_dev->dev;
> > + src_vq->allow_cache_hints = 1;
>
> I guess it should look something like this
>
> -       src_vq->type            = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> -       src_vq->io_modes        = VB2_DMABUF | VB2_MMAP;
> -       src_vq->drv_priv        = ctx;
> -       src_vq->buf_struct_size = sizeof(struct mtk_video_dec_buf);
> -       src_vq->ops             = ctx->dev->vdec_pdata->vdec_vb2_ops;
> -       src_vq->mem_ops         = &vb2_dma_contig_memops;
> -       src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> -       src_vq->lock            = &ctx->dev->dev_mutex;
> -       src_vq->dev             = &ctx->dev->plat_dev->dev;
> +       src_vq->type                    = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +       src_vq->io_modes                = VB2_DMABUF | VB2_MMAP;
> +       src_vq->drv_priv                = ctx;
> +       src_vq->buf_struct_size         = sizeof(struct mtk_video_dec_buf);
> +       src_vq->ops                     = ctx->dev->vdec_pdata->vdec_vb2_ops;
> +       src_vq->mem_ops                 = &vb2_dma_contig_memops;
> +       src_vq->timestamp_flags         = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +       src_vq->lock                    = &ctx->dev->dev_mutex;
> +       src_vq->dev                     = &ctx->dev->plat_dev->dev;
> +       src_vq->allow_cache_hints       = 1;
