Return-Path: <linux-media+bounces-11661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A462A8C9EDF
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 16:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FDCB284F17
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 14:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27597136994;
	Mon, 20 May 2024 14:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U5u7d1NX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7B8182DF;
	Mon, 20 May 2024 14:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716215716; cv=none; b=nxcxMVQiCnetOn6Xc+V2ouT8bRvdYXny/tQFGPO7j1LtITMi+udaeICXUTpw/i3hpNh+R0mt0H9qIGG2XiRN2f8Il54/MfIbUiExDIAN384hS2pfVWiL5jffZfExTWjlzGxTbFJMaUE8hZASYuZaSZ3ekZ0cg8XyQxW/lZ3HAKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716215716; c=relaxed/simple;
	bh=yCoPR1d+Zt+QtoUbnC3otqSv3QoByt1aVGPymXoVu5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SrkjuxHZFVzOEGFJ7QdGe9pjWfiDiqrhEeRJHG8JLIHd7IJdQpGoCgAycQUgCQ73/Rm0mdebbL1fGvJDN9WZYs27EKIEs9/zVj2AdJLHsp2nMhjaWgg5e/purx02+JaffAnTK2P8N10BS1KqvLrDnFTqJbpmIQNLis1YCcTs6io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U5u7d1NX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716215714; x=1747751714;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yCoPR1d+Zt+QtoUbnC3otqSv3QoByt1aVGPymXoVu5Y=;
  b=U5u7d1NXhq4z7FMTINQmbgMHKIHAiZ8OarvD4hIpHE8Cba9PCjWn1C8w
   GGv0AteNCSIQlMkpe6NPOXtoAwQf6l7rmXyYOWj8kBHRFsCRm2s+YoGzY
   J4JGrfSyNtVGNGK2Ez/bNRBtYuF8lGLUYA4V9dKjQPboZs6veT3KlVfrN
   a11ifo05wzrPePviDMU92Gyu4awXnbqfoIb8N6wE1ctOKkUEKzEoFLsVx
   4vo5AiUVqylIpmNHYbz37/cXNXyQTBjz6s85PQwg0ReGr02qc7HdbljWa
   iMighBxHslfh499uG5BCx9xgsEO1v0Oda4niYRN/agRaMr7lLg2l+yWhg
   w==;
X-CSE-ConnectionGUID: qh4/56dITF2iDPCF63LiaA==
X-CSE-MsgGUID: +8qul86URUq9pANi3rFneA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="29866678"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="29866678"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 07:35:13 -0700
X-CSE-ConnectionGUID: 8ZK9kJk8RlmKxp8jpC69jA==
X-CSE-MsgGUID: SsWd1+giTGaMnFnAdrEnAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="32588040"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 07:35:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s946S-00000009L88-12iK;
	Mon, 20 May 2024 17:35:04 +0300
Date: Mon, 20 May 2024 17:35:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: Daniel Latypov <dlatypov@google.com>, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
	sebastian.fricke@collabora.com, akpm@linux-foundation.org,
	gregkh@linuxfoundation.org, adobriyan@gmail.com,
	jani.nikula@intel.com, p.zabel@pengutronix.de, airlied@gmail.com,
	daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
	vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
	detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
	andrzej.p@collabora.com, nicolas@ndufresne.ca, davidgow@google.com
Subject: Re: [PATCH v8 07/10] lib: add basic KUnit test for lib/math
Message-ID: <ZktfmF1a7gzc-hqB@smile.fi.intel.com>
References: <20240517171532.748684-1-devarsht@ti.com>
 <20240517173607.800549-1-devarsht@ti.com>
 <Zke6o3HYnUrgtD0K@smile.fi.intel.com>
 <7b8cd37b-5b16-2d99-ab62-5d6876e6571c@ti.com>
 <ZktAlza1zEke1eCx@smile.fi.intel.com>
 <01bd1d88-2cff-ad12-c7fb-3f2eddcfd899@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01bd1d88-2cff-ad12-c7fb-3f2eddcfd899@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 20, 2024 at 07:51:24PM +0530, Devarsh Thakkar wrote:
> On 20/05/24 17:52, Andy Shevchenko wrote:
> > On Mon, May 20, 2024 at 05:11:18PM +0530, Devarsh Thakkar wrote:
> >> On 18/05/24 01:44, Andy Shevchenko wrote:
> >>> On Fri, May 17, 2024 at 11:06:07PM +0530, Devarsh Thakkar wrote:

[..]

> > Yes, and one should follow IWYU principle and not cargo cult or whatever
> > arbitrary lists.
> 
> Agreed.

> >>>> +#include <linux/lcm.h>
> >>>
> >>> + math.h // obviously
> >>> + module.h
> >>>
> >>>> +#include <linux/reciprocal_div.h>
> >>>
> >>> + types.h
> >>
> >> All the above headers are already included as part of kernel.h
> > 
> > Yes, that's why you should not use "proxy" headers.
> > Have you read the top comment in the kernel.h?
> 
> Yes, it says it is not recommended to include this inside another header file.
> Although here we are adding it inside c file, but I can still try avoid it and
> include only the required headers instead of kernel.h as you recommended.

Right, but the first sentence there is
"This header has combined a lot of unrelated to each other stuff."

Can you explain how you use in your code all that unrelated stuff?
For example, how do you use *trace_*() calls? Or maybe might_*() calls?
or anything else that is directly provided by kernel.h?

Besides IWYU principle above, it's good to have a justification for each
inclusion the C file has. I believe there is no a such in _this_ case.

-- 
With Best Regards,
Andy Shevchenko



