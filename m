Return-Path: <linux-media+bounces-45171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A3790BF9409
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 01:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4CD824EEAE1
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 23:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223902C11F7;
	Tue, 21 Oct 2025 23:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zhFgDvNn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5167026B75B
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 23:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761089732; cv=none; b=r27Q/oK+c8DzxM8GoHsH7Qi2SHpjKOLy0fTrGx7IjAIa2vrk5Idr21hMEhj9hc2l4jaxaTF97Bbvmk0P+loxduBWoavFD/Olpwk2DTNQ7lxaCA5gYHJ1liWZWltVd7A7MbbPkkOIzQjkSKFWuaCyoBB+0UAY49shQb/IGvWq/84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761089732; c=relaxed/simple;
	bh=d0rri72HUDD7sLN8He2gM8MVhsCdzHnM4aRPUZ7Wp4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ddvqIgfw0QSdHoN0BJK6ni3bTGdDj9v90RDOeuSLyg8V3e3m1m6IwklrowrKrLLAQTbXzSAPv7Bh7op27AD0tMMf2x3AGt6aFzgBNjjmYntJfO9/+TQ2NdReZkPfDN2jJ99xUQ7d/+df0HrH2EFFPBHFGrl3nwlx9jZnEVaKX2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zhFgDvNn; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-426edfffc66so273745f8f.1
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 16:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761089729; x=1761694529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xCXGcVVHwvNBqgCg7ypa7rVa+Pb3fcXZRoAO3UaaUjc=;
        b=zhFgDvNn+hyp9BQmFTgF5mrlXX36gbkNbP62cIhSVknHLzU6XPGCnuZxg+F8AFEn9p
         8cq3DvJ7EfbI8r+avwJeZ3TVE2W5CvwbExFKgOTDNnQYAg6k9gAGmuYN1N0qQM8+KpTL
         RuyDF8Y64WnUUJOmw0xvu+iQuKxhRJTrMLDm1ZnSOYDNKBQIytP6rrybVlQQ5e4TtOU+
         L0TOWuHdtT5TKMLc46nUKA0cieoJdgmZ7NTzEDQV01l8yVb1f/Vz7FjIBR8qTW/mXUEy
         gnpYEEgxJgXUH6EAto6XyfHevUO/YjfuHCtTrK+vaTXjwMLFn/7qqvDmuXWI6gBz8CUE
         +XPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761089729; x=1761694529;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCXGcVVHwvNBqgCg7ypa7rVa+Pb3fcXZRoAO3UaaUjc=;
        b=KIOFDxlfpnpG+Gd/XfGaymvxr0TBlLt1jqEw7t8tM2aEyJ0mY8byqfUZ7H1cjXSUKN
         nnEHgowJeJs0QUl/e9+F6E9TiWBDlaAwljjTBRRGtWvWMp5+K0mOtd/rhIU6GbL1LcHu
         XBO1m3t2m+qIT8QEmo4tNE/dN3fyBRQ0lrn+JfmIhUqGnILqs0nYV7CU1O30H9M+12/P
         B33CPZQon4WErrERNp4GW5LU9GCtD4faFGAmG9KiF9Z12DzgLVSMfhk1y3KYGflW6mOJ
         NxnR6eM8fp8gXlpbXsVX/G1DE+66PfpPWm7bdVtA9UBzPaBQ2pKeper7qQ8S5u1wxQre
         Dilw==
X-Forwarded-Encrypted: i=1; AJvYcCXXphkeAXJXn2s5VgiASC8KnV9GfnZyP4V7tXIes+FFebOcAmmbexTezltmwvPHC6zfvXcSXA6IdjDLvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YymNIkrDhFQnuoYqDUQggeB9oiliO52SUtlDuHvA7Yfd/6+nPpj
	yia5pKqBWqUUCAwkx7Vf1+ygaU//C2sTm/XInN95hnZulpjJTs0pjq777oMDNxW1dSo=
X-Gm-Gg: ASbGnctN0qOqt7moIufBE0McAZ4aGFF3rEk+2mtFQXunJt6Liyudx2tsiuJg1AUwoVL
	nvchnKCnRco/UUadwlJU9O22RqlxuG50v14bv8Osgy+VH2gPF7QOh+V6FJ1QVD8HxxPdk00mldq
	FEX3Y1d9y5tqyI69RE8Vzzzl1tExq7m1RA9r9+GdCc5/5EFYEApYgHSoBk+062xAOllhLLurN1m
	3okk9VpIrsLH7drH/WwRWimbfFafZGmq82Gd6In1jlmtfffZu80cvdQXPHZeWZGZUSCLscMsz4S
	o9ShY/RxA6sQHf/ZRC5jl1pubCWVJDkmClGllgdSsQjgpvwBgp9c/RsPfF3PQVtIkAmaDeqQwKW
	pKFIuyPV1LrRtenqkKC+0Rcjd9jy6DNWs74GvlLY5JuaL0cob/Dw9kwCl2DpS3YrlOwPODAScfC
	81vn5LtANZZtBFEe24mtMYzpzyN1DL12KgtWZevgBMX9R/ImLlhu7cdA==
X-Google-Smtp-Source: AGHT+IGAFLCl48Lc20o0k175qMA8ECYoPcsbHgJr1TYSq+qDL1SyBGQ/3qEO66SBlR5lpciSN2paDA==
X-Received: by 2002:a05:6000:4012:b0:3df:9ba8:21a3 with SMTP id ffacd0b85a97d-4285326765cmr879407f8f.18.1761089728509;
        Tue, 21 Oct 2025 16:35:28 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3c56sm22616463f8f.18.2025.10.21.16.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 16:35:27 -0700 (PDT)
Message-ID: <9e71bd5c-e4d9-4b2b-bec9-95b101bdd91c@linaro.org>
Date: Wed, 22 Oct 2025 00:35:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] media: iris: Add support for multiple TZ content
 protection(CP) configs
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vishnu Reddy <quic_bvisredd@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
 <vWebMQzqRdPJMtF45GS9wvdpHGc4w0O4Ft0KSmDAC54LhULoJZ_uNAW8KkJ8tbK4WKwvUVdeYtDuyZCH3Z_BBA==@protonmail.internalid>
 <20251017-knp_video-v2-3-f568ce1a4be3@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251017-knp_video-v2-3-f568ce1a4be3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2025 15:16, Vikash Garodia wrote:
> vpu4 needs an additional configuration with respect to CP regions. Make
> the CP configuration as array such that the multiple configuration can be
> managed per platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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
> index 9ab499fad946446a87036720f49c9c8d311f3060..9186e0144dc0df4045c9995adc5fc93993cc3fba 100644
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
> +			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
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
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

