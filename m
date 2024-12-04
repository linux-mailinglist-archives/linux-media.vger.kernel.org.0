Return-Path: <linux-media+bounces-22626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FD69E3D19
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 15:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FA7EB3DE4D
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 14:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5887C1F9AAC;
	Wed,  4 Dec 2024 14:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hGg7NKUx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAE91B415A
	for <linux-media@vger.kernel.org>; Wed,  4 Dec 2024 14:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733321718; cv=none; b=O6PkcECzZBFdS2BCN1ixtdksVkDYeGt8chT+fgUOJTRg4pPNQ6A6uotb33yolpGDYVu2TdCy9r4p9T/jUEQ6hVP2XKHGaYKop2cmPN8ff69XUtPKQZsYGrf3EbESrjA5DmZfKt6yJMZkGLl/M6gjP1Jx0ZkEm4yZS2J9g3StwI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733321718; c=relaxed/simple;
	bh=rkrWEdJidOCyfVm9YxYc6wzPsfZgdoXg0xx8RV5/6uE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3Q92PLSU+mYDciEnmt/3+1Xh1iwc8dzcBE1RoIvfTmGTggys8QzdSgfsUOSvGkYJLfiZ7u8cJMNt7UhIQnVxO8UFbzh3gAlp8b6yybSc68ua36h4zuiLIbKseUWwoRdVMzg4SyQC4J9K0kyH/bjE205t8jk5Czti2eavt0cw5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hGg7NKUx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733321717; x=1764857717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rkrWEdJidOCyfVm9YxYc6wzPsfZgdoXg0xx8RV5/6uE=;
  b=hGg7NKUxv8jlIs9mmGdmHRsskzoetxOJWx080XQ+/OVU5UYkjIFJ6gRG
   uyt8ab/kHjT7XhLsk/xqVlfMLG6RRtHTt/E2lFT/LDrh4xn7n6Jo1csKo
   bcdrXZAUJ2XZZ/tVHlXFmFSzykfd56FBvDQXY/gnGVw1vh8zqrPLfnoOM
   pmgC1ifmnImtKio8vkVlYkiHIRPBm9yljiYZs6UNuO0thFxrynoHqF1p3
   J4CKQWMVrkzjDzXmbrebYC00h4u8HDwaEmmZQg05y2GwQ6cfFGBmShDW2
   paYE+7brRrn6L/uLSc+i9O4mgSfBAQ6OVKi9Pak0aBmiOIxBWEncltS5B
   g==;
X-CSE-ConnectionGUID: JS1aHMOXQ26p0OJa9LERVA==
X-CSE-MsgGUID: C1XAJI7lTuuxZ07IIjQO7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51119475"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="51119475"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 06:15:16 -0800
X-CSE-ConnectionGUID: Fmrite7PQmW+x7rkqYSWUQ==
X-CSE-MsgGUID: LzEL2NX5R+OmmGyWIFZBRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="117027295"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 06:15:11 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E8DA011F89A;
	Wed,  4 Dec 2024 16:15:07 +0200 (EET)
Date: Wed, 4 Dec 2024 14:15:07 +0000
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
	Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: Re: [RFC v3 5/9] media: Documentation: Add scaling and post-scaler
 crop for common raw
Message-ID: <Z1Bj62TU-hK3nJof@kekkonen.localdomain>
References: <20241129095142.87196-1-sakari.ailus@linux.intel.com>
 <20241129095142.87196-6-sakari.ailus@linux.intel.com>
 <ioomhmdxhr2wmunibh456umrczv5p2grqdvqyvq2gt5gb2wirn@m4nep4s6pbnu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ioomhmdxhr2wmunibh456umrczv5p2grqdvqyvq2gt5gb2wirn@m4nep4s6pbnu>

Hi Jacopo,

Thank you for the review.

On Wed, Dec 04, 2024 at 12:25:11PM +0100, Jacopo Mondi wrote:
> Hi Sakari
>   thanks for the update
> 
> On Fri, Nov 29, 2024 at 11:51:38AM +0200, Sakari Ailus wrote:
> > Document scaling and post-scaler digital crop operations for the common
> > raw sensor model.
> > Signedg-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/v4l/subdev-config-model.rst         | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > index 4ddf98e3143c..1ae20800f34b 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > @@ -119,9 +119,13 @@ The digital crop operation takes place after binning and sub-sampling. It is
> >  configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
> >  0/0. The resulting image size is further output by the sensor.
> 
> I think this last line "The resulting image size is further output by
> the sensor." doesn't apply anymore now that we have [digital crop +
> digital scaling + post-scaling crop].

Indeed. I'll address this in v4.

> 
> >
> > +The digital scaling operation is performed after the digital crop. It is
> > +configured by setting the ``V4L2_SEL_TGT_COMPOSE`` rectangle on (pad, stream) pair
> > +0/0, relative to the digital crop.
> > +
> 
> "to the digital crop rectangle." maybe ?

Yes.

> 
> 
> >  The sensor's output mbus code is configured by setting the format on the (pad,
> > -stream) pair 0/0. When setting the format, always use the same width and height
> > -as for the digital crop setting.
> > +stream) pair 0/0. The width and height fields are used to configure post-scaler
> > +digital crop, affecting the right side and the bottom of the frame.
> >
> 
> I would introduce the (optional) presence of an additional post-scaler
> digital crop step explicitly, also I get this is kind of rare feature,
> isn't it ?
> 
> -------------------------------------------------------------------------------
> The digital scaling operation is performed after the digital crop. It
> is configured by setting the ``V4L2_SEL_TGT_COMPOSE`` rectangle on
> (pad, stream) pair 0/0, relative to the digital crop rectangle.
> 
> The sensor's output mbus code is configured by setting the format on the (pad,
> stream) pair 0/0. An optional post-scaler crop step might be performed by
> specifying a width and height smaller than the digital scaling
> rectangle. If post-scaler cropping is not supported the format's sizes
> will always match the compose rectangle sizes applied on the same 0/0
> (pad, stream) pair.

Right, even if the post-scaler crop is optional, the format is always
there but unmodifiable (directly). I'd refer to driver support instead of
somewhat nebulous "might be performed".

How about:

The sensor's output mbus code is configured by setting the format on the
(pad, stream) pair 0/0. The width and height fields are used to configure
post-scaler digital crop if supported by the driver, affecting the right
and bottom edges of the frame. If post-scaler digital crop is not
supported, the width and height fields of the format will match the compose
rectangle sizes applied on the same 0/0 (pad, stream) pair.

> -------------------------------------------------------------------------------
> 
> I didn't get when we spoke about it where the "affecting the right
> side and bottom of the frame" comes from when talking about
> post-scaler cropping.
> 
> 
> >  Drivers may only support some of even none of these configurations, in which
> >  case they do not expose the corresponding selection rectangles. If any selection
> > @@ -179,12 +183,19 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
> >        - X
> >        - Digital crop. This rectangle is relative to the ``V4L2_SEL_TGT_COMPOSE``
> >          rectangle on (pad, stream) pair 1/0.
> > +    * - 0/0
> > +      - ``V4L2_SEL_TGT_COMPOSE``
> > +      - \-
> > +      - X
> > +      - Scaling. This rectangle is relative to the ``V4L2_SEL_TGT_CROP``
> 
> "Digital scaling" ? or is not necessary ?

We don't mention it in the context of sub-sampling either. Digital and
analogue variants are separately documented where they exist, I think this
should be fine. What do you think?

> 
> > +        rectangle on (pad, stream) pair 0/0.
> >      * - 0/0
> >        - Format
> >        - X
> >        - X
> > -      - Image data source format. Always assign the width and height fields of
> > -        the format to the same values than for the ``V4L2_SEL_TGT_CROP``
> > +      - Image data source format and post-scaler crop. The width and height
> > +        fields of the format, used to configure post-scaler crop on the right
> > +        and bottom edges of the image, are related to the ``V4L2_SEL_TGT_COMPOSE``
> >          rectangle on (pad, stream) pair 0/0. The media bus code reflects the
> >          pixel data output of the sensor.
> >      * - 0/1

-- 
Kind regards,

Sakari Ailus

