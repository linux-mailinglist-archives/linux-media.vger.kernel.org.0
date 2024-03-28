Return-Path: <linux-media+bounces-7060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5881D87BC7E
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 13:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CA541C2205A
	for <lists+linux-media@lfdr.de>; Thu, 14 Mar 2024 12:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBF96F08A;
	Thu, 14 Mar 2024 12:06:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D674554677;
	Thu, 14 Mar 2024 12:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710418011; cv=none; b=TZ+Snk53datxu8d/a/u7PIAgExjIrOIMAdIoNxhdZONn1kQyTsnrvJgUgdueRVwSInj1ad1xEvxem8B0A/zKt4Af2OtIblDJuYUgVCY0uIEtvl46JSufjXiom7s2nqKxkk6qVWfuX334gDB5ITjtbUhLfJMOuxRBA6Zl8ir2EzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710418011; c=relaxed/simple;
	bh=m90Mqt8tRrC/qyuvitBmgbNvq/1kW/xbj/rHbPd9SAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qx5S9InrqWdBEtuTDLeAaJkguJ58X+4igjljCAFM/1sF6wPJtZfK7989/WhrG3MAhoFwjZA4EZNY1+U2LgGgDdoMMYDFF8zir+o12ZKjGOC2P04YcET4F8JaAZ7VnK0+yqfCbsVur9B5baDTb5MiWGXAYZPNheF4pZMsj2hkeZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED953C433F1;
	Thu, 14 Mar 2024 12:06:48 +0000 (UTC)
Message-ID: <ad99e2e6-fff1-43bf-8266-e636d557fd96@xs4all.nl>
Date: Thu, 14 Mar 2024 13:06:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 7/9] media: v4l2: Add REMOVE_BUFS ioctl
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ezequiel@vanguardiasur.com.ar,
 p.zabel@pengutronix.de, nicolas@ndufresne.ca
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20240221155435.100093-1-benjamin.gaignard@collabora.com>
 <20240221155435.100093-8-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240221155435.100093-8-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Benjamin,

While reviewing the v4l2-compliance code I realized that the type
handling needs to be improved. See my comments below:

On 21/02/2024 4:54 pm, Benjamin Gaignard wrote:
> VIDIOC_REMOVE_BUFS ioctl allows to remove buffers from a queue.
> The number of buffers to remove in given by count field of
> struct v4l2_remove_buffers and the range start at the index
> specified in the same structure.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> version 20:
> - Rename DELETE_BUFS into REMOVE_BUFS
> - Change documention, structure and variables name to use 'remove'
> 
>  .../userspace-api/media/v4l/user-func.rst     |  1 +
>  .../media/v4l/vidioc-remove-bufs.rst          | 82 +++++++++++++++++++
>  .../media/v4l/vidioc-reqbufs.rst              |  1 +
>  .../media/common/videobuf2/videobuf2-core.c   | 38 +++++++++
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 14 +++-
>  drivers/media/v4l2-core/v4l2-dev.c            |  3 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          | 32 ++++++++
>  include/media/v4l2-ioctl.h                    |  4 +
>  include/media/videobuf2-core.h                | 10 +++
>  include/media/videobuf2-v4l2.h                |  2 +
>  include/uapi/linux/videodev2.h                | 17 ++++
>  11 files changed, 203 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/vidioc-remove-bufs.rst
> 
> diff --git a/Documentation/userspace-api/media/v4l/user-func.rst b/Documentation/userspace-api/media/v4l/user-func.rst
> index 15ff0bf7bbe6..6f661138801c 100644
> --- a/Documentation/userspace-api/media/v4l/user-func.rst
> +++ b/Documentation/userspace-api/media/v4l/user-func.rst
> @@ -62,6 +62,7 @@ Function Reference
>      vidioc-query-dv-timings
>      vidioc-querystd
>      vidioc-reqbufs
> +    vidioc-remove-bufs
>      vidioc-s-hw-freq-seek
>      vidioc-streamon
>      vidioc-subdev-enum-frame-interval
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-remove-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-remove-bufs.rst
> new file mode 100644
> index 000000000000..0fbc0dfbbaa1
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/vidioc-remove-bufs.rst
> @@ -0,0 +1,82 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +.. c:namespace:: V4L
> +
> +.. _VIDIOC_REMOVE_BUFS:
> +
> +************************
> +ioctl VIDIOC_REMOVE_BUFS
> +************************
> +
> +Name
> +====
> +
> +VIDIOC_REMOVE_BUFS - Removes buffers from a queue
> +
> +Synopsis
> +========
> +
> +.. c:macro:: VIDIOC_REMOVE_BUFS
> +
> +``int ioctl(int fd, VIDIOC_REMOVE_BUFS, struct v4l2_remove_buffers *argp)``
> +
> +Arguments
> +=========
> +
> +``fd``
> +    File descriptor returned by :c:func:`open()`.
> +
> +``argp``
> +    Pointer to struct :c:type:`v4l2_remove_buffers`.
> +
> +Description
> +===========
> +
> +Applications can optionally call the :ref:`VIDIOC_REMOVE_BUFS` ioctl to
> +remove buffers from a queue.
> +:ref:`VIDIOC_CREATE_BUFS` ioctl support is mandatory to enable :ref:`VIDIOC_REMOVE_BUFS`.
> +This ioctl is available if the ``V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS`` capability
> +is set on the queue when :c:func:`VIDIOC_REQBUFS` or :c:func:`VIDIOC_CREATE_BUFS`
> +are invoked.
> +
> +.. c:type:: v4l2_remove_buffers
> +
> +.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
> +
> +.. flat-table:: struct v4l2_remove_buffers
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths:       1 1 2
> +
> +    * - __u32
> +      - ``index``
> +      - The starting buffer index to remove.

Just add: "This field is ignored if count == 0."

> +    * - __u32
> +      - ``count``
> +      - The number of buffers to be removed with indices 'index' until 'index + count - 1'.
> +        All buffers in this range must be valid and in DEQUEUED state.
> +        If count is set to 0 :ref:`VIDIOC_REMOVE_BUFS` will do nothing and return 0.

I compared this to CREATE_BUFS and there the documentation clearly states
that it will return an error if count == 0 and the type is incorrect. So
we should do the same: the type field is checked regardless of the count value.

> +    * - __u32
> +      - ``type``
> +      - Type of the stream or buffers, this is the same as the struct
> +	:c:type:`v4l2_format` ``type`` field. See
> +	:c:type:`v4l2_buf_type` for valid values.
> +    * - __u32
> +      - ``reserved``\ [13]
> +      - A place holder for future extensions. Drivers and applications
> +	must set the array to zero.
> +
> +Return Value
> +============
> +
> +On success 0 is returned, on error -1 and the ``errno`` variable is set
> +appropriately. The generic error codes are described at the
> +:ref:`Generic Error Codes <gen-errors>` chapter.
> +
> +EBUSY
> +    File I/O is in progress.
> +    One or more of the buffers in the range ``index`` to ``index + count - 1`` are not
> +    in DEQUEUED state.
> +
> +EINVAL
> +    One or more of the buffers in the range ``index`` to ``index + count - 1`` do not
> +    exist in the queue.

This does not mention that it is also returned if type is invalid.

> diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> index 0b3a41a45d05..bbc22dd76032 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
> @@ -121,6 +121,7 @@ aborting or finishing any DMA in progress, an implicit
>  .. _V4L2-BUF-CAP-SUPPORTS-M2M-HOLD-CAPTURE-BUF:
>  .. _V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS:
>  .. _V4L2-BUF-CAP-SUPPORTS-MAX-NUM-BUFFERS:
> +.. _V4L2-BUF-CAP-SUPPORTS-REMOVE-BUFS:
>  
>  .. raw:: latex
>  
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 009cea95d662..0b2b48e1b2df 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -1691,6 +1691,44 @@ int vb2_core_prepare_buf(struct vb2_queue *q, struct vb2_buffer *vb, void *pb)
>  }
>  EXPORT_SYMBOL_GPL(vb2_core_prepare_buf);
>  
> +int vb2_core_remove_bufs(struct vb2_queue *q, unsigned int start, unsigned int count)
> +{
> +	unsigned int i, ret = 0;
> +	unsigned int q_num_bufs = vb2_get_num_buffers(q);
> +
> +	if (count == 0)
> +		return 0;
> +
> +	if (count > q_num_bufs)
> +		return -EINVAL;
> +
> +	if (start > q->max_num_buffers - count)
> +		return -EINVAL;
> +
> +	mutex_lock(&q->mmap_lock);
> +
> +	/* Check that all buffers in the range exist */
> +	for (i = start; i < start + count; i++) {
> +		struct vb2_buffer *vb = vb2_get_buffer(q, i);
> +
> +		if (!vb) {
> +			ret = -EINVAL;
> +			goto unlock;
> +		}
> +		if (vb->state != VB2_BUF_STATE_DEQUEUED) {
> +			ret = -EBUSY;
> +			goto unlock;
> +		}
> +	}
> +	__vb2_queue_free(q, start, count);
> +	dprintk(q, 2, "%u buffers removed\n", count);
> +
> +unlock:
> +	mutex_unlock(&q->mmap_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(vb2_core_remove_bufs);
> +
>  /*
>   * vb2_start_streaming() - Attempt to start streaming.
>   * @q:		videobuf2 queue
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 03e8080a68a8..9a5dcbb8fef3 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -685,7 +685,7 @@ static void vb2_set_flags_and_caps(struct vb2_queue *q, u32 memory,
>  		*flags &= V4L2_MEMORY_FLAG_NON_COHERENT;
>  	}
>  
> -	*caps = V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS;
> +	*caps |= V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS;
>  	if (q->io_modes & VB2_MMAP)
>  		*caps |= V4L2_BUF_CAP_SUPPORTS_MMAP;
>  	if (q->io_modes & VB2_USERPTR)
> @@ -1001,6 +1001,18 @@ EXPORT_SYMBOL_GPL(vb2_poll);
>  
>  /* vb2 ioctl helpers */
>  
> +int vb2_ioctl_remove_bufs(struct file *file, void *priv,
> +			  struct v4l2_remove_buffers *d)
> +{
> +	struct video_device *vdev = video_devdata(file);
> +

First check if the type matches vdev->queue->type and return -EINVAL
if it isn't.

Next, if count == 0, then just return 0. Otherwise it might return
-EBUSY in the check below.

> +	if (vb2_queue_is_busy(vdev->queue, file))
> +		return -EBUSY;
> +
> +	return vb2_core_remove_bufs(vdev->queue, d->index, d->count);
> +}
> +EXPORT_SYMBOL_GPL(vb2_ioctl_remove_bufs);
> +
>  int vb2_ioctl_reqbufs(struct file *file, void *priv,
>  			  struct v4l2_requestbuffers *p)
>  {
> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
> index d13954bd31fd..e39e9742fdb5 100644
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -722,6 +722,9 @@ static void determine_valid_ioctls(struct video_device *vdev)
>  		SET_VALID_IOCTL(ops, VIDIOC_PREPARE_BUF, vidioc_prepare_buf);
>  		SET_VALID_IOCTL(ops, VIDIOC_STREAMON, vidioc_streamon);
>  		SET_VALID_IOCTL(ops, VIDIOC_STREAMOFF, vidioc_streamoff);
> +		/* VIDIOC_CREATE_BUFS support is mandatory to enable VIDIOC_REMOVE_BUFS */
> +		if (ops->vidioc_create_bufs)
> +			SET_VALID_IOCTL(ops, VIDIOC_REMOVE_BUFS, vidioc_remove_bufs);
>  	}
>  
>  	if (is_vid || is_vbi || is_meta) {
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 33076af4dfdb..a5a4134218e6 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -489,6 +489,14 @@ static void v4l_print_create_buffers(const void *arg, bool write_only)
>  	v4l_print_format(&p->format, write_only);
>  }
>  
> +static void v4l_print_remove_buffers(const void *arg, bool write_only)
> +{
> +	const struct v4l2_remove_buffers *p = arg;
> +
> +	pr_cont("type=%s, index=%u, count=%u\n",
> +		prt_names(p->type, v4l2_type_names), p->index, p->count);
> +}
> +
>  static void v4l_print_streamparm(const void *arg, bool write_only)
>  {
>  	const struct v4l2_streamparm *p = arg;
> @@ -2092,6 +2100,7 @@ static int v4l_overlay(const struct v4l2_ioctl_ops *ops,
>  static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
>  				struct file *file, void *fh, void *arg)
>  {
> +	struct video_device *vfd = video_devdata(file);
>  	struct v4l2_requestbuffers *p = arg;
>  	int ret = check_fmt(file, p->type);
>  
> @@ -2100,6 +2109,9 @@ static int v4l_reqbufs(const struct v4l2_ioctl_ops *ops,
>  
>  	memset_after(p, 0, flags);
>  
> +	if (is_valid_ioctl(vfd, VIDIOC_REMOVE_BUFS))
> +		p->capabilities = V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS;
> +
>  	return ops->vidioc_reqbufs(file, fh, p);
>  }
>  
> @@ -2133,6 +2145,7 @@ static int v4l_dqbuf(const struct v4l2_ioctl_ops *ops,
>  static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
>  				struct file *file, void *fh, void *arg)
>  {
> +	struct video_device *vfd = video_devdata(file);
>  	struct v4l2_create_buffers *create = arg;
>  	int ret = check_fmt(file, create->format.type);
>  
> @@ -2143,6 +2156,9 @@ static int v4l_create_bufs(const struct v4l2_ioctl_ops *ops,
>  
>  	v4l_sanitize_format(&create->format);
>  
> +	if (is_valid_ioctl(vfd, VIDIOC_REMOVE_BUFS))
> +		create->capabilities = V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS;
> +
>  	ret = ops->vidioc_create_bufs(file, fh, create);
>  
>  	if (create->format.type == V4L2_BUF_TYPE_VIDEO_CAPTURE ||
> @@ -2161,6 +2177,21 @@ static int v4l_prepare_buf(const struct v4l2_ioctl_ops *ops,
>  	return ret ? ret : ops->vidioc_prepare_buf(file, fh, b);
>  }
>  
> +static int v4l_remove_bufs(const struct v4l2_ioctl_ops *ops,
> +			   struct file *file, void *fh, void *arg)
> +{
> +	struct v4l2_remove_buffers *remove = arg;
> +	int ret = check_fmt(file, remove->type);

This check should be dropped, it is unnecessary since vb2_ioctl_remove_bufs
will verify this. It's not sufficient either since check_fmt allows type
V4L2_BUF_TYPE_VIDEO_CAPTURE to be specified if vidioc_g_fmt_vid_cap_mplane
is present, so it is not as precise as checking for 'type == q->type'.

For create_bufs that is done later on, so the call to check_fmt there is
fairly pointless anyway.

A good test here is to do: modprobe vivid multiplanar=2

This enables multiplanar mode for the video capture and output.

If you pass in V4L2_BUF_TYPE_VIDEO_CAPTURE to remove_bufs, then it passes
with the check_fmt call, but q->type will actually be V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
so that should have returned -EINVAL.

> +
> +	if (ret)
> +		return ret;
> +
> +	if (ops->vidioc_remove_bufs)
> +		return ops->vidioc_remove_bufs(file, fh, remove);
> +
> +	return -ENOTTY;
> +}
> +
>  static int v4l_g_parm(const struct v4l2_ioctl_ops *ops,
>  				struct file *file, void *fh, void *arg)
>  {
> @@ -2910,6 +2941,7 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
>  	IOCTL_INFO(VIDIOC_ENUM_FREQ_BANDS, v4l_enum_freq_bands, v4l_print_freq_band, 0),
>  	IOCTL_INFO(VIDIOC_DBG_G_CHIP_INFO, v4l_dbg_g_chip_info, v4l_print_dbg_chip_info, INFO_FL_CLEAR(v4l2_dbg_chip_info, match)),
>  	IOCTL_INFO(VIDIOC_QUERY_EXT_CTRL, v4l_query_ext_ctrl, v4l_print_query_ext_ctrl, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_query_ext_ctrl, id)),
> +	IOCTL_INFO(VIDIOC_REMOVE_BUFS, v4l_remove_bufs, v4l_print_remove_buffers, INFO_FL_PRIO | INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_remove_buffers, type)),
>  };
>  #define V4L2_IOCTLS ARRAY_SIZE(v4l2_ioctls)
>  
> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> index edb733f21604..bdbb7e542321 100644
> --- a/include/media/v4l2-ioctl.h
> +++ b/include/media/v4l2-ioctl.h
> @@ -163,6 +163,8 @@ struct v4l2_fh;
>   *	:ref:`VIDIOC_CREATE_BUFS <vidioc_create_bufs>` ioctl
>   * @vidioc_prepare_buf: pointer to the function that implements
>   *	:ref:`VIDIOC_PREPARE_BUF <vidioc_prepare_buf>` ioctl
> + * @vidioc_remove_bufs: pointer to the function that implements
> + *	:ref:`VIDIOC_REMOVE_BUFS <vidioc_remove_bufs>` ioctl
>   * @vidioc_overlay: pointer to the function that implements
>   *	:ref:`VIDIOC_OVERLAY <vidioc_overlay>` ioctl
>   * @vidioc_g_fbuf: pointer to the function that implements
> @@ -422,6 +424,8 @@ struct v4l2_ioctl_ops {
>  				  struct v4l2_create_buffers *b);
>  	int (*vidioc_prepare_buf)(struct file *file, void *fh,
>  				  struct v4l2_buffer *b);
> +	int (*vidioc_remove_bufs)(struct file *file, void *fh,
> +				  struct v4l2_remove_buffers *d);
>  
>  	int (*vidioc_overlay)(struct file *file, void *fh, unsigned int i);
>  	int (*vidioc_g_fbuf)(struct file *file, void *fh,
> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
> index 7aebeaf671d8..a4e59280747e 100644
> --- a/include/media/videobuf2-core.h
> +++ b/include/media/videobuf2-core.h
> @@ -867,6 +867,16 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>   */
>  int vb2_core_prepare_buf(struct vb2_queue *q, struct vb2_buffer *vb, void *pb);
>  
> +/**
> + * vb2_core_remove_bufs() -
> + * @q:		pointer to &struct vb2_queue with videobuf2 queue.
> + * @start:	first index of the range of buffers to remove.
> + * @count:	number of buffers to remove.
> + *
> + *  Return: returns zero on success; an error code otherwise.
> + */
> +int vb2_core_remove_bufs(struct vb2_queue *q, unsigned int start, unsigned int count);
> +
>  /**
>   * vb2_core_qbuf() - Queue a buffer from userspace
>   *
> diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
> index 5a845887850b..77ce8238ab30 100644
> --- a/include/media/videobuf2-v4l2.h
> +++ b/include/media/videobuf2-v4l2.h
> @@ -334,6 +334,8 @@ int vb2_ioctl_streamon(struct file *file, void *priv, enum v4l2_buf_type i);
>  int vb2_ioctl_streamoff(struct file *file, void *priv, enum v4l2_buf_type i);
>  int vb2_ioctl_expbuf(struct file *file, void *priv,
>  	struct v4l2_exportbuffer *p);
> +int vb2_ioctl_remove_bufs(struct file *file, void *priv,
> +			  struct v4l2_remove_buffers *p);
>  
>  /* struct v4l2_file_operations helpers */
>  
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index a8015e5e7fa4..2663213b76a4 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1036,6 +1036,7 @@ struct v4l2_requestbuffers {
>  #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
>  #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
>  #define V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS		(1 << 7)
> +#define V4L2_BUF_CAP_SUPPORTS_REMOVE_BUFS		(1 << 8)
>  
>  /**
>   * struct v4l2_plane - plane info for multi-planar buffers
> @@ -2624,6 +2625,20 @@ struct v4l2_create_buffers {
>  	__u32			reserved[5];
>  };
>  
> +/**
> + * struct v4l2_remove_buffers - VIDIOC_REMOVE_BUFS argument
> + * @index:	the first buffer to be removed
> + * @count:	number of buffers to removed
> + * @type:	enum v4l2_buf_type
> + * @reserved:	future extensions
> + */
> +struct v4l2_remove_buffers {
> +	__u32			index;
> +	__u32			count;
> +	__u32			type;
> +	__u32			reserved[13];
> +};
> +
>  /*
>   *	I O C T L   C O D E S   F O R   V I D E O   D E V I C E S
>   *
> @@ -2723,6 +2738,8 @@ struct v4l2_create_buffers {
>  #define VIDIOC_DBG_G_CHIP_INFO  _IOWR('V', 102, struct v4l2_dbg_chip_info)
>  
>  #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl)
> +#define VIDIOC_REMOVE_BUFS	_IOWR('V', 104, struct v4l2_remove_buffers)
> +
>  
>  /* Reminder: when adding new ioctls please add support for them to
>     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */

Regards,

	Hans

