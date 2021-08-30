Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 423D93FB6C7
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 15:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236537AbhH3NNt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 09:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231923AbhH3NNs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 09:13:48 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4334C061575
        for <linux-media@vger.kernel.org>; Mon, 30 Aug 2021 06:12:54 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id t42so12135210pfg.12
        for <linux-media@vger.kernel.org>; Mon, 30 Aug 2021 06:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xMiOKEABUuuYM/La3iWDzeHNFhRaUgMToSjKTRiBBs8=;
        b=B5fV6Trc3RciA6eFtl/LMZgE6BHXs/tRBmlYMbHQ7I+PTA+8LINsf/bkJgdQ1q4Rgf
         J6bLDwE+wYkO9RRSEvyrGr4KaISI1M0W1RnipJaztuJBkykYKN/UiZHE8Qkt3X8NWcja
         1JgO8WwnPpgyQSmhSdaD8AQaowsMFovWEouLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xMiOKEABUuuYM/La3iWDzeHNFhRaUgMToSjKTRiBBs8=;
        b=Xm+kuUEy5rS9s1JuoNS8iUcsGrCTM+RXJqOyzgs/hsRD5sfUtkylbnu+FVxJ7fYJC+
         INV8TlRQhObIKww6X+bU30ZZ05BOKfT29nqFYiA1VlSf+JCkcMJ8tc0tOOARfNVfexaZ
         QxGRMaHF4ZY4RSKCQmeWZENWEPB2tpfEfI71NgLO2Wicj/1b9Y6Jw6v0NZ2ijs2WVBOo
         WG9QsdxLCfkbBWoXKDczvbBt/kAAf9r8MrBUe0+5SvxJN0vTPWuApqxiV8c+l4Inp2Px
         JffAUGCq4HObIG6R8RIJMd76PboXd7weOPQ91NLrL3zO8FK1EGPDWsp7udQDrXBiViV4
         iCUg==
X-Gm-Message-State: AOAM530jTyaGZKcI0kvbGUt3omvfaRZ9MrSjuoprTKiTn9zotI+CGov3
        orImMpld24PZBUV6FqZqVtQFJw==
X-Google-Smtp-Source: ABdhPJxNJ3ACvlMu0O0GiCAW/fOgZ2uj3pS0zjg11TfwtZ7gy/4duqkAiaCRYJkAoNixkJdkkvp44Q==
X-Received: by 2002:a63:f501:: with SMTP id w1mr21739282pgh.57.1630329174213;
        Mon, 30 Aug 2021 06:12:54 -0700 (PDT)
Received: from chromium.org ([2401:fa00:8f:203:b6e4:322c:c468:357c])
        by smtp.gmail.com with ESMTPSA id m64sm17617899pga.55.2021.08.30.06.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 06:12:53 -0700 (PDT)
Date:   Mon, 30 Aug 2021 22:12:50 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv5 8/8] videobuf2: handle non-contiguous DMA allocations
Message-ID: <YSzZUjZvtW11AFGE@chromium.org>
References: <20210823122235.116189-1-senozhatsky@chromium.org>
 <20210823122235.116189-9-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210823122235.116189-9-senozhatsky@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey,

On Mon, Aug 23, 2021 at 09:22:35PM +0900, Sergey Senozhatsky wrote:
> This adds support for the new noncontiguous DMA API, which
> requires allocators to have two execution branches: one
> for the current API, and one for the new one.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Acked-by: Christoph Hellwig <hch@lst.de>
> ---
>  .../common/videobuf2/videobuf2-dma-contig.c   | 164 +++++++++++++++---
>  1 file changed, 138 insertions(+), 26 deletions(-)
> 

Thanks a lot for the patch. Please see my comments inline.

> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 1e218bc440c6..f1ad36b04e3a 100644
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
> @@ -42,6 +43,7 @@ struct vb2_dc_buf {
>  	struct dma_buf_attachment	*db_attach;
>  
>  	struct vb2_buffer		*vb;
> +	bool				non_coherent_mem;
>  };
>  
>  /*********************************************/
> @@ -75,17 +77,39 @@ static void *vb2_dc_cookie(struct vb2_buffer *vb, void *buf_priv)
>  	return &buf->dma_addr;
>  }
>  
> +/*
> + * This function may fail if:
> + *
> + * - dma_buf_vmap() fails
> + *   E.g. due to lack of virtual mapping address space, or due to
> + *   dmabuf->ops misconfiguration.
> + *
> + * - dma_vmap_noncontiguous() fails
> + *   For instance, when requested buffer size is larger than totalram_pages().
> + *   Relevant for buffers that use non-coherent memory.
> + *
> + * - Queue DMA attrs have DMA_ATTR_NO_KERNEL_MAPPING set
> + *   Relevant for buffers that use coherent memory.
> + */
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
> +
> +		return buf->vaddr;
>  	}
>  
> +	if (buf->non_coherent_mem)
> +		buf->vaddr = dma_vmap_noncontiguous(buf->dev, buf->size,
> +						    buf->dma_sgt);
>  	return buf->vaddr;
>  }
>  
> @@ -101,13 +125,26 @@ static void vb2_dc_prepare(void *buf_priv)
>  	struct vb2_dc_buf *buf = buf_priv;
>  	struct sg_table *sgt = buf->dma_sgt;
>  
> +	/* This takes care of DMABUF and user-enforced cache sync hint */
>  	if (buf->vb->skip_cache_sync_on_prepare)
>  		return;
>  
> +	/*
> +	 * Coherent MMAP buffers do not need to be synced, unlike USERPTR
> +	 * and non-coherent MMAP buffers.
> +	 */
> +	if (buf->vb->memory == V4L2_MEMORY_MMAP && !buf->non_coherent_mem)
> +		return;

nit: Would it make sense to also set buf->non_coherent_mem to 1 in
vb2_dc_get_userptr() and simplify this check?

> +
>  	if (!sgt)

Is there a case when this would be true at this point?

>  		return;
>  
> +	/* For both USERPTR and non-coherent MMAP */
>  	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
> +
> +	/* Non-coherent MMAP only */
> +	if (buf->non_coherent_mem && buf->vaddr)

Then this could check only for buf->vaddr.

> +		flush_kernel_vmap_range(buf->vaddr, buf->size);
>  }
>  
>  static void vb2_dc_finish(void *buf_priv)
> @@ -115,13 +152,26 @@ static void vb2_dc_finish(void *buf_priv)

Same comments as for _prepare.

>  	struct vb2_dc_buf *buf = buf_priv;
>  	struct sg_table *sgt = buf->dma_sgt;
>  
> +	/* This takes care of DMABUF and user-enforced cache sync hint */
>  	if (buf->vb->skip_cache_sync_on_finish)
>  		return;
>  
> +	/*
> +	 * Coherent MMAP buffers do not need to be synced, unlike USERPTR
> +	 * and non-coherent MMAP buffers.
> +	 */
> +	if (buf->vb->memory == V4L2_MEMORY_MMAP && !buf->non_coherent_mem)
> +		return;
> +
>  	if (!sgt)
>  		return;
>  
> +	/* For both USERPTR and non-coherent MMAP */
>  	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
> +
> +	/* Non-coherent MMAP only */
> +	if (buf->non_coherent_mem && buf->vaddr)
> +		invalidate_kernel_vmap_range(buf->vaddr, buf->size);
>  }
>  
>  /*********************************************/
> @@ -139,17 +189,66 @@ static void vb2_dc_put(void *buf_priv)
>  		sg_free_table(buf->sgt_base);
>  		kfree(buf->sgt_base);
>  	}
> -	dma_free_attrs(buf->dev, buf->size, buf->cookie, buf->dma_addr,
> -		       buf->attrs);
> +
> +	if (buf->non_coherent_mem) {
> +		if (buf->vaddr)
> +			dma_vunmap_noncontiguous(buf->dev, buf->vaddr);
> +		dma_free_noncontiguous(buf->dev, buf->size,
> +				       buf->dma_sgt, buf->dma_dir);
> +	} else {
> +		dma_free_attrs(buf->dev, buf->size, buf->cookie,
> +			       buf->dma_addr, buf->attrs);
> +	}
>  	put_device(buf->dev);
>  	kfree(buf);
>  }
>  
> +static int vb2_dc_alloc_coherent(struct vb2_dc_buf *buf)
> +{
> +	struct vb2_queue *q = buf->vb->vb2_queue;
> +
> +	buf->cookie = dma_alloc_attrs(buf->dev,
> +				      buf->size,
> +				      &buf->dma_addr,
> +				      GFP_KERNEL | q->gfp_flags,
> +				      buf->attrs);
> +	if (!buf->cookie)
> +		return -ENOMEM;
> +
> +	if (q->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
> +		return 0;
> +
> +	buf->vaddr = buf->cookie;
> +	return 0;
> +}
> +
> +static int vb2_dc_alloc_non_coherent(struct vb2_dc_buf *buf)
> +{
> +	struct vb2_queue *q = buf->vb->vb2_queue;
> +
> +	buf->dma_sgt = dma_alloc_noncontiguous(buf->dev,
> +					       buf->size,
> +					       buf->dma_dir,
> +					       GFP_KERNEL | q->gfp_flags,
> +					       buf->attrs);
> +	if (!buf->dma_sgt)
> +		return -ENOMEM;
> +
> +	buf->dma_addr = sg_dma_address(buf->dma_sgt->sgl);
> +
> +	/*
> +	 * For requests that need kernel mapping (DMA_ATTR_NO_KERNEL_MAPPING
> +	 * bit is cleared) we perform dma_vmap_noncontiguous() in vb2_dc_vaddr()
> +	 */

Current code now ignores the attribute, so this comment isn't entirely
accurate. Maybe it's better to remove the mention of the attribute and
instead say that for non_coherent buffers the kernel mapping is created on
demand?

> +	return 0;
> +}
> +
>  static void *vb2_dc_alloc(struct vb2_buffer *vb,
>  			  struct device *dev,
>  			  unsigned long size)
>  {
>  	struct vb2_dc_buf *buf;
> +	int ret;
>  
>  	if (WARN_ON(!dev))
>  		return ERR_PTR(-EINVAL);
> @@ -159,27 +258,28 @@ static void *vb2_dc_alloc(struct vb2_buffer *vb,
>  		return ERR_PTR(-ENOMEM);
>  
>  	buf->attrs = vb->vb2_queue->dma_attrs;
> -	buf->cookie = dma_alloc_attrs(dev, size, &buf->dma_addr,
> -				      GFP_KERNEL | vb->vb2_queue->gfp_flags,
> -				      buf->attrs);
> -	if (!buf->cookie) {
> -		dev_err(dev, "dma_alloc_coherent of size %ld failed\n", size);
> -		kfree(buf);
> -		return ERR_PTR(-ENOMEM);
> -	}
> -
> -	if ((buf->attrs & DMA_ATTR_NO_KERNEL_MAPPING) == 0)
> -		buf->vaddr = buf->cookie;
> +	buf->dma_dir = vb->vb2_queue->dma_dir;
> +	buf->vb = vb;
> +	buf->non_coherent_mem = vb->vb2_queue->non_coherent_mem;
>  
> +	buf->size = size;
>  	/* Prevent the device from being released while the buffer is used */
>  	buf->dev = get_device(dev);
> -	buf->size = size;
> -	buf->dma_dir = vb->vb2_queue->dma_dir;
> +
> +	if (buf->non_coherent_mem)
> +		ret = vb2_dc_alloc_non_coherent(buf);
> +	else
> +		ret = vb2_dc_alloc_coherent(buf);
> +
> +	if (ret) {
> +		dev_err(dev, "dma alloc of size %ld failed\n", size);
> +		kfree(buf);
> +		return ERR_PTR(-ENOMEM);
> +	}
>  
>  	buf->handler.refcount = &buf->refcount;
>  	buf->handler.put = vb2_dc_put;
>  	buf->handler.arg = buf;
> -	buf->vb = vb;
>  
>  	refcount_set(&buf->refcount, 1);
>  
> @@ -196,9 +296,12 @@ static int vb2_dc_mmap(void *buf_priv, struct vm_area_struct *vma)
>  		return -EINVAL;
>  	}
>  
> -	ret = dma_mmap_attrs(buf->dev, vma, buf->cookie,
> -		buf->dma_addr, buf->size, buf->attrs);
> -
> +	if (buf->non_coherent_mem)
> +		ret = dma_mmap_noncontiguous(buf->dev, vma, buf->size,
> +					     buf->dma_sgt);
> +	else
> +		ret = dma_mmap_attrs(buf->dev, vma, buf->cookie, buf->dma_addr,
> +				     buf->size, buf->attrs);
>  	if (ret) {
>  		pr_err("Remapping memory failed, error: %d\n", ret);
>  		return ret;
> @@ -360,9 +463,15 @@ vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
>  
>  static int vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf, struct dma_buf_map *map)
>  {
> -	struct vb2_dc_buf *buf = dbuf->priv;
> +	struct vb2_dc_buf *buf;
> +	void *vaddr;
> +
> +	buf = dbuf->priv;
> +	vaddr = vb2_dc_vaddr(buf->vb, buf);
> +	if (!vaddr)
> +		return -EINVAL;
>  
> -	dma_buf_map_set_vaddr(map, buf->vaddr);
> +	dma_buf_map_set_vaddr(map, vaddr);
>  
>  	return 0;
>  }
> @@ -390,6 +499,9 @@ static struct sg_table *vb2_dc_get_base_sgt(struct vb2_dc_buf *buf)
>  	int ret;
>  	struct sg_table *sgt;
>  
> +	if (buf->non_coherent_mem)
> +		return buf->dma_sgt;

Wouldn't this lead to a double free in vb2_dc_put()?

Best regards,
Tomasz
