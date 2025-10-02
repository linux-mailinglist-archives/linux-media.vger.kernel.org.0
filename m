Return-Path: <linux-media+bounces-43662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE36EBB4540
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 17:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF5E8325AC7
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 15:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFED1F5838;
	Thu,  2 Oct 2025 15:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UfcFYhNY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469DE1F2C45;
	Thu,  2 Oct 2025 15:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759419000; cv=none; b=HYKSGXs/BzsJ2OqV9/mJaibhkXngj6mM5nNrrltE+e5jGyZ344rLRzr1fyehucsNuT0a9noyYYY6Kg2KB/SSUUOigfa3KKqTt1DvK1Q7omWqJydMlK3TJW5psHttzGH+myU67Ly7XiTwPgNqu9yxHAMYs5UGHWdNgrUovLXbwk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759419000; c=relaxed/simple;
	bh=/lfDtITrdt033G9K6Sf8CUJ+JNwPECTxs5/z8imfrh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UH2ueW44H8SaEV2pYdMLvnu27BKXVLNYmoea2msdanVkZoeVBjmgY9MjtIUUH56gq66QdYG3s8DNr6Mv85wKjPyhYmZu4+XsUjKQNpL7ZudDrT8BvF58be6yqMdPPdpHJ1I5iLs5BmH4HwiGHvU9KDUG89ebnZ6VlkXUEd9rWP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UfcFYhNY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B143CC4CEF4;
	Thu,  2 Oct 2025 15:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759418999;
	bh=/lfDtITrdt033G9K6Sf8CUJ+JNwPECTxs5/z8imfrh8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UfcFYhNYVe9LFCSZBzZWACpYul4pVNqXZh/qTM4FTzXBmZuFuE0vtbqYVMwSwioFh
	 eG0C6syh5yiiDbtL5ilZ6u2udyWLjy2Fx0+/TxM4lbpGCefhdNTbwb12a4JhvGzy/v
	 +xKGhsIDlo7HCQHjooCi0CZIfsZDQxc7r1ZtC0lYuYE9z5CebIDiyQw8G5cSLTsHEN
	 5eecWRBYz3Q9VRH2RW7BiNEagiQypjl9aM9oTwnlOQqJmokvvZiZ7EL7e+D8FuPBEr
	 AtcTo2hzGWJnOMs5CQ3D9WAyzfhTVp3OD9eFgIG65lfg83fbDIp1SdiOFIziT8JWvu
	 vs4Y5Gl5xNGNA==
Message-ID: <a562c510-9c08-4acd-afe8-efb8aaceec66@kernel.org>
Date: Thu, 2 Oct 2025 16:29:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] media: iris: Add platform data for kaanapali
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
 <4-Uqk007ML-Q9NW-SjN7t6kX_tmucJiWOgoCTosvL2KPNWFwQzquB-VcPUMtnHTnTIMdKSMyg7JQNpOUthu9FQ==@protonmail.internalid>
 <20250925-knp_video-v1-8-e323c0b3c0cd@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250925-knp_video-v1-8-e323c0b3c0cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2025 00:14, Vikash Garodia wrote:
> Add support for the kaanapali platform by re-using the SM8550
> definitions and using the vpu4 ops.
> Move the configurations that differs in a per-SoC platform
> header, that will contain SoC specific data.
> 
> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 86 ++++++++++++++++++++++
>   .../platform/qcom/iris/iris_platform_kaanapali.h   | 63 ++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
>   4 files changed, 154 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index d6d4a9fdfc189797f903dfeb56d931741b405ee2..465943db0c6671e9b564b40e31ce6ba2d645a84c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -46,6 +46,7 @@ extern struct iris_platform_data sm8250_data;
>   extern struct iris_platform_data sm8550_data;
>   extern struct iris_platform_data sm8650_data;
>   extern struct iris_platform_data sm8750_data;
> +extern struct iris_platform_data kaanapali_data;
> 
>   enum platform_clk_type {
>   	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 00c6b9021b98aac80612b1bb9734c8dac8146bd9..142b7d84ee00a9b65420158ac1f168515b56f4a3 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -15,6 +15,7 @@
>   #include "iris_platform_qcs8300.h"
>   #include "iris_platform_sm8650.h"
>   #include "iris_platform_sm8750.h"
> +#include "iris_platform_kaanapali.h"
> 
>   #define VIDEO_ARCH_LX 1
>   #define BITRATE_MAX				245000000
> @@ -1095,3 +1096,88 @@ struct iris_platform_data qcs8300_data = {
>   	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>   	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>   };
> +
> +struct iris_platform_data kaanapali_data = {
> +	.get_instance = iris_hfi_gen2_get_instance,
> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.get_vpu_buffer_size = iris_vpu4x_buf_size,
> +	.vpu_ops = &iris_vpu4x_ops,
> +	.set_preset_registers = iris_set_sm8550_preset_registers,
> +	.icc_tbl = sm8550_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> +	.clk_rst_tbl = kaanapali_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(kaanapali_clk_reset_table),
> +	.bw_tbl_dec = sm8550_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> +	.pmdomain_tbl = kaanapali_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(kaanapali_pmdomain_table),
> +	.opp_pd_tbl = sm8550_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> +	.clk_tbl = kaanapali_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(kaanapali_clk_table),
> +	.opp_clk_tbl = kaanapali_opp_clk_table,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu40_p2.mbn",
> +	.pas_id = IRIS_PAS_ID,
> +	.inst_caps = &platform_inst_cap_sm8550,
> +	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
> +	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
> +	.tz_cp_config_data = tz_cp_config_kaanapali,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_kaanapali),
> +	.core_arch = VIDEO_ARCH_LX,
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.ubwc_config = &ubwc_config_sm8550,
> +	.num_vpp_pipe = 2,
> +	.max_session_count = 16,
> +	.max_core_mbpf = NUM_MBS_8K * 2,
> +	.max_core_mbps = ((8192 * 4352) / 256) * 60,
> +	.dec_input_config_params_default =
> +		sm8550_vdec_input_config_params_default,
> +	.dec_input_config_params_default_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
> +	.dec_input_config_params_hevc =
> +		sm8550_vdec_input_config_param_hevc,
> +	.dec_input_config_params_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
> +	.dec_input_config_params_vp9 =
> +		sm8550_vdec_input_config_param_vp9,
> +	.dec_input_config_params_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
> +	.dec_output_config_params =
> +		sm8550_vdec_output_config_params,
> +	.dec_output_config_params_size =
> +		ARRAY_SIZE(sm8550_vdec_output_config_params),
> +
> +	.enc_input_config_params =
> +		sm8550_venc_input_config_params,
> +	.enc_input_config_params_size =
> +		ARRAY_SIZE(sm8550_venc_input_config_params),
> +	.enc_output_config_params =
> +		sm8550_venc_output_config_params,
> +	.enc_output_config_params_size =
> +		ARRAY_SIZE(sm8550_venc_output_config_params),
> +
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
> +
> +	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
> +	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..247fb9d7cb632d2e9a1e9832d087cb03ac9b7cf3
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef __IRIS_PLATFORM_KAANAPALI_H__
> +#define __IRIS_PLATFORM_KAANAPALI_H__
> +
> +#define VIDEO_REGION_VM0_SECURE_NP_ID		1
> +#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
> +
> +static const char *const kaanapali_clk_reset_table[] = {
> +	"bus0",
> +	"bus1",
> +	"core_freerun_reset",
> +	"vcodec0_core_freerun_reset",
> +};
> +
> +static const char *const kaanapali_pmdomain_table[] = {
> +	"venus",
> +	"vcodec0",
> +	"vpp0",
> +	"vpp1",
> +	"apv",
> +};
> +
> +static const struct platform_clk_data kaanapali_clk_table[] = {
> +	{ IRIS_AXI_CLK, "iface" },
> +	{ IRIS_CTRL_CLK, "core" },
> +	{ IRIS_HW_CLK, "vcodec0_core" },
> +	{ IRIS_AXI1_CLK, "iface1" },
> +	{ IRIS_CTRL_FREERUN_CLK, "core_freerun" },
> +	{ IRIS_HW_FREERUN_CLK, "vcodec0_core_freerun" },
> +	{ IRIS_BSE_HW_CLK, "vcodec_bse" },
> +	{ IRIS_VPP0_HW_CLK, "vcodec_vpp0" },
> +	{ IRIS_VPP1_HW_CLK, "vcodec_vpp1" },
> +	{ IRIS_APV_HW_CLK, "vcodec_apv" },
> +};
> +
> +static const char *const kaanapali_opp_clk_table[] = {
> +	"vcodec0_core",
> +	"vcodec_apv",
> +	"vcodec_bse",
> +	"core",
> +	NULL,
> +};

Why are mxc and mmcx absett from this table ?

---
bod

