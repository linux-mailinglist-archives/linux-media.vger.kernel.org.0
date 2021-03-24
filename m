Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 510823477DF
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 13:08:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232545AbhCXMHp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 08:07:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbhCXMHc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 08:07:32 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 391CFC0613DE
        for <linux-media@vger.kernel.org>; Wed, 24 Mar 2021 05:07:32 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id x126so17164712pfc.13
        for <linux-media@vger.kernel.org>; Wed, 24 Mar 2021 05:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VuRjzLbq9QnW+8wXxMXWYUJMkL1n+ttgNIblb9wNPMY=;
        b=Jmf4GwCa9kb2V3V3DQGPMOWNdAGbcq1ehTkfWzAE8kTBmYMS1wi3tGPYs60ueI8bKQ
         SVGgiY1qKloFHgxi4fAUT3ijseg5Gk6phovVoAS4JU3M/Txb4zU7qAL98bTpgsCxBNoW
         GiA8JaEg9Xfs2o/SkXapZZUDxkLLPj50HQYR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VuRjzLbq9QnW+8wXxMXWYUJMkL1n+ttgNIblb9wNPMY=;
        b=jN0QwxWexivFu9DkSHj1XA8w35MkwTTgsiGAXqyMd0/ivhBGbBFmc6ywKUZ4SSDYXe
         BkbUMz5PhlbCfhn3QDQD1w8aYi7htzHOu9BvY+IvBL27w3JlG03q6ciOAo6pEwjG9wJF
         NWXu+ahVQn5V1k0rhGgDBpXbohJY9uib4YPQut2c22twuzkeIwepB2fwonAZzglMd9yw
         w5F7pkySh3fSi0K3J7ylZQyZ4OpbYXYQduBP2ioadYClL9nSMpxKDpFZqOSdoLYGr1/b
         OykiN4BzyanRlKP6374opBnJFlVCfw87Tw5qtJanBFy/Z+ZV5TQH9Jf5zYcUDAlO1geX
         DILA==
X-Gm-Message-State: AOAM530FRk9vGUQ1gOl9LOvjbjodwafnhfndyUv5RL9lQcdrNLNaMtnO
        gcQnKygpK9MijZD0N+qAQhAxhg==
X-Google-Smtp-Source: ABdhPJx6WFmeKyJOgqsIGbUO6Yr7ZPHJtYMk5x6PGi9zyq0bfEFkZ3YetEjgUQrA5UxsudozmfIWUQ==
X-Received: by 2002:a63:fe56:: with SMTP id x22mr2728134pgj.329.1616587651535;
        Wed, 24 Mar 2021 05:07:31 -0700 (PDT)
Received: from chromium.org ([2401:fa00:8f:2:9cb3:4047:113:3430])
        by smtp.gmail.com with ESMTPSA id y8sm2315523pge.56.2021.03.24.05.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:07:29 -0700 (PDT)
Date:   Wed, 24 Mar 2021 21:07:26 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] videobuf2: handle non-contiguous DMA allocations
Message-ID: <YFsrfu8eYMX28195@chromium.org>
References: <20210302004624.31294-1-senozhatsky@chromium.org>
 <20210302004624.31294-9-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210302004624.31294-9-senozhatsky@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 02, 2021 at 09:46:24AM +0900, Sergey Senozhatsky wrote:
> This adds support for new noncontiguous DMA API, which
> requires allocators to have two execution branches: one
> for the current API, and one for the new one.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> [hch: untested conversion to the ne API]
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  .../common/videobuf2/videobuf2-dma-contig.c   | 141 +++++++++++++++---
>  1 file changed, 117 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 1e218bc440c6..d6a9f7b682f3 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -17,6 +17,7 @@
>  #include <linux/sched.h>
>  #include <linux/slab.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/highmem.h>
>  
>  #include <media/videobuf2-v4l2.h>
>  #include <media/videobuf2-dma-contig.h>
> @@ -42,8 +43,14 @@ struct vb2_dc_buf {
>  	struct dma_buf_attachment	*db_attach;
>  
>  	struct vb2_buffer		*vb;
> +	unsigned int			non_coherent_mem:1;
>  };
>  
> +static bool vb2_dc_is_coherent(struct vb2_dc_buf *buf)
> +{
> +	return !buf->non_coherent_mem;
> +}

nit: Given that this is just a simple negated return, do we need a dedicated
helper for it?

> +
>  /*********************************************/
>  /*        scatterlist table functions        */
>  /*********************************************/
> @@ -78,12 +85,21 @@ static void *vb2_dc_cookie(struct vb2_buffer *vb, void *buf_priv)
>  static void *vb2_dc_vaddr(struct vb2_buffer *vb, void *buf_priv)
>  {
>  	struct vb2_dc_buf *buf = buf_priv;
> -	struct dma_buf_map map;
> -	int ret;
>  
> -	if (!buf->vaddr && buf->db_attach) {
> -		ret = dma_buf_vmap(buf->db_attach->dmabuf, &map);
> -		buf->vaddr = ret ? NULL : map.vaddr;
> +	if (buf->vaddr)
> +		return buf->vaddr;
> +
> +	if (buf->db_attach) {
> +		struct dma_buf_map map;
> +
> +		if (!dma_buf_vmap(buf->db_attach->dmabuf, &map))
> +			buf->vaddr = map.vaddr;
> +	}
> +
> +	if (!vb2_dc_is_coherent(buf)) {

I believe it's not possible for both buf->db_attach and
!vb2_dc_is_coherent() to be true, but nevertheless the code can be
misleading for the reader. Would it make sense to just return early in the
if that handles db_attach?

> +		buf->vaddr = dma_vmap_noncontiguous(buf->dev,
> +						    buf->size,
> +						    buf->dma_sgt);
>  	}
>  
>  	return buf->vaddr;
> @@ -101,13 +117,26 @@ static void vb2_dc_prepare(void *buf_priv)
>  	struct vb2_dc_buf *buf = buf_priv;
>  	struct sg_table *sgt = buf->dma_sgt;
>  
> +	/* This takes care of DMABUF and user-enforced cache sync hint */
>  	if (buf->vb->skip_cache_sync_on_prepare)
>  		return;
>  
> +	/*
> +	 * Coherent MMAP buffers do not need to be synced, unlike coherent
> +	 * USERPTR and non-coherent MMAP buffers.

USERPTR buffers are always considered non-coherent.

> +	 */
> +	if (buf->vb->memory == V4L2_MEMORY_MMAP && vb2_dc_is_coherent(buf))
> +		return;
> +
>  	if (!sgt)
>  		return;
>  
> +	/* For both USERPTR and non-coherent MMAP */
>  	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
> +
> +	/* Non-coherrent MMAP only */
> +	if (!vb2_dc_is_coherent(buf) && buf->vaddr)
> +		flush_kernel_vmap_range(buf->vaddr, buf->size);
>  }
>  
>  static void vb2_dc_finish(void *buf_priv)
> @@ -115,19 +144,46 @@ static void vb2_dc_finish(void *buf_priv)
>  	struct vb2_dc_buf *buf = buf_priv;
>  	struct sg_table *sgt = buf->dma_sgt;
>  
> +	/* This takes care of DMABUF and user-enforced cache sync hint */
>  	if (buf->vb->skip_cache_sync_on_finish)
>  		return;
>  
> +	/*
> +	 * Coherent MMAP buffers do not need to be synced, unlike coherent
> +	 * USERPTR and non-coherent MMAP buffers.

Ditto.

> +	 */
> +	if (buf->vb->memory == V4L2_MEMORY_MMAP && vb2_dc_is_coherent(buf))
> +		return;
> +
>  	if (!sgt)
>  		return;
>  
> +	/* For both USERPTR and non-coherent MMAP */
>  	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
> +
> +	/* Non-coherrent MMAP only */
> +	if (!vb2_dc_is_coherent(buf) && buf->vaddr)
> +		invalidate_kernel_vmap_range(buf->vaddr, buf->size);
>  }
>  
>  /*********************************************/
>  /*        callbacks for MMAP buffers         */
>  /*********************************************/
>  
> +static void __vb2_dc_put(struct vb2_dc_buf *buf)
> +{
> +	if (vb2_dc_is_coherent(buf)) {
> +		dma_free_attrs(buf->dev, buf->size, buf->cookie,
> +			       buf->dma_addr, buf->attrs);
> +		return;
> +	}
> +
> +	if (buf->vaddr)
> +		dma_vunmap_noncontiguous(buf->dev, buf->vaddr);
> +	dma_free_noncontiguous(buf->dev, buf->size,
> +			       buf->dma_sgt, buf->dma_addr);
> +}
> +
>  static void vb2_dc_put(void *buf_priv)

nit: Unrelated to this patch or series, but could be a follow-up clean-up:
Could we rename this and the newly added function to include mmap in the
name, since it's only for MMAP buffers?

Best regards,
Tomasz

