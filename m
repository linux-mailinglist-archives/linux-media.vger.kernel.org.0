Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6B5136A62
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 10:59:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727455AbgAJJ7t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 04:59:49 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:35433 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727448AbgAJJ7t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 04:59:49 -0500
Received: from [IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef]
 ([IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef])
        by smtp-cloud8.xs4all.net with ESMTPA
        id pr4wilkyYpLtbpr4ziPokh; Fri, 10 Jan 2020 10:59:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578650386; bh=LLhj5g/Wg9RDukj+DENz05SKPksXjmrMPdaz9kXOg+U=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pZjCzE+bj929eCSTqjWIlko2wY/T0Ux/3+Q3MleRKbtgnoVXh25bByPvAEjR0Urqk
         lexcVTmtbgrQM0MiNMJVMEu9XK24MdgsSnJhaHCmcJ17zwBQaRGu7AInN/mKcBJybf
         z2Llk5e+kzftG0aZXD4RIEjRlo/ooC+LK4G1+R7EXzvQc5wk7RTr3GEVvd7q/5Paxs
         pSmFOX/H2zNvAxfs2dgFPsN9SUos0aSJyEJoBT4H09MQxNX7OegHf8asdR10O+Zv92
         EM+Cj/PE6PJsmwC+QaqvwNNEeWR7blWtus6/ao9lMflpN/jri7dVVeSrjHsxV7xm6z
         BzUHvgIngEJeg==
Subject: Re: [RFC][PATCH 06/15] videobuf2: handle
 V4L2_FLAG_MEMORY_NON_CONSISTENT in CREATE_BUFS
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
 <20191217032034.54897-7-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1fedab8f-e9a1-36b1-3dd0-8f1ed782ec4d@xs4all.nl>
Date:   Fri, 10 Jan 2020 10:59:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191217032034.54897-7-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfALt2fSuxg9XeRW0/IyGghVR28gQzeDcHSdiYmVAbndc+DDKVGFJ4c5huIB21MNDZN8mlIXiVGZtihRldcIN2sB64fAvxsnsHGcXxevEcEO2NVZ48yPo
 M3ffEaM2VbEw38TQvB75CXet36DrHcUAScJAkz8jZ4/0KLkdzk9s1m6X6opRYosH+IbZ3wa48bhg+1faVS/Rmof/4XTCF7Pw8boworudnBLDPqMnOpgD6HCj
 Z8mY2MWTKYIttjYed16tn+xxKnWKdl0jmkwm0tXQnJmZJ8IfPge8GMr/waA3mYwDGJNFE78qWHBE/ZIIn00uwniH3HWk9TgjoU5JOJbxF5klyRRcEfunrAed
 tSbnLCiHNrEwzmYONFywdLegjwNDYRCrA2u6gq6TgI1maf2CCaNvLQTalA1SGAqfOTuyXQ/HuUh7M90d9fwOeBzLy2DHdOYsvwzG88MfLaGvW3qpoxi0v3sX
 tUHA2mUdhY6tqPbxxZlvkK1W/eJA6OSDyNbe/Op5zw7sRR2RMMp7Hx6NeN9GEpv3zZQ+TcfceC4wD+Z2TSLBUeACwr3EVIV6iKKd1POJKYYuo4gYwYjdg9HH
 e0l6FR7aje6Hqv21PJZfmotZp7P04XdgkbsH/ekcQHDH9UfGbjoWRgZlZ1G2EJtyU9U=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/17/19 4:20 AM, Sergey Senozhatsky wrote:
> This patch lets user-space to request a non-consistent memory
> allocation during CREATE_BUFS ioctl call. struct v4l2_create_buffers
> has seven 4-byte reserved areas, so reserved[0] is renamed to ->flags.
> The struct, thus, now has six reserved 4-byte regions.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  .../media/uapi/v4l/vidioc-create-bufs.rst     |  8 +++++-
>  .../media/common/videobuf2/videobuf2-core.c   | 27 +++++++++++++++----
>  .../media/common/videobuf2/videobuf2-v4l2.c   |  7 ++++-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  2 +-
>  include/media/videobuf2-core.h                |  4 ++-
>  include/uapi/linux/videodev2.h                |  3 ++-
>  6 files changed, 41 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/media/uapi/v4l/vidioc-create-bufs.rst b/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
> index bd08e4f77ae4..c56e80659b4a 100644
> --- a/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
> @@ -121,7 +121,13 @@ than the number requested.
>  	other changes, then set ``count`` to 0, ``memory`` to
>  	``V4L2_MEMORY_MMAP`` and ``format.type`` to the buffer type.
>      * - __u32
> -      - ``reserved``\ [7]
> +      - ``flags``
> +      - Specifies additional buffer management attributes. E.g. when
> +        ``V4L2_FLAG_MEMORY_NON_CONSISTENT`` set vb2 backends may be allocated
> +        in non-consistent memory.

Same comment as for patch 05/15.

> +
> +    * - __u32
> +      - ``reserved``\ [6]
>        - A place holder for future extensions. Drivers and applications
>  	must set the array to zero.
>  
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 668c56df13f6..d1012a24755d 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -812,9 +812,21 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  }
>  EXPORT_SYMBOL_GPL(vb2_core_reqbufs);
>  
> +static bool verify_consistency_attr(struct vb2_queue *q, bool consistent_mem)
> +{
> +	bool queue_attr = q->dma_attrs & DMA_ATTR_NON_CONSISTENT;
> +
> +	if (consistent_mem != queue_attr) {
> +		dprintk(1, "memory consistency model mismatch\n");
> +		return false;
> +	}
> +	return true;
> +}
> +

This belongs in patch 04/15. The commit log for that patch makes a lot
more sense if this code is moved there.

>  int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
> -		unsigned int *count, unsigned requested_planes,
> -		const unsigned requested_sizes[])
> +			 bool consistent_mem, unsigned int *count,
> +			 unsigned requested_planes,
> +			 const unsigned requested_sizes[])
>  {
>  	unsigned int num_planes = 0, num_buffers, allocated_buffers;
>  	unsigned plane_sizes[VB2_MAX_PLANES] = { };
> @@ -832,10 +844,15 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  		}
>  		memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
>  		q->memory = memory;
> +		__set_queue_consistency(q, consistent_mem);
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

Ditto.

>  
>  	num_buffers = min(*count, VB2_MAX_FRAME - q->num_buffers);
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 0eabb589684f..48d123a1ac2a 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -730,6 +730,7 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  	unsigned requested_sizes[VIDEO_MAX_PLANES];
>  	struct v4l2_format *f = &create->format;
>  	int ret = vb2_verify_memory_type(q, create->memory, f->type);
> +	bool consistent = true;
>  	unsigned i;
>  
>  	fill_buf_caps(q, &create->capabilities);
> @@ -775,7 +776,11 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  	for (i = 0; i < requested_planes; i++)
>  		if (requested_sizes[i] == 0)
>  			return -EINVAL;
> -	return ret ? ret : vb2_core_create_bufs(q, create->memory,
> +
> +	if (create->flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
> +		consistent = false;
> +
> +	return ret ? ret : vb2_core_create_bufs(q, create->memory, consistent,
>  		&create->count, requested_planes, requested_sizes);

As mentioned before: we need a V4L2_BUF_CAP capability.

>  }
>  EXPORT_SYMBOL_GPL(vb2_create_bufs);
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 225d06819bce..793cb6534de4 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -2012,7 +2012,7 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
>  	if (ret)
>  		return ret;
>  
> -	CLEAR_AFTER_FIELD(create, capabilities);
> +	CLEAR_AFTER_FIELD(create, flags);
>  
>  	v4l_sanitize_format(&create->format);
>  
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 810af5cf5742..5e5450bdabbd 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -757,6 +757,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>   * vb2_core_create_bufs() - Allocate buffers and any required auxiliary structs
>   * @q: pointer to &struct vb2_queue with videobuf2 queue.
>   * @memory: memory type, as defined by &enum vb2_memory.
> + * @consistent_mem: memory consistency model.
>   * @count: requested buffer count.
>   * @requested_planes: number of planes requested.
>   * @requested_sizes: array with the size of the planes.
> @@ -774,7 +775,8 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>   * Return: returns zero on success; an error code otherwise.
>   */
>  int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
> -			 unsigned int *count, unsigned int requested_planes,
> +			 bool consistent_mem, unsigned int *count,
> +			 unsigned int requested_planes,
>  			 const unsigned int requested_sizes[]);
>  
>  /**
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 73a4854f71bd..82e2ded5a136 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -2419,7 +2419,8 @@ struct v4l2_create_buffers {
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

