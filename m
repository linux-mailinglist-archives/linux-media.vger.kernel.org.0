Return-Path: <linux-media+bounces-4344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A37F88404ED
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 13:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E1D41F228A4
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 12:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C1B604CD;
	Mon, 29 Jan 2024 12:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EDWjnlQu"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F065604AA
	for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 12:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706531080; cv=none; b=Bi4JSc0LN/YPmIchYVIN0JTGowodK7QEnElvBvzo+rbUHkB6GJGCX4hz47ptPMX8AhLnzL+Jttm0U7rZ6bWivkt5ZV5i74Yad0bdnjiLCJky1CBv6ZHhao2Kpp26u7VsfwwZSkrHze3X8uFrt1e4Ft9LJ4IbHWhzH8zAqOvAtzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706531080; c=relaxed/simple;
	bh=mYVaOIh5WD9ED0yHOkZEOzEsVREEekh6TELfXwveZK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNGIDgmA4RNjvYd5cOj68bWmdR9VMsP/hsuxIcmaTApGrh+kJGNjHrqBNIsOTgc+G0FZEQ1MfEjROcXzvqh73nozqGOmIyzFm9+qgJXZMqMl42zl6dm0HYwKmdTaCIepiwvxRHRX8bAcgNplW1IZdKWJIHm+VzvlnlXLsp4SnSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EDWjnlQu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706531076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X1ksDuyI6F7OY9uNe4BDl7jjPkqWULO0xbvI5CWWw+k=;
	b=EDWjnlQuakimiv5Fy6FabHYsZmvtKbUP8RvZL1NtGu2Do+E3wohp7dzDrWVzJ5LWU3WlN3
	MAqT3jCzHOatK3a/fl1nxXEhXg/i6cueKRQHRUzdhUydSjTYEgSS4B8YiPqgeqg04GGSIr
	I4MTj9Kv7QsC9kPvmxY6tCzVhD2/8pQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-BAFwPFhNPEGxyYYrYS1K_g-1; Mon, 29 Jan 2024 07:24:35 -0500
X-MC-Unique: BAFwPFhNPEGxyYYrYS1K_g-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-55a6e18fdb6so1412966a12.1
        for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 04:24:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706531073; x=1707135873;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X1ksDuyI6F7OY9uNe4BDl7jjPkqWULO0xbvI5CWWw+k=;
        b=THe8Hkx7f2HLxuPAJ1GAGkrdy5JZOzEGdEeMdgu+atGsAysRiF6YV+JmWO5nP2ns/3
         mETEBng9sJfQLixKdCGiG3RYhY/Q7NyBV7mjShVqeU7JSVS0IQPWqd46mBu66PjHpttr
         a7drmsgJMZFp5d8sG3mWR5fBkl71dXOp1Qs1waZFkKGk6ESzEMR0DIoNoFln1EZ5SueN
         L8yQrEmMxLjwOR5z+I7KL6e949txyUsWhsfhAw80gTrchUlK7xszcr/A0bJr/D2IRkFJ
         MtHt16f85VewN44qdaqcG71JtL3EDoJK9AHl0hApYUODYrK1zo2+VlH7c8M3xBrcbEbq
         Gfqw==
X-Gm-Message-State: AOJu0Yx7/v2/k0KBS63q+X1mBshyQxvLcN7k4KQ9y6DNn665AOaIW5Q0
	fB1WtYmNCDn6QCnenGlrVHI2v9VYnpQy8yuN/6h+jJ311vh3mn8Ln2CJw7I0ucw/OzSVu9UOIxj
	gDklUbnbOE2rm01pTYhFoh13MX6PpuKXaz5BlfTr4SLb7XQF1i4YHIWs2AXGBQQj8KqIs
X-Received: by 2002:a05:6402:b05:b0:55f:4bc:a74b with SMTP id bm5-20020a0564020b0500b0055f04bca74bmr1472798edb.2.1706531073044;
        Mon, 29 Jan 2024 04:24:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtWeEztXJiOSmIgPSxYJiuAJvuCy1Orm2Ild/y9vf3RaqkSSR2GsdzVi1Ceo/vVa/AtH2vHQ==
X-Received: by 2002:a05:6402:b05:b0:55f:4bc:a74b with SMTP id bm5-20020a0564020b0500b0055f04bca74bmr1472788edb.2.1706531072674;
        Mon, 29 Jan 2024 04:24:32 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d15-20020a056402400f00b0055eebd3db08sm1463524eda.66.2024.01.29.04.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 04:24:31 -0800 (PST)
Message-ID: <c2a0c7ae-ac72-4e26-aa83-cdd0d7f02f90@redhat.com>
Date: Mon, 29 Jan 2024 13:24:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Weird default vblank value in ov5693
Content-Language: en-US, nl
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dan Scally <dan.scally@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
References: <0fa07550-80cb-40f2-87c8-23864af33642@redhat.com>
 <18f20014-44b8-4f83-915d-81f265369821@ideasonboard.com>
 <1ccf4d19-4db4-48fb-a6bf-17e29cbc5f3e@redhat.com>
 <vv37qd3rqy5x6343pkiltoyqw2eyozwakmf5dcisybqynme3or@rqy2ww6hr2oq>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <vv37qd3rqy5x6343pkiltoyqw2eyozwakmf5dcisybqynme3or@rqy2ww6hr2oq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jacopo,

On 1/29/24 13:05, Jacopo Mondi wrote:
> Hi Hans
> 
> On Mon, Jan 29, 2024 at 11:30:33AM +0100, Hans de Goede wrote:
>> Hi Dan,
>>
>> On 1/29/24 10:53, Dan Scally wrote:
>>> Morning Hans
>>>
>>>
>>> On 28/01/2024 20:58, Hans de Goede wrote:
>>>> Hi All,
>>>>
>>>> While adding vblank ctrl support to the ov2680 driver I was looking
>>>> at the vblank ctrl code in the ov5693 and I noticed something
>>>> which I believe is weird / undesirable.
>>>>
>>>> When setting a new mode the ov5693 driver does not keep the current
>>>> vts value (adjusting vblank to keep vts and thus the framerare and
>>>> exposure unchanged).
>>>>
>>>> Instead it calculates a new vts value, resetting the framerate
>>>> to 30 fps; or 60 fps for smaller resolutions and then sets
>>>> vblank to the new (vts - new_mode->height) and adjusts
>>>> the exposure control-range to fit within the new vts, potentially
>>>> also changing the exposure value.
>>>>
>>>> This behavior of the ov5693 code means that switching resolution
>>>> also changes the framerate and the exposure value which seems
>>>> undesirable.
>>>
>>>
>>> I think I did it that way because I was hitting problems when changing the framesize exceeded the current VTS and it seemed cleaner to just reset it to a known situation. Really though the only thing it would affect would be the framerate; that would have to reduce if the VTS increased but exposure could stay the same (though the maximum would change). So probably it ought to work like:
>>>
>>>
>>> * if we change from a larger to a smaller framesize then we can just increase blanking to keep the same VTS and that should be fine
>>>
>>> * if we're going from a smaller to a larger framesize that fits within the currently configured VTS with minimum blanking, we can just reduce the blanking to keep the same VTS and that should be fine
>>>
>>> * if we're going from a smaller to a larger framesize that exceeds the currently configured VTS we drop blanking to a minimum so that the new framerate is as close to the old one as it can be
>>>
>>>
>>> Does that sound like more reasonable behaviour? If so, shall I patch it?
>>
>> This sounds more or like what I had in mind (keep VTS unchanged if possible),
>> so I have been looking more into this yesterday evening and
>> implementing this is a bit tricky (*).
>>
>> Combining this with your last point of "that the new framerate is as
>> close to the old one as it can be" I think I prefer a more KISS
>> approach.
>>
>> IMHO the best thing (principle of least surprise) would be to
>> on a set_fmt pad-op reset things to a default fps of say 30,
>> as Jacopo's doc patches suggest. My reasons for suggesting
>> this approach is:
>>
>> a) This is easier to implement and thus less likely to have bugs
>> b) It leads to consistent behavior where as your suggested try to
>> keep current vts approach leads to sometimes vts being kept, but
>> other times when going from smaller to higher resolutions vts
>> changing which will lead to hard to debug problems if userspace
>> relies on vts being kept.
>>
>> For the ov5693 driver this would mean dropping __ov5693_calc_vts()
>> replacing it with a DEFAULT_VTS define of:
>>
>> ALIGN_DOWN(OV5693_PIXEL_RATE / OV5693_FIXED_PPL / 30, 2)
>>
>> (does vts need to be a multiple of 2? We don't enforce that
>>  in the vblank control)
> 
> Alternatively, we can reset blankings to their minimum. This is
> 'predictable' but the end result (in example, possible higher fps)
> might surprise applications. Please note the same reasoning applies
> when using a vblank value that gives a known FPS as an application
> running at 5fps might get 30fps after a set_fmt.
> 
> The difference between the two approaches (min-blank vs.
> known-fps-blank) is that sensors provide different FPS at different
> resolutions, with full resolution modes sometime being limited to 5
> fps or less, making difficult to define what the "standard fps" is for
> all configurations.

Good point about not all sensors being able to do 30 fps
at their highest resolution.

I'm not a fan of min-vblank as vblank default value since
with low-height resolutions this will significantly limit
the maximum exposure time.

OTOH I do believe that we want a simple default for vblank which gets
set on every set_mode call to keep things KISS.

How about something like this: (based on your doc patch):

"""
The vblank control default value is reset so that the sensor runs
at 30 fps. Except when 30 fps cannot be achieved, in that case
the vblank control default value is reset to the control's minimum.

After adjusting the range, the vblank control's value must be set to its
new default value for consistent behavior after applying a new frame size.
"""

>> What about enum/get/set frame_interval vs set_mode vs
>> vblank ctrl ?  Options:
>>
>> a) Sensor drivers MUST not implement enum/get/set frame_interval?
> 
> Ideally they shouldn't, for RAW sensors at least.
> 
> For YUV/RGB sensors instead the high-level parameters used by
> frame_interval might be ok as some of those sensors might not even
> allow you to control blankings explicitly.
> 
> Whenever the hardware allows that, blankings should always be
> preferred over frame_interval imho.
> 
>> b) enum/get/set frame_interval only enum/get/set the default
>>    frame_interval set by set_mode (e.g. fixed 30 fps).
>>    Any vblank changes made after the set_mode are not reflected
>>    by get_frame_interval and set_frame_interval only influences
>>    the next set_mode call, not the current mode ? Or maybe
>>    only allow set_frame_interval when not streaming and then
>>    have it set vblank to match the interval like it would
>>    have done when called before the last set_mode call ?
>> c) enum/get/set frame_interval are a second way to control
>>    hts (lets not go there just here for completeness sake)
>>
>> My own preference here would be to go with a) .
> 
> Mine as well, but as said for YUV/RGB sensors it might not even be
> possible to control blankings explicitly. In this case
> set_frame_interval can be used but if the driver registers the vblank
> control the newly computed blanking value (in response to a
> set_frame_interval) should be reflected there ?

IMHO if the driver registers the vblank control then it *must not*
implement enum/get/set frame_interval . Trying to support both at
the same time is just going to cause pain.

Assuming a driver implementing vblank also implements hblank
and pixelrate controls (we can make that mandatory I guess?)
then there is no need for enum/get/set frame_interval, since
userspace can then fully query / control the framerate
through those controls + the frame size.

Regards,

Hans



