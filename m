Return-Path: <linux-media+bounces-30666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E7EA95981
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 00:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 964C53A924C
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 22:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6E222A80D;
	Mon, 21 Apr 2025 22:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JfvCQGqS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D57738382;
	Mon, 21 Apr 2025 22:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745275381; cv=none; b=MkRbPdWYwXBDj/PigtRQ1oyvHv2lapD908heQo1nr1pVgWX5xTM38FoChMDFMjJwBPstZxzTT3xivStpWUkfz+rdbnb8jnTTe1PiejuU1+bWhPvWlDNcmA5lc9LvSIN8G6KnpY+dY4YWD3GQMWmQTQ4KZXPXUZy816NwGOU6aBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745275381; c=relaxed/simple;
	bh=xd751dLcfNHbsSQ5WqHXXifwddmkXdzXkLHaagG9qPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/jasf5wZxuvrf94EHwf7szWqdtueNKDsbcf2PTXtOLUBPFWSioq9l9iVLEPt0dLN/yzALkw19nPhMqU9v1TNkPD2MLrI65agXdfpyYo/mw+kyGM6P8vMsm9ngKSRDKJCfJv4QPbz+ZIE/5ExyQSmYuHFhIgvGct/K7J3j0PeK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JfvCQGqS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 467D5606;
	Tue, 22 Apr 2025 00:40:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745275250;
	bh=xd751dLcfNHbsSQ5WqHXXifwddmkXdzXkLHaagG9qPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JfvCQGqSYc8gizhZFhNs9Fglo4Go9GpvCHaqF0otof2JUFTvmogN1ZV1c4Oc7V2T6
	 f67rGVQDQQ6RDFIBUm0NKgvOvFqY6X/Ediok+iAHe9v7WR4UOee2NqqhVTWVD1bkSb
	 TWggLFn7geiMzVCfyPFOdBzeckFQBHRASMtJ/tRc=
Date: Tue, 22 Apr 2025 01:42:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 5/7] media: rcar-isp: Move driver to own directory
Message-ID: <20250421224255.GA17813@pendragon.ideasonboard.com>
References: <20250421111240.789510-1-niklas.soderlund+renesas@ragnatech.se>
 <20250421111240.789510-6-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421111240.789510-6-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Mon, Apr 21, 2025 at 01:12:38PM +0200, Niklas Söderlund wrote:
> Before extending the driver with functions from the R-Car ISP core that
> will span multiple files move the existing driver to a separate
> directory. While at it rename the single source file to allow future
> files to be grouped by functions.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  MAINTAINERS                                    |  2 +-
>  drivers/media/platform/renesas/Kconfig         | 18 +-----------------
>  drivers/media/platform/renesas/Makefile        |  2 +-
>  .../media/platform/renesas/rcar-isp/Kconfig    | 17 +++++++++++++++++
>  .../media/platform/renesas/rcar-isp/Makefile   |  4 ++++
>  .../renesas/{rcar-isp.c => rcar-isp/csisp.c}   |  0
>  6 files changed, 24 insertions(+), 19 deletions(-)
>  create mode 100644 drivers/media/platform/renesas/rcar-isp/Kconfig
>  create mode 100644 drivers/media/platform/renesas/rcar-isp/Makefile
>  rename drivers/media/platform/renesas/{rcar-isp.c => rcar-isp/csisp.c} (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 465569a7b264..4904d0896773 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14917,7 +14917,7 @@ F:	Documentation/devicetree/bindings/media/renesas,csi2.yaml
>  F:	Documentation/devicetree/bindings/media/renesas,isp.yaml
>  F:	Documentation/devicetree/bindings/media/renesas,vin.yaml
>  F:	drivers/media/platform/renesas/rcar-csi2.c
> -F:	drivers/media/platform/renesas/rcar-isp.c
> +F:	drivers/media/platform/renesas/rcar-isp/
>  F:	drivers/media/platform/renesas/rcar-vin/
>  
>  MEDIA DRIVERS FOR RENESAS - VSP1
> diff --git a/drivers/media/platform/renesas/Kconfig b/drivers/media/platform/renesas/Kconfig
> index c7fc718a30a5..27a54fa79083 100644
> --- a/drivers/media/platform/renesas/Kconfig
> +++ b/drivers/media/platform/renesas/Kconfig
> @@ -30,23 +30,6 @@ config VIDEO_RCAR_CSI2
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called rcar-csi2.
>  
> -config VIDEO_RCAR_ISP
> -	tristate "R-Car Image Signal Processor (ISP)"
> -	depends on V4L_PLATFORM_DRIVERS
> -	depends on VIDEO_DEV && OF
> -	depends on ARCH_RENESAS || COMPILE_TEST
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select RESET_CONTROLLER
> -	select V4L2_FWNODE
> -	help
> -	  Support for Renesas R-Car Image Signal Processor (ISP).
> -	  Enable this to support the Renesas R-Car Image Signal
> -	  Processor (ISP).
> -
> -	  To compile this driver as a module, choose M here: the
> -	  module will be called rcar-isp.
> -
>  config VIDEO_SH_VOU
>  	tristate "SuperH VOU video output driver"
>  	depends on V4L_PLATFORM_DRIVERS
> @@ -56,6 +39,7 @@ config VIDEO_SH_VOU
>  	help
>  	  Support for the Video Output Unit (VOU) on SuperH SoCs.
>  
> +source "drivers/media/platform/renesas/rcar-isp/Kconfig"
>  source "drivers/media/platform/renesas/rcar-vin/Kconfig"
>  source "drivers/media/platform/renesas/rzg2l-cru/Kconfig"
>  
> diff --git a/drivers/media/platform/renesas/Makefile b/drivers/media/platform/renesas/Makefile
> index 50774a20330c..1127259c09d6 100644
> --- a/drivers/media/platform/renesas/Makefile
> +++ b/drivers/media/platform/renesas/Makefile
> @@ -3,13 +3,13 @@
>  # Makefile for the Renesas capture/playback device drivers.
>  #
>  
> +obj-y += rcar-isp/
>  obj-y += rcar-vin/
>  obj-y += rzg2l-cru/
>  obj-y += vsp1/
>  
>  obj-$(CONFIG_VIDEO_RCAR_CSI2) += rcar-csi2.o
>  obj-$(CONFIG_VIDEO_RCAR_DRIF) += rcar_drif.o
> -obj-$(CONFIG_VIDEO_RCAR_ISP) += rcar-isp.o
>  obj-$(CONFIG_VIDEO_RENESAS_CEU) += renesas-ceu.o
>  obj-$(CONFIG_VIDEO_RENESAS_FCP) += rcar-fcp.o
>  obj-$(CONFIG_VIDEO_RENESAS_FDP1) += rcar_fdp1.o
> diff --git a/drivers/media/platform/renesas/rcar-isp/Kconfig b/drivers/media/platform/renesas/rcar-isp/Kconfig
> new file mode 100644
> index 000000000000..59e0d91862d1
> --- /dev/null
> +++ b/drivers/media/platform/renesas/rcar-isp/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0

Add a blank line here.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +config VIDEO_RCAR_ISP
> +	tristate "R-Car Image Signal Processor (ISP)"
> +	depends on V4L_PLATFORM_DRIVERS
> +	depends on VIDEO_DEV && OF
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select RESET_CONTROLLER
> +	select V4L2_FWNODE
> +	help
> +	  Support for Renesas R-Car Image Signal Processor (ISP).
> +	  Enable this to support the Renesas R-Car Image Signal
> +	  Processor (ISP).
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called rcar-isp.
> diff --git a/drivers/media/platform/renesas/rcar-isp/Makefile b/drivers/media/platform/renesas/rcar-isp/Makefile
> new file mode 100644
> index 000000000000..b542118c831e
> --- /dev/null
> +++ b/drivers/media/platform/renesas/rcar-isp/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +rcar-isp-objs = csisp.o
> +
> +obj-$(CONFIG_VIDEO_RCAR_ISP) += rcar-isp.o
> diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> similarity index 100%
> rename from drivers/media/platform/renesas/rcar-isp.c
> rename to drivers/media/platform/renesas/rcar-isp/csisp.c

-- 
Regards,

Laurent Pinchart

