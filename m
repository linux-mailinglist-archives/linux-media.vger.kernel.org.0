Return-Path: <linux-media+bounces-43231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A5691BA2198
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 02:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFA017BB21C
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 00:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C95F187346;
	Fri, 26 Sep 2025 00:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gfzTqU9N"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962CBCA4B;
	Fri, 26 Sep 2025 00:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758846623; cv=none; b=lnHQxm7QuHnx2TIpkhE3CpRmqtofDhkXx2GhfW1WTCLUiN6Sn6PORd9moaE+Pzs1OvLINkZ2q6woMjzbRLfh/95JqcJlNeVlZ8PU/0f8mDCubVV15OVjpw4AJwaeYeTGPEJy4N3HQPxxZfFIJeXQi1SQVjIdlz5vIGDaS+ygEUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758846623; c=relaxed/simple;
	bh=QiT9ld4eRxquNPyLrOBHfKjUMXb/3yIz58xan193aJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AYvF5WScu7HiP/uI+4ZdmBOnh/Gs0b42IuVrXLCX9FnYSSNzHUcwqZqQkIKltjFblUG8l5RmNDHz1AkM2xY+EO3lZYrgzPQJ9syPVmgEhcRudhd5rzxexSN26NES7jpqSxRxpoh0/kCFU1y05zaPm7YeQzZxItWoYxXhHmF18Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfzTqU9N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40DB6C4CEF5;
	Fri, 26 Sep 2025 00:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758846623;
	bh=QiT9ld4eRxquNPyLrOBHfKjUMXb/3yIz58xan193aJE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gfzTqU9N4lZfc7IT1AdVvj6ZAz1dWsfrFXAKfEabRjcSddUlgEQNZPpamSXqRhh7v
	 4Xdzr4LfJGKmo3eaYV6IunHQnb0irE6iocZvXSWBD4DOdEgVlwUByn5zPCxN/Tk4SY
	 DoTaknHQJ2yESK11w8si1mm08J0y9nRJubdMrOIk2Ne92hJwbo8BdA4nAW8mnTArVj
	 ekF3jyO8+hJKXlgYLXvwnqk68x8l8lRkhCyZow8l9I42Jwx+TVoW4aAV3KgfN6Ey0G
	 dLiA3i6CQ3tmdWnlGohG4/1fGYnSzr+LnI7ReeY6zL79oUY0NL/TllPjOvsz5jXEzV
	 OG3RGKu9l24BA==
Message-ID: <e30e9106-b566-4405-aa92-fcdf6c6bcfad@kernel.org>
Date: Fri, 26 Sep 2025 01:30:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: iris: Add support for multiple TZ CP configs
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
 <jOycHYu8RfViyDZ9QdoBZIXrVPRt3LaNZ6_PpUCRVJuili4LnunkJDQOHNYRkyfxk-ke96ex7GDxgOlue4hPUA==@protonmail.internalid>
 <20250925-knp_video-v1-3-e323c0b3c0cd@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250925-knp_video-v1-3-e323c0b3c0cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2025 00:14, Vikash Garodia wrote:
> vpu4 needs an additional configuration w.r.t CP regions. Make the CP

"with-respect-to" and please define CP once and then use the 
abbreviation liberally.
> configuration as array such that the multiple configuration can be
> managed per platform.
> 
> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_firmware.c   | 23 ++++++++++++---------
>   .../platform/qcom/iris/iris_platform_common.h      |  3 ++-
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 24 ++++++++++++++--------
>   .../platform/qcom/iris/iris_platform_sm8250.c      | 15 ++++++++------
>   4 files changed, 39 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 9ab499fad946446a87036720f49c9c8d311f3060..ad65c419e4416d0531d4c3deb04c22d44b29e500 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -70,9 +70,9 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> 
>   int iris_fw_load(struct iris_core *core)
>   {
> -	struct tz_cp_config *cp_config = core->iris_platform_data->tz_cp_config_data;
> +	const struct tz_cp_config *cp_config;
>   	const char *fwpath = NULL;
> -	int ret;
> +	int i, ret;
> 
>   	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
>   					    &fwpath);
> @@ -91,14 +91,17 @@ int iris_fw_load(struct iris_core *core)
>   		return ret;
>   	}
> 
> -	ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
> -					     cp_config->cp_size,
> -					     cp_config->cp_nonpixel_start,
> -					     cp_config->cp_nonpixel_size);
> -	if (ret) {
> -		dev_err(core->dev, "protect memory failed\n");
> -		qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> -		return ret;
> +	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
> +		cp_config = &core->iris_platform_data->tz_cp_config_data[i];
> +		ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
> +						     cp_config->cp_size,
> +						     cp_config->cp_nonpixel_start,
> +						     cp_config->cp_nonpixel_size);
> +		if (ret) {
> +			dev_err(core->dev, "protect memory failed\n");

I think this error message could be better -> 
"qcom_scm_mem_protect_video_var()=%d" or err string.

Its not super-important just an observation.

> +			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +			return ret;
> +		}
>   	}
> 
>   	return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index df03de08c44839c1b6c137874eb7273c638d5f2c..ae49e95ba2252fc1442f7c81d8010dbfd86da0da 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -220,7 +220,8 @@ struct iris_platform_data {
>   	u32 inst_fw_caps_dec_size;
>   	struct platform_inst_fw_cap *inst_fw_caps_enc;
>   	u32 inst_fw_caps_enc_size;
> -	struct tz_cp_config *tz_cp_config_data;
> +	const struct tz_cp_config *tz_cp_config_data;
> +	u32 tz_cp_config_data_size;
>   	u32 core_arch;
>   	u32 hw_response_timeout;
>   	struct ubwc_config_data *ubwc_config;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index fea800811a389a58388175c733ad31c4d9c636b0..00c6b9021b98aac80612b1bb9734c8dac8146bd9 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -648,11 +648,13 @@ static struct ubwc_config_data ubwc_config_sm8550 = {
>   	.bank_spreading = 1,
>   };
> 
> -static struct tz_cp_config tz_cp_config_sm8550 = {
> -	.cp_start = 0,
> -	.cp_size = 0x25800000,
> -	.cp_nonpixel_start = 0x01000000,
> -	.cp_nonpixel_size = 0x24800000,
> +static const struct tz_cp_config tz_cp_config_sm8550[] = {
> +	{
> +		.cp_start = 0,
> +		.cp_size = 0x25800000,
> +		.cp_nonpixel_start = 0x01000000,
> +		.cp_nonpixel_size = 0x24800000,
> +	},
>   };
> 
>   static const u32 sm8550_vdec_input_config_params_default[] = {
> @@ -771,7 +773,8 @@ struct iris_platform_data sm8550_data = {
>   	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
>   	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
>   	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
> -	.tz_cp_config_data = &tz_cp_config_sm8550,
> +	.tz_cp_config_data = tz_cp_config_sm8550,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
>   	.core_arch = VIDEO_ARCH_LX,
>   	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>   	.ubwc_config = &ubwc_config_sm8550,
> @@ -864,7 +867,8 @@ struct iris_platform_data sm8650_data = {
>   	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
>   	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
>   	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
> -	.tz_cp_config_data = &tz_cp_config_sm8550,
> +	.tz_cp_config_data = tz_cp_config_sm8550,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
>   	.core_arch = VIDEO_ARCH_LX,
>   	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>   	.ubwc_config = &ubwc_config_sm8550,
> @@ -947,7 +951,8 @@ struct iris_platform_data sm8750_data = {
>   	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
>   	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
>   	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
> -	.tz_cp_config_data = &tz_cp_config_sm8550,
> +	.tz_cp_config_data = tz_cp_config_sm8550,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
>   	.core_arch = VIDEO_ARCH_LX,
>   	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>   	.ubwc_config = &ubwc_config_sm8550,
> @@ -1035,7 +1040,8 @@ struct iris_platform_data qcs8300_data = {
>   	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_qcs8300_dec),
>   	.inst_fw_caps_enc = inst_fw_cap_qcs8300_enc,
>   	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_qcs8300_enc),
> -	.tz_cp_config_data = &tz_cp_config_sm8550,
> +	.tz_cp_config_data = tz_cp_config_sm8550,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
>   	.core_arch = VIDEO_ARCH_LX,
>   	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>   	.ubwc_config = &ubwc_config_sm8550,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 1b1b6aa751106ee0b0bc71bb0df2e78340190e66..8927c3ff59dab59c7d2cbcd92550f9ee3a2b5c1e 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -278,11 +278,13 @@ static const char * const sm8250_opp_clk_table[] = {
>   	NULL,
>   };
> 
> -static struct tz_cp_config tz_cp_config_sm8250 = {
> -	.cp_start = 0,
> -	.cp_size = 0x25800000,
> -	.cp_nonpixel_start = 0x01000000,
> -	.cp_nonpixel_size = 0x24800000,
> +static const struct tz_cp_config tz_cp_config_sm8250[] = {
> +	{
> +		.cp_start = 0,
> +		.cp_size = 0x25800000,
> +		.cp_nonpixel_start = 0x01000000,
> +		.cp_nonpixel_size = 0x24800000,
> +	},
>   };
> 
>   static const u32 sm8250_vdec_input_config_param_default[] = {
> @@ -348,7 +350,8 @@ struct iris_platform_data sm8250_data = {
>   	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
>   	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
>   	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
> -	.tz_cp_config_data = &tz_cp_config_sm8250,
> +	.tz_cp_config_data = tz_cp_config_sm8250,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
>   	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>   	.num_vpp_pipe = 4,
>   	.max_session_count = 16,
> 
> --
> 2.34.1
> 
> 

Please tidy up the commit log.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

