Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65BEF3DEAA4
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 12:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235180AbhHCKPo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 06:15:44 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:54649 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235058AbhHCKPo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Aug 2021 06:15:44 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ArSMmE4KA4JsbArSNmm8jW; Tue, 03 Aug 2021 12:15:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627985731; bh=4F5jkNhZtHqRKWcN79t2uJQehd9+55EX5PcrIQxckCM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pnA2wX38J7IXyPGaDeyxwSK6eBym18EK3JHJ5HV2SnwBWRJr9v0/xGn7RfQ8o7GXm
         0EbuTPjVk8u/pTAXON4x1ZGetV9iAGX56G6N/MjqDBuAYXN+q69BJdYaKIpU0wjYgL
         FUxAyiijlF18cwctVUvJM62Wc2aOGJ9F5aKGVXJS03uvJBRfhtzuLcFWcmea/CeP01
         srgSqu9YwYMvpuLq6ynN8fjmpgpWFXqw5ynZ/C+uKBycc1phjrMZciZXoxgGv/ku9y
         kC1E+iP0IDZRmATOLdE7at2vN3NrJz2E5aoQBwmE/tJ4k1TrmHO8Y4DDWoyhVDf/9x
         POlLghoox02PQ==
Subject: Re: [PATCHv4 8/8] videobuf2: handle non-contiguous DMA allocations
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210727070517.443167-1-senozhatsky@chromium.org>
 <20210727070517.443167-9-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <fd1e8bbe-4cbe-9586-7c8f-0896af043d4a@xs4all.nl>
Date:   Tue, 3 Aug 2021 12:15:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727070517.443167-9-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJd71uPAw6XU0cdM1K/BMGaAEhGrXdHWT6K4rcWYm9eA2xVKVj/3ejFblOjmnIGdmMN8TRvZIrgsyJ5spOSRPoHJ6iyeedoch5Hm+tjA+2s8HC4aBoYA
 R7Oak+RFddsKgMEbPaQwd+WX40cmZRg3/3b8/FjF7uPGSeQnUu6Mh3x9XtJgX1vbmjw0eTm5ApTmXBQYa8McTazzbgIObbsT6Nh+Nr9STO+NrDwVDI1KZYxJ
 53DJDBdSpHHA4M/n4Uj0X+53pz1yO3rfWJbuk8Tm0Bt/obNLv+2HJT2R8PMj0KmDmHe8lTXe9whdiDEBJ1rnG7bO2BfO8P8kJiHA36EF/0MALUEZxXkN8UgT
 nfO47Xqk6mtFdKSZYlfN6cP46Ssn6D9b3OwYyLuz1hFTVM7I+pU+yGqu/LqegRbvt/TqclneRz38t5kbkOEUsJWm2PYAX6DhejEp68n0dzAxt0e54J8Htt3z
 EiGOgqgfW65I/E2E+LFQW8OqjPVzM9csvFw7KQxbxdh0tc6MmhxJWlzhkEZSgxl9gtophZrc/hj2YOWJ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey,

On 27/07/2021 09:05, Sergey Senozhatsky wrote:
> This adds support for new noncontiguous DMA API, which
> requires allocators to have two execution branches: one
> for the current API, and one for the new one.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Acked-by: Christoph Hellwig <hch@lst.de>
> ---
>  .../common/videobuf2/videobuf2-dma-contig.c   | 142 +++++++++++++++---
>  1 file changed, 117 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 1e218bc440c6..10f73e27d694 100644
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
> +	if (!buf->coherent_mem)
> +		buf->vaddr = dma_vmap_noncontiguous(buf->dev, buf->size,
> +						    buf->dma_sgt);
>  	return buf->vaddr;
>  }

This function really needs a bunch of comments.

What I want to see here specifically is under which circumstances this function
can return NULL.

- dma_buf_vmap returns an error
- for non-coherent memory dma_vmap_noncontiguous returns an error
- coherent memory with DMA_ATTR_NO_KERNEL_MAPPING set.

In the latter case, if a buffer with coherent memory and DMA_ATTR_NO_KERNEL_MAPPING
is exported as a dma_buf, and dma_buf_vmap is called by the importer of this dma-buf,
what happens then? I think that in that case dma_buf_vmap should return an error?

See also my comment below for the vb2_dc_dmabuf_ops_vmap function.

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
> @@ -115,13 +138,26 @@ static void vb2_dc_finish(void *buf_priv)
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
> @@ -139,17 +175,66 @@ static void vb2_dc_put(void *buf_priv)
>  		sg_free_table(buf->sgt_base);
>  		kfree(buf->sgt_base);
>  	}
> -	dma_free_attrs(buf->dev, buf->size, buf->cookie, buf->dma_addr,
> -		       buf->attrs);
> +
> +	if (buf->coherent_mem) {
> +		dma_free_attrs(buf->dev, buf->size, buf->cookie,
> +			       buf->dma_addr, buf->attrs);
> +	} else {
> +		if (buf->vaddr)
> +			dma_vunmap_noncontiguous(buf->dev, buf->vaddr);
> +		dma_free_noncontiguous(buf->dev, buf->size,
> +				       buf->dma_sgt, buf->dma_dir);
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
> +	 * bit is cleared) we perform dma_vmap_noncontiguous() in vb2_dc_vadd().
> +	 */
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
> @@ -362,7 +451,7 @@ static int vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf, struct dma_buf_map *map)
>  {
>  	struct vb2_dc_buf *buf = dbuf->priv;
>  
> -	dma_buf_map_set_vaddr(map, buf->vaddr);
> +	dma_buf_map_set_vaddr(map, vb2_dc_vaddr(buf->vb, buf));

vb2_dc_vaddr() can return NULL, shouldn't this function return an error in that case?

BTW, looking at where vb2_plane_vaddr() is called in drivers I notice that most (all?)
drivers do not check for NULL. Somewhat scary, to be honest. That's a separate issue, though.

Regards,

	Hans

>  
>  	return 0;
>  }
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

