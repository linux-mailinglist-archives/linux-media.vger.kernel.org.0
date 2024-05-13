Return-Path: <linux-media+bounces-11408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 383158C4195
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 15:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A3981C22DBD
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 13:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E21152185;
	Mon, 13 May 2024 13:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTAifjR8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527CF15098C;
	Mon, 13 May 2024 13:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715606056; cv=none; b=ovcCEPqE2H4tXQY6HVK1Fomcz5Oj+/wvbXunj5hVdjxtyjFR1FNotrpwBB2WwOmEwFUAsnddmulMbTRm6bESMrRngGIhelJAU+GielxTRLpHVKSDp7kXVwTHQYCjaKwSM62Dm1ZH/Iao9RAudmRfLBPUCzSyc8eR4dwofweP7ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715606056; c=relaxed/simple;
	bh=fZPA2U0w/NaPd1XPXrH9KUPReWy8Mu/+vRwHo8Emv3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Io6Fxech5otQMPL7jq5mkFRmdGwmLQEoHSKJfJn/QjRlKuxWL2JGn/hrKFHD37tGi3/Xv4wQmUHd02IzhH93pED/UwZvD8ZFipArubI9hjlbZ7OQfTY7i5b6t4Bz8eOe9T8g//OlgFCx1wc/8N/vaUbv9Fw/9wDTIOt1CNZAQIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HTAifjR8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715606055; x=1747142055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fZPA2U0w/NaPd1XPXrH9KUPReWy8Mu/+vRwHo8Emv3A=;
  b=HTAifjR8rlutgfCDh22fQkiJbeyODvI8uAWfUVsVPT1OL4IsnP/Ncv33
   jObe8GTaCmwILV8mXsrasEPbd/ehHtXOfLqL1ZVTkPQ3kK8acRV8f22pt
   uaUyiJamNbRCBTaEapsY3spv0BwmzY0XTOUMY+AQGx7W5U3eo5K1Iq9pE
   4SbOQGPkq0Ej+SHVQYyVWqhiMPzeoH7Gg9Cr0OWSwWdj/8gAym9RCFTI1
   u6ti0+JSNIKKGjRPR29vYn5eomQbmqgb6/QL+5qjfLL8GDBgcgCW47u9l
   XpwUAn28xoulJKD0IPXI4nEN7kG7B8KJ5CSNyYs1FNZ/CEKh9wQMP7dWI
   Q==;
X-CSE-ConnectionGUID: Dbt8KeG9SrCdSj4jWI6q3w==
X-CSE-MsgGUID: CDp7fslAQ6yp4nLqLaCQrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11390399"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="11390399"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 06:14:14 -0700
X-CSE-ConnectionGUID: HrSYo+lVRL2UPrBM1JzUzw==
X-CSE-MsgGUID: AhNYnZ1gQ/y065zn5CRwig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="30456394"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 06:14:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s6VVE-000000078wG-0cig;
	Mon, 13 May 2024 16:14:04 +0300
Date: Mon, 13 May 2024 16:14:03 +0300
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
Message-ID: <ZkISG6p1tn9Do-xY@smile.fi.intel.com>
References: <20240509183952.4064331-1-devarsht@ti.com>
 <Zj42vTpyH71TWeTk@smile.fi.intel.com>
 <87fruphf55.fsf@intel.com>
 <5ebcf480-81c6-4c2d-96e8-727d44f21ca9@ti.com>
 <ZkHWbS4raU_BPlpm@smile.fi.intel.com>
 <6557050e-6b18-2628-cbab-1a811b2190ba@ti.com>
 <ZkIG0-01pz632l4R@smile.fi.intel.com>
 <d63ae19c-9316-3a4c-e9ed-1672ace068b6@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d63ae19c-9316-3a4c-e9ed-1672ace068b6@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 13, 2024 at 06:34:19PM +0530, Devarsh Thakkar wrote:
> On 13/05/24 17:55, Andy Shevchenko wrote:
> > On Mon, May 13, 2024 at 04:55:58PM +0530, Devarsh Thakkar wrote:
> >> On 13/05/24 14:29, Andy Shevchenko wrote:
> >>> On Sat, May 11, 2024 at 11:11:14PM +0530, Devarsh Thakkar wrote:
> >>>> On 10/05/24 20:45, Jani Nikula wrote:

[...]

> > - align naming (with the existing round*() macros)
> 
> I think round_closest_up/round_closest_down align already and inspired by the
> existing naming convention used for round*() and DIV_ROUND_CLOSEST() macros in
> math.h as explained below (copied from my previous reply [1])
> 
> "Coming back to naming, this is as per existing convention used for naming
> round_up, round_down (notice the `_` being used for macros working with pow of
> 2) and DIV_ROUND_CLOSEST (notice the work `closest` used to specify the answer
>  to be nearest to specified value)"
> 
> But do let me know if you have any other suggestions for naming?

Just make sure that semantically the naming is aligned, that's it.
If you think it's already done that way, fine!

-- 
With Best Regards,
Andy Shevchenko



