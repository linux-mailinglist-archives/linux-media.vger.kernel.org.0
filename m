Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2840399FD1
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 13:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbhFCLeF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 07:34:05 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:60981 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229840AbhFCLeE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Jun 2021 07:34:04 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id olaBlbcbeIpGyolaElRUzM; Thu, 03 Jun 2021 13:32:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622719939; bh=s/n4XZkFI7WSBBH1NYyBrLenGm+eU3WaF27m4naf8mk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=VL85cHx+wWCjYQ4IIPEhq6+zI6EbtlGyv+hWYvc6dfnjvLH8wO5VFD9HHxoMAgBs+
         hoIUejWkjGSfKlJpKh6VWVQESCWJLkRTGrnz9CV/XvcDqk06XNqJ6kF4F9KS4zGYzn
         Y72DZPnmicZoFnkmMftKfKvd7z6EXwyuSs/DN4gcx7p1GHu909iZRb4TPJN1FH0Olv
         c2LK5jhTXsFkwgiWmUa4OIN9X0DByqpUXgzshNSVxGtE9C5zGXdjG7ImSw3Z8Qz84s
         vFQlw+p8l3o39Lf0Q0UtZa0R1x49SAKgHHY+ldHM88K3OLqX/wsPJCCZkjy4LM3iC0
         RbkCwOW8Dsxtw==
Subject: Re: [PATCHv2 7/8] videobuf2: handle V4L2_MEMORY_FLAG_NON_COHERENT
 flag
To:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210427131344.139443-1-senozhatsky@chromium.org>
 <20210427131344.139443-8-senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <93d99f68-7363-6ba3-2634-f052a95e5fe0@xs4all.nl>
Date:   Thu, 3 Jun 2021 13:32:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427131344.139443-8-senozhatsky@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJRMIYM5c4jLClR1pDf/MBvJL6h+Npu3OQAvuFBXcA2ZCOMPh0EjQkCaWY1Bk3K5Jt96sQj2G5kNfnxc+CSM++Ibwa991l66ydvF5gIU7gFbS4dCdFwu
 C/ADXLKt5S4YaY6SN2kGKJO2icNXzGZSZziH+8EG9dxNcuqLmwXFL7qxNqjSUj2xyeXSRO5vYmvjVCpdURIHt1xyNh6YCRDlQCoe+qJUPTijw4O3/Aoj1+5G
 V2iIwM6YJj2h5SL+U+NJJCCIt7ZRxU3LW8hvdtsMMo5gkyFWyGl6PWOKDJLo9azsw74D/WuK8JeRS0Qnzpqqs/ZbPuEuUJbUwQ5qpSGDG2sjZvsaV3QBrYcZ
 wPRWhMWeZmIpsjqjxG/UEliIT+txTRLMONi04XHbT4oaxz/9Vzg=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sergey,

Some comments below:

On 27/04/2021 15:13, Sergey Senozhatsky wrote:
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
>  We use one byte of a 4 byte ->reserved[1] member of struct
>  v4l2_requestbuffers. The struct, thus, now has reserved 3 bytes.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  .../media/v4l/vidioc-create-bufs.rst          |  7 ++++-
>  .../media/v4l/vidioc-reqbufs.rst              | 12 +++++---
>  .../media/common/videobuf2/videobuf2-core.c   |  4 +--
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 28 +++++++++++++++++--
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  9 +++++-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  5 +---
>  include/uapi/linux/videodev2.h                |  9 ++++--
>  7 files changed, 57 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
> index f98f18c9e91c..a048a9f6b7b6 100644
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
> index e59306aba2b0..5a047c0ec3e8 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> @@ -104,10 +104,14 @@ aborting or finishing any DMA in progress, an implicit
>  	``V4L2_MEMORY_MMAP`` and ``type`` set to the buffer type. This will
>  	free any previously allocated buffers, so this is typically something
>  	that will be done at the start of the application.
> -    * - __u32
> -      - ``reserved``\ [1]
> -      - A place holder for future extensions. Drivers and applications
> -	must set the array to zero.
> +    * - __u8
> +      - ``flags``
> +      - Specifies additional buffer management attributes.
> +	See :ref:`memory-flags`.
> +    * - __u8
> +      - ``reserved``\ [3]
> +      - Reserved for future extensions.
> +      -
>  
>  .. _v4l2-buf-capabilities:
>  .. _V4L2-BUF-CAP-SUPPORTS-MMAP:
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index af4db310cf5e..38505783247e 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -762,7 +762,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  {
>  	unsigned int num_buffers, allocated_buffers, num_planes = 0;
>  	unsigned plane_sizes[VB2_MAX_PLANES] = { };
> -	bool coherent_mem = true;
> +	bool coherent_mem = !(flags & V4L2_MEMORY_FLAG_NON_COHERENT);
>  	unsigned int i;
>  	int ret;
>  
> @@ -906,7 +906,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  {
>  	unsigned int num_planes = 0, num_buffers, allocated_buffers;
>  	unsigned plane_sizes[VB2_MAX_PLANES] = { };
> -	bool coherent_mem = true;
> +	bool coherent_mem = !(flags & V4L2_MEMORY_FLAG_NON_COHERENT);
>  	int ret;
>  
>  	if (q->num_buffers == VB2_MAX_FRAME) {
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 1166d5a9291a..8d344335552e 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -692,12 +692,29 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
>  #endif
>  }
>  
> +static void validate_memory_flags(struct vb2_queue *q,
> +				  int memory,
> +				  u32 *flags)
> +{
> +	if (!q->allow_cache_hints || memory != V4L2_MEMORY_MMAP) {
> +		/*
> +		 * This needs to clear V4L2_MEMORY_FLAG_NON_COHERENT only,
> +		 * but in order to avoid bugs we zero out all bits.
> +		 */
> +		*flags = 0;

Wouldn't it make sense to add:

	} else {
		*flags &= ~V4L2_MEMORY_FLAG_NON_COHERENT;

I.e., clear all unknown flags.

> +	}
> +}
> +
>  int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
>  {
>  	int ret = vb2_verify_memory_type(q, req->memory, req->type);
> +	u32 flags = req->flags;
>  
>  	fill_buf_caps(q, &req->capabilities);
> -	return ret ? ret : vb2_core_reqbufs(q, req->memory, 0, &req->count);
> +	validate_memory_flags(q, req->memory, &flags);
> +	req->flags = flags;
> +	return ret ? ret : vb2_core_reqbufs(q, req->memory,
> +					    req->flags, &req->count);
>  }
>  EXPORT_SYMBOL_GPL(vb2_reqbufs);
>  
> @@ -729,6 +746,7 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  	unsigned i;
>  
>  	fill_buf_caps(q, &create->capabilities);
> +	validate_memory_flags(q, create->memory, &create->flags);
>  	create->index = q->num_buffers;
>  	if (create->count == 0)
>  		return ret != -EBUSY ? ret : 0;
> @@ -772,7 +790,7 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  		if (requested_sizes[i] == 0)
>  			return -EINVAL;
>  	return ret ? ret : vb2_core_create_bufs(q, create->memory,
> -						0,
> +						create->flags,
>  						&create->count,
>  						requested_planes,
>  						requested_sizes);
> @@ -955,13 +973,16 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
>  {
>  	struct video_device *vdev = video_devdata(file);
>  	int res = vb2_verify_memory_type(vdev->queue, p->memory, p->type);
> +	u32 flags = p->flags;
>  
>  	fill_buf_caps(vdev->queue, &p->capabilities);
> +	validate_memory_flags(vdev->queue, p->memory, &flags);
> +	p->flags = flags;
>  	if (res)
>  		return res;
>  	if (vb2_queue_is_busy(vdev, file))
>  		return -EBUSY;
> -	res = vb2_core_reqbufs(vdev->queue, p->memory, 0, &p->count);
> +	res = vb2_core_reqbufs(vdev->queue, p->memory, p->flags, &p->count);
>  	/* If count == 0, then the owner has released all buffers and he
>  	   is no longer owner of the queue. Otherwise we have a new owner. */
>  	if (res == 0)
> @@ -979,6 +1000,7 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
>  
>  	p->index = vdev->queue->num_buffers;
>  	fill_buf_caps(vdev->queue, &p->capabilities);
> +	validate_memory_flags(vdev->queue, p->memory, &p->flags);
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
> index 2673f51aafa4..b1430a741936 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -2003,9 +2003,6 @@ static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
>  
>  	if (ret)
>  		return ret;
> -
> -	CLEAR_AFTER_FIELD(p, capabilities);

Shouldn't this be:

	CLEAR_AFTER_FIELD(p, flags);

You still need to zero the reserved array, after all.

> -
>  	return ops->vidioc_reqbufs(file, fh, p);
>  }
>  
> @@ -2045,7 +2042,7 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
>  	if (ret)
>  		return ret;
>  
> -	CLEAR_AFTER_FIELD(create, capabilities);
> +	CLEAR_AFTER_FIELD(create, flags);
>  
>  	v4l_sanitize_format(&create->format);
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 15f9c9df35d5..d62a6e4f83a0 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -953,7 +953,8 @@ struct v4l2_requestbuffers {
>  	__u32			type;		/* enum v4l2_buf_type */
>  	__u32			memory;		/* enum v4l2_memory */
>  	__u32			capabilities;
> -	__u32			reserved[1];
> +	__u8			flags;
> +	__u8			reserved[3];
>  };
>  
>  #define V4L2_MEMORY_FLAG_NON_COHERENT			(1 << 0)
> @@ -2494,6 +2495,9 @@ struct v4l2_dbg_chip_info {
>   * @memory:	enum v4l2_memory; buffer memory type
>   * @format:	frame format, for which buffers are requested
>   * @capabilities: capabilities of this buffer type.
> + * @flags:	additional buffer management attributes (ignored unless the
> + *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability
> + *		and configured for MMAP streaming I/O).
>   * @reserved:	future extensions
>   */
>  struct v4l2_create_buffers {
> @@ -2502,7 +2506,8 @@ struct v4l2_create_buffers {
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
