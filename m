Return-Path: <linux-media+bounces-45527-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 370E4C0696D
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 15:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 729293AF723
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 13:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09E931D36A;
	Fri, 24 Oct 2025 13:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FuJLdnrB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0455135B123;
	Fri, 24 Oct 2025 13:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761314278; cv=none; b=dqxQYUn4OrdSNV1vId0FXuUQQSAOLQwLzXWrxihxkvq32DjZkNF8OegqGG/F77h80Cp4k2QkGrTUr3oOk8PXKSTlz3PqcO4d9HewZ+pXsocAjlZ5SO7ruJ/SUod59d8l4pZbZHYedKjAcMmzUc0jqtXZVqXiSFnYNHZQIapIro8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761314278; c=relaxed/simple;
	bh=u7RlP8qi5/6L/Meu9oIPYmr0P0hafGbzuL8Sj43SR/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TiYfKFsqx/y47jUuOFIUBIM11xKBzdzp+vd8sEKkMhErVfW9OhgJH5mu20futhSZpeLo5bS+UZx4fWkmkkgUGKXbfQn3OcPOrmYW+bJ0SxoHM6vjniBP/n0vffRBtLcIlzf95Aysw5Ip100HU+e+5ay1p2O39iv/bLg0CctBUWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FuJLdnrB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35D5C4CEF1;
	Fri, 24 Oct 2025 13:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761314277;
	bh=u7RlP8qi5/6L/Meu9oIPYmr0P0hafGbzuL8Sj43SR/4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FuJLdnrB5hYnaSfu+O3z2/HtvYcogdWCIJCQHnYyjPx393esIQogFhvXSoeA+CBjW
	 e6Gq4ZRM0dPwZvP/hovc2SkOh50z+8tkYX20tZWxUfUszea2sP099DyT5Bete3UU8p
	 Q6yik6VPM5g0qk4ihKygaOPkEdVtx5gAknnqVi5TJRuNS4Rpe/byGO/mC/xg1zZIzB
	 3XmCatQ5ANrfDkLDula9oqBQaDUDFQJQ6v134B+qr7b1MPi2SEKiN8TVzdBNd9BXoR
	 mB74J/SAMXQidpL1JcxzCJ+zLVf1thYPZN1XLjzXYtqdKbw46IE6YFOQIfmor1c4hp
	 S3kASZpJFZD8w==
Message-ID: <93233d51-5ff3-4f10-96f6-a2957325f1bd@kernel.org>
Date: Fri, 24 Oct 2025 15:57:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] media: platform: amd: Introduce amd isp4 capture
 driver
To: Bin Du <Bin.Du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
 Mario Limonciello <superm1@kernel.org>,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20251024090643.271883-1-Bin.Du@amd.com>
 <20251024090643.271883-2-Bin.Du@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251024090643.271883-2-Bin.Du@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/10/2025 11:06, Bin Du wrote:
> diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
> new file mode 100644
> index 000000000000..a3fc2462d70f
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
> +const char *isp4_irq_name[] = {

Why isn't this static?

> +	"isp_irq_stream1",
> +	"isp_irq_global"
> +};
> +
> +/* interrupt num */
> +static const u32 isp4_ringbuf_interrupt_num[] = {
> +	0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
> +	4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
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
> +	struct isp4_device *isp_dev;
> +	int i, irq, ret;
> +
> +	isp_dev = devm_kzalloc(dev, sizeof(*isp_dev), GFP_KERNEL);
> +	if (!isp_dev)
> +		return -ENOMEM;
> +
> +	isp_dev->pdev = pdev;
> +	dev->init_name = ISP4_DRV_NAME;
> +
> +	for (i = 0; i < ARRAY_SIZE(isp4_ringbuf_interrupt_num); i++) {
> +		irq = platform_get_irq(pdev, isp4_ringbuf_interrupt_num[i]);
> +		if (irq < 0)
> +			return dev_err_probe(dev, irq,
> +					     "fail to get irq %d\n",
> +					     isp4_ringbuf_interrupt_num[i]);
> +		ret = devm_request_irq(dev, irq, isp4_irq_handler, 0,
> +				       isp4_irq_name[i], dev);
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
> +	isp_dev->mdev.dev = dev;
> +	media_device_init(&isp_dev->mdev);
> +
> +	/* register v4l2 device */
> +	snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
> +		 "AMD-V4L2-ROOT");
> +	ret = v4l2_device_register(dev, &isp_dev->v4l2_dev);
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

No, don't print generic error thus multiple errors. Drop this and keep
informative dev_err_probe() in applicable places.


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

It is v5 but you still did not run standard tools. You try to upstream
12 year old code without cleaning it up.

Please run standard kernel tools for static analysis, like coccinelle,
smatch and sparse, and fix reported warnings. Also please check for
warnings when building with W=1 for gcc and clang. Most of these
commands (checks or W=1 build) can build specific targets, like some
directory, to narrow the scope to only your code. The code here looks
like it needs a fix. Feel free to get in touch if the warning is not clear.

> +	}
> +};
> +
> +module_platform_driver(isp4_capture_drv);
> +
> +MODULE_ALIAS("platform:" ISP4_DRV_NAME);

You should not need MODULE_ALIAS() in normal cases. If you need it,
usually it means your device ID table is wrong (e.g. misses either
entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
for incomplete ID table.


Best regards,
Krzysztof

