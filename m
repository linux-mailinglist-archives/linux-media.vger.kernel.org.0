Return-Path: <linux-media+bounces-4352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A781840652
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 14:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEC181C21986
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 13:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38EC627F6;
	Mon, 29 Jan 2024 13:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="taMynstO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFB763112
	for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 13:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706533678; cv=none; b=DPzFowY7i/3C1FNObH5zQaRstjQGt+FKHh7336DEdmbYL5D228RmcDkU8kAh47avB7QmeXPqE8dkPIZOskF/Re1fp+izW434eKIZ1Hk5vY7g3G0vncQ1E0uz5L/PiNKZTetLQySGZ9jETIYJZi3xYwI3+ZxE8p82+7/ewi5Y6OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706533678; c=relaxed/simple;
	bh=Oev+3F1IgdKHA4LrUBc7Pnry7I0PgYTem8OvVdOjjEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xgsf0MP6sdvjdgKSmDNu9lyXuktEI46QsJQpw/iy0h/hsFzCFa35cbr54wPU48wUSoXoxoggaURQvCTR+EONPIFDoLgV/gREVQ8OIMa7s+KOE4yOfjY4kue79dIx4RSEh0BsOgFI8D5dWx+S6XeKED3k2Tx1a7tI4zKVSBopZFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=taMynstO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 139C915B5;
	Mon, 29 Jan 2024 14:06:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706533596;
	bh=Oev+3F1IgdKHA4LrUBc7Pnry7I0PgYTem8OvVdOjjEw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=taMynstOI2SKX2HwUy8R6kDQ/5ViCzOGI+0DzSwTRQ44WjRhZ3zbJbiUwHSE97bPw
	 LTX05bkBF6+67+itR+TmNplkp71S3np9jBPx9y+Lw4vSeFfExPTYGXqWFwMlqRzani
	 sJzqs9jjxi5rzYfAov7qDGHLtNQUssNjWTNy7U+o=
Message-ID: <0ae87ee6-98db-43e7-b6dc-a23d7d77eb0d@ideasonboard.com>
Date: Mon, 29 Jan 2024 13:07:50 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Weird default vblank value in ov5693
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
References: <0fa07550-80cb-40f2-87c8-23864af33642@redhat.com>
 <18f20014-44b8-4f83-915d-81f265369821@ideasonboard.com>
 <1ccf4d19-4db4-48fb-a6bf-17e29cbc5f3e@redhat.com>
 <vv37qd3rqy5x6343pkiltoyqw2eyozwakmf5dcisybqynme3or@rqy2ww6hr2oq>
 <c2a0c7ae-ac72-4e26-aa83-cdd0d7f02f90@redhat.com>
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <c2a0c7ae-ac72-4e26-aa83-cdd0d7f02f90@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello

On 29/01/2024 12:24, Hans de Goede wrote:
> Hi Jacopo,
>
> On 1/29/24 13:05, Jacopo Mondi wrote:
>> Hi Hans
>>
>> On Mon, Jan 29, 2024 at 11:30:33AM +0100, Hans de Goede wrote:
>>> Hi Dan,
>>>
>>> On 1/29/24 10:53, Dan Scally wrote:
>>>> Morning Hans
>>>>
>>>>
>>>> On 28/01/2024 20:58, Hans de Goede wrote:
>>>>> Hi All,
>>>>>
>>>>> While adding vblank ctrl support to the ov2680 driver I was looking
>>>>> at the vblank ctrl code in the ov5693 and I noticed something
>>>>> which I believe is weird / undesirable.
>>>>>
>>>>> When setting a new mode the ov5693 driver does not keep the current
>>>>> vts value (adjusting vblank to keep vts and thus the framerare and
>>>>> exposure unchanged).
>>>>>
>>>>> Instead it calculates a new vts value, resetting the framerate
>>>>> to 30 fps; or 60 fps for smaller resolutions and then sets
>>>>> vblank to the new (vts - new_mode->height) and adjusts
>>>>> the exposure control-range to fit within the new vts, potentially
>>>>> also changing the exposure value.
>>>>>
>>>>> This behavior of the ov5693 code means that switching resolution
>>>>> also changes the framerate and the exposure value which seems
>>>>> undesirable.
>>>>
>>>> I think I did it that way because I was hitting problems when changing the framesize exceeded the current VTS and it seemed cleaner to just reset it to a known situation. Really though the only thing it would affect would be the framerate; that would have to reduce if the VTS increased but exposure could stay the same (though the maximum would change). So probably it ought to work like:
>>>>
>>>>
>>>> * if we change from a larger to a smaller framesize then we can just increase blanking to keep the same VTS and that should be fine
>>>>
>>>> * if we're going from a smaller to a larger framesize that fits within the currently configured VTS with minimum blanking, we can just reduce the blanking to keep the same VTS and that should be fine
>>>>
>>>> * if we're going from a smaller to a larger framesize that exceeds the currently configured VTS we drop blanking to a minimum so that the new framerate is as close to the old one as it can be
>>>>
>>>>
>>>> Does that sound like more reasonable behaviour? If so, shall I patch it?
>>> This sounds more or like what I had in mind (keep VTS unchanged if possible),
>>> so I have been looking more into this yesterday evening and
>>> implementing this is a bit tricky (*).
>>>
>>> Combining this with your last point of "that the new framerate is as
>>> close to the old one as it can be" I think I prefer a more KISS
>>> approach.
>>>
>>> IMHO the best thing (principle of least surprise) would be to
>>> on a set_fmt pad-op reset things to a default fps of say 30,
>>> as Jacopo's doc patches suggest. My reasons for suggesting
>>> this approach is:
>>>
>>> a) This is easier to implement and thus less likely to have bugs
>>> b) It leads to consistent behavior where as your suggested try to
>>> keep current vts approach leads to sometimes vts being kept, but
>>> other times when going from smaller to higher resolutions vts
>>> changing which will lead to hard to debug problems if userspace
>>> relies on vts being kept.
>>>
>>> For the ov5693 driver this would mean dropping __ov5693_calc_vts()
>>> replacing it with a DEFAULT_VTS define of:
>>>
>>> ALIGN_DOWN(OV5693_PIXEL_RATE / OV5693_FIXED_PPL / 30, 2)
>>>
>>> (does vts need to be a multiple of 2? We don't enforce that
>>>   in the vblank control)
>> Alternatively, we can reset blankings to their minimum. This is
>> 'predictable' but the end result (in example, possible higher fps)
>> might surprise applications. Please note the same reasoning applies
>> when using a vblank value that gives a known FPS as an application
>> running at 5fps might get 30fps after a set_fmt.
>>
>> The difference between the two approaches (min-blank vs.
>> known-fps-blank) is that sensors provide different FPS at different
>> resolutions, with full resolution modes sometime being limited to 5
>> fps or less, making difficult to define what the "standard fps" is for
>> all configurations.
> Good point about not all sensors being able to do 30 fps
> at their highest resolution.
>
> I'm not a fan of min-vblank as vblank default value since
> with low-height resolutions this will significantly limit
> the maximum exposure time.
>
> OTOH I do believe that we want a simple default for vblank which gets
> set on every set_mode call to keep things KISS.
>
> How about something like this: (based on your doc patch):
>
> """
> The vblank control default value is reset so that the sensor runs
> at 30 fps. Except when 30 fps cannot be achieved, in that case
> the vblank control default value is reset to the control's minimum.
>
> After adjusting the range, the vblank control's value must be set to its
> new default value for consistent behavior after applying a new frame size.
> """


In later code meant to achieve the same thing I've fallen back on the minimum vblank if it can't 
reach some pre-defined value (though I chose 15fps IIRC) - so that seems fine to me.


>
>>> What about enum/get/set frame_interval vs set_mode vs
>>> vblank ctrl ?  Options:
>>>
>>> a) Sensor drivers MUST not implement enum/get/set frame_interval?
>> Ideally they shouldn't, for RAW sensors at least.
>>
>> For YUV/RGB sensors instead the high-level parameters used by
>> frame_interval might be ok as some of those sensors might not even
>> allow you to control blankings explicitly.
>>
>> Whenever the hardware allows that, blankings should always be
>> preferred over frame_interval imho.
>>
>>> b) enum/get/set frame_interval only enum/get/set the default
>>>     frame_interval set by set_mode (e.g. fixed 30 fps).
>>>     Any vblank changes made after the set_mode are not reflected
>>>     by get_frame_interval and set_frame_interval only influences
>>>     the next set_mode call, not the current mode ? Or maybe
>>>     only allow set_frame_interval when not streaming and then
>>>     have it set vblank to match the interval like it would
>>>     have done when called before the last set_mode call ?
>>> c) enum/get/set frame_interval are a second way to control
>>>     hts (lets not go there just here for completeness sake)
>>>
>>> My own preference here would be to go with a) .
>> Mine as well, but as said for YUV/RGB sensors it might not even be
>> possible to control blankings explicitly. In this case
>> set_frame_interval can be used but if the driver registers the vblank
>> control the newly computed blanking value (in response to a
>> set_frame_interval) should be reflected there ?
> IMHO if the driver registers the vblank control then it *must not*
> implement enum/get/set frame_interval . Trying to support both at
> the same time is just going to cause pain.


Agreed

>
> Assuming a driver implementing vblank also implements hblank
> and pixelrate controls (we can make that mandatory I guess?)
> then there is no need for enum/get/set frame_interval, since
> userspace can then fully query / control the framerate
> through those controls + the frame size.
>
> Regards,
>
> Hans
>
>

