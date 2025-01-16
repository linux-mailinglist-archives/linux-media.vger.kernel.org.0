Return-Path: <linux-media+bounces-24829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 564D2A136E7
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 10:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09D747A1FA7
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 09:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE22C1DC997;
	Thu, 16 Jan 2025 09:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K9B5m5K0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FD31D47BC
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 09:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737020760; cv=none; b=ZNvUNhHkRQwVWEV2xJc/4RLlZSeonJCPENx9lSjwJG95M1dya4LDvHTnp+hqiMPvepRyTDsoUeX03kTh0826gTqoMO+q0p5sPK6kpBE4WDiif8kC+1ws50kEqpF5PwC9U96sJ9lIkgovrbha0OdkWmdODeaL9pqHS+3zMGsXUzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737020760; c=relaxed/simple;
	bh=W+PtqvEnqNGdO0ufePzfLbmqbe5COkIOiV6eElSEJAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CW3nsspPXvuhfsE89+w1IP7mrkxLhWEc3VxKgAxc2d6TA8vg38p4xowobgRlAflxEkfy3f3L32uVSjay/jQO4bz+JFhol4C+pqCxzOI5ZO0Hyuea3VHSfzfTrTHID1bbatR8A9rmIFhu9kwh5MBtSVSehdr6wlmfx4PJqYfYY5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K9B5m5K0; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so411684f8f.0
        for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 01:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737020756; x=1737625556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HVmML1vhGK/P1cvXdWT8wcKfCpzmLLfPMRWvQPWNJH8=;
        b=K9B5m5K0YJU3oR9P9G20Sj20FlHEVFBzHMSmzMEXzNu6tC748zcw4MFIOmOtCoiwoH
         J/4aSECUwdY3xNCWJyQTexBWA/PWs6GsG/PLYB8YKN6NTjFSqp4B8XI65ANAxEXkpORt
         QuO4mW/T9P8+Zphdq+Ku/hX9PU/ohU5LCCYYi0/+PichVXCb+9wh8C9vnLqzlVSzaDxr
         F63+Ejw79C9kT6b/PIbDjWOrO+XVzpkljuiKYfEv18OljNGocBx8zJ6fX36ffWH5TH+S
         SM288KXhyrUvM6BsYg0O2Gy5sDfDo98l/q8wk8hWTmToW+NW9HejIUNUj3cyjOEndqlZ
         7JEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737020756; x=1737625556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HVmML1vhGK/P1cvXdWT8wcKfCpzmLLfPMRWvQPWNJH8=;
        b=TFHmTQN4MjYHm9id5y5b0uHup8PCegc92SeGVjXQ5bSSjARp9f428HTUWbycuUsJCV
         Dlh4u2HxIS2Cuyri6v5taN0u6zLc+QNp/C53tg1A7YhbBs+GH1UjQMOgBT2LfjYdpz4+
         MeyHit+E1C/if1OWDgKT1ld1czpXw3C3YuDkGsI6YkSj/s0fOADKkeTmxDy3F2kbVMlx
         MvDHqsJ3cyqKJM4rpVqxS7HH/tSGAYP73WhBfAifn80S4i5i7PLUIXBQSdnXwygYxC1w
         GPhsEfb/P5MWSD5ZzZBBn/Eeidk0U5YCwL2Bl0OTvG0hq+oL3cEpc1QUHkA33xu3SOqG
         XLgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR3iXxHa2Y/dCASWaUpHtad+oX2GxlGZecDzXB0c1N6TsibyZ587DuNZekArLtwNKYj87qVb0deuLEzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3SpIFTjGwb6/v6wAyOhaYxUa4ezDhQrFZ4CsGE3X+y0SQA81R
	jxwsrpH6Vq3mhX2JHLBFvbMCKeI7lIuwY7zQGDkpL3fkpPpVusnLe1JbwHxh8F8=
X-Gm-Gg: ASbGncuGwODOi4qIIg4zVe8Y0mvhFykkUdbqdOnhCG6+QWCKMZ+zFloXN8dM33/YdfO
	LKO714oNhrR1Nv3DT43SPHdFDHo7r0z/10eqvjyEQFRxmmCkPFT/Voz2HZDa9P3TqvTFI09B6Hl
	XSjfmFXLHIAyeBBiaId1FqMpdWTeyAz4aYNb+AWNJpavXc23dazk5BDXlDGfilRgSbQDxoVfvIl
	o5EN22ZOJl2pSbNG9FxkqT2JbduhzSbU1WMn6SNYWqth9wlySWZJ6E8j9x/3Lxnvgm7fg==
X-Google-Smtp-Source: AGHT+IGEBTUT1coNbo/VeQQ9FMnumyerR53JjbVi/LcTYyOuovXkYmEdJy9qt1ia4UibkUegvdycTQ==
X-Received: by 2002:a05:6000:156a:b0:38b:e26d:ea0b with SMTP id ffacd0b85a97d-38be26dea6dmr10396884f8f.25.1737020756400;
        Thu, 16 Jan 2025 01:45:56 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e3838a3sm20075403f8f.33.2025.01.16.01.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 01:45:56 -0800 (PST)
Message-ID: <6e35ca51-f224-42d1-a49f-67c6a7015542@linaro.org>
Date: Thu, 16 Jan 2025 09:45:54 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v10 27/28] media: iris: enable video driver probe of
 SM8250 SoC
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, quic_vgarodia@quicinc.com,
 quic_abhinavk@quicinc.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, p.zabel@pengutronix.de
Cc: hverkuil@xs4all.nl, sebastian.fricke@collabora.com,
 dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org,
 nicolas@ndufresne.ca, u.kleine-koenig@baylibre.com,
 stefan.schmidt@linaro.org, lujianhua000@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, johan@kernel.org
References: <20250116070234.4027116-1-quic_dikshita@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250116070234.4027116-1-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/01/2025 07:02, Dikshita Agarwal wrote:
> Initialize the platform data and enable video driver probe of SM8250
> SoC. Add a kernel param to select between venus and iris drivers for
> platforms supported by both drivers, for ex: SM8250.
> 
> This is for preview only, and I will post a proper v10,
> if everyone is OK with this RFC patch.
> 
> Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org> # x1e80100 (Dell XPS 13 9345)
> Reviewed-by: Stefan Schmidt <stefan.schmidt@linaro.org>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-SDK
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/Makefile     |   1 +
>   drivers/media/platform/qcom/iris/iris_core.h  |   1 +
>   .../platform/qcom/iris/iris_platform_common.h |   1 +
>   .../platform/qcom/iris/iris_platform_sm8250.c | 149 ++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_probe.c |  48 ++++++
>   drivers/media/platform/qcom/venus/core.c      |   5 +
>   drivers/media/platform/qcom/venus/core.h      |   1 +
>   7 files changed, 206 insertions(+)
>   create mode 100644 drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index ca31db847273..a746681e03cd 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -9,6 +9,7 @@ iris-objs += iris_buffer.o \
>                iris_hfi_gen2_packet.o \
>                iris_hfi_gen2_response.o \
>                iris_hfi_queue.o \
> +             iris_platform_sm8250.o \
>                iris_platform_sm8550.o \
>                iris_power.o \
>                iris_probe.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index 37fb4919fecc..f2e478c25c02 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -107,5 +107,6 @@ struct iris_core {
>   
>   int iris_core_init(struct iris_core *core);
>   void iris_core_deinit(struct iris_core *core);
> +bool iris_should_not_bind(struct device *dev);
>   
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 189dd081ad0a..af24ce4fc417 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -34,6 +34,7 @@ enum pipe_type {
>   };
>   
>   extern struct iris_platform_data sm8550_data;
> +extern struct iris_platform_data sm8250_data;
>   
>   enum platform_clk_type {
>   	IRIS_AXI_CLK,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> new file mode 100644
> index 000000000000..b14b1c5d632c
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -0,0 +1,149 @@
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
> +
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
> +static void iris_set_sm8250_preset_registers(struct iris_core *core)
> +{
> +	writel(0x0, core->reg_base + 0xB0088);
> +}
> +
> +static const struct icc_info sm8250_icc_table[] = {
> +	{ "cpu-cfg",    1000, 1000     },
> +	{ "video-mem",  1000, 15000000 },
> +};
> +
> +static const char * const sm8250_clk_reset_table[] = { "bus", "core" };
> +
> +static const struct bw_info sm8250_bw_table_dec[] = {
> +	{ ((4096 * 2160) / 256) * 60, 2403000 },
> +	{ ((4096 * 2160) / 256) * 30, 1224000 },
> +	{ ((1920 * 1080) / 256) * 60,  812000 },
> +	{ ((1920 * 1080) / 256) * 30,  416000 },
> +};
> +
> +static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
> +
> +static const char * const sm8250_opp_pd_table[] = { "mx" };
> +
> +static const struct platform_clk_data sm8250_clk_table[] = {
> +	{IRIS_AXI_CLK,  "iface"        },
> +	{IRIS_CTRL_CLK, "core"         },
> +	{IRIS_HW_CLK,   "vcodec0_core" },
> +};
> +
> +static struct tz_cp_config tz_cp_config_sm8250 = {
> +	.cp_start = 0,
> +	.cp_size = 0x25800000,
> +	.cp_nonpixel_start = 0x01000000,
> +	.cp_nonpixel_size = 0x24800000,
> +};
> +
> +static const u32 sm8250_vdec_input_config_param[] = {
> +	HFI_PROPERTY_PARAM_FRAME_SIZE,
> +	HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE,
> +	HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SELECT,
> +	HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO,
> +	HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL,
> +	HFI_PROPERTY_PARAM_VDEC_MULTI_STREAM,
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
> +struct iris_platform_data sm8250_data = {
> +	.get_instance = iris_hfi_gen1_get_instance,
> +	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
> +	.vpu_ops = &iris_vpu2_ops,
> +	.set_preset_registers = iris_set_sm8250_preset_registers,
> +	.icc_tbl = sm8250_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
> +	.clk_rst_tbl = sm8250_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8250_clk_reset_table),
> +	.bw_tbl_dec = sm8250_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
> +	.pmdomain_tbl = sm8250_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
> +	.opp_pd_tbl = sm8250_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
> +	.clk_tbl = sm8250_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu-1.0/venus.mbn",
> +	.pas_id = IRIS_PAS_ID,
> +	.inst_caps = &platform_inst_cap_sm8250,
> +	.inst_fw_caps = inst_fw_cap_sm8250,
> +	.inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_sm8250),
> +	.tz_cp_config_data = &tz_cp_config_sm8250,
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.num_vpp_pipe = 4,
> +	.max_session_count = 16,
> +	.max_core_mbpf = (8192 * 4352) / 256,
> +	.input_config_params =
> +		sm8250_vdec_input_config_param,
> +	.input_config_params_size =
> +		ARRAY_SIZE(sm8250_vdec_input_config_param),
> +
> +	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
> +	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 954cc7c0cc97..a9cec0d15dcb 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -189,6 +189,45 @@ static void iris_sys_error_handler(struct work_struct *work)
>   	iris_core_init(core);
>   }
>   
> +/* The venus driver supports only hfi gen1 to communicate with the firmware while
> + * the iris driver supports both hfi gen1 and hfi gen2.
> + * The support of hfi gen1 is added to the iris driver with the intention that
> + * it can support old gen1 interface based firmware, while enabling gen2 based future SOCs.
> + * With this, the plan is to migrate older SOCs from venus to iris.
> + * As of now, since the iris driver supports only entry level features and doesn't have
> + * feature parity with the venus driver, a runtime-selection is provided to user via
> + * module parameter 'prefer_venus' to select the driver.
> + * This selection is available only for the SoCs which are supported by both venus
> + * and iris eg: SM8250.
> + * When the feature parity is achieved, the plan is to switch the default to point to
> + * the iris driver, then gradually start removing platforms from venus.
> + * Hardware supported by only venus - 8916, 8996, SDM660, SDM845, SC7180, SC7280
> + * Hardware supported by only iris - SM8550
> + * Hardware supported by both venus and iris - SM8250
> + */
> +
> +#if IS_REACHABLE(CONFIG_VIDEO_QCOM_VENUS)
> +static bool prefer_venus = true;
> +MODULE_PARM_DESC(prefer_venus, "Select whether venus or iris driver should be preferred");
> +module_param(prefer_venus, bool, 0444);
> +
> +/* list all platforms supported by both venus and iris drivers */
> +static const char *const venus_to_iris_migration[] = {
> +	"qcom,sm8250-venus",
> +	NULL,
> +};
> +
> +bool iris_should_not_bind(struct device *dev)
> +{
> +	/* If it is in the migration list, use venus */
> +	if (of_device_compatible_match(dev->of_node, venus_to_iris_migration))
> +		return prefer_venus;
> +
> +	return false;
> +}
> +EXPORT_SYMBOL_GPL(iris_should_not_bind);
> +#endif
> +
>   static int iris_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -196,6 +235,11 @@ static int iris_probe(struct platform_device *pdev)
>   	u64 dma_mask;
>   	int ret;
>   
> +#if IS_REACHABLE(CONFIG_VIDEO_QCOM_VENUS)
> +	if (iris_should_not_bind(&pdev->dev))
> +		return -ENODEV;
> +#endif
> +
>   	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
>   	if (!core)
>   		return -ENOMEM;
> @@ -324,6 +368,10 @@ static const struct of_device_id iris_dt_match[] = {
>   		.compatible = "qcom,sm8550-iris",
>   		.data = &sm8550_data,
>   	},
> +	{
> +		.compatible = "qcom,sm8250-venus",
> +		.data = &sm8250_data,
> +	},
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(of, iris_dt_match);
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 77d48578ecd2..9116188bfe74 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -375,6 +375,11 @@ static int venus_probe(struct platform_device *pdev)
>   	struct venus_core *core;
>   	int ret;
>   
> +#if IS_REACHABLE(CONFIG_VIDEO_QCOM_IRIS)
> +	if (!iris_should_not_bind(&pdev->dev))
> +		return -ENODEV;
> +#endif
> +
>   	core = devm_kzalloc(dev, sizeof(*core), GFP_KERNEL);
>   	if (!core)
>   		return -ENOMEM;
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index abeeafa86697..e2e7d8ec9807 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -570,4 +570,5 @@ is_fw_rev_or_older(struct venus_core *core, u32 vmajor, u32 vminor, u32 vrev)
>   }
>   
>   void venus_close_common(struct venus_inst *inst);
> +extern bool iris_should_not_bind(struct device *dev);
>   #endif

Shouldn't this series also include handlign on the venus side so that 
the binding isn't racy ?

https://lore.kernel.org/r/xh5jbf2w7lwqub5f7re7yipsbax5p4svpdpuctgpo2a2efmpah@haqjpch44hzc

A patch directly before/after this patch in the series for venus 
including video_drv_should_bind().

---
bod

