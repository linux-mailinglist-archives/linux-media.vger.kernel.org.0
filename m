Return-Path: <linux-media+bounces-16924-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A86E960AAA
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 14:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B31DD1F238C4
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6BB1BB6A9;
	Tue, 27 Aug 2024 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6oPnuuy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91711BA862;
	Tue, 27 Aug 2024 12:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724762414; cv=none; b=lv9SAuyNwZwOQaLnCpamUL9qh59uUjip+9zjMpfdBuK1C+kArPGeXSkezuvtKWRp8NtdYkgIVT6VlbFKS6arlVr9TbtiKmhDWUbdIBrORCPnYPhh1jTwsrHJJifvbduAxglSzXjzbbugvst2ZrUAWx9mH+9GGoDpIVd3a5jocok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724762414; c=relaxed/simple;
	bh=K4K8o40fJGQu6cafxSC7zWCIvY6jYj3G/g/Nol8nbuQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Y/4bDDitCblRHjHWKrBwdQ3i6BYO6AR95ilKl6HSwOPOkuNCzeDcNxKQU2sHaaq4mvZ51nRb9IhfOLaXnsLa55oJtKd1BaHiaz5+VCRmhR4VfyMSUYP8+WASz45ageqJCnf5ahPTWEWjUF+GU9RgcheM19AgVh0DM3yy8jZljPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6oPnuuy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724762413; x=1756298413;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=K4K8o40fJGQu6cafxSC7zWCIvY6jYj3G/g/Nol8nbuQ=;
  b=b6oPnuuySHXu9JBr1PLlQgAYXRhP1k1bHtV0CM8BA5ichQAkNRdPbRZU
   PqTc78XOxb4zWX6XHrc+3IORH9sWKT783nvi29w/XhfK/2t28IjrHXvr3
   k/7k7awCJE0BdPtu83QxY0l2+whn4f2fFPzcNgS08a3sG7coO4Qeh1osy
   ThTbEZCQVIdhe2NRdXtguCugIXBwu7NAqBqaNsiFMqAlAA3lTqy/N/wF1
   HYb1YPVrziaZzgRb599epwO5xQaZQEAvWc1LSxc2CMaNwxqjo4rNQ+dH1
   BK3pqOfbg2iCcPgW2y/X93J3RYUz+Onm6MkDy+u508dmawUNWxGWzxh4T
   A==;
X-CSE-ConnectionGUID: 7yTPWtYzQju1bDdH7i35ZA==
X-CSE-MsgGUID: p+Fsarn8R6evEzvUftnwSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23115468"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="23115468"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:40:12 -0700
X-CSE-ConnectionGUID: 3aJrmhWoQyG4VAUeNQd4AA==
X-CSE-MsgGUID: nqTcsyasRlyC0Xh04Mq1/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="66998828"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.226])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:40:02 -0700
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
In-Reply-To: <9c41f6b7-6b06-cd5b-74bd-24873c4beaf7@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240826150822.4057164-1-devarsht@ti.com>
 <20240826150822.4057164-2-devarsht@ti.com>
 <Zsy-8xXQ01-JhL0m@smile.fi.intel.com>
 <9c41f6b7-6b06-cd5b-74bd-24873c4beaf7@ti.com>
Date: Tue, 27 Aug 2024 15:40:00 +0300
Message-ID: <87frqqyw9r.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 27 Aug 2024, Devarsh Thakkar <devarsht@ti.com> wrote:
> Hi Andy,
>
> Thanks for the review.
>
> On 26/08/24 23:14, Andy Shevchenko wrote:
>> On Mon, Aug 26, 2024 at 08:38:17PM +0530, Devarsh Thakkar wrote:
>>> Add below rounding related macros:
>>>
>>> round_closest_up(x, y) : Rounds x to the closest multiple of y where y is a
>>> power of 2, with a preference to round up in case two nearest values are
>>> possible.
>>>
>>> round_closest_down(x, y) : Rounds x to the closest multiple of y where y is
>>> a power of 2, with a preference to round down in case two nearest values
>>> are possible.
>>>
>>> roundclosest(x, y) : Rounds x to the closest multiple of y, this macro
>>> should generally be used only when y is not multiple of 2 as otherwise
>>> round_closest* macros should be used which are much faster.
>> 
>> I understand the point, but if you need to send a v3, please explain
>> the equivalency between roundclosest() and one (or both?) of the
>> round_closest_*() in case the argument is power-of-2.
>> 
>
> The equivalency between roundclosest w.r.t round_closest is same as
> equivalency between existing macros rounddown w.r.t round_down. Functionally
> both are same but the former is recommended to be used only for the scenario
> where multiple is not power of 2 and latter is faster but is strictly for the
> scenario where multiple is power of 2. I think the same is already summarized
> well in commit message and further elaborated in the patch itself as part of
> header file comments [1] so I personally don't think any update is required
> w.r.t this.

I still don't think rounddown vs. round_down naming is a good example to
model anything after.

I have yet to hear a single compelling argument in favor of having a
single underscore in the middle of a name having implications about the
inputs of a macro/function.

The macros being added here are at 2 or 3 in Rusty's scale [1]. We could
aim for 6 (The name tells you how to use it), but also do opportunistic
8 (The compiler will warn if you get it wrong) for compile-time
constants.

As-is, these, and round_up/round_down, are just setting a trap for an
unsuspecting kernel developer to fall into.


BR,
Jani.


[1] https://ozlabs.org/~rusty/index.cgi/tech/2008-03-30.html


>
> [1]: https://lore.kernel.org/all/20240826150822.4057164-2-devarsht@ti.com
>
> Regards
> Devarsh

-- 
Jani Nikula, Intel

