Return-Path: <linux-media+bounces-41546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5DBB3FB94
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 259B7162202
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 10:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817FF2F290B;
	Tue,  2 Sep 2025 10:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxP94eJ/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDBB2F291D
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 10:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756807233; cv=none; b=n/DB528pgBgyppFR4xhYu/9Ha7MxxHliJLEL7L+1AGmSDh3b2gr1Swt5WVn9feb9w2NqIDN/QkSj+NOxqH5muGhGky0AMx1FwePKWDahyKNZWJgmgTNrodnmYsBYqyTeodkzVJVGGFbBUFqO6mcH5SR5rCUZvZo2MRtCeXfcqgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756807233; c=relaxed/simple;
	bh=vZXLwM3788gEMHiAknq15oLU6b5v6EA6xYYBRrA1L1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duCUlISei4XV4Q1czZe+9uwxmj6J7IWrnllIDeIHH7FeVbZ8RgEuw10v1kkDAB30P0PtHy27QW7TU2OxaPx/8j70iK1wpWoB07cp7FWcpIkGwfkhl0mdC/zCw7ommeL4PIMqmfRwdPzF+/XyBiTWC2XGJqEAboS7lgpM9k48Vko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxP94eJ/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756807232; x=1788343232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vZXLwM3788gEMHiAknq15oLU6b5v6EA6xYYBRrA1L1A=;
  b=dxP94eJ/lxvp1n65C9/hZAjR4DlA6LOeVD616DBJQyE2YbI1ER5vNPZa
   PDGO5+MYvoTT3Hy18H+E+4YsLGa+NrWlIwi06gVd07Z+CcVt9CxWpexxs
   n5lDwZqKr+mxsgaIciHZLanC22GLz7gMWoHFF43BZ04WbDyxxZ42szcqz
   XP/PZTOe1S2rvi3A/TsxXftmHtTJT5z+68qGE9EiyITB8I/ZfxN4RvuTY
   M3gQeMd/CnVOdT/VxhLJwvyiW6Z6dnEyYSVviK+ESjL+czAVa3DjXzbNF
   38pe+7M5NZnJvxFT9kwBdebFkATxnBQfSKUHb3Enf9e1gaDwtPK4UAkPo
   A==;
X-CSE-ConnectionGUID: RC2CMZy0R62VTgkqcxl4xA==
X-CSE-MsgGUID: xR28map9ST61gf2J/NXBDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59210457"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="59210457"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 03:00:30 -0700
X-CSE-ConnectionGUID: OzhP45hLS46M5wUUEbcq2w==
X-CSE-MsgGUID: Qx2RFY39RqKB8yIyPqBeKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="172074122"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.32])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 03:00:23 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E41FF11F739;
	Tue, 02 Sep 2025 13:00:20 +0300 (EEST)
Date: Tue, 2 Sep 2025 13:00:20 +0300
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
Subject: Re: [PATCH v11 04/66] media: Documentation: Document -ENXIO for
 VIDIOC_SUBDEV_S_ROUTING
Message-ID: <aLbANPWV4wmcMZgT@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-5-sakari.ailus@linux.intel.com>
 <s7yxeudfc5n67v7po6rjb7zaxwy3cjxzflvb7v27owhe5hicyu@qqazppf4vajo>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s7yxeudfc5n67v7po6rjb7zaxwy3cjxzflvb7v27owhe5hicyu@qqazppf4vajo>

Hi Jacopo,

On Mon, Sep 01, 2025 at 01:33:56PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Aug 25, 2025 at 12:50:05PM +0300, Sakari Ailus wrote:
> > Document that -ENXIO is returned when the user tries to set a routing
> > configuration not supported by the hardware (or rather the driver). The
> > documentation details the exact cases of this, besides -EINVAL that is
> > already documented for VIDIOC_SUBDEV_S_ROUTING.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/v4l/vidioc-subdev-g-routing.rst             | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > index 1cf795480602..15f448664e6b 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > @@ -155,9 +155,18 @@ appropriately. The generic error codes are described at the
> >  :ref:`Generic Error Codes <gen-errors>` chapter.
> >
> >  EINVAL
> > +
> 
> Is this intended ?

Oops.

> 
> >     The sink or source pad identifiers reference a non-existing pad or reference
> >     pads of different types (ie. the sink_pad identifiers refers to a source
> > -   pad), or the ``which`` field has an unsupported value.
> > +   pad), the ``which`` field has an unsupported value, or, for
> > +   ``VIDIOC_SUBDEV_S_ROUTING``, the num_routes field value is larger than that
> > +   of the len_routes field.
> 
> Doesn't this contradicts the above
> 
> The kernel can return a ``num_routes`` value larger than ``len_routes`` from
> both ioctls. This indicates thare are more routes in the routing table than fits
> the ``routes`` array. In this case, the ``routes`` array is filled by the kernel
> with the first ``len_routes`` entries of the subdevice routing table. This is
> not considered to be an error, and the ioctl call succeeds. If the applications
> wants to retrieve the missing routes, it can issue a new
> ``VIDIOC_SUBDEV_G_ROUTING`` call with a large enough ``routes`` array.
> 
> Looking at the handler for VIDIOC_SUBDEV_S_ROUTING in v4l2-subdev.c I
> think this should specify that is invalid to have userspace set a num_routes
> value larger than len_routes.
> 
> I would simply add this to the above hunk
> 
> -   pad), or the ``which`` field has an unsupported value.
> +   pad), the ``which`` field has an unsupported value, or, for
> +   ``VIDIOC_SUBDEV_S_ROUTING``, the num_routes field provided by the
> +   application is larger than the len_routes field value.

s/provided/set/ ?

Looks good to me.

> 
> > +
> > +ENXIO
> > +   No such link can be created or such link state change can be made. Either the
> > +   sink or source (pad, stream) pair or the combination of the sink and source
> > +   is not supported by the hardware, or no multiple routes from or to the same
> > +   (pad, stream) pair are supported.
> 
> If I'm not mistaken this only applies to VIDIOC_SUBDEV_S_ROUTING, so I
> would mention that. Also ENXIO is not returned by the core but by
> drivers, so I would not limit the possible cases where ENXIO is
> returned by making examples.
> 
> What about a simpler:
> 
> +ENXIO
> +   The application requested routes cannot be created or the state of
> +   the specified routes cannot be modified. Only returned for
> +   ``VIDIOC_SUBDEV_S_ROUTING``.

Sounds reasonable. I'll use this in the next version.

> 
> >
> >  E2BIG
> >     The application provided ``num_routes`` for ``VIDIOC_SUBDEV_S_ROUTING`` is

-- 
Regards,

Sakari Ailus

