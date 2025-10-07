Return-Path: <linux-media+bounces-43846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9697BC19ED
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 16:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D156188BFCA
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 14:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B74225785;
	Tue,  7 Oct 2025 14:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Xn/3OhpR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E611FE573
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 14:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759845682; cv=none; b=mFOE2iVPT7Ycsfny2v7wLzhwHW+lPU+dkDO8LGjwYD0CDbSSB3LIzHQ5/pTq8XrL636XG8iNcjTiY4umZohzO9+X8JMucNXjNL8hXjgjnO0gkNXXSep54TiBxs7jru5OFbKky/ws5rh8fJMjO3RGPDO5MH5jOApcVgvcOvxexR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759845682; c=relaxed/simple;
	bh=9cc2gzEoGR1+eTN0A12770e2pS2rTrxvhHFd1bcLDdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SgYx9PZKld0fdrjzSJpNFilSurvGx5OpYDbCE0DuHFZRbGsHGQA6pzd/i4ax/viByNMflJQBfzblWg3nPljFmWghuATcbFWV4MvkgSjLPXa22aRu+J2wYTZVfECylTxkG9wXuJWVKmxclsk51uByLtD1U9JZ6951HLokKJCkDY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Xn/3OhpR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E33F16DF;
	Tue,  7 Oct 2025 15:59:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759845581;
	bh=9cc2gzEoGR1+eTN0A12770e2pS2rTrxvhHFd1bcLDdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xn/3OhpRPmUXkLkWwod3Fi2ZHYKZgAVDljhKOXannRr0XcMSk80a7ewg3fmMvIY3+
	 YaObpg1JzNHRTVkgc3h6AnQRPEBMXISxd/DqhJERi8aux/QuA8XB3bcZJX3JnBni9z
	 OO1JYL9m+zPBBQLDEhCnru02Ih0BMczzEzhMJ/7M=
Date: Tue, 7 Oct 2025 16:01:11 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, 
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	"Wang, Hongju" <hongju.wang@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 39/66] media: Documentation: Add subdev configuration
 models, raw sensor model
Message-ID: <mseqfltfao5jqubs22asrzzrj2tnsf5bdmlvsmncwj4ss3gxmu@wk2lmramiy3a>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-40-sakari.ailus@linux.intel.com>
 <osdr2eavm23pzxrd73v4xscdtaafon3vllhzcg5r6eoqwclsfk@xgfnicn6iboj>
 <aM1J9LsbpueEr30x@kekkonen.localdomain>
 <5fwlztz2q2fewyml774my3sdw3wv5wdhnl6p4mfbubm4erm5ft@sthie2bobklf>
 <aN4lQPK5Mqve2bUI@kekkonen.localdomain>
 <kblfpuqfj2d6vkagspnqdhztno2js3wljdrsv2wpeywuwyzg5x@xt7rjhh5wt76>
 <r3kv25lxbyjtuufb2ze27wp5gbqnbgnps2ytk2gy2qkaeiijdd@ydn4ptkze2qp>
 <aN_MdmDhQPyLnQqD@kekkonen.localdomain>
 <zq3gzieoqd4eieghjetm6sus5s7i6niplommnubl4d4rskbhra@v7gslcsg5hce>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <zq3gzieoqd4eieghjetm6sus5s7i6niplommnubl4d4rskbhra@v7gslcsg5hce>

Hi again Sakari,
   cc Kieran and Stefan

Stefan and Kieran brought to my attention a use case I would like to
discuss with you

On Fri, Oct 03, 2025 at 03:25:19PM +0200, Jacopo Mondi wrote:
> Hi Sakari,
>
> On Fri, Oct 03, 2025 at 04:15:34PM +0300, Sakari Ailus wrote:
> > Hi Jacopo,
>
> [snip]
>
> > > >
> > >
> > > A recent discussion on libcamera made me wonder a few things
> > >
> > > https://patchwork.libcamera.org/patch/24547/
> > >
> > > In the current world (pre-RAW sensor model) the situation can be
> > > summarized as
> > >
> > > TGT_NATIVE_SIZE = full pixel array (readable and non readable)
> > > TGT_CROP_BOUNDS = readable pixel array (visible and non visibile pixels)
> >
> > Crop bounds is generally the same as native size.
> >
>
> I checked two sensors datasheet for this yesterday and both of them
> had parts of the pixel array that cannot be read out
>
> > > TGT_CROP_DEFAULT = visible pixels
> >
> > The default could exclude not-so-great pixels, too.
> >
>
> ok, suggested pixel array area used for image capture purposes then
>
> > > TGT_CROP = analgoue crop
> >
> > This could include digital crop as well.
> >
>
> Yes it might, not all sensor drivers behaves the same indeed
>
> > >
> > > where:
> > > - visibile = pixels used for image capture purpose
> > > - non-visible = optically black, dummies etc
> > >
> > > With the RAW sensor model:
> > >
> > > format(1/0) = readable pixel array (visible and non visible)
> > > TGT_CROP_DEFAULT(1/0) = visible pixel area
> > > TGT_CROP(1/0) = analogue crop
> > > TGT_COMPOSE(1/0) = binning/skipping
> > >
> > > Have we lost the ability to report the full pixel array size (readable
> > > and not readable) ? Is this intentional ? As if pixels cannot be read
> > > out they basically do no exist, and the information on the actual
> > > number of pixels (including non readable ones) should be kept
> > > somewhere else (like the libcamera sensor properties database) ?
> >
> > I'd keep this information in the user space if needed. There's little
> > software could presumably do with this information.
> >
>
> Agreed, there is no value I can think of in having this information in
> drivers
>

So, Kieran and Stefan are working with a sensor whose driver was
initially upstreamed with a wrong "readable pixel array"
(TGT_CROP_BOUNDS). The developer later realized there was more of the
pixel array to read and there was a use for the non-image pixels like
OB ones.

With the current model this is fine (sort of), as all rectangles are
expressed with the TGT_NATIVE size reference. TGT_BOUNDS might
increases but TGT_CROP_DEFAULT and TGT_CROP are still valid both in the
driver but also in userspace, which might have encoded some known
"tested" configurations.

With the new model we lose the information reported by TGT_NATIVE and
all rectangles will be expressed with the format on 1/0 as reference.
If the format changes because we later find out there were portions of
the pixel array that could have been read out, all other rectangles
will have to change as well, both in the driver (which is ok-ish) but
also in userspace, which we have no control on.

Stefan and Kieran could elaborate more on this, but basically, the
physical array is the only fixed reference we could actually count on.
Other rectangles, are subject to the driver developer understanding of
how the device work, which as we know very well, can change over time.

Now, if you agree this is something to be concerned on, I presume the
fix is quite easy

         format(1/0) = physical pixel array size
         TGT_CROP_BOUNDS(1/0) = readable pixel array (visible and non visible)
         TGT_CROP_DEFAULT(1/0) = visible pixel area
         TGT_CROP(1/0) = analogue crop
         TGT_COMPOSE(1/0) = binning/skipping

which basically only require re-introducing the use of CROP_BOUNDS in
the RAW camera model specification.

What do you think ?

> > >
> > > All the discussion about readable/non-readable, visible/non-visibile
> > > and active and inactive areas make me think we would benefit from
> > > presenting a small glossary at the beginning of the "Sensor pixel
> > > array size, cropping and binning" paragraph ?
> >
> > The text does not discuss active or inactive areas. I'd add some terms into
> > the main glossary if needed -- they are used outside this file, too.
> >
> > --
> > Regards,
> >
> > Sakari Ailus

