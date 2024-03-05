Return-Path: <linux-media+bounces-6409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 278B7871734
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 08:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25BE31C2119A
	for <lists+linux-media@lfdr.de>; Tue,  5 Mar 2024 07:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EAAB7E797;
	Tue,  5 Mar 2024 07:47:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281B37E777
	for <linux-media@vger.kernel.org>; Tue,  5 Mar 2024 07:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709624820; cv=none; b=ITc80kGTyuhgYakeca7wWLJYBNJcNBDoZuUCwTNMFih1b1GpIOyYhoBHF1yvWGSxIZC8VStYpuF9TsIjMFw41QpyauugdpUVphd7AzLhcQkiLV5m2uZRr1QJuWrvZG8SvzlV36WWyi6I6BjfKVdGbT8o//XbtQYEF51r6036nMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709624820; c=relaxed/simple;
	bh=4mR7u4bzWJyDAMD1UTZypNju+FVvTEG6DwQ5WxW/iTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rTib7wiEwOWQt6PB/SLP1soPvvO//dzwvLrTNLeZ0cafBykYV4KPwnTY1s4wOPcPFzqznoZdP96BInlyFQBNhlG43A4cEF7tpdKFUnLlvjFLsy4CIQ8hpWOv4ConpuQWTfjINQiApMfQ+V8jwChOJlHNtEgpMK1WoKa70KXuJ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148AAC433C7;
	Tue,  5 Mar 2024 07:46:58 +0000 (UTC)
Message-ID: <de14835a-e796-4b68-9211-65cda3e84e1e@xs4all.nl>
Date: Tue, 5 Mar 2024 08:46:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/29] media: v4l: Acquire a reference to the media
 device for every video device
Content-Language: en-US, nl
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
References: <20231220103713.113386-1-sakari.ailus@linux.intel.com>
 <20231220103713.113386-18-sakari.ailus@linux.intel.com>
 <2708ec26-3156-4269-85ae-d9e783dc3bd1@xs4all.nl>
 <ZdXTIW1Gu4eyp7QA@kekkonen.localdomain>
 <3c72b7ce-1f9f-4622-be0c-706f2af0273b@xs4all.nl>
 <ZdXiOxOxKi6U6Ayn@kekkonen.localdomain>
 <ZebNJK7TMcBJVLv6@kekkonen.localdomain>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <ZebNJK7TMcBJVLv6@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/03/2024 8:43 am, Sakari Ailus wrote:
> Hi Hans,
> 
> On Wed, Feb 21, 2024 at 11:44:59AM +0000, Sakari Ailus wrote:
>> Hi Hans,
>>
>> On Wed, Feb 21, 2024 at 11:51:08AM +0100, Hans Verkuil wrote:
>>> On 21/02/2024 11:40, Sakari Ailus wrote:
>>>> Hi Hans,
>>>>
>>>> Many thanks for reviewing these.
>>>>
>>>> On Mon, Feb 05, 2024 at 03:56:22PM +0100, Hans Verkuil wrote:
>>>>> On 20/12/2023 11:37, Sakari Ailus wrote:
>>>>>> The video device depends on the existence of its media device --- if there
>>>>>> is one. Acquire a reference to it.
>>>>>>
>>>>>> Note that when the media device release callback is used, then the V4L2
>>>>>> device release callback is ignored and a warning is issued if both are
>>>>>> set.
>>>>>>
>>>>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>>>> ---
>>>>>>  drivers/media/v4l2-core/v4l2-dev.c | 51 ++++++++++++++++++++----------
>>>>>>  1 file changed, 34 insertions(+), 17 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>>>>>> index d13954bd31fd..c1e4995eaf5c 100644
>>>>>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>>>>>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>>>>>> @@ -176,6 +176,11 @@ static void v4l2_device_release(struct device *cd)
>>>>>>  {
>>>>>>  	struct video_device *vdev = to_video_device(cd);
>>>>>>  	struct v4l2_device *v4l2_dev = vdev->v4l2_dev;
>>>>>> +	bool v4l2_dev_has_release = v4l2_dev->release;
>>>>>> +#ifdef CONFIG_MEDIA_CONTROLLER
>>>>>> +	struct media_device *mdev = v4l2_dev->mdev;
>>>>>> +	bool mdev_has_release = mdev && mdev->ops && mdev->ops->release;
>>>>>> +#endif
>>>>>>  
>>>>>>  	mutex_lock(&videodev_lock);
>>>>>>  	if (WARN_ON(video_devices[vdev->minor] != vdev)) {
>>>>>> @@ -198,8 +203,8 @@ static void v4l2_device_release(struct device *cd)
>>>>>>  
>>>>>>  	mutex_unlock(&videodev_lock);
>>>>>>  
>>>>>> -#if defined(CONFIG_MEDIA_CONTROLLER)
>>>>>> -	if (v4l2_dev->mdev && vdev->vfl_dir != VFL_DIR_M2M) {
>>>>>> +#ifdef CONFIG_MEDIA_CONTROLLER
>>>>>> +	if (mdev && vdev->vfl_dir != VFL_DIR_M2M) {
>>>>>>  		/* Remove interfaces and interface links */
>>>>>>  		media_devnode_remove(vdev->intf_devnode);
>>>>>>  		if (vdev->entity.function != MEDIA_ENT_F_UNKNOWN)
>>>>>> @@ -207,23 +212,31 @@ static void v4l2_device_release(struct device *cd)
>>>>>>  	}
>>>>>>  #endif
>>>>>>  
>>>>>> -	/* Do not call v4l2_device_put if there is no release callback set.
>>>>>> -	 * Drivers that have no v4l2_device release callback might free the
>>>>>> -	 * v4l2_dev instance in the video_device release callback below, so we
>>>>>> -	 * must perform this check here.
>>>>>> -	 *
>>>>>> -	 * TODO: In the long run all drivers that use v4l2_device should use the
>>>>>> -	 * v4l2_device release callback. This check will then be unnecessary.
>>>>>> -	 */
>>>>>> -	if (v4l2_dev->release == NULL)
>>>>>> -		v4l2_dev = NULL;
>>>>>> -
>>>>>>  	/* Release video_device and perform other
>>>>>>  	   cleanups as needed. */
>>>>>>  	vdev->release(vdev);
>>>>>>  
>>>>>> -	/* Decrease v4l2_device refcount */
>>>>>> -	if (v4l2_dev)
>>>>>> +#ifdef CONFIG_MEDIA_CONTROLLER
>>>>>> +	if (mdev)
>>>>>> +		media_device_put(mdev);
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * Generally both struct media_device and struct v4l2_device are
>>>>>> +	 * embedded in the same driver's context struct so having a release
>>>>>> +	 * callback in both is a bug.
>>>>>> +	 */
>>>>>> +	WARN_ON(v4l2_dev_has_release && mdev_has_release);
>>>>>
>>>>> How about:
>>>>>
>>>>> 	if (WARN_ON(v4l2_dev_has_release && mdev_has_release))
>>>>> 		v4l2_dev_has_release = false;
>>>>>
>>>>>> +#endif
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * Decrease v4l2_device refcount, but only if the media device doesn't
>>>>>> +	 * have a release callback.
>>>>>> +	 */
>>>>>> +	if (v4l2_dev_has_release
>>>>>> +#ifdef CONFIG_MEDIA_CONTROLLER
>>>>>> +	    && !mdev_has_release
>>>>>> +#endif
>>>>>> +	    )
>>>>>
>>>>> Then this change is no longer needed.
>>>>
>>>> Good idea.
>>>>
>>>> I'll also rename v4l2_dev_has_release as v4l2_dev_call_release.
>>>>
>>>>>
>>>>> General question: do we have drivers today that set both release functions?
>>>>> Because that would now cause a WARN in the kernel log with this patch.
>>>>
>>>> Indeed, the intention is to be vocal about it.
>>>>
>>>> The only user of the v4l2_device release function I could find is
>>>> drivers/media/radio/dsbr100.c . I may have missed some but it certainly
>>>> isn't commonly used. Maybe we could try to drop refcounting from
>>>> v4l2_device later on?
>>>
>>> There are a lot more drivers that use this. A quick grep shows gspca, hackrf,
>>> usbtv, pwc, au0828 and more.
>>>
>>> git grep v4l2_dev.*release.*= drivers/media/
>>>
>>> Currently it is the only way to properly release drivers that create multiple
>>> video (or other) devices.
>>
>> I mistakenly grepped for ->release, .release is actually more common. I'll
>> check how this is currently being used.
> 
> Getting back to the topic---indeed the V4L2 device release function is used
> by a number of drivers today. Moving to the Media device release function
> is no small task: I checked some drivers and while releasing the resources
> is centralised in this case, unregistering the interfaces and releasing
> actual resources may be intertwined so that fixing this requires reworking
> much of the driver code. It's better to leave this for driver authors or at
> least someone who has the hardware.
> 

Indeed. Most if not all of these drivers do not create a media device anyway.
Now, if you see drivers that have a media device AND use the v4l2_device
release callback, then let me know. If I have the hardware, then I can try
and switch it to using the media device callback since that would make more
sense.

Regards,

	Hans

