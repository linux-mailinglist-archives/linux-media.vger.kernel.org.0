Return-Path: <linux-media+bounces-16589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5041F95A847
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 01:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D00D71F219EC
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 23:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503BC17DFE8;
	Wed, 21 Aug 2024 23:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="j77iXEHT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B623D175D22;
	Wed, 21 Aug 2024 23:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724282911; cv=none; b=bTxXpqUBmDRdqqLhkg3hDDhQQjaSNWbDRwciz7oMJUm6knPdKoq6JC2rTa6DoNf29g9QOrxIHvtNy7YCeZMuj1uo43wMlr2G/+5RmNdIS2Jd/TqqMzzsGiNBifDYhjn5J0BWtYzi8qBItCeX0S/RIG9lWewTYncTofrRK7CuGxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724282911; c=relaxed/simple;
	bh=9+JvsqBUfEI+RL/ie2rdDQQLLtHrPy2Q8Ug4scOkQMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JaE+tTw3+gcJOTxudaCbewwrjCHQCyLAMeLNdwwRCZXoePPrO1nbaIynttGk8agu/S/oVcY9IfjutbAFXW9BySt0MxGXHlwl/5Jdd5HEZeqNPg6mqg/EiAp7DLgvKQRxsKcFQS2q66OOLpleazc2bv8ufE4VIQdDezQ12cvn868=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=j77iXEHT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6501F2D5;
	Thu, 22 Aug 2024 01:27:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724282838;
	bh=9+JvsqBUfEI+RL/ie2rdDQQLLtHrPy2Q8Ug4scOkQMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j77iXEHTan2gR+IoGtFfwGz/Fs0WDsoVUB/amIY39PQ9hdkUY1fUaPkGMfyRQWxiW
	 jjxGP5Zz0YzKo4L387muD4LR+YOTrrR02H0CqaF8vE92jbeLLLcsL11I9V2fTKamXy
	 Rse7FYALlAYmHK/nrJZ5jKP6qDhSXzPQqLuzvqMo=
Date: Thu, 22 Aug 2024 02:28:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
	hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v21 2/9] videobuf2: Add min_reqbufs_allocation field to
 vb2_queue structure
Message-ID: <20240821232819.GA18600@pendragon.ideasonboard.com>
References: <20240314153226.197445-1-benjamin.gaignard@collabora.com>
 <20240314153226.197445-3-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240314153226.197445-3-benjamin.gaignard@collabora.com>

Hi Benjamin,

On Thu, Mar 14, 2024 at 04:32:19PM +0100, Benjamin Gaignard wrote:
> Add 'min_reqbufs_allocation' field in the vb2_queue structure so drivers
> can specify the minimum number of buffers to allocate when calling
> VIDIOC_REQBUFS.
> When initializing the queue, v4l2 core makes sure that the following
> constraints are respected:
> - the minimum number of buffers to allocate must be at least 2 because
> one buffer is used by the hardware while the other is being processed
> by userspace.

This breaks userspace for the Renesas vsp1 driver :-( Unit tests fail,
as some of them rely on operation with a single buffer.

The vsp1 is a memory-to-memory processing engine, so operating with a
single buffer is fine in some use cases. I would argue that for live
capture devices there are valid use cases to operate with a single
buffer too. Changing this by default will break use cases.

How can we relax this check ? Should I simply submit a patch that lowers
the minimum to one buffer ?

> -if the driver needs 'min_queued_buffers' in the queue before calling
> start_streaming(), then the minimum requirement is 'min_queued_buffers + 1'
> to keep at least one buffer available for userspace.
> 
> Simplify __vb2_init_fileio() by using 'min_reqbufs_allocation' directly
> to avoid duplicating the minimum number of buffers to allocate computation.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 38 +++++++++++--------
>  include/media/videobuf2-core.h                | 15 +++++++-
>  2 files changed, 37 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index d8b3c04cb3b5..58c495b253ce 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -866,7 +866,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	/*
>  	 * Make sure the requested values and current defaults are sane.
>  	 */
> -	num_buffers = max_t(unsigned int, *count, q->min_queued_buffers);
> +	num_buffers = max_t(unsigned int, *count, q->min_reqbufs_allocation);
>  	num_buffers = min_t(unsigned int, num_buffers, q->max_num_buffers);
>  	memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
>  	/*
> @@ -918,7 +918,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	 * There is no point in continuing if we can't allocate the minimum
>  	 * number of buffers needed by this vb2_queue.
>  	 */
> -	if (allocated_buffers < q->min_queued_buffers)
> +	if (allocated_buffers < q->min_reqbufs_allocation)
>  		ret = -ENOMEM;
>  
>  	/*
> @@ -2524,6 +2524,25 @@ int vb2_core_queue_init(struct vb2_queue *q)
>  	if (WARN_ON(q->supports_requests && q->min_queued_buffers))
>  		return -EINVAL;
>  
> +	/*
> +	 * The minimum requirement is 2: one buffer is used
> +	 * by the hardware while the other is being processed by userspace.
> +	 */
> +	if (q->min_reqbufs_allocation < 2)
> +		q->min_reqbufs_allocation = 2;
> +
> +	/*
> +	 * If the driver needs 'min_queued_buffers' in the queue before
> +	 * calling start_streaming() then the minimum requirement is
> +	 * 'min_queued_buffers + 1' to keep at least one buffer available
> +	 * for userspace.
> +	 */
> +	if (q->min_reqbufs_allocation < q->min_queued_buffers + 1)
> +		q->min_reqbufs_allocation = q->min_queued_buffers + 1;
> +
> +	if (WARN_ON(q->min_reqbufs_allocation > q->max_num_buffers))
> +		return -EINVAL;
> +
>  	INIT_LIST_HEAD(&q->queued_list);
>  	INIT_LIST_HEAD(&q->done_list);
>  	spin_lock_init(&q->done_lock);
> @@ -2717,7 +2736,6 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
>  	struct vb2_fileio_data *fileio;
>  	struct vb2_buffer *vb;
>  	int i, ret;
> -	unsigned int count = 0;
>  
>  	/*
>  	 * Sanity check
> @@ -2738,18 +2756,8 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
>  	if (q->streaming || vb2_get_num_buffers(q) > 0)
>  		return -EBUSY;
>  
> -	/*
> -	 * Start with q->min_queued_buffers + 1, driver can increase it in
> -	 * queue_setup()
> -	 *
> -	 * 'min_queued_buffers' buffers need to be queued up before you
> -	 * can start streaming, plus 1 for userspace (or in this case,
> -	 * kernelspace) processing.
> -	 */
> -	count = max(2, q->min_queued_buffers + 1);
> -
>  	dprintk(q, 3, "setting up file io: mode %s, count %d, read_once %d, write_immediately %d\n",
> -		(read) ? "read" : "write", count, q->fileio_read_once,
> +		(read) ? "read" : "write", q->min_reqbufs_allocation, q->fileio_read_once,
>  		q->fileio_write_immediately);
>  
>  	fileio = kzalloc(sizeof(*fileio), GFP_KERNEL);
> @@ -2763,7 +2771,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
>  	 * Request buffers and use MMAP type to force driver
>  	 * to allocate buffers by itself.
>  	 */
> -	fileio->count = count;
> +	fileio->count = q->min_reqbufs_allocation;
>  	fileio->memory = VB2_MEMORY_MMAP;
>  	fileio->type = q->type;
>  	q->fileio = fileio;
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 667bf9ee1101..4a8b9135cec8 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -549,9 +549,21 @@ struct vb2_buf_ops {
>   *		@start_streaming can be called. Used when a DMA engine
>   *		cannot be started unless at least this number of buffers
>   *		have been queued into the driver.
> - *		VIDIOC_REQBUFS will ensure at least @min_queued_buffers
> + *		VIDIOC_REQBUFS will ensure at least @min_queued_buffers + 1
>   *		buffers will be allocated. Note that VIDIOC_CREATE_BUFS will not
>   *		modify the requested buffer count.
> + * @min_reqbufs_allocation: the minimum number of buffers to be allocated when
> + *		calling VIDIOC_REQBUFS. Note that VIDIOC_CREATE_BUFS will *not*
> + *		modify the requested buffer count and does not use this field.
> + *		Drivers can set this if there has to be a certain number of
> + *		buffers available for the hardware to work effectively.
> + *		This allows calling VIDIOC_REQBUFS with a buffer count of 1 and
> + *		it will be automatically adjusted to a workable	buffer count.
> + *		If set, then @min_reqbufs_allocation must be larger than
> + *		@min_queued_buffers + 1.
> + *		If this field is > 3, then it is highly recommended that the
> + *		driver implements the V4L2_CID_MIN_BUFFERS_FOR_CAPTURE/OUTPUT
> + *		control.
>   * @alloc_devs:	&struct device memory type/allocator-specific per-plane device
>   */
>  /*
> @@ -622,6 +634,7 @@ struct vb2_queue {
>  	u32				timestamp_flags;
>  	gfp_t				gfp_flags;
>  	u32				min_queued_buffers;
> +	u32				min_reqbufs_allocation;
>  
>  	struct device			*alloc_devs[VB2_MAX_PLANES];
>  

-- 
Regards,

Laurent Pinchart

