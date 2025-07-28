Return-Path: <linux-media+bounces-38520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 041C0B13453
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 07:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63D9C3B3A3D
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 05:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BDB221F31;
	Mon, 28 Jul 2025 05:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lOky2Brq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA721D5147;
	Mon, 28 Jul 2025 05:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753682093; cv=none; b=aFzY/PHa0e1w4vLbDNVSHKgCPVvqRN5eMx+MqAcwdjKgLm+n3lpD3/bhWizCQw0RukZ7qMuXsqd2YRfRp2My6ucqp4BGCPbcfInGky7FlfVvzwHmQ3zpPvStoJmWlCfn7c5B9mf7+K8R7QemW9CitiatOIwmSHwFrEgUcDR+ZVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753682093; c=relaxed/simple;
	bh=cCKM2xSPs1SaHA/XS8K6rNJfFARxaon21ig+00tOWAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hsFfJ9bJtLyaA4mZGLEyVrkC89U9A3n2P+Z5EzljwANAFZShTvZhTPN4iUIgzN2zQFM+0KMF98RZSVrkVIE0WMTJHhrT5sYWuUYUcoqIyuj5Ko/Y+xOv7r3FQ5dGYEfpxf+TKaWka+MFugSc67EN4O5crfxS5YdipcMQAaAMq98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lOky2Brq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753682092; x=1785218092;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cCKM2xSPs1SaHA/XS8K6rNJfFARxaon21ig+00tOWAo=;
  b=lOky2Brq2cQBGPuG57qBTr8ps1eLVgkoZ2fi7+ggmEiGvIdCHTUvLaGx
   BURrZxJqpUvVS/iOmhNQV1+plCWDMo+YiDKWhTMkeGHTlVBjz+26IuDe/
   s/Uau3Uix8zdL1i8/z0VhKDXgUVvj9Xr5Zj/xDsM38JfJirKKTOODykQW
   f3FexA67uA4SUUXEXFsGfOaMLyP5g9p8JNdcPZyr/sLSz21l2Whr64jV2
   Rthugxs0pYi59mIEdbbxjODIfZuReMo1Qaq2o9iCHZTa0fXDpa89wxHaR
   oY002PAn4iZv46UYLH3OlMDjWYWL3fucCV34SK0Gm8SLkI+pkhtAVnRYy
   Q==;
X-CSE-ConnectionGUID: UHXqaY1BSVaYlD1lN4/nxw==
X-CSE-MsgGUID: 8wIVQSkRTLGzJRrrLL4Qsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="73372787"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="73372787"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 22:54:52 -0700
X-CSE-ConnectionGUID: IfNdnTbWTKihqWXp3ygQ9w==
X-CSE-MsgGUID: Es5a5F7AQVqGprDq+8nDvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162385073"
Received: from opintica-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.174])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 22:54:48 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A87391202CF;
	Mon, 28 Jul 2025 08:54:44 +0300 (EEST)
Date: Mon, 28 Jul 2025 05:54:44 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, Svetoslav.Stoilov@amd.com
Subject: Re: [PATCH v2 1/8] media: platform: amd: Introduce amd isp4 capture
 driver
Message-ID: <aIcQpB3pD8oWJPHZ@kekkonen.localdomain>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-2-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618091959.68293-2-Bin.Du@amd.com>

Hi Bin,

On Wed, Jun 18, 2025 at 05:19:52PM +0800, Bin Du wrote:
> Amd isp4 capture is a v4l2 media device which implements media controller
> interface.
> It has one sub-device (amd ISP4 sub-device) endpoint which can be connected
> to a remote CSI2 TX endpoint. It supports only one physical interface for
> now.
> Also add ISP4 driver related entry info into the MAINAINERS file

You could rewrap the text and use the full lines here -- up to 75
characters per line.

> 
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> ---
>  MAINTAINERS                              |  10 ++
>  drivers/media/platform/Kconfig           |   1 +
>  drivers/media/platform/Makefile          |   1 +
>  drivers/media/platform/amd/Kconfig       |  17 +++
>  drivers/media/platform/amd/Makefile      |   5 +
>  drivers/media/platform/amd/isp4/Makefile |  21 ++++
>  drivers/media/platform/amd/isp4/isp4.c   | 139 +++++++++++++++++++++++
>  drivers/media/platform/amd/isp4/isp4.h   |  35 ++++++
>  8 files changed, 229 insertions(+)
>  create mode 100644 drivers/media/platform/amd/Kconfig
>  create mode 100644 drivers/media/platform/amd/Makefile
>  create mode 100644 drivers/media/platform/amd/isp4/Makefile
>  create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>  create mode 100644 drivers/media/platform/amd/isp4/isp4.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 10893c91b1c1..15070afb14b5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1107,6 +1107,16 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
>  F:	drivers/iommu/amd/
>  F:	include/linux/amd-iommu.h
>  
> +AMD ISP4 DRIVER
> +M:	Bin Du <bin.du@amd.com>
> +M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media.git
> +F:	drivers/media/platform/amd/Kconfig
> +F:	drivers/media/platform/amd/Makefile
> +F:	drivers/media/platform/amd/isp4/*
> +
>  AMD KFD
>  M:	Felix Kuehling <Felix.Kuehling@amd.com>
>  L:	amd-gfx@lists.freedesktop.org
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 85d2627776b6..d525c2262a7d 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -89,5 +89,6 @@ source "drivers/media/platform/ti/Kconfig"
>  source "drivers/media/platform/verisilicon/Kconfig"
>  source "drivers/media/platform/via/Kconfig"
>  source "drivers/media/platform/xilinx/Kconfig"
> +source "drivers/media/platform/amd/Kconfig"
>  
>  endif # MEDIA_PLATFORM_DRIVERS
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index ace4e34483dd..9f3d1693868d 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -32,6 +32,7 @@ obj-y += ti/
>  obj-y += verisilicon/
>  obj-y += via/
>  obj-y += xilinx/
> +obj-y += amd/
>  
>  # Please place here only ancillary drivers that aren't SoC-specific
>  # Please keep it alphabetically sorted by Kconfig name
> diff --git a/drivers/media/platform/amd/Kconfig b/drivers/media/platform/amd/Kconfig
> new file mode 100644
> index 000000000000..3b1dba0400a0
> --- /dev/null
> +++ b/drivers/media/platform/amd/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: MIT
> +
> +config AMD_ISP4
> +	tristate "AMD ISP4 and camera driver"
> +	default y
> +	depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
> +	select VIDEOBUF2_CORE
> +	select VIDEOBUF2_V4L2
> +	select VIDEOBUF2_MEMOPS
> +	select VIDEOBUF2_VMALLOC
> +	select VIDEOBUF2_DMA_CONTIG
> +	select VIDEOBUF2_DMA_SG

Do you need all these three? Most drivers need only one.

> +	help
> +	  This is support for AMD ISP4 and camera subsystem driver.
> +	  Say Y here to enable the ISP4 and camera device for video capture.
> +	  To compile this driver as a module, choose M here. The module will
> +	  be called amd_capture.
> diff --git a/drivers/media/platform/amd/Makefile b/drivers/media/platform/amd/Makefile
> new file mode 100644
> index 000000000000..76146efcd2bf
> --- /dev/null
> +++ b/drivers/media/platform/amd/Makefile
> @@ -0,0 +1,5 @@
> +# Copyright 2024 Advanced Micro Devices, Inc.
> +# add isp block
> +ifneq ($(CONFIG_AMD_ISP4),)
> +obj-y += isp4/
> +endif
> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
> new file mode 100644
> index 000000000000..e9e84160517d
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/Makefile
> @@ -0,0 +1,21 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +#
> +# Copyright (C) 2025 Advanced Micro Devices, Inc.
> +
> +obj-$(CONFIG_AMD_ISP4) += amd_capture.o
> +amd_capture-objs := isp4.o
> +
> +ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
> +ccflags-y += -I$(srctree)/include
> +
> +ifneq ($(call cc-option, -mpreferred-stack-boundary=4),)
> +	cc_stack_align := -mpreferred-stack-boundary=4
> +endif

Uh... does the driver actually depend on this?

> +
> +ccflags-y += $(cc_stack_align)
> +ccflags-y += -DCONFIG_COMPAT
> +ccflags-y += -Wunused-but-set-variable
> +ccflags-y += -Wmissing-include-dirs
> +ccflags-y += -Wunused-const-variable
> +ccflags-y += -Wmaybe-uninitialized
> +ccflags-y += -Wunused-value
> diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
> new file mode 100644
> index 000000000000..d0be90c5ec3b
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4.c
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/pm_runtime.h>
> +#include <linux/vmalloc.h>
> +#include <media/v4l2-ioctl.h>

Alphabetic order, please.

> +
> +#include "isp4.h"
> +
> +#define VIDEO_BUF_NUM 5

Unused.

> +
> +#define ISP4_DRV_NAME "amd_isp_capture"
> +
> +/* interrupt num */
> +static const u32 isp4_ringbuf_interrupt_num[] = {
> +	0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
> +	1, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT10 */
> +	3, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT11 */
> +	4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
> +};
> +
> +#define to_isp4_device(dev) \
> +	((struct isp4_device *)container_of(dev, struct isp4_device, v4l2_dev))

No need for the cast.

> +
> +static irqreturn_t isp4_irq_handler(int irq, void *arg)
> +{
> +	struct isp4_device *isp_dev = dev_get_drvdata((struct device *)arg);
> +
> +	if (!isp_dev)
> +		goto error_drv_data;
> +
> +error_drv_data:
> +	return IRQ_HANDLED;
> +}
> +
> +/*
> + * amd capture module
> + */
> +static int isp4_capture_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct isp4_device *isp_dev;
> +

Extra newline.

> +	int i, irq, ret;

unsigned int i?

> +
> +	isp_dev = devm_kzalloc(&pdev->dev, sizeof(*isp_dev), GFP_KERNEL);
> +	if (!isp_dev)
> +		return -ENOMEM;
> +
> +	isp_dev->pdev = pdev;
> +	dev->init_name = ISP4_DRV_NAME;
> +
> +	for (i = 0; i < ARRAY_SIZE(isp4_ringbuf_interrupt_num); i++) {
> +		irq = platform_get_irq(pdev, isp4_ringbuf_interrupt_num[i]);
> +		if (irq < 0)
> +			return dev_err_probe(dev, -ENODEV,
> +					     "fail to get irq %d\n",
> +					     isp4_ringbuf_interrupt_num[i]);
> +		ret = devm_request_irq(&pdev->dev, irq, isp4_irq_handler, 0,
> +				       "ISP_IRQ", &pdev->dev);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "fail to req irq %d\n",
> +					     irq);
> +	}
> +
> +	isp_dev->pltf_data = pdev->dev.platform_data;
> +
> +	dev_dbg(dev, "isp irq registration successful\n");

Please leave this out.

> +
> +	/* Link the media device within the v4l2_device */
> +	isp_dev->v4l2_dev.mdev = &isp_dev->mdev;
> +
> +	/* Initialize media device */
> +	strscpy(isp_dev->mdev.model, "amd_isp41_mdev",
> +		sizeof(isp_dev->mdev.model));
> +	snprintf(isp_dev->mdev.bus_info, sizeof(isp_dev->mdev.bus_info),
> +		 "platform:%s", ISP4_DRV_NAME);
> +	isp_dev->mdev.dev = &pdev->dev;
> +	media_device_init(&isp_dev->mdev);
> +
> +	/* register v4l2 device */
> +	snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
> +		 "AMD-V4L2-ROOT");
> +	ret = v4l2_device_register(&pdev->dev, &isp_dev->v4l2_dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "fail register v4l2 device\n");
> +
> +	dev_dbg(dev, "AMD ISP v4l2 device registered\n");

This doesn't seem useful.

> +
> +	ret = media_device_register(&isp_dev->mdev);
> +	if (ret) {
> +		dev_err(dev, "fail to register media device %d\n", ret);
> +		goto err_unreg_v4l2;
> +	}
> +
> +	platform_set_drvdata(pdev, isp_dev);
> +
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_enable(dev);

You'll need to enable runtime PM before registering any interfaces on UAPI.
Same goes for setting driver data for the device.

> +
> +	return 0;
> +
> +err_unreg_v4l2:
> +	v4l2_device_unregister(&isp_dev->v4l2_dev);
> +
> +	return dev_err_probe(dev, ret, "isp probe fail\n");
> +}
> +
> +static void isp4_capture_remove(struct platform_device *pdev)
> +{
> +	struct isp4_device *isp_dev = platform_get_drvdata(pdev);
> +	struct device *dev = &pdev->dev;
> +
> +	media_device_unregister(&isp_dev->mdev);
> +	v4l2_device_unregister(&isp_dev->v4l2_dev);
> +	dev_dbg(dev, "AMD ISP v4l2 device unregistered\n");

I'd say this is redundant.

> +}
> +
> +static struct platform_driver isp4_capture_drv = {
> +	.probe = isp4_capture_probe,
> +	.remove = isp4_capture_remove,
> +	.driver = {
> +		.name = ISP4_DRV_NAME,
> +		.owner = THIS_MODULE,
> +	}
> +};
> +
> +module_platform_driver(isp4_capture_drv);
> +
> +MODULE_ALIAS("platform:" ISP4_DRV_NAME);
> +MODULE_IMPORT_NS("DMA_BUF");
> +
> +MODULE_DESCRIPTION("AMD ISP4 Driver");
> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/amd/isp4/isp4.h b/drivers/media/platform/amd/isp4/isp4.h
> new file mode 100644
> index 000000000000..27a7362ce6f9
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _ISP4_H_
> +#define _ISP4_H_
> +
> +#include <linux/mutex.h>
> +#include <media/v4l2-device.h>
> +#include <media/videobuf2-memops.h>
> +#include <media/videobuf2-vmalloc.h>
> +
> +#define ISP4_GET_ISP_REG_BASE(isp4sd) (((isp4sd))->mmio)
> +
> +struct isp4_platform_data {
> +	void *adev;
> +	void *bo;
> +	void *cpu_ptr;
> +	u64 gpu_addr;
> +	u32 size;
> +	u32 asic_type;
> +	resource_size_t base_rmmio_size;
> +};
> +
> +struct isp4_device {
> +	struct v4l2_device v4l2_dev;
> +	struct media_device mdev;
> +
> +	struct isp4_platform_data *pltf_data;
> +	struct platform_device *pdev;
> +	struct notifier_block i2c_nb;
> +};
> +
> +#endif /* isp4.h */

Use the same name as for the macro here, please.

-- 
Kind regards,

Sakari Ailus

