Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 458073BE8C9
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 15:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231786AbhGGNcN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 09:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231642AbhGGNcM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 09:32:12 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89E37C06175F
        for <linux-media@vger.kernel.org>; Wed,  7 Jul 2021 06:29:31 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id f17so2126837pfj.8
        for <linux-media@vger.kernel.org>; Wed, 07 Jul 2021 06:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DeW6DbiYghSlxomX+caI9XRifamSis00WC1H6FJu5kk=;
        b=QhXiF/J0Q3F3Qlrk8aWOhHXGkKG2T44fAMUZg4ZJCQeaR/yUjjR2BQhReMoBQDOK/T
         t0EZbWNDUK26wZE9ofjAf/4w7qR6/cgogjqUNM19xNTi/gKCotl9IRWwn2aFVIT7KdIP
         eocA2u39SsrGDxBMSeuseqm/uhqB1mT9y6OZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DeW6DbiYghSlxomX+caI9XRifamSis00WC1H6FJu5kk=;
        b=Ea/g8fQoeTl1yyJGhxAasIKKIcjSWhMqsph7xJHYh6BHByCfzTGzooNcK81cTifMSF
         nJ+4StC4XTK87pZWT2C9vEwvq3pWVSzgi0cl9RZptdX9qzcyA7x+K+k66BN/A49dfCSc
         YhrgHSSbf5/Mf0moLMS/Xls3c2WzR34E7agPZ1VOofcI6vsaVmUULmdiQqCwsKpzFy1K
         1dMwJvENZ2HoUxu2iZN4CFLqHABrO272xlYwmDsWiSMXccqtHKu8VnJeKwZX7PQxp7GY
         R7+2MWuDFVrzBKLnS+MRVLPw0wnvD/NIUrd0wfxYB7DHhTSH4I8CfMl6kp1W3QR1BTAK
         VB4A==
X-Gm-Message-State: AOAM531K60j0IvqeOFpHuuCFsudmkRDl0whAQcVqwNGdWb11UcqrDkwv
        vTOZtrCO7efKkadJbMA+9iVhuQ==
X-Google-Smtp-Source: ABdhPJykwLstUY9Yw43K2Xhayc49jcusse3Sp+zs0d31icobxLcbYQg3iBhMaYcMzYoyGCoE5e72PA==
X-Received: by 2002:a63:4415:: with SMTP id r21mr26464104pga.296.1625664570978;
        Wed, 07 Jul 2021 06:29:30 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:832:2137:f7c8:b53f])
        by smtp.gmail.com with ESMTPSA id t17sm22363749pgl.93.2021.07.07.06.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 06:29:30 -0700 (PDT)
Date:   Wed, 7 Jul 2021 22:29:25 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 8/8] videobuf2: handle non-contiguous DMA allocations
Message-ID: <YOWsNa0Zaf9UuGWH@google.com>
References: <20210427131344.139443-1-senozhatsky@chromium.org>
 <20210427131344.139443-9-senozhatsky@chromium.org>
 <10a0903a-e295-5cba-683a-1eb89a0804ed@xs4all.nl>
 <YMsAIVs7G2hUDR2F@google.com>
 <YNVJJhP69KPJ+DHv@google.com>
 <CAAFQd5BB6JghdgGf9SjAWYuZFsZaAeU11rV1a1xrwws=w7j7_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5BB6JghdgGf9SjAWYuZFsZaAeU11rV1a1xrwws=w7j7_w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/07/07 21:48), Tomasz Figa wrote:
> > [..]
> > > static void *vb2_dc_vaddr(struct vb2_buffer *vb, void *buf_priv)
> > > {
> > >         struct vb2_dc_buf *buf = buf_priv;
> > >
> > >         if (buf->vaddr)
> > >                 return buf->vaddr;
> > >
> > >         if (buf->db_attach) {
> > >                 struct dma_buf_map map;
> > >
> > >                 if (!dma_buf_vmap(buf->db_attach->dmabuf, &map))
> > >                         buf->vaddr = map.vaddr;
> > >
> > >                 return buf->vaddr;
> > >         }
> > >
> > >         if (!buf->coherent_mem)
> > >                 buf->vaddr = dma_vmap_noncontiguous(buf->dev, buf->size,
> > >                                                     buf->dma_sgt);
> > >         return buf->vaddr;
> > > }
> > >
> > > And in vb2_dc_alloc functions set vaddr for !DMA_ATTR_NO_KERNEL_MAPPING
> > > in both coherent and non-coherent. So that we probably can have less
> > > branches when ->vaddr is NULL for one type of allocations, and is not
> > > NULL for another.
> 
> I'd prefer if it stayed as is. This opportunistic mapping as in the
> current revision is quite nice, because most of the drivers don't
> bother to set DMA_ATTR_NO_KERNEL_MAPPING even if they don't need the
> kernel mapping. Also, even if the driver itself doesn't need the
> kernel mapping, we can still create one on demand if the DMA-buf
> importer demands it from us.

[..]

> > > static int vb2_dc_alloc_coherent(struct vb2_dc_buf *buf)
> > > {
> > >         struct vb2_queue *q = buf->vb->vb2_queue;
> > >
> > >         buf->cookie = dma_alloc_attrs(buf->dev,
> > >                                       buf->size,
> > >                                       &buf->dma_addr,
> > >                                       GFP_KERNEL | q->gfp_flags,
> > >                                       buf->attrs);
> > >         if (!buf->cookie)
> > >                 return -ENOMEM;
> > >
> > >         if (q->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
> > >                 return 0;
> > >
> > >         buf->vaddr = buf->cookie;
> > >         return 0;
> > > }
> > >
> > > static int vb2_dc_alloc_non_coherent(struct vb2_dc_buf *buf)
> > > {
> > >         struct vb2_queue *q = buf->vb->vb2_queue;
> > >
> > >         buf->dma_sgt = dma_alloc_noncontiguous(buf->dev,
> > >                                                buf->size,
> > >                                                buf->dma_dir,
> > >                                                GFP_KERNEL | q->gfp_flags,
> > >                                                buf->attrs);
> > >         if (!buf->dma_sgt)
> > >                 return -ENOMEM;
> > >
> > >         if (q->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
> > >                 return 0;
> > >
> > >         buf->vaddr = dma_vmap_noncontiguous(buf->dev, buf->size, buf->dma_sgt);
> > >         if (!buf->vaddr) {
> > >                 dma_free_noncontiguous(buf->dev, buf->size,
> > >                                        buf->dma_sgt, buf->dma_addr);
> > >                 return -ENOMEM;
> > >         }
> > >         return 0;
> > > }
> >
> > I guess this should address the case when
> >
> > "after allocating the buffer, the buffer is exported as a dma_buf and
> > another device calls dma_buf_ops vb2_dc_dmabuf_ops_vmap, which in turn
> > calls dma_buf_map_set_vaddr(map, buf->vaddr); with a NULL buf->vaddr"
> 
> Sorry, I fail to get what this is about. Where does this quote come from?

Bottom half of https://lore.kernel.org/lkml/10a0903a-e295-5cba-683a-1eb89a0804ed@xs4all.nl/
