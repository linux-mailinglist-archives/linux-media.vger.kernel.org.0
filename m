Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A57AC343A68
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 08:17:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbhCVHQo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 03:16:44 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:49775 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229696AbhCVHQZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 03:16:25 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id OEnUldMn1GEYcOEnXlWHBD; Mon, 22 Mar 2021 08:16:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616397383; bh=JmWljaZl3GQiVuGtVSvWtwrjIhLMCMIV383phGhqVGs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=bYbIdbs9zvV4FAvZ8ovX2RkGwkaYst2XSIzD8zs6L7WHkiPqN+tudrjDCmP8Y7wOI
         qp0JEyPYpDpwKBHMU9cuHzrHj6xnRkueNLYW5IBlXHO8RDxxwspf0ivg1MzjNAvbgx
         i/QrQH+FdSyScOEfowXwlt1gBlW3ylHSK1jx1or0JurpfMngKLQxV3pKbZsX7iBJt3
         an9U+MxRIprtxEkG6SRB7SEOOveo+fE2nA8kmDfSnpofH+wuHOh5R1sj0dnoebsN1b
         pvrK9qA/aFDYafk/0H5xWsW+IROvnwjoXe+pCQVKx+x0o/ECA4SU3IdLXj4F5nsz5O
         IJUjZ0tX65EiQ==
Subject: Re: [PATCH 7/8] videobuf2: handle V4L2_FLAG_MEMORY_NON_COHERENT flag
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210302004624.31294-1-senozhatsky@chromium.org>
 <20210302004624.31294-8-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <551a5306-026b-25a5-09e6-a6b3d20171a9@xs4all.nl>
Date:   Mon, 22 Mar 2021 08:16:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302004624.31294-8-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMFkKhFKCitvqrJR830cyzHmM3ylMz0JfHEOcZFm22L9pdbVnwEbFWvN5ETl92uW91pbvBYnFdk1oVRnjiOGHuYgMBWBjWsbe4pV5g+xgVpzFWG/6ED5
 cZNLodhyjdWy4OSxukALSY4h62zQlSj6Z/43eUbGlX04I4QSFFu4/RyqTChPV7+tgnComx1t86bwILI/8+PQciDqJ9b/t5zZarbYuOKGzyw0+ycKLQadHiwD
 cqPysfMB2X2fAzvbJZ0NsIh8mBionRUNigqjmQIrz5oDIxEzfpOmz0/klmsI5L776391kopOoqfUorcUlgP03I2WeHGK8ZbPkT/xs4g1dwOyNE0e5FuoLHjQ
 DRVmyUuJ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/03/2021 01:46, Sergey Senozhatsky wrote:
> This patch lets user-space to request a non-coherent memory
> allocation during CREATE_BUFS and REQBUFS ioctl calls.
> 
> = CREATE_BUFS
> 
>   struct v4l2_create_buffers has seven 4-byte reserved areas,
>   so reserved[0] is renamed to ->flags. The struct, thus, now
>   has six reserved 4-byte regions.
> 
> = CREATE_BUFS32
> 
>   struct v4l2_create_buffers32 has seven 4-byte reserved areas,
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
>  .../media/v4l/vidioc-create-bufs.rst          |  7 ++++++-
>  .../media/v4l/vidioc-reqbufs.rst              | 11 +++++++++--
>  .../media/common/videobuf2/videobuf2-core.c   |  6 ++++++
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 19 ++++++++++++++++---
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  9 ++++++++-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  5 +----
>  include/uapi/linux/videodev2.h                | 11 +++++++++--
>  7 files changed, 55 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
> index b06e5b528e11..132c8b612a94 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
> @@ -113,7 +113,12 @@ than the number requested.
>  	``V4L2_MEMORY_MMAP`` and ``format.type`` to the buffer type.
>  
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
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> index 950e7ec1aac5..80ea48acea84 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> @@ -104,10 +104,17 @@ aborting or finishing any DMA in progress, an implicit
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

I would do this differently. Replace the __u32 reserved[1] by:

	__u8 flags;
	__u8 reserved[3];

We only need a single bit for flags, so this way we still have a few reserved bytes
available.

>  
>  .. tabularcolumns:: |p{6.1cm}|p{2.2cm}|p{8.7cm}|
>  
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 7040b7f47133..5906a48e7757 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -768,6 +768,9 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	unsigned int i;
>  	int ret;
>  
> +	if (flags & V4L2_FLAG_MEMORY_NON_COHERENT)
> +		coherent_mem = false;
> +
>  	if (q->streaming) {
>  		dprintk(q, 1, "streaming active\n");
>  		return -EBUSY;
> @@ -911,6 +914,9 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  	bool coherent_mem = true;
>  	int ret;
>  
> +	if (flags & V4L2_FLAG_MEMORY_NON_COHERENT)
> +		coherent_mem = false;
> +
>  	if (q->num_buffers == VB2_MAX_FRAME) {
>  		dprintk(q, 1, "maximum number of buffers already allocated\n");
>  		return -ENOBUFS;
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 1166d5a9291a..f6a8dcc1b5c6 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -692,12 +692,22 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
>  #endif
>  }
>  
> +static void validate_coherency_flags(struct vb2_queue *q,

This should validate flags in general, not just the single coherency bit.
So rename to validate_memory_flags().

> +				     int memory,
> +				     unsigned int *flags)

Use u32 instead of unsigned int.

> +{
> +	if (!q->allow_cache_hints || memory != V4L2_MEMORY_MMAP)
> +		*flags &= ~V4L2_FLAG_MEMORY_NON_COHERENT;

This should clear all other bits as well. If new flags are added in the
future, you want to make sure this code will clear them since they are not
supported in this kernel version.

> +}
> +
>  int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
>  {
>  	int ret = vb2_verify_memory_type(q, req->memory, req->type);
>  
>  	fill_buf_caps(q, &req->capabilities);
> -	return ret ? ret : vb2_core_reqbufs(q, req->memory, 0, &req->count);
> +	validate_coherency_flags(q, req->memory, &req->flags);

Since in my proposal req->flags is a u8 you need to assign it to a u32 first,
then copy the result from validate_memory_flags back to req->flags.

> +	return ret ? ret : vb2_core_reqbufs(q, req->memory,
> +					    req->flags, &req->count);
>  }
>  EXPORT_SYMBOL_GPL(vb2_reqbufs);
>  
> @@ -729,6 +739,7 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  	unsigned i;
>  
>  	fill_buf_caps(q, &create->capabilities);
> +	validate_coherency_flags(q, create->memory, &create->flags);
>  	create->index = q->num_buffers;
>  	if (create->count == 0)
>  		return ret != -EBUSY ? ret : 0;
> @@ -772,7 +783,7 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  		if (requested_sizes[i] == 0)
>  			return -EINVAL;
>  	return ret ? ret : vb2_core_create_bufs(q, create->memory,
> -						0,
> +						create->flags,
>  						&create->count,
>  						requested_planes,
>  						requested_sizes);
> @@ -957,11 +968,12 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
>  	int res = vb2_verify_memory_type(vdev->queue, p->memory, p->type);
>  
>  	fill_buf_caps(vdev->queue, &p->capabilities);
> +	validate_coherency_flags(vdev->queue, p->memory, &p->flags);
>  	if (res)
>  		return res;
>  	if (vb2_queue_is_busy(vdev, file))
>  		return -EBUSY;
> -	res = vb2_core_reqbufs(vdev->queue, p->memory, 0, &p->count);
> +	res = vb2_core_reqbufs(vdev->queue, p->memory, p->flags, &p->count);
>  	/* If count == 0, then the owner has released all buffers and he
>  	   is no longer owner of the queue. Otherwise we have a new owner. */
>  	if (res == 0)
> @@ -979,6 +991,7 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
>  
>  	p->index = vdev->queue->num_buffers;
>  	fill_buf_caps(vdev->queue, &p->capabilities);
> +	validate_coherency_flags(vdev->queue, p->memory, &p->flags);
>  	/*
>  	 * If count == 0, then just check if memory and type are valid.
>  	 * Any -EBUSY result from vb2_verify_memory_type can be mapped to 0.
> diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> index 0ca75f6784c5..1aa9ca3b6ca4 100644
> --- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> +++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> @@ -126,6 +126,9 @@ struct v4l2_format32 {
>   * @memory:	buffer memory type
>   * @format:	frame format, for which buffers are requested
>   * @capabilities: capabilities of this buffer type.
> + * @flags:	additional buffer management attributes (ignored unless the
> + *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability and
> + *		configured for MMAP streaming I/O).
>   * @reserved:	future extensions
>   */
>  struct v4l2_create_buffers32 {
> @@ -134,7 +137,8 @@ struct v4l2_create_buffers32 {
>  	__u32			memory;	/* enum v4l2_memory */
>  	struct v4l2_format32	format;
>  	__u32			capabilities;
> -	__u32			reserved[7];
> +	__u32			flags;
> +	__u32			reserved[6];
>  };
>  
>  static int get_v4l2_format32(struct v4l2_format *p64,
> @@ -182,6 +186,8 @@ static int get_v4l2_create32(struct v4l2_create_buffers *p64,
>  	if (copy_from_user(p64, p32,
>  			   offsetof(struct v4l2_create_buffers32, format)))
>  		return -EFAULT;
> +	if (copy_from_user(&p64->flags, &p32->flags, sizeof(p32->flags)))
> +		return -EFAULT;
>  	return get_v4l2_format32(&p64->format, &p32->format);
>  }
>  
> @@ -227,6 +233,7 @@ static int put_v4l2_create32(struct v4l2_create_buffers *p64,
>  	if (copy_to_user(p32, p64,
>  			 offsetof(struct v4l2_create_buffers32, format)) ||
>  	    put_user(p64->capabilities, &p32->capabilities) ||
> +	    put_user(p64->flags, &p32->flags) ||
>  	    copy_to_user(p32->reserved, p64->reserved, sizeof(p64->reserved)))
>  		return -EFAULT;
>  	return put_v4l2_format32(&p64->format, &p32->format);
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 31d1342e61e8..f8d38a3cd1e0 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -2045,9 +2045,6 @@ static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
>  
>  	if (ret)
>  		return ret;
> -
> -	CLEAR_AFTER_FIELD(p, capabilities);
> -
>  	return ops->vidioc_reqbufs(file, fh, p);
>  }
>  
> @@ -2087,7 +2084,7 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
>  	if (ret)
>  		return ret;
>  
> -	CLEAR_AFTER_FIELD(create, capabilities);
> +	CLEAR_AFTER_FIELD(create, flags);
>  
>  	v4l_sanitize_format(&create->format);
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index b1d4171fe50b..85d2681e73b6 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -951,7 +951,10 @@ struct v4l2_requestbuffers {
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
>  #define V4L2_FLAG_MEMORY_NON_COHERENT			(1 << 0)
> @@ -2473,6 +2476,9 @@ struct v4l2_dbg_chip_info {
>   * @memory:	enum v4l2_memory; buffer memory type
>   * @format:	frame format, for which buffers are requested
>   * @capabilities: capabilities of this buffer type.
> + * @flags:	additional buffer management attributes (ignored unless the
> + *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability
> + *		and configured for MMAP streaming I/O).
>   * @reserved:	future extensions
>   */
>  struct v4l2_create_buffers {
> @@ -2481,7 +2487,8 @@ struct v4l2_create_buffers {
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
