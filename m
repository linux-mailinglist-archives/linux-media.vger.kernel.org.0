Return-Path: <linux-media+bounces-22318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F15F9DC235
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 11:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1F122827AB
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 10:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A42818EFC1;
	Fri, 29 Nov 2024 10:36:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8596155345;
	Fri, 29 Nov 2024 10:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732876599; cv=none; b=XIZ19U/JtKHAT7I/y2jj9BpyeGBwKr13U5yS7xQKMUfcAO83BhENAS242D/Js6YJwOQRAVaZJYg+zS1Hvmk1rwwKZpsrwUcAuTPKRNsQLb37EC/Z1wLaHKT2ab6nhDDVtk/DuVKKlfUQ1B9Ljkx1wmwI2O+Dl3ymV9LMWR6+EvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732876599; c=relaxed/simple;
	bh=jKsOOgs+1d08MKXqRk7tvUNF+e0pZEzXaBOGjn6r4to=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kyuXU4TQprceTV/sepXjYm3pm9LCqlDbZKDZGI1KFIBVXgwMDE0Mby9BqExweQZG1OBwTtWYnjxZhfDFsftNYc1tV5MJSrrBP+ENwfwv0DEyd+E0gZbrZlC0p+uBZeNnuyLxqjigSYZIi3R5XQHKkzypyo/CRXb1EAdgA1nGza4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CBD7C4CECF;
	Fri, 29 Nov 2024 10:36:37 +0000 (UTC)
Message-ID: <7eeab6bd-ce02-41a6-bcc1-7c2750ce0359@xs4all.nl>
Date: Fri, 29 Nov 2024 11:36:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] media: uvcvideo: Do not set an async control owned
 by other fh
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>
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
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20241128223343.GH25731@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent, Ricardo,

On 28/11/2024 23:33, Laurent Pinchart wrote:
> On Thu, Nov 28, 2024 at 11:28:29PM +0100, Ricardo Ribalda wrote:
>> On Thu, 28 Nov 2024 at 23:22, Laurent Pinchart wrote:
>>>
>>> Hi Ricardo,
>>>
>>> (CC'ing Hans Verkuil)
>>>
>>> Thank you for the patch.
>>>
>>> On Wed, Nov 27, 2024 at 12:14:50PM +0000, Ricardo Ribalda wrote:
>>>> If a file handle is waiting for a response from an async control, avoid
>>>> that other file handle operate with it.
>>>>
>>>> Without this patch, the first file handle will never get the event
>>>> associated with that operation, which can lead to endless loops in
>>>> applications. Eg:
>>>> If an application A wants to change the zoom and to know when the
>>>> operation has completed:
>>>> it will open the video node, subscribe to the zoom event, change the
>>>> control and wait for zoom to finish.
>>>> If before the zoom operation finishes, another application B changes
>>>> the zoom, the first app A will loop forever.
>>>
>>> Hans, the V4L2 specification isn't very clear on this. I see pros and
>>> cons for both behaviours, with a preference for the current behaviour,
>>> as with this patch the control will remain busy until the file handle is
>>> closed if the device doesn't send the control event for any reason. What
>>> do you think ?
>>
>> Just one small clarification. The same file handler can change the
>> value of the async control as many times as it wants, even if the
>> operation has not finished.
>>
>> It will be other file handles that will get -EBUSY if they try to use
>> an async control with an unfinished operation started by another fh.
> 
> Yes, I should have been more precised. If the device doesn't send the
> control event, then all other file handles will be prevented from
> setting the control until the file handle that set it first gets closed.

I think I need a bit more background here:

First of all, what is an asynchronous control in UVC? I think that means
you can set it, but it takes time for that operation to finish, so you
get an event later when the operation is done. So zoom and similar operations
are examples of that.

And only when the operation finishes will the control event be sent, correct?

While the operation is ongoing, if you query the control value, is that reporting
the current position or the final position?

E.g.: the zoom control is at value 0 and I set it to 10, then I poll the zoom control
value: will that report the intermediate values until it reaches 10? And when it is
at 10, the control event is sent?

Regards,

	Hans

> 
>>>> Cc: stable@vger.kernel.org
>>>> Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>> ---
>>>>  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
>>>> index b6af4ff92cbd..3f8ae35cb3bc 100644
>>>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
>>>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
>>>> @@ -1955,6 +1955,10 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>>>>       if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
>>>>               return -EACCES;
>>>>
>>>> +     /* Other file handle is waiting a response from this async control. */
>>>> +     if (ctrl->handle && ctrl->handle != handle)
>>>> +             return -EBUSY;
>>>> +
>>>>       /* Clamp out of range values. */
>>>>       switch (mapping->v4l2_type) {
>>>>       case V4L2_CTRL_TYPE_INTEGER:
> 


