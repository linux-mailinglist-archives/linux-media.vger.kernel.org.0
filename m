Return-Path: <linux-media+bounces-12156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E58F8D3764
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 15:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F3771F26B5A
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 13:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725DE10958;
	Wed, 29 May 2024 13:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xf/UdYNf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF6B17C67;
	Wed, 29 May 2024 13:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716988640; cv=none; b=AIRBlAJ/2wkyWQ0W2cvi3ZG0pjNQg9b1hi0AHiPX3f9K0dhm50fKy3quG21zAMVGaU7Eitn95aEGnyDGeln/4OOSdiUMBtvMiEKG1oDAVgL+qIGx/5akcWjm8yUr+qx/95n1ypOQlKrPYQQ47ZinfDwUalVQ1HTVqsh1PA/nlNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716988640; c=relaxed/simple;
	bh=BmD7dT9t87GMS04NIpQ27MfyjLdW9OC9lzhy731bihs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKJ0hfFOxikI9GbD7KBvEv2EdmfeABYO+Zjw6nkY3zdS+7wnQOGvtCIL7LktQsuD3ykeg+RALDdqYQbEoVcuUU3iXIaSauVLfxSJ0SKS/+NDPkPJxE5H1H19JRWkY0TiTlPoxPfxjsJnBBTp+TZWxD3GrxuLbJP+DKKNQ7BLcU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xf/UdYNf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716988639; x=1748524639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BmD7dT9t87GMS04NIpQ27MfyjLdW9OC9lzhy731bihs=;
  b=Xf/UdYNf1gez9RBGAdwYBx7XTuDBK2gI2YvzB4ZlrIvbt9q5xfgc7xcQ
   8cVjJMkgj2SJEas/+9gCQVTuOxd9g0jXQ7nd3b4H+nzIDCVS8p4lI9o5O
   4Oz9WCwiu2bm1l39QEMi6IIGsfl+XCRr0wQAl5EDu/60U5o6B7uckh0sF
   95e5nSjYU12c4m/z1CzFAde7tovOreIe/DNRc1vNexyqpdRPvnqDvpoaG
   0ZphpHmAGxBNx91vZ8P2SQQsKgMaDlHG9+vt09bbfIFGuy6eeUc27I90q
   97wXBcGnYV/TPu3yyqtPZGiBDddAU70soeIkEpTh3JSuPhLXx/cvNTbRc
   Q==;
X-CSE-ConnectionGUID: EOwSPIyDS86rxR5fzs2TBw==
X-CSE-MsgGUID: PUaf8JRqRpi0zvo889DWwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="17221011"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="17221011"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 06:17:19 -0700
X-CSE-ConnectionGUID: TLr+a4g+QUyEQtMQ22Ef+w==
X-CSE-MsgGUID: HbHpf9VKSu6jNVQR0Pd0ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="40328426"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 06:17:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sCJAy-0000000Bnsd-0MYz;
	Wed, 29 May 2024 16:17:08 +0300
Date: Wed, 29 May 2024 16:17:07 +0300
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
Subject: Re: [PATCH v9 06/10] math.h: Add macros for rounding to closest value
Message-ID: <Zlcq07G697jGqHAg@smile.fi.intel.com>
References: <20240526175655.1093707-1-devarsht@ti.com>
 <20240526180856.1124470-1-devarsht@ti.com>
 <ZlTt-YWzyRyhmT9n@smile.fi.intel.com>
 <86f9ed66-c58e-0b2d-dd2b-4372ff26a3c3@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86f9ed66-c58e-0b2d-dd2b-4372ff26a3c3@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, May 28, 2024 at 04:02:30PM +0530, Devarsh Thakkar wrote:
> On 28/05/24 02:02, Andy Shevchenko wrote:
> > On Sun, May 26, 2024 at 11:38:56PM +0530, Devarsh Thakkar wrote:

...

> >> +/**
> >> + * round_closest_up - round closest to be multiple of specified value (which is
> >> + *                    power of 2) with preference to rounding up
> >> +
> > 
> > Not that big deal, but missing '*' here. Personally I would not even put
> > a blank line between Summary and Field Descriptions.
> 
> My bad. Yes I would remove the blank line here. This is picked up as warning
> from kernel-doc too.
> 
> >> + * @x: the value to round
> >> + * @y: multiple to round closest to (must be a power of 2)
> >> + *
> >> + * Rounds @x to closest multiple of @y (which must be a power of 2).
> >> + * The value can be either rounded up or rounded down depending upon rounded
> >> + * value's closeness to the specified value. If there are two closest possible
> >> + * values, i.e. the difference between the specified value and it's rounded up
> >> + * and rounded down values is same then preference is given to rounded up
> >> + * value.
> >> + *
> >> + * To perform arbitrary rounding to closest value (not multiple of 2), use
> >> + * roundclosest().
> >> + *
> >> + * Examples :
> > 
> > What is this suppose to be rendered to?
> 
> The file math.h is not rendered as part of kernel-doc right now. I can put
> this under Documentation/core-api/kernel-api.rst perhaps I can create a new
> section as below:
> 
> Rounding, absolute diff and 32bit division macros
> -------------------------------------------------
> 
> under the section:
> CRC and Math Functions in Linux
> 
> ===============================
> 
> is that okay ?

This is up to you, but what I meant is that you always can render manually
yourself. And I was asking about the result you got when you tried (and you
did, right?) to render to man, html, and pdf.

> >> + * round_closest_up(17, 4) = 16
> >> + * round_closest_up(15, 4) = 16
> >> + * round_closest_up(14, 4) = 16
> > 
> > Btw, is kernel-doc validator happy about all kernel docs you added?
> 
> Yes, except the aforementioned blank line.

-- 
With Best Regards,
Andy Shevchenko



