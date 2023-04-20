Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5696E96F5
	for <lists+linux-media@lfdr.de>; Thu, 20 Apr 2023 16:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbjDTOXu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Apr 2023 10:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231329AbjDTOXt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Apr 2023 10:23:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E00F40FE
        for <linux-media@vger.kernel.org>; Thu, 20 Apr 2023 07:23:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C62E9DE;
        Thu, 20 Apr 2023 16:23:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682000581;
        bh=QOpG3hCZpxihFB7roLb/FtYu3nkiDzNsEuElvYYd0KQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ldSKJNbTj9ZROxj5uphId/SxQHui5CwYIp2na5MjD4PwDPrE0QHkK2ksbt5RlTLyz
         2RFa9Qod3r+03X6C5JenCTl3D9CAj+uMUVs31kSqWS2tqZL6fSU1ub//QG+DtmBiOx
         lWzp/DuW6nYBMELdcCqPtRdOajzrA729n3cA5U1w=
Date:   Thu, 20 Apr 2023 17:23:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     bingbu.cao@intel.com
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        ilpo.jarvinen@linux.intel.com, tfiga@chromium.org,
        senozhatsky@chromium.org, hdegoede@redhat.com,
        bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
        hongju.wang@intel.com, daniel.h.kang@intel.com
Subject: Re: [RFC PATCH 12/14] media: add Kconfig and Makefile for IPU6
Message-ID: <20230420142320.GB17497@pendragon.ideasonboard.com>
References: <20230413100429.919622-1-bingbu.cao@intel.com>
 <20230413100429.919622-13-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230413100429.919622-13-bingbu.cao@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

Thank you for the patch. I'm happy to see this series landing on the
mailing list. I'm starting the review with the easy pieces :-)

On Thu, Apr 13, 2023 at 06:04:27PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Add IPU6 support in Kconfig and Makefile, with this patch you can
> build the Intel IPU6 and input system modules by select the
> CONFIG_VIDEO_INTEL_IPU6 in config.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/pci/Kconfig             |  1 +
>  drivers/media/pci/intel/Makefile      |  3 ++-
>  drivers/media/pci/intel/ipu6/Kconfig  | 15 +++++++++++++++
>  drivers/media/pci/intel/ipu6/Makefile | 23 +++++++++++++++++++++++
>  4 files changed, 41 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/pci/intel/ipu6/Kconfig
>  create mode 100644 drivers/media/pci/intel/ipu6/Makefile
> 
> diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
> index 480194543d05..38fb484f5c8e 100644
> --- a/drivers/media/pci/Kconfig
> +++ b/drivers/media/pci/Kconfig
> @@ -74,6 +74,7 @@ config VIDEO_PCI_SKELETON
>  	  when developing new drivers.
>  
>  source "drivers/media/pci/intel/ipu3/Kconfig"
> +source "drivers/media/pci/intel/ipu6/Kconfig"
>  
>  endif #MEDIA_PCI_SUPPORT
>  endif #PCI
> diff --git a/drivers/media/pci/intel/Makefile b/drivers/media/pci/intel/Makefile
> index 0b4236c4db49..de2b73fef890 100644
> --- a/drivers/media/pci/intel/Makefile
> +++ b/drivers/media/pci/intel/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  #
> -# Makefile for the IPU3 cio2 and ImGU drivers
> +# Makefile for the Intel IPU drivers
>  #
>  
>  obj-y	+= ipu3/
> +obj-$(CONFIG_VIDEO_INTEL_IPU6)	+= ipu6/
> diff --git a/drivers/media/pci/intel/ipu6/Kconfig b/drivers/media/pci/intel/ipu6/Kconfig
> new file mode 100644
> index 000000000000..c88ef2f40f6d
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu6/Kconfig
> @@ -0,0 +1,15 @@
> +config VIDEO_INTEL_IPU6

As there will (hopefully) be a driver for the processing system in the
future, should this Kconfig symbol be named with a reference to the
input system already (and the help text be updated accordingly) ? The
name "IPU6" covers both. Or do you envision that we would have a single
Kconfig symbol to select both drivers ?

> +	tristate "Intel IPU6 driver"
> +	depends on ACPI || COMPILE_TEST
> +	depends on MEDIA_SUPPORT
> +	depends on MEDIA_PCI_SUPPORT
> +	depends on X86_64

Do you use any x86-64 API, or could this be

	depends on X86_64 || COMPILE_TEST

?

> +	select IOMMU_IOVA
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_FWNODE
> +	help
> +	  This is the 6th Gen Intel Image Processing Unit, found in Intel SoCs
> +	  and used for capturing images and video from camera sensors.
> +
> +	  To compile this driver, say Y here! It contains 2 modules -
> +	  intel_ipu6 and intel_ipu6_isys.
> diff --git a/drivers/media/pci/intel/ipu6/Makefile b/drivers/media/pci/intel/ipu6/Makefile
> new file mode 100644
> index 000000000000..6a6339c84ef4
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu6/Makefile
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +intel-ipu6-objs				+= ipu6.o \
> +					ipu6-bus.o \
> +					ipu6-dma.o \
> +					ipu6-mmu.o \
> +					ipu6-buttress.o \
> +					ipu6-cpd.o \
> +					ipu6-fw-com.o
> +
> +obj-$(CONFIG_VIDEO_INTEL_IPU6)		+= intel-ipu6.o
> +
> +intel-ipu6-isys-objs			+= ipu6-isys.o \
> +					ipu6-isys-csi2.o \
> +					ipu6-fw-isys.o \
> +					ipu6-isys-video.o \
> +					ipu6-isys-queue.o \
> +					ipu6-isys-subdev.o \
> +					ipu6-isys-mcd-phy.o \
> +					ipu6-isys-jsl-phy.o \
> +					ipu6-isys-dwc-phy.o
> +
> +obj-$(CONFIG_VIDEO_INTEL_IPU6)		+= intel-ipu6-isys.o

-- 
Regards,

Laurent Pinchart
