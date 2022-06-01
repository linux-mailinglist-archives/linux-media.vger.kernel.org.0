Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 190E9539ACA
	for <lists+linux-media@lfdr.de>; Wed,  1 Jun 2022 03:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347934AbiFABi7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 May 2022 21:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbiFABi5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 May 2022 21:38:57 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26A9270369
        for <linux-media@vger.kernel.org>; Tue, 31 May 2022 18:38:53 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id h1so354100plf.11
        for <linux-media@vger.kernel.org>; Tue, 31 May 2022 18:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uWWAUmErisdtUtvBbjj0wGupXem7329reWK7fE7MtwQ=;
        b=UxfDxnVTFCNDmKVBHz1AH7vroW8KxYt4EkJbguZfzP/qwnKgFBCvOW/vrNMbo5/MBt
         QCz1XWHYfhC0WnP9cmUdo9vEbRmvTWkP0Oo0Z2O16jf4Vo78l4kaaZ5ca7E+a+CkSBxS
         UnNX/JzsMxh0bFRsXV8JvcLxPLnehCsnT69So=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uWWAUmErisdtUtvBbjj0wGupXem7329reWK7fE7MtwQ=;
        b=u8EFD/mjtGgtloyp1BoM/+MT3MgQQP+gLhXGRs1MGuaKaCadTPc7xB4s6UN/nJmDKc
         LYWvJ/RzeFQA4zb5E+aYP2lQ2HtQ6GKIMlQ5w1byYN2uFyoG3fOEwNbEsqzKjZ30jyjR
         X2ubHus3R6Y4L7NnQyLHCR8wK0SLOx/alFb3LqgyLmVKtP7Ki7ikg7Gg6WMuAprcTX1R
         Ra9Upa7h+BXvsN7Nf+PkfypB4oSzSP09s8crDY9oGaZ3dO5cXQKq5bVrfD2x8OaZ7lQH
         hnfcpxNK2BKbGlFb9+g0aW6KTjOc8G+ukThddGBwT7xN8lYP0SCuxfJMck1YjoeUR+RK
         1wZA==
X-Gm-Message-State: AOAM533peruc6A5i7MJdCyzX3l8lF9RNQVlbxKbm/5vO+pKZ3Tmaqsw6
        zLLKRyb9RFt8eDXNl91U14cyQQ==
X-Google-Smtp-Source: ABdhPJzAkO0U0vpTLsR5HQaDJSybhKRumcisTEvUjGFFERhS+jl+42zh7fQ26wY6h44vYmW5yVyJgQ==
X-Received: by 2002:a17:902:e745:b0:163:5074:6c2f with SMTP id p5-20020a170902e74500b0016350746c2fmr35614706plf.140.1654047532678;
        Tue, 31 May 2022 18:38:52 -0700 (PDT)
Received: from google.com ([240f:75:7537:3187:d4ab:3840:8b0c:eb66])
        by smtp.gmail.com with ESMTPSA id k62-20020a638441000000b003fbc60e3358sm125364pgd.4.2022.05.31.18.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 18:38:52 -0700 (PDT)
Date:   Wed, 1 Jun 2022 10:38:47 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Justin Green <greenjustin@chromium.org>
Cc:     linux-media@vger.kernel.org,
        "tiffany.lin@mediatek.com" <tiffany.lin@mediatek.com>,
        "andrew-ct.chen@mediatek.com" <andrew-ct.chen@mediatek.com>,
        mchehab@kernel.org,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] mediatek/vcodec: Enable incoherent buffer allocation
Message-ID: <YpbDJ+PUmUTcOD3n@google.com>
References: <CAHC42RegxBFjqMwR2gv8EwqE0FG+oS7QA9rcopapktf7tD_y-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHC42RegxBFjqMwR2gv8EwqE0FG+oS7QA9rcopapktf7tD_y-g@mail.gmail.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (22/05/31 17:10), Justin Green wrote:
> Set allow_cache_hints to 1 for the vb2_queue source and destination queues
> in the mediatek vcodec V4L2 driver. This allows us to allocate buffers
> with the V4L2_MEMORY_FLAG_NON_COHERENT set. On Mediatek SoCs, this enables
> caching for this memory, which vastly improves performance when being read
> from CPU. Read performance for these buffers is in turn important for
> detiling MM21 video frames in software.
> 
> This change should be safe from race conditions since videobuf2 already
> invalidates or flushes the appropriate cache lines in its prepare() and
> finish() methods.
> 
> Tested on a MT8183 SoC. Resulted in both correct detiling and a 10X
> speedup.

Hi Justin,

It seems that something has happened to tabs and code formatting,
could you double check and resend?

> @@ -929,30 +929,32 @@ int mtk_vcodec_dec_queue_init(void *priv, struct
> vb2_queue *src_vq,
> 
>   mtk_v4l2_debug(3, "[%d]", ctx->id);
> 
> - src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> - src_vq->io_modes = VB2_DMABUF | VB2_MMAP;
> - src_vq->drv_priv = ctx;
> - src_vq->buf_struct_size = sizeof(struct mtk_video_dec_buf);
> - src_vq->ops = ctx->dev->vdec_pdata->vdec_vb2_ops;
> - src_vq->mem_ops = &vb2_dma_contig_memops;
> - src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> - src_vq->lock = &ctx->dev->dev_mutex;
> - src_vq->dev             = &ctx->dev->plat_dev->dev;
> + src_vq->type   = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> + src_vq->io_modes   = VB2_DMABUF | VB2_MMAP;
> + src_vq->drv_priv   = ctx;
> + src_vq->buf_struct_size   = sizeof(struct mtk_video_dec_buf);
> + src_vq->ops   = ctx->dev->vdec_pdata->vdec_vb2_ops;
> + src_vq->mem_ops   = &vb2_dma_contig_memops;
> + src_vq->timestamp_flags   = V4L2_BUF_FLAG_TIMESTAMP_COPY;
> + src_vq->lock   = &ctx->dev->dev_mutex;
> + src_vq->dev               = &ctx->dev->plat_dev->dev;
> + src_vq->allow_cache_hints = 1;

I guess it should look something like this

-	src_vq->type		= V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
-	src_vq->io_modes	= VB2_DMABUF | VB2_MMAP;
-	src_vq->drv_priv	= ctx;
-	src_vq->buf_struct_size = sizeof(struct mtk_video_dec_buf);
-	src_vq->ops		= ctx->dev->vdec_pdata->vdec_vb2_ops;
-	src_vq->mem_ops		= &vb2_dma_contig_memops;
-	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
-	src_vq->lock		= &ctx->dev->dev_mutex;
-	src_vq->dev             = &ctx->dev->plat_dev->dev;
+	src_vq->type			= V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	src_vq->io_modes		= VB2_DMABUF | VB2_MMAP;
+	src_vq->drv_priv		= ctx;
+	src_vq->buf_struct_size		= sizeof(struct mtk_video_dec_buf);
+	src_vq->ops			= ctx->dev->vdec_pdata->vdec_vb2_ops;
+	src_vq->mem_ops			= &vb2_dma_contig_memops;
+	src_vq->timestamp_flags		= V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->lock			= &ctx->dev->dev_mutex;
+	src_vq->dev			= &ctx->dev->plat_dev->dev;
+	src_vq->allow_cache_hints	= 1;
