Return-Path: <linux-media+bounces-15198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A12E93808B
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 11:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FBA32824D4
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 09:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7767BB0A;
	Sat, 20 Jul 2024 09:53:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D8C4CE09;
	Sat, 20 Jul 2024 09:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721469227; cv=none; b=tkXJLWlH6RxPAtXcgQjvLRwV6LXnT8E+RGQktOr3dcbYdkLEuWm6SMhcHlqW+junXSk9vpoKbckQxnbX8YQb8vUPGSO++p4hfNqUFwtCUURcQT5RNsUt4D9JvlKD3m88/gOSe+TCjMwcEqeoKxftLdiDr465eAEW3M7dFYV8ifc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721469227; c=relaxed/simple;
	bh=xhomw79Be/HCpaE2/rtrJWGC2ErE93REQWlELmL6Few=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jvbMeGrEiiuBm78OqT+QptZg9LgY3NYiqcvoCRmdd/tXr8e64Gxi/DYgQOCKBjI2iRQQlntUEg+hwHnhxqU8rL3UlC8dzil5hNG8k3QA2LBZBEu4Tb4TXjcVje/3u7tmwuyn1yYpOhj2V3Sxfjmf2T3ViZmRk23W6W8BOLPgHII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29CAC2BD10;
	Sat, 20 Jul 2024 09:53:39 +0000 (UTC)
Message-ID: <a6a7a9c8-7406-4e69-a5cf-08cf06c7793d@xs4all.nl>
Date: Sat, 20 Jul 2024 11:53:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/28] v4l2: handle restricted memory flags in queue
 setup
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240720071606.27930-1-yunfei.dong@mediatek.com>
 <20240720071606.27930-3-yunfei.dong@mediatek.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240720071606.27930-3-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/07/2024 09:15, Yunfei Dong wrote:
> From: Jeffrey Kardatzke <jkardatzke@google.com>
> 
> Validates the restricted memory flags when setting up a queue and
> ensures the queue has the proper capability.
> 
> Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> [Yunfei: Change reviewer's comments]
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 29 +++++++++++++++++++
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  4 ++-
>  2 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 0217392fcc0d..44080121f37e 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -830,6 +830,23 @@ static bool verify_coherency_flags(struct vb2_queue *q, bool non_coherent_mem)
>  	return true;
>  }
>  
> +static bool verify_restricted_mem_flags(struct vb2_queue *q, bool restricted_mem)
> +{
> +	if (restricted_mem != q->restricted_mem) {
> +		dprintk(q, 1, "restricted memory model mismatch\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static inline int restricted_mem_mismatch(bool restricted_mem, struct vb2_queue *q,
> +					  enum vb2_memory memory)
> +{
> +	return restricted_mem && (!q->allow_restricted_mem || memory != VB2_MEMORY_DMABUF) ?
> +	       -1 : 0;
> +}
> +
>  static int vb2_core_allocated_buffers_storage(struct vb2_queue *q)
>  {
>  	if (!q->bufs)
> @@ -863,6 +880,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	unsigned int q_num_bufs = vb2_get_num_buffers(q);
>  	unsigned plane_sizes[VB2_MAX_PLANES] = { };
>  	bool non_coherent_mem = flags & V4L2_MEMORY_FLAG_NON_COHERENT;
> +	bool restricted_mem = flags & V4L2_MEMORY_FLAG_RESTRICTED;
>  	unsigned int i, first_index;
>  	int ret = 0;
>  
> @@ -906,6 +924,9 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  			return 0;
>  	}
>  
> +	if (restricted_mem_mismatch(restricted_mem, q, memory))
> +		return -EINVAL;
> +
>  	/*
>  	 * Make sure the requested values and current defaults are sane.
>  	 */
> @@ -923,6 +944,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	if (ret)
>  		return ret;
>  	set_queue_coherency(q, non_coherent_mem);
> +	q->restricted_mem = restricted_mem;
>  
>  	/*
>  	 * Ask the driver how many buffers and planes per buffer it requires.
> @@ -1031,6 +1053,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  	unsigned plane_sizes[VB2_MAX_PLANES] = { };
>  	bool non_coherent_mem = flags & V4L2_MEMORY_FLAG_NON_COHERENT;
>  	unsigned int q_num_bufs = vb2_get_num_buffers(q);
> +	bool restricted_mem = flags & V4L2_MEMORY_FLAG_RESTRICTED;
>  	bool no_previous_buffers = !q_num_bufs;
>  	int ret = 0;
>  
> @@ -1039,6 +1062,9 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  		return -ENOBUFS;
>  	}
>  
> +	if (restricted_mem_mismatch(restricted_mem, q, memory))
> +		return -EINVAL;
> +
>  	if (no_previous_buffers) {
>  		if (q->waiting_in_dqbuf && *count) {
>  			dprintk(q, 1, "another dup()ped fd is waiting for a buffer\n");
> @@ -1057,6 +1083,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  			return ret;
>  		q->waiting_for_buffers = !q->is_output;
>  		set_queue_coherency(q, non_coherent_mem);
> +		q->restricted_mem = restricted_mem;
>  	} else {
>  		if (q->memory != memory) {
>  			dprintk(q, 1, "memory model mismatch\n");
> @@ -1064,6 +1091,8 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  		}
>  		if (!verify_coherency_flags(q, non_coherent_mem))
>  			return -EINVAL;
> +		if (!verify_restricted_mem_flags(q, restricted_mem))
> +			return -EINVAL;
>  	}
>  
>  	num_buffers = min(*count, q->max_num_buffers - q_num_bufs);
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 293f3d5f1c4e..9ee24e537e0c 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -682,7 +682,7 @@ static void vb2_set_flags_and_caps(struct vb2_queue *q, u32 memory,
>  		*flags = 0;

Hmm, unless I am mistaken, this clears all flags. So if memory is DMABUF, then
the V4L2_MEMORY_FLAG_RESTRICTED is just overwritten with 0. And that's what will
be passed to vb2_core_reqbufs.

So how can this work? I'm not sure how you can have tested this.

In any case, this function should change and do this instead:

        /* Clear all unknown flags. */
         *flags &= V4L2_MEMORY_FLAG_NON_COHERENT | V4L2_MEMORY_FLAG_RESTRICTED;

        if (!q->allow_cache_hints || memory != V4L2_MEMORY_MMAP)
		*flags &= ~V4L2_MEMORY_FLAG_NON_COHERENT;

I considered whether V4L2_MEMORY_FLAG_RESTRICTED should be cleared if memory
wasn't DMABUF, but I don't think that is right: you want to see an error
returned if you try such a combination.

>  	} else {
>  		/* Clear all unknown flags. */
> -		*flags &= V4L2_MEMORY_FLAG_NON_COHERENT;
> +		*flags &= V4L2_MEMORY_FLAG_NON_COHERENT | V4L2_MEMORY_FLAG_RESTRICTED;
>  	}
>  
>  	*caps |= V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS;
> @@ -698,6 +698,8 @@ static void vb2_set_flags_and_caps(struct vb2_queue *q, u32 memory,
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
>  	if (q->supports_requests)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
> +	if (q->allow_restricted_mem && q->io_modes & VB2_DMABUF)
> +		*caps |= V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM;
>  	if (max_num_bufs) {
>  		*max_num_bufs = q->max_num_buffers;
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS;

What appears to be missing in this patch is what happens if you pass unrestricted
memory to a queue that is configured for restricted memory: there does not appear
to be a check for that. Or is that allowed? If so, that should be documented.

And what happens if you pass a dmabuf for restricted memory to a queue that expects
unrestricted memory? You want to get a nice error code for that (EACCES/EPERM, I
never quite know which is the right one for that). That would apply to VIDIOC_QBUF
and VIDIOC_PREPARE_BUF. This assumes you can easily query a dmabuf fd to see whether
it is in restricted memory or not. I'm not sure if that is the case today.

I also think that it would be useful to add a V4L2_BUF_FLAG_RESTRICTED_MEM flag
that vb2 will return to userspace if the queue is configured for restricted memory.

That will indicate to the application that the buffer indeed represents a buffer
in restricted memory.

Regards,

	Hans

