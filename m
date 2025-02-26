Return-Path: <linux-media+bounces-27003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E6DA45918
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 09:56:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8374F7A6A51
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 08:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCB6224228;
	Wed, 26 Feb 2025 08:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBIZtqHB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97925258CC2;
	Wed, 26 Feb 2025 08:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740560173; cv=none; b=Zn5A4cbFxKyGkCCknCJvQWo8zrMQxvoU+S71tcoJw8Dwm/N+JpzNDYDcCLDNvIJaN7heUhnQcy6ieWFvvlmxgRddhrDqlEa0TBLTIcDqgvQRxCI6FCnkTAZIXsNzb5GZTHGkpPxhlyLaMVRPnC2loLojucSLioqMK1/QcqZ8/BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740560173; c=relaxed/simple;
	bh=WCNt74G5tme6q4CCVSYBGU4ec6i7pLkmF1w4VJWLFxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PD9mr3kO58Cg+l7lRaMgmSRZQ4mtvCS/bRRyd5GH3x2n0xTEubMlTQvhul8j6ziW5HhDVI8Fz0/Qb0U2lH2DDRe36yALS73PoCepnRoeTngMvhqAZkulqSLJW5GopGdoLMS2xNAUIT56P8GkD7wAoQVsJaj12Gmt7HTEdpBPHrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LBIZtqHB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740560172; x=1772096172;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WCNt74G5tme6q4CCVSYBGU4ec6i7pLkmF1w4VJWLFxY=;
  b=LBIZtqHBVWNFOX0+fOstdPZemOTOlEw08Pl8o7vG8OflZzA+3YFLsGrV
   cS6q7+Dci5T3znuI5Gdhjl82axGBRyZQYp4Em0VhTyNUN0CKhLLHpTxCj
   0N6qHgfYmm3aPiJcLfOwidjXdEoeyCDWRQXxij00F/3IzQRiOZ4FRqUVq
   3ljttZBZ2QvnqPjEwwwvys87pNSJ5TBM5F2deNe6PfOX9r5i7A+caHNLq
   yBUXwya2zv3DuKeqSX7Y9VYb6INzt5ZaYf1OfVjH1cSzbKRFNjWXiHD0+
   OgHeu2J5pM2PMiku0nDczK5S6+sf7qzjnihddPUJQ0bNZjFFKI/ee0BvN
   w==;
X-CSE-ConnectionGUID: SdUSS2pVTpWXLt+JWrsPOw==
X-CSE-MsgGUID: KYycK975SGq6uFd/OJKcww==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="52790470"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="52790470"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 00:56:12 -0800
X-CSE-ConnectionGUID: rVYk4NRYQHqBfNStj6ZYTg==
X-CSE-MsgGUID: PmTaVXcvRIeRH2eefjNBKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="121577306"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 00:56:10 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B0F5C11F944;
	Wed, 26 Feb 2025 10:56:06 +0200 (EET)
Date: Wed, 26 Feb 2025 08:56:06 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: linux-media@vger.kernel.org, kieran.bingham@ideasonboard.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: imx335: Set vblank immediately
Message-ID: <Z77XJrRoqZWTLF4g@kekkonen.localdomain>
References: <20250214133709.1290585-1-paul.elder@ideasonboard.com>
 <Z7G3d_zEhqDuepNM@kekkonen.localdomain>
 <Z77Vg7zcnj_5a-0s@pyrite.rasen.tech>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z77Vg7zcnj_5a-0s@pyrite.rasen.tech>

Hi Paul,

On Wed, Feb 26, 2025 at 05:49:07PM +0900, Paul Elder wrote:
> Hi Sakari,
> 
> Thanks for the review.
> 
> On Sun, Feb 16, 2025 at 10:01:27AM +0000, Sakari Ailus wrote:
> > Hi Paul,
> > 
> > On Fri, Feb 14, 2025 at 10:37:09PM +0900, Paul Elder wrote:
> > > When the vblank v4l2 control is set, it does not get written to the
> > > hardware immediately. It only gets updated when exposure is set. Change
> > > the behavior such that the vblank is written immediately when the
> > > control is set.
> > > 
> > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > ---
> > >  drivers/media/i2c/imx335.c | 19 +++++++++++++------
> > >  1 file changed, 13 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> > > index fcfd1d851bd4..e73a23bbbc89 100644
> > > --- a/drivers/media/i2c/imx335.c
> > > +++ b/drivers/media/i2c/imx335.c
> > > @@ -559,12 +559,12 @@ static int imx335_set_ctrl(struct v4l2_ctrl *ctrl)
> > >  			imx335->vblank,
> > >  			imx335->vblank + imx335->cur_mode->height);
> > >  
> > > -		return __v4l2_ctrl_modify_range(imx335->exp_ctrl,
> > > -						IMX335_EXPOSURE_MIN,
> > > -						imx335->vblank +
> > > -						imx335->cur_mode->height -
> > > -						IMX335_EXPOSURE_OFFSET,
> > > -						1, IMX335_EXPOSURE_DEFAULT);
> > > +		 __v4l2_ctrl_modify_range(imx335->exp_ctrl,
> > 
> > Indentation.
> > 
> > You're also missing an error check here.
> 
> I reasoned that it's fine to not have the error check.
> 
> afaiu, the only change this has to error is if try/s_ctrl on
> V4L2_CID_EXPOSURE fails when the change to the range of valid exposure
> values requires a new exposure value to be set. Setting the exposure
> control comes back to this function, and goes through the switch-case
> and imx335_update_exp_gain() below, which doesn't fail.

It will fail if cci_write() it calls does.

> 
> Also the imx219 has the exact same pattern in imx219_set_ctrl.

Feel free to fix it. :-)

-- 
Kind regards,

Sakari Ailus

