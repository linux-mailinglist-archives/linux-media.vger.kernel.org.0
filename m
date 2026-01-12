Return-Path: <linux-media+bounces-50439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA542D120FD
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:54:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05EB03047FED
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D2E34DCDB;
	Mon, 12 Jan 2026 10:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TOvu2V8v"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DE834DCE2
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215194; cv=none; b=qYFBjel4IhTkeU4mxQCKf4/4U8fhEMWyWmJhB2wXGEV0Zr57gkIXeE7ytnkHl86uUiMnuu9ZfLTyF68np1wrEVwO7VC1zOH9KMNhqU/txBPUFkf5TEKnhZU7IY1tX7cHPlg7qCIgOXpmauUxRlFzigQN/aSBw4JOJmmvNUx+cdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215194; c=relaxed/simple;
	bh=kcCLF8haeZnlyS5+6ms21wsAf7Gfj6MMoJrY4svq7U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKOGhImwVP9+LehIEhVsp0gdY2My7Ki4RG+6ignqjgZH5h4p/GDrpMkWhfFeT/WjzP7OV6+DLIqdi1bkiQChg8VxH3KK6+55+XFZMs4MVxdwoI8s3gg8+gohHFp24jV30vXZLGt+hNfLusgbQplQhjIk0V1DR+r/g4ECM2kXSU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TOvu2V8v; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768215193; x=1799751193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kcCLF8haeZnlyS5+6ms21wsAf7Gfj6MMoJrY4svq7U8=;
  b=TOvu2V8vT4tcxJ13ALrFLKj8ee7kWS4/TfRfDkLFqNZw7cay3DSJM7Rp
   k+P6P2CaMe26ngS3ESoVeLXP1nSlVjCzbPwpHNNNvE7jHYXlQrmlA50Ma
   KhhHETmzXVH8p28JWv94EygZJr2DWrZk3Gu5Jwix6cSbirwnl9syIlkfJ
   AFyIrMOB8d6rPzhC3yKjAOrjmQr2Nf6DgpLZ/hcO4ujKjjS/Wt68hmjep
   3xGyBZ3Bq/7f1U9LvFDjNQKEIEN0HZPZHZCW4eAvuunebONjkDYQbpB7P
   O0tYBm2QVC54pTeaJKtDoeMescwEKH12WY2TE22mvhWYByHlN9lo5Qq6+
   Q==;
X-CSE-ConnectionGUID: TOxgcSobT4u4GOhGjqdlHA==
X-CSE-MsgGUID: iOQpaMcRSxajcHcIVtfWvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="80853317"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="80853317"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:53:12 -0800
X-CSE-ConnectionGUID: 8YIzBCZvRIOPHeU/C1akSg==
X-CSE-MsgGUID: eTG0y8dnS9WGAMevo8CG9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208540647"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:53:10 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 820AF121E83;
	Mon, 12 Jan 2026 12:53:08 +0200 (EET)
Date: Mon, 12 Jan 2026 12:53:08 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Karthikey Kadati <karthikey3608@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Unix Antigravity <unix.antigravity@test.com>
Subject: Re: [PATCH 4/4] staging: atomisp: Replace ia_css_region with
 v4l2_rect
Message-ID: <aWTSlHaTiYejXoag@kekkonen.localdomain>
References: <20260112102518.19926-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112102518.19926-1-karthikey3608@gmail.com>

Hi Karthikey,

Thanks for the patches.

On Mon, Jan 12, 2026 at 03:55:18PM +0530, Karthikey Kadati wrote:
> Replace custom struct ia_css_region with standard struct v4l2_rect
> 
> to align with V4L2 API.

You seem to systematically have an extra newline between the lines of text
in the commit messages. Please fix that.

Please try to send patches in consistent sets to the relevant recipients
and avoid sending new versions before people have time to comment on the
previous ones. Also please think before sending whether there's still
something to fix and detail what changes there were from the previous
version (below the '---' line).

> 
> Signed-off-by: Unix Antigravity <unix.antigravity@test.com>

I guess this is possible but it looks like bogus Sob: line.

Who wrote the patch, should there be Co-developed-by: tag?

> Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/ia_css_types.h | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/ia_css_types.h b/drivers/staging/media/atomisp/pci/ia_css_types.h
> index 5c21a5415..7cfb355c8 100644
> --- a/drivers/staging/media/atomisp/pci/ia_css_types.h
> +++ b/drivers/staging/media/atomisp/pci/ia_css_types.h
> @@ -18,6 +18,7 @@
>  #include <type_support.h>
>  
>  #include "ia_css_frac.h"
> +#include <linux/videodev2.h>
>  
>  #include "isp/kernels/aa/aa_2/ia_css_aa2_types.h"
>  #include "isp/kernels/anr/anr_1.0/ia_css_anr_types.h"
> @@ -430,12 +431,10 @@ struct ia_css_point {
>  /**
>   * This specifies the region
>   */
> -struct ia_css_region {
> -	s32 left; /** Starting point coordinates for the region */
> -	s32 top;
> -	s32 width; /** Region resolution */
> -	s32 height;
> -};
> +/**
> + * This specifies the region
> + */
> +/* struct v4l2_rect has been replaced by struct v4l2_rect */
>  
>  /**
>   * Digital zoom:
> @@ -444,7 +443,7 @@ struct ia_css_region {
>   * Set the digital zoom factor, this is a logarithmic scale. The actual zoom
>   * factor will be 64/x.
>   * Setting dx or dy to 0 disables digital zoom for that direction.
> - * New API change for Digital zoom:(added struct ia_css_region zoom_region)
> + * New API change for Digital zoom:(added struct v4l2_rect zoom_region)
>   * zoom_region specifies the origin of the zoom region and width and
>   * height of that region.
>   * origin : This is the coordinate (x,y) within the effective input resolution
> @@ -457,7 +456,7 @@ struct ia_css_region {
>  struct ia_css_dz_config {
>  	u32 dx; /** Horizontal zoom factor */
>  	u32 dy; /** Vertical zoom factor */
> -	struct ia_css_region zoom_region; /** region for zoom */
> +	struct v4l2_rect zoom_region; /** region for zoom */
>  };
>  
>  /* The still capture mode, this can be RAW (simply copy sensor input to DDR),

-- 
Regards,

Sakari Ailus

