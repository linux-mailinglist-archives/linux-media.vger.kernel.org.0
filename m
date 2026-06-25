Return-Path: <linux-media+bounces-65653-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nA1iO249PWrYzwgAu9opvQ
	(envelope-from <linux-media+bounces-65653-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 16:38:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4BA6C6BAD
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 16:38:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=NdS42NJ1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65653-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65653-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F139309EFBC
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 14:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C12A3E5A22;
	Thu, 25 Jun 2026 14:36:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEC732BF44;
	Thu, 25 Jun 2026 14:36:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782398209; cv=pass; b=lMxXqTzzqwBL6B/beYQNQr2VvfBz+Co249tH2Lrb7s4W2vWNdgP6cOayaHSCtrqLBMrHsIX5pUoKM18yUVkbLSU1bQJS28IA63SwLwoGUUcBcaT5PYLlcZOJACLfNmkfYT9CX/lP++bGgS2BSbhF6pu8rDsIe71io0pvixvMa7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782398209; c=relaxed/simple;
	bh=koR5aALPzDxE7HFsQsDV8lFiQ2JTq02OyAdoQEtD72I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T2PAk3ACX4j/0qnYoeKappLW34QAAZF2/46V3Z4T7iIFZCXhj1138uD2jqsWhMSSOnRHciBncjFZhq4jVq5BmlbpUAwyhpKZUMXP9YhRkaOHucxwXOmT2w9C7SsvYFhJKdwXTsZNdp7zHrq+x9Wf00mXq900fv394fHs/QGl6aQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=NdS42NJ1; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal: i=1; a=rsa-sha256; t=1782398185; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XoV+pvJHoQ/l/jsP00g757VrdbWy2Y3E0nmYsC3F5WQh9StIFtgeogldmfEisxxfHecDvtNCC+2CxxvswhdG9+8evAjaBL6fmpy/RzbrtpHgBsAzm9vPkUvLSVQxIZk/tobYHH60DhnMiLuSSmApqU6cevURXm1c7u5bRDZkcMo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1782398185; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mJO1zc6CsyO0zKIIPRSRfzrWercYcCJIayebrFLBka0=; 
	b=frcuypxjn326LGf0w84uLimgP5ghMtIveCqebhS1NdKbqiThhvH8YPBIPRG1MmG93VdMsKpSXZv9avemeq8oJNMs1SZQB7Yr83WNfYSgDTyurxNKOp5GyRdKAGBYhzQJKHpiuATh5etVfRhXYmQePGofT/wpSoyIa2TiyA2fbCo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782398185;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=mJO1zc6CsyO0zKIIPRSRfzrWercYcCJIayebrFLBka0=;
	b=NdS42NJ1DAmtf/Rf41yyFutIAP+C7VwP40DqYi+PbzDi3baoMFiqF3NdAPtZf3Ap
	Y0PP5ZtfBQKFTyE9RJhXGSINraPTxcJd2a0/rAZ/c3tA9phcjnzLZxT6IcuRj5k0rTS
	//6z0o29RrZ+Dw5PU15hrbKBG7DoCzJBuu/8xPDI=
Received: by mx.zohomail.com with SMTPS id 1782398184087670.7754768546965;
	Thu, 25 Jun 2026 07:36:24 -0700 (PDT)
Message-ID: <77829262-b07f-4a42-86ec-9bf9c45709ee@collabora.com>
Date: Thu, 25 Jun 2026 10:36:21 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] docs: media: add documentation for media client
 usage stats
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, Christopher Healy <healych@amazon.com>
References: <20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com>
 <20260617-v4l2-add-fdinfo-v2-2-d298e98ce06a@collabora.com>
 <755cf7c1-6bcc-45d1-afea-192d393256af@kernel.org>
 <0449f2bf75685e17034ada5ae3961518ceb04345.camel@collabora.com>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <0449f2bf75685e17034ada5ae3961518ceb04345.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65653-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nicolas.dufresne@collabora.com,m:hverkuil+cisco@kernel.org,m:mchehab@kernel.org,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:ezequiel@vanguardiasur.com.ar,m:heiko@sntech.de,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:kernel@collabora.com,m:linux-arm-kernel@lists.infradead.org,m:healych@amazon.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E4BA6C6BAD

Hi !

On 6/19/26 10:04, Nicolas Dufresne wrote:
> Hi,
>
> Le vendredi 19 juin 2026 à 14:58 +0200, Hans Verkuil a écrit :
>> Hi Detlev,
>>
>> Interesting, I had never heard of fdinfo, so if nothing else, I learned something new!
>>
>> On 17/06/2026 20:10, Detlev Casanova wrote:
>>> From: Christopher Healy <healych@amazon.com>
>>>
>>> Document the media fdinfo interface for per-file-descriptor usage
>>> statistics exposed by stateless V4L2 codec drivers via
>>> /proc/<pid>/fdinfo/<fd>.
>>>
>>> This interface is designed for stateless (request API based) codec
>>> devices where the kernel driver has per-job visibility into hardware
>>> execution. Stateful codecs cannot support all of this because their
>>> firmware manages job scheduling opaquely.
>>>
>>> The specification defines media- prefixed keys for engine utilization
>>> time, and operating frequency, following the same conventions as the DRM
>>> fdinfo mechanism documented in drm-usage-stats.rst.
>>>
>>> More fields can be added later.
>>>
>>> Signed-off-by: Christopher Healy <healych@amazon.com>
>>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>>> ---
>>>   .../userspace-api/media/drivers/index.rst          |  1 +
>>>   .../media/drivers/media-usage-stats.rst            | 85 ++++++++++++++++++++++
>>>   2 files changed, 86 insertions(+)
>>>
>>> diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
>>> index 02967c9b18d6..61879738836c 100644
>>> --- a/Documentation/userspace-api/media/drivers/index.rst
>>> +++ b/Documentation/userspace-api/media/drivers/index.rst
>>> @@ -34,6 +34,7 @@ For more details see the file COPYING in the source distribution of Linux.
>>>   	imx-uapi
>>>   	mali-c55
>>>   	max2175
>>> +	media-usage-stats
>>>   	npcm-video
>>>   	omap3isp-uapi
>>>   	thp7312
>>> diff --git a/Documentation/userspace-api/media/drivers/media-usage-stats.rst b/Documentation/userspace-api/media/drivers/media-usage-stats.rst
>>> new file mode 100644
>>> index 000000000000..d3dc07002f62
>>> --- /dev/null
>>> +++ b/Documentation/userspace-api/media/drivers/media-usage-stats.rst
>>> @@ -0,0 +1,85 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +
>>> +.. _media-usage-stats:
>>> +
>>> +==========================
>>> +Media client usage stats
>> stats -> statistics
>>
>> But are these really statistics? Isn't it just the current status?
The term "statistics" was the first that came to my mind, but I agree 
it's not great here.
Thinking of it, the term "metrics" feels more adapted, what do you think ?

>> In many ways this feature looks to me similar to what VIDIOC_LOG_STATUS does,
>> except in a nicer format. When VIDIOC_LOG_STATUS was first added, fdinfo
>> didn't exist yet.
>>
>> And I wouldn't call it 'Media client': it's specific to stateless V4L2
>> codec drivers.
> While it is currently implemented for sateless m2m codec drivers as example
> (because we can't implement this everywhere at once really, its not practical),
> there is no reason why we cannot track to a process fdinfo memory usage
> associated with other video devices. In fact, I would pretty much want to see
> capture devices showing up in v4l2top, as these are using a lot of memory too,
> specially the new camera pipelines. And this is also perfectly suitable for
> stateful codec, converters, everything.
>
> So please, let's agree this is not "stateless V4L2 codec drivers" specific.
Indeed, but I get the confusion as the documentation suggests that 
stateless codec drivers fields are mandatory.
I'll rework it to have generic v4l2 fields that are mandatory for all 
driver types, and then fields per type (where it will focus on stateless 
codecs)
>
> About VIDIOC_LOG_STATUS, this is effectively broken for m2m, only the owning
> session process could call that. Its also pretty bad for tools to have to
> monitor the dmesg and filter it up. fdinfo on the other end, does not require
> opening the device and permissions are very clear, and bound to user process.
>
>>> +==========================
>>> +
>>> +Stateless V4L2 codec drivers can optionally expose per-file-descriptor usage
>>> +statistics via ``/proc/<pid>/fdinfo/<fd>``. This is analogous to the DRM fdinfo
>>> +mechanism documented in :ref:`drm-client-usage-stats`, but uses the ``media-``
>>> +key prefix for V4L2 media devices.
>>> +
>>> +This interface is specific to stateless (request API based) codec devices,
>>> +including both decoders and encoders. With stateless codecs, the kernel driver
>>> +explicitly submits each frame to the hardware and receives a completion
>>> +interrupt, providing a clean per-job boundary that can be attributed to the
>>> +submitting file descriptor.
>>> +
>>> +Stateful codec devices cannot support this interface because their firmware
>>> +manages job scheduling internally. The kernel driver submits bitstream data
>>> +but has no visibility into per-frame hardware execution timing.
>>> +
>>> +Implementation
>>> +==============
>>> +
>>> +The V4L2 core provides the plumbing: drivers implement the ``show_fdinfo``
>>> +callback in ``struct v4l2_file_operations``, and the core wires it into the
>>> +kernel ``struct file_operations`` so that ``/proc/<pid>/fdinfo/<fd>`` output
>>> +includes the driver-provided keys.
>>> +
>>> +File format specification
>>> +=========================
>>> +
>>> +- File shall contain one key value pair per one line of text.
>>> +- Colon character (``:``) must be used to delimit keys and values.
>>> +- All standardised keys shall be prefixed with ``media-``.
>>> +- Driver-specific keys shall be prefixed with ``driver_name-``.
>>> +
>>> +Mandatory keys
>>> +--------------
>>> +
>>> +- media-driver: <valstr>
>> I'd pick 'v4l2-driver'. Since 'media-driver' is too generic for this
>> since that encompasses also DVB/CEC/RC drivers.
v4l2-driver works for me.
>>
>>> +
>>> +  String shall contain the name of the media driver.
>> 'V4L2 stateless codec driver'
> With that said, we can refine, but not in that direction.
Then just 'V4L2 driver'
>>> +
>>> +- media-type: <valstr>
>> Poor name.
This fields will basically be the one telling userspace what fields to 
expect next.
"v4l2-type" sounds wrong as well. What about "v4l2-driver-type" ?
>>
>>> +
>>> +  String shall identify the type of media engine exposed through this file
>>> +  descriptor. Standard values are ``decoder`` and ``encoder``.
>> I think I would use 'stateless-decoder' and 'stateless-encoder'. It's more
>> specific than de/encoder since that can be stateful as well.
Yes, I totally agree.
>>
>> So I am missing the big picture here: right now this patch adds support for
>> this for stateless codecs, but what happens in the future if this is also
>> added for regular video capture devices, ISPs, etc.?
> We should work further on the type system, then we'd simply have to extend it.
> Different type of driver will provide different key/value pair. We should well
> document which key are mandatory for the type (or for all type, like giving a
> name for general identification purpose).
>
> Of course, the current proposal is very torward processing cores, hence the one
> to one match with what GPUs present in fdinfo today in mainline, such are
> frequency, core utilization time, etc.
>
> Though, DMA devices such as capture may expose more of a bandwidth kind of
> information. I really don't want to make up too may cases, so owners of these
> don't feel like this is mandated though. As we develop software using our
> drivers, we should be able to figure-out what kind of things are important to
> monitor. For CODECs, we have two majors things. a) core utilization (which can
> be with a timer like this one, but ideally using cycle counters, or firmware
> provided data). b) memory usage.
For core utilization, we can have both (HW cycles and time).
Time is less precise as it is computed by the driver, starting a bit 
before the hardware is run and a bit after the interrupt arrives.
HW cycles is very precise, but need the clock rate to be exposed and not 
all HW may support it.

We can say that time is mandatory (for stateless codec), as it can 
always be computed and HW cycles is optional.
For showing usage like in v4l2top, the userspace can compute it from HW 
cycles if available and fallback to less precise "Time" otherwise.

>
>> The naming here matters, it has to have some sort of scheme so it can be
>> extended to other types of drivers. So a 'media' prefix is too generic,
>> and it also looks like it refers to the /dev/mediaX device.
>>
>>> +
>>> +Utilization keys
>>> +----------------
>>> +
>>> +- media-engine-usage: <uint> ns
>> 'Media Engine': very vague.
Thinking of it, this one could be changed to 
"v4l2-core-usage-time-<core_id>".
That way we can have "v4l2-core-usage-cycles-<core_id>" too.

Separating by core id show more precise metrics.
>>
>>> +
>>> +  Time in nanoseconds that the hardware engine spent busy processing work
>> Cumulative since creating the file handle? Or since the last read?
I implemented cumulative since the file handle was created.
This is closer to what DRM does, so let's keep it. I'll specify it in 
the documentation.

>>
>>> +  belonging to this file descriptor. The engine being measured is identified
>>> +  by the ``media-type`` key.
>>> +
>>> +  Values are not required to be constantly monotonic if it makes the driver
>>> +  implementation easier, but are required to catch up with the previously
>>> +  reported larger value within a reasonable period.
>> Does this make sense for codecs?
>>
>> I can tell that this is heavily influenced by the drm documentation, but that
>> does not necessarily translate to V4L2.
> I would guess this is bound to usage of cycle counter, which we definitely have
> in some codec HW exposing. As the frequency fluctuate, I suppose there is ways
> you can get your calculation a bit off, as this is being sampled. Basically, the
> frequence change is not strictly tracked by our drivers, which is ok. But I also
> don't seen why we wouldn't keep the counters monotonic, its really easy to do.
Yeah, I think we can drop that comment. For each run, we just add a 
positive value,
so there is no reason not to be monotonic.
>>> +
>>> +Frequency keys
>>> +--------------
>>> +
>>> +- media-maxfreq: <uint> Hz
>>> +
>>> +  Maximum operating frequency of the main engine clock.
>>> +
>>> +- media-curfreq: <uint> Hz
>>> +
>>> +  Current operating frequency of the main engine clock.
>> 'Main engine clock'?
> The word "engine" seems indeed alien in this subsystem. It is referring to a
> system where you open one devices, so you have one fdinfo, but multiple cores.
> Each cores may be running at it owns frequency. But I think this is a little too
> vague to my taste.
Main doesn't refer to the main engine, but rather to the main clock of 
the engine.
e.g. rkvdec so far can have up to 5 clocks linked to it but only the one 
that actually clocks the HW should be exposed.

That being said, you are right that one file handle can have multiple 
cores, so the name should be changed to v4l2-maxfreq-<core_id> (and 
curfreq) and the text should use "main clock of the core <core_id>".

We also could just expose all clocks with their name, but userspace 
still needs to know which one can be used to compute usage %age from HW 
cycles.

Detlev.
>
> Hope this feedback does not cross to many wires, but tagging this as specific to
> stateless codec drivers did spark a little in my head. And we are really in need
> for a way to monitor our drivers.
>
> Nicolas
>
>>> +
>>> +Example output
>>> +==============
>>> +
>>> +::
>>> +
>>> +  media-driver:           hantro-vpu
>>> +  media-type:             decoder
>>> +  media-engine-usage:     123456789 ns
>>> +  media-maxfreq:          600000000 Hz
>>> +  media-curfreq:          600000000 Hz
>>>
>> Regards,
>>
>> 	Hans


