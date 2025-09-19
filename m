Return-Path: <linux-media+bounces-42810-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D196AB8AA1F
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 18:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF4071CC230B
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 16:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF6B31A811;
	Fri, 19 Sep 2025 16:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RM0wLcSn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378FC12DDA1
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 16:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758300358; cv=none; b=KItn39ywI2ullOl/PxmpolbBTJ6S3CxKidWuWdyZL38MqZqoLqRMrnjHgH7lhIZzB3HJjIDiXNsvJjZLrF/+AEPUP2eWeJN/zvpSH6iEWMc6J7JFP+iVEZGfoYHSKbL6d9CW7E/DS+UCocKggp+kZG/Y6FBsWdRitWmL9LskCgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758300358; c=relaxed/simple;
	bh=hN7kWYvFgqrkNj2YTHMEg1eK1DoH4f5oPr/g9CnrY0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdSqae1qMfQ7zH6PKLQcGnDscb8EIkvQsiYxuNuGOziE8IBEr2UCsMWcXQNbZojU6DH/j5APjpBmrQ0jm/0tmV9l9nKagTOS6Ta5MTIBi/Qpkdz24dYQKxZty9brwlU0hIMogAz8zRI1hOACjiH0PYafs1Ja2EVaDZ4CwTah+2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RM0wLcSn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758300357; x=1789836357;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hN7kWYvFgqrkNj2YTHMEg1eK1DoH4f5oPr/g9CnrY0c=;
  b=RM0wLcSni/AZ5S6Ir3TZm/2DQ8FRvhoFem6TNY9wDy/s3XYHeltHAdtl
   JGYQP6PyYCJP7XLAolrdi5Bi3sSq9NlFiOEamjL3ux8tXviYzAmnvtB8w
   5TpTqQUf0Baijf1iA20sQ0EFyH6JYAqrteFyXIVwF+EdfxbN0MtHJT8X8
   SPVSRs1cFvmzW1PwftZ52x723V3UJtN1SnqXEjNDNWZiOwqr+givfhcCW
   PEIXLJdyMkwHvWPa+KFuJvDESk4aCftMS5QO0aEAbc/RopVQ43xgETyGE
   ZTCK2Hyd9/PwfeSCfl5kOLJAirkrY9C+a4EFB0cXre36AOm6rMOf6yUrw
   Q==;
X-CSE-ConnectionGUID: 9OlK7qw2RSG7aVpuxPUuxw==
X-CSE-MsgGUID: dOBtcYXtQYySxZFsb6Dy9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60595949"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60595949"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 09:45:56 -0700
X-CSE-ConnectionGUID: VWt7Ek/OSlC34kGACWAvbQ==
X-CSE-MsgGUID: IKRLazyXS1uu9dxZSZEJCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="176261216"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.108])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 09:45:49 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5695911F95D;
	Fri, 19 Sep 2025 19:45:46 +0300 (EEST)
Date: Fri, 19 Sep 2025 19:45:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
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
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 52/66] media: v4l: Add V4L2_SUBDEV_ROUTE_FL_STATIC
 sub-device routing flag
Message-ID: <aM2IusXJOUR411xS@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-53-sakari.ailus@linux.intel.com>
 <20250903215224.GE3648@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903215224.GE3648@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Sep 03, 2025 at 11:52:24PM +0200, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Aug 25, 2025 at 12:50:53PM +0300, Sakari Ailus wrote:
> > Add a flag to denote static routes, V4L2_SUBDEV_ROUTE_FL_STATIC. Such
> > routes cannot be removed as they are related to hardware features.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst      | 5 +++++
> >  include/uapi/linux/v4l2-subdev.h                             | 5 +++++
> >  2 files changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > index 0b90be43af57..3c7fde673b34 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > @@ -151,6 +151,11 @@ wants to retrieve the missing routes, it can issue a new
> >        - The route is immutable. Set by the driver. Indicates that the
> >  	``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag of an immutable route may not be
> >  	unset.
> > +    * - ``V4L2_SUBDEV_ROUTE_FL_STATIC``
> > +      - 0x0004
> > +      - The route is static. Set by the driver. Indicates that the route is
> > +        always present and cannot be removed. Implies
> > +        ``V4L2_SUBDEV_ROUTE_FL_IMMUTABLE``.
> 
> It's the other way around. IMMUTABLE implies STATIC, but not all static
> routes are immutable.
> 
>       - The route is static. Set by the driver. Indicates that the route is
>         created by the driver and cannot be removed. Static routes may
> 	be immutable, or may allow userspace to enable and disable them.
> 
> I'm not fully happy with the last sentence, but "enable-able" isn't a
> word :-)

Good point. I'll add the last sentence to the immutable flag, changing the
mentioned flag to static.

I might not put the reverse dependency here.

> 
> >  
> >  Return Value
> >  ============
> > diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> > index 839b1329afb2..cb353fa4a4a6 100644
> > --- a/include/uapi/linux/v4l2-subdev.h
> > +++ b/include/uapi/linux/v4l2-subdev.h
> > @@ -209,6 +209,11 @@ struct v4l2_subdev_capability {
> >   * unset.
> >   */
> >  #define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		(1U << 1)
> > +/*
> > + * Is the route static? The STATIC flag of an immutable route may not be
> > + * unset.
> 
> The static flag can never be unset. We need to document this better
> above. What happens if an application tries to unset it ?

Nothing. It's set by the driver, not by the user space, as documented. I
changed this to:

/*
 * Is the route static? Routes with the STATIC flag are not removable.
 */


Note that the documentation in the header won't end up in UAPI
documentation, the ReST documentation will.

> 
> > + */
> > +#define V4L2_SUBDEV_ROUTE_FL_STATIC		(1U << 2)
> >  
> >  /**
> >   * struct v4l2_subdev_route - A route inside a subdev
> 

-- 
Kind regards,

Sakari Ailus

