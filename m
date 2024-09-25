Return-Path: <linux-media+bounces-18545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A357B9856A7
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 11:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 697DB282E92
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 09:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F080015B546;
	Wed, 25 Sep 2024 09:50:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B8C156F36;
	Wed, 25 Sep 2024 09:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727257845; cv=none; b=N9OCUhL0m7pClFD2ceGDEQetQ5SWswa1xYXv4akNhsQNq5z84UZR9wKGsqxVn1Kvyy/MutemO48ujXv/zkLHZ4xjGWOcrr1g/1KNSmd5Vih0Bhmrb3AXx9wNzIyeBfEfaanRa9Vg6119CQSdazk6hnSu+K/hGIJMfDle4epYZRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727257845; c=relaxed/simple;
	bh=uk6LDy6E0VzCQgbbwnbYsWQi9ro1nsxbNBj76H7N1eE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NfaYsZf6ih8pfCC586gWliOoW1GI/FhDUitUcEBUUU37/qSQBpJw5+eaxvOTPjnbK1Aa+j5JKA9IgWffxE7nqlR/xAH6Hy0whXAidFF98UKS3Tpzz8gHVWSUkC1dN1zJg7xh+1EVG73g/73vRQljL108F6rGBuWF15HCmeRj1zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4BCC4CEC3;
	Wed, 25 Sep 2024 09:50:42 +0000 (UTC)
Message-ID: <318aa048-ffdf-4379-929b-54358b018c94@xs4all.nl>
Date: Wed, 25 Sep 2024 11:50:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] media: uvcvideo: Stop stream during unregister
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Tomasz Figa <tfiga@chromium.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ricardo Ribalda <ribalda@chromium.org>
References: <20240614-guenter-mini-v6-0-7b7fdc3b21b3@chromium.org>
 <20240614-guenter-mini-v6-1-7b7fdc3b21b3@chromium.org>
 <f4c49ccf-9dc9-475a-8fc9-4ef4c85a729a@xs4all.nl>
Content-Language: en-US, nl
In-Reply-To: <f4c49ccf-9dc9-475a-8fc9-4ef4c85a729a@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/09/2024 10:32, Hans Verkuil wrote:
> Hi Laurent,
> 
> We discussed this patch last week, and you thought that there was still
> a race condition if the uvc device was unplugged while an application was
> in the VIDIOC_DQBUF call waiting for a buffer to arrive (so the vb2 wait_prepare
> op is called, which unlocks the serialization mutex).
> 
> I'll go through the code below, explaining why that isn't an issue.

Update: I added an extra check for this scenario to the test-media script to make
sure we catch any potential regressions in how this is handled in the core.

Regards,

	Hans

> 
> On 14/06/2024 14:41, Ricardo Ribalda wrote:
>> uvc_unregister_video() can be called asynchronously from
>> uvc_disconnect(). If the device is still streaming when that happens, a
>> plethora of race conditions can occur.
>>
>> Make sure that the device has stopped streaming before exiting this
>> function.
>>
>> If the user still holds handles to the driver's file descriptors, any
>> ioctl will return -ENODEV from the v4l2 core.
>>
>> This change makes uvc more consistent with the rest of the v4l2 drivers
>> using the vb2_fop_* and vb2_ioctl_* helpers.
>>
>> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>>  drivers/media/usb/uvc/uvc_driver.c | 32 +++++++++++++++++++++++++++++++-
>>  1 file changed, 31 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>> index bbd90123a4e7..55132688e363 100644
>> --- a/drivers/media/usb/uvc/uvc_driver.c
>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>> @@ -1908,11 +1908,41 @@ static void uvc_unregister_video(struct uvc_device *dev)
>>  	struct uvc_streaming *stream;
>>  
>>  	list_for_each_entry(stream, &dev->streams, list) {
>> +		/* Nothing to do here, continue. */
>>  		if (!video_is_registered(&stream->vdev))
>>  			continue;
>>  
>> +		/*
>> +		 * For stream->vdev we follow the same logic as:
>> +		 * vb2_video_unregister_device().
>> +		 */
>> +
>> +		/* 1. Take a reference to vdev */
>> +		get_device(&stream->vdev.dev);
> 
> This ensures that the device refcount won't go to 0 if video_unregister_device
> is called (which calls put_device).
> 
> But note that if an application called VIDIOC_DQBUF and is waiting for a buffer,
> then that open filehandle also called get_device(). So while that application is
> waiting, the device refcount will never go to 0.
> 
>> +
>> +		/* 2. Ensure that no new ioctls can be called. */
>>  		video_unregister_device(&stream->vdev);
>> -		video_unregister_device(&stream->meta.vdev);
>> +
>> +		/* 3. Wait for old ioctls to finish. */
>> +		mutex_lock(&stream->mutex);
> 
> If VIDIOC_DQBUF is waiting for a buffer to arrive, then indeed we can take this
> lock here. So in that case this won't wait for that specific ioctl to finish.
> 
>> +
>> +		/* 4. Stop streaming. */
>> +		uvc_queue_release(&stream->queue);
> 
> This will __vb2_queue_cancel() which will stop streaming and wake up the wait for
> buffers in VIDIOC_DQBUF. It will try to lock this mutex again, and sleeps while
> waiting for the mutex to become available.
> 
>> +
>> +		mutex_unlock(&stream->mutex);
> 
> At this point it can take the mutex again. But since q->streaming is now false,
> (due to the __vb2_queue_cancel call) this will return an error which is returned
> to userspace.
> 
>> +
>> +		put_device(&stream->vdev.dev);
> 
> This releases the reference we took earlier. If the application has already closed
> the filehandle, then this will release all memory. If the application still has the
> fh open, then only when it closes that fh will the memory be released.
> 
> Conclusion: there is no race condition here, this is handled correctly by the core.
> 
>> +
>> +		/*
>> +		 * For stream->meta.vdev we can directly call:
>> +		 * vb2_video_unregister_device().
>> +		 */
>> +		vb2_video_unregister_device(&stream->meta.vdev);
> 
> Perhaps a patch adding more comments to the vb2_video_unregister_device()
> function might help document this sequence better.
> 
> Regards,
> 
> 	Hans
> 
>> +
>> +		/*
>> +		 * Now both vdevs are not streaming and all the ioctls will
>> +		 * return -ENODEV.
>> +		 */
>>  
>>  		uvc_debugfs_cleanup_stream(stream);
>>  	}
>>
> 
> 


