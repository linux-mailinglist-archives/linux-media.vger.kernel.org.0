Return-Path: <linux-media+bounces-21366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D74219C6CAC
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 11:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65D541F22D8A
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 10:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33C31FB896;
	Wed, 13 Nov 2024 10:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVF0flGZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0D61F80C2
	for <linux-media@vger.kernel.org>; Wed, 13 Nov 2024 10:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731493142; cv=none; b=mnwyWeq3LYEfm4CWBZS431rMD8uE7Fr661eO62V+R+IOR9Q/mfr8058rIZTXwPfXHXWpoUhkmIknMyI3s1WsEEj5Oq2DZLPZ9zy3TMOIXuRzUTv9sQyIhopSrUclK1vUav04HM6mpYD2z0VmqcTJvvUAjBXHUrTzTjVpOoKzNk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731493142; c=relaxed/simple;
	bh=aNYNXOmQhPWsoaNIajM2clgxNXCOO35OrMRy3kYXhNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4jSP2VQbg2iH61KHri4ge3v3qYdNenBvhCtIu7BpCVfpANKyFIJF957kmO8aPu2af7lCUoYtGLF95CRrJqprff8XJQoh+dUygzTS6ffPlwZXLjITp8ZmvT+Zn+fpdB/N4VXWDthjiTs6Hr7ALLBn7w1XV8SNRkgDJAV7128VpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVF0flGZ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731493141; x=1763029141;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aNYNXOmQhPWsoaNIajM2clgxNXCOO35OrMRy3kYXhNU=;
  b=jVF0flGZhB3DhEeFuvCa5QtbkZD3Y2jn82bEKDptqLsCFxmbfrKXHahp
   /3Ocd03fL30FlHnhV0Vy/d/MngGG/pGqXqBBrmW5P0pp7dPZBjcmjk91S
   evuoNYH5aA8NoXMDPk7BL5Ot/axB9WpRgcur3traS83dgPqJBzpyTdj2G
   H9cGZnjLmNZnKe918XthT/mkEFWRs9ofq9ERvLXW8waH3LsPhhM3JI2dl
   5Ws2nSfEL26s/xtevT9XZDIBebASAvgsPfoTIcUJN81amcOZFQnUecVpO
   eDHQS8jCudKnnLgsw49Km6kAzUOlp0BvJNCSvkZqyTphQHi/mhQFtl4OS
   g==;
X-CSE-ConnectionGUID: vfGbAWFORsuq4FO43uk3gA==
X-CSE-MsgGUID: 7qEd0Y8vTNOq4a6QCkhnmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="18988591"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="18988591"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 02:18:58 -0800
X-CSE-ConnectionGUID: 1hd4F2rARP6jy2mqRIZIgQ==
X-CSE-MsgGUID: op35z9+XQP+dyFQdL3aAvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="87818488"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 02:18:55 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9258611F72D;
	Wed, 13 Nov 2024 12:18:51 +0200 (EET)
Date: Wed, 13 Nov 2024 10:18:51 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, hverkuil@xs4all.nl,
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
Subject: Re: [RFC 3/4] media: Documentation: Add subdev configuration models,
 raw sensor model
Message-ID: <ZzR9C-7G2t2mcvym@kekkonen.localdomain>
References: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
 <20241011075535.588140-4-sakari.ailus@linux.intel.com>
 <o3vd3xnxjdfoitipoehoef4nycxmv6bvzjcq427gz3aqn2h5ku@yhspyjdngj73>
 <20241022221032.GF9497@pendragon.ideasonboard.com>
 <ZzRW0g4LobeORzSp@kekkonen.localdomain>
 <tudawlq55g7cd54b67t47qy3sso7m7a5a42mkhxvdbv7hx2vqy@3mihjp7saikq>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tudawlq55g7cd54b67t47qy3sso7m7a5a42mkhxvdbv7hx2vqy@3mihjp7saikq>

Hi Jacopo,

On Wed, Nov 13, 2024 at 09:20:32AM +0100, Jacopo Mondi wrote:
> > > > > +    * - 1/0
> > > > > +      - Format
> > > > > +      - X
> > > > > +      - Image data format. The width and height fields of this format are the
> > > > > +        same than those for the V4L2_SEL_TGT_CROP_BOUNDS rectangle. The media
> > > >
> > > > Can sizes be changed at all ?
> > >
> > > For the internal image pad, I wouldn't think so. I think it should
> > > expose the full readable array. Or, reading what you wrote below, do you
> > > envision this including non-readable pixels too ?
> >
> > I don't -- they can't be accessed in any case. Timing information (such as
> > the latching points) should probably be conveyed using a different API if
> > they're needed.
> >
> 
> Ok, what I was suggesting was to explicitly say those sizes are not
> modifiable.

I'll add that for v2.

> 
> > >
> > > Mapping pixel array definitions from datasheets to formats and selection
> > > rectangles is hard, as datasheets, when they are available, are often
> > > confusing. Datasheets from different vendors, or even for different
> > > sensors of the same vendor, often have different models. I think we need
> > > to be extra precise here, and possibly work with sensor vendors. Using
> > > the CCS model as a base could be useful.
> >
> > I wouldn't necessarily try to convey what non-visiblepixels might be there,
> > apart from in the documentation. These tend to be fairly vendor/sensor
> > specific after all.
> >
> 
> In the whole document, I would use one of "non-readable" and
> "non-visible".

I'll check these are the terms used. We won't probably say much -- if
anything -- about non-readable pixels as there's (by definition) no way to
access them.

> 
> > >
> > > > > +        bus code of this format reflects the native pixel depth of the sensor.
> > > > > +    * - 1/0
> > > > > +      - V4L2_SEL_TGT_NATIVE_SIZE
> > > > > +      - X
> > > > > +      - The full size of the pixel array, including all pixels in the pixel
> > > > > +	array, even if they cannot be captured. This rectangle is relative to
> > > > > +	the format on the same (pad, stream).
> > >
> > > Mix of tabs and spaces.
> > >
> > > What do you mean by "relative to the format on the same (pad, stream)" ?
> > > Does it mean the rectangle is expressed relatively to a rectangle
> > > defined as (0,0),(fmt.width x fmt.height) ? That doesn't seem to match
> >
> > Yes.
> >
> > > the description of the format and V4L2_SEL_TGT_CROP_BOUNDS, as the
> > > format is defined as having the same width and height as
> > > V4L2_SEL_TGT_CROP_BOUNDS, and V4L2_SEL_TGT_CROP_BOUNDS is defined as
> > > being relative to V4L2_SEL_TGT_NATIVE_SIZE. I assume you mean something
> > > else, it should be clarified.
> >
> > As discussed, I'll drop the NATIVE_SIZE rectangle from the documentation as
> > redundant.
> >
> 
> Doesn't it help reporting the full pixel array size (readable and non
> readable pixels ?). We care about that information in libcamera
> (also to comply with Android's requirement to expose the full pixel
> array size as a property of the camera)
> 
> I would just drop the "relative" part. NATIVE is a rectangle with
> top-left corner in position (0,0).

It's the same information (apart from the mbus code) that can be obtained
from the format on the internal pad. I'd avoid adding redundant selection
targets.

-- 
Kind regards,

Sakari Ailus

