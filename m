Return-Path: <linux-media+bounces-35484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7E4AE1A10
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 13:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4166D3AC645
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 11:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B628828A3FA;
	Fri, 20 Jun 2025 11:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KUN3ft+L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD0127CCF5
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 11:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750419305; cv=none; b=U4NFykhu/Cd6oQTCBcILY9mo16plRvJK6w8CqFPV2O1Dad4aCvQo4ynQrKUra+abbBTq5tB7oaE0dWJxsxLwW2IGmeXy/fajDYgLvS7J92Xm0vZ9leQlQIqr/pPOYyCyI1vKmJzdm5pPLvG/M1wIV+Dfyazzj1EPstSjnAyR19M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750419305; c=relaxed/simple;
	bh=C5K/F1laE9qdNLGB8CDNTMrSsKsYcDWEdnytvsjaSfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EqsPdNTXxQBbcj5q7SKg7IlQZTSZ3oOtj0K+CZZl1oc7c7nMr9qwIZ4169Kg+Gd05aRwI80YlUmexUFrvOLU45W3W+pGZcsykpFC8K9khmheOcTZZpsHb1Q8eKuMGa8C2oC+zDsa+TiJV+cvlrsBfto4uyyEr9nTRCSOVqKsGAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KUN3ft+L; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so10928925e9.2
        for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 04:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750419301; x=1751024101; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mSb/WJqG6Ly3nh1AG/W9OmaMQWkMp8HS6RDgfGbzx/I=;
        b=KUN3ft+Lg3o8FP2MdBd4KuhZ0uCwoxmkxwV0JPkFPG78od9+Ycz1kx3UDTcibaHTUH
         rYypg19MMjhcCad1SjVX64/ZTACcw5sDV0h2lSnf+bcz0JJ1OEf/OSBBTtEDT9Uy5UA1
         MzjKWZwKQ3FJLC1v64MLjxAAaMbuBIH85KO99CoG6t5a2r8E9XRNW2bjm7CEoQcoJXdl
         neO072/98UifGU8PkVwHrhxp3+csLdkha8WWnd5cyHPvQWoMCJEocP699YdyTM0Yo2m2
         kpFJqX80YmkhLRt/VmBSd4sOqvO9n0Z56V485CzQFGGaGAU2L32bKFKpaeSO4ed6Vm5d
         RZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750419301; x=1751024101;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mSb/WJqG6Ly3nh1AG/W9OmaMQWkMp8HS6RDgfGbzx/I=;
        b=a+ay1hI3nvYtoakHa9R/CM6vkNwMf+05ngyk+4Z9b1eGmRyUJxuU0V8dfgFUxz0jeI
         9uQx2D6xECxlWv3JdHWpXxOyFLXyAqgpuVu5CF64m991ZLuHOmMluug8wJDFl7qAIvBK
         Gnu7sF5iRhhZW3gnIPqT+QnpFVNSPCKLxAp+48vUaHH3dCkJtUKo2JZA/8MCyZcFcGak
         BTxYLOs8vCg8gFCrxS8b8YS3uXjKZen3yKcSwUtd6uCnT3TYmkWtbJUiiA3kNV5C3Bwb
         q6TN0kbs9KCIRT3fH+XGIckZl2HPMulSSYHUiWQRmTaCTI4elOzH0/wUEq6TfKjzgN3J
         oMvg==
X-Gm-Message-State: AOJu0Yw6QboSZg4w/8S9zhEi+9EMlDLslU0W23EsswM+MAH+dclIzIOM
	Xenx+NANJgTdVfOwEASK5WhnGUkoQ8PC52nfa7fCB8p7gukyA7F/gb7sGGob4QwSWUk=
X-Gm-Gg: ASbGncuvYwAOChXSXDOVjW6fKM1pNG0bwqw6xdDXoFSHg1XNjRR/tvLxFpyea0JQMQT
	+3b/Njb9DxcNIDAhiv5s5EzSagmLZh+tReoIHkLMJI1HBNUeQnSq2AnsF8G8qEnVTrRIN+GWL6p
	goGrMLNbDZ0Cud6Js02NWUYwohBqyhQZrQ+j7/SPKkn5XDG7aHMOPtFFlFUMcfsoxjPuE1gX36e
	ArYcHvHPoWwah1O1A8oD11dtb4X80zLpfXy6dRFD61FTMCugf3eAcD1DcACbT0I71Tori2HW3Yp
	YZoO4gNsCJBuWzRkIKOCH23p382c+/aY9Hh/Wfv+4Wd7sGqBX1xJiNL2P6b/lbyNnhTpyVsuBzY
	uNumw8ZuimLOyd/t6i50nG+svQkHbk9guJAdcpw==
X-Google-Smtp-Source: AGHT+IE1sXxRjLWuyIxfMRq0XXnIfr9OoB0veGRrzBhEEckmil/o3iPtYIVQriMIP2J3nRsToyH7gw==
X-Received: by 2002:a05:600c:3b15:b0:450:cf46:5510 with SMTP id 5b1f17b1804b1-453656c3641mr24495235e9.29.1750419301323;
        Fri, 20 Jun 2025 04:35:01 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebcecb5sm56839975e9.37.2025.06.20.04.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 04:35:00 -0700 (PDT)
Message-ID: <0ee2a535-82e9-4916-9755-a68695167715@linaro.org>
Date: Fri, 20 Jun 2025 12:34:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/13] media: rockchip: add driver for mipi csi-2
 receiver
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
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
References: <20240220-rk3568-vicap-v8-0-9d9cbc4b524d@collabora.com>
 <20240220-rk3568-vicap-v8-7-9d9cbc4b524d@collabora.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240220-rk3568-vicap-v8-7-9d9cbc4b524d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/06/2025 18:06, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The Rockchip RK3568 MIPI CSI-2 Receiver is a CSI-2 bridge with one
> input port and one output port. It receives the data with the help
> of an external MIPI PHY (C-PHY or D-PHY) and passes it to the
> Rockchip RK3568 Video Capture (VICAP) block.
> 
> Add a V4L2 subdevice driver for this unit.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>   MAINTAINERS                                    |   1 +
>   drivers/media/platform/rockchip/Kconfig        |   1 +
>   drivers/media/platform/rockchip/Makefile       |   1 +
>   drivers/media/platform/rockchip/rkcsi/Kconfig  |  16 +
>   drivers/media/platform/rockchip/rkcsi/Makefile |   3 +
>   drivers/media/platform/rockchip/rkcsi/rkcsi.c  | 735 +++++++++++++++++++++++++
>   6 files changed, 757 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 40d806c206be..5b9228f6ddae 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21463,6 +21463,7 @@ M:	Michael Riesch <michael.riesch@collabora.com>
>   L:	linux-media@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi.yaml
> +F:	drivers/media/platform/rockchip/rkcsi/
>   
>   ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
>   M:	Daniel Golle <daniel@makrotopia.org>
> diff --git a/drivers/media/platform/rockchip/Kconfig b/drivers/media/platform/rockchip/Kconfig
> index 549f4e9f443e..96b38768c17e 100644
> --- a/drivers/media/platform/rockchip/Kconfig
> +++ b/drivers/media/platform/rockchip/Kconfig
> @@ -4,4 +4,5 @@ comment "Rockchip media platform drivers"
>   
>   source "drivers/media/platform/rockchip/rga/Kconfig"
>   source "drivers/media/platform/rockchip/rkcif/Kconfig"
> +source "drivers/media/platform/rockchip/rkcsi/Kconfig"
>   source "drivers/media/platform/rockchip/rkisp1/Kconfig"
> diff --git a/drivers/media/platform/rockchip/Makefile b/drivers/media/platform/rockchip/Makefile
> index 6aba32c8830c..932be2d3fdd6 100644
> --- a/drivers/media/platform/rockchip/Makefile
> +++ b/drivers/media/platform/rockchip/Makefile
> @@ -1,4 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   obj-y += rga/
>   obj-y += rkcif/
> +obj-y += rkcsi/
>   obj-y += rkisp1/
> diff --git a/drivers/media/platform/rockchip/rkcsi/Kconfig b/drivers/media/platform/rockchip/rkcsi/Kconfig
> new file mode 100644
> index 000000000000..d8004198c386
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcsi/Kconfig
> @@ -0,0 +1,16 @@
> +config VIDEO_ROCKCHIP_CSI
> +	tristate "Rockchip MIPI CSI-2 Receiver"
> +	depends on VIDEO_DEV
> +	depends on ARCH_ROCKCHIP || COMPILE_TEST
> +	depends on V4L_PLATFORM_DRIVERS
> +	depends on PM && COMMON_CLK
> +	select MEDIA_CONTROLLER
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  This is a driver for Rockchip MIPI CSI-2 Receiver. It is featured
> +	  in various Rockchips SoCs, usually in combination with a Video
> +	  Capture (VICAP) unit (see Rockchip Camera Interface (CIF) driver).
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called rockchip-mipi-csi.
> diff --git a/drivers/media/platform/rockchip/rkcsi/Makefile b/drivers/media/platform/rockchip/rkcsi/Makefile
> new file mode 100644
> index 000000000000..147712cbb68a
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcsi/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_VIDEO_ROCKCHIP_CSI) += rockchip-mipi-csi.o
> +rockchip-mipi-csi-objs += rkcsi.o
> diff --git a/drivers/media/platform/rockchip/rkcsi/rkcsi.c b/drivers/media/platform/rockchip/rkcsi/rkcsi.c
> new file mode 100644
> index 000000000000..eaad3608337e
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcsi/rkcsi.c
> @@ -0,0 +1,735 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip MIPI CSI-2 Receiver Driver
> + *
> + * Copyright (C) 2019 Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/of_platform.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +
> +#include <media/mipi-csi2.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-subdev.h>
> +
> +#define CSI2HOST_N_LANES     0x04
> +#define CSI2HOST_CSI2_RESETN 0x10
> +#define CSI2HOST_PHY_STATE   0x14
> +#define CSI2HOST_ERR1	     0x20
> +#define CSI2HOST_ERR2	     0x24
> +#define CSI2HOST_MSK1	     0x28
> +#define CSI2HOST_MSK2	     0x2c
> +#define CSI2HOST_CONTROL     0x40
> +
> +#define SW_CPHY_EN(x)	     ((x) << 0)
> +#define SW_DSI_EN(x)	     ((x) << 4)
> +#define SW_DATATYPE_FS(x)    ((x) << 8)
> +#define SW_DATATYPE_FE(x)    ((x) << 14)
> +#define SW_DATATYPE_LS(x)    ((x) << 20)
> +#define SW_DATATYPE_LE(x)    ((x) << 26)
> +
> +#define RKCSI_CLKS_MAX	     1
> +
> +enum {
> +	RKCSI_PAD_SINK,
> +	RKCSI_PAD_SRC,
> +	RKCSI_PAD_MAX,
> +};
> +
> +struct rkcsi_format {
> +	u32 code;
> +	u8 depth;
> +	u8 csi_dt;
> +};
> +
> +struct rkcsi_device {
> +	struct device *dev;
> +
> +	void __iomem *base_addr;
> +	struct clk_bulk_data *clks;
> +	unsigned int clks_num;
> +	struct phy *phy;
> +	struct reset_control *reset;
> +
> +	const struct rkcsi_format *formats;
> +	unsigned int formats_num;
> +
> +	struct media_pad pads[RKCSI_PAD_MAX];
> +	struct v4l2_async_notifier notifier;
> +	struct v4l2_fwnode_endpoint vep;
> +	struct v4l2_subdev sd;
> +
> +	struct v4l2_subdev *source_sd;
> +	u32 source_pad;
> +};
> +
> +static const struct v4l2_mbus_framefmt default_format = {
> +	.width = 3840,
> +	.height = 2160,
> +	.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +	.field = V4L2_FIELD_NONE,
> +	.colorspace = V4L2_COLORSPACE_RAW,
> +	.ycbcr_enc = V4L2_YCBCR_ENC_601,
> +	.quantization = V4L2_QUANTIZATION_FULL_RANGE,
> +	.xfer_func = V4L2_XFER_FUNC_NONE,
> +};
> +
> +static const struct rkcsi_format formats[] = {
> +	/* YUV formats */
> +	{
> +		.code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.depth = 16,
> +		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.depth = 16,
> +		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_YVYU8_1X16,
> +		.depth = 16,
> +		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_VYUY8_1X16,
> +		.depth = 16,
> +		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
> +	},
> +	/* RGB formats */
> +	{
> +		.code = MEDIA_BUS_FMT_RGB888_1X24,
> +		.depth = 24,
> +		.csi_dt = MIPI_CSI2_DT_RGB888,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_BGR888_1X24,
> +		.depth = 24,
> +		.csi_dt = MIPI_CSI2_DT_RGB888,
> +	},
> +	/* Bayer formats */
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> +		.depth = 8,
> +		.csi_dt = MIPI_CSI2_DT_RAW8,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
> +		.depth = 8,
> +		.csi_dt = MIPI_CSI2_DT_RAW8,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		.depth = 8,
> +		.csi_dt = MIPI_CSI2_DT_RAW8,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
> +		.depth = 8,
> +		.csi_dt = MIPI_CSI2_DT_RAW8,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +		.depth = 10,
> +		.csi_dt = MIPI_CSI2_DT_RAW10,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
> +		.depth = 10,
> +		.csi_dt = MIPI_CSI2_DT_RAW10,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		.depth = 10,
> +		.csi_dt = MIPI_CSI2_DT_RAW10,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.depth = 10,
> +		.csi_dt = MIPI_CSI2_DT_RAW10,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
> +		.depth = 12,
> +		.csi_dt = MIPI_CSI2_DT_RAW12,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
> +		.depth = 12,
> +		.csi_dt = MIPI_CSI2_DT_RAW12,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +		.depth = 12,
> +		.csi_dt = MIPI_CSI2_DT_RAW12,
> +	},
> +	{
> +		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
> +		.depth = 12,
> +		.csi_dt = MIPI_CSI2_DT_RAW12,
> +	},
> +};
> +
> +static inline struct rkcsi_device *to_rkcsi(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct rkcsi_device, sd);
> +}
> +
> +static inline __maybe_unused void rkcsi_write(struct rkcsi_device *csi_dev,
> +					      unsigned int addr, u32 val)
> +{
> +	writel(val, csi_dev->base_addr + addr);
> +}
> +
> +static inline __maybe_unused u32 rkcsi_read(struct rkcsi_device *csi_dev,
> +					    unsigned int addr)
> +{
> +	return readl(csi_dev->base_addr + addr);
> +}
> +
> +static const struct rkcsi_format *
> +rkcsi_find_format(struct rkcsi_device *csi_dev, u32 mbus_code)
> +{
> +	const struct rkcsi_format *format;
> +
> +	WARN_ON(csi_dev->formats_num == 0);
> +
> +	for (int i = 0; i < csi_dev->formats_num; i++) {
> +		format = &csi_dev->formats[i];
> +		if (format->code == mbus_code)
> +			return format;
> +	}
> +
> +	return NULL;
> +}
> +
> +static int rkcsi_start(struct rkcsi_device *csi_dev)
> +{
> +	struct media_pad *source_pad =
> +		&csi_dev->source_sd->entity.pads[csi_dev->source_pad];
> +	enum v4l2_mbus_type bus_type = csi_dev->vep.bus_type;
> +	union phy_configure_opts opts;
> +	s64 link_freq;
> +	u32 lanes = csi_dev->vep.bus.mipi_csi2.num_data_lanes;
> +	u32 control = 0;
> +	int ret;
> +
> +	if (lanes < 1 || lanes > 4)
> +		return -EINVAL;
> +
> +	/* set mult and div to 0, thus completely rely on V4L2_CID_LINK_FREQ */
> +	link_freq = v4l2_get_link_freq(source_pad, 0, 0);
> +	if (link_freq <= 0)
> +		return -EINVAL;
> +
> +	if (bus_type == V4L2_MBUS_CSI2_DPHY) {
> +		struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
> +
> +		phy_mipi_dphy_get_default_config_for_hsclk(link_freq * 2, lanes,
> +							   cfg);
> +		phy_set_mode(csi_dev->phy, PHY_MODE_MIPI_DPHY);
> +		phy_configure(csi_dev->phy, &opts);

This function can return an error, shouldn't you be capturing it ?

drivers/phy/rockchip/phy-rockchip-innoc-csidphy.c::rockchip_inno_csidphy_configure();

> +
> +		control |= SW_CPHY_EN(0);
> +
> +	} else if (bus_type == V4L2_MBUS_CSI2_CPHY) {
> +		control |= SW_CPHY_EN(1);

Do you need to flag this when you are returning an error ?

Other than that looks pretty good.

---
bod

