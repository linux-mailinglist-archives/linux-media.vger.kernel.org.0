Return-Path: <linux-media+bounces-12160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1B38D3972
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 16:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB9461C22FB4
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 14:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E692A15958A;
	Wed, 29 May 2024 14:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONGrP/dq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DBD159568;
	Wed, 29 May 2024 14:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716993328; cv=none; b=e0ytloT8qhmqTD/GSiMwJGexPZl+tFnqMnt0IbGxjSPiJA03auP20+Vi+Da9JsK6j5/1SzVB2Fz1BK3et2GR0rAd8qGmAr+Zl56nhQtYS/OAlFOHhumS7jIe2oMVOFoD2KiLrmc4C2+ivqJbTLYwSLusXena+46fnMlOZL/DJtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716993328; c=relaxed/simple;
	bh=DGQ2MiJt8VADMRRzcCTAtGDh88V5+BK2CV2kjEWYnw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6WGLIKxPZXztrzGV+6tHKyO7d8Pk3QsDxEyOSwqWPd7xXoVQOvg92c6P73o5q37mlOHJ4P3FFMZPstEByebKw8ldyVfEZD8+ZR8H78OT424WNSdPmkGKh2FPcHEulREyLABociNfBFCtcoPoqCvh6EQ+4pWTRs+c9jjU9lCogw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONGrP/dq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716993327; x=1748529327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DGQ2MiJt8VADMRRzcCTAtGDh88V5+BK2CV2kjEWYnw8=;
  b=ONGrP/dqu3BIHcWVRc8htUfQzPGaKbS8U8i2Jcoy6xV5tsj5j53ckta5
   5D8SVvb0UQMJqhn9nSCHkvb6zuX20SZiliawEFdmsAclSR5NlK3ACxJqt
   YFTYJ9+qE0ozK1swWXKrGpmHDVrmJHcZgdDUZLXEJimTsVVI1JJmVLY8s
   ATw5lLWcsMo0vr+tr9cyXpJvV3/tKMrPXneiKGx9UQDZ4IZBA43XaIIug
   I0DhjbamvDfRVLxIzmyEo2Af9S41zMoQ6vkV3FZct4g1Wt0lYUfhgcpm7
   7LRf3BsFdzkJZXsewiYHsbhHs206RkG20hQEllPl1ixgiGbsrD+Hf0Q3r
   w==;
X-CSE-ConnectionGUID: petFuGviSny2O7+YPQaOsg==
X-CSE-MsgGUID: 4R33d1g1RRWLK0jMcgBcag==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="17231209"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="17231209"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 07:35:26 -0700
X-CSE-ConnectionGUID: UYPNIogpT1S/XknKS3BvmQ==
X-CSE-MsgGUID: gXaxtfI4QfaIkMCJdaDf4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="35540351"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 07:35:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sCKOZ-0000000BpWl-3Oav;
	Wed, 29 May 2024 17:35:15 +0300
Date: Wed, 29 May 2024 17:35:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com,
	akpm@linux-foundation.org, gregkh@linuxfoundation.org,
	adobriyan@gmail.com, jani.nikula@intel.com, p.zabel@pengutronix.de,
	airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
	vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
	detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
	andrzej.p@collabora.com, nicolas@ndufresne.ca, davidgow@google.com,
	dlatypov@google.com
Subject: Re: [PATCH v9 07/10] lib: add basic KUnit test for lib/math
Message-ID: <Zlc9I4H2u0TQC95X@smile.fi.intel.com>
References: <20240526175655.1093707-1-devarsht@ti.com>
 <20240526180933.1126116-1-devarsht@ti.com>
 <ZlTu_9orsuosNiGk@smile.fi.intel.com>
 <ZlTvLS8oTPcvZKQN@smile.fi.intel.com>
 <9c88bc47-35f0-86ed-2df7-dd83640d9997@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c88bc47-35f0-86ed-2df7-dd83640d9997@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, May 28, 2024 at 05:01:31PM +0530, Devarsh Thakkar wrote:
> On 28/05/24 02:08, Andy Shevchenko wrote:
> > On Mon, May 27, 2024 at 11:37:20PM +0300, Andy Shevchenko wrote:
> >> On Sun, May 26, 2024 at 11:39:33PM +0530, Devarsh Thakkar wrote:

...

> >>> +MODULE_LICENSE("GPL");
> >>
> >> modpost validator won't be happy about this, i.e. missing MODULE_DESCRIPTION().
> > 
> > And obviously + module.h in the inclusion block.
> 
> The module.h is already included under include/kunit/test.h and that's the
> reason compiler did not give any error. But I can still include it under
> math.h for better readability as you suggested as anyway compiler will not
> re-include if already included by another header file.

Please do as it will be in line with IWYU principle.

> Also I see we were missing a dependency between math_kunit and kunit modules,
> so adding a dependency there too.

Thank you.

-- 
With Best Regards,
Andy Shevchenko



