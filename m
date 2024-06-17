Return-Path: <linux-media+bounces-13398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3735090A844
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 10:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A371BB215E6
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 08:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0247B190078;
	Mon, 17 Jun 2024 08:20:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9541E7492;
	Mon, 17 Jun 2024 08:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718612401; cv=none; b=Jx8KH6ie0OQ1pg+g3EnX+ijfXTwQUjlmbs07igwg1q35dOjNGHwtOkRWSorQJOehx95i0MScuDBwjKRBXqRztn8YYg/c7tdfIFEbkWJbrN+mebfxVquzpSIE7rD7ZtIE1btQojWia6OrX3WHfZoR+ZFkzd/6XeFfBwqzwZio0dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718612401; c=relaxed/simple;
	bh=vIUSsvM/QflL2lNOUzh0g8ckoqLm+jCUhefDwOubcOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WooaOJKj7B3GgJD3qroFPHsU9AU+tN+3DZzuzLMG97JhQoVWMFF9ry8Z2/q2kwywKaYb+tH1sWjio2LNIwGtFtTEEcA6I1EbP6avG8s+yngd9NqzNv5s8lceMAPMZNZIc7la52lGlKBezCDEqlOwxTgD3zpIpUl6kLej8ffeNn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C677AC2BD10;
	Mon, 17 Jun 2024 08:19:58 +0000 (UTC)
Message-ID: <fc2738fd-5e24-4aea-82d0-e31e7b3b4e20@xs4all.nl>
Date: Mon, 17 Jun 2024 10:19:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] media: uvcvideo: stop stream during unregister
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomasz Figa <tfiga@chromium.org>, Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Max Staudt <mstaudt@chromium.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>
References: <20240327-guenter-mini-v4-0-49955c198eae@chromium.org>
 <20240327-guenter-mini-v4-1-49955c198eae@chromium.org>
 <CAAFQd5BhJExCEA7_Ck2skWR52baSDH63-+oEZnpo4UiMc0C7=A@mail.gmail.com>
 <20240616235844.GO4782@pendragon.ideasonboard.com>
 <54cb2795-bcb3-40c8-841c-4570d857d366@xs4all.nl>
 <Zm_sN3Ta7MrjGrQL@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <Zm_sN3Ta7MrjGrQL@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/06/2024 09:56, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Jun 17, 2024 at 09:27:43AM +0200, Hans Verkuil wrote:
>> On 17/06/2024 01:58, Laurent Pinchart wrote:
>>> Hi Tomasz,
>>>
>>> On Thu, Jun 06, 2024 at 06:57:50PM +0900, Tomasz Figa wrote:
>>>> On Wed, Mar 27, 2024 at 5:24 PM Ricardo Ribalda wrote:
>>>>>
>>>>> uvc_unregister_video() can be called asynchronously from
>>>>> uvc_disconnect(). If the device is still streaming when that happens, a
>>>>> plethora of race conditions can happen.
>>>>>
>>>>> Make sure that the device has stopped streaming before exiting this
>>>>> function.
>>>>>
>>>>> If the user still holds handles to the driver's file descriptors, any
>>>>> ioctl will return -ENODEV from the v4l2 core.
>>>>>
>>>>> This change make uvc more consistent with the rest of the v4l2 drivers
>>>>> using the vb2_fop_* and vb2_ioctl_* helpers.
>>>>>
>>>>> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>>> ---
>>>>>  drivers/media/usb/uvc/uvc_driver.c | 11 +++++++++++
>>>>>  1 file changed, 11 insertions(+)
>>>>
>>>> First of all, thanks for the patch. I have a question about the
>>>> problem being fixed here.
>>>>
>>>> Could you point out a specific race condition example that could
>>>> happen without this change?
>>>> From what I see in __video_do_ioctl((), no ioctls would be executed
>>>> anymore after the video node is unregistered.
>>>> Since the device is not present either, what asynchronous code paths
>>>> could be still triggered?
>>>
>>> I believe the issue is that some ioctls can be in progress while the
>>> device is unregistered. I'll let Ricardo confirm.
>>>
>>> I've tried to explain multiple times before that this should be handled
>>> in the V4L2 core, ideally with fixes in the cdev core too, as this issue
>>> affects all cdev drivers. I've pointed to related patches that have been
>>> posted for the cdev core. They need to be wrapped in V4L2 functions to
>>> make them easier to use for drivers. If we don't want to depend on those
>>> cdev changes, we can implement the "wrappers" with fixes limited to
>>> V4L2 until the cdev changes get merged (assuming someone would resurect
>>> them).
>>
>> But there is already a V4L2 wrapper for that: vb2_video_unregister_device().
>> It safely unregisters the video device, ensuring any in-flight ioctls finish
>> first, and it stops any video streaming.
>>
>> The only reason it can't be used in uvc for the video stream is that that
>> vb2_queue doesn't set the lock field (i.e. uses the core V4L2 serialization
>> mechanism). The metadata stream *does* set that field, so for that stream this
>> function can be used.
>>
>> While it would be nice to have this fixed in the cdev core part, that will
>> take very long, and we have a perfectly fine V4L2 helper for this already.
> 
> It might not take *that* long to get there but it won't happen unless
> someone does it. Dan Williams posted a patch but his immediate problem was
> solved differently so there it remains
> <URL:https://lore.kernel.org/all/161117153248.2853729.2452425259045172318.stgit@dwillia2-desk3.amr.corp.intel.com/>.
> 
> In the meantime vb_video_unregister_device() would seem to be the best
> choice.

Also note that even if these cdev improvements ever land, that doesn't remove
the need for vb2_video_unregister_device, since that also explicitly stops
any streaming that is in progress. Which is something you really want to do
when the device is unbound.

Regards,

	Hans


