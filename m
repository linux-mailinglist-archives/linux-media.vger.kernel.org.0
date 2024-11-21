Return-Path: <linux-media+bounces-21772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 033FD9D50E2
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 17:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD75A1F22DC2
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 16:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F391A3BDE;
	Thu, 21 Nov 2024 16:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iFh96vCd"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23223155CBF
	for <linux-media@vger.kernel.org>; Thu, 21 Nov 2024 16:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732207617; cv=none; b=RzyRgVRPFWEN1VLK8JnI3MxhzkPhcVkCt2U7lsDYkGMRa+3SPV4dF2AKeMcvbmd2samlV8N9M/LGvI1juE3e6yzMeEWz8F4T5jxQMVEcG5LX4aw+RbyLCAT+vsKfXAsFqh5OLArl3ljfCcaiMuy4Ipgsd1M2QUDoLETDotdTvrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732207617; c=relaxed/simple;
	bh=PyjjZI02YzbYjL9W8x7RvzEdUqO6OLfHa53+vMq0460=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLeNIs8YtCG0eWuulqjT5mM7ME8UPLx6IYBZ4cTJRJT972DlXJpNy/5Y9jnpaHSDvlDzjsb1Zzevo0Gd/UIvAQ7BUv5qXiBgYQtWqKlzsiq1RTfH/+0kDRJcBK4qA/2PBeVaEbb+eQOTuUK2pWop/pKS9fss3/XvOeogaj98Wyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iFh96vCd; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732207616; x=1763743616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PyjjZI02YzbYjL9W8x7RvzEdUqO6OLfHa53+vMq0460=;
  b=iFh96vCdY+C8mmUxWRbgpprJW2Dwt7gRIgNNNc32f8WU/hxkV0RlyuMO
   WhcHWTQQR5E8pfwQNX/Pe4HuhYmFIPhJUt9TL0AH+9Oyz+oQSYUQFNOa2
   zIHIOi06ifUdOboqm62w8il+xw4m9gV1maaxTu8OI5VZtgOqFZ0y90mK+
   eaNwkzGS56OVOdD+EInrWK6lag+dLybSCDHaRRdEDF+X3s9HohsOdpLV0
   62xV9WVAifyWms0q9i67JHCPi4NNCxWDuAwe/O2PkujbeRBDW2bAaWaTV
   t6nhjUryZniV14F4QM+DXNeWNFUwoRVy9K6FIBUift5oI8ndQhRGEn8sv
   w==;
X-CSE-ConnectionGUID: ZdEKTRXhQyWIJx4vz9qWow==
X-CSE-MsgGUID: 7xcFLsAcS9iK8vT1LG+AZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32480861"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="32480861"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 08:46:56 -0800
X-CSE-ConnectionGUID: VLYNKIQ2RomFbwiOeZ/sng==
X-CSE-MsgGUID: kx46xl1QTMiTYGqSuYJiCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="121178687"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 08:46:54 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0AF6911F775;
	Thu, 21 Nov 2024 18:46:51 +0200 (EET)
Date: Thu, 21 Nov 2024 16:46:50 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 1/4] media: v4l2: Add Renesas Camera Receiver Unit
 pixel formats
Message-ID: <Zz9j-u2MDsPqvLyy@kekkonen.localdomain>
References: <20241112124614.646281-1-dan.scally@ideasonboard.com>
 <20241112124614.646281-2-dan.scally@ideasonboard.com>
 <20241112175309.GB24067@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112175309.GB24067@pendragon.ideasonboard.com>

Hi Laurent, Dan,

On Tue, Nov 12, 2024 at 07:53:09PM +0200, Laurent Pinchart wrote:
> Hi Dan,
> 
> Thank you for the patch.
> 
> On Tue, Nov 12, 2024 at 12:46:11PM +0000, Daniel Scally wrote:
> > From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> > 
> > The Renesas Camera Receiver Unit in the RZ/V2H SoC can output RAW
> > data captured from an image sensor without conversion to an RGB/YUV
> > format. In that case the data are packed into 64-bit blocks, with a
> > variable amount of padding in the most significant bits depending on
> > the bitdepth of the data. Add new V4L2 pixel format codes for the new
> > formats, along with documentation to describe them.
> > 
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> > ---
> > Changes in v2:
> > 
> > 	- Added labels to the new formats in the documentation file
> > 	- Added 20-bit formats
> > 
> >  .../userspace-api/media/v4l/pixfmt-bayer.rst  |   1 +
> >  .../media/v4l/pixfmt-srggbnn-cru.rst          | 168 ++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-common.c         |  16 ++
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |  16 ++
> >  include/uapi/linux/videodev2.h                |  21 +++
> >  5 files changed, 222 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-srggbnn-cru.rst
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> > index ed3eb432967d..658068364ea1 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> > @@ -31,3 +31,4 @@ orders. See also `the Wikipedia article on Bayer filter
> >      pixfmt-srggb14
> >      pixfmt-srggb14p
> >      pixfmt-srggb16
> > +    pixfmt-srggbnn-cru
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggbnn-cru.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggbnn-cru.rst
> > new file mode 100644
> > index 000000000000..ee2a72eb05fb
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-srggbnn-cru.rst
> > @@ -0,0 +1,168 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +
> > +.. _v4l2-pix-fmt-cru-sbggr10:
> > +.. _v4l2-pix-fmt-cru-sgbrg10:
> > +.. _v4l2-pix-fmt-cru-sgrbg10:
> > +.. _v4l2-pix-fmt-cru-srggb10:
> > +.. _v4l2-pix-fmt-cru-sbggr12:
> > +.. _v4l2-pix-fmt-cru-sgbrg12:
> > +.. _v4l2-pix-fmt-cru-sgrbg12:
> > +.. _v4l2-pix-fmt-cru-srggb12:
> > +.. _v4l2-pix-fmt-cru-sbggr14:
> > +.. _v4l2-pix-fmt-cru-sgbrg14:
> > +.. _v4l2-pix-fmt-cru-sgrbg14:
> > +.. _v4l2-pix-fmt-cru-srggb14:
> > +.. _v4l2-pix-fmt-cru-sbggr20:
> > +.. _v4l2-pix-fmt-cru-sgbrg20:
> > +.. _v4l2-pix-fmt-cru-sgrbg20:
> > +.. _v4l2-pix-fmt-cru-srggb20:
> > +
> > +******************************************************************************************************************************************
> > +V4L2_PIX_FMT_CRU_SBGGRnn ('CnnB'), V4L2_PIX_FMT_CRU_SGBRGnn ('CnnG'), V4L2_PIX_FMT_CRU_SGRBGnn ('Cnng'), V4L2_PIX_FMT_CRU_SRGGBnn ('CnnR')
> > +******************************************************************************************************************************************
> > +
> > +===============================================================
> > +Renesas RZ/V2H Camera Receiver Unit 64-bit packed pixel formats
> > +===============================================================
> > +
> > +| V4L2_PIX_FMT_CRU_SBGGR10 (C10B)
> > +| V4L2_PIX_FMT_CRU_SGBRG10 (C10G)
> > +| V4L2_PIX_FMT_CRU_SGRBG10 (C10g)
> > +| V4L2_PIX_FMT_CRU_SRGGB10 (C10R)
> > +| V4L2_PIX_FMT_CRU_SBGGR12 (C12B)
> > +| V4L2_PIX_FMT_CRU_SGBRG12 (C12G)
> > +| V4L2_PIX_FMT_CRU_SGRBG12 (C12g)
> > +| V4L2_PIX_FMT_CRU_SRGGB12 (C12R)
> > +| V4L2_PIX_FMT_CRU_SBGGR14 (C14B)
> > +| V4L2_PIX_FMT_CRU_SGBRG14 (C14G)
> > +| V4L2_PIX_FMT_CRU_SGRBG14 (C14g)
> > +| V4L2_PIX_FMT_CRU_SRGGB14 (C14R)
> > +| V4L2_PIX_FMT_CRU_SBGGR20 (C20B)
> > +| V4L2_PIX_FMT_CRU_SGBRG20 (C20G)
> > +| V4L2_PIX_FMT_CRU_SGRBG20 (C20g)
> > +| V4L2_PIX_FMT_CRU_SRGGB20 (C20R)
> 
> That's a long list of pixel formats. Is it time to byte the bullet and
> stop encoding the CFA pattern in the pixel formats ? Userspace can
> retrieve the information from the media bus code on the source. You can
> then slash the number of new pixel formats by a factor of 4, defining
> V4L2_PIX_FMT_CRU_RAW10, V4L2_PIX_FMT_CRU_RAW12, V4L2_PIX_FMT_CRU_RAW14
> and V4L2_PIX_FMT_CRU_RAW20. Those formats would also be applicable to
> monochrome raw data.
> 
> Sakari, any opinion ?

I'd be in favour of that approach, yes. We can introduce the corresponding
media bus codes later on, that's a separate issue but the same approach
should be used there, too.

-- 
Kind regards,

Sakari Ailus

