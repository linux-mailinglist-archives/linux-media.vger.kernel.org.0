Return-Path: <linux-media+bounces-12641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B468B8FE5EB
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 13:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 618F3286A13
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 11:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782F319581F;
	Thu,  6 Jun 2024 11:58:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF7E4DA14;
	Thu,  6 Jun 2024 11:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717675085; cv=none; b=DthaRo0cLAjxUtRUMWG09RLoe0VkLwqLKfPPj+ISgwnSfqvE572VRMkhP4V04x9BhudujjJEtgM2DHsir1rsBaMb6oG8V0p6ajcjjwAwl91WWYn2aT6ifq3gYKTojpqCnWbKyPT5X25dphOJXAd0snBGWO1kafA9adT+GO93ECU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717675085; c=relaxed/simple;
	bh=0RyeNRIOnCXCsqFDPiFcqqnV8Y98K30Zik5s5Ww0H2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ps1EVTFauMLJt7vm8CwrDid8VfZFXmiSddfjaDHQSe7qxnItgi+l9YP3Q7UHuf24bcfNub47lJvjO9nou2E0miBBrG9A0nmrQvrwrE52sgd6NA81qPHzOZ3LEzfKHjy/vt86zxTYG5jRy9XtCcuGCNgGYcc9YSx8M0gjXUGzMt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1793BC4AF0A;
	Thu,  6 Jun 2024 11:58:00 +0000 (UTC)
Message-ID: <1976a7c6-6b66-4c4c-9c9c-f41dd8b2bdf3@xs4all.nl>
Date: Thu, 6 Jun 2024 13:57:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] media: uvcvideo: stop stream during unregister
To: Tomasz Figa <tfiga@chromium.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Max Staudt <mstaudt@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alan Stern <stern@rowland.harvard.edu>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20240327-guenter-mini-v4-0-49955c198eae@chromium.org>
 <20240327-guenter-mini-v4-1-49955c198eae@chromium.org>
 <7d06c6e4-c555-4117-a22b-5c614d7f6f8a@xs4all.nl>
 <CAAFQd5A3nzpv531fu6h7thCkxettTSbc3vofPyt7ie8qf6SJcQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAAFQd5A3nzpv531fu6h7thCkxettTSbc3vofPyt7ie8qf6SJcQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/06/2024 12:04, Tomasz Figa wrote:
> Hi Hans,
> 
> On Tue, May 28, 2024 at 4:55 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 27/03/2024 09:24, Ricardo Ribalda wrote:
>>> uvc_unregister_video() can be called asynchronously from
>>> uvc_disconnect(). If the device is still streaming when that happens, a
>>> plethora of race conditions can happen.
>>>
>>> Make sure that the device has stopped streaming before exiting this
>>> function.
>>>
>>> If the user still holds handles to the driver's file descriptors, any
>>> ioctl will return -ENODEV from the v4l2 core.
>>>
>>> This change make uvc more consistent with the rest of the v4l2 drivers
>>> using the vb2_fop_* and vb2_ioctl_* helpers.
>>>
>>> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>>  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>>> index bbd90123a4e76..17fc945c8deb6 100644
>>> --- a/drivers/media/usb/uvc/uvc_driver.c
>>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>>> @@ -1911,8 +1911,19 @@ static void uvc_unregister_video(struct uvc_device *dev)
>>>               if (!video_is_registered(&stream->vdev))
>>>                       continue;
>>>
>>> +             /*
>>> +              * Serialize other access to the stream.
>>> +              */
>>> +             mutex_lock(&stream->mutex);
>>> +             uvc_queue_streamoff(&stream->queue, stream->type);
>>>               video_unregister_device(&stream->vdev);
>>>               video_unregister_device(&stream->meta.vdev);
>>> +             mutex_unlock(&stream->mutex);
>>
>> This sequence isn't fool proof. You have to follow the same sequence as
>> vb2_video_unregister_device(): take a reference to the video device,
>> then unregister, then take the stream mutex and call vb2_queue_release
>> for each queue. Finally unlock the mutex and call put_device.
> 
> vb2_queue_release() will run when the userspace releases the file
> handle that owns the vb2 queue [1], so we shouldn't really need to
> call it here.
> 
> [1] https://elixir.bootlin.com/linux/v6.9.3/source/drivers/media/usb/uvc/uvc_v4l2.c#L655
> 
>>
>> Doing the video_unregister_device first ensures no new ioctls can be
>> called on that device node. Taking the mutex ensures that any still
>> running ioctls will finish (since it will sleep until they release the
>> mutex), and then you can release the queue.
> 
> Actually isn't the only missing thing in the code basically ensuring
> that any ioctl currently being executed finishes? Why is the streamoff
> or queue release needed?

See below...

> 
> Best regards,
> Tomasz
> 
>>
>> This does require that you call get_device before calling video_unregister_device,
>> otherwise everything might be released at that point.
>>
>> Instead of vb2_queue_release() you might have to call uvc_queue_streamoff,
>> but note that there are two queues here: video and meta. The code above
>> just calls streamoff for the video device.
>>
>> For the meta device I think you can just use vb2_video_unregister_device()
>> directly, since that sets vdev->queue and vdev->queue.lock to the correct
>> values. That would just leave the video device where you need to do this
>> manually.

Ideally uvc should just use centralized locking (i.e. set vdev->queue.lock)
for the video node, just like it does for the meta device.

If that was the case, then it can just call vb2_video_unregister_device().
The vb2_video_unregister_device helper was added to ensure that no ioctls
are running, and then streaming is stopped and the queue is released.

While it is true that the queue is released automatically when the last user
closes the filehandle, it can get complicated if the application has a file
handle open when the device is unregistered (usually due to it being unplugged).
Without that call to vb2_video_unregister_device() the queue is still active,
and especially if you also have subdevices that are still in streaming mode,
it is hard to make sure nothing is still using the hardware.

vb2_video_unregister_device() provides a clean way of ensuring that when the
device is unregistered all streaming is stopped and the vb2 queue is released.

After that the only file operation that can be used without returning an error
is close().

Since uvc uses its own locking for the video device, it has to do this manually.
It is probably enough to ensure no ioctls are running since uvc doesn't have
subdevices, but I think it makes sense to stop streaming and release the queue
when unregistering the device, it is weird to postpone that until the last fh
is closed.

Regards,

	Hans


>>
>> Regards,
>>
>>         Hans
>>
>>> +
>>> +             /*
>>> +              * Now the vdev is not streaming and all the ioctls will
>>> +              * return -ENODEV
>>> +              */
>>>
>>>               uvc_debugfs_cleanup_stream(stream);
>>>       }
>>>
>>


