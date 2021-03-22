Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 299B4343ACB
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 08:40:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbhCVHkW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 03:40:22 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:47285 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229482AbhCVHkL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 03:40:11 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id OFAVldWQVGEYcOFAYlWJy7; Mon, 22 Mar 2021 08:40:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616398810; bh=/LqkFpqeQlWRrrHkf5urMfJTwcAt2w/dOkzEaGC+RhA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Ijo0RjnsA13TcEaA3qqGTxPs63a+O7Godz8nQpBIU/bjP9B8W/G1a5q7MA1hihIxZ
         3muuvF84/v3XLMNvNpQU//NuuWg+jhJwBAfbE43nD6ddU1rIAjrzm/xG9BsF+9uXm9
         GA2u+6cx7QTD+ARGzzL4LBv1rmpq8bzQC96bc6Ycla+0FUh+Cp7ixOwTxStl4wfLu6
         H0IfaHBP5LoACwUbL5R+v8YxzNJCI28XnpNtsi6YPThzN+KjWFuOvFfxj6crTOzAsu
         yYJJKAamWdYdfIla9XcvqPKAbQE9+ODmClE8+t075dXaUZJ5mtZuot4VyTRHPqvauA
         soaMl806mgfKQ==
Subject: Re: [PATCH 8/8] videobuf2: handle non-contiguous DMA allocations
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210302004624.31294-1-senozhatsky@chromium.org>
 <20210302004624.31294-9-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <4430bb1d-ab68-a76d-c408-2d5a979938fa@xs4all.nl>
Date:   Mon, 22 Mar 2021 08:40:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302004624.31294-9-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOwh8snBtYJb7oXL6EUyjwoE5kHJchrQs8s3EpYWvweKHUd7wZ1oFC+SPmnw8YIRVCQgb2lWSXxqdevLuFty86dZ4ZFBfrzaG4LxSihABWTFw+yKFP25
 eQ2RnuhbRjdP49Y8dEUnyLzYD9Ov6CNH5fbvlkw80dpju4yrHpWM+7iS4WQ06knHppZ929gPH7fGrtCp6rM6miBx/W9/OEDglYR4lyZnPRi6F0PpxX4Kx7mB
 h9MLWpmnB1f07UZY7Z3HqyPro7cAX3OEuWzra7rPdqNbqVk/6IrdltC0KFFUx31h0fpP9W7Zod1SI0NHU+anu3ywS4aQahYweKd5ChNUyPyrRiYN598IlAXu
 uaS/ckBs
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/03/2021 01:46, Sergey Senozhatsky wrote:
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

Just use a bool here.

>  };
>  
> +static bool vb2_dc_is_coherent(struct vb2_dc_buf *buf)
> +{
> +	return !buf->non_coherent_mem;
> +}

I would just drop this 'helper' function. Testing against buf->non_coherent_mem
seems perfectly understandable to me. And better than negating that bool in
this helper function.

You can choose to invert non_coherent_mem: i.e. add a coherent_mem bool instead
of a non_coherent_mem bool if you think that is easier to understand. It's set
in just one place (alloc), so that's easy enough.

Calling it 'bool is_coherent;' would perhaps be the easiest to understand.

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

Typo: coherrent -> coherent

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

Same typo.

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
>  {
>  	struct vb2_dc_buf *buf = buf_priv;
> @@ -139,17 +195,47 @@ static void vb2_dc_put(void *buf_priv)
>  		sg_free_table(buf->sgt_base);
>  		kfree(buf->sgt_base);
>  	}
> -	dma_free_attrs(buf->dev, buf->size, buf->cookie, buf->dma_addr,
> -		       buf->attrs);
> +	__vb2_dc_put(buf);
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
> +	if ((q->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING) == 0)
> +		buf->vaddr = buf->cookie;
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

DMA_ATTR_NO_KERNEL_MAPPING makes no sense here? If so, then it would be
good to document that here.

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
> @@ -159,27 +245,28 @@ static void *vb2_dc_alloc(struct vb2_buffer *vb,
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
> +	if (vb2_dc_is_coherent(buf))
> +		ret = vb2_dc_alloc_coherent(buf);
> +	else
> +		ret = vb2_dc_alloc_non_coherent(buf);
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
> @@ -196,9 +283,12 @@ static int vb2_dc_mmap(void *buf_priv, struct vm_area_struct *vma)
>  		return -EINVAL;
>  	}
>  
> -	ret = dma_mmap_attrs(buf->dev, vma, buf->cookie,
> -		buf->dma_addr, buf->size, buf->attrs);
> -
> +	if (vb2_dc_is_coherent(buf))
> +		ret = dma_mmap_attrs(buf->dev, vma, buf->cookie, buf->dma_addr,
> +				     buf->size, buf->attrs);
> +	else
> +		ret = dma_mmap_noncontiguous(buf->dev, vma, buf->size,
> +					     buf->dma_sgt);
>  	if (ret) {
>  		pr_err("Remapping memory failed, error: %d\n", ret);
>  		return ret;
> @@ -390,6 +480,9 @@ static struct sg_table *vb2_dc_get_base_sgt(struct vb2_dc_buf *buf)
>  	int ret;
>  	struct sg_table *sgt;
>  
> +	if (!vb2_dc_is_coherent(buf))
> +		return buf->dma_sgt;
> +
>  	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
>  	if (!sgt) {
>  		dev_err(buf->dev, "failed to alloc sg table\n");
> 

Regards,

	Hans
