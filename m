Return-Path: <linux-media+bounces-43230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CF5BA201F
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 01:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 709AD741624
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 23:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835D22EF677;
	Thu, 25 Sep 2025 23:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AXFIFGjL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD53747F;
	Thu, 25 Sep 2025 23:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758844779; cv=none; b=BAGuFok9A+f/eh8y3ijPx/5AxiJfI1DVMBpGpIFpWD4KNJ59Ykpm8BjeeM4rv5zTzqeJCfzVrzFFk5tFQgoqPrycUeRoEDm+NBOvQgN2k77IBEzAgM12ViYunk8UkBq2JaH4IjNi8vVIa/frUhXdh010ImAx9xci7qbFBG8U2MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758844779; c=relaxed/simple;
	bh=sbwonwoMcMg3gRVUCNVKHRKyGKKED68NK6bZVC6CMT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EwXVy65NrrDWmzlGUbfi5TkFRE6YVoPua9ZKbMC769ilKJhoHSqbB9gNn6rY9vhwAXn0v3GJKBq0V7uVRr3RGvt4HjqYjsf5V8aVEF87aaYCWJCDF+WP9ddGAyzfd4b+F+CJSx/XkCktZpreMyam+M/ZWgP32jwJOaxMTEm9/Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AXFIFGjL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 043FEC4CEF0;
	Thu, 25 Sep 2025 23:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758844779;
	bh=sbwonwoMcMg3gRVUCNVKHRKyGKKED68NK6bZVC6CMT8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AXFIFGjLjfG1n4q7ooR9ghqQWnaMgntT0ftewx8H6n/d1+Jm4pJY+4OFhlYuGjpPY
	 UJu+E/2wOLnS4BWb2cpZ3CTS/DHFU/OzUYNWbw4QvHGoRzCYp7CbHzQoIHQ9EYjpbv
	 l6/FuzSITx3v0F0MgJGb79a8kZn6PPeU8AE836dlnWAJ5QkiCLRIbhkkMT2Y69yWOT
	 KD5uavsrusNoU+hWcFHRoZyg4YgpVvSiGjRHnhdqxJZPfWGJ1yQCD9uwil2QCZAWlY
	 wONU4la+Sq4gCOYUJR3RL0PYanwOnwAWZmHngqLRdPWA/y0m7Et9Hzujw1gYr8NBku
	 fzaLI54zBdYHQ==
Message-ID: <9d89b2b9-e17f-4179-8ab2-4d4779688317@kernel.org>
Date: Fri, 26 Sep 2025 00:59:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] media: iris: Add support for multiple clock sources
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <wHDGE-3W4iT6q0SbfIiC5wUXzRLx3qetMZKZtBFc5O3fvelroLvZujrLPvBSsq3OI-RmEQFBmSpCfnbXnZe6pA==@protonmail.internalid>
 <20250925-knp_video-v1-2-e323c0b3c0cd@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250925-knp_video-v1-2-e323c0b3c0cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2025 00:14, Vikash Garodia wrote:
> vpu4 comes with more than one clock sources running the hardware, so far
> it was clocked by single clock source in vpu3x and earlier. Configure
> OPP table for video device with these different video clocks, such that
> the OPP can be set to multiple clocks during dev_pm_opp_set_opp(). This
> patch extends the support for multiple clocks in driver, which would be
> used in subsequent patch for kaanapali, when the platform data is
> prepared.

You need to fix the commit log here a bit.

vpu4 depends on more than one clock source. Thus far hardware versions 
up to vpu3x have been clocked by a single source using dev_pm_opp_set_opp().

This adds support for multiple clocks by

- Adding a lookup table
- Using devm_pm_opp_set_config to set the array of clocks
- See comment below about breaking into two patches below

> 
> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>   .../media/platform/qcom/iris/iris_platform_common.h  |  1 +
>   .../media/platform/qcom/iris/iris_platform_gen2.c    |  9 +++++++++
>   .../media/platform/qcom/iris/iris_platform_sm8250.c  |  6 ++++++
>   drivers/media/platform/qcom/iris/iris_power.c        |  2 +-
>   drivers/media/platform/qcom/iris/iris_probe.c        | 20 ++++++++------------
>   drivers/media/platform/qcom/iris/iris_resources.c    | 16 ++++++++++++++--
>   drivers/media/platform/qcom/iris/iris_resources.h    |  1 +
>   drivers/media/platform/qcom/iris/iris_vpu_common.c   |  4 ++--
>   8 files changed, 42 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 58d05e0a112eed25faea027a34c719c89d6c3897..df03de08c44839c1b6c137874eb7273c638d5f2c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -206,6 +206,7 @@ struct iris_platform_data {
>   	const char * const *opp_pd_tbl;
>   	unsigned int opp_pd_tbl_size;
>   	const struct platform_clk_data *clk_tbl;
> +	const char * const *opp_clk_tbl;
>   	unsigned int clk_tbl_size;
>   	const char * const *clk_rst_tbl;
>   	unsigned int clk_rst_tbl_size;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 36d69cc73986b74534a2912524c8553970fd862e..fea800811a389a58388175c733ad31c4d9c636b0 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -633,6 +633,11 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>   	{IRIS_HW_CLK,   "vcodec0_core" },
>   };
> 
> +static const char * const sm8550_opp_clk_table[] = {
> +	"vcodec0_core",
> +	NULL,
> +};
> +
>   static struct ubwc_config_data ubwc_config_sm8550 = {
>   	.max_channels = 8,
>   	.mal_length = 32,
> @@ -756,6 +761,7 @@ struct iris_platform_data sm8550_data = {
>   	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>   	.clk_tbl = sm8550_clk_table,
>   	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> +	.opp_clk_tbl = sm8550_opp_clk_table,
>   	/* Upper bound of DMA address range */
>   	.dma_mask = 0xe0000000 - 1,
>   	.fwname = "qcom/vpu/vpu30_p4.mbn",
> @@ -848,6 +854,7 @@ struct iris_platform_data sm8650_data = {
>   	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>   	.clk_tbl = sm8550_clk_table,
>   	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> +	.opp_clk_tbl = sm8550_opp_clk_table,
>   	/* Upper bound of DMA address range */
>   	.dma_mask = 0xe0000000 - 1,
>   	.fwname = "qcom/vpu/vpu33_p4.mbn",
> @@ -930,6 +937,7 @@ struct iris_platform_data sm8750_data = {
>   	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>   	.clk_tbl = sm8750_clk_table,
>   	.clk_tbl_size = ARRAY_SIZE(sm8750_clk_table),
> +	.opp_clk_tbl = sm8550_opp_clk_table,
>   	/* Upper bound of DMA address range */
>   	.dma_mask = 0xe0000000 - 1,
>   	.fwname = "qcom/vpu/vpu35_p4.mbn",
> @@ -1017,6 +1025,7 @@ struct iris_platform_data qcs8300_data = {
>   	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>   	.clk_tbl = sm8550_clk_table,
>   	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> +	.opp_clk_tbl = sm8550_opp_clk_table,
>   	/* Upper bound of DMA address range */
>   	.dma_mask = 0xe0000000 - 1,
>   	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 16486284f8acccf6a95a27f6003e885226e28f4d..1b1b6aa751106ee0b0bc71bb0df2e78340190e66 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -273,6 +273,11 @@ static const struct platform_clk_data sm8250_clk_table[] = {
>   	{IRIS_HW_CLK,   "vcodec0_core" },
>   };
> 
> +static const char * const sm8250_opp_clk_table[] = {
> +	"vcodec0_core",
> +	NULL,
> +};
> +
>   static struct tz_cp_config tz_cp_config_sm8250 = {
>   	.cp_start = 0,
>   	.cp_size = 0x25800000,
> @@ -333,6 +338,7 @@ struct iris_platform_data sm8250_data = {
>   	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
>   	.clk_tbl = sm8250_clk_table,
>   	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
> +	.opp_clk_tbl = sm8250_opp_clk_table,
>   	/* Upper bound of DMA address range */
>   	.dma_mask = 0xe0000000 - 1,
>   	.fwname = "qcom/vpu-1.0/venus.mbn",
> diff --git a/drivers/media/platform/qcom/iris/iris_power.c b/drivers/media/platform/qcom/iris/iris_power.c
> index dbca42df0910fd3c0fb253dbfabf1afa2c3d32ad..91aa21d4070ebcebbe2ed127a03e5e49b9a2bd5c 100644
> --- a/drivers/media/platform/qcom/iris/iris_power.c
> +++ b/drivers/media/platform/qcom/iris/iris_power.c
> @@ -91,7 +91,7 @@ static int iris_set_clocks(struct iris_inst *inst)
>   	}
> 
>   	core->power.clk_freq = freq;
> -	ret = dev_pm_opp_set_rate(core->dev, freq);
> +	ret = iris_opp_set_rate(core->dev, freq);
>   	mutex_unlock(&core->lock);
> 
>   	return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 00e99be16e087c4098f930151fd76cd381d721ce..ad82a62f8b923d818ffe77c131d7eb6da8c34002 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -40,8 +40,6 @@ static int iris_init_icc(struct iris_core *core)
> 
>   static int iris_init_power_domains(struct iris_core *core)
>   {
> -	const struct platform_clk_data *clk_tbl;
> -	u32 clk_cnt, i;
>   	int ret;
> 
>   	struct dev_pm_domain_attach_data iris_pd_data = {
> @@ -56,6 +54,11 @@ static int iris_init_power_domains(struct iris_core *core)
>   		.pd_flags = PD_FLAG_DEV_LINK_ON | PD_FLAG_REQUIRED_OPP,
>   	};
> 
> +	struct dev_pm_opp_config iris_opp_clk_data = {
> +		.clk_names = core->iris_platform_data->opp_clk_tbl,
> +		.config_clks = dev_pm_opp_config_clks_simple,
> +	};
> +
>   	ret = devm_pm_domain_attach_list(core->dev, &iris_pd_data, &core->pmdomain_tbl);
>   	if (ret < 0)
>   		return ret;
> @@ -64,16 +67,9 @@ static int iris_init_power_domains(struct iris_core *core)
>   	if (ret < 0)
>   		return ret;
> 
> -	clk_tbl = core->iris_platform_data->clk_tbl;
> -	clk_cnt = core->iris_platform_data->clk_tbl_size;
> -
> -	for (i = 0; i < clk_cnt; i++) {
> -		if (clk_tbl[i].clk_type == IRIS_HW_CLK) {
> -			ret = devm_pm_opp_set_clkname(core->dev, clk_tbl[i].clk_name);
> -			if (ret)
> -				return ret;
> -		}
> -	}
> +	ret = devm_pm_opp_set_config(core->dev, &iris_opp_clk_data);
> +	if (ret)
> +		return ret;
> 
>   	return devm_pm_opp_of_add_table(core->dev);
>   }
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> index cf32f268b703c1c042a9bcf146e444fff4f4990d..939f6617f2631503fa8cb3e874b9de6b2fbe7b76 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -4,6 +4,7 @@
>    */
> 
>   #include <linux/clk.h>
> +#include <linux/devfreq.h>
>   #include <linux/interconnect.h>
>   #include <linux/pm_domain.h>
>   #include <linux/pm_opp.h>
> @@ -58,11 +59,22 @@ int iris_unset_icc_bw(struct iris_core *core)
>   	return icc_bulk_set_bw(core->icc_count, core->icc_tbl);
>   }
> 
> +int iris_opp_set_rate(struct device *dev, unsigned long freq)
> +{
> +	struct dev_pm_opp *opp __free(put_opp);
> +
> +	opp = devfreq_recommended_opp(dev, &freq, 0);
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +
> +	return dev_pm_opp_set_opp(dev, opp);
> +}
> +

I think this should be separated out from the clock setting and table 
usage into a second patch because you can end up with different clock 
frequencies here than before and being pedantic, I think that ought to 
be made explicit in the commit log.

>   int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
>   {
>   	int ret;
> 
> -	ret = dev_pm_opp_set_rate(core->dev, ULONG_MAX);
> +	ret = iris_opp_set_rate(core->dev, ULONG_MAX);
>   	if (ret)
>   		return ret;
> 
> @@ -77,7 +89,7 @@ int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
>   {
>   	int ret;
> 
> -	ret = dev_pm_opp_set_rate(core->dev, 0);
> +	ret = iris_opp_set_rate(core->dev, 0);
>   	if (ret)
>   		return ret;
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
> index f723dfe5bd81a9c9db22d53bde4e18743d771210..6bfbd2dc6db095ec05e53c894e048285f82446c6 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.h
> +++ b/drivers/media/platform/qcom/iris/iris_resources.h
> @@ -8,6 +8,7 @@
> 
>   struct iris_core;
> 
> +int iris_opp_set_rate(struct device *dev, unsigned long freq);
>   int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev);
>   int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev);
>   int iris_unset_icc_bw(struct iris_core *core);
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index bb98950e018fadf69ac4f41b3037f7fd6ac33c5b..bbd999a41236dca5cf5700e452a6fed69f4fc922 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -266,7 +266,7 @@ void iris_vpu_power_off_hw(struct iris_core *core)
> 
>   void iris_vpu_power_off(struct iris_core *core)
>   {
> -	dev_pm_opp_set_rate(core->dev, 0);
> +	iris_opp_set_rate(core->dev, 0);
>   	core->iris_platform_data->vpu_ops->power_off_hw(core);
>   	core->iris_platform_data->vpu_ops->power_off_controller(core);
>   	iris_unset_icc_bw(core);
> @@ -352,7 +352,7 @@ int iris_vpu_power_on(struct iris_core *core)
>   	freq = core->power.clk_freq ? core->power.clk_freq :
>   				      (u32)ULONG_MAX;
> 
> -	dev_pm_opp_set_rate(core->dev, freq);
> +	iris_opp_set_rate(core->dev, freq);
> 
>   	core->iris_platform_data->set_preset_registers(core);
> 
> 
> --
> 2.34.1
> 
> 

---
bod

