Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 797E03BE849
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 14:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231744AbhGGMvp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 08:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231509AbhGGMvp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 08:51:45 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B25C061574
        for <linux-media@vger.kernel.org>; Wed,  7 Jul 2021 05:49:05 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id h2so3233780edt.3
        for <linux-media@vger.kernel.org>; Wed, 07 Jul 2021 05:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AWfBTNR+7qXXmfyz0hwbeeOHPZvd/rdFeAqJwOu0Eek=;
        b=gs9Uh0+IX75An6xhR1AwTXnBIpGA7+nYA10/RA3Oo1dUIloN8ATCPG8c9UWDzpfMiC
         U6Fg0rc+8NpCeuEEEE13vaZDW8zOJ3t2XDlSWjjtEuaJUxr/stPDOD89GYUDH8vSAIdZ
         ETd6vo7YS49ihPdMHsyKty78mAKG4lQknRCkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AWfBTNR+7qXXmfyz0hwbeeOHPZvd/rdFeAqJwOu0Eek=;
        b=g4yus6En2YH6TPels9Ub24eIxd7n6nj/oRfn/M2LQ2+cV3GbM0Wk1PhylIUNSm4ijD
         xioKwBxhI+s1+tMu7WBUTjOTMSwRbwaqM974k0XHhpvjGIs7WXAw+dToxryBvGibl4m3
         jY+uZP7dF21cR7+9hz1TCf9rTRxg5Xep0aay+gtdMyCgAPFlQ1XRaxX1yYkCJbXSBw7y
         48lJn+G/JaFc5tHdY/PhbJxdWcD6Y5WfoOK08yqMdHJSWZ/Sl70mTUEMAZvjTTWpKA50
         93Y/X6M3hPqjOhspM+jhXu7hHLjGr/p5q9UR2SWQtrlOS7xNcw1WREcvpqceLYJPTpCF
         0HPQ==
X-Gm-Message-State: AOAM532ZZ8jY9zi1CDFQYJP+m9AI1mfzFpnLRksCKsX8eFQF/FNi4tpy
        RTWkZbVbyor+P1oEiCkw1Ih6fyX0RnnMYA==
X-Google-Smtp-Source: ABdhPJzFnEj9LPCypVPpDn1iiI18HuRiWZA+81G7zNhsi5Ua2mhgzIzhvCQyBheXOgfc2R4jdl+0dg==
X-Received: by 2002:a05:6402:b06:: with SMTP id bm6mr27416850edb.388.1625662143270;
        Wed, 07 Jul 2021 05:49:03 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id g23sm6936703ejh.116.2021.07.07.05.49.02
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 05:49:02 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id a8so2925899wrp.5
        for <linux-media@vger.kernel.org>; Wed, 07 Jul 2021 05:49:02 -0700 (PDT)
X-Received: by 2002:adf:c448:: with SMTP id a8mr7784112wrg.103.1625662141974;
 Wed, 07 Jul 2021 05:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210427131344.139443-1-senozhatsky@chromium.org>
 <20210427131344.139443-9-senozhatsky@chromium.org> <10a0903a-e295-5cba-683a-1eb89a0804ed@xs4all.nl>
 <YMsAIVs7G2hUDR2F@google.com> <YNVJJhP69KPJ+DHv@google.com>
In-Reply-To: <YNVJJhP69KPJ+DHv@google.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 7 Jul 2021 21:48:49 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BB6JghdgGf9SjAWYuZFsZaAeU11rV1a1xrwws=w7j7_w@mail.gmail.com>
Message-ID: <CAAFQd5BB6JghdgGf9SjAWYuZFsZaAeU11rV1a1xrwws=w7j7_w@mail.gmail.com>
Subject: Re: [PATCHv2 8/8] videobuf2: handle non-contiguous DMA allocations
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 25, 2021 at 12:10 PM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> Hi Hans,
>
> On (21/06/17 16:56), Sergey Senozhatsky wrote:
> [..]
> > static void *vb2_dc_vaddr(struct vb2_buffer *vb, void *buf_priv)
> > {
> >         struct vb2_dc_buf *buf = buf_priv;
> >
> >         if (buf->vaddr)
> >                 return buf->vaddr;
> >
> >         if (buf->db_attach) {
> >                 struct dma_buf_map map;
> >
> >                 if (!dma_buf_vmap(buf->db_attach->dmabuf, &map))
> >                         buf->vaddr = map.vaddr;
> >
> >                 return buf->vaddr;
> >         }
> >
> >         if (!buf->coherent_mem)
> >                 buf->vaddr = dma_vmap_noncontiguous(buf->dev, buf->size,
> >                                                     buf->dma_sgt);
> >         return buf->vaddr;
> > }
> >
> > And in vb2_dc_alloc functions set vaddr for !DMA_ATTR_NO_KERNEL_MAPPING
> > in both coherent and non-coherent. So that we probably can have less
> > branches when ->vaddr is NULL for one type of allocations, and is not
> > NULL for another.

I'd prefer if it stayed as is. This opportunistic mapping as in the
current revision is quite nice, because most of the drivers don't
bother to set DMA_ATTR_NO_KERNEL_MAPPING even if they don't need the
kernel mapping. Also, even if the driver itself doesn't need the
kernel mapping, we can still create one on demand if the DMA-buf
importer demands it from us.

> >
> > static int vb2_dc_alloc_coherent(struct vb2_dc_buf *buf)
> > {
> >         struct vb2_queue *q = buf->vb->vb2_queue;
> >
> >         buf->cookie = dma_alloc_attrs(buf->dev,
> >                                       buf->size,
> >                                       &buf->dma_addr,
> >                                       GFP_KERNEL | q->gfp_flags,
> >                                       buf->attrs);
> >         if (!buf->cookie)
> >                 return -ENOMEM;
> >
> >         if (q->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
> >                 return 0;
> >
> >         buf->vaddr = buf->cookie;
> >         return 0;
> > }
> >
> > static int vb2_dc_alloc_non_coherent(struct vb2_dc_buf *buf)
> > {
> >         struct vb2_queue *q = buf->vb->vb2_queue;
> >
> >         buf->dma_sgt = dma_alloc_noncontiguous(buf->dev,
> >                                                buf->size,
> >                                                buf->dma_dir,
> >                                                GFP_KERNEL | q->gfp_flags,
> >                                                buf->attrs);
> >         if (!buf->dma_sgt)
> >                 return -ENOMEM;
> >
> >         if (q->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
> >                 return 0;
> >
> >         buf->vaddr = dma_vmap_noncontiguous(buf->dev, buf->size, buf->dma_sgt);
> >         if (!buf->vaddr) {
> >                 dma_free_noncontiguous(buf->dev, buf->size,
> >                                        buf->dma_sgt, buf->dma_addr);
> >                 return -ENOMEM;
> >         }
> >         return 0;
> > }
>
> I guess this should address the case when
>
> "after allocating the buffer, the buffer is exported as a dma_buf and
> another device calls dma_buf_ops vb2_dc_dmabuf_ops_vmap, which in turn
> calls dma_buf_map_set_vaddr(map, buf->vaddr); with a NULL buf->vaddr"

Sorry, I fail to get what this is about. Where does this quote come from?

>
> Because ->vaddr will not be NULL now after allocation for both coherent
> and non-coherent buffers (modulo DMA_ATTR_NO_KERNEL_MAPPING requests).
>
> What do you think?

Hans, any feedback on this? Thanks.

Best regards,
Tomasz
