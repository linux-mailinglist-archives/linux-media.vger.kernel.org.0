Return-Path: <linux-media+bounces-24832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A138A1372C
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 10:58:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5ABC188A33D
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 09:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA6B1DD873;
	Thu, 16 Jan 2025 09:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f4p0km++"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2FA19539F;
	Thu, 16 Jan 2025 09:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737021507; cv=none; b=jDFu4RQHUczYUttf1pUcTglyJw4mTP4lVFBM86vGzLm3WorV3sLQZR6RRgN3FrijQnlrTHiHyFzp/YS+vMN1ntdLhCAlr6F9xLXcN2R27HpuPkEucX7CZG4FmTcGHikpT0Y4f1BPpedhaTjkLUPseasImtc7zN453Cq/iPsU83s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737021507; c=relaxed/simple;
	bh=OiiTKnmuYkUwkW4xhZZJSw5iEnRDEnqx+5R+KBdLaLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3nCaR8UI3f91M8wZww24CEXII0l8YOziv2QjRoqVHBw7z1PujoisstXlu65lCp26AxndKCKv8o11Z3wqtEsoj8s5DxwWV5U7h674pR3dBsYJ9ZzOzjKRv92dAmMnk4DTZE9+EPzxaKEsWFsHpbGy4XLrZebedaPM/RdXhz1gEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f4p0km++; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737021506; x=1768557506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OiiTKnmuYkUwkW4xhZZJSw5iEnRDEnqx+5R+KBdLaLA=;
  b=f4p0km++FgUJu0zq040L9l2AZKdc1AOKtMu8el5/RKnX8kOXuAYJh68m
   pgI0L4tQqY2HoU5wLEP1S6ujKRHdGbEqVkHTkuE5woX9jmFJh9xOeZFu8
   /Tr4zs7hj0j+mQhRFHGsKEB9mP9ZdjOh5xUQpHY0590OOR8lBhPXqYwl0
   zWNnzAMWI5huOT8T3hqhPkEf66Yd6EBvw6QR7xncQzFSA7PrpxOrGxXZd
   ZxSx6tHprszZr2oNcBjKcvq4BSkiHcIoHsiQSxyN5VIJyL1zwFaf/q8ED
   M+HekqiVi3fZBWNGG5AK9KRTMrivvFEhNVCqJ40c9klnLqVaBajQ2T+hQ
   g==;
X-CSE-ConnectionGUID: 83zRtyk7Qt2D9zKRKL5Ghg==
X-CSE-MsgGUID: nW+uUihGRZWSki0D/1ySsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="41334101"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="41334101"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 01:58:25 -0800
X-CSE-ConnectionGUID: zcK6TEBsRYazBoCi4fg4XA==
X-CSE-MsgGUID: SE5C6A1DTbiWuiGp/DBnEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109470878"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 01:58:23 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0ED8211F944;
	Thu, 16 Jan 2025 11:58:20 +0200 (EET)
Date: Thu, 16 Jan 2025 09:58:20 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH 16/19] media: i2c: ds90ub960: Enable SSCG for UB9702
Message-ID: <Z4jYPHQx6C6rQw2U@kekkonen.localdomain>
References: <20250110-ub9xx-improvements-v1-0-e0b9a1f644da@ideasonboard.com>
 <20250110-ub9xx-improvements-v1-16-e0b9a1f644da@ideasonboard.com>
 <Z4fFr-ZgCIFT_PTx@kekkonen.localdomain>
 <fcf3ae9c-37db-4c47-b0d2-800bb24e967d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcf3ae9c-37db-4c47-b0d2-800bb24e967d@ideasonboard.com>

Moi,

On Wed, Jan 15, 2025 at 06:04:40PM +0200, Tomi Valkeinen wrote:
> On 15/01/2025 16:26, Sakari Ailus wrote:
> > Moi,
> > 
> > On Fri, Jan 10, 2025 at 11:14:16AM +0200, Tomi Valkeinen wrote:
> > > From: Jai Luthra <jai.luthra@ideasonboard.com>
> > > 
> > > UB9702 supports spread-spectrum clock generation for the back-channel
> > > clock, which is futher used by serializers in synchronous mode to
> > > generate the forward-channel clock, which can help reduce peak EMI
> > > energy. The SSCG is common to all RX ports, so it can only be used if
> > > all the ports are in the same mode.
> > > 
> > > Add basic support for SSCG by adding a module parameter to enable the
> > > SSCG. The SSCG uses hardcoded configurationg, with 0.5% center-spread at
> > > 33kHz modulation rate. See datasheet if different configuration is
> > > required.
> > > 
> > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > ---
> > >   drivers/media/i2c/ds90ub960.c | 102 ++++++++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 102 insertions(+)
> > > 
> > > diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> > > index f6d6c2fe12cd..a534d077f045 100644
> > > --- a/drivers/media/i2c/ds90ub960.c
> > > +++ b/drivers/media/i2c/ds90ub960.c
> > > @@ -52,6 +52,10 @@
> > >   #include <media/v4l2-fwnode.h>
> > >   #include <media/v4l2-subdev.h>
> > > +static bool ub960_enable_sscg;
> > > +module_param_named(enable_sscg, ub960_enable_sscg, bool, 0644);
> > > +MODULE_PARM_DESC(enable_sscg, "Enable SSCG (if available)");
> > 
> > Shouldn't this come from DT instead?
> 
> SSCG is an option to use or not to use, based on what the user wants. DT
> should describe the hardware.
> 
> A module parameter is bad for this, though, as it's then used for all ub960
> devices... But I'm not sure what other options we have. We need to have it
> at probe time.
> 
> Probably the whole driver could be changed to not connect the serializers at
> probe, but instead would offer a set of userspace APIs to enable/disable
> SSCG, and to enable the links. But that brings in its own set of problems,
> as the links are used for i2c communication to the ser and sensor, not to
> mention new userspace APIs which always complicates things.

Typically determining whether you need spread spectrum signalling is highly
specific to the board. I wonder if this topic has been discussed (and
possibly somehow resolved) for other subsystems. CSI-2 appears to allow for
spread spectrum clocks but I don't think I've seen that implemeted
anywhere, scrambling may be more popular (but also that is right now
unsupported but could be supported, probably this would be best to consider
in conjunction with other CSI-2 parameters).

-- 
Terveisin,

Sakari Ailus

