Return-Path: <linux-media+bounces-33406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B14AC4148
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 16:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A11A16B2F0
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 14:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40DC320F079;
	Mon, 26 May 2025 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ApH/JPWU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964D381724;
	Mon, 26 May 2025 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748269340; cv=none; b=UfAJFdYCYVG23OWaU8m/xj6CFf92xhi/sGAl6atsvAl+SKSCcu/ZFAXFOzmcjh4zo5wqqqjm4zFsRh18U7uEmmaRoMz2yCuL7yKYr9nWglKQA3mSQZiOj6pfIKQkJckAuXhPrPVKsytSiv2gZcFhBn1VoRMnKDKK9nW8a6EyJ+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748269340; c=relaxed/simple;
	bh=SydGQ8UDyo71H/IvSUsCzmiBXTHQq6C7cRMPjWkm8jg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZrhRlMoURGZh5eoYs0YAaGxEbQHiapusFluMgCox4dboUX1ek8cTmMzJJrPLph8SUb/e+FMh0c6yeuMchw9gt4bb8Qmh7b0I0soLghP+EMFCosGIG1rjCGwi8eihFB4cjDWJrNr+rhEpGxsToo127UqScvOSP3gppDJY3Kv79es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ApH/JPWU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52645C4AF0B;
	Mon, 26 May 2025 14:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748269337;
	bh=SydGQ8UDyo71H/IvSUsCzmiBXTHQq6C7cRMPjWkm8jg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ApH/JPWUueVhIY6eCQH18eUq8SSvSfAo7yTfsJ41PxSqtBy9bZFZU51ZA7BO1pxif
	 ATlPzOd6J3+vkrAkTQ3RIIa5YKq6MTpzJej8g+ypSK3iplCyZRox0OE6sjygdngEBs
	 XKRc+uvP7BO7YKxSDkqKxbW3IdKZ8h74NGv7U8cIEbjm9/jGoF8Ur4s10ry3NmXJx2
	 bloJys5VziKG4GNflnqsgMYdGv0IubeZCOYNKFDIwZp0iTCme+MkS/8CDqMKxN62z3
	 oHqBWMQWCSVuqt6joYz1kNRpOUz5Kl2NYrVY6feSnoKXqrjJS51Cs5XUgAJPX0v4rd
	 o9W8TW3PlvF0A==
Message-ID: <4602e0d6-c444-44da-acdd-5df36c34e6e8@kernel.org>
Date: Mon, 26 May 2025 16:22:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: uvcvideo: Use vb2 ioctl and fop helpers
From: Hans de Goede <hansg@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hans@jjverkuil.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250522-uvc-fop-v1-0-3bfe7a00f31d@chromium.org>
 <20250522-uvc-fop-v1-2-3bfe7a00f31d@chromium.org>
 <e5d1af07-d08c-4fba-a093-06fbd89607c8@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <e5d1af07-d08c-4fba-a093-06fbd89607c8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 26-May-25 16:16, Hans de Goede wrote:
> Hi,
> 
> On 22-May-25 19:58, Ricardo Ribalda wrote:
>> From: Hans Verkuil <hans@jjverkuil.nl>
>>
>> When uvc was written the vb2 ioctl and file operation helpers didn't exist.
>>
>> This patch switches uvc over to those helpers, which removes a lot of
>> boilerplatecode and simplifies VIDIOC_G/S_PRIORITY handling and allows us
>> to drop the 'privileges' scheme, since that's now handled inside the vb2
>> helpers.
>>
>> This makes it possible for uvc to fix the v4l2-compliance streaming tests:
>>  warn: v4l2-test-formats.cpp(1075): Could not set fmt2
>>
>> This patch introduces a change on behavior on the uvcdriver to be
>> aligned with the rest of the subsystem. Now S_INPUT, S_PARM and
>> S_FORMAT do no gran exclusive ownership of the device.
>>
>> Signed-off-by: Hans Verkuil <hans@jjverkuil.nl>
>> Co-developed-by: Ricardo Ribalda <ribalda@chromium.org>
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> 
> Thanks, patch looks good to me:
> 
> Reviewed-by: Hans de Goede <hansg@kernel.org>

p.s.

The review is mostly for the code changes, this changes does have
userspace API aspects also. Now multiple processes will be able
to do say set_fmt or s_input at the same time until buffers
are requsted.

I don't think this will really be an issue, but it is something
which requires careful consideration before merging this.


> Regards,
> 
> Hans
> 
>> ---
>>  drivers/media/usb/uvc/uvc_driver.c   |  34 +----
>>  drivers/media/usb/uvc/uvc_metadata.c |   8 +-
>>  drivers/media/usb/uvc/uvc_queue.c    | 143 --------------------
>>  drivers/media/usb/uvc/uvc_v4l2.c     | 251 +++--------------------------------
>>  drivers/media/usb/uvc/uvcvideo.h     |  37 +-----
>>  5 files changed, 30 insertions(+), 443 deletions(-)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>> index da24a655ab68cc0957762f2b67387677c22224d1..4eeedab93b90939fc4c925012a18b7d018ade39f 100644
>> --- a/drivers/media/usb/uvc/uvc_driver.c
>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>> @@ -1725,7 +1725,6 @@ static struct uvc_video_chain *uvc_alloc_chain(struct uvc_device *dev)
>>  	INIT_LIST_HEAD(&chain->entities);
>>  	mutex_init(&chain->ctrl_mutex);
>>  	chain->dev = dev;
>> -	v4l2_prio_init(&chain->prio);
>>  
>>  	return chain;
>>  }
>> @@ -1958,31 +1957,7 @@ static void uvc_unregister_video(struct uvc_device *dev)
>>  		if (!video_is_registered(&stream->vdev))
>>  			continue;
>>  
>> -		/*
>> -		 * For stream->vdev we follow the same logic as:
>> -		 * vb2_video_unregister_device().
>> -		 */
>> -
>> -		/* 1. Take a reference to vdev */
>> -		get_device(&stream->vdev.dev);
>> -
>> -		/* 2. Ensure that no new ioctls can be called. */
>> -		video_unregister_device(&stream->vdev);
>> -
>> -		/* 3. Wait for old ioctls to finish. */
>> -		mutex_lock(&stream->mutex);
>> -
>> -		/* 4. Stop streaming. */
>> -		uvc_queue_release(&stream->queue);
>> -
>> -		mutex_unlock(&stream->mutex);
>> -
>> -		put_device(&stream->vdev.dev);
>> -
>> -		/*
>> -		 * For stream->meta.vdev we can directly call:
>> -		 * vb2_video_unregister_device().
>> -		 */
>> +		vb2_video_unregister_device(&stream->vdev);
>>  		vb2_video_unregister_device(&stream->meta.vdev);
>>  
>>  		/*
>> @@ -2029,7 +2004,8 @@ int uvc_register_video_device(struct uvc_device *dev,
>>  	vdev->fops = fops;
>>  	vdev->ioctl_ops = ioctl_ops;
>>  	vdev->release = uvc_release;
>> -	vdev->prio = &stream->chain->prio;
>> +	vdev->queue = &queue->queue;
>> +	vdev->lock = &queue->mutex;
>>  	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
>>  		vdev->vfl_dir = VFL_DIR_TX;
>>  	else
>> @@ -2399,8 +2375,8 @@ static int __uvc_resume(struct usb_interface *intf, int reset)
>>  		if (stream->intf == intf) {
>>  			ret = uvc_video_resume(stream, reset);
>>  			if (ret < 0)
>> -				uvc_queue_streamoff(&stream->queue,
>> -						    stream->queue.queue.type);
>> +				vb2_streamoff(&stream->queue.queue,
>> +					      stream->queue.queue.type);
>>  			return ret;
>>  		}
>>  	}
>> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
>> index 82de7781f5b6b70c5ba16bcba9e0741231231904..d3aab22f91cea21aefc56409924dfa1451aec914 100644
>> --- a/drivers/media/usb/uvc/uvc_metadata.c
>> +++ b/drivers/media/usb/uvc/uvc_metadata.c
>> @@ -96,7 +96,7 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
>>  	 */
>>  	mutex_lock(&stream->mutex);
>>  
>> -	if (uvc_queue_allocated(&stream->queue))
>> +	if (vb2_is_busy(&stream->meta.queue.queue))
>>  		ret = -EBUSY;
>>  	else
>>  		stream->meta.format = fmt->dataformat;
>> @@ -164,12 +164,6 @@ int uvc_meta_register(struct uvc_streaming *stream)
>>  
>>  	stream->meta.format = V4L2_META_FMT_UVC;
>>  
>> -	/*
>> -	 * The video interface queue uses manual locking and thus does not set
>> -	 * the queue pointer. Set it manually here.
>> -	 */
>> -	vdev->queue = &queue->queue;
>> -
>>  	return uvc_register_video_device(dev, stream, vdev, queue,
>>  					 V4L2_BUF_TYPE_META_CAPTURE,
>>  					 &uvc_meta_fops, &uvc_meta_ioctl_ops);
>> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
>> index 2ee142621042167c2587b6a6fdd51c1a46d31c11..72c5494dee9f46ff61072e7d293bfaddda40e615 100644
>> --- a/drivers/media/usb/uvc/uvc_queue.c
>> +++ b/drivers/media/usb/uvc/uvc_queue.c
>> @@ -242,153 +242,10 @@ int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)
>>  	return 0;
>>  }
>>  
>> -void uvc_queue_release(struct uvc_video_queue *queue)
>> -{
>> -	mutex_lock(&queue->mutex);
>> -	vb2_queue_release(&queue->queue);
>> -	mutex_unlock(&queue->mutex);
>> -}
>> -
>> -/* -----------------------------------------------------------------------------
>> - * V4L2 queue operations
>> - */
>> -
>> -int uvc_request_buffers(struct uvc_video_queue *queue,
>> -			struct v4l2_requestbuffers *rb)
>> -{
>> -	int ret;
>> -
>> -	mutex_lock(&queue->mutex);
>> -	ret = vb2_reqbufs(&queue->queue, rb);
>> -	mutex_unlock(&queue->mutex);
>> -
>> -	return ret ? ret : rb->count;
>> -}
>> -
>> -int uvc_query_buffer(struct uvc_video_queue *queue, struct v4l2_buffer *buf)
>> -{
>> -	int ret;
>> -
>> -	mutex_lock(&queue->mutex);
>> -	ret = vb2_querybuf(&queue->queue, buf);
>> -	mutex_unlock(&queue->mutex);
>> -
>> -	return ret;
>> -}
>> -
>> -int uvc_create_buffers(struct uvc_video_queue *queue,
>> -		       struct v4l2_create_buffers *cb)
>> -{
>> -	int ret;
>> -
>> -	mutex_lock(&queue->mutex);
>> -	ret = vb2_create_bufs(&queue->queue, cb);
>> -	mutex_unlock(&queue->mutex);
>> -
>> -	return ret;
>> -}
>> -
>> -int uvc_queue_buffer(struct uvc_video_queue *queue,
>> -		     struct media_device *mdev, struct v4l2_buffer *buf)
>> -{
>> -	int ret;
>> -
>> -	mutex_lock(&queue->mutex);
>> -	ret = vb2_qbuf(&queue->queue, mdev, buf);
>> -	mutex_unlock(&queue->mutex);
>> -
>> -	return ret;
>> -}
>> -
>> -int uvc_export_buffer(struct uvc_video_queue *queue,
>> -		      struct v4l2_exportbuffer *exp)
>> -{
>> -	int ret;
>> -
>> -	mutex_lock(&queue->mutex);
>> -	ret = vb2_expbuf(&queue->queue, exp);
>> -	mutex_unlock(&queue->mutex);
>> -
>> -	return ret;
>> -}
>> -
>> -int uvc_dequeue_buffer(struct uvc_video_queue *queue, struct v4l2_buffer *buf,
>> -		       int nonblocking)
>> -{
>> -	int ret;
>> -
>> -	mutex_lock(&queue->mutex);
>> -	ret = vb2_dqbuf(&queue->queue, buf, nonblocking);
>> -	mutex_unlock(&queue->mutex);
>> -
>> -	return ret;
>> -}
>> -
>> -int uvc_queue_streamon(struct uvc_video_queue *queue, enum v4l2_buf_type type)
>> -{
>> -	int ret;
>> -
>> -	mutex_lock(&queue->mutex);
>> -	ret = vb2_streamon(&queue->queue, type);
>> -	mutex_unlock(&queue->mutex);
>> -
>> -	return ret;
>> -}
>> -
>> -int uvc_queue_streamoff(struct uvc_video_queue *queue, enum v4l2_buf_type type)
>> -{
>> -	int ret;
>> -
>> -	mutex_lock(&queue->mutex);
>> -	ret = vb2_streamoff(&queue->queue, type);
>> -	mutex_unlock(&queue->mutex);
>> -
>> -	return ret;
>> -}
>> -
>> -int uvc_queue_mmap(struct uvc_video_queue *queue, struct vm_area_struct *vma)
>> -{
>> -	return vb2_mmap(&queue->queue, vma);
>> -}
>> -
>> -#ifndef CONFIG_MMU
>> -unsigned long uvc_queue_get_unmapped_area(struct uvc_video_queue *queue,
>> -		unsigned long pgoff)
>> -{
>> -	return vb2_get_unmapped_area(&queue->queue, 0, 0, pgoff, 0);
>> -}
>> -#endif
>> -
>> -__poll_t uvc_queue_poll(struct uvc_video_queue *queue, struct file *file,
>> -			    poll_table *wait)
>> -{
>> -	__poll_t ret;
>> -
>> -	mutex_lock(&queue->mutex);
>> -	ret = vb2_poll(&queue->queue, file, wait);
>> -	mutex_unlock(&queue->mutex);
>> -
>> -	return ret;
>> -}
>> -
>>  /* -----------------------------------------------------------------------------
>>   *
>>   */
>>  
>> -/*
>> - * Check if buffers have been allocated.
>> - */
>> -int uvc_queue_allocated(struct uvc_video_queue *queue)
>> -{
>> -	int allocated;
>> -
>> -	mutex_lock(&queue->mutex);
>> -	allocated = vb2_is_busy(&queue->queue);
>> -	mutex_unlock(&queue->mutex);
>> -
>> -	return allocated;
>> -}
>> -
>>  /*
>>   * Cancel the video buffers queue.
>>   *
>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
>> index 862b4e34e5b629cf324479a9bb59ebe8784ccd5d..7a5ecbefa32c0a6b74c85d7f77a25b433598471e 100644
>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>> @@ -47,8 +47,6 @@ void uvc_pm_put(struct uvc_device *dev)
>>  	usb_autopm_put_interface(dev->intf);
>>  }
>>  
>> -static int uvc_acquire_privileges(struct uvc_fh *handle);
>> -
>>  static int uvc_control_add_xu_mapping(struct uvc_video_chain *chain,
>>  				      struct uvc_control_mapping *map,
>>  				      const struct uvc_xu_control_mapping *xmap)
>> @@ -436,10 +434,6 @@ static int uvc_ioctl_s_fmt(struct file *file, void *fh,
>>  	const struct uvc_frame *frame;
>>  	int ret;
>>  
>> -	ret = uvc_acquire_privileges(handle);
>> -	if (ret < 0)
>> -		return ret;
>> -
>>  	if (fmt->type != stream->type)
>>  		return -EINVAL;
>>  
>> @@ -448,8 +442,7 @@ static int uvc_ioctl_s_fmt(struct file *file, void *fh,
>>  		return ret;
>>  
>>  	mutex_lock(&stream->mutex);
>> -
>> -	if (uvc_queue_allocated(&stream->queue)) {
>> +	if (vb2_is_busy(&stream->queue.queue)) {
>>  		ret = -EBUSY;
>>  		goto done;
>>  	}
>> @@ -513,10 +506,6 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
>>  	unsigned int i;
>>  	int ret;
>>  
>> -	ret = uvc_acquire_privileges(handle);
>> -	if (ret < 0)
>> -		return ret;
>> -
>>  	if (parm->type != stream->type)
>>  		return -EINVAL;
>>  
>> @@ -593,63 +582,6 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
>>  	return 0;
>>  }
>>  
>> -/* ------------------------------------------------------------------------
>> - * Privilege management
>> - */
>> -
>> -/*
>> - * Privilege management is the multiple-open implementation basis. The current
>> - * implementation is completely transparent for the end-user and doesn't
>> - * require explicit use of the VIDIOC_G_PRIORITY and VIDIOC_S_PRIORITY ioctls.
>> - * Those ioctls enable finer control on the device (by making possible for a
>> - * user to request exclusive access to a device), but are not mature yet.
>> - * Switching to the V4L2 priority mechanism might be considered in the future
>> - * if this situation changes.
>> - *
>> - * Each open instance of a UVC device can either be in a privileged or
>> - * unprivileged state. Only a single instance can be in a privileged state at
>> - * a given time. Trying to perform an operation that requires privileges will
>> - * automatically acquire the required privileges if possible, or return -EBUSY
>> - * otherwise. Privileges are dismissed when closing the instance or when
>> - * freeing the video buffers using VIDIOC_REQBUFS.
>> - *
>> - * Operations that require privileges are:
>> - *
>> - * - VIDIOC_S_INPUT
>> - * - VIDIOC_S_PARM
>> - * - VIDIOC_S_FMT
>> - * - VIDIOC_CREATE_BUFS
>> - * - VIDIOC_REQBUFS
>> - */
>> -static int uvc_acquire_privileges(struct uvc_fh *handle)
>> -{
>> -	/* Always succeed if the handle is already privileged. */
>> -	if (handle->state == UVC_HANDLE_ACTIVE)
>> -		return 0;
>> -
>> -	/* Check if the device already has a privileged handle. */
>> -	if (atomic_inc_return(&handle->stream->active) != 1) {
>> -		atomic_dec(&handle->stream->active);
>> -		return -EBUSY;
>> -	}
>> -
>> -	handle->state = UVC_HANDLE_ACTIVE;
>> -	return 0;
>> -}
>> -
>> -static void uvc_dismiss_privileges(struct uvc_fh *handle)
>> -{
>> -	if (handle->state == UVC_HANDLE_ACTIVE)
>> -		atomic_dec(&handle->stream->active);
>> -
>> -	handle->state = UVC_HANDLE_PASSIVE;
>> -}
>> -
>> -static int uvc_has_privileges(struct uvc_fh *handle)
>> -{
>> -	return handle->state == UVC_HANDLE_ACTIVE;
>> -}
>> -
>>  /* ------------------------------------------------------------------------
>>   * V4L2 file operations
>>   */
>> @@ -671,7 +603,6 @@ static int uvc_v4l2_open(struct file *file)
>>  	v4l2_fh_add(&handle->vfh);
>>  	handle->chain = stream->chain;
>>  	handle->stream = stream;
>> -	handle->state = UVC_HANDLE_PASSIVE;
>>  	file->private_data = handle;
>>  
>>  	return 0;
>> @@ -686,18 +617,11 @@ static int uvc_v4l2_release(struct file *file)
>>  
>>  	uvc_ctrl_cleanup_fh(handle);
>>  
>> -	/* Only free resources if this is a privileged handle. */
>> -	if (uvc_has_privileges(handle))
>> -		uvc_queue_release(&stream->queue);
>> -
>>  	if (handle->is_streaming)
>>  		uvc_pm_put(stream->dev);
>>  
>>  	/* Release the file handle. */
>> -	uvc_dismiss_privileges(handle);
>> -	v4l2_fh_del(&handle->vfh);
>> -	v4l2_fh_exit(&handle->vfh);
>> -	kfree(handle);
>> +	vb2_fop_release(file);
>>  	file->private_data = NULL;
>>  
>>  	return 0;
>> @@ -753,91 +677,6 @@ static int uvc_ioctl_try_fmt(struct file *file, void *fh,
>>  	return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL);
>>  }
>>  
>> -static int uvc_ioctl_reqbufs(struct file *file, void *fh,
>> -			     struct v4l2_requestbuffers *rb)
>> -{
>> -	struct uvc_fh *handle = fh;
>> -	struct uvc_streaming *stream = handle->stream;
>> -	int ret;
>> -
>> -	ret = uvc_acquire_privileges(handle);
>> -	if (ret < 0)
>> -		return ret;
>> -
>> -	mutex_lock(&stream->mutex);
>> -	ret = uvc_request_buffers(&stream->queue, rb);
>> -	mutex_unlock(&stream->mutex);
>> -	if (ret < 0)
>> -		return ret;
>> -
>> -	if (ret == 0)
>> -		uvc_dismiss_privileges(handle);
>> -
>> -	return 0;
>> -}
>> -
>> -static int uvc_ioctl_querybuf(struct file *file, void *fh,
>> -			      struct v4l2_buffer *buf)
>> -{
>> -	struct uvc_fh *handle = fh;
>> -	struct uvc_streaming *stream = handle->stream;
>> -
>> -	if (!uvc_has_privileges(handle))
>> -		return -EBUSY;
>> -
>> -	return uvc_query_buffer(&stream->queue, buf);
>> -}
>> -
>> -static int uvc_ioctl_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
>> -{
>> -	struct uvc_fh *handle = fh;
>> -	struct uvc_streaming *stream = handle->stream;
>> -
>> -	if (!uvc_has_privileges(handle))
>> -		return -EBUSY;
>> -
>> -	return uvc_queue_buffer(&stream->queue,
>> -				stream->vdev.v4l2_dev->mdev, buf);
>> -}
>> -
>> -static int uvc_ioctl_expbuf(struct file *file, void *fh,
>> -			    struct v4l2_exportbuffer *exp)
>> -{
>> -	struct uvc_fh *handle = fh;
>> -	struct uvc_streaming *stream = handle->stream;
>> -
>> -	if (!uvc_has_privileges(handle))
>> -		return -EBUSY;
>> -
>> -	return uvc_export_buffer(&stream->queue, exp);
>> -}
>> -
>> -static int uvc_ioctl_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
>> -{
>> -	struct uvc_fh *handle = fh;
>> -	struct uvc_streaming *stream = handle->stream;
>> -
>> -	if (!uvc_has_privileges(handle))
>> -		return -EBUSY;
>> -
>> -	return uvc_dequeue_buffer(&stream->queue, buf,
>> -				  file->f_flags & O_NONBLOCK);
>> -}
>> -
>> -static int uvc_ioctl_create_bufs(struct file *file, void *fh,
>> -				  struct v4l2_create_buffers *cb)
>> -{
>> -	struct uvc_fh *handle = fh;
>> -	struct uvc_streaming *stream = handle->stream;
>> -	int ret;
>> -
>> -	ret = uvc_acquire_privileges(handle);
>> -	if (ret < 0)
>> -		return ret;
>> -
>> -	return uvc_create_buffers(&stream->queue, cb);
>> -}
>> -
>>  static int uvc_ioctl_streamon(struct file *file, void *fh,
>>  			      enum v4l2_buf_type type)
>>  {
>> @@ -845,11 +684,6 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
>>  	struct uvc_streaming *stream = handle->stream;
>>  	int ret;
>>  
>> -	if (!uvc_has_privileges(handle))
>> -		return -EBUSY;
>> -
>> -	guard(mutex)(&stream->mutex);
>> -
>>  	if (handle->is_streaming)
>>  		return 0;
>>  
>> @@ -857,7 +691,7 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
>>  	if (ret)
>>  		return ret;
>>  
>> -	ret = uvc_queue_streamon(&stream->queue, type);
>> +	ret = vb2_ioctl_streamon(file, fh, type);
>>  	if (ret) {
>>  		uvc_pm_put(stream->dev);
>>  		return ret;
>> @@ -873,13 +707,12 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
>>  {
>>  	struct uvc_fh *handle = fh;
>>  	struct uvc_streaming *stream = handle->stream;
>> +	int ret;
>>  
>> -	if (!uvc_has_privileges(handle))
>> -		return -EBUSY;
>> -
>> -	guard(mutex)(&stream->mutex);
>> +	ret = vb2_ioctl_streamoff(file, fh, type);
>> +	if (ret)
>> +		return ret;
>>  
>> -	uvc_queue_streamoff(&stream->queue, type);
>>  	if (handle->is_streaming) {
>>  		handle->is_streaming = false;
>>  		uvc_pm_put(stream->dev);
>> @@ -962,13 +795,13 @@ static int uvc_ioctl_g_input(struct file *file, void *fh, unsigned int *input)
>>  static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
>>  {
>>  	struct uvc_fh *handle = fh;
>> +	struct uvc_streaming *stream = handle->stream;
>>  	struct uvc_video_chain *chain = handle->chain;
>>  	u8 *buf;
>>  	int ret;
>>  
>> -	ret = uvc_acquire_privileges(handle);
>> -	if (ret < 0)
>> -		return ret;
>> +	if (vb2_is_busy(&stream->queue.queue))
>> +		return -EBUSY;
>>  
>>  	if (chain->selector == NULL ||
>>  	    (chain->dev->quirks & UVC_QUIRK_IGNORE_SELECTOR_UNIT)) {
>> @@ -1471,50 +1304,6 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
>>  	return ret;
>>  }
>>  
>> -static ssize_t uvc_v4l2_read(struct file *file, char __user *data,
>> -		    size_t count, loff_t *ppos)
>> -{
>> -	struct uvc_fh *handle = file->private_data;
>> -	struct uvc_streaming *stream = handle->stream;
>> -
>> -	uvc_dbg(stream->dev, CALLS, "%s: not implemented\n", __func__);
>> -	return -EINVAL;
>> -}
>> -
>> -static int uvc_v4l2_mmap(struct file *file, struct vm_area_struct *vma)
>> -{
>> -	struct uvc_fh *handle = file->private_data;
>> -	struct uvc_streaming *stream = handle->stream;
>> -
>> -	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
>> -
>> -	return uvc_queue_mmap(&stream->queue, vma);
>> -}
>> -
>> -static __poll_t uvc_v4l2_poll(struct file *file, poll_table *wait)
>> -{
>> -	struct uvc_fh *handle = file->private_data;
>> -	struct uvc_streaming *stream = handle->stream;
>> -
>> -	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
>> -
>> -	return uvc_queue_poll(&stream->queue, file, wait);
>> -}
>> -
>> -#ifndef CONFIG_MMU
>> -static unsigned long uvc_v4l2_get_unmapped_area(struct file *file,
>> -		unsigned long addr, unsigned long len, unsigned long pgoff,
>> -		unsigned long flags)
>> -{
>> -	struct uvc_fh *handle = file->private_data;
>> -	struct uvc_streaming *stream = handle->stream;
>> -
>> -	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
>> -
>> -	return uvc_queue_get_unmapped_area(&stream->queue, pgoff);
>> -}
>> -#endif
>> -
>>  const struct v4l2_ioctl_ops uvc_ioctl_ops = {
>>  	.vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt,
>>  	.vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt,
>> @@ -1527,12 +1316,13 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
>>  	.vidioc_enum_fmt_vid_out = uvc_ioctl_enum_fmt,
>>  	.vidioc_try_fmt_vid_cap = uvc_ioctl_try_fmt,
>>  	.vidioc_try_fmt_vid_out = uvc_ioctl_try_fmt,
>> -	.vidioc_reqbufs = uvc_ioctl_reqbufs,
>> -	.vidioc_querybuf = uvc_ioctl_querybuf,
>> -	.vidioc_qbuf = uvc_ioctl_qbuf,
>> -	.vidioc_expbuf = uvc_ioctl_expbuf,
>> -	.vidioc_dqbuf = uvc_ioctl_dqbuf,
>> -	.vidioc_create_bufs = uvc_ioctl_create_bufs,
>> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
>> +	.vidioc_querybuf = vb2_ioctl_querybuf,
>> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
>> +	.vidioc_qbuf = vb2_ioctl_qbuf,
>> +	.vidioc_expbuf = vb2_ioctl_expbuf,
>> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
>> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
>>  	.vidioc_streamon = uvc_ioctl_streamon,
>>  	.vidioc_streamoff = uvc_ioctl_streamoff,
>>  	.vidioc_enum_input = uvc_ioctl_enum_input,
>> @@ -1559,11 +1349,10 @@ const struct v4l2_file_operations uvc_fops = {
>>  #ifdef CONFIG_COMPAT
>>  	.compat_ioctl32	= uvc_v4l2_compat_ioctl32,
>>  #endif
>> -	.read		= uvc_v4l2_read,
>> -	.mmap		= uvc_v4l2_mmap,
>> -	.poll		= uvc_v4l2_poll,
>> +	.mmap		= vb2_fop_mmap,
>> +	.poll		= vb2_fop_poll,
>>  #ifndef CONFIG_MMU
>> -	.get_unmapped_area = uvc_v4l2_get_unmapped_area,
>> +	.get_unmapped_area = vb2_fop_get_unmapped_area,
>>  #endif
>>  };
>>  
>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>> index b9f8eb62ba1d82ea7788cf6c10cc838a429dbc9e..3ddbf065a2cbae40ee48cb06f84ca8f0052990c4 100644
>> --- a/drivers/media/usb/uvc/uvcvideo.h
>> +++ b/drivers/media/usb/uvc/uvcvideo.h
>> @@ -326,7 +326,10 @@ struct uvc_buffer {
>>  
>>  struct uvc_video_queue {
>>  	struct vb2_queue queue;
>> -	struct mutex mutex;			/* Protects queue */
>> +	struct mutex mutex;			/*
>> +						 * Serializes vb2_queue and
>> +						 * fops
>> +						 */
>>  
>>  	unsigned int flags;
>>  	unsigned int buf_used;
>> @@ -349,7 +352,6 @@ struct uvc_video_chain {
>>  						 * uvc_fh.pending_async_ctrls
>>  						 */
>>  
>> -	struct v4l2_prio_state prio;		/* V4L2 priority state */
>>  	u32 caps;				/* V4L2 chain-wide caps */
>>  	u8 ctrl_class_bitmap;			/* Bitmap of valid classes */
>>  };
>> @@ -619,16 +621,10 @@ struct uvc_device {
>>  	struct uvc_entity *gpio_unit;
>>  };
>>  
>> -enum uvc_handle_state {
>> -	UVC_HANDLE_PASSIVE	= 0,
>> -	UVC_HANDLE_ACTIVE	= 1,
>> -};
>> -
>>  struct uvc_fh {
>>  	struct v4l2_fh vfh;
>>  	struct uvc_video_chain *chain;
>>  	struct uvc_streaming *stream;
>> -	enum uvc_handle_state state;
>>  	unsigned int pending_async_ctrls;
>>  	bool is_streaming;
>>  };
>> @@ -687,36 +683,11 @@ struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
>>  
>>  /* Video buffers queue management. */
>>  int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type);
>> -void uvc_queue_release(struct uvc_video_queue *queue);
>> -int uvc_request_buffers(struct uvc_video_queue *queue,
>> -			struct v4l2_requestbuffers *rb);
>> -int uvc_query_buffer(struct uvc_video_queue *queue,
>> -		     struct v4l2_buffer *v4l2_buf);
>> -int uvc_create_buffers(struct uvc_video_queue *queue,
>> -		       struct v4l2_create_buffers *v4l2_cb);
>> -int uvc_queue_buffer(struct uvc_video_queue *queue,
>> -		     struct media_device *mdev,
>> -		     struct v4l2_buffer *v4l2_buf);
>> -int uvc_export_buffer(struct uvc_video_queue *queue,
>> -		      struct v4l2_exportbuffer *exp);
>> -int uvc_dequeue_buffer(struct uvc_video_queue *queue,
>> -		       struct v4l2_buffer *v4l2_buf, int nonblocking);
>> -int uvc_queue_streamon(struct uvc_video_queue *queue, enum v4l2_buf_type type);
>> -int uvc_queue_streamoff(struct uvc_video_queue *queue, enum v4l2_buf_type type);
>>  void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect);
>>  struct uvc_buffer *uvc_queue_next_buffer(struct uvc_video_queue *queue,
>>  					 struct uvc_buffer *buf);
>>  struct uvc_buffer *uvc_queue_get_current_buffer(struct uvc_video_queue *queue);
>>  void uvc_queue_buffer_release(struct uvc_buffer *buf);
>> -int uvc_queue_mmap(struct uvc_video_queue *queue,
>> -		   struct vm_area_struct *vma);
>> -__poll_t uvc_queue_poll(struct uvc_video_queue *queue, struct file *file,
>> -			poll_table *wait);
>> -#ifndef CONFIG_MMU
>> -unsigned long uvc_queue_get_unmapped_area(struct uvc_video_queue *queue,
>> -					  unsigned long pgoff);
>> -#endif
>> -int uvc_queue_allocated(struct uvc_video_queue *queue);
>>  static inline int uvc_queue_streaming(struct uvc_video_queue *queue)
>>  {
>>  	return vb2_is_streaming(&queue->queue);
>>
> 
> 


