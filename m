Return-Path: <linux-media+bounces-11336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA458C27E6
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 17:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DEAE1F21FEE
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 15:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B15171648;
	Fri, 10 May 2024 15:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FcOHoUCA"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49361E502;
	Fri, 10 May 2024 15:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715355221; cv=none; b=QPwcPcQxgnaEeszrOIwHDXxnUvtXxdvpY19bz0Um0U6A2B6c8dt8r4v+RtoSTaNxIKmMU9Yn/u0l7SYwTIMhXA9Xz8qWHEDLngjjCHFB5B3rrUwSd3hiJnu1YHxEwhGiHLY9DxxAT2Y8GMm9HZwf0A2/EemxBKDLi3188OUE0m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715355221; c=relaxed/simple;
	bh=FyxosxiDRe7kVFCrtSH8YTzfIKGevBBbWmNlhONBN+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YsnWjpG6oAtzeRjVQpSYXW5DgUGTDf5+r986oJG05TCfrdhbly78qYnMsbLMkWJOfU6PfkAee7Cf3sNF1CiGyYfYmVc1hx8oeLcNogtuVVeJ6RALEQQGQyowcw18He1ppuaY7BBwsg4Hl6O1n+agscX/5CEEGheJ/hNHuGO5YXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FcOHoUCA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715355220; x=1746891220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FyxosxiDRe7kVFCrtSH8YTzfIKGevBBbWmNlhONBN+4=;
  b=FcOHoUCA3bNdNmI7gslYF1hKweA0i3tcyoyRzW+4qADsvDpXuqaNYFvj
   tVNAT1w4hjpytKu+ruajkAxjBR+zgTQ1LzvPQFmEEyJnKZXpqBl22Sm4U
   jvF/mhfHMIagzpPA4apwfJzmnnAKULSxLUtCx87Pg57t0j1uhKSVRJnGQ
   zvBPzWhyOCcH4IDE9038G8vLdJwtW3MdVGrDsCXVLAJ1unsK19P0SqpaN
   wzBJdpRYlchJb3tEdl8Ym5dNRoWGyjsZXhCCgYBDN0XeHx52Iu+SshGBm
   wol+kEouprza9BRaYwfFAlk+qAf7x7gFPK6QCR0wbDFhbNlCyAWuQ6dkB
   A==;
X-CSE-ConnectionGUID: YAZIw3trSb2wRJ72spQlbA==
X-CSE-MsgGUID: 2/a8OrCtQlekDlSiY9/reA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11473311"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="11473311"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:33:39 -0700
X-CSE-ConnectionGUID: 89FEUiuBR0m5PfFMMwgE1w==
X-CSE-MsgGUID: GBexyAV4TMKoXywh+6+7qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="34090819"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:33:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s5SFV-000000069Cb-2rTA;
	Fri, 10 May 2024 18:33:29 +0300
Date: Fri, 10 May 2024 18:33:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
	sebastian.fricke@collabora.com, p.zabel@pengutronix.de,
	airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
	j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
	p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
	nicolas@ndufresne.ca, akpm@linux-foundation.org,
	gregkh@linuxfoundation.org, adobriyan@gmail.com,
	jani.nikula@intel.com
Subject: Re: [PATCH v7 8/8] gpu: ipu-v3: Use generic macro for rounding to
 nearest multiple
Message-ID: <Zj4-SfdNjRHxpHhe@smile.fi.intel.com>
References: <20240509184010.4065359-1-devarsht@ti.com>
 <Zj43WDlT1aFpgdVv@smile.fi.intel.com>
 <20240510151642.GA17158@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510151642.GA17158@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 10, 2024 at 06:16:42PM +0300, Laurent Pinchart wrote:
> On Fri, May 10, 2024 at 06:03:52PM +0300, Andy Shevchenko wrote:
> > On Fri, May 10, 2024 at 12:10:10AM +0530, Devarsh Thakkar wrote:
> > > Use generic macro round_closest_up for rounding to nearest multiple instead
> > 
> > round_closest_up()
> > 
> > We refer to the functions as func().
> > 
> > > of using local function.

...

> > > @@ -565,7 +563,7 @@ static void find_best_seam(struct ipu_image_convert_ctx *ctx,
> > >  		 * The closest input sample position that we could actually
> > >  		 * start the input tile at, 19.13 fixed point.
> > >  		 */
> > > -		in_pos_aligned = round_closest(in_pos, 8192U * in_align);
> > > +		in_pos_aligned = round_closest_up(in_pos, 8192U * in_align);
> > >  		/* Convert 19.13 fixed point to integer */
> > >  		in_pos_rounded = in_pos_aligned / 8192U;
> > 
> > Oh, these seems to be better to use either ALIGN*(), or PFN_*() / PAGE_*()
> > families of macros. What the semantic of 8192 is?
> 
> The comment mentions 19.13 fixed point, so I assume that's the
> fractional part of the integer. It doesn't seem related to pages.

Okay, and align word in all those variable names?

-- 
With Best Regards,
Andy Shevchenko



