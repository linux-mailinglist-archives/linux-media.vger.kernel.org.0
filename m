Return-Path: <linux-media+bounces-38906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 486EAB1B0B4
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 11:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4847C17BF7E
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 09:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1843825C807;
	Tue,  5 Aug 2025 09:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LURED/y9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F7225A2D2
	for <linux-media@vger.kernel.org>; Tue,  5 Aug 2025 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754384836; cv=none; b=p1eWEw3iPEoQHO+CZecK2LcNyErpFLw14HwOuwxKERv9WxP4HvG7Qxu5h6BE9C9+jiSbmRgSZpZYjzQhySwv3OJW4fPolvwOsPegkOT/ODTCDjuU94n2y8Br1/ZT9G9sdtY8v/Hgtu7s7YSRkBty5mReGyPYlC2piMXanoSAfns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754384836; c=relaxed/simple;
	bh=u9LWd5JeC84Y8lXY+lL0vaJbtGO8wT5LrJpEZdfHO0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b0hQF1+VnpOoCm6cilTIQn6MHMORD23jX0eZI/tzrMmbS+LTpZdhBMRtROKbJPsivYrXVZSg9oF582GYq+Lt95vw7HlyvYCIAmLskb187ydjF7FrMlkPX8fv6Iv93lJfpSyWOOqqvQJmJVIfsB7tPKomzKodcWgTJDtAeo3DLL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LURED/y9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-458ba079338so20900645e9.1
        for <linux-media@vger.kernel.org>; Tue, 05 Aug 2025 02:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754384832; x=1754989632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K7udK2892zy3Yy12IhDQUg96V6GhpNwtjc7OJOyAgcA=;
        b=LURED/y9Kd88XxF+g50NkxO5ZNoctLzA2a41X/H/8a0SqBZw1Q1gN9Q/9+7u/lixgn
         F4+XH1LxxsOOpedUJx3p7AeKzC89brckn78Lo/LiiAOtodPQma377LYCfi4AC956VV77
         TmqLXb/6z0VddyZLzBtezfMpqB3hDxT3Qda3GxoNjjgbRM9iK38CyB5g9ilm8jHv65JC
         ejne4Vy8qMmNxxW501oN+RnlHFXTbyT4TBpBX6md9H/d4Evdj6TOdfYqtRtHg5hSJ8dN
         dot4izut7EbnGUcmPBaVedptdrS/4ewMGUQuvuGSFPbsyMZtE4GWZr0+dTZzh87u5kPT
         vnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754384832; x=1754989632;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7udK2892zy3Yy12IhDQUg96V6GhpNwtjc7OJOyAgcA=;
        b=ZXoT4Io3Q8l51Q8K9rb8BJ4L4fiy+X0Czqx4XeTNjYmui+VnwjPH4ORZBY9hzgSola
         a1/eFK7SVzatBRd6HlJmUAlQubx1YLDVhMYw32OUxtzZ6UJ//ruj4Ae/w7t/Uow7TGyz
         Xr4jXB0BlT1l2rS16ec35+qJCQFLg1hdTZrCDpAx9n2xv5+zarpcb8OoV7MOgJ3mtR+g
         HcZwJ2CJemll2RuXSk2jjUJLmRF7HYJ/IGwTEa0sT0Rc5Uv4nGVODD4KmwEoeNGGIqRd
         moJxn7bsSAdxz9GyaX5SpqUG/DpUrNDCPu9gKzCjpUxifbMUOVPK/ckFF1CwfocQYpQu
         FCJw==
X-Forwarded-Encrypted: i=1; AJvYcCXTRU3VTn8lHMQEUMUlxTQdxDDQ7HfrT/M0Lw5pfK7EYj06GhFcuSPV8KHU4slN6ESLW5QVYThFfEjpQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+MounPM4viUpXRMtAZqRoY3394WBnFn0FrCTNmg2A5v/e3P4j
	BdIqUUpZD2jYdvEnA1U1AtFg4fVLDx7nrE1UY+QSBI4yPxowdIKK+cpmQbXxOacoLwDVKG67Kb0
	EjzWhEZ4=
X-Gm-Gg: ASbGncuiphYNAQMLMtka7KYQryL+uDjgO9MgBhy5riT3HXp++ZdVmRpINUNKMKUrlyX
	qq2JZYT2oqFP+cLTd9/N7soeOpGaJSN2rO6hp5EyeraM4dqgyB9bEsYrqcIXDGjqlQQ21HkuGBe
	c7Ri3PT1p6+NsXKR4r3QuIvnFC+fDkU6bHheLtNPHa61MGEcXjKAGROub5ZPBt45roUZNX51sGJ
	sl9X8BXsQ6iH8PZqoUc09nolZB18ZVxPvoXUxP3W10kuE1L4YXR5+42aSSb86G5+8Y+i40OpXYD
	P3Lu1EDOuteZKxKKb8eQAhwTmS3CYDedE982qp+an6rBNWzFP7a8HJOhhGOQ6NVb7eoHSSC2s5t
	lF/gsWgQS4sp94YkEoZ5ps97qjvhWDIAIBPKyx0HSQdNvij3objJk1E3GkTARWuI=
X-Google-Smtp-Source: AGHT+IFxRzRnOc3qGiXI3ELUInkU1j07MJR6zYbl+4IEEnlv++cNgXqGI6lZ6ODA1c6pDCOVUJgOEQ==
X-Received: by 2002:a05:600c:4511:b0:458:bade:72c5 with SMTP id 5b1f17b1804b1-459e0cb883dmr24708585e9.8.1754384831980;
        Tue, 05 Aug 2025 02:07:11 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459dfa64da0sm45803935e9.3.2025.08.05.02.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 02:07:11 -0700 (PDT)
Message-ID: <b0769636-a3c3-410c-af09-8dfea3380800@linaro.org>
Date: Tue, 5 Aug 2025 10:07:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/7] media: venus: Add support for AR50_LITE video core
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
 konradybcio@kernel.org, krzk+dt@kernel.org
Cc: mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-4-jorge.ramirez@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250805064430.782201-4-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2025 07:44, Jorge Ramirez-Ortiz wrote:
> The AR50_LITE is a simplified variant of the AR50 video core, designed for
> power and cost-efficient platforms.
> 
> It supports hardware-accelerated decoding of H.264, HEVC, and VP9 formats,
> and provides encoding support for H.264 and HEVC.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/venus/core.c      | 15 +++++++--
>   drivers/media/platform/qcom/venus/core.h      |  5 +++
>   drivers/media/platform/qcom/venus/firmware.c  | 10 ++++++
>   drivers/media/platform/qcom/venus/firmware.h  |  1 +
>   drivers/media/platform/qcom/venus/helpers.c   | 12 +++++--
>   .../media/platform/qcom/venus/hfi_parser.c    |  5 +--
>   .../media/platform/qcom/venus/hfi_platform.c  | 20 +++++++-----
>   .../media/platform/qcom/venus/hfi_platform.h  | 25 ++++++++-------
>   .../platform/qcom/venus/hfi_platform_v4.c     | 31 ++++++++++++------
>   .../platform/qcom/venus/hfi_platform_v6.c     | 32 +++++++++++++------
>   drivers/media/platform/qcom/venus/hfi_venus.c | 25 +++++++++++----
>   .../media/platform/qcom/venus/hfi_venus_io.h  |  4 +++
>   .../media/platform/qcom/venus/pm_helpers.c    |  2 +-
>   13 files changed, 133 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index f45715c9b222..adc38fbc9d79 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -254,14 +254,19 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
>   
>   static void venus_assign_register_offsets(struct venus_core *core)
>   {
> -	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
> -		core->vbif_base = core->base + VBIF_BASE;
> +	if (IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)) {
>   		core->cpu_base = core->base + CPU_BASE_V6;
>   		core->cpu_cs_base = core->base + CPU_CS_BASE_V6;
>   		core->cpu_ic_base = core->base + CPU_IC_BASE_V6;
>   		core->wrapper_base = core->base + WRAPPER_BASE_V6;
>   		core->wrapper_tz_base = core->base + WRAPPER_TZ_BASE_V6;
> -		core->aon_base = core->base + AON_BASE_V6;
> +		if (IS_AR50_LITE(core)) {
> +			core->vbif_base = NULL;
> +			core->aon_base = NULL;
> +		} else {
> +			core->vbif_base = core->base + VBIF_BASE;
> +			core->aon_base = core->base + AON_BASE_V6;
> +		}
>   	} else {
>   		core->vbif_base = core->base + VBIF_BASE;
>   		core->cpu_base = core->base + CPU_BASE;
> @@ -456,6 +461,10 @@ static int venus_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err_firmware_deinit;
>   
> +	ret = venus_firmware_cfg(core);
> +	if (ret)
> +		goto err_venus_shutdown;
> +
>   	ret = hfi_core_resume(core, true);
>   	if (ret)
>   		goto err_venus_shutdown;
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 2d3cf920198f..f8602735d6c2 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -537,6 +537,11 @@ struct venus_inst {
>   #define IS_IRIS2(core)		((core)->res->vpu_version == VPU_VERSION_IRIS2)
>   #define IS_IRIS2_1(core)	((core)->res->vpu_version == VPU_VERSION_IRIS2_1)
>   
> +static inline bool is_lite(struct venus_core *core)
> +{
> +	return IS_AR50_LITE(core);
> +}
> +
>   #define ctrl_to_inst(ctrl)	\
>   	container_of((ctrl)->handler, struct venus_inst, ctrl_handler)
>   
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 503dd270a14a..2e5d85e25d0f 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -207,6 +207,16 @@ static int venus_shutdown_no_tz(struct venus_core *core)
>   	return 0;
>   }
>   
> +int venus_firmware_cfg(struct venus_core *core)
> +{
> +	void __iomem *cpu_cs_base = core->cpu_cs_base;
> +
> +	if (IS_AR50_LITE(core))
> +		writel(CPU_CS_VCICMD_ARP_OFF, cpu_cs_base + CPU_CS_VCICMD);
> +
> +	return 0;
> +}
> +
>   int venus_boot(struct venus_core *core)
>   {
>   	struct device *dev = core->dev;
> diff --git a/drivers/media/platform/qcom/venus/firmware.h b/drivers/media/platform/qcom/venus/firmware.h
> index ead39e3797f0..87e1d922b369 100644
> --- a/drivers/media/platform/qcom/venus/firmware.h
> +++ b/drivers/media/platform/qcom/venus/firmware.h
> @@ -10,6 +10,7 @@ struct device;
>   int venus_firmware_init(struct venus_core *core);
>   void venus_firmware_deinit(struct venus_core *core);
>   int venus_firmware_check(struct venus_core *core);
> +int venus_firmware_cfg(struct venus_core *core);
>   int venus_boot(struct venus_core *core);
>   int venus_shutdown(struct venus_core *core);
>   int venus_set_hw_state(struct venus_core *core, bool suspend);
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 8295542e1a7c..3a761b5415c5 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -1715,11 +1715,17 @@ int venus_helper_session_init(struct venus_inst *inst)
>   	if (ret)
>   		return ret;
>   
> -	inst->clk_data.vpp_freq = hfi_platform_get_codec_vpp_freq(version, codec,
> +	inst->clk_data.vpp_freq = hfi_platform_get_codec_vpp_freq(version,
> +								  is_lite(inst->core),
> +								  codec,
>   								  session_type);
> -	inst->clk_data.vsp_freq = hfi_platform_get_codec_vsp_freq(version, codec,
> +	inst->clk_data.vsp_freq = hfi_platform_get_codec_vsp_freq(version,
> +								  is_lite(inst->core),
> +								  codec,
>   								  session_type);
> -	inst->clk_data.low_power_freq = hfi_platform_get_codec_lp_freq(version, codec,
> +	inst->clk_data.low_power_freq = hfi_platform_get_codec_lp_freq(version,
> +								       is_lite(inst->core),
> +								       codec,
>   								       session_type);
>   
>   	return 0;
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> index 1b3db2caa99f..55cee1c786a0 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -277,12 +277,13 @@ static int hfi_platform_parser(struct venus_core *core, struct venus_inst *inst)
>   	if (inst)
>   		return 0;
>   
> -	ret = hfi_platform_get_codecs(core, &enc_codecs, &dec_codecs, &count);
> +	ret = hfi_platform_get_codecs(core, &enc_codecs, &dec_codecs, &count,
> +				      is_lite(core));

As I say below, if you pass the core pointer you don't have to macro all 
of this stuff.

>   	if (ret)
>   		return ret;
>   
>   	if (plat->capabilities)
> -		caps = plat->capabilities(&entries);
> +		caps = plat->capabilities(&entries, is_lite(core));
>   
>   	if (!caps || !entries || !count)
>   		return -EINVAL;
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
> index 643e5aa138f5..c6c248561793 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform.c
> +++ b/drivers/media/platform/qcom/venus/hfi_platform.c
> @@ -21,7 +21,8 @@ const struct hfi_platform *hfi_platform_get(enum hfi_version version)
>   }
>   
>   unsigned long
> -hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec, u32 session_type)
> +hfi_platform_get_codec_vpp_freq(enum hfi_version version, bool lite, u32 codec,
> +				u32 session_type)
>   {
>   	const struct hfi_platform *plat;
>   	unsigned long freq = 0;
> @@ -31,13 +32,14 @@ hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec, u32 session
>   		return 0;
>   
>   	if (plat->codec_vpp_freq)
> -		freq = plat->codec_vpp_freq(session_type, codec);
> +		freq = plat->codec_vpp_freq(session_type, codec, lite);
>   
>   	return freq;
>   }
>   
>   unsigned long
> -hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec, u32 session_type)
> +hfi_platform_get_codec_vsp_freq(enum hfi_version version, bool lite, u32 codec,
> +				u32 session_type)
>   {
>   	const struct hfi_platform *plat;
>   	unsigned long freq = 0;
> @@ -47,13 +49,14 @@ hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec, u32 session
>   		return 0;
>   
>   	if (plat->codec_vpp_freq)
> -		freq = plat->codec_vsp_freq(session_type, codec);
> +		freq = plat->codec_vsp_freq(session_type, codec, lite);
>   
>   	return freq;
>   }
>   
>   unsigned long
> -hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec, u32 session_type)
> +hfi_platform_get_codec_lp_freq(enum hfi_version version, bool lite, u32 codec,
> +			       u32 session_type)
>   {
>   	const struct hfi_platform *plat;
>   	unsigned long freq = 0;
> @@ -63,13 +66,14 @@ hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec, u32 session_
>   		return 0;
>   
>   	if (plat->codec_lp_freq)
> -		freq = plat->codec_lp_freq(session_type, codec);
> +		freq = plat->codec_lp_freq(session_type, codec, lite);
>   
>   	return freq;
>   }
>   
>   int
> -hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codecs, u32 *count)
> +hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codecs, u32 *count,
> +			bool lite)
>   {
>   	const struct hfi_platform *plat;
>   
> @@ -78,7 +82,7 @@ hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codec
>   		return -EINVAL;
>   
>   	if (plat->codecs)
> -		plat->codecs(enc_codecs, dec_codecs, count);
> +		plat->codecs(enc_codecs, dec_codecs, count, lite);
>   
>   	if (IS_IRIS2_1(core)) {
>   		*enc_codecs &= ~HFI_VIDEO_CODEC_VP8;
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
> index ec89a90a8129..a9f1ead18084 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform.h
> +++ b/drivers/media/platform/qcom/venus/hfi_platform.h
> @@ -47,11 +47,12 @@ struct hfi_platform_codec_freq_data {
>   };
>   
>   struct hfi_platform {
> -	unsigned long (*codec_vpp_freq)(u32 session_type, u32 codec);
> -	unsigned long (*codec_vsp_freq)(u32 session_type, u32 codec);
> -	unsigned long (*codec_lp_freq)(u32 session_type, u32 codec);
> -	void (*codecs)(u32 *enc_codecs, u32 *dec_codecs, u32 *count);
> -	const struct hfi_plat_caps *(*capabilities)(unsigned int *entries);
> +	unsigned long (*codec_vpp_freq)(u32 session_type, u32 codec, bool lite);
> +	unsigned long (*codec_vsp_freq)(u32 session_type, u32 codec, bool lite);
> +	unsigned long (*codec_lp_freq)(u32 session_type, u32 codec, bool lite);
> +	void (*codecs)(u32 *enc_codecs, u32 *dec_codecs, u32 *count, bool lite);
> +	const struct hfi_plat_caps *(*capabilities)(unsigned int *entries,
> +						    bool lite);

I think you should pass a *core pointer instead of a bool, that allows 
for more flexibility in the future.

>   	int (*bufreq)(struct hfi_plat_buffers_params *params, u32 session_type,
>   		      u32 buftype, struct hfi_buffer_requirements *bufreq);
>   };
> @@ -60,12 +61,12 @@ extern const struct hfi_platform hfi_plat_v4;
>   extern const struct hfi_platform hfi_plat_v6;
>   
>   const struct hfi_platform *hfi_platform_get(enum hfi_version version);
> -unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec,
> -					      u32 session_type);
> -unsigned long hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec,
> -					      u32 session_type);
> -unsigned long hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec,
> -					     u32 session_type);
> +unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, bool lite,
> +					      u32 codec, u32 session_type);
> +unsigned long hfi_platform_get_codec_vsp_freq(enum hfi_version version, bool lite,
> +					      u32 codec, u32 session_type);
> +unsigned long hfi_platform_get_codec_lp_freq(enum hfi_version version, bool lite,
> +					     u32 codec, u32 session_type);
>   int hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codecs,
> -			    u32 *count);
> +			    u32 *count, bool lite);
>   #endif
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v4.c b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> index e3f0a90a567b..4ae7ed476c48 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> +++ b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> @@ -245,14 +245,19 @@ static const struct hfi_plat_caps caps[] = {
>   	.num_fmts = 4,
>   } };
>   
> -static const struct hfi_plat_caps *get_capabilities(unsigned int *entries)
> +static const struct hfi_plat_caps *get_capabilities(unsigned int *entries,
> +						    bool lite)
>   {
> +	WARN_ON(lite);
> +
>   	*entries = ARRAY_SIZE(caps);
>   	return caps;
>   }
>   
> -static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
> +static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count, bool lite)
>   {
> +	WARN_ON(lite);
> +

Why are these warnings here, is it acceptable for these to run on lite 
or not, if not return out ?

WARN seems a bit odd to me here.

>   	*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
>   		      HFI_VIDEO_CODEC_VP8;
>   	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> @@ -273,12 +278,14 @@ static const struct hfi_platform_codec_freq_data codec_freq_data[] =  {
>   };
>   
>   static const struct hfi_platform_codec_freq_data *
> -get_codec_freq_data(u32 session_type, u32 pixfmt)
> +get_codec_freq_data(u32 session_type, u32 pixfmt, bool lite)
>   {
>   	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
>   	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
>   	const struct hfi_platform_codec_freq_data *found = NULL;
>   
> +	WARN_ON(lite);
> +
>   	for (i = 0; i < data_size; i++) {
>   		if (data[i].pixfmt == pixfmt && data[i].session_type == session_type) {
>   			found = &data[i];
> @@ -289,33 +296,39 @@ get_codec_freq_data(u32 session_type, u32 pixfmt)
>   	return found;
>   }
>   
> -static unsigned long codec_vpp_freq(u32 session_type, u32 codec)
> +static unsigned long codec_vpp_freq(u32 session_type, u32 codec, bool lite)
>   {
>   	const struct hfi_platform_codec_freq_data *data;
>   
> -	data = get_codec_freq_data(session_type, codec);
> +	WARN_ON(lite);
> +
> +	data = get_codec_freq_data(session_type, codec, lite);
>   	if (data)
>   		return data->vpp_freq;
>   
>   	return 0;
>   }
>   
> -static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
> +static unsigned long codec_vsp_freq(u32 session_type, u32 codec, bool lite)
>   {
>   	const struct hfi_platform_codec_freq_data *data;
>   
> -	data = get_codec_freq_data(session_type, codec);
> +	WARN_ON(lite);
> +
> +	data = get_codec_freq_data(session_type, codec, lite);
>   	if (data)
>   		return data->vsp_freq;
>   
>   	return 0;
>   }
>   
> -static unsigned long codec_lp_freq(u32 session_type, u32 codec)
> +static unsigned long codec_lp_freq(u32 session_type, u32 codec, bool lite)
>   {
>   	const struct hfi_platform_codec_freq_data *data;
>   
> -	data = get_codec_freq_data(session_type, codec);
> +	WARN_ON(lite);
> +
> +	data = get_codec_freq_data(session_type, codec, lite);
>   	if (data)
>   		return data->low_power_freq;
>   
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6.c b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
> index 4e8af645f8b9..ad08d26cd7ba 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform_v6.c
> +++ b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
> @@ -245,14 +245,20 @@ static const struct hfi_plat_caps caps[] = {
>   	.num_fmts = 4,
>   } };
>   
> -static const struct hfi_plat_caps *get_capabilities(unsigned int *entries)
> +static const struct hfi_plat_caps *get_capabilities(unsigned int *entries,
> +						    bool lite)
>   {
> +	WARN_ON(lite);
> +
>   	*entries = ARRAY_SIZE(caps);
>   	return caps;
>   }
>   
> -static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
> +static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count,
> +		       bool lite)
>   {
> +	WARN_ON(lite);
> +
>   	*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
>   		      HFI_VIDEO_CODEC_VP8;
>   	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> @@ -273,12 +279,14 @@ static const struct hfi_platform_codec_freq_data codec_freq_data[] = {
>   };
>   
>   static const struct hfi_platform_codec_freq_data *
> -get_codec_freq_data(u32 session_type, u32 pixfmt)
> +get_codec_freq_data(u32 session_type, u32 pixfmt, bool lite)
>   {
>   	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
>   	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
>   	const struct hfi_platform_codec_freq_data *found = NULL;
>   
> +	WARN_ON(lite);
> +
>   	for (i = 0; i < data_size; i++) {
>   		if (data[i].pixfmt == pixfmt && data[i].session_type == session_type) {
>   			found = &data[i];
> @@ -289,33 +297,39 @@ get_codec_freq_data(u32 session_type, u32 pixfmt)
>   	return found;
>   }
>   
> -static unsigned long codec_vpp_freq(u32 session_type, u32 codec)
> +static unsigned long codec_vpp_freq(u32 session_type, u32 codec, bool lite)
>   {
>   	const struct hfi_platform_codec_freq_data *data;
>   
> -	data = get_codec_freq_data(session_type, codec);
> +	WARN_ON(lite);
> +
> +	data = get_codec_freq_data(session_type, codec, lite);
>   	if (data)
>   		return data->vpp_freq;
>   
>   	return 0;
>   }
>   
> -static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
> +static unsigned long codec_vsp_freq(u32 session_type, u32 codec, bool lite)
>   {
>   	const struct hfi_platform_codec_freq_data *data;
>   
> -	data = get_codec_freq_data(session_type, codec);
> +	WARN_ON(lite);
> +
> +	data = get_codec_freq_data(session_type, codec, lite);
>   	if (data)
>   		return data->vsp_freq;
>   
>   	return 0;
>   }
>   
> -static unsigned long codec_lp_freq(u32 session_type, u32 codec)
> +static unsigned long codec_lp_freq(u32 session_type, u32 codec, bool lite)
>   {
>   	const struct hfi_platform_codec_freq_data *data;
>   
> -	data = get_codec_freq_data(session_type, codec);
> +	WARN_ON(lite);
> +
> +	data = get_codec_freq_data(session_type, codec, lite);
>   	if (data)
>   		return data->low_power_freq;
>   
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index cec7f5964d3d..d3da35f67fd5 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -380,7 +380,7 @@ static void venus_soft_int(struct venus_hfi_device *hdev)
>   	void __iomem *cpu_ic_base = hdev->core->cpu_ic_base;
>   	u32 clear_bit;
>   
> -	if (IS_V6(hdev->core))
> +	if (IS_V6(hdev->core) || (IS_V4(hdev->core) && is_lite(hdev->core)))
>   		clear_bit = BIT(CPU_IC_SOFTINT_H2A_SHIFT_V6);
>   	else
>   		clear_bit = BIT(CPU_IC_SOFTINT_H2A_SHIFT);
> @@ -501,9 +501,11 @@ static int venus_boot_core(struct venus_hfi_device *hdev)
>   	if (count >= max_tries)
>   		ret = -ETIMEDOUT;
>   
> -	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
> +	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core)) {
>   		writel(0x1, cpu_cs_base + CPU_CS_H2XSOFTINTEN_V6);
> -		writel(0x0, cpu_cs_base + CPU_CS_X2RPMH_V6);
> +
> +		if (!IS_AR50_LITE(hdev->core))
> +			writel(0x0, cpu_cs_base + CPU_CS_X2RPMH_V6);
>   	}
>   
>   	return ret;
> @@ -569,6 +571,9 @@ static int venus_halt_axi(struct venus_hfi_device *hdev)
>   	u32 mask_val;
>   	int ret;
>   
> +	if (IS_AR50_LITE(hdev->core))
> +		return 0;
> +
>   	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core)) {
>   		writel(0x3, cpu_cs_base + CPU_CS_X2RPMH_V6);
>   
> @@ -1138,7 +1143,13 @@ static irqreturn_t venus_isr(struct venus_core *core)
>   	wrapper_base = hdev->core->wrapper_base;
>   
>   	status = readl(wrapper_base + WRAPPER_INTR_STATUS);
> -	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
> +
> +	if (IS_AR50_LITE(core)) {
> +		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
> +		    status & WRAPPER_INTR_STATUS_A2HWD_MASK_V4_LITE ||
> +		    status & CPU_CS_SCIACMDARG0_INIT_IDLE_MSG_MASK)
> +			hdev->irq_status = status;
> +	} else if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
>   		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
>   		    status & WRAPPER_INTR_STATUS_A2HWD_MASK_V6 ||
>   		    status & CPU_CS_SCIACMDARG0_INIT_IDLE_MSG_MASK)
> @@ -1150,7 +1161,7 @@ static irqreturn_t venus_isr(struct venus_core *core)
>   			hdev->irq_status = status;
>   	}
>   	writel(1, cpu_cs_base + CPU_CS_A2HSOFTINTCLR);
> -	if (!(IS_IRIS2(core) || IS_IRIS2_1(core)))
> +	if (!(IS_IRIS2(core) || IS_IRIS2_1(core) || IS_AR50_LITE(core)))
>   		writel(status, wrapper_base + WRAPPER_INTR_CLEAR);
>   
>   	return IRQ_WAKE_THREAD;
> @@ -1535,7 +1546,7 @@ static bool venus_cpu_and_video_core_idle(struct venus_hfi_device *hdev)
>   	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
>   	u32 ctrl_status, cpu_status;
>   
> -	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
> +	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core))
>   		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
>   	else
>   		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
> @@ -1555,7 +1566,7 @@ static bool venus_cpu_idle_and_pc_ready(struct venus_hfi_device *hdev)
>   	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
>   	u32 ctrl_status, cpu_status;
>   
> -	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core))
> +	if (IS_IRIS2(hdev->core) || IS_IRIS2_1(hdev->core) || IS_AR50_LITE(hdev->core))
>   		cpu_status = readl(wrapper_tz_base + WRAPPER_TZ_CPU_STATUS_V6);
>   	else
>   		cpu_status = readl(wrapper_base + WRAPPER_CPU_STATUS);
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus_io.h b/drivers/media/platform/qcom/venus/hfi_venus_io.h
> index 9735a246ce36..f2c3064c44ae 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus_io.h
> +++ b/drivers/media/platform/qcom/venus/hfi_venus_io.h
> @@ -51,6 +51,9 @@
>   /* Venus cpu */
>   #define CPU_CS_SCIACMDARG3			0x58
>   
> +#define CPU_CS_VCICMD				0x20
> +#define CPU_CS_VCICMD_ARP_OFF			BIT(0)
> +
>   #define SFR_ADDR				0x5c
>   #define MMAP_ADDR				0x60
>   #define UC_REGION_ADDR				0x64
> @@ -100,6 +103,7 @@
>   #define WRAPPER_INTR_MASK_A2HCPU_MASK		0x4
>   #define WRAPPER_INTR_MASK_A2HCPU_SHIFT		0x2
>   
> +#define WRAPPER_INTR_STATUS_A2HWD_MASK_V4_LITE	0x10
>   #define WRAPPER_INTR_STATUS_A2HWD_MASK_V6	0x8
>   #define WRAPPER_INTR_MASK_A2HWD_BASK_V6		0x8
>   
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index 8dd5a9b0d060..e09b0d9ae610 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -51,7 +51,7 @@ static int core_clks_enable(struct venus_core *core)
>   	dev_pm_opp_put(opp);
>   
>   	for (i = 0; i < res->clks_num; i++) {
> -		if (IS_V6(core)) {
> +		if (IS_V6(core) || (IS_V4(core) && is_lite(core))) {
>   			ret = clk_set_rate(core->clks[i], freq);
>   			if (ret)
>   				goto err;


