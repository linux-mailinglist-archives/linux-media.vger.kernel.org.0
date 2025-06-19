Return-Path: <linux-media+bounces-35353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3AFAE08BC
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 16:29:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63742188B8E0
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08F121E0AD;
	Thu, 19 Jun 2025 14:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aPBPRHEU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879AD1AF0B5
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 14:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343335; cv=none; b=m8IuKdgNabx3ZarH27ncRS+CeiSvFlVX9O6u6ifSufFk3Hb5hlyZSO0V5Av39Wsyfs0tekHIu/aWidrwyaz3zBakpjY1+0+eRv/ao0tezCRTJDixysOr7zZwUI6k4LMFmFWQwsXTnX0lWXvdbepKqdRLjwiJGjP/TJGnW8duvdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343335; c=relaxed/simple;
	bh=TI6ZOWYg2li7FWmO7X36g3/wtBogxXLsJtO+qM/DGFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5mELdMEFZVbFQgfaDj+Ez8aJcrqMp7NqAC0B9YVnSRmFeTljsXCsFQQjATohoqDI9LVmXautmkULtopeqYhM45CoUrE0b/3acvZZ5jQqAZmK5Ah1pMXva28oxh8Vf+o73XJLcvzPzca4YKl4/07DOlm9KiO9GsbWl4ocs/If+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aPBPRHEU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750343334; x=1781879334;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TI6ZOWYg2li7FWmO7X36g3/wtBogxXLsJtO+qM/DGFY=;
  b=aPBPRHEUGQVqmz+C0h/TyXsu1kJowgVH8mDhLhGU19I84yReZZyFHr8E
   9XJmxK0At9qYn+YSeDrSn7g+NthVS6j8NjGeDcewazIC2w/jdX/01lgzT
   7jUqHyIkllNeKv1MyB/zCjKDEViU5nPF/xcylg5+L2XEQUJWcJbHYK73W
   k50ni/+bqManb20Q9f/peGE4QSzIFLYFB6o0ptJf99Q2g9bHJyjFtpyhN
   IXMOpzlrE50DVdA7u2zXPqxcQa+QzIqI3wk+CYgQfCoHWDgMSKkxWFaJZ
   Ndr3Hm4H7y1dvLu5YPTs1FJyC98smzdLB3r/dT8AuuELzF/75p9S371Dm
   w==;
X-CSE-ConnectionGUID: 6MH5nHhITLev0spaGMR0Iw==
X-CSE-MsgGUID: 4gqB9+hXRv2tLIc9ccTleA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="51706325"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="51706325"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 07:28:53 -0700
X-CSE-ConnectionGUID: QhsGR71DQ7m1WZTVOkrzEw==
X-CSE-MsgGUID: dGeCffL8RV6eCKvxwpOVqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="174276428"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 07:28:51 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 54CE711FC38;
	Thu, 19 Jun 2025 17:28:48 +0300 (EEST)
Date: Thu, 19 Jun 2025 14:28:48 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 01/13] media: ipu6: Use correct pads for xlate_streams()
Message-ID: <aFQeoK8B008EHc3C@kekkonen.localdomain>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-2-sakari.ailus@linux.intel.com>
 <20250619132704.GC32166@pendragon.ideasonboard.com>
 <aFQWvHY1i4rPJXg1@kekkonen.localdomain>
 <20250619141535.GN22102@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619141535.GN22102@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Jun 19, 2025 at 05:15:35PM +0300, Laurent Pinchart wrote:
> On Thu, Jun 19, 2025 at 01:55:08PM +0000, Sakari Ailus wrote:
> > On Thu, Jun 19, 2025 at 04:27:04PM +0300, Laurent Pinchart wrote:
> > > Hi Sakari,
> > > 
> > > Thank you for the patch.
> > 
> > Thanks for the review!
> > 
> > > On Thu, Jun 19, 2025 at 11:15:34AM +0300, Sakari Ailus wrote:
> > > > The arguments to v4l2_subdev_state_xlate_streams() were incorrect, the
> > > 
> > > s/were/are/
> > > 
> > > > source pads was used as the sink pad and the source pad was a constant
> > > 
> > > s/pads was/pad is/
> > > s/pad was/pad is/
> > > 
> > > Are you sure though ? Unless I misread the code, you replace
> > > 
> > > pad0 = CSI2_PAD_SRC
> > > pad1 = CSI2_PAD_SINK
> > > 
> > > with
> > > 
> > > pad0 = pad
> > > pad1 = CSI2_PAD_SINK
> > > 
> > > This seems to be a correct fix, but I don't see where "the source pad
> > > was used as the sink pad".
> > 
> > Right, I'll reword it for v2.
> > 
> > > > (rather than the actual source pad). Fix these.
> > > > 
> > > > Fixes: 3a5c59ad926b ("media: ipu6: Rework CSI-2 sub-device streaming control")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 12 ++++++------
> > > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > > index da8581a37e22..6030bd23b4b9 100644
> > > > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> > > > @@ -354,9 +354,9 @@ static int ipu6_isys_csi2_enable_streams(struct v4l2_subdev *sd,
> > > >  	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[CSI2_PAD_SINK]);
> > > >  	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> > > >  
> > > > -	sink_streams = v4l2_subdev_state_xlate_streams(state, CSI2_PAD_SRC,
> > > > -						       CSI2_PAD_SINK,
> > > > -						       &streams_mask);
> > > > +	sink_streams =
> > > > +		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
> > > > +						&streams_mask);
> > > 
> > > This is one of the cases where I'd write
> > > 
> > > 	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
> > > 						       &streams_mask);
> > > 
> > > even if it goes to 81 columns.
> > 
> > The limit is still 80, not 81.
> 
> The global limit is 100 for the kernel. There's somehow of a consensus
> in the media subsystem to keep it closer to 80, with different people
> have different sensitivities. We occasionally go over 80, and that's
> usually left as a driver maintainer decision.

It's 80, not 100. The checkpatch.pl limit is higher than 80 though, as
there are still commonly cases where the code is more readable with longer
lines. See e.g. Documentation/process/coding-style.rst .

-- 
Regards,

Sakari Ailus

