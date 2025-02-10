Return-Path: <linux-media+bounces-25928-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8280A2EFF7
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 15:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5217A188857F
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 14:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DBC8204861;
	Mon, 10 Feb 2025 14:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WNhSahZf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9536204864
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 14:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739198167; cv=none; b=k2RvGNkxgLtYm4RtyyHDSCfX2tqZN0JihQd9TYXeUmsta4SRnrtiYKlKHpW6VrFh5Jb4X2mPV6LFe9W7eeJ42PNG+JbTVifx3LHTyrHlgvC/pr1Y+4i2uaJvxAggW5u0G7hZgcD2PQ7oPS85as7LUbx9oKNCmuusX8fS6WXH/GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739198167; c=relaxed/simple;
	bh=zQEjSIUJfgMrND5TVNwRcJhQRZh2Xn48MAFoPUzNZQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLTrGubPCKbJ3/rfs7P7pYH/TSCg7tdHXiSfEMVqtoOv4boRn0uFg5g6tnn+VtJfK8w/bG2lcveTJfBD3AKBEf86Q5YX8HPDeG5uNigDaYJNd1pmIYrkZgzY+iSWIqKs7cUde0+D7KRN511bLaiD4N/IL/hP8CQyDRLzKzJmCqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WNhSahZf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739198165; x=1770734165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zQEjSIUJfgMrND5TVNwRcJhQRZh2Xn48MAFoPUzNZQ4=;
  b=WNhSahZfYdPB1e6sVncG3OgpQKdz3Hh21yEHYoxPdFzq15wL4bxnEA1n
   uAfMxNezzR217w1SpyfgkGSK3V7HXIC36WOD3IIN5glnKCoJxQUr8dMCL
   ONYrLOVJQiYB0S9u/AM7IKnwNkmM6n9byx1YoC6IZYUbvgNOpR7494Zb7
   k4xK4gJHVmqC9M+2GHgQyKyOkVvtD2sCtyHtnwrca504wTZMF3sGPo/Rz
   F7AIRgQnYuDIFloLCAy37pw0P9XA961J00fqstz9ZmciL63DZhxWXj3ri
   KHgxWrm15TAgM0apWPxER5WgS/f9o71VyNSQCiEwldcTiCqeCHCwQF9G8
   A==;
X-CSE-ConnectionGUID: H46O3AnSSJK3X7RrbF57ww==
X-CSE-MsgGUID: Mdxfme1qRHWx2PecRiZ+yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="57193609"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="57193609"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 06:36:02 -0800
X-CSE-ConnectionGUID: KqWeeeT9Sk2sJ0d3mR6ZBw==
X-CSE-MsgGUID: cGTjL/IaTuWJxVHIFubchA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="112429917"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 06:35:35 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3193C11F8D9;
	Mon, 10 Feb 2025 16:35:33 +0200 (EET)
Date: Mon, 10 Feb 2025 14:35:33 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
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
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [EXT] [RFC v5 11/15] media: Documentation: Document luma-only
 mbus codes and CFA for cameras
Message-ID: <Z6oOtUxtbwu5kjxQ@kekkonen.localdomain>
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
 <20250203085853.1361401-12-sakari.ailus@linux.intel.com>
 <d70aa0d1-9453-42ef-bede-debdad504dc8@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d70aa0d1-9453-42ef-bede-debdad504dc8@nxp.com>

Hi Mirela,

On Sun, Feb 09, 2025 at 07:48:27PM +0200, Mirela Rabulea wrote:
> Hi Sakari,
> 
> On 03.02.2025 10:58, Sakari Ailus wrote:
> > Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
> > 
> > 
> > Document the use of luma-only mbus codes for camera sensors and how the
> > V4L2_CID_COLOUR_PATTERN and V4L2_CID_COLOUR_PATTERN_FLIP controls are used
> > to convey the colour filter array pattern on UAPI.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   .../userspace-api/media/drivers/camera-sensor.rst   | 13 +++++++++++++
> >   .../media/v4l/ext-ctrls-image-source.rst            |  4 ++++
> >   2 files changed, 17 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > index 5bc4c79d230c..91e5305458b9 100644
> > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > @@ -41,6 +41,19 @@ format set on a source pad at the end of the device's internal pipeline.
> > 
> >   Most sensor drivers are implemented this way.
> > 
> > +V4L2_CID_COLOUR_PATTERN, luma-only mbus formats, flipping and cropping
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +For raw image data originating from camera sensors, :ref:`luma-only mbus codes
> > +MEDIA_BUS_FMT_Yx_1Xx (where 'x' is the bit depth) <v4l2-mbus-pixelcode-yuv8>`
> > +are used as Colour Filter Array (CFA) agnostic raw formats. The
> > +``V4L2_CID_COLOUR_PATTERN <image-source-control-colour-pattern>`` control in the
> > +same sub-device defines the native colour pattern of the device. Flipping may
> > +further affect the readout pattern as indicated by the
> > +``V4L2_CID_COLOUR_PATTERN_FLIP <image-source-control-colour-pattern-flip>``
> > +control. Further on, cropping also has an effect on the pattern if cropped
> > +amount is not divisible by the size of the pattern, horizontally and vertically.
> > +
> 
> Ok, so it is clear now, the V4L2_CID_COLOUR_PATTERN stands for the "native
> colour pattern", as opposed to the "readout pattern". It is good to make the
> distinction.
> 
> Maybe the V4L2_CID_COLOUR_PATTERN control description in patch #7 could also
> be made more clear with regards to native vs readout pattern?
> 
> "This control determines the colour components and pixel order in the
> sensor's CFA (Colour Filter Array)..." => "This control reports the colour
> components and native pixel order in the sensor's CFA (Colour Filter
> Array)..." ?

I agree, I'll change this in v6.

-- 
Kind regards,

Sakari Ailus

