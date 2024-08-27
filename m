Return-Path: <linux-media+bounces-16917-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 476209607DD
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 12:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C60741F232A3
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80EDB19EEAF;
	Tue, 27 Aug 2024 10:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YgvZQF4o"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46BF19753F;
	Tue, 27 Aug 2024 10:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724755913; cv=none; b=UrNeq0P95DGeyRxMv/m8jktmVHws2RLrjZ36cFpJ1EIwoU15Ga9UkNwuUDeHN3o6Z2JpbPeG9QMeWFO5udeWpIXehKeXvJ1WoAAQf99h/g7voY4gyK3b8a6sG+NpLsI31sHafSWeeWnMzZWOgkUadbNZmMMjT9YEQspUTYL8pt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724755913; c=relaxed/simple;
	bh=TeJrDQy3fJuDWSxIq3vLDrsob+bLlaQ3lUK42XDZhl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QIgy3q9T4RwOJTF+y1393PSi576c/vNLOOB1lflQ8uqmCikYtYaVP1OTkTZepvMaU2boQpNmoDSV+HJHZijp8rkYtBUHrZy7VKM+1l7szBt0J7bWN5nj+RbFnr9VWz031PgDgTlyHzZ8bPBuI76Ma9k1BXh+t5NP96ef1+/IW7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YgvZQF4o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C35F0C8B7C2;
	Tue, 27 Aug 2024 10:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724755912;
	bh=TeJrDQy3fJuDWSxIq3vLDrsob+bLlaQ3lUK42XDZhl8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YgvZQF4o+FN5DLg12DjaIz+won+L3MaVRP5u8wKHNGzE5Chxr+5rFMP6Iiwu6X/2Z
	 u2m9zuG9ojvkLDjt2o39VzXvB7ejNNwWVTn8osdkT4pKiXxPFeJVZPu3gRSXF+NmLc
	 eii51h4Qb/mWAXgFePCz0vfF9f9E57C0TnBXHqVYUFOUY8R20pIO4sZXu66zP5hsFO
	 jys/Nx+8X9xAXP8LAA7VoGrUefGy/0gh3XvROuEgV4gW1oBW/i+gkjrC0GfGeVktiN
	 C4PwY0VU/OXllC6Uxy+JpHg4rUX8ngC4IfJf9ysOHXc/VY1jU0CINzlWQhQWsdbdrL
	 mSi/9miav9jOg==
Message-ID: <81fd218f-aa0f-4710-b832-cab927bfab9d@kernel.org>
Date: Tue, 27 Aug 2024 12:51:45 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/29] media: iris: initialize power resources
To: quic_dikshita@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-4-c5fdbbe65e70@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240827-iris_v3-v3-4-c5fdbbe65e70@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/08/2024 12:05, Dikshita Agarwal via B4 Relay wrote:
> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
> 
> Add support for initializing Iris "resources", which are clocks,
> interconnects, power domains, reset clocks, and clock frequencies
> used for iris hardware.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---

...

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
> index 0a54fdaa1ab5..2616a31224f9 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -69,6 +69,19 @@ static int iris_probe(struct platform_device *pdev)
>  	if (core->irq < 0)
>  		return core->irq;
>  
> +	core->iris_platform_data = of_device_get_match_data(core->dev);
> +	if (!core->iris_platform_data) {
> +		ret = -ENODEV;
> +		dev_err_probe(core->dev, ret, "init platform failed\n");

That's not even possible. I would suggest dropping entire if. But if yoi
insist, then without this weird redundant code. return -EINVAL.

> +		return ret;
> +	}
> +
> +	ret = iris_init_resources(core);
> +	if (ret) {
> +		dev_err_probe(core->dev, ret, "init resource failed\n");
> +		return ret;

How many same errors are you printing? Not mentioning that syntax of
dev_errp_rpboe is different...


> +	}
> +
>  	ret = v4l2_device_register(dev, &core->v4l2_dev);
>  	if (ret)
>  		return ret;
> @@ -88,8 +101,14 @@ static int iris_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id iris_dt_match[] = {
> -	{ .compatible = "qcom,sm8550-iris", },
> -	{ .compatible = "qcom,sm8250-venus", },
> +	{
> +		.compatible = "qcom,sm8550-iris",
> +		.data = &sm8550_data,
> +	},
> +	{
> +		.compatible = "qcom,sm8250-venus",
> +		.data = &sm8250_data,

You just added this. No, please do not add code which is immediatly
incorrect.

> +	},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, iris_dt_match);
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> new file mode 100644
> index 000000000000..57c6f9f3449b
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -0,0 +1,171 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/interconnect.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_opp.h>
> +#include <linux/reset.h>
> +
> +#include "iris_core.h"
> +#include "iris_resources.h"
> +
> +static int iris_init_icc(struct iris_core *core)
> +{
> +	const struct icc_info *icc_tbl;
> +	u32 ret, i = 0;
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
> +	ret = devm_of_icc_bulk_get(core->dev, core->icc_count, core->icc_tbl);
> +	if (ret)
> +		dev_err(core->dev, "failed to get interconnect paths, NoC will stay unconfigured!\n");
> +
> +	return ret;
> +}
> +
> +static int iris_pd_get(struct iris_core *core)
> +{
> +	int ret;
> +
> +	struct dev_pm_domain_attach_data iris_pd_data = {
> +		.pd_names = core->iris_platform_data->pmdomain_tbl,
> +		.num_pd_names = core->iris_platform_data->pmdomain_tbl_size,
> +		.pd_flags = PD_FLAG_NO_DEV_LINK,
> +	};
> +
> +	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &core->pmdomain_tbl);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int iris_opp_pd_get(struct iris_core *core)
> +{
> +	int ret;
> +
> +	struct dev_pm_domain_attach_data iris_opp_pd_data = {
> +		.pd_names = core->iris_platform_data->opp_pd_tbl,
> +		.num_pd_names = core->iris_platform_data->opp_pd_tbl_size,
> +		.pd_flags = PD_FLAG_DEV_LINK_ON,
> +	};
> +
> +	ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int iris_init_power_domains(struct iris_core *core)
> +{
> +	const struct platform_clk_data *clk_tbl;
> +	u32 clk_cnt, i;
> +	int ret;
> +
> +	ret = iris_pd_get(core);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_opp_pd_get(core);
> +	if (ret)
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
> +	ret = devm_pm_opp_of_add_table(core->dev);
> +	if (ret) {
> +		dev_err(core->dev, "failed to add opp table\n");
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static int iris_init_clocks(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = devm_clk_bulk_get_all(core->dev, &core->clock_tbl);
> +	if (ret < 0) {
> +		dev_err(core->dev, "failed to get bulk clock\n");

Syntax is:
return dev_err_probe(). If this is probe path. Is it?

> +		return ret;
> +	}
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
> +	u32 i = 0, ret;
> +
> +	rst_tbl = core->iris_platform_data->clk_rst_tbl;
> +	rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
> +
> +	core->resets = devm_kzalloc(core->dev,
> +				    sizeof(*core->resets) * rst_tbl_size,
> +				    GFP_KERNEL);
> +	if (rst_tbl_size && !core->resets)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < rst_tbl_size; i++)
> +		core->resets[i].id = rst_tbl[i];
> +
> +	ret = devm_reset_control_bulk_get_exclusive(core->dev, rst_tbl_size, core->resets);
> +	if (ret) {
> +		dev_err(core->dev, "failed to get resets\n");

Syntax is:
return dev_err_probe(). If this is probe path. Is it?

> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +int iris_init_resources(struct iris_core *core)
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
> +	ret = iris_init_resets(core);
> +
> +	return ret;
> +}

This should be just part of of main unit file, next to probe. It is
unusual to see probe parts not next to probe. Sorry, that's wrong.

Best regards,
Krzysztof


