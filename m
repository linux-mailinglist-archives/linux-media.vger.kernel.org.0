Return-Path: <linux-media+bounces-21984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A5A9D8569
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 13:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CA461633E7
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 12:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C0A19CC0A;
	Mon, 25 Nov 2024 12:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aTUH+mZL"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B75917E472
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 12:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732537549; cv=none; b=ui2AoDzLLLcxY7LWgc8B21zZPPtd+K6r3HBs1V1yRL8C3OaWc3dgrPYfyRkht8mlc9RIZ+CUm6J/yiH/rnQQaqKaWxe2M01YO448kEw7vZrUoUklON+edVbneeViCZSIDdRbUMXwghpDxkVtrOCAfzk3G5qmstttJ7FO9nYQiGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732537549; c=relaxed/simple;
	bh=awkhOdmcrAaka+uC4QAHvteJBoj1suS1N0zdwROecWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RWs6gmQnaoUG+mMJDmLKrmMPD9C2JlYU9eyc3h0FO9bEjcdrvsNzjAd0jkuGi/NfykFGYtDscFIVDv1tpBIU2Ne4qzrbYeKv9WnDYEBxsq6+Zyng0WwHQwpiNewZannPIOz4S23wfSFz/HUGf9saI+9+M5oGw/RzmiNU+kDz4mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aTUH+mZL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732537546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UipEsdUDZv2puatnG+MmRRhEmVsTQ1X+NpBU/k99t7s=;
	b=aTUH+mZLwuABpSxUwGGj+Ln8KlUTQPX2G3kUZtW2RjJrq4KLBYqipV0LGfKd5t7YSaJ0Gd
	toJtDp/UCDtHjp2QyYm+xt/9MU/Kjy9GcU0FjZhJsxI9Tevz4jTYfYpeh5/1z01/Ua6HGS
	y+CfsmkUKXByD7QUS5+4BX2xzo5pRMU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-uB3KFl53O5SBIgjRwHniWg-1; Mon, 25 Nov 2024 07:25:44 -0500
X-MC-Unique: uB3KFl53O5SBIgjRwHniWg-1
X-Mimecast-MFC-AGG-ID: uB3KFl53O5SBIgjRwHniWg
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa53116660fso169269166b.1
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 04:25:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732537543; x=1733142343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UipEsdUDZv2puatnG+MmRRhEmVsTQ1X+NpBU/k99t7s=;
        b=bI214N4m3gVPd4Mz0SPIiPivHmBaDyzPnfJIEHx6hLCKR0OiYYX35+zrVEJGo4TdFy
         04znW98FuulmVATRgwVijyIQXRX/OIxulGkV8/ihILOlJ44DgXwII4DQVXLKrgyaycyO
         /6CaYrIKiJiVNXsJnNc3SrtP52ALbvaCyUAw/j/7CobRLMel+XeTSTwT1lexupsDGBxW
         wL67r3SURZe+buKspkbkHPKd6yt0TApbFBsN+kBLy2n4ErUrooFuCs/42Rp+F9jT1c/v
         485MIo4xgHCcDcHnzgWnw4oxDC6/XLK+aUgmaphhziynOpx9s2wq6kUuUtKo1zcgzhQD
         UEfA==
X-Forwarded-Encrypted: i=1; AJvYcCWJYdTb9ko49JjjUf6+E8peDBZenhSy2Ls9iv3et3I7ChPfs0RGsnIEO4X6S9Mk4JwoZSMMW5JvqNL/zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLH+TRqT7VvY+ia7sJoNEKiaoT+Uffe4IgBqwCXyaQ1OvtnwiT
	EGW79NWqrX+Q4KtgEpJwAoCtzxjasrWBkVHK2Qv+8NhEgUh/7CSnL+2B+ZS1GISI6nkSB/brk6A
	QsgsbEZUL6cYjWYl1G3gK875nkLZazsFR4nvI+hQV6zyfillhCbwRw0qTfdte
X-Gm-Gg: ASbGnctXwL8aI41Ub9yJ5GfTtEQabwwZL5J3XvYakK2nrSWLNwCfoOTV2cQy8Nzi3zB
	Q36IShNYCqoKfqyo7m3QhpDC6tUjgC0NjWTcn7/IUQgs2FEUPUZbw8JqXP7CDBTXLKmPlNCpZ5a
	ZiSwZ4DUQbBAbiRQVDYaBpi4Hfp1PHmtseMm6e4FsGbqX6S10/ldqsNRSwtxv44/ICM62ajZaQk
	jebBjzapxHKjR/XDzDqFRjSu1k7jG+zrFMU1ZEGcXeNBd9M880B8ptZj5ZZuyNMDgZSsiLFihzc
	O/WfhEmgvcoXoIFvBWs3ZxotG2j70y/Qo9/s4mtPz9h/x9Us6S8lVyPSP3QD5jdo2D5ZQymi45Q
	cUXbMN4l2dsZcdsAKj5eP/HpY
X-Received: by 2002:a17:906:1da9:b0:aa5:3950:10ea with SMTP id a640c23a62f3a-aa5395015ddmr633029866b.36.1732537543115;
        Mon, 25 Nov 2024 04:25:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAwoRMpod2zBQ9KdOEIZ6eq4riZ6XcMBUAYu7xUxYliAtWQ92HCvt1sG335Bkq7zAEOxoj0g==
X-Received: by 2002:a17:906:1da9:b0:aa5:3950:10ea with SMTP id a640c23a62f3a-aa5395015ddmr633027966b.36.1732537542778;
        Mon, 25 Nov 2024 04:25:42 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b2f5fdesm455741666b.72.2024.11.25.04.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 04:25:42 -0800 (PST)
Message-ID: <55c76c99-dc86-41b2-84c6-d2e844530f67@redhat.com>
Date: Mon, 25 Nov 2024 13:25:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a
 subdevice
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Yunke Cao <yunkec@chromium.org>,
 Hans Verkuil <hverkuil@xs4all.nl>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
 <5b5f3bb7-7933-4861-be81-30345e333395@redhat.com>
 <CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 9-Nov-24 5:29 PM, Ricardo Ribalda wrote:

<snip>

>> I have been discussing UVC power-management with Laurent, also
>> related to power-consumption issues caused by libcamera's pipeline
>> handler holding open the /dev/video# node as long as the camera
>> manager object exists.

<snip>

>> Here is what I have in mind for this:
>>
>> 1. Assume that the results of trying a specific fmt do not change over time.
>>
>> 2. Only allow userspace to request fmts which match one of the enum-fmts ->
>>    enum-frame-sizes -> enum-frame-rates tripplet results
>>    (constrain what userspace requests to these)
>>
>> 3. Run the equivalent of tryfmt on all possible combinations (so the usaul
>>    3 levels nested loop for this) on probe() and cache the results
>>
>> 4. Make try_fmt / set_fmt not poweron the device but instead constrain
>>    the requested fmt to one from our cached fmts
>>
>> 5. On stream-on do the actual power-on + set-fmt + verify that we get
>>    what we expect based on the cache, and otherwise return -EIO.
> 
> Can we start powering up the device during try/set fmt and then
> implement the format caching as an improvement?

Yes, actually looking at how complex this is when e.g. also taking
controls into account I think that taking small steps is a good idea.

I have lately mostly been working on sensor drivers where delaying
applying format settings + all controls to stream-on is normal.

So that is the mental model I'm applying to uvc here, but that might
not be entirely applicable.

> Laurent mentioned that some cameras missbehave if a lot of controls
> are set during probing. I hope that this approach does not trigger
> those, and if it does it would be easier to revert if we do the work
> in two steps.

Ack, taking small steps sounds like a good plan.

<snip>

>> This should also make camera enumeration faster for apps, since
>> most apps / frameworks do the whole 3 levels nested loop for this
>> on startup, for which atm we go out to the hw, which now instead
>> will come from the fmts cache and thus will be much much faster,
>> so this should lead to a noticeable speedup for apps accessing UVC
>> cameras which would be another nice win.
>>
>> Downside is that the initial probe will take longer see we do
>> all the tryfmt-s there now. But I think that taking a bit longer
>> to probe while the machine is booting should not be an issue.
> 
> How do you pretend to handle the controls? Do you plan to power-up the
> device during s_ctrl() or set them only during streamon()?
> If we power-up the device during s_ctrl we need to take care of the
> asynchronous controls (typically pan/tilt/zoom), The device must be
> powered until the control finishes, and the device might never reply
> control_done if the firmware is not properly implemented.
> If we set the controls only during streamon, we will break some
> usecases. There are some video conferencing equipment that do homing
> during streamoff. That will be a serious API breakage.

How to handle controls is a good idea.

Based on my sensor experience my initial idea was to just cache them
all. Basically make set_ctrl succeed but do not actually do anyhing
when the camera is not already powered on and then on stream-on call
__v4l2_ctrl_handler_setup() to get all current values applied.

But as you indicate that will likely not work well with async controls,
although we already have this issue when using v4l2-ctl from the cmdline
on such a control and that seems to work fine. Just because we allow
the USB connection to sleep, does not mean that the camera cannot finish
doing applying the async control.

But I can see how some cameras might not like this and having 2 different
paths for different controls also is undesirable.

Combine that with what Laurent said about devices not liking it when
you set too much controls in a short time and I do think we need to
immediately apply ctrls.

I see 2 ways of doing that:

1. Use pm_runtime_set_autosuspend_delay() with a delay of say 1 second
and then on set_ctrl do a pm_runtime_get_sync() +
pm_runtime_put_autosuspend() giving the camera 1 second to finish
applying the async ctrl (which might not be enough for e.g homing) +
also avoid doing suspend + resume all the time if multiple ctrls are send

2. Instead of immediately powering on the camera on /dev/video# open
track per fh if the camera has been powered on and then on the first
set-ctrl, or the first other IOCTL like try/set-fmt which requires
the camera to be powered on power it up and then keep it on until
the fh is closed, since apps hitting these paths are likely to do
more stuff which requires the camera to be powered on.

This should avoid apps (like udev rules) just doing a simple get-cap
query of powering on the camera, while at the same time preserving
the current behavior for apps which want to actually do something
with the camera, so the chance of regressions should be small.

I guess the time between power-up and sending the first request to
the camera will change slightly. But most apps which actually want
to do stuff with the camera will likely already do so immediately
after opening /dev/video# so the timing change should be negligible.

I guess 2. is pretty similar to your proposal to delay power-on
to the first set/try-fmt, which I assume also already does
something similar wrt controls ?

I think that 2. can work nicely and that would be nice to have,
even though it does not fix the privacy-control + power-mgmt issue.

Regards,

Hans




