Return-Path: <linux-media+bounces-22342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 747A29DE70A
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 14:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D65E8281558
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 13:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EFD119DF5F;
	Fri, 29 Nov 2024 13:13:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9391156991;
	Fri, 29 Nov 2024 13:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732886000; cv=none; b=uKp1AnhjQx1NwenNuiepf4GSeA1ZdNECHvQmJj+IInepgGB1+tN8Je0Ko7qtE9+fu+IeuPW/ksR+ncrfeCVWmzI2A2uTherYubh5c74z6UyewRVscUZLx3VG52xiViCbtXgzgJvXHGPiXl8Ht/gle1JHSVeOyIQeXC5KMeL/7uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732886000; c=relaxed/simple;
	bh=lXVzxIz6MaczSsMhbCoU8ecJVJFukXTIwVyAeUq5Qng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YHqMiX0iapu1e5nvrta60F9vXouHZD2q1Xgs9NXkJX7HLdStIa/KNZpxWfxwezRUf7qpA+eqXAMnP0i4AlzAA+4s5g4Hk3SsFicZtmY7bw9GNAE0CgFrZFFdDJJF/xcHG0X/uL3Csz6zqkLIOsSrkIqwtvFaX3ZW8SoUajYAen4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 655C4C4CECF;
	Fri, 29 Nov 2024 13:13:18 +0000 (UTC)
Message-ID: <e95b7d74-2c56-4f5a-a2f2-9c460d52fdb4@xs4all.nl>
Date: Fri, 29 Nov 2024 14:13:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] media: uvcvideo: Do not set an async control owned
 by other fh
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
 <20241127-uvc-fix-async-v2-2-510aab9570dd@chromium.org>
 <20241128222232.GF25731@pendragon.ideasonboard.com>
 <CANiDSCvyMbAffdyi7_TrA0tpjbHe3V_D_VkTKiW-fNDnwQfpGA@mail.gmail.com>
 <20241128223343.GH25731@pendragon.ideasonboard.com>
 <7eeab6bd-ce02-41a6-bcc1-7c2750ce0359@xs4all.nl>
 <CANiDSCseF3fsufMc-Ovoy-bQH85PqfKDM+zmfoisLw+Kq1biAw@mail.gmail.com>
 <20241129110640.GB4108@pendragon.ideasonboard.com>
 <CANiDSCvdjioy-OgC+dHde2zHAAbyfN2+MAY+YsLNdUSawjQFHw@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CANiDSCvdjioy-OgC+dHde2zHAAbyfN2+MAY+YsLNdUSawjQFHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/11/2024 12:54, Ricardo Ribalda wrote:
> On Fri, 29 Nov 2024 at 12:06, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>>
>> On Fri, Nov 29, 2024 at 11:59:27AM +0100, Ricardo Ribalda wrote:
>>> On Fri, 29 Nov 2024 at 11:36, Hans Verkuil wrote:
>>>> On 28/11/2024 23:33, Laurent Pinchart wrote:
>>>>> On Thu, Nov 28, 2024 at 11:28:29PM +0100, Ricardo Ribalda wrote:
>>>>>> On Thu, 28 Nov 2024 at 23:22, Laurent Pinchart wrote:
>>>>>>>
>>>>>>> Hi Ricardo,
>>>>>>>
>>>>>>> (CC'ing Hans Verkuil)
>>>>>>>
>>>>>>> Thank you for the patch.
>>>>>>>
>>>>>>> On Wed, Nov 27, 2024 at 12:14:50PM +0000, Ricardo Ribalda wrote:
>>>>>>>> If a file handle is waiting for a response from an async control, avoid
>>>>>>>> that other file handle operate with it.
>>>>>>>>
>>>>>>>> Without this patch, the first file handle will never get the event
>>>>>>>> associated with that operation, which can lead to endless loops in
>>>>>>>> applications. Eg:
>>>>>>>> If an application A wants to change the zoom and to know when the
>>>>>>>> operation has completed:
>>>>>>>> it will open the video node, subscribe to the zoom event, change the
>>>>>>>> control and wait for zoom to finish.
>>>>>>>> If before the zoom operation finishes, another application B changes
>>>>>>>> the zoom, the first app A will loop forever.
>>>>>>>
>>>>>>> Hans, the V4L2 specification isn't very clear on this. I see pros and
>>>>>>> cons for both behaviours, with a preference for the current behaviour,
>>>>>>> as with this patch the control will remain busy until the file handle is
>>>>>>> closed if the device doesn't send the control event for any reason. What
>>>>>>> do you think ?
>>>>>>
>>>>>> Just one small clarification. The same file handler can change the
>>>>>> value of the async control as many times as it wants, even if the
>>>>>> operation has not finished.
>>>>>>
>>>>>> It will be other file handles that will get -EBUSY if they try to use
>>>>>> an async control with an unfinished operation started by another fh.
>>>>>
>>>>> Yes, I should have been more precised. If the device doesn't send the
>>>>> control event, then all other file handles will be prevented from
>>>>> setting the control until the file handle that set it first gets closed.
>>>>
>>>> I think I need a bit more background here:
>>>>
>>>> First of all, what is an asynchronous control in UVC? I think that means
>>>> you can set it, but it takes time for that operation to finish, so you
>>>> get an event later when the operation is done. So zoom and similar operations
>>>> are examples of that.
>>>>
>>>> And only when the operation finishes will the control event be sent, correct?
>>>
>>> You are correct.  This diagrams from the spec is more or less clear:
>>> https://ibb.co/MDGn7F3
>>>
>>>> While the operation is ongoing, if you query the control value, is that reporting
>>>> the current position or the final position?
>>>
>>> I'd expect hardware will return either the current position, the start
>>> position or the final position. I could not find anything in the spec
>>> that points in one direction or the others.
>>
>> Figure 2-21 in UVC 1.5 indicates that the device should STALL the
>> GET_CUR and SET_CUR requests if a state change is in progress.
>>
>>> And in the driver I believe that we might have a bug handling this
>>> case (will send a patch if I can confirm it)
>>> the zoom is at 0 and you set it 10
>>> if you read the value 2 times before the camera reaches value 10:
>>> - First value will come from the hardware and the response will be cached
>>
>> Only if the control doesn't have the auto-update flag set, so it will be
>> device-dependent. As GET_CUR should stall that's not really relevant,
>> except for the fact that devices may not stall the request.
> 
> I missed that the device will likely stall during async operations.
> 
> What do you think of something like this? I believe it can work with
> compliant and non compliant devices.
> Note that the event will be received by the device that originated the
> operation, not to the second one that might receive an error during
> write/read.
> 
> 
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 4fe26e82e3d1..9a86c912e7a2 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1826,14 +1826,15 @@ static int uvc_ctrl_commit_entity(struct
> uvc_device *dev,
>                         continue;
> 
>                 /*
> -                * Reset the loaded flag for auto-update controls that were
> +                * Reset the loaded flag for auto-update controls and for
> +                * asynchronous controls with pending operations, that were
>                  * marked as loaded in uvc_ctrl_get/uvc_ctrl_set to prevent
>                  * uvc_ctrl_get from using the cached value, and for write-only
>                  * controls to prevent uvc_ctrl_set from setting bits not
>                  * explicitly set by the user.
>                  */
>                 if (ctrl->info.flags & UVC_CTRL_FLAG_AUTO_UPDATE ||
> -                   !(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
> +                   !(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) || ctrl->handle)
>                         ctrl->loaded = 0;
> 
>                 if (!ctrl->dirty)
> @@ -2046,8 +2047,18 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>         mapping->set(mapping, value,
>                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> 
> -       if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> -               ctrl->handle = handle;
> +       if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS) {
> +               /*
> +                * Other file handle is waiting for an operation on
> +                * this asynchronous control. If the device is compliant
> +                * this operation will fail.
> +                *
> +                * Do not replace the handle pointer, so the original file
> +                * descriptor will get the completion event.
> +                */
> +               if (!ctrl->handle)
> +                       ctrl->handle = handle;

I don't think this is right: you want the completion event for async
controls to go to all filehandles that are subscribed to that control.

Which is what happens if handle == NULL (as I understand the code).

Regards,

	Hans

> +       }
> 
>         ctrl->dirty = 1;
>         ctrl->modified = 1;
> 
>>
>>> - Second value will be the cached one
>>>
>>> now the camera  is at zoom 10
>>> If you read the value, you will read the cached value
>>>
>>>> E.g.: the zoom control is at value 0 and I set it to 10, then I poll the zoom control
>>>> value: will that report the intermediate values until it reaches 10? And when it is
>>>> at 10, the control event is sent?
>>>>
>>>>>>>> Cc: stable@vger.kernel.org
>>>>>>>> Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
>>>>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>>>>>> ---
>>>>>>>>  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++++
>>>>>>>>  1 file changed, 4 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
>>>>>>>> index b6af4ff92cbd..3f8ae35cb3bc 100644
>>>>>>>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
>>>>>>>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
>>>>>>>> @@ -1955,6 +1955,10 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>>>>>>>>       if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
>>>>>>>>               return -EACCES;
>>>>>>>>
>>>>>>>> +     /* Other file handle is waiting a response from this async control. */
>>>>>>>> +     if (ctrl->handle && ctrl->handle != handle)
>>>>>>>> +             return -EBUSY;
>>>>>>>> +
>>>>>>>>       /* Clamp out of range values. */
>>>>>>>>       switch (mapping->v4l2_type) {
>>>>>>>>       case V4L2_CTRL_TYPE_INTEGER:
>>
>> --
>> Regards,
>>
>> Laurent Pinchart
> 
> 
> 


