Return-Path: <linux-media+bounces-28487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B3BA68F18
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 15:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 689A7176373
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 14:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FCE1D7E5F;
	Wed, 19 Mar 2025 14:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h0bujmvl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C401AF0D7;
	Wed, 19 Mar 2025 14:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742394349; cv=none; b=YkdU8MghQE6IICBw8ZzQ8UFUdv+ePfzQyjQDQx3oS9IM/9eImY+HfeEad4+z27a6jIQ7bcNOw7iAUa19we1m+wQKj+Yc9vlbjViGfT3HdniW/w+xYsOKvDbt+UK2cXop6KeLLFvJHwvm3gAn8JBl1MA80c2t2VL3A/6aJhiUOhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742394349; c=relaxed/simple;
	bh=h+cdS3pTwJUVuEV6GWnYBg/ZoOiO0Y9wWE4vjGoAuvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ju17+/kelVMIaqrlmUkUo0Vy11uQ5rHg0KaqJPamGwkP5c4JlgAQlDRi6Cbc5ILKf8srkA1lhvN13UOvaeyEgJFbgtE2WUkqNk0H4nq6EO23jNy52B/ZRGkc1q61YAREjYqnvl5kKzbpiiJ69QFiW5zmswxV2sLflJEJxSf87bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h0bujmvl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB51355A;
	Wed, 19 Mar 2025 15:24:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742394241;
	bh=h+cdS3pTwJUVuEV6GWnYBg/ZoOiO0Y9wWE4vjGoAuvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h0bujmvl5pn9HbXHhdQ4XKMx1Y5uDd2NqnHkzFfKPPg2qPv+7+CHlhFUsEW1U4NWQ
	 VDXYll0xmbkCO5BbFySJmeti3o8j3Q7DinRQLS+RgDumGljxWQiyfyI00ZyUrBoK6d
	 gLc4I7v7+xSWiRpfrybobTPGRyIizM15uRmkQZI4=
Date: Wed, 19 Mar 2025 15:25:40 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/7] media: rcar-isp: Move driver to own directory
Message-ID: <2i2jtexgxiar2qwgpp3ujgshezj7fxo52f7n5xlexi7ieajimw@qwdw5e7dypet>
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
 <20250315152708.328036-6-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250315152708.328036-6-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas

On Sat, Mar 15, 2025 at 04:27:06PM +0100, Niklas Söderlund wrote:
> Before extending the driver with functions from the R-Car ISP core that
> will span multiple files move the existing driver to a separate
> directory. While at it rename the single source file to allow future
> files to be grouped by functions.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

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
> index f3658f16fa24..c2f36486f5f5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14679,7 +14679,7 @@ F:	Documentation/devicetree/bindings/media/renesas,csi2.yaml
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
> --
> 2.48.1
>
>

