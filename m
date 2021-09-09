Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0A14044C0
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 07:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350556AbhIIFNZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 01:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350499AbhIIFNY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Sep 2021 01:13:24 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D4AFC061575
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 22:12:16 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id w6so316828pll.3
        for <linux-media@vger.kernel.org>; Wed, 08 Sep 2021 22:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZPpzm2oHS5NQnTZoKdg4EhgQhKvdpp71CSpDtoE7fJQ=;
        b=fYGeiebPdAaTEYFxOOOYrFDrZrXq1iufkmIJfHzcEkgBrZjiK6+M44Qh+ocW2ngo39
         rdzcSySRHRVXabQXgsfQ6gjgDoTTG+sQT2aVE0CasAlnjjU808gwPg2/w1yRBRbS/U6L
         MxjF101AAcD8ZzXtu7tLK8jPmslIrSn8znKVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZPpzm2oHS5NQnTZoKdg4EhgQhKvdpp71CSpDtoE7fJQ=;
        b=aAC1udG7QZsAlPZlw0d1kfEEYwZ0DM60Ru7VBAGJ2OKW32qivlsovSzTj3krl16CCm
         MnbxNDA43PNBO9cxGugfp+yIV5x+2H0yln3ttH7ZkY555iAi+egVo6yvJhA8pP3g+YPG
         Ga5qgTGLyFqztC9roqkbkOT4p8NUuvQsOjrnvY9xLuYYH5vhDlM08c3qIics9roFgeaz
         ZhXWfT+VHCLPGOyvt+P+apfJXw+dQkdumXatt9PqRuyWhRVZEGBusI3Kaz5iQEIVvtH1
         XnWpsfMrKB7mp0slgX14QYEY93wri+8XwWC83wzh0sBTFgAVl4b5U9jwoacX57VHvqQF
         wZ9A==
X-Gm-Message-State: AOAM531lRDN1r6nXWNOfL0JH775rdgD5XDYFcj9jxpbj2CU0I81BH5TR
        Oq5xhfcY4Hfo0ksfADxScC3rxg==
X-Google-Smtp-Source: ABdhPJzVU5/W1RZvd9juICl3YWWBtC3jGnvQn4Rz7mUp7NGkGnkypD47WNvCV01nVS8uExgEaFfbyw==
X-Received: by 2002:a17:90b:4f85:: with SMTP id qe5mr1403596pjb.241.1631164335677;
        Wed, 08 Sep 2021 22:12:15 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:bc9f:f690:7354:7030])
        by smtp.gmail.com with ESMTPSA id t10sm677302pge.10.2021.09.08.22.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 22:12:15 -0700 (PDT)
Date:   Thu, 9 Sep 2021 14:12:09 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv5 8/8] videobuf2: handle non-contiguous DMA allocations
Message-ID: <YTmXqZvokzsKwXLT@google.com>
References: <20210823122235.116189-1-senozhatsky@chromium.org>
 <20210823122235.116189-9-senozhatsky@chromium.org>
 <YSzZUjZvtW11AFGE@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSzZUjZvtW11AFGE@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On (21/08/30 22:12), Tomasz Figa wrote:
[..]
> > +	/* This takes care of DMABUF and user-enforced cache sync hint */
> >  	if (buf->vb->skip_cache_sync_on_prepare)
> >  		return;
> >  
> > +	/*
> > +	 * Coherent MMAP buffers do not need to be synced, unlike USERPTR
> > +	 * and non-coherent MMAP buffers.
> > +	 */
> > +	if (buf->vb->memory == V4L2_MEMORY_MMAP && !buf->non_coherent_mem)
> > +		return;
> 
> nit: Would it make sense to also set buf->non_coherent_mem to 1 in
> vb2_dc_get_userptr() and simplify this check?

Sounds good. Done.

> > +
> >  	if (!sgt)
> 
> Is there a case when this would be true at this point?

We always set ->dma_sgt only for non-coherent buffers at allocation time.

The rest (including this if-condition) is form the upstream code.
Why was it added there. For USERPTR and coherent MMAP?

> >  		return;
> >  
> > +	/* For both USERPTR and non-coherent MMAP */
> >  	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
> > +
> > +	/* Non-coherent MMAP only */
> > +	if (buf->non_coherent_mem && buf->vaddr)
> 
> Then this could check only for buf->vaddr.
> 
> > +		flush_kernel_vmap_range(buf->vaddr, buf->size);
> >  }
> >  
> >  static void vb2_dc_finish(void *buf_priv)
> > @@ -115,13 +152,26 @@ static void vb2_dc_finish(void *buf_priv)
> 
> Same comments as for _prepare.

Done.


> > +static int vb2_dc_alloc_non_coherent(struct vb2_dc_buf *buf)
> > +{
> > +	struct vb2_queue *q = buf->vb->vb2_queue;
> > +
> > +	buf->dma_sgt = dma_alloc_noncontiguous(buf->dev,
> > +					       buf->size,
> > +					       buf->dma_dir,
> > +					       GFP_KERNEL | q->gfp_flags,
> > +					       buf->attrs);
> > +	if (!buf->dma_sgt)
> > +		return -ENOMEM;
> > +
> > +	buf->dma_addr = sg_dma_address(buf->dma_sgt->sgl);
> > +
> > +	/*
> > +	 * For requests that need kernel mapping (DMA_ATTR_NO_KERNEL_MAPPING
> > +	 * bit is cleared) we perform dma_vmap_noncontiguous() in vb2_dc_vaddr()
> > +	 */
> 
> Current code now ignores the attribute, so this comment isn't entirely
> accurate. Maybe it's better to remove the mention of the attribute and
> instead say that for non_coherent buffers the kernel mapping is created on
> demand?

Done.

> >  static int vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf, struct dma_buf_map *map)
> >  {
> > -	struct vb2_dc_buf *buf = dbuf->priv;
> > +	struct vb2_dc_buf *buf;
> > +	void *vaddr;
> > +
> > +	buf = dbuf->priv;
> > +	vaddr = vb2_dc_vaddr(buf->vb, buf);
> > +	if (!vaddr)
> > +		return -EINVAL;
> >  
> > -	dma_buf_map_set_vaddr(map, buf->vaddr);
> > +	dma_buf_map_set_vaddr(map, vaddr);
> >  
> >  	return 0;
> >  }
> > @@ -390,6 +499,9 @@ static struct sg_table *vb2_dc_get_base_sgt(struct vb2_dc_buf *buf)
> >  	int ret;
> >  	struct sg_table *sgt;
> >  
> > +	if (buf->non_coherent_mem)
> > +		return buf->dma_sgt;
> 
> Wouldn't this lead to a double free in vb2_dc_put()?

Most likely. Done, thank you.
