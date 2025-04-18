Return-Path: <linux-media+bounces-30539-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 396E3A9360E
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 12:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EA5B7AEB8D
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 10:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1904A270ED2;
	Fri, 18 Apr 2025 10:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OJkJhd3I"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BFD204C26
	for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 10:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744972549; cv=none; b=aAHtDQ6cI7yzzlSHdo2B/UVOviChAn8RYY1p3V//MB6qSU+1/rxLjjKKaANur60FkkhCAeiy6WzLSMcyKG1liNNxvd7X3ThqNiVISXSvIY/RV4LIj7I8SkZEfvM20uoLy/HKsGCFjTp8m+kjDHp8IY8tZeUO4b4i37IFyOcNLSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744972549; c=relaxed/simple;
	bh=qfCYl+OJzIRFinR3TpG+qTi/erJTDER0ehv05sjy6vQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jNw8XFKhrIQd9eBa4Em/M+XC9nZgNCbiv2KJpdGgmNWLwAxasFY9dNOJDeF2XykYHkuCQusIUTQQ2bPi9b6GBA4Udg3J8jT87PmkT4U3iHlyVZuj/MzwOrySgMZDHS1TJ796uwexAqZ/2hqb2EpuOFXB5P/BfrtwpxZTQvMho88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OJkJhd3I; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39bf44be22fso1179527f8f.0
        for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 03:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744972545; x=1745577345; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XyW2t+GtwgeOQ8iFogAaRYVPbyvbI7FZnfPpco3ULPs=;
        b=OJkJhd3I8ofGTvelv+oxsLn18zOm3NDtUWhryu8yiE6fhaICQ1f+WcrRt+/Fw2RmVM
         Y9SlUMsxIRKWYp+9h31FgcqK4MzZktONf3lAkqrl8vv9lxAQ0WhhQvqrkwr+9C+++LAq
         VlzAlnzqmsVdU9b/kKXq2Bu+QPFtbVd7EU1wEY/UmVqNFVoEaNmn31UUgKpBAYEdi3FE
         zDZcRU96NeMtNgDpe3h15m+ncNjPITqx6EuS6C4u6pOTR6z8V+7na8W4wF1djSU2nKeC
         2NxzlgYpzLRaqFKPYgigC7yUtaezaCB/aReTbaCrwQAOBA4swy2SNAdNuhdSzfi3rVNH
         z4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744972545; x=1745577345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XyW2t+GtwgeOQ8iFogAaRYVPbyvbI7FZnfPpco3ULPs=;
        b=LEcrHA4mrMq0VDwNR0EOKNOiMLgldsTcjuhgd+ZUAtj//G+EsF5zoBe2plEFDEaTPy
         wPh6e2F0IVSEx0BZnF5T1bN6YC84smsnfA919BZi4MzakT8afHLW7P/18r53AbCDUnO3
         p5/+WHGg2/RdJ/KyFp7hruc0rJxarTFy9whmw21+O1CMMmMzawk5w0LMVKj/ENxXRgVu
         vODNT0zxEzzNd9JFwAcyBMOJX70CvLkV2Y6oRHEugBqmnLLUFqHcE6Eyl626tM8H2l4H
         OAY5uAvEJtgUllvTIkQD9OoPqPoJEvWGAGT+OANiuXwrdOz5zhNpYAxkHjVzjcO2ihYp
         XAwQ==
X-Gm-Message-State: AOJu0YwiD9dnexkttJhyJVUDKhhphJszONZmY26H4mJkFAvdHW2QFnz/
	ib2nHuBuus5aIMYqkjAPYFshoIV1rKy5Pulll5kBN+2Yq022hfC3X7nA33WNnBU=
X-Gm-Gg: ASbGncsubAFFd2NSeWmf3e7mbbfcuqps8DYGAJzdRbQdK3bhkAcEpN5a9J6YzCaPyU+
	nebZtXBvUtVAH2aTWwv545lIizXAyn0hEcg1t3jRX7wm47IRG65TftLpBxeVhQMleIZOKajZ5Cs
	Y38WFX9BbVoilwThWnEXyDS/ApfLh8re6Wzv1pK64l7ndJA/DMfj70/Zf3fr6pbQ8+aTNj0bLvq
	xM8jSZuUBFAhP19D3vWD0eg/29txMNVAx06SDbj49jcRGNcNPqpuj+FUgSEerTqCJg9P91y3cRb
	gR7TnxxXt+dpKkEWvsZ8MHJB1feVrNpVRJSWPUtkrYDRXIDBMLvePvj5pd97pVu3X9xaaOwdab1
	I/l2oYQ==
X-Google-Smtp-Source: AGHT+IG1ldrPaFqZ19ooBr1X8BkUfim3jehNH+IxNKoWTFlbOTGloFPIDBOe5Sy+jV5arTlmIQ6fJg==
X-Received: by 2002:a05:6000:1acb:b0:390:f6aa:4e80 with SMTP id ffacd0b85a97d-39efbaf1ee3mr1914119f8f.53.1744972544885;
        Fri, 18 Apr 2025 03:35:44 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5bbd35sm17111785e9.22.2025.04.18.03.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 03:35:44 -0700 (PDT)
Message-ID: <59ffb7c7-95b8-47e9-91ab-3c7cd7b3fe02@linaro.org>
Date: Fri, 18 Apr 2025 11:35:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] media: iris: add qcs8300 platform data
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250418-qcs8300_iris-v2-0-1e01385b90e9@quicinc.com>
 <20250418-qcs8300_iris-v2-4-1e01385b90e9@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250418-qcs8300_iris-v2-4-1e01385b90e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/04/2025 07:28, Vikash Garodia wrote:
> QCS8300 has a downscaled video core compared to SM8550, while it has
> same bindings as that of SM8550. QCS8300.h captures the capabilities for
> QCS8300 which is delta from SM8550.

QCS8300 as a down-scaled .... compared to the SM8550.
QSC8300 has the same bindings as SM8550 ?

Actually that makes not a world of sense as I read it.

I'd suggest rewording this commit to just state what the QSC8300 itself 
can do without assuming the reader has any prior knowledge of the SM8550.

Same comment for the other commits.

Tell us what the QCS8300 is and what it does.

> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   .../platform/qcom/iris/iris_platform_common.h      |   1 +
>   .../media/platform/qcom/iris/iris_platform_gen2.c  |  57 ++++++++++
>   .../platform/qcom/iris/iris_platform_qcs8300.h     | 124 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>   4 files changed, 186 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 6bc3a7975b04d612f6c89206eae95dac678695fc..3191a910653ce4bd71de9a0b4465fd583602adf6 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -36,6 +36,7 @@ enum pipe_type {
>   extern struct iris_platform_data sm8250_data;
>   extern struct iris_platform_data sm8550_data;
>   extern struct iris_platform_data sm8650_data;
> +extern struct iris_platform_data qcs8300_data;
>   
>   enum platform_clk_type {
>   	IRIS_AXI_CLK,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5ff82296ee8ea5ad3954bd2254594048adcb8404..723e9f4cef42408168aca22b34ccd0a674a4fd25 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -11,6 +11,7 @@
>   #include "iris_vpu_common.h"
>   
>   #include "iris_platform_sm8650.h"
> +#include "iris_platform_qcs8300.h"
>   
>   #define VIDEO_ARCH_LX 1
>   
> @@ -326,3 +327,59 @@ struct iris_platform_data sm8650_data = {
>   	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>   	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>   };
> +
> +/*
> + * Shares most of SM8550 data except:
> + * - inst_caps to platform_inst_cap_qcs8300
> + * - inst_fw_caps to inst_fw_cap_qcs8300
> + */
> +struct iris_platform_data qcs8300_data = {
> +	.get_instance = iris_hfi_gen2_get_instance,
> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.vpu_ops = &iris_vpu3_ops,
> +	.set_preset_registers = iris_set_sm8550_preset_registers,
> +	.icc_tbl = sm8550_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> +	.clk_rst_tbl = sm8550_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
> +	.bw_tbl_dec = sm8550_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> +	.pmdomain_tbl = sm8550_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> +	.opp_pd_tbl = sm8550_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> +	.clk_tbl = sm8550_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
> +	.pas_id = IRIS_PAS_ID,
> +	.inst_caps = &platform_inst_cap_qcs8300,
> +	.inst_fw_caps = inst_fw_cap_qcs8300,
> +	.inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_qcs8300),
> +	.tz_cp_config_data = &tz_cp_config_sm8550,
> +	.core_arch = VIDEO_ARCH_LX,
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.ubwc_config = &ubwc_config_sm8550,
> +	.num_vpp_pipe = 2,
> +	.max_session_count = 16,
> +	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
> +	.input_config_params =
> +		sm8550_vdec_input_config_params,
> +	.input_config_params_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_params),
> +	.output_config_params =
> +		sm8550_vdec_output_config_params,
> +	.output_config_params_size =
> +		ARRAY_SIZE(sm8550_vdec_output_config_params),
> +	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
> +	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
> +	.dec_output_prop = sm8550_vdec_subscribe_output_properties,
> +	.dec_output_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
> +
> +	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
> +	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..f82355d72fcffe7e361bd30877cccb83fe9b549f
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> @@ -0,0 +1,124 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +static struct platform_inst_fw_cap inst_fw_cap_qcs8300[] = {
> +	{
> +		.cap_id = PROFILE,
> +		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> +		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> +			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
> +			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> +			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> +			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
> +		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +		.hfi_id = HFI_PROP_PROFILE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = LEVEL,
> +		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> +		.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B)  |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_1) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_2),
> +		.value = V4L2_MPEG_VIDEO_H264_LEVEL_6_1,
> +		.hfi_id = HFI_PROP_LEVEL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
> +		.min = DEFAULT_MAX_HOST_BUF_COUNT,
> +		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
> +		.step_or_mask = 1,
> +		.value = DEFAULT_MAX_HOST_BUF_COUNT,
> +		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +		.set = iris_set_u32,
> +	},
> +	{
> +		.cap_id = STAGE,
> +		.min = STAGE_1,
> +		.max = STAGE_2,
> +		.step_or_mask = 1,
> +		.value = STAGE_2,
> +		.hfi_id = HFI_PROP_STAGE,
> +		.set = iris_set_stage,
> +	},
> +	{
> +		.cap_id = PIPE,
> +		.min = PIPE_1,
> +		.max = PIPE_2,
> +		.step_or_mask = 1,
> +		.value = PIPE_2,
> +		.hfi_id = HFI_PROP_PIPE,
> +		.set = iris_set_pipe,
> +	},
> +	{
> +		.cap_id = POC,
> +		.min = 0,
> +		.max = 2,
> +		.step_or_mask = 1,
> +		.value = 1,
> +		.hfi_id = HFI_PROP_PIC_ORDER_CNT_TYPE,
> +	},
> +	{
> +		.cap_id = CODED_FRAMES,
> +		.min = CODED_FRAMES_PROGRESSIVE,
> +		.max = CODED_FRAMES_PROGRESSIVE,
> +		.step_or_mask = 0,
> +		.value = CODED_FRAMES_PROGRESSIVE,
> +		.hfi_id = HFI_PROP_CODED_FRAMES,
> +	},
> +	{
> +		.cap_id = BIT_DEPTH,
> +		.min = BIT_DEPTH_8,
> +		.max = BIT_DEPTH_8,
> +		.step_or_mask = 1,
> +		.value = BIT_DEPTH_8,
> +		.hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> +	},
> +	{
> +		.cap_id = RAP_FRAME,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 1,
> +		.hfi_id = HFI_PROP_DEC_START_FROM_RAP_FRAME,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +		.set = iris_set_u32,
> +	},
> +};
> +
> +static struct platform_inst_caps platform_inst_cap_qcs8300 = {
> +	.min_frame_width = 96,
> +	.max_frame_width = 4096,
> +	.min_frame_height = 96,
> +	.max_frame_height = 4096,
> +	.max_mbpf = (4096 * 2176) / 256,
> +	.mb_cycles_vpp = 200,
> +	.mb_cycles_fw = 326389,
> +	.mb_cycles_fw_vpp = 44156,
> +	.num_comv = 0,
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 7cd8650fbe9c09598670530103e3d5edf32953e7..e5f1896e55c390e920d206e7fc2c2be283bb39d8 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -349,6 +349,10 @@ static const struct of_device_id iris_dt_match[] = {
>   		.compatible = "qcom,sm8650-iris",
>   		.data = &sm8650_data,
>   	},
> +	{
> +		.compatible = "qcom,qcs8300-iris",
> +		.data = &qcs8300_data,
> +	},
This is out-of-order, alphanumeric sorting puts qcs8300 before smX.

>   	{ },
>   };
>   MODULE_DEVICE_TABLE(of, iris_dt_match);
> 

Also the ordering of this patch in the series is a bit odd.

- Compat string
- Driver changes
- DT updates

Please fix.

---
bod

