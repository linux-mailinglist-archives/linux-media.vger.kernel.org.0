Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2313D2B17
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 19:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbhGVQp5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 12:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbhGVQp4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 12:45:56 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94115C061575;
        Thu, 22 Jul 2021 10:26:31 -0700 (PDT)
Received: from [IPv6:2a02:810a:880:f54:9b:291e:f55f:ae5f] (unknown [IPv6:2a02:810a:880:f54:9b:291e:f55f:ae5f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E85C71F44581;
        Thu, 22 Jul 2021 18:26:29 +0100 (BST)
Subject: Re: [PATCHv3 8/8] videobuf2: handle non-contiguous DMA allocations
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>
References: <20210709092027.1050834-1-senozhatsky@chromium.org>
 <20210709092027.1050834-9-senozhatsky@chromium.org>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <3c80786a-7422-3736-7261-8605260eb99f@collabora.com>
Date:   Thu, 22 Jul 2021 19:26:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709092027.1050834-9-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On 09.07.21 11:20, Sergey Senozhatsky wrote:
> This adds support for new noncontiguous DMA API, which
> requires allocators to have two execution branches: one
> for the current API, and one for the new one.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Acked-by: Christoph Hellwig <hch@lst.de>
> ---
>   .../common/videobuf2/videobuf2-dma-contig.c   | 139 ++++++++++++++----
>   1 file changed, 114 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 1e218bc440c6..7408ac9ed60a 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -17,6 +17,7 @@
>   #include <linux/sched.h>
>   #include <linux/slab.h>
>   #include <linux/dma-mapping.h>
> +#include <linux/highmem.h>
>   
>   #include <media/videobuf2-v4l2.h>
>   #include <media/videobuf2-dma-contig.h>
> @@ -42,6 +43,7 @@ struct vb2_dc_buf {
>   	struct dma_buf_attachment	*db_attach;
>   
>   	struct vb2_buffer		*vb;
> +	bool				coherent_mem;
>   };
>   
>   /*********************************************/
> @@ -78,14 +80,22 @@ static void *vb2_dc_cookie(struct vb2_buffer *vb, void *buf_priv)
>   static void *vb2_dc_vaddr(struct vb2_buffer *vb, void *buf_priv)
>   {
>   	struct vb2_dc_buf *buf = buf_priv;
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
>   	}
>   
> +	if (!buf->coherent_mem)
> +		buf->vaddr = dma_vmap_noncontiguous(buf->dev, buf->size,
> +						    buf->dma_sgt);
>   	return buf->vaddr;
>   }
>   
> @@ -101,13 +111,26 @@ static void vb2_dc_prepare(void *buf_priv)
>   	struct vb2_dc_buf *buf = buf_priv;
>   	struct sg_table *sgt = buf->dma_sgt;
>   
> +	/* This takes care of DMABUF and user-enforced cache sync hint */
>   	if (buf->vb->skip_cache_sync_on_prepare)
>   		return;
>   
> +	/*
> +	 * Coherent MMAP buffers do not need to be synced, unlike USERPTR
> +	 * and non-coherent MMAP buffers.
> +	 */
> +	if (buf->vb->memory == V4L2_MEMORY_MMAP && buf->coherent_mem)
> +		return;
> +
>   	if (!sgt)
>   		return;
>   
> +	/* For both USERPTR and non-coherent MMAP */
>   	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
> +
> +	/* Non-coherent MMAP only */
> +	if (!buf->coherent_mem && buf->vaddr)
> +		flush_kernel_vmap_range(buf->vaddr, buf->size);
>   }
>   
>   static void vb2_dc_finish(void *buf_priv)
> @@ -115,13 +138,26 @@ static void vb2_dc_finish(void *buf_priv)
>   	struct vb2_dc_buf *buf = buf_priv;
>   	struct sg_table *sgt = buf->dma_sgt;
>   
> +	/* This takes care of DMABUF and user-enforced cache sync hint */
>   	if (buf->vb->skip_cache_sync_on_finish)
>   		return;
>   
> +	/*
> +	 * Coherent MMAP buffers do not need to be synced, unlike USERPTR
> +	 * and non-coherent MMAP buffers.
> +	 */
> +	if (buf->vb->memory == V4L2_MEMORY_MMAP && buf->coherent_mem)
> +		return;
> +
>   	if (!sgt)
>   		return;
>   
> +	/* For both USERPTR and non-coherent MMAP */
>   	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
> +
> +	/* Non-coherent MMAP only */
> +	if (!buf->coherent_mem && buf->vaddr)
> +		invalidate_kernel_vmap_range(buf->vaddr, buf->size);
>   }
>   
>   /*********************************************/
> @@ -139,17 +175,63 @@ static void vb2_dc_put(void *buf_priv)
>   		sg_free_table(buf->sgt_base);
>   		kfree(buf->sgt_base);
>   	}
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
> +				       buf->dma_sgt, buf->dma_addr);

The last argument for dma_free_noncontiguous should be dma_dir.
Also, the 'cookie' cb returns buf->dma_addr which is not initialized for
the noncontiguous api. So it is not clear how drivers should use the new api.
Many drivers call vb2_dma_contig_plane_dma_addr which returns the cookie.

Thanks,
Dafna

> +	}
>   	put_device(buf->dev);
>   	kfree(buf);
>   }
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
> +	/*
> +	 * For requests that need kernel mapping (DMA_ATTR_NO_KERNEL_MAPPING
> +	 * bit is cleared) we perform dma_vmap_noncontiguous() in vb2_dc_vadd().
> +	 */
> +	return 0;
> +}
> +
>   static void *vb2_dc_alloc(struct vb2_buffer *vb,
>   			  struct device *dev,
>   			  unsigned long size)
>   {
>   	struct vb2_dc_buf *buf;
> +	int ret;
>   
>   	if (WARN_ON(!dev))
>   		return ERR_PTR(-EINVAL);
> @@ -159,27 +241,28 @@ static void *vb2_dc_alloc(struct vb2_buffer *vb,
>   		return ERR_PTR(-ENOMEM);
>   
>   	buf->attrs = vb->vb2_queue->dma_attrs;
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
>   	/* Prevent the device from being released while the buffer is used */
>   	buf->dev = get_device(dev);
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
>   	buf->handler.refcount = &buf->refcount;
>   	buf->handler.put = vb2_dc_put;
>   	buf->handler.arg = buf;
> -	buf->vb = vb;
>   
>   	refcount_set(&buf->refcount, 1);
>   
> @@ -196,9 +279,12 @@ static int vb2_dc_mmap(void *buf_priv, struct vm_area_struct *vma)
>   		return -EINVAL;
>   	}
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
>   	if (ret) {
>   		pr_err("Remapping memory failed, error: %d\n", ret);
>   		return ret;
> @@ -362,7 +448,7 @@ static int vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf, struct dma_buf_map *map)
>   {
>   	struct vb2_dc_buf *buf = dbuf->priv;
>   
> -	dma_buf_map_set_vaddr(map, buf->vaddr);
> +	dma_buf_map_set_vaddr(map, vb2_dc_vaddr(buf->vb, buf));
>   
>   	return 0;
>   }
> @@ -390,6 +476,9 @@ static struct sg_table *vb2_dc_get_base_sgt(struct vb2_dc_buf *buf)
>   	int ret;
>   	struct sg_table *sgt;
>   
> +	if (!buf->coherent_mem)
> +		return buf->dma_sgt;
> +
>   	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
>   	if (!sgt) {
>   		dev_err(buf->dev, "failed to alloc sg table\n");
> 
