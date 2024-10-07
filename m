Return-Path: <linux-media+bounces-19162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B34993019
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 16:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF3961C214C3
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 14:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4961D88A8;
	Mon,  7 Oct 2024 14:53:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C273F1D6DAD;
	Mon,  7 Oct 2024 14:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728312813; cv=none; b=hJm+lNhLukorDgx6PIZSXRXxaW3K6esFUjUfDPjAIsucNVlLKu3fNw0Gb+fsDFaVDzcPE3ybUCOLFPRM2jgivpTBCFohnYPePBaBcrmxKnGXVMTkS8Wqls9Hj4/VskrvnjmbyGVzAKRsoLGeCsxO1mxDqolaczqNNcloKzDReX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728312813; c=relaxed/simple;
	bh=oHLRGv9fJmxu0Uca8L9XiGr2+xuxFk7mBGIoSqCb33k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PL//NeLqH51P4qbpngaaRryrzAIZEhVPvaxQRG6fXC35NDQXlBsXE/Fd2BxrEF1yl7G+wCDOWhQWCbMm+YHSmb7ZooCQkqOq2ZaC2gyjXyOht0P8x+0e0t5F8m7528wa7UwsWIp/Ig8Wg0Y4q69ax9wTivqLUN6f9i59f2H4V3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2995CC4CEC6;
	Mon,  7 Oct 2024 14:53:31 +0000 (UTC)
Message-ID: <799ce9ae-bdb4-4fcf-be33-a40a7c746705@xs4all.nl>
Date: Mon, 7 Oct 2024 16:53:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: Stop stream during unregister
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240926-uvc_stop_streaming-v1-1-038180fafe5f@chromium.org>
 <80f800c8-46e0-47bb-8a7b-1566e5eed91a@xs4all.nl>
 <20241007144401.GE6403@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20241007144401.GE6403@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/10/2024 16:44, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Mon, Oct 07, 2024 at 09:46:47AM +0200, Hans Verkuil wrote:
>> Hi Laurent,
>>
>> Just a reminder: I have extensively reviewed this patch here:
>>
>> https://lore.kernel.org/linux-media/f4c49ccf-9dc9-475a-8fc9-4ef4c85a729a@xs4all.nl/
>>
>> and here (specifically checking for mmap() races):
>>
>> https://lore.kernel.org/linux-media/1a10530f-b4bb-4244-84ff-1f2365ae9b23@xs4all.nl/
>>
>> To the best of my ability I believe this patch is correct.
>>
>> Unless you have any additional concerns I plan to take this patch as a fix for
>> v6.12 on Monday next week.
> 
> I thought we had an agreement that I could submit an alternative fix for
> v6.12. Can you therefore delay merging this patch until v6.12-rc6 ?

Correct, if there is indeed something wrong with this patch and an alternative
fix is needed (or at least should be considered).

But I see nothing wrong with this patch after careful analysis. If you disagree
with my analysis, and you think I missed a possible race condition, then that's
a reason to wait for a better fix. Otherwise there is no point in waiting any longer.

Regards,

	Hans

> 
>> Alternatively, you can make a PR for 6.12 with this patch that I can pull from.
>>
>> Regards,
>>
>> 	Hans
>>
>> On 26/09/2024 07:59, Ricardo Ribalda wrote:
>>> uvc_unregister_video() can be called asynchronously from
>>> uvc_disconnect(). If the device is still streaming when that happens, a
>>> plethora of race conditions can occur.
>>>
>>> Make sure that the device has stopped streaming before exiting this
>>> function.
>>>
>>> If the user still holds handles to the driver's file descriptors, any
>>> ioctl will return -ENODEV from the v4l2 core.
>>>
>>> This change makes uvc more consistent with the rest of the v4l2 drivers
>>> using the vb2_fop_* and vb2_ioctl_* helpers.
>>>
>>> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>> This patch was part of the series:
>>> https://patchwork.linuxtv.org/project/linux-media/list/?series=13064
>>>
>>> Moved out from it to ease the review.
>>> ---
>>>  drivers/media/usb/uvc/uvc_driver.c | 32 +++++++++++++++++++++++++++++++-
>>>  1 file changed, 31 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>>> index f0febdc08c2d..bee150b852e4 100644
>>> --- a/drivers/media/usb/uvc/uvc_driver.c
>>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>>> @@ -1919,11 +1919,41 @@ static void uvc_unregister_video(struct uvc_device *dev)
>>>  	struct uvc_streaming *stream;
>>>  
>>>  	list_for_each_entry(stream, &dev->streams, list) {
>>> +		/* Nothing to do here, continue. */
>>>  		if (!video_is_registered(&stream->vdev))
>>>  			continue;
>>>  
>>> +		/*
>>> +		 * For stream->vdev we follow the same logic as:
>>> +		 * vb2_video_unregister_device().
>>> +		 */
>>> +
>>> +		/* 1. Take a reference to vdev */
>>> +		get_device(&stream->vdev.dev);
>>> +
>>> +		/* 2. Ensure that no new ioctls can be called. */
>>>  		video_unregister_device(&stream->vdev);
>>> -		video_unregister_device(&stream->meta.vdev);
>>> +
>>> +		/* 3. Wait for old ioctls to finish. */
>>> +		mutex_lock(&stream->mutex);
>>> +
>>> +		/* 4. Stop streaming. */
>>> +		uvc_queue_release(&stream->queue);
>>> +
>>> +		mutex_unlock(&stream->mutex);
>>> +
>>> +		put_device(&stream->vdev.dev);
>>> +
>>> +		/*
>>> +		 * For stream->meta.vdev we can directly call:
>>> +		 * vb2_video_unregister_device().
>>> +		 */
>>> +		vb2_video_unregister_device(&stream->meta.vdev);
>>> +
>>> +		/*
>>> +		 * Now both vdevs are not streaming and all the ioctls will
>>> +		 * return -ENODEV.
>>> +		 */
>>>  
>>>  		uvc_debugfs_cleanup_stream(stream);
>>>  	}
>>>
>>> ---
>>> base-commit: 81ee62e8d09ee3c7107d11c8bbfd64073ab601ad
>>> change-id: 20240926-uvc_stop_streaming-6e9fd20e97bc
>>>
>>> Best regards,
>>
> 


