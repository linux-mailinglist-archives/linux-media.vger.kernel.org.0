Return-Path: <linux-media+bounces-28195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A83F6A60D0B
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 10:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 947E61889800
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 09:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D281E5B73;
	Fri, 14 Mar 2025 09:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W4SkwcDN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949BD1802AB;
	Fri, 14 Mar 2025 09:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741944031; cv=none; b=TBWF3GVV54JiA6HPm2MV4tTyptPym67DNHY1GspeMeuIBVMqLDTDnLj9znocWIZtuS2jybTwHFlsWSismlz+H5u4mPuousuBbFLlqBnTn1FuK5oo0wxDoih27d363JzhDa1JeNuVhnidXg39fZkh0gJpfsaeCn3h5k/9RuUjCs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741944031; c=relaxed/simple;
	bh=bYaxuFrySYvo/USeVwO84kqCyoUoRj6ASTfNVNx2hvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWjgrzs0woVgsT31dLucTrbwoO+FHAUsuaTfnILrRChh/9tMlfUIX+HjzHpvGk24glcqS+o6X3X0zcBtNL16JXArVeZbSvf29e+8Z6z/cAckvcjiTN4QylYKkg+hPruqTwWy0z4iyTh3LBY7mu39ey2N2/VdW9XAQEzQuDsWtoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W4SkwcDN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741944029; x=1773480029;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bYaxuFrySYvo/USeVwO84kqCyoUoRj6ASTfNVNx2hvw=;
  b=W4SkwcDNakvvYG01VH/qzXEXhkwu96Nz0uSMc2/hA8a5YGa8rEVsqBoZ
   nUr+PbRdPRrdS1Ovt2EhNpzHprBbMgoKK/oUhIIhN2/HW9ujMooMM3qVj
   98hJBLXak8OYKfHMovZKAWvu38sm3FUh++ZgBX9YrgJqD+NUURCKCz3Z0
   w1lQYRSfmZzTR9yUFtR/q+kSSoDA6gfWRXM1vwMj6TfSc1sP561IydnWD
   1xAOcJM4FrApKr/ULEmAbh9W3pA4MPNRrhgZXhyLJogNFt7h8vWmiVhWj
   zn5kC6MtEDbR28+nBn5XYokB3H/Jnu91fkpZRXRlKQV6aSktVDGYMoHZC
   g==;
X-CSE-ConnectionGUID: I5uNRhByT/uIAUyKfY9Tzg==
X-CSE-MsgGUID: cvL7k8oURvaIqiK729oiaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43193797"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="43193797"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 02:20:28 -0700
X-CSE-ConnectionGUID: gU132nweQIekepMrs6x3VA==
X-CSE-MsgGUID: L3Lw7PgDQnyaBwsusvAlcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="152150171"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 02:20:27 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 32A0011F944;
	Fri, 14 Mar 2025 11:20:23 +0200 (EET)
Date: Fri, 14 Mar 2025 09:20:23 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/8] media: v4l: ctrls: add a control for flash/strobe
 duration
Message-ID: <Z9P01zU_Kg0U62wa@kekkonen.localdomain>
References: <20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev>
 <20250314-ov9282-flash-strobe-v2-1-14d7a281342d@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-ov9282-flash-strobe-v2-1-14d7a281342d@linux.dev>

Hi Richard,

Thanks for the set.

On Fri, Mar 14, 2025 at 09:49:55AM +0100, Richard Leitner wrote:
> Add a control V4L2_CID_FLASH_DURATION to set the duration of a
> flash/strobe pulse. This is different to the V4L2_CID_FLASH_TIMEOUT
> control, as the timeout defines a limit after which the flash is
> "forcefully" turned off again.
> 
> On the other hand the new V4L2_CID_FLASH_DURATION is the desired length
> of the flash/strobe pulse

What's the actual difference between the two? To me they appear the same,
just expressed in a different way.

> 
> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c | 1 +
>  include/uapi/linux/v4l2-controls.h        | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 1ea52011247accc51d0261f56eab1cf13c0624a0..f9ed7273a9f3eafe01c31b638e1c8d9fcf5424af 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1135,6 +1135,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_FLASH_FAULT:		return "Faults";
>  	case V4L2_CID_FLASH_CHARGE:		return "Charge";
>  	case V4L2_CID_FLASH_READY:		return "Ready to Strobe";
> +	case V4L2_CID_FLASH_DURATION:		return "Strobe Duration";
>  
>  	/* JPEG encoder controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 974fd254e57309e6def95b4a4f8e4de13a3972a7..80050cadb8377e3070ebbadc493fcd08b2c12c0b 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1173,6 +1173,7 @@ enum v4l2_flash_strobe_source {
>  
>  #define V4L2_CID_FLASH_CHARGE			(V4L2_CID_FLASH_CLASS_BASE + 11)
>  #define V4L2_CID_FLASH_READY			(V4L2_CID_FLASH_CLASS_BASE + 12)
> +#define V4L2_CID_FLASH_DURATION			(V4L2_CID_FLASH_CLASS_BASE + 13)
>  
>  
>  /* JPEG-class control IDs */
> 

-- 
Regards,

Sakari Ailus

