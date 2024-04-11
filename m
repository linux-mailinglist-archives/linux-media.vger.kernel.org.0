Return-Path: <linux-media+bounces-9085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2758A0AED
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 10:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E901287CE3
	for <lists+linux-media@lfdr.de>; Thu, 11 Apr 2024 08:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C6913E89B;
	Thu, 11 Apr 2024 08:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QY/TCwby"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C88A13E408
	for <linux-media@vger.kernel.org>; Thu, 11 Apr 2024 08:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712823219; cv=none; b=hw7fJ774tOyVIPX5Oa9G7OpQN9dm57ieb3sIGkANbxyF1hQjSBhR0pWJv0YFhoN3ZROJoxTkGXdILHs+mYsmzbVa/pp1yiwwfq3tVPafRmkCMvgJHc8yD7t/ePLxOT+9r0AZDKphAZjFwoRfsz/SwR9q7xK3ak6HV76UHMArae4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712823219; c=relaxed/simple;
	bh=t4O+HD/qlF/H3hdH6LpnGee/InFna264TFL+vilsyjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QhYDNJfq3rlHMbeRfcBzQaogvmipN5w2Qh9gP98INlBUJ0or9vp37Ck8yHZKgQyEd9AxsCsWiVgArx2pFGN7ZDpOt3nE5pp6eJQS7njyHhBV2gmK76Yxsfx7wUa6RWastSKLJ7tbMyDpkS/jUCwbJ2RVp5uytUl4rxwqSTvUJBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QY/TCwby; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712823217; x=1744359217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t4O+HD/qlF/H3hdH6LpnGee/InFna264TFL+vilsyjA=;
  b=QY/TCwbymbUjPrGVpz8bGOlQyJN1j1LhfMP+CrzXKbs1tjYyDFA5SPRq
   VA40Fe125tFNYbj31oF6NHa1OgTom1AHYxyI/wYeyYb9LM/+kxQKPJ9GX
   XWhh2Llz+8tPNji9obeQl3DP0dU9N4pIkqz1PaSaBDbBLpGPmTiCdqck3
   y3xl2NKIfToWmJytvQMJcxzXvf4GUA9y1VUR4VXEIYghSev8+oWLVBIDT
   o8l8nKsJVLq/W0B9hauEQko+tM/Vl4WaXbm4B3B/miQdXRVsdERhFva8+
   8cvOYhC+piY+Gc/dbXXDr0+PI2omQ3rwR/TEu68g5OTeSiRRFwLcufzyn
   Q==;
X-CSE-ConnectionGUID: jaFj83O0TA2z2groDyFJLg==
X-CSE-MsgGUID: rdO+6V0xSLOuo0zhBaEC5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8396795"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="8396795"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 01:13:36 -0700
X-CSE-ConnectionGUID: iv/ExjZcTwCtDLurY/lUng==
X-CSE-MsgGUID: v/1Z95jCQjO+8krGdCpbNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="25481395"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 01:13:34 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4D34C12035C;
	Thu, 11 Apr 2024 11:13:31 +0300 (EEST)
Date: Thu, 11 Apr 2024 08:13:31 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 17/38] media: v4l: subdev: Add trivial set_routing
 support
Message-ID: <Zhebq7FxeDolVDTp@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-18-sakari.ailus@linux.intel.com>
 <20240320015558.GV8501@pendragon.ideasonboard.com>
 <20240401234105.GA2492@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240401234105.GA2492@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, Apr 02, 2024 at 02:41:05AM +0300, Laurent Pinchart wrote:
> On Wed, Mar 20, 2024 at 03:55:58AM +0200, Laurent Pinchart wrote:
> > Hi Sakari,
> > 
> > Thank you for the patch.
> > 
> > On Wed, Mar 13, 2024 at 09:24:55AM +0200, Sakari Ailus wrote:
> > > Add trivial S_ROUTING IOCTL support for drivers where routing is static.
> > > Essentially this means returning the same information G_ROUTING call would
> > > have done.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Actually...
> 
> > > ---
> > >  drivers/media/v4l2-core/v4l2-subdev.c | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index a6107e440ef0..c8c435df92c8 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -930,6 +930,20 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> > >  
> > >  		memset(routing->reserved, 0, sizeof(routing->reserved));
> > >  
> > > +		/*
> > > +		 * If the driver doesn't support setting routing, just return
> > > +		 * the routing table here.
> > > +		 */
> > > +		if (!v4l2_subdev_has_op(sd, pad, set_routing)) {
> > > +			memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> > > +			       state->routing.routes,
> > > +			       min(state->routing.num_routes, routing->len_routes) *
> > > +			       sizeof(*state->routing.routes));
> > > +			routing->num_routes = state->routing.num_routes;
> > > +
> > > +			return 0;
> > > +		}
> > > +
> 
> I think this should be done after the next code block that validates the
> arguments. Otherwise the S_ROUTING ioctl will behave differently with
> regard to blatantly invalid arguments, depending on whether or not the
> subdev implements the .set_routing() operation. This can confuse
> userspace, and does confuse v4l2-compliance.
> 
> I have the following change in my tree that fixes the problem, feel free
> to squash it with this patch in v9.
> 
> commit 1e1f03eb8bc118c53a9deab05063d71a2fe7aa5f
> Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Date:   Tue Apr 2 02:06:01 2024 +0300
> 
>     fixup! media: v4l: subdev: Add trivial set_routing support
> 
>     Validate arguments before handling the trivial set_routing support to
>     expose a consistent behaviour to userspace. This fixes an issue with
>     v4l2-compliance.
> 
>     Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, I'll squash this into the patch.

> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index def91ab32c07..129867ed2bad 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -933,19 +933,12 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		memset(routing->reserved, 0, sizeof(routing->reserved));
> 
>  		/*
> -		 * If the driver doesn't support setting routing, just return
> -		 * the routing table here.
> +		 * Perform argument validation first, or subdevs that don't
> +		 * support setting routing will not return an error when
> +		 * arguments are blatantly wrong. The difference in behaviour
> +		 * could be confusing for userspace, and in particular for API
> +		 * compliance checkers.

This is more fit for development time discussion, not something that should
be left in the code IMO.

>  		 */
> -		if (!v4l2_subdev_has_op(sd, pad, set_routing)) {
> -			memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> -			       state->routing.routes,
> -			       min(state->routing.num_routes, routing->len_routes) *
> -			       sizeof(*state->routing.routes));
> -			routing->num_routes = state->routing.num_routes;
> -
> -			return 0;
> -		}
> -
>  		for (i = 0; i < routing->num_routes; ++i) {
>  			const struct v4l2_subdev_route *route = &routes[i];
>  			const struct media_pad *pads = sd->entity.pads;
> @@ -969,6 +962,20 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  				return -EINVAL;
>  		}
> 
> +		/*
> +		 * If the driver doesn't support setting routing, just return
> +		 * the routing table here.
> +		 */
> +		if (!v4l2_subdev_has_op(sd, pad, set_routing)) {
> +			memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> +			       state->routing.routes,
> +			       min(state->routing.num_routes, routing->len_routes) *
> +			       sizeof(*state->routing.routes));
> +			routing->num_routes = state->routing.num_routes;
> +
> +			return 0;
> +		}
> +
>  		krouting.num_routes = routing->num_routes;
>  		krouting.len_routes = routing->len_routes;
>  		krouting.routes = routes;
> 
> 
> > >  		for (i = 0; i < routing->num_routes; ++i) {
> > >  			const struct v4l2_subdev_route *route = &routes[i];
> > >  			const struct media_pad *pads = sd->entity.pads;
> 

-- 
Regards,

Sakari Ailus

