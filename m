Return-Path: <linux-media+bounces-43631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C0FBB3B3B
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 12:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61E7819C50F4
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 10:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CB330DED1;
	Thu,  2 Oct 2025 10:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jsvZgVv1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D45E2797AF;
	Thu,  2 Oct 2025 10:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759402313; cv=none; b=OPX3HxoSUVDuWCR8v0AkU5uuj/cMJMbqFO99sBWz4PKAcYhrBoIapSmssjEOOMidTugd5VLCW6LHMJasYFHdQiKwdvJ/zJTIjiQQY52knEeaqAIyo+wo3jBgZZzg4s7oqXuot5JBimUGJig2RxKfT7E7csI/D5VFjkdLhBgbjjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759402313; c=relaxed/simple;
	bh=5zzHd+UzzbKsdAOWfQGT0NF7dGmzNGzItr0+1WC4UHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqEsnnoXA6qHjl8M7xPKl7kYyQy3i4kpfNvtl2gpxDNLeqk5pbEcQL2vAUEm4AbzQGkxGJ0j54ianxvYExkm2UkKH9F2VKqbKXjCOQe+V/rTY9/xxhyBlW0TEnh1p1xoOGBSUz5rUJSz0lxqKq4livXEB910/CfDVjg5ViE2+MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jsvZgVv1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81789F06;
	Thu,  2 Oct 2025 12:50:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759402219;
	bh=5zzHd+UzzbKsdAOWfQGT0NF7dGmzNGzItr0+1WC4UHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jsvZgVv1aHIc3cPBqoecelbupioWnEgABkx+LqgJbjcl6jDk87vbsFmwX0MuuviRV
	 K7RQqG+jnc25/r+Jzz6kbQarActkOozOXiZFJZCtLOomPMk5BnuO9THYpJiAYA29Vi
	 vGuesFDCn6w10JvKl0KXI3RkQEMOcEluX3t6d9hI=
Date: Thu, 2 Oct 2025 12:51:46 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jerome.forissier@linaro.org, 
	kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v12 04/15] media: uapi: Add controls for Mali-C55 ISP
Message-ID: <fazmzj2fjyq2jwddn3jualrs6tgoeklltb7kf6jxpc3vme3lut@goxizfy74zx4>
References: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com>
 <20251002-c55-v12-4-3eda2dba9554@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251002-c55-v12-4-3eda2dba9554@ideasonboard.com>

Hi Dan

On Thu, Oct 02, 2025 at 11:18:23AM +0100, Daniel Scally wrote:
> Add definitions and documentation for the custom control that will
> be needed by the Mali-C55 ISP driver. This will be a read only
> bitmask of the driver's capabilities, informing userspace of which
> blocks are fitted and which are absent.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v12:
>
> 	- Removed _FITTED suffix from control value names
> 	- Specified bitmask for control name
> 	- Used (1 << n) instead of BIT(n) in uapi header
> 	- Updated comment to reserve 16 controls for driver
>
> Changes in v11:
>
> 	- None
> Changes in v10:
>
> 	- None
>
> Changes in v9:
>
> 	- New patch
> ---
>  .../userspace-api/media/drivers/index.rst          |  1 +
>  .../userspace-api/media/drivers/mali-c55.rst       | 55 ++++++++++++++++++++++
>  include/uapi/linux/media/arm/mali-c55-config.h     | 26 ++++++++++
>  include/uapi/linux/v4l2-controls.h                 |  6 +++
>  4 files changed, 88 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
> index d706cb47b1122b6e145a02ab826eb3ecc7997c2b..02967c9b18d6e90f414ccc1329c09bffee895e68 100644
> --- a/Documentation/userspace-api/media/drivers/index.rst
> +++ b/Documentation/userspace-api/media/drivers/index.rst
> @@ -32,6 +32,7 @@ For more details see the file COPYING in the source distribution of Linux.
>  	cx2341x-uapi
>  	dw100
>  	imx-uapi
> +	mali-c55
>  	max2175
>  	npcm-video
>  	omap3isp-uapi
> diff --git a/Documentation/userspace-api/media/drivers/mali-c55.rst b/Documentation/userspace-api/media/drivers/mali-c55.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..74f2cdb717e0dddeb11fb1eaba69eeebb2534f95
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
> +``V4L2_CID_MALI_C55_CAPABILITIES (bitmask)``
> +    Detail the capabilities of the ISP by giving detail about the fitted blocks.
> +
> +    .. flat-table:: Bitmask meaning definitions
> +	:header-rows: 1
> +	:widths: 2 4 8
> +
> +	* - Bit

I see the other (bitmask) controls not specifying the bit but only the
macro. To me, this is fine as it is, but I'm just pointing it out.


> +	  - Macro
> +	  - Meaning
> +        * - 0
> +          - MALI_C55_GPS_PONG

GPS is the register name, not sure it has value here.

With maybe "GPS" rmeove, if you agree
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j


> +          - Pong configuration space is fitted in the ISP
> +        * - 1
> +          - MALI_C55_GPS_WDR
> +          - WDR Framestitch, offset and gain is fitted in the ISP
> +        * - 2
> +          - MALI_C55_GPS_COMPRESSION
> +          - Temper compression is fitted in the ISP
> +        * - 3
> +          - MALI_C55_GPS_TEMPER
> +          - Temper is fitted in the ISP
> +        * - 4
> +          - MALI_C55_GPS_SINTER_LITE
> +          - Sinter Lite is fitted in the ISP instead of the full Sinter version
> +        * - 5
> +          - MALI_C55_GPS_SINTER
> +          - Sinter is fitted in the ISP
> +        * - 6
> +          - MALI_C55_GPS_IRIDIX_LTM
> +          - Iridix local tone mappine is fitted in the ISP
> +        * - 7
> +          - MALI_C55_GPS_IRIDIX_GTM
> +          - Iridix global tone mapping is fitted in the ISP
> +        * - 8
> +          - MALI_C55_GPS_CNR
> +          - Colour noise reduction is fitted in the ISP
> +        * - 9
> +          - MALI_C55_GPS_FRSCALER
> +          - The full resolution pipe scaler is fitted in the ISP
> +        * - 10
> +          - MALI_C55_GPS_DS_PIPE
> +          - The downscale pipe is fitted in the ISP
> +
> +    The Mali-C55 ISP can be configured in a number of ways to include or exclude
> +    blocks which may not be necessary. This control provides a way for the
> +    driver to communicate to userspace which of the blocks are fitted in the
> +    design.
> \ No newline at end of file
> diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..7fddece54ada9dadc3c76372d496d9395237a41c
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
> +#define V4L2_CID_MALI_C55_CAPABILITIES	(V4L2_CID_USER_MALI_C55_BASE + 0x0)
> +#define MALI_C55_GPS_PONG		(1U << 0)
> +#define MALI_C55_GPS_WDR		(1U << 1)
> +#define MALI_C55_GPS_COMPRESSION	(1U << 2)
> +#define MALI_C55_GPS_TEMPER		(1U << 3)
> +#define MALI_C55_GPS_SINTER_LITE	(1U << 4)
> +#define MALI_C55_GPS_SINTER		(1U << 5)
> +#define MALI_C55_GPS_IRIDIX_LTM		(1U << 6)
> +#define MALI_C55_GPS_IRIDIX_GTM		(1U << 7)
> +#define MALI_C55_GPS_CNR		(1U << 8)
> +#define MALI_C55_GPS_FRSCALER		(1U << 9)
> +#define MALI_C55_GPS_DS_PIPE		(1U << 10)
> +
> +#endif /* __UAPI_MALI_C55_CONFIG_H */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 2d30107e047ee3cf6b149e5b075cc9d4137b7d3f..f84ed133a6c9b2ddc1aedbd582ddf78cb71f34e5 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -228,6 +228,12 @@ enum v4l2_colorfx {
>   */
>  #define V4L2_CID_USER_RKISP1_BASE		(V4L2_CID_USER_BASE + 0x1220)
>
> +/*
> + * The base for the Arm Mali-C55 ISP driver controls.
> + * We reserve 16 controls for this driver
> + */
> +#define V4L2_CID_USER_MALI_C55_BASE		(V4L2_CID_USER_BASE + 0x1230)
> +
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls
>   * and the 'MPEG' part of the define is historical */
>
> --
> 2.43.0
>

