Return-Path: <linux-media+bounces-11395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 553EE8C3DAC
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 10:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F0662828ED
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 08:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88491487D1;
	Mon, 13 May 2024 08:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X396QGVl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805432B9D1;
	Mon, 13 May 2024 08:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715590778; cv=none; b=eyQzHpXbT0b9UMbRHWn309NxzXoCgHK8STCcDPS6TO4WJUEpwZztmgVTvAOoQTJt307mMsat7L7WZYs6GRBN9KA3hspWarSIukEHmMQOuZcDyLyNjxujw+slBx/tJrPK9tHmA4CzYhSuSYv1IqeZGcx1xLaCDx1Ix/k0JGmtwf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715590778; c=relaxed/simple;
	bh=GkcpnSXdP2QJe/nIK16ifPBaXDbWf1z8/BdrtfIYiB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rtouipejJ/q8/BlJkof8Fj0dPLy6rm+2O0An9gWluhZR+mLhei+7LmH7rpvUydo17AOKi+M2syg3Uehkr1QQFEWEzn/4y808FFIX5Dmy8sswlKUGo8H7kABKP1WYXlY7uhHVDsF+2eEaVMD1eufuBKlPeE+c3kNE2Uefwnun89I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X396QGVl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715590777; x=1747126777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GkcpnSXdP2QJe/nIK16ifPBaXDbWf1z8/BdrtfIYiB4=;
  b=X396QGVlWki4+XE0e5WT7nQThpZWED9yRuyf85sp7j3nfh/Zt8ccqV98
   KJaCAqASXjY0GGE0pyXCE10/OxHRg9E0BRENXwar2g9sOeav4BhZJRW3Z
   K2oTtDz5X3vvR81qBLhTqdrHf618jrxv4gqBM069w00jb4KzHZWhZR3qx
   ovGSAa9e+nWaJ66RHTVY5txI58NJus9y4RzY/5W64XSf1dU0r3g/NGIZm
   KA1nvj6ZlK/VJ4WTnTYEeYWY9DJ7XGieM46uHOUb76xXZ5Rb2q6qzzYzm
   H6JdGCpdASIdcFuK2/HDBAwT+uwpHNnOJHPLJjPK4Nwckqopm9rjKEi9h
   w==;
X-CSE-ConnectionGUID: O3zR/S6xRiOz5++e9k/+rg==
X-CSE-MsgGUID: FXn5DOJQQ0u+dKLJYIIirA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11348033"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="11348033"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 01:59:36 -0700
X-CSE-ConnectionGUID: sBHxFiuaQr2d8aTgX+3YPQ==
X-CSE-MsgGUID: THqMi0FFSxSmVvRr4ukQKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="35149553"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 01:59:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s6RWn-000000073rW-3Hnn;
	Mon, 13 May 2024 11:59:25 +0300
Date: Mon, 13 May 2024 11:59:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: Jani Nikula <jani.nikula@intel.com>, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
	sebastian.fricke@collabora.com, akpm@linux-foundation.org,
	gregkh@linuxfoundation.org, adobriyan@gmail.com,
	p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
	praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
	j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
	p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
	nicolas@ndufresne.ca
Subject: Re: [PATCH v7 6/8] math.h Add macros to round to closest specified
 power of 2
Message-ID: <ZkHWbS4raU_BPlpm@smile.fi.intel.com>
References: <20240509183952.4064331-1-devarsht@ti.com>
 <Zj42vTpyH71TWeTk@smile.fi.intel.com>
 <87fruphf55.fsf@intel.com>
 <5ebcf480-81c6-4c2d-96e8-727d44f21ca9@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ebcf480-81c6-4c2d-96e8-727d44f21ca9@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, May 11, 2024 at 11:11:14PM +0530, Devarsh Thakkar wrote:
> On 10/05/24 20:45, Jani Nikula wrote:

[...]

> > Moreover, I think the naming of round_up() and round_down() should have
> > reflected the fact that they operate on powers of 2. It's unfortunate
> > that the difference to roundup() and rounddown() is just the underscore!
> > That's just a trap.
> > 
> > So let's perhaps not repeat the same with round_closest_up() and
> > round_closest_down()?
> 
> Yes the naming is inspired by existing macros i.e. round_up, round_down
> (which round up/down to next pow of 2) and DIV_ROUND_CLOSEST (which
> round the divided value to closest value) and there are already a lot of
> users for these API's :
> 
>   linux-next git:(heads/next-20240509) ✗ grep -nr round_up drivers | wc
>     730    4261   74775
> 
>   linux-next git:(heads/next-20240509) ✗ grep -nr round_down drivers | wc
>     226    1293   22194
> 
>  linux-next git:(heads/next-20240509) ✗ grep -nr DIV_ROUND_CLOSEST
> drivers | wc
>    1207    7461  111822

Side note, discover `git grep ...`: it's much much faster on Git index,
than classic one on a working copy.

> so I thought to align with existing naming convention assuming
> developers are already familiar with this.
> 
> But if a wider consensus is to go with a newer naming convention then I
> am open to it, although a challenge there would be to keep it short. For
> e.g. this one is already 3 words, if we go with more explicit
> "round_closest_up_pow_2" it looks quite long in my opinion :) .

You need properly name the macros. Again, round_up() / roundup() and
roundup_pow_of_two() are three _different_ macros, and it's not clear
why you can't use one of them in your case.

The patch that changes those to a new one are doubtful to begin with.
I.e. need a careful review on the arithmetics side of the change
including HW capabilities of handling "closest" results.

-- 
With Best Regards,
Andy Shevchenko



