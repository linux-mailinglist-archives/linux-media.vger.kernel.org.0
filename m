Return-Path: <linux-media+bounces-41651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F33B41AF6
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 12:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3E3D16F217
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 10:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA4D2D3EDA;
	Wed,  3 Sep 2025 10:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZo4/5uI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB66199252
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 10:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756893798; cv=none; b=NTTVh33oU6mjidgAhCxwY7b0dGnENZbgR3JS8d0zsiE9ElO+rIUG9Fi1TfmfTxQ/Avi4Dx7if3Z2b5RVSmKLntXmON3Qsu162EQH7VuVAwke6TN9yFBMA/JVmRBne+AzkmkT8C66PrYWnw7oGwlLUa6a9DyqWadD96vZ1rvBi3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756893798; c=relaxed/simple;
	bh=5B0xuP0sxGyRh2XbJCVlD5lzzmRW2gZv/z2zbb2aAPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvL4NNyXlCPVPA6A/jwzTkjOp1MWNczLraZQ/vhBQvXepEuRhsNc91nB2Wt6NKjMAMeyJNSxInk2OClBsyVi7GAv6rdMCWtiqVG6GXJo5vWpMPEP2EIhDj6IklH/j+JA3rv79jOMJd9u+xoDz6SxGj+0LJHfcYvZRPZVgKG1CW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WZo4/5uI; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756893793; x=1788429793;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5B0xuP0sxGyRh2XbJCVlD5lzzmRW2gZv/z2zbb2aAPA=;
  b=WZo4/5uIHjQGJzTBGJBopRUEcHiPc5ciC4ugO0vnNnzNDyFBEPywOcNP
   LYfmWgIyYEcstV1HT6DPGUcXZow5/WPanZqHadO6p/Bxx//YrA8KgbTmT
   +YdooWwOGUVKj9N4S1cXBi/qimQVynHSTCj6IL+TQy66+jGjZvsskcem9
   jSqehRXICNL+GyEBt1Gf6Kw//tOhklTL0SbYKpMgJH8FlOZlDYr7pFEVo
   uTZH4HpstZyF4GlKOVmQy+LqywdUYcti1tWsmx9m6e92/hZhZpXNYFBzN
   GhoT2J+fOuyQ59PQD+Z10P0bbgwFMFcV3G63dJjWoGGiYiGlC576GXnew
   Q==;
X-CSE-ConnectionGUID: ccoQWV3zTcGx8oFQb6MkpA==
X-CSE-MsgGUID: xQpzujNsTx2T1s1sSB9iHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="62844027"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="62844027"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 03:03:12 -0700
X-CSE-ConnectionGUID: otx7oUwVQrWx8RmyWsEk/Q==
X-CSE-MsgGUID: dBoSh4y/RDS3Ad0uwCaRew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="171116305"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.204])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 03:03:05 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1FF5F11F99F;
	Wed, 03 Sep 2025 13:03:01 +0300 (EEST)
Date: Wed, 3 Sep 2025 13:03:01 +0300
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
Subject: Re: [PATCH v11 20/66] media: Documentation: Reference COLOR_PATTERN
 control in raw format docs
Message-ID: <aLgSVXZ5XzidPa_x@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-21-sakari.ailus@linux.intel.com>
 <ndc5gt6jyla5hoelwwk4wyy3rqb3ntbppjzsh7hpgevcd36ewo@d5n6nr2jxgck>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ndc5gt6jyla5hoelwwk4wyy3rqb3ntbppjzsh7hpgevcd36ewo@d5n6nr2jxgck>

Hi Jacopo,

On Mon, Sep 01, 2025 at 04:21:53PM +0200, Jacopo Mondi wrote:
> On Mon, Aug 25, 2025 at 12:50:21PM +0300, Sakari Ailus wrote:
> > Add a reference to the V4L2_CID_COLOR_PATTERN control in the generic raw
> > pixelformat documentation.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/v4l/ext-ctrls-image-source.rst         | 2 ++
> >  Documentation/userspace-api/media/v4l/subdev-formats.rst       | 3 +++
> >  2 files changed, 5 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > index b19aaaffbce0..0fcd60d8c621 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> > @@ -93,6 +93,8 @@ Image Source Control IDs
> >      is reported as being (say) 128, then a value of 192 would represent
> >      a gain of exactly 1.5.
> >
> > +.. _image-source-control-color-pattern:
> > +
> >  ``V4L2_CID_COLOR_PATTERN (integer)``
> >      This control determines the color components and native pixel order in the
> >      sensor's CFA (Color Filter Array) when used in conjunction with
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > index e77b4ad19737..77571adeb21e 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > @@ -3444,6 +3444,9 @@ camera sensors using Bayer and other Colour Filter Arrays (CFAs) on serial
> >  interfaces. The packing of the data on the bus is determined by the hardware,
> >  however the bit depth is still specific to the format.
> >
> > +The colour components and the native pixel order are determined by the
> 
> Isn't
>   +The native colour components ordering are determined by ...
> 
> As I don't see how "colour components and the native pixel order"
> information can be conveyed separately.

How about:

The native Colour Filter Array (CFA) pattern is determined by the

> 
> Up to you
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks!

> 
> Thanks
>    j
> 
> > +:ref:`V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>` control.
> > +
> >  .. tabularcolumns:: |p{2.0cm}|p{4.0cm}|p{11.3cm}|
> >
> >  .. cssclass:: longtable

-- 
Kind regrads,

Sakari Ailus

