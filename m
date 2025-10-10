Return-Path: <linux-media+bounces-44176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E6BBCCE61
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 14:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36CD03C13ED
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 12:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75FCC2EFDAD;
	Fri, 10 Oct 2025 12:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lxaIit+F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AE52EF64D
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 12:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760099382; cv=none; b=aSZGRc3RpIR9ruuqOZSm9Se8Xu4aGHD/rkSQ71QxlLChWwslsDHKycz6WQfhddHgzvm+nVLDudM1NDqNsS0Zeic7gsbz7iKmhe+DVSZm5mR/NhQBNw2T3Lc26zrzRFTjozLe3tgP8a3mR5VxpyqMH1VjkPuz9e2xTAKm0VwANHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760099382; c=relaxed/simple;
	bh=jawKExZuXN7gMNSEPeCsrhjUTIg/62JzW0z6n7tGIzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pf8YUoKhQDU4zcNClxNO+379/PVygNh9nfLNPQ814Mckz+z6ropTmMVjb5a3W6JxXQ3FUixXjBRGux9R9IBE8I6G3BoaSOfGvQH/Asx7YhBOaAmUUO3gePnVc21frS/8gOnAI27amn2lD3n6wh22Lcc67fV1Z26V8nKPOg4H9r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lxaIit+F; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e4f2696bdso21603995e9.0
        for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 05:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760099379; x=1760704179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3w1QySXOxE83J1koPTF0hVjdJ+1GJgOp9gN4Amawo6s=;
        b=lxaIit+FV7ZkZPpb1RONoxFMvk2E47SJ8NiyysDUzG22vnFpw5sjvhnWK5TQP+4Eot
         RzwvRE5eE6gYgxDUjdr7I+1x2pX34bJxte+EW2eqvPmVu+ah5S8TUUDYGTSvj4uJrOxl
         eZp4WFIVO2zVL1zRAj045ZyO3dcMaSDJn0lB5lC4eZzosguGh7vNB96gOiYruX6eDqWT
         YBpJ3gy1GZhxK9dNY41bbuhGbTPhsa0HVp/PRQcvfdMYXaYWqf01dRqGJzXwLrdp88Jy
         L++xA2EvWaPQ59oA66myUglbFh3Gc9gSqsB9Tf52t044usAsxI0O/F7oh/a0tg/4kFiR
         9U3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760099379; x=1760704179;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3w1QySXOxE83J1koPTF0hVjdJ+1GJgOp9gN4Amawo6s=;
        b=HPpHQCYshTz7urYDd36rsiakYyn94PJPtBRaD2GXp+DOwJaJvmkFVe3WL7jO1PFXsa
         5F6Jj45Ep2nZGcODuvsmwGxTFtWCEiS35YF2jmO0xB+DYIlSvyNoiSBHJiqYATfUtVeb
         Oq+j57+2ANk7/T0zTPuliQz/9UK1xREOEoG+zBw6Mx2RE6Oj93LG8SYr8kSg4uvBnBIv
         HEVTRZ6ICO2JX0tVHsGZGHqdN4fkebPPZh7kswgzfIeYRugEk/oVAvFb7V3JxZJ9lPSY
         OXKC4m8ryT22j4sgzv2dbH4i18L5nqxxRYH3k5JSgdnf4eqM45QbToUg4E5cB8LpYpVH
         Dixw==
X-Gm-Message-State: AOJu0Yy28y8LedEE9w9dL9CSrVPSSJelPwWqnOlDV29yAdq43iTPSOt9
	kdDtxXRXAqj1IFQEpkrv5TP1qnRCcKRNvbgohqpvfvglCocmxyMyLVqud0tQtQWVpQc=
X-Gm-Gg: ASbGncvyKOhnahE1T6c1Re1tf4MXfpj+f13s2OIrOEkiXaBwEt83S1IqOCS3e24kwwE
	DX3Kv5AYKedkzEb2VkIkd5FnlwJJ7sJAQCHCqMin9xRigd8TgoaJhIPx3e2UCvNnwdtEDzjTeZL
	GDjpwGIxY9zCxmlyvQnm/U/jzUMSvHZwlmQqk17XEwzz5FW1N75NaCnlIyoM+YwbaY/G42Qn7O/
	omqCM8qjmY0nZZ2nfteDgmYGS6DOYubK6aQ0uTGcEyQdOHt5VwlSf1+AQM8rdQHsX/oFhR9tqXL
	befKoozJ5k0lUWHVMSbgtw/OzPtvt3iSV3dWe31nbZzULGh9c8EFqSLY0wp9yIZxTm5eczPb7l1
	szrARim3Z4mhfZcS5R7a7I38CWqgbt+XZjfA07AsTHWde+5oiQ5+SZt6++0iFD/FpKF6G3peI17
	k29RQ/lSC97dk=
X-Google-Smtp-Source: AGHT+IEsmJvk1TuMXpoF/rJEyUw87VcT0HAXOJZSIzYvKCNNpSch1dQqLO+7LaTWng/7o1RmEwIb4g==
X-Received: by 2002:a05:600c:698c:b0:46e:6d5f:f68 with SMTP id 5b1f17b1804b1-46fb405319amr30820345e9.12.1760099378806;
        Fri, 10 Oct 2025 05:29:38 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3e3520sm62462375e9.2.2025.10.10.05.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 05:29:38 -0700 (PDT)
Message-ID: <7c563a39-cdec-487b-afc5-c88d94475aad@linaro.org>
Date: Fri, 10 Oct 2025 13:29:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/17] media: rockchip: add driver for the rockchip
 camera interface
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
 <GTZBnEB6M3avDjHcPfe-Xk1msGrNz3ak2dcuD9K66qXTkJ82qAfdO76PxK5HjR8bbrH6s_OXa9GwefBJAYsxPQ==@protonmail.internalid>
 <20240220-rk3568-vicap-v11-7-af0eada54e5d@collabora.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20240220-rk3568-vicap-v11-7-af0eada54e5d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/09/2025 16:38, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> Add the skeleton for a media controller centric V4L2 driver for the
> Rockchip Camera Interface (CIF).
> The skeleton features support for the PX30 Video Input Processor (VIP)
> and the RK3568 Video Capture (VICAP) unit.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>   MAINTAINERS                                        |   1 +
>   drivers/media/platform/rockchip/Kconfig            |   1 +
>   drivers/media/platform/rockchip/Makefile           |   1 +
>   drivers/media/platform/rockchip/rkcif/Kconfig      |  18 ++
>   drivers/media/platform/rockchip/rkcif/Makefile     |   4 +
>   .../media/platform/rockchip/rkcif/rkcif-common.h   |  54 +++++
>   drivers/media/platform/rockchip/rkcif/rkcif-dev.c  | 260 +++++++++++++++++++++
>   7 files changed, 339 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4a18421a53a1..6c023dc54ece 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21770,6 +21770,7 @@ S:	Maintained
>   F:	Documentation/admin-guide/media/rkcif*
>   F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
>   F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
> +F:	drivers/media/platform/rockchip/rkcif/
> 
>   ROCKCHIP CRYPTO DRIVERS
>   M:	Corentin Labbe <clabbe@baylibre.com>
> diff --git a/drivers/media/platform/rockchip/Kconfig b/drivers/media/platform/rockchip/Kconfig
> index 2f6f77afecfc..54b698c4cd2c 100644
> --- a/drivers/media/platform/rockchip/Kconfig
> +++ b/drivers/media/platform/rockchip/Kconfig
> @@ -3,6 +3,7 @@
>   comment "Rockchip media platform drivers"
> 
>   source "drivers/media/platform/rockchip/rga/Kconfig"
> +source "drivers/media/platform/rockchip/rkcif/Kconfig"
>   source "drivers/media/platform/rockchip/rkcsi/Kconfig"
>   source "drivers/media/platform/rockchip/rkisp1/Kconfig"
>   source "drivers/media/platform/rockchip/rkvdec/Kconfig"
> diff --git a/drivers/media/platform/rockchip/Makefile b/drivers/media/platform/rockchip/Makefile
> index 33e24b47735c..522a7d3e30b0 100644
> --- a/drivers/media/platform/rockchip/Makefile
> +++ b/drivers/media/platform/rockchip/Makefile
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   obj-y += rga/
> +obj-y += rkcif/
>   obj-y += rkcsi/
>   obj-y += rkisp1/
>   obj-y += rkvdec/
> diff --git a/drivers/media/platform/rockchip/rkcif/Kconfig b/drivers/media/platform/rockchip/rkcif/Kconfig
> new file mode 100644
> index 000000000000..efd82ac35bd8
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/Kconfig
> @@ -0,0 +1,18 @@
> +config VIDEO_ROCKCHIP_CIF
> +	tristate "Rockchip Camera Interface (CIF)"
> +	depends on VIDEO_DEV
> +	depends on ARCH_ROCKCHIP || COMPILE_TEST
> +	depends on V4L_PLATFORM_DRIVERS
> +	depends on PM && COMMON_CLK
> +	select MEDIA_CONTROLLER
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  This is a driver for Rockchip Camera Interface (CIF). It is featured
> +	  in many Rockchips SoCs in different variations, such as the PX30
> +	  Video Input Processor (VIP, one Digital Video Port (DVP)) or the
> +	  RK3568 Video Capture (VICAP, one DVP, one MIPI CSI-2 receiver) unit.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called rockchip-cif.
> diff --git a/drivers/media/platform/rockchip/rkcif/Makefile b/drivers/media/platform/rockchip/rkcif/Makefile
> new file mode 100644
> index 000000000000..c6837ed2f65c
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_VIDEO_ROCKCHIP_CIF) += rockchip-cif.o
> +
> +rockchip-cif-objs += rkcif-dev.o
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> new file mode 100644
> index 000000000000..43a9390526d8
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#ifndef _RKCIF_COMMON_H
> +#define _RKCIF_COMMON_H
> +
> +#include <linux/clk.h>
> +#include <linux/mutex.h>
> +#include <linux/regmap.h>
> +
> +#include <media/media-device.h>
> +#include <media/media-entity.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#define RKCIF_DRIVER_NAME "rockchip-cif"
> +#define RKCIF_CLK_MAX	  4
> +
> +struct rkcif_remote {
> +	struct v4l2_async_connection async_conn;
> +	struct v4l2_subdev *sd;
> +};
> +
> +struct rkcif_match_data {
> +	const char *const *clks;
> +	unsigned int clks_num;
> +};
> +
> +struct rkcif_device {
> +	struct device *dev;
> +
> +	const struct rkcif_match_data *match_data;
> +	struct clk_bulk_data clks[RKCIF_CLK_MAX];
> +	unsigned int clks_num;
> +	struct regmap *grf;
> +	struct reset_control *reset;
> +	void __iomem *base_addr;
> +
> +	struct media_device media_dev;
> +	struct v4l2_device v4l2_dev;
> +	struct v4l2_async_notifier notifier;
> +};
> +
> +#endif
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> new file mode 100644
> index 000000000000..a8514e7d3249
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> @@ -0,0 +1,260 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2020 Maxime Chevallier <maxime.chevallier@bootlin.com>
> + * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_platform.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +
> +#include "rkcif-common.h"
> +
> +static const char *const px30_vip_clks[] = {
> +	"aclk",
> +	"hclk",
> +	"pclk",
> +};
> +
> +static const struct rkcif_match_data px30_vip_match_data = {
> +	.clks = px30_vip_clks,
> +	.clks_num = ARRAY_SIZE(px30_vip_clks),
> +};
> +
> +static const char *const rk3568_vicap_clks[] = {
> +	"aclk",
> +	"hclk",
> +	"dclk",
> +	"iclk",
> +};
> +
> +static const struct rkcif_match_data rk3568_vicap_match_data = {
> +	.clks = rk3568_vicap_clks,
> +	.clks_num = ARRAY_SIZE(rk3568_vicap_clks),
> +};
> +
> +static const struct of_device_id rkcif_plat_of_match[] = {
> +	{
> +		.compatible = "rockchip,px30-vip",
> +		.data = &px30_vip_match_data,
> +	},
> +	{
> +		.compatible = "rockchip,rk3568-vicap",
> +		.data = &rk3568_vicap_match_data,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, rkcif_plat_of_match);
> +
> +static int rkcif_register(struct rkcif_device *rkcif)
> +{
> +	return 0;
> +}
> +
> +static void rkcif_unregister(struct rkcif_device *rkcif)
> +{
> +}
> +
> +static int rkcif_notifier_bound(struct v4l2_async_notifier *notifier,
> +				struct v4l2_subdev *sd,
> +				struct v4l2_async_connection *asd)
> +{
> +	struct rkcif_remote *remote =
> +		container_of(asd, struct rkcif_remote, async_conn);
> +
> +	remote->sd = sd;
> +
> +	return 0;
> +}
> +
> +static int rkcif_notifier_complete(struct v4l2_async_notifier *notifier)
> +{
> +	struct rkcif_device *rkcif =
> +		container_of(notifier, struct rkcif_device, notifier);
> +
> +	return v4l2_device_register_subdev_nodes(&rkcif->v4l2_dev);
> +}
> +
> +static const struct v4l2_async_notifier_operations rkcif_notifier_ops = {
> +	.bound = rkcif_notifier_bound,
> +	.complete = rkcif_notifier_complete,
> +};
> +
> +static irqreturn_t rkcif_isr(int irq, void *ctx)
> +{
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	return ret;
> +}
> +
> +static int rkcif_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rkcif_device *rkcif;
> +	int ret, irq;
> +
> +	rkcif = devm_kzalloc(dev, sizeof(*rkcif), GFP_KERNEL);
> +	if (!rkcif)
> +		return -ENOMEM;
> +
> +	rkcif->match_data = of_device_get_match_data(dev);
> +	if (!rkcif->match_data)
> +		return -ENODEV;
> +
> +	dev_set_drvdata(dev, rkcif);
> +	rkcif->dev = dev;
> +
> +	rkcif->base_addr = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(rkcif->base_addr))
> +		return PTR_ERR(rkcif->base_addr);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_irq(dev, irq, rkcif_isr, IRQF_SHARED,
> +			       dev_driver_string(dev), dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to request irq\n");
> +
> +	if (rkcif->match_data->clks_num > RKCIF_CLK_MAX)
> +		return dev_err_probe(dev, -EINVAL, "invalid number of clocks\n");

\n

> +	rkcif->clks_num = rkcif->match_data->clks_num;

\n ?

> +	for (unsigned int i = 0; i < rkcif->clks_num; i++)
> +		rkcif->clks[i].id = rkcif->match_data->clks[i];
> +	ret = devm_clk_bulk_get(dev, rkcif->clks_num, rkcif->clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get clocks\n");
> +
> +	rkcif->reset = devm_reset_control_array_get_exclusive(dev);
> +	if (IS_ERR(rkcif->reset))
> +		return PTR_ERR(rkcif->reset);
> +
> +	rkcif->grf = syscon_regmap_lookup_by_phandle(dev->of_node,
> +						     "rockchip,grf");
> +	if (IS_ERR(rkcif->grf))
> +		rkcif->grf = NULL;
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	rkcif->media_dev.dev = dev;
> +	strscpy(rkcif->media_dev.model, RKCIF_DRIVER_NAME,
> +		sizeof(rkcif->media_dev.model));
> +	media_device_init(&rkcif->media_dev);
> +
> +	rkcif->v4l2_dev.mdev = &rkcif->media_dev;
> +	ret = v4l2_device_register(dev, &rkcif->v4l2_dev);
> +	if (ret)
> +		goto err_media_dev_cleanup;
> +
> +	ret = media_device_register(&rkcif->media_dev);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to register media device: %d\n", ret);
> +		goto err_v4l2_dev_unregister;
> +	}
> +
> +	v4l2_async_nf_init(&rkcif->notifier, &rkcif->v4l2_dev);
> +	rkcif->notifier.ops = &rkcif_notifier_ops;
> +
> +	ret = rkcif_register(rkcif);
> +	if (ret) {
> +		dev_err(dev, "failed to register media entities: %d\n", ret);
> +		goto err_notifier_cleanup;
> +	}
> +
> +	ret = v4l2_async_nf_register(&rkcif->notifier);
> +	if (ret)
> +		goto err_rkcif_unregister;
> +
> +	return 0;
> +
> +err_rkcif_unregister:
> +	rkcif_unregister(rkcif);
> +err_notifier_cleanup:
> +	v4l2_async_nf_cleanup(&rkcif->notifier);
> +	media_device_unregister(&rkcif->media_dev);
> +err_v4l2_dev_unregister:
> +	v4l2_device_unregister(&rkcif->v4l2_dev);
> +err_media_dev_cleanup:
> +	media_device_cleanup(&rkcif->media_dev);
> +	pm_runtime_disable(&pdev->dev);
> +	return ret;
> +}
> +
> +static void rkcif_remove(struct platform_device *pdev)
> +{
> +	struct rkcif_device *rkcif = platform_get_drvdata(pdev);
> +
> +	v4l2_async_nf_unregister(&rkcif->notifier);
> +	rkcif_unregister(rkcif);
> +	v4l2_async_nf_cleanup(&rkcif->notifier);
> +	media_device_unregister(&rkcif->media_dev);
> +	v4l2_device_unregister(&rkcif->v4l2_dev);
> +	media_device_cleanup(&rkcif->media_dev);
> +	pm_runtime_disable(&pdev->dev);
> +}
> +
> +static int rkcif_runtime_suspend(struct device *dev)
> +{
> +	struct rkcif_device *rkcif = dev_get_drvdata(dev);
> +
> +	/*
> +	 * Reset CIF (CRU, DMA, FIFOs) to allow a clean resume.
> +	 * Since this resets the IOMMU too, we cannot issue this reset when
> +	 * resuming.
> +	 */
> +	reset_control_assert(rkcif->reset);
> +	udelay(5);
> +	reset_control_deassert(rkcif->reset);
> +
> +	clk_bulk_disable_unprepare(rkcif->clks_num, rkcif->clks);
> +
> +	return 0;
> +}
> +
> +static int rkcif_runtime_resume(struct device *dev)
> +{
> +	struct rkcif_device *rkcif = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(rkcif->clks_num, rkcif->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops rkcif_plat_pm_ops = {
> +	.runtime_suspend = rkcif_runtime_suspend,
> +	.runtime_resume = rkcif_runtime_resume,
> +};
> +
> +static struct platform_driver rkcif_plat_drv = {
> +	.driver = {
> +		   .name = RKCIF_DRIVER_NAME,
> +		   .of_match_table = rkcif_plat_of_match,
> +		   .pm = &rkcif_plat_pm_ops,
> +	},
> +	.probe = rkcif_probe,
> +	.remove = rkcif_remove,
> +};
> +module_platform_driver(rkcif_plat_drv);
> +
> +MODULE_DESCRIPTION("Rockchip Camera Interface (CIF) platform driver");
> +MODULE_LICENSE("GPL");
> 
> --
> 2.39.5
> 
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

