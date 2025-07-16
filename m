Return-Path: <linux-media+bounces-37922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CED9B08122
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 01:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48302A405F3
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 23:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702FD2ED171;
	Wed, 16 Jul 2025 23:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S8tuXW+L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E601F19A
	for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 23:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752709836; cv=none; b=FBQ1i6mrjhT4k6+neMifzkKnqajqxHBMqOHHWRBWCQJ3wHtrSZY9xNL4lQCU1S8tzy5CG5QxSSpss/pNlelNiK8v0F9fVihzGP0zkQiSbswETOg9R6XgT9YpzmOQB+fimo2bISVeHWaM7OGcyYTg5WcYUWO51It+jXw3UCnKwVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752709836; c=relaxed/simple;
	bh=KO2bi8vP3uhS9u1yzx0Y9+YpmVX6rjKrWhJY4rt4MGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d5k7pg51KyphlPg0QBzBVBk92vvuAabvRft2S9gMcWvrpmSfRq51V3/49rJHwEXIdNdwOb7sXwT+AKb/ugimh2s+8Ed8v81V/c+W1uuBZckMSvq6qvzNfu7JCWETLYFuvM3cVRP6pew9Rr5NivEPvw8ENCsjBRjNMMJs20cC1VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S8tuXW+L; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so252683f8f.3
        for <linux-media@vger.kernel.org>; Wed, 16 Jul 2025 16:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752709833; x=1753314633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fTBXnzL28ISFD5DM6+u6yWEPldc67kyXwMqMPLpNEo0=;
        b=S8tuXW+LCiouhXjH4n/gcMJZ45rttVdFpRGR6SvwlzQPu6LaeW2zMR2yX03wTDvVLU
         9nmIqmnxnXHSqvIE1TboEPec9GKjLf6m891Av3KPKdBgXCIZyNhbNV+tif8lHyVYkn5i
         F3iPF0tatGnNtdBf37F7s6oEEs0919EKRIcqWUqIJOFxQ1k7zDjHaKlKjdVhAcdvxbDb
         6yyOvmc5nAu3oSfuIrCyARG3T3QBYrMCu7fZW72imD/DtWZaOxZ9IkiWOEJgfJnT+dzO
         heGrqATldci7fy89ftbCPXPOaea3cg+feWCjfTi+FsuOC8WsrBjToqhny5E2edekKM0N
         SF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752709833; x=1753314633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fTBXnzL28ISFD5DM6+u6yWEPldc67kyXwMqMPLpNEo0=;
        b=ap7EjtJzi82aG2hKk+qrnS7GkxpKUbye50ymW/k9H/uildtKwik6CINhHZH4XupR6i
         9vatEkfK8VpMN+JURpaHooOTW92vliwnEXeU1rh1yiuhjp59Lbg0ORmxdaaz+tMmKw+s
         UWeB40Y+tRhqR/YH4effH1oi3+jLSVoVEZmUQQI4mBCHwqUaHsx3Bm68eKn3Dxz1sb4G
         EQcsQUbZZMlc5ZD+Jdvxp3wHbnZf4C0aAfwyiPXg+BNeVlhMttuQkvfBGepmW+tXg0uE
         5xa8SRWRTXaKS0VzBrHIpYgfeVvPVvZ8ySHKoLqYXxyjQcuQdflN5mPhI/mXuUPKP37e
         yoAg==
X-Gm-Message-State: AOJu0YyICloSr/NrLbmjetqXet28NiHROT5ZJTOdXEI3guURmmyfX5Xq
	6gNzNjmP60fDrRS6J1WMbfKcgmEUJxAdKoXVowc4xTdK/b1oV8qojr004oJ4u1h2mI0=
X-Gm-Gg: ASbGncuIcSl0N9E8ooQ1oLprQY1NOX+CCyNmT2/Z+Ak/coigyY/guKI1gShQ6tl4aIu
	juafwESu+kpajleqtQa/5M021Hgys7mDMOtekDrtNfbNT6duKmIsdJkgfbWv2tD/txCohV2Aze8
	tO/3xyPLNY/zJjZbdemeyud5oN3P6VxA6hEdlr0g/VeLuzONn2d9IjSoAV7Zu01eieKIxI2Uh7t
	1qMoxlzELgT9DDRj0p3cljHEs04oJWrVk+huZxr7vWUlRUMrtKDxRdW4Eivm6D9NC3H5vVz3udA
	Liz8lH1roDvE50dd+sLE4p2CjkK34FbkKmouBzVWWGmz9Ep8lIKOZSYOLrIhSZWyhtzmGalrPme
	z0OcRx2hDU3HfkuRQOVc8kNxJT8mGAAGAVL6IRv6PyZ3oBakXSFRoicDkFbQPOMpv
X-Google-Smtp-Source: AGHT+IF8FHbV5tk6cni7ZsIS91d5gxwZ4DAj2TWHeK6yUDgC+5u2gx+QSilALopvv0r6AHCH85gfCw==
X-Received: by 2002:a05:6000:4006:b0:3b6:2f9:42b1 with SMTP id ffacd0b85a97d-3b60e4d248bmr3826661f8f.13.1752709832479;
        Wed, 16 Jul 2025 16:50:32 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd18ffsm18886056f8f.9.2025.07.16.16.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 16:50:31 -0700 (PDT)
Message-ID: <4734edd5-8224-4caa-8844-c38dabc6b6c0@linaro.org>
Date: Thu, 17 Jul 2025 00:50:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] media: venus: Add support for AR50_LITE video core
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, krzk+dt@kernel.org,
 konradybcio@kernel.org, mchehab@kernel.org, andersson@kernel.org,
 conor+dt@kernel.org, amit.kucheria@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-4-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250715204749.2189875-4-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/07/2025 21:47, Jorge Ramirez-Ortiz wrote:
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
>   drivers/media/platform/qcom/venus/helpers.c   | 30 +++++++++++++++--
>   drivers/media/platform/qcom/venus/helpers.h   |  2 ++
>   .../media/platform/qcom/venus/hfi_parser.c    |  5 +--
>   .../media/platform/qcom/venus/hfi_platform.c  | 20 +++++++-----
>   .../media/platform/qcom/venus/hfi_platform.h  | 25 ++++++++-------
>   .../platform/qcom/venus/hfi_platform_v4.c     | 31 ++++++++++++------
>   .../platform/qcom/venus/hfi_platform_v6.c     | 32 +++++++++++++------
>   drivers/media/platform/qcom/venus/hfi_venus.c | 25 +++++++++++----
>   .../media/platform/qcom/venus/hfi_venus_io.h  |  4 +++
>   .../media/platform/qcom/venus/pm_helpers.c    |  2 +-
>   drivers/media/platform/qcom/venus/vdec.c      |  7 +---
>   15 files changed, 154 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index b7d6745b6124..bad49f0b4a77 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -269,14 +269,19 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type,
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
> @@ -476,6 +481,10 @@ static int venus_probe(struct platform_device *pdev)
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
> index 3af8386b78be..f5b59e81e3c2 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -538,6 +538,11 @@ struct venus_inst {
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
> index 66a18830e66d..c74988fd5ce2 100644
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
> index aaccd847fa30..3fea4ab63bf7 100644
> --- a/drivers/media/platform/qcom/venus/firmware.h
> +++ b/drivers/media/platform/qcom/venus/firmware.h
> @@ -9,6 +9,7 @@ struct device;
>   
>   int venus_firmware_init(struct venus_core *core);
>   void venus_firmware_deinit(struct venus_core *core);
> +int venus_firmware_cfg(struct venus_core *core);
>   int venus_boot(struct venus_core *core);
>   int venus_shutdown(struct venus_core *core);
>   int venus_set_hw_state(struct venus_core *core, bool suspend);
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 8295542e1a7c..438ed1abd8e8 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -230,6 +230,24 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
>   }
>   EXPORT_SYMBOL_GPL(venus_helper_alloc_dpb_bufs);
>   
> +void venus_helper_prepare_eos_data(struct venus_inst *inst,
> +				   struct hfi_frame_data *data)
> +{
> +	struct venus_core *core = inst->core;
> +
> +	data->buffer_type = HFI_BUFFER_INPUT;
> +	data->flags = HFI_BUFFERFLAG_EOS;
> +
> +	if (IS_V6(core) && is_fw_rev_or_older(core, 1, 0, 87))
> +		return;
> +
> +	if (IS_V4(core) && is_lite(core) && is_fw_rev_or_older(core, 6, 0, 53))
> +		data->alloc_len = 1;
> +
> +	data->device_addr = 0xdeadb000;
> +}
> +EXPORT_SYMBOL_GPL(venus_helper_prepare_eos_data);

This function doesn't appear to have alot to do with AR50_LITE as it 
pertains to IS_V6() and IS_V4().

This I think should be a separate patch with its own commit log to 
describe the quite complex logic of version numbers going on here.

> +
>   static int intbufs_set_buffer(struct venus_inst *inst, u32 type)
>   {
>   	struct venus_core *core = inst->core;
> @@ -1715,11 +1733,17 @@ int venus_helper_session_init(struct venus_inst *inst)
>   	if (ret)
>   		return ret;
>   
> -	inst->clk_data.vpp_freq = hfi_platform_get_codec_vpp_freq(version, codec,
> +	inst->clk_data.vpp_freq = hfi_platform_get_codec_vpp_freq(version,
> +								  is_lite(inst->core),

I'm not trying to awkward questions but is there another 'lite' that 
this is_lite() logic is supposed to capture if not then why not 
IS_AR50_LITE()

This differentation should be explained in commit log or inline /* 
comment */

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
> diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
> index 358e4f39c9c0..62a734c1da1d 100644
> --- a/drivers/media/platform/qcom/venus/helpers.h
> +++ b/drivers/media/platform/qcom/venus/helpers.h
> @@ -58,6 +58,8 @@ int venus_helper_get_out_fmts(struct venus_inst *inst, u32 fmt, u32 *out_fmt,
>   bool venus_helper_check_format(struct venus_inst *inst, u32 v4l2_pixfmt);
>   int venus_helper_alloc_dpb_bufs(struct venus_inst *inst);
>   int venus_helper_free_dpb_bufs(struct venus_inst *inst);
> +void venus_helper_prepare_eos_data(struct venus_inst *inst,
> +				   struct hfi_frame_data *data);
>   int venus_helper_intbufs_alloc(struct venus_inst *inst);
>   int venus_helper_intbufs_free(struct venus_inst *inst);
>   int venus_helper_intbufs_realloc(struct venus_inst *inst);
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

Why add a parameter that triggers a warning ?

Just disjunct away from calling this function with the bool you are 
passing ?!?

>   	*entries = ARRAY_SIZE(caps);
>   	return caps;
>   }
>   
> -static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
> +static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count, bool lite)
>   {
> +	WARN_ON(lite);

> +
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

Yeah this pattern seems a bit mad to me, adding a bool as a parameter 
and then complaining about it with a WARN()

Why call the functioning if your bool already tells you its verboten ?


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
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 29b0d6a5303d..ac3d2760b2e0 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -565,12 +565,7 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
>   		if (!(inst->streamon_out && inst->streamon_cap))
>   			goto unlock;
>   
> -		fdata.buffer_type = HFI_BUFFER_INPUT;
> -		fdata.flags |= HFI_BUFFERFLAG_EOS;
> -		if (IS_V6(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
> -			fdata.device_addr = 0;
> -		else
> -			fdata.device_addr = 0xdeadb000;
> +		venus_helper_prepare_eos_data(inst, &fdata);
>   
>   		ret = hfi_session_process_buf(inst, &fdata);
>   


