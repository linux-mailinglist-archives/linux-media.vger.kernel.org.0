Return-Path: <linux-media+bounces-22287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4B99DBFCE
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 08:42:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAC27B21AE9
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 07:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57630158853;
	Fri, 29 Nov 2024 07:41:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67BD184F;
	Fri, 29 Nov 2024 07:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732866110; cv=none; b=euXqi0kyYyH3Z0/7/qtcnw0VaMXlsgvrLF1gepJcVvsbtpOP+AsTju89CBJIXtHwOKekLXmBo57Yru/JPCcr6OJg5ErU53fSacSKkEU82DkucdZ5krSDwO9/mAl6W2V+taSdsmyjGffy3GtBxYM47kMuEpCn46EOocmCccEPfUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732866110; c=relaxed/simple;
	bh=FWVpsEO1O2tA8w+mNTqG1x5Mh8ngd6b9vQM5sPRnDKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bki1rUN7mqIoQMyBGdx2HNs+2CeYzLzWGGn/ZaR7jm/njF7fR/Wyx7OrL+opql0TCTPC8F+fpgrXMRNh1DK7jFMfsh2dV2aTfyXtodCgwLrPSG+i7gpdfYNRq2B0XmMP9KbGDIvaaglH53vpmWvqF5cqy6LpVA6CezqHynMlUlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E84C4CECF;
	Fri, 29 Nov 2024 07:41:45 +0000 (UTC)
Message-ID: <4b33d8ba-d523-40d0-8fe8-4b5cb35c9372@xs4all.nl>
Date: Fri, 29 Nov 2024 08:41:44 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/28] media: iris: add platform driver for iris video
 device
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jianhua Lu <lujianhua000@gmail.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241120-qcom-video-iris-v6-0-a8cf6704e992@quicinc.com>
 <20241120-qcom-video-iris-v6-2-a8cf6704e992@quicinc.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 xsFNBFQ84W0BEAC7EF1iL4s3tY8cRTVkJT/297h0Hz0ypA+ByVM4CdU9sN6ua/YoFlr9k0K4
 BFUlg7JzJoUuRbKxkYb8mmqOe722j7N3HO8+ofnio5cAP5W0WwDpM0kM84BeHU0aPSTsWiGR
 yw55SOK2JBSq7hueotWLfJLobMWhQii0Zd83hGT9SIt9uHaHjgwmtTH7MSTIiaY6N14nw2Ud
 C6Uykc1va0Wqqc2ov5ihgk/2k2SKa02ookQI3e79laOrbZl5BOXNKR9LguuOZdX4XYR3Zi6/
 BsJ7pVCK9xkiVf8svlEl94IHb+sa1KrlgGv3fn5xgzDw8Z222TfFceDL/2EzUyTdWc4GaPMC
 E/c1B4UOle6ZHg02+I8tZicjzj5+yffv1lB5A1btG+AmoZrgf0X2O1B96fqgHx8w9PIpVERN
 YsmkfxvhfP3MO3oHh8UY1OLKdlKamMneCLk2up1Zlli347KMjHAVjBAiy8qOguKF9k7HOjif
 JCLYTkggrRiEiE1xg4tblBNj8WGyKH+u/hwwwBqCd/Px2HvhAsJQ7DwuuB3vBAp845BJYUU3
 06kRihFqbO0vEt4QmcQDcbWINeZ2zX5TK7QQ91ldHdqJn6MhXulPKcM8tCkdD8YNXXKyKqNl
 UVqXnarz8m2JCbHgjEkUlAJCNd6m3pfESLZwSWsLYL49R5yxIwARAQABzSFIYW5zIFZlcmt1
 aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD7CwZUEEwEKAD8CGwMGCwkIBwMCBhUIAgkKCwQWAgMB
 Ah4BAheAFiEEBSzee8IVBTtonxvKvS1hSGYUO0wFAmaU3GkFCRf7lXsACgkQvS1hSGYUO0wZ
 cw//cLMiaV+p2rCyzdpDjWon2XD6M646THYvqXLb9eVWicFlVG78kNtHrHyEWKPhN3OdWWjn
 kOzXseVR/nS6vZvqCaT3rwgh3ZMb0GvOQk1/7V8UbcIERy036AjQoZmKo5tEDIv48MSvqxjj
 H6wbKXbCyvnIwpGICLyb0xAwvvpTaJkwZjvGqeo5EL0Z+cQ8fCelfKNO5CFFP3FNd3dH8wU6
 CHRtdZE03iIVEWpgCTjsG2zwsX/CKfPx0EKcrQajW3Tc50Jm0uuRUEKCVphlYORAPtFAF1dj
 Ly8zpN1bEXH+0FDXe/SHhzbvgS4sL0J4KQCCZ/GcbKh/vsDC1VLsGS5C7fKOhAtOkUPWRjF+
 kOEEcTOROMMvSUVokO+gCdb9nA/e3WMgiTwWRumWy5eCEnCpM9+rfI2HzTeACrVgGEDkOTHW
 eaGHEy8nS9a25ejQzsBhi+T7MW53ZTIjklR7dFl/uuK+EJ6DLbDpVbwyYo2oeiwP+sf8/Rgv
 WfJv4wzfUo/JABwrsbfWfycVZwFWBzqq+TaKFkMPm017dkLdg4MzxvvTMP7nKfJxU1bQ2OOr
 xkPk5KDcz+aRYBvTqEXgYZ6OZtnOUFKD+uPlbWf68vuz/1iFbQYnNJkTxwWhiIMN7BULK74d
 Ek89MU7JlbYNSv0v21lRF+uDo0J6zyoTt0ZxSPzOwU0EVDzhbQEQANzLiI6gHkIhBQKeQaYs
 p2SSqF9c++9LOy5x6nbQ4s0X3oTKaMGfBZuiKkkU6NnHCSa0Az5ScRWLaRGu1PzjgcVwzl5O
 sDawR1BtOG/XoPRNB2351PRp++W8TWo2viYYY0uJHKFHML+ku9q0P+NkdTzFGJLP+hn7x0RT
 DMbhKTHO3H2xJz5TXNE9zTJuIfGAz3ShDpijvzYieY330BzZYfpgvCllDVM5E4XgfF4F/N90
 wWKu50fMA01ufwu+99GEwTFVG2az5T9SXd7vfSgRSkzXy7hcnxj4IhOfM6Ts85/BjMeIpeqy
 TDdsuetBgX9DMMWxMWl7BLeiMzMGrfkJ4tvlof0sVjurXibTibZyfyGR2ricg8iTbHyFaAzX
 2uFVoZaPxrp7udDfQ96sfz0hesF9Zi8d7NnNnMYbUmUtaS083L/l2EDKvCIkhSjd48XF+aO8
 VhrCfbXWpGRaLcY/gxi2TXRYG9xCa7PINgz9SyO34sL6TeFPSZn4bPQV5O1j85Dj4jBecB1k
 z2arzwlWWKMZUbR04HTeAuuvYvCKEMnfW3ABzdonh70QdqJbpQGfAF2p4/iCETKWuqefiOYn
 pR8PqoQA1DYv3t7y9DIN5Jw/8Oj5wOeEybw6vTMB0rrnx+JaXvxeHSlFzHiD6il/ChDDkJ9J
 /ejCHUQIl40wLSDRABEBAAHCwXwEGAEKACYCGwwWIQQFLN57whUFO2ifG8q9LWFIZhQ7TAUC
 ZpTcxwUJF/uV2gAKCRC9LWFIZhQ7TMlPD/9ppgrN4Z9gXta9IdS8a+0E7lj/dc0LnF9T6MMq
 aUC+CFffTiOoNDnfXh8sfsqTjAT50TsVpdlH6YyPlbU5FR8bC8wntrJ6ZRWDdHJiCDLqNA/l
 GVtIKP1YW8fA01thMcVUyQCdVUqnByMJiJQDzZYrX+E/YKUTh2RL5Ye0foAGE7SGzfZagI0D
 OZN92w59e1Jg3zBhYXQIjzBbhGIy7usBfvE882GdUbP29bKfTpcOKkJIgO6K+w82D/1d5TON
 SD146+UySmEnjYxHI8kBYaZJ4ubyYrDGgXT3jIBPq8i9iZP3JSeZ/0F9UIlX4KeMSG8ymgCR
 SqL1y9pl9R2ewCepCahEkTT7IieGUzJZz7fGUaxrSyexPE1+qNosfrUIu3yhRA6AIjhwPisl
 aSwDxLI6qWDEQeeWNQaYUSEIFQ5XkZxd/VN8JeMwGIAq17Hlym+JzjBkgkm1LV9LXw9D8MQL
 e8tSeEXX8BZIen6y/y+U2CedzEsMKGjy5WNmufiPOzB3q2JwFQCw8AoNic7soPN9CVCEgd2r
 XS+OUZb8VvEDVRSK5Yf79RveqHvmhAdNOVh70f5CvwR/bfX/Ei2Szxz47KhZXpn1lxmcds6b
 LYjTAZF0anym44vsvOEuQg3rqxj/7Hiz4A3HIkrpTWclV6ru1tuGp/ZJ7aY8bdvztP2KTw==
In-Reply-To: <20241120-qcom-video-iris-v6-2-a8cf6704e992@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/11/2024 15:45, Dikshita Agarwal wrote:
> In preparation of adding H264 decode functionality, add probe and remove
> functions and platform data to initialize iris resources, which are
> clocks, interconnects, power domains, reset clocks, and clock
> frequencies used for iris hardware.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>

Regards,

	Hans

> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/Kconfig                |   1 +
>  drivers/media/platform/qcom/Makefile               |   1 +
>  drivers/media/platform/qcom/iris/Kconfig           |   9 +
>  drivers/media/platform/qcom/iris/Makefile          |   4 +
>  drivers/media/platform/qcom/iris/iris_core.h       |  54 +++++
>  .../platform/qcom/iris/iris_platform_common.h      |  35 +++
>  .../platform/qcom/iris/iris_platform_sm8550.c      |  37 ++++
>  drivers/media/platform/qcom/iris/iris_probe.c      | 237 +++++++++++++++++++++
>  8 files changed, 378 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/qcom/Kconfig
> index cc5799b9ea00..4f4d3a68e6e5 100644
> --- a/drivers/media/platform/qcom/Kconfig
> +++ b/drivers/media/platform/qcom/Kconfig
> @@ -3,4 +3,5 @@
>  comment "Qualcomm media platform drivers"
>  
>  source "drivers/media/platform/qcom/camss/Kconfig"
> +source "drivers/media/platform/qcom/iris/Kconfig"
>  source "drivers/media/platform/qcom/venus/Kconfig"
> diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platform/qcom/Makefile
> index 4f055c396e04..ea2221a202c0 100644
> --- a/drivers/media/platform/qcom/Makefile
> +++ b/drivers/media/platform/qcom/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-y += camss/
> +obj-y += iris/
>  obj-y += venus/
> diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
> new file mode 100644
> index 000000000000..34a2f81c5db3
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/Kconfig
> @@ -0,0 +1,9 @@
> +config VIDEO_QCOM_IRIS
> +        tristate "Qualcomm iris V4L2 decoder driver"
> +        depends on VIDEO_DEV
> +        depends on ARCH_QCOM || COMPILE_TEST
> +        help
> +          This is a V4L2 driver for Qualcomm iris video accelerator
> +          hardware. It accelerates decoding operations on various
> +          Qualcomm SoCs.
> +          To compile this driver as a module choose m here.
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> new file mode 100644
> index 000000000000..7e701361492e
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -0,0 +1,4 @@
> +iris-objs += iris_platform_sm8550.o \
> +             iris_probe.o \
> +
> +obj-$(CONFIG_VIDEO_QCOM_IRIS) += iris.o
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> new file mode 100644
> index 000000000000..27bc2ca71e1b
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef __IRIS_CORE_H__
> +#define __IRIS_CORE_H__
> +
> +#include <linux/types.h>
> +#include <media/v4l2-device.h>
> +
> +#include "iris_platform_common.h"
> +
> +struct icc_info {
> +	const char		*name;
> +	u32			bw_min_kbps;
> +	u32			bw_max_kbps;
> +};
> +
> +/**
> + * struct iris_core - holds core parameters valid for all instances
> + *
> + * @dev: reference to device structure
> + * @reg_base: IO memory base address
> + * @irq: iris irq
> + * @v4l2_dev: a holder for v4l2 device structure
> + * @vdev_dec: iris video device structure for decoder
> + * @icc_tbl: table of iris interconnects
> + * @icc_count: count of iris interconnects
> + * @pmdomain_tbl: table of iris power domains
> + * @opp_pmdomain_tbl: table of opp power domains
> + * @clock_tbl: table of iris clocks
> + * @clk_count: count of iris clocks
> + * @resets: table of iris reset clocks
> + * @iris_platform_data: a structure for platform data
> + */
> +
> +struct iris_core {
> +	struct device				*dev;
> +	void __iomem				*reg_base;
> +	int					irq;
> +	struct v4l2_device			v4l2_dev;
> +	struct video_device			*vdev_dec;
> +	struct icc_bulk_data			*icc_tbl;
> +	u32					icc_count;
> +	struct dev_pm_domain_list		*pmdomain_tbl;
> +	struct dev_pm_domain_list		*opp_pmdomain_tbl;
> +	struct clk_bulk_data			*clock_tbl;
> +	u32					clk_count;
> +	struct reset_control_bulk_data		*resets;
> +	const struct iris_platform_data		*iris_platform_data;
> +};
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> new file mode 100644
> index 000000000000..31c53dad8136
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef __IRIS_PLATFORM_COMMON_H__
> +#define __IRIS_PLATFORM_COMMON_H__
> +
> +extern struct iris_platform_data sm8550_data;
> +
> +enum platform_clk_type {
> +	IRIS_AXI_CLK,
> +	IRIS_CTRL_CLK,
> +	IRIS_HW_CLK,
> +};
> +
> +struct platform_clk_data {
> +	enum platform_clk_type clk_type;
> +	const char *clk_name;
> +};
> +
> +struct iris_platform_data {
> +	const struct icc_info *icc_tbl;
> +	unsigned int icc_tbl_size;
> +	const char * const *pmdomain_tbl;
> +	unsigned int pmdomain_tbl_size;
> +	const char * const *opp_pd_tbl;
> +	unsigned int opp_pd_tbl_size;
> +	const struct platform_clk_data *clk_tbl;
> +	unsigned int clk_tbl_size;
> +	const char * const *clk_rst_tbl;
> +	unsigned int clk_rst_tbl_size;
> +};
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> new file mode 100644
> index 000000000000..3dd91523d783
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "iris_core.h"
> +#include "iris_platform_common.h"
> +
> +static const struct icc_info sm8550_icc_table[] = {
> +	{ "cpu-cfg",    1000, 1000     },
> +	{ "video-mem",  1000, 15000000 },
> +};
> +
> +static const char * const sm8550_clk_reset_table[] = { "bus" };
> +
> +static const char * const sm8550_pmdomain_table[] = { "venus", "vcodec0" };
> +
> +static const char * const sm8550_opp_pd_table[] = { "mxc", "mmcx" };
> +
> +static const struct platform_clk_data sm8550_clk_table[] = {
> +	{IRIS_AXI_CLK,  "iface"        },
> +	{IRIS_CTRL_CLK, "core"         },
> +	{IRIS_HW_CLK,   "vcodec0_core" },
> +};
> +
> +struct iris_platform_data sm8550_data = {
> +	.icc_tbl = sm8550_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> +	.clk_rst_tbl = sm8550_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
> +	.pmdomain_tbl = sm8550_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> +	.opp_pd_tbl = sm8550_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> +	.clk_tbl = sm8550_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> new file mode 100644
> index 000000000000..911e3bc1b434
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -0,0 +1,237 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/interconnect.h>
> +#include <linux/module.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_opp.h>
> +#include <linux/reset.h>
> +
> +#include "iris_core.h"
> +
> +static int iris_init_icc(struct iris_core *core)
> +{
> +	const struct icc_info *icc_tbl;
> +	u32 i = 0;
> +
> +	icc_tbl = core->iris_platform_data->icc_tbl;
> +
> +	core->icc_count = core->iris_platform_data->icc_tbl_size;
> +	core->icc_tbl = devm_kzalloc(core->dev,
> +				     sizeof(struct icc_bulk_data) * core->icc_count,
> +				     GFP_KERNEL);
> +	if (!core->icc_tbl)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < core->icc_count; i++) {
> +		core->icc_tbl[i].name = icc_tbl[i].name;
> +		core->icc_tbl[i].avg_bw = icc_tbl[i].bw_min_kbps;
> +		core->icc_tbl[i].peak_bw = 0;
> +	}
> +
> +	return devm_of_icc_bulk_get(core->dev, core->icc_count, core->icc_tbl);
> +}
> +
> +static int iris_init_power_domains(struct iris_core *core)
> +{
> +	const struct platform_clk_data *clk_tbl;
> +	u32 clk_cnt, i;
> +	int ret;
> +
> +	struct dev_pm_domain_attach_data iris_pd_data = {
> +		.pd_names = core->iris_platform_data->pmdomain_tbl,
> +		.num_pd_names = core->iris_platform_data->pmdomain_tbl_size,
> +		.pd_flags = PD_FLAG_NO_DEV_LINK,
> +	};
> +
> +	struct dev_pm_domain_attach_data iris_opp_pd_data = {
> +		.pd_names = core->iris_platform_data->opp_pd_tbl,
> +		.num_pd_names = core->iris_platform_data->opp_pd_tbl_size,
> +		.pd_flags = PD_FLAG_DEV_LINK_ON,
> +	};
> +
> +	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &core->pmdomain_tbl);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
> +	if (ret < 0)
> +		return ret;
> +
> +	clk_tbl = core->iris_platform_data->clk_tbl;
> +	clk_cnt = core->iris_platform_data->clk_tbl_size;
> +
> +	for (i = 0; i < clk_cnt; i++) {
> +		if (clk_tbl[i].clk_type == IRIS_HW_CLK) {
> +			ret = devm_pm_opp_set_clkname(core->dev, clk_tbl[i].clk_name);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return devm_pm_opp_of_add_table(core->dev);
> +}
> +
> +static int iris_init_clocks(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = devm_clk_bulk_get_all(core->dev, &core->clock_tbl);
> +	if (ret < 0)
> +		return ret;
> +
> +	core->clk_count = ret;
> +
> +	return 0;
> +}
> +
> +static int iris_init_resets(struct iris_core *core)
> +{
> +	const char * const *rst_tbl;
> +	u32 rst_tbl_size;
> +	u32 i = 0;
> +
> +	rst_tbl = core->iris_platform_data->clk_rst_tbl;
> +	rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
> +
> +	core->resets = devm_kzalloc(core->dev,
> +				    sizeof(*core->resets) * rst_tbl_size,
> +				    GFP_KERNEL);
> +	if (!core->resets)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < rst_tbl_size; i++)
> +		core->resets[i].id = rst_tbl[i];
> +
> +	return devm_reset_control_bulk_get_exclusive(core->dev, rst_tbl_size, core->resets);
> +}
> +
> +static int iris_init_resources(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_init_icc(core);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_init_power_domains(core);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_init_clocks(core);
> +	if (ret)
> +		return ret;
> +
> +	return iris_init_resets(core);
> +}
> +
> +static int iris_register_video_device(struct iris_core *core)
> +{
> +	struct video_device *vdev;
> +	int ret;
> +
> +	vdev = video_device_alloc();
> +	if (!vdev)
> +		return -ENOMEM;
> +
> +	strscpy(vdev->name, "qcom-iris-decoder", sizeof(vdev->name));
> +	vdev->release = video_device_release;
> +	vdev->vfl_dir = VFL_DIR_M2M;
> +	vdev->v4l2_dev = &core->v4l2_dev;
> +	vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
> +
> +	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret)
> +		goto err_vdev_release;
> +
> +	core->vdev_dec = vdev;
> +	video_set_drvdata(vdev, core);
> +
> +	return 0;
> +
> +err_vdev_release:
> +	video_device_release(vdev);
> +
> +	return ret;
> +}
> +
> +static void iris_remove(struct platform_device *pdev)
> +{
> +	struct iris_core *core;
> +
> +	core = platform_get_drvdata(pdev);
> +	if (!core)
> +		return;
> +
> +	video_unregister_device(core->vdev_dec);
> +
> +	v4l2_device_unregister(&core->v4l2_dev);
> +}
> +
> +static int iris_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct iris_core *core;
> +	int ret;
> +
> +	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
> +	if (!core)
> +		return -ENOMEM;
> +	core->dev = dev;
> +
> +	core->reg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(core->reg_base))
> +		return PTR_ERR(core->reg_base);
> +
> +	core->irq = platform_get_irq(pdev, 0);
> +	if (core->irq < 0)
> +		return core->irq;
> +
> +	core->iris_platform_data = of_device_get_match_data(core->dev);
> +
> +	ret = iris_init_resources(core);
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l2_device_register(dev, &core->v4l2_dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_register_video_device(core);
> +	if (ret)
> +		goto err_v4l2_unreg;
> +
> +	platform_set_drvdata(pdev, core);
> +
> +	return 0;
> +
> +err_v4l2_unreg:
> +	v4l2_device_unregister(&core->v4l2_dev);
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id iris_dt_match[] = {
> +	{
> +		.compatible = "qcom,sm8550-iris",
> +		.data = &sm8550_data,
> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, iris_dt_match);
> +
> +static struct platform_driver qcom_iris_driver = {
> +	.probe = iris_probe,
> +	.remove = iris_remove,
> +	.driver = {
> +		.name = "qcom-iris",
> +		.of_match_table = iris_dt_match,
> +	},
> +};
> +
> +module_platform_driver(qcom_iris_driver);
> +MODULE_DESCRIPTION("Qualcomm iris video driver");
> +MODULE_LICENSE("GPL");
> 


