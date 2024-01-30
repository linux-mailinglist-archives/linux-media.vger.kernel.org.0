Return-Path: <linux-media+bounces-4399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6FC842142
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 11:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89E9E2868E6
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 10:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EDC560DE0;
	Tue, 30 Jan 2024 10:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aFxJBxRU"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6102160B8F
	for <linux-media@vger.kernel.org>; Tue, 30 Jan 2024 10:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706610570; cv=none; b=mlTuPjafewtVh87Y/SxHbhsXmm4Y7cP/XKrBjECw06oiserhtnkOmncns6s1rdHvgYUni5NX55RKJg/HuY2zHj09wOMOvuDgQo5ZsbWKL4nwZ4nEDt9+C8e8jhHJeVixxpQ5Y7wGnE7hnbxsRCiWk7zTief9u3HsdbiK834xpt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706610570; c=relaxed/simple;
	bh=s31hK5USkhi6YFxeTkINRQNTmALn827uJ4KMDq8Xzsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FKdDW6rOrmFNmBfz6g0ARbZDw4lA5QTUBpZBqHo/2H8v2uIeX+d3RsovJZVSywZne6IbvdqH/hRetFLhjezqNJhqgPvu+6ZsVapclD12/NVe7jKZuj1ge5+Op8vFP72uoR+CBXoeAPV0Bizm2szhehQsuotB39Qb61XXvINyY6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aFxJBxRU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706610567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b9hM0RtvKmP2YztcCCP6XiRFp4VWl+C6eHRHVY6b8XY=;
	b=aFxJBxRUkzfxUddWNaifBgAlpz2kpwfBpJNTy9UXmVjf5mC/wgKkc36vWxBydRpqhVGGMi
	VLM50wT4icFfOQxLjX0nDCE3DqGLoMFZsRRaSftmWi9pgloD525OyuVtC7RPTbNwPKQtj6
	dJO0uaFWPReTOqAicz0jZMVopxJ1+74=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-dedOEDG-MG2n1ySf2z26cA-1; Tue, 30 Jan 2024 05:29:25 -0500
X-MC-Unique: dedOEDG-MG2n1ySf2z26cA-1
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-7d3184d4989so2103954241.0
        for <linux-media@vger.kernel.org>; Tue, 30 Jan 2024 02:29:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706610565; x=1707215365;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b9hM0RtvKmP2YztcCCP6XiRFp4VWl+C6eHRHVY6b8XY=;
        b=Je7LaMXU+sFUNfpsbzoiakMDO4Pyej0SlgoPNLK9a0RoICaU19JEZnxck8Dn7P1Gtb
         ARjPM3qgH5+bBgm3WOvisFLj22p4PovNZBgXWSIHQJ/my1RsOrebz+An14d1htmJxXXR
         o7718m8SYW1ebXmSuPp2VydI3R4PxYsnsYSOBB1Etz50nGTlRV9MiroNP8pkmWdVXKEv
         DfTmvcWMFLy9uglOyZlIVlD36aWMCZhUmLSuxWDr/HCEKMbWXeuv5DDYGXfpKLs3K13I
         Opj1s0JJL5usyLfsYZVf+sRlvpPojweUUlQGKeOYSn3992DRitqYkwwQCrtGj2YXxrxr
         P47A==
X-Gm-Message-State: AOJu0YyOQr8dehvklmmMegB4H4mn9MahDeqXhj6pS20UuyuBQ8QvKYbK
	tyBbWe7wr8uQsrwy/+fXXXQ5vO+OhToKXF/2LXKEaOmPVH2/3WV260n/iymvGDHtJlf85adj5HN
	xaDcBlSvkR0b1lKWdftZ5tDlwKSPCa7bp2WABfHOv+B2tLf4BIpaQ7d2Rtoux
X-Received: by 2002:a67:f546:0:b0:46b:2a0b:f619 with SMTP id z6-20020a67f546000000b0046b2a0bf619mr5093787vsn.12.1706610564485;
        Tue, 30 Jan 2024 02:29:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwI6s/uQjMbgCLyzPZgRv3b9NMF2N94NV7GqpR1R9zMVufVoL+qwbDd2ZuX24SuUYKL6MDmg==
X-Received: by 2002:a67:f546:0:b0:46b:2a0b:f619 with SMTP id z6-20020a67f546000000b0046b2a0bf619mr5093777vsn.12.1706610564098;
        Tue, 30 Jan 2024 02:29:24 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p45-20020a9f36b0000000b007d5f6509558sm92599uap.11.2024.01.30.02.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 02:29:22 -0800 (PST)
Message-ID: <348016db-d2ee-4bc3-b1f6-faf545f3c805@redhat.com>
Date: Tue, 30 Jan 2024 11:29:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Weird default vblank value in ov5693
Content-Language: en-US, nl
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dan Scally <dan.scally@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <0fa07550-80cb-40f2-87c8-23864af33642@redhat.com>
 <18f20014-44b8-4f83-915d-81f265369821@ideasonboard.com>
 <1ccf4d19-4db4-48fb-a6bf-17e29cbc5f3e@redhat.com>
 <vv37qd3rqy5x6343pkiltoyqw2eyozwakmf5dcisybqynme3or@rqy2ww6hr2oq>
 <c2a0c7ae-ac72-4e26-aa83-cdd0d7f02f90@redhat.com>
 <y6j4rglwcuum4wfq2cjk56zxdnrk7stwoldsshq5d4knubq5ve@jb6vaj5jfwz3>
 <cd065a7e-08ca-42a8-bd9f-96aa2d4d9288@redhat.com>
 <ZbfxId264Ect_wpb@kekkonen.localdomain>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZbfxId264Ect_wpb@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 1/29/24 19:40, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Jan 29, 2024 at 06:18:08PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 1/29/24 15:45, Jacopo Mondi wrote:
>>> Hi Hans
>>>
>>> +dave, laurent and sakari
>>>
>>> On Mon, Jan 29, 2024 at 01:24:31PM +0100, Hans de Goede wrote:
>>>> Hi Jacopo,
>>>>
>>>> On 1/29/24 13:05, Jacopo Mondi wrote:
>>>>> Hi Hans
>>>>>
>>
>> <snip (getting too long)>
>>
>>>> OTOH I do believe that we want a simple default for vblank which gets
>>>> set on every set_mode call to keep things KISS.
>>>>
>>>> How about something like this: (based on your doc patch):
>>>>
>>>> """
>>>> The vblank control default value is reset so that the sensor runs
>>>> at 30 fps. Except when 30 fps cannot be achieved, in that case
>>>> the vblank control default value is reset to the control's minimum.
>>>>
>>>> After adjusting the range, the vblank control's value must be set to its
>>>> new default value for consistent behavior after applying a new frame size.
>>>> """
>>>>
>>>
>>> Sorry but I'm not super excited about blessing 30fps as the
>>> preferred or suggested setting in the documentation. For some use
>>> cases 30fps might be extremely slow or extremely fast, if a sensor or
>>> a mode cannot achieve this we then suggest the minimum... not sure
>>> what's best. What's others opinion here ?
>>
>> I'm fine with loosing the 30 fps language. I was actually
>> already thinking about dropping specifying 30 fps myself.
>>
>> In the pending documentation patch you write:
>>
>> "The value used to initialize the vertical and horizontal blanking controls
>> should be selected in order to realize, in association with the driver default
>> format and default pixel rate, a reasonable frame rate output, usually one of
>> the standard 15, 30 or 60 frame per second."
>>
>> How about:
>>
>> "When a new frame size is applied on the subdevice, sensor drivers are required
>> to update the limits of their blankings controls.
>>
>> ... part about calling __v4l2_ctrl_modify_range()...
>>
>> The control's default value is adjusted to achieve a reasonable framerate
>> again and the control's value is set to the new default for consistent
>> behavior after applying a new frame size."
>>
>> ?
>>
>> This basically blesses the existing ov5693 driver's behavior :)
> 
> What would be the purpose of this? Presumably the user space will set the
> vblank value based on its needs in any case, before starting streaming.

As I mentioned currently libcamera's sensor class sets vblank to its
default value at initialization time and some pipelines simply leave
it there so having a somewhat sane default is important to not have
a very high fps / have low max exposure for modes with a low height.

> It would require changing many that currently don't have this. Changing
> this could also adversely affect some user space software but presumably is
> unlikely to break it.

This is mostly to have clear guidelines for when adding vblank support
to existing drivers without vblank support.

Existing drivers often have a fixed vts value independend of the mode /
amount of cropping so that they always run at a fixed fps.

Ideally we would not change the behavior of these drivers when adding
vblank control. Having these drivers pick a default vblank value
(when adjusting the range) so that the old fixed vts is again achieved
and then resetting vblank to that default value ensures that the behavior
of the driver does not change for userspace which does not touch vblank.

Where as for userspace implementations which already set vblank to
their own value the default does not matter.

>>> Maybe we're getting too concerned on this, as if an application sets a
>>> new mode, it's likely setting new blankings and exposure as well..
>>
>> ATM libcamera sets vblank to whatever default the sensor driver
>> advertises and not all pipelines change it after that, so IMHO we
>> need to have a somewhat sane default (and we probably want
>> libcamera pipelines to do a bit better, esp. with increasing
>> vblank to allow higher exposure in low light conditions).
> 
> It should be easy to calculate the right value, given the necessary
> information. This is related to the needs of improving the sensor APIs for
> register list based drivers.

IMHO it is important to where possible not change the behavior
of register list based drivers when adding improvements like
vblank control. As I said above these often use a fixed vts
for modes, the idea is to set a default vblank value so that
the vts does not change compared to before the introduction
of the vblank control.

This is just about the default value after a set_mode pad-op
call. Vblank aware userspace will likely override that anyway.

Regards,

Hans




