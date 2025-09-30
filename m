Return-Path: <linux-media+bounces-43418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FFDBAC68A
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 12:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1478C189D22C
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 10:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197B12F6171;
	Tue, 30 Sep 2025 10:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uACwP0x5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725572206BB;
	Tue, 30 Sep 2025 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759226855; cv=none; b=TAl7vFEus1sWN9bgbsPtE3SI8oQ0hxX7uhSFl5MW2AjAuL8nDZnFYOjGukFZfx/NbjSMC4E04Vgc9IFmLu2sJOwt7ZQ7agpCmO6tcrmHZnnUw1Usp0wHLIm1evCMCBdy0AM83YBX8CKPSxrFHdvWRXW3eLossQVrGpTSvHray4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759226855; c=relaxed/simple;
	bh=UoibJ4MIQJuIe3i42kuF3eP+iZH/O3PCyzpa0JPvXV8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YJA7pfJV3N5juGQ0iib/Gf60LKtRe3t5vDvjdeXijsbPJmRmHKKvtgUeXnQZxVW4Rxiq7LCMKF3vUlqAMI2YmSCVizejEPbiEH6BVzgygKanwcAXIuix40IUurMP0gE5IkMYWV+lDaDJiSPS9eTy9JQYptQLvybJgKmRGkHeAj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uACwP0x5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72DE8C4CEF0;
	Tue, 30 Sep 2025 10:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759226854;
	bh=UoibJ4MIQJuIe3i42kuF3eP+iZH/O3PCyzpa0JPvXV8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=uACwP0x5RAv33TtGctMgFfX1Iq8Nf0zsIMvOHbJwS5KZXV0nGPgwmzIPwzLrwMFER
	 1NRHkFFVRQxCJ+jDbYzhENLVwZeYGUTSK4eNnr544T9ZZWS5XIwXFYVGV3FlT4xycu
	 klrzeQr4m1NUepBYGImUJtWk+eMv0Emez0Sa2vozT/rnf18EIAt0A8IIdo4OC5L0vJ
	 aOFBUkK0feTxYUBmHwqH1pyBV+No734BwyWVyNm5+uPfIxLAvGinuZbLTnhSMkl1RT
	 3olqw5djKAoFfy3HIqEMD4UWuQIn/y0pHymCHSMco2HzXgZPmmjPbbbOVTZw46sKvo
	 W0HOGPNUfpEiw==
Message-ID: <44ff7acd-b3f9-4d49-91e5-d139a2340375@kernel.org>
Date: Tue, 30 Sep 2025 12:07:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 02/10] media: v4l2-dev: Add support for try state
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-media@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Ma Ke <make24@iscas.ac.cn>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org
References: <20250919-vdev-state-v2-0-b2c42426965c@ideasonboard.com>
 <20250919-vdev-state-v2-2-b2c42426965c@ideasonboard.com>
 <3eef0f98-c34a-4b67-97f4-d60cd1eab8ad@kernel.org>
 <16f45860-923b-4b5d-995e-0729d0479752@kernel.org>
 <175916253442.2234821.5624749898039510125@freya>
 <006000c4-7ecd-474f-ac0c-90c7b0606506@kernel.org>
 <ohhhg34jxsiujtwqgcmfpkbugbhouwxjrdlstdldy3hmmsvtoz@7xlotetzbgfu>
Content-Language: en-US, nl
In-Reply-To: <ohhhg34jxsiujtwqgcmfpkbugbhouwxjrdlstdldy3hmmsvtoz@7xlotetzbgfu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/09/2025 11:35, Jacopo Mondi wrote:
> Hi Hans
> 
> On Tue, Sep 30, 2025 at 09:30:55AM +0200, Hans Verkuil wrote:
>> On 29/09/2025 18:15, Jai Luthra wrote:
>>> Hi Hans,
>>>
>>> Quoting Hans Verkuil (2025-09-22 13:28:26)
>>>> On 22/09/2025 09:52, Hans Verkuil wrote:
>>>>> On 19/09/2025 11:55, Jai Luthra wrote:
>>>>>> Format negotiation performed via the TRY_FMT ioctl should only affect
>>>>>> the temporary context of a specific filehandle, not the active state
>>>>>> stored in the video device structure. To support this distinction, we
>>>>>> need separate storage for try and active states.
>>>>>>
>>>>>> Introduce an enum to distinguish between these two state types and store
>>>>>> the try state in struct v4l2_fh instead of the video device structure.
>>>>>> The try state is allocated during file handle initialization in
>>>>>> v4l2_fh_init() and released in v4l2_fh_exit().
>>>>>
>>>>> There is a major difference between TRY in video devices and TRY in subdev
>>>>> devices: TRY for video devices is not persistent, i.e. it doesn't need to
>>>>> be stored anywhere since nobody will be using that information.
>>>>>
>>>
>>> Yes, the v4l2 format sent with VIDIOC_TRY_FMT is currently not stored by
>>> the drivers, but simply modified and returned back to userspace. From the
>>> userspace point of view, that should still work the same way with this
>>> series.
>>>
>>> The drivers will get access to the correct state (active) for internal use
>>> through framework helpers (that will be introduced in next revision), so
>>> the try state doesn't have any real "use" today.
>>>
>>>>> If the plan is to change that in later patch series, then that should be
>>>>> very clearly stated. And I think I would need to know the details of those
>>>>> future plans before I can OK this.
>>>>>
>>>>> So how is this try state intended to be used in the future?
>>>>
>>>> Follow-up: if there are no plans to change/enhance the VIDIOC_TRY_FMT semantics,
>>>> then I don't really see the point of this since there is no need to store this
>>>> information.
>>>
>>> There are no plans to change the userspace side of this. The main
>>> motivation to allocate and keep a try state in the framework is to simplify
>>> the driver implementation. A single function can serve as both s_fmt and
>>> try_fmt ioctl handler, and operate on the passed state argument without
>>> caring if it will be applied on the device or just for negotiation.
>>>
>>> In future, drivers may subclass the state with their device specific data,
>>> so that nothing tied to the hardware state is stored in the driver
>>> structures directly, but I don't see why drivers will need to inspect TRY
>>> formats.
>>
>> I think having an unused try state is a bad idea and really confusing.
>>
>> Especially because for subdevices the try state is actually used, so
> 
> I might have missed where. TRY formats on subdev sink pads influence
> TRY formats on the source pads, are there other usages I might be
> overlooking ?

That's the main one. But also that the TRY format for a subdev filehandle
is persistent, i.e. you can query it later.

For video devices this is not stored, i.e. there is no G_TRY_FMT equivalent.
TRY_FMT takes the format, it validates it and returns it, but it is not
stored anywhere.

>> for normal devices you would automatically expect the same thing when
>> you see a try state.
>>
>> You should reconsider this approach.
> 
> The 'try' state will be stored in the v4l2_fh and won't be accessible
> to userspace.
> 
> Drivers instead, might accumulate the result of multiple TRY_FMT calls
> into the state stored in the v4l2_fh incrementally. Is this a concern
> for you ?

Basically the try state would be a scratch state, it's not used for anything
else. I think it is very confusing keeping it.

> 
> I still think having a single implementation for s_fmt and try_fmt is
> a win for drivers, even if the try state are now effectively stored
> somewhere.

In a properly written driver s_fmt will call try_fmt first to validate the given
format, then use that format to actually program the hardware.

Unfortunately, a lot of drivers have duplicate format validation code for
both try_fmt and s_fmt (hopefully, but not always, doing the same validation).

I think this is partially historic. When the vidioc_g/s/try_vid_cap etc. ops
were introduced, drivers had to be converted as well. And if memory serves often
drivers handled TRY and S_FMT in a single function, and that now had to be split
up, so I suspect that in quite a few cases the code was simply duplicated.

It's a long time ago though, so I may be wrong about that.

Also, older drivers do not always support TRY_FMT. Although I'm not sure how
many of such drivers remain.

Regards,

	Hans

> 
> Thanks
>   j
> 
>>
>> Regards,
>>
>> 	Hans


