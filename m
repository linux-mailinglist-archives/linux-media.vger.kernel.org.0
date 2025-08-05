Return-Path: <linux-media+bounces-38920-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1562B1B299
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 13:27:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 645E63B91D5
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 11:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85602528F3;
	Tue,  5 Aug 2025 11:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="esY4Z7jq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C00D15A8;
	Tue,  5 Aug 2025 11:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754393261; cv=none; b=GNnsa4JCqq2MN+1vqueaeGlHHxcq9sVHLibm0gyycFISji2JfwQfJgfeB1/5PjM8tW7571ZXn73E8XRvSUkgoeIO/ZtjQ0vuyc5b6UQoC0ZIDO7Cs0OzkpzhaiyBJbJeuOu5/KgJTLAkFkf1l0dfX7T2RvPFxSIAy9RKWKqq4Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754393261; c=relaxed/simple;
	bh=5bV8swrKPxegKK0V/mNd74UNbap2bZYh8I72lHpL+Vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZ3EVO7HQaczv8wFD6yPkxim73KaqU/Q/J66Wt9TSkFzUkVF0LeYKgC4B78ZC7ly43FOdm7LQQ5j9lzxROfefifo46ZbGmG8+IA3DmOrTrEjgiKosp0jicV5fUy96jIxHcpdXjT3ptRBHI6LqLFxPzvg/872QHc+LPcl1xzIzfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=esY4Z7jq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BED6176B;
	Tue,  5 Aug 2025 13:26:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754393206;
	bh=5bV8swrKPxegKK0V/mNd74UNbap2bZYh8I72lHpL+Vw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=esY4Z7jqJWLMvcBaNXYvl51W8rWBxFbzwoLBY4qyHtWcnjV+sCE1gMwuUPMqXFC9R
	 2Ug840vA0qJSCa95LhWNI1sY5hjDKNSjAlYTzRagcGHrtxNO1n3X3UMNaAOn7ekPp7
	 vi0M22xqyt+llU+rA+WD7V+F/ZDTEOX8KWCjnJwA=
Date: Tue, 5 Aug 2025 13:27:30 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jerome.forissier@linaro.org, 
	kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v11 08/19] media: uapi: Add controls for Mali-C55 ISP
Message-ID: <rixk2meihmzkixemu7uygd6ebojhwgxi5xfgcwbamydzk25yt5@j4t4eliandqq>
References: <20250714-c55-v11-0-bc20e460e42a@ideasonboard.com>
 <20250714-c55-v11-8-bc20e460e42a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250714-c55-v11-8-bc20e460e42a@ideasonboard.com>

Hi Dan

On Mon, Jul 14, 2025 at 04:06:34PM +0100, Daniel Scally wrote:
> Add definitions and documentation for the custom control that will
> be needed by the Mali-C55 ISP driver. This will be a read only
> bitmask of the driver's capabilities, informing userspace of which
> blocks are fitted and which are absent.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v11:
>
> 	- Reserve 16 controls in line with other drivers
>
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
> +    Detail the capabilities of the ISP by giving detail about the fitted blocks.

This doesn't tell what is the control type. Just add "(bitmask)" to the
control name

``V4L2_CID_MALI_C55_CAPABILITIES (bitmask)``

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

Do we want "_FITTED" in the control values ?

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

afaik you can't use BIT() in uapi headers. Use (1U << 0)

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
> index f836512e9debbc65d62a9fe04069b056be42f7b2..9f07d80d7af1dfb347fca6e2c65b25bc2cb86af1 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -228,6 +228,12 @@ enum v4l2_colorfx {
>   */
>  #define V4L2_CID_USER_RKISP1_BASE		(V4L2_CID_USER_BASE + 0x1220)
>
> +/*
> + * The base for the Arm Mali-C55 ISP driver controls.
> + * We reserve 8 controls for this driver

Doesn't the commit message says 16 ?

> + */
> +#define V4L2_CID_USER_MALI_C55_BASE		(V4L2_CID_USER_BASE + 0x1230)
> +
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls
>   * and the 'MPEG' part of the define is historical */
>
> --
> 2.34.1
>
>

