Return-Path: <linux-media+bounces-30014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4055A85C37
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 13:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D98281897F34
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 11:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378B1298CAF;
	Fri, 11 Apr 2025 11:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="li8DvGXG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B7720CCEB
	for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 11:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744372263; cv=none; b=sJdilS82HzVeo5NNJwSSjzgt8yit0U9n0vQy6LqJ5PSp55JTRUSNMWb4Yv7/Dazyul7z2EzVsUTiU9wsTa74icY9hlI3XFzAPBEbX3+mzNmgRHX7c8/TR2axsJXmLUt4Upf4fxuP/o4JfBGVHYijo4NMhpFVHuxyJDfiwpP06r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744372263; c=relaxed/simple;
	bh=rmVIEELdiccpnGVakOHyF2AV7oE2dJ4GmRPqtzBJVqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s51RX1LU+d/xKrt621nsXvQU4/IffvWy7/2lN3QvvlsKsxUO0SZeHooNDt7EtBvAmoizIcNnwezTKKaSTDwVFo4k4gugxN9WY38WBq4MMoqRestWjy6Kze/dE37Oqw7kWe7W4IdIRcfkA7txzp1/nSm2ai5opUwN1B57yeuCMQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=li8DvGXG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so19998235e9.1
        for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 04:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744372259; x=1744977059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VvRH61bWBJqPJ5lSusZ8ixCzMyUPIbO6WCfpTSxrPlc=;
        b=li8DvGXGL2bkxy2K5pZpFJ+bX+j18P1vUXAyVYrTdTck0zpobfONVPsVAGrdgkA6vS
         fuBD1nt4HQCMAti/AxJRvRg6kKZEoliINhfI/G7MpOz+HqM7WuOLyfHQ9gSyeEQTk8zy
         Ulsnw6CyMl+eEseJse5Klr+owTWdTLugqaRwAvKi3oPyuhxAyhZ0wjxN02t5sm6C0IO/
         sAO2XzFfw+7SiezldueAdhuMmK4e1xRCadtKGTXgSOgoaiZ/SU3nOYjfjqaHYnGvDGUY
         wlw3ZLWXgFf3pAk7Rx1Zzvygq4dPrV8/7VL1SRvxYAlcU+iOh8XU3vvcf9utdmRl2v9x
         ping==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744372259; x=1744977059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VvRH61bWBJqPJ5lSusZ8ixCzMyUPIbO6WCfpTSxrPlc=;
        b=kICaMQlT+ww4rF+K35J/iFGNXjXKS8RAmT/RBIZ8hNMOTE0m204mNFeXGoyVG2zXqz
         PT3IYGnskINk9A+FnRuRhChE8ocl/jtQgM3a0Utvm5E8wybCA8+Uz/qlITnMSmisz933
         qJ8IbK9Qr55MgFpwOkMVwZvqWKbmykeH9uZTI/Ppiulp/yI+2sRlabpRS2OQZkHKxU1W
         /C8NqWR0R1VvIUM6k3Hzxf/2B2BTwKcrmGktC+8/cx79d0GW61mD7M7uJpyG6yPjoev7
         hUgVsoN7hI+R1f56sI96MPTu+kT+uZegq1MWPmTr7JQWN3/TovEIMNXDmJMs/cyRc7Ab
         uCjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8z8KHsA9woq2ymQXcu2C9iLCEyU45Ne60YsebQN2XEj/4Fm1ujM4lgmstAeV4yuvbf0YV44BgwuS/Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhEglTDCTjTdo38n0Hfmjf+mfyNT4V0V8uOxxXt0PcKo8faU4y
	klFvwS5uPZKJgxuJ+XMDYs+4iHYriMo9ke39NZjBbiwQic94JkUSgdgIyX/Viyg=
X-Gm-Gg: ASbGncsY4/mSNDMgQzq+bvkSc/EuEWsIghjO6FSZdmefEo3aW8sDAHdLXzH8su1zWKE
	ylaSxE1sbXx7WHth7G+yZEp8MMnAs+F4mqBVZQMAi0i2kbBF307Dxr/ObpQa94QidPnG9+Yu+3g
	eNksg7IhetbNLF2VXAE0GUEwUDMrZnww95KXp7jr6obz2ahz1xWDSCEUMVuyKpkdX/fxV9YCFU+
	e2RGm5RnbBz+MniV5jKMHSVxDNtWTaMPrX1A3TCX1deacH18NrbvNYZXoeiLZXb5J2UUQ/s89JY
	nXXidoOneTH62k+jHKnRRFKsoPBP+IzYgSaufHUT5Rjk0lntAcAQ/7ihOvjXYWzujoi+e5qZM4o
	82C01MA==
X-Google-Smtp-Source: AGHT+IHenVaIQvJRRRUrneiJVqeXMAF+K/L3HMjXVFJJP9LYzIk/IHbuIss9SQhhEQOqABI6wbmSJw==
X-Received: by 2002:a05:600c:1546:b0:43c:f597:d582 with SMTP id 5b1f17b1804b1-43f3a9336e6mr20799855e9.1.1744372259327;
        Fri, 11 Apr 2025 04:50:59 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5e9dsm83516675e9.36.2025.04.11.04.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 04:50:58 -0700 (PDT)
Message-ID: <a7f41eaa-74d0-42f6-ba80-afa62a521b7e@linaro.org>
Date: Fri, 11 Apr 2025 12:50:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v5 1/8] media: qcom: iris: move sm8250 to gen1 catalog
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
 <VyOGKudgZHGHSwAUc_c_syksKTaFJrgQwY5885fB812reMOnISG0ito3a9NquHCtVt9W2gENP3ioyZ7e0ne_Fw==@protonmail.internalid>
 <20250410-topic-sm8x50-upstream-iris-catalog-v5-1-44a431574c25@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250410-topic-sm8x50-upstream-iris-catalog-v5-1-44a431574c25@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2025 17:30, Neil Armstrong wrote:
> Re-organize the platform support core into a gen1 catalog C file
> declaring common platform structure and include platform headers
> containing platform specific entries and iris_platform_data
> structure.
> 
> The goal is to share most of the structure while having
> clear and separate per-SoC catalog files.
> 
> The organization is based on the current drm/msm dpu1 catalog
> entries.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/media/platform/qcom/iris/Makefile          |  2 +-
>   .../media/platform/qcom/iris/iris_catalog_gen1.c   | 83 ++++++++++++++++++++++
>   ...ris_platform_sm8250.c => iris_catalog_sm8250.h} | 80 ++-------------------
>   3 files changed, 89 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 35390534534e93f4617c1036a05ca0921567ba1d..7e7bc5ca81e0f0119846ccaff7f79fd17b8298ca 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -25,7 +25,7 @@ qcom-iris-objs += \
>                iris_vpu_common.o \
> 
>   ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
> -qcom-iris-objs += iris_platform_sm8250.o
> +qcom-iris-objs += iris_catalog_gen1.o
>   endif
> 
>   obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
> diff --git a/drivers/media/platform/qcom/iris/iris_catalog_gen1.c b/drivers/media/platform/qcom/iris/iris_catalog_gen1.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..c4590f8996431eb5103d45f01c6bee2b38b848c2
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_catalog_gen1.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include "iris_core.h"
> +#include "iris_ctrls.h"
> +#include "iris_platform_common.h"
> +#include "iris_resources.h"
> +#include "iris_hfi_gen1.h"
> +#include "iris_hfi_gen1_defines.h"
> +#include "iris_vpu_common.h"

Any reason why these aren't alphabetised ?

Please do so unless there's some technical reason to have in this order.

> +
> +/* Common SM8250 & variants */
> +static struct platform_inst_fw_cap inst_fw_cap_sm8250[] = {
> +	{
> +		.cap_id = PIPE,
> +		.min = PIPE_1,
> +		.max = PIPE_4,
> +		.step_or_mask = 1,
> +		.value = PIPE_4,
> +		.hfi_id = HFI_PROPERTY_PARAM_WORK_ROUTE,
> +		.set = iris_set_pipe,
> +	},
> +	{
> +		.cap_id = STAGE,
> +		.min = STAGE_1,
> +		.max = STAGE_2,
> +		.step_or_mask = 1,
> +		.value = STAGE_2,
> +		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
> +		.set = iris_set_stage,
> +	},
> +	{
> +		.cap_id = DEBLOCK,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER,
> +		.set = iris_set_u32,
> +	},
> +};
> +
> +static struct platform_inst_caps platform_inst_cap_sm8250 = {
> +	.min_frame_width = 128,
> +	.max_frame_width = 8192,
> +	.min_frame_height = 128,
> +	.max_frame_height = 8192,
> +	.max_mbpf = 138240,
> +	.mb_cycles_vsp = 25,
> +	.mb_cycles_vpp = 200,
> +};
> +
> +static struct tz_cp_config tz_cp_config_sm8250 = {
> +	.cp_start = 0,
> +	.cp_size = 0x25800000,
> +	.cp_nonpixel_start = 0x01000000,
> +	.cp_nonpixel_size = 0x24800000,
> +};
> +
> +static const u32 sm8250_vdec_input_config_param_default[] = {
> +	HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE,
> +	HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
> +	HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO,
> +	HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL,
> +	HFI_PROPERTY_PARAM_VDEC_MULTI_STREAM,
> +	HFI_PROPERTY_PARAM_FRAME_SIZE,
> +	HFI_PROPERTY_PARAM_BUFFER_SIZE_ACTUAL,
> +	HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE,
> +};
> +
> +static const u32 sm8250_dec_ip_int_buf_tbl[] = {
> +	BUF_BIN,
> +	BUF_SCRATCH_1,
> +};
> +
> +static const u32 sm8250_dec_op_int_buf_tbl[] = {
> +	BUF_DPB,
> +};
> +
> +/* platforms catalogs */
> +#include "iris_catalog_sm8250.h"
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_catalog_sm8250.h
> similarity index 59%
> rename from drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> rename to drivers/media/platform/qcom/iris/iris_catalog_sm8250.h
> index 5c86fd7b7b6fd36dc2d57a1705d915308b4c0f92..4d2df669b3e1df2ef2b0d2f88fc5f309b27546db 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_catalog_sm8250.h
> @@ -1,55 +1,10 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> +/* SPDX-License-Identifier: GPL-2.0-only */
>   /*
>    * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
> 
> -#include "iris_core.h"
> -#include "iris_ctrls.h"
> -#include "iris_platform_common.h"
> -#include "iris_resources.h"
> -#include "iris_hfi_gen1.h"
> -#include "iris_hfi_gen1_defines.h"
> -#include "iris_vpu_common.h"
> -
> -static struct platform_inst_fw_cap inst_fw_cap_sm8250[] = {
> -	{
> -		.cap_id = PIPE,
> -		.min = PIPE_1,
> -		.max = PIPE_4,
> -		.step_or_mask = 1,
> -		.value = PIPE_4,
> -		.hfi_id = HFI_PROPERTY_PARAM_WORK_ROUTE,
> -		.set = iris_set_pipe,
> -	},
> -	{
> -		.cap_id = STAGE,
> -		.min = STAGE_1,
> -		.max = STAGE_2,
> -		.step_or_mask = 1,
> -		.value = STAGE_2,
> -		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
> -		.set = iris_set_stage,
> -	},
> -	{
> -		.cap_id = DEBLOCK,
> -		.min = 0,
> -		.max = 1,
> -		.step_or_mask = 1,
> -		.value = 0,
> -		.hfi_id = HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER,
> -		.set = iris_set_u32,
> -	},
> -};
> -
> -static struct platform_inst_caps platform_inst_cap_sm8250 = {
> -	.min_frame_width = 128,
> -	.max_frame_width = 8192,
> -	.min_frame_height = 128,
> -	.max_frame_height = 8192,
> -	.max_mbpf = 138240,
> -	.mb_cycles_vsp = 25,
> -	.mb_cycles_vpp = 200,
> -};
> +#ifndef _IRIS_CATALOG_SM8250_H
> +#define _IRIS_CATALOG_SM8250_H

__IRIS_CATALOG_SM8250_H__ as with other header guards.

> 
>   static void iris_set_sm8250_preset_registers(struct iris_core *core)
>   {
> @@ -80,33 +35,6 @@ static const struct platform_clk_data sm8250_clk_table[] = {
>   	{IRIS_HW_CLK,   "vcodec0_core" },
>   };
> 
> -static struct tz_cp_config tz_cp_config_sm8250 = {
> -	.cp_start = 0,
> -	.cp_size = 0x25800000,
> -	.cp_nonpixel_start = 0x01000000,
> -	.cp_nonpixel_size = 0x24800000,
> -};
> -
> -static const u32 sm8250_vdec_input_config_param_default[] = {
> -	HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE,
> -	HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
> -	HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO,
> -	HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL,
> -	HFI_PROPERTY_PARAM_VDEC_MULTI_STREAM,
> -	HFI_PROPERTY_PARAM_FRAME_SIZE,
> -	HFI_PROPERTY_PARAM_BUFFER_SIZE_ACTUAL,
> -	HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE,
> -};
> -
> -static const u32 sm8250_dec_ip_int_buf_tbl[] = {
> -	BUF_BIN,
> -	BUF_SCRATCH_1,
> -};
> -
> -static const u32 sm8250_dec_op_int_buf_tbl[] = {
> -	BUF_DPB,
> -};
> -
>   struct iris_platform_data sm8250_data = {
>   	.get_instance = iris_hfi_gen1_get_instance,
>   	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
> @@ -147,3 +75,5 @@ struct iris_platform_data sm8250_data = {
>   	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
>   	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
>   };
> +
> +#endif
> 
> --
> 2.34.1
> 
> 
Once done.
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

