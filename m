Return-Path: <linux-media+bounces-43711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98308BB630B
	for <lists+linux-media@lfdr.de>; Fri, 03 Oct 2025 09:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3604519E83E0
	for <lists+linux-media@lfdr.de>; Fri,  3 Oct 2025 07:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCEE24BBFD;
	Fri,  3 Oct 2025 07:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kcGilSg3"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DC62475C2;
	Fri,  3 Oct 2025 07:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759477245; cv=none; b=TL8iX9v7+AlCHtk3koEYB5BHdUh0CZYdGFqMw8KlWp9DKjMxqpxXKYFpFinqn7OfCKY+VRxiuIABVWVPXaF7as6xsD/WsQB6VTJXqQh2uZPYKvkImi+ImXAT+N++AS1iFE6224ZEOma7j7Ch/ZJML3DFdUztEb9MrQE+AhGuZ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759477245; c=relaxed/simple;
	bh=OlPNZlIp+KgkC76S6neJVFAlwbw4/Ogi6jZu1le8B1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QN+Uy3nOqibsV2/M3/V96+YuqEnXuePqhQhK7RciRZBlX6gV/TOgFEsq45udORU3k1Omk78CsftMk1bplhGhAqoOzaMX2XvS1uoJ5iEhoLAM5B4dFCrn3cv0HACPxE9wn2gCyOvhu8s63UNuUCxCOMHAz2OoUGdVyS3lLFqDFZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kcGilSg3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759477240;
	bh=OlPNZlIp+KgkC76S6neJVFAlwbw4/Ogi6jZu1le8B1Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kcGilSg3fMklsLUAapEjz/5MC/SPFGplOcrjTR06rLQUXmywlgD87PACCIasW4ngs
	 SLChjarc/w0TDRl3rZsqWJC6oqXHCbFrbwsMVxVLGdRN5G41zVAPtX8eLgk5b1I+9z
	 /XLLqE+wS74gf2zewQlqTQD03rsvxfXOFyUrg6wBjWG07LXEgDEPcAoCDtzY6eUegv
	 aH3dT9LVgluKq5neC5hAyExYQANP/6D9PlSX4WstJVipMTBxl06qr9Oa7yL9hJZkxd
	 jaKec4qYHCwqS9bQzfxwplA2s1UzVJYF8BAqMY6xp2LwKUV9JfyNX0W8IHk7FMSCzB
	 j7bjitWjJO65A==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 29B1F17E0E30;
	Fri,  3 Oct 2025 09:40:40 +0200 (CEST)
Message-ID: <1ba4a5b3-abe8-4580-abf5-1e0fe19f9fb5@collabora.com>
Date: Fri, 3 Oct 2025 09:40:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/26] media: v4l2-ioctl: Introduce VIDIOC_BIND_CONTEXT
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Hans Verkuil <hverkuil@kernel.org>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
 <20250717-multicontext-mainline-2025-v1-6-81ac18979c03@ideasonboard.com>
 <b8e03fd2-3a44-48bb-8707-4aecabbbfd9c@collabora.com>
 <wkeizorbd2celujqgs63gzsk5nzsdtoabzg2ocdcsmg3djvl7u@hgh6ridrdwiy>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <wkeizorbd2celujqgs63gzsk5nzsdtoabzg2ocdcsmg3djvl7u@hgh6ridrdwiy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jacopo,

On 10/2/25 10:48, Jacopo Mondi wrote:
> Hi Michael
> 
> On Wed, Oct 01, 2025 at 11:41:38PM +0200, Michael Riesch wrote:
>> Hi Jacopo,
>>
>> On 7/17/25 12:45, Jacopo Mondi wrote:
>>> Introduce a new ioctl in V4L2 to allocate a video device context and
>>> associate it with a media device context.
>>>
>>> The ioctl is valid only if support for MEDIA_CONTROLLER is compiled in
>>> as it calls into the entity ops to let driver allocate a new context and
>>> binds the newly created context with the media context associated
>>> with the file descriptor provided by userspace as the new ioctl
>>> argument.
>>
>> I would have expected that the execution context of the video device
>> already exists and is not allocated at ioctl call time. If I understand
> 
> If userspace doesn't use contexts, why pre-allocate it ?

This is more along the lines "if it keeps things simple, why not". But I
am still diving into this and may have not gotten the complete picture yet.

> See also below on the implications of using a context regardless of
> userspace actions
> 
>> it correctly
>>
>>  - after opening a video device, no context is allocated, but in
>>    v4l2_fh_release the reference counter of the context is decreased.
>>    This smells fishy. Note that the user may not call the ioctl.
> 
> As far as I can see v4l2_fh_release() calls:
> 
> void video_device_context_put(struct video_device_context *ctx)
> {
>        if (!ctx)
>                return;
> 
>        media_entity_context_put(&ctx->base);
> }
> 
> which is safe is !ctx

Ack.

> 
>>  - after opening a video device there is no context. This could imply
>>    that two operating modes are required (with a context and without a
>>    context), which would seem unnecessarily complex.
> 
> You'll find out later on that I have introduced a default context for
> this purpose

Right, I'll check this out.

> 
>>  - What happens if the VIDIOC_BIND_CONTEXT ioctl is called more than
>>    once? (IIUC vfh->context gets overwritten but the old context is not
>>    released)
> 
> Do you mean:
> 
> - Multiple file handles representing the same video device are bound
>   multiple times to the same media device context ?
> 
>   media_device_bind_context() called from v4l_bind_context() returns an error
> 
> - An already bound video device fh is bound to (different) media
>   device contexts ?
> 
>   I should probably
> 
>   if (vfh->context)
>         return -EINVAL;
> 
>   in v4l_bind_context()
> 
>   As an already bound context cannot be re-bound. There currently is
>   not un-binding mechanism, it is required to close a file handle to
>   unbind.

The latter. The check you proposed should do the trick.

>> (Just found that a later patch introduces default contexts. Should this
>> address the comments above, consider rearranging the patches so that
>> default contexts are introduced first.)
> 
> To be honest I don't see much difference. I'll see if it's practical
> to do so or not.
> 
>>
>>> The newly allocated video context is then stored in the v4l2-fh that
>>> represent the open file handle on which the ioctl has been called.
>>
>> Couldn't the same be achieved by
>>  - v4l2_fh_open allocates a new context
>>  - v4l2_fh_release releases it (already implemented)
>>  - ioctl takes the existing context and binds it to the media device
>>    context
>> Then,
>>  - open/release are symmetric and not fishy
> 
> Why do you think video_device_context_put() is fishy ?

Not the video_device_context_put itself, but I expected "open()
allocates something, close() release that something". But apparently
there is a good reason to deviate from that...

> 
>>  - after open but before the ioctl call the user can safely operate on a
>>    context
> 
> If we always operate on a per-file-handle context even before binding
> it, all the operations performed by an application, even it doesn't
> use contexts, will be isolated from the rest of the world.
> 
> This might seem desirable, but changes the semantic of all the v4l2
> operations and an application that doesn't use context that runs on a
> driver ported to use context will suddenly find all its configuration
> to be transient and tied to the lifetime of an open file handle
> instead of being device-persistent.
> 
> Using a default, device-wise, default context allows instead existing
> applications that do not use contexts to operate as they are used to,
> with all the setting/configurations being stored in a persistent
> place.

... and there it is. Did not have that in mind, thanks for pointing it out.

> 
> [...]
>>>
>>> +/*
>>> + *     V I D E O   D E V I C E   C O N T E X T
>>> + */
>>> +
>>> +struct v4l2_context {
>>> +	__u32 context_fd;
>>
>> Reserve some space for the future?
>>
> 
> Might be a good idea. I can't tell how much space we should reserve
> though :)

Prediction is difficult, especially about the future. But having zero
reserve sounds like something we could regret at some point down the
road. __u32 reserved[3]; ?

Best regards,
Michael

> 
>>> +};
>>> +
>>>  /*
>>>   *	M E M O R Y - M A P P I N G   B U F F E R S
>>>   */
>>> @@ -2818,6 +2826,9 @@ struct v4l2_remove_buffers {
>>>  #define VIDIOC_REMOVE_BUFS	_IOWR('V', 104, struct v4l2_remove_buffers)
>>>
>>>
>>> +/* Context handling */
>>> +#define VIDIOC_BIND_CONTEXT	_IOW('V', 105, struct v4l2_context)
>>> +
>>>  /* Reminder: when adding new ioctls please add support for them to
>>>     drivers/media/v4l2-core/v4l2-compat-ioctl32.c as well! */
>>>
>>>
>>
>> Best regards,
>> Michael
>>


