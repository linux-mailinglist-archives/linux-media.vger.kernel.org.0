Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1323BE96F
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 16:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbhGGONf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 10:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbhGGONe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 10:13:34 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03810C061574
        for <linux-media@vger.kernel.org>; Wed,  7 Jul 2021 07:10:54 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id y40so3574530ede.4
        for <linux-media@vger.kernel.org>; Wed, 07 Jul 2021 07:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UXjLA21RO8ZVTaiT53RWJR5NF6kfisIk0gt8MHSPKZA=;
        b=ZtSemU85FBGU5ie+R0xDBAxp25KfkVHjo/1V7lmSgKUsRXDu+YUsUXN86AAoW0vkSq
         SglE/WWJQ+dj2xBDYoPZUmTDhFD3EXtxXhHAtfMg52dRgi744WVlnNVOuTr82g4mROpP
         Op11tc851OTswsrDu5ZzFgtShVClUgiiFdKuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UXjLA21RO8ZVTaiT53RWJR5NF6kfisIk0gt8MHSPKZA=;
        b=GtViyxc7hXLlA8I5jY/GSJIlMAG4PoO1SJcwSKenVHsTKF4H4aWV7ZtUOhwQEFp+r1
         TFEtsiWt2yl2OMGdsA7eLLBft2LPfFsXFji4LMOKbm2f280WA26uK3i3Tf8Tttbu/T27
         XyPQNQ5epGOJQdPGY2UeZ9fcoYOYwDDL+WXLrhC+mZBHm3XtA5daa0Au9DO8b3ZUc3hp
         6GT6NbZh44HEqtFVA+dL53hKsFl920R1A4IENIdbLp5mVdHeQVcrJEGPj2SSHnEVbp8o
         XXwsmWHYpkNScR2S6fmIGs7hN6w2vs82MjSV8kDuQQtLnc3K5kpZvzxa+WCsi2Qhtamu
         7/5Q==
X-Gm-Message-State: AOAM532lDv0Dvb+kSgx8jnmwJiWrrVeDyLb4kR14EfrR0XAlZAz8TXdP
        K1K4wObVEAxbkIuwlVjJ98FJizTx6loFgw==
X-Google-Smtp-Source: ABdhPJyzrdV/GQyV3m/X2IJiwtLU7+zRMkiXZDXMm5gXrIK5bBzp1NqegqLTAf1Jkua3TXOUVens9Q==
X-Received: by 2002:a50:fc04:: with SMTP id i4mr18226898edr.285.1625667052187;
        Wed, 07 Jul 2021 07:10:52 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id a5sm3880091edj.20.2021.07.07.07.10.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 07:10:51 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id i94so3242003wri.4
        for <linux-media@vger.kernel.org>; Wed, 07 Jul 2021 07:10:50 -0700 (PDT)
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr10193300wrs.192.1625667050451;
 Wed, 07 Jul 2021 07:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210427131344.139443-1-senozhatsky@chromium.org>
 <20210427131344.139443-9-senozhatsky@chromium.org> <10a0903a-e295-5cba-683a-1eb89a0804ed@xs4all.nl>
 <YMsAIVs7G2hUDR2F@google.com> <YNVJJhP69KPJ+DHv@google.com>
 <CAAFQd5BB6JghdgGf9SjAWYuZFsZaAeU11rV1a1xrwws=w7j7_w@mail.gmail.com> <YOWsNa0Zaf9UuGWH@google.com>
In-Reply-To: <YOWsNa0Zaf9UuGWH@google.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 7 Jul 2021 23:10:37 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DDpxXBb=eJpzLPOhGQAgtBKnn0aTo=3Vs-rf44cu8OQA@mail.gmail.com>
Message-ID: <CAAFQd5DDpxXBb=eJpzLPOhGQAgtBKnn0aTo=3Vs-rf44cu8OQA@mail.gmail.com>
Subject: Re: [PATCHv2 8/8] videobuf2: handle non-contiguous DMA allocations
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 7, 2021 at 10:29 PM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (21/07/07 21:48), Tomasz Figa wrote:
> > > [..]
> > > > static void *vb2_dc_vaddr(struct vb2_buffer *vb, void *buf_priv)
> > > > {
> > > >         struct vb2_dc_buf *buf = buf_priv;
> > > >
> > > >         if (buf->vaddr)
> > > >                 return buf->vaddr;
> > > >
> > > >         if (buf->db_attach) {
> > > >                 struct dma_buf_map map;
> > > >
> > > >                 if (!dma_buf_vmap(buf->db_attach->dmabuf, &map))
> > > >                         buf->vaddr = map.vaddr;
> > > >
> > > >                 return buf->vaddr;
> > > >         }
> > > >
> > > >         if (!buf->coherent_mem)
> > > >                 buf->vaddr = dma_vmap_noncontiguous(buf->dev, buf->size,
> > > >                                                     buf->dma_sgt);
> > > >         return buf->vaddr;
> > > > }
> > > >
> > > > And in vb2_dc_alloc functions set vaddr for !DMA_ATTR_NO_KERNEL_MAPPING
> > > > in both coherent and non-coherent. So that we probably can have less
> > > > branches when ->vaddr is NULL for one type of allocations, and is not
> > > > NULL for another.
> >
> > I'd prefer if it stayed as is. This opportunistic mapping as in the
> > current revision is quite nice, because most of the drivers don't
> > bother to set DMA_ATTR_NO_KERNEL_MAPPING even if they don't need the
> > kernel mapping. Also, even if the driver itself doesn't need the
> > kernel mapping, we can still create one on demand if the DMA-buf
> > importer demands it from us.
>
> [..]
>
> > > > static int vb2_dc_alloc_coherent(struct vb2_dc_buf *buf)
> > > > {
> > > >         struct vb2_queue *q = buf->vb->vb2_queue;
> > > >
> > > >         buf->cookie = dma_alloc_attrs(buf->dev,
> > > >                                       buf->size,
> > > >                                       &buf->dma_addr,
> > > >                                       GFP_KERNEL | q->gfp_flags,
> > > >                                       buf->attrs);
> > > >         if (!buf->cookie)
> > > >                 return -ENOMEM;
> > > >
> > > >         if (q->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
> > > >                 return 0;
> > > >
> > > >         buf->vaddr = buf->cookie;
> > > >         return 0;
> > > > }
> > > >
> > > > static int vb2_dc_alloc_non_coherent(struct vb2_dc_buf *buf)
> > > > {
> > > >         struct vb2_queue *q = buf->vb->vb2_queue;
> > > >
> > > >         buf->dma_sgt = dma_alloc_noncontiguous(buf->dev,
> > > >                                                buf->size,
> > > >                                                buf->dma_dir,
> > > >                                                GFP_KERNEL | q->gfp_flags,
> > > >                                                buf->attrs);
> > > >         if (!buf->dma_sgt)
> > > >                 return -ENOMEM;
> > > >
> > > >         if (q->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
> > > >                 return 0;
> > > >
> > > >         buf->vaddr = dma_vmap_noncontiguous(buf->dev, buf->size, buf->dma_sgt);
> > > >         if (!buf->vaddr) {
> > > >                 dma_free_noncontiguous(buf->dev, buf->size,
> > > >                                        buf->dma_sgt, buf->dma_addr);
> > > >                 return -ENOMEM;
> > > >         }
> > > >         return 0;
> > > > }
> > >
> > > I guess this should address the case when
> > >
> > > "after allocating the buffer, the buffer is exported as a dma_buf and
> > > another device calls dma_buf_ops vb2_dc_dmabuf_ops_vmap, which in turn
> > > calls dma_buf_map_set_vaddr(map, buf->vaddr); with a NULL buf->vaddr"
> >
> > Sorry, I fail to get what this is about. Where does this quote come from?
>
> Bottom half of https://lore.kernel.org/lkml/10a0903a-e295-5cba-683a-1eb89a0804ed@xs4all.nl/

I see, thanks for the pointer. Yes, vb2_dc_dmabuf_ops_vmap() needs to
be changed so that it calls vb2_dc_vaddr() internally instead of
relying on buf->vaddr directly.
