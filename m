Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCA46171782
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 13:36:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729009AbgB0MgL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 07:36:11 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:59897 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728977AbgB0MgL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 07:36:11 -0500
Received: from [IPv6:2001:420:44c1:2577:70b8:9d46:3264:f0c0]
 ([IPv6:2001:420:44c1:2577:70b8:9d46:3264:f0c0])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 7IObjDz4cjmHT7IOejidVO; Thu, 27 Feb 2020 13:36:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582806969; bh=QsSTk5VnrASGJ1hRLrPV1YXd++8apxl4wl7VTk3VUZc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Iycy28kHnAai7TZTJgi2BZfdR9K8/cIpBBFd9Q2bh8l0nW9ucyOTYxpKFX9w+muFc
         s+m7GYFfDDMALa32ka06zjyMqpsma2dlId6gIRvVn5fF2SAMOfv1ZKSC6F91sfM8cl
         wPLqHkqTEVBRvmeaC8/feKP/6aA+dKT4aQ6wYrBZOyyafVJksjNokSHrsUGhFk9FL8
         RxDnS4vv58jwLOKj9l5l7tZI6VokdCQJf3E+Gut5PQy5o5OELFsnYNHpgORj1NkKBa
         L1gUQd9T5NExZAoSJV3ATpAVhmjUQjPzrPmHy4EkXa0amqBIgCuSgzS9zDLgiKVyq4
         McUQkUu6qBqCA==
Subject: Re: [PATCHv3 05/11] videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT
 flag
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
References: <20200226111529.180197-1-senozhatsky@chromium.org>
 <20200226111529.180197-6-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8ea79a02-8346-2b1d-c2d8-3a3b36480320@xs4all.nl>
Date:   Thu, 27 Feb 2020 13:36:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226111529.180197-6-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKjDIE1xe4nagzQa7cWlBGm8oDKuSqCtYjNoiXcJcJLwBtiLopxxMKEc80K3bNQHOzsVRwnu/groln0nEnemnJpOyHl3N1W1XSX0F4f9tRCQpVGKdCIU
 omlcu0f2DXGmMPxNtxHNP2BanMazLbxvaab9cPAQLtE9F21mMBwF/QMFwh2xE16B04TnWV+RCZsKrO4VMKjSTaKUmHSRLt+CEQkzsTtN47BMNycKO8USjwMU
 jbxRFf72BMYlmdysni24DgnPQOjD64oT9c3uPmRYFmXidLzPslwAwqIMTRS/xiXhcw8jUbbgRWli8tiYpI0Sz6LHCHw7UO3WxUiiLve858TNamS6V9xCVORD
 zkZmTxdJa4iVskRW//8Koy6gMmqSjUT+wpr/q9FsRn0bOCvSRwBRcIaCyW2fcvnV8fxKnkY45ZRj+uGCX2Ovjrxs4k8lttaRF9gqSS/FT/zjECn8BayHIAuA
 Ret7dE1W0/SBSFb2bYfVVcAazw2zV2YxzgmSIi+96lDzJws/KoBaWy/56xFZ/SpO+Y+hfxVvLKaZXkCfUHs7+HEGpD0D9k+0dI0aIuQVWQ/JcjdHBXTqzOH6
 t1qdRFAX2D2Agt6az5SnzGfLuioUD4rt9+j/jHhb4bxZvEZfcJDsqEel8AQd4I7Zhxg=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/26/20 12:15 PM, Sergey Senozhatsky wrote:
> This patch lets user-space to request a non-consistent memory
> allocation during CREATE_BUFS and REQBUFS ioctl calls.
> 
> = CREATE_BUFS
> 
>   struct v4l2_create_buffers has seven 4-byte reserved areas,
>   so reserved[0] is renamed to ->flags. The struct, thus, now
>   has six reserved 4-byte regions.
> 
> = REQBUFS
> 
>  We use one bit of a ->reserved[1] member of struct v4l2_requestbuffers,
>  which is now renamed to ->flags. Unlike v4l2_create_buffers, struct
>  v4l2_requestbuffers does not have enough reserved room. Therefore for
>  backward compatibility  ->reserved and ->flags were put into anonymous
>  union.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  .../media/uapi/v4l/vidioc-create-bufs.rst     |  8 ++++-
>  .../media/uapi/v4l/vidioc-reqbufs.rst         | 15 +++++++--
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 31 +++++++++++++++++--
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  5 +--
>  include/uapi/linux/videodev2.h                |  8 +++--
>  5 files changed, 54 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/media/uapi/v4l/vidioc-create-bufs.rst b/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
> index bd08e4f77ae4..6a8a4d5de2f1 100644
> --- a/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
> @@ -121,7 +121,13 @@ than the number requested.
>  	other changes, then set ``count`` to 0, ``memory`` to
>  	``V4L2_MEMORY_MMAP`` and ``format.type`` to the buffer type.
>      * - __u32
> -      - ``reserved``\ [7]
> +      - ``flags``
> +      - Specifies additional buffer management attributes.
> +	See :ref:`memory-flags`. Old drivers and applications must set it to
> +	zero.

Drop the last sentence, it's not relevant.

> +
> +    * - __u32
> +      - ``reserved``\ [6]
>        - A place holder for future extensions. Drivers and applications
>  	must set the array to zero.

Old drivers and applications still think reserved is [7] and will zero this.

>  
> diff --git a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> index 917df6fb6486..e52cc4401fba 100644
> --- a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> @@ -112,10 +112,19 @@ aborting or finishing any DMA in progress, an implicit
>  	``V4L2_MEMORY_MMAP`` and ``type`` set to the buffer type. This will
>  	free any previously allocated buffers, so this is typically something
>  	that will be done at the start of the application.
> -    * - __u32
> +    * - union
> +      - (anonymous)

Anonymous unions are formatted a bit differently (I made a very recent patch
that unified the union formatting in the v4l docs). See e.g.
Documentation/media/uapi/v4l/vidioc-g-ext-ctrls.rst.

> +    * -
> +      - __u32
> +      - ``flags``\ [1]
> +      - Specifies additional buffer management attributes.
> +	See :ref:`memory-flags`. Old drivers and applications must set it to
> +	zero.

Ditto.

> +
> +    * -
> +      - __u32
>        - ``reserved``\ [1]
> -      - A place holder for future extensions. Drivers and applications
> -	must set the array to zero.
> +      - Kept for backwards compatibility. Use ``flags`` instead.
>  
>  .. tabularcolumns:: |p{6.1cm}|p{2.2cm}|p{8.7cm}|
>  
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index cc31629c06dc..4954c9fc678d 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -722,9 +722,18 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
>  int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
>  {
>  	int ret = vb2_verify_memory_type(q, req->memory, req->type);
> +	bool consistent = true;
> +
> +	if (!vb2_queue_allows_cache_hints(q))
> +		req->flags &= ~V4L2_FLAG_MEMORY_NON_CONSISTENT;
> +
> +	if (req->flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
> +		consistent = false;
>  
>  	fill_buf_caps(q, &req->capabilities);
> -	return ret ? ret : vb2_core_reqbufs(q, req->memory, true, &req->count);
> +	if (ret)
> +		return ret;
> +	return vb2_core_reqbufs(q, req->memory, consistent, &req->count);
>  }
>  EXPORT_SYMBOL_GPL(vb2_reqbufs);
>  
> @@ -753,6 +762,7 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  	unsigned requested_sizes[VIDEO_MAX_PLANES];
>  	struct v4l2_format *f = &create->format;
>  	int ret = vb2_verify_memory_type(q, create->memory, f->type);
> +	bool consistent = true;
>  	unsigned i;
>  
>  	fill_buf_caps(q, &create->capabilities);
> @@ -798,7 +808,14 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  	for (i = 0; i < requested_planes; i++)
>  		if (requested_sizes[i] == 0)
>  			return -EINVAL;
> -	return ret ? ret : vb2_core_create_bufs(q, create->memory, true,
> +
> +	if (!vb2_queue_allows_cache_hints(q))
> +		create->flags &= ~V4L2_FLAG_MEMORY_NON_CONSISTENT;
> +
> +	if (create->flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
> +		consistent = false;
> +
> +	return ret ? ret : vb2_core_create_bufs(q, create->memory, consistent,
>  		&create->count, requested_planes, requested_sizes);
>  }
>  EXPORT_SYMBOL_GPL(vb2_create_bufs);
> @@ -968,13 +985,21 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
>  {
>  	struct video_device *vdev = video_devdata(file);
>  	int res = vb2_verify_memory_type(vdev->queue, p->memory, p->type);
> +	bool consistent = true;
>  
>  	fill_buf_caps(vdev->queue, &p->capabilities);
>  	if (res)
>  		return res;
>  	if (vb2_queue_is_busy(vdev, file))
>  		return -EBUSY;
> -	res = vb2_core_reqbufs(vdev->queue, p->memory, true, &p->count);
> +
> +	if (!vb2_queue_allows_cache_hints(vdev->queue))
> +		p->flags &= ~V4L2_FLAG_MEMORY_NON_CONSISTENT;
> +
> +	if (p->flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
> +		consistent = false;
> +
> +	res = vb2_core_reqbufs(vdev->queue, p->memory, consistent, &p->count);
>  	/* If count == 0, then the owner has released all buffers and he
>  	   is no longer owner of the queue. Otherwise we have a new owner. */
>  	if (res == 0)
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index fbcc7a20eedf..53b87bfd50d7 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1973,9 +1973,6 @@ static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
>  
>  	if (ret)
>  		return ret;
> -
> -	CLEAR_AFTER_FIELD(p, capabilities);
> -
>  	return ops->vidioc_reqbufs(file, fh, p);
>  }
>  
> @@ -2015,7 +2012,7 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
>  	if (ret)
>  		return ret;
>  
> -	CLEAR_AFTER_FIELD(create, capabilities);
> +	CLEAR_AFTER_FIELD(create, flags);
>  
>  	v4l_sanitize_format(&create->format);
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index e92c29864730..12b1bd220347 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -938,7 +938,10 @@ struct v4l2_requestbuffers {
>  	__u32			type;		/* enum v4l2_buf_type */
>  	__u32			memory;		/* enum v4l2_memory */
>  	__u32			capabilities;
> -	__u32			reserved[1];
> +	union {
> +		__u32		flags;
> +		__u32		reserved[1];
> +	};
>  };
>  
>  /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers */
> @@ -2446,7 +2449,8 @@ struct v4l2_create_buffers {
>  	__u32			memory;
>  	struct v4l2_format	format;
>  	__u32			capabilities;
> -	__u32			reserved[7];
> +	__u32			flags;
> +	__u32			reserved[6];
>  };
>  
>  /*
> 

Regards,

	Hans
