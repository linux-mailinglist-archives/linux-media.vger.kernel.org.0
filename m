Return-Path: <linux-media+bounces-49321-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 406AECD54F9
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 10:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EEA43028D9E
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B28631062E;
	Mon, 22 Dec 2025 09:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djMF9+WX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541551FC0EA;
	Mon, 22 Dec 2025 09:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766395434; cv=none; b=qHxUq+rCRwbN4lT1JIDnbBRJ89vAtuqVFYnfyxSNQmq0WOjTea9RFOFzaU/XdrgVedjSDwlRmO9/yEle+FsUOTbHHTdlEu9S1x+ZanfMSiaLj5oHXsZnEMBFBEqSwvELjBfOPgQE4n8zR/qD0XqYp2kGrKuxrsJwJQhglJIsxaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766395434; c=relaxed/simple;
	bh=gwRS7rOMxl/+XSr4xhCzgDPZgNwHfLE9uDWczy+MurY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYKZbfccfBNjrovkJOEncDgJks7GSi0tLRIAVkdNeBGYMGigxPXXNozRaiaVZFg4m+z8e3ON6BD06Xf6/se4k7ASfp91gSvIcTjPK7V7cjzgTMr0F8oiNp5D7JTzu6pPOYF0t4kXkz4IsRvky+DOaSDCgJNCqFfmEcrS4B9EtgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djMF9+WX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766395432; x=1797931432;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gwRS7rOMxl/+XSr4xhCzgDPZgNwHfLE9uDWczy+MurY=;
  b=djMF9+WXEEkNQcqWd26IiIqc7tenDICOXysXu4TeRiCHjOrbiFrRvrkr
   55NzZVnHGpObboZyOicJkesZjkwM7rTBDPeZVaZ2PJQBA4Y4tvEjbySXR
   Wz0MUJ7JEET3B869/+acPsWDRPdp0RCsE1EqFYUVTKEHCFQikCgXnvPyT
   ABTaeh0GhKBEPkJk8EGpZzI/PZSgRzg86fpP6Z3W5n5HXc/PhRQFKkI+A
   k0IthbKcWR1EvQGhs1VKcAckhN8P4Pwqz4CnpO7L4cR8BoRJZfbXzCHY2
   6DTNMDf8jF5pYzcopWjLzgqxjJc2BkZpAqV5c1smHMOSo5yOXLlU92szK
   A==;
X-CSE-ConnectionGUID: b+SGEPLyQrW2KOY9z6f9ZA==
X-CSE-MsgGUID: lRRCnO8+Qg+TgfPBwZoGGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="79701478"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="79701478"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 01:23:51 -0800
X-CSE-ConnectionGUID: u4RXArfwSlqRnhDubAVRbg==
X-CSE-MsgGUID: xeI4R9G/SGieXcUAcSeXRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199784180"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.187])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 01:23:47 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D408D12063F;
	Mon, 22 Dec 2025 11:23:47 +0200 (EET)
Date: Mon, 22 Dec 2025 11:23:47 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bin Du <Bin.Du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	sultan@kerneltoast.com, pratap.nirujogi@amd.com,
	benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
	Phil.Jawich@amd.com, Dominic.Antony@amd.com,
	mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
	Mario Limonciello <superm1@kernel.org>,
	Alexey Zagorodnikov <xglooom@gmail.com>
Subject: Re: [PATCH v7 1/7] media: platform: amd: Introduce amd isp4 capture
 driver
Message-ID: <aUkOI3ACKMhS7cJ9@kekkonen.localdomain>
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <20251216091326.111977-2-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216091326.111977-2-Bin.Du@amd.com>

Hi Bin,

Thanks for the update. Please see my comments below.

On Tue, Dec 16, 2025 at 05:13:20PM +0800, Bin Du wrote:
> AMD isp4 capture is a v4l2 media device which implements media controller
> interface. It has one sub-device (AMD ISP4 sub-device) endpoint which can
> be connected to a remote CSI2 TX endpoint. It supports only one physical
> interface for now. Also add ISP4 driver related entry info into the
> MAINTAINERS file
> 
> Co-developed-by: Sultan Alsawaf <sultan@kerneltoast.com>
> Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
> ---
>  MAINTAINERS                              |  13 +++
>  drivers/media/platform/Kconfig           |   1 +
>  drivers/media/platform/Makefile          |   1 +
>  drivers/media/platform/amd/Kconfig       |   3 +
>  drivers/media/platform/amd/Makefile      |   3 +
>  drivers/media/platform/amd/isp4/Kconfig  |  14 +++
>  drivers/media/platform/amd/isp4/Makefile |   6 ++
>  drivers/media/platform/amd/isp4/isp4.c   | 132 +++++++++++++++++++++++
>  drivers/media/platform/amd/isp4/isp4.h   |  17 +++
>  9 files changed, 190 insertions(+)
>  create mode 100644 drivers/media/platform/amd/Kconfig
>  create mode 100644 drivers/media/platform/amd/Makefile
>  create mode 100644 drivers/media/platform/amd/isp4/Kconfig
>  create mode 100644 drivers/media/platform/amd/isp4/Makefile
>  create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>  create mode 100644 drivers/media/platform/amd/isp4/isp4.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cd7ff55b5d32..3640a1e3262c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1133,6 +1133,19 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
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
> +F:	drivers/media/platform/amd/isp4/Kconfig
> +F:	drivers/media/platform/amd/isp4/Makefile
> +F:	drivers/media/platform/amd/isp4/isp4.c
> +F:	drivers/media/platform/amd/isp4/isp4.h
> +
>  AMD KFD
>  M:	Felix Kuehling <Felix.Kuehling@amd.com>
>  L:	amd-gfx@lists.freedesktop.org
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 9287faafdce5..772c70665510 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -63,6 +63,7 @@ config VIDEO_MUX
>  
>  # Platform drivers - Please keep it alphabetically sorted
>  source "drivers/media/platform/allegro-dvt/Kconfig"
> +source "drivers/media/platform/amd/Kconfig"
>  source "drivers/media/platform/amlogic/Kconfig"
>  source "drivers/media/platform/amphion/Kconfig"
>  source "drivers/media/platform/aspeed/Kconfig"
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 6fd7db0541c7..b207bd8d8022 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -6,6 +6,7 @@
>  # Place here, alphabetically sorted by directory
>  # (e. g. LC_ALL=C sort Makefile)
>  obj-y += allegro-dvt/
> +obj-y += amd/
>  obj-y += amlogic/
>  obj-y += amphion/
>  obj-y += aspeed/
> diff --git a/drivers/media/platform/amd/Kconfig b/drivers/media/platform/amd/Kconfig
> new file mode 100644
> index 000000000000..25af49f246b2
> --- /dev/null
> +++ b/drivers/media/platform/amd/Kconfig
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +
> +source "drivers/media/platform/amd/isp4/Kconfig"
> diff --git a/drivers/media/platform/amd/Makefile b/drivers/media/platform/amd/Makefile
> new file mode 100644
> index 000000000000..8bfc1955f22e
> --- /dev/null
> +++ b/drivers/media/platform/amd/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +
> +obj-y += isp4/
> diff --git a/drivers/media/platform/amd/isp4/Kconfig b/drivers/media/platform/amd/isp4/Kconfig
> new file mode 100644
> index 000000000000..d4e4ad436600
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +
> +config AMD_ISP4

We've used "VIDEO_" prefix for V4L2 drivers.

> +	tristate "AMD ISP4 and camera driver"
> +	depends on DRM_AMD_ISP && VIDEO_DEV
> +	select VIDEOBUF2_CORE
> +	select VIDEOBUF2_MEMOPS
> +	select VIDEOBUF2_V4L2
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  This is support for AMD ISP4 and camera subsystem driver.
> +	  Say Y here to enable the ISP4 and camera device for video capture.
> +	  To compile this driver as a module, choose M here. The module will
> +	  be called amd_capture.

How about "amd_isp4"? That would be aligned with the file names as well as
the Kconfig option.

> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
> new file mode 100644
> index 000000000000..de0092dad26f
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +#
> +# Copyright (C) 2025 Advanced Micro Devices, Inc.
> +
> +obj-$(CONFIG_AMD_ISP4) += amd_capture.o
> +amd_capture-objs := isp4.o
> diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
> new file mode 100644
> index 000000000000..ad95e7f89189
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4.c
> @@ -0,0 +1,132 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/pm_runtime.h>
> +#include <linux/vmalloc.h>
> +#include <media/v4l2-ioctl.h>
> +
> +#include "isp4.h"
> +
> +#define VIDEO_BUF_NUM 5
> +
> +#define ISP4_DRV_NAME "amd_isp_capture"
> +
> +static const struct {
> +	const char *name;
> +	u32 status_mask;
> +	u32 en_mask;
> +	u32 ack_mask;
> +	u32 rb_int_num;
> +} isp4_irq[] = {
> +	/* The IRQ order is aligned with the isp4_subdev.fw_resp_thread order */
> +	{
> +		.name = "isp_irq_global",
> +		.rb_int_num = 4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
> +	},
> +	{
> +		.name = "isp_irq_stream1",
> +		.rb_int_num = 0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
> +	},
> +};
> +
> +static irqreturn_t isp4_irq_handler(int irq, void *arg)
> +{
> +	return IRQ_HANDLED;
> +}
> +
> +static int isp4_capture_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int irq[ARRAY_SIZE(isp4_irq)];
> +	struct isp4_device *isp_dev;
> +	size_t i;
> +	int ret;
> +
> +	isp_dev = devm_kzalloc(dev, sizeof(*isp_dev), GFP_KERNEL);
> +	if (!isp_dev)
> +		return -ENOMEM;
> +
> +	dev->init_name = ISP4_DRV_NAME;
> +
> +	for (i = 0; i < ARRAY_SIZE(isp4_irq); i++) {
> +		irq[i] = platform_get_irq(pdev, isp4_irq[i].rb_int_num);
> +		if (irq[i] < 0)
> +			return dev_err_probe(dev, irq[i], "fail to get irq %d\n",
> +					     isp4_irq[i].rb_int_num);
> +
> +		ret = devm_request_irq(dev, irq[i], isp4_irq_handler,
> +				       IRQF_NO_AUTOEN, isp4_irq[i].name, dev);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "fail to req irq %d\n", irq[i]);
> +	}
> +
> +	/* Link the media device within the v4l2_device */
> +	isp_dev->v4l2_dev.mdev = &isp_dev->mdev;
> +
> +	/* Initialize media device */
> +	strscpy(isp_dev->mdev.model, "amd_isp41_mdev", sizeof(isp_dev->mdev.model));
> +	snprintf(isp_dev->mdev.bus_info, sizeof(isp_dev->mdev.bus_info),
> +		 "platform:%s", ISP4_DRV_NAME);

No need to do this explicitly.

> +	isp_dev->mdev.dev = dev;
> +	media_device_init(&isp_dev->mdev);
> +
> +	/* register v4l2 device */

Please drop this comment, it's not informational.

> +	snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
> +		 "AMD-V4L2-ROOT");
> +	ret = v4l2_device_register(dev, &isp_dev->v4l2_dev);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "fail register v4l2 device\n");
> +		goto err_clean_media;
> +	}
> +
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_enable(dev);
> +	ret = media_device_register(&isp_dev->mdev);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "fail to register media device\n");
> +		goto err_isp4_deinit;
> +	}
> +
> +	platform_set_drvdata(pdev, isp_dev);
> +
> +	return 0;
> +
> +err_isp4_deinit:
> +	pm_runtime_disable(dev);
> +	v4l2_device_unregister(&isp_dev->v4l2_dev);
> +err_clean_media:
> +	media_device_cleanup(&isp_dev->mdev);
> +
> +	return ret;
> +}
> +
> +static void isp4_capture_remove(struct platform_device *pdev)
> +{
> +	struct isp4_device *isp_dev = platform_get_drvdata(pdev);
> +	struct device *dev = &pdev->dev;
> +
> +	media_device_unregister(&isp_dev->mdev);
> +	pm_runtime_disable(dev);
> +	v4l2_device_unregister(&isp_dev->v4l2_dev);
> +	media_device_cleanup(&isp_dev->mdev);
> +}
> +
> +static struct platform_driver isp4_capture_drv = {
> +	.probe = isp4_capture_probe,
> +	.remove = isp4_capture_remove,
> +	.driver = {
> +		.name = ISP4_DRV_NAME,
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
> index 000000000000..7f2db0dfa2d9
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _ISP4_H_
> +#define _ISP4_H_
> +
> +#include <media/v4l2-device.h>
> +#include <media/videobuf2-memops.h>
> +
> +struct isp4_device {
> +	struct v4l2_device v4l2_dev;
> +	struct media_device mdev;
> +};
> +
> +#endif /* _ISP4_H_ */

-- 
Kind regards,

Sakari Ailus

