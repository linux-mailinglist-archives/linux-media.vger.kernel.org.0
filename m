Return-Path: <linux-media+bounces-25398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD74A21B26
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 11:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F26A1650DE
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 10:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED971B4257;
	Wed, 29 Jan 2025 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRulBNko"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8EB16C854;
	Wed, 29 Jan 2025 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738147483; cv=none; b=QhDKE7UvuSOIxkwBRjm1YwcnnY6kpLIjmKmq+oHNC3Bkk9mBcBusxd/lRqqyqp8GAteZF/QXxKjM7+fbzG6d5ftY12YTbJyawMK0/jTBu+ILkDKHQ3ZNrTPwUA/Q3189ohcA3ULhS5JPxgtRkS4G2cpaSp5UecS2ThBu4XuqqZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738147483; c=relaxed/simple;
	bh=T2RVaPAE44RT8dx6SqFQUThUdmq/PWU4mA6kbablfoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XIqKYJ7PZOSKLWNE/HbnNPAdAdsSMGDm7sxYVfy2e2DgWncZ3uhrUcsvxRqUKwF+E8OYTddT7yHB1Nonk5EgwnkjnMGf1Vb3/y2NSWxKXGk4xxtWiSMbxYUGEGp47yLlcefLYSlytgWG/4WqUTgCTMq+FuTe6YoP1fSq4iVVlC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRulBNko; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F92C4CED3;
	Wed, 29 Jan 2025 10:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738147482;
	bh=T2RVaPAE44RT8dx6SqFQUThUdmq/PWU4mA6kbablfoU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GRulBNkogLoZHV+pvCVvONuqv583/E+3qcW5dg77HpiQ45Eg6zmGWkR84MP14iNi9
	 PpJQgDsuoMqX/KqJeXe6WxfdGMfUQAzWqafQ8ViOXKG/vMm4EbYKLxfScRjBjkEGcw
	 hZVniyVLB7qWEOYOgdYsoAMnHwKxcsPnIbcKsfzcAu3r2OMY7GwJs8fRy97PwvK9Kf
	 p4kycGiKRT3ycBPiOMUNW6LbRXOW94HxOHRoUoiQFk5w5scA2eGXjI3lj38yYV8ofC
	 ffCtKPu84H0WaaDPTMc48aNQxW9zLe82+Kcm/NMjRIlKhnQkT2jmh3wjh5RGpE2WH2
	 K/UcaTLMWeXLw==
Message-ID: <5070e1f1-914b-4654-88ef-3566e3eee9ca@kernel.org>
Date: Wed, 29 Jan 2025 11:44:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v10 1/2] media: iris: introduce helper module to
 select video driver
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, quic_vgarodia@quicinc.com,
 quic_abhinavk@quicinc.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, p.zabel@pengutronix.de
Cc: hverkuil@xs4all.nl, sebastian.fricke@collabora.com,
 bryan.odonoghue@linaro.org, dmitry.baryshkov@linaro.org,
 neil.armstrong@linaro.org, nicolas@ndufresne.ca,
 u.kleine-koenig@baylibre.com, stefan.schmidt@linaro.org,
 lujianhua000@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 johan@kernel.org
References: <20250128080429.3911091-1-quic_dikshita@quicinc.com>
 <20250128080429.3911091-2-quic_dikshita@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250128080429.3911091-2-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/01/2025 09:04, Dikshita Agarwal wrote:
> Introduce a helper module with a kernel param to select between
> venus and iris drivers for platforms supported by both drivers.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/Makefile          |  1 +
>  drivers/media/platform/qcom/iris/iris_core.h  |  1 +
>  drivers/media/platform/qcom/iris/iris_probe.c |  3 +
>  drivers/media/platform/qcom/venus/core.c      |  5 ++
>  .../platform/qcom/video_drv_helper/Makefile   |  4 ++
>  .../qcom/video_drv_helper/video_drv_helper.c  | 70 +++++++++++++++++++
>  .../qcom/video_drv_helper/video_drv_helper.h  | 11 +++
>  7 files changed, 95 insertions(+)
>  create mode 100644 drivers/media/platform/qcom/video_drv_helper/Makefile
>  create mode 100644 drivers/media/platform/qcom/video_drv_helper/video_drv_helper.c
>  create mode 100644 drivers/media/platform/qcom/video_drv_helper/video_drv_helper.h
> 
> diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platform/qcom/Makefile
> index ea2221a202c0..15accde3bd67 100644
> --- a/drivers/media/platform/qcom/Makefile
> +++ b/drivers/media/platform/qcom/Makefile
> @@ -2,3 +2,4 @@
>  obj-y += camss/
>  obj-y += iris/
>  obj-y += venus/
> +obj-y += video_drv_helper/
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index 37fb4919fecc..7108e751ff88 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -107,5 +107,6 @@ struct iris_core {
>  
>  int iris_core_init(struct iris_core *core);
>  void iris_core_deinit(struct iris_core *core);
> +extern bool video_drv_should_bind(struct device *dev, bool is_iris_driver);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 954cc7c0cc97..276461ade811 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -196,6 +196,9 @@ static int iris_probe(struct platform_device *pdev)
>  	u64 dma_mask;
>  	int ret;
>  
> +	if (!video_drv_should_bind(&pdev->dev, true))
> +		return -ENODEV;

Wouldn't it mark the probe as failed and cause dmesg regressions?

> +
>  	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
>  	if (!core)
>  		return -ENOMEM;
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 77d48578ecd2..b38be7812efe 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -369,12 +369,17 @@ static int venus_add_dynamic_nodes(struct venus_core *core)
>  static void venus_remove_dynamic_nodes(struct venus_core *core) {}
>  #endif
>  
> +extern bool video_drv_should_bind(struct device *dev, bool is_iris_driver);

You just defined it in the header. Why is this here?

> +
>  static int venus_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct venus_core *core;
>  	int ret;
>  
> +	if (!video_drv_should_bind(&pdev->dev, false))
> +		return -ENODEV;

Same problems - d,esg regression.

> +
>  	core = devm_kzalloc(dev, sizeof(*core), GFP_KERNEL);
>  	if (!core)
>  		return -ENOMEM;
> diff --git a/drivers/media/platform/qcom/video_drv_helper/Makefile b/drivers/media/platform/qcom/video_drv_helper/Makefile
> new file mode 100644
> index 000000000000..82567e0392fb
> --- /dev/null
> +++ b/drivers/media/platform/qcom/video_drv_helper/Makefile
> @@ -0,0 +1,4 @@

Missing SPDX

> +# Makefile for Video driver helper
> +
> +obj-m := video_drv_helper.o
> +
> diff --git a/drivers/media/platform/qcom/video_drv_helper/video_drv_helper.c b/drivers/media/platform/qcom/video_drv_helper/video_drv_helper.c
> new file mode 100644
> index 000000000000..9009c2906e54
> --- /dev/null
> +++ b/drivers/media/platform/qcom/video_drv_helper/video_drv_helper.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +
> +#include "video_drv_helper.h"
> +
> +/* The venus driver supports only hfi gen1 to communicate with the firmware while

Use Linux generic coding style comment, not netdev.

> + * the iris driver supports both hfi gen1 and hfi gen2.
> + * The support of hfi gen1 is added to the iris driver with the intention that
> + * it can support old gen1 interface based firmware, while enabling gen2 based future SOCs.
> + * With this, the plan is to migrate older SOCs from venus to iris.
> + * As of now, since the iris driver supports only entry level features and doesn't have
> + * feature parity with the venus driver, a runtime-selection is provided to user via
> + * module parameter 'prefer_venus' to select the driver.
> + * This selection is available only for the SoCs which are supported by both venus
> + * and iris eg: SM8250.
> + * When the feature parity is achieved, the plan is to switch the default to point to
> + * the iris driver, then gradually start removing platforms from venus.
> + * Hardware supported by only venus - 8916, 8996, SDM660, SDM845, SC7180, SC7280
> + * Hardware supported by only iris - SM8550
> + * Hardware supported by both venus and iris - SM8250
> + */
> +
> +#if !IS_REACHABLE(CONFIG_VIDEO_QCOM_VENUS) || !IS_REACHABLE(CONFIG_VIDEO_QCOM_IRIS)
> +bool video_drv_should_bind(struct device *dev, bool is_iris_driver)
> +{
> +	/* If just a single driver is enabled, use it no matter what */
> +	return true;
> +}
> +
> +#else
> +static bool prefer_venus = true;
> +MODULE_PARM_DESC(prefer_venus, "Select whether venus or iris driver should be preferred");
> +module_param(prefer_venus, bool, 0444);


The choice of driver is by module blacklisting, not by failing probes.

I don't understand why this patchset is needed and neither commit msg
nor above longer code comment explain me that. Just blacklist the module.

Best regards,
Krzysztof

