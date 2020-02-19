Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B03CF163EF6
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 09:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgBSIZv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 03:25:51 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:58815 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726001AbgBSIZv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 03:25:51 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 4KfyjzHYHP9a94Kg1jnNij; Wed, 19 Feb 2020 09:25:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582100749; bh=/c1QXxEYnRBPsS+izndtMYgZI2LPDYrD3Wa2RZiKb3Q=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=iHyRfksT7lcXPpZxN91xo+8jWMhVlZ7QqDV4VfXrLAqIINLGI/rensbiycW8UotjU
         kDspfGyi/1wv5LHvkRDEowzF9+SDQWFk8djoj0TJYr3kHn3FIvHZAhapqK/qfw9g+R
         YpjCSXBNk4TFd0LDWKTa4UEtGnSFzxvB+qdoIJ3i/A2KUN4G8yxBOAO0+Jpv+lmm/E
         tRoU18P9r3ZhftoW/rQV7TY11gHZtGCRvfEQJ3vcFKWhd4XkG4ZtNVDnSvFJ6RVcrh
         0M9ejgQFiU5XapAOrGXO9+I28JFkwE5lWh1n/FgbWnwC7O5okVd4Tcqs7oC2zwCYLE
         jqifoiT6DVEXA==
Subject: Re: [RFC][PATCHv2 05/12] videobuf2: handle
 V4L2_FLAG_MEMORY_NON_CONSISTENT flag
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
References: <20200204025641.218376-1-senozhatsky@chromium.org>
 <20200204025641.218376-6-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7f3310f9-8a12-1299-726d-2ca04207b32c@xs4all.nl>
Date:   Wed, 19 Feb 2020 09:25:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200204025641.218376-6-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFkgmd2ZLch1PTULJ9rwDf8sF8dy8gLP0QR9oPRBr+oJvll7Snk8540ylkm4OLqYeEbRU3ZLOZetT/8V0oAqwG49NmctUc6gYvJKFUX3LdXlmY8w1JQN
 sEjmU7TX9j1P+6Qfnet02N4oeZj9S555XXPbSSxD4lAPkLLNokKWWqzgB/jXjsZRl1Eb8tnE/LgQBcyeY5MRSJKBSY8s8SERRp1pYOecWzN+QUhAKKsnvgEK
 UBzKjFsX9gh2HBQ+pNyk7j9GjUno4Xcy8cryXOYJEn5QF7Vs49gWZkEaYJmye0HpHZ8NC3pZ7gtj7SVrQ+ateO1Wm0jnaHHcGq/xezn4ri/qz6UsdxiHk/fn
 brQ0Wg25YpmZjcIzq31ue6M7prhsJsGuSOh+2jU7QHe+WBNb2El30ficCsyMbXx8Yg8ivnRENj7P+4rkenud1tSNMSkXmPB8SMcXO2vLVn4knQ9fKEiDKBnd
 MNSHqG2XfVZZk6EWibcUc3VYobMJ+HtENpLeVBNijzMUvY92NIo8iNAkNIfGC6lHYCx/yg0egqSLLnAu
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/4/20 3:56 AM, Sergey Senozhatsky wrote:
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
> Change-Id: I0eaab3428de499ce1bce6fc6b26c5ca5ff405882
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  .../media/uapi/v4l/vidioc-create-bufs.rst     |  9 +++++++-
>  .../media/uapi/v4l/vidioc-reqbufs.rst         | 15 ++++++++++---
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 21 ++++++++++++++++---
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  5 +----
>  include/uapi/linux/videodev2.h                |  8 +++++--
>  5 files changed, 45 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/media/uapi/v4l/vidioc-create-bufs.rst b/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
> index bd08e4f77ae4..68185e94b686 100644
> --- a/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-create-bufs.rst
> @@ -121,7 +121,14 @@ than the number requested.
>  	other changes, then set ``count`` to 0, ``memory`` to
>  	``V4L2_MEMORY_MMAP`` and ``format.type`` to the buffer type.
>      * - __u32
> -      - ``reserved``\ [7]
> +      - ``flags``
> +      - Specifies additional buffer management attributes. Valid only when
> +	queue reports :ref:`V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS` capability.
> +	Old drivers and applications must set it to zero.

Drop the 'Valid only' sentence. The V4L2_FLAG_MEMORY_NON_CONSISTENT depends
on that capability, but other flags added in the future may not.

Inside add a reference to the memory flags section created in patch 3.

> +
> +
> +    * - __u32
> +      - ``reserved``\ [6]
>        - A place holder for future extensions. Drivers and applications
>  	must set the array to zero.
>  
> diff --git a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> index d0c643db477a..9741dac0d5b3 100644
> --- a/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> +++ b/Documentation/media/uapi/v4l/vidioc-reqbufs.rst
> @@ -112,10 +112,19 @@ aborting or finishing any DMA in progress, an implicit
>  	``V4L2_MEMORY_MMAP`` and ``type`` set to the buffer type. This will
>  	free any previously allocated buffers, so this is typically something
>  	that will be done at the start of the application.
> -    * - __u32
> +    * - union
> +      - (anonymous)
> +    * -
> +      - __u32
> +      - ``flags``\ [1]
> +      - Specifies additional buffer management attributes. Valid only when
> +	queue reports :ref:`V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS` capability.

Same comment as above.

> +	Old drivers and applications must set it to zero.
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
> index 7cdfcd1baf82..eb5d1306cb03 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -707,9 +707,15 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
>  int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
>  {
>  	int ret = vb2_verify_memory_type(q, req->memory, req->type);
> +	bool consistent = true;
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
> @@ -738,6 +744,7 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  	unsigned requested_sizes[VIDEO_MAX_PLANES];
>  	struct v4l2_format *f = &create->format;
>  	int ret = vb2_verify_memory_type(q, create->memory, f->type);
> +	bool consistent = true;
>  	unsigned i;
>  
>  	fill_buf_caps(q, &create->capabilities);
> @@ -783,7 +790,11 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  	for (i = 0; i < requested_planes; i++)
>  		if (requested_sizes[i] == 0)
>  			return -EINVAL;
> -	return ret ? ret : vb2_core_create_bufs(q, create->memory, true,
> +
> +	if (create->flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
> +		consistent = false;
> +
> +	return ret ? ret : vb2_core_create_bufs(q, create->memory, consistent,
>  		&create->count, requested_planes, requested_sizes);
>  }
>  EXPORT_SYMBOL_GPL(vb2_create_bufs);
> @@ -953,13 +964,17 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
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
> +	if (p->flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
> +		consistent = false;
> +
> +	res = vb2_core_reqbufs(vdev->queue, p->memory, consistent, &p->count);
>  	/* If count == 0, then the owner has released all buffers and he
>  	   is no longer owner of the queue. Otherwise we have a new owner. */
>  	if (res == 0)
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index aaf83e254272..9791e2882382 100644
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
> index 72efc1c544cd..169a8cf345ed 100644
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

How about this:

	__u8			flags;
	__u8			reserved[3];

That avoids the anonymous union and allows some space for future additions.

Regards,

	Hans

>  };
>  
>  /* capabilities for struct v4l2_requestbuffers and v4l2_create_buffers */
> @@ -2445,7 +2448,8 @@ struct v4l2_create_buffers {
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

