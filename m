Return-Path: <linux-media+bounces-39533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C293AB2208A
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 10:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F28D17A660
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080222E11D5;
	Tue, 12 Aug 2025 08:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJQFV4Wx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9861D52B;
	Tue, 12 Aug 2025 08:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754986603; cv=none; b=XuyksSDU2Iq62BwHz6QV38+/iBT+MY2atnVSsPRVfrdKRkH908KO/2ecLfjn97WG/D9Cmli+d6KvdxCG1ebbiaZZWtX58FVomD824WHnV/wgIdf4kUMM2QJh/toyz8XfkwD+QV/BjVdRvMXK93Bx8TSYTlAMCFCG6GBxsRM0alw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754986603; c=relaxed/simple;
	bh=P/4iHug9aWMJUEbfqYNlF4Q9hMiKkkjLX3Wk1MYqj+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QRN1tsYaj1q5r5jrOUXRYKkfFGXWNpy2hsB0aTI+9sLlNhNbJJKS4cBa2gO7NwYYzDLnn30OIDgv1TZk/sc0OPOnf7TwndWYu73HxTqstcl4uUOC/IiozIWj0+B/jlmebcqJ2/HC7cpbTpITl+Q9a8QuJByaRMZCNhA3qaLzI24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJQFV4Wx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7400FC4CEF0;
	Tue, 12 Aug 2025 08:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754986602;
	bh=P/4iHug9aWMJUEbfqYNlF4Q9hMiKkkjLX3Wk1MYqj+E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fJQFV4WxW1ldsuOPyZ4PgSM1LHloFHo9u8dEP0cFlKN2klN+QMyZUCUG7lnAK+Cb1
	 L7tCJmDqnrCmSjzyNwT5Oz1khEfKX0+DrIH0Rp1K6yBnKPBse5TB3wy8yV9PrssE1J
	 eu6qzwN/aS4UfPURh7PvZgwLliSLHfgofRi/P9WhbKqjizDmSqgKAPuJS9vrMQkg7r
	 n/uqQpZbf9tlrw2wPv/pvkNaFfJ+ynpNtTKm2Mmq8b6SzU0Hart74QPU3xQ3SKOdN2
	 pNk5m0te5xuqrQhQvgLtNYio1UkLWYc2aljKvRl5RoOw1VsWn1tvJHSfoBhXKHPlBb
	 QPy3oliDy7eoQ==
Message-ID: <db11085e-bca3-4d54-b435-c8f8d8672acd@kernel.org>
Date: Tue, 12 Aug 2025 10:16:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: iris: Add support for SM8750 (VPU v3.5)
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org>
 <20250804-sm8750-iris-v2-3-6d78407f8078@linaro.org>
 <83205cad-14f5-65a1-1818-677335a1ab91@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <83205cad-14f5-65a1-1818-677335a1ab91@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/08/2025 10:05, Dikshita Agarwal wrote:
>>  
>>  struct platform_clk_data {
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> index d3026b2bcb708c7ec31f134f628df7e57b54af4f..c7c384fce2332255ea96da69ef4dc0bc1a24771c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> @@ -1,6 +1,7 @@
>>  // SPDX-License-Identifier: GPL-2.0-only
>>  /*
>>   * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2025 Linaro Ltd
> 
> 
> I don't see a need to add a copyright here.

And I see the need, I added there quite a lot of lines.

Look at your commit bb8a95aa038e099f5ec82c466e996b006e05abd7
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bb8a95aa038e099f5ec82c466e996b006e05abd7

and this hunk:
drivers/media/platform/qcom/iris/iris_resources.h

which adds 7 (!) declarations and a copyright.

If you claim you copyright 7 lines of such declarations:

+struct iris_core;
+
+int iris_enable_power_domains(struct iris_core *core, struct device
*pd_dev);
+int iris_disable_power_domains(struct iris_core *core, struct device
*pd_dev);
+int iris_unset_icc_bw(struct iris_core *core);
+int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
+int iris_disable_unprepare_clock(struct iris_core *core, enum
platform_clk_type clk_type);
+int iris_prepare_enable_clock(struct iris_core *core, enum
platform_clk_type clk_type);

then me adding here 68 lines of NEW CREATIVE WORK is copyrightable as well.

Anyway, you cannot reject someone's copyrights. The work is
copyrightable regardless if you see a need.

> 
>> +
>> +	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>> +}
>> +
>> +static int iris_vpu35_power_off_controller(struct iris_core *core)
>> +{
>> +	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
>> +	u32 val = 0;
>> +	int ret;
>> +
>> +	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
>> +
>> +	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
>> +
>> +	ret = readl_poll_timeout(core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
>> +				 val, val & BIT(0), 200, 2000);
>> +	if (ret)
>> +		goto disable_power;
>> +
>> +	writel(0x0, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
>> +
>> +	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
> 
> 
> Read initial status of AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS
> 
> based on value, run the retry loop.
> This loop runs till the desired LPI state is reached i.e. BIT(0) is set,
> and hardware is idle i.e. BIT(1) or BIT(2) are unset. This suggests a
> situation where the hardware might be stuck or slow to transition.
> 
> This sequence was not needed for SM8650 since it doesn't have
> AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL/STATUS registers.
> But required for SM8750, so please add.


Sure

> 
> 
>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS,
>> +				 val, val & (BIT(0) | BIT(1) | BIT(2)), 15, 1000);
>> +	if (ret)
>> +		goto disable_power> +
>> +	writel(0x0, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
>> +
>> +	writel(0x0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
>> +
>> +	ret = readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
>> +				 val, val == 0, 200, 2000);
>> +	if (ret)
>> +		goto disable_power;
>> +
>> +disable_power:
>> +	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
>> +	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
>> +
>> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>> +
>> +	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
>> +
>> +	return 0;
>> +}
>> +
>> +static int iris_vpu35_power_on_controller(struct iris_core *core)
>> +{
>> +	u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
>> +	int ret;
>> +
>> +	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = reset_control_bulk_reset(rst_tbl_size, core->resets);
>> +	if (ret)
>> +		goto err_disable_power;
> 
> 
> this reset is not needed to power-on this SOC.


Hm, I will trust you on that, thanks.

Best regards,
Krzysztof

