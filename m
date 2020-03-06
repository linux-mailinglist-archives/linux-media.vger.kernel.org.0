Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49A7617C1D6
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 16:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgCFPao (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 10:30:44 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:51101 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726259AbgCFPan (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Mar 2020 10:30:43 -0500
Received: from [IPv6:2001:983:e9a7:1:558f:c736:2117:17d1]
 ([IPv6:2001:983:e9a7:1:558f:c736:2117:17d1])
        by smtp-cloud9.xs4all.net with ESMTPA
        id AEvvjruhq9Im2AEvwjGMja; Fri, 06 Mar 2020 16:30:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583508640; bh=wcziDLLJe+bdH2b73SYFi9tSOTHHgbS5p/Zs6xNUXT8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vBoSzRmbMhdo1v9LsjkGTpURiLHkazTLHJvl2/H0r+olj8ODSYmrsShkKEp3yIcp7
         SPEeOYd2QCNJo6geBtAwVtL0v6CHSTMSW6ATrjP8BCzgbDeRbiJjgAUgB2Y1+mbgdM
         ABpXNfeZSHZgtFFfMexiMVdd7C7KXh5j7kJGmxnOXDSm0yZ3jATXS1i70k4spMG2d6
         3K5OGUYafcfSuml+V1oyeXSYmf1TqKdJtc1evNHrGvtf+8c9nOMiJTA3bOVlK1EZ7F
         6YoO0cn8/bYtm465q+/C2+l/NySv7572W1T9CbzYO32EIY8rvpANPMgr0nVbM/9Udd
         1mkNXNgBOhuxQ==
Subject: Re: [PATCHv4 05/11] videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT
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
References: <20200302041213.27662-1-senozhatsky@chromium.org>
 <20200302041213.27662-6-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <70144162-3bbe-4ea5-a3f7-e52d4585db53@xs4all.nl>
Date:   Fri, 6 Mar 2020 16:30:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302041213.27662-6-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJs9c1KOzp+xZaTQ8Y2JpXWod+JBH0mNKu5rBZcGt0vpqzx9zj/WTwtnztG+me6cWnBKdiQQnyAnWVCbXKB91Cg4fYPJ6i5aOUTCeR13ALk9OVAETfc0
 5DR0BU7pFbPCMcKa7E1tl4uEVhi3aiIDJuP9Fy65m726BSW80azjH7QrvLOhWO8GL/X8+uIrY6/wSy3sBQSSCONCz4L3m2ORKpi0qcH2YayCfTAxzJEGjrcE
 w51t/PvFSnja5t5ATbncaAQjSTGcw5kK971Dhldpvx/jclFyvVxA+/Sk0vZ1Vb07hCjTi335pKiHt8uKMcgwYibNGa1ewgOgJAT9YLJQpl+oUx7ZyrUBvql/
 Bk6i1BlgATUID5JosOs24MwNTWm2tf6iuUlu1OW1usHM/ko/clAV3l8vK1fMD0QIpd2soTaozjFNCJKHBcU8sqvgyPXxGZwxbztJNWQGmWtJTGAjp6JAn5jt
 JuYM1cPFRKEgzx2mcEH7KQKxKX1/uFd9b84zovmu2Mg2tacZspm2e6nnX3uFQbrIMw46r2tcqgVegCc36XsXgDuwFrbrp2KzYcdXNpJcS0HpfztLSb1S8b9W
 Fw5vj2VOQlOG2hs96bmggDd64VroeW30MVIs6sfarVOvZQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/03/2020 05:12, Sergey Senozhatsky wrote:
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
>  .../media/uapi/v4l/vidioc-create-bufs.rst     |  7 ++++-
>  .../media/uapi/v4l/vidioc-reqbufs.rst         | 11 +++++--
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 31 +++++++++++++++++--
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  5 +--
>  include/uapi/linux/videodev2.h                |  8 +++--
>  5 files changed, 50 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/media/uapi/v4l/vidioc-create-bufs.rst b/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
> index bd08e4f77ae4..a9c6c89f5098 100644
> --- a/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
> @@ -121,7 +121,12 @@ than the number requested.
>  	other changes, then set ``count`` to 0, ``memory`` to
>  	``V4L2_MEMORY_MMAP`` and ``format.type`` to the buffer type.
>      * - __u32
> -      - ``reserved``\ [7]
> +      - ``flags``
> +      - Specifies additional buffer management attributes.
> +	See :ref:`memory-flags`.
> +
> +    * - __u32
> +      - ``reserved``\ [6]
>        - A place holder for future extensions. Drivers and applications
>  	must set the array to zero.
>  
> diff --git a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> index 21ecacc72487..faf0df4f9bb6 100644
> --- a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> @@ -112,10 +112,17 @@ aborting or finishing any DMA in progress, an implicit
>  	``V4L2_MEMORY_MMAP`` and ``type`` set to the buffer type. This will
>  	free any previously allocated buffers, so this is typically something
>  	that will be done at the start of the application.
> +    * - union {
> +      - (anonymous)
> +    * - __u32
> +      - ``flags``
> +      - Specifies additional buffer management attributes.
> +	See :ref:`memory-flags`.
>      * - __u32
>        - ``reserved``\ [1]
> -      - A place holder for future extensions. Drivers and applications
> -	must set the array to zero.
> +      - Kept for backwards compatibility. Use ``flags`` instead.
> +    * - }
> +      -
>  
>  .. tabularcolumns:: |p{6.1cm}|p{2.2cm}|p{8.7cm}|
>  
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 6111d74f68c9..b4b379f3bf98 100644
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

The new flags argument needs to be documented in the command for struct v4l2_create_buffers.

Regards,

	Hans

> +	__u32			reserved[6];
>  };
>  
>  /*
> 

