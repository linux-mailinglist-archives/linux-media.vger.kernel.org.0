Return-Path: <linux-media+bounces-21148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A08929C1C29
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 12:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 576671F2369D
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 11:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F2F1E47A2;
	Fri,  8 Nov 2024 11:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QRpr0lsr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AF43FB9C;
	Fri,  8 Nov 2024 11:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731065252; cv=none; b=EkbZuT+/fGabZ9ubTz1tV7g2NZPWMHaUgG7Pbv0TEto7LTJ2T19B4ABTXSuPp1PsCjuF2zd97K7ocVHTwsUQFPqxaTWU1U1ce/Lyamu6NSRVBz9Ayu12HwAgqetDPc1HOPAIZ6ag5bYBOqHSWa/hodvIJCzWeBtu5EF2xS2errg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731065252; c=relaxed/simple;
	bh=+Y8n3sA9Jhc9zRQUo6RJdVOlNQf2f7wmcudyhHL7AkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XTwiN9PXNNHVVDsEVPgjfXT/r3T++UT1R2kOQjwLYmAo5MffgYJGbm+dRQQobmBC5R8WBFthbnMOv4WHYT6luM0Lw77jAXgi1Bg4qHoNc4mnWk78zNfThaCbkKaBG8fF4HWSv88pGtWnuOSGT+rBFSlv1p2OUm8xrOih7kLe94U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QRpr0lsr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731065251; x=1762601251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+Y8n3sA9Jhc9zRQUo6RJdVOlNQf2f7wmcudyhHL7AkE=;
  b=QRpr0lsrQ6+pIYfxXpAVY71fbUxh87Zaz2QqR95bw74OELW1HBXtmWFf
   ErPYhmtKCpczSDX63HqKboBaY1qbdOA4u9Fb84b1fd5sL8Oxh/QXvRN9P
   kfWG8qbwOphIsnOW+IApWGvQC5DHEy14DNLVi7T4N1nKSc5rCRKVKZ9co
   JOyBWtJrJ7PMS+mLyti9En2LIgBXWudNIGt/A1sJyxlWZ/hbLmnp8TuwK
   HhaQyvfwCZvJiVktcRIS6s4bKA1wpfj3mQIwYXGy2JZGgDW2fpqPVkYDG
   zQ2YErrVkDqYM1tBtGB/wRHNrZF3KhhDk70UTZMHnw+bDn9BpRSPzb2me
   g==;
X-CSE-ConnectionGUID: +oA6xIPeTq6ywX0jI//d8g==
X-CSE-MsgGUID: 1ukobdFoSKCESpFm8Ds9Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="42330879"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="42330879"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 03:27:30 -0800
X-CSE-ConnectionGUID: lu/HUFMjSpq6MJ0fZ+vO0Q==
X-CSE-MsgGUID: V3lw4rU4RYefbZBYhtNTxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="86325548"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 03:27:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t9N9B-0000000Cai1-3B56;
	Fri, 08 Nov 2024 13:27:25 +0200
Date: Fri, 8 Nov 2024 13:27:25 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH 12/13] media: i2c: ds90ub913: Add error handling to
 ub913_hw_init()
Message-ID: <Zy31nf_B-O_UTXSo@smile.fi.intel.com>
References: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
 <20241004-ub9xx-fixes-v1-12-e30a4633c786@ideasonboard.com>
 <Zwfe7V_rV3Xyxp31@smile.fi.intel.com>
 <f1cc3479-6c2e-40dd-8b78-671138f31d9d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1cc3479-6c2e-40dd-8b78-671138f31d9d@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 08, 2024 at 11:34:09AM +0200, Tomi Valkeinen wrote:
> On 10/10/2024 17:04, Andy Shevchenko wrote:
> > On Fri, Oct 04, 2024 at 05:46:43PM +0300, Tomi Valkeinen wrote:
> > > Add error handling to ub913_hw_init() using a new helper function,
> > > ub913_update_bits().

...

> > > +	ret = ub913_update_bits(priv, UB913_REG_GENERAL_CFG,
> > > +				UB913_REG_GENERAL_CFG_PCLK_RISING,
> > > +				priv->pclk_polarity_rising ?
> > > +					UB913_REG_GENERAL_CFG_PCLK_RISING :
> > > +					0);
> > 
> > So, you can use regmap_set_bits() / regmap_clear_bits() instead of this
> > ternary. It also gives one parameter less to the regmap calls.
> 
> True... But is it better?

In my opinion yes, because it's clearer on what's going on.
It has no (semi-)hidden choice, so code wise it most likely
will be the same at the end. So we are speaking only about
C-level of readability.

> if (priv->pclk_polarity_rising)
> 	ret = regmap_set_bits(priv->regmap, UB913_REG_GENERAL_CFG,
> 			      UB913_REG_GENERAL_CFG_PCLK_RISING);
> else
> 	ret = regmap_clear_bits(priv->regmap, UB913_REG_GENERAL_CFG,
> 				UB913_REG_GENERAL_CFG_PCLK_RISING);
> 
> The call itself is more readable there, but then again, as we're setting the
> value of a bit, I dislike having if/else with two calls for a single
> assignment.

FTR, there was an attempt to add _assign() in similar way how it's done with
bitops (set/clear/assign) to regmap, but had been rejected by Mark. I don't
remember detail why, though.

> Using FIELD_PREP is perhaps a bit better than the ternary:
> 
> ret = ub913_update_bits(priv, UB913_REG_GENERAL_CFG,
> 			UB913_REG_GENERAL_CFG_PCLK_RISING,
> 			FIELD_PREP(UB913_REG_GENERAL_CFG_PCLK_RISING,
> 				   priv->pclk_polarity_rising));
> 
> I think I'd like best a function to set/clear a bitmask with a boolean:
> 
> ret = regmap_toggle_bits(priv->regmap, UB913_REG_GENERAL_CFG,
> 			 UB913_REG_GENERAL_CFG_PCLK_RISING,
> 			 priv->pclk_polarity_rising);
> 
> For now, I think I'll go with the FIELD_PREP() version. It's perhaps a bit
> better than the ternary.

Okay.

-- 
With Best Regards,
Andy Shevchenko



