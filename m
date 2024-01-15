Return-Path: <linux-media+bounces-3716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E9482DCDF
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 17:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5ED441C21CBE
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 16:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A402179A1;
	Mon, 15 Jan 2024 16:04:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD5917BA0;
	Mon, 15 Jan 2024 16:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 858C7C433F1;
	Mon, 15 Jan 2024 16:04:17 +0000 (UTC)
Message-ID: <c5695654-d54d-4c26-97c3-671b561c559e@xs4all.nl>
Date: Mon, 15 Jan 2024 17:04:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 3/8] media: core: Rework how create_buf index returned
 value is computed
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 kernel@collabora.com
References: <20231215090813.15610-1-benjamin.gaignard@collabora.com>
 <20231215090813.15610-4-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20231215090813.15610-4-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/12/2023 10:08, Benjamin Gaignard wrote:
> When DELETE_BUFS will be introduced holes could created in bufs array.
> To be able to reuse these unused indices reworking how create->index
> is set is mandatory.
> Let __vb2_queue_alloc() decide which first index is correct and
> forward this to the caller.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 22 ++++++++++++-------
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 20 +++++++++++------
>  include/media/videobuf2-core.h                |  5 ++++-
>  3 files changed, 31 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index a183edf11586..cd2b9e51b9b0 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -447,11 +447,12 @@ static void vb2_queue_remove_buffer(struct vb2_buffer *vb)
>   */
>  static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
>  			     unsigned int num_buffers, unsigned int num_planes,
> -			     const unsigned plane_sizes[VB2_MAX_PLANES])
> +			     const unsigned int plane_sizes[VB2_MAX_PLANES],
> +			     unsigned int *first_index)
>  {
> -	unsigned int q_num_buffers = vb2_get_num_buffers(q);
>  	unsigned int buffer, plane;
>  	struct vb2_buffer *vb;
> +	unsigned long index;
>  	int ret;
>  
>  	/*
> @@ -459,7 +460,11 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
>  	 * in the queue is below q->max_num_buffers
>  	 */
>  	num_buffers = min_t(unsigned int, num_buffers,
> -			    q->max_num_buffers - q_num_buffers);
> +			    q->max_num_buffers - vb2_get_num_buffers(q));
> +
> +	index = vb2_get_num_buffers(q);
> +
> +	*first_index = index;
>  
>  	for (buffer = 0; buffer < num_buffers; ++buffer) {
>  		/* Allocate vb2 buffer structures */
> @@ -479,7 +484,7 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
>  			vb->planes[plane].min_length = plane_sizes[plane];
>  		}
>  
> -		vb2_queue_add_buffer(q, vb, q_num_buffers + buffer);
> +		vb2_queue_add_buffer(q, vb, index++);
>  		call_void_bufop(q, init_buffer, vb);
>  
>  		/* Allocate video buffer memory for the MMAP type */
> @@ -820,7 +825,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	unsigned int q_num_bufs = vb2_get_num_buffers(q);
>  	unsigned plane_sizes[VB2_MAX_PLANES] = { };
>  	bool non_coherent_mem = flags & V4L2_MEMORY_FLAG_NON_COHERENT;
> -	unsigned int i;
> +	unsigned int i, first_index;
>  	int ret = 0;
>  
>  	if (q->streaming) {
> @@ -906,7 +911,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  
>  	/* Finally, allocate buffers and video memory */
>  	allocated_buffers =
> -		__vb2_queue_alloc(q, memory, num_buffers, num_planes, plane_sizes);
> +		__vb2_queue_alloc(q, memory, num_buffers, num_planes, plane_sizes, &first_index);
>  	if (allocated_buffers == 0) {
>  		dprintk(q, 1, "memory allocation failed\n");
>  		ret = -ENOMEM;

I'm thinking that after this 'if' it might be a good idea to add a:

	/* There shouldn't be any buffers allocated, so first_index == 0 */
	WARN_ON(first_index);

Just as a sanity check.

Regards,

	Hans

> @@ -980,7 +985,8 @@ EXPORT_SYMBOL_GPL(vb2_core_reqbufs);
>  int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  			 unsigned int flags, unsigned int *count,
>  			 unsigned int requested_planes,
> -			 const unsigned int requested_sizes[])
> +			 const unsigned int requested_sizes[],
> +			 unsigned int *first_index)
>  {
>  	unsigned int num_planes = 0, num_buffers, allocated_buffers;
>  	unsigned plane_sizes[VB2_MAX_PLANES] = { };
> @@ -1042,7 +1048,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  
>  	/* Finally, allocate buffers and video memory */
>  	allocated_buffers = __vb2_queue_alloc(q, memory, num_buffers,
> -				num_planes, plane_sizes);
> +				num_planes, plane_sizes, first_index);
>  	if (allocated_buffers == 0) {
>  		dprintk(q, 1, "memory allocation failed\n");
>  		ret = -ENOMEM;
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 54d572c3b515..3c0c423c5674 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -797,11 +797,16 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  	for (i = 0; i < requested_planes; i++)
>  		if (requested_sizes[i] == 0)
>  			return -EINVAL;
> -	return ret ? ret : vb2_core_create_bufs(q, create->memory,
> -						create->flags,
> -						&create->count,
> -						requested_planes,
> -						requested_sizes);
> +	if (ret)
> +		return ret;
> +
> +	ret = vb2_core_create_bufs(q, create->memory,
> +				   create->flags,
> +				   &create->count,
> +				   requested_planes,
> +				   requested_sizes,
> +				   &create->index);
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(vb2_create_bufs);
>  
> @@ -1029,15 +1034,16 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
>  	int res = vb2_verify_memory_type(vdev->queue, p->memory,
>  			p->format.type);
>  
> -	p->index = vdev->queue->num_buffers;
>  	fill_buf_caps(vdev->queue, &p->capabilities);
>  	validate_memory_flags(vdev->queue, p->memory, &p->flags);
>  	/*
>  	 * If count == 0, then just check if memory and type are valid.
>  	 * Any -EBUSY result from vb2_verify_memory_type can be mapped to 0.
>  	 */
> -	if (p->count == 0)
> +	if (p->count == 0) {
> +		p->index = vb2_get_num_buffers(vdev->queue);
>  		return res != -EBUSY ? res : 0;
> +	}
>  	if (res)
>  		return res;
>  	if (vb2_queue_is_busy(vdev->queue, file))
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 7b84b4e2e273..607f2ba7a905 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -821,6 +821,8 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>   * @count: requested buffer count.
>   * @requested_planes: number of planes requested.
>   * @requested_sizes: array with the size of the planes.
> + * @first_index: index of the first created buffer, all allocated buffers have
> + *		 indices in the range [first..first+count]
>   *
>   * Videobuf2 core helper to implement VIDIOC_CREATE_BUFS() operation. It is
>   * called internally by VB2 by an API-specific handler, like
> @@ -837,7 +839,8 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  			 unsigned int flags, unsigned int *count,
>  			 unsigned int requested_planes,
> -			 const unsigned int requested_sizes[]);
> +			 const unsigned int requested_sizes[],
> +			 unsigned int *first_index);
>  
>  /**
>   * vb2_core_prepare_buf() - Pass ownership of a buffer from userspace


