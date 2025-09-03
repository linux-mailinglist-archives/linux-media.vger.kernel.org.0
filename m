Return-Path: <linux-media+bounces-41709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6744BB423D4
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 16:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 228105826F2
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 14:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DD51FBEA6;
	Wed,  3 Sep 2025 14:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AjdReMQV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F831F461A
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 14:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756910129; cv=none; b=LZu90gn+eDWfgmHG6rUf51gY0fE6aDsbgjIMdjcntrQOxJtThicV7Sq5hNxDR6/5dW/RzstZ7NYRxPgnzfBXIT9MygteZWDycZevc9hOsJDyCD3vftfEXyINkmssd6AvZu63HENuqATT31ew5voZPyYWZOiHPZqXRhKg6HP5iao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756910129; c=relaxed/simple;
	bh=GFugPUcZ2/uHq0kCIV5aNrTUYui+XLiP8kPe9IgGXkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpigbwpNV7VGbq+lxmrLMv16727Nvc64R+xg8h/sEggoClv5bG1EGBeI85TpaypZfTz+vHN+ShUZY+oWDIvVF39joKuXqcdK27bo+ekXbkYXKnCDi/Uqt51adoRImV3Ho0WWJ5I6o4fQVet9xR9Tc//aEvgxE30ZzJ/Hxz39u9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AjdReMQV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756910128; x=1788446128;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GFugPUcZ2/uHq0kCIV5aNrTUYui+XLiP8kPe9IgGXkI=;
  b=AjdReMQVg9jN6HhRZZ+RU93mZmYKhwe7MrCw6RgLF5kc3GLLxo1SRLf8
   AtkUKK+rCBf6Nanf05Bca/7y9+KEY3/3gZqGfP3xj29ErxmKA9YLvxIUW
   9b7ruOcyG836g+m4y6sn49u+diSkMu2gg1EMtjUqtwRIAMTB9o4+dUOK7
   4nLcV4DI8Uf0zLdoaEBzmz3HgrkmiVQA4wY3TLyqXRCGkq4CThjndLVlw
   P5rAWAkXlK9NvcO+RgKfYQl07RA3DZKIUAuwqU2xVOyxKZMdjGpk3sScf
   Hkah6RRf+J5krGKNR0DPuP+CPtvx9sfneMEPKfhWtnjNa2D+UOcWe/a/i
   w==;
X-CSE-ConnectionGUID: T68rdOGPSSm13Sgc3cWabw==
X-CSE-MsgGUID: mPAiLT3ySbSDBvUZeoemTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76828305"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="76828305"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 07:35:27 -0700
X-CSE-ConnectionGUID: RWLfhw1BTkOU22v1ryStrA==
X-CSE-MsgGUID: dHlamWsTQfmOr0DI9dvZmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="172440206"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.204])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 07:35:21 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AFDF211F99F;
	Wed, 03 Sep 2025 17:35:18 +0300 (EEST)
Date: Wed, 3 Sep 2025 17:35:18 +0300
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
Subject: Re: [PATCH v11 17/66] media: uapi: Add new media bus codes for
 generic raw formats
Message-ID: <aLhSJqZx3WVfyUbw@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-18-sakari.ailus@linux.intel.com>
 <httktoswdeltortwoqn5hllzjwtb3prjoe2tigx7u4x6ojdpwr@misyxjdfk3lb>
 <aLgKDYgjx5opEi1Q@kekkonen.localdomain>
 <20250903143215.GL3648@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903143215.GL3648@pendragon.ideasonboard.com>

On Wed, Sep 03, 2025 at 04:32:15PM +0200, Laurent Pinchart wrote:
> On Wed, Sep 03, 2025 at 12:27:41PM +0300, Sakari Ailus wrote:
> > On Mon, Sep 01, 2025 at 04:12:33PM +0200, Jacopo Mondi wrote:
> > > On Mon, Aug 25, 2025 at 12:50:18PM +0300, Sakari Ailus wrote:
> > > > Add new media bus codes for generic raw formats that are not specific to
> > > > the colour filter array but that simply specify the bit depth. The layout
> > > > (packing) of the data is interface specific.
> > > >
> > > > The rest of the properties of the format are specified with controls in
> > > > the image source.
> > > >
> > > > The mbus codes added by this patch have bit depth of 8, 10, 12 and 14.
> > > 
> > > Same as per the pixel formats, your branch contains
> > > "media: uapi: Add more media bus codes for generic raw formats"
> > > 
> > > Should you squash it in ?
> > 
> > Related to my comment on bit depths and what we know of CSI-2 receiver
> > implementations, no. But let me know if there's a need to further discuss
> > this.
> > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  .../media/v4l/subdev-formats.rst              | 27 +++++++++++++++++++
> > > >  include/uapi/linux/media-bus-format.h         |  6 +++++
> > > >  2 files changed, 33 insertions(+)
> > > >
> > > > diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > index 9ef1bc22ad9c..1a51b5c817f1 100644
> > > > --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> > > > @@ -3434,6 +3434,33 @@ organization is given as an example for the first pixel only.
> > > >
> > > >      \endgroup
> > > >
> > > > +Generic raw formats on serial interfaces
> > > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > +
> > > > +Those formats transfer (largely) unprocessed raw pixel data typically from raw
> > > 
> > > I would remove "(largely) unprocessed", mostly because I'm not sure
> > > what you mean here.
> > 
> > I'm fine with removing that.
> > 
> > > > +camera sensors using Bayer and other Colour Filter Arrays (CFAs) on serial
> > > > +interfaces. The packing of the data on the bus is determined by the hardware,
> > > > +however the bit depth is still specific to the format.
> > > > +
> > > > +.. tabularcolumns:: |p{2.0cm}|p{4.0cm}|p{11.3cm}|
> > > > +
> > > > +.. cssclass:: longtable
> > > > +
> > > > +.. flat-table:: Generic raw formats on serial buses
> > > > +    :header-rows:  1
> > > > +    :stub-columns: 0
> > > > +    :widths:       1 1
> > > > +
> > > > +    * - Format name
> > > > +      - Bit depth
> > > > +    * - MEDIA_BUS_FMT_RAW_8
> > > > +      - 8
> > > > +    * - MEDIA_BUS_FMT_RAW_10
> > > > +      - 10
> > > > +    * - MEDIA_BUS_FMT_RAW_12
> > > > +      - 12
> > > > +    * - MEDIA_BUS_FMT_RAW_14
> > > > +      - 14
> > > 
> > > Should we now say in the "Bayer Formats" section that the existing
> > > media bus codes that convey the color components ordering are now
> > > superseded by these ones ?
> > 
> > I can add a note that new drivers need to use these codes but may use older
> > mbus codes, too. I'd add that to the camera sensor driver documentation
> > though.
> 
> Agreed. Let's make the new formats mandatory for new drivers, an the old
> formats optional. Implementing the old formats is required when porting
> existing drivers to new formats, but I would discourage it for new
> drivers in order to get userspace to move forward.

I'll also add that receiver drivers should be amended with support for the
new formats instead of adding support for the old ones in the sensor
drivers. The latter is likely much easier in any case.

-- 
Sakari Ailus

