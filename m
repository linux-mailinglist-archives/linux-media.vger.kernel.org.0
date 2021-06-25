Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86EC63B3B13
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 05:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233086AbhFYDM5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 23:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233062AbhFYDM4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 23:12:56 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDF8C061574
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 20:10:35 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id m2so6422430pgk.7
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 20:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EHF4hXE1BofxiNAxyTu0OOal5JJOm5OszXgmCJK9iiA=;
        b=f4nq0N9EujiAI6HzSt7qwQNFrzIXuOou3PVS9akh+S1P7E555UZxrGQXPU9uZ2fNic
         BJbUrlVDNCCZByRe0KeNEkMol6uYdlYFRyuCR5tW1WVMTcXibXI6MlNQIsT1LgiRu72e
         c4QLDt2mQjVTMN4grbZRyJM950p5BhOcdA2DQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EHF4hXE1BofxiNAxyTu0OOal5JJOm5OszXgmCJK9iiA=;
        b=K5CCoG80Wqlb1C5kmIOsMKvo0JBd/QAqmdTSatAz+WklHjFSxcYbRwbXhAApavXpZV
         myFY9C4gHrkbMh8QBv30e+idt/XVULckmIt1ADocHZXiplNKgN/+JRHQEcQLcTxU0Mm8
         zN5yr7BTf+bUaWfjwqi1gvdCnqA1t/LUq7hAkoyn8B73C274kiit2ct1QFhsOmYRBOkR
         z1lUiq6MQiqY9HH3c448AluQzNHifRffz4iDfXaM2N1SufWzlpq09MvojCHG1cV6s90q
         HuOhk3K33H5yPi1kImjtqNQGxCOIGhYCOR5PZVjCS9NsWuJu6I3prroExfsZr1eckKoQ
         NS/g==
X-Gm-Message-State: AOAM531hb3VozD4h/lDouOWQsx+ZULFFEhvDSBP2sJygPKJ1BfXsyKEp
        O6aNXKn+nDVi4bMiTGJjssl6OA==
X-Google-Smtp-Source: ABdhPJyXehUV2SIhmH5Jr3Xh7AXmXjKpVWqO1MypdP0+F+Ezg1KAhPoQeVFlvjROnlIm4K4WIuKVNQ==
X-Received: by 2002:a63:ef44:: with SMTP id c4mr7433314pgk.162.1624590635359;
        Thu, 24 Jun 2021 20:10:35 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:86d5:e5c:bdd4:774f])
        by smtp.gmail.com with ESMTPSA id o9sm4323763pfh.217.2021.06.24.20.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 20:10:34 -0700 (PDT)
Date:   Fri, 25 Jun 2021 12:10:30 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 8/8] videobuf2: handle non-contiguous DMA allocations
Message-ID: <YNVJJhP69KPJ+DHv@google.com>
References: <20210427131344.139443-1-senozhatsky@chromium.org>
 <20210427131344.139443-9-senozhatsky@chromium.org>
 <10a0903a-e295-5cba-683a-1eb89a0804ed@xs4all.nl>
 <YMsAIVs7G2hUDR2F@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMsAIVs7G2hUDR2F@google.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On (21/06/17 16:56), Sergey Senozhatsky wrote:
[..]
> static void *vb2_dc_vaddr(struct vb2_buffer *vb, void *buf_priv)
> {
>         struct vb2_dc_buf *buf = buf_priv;
> 
>         if (buf->vaddr)
>                 return buf->vaddr;
> 
>         if (buf->db_attach) {
>                 struct dma_buf_map map;
> 
>                 if (!dma_buf_vmap(buf->db_attach->dmabuf, &map))
>                         buf->vaddr = map.vaddr;
> 
>                 return buf->vaddr;
>         }
> 
>         if (!buf->coherent_mem)
>                 buf->vaddr = dma_vmap_noncontiguous(buf->dev, buf->size,
>                                                     buf->dma_sgt);
>         return buf->vaddr;
> }
> 
> And in vb2_dc_alloc functions set vaddr for !DMA_ATTR_NO_KERNEL_MAPPING
> in both coherent and non-coherent. So that we probably can have less
> branches when ->vaddr is NULL for one type of allocations, and is not
> NULL for another.
> 
> static int vb2_dc_alloc_coherent(struct vb2_dc_buf *buf)
> {
>         struct vb2_queue *q = buf->vb->vb2_queue;
> 
>         buf->cookie = dma_alloc_attrs(buf->dev,
>                                       buf->size,
>                                       &buf->dma_addr,
>                                       GFP_KERNEL | q->gfp_flags,
>                                       buf->attrs);
>         if (!buf->cookie)
>                 return -ENOMEM;
> 
>         if (q->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
>                 return 0;
> 
>         buf->vaddr = buf->cookie;
>         return 0;
> }
> 
> static int vb2_dc_alloc_non_coherent(struct vb2_dc_buf *buf)
> {
>         struct vb2_queue *q = buf->vb->vb2_queue;
> 
>         buf->dma_sgt = dma_alloc_noncontiguous(buf->dev,
>                                                buf->size,
>                                                buf->dma_dir,
>                                                GFP_KERNEL | q->gfp_flags,
>                                                buf->attrs);
>         if (!buf->dma_sgt)
>                 return -ENOMEM;
> 
>         if (q->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
>                 return 0;
> 
>         buf->vaddr = dma_vmap_noncontiguous(buf->dev, buf->size, buf->dma_sgt);
>         if (!buf->vaddr) {
>                 dma_free_noncontiguous(buf->dev, buf->size,
>                                        buf->dma_sgt, buf->dma_addr);
>                 return -ENOMEM;
>         }
>         return 0;
> }

I guess this should address the case when

"after allocating the buffer, the buffer is exported as a dma_buf and
another device calls dma_buf_ops vb2_dc_dmabuf_ops_vmap, which in turn
calls dma_buf_map_set_vaddr(map, buf->vaddr); with a NULL buf->vaddr"

Because ->vaddr will not be NULL now after allocation for both coherent
and non-coherent buffers (modulo DMA_ATTR_NO_KERNEL_MAPPING requests).

What do you think?
