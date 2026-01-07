Return-Path: <linux-media+bounces-50174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4802AD0032B
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 22:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08D2730734CA
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 21:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FF23358C2;
	Wed,  7 Jan 2026 21:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lr8Ogtu/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6327A23D7F5;
	Wed,  7 Jan 2026 21:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767821782; cv=none; b=tS6iYoiI5XI7m83471k86FvVBsexYeYWYNa9SP3tUxhYXSbg7o0dH3w21Y/wVwIYTg/vfUX4WkOAcsgbuopfhCSnERTjhJfYpPM50AZWxyU06YYu1qK/zZc4xUdSjIQLmz1vGYJ/aP0+thdd6C/UWUsLpE+TxMATryu3NZQIays=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767821782; c=relaxed/simple;
	bh=Jv1QUG25wuai81VCP0AUr8gPDustG1rrgp1TER68Iok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ofe3aPYWiDrdf6NuNs9lu7mq4sv8L74NMKxKFIAv9pvhEscwUro8OFN8lqcP3OgkHc6I2vJI1AOsH+H/UnIdebg9C2naN1z3yeFd4+bvpb1cnxr4Skv1mZrYdIziHz16GWcuARQ+ScpH0krZaQ36UMrmF6LByOdW08YGTNTz6HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lr8Ogtu/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767821780; x=1799357780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jv1QUG25wuai81VCP0AUr8gPDustG1rrgp1TER68Iok=;
  b=Lr8Ogtu/qVbqFt5dZgJJe4YyF4Khy6M4T8bEax4zkdIzvUn1TtidAyJr
   xun+YzV6DHIMOofwCHHhNuqbzy+9x+pAlHq4FvAgsby8RJmV4w83IV9Ip
   8mvxRFIW6mz2MtX1WBDn8GY3LeGWlj4wgs7pFIrTVOval05aBPM//NJH3
   IX6ufj2XvtBy/48ePPUunvbgEUzPIiEwyMaAn/ItlF8aEPBbM4AbPuaLI
   irugGkM4GlENeuFORn4ygEsPxyrec6c62w5OQiYFIdrW9VL8VaNZu1Uml
   TD+4voaIFGDhIoDkkF8slaIWTPEED/iyCQumqv2sW2p5mYH0oMaR11rwS
   Q==;
X-CSE-ConnectionGUID: NXQ9MyaaSRWzIkbxeKUiHg==
X-CSE-MsgGUID: 67so7DLOTZCpnuaXH+D1LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="73054489"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="73054489"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 13:36:19 -0800
X-CSE-ConnectionGUID: tJRiHJN9RF6ZGDNPHDsqnA==
X-CSE-MsgGUID: r+OdD+waT6aDR9PDgOay6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="202153770"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.174])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 13:36:18 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3AB9C1203D1;
	Wed, 07 Jan 2026 23:36:31 +0200 (EET)
Date: Wed, 7 Jan 2026 23:36:31 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Sebastian Reichel <sre@kernel.org>, linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/5] media: ov02c10: Adjust x-win/y-win when changing
 flipping to preserve bayer-pattern
Message-ID: <aV7R30bSVxXRxCok@kekkonen.localdomain>
References: <20251210112436.167212-1-johannes.goede@oss.qualcomm.com>
 <20251210112436.167212-3-johannes.goede@oss.qualcomm.com>
 <aV5IH7PIFnySHhYC@kekkonen.localdomain>
 <082db370-e6cb-45fd-aaf9-bcd9f80dc242@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <082db370-e6cb-45fd-aaf9-bcd9f80dc242@oss.qualcomm.com>

Hi Hans,

On Wed, Jan 07, 2026 at 02:45:18PM +0100, Hans de Goede wrote:
> Hi Sakari,
> 
> On 7-Jan-26 12:48, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Wed, Dec 10, 2025 at 12:24:33PM +0100, Hans de Goede wrote:
> >> The ov02c10 is capable of having its (crop) window shifted around with 1
> >> pixel precision while streaming.
> >>
> >> This allows changing the x/y window coordinates when changing flipping to
> >> preserve the bayer-pattern.
> > 
> > Ideally we'd use the crop selection to configure this, but given these
> > sensors (and drivers) are generally what they are, I guess this is probably
> > a reasonable way to go.
> 
> Even in sensor drivers where we allow setting the crop selection
> to get arbritrary modes, we always round the coordinates to a multiple
> of 2, to avoid changing the bayer-pattern seen by userspace when
> userspace changes the crop. See e.g. ov2680_set_selection().
> 
> And then when doing flipping we might add 1 to either the x and/or y
> coordinate to the userspace provided crop x, y before sending it to
> the sensor to make flipping not change the bayer order, see e.g.
> ov01a10_set_hflip() after the v2 series you've here:
> 
> https://git.retiisi.eu/?p=~sailus/linux.git;a=shortlog;h=refs/heads/ov01a10
> 
> which does (simplified):
> 
>         offset = crop->left;
>         if (hflip)
>                 offset++;
> 
>         cci_write(ov01a10->regmap, OV01A10_REG_X_WIN, offset, &ret);
> 
> IOW we are trying to not make userspace be able to affect the bayer-pattern
> through setting the crop-selection and/or flip.
> 
> So I'm not sure what you mean with "Ideally we'd use the crop selection"
> because we are actively trying to avoid to have the crop-selection change
> the bayer order ?
> 
> Generally speaking I think we should avoid any settings change the bayer-order
> whenever possible.

That's up to the userspace. The UAPI allows to do either so why should the
driver decide?

As noted, in this case providing that flexibility probably causes more
hassle than any benefits, so I guess this is fine.

-- 
Kind regards,

Sakari Ailus

