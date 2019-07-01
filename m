Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 041693C788
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 11:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404803AbfFKJqd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 05:46:33 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:48109 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404801AbfFKJqd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 05:46:33 -0400
Received: from [IPv6:2001:420:44c1:2579:c4f8:6a22:1846:32ff] ([IPv6:2001:420:44c1:2579:c4f8:6a22:1846:32ff])
        by smtp-cloud7.xs4all.net with ESMTPA
        id adMHh2haB5qKaadMKhxTAD; Tue, 11 Jun 2019 11:46:29 +0200
Subject: Re: [PATCH] media: vb2: Print the queue pointer in debug messages
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
References: <20190608123804.15983-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <37f69160-c8f3-9466-cf1d-19bb43bac58e@xs4all.nl>
Date:   Tue, 11 Jun 2019 11:46:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190608123804.15983-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKwih8q/EBEqyOBbjB63Rgf2NuuNVdR8O4cK6T4wUWP2uvHwimb40kuBOAHIyCIMl5xKK5cV3KWYybUtQwXaGwI8Dmj6yyKsX5Z8dswbvcpAqP9Ef9Xq
 GlNy2KA55PA1cbAd28+d4msK4TJgT2TY8Mi+c7Fi80BtTA5M2mxyyG8dL2OQexZTMiMETcUseSkRIDYWg96sTsYaYxHTfX/IEBt9b8cpD/NrLnMuc5TIXHWl
 ePROdHUJca1JvGpW1ewlJ9opzSThnoVtW/6WJHCBZrp9BsK3vihCdj0wyn+FKEM6cHr8tiI5zR3G8bvUAPCxZH6jG2ctLy0G836bJSGw9YHqwRcwWqXb4NDI
 XmdH1el9
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 6/8/19 2:38 PM, Laurent Pinchart wrote:
> When debugging issues that involve more than one video queue, messages
> related to multiple queues get interleaved without any easy way to tell
> which queue they relate to. Fix this by printing the queue pointer for
> all debug messages in the vb2 core and V4L2 layers.

I like the idea, but I think it can be done better:

I'd suggest adding a name field to struct vb2_queue. In vb2_core_queue_init()
you check if name was set, and if not, then fill it with e.g.:

snprintf(q->name, sizeof(q->name), "%s-%p",
	 q->is_output ? "out" : "cap", q);

The out/cap prefix is very useful for debugging m2m devices.

Perhaps we should also introduce a vb2_queue_init_name() so drivers can
specify a name for the queue.

> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Fix format specifiers in vb2 ops-related macros
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 219 +++++++++---------
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  55 ++---
>  2 files changed, 139 insertions(+), 135 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 4489744fbbd9..05677ebdb21f 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -34,10 +34,10 @@
>  static int debug;
>  module_param(debug, int, 0644);
>  
> -#define dprintk(level, fmt, arg...)				\
> -	do {							\
> -		if (debug >= level)				\
> -			pr_info("%s: " fmt, __func__, ## arg);	\
> +#define dprintk(q, level, fmt, arg...)					\
> +	do {								\
> +		if (debug >= level)					\
> +			pr_info("(q=%p) %s: " fmt, q, __func__, ## arg);\

And with the proposed change I'd change this to:

			pr_info("%s %s: " fmt, (q)->name, __func__, ## arg);\

Regards,

	Hans

>  	} while (0)
>  
>  #ifdef CONFIG_VIDEO_ADV_DEBUG
> @@ -51,8 +51,8 @@ module_param(debug, int, 0644);
>   */
>  
>  #define log_memop(vb, op)						\
> -	dprintk(2, "call_memop(%p, %d, %s)%s\n",			\
> -		(vb)->vb2_queue, (vb)->index, #op,			\
> +	dprintk((vb)->vb2_queue, 2, "call_memop(%d, %s)%s\n",		\
> +		(vb)->index, #op,					\
>  		(vb)->vb2_queue->mem_ops->op ? "" : " (nop)")
>  
>  #define call_memop(vb, op, args...)					\
> @@ -90,7 +90,7 @@ module_param(debug, int, 0644);
>  })
>  
>  #define log_qop(q, op)							\
> -	dprintk(2, "call_qop(%p, %s)%s\n", q, #op,			\
> +	dprintk(q, 2, "call_qop(%s)%s\n", #op,				\
>  		(q)->ops->op ? "" : " (nop)")
>  
>  #define call_qop(q, op, args...)					\
> @@ -113,8 +113,8 @@ module_param(debug, int, 0644);
>  })
>  
>  #define log_vb_qop(vb, op, args...)					\
> -	dprintk(2, "call_vb_qop(%p, %d, %s)%s\n",			\
> -		(vb)->vb2_queue, (vb)->index, #op,			\
> +	dprintk((vb)->vb2_queue, 2, "call_vb_qop(%d, %s)%s\n",		\
> +		(vb)->index, #op,					\
>  		(vb)->vb2_queue->ops->op ? "" : " (nop)")
>  
>  #define call_vb_qop(vb, op, args...)					\
> @@ -246,7 +246,8 @@ static void __vb2_buf_mem_free(struct vb2_buffer *vb)
>  	for (plane = 0; plane < vb->num_planes; ++plane) {
>  		call_void_memop(vb, put, vb->planes[plane].mem_priv);
>  		vb->planes[plane].mem_priv = NULL;
> -		dprintk(3, "freed plane %d of buffer %d\n", plane, vb->index);
> +		dprintk(vb->vb2_queue, 3, "freed plane %d of buffer %d\n",
> +			plane, vb->index);
>  	}
>  }
>  
> @@ -316,7 +317,7 @@ static void __setup_offsets(struct vb2_buffer *vb)
>  	for (plane = 0; plane < vb->num_planes; ++plane) {
>  		vb->planes[plane].m.offset = off;
>  
> -		dprintk(3, "buffer %d, plane %d offset 0x%08lx\n",
> +		dprintk(q, 3, "buffer %d, plane %d offset 0x%08lx\n",
>  				vb->index, plane, off);
>  
>  		off += vb->planes[plane].length;
> @@ -347,7 +348,7 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
>  		/* Allocate videobuf buffer structures */
>  		vb = kzalloc(q->buf_struct_size, GFP_KERNEL);
>  		if (!vb) {
> -			dprintk(1, "memory alloc for buffer struct failed\n");
> +			dprintk(q, 1, "memory alloc for buffer struct failed\n");
>  			break;
>  		}
>  
> @@ -369,7 +370,7 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
>  		if (memory == VB2_MEMORY_MMAP) {
>  			ret = __vb2_buf_mem_alloc(vb);
>  			if (ret) {
> -				dprintk(1, "failed allocating memory for buffer %d\n",
> +				dprintk(q, 1, "failed allocating memory for buffer %d\n",
>  					buffer);
>  				q->bufs[vb->index] = NULL;
>  				kfree(vb);
> @@ -383,7 +384,7 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
>  			 */
>  			ret = call_vb_qop(vb, buf_init, vb);
>  			if (ret) {
> -				dprintk(1, "buffer %d %p initialization failed\n",
> +				dprintk(q, 1, "buffer %d %p initialization failed\n",
>  					buffer, vb);
>  				__vb2_buf_mem_free(vb);
>  				q->bufs[vb->index] = NULL;
> @@ -393,7 +394,7 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
>  		}
>  	}
>  
> -	dprintk(1, "allocated %d buffers, %d plane(s) each\n",
> +	dprintk(q, 1, "allocated %d buffers, %d plane(s) each\n",
>  			buffer, num_planes);
>  
>  	return buffer;
> @@ -445,7 +446,7 @@ static int __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
>  		if (q->bufs[buffer] == NULL)
>  			continue;
>  		if (q->bufs[buffer]->state == VB2_BUF_STATE_PREPARING) {
> -			dprintk(1, "preparing buffers, cannot free\n");
> +			dprintk(q, 1, "preparing buffers, cannot free\n");
>  			return -EAGAIN;
>  		}
>  	}
> @@ -623,12 +624,12 @@ int vb2_verify_memory_type(struct vb2_queue *q,
>  {
>  	if (memory != VB2_MEMORY_MMAP && memory != VB2_MEMORY_USERPTR &&
>  	    memory != VB2_MEMORY_DMABUF) {
> -		dprintk(1, "unsupported memory type\n");
> +		dprintk(q, 1, "unsupported memory type\n");
>  		return -EINVAL;
>  	}
>  
>  	if (type != q->type) {
> -		dprintk(1, "requested type is incorrect\n");
> +		dprintk(q, 1, "requested type is incorrect\n");
>  		return -EINVAL;
>  	}
>  
> @@ -637,17 +638,17 @@ int vb2_verify_memory_type(struct vb2_queue *q,
>  	 * are available.
>  	 */
>  	if (memory == VB2_MEMORY_MMAP && __verify_mmap_ops(q)) {
> -		dprintk(1, "MMAP for current setup unsupported\n");
> +		dprintk(q, 1, "MMAP for current setup unsupported\n");
>  		return -EINVAL;
>  	}
>  
>  	if (memory == VB2_MEMORY_USERPTR && __verify_userptr_ops(q)) {
> -		dprintk(1, "USERPTR for current setup unsupported\n");
> +		dprintk(q, 1, "USERPTR for current setup unsupported\n");
>  		return -EINVAL;
>  	}
>  
>  	if (memory == VB2_MEMORY_DMABUF && __verify_dmabuf_ops(q)) {
> -		dprintk(1, "DMABUF for current setup unsupported\n");
> +		dprintk(q, 1, "DMABUF for current setup unsupported\n");
>  		return -EINVAL;
>  	}
>  
> @@ -657,7 +658,7 @@ int vb2_verify_memory_type(struct vb2_queue *q,
>  	 * do the memory and type validation.
>  	 */
>  	if (vb2_fileio_is_active(q)) {
> -		dprintk(1, "file io in progress\n");
> +		dprintk(q, 1, "file io in progress\n");
>  		return -EBUSY;
>  	}
>  	return 0;
> @@ -673,12 +674,12 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	int ret;
>  
>  	if (q->streaming) {
> -		dprintk(1, "streaming active\n");
> +		dprintk(q, 1, "streaming active\n");
>  		return -EBUSY;
>  	}
>  
>  	if (q->waiting_in_dqbuf && *count) {
> -		dprintk(1, "another dup()ped fd is waiting for a buffer\n");
> +		dprintk(q, 1, "another dup()ped fd is waiting for a buffer\n");
>  		return -EBUSY;
>  	}
>  
> @@ -691,7 +692,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  		mutex_lock(&q->mmap_lock);
>  		if (debug && q->memory == VB2_MEMORY_MMAP &&
>  		    __buffers_in_use(q))
> -			dprintk(1, "memory in use, orphaning buffers\n");
> +			dprintk(q, 1, "memory in use, orphaning buffers\n");
>  
>  		/*
>  		 * Call queue_cancel to clean up any buffers in the
> @@ -742,7 +743,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	allocated_buffers =
>  		__vb2_queue_alloc(q, memory, num_buffers, num_planes, plane_sizes);
>  	if (allocated_buffers == 0) {
> -		dprintk(1, "memory allocation failed\n");
> +		dprintk(q, 1, "memory allocation failed\n");
>  		return -ENOMEM;
>  	}
>  
> @@ -812,20 +813,20 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  	int ret;
>  
>  	if (q->num_buffers == VB2_MAX_FRAME) {
> -		dprintk(1, "maximum number of buffers already allocated\n");
> +		dprintk(q, 1, "maximum number of buffers already allocated\n");
>  		return -ENOBUFS;
>  	}
>  
>  	if (!q->num_buffers) {
>  		if (q->waiting_in_dqbuf && *count) {
> -			dprintk(1, "another dup()ped fd is waiting for a buffer\n");
> +			dprintk(q, 1, "another dup()ped fd is waiting for a buffer\n");
>  			return -EBUSY;
>  		}
>  		memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
>  		q->memory = memory;
>  		q->waiting_for_buffers = !q->is_output;
>  	} else if (q->memory != memory) {
> -		dprintk(1, "memory model mismatch\n");
> +		dprintk(q, 1, "memory model mismatch\n");
>  		return -EINVAL;
>  	}
>  
> @@ -849,7 +850,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  	allocated_buffers = __vb2_queue_alloc(q, memory, num_buffers,
>  				num_planes, plane_sizes);
>  	if (allocated_buffers == 0) {
> -		dprintk(1, "memory allocation failed\n");
> +		dprintk(q, 1, "memory allocation failed\n");
>  		return -ENOMEM;
>  	}
>  
> @@ -939,7 +940,7 @@ void vb2_buffer_done(struct vb2_buffer *vb, enum vb2_buffer_state state)
>  	 */
>  	vb->cnt_buf_done++;
>  #endif
> -	dprintk(4, "done processing on buffer %d, state: %d\n",
> +	dprintk(q, 4, "done processing on buffer %d, state: %d\n",
>  			vb->index, state);
>  
>  	if (state != VB2_BUF_STATE_QUEUED) {
> @@ -1029,12 +1030,12 @@ static int __prepare_userptr(struct vb2_buffer *vb)
>  			&& vb->planes[plane].length == planes[plane].length)
>  			continue;
>  
> -		dprintk(3, "userspace address for plane %d changed, reacquiring memory\n",
> +		dprintk(q, 3, "userspace address for plane %d changed, reacquiring memory\n",
>  			plane);
>  
>  		/* Check if the provided plane buffer is large enough */
>  		if (planes[plane].length < vb->planes[plane].min_length) {
> -			dprintk(1, "provided buffer size %u is less than setup size %u for plane %d\n",
> +			dprintk(q, 1, "provided buffer size %u is less than setup size %u for plane %d\n",
>  						planes[plane].length,
>  						vb->planes[plane].min_length,
>  						plane);
> @@ -1064,7 +1065,7 @@ static int __prepare_userptr(struct vb2_buffer *vb)
>  				planes[plane].m.userptr,
>  				planes[plane].length, q->dma_dir);
>  		if (IS_ERR(mem_priv)) {
> -			dprintk(1, "failed acquiring userspace memory for plane %d\n",
> +			dprintk(q, 1, "failed acquiring userspace memory for plane %d\n",
>  				plane);
>  			ret = PTR_ERR(mem_priv);
>  			goto err;
> @@ -1091,14 +1092,14 @@ static int __prepare_userptr(struct vb2_buffer *vb)
>  		 */
>  		ret = call_vb_qop(vb, buf_init, vb);
>  		if (ret) {
> -			dprintk(1, "buffer initialization failed\n");
> +			dprintk(q, 1, "buffer initialization failed\n");
>  			goto err;
>  		}
>  	}
>  
>  	ret = call_vb_qop(vb, buf_prepare, vb);
>  	if (ret) {
> -		dprintk(1, "buffer preparation failed\n");
> +		dprintk(q, 1, "buffer preparation failed\n");
>  		call_void_vb_qop(vb, buf_cleanup, vb);
>  		goto err;
>  	}
> @@ -1141,7 +1142,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>  		struct dma_buf *dbuf = dma_buf_get(planes[plane].m.fd);
>  
>  		if (IS_ERR_OR_NULL(dbuf)) {
> -			dprintk(1, "invalid dmabuf fd for plane %d\n",
> +			dprintk(q, 1, "invalid dmabuf fd for plane %d\n",
>  				plane);
>  			ret = -EINVAL;
>  			goto err;
> @@ -1152,7 +1153,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>  			planes[plane].length = dbuf->size;
>  
>  		if (planes[plane].length < vb->planes[plane].min_length) {
> -			dprintk(1, "invalid dmabuf length %u for plane %d, minimum length %u\n",
> +			dprintk(q, 1, "invalid dmabuf length %u for plane %d, minimum length %u\n",
>  				planes[plane].length, plane,
>  				vb->planes[plane].min_length);
>  			dma_buf_put(dbuf);
> @@ -1167,7 +1168,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>  			continue;
>  		}
>  
> -		dprintk(3, "buffer for plane %d changed\n", plane);
> +		dprintk(q, 3, "buffer for plane %d changed\n", plane);
>  
>  		if (!reacquired) {
>  			reacquired = true;
> @@ -1187,7 +1188,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>  				q->alloc_devs[plane] ? : q->dev,
>  				dbuf, planes[plane].length, q->dma_dir);
>  		if (IS_ERR(mem_priv)) {
> -			dprintk(1, "failed to attach dmabuf\n");
> +			dprintk(q, 1, "failed to attach dmabuf\n");
>  			ret = PTR_ERR(mem_priv);
>  			dma_buf_put(dbuf);
>  			goto err;
> @@ -1208,7 +1209,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>  
>  		ret = call_memop(vb, map_dmabuf, vb->planes[plane].mem_priv);
>  		if (ret) {
> -			dprintk(1, "failed to map dmabuf for plane %d\n",
> +			dprintk(q, 1, "failed to map dmabuf for plane %d\n",
>  				plane);
>  			goto err;
>  		}
> @@ -1233,14 +1234,14 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
>  		 */
>  		ret = call_vb_qop(vb, buf_init, vb);
>  		if (ret) {
> -			dprintk(1, "buffer initialization failed\n");
> +			dprintk(q, 1, "buffer initialization failed\n");
>  			goto err;
>  		}
>  	}
>  
>  	ret = call_vb_qop(vb, buf_prepare, vb);
>  	if (ret) {
> -		dprintk(1, "buffer preparation failed\n");
> +		dprintk(q, 1, "buffer preparation failed\n");
>  		call_void_vb_qop(vb, buf_cleanup, vb);
>  		goto err;
>  	}
> @@ -1276,7 +1277,7 @@ static int __buf_prepare(struct vb2_buffer *vb)
>  	int ret;
>  
>  	if (q->error) {
> -		dprintk(1, "fatal error occurred on queue\n");
> +		dprintk(q, 1, "fatal error occurred on queue\n");
>  		return -EIO;
>  	}
>  
> @@ -1287,7 +1288,7 @@ static int __buf_prepare(struct vb2_buffer *vb)
>  	if (q->is_output) {
>  		ret = call_vb_qop(vb, buf_out_validate, vb);
>  		if (ret) {
> -			dprintk(1, "buffer validation failed\n");
> +			dprintk(q, 1, "buffer validation failed\n");
>  			return ret;
>  		}
>  	}
> @@ -1311,7 +1312,7 @@ static int __buf_prepare(struct vb2_buffer *vb)
>  	}
>  
>  	if (ret) {
> -		dprintk(1, "buffer preparation failed: %d\n", ret);
> +		dprintk(q, 1, "buffer preparation failed: %d\n", ret);
>  		vb->state = orig_state;
>  		return ret;
>  	}
> @@ -1423,12 +1424,12 @@ int vb2_core_prepare_buf(struct vb2_queue *q, unsigned int index, void *pb)
>  
>  	vb = q->bufs[index];
>  	if (vb->state != VB2_BUF_STATE_DEQUEUED) {
> -		dprintk(1, "invalid buffer state %d\n",
> +		dprintk(q, 1, "invalid buffer state %d\n",
>  			vb->state);
>  		return -EINVAL;
>  	}
>  	if (vb->prepared) {
> -		dprintk(1, "buffer already prepared\n");
> +		dprintk(q, 1, "buffer already prepared\n");
>  		return -EINVAL;
>  	}
>  
> @@ -1439,7 +1440,7 @@ int vb2_core_prepare_buf(struct vb2_queue *q, unsigned int index, void *pb)
>  	/* Fill buffer information for the userspace */
>  	call_void_bufop(q, fill_user_buffer, vb, pb);
>  
> -	dprintk(2, "prepare of buffer %d succeeded\n", vb->index);
> +	dprintk(q, 2, "prepare of buffer %d succeeded\n", vb->index);
>  
>  	return 0;
>  }
> @@ -1477,7 +1478,7 @@ static int vb2_start_streaming(struct vb2_queue *q)
>  
>  	q->start_streaming_called = 0;
>  
> -	dprintk(1, "driver refused to start streaming\n");
> +	dprintk(q, 1, "driver refused to start streaming\n");
>  	/*
>  	 * If you see this warning, then the driver isn't cleaning up properly
>  	 * after a failed start_streaming(). See the start_streaming()
> @@ -1515,7 +1516,7 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
>  	int ret;
>  
>  	if (q->error) {
> -		dprintk(1, "fatal error occurred on queue\n");
> +		dprintk(q, 1, "fatal error occurred on queue\n");
>  		return -EIO;
>  	}
>  
> @@ -1523,14 +1524,14 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
>  
>  	if (!req && vb->state != VB2_BUF_STATE_IN_REQUEST &&
>  	    q->requires_requests) {
> -		dprintk(1, "qbuf requires a request\n");
> +		dprintk(q, 1, "qbuf requires a request\n");
>  		return -EBADR;
>  	}
>  
>  	if ((req && q->uses_qbuf) ||
>  	    (!req && vb->state != VB2_BUF_STATE_IN_REQUEST &&
>  	     q->uses_requests)) {
> -		dprintk(1, "queue in wrong mode (qbuf vs requests)\n");
> +		dprintk(q, 1, "queue in wrong mode (qbuf vs requests)\n");
>  		return -EBUSY;
>  	}
>  
> @@ -1539,7 +1540,7 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
>  
>  		q->uses_requests = 1;
>  		if (vb->state != VB2_BUF_STATE_DEQUEUED) {
> -			dprintk(1, "buffer %d not in dequeued state\n",
> +			dprintk(q, 1, "buffer %d not in dequeued state\n",
>  				vb->index);
>  			return -EINVAL;
>  		}
> @@ -1547,7 +1548,7 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
>  		if (q->is_output && !vb->prepared) {
>  			ret = call_vb_qop(vb, buf_out_validate, vb);
>  			if (ret) {
> -				dprintk(1, "buffer validation failed\n");
> +				dprintk(q, 1, "buffer validation failed\n");
>  				return ret;
>  			}
>  		}
> @@ -1583,7 +1584,7 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
>  			call_void_bufop(q, fill_user_buffer, vb, pb);
>  		}
>  
> -		dprintk(2, "qbuf of buffer %d succeeded\n", vb->index);
> +		dprintk(q, 2, "qbuf of buffer %d succeeded\n", vb->index);
>  		return 0;
>  	}
>  
> @@ -1600,10 +1601,10 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
>  		}
>  		break;
>  	case VB2_BUF_STATE_PREPARING:
> -		dprintk(1, "buffer still being prepared\n");
> +		dprintk(q, 1, "buffer still being prepared\n");
>  		return -EINVAL;
>  	default:
> -		dprintk(1, "invalid buffer state %d\n", vb->state);
> +		dprintk(q, 1, "invalid buffer state %d\n", vb->state);
>  		return -EINVAL;
>  	}
>  
> @@ -1645,7 +1646,7 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
>  			return ret;
>  	}
>  
> -	dprintk(2, "qbuf of buffer %d succeeded\n", vb->index);
> +	dprintk(q, 2, "qbuf of buffer %d succeeded\n", vb->index);
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(vb2_core_qbuf);
> @@ -1671,22 +1672,22 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
>  		int ret;
>  
>  		if (q->waiting_in_dqbuf) {
> -			dprintk(1, "another dup()ped fd is waiting for a buffer\n");
> +			dprintk(q, 1, "another dup()ped fd is waiting for a buffer\n");
>  			return -EBUSY;
>  		}
>  
>  		if (!q->streaming) {
> -			dprintk(1, "streaming off, will not wait for buffers\n");
> +			dprintk(q, 1, "streaming off, will not wait for buffers\n");
>  			return -EINVAL;
>  		}
>  
>  		if (q->error) {
> -			dprintk(1, "Queue in error state, will not wait for buffers\n");
> +			dprintk(q, 1, "Queue in error state, will not wait for buffers\n");
>  			return -EIO;
>  		}
>  
>  		if (q->last_buffer_dequeued) {
> -			dprintk(3, "last buffer dequeued already, will not wait for buffers\n");
> +			dprintk(q, 3, "last buffer dequeued already, will not wait for buffers\n");
>  			return -EPIPE;
>  		}
>  
> @@ -1698,7 +1699,7 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
>  		}
>  
>  		if (nonblocking) {
> -			dprintk(3, "nonblocking and no buffers to dequeue, will not wait\n");
> +			dprintk(q, 3, "nonblocking and no buffers to dequeue, will not wait\n");
>  			return -EAGAIN;
>  		}
>  
> @@ -1713,7 +1714,7 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
>  		/*
>  		 * All locks have been released, it is safe to sleep now.
>  		 */
> -		dprintk(3, "will sleep waiting for buffers\n");
> +		dprintk(q, 3, "will sleep waiting for buffers\n");
>  		ret = wait_event_interruptible(q->done_wq,
>  				!list_empty(&q->done_list) || !q->streaming ||
>  				q->error);
> @@ -1725,7 +1726,7 @@ static int __vb2_wait_for_done_vb(struct vb2_queue *q, int nonblocking)
>  		call_void_qop(q, wait_finish, q);
>  		q->waiting_in_dqbuf = 0;
>  		if (ret) {
> -			dprintk(1, "sleep was interrupted\n");
> +			dprintk(q, 1, "sleep was interrupted\n");
>  			return ret;
>  		}
>  	}
> @@ -1773,7 +1774,7 @@ static int __vb2_get_done_vb(struct vb2_queue *q, struct vb2_buffer **vb,
>  int vb2_wait_for_all_buffers(struct vb2_queue *q)
>  {
>  	if (!q->streaming) {
> -		dprintk(1, "streaming off, will not wait for buffers\n");
> +		dprintk(q, 1, "streaming off, will not wait for buffers\n");
>  		return -EINVAL;
>  	}
>  
> @@ -1811,13 +1812,13 @@ int vb2_core_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
>  
>  	switch (vb->state) {
>  	case VB2_BUF_STATE_DONE:
> -		dprintk(3, "returning done buffer\n");
> +		dprintk(q, 3, "returning done buffer\n");
>  		break;
>  	case VB2_BUF_STATE_ERROR:
> -		dprintk(3, "returning done buffer with errors\n");
> +		dprintk(q, 3, "returning done buffer with errors\n");
>  		break;
>  	default:
> -		dprintk(1, "invalid buffer state\n");
> +		dprintk(q, 1, "invalid buffer state\n");
>  		return -EINVAL;
>  	}
>  
> @@ -1848,7 +1849,7 @@ int vb2_core_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
>  		media_request_put(vb->request);
>  	vb->request = NULL;
>  
> -	dprintk(2, "dqbuf of buffer %d, with state %d\n",
> +	dprintk(q, 2, "dqbuf of buffer %d, with state %d\n",
>  			vb->index, vb->state);
>  
>  	return 0;
> @@ -1971,22 +1972,22 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type)
>  	int ret;
>  
>  	if (type != q->type) {
> -		dprintk(1, "invalid stream type\n");
> +		dprintk(q, 1, "invalid stream type\n");
>  		return -EINVAL;
>  	}
>  
>  	if (q->streaming) {
> -		dprintk(3, "already streaming\n");
> +		dprintk(q, 3, "already streaming\n");
>  		return 0;
>  	}
>  
>  	if (!q->num_buffers) {
> -		dprintk(1, "no buffers have been allocated\n");
> +		dprintk(q, 1, "no buffers have been allocated\n");
>  		return -EINVAL;
>  	}
>  
>  	if (q->num_buffers < q->min_buffers_needed) {
> -		dprintk(1, "need at least %u allocated buffers\n",
> +		dprintk(q, 1, "need at least %u allocated buffers\n",
>  				q->min_buffers_needed);
>  		return -EINVAL;
>  	}
> @@ -2006,7 +2007,7 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type)
>  
>  	q->streaming = 1;
>  
> -	dprintk(3, "successful\n");
> +	dprintk(q, 3, "successful\n");
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(vb2_core_streamon);
> @@ -2022,7 +2023,7 @@ EXPORT_SYMBOL_GPL(vb2_queue_error);
>  int vb2_core_streamoff(struct vb2_queue *q, unsigned int type)
>  {
>  	if (type != q->type) {
> -		dprintk(1, "invalid stream type\n");
> +		dprintk(q, 1, "invalid stream type\n");
>  		return -EINVAL;
>  	}
>  
> @@ -2039,7 +2040,7 @@ int vb2_core_streamoff(struct vb2_queue *q, unsigned int type)
>  	q->waiting_for_buffers = !q->is_output;
>  	q->last_buffer_dequeued = false;
>  
> -	dprintk(3, "successful\n");
> +	dprintk(q, 3, "successful\n");
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(vb2_core_streamoff);
> @@ -2082,39 +2083,39 @@ int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
>  	struct dma_buf *dbuf;
>  
>  	if (q->memory != VB2_MEMORY_MMAP) {
> -		dprintk(1, "queue is not currently set up for mmap\n");
> +		dprintk(q, 1, "queue is not currently set up for mmap\n");
>  		return -EINVAL;
>  	}
>  
>  	if (!q->mem_ops->get_dmabuf) {
> -		dprintk(1, "queue does not support DMA buffer exporting\n");
> +		dprintk(q, 1, "queue does not support DMA buffer exporting\n");
>  		return -EINVAL;
>  	}
>  
>  	if (flags & ~(O_CLOEXEC | O_ACCMODE)) {
> -		dprintk(1, "queue does support only O_CLOEXEC and access mode flags\n");
> +		dprintk(q, 1, "queue does support only O_CLOEXEC and access mode flags\n");
>  		return -EINVAL;
>  	}
>  
>  	if (type != q->type) {
> -		dprintk(1, "invalid buffer type\n");
> +		dprintk(q, 1, "invalid buffer type\n");
>  		return -EINVAL;
>  	}
>  
>  	if (index >= q->num_buffers) {
> -		dprintk(1, "buffer index out of range\n");
> +		dprintk(q, 1, "buffer index out of range\n");
>  		return -EINVAL;
>  	}
>  
>  	vb = q->bufs[index];
>  
>  	if (plane >= vb->num_planes) {
> -		dprintk(1, "buffer plane out of range\n");
> +		dprintk(q, 1, "buffer plane out of range\n");
>  		return -EINVAL;
>  	}
>  
>  	if (vb2_fileio_is_active(q)) {
> -		dprintk(1, "expbuf: file io in progress\n");
> +		dprintk(q, 1, "expbuf: file io in progress\n");
>  		return -EBUSY;
>  	}
>  
> @@ -2123,20 +2124,20 @@ int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
>  	dbuf = call_ptr_memop(vb, get_dmabuf, vb_plane->mem_priv,
>  				flags & O_ACCMODE);
>  	if (IS_ERR_OR_NULL(dbuf)) {
> -		dprintk(1, "failed to export buffer %d, plane %d\n",
> +		dprintk(q, 1, "failed to export buffer %d, plane %d\n",
>  			index, plane);
>  		return -EINVAL;
>  	}
>  
>  	ret = dma_buf_fd(dbuf, flags & ~O_ACCMODE);
>  	if (ret < 0) {
> -		dprintk(3, "buffer %d, plane %d failed to export (%d)\n",
> +		dprintk(q, 3, "buffer %d, plane %d failed to export (%d)\n",
>  			index, plane, ret);
>  		dma_buf_put(dbuf);
>  		return ret;
>  	}
>  
> -	dprintk(3, "buffer %d, plane %d exported as %d descriptor\n",
> +	dprintk(q, 3, "buffer %d, plane %d exported as %d descriptor\n",
>  		index, plane, ret);
>  	*fd = ret;
>  
> @@ -2153,7 +2154,7 @@ int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
>  	unsigned long length;
>  
>  	if (q->memory != VB2_MEMORY_MMAP) {
> -		dprintk(1, "queue is not currently set up for mmap\n");
> +		dprintk(q, 1, "queue is not currently set up for mmap\n");
>  		return -EINVAL;
>  	}
>  
> @@ -2161,17 +2162,17 @@ int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
>  	 * Check memory area access mode.
>  	 */
>  	if (!(vma->vm_flags & VM_SHARED)) {
> -		dprintk(1, "invalid vma flags, VM_SHARED needed\n");
> +		dprintk(q, 1, "invalid vma flags, VM_SHARED needed\n");
>  		return -EINVAL;
>  	}
>  	if (q->is_output) {
>  		if (!(vma->vm_flags & VM_WRITE)) {
> -			dprintk(1, "invalid vma flags, VM_WRITE needed\n");
> +			dprintk(q, 1, "invalid vma flags, VM_WRITE needed\n");
>  			return -EINVAL;
>  		}
>  	} else {
>  		if (!(vma->vm_flags & VM_READ)) {
> -			dprintk(1, "invalid vma flags, VM_READ needed\n");
> +			dprintk(q, 1, "invalid vma flags, VM_READ needed\n");
>  			return -EINVAL;
>  		}
>  	}
> @@ -2179,7 +2180,7 @@ int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
>  	mutex_lock(&q->mmap_lock);
>  
>  	if (vb2_fileio_is_active(q)) {
> -		dprintk(1, "mmap: file io in progress\n");
> +		dprintk(q, 1, "mmap: file io in progress\n");
>  		ret = -EBUSY;
>  		goto unlock;
>  	}
> @@ -2200,7 +2201,7 @@ int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
>  	 */
>  	length = PAGE_ALIGN(vb->planes[plane].length);
>  	if (length < (vma->vm_end - vma->vm_start)) {
> -		dprintk(1,
> +		dprintk(q, 1,
>  			"MMAP invalid, as it would overflow buffer length\n");
>  		ret = -EINVAL;
>  		goto unlock;
> @@ -2220,7 +2221,7 @@ int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
>  	if (ret)
>  		return ret;
>  
> -	dprintk(3, "buffer %d, plane %d successfully mapped\n", buffer, plane);
> +	dprintk(q, 3, "buffer %d, plane %d successfully mapped\n", buffer, plane);
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(vb2_mmap);
> @@ -2239,7 +2240,7 @@ unsigned long vb2_get_unmapped_area(struct vb2_queue *q,
>  	int ret;
>  
>  	if (q->memory != VB2_MEMORY_MMAP) {
> -		dprintk(1, "queue is not currently set up for mmap\n");
> +		dprintk(q, 1, "queue is not currently set up for mmap\n");
>  		return -EINVAL;
>  	}
>  
> @@ -2479,7 +2480,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
>  	 */
>  	count = 1;
>  
> -	dprintk(3, "setting up file io: mode %s, count %d, read_once %d, write_immediately %d\n",
> +	dprintk(q, 3, "setting up file io: mode %s, count %d, read_once %d, write_immediately %d\n",
>  		(read) ? "read" : "write", count, q->fileio_read_once,
>  		q->fileio_write_immediately);
>  
> @@ -2577,7 +2578,7 @@ static int __vb2_cleanup_fileio(struct vb2_queue *q)
>  		fileio->count = 0;
>  		vb2_core_reqbufs(q, fileio->memory, &fileio->count);
>  		kfree(fileio);
> -		dprintk(3, "file io emulator closed\n");
> +		dprintk(q, 3, "file io emulator closed\n");
>  	}
>  	return 0;
>  }
> @@ -2606,7 +2607,7 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
>  	unsigned index;
>  	int ret;
>  
> -	dprintk(3, "mode %s, offset %ld, count %zd, %sblocking\n",
> +	dprintk(q, 3, "mode %s, offset %ld, count %zd, %sblocking\n",
>  		read ? "read" : "write", (long)*ppos, count,
>  		nonblock ? "non" : "");
>  
> @@ -2614,7 +2615,7 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
>  		return -EINVAL;
>  
>  	if (q->waiting_in_dqbuf) {
> -		dprintk(3, "another dup()ped fd is %s\n",
> +		dprintk(q, 3, "another dup()ped fd is %s\n",
>  			read ? "reading" : "writing");
>  		return -EBUSY;
>  	}
> @@ -2624,7 +2625,7 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
>  	 */
>  	if (!vb2_fileio_is_active(q)) {
>  		ret = __vb2_init_fileio(q, read);
> -		dprintk(3, "vb2_init_fileio result: %d\n", ret);
> +		dprintk(q, 3, "vb2_init_fileio result: %d\n", ret);
>  		if (ret)
>  			return ret;
>  	}
> @@ -2641,7 +2642,7 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
>  		 * Call vb2_dqbuf to get buffer back.
>  		 */
>  		ret = vb2_core_dqbuf(q, &index, NULL, nonblock);
> -		dprintk(5, "vb2_dqbuf result: %d\n", ret);
> +		dprintk(q, 5, "vb2_dqbuf result: %d\n", ret);
>  		if (ret)
>  			return ret;
>  		fileio->dq_count += 1;
> @@ -2672,20 +2673,20 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
>  	 */
>  	if (buf->pos + count > buf->size) {
>  		count = buf->size - buf->pos;
> -		dprintk(5, "reducing read count: %zd\n", count);
> +		dprintk(q, 5, "reducing read count: %zd\n", count);
>  	}
>  
>  	/*
>  	 * Transfer data to userspace.
>  	 */
> -	dprintk(3, "copying %zd bytes - buffer %d, offset %u\n",
> +	dprintk(q, 3, "copying %zd bytes - buffer %d, offset %u\n",
>  		count, index, buf->pos);
>  	if (read)
>  		ret = copy_to_user(data, buf->vaddr + buf->pos, count);
>  	else
>  		ret = copy_from_user(buf->vaddr + buf->pos, data, count);
>  	if (ret) {
> -		dprintk(3, "error copying data\n");
> +		dprintk(q, 3, "error copying data\n");
>  		return -EFAULT;
>  	}
>  
> @@ -2705,7 +2706,7 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
>  		 * Check if this is the last buffer to read.
>  		 */
>  		if (read && fileio->read_once && fileio->dq_count == 1) {
> -			dprintk(3, "read limit reached\n");
> +			dprintk(q, 3, "read limit reached\n");
>  			return __vb2_cleanup_fileio(q);
>  		}
>  
> @@ -2717,7 +2718,7 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
>  		if (copy_timestamp)
>  			b->timestamp = ktime_get_ns();
>  		ret = vb2_core_qbuf(q, index, NULL, NULL);
> -		dprintk(5, "vb2_dbuf result: %d\n", ret);
> +		dprintk(q, 5, "vb2_dbuf result: %d\n", ret);
>  		if (ret)
>  			return ret;
>  
> @@ -2804,7 +2805,7 @@ static int vb2_thread(void *data)
>  			if (!threadio->stop)
>  				ret = vb2_core_dqbuf(q, &index, NULL, 0);
>  			call_void_qop(q, wait_prepare, q);
> -			dprintk(5, "file io: vb2_dqbuf result: %d\n", ret);
> +			dprintk(q, 5, "file io: vb2_dqbuf result: %d\n", ret);
>  			if (!ret)
>  				vb = q->bufs[index];
>  		}
> @@ -2858,7 +2859,7 @@ int vb2_thread_start(struct vb2_queue *q, vb2_thread_fnc fnc, void *priv,
>  	threadio->priv = priv;
>  
>  	ret = __vb2_init_fileio(q, !q->is_output);
> -	dprintk(3, "file io: vb2_init_fileio result: %d\n", ret);
> +	dprintk(q, 3, "file io: vb2_init_fileio result: %d\n", ret);
>  	if (ret)
>  		goto nomem;
>  	q->threadio = threadio;
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 40d76eb4c2fe..0f034cabcd21 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -35,10 +35,11 @@
>  static int debug;
>  module_param(debug, int, 0644);
>  
> -#define dprintk(level, fmt, arg...)					      \
> +#define dprintk(q, level, fmt, arg...)					      \
>  	do {								      \
>  		if (debug >= level)					      \
> -			pr_info("vb2-v4l2: %s: " fmt, __func__, ## arg); \
> +			pr_info("vb2-v4l2: (q=%p) %s: " fmt,		      \
> +				q, __func__, ## arg);			      \
>  	} while (0)
>  
>  /* Flags that are set by us */
> @@ -63,12 +64,14 @@ static int __verify_planes_array(struct vb2_buffer *vb, const struct v4l2_buffer
>  
>  	/* Is memory for copying plane information present? */
>  	if (b->m.planes == NULL) {
> -		dprintk(1, "multi-planar buffer passed but planes array not provided\n");
> +		dprintk(vb->vb2_queue, 1,
> +			"multi-planar buffer passed but planes array not provided\n");
>  		return -EINVAL;
>  	}
>  
>  	if (b->length < vb->num_planes || b->length > VB2_MAX_PLANES) {
> -		dprintk(1, "incorrect planes array length, expected %d, got %d\n",
> +		dprintk(vb->vb2_queue, 1,
> +			"incorrect planes array length, expected %d, got %d\n",
>  			vb->num_planes, b->length);
>  		return -EINVAL;
>  	}
> @@ -176,7 +179,7 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
>  
>  	ret = __verify_length(vb, b);
>  	if (ret < 0) {
> -		dprintk(1, "plane parameters verification failed: %d\n", ret);
> +		dprintk(q, 1, "plane parameters verification failed: %d\n", ret);
>  		return ret;
>  	}
>  	if (b->field == V4L2_FIELD_ALTERNATE && q->is_output) {
> @@ -189,7 +192,7 @@ static int vb2_fill_vb2_v4l2_buffer(struct vb2_buffer *vb, struct v4l2_buffer *b
>  		 * that just says that it is either a top or a bottom field,
>  		 * but not which of the two it is.
>  		 */
> -		dprintk(1, "the field is incorrectly set to ALTERNATE for an output buffer\n");
> +		dprintk(q, 1, "the field is incorrectly set to ALTERNATE for an output buffer\n");
>  		return -EINVAL;
>  	}
>  	vbuf->sequence = 0;
> @@ -342,23 +345,23 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
>  	int ret;
>  
>  	if (b->type != q->type) {
> -		dprintk(1, "%s: invalid buffer type\n", opname);
> +		dprintk(q, 1, "%s: invalid buffer type\n", opname);
>  		return -EINVAL;
>  	}
>  
>  	if (b->index >= q->num_buffers) {
> -		dprintk(1, "%s: buffer index out of range\n", opname);
> +		dprintk(q, 1, "%s: buffer index out of range\n", opname);
>  		return -EINVAL;
>  	}
>  
>  	if (q->bufs[b->index] == NULL) {
>  		/* Should never happen */
> -		dprintk(1, "%s: buffer is NULL\n", opname);
> +		dprintk(q, 1, "%s: buffer is NULL\n", opname);
>  		return -EINVAL;
>  	}
>  
>  	if (b->memory != q->memory) {
> -		dprintk(1, "%s: invalid memory type\n", opname);
> +		dprintk(q, 1, "%s: invalid memory type\n", opname);
>  		return -EINVAL;
>  	}
>  
> @@ -370,7 +373,7 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
>  
>  	if (!is_prepare && (b->flags & V4L2_BUF_FLAG_REQUEST_FD) &&
>  	    vb->state != VB2_BUF_STATE_DEQUEUED) {
> -		dprintk(1, "%s: buffer is not in dequeued state\n", opname);
> +		dprintk(q, 1, "%s: buffer is not in dequeued state\n", opname);
>  		return -EINVAL;
>  	}
>  
> @@ -388,19 +391,19 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
>  
>  	if (!(b->flags & V4L2_BUF_FLAG_REQUEST_FD)) {
>  		if (q->requires_requests) {
> -			dprintk(1, "%s: queue requires requests\n", opname);
> +			dprintk(q, 1, "%s: queue requires requests\n", opname);
>  			return -EBADR;
>  		}
>  		if (q->uses_requests) {
> -			dprintk(1, "%s: queue uses requests\n", opname);
> +			dprintk(q, 1, "%s: queue uses requests\n", opname);
>  			return -EBUSY;
>  		}
>  		return 0;
>  	} else if (!q->supports_requests) {
> -		dprintk(1, "%s: queue does not support requests\n", opname);
> +		dprintk(q, 1, "%s: queue does not support requests\n", opname);
>  		return -EBADR;
>  	} else if (q->uses_qbuf) {
> -		dprintk(1, "%s: queue does not use requests\n", opname);
> +		dprintk(q, 1, "%s: queue does not use requests\n", opname);
>  		return -EBUSY;
>  	}
>  
> @@ -430,13 +433,13 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
>  		return -EINVAL;
>  
>  	if (b->request_fd < 0) {
> -		dprintk(1, "%s: request_fd < 0\n", opname);
> +		dprintk(q, 1, "%s: request_fd < 0\n", opname);
>  		return -EINVAL;
>  	}
>  
>  	req = media_request_get_by_fd(mdev, b->request_fd);
>  	if (IS_ERR(req)) {
> -		dprintk(1, "%s: invalid request_fd\n", opname);
> +		dprintk(q, 1, "%s: invalid request_fd\n", opname);
>  		return PTR_ERR(req);
>  	}
>  
> @@ -446,7 +449,7 @@ static int vb2_queue_or_prepare_buf(struct vb2_queue *q, struct media_device *md
>  	 */
>  	if (req->state != MEDIA_REQUEST_STATE_IDLE &&
>  	    req->state != MEDIA_REQUEST_STATE_UPDATING) {
> -		dprintk(1, "%s: request is not idle\n", opname);
> +		dprintk(q, 1, "%s: request is not idle\n", opname);
>  		media_request_put(req);
>  		return -EBUSY;
>  	}
> @@ -629,12 +632,12 @@ int vb2_querybuf(struct vb2_queue *q, struct v4l2_buffer *b)
>  	int ret;
>  
>  	if (b->type != q->type) {
> -		dprintk(1, "wrong buffer type\n");
> +		dprintk(q, 1, "wrong buffer type\n");
>  		return -EINVAL;
>  	}
>  
>  	if (b->index >= q->num_buffers) {
> -		dprintk(1, "buffer index out of range\n");
> +		dprintk(q, 1, "buffer index out of range\n");
>  		return -EINVAL;
>  	}
>  	vb = q->bufs[b->index];
> @@ -675,7 +678,7 @@ int vb2_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
>  	int ret;
>  
>  	if (vb2_fileio_is_active(q)) {
> -		dprintk(1, "file io in progress\n");
> +		dprintk(q, 1, "file io in progress\n");
>  		return -EBUSY;
>  	}
>  
> @@ -751,7 +754,7 @@ int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
>  	int ret;
>  
>  	if (vb2_fileio_is_active(q)) {
> -		dprintk(1, "file io in progress\n");
> +		dprintk(q, 1, "file io in progress\n");
>  		return -EBUSY;
>  	}
>  
> @@ -770,12 +773,12 @@ int vb2_dqbuf(struct vb2_queue *q, struct v4l2_buffer *b, bool nonblocking)
>  	int ret;
>  
>  	if (vb2_fileio_is_active(q)) {
> -		dprintk(1, "file io in progress\n");
> +		dprintk(q, 1, "file io in progress\n");
>  		return -EBUSY;
>  	}
>  
>  	if (b->type != q->type) {
> -		dprintk(1, "invalid buffer type\n");
> +		dprintk(q, 1, "invalid buffer type\n");
>  		return -EINVAL;
>  	}
>  
> @@ -799,7 +802,7 @@ EXPORT_SYMBOL_GPL(vb2_dqbuf);
>  int vb2_streamon(struct vb2_queue *q, enum v4l2_buf_type type)
>  {
>  	if (vb2_fileio_is_active(q)) {
> -		dprintk(1, "file io in progress\n");
> +		dprintk(q, 1, "file io in progress\n");
>  		return -EBUSY;
>  	}
>  	return vb2_core_streamon(q, type);
> @@ -809,7 +812,7 @@ EXPORT_SYMBOL_GPL(vb2_streamon);
>  int vb2_streamoff(struct vb2_queue *q, enum v4l2_buf_type type)
>  {
>  	if (vb2_fileio_is_active(q)) {
> -		dprintk(1, "file io in progress\n");
> +		dprintk(q, 1, "file io in progress\n");
>  		return -EBUSY;
>  	}
>  	return vb2_core_streamoff(q, type);
> 

