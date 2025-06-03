Return-Path: <linux-media+bounces-33971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 061E5ACC08B
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 08:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1C7816E99A
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 06:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA992686B3;
	Tue,  3 Jun 2025 06:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="I0viC5h7"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B006E267F64;
	Tue,  3 Jun 2025 06:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748933751; cv=none; b=Cf7gGSyp4GkM7CrrxLiTZq5df82/Eao2DfWpLvcElC0OR/CcVBkwi5/oaFNj/cYgYHapVhuozqu+RiMXLfMr4PVxciX1XOUBbssAUKHCnQKwXyRbGxOFauXWoEa9JCtiBDcbQ70Ixb8y3zFGMOEBbVEMqlqYAwT6SaSqHs7Rm5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748933751; c=relaxed/simple;
	bh=Z+GgsaqGU61PZMfGUMFIlwr2xnL5yf6NN1DcMupJunE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s24XjbbiHYo6nddAlazLk5NEDxSCdJdLIOX4vwE8/fJKSB29Jn0In6eCyPIKmI9qLEBxFabw+k71b/fu4QvT+H32zj56t61E0SqQ9528y/wq9h2G+vlmrViloC8uSq2a6hffBVu3LsgKXe533UxYKwU10MNaKrze6gNOQv+0vuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=I0viC5h7; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4bBM182H4pztMk;
	Tue,  3 Jun 2025 06:55:40 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.107]) by freedom.nl (Postfix) with ESMTPSA id 4bBM1754ysz3s;
	Tue,  3 Jun 2025 06:55:39 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=I0viC5h7;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1748933740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CZpvOjw9/ABjkNfzGqJlSNLXzF1yDZp4NYSUd9ywbmg=;
	b=I0viC5h7vtPtu8K8W7tOAIE0qaqxb+O3SdlpHjAitlsXd0KTBPQbD3MQOBhwx+2ycu7lad
	w26CSi2B6Rl2qSdwm+VvNxxqIh1kbu+Krx01xGo6HugPoZGEDgFMhz7ANI5NUsbMRlGdnK
	L6FptXmPV2jbqNpBZrPzy8q0jEbP0wFhxSiUicOfc6CTfHa88jDSVK7+1g2bHbShHphz3E
	ahkn7bV04NlK4TP6G/myTjIdn0Ke+nU8E0rKE1fszZnKL2CfeHUY0WUboQAn1hYEdTkUx0
	K2MxQUSBSXlTapGYruVcoNtU88LPpJ66Zt4pgCja9kYb0xSsFg35JSsetDKB+g==
X-CM-Envelope: MS4xfEgEEajr22et7DMf8lv0T/SDFVQP5UvSGUeH44LzVytlLLK2iUsvb9bVOBTsCUWPVqdaeR/8lMyW0CZqChwClqtcsMXNJfq2Ytqsdx4d4KHRTzjFCda4 ftu3MLmsYKYVnG8afxJ60l8h7SGYC8KB5Lbd5+1JUHZ+j4wmqQe4ZjV3z+IgFzeQMPPhQ5cU90Cdk71sX1RDsgqaJV5VIU8jemJYL4RPbByZUxSATXmkeKaD ipUWoqMEkeU9NiduPLN7tCigW1FdB6h1h52rb99BXhSVkl/96w3wrrDOvOsX3OXUFREBSOXvaIj+eCEriLvDV9oXjj2SPGT7YSniqlzzmOyyyb6di4s5wR9N u+L6XL9NWcfwtDUE5rC0mm/0YVY1V01ax7I4ZcBHh7ihRx3e7tJJefinrZsiL7SOjI80DsncAJKbpu//j6BmWSr3QWva9Q==
X-CM-Analysis: v=2.4 cv=UsCZN/wB c=1 sm=1 tr=0 ts=683e9c6c a=smkfPCmiGCBx+NgG8pXs4w==:117 a=smkfPCmiGCBx+NgG8pXs4w==:17 a=IkcTkHD0fZMA:10 a=WN6_cwnCAAAA:8 a=VwQbUJbxAAAA:8 a=xOd6jRPJAAAA:8 a=cm27Pg_UAAAA:8 a=EGs5MZ_5mj1mWneqsYMA:9 a=QEXdDO2ut3YA:10 a=ndfOWLLM0rR49n6Yv1rF:22
Message-ID: <41650f90-1411-4ce4-96e3-aa03f776f468@jjverkuil.nl>
Date: Tue, 3 Jun 2025 08:55:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] media: uvcvideo: Use vb2 ioctl and fop helpers
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>
References: <20250602-uvc-fop-v2-0-508a293eae81@chromium.org>
 <20250602-uvc-fop-v2-2-508a293eae81@chromium.org>
 <20250602183126.GI23515@pendragon.ideasonboard.com>
 <60a4ef1b-c065-4ccc-b0f9-ad089c369a7f@xs4all.nl>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <60a4ef1b-c065-4ccc-b0f9-ad089c369a7f@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

On 02/06/2025 21:58, Hans Verkuil wrote:
> On 02/06/2025 20:31, Laurent Pinchart wrote:
>> Hi Ricardo, Hans,
>>
>> On Mon, Jun 02, 2025 at 12:59:03PM +0000, Ricardo Ribalda wrote:
>>> From: Hans Verkuil <hans@jjverkuil.nl>
>>>
>>> When uvc was written the vb2 ioctl and file operation helpers didn't exist.
>>>
>>> This patch switches uvc over to those helpers, which removes a lot of
>>> boilerplate code and simplifies VIDIOC_G/S_PRIORITY handling
>>
>> How does it simplify VIDIOC_[GS]_PRIORITY handling ? The only thing this
>> patch does related to priority is replace the per-chain priority
>> handling with a per-device (as in uvc_device) priority, as the default
>> is to use the prio state from v4l2_device. I think this is actually
>> incorrect, a UVC device can have multiple independent streaming
>> interfaces, so the priority ioctls should no operate on a device-wide
>> prio state. Am I missing something ?
> 
> The prio handling is per video_device. So an application that opens
> /dev/videoX can raise the priority on the file handle to prevent other
> applications that open the same video device from making changes.

Sorry, ignore that reply. I hadn't noticed that vdev->prio was set to
the per-chain prio.

I'm not sure why I dropped that in my original patch. It certainly should
be split off, but probably just dropped, unless v4l2-compliance complains
about it. But in that case, perhaps v4l2-compliance needs to be changed.

To be honest, I haven't paid attention to priorities for many, many years,
so I would have to dig more into this.

For now I agree that this prio change doesn't belong in this patch.

Regards,

	Hans

> 
>>
>>> and allows us
>>> to drop the 'privileges' scheme, since that's now handled inside the vb2
>>> helpers.
>>
>> That part is correct. The driver implements a privilege-management
>> system similar to the vb2_queue_is_busy() checks in the vb2 ioctl
>> handlers, as the ioctl handlers didn't exist back then.
>>
>> Please reword the commit message to make this clearer. If the prio
>> change is also desired, it should be split in a separate patch.
>>
>>> This makes it possible for uvc to fix the v4l2-compliance streaming tests:
>>>  warn: v4l2-test-formats.cpp(1075): Could not set fmt2
>>>
>>> This patch introduces a change on behavior on the uvcdriver to be
>>> aligned with the rest of the subsystem. Now S_INPUT, S_PARM and
>>> S_FORMAT do no grant exclusive ownership of the device.
>>
>> There are other changes in behaviour worth noting, some small, some
>> quite substantial. Let's start with the small one: .vidioc_querybuf()
>> now succeeds when the queue is busy. It seems a check may be missing in
>> v4l2-compliance for this.
> 
> It is perfectly fine querying buffers even if the queue is busy, it doesn't
> affect streaming.
> 
> Regards,
> 
> 	Hans
> 
>>
>> The bigger change is related to locking. See below.
>>
>>> Reviewed-by: Hans de Goede <hansg@kernel.org>
>>> Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
>>> Signed-off-by: Hans Verkuil <hans@jjverkuil.nl>
>>> Co-developed-by: Ricardo Ribalda <ribalda@chromium.org>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>>  drivers/media/usb/uvc/uvc_driver.c   |  34 +----
>>>  drivers/media/usb/uvc/uvc_metadata.c |   8 +-
>>>  drivers/media/usb/uvc/uvc_queue.c    | 143 --------------------
>>>  drivers/media/usb/uvc/uvc_v4l2.c     | 251 +++--------------------------------
>>>  drivers/media/usb/uvc/uvcvideo.h     |  37 +-----
>>>  5 files changed, 30 insertions(+), 443 deletions(-)
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>>> index da24a655ab68cc0957762f2b67387677c22224d1..4eeedab93b90939fc4c925012a18b7d018ade39f 100644
>>> --- a/drivers/media/usb/uvc/uvc_driver.c
>>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>>> @@ -1725,7 +1725,6 @@ static struct uvc_video_chain *uvc_alloc_chain(struct uvc_device *dev)
>>>  	INIT_LIST_HEAD(&chain->entities);
>>>  	mutex_init(&chain->ctrl_mutex);
>>>  	chain->dev = dev;
>>> -	v4l2_prio_init(&chain->prio);
>>>  
>>>  	return chain;
>>>  }
>>> @@ -1958,31 +1957,7 @@ static void uvc_unregister_video(struct uvc_device *dev)
>>>  		if (!video_is_registered(&stream->vdev))
>>>  			continue;
>>>  
>>> -		/*
>>> -		 * For stream->vdev we follow the same logic as:
>>> -		 * vb2_video_unregister_device().
>>> -		 */
>>> -
>>> -		/* 1. Take a reference to vdev */
>>> -		get_device(&stream->vdev.dev);
>>> -
>>> -		/* 2. Ensure that no new ioctls can be called. */
>>> -		video_unregister_device(&stream->vdev);
>>> -
>>> -		/* 3. Wait for old ioctls to finish. */
>>> -		mutex_lock(&stream->mutex);
>>> -
>>> -		/* 4. Stop streaming. */
>>> -		uvc_queue_release(&stream->queue);
>>> -
>>> -		mutex_unlock(&stream->mutex);
>>> -
>>> -		put_device(&stream->vdev.dev);
>>> -
>>> -		/*
>>> -		 * For stream->meta.vdev we can directly call:
>>> -		 * vb2_video_unregister_device().
>>> -		 */
>>> +		vb2_video_unregister_device(&stream->vdev);
>>>  		vb2_video_unregister_device(&stream->meta.vdev);
>>>  
>>>  		/*
>>> @@ -2029,7 +2004,8 @@ int uvc_register_video_device(struct uvc_device *dev,
>>>  	vdev->fops = fops;
>>>  	vdev->ioctl_ops = ioctl_ops;
>>>  	vdev->release = uvc_release;
>>> -	vdev->prio = &stream->chain->prio;
>>> +	vdev->queue = &queue->queue;
>>> +	vdev->lock = &queue->mutex;
>>
>> This will cause the ioctl handlers to use queue->mutex for all ioctls
>> (both INFO_FL_QUEUE and !INFO_FL_QUEUE). Locking therefore gets more
>> coarse, that should be mentioned in the commit message.
>>
>>>  	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
>>>  		vdev->vfl_dir = VFL_DIR_TX;
>>>  	else
>>> @@ -2399,8 +2375,8 @@ static int __uvc_resume(struct usb_interface *intf, int reset)
>>>  		if (stream->intf == intf) {
>>>  			ret = uvc_video_resume(stream, reset);
>>>  			if (ret < 0)
>>> -				uvc_queue_streamoff(&stream->queue,
>>> -						    stream->queue.queue.type);
>>> +				vb2_streamoff(&stream->queue.queue,
>>> +					      stream->queue.queue.type);
>>
>> This doesn't take any lock anymore. Can that be a problem ?
>>
>>>  			return ret;
>>>  		}
>>>  	}
>>> diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
>>> index 82de7781f5b6b70c5ba16bcba9e0741231231904..d3aab22f91cea21aefc56409924dfa1451aec914 100644
>>> --- a/drivers/media/usb/uvc/uvc_metadata.c
>>> +++ b/drivers/media/usb/uvc/uvc_metadata.c
>>> @@ -96,7 +96,7 @@ static int uvc_meta_v4l2_set_format(struct file *file, void *fh,
>>>  	 */
>>>  	mutex_lock(&stream->mutex);
>>
>> Is this lock still needed ? More broadly speaking, what's the remaining
>> purpose of stream->mutex ? Or perhaps the other way around, shouldn't we
>> drop queue->mutex, and use stream->mutex everywhere instead ?
>>
>>>  
>>> -	if (uvc_queue_allocated(&stream->queue))
>>> +	if (vb2_is_busy(&stream->meta.queue.queue))
>>>  		ret = -EBUSY;
>>>  	else
>>>  		stream->meta.format = fmt->dataformat;
>>> @@ -164,12 +164,6 @@ int uvc_meta_register(struct uvc_streaming *stream)
>>>  
>>>  	stream->meta.format = V4L2_META_FMT_UVC;
>>>  
>>> -	/*
>>> -	 * The video interface queue uses manual locking and thus does not set
>>> -	 * the queue pointer. Set it manually here.
>>> -	 */
>>> -	vdev->queue = &queue->queue;
>>> -
>>>  	return uvc_register_video_device(dev, stream, vdev, queue,
>>>  					 V4L2_BUF_TYPE_META_CAPTURE,
>>>  					 &uvc_meta_fops, &uvc_meta_ioctl_ops);
>>> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
>>> index 2ee142621042167c2587b6a6fdd51c1a46d31c11..72c5494dee9f46ff61072e7d293bfaddda40e615 100644
>>> --- a/drivers/media/usb/uvc/uvc_queue.c
>>> +++ b/drivers/media/usb/uvc/uvc_queue.c
>>> @@ -242,153 +242,10 @@ int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)
>>>  	return 0;
>>>  }
>>>  
>>> -void uvc_queue_release(struct uvc_video_queue *queue)
>>> -{
>>> -	mutex_lock(&queue->mutex);
>>> -	vb2_queue_release(&queue->queue);
>>> -	mutex_unlock(&queue->mutex);
>>> -}
>>> -
>>> -/* -----------------------------------------------------------------------------
>>> - * V4L2 queue operations
>>> - */
>>> -
>>> -int uvc_request_buffers(struct uvc_video_queue *queue,
>>> -			struct v4l2_requestbuffers *rb)
>>> -{
>>> -	int ret;
>>> -
>>> -	mutex_lock(&queue->mutex);
>>> -	ret = vb2_reqbufs(&queue->queue, rb);
>>> -	mutex_unlock(&queue->mutex);
>>> -
>>> -	return ret ? ret : rb->count;
>>> -}
>>> -
>>> -int uvc_query_buffer(struct uvc_video_queue *queue, struct v4l2_buffer *buf)
>>> -{
>>> -	int ret;
>>> -
>>> -	mutex_lock(&queue->mutex);
>>> -	ret = vb2_querybuf(&queue->queue, buf);
>>> -	mutex_unlock(&queue->mutex);
>>> -
>>> -	return ret;
>>> -}
>>> -
>>> -int uvc_create_buffers(struct uvc_video_queue *queue,
>>> -		       struct v4l2_create_buffers *cb)
>>> -{
>>> -	int ret;
>>> -
>>> -	mutex_lock(&queue->mutex);
>>> -	ret = vb2_create_bufs(&queue->queue, cb);
>>> -	mutex_unlock(&queue->mutex);
>>> -
>>> -	return ret;
>>> -}
>>> -
>>> -int uvc_queue_buffer(struct uvc_video_queue *queue,
>>> -		     struct media_device *mdev, struct v4l2_buffer *buf)
>>> -{
>>> -	int ret;
>>> -
>>> -	mutex_lock(&queue->mutex);
>>> -	ret = vb2_qbuf(&queue->queue, mdev, buf);
>>> -	mutex_unlock(&queue->mutex);
>>> -
>>> -	return ret;
>>> -}
>>> -
>>> -int uvc_export_buffer(struct uvc_video_queue *queue,
>>> -		      struct v4l2_exportbuffer *exp)
>>> -{
>>> -	int ret;
>>> -
>>> -	mutex_lock(&queue->mutex);
>>> -	ret = vb2_expbuf(&queue->queue, exp);
>>> -	mutex_unlock(&queue->mutex);
>>> -
>>> -	return ret;
>>> -}
>>> -
>>> -int uvc_dequeue_buffer(struct uvc_video_queue *queue, struct v4l2_buffer *buf,
>>> -		       int nonblocking)
>>> -{
>>> -	int ret;
>>> -
>>> -	mutex_lock(&queue->mutex);
>>> -	ret = vb2_dqbuf(&queue->queue, buf, nonblocking);
>>> -	mutex_unlock(&queue->mutex);
>>> -
>>> -	return ret;
>>> -}
>>> -
>>> -int uvc_queue_streamon(struct uvc_video_queue *queue, enum v4l2_buf_type type)
>>> -{
>>> -	int ret;
>>> -
>>> -	mutex_lock(&queue->mutex);
>>> -	ret = vb2_streamon(&queue->queue, type);
>>> -	mutex_unlock(&queue->mutex);
>>> -
>>> -	return ret;
>>> -}
>>> -
>>> -int uvc_queue_streamoff(struct uvc_video_queue *queue, enum v4l2_buf_type type)
>>> -{
>>> -	int ret;
>>> -
>>> -	mutex_lock(&queue->mutex);
>>> -	ret = vb2_streamoff(&queue->queue, type);
>>> -	mutex_unlock(&queue->mutex);
>>> -
>>> -	return ret;
>>> -}
>>> -
>>> -int uvc_queue_mmap(struct uvc_video_queue *queue, struct vm_area_struct *vma)
>>> -{
>>> -	return vb2_mmap(&queue->queue, vma);
>>> -}
>>> -
>>> -#ifndef CONFIG_MMU
>>> -unsigned long uvc_queue_get_unmapped_area(struct uvc_video_queue *queue,
>>> -		unsigned long pgoff)
>>> -{
>>> -	return vb2_get_unmapped_area(&queue->queue, 0, 0, pgoff, 0);
>>> -}
>>> -#endif
>>> -
>>> -__poll_t uvc_queue_poll(struct uvc_video_queue *queue, struct file *file,
>>> -			    poll_table *wait)
>>> -{
>>> -	__poll_t ret;
>>> -
>>> -	mutex_lock(&queue->mutex);
>>> -	ret = vb2_poll(&queue->queue, file, wait);
>>> -	mutex_unlock(&queue->mutex);
>>> -
>>> -	return ret;
>>> -}
>>> -
>>>  /* -----------------------------------------------------------------------------
>>>   *
>>>   */
>>>  
>>> -/*
>>> - * Check if buffers have been allocated.
>>> - */
>>> -int uvc_queue_allocated(struct uvc_video_queue *queue)
>>> -{
>>> -	int allocated;
>>> -
>>> -	mutex_lock(&queue->mutex);
>>> -	allocated = vb2_is_busy(&queue->queue);
>>> -	mutex_unlock(&queue->mutex);
>>> -
>>> -	return allocated;
>>> -}
>>> -
>>>  /*
>>>   * Cancel the video buffers queue.
>>>   *
>>> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
>>> index 862b4e34e5b629cf324479a9bb59ebe8784ccd5d..7a5ecbefa32c0a6b74c85d7f77a25b433598471e 100644
>>> --- a/drivers/media/usb/uvc/uvc_v4l2.c
>>> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
>>> @@ -47,8 +47,6 @@ void uvc_pm_put(struct uvc_device *dev)
>>>  	usb_autopm_put_interface(dev->intf);
>>>  }
>>>  
>>> -static int uvc_acquire_privileges(struct uvc_fh *handle);
>>> -
>>>  static int uvc_control_add_xu_mapping(struct uvc_video_chain *chain,
>>>  				      struct uvc_control_mapping *map,
>>>  				      const struct uvc_xu_control_mapping *xmap)
>>> @@ -436,10 +434,6 @@ static int uvc_ioctl_s_fmt(struct file *file, void *fh,
>>>  	const struct uvc_frame *frame;
>>>  	int ret;
>>>  
>>> -	ret = uvc_acquire_privileges(handle);
>>> -	if (ret < 0)
>>> -		return ret;
>>> -
>>>  	if (fmt->type != stream->type)
>>>  		return -EINVAL;
>>>  
>>> @@ -448,8 +442,7 @@ static int uvc_ioctl_s_fmt(struct file *file, void *fh,
>>>  		return ret;
>>>  
>>>  	mutex_lock(&stream->mutex);
>>> -
>>> -	if (uvc_queue_allocated(&stream->queue)) {
>>> +	if (vb2_is_busy(&stream->queue.queue)) {
>>>  		ret = -EBUSY;
>>>  		goto done;
>>>  	}
>>> @@ -513,10 +506,6 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
>>>  	unsigned int i;
>>>  	int ret;
>>>  
>>> -	ret = uvc_acquire_privileges(handle);
>>> -	if (ret < 0)
>>> -		return ret;
>>> -
>>>  	if (parm->type != stream->type)
>>>  		return -EINVAL;
>>>  
>>> @@ -593,63 +582,6 @@ static int uvc_ioctl_s_parm(struct file *file, void *fh,
>>>  	return 0;
>>>  }
>>>  
>>> -/* ------------------------------------------------------------------------
>>> - * Privilege management
>>> - */
>>> -
>>> -/*
>>> - * Privilege management is the multiple-open implementation basis. The current
>>> - * implementation is completely transparent for the end-user and doesn't
>>> - * require explicit use of the VIDIOC_G_PRIORITY and VIDIOC_S_PRIORITY ioctls.
>>> - * Those ioctls enable finer control on the device (by making possible for a
>>> - * user to request exclusive access to a device), but are not mature yet.
>>> - * Switching to the V4L2 priority mechanism might be considered in the future
>>> - * if this situation changes.
>>> - *
>>> - * Each open instance of a UVC device can either be in a privileged or
>>> - * unprivileged state. Only a single instance can be in a privileged state at
>>> - * a given time. Trying to perform an operation that requires privileges will
>>> - * automatically acquire the required privileges if possible, or return -EBUSY
>>> - * otherwise. Privileges are dismissed when closing the instance or when
>>> - * freeing the video buffers using VIDIOC_REQBUFS.
>>> - *
>>> - * Operations that require privileges are:
>>> - *
>>> - * - VIDIOC_S_INPUT
>>> - * - VIDIOC_S_PARM
>>> - * - VIDIOC_S_FMT
>>> - * - VIDIOC_CREATE_BUFS
>>> - * - VIDIOC_REQBUFS
>>> - */
>>> -static int uvc_acquire_privileges(struct uvc_fh *handle)
>>> -{
>>> -	/* Always succeed if the handle is already privileged. */
>>> -	if (handle->state == UVC_HANDLE_ACTIVE)
>>> -		return 0;
>>> -
>>> -	/* Check if the device already has a privileged handle. */
>>> -	if (atomic_inc_return(&handle->stream->active) != 1) {
>>> -		atomic_dec(&handle->stream->active);
>>> -		return -EBUSY;
>>> -	}
>>> -
>>> -	handle->state = UVC_HANDLE_ACTIVE;
>>> -	return 0;
>>> -}
>>> -
>>> -static void uvc_dismiss_privileges(struct uvc_fh *handle)
>>> -{
>>> -	if (handle->state == UVC_HANDLE_ACTIVE)
>>> -		atomic_dec(&handle->stream->active);
>>> -
>>> -	handle->state = UVC_HANDLE_PASSIVE;
>>> -}
>>> -
>>> -static int uvc_has_privileges(struct uvc_fh *handle)
>>> -{
>>> -	return handle->state == UVC_HANDLE_ACTIVE;
>>> -}
>>> -
>>>  /* ------------------------------------------------------------------------
>>>   * V4L2 file operations
>>>   */
>>> @@ -671,7 +603,6 @@ static int uvc_v4l2_open(struct file *file)
>>>  	v4l2_fh_add(&handle->vfh);
>>>  	handle->chain = stream->chain;
>>>  	handle->stream = stream;
>>> -	handle->state = UVC_HANDLE_PASSIVE;
>>>  	file->private_data = handle;
>>>  
>>>  	return 0;
>>> @@ -686,18 +617,11 @@ static int uvc_v4l2_release(struct file *file)
>>>  
>>>  	uvc_ctrl_cleanup_fh(handle);
>>>  
>>> -	/* Only free resources if this is a privileged handle. */
>>> -	if (uvc_has_privileges(handle))
>>> -		uvc_queue_release(&stream->queue);
>>> -
>>>  	if (handle->is_streaming)
>>>  		uvc_pm_put(stream->dev);
>>>  
>>>  	/* Release the file handle. */
>>> -	uvc_dismiss_privileges(handle);
>>> -	v4l2_fh_del(&handle->vfh);
>>> -	v4l2_fh_exit(&handle->vfh);
>>> -	kfree(handle);
>>> +	vb2_fop_release(file);
>>>  	file->private_data = NULL;
>>
>> You can drop setting private_data to NULL, it's done by
>> v4l2_fh_release() called by vb2_fop_release().
>>
>>>  
>>>  	return 0;
>>> @@ -753,91 +677,6 @@ static int uvc_ioctl_try_fmt(struct file *file, void *fh,
>>>  	return uvc_v4l2_try_format(stream, fmt, &probe, NULL, NULL);
>>>  }
>>>  
>>> -static int uvc_ioctl_reqbufs(struct file *file, void *fh,
>>> -			     struct v4l2_requestbuffers *rb)
>>> -{
>>> -	struct uvc_fh *handle = fh;
>>> -	struct uvc_streaming *stream = handle->stream;
>>> -	int ret;
>>> -
>>> -	ret = uvc_acquire_privileges(handle);
>>> -	if (ret < 0)
>>> -		return ret;
>>> -
>>> -	mutex_lock(&stream->mutex);
>>> -	ret = uvc_request_buffers(&stream->queue, rb);
>>> -	mutex_unlock(&stream->mutex);
>>> -	if (ret < 0)
>>> -		return ret;
>>> -
>>> -	if (ret == 0)
>>> -		uvc_dismiss_privileges(handle);
>>> -
>>> -	return 0;
>>> -}
>>> -
>>> -static int uvc_ioctl_querybuf(struct file *file, void *fh,
>>> -			      struct v4l2_buffer *buf)
>>> -{
>>> -	struct uvc_fh *handle = fh;
>>> -	struct uvc_streaming *stream = handle->stream;
>>> -
>>> -	if (!uvc_has_privileges(handle))
>>> -		return -EBUSY;
>>> -
>>> -	return uvc_query_buffer(&stream->queue, buf);
>>> -}
>>> -
>>> -static int uvc_ioctl_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
>>> -{
>>> -	struct uvc_fh *handle = fh;
>>> -	struct uvc_streaming *stream = handle->stream;
>>> -
>>> -	if (!uvc_has_privileges(handle))
>>> -		return -EBUSY;
>>> -
>>> -	return uvc_queue_buffer(&stream->queue,
>>> -				stream->vdev.v4l2_dev->mdev, buf);
>>> -}
>>> -
>>> -static int uvc_ioctl_expbuf(struct file *file, void *fh,
>>> -			    struct v4l2_exportbuffer *exp)
>>> -{
>>> -	struct uvc_fh *handle = fh;
>>> -	struct uvc_streaming *stream = handle->stream;
>>> -
>>> -	if (!uvc_has_privileges(handle))
>>> -		return -EBUSY;
>>> -
>>> -	return uvc_export_buffer(&stream->queue, exp);
>>> -}
>>> -
>>> -static int uvc_ioctl_dqbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
>>> -{
>>> -	struct uvc_fh *handle = fh;
>>> -	struct uvc_streaming *stream = handle->stream;
>>> -
>>> -	if (!uvc_has_privileges(handle))
>>> -		return -EBUSY;
>>> -
>>> -	return uvc_dequeue_buffer(&stream->queue, buf,
>>> -				  file->f_flags & O_NONBLOCK);
>>> -}
>>> -
>>> -static int uvc_ioctl_create_bufs(struct file *file, void *fh,
>>> -				  struct v4l2_create_buffers *cb)
>>> -{
>>> -	struct uvc_fh *handle = fh;
>>> -	struct uvc_streaming *stream = handle->stream;
>>> -	int ret;
>>> -
>>> -	ret = uvc_acquire_privileges(handle);
>>> -	if (ret < 0)
>>> -		return ret;
>>> -
>>> -	return uvc_create_buffers(&stream->queue, cb);
>>> -}
>>> -
>>>  static int uvc_ioctl_streamon(struct file *file, void *fh,
>>>  			      enum v4l2_buf_type type)
>>>  {
>>> @@ -845,11 +684,6 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
>>>  	struct uvc_streaming *stream = handle->stream;
>>>  	int ret;
>>>  
>>> -	if (!uvc_has_privileges(handle))
>>> -		return -EBUSY;
>>> -
>>> -	guard(mutex)(&stream->mutex);
>>> -
>>>  	if (handle->is_streaming)
>>>  		return 0;
>>>  
>>> @@ -857,7 +691,7 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
>>>  	if (ret)
>>>  		return ret;
>>>  
>>> -	ret = uvc_queue_streamon(&stream->queue, type);
>>> +	ret = vb2_ioctl_streamon(file, fh, type);
>>>  	if (ret) {
>>>  		uvc_pm_put(stream->dev);
>>>  		return ret;
>>> @@ -873,13 +707,12 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
>>>  {
>>>  	struct uvc_fh *handle = fh;
>>>  	struct uvc_streaming *stream = handle->stream;
>>> +	int ret;
>>>  
>>> -	if (!uvc_has_privileges(handle))
>>> -		return -EBUSY;
>>> -
>>> -	guard(mutex)(&stream->mutex);
>>> +	ret = vb2_ioctl_streamoff(file, fh, type);
>>> +	if (ret)
>>> +		return ret;
>>>  
>>> -	uvc_queue_streamoff(&stream->queue, type);
>>>  	if (handle->is_streaming) {
>>>  		handle->is_streaming = false;
>>>  		uvc_pm_put(stream->dev);
>>> @@ -962,13 +795,13 @@ static int uvc_ioctl_g_input(struct file *file, void *fh, unsigned int *input)
>>>  static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
>>>  {
>>>  	struct uvc_fh *handle = fh;
>>> +	struct uvc_streaming *stream = handle->stream;
>>>  	struct uvc_video_chain *chain = handle->chain;
>>>  	u8 *buf;
>>>  	int ret;
>>>  
>>> -	ret = uvc_acquire_privileges(handle);
>>> -	if (ret < 0)
>>> -		return ret;
>>> +	if (vb2_is_busy(&stream->queue.queue))
>>> +		return -EBUSY;
>>>  
>>>  	if (chain->selector == NULL ||
>>>  	    (chain->dev->quirks & UVC_QUIRK_IGNORE_SELECTOR_UNIT)) {
>>> @@ -1471,50 +1304,6 @@ static long uvc_v4l2_unlocked_ioctl(struct file *file,
>>>  	return ret;
>>>  }
>>>  
>>> -static ssize_t uvc_v4l2_read(struct file *file, char __user *data,
>>> -		    size_t count, loff_t *ppos)
>>> -{
>>> -	struct uvc_fh *handle = file->private_data;
>>> -	struct uvc_streaming *stream = handle->stream;
>>> -
>>> -	uvc_dbg(stream->dev, CALLS, "%s: not implemented\n", __func__);
>>> -	return -EINVAL;
>>> -}
>>> -
>>> -static int uvc_v4l2_mmap(struct file *file, struct vm_area_struct *vma)
>>> -{
>>> -	struct uvc_fh *handle = file->private_data;
>>> -	struct uvc_streaming *stream = handle->stream;
>>> -
>>> -	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
>>> -
>>> -	return uvc_queue_mmap(&stream->queue, vma);
>>> -}
>>> -
>>> -static __poll_t uvc_v4l2_poll(struct file *file, poll_table *wait)
>>> -{
>>> -	struct uvc_fh *handle = file->private_data;
>>> -	struct uvc_streaming *stream = handle->stream;
>>> -
>>> -	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
>>> -
>>> -	return uvc_queue_poll(&stream->queue, file, wait);
>>> -}
>>> -
>>> -#ifndef CONFIG_MMU
>>> -static unsigned long uvc_v4l2_get_unmapped_area(struct file *file,
>>> -		unsigned long addr, unsigned long len, unsigned long pgoff,
>>> -		unsigned long flags)
>>> -{
>>> -	struct uvc_fh *handle = file->private_data;
>>> -	struct uvc_streaming *stream = handle->stream;
>>> -
>>> -	uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
>>> -
>>> -	return uvc_queue_get_unmapped_area(&stream->queue, pgoff);
>>> -}
>>> -#endif
>>> -
>>>  const struct v4l2_ioctl_ops uvc_ioctl_ops = {
>>>  	.vidioc_g_fmt_vid_cap = uvc_ioctl_g_fmt,
>>>  	.vidioc_g_fmt_vid_out = uvc_ioctl_g_fmt,
>>> @@ -1527,12 +1316,13 @@ const struct v4l2_ioctl_ops uvc_ioctl_ops = {
>>>  	.vidioc_enum_fmt_vid_out = uvc_ioctl_enum_fmt,
>>>  	.vidioc_try_fmt_vid_cap = uvc_ioctl_try_fmt,
>>>  	.vidioc_try_fmt_vid_out = uvc_ioctl_try_fmt,
>>> -	.vidioc_reqbufs = uvc_ioctl_reqbufs,
>>> -	.vidioc_querybuf = uvc_ioctl_querybuf,
>>> -	.vidioc_qbuf = uvc_ioctl_qbuf,
>>> -	.vidioc_expbuf = uvc_ioctl_expbuf,
>>> -	.vidioc_dqbuf = uvc_ioctl_dqbuf,
>>> -	.vidioc_create_bufs = uvc_ioctl_create_bufs,
>>> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
>>> +	.vidioc_querybuf = vb2_ioctl_querybuf,
>>> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
>>> +	.vidioc_qbuf = vb2_ioctl_qbuf,
>>> +	.vidioc_expbuf = vb2_ioctl_expbuf,
>>> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
>>> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
>>>  	.vidioc_streamon = uvc_ioctl_streamon,
>>>  	.vidioc_streamoff = uvc_ioctl_streamoff,
>>>  	.vidioc_enum_input = uvc_ioctl_enum_input,
>>> @@ -1559,11 +1349,10 @@ const struct v4l2_file_operations uvc_fops = {
>>>  #ifdef CONFIG_COMPAT
>>>  	.compat_ioctl32	= uvc_v4l2_compat_ioctl32,
>>>  #endif
>>> -	.read		= uvc_v4l2_read,
>>> -	.mmap		= uvc_v4l2_mmap,
>>> -	.poll		= uvc_v4l2_poll,
>>> +	.mmap		= vb2_fop_mmap,
>>> +	.poll		= vb2_fop_poll,
>>>  #ifndef CONFIG_MMU
>>> -	.get_unmapped_area = uvc_v4l2_get_unmapped_area,
>>> +	.get_unmapped_area = vb2_fop_get_unmapped_area,
>>>  #endif
>>>  };
>>>  
>>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>>> index b9f8eb62ba1d82ea7788cf6c10cc838a429dbc9e..3ddbf065a2cbae40ee48cb06f84ca8f0052990c4 100644
>>> --- a/drivers/media/usb/uvc/uvcvideo.h
>>> +++ b/drivers/media/usb/uvc/uvcvideo.h
>>> @@ -326,7 +326,10 @@ struct uvc_buffer {
>>>  
>>>  struct uvc_video_queue {
>>>  	struct vb2_queue queue;
>>> -	struct mutex mutex;			/* Protects queue */
>>> +	struct mutex mutex;			/*
>>> +						 * Serializes vb2_queue and
>>> +						 * fops
>>> +						 */
>>>  
>>>  	unsigned int flags;
>>>  	unsigned int buf_used;
>>> @@ -349,7 +352,6 @@ struct uvc_video_chain {
>>>  						 * uvc_fh.pending_async_ctrls
>>>  						 */
>>>  
>>> -	struct v4l2_prio_state prio;		/* V4L2 priority state */
>>>  	u32 caps;				/* V4L2 chain-wide caps */
>>>  	u8 ctrl_class_bitmap;			/* Bitmap of valid classes */
>>>  };
>>> @@ -619,16 +621,10 @@ struct uvc_device {
>>>  	struct uvc_entity *gpio_unit;
>>>  };
>>>  
>>> -enum uvc_handle_state {
>>> -	UVC_HANDLE_PASSIVE	= 0,
>>> -	UVC_HANDLE_ACTIVE	= 1,
>>> -};
>>> -
>>>  struct uvc_fh {
>>>  	struct v4l2_fh vfh;
>>>  	struct uvc_video_chain *chain;
>>>  	struct uvc_streaming *stream;
>>> -	enum uvc_handle_state state;
>>>  	unsigned int pending_async_ctrls;
>>>  	bool is_streaming;
>>>  };
>>> @@ -687,36 +683,11 @@ struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
>>>  
>>>  /* Video buffers queue management. */
>>>  int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type);
>>> -void uvc_queue_release(struct uvc_video_queue *queue);
>>> -int uvc_request_buffers(struct uvc_video_queue *queue,
>>> -			struct v4l2_requestbuffers *rb);
>>> -int uvc_query_buffer(struct uvc_video_queue *queue,
>>> -		     struct v4l2_buffer *v4l2_buf);
>>> -int uvc_create_buffers(struct uvc_video_queue *queue,
>>> -		       struct v4l2_create_buffers *v4l2_cb);
>>> -int uvc_queue_buffer(struct uvc_video_queue *queue,
>>> -		     struct media_device *mdev,
>>> -		     struct v4l2_buffer *v4l2_buf);
>>> -int uvc_export_buffer(struct uvc_video_queue *queue,
>>> -		      struct v4l2_exportbuffer *exp);
>>> -int uvc_dequeue_buffer(struct uvc_video_queue *queue,
>>> -		       struct v4l2_buffer *v4l2_buf, int nonblocking);
>>> -int uvc_queue_streamon(struct uvc_video_queue *queue, enum v4l2_buf_type type);
>>> -int uvc_queue_streamoff(struct uvc_video_queue *queue, enum v4l2_buf_type type);
>>>  void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect);
>>>  struct uvc_buffer *uvc_queue_next_buffer(struct uvc_video_queue *queue,
>>>  					 struct uvc_buffer *buf);
>>>  struct uvc_buffer *uvc_queue_get_current_buffer(struct uvc_video_queue *queue);
>>>  void uvc_queue_buffer_release(struct uvc_buffer *buf);
>>> -int uvc_queue_mmap(struct uvc_video_queue *queue,
>>> -		   struct vm_area_struct *vma);
>>> -__poll_t uvc_queue_poll(struct uvc_video_queue *queue, struct file *file,
>>> -			poll_table *wait);
>>> -#ifndef CONFIG_MMU
>>> -unsigned long uvc_queue_get_unmapped_area(struct uvc_video_queue *queue,
>>> -					  unsigned long pgoff);
>>> -#endif
>>> -int uvc_queue_allocated(struct uvc_video_queue *queue);
>>>  static inline int uvc_queue_streaming(struct uvc_video_queue *queue)
>>>  {
>>>  	return vb2_is_streaming(&queue->queue);
>>
> 


