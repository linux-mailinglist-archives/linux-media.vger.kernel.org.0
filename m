Return-Path: <linux-media+bounces-50726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4A8D212C6
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 21:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F01333052F7F
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 20:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04FD72E541E;
	Wed, 14 Jan 2026 20:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SuYbwaNp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242D5333427;
	Wed, 14 Jan 2026 20:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768422372; cv=none; b=GsnJZk0yQqwnGjVtTs/eZTxAN67qCGJLrT2ogkDQLkgcFQOnVRyK2v9/aPhHZZRY5zsq8QS+CsllOwpduxQqr0pJMCbo+/3i+bU6tn9PI13yhQ7/Ae2buKm9HKkA2sznlguAmZ0eukA55TAq12teyzgMOB8uBdnLoFW3zDm7gR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768422372; c=relaxed/simple;
	bh=j9fOwUQdaNqUt23BEheUfnpeBvVj3T752nS+o2AqnUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8PU0QS1AwSE5u9Uj/WtIeCAk+/iWPkmlfJbxNJC88rHHRtTJX0hmeE6sTAG959nrwwi4+RzDoseDe/3nPoW2kWwyNpzXQ8y15/atYFJLLdRl6DB/k6Mc+J/5MiQzawT1UwldmWnBPJGsvTv9pGZnag2hdFnLi2QAP0mBztI5BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SuYbwaNp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768422371; x=1799958371;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j9fOwUQdaNqUt23BEheUfnpeBvVj3T752nS+o2AqnUw=;
  b=SuYbwaNpG1Jyg98vgNma0XetchIZGzu5l8ZfQ8C7aGiz+Rm1BJeZtCuW
   yoF+oIgaR043GwWUEvXIWydUlO46tgKecSqkoJfx2z32NONnGTkN/aVKP
   QS5TdP9Osv0MRdjmRFNxAAaw+RsYJslH8ch7r1AQ1rZJ1rkF9ALBDVFs8
   mc4vRwBKgc4Q+oJ0AOmusCrgTaSuy3SYW7RhKcfE/GiD4tLsQ0oxRf5Dv
   l9dXRBarsB3HnGBzKhqEKUbXY3xFGpTmWeMEqCMfKKeIXcrJEKeuJyVI6
   1dxl110pi5appXJwXPcsrfnwNT+fB2oEtDnjd9zTg2sVXhR4DzrXTIeyr
   w==;
X-CSE-ConnectionGUID: b5DdG12zTUmQLMQxJLmUlA==
X-CSE-MsgGUID: YpSXosMFTUGfUE7/we8prw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="87309633"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="87309633"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 12:26:10 -0800
X-CSE-ConnectionGUID: FwBHksyQQLao+YMuPzjFmQ==
X-CSE-MsgGUID: SVG0AogVSaWiH2h88krqmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="242329030"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 12:26:08 -0800
Date: Wed, 14 Jan 2026 22:26:05 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Karthikey Kadati <karthikey3608@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] media: atomisp: replace ia_css_region with v4l2_rect
Message-ID: <aWf73fJxGsST0qLJ@smile.fi.intel.com>
References: <20260114183628.45822-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114183628.45822-1-karthikey3608@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jan 15, 2026 at 12:06:28AM +0530, Karthikey Kadati wrote:

> The struct ia_css_region definition is redundant as struct v4l2_rect
> provides the same functionality (left, top, width, height) and is the
> standard V4L2 type.
> 
> Replace usage of ia_css_region with v4l2_rect in ia_css_dz_config
> and remove the definition of ia_css_region from ia_css_types.h.
> 
> Also remove historical comments referencing the addition of zoom_region
> and include <linux/videodev2.h> to support the v4l2_rect type.

Thanks for the update, my comments below.

...

> int atomisp_reset(struct atomisp_device *isp)

>  	/* Reset ISP by power-cycling it */
>  	int ret = 0;
>  
> -	dev_dbg(isp->dev, "%s\n", __func__);
>  
>  	ret = atomisp_power_off(isp->dev);
>  	if (ret < 0)

Commit message doesn't say anything about this kind of changes.

...

>  static void atomisp_3a_stats_ready_event(struct atomisp_sub_device *asd,
> -	uint8_t exp_id)
> +					 uint8_t exp_id)

Ditto (and if you go this way, the change actually should move from uint8_t to
u8 (or __u8 if it's the part of ABI).

...

With that said, this change has to be split to at least 3 patches.

...

> -	if (dz_config->zoom_region.resolution.width
> -	    == asd->sensor_array_res.width
> -	    || dz_config->zoom_region.resolution.height
> +	if (dz_config->zoom_region.width
> +	    == asd->sensor_array_res.width ||
> +	    dz_config->zoom_region.height
>  	    == asd->sensor_array_res.height) {

Make sure the == is on the previous line in both cases. I believe it's now
enough room to make it joined.

...

> -		dz_config->zoom_region.origin.x = dz_config->zoom_region.origin.x
> +		dz_config->zoom_region.left = dz_config->zoom_region.left
>  						  * eff_res.width
>  						  / (asd->sensor_array_res.width - 2 * w_offset);

Should be now

		dz_config->zoom_region.left = dz_config->zoom_region.left *
			eff_res.width / (asd->sensor_array_res.width - 2 * w_offset);

as it fits closer to 80 with gain in readability.

...

Same comments (as above and here) are applied to other similar cases.


...

> +#include <linux/videodev2.h>

+ blank line as the below is a private header for the driver.

>  #include <type_support.h>

>  #include "ia_css_frac.h"

...

>  struct ia_css_dz_config {
>  	u32 dx; /** Horizontal zoom factor */
>  	u32 dy; /** Vertical zoom factor */
> -	struct ia_css_region zoom_region; /** region for zoom */
> +	struct v4l2_rect zoom_region; /** region for zoom */

Precursor patch to convert this to kernel-doc?

>  };

-- 
With Best Regards,
Andy Shevchenko



