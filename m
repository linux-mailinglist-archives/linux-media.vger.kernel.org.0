Return-Path: <linux-media+bounces-36157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5213FAECA37
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 22:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A18917B7B8
	for <lists+linux-media@lfdr.de>; Sat, 28 Jun 2025 20:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C7526C3B9;
	Sat, 28 Jun 2025 20:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7lV6etH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C751C7009;
	Sat, 28 Jun 2025 20:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751141329; cv=none; b=CrRSc3KfJPgn6o2o0FcaPGfLn7wRtMs2YFtjF/61P1Lu+PLvpW4HvAljI3RJFrU+owLEPKv/4lSqFJKX98FqZQqu0/1ZMslWotI/ma7i/VpDpHGnYfNsARmrKyLDUn620DaJV6BqPP6n6A6alA+DO+0xXBNkbPdtaS9DMgFqC04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751141329; c=relaxed/simple;
	bh=ZfgZmaAiWzFv3GNt+MGVb2OWQPwmzkXNENWhECrKFRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JnMYxY2/0yZsWcOkj5BoUF+0wZrWZkRJcqQ13FoTu0Go6t0tZlx/U2VBOjPW/VmFNVsE/TBo/Jeoj5m/umrpMx0DHInmZzVMRxkrFIPXufiDxCnDyxqdh8nEnxj0rUH7KSmO+iV/OcT/GLUCmcMzPD+3TNf/NUjxUPMhE/LBvYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7lV6etH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751141328; x=1782677328;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZfgZmaAiWzFv3GNt+MGVb2OWQPwmzkXNENWhECrKFRE=;
  b=k7lV6etHq1nI+39WAlTQiS7WcxSUR3NOEBoBI7uHyPORrYOPzP5U3H3M
   0FpDvGOtcO0vxgP4l388cz7z17FyGbyNTb5scoW5EIEN9PwFjcz9D7F85
   gNQdeFVZi9H0ShExs+otz0PpMdGUZU5nxQlCzvPpCUzBMd1zYBWSydwKK
   uKmI1qN5YbGEm9hVSHVrMt64cmPI9sKvB5bngXObaedZlBpYHIkALbiGx
   fgC9E12q4hQR48pD2H9KXvIlOWnGy/l9AE1V9QysGYRLiLJK/rcVwm00r
   1dD6tu+kLjj5cEFBpdm9JuhEGKaNR3ldtjtxilMyCH9yNQKEGDKatVPvK
   Q==;
X-CSE-ConnectionGUID: Bj1OwsSqSYeNbmhkMsuoCA==
X-CSE-MsgGUID: hWcOIXBJSg2SBBOYMVM1vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53517497"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="53517497"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 13:08:47 -0700
X-CSE-ConnectionGUID: NK4Puo7zQNCz9I9xl7ix7A==
X-CSE-MsgGUID: hH+vhDI5QjCAuvb9OlWEzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="153184418"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.245.225])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 13:08:42 -0700
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id B4BF44435F;
	Sat, 28 Jun 2025 23:08:39 +0300 (EEST)
Message-ID: <79e89e5a-c588-4e61-9400-80ac2fe707da@linux.intel.com>
Date: Sat, 28 Jun 2025 22:29:56 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 06/17] media: uapi: Add controls for Mali-C55 ISP
Content-Language: en-US
To: Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com,
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
 <20250624-c55-v10-6-54f3d4196990@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
In-Reply-To: <20250624-c55-v10-6-54f3d4196990@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

Thanks for the update.

On 6/24/25 13:21, Daniel Scally wrote:
> Add definitions and documentation for the custom control that will
> be needed by the Mali-C55 ISP driver. This will be a read only
> bitmask of the driver's capabilities, informing userspace of which
> blocks are fitted and which are absent.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v10:
> 
> 	- None
> 
> Changes in v9:
> 
> 	- New patch
> ---
>   .../userspace-api/media/drivers/index.rst          |  1 +
>   .../userspace-api/media/drivers/mali-c55.rst       | 55 ++++++++++++++++++++++
>   include/uapi/linux/media/arm/mali-c55-config.h     | 26 ++++++++++
>   include/uapi/linux/v4l2-controls.h                 |  6 +++
>   4 files changed, 88 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
> index d706cb47b1122b6e145a02ab826eb3ecc7997c2b..02967c9b18d6e90f414ccc1329c09bffee895e68 100644
> --- a/Documentation/userspace-api/media/drivers/index.rst
> +++ b/Documentation/userspace-api/media/drivers/index.rst
> @@ -32,6 +32,7 @@ For more details see the file COPYING in the source distribution of Linux.
>   	cx2341x-uapi
>   	dw100
>   	imx-uapi
> +	mali-c55
>   	max2175
>   	npcm-video
>   	omap3isp-uapi
> diff --git a/Documentation/userspace-api/media/drivers/mali-c55.rst b/Documentation/userspace-api/media/drivers/mali-c55.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..e8519da77d737b91a931bbe47920af707eebf110
> --- /dev/null
> +++ b/Documentation/userspace-api/media/drivers/mali-c55.rst
> @@ -0,0 +1,55 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Arm Mali-C55 ISP driver
> +=======================
> +
> +The Arm Mali-C55 ISP driver implements a single driver-specific control:
> +
> +``V4L2_CID_MALI_C55_CAPABILITIES``

Add: (integer)

?

> +    Detail the capabilities of the ISP by giving detail about the fitted blocks.
> +
> +    .. flat-table:: Bitmask meaning definitions
> +	:header-rows: 1
> +	:widths: 2 4 8
> +
> +	* - Bit
> +	  - Macro
> +	  - Meaning
> +        * - 0
> +          - MALI_C55_GPS_PONG_FITTED

How about a V4L2 prefix for these? Generally the controls have been 
V4L2_CID_something and the macros for the possible values have been 
named V4L2_something.

> +          - Pong configuration space is fitted in the ISP
> +        * - 1
> +          - MALI_C55_GPS_WDR_FITTED
> +          - WDR Framestitch, offset and gain is fitted in the ISP
> +        * - 2
> +          - MALI_C55_GPS_COMPRESSION_FITTED
> +          - Temper compression is fitted in the ISP
> +        * - 3
> +          - MALI_C55_GPS_TEMPER_FITTED
> +          - Temper is fitted in the ISP
> +        * - 4
> +          - MALI_C55_GPS_SINTER_LITE_FITTED
> +          - Sinter Lite is fitted in the ISP instead of the full Sinter version
> +        * - 5
> +          - MALI_C55_GPS_SINTER_FITTED
> +          - Sinter is fitted in the ISP
> +        * - 6
> +          - MALI_C55_GPS_IRIDIX_LTM_FITTED
> +          - Iridix local tone mappine is fitted in the ISP
> +        * - 7
> +          - MALI_C55_GPS_IRIDIX_GTM_FITTED
> +          - Iridix global tone mapping is fitted in the ISP
> +        * - 8
> +          - MALI_C55_GPS_CNR_FITTED
> +          - Colour noise reduction is fitted in the ISP
> +        * - 9
> +          - MALI_C55_GPS_FRSCALER_FITTED
> +          - The full resolution pipe scaler is fitted in the ISP
> +        * - 10
> +          - MALI_C55_GPS_DS_PIPE_FITTED
> +          - The downscale pipe is fitted in the ISP
> +
> +    The Mali-C55 ISP can be configured in a number of ways to include or exclude
> +    blocks which may not be necessary. This control provides a way for the
> +    driver to communicate to userspace which of the blocks are fitted in the
> +    design.
> \ No newline at end of file

Oops.

> diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..2bd60a0d78786be368c2e51b1a0a63fd2a5f690b
> --- /dev/null
> +++ b/include/uapi/linux/media/arm/mali-c55-config.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * ARM Mali-C55 ISP Driver - Userspace API
> + *
> + * Copyright (C) 2023 Ideas on Board Oy
> + */
> +
> +#ifndef __UAPI_MALI_C55_CONFIG_H
> +#define __UAPI_MALI_C55_CONFIG_H
> +
> +#include <linux/v4l2-controls.h>
> +
> +#define V4L2_CID_MALI_C55_CAPABILITIES		(V4L2_CID_USER_MALI_C55_BASE + 0x0)
> +#define MALI_C55_GPS_PONG_FITTED		BIT(0)

Since when has been BIT() defined for UAPI? (1U << x)?

> +#define MALI_C55_GPS_WDR_FITTED			BIT(1)
> +#define MALI_C55_GPS_COMPRESSION_FITTED		BIT(2)
> +#define MALI_C55_GPS_TEMPER_FITTED		BIT(3)
> +#define MALI_C55_GPS_SINTER_LITE_FITTED		BIT(4)
> +#define MALI_C55_GPS_SINTER_FITTED		BIT(5)
> +#define MALI_C55_GPS_IRIDIX_LTM_FITTED		BIT(6)
> +#define MALI_C55_GPS_IRIDIX_GTM_FITTED		BIT(7)
> +#define MALI_C55_GPS_CNR_FITTED			BIT(8)
> +#define MALI_C55_GPS_FRSCALER_FITTED		BIT(9)
> +#define MALI_C55_GPS_DS_PIPE_FITTED		BIT(10)
> +
> +#endif /* __UAPI_MALI_C55_CONFIG_H */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 72e32814ea83dee5f1202c1249eac7cf3b85a22a..a31105115410bd041a3ac492ce86becd93a62d87 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -222,6 +222,12 @@ enum v4l2_colorfx {
>    */
>   #define V4L2_CID_USER_UVC_BASE			(V4L2_CID_USER_BASE + 0x11e0)
>   
> +/*
> + * The base for the Arm Mali-C55 ISP driver controls.
> + * We reserve 8 controls for this driver
> + */
> +#define V4L2_CID_USER_MALI_C55_BASE		(V4L2_CID_USER_BASE + 0x1220)
> +
>   /* MPEG-class control IDs */
>   /* The MPEG controls are applicable to all codec controls
>    * and the 'MPEG' part of the define is historical */
> 


-- 
Sakari Ailus

