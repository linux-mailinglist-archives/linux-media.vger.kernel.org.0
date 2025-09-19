Return-Path: <linux-media+bounces-42812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D40B8AA92
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 18:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 972981CC4015
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 16:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A9531FEDB;
	Fri, 19 Sep 2025 16:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQVptuj9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C07B22A4F1
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 16:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758301039; cv=none; b=GmYS3lg7e7Ej57fuWGukNzWNp5lDS5pc83TlptWseeNiqKQJkeWl0Eh+dmTSH5yDFJOCaatyqnZ0ArNrNj63XJdD/BcZeR4GXWQWITdzNSmla3/HpRPHLam6IK+LDEH2YNYppYFk0fcCWegeQI0Ixe9k78k+5FYoVvzIXjVmRPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758301039; c=relaxed/simple;
	bh=XeCxMVLT1nFP1wDiHr2PLwKhydoHJVjZfw0l1QOalQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvs8iTMDdRvKEh+gcbz1cLy4Y37qS5L9derrbPaEieE0UQgGrAErbEjMSCfyMZxovAwidxnnX8OaPVkNtqRjxwC2LNmpPh6GqrgU9o3qfjcRMHtHsl0qOvYwV0FnafO6J4VIyCizS2tqPPb/yQ7AWoBH101WhUxJqZIL6MfLn1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQVptuj9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758301037; x=1789837037;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XeCxMVLT1nFP1wDiHr2PLwKhydoHJVjZfw0l1QOalQQ=;
  b=QQVptuj9KY6dXgZlNDc4cwoejs4kVBW4bx+BeNHYX3gD5SA8QI2ISI0q
   Qe/9tneGY2bR4AlJcPR8olarNAk+MClIEZbGwLIG7kKlASBh1ti9qq4vE
   O41Ld0oWUeIdQ3JtjB6dBLUXsT42KG+jA9LMkCrFX96uGaFH2a9c076wD
   usTYtJe+xiM1sD+RY8UvpIEaR443LAMlz/qqCJQWf06xZroUFUI5QQWOz
   e8CD5Ik14CIYn+6YkGGGEU88YQydomWdKvNc4jXpHxsEbRoqnNbpWULl6
   wvPlisMritwh+Jgyl6BsFPpLlQbEhgWLtMSHuBuqMhOurjHRkLUBc++SU
   g==;
X-CSE-ConnectionGUID: MbAywi86RveRN3hUkqbxJQ==
X-CSE-MsgGUID: icoEgCAARHW0e2k+rnaDaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="59870086"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="59870086"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 09:57:16 -0700
X-CSE-ConnectionGUID: jQgy1dzAQIq5guTPgpdIRg==
X-CSE-MsgGUID: SqlgdBtRQC+hcDtOHpiIxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="175501802"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.108])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 09:57:09 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AEFB411FC22;
	Fri, 19 Sep 2025 19:57:06 +0300 (EEST)
Date: Fri, 19 Sep 2025 19:57:06 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 53/66] media: Documentation: Document IMMUTABLE and
 STATIC route flags
Message-ID: <aM2LYjVv6QcFoC2e@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-54-sakari.ailus@linux.intel.com>
 <vtphduwp7o2ehbovg5op2ow3bh3y2akyti7iujd3h6pmhx7cw7@vwrpq44nyc2f>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vtphduwp7o2ehbovg5op2ow3bh3y2akyti7iujd3h6pmhx7cw7@vwrpq44nyc2f>

Hi Jacopo,

On Mon, Sep 01, 2025 at 07:35:31PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Aug 25, 2025 at 12:50:54PM +0300, Sakari Ailus wrote:
> > Include the V4L2_SUBDEV_ROUTE_FL_IMMUTABLE and V4L2_SUBDEV_ROUTE_FL_STATIC
> > flags in V4L2 sub-device documentation that discusses routing.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/userspace-api/media/v4l/dev-subdev.rst | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > index 684ef0844517..2e94e00978c0 100644
> > --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> > @@ -603,11 +603,14 @@ depending on the hardware. In all cases, however, only routes that have the
> >  ``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag set are active.
> >
> >  Devices generating the streams may allow enabling and disabling some of the
> > -routes or have a fixed routing configuration. If the routes can be disabled, not
> > +routes or have a fixed routing configuration. Such routes that are directly tied
> 
> s/Such routes/Routes

Yes.

> 
> > +to hardware resources are marked with ``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE`` route
>    to hardware resources and cannot be disabled by userspace are ...

I changed this to:

Devices generating the streams may allow enabling and disabling some of the
routes or have a fixed routing configuration. Routes that are bound to hardware
resources and are always present are marked with ``V4L2_SUBDEV_ROUTE_FL_STATIC``
flag. Static routes that cannot be disabled are marked with
``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE`` route flag. Static routes can be disabled by
not declaring the routes (or declaring them without
``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag set) in
``VIDIOC_SUBDEV_S_ROUTING``. ``VIDIOC_SUBDEV_S_ROUTING`` will still return such
routes back to the user in the routes array, with the
``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag unset.

> 
> > +flag. Routes that are always present but can be disabled are marked with
> > +``V4L2_SUBDEV_ROUTE_FL_STATIC`` flag. Static routes can be disabled by not
> >  declaring the routes (or declaring them without ``V4L2_SUBDEV_ROUTE_FL_ACTIVE``
> > -flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will disable the routes.
> > -``VIDIOC_SUBDEV_S_ROUTING`` will still return such routes back to the user in
> > -the routes array, with the ``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag unset.
> > +flag set) in ``VIDIOC_SUBDEV_S_ROUTING``. ``VIDIOC_SUBDEV_S_ROUTING`` will still
> > +return such routes back to the user in the routes array, with the
> > +``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag unset.
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thank you.

> 
> This can be fast-tracked along with the previous two patches I guess
> 
> >
> >  Devices transporting the streams almost always have more configurability with
> >  respect to routing. Typically any route between the sub-device's sink and source

-- 
Kind regards,

Sakari Ailus

