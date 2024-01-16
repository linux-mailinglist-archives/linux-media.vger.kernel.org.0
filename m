Return-Path: <linux-media+bounces-3743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 045E982EBAE
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 10:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 667A8285506
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 09:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DAFD12B9B;
	Tue, 16 Jan 2024 09:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="xWcYP7zD"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D7512B80;
	Tue, 16 Jan 2024 09:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705397824;
	bh=LFnqOdTHK5zlFq6Z9GXJWhIqoC6sfkN+eeUC7mJu2Pk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=xWcYP7zD/FUUpFsGa+zKcofy1EmzaCfpGau68jx1ld5+awPbueawo5/h1unNEyWIG
	 xfH1E4/y6M9oP/YdLOjizQiIkx0Jc2vd7En5Cz42GiSWhlRMl6LAT5wAuL+6JD+8La
	 EVq5wYNH8GOTv3wy2fe0GAYLmoxOuJaY8WxX6Wg1xCr8J6mUxeCWgaRaKiju/XGoah
	 jm+8V+Zdq3q7KDGevZn0JC9u1NKsNAJCHnbn23Aa0VMPTWERw2i7qbeW0zUq2BLjNL
	 1swmi7hBgwL8O87sx5Cvteozy4Oo3lEP7WlvdO/W316GBn8fgQeKTiig0xrkeVWVwW
	 Vx10seToXV9yg==
Received: from [100.93.89.217] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8F36A37813E0;
	Tue, 16 Jan 2024 09:37:04 +0000 (UTC)
Message-ID: <1f15acb7-2142-4623-99b9-6b71eb7e5d0d@collabora.com>
Date: Tue, 16 Jan 2024 10:37:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 6/8] media: v4l2: Add DELETE_BUFS ioctl
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>, mchehab@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 kernel@collabora.com
References: <20231215090813.15610-1-benjamin.gaignard@collabora.com>
 <20231215090813.15610-7-benjamin.gaignard@collabora.com>
 <74ebdb48-cf5c-408c-9f87-87a2b69ca802@xs4all.nl>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <74ebdb48-cf5c-408c-9f87-87a2b69ca802@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 15/01/2024 à 17:43, Hans Verkuil a écrit :
> On 15/12/2023 10:08, Benjamin Gaignard wrote:
>> VIDIOC_DELETE_BUFS ioctl allows to delete buffers from a queue.
>> The number of buffers to delete in given by count field of
>> struct v4l2_delete_buffers and the range start at the index
>> specified in the same structure.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>> version 16:
>> - Take care of 'min_queued_buffers' when deleting buffers
>> - Add more check about buffers range limit when deleting buffers.
>>
>>   .../userspace-api/media/v4l/user-func.rst     |  1 +
>>   .../media/v4l/vidioc-delete-bufs.rst          | 79 +++++++++++++++++++
>>   .../media/v4l/vidioc-reqbufs.rst              |  1 +
>>   .../media/common/videobuf2/videobuf2-core.c   | 42 ++++++++++
>>   .../media/common/videobuf2/videobuf2-v4l2.c   | 20 +++++
>>   drivers/media/v4l2-core/v4l2-dev.c            |  1 +
>>   drivers/media/v4l2-core/v4l2-ioctl.c          | 19 +++++
>>   include/media/v4l2-ioctl.h                    |  4 +
>>   include/media/videobuf2-core.h                | 12 +++
>>   include/media/videobuf2-v4l2.h                | 13 +++
>>   include/uapi/linux/videodev2.h                | 17 ++++
>>   11 files changed, 209 insertions(+)
>>   create mode 100644 Documentation/userspace-api/media/v4l/vidioc-delete-bufs.rst
>>
>> diff --git a/Documentation/userspace-api/media/v4l/user-func.rst b/Documentation/userspace-api/media/v4l/user-func.rst
>> index 15ff0bf7bbe6..3fd567695477 100644
>> --- a/Documentation/userspace-api/media/v4l/user-func.rst
>> +++ b/Documentation/userspace-api/media/v4l/user-func.rst
>> @@ -17,6 +17,7 @@ Function Reference
>>       vidioc-dbg-g-chip-info
>>       vidioc-dbg-g-register
>>       vidioc-decoder-cmd
>> +    vidioc-delete-bufs
>>       vidioc-dqevent
>>       vidioc-dv-timings-cap
>>       vidioc-encoder-cmd
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-delete-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-delete-bufs.rst
>> new file mode 100644
>> index 000000000000..5d5326b063c0
>> --- /dev/null
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-delete-bufs.rst
>> @@ -0,0 +1,79 @@
>> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
>> +.. c:namespace:: V4L
>> +
>> +.. _VIDIOC_DELETE_BUFS:
>> +
>> +************************
>> +ioctl VIDIOC_DELETE_BUFS
>> +************************
>> +
>> +Name
>> +====
>> +
>> +VIDIOC_DELETE_BUFS - Deletes buffers from a queue
> The paragraph below does not belong here, it should be part of the description.
>
>> +Drivers using this feature must expose the ``V4L2_BUF_CAP_SUPPORTS_DELETE_BUFS``
>> +capability on the queue :c:func:`VIDIOC_REQBUFS` or :c:func:`VIDIOC_CREATE_BUFS`
>> +are invoked.
> You generally shouldn't talk about 'drivers'. Something like: "This ioctl is
> available if the ..." is better.
>
>> +
>> +Synopsis
>> +========
>> +
>> +.. c:macro:: VIDIOC_DELETE_BUFs
>> +
>> +``int ioctl(int fd, VIDIOC_DELETE_BUFs, struct v4l2_delete_buffers *argp)``
>> +
>> +Arguments
>> +=========
>> +
>> +``fd``
>> +    File descriptor returned by :c:func:`open()`.
>> +
>> +``argp``
>> +    Pointer to struct :c:type:`v4l2_delete_buffers`.
>> +
>> +Description
>> +===========
>> +
>> +Applications can optionally call the :ref:`VIDIOC_DELETE_BUFS` ioctl to
>> +delete buffers from a queue.
>> +
>> +.. c:type:: v4l2_delete_buffers
>> +
>> +.. tabularcolumns:: |p{4.4cm}|p{4.4cm}|p{8.5cm}|
>> +
>> +.. flat-table:: struct v4l2_delete_buffers
>> +    :header-rows:  0
>> +    :stub-columns: 0
>> +    :widths:       1 1 2
>> +
>> +    * - __u32
>> +      - ``index``
>> +      - The starting buffer index to delete.
>> +    * - __u32
>> +      - ``count``
>> +      - The number of buffers to be deleted with indices 'index' until 'index + count - 1'.
>> +        All buffers in this range must be valid and in DEQUEUED state.
>> +        In error case errno is set to ``EINVAL`` error code.
> ?? You probably mean: In case of an error...
>
> I would actually drop this line altogether.
>
>> +        If count is set to 0 :ref:`VIDIOC_DELETE_BUFS` will return 0.
> ...will do nothing and return 0.
>
>> +    * - __u32
>> +      - ``type``
>> +      - Type of the stream or buffers, this is the same as the struct
>> +	:c:type:`v4l2_format` ``type`` field. See
>> +	:c:type:`v4l2_buf_type` for valid values.
>> +    * - __u32
>> +      - ``reserved``\ [13]
>> +      - A place holder for future extensions. Drivers and applications
>> +	must set the array to zero.
>> +
>> +Return Value
>> +============
>> +
>> +On success 0 is returned, on error -1 and the ``errno`` variable is set
>> +appropriately. The generic error codes are described at the
>> +:ref:`Generic Error Codes <gen-errors>` chapter.
>> +
>> +EBUSY
>> +    File I/O is in progress.
>> +
>> +EINVAL
>> +    The buffer ``index`` doesn't exist in the queue.
> This is incomplete: this is returned if any of the buffers in the range
> index to index+count-1 does not exist, or is not in the DEQUEUED state.
>
> Does it make sense that EINVAL is returned if a buffer is in the wrong
> state? Perhaps it should return EBUSY instead? I think that is more
> appropriate.

I will change that in the doc and in the code.

>
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
>> index 0b3a41a45d05..14d4a49c2945 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
>> @@ -121,6 +121,7 @@ aborting or finishing any DMA in progress, an implicit
>>   .. _V4L2-BUF-CAP-SUPPORTS-M2M-HOLD-CAPTURE-BUF:
>>   .. _V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS:
>>   .. _V4L2-BUF-CAP-SUPPORTS-MAX-NUM-BUFFERS:
>> +.. _V4L2-BUF-CAP-SUPPORTS-DELETE-BUFS:
>>   
>>   .. raw:: latex
>>   
>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
>> index 67ce823a0196..3b32791e70a8 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>> @@ -1674,6 +1674,48 @@ int vb2_core_prepare_buf(struct vb2_queue *q, struct vb2_buffer *vb, void *pb)
>>   }
>>   EXPORT_SYMBOL_GPL(vb2_core_prepare_buf);
>>   
>> +int vb2_core_delete_bufs(struct vb2_queue *q, unsigned int start, unsigned int count)
>> +{
>> +	unsigned int i, ret = 0;
>> +	unsigned int q_num_bufs = vb2_get_num_buffers(q);
>> +
>> +	if (count == 0)
>> +		return 0;
>> +
>> +	if (count > q_num_bufs)
>> +		return -EINVAL;
>> +
>> +	if (start + count > q->max_num_buffers)
>> +		return -EINVAL;
>> +
>> +	/* If streaming keep at least min_queued_buffers + 1 buffers */
>> +	if (q->streaming && (q_num_bufs - count < q->min_queued_buffers + 1))
>> +		return -EINVAL;
> Hmm, interesting.
>
> I will have to think some more about this. It would make the API more symmetrical
> if you can just delete all buffers (provided they are all DEQUEUED). But that has
> implications for functions like vb2_is_busy() that will now return false, even
> while you are streaming.
>
>> +
>> +	mutex_lock(&q->mmap_lock);
>> +
>> +	/* Check that all buffers in the range exist */
>> +	for (i = start; i < start + count && i < q->max_num_buffers; i++) {
> That test against q->max_num_buffers is not needed, it's already checked above.

You are right it is useless I will remove them.

>
>> +		struct vb2_buffer *vb = vb2_get_buffer(q, i);
>> +
>> +		if (!vb) {
>> +			ret = -EINVAL;
>> +			goto unlock;
>> +		}
>> +		if (vb->state != VB2_BUF_STATE_DEQUEUED) {
>> +			ret = -EINVAL;
>> +			goto unlock;
>> +		}
>> +	}
>> +	__vb2_queue_free(q, start, count);
>> +	dprintk(q, 2, "buffers deleted\n");
> I would report 'count' here as well, so you log how many buffers were
> actually deleted.
>
>> +
>> +unlock:
>> +	mutex_unlock(&q->mmap_lock);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(vb2_core_delete_bufs);
>> +
>>   /*
>>    * vb2_start_streaming() - Attempt to start streaming.
>>    * @q:		videobuf2 queue
>> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>> index 3c0c423c5674..729641e004d2 100644
>> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
>> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
>> @@ -686,6 +686,8 @@ static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
>>   		*caps |= V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
>>   	if (q->supports_requests)
>>   		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
>> +	if (q->supports_delete_bufs)
>> +		*caps |= V4L2_BUF_CAP_SUPPORTS_DELETE_BUFS;
>>   }
>>   
>>   static void validate_memory_flags(struct vb2_queue *q,
>> @@ -743,6 +745,12 @@ int vb2_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
>>   }
>>   EXPORT_SYMBOL_GPL(vb2_prepare_buf);
>>   
>> +int vb2_delete_bufs(struct vb2_queue *q, struct v4l2_delete_buffers *d)
>> +{
>> +	return vb2_core_delete_bufs(q, d->index, d->count);
>> +}
>> +EXPORT_SYMBOL_GPL(vb2_delete_bufs);
>> +
>>   int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
>>   {
>>   	unsigned requested_planes = 1;
>> @@ -1004,6 +1012,18 @@ EXPORT_SYMBOL_GPL(vb2_poll);
>>   
>>   /* vb2 ioctl helpers */
>>   
>> +int vb2_ioctl_delete_bufs(struct file *file, void *priv,
>> +			  struct v4l2_delete_buffers *p)
>> +{
>> +	struct video_device *vdev = video_devdata(file);
>> +
>> +	if (vb2_queue_is_busy(vdev->queue, file))
>> +		return -EBUSY;
>> +
>> +	return vb2_delete_bufs(vdev->queue, p);
>> +}
>> +EXPORT_SYMBOL_GPL(vb2_ioctl_delete_bufs);
>> +
>>   int vb2_ioctl_reqbufs(struct file *file, void *priv,
>>   			  struct v4l2_requestbuffers *p)
>>   {
>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>> index d13954bd31fd..e764af2e29ff 100644
>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>> @@ -722,6 +722,7 @@ static void determine_valid_ioctls(struct video_device *vdev)
>>   		SET_VALID_IOCTL(ops, VIDIOC_PREPARE_BUF, vidioc_prepare_buf);
>>   		SET_VALID_IOCTL(ops, VIDIOC_STREAMON, vidioc_streamon);
>>   		SET_VALID_IOCTL(ops, VIDIOC_STREAMOFF, vidioc_streamoff);
>> +		SET_VALID_IOCTL(ops, VIDIOC_DELETE_BUFS, vidioc_delete_bufs);
>>   	}
>>   
>>   	if (is_vid || is_vbi || is_meta) {
>> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
>> index 33076af4dfdb..19af075cee6b 100644
>> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
>> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
>> @@ -489,6 +489,13 @@ static void v4l_print_create_buffers(const void *arg, bool write_only)
>>   	v4l_print_format(&p->format, write_only);
>>   }
>>   
>> +static void v4l_print_delete_buffers(const void *arg, bool write_only)
>> +{
>> +	const struct v4l2_delete_buffers *p = arg;
>> +
>> +	pr_cont("index=%u, count=%u\n", p->index, p->count);
> This should log 'type' as well.
>
>> +}
>> +
>>   static void v4l_print_streamparm(const void *arg, bool write_only)
>>   {
>>   	const struct v4l2_streamparm *p = arg;
>> @@ -2161,6 +2168,17 @@ static int v4l_prepare_buf(const struct v4l2_ioctl_ops *ops,
>>   	return ret ? ret : ops->vidioc_prepare_buf(file, fh, b);
>>   }
>>   
>> +static int v4l_delete_bufs(const struct v4l2_ioctl_ops *ops,
>> +			   struct file *file, void *fh, void *arg)
>> +{
>> +	struct v4l2_delete_buffers *delete = arg;
>> +	int ret = check_fmt(file, delete->type);
>> +
>> +	memset_after(delete, 0, type);
>> +
>> +	return ret ? ret : ops->vidioc_delete_bufs(file, fh, delete);
>> +}
>> +
>>   static int v4l_g_parm(const struct v4l2_ioctl_ops *ops,
>>   				struct file *file, void *fh, void *arg)
>>   {
>> @@ -2910,6 +2928,7 @@ static const struct v4l2_ioctl_info v4l2_ioctls[] = {
>>   	IOCTL_INFO(VIDIOC_ENUM_FREQ_BANDS, v4l_enum_freq_bands, v4l_print_freq_band, 0),
>>   	IOCTL_INFO(VIDIOC_DBG_G_CHIP_INFO, v4l_dbg_g_chip_info, v4l_print_dbg_chip_info, INFO_FL_CLEAR(v4l2_dbg_chip_info, match)),
>>   	IOCTL_INFO(VIDIOC_QUERY_EXT_CTRL, v4l_query_ext_ctrl, v4l_print_query_ext_ctrl, INFO_FL_CTRL | INFO_FL_CLEAR(v4l2_query_ext_ctrl, id)),
>> +	IOCTL_INFO(VIDIOC_DELETE_BUFS, v4l_delete_bufs, v4l_print_delete_buffers, INFO_FL_PRIO | INFO_FL_QUEUE | INFO_FL_CLEAR(v4l2_delete_buffers, type)),
>>   };
>>   #define V4L2_IOCTLS ARRAY_SIZE(v4l2_ioctls)
>>   
>> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
>> index edb733f21604..55afbde54211 100644
>> --- a/include/media/v4l2-ioctl.h
>> +++ b/include/media/v4l2-ioctl.h
>> @@ -163,6 +163,8 @@ struct v4l2_fh;
>>    *	:ref:`VIDIOC_CREATE_BUFS <vidioc_create_bufs>` ioctl
>>    * @vidioc_prepare_buf: pointer to the function that implements
>>    *	:ref:`VIDIOC_PREPARE_BUF <vidioc_prepare_buf>` ioctl
>> + * @vidioc_delete_bufs: pointer to the function that implements
>> + *	:ref:`VIDIOC_DELETE_BUFS <vidioc_delete_bufs>` ioctl
>>    * @vidioc_overlay: pointer to the function that implements
>>    *	:ref:`VIDIOC_OVERLAY <vidioc_overlay>` ioctl
>>    * @vidioc_g_fbuf: pointer to the function that implements
>> @@ -422,6 +424,8 @@ struct v4l2_ioctl_ops {
>>   				  struct v4l2_create_buffers *b);
>>   	int (*vidioc_prepare_buf)(struct file *file, void *fh,
>>   				  struct v4l2_buffer *b);
>> +	int (*vidioc_delete_bufs)(struct file *file, void *fh,
>> +				  struct v4l2_delete_buffers *d);
>>   
>>   	int (*vidioc_overlay)(struct file *file, void *fh, unsigned int i);
>>   	int (*vidioc_g_fbuf)(struct file *file, void *fh,
>> diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
>> index e4c1fc7ae82f..7abdee874698 100644
>> --- a/include/media/videobuf2-core.h
>> +++ b/include/media/videobuf2-core.h
>> @@ -507,6 +507,7 @@ struct vb2_buf_ops {
>>    * @supports_requests: this queue supports the Request API.
>>    * @requires_requests: this queue requires the Request API. If this is set to 1,
>>    *		then supports_requests must be set to 1 as well.
>> + * @supports_delete_bufs: this queue supports DELETE_BUFS ioctl.
>>    * @uses_qbuf:	qbuf was used directly for this queue. Set to 1 the first
>>    *		time this is called. Set to 0 when the queue is canceled.
>>    *		If this is 1, then you cannot queue buffers from a request.
>> @@ -612,6 +613,7 @@ struct vb2_queue {
>>   	unsigned int		   quirk_poll_must_check_waiting_for_buffers:1;
>>   	unsigned int			supports_requests:1;
>>   	unsigned int			requires_requests:1;
>> +	unsigned int			supports_delete_bufs:1;
>>   	unsigned int			uses_qbuf:1;
>>   	unsigned int			uses_requests:1;
>>   	unsigned int			allow_cache_hints:1;
>> @@ -864,6 +866,16 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>>    */
>>   int vb2_core_prepare_buf(struct vb2_queue *q, struct vb2_buffer *vb, void *pb);
>>   
>> +/**
>> + * vb2_core_delete_bufs() -
>> + * @q:		pointer to &struct vb2_queue with videobuf2 queue.
>> + * @start:	first index of the range of buffers to delete.
>> + * @count:	number of buffers to delete.
>> + *
>> + *  Return: returns zero on success; an error code otherwise.
>> + */
>> +int vb2_core_delete_bufs(struct vb2_queue *q, unsigned int start, unsigned int count);
>> +
>>   /**
>>    * vb2_core_qbuf() - Queue a buffer from userspace
>>    *
>> diff --git a/include/media/videobuf2-v4l2.h b/include/media/videobuf2-v4l2.h
>> index 5a845887850b..79cea8459f52 100644
>> --- a/include/media/videobuf2-v4l2.h
>> +++ b/include/media/videobuf2-v4l2.h
>> @@ -118,6 +118,17 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create);
>>    */
>>   int vb2_prepare_buf(struct vb2_queue *q, struct media_device *mdev,
>>   		    struct v4l2_buffer *b);
>> +/**
>> + * vb2_delete_bufs() - Delete buffers from the queue
>> + *
>> + * @q:		pointer to &struct vb2_queue with videobuf2 queue.
>> + * @d:		delete parameter, passed from userspace to
>> + *		&v4l2_ioctl_ops->vidioc_delete_bufs handler in driver
>> + *
>> + * The return values from this function are intended to be directly returned
>> + * from &v4l2_ioctl_ops->vidioc_delete_bufs handler in driver.
>> + */
>> +int vb2_delete_bufs(struct vb2_queue *q, struct v4l2_delete_buffers *d);
>>   
>>   /**
>>    * vb2_qbuf() - Queue a buffer from userspace
>> @@ -334,6 +345,8 @@ int vb2_ioctl_streamon(struct file *file, void *priv, enum v4l2_buf_type i);
>>   int vb2_ioctl_streamoff(struct file *file, void *priv, enum v4l2_buf_type i);
>>   int vb2_ioctl_expbuf(struct file *file, void *priv,
>>   	struct v4l2_exportbuffer *p);
>> +int vb2_ioctl_delete_bufs(struct file *file, void *priv,
>> +			  struct v4l2_delete_buffers *p);
>>   
>>   /* struct v4l2_file_operations helpers */
>>   
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 68e7ac178cc2..ce436f924782 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -1036,6 +1036,7 @@ struct v4l2_requestbuffers {
>>   #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
>>   #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
>>   #define V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS		(1 << 7)
>> +#define V4L2_BUF_CAP_SUPPORTS_DELETE_BUFS		(1 << 8)
> I'm not really certain if we need this cap. You can just call VIDIOC_DELETE_BUFS
> with 0 as count and index.

It is a flag per queue and getting the info like this avoid doing adding ioctl calls.
If I remember well it was also a request from Nicolas because it simplify userspace code,
testing one flag is simpler than calling ioctl why specify values.

Regards,
Benjamin

>
>>   
>>   /**
>>    * struct v4l2_plane - plane info for multi-planar buffers
>> @@ -2624,6 +2625,20 @@ struct v4l2_create_buffers {
>>   	__u32			reserved[5];
>>   };
>>   
>> +/**
>> + * struct v4l2_delete_buffers - VIDIOC_DELETE_BUFS argument
>> + * @index:	the first buffer to be deleted
>> + * @count:	number of buffers to delete
>> + * @type:	enum v4l2_buf_type
>> + * @reserved:	future extensions
>> + */
>> +struct v4l2_delete_buffers {
>> +	__u32			index;
>> +	__u32			count;
>> +	__u32			type;
>> +	__u32			reserved[13];
>> +};
>> +
>>   /*
>>    *	I O C T L   C O D E S   F O R   V I D E O   D E V I C E S
>>    *
>> @@ -2723,6 +2738,8 @@ struct v4l2_create_buffers {
>>   #define VIDIOC_DBG_G_CHIP_INFO  _IOWR('V', 102, struct v4l2_dbg_chip_info)
>>   
>>   #define VIDIOC_QUERY_EXT_CTRL	_IOWR('V', 103, struct v4l2_query_ext_ctrl)
>> +#define VIDIOC_DELETE_BUFS	_IOWR('V', 104, struct v4l2_delete_buffers)
>> +
>>   
>>   /* Reminder: when adding new ioctls please add support for them to
>>      drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
> Regards,
>
> 	Hans
>

