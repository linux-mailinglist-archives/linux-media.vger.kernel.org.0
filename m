Return-Path: <linux-media+bounces-50926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB219D3890F
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 23:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D84130AFF0D
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 22:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942182F546D;
	Fri, 16 Jan 2026 22:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lukoCyxw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA36B27815D
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 22:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768601024; cv=none; b=k4g8vorQuSnjy9w++z/TE6D3JaGT/54sqEsOaFGpElO3MoFGLG06oRybpdAwenpk4NLRGFr+hdjE7KfgMk5HX8wUEYJboU9gNtvpaunRHr6k83Qg6vrXPu8kT+VR2tAY+Q8WG+qlqdwYr1SeZonWK0nwiDsHcF9sBfyhHn1HbLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768601024; c=relaxed/simple;
	bh=rLx5q4Q+wtplJhuz/WtXt4+9Org4GDbi34TYvGFYyXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfw+rWjWFtwn6/C2QedfJDVOKiBEevI+06xXkOIAsk1Z0+4ICb+4lffpXOoDNXAlwv7D43CAiPJaoEwqPN0CZTxiS9/45Os0zaCnM9OzgY9al2fVLTd8oPdbih09RM3vwL+YcNNu8u51JvZdltKSyp4BQCP5jn965Xlqckq36EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lukoCyxw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768601022; x=1800137022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rLx5q4Q+wtplJhuz/WtXt4+9Org4GDbi34TYvGFYyXA=;
  b=lukoCyxwJicsH+LayGU5C5EZkBl4xdjerNm0WW0sDyJBJYdUpg79qRK9
   GdSKvo5yxKfBrosYt1V5mn0g4wQE/496hB0FKBxehi5D2YovpC1+Y+zD5
   pA5H0CvIr8Tcmeuv5QeOr3y3cn7H3uY1xdCri4xU2ac1XfXOcqoQK7w/T
   scckI8/0VEaLBXgFcFGfrmQ0FumLUq6bNGFBNMCYOFKWzDMSIBbQT6Vmd
   dzY/0A8mGT1MGC976T18ksBWcuYVhKekS4XkTlW9tc2WdvSLEjivOBkn0
   sieY/wYL8W/uPkmfJ+cOCSSiDSxzbS/Ea/EOGotrXCkhZJ+TszsbkRl3R
   w==;
X-CSE-ConnectionGUID: ec0U8OcuSYiX0zJpwaNeHw==
X-CSE-MsgGUID: HH15+r+9Q+KUezkrLtREqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69971251"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="69971251"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 14:03:41 -0800
X-CSE-ConnectionGUID: AIjKJ9W8Q9KALJKzr+4Pww==
X-CSE-MsgGUID: JH2HA3NXSxGwWSelqtkHjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="205380367"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.214])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 14:03:33 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C6175121202;
	Sat, 17 Jan 2026 00:03:32 +0200 (EET)
Date: Sat, 17 Jan 2026 00:03:32 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
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
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 39/66] media: Documentation: Add subdev configuration
 models, raw sensor model
Message-ID: <aWq1tHeeQGmcxjqD@kekkonen.localdomain>
References: <kblfpuqfj2d6vkagspnqdhztno2js3wljdrsv2wpeywuwyzg5x@xt7rjhh5wt76>
 <r3kv25lxbyjtuufb2ze27wp5gbqnbgnps2ytk2gy2qkaeiijdd@ydn4ptkze2qp>
 <aN_MdmDhQPyLnQqD@kekkonen.localdomain>
 <zq3gzieoqd4eieghjetm6sus5s7i6niplommnubl4d4rskbhra@v7gslcsg5hce>
 <mseqfltfao5jqubs22asrzzrj2tnsf5bdmlvsmncwj4ss3gxmu@wk2lmramiy3a>
 <176008954951.211618.7730648133265251067@localhost>
 <176009379794.935713.4919963263447609305@ping.linuxembedded.co.uk>
 <aWjXzDXLxG7YyCY6@kekkonen.localdomain>
 <176851117186.98704.5427092951514812674@localhost>
 <176857477280.5324.260292878127292345@localhost>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176857477280.5324.260292878127292345@localhost>

Hi Stefan,

On Fri, Jan 16, 2026 at 03:46:12PM +0100, Stefan Klug wrote:
> Hi Sakari,
> 
> Quoting Stefan Klug (2026-01-15 22:06:11)
> > Hi Sakari,
> > 
> > Quoting Sakari Ailus (2026-01-15 13:04:28)
> > > Hi Kieran, Stefan, Jacopo,
> > > 
> > > On Fri, Oct 10, 2025 at 11:56:37AM +0100, Kieran Bingham wrote:
> > > > Quoting Stefan Klug (2025-10-10 10:45:49)
> > > > > Hi Sakari, hi Jacopo,
> > > > > 
> > > > > Quoting Jacopo Mondi (2025-10-07 16:01:11)
> > > > > > Hi again Sakari,
> > > > > >    cc Kieran and Stefan
> > > > > > 
> > > > > > Stefan and Kieran brought to my attention a use case I would like to
> > > > > > discuss with you
> > > > > > 
> > > > > > On Fri, Oct 03, 2025 at 03:25:19PM +0200, Jacopo Mondi wrote:
> > > > > > > Hi Sakari,
> > > > > > >
> > > > > > > On Fri, Oct 03, 2025 at 04:15:34PM +0300, Sakari Ailus wrote:
> > > > > > > > Hi Jacopo,
> > > > > > >
> > > > > > > [snip]
> > > > > > >
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > A recent discussion on libcamera made me wonder a few things
> > > > > > > > >
> > > > > > > > > https://patchwork.libcamera.org/patch/24547/
> > > > > > > > >
> > > > > > > > > In the current world (pre-RAW sensor model) the situation can be
> > > > > > > > > summarized as
> > > > > > > > >
> > > > > > > > > TGT_NATIVE_SIZE = full pixel array (readable and non readable)
> > > > > > > > > TGT_CROP_BOUNDS = readable pixel array (visible and non visibile pixels)
> > > > > > > >
> > > > > > > > Crop bounds is generally the same as native size.
> > > > > > > >
> > > > > > >
> > > > > > > I checked two sensors datasheet for this yesterday and both of them
> > > > > > > had parts of the pixel array that cannot be read out
> > > > > > >
> > > > > > > > > TGT_CROP_DEFAULT = visible pixels
> > > > > > > >
> > > > > > > > The default could exclude not-so-great pixels, too.
> > > > > > > >
> > > > > > >
> > > > > > > ok, suggested pixel array area used for image capture purposes then
> > > > > > >
> > > > > > > > > TGT_CROP = analgoue crop
> > > > > > > >
> > > > > > > > This could include digital crop as well.
> > > > > > > >
> > > > > > >
> > > > > > > Yes it might, not all sensor drivers behaves the same indeed
> > > > > > >
> > > > > > > > >
> > > > > > > > > where:
> > > > > > > > > - visibile = pixels used for image capture purpose
> > > > > > > > > - non-visible = optically black, dummies etc
> > > > > > > > >
> > > > > > > > > With the RAW sensor model:
> > > > > > > > >
> > > > > > > > > format(1/0) = readable pixel array (visible and non visible)
> > > > > > > > > TGT_CROP_DEFAULT(1/0) = visible pixel area
> > > > > > > > > TGT_CROP(1/0) = analogue crop
> > > > > > > > > TGT_COMPOSE(1/0) = binning/skipping
> > > > > > > > >
> > > > > > > > > Have we lost the ability to report the full pixel array size (readable
> > > > > > > > > and not readable) ? Is this intentional ? As if pixels cannot be read
> > > > > > > > > out they basically do no exist, and the information on the actual
> > > > > > > > > number of pixels (including non readable ones) should be kept
> > > > > > > > > somewhere else (like the libcamera sensor properties database) ?
> > > > > > > >
> > > > > > > > I'd keep this information in the user space if needed. There's little
> > > > > > > > software could presumably do with this information.
> > > > > > > >
> > > > > > >
> > > > > > > Agreed, there is no value I can think of in having this information in
> > > > > > > drivers
> > > > > > >
> > > > > > 
> > > > > > So, Kieran and Stefan are working with a sensor whose driver was
> > > > > > initially upstreamed with a wrong "readable pixel array"
> > > > > > (TGT_CROP_BOUNDS). The developer later realized there was more of the
> > > > > > pixel array to read and there was a use for the non-image pixels like
> > > > > > OB ones.
> > > > > > 
> > > > > > With the current model this is fine (sort of), as all rectangles are
> > > > > > expressed with the TGT_NATIVE size reference. TGT_BOUNDS might
> > > > > > increases but TGT_CROP_DEFAULT and TGT_CROP are still valid both in the
> > > > > > driver but also in userspace, which might have encoded some known
> > > > > > "tested" configurations.
> > > > > > 
> > > > > > With the new model we lose the information reported by TGT_NATIVE and
> > > > > > all rectangles will be expressed with the format on 1/0 as reference.
> > > > > > If the format changes because we later find out there were portions of
> > > > > > the pixel array that could have been read out, all other rectangles
> > > > > > will have to change as well, both in the driver (which is ok-ish) but
> > > > > > also in userspace, which we have no control on.
> > > > > > 
> > > > > > Stefan and Kieran could elaborate more on this, but basically, the
> > > > > > physical array is the only fixed reference we could actually count on.
> > > > > > Other rectangles, are subject to the driver developer understanding of
> > > > > > how the device work, which as we know very well, can change over time.
> > > > > > 
> > > > > > Now, if you agree this is something to be concerned on, I presume the
> > > > > > fix is quite easy
> > > > > > 
> > > > > >          format(1/0) = physical pixel array size
> > > > > >          TGT_CROP_BOUNDS(1/0) = readable pixel array (visible and non visible)
> > > > > >          TGT_CROP_DEFAULT(1/0) = visible pixel area
> > > > > >          TGT_CROP(1/0) = analogue crop
> > > > > >          TGT_COMPOSE(1/0) = binning/skipping
> > > > > > 
> > > > > > which basically only require re-introducing the use of CROP_BOUNDS in
> > > > > > the RAW camera model specification.
> > > > > 
> > > > > Thanks Jacopo for writing that up. Maybe a little addition on that
> > > > > matter. To our (especially Kierans) experience all the rectangles tend
> > > > > to be unexpectedly difficult to handle when you try to configure the
> > > > > sensors in a pixel perfect manner (having binned and non binned modes
> > > > > cover exactly the same area in all possible flipping configurations).
> > > > > The datasheets I'm aware of use the physical pixel array as common
> > > > > coordinate system to describe the geometry. Adding the readable pixel
> > > > > array as "artificial" coordinate system makes it difficult to match the
> > > > > values reported by a v4l driver with the datasheets at hand.
> > > > > 
> > > > > Another time where this comes into play is lens shading correction where
> > > > > you would want to describe the LSC against one reference coordinate
> > > > > system that ideally never ever changes.
> > > > > 
> > > > > To add to the confusion I'd love to have another rectangle added to the
> > > > > list. I don't have a proper name for it. The intent would be to
> > > > > distinguish between the "readable pixel array" and the "light exposed
> > > > > pixel array". So the list would become:
> > > > > 
> > > > >     format(1/0) = physical pixel array size
> > > > >     TGT_CROP_BOUNDS(1/0) = readable pixel array (visible and non visible)
> > > > >     TGT_CROP_VISIBLE(1/0) = visible pixel area including "flesh" for ISP
> > > 
> > > Carnivorous ISPs?
> > 
> > Yes, beware! :-)
> > 
> > > 
> > > > >     TGT_CROP_DEFAULT(1/0) = Recommended "good" pixels
> > > 
> > > How often is this known? Or would you rely on what the vendor tells?
> > 
> > We had a brief discussion about that internally. Some datasheets contain
> > that information by surrounding the "Recording area" with a margin
> > labeled as "Effective margin for color processing". I don't have numbers
> > how often that is the case though. As it doesn't add much technical
> > value to the kernel we could set TGT_CROP_DEFAULT to the above mentioned
> > TGT_CROP_VISIBLE and keep the information about the color processing
> > margin outside the kernel, e.g. in libcamera.
> 
> Jacopo told me that this wasn't completely clear and rereading it, he is
> right. So to clarify: The idea is to skip the introduction of
> TGT_CROP_VISIBLE and just include the processing margin in
> TGT_CROP_DEFAULT. The less rectangles, the better.

Right. So compared to v11, we're introducing CROP_BOUNDS for this purposes
and re-purposing the format to tell the physical size of the pixel array,
whether some of the pixels can be captured or not?

That seems reasonable to me.

> 
> > 
> > The only downside I see there is that (to my knowledge) it will be
> > difficult to guarantee that really all the pixels inside
> > TGT_CROP_VISIBLE are good. That's ok for libraries like libcamera that
> > will default to cutting off some margin after processing, but it might
> > be a problem for simple applications that just try capture the
> > CROP_DEFAULT. But maybe these applications do not exist at all :-)
> > 
> > > 
> > > > >     TGT_CROP(1/0) = analogue crop
> > > > >     TGT_COMPOSE(1/0) = binning/skipping
> > > > > 
> > > > > The idea is to be able to capture a larger image from the sensor for ISP
> > > > > processing and then cut it down to CROP_DEFAULT. This way we can prevent
> > > > > interpolation seams at the edges. Maybe the naming is bad and we should
> > > > > make CROP_BOUNDS the recommended area and add CROP_READABLE to denote
> > > > > the readable pixels...
> > > 
> > > CROP_BOUNDS really needs to be the bounding rectangle for everything.
> > > CROP_DEFAULT and NATIVE_SIZE are still up to definition, to a degree.
> > > 
> > > Have you tried capturing the optical black pixels on different sensors?
> > 
> > Yes, we did at least on the imx335 and imx283. Kieran is more in the
> > details there...
> > 
> > > 
> > > CCS specifies optical black pixel capture separately from the visible
> > > pixels and support also different VC, DT, depending on sensor capabilities;
> > > cropping results in capturing optical black pixel on the rows and columns
> > > specified for the crop area. In other words, the selection API isn't
> > > necessarily how optical black pixel capture is configured, at least for
> > > CCS.
> > 
> > Yes, that is a bit of a pain. Being able to select the VC or DT doesn't
> > make things easier. Some SoCs (e.g. imx8mp) are not able to capture
> > separate VCs or DTs. So to get to the information the only way is to go
> > through the image stream. Also for some use-cases like extra long

CCS also supports putting them to the image data stream, other
implementations may have less configurability (or it's not known how to
configure them properly).

> > exposures in astro-photography it might be useful to have the OB in the
> > image data for postprocessing.  (The last case is a bit made up as I
> > don't know much about astro-photography tbh). 
> > 
> > So I believe we should keep the option to capture OB over the image
> > stream.

I agree. The level of the noise can be determined from these pixels so
definitely in some use cases it's important.

> > 
> > > 
> > > Let's assume the case of the sensor where you find, after the driver has
> > > been upstreamed, that there are extra columns and rows of pixels beyond the
> > > left and top of the image. How would you modify the selection rectangles
> > > and the format to allow capturing image data from that area? Can you avoid
> > > affecting the existing userspace?
> > 
> > That would mean that the TGT_CROP_BOUNDS and or TGT_CROP_DEFAULT
> > changes. The assumption is that the native coordinate system (the old
> > TGT_CROP_NATIVE_SIZE) stays in place so the application can still use
> > all the tuning that was done relative to the native coordinate system.
> > As the TGT_CROP_BOUNDS from the first version has top/left coordinates >
> > 0 there is room to enlarge the TGT_CROP_BOUNDS in that direction.
> > 
> > Sure, this does not work if the initial driver didn't specify
> > TGT_CROP_BOUNDS with the correct top/left offset. It also does not guard
> > against really wrong datasheets or arbitrary bugs. But allows to
> > transparently improve in situations where the first version implements
> > the "default FullHD setup from the vendor" and later a improved version
> > of the driver allows access to the additional margins around.

-- 
Kind regards,

Sakari Ailus

