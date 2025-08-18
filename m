Return-Path: <linux-media+bounces-40111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B20D2B29CB7
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 10:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C1AD3AD775
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 08:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5331120485B;
	Mon, 18 Aug 2025 08:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRdnMIdq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5131E570D;
	Mon, 18 Aug 2025 08:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755506953; cv=none; b=lKJgUy4BBCY0ND7lw7pgys3Pj4uttq3+V+vYfKX5CLMownDsphgkQHQU2Dv8xmpuMSOpLE4M28P4tRomBb1KLu0u/SNLK84T6QXAP4ltdcedeTdERa5DBJOH7vMct0oRBDOeQt4gctkJ0qXniCZQyw2kESReOSxbNFP3+rCp/i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755506953; c=relaxed/simple;
	bh=rhlsxxRk4EuwzcNd++izNC2AdIT+M5hU7gqXnfBxExo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lyH7rOiA+gJwj+tN3ZpVtQhIpfMImzrJWArxmBJib6XzYaFiZN8jmX1lPy0j/EpeDICvf7VtK6ZbiFmb+mgMe2N+PSh1U2WnGSrr1CIeq4mc7oznZyxNerWQmVwr9cje8h9ZcPqFRql5Uv+ZshuYUDMyKOYUh6lAJKs3FosA46I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRdnMIdq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540DDC4CEEB;
	Mon, 18 Aug 2025 08:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755506953;
	bh=rhlsxxRk4EuwzcNd++izNC2AdIT+M5hU7gqXnfBxExo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hRdnMIdqWRyqAgLEgNUSk4MAO2h1laN0DdNxmQoagjStkv8R1rR7Vitf/Svgki16B
	 gN8Lw/8IdQs45h3awI0Yt2pghON+9UkJTYDFznKAnYUcOGIeHbtBQqDwtzzEYCkW6f
	 +bKhYEsMbS7GoCzsFEQTbBgEBq2aJiMUma363h4u4WfkuwtbHMdFMDbDvuqTPbmjSl
	 sK0/ON/lGK9/Nv4eGbw32IEj0DMbnVyxkgqcg2OULyAGE60qjOPYNRq08IQqqloBz7
	 Yhs390atpNtI5EuiG6u5Kbs3iZjnyrNOqpYfyfgOpZ0ETdDPwqGgfx7YQ9CIkbpMq2
	 paCBSYfSny+6Q==
Message-ID: <b1f59033-12d0-4395-85f1-e296a5dbca5f@kernel.org>
Date: Mon, 18 Aug 2025 10:49:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] media: fsd-csis: Add support for FSD CSIS DMA
To: Inbaraj E <inbaraj.e@samsung.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
 martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
 catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
 ravi.patel@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
 linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de,
 festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141103epcas5p14516cbe45c21d28ba9e231da99940aa1@epcas5p1.samsung.com>
 <20250814140943.22531-13-inbaraj.e@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250814140943.22531-13-inbaraj.e@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/08/2025 16:09, Inbaraj E wrote:
> FSD CSIS IP bundles DMA engine for receiving frames from MIPI-CSI2 bus.
> Add support internal DMA controller to capture the frames.
> 
> Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>

I commented on order of patches and got more surprise - final driver
patch after DTS defconfig. It's really wrong order.

> ---
>  MAINTAINERS                                   |    8 +
>  drivers/media/platform/samsung/Kconfig        |    1 +
>  drivers/media/platform/samsung/Makefile       |    1 +
>  .../media/platform/samsung/fsd-csis/Kconfig   |   18 +
>  .../media/platform/samsung/fsd-csis/Makefile  |    3 +
>  .../platform/samsung/fsd-csis/fsd-csis.c      | 1709 +++++++++++++++++
>  6 files changed, 1740 insertions(+)
>  create mode 100644 drivers/media/platform/samsung/fsd-csis/Kconfig
>  create mode 100644 drivers/media/platform/samsung/fsd-csis/Makefile
>  create mode 100644 drivers/media/platform/samsung/fsd-csis/fsd-csis.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd62ad58a47f..1e17fb0581d2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3334,6 +3334,14 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
>  F:	drivers/media/platform/samsung/s5p-mfc/
>  
> +ARM/SAMSUNG FSD BRIDGE DRIVER

TESLA FSD BRIDGE DRIVER
(because ARM/foo are only SoC maintainer entries)

> +M:	Inbaraj E <inbaraj.e@samsung.com>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

Replace above list with samsung-soc list.

> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/tesla,fsd-csis-media.yaml
> +F:	drivers/media/platform/samsung/fsd-csis/fsd-csis.c
> +
>  ARM/SOCFPGA ARCHITECTURE
>  M:	Dinh Nguyen <dinguyen@kernel.org>
>  S:	Maintained
> diff --git a/drivers/media/platform/samsung/Kconfig b/drivers/media/platform/samsung/Kconfig
> index 0e34c5fc1dfc..4cebe2ae24a3 100644
> --- a/drivers/media/platform/samsung/Kconfig
> +++ b/drivers/media/platform/samsung/Kconfig
> @@ -4,6 +4,7 @@ comment "Samsung media platform drivers"
>  
>  source "drivers/media/platform/samsung/exynos-gsc/Kconfig"
>  source "drivers/media/platform/samsung/exynos4-is/Kconfig"
> +source "drivers/media/platform/samsung/fsd-csis/Kconfig"
>  source "drivers/media/platform/samsung/s3c-camif/Kconfig"
>  source "drivers/media/platform/samsung/s5p-g2d/Kconfig"
>  source "drivers/media/platform/samsung/s5p-jpeg/Kconfig"
> diff --git a/drivers/media/platform/samsung/Makefile b/drivers/media/platform/samsung/Makefile
> index 21fea3330e4b..fde1b9626713 100644
> --- a/drivers/media/platform/samsung/Makefile
> +++ b/drivers/media/platform/samsung/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-y += exynos-gsc/
>  obj-y += exynos4-is/
> +obj-y += fsd-csis/
>  obj-y += s3c-camif/
>  obj-y += s5p-g2d/
>  obj-y += s5p-jpeg/
> diff --git a/drivers/media/platform/samsung/fsd-csis/Kconfig b/drivers/media/platform/samsung/fsd-csis/Kconfig
> new file mode 100644
> index 000000000000..99803e924682
> --- /dev/null
> +++ b/drivers/media/platform/samsung/fsd-csis/Kconfig
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# FSD MIPI CSI-2 Rx controller configurations
> +
> +config VIDEO_FSD_CSIS

VIDEO_TSLA_FSD_CSIS

> +	tristate "FSD SoC MIPI-CSI2 media controller driver"
> +	depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
> +	depends on HAS_DMA
> +	depends on OF

OF seems unneeded dependency

But you miss ARCH_TESLA_FSD instead.


> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_FWNODE
> +	help
> +	  This is a video4linux2 driver for FSD SoC MIPI-CSI2 Rx.

Tesla FSD

> +	  The driver provides interface for capturing frames.
> +
> +	  To compile this driver as a module, choose M here. The module
> +	  will be called fsd-csis.
> +
> diff --git a/drivers/media/platform/samsung/fsd-csis/Makefile b/drivers/media/platform/samsung/fsd-csis/Makefile
> new file mode 100644
> index 000000000000..eba8c0c6a7cc
> --- /dev/null
> +++ b/drivers/media/platform/samsung/fsd-csis/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_VIDEO_FSD_CSIS) += fsd-csis.o
> diff --git a/drivers/media/platform/samsung/fsd-csis/fsd-csis.c b/drivers/media/platform/samsung/fsd-csis/fsd-csis.c
> new file mode 100644
> index 000000000000..74f46038d506
> --- /dev/null
> +++ b/drivers/media/platform/samsung/fsd-csis/fsd-csis.c
> @@ -0,0 +1,1709 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2025 Samsung Electronics Co., Ltd.
> + *             https://www.samsung.com
> + *
> + * FSD CSIS V4L2 Capture driver for FSD SoC.

"Tesla FSD" in both places

> + */
> +
> +#include <linux/clk.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/videobuf2-dma-contig.h>
> +#include <media/v4l2-mc.h>

How can you depend on OF if there is no single OF header?

> +
> +#define FSD_CSIS_DMA_COHERENT_MASK_SIZE		32
> +#define FSD_CSIS_NB_MIN_CH			2
> +#define FSD_CSIS_NB_VC				4
> +#define FSD_CSIS_MEDIA_NUM_PADS			2
> +#define FSD_CSIS_NB_DMA_OUT_CH			8
> +#define FSD_CSIS_MAX_VC				4
> +#define FSD_CSIS_NB_CLOCK			2
> +#define FSD_CSIS_NB_OF_BUFS_ON_DMA_CHANNELS	2
> +#define FSD_CSIS_DMA_LINE_ALIGN_SIZE		128
> +#define FSD_CSIS_DMA_CH_OFFSET			0x100

...

> +
> +static int fsd_csis_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct fsd_csis *csis;
> +	int ret = 0;
> +	int irq;
> +
> +	csis = devm_kzalloc(dev, sizeof(*csis), GFP_KERNEL);
> +	if (!csis)
> +		return -ENOMEM;
> +
> +	csis->dev = dev;
> +	csis->info = of_device_get_match_data(dev);
> +
> +	csis->dma_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(csis->dma_base))
> +		return PTR_ERR(csis->dma_base);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_irq(dev, irq,
> +			csis_irq_handler, IRQF_SHARED, pdev->name, csis);

Please align these (checkpatch --strict)

> +
> +	ret = fsd_csis_clk_get(csis);
> +	if (ret < 0)
> +		return ret;
> +
> +	pm_runtime_enable(dev);
> +	if (!pm_runtime_enabled(dev)) {

That's odd code. Why?

> +		ret = fsd_csis_runtime_resume(dev);

Even more questions why?

> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, csis);
> +
> +	ret = fsd_csis_enable_pll(csis);
> +	if (ret)
> +		return ret;
> +
> +	ret = fsd_csis_media_init(csis);
> +	if (ret)
> +		return ret;

I think you miss clean up of csis->pll completely. Just use
devm_clk_get_enabled and convert everything here to devm.


> +
> +	ret = fsd_csis_async_register(csis);
> +	if (ret)
> +		goto err_media_cleanup;
> +
> +	return 0;
> +
> +err_media_cleanup:
> +	fsd_csis_media_cleanup(csis);

Also this...

> +
> +	return ret;
> +}
> +
> +static void fsd_csis_remove(struct platform_device *pdev)
> +{
> +	struct fsd_csis *csis = platform_get_drvdata(pdev);
> +
> +	fsd_csis_media_cleanup(csis);
> +
> +	v4l2_async_nf_unregister(&csis->notifier);
> +	v4l2_async_nf_cleanup(&csis->notifier);
> +	v4l2_async_unregister_subdev(&csis->subdev.sd);
> +
> +	if (!pm_runtime_enabled(csis->dev))
> +		fsd_csis_runtime_suspend(csis->dev);
> +
> +	pm_runtime_disable(csis->dev);
> +	pm_runtime_set_suspended(csis->dev);
> +}
> +
> +static const struct of_device_id fsd_csis_of_match[] = {
> +	{ .compatible = "tesla,fsd-csis-media", },
> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(of, fsd_csis_of_match);
> +
> +static struct platform_driver fsd_csis_driver = {
> +	.probe		= fsd_csis_probe,
> +	.remove		= fsd_csis_remove,
> +	.driver		= {
> +		.name		= FSD_CSIS_MODULE_NAME,
> +		.of_match_table = of_match_ptr(fsd_csis_of_match),

Drop of_match_ptr, it is not really correct.

> +		.pm		= &fsd_csis_pm_ops,
> +	},
> +};
> +
> +module_platform_driver(fsd_csis_driver);
> +
> +MODULE_DESCRIPTION("FSD CSIS Driver");
> +MODULE_AUTHOR("Inbaraj E <inbaraj.e@samsung.com>");
> +MODULE_LICENSE("GPL");
> +


Best regards,
Krzysztof

