Return-Path: <linux-media+bounces-13154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C52906552
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 09:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DA9E28477F
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 07:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF8613C3E2;
	Thu, 13 Jun 2024 07:38:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D0D136997
	for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 07:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718264318; cv=none; b=XbCMhr3VyyQvh2wC9/EPchnw81sxZG0JqQisG/icfu/YCtwkNpWxwbSmKtF7OuqGoAg9TwQKQthP4gzwVI4xPCjVa0j5jB69s6g+Dt3p8cx9BKj2yPC7E4cWYMRzzUyUSQVXw8WTnWOY3QdFNbOX5aBESvtw00mVE1ecSyBzD/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718264318; c=relaxed/simple;
	bh=SMqYCtOVJPwo6iV755Y1EZG10CPu+co6O+QR0p5gkF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=raTJhUPrHKaev9MWeU+Emx7RsyRP6Uo0jWeAOmtTUE9KYPzdPng/n4DTpk8Mx7MEMGx4cAx7Q/MTKDm0KaZIO+5veWsTORYlIBas7TEa6DbHI9+bWFv0XENtoqQmzE0cGEVgpoE6Wfrv6akvhCc9eYANGxwSvlTyUJP4VaKif5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2359C2BBFC;
	Thu, 13 Jun 2024 07:38:35 +0000 (UTC)
Message-ID: <3211e218-265d-47f5-858b-9b81b185eba7@xs4all.nl>
Date: Thu, 13 Jun 2024 09:38:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Tomasz Figa <tfiga@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Hidenori Kobayashi <hidenorik@chromium.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Young <sean@mess.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
 <7CB6738E-DADE-4F4D-9501-C701B2F3F2B7@collabora.com>
 <CAAFQd5Ae7ctMiPWw1=ugeVCFhTJYbNQ_G2xnoOoc-EYRqp4B2A@mail.gmail.com>
 <2326f490-d9dc-4fa9-a9dd-86e56d7ba6d2@xs4all.nl>
 <20240612095448.1e99b751@coco.lan>
 <CAAFQd5BRJt7HB+=Xc8sq+xj1eLOoeUGnFp=Ndv6WJzcw_39wEg@mail.gmail.com>
 <20240612223448.30f1e9cb@coco.lan>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240612223448.30f1e9cb@coco.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/06/2024 22:35, Mauro Carvalho Chehab wrote:
> Em Wed, 12 Jun 2024 17:22:34 +0900
> Tomasz Figa <tfiga@chromium.org> escreveu:
> 
>> On Wed, Jun 12, 2024 at 4:54 PM Mauro Carvalho Chehab
>> <mchehab@kernel.org> wrote:
>>>
>>> Em Wed, 12 Jun 2024 08:46:50 +0200
>>> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
>>>  
>>>> On 6/12/24 06:12, Tomasz Figa wrote:  
>>>>> On Wed, May 15, 2024 at 1:19 AM Daniel Almeida
>>>>> <daniel.almeida@collabora.com> wrote:  
>>>>>>
>>>>>> Hi Hans, all,
>>>>>>
>>>>>> I’d like to attend in person and discuss the use of Rust in the subsystem, especially in light of [0] and [1].
>>>>>>
>>>>>> Please note that these are new submissions that are unrelated with what was discussed last year.
>>>>>>
>>>>>> 30 minutes will do.
>>>>>>
>>>>>> [0] https://lwn.net/ml/linux-media/20240227215146.46487-1-daniel.almeida@collabora.com/
>>>>>> [1] https://lwn.net/Articles/970565  
>>>>>
>>>>> Somewhat related to the topic: I see potential for a quite big
>>>>> redesign of the videobuf2 framework going forward and recently with
>>>>> more Rust adoption I'm starting to think it could benefit from being
>>>>> implemented in Rust, since we would have to rewrite it quite a bit
>>>>> anyway. Especially since it's a part of the subsystem that has to deal
>>>>> with memory management, object lifetime and asynchronousness quite a
>>>>> lot and we had a history of issues there. So it could be interesting
>>>>> to hear everyone's thoughts.  
>>>>
>>>> I think it is far too soon to write a framework like that in Rust.  
>>>
>>> Agreed. I don't object redesigns in C to make it better - which could have
>>> some colateral effect of making things easier for a future Rust adoption,
>>> but such changes should be justified by themselves, and not because of a
>>> language change.  
>>
>> No, the thought of redesign doesn't come from the language change,
>> it's the other way around. Since rewriting a lot of the code already,
>> why not do it in a language that is generally considered better.
> 
> As Hans said, Rast has experimental support. We can't have drivers
> depending on experimental stuff.

Indeed.

While discussing Rust for experimental drivers or codec libraries is
interesting (and I am doing a Rust course, so hopefully I have a better
understanding of what's involved by the upcoming media summit), using
it for core media frameworks is simply a hard NACK until Linus blesses
Rust as a second kernel language.

So don't spend your valuable time on that.

> 
>>
>>>
>>> See: redesigns at the core will potentially affect lots of drivers,
>>> so it needs very good technical reasons why doing it. Plus, it requires
>>> comprehensive tests with different types of hardware/drivers to reduce the
>>> risk of regressions. Depending on the changes, it may require extra tests
>>> with devices that are outside complex camera world: radio, analog and digital
>>> TV drivers - and even some input devices that use VB2 - to ensure that
>>> nothing broke.  
>>
>> We don't have to do it in an all-or-nothing way. We can start with an
>> experimental new implementation in Rust, which could be gradually
>> tested. It could even be done the same way as the vb -> vb2
>> transition, although I suspect it wouldn't really be necessary, as I
>> would like to see it more like a drop-in replacement. In general I
>> think the API exposed outside of the framework wouldn't really change
>> that much, it's more about the internal design.

It makes no sense to have a C and a Rust version of vb2. This framework
is critical to all drivers, and we're not going to support two versions
and fix bugs/add features in two places. Again, it's a hard NACK. Don't
waste time on that.

If there are ideas to make vb2 better, then I am all for that.

I just want to mention two things here:

For most drivers, using vb2 is just fine: the work a driver needs to do is
quite straightforward. Exceptions are codec drivers and possibly complex
camera drivers when they need to use requests (not certain yet).

Internally vb2 is quite complex, but that's because what it does is quite
complex. And that's fine. If the internal structure can be improved to
make it less complex, then I'm all for that, but there is no magic bullet
(including using Rust instead of C) that suddenly makes everything simple.

Generally I prefer to have the complexity in core frameworks, that will
only make life easier for the driver developers.

To summarize:

Until Rust is accepted by Linus as a second kernel language, as media
maintainer I will NACK core media frameworks written in Rust. I won't
spend time on it, it's an immediate NACK from me.

Note that this doesn't imply that once Linus *does* accept Rust, that we
are OK with core frameworks written in Rust. But that will be a separate
discussion once that happens.

Regards,

	Hans

> 
> Having two implementations of the same logic doesn't sound reasonable,
> as it doubles the maintainership effort: all changes done on one
> implementation needs to be moved to the other one.
> 
> Btw, we also have seem this problem before with VB and, up to some
> sense, with VB2, as some drivers used to have their own buffer
> handling implementation that usually started from a VB or VB2 fork.
> 
> So, if VB2 has issues, let's fix it in C code.
> 
>>>> To be
>>>> honest, I won't even consider it until Linus officially accepts Rust as a
>>>> second language in the kernel, instead of as an experiment.  
>>>
>>> This is not enough: if the core starts to use a second language, all media
>>> developers will be affected and will be required to have expertise on such
>>> language.  
>>
>> Let's be realistic, how many developers are actively touching vb2 these days?
> 
> How many developers don't need VB2? Hopefully none :-)
> 
>>> That's not something that should happen without careful
>>> analysis and plans that should include a gradual roll-up, lost of tests
>>> with the affected drivers including the legacy ones and some strategy to
>>> quickly solve regression issues.  
>>
>> That said, I agree. It needs proper discussion and planning. That's
>> why I'm proposing this as a topic. :)
>> Moreover the redesign itself also needs proper discussion and is more
>> of a long term goal, not something to land in the next few days.
>>
>>>
>>> It is not a matter of what language is better. Instead, it is a matter of
>>> not affecting code maintenance during the (probably long) transition period
>>> and beyond.
>>>
>>> If you see the past history, the transition from V4L to V4L2 took more than 10
>>> years - being possible to be done only with the help of libv4l, plus a
>>> lot of backward-compat code that we added. Still there were several
>>> regressions and we even had to quickly patch the Kernel and/or some apps
>>> that were using the uAPI on different ways.  
>>
>> That's a different situation, because UAPI is involved.
> 
> It is different, but similar, up to some sense, as a change at VB2 
> implementation will likely affect its kAPI, its behavior or both.
> 
> The point I'm underlining is that core redesigns do affect existing
> drivers usually on unexpected ways.
> 
>>
>>>
>>> Yet, the transition from VB1 to VB2 was also painful, and took a lot of time.
>>>  
>>
>> Yes, vb -> vb2 would be a more appropriate comparison.
>>
>>> On both cases, there were very good technical reasons for the transition,
>>> in terms of missing needed features, broken memory models and serious
>>> troubles that utterly causing VB1 to not work well on non-x86 hardware.
>>>  
>>
>> It's a very similar situation now, vb2 doesn't work well on modern
>> hardware, but I still have hopes that it can be fixed without
>> affecting the driver-facing behavior. (We would probably need to
>> develop some unit tests that validate the driver-facing behavior to
>> ensure that.)
>>
>>> In the end, the authors of the core changes need to acquire legacy hardware
>>> and to do lots of driver-specific changes to avoid breaking existing stuff.
>>> Hans and I had to dedicate a lot of time and efforts on such transitions,
>>> as it required a lot of work.
>>>
>>> I can tell you: there's no fun on such changes: typically, companies won't
>>> pay someone to do changes on drivers for legacy hardware, specially
>>> when there are no real benefits, which is the case here, as the final result
>>> is just to keep the existing drivers to work with existing hardware,
>>> usually without any new features. So, the ones behind such core changes
>>> have to commit fixing drivers usually on their spare time.
>>>  
>>
>> I don't get that argument. Wouldn't the same apply to any core change?
> 
> It depends of the type of change. For instance, an addition of a new
> V4L2 control should not cause regressions to existing drivers. The
> same would be true if one adds a new memory allocation component for
> VB2 (e. g. something similar to videobuf2-vmalloc.c/videobuf2-dma-sg.c/..):
> only drivers using the new way would be affected.
> 
>> I think the reason we have driver maintainers is that they can help
>> with testing. Moreover, we need to invest into testing infrastructure
>> (which is what people have been doing recently via Media CI) to make
>> such changes less painful. Otherwise the subsystem will just bit-rot
>> and become useful for modern use cases.
> 
> Using CI to check for uAPI/kAPI changes is helpful, but it doesn't cover
> actual drivers. For that, we would need to invest on a CI solution
> integrated with lots of different hardware pieces, to check for actual
> driver regressions.
> 
> On one of my previous work, the company I used to work had that: they
> had some monitors display some things, and the camera captured input
> were compared to what the monitor were actually displaying. Doable, but
> expensive. 
> 
> Regards,
> Mauro
> 
> Thanks,
> Mauro


