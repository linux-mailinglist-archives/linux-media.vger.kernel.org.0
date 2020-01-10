Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 855BE136A2E
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 10:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbgAJJrM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 04:47:12 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:41465 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727169AbgAJJrL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 04:47:11 -0500
Received: from [IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef]
 ([IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef])
        by smtp-cloud8.xs4all.net with ESMTPA
        id pqsjildy2pLtbpqsmiPiOz; Fri, 10 Jan 2020 10:47:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578649629; bh=SWljMJ5OlZ99yjeAtgtMgDXrvThp5klPre+IS+vRzDg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=W8ygOzUrCv5yF1fyPEG7p0kPS8KfKKenMTXA7iaQ35a2twu7QYd/lQ5bTHuEEq5xA
         Jl3IGqC1G5oJ4v4J1KM4xSzwPiouSXLzrrYZrOwDd23iHZr3L2cjOb3TY5o1s5nw57
         NyUTlZ4x/wekDifmeS7eYdlWKTLhhcZm40UOH31T89WTkoOPLFVyB5pbq3b//QxwTA
         /7QsK8uYGU3F5ppM7R2CBigri0cd06mB7ZzNlw4yJ/iD1MANLVP9NOKGj7H4TUq6Aj
         +CvKJjenKxy0RVecpOhrW4gfDDkIacPr2Zy8bGzNlrCrvZ4WpPn8pinLCG3oBjZyF5
         S4rXOxtyh2WXQ==
Subject: Re: [RFC][PATCH 04/15] videobuf2: add queue memory consistency
 parameter
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-5-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <77ddd5cd-affc-ad0f-829d-d624f9798055@xs4all.nl>
Date:   Fri, 10 Jan 2020 10:47:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191217032034.54897-5-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCdek/Tw0vkKddoukM76+ooSHzCMSWkuVz6pvut6mx3s2x5TmDvdNgkrY5rZ9zKU5NFstcuQsRNgjiIyC68gscUFFGn+qKdsTop8QGTS/TNigk6muoAz
 xqD98nafh0id/3t5KkAHPcLBUlJB0DMg+x5hEGdujxpWAb5Msbg1J1adNCxvrk4ZZPQpeRwEIcO2dqvhu89mmZz4ipmQ6a3RyZqqmBMYO2rBtXjdLb6ALE4C
 qFgKuKMNhO6TY2QhB95Va9HGUnW7X5FsgOscufpKefxJ66Tv/KC3G7oYGAZ24RzNrmwHQRJn9qKLra+ME6hDh3oVfkV/7+LDrOlYbPCui83X+M9mkMAFecyT
 DNFIsJRWXUc4HI1hTOcjlFIhXEHmObbu/zV9mXDbtNsDbPTyzsqcptPvSXQYWmuAVV9V9RcUxeeUU/6BIAoeZt2rJuGpNASuAxwlOyJSgXSR0Ye+5kO54rd8
 HfpClaD44TY2i4nofky+kpU9mkVeN9DQYkQTJgoe5r5WLs82GcS53maYTpTXD6mrXGuFXWwtTRCF7cDBBwjD2uzfE2j2qFI86pQ7VR99592PXNX5tv3odsqc
 JFKpERYxCz/UuxOxxOx53qwaCSa3GSykTDwwoU1dLv2l8J8ZEQYb1mKTQ4PYEBkB8Dw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/17/19 4:20 AM, Sergey Senozhatsky wrote:
> Preparations for future V4L2_FLAG_MEMORY_NON_CONSISTENT support.
> 
> Extend vb2_core_reqbufs() with queue memory consistency flag.
> API permits queue's consistency attribute adjustment only if
> the queue has no allocated buffers, not busy, and does not have
> buffers waiting to be de-queued.

Actually, you can call vb2_core_reqbufs() when buffers are allocated:
it will free the old buffers, then allocate the new ones. So drop the
'has no allocated buffers' bit.

> 
> If user-space attempts to allocate a buffer with consistency
> requirements which don't match queue's consistency model such
> allocation requests will be failed.

Is this last paragraph right? I don't see any code for that.

BTW, a general comment about patches 4-6: I prefer if you changes
this to two patches: one that adds videobuf2-core.c support for
this for reqbufs and create_bufs, then another that wires up the
new V4L2 flag in videobuf2-v4l2.c.

It's easier to review that way.

Regards,

	Hans

> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  drivers/media/common/videobuf2/videobuf2-core.c | 17 +++++++++++++----
>  drivers/media/common/videobuf2/videobuf2-v4l2.c |  4 ++--
>  drivers/media/dvb-core/dvb_vb2.c                |  2 +-
>  include/media/videobuf2-core.h                  |  3 ++-
>  4 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 4489744fbbd9..668c56df13f6 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -664,8 +664,16 @@ int vb2_verify_memory_type(struct vb2_queue *q,
>  }
>  EXPORT_SYMBOL(vb2_verify_memory_type);
>  
> +static void __set_queue_consistency(struct vb2_queue *q, bool consistent_mem)
> +{
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
> @@ -720,6 +728,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	num_buffers = min_t(unsigned int, num_buffers, VB2_MAX_FRAME);
>  	memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
>  	q->memory = memory;
> +	__set_queue_consistency(q, consistent_mem);
>  
>  	/*
>  	 * Ask the driver how many buffers and planes per buffer it requires.
> @@ -2498,7 +2507,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
>  	fileio->memory = VB2_MEMORY_MMAP;
>  	fileio->type = q->type;
>  	q->fileio = fileio;
> -	ret = vb2_core_reqbufs(q, fileio->memory, &fileio->count);
> +	ret = vb2_core_reqbufs(q, fileio->memory, true, &fileio->count);
>  	if (ret)
>  		goto err_kfree;
>  
> @@ -2555,7 +2564,7 @@ static int __vb2_init_fileio(struct vb2_queue *q, int read)
>  
>  err_reqbufs:
>  	fileio->count = 0;
> -	vb2_core_reqbufs(q, fileio->memory, &fileio->count);
> +	vb2_core_reqbufs(q, fileio->memory, true, &fileio->count);
>  
>  err_kfree:
>  	q->fileio = NULL;
> @@ -2575,7 +2584,7 @@ static int __vb2_cleanup_fileio(struct vb2_queue *q)
>  		vb2_core_streamoff(q, q->type);
>  		q->fileio = NULL;
>  		fileio->count = 0;
> -		vb2_core_reqbufs(q, fileio->memory, &fileio->count);
> +		vb2_core_reqbufs(q, fileio->memory, true, &fileio->count);
>  		kfree(fileio);
>  		dprintk(3, "file io emulator closed\n");
>  	}
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 2fccfe2a57f8..f1e88c9398c7 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -695,7 +695,7 @@ int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
>  	int ret = vb2_verify_memory_type(q, req->memory, req->type);
>  
>  	fill_buf_caps(q, &req->capabilities);
> -	return ret ? ret : vb2_core_reqbufs(q, req->memory, &req->count);
> +	return ret ? ret : vb2_core_reqbufs(q, req->memory, true, &req->count);
>  }
>  EXPORT_SYMBOL_GPL(vb2_reqbufs);
>  
> @@ -945,7 +945,7 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
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
> index 026004180440..810af5cf5742 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -726,6 +726,7 @@ void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb);
>   * vb2_core_reqbufs() - Initiate streaming.
>   * @q:		pointer to &struct vb2_queue with videobuf2 queue.
>   * @memory:	memory type, as defined by &enum vb2_memory.
> + * @consistent_mem:	memory consistency model.
>   * @count:	requested buffer count.
>   *
>   * Videobuf2 core helper to implement VIDIOC_REQBUF() operation. It is called
> @@ -750,7 +751,7 @@ void vb2_core_querybuf(struct vb2_queue *q, unsigned int index, void *pb);
>   * Return: returns zero on success; an error code otherwise.
>   */
>  int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
> -		unsigned int *count);
> +		bool consistent_mem, unsigned int *count);
>  
>  /**
>   * vb2_core_create_bufs() - Allocate buffers and any required auxiliary structs
> 

