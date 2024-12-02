Return-Path: <linux-media+bounces-22408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC209DFC3E
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 09:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75413162D1D
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 08:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0101F9F63;
	Mon,  2 Dec 2024 08:44:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1988A2940F;
	Mon,  2 Dec 2024 08:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733129055; cv=none; b=mXoV7rSThGij1cZIni+qBu4RafMznzsbrjHetWTe1RQg2hwelstvp09nbUCbSUz87VdCUTo8oNZVE6BjbUrLKAtZpxd83f9l2TPGREgAY5UfrsH7EpeMUhuyX3oYCenC3bZWhNGRKlJ1Vn3A9sMNBd+WNVywBlLkrR4K0kRL9N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733129055; c=relaxed/simple;
	bh=4PrqPe+wIxYE2I0/+m0l1rF5z05DESmictGqIXBqYBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQ8jF+GxBsP/Q6cuZsHTXE62CQTWBU8fZ33oQOZHrYRbeg4VhfqI3aR52mWaBS6St9VTwCbA4g7HxOlxzniceT6XXVXiAt+geX7rG1ehJQUjQXx1XBnDiGFke8IuvrdDh22TTPV2VvwagDlVkktKGbY1oeUaqKVACt2Jurl6lzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F95EC4CED2;
	Mon,  2 Dec 2024 08:44:12 +0000 (UTC)
Message-ID: <445e551c-c527-443c-8913-6999455bd366@xs4all.nl>
Date: Mon, 2 Dec 2024 09:44:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] media: uvcvideo: Do not set an async control owned
 by other fh
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <CANiDSCseF3fsufMc-Ovoy-bQH85PqfKDM+zmfoisLw+Kq1biAw@mail.gmail.com>
 <20241129110640.GB4108@pendragon.ideasonboard.com>
 <CANiDSCvdjioy-OgC+dHde2zHAAbyfN2+MAY+YsLNdUSawjQFHw@mail.gmail.com>
 <e95b7d74-2c56-4f5a-a2f2-9c460d52fdb4@xs4all.nl>
 <CANiDSCvj4VVAcQOpR-u-BcnKA+2ifcuq_8ZML=BNOHT_55fBog@mail.gmail.com>
 <CANiDSCvwzY3DJ+U3EyzA7TCQu2qMUL6L1eTmZYbM+_Tk6DsPaA@mail.gmail.com>
 <20241129220339.GD2652@pendragon.ideasonboard.com>
 <CANiDSCsXi-WQLpbeXMat5FoM8AnYoJ0nVeCkTDMvEus8pXCC3w@mail.gmail.com>
 <20241202001846.GD6105@pendragon.ideasonboard.com>
 <fb321ade-40e7-4b1e-8fcd-c6475767239d@xs4all.nl>
 <20241202081157.GB16635@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20241202081157.GB16635@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/12/2024 09:11, Laurent Pinchart wrote:
> On Mon, Dec 02, 2024 at 09:05:07AM +0100, Hans Verkuil wrote:
>> On 02/12/2024 01:18, Laurent Pinchart wrote:
>>> On Fri, Nov 29, 2024 at 11:18:54PM +0100, Ricardo Ribalda wrote:
>>>> On Fri, 29 Nov 2024 at 23:03, Laurent Pinchart wrote:
>>>>> On Fri, Nov 29, 2024 at 07:47:31PM +0100, Ricardo Ribalda wrote:
>>>>>> Before we all go on a well deserved weekend, let me recap what we
>>>>>> know. If I did not get something correctly, let me know.
>>>>>>
>>>>>> 1) Well behaved devices do not allow to set or get an incomplete async
>>>>>> control. They will stall instead (ref: Figure 2-21 in UVC 1.5 )
>>>>>> 2) Both Laurent and Ricardo consider that there is a big chance that
>>>>>> some camera modules do not implement this properly. (ref: years of
>>>>>> crying over broken module firmware :) )
>>>>>>
>>>>>> 3) ctrl->handle is designed to point to the fh that originated the
>>>>>> control. So the logic can decide if the originator needs to be
>>>>>> notified or not. (ref: uvc_ctrl_send_event() )
>>>>>> 4) Right now we replace the originator in ctrl->handle for unfinished
>>>>>> async controls.  (ref:
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_ctrl.c#n2050)
>>>>>>
>>>>>> My interpretation is that:
>>>>>> A) We need to change 4). We shall not change the originator of
>>>>>> unfinished ctrl->handle.
>>>>>> B) Well behaved cameras do not need the patch "Do not set an async
>>>>>> control owned by another fh"
>>>>>> C) For badly behaved cameras, it is fine if we slightly break the
>>>>>> v4l2-compliance in corner cases, if we do not break any internal data
>>>>>> structure.
>>>>>
>>>>> The fact that some devices may not implement the documented behaviour
>>>>> correctly may not be a problem. Well-behaved devices will stall, which
>>>>> means we shouldn't query the device while as async update is in
>>>>> progress. Badly-behaved devices, whatever they do when queried, should
>>>>> not cause any issue if we don't query them.
>>>>
>>>> I thought we could detect the stall and return safely. Isn't that the case?
>>>
>>> We could, but if we know the device will stall anyway, is there a reason
>>> not to avoid issuing the request in the first place ?
>>>
>>>> Why we have not seen issues with this?
>>>
>>> I haven't tested a PTZ device for a very long time, and you would need
>>> to hit a small time window to see the issue.
>>>
>>>>> We should not send GET_CUR and SET_CUR requests to the device while an
>>>>> async update is in progress, and use cached values instead. When we
>>>>> receive the async update event, we should clear the cache. This will be
>>>>> the same for both well-behaved and badly-behaved devices, so we can
>>>>> expose the same behaviour towards userspace.
>>>>
>>>> seting ctrl->loaded = 0 when we get an event sounds like a good idea
>>>> and something we can implement right away.
>>>> If I have to resend the set I will add it to the end.
>>>>
>>>>> We possibly also need some kind of timeout mechanism to cope with the
>>>>> async update event not being delivered by the device.
>>>>
>>>> This is the part that worries me the most:
>>>> - timeouts make the code fragile
>>>> - What is a good value for timeout? 1 second, 30, 300? I do not think
>>>> that we can find a value.
>>>
>>> I've been thinking about the implementation of uvc_fh cleanup over the
>>> weekend, and having a timeout would have the nice advantage that we
>>> could reference-count uvc_fh instead of implementing a cleanup that
>>> walks over all controls when closing a file handle. I think it would
>>> make the code simpler, and possibly safer too.
>>>
>>>>> Regarding the userspace behaviour during an auto-update, we have
>>>>> multiple options:
>>>>>
>>>>> For control get,
>>>>>
>>>>> - We can return -EBUSY
>>>>> - We can return the old value from the cache
>>
>> This would match the control behavior best. Only when the operation is
>> done is the control updated and the control event sent.
>>
>> Some questions: is any of this documented for UVC? Because this is non-standard
> 
> No this isn't documented.
> 
>> behavior. Are there applications that rely on this? Should we perhaps add
> 
> I don't know.
> 
>> proper support for this to the control framework? E.g. add an ASYNC flag and
>> document this?
> 
> We could, but this is such a specific use case that I don't think is
> worth adding complexity to the already complex control framework would
> be worth it. What we could do is perhaps adding a flag for the userspace
> API, but even there, I never like modelling an API with a single user.

Well, it might be a single driver that uses this, but it is also the most
used driver by far. I think the only change is to add a flag for this and
describe how it should behave. And add v4l2-compliance tests for it.

Otherwise no changes to the control framework are needed, I think.

Controls with the ASYNC flag set would:

- return the old value from the cache.
- document that setting a new value while the operation is in progress
  results in EBUSY. Document that if the new value is equal to the old value,
  then return 0 and do nothing (alternative is to just immediately send
  the control changed event, but that might require a control framework change).
- when the operation finishes, update the cache to the new value and
  send the control changed event.
- document that userspace should specify V4L2_EVENT_SUB_FL_ALLOW_FEEDBACK
  when subscribing to the control if you calling fh wants to know when
  the operation finishes.
- document how timeouts should be handled: this is tricky, especially with
  bad hardware. I.e. if the hw doesn't send the event, does that mean that
  you are never able to set the control since it will stall?
  In the end this will just reflect how UVC handles this.

Regards,

	Hans

> 
>>>>> - We can return the new value fromt he cache
>>>>>
>>>>> Returning -EBUSY would be simpler to implement.
>>>>
>>>> Not only easy, I think it is the most correct,
>>>>
>>>>> I don't think the behaviour should depend on whether the control is read
>>>>> on the file handle that initiated the async operation or on a different
>>>>> file handle.
>>>>>
>>>>> For control set, I don't think we can do much else than returning
>>>>> -EBUSY, regardless of which file handle the control is set on.
>>>>
>>>> ACK.
>>>>
>>>>>> I will send a new version with my interpretation.
>>>>>>
>>>>>> Thanks for a great discussion
>>>>
>>>> Looking with some perspective... I believe that we should look into
>>>> the "userspace behaviour for auto controls" in a different patchset.
>>>> It is slightly unrelated to this discussion.
> 


