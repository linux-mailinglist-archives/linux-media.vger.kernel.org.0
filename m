Return-Path: <linux-media+bounces-47897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EF696C93EBD
	for <lists+linux-media@lfdr.de>; Sat, 29 Nov 2025 14:46:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AD7CE4E11F5
	for <lists+linux-media@lfdr.de>; Sat, 29 Nov 2025 13:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F4B30AAD8;
	Sat, 29 Nov 2025 13:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B2M05/Vk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AAD5B21A;
	Sat, 29 Nov 2025 13:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764423982; cv=none; b=r2ibZ2EuxcREKE5UPQJF8/PCq55PMIn6InVOetCem2qszVlHoX54k7SLdlAJf7rLL6s9+GYvv2AHKgYxuKPlyVtN+1+uPplfQL8ypENXCivp2luuJXm5r5/TJYja0GIbSQkVpR7w3azguUXaJ6itfgCtVGzQPHHNIedPygkHEcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764423982; c=relaxed/simple;
	bh=DBn8THaWXII/TT1Ks5xpnf0Fh75fzFIBUe9w+Al9TiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEgqByYA4WmMvskeoNNxMPdHH+T9dsdykJYSg9GHBEaCnWIcXbVY87e4gMJJit4yfTv9ztryJlljsWjWvjaEiY3kZq6evUQWBrzo+TnARo9x1vw/ZQbRYWcDhTbEAJ8iU1OjzvvquaWf0BM6yalU5nqkJITYhNsHFtR3CYH4SsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B2M05/Vk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764423981; x=1795959981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DBn8THaWXII/TT1Ks5xpnf0Fh75fzFIBUe9w+Al9TiQ=;
  b=B2M05/VkAcg9i2NSDdV8kjj4AAOkdnH7Z8n3QhFoA3wiL6DTYE8rk6JL
   fQlt19H0vER4uXFMPnpwGJl0j8HOudxozIKsLVaF1RgoRhNsQIYyz582S
   Capn15j9E3GsxT7z8IkgQ6F/ZCeV5bas72L/5zYCqfBU3UaosI7LFrt/7
   lGfCh+Hb6//fngXfl5bfwUT0A7j/xxljx633BRsNnGfeLJqhSj98pg2gW
   j/nIp3trusm/dEb9n+8GR9hnFvGEwiXccsWHm8vEMamf47jdeBi5MEUoB
   Y/m5oBdpn+w4s3o9DlIMrB3O6NKjqKg6qa939WL+oueBSeAd8EYizaxn2
   g==;
X-CSE-ConnectionGUID: PwtsxUueSmOrF37GTSBUdg==
X-CSE-MsgGUID: 14Zb+hoSSKq179A8uOTwCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66314466"
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="66314466"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 05:46:20 -0800
X-CSE-ConnectionGUID: 2A9LJ3dPQaS22icfC3qqHw==
X-CSE-MsgGUID: fga3RcU0R0Cpg5jnqNet0Q==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 05:46:18 -0800
Date: Sat, 29 Nov 2025 15:46:16 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hamdan Khan <hamdankhan212@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: Fix typos and comments
 alignment issue in include/linux/* header files
Message-ID: <aSr5KCPq-euRiqo6@smile.fi.intel.com>
References: <20251129061228.6286-1-hamdankhan212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129061228.6286-1-hamdankhan212@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Nov 29, 2025 at 11:12:28AM +0500, Hamdan Khan wrote:
> This patch fixes minor comment and code alignment issues in
> atomisp/include/linux/*.h header files. Some of them were warnings
> generated by checkpatch.pl (missing * at the start of the line or */
> present in the same line)

...

> -	int matrix[3 * 3];	/* RGB2YUV Color matrix, signed
> -				   <13-fraction_bits>.<fraction_bits> */
> +	/* RGB2YUV Color matrix, signed
> +	 * <13-fraction_bits>.<fraction_bits>
> +	 */

/*
 * This comment has to follow the common rules for
 * multi-line comments. Use this as an example.
 */

...

> +	/*
> +	 * the frame containing the overlay data The overlay frame width should

This becomes even worse. Fix the English text properly.

>  	 * be the multiples of 2*ISP_VEC_NELEMS. The overlay frame height
>  	 * should be the multiples of 2.
>  	 */

...

>  	/* the overlay start x pixel position on output frame It should be the
> -	   multiples of 2*ISP_VEC_NELEMS. */
> +	 * multiples of 2*ISP_VEC_NELEMS.
> +	 */

The same as per two above comments.

...

>  	/* the overlay start y pixel position on output frame It should be the
> -	   multiples of 2. */
> +	 * multiples of 2.
> +	 */

Ditto.

>  	/* CSI2-MIPI specific format: YUV data.
>  	 */
> -	ATOMISP_INPUT_FORMAT_YUV420_8_SHIFT,  /* YUV420 8-bit (Chroma Shifted
> -						 Pixel Sampling) */
> -	ATOMISP_INPUT_FORMAT_YUV420_10_SHIFT, /* YUV420 8-bit (Chroma Shifted
> -						 Pixel Sampling) */
> +	ATOMISP_INPUT_FORMAT_YUV420_8_SHIFT,   /* YUV420 8-bit (Chroma Shifted
> +						* Pixel Sampling)
> +						*/
> +	ATOMISP_INPUT_FORMAT_YUV420_10_SHIFT,  /* YUV420 10-bit (Chroma Shifted
> +						* Pixel Sampling)
> +						*/

Still not good. Make the comments to lead the definitions and also fix

	/* CSI2-MIPI specific format: YUV data. */
	...
	/* YUV420 10-bit (Chroma Shifted Pixel Sampling) */
	ATOMISP_INPUT_FORMAT_YUV420_10_SHIFT,

>  	/* CSI2-MIPI specific format: Generic long packet data
>  	 */

As per above.

You need to fix _all_ of them, do not leave the job half done.

...

>  /*
> - *  Sensor of external ISP can send multiple streams with different mipi data
> + * Sensor of external ISP can send multiple streams with different mipi data

MIPI

>   * type in the same virtual channel. This information needs to come from the
>   * sensor or external ISP

The sentence misses period at the end.

>   */

...

>  	/* Sensor driver fills ch_id with the id
> -	   of the virtual channel. */
> +	 * of the virtual channel.
> +	 */

>  	/* Tells how many streams in this virtual channel. If 0 ignore rest
> -	 * and the input format will be from mipi_info */
> +	 * and the input format will be from mipi_info
> +	 */

> -	/*
> -	 * if more isys_configs is more than 0, sensor needs to configure the
> +	/* If isys_configs is more than 0, sensor needs to configure the
>  	 * input format differently. width and height can be 0. If width and
>  	 * height is not zero, then the corresponding data needs to be set
>  	 */

All the above must be fixed properly.

...

TL:DR; this patch needs much more work. Take your time, the driver
is not so small. OTOH you can take one part of it and do this there.
I dunno if fixing one header subfolder is good enough, we may start
from it, but again, fix all problems, don't leave it in semi-baked
state.

-- 
With Best Regards,
Andy Shevchenko



