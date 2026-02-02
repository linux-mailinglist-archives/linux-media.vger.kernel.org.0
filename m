Return-Path: <linux-media+bounces-52038-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mC+AJjbDgGl3AgMAu9opvQ
	(envelope-from <linux-media+bounces-52038-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 16:31:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3219BCE43B
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 16:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05858301F17F
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 15:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F3122B8B6;
	Mon,  2 Feb 2026 15:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CxkORL8C"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049322E8B82;
	Mon,  2 Feb 2026 15:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770046098; cv=none; b=oiA8nYnkKHCZ/CVw5gRBQNmxKlGa69gamEJMv2B/+/NKf/sz8Tgss7oXgQfeF1jqTwP/UqAAwoGCoBAJf99YoPVPJ9JDn+I310U+KbjJa1pzcpBogYE6XAlRub/T/5KLDt4lMyKLACUIqPD8WfoObauYGQRv395dPVLK39MGVag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770046098; c=relaxed/simple;
	bh=o+oYLIDsSpcEH6+xEsbdCzu9lhcmvaRy0HJ0Kf9wNRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SB+QWP+7sEfIdsIXW9+0RKeynDX0+BlR2GWnjUdG/6H6hMO2yxWjyT3Qrr/IlqRDw9maLbGqK3UYW0NpdVZDXCkOcVxJqSGhZKs4+xC72Ck6V0nTM+nEVAa2bHDhthpq2fplYrqhTbE66nTr30jMPisVCAO6X7BiW6D+wG66t9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CxkORL8C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143E0C116C6;
	Mon,  2 Feb 2026 15:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770046097;
	bh=o+oYLIDsSpcEH6+xEsbdCzu9lhcmvaRy0HJ0Kf9wNRs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CxkORL8CT84fylEZCG14OdDs0bS7lTKyf3CK3kjUize1vt6/f9JgGTmkgBx2xOL2Q
	 AfbVWYxSmoT4CXohrWUI4lVEY9us30jf+Xzmj7cfXj2hLde9Hr+duG7Cu4ESr7SW9H
	 vE0eV0N+nDzrnuPgbUSCC6qzkw1Mc0aeskXS/+1ZR3oleRiKvEhVKj7Hel5d/SvRLZ
	 VSuIh3xvO4a3pKYAcb/FzkrGxlE7KUI2FlzRr+BDtZU/9CP+1DGSwpnJpY4S+elFRH
	 Nq06j/LPf6X2KTahTfzBVVZTnjBWjC1uNUQ5bJXcIJcXedYhEiC92/0+Jrf/HIgEUL
	 a25lff0gWPnoA==
Message-ID: <f842dd69-8ca5-4176-a3f3-9b870614d22a@kernel.org>
Date: Mon, 2 Feb 2026 15:28:11 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] media: iris: introduce SM8350 and SC8280XP support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bjorn Andersson <andersson@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Johan Hovold <johan+linaro@kernel.org>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <Vg_VOPxWfBkcm8taKv04_zPKHRfN4BjzOhZAKD-5EwtR6AdBnPbIYxMklyYkBoKpCFtZrzbhgIQcHi1reHjSYw==@protonmail.internalid>
 <20260125-iris-sc8280xp-v3-2-d21861a9ea33@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260125-iris-sc8280xp-v3-2-d21861a9ea33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52038-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,linaro];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3219BCE43B
X-Rspamd-Action: no action

On 25/01/2026 15:32, Dmitry Baryshkov wrote:
> SM8350 and SC8280XP have an updated version of the Iris2 core also
> present on the SM8250 and SC7280 platforms. Add necessary platform data
> to utilize the core on those two platforms.
> 
> The iris_platform_gen1.c is now compiled unconditionally, even if Venus
> driver is enabled, but SM8250 and SC7280 are still disabled in
> iris_dt_match.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/Makefile          |   5 +-
>   .../platform/qcom/iris/iris_platform_common.h      |   2 +
>   .../media/platform/qcom/iris/iris_platform_gen1.c  | 111 +++++++++++++++++++++
>   .../platform/qcom/iris/iris_platform_sm8350.h      |  20 ++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |  10 ++
>   5 files changed, 144 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 2abbd3aeb4af..2fde45f81727 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -10,6 +10,7 @@ qcom-iris-objs += iris_buffer.o \
>                iris_hfi_gen2_packet.o \
>                iris_hfi_gen2_response.o \
>                iris_hfi_queue.o \
> +             iris_platform_gen1.o \
>                iris_platform_gen2.o \
>                iris_power.o \
>                iris_probe.o \
> @@ -26,8 +27,4 @@ qcom-iris-objs += iris_buffer.o \
>                iris_vpu_buffer.o \
>                iris_vpu_common.o \
> 
> -ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
> -qcom-iris-objs += iris_platform_gen1.o
> -endif
> -
>   obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5a489917580e..49dba0f50988 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -43,7 +43,9 @@ enum pipe_type {
> 
>   extern const struct iris_platform_data qcs8300_data;
>   extern const struct iris_platform_data sc7280_data;
> +extern const struct iris_platform_data sc8280xp_data;
>   extern const struct iris_platform_data sm8250_data;
> +extern const struct iris_platform_data sm8350_data;
>   extern const struct iris_platform_data sm8550_data;
>   extern const struct iris_platform_data sm8650_data;
>   extern const struct iris_platform_data sm8750_data;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index df8e6bf9430e..c99ff4d4644d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -14,6 +14,7 @@
>   #include "iris_instance.h"
> 
>   #include "iris_platform_sc7280.h"
> +#include "iris_platform_sm8350.h"
> 
>   #define BITRATE_MIN		32000
>   #define BITRATE_MAX		160000000
> @@ -392,6 +393,61 @@ const struct iris_platform_data sm8250_data = {
>   	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
>   };
> 
> +const struct iris_platform_data sm8350_data = {
> +	.get_instance = iris_hfi_gen1_get_instance,
> +	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.vpu_ops = &iris_vpu2_ops,
> +	.set_preset_registers = iris_set_sm8350_preset_registers,
> +	.icc_tbl = sm8250_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
> +	.clk_rst_tbl = sm8350_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8350_clk_reset_table),
> +	.bw_tbl_dec = sm8250_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
> +	.pmdomain_tbl = sm8250_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
> +	.opp_pd_tbl = sm8250_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
> +	.clk_tbl = sm8250_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
> +	.opp_clk_tbl = sm8250_opp_clk_table,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu20_p4.mbn",
> +	.pas_id = IRIS_PAS_ID,
> +	.inst_iris_fmts = platform_fmts_sm8250_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
> +	.inst_caps = &platform_inst_cap_sm8250,
> +	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
> +	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
> +	.tz_cp_config_data = tz_cp_config_sm8250,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.num_vpp_pipe = 4,
> +	.max_session_count = 16,
> +	.max_core_mbpf = NUM_MBS_8K,
> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> +	.dec_input_config_params_default =
> +		sm8250_vdec_input_config_param_default,
> +	.dec_input_config_params_default_size =
> +		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
> +	.enc_input_config_params = sm8250_venc_input_config_param,
> +	.enc_input_config_params_size =
> +		ARRAY_SIZE(sm8250_venc_input_config_param),
> +
> +	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
> +	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
> +
> +	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
> +};
> +
>   const struct iris_platform_data sc7280_data = {
>   	.get_instance = iris_hfi_gen1_get_instance,
>   	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
> @@ -446,3 +502,58 @@ const struct iris_platform_data sc7280_data = {
>   	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
>   	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
>   };
> +
> +const struct iris_platform_data sc8280xp_data = {
> +	.get_instance = iris_hfi_gen1_get_instance,
> +	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.vpu_ops = &iris_vpu2_ops,
> +	.set_preset_registers = iris_set_sm8350_preset_registers,
> +	.icc_tbl = sm8250_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8250_icc_table),
> +	.clk_rst_tbl = sm8350_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8350_clk_reset_table),
> +	.bw_tbl_dec = sm8250_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
> +	.pmdomain_tbl = sm8250_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8250_pmdomain_table),
> +	.opp_pd_tbl = sm8250_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
> +	.clk_tbl = sm8250_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
> +	.opp_clk_tbl = sm8250_opp_clk_table,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu20_p2.mbn",
> +	.pas_id = IRIS_PAS_ID,
> +	.inst_iris_fmts = platform_fmts_sm8250_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8250_dec),
> +	.inst_caps = &platform_inst_cap_sm8250,
> +	.inst_fw_caps_dec = inst_fw_cap_sm8250_dec,
> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
> +	.inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
> +	.tz_cp_config_data = tz_cp_config_sm8250,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.num_vpp_pipe = 2,
> +	.max_session_count = 16,
> +	.max_core_mbpf = NUM_MBS_8K,
> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,
> +	.dec_input_config_params_default =
> +		sm8250_vdec_input_config_param_default,
> +	.dec_input_config_params_default_size =
> +		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
> +	.enc_input_config_params = sm8250_venc_input_config_param,
> +	.enc_input_config_params_size =
> +		ARRAY_SIZE(sm8250_venc_input_config_param),
> +
> +	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_ip_int_buf_tbl),
> +	.dec_op_int_buf_tbl = sm8250_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8250_dec_op_int_buf_tbl),
> +
> +	.enc_ip_int_buf_tbl = sm8250_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8250_enc_ip_int_buf_tbl),
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8350.h b/drivers/media/platform/qcom/iris/iris_platform_sm8350.h
> new file mode 100644
> index 000000000000..74cf5ea2359a
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8350.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __IRIS_PLATFORM_SM8350_H__
> +#define __IRIS_PLATFORM_SM8350_H__
> +
> +static void iris_set_sm8350_preset_registers(struct iris_core *core)
> +{
> +	u32 val;
> +
> +	val = readl(core->reg_base + 0xb0088);
> +	val &= ~0x11;
> +	writel(val, core->reg_base + 0xb0088);
> +}

What does this magic number do ? You can find out from the docs.

Please define the relevant bits.
> +
> +static const char * const sm8350_clk_reset_table[] = { "core" };
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index ddaacda523ec..10b00d9808d2 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -357,11 +357,21 @@ static const struct of_device_id iris_dt_match[] = {
>   		.compatible = "qcom,sc7280-venus",
>   		.data = &sc7280_data,
>   	},
> +#endif
> +	{
> +		.compatible = "qcom,sc8280xp-venus",
> +		.data = &sc8280xp_data,
> +	},
> +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
>   	{
>   		.compatible = "qcom,sm8250-venus",
>   		.data = &sm8250_data,
>   	},
>   #endif
> +	{
> +		.compatible = "qcom,sm8350-venus",
> +		.data = &sm8350_data,
> +	},
>   	{
>   		.compatible = "qcom,sm8550-iris",
>   		.data = &sm8550_data,
> 
> --
> 2.47.3
> 
> 


