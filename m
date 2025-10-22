Return-Path: <linux-media+bounces-45271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F5ABFCD84
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 17:23:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4014E3A7823
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 15:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9342734C9A6;
	Wed, 22 Oct 2025 15:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CGbt3QBI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97AD3431F5
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 15:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761146469; cv=none; b=Qle1hHxvCD9XC9nfBNeIjksX3FyLhLt8Bg7pJ2gWwHHLiuvQT4sshr9mSbKBdGQ+X3+8mBbvvLuYTnwcY+y2eRjA3cXJps3aSp2EHggU3e1kLGu52Okpgk4oVDLUnlwOjyORUhjIOA3IQRo9CzDKETUtx+kCSIS6v8hgWyT0TCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761146469; c=relaxed/simple;
	bh=o+s0sqKtsiD+XfpmIvQwg/xGe4pMMnvlpo1TiAfcWQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S39P1UVUdgg5o30+8l4jodix88O/v1LdNRRNBQ4Tt5Y9Y3TTyT519o2CbXjibbbbynLqKmvZkMyIqy5pE3gUhL8rYdxoJWuX7FUBK2Ct/RYXxUHxrjHIhkVCMLBaH1Q1UZBvh1sHZPp3X2Ci4fe+Ukh4cH0Ogeic7Fp3tAqFJEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CGbt3QBI; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-426ff694c1fso1967053f8f.2
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 08:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761146463; x=1761751263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k6Lua+IMTaUkqsEKcViJ5M0nku9nKQNA9fTLX2CMV1o=;
        b=CGbt3QBIZekEXW7Keaksog3ruIaBShbXAdi4NckULWVbSpjYEcaYBtve8VZoZWWk8y
         7S33MVM4Utyu2O6+GsdO5+p0vTwmD6DcMwfvUhRuiwAagERcKZzlP/grpL02oXmacGdL
         7001iUGUMO8UNeNWQAYYydbmKRe0myWufhhhjJ6eaeZoiDtnob+lOoJ0AmWiPo64pdVP
         5qSbJHo3g3OZGDSk1WU3CL6jQmaYMHntZLP0P1AM4zX6gieuGxGI0GUyQHt9lKKUlV4d
         RQYXrkHcJWmJcAt5I4Js8dZkXMc0X4DNxHXzIi66SR7nQ+czfWIy9IPf2IoAlY/47hDf
         THIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761146463; x=1761751263;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k6Lua+IMTaUkqsEKcViJ5M0nku9nKQNA9fTLX2CMV1o=;
        b=wzd2O+KWejQzgBpsCOKld/RBGiCBWyre+39aniPTRBUjdAejWZDyB9m8iY1JcmeJUA
         8YDgxuAhyNsS/ayi+V2buoBtKYYRtice6VKrSmpcb3GXbPa14l5jCrTN+K1lOCLMTUsH
         R4dRZ+mApiqvKCUeAYLIFugYoXlTPnETk0U3O/x4rLz1IDg2knMwPqFmbb54JRzl4Qzc
         OxTXQiTy+bgWoaPVY4ELevXvE5a5MitwgkbYPQ5678CtvZ9TrWrY1rvJET4aKqDlZqOa
         LZ0bBuKLyLrYqbDC2mLARonSN7/cEzI+ihJiYu5VNFRwGMf90bY355XXup1FVVoRBHNx
         C4eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvPPxIK9Gh3sYFWqgo39mdtW4Mq324onbsZEOfZNOxs+AD/wvfgp9i2Z0FvFbMjFM5mamkBDEVigXQtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycA7r74eIa1n0XdCOPWv8EQM4fsAyXTox2uJ+SbP7/MBglaxCW
	ZCqOV9Q1cYBY1IqCj6fKODVn72w9yvgMtVYw2YAYyXRxBsuiXsNe3i/1wN/5BaeqzDo=
X-Gm-Gg: ASbGncvgxXc+jFPXGTdHK19U3trI8fLiWQQaqRfqrZb35o+27qC0Rjf/Bnv/RYGOcmt
	ao0T+K1KNJW7cU9I2c9VB7iGC9JY43bDz9QxUwXSMbgwuZWMMZunRjHhp2tFjGZKXF8FNF8hZys
	swq5ExKNEKoDeoU5K17Oq8H65xYk9vlc0UOKrbbH9ArBxhRSv6pbcfTDk9xN39+ej+4vqtX6Hp1
	vjlKXMQsh3iunBcXXr5QVl/8UM15IQJUS2XH9FAM86NrxVWjl+RKaGMm2nW5+ART4M6sYvRxDxh
	ouEUeIIgORxexxYAqkjdIrqwdZY6JSupf/ddkXnD0GwPl/RMBKNxcszDnUFzbfYxuKUgKYFBsI1
	Iu1tR2kJnePqhR8WYSQSWnj5PEvPBSMwp86m/vJsHe2ksdatEI/gu0MErhPorV7bJAuBOJK1jXQ
	wMaiRP92IVxnOoPx/vqev4DiWvVmsKTlGNT366qkJ8PxtsQQEHEFDM
X-Google-Smtp-Source: AGHT+IFibS+2tyYqxAwjvzp9c3fEdCi2v1bjl8+fm24RzFAL+0Hu21jQD8yfO8KwQjrwdfUXJa+cKQ==
X-Received: by 2002:a05:6000:26ca:b0:428:bb7:1753 with SMTP id ffacd0b85a97d-4280bb71f1bmr10603230f8f.49.1761146462808;
        Wed, 22 Oct 2025 08:21:02 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4369b33sm47074225e9.14.2025.10.22.08.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 08:21:02 -0700 (PDT)
Message-ID: <a6d09c4c-1b8c-41ac-bf8d-aca49da04724@linaro.org>
Date: Wed, 22 Oct 2025 16:20:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] media: iris: Add platform data for kaanapali
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
 Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
 <4ubqLGrRnxxs-41ZPgx-v9RXDexdqRV1oeeFwEdSwNO-FblTgWWiypGrTznXdQPHuo3zw8GTFKPiPjeXgHRTcw==@protonmail.internalid>
 <20251017-knp_video-v2-8-f568ce1a4be3@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251017-knp_video-v2-8-f568ce1a4be3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2025 15:16, Vikash Garodia wrote:
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
> index d6d4a9fdfc189797f903dfeb56d931741b405ee2..f77bad531f067f59b48c3e4caa40a463d454c47e 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -41,6 +41,7 @@ enum pipe_type {
>   	PIPE_4 = 4,
>   };
> 
> +extern struct iris_platform_data kaanapali_data;
>   extern struct iris_platform_data qcs8300_data;
>   extern struct iris_platform_data sm8250_data;
>   extern struct iris_platform_data sm8550_data;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 00c6b9021b98aac80612b1bb9734c8dac8146bd9..104c24fd47770dff770a5230cf957d78c89b01f7 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -12,6 +12,7 @@
>   #include "iris_vpu_buffer.h"
>   #include "iris_vpu_common.h"
> 
> +#include "iris_platform_kaanapali.h"
>   #include "iris_platform_qcs8300.h"
>   #include "iris_platform_sm8650.h"
>   #include "iris_platform_sm8750.h"
> @@ -744,6 +745,91 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
>   	BUF_SCRATCH_2,
>   };
> 
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
> +	.fwname = "qcom/vpu/vpu40_p2_s7.mbn",
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
> +
>   struct iris_platform_data sm8550_data = {
>   	.get_instance = iris_hfi_gen2_get_instance,
>   	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
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
> +
> +static struct tz_cp_config tz_cp_config_kaanapali[] = {
> +	{
> +		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
> +		.cp_size = 0,
> +		.cp_nonpixel_start = 0x01000000,
> +		.cp_nonpixel_size = 0x24800000,
> +	},
> +	{
> +		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
> +		.cp_size = 0,
> +		.cp_nonpixel_start = 0x25800000,
> +		.cp_nonpixel_size = 0xda400000,
> +	},
> +};
> +
> +#endif /* __IRIS_PLATFORM_KAANAPALI_H__ */
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index ad82a62f8b923d818ffe77c131d7eb6da8c34002..a0902f3aaa1ca6021cfd414787da747a6dda1010 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -348,6 +348,10 @@ static const struct dev_pm_ops iris_pm_ops = {
>   };
> 
>   static const struct of_device_id iris_dt_match[] = {
> +	{
> +		.compatible = "qcom,kaanapali-iris",
> +		.data = &kaanapali_data,
> +	},
>   	{
>   		.compatible = "qcom,qcs8300-iris",
>   		.data = &qcs8300_data,
> 
> --
> 2.34.1
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

