Return-Path: <linux-media+bounces-22000-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D1B9D88DE
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 16:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96E3CB2CC3B
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 14:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A841AF0B9;
	Mon, 25 Nov 2024 14:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iWZA6H7/"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F521917FB
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 14:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732543363; cv=none; b=lKxPyEc5G5zFL+UTc8/6wEP/tnm3gGqLyeACiQzkpSCP/ZbCaHlYw4+HBVuw1Ojc54kHmMZRyOZMxMdHNS8bMFJf3m80FyTusmH2G1EEY5JEU1eFc5f5+PsczzdpmxbFAAIvGkOkv/wiuoohbgkPHUlfugFvP3RlmIZjB6YYVlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732543363; c=relaxed/simple;
	bh=2kqe0jV8UOVDVyyY1uhJQWcfx1ukgxallOU96cbp8iA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VtUSjwz69xO+BOzNebVP/WsajUvzAWvFZfWwIhnNLbqDYoLaiBSje+n/AYoZHvBGypMJZNWWUkOoElLSRoApvKTlwbEPdYK1ZwD8jz+BlDnUS1MaC+Y4fl/1CYIzQYbbokVHTsfXME0vU9Dh3jFCkbN7SK9mDAuZ2DbY0GgqAuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iWZA6H7/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732543360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jKIFmCIAm34aRVwzvltyN/iUoRYjxx0VJdpzyCrfLFg=;
	b=iWZA6H7/ZgdoUxABEULtOqBDLJRWiV/kz7TNpyBx0ZbfEszsUaNsH/7ChBJ/6aYFQWMa4d
	CZp5w1ej4Vkr8oBmSP/9iXHo9xSvSdp4jfDwvuwzG9bdRESpF6TQttrgnasp7/1Quz0p0v
	F/oDS48wqwU5dEcfV2+BBgtMp68lIPA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-hZR9ZIuvPFWW8jona6zetg-1; Mon, 25 Nov 2024 09:02:39 -0500
X-MC-Unique: hZR9ZIuvPFWW8jona6zetg-1
X-Mimecast-MFC-AGG-ID: hZR9ZIuvPFWW8jona6zetg
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa53914509eso99405066b.0
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 06:02:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732543358; x=1733148158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jKIFmCIAm34aRVwzvltyN/iUoRYjxx0VJdpzyCrfLFg=;
        b=oSTqVfI3Afuxti7e/TlsXt0D6Ze8uD1fVfXgOMH125bSzyLj1qQFuqIRqy1YmQ1Zhc
         mNzun0rr7B3mnAyuHc90dZbiQrx04YhWia4LbUqMbydJ30AsKqvHqCDs18eumy4zEHfY
         3FEr/LhifkwYhd4T7B8F2EAxia9oVEaKqpSUv4DehCuEBUIZCUXA3ucqKA6WCajXSc4p
         SPazhhAM1IVlYfdyw5Ef83bX3FmU2HIEAkfrcirVSn+DwFjnZzUxq0S0j1btXwHv5elY
         al/UYtmLBgpRZOE9eiD7bGJY/Dj97Oq0gMR9gmuT/Ax7esbAHnlfhc3pIhWhT5o99iOU
         M0lA==
X-Forwarded-Encrypted: i=1; AJvYcCXmMXT4Zt5T2MglYa4O5j3R3FIr+zUqbBMQmXcTbsIDr7819M1Fw92B7SkDwIjGlxHK0m/96l8SIgRFjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrCnZLSBWFPU+kuZmh2MNVT7g/RCSFZfrCdaoUUoFNU/tn4R3m
	yeYQ5VA7+oR9RUjXHgjSNVOygYtQWqffpOKVTNA+MCGBD6Uph66DQcsrBdXx2IoVqLtYPqKOPgW
	7kBTqaMTSf6JB1xHpIj0ck3ZLKE9O686O8Fjf/D97l2cdUfCUmIJYOiDby+HO
X-Gm-Gg: ASbGncuIARMXpvgHhf7ZdkfXZz5q8Gv3azmKldHG5JXdVEZcZw+lHQBbdX7IQVlowjj
	20uKhL42n52ujjzvgKJ7y/sDGIy0TNfURhFjUcl2H3AXygWdJvqzWGG8kTG28tuWQKQL7avDMts
	ohEVRqY4mfpbOQZqAwXtv55adqbMEQmIbp/qs0gPlYL6mxviF4yuOk7gK12kM5FFUbEkCtgJ++5
	pKPOQdc3w9XKpqqPipL0pVOEWnSnKAGEWsc24onquIZazbH8X9rGi8cURn6i0hDVHZiqkex5qs2
	tWM4jAHOls1ob1UYMdBzXEWsGVos2SN5y2yKiDkucLC/VNmB2ludu7chez65xp/PmjFzuyY0GTS
	/qrWWLmNVcLBOKrLEOONac2W7
X-Received: by 2002:a17:906:9d2:b0:a9a:13f8:60b9 with SMTP id a640c23a62f3a-aa509985a54mr1120672466b.36.1732543356414;
        Mon, 25 Nov 2024 06:02:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9+wHVbUjV3LBaM/yXLc/GetZOs7jYVDpUQdNWTC9wR95rKXX7sHH99H7KjHhcvth85h0Rfw==
X-Received: by 2002:a17:906:9d2:b0:a9a:13f8:60b9 with SMTP id a640c23a62f3a-aa509985a54mr1120648966b.36.1732543354313;
        Mon, 25 Nov 2024 06:02:34 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b2effbdsm466839066b.51.2024.11.25.06.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 06:02:33 -0800 (PST)
Message-ID: <9779fcb0-e28d-4651-b04c-ca492e30c452@redhat.com>
Date: Mon, 25 Nov 2024 15:02:33 +0100
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
 <55c76c99-dc86-41b2-84c6-d2e844530f67@redhat.com>
 <CANiDSCtvLB=tWb7ZCFCw9gn26R2xHnOf=yTLj+M_4AuQKYvgOQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCtvLB=tWb7ZCFCw9gn26R2xHnOf=yTLj+M_4AuQKYvgOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 25-Nov-24 2:39 PM, Ricardo Ribalda wrote:
> On Mon, 25 Nov 2024 at 13:25, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Ricardo,
>>
>> On 9-Nov-24 5:29 PM, Ricardo Ribalda wrote:
>>
>> <snip>
>>
>>>> I have been discussing UVC power-management with Laurent, also
>>>> related to power-consumption issues caused by libcamera's pipeline
>>>> handler holding open the /dev/video# node as long as the camera
>>>> manager object exists.
>>
>> <snip>
>>
>>>> Here is what I have in mind for this:
>>>>
>>>> 1. Assume that the results of trying a specific fmt do not change over time.
>>>>
>>>> 2. Only allow userspace to request fmts which match one of the enum-fmts ->
>>>>    enum-frame-sizes -> enum-frame-rates tripplet results
>>>>    (constrain what userspace requests to these)
>>>>
>>>> 3. Run the equivalent of tryfmt on all possible combinations (so the usaul
>>>>    3 levels nested loop for this) on probe() and cache the results
>>>>
>>>> 4. Make try_fmt / set_fmt not poweron the device but instead constrain
>>>>    the requested fmt to one from our cached fmts
>>>>
>>>> 5. On stream-on do the actual power-on + set-fmt + verify that we get
>>>>    what we expect based on the cache, and otherwise return -EIO.
>>>
>>> Can we start powering up the device during try/set fmt and then
>>> implement the format caching as an improvement?
>>
>> Yes, actually looking at how complex this is when e.g. also taking
>> controls into account I think that taking small steps is a good idea.
>>
>> I have lately mostly been working on sensor drivers where delaying
>> applying format settings + all controls to stream-on is normal.
>>
>> So that is the mental model I'm applying to uvc here, but that might
>> not be entirely applicable.
>>
>>> Laurent mentioned that some cameras missbehave if a lot of controls
>>> are set during probing. I hope that this approach does not trigger
>>> those, and if it does it would be easier to revert if we do the work
>>> in two steps.
>>
>> Ack, taking small steps sounds like a good plan.
>>
>> <snip>
>>
>>>> This should also make camera enumeration faster for apps, since
>>>> most apps / frameworks do the whole 3 levels nested loop for this
>>>> on startup, for which atm we go out to the hw, which now instead
>>>> will come from the fmts cache and thus will be much much faster,
>>>> so this should lead to a noticeable speedup for apps accessing UVC
>>>> cameras which would be another nice win.
>>>>
>>>> Downside is that the initial probe will take longer see we do
>>>> all the tryfmt-s there now. But I think that taking a bit longer
>>>> to probe while the machine is booting should not be an issue.
>>>
>>> How do you pretend to handle the controls? Do you plan to power-up the
>>> device during s_ctrl() or set them only during streamon()?
>>> If we power-up the device during s_ctrl we need to take care of the
>>> asynchronous controls (typically pan/tilt/zoom), The device must be
>>> powered until the control finishes, and the device might never reply
>>> control_done if the firmware is not properly implemented.
>>> If we set the controls only during streamon, we will break some
>>> usecases. There are some video conferencing equipment that do homing
>>> during streamoff. That will be a serious API breakage.
>>
>> How to handle controls is a good idea.
>>
>> Based on my sensor experience my initial idea was to just cache them
>> all. Basically make set_ctrl succeed but do not actually do anyhing
>> when the camera is not already powered on and then on stream-on call
>> __v4l2_ctrl_handler_setup() to get all current values applied.
>>
>> But as you indicate that will likely not work well with async controls,
>> although we already have this issue when using v4l2-ctl from the cmdline
>> on such a control and that seems to work fine.
> 
> -----
>> Just because we allow
>> the USB connection to sleep, does not mean that the camera cannot finish
>> doing applying the async control.
>>
> Not sure what you mean with this sentence. Could you explain it
> differently? Sorry
> 
>> But I can see how some cameras might not like this and having 2 different
>> paths for different controls also is undesirable.
>>
>> Combine that with what Laurent said about devices not liking it when
>> you set too much controls in a short time and I do think we need to
>> immediately apply ctrls.
>>
>> I see 2 ways of doing that:
>>
>> 1. Use pm_runtime_set_autosuspend_delay() with a delay of say 1 second
>> and then on set_ctrl do a pm_runtime_get_sync() +
>> pm_runtime_put_autosuspend() giving the camera 1 second to finish
>> applying the async ctrl (which might not be enough for e.g homing) +
>> also avoid doing suspend + resume all the time if multiple ctrls are send
> 
> What about 1.5:
> 
> during s_ctrl():
> usb_autopm_get_interface()
> if the control is UVC_CTRL_FLAG_ASYNCHRONOUS.
>        usb_autopm_get_interface()
> set the actual control in the hardware
> usb_autopm_put_interface()
> 
> during uvc_ctrl_status_event():
>    usb_autopm_put_interface()

How do we match this to the usb_autopm_get_interface()
call ? At a minimum we would need some counter to
track pending (not acked through status interrupt urb)
async control requests and only do the put() if that
counter >= 1 (and then decrease the counter).

We don't want to do unbalanced puts here in case of
buggy cameras sending unexpected / too many
ctrl status events.

> during close():
>    send all the missing usb_autopm_put_interface()

Except for my one remark this is an interesting
proposal.

Maybe also do a dev_warn() if there are missing
usb_autopm_put_interface() calls pending on close() ?

> This way:
> - we do not have an artificial delay that might not work for all the use cases
> - cameras with noncompliant async controls will have the same PM
> behaviour as now  (will be powered on until close() )
> 
> We do the same with the rest of the actions that require hardware access, like:
> https://lore.kernel.org/linux-media/20220920-resend-powersave-v5-2-692e6df6c1e2@chromium.org/
> 
> This way:
> - Apps that do not need to access the hardware, do not wake it up, and
> we do not break usecases.
> 
> Next steps will be:
>  - cache the formats
>  - move the actual set_ctrl to streamon... but if we can do that I
> would argue than we can move completely to the control framework.

Right I had forgotten that the UVC driver does not use the control
framework. I think moving to that would be a prerequisite for moving
the set_ctrl to stream_on.

Regards,

Hans


