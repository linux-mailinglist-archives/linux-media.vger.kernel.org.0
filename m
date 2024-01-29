Return-Path: <linux-media+bounces-4367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 775BA8410A4
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 18:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 020FE1F2497A
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 17:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038F0158D71;
	Mon, 29 Jan 2024 17:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BM6mv5pA"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D880376053
	for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 17:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706548696; cv=none; b=g+sKvKqSP7hjSzoFyASUk7vNjvGHmLAZ8ceqscjgWBydj85kyFmF6s5vAZfEgD9pQ6TR/JACKgsH4wpUfjY0iPyPRX2R1QsHrJWOEC6t6GwA7H8ubdXtbsDVvkyaGvRHcruaYHdahXWzDsUdZjZZyH/R7NH47WBbLabRCDrJJfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706548696; c=relaxed/simple;
	bh=kppf6wnVGdHH/fbByXOjnfU3h1AmV1fqi4go/QPKOSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aYNuHVfiELyBUDJP3QD0OTbizCckT6hapnziYP1VI3NKFA/DovUx063VIQTXueJtV3nJzwF+x0I0zKP28Z6Qq+TJ5/k2BMaH8Qhs2dnG2D5LntOSb/L3Yo77KNA3GBf7QcudyRS6UHtqx9fzjRckRaiTbuigSBHpSrtz3X8onQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BM6mv5pA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706548693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EBqh7BNVlhfTJmhWix2+W19HIeFeVxisjkgym+DC/UI=;
	b=BM6mv5pALTN2rkKiYZiQPfZuXJehvC4cXmuCeSCYd2J6QwPTi3YfcFIzbSGQFzGDkNwhat
	wb6Gm0PZ1zRiq7AF/ZdtflXZ4ru703tZd+Ac+0zVMwsLVSfWN2PrdxNYgDxynZJjcUVeL9
	45k7lCF1PqRag3fyKKWYChJIMLE8w+Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-d-fW5K3dOY65JZbOdVl0hw-1; Mon, 29 Jan 2024 12:18:11 -0500
X-MC-Unique: d-fW5K3dOY65JZbOdVl0hw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a35992e7b85so67220766b.3
        for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 09:18:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706548690; x=1707153490;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EBqh7BNVlhfTJmhWix2+W19HIeFeVxisjkgym+DC/UI=;
        b=jhj24asq98Cu7m3OyOZCBHN9n+1RPwmj+BAFQI10sCxjsd2YpcJI91vitVCdEAc69i
         qtrBgefkXehdy+A5Hi87cYLIGd9HLDZrr4k27p1m1M/bVEIk1CmkbqDYGPYNePzcorLP
         g0lGQybZkSVtwiymdPf+SK8zDCE4MCRGFhqLy963IoUklVdGlBgp+xTKOhj9ZUyyOXtY
         NU+kTGv8+4nGUd+nJHpr/7IIS9EnfQPSbAzg2chend5OYcvGhEJDxzwP0LHOJRpQysPz
         TT1T0soUqEUHIIVKeYQXR0+vTuM3JcbxMGUcgAb/Ck1268SQXuxFg//hcRsVgeOLlI+O
         jTiQ==
X-Gm-Message-State: AOJu0YyBHEtGFhD5eLC0y3VUMbjN7TNr/dNi7BIBnQX+O0P5sccvIynq
	/NPAXA3tCZ255etDFzi8uhrfuZOjQaEnXFOEqiW826coddRyYw8wz9UkjtVc7oz99Qxl248Oc+1
	Tpdi5na0j4V1JXT5zQDZstcwuvF3fem3mZ89KdlJg/36jS6BR6ACheC9LPo2T
X-Received: by 2002:a17:906:6c90:b0:a26:98ee:9fc0 with SMTP id s16-20020a1709066c9000b00a2698ee9fc0mr4690647ejr.43.1706548690524;
        Mon, 29 Jan 2024 09:18:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqLkbCsYXw9zaoldlVKDWnwQmYe093BEZ35vd2D1z5oBBZSfnewQNsH9Oyslo6pIP/TAr38g==
X-Received: by 2002:a17:906:6c90:b0:a26:98ee:9fc0 with SMTP id s16-20020a1709066c9000b00a2698ee9fc0mr4690623ejr.43.1706548690149;
        Mon, 29 Jan 2024 09:18:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id hz24-20020a1709072cf800b00a2ed5d9ea19sm4096315ejc.190.2024.01.29.09.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 09:18:09 -0800 (PST)
Message-ID: <cd065a7e-08ca-42a8-bd9f-96aa2d4d9288@redhat.com>
Date: Mon, 29 Jan 2024 18:18:08 +0100
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
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <0fa07550-80cb-40f2-87c8-23864af33642@redhat.com>
 <18f20014-44b8-4f83-915d-81f265369821@ideasonboard.com>
 <1ccf4d19-4db4-48fb-a6bf-17e29cbc5f3e@redhat.com>
 <vv37qd3rqy5x6343pkiltoyqw2eyozwakmf5dcisybqynme3or@rqy2ww6hr2oq>
 <c2a0c7ae-ac72-4e26-aa83-cdd0d7f02f90@redhat.com>
 <y6j4rglwcuum4wfq2cjk56zxdnrk7stwoldsshq5d4knubq5ve@jb6vaj5jfwz3>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <y6j4rglwcuum4wfq2cjk56zxdnrk7stwoldsshq5d4knubq5ve@jb6vaj5jfwz3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/29/24 15:45, Jacopo Mondi wrote:
> Hi Hans
> 
> +dave, laurent and sakari
> 
> On Mon, Jan 29, 2024 at 01:24:31PM +0100, Hans de Goede wrote:
>> Hi Jacopo,
>>
>> On 1/29/24 13:05, Jacopo Mondi wrote:
>>> Hi Hans
>>>

<snip (getting too long)>

>> OTOH I do believe that we want a simple default for vblank which gets
>> set on every set_mode call to keep things KISS.
>>
>> How about something like this: (based on your doc patch):
>>
>> """
>> The vblank control default value is reset so that the sensor runs
>> at 30 fps. Except when 30 fps cannot be achieved, in that case
>> the vblank control default value is reset to the control's minimum.
>>
>> After adjusting the range, the vblank control's value must be set to its
>> new default value for consistent behavior after applying a new frame size.
>> """
>>
> 
> Sorry but I'm not super excited about blessing 30fps as the
> preferred or suggested setting in the documentation. For some use
> cases 30fps might be extremely slow or extremely fast, if a sensor or
> a mode cannot achieve this we then suggest the minimum... not sure
> what's best. What's others opinion here ?

I'm fine with loosing the 30 fps language. I was actually
already thinking about dropping specifying 30 fps myself.

In the pending documentation patch you write:

"The value used to initialize the vertical and horizontal blanking controls
should be selected in order to realize, in association with the driver default
format and default pixel rate, a reasonable frame rate output, usually one of
the standard 15, 30 or 60 frame per second."

How about:

"When a new frame size is applied on the subdevice, sensor drivers are required
to update the limits of their blankings controls.

... part about calling __v4l2_ctrl_modify_range()...

The control's default value is adjusted to achieve a reasonable framerate
again and the control's value is set to the new default for consistent
behavior after applying a new frame size."

?

This basically blesses the existing ov5693 driver's behavior :)

> Maybe we're getting too concerned on this, as if an application sets a
> new mode, it's likely setting new blankings and exposure as well..

ATM libcamera sets vblank to whatever default the sensor driver
advertises and not all pipelines change it after that, so IMHO we
need to have a somewhat sane default (and we probably want
libcamera pipelines to do a bit better, esp. with increasing
vblank to allow higher exposure in low light conditions).


> 
>>>> What about enum/get/set frame_interval vs set_mode vs
>>>> vblank ctrl ?  Options:
>>>>
>>>> a) Sensor drivers MUST not implement enum/get/set frame_interval?
>>>
>>> Ideally they shouldn't, for RAW sensors at least.
>>>
>>> For YUV/RGB sensors instead the high-level parameters used by
>>> frame_interval might be ok as some of those sensors might not even
>>> allow you to control blankings explicitly.
>>>
>>> Whenever the hardware allows that, blankings should always be
>>> preferred over frame_interval imho.
>>>
>>>> b) enum/get/set frame_interval only enum/get/set the default
>>>>    frame_interval set by set_mode (e.g. fixed 30 fps).
>>>>    Any vblank changes made after the set_mode are not reflected
>>>>    by get_frame_interval and set_frame_interval only influences
>>>>    the next set_mode call, not the current mode ? Or maybe
>>>>    only allow set_frame_interval when not streaming and then
>>>>    have it set vblank to match the interval like it would
>>>>    have done when called before the last set_mode call ?
>>>> c) enum/get/set frame_interval are a second way to control
>>>>    hts (lets not go there just here for completeness sake)
>>>>
>>>> My own preference here would be to go with a) .
>>>
>>> Mine as well, but as said for YUV/RGB sensors it might not even be
>>> possible to control blankings explicitly. In this case
>>> set_frame_interval can be used but if the driver registers the vblank
>>> control the newly computed blanking value (in response to a
>>> set_frame_interval) should be reflected there ?
>>
>> IMHO if the driver registers the vblank control then it *must not*
>> implement enum/get/set frame_interval . Trying to support both at
>> the same time is just going to cause pain.
> 
> Well, a RO vblank wouldn't hurt :)

Yes and I guess that for sensors where we cannot explicitly
control vblank we would need a RO vblank to satisfy libcamera's
sensor requirements.

Regards,

Hans





