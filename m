Return-Path: <linux-media+bounces-18349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AFA97B46B
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 21:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74A2A287483
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 19:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2864618BC04;
	Tue, 17 Sep 2024 19:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T10nCUFX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09541898E5
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 19:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726602854; cv=none; b=XAAyEGiJzcU7L0dZvdH79jghuifbg4OIA33Jkt6iPE/Gxwr4Upxq7JdJVWvPJ1aR8diK/91Ysvv4gw+289P/M8MNMfLXqhBso2D05Rne+Ln0VkyCj+1h2iqfzgvckx/emBZVjJzDh/kVckTUbVFS5iDUoeSEfdq2IhKkHclY8b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726602854; c=relaxed/simple;
	bh=dOWy9390wkdoc5MZgjUa2fnbx5ZOLOQZZtgF+FFUhTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IaO0qmL17Jdcjr/eh5OiO+duePLNKt650tXfZ002toIESrq+Wu4L/3rTDePVHEha00zapHqIGCSdhXZLYA8dSCBjpDN2l0XeOfAYqf0N7UdUlNVSohjnjX9aFsZHV8Sv8o0cj7mxV7T5OXTcZF6L2qAzj+xU6ZskPJajnOU7Fdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T10nCUFX; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726602853; x=1758138853;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dOWy9390wkdoc5MZgjUa2fnbx5ZOLOQZZtgF+FFUhTw=;
  b=T10nCUFXiqeoXYDN/IjTnNPDmw0p0EE4JJvI2tXgqwJqfPiYAMLaF8Xa
   EpjzU4dG9J+K+dpFwoMc9/nx1E/QOenaXQxH7r4ONH29Z9MwkqsmsITmX
   YHNjLpbZueUIHpS92YqynpU/+SIIAMMXT9yyyPEFJhBWoi+fd4cp7ISB/
   vVgMwiOEL6/Ygd06FQzjYbN5vV1ORTyCKDfU3GBGVNOncfAuz4PdWcgYl
   ExCzCaI4m2oH5dArXSsDvDZMaNdeEe6/4DCDskjakqsNXvX53UgWdRsrT
   o5qrMOCz0+ObUhTGANtsVacWOMyDICybQRGUl//QFQdzszG39I7Q1IIO+
   A==;
X-CSE-ConnectionGUID: aFHaGZ+2TlydwLC8Eu/7/A==
X-CSE-MsgGUID: NbflwsdxQduQ1uxUp8U5Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25679627"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="25679627"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 12:54:12 -0700
X-CSE-ConnectionGUID: 7H5P+kReTEaK9TvScBK7cA==
X-CSE-MsgGUID: NJPXqUYZRGSmxwgMvtq+qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="68950782"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 12:54:10 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C44C312037A;
	Tue, 17 Sep 2024 18:05:06 +0300 (EEST)
Date: Tue, 17 Sep 2024 15:05:06 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Alain Volmat <alain.volmat@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH 2/2] media: Documentation: Update
 {enable,disable}_streams documentation
Message-ID: <Zumaojldp2uyRHqH@kekkonen.localdomain>
References: <20240917124345.16681-1-sakari.ailus@linux.intel.com>
 <20240917124345.16681-2-sakari.ailus@linux.intel.com>
 <20240917130047.GC17350@pendragon.ideasonboard.com>
 <61a0d763-2a6f-48f7-9439-3cc8102cb803@ideasonboard.com>
 <20240917145735.GE17350@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917145735.GE17350@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, Sep 17, 2024 at 05:57:35PM +0300, Laurent Pinchart wrote:
> On Tue, Sep 17, 2024 at 05:16:25PM +0300, Tomi Valkeinen wrote:
> > On 17/09/2024 16:00, Laurent Pinchart wrote:
> > > On Tue, Sep 17, 2024 at 03:43:45PM +0300, Sakari Ailus wrote:
> > >> Document the expected {enable,disable}_streams callback behaviour for
> > >> drivers that are stream-unaware i.e. don't specify the
> > >> V4L2_SUBDEV_CAP_STREAMS sub-device capability flat. In this specific case,
> > >> the mask argument can be ignored.
> > > 
> > > Wouldn't it be better to use BIT(0) in that case to simplifiy
> > > interoperability with stream-aware devices ?
> > 
> > The caller has to set BIT(0), but I think here the documentation is 
> > about the callee.
> > 
> > If the driver is not stream aware and implements the callbacks, it will 
> > get BIT(0) as the mask parameter (do we enforce this?), but as there's 
> > nothing it can do with the parameter it "does not need to be concerned 
> > with the mask argument".
> 
> Right. I had misunderstood the patch.
> 
> > >> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > >> ---
> > >>   include/media/v4l2-subdev.h | 8 ++++++++
> > >>   1 file changed, 8 insertions(+)
> > >>
> > >> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > >> index 3cc6b4a5935f..67a6e6ec58b8 100644
> > >> --- a/include/media/v4l2-subdev.h
> > >> +++ b/include/media/v4l2-subdev.h
> > >> @@ -834,11 +834,19 @@ struct v4l2_subdev_state {
> > >>    *	v4l2_subdev_init_finalize() at initialization time). Do not call
> > >>    *	directly, use v4l2_subdev_enable_streams() instead.
> > >>    *
> > >> + *	Drivers that support only a single stream without setting the
> > >> + *	V4L2_SUBDEV_CAP_STREAMS sub-device capatility flag do not need to
> 
> s/capatility/capability/
> 
> Same below.
> 
> > >> + *	be concerned with the mask argument.
> 
> How about "can ignore the mask argument" instead ? I interpreted as "not
> need to be concerned with" from the point of view of the caller.

Sounds good. I'll address these in v3, after waiting a bit for further
comments.

> 
> > >> + *
> > >>    * @disable_streams: Disable the streams defined in streams_mask on the given
> > >>    *	source pad. Subdevs that implement this operation must use the active
> > >>    *	state management provided by the subdev core (enabled through a call to
> > >>    *	v4l2_subdev_init_finalize() at initialization time). Do not call
> > >>    *	directly, use v4l2_subdev_disable_streams() instead.
> > >> + *
> > >> + *	Drivers that support only a single stream without setting the
> > >> + *	V4L2_SUBDEV_CAP_STREAMS sub-device capatility flag do not need to
> > >> + *	be concerned with the mask argument.
> > >>    */
> > >>   struct v4l2_subdev_pad_ops {
> > >>   	int (*enum_mbus_code)(struct v4l2_subdev *sd,
> 

-- 
Kind regards,

Sakari Ailus

