Return-Path: <linux-media+bounces-8636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5D48984F0
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 12:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D12D289A27
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 10:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D4576046;
	Thu,  4 Apr 2024 10:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MQ4smWZj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9831D59B7F
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 10:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712226289; cv=none; b=ESanYX4iI7jLQbE/90RQojD9icqmLKmsZovX++ZVcUK5i9kNTO1ijPPppoMKjfKweVxgFC66zLKw3gCgGhTd9mfF8YbWOwO6huZ+jKrO4NaD6ebhVomqtDt3dokAF9RKWdLhn/6UGdvCqA6vJz0tFsbQLRsw0x/Zil5x9VAhD4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712226289; c=relaxed/simple;
	bh=qNSvP7Eq0jSXE2avZFBK3/L4pwA7DPXaah77Mo4wmbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J723Umc3hl6TMRGT3E+FQuH0ZlehT6LsxagWgxKlxscLgqBUDag5BT0D1N2iJ71bvMbqtil7gcF1QZbKhae5/hRWKkLpgqykwqr6xwirVWAg+5IjI9+WrSA6aDVTNUW5dNt8ZTfXAqinLWhndUeEu4EiP4xJod5zHhPhrJlLEDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MQ4smWZj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FF191A2;
	Thu,  4 Apr 2024 12:24:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712226247;
	bh=qNSvP7Eq0jSXE2avZFBK3/L4pwA7DPXaah77Mo4wmbQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MQ4smWZjP2rIr6WrQqgePJVGRRyXpltQ3alXI6KdEA9WD7aBdRyJ6VCnvNyrft8FM
	 PxZJzVEW26Cv+ksvj0yMYtGQ4P8WgAU7WlOiLu3mnr5SZstzGAbMxoFvRS88aAB5WZ
	 QMtdhEyQTj4hGyDRt2+CT4xAXdzZvUaJLM6yOkyE=
Message-ID: <41e6e800-b5db-435f-b192-5fbf8b8fa3fb@ideasonboard.com>
Date: Thu, 4 Apr 2024 13:24:42 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: v4l2-subdev: Remove stream support for the crop
 API
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
References: <20240403224233.18224-1-laurent.pinchart@ideasonboard.com>
 <ba1d234f-ec2b-4406-9c18-3e59445301de@xs4all.nl>
 <Zg5rxcKlMohGbL_U@valkosipuli.retiisi.eu>
 <81a6f089-b6ac-4871-aa0a-96b43d7bde7f@xs4all.nl>
 <20240404101923.GN23803@pendragon.ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240404101923.GN23803@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/2024 13:19, Laurent Pinchart wrote:
> On Thu, Apr 04, 2024 at 12:09:38PM +0200, Hans Verkuil wrote:
>> On 04/04/2024 10:58, Sakari Ailus wrote:
>>> On Thu, Apr 04, 2024 at 10:27:49AM +0200, Hans Verkuil wrote:
>>>> On 04/04/2024 00:42, Laurent Pinchart wrote:
>>>>> When support for streams was added to the V4L2 subdev API, the
>>>>> v4l2_subdev_crop structure was extended with a stream field, but the
>>>>> field was not handled in the core code that translates the
>>>>> VIDIOC_SUBDEV_[GS]_CROP ioctls to the selection API. This could be
>>>>> fixed, but the crop API is deprecated and shouldn't be used by new
>>>>> userspace code. It's therefore best to avoid extending it with new
>>>>> features. Drop the stream field from the v4l2_subdev_crop structure, and
>>>>> update the documentation and kernel code accordingly.
>>>>>
>>>>> Fixes: 2f91e10ee6fd ("media: subdev: add stream based configuration")
>>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>> ---
>>>>> This supersedes the "[PATCH] media: v4l2-subdev: Fix stream handling for
>>>>> crop API" patch ([1]). I'll submit matching patches for v4l2-compliance.
>>>>>
>>>>> [1] https://patchwork.linuxtv.org/project/linux-media/patch/20240401233725.2401-1-laurent.pinchart@ideasonboard.com/
>>>>> ---
>>>>>   .../userspace-api/media/v4l/vidioc-subdev-g-crop.rst        | 5 +----
>>>>>   drivers/media/v4l2-core/v4l2-subdev.c                       | 6 ------
>>>>>   include/uapi/linux/v4l2-subdev.h                            | 4 +---
>>>>>   3 files changed, 2 insertions(+), 13 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
>>>>> index 92d933631fda..7eeb7b553abf 100644
>>>>> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
>>>>> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-crop.rst
>>>>> @@ -96,10 +96,7 @@ modified format should be as close as possible to the original request.
>>>>>         - ``rect``
>>>>>         - Crop rectangle boundaries, in pixels.
>>>>>       * - __u32
>>>>> -      - ``stream``
>>>>> -      - Stream identifier.
>>>>> -    * - __u32
>>>>> -      - ``reserved``\ [7]
>>>>> +      - ``reserved``\ [8]
>>>>>         - Reserved for future extensions. Applications and drivers must set
>>>>>   	the array to zero.
>>>>>   
>>>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>>>>> index 4c6198c48dd6..02c2a2b472df 100644
>>>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>>>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>>>>> @@ -725,9 +725,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>>>>   		struct v4l2_subdev_crop *crop = arg;
>>>>>   		struct v4l2_subdev_selection sel;
>>>>>   
>>>>> -		if (!client_supports_streams)
>>>>> -			crop->stream = 0;
>>>>> -
>>>>>   		memset(crop->reserved, 0, sizeof(crop->reserved));
>>>>>   		memset(&sel, 0, sizeof(sel));
>>>>>   		sel.which = crop->which;
>>>>> @@ -749,9 +746,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>>>>   		if (crop->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
>>>>>   			return -EPERM;
>>>>>   
>>>>> -		if (!client_supports_streams)
>>>>> -			crop->stream = 0;
>>>>> -
>>>>>   		memset(crop->reserved, 0, sizeof(crop->reserved));
>>>>>   		memset(&sel, 0, sizeof(sel));
>>>>>   		sel.which = crop->which;
>>>>> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
>>>>> index 7048c51581c6..f7eea12d8a2c 100644
>>>>> --- a/include/uapi/linux/v4l2-subdev.h
>>>>> +++ b/include/uapi/linux/v4l2-subdev.h
>>>>> @@ -48,15 +48,13 @@ struct v4l2_subdev_format {
>>>>>    * @which: format type (from enum v4l2_subdev_format_whence)
>>>>>    * @pad: pad number, as reported by the media API
>>>>>    * @rect: pad crop rectangle boundaries
>>>>> - * @stream: stream number, defined in subdev routing
>>>>>    * @reserved: drivers and applications must zero this array
>>>>>    */
>>>>>   struct v4l2_subdev_crop {
>>>>>   	__u32 which;
>>>>>   	__u32 pad;
>>>>>   	struct v4l2_rect rect;
>>>>> -	__u32 stream;
>>>>> -	__u32 reserved[7];
>>>>> +	__u32 reserved[8];
>>>>>   };
>>>>
>>>> Sorry, but you can't remove this field. This field has been in the uAPI since
>>>> v6.3, and applications might be using it, even if only to set it to 0. Removing
>>>> this field will break compilation of such applications.
>>>>
>>>> Just fix the stream support instead, rather than removing it, as you did in
>>>> your original patch:
>>>>
>>>> https://lore.kernel.org/linux-media/20240401233725.2401-1-laurent.pinchart@ideasonboard.com/
>>>
>>> Referring to the discussion that has already taken place, we'd rather offer
>>> a single API to control cropping and that is the selection API. But I agree
>>> that there is a theoretical possibility someone might have set this to zero
>>> and thus compilation could fail.
>>>
>>> I'm sure this could be handled on the application still as there was never
>>> anything to configure here. Breaking binary compatibility would be a real
>>> issue but that's not what we have here.
>>
>> So there is one patch that just fixes the bug and allows the old crop API to be used
>> with streams, and one kernel patch + several v4l-utils to remove support for it and
>> potentially break compilation for applications.

This was also my argument: it looks very trivial to fix the crop API, 
and while I didn't know the extent of the effort to properly remove the 
streams support for the crop API, I had a gut feeling that it's more work.

>> It's silly to remove support when you can just fix it. Yes, there are (and have been
>> for a long time) two crop APIs (crop and selection), but as long as drivers just have
>> to deal with one API (selection), I don't really see why you care if applications use
>> the crop API. You can't remove that ioctl anyway, and the impact is minimal if it is
>> handled in the core.
>>
>> It is really too late to remove the stream field from the crop struct.
> 
> I should have replied to this e-mail instead of an earlier one in the
> thread.
> 
> No application should set the stream field to anything else than 0, as
> stream support is disabled in the mainline kernel. However, even if I
> think the risk is very small, there is indeed a risk than an application
> may be setting it to 0.
> 
>> Perhaps instead make a patch adding a comment to v4l2-subdev.h that that crop struct
>> is frozen and must not be extended with new features going forward, to prevent the
>> same thing happening in the future.
> 
> That's a good idea.
> 
>> Sorry, but I'm not going to accept this patch. It is trivial to fix the crop stream
>> support, and that patch looks good. And adding a patch to note that v4l2_subdev_crop is
>> frozen is fine as well and makes perfect sense.
> 
> Another option is to keep the stream field in the structure, document it
> as not being used (which is the current behaviour), and dropping the
> partial handling inside the kernel. I have a feeling this may not be
> favoured by many though :-)

That would work too. In that case I think we should check that the 
stream field is set to 0 if the userspace supports streams.

However, I think fixing the bug still makes most sense.

  Tomi


