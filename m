Return-Path: <linux-media+bounces-35758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E89AE6257
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FE00174ED1
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BAF117A2E8;
	Tue, 24 Jun 2025 10:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mnNS1jZN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B15025DB13
	for <linux-media@vger.kernel.org>; Tue, 24 Jun 2025 10:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760726; cv=none; b=u4M453hvW4Z298gryh6BD0bGyP6tImUl5QtjnSNxWvtmJ8Vojs/Opx7uTQ1pIlv9G+cmGhxJVJHlmuS4elJhEnBaaTFj79jKlgXJ6BD4t1LVJp93DIQAlTWNWiWdivvUWOMYW+YG/WKaHgS9YfFvsokJGPydarCYHLaYmuXdMSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760726; c=relaxed/simple;
	bh=UGyASD3pxDIRm2AfhiEKOTUQtG6T0n7VT2yO+QOe1wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZorA0PqGk/XVS9fQyAcNvDAMgOP68AtwfpEPQvkAJbvpQ3mOppnWsuxkB8SEZAY5CqEKPG4tigMjUlVqMm2Tbc7N0gRCnvLWGAXnVdYIHSaVQpCDiCx2XvPrVdqUrUGW4Kl6yiKkLM5MpuFwZtyjXTxdKHjN8OV+Mgxcv8ZfOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mnNS1jZN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750760725; x=1782296725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UGyASD3pxDIRm2AfhiEKOTUQtG6T0n7VT2yO+QOe1wg=;
  b=mnNS1jZNk9j7dtd0kXSFctSbiPH9fnSwDK4o2OO/IYWzMs4FP32jF612
   Et3CFZpCKZVf4bi0dGR36yGV8F2FQtWXAXbR30ILBsLSiirOOxHkVkGhm
   9f9O6HwnL/kDhWsB5WlUHrAyzc+eKrICWivHByfd3Q8swKjo5zuJ5oGml
   7CS5qtEv9EcNfqxmtZTfWf3zquHnb4HeOOc0ki84+0BKEJ85LtqFF8dLX
   spa4j7zhB120cIl5Ah7k4uS8Vn14RWw5D6rRRFBSjmRt/W75mXUVoiw8r
   sQ0infHwYF0zKpWNex9yGZwzliAtSZP+VJRZ4BfQELCyWoRq4Hm+mqTrY
   Q==;
X-CSE-ConnectionGUID: OWHeOfcFRM+TPGkkdl8fqQ==
X-CSE-MsgGUID: SLg8TN35TVy0hijJCRahXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52863105"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="52863105"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 03:25:24 -0700
X-CSE-ConnectionGUID: 65MDFVyfTPqicX1+/yUMWA==
X-CSE-MsgGUID: rO4vQubnT8yrI1HIqHCdiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="175477097"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.201])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 03:25:22 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 937D911FBA7;
	Tue, 24 Jun 2025 13:25:19 +0300 (EEST)
Date: Tue, 24 Jun 2025 10:25:19 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	jacopo.mondi@ideasonboard.com, Hans Verkuil <hverkuil@xs4all.nl>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v5 1/6] media: v4l2: Add Renesas Camera Receiver Unit
 pixel formats
Message-ID: <aFp9D-Ii43yNTOSx@kekkonen.localdomain>
References: <20250623-rzg2l-cru-v5-0-1663a8c6719a@ideasonboard.com>
 <20250623-rzg2l-cru-v5-1-1663a8c6719a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623-rzg2l-cru-v5-1-1663a8c6719a@ideasonboard.com>

Hi Daniel,

Thanks for the set.

On Mon, Jun 23, 2025 at 03:43:18PM +0100, Daniel Scally wrote:
> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> 
> The Renesas Camera Receiver Unit in the RZ/V2H SoC can output RAW
> data captured from an image sensor without conversion to an RGB/YUV
> format. In that case the data are packed into 64-bit blocks, with a
> variable amount of padding in the most significant bits depending on
> the bitdepth of the data. Add new V4L2 pixel format codes for the new
> formats, along with documentation to describe them.
> 
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> ---
> Changes in v5:
> 
> 	- None
> 
> Changes in v4:
> 
> 	- Removed references to "Bayer" or "srgb"
> 
> Changes in v3:
> 
> 	- Switched from bayer-order specific formats to generic RAWnn
> 
> Changes in v2:
> 
> 	- Added labels to the new formats in the documentation file
> 	- Added 20-bit formats
> ---
>  .../userspace-api/media/v4l/pixfmt-bayer.rst       |   1 +
>  .../userspace-api/media/v4l/pixfmt-rawnn-cru.rst   | 143 +++++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-common.c              |   6 +
>  drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +
>  include/uapi/linux/videodev2.h                     |   6 +
>  5 files changed, 160 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> index ed3eb432967d9845d3d65150831d8a7f62dec994..20a8aa04330479ed4d44c8e4fc3d57db8c2e6933 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> @@ -31,3 +31,4 @@ orders. See also `the Wikipedia article on Bayer filter
>      pixfmt-srggb14
>      pixfmt-srggb14p
>      pixfmt-srggb16
> +    pixfmt-rawnn-cru
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst b/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..d786833d0cf355b3955fe63d85c8a211a7a4fb23
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-rawnn-cru.rst
> @@ -0,0 +1,143 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +
> +.. _v4l2-pix-fmt-cru-raw10:
> +.. _v4l2-pix-fmt-cru-raw12:
> +.. _v4l2-pix-fmt-cru-raw14:
> +.. _v4l2-pix-fmt-cru-raw20:
> +
> +**********************************************************************************************************************************
> +V4L2_PIX_FMT_CRU_RAW10 ('CR10'), V4L2_PIX_FMT_CRU_RAW12 ('CR12'), V4L2_PIX_FMT_CRU_RAW14 ('CR14'), V4L2_PIX_FMT_CRU_RAW20 ('CR20')
> +**********************************************************************************************************************************

Regarding naming, could these be called V4L2_PIX_FMT_RAW_CRUxx, to align
the naming with the new raw formats?
<URL:https://www.retiisi.eu/~sailus/v4l2/tmp/common-raw/userspace-api/media/v4l/pixfmt-raw-generic.html>

If you rebase on the metadata series, I can pick this patch in the set. My
objective is to get this merged in this cycle, which of course also depends
on review feedback.

-- 
Regards,

Sakari Ailus

