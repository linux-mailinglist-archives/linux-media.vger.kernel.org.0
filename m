Return-Path: <linux-media+bounces-11335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1D18C27D9
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 17:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5C5C1F214E9
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 15:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC46171E62;
	Fri, 10 May 2024 15:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V0oBaUaS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C28117166C;
	Fri, 10 May 2024 15:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715354943; cv=none; b=mpFO5yRKXLdmTifSPAyiHByF1lt2/61BL6dRSuNmyhx3USjAdcP2i2X+vsAWPmxhSR65lS4C1QW7D+rRJOGEVv2deY68gFrEwC4VtwtINpbSbwiUA92SIWzPYPdXTE/ybN3+fBCa6FmoP5twiJP0+VY/NTfrnLtFXIIiCYwO+y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715354943; c=relaxed/simple;
	bh=glm6K5/Xk0wjpLSBdU0Yd+zs1pppGMGVEKiFN3HdM7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QE+c6PJ3tqP3kwbbJ41gEL3HeJ4NU8DCbZju0mcHO77A+2WKgt0sUzIVyn1B/wAoehFhZfETvQy/Cip/C9JznKYSNdfFToYUd7FOacVH/ZNvTA+fAFwEwUhcn41gDa4N97W5Yexz5LqCBXGIqwoVtl3ywEWuqs3FMMoy1zSGIpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V0oBaUaS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715354943; x=1746890943;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=glm6K5/Xk0wjpLSBdU0Yd+zs1pppGMGVEKiFN3HdM7c=;
  b=V0oBaUaSq3vQI6HDPV+CA0n861nzJC4MGRiWQsUiRx0NcHb9icvRPJgs
   apUVxpX+B8GJs6qBcDPizB740Qm3uu1jrZFMtop2fHJhQuBL42Wv0ZYn5
   RfXarzGduYNhrQq01bHBMLvEiWQQ/2Cpug1PgWkHfy7jLZexlYAyK6Ndx
   Sy5wE5yjJs97zHnYlYupx8X4wMGiHwIHO7wb6aL0STvRPhmptcqzFn17+
   v185yoCnHeNJewDeuMmIV8VEDS/kFQvhR+1osCfJtxN8pZElIkw0dsjSl
   zWkN8Xwq/erC1AG1rtJO4fqD7W4Xw9SbYQBKBlDa4uBYk7DuhHddWIUS5
   w==;
X-CSE-ConnectionGUID: slOd/0rbQv6iHU+LDk9rog==
X-CSE-MsgGUID: eaxgiOpLSC2a3dsBtg7FnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="28825463"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="28825463"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:29:03 -0700
X-CSE-ConnectionGUID: ww4RHDtNREOiGbN3Z/4+6Q==
X-CSE-MsgGUID: YuXYbDQITCqLG7bhB9KUqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="29757874"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:28:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s5SB2-0000000695W-188w;
	Fri, 10 May 2024 18:28:52 +0300
Date: Fri, 10 May 2024 18:28:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, mchehab@kernel.org,
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
Message-ID: <Zj49M4ZwSChNRuXs@smile.fi.intel.com>
References: <20240509183952.4064331-1-devarsht@ti.com>
 <Zj42vTpyH71TWeTk@smile.fi.intel.com>
 <87fruphf55.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fruphf55.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 10, 2024 at 06:15:34PM +0300, Jani Nikula wrote:
> On Fri, 10 May 2024, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, May 10, 2024 at 12:09:52AM +0530, Devarsh Thakkar wrote:
> >> Add macros to round to nearest specified power of 2.
> >
> > This is not what they are doing. For the above we already have macros defined.
> >
> >> Two macros are added :
> >
> > (Yes, after I wrapped to comment this line looks better on its own,
> >  so whatever will be the first sentence, this line should be separated
> >  from.)
> >
> >> round_closest_up and round_closest_down which round up to nearest multiple
> >
> > round_closest_up() and round_closest_down()
> >
> >
> >> of 2 with a preference to round up or round down respectively if there are
> >> two possible nearest values to the given number.
> >
> > You should reformulate, because AFAICS there is the crucial difference
> > from these and existing round_*_pow_of_two().
> 
> Moreover, I think the naming of round_up() and round_down() should have
> reflected the fact that they operate on powers of 2. It's unfortunate
> that the difference to roundup() and rounddown() is just the underscore!
> That's just a trap.

FYI:
https://stackoverflow.com/questions/58139219/difference-of-align-and-round-up-macro-in-the-linux-kernel

> So let's perhaps not repeat the same with round_closest_up() and
> round_closest_down()?


-- 
With Best Regards,
Andy Shevchenko



