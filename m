Return-Path: <linux-media+bounces-50559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B7ED18F9E
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 13:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D640130AACE4
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 12:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A3B3904D1;
	Tue, 13 Jan 2026 12:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bL2p5yi4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C8238F25F
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 12:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768308221; cv=none; b=kAhRUXMMSstC79nmZ+BepxU8oSsmrE6KOn1ppG79FPdilb/2Oc0+uJt7yQ6JPZM2vfE37Osgy+xxJCRVAb/54U6bGbmXD0j0A26msl6h5b4YlLpOlavD8S71+YXRuT4dbDvRJc6DBAFidCOV/EH+fgL9pF0df9xikc8Qhep5RCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768308221; c=relaxed/simple;
	bh=qalO0lmqFPpl3f8WJHLZRDipvbNVgrOShJncr1kAZIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YaNDoSUL/x4Hzi8dJXmbBxQVWz3Il0AumHXstQCVUZa8oG4MTb7bJFaOu+nrh42cBhQxwjK9t9v10ejbybreDEbCKm46hVnXcLYHC3v6SvgiDfxUMsIzp7kvywLU1QJcgHjDoRK+br1Ml++meSnlS6SMoTa8YYr6BNKeVo4IDPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bL2p5yi4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768308220; x=1799844220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qalO0lmqFPpl3f8WJHLZRDipvbNVgrOShJncr1kAZIw=;
  b=bL2p5yi4k7bPkmP94Mc2eoqbUO/BWS9JSVLAinxaZ0jxlIJs6FaADZLG
   MAO009g27JGyK+txNKpH2Ra94SyfhDzGti8W6xM/4s5G58Pdl7p5TFXeE
   dhzbWdWoMZlbjBmZm3/iOdEFoi8vPy9vkiE5jljyiVXJqi5qhrVw420r9
   wIRAXL5kuJlyIQFeyhZDe0VbgUFKquGNzrYHlnAYNKpGTt+A4SxA6KLSy
   xb1nTCFgMO+nE4/+fF1k0J7GU3kUkMqdR80QVmDz7ILWLzvF35o/T4JRE
   XD65/DnDsJRxVLvI9604ulZt1YbrGU+hR806+axSIEnVilp8mBglStV92
   A==;
X-CSE-ConnectionGUID: +2vo5HPOQKeJ4Cf4dWA92g==
X-CSE-MsgGUID: 7ynGX40xSim2UraXs0mNDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69670241"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69670241"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 04:43:39 -0800
X-CSE-ConnectionGUID: Jf1ebyTURemR4NSLX765IQ==
X-CSE-MsgGUID: N3EtPzL+RG+OxGAA6VBXsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208886412"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.182])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 04:43:33 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F0E7611F9B2;
	Tue, 13 Jan 2026 14:43:30 +0200 (EET)
Date: Tue, 13 Jan 2026 14:43:30 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
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
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 16/64] media: uapi: Add new media bus codes for
 generic raw formats
Message-ID: <aWY98p8WXWUeMutb@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-17-sakari.ailus@linux.intel.com>
 <789b4ddc-f7f9-4c0d-8bef-cedc4dea5186@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <789b4ddc-f7f9-4c0d-8bef-cedc4dea5186@nxp.com>

Hi Mirela,

On Wed, Jul 23, 2025 at 01:12:33AM +0300, Mirela Rabulea wrote:
> Hi Sakari,
> 
> On 6/19/25 14:57, Sakari Ailus wrote:
> > 
> > 
> > Add new media bus codes for generic raw formats that are not specific to
> > the colour filter array but that simply specify the bit depth. The layout
> > (packing) of the data is interface specific.
> > 
> > The rest of the properties of the format are specified with controls in
> > the image source.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   .../media/v4l/subdev-formats.rst              | 40 +++++++++++++++++++
> >   include/uapi/linux/media-bus-format.h         | 10 +++++
> >   2 files changed, 50 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > index 9ef1bc22ad9c..c06d8c83e2b8 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > @@ -3434,6 +3434,46 @@ organization is given as an example for the first pixel only.
> > 
> >       \endgroup
> > 
> > +Generic raw formats on serial interfaces
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +Those formats transfer (largely) unprocessed raw pixel data typically from raw
> > +camera sensors using Bayer and other Colour Filter Arrays (CFAs) on serial
> > +interfaces. The packing of the data on the bus is determined by the hardware,
> > +however the bit depth is still specific to the format.
> > +
> > +The colour components and the native pixel order are determined by the
> > +``V4L2_CID_COLOUR_PATTERN`` control. Whether or not flipping controls
> > +(``V4L2_CID_HFLIP`` and ``V4L2_CID_VFLIP``) affect the pattern is conveyed via
> > +the ``V4L2_CID_COLOUR_PATTERN_MODIFY`` control.
> 
> I am a bit confused, my understanding was that we will use Y formats, did
> something change since your last [RFC v5 11/15] media: Documentation:
> Document luma-only mbus codes and CFA for cameras?
> 
> https://lore.kernel.org/linux-media/20250203085853.1361401-12-sakari.ailus@linux.intel.com/

I think the discussion effectively concluded that re-using luma-only
formats would pose problems for devices that do already support these
formats for various purposes.

> 
> 
> Also, please replace V4L2_CID_COLOUR_PATTERN with V4L2_CID_COLOR_PATTERN.

It'll be V4L2_CID_CFA_PATTERN.

> 
> I don't see any V4L2_CID_COLOUR_PATTERN_MODIFY or
> V4L2_CID_COLOR_PATTERN_MODIFY control.

I'll move the text to the patch adding these controls.


> 
> 
> > +
> > +.. tabularcolumns:: |p{2.0cm}|p{4.0cm}|p{11.3cm}|
> > +
> > +.. cssclass:: longtable
> > +
> > +.. flat-table:: Generic raw formats on serial buses
> > +    :header-rows:  1
> > +    :stub-columns: 0
> > +    :widths:       1 1
> > +
> > +    * - Format name
> > +      - Bit depth
> > +    * - MEDIA_BUS_FMT_RAW_8
> > +      - 8
> > +    * - MEDIA_BUS_FMT_RAW_10
> > +      - 10
> > +    * - MEDIA_BUS_FMT_RAW_12
> > +      - 12
> > +    * - MEDIA_BUS_FMT_RAW_14
> > +      - 14
> > +    * - MEDIA_BUS_FMT_RAW_16
> > +      - 16
> > +    * - MEDIA_BUS_FMT_RAW_20
> > +      - 20
> > +    * - MEDIA_BUS_FMT_RAW_24
> > +      - 24
> > +    * - MEDIA_BUS_FMT_RAW_28
> > +      - 28
> 
> This table does not look very useful, bit depth is obvious from format name.

I think we still should have it for the sake of completeness.

-- 
Kind regards,

Sakari Ailus

