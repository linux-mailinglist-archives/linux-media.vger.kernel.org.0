Return-Path: <linux-media+bounces-9400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE75B8A550B
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 16:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68998280C97
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7CB78C7A;
	Mon, 15 Apr 2024 14:40:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CD876025
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 14:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713192016; cv=none; b=ks+To94hfFnuFgvgcNCQlN4JymQUnOm0HL1pEdShw6WLrXjdq+cLAExdCSn0/3WZU9N0aIrjCo4lsIjTMArvMqfjO8JeCNqkISblI4+QZ1FxLpk1i3FNW2pvFpd/feaSgg2xaBsbVxDLJaagCe1CX64uKoW6uCDb8NLp7fX027M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713192016; c=relaxed/simple;
	bh=E13I5opHBC4BhEhgP3nJZYFyjzrOIj4bCPFhACOhxLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+E/Z6xNDukqdOY5gcm45FbgfVU/9Tx1Vy3iI777FAsuoSdkoItZxjZGK0jU/l9BVEjEdURe9iN3r/BulIAQuyAFRNbRmHg7jVur+tXjPWywQytbsBXmNCF8WFxb3Bspr5djGIRUS8oz3yxx1HpZJ4sG4j4lRD/++rXaT6syEiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: yayGg99SSIqeS13XtMHJdA==
X-CSE-MsgGUID: uTWXof84T0WmMwid9DX4yQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="12364889"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="12364889"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 07:40:14 -0700
X-CSE-ConnectionGUID: aOAdTzyWT2+SGTKj3XFpBA==
X-CSE-MsgGUID: 3lber1/8S8SOb/ky1XkACA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="26498184"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 07:40:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rwNVB-00000004R0a-0Q00;
	Mon, 15 Apr 2024 17:40:09 +0300
Date: Mon, 15 Apr 2024 17:40:08 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 11/23] media: atomisp: Remove test pattern generator
 (TPG) support
Message-ID: <Zh08SP60QytSz3aQ@smile.fi.intel.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
 <20240415120220.219480-12-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415120220.219480-12-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 15, 2024 at 02:02:08PM +0200, Hans de Goede wrote:
> The TPG support registers a v4l2-subdev for this, but this is not part of
> the media-controller graph in any way. After manually selecting the TPG
> as input using the s_input ioctl it does not work.
> 
> Several supported sensors have their own working TPG and using the sensor's
> TPG means that the same data-flow is used as with actual sensors rather
> then the quite different data-flow from the ISP's builtin TPG.
> 
> Remove the broken TPG support, when a test-pattern is needed for testing
> a sensor's TPG can be used. Using a sensor's TPG is actually better for
> testing since then the actual normal data-flow is being tested.

...

> +	if (mipi_info)
> +		fc = atomisp_find_in_fmt_conv_by_atomisp_in_fmt(mipi_info->input_format);
>  
> +	if (!fc)
> +		fc = atomisp_find_in_fmt_conv(
> +			 atomisp_subdev_get_ffmt(&asd->subdev,
> +						 NULL, V4L2_SUBDEV_FORMAT_ACTIVE,
> +						 ATOMISP_SUBDEV_PAD_SINK)->code);

While it was in the original code, this is ugly. Can we split this to two
assignments?

> +	if (!fc)
> +		return -EINVAL;
> +	if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&

> +	    raw_output_format_match_input(fc->atomisp_in_fmt,
> +					  pix->pixelformat))

Now a single line?

> +		return -EINVAL;

...

>  		unsigned int hblank_cycles = 100,
>  		vblank_lines = 6,
>  		width,

Urgh... These comma operators probably is subject to replace with separate
definitions or being grouped on a single line (as it suppose to be in this
case).

-- 
With Best Regards,
Andy Shevchenko



