Return-Path: <linux-media+bounces-22418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA54F9DFEDA
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 11:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85A71282210
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 10:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881BF1FC7EE;
	Mon,  2 Dec 2024 10:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iR1LSF1d"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577E91FC0F1
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 10:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733135226; cv=none; b=lvmkj04n9vQlsy2AMCY8/OtnkU/xXt6oAmN7JaEFpOFSe0JFiONP5koQGY22L0n5iSgWgmQC0XoxW5+JSZRJ0SQOSt1hW+XizS7g8YOel+J4T9nOYb8T7w0eGTpjyU0bCbS4dNVCCuU513JMt/9Q6PDZEUFeoYR8D5eQIu9anPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733135226; c=relaxed/simple;
	bh=Qm18nmdPbK1yCplSK0aveG7jD4t0nJNgTHkQRw9EWcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AXehE5M2stPFUtqbW70TmL+AevFNzecprdS4NweUwL9Xtg/tCRUKO65+iiAonWh/Z2HIgKW4UUaZyUHw3vH6hsYRmeavG1PEi9Qjy3864e35gMyoU289Td+65tPMlOlYPjy4YVsIQANzTjnUDNKZDaCHiqibMuwaPCDrdSpI8Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iR1LSF1d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733135222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bDw5czFk83J50FNgjXOPyEXoRewa5ALY7gP0sfhBomM=;
	b=iR1LSF1d8glVAUzoJijKmAZ9myMGVcNwI/3+r8jRXT5dVCoyCorjfBuoOzRLJW6Qj1RmEb
	uJgs9VzIktyb82IrONX1+7lEIrrAYloXy31gs1PEEa014visyVUt9/v8nBPMs3m0lVdsGC
	odURHbWgbBoiNA0CkbwPrpsuO+43Zko=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-DPNJjP9pMSiHzFd8hsMopQ-1; Mon, 02 Dec 2024 05:27:01 -0500
X-MC-Unique: DPNJjP9pMSiHzFd8hsMopQ-1
X-Mimecast-MFC-AGG-ID: DPNJjP9pMSiHzFd8hsMopQ
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa538575f0fso391999566b.1
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 02:27:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733135220; x=1733740020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bDw5czFk83J50FNgjXOPyEXoRewa5ALY7gP0sfhBomM=;
        b=FoIBIJN5S1SchGXzCinaYd6oQ4hO8q8mTcs0SA7U76xzPVTBcjUquxE23Wfup/lx3Y
         Scr+UtPF+Buuxkrx7y7brHI4DRsk38QNzaYbaIKj7nIb3fEjcx6sWYJ09c1+5eiAUnlz
         RQUHSo0G9nrC1I5N4OQSAZfR0w+ZmNYHpF4aB8YTfmjgb8D8CYd2/gk67rMmWC8m3qM8
         1ELk/wrJ8LAX0a1T/iBUEQXxjqQQeAXCK2Qlnfqj8FY2pk5H31Q0qXJBiYTShdrpb21g
         5svcWlr4Bz1ljyvDJ45sz37TSTALihzwJ/uCoWpuUNBLhv6pfmx3cZoNCRt3sg7Zb100
         zhbA==
X-Forwarded-Encrypted: i=1; AJvYcCX7SR5MhlKvKXvppJUuwpg+xe8Sy57CrXXcJZJ9bq8kem5Z3DrQWNgxBvt+4BipfgG0K87FgXJAQmvw5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy66srP2t7JFaX5/fZmadeaoaGZwc86hgdkT9AW5XloPPFWwekM
	v1mAKtTlyDJeCVToAqK1gNDyPggt/wghrs+M9QW/4lxyXhjsTsB8AILxGF8VCBn385A1eGy7I9N
	T2lB/JerA/fp4mXHT9W1KUPZaV4fVv8Q4BeL3eNwmgQ6V+oMmY+JejOuPBPgG
X-Gm-Gg: ASbGncsPqPNyyuCUWLGKiA0ouefVeA7feeTDaE+ppv7U6wU6FvnsZjjtKFcS46oomtA
	oWFxrDPYaqc7+d7Rsb4hWxWhM0kTg3JKC83qgxrAUc1431+762MTHZ4JhkX7Da1fO7hE3SjK3ZJ
	jvZkMf+/PmiEeG97jaxNQbj5mcV1EfkY1KDnNh+q3YFB+5rWyQ3rgIMWDUfnDRYiUKgQvQnZXgE
	ZxDU2o5Rn6vVrVINLqb5ZJo9Zrq1FqAnpSPrcn+fw2icqaNtzojKA==
X-Received: by 2002:a17:906:3d29:b0:aa5:63a1:17cf with SMTP id a640c23a62f3a-aa580f23e33mr2320888366b.20.1733135219912;
        Mon, 02 Dec 2024 02:26:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsA6/gFrLFxfARxK+FxZz9IDf9ZEHoUGm6qZQ6mQds0yqle5QU9+PsBTkhv9f7s5dynA66Gw==
X-Received: by 2002:a17:906:3d29:b0:aa5:63a1:17cf with SMTP id a640c23a62f3a-aa580f23e33mr2320886066b.20.1733135219473;
        Mon, 02 Dec 2024 02:26:59 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c19b5sm491004666b.5.2024.12.02.02.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 02:26:59 -0800 (PST)
Message-ID: <633ca07b-6795-429f-874d-474a68396f45@redhat.com>
Date: Mon, 2 Dec 2024 11:26:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] media: uvcvideo: Do not set an async control owned
 by other fh
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
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
 <445e551c-c527-443c-8913-6999455bd366@xs4all.nl>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <445e551c-c527-443c-8913-6999455bd366@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2-Dec-24 9:44 AM, Hans Verkuil wrote:
> On 02/12/2024 09:11, Laurent Pinchart wrote:
>> On Mon, Dec 02, 2024 at 09:05:07AM +0100, Hans Verkuil wrote:
>>> On 02/12/2024 01:18, Laurent Pinchart wrote:
>>>> On Fri, Nov 29, 2024 at 11:18:54PM +0100, Ricardo Ribalda wrote:
>>>>> On Fri, 29 Nov 2024 at 23:03, Laurent Pinchart wrote:
>>>>>> On Fri, Nov 29, 2024 at 07:47:31PM +0100, Ricardo Ribalda wrote:
>>>>>>> Before we all go on a well deserved weekend, let me recap what we
>>>>>>> know. If I did not get something correctly, let me know.
>>>>>>>
>>>>>>> 1) Well behaved devices do not allow to set or get an incomplete async
>>>>>>> control. They will stall instead (ref: Figure 2-21 in UVC 1.5 )
>>>>>>> 2) Both Laurent and Ricardo consider that there is a big chance that
>>>>>>> some camera modules do not implement this properly. (ref: years of
>>>>>>> crying over broken module firmware :) )
>>>>>>>
>>>>>>> 3) ctrl->handle is designed to point to the fh that originated the
>>>>>>> control. So the logic can decide if the originator needs to be
>>>>>>> notified or not. (ref: uvc_ctrl_send_event() )
>>>>>>> 4) Right now we replace the originator in ctrl->handle for unfinished
>>>>>>> async controls.  (ref:
>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvc_ctrl.c#n2050)
>>>>>>>
>>>>>>> My interpretation is that:
>>>>>>> A) We need to change 4). We shall not change the originator of
>>>>>>> unfinished ctrl->handle.
>>>>>>> B) Well behaved cameras do not need the patch "Do not set an async
>>>>>>> control owned by another fh"
>>>>>>> C) For badly behaved cameras, it is fine if we slightly break the
>>>>>>> v4l2-compliance in corner cases, if we do not break any internal data
>>>>>>> structure.
>>>>>>
>>>>>> The fact that some devices may not implement the documented behaviour
>>>>>> correctly may not be a problem. Well-behaved devices will stall, which
>>>>>> means we shouldn't query the device while as async update is in
>>>>>> progress. Badly-behaved devices, whatever they do when queried, should
>>>>>> not cause any issue if we don't query them.
>>>>>
>>>>> I thought we could detect the stall and return safely. Isn't that the case?
>>>>
>>>> We could, but if we know the device will stall anyway, is there a reason
>>>> not to avoid issuing the request in the first place ?
>>>>
>>>>> Why we have not seen issues with this?
>>>>
>>>> I haven't tested a PTZ device for a very long time, and you would need
>>>> to hit a small time window to see the issue.
>>>>
>>>>>> We should not send GET_CUR and SET_CUR requests to the device while an
>>>>>> async update is in progress, and use cached values instead. When we
>>>>>> receive the async update event, we should clear the cache. This will be
>>>>>> the same for both well-behaved and badly-behaved devices, so we can
>>>>>> expose the same behaviour towards userspace.
>>>>>
>>>>> seting ctrl->loaded = 0 when we get an event sounds like a good idea
>>>>> and something we can implement right away.
>>>>> If I have to resend the set I will add it to the end.
>>>>>
>>>>>> We possibly also need some kind of timeout mechanism to cope with the
>>>>>> async update event not being delivered by the device.
>>>>>
>>>>> This is the part that worries me the most:
>>>>> - timeouts make the code fragile
>>>>> - What is a good value for timeout? 1 second, 30, 300? I do not think
>>>>> that we can find a value.
>>>>
>>>> I've been thinking about the implementation of uvc_fh cleanup over the
>>>> weekend, and having a timeout would have the nice advantage that we
>>>> could reference-count uvc_fh instead of implementing a cleanup that
>>>> walks over all controls when closing a file handle. I think it would
>>>> make the code simpler, and possibly safer too.
>>>>
>>>>>> Regarding the userspace behaviour during an auto-update, we have
>>>>>> multiple options:
>>>>>>
>>>>>> For control get,
>>>>>>
>>>>>> - We can return -EBUSY
>>>>>> - We can return the old value from the cache
>>>
>>> This would match the control behavior best. Only when the operation is
>>> done is the control updated and the control event sent.
>>>
>>> Some questions: is any of this documented for UVC? Because this is non-standard
>>
>> No this isn't documented.
>>
>>> behavior. Are there applications that rely on this? Should we perhaps add
>>
>> I don't know.
>>
>>> proper support for this to the control framework? E.g. add an ASYNC flag and
>>> document this?
>>
>> We could, but this is such a specific use case that I don't think is
>> worth adding complexity to the already complex control framework would
>> be worth it. What we could do is perhaps adding a flag for the userspace
>> API, but even there, I never like modelling an API with a single user.
> 
> Well, it might be a single driver that uses this, but it is also the most
> used driver by far. I think the only change is to add a flag for this and
> describe how it should behave. And add v4l2-compliance tests for it.
> 
> Otherwise no changes to the control framework are needed, I think.
> 
> Controls with the ASYNC flag set would:
> 
> - return the old value from the cache.
> - document that setting a new value while the operation is in progress
>   results in EBUSY. Document that if the new value is equal to the old value,
>   then return 0 and do nothing (alternative is to just immediately send
>   the control changed event, but that might require a control framework change).
> - when the operation finishes, update the cache to the new value and
>   send the control changed event.
> - document that userspace should specify V4L2_EVENT_SUB_FL_ALLOW_FEEDBACK
>   when subscribing to the control if you calling fh wants to know when
>   the operation finishes.
> - document how timeouts should be handled: this is tricky, especially with
>   bad hardware. I.e. if the hw doesn't send the event, does that mean that
>   you are never able to set the control since it will stall?
>   In the end this will just reflect how UVC handles this.

I have been catching up on this thread (I have not read the v3 and v4
threads yet).

This all started with Ricardo noticing that ctrl->handle may get
overwritten when another app sets the ctrl, causing the first app
to set the ctrl to get a V4L2_EVENT for the ctrl (if subscribed)
even though it set the ctrl itself.

My observations so far:

1. This is only hit when another app changes the ctrl after the first app,
in this case, if there is no stall issued by the hw for the second app's
request, arguably the first app getting the event for the ctrl is correct
since it was changed by the second app. IOW I think the current behavior
is not only fine, but even desirable. Assuming we only override ctrl->handle
after successfully sending the set-ctrl request to the hardware.

2. This adds a lot of complexity for not sending an event to the app
which made the change. Hans V. suggested maybe adding some sort of flag
for async ctrls to the userspace API. I wonder if we should not just
get rid of this complexity and document that these controls will always
generate events independent of V4L2_EVENT_SUB_FL_ALLOW_FEEDBACK ?
That would certainly simplify things, but it raises the questions if
this will cause issues for existing applications.

Note that if we simply return -EBUSY on set until acked by a status
event we also avoid the issue of ctrl->handle getting overwritten,
but that relies on reliable status events; or requires timeout handling.

3. I agree with Ricardo that a timeout based approach for cameras which
to not properly send status events for async ctrls is going to be
problematic. Things like pan/tilt homing can take multiple seconds which
is really long to use as a timeout if we plan to return -EBUSY until
the timeout triggers. I think it would be better to just rely on
the hardware sending a stall, or it accepting and correctly handling
a new CUR_SET command while the previous one is still being processed.

I guess we can track if the hw does send status events when async ctrls
complete and then do the -EBUSY thing without going out to the hw after
the first time an async ctrl has been acked by a status event.

And then combine that with the current behavior of overwriting ctrl->handle
until the ctrl has been marked as having working status events. So:

a) In case we do not know yet if a ctrl gets status-event acks; and
on devices without reliable status events keep current behavior.

b) As soon as we know a ctrl has reliable status events, switch to
returning -EBUSY if a set is pending (as indicated by ctrl->handle
being set).

I don't like the fact that this changes the behavior after the first
status event acking an async ctrl, but I don't really see another way.

Regards,

Hans




>>
>>>>>> - We can return the new value fromt he cache
>>>>>>
>>>>>> Returning -EBUSY would be simpler to implement.
>>>>>
>>>>> Not only easy, I think it is the most correct,
>>>>>
>>>>>> I don't think the behaviour should depend on whether the control is read
>>>>>> on the file handle that initiated the async operation or on a different
>>>>>> file handle.
>>>>>>
>>>>>> For control set, I don't think we can do much else than returning
>>>>>> -EBUSY, regardless of which file handle the control is set on.
>>>>>
>>>>> ACK.
>>>>>
>>>>>>> I will send a new version with my interpretation.
>>>>>>>
>>>>>>> Thanks for a great discussion
>>>>>
>>>>> Looking with some perspective... I believe that we should look into
>>>>> the "userspace behaviour for auto controls" in a different patchset.
>>>>> It is slightly unrelated to this discussion.
>>
> 
> 


