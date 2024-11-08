Return-Path: <linux-media+bounces-21150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6E59C1CD9
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 13:23:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A61E3B2427E
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 12:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1790B1E764A;
	Fri,  8 Nov 2024 12:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDatfMmC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36C01E47CC
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 12:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731068617; cv=none; b=f1j/oXUno3zm09sOwDh+cVor3JxG4iAk9nVP4JskiLCM8+rn6xftitpdyb4aHT0yfPaqQ8qK6mr82ROF80EMjIPfv/uadjzI/6WedWUVLaHSBB7Cw7dhIeyv73ydzzX/ZAp46ujvgjcQy/1UKE1NIzb5PPVxeagTC0tAC33JWCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731068617; c=relaxed/simple;
	bh=T1EXulyv7gUnaad8gw/eAlrkBErvHr/pU7qWSQboraw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PU6/290e/av5vREtUIF07rvsj5Ai58OFNhbTOAjeWLP0wxKIHNPuj5bidkOGPLoGdXl29qIvks1GUfvUlckw85mwwPe5ZZucd4w+0E7SGX0XyMjPxttfBGQWBCvg+F/fBu+ZgblVFOW7e9woH7KjYEqr2WirBehEA7LfRZET7fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KDatfMmC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731068616; x=1762604616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T1EXulyv7gUnaad8gw/eAlrkBErvHr/pU7qWSQboraw=;
  b=KDatfMmCKtGRKFYAtg2lEYg7GIiJt+J8aSGaK6JNk6ITUKdHkO/T3Rvl
   UPMRpu+7DvfDqSeVYGgH4t4AosiCKWBHKEEavbR0Hm76z4vdkBdTu7NCp
   HEOA6Tlsv7ypg2G9lD/dZyq3hNBjG6HQ/I7IxathXKVslSpq+VHWAmFBp
   hVsNvjUqijAFacQ9rOUH60nfsSFW6tdadWTk91aVCl5LlFC4Ymer3TYCh
   EmC9KBSSmJlTaHajJiwMUuAAyq2TGwPS1FpN4J2aQ48w0+z9Ydp5Z8WGa
   h4X0Ws67BaVy6pOwRRkGxTRhEjAKYs433C8bkVISRdWKCdENnDY7oTYt3
   g==;
X-CSE-ConnectionGUID: jYQAYfA1Q3ybTbawyFRp4Q==
X-CSE-MsgGUID: o54ZZkvoTOC/7Xd4Bi3Mww==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30364903"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="30364903"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 04:23:35 -0800
X-CSE-ConnectionGUID: Ha9G/eGCQtqZ7J6nhaftKQ==
X-CSE-MsgGUID: B+UZlRtCQRyGg8pwtVdDYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="90404924"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 04:23:32 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6B6C711F9BF;
	Fri,  8 Nov 2024 14:23:28 +0200 (EET)
Date: Fri, 8 Nov 2024 12:23:28 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [RFC 1/4] media: Documentation: Rework embedded data
 documentation
Message-ID: <Zy4CwFKKoOKwWiSN@kekkonen.localdomain>
References: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
 <20241011075535.588140-2-sakari.ailus@linux.intel.com>
 <eqhifp7vendgt7qyq7uj4m2dvvwbnalfyxst4mnak6fmsevjw6@faugbizkk4ee>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eqhifp7vendgt7qyq7uj4m2dvvwbnalfyxst4mnak6fmsevjw6@faugbizkk4ee>

Hi Jacopo,

On Tue, Oct 22, 2024 at 05:08:21PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Fri, Oct 11, 2024 at 10:55:32AM +0300, Sakari Ailus wrote:
> > Rework embedded data documentation by removing the reference to the pixel
> > data stream. The specific documentation of the embedded data interface
> > will be elsewhere.
> 
> I'm not sure how to interpret the last phrase. What specific
> documentation ? The formats description ? Should this be part of the

The embedded data interface. It'll be used by CCS and the new common raw
sensor model.

I can add that.

> commit message ?
> 
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/drivers/camera-sensor.rst   | 13 ++++++-------
> >  1 file changed, 6 insertions(+), 7 deletions(-)
> >
> > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > index dc415b8f6c8e..d82cd803e337 100644
> > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > @@ -111,13 +111,12 @@ the sensor configuration for the captured frame back to the host. While CSI-2 is
> >  the most common data interface used by such sensors, embedded data can be
> >  available on other interfaces as well.
> >
> > -Such sensors expose two internal sink pads (pads that have both the
> > -``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and ``MEDIA_PAD_FL_INTERNAL
> > -<MEDIA-PAD-FL-INTERNAL>`` flags set) to model the source of the image and
> > -embedded data streams. Both of these pads produces a single stream, and the
> > -sub-device routes those streams to the external (source) pad. If the sub-device
> > -driver supports disabling embedded data, this can be done by disabling the
> > -embedded data route via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
> > +Embedded data support is indicated by an internal sink pad (pad that has both
> 
> "is indicated by the presence of an" ?

Sounds good.

> 
> > +the ``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and ``MEDIA_PAD_FL_INTERNAL
> > +<MEDIA-PAD-FL-INTERNAL>`` flags set) with a metadata format to model the
> > +embedded data stream. If the sub-device driver supports disabling embedded data,
> > +this can be done by disabling the embedded data route via the
> > +``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks!

> >
> >  In general, changing the embedded data format from the driver-configured values
> >  is not supported. The height of the metadata is device-specific and the width

-- 
Kind regards,

Sakari Ailus

