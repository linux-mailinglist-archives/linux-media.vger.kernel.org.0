Return-Path: <linux-media+bounces-43739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D093BB7033
	for <lists+linux-media@lfdr.de>; Fri, 03 Oct 2025 15:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79A883B8C7F
	for <lists+linux-media@lfdr.de>; Fri,  3 Oct 2025 13:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FCA2F0C52;
	Fri,  3 Oct 2025 13:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J1JkS89D"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80F572631
	for <linux-media@vger.kernel.org>; Fri,  3 Oct 2025 13:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759497936; cv=none; b=bNH9O+Ar37KL+JYHqZzIhvCS04TBNjGHZN6Q6Hy3U9dMAqGWGxB/07HJsH1q1FGQmvsMikNmcudkKZITlPfTasUKZqCxBnw9RcZbcWfg4WLCt1lLzS4z5CcFImKyjLCJC7kICNVEkFZ5rw1FBbxPNcgSMigWlazj5VEbR9LVc+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759497936; c=relaxed/simple;
	bh=ElimYMr1RGjn3Tk/qJl1LpFBqFWDXbwsY7dHx9Hphx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lCunHf70PC/pRhJC/4KB/THdbP0PkafvnC+QOgdL0ebEpT78XOjtAOhrx1GZAChHV1utKerAlXZa/4FXTql86ftcZHLpEWHr09m93I7TWi7dutsg01YtxauQNygG1QHALlHEoawt2m9OaqSfVgtbRuMMGzQfQaQtNg2M21J3MSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J1JkS89D; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E8E8C7A;
	Fri,  3 Oct 2025 15:23:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759497832;
	bh=ElimYMr1RGjn3Tk/qJl1LpFBqFWDXbwsY7dHx9Hphx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J1JkS89Dx/u/S3lwKr31BWKPxH8FoDRCIkVZGYv/aPKm2nv6trmnejyhYrfCPWwGL
	 kbdqpob6R8A3vJbwiIJjdZlK2Mcgs8vg9IKpZNaPpIJGJFiW5zTVDpiN5uHDKGumro
	 Rl/GSa8ZGh7PlftVO9W82V2IpKENOk//bF5WxGyc=
Date: Fri, 3 Oct 2025 15:25:19 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
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
Message-ID: <zq3gzieoqd4eieghjetm6sus5s7i6niplommnubl4d4rskbhra@v7gslcsg5hce>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-40-sakari.ailus@linux.intel.com>
 <osdr2eavm23pzxrd73v4xscdtaafon3vllhzcg5r6eoqwclsfk@xgfnicn6iboj>
 <aM1J9LsbpueEr30x@kekkonen.localdomain>
 <5fwlztz2q2fewyml774my3sdw3wv5wdhnl6p4mfbubm4erm5ft@sthie2bobklf>
 <aN4lQPK5Mqve2bUI@kekkonen.localdomain>
 <kblfpuqfj2d6vkagspnqdhztno2js3wljdrsv2wpeywuwyzg5x@xt7rjhh5wt76>
 <r3kv25lxbyjtuufb2ze27wp5gbqnbgnps2ytk2gy2qkaeiijdd@ydn4ptkze2qp>
 <aN_MdmDhQPyLnQqD@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aN_MdmDhQPyLnQqD@kekkonen.localdomain>

Hi Sakari,

On Fri, Oct 03, 2025 at 04:15:34PM +0300, Sakari Ailus wrote:
> Hi Jacopo,

[snip]

> > >
> >
> > A recent discussion on libcamera made me wonder a few things
> >
> > https://patchwork.libcamera.org/patch/24547/
> >
> > In the current world (pre-RAW sensor model) the situation can be
> > summarized as
> >
> > TGT_NATIVE_SIZE = full pixel array (readable and non readable)
> > TGT_CROP_BOUNDS = readable pixel array (visible and non visibile pixels)
>
> Crop bounds is generally the same as native size.
>

I checked two sensors datasheet for this yesterday and both of them
had parts of the pixel array that cannot be read out

> > TGT_CROP_DEFAULT = visible pixels
>
> The default could exclude not-so-great pixels, too.
>

ok, suggested pixel array area used for image capture purposes then

> > TGT_CROP = analgoue crop
>
> This could include digital crop as well.
>

Yes it might, not all sensor drivers behaves the same indeed

> >
> > where:
> > - visibile = pixels used for image capture purpose
> > - non-visible = optically black, dummies etc
> >
> > With the RAW sensor model:
> >
> > format(1/0) = readable pixel array (visible and non visible)
> > TGT_CROP_DEFAULT(1/0) = visible pixel area
> > TGT_CROP(1/0) = analogue crop
> > TGT_COMPOSE(1/0) = binning/skipping
> >
> > Have we lost the ability to report the full pixel array size (readable
> > and not readable) ? Is this intentional ? As if pixels cannot be read
> > out they basically do no exist, and the information on the actual
> > number of pixels (including non readable ones) should be kept
> > somewhere else (like the libcamera sensor properties database) ?
>
> I'd keep this information in the user space if needed. There's little
> software could presumably do with this information.
>

Agreed, there is no value I can think of in having this information in
drivers

> >
> > All the discussion about readable/non-readable, visible/non-visibile
> > and active and inactive areas make me think we would benefit from
> > presenting a small glossary at the beginning of the "Sensor pixel
> > array size, cropping and binning" paragraph ?
>
> The text does not discuss active or inactive areas. I'd add some terms into
> the main glossary if needed -- they are used outside this file, too.
>
> --
> Regards,
>
> Sakari Ailus

