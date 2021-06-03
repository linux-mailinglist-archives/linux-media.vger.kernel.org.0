Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3173139A074
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 13:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbhFCMBm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 08:01:42 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:59819 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229747AbhFCMBl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Jun 2021 08:01:41 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id om0ulbl8qIpGyom0xlRZDb; Thu, 03 Jun 2021 13:59:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622721596; bh=AW2E+LndgntmgXR1pFLfiiExeEpYWPk/nwb66rMkL2w=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=WIkzMd76ZCu7G05O6iUW+7lIKWQUmSYjUmgfM5X9pf74qwVUrRmacHhk5yaHk3kHU
         YeNYwWBJtd7iceMLSWQVcsNhpAY8Dz0GYJ9jG98hDfONAFo72KeOrP9Rf3a9N6/PIn
         H5ZBGMwocuuEXQFdusrTPnPh0urYyIeooir3NY/r/jWSKLi+JbCoxa9OPllAhdU+2a
         vmrTSzJJBRM2cnFOe5lfFxyofhhFaEKB3bmQf5I1smURgYa1iT0exP6QQ2hb175Ucp
         1/HlNy0rQ42CNduDlB1ib7jpZCysqYleziqzf4NgLvtzB6IFTkv/H5kATSG57pA1zy
         Jj16zC8/LeFWw==
Subject: Re: [PATCHv2 8/8] videobuf2: handle non-contiguous DMA allocations
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210427131344.139443-1-senozhatsky@chromium.org>
 <20210427131344.139443-9-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <10a0903a-e295-5cba-683a-1eb89a0804ed@xs4all.nl>
Date:   Thu, 3 Jun 2021 13:59:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427131344.139443-9-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAYrHzvBcPfqG8u2vhz38wm5UNvY+T0Kh1qffrhWzjCXtfvMc7zIYnsspn4igYy6pjzKkNJcTVO3trQVqVIt7NCE0c7LBA3n3z03efIFQ7hoYb8X55U5
 9c0eFcAwuESbmeHHwHmRSuyXiH5ujkA07a+sQRKBnZ+rUMPpBvure7nJSkDb4R3feqH/6rq+lZzB5blP4My99h8/DcaMSiOaFOOO7W5+AkmeGQS9vj+/Jylq
 jjx/l94x2WJLAMa5yleBqXUT9T6n1uebmN/Mfyu9+fiTg7PivdSeeJIlPDHK8tvHq2ZwY3qwXnwlUrI/wyDCexLb1GzllLgAeow7QwCJ/ZPSKVR55ie3ovuE
 4B5/h453M6pO7ImfOMoKLQIhLCQgWYLG2Pus+w4pH5w7aOp+axQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/04/2021 15:13, Sergey Senozhatsky wrote:
> This adds support for new noncontiguous DMA API, which
> requires allocators to have two execution branches: one
> for the current API, and one for the new one.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> [hch: untested conversion to the ne API]
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  .../common/videobuf2/videobuf2-dma-contig.c   | 140 +++++++++++++++---
>  1 file changed, 116 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 1e218bc440c6..40eaaef1565b 100644
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
> +	bool				coherent_mem;
>  };
>  
>  /*********************************************/
> @@ -78,14 +80,22 @@ static void *vb2_dc_cookie(struct vb2_buffer *vb, void *buf_priv)
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
> +	/* Non-coherent memory */
> +	buf->vaddr = dma_vmap_noncontiguous(buf->dev, buf->size, buf->dma_sgt);
> +

This function can use some comments. What is happening AFAICS is that
buf->vaddr is either set in vb2_dc_alloc_coherent (unless
DMA_ATTR_NO_KERNEL_MAPPING was set), it is obtained through dma_buf_vmap()
if the buffer was attached to a dma_buf, or it is allocated via
dma_vmap_noncontiguous() for non-coherent memory.

But this leaves coherent memory with DMA_ATTR_NO_KERNEL_MAPPING set, what
is vaddr in that case? I think it will call dma_vmap_noncontiguous()
incorrectly in that case, shouldn't there be a check for !buf->coherent_mem
before the call to dma_vmap_noncontiguous()?

It's quite confusing since vaddr can be set in different functions.

>  	return buf->vaddr;
>  }
>  
> @@ -101,13 +111,26 @@ static void vb2_dc_prepare(void *buf_priv)
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
> +	if (buf->vb->memory == V4L2_MEMORY_MMAP && buf->coherent_mem)
> +		return;
> +
>  	if (!sgt)
>  		return;
>  
> +	/* For both USERPTR and non-coherent MMAP */
>  	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
> +
> +	/* Non-coherent MMAP only */
> +	if (!buf->coherent_mem && buf->vaddr)
> +		flush_kernel_vmap_range(buf->vaddr, buf->size);
>  }
>  
>  static void vb2_dc_finish(void *buf_priv)
> @@ -115,19 +138,46 @@ static void vb2_dc_finish(void *buf_priv)
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
> +	if (buf->vb->memory == V4L2_MEMORY_MMAP && buf->coherent_mem)
> +		return;
> +
>  	if (!sgt)
>  		return;
>  
> +	/* For both USERPTR and non-coherent MMAP */
>  	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
> +
> +	/* Non-coherent MMAP only */
> +	if (!buf->coherent_mem && buf->vaddr)
> +		invalidate_kernel_vmap_range(buf->vaddr, buf->size);
>  }
>  
>  /*********************************************/
>  /*        callbacks for MMAP buffers         */
>  /*********************************************/
>  
> +static void __vb2_dc_put(struct vb2_dc_buf *buf)
> +{
> +	if (buf->coherent_mem) {
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

Is there a reason for creating __vb2_dc_put()? I found it more
a hindrance when reviewing than an advantage. I prefer to have
it moved to vb2_dc_put, that way all the clean up happens in that
single function.

> +
>  static void vb2_dc_put(void *buf_priv)
>  {
>  	struct vb2_dc_buf *buf = buf_priv;
> @@ -139,17 +189,52 @@ static void vb2_dc_put(void *buf_priv)
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
> +	/*
> +	 * For requests that need kernel mapping (DMA_ATTR_NO_KERNEL_MAPPING

I'm confused about this comment: DMA_ATTR_NO_KERNEL_MAPPING is only checked
in vb2_dc_alloc_coherent(), so is this comment valid?

> +	 * bit is cleared) we perform dma_vmap_noncontiguous() later, in
> +	 * vb2_dc_vadd().

Typo: vb2_dc_vadd -> vb2_dc_vaddr

> +	 */

So this leaves buf->vaddr to NULL.

Is it possible that after allocating the buffer, the buffer is exported as a
dma_buf and another device calls dma_buf_ops vb2_dc_dmabuf_ops_vmap, which
in turn calls dma_buf_map_set_vaddr(map, buf->vaddr); with a NULL buf->vaddr?

I may be barking up the wrong tree here, to really understand it I would have
to spend more time.

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
> @@ -159,27 +244,28 @@ static void *vb2_dc_alloc(struct vb2_buffer *vb,
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
> +	buf->coherent_mem = vb->vb2_queue->coherent_mem;
>  
> +	buf->size = size;
>  	/* Prevent the device from being released while the buffer is used */
>  	buf->dev = get_device(dev);
> -	buf->size = size;
> -	buf->dma_dir = vb->vb2_queue->dma_dir;
> +
> +	if (buf->coherent_mem)
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
> @@ -196,9 +282,12 @@ static int vb2_dc_mmap(void *buf_priv, struct vm_area_struct *vma)
>  		return -EINVAL;
>  	}
>  
> -	ret = dma_mmap_attrs(buf->dev, vma, buf->cookie,
> -		buf->dma_addr, buf->size, buf->attrs);
> -
> +	if (buf->coherent_mem)
> +		ret = dma_mmap_attrs(buf->dev, vma, buf->cookie, buf->dma_addr,
> +				     buf->size, buf->attrs);
> +	else
> +		ret = dma_mmap_noncontiguous(buf->dev, vma, buf->size,
> +					     buf->dma_sgt);
>  	if (ret) {
>  		pr_err("Remapping memory failed, error: %d\n", ret);
>  		return ret;
> @@ -390,6 +479,9 @@ static struct sg_table *vb2_dc_get_base_sgt(struct vb2_dc_buf *buf)
>  	int ret;
>  	struct sg_table *sgt;
>  
> +	if (!buf->coherent_mem)
> +		return buf->dma_sgt;
> +
>  	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
>  	if (!sgt) {
>  		dev_err(buf->dev, "failed to alloc sg table\n");
> 

Regards,

	Hans
