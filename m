Return-Path: <linux-media+bounces-25675-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7523AA28B85
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 14:19:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57CC3168DFD
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 13:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BE614F9FD;
	Wed,  5 Feb 2025 13:15:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F41914A630;
	Wed,  5 Feb 2025 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738761332; cv=none; b=uZjntunMfayRgfqqV/SL21AatJsQxmpeKYrekgXKBtvP8ZPqpXCK63MHxQpxOEbG+yukHTGHRl4vT/G8NLSSPO/YvnDPJrB4u31AhwpyYGJk6mre0aST30c9mReF1TqiEVwA7a/DLcz0DEdN7TdrAyRzm5PfPynuIUNoRtlC66M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738761332; c=relaxed/simple;
	bh=s+4A4rWLulugICad9dwwDfUDAelfscdvgsMYVsPDnSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pEU1rW6Zz83Ltid99wVoKRaCy8XQnCENyQteduJ435CzfcZXbr76kzegKaP1lh27z1ve+3W0vgxd236JdKsH/1TMDAcR9fjEef/vmuSL1aavESpNhbkTI8mJKy0Hf0A3pgaeRT+8sv/Uva4TmFCVpIHeLytqt5/Xn/QIz6DtzHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE23FC4CED1;
	Wed,  5 Feb 2025 13:15:27 +0000 (UTC)
Message-ID: <a3cafc25-3453-4a2d-81fb-71730982ddc0@xs4all.nl>
Date: Wed, 5 Feb 2025 14:15:25 +0100
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
Cc: sebastian.fricke@collabora.com, bryan.odonoghue@linaro.org,
 dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org,
 nicolas@ndufresne.ca, u.kleine-koenig@baylibre.com,
 stefan.schmidt@linaro.org, lujianhua000@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, johan@kernel.org
References: <20250116070234.4027116-1-quic_dikshita@quicinc.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20250116070234.4027116-1-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

This discussion about probing the driver is holding up the merging of this
driver unnecessarily. For now, only support the iris driver for SM8250 SoC
if the venus driver is not enabled:

#if !IS_REACHABLE(CONFIG_VIDEO_QCOM_VENUS)

That should be uncontroversial, and allows us to merge the iris driver.

A separate patch can be posted on top once the driver is merged that
allows for runtime switching. That can be discussed on its own merits.
To be honest, I can see pros and cons either way.

It's a bit silly to have this discussion hold up the driver, so I think
this is a reasonable path forward.

Regards,

	Hans

On 16/01/2025 08:02, Dikshita Agarwal wrote:
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
>  drivers/media/platform/qcom/iris/Makefile     |   1 +
>  drivers/media/platform/qcom/iris/iris_core.h  |   1 +
>  .../platform/qcom/iris/iris_platform_common.h |   1 +
>  .../platform/qcom/iris/iris_platform_sm8250.c | 149 ++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_probe.c |  48 ++++++
>  drivers/media/platform/qcom/venus/core.c      |   5 +
>  drivers/media/platform/qcom/venus/core.h      |   1 +
>  7 files changed, 206 insertions(+)
>  create mode 100644 drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index ca31db847273..a746681e03cd 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -9,6 +9,7 @@ iris-objs += iris_buffer.o \
>               iris_hfi_gen2_packet.o \
>               iris_hfi_gen2_response.o \
>               iris_hfi_queue.o \
> +             iris_platform_sm8250.o \
>               iris_platform_sm8550.o \
>               iris_power.o \
>               iris_probe.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index 37fb4919fecc..f2e478c25c02 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -107,5 +107,6 @@ struct iris_core {
>  
>  int iris_core_init(struct iris_core *core);
>  void iris_core_deinit(struct iris_core *core);
> +bool iris_should_not_bind(struct device *dev);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 189dd081ad0a..af24ce4fc417 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -34,6 +34,7 @@ enum pipe_type {
>  };
>  
>  extern struct iris_platform_data sm8550_data;
> +extern struct iris_platform_data sm8250_data;
>  
>  enum platform_clk_type {
>  	IRIS_AXI_CLK,
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
>  	iris_core_init(core);
>  }
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
>  static int iris_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -196,6 +235,11 @@ static int iris_probe(struct platform_device *pdev)
>  	u64 dma_mask;
>  	int ret;
>  
> +#if IS_REACHABLE(CONFIG_VIDEO_QCOM_VENUS)
> +	if (iris_should_not_bind(&pdev->dev))
> +		return -ENODEV;
> +#endif
> +
>  	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
>  	if (!core)
>  		return -ENOMEM;
> @@ -324,6 +368,10 @@ static const struct of_device_id iris_dt_match[] = {
>  		.compatible = "qcom,sm8550-iris",
>  		.data = &sm8550_data,
>  	},
> +	{
> +		.compatible = "qcom,sm8250-venus",
> +		.data = &sm8250_data,
> +	},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, iris_dt_match);
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 77d48578ecd2..9116188bfe74 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -375,6 +375,11 @@ static int venus_probe(struct platform_device *pdev)
>  	struct venus_core *core;
>  	int ret;
>  
> +#if IS_REACHABLE(CONFIG_VIDEO_QCOM_IRIS)
> +	if (!iris_should_not_bind(&pdev->dev))
> +		return -ENODEV;
> +#endif
> +
>  	core = devm_kzalloc(dev, sizeof(*core), GFP_KERNEL);
>  	if (!core)
>  		return -ENOMEM;
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index abeeafa86697..e2e7d8ec9807 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -570,4 +570,5 @@ is_fw_rev_or_older(struct venus_core *core, u32 vmajor, u32 vminor, u32 vrev)
>  }
>  
>  void venus_close_common(struct venus_inst *inst);
> +extern bool iris_should_not_bind(struct device *dev);
>  #endif


