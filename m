Return-Path: <linux-media+bounces-41701-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73060B4234B
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 16:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F82E1BA7A2A
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 14:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DEF306497;
	Wed,  3 Sep 2025 14:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDhlqqCx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAC0200127
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 14:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756908919; cv=none; b=fy2FMOfgtabH7S4wZea076ou2bKyeCDhAihnICWuoF3C0C1E18tYW9BM0SHKo3KT0WYbLURqziKKe6Uyjk/wOrYW3re38rmv50gi6YNqAZEHy92tyjSQv+tNSCOCSoNR94v0WKWHxm/rnmJsbevAul/sdLOnL7ayalAW8h6qNog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756908919; c=relaxed/simple;
	bh=SWdjGnmr2X74Zr3glSRaWKVk36DKnkcaqTa9TrjZa0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXI7mKe1ZkzHz5CulfYZN5ABtSeYb6NCFcqqyPX2KDLZhw5L/5zs4pRUVq6zTfvhlpnYVgLsRT7EZHvU2xiLycIzyiUBdR6O735g6xFknwYig9SLCtXjsNprVlBvUzU0z2hkvbc0kpdJ/Eb97rbR08GVHN2gG3dSmRGRI/umNJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jDhlqqCx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756908917; x=1788444917;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SWdjGnmr2X74Zr3glSRaWKVk36DKnkcaqTa9TrjZa0o=;
  b=jDhlqqCxAbGpo7FoI5mIt2yc5OGUt5SWnqgbytHwvc0G1slmdrBnzxnH
   gesrGbNP2J80Q2QzSvT0cIvXxmcM4YO4Z8PnXyxg6SxmcgoA0CWMqsLNU
   33wTpwTWkIrvklNKoTn4ZLid7YUBT8MFNwQ0irywzWrT5J/AVT18neuwO
   W9hg/aCSx24vEH/uTgSuKCXLFlVD77QvT3GZHduZiEQgQTFVqu6nuWuac
   jNP3n54hkLINFZbsWaOTDO68xwUU3m91Vh6PdN5yEDfNdEWikC0ILUsZD
   VnQSdqsW7qt3LNtJSeCbRzhmlCEJrfimujGO/J+n4pY30ceLclUiH5URH
   w==;
X-CSE-ConnectionGUID: E2NgGclWSZSmvl3W+hkl/g==
X-CSE-MsgGUID: GfOi8OFZTqOhhwZkqdoXpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="84652216"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="84652216"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 07:15:15 -0700
X-CSE-ConnectionGUID: qfAbkGFkTZO2jhGvTNjTUQ==
X-CSE-MsgGUID: 7hpzinDDQ6OT8dCxEUU1kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="171160848"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.204])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 07:15:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 36CB011F99F;
	Wed, 03 Sep 2025 17:15:06 +0300 (EEST)
Date: Wed, 3 Sep 2025 17:15:06 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
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
Subject: Re: [PATCH v11 04/66] media: Documentation: Document -ENXIO for
 VIDIOC_SUBDEV_S_ROUTING
Message-ID: <aLhNahp3E9fgAyXx@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-5-sakari.ailus@linux.intel.com>
 <s7yxeudfc5n67v7po6rjb7zaxwy3cjxzflvb7v27owhe5hicyu@qqazppf4vajo>
 <aLbANPWV4wmcMZgT@kekkonen.localdomain>
 <20250903134755.GF3648@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903134755.GF3648@pendragon.ideasonboard.com>

On Wed, Sep 03, 2025 at 03:47:55PM +0200, Laurent Pinchart wrote:
> On Tue, Sep 02, 2025 at 01:00:20PM +0300, Sakari Ailus wrote:
> > On Mon, Sep 01, 2025 at 01:33:56PM +0200, Jacopo Mondi wrote:
> > > On Mon, Aug 25, 2025 at 12:50:05PM +0300, Sakari Ailus wrote:
> > > > Document that -ENXIO is returned when the user tries to set a routing
> > > > configuration not supported by the hardware (or rather the driver). The
> > > > documentation details the exact cases of this, besides -EINVAL that is
> > > > already documented for VIDIOC_SUBDEV_S_ROUTING.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  .../media/v4l/vidioc-subdev-g-routing.rst             | 11 ++++++++++-
> > > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > > > index 1cf795480602..15f448664e6b 100644
> > > > --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > > > @@ -155,9 +155,18 @@ appropriately. The generic error codes are described at the
> > > >  :ref:`Generic Error Codes <gen-errors>` chapter.
> > > >
> > > >  EINVAL
> > > > +
> > > 
> > > Is this intended ?
> > 
> > Oops.
> > 
> > > >     The sink or source pad identifiers reference a non-existing pad or reference
> > > >     pads of different types (ie. the sink_pad identifiers refers to a source
> > > > -   pad), or the ``which`` field has an unsupported value.
> > > > +   pad), the ``which`` field has an unsupported value, or, for
> > > > +   ``VIDIOC_SUBDEV_S_ROUTING``, the num_routes field value is larger than that
> > > > +   of the len_routes field.
> > > 
> > > Doesn't this contradicts the above
> > > 
> > > The kernel can return a ``num_routes`` value larger than ``len_routes`` from
> > > both ioctls. This indicates thare are more routes in the routing table than fits
> > > the ``routes`` array. In this case, the ``routes`` array is filled by the kernel
> > > with the first ``len_routes`` entries of the subdevice routing table. This is
> > > not considered to be an error, and the ioctl call succeeds. If the applications
> > > wants to retrieve the missing routes, it can issue a new
> > > ``VIDIOC_SUBDEV_G_ROUTING`` call with a large enough ``routes`` array.
> > > 
> > > Looking at the handler for VIDIOC_SUBDEV_S_ROUTING in v4l2-subdev.c I
> > > think this should specify that is invalid to have userspace set a num_routes
> > > value larger than len_routes.
> > > 
> > > I would simply add this to the above hunk
> > > 
> > > -   pad), or the ``which`` field has an unsupported value.
> > > +   pad), the ``which`` field has an unsupported value, or, for
> > > +   ``VIDIOC_SUBDEV_S_ROUTING``, the num_routes field provided by the
> > > +   application is larger than the len_routes field value.
> > 
> > s/provided/set/ ?
> > 
> > Looks good to me.
> > 
> > > > +
> > > > +ENXIO
> > > > +   No such link can be created or such link state change can be made. Either the
> > > > +   sink or source (pad, stream) pair or the combination of the sink and source
> > > > +   is not supported by the hardware, or no multiple routes from or to the same
> > > > +   (pad, stream) pair are supported.
> > > 
> > > If I'm not mistaken this only applies to VIDIOC_SUBDEV_S_ROUTING, so I
> > > would mention that. Also ENXIO is not returned by the core but by
> > > drivers, so I would not limit the possible cases where ENXIO is
> > > returned by making examples.
> > > 
> > > What about a simpler:
> > > 
> > > +ENXIO
> > > +   The application requested routes cannot be created or the state of
> > > +   the specified routes cannot be modified. Only returned for
> > > +   ``VIDIOC_SUBDEV_S_ROUTING``.
> 
> This sounds fairly vague. I'd prefer keeping the description of the
> error conditions, but turning them from an exhaustive list into
> examples. How about the following ?
> 
> ENXIO
>    The routes specified by the application can't be applied because they violate
>    the driver's validity requirements. For instance, the application may be
>    trying to disable an immutable route, create a route that is not supported by
>    the device, or that conflicts with other routes. Only returned for
>    ``VIDIOC_SUBDEV_S_ROUTING``.
> 
> I'm also not too sure about ENXIO ("No such device or address"). There's
> no other error code that immediately strikes me as a good match though.
> If I were to propose a hack, I'd say EBADR could be used to mean "bad
> route" instead of "bad request" :-)

:-) What I think really counts is that it's different from EINVAL, albeit
I'm open to better suggestions. We could use e.g. EBADSLT, at least it'd
be easy to spot. Same goes for EBADR probably.

-- 
Sakari Ailus

