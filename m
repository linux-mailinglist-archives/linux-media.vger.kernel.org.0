Return-Path: <linux-media+bounces-46195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4298C2B1FD
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 11:46:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37E393B2F31
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 10:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B8F2FF655;
	Mon,  3 Nov 2025 10:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJ6dhXkg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7034A02;
	Mon,  3 Nov 2025 10:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762166760; cv=none; b=bQQRG+QX06HP5KTkRAyNOVqHdT062hW0nOSf4gIs9SkVByKqfAI0qP0qN0neUtxVYImEifo51RG+l3ag3bqKWFivq2Zz83MtbeS7IrBBBUjcIOcCZkkRx+LM9On7fNehWedf4IXf70N/mMV5UbTNIt4yrwcxfAlv3ZHEjECQOs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762166760; c=relaxed/simple;
	bh=hI0X2673AvhNQGtOh35dP4XdGyb5JTrqdTGR0wX+s+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lOfQ2iwvecczUsELP2D/UitB0A18tycrpzdLuVIa/cWxw3TbQPAVMHRFkkMC5KPT+BjXwnpAzOJDULoWIRni/wPgWz3dsBcTqjFyT9NsDOwPXX/cnvQsTrgQK6r9lnV4QYn4gDnLRTzFYwHqAukEoudXV5eAhyApc59n6ay0cpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJ6dhXkg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6702FC4CEE7;
	Mon,  3 Nov 2025 10:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762166758;
	bh=hI0X2673AvhNQGtOh35dP4XdGyb5JTrqdTGR0wX+s+4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YJ6dhXkgwrGcuxoc/7cshGUkK3g0ezw/P0VXS6FYq7SKCiYcYED9/ioEdCMNbob1w
	 PLqe5pCoKWrSjrf2t5LIonyKLE6978obB6ZGhATp3raFZ8nZQH5RVynd3OiajYEf5g
	 dQdXLs+LETl8Eots7BoAmRlc/ysWv+PH2c04POlkIGcqSkjNjbtRHmCpcbu6jbuFIU
	 X/qaIT/qkAnXFr/fokRku5e8b0kdt53sTc6HyVeeNtJsj8cB8VW6iKzjwYSKDeqLxs
	 93pItCw5gZD//8DC2Bbhp3OU77odOinuCxyxznMf90QSyTPtDLWmujhDpjTOZPKwdg
	 6usge1SKQQ2jg==
Message-ID: <e13632e8-e845-41e7-a423-299f987ca73d@kernel.org>
Date: Mon, 3 Nov 2025 10:45:54 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: qcom: camss: Add support for regulator
 init_load_uA in CSIPHY
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org,
 vladimir.zapolskiy@linaro.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <IuFM40eMljHXycV-ScfwhLDKad31Nxa584Rqcfej5infS4sstQsB4cOhwYnnBB6TkJzon7ryQip1xCRGvhtfJA==@protonmail.internalid>
 <20250912103631.1184-1-wenmeng.liu@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250912103631.1184-1-wenmeng.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/09/2025 11:36, Wenmeng Liu wrote:
> Some Qualcomm regulators are configured with initial mode as
> HPM (High Power Mode), which may lead to higher power consumption.
> To reduce power usage, it's preferable to set the initial mode
> to LPM (Low Power Mode).
> 
> To ensure the regulator can switch from LPM to HPM when needed,
> this patch adds current load configuration for CAMSS CSIPHY.
> This allows the regulator framework to scale the mode dynamically
> based on the load requirement.
> 
> The current default value for current is uninitialized or random.
> To address this, initial current values are added for the
> following platforms:
> MSM8916, MSM8953, MSM8996, QCM2290, SDM670, SM8250, SC7280, SM8550
> QCS8300, SA8775P and X1E80100.
> 
> For SDM660, SDM845, SC8280XP the value is set to 0,
> indicating that no default current value is configured,
> the other values are derived from the power grid.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> 
> ---
> Changes in v3:
> - Use devm_regulator_bulk_get_const instead of devm_regulator_bulk_get.
> - Set the default current value to 0.
> - Refactor the code to minimize data copying, and support more platform-specific values.
> - Link to v2: https://lore.kernel.org/all/20250729-camss_csiphy_current-v2-1-da3c72a2055c@quicinc.com/
> 
> Changes in v2:
> - Change the source of the current value from DTS to CAMSS resource
> - Link to v1: https://lore.kernel.org/all/20250620040736.3032667-1-quic_wenmliu@quicinc.com/
> ---
>   .../media/platform/qcom/camss/camss-csid.c    |  18 +-
>   .../media/platform/qcom/camss/camss-csiphy.c  |  19 +-
>   drivers/media/platform/qcom/camss/camss.c     | 290 ++++++++++++++----
>   drivers/media/platform/qcom/camss/camss.h     |   2 +-
>   4 files changed, 235 insertions(+), 94 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 5284b5857368..ed1820488c98 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1187,24 +1187,12 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
> 
>   	/* Regulator */
>   	for (i = 0; i < ARRAY_SIZE(res->regulators); i++) {
> -		if (res->regulators[i])
> +		if (res->regulators[i].supply)
>   			csid->num_supplies++;
>   	}
> 
> -	if (csid->num_supplies) {
> -		csid->supplies = devm_kmalloc_array(camss->dev,
> -						    csid->num_supplies,
> -						    sizeof(*csid->supplies),
> -						    GFP_KERNEL);
> -		if (!csid->supplies)
> -			return -ENOMEM;
> -	}
> -
> -	for (i = 0; i < csid->num_supplies; i++)
> -		csid->supplies[i].supply = res->regulators[i];
> -
> -	ret = devm_regulator_bulk_get(camss->dev, csid->num_supplies,
> -				      csid->supplies);
> +	ret = devm_regulator_bulk_get_const(camss->dev, csid->num_supplies,
> +					    res->regulators, &csid->supplies);
>   	if (ret)
>   		return ret;
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 2de97f58f9ae..390427c163de 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -694,24 +694,13 @@ int msm_csiphy_subdev_init(struct camss *camss,
> 
>   	/* CSIPHY supplies */
>   	for (i = 0; i < ARRAY_SIZE(res->regulators); i++) {
> -		if (res->regulators[i])
> +		if (res->regulators[i].supply)
>   			csiphy->num_supplies++;
>   	}
> 
> -	if (csiphy->num_supplies) {
> -		csiphy->supplies = devm_kmalloc_array(camss->dev,
> -						      csiphy->num_supplies,
> -						      sizeof(*csiphy->supplies),
> -						      GFP_KERNEL);
> -		if (!csiphy->supplies)
> -			return -ENOMEM;
> -	}
> -
> -	for (i = 0; i < csiphy->num_supplies; i++)
> -		csiphy->supplies[i].supply = res->regulators[i];
> -
> -	ret = devm_regulator_bulk_get(camss->dev, csiphy->num_supplies,
> -				      csiphy->supplies);
> +	if (csiphy->num_supplies > 0)
> +		ret = devm_regulator_bulk_get_const(camss->dev, csiphy->num_supplies,
> +						    res->regulators, &csiphy->supplies);
>   	return ret;
>   }
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2fbcd0e343aa..43e4bc5a91be 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -73,7 +73,9 @@ static const struct camss_subdev_resources csiphy_res_8x16[] = {
>   static const struct camss_subdev_resources csid_res_8x16[] = {
>   	/* CSID0 */
>   	{
> -		.regulators = { "vdda" },
> +		.regulators = {
> +			{ .supply = "vdda", .init_load_uA = 40000 }
> +		},
>   		.clock = { "top_ahb", "ispif_ahb", "csi0_ahb", "ahb",
>   			   "csi0", "csi0_phy", "csi0_pix", "csi0_rdi" },
>   		.clock_rate = { { 0 },
> @@ -95,7 +97,9 @@ static const struct camss_subdev_resources csid_res_8x16[] = {
> 
>   	/* CSID1 */
>   	{
> -		.regulators = { "vdda" },
> +		.regulators = {
> +			{ .supply = "vdda", .init_load_uA = 40000 }
> +		},
>   		.clock = { "top_ahb", "ispif_ahb", "csi1_ahb", "ahb",
>   			   "csi1", "csi1_phy", "csi1_pix", "csi1_rdi" },
>   		.clock_rate = { { 0 },
> @@ -157,7 +161,9 @@ static const struct camss_subdev_resources vfe_res_8x16[] = {
>   static const struct camss_subdev_resources csid_res_8x53[] = {
>   	/* CSID0 */
>   	{
> -		.regulators = { "vdda" },
> +		.regulators = {
> +			{ .supply = "vdda", .init_load_uA = 9900 }
> +		},
>   		.clock = { "top_ahb", "ispif_ahb", "csi0_ahb", "ahb",
>   			   "csi0", "csi0_phy", "csi0_pix", "csi0_rdi" },
>   		.clock_rate = { { 0 },
> @@ -180,7 +186,9 @@ static const struct camss_subdev_resources csid_res_8x53[] = {
> 
>   	/* CSID1 */
>   	{
> -		.regulators = { "vdda" },
> +		.regulators = {
> +			{ .supply = "vdda", .init_load_uA = 9900 }
> +		},
>   		.clock = { "top_ahb", "ispif_ahb", "csi1_ahb", "ahb",
>   			   "csi1", "csi1_phy", "csi1_pix", "csi1_rdi" },
>   		.clock_rate = { { 0 },
> @@ -203,7 +211,9 @@ static const struct camss_subdev_resources csid_res_8x53[] = {
> 
>   	/* CSID2 */
>   	{
> -		.regulators = { "vdda" },
> +		.regulators = {
> +			{ .supply = "vdda", .init_load_uA = 9900 }
> +		},
>   		.clock = { "top_ahb", "ispif_ahb", "csi2_ahb", "ahb",
>   			   "csi2", "csi2_phy", "csi2_pix", "csi2_rdi" },
>   		.clock_rate = { { 0 },
> @@ -364,7 +374,9 @@ static const struct camss_subdev_resources csiphy_res_8x96[] = {
>   static const struct camss_subdev_resources csid_res_8x96[] = {
>   	/* CSID0 */
>   	{
> -		.regulators = { "vdda" },
> +		.regulators = {
> +			{ .supply = "vdda", .init_load_uA = 80160 }
> +		},
>   		.clock = { "top_ahb", "ispif_ahb", "csi0_ahb", "ahb",
>   			   "csi0", "csi0_phy", "csi0_pix", "csi0_rdi" },
>   		.clock_rate = { { 0 },
> @@ -386,7 +398,9 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
> 
>   	/* CSID1 */
>   	{
> -		.regulators = { "vdda" },
> +		.regulators = {
> +			{ .supply = "vdda", .init_load_uA = 80160 }
> +		},
>   		.clock = { "top_ahb", "ispif_ahb", "csi1_ahb", "ahb",
>   			   "csi1", "csi1_phy", "csi1_pix", "csi1_rdi" },
>   		.clock_rate = { { 0 },
> @@ -408,7 +422,9 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
> 
>   	/* CSID2 */
>   	{
> -		.regulators = { "vdda" },
> +		.regulators = {
> +			{ .supply = "vdda", .init_load_uA = 80160 }
> +		},
>   		.clock = { "top_ahb", "ispif_ahb", "csi2_ahb", "ahb",
>   			   "csi2", "csi2_phy", "csi2_pix", "csi2_rdi" },
>   		.clock_rate = { { 0 },
> @@ -430,7 +446,9 @@ static const struct camss_subdev_resources csid_res_8x96[] = {
> 
>   	/* CSID3 */
>   	{
> -		.regulators = { "vdda" },
> +		.regulators = {
> +			{ .supply = "vdda", .init_load_uA = 80160 }
> +		},
>   		.clock = { "top_ahb", "ispif_ahb", "csi3_ahb", "ahb",
>   			   "csi3", "csi3_phy", "csi3_pix", "csi3_rdi" },
>   		.clock_rate = { { 0 },
> @@ -518,7 +536,10 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
>   static const struct camss_subdev_resources csiphy_res_2290[] = {
>   	/* CSIPHY0 */
>   	{
> -		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
> +		.regulators = {
> +			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 26700 },
> +			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 2600 }
> +		},
>   		.clock = { "top_ahb", "ahb", "csiphy0", "csiphy0_timer" },
>   		.clock_rate = { { 0 },
>   				{ 0 },
> @@ -535,7 +556,10 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
> 
>   	/* CSIPHY1 */
>   	{
> -		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
> +		.regulators = {
> +			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 26700 },
> +			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 2600 }
> +		},
>   		.clock = { "top_ahb", "ahb", "csiphy1", "csiphy1_timer" },
>   		.clock_rate = { { 0 },
>   				{ 0 },
> @@ -711,7 +735,10 @@ static const struct camss_subdev_resources csiphy_res_660[] = {
>   static const struct camss_subdev_resources csid_res_660[] = {
>   	/* CSID0 */
>   	{
> -		.regulators = { "vdda", "vdd_sec" },
> +		.regulators = {
> +			{ .supply = "vdda", .init_load_uA = 0 },
> +			{ .supply = "vdd_sec", .init_load_uA = 0 }
> +		},
>   		.clock = { "top_ahb", "ispif_ahb", "csi0_ahb", "ahb",
>   			   "csi0", "csi0_phy", "csi0_pix", "csi0_rdi",
>   			   "cphy_csid0" },
> @@ -736,7 +763,10 @@ static const struct camss_subdev_resources csid_res_660[] = {
> 
>   	/* CSID1 */
>   	{
> -		.regulators = { "vdda", "vdd_sec" },
> +		.regulators = {
> +			{ .supply = "vdda", .init_load_uA = 0 },
> +			{ .supply = "vdd_sec", .init_load_uA = 0 }
> +		},
>   		.clock = { "top_ahb", "ispif_ahb", "csi1_ahb", "ahb",
>   			   "csi1", "csi1_phy", "csi1_pix", "csi1_rdi",
>   			   "cphy_csid1" },
> @@ -761,7 +791,10 @@ static const struct camss_subdev_resources csid_res_660[] = {
> 
>   	/* CSID2 */
>   	{
> -		.regulators = { "vdda", "vdd_sec" },
> +		.regulators = {
> +			{ .supply = "vdda", .init_load_uA = 0 },
> +			{ .supply = "vdd_sec", .init_load_uA = 0 }
> +		},
>   		.clock = { "top_ahb", "ispif_ahb", "csi2_ahb", "ahb",
>   			   "csi2", "csi2_phy", "csi2_pix", "csi2_rdi",
>   			   "cphy_csid2" },
> @@ -786,7 +819,10 @@ static const struct camss_subdev_resources csid_res_660[] = {
> 
>   	/* CSID3 */
>   	{
> -		.regulators = { "vdda", "vdd_sec" },
> +		.regulators = {
> +			{ .supply = "vdda", .init_load_uA = 0 },
> +			{ .supply = "vdd_sec", .init_load_uA = 0 }
> +		},
>   		.clock = { "top_ahb", "ispif_ahb", "csi3_ahb", "ahb",
>   			   "csi3", "csi3_phy", "csi3_pix", "csi3_rdi",
>   			   "cphy_csid3" },
> @@ -883,7 +919,10 @@ static const struct camss_subdev_resources vfe_res_660[] = {
>   static const struct camss_subdev_resources csiphy_res_670[] = {
>   	/* CSIPHY0 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 42800 },
> +			{ .supply = "vdda-pll", .init_load_uA = 13900 }
> +		},
>   		.clock = { "soc_ahb", "cpas_ahb",
>   			   "csiphy0", "csiphy0_timer" },
>   		.clock_rate = { { 0 },
> @@ -901,7 +940,10 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
> 
>   	/* CSIPHY1 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 42800 },
> +			{ .supply = "vdda-pll", .init_load_uA = 13900 }
> +		},
>   		.clock = { "soc_ahb", "cpas_ahb",
>   			   "csiphy1", "csiphy1_timer" },
>   		.clock_rate = { { 0 },
> @@ -919,7 +961,10 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
> 
>   	/* CSIPHY2 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 42800 },
> +			{ .supply = "vdda-pll", .init_load_uA = 13900 }
> +		},
>   		.clock = { "soc_ahb", "cpas_ahb",
>   			   "csiphy2", "csiphy2_timer" },
>   		.clock_rate = { { 0 },
> @@ -1159,7 +1204,10 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
>   static const struct camss_subdev_resources csid_res_845[] = {
>   	/* CSID0 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 0 },
> +			{ .supply = "vdda-pll", .init_load_uA = 0 }
> +		},
>   		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
>   				"soc_ahb", "vfe0", "vfe0_src",
>   				"vfe0_cphy_rx", "csi0",
> @@ -1184,7 +1232,10 @@ static const struct camss_subdev_resources csid_res_845[] = {
> 
>   	/* CSID1 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 0 },
> +			{ .supply = "vdda-pll", .init_load_uA = 0 }
> +		},
>   		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
>   				"soc_ahb", "vfe1", "vfe1_src",
>   				"vfe1_cphy_rx", "csi1",
> @@ -1209,7 +1260,10 @@ static const struct camss_subdev_resources csid_res_845[] = {
> 
>   	/* CSID2 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 0 },
> +			{ .supply = "vdda-pll", .init_load_uA = 0 }
> +		},
>   		.clock = { "cpas_ahb", "cphy_rx_src", "slow_ahb_src",
>   				"soc_ahb", "vfe_lite", "vfe_lite_src",
>   				"vfe_lite_cphy_rx", "csi2",
> @@ -1321,7 +1375,10 @@ static const struct camss_subdev_resources vfe_res_845[] = {
>   static const struct camss_subdev_resources csiphy_res_8250[] = {
>   	/* CSIPHY0 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 17500 },
> +			{ .supply = "vdda-pll", .init_load_uA = 10000 }
> +		},
>   		.clock = { "csiphy0", "csiphy0_timer" },
>   		.clock_rate = { { 400000000 },
>   				{ 300000000 } },
> @@ -1335,7 +1392,10 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
>   	},
>   	/* CSIPHY1 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 17500 },
> +			{ .supply = "vdda-pll", .init_load_uA = 10000 }
> +		},
>   		.clock = { "csiphy1", "csiphy1_timer" },
>   		.clock_rate = { { 400000000 },
>   				{ 300000000 } },
> @@ -1349,7 +1409,10 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
>   	},
>   	/* CSIPHY2 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 17500 },
> +			{ .supply = "vdda-pll", .init_load_uA = 10000 }
> +		},
>   		.clock = { "csiphy2", "csiphy2_timer" },
>   		.clock_rate = { { 400000000 },
>   				{ 300000000 } },
> @@ -1363,7 +1426,10 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
>   	},
>   	/* CSIPHY3 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 17500 },
> +			{ .supply = "vdda-pll", .init_load_uA = 10000 }
> +		},
>   		.clock = { "csiphy3", "csiphy3_timer" },
>   		.clock_rate = { { 400000000 },
>   				{ 300000000 } },
> @@ -1377,7 +1443,10 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
>   	},
>   	/* CSIPHY4 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 17500 },
> +			{ .supply = "vdda-pll", .init_load_uA = 10000 }
> +		},
>   		.clock = { "csiphy4", "csiphy4_timer" },
>   		.clock_rate = { { 400000000 },
>   				{ 300000000 } },
> @@ -1391,7 +1460,10 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
>   	},
>   	/* CSIPHY5 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 17500 },
> +			{ .supply = "vdda-pll", .init_load_uA = 10000 }
> +		},
>   		.clock = { "csiphy5", "csiphy5_timer" },
>   		.clock_rate = { { 400000000 },
>   				{ 300000000 } },
> @@ -1605,7 +1677,10 @@ static const struct resources_icc icc_res_sm8250[] = {
>   static const struct camss_subdev_resources csiphy_res_7280[] = {
>   	/* CSIPHY0 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 16100 },
> +			{ .supply = "vdda-pll", .init_load_uA = 9000 }
> +		},
> 
>   		.clock = { "csiphy0", "csiphy0_timer" },
>   		.clock_rate = { { 300000000, 400000000 },
> @@ -1620,7 +1695,10 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>   	},
>   	/* CSIPHY1 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 16100 },
> +			{ .supply = "vdda-pll", .init_load_uA = 9000 }
> +		},
> 
>   		.clock = { "csiphy1", "csiphy1_timer" },
>   		.clock_rate = { { 300000000, 400000000 },
> @@ -1635,7 +1713,10 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>   	},
>   	/* CSIPHY2 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 16100 },
> +			{ .supply = "vdda-pll", .init_load_uA = 9000 }
> +		},
> 
>   		.clock = { "csiphy2", "csiphy2_timer" },
>   		.clock_rate = { { 300000000, 400000000 },
> @@ -1650,7 +1731,10 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>   	},
>   	/* CSIPHY3 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 16100 },
> +			{ .supply = "vdda-pll", .init_load_uA = 9000 }
> +		},
> 
>   		.clock = { "csiphy3", "csiphy3_timer" },
>   		.clock_rate = { { 300000000, 400000000 },
> @@ -1665,7 +1749,10 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>   	},
>   	/* CSIPHY4 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 16100 },
> +			{ .supply = "vdda-pll", .init_load_uA = 9000 }
> +		},
> 
>   		.clock = { "csiphy4", "csiphy4_timer" },
>   		.clock_rate = { { 300000000, 400000000 },
> @@ -1978,7 +2065,10 @@ static const struct camss_subdev_resources csiphy_res_sc8280xp[] = {
>   static const struct camss_subdev_resources csid_res_sc8280xp[] = {
>   	/* CSID0 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 0 },
> +			{ .supply = "vdda-pll", .init_load_uA = 0 }
> +		},
>   		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_axi" },
>   		.clock_rate = { { 400000000, 480000000, 600000000 },
>   				{ 0 },
> @@ -1994,7 +2084,10 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
>   	},
>   	/* CSID1 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 0 },
> +			{ .supply = "vdda-pll", .init_load_uA = 0 }
> +		},
>   		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_axi" },
>   		.clock_rate = { { 400000000, 480000000, 600000000 },
>   				{ 0 },
> @@ -2010,7 +2103,10 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
>   	},
>   	/* CSID2 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 0 },
> +			{ .supply = "vdda-pll", .init_load_uA = 0 }
> +		},
>   		.clock = { "vfe2_csid", "vfe2_cphy_rx", "vfe2", "vfe2_axi" },
>   		.clock_rate = { { 400000000, 480000000, 600000000 },
>   				{ 0 },
> @@ -2026,7 +2122,10 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
>   	},
>   	/* CSID3 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 0 },
> +			{ .supply = "vdda-pll", .init_load_uA = 0 }
> +		},
>   		.clock = { "vfe3_csid", "vfe3_cphy_rx", "vfe3", "vfe3_axi" },
>   		.clock_rate = { { 400000000, 480000000, 600000000 },
>   				{ 0 },
> @@ -2042,7 +2141,10 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
>   	},
>   	/* CSID_LITE0 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 0 },
> +			{ .supply = "vdda-pll", .init_load_uA = 0 }
> +		},
>   		.clock = { "vfe_lite0_csid", "vfe_lite0_cphy_rx", "vfe_lite0" },
>   		.clock_rate = { { 400000000, 480000000, 600000000 },
>   				{ 0 },
> @@ -2058,7 +2160,10 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
>   	},
>   	/* CSID_LITE1 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 0 },
> +			{ .supply = "vdda-pll", .init_load_uA = 0 }
> +		},
>   		.clock = { "vfe_lite1_csid", "vfe_lite1_cphy_rx", "vfe_lite1" },
>   		.clock_rate = { { 400000000, 480000000, 600000000 },
>   				{ 0 },
> @@ -2074,7 +2179,10 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
>   	},
>   	/* CSID_LITE2 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 0 },
> +			{ .supply = "vdda-pll", .init_load_uA = 0 }
> +		},
>   		.clock = { "vfe_lite2_csid", "vfe_lite2_cphy_rx", "vfe_lite2" },
>   		.clock_rate = { { 400000000, 480000000, 600000000 },
>   				{ 0 },
> @@ -2090,7 +2198,10 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
>   	},
>   	/* CSID_LITE3 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 0 },
> +			{ .supply = "vdda-pll", .init_load_uA = 0 }
> +		},
>   		.clock = { "vfe_lite3_csid", "vfe_lite3_cphy_rx", "vfe_lite3" },
>   		.clock_rate = { { 400000000, 480000000, 600000000 },
>   				{ 0 },
> @@ -2291,7 +2402,10 @@ static const struct resources_icc icc_res_sc8280xp[] = {
>   static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	/* CSIPHY0 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 32200 },
> +			{ .supply = "vdda-pll", .init_load_uA = 18000 }
> +		},
>   		.clock = { "csiphy0", "csiphy0_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2305,7 +2419,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	},
>   	/* CSIPHY1 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 32200 },
> +			{ .supply = "vdda-pll", .init_load_uA = 18000 }
> +		},
>   		.clock = { "csiphy1", "csiphy1_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2319,7 +2436,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	},
>   	/* CSIPHY2 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 32200 },
> +			{ .supply = "vdda-pll", .init_load_uA = 18000 }
> +		},
>   		.clock = { "csiphy2", "csiphy2_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2333,7 +2453,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	},
>   	/* CSIPHY3 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 32200 },
> +			{ .supply = "vdda-pll", .init_load_uA = 18000 }
> +		},
>   		.clock = { "csiphy3", "csiphy3_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2347,7 +2470,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	},
>   	/* CSIPHY4 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 37900 },
> +			{ .supply = "vdda-pll", .init_load_uA = 18600 }
> +		},
>   		.clock = { "csiphy4", "csiphy4_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2361,7 +2487,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	},
>   	/* CSIPHY5 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 32200 },
> +			{ .supply = "vdda-pll", .init_load_uA = 18000 }
> +		},
>   		.clock = { "csiphy5", "csiphy5_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2375,7 +2504,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	},
>   	/* CSIPHY6 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 37900 },
> +			{ .supply = "vdda-pll", .init_load_uA = 18600 }
> +		},
>   		.clock = { "csiphy6", "csiphy6_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2389,7 +2521,10 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
>   	},
>   	/* CSIPHY7 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 32200 },
> +			{ .supply = "vdda-pll", .init_load_uA = 18000 }
> +		},
>   		.clock = { "csiphy7", "csiphy7_timer" },
>   		.clock_rate = { { 400000000, 480000000 },
>   				{ 400000000 } },
> @@ -2620,7 +2755,10 @@ static const struct resources_icc icc_res_sm8550[] = {
>   static const struct camss_subdev_resources csiphy_res_8300[] = {
>   	/* CSIPHY0 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 15900 },
> +			{ .supply = "vdda-pll", .init_load_uA = 8900 }
> +		},
> 
>   		.clock = { "csiphy_rx", "csiphy0", "csiphy0_timer" },
>   		.clock_rate = {
> @@ -2638,7 +2776,10 @@ static const struct camss_subdev_resources csiphy_res_8300[] = {
>   	},
>   	/* CSIPHY1 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 15900 },
> +			{ .supply = "vdda-pll", .init_load_uA = 8900 }
> +		},
> 
>   		.clock = { "csiphy_rx", "csiphy1", "csiphy1_timer" },
>   		.clock_rate = {
> @@ -2656,7 +2797,10 @@ static const struct camss_subdev_resources csiphy_res_8300[] = {
>   	},
>   	/* CSIPHY2 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 15900 },
> +			{ .supply = "vdda-pll", .init_load_uA = 8900 }
> +		},
> 
>   		.clock = { "csiphy_rx", "csiphy2", "csiphy2_timer" },
>   		.clock_rate = {
> @@ -2677,7 +2821,10 @@ static const struct camss_subdev_resources csiphy_res_8300[] = {
>   static const struct camss_subdev_resources csiphy_res_8775p[] = {
>   	/* CSIPHY0 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 15900 },
> +			{ .supply = "vdda-pll", .init_load_uA = 8900 }
> +		},
>   		.clock = { "csiphy_rx", "csiphy0", "csiphy0_timer"},
>   		.clock_rate = {
>   			{ 400000000 },
> @@ -2694,7 +2841,10 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
>   	},
>   	/* CSIPHY1 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 15900 },
> +			{ .supply = "vdda-pll", .init_load_uA = 8900 }
> +		},
>   		.clock = { "csiphy_rx", "csiphy1", "csiphy1_timer"},
>   		.clock_rate = {
>   			{ 400000000 },
> @@ -2711,7 +2861,10 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
>   	},
>   	/* CSIPHY2 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 15900 },
> +			{ .supply = "vdda-pll", .init_load_uA = 8900 }
> +		},
>   		.clock = { "csiphy_rx", "csiphy2", "csiphy2_timer"},
>   		.clock_rate = {
>   			{ 400000000 },
> @@ -2728,7 +2881,10 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
>   	},
>   	/* CSIPHY3 */
>   	{
> -		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators = {
> +			{ .supply = "vdda-phy", .init_load_uA = 15900 },
> +			{ .supply = "vdda-pll", .init_load_uA = 8900 }
> +		},
>   		.clock = { "csiphy_rx", "csiphy3", "csiphy3_timer"},
>   		.clock_rate = {
>   			{ 400000000 },
> @@ -3081,8 +3237,10 @@ static const struct resources_icc icc_res_sa8775p[] = {
>   static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>   	/* CSIPHY0 */
>   	{
> -		.regulators = { "vdd-csiphy-0p8",
> -				"vdd-csiphy-1p2" },
> +		.regulators = {
> +			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
> +			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
> +		},
>   		.clock = { "csiphy0", "csiphy0_timer" },
>   		.clock_rate = { { 300000000, 400000000, 480000000 },
>   				{ 266666667, 400000000 } },
> @@ -3096,8 +3254,10 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>   	},
>   	/* CSIPHY1 */
>   	{
> -		.regulators = { "vdd-csiphy-0p8",
> -				"vdd-csiphy-1p2" },
> +		.regulators = {
> +			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
> +			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
> +		},
>   		.clock = { "csiphy1", "csiphy1_timer" },
>   		.clock_rate = { { 300000000, 400000000, 480000000 },
>   				{ 266666667, 400000000 } },
> @@ -3111,8 +3271,10 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>   	},
>   	/* CSIPHY2 */
>   	{
> -		.regulators = { "vdd-csiphy-0p8",
> -				"vdd-csiphy-1p2" },
> +		.regulators = {
> +			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
> +			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
> +		},
>   		.clock = { "csiphy2", "csiphy2_timer" },
>   		.clock_rate = { { 300000000, 400000000, 480000000 },
>   				{ 266666667, 400000000 } },
> @@ -3126,8 +3288,10 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>   	},
>   	/* CSIPHY4 */
>   	{
> -		.regulators = { "vdd-csiphy-0p8",
> -				"vdd-csiphy-1p2" },
> +		.regulators = {
> +			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
> +			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
> +		},
>   		.clock = { "csiphy4", "csiphy4_timer" },
>   		.clock_rate = { { 300000000, 400000000, 480000000 },
>   				{ 266666667, 400000000 } },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index a70fbc78ccc3..3d5095158338 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -43,7 +43,7 @@
>   #define CAMSS_RES_MAX 17
> 
>   struct camss_subdev_resources {
> -	char *regulators[CAMSS_RES_MAX];
> +	struct regulator_bulk_data regulators[CAMSS_RES_MAX];
>   	char *clock[CAMSS_RES_MAX];
>   	char *clock_for_reset[CAMSS_RES_MAX];
>   	u32 clock_rate[CAMSS_RES_MAX][CAMSS_RES_MAX];
> --
> 2.34.1
> 
> 

Wenmeng.

Could you do a v4 of this patch please add add

- MSM8939
- SM8650

to the list of init_load_uA currents ?

https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/tree/next-6.19?ref_type=heads

Rather than gate the two above SoCs I think it is more appropriate to 
apply those patches and re-up this.

---
bod

