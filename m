Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0C5B7A7473
	for <lists+linux-media@lfdr.de>; Wed, 20 Sep 2023 09:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233794AbjITHlj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Sep 2023 03:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233756AbjITHli (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Sep 2023 03:41:38 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B99EC9
        for <linux-media@vger.kernel.org>; Wed, 20 Sep 2023 00:41:32 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-417d6e83ce2so4789191cf.0
        for <linux-media@vger.kernel.org>; Wed, 20 Sep 2023 00:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695195690; x=1695800490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iP+e5yTNMQ0UK6TWKcNmH7iV1dhFExt2WXPYDJ8BwIE=;
        b=fYO3jWvt+6OWUb1+YG4NJdKQUPFgZq793kY4KorbtNrOFczZ5KKvEgL+gOZjeHyy3X
         vK1rPv4LfnMTJg2QwmPLNYQw6/uv2nLrX9inot2aWU1Lc62gE0IPjOjiJwNx6Wc9QaQq
         BtGNjUVcH7B8PM1xHUBQEFD7Mq+SCZRxcFxtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695195690; x=1695800490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iP+e5yTNMQ0UK6TWKcNmH7iV1dhFExt2WXPYDJ8BwIE=;
        b=Bbqd/O2Z0bFyXQIkwS/FXzHeQoCTCOv4PocJ343tl0oW8HgaY9hOHpKLCqeEos+9Yk
         QEuVXkZHMXV6Qmnb491XU9LulIO+ensrsDtEiMeucBTJPdItRdyD3uUWkDb1pATEDu1X
         XxtE3re3S5F/3ke96/XQcuK45k9s+fOsDDysk5rkI0QFYTw8JGquhfMNDsyCmJ74Ne3Q
         EZkGAOjZNBQL0T+67w+IN1QU1vqhAJ78toVWYBKKwX99362/0+z6Ov9N6sL2RiBcr1K2
         AjOvrYpxBdAZnFJceyadVzn9pQqaCNMJLXGarvDRozeeQYHBmSCPvVzhNg/T0W6prSvl
         yrLA==
X-Gm-Message-State: AOJu0Yx0VOGrXuFt5gbEI5/3+IEQke8sfpY9Xox38dC0/O6ATyZoHf6Z
        vum7RbE0CNdYyUoyvHn49/lrBbKSrMAMuGv/UKU=
X-Google-Smtp-Source: AGHT+IFi0fUkE993in0l4uXAhWbu7OcVvVVFBpry6L5X4NSVd+H0WqS1+Gn98fUQb7VOug8RFQhxVw==
X-Received: by 2002:ac8:5944:0:b0:403:a9d3:91e3 with SMTP id 4-20020ac85944000000b00403a9d391e3mr2457094qtz.32.1695195690603;
        Wed, 20 Sep 2023 00:41:30 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id kc1-20020a05622a44c100b00417dd1dd0adsm190233qtb.87.2023.09.20.00.41.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 00:41:29 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-65631aa8b93so31000396d6.3
        for <linux-media@vger.kernel.org>; Wed, 20 Sep 2023 00:41:29 -0700 (PDT)
X-Received: by 2002:a0c:f8c9:0:b0:62f:f6ed:857e with SMTP id
 h9-20020a0cf8c9000000b0062ff6ed857emr1539387qvo.55.1695195688994; Wed, 20 Sep
 2023 00:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230914145812.12851-1-hui.fang@nxp.com>
In-Reply-To: <20230914145812.12851-1-hui.fang@nxp.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 20 Sep 2023 16:41:08 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CcN+TiVd8vhMxQRbmrJuBGYwL5d6C0fKzOy4ujjM_JMQ@mail.gmail.com>
Message-ID: <CAAFQd5CcN+TiVd8vhMxQRbmrJuBGYwL5d6C0fKzOy4ujjM_JMQ@mail.gmail.com>
Subject: Re: [PATCH] MA-21654 Use dma_alloc_pages in vb2_dma_sg_alloc_compacted
To:     Fang Hui <hui.fang@nxp.com>, Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     m.szyprowski@samsung.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        anle.pan@nxp.com, xuegang.liu@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fang,

On Thu, Sep 14, 2023 at 4:41=E2=80=AFPM Fang Hui <hui.fang@nxp.com> wrote:
>
> On system with "CONFIG_ZONE_DMA32=3Dy", if the allocated physical address=
 is

First of all, thanks a lot for the patch! Please check my review comments b=
elow.

Is CONFIG_ZONE_DMA32 really the factor that triggers the problem? My
understanding was that the problem was that the hardware has 32-bit
DMA, but the system has physical memory at addresses beyond the first
4G.

> greater than 4G, swiotlb will be used. It will lead below defects.
> 1) Impact performance due to an extra memcpy.
> 2) May meet below error due to swiotlb_max_mapping_size()
>    is 256K (IO_TLB_SIZE * IO_TLB_SEGSIZE).
> "swiotlb buffer is full (sz: 393216 bytes), total 65536 (slots),
> used 2358 (slots)"
>
> To avoid those defects, use dma_alloc_pages() instead of alloc_pages()
> in vb2_dma_sg_alloc_compacted().
>
> Suggested-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Fang Hui <hui.fang@nxp.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>

Please remove MA-21654 from the subject and prefix it with the right
tags for the path (`git log drivers/media/common/videobuf2` should be
helpful to find the right one).

> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/=
media/common/videobuf2/videobuf2-dma-sg.c
> index 28f3fdfe23a2..b938582c68f4 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -58,7 +58,7 @@ struct vb2_dma_sg_buf {
>  static void vb2_dma_sg_put(void *buf_priv);
>
>  static int vb2_dma_sg_alloc_compacted(struct vb2_dma_sg_buf *buf,
> -               gfp_t gfp_flags)
> +               gfp_t gfp_flags, struct device *dev)

FWIW buf->dev already points to the right device - although we would
need to move the assignment in vb2_dma_sg_alloc() to a place higher in
that function before calling this function.

>  {
>         unsigned int last_page =3D 0;
>         unsigned long size =3D buf->size;
> @@ -67,6 +67,7 @@ static int vb2_dma_sg_alloc_compacted(struct vb2_dma_sg=
_buf *buf,
>                 struct page *pages;
>                 int order;
>                 int i;
> +               dma_addr_t dma_handle;
>
>                 order =3D get_order(size);
>                 /* Don't over allocate*/
> @@ -75,8 +76,9 @@ static int vb2_dma_sg_alloc_compacted(struct vb2_dma_sg=
_buf *buf,
>
>                 pages =3D NULL;
>                 while (!pages) {
> -                       pages =3D alloc_pages(GFP_KERNEL | __GFP_ZERO |
> -                                       __GFP_NOWARN | gfp_flags, order);
> +                       pages =3D dma_alloc_pages(dev, PAGE_SIZE << order=
, &dma_handle,

Hmm, when I was proposing dma_alloc_pages(), I missed that it returns
a DMA handle. That on its own can be handled by saving the returned
handles somewhere in struct vb2_dma_sg_buf, but there is a bigger
problem - the function would actually create a mapping if the DMA
device requires some mapping management (e.g. is behind an IOMMU),
which is undesirable, because we create the mapping ourselves below
anyway...

@Christoph Hellwig @Robin Murphy  I need your thoughts on this as
well. Would it make sense to have a variant of dma_alloc_pages() that
only allocates the pages, but doesn't perform the mapping? (Or a flag
that tells the implementation to skip creating a mapping.)

> +                               DMA_BIDIRECTIONAL,

The right value should be already available in buf->dma_dir.

> +                               GFP_KERNEL | __GFP_ZERO | __GFP_NOWARN | =
gfp_flags);
>                         if (pages)
>                                 break;
>
> @@ -96,6 +98,7 @@ static int vb2_dma_sg_alloc_compacted(struct vb2_dma_sg=
_buf *buf,
>         }
>
>         return 0;
> +

Unnecessary blank line.

>  }
>
>  static void *vb2_dma_sg_alloc(struct vb2_buffer *vb, struct device *dev,
> @@ -130,7 +133,7 @@ static void *vb2_dma_sg_alloc(struct vb2_buffer *vb, =
struct device *dev,
>         if (!buf->pages)
>                 goto fail_pages_array_alloc;
>
> -       ret =3D vb2_dma_sg_alloc_compacted(buf, vb->vb2_queue->gfp_flags)=
;
> +       ret =3D vb2_dma_sg_alloc_compacted(buf, vb->vb2_queue->gfp_flags,=
 dev);
>         if (ret)
>                 goto fail_pages_alloc;
>
> --
> 2.17.1
>

We also need to use dma_free_pages() to free the memory.

Best regards,
Tomasz
