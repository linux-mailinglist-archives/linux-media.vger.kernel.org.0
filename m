Return-Path: <linux-media+bounces-37854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B60B07157
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 11:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46D941898474
	for <lists+linux-media@lfdr.de>; Wed, 16 Jul 2025 09:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5AC2F4A09;
	Wed, 16 Jul 2025 09:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RN+Ia/TY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2452F004B;
	Wed, 16 Jul 2025 09:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752657029; cv=none; b=XKfweRrvresOEt9tVwhbLc6fLPj/XynZAxNipY/ITFTHkuI+RktCoy6QH0IA/NjTa+/A3GEVqZTcMq8hHAgj6FC4a6jkxC46HFU8t+PinUq4qvPAXnsdHddRywbnCxXj6jW4205FfFZ0sCW7Rskm1fiBu0xJeffQavtAQPc+bXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752657029; c=relaxed/simple;
	bh=QpBzlDT1iyEWFpAEZC6I0xIWmpZwo6tBBZNY8MkatiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=j0PxR1VCSfPhq2brWk60j7W3p5ncRzjcD+4MdcAG/WbmBNZl0CYqkJDJ6dXlCU3aTNx8vCP25w3dTKocDxMtbejkIJx0CpRl2os/txtQuw4k8aX3LZlHsmI5PpbKV7OFVDsdu+FHyPv72+2uZrZO3iisMuloYqNORGDKKuY7inI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RN+Ia/TY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G5vAS4025949;
	Wed, 16 Jul 2025 09:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G5gH6uBlUAkvet3Bh+WBjap2edZNH54VU3cplTt52Qs=; b=RN+Ia/TYC7WBQz/j
	8JJ4v01rzyDqCIIFUdpHSoC/slYbjRY4kcddfJLMMLaGrsXkHtiYggNHEg/eJ7kD
	dgmIiTdg7UQPOw+Vz+kS+JXHkuRFk9GQnrui6iGSPgEjhbHduyntbsWC85MFiEZ8
	HW7ZiCEhiTtCrwT9DTU19ToEOl3ck5s/Xzdf+10oIt7hcHIcg8xPm0b+ALBX6zPd
	KU0nIRdzBc+Ybx7xPOg6yNXiHftFUu0EBINvapmQ9ldYo3yguQcRWoLXM7GfMmYA
	ZYSQCZTUYaKbEiWIhOQuT/3QkfRrMbyUUFgNigQ2ekK7gvz9slmuDUluXK8pXiM0
	GDR5hQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsy3279-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 09:10:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56G9AFhp008763
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 09:10:16 GMT
Received: from [10.50.31.103] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 16 Jul
 2025 02:10:10 -0700
Message-ID: <7b0a984f-b62a-ac4d-74bf-a6e839c59272@quicinc.com>
Date: Wed, 16 Jul 2025 14:40:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] media: iris: Add support for SM8750 (VPU v3.5)
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250714-sm8750-iris-v1-0-3006293a5bc7@linaro.org>
 <20250714-sm8750-iris-v1-3-3006293a5bc7@linaro.org>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250714-sm8750-iris-v1-3-3006293a5bc7@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA4MSBTYWx0ZWRfX7VntqBmkx+wG
 E5yUwb1aBn2nT2QBWmKbQp+5CFElhL3/KzmnTr6MbWMw324PK5fXSTtq7b2KRSpxDcOSuTb2yve
 lWgiVMYGvQlEZvv56JgEzXjM36WqU1tnjHZ6Z3c8sGhBGLxWgLwbvkrNr/B8mVjJScak3almtWT
 zaJzYnUZ05293uNeGdl65SGAiAoUcLnHUZSHYmfYraGuxCJ5rfRy6vg56kUGe/m5gdnc+ydwycq
 zwFljPqTJkU4uTDyR79p04I6zLbL+Ku2HxyWIbB83sKsAWhu7UtO0tv1ZBuJRGLhsqb10wpSp21
 uWDFvP12r6UdCPZgLz6NarwLRzX0t0RAAIvUytNpD51fCysphXdjICzjXtWO3bhZZTsGdYr4bRY
 BmyrL0SHW0Ax+881v/+qfJYOQ1Qsp0rYo+kEpGiihW5urY60klqgF/PfuJVP8kB9TijV8ZZ4
X-Proofpoint-GUID: n7-gfq_0Ss8CYofZ-SN4iy09ZlEQzvTg
X-Proofpoint-ORIG-GUID: n7-gfq_0Ss8CYofZ-SN4iy09ZlEQzvTg
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=68776c78 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8
 a=ACxjjzN5Br_y0B3igH0A:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160081



On 7/14/2025 7:11 PM, Krzysztof Kozlowski wrote:
> Add support for SM8750 Iris codec with major differences against
> previous generation SM8650:
> 
> 1. New clocks and new resets, thus new power up and power down
>    sequences,
> 
> 2. New WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0 register programmed
>    during boot-up
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |   6 +-
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  68 +++++++
>  .../platform/qcom/iris/iris_platform_sm8750.h      |  22 +++
>  drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 203 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.c |   4 +
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
>  7 files changed, 308 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index adafdce8a856f9c661aabc5ca28f0faceaa93551..fd5a6e69e01cfd00253f4ffb282d40112b93073b 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -38,11 +38,15 @@ extern struct iris_platform_data qcs8300_data;
>  extern struct iris_platform_data sm8250_data;
>  extern struct iris_platform_data sm8550_data;
>  extern struct iris_platform_data sm8650_data;
> +extern struct iris_platform_data sm8750_data;
>  
>  enum platform_clk_type {
> -	IRIS_AXI_CLK,
> +	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
>  	IRIS_CTRL_CLK,
>  	IRIS_HW_CLK,
> +	IRIS_AXI1_CLK,
> +	IRIS_CTRL_FREERUN_CLK,
> +	IRIS_HW_FREERUN_CLK,
>  };
>  
>  struct platform_clk_data {
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index d3026b2bcb708c7ec31f134f628df7e57b54af4f..795efe2226228c4d7155ce18ff42ba9cb74b4af2 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2025 Linaro Ltd
>   */
>  
>  #include "iris_core.h"
> @@ -12,6 +13,7 @@
>  
>  #include "iris_platform_qcs8300.h"
>  #include "iris_platform_sm8650.h"
> +#include "iris_platform_sm8750.h"
>  
>  #define VIDEO_ARCH_LX 1
>  
> @@ -463,6 +465,72 @@ struct iris_platform_data sm8650_data = {
>  	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>  };
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
> +	.fwname = "qcom/vpu/vpu35_4v.mbn",
Could you clarify where this firmware has been merged? Also, it appears
that the naming convention hasn't been followed.
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
>  /*
>   * Shares most of SM8550 data except:
>   * - inst_caps to platform_inst_cap_qcs8300
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
>  		.compatible = "qcom,sm8650-iris",
>  		.data = &sm8650_data,
>  	},
> +	{
> +		.compatible = "qcom,sm8750-iris",
> +		.data = &sm8750_data,
> +	},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, iris_dt_match);
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index c235112057aa7b7eab1995737541b7a8276ff18b..b00702a4d6c23258550a77373eb34740e785ef22 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2025 Linaro Ltd
>   */
>  
>  #include <linux/iopoll.h>
> @@ -19,8 +20,11 @@
>  #define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
>  #define REQ_POWER_DOWN_PREP			BIT(0)
>  #define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
> +#define WRAPPER_CORE_POWER_CONTROL		(WRAPPER_BASE_OFFS + 0x84)
>  #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
>  #define CORE_CLK_RUN				0x0
> +/* VPU v3.5 */
> +#define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
>  
>  #define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
>  #define CTL_AXI_CLK_HALT			BIT(0)
> @@ -52,6 +56,8 @@
>  #define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
>  #define NOC_HALT				BIT(0)
>  #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
> +#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL	(AON_BASE_OFFS + 0x2C)
> +#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS	(AON_BASE_OFFS + 0x30)
>  
>  static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
>  {
> @@ -225,6 +231,194 @@ static int iris_vpu33_power_off_controller(struct iris_core *core)
>  	return 0;
>  }
>  
> +static int iris_vpu35_power_on_hw(struct iris_core *core)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +	if (ret)
> +		return ret;
> +
> +	/* Switch GDSC to SW control */
> +	writel(0x0, core->reg_base + WRAPPER_CORE_POWER_CONTROL);
GDSCs have been transitioned from HW_CTRL to HW_CTRL_TRIGGER, placing them
under software control by default, what is the need of doing this?
> +	ret = readl_poll_timeout(core->reg_base + WRAPPER_CORE_POWER_STATUS,
> +				 val, val & BIT(1), 200, 2000);
> +	if (ret)
> +		goto err_disable_power;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
> +	if (ret)
> +		goto err_gdsc;
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
> +err_gdsc:
> +	writel(BIT(0), core->reg_base + WRAPPER_CORE_POWER_CONTROL);
> +err_disable_power:
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +
> +	return ret;
> +}
> +
> +static void iris_vpu35_power_off_hw(struct iris_core *core)
> +{
> +	u32 val = 0, value, i;
> +	int ret;
> +
> +	if (iris_vpu3x_hw_power_collapsed(core))
> +		goto disable_power;
> +
> +	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
> +	if (value)
> +		writel(CORE_CLK_RUN, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
> +
> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
> +		ret = readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN + 4 * i,
> +					 val, val & 0x400000, 2000, 20000);
> +		if (ret)
> +			goto disable_power;
> +	}
> +
> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
> +				 val, val & BIT(0), 200, 2000);
what are you polling here for?
> +	if (ret)
> +		goto disable_power;
> +
> +	/* set MNoC to low power, set PD_NOC_QREQ (bit 0) */
Could you share the reference for this sqeunece, this looks half-cooked.
Would recommend following Hardware programmin guide(HPG) for this.
> +	writel(BIT(0), core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
> +
> +	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +
> +disable_power:
> +	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
> +	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
> +
> +	writel(BIT(0), core->reg_base + WRAPPER_CORE_POWER_CONTROL);
> +	/*
> +	 * Do not wait for power-down, because hardware might delay it (it
> +	 * always timeouts).
> +	 */
> +
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +}
> +
> +static int iris_vpu35_power_off_controller(struct iris_core *core)
> +{
> +	u32 xo_rst_tbl_size = core->iris_platform_data->controller_rst_tbl_size;
where is controller_rst_tbl_size defined for this SOC?
> +	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
> +	u32 val = 0;
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
> +	writel(0x0, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
> +
> +	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS,
> +				 val, val & (BIT(0) | BIT(1) | BIT(2)), 15, 1000);
doesn't seems right and missing retry logic. would recommend referring HPG.
> +	if (ret)
> +		goto disable_power;
> +
> +	writel(0x0, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
> +
> +	writel(0x0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
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
> +	reset_control_bulk_assert(xo_rst_tbl_size, core->controller_resets);
??
> +
> +	usleep_range(400, 500);
> +
> +	reset_control_bulk_deassert(xo_rst_tbl_size, core->controller_resets);
> +
> +	return 0;
> +}
> +
> +static int iris_vpu35_power_on_controller(struct iris_core *core)
> +{
> +	u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
> +	int ret;
> +
> +	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +	if (ret)
> +		return ret;
> +
> +	ret = reset_control_bulk_reset(rst_tbl_size, core->resets);
what is the reference for this?

Thanks,
Dikshita
> +	if (ret)
> +		goto err_disable_power;
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
>  static u64 iris_vpu3x_calculate_frequency(struct iris_inst *inst, size_t data_size)
>  {
>  	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
> @@ -277,3 +471,12 @@ const struct vpu_ops iris_vpu33_ops = {
>  	.power_on_controller = iris_vpu_power_on_controller,
>  	.calc_freq = iris_vpu3x_calculate_frequency,
>  };
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
>  static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
>  {
>  	u32 queue_size, value;
> +	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
>  
>  	/* Iris hardware requires 4K queue alignment */
>  	queue_size = ALIGN(sizeof(struct iris_hfi_queue_table_header) +
> @@ -105,6 +106,9 @@ static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
>  		value = (u32)core->sfr_daddr + core->iris_platform_data->core_arch;
>  		writel(value, core->reg_base + SFR_ADDR);
>  	}
> +
> +	if (vpu_ops->program_bootup_registers)
> +		vpu_ops->program_bootup_registers(core);
>  }
>  
>  int iris_vpu_boot_firmware(struct iris_core *core)
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index d95b305ca5a89ba8f08aefb6e6acd9ea4a721a8b..d636e287457adf0c44540af5c85cfa69decbca8b 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -11,12 +11,14 @@ struct iris_core;
>  extern const struct vpu_ops iris_vpu2_ops;
>  extern const struct vpu_ops iris_vpu3_ops;
>  extern const struct vpu_ops iris_vpu33_ops;
> +extern const struct vpu_ops iris_vpu35_ops;
>  
>  struct vpu_ops {
>  	void (*power_off_hw)(struct iris_core *core);
>  	int (*power_on_hw)(struct iris_core *core);
>  	int (*power_off_controller)(struct iris_core *core);
>  	int (*power_on_controller)(struct iris_core *core);
> +	void (*program_bootup_registers)(struct iris_core *core);
>  	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
>  };
>  
> 

