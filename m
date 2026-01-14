Return-Path: <linux-media+bounces-50696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69216D1EEBE
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 13:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BA85302FA29
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 12:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC80239903B;
	Wed, 14 Jan 2026 12:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FabH+C+m"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845B5393DEB
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 12:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768395309; cv=none; b=ZtD/yvXzJRWiX5DXl0zouwG+YeoTHhL/bBjLka4pDYUjbfh2Nbpqkay9W/fc28lUUnF2H7+b6qGAisaIOActPTsPpFbAIJZ1BO4FxcmUoqmC0tEeH4XC8V6OPwrdvSJnHJOpzrR/UCDBN+0ShqTBmAETtqSQCFKMjC50D3DIDi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768395309; c=relaxed/simple;
	bh=ir+vyFNo5tBlJjQUf+f0ArwFRSe0duKhjIjNuT6TX9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OAPhzurvcCxxXOzO/4n2StgWB/8THzQhc+iGG/J1P3hVQOOj9UmCGC+PZCo6adR+I+G3PPkEN9RJtm+nioNXGylGNKU2v/+Eo9sm3VIbgR9Go0vLJu9UeuyST0TAntjk2oiOhLM2jz+ZMhZr0Ceof+bucjjTSJ8j2OS5IBteW2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FabH+C+m; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768395308; x=1799931308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ir+vyFNo5tBlJjQUf+f0ArwFRSe0duKhjIjNuT6TX9s=;
  b=FabH+C+m6dB0NLHf9kBVXJKO3oTMm+0fcmneox3OIBLxQKl4+berSN73
   x3YNLToBH+eNuwDlyK53Gq5IWPUl9D1K0a1I9jfPVC2uTa46pi1GXBxxc
   lRzBWrY4W0mnG8/kevK5FPrT0fDSAdjzXP2MpGzY0QzWeROqoDiYa58lD
   /fKYJO1Rl9mXrBrPbrV1lJNh+G3nlHtHefLRdopXZ4T+r6G+1/+cEIPwL
   p5uovaQa8QF01XLm5SjEY0poaVGHsVX+hV5/4HdnXlAvcGgeeTz/zKu3n
   ZJIwtElhW8UeB/2dw5OW3yEgBgqQiqhUTzuKZRmf/KlrVghEDfYrcs9W8
   w==;
X-CSE-ConnectionGUID: S0yHp60WQN6e1TDbmomgBg==
X-CSE-MsgGUID: 6yU/nO9KTtSEsHnQ15NY2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80802330"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="80802330"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 04:55:07 -0800
X-CSE-ConnectionGUID: wrsgxbx1Sxyh/lS8GwI7fA==
X-CSE-MsgGUID: 4OV1x73/SbOLOEo+azJ0Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204722916"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.244.116])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 04:55:00 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6B5EB11F9B2;
	Wed, 14 Jan 2026 14:54:57 +0200 (EET)
Date: Wed, 14 Jan 2026 14:54:57 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
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
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 39/66] media: Documentation: Add subdev configuration
 models, raw sensor model
Message-ID: <aWeSIT6MU6bo-cMp@kekkonen.localdomain>
References: <osdr2eavm23pzxrd73v4xscdtaafon3vllhzcg5r6eoqwclsfk@xgfnicn6iboj>
 <aM1J9LsbpueEr30x@kekkonen.localdomain>
 <5fwlztz2q2fewyml774my3sdw3wv5wdhnl6p4mfbubm4erm5ft@sthie2bobklf>
 <aN4lQPK5Mqve2bUI@kekkonen.localdomain>
 <kblfpuqfj2d6vkagspnqdhztno2js3wljdrsv2wpeywuwyzg5x@xt7rjhh5wt76>
 <r3kv25lxbyjtuufb2ze27wp5gbqnbgnps2ytk2gy2qkaeiijdd@ydn4ptkze2qp>
 <aN_MdmDhQPyLnQqD@kekkonen.localdomain>
 <zq3gzieoqd4eieghjetm6sus5s7i6niplommnubl4d4rskbhra@v7gslcsg5hce>
 <mseqfltfao5jqubs22asrzzrj2tnsf5bdmlvsmncwj4ss3gxmu@wk2lmramiy3a>
 <aWZaRsPysHyjY_w0@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWZaRsPysHyjY_w0@zed>

Hi Jacopo,

On Tue, Jan 13, 2026 at 03:46:54PM +0100, Jacopo Mondi wrote:
> Hi Sakari,
>   I take the occasion as I've noticed you're reviving the series
> 
> There was a discussion item we didn't complete last fall, about the
> semantic associated to selection rectangles for RAW camera sensors.
> 
> On Tue, Oct 07, 2025 at 04:01:11PM +0200, Jacopo Mondi wrote:
> > Hi again Sakari,
> >    cc Kieran and Stefan
> >
> > Stefan and Kieran brought to my attention a use case I would like to
> > discuss with you
> >
> > On Fri, Oct 03, 2025 at 03:25:19PM +0200, Jacopo Mondi wrote:
> > > Hi Sakari,
> > >
> > > On Fri, Oct 03, 2025 at 04:15:34PM +0300, Sakari Ailus wrote:
> > > > Hi Jacopo,
> > >
> > > [snip]
> > >
> > > > > >
> > > > >
> > > > > A recent discussion on libcamera made me wonder a few things
> > > > >
> > > > > https://patchwork.libcamera.org/patch/24547/
> > > > >
> > > > > In the current world (pre-RAW sensor model) the situation can be
> > > > > summarized as
> > > > >
> > > > > TGT_NATIVE_SIZE = full pixel array (readable and non readable)
> > > > > TGT_CROP_BOUNDS = readable pixel array (visible and non visibile pixels)
> > > >
> > > > Crop bounds is generally the same as native size.
> > > >
> > >
> > > I checked two sensors datasheet for this yesterday and both of them
> > > had parts of the pixel array that cannot be read out
> > >
> > > > > TGT_CROP_DEFAULT = visible pixels
> > > >
> > > > The default could exclude not-so-great pixels, too.
> > > >
> > >
> > > ok, suggested pixel array area used for image capture purposes then
> > >
> > > > > TGT_CROP = analgoue crop
> > > >
> > > > This could include digital crop as well.
> > > >
> > >
> > > Yes it might, not all sensor drivers behaves the same indeed
> > >
> > > > >
> > > > > where:
> > > > > - visibile = pixels used for image capture purpose
> > > > > - non-visible = optically black, dummies etc
> > > > >
> > > > > With the RAW sensor model:
> > > > >
> > > > > format(1/0) = readable pixel array (visible and non visible)
> > > > > TGT_CROP_DEFAULT(1/0) = visible pixel area
> > > > > TGT_CROP(1/0) = analogue crop
> > > > > TGT_COMPOSE(1/0) = binning/skipping
> > > > >
> > > > > Have we lost the ability to report the full pixel array size (readable
> > > > > and not readable) ? Is this intentional ? As if pixels cannot be read
> > > > > out they basically do no exist, and the information on the actual
> > > > > number of pixels (including non readable ones) should be kept
> > > > > somewhere else (like the libcamera sensor properties database) ?
> > > >
> > > > I'd keep this information in the user space if needed. There's little
> > > > software could presumably do with this information.
> > > >
> > >
> > > Agreed, there is no value I can think of in having this information in
> > > drivers
> > >
> >
> > So, Kieran and Stefan are working with a sensor whose driver was
> > initially upstreamed with a wrong "readable pixel array"
> > (TGT_CROP_BOUNDS). The developer later realized there was more of the
> > pixel array to read and there was a use for the non-image pixels like
> > OB ones.
> >
> > With the current model this is fine (sort of), as all rectangles are
> > expressed with the TGT_NATIVE size reference. TGT_BOUNDS might
> > increases but TGT_CROP_DEFAULT and TGT_CROP are still valid both in the
> > driver but also in userspace, which might have encoded some known
> > "tested" configurations.
> >
> > With the new model we lose the information reported by TGT_NATIVE and
> > all rectangles will be expressed with the format on 1/0 as reference.
> > If the format changes because we later find out there were portions of
> > the pixel array that could have been read out, all other rectangles
> > will have to change as well, both in the driver (which is ok-ish) but
> > also in userspace, which we have no control on.
> >
> > Stefan and Kieran could elaborate more on this, but basically, the
> > physical array is the only fixed reference we could actually count on.
> > Other rectangles, are subject to the driver developer understanding of
> > how the device work, which as we know very well, can change over time.
> >
> > Now, if you agree this is something to be concerned on, I presume the
> > fix is quite easy
> >
> >          format(1/0) = physical pixel array size
> >          TGT_CROP_BOUNDS(1/0) = readable pixel array (visible and non visible)
> >          TGT_CROP_DEFAULT(1/0) = visible pixel area
> >          TGT_CROP(1/0) = analogue crop
> >          TGT_COMPOSE(1/0) = binning/skipping
> >
> > which basically only require re-introducing the use of CROP_BOUNDS in
> > the RAW camera model specification.
> >
> > What do you think ?
> >
> 
> Sorry for dropping the ball on this, but I think the above still
> applies.
> 
> Kieran and Stefan provided good points in their replies to this thread
> on why we should care about the physical sensor size, which if I'm not
> mistaken is now lost with the new proposed model.
> 
> Is the above still a valid suggestion in your opinion ?

Seems reasonable to me. I'll see how to align the patches with this for
v12.

-- 
Kind regards,

Sakari Ailus

