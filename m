Return-Path: <linux-media+bounces-41277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEF9B3A707
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 18:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6E337BEECE
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9376633439F;
	Thu, 28 Aug 2025 16:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+LEh7Mj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED498326D63;
	Thu, 28 Aug 2025 16:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756400081; cv=none; b=M4nBPl6a3/FlaO1A6fc0S2rze7Zw0MRp27mmr8Wpwi1cWP66keZiVWwokJznjkyNVc9rlcC3UBBBIxU4qD4gV30BU8NLhdJtNEf2l/c3r8GymhFEk0TE+DVU45qpnkMwUyp0VMvv0qTqC1lFlioVzjgZK5HXlqhoJbwZsd8SZHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756400081; c=relaxed/simple;
	bh=HSeaP72AzSeyydI7pT1H4Q5rPaD360vXJSDI9ZGiwE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WLnSbJmYUwdhRTPibv0E1bQQHJ8w/x+TMYREZxBBxJ8iE2vi/Tp25g2qVyru/C7Ep4igJflXdM9Zv+p7vCippGnEZ16EHZIwIxKJCFfb+veqE3/zDn2BxaupmA0vkKJIGeVS6hLnRZVkMEy5SNRHYu3eNE4dCeS711rPJSuZags=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+LEh7Mj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 434B6C4CEEB;
	Thu, 28 Aug 2025 16:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756400080;
	bh=HSeaP72AzSeyydI7pT1H4Q5rPaD360vXJSDI9ZGiwE0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X+LEh7MjYvuXer5gI6GNLwWuogjENnB8f49OghlzewzxKExH+K9OYeqgIq8LbrZMs
	 gPdZrcAngQBHdzzr7W8wDDkNmR7iWhfuQogjuTX+spLa/c3k2S5abRg/Ftn0UatHTC
	 jEgMTZm3AQ32LSdlodY0LRqweg8Zg7zKIj50kg8omgitD5T6ckstLa/1kkwA2+klm5
	 9HVSItRarIwN9tkwvtweHcVfjFL529n92+4OTqEnJNH5rwwnxuF4V0MQSB5KAxKgsE
	 5CqLak40UgAHqw4jxYly0DextKftSRuuNfTYVFKYWy1phZNxIhLRtQp2j/mhHMRhh2
	 U5626GEZKYVwA==
Message-ID: <062b36df-2fc6-43ba-9f71-25f8fe786b7a@kernel.org>
Date: Thu, 28 Aug 2025 11:54:38 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: platform: amd: Introduce amd isp4 capture
 driver
To: Bin Du <Bin.Du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 richard.gong@amd.com, anson.tsao@amd.com,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
References: <20250828100811.95722-1-Bin.Du@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250828100811.95722-1-Bin.Du@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/28/25 5:08 AM, Du, Bin wrote:
> AMD isp4 capture is a v4l2 media device which implements media controller
> interface. It has one sub-device (AMD ISP4 sub-device) endpoint which can
> be connected to a remote CSI2 TX endpoint. It supports only one physical
> interface for now. Also add ISP4 driver related entry info into the
> MAINTAINERS file
> 
> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Bin Du <Bin.Du@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>   MAINTAINERS                              |  13 +++
>   drivers/media/platform/Kconfig           |   1 +
>   drivers/media/platform/Makefile          |   1 +
>   drivers/media/platform/amd/Kconfig       |   3 +
>   drivers/media/platform/amd/Makefile      |   3 +
>   drivers/media/platform/amd/isp4/Kconfig  |  13 +++
>   drivers/media/platform/amd/isp4/Makefile |   6 ++
>   drivers/media/platform/amd/isp4/isp4.c   | 121 +++++++++++++++++++++++
>   drivers/media/platform/amd/isp4/isp4.h   |  24 +++++
>   9 files changed, 185 insertions(+)
>   create mode 100644 drivers/media/platform/amd/Kconfig
>   create mode 100644 drivers/media/platform/amd/Makefile
>   create mode 100644 drivers/media/platform/amd/isp4/Kconfig
>   create mode 100644 drivers/media/platform/amd/isp4/Makefile
>   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>   create mode 100644 drivers/media/platform/amd/isp4/isp4.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe168477caa4..3ad845f1511b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1133,6 +1133,19 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
>   F:	drivers/iommu/amd/
>   F:	include/linux/amd-iommu.h
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
>   AMD KFD
>   M:	Felix Kuehling <Felix.Kuehling@amd.com>
>   L:	amd-gfx@lists.freedesktop.org
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 9287faafdce5..772c70665510 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -63,6 +63,7 @@ config VIDEO_MUX
>   
>   # Platform drivers - Please keep it alphabetically sorted
>   source "drivers/media/platform/allegro-dvt/Kconfig"
> +source "drivers/media/platform/amd/Kconfig"
>   source "drivers/media/platform/amlogic/Kconfig"
>   source "drivers/media/platform/amphion/Kconfig"
>   source "drivers/media/platform/aspeed/Kconfig"
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 6fd7db0541c7..b207bd8d8022 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -6,6 +6,7 @@
>   # Place here, alphabetically sorted by directory
>   # (e. g. LC_ALL=C sort Makefile)
>   obj-y += allegro-dvt/
> +obj-y += amd/
>   obj-y += amlogic/
>   obj-y += amphion/
>   obj-y += aspeed/
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
> index 000000000000..0268060c2dae
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +
> +config AMD_ISP4
> +	tristate "AMD ISP4 and camera driver"
> +	depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
> +	select VIDEOBUF2_CORE
> +	select VIDEOBUF2_V4L2
> +	select VIDEOBUF2_MEMOPS
> +	help
> +	  This is support for AMD ISP4 and camera subsystem driver.
> +	  Say Y here to enable the ISP4 and camera device for video capture.
> +	  To compile this driver as a module, choose M here. The module will
> +	  be called amd_capture.
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
> index 000000000000..6ff3ded4310a
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4.c
> @@ -0,0 +1,121 @@
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
> +
> +static irqreturn_t isp4_irq_handler(int irq, void *arg)
> +{
> +	return IRQ_HANDLED;
> +}
> +
> +static int isp4_capture_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct isp4_device *isp_dev;
> +	int i, irq, ret;
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
> +
> +	media_device_unregister(&isp_dev->mdev);
> +	v4l2_device_unregister(&isp_dev->v4l2_dev);
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
> index 000000000000..8535f662ab49
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4.h
> @@ -0,0 +1,24 @@
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
> +struct isp4_device {
> +	struct v4l2_device v4l2_dev;
> +	struct media_device mdev;
> +
> +	struct platform_device *pdev;
> +	struct notifier_block i2c_nb;
> +};
> +
> +#endif /* _ISP4_H_ */


