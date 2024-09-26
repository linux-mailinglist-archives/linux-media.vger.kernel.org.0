Return-Path: <linux-media+bounces-18644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A38F98767C
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 17:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCAA61C25217
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 15:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD40D153598;
	Thu, 26 Sep 2024 15:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vq74IETz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B2714831C;
	Thu, 26 Sep 2024 15:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727364377; cv=none; b=BjdM6aWK8nDBRMg5VbtXnlk7IESIcxxWkHjb6LZyHazOP4x/dZ2BOmO9p0qmD6XtTJBOMDfMdcIAv0sprcw/SiLG92XNBs+mShJOinHUz+oSfGJKvMnuE2PKA70Oo3o+ajgYDWa44RdPe1Zlx/V1M2XTR3NqMIB/ua0OYAuBZ2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727364377; c=relaxed/simple;
	bh=oY4Re+7yWR5ejxf3mKC3i9fyf3AdqNYQvJ5hHnZnU48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W/T25nxQH7rCDx+9s3+XqlZVDBOrw/t9IW8jRAWCSSQOo2aAsAqJTrHpAYjyP0Rgsc1rcAxIWjOLmtFQFXd7S19f4s4o/oaSE/2hQKxwoLuHuKDTv+C0aEsp0JG2i+CQUO13bxNsptwBSIBSb4DMM65ftS8y3I6KsQViGwxkE1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vq74IETz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4A6E169;
	Thu, 26 Sep 2024 17:24:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727364285;
	bh=oY4Re+7yWR5ejxf3mKC3i9fyf3AdqNYQvJ5hHnZnU48=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vq74IETz1bxEylrKNBpdULuQ8SPUCz7LaoGYnlskcRU2j8tzacqfQXPJLg0X/C0Fz
	 6jBh4rM4Ng+3D2RB+XWCtxnDcghCoSXF6MN3yGsiqE57gkI0jdz2GHmjr4fsvebdIX
	 dIeVXF7jFzvIZbg6HaLUxPAiFIEZHCIioxet7D24=
Message-ID: <51fb2ba0-ae49-4799-9450-98bb90c4b36d@ideasonboard.com>
Date: Thu, 26 Sep 2024 18:26:09 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: v4l2-subdev: Add cleanup macros for active
 state
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
References: <20240917-scoped-state-v1-0-b8ba3fbe5952@ideasonboard.com>
 <20240917-scoped-state-v1-1-b8ba3fbe5952@ideasonboard.com>
 <20240924171736.GE30551@pendragon.ideasonboard.com>
 <9d150a98-5147-459f-8277-79e108ff6b30@ideasonboard.com>
 <20240925163530.GC27666@pendragon.ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240925163530.GC27666@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2024 19:35, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Tue, Sep 24, 2024 at 08:53:38PM +0300, Tomi Valkeinen wrote:
>> On 24/09/2024 20:17, Laurent Pinchart wrote:
>>> On Tue, Sep 17, 2024 at 05:09:29PM +0300, Tomi Valkeinen wrote:
>>>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>>>
>>>> Add cleanup macros for active state. These can be used to call
>>>> v4l2_subdev_lock_and_get_active_state() and manage the unlocking either
>>>> in unscoped or scoped fashion:
>>>>
>>>> This locks the state, gets it to the 'state' variable, and unlocks when
>>>> exiting the surrounding scope:
>>>>
>>>> CLASS(v4l2_subdev_lock_and_get_active_state, state)(subdev);
>>>>
>>>> This does the same, but inside the given scope:
>>>>
>>>> scoped_v4l2_subdev_lock_and_get_active_state(subdev) {
>>>> }
>>>>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>>> ---
>>>>    include/media/v4l2-subdev.h | 10 ++++++++++
>>>>    1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>>>> index bd235d325ff9..699007cfffd7 100644
>>>> --- a/include/media/v4l2-subdev.h
>>>> +++ b/include/media/v4l2-subdev.h
>>>> @@ -8,6 +8,7 @@
>>>>    #ifndef _V4L2_SUBDEV_H
>>>>    #define _V4L2_SUBDEV_H
>>>>    
>>>> +#include <linux/cleanup.h>
>>>>    #include <linux/types.h>
>>>>    #include <linux/v4l2-subdev.h>
>>>>    #include <media/media-entity.h>
>>>> @@ -1854,6 +1855,15 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
>>>>    	return sd->active_state;
>>>>    }
>>>>    
>>>> +DEFINE_CLASS(v4l2_subdev_lock_and_get_active_state, struct v4l2_subdev_state *,
>>>> +	     v4l2_subdev_unlock_state(_T),
>>>> +	     v4l2_subdev_lock_and_get_active_state(sd), struct v4l2_subdev *sd);
>>>> +
>>>> +#define scoped_v4l2_subdev_lock_and_get_active_state(sd)              \
>>>> +	for (CLASS(v4l2_subdev_lock_and_get_active_state, state)(sd), \
>>>> +	     *done = NULL;                                            \
>>>> +	     !done; done = (void *)1)
>>>
>>> That a very long name :-S Could this be done using the scoped_guard()
>>> macro instead ? For instance, with spinlocks you can do
>>>
>>> 	scoped_guard(spinlock_irqsave, &dev->lock) {
>>> 		...
>>> 	}
>>>
>>> It would be nice to be able to write
>>>
>>> 	scoped_guard(v4l2_subdev_state, sd) {
>>
>> This can be done but then you need to pass the state to it, not sd. Or
>> perhaps it would be possible to implicitly turn the sd into active
>> state, but I don't like that at all...
>>
>> Or maybe:
>>
>> scoped_guard(v4l2_subdev_state, v4l2_subdev_get_unlocked_active_state(sd))
>>
>> Not very short either...
> 
> That's not very nice. Are there other examples in the kernel of
> scoped_*() macros magically creating variables that are then used within
> the scope ? I have a feeling we shouldn't do it here.

I'm not aware of any other scoped macros than scoped_guard. Or if there 
are similar macros creating a variable.

I think creating the variable inside the macro is one of the main points 
with scoped_v4l2_subdev_lock_and_get_active_state(), so that not only 
the locking of the state of scoped, also the variable is scoped. It 
hasn't been just once or twice when I have accidentally used a variable 
that was supposed to be only used inside a scope.

>>> 		...
>>> 	}
>>>
>>> This being said, we would then end up with the state variable being
>>> named scope, which wouldn't be great.
>>
>> No, it wouldn't.
>>
>>> This is actually one of my issues with the above macros, and especially
>>> scoped_v4l2_subdev_lock_and_get_active_state(). It creates a local state
>>> variable in the scope, which makes the code less readable in my opinion.
>>
>> It's trivial to add a variable name there, as mentioned in the intro letter.
>>
>> You mentioned the const/non-const state issue in the other email. I
>> wonder if some macro-magic could be done for that... Or we can always
>> just add "scoped_v4l2_subdev_lock_and_get_active_state_const()"! =)
> 
> And that's supposed to be an improvement ? :D
> 
>> Also, it's not like we have to use these _everywhere_. So maybe if you
>> want a const state, don't use the scoped or the class.
> 
> Looking at the rest of your series there are very few instances of
> scoped_v4l2_subdev_lock_and_get_active_state(), so I'm tempted to simply

The changes in this series were just a few examples for a couple of 
drivers I've been working on lately. I didn't do any kind of thorough 
study how many users we have for these.

> leave it out. When one writes
> 
> 	scoped_guard(spinlock_irqsave, &dev->lock) {
> 	}
> 
> It's clear that you're locking the lock for the scope using
> spinlock_irqsave. The scoped guard performs a scoped action on an
> existing object. The V4L2 subdev active state is different, I don't
> think scoped_guard() gives the right semantics.

Hmm so are you here referring specifically to using scoped_guard() for 
the active state locking, or do you refer to the 
scoped_v4l2_subdev_lock_and_get_active_state()?

>>> We could keep the class and drop
>>> scoped_v4l2_subdev_lock_and_get_active_state(). I think I would like to
>>> shorten the class name then.
>>>
>>> Another option is to use DEFINE_FREE() and __free() instead.
>>
>> That can be added too. I had them, but I didn't consider them as useful
>> when I already added the class and scoped.
>>
>> I have to say I don't particularly like the look of either the scoped or
>> the class, or even the free. But they're so useful wrt. error handling
>> that I don't care if the syntax annoys me =).
> 
> CLASS() is a bit better once we'll get used to it, as the name of the
> variable is explicit. It however doesn't solve the const issue.

Again, we can add the variable name to 
scoped_v4l2_subdev_lock_and_get_active_state(), it's a trivial change.

I don't really see the const issue as a major thing. Missing the const 
here never breaks anything. You can pass the non-const state to 
functions that take const state. And you never have to use these 
helpers, you can do it all manually.

Adding const versions is possible. In some way the code has to tell the 
macros that "I want const state", so adding a __const() version of the 
macro sounds fine to me. Except the length of the name quickly becomes a 
problem =).

> Furthermore, its semantics is meant to represent creation of an object
> with automatic destruction when it leaves the scope, while with the
> subdev active state you're not creating an object. That's why I think

The lock guards use CLASS(), and they're not creating any new objects. 
They do hide the use of CLASS, though. But we can do the same by just 
creating our own macro that directly uses CLASS.

> that an explicit variable with a __free() annotation may be the best
> option for this.

But __free() does a different thing. It can, of course, be used in a 
scoped fashion by adding a scope with { }, like:

	{
		struct v4l2_subdev_state *state __free(v4l2_subdev_state_lock) = 
v4l2_subdev_lock_and_get_active_state(sd);

		// use state
	}

but I don't very often see that style used. "__free()" there also makes 
me think the state will be freed... And the line above is definitely not 
short...

If we come up with a suitable short name, this is quite a bit cleaner 
looking:

	hopefully_somewhat_short_name(sd, state) {
		// use state
	}

But all that said, I have to say I don't know if we have enough users 
for these to make these worthwhile. Looking at the single 
scoped_v4l2_subdev_lock_and_get_active_state() use I added to 
rzg2l-csi2.c... That's not really needed, as the original code is not 
right: the rzg2l_csi2_calc_mbps() shouldn't lock the active state, it 
should be passed the (locked) active state.

  Tomi


