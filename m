Return-Path: <linux-media+bounces-9928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 008C28AE30E
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 12:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2468C1C219A2
	for <lists+linux-media@lfdr.de>; Tue, 23 Apr 2024 10:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 773197CF25;
	Tue, 23 Apr 2024 10:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJisf4nK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604785FEE6
	for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 10:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713869358; cv=none; b=Zanx7qDuBTl0WE0XnAlD9tFPfFyDrz/5yy3PJnbrAV5LruS1xBH0yTdcPFHV5i8W1XlQYi/JZhXyFUDvXI2XJNeFiqvDhFqH/iR9Fdn2u0FXYn9otibj8Reikl3XnenBrap3C7tIZNCE560nxbM/qvq2N4Asq5ilNGxhkKUPNqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713869358; c=relaxed/simple;
	bh=x8evBfA7uZdtCo1gFrfv26ViFN87/sekKQkYN2k934Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9a/xGqqS3H0dn4o+6v6kI1DzcyHUs4wvZoenAWEE76CFCILcYl4/3MmTlFRbltoUgowc2KsxlVlFBulzWIIlUYD3tt/4n/OHqCA+Z7kskh4eJJ8Raju7+HyHQkHB0p3er22a2CKV1gBDZZc6M1GCgTwA90k7TWItZBGqzqnHWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJisf4nK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713869357; x=1745405357;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x8evBfA7uZdtCo1gFrfv26ViFN87/sekKQkYN2k934Y=;
  b=jJisf4nK7zDLjxZ+8mWU8soEM+Yx2JRXjQNyCkagj+WFN1XyXp1FpLhX
   O7FtOjclqxqJg4Z1BlUKXvnOrrHtypwHidnfegoxaavRhF1u/dRpzN+Mz
   hzqpzzCK5NUKor87L9fXyx/gTWy+ZpdNZMK7zhJNMUAJdyupDAygILObN
   O5v1P6xcJi0izGYRQMsBG5IMzWyEbResPUWDF23eoErm5wsckEr2ExWYs
   NqtMJO/buJgiz6Br+a5ae6AdUamF4IzXAY8px6OtNy1mIdmtbc+DyeEfW
   SWBnYLJ6ST7DlQ/eP6GL0OXPsm6I11yTZd8PkVJogN5MQx6+mkyvvB7Ch
   w==;
X-CSE-ConnectionGUID: EMG9D9qOR4WmtBzeMMCG2Q==
X-CSE-MsgGUID: 3T2zqd9MSjKUFC3wQWr+vg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9984887"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9984887"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 03:49:16 -0700
X-CSE-ConnectionGUID: WGT+bphxQPq6k4KfoF7U0A==
X-CSE-MsgGUID: 6KB24VHUQBWVScFkNPwg6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24379840"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 03:49:14 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4B6FB11FCCF;
	Tue, 23 Apr 2024 13:49:11 +0300 (EEST)
Date: Tue, 23 Apr 2024 10:49:11 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 16/46] media: v4l: subdev: Return routes set using
 S_ROUTING
Message-ID: <ZieSJ_UEUL3tOzzB@kekkonen.localdomain>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-17-sakari.ailus@linux.intel.com>
 <20240419225552.GK6414@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240419225552.GK6414@pendragon.ideasonboard.com>

Hi Laurent,

On Sat, Apr 20, 2024 at 01:55:52AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Tue, Apr 16, 2024 at 10:32:49PM +0300, Sakari Ailus wrote:
> > Return the routes set using S_ROUTING back to the user. Also reflect this
> > in documentation.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/v4l/vidioc-subdev-g-routing.rst            |  7 ++-----
> >  drivers/media/v4l2-core/v4l2-subdev.c                | 12 +++++++++++-
> >  2 files changed, 13 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > index 27eb4c82a0e1..88df7bf80b00 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > @@ -44,7 +44,8 @@ Drivers report their current routing tables using the
> >  ``VIDIOC_SUBDEV_G_ROUTING`` ioctl and application may enable or disable routes
> >  with the ``VIDIOC_SUBDEV_S_ROUTING`` ioctl, by adding or removing routes and
> >  setting or clearing flags of the ``flags`` field of a struct
> > -:c:type:`v4l2_subdev_route`.
> > +:c:type:`v4l2_subdev_route`. Similarly to ``VIDIOC_SUBDEV_G_ROUTING``, also
> > +``VIDIOC_SUBDEV_S_ROUTING`` returns the routes back to the user.
> 
> :c:type:`v4l2_subdev_route`. Similarly to ``VIDIOC_SUBDEV_G_ROUTING``,
> ``VIDIOC_SUBDEV_S_ROUTING`` also returns the routes back to the user.

The intention here is to say that S_ROUTING returns the routes back to the
user, just as G_ROUTING does. Moving "also" after S_ROUTING makes the
meaning of the sentence unclear.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

> 
> >  
> >  All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is called.
> >  This means that the userspace must reconfigure all stream formats and selections
> > @@ -157,10 +158,6 @@ On success 0 is returned, on error -1 and the ``errno`` variable is set
> >  appropriately. The generic error codes are described at the
> >  :ref:`Generic Error Codes <gen-errors>` chapter.
> >  
> > -ENOSPC
> > -   The application provided ``num_routes`` is not big enough to contain
> > -   all the available routes the subdevice exposes.
> > -
> >  EINVAL
> >     The sink or source pad identifiers reference a non-existing pad or reference
> >     pads of different types (ie. the sink_pad identifiers refers to a source
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 904378007a79..36b2f78cd551 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -959,8 +959,18 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >  		krouting.len_routes = routing->len_routes;
> >  		krouting.routes = routes;
> >  
> > -		return v4l2_subdev_call(sd, pad, set_routing, state,
> > +		rval = v4l2_subdev_call(sd, pad, set_routing, state,
> >  					routing->which, &krouting);
> > +		if (rval < 0)
> > +			return rval;
> > +
> > +		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> > +		       state->routing.routes,
> > +		       min(state->routing.num_routes, routing->len_routes) *
> > +		       sizeof(*state->routing.routes));
> > +		routing->num_routes = state->routing.num_routes;
> > +
> > +		return 0;
> >  	}
> >  
> >  	case VIDIOC_SUBDEV_G_ROUTING: {
> 

-- 
Regards,

Sakari Ailus

