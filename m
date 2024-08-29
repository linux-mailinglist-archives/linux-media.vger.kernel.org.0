Return-Path: <linux-media+bounces-17111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 575BF963FC3
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 11:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CA7E2874CD
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 09:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A267718D625;
	Thu, 29 Aug 2024 09:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R8hefzsR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363C73E47B;
	Thu, 29 Aug 2024 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923198; cv=none; b=ZGNor03sX8UfvSY9YuuapvI0+zqyisz5Ddb4udr6vIpLpRu1l4T77fznDXWRexn/F5BfLNpjLGIGEoJt+U/vZdPqMfXthaN7MVgHCAwQeDRv3/gvk7CoZwYoOZmlrHJsyRZW9+lpWoZVVhrmIFDXAA/0zvI7AMVLI1FD/taTf+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923198; c=relaxed/simple;
	bh=y0oWGGe7R6HnOQYclTlWlPmFdV39yRoRU7bLFGNWI3M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=c6L732fOXTMUBduU9EVAWbVFCkoonKwAvtXCiXAX8htZfkds66mKvYv6Zl3/0bhV9Ulsch1f0HdN3ERNYFz/yUNja959ny6uvC4WJ10+BHGEgyG3yQX9hYkUb5ObDSCWanfq1xCRnfYKdSWSJFBLvEKh2vzVnTGzpdLdgtsB5zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R8hefzsR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724923197; x=1756459197;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=y0oWGGe7R6HnOQYclTlWlPmFdV39yRoRU7bLFGNWI3M=;
  b=R8hefzsR7kj+9v5PuhxD8FfRhCqiBXtbwslxKBKyH3OxHgXEOI3rX5s1
   UZvNO/C6p1J9dd6xDsnBruGW3PJtrL39/gYhKWV1fK6hWH1k2F2fJq5XZ
   6qWntJfeHXZWZDoASIbjZl8tNhT7XydiysWPREb830UoNRY7nbESOJDkw
   7iEViAlxaqKc2QQwAiMFGx6hr4pLSHvIAMyrhqWom/O2G6zQttsNCG5cf
   YrZyrnh9mfV2nmiInxGzkx6STgdBeLdUmuaEAJEFJpXTpegtZ53b4RiMV
   HbRUodbIs8jtQQv/lsVxS1puYDRVrATOoFDN/mqzPEbaRgt9DM/QvO+My
   g==;
X-CSE-ConnectionGUID: jL/Wf+aMScCiK5+6RxN8sw==
X-CSE-MsgGUID: 0xfuGmKSQ4Ogrs2+TzZpZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="40978199"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="40978199"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 02:19:56 -0700
X-CSE-ConnectionGUID: UaV69X6MRAaEwbmgVJX0bg==
X-CSE-MsgGUID: emelES7JQ9GXwWK4dghn7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="68345578"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.242])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 02:19:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Devarsh Thakkar <devarsht@ti.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sebastian.fricke@collabora.com, linux-doc@vger.kernel.org,
 praneeth@ti.com, nm@ti.com, vigneshr@ti.com, s-jain1@ti.com,
 r-donadkar@ti.com, b-brnich@ti.com, detheridge@ti.com, p-mantena@ti.com,
 vijayp@ti.com, andi.shyti@linux.intel.com, nicolas@ndufresne.ca,
 jirislaby@kernel.org, davidgow@google.com, dlatypov@google.com,
 corbet@lwn.net, broonie@kernel.org, rdunlap@infradead.org,
 nik.borisov@suse.com, Dave.Martin@arm.com
Subject: Re: [PATCH v2 1/6] math.h: Add macros for rounding to the closest
 value
In-Reply-To: <0b06794b-34c5-ec0d-59c6-8412a8789eaf@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240826150822.4057164-1-devarsht@ti.com>
 <20240826150822.4057164-2-devarsht@ti.com>
 <Zsy-8xXQ01-JhL0m@smile.fi.intel.com>
 <9c41f6b7-6b06-cd5b-74bd-24873c4beaf7@ti.com> <87frqqyw9r.fsf@intel.com>
 <0b06794b-34c5-ec0d-59c6-8412a8789eaf@ti.com>
Date: Thu, 29 Aug 2024 12:19:43 +0300
Message-ID: <878qwfy9cg.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 27 Aug 2024, Devarsh Thakkar <devarsht@ti.com> wrote:
> Hi Nikula,
>
> Thanks for the review.
>
> On 27/08/24 18:10, Jani Nikula wrote:
>> On Tue, 27 Aug 2024, Devarsh Thakkar <devarsht@ti.com> wrote:
>
> [..]
>
>>> The equivalency between roundclosest w.r.t round_closest is same as
>>> equivalency between existing macros rounddown w.r.t round_down. Functionally
>>> both are same but the former is recommended to be used only for the scenario
>>> where multiple is not power of 2 and latter is faster but is strictly for the
>>> scenario where multiple is power of 2. I think the same is already summarized
>>> well in commit message and further elaborated in the patch itself as part of
>>> header file comments [1] so I personally don't think any update is required
>>> w.r.t this.
>> 
>> I still don't think rounddown vs. round_down naming is a good example to
>> model anything after.
>> 
>> I have yet to hear a single compelling argument in favor of having a
>> single underscore in the middle of a name having implications about the
>> inputs of a macro/function.
>> 
>> The macros being added here are at 2 or 3 in Rusty's scale [1]. We could
>> aim for 6 (The name tells you how to use it), but also do opportunistic
>> 8 (The compiler will warn if you get it wrong) for compile-time
>> constants.
>> 
>
> The macros use existing round_up/round_down underneath, so need to check if
> they have compile-time checks but either-way this should not block the current
> series as the series does not aim to enhance the existing round_up/round_down
> macros.
>
>> As-is, these, and round_up/round_down, are just setting a trap for an
>> unsuspecting kernel developer to fall into.
>> 
>
> I understand what you are saying but I believe this was already discussed in
> original patch series [1] where you had raised the same issue and it was even
> discussed if we want to go with a new naming convention (like
> round_closest_up_pow_2) [2] or not and the final consensus reached on naming
> was to align with the existing round*() macros [3]. Moreover, I didn't hear
> back any further arguments on this in further 8 revisions carrying this patch,
> so thought this was aligned per wider consensus.
>
> Anyways, to re-iterate the discussion do we want to change to below naming scheme?
>
> round_closest_up_pow_2
> round_closest_down_pow_2
> roundclosest
>
> or any other suggestions for naming ?
>
> If there is a wider consensus on the suggested name (and ok to deviate from
> existing naming convention), then we can go ahead with that.

The stupid thing here is, I still don't remember which one is the
generic thing, rounddown() or round_down(). I have to look it up every
single time to be sure. I refuse to believe I'd be the only one.

It's okay to accidentally use the generic version, no harm done. It's
definitely not okay to accidentally use the special pow-2 version, so it
should have a special name. I think _pow2() or _pow_2() is a fine
suffix.

Another stupid thing is, I'd name the generic thing round_down(). But
whoopsie, that's not the generic thing.

This naming puts an unnecessary extra burden on people. It's a stupid
"convention" to follow. It's a mistake. Not repeating a mistake trumps
following the pattern.

There, I've said it. Up to the people who ack and commit to decide.


BR,
Jani.


>
> [1]: https://lore.kernel.org/all/ZkIG0-01pz632l4R@smile.fi.intel.com/
> [2]: https://lore.kernel.org/all/5ebcf480-81c6-4c2d-96e8-727d44f21ca9@ti.com/
> [3]:
> https://lore.kernel.org/all/ZkIG0-01pz632l4R@smile.fi.intel.com/#:~:text=series%20is%20that%3A%0A%2D-,align,-naming%20(with%20the
>
> Regards
> Devarsh
>> 
>> BR,
>> Jani.
>> 
>> 
>> [1] https://ozlabs.org/~rusty/index.cgi/tech/2008-03-30.html
>> 
>> 
>>>
>>> [1]: https://lore.kernel.org/all/20240826150822.4057164-2-devarsht@ti.com
>>>
>>> Regards
>>> Devarsh
>> 

-- 
Jani Nikula, Intel

