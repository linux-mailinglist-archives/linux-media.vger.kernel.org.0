Return-Path: <linux-media+bounces-9478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB4C8A6495
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 09:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB1F52835E5
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 07:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395977580E;
	Tue, 16 Apr 2024 07:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PLTUPY/X"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363AE39863
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 07:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713251554; cv=none; b=gtF74Rz/qmsSFJQRIJG+bi8ThkZkqI6KylSCAuuF6lHcUzONCgiEuvsUxOnBaYgSueMngnpprL/NkSXtbP8f1CkNfOfmGg+zaFm2bavMFDJ0S5I/va5pRrQn7MZ2GiGOgo26XgP8joFiSGGsM9FxLjfyzu7dDhEwuQ7OK/Uhmrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713251554; c=relaxed/simple;
	bh=Uro7frUFE0xPOrM3ICGzYN6p4fKEV9UYq2jkEc3H0pU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQ9qGV+7oYV2R+u3bJ85yB2enQHB1gujkywzZv04p+yMKz4a9WgTHwGOagjJ5rxGcKmLnaLXVchN04YesPWyPwSzbbeiVOBqn5czZvNfcO/OfbKx0Wa2NwiHJn+a8458+jOqMhgogcq57cOY6YiFI2eKgA8JASfg+LBWqaoJwk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PLTUPY/X; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713251554; x=1744787554;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uro7frUFE0xPOrM3ICGzYN6p4fKEV9UYq2jkEc3H0pU=;
  b=PLTUPY/XnbhYAlBp4Sn4LEe1hkQw20lp1euB4YGZIkspWtBKLhk+fu3A
   Ur/MEyLMY5zSicN9Jxiq+CZ9ontbjByVcXgff8KdfaI8JNttZ6/wSVJUY
   oA7cmlVsi6wJdTfqfka61roIAWXRCO+YPVU7bCRO/wCqtPjf4Ual2fxqS
   B7yGtZTD5oiUjgm76Ib+Xt2+c+Omej5xbXqbWx9BroqPxo/hf4enPN17e
   pQR6nBf/h/YTVyVaGQLuM4u7gSC0KXSqfURGevGuouyBWPN6kV61EveLO
   DZbDQLyNmcZy8hrjqxgaf2iZQriBT/cgHM84EjsALLtrhtZRHht+vtd7e
   A==;
X-CSE-ConnectionGUID: xov961qTSO2qdYSUTJSqAw==
X-CSE-MsgGUID: wqZkb0+gR7OTCK62Ikvd6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8551845"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8551845"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 00:12:33 -0700
X-CSE-ConnectionGUID: UmKoUmtlTIWn0cZKgw6RYw==
X-CSE-MsgGUID: WgaNLT9PQku5KavRs8/plg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="59616185"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 00:12:29 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5161B11FAB0;
	Tue, 16 Apr 2024 10:12:27 +0300 (EEST)
Date: Tue, 16 Apr 2024 07:12:27 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 15/38] media: v4l: subdev: Return routes set using
 S_ROUTING
Message-ID: <Zh4k29AIHxwKjCHv@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-16-sakari.ailus@linux.intel.com>
 <20240320014514.GT8501@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240320014514.GT8501@pendragon.ideasonboard.com>

On Wed, Mar 20, 2024 at 03:45:14AM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Wed, Mar 13, 2024 at 09:24:53AM +0200, Sakari Ailus wrote:
> > Return the routes set using S_ROUTING back to the user. Also reflect this
> > in documentation.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/v4l/vidioc-subdev-g-routing.rst            |  5 +++--
> >  drivers/media/v4l2-core/v4l2-subdev.c                | 12 +++++++++++-
> >  2 files changed, 14 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > index 8f9aa83275c5..6eb6a59570dc 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > @@ -43,8 +43,9 @@ The routing configuration determines the flows of data inside an entity.
> >  Drivers report their current routing tables using the
> >  ``VIDIOC_SUBDEV_G_ROUTING`` ioctl and application may enable or disable routes
> >  with the ``VIDIOC_SUBDEV_S_ROUTING`` ioctl, by adding or removing routes and
> > -setting or clearing flags of the  ``flags`` field of a
> > -struct :c:type:`v4l2_subdev_route`.
> > +setting or clearing flags of the ``flags`` field of a struct
> > +:c:type:`v4l2_subdev_route`. Similarly to ``VIDIOC_SUBDEV_G_ROUTING``, also
> > +``VIDIOC_SUBDEV_S_ROUTING`` returns the routes back to the user.
> >  
> >  All stream configurations are reset when ``VIDIOC_SUBDEV_S_ROUTING`` is
> >  called. This means that the userspace must reconfigure all streams after calling
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 486a5c3016de..a357ce318192 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -957,8 +957,18 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
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
> > +		       state->routing.num_routes *
> 
> I think this should be capped at len_routes.

Good catch!

> 
> > +		       sizeof(*state->routing.routes));
> > +		routing->num_routes = state->routing.num_routes;
> > +
> > +		return 0;
> >  	}
> >  
> >  	case VIDIOC_SUBDEV_G_ROUTING: {
> > -- 
> > 2.39.2
> > 
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Sakari Ailus

