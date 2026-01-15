Return-Path: <linux-media+bounces-50776-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 316BED24614
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 13:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10115303B469
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 12:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F0C38BF6B;
	Thu, 15 Jan 2026 12:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGobSAz1"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD7B361DA9
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 12:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768478680; cv=none; b=O+JdS8ANREpDtkktesI7yX7ljZ+A+nBpe/7lhBLNGsRnHNZvfTdc2H2KDCTivYSWt29sps07DIbLONyICErF2NccB7WiLPP5fgGWAuWGsINbFwemq7KcYAyZhkKMm0Ej4e6uewHPNEok9G7msnGrPub+8Ql3RS7UCQe79zDGRoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768478680; c=relaxed/simple;
	bh=I03m3jyn863svnkjyptTDxXDJ6gpf/cmWunYhvPzvuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRRK8ZcXwiSzlDXyDW2M9QofIAMm8BLeBjgtokBQeLY1zqy/gdFU9+NrBsTkjVFGtU3m4Sg6f80KiX83XVldoI37K7B9ZAvKoUbM71MaBEjtp+/pUR6pSJTccntmLMdT25puf0AIyNPT6bzr7mLLUfQynC2VeiOugklJSp0N0e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGobSAz1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768478678; x=1800014678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I03m3jyn863svnkjyptTDxXDJ6gpf/cmWunYhvPzvuA=;
  b=PGobSAz1DOVgbA4D02VK8PbOSig1ocYdNNCjRBCBumWgeiiPkpNbGxou
   FmYK1TH7imOj48tHJhPyBwlqs/PjH9LIzUJY4Y1S7011aJZnnHl+gJ+qu
   m9RFKmFNI1u4EbmqSuZRi3dhBe1rPsEjw1OuF7Lp2UwTJir/Zc0VQ7vrQ
   Q/kLLWTnAy+Ornoeal+FCQmsnnHyiUxyiLpQCrRsH571J8dL/AlBerUC1
   cIqxcp41xpyfXQwTD0AJ9MMdXEM39l9N9vUPDJVcTkoVD4Y9ucwdWeNhK
   YQa/MLdaW6oTKW5noVOG8HSvPVB6fNKa0R6KSrafKGLKCbux1y7GIXsAP
   Q==;
X-CSE-ConnectionGUID: qzywUZh8S+O8NR8X5tBjnw==
X-CSE-MsgGUID: fgNWPQjLRcin1918bQq6sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69949384"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69949384"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:04:38 -0800
X-CSE-ConnectionGUID: t9wusLz/QH2DDXNlbhciwQ==
X-CSE-MsgGUID: TglXkkBfSVaq+KLRNM4lpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="209083766"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.213])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:04:31 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D6D8C12020E;
	Thu, 15 Jan 2026 14:04:28 +0200 (EET)
Date: Thu, 15 Jan 2026 14:04:28 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
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
Message-ID: <aWjXzDXLxG7YyCY6@kekkonen.localdomain>
References: <aM1J9LsbpueEr30x@kekkonen.localdomain>
 <5fwlztz2q2fewyml774my3sdw3wv5wdhnl6p4mfbubm4erm5ft@sthie2bobklf>
 <aN4lQPK5Mqve2bUI@kekkonen.localdomain>
 <kblfpuqfj2d6vkagspnqdhztno2js3wljdrsv2wpeywuwyzg5x@xt7rjhh5wt76>
 <r3kv25lxbyjtuufb2ze27wp5gbqnbgnps2ytk2gy2qkaeiijdd@ydn4ptkze2qp>
 <aN_MdmDhQPyLnQqD@kekkonen.localdomain>
 <zq3gzieoqd4eieghjetm6sus5s7i6niplommnubl4d4rskbhra@v7gslcsg5hce>
 <mseqfltfao5jqubs22asrzzrj2tnsf5bdmlvsmncwj4ss3gxmu@wk2lmramiy3a>
 <176008954951.211618.7730648133265251067@localhost>
 <176009379794.935713.4919963263447609305@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176009379794.935713.4919963263447609305@ping.linuxembedded.co.uk>

Hi Kieran, Stefan, Jacopo,

On Fri, Oct 10, 2025 at 11:56:37AM +0100, Kieran Bingham wrote:
> Quoting Stefan Klug (2025-10-10 10:45:49)
> > Hi Sakari, hi Jacopo,
> > 
> > Quoting Jacopo Mondi (2025-10-07 16:01:11)
> > > Hi again Sakari,
> > >    cc Kieran and Stefan
> > > 
> > > Stefan and Kieran brought to my attention a use case I would like to
> > > discuss with you
> > > 
> > > On Fri, Oct 03, 2025 at 03:25:19PM +0200, Jacopo Mondi wrote:
> > > > Hi Sakari,
> > > >
> > > > On Fri, Oct 03, 2025 at 04:15:34PM +0300, Sakari Ailus wrote:
> > > > > Hi Jacopo,
> > > >
> > > > [snip]
> > > >
> > > > > > >
> > > > > >
> > > > > > A recent discussion on libcamera made me wonder a few things
> > > > > >
> > > > > > https://patchwork.libcamera.org/patch/24547/
> > > > > >
> > > > > > In the current world (pre-RAW sensor model) the situation can be
> > > > > > summarized as
> > > > > >
> > > > > > TGT_NATIVE_SIZE = full pixel array (readable and non readable)
> > > > > > TGT_CROP_BOUNDS = readable pixel array (visible and non visibile pixels)
> > > > >
> > > > > Crop bounds is generally the same as native size.
> > > > >
> > > >
> > > > I checked two sensors datasheet for this yesterday and both of them
> > > > had parts of the pixel array that cannot be read out
> > > >
> > > > > > TGT_CROP_DEFAULT = visible pixels
> > > > >
> > > > > The default could exclude not-so-great pixels, too.
> > > > >
> > > >
> > > > ok, suggested pixel array area used for image capture purposes then
> > > >
> > > > > > TGT_CROP = analgoue crop
> > > > >
> > > > > This could include digital crop as well.
> > > > >
> > > >
> > > > Yes it might, not all sensor drivers behaves the same indeed
> > > >
> > > > > >
> > > > > > where:
> > > > > > - visibile = pixels used for image capture purpose
> > > > > > - non-visible = optically black, dummies etc
> > > > > >
> > > > > > With the RAW sensor model:
> > > > > >
> > > > > > format(1/0) = readable pixel array (visible and non visible)
> > > > > > TGT_CROP_DEFAULT(1/0) = visible pixel area
> > > > > > TGT_CROP(1/0) = analogue crop
> > > > > > TGT_COMPOSE(1/0) = binning/skipping
> > > > > >
> > > > > > Have we lost the ability to report the full pixel array size (readable
> > > > > > and not readable) ? Is this intentional ? As if pixels cannot be read
> > > > > > out they basically do no exist, and the information on the actual
> > > > > > number of pixels (including non readable ones) should be kept
> > > > > > somewhere else (like the libcamera sensor properties database) ?
> > > > >
> > > > > I'd keep this information in the user space if needed. There's little
> > > > > software could presumably do with this information.
> > > > >
> > > >
> > > > Agreed, there is no value I can think of in having this information in
> > > > drivers
> > > >
> > > 
> > > So, Kieran and Stefan are working with a sensor whose driver was
> > > initially upstreamed with a wrong "readable pixel array"
> > > (TGT_CROP_BOUNDS). The developer later realized there was more of the
> > > pixel array to read and there was a use for the non-image pixels like
> > > OB ones.
> > > 
> > > With the current model this is fine (sort of), as all rectangles are
> > > expressed with the TGT_NATIVE size reference. TGT_BOUNDS might
> > > increases but TGT_CROP_DEFAULT and TGT_CROP are still valid both in the
> > > driver but also in userspace, which might have encoded some known
> > > "tested" configurations.
> > > 
> > > With the new model we lose the information reported by TGT_NATIVE and
> > > all rectangles will be expressed with the format on 1/0 as reference.
> > > If the format changes because we later find out there were portions of
> > > the pixel array that could have been read out, all other rectangles
> > > will have to change as well, both in the driver (which is ok-ish) but
> > > also in userspace, which we have no control on.
> > > 
> > > Stefan and Kieran could elaborate more on this, but basically, the
> > > physical array is the only fixed reference we could actually count on.
> > > Other rectangles, are subject to the driver developer understanding of
> > > how the device work, which as we know very well, can change over time.
> > > 
> > > Now, if you agree this is something to be concerned on, I presume the
> > > fix is quite easy
> > > 
> > >          format(1/0) = physical pixel array size
> > >          TGT_CROP_BOUNDS(1/0) = readable pixel array (visible and non visible)
> > >          TGT_CROP_DEFAULT(1/0) = visible pixel area
> > >          TGT_CROP(1/0) = analogue crop
> > >          TGT_COMPOSE(1/0) = binning/skipping
> > > 
> > > which basically only require re-introducing the use of CROP_BOUNDS in
> > > the RAW camera model specification.
> > 
> > Thanks Jacopo for writing that up. Maybe a little addition on that
> > matter. To our (especially Kierans) experience all the rectangles tend
> > to be unexpectedly difficult to handle when you try to configure the
> > sensors in a pixel perfect manner (having binned and non binned modes
> > cover exactly the same area in all possible flipping configurations).
> > The datasheets I'm aware of use the physical pixel array as common
> > coordinate system to describe the geometry. Adding the readable pixel
> > array as "artificial" coordinate system makes it difficult to match the
> > values reported by a v4l driver with the datasheets at hand.
> > 
> > Another time where this comes into play is lens shading correction where
> > you would want to describe the LSC against one reference coordinate
> > system that ideally never ever changes.
> > 
> > To add to the confusion I'd love to have another rectangle added to the
> > list. I don't have a proper name for it. The intent would be to
> > distinguish between the "readable pixel array" and the "light exposed
> > pixel array". So the list would become:
> > 
> >     format(1/0) = physical pixel array size
> >     TGT_CROP_BOUNDS(1/0) = readable pixel array (visible and non visible)
> >     TGT_CROP_VISIBLE(1/0) = visible pixel area including "flesh" for ISP

Carnivorous ISPs?

> >     TGT_CROP_DEFAULT(1/0) = Recommended "good" pixels

How often is this known? Or would you rely on what the vendor tells?

> >     TGT_CROP(1/0) = analogue crop
> >     TGT_COMPOSE(1/0) = binning/skipping
> > 
> > The idea is to be able to capture a larger image from the sensor for ISP
> > processing and then cut it down to CROP_DEFAULT. This way we can prevent
> > interpolation seams at the edges. Maybe the naming is bad and we should
> > make CROP_BOUNDS the recommended area and add CROP_READABLE to denote
> > the readable pixels...

CROP_BOUNDS really needs to be the bounding rectangle for everything.
CROP_DEFAULT and NATIVE_SIZE are still up to definition, to a degree.

Have you tried capturing the optical black pixels on different sensors?

CCS specifies optical black pixel capture separately from the visible
pixels and support also different VC, DT, depending on sensor capabilities;
cropping results in capturing optical black pixel on the rows and columns
specified for the crop area. In other words, the selection API isn't
necessarily how optical black pixel capture is configured, at least for
CCS.

Let's assume the case of the sensor where you find, after the driver has
been upstreamed, that there are extra columns and rows of pixels beyond the
left and top of the image. How would you modify the selection rectangles
and the format to allow capturing image data from that area? Can you avoid
affecting the existing userspace?

> 
> I think this is important - and in IMX283 - it seems to be exactly what
> the datasheet is ultimately recommending.
> 
> > > What do you think ?
> > 
> > Best regards,
> > Stefan
> > 
> > > 
> > > > > >
> > > > > > All the discussion about readable/non-readable, visible/non-visibile
> > > > > > and active and inactive areas make me think we would benefit from
> > > > > > presenting a small glossary at the beginning of the "Sensor pixel
> > > > > > array size, cropping and binning" paragraph ?
> 
> Oh yes, some sort of nicely interpretable description of "this rectangle
> is expected to be this equivalent set of pixels" would be helpful. I've
> found it so hard to identify which the right rectangle is here :D
> 
> 
> I'm also weary that we might need to find a way to convey the
> relationship between binning mode restrictions/offsets too.
> 
> The IMX283 2x2 and 3x3 binning modes produce offset outputs:
> 
> vwinpos is the coordinate programmed to the sensor to get a position -
> and we have tooling in camshark that lets us determine the exact pixels
> we capture from any mode to see what was really produced by the sensor:
> 
> 
> ```
> 'Sensor Native' ?
> pixel (row)   -8 -7 -6 -5 -4 -3 -2 -1  0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16
> native pixels  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
> 
> 
> vwinpos       -4    -3    -2    -1     0     1     2     3     4     5     6     7     8
> no-binning     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |
> 
> 
> vwinpos             -3          -2          -1           0           1           2      
> /2 binning     |     |     |     |     |     |     |     |     |     |     |     |     |
> 
> 
> vwinpos        0                 1                 2                 3                 4
> /3 binning     |        |        |        |        |        |        |        |        |
> ```
> 
> 
> To fix this - I'm moving the current '0' position for IMX283 to -2 in
> the non binned modes.
> 
> That gives me a coordinate system where at least I can define an
> alignment for 2x2 and 3x3 binning every 12 pixels (as the lowest common
> multiplier).
> 
> But - also murkies the water from the above rectanges as this sensor
> turns out to have 48 lines of pixels (24 bayer pair lines) 'less than
> zero' ... or at least those are the ones that are visible in light. I
> can read further below zero but only for black pixels.
> 
> So in otherwords - I can't even make a corresponding coordinate
> rectangle that exactly matches the 'all readable' pixels or 'all
> illuminated pixels' ... Ayeeeeee...
> 
> My lesson/take on this: Don't trust the datasheets. They lie :D

-- 
Kind regards,

Sakari Ailus

