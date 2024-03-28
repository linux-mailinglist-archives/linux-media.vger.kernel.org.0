Return-Path: <linux-media+bounces-8147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1212F890CE9
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 23:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 443631C2D6F2
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 22:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A850113B292;
	Thu, 28 Mar 2024 22:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djT2IR/Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778E112F5A4
	for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 22:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711663554; cv=none; b=poIlNyf119JBAuZmg2L+NFgFx5jZlp7wemqfMXdbjw2HyvMsAHEWVz5gSt+h3lVWu5b+uFuAUpPGrMP4yn6nikWQOMlNGj1EiDyAu3G3QS930/5pOWqNCKmNuJ8BLRnUbBx0abr32J+Oe9F1iYXYzmuh0WtyEKafP8I66WXs6ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711663554; c=relaxed/simple;
	bh=8GaS1CsSMGinUL/2d+7XFRWTnR9+itOpzv3YYoUjLFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EX0D9LAM6SPBEkrBdhvhrkLODn2ye+V044wV63Ti+AllEWiTFOX41gfmFhmNTQhO8j6WawTlBW/WXe7fkd4dVhtVrKHp7RM2ykGbqh/XxTpthUPGJP3nMh1tVSPT8m8LZMwOcmApQYd3ia6NRqSQo24LewsjNIn+gHE1oNdz5+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djT2IR/Z; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711663552; x=1743199552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8GaS1CsSMGinUL/2d+7XFRWTnR9+itOpzv3YYoUjLFo=;
  b=djT2IR/Zne8aYyuAxKqjSusuOc8BKdd2a+2FjiRx0Bx5rpHR+jyse6jV
   CwJ199Fs/XpoRKPlujGJqJwT+BF5f2MRX6keRYjXNBFBtPf1H5cfw+sGj
   MIL4KvgqqrKXHzLvB7PHHR3pFrh/CFZok7BdpExzR73kMo5RLisTTChvi
   oe1g+jM/Wq7miY5lj1h8tSt3Nt9Xy3OkOOUgppRiVCCvWT00+STv0mmJy
   Fcg6L0b+BY/8le78Ph991tu3p/KH7tLfSVb7nPxadMD9qdbXYPqohAbsf
   68YLU5GTPYDul3xO7deb9aLvG/po7tt6vf6wqCEdjtMEX2lRY8YgWHUXq
   A==;
X-CSE-ConnectionGUID: lqhnFtgrSlSIpsJt5PERnw==
X-CSE-MsgGUID: HBbchj3SSV6iVQBEiMdEVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6962058"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6962058"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 15:05:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="21458996"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 15:05:50 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F114411F8EA;
	Fri, 29 Mar 2024 00:05:47 +0200 (EET)
Date: Thu, 28 Mar 2024 22:05:47 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Fabio Estevam <festevam@gmail.com>, rmfrfs@gmail.com, hansg@kernel.org,
	linux-media@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/2] media: ov2680: Allow probing if link-frequencies is
 absent
Message-ID: <ZgXpu9JKn_tNIHwO@kekkonen.localdomain>
References: <20240328051320.2428125-1-festevam@gmail.com>
 <ZgUiP2WnaAWnJ207@kekkonen.localdomain>
 <ZgXnZKhhOdpD4beP@kekkonen.localdomain>
 <ZgXn2u4x6mLWMImc@kekkonen.localdomain>
 <20240328220403.GG11463@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328220403.GG11463@pendragon.ideasonboard.com>

On Fri, Mar 29, 2024 at 12:04:03AM +0200, Laurent Pinchart wrote:
> On Thu, Mar 28, 2024 at 09:57:46PM +0000, Sakari Ailus wrote:
> > On Thu, Mar 28, 2024 at 09:55:48PM +0000, Sakari Ailus wrote:
> > > On Thu, Mar 28, 2024 at 07:54:41AM +0000, Sakari Ailus wrote:
> > > > Hi Fabio,
> > > > 
> > > > On Thu, Mar 28, 2024 at 02:13:19AM -0300, Fabio Estevam wrote:
> > > > > From: Fabio Estevam <festevam@denx.de>
> > > > > 
> > > > > Since commit 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint
> > > > > property verification") the ov2680 no longer probes on a imx7s-warp7:
> > > > > 
> > > > > ov2680 1-0036: error -EINVAL: supported link freq 330000000 not found
> > > > > ov2680 1-0036: probe with driver ov2680 failed with error -2
> > > > > 
> > > > > As the 'link-frequencies' property is not mandatory, allow the probe
> > > > > to succeed by skipping the link-frequency verification when the
> > > > > property is absent.
> > > > > 
> > > > > Fixes: 63b0cd30b78e ("media: ov2680: Add bus-cfg / endpoint property verification")
> > > > > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > > > > ---
> > > > >  drivers/media/i2c/ov2680.c | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> > > > > index 39d321e2b7f9..f611ce3a749c 100644
> > > > > --- a/drivers/media/i2c/ov2680.c
> > > > > +++ b/drivers/media/i2c/ov2680.c
> > > > > @@ -1123,6 +1123,9 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
> > > > >  		goto out_free_bus_cfg;
> > > > >  	}
> > > > >  
> > > > > +	if (!bus_cfg.nr_of_link_frequencies)
> > > > > +		return 0;
> > > > > +
> > > > 
> > > > Thanks for the patch.
> > > > 
> > > > I'd still rather try to avoid going to this direction as these frequencies
> > > > are hardware dependent. Add a new one to the driver and some boards may
> > > > stop working properly. For details see
> > > > <URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html#handling-clocks>.
> > > 
> > > While the above holds, on second thought, the driver has been around for
> > > quite some time and indeed the added validation does break certain boards
> > > (at least without adding the link frequencies there).
> > > 
> > > So I'm fine with the patch.
> > > 
> > > I think this should also be cc'd to stable.
> > 
> > And this applies to the newer version of the patch that fixes the memory
> > leak, of course.
> 
> Should we add least log a warning when link frequencies are not present
> in DT ?

Sounds reasonable.

> 
> > > > >  	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
> > > > >  		if (bus_cfg.link_frequencies[i] == sensor->link_freq[0])
> > > > >  			break;

-- 
Sakari Ailus

