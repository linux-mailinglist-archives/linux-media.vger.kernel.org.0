Return-Path: <linux-media+bounces-4331-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1FB8402CA
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 11:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D991228504C
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 10:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C193C472;
	Mon, 29 Jan 2024 10:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NlW/poe/"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676461E482
	for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706524244; cv=none; b=I8UurV/BTwAYydBU+G3yxld5jvreJ/IEKqdfQ4PpOe9YSfLjnozw7bdOqawRI8JZrCcCc6JMBlVYZKDjJkPDkJjC/854lKwny6NQtV08DHAixbEe2mJzJxKsPb1Th7cxY+GmwKJ0Bw1H9MpzNeklUz/NCqcvw2dUpu2Y2BVYZf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706524244; c=relaxed/simple;
	bh=iq4yyKwx4rGnuWkTVMDDHcgcYj95zmGY2KmEscc+Lt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SnF8AYR4iQe4nilBlfr2DNkB+0yH+4KOEOmxf+3YqoXoODcw/Uhga15jnV5XjtRD423fEAQvlIyw1vWk12YTgGPnkT+DYneO7Us2chbTRK2Bof5UNmqlhM4d3v0sF3l62w5HzzKcULfMBtzRKH9lDL/OORqexwDXAPAq9gDV2Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NlW/poe/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706524241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IO5jZ2C5EcX0BCLqp1Xro5IvKyo3wH5fS4GNkH4u7iw=;
	b=NlW/poe/p1TSjrqKz5Ykxw/6mPj252l7sXm54IBYtsjNeR1E3ZDbMGaAwuYJ435KE/4zyh
	sYomhqfHhUPRmivJE9ZCgDbA9oXX7ag4wq79YFAs3NLRjWUCO6G0wtKYor2cv/Dlpi2k1N
	czQKNjbkjQZQhn1UcJdK3wySIxWOfgs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-iDhMUjMwMhyrPx4U4NpZBw-1; Mon, 29 Jan 2024 05:30:37 -0500
X-MC-Unique: iDhMUjMwMhyrPx4U4NpZBw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a35a649c608so50154466b.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 02:30:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706524236; x=1707129036;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IO5jZ2C5EcX0BCLqp1Xro5IvKyo3wH5fS4GNkH4u7iw=;
        b=e5+ERdKEgQSqKg0u85QXdL+s/SCqZEN69UIHIpZPfsHbVKNIuNoexrcFPck4hAkkU2
         VzcDUwOuBlhmJmz5FcudZr296Fohgf1/BEBEb4VHfAWm2sAepk9CdGuUGGS+YRGidVkI
         4RyzK0HG3oGNTC9PvaK5rVh+yB9zZGFOVXtmytZ1ccqoQPmWkr29Pu2y97haO1jTUCx2
         EGEgH01PVViguu5mi/e+9Cjib7utn2mr5YTUapO9zGhOxcSTqGAKhCujcAg/p0qJEcrR
         cGngrBwe1wsJ/7VY9p9nJ8/NGhh6OfzK87Ma3HE47LhSR4XRAWG86eLKqO2h6Sa1V++v
         8kKg==
X-Gm-Message-State: AOJu0YwMcpk1S9YNOrK2VUQaQnEyvqNSVHkF31RoQ0HyM9GOCV7pMJBV
	vmeashgHZWg9eqOkiCQz7A5MQNrJa0cRPu/cETkfWfAngIE03Py2gErkxzRxvU9SPoa9d2G0ZSV
	qg4rhpt/DyMtCBfdwUuGIf1b2OKfU49wM3I9p5rIw/U2CQhUecXUE+Jiu9vXT
X-Received: by 2002:a17:907:1043:b0:a27:6570:adbc with SMTP id oy3-20020a170907104300b00a276570adbcmr3659703ejb.33.1706524236207;
        Mon, 29 Jan 2024 02:30:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUwehXAXEEFnHBHszKr13o1rNpISHmgxQa5T7Q50HOia1sxb3BEY7f6mz5CNkrEyludVgUuw==
X-Received: by 2002:a17:907:1043:b0:a27:6570:adbc with SMTP id oy3-20020a170907104300b00a276570adbcmr3659691ejb.33.1706524235836;
        Mon, 29 Jan 2024 02:30:35 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id hu19-20020a170907a09300b00a31c5caa750sm2938973ejc.177.2024.01.29.02.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 02:30:33 -0800 (PST)
Message-ID: <1ccf4d19-4db4-48fb-a6bf-17e29cbc5f3e@redhat.com>
Date: Mon, 29 Jan 2024 11:30:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Weird default vblank value in ov5693
Content-Language: en-US, nl
To: Dan Scally <dan.scally@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <0fa07550-80cb-40f2-87c8-23864af33642@redhat.com>
 <18f20014-44b8-4f83-915d-81f265369821@ideasonboard.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <18f20014-44b8-4f83-915d-81f265369821@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dan,

On 1/29/24 10:53, Dan Scally wrote:
> Morning Hans
> 
> 
> On 28/01/2024 20:58, Hans de Goede wrote:
>> Hi All,
>>
>> While adding vblank ctrl support to the ov2680 driver I was looking
>> at the vblank ctrl code in the ov5693 and I noticed something
>> which I believe is weird / undesirable.
>>
>> When setting a new mode the ov5693 driver does not keep the current
>> vts value (adjusting vblank to keep vts and thus the framerare and
>> exposure unchanged).
>>
>> Instead it calculates a new vts value, resetting the framerate
>> to 30 fps; or 60 fps for smaller resolutions and then sets
>> vblank to the new (vts - new_mode->height) and adjusts
>> the exposure control-range to fit within the new vts, potentially
>> also changing the exposure value.
>>
>> This behavior of the ov5693 code means that switching resolution
>> also changes the framerate and the exposure value which seems
>> undesirable.
> 
> 
> I think I did it that way because I was hitting problems when changing the framesize exceeded the current VTS and it seemed cleaner to just reset it to a known situation. Really though the only thing it would affect would be the framerate; that would have to reduce if the VTS increased but exposure could stay the same (though the maximum would change). So probably it ought to work like:
> 
> 
> * if we change from a larger to a smaller framesize then we can just increase blanking to keep the same VTS and that should be fine
> 
> * if we're going from a smaller to a larger framesize that fits within the currently configured VTS with minimum blanking, we can just reduce the blanking to keep the same VTS and that should be fine
> 
> * if we're going from a smaller to a larger framesize that exceeds the currently configured VTS we drop blanking to a minimum so that the new framerate is as close to the old one as it can be
> 
> 
> Does that sound like more reasonable behaviour? If so, shall I patch it?

This sounds more or like what I had in mind (keep VTS unchanged if possible),
so I have been looking more into this yesterday evening and
implementing this is a bit tricky (*).

Combining this with your last point of "that the new framerate is as
close to the old one as it can be" I think I prefer a more KISS
approach.

IMHO the best thing (principle of least surprise) would be to
on a set_fmt pad-op reset things to a default fps of say 30,
as Jacopo's doc patches suggest. My reasons for suggesting
this approach is:

a) This is easier to implement and thus less likely to have bugs
b) It leads to consistent behavior where as your suggested try to
keep current vts approach leads to sometimes vts being kept, but
other times when going from smaller to higher resolutions vts
changing which will lead to hard to debug problems if userspace
relies on vts being kept.

For the ov5693 driver this would mean dropping __ov5693_calc_vts()
replacing it with a DEFAULT_VTS define of:

ALIGN_DOWN(OV5693_PIXEL_RATE / OV5693_FIXED_PPL / 30, 2)

(does vts need to be a multiple of 2? We don't enforce that
 in the vblank control)

Regards,

Hans


p.s.

What about enum/get/set frame_interval vs set_mode vs
vblank ctrl ?  Options:

a) Sensor drivers MUST not implement enum/get/set frame_interval?
b) enum/get/set frame_interval only enum/get/set the default
   frame_interval set by set_mode (e.g. fixed 30 fps).
   Any vblank changes made after the set_mode are not reflected
   by get_frame_interval and set_frame_interval only influences
   the next set_mode call, not the current mode ? Or maybe
   only allow set_frame_interval when not streaming and then
   have it set vblank to match the interval like it would
   have done when called before the last set_mode call ?
c) enum/get/set frame_interval are a second way to control
   hts (lets not go there just here for completeness sake)

My own preference here would be to go with a) .




*) As Jacopo's doc patches mention the vblank range needs to be
updated when changing the mode. Which means calling
__v4l2_ctrl_modify_range() now this will clamp vblank to the new
range, potentially changing it leading to a __v4l2_ctrl_s_ctrl()
call under the hood.

We need to do this __v4l2_ctrl_modify_range() before actually
calling __v4l2_ctrl_s_ctrl() to set the new vblank value
(the new value calculated to keep vts the same). Otherwise
the new value may be out of range and we must not directly
poke the v4l2-ctrl internals to set a new in range value before
calling __v4l2_ctrl_modify_range(). So this lead to multiple
control-change events being emitted to userspace. But this
is unavoidable even with more KISS approaches.

Also when vts changes we also need to ensure that the exposure
range is corrected. Theoretically it is possible for vblank
to stay unchanged (e.g. changed from minimum vblank to minimum
vblank) so we cannot rely on s_ctrl to update the exposure range.

Note updating the exposure range twice is not a big deal since
__v4l2_ctrl_modify_range() checks if things actually change
and otherwise it is a no-op.






> 
> 
> Thanks
> 
> Dan
> 
>>
>> The vblank and hblank control values changes on setting a mode
>> is unavoidable but the framerate and exposure value changing
>> at the same time seems undesirable.
>>
>> Note that this also halves the max supported exposure value
>> when going to a lower-res mode even when userspace never
>> touches the vblank control.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>
> 


