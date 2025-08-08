Return-Path: <linux-media+bounces-39105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B50FEB1E55D
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 11:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71C927A18B4
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 09:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3918266584;
	Fri,  8 Aug 2025 09:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uU5Kq137"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFF8269CE1
	for <linux-media@vger.kernel.org>; Fri,  8 Aug 2025 09:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754644226; cv=none; b=boQ0pAcmIli17/9M3Ux+1d+7XEvsftD4xGZhoCv+pplVUws0MNkbaSX2v2fMS68mdSaP3xvd6orlCBjw7EGFNiwCWyxgYaMSxS+BLWqLPG6ZgPPqzCLFjlD3Tl8ewqXQAhbm2kJ9K1xOFQZp07EYgiqFoqWbS/aSjUzmsryFSnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754644226; c=relaxed/simple;
	bh=UtRR2eIj2TATFazheT2/+9M1oMVZ3HAWzWY7KekB6Vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FQO4RjGapE1WTWmVP+hIQ1FlsbZzksnWljlCbzTs2fKAta/KgoMJEtQnnpPC0uL/inlOf/JYT2lUspxlE/vINakCLdF+RiAlXwNEj2sh+xL3/SbyiEijREinG573Wgms5gktj8bpLrijotimJ2yLXLNhWY73AKNR4oTJf6x4RIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uU5Kq137; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-458bdde7dedso13151445e9.0
        for <linux-media@vger.kernel.org>; Fri, 08 Aug 2025 02:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754644222; x=1755249022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xwFgWriCHV3XMrp0npVr/pnJbYHuaDcT+Bo6SqFYNcI=;
        b=uU5Kq1371o6fCx5ig4dwcRosDhACdGJQuyKxGOuISj8g7RFtyHhcmtRORhZP+D+J/8
         y5efniPVIBXQj26NwI/I33tXgxdHu8spm7fGJShLniNqvJZwvcRtCPkj6fXY0uGc1YzV
         dZQi3IKAF2zeJ7PBWV5UOVRhrWczNq8nF6hsDNflXwZZ/BuVaeCF+nkIzi9oDoNsyDxJ
         l9nVwk/ZjMvfE/AvTuC++F5tsiLdMcvUxk64nXJBUfU5LyF/agnE1VDa43DwRUJWUPoT
         e/4MFMtmvo+aKbh7n0ZZGJ2nzOd7XRPCvRg5gqcyGW6L235Oo9ff4Ixg+lOM1xQX5BgB
         JWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754644222; x=1755249022;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwFgWriCHV3XMrp0npVr/pnJbYHuaDcT+Bo6SqFYNcI=;
        b=hQrm85iKr20YYiUYq5BnvaMhY1hTL1wTN9xFZTWkDMrpSUTosDtdrNzFxz13N/cUqt
         M7eaEhubUagvWtEmybnNp2zPgbtVtijgGlEVHMQRaAY979EV9Ea1iD9hDuintTBbS3f3
         dfKwtooVQ31P8uc6RZErgyxJRyOR7rw524qcyQQ/TUoPGtLZPWklZLlVDKm7wyaLVYJl
         60MO1hloGjjDF5WAFu8v4aEheP2PB2ZvCSmHM/O7nxV5Rke+80QrYh3HVncZ93dqt2uw
         AWNCS752asN7+5g0qY8jYZ6Z5R5t/T2mGxrQryN2RKSMiifjx04xJtpUqrXgWvk4zu2R
         4D3g==
X-Forwarded-Encrypted: i=1; AJvYcCVRFA9gAT5zdS1yNjNUJAzlTPS5XPJCI4rGYRFVFgZBsZMN/KHRmG2NfdYjMmEuRAt9gP5mohQXVHVdFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxauZWLPV18xAYOQJgmXYF22m6L6V5duvdADInJ4hlk7YpQoao7
	E5oYxr1Mr2sIRxNGkNR/jdY8qKAy9nB9UZmso341GZhvdEGsxN8uZeTRv+NKmFcbais=
X-Gm-Gg: ASbGncvw9An0QSRamgWsgxX//+UE6N2Pms7zrQgOXQcwBOfup8M7loa3wBAWHbBumbS
	bQ8neZo2DCRDiOmo/6/FcAtKlAsgPmDHpR4UWVEqvyZZGpa0Tnc/UfvxDIlUM6t5L0WriR7FWPT
	yHx/0+1PZr2jQJuNWMkTVHsCZxb2xoFWiRz/4eoQFSOoNCfLzZVptF5t6wZeuny3kafWczX5K/Q
	YYFOX2kLT58r5Kye6XwL+FpiTtYFhUd4K15iHkUtqxeolodRTaJrpD9+feorhjzteRtmc6n/apP
	eD4iWMwHXo5qZjVrzuK8aeXf2C8WeBX9jfCP9n+n0zbTqVkCNN45k7kNJmlsHnr28H1Pgi9MmLx
	L35B9IHt6G8sAY5Dfai0785njmIsps0HcB/QxVnalGeykusHNOGjJsdheRiJFlhzxZdRlpkFxXQ
	==
X-Google-Smtp-Source: AGHT+IFWEbsWSJYQlF0CeT6C4q54U4UV+NcUVX+M1vPwPod1365sI4+lfwmdv9ASdhAity+d/W3MAg==
X-Received: by 2002:a05:600c:5248:b0:459:e35e:a90d with SMTP id 5b1f17b1804b1-459f4f14148mr17234425e9.27.1754644221744;
        Fri, 08 Aug 2025 02:10:21 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459d712c386sm210878195e9.23.2025.08.08.02.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 02:10:21 -0700 (PDT)
Message-ID: <faac02bc-20d4-46b6-939f-d4f0b637a450@linaro.org>
Date: Fri, 8 Aug 2025 10:10:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/8] media: venus: Add framework support for AR50_LITE
 video core
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, krzk+dt@kernel.org,
 konradybcio@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
 <20250808085300.1403570-4-jorge.ramirez@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250808085300.1403570-4-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2025 09:52, Jorge Ramirez-Ortiz wrote:
> The AR50_LITE is a simplified variant of the AR50 video core, designed for
> power and cost-efficient platforms.
> 
> It supports hardware-accelerated decoding of H.264, HEVC, and VP9 formats,
> and provides encoding support for H.264 and HEVC.
> 
> This commit prepares the framework to enable the AR50_LITE (it does not
> enable it).
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/venus/core.c      | 15 ++++++--
>   drivers/media/platform/qcom/venus/core.h      |  5 +++
>   drivers/media/platform/qcom/venus/firmware.c  | 10 ++++++
>   drivers/media/platform/qcom/venus/firmware.h  |  1 +
>   drivers/media/platform/qcom/venus/helpers.c   | 12 +++++--
>   .../media/platform/qcom/venus/hfi_parser.c    |  2 +-
>   .../media/platform/qcom/venus/hfi_platform.c  | 23 ++++++++-----
>   .../media/platform/qcom/venus/hfi_platform.h  | 34 ++++++++++++-------
>   .../platform/qcom/venus/hfi_platform_v4.c     | 33 +++++++++++++-----
>   .../platform/qcom/venus/hfi_platform_v6.c     | 33 +++++++++++++-----
>   drivers/media/platform/qcom/venus/hfi_venus.c | 25 ++++++++++----
>   .../media/platform/qcom/venus/hfi_venus_io.h  |  4 +++
>   .../media/platform/qcom/venus/pm_helpers.c    |  2 +-
>   13 files changed, 145 insertions(+), 54 deletions(-)
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
> index d1f0e9979ba4..ef80a7666597 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -533,6 +533,11 @@ struct venus_inst {
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
> index 3666675ae298..2483998360f7 100644
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
> index 8295542e1a7c..2e4363f82231 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -1715,11 +1715,17 @@ int venus_helper_session_init(struct venus_inst *inst)
>   	if (ret)
>   		return ret;
>   
> -	inst->clk_data.vpp_freq = hfi_platform_get_codec_vpp_freq(version, codec,
> +	inst->clk_data.vpp_freq = hfi_platform_get_codec_vpp_freq(inst->core,
> +								  version,
> +								  codec,
>   								  session_type);
> -	inst->clk_data.vsp_freq = hfi_platform_get_codec_vsp_freq(version, codec,
> +	inst->clk_data.vsp_freq = hfi_platform_get_codec_vsp_freq(inst->core,
> +								  version,
> +								  codec,
>   								  session_type);
> -	inst->clk_data.low_power_freq = hfi_platform_get_codec_lp_freq(version, codec,
> +	inst->clk_data.low_power_freq = hfi_platform_get_codec_lp_freq(inst->core,
> +								       version,
> +								       codec,
>   								       session_type);
>   
>   	return 0;
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> index 1b3db2caa99f..92765f9c8873 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -282,7 +282,7 @@ static int hfi_platform_parser(struct venus_core *core, struct venus_inst *inst)
>   		return ret;
>   
>   	if (plat->capabilities)
> -		caps = plat->capabilities(&entries);
> +		caps = plat->capabilities(core, &entries);
>   
>   	if (!caps || !entries || !count)
>   		return -EINVAL;
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
> index 643e5aa138f5..cde7f93045ac 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform.c
> +++ b/drivers/media/platform/qcom/venus/hfi_platform.c
> @@ -21,7 +21,9 @@ const struct hfi_platform *hfi_platform_get(enum hfi_version version)
>   }
>   
>   unsigned long
> -hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec, u32 session_type)
> +hfi_platform_get_codec_vpp_freq(struct venus_core *core,
> +				enum hfi_version version, u32 codec,
> +				u32 session_type)
>   {
>   	const struct hfi_platform *plat;
>   	unsigned long freq = 0;
> @@ -31,13 +33,15 @@ hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec, u32 session
>   		return 0;
>   
>   	if (plat->codec_vpp_freq)
> -		freq = plat->codec_vpp_freq(session_type, codec);
> +		freq = plat->codec_vpp_freq(core, session_type, codec);
>   
>   	return freq;
>   }
>   
>   unsigned long
> -hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec, u32 session_type)
> +hfi_platform_get_codec_vsp_freq(struct venus_core *core,
> +				enum hfi_version version, u32 codec,
> +				u32 session_type)
>   {
>   	const struct hfi_platform *plat;
>   	unsigned long freq = 0;
> @@ -47,13 +51,15 @@ hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec, u32 session
>   		return 0;
>   
>   	if (plat->codec_vpp_freq)
> -		freq = plat->codec_vsp_freq(session_type, codec);
> +		freq = plat->codec_vsp_freq(core, session_type, codec);
>   
>   	return freq;
>   }
>   
>   unsigned long
> -hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec, u32 session_type)
> +hfi_platform_get_codec_lp_freq(struct venus_core *core,
> +			       enum hfi_version version, u32 codec,
> +			       u32 session_type)
>   {
>   	const struct hfi_platform *plat;
>   	unsigned long freq = 0;
> @@ -63,13 +69,14 @@ hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec, u32 session_
>   		return 0;
>   
>   	if (plat->codec_lp_freq)
> -		freq = plat->codec_lp_freq(session_type, codec);
> +		freq = plat->codec_lp_freq(core, session_type, codec);
>   
>   	return freq;
>   }
>   
>   int
> -hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codecs, u32 *count)
> +hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs,
> +			u32 *dec_codecs, u32 *count)
>   {
>   	const struct hfi_platform *plat;
>   
> @@ -78,7 +85,7 @@ hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codec
>   		return -EINVAL;
>   
>   	if (plat->codecs)
> -		plat->codecs(enc_codecs, dec_codecs, count);
> +		plat->codecs(core, enc_codecs, dec_codecs, count);
>   
>   	if (IS_IRIS2_1(core)) {
>   		*enc_codecs &= ~HFI_VIDEO_CODEC_VP8;
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
> index ec89a90a8129..5e4f8013a6b1 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform.h
> +++ b/drivers/media/platform/qcom/venus/hfi_platform.h
> @@ -47,11 +47,16 @@ struct hfi_platform_codec_freq_data {
>   };
>   
>   struct hfi_platform {
> -	unsigned long (*codec_vpp_freq)(u32 session_type, u32 codec);
> -	unsigned long (*codec_vsp_freq)(u32 session_type, u32 codec);
> -	unsigned long (*codec_lp_freq)(u32 session_type, u32 codec);
> -	void (*codecs)(u32 *enc_codecs, u32 *dec_codecs, u32 *count);
> -	const struct hfi_plat_caps *(*capabilities)(unsigned int *entries);
> +	unsigned long (*codec_vpp_freq)(struct venus_core *core,
> +					u32 session_type, u32 codec);
> +	unsigned long (*codec_vsp_freq)(struct venus_core *core,
> +					u32 session_type, u32 codec);
> +	unsigned long (*codec_lp_freq)(struct venus_core *core,
> +				       u32 session_type, u32 codec);
> +	void (*codecs)(struct venus_core *core, u32 *enc_codecs,
> +		       u32 *dec_codecs, u32 *count);
> +	const struct hfi_plat_caps *(*capabilities)(struct venus_core *core,
> +						    unsigned int *entries);
>   	int (*bufreq)(struct hfi_plat_buffers_params *params, u32 session_type,
>   		      u32 buftype, struct hfi_buffer_requirements *bufreq);
>   };
> @@ -60,12 +65,15 @@ extern const struct hfi_platform hfi_plat_v4;
>   extern const struct hfi_platform hfi_plat_v6;
>   
>   const struct hfi_platform *hfi_platform_get(enum hfi_version version);
> -unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec,
> -					      u32 session_type);
> -unsigned long hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec,
> -					      u32 session_type);
> -unsigned long hfi_platform_get_codec_lp_freq(enum hfi_version version, u32 codec,
> -					     u32 session_type);
> -int hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs, u32 *dec_codecs,
> -			    u32 *count);
> +unsigned long hfi_platform_get_codec_vpp_freq(struct venus_core *core,
> +					      enum hfi_version version,
> +					      u32 codec, u32 session_type);
> +unsigned long hfi_platform_get_codec_vsp_freq(struct venus_core *core,
> +					      enum hfi_version version,
> +					      u32 codec, u32 session_type);
> +unsigned long hfi_platform_get_codec_lp_freq(struct venus_core *core,
> +					     enum hfi_version version,
> +					     u32 codec, u32 session_type);
> +int hfi_platform_get_codecs(struct venus_core *core, u32 *enc_codecs,
> +			    u32 *dec_codecs, u32 *count);
>   #endif
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v4.c b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> index e3f0a90a567b..41e4dc28ec1b 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> +++ b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> @@ -2,6 +2,7 @@
>   /*
>    * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>    */
> +#include "core.h"
>   #include "hfi_platform.h"
>   
>   static const struct hfi_plat_caps caps[] = {
> @@ -245,14 +246,22 @@ static const struct hfi_plat_caps caps[] = {
>   	.num_fmts = 4,
>   } };
>   
> -static const struct hfi_plat_caps *get_capabilities(unsigned int *entries)
> +static const struct hfi_plat_caps *get_capabilities(struct venus_core *core,
> +						    unsigned int *entries)
>   {
> +	if (is_lite(core))
> +		return NULL;
> +
>   	*entries = ARRAY_SIZE(caps);
>   	return caps;
>   }
>   
> -static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
> +static void get_codecs(struct venus_core *core,
> +		       u32 *enc_codecs, u32 *dec_codecs, u32 *count)
>   {
> +	if (is_lite(core))
> +		return;
> +
>   	*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
>   		      HFI_VIDEO_CODEC_VP8;
>   	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> @@ -273,12 +282,15 @@ static const struct hfi_platform_codec_freq_data codec_freq_data[] =  {
>   };
>   
>   static const struct hfi_platform_codec_freq_data *
> -get_codec_freq_data(u32 session_type, u32 pixfmt)
> +get_codec_freq_data(struct venus_core *core, u32 session_type, u32 pixfmt)
>   {
>   	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
>   	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
>   	const struct hfi_platform_codec_freq_data *found = NULL;
>   
> +	if (is_lite(core))
> +		return NULL;
> +
>   	for (i = 0; i < data_size; i++) {
>   		if (data[i].pixfmt == pixfmt && data[i].session_type == session_type) {
>   			found = &data[i];
> @@ -289,33 +301,36 @@ get_codec_freq_data(u32 session_type, u32 pixfmt)
>   	return found;
>   }
>   
> -static unsigned long codec_vpp_freq(u32 session_type, u32 codec)
> +static unsigned long codec_vpp_freq(struct venus_core *core,
> +				    u32 session_type, u32 codec)
>   {
>   	const struct hfi_platform_codec_freq_data *data;
>   
> -	data = get_codec_freq_data(session_type, codec);
> +	data = get_codec_freq_data(core, session_type, codec);
>   	if (data)
>   		return data->vpp_freq;
>   
>   	return 0;
>   }
>   
> -static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
> +static unsigned long codec_vsp_freq(struct venus_core *core,
> +				    u32 session_type, u32 codec)
>   {
>   	const struct hfi_platform_codec_freq_data *data;
>   
> -	data = get_codec_freq_data(session_type, codec);
> +	data = get_codec_freq_data(core, session_type, codec);
>   	if (data)
>   		return data->vsp_freq;
>   
>   	return 0;
>   }
>   
> -static unsigned long codec_lp_freq(u32 session_type, u32 codec)
> +static unsigned long codec_lp_freq(struct venus_core *core,
> +				   u32 session_type, u32 codec)
>   {
>   	const struct hfi_platform_codec_freq_data *data;
>   
> -	data = get_codec_freq_data(session_type, codec);
> +	data = get_codec_freq_data(core, session_type, codec);
>   	if (data)
>   		return data->low_power_freq;
>   
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6.c b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
> index 4e8af645f8b9..d8568c08cc36 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform_v6.c
> +++ b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
> @@ -2,6 +2,7 @@
>   /*
>    * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>    */
> +#include "core.h"
>   #include "hfi_platform.h"
>   
>   static const struct hfi_plat_caps caps[] = {
> @@ -245,14 +246,22 @@ static const struct hfi_plat_caps caps[] = {
>   	.num_fmts = 4,
>   } };
>   
> -static const struct hfi_plat_caps *get_capabilities(unsigned int *entries)
> +static const struct hfi_plat_caps *get_capabilities(struct venus_core *core,
> +						    unsigned int *entries)
>   {
> +	if (is_lite(core))
> +		return NULL;
> +
>   	*entries = ARRAY_SIZE(caps);
>   	return caps;
>   }
>   
> -static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
> +static void get_codecs(struct venus_core *core, u32 *enc_codecs,
> +		       u32 *dec_codecs, u32 *count)
>   {
> +	if (is_lite(core))
> +		return;
> +
>   	*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
>   		      HFI_VIDEO_CODEC_VP8;
>   	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> @@ -273,12 +282,15 @@ static const struct hfi_platform_codec_freq_data codec_freq_data[] = {
>   };
>   
>   static const struct hfi_platform_codec_freq_data *
> -get_codec_freq_data(u32 session_type, u32 pixfmt)
> +get_codec_freq_data(struct venus_core *core, u32 session_type, u32 pixfmt)
>   {
>   	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
>   	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
>   	const struct hfi_platform_codec_freq_data *found = NULL;
>   
> +	if (is_lite(core))
> +		return NULL;
> +
>   	for (i = 0; i < data_size; i++) {
>   		if (data[i].pixfmt == pixfmt && data[i].session_type == session_type) {
>   			found = &data[i];
> @@ -289,33 +301,36 @@ get_codec_freq_data(u32 session_type, u32 pixfmt)
>   	return found;
>   }
>   
> -static unsigned long codec_vpp_freq(u32 session_type, u32 codec)
> +static unsigned long codec_vpp_freq(struct venus_core *core, u32 session_type,
> +				    u32 codec)
>   {
>   	const struct hfi_platform_codec_freq_data *data;
>   
> -	data = get_codec_freq_data(session_type, codec);
> +	data = get_codec_freq_data(core, session_type, codec);
>   	if (data)
>   		return data->vpp_freq;
>   
>   	return 0;
>   }
>   
> -static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
> +static unsigned long codec_vsp_freq(struct venus_core *core, u32 session_type,
> +				    u32 codec)
>   {
>   	const struct hfi_platform_codec_freq_data *data;
>   
> -	data = get_codec_freq_data(session_type, codec);
> +	data = get_codec_freq_data(core, session_type, codec);
>   	if (data)
>   		return data->vsp_freq;
>   
>   	return 0;
>   }
>   
> -static unsigned long codec_lp_freq(u32 session_type, u32 codec)
> +static unsigned long codec_lp_freq(struct venus_core *core, u32 session_type,
> +				   u32 codec)
>   {
>   	const struct hfi_platform_codec_freq_data *data;
>   
> -	data = get_codec_freq_data(session_type, codec);
> +	data = get_codec_freq_data(core, session_type, codec);
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
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

