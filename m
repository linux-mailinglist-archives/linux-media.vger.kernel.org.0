Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8165817BFD9
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 15:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726866AbgCFOEv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 09:04:51 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:53317 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726231AbgCFOEv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Mar 2020 09:04:51 -0500
Received: from [IPv6:2001:983:e9a7:1:558f:c736:2117:17d1]
 ([IPv6:2001:983:e9a7:1:558f:c736:2117:17d1])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ADapj3DJ9EE3qADaqjCcoq; Fri, 06 Mar 2020 15:04:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583503489; bh=8Wbw3httloSzIxY+y/mnc4uaxhl76c5RQ/aJEZKkztE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=KlcFbwJZiGM3vtZIBWpFukQ3+Z1Nww3Oc+sZibtZ1Od88Le1EFDO0U3Hihm4WgZEl
         n1sUtWI6kgyhvfpxvhyNJypb9cePNDkFB1m7D5klc1/9HE9iPVfJbX+amm9PifBcYG
         35wO2aGohd2Pd2sgsSzIUFs9Qc3yuHtv0DQBa3yGZhbB14iFrZWWqxpYPQ8A9r7VOE
         eLFc3LTbyoOuE1+ioDfjsLSu0KQfw2OK3bXxvu569xFby3dJ/czoNbm9dAVidcO/nM
         h6nALvqj7YgzqJPj/ez9He2kEeGmgrwLh0vtlBf06jgPgtOlVamb+glLpxi/rpzIxb
         allgbPjGzGT1Q==
Subject: Re: [PATCHv4 04/11] videobuf2: add queue memory consistency parameter
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-5-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7ab74b32-441d-1a1a-0112-6c4d0c0b900c@xs4all.nl>
Date:   Fri, 6 Mar 2020 15:04:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302041213.27662-5-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEsdbt/UXOjSvMJXLiHsipF3E+UxAsqOK+riQRz6BLvIVYRwJxyriUuJGCCuLSnbr0zSBVkrt48IZWzCw4AJQyYg3/ZwGtOhALM6jyaWfcNl9gr/CtUz
 7JE5m+XShHUT61IwMfettnDIO+ee+Ao8FVUTN9aHOqVtKyXPsPAK+U/c2JujWZvG265YMb73bUmYCV8Jfs2ASTqnWlpaIA3n9oF2Sm6Jm8LOM92v4n6Fus30
 NeAXbV+NYfitnpKMk25RufRZCFi9pxnJnoSDqX+nqnwANH61JPIf43FyHzU3piTsARShfy+8TA/yTAjwTy+/UXCtygQ3CUxXkdf43tLeAw+Mhgmzr8HrUeoE
 t8OpFmPgwisdVssVAlHKCHOPQuEZIdk4rzdjrK2W6dhcNuuWxjCV8R3io9bDZ6SffgqnnfSxa1Bf0C2cOzBj4Ds44EVRl8akbvISJMYdiOdNQkaH/zmW3ewd
 9i1y4Xsne5cQEuUzCRYuItx6skwb2hBPN06MiUBP475ssqWlo+YQCsPrW8dLpeDOWL+F8mJZyROCUok0IZqp8nqnvVLNpu5kH2l+IJj5p61BzJC9GSVrkXoW
 +H3xvx//hcYx90BP371ddSB7r1R1/GDPv5yRIc+/lLmiZQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/03/2020 05:12, Sergey Senozhatsky wrote:
> Preparations for future V4L2_FLAG_MEMORY_NON_CONSISTENT support.
> 
> Extend vb2_core_reqbufs() with queue memory consistency flag
> that is applied to the newly allocated buffers.
> 
> An attempt to allocate a buffer with consistency requirements
> which don't match queue's consistency model will fail.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 47 +++++++++++++++----
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  6 +--
>  drivers/media/dvb-core/dvb_vb2.c              |  2 +-
>  include/media/videobuf2-core.h                |  7 ++-
>  4 files changed, 47 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 4489744fbbd9..3ca0545db7ee 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -664,8 +664,19 @@ int vb2_verify_memory_type(struct vb2_queue *q,
>  }
>  EXPORT_SYMBOL(vb2_verify_memory_type);
>  
> +static void set_queue_consistency(struct vb2_queue *q, bool consistent_mem)
> +{
> +	if (!vb2_queue_allows_cache_hints(q))
> +		return;
> +
> +	if (consistent_mem)
> +		q->dma_attrs &= ~DMA_ATTR_NON_CONSISTENT;
> +	else
> +		q->dma_attrs |= DMA_ATTR_NON_CONSISTENT;
> +}
> +
>  int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
> -		unsigned int *count)
> +		bool consistent_mem, unsigned int *count)
>  {
>  	unsigned int num_buffers, allocated_buffers, num_planes = 0;
>  	unsigned plane_sizes[VB2_MAX_PLANES] = { };
> @@ -720,6 +731,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	num_buffers = min_t(unsigned int, num_buffers, VB2_MAX_FRAME);
>  	memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
>  	q->memory = memory;
> +	set_queue_consistency(q, consistent_mem);
>  
>  	/*
>  	 * Ask the driver how many buffers and planes per buffer it requires.
> @@ -803,9 +815,21 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  }
>  EXPORT_SYMBOL_GPL(vb2_core_reqbufs);
>  
> +static bool verify_consistency_attr(struct vb2_queue *q, bool consistent_mem)
> +{
> +	bool queue_attr = q->dma_attrs & DMA_ATTR_NON_CONSISTENT;
> +
> +	if (consistent_mem != queue_attr) {

This is the wrong way around!

It's much better to write it like this:

       bool queue_is_consistent = !(q->dma_attrs & DMA_ATTR_NON_CONSISTENT);

       if (consistent_mem != queue_is_consistent) {

What concerns me more is that this means that this series has not been
tested properly. I found this when testing with v4l2-compliance and vivid.

I'll reply to the cover letter with more information about what needs to be
done before I merge this.

> +		dprintk(1, "memory consistency model mismatch\n");
> +		return false;
> +	}
> +	return true;
> +}
> +
>  int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
> -		unsigned int *count, unsigned requested_planes,
> -		const unsigned requested_sizes[])
> +			 bool consistent_mem, unsigned int *count,
> +			 unsigned requested_planes,
> +			 const unsigned requested_sizes[])

Use 'unsigned int' in the two lines above, as per checkpatch suggestion.

Regards,

	Hans

>  {
>  	unsigned int num_planes = 0, num_buffers, allocated_buffers;
>  	unsigned plane_sizes[VB2_MAX_PLANES] = { };
> @@ -823,10 +847,15 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  		}
>  		memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
>  		q->memory = memory;
> +		set_queue_consistency(q, consistent_mem);
>  		q->waiting_for_buffers = !q->is_output;
> -	} else if (q->memory != memory) {
> -		dprintk(1, "memory model mismatch\n");
> -		return -EINVAL;
> +	} else {
> +		if (q->memory != memory) {
> +			dprintk(1, "memory model mismatch\n");
> +			return -EINVAL;
> +		}
> +		if (!verify_consistency_attr(q, consistent_mem))
> +			return -EINVAL;
>  	}
>  
>  	num_buffers = min(*count, VB2_MAX_FRAME - q->num_buffers);
> @@ -2498,7 +2527,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
>  	fileio->memory = VB2_MEMORY_MMAP;
>  	fileio->type = q->type;
>  	q->fileio = fileio;
> -	ret = vb2_core_reqbufs(q, fileio->memory, &fileio->count);
> +	ret = vb2_core_reqbufs(q, fileio->memory, true, &fileio->count);
>  	if (ret)
>  		goto err_kfree;
>  
> @@ -2555,7 +2584,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
>  
>  err_reqbufs:
>  	fileio->count = 0;
> -	vb2_core_reqbufs(q, fileio->memory, &fileio->count);
> +	vb2_core_reqbufs(q, fileio->memory, true, &fileio->count);
>  
>  err_kfree:
>  	q->fileio = NULL;
> @@ -2575,7 +2604,7 @@ static int __vb2_cleanup_fileio(struct vb2_queue *q)
>  		vb2_core_streamoff(q, q->type);
>  		q->fileio = NULL;
>  		fileio->count = 0;
> -		vb2_core_reqbufs(q, fileio->memory, &fileio->count);
> +		vb2_core_reqbufs(q, fileio->memory, true, &fileio->count);
>  		kfree(fileio);
>  		dprintk(3, "file io emulator closed\n");
>  	}
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index c847bcea6e95..6111d74f68c9 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -724,7 +724,7 @@ int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
>  	int ret = vb2_verify_memory_type(q, req->memory, req->type);
>  
>  	fill_buf_caps(q, &req->capabilities);
> -	return ret ? ret : vb2_core_reqbufs(q, req->memory, &req->count);
> +	return ret ? ret : vb2_core_reqbufs(q, req->memory, true, &req->count);
>  }
>  EXPORT_SYMBOL_GPL(vb2_reqbufs);
>  
> @@ -798,7 +798,7 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  	for (i = 0; i < requested_planes; i++)
>  		if (requested_sizes[i] == 0)
>  			return -EINVAL;
> -	return ret ? ret : vb2_core_create_bufs(q, create->memory,
> +	return ret ? ret : vb2_core_create_bufs(q, create->memory, true,
>  		&create->count, requested_planes, requested_sizes);
>  }
>  EXPORT_SYMBOL_GPL(vb2_create_bufs);
> @@ -974,7 +974,7 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
>  		return res;
>  	if (vb2_queue_is_busy(vdev, file))
>  		return -EBUSY;
> -	res = vb2_core_reqbufs(vdev->queue, p->memory, &p->count);
> +	res = vb2_core_reqbufs(vdev->queue, p->memory, true, &p->count);
>  	/* If count == 0, then the owner has released all buffers and he
>  	   is no longer owner of the queue. Otherwise we have a new owner. */
>  	if (res == 0)
> diff --git a/drivers/media/dvb-core/dvb_vb2.c b/drivers/media/dvb-core/dvb_vb2.c
> index 6974f1731529..e60063652164 100644
> --- a/drivers/media/dvb-core/dvb_vb2.c
> +++ b/drivers/media/dvb-core/dvb_vb2.c
> @@ -342,7 +342,7 @@ int dvb_vb2_reqbufs(struct dvb_vb2_ctx *ctx, struct dmx_requestbuffers *req)
>  
>  	ctx->buf_siz = req->size;
>  	ctx->buf_cnt = req->count;
> -	ret = vb2_core_reqbufs(&ctx->vb_q, VB2_MEMORY_MMAP, &req->count);
> +	ret = vb2_core_reqbufs(&ctx->vb_q, VB2_MEMORY_MMAP, true, &req->count);
>  	if (ret) {
>  		ctx->state = DVB_VB2_STATE_NONE;
>  		dprintk(1, "[%s] count=%d size=%d errno=%d\n", ctx->name,
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 731fd9fbd506..ba83ac754c21 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -737,6 +737,7 @@ void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb);
>   * vb2_core_reqbufs() - Initiate streaming.
>   * @q:		pointer to &struct vb2_queue with videobuf2 queue.
>   * @memory:	memory type, as defined by &enum vb2_memory.
> + * @consistent_mem:	memory consistency model.
>   * @count:	requested buffer count.
>   *
>   * Videobuf2 core helper to implement VIDIOC_REQBUF() operation. It is called
> @@ -761,12 +762,13 @@ void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb);
>   * Return: returns zero on success; an error code otherwise.
>   */
>  int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
> -		unsigned int *count);
> +		bool consistent_mem, unsigned int *count);
>  
>  /**
>   * vb2_core_create_bufs() - Allocate buffers and any required auxiliary structs
>   * @q: pointer to &struct vb2_queue with videobuf2 queue.
>   * @memory: memory type, as defined by &enum vb2_memory.
> + * @consistent_mem: memory consistency model.
>   * @count: requested buffer count.
>   * @requested_planes: number of planes requested.
>   * @requested_sizes: array with the size of the planes.
> @@ -784,7 +786,8 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>   * Return: returns zero on success; an error code otherwise.
>   */
>  int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
> -			 unsigned int *count, unsigned int requested_planes,
> +			 bool consistent_mem, unsigned int *count,
> +			 unsigned int requested_planes,
>  			 const unsigned int requested_sizes[]);
>  
>  /**
> 

