Return-Path: <linux-media+bounces-41996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A8EB48D93
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 14:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AFDA169743
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 12:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E8E1EB5B;
	Mon,  8 Sep 2025 12:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JzojU/YI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9BD211706
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 12:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757334759; cv=none; b=pGo64ceFDBJtbm1a0JfvaLLCuciZtrY7SqL7pLLCKUDybbr9qW3gSNwW6rkFLQYVyH1UpWr+Do3kR6nSiEQyAhpoheGAsXLwS7WC3Jfrs34qkYrl5NR2Aea4ligTwlOSyaOVL9/yHpUx+oEr8g/WA+LUrZDRiN6PyWgeUQA/yi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757334759; c=relaxed/simple;
	bh=EuIJ8wTTztQSwczu+4EYpDQ52uZd3krpxgRV1EHMb98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SRC6vhzELqWKylgukkwFbwnFeLZdGywaQ26wzO8TfCXcPu7lScrW0bVAinG9QlTDpufXNr4cW0oqnL+eaq2dt26el1IPalN96l5NzLJiTS3bc6zkg7gPNEzNA9Gr71E0V/2y3eFmBCyH+su1R0N6xdtO5f46G9J6adxQ/pzBRAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JzojU/YI; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3d19699240dso3204170f8f.1
        for <linux-media@vger.kernel.org>; Mon, 08 Sep 2025 05:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757334755; x=1757939555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L7JrJj7hfg8WcwQZ+ifRTrYenMBYzDlOQo3AKnc95e8=;
        b=JzojU/YIthZLKzqKqc/fqSvZ7nWKbgsXt6IXjpRSdvHNS+CNFyC8ufc7Lqe/dW+qWC
         bWif6pnhGbaGSX6fTDikEk4JHfLEchl3A2ZCWRxXP4RccR9B3GwkvxH3xGhdh+RGoPHo
         0q1iMoO2zFbiCRawRJOM7A04iqfmuJs9ABGFsUadnZTS3YIc7nwP/x/7PprRVvZErKPF
         kDBSdfa8zDEriku6w/y6lNVvacMqnLw3X2K1xdc6AIAyaTi2sNNyDdcthxiZw8+9NxF6
         PvRQYWx4cEfYJPh+v7w/A3L0EO2AUdkRkxZ8u6/Pnbakcf+yxLqYQnwOT5fcBJGrP7tZ
         Vtag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757334755; x=1757939555;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L7JrJj7hfg8WcwQZ+ifRTrYenMBYzDlOQo3AKnc95e8=;
        b=OC8xmfYm60zumpsn+ydexVsiet04ubeUPatmhVZKO2our28wuT6Oarz4OcagNnVM8p
         VJxU3Z5Dkdah4KjUtjTfhp4EtgNkoldNHflhEj9dGVZWrijoGilHS83P0RFgrqamaaJf
         tJ8nuwmbbyrvtwWWmYmJs7p5zXFH1tS9dgSb/G6kV4GoGIbRolV3xIZcPye6mMRHSvEX
         pNCqczFGVHm8struvVAgoLdx6MlP22hsp3kjlHG3/DoIIvAlh5j2blZtqXBPpDL1xvDx
         +yFHzjT77CZYX4OZYV+u97aCdCVYGVBITJPAhGqm35+b/Fs8uGksl8vjtlQ7mG49KgB7
         fhlQ==
X-Gm-Message-State: AOJu0YxBouHRl1WflCJvs3PPNSfEEphh3D51CqHnjAV2HuifypDoYl0B
	N7KReerM1zzR1g9LTuB1TccSs1R7cY28/7bkvPNZ9B+/mau1XXHBudPVMPJ6WThu9v8=
X-Gm-Gg: ASbGncvLV+6pX85/YLxQs3+wL3K80GkDX+nWSbPX4qkJ9L2kLVeWLZbICAdN0sZH2PT
	vAAwCPfoWEo2ZBRwWK+GjvQsWmhVE4l/tQvH9d/JkqILAhTC0xx2qdHRFw8vxVqBn8kFZ4zGdlI
	Dl0Q8bw5R95uYr+O9tLCY5DiUMP5xTV1bU6vo1P/4jHQQY+GcVRtOYorxjWECkUmFE4hwETi8k6
	52VHwIKbHNhOIpe8Bj+RKU6sUhD3LhK57X4w+LdJ2PZSdXulTA4W7j2cbDkotiptTax53+640mk
	NVLdYT6n9SIvAO7NleqkEr/wlW5qGBXvGRDq0NV4zteMMl2HSbBXmaL3bt29Ps4e9VY/8AlWKn6
	rXAgQDcify7+Z5rtRgN6tcKO8y/lBFjDs8YAjb0gHeTlxKt/DUfFOz1DPRyM+UOdL1t5HZ7B0e7
	7ZuvbDifctM4qv5GVABZQ=
X-Google-Smtp-Source: AGHT+IGKfPGCHhCNGK5kCACB8j098nFnhJq/6aFjiyOH9YdkvcTJcZtgirz3G2BfdQir17nbY6CnNQ==
X-Received: by 2002:adf:eb8f:0:b0:3e5:5261:9fae with SMTP id ffacd0b85a97d-3e55261a1ccmr5423765f8f.12.1757334755283;
        Mon, 08 Sep 2025 05:32:35 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45c447244c4sm244282425e9.6.2025.09.08.05.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 05:32:34 -0700 (PDT)
Message-ID: <aa6d350c-4de4-45c6-a796-fe7ab1620102@linaro.org>
Date: Mon, 8 Sep 2025 13:32:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] media: iris: Add support for SM8750 (VPU v3.5)
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250902-sm8750-iris-v3-0-564488b412d2@linaro.org>
 <20250902-sm8750-iris-v3-3-564488b412d2@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250902-sm8750-iris-v3-3-564488b412d2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2025 13:45, Krzysztof Kozlowski wrote:
> Add support for SM8750 Iris codec with major differences against
> previous generation SM8650:
> 
> 1. New clocks and new resets, thus new power up and power down
>     sequences,
> 
> 2. New WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0 register programmed
>     during boot-up
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../platform/qcom/iris/iris_platform_common.h      |   6 +-
>   .../media/platform/qcom/iris/iris_platform_gen2.c  |  68 +++++++++
>   .../platform/qcom/iris/iris_platform_sm8750.h      |  22 +++
>   drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 166 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |   4 +
>   drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
>   7 files changed, 271 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index adafdce8a856f9c661aabc5ca28f0faceaa93551..fd5a6e69e01cfd00253f4ffb282d40112b93073b 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -38,11 +38,15 @@ extern struct iris_platform_data qcs8300_data;
>   extern struct iris_platform_data sm8250_data;
>   extern struct iris_platform_data sm8550_data;
>   extern struct iris_platform_data sm8650_data;
> +extern struct iris_platform_data sm8750_data;
>   
>   enum platform_clk_type {
> -	IRIS_AXI_CLK,
> +	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
>   	IRIS_CTRL_CLK,
>   	IRIS_HW_CLK,
> +	IRIS_AXI1_CLK,
> +	IRIS_CTRL_FREERUN_CLK,
> +	IRIS_HW_FREERUN_CLK,
>   };
>   
>   struct platform_clk_data {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index d3026b2bcb708c7ec31f134f628df7e57b54af4f..c7c384fce2332255ea96da69ef4dc0bc1a24771c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2025 Linaro Ltd
>    */
>   
>   #include "iris_core.h"
> @@ -12,6 +13,7 @@
>   
>   #include "iris_platform_qcs8300.h"
>   #include "iris_platform_sm8650.h"
> +#include "iris_platform_sm8750.h"
>   
>   #define VIDEO_ARCH_LX 1
>   
> @@ -463,6 +465,72 @@ struct iris_platform_data sm8650_data = {
>   	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>   };
>   
> +struct iris_platform_data sm8750_data = {
> +	.get_instance = iris_hfi_gen2_get_instance,
> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.vpu_ops = &iris_vpu35_ops,
> +	.set_preset_registers = iris_set_sm8550_preset_registers,
> +	.icc_tbl = sm8550_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> +	.clk_rst_tbl = sm8750_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8750_clk_reset_table),
> +	.bw_tbl_dec = sm8550_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> +	.pmdomain_tbl = sm8550_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> +	.opp_pd_tbl = sm8550_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> +	.clk_tbl = sm8750_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sm8750_clk_table),
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu35_p4.mbn",
> +	.pas_id = IRIS_PAS_ID,
> +	.inst_caps = &platform_inst_cap_sm8550,
> +	.inst_fw_caps = inst_fw_cap_sm8550,
> +	.inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_sm8550),
> +	.tz_cp_config_data = &tz_cp_config_sm8550,
> +	.core_arch = VIDEO_ARCH_LX,
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.ubwc_config = &ubwc_config_sm8550,
> +	.num_vpp_pipe = 4,
> +	.max_session_count = 16,
> +	.max_core_mbpf = NUM_MBS_8K * 2,
> +	.input_config_params_default =
> +		sm8550_vdec_input_config_params_default,
> +	.input_config_params_default_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
> +	.input_config_params_hevc =
> +		sm8550_vdec_input_config_param_hevc,
> +	.input_config_params_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
> +	.input_config_params_vp9 =
> +		sm8550_vdec_input_config_param_vp9,
> +	.input_config_params_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
> +	.output_config_params =
> +		sm8550_vdec_output_config_params,
> +	.output_config_params_size =
> +		ARRAY_SIZE(sm8550_vdec_output_config_params),
> +	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
> +	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
> +	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
> +	.dec_output_prop_avc_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
> +	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
> +	.dec_output_prop_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
> +	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
> +	.dec_output_prop_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
> +
> +	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
> +	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
> +};
> +
>   /*
>    * Shares most of SM8550 data except:
>    * - inst_caps to platform_inst_cap_qcs8300
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8750.h b/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..719056656a5baf48a7bced634d2582629333cf5c
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8750.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Linaro Ltd
> + */
> +
> +#ifndef __MEDIA_IRIS_PLATFORM_SM8750_H__
> +#define __MEDIA_IRIS_PLATFORM_SM8750_H__
> +
> +static const char * const sm8750_clk_reset_table[] = {
> +	"bus0", "bus1", "core", "vcodec0_core"
> +};
> +
> +static const struct platform_clk_data sm8750_clk_table[] = {
> +	{IRIS_AXI_CLK,		"iface"			},
> +	{IRIS_CTRL_CLK,		"core"			},
> +	{IRIS_HW_CLK,		"vcodec0_core"		},
> +	{IRIS_AXI1_CLK,		"iface1"		},
> +	{IRIS_CTRL_FREERUN_CLK,	"core_freerun"		},
> +	{IRIS_HW_FREERUN_CLK,	"vcodec0_core_freerun"	},
> +};
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 4e6e92357968d7419f114cc0ffa9b571bad19e46..5fb936a04155e72f4298cd6760eff6e9d1da6310 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -353,6 +353,10 @@ static const struct of_device_id iris_dt_match[] = {
>   		.compatible = "qcom,sm8650-iris",
>   		.data = &sm8650_data,
>   	},
> +	{
> +		.compatible = "qcom,sm8750-iris",
> +		.data = &sm8750_data,
> +	},
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(of, iris_dt_match);
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 27b8589afe6d1196d7486b1307787e4adca8c2aa..339776a0b4672e246848c3a6a260eb83c7da6a60 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2025 Linaro Ltd
>    */
>   
>   #include <linux/iopoll.h>
> @@ -24,6 +25,8 @@
>   #define NOC_LPI_STATUS_ACTIVE		BIT(2) /* Indicates the NOC is active */
>   #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
>   #define CORE_CLK_RUN				0x0
> +/* VPU v3.5 */
> +#define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
>   
>   #define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
>   #define CTL_AXI_CLK_HALT			BIT(0)
> @@ -55,6 +58,8 @@
>   #define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
>   #define NOC_HALT				BIT(0)
>   #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
> +#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL	(AON_BASE_OFFS + 0x2C)
> +#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS	(AON_BASE_OFFS + 0x30)
>   
>   static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
>   {
> @@ -253,6 +258,158 @@ static int iris_vpu33_power_off_controller(struct iris_core *core)
>   	return 0;
>   }
>   
> +static int iris_vpu35_power_on_hw(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
> +	if (ret)
> +		goto err_disable_power;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_HW_FREERUN_CLK);
> +	if (ret)
> +		goto err_disable_axi_clk;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
> +	if (ret)
> +		goto err_disable_hw_free_clk;
> +
> +	ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
> +	if (ret)
> +		goto err_disable_hw_clk;
> +
> +	return 0;
> +
> +err_disable_hw_clk:
> +	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> +err_disable_hw_free_clk:
> +	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
> +err_disable_axi_clk:
> +	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
> +err_disable_power:
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +
> +	return ret;
> +}
> +
> +static void iris_vpu35_power_off_hw(struct iris_core *core)
> +{
> +	iris_vpu33_power_off_hardware(core);
> +
> +	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
> +}
> +
> +static int iris_vpu35_power_off_controller(struct iris_core *core)
> +{
> +	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
> +	unsigned int count = 0;
> +	u32 val = 0;
> +	bool handshake_done, handshake_busy;
> +	int ret;
> +
> +	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
> +
> +	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
> +
> +	ret = readl_poll_timeout(core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
> +				 val, val & BIT(0), 200, 2000);
> +	if (ret)
> +		goto disable_power;
> +
> +	writel(0, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
> +
> +	/* Retry up to 1000 times as recommended by hardware documentation */
> +	do {
> +		/* set MNoC to low power */
> +		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
> +
> +		udelay(15);
> +
> +		val = readl(core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS);
> +
> +		handshake_done = val & NOC_LPI_STATUS_DONE;
> +		handshake_busy = val & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
> +
> +		if (handshake_done || !handshake_busy)
> +			break;
> +
> +		writel(0, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
> +
> +		udelay(15);
> +
> +	} while (++count < 1000);
> +
> +	if (!handshake_done && handshake_busy)
> +		dev_err(core->dev, "LPI handshake timeout\n");
> +
> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS,
> +				 val, val & BIT(0), 200, 2000);
> +	if (ret)
> +		goto disable_power;
> +
> +	writel(0, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
> +
> +	writel(0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
> +
> +	ret = readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
> +				 val, val == 0, 200, 2000);
> +	if (ret)
> +		goto disable_power;
> +
> +disable_power:
> +	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
> +
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +
> +	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
> +
> +	return 0;
> +}
> +
> +static int iris_vpu35_power_on_controller(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_AXI1_CLK);
> +	if (ret)
> +		goto err_disable_power;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_CTRL_FREERUN_CLK);
> +	if (ret)
> +		goto err_disable_axi1_clk;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
> +	if (ret)
> +		goto err_disable_ctrl_free_clk;
> +
> +	return 0;
> +
> +err_disable_ctrl_free_clk:
> +	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
> +err_disable_axi1_clk:
> +	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
> +err_disable_power:
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +
> +	return ret;
> +}
> +
> +static void iris_vpu35_program_bootup_registers(struct iris_core *core)
> +{
> +	writel(0x1, core->reg_base + WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0);
> +}
> +
>   static u64 iris_vpu3x_calculate_frequency(struct iris_inst *inst, size_t data_size)
>   {
>   	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
> @@ -305,3 +462,12 @@ const struct vpu_ops iris_vpu33_ops = {
>   	.power_on_controller = iris_vpu_power_on_controller,
>   	.calc_freq = iris_vpu3x_calculate_frequency,
>   };
> +
> +const struct vpu_ops iris_vpu35_ops = {
> +	.power_off_hw = iris_vpu35_power_off_hw,
> +	.power_on_hw = iris_vpu35_power_on_hw,
> +	.power_off_controller = iris_vpu35_power_off_controller,
> +	.power_on_controller = iris_vpu35_power_on_controller,
> +	.program_bootup_registers = iris_vpu35_program_bootup_registers,
> +	.calc_freq = iris_vpu3x_calculate_frequency,
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 6c51002f72ab3d9e16d5a2a50ac712fac91ae25c..bb98950e018fadf69ac4f41b3037f7fd6ac33c5b 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -84,6 +84,7 @@ static void iris_vpu_interrupt_init(struct iris_core *core)
>   static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
>   {
>   	u32 queue_size, value;
> +	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
>   
>   	/* Iris hardware requires 4K queue alignment */
>   	queue_size = ALIGN(sizeof(struct iris_hfi_queue_table_header) +
> @@ -105,6 +106,9 @@ static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
>   		value = (u32)core->sfr_daddr + core->iris_platform_data->core_arch;
>   		writel(value, core->reg_base + SFR_ADDR);
>   	}
> +
> +	if (vpu_ops->program_bootup_registers)
> +		vpu_ops->program_bootup_registers(core);
>   }
>   
>   int iris_vpu_boot_firmware(struct iris_core *core)
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index d95b305ca5a89ba8f08aefb6e6acd9ea4a721a8b..d636e287457adf0c44540af5c85cfa69decbca8b 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -11,12 +11,14 @@ struct iris_core;
>   extern const struct vpu_ops iris_vpu2_ops;
>   extern const struct vpu_ops iris_vpu3_ops;
>   extern const struct vpu_ops iris_vpu33_ops;
> +extern const struct vpu_ops iris_vpu35_ops;
>   
>   struct vpu_ops {
>   	void (*power_off_hw)(struct iris_core *core);
>   	int (*power_on_hw)(struct iris_core *core);
>   	int (*power_off_controller)(struct iris_core *core);
>   	int (*power_on_controller)(struct iris_core *core);
> +	void (*program_bootup_registers)(struct iris_core *core);
>   	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
>   };
>   
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

