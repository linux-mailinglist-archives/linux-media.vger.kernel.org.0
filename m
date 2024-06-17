Return-Path: <linux-media+bounces-13390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3C190A70A
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 09:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 261192820E2
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 07:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6057618C349;
	Mon, 17 Jun 2024 07:27:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F681384B3;
	Mon, 17 Jun 2024 07:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718609268; cv=none; b=rYUgs2vf0nOasG2HJxG/dLa89v1Z2DsQ+BUQTwfBQV/hJoihEjCJx0k8zG3QjH/ym8B1aeQr8cH3rvnK+sIJ5VK17YRMFHiRDjGAP5OOlOU24nMOWQtBwXCijoi149v4SP63BzzXmlGjNtwpCtm8qA5RjV2P5b+NkiwG1ZLNhRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718609268; c=relaxed/simple;
	bh=vmjvsd5S8iU/fD5x81YTWJxuW5oljIx8fVoZjOi2z0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+dfqVOhRn/qBAPyIVf31JeuE/eLh/j0H3T3VYddOyt6RBLnBqFtuzdy88uBkBN4WpMNQbMDAjU5HoiIbttnay703dkXx5ov1yGa4aGFLnAeybJW3SRzJggAd/cLGB+EWGFQi/2F3pAezm0idngQ8lVlKAuGnDlG456GDfihluI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C76C4AF48;
	Mon, 17 Jun 2024 07:27:45 +0000 (UTC)
Message-ID: <54cb2795-bcb3-40c8-841c-4570d857d366@xs4all.nl>
Date: Mon, 17 Jun 2024 09:27:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] media: uvcvideo: stop stream during unregister
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomasz Figa <tfiga@chromium.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Max Staudt <mstaudt@chromium.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20240327-guenter-mini-v4-0-49955c198eae@chromium.org>
 <20240327-guenter-mini-v4-1-49955c198eae@chromium.org>
 <CAAFQd5BhJExCEA7_Ck2skWR52baSDH63-+oEZnpo4UiMc0C7=A@mail.gmail.com>
 <20240616235844.GO4782@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240616235844.GO4782@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/06/2024 01:58, Laurent Pinchart wrote:
> Hi Tomasz,
> 
> On Thu, Jun 06, 2024 at 06:57:50PM +0900, Tomasz Figa wrote:
>> On Wed, Mar 27, 2024 at 5:24 PM Ricardo Ribalda wrote:
>>>
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
>>
>> First of all, thanks for the patch. I have a question about the
>> problem being fixed here.
>>
>> Could you point out a specific race condition example that could
>> happen without this change?
>> From what I see in __video_do_ioctl((), no ioctls would be executed
>> anymore after the video node is unregistered.
>> Since the device is not present either, what asynchronous code paths
>> could be still triggered?
> 
> I believe the issue is that some ioctls can be in progress while the
> device is unregistered. I'll let Ricardo confirm.
> 
> I've tried to explain multiple times before that this should be handled
> in the V4L2 core, ideally with fixes in the cdev core too, as this issue
> affects all cdev drivers. I've pointed to related patches that have been
> posted for the cdev core. They need to be wrapped in V4L2 functions to
> make them easier to use for drivers. If we don't want to depend on those
> cdev changes, we can implement the "wrappers" with fixes limited to
> V4L2 until the cdev changes get merged (assuming someone would resurect
> them).

But there is already a V4L2 wrapper for that: vb2_video_unregister_device().
It safely unregisters the video device, ensuring any in-flight ioctls finish
first, and it stops any video streaming.

The only reason it can't be used in uvc for the video stream is that that
vb2_queue doesn't set the lock field (i.e. uses the core V4L2 serialization
mechanism). The metadata stream *does* set that field, so for that stream this
function can be used.

While it would be nice to have this fixed in the cdev core part, that will
take very long, and we have a perfectly fine V4L2 helper for this already.

Regards,

	Hans

> 
>> [1] https://elixir.bootlin.com/linux/latest/source/drivers/media/v4l2-core/v4l2-ioctl.c#L3023
>>
>>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>>> index bbd90123a4e76..17fc945c8deb6 100644
>>> --- a/drivers/media/usb/uvc/uvc_driver.c
>>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>>> @@ -1911,8 +1911,19 @@ static void uvc_unregister_video(struct uvc_device *dev)
>>>                 if (!video_is_registered(&stream->vdev))
>>>                         continue;
>>>
>>> +               /*
>>> +                * Serialize other access to the stream.
>>> +                */
>>> +               mutex_lock(&stream->mutex);
>>> +               uvc_queue_streamoff(&stream->queue, stream->type);
>>>                 video_unregister_device(&stream->vdev);
>>>                 video_unregister_device(&stream->meta.vdev);
>>> +               mutex_unlock(&stream->mutex);
>>> +
>>> +               /*
>>> +                * Now the vdev is not streaming and all the ioctls will
>>> +                * return -ENODEV
>>> +                */
>>>
>>>                 uvc_debugfs_cleanup_stream(stream);
>>>         }
> 


