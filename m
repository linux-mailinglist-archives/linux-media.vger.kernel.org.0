Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E56320AC94
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 08:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728565AbgFZG4c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 02:56:32 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45150 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726311AbgFZG4b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 02:56:31 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id A0F562A5799
Subject: Re: media/master bisection:
 v4l2-compliance-uvc.Buffer-ioctls-Input-0.VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF
 on rk3399-gru-kevin
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
References: <5ef522e0.1c69fb81.4605d.65f8@mx.google.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-kernel@vger.kernel.org, Pawel Osciak <pawel@osciak.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vandana BN <bnvandana@gmail.com>, kernel@collabora.com
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <06ca9f11-5bd7-27d4-9de4-e7e5efa24842@collabora.com>
Date:   Fri, 26 Jun 2020 07:56:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <5ef522e0.1c69fb81.4605d.65f8@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Please see the bisection report below about a regression in
v4l2-compliance with uvcvideo:

[   25.495039] uvcvideo: Failed to query (SET_CUR) UVC control 10 on unit 2: -32 (exp. 2).
		fail: v4l2-test-buffers.cpp(680): check_0(reqbufs.reserved, sizeof(reqbufs.reserved))
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: FAIL


as seen in the full job log:

    https://storage.kernelci.org/media/master/v5.8-rc1-64-ge30cc79cc80f/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk3399-gru-kevin.html#L1713

with a few more details about the regression here:

    https://kernelci.org/test/case/id/5ef23169140826f73d97bf51/

and the same test case failure also seen with vivid:

    https://kernelci.org/test/case/id/5ef23699f641f7b3e597bf3f/


The bisection actually ran a couple of days ago but there was an
email error when sending the report, so I'm sending it by hand
now.  I hope the issue hasn't spread too widely already, I know
it's also affecting linux-next.

Guillaume


On 25/06/2020 23:19, kernelci.org bot wrote:
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> *                                                               *
> * If you do send a fix, please include this trailer:            *
> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> *                                                               *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> 
> media/master bisection: v4l2-compliance-uvc.Buffer-ioctls-Input-0.VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF on rk3399-gru-kevin
> 
> Summary:
>   Start:      e30cc79cc80f media: media-request: Fix crash if memory allocation fails
>   Plain log:  https://storage.kernelci.org/media/master/v5.8-rc1-64-ge30cc79cc80f/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk3399-gru-kevin.txt
>   HTML log:   https://storage.kernelci.org/media/master/v5.8-rc1-64-ge30cc79cc80f/arm64/defconfig/gcc-8/lab-collabora/v4l2-compliance-uvc-rk3399-gru-kevin.html
>   Result:     1e0b2318fa75 media: videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT flag
> 
> Checks:
>   revert:     PASS
>   verify:     PASS
> 
> Parameters:
>   Tree:       media
>   URL:        https://git.linuxtv.org/media_tree.git
>   Branch:     master
>   Target:     rk3399-gru-kevin
>   CPU arch:   arm64
>   Lab:        lab-collabora
>   Compiler:   gcc-8
>   Config:     defconfig
>   Test case:  v4l2-compliance-uvc.Buffer-ioctls-Input-0.VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF
> 
> Breaking commit found:
> 
> -------------------------------------------------------------------------------
> commit 1e0b2318fa75d186ee0d2be31843ce867385fcc4
> Author: Sergey Senozhatsky <senozhatsky@chromium.org>
> Date:   Thu May 14 18:01:45 2020 +0200
> 
>     media: videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT flag
>     
>     This patch lets user-space to request a non-consistent memory
>     allocation during CREATE_BUFS and REQBUFS ioctl calls.
>     
>     = CREATE_BUFS
>     
>       struct v4l2_create_buffers has seven 4-byte reserved areas,
>       so reserved[0] is renamed to ->flags. The struct, thus, now
>       has six reserved 4-byte regions.
>     
>     = CREATE_BUFS32
>     
>       struct v4l2_create_buffers32 has seven 4-byte reserved areas,
>       so reserved[0] is renamed to ->flags. The struct, thus, now
>       has six reserved 4-byte regions.
>     
>     = REQBUFS
>     
>      We use one bit of a ->reserved[1] member of struct v4l2_requestbuffers,
>      which is now renamed to ->flags. Unlike v4l2_create_buffers, struct
>      v4l2_requestbuffers does not have enough reserved room. Therefore for
>      backward compatibility  ->reserved and ->flags were put into anonymous
>      union.
>     
>     Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
>     Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>     Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
> index e1afc5b504c2..f2a702870fad 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
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
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> index 96a59793d857..75d894d9c36c 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
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
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 0fdcf90330df..626c4db5134c 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -694,6 +694,9 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>  	unsigned int i;
>  	int ret;
>  
> +	if (flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
> +		consistent_mem = false;
> +
>  	if (q->streaming) {
>  		dprintk(1, "streaming active\n");
>  		return -EBUSY;
> @@ -837,6 +840,9 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>  	bool consistent_mem = true;
>  	int ret;
>  
> +	if (flags & V4L2_FLAG_MEMORY_NON_CONSISTENT)
> +		consistent_mem = false;
> +
>  	if (q->num_buffers == VB2_MAX_FRAME) {
>  		dprintk(1, "maximum number of buffers already allocated\n");
>  		return -ENOBUFS;
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 26a3ec333bb7..559a229cac41 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -718,12 +718,22 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
>  #endif
>  }
>  
> +static void clear_consistency_attr(struct vb2_queue *q,
> +				   int memory,
> +				   unsigned int *flags)
> +{
> +	if (!q->allow_cache_hints || memory != V4L2_MEMORY_MMAP)
> +		*flags &= ~V4L2_FLAG_MEMORY_NON_CONSISTENT;
> +}
> +
>  int vb2_reqbufs(struct vb2_queue *q, struct v4l2_requestbuffers *req)
>  {
>  	int ret = vb2_verify_memory_type(q, req->memory, req->type);
>  
>  	fill_buf_caps(q, &req->capabilities);
> -	return ret ? ret : vb2_core_reqbufs(q, req->memory, 0, &req->count);
> +	clear_consistency_attr(q, req->memory, &req->flags);
> +	return ret ? ret : vb2_core_reqbufs(q, req->memory,
> +					    req->flags, &req->count);
>  }
>  EXPORT_SYMBOL_GPL(vb2_reqbufs);
>  
> @@ -755,6 +765,7 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  	unsigned i;
>  
>  	fill_buf_caps(q, &create->capabilities);
> +	clear_consistency_attr(q, create->memory, &create->flags);
>  	create->index = q->num_buffers;
>  	if (create->count == 0)
>  		return ret != -EBUSY ? ret : 0;
> @@ -797,8 +808,11 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>  	for (i = 0; i < requested_planes; i++)
>  		if (requested_sizes[i] == 0)
>  			return -EINVAL;
> -	return ret ? ret : vb2_core_create_bufs(q, create->memory, 0,
> -		&create->count, requested_planes, requested_sizes);
> +	return ret ? ret : vb2_core_create_bufs(q, create->memory,
> +						create->flags,
> +						&create->count,
> +						requested_planes,
> +						requested_sizes);
>  }
>  EXPORT_SYMBOL_GPL(vb2_create_bufs);
>  
> @@ -969,11 +983,12 @@ int vb2_ioctl_reqbufs(struct file *file, void *priv,
>  	int res = vb2_verify_memory_type(vdev->queue, p->memory, p->type);
>  
>  	fill_buf_caps(vdev->queue, &p->capabilities);
> +	clear_consistency_attr(vdev->queue, p->memory, &p->flags);
>  	if (res)
>  		return res;
>  	if (vb2_queue_is_busy(vdev, file))
>  		return -EBUSY;
> -	res = vb2_core_reqbufs(vdev->queue, p->memory, 0, &p->count);
> +	res = vb2_core_reqbufs(vdev->queue, p->memory, p->flags, &p->count);
>  	/* If count == 0, then the owner has released all buffers and he
>  	   is no longer owner of the queue. Otherwise we have a new owner. */
>  	if (res == 0)
> @@ -991,6 +1006,7 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
>  
>  	p->index = vdev->queue->num_buffers;
>  	fill_buf_caps(vdev->queue, &p->capabilities);
> +	clear_consistency_attr(vdev->queue, p->memory, &p->flags);
>  	/*
>  	 * If count == 0, then just check if memory and type are valid.
>  	 * Any -EBUSY result from vb2_verify_memory_type can be mapped to 0.
> diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> index a99e82ec9ab6..593bcf6c3735 100644
> --- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> +++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> @@ -246,6 +246,9 @@ struct v4l2_format32 {
>   * @memory:	buffer memory type
>   * @format:	frame format, for which buffers are requested
>   * @capabilities: capabilities of this buffer type.
> + * @flags:	additional buffer management attributes (ignored unless the
> + *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability and
> + *		configured for MMAP streaming I/O).
>   * @reserved:	future extensions
>   */
>  struct v4l2_create_buffers32 {
> @@ -254,7 +257,8 @@ struct v4l2_create_buffers32 {
>  	__u32			memory;	/* enum v4l2_memory */
>  	struct v4l2_format32	format;
>  	__u32			capabilities;
> -	__u32			reserved[7];
> +	__u32			flags;
> +	__u32			reserved[6];
>  };
>  
>  static int __bufsize_v4l2_format(struct v4l2_format32 __user *p32, u32 *size)
> @@ -355,7 +359,8 @@ static int get_v4l2_create32(struct v4l2_create_buffers __user *p64,
>  {
>  	if (!access_ok(p32, sizeof(*p32)) ||
>  	    copy_in_user(p64, p32,
> -			 offsetof(struct v4l2_create_buffers32, format)))
> +			 offsetof(struct v4l2_create_buffers32, format)) ||
> +	    assign_in_user(&p64->flags, &p32->flags))
>  		return -EFAULT;
>  	return __get_v4l2_format32(&p64->format, &p32->format,
>  				   aux_buf, aux_space);
> @@ -417,6 +422,7 @@ static int put_v4l2_create32(struct v4l2_create_buffers __user *p64,
>  	    copy_in_user(p32, p64,
>  			 offsetof(struct v4l2_create_buffers32, format)) ||
>  	    assign_in_user(&p32->capabilities, &p64->capabilities) ||
> +	    assign_in_user(&p32->flags, &p64->flags) ||
>  	    copy_in_user(p32->reserved, p64->reserved, sizeof(p64->reserved)))
>  		return -EFAULT;
>  	return __put_v4l2_format32(&p64->format, &p32->format);
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 2322f08a98be..02bfef0da76d 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -2038,9 +2038,6 @@ static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
>  
>  	if (ret)
>  		return ret;
> -
> -	CLEAR_AFTER_FIELD(p, capabilities);
> -
>  	return ops->vidioc_reqbufs(file, fh, p);
>  }
>  
> @@ -2080,7 +2077,7 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
>  	if (ret)
>  		return ret;
>  
> -	CLEAR_AFTER_FIELD(create, capabilities);
> +	CLEAR_AFTER_FIELD(create, flags);
>  
>  	v4l_sanitize_format(&create->format);
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 34ba1017b89b..fec2607a07e3 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -946,7 +946,10 @@ struct v4l2_requestbuffers {
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
> @@ -2450,6 +2453,9 @@ struct v4l2_dbg_chip_info {
>   * @memory:	enum v4l2_memory; buffer memory type
>   * @format:	frame format, for which buffers are requested
>   * @capabilities: capabilities of this buffer type.
> + * @flags:	additional buffer management attributes (ignored unless the
> + *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability
> + *		and configured for MMAP streaming I/O).
>   * @reserved:	future extensions
>   */
>  struct v4l2_create_buffers {
> @@ -2458,7 +2464,8 @@ struct v4l2_create_buffers {
>  	__u32			memory;
>  	struct v4l2_format	format;
>  	__u32			capabilities;
> -	__u32			reserved[7];
> +	__u32			flags;
> +	__u32			reserved[6];
>  };
>  
>  /*
> -------------------------------------------------------------------------------
> 
> 
> Git bisection log:
> 
> -------------------------------------------------------------------------------
> git bisect start
> # good: [2630e1bb0948c3134c6f22ad275ae27cc6023532] media: rkvdec: Fix H264 scaling list order
> git bisect good 2630e1bb0948c3134c6f22ad275ae27cc6023532
> # bad: [e30cc79cc80fd919b697a15c5000d9f57487de8e] media: media-request: Fix crash if memory allocation fails
> git bisect bad e30cc79cc80fd919b697a15c5000d9f57487de8e
> # good: [cb8e59cc87201af93dfbb6c3dccc8fcad72a09c2] Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
> git bisect good cb8e59cc87201af93dfbb6c3dccc8fcad72a09c2
> # good: [3b69e8b4571125bec1f77f886174fe6cab6b9d75] Merge tag 'sh-for-5.8' of git://git.libc.org/linux-sh
> git bisect good 3b69e8b4571125bec1f77f886174fe6cab6b9d75
> # good: [3ed740841bf94a8028ec44164d84f9af9bd552fd] maccess: remove duplicate kerneldoc comments
> git bisect good 3ed740841bf94a8028ec44164d84f9af9bd552fd
> # good: [2ab70319bc1f79228da4dce7b9d604740c9beeef] nmi, tracing: Make hardware latency tracing noinstr safe
> git bisect good 2ab70319bc1f79228da4dce7b9d604740c9beeef
> # good: [df2fbf5bfa0e7fff8b4784507e4d68f200454318] Merge tag 'thermal-v5.8-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux
> git bisect good df2fbf5bfa0e7fff8b4784507e4d68f200454318
> # good: [91fa58840ae22cbf6d7c505ce6564c4c48f29af3] Merge branch 'i2c/for-5.8' of git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux
> git bisect good 91fa58840ae22cbf6d7c505ce6564c4c48f29af3
> # good: [bc139119a1708ae3db1ebb379630f286e28d06e8] net: ethernet: ti: ale: fix allmulti for nu type ale
> git bisect good bc139119a1708ae3db1ebb379630f286e28d06e8
> # good: [157282a5c6273976b31cf4ba4b1c46663f6519d1] media: s5k6a3: Fix runtime PM imbalance on error
> git bisect good 157282a5c6273976b31cf4ba4b1c46663f6519d1
> # bad: [286cf7d3a99e1ca8c1d8e674b9a98f2dbe8520dc] media: videodev2.h: add V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL flag
> git bisect bad 286cf7d3a99e1ca8c1d8e674b9a98f2dbe8520dc
> # good: [ac53503ee38a1ffbc47c7cca6cbfc48ba9c65c5e] media: videobuf2: add V4L2_FLAG_MEMORY_NON_CONSISTENT flag
> git bisect good ac53503ee38a1ffbc47c7cca6cbfc48ba9c65c5e
> # bad: [d4db5eb57cab049d378fbfb7ee842857009a8679] media: videobuf2: add begin/end cpu_access callbacks to dma-sg
> git bisect bad d4db5eb57cab049d378fbfb7ee842857009a8679
> # bad: [38a417e88aad1e5ad5ff2647d4cd26040b567fc3] media: videobuf2: factor out planes prepare/finish functions
> git bisect bad 38a417e88aad1e5ad5ff2647d4cd26040b567fc3
> # bad: [1e0b2318fa75d186ee0d2be31843ce867385fcc4] media: videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT flag
> git bisect bad 1e0b2318fa75d186ee0d2be31843ce867385fcc4
> # good: [7b4b45555c79db03dad8192e6ef85cb30236827b] media: videobuf2: add queue memory consistency parameter
> git bisect good 7b4b45555c79db03dad8192e6ef85cb30236827b
> # first bad commit: [1e0b2318fa75d186ee0d2be31843ce867385fcc4] media: videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT flag
> -------------------------------------------------------------------------------
> 

