Return-Path: <linux-media+bounces-50229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AB37CD02E51
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 14:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C675430EB692
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 12:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68D944B683;
	Thu,  8 Jan 2026 12:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mjb/dMyk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0599F43E9CC;
	Thu,  8 Jan 2026 12:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767874718; cv=none; b=tnp1YZVA/oHIuGB4TPRWt3DysPVF3qdOGAl2XCiKFYU5HSl8tXOQvX8CVffPXWLbsPk4ro8OXPT9iAzpQEiRuLEXu8/vrbWTOoI0/BarugNyqCyI73URqtxuxK4Wr7IV13liRwC+YHIOHjjoIG1uv9z13nU9b70OPU4DwQrc2hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767874718; c=relaxed/simple;
	bh=BhDIqv5aHXpqeQr55/QjCCZ17IKzkEFSbgL2vEw2bqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmVrO2PxY4rNK6qmASHVEdCTgc7OV6JdGZvj3MVkbS0RL7HqHE4FJRu1954RAvzDQqNB5X1JHLVUCF1l90eDYwlWgODSPrsqm+P0ifOb8X1Z8O86cDIJkByM88Nc0v1dISL+bCaXuwyGLeaq1hHffioJpKRyDK078PiuXBQx93s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mjb/dMyk; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767874716; x=1799410716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BhDIqv5aHXpqeQr55/QjCCZ17IKzkEFSbgL2vEw2bqk=;
  b=Mjb/dMykfcRX9adifWjtiC2oDLyj6hAMuN5bsxADScInQ0H56Sa2HA4G
   5xx8j4f7FRTKoZiA5l0hDj3RcrtV2S4XYnmwCPiIA/Mb9PSDIoNYm+WpL
   KciZPrGXn0BeU75fZWmmry8WsdQn22TxUii0adeofIK4O/dlitFl8Nc82
   1M4Gzxo8fLAK3r7bAmHSTBfwV6IwaDmIzOEZ/tMZi02SjePocjLC18IFO
   HnQEYDDie5mkeweZXfQwPHMg3Qm1qxJWLCZMOSBBWGr2mvhnuMKzsMhLZ
   2TuHtzwE9D+n93QZyrO2srU4iu3aRGzLIUlAN5BMLdS+9ZuXoa+/Rku6B
   A==;
X-CSE-ConnectionGUID: Lhry2anwQtiHRCAYh7K/kA==
X-CSE-MsgGUID: 9jLRierBRZK7NPGLXEa/SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69411186"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="69411186"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 04:18:35 -0800
X-CSE-ConnectionGUID: v4QeXbkzTgyYryjNUgAqzw==
X-CSE-MsgGUID: 8jRKzGRXRa6oTiERmuKzug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="202973184"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.211])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 04:18:34 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5A5F311F72F;
	Thu, 08 Jan 2026 14:18:45 +0200 (EET)
Date: Thu, 8 Jan 2026 14:18:45 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Sebastian Reichel <sre@kernel.org>, linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/5] media: ov02c10: Adjust x-win/y-win when changing
 flipping to preserve bayer-pattern
Message-ID: <aV-gpYg4NqniNP5_@kekkonen.localdomain>
References: <20251210112436.167212-1-johannes.goede@oss.qualcomm.com>
 <20251210112436.167212-3-johannes.goede@oss.qualcomm.com>
 <aV5IH7PIFnySHhYC@kekkonen.localdomain>
 <082db370-e6cb-45fd-aaf9-bcd9f80dc242@oss.qualcomm.com>
 <aV7R30bSVxXRxCok@kekkonen.localdomain>
 <4f42d0e4-6595-4838-bfc2-e690eb9e046f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f42d0e4-6595-4838-bfc2-e690eb9e046f@oss.qualcomm.com>

Hi Hans,

On Thu, Jan 08, 2026 at 09:38:16AM +0100, Hans de Goede wrote:
> Hi,
> 
> On 7-Jan-26 22:36, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Wed, Jan 07, 2026 at 02:45:18PM +0100, Hans de Goede wrote:
> >> Hi Sakari,
> >>
> >> On 7-Jan-26 12:48, Sakari Ailus wrote:
> >>> Hi Hans,
> >>>
> >>> On Wed, Dec 10, 2025 at 12:24:33PM +0100, Hans de Goede wrote:
> >>>> The ov02c10 is capable of having its (crop) window shifted around with 1
> >>>> pixel precision while streaming.
> >>>>
> >>>> This allows changing the x/y window coordinates when changing flipping to
> >>>> preserve the bayer-pattern.
> >>>
> >>> Ideally we'd use the crop selection to configure this, but given these
> >>> sensors (and drivers) are generally what they are, I guess this is probably
> >>> a reasonable way to go.
> >>
> >> Even in sensor drivers where we allow setting the crop selection
> >> to get arbritrary modes, we always round the coordinates to a multiple
> >> of 2, to avoid changing the bayer-pattern seen by userspace when
> >> userspace changes the crop. See e.g. ov2680_set_selection().
> >>
> >> And then when doing flipping we might add 1 to either the x and/or y
> >> coordinate to the userspace provided crop x, y before sending it to
> >> the sensor to make flipping not change the bayer order, see e.g.
> >> ov01a10_set_hflip() after the v2 series you've here:
> >>
> >> https://git.retiisi.eu/?p=~sailus/linux.git;a=shortlog;h=refs/heads/ov01a10
> >>
> >> which does (simplified):
> >>
> >>         offset = crop->left;
> >>         if (hflip)
> >>                 offset++;
> >>
> >>         cci_write(ov01a10->regmap, OV01A10_REG_X_WIN, offset, &ret);
> >>
> >> IOW we are trying to not make userspace be able to affect the bayer-pattern
> >> through setting the crop-selection and/or flip.
> >>
> >> So I'm not sure what you mean with "Ideally we'd use the crop selection"
> >> because we are actively trying to avoid to have the crop-selection change
> >> the bayer order ?
> >>
> >> Generally speaking I think we should avoid any settings change the bayer-order
> >> whenever possible.
> > 
> > That's up to the userspace. The UAPI allows to do either so why should the
> > driver decide?
> > 
> > As noted, in this case providing that flexibility probably causes more
> > hassle than any benefits, so I guess this is fine.
> 
> If we allow setting the crop selection with a 1 pixel precision drivers
> need some equivalent of V4L2_CTRL_FLAG_MODIFY_LAYOUT for userspace, so IMHO
> the UAPI does not allow this at the moment.

I'm not quite sure why you'd say that. The user space needs to be (and is)
aware of the colour filter array pattern in use.

> 
> Also drivers would get extra complicated by needing to figure out which
> bayer order to report as being active based on the crop selection.

This isn't really different from the effects of flipping in general and
will change with the generic raw formats in any case.

> 
> I really so no use-case where we need the single precision crop selection.
> 
> So when you say "in this case providing that flexibility probably causes more
> hassle than any benefits" I believe that statement applies more general then
> just in this case.

I have to disagree with that in a general case. This is exactly the kind of
design that has lead us into trouble when it has been applied, especially
when it comes to UAPI.

-- 
Regards,

Sakari Ailus

