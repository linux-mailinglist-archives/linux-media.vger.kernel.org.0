Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0976B3DE88A
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 10:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234487AbhHCIjT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 04:39:19 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:34083 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234423AbhHCIjT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Aug 2021 04:39:19 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Apx4mTE0MXTlcApx5mkQB7; Tue, 03 Aug 2021 10:39:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627979947; bh=OIuaIpUfwyQZg8i0jOmGRNtF+4Vy/qNOyRg2//4RvjU=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=aaaK5lB14dxcmDGwVfgzYsGMHrJunlnzj5C2t9Q5Tu1BBdi400+At9eZ/LhvIzYyk
         51VqNjOTMx+ci8QLbbP3k5Fh1FWCDmyKUU8cS2ER5+K5hLAE43HuUdnrBi/PeQRaN0
         kTQjBIdLuOqpgz7N28h9ibUIiqDfzPIehHT3ZbqlP6l548bgKh8gmZ8Z0ob+7IkUdz
         f0OED93EfD+4IPA8UetvqhDT6oaWZLI/D2/qKKS6dY7empJ7cFR4VOcx0flW54pBdE
         S9zPGubyfAiaGftEW/151I0h/7nL7yJBA/i+9f1uFJgqfuqVon4l2YZUI9xr1zlsbn
         lbIrl3q/lm5PQ==
Subject: Re: [PATCHv4 8/8] videobuf2: handle non-contiguous DMA allocations
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210727070517.443167-1-senozhatsky@chromium.org>
 <20210727070517.443167-9-senozhatsky@chromium.org>
 <7e172194-9519-fd1f-6261-c40108a5d722@xs4all.nl>
Message-ID: <9e5b1d16-bfb8-dc89-beda-94a641be793d@xs4all.nl>
Date:   Tue, 3 Aug 2021 10:39:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7e172194-9519-fd1f-6261-c40108a5d722@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIBefB2Xpo3TO8NDzX/zRNhrUYtT5+9pP0AxCa7d7NhhEd2XSqsY0XE4gcpdtt49Zdi/Zj5QCv7ir3WMkRKiHIZzznmu/B/BlaVfBcuiYgMS1gpxUtBP
 i5xTIkYdB5qMtyWoWBZHMVMzsdhxlnWPqCGkHRb3fl2GkqqZw4cldPhYSP9BPio86ACRkkguqOcepeFt9spFcG6urRuV6NQ71zaje7XFcfra5/i0Xar5s+Di
 EcIZ1U0bgE6JFqWgEiCji50tr8X62SrM8+eSbFPPxZyAEYNYhNBOP5fFs8AobdYImoswVsyjg3FQ+GIZB8NQHvt88bhc3EKDtDzKewhV6wc0DXQuH6JapKJr
 ec60Y9XaoUg/3zbwKAP/ot1tvhUZxvNsdE9LKQ9MU+8tI17+KA3VCtijBDM3XTbrib1qIkGfa0cALh2tngFO3UXz3jiglNyMWw9t3sRszz8Mr+zL0fcVZA1w
 g1d/kKGvJDuVfokp9CI5/5W2IhGqR1BfsTOaO8pvebqH6hrT/ZU+sZ1caZ5Gp0AqVB5naqfbBbXcwWNG
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/08/2021 10:33, Hans Verkuil wrote:
> On 27/07/2021 09:05, Sergey Senozhatsky wrote:
>> This adds support for new noncontiguous DMA API, which
> 
> for -> for the
> 
>> requires allocators to have two execution branches: one
>> for the current API, and one for the new one.
>>
>> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
>> Acked-by: Christoph Hellwig <hch@lst.de>
>> ---
>>  .../common/videobuf2/videobuf2-dma-contig.c   | 142 +++++++++++++++---
>>  1 file changed, 117 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> index 1e218bc440c6..10f73e27d694 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> @@ -17,6 +17,7 @@
>>  #include <linux/sched.h>
>>  #include <linux/slab.h>
>>  #include <linux/dma-mapping.h>
>> +#include <linux/highmem.h>
>>  
>>  #include <media/videobuf2-v4l2.h>
>>  #include <media/videobuf2-dma-contig.h>
>> @@ -42,6 +43,7 @@ struct vb2_dc_buf {
>>  	struct dma_buf_attachment	*db_attach;
>>  
>>  	struct vb2_buffer		*vb;
>> +	bool				coherent_mem;
> 
> I think that this as well should be renamed to non_coherent_mem.
> 
>>  };
>>  
>>  /*********************************************/
>> @@ -78,14 +80,22 @@ static void *vb2_dc_cookie(struct vb2_buffer *vb, void *buf_priv)
>>  static void *vb2_dc_vaddr(struct vb2_buffer *vb, void *buf_priv)
>>  {
>>  	struct vb2_dc_buf *buf = buf_priv;
>> -	struct dma_buf_map map;
>> -	int ret;
>>  
>> -	if (!buf->vaddr && buf->db_attach) {
>> -		ret = dma_buf_vmap(buf->db_attach->dmabuf, &map);
>> -		buf->vaddr = ret ? NULL : map.vaddr;
>> +	if (buf->vaddr)
>> +		return buf->vaddr;
>> +
>> +	if (buf->db_attach) {
>> +		struct dma_buf_map map;
>> +
>> +		if (!dma_buf_vmap(buf->db_attach->dmabuf, &map))
>> +			buf->vaddr = map.vaddr;
>> +
>> +		return buf->vaddr;
>>  	}
>>  
>> +	if (!buf->coherent_mem)
>> +		buf->vaddr = dma_vmap_noncontiguous(buf->dev, buf->size,
>> +						    buf->dma_sgt);
>>  	return buf->vaddr;
>>  }
>>  
>> @@ -101,13 +111,26 @@ static void vb2_dc_prepare(void *buf_priv)
>>  	struct vb2_dc_buf *buf = buf_priv;
>>  	struct sg_table *sgt = buf->dma_sgt;
>>  
>> +	/* This takes care of DMABUF and user-enforced cache sync hint */
>>  	if (buf->vb->skip_cache_sync_on_prepare)
>>  		return;
>>  
>> +	/*
>> +	 * Coherent MMAP buffers do not need to be synced, unlike USERPTR
>> +	 * and non-coherent MMAP buffers.
>> +	 */
>> +	if (buf->vb->memory == V4L2_MEMORY_MMAP && buf->coherent_mem)
>> +		return;
>> +
>>  	if (!sgt)
>>  		return;
>>  
>> +	/* For both USERPTR and non-coherent MMAP */
>>  	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
>> +
>> +	/* Non-coherent MMAP only */
>> +	if (!buf->coherent_mem && buf->vaddr)
>> +		flush_kernel_vmap_range(buf->vaddr, buf->size);
>>  }
>>  
>>  static void vb2_dc_finish(void *buf_priv)
>> @@ -115,13 +138,26 @@ static void vb2_dc_finish(void *buf_priv)
>>  	struct vb2_dc_buf *buf = buf_priv;
>>  	struct sg_table *sgt = buf->dma_sgt;
>>  
>> +	/* This takes care of DMABUF and user-enforced cache sync hint */
>>  	if (buf->vb->skip_cache_sync_on_finish)
>>  		return;
>>  
>> +	/*
>> +	 * Coherent MMAP buffers do not need to be synced, unlike USERPTR
>> +	 * and non-coherent MMAP buffers.
>> +	 */
>> +	if (buf->vb->memory == V4L2_MEMORY_MMAP && buf->coherent_mem)
>> +		return;
>> +
>>  	if (!sgt)
>>  		return;
>>  
>> +	/* For both USERPTR and non-coherent MMAP */
>>  	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
>> +
>> +	/* Non-coherent MMAP only */
>> +	if (!buf->coherent_mem && buf->vaddr)
>> +		invalidate_kernel_vmap_range(buf->vaddr, buf->size);
>>  }
>>  
>>  /*********************************************/
>> @@ -139,17 +175,66 @@ static void vb2_dc_put(void *buf_priv)
>>  		sg_free_table(buf->sgt_base);
>>  		kfree(buf->sgt_base);
>>  	}
>> -	dma_free_attrs(buf->dev, buf->size, buf->cookie, buf->dma_addr,
>> -		       buf->attrs);
>> +
>> +	if (buf->coherent_mem) {
>> +		dma_free_attrs(buf->dev, buf->size, buf->cookie,
>> +			       buf->dma_addr, buf->attrs);
>> +	} else {
>> +		if (buf->vaddr)
>> +			dma_vunmap_noncontiguous(buf->dev, buf->vaddr);
>> +		dma_free_noncontiguous(buf->dev, buf->size,
>> +				       buf->dma_sgt, buf->dma_dir);
>> +	}
>>  	put_device(buf->dev);
>>  	kfree(buf);
>>  }
>>  
>> +static int vb2_dc_alloc_coherent(struct vb2_dc_buf *buf)
>> +{
>> +	struct vb2_queue *q = buf->vb->vb2_queue;
>> +
>> +	buf->cookie = dma_alloc_attrs(buf->dev,
>> +				      buf->size,
>> +				      &buf->dma_addr,
>> +				      GFP_KERNEL | q->gfp_flags,
>> +				      buf->attrs);
>> +	if (!buf->cookie)
>> +		return -ENOMEM;
>> +
>> +	if (q->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
>> +		return 0;
>> +
>> +	buf->vaddr = buf->cookie;
>> +	return 0;
>> +}
>> +
>> +static int vb2_dc_alloc_non_coherent(struct vb2_dc_buf *buf)
>> +{
>> +	struct vb2_queue *q = buf->vb->vb2_queue;
>> +
>> +	buf->dma_sgt = dma_alloc_noncontiguous(buf->dev,
>> +					       buf->size,
>> +					       buf->dma_dir,
>> +					       GFP_KERNEL | q->gfp_flags,
>> +					       buf->attrs);
>> +	if (!buf->dma_sgt)
>> +		return -ENOMEM;
>> +
>> +	buf->dma_addr = sg_dma_address(buf->dma_sgt->sgl);
>> +
>> +	/*
>> +	 * For requests that need kernel mapping (DMA_ATTR_NO_KERNEL_MAPPING
>> +	 * bit is cleared) we perform dma_vmap_noncontiguous() in vb2_dc_vadd().

Typo: vb2_dc_vadd -> vb2_dc_vaddr

Regards,

	Hans
