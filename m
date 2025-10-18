Return-Path: <linux-media+bounces-44947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A26FBEC8E7
	for <lists+linux-media@lfdr.de>; Sat, 18 Oct 2025 08:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 490D54E63B8
	for <lists+linux-media@lfdr.de>; Sat, 18 Oct 2025 06:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 907FB284671;
	Sat, 18 Oct 2025 06:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="khOAbZZG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F130C9443;
	Sat, 18 Oct 2025 06:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760770585; cv=none; b=AlysDMuc0f+AJzNhlqIod7lR8DZOb8beA3fYOSDqF508PY9BhXpldVoaPor2ILOq+r8l0BevUu4Ppde9EB7289UObjWOD8ui2IMhxDQjVsUfP+bjuYgv6uTIWXHM5tbHSbi1jj//iibTZRQW/FD4wTkYMzd/22Loe/bRWt2x8Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760770585; c=relaxed/simple;
	bh=c1ptQO/wDNhy8QpedubZ4P1OADYmTNYa8Zd1XvteLfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jZBtrNlFvd10z18Bi0KDC+9rScY6ZhgKgb0AaoI+k28KoZp+nYwy8PKFnNrZcGMX/F3HPyG5T+6bMyA1z/hjfgTR5TwMyniJhoCJZ/EMiGO4s6xTjg/+81PDRL3k2UDtH0jpJ9J/Ic7epzgsxurnsn2PtK0WylEzoIbqALZqwuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=khOAbZZG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59I35I4Z022886;
	Sat, 18 Oct 2025 06:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mm46bb4aLD2RIkHI1oRk/3WfHz57MEpYyd/TPCauwHw=; b=khOAbZZGwlK9AM1l
	KZbloGw4xZ8y5vtIs1qPgP7xIdYaiId4FFXmPoEUoN+LoEjwrO06DYQ975z39cCq
	CVGLj51GEY4ubrcVhS4neZNqlrH5xnnT+gkq07aqR5QB31t5xR3EK91ihDnV0xh8
	YCcy5oXHuOF2Cmswjd0P0zexDy9OGMJu6T6tskHf7XnmE5Xynsh1YXqgKuSIWzn+
	J57ucD4oA8/JhEoQB+IqmMHGSNLLYPf9Kklib9dE0t31wxE+Yc4EdCEI4ipsphnh
	UouELSWtgBPyajTGiP5D50TH5o9QWeyxDGwbnurDhEpwzRYKqEvPtR2e/tllhbaj
	2C4mqw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08p8jhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Oct 2025 06:56:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59I6u5mT013836
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 18 Oct 2025 06:56:05 GMT
Received: from [10.216.38.120] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Fri, 17 Oct
 2025 23:56:01 -0700
Message-ID: <86a8b2ab-2e72-fcdb-6241-6b5d0d97ecf5@quicinc.com>
Date: Sat, 18 Oct 2025 12:25:58 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 8/8] media: iris: Add platform data for kaanapali
Content-Language: en-US
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia
	<vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal
	<dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <4-Uqk007ML-Q9NW-SjN7t6kX_tmucJiWOgoCTosvL2KPNWFwQzquB-VcPUMtnHTnTIMdKSMyg7JQNpOUthu9FQ==@protonmail.internalid>
 <20250925-knp_video-v1-8-e323c0b3c0cd@oss.qualcomm.com>
 <a562c510-9c08-4acd-afe8-efb8aaceec66@kernel.org>
From: Vishnu Reddy <quic_bvisredd@quicinc.com>
In-Reply-To: <a562c510-9c08-4acd-afe8-efb8aaceec66@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfXzkyAUe7fcGix
 /Dkke+OXSyvn0zZiUk4H6YQdV+ern1eAiUT6ttlGySa/mPyj4IEWhu4XsxC7xtQXP39hnZEetuF
 zXAXWDhLcttKRhSn6m5idy+cOdV1xEsjZMfPRhBVPW9MiKEMLNoP2oM8VI2q8hdkofMVhyXOaPs
 2wJp2Kf7Nf0Lydv/eiKUgiIlpQIVCWzIJgIwkhtfjXNJaGo62g3RWLcKCFjpsMhHtiTFuARd8yN
 OQz6vsyrAX796FECIYxuOsxlDpe9/IZpnfyrA6RcGxOWWthW3IwDLOeUWazNCRWapWv/gSwNznJ
 Ag84/4FaGFuj5obpbGn5LWXY5MrcZIRsA9cRjbzLwIdigKOMqjJyugStE7PqPdhXlseEWQfd4Q3
 fdFgd5m4mbTfsDVNxdRsx9hBspTBOw==
X-Proofpoint-GUID: vAJpxSXWA1eyXyjZGJtl_G2HEB0VKYrh
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f33a06 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=YbQGGiGDzNgachNCrOIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: vAJpxSXWA1eyXyjZGJtl_G2HEB0VKYrh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-18_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000



On 10/2/2025 8:59 PM, Bryan O'Donoghue wrote:
> On 25/09/2025 00:14, Vikash Garodia wrote:
>> Add support for the kaanapali platform by re-using the SM8550
>> definitions and using the vpu4 ops.
>> Move the configurations that differs in a per-SoC platform
>> header, that will contain SoC specific data.
>>
>> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 86 
>> ++++++++++++++++++++++
>>   .../platform/qcom/iris/iris_platform_kaanapali.h   | 63 
>> ++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
>>   4 files changed, 154 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h 
>> b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 
>> d6d4a9fdfc189797f903dfeb56d931741b405ee2..465943db0c6671e9b564b40e31ce6ba2d645a84c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -46,6 +46,7 @@ extern struct iris_platform_data sm8250_data;
>>   extern struct iris_platform_data sm8550_data;
>>   extern struct iris_platform_data sm8650_data;
>>   extern struct iris_platform_data sm8750_data;
>> +extern struct iris_platform_data kaanapali_data;
>>
>>   enum platform_clk_type {
>>       IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI 
>> clocks */
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c 
>> b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> index 
>> 00c6b9021b98aac80612b1bb9734c8dac8146bd9..142b7d84ee00a9b65420158ac1f168515b56f4a3 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> @@ -15,6 +15,7 @@
>>   #include "iris_platform_qcs8300.h"
>>   #include "iris_platform_sm8650.h"
>>   #include "iris_platform_sm8750.h"
>> +#include "iris_platform_kaanapali.h"
>>
>>   #define VIDEO_ARCH_LX 1
>>   #define BITRATE_MAX                245000000
>> @@ -1095,3 +1096,88 @@ struct iris_platform_data qcs8300_data = {
>>       .enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>>       .enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>>   };
>> +
>> +struct iris_platform_data kaanapali_data = {
>> +    .get_instance = iris_hfi_gen2_get_instance,
>> +    .init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>> +    .init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>> +    .get_vpu_buffer_size = iris_vpu4x_buf_size,
>> +    .vpu_ops = &iris_vpu4x_ops,
>> +    .set_preset_registers = iris_set_sm8550_preset_registers,
>> +    .icc_tbl = sm8550_icc_table,
>> +    .icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>> +    .clk_rst_tbl = kaanapali_clk_reset_table,
>> +    .clk_rst_tbl_size = ARRAY_SIZE(kaanapali_clk_reset_table),
>> +    .bw_tbl_dec = sm8550_bw_table_dec,
>> +    .bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
>> +    .pmdomain_tbl = kaanapali_pmdomain_table,
>> +    .pmdomain_tbl_size = ARRAY_SIZE(kaanapali_pmdomain_table),
>> +    .opp_pd_tbl = sm8550_opp_pd_table,
>> +    .opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>> +    .clk_tbl = kaanapali_clk_table,
>> +    .clk_tbl_size = ARRAY_SIZE(kaanapali_clk_table),
>> +    .opp_clk_tbl = kaanapali_opp_clk_table,
>> +    /* Upper bound of DMA address range */
>> +    .dma_mask = 0xe0000000 - 1,
>> +    .fwname = "qcom/vpu/vpu40_p2.mbn",
>> +    .pas_id = IRIS_PAS_ID,
>> +    .inst_caps = &platform_inst_cap_sm8550,
>> +    .inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
>> +    .inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
>> +    .inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
>> +    .inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
>> +    .tz_cp_config_data = tz_cp_config_kaanapali,
>> +    .tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_kaanapali),
>> +    .core_arch = VIDEO_ARCH_LX,
>> +    .hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>> +    .ubwc_config = &ubwc_config_sm8550,
>> +    .num_vpp_pipe = 2,
>> +    .max_session_count = 16,
>> +    .max_core_mbpf = NUM_MBS_8K * 2,
>> +    .max_core_mbps = ((8192 * 4352) / 256) * 60,
>> +    .dec_input_config_params_default =
>> +        sm8550_vdec_input_config_params_default,
>> +    .dec_input_config_params_default_size =
>> +        ARRAY_SIZE(sm8550_vdec_input_config_params_default),
>> +    .dec_input_config_params_hevc =
>> +        sm8550_vdec_input_config_param_hevc,
>> +    .dec_input_config_params_hevc_size =
>> +        ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
>> +    .dec_input_config_params_vp9 =
>> +        sm8550_vdec_input_config_param_vp9,
>> +    .dec_input_config_params_vp9_size =
>> +        ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
>> +    .dec_output_config_params =
>> +        sm8550_vdec_output_config_params,
>> +    .dec_output_config_params_size =
>> +        ARRAY_SIZE(sm8550_vdec_output_config_params),
>> +
>> +    .enc_input_config_params =
>> +        sm8550_venc_input_config_params,
>> +    .enc_input_config_params_size =
>> +        ARRAY_SIZE(sm8550_venc_input_config_params),
>> +    .enc_output_config_params =
>> +        sm8550_venc_output_config_params,
>> +    .enc_output_config_params_size =
>> +        ARRAY_SIZE(sm8550_venc_output_config_params),
>> +
>> +    .dec_input_prop = sm8550_vdec_subscribe_input_properties,
>> +    .dec_input_prop_size = 
>> ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
>> +    .dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
>> +    .dec_output_prop_avc_size =
>> +        ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
>> +    .dec_output_prop_hevc = 
>> sm8550_vdec_subscribe_output_properties_hevc,
>> +    .dec_output_prop_hevc_size =
>> +        ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
>> +    .dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
>> +    .dec_output_prop_vp9_size =
>> +        ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
>> +
>> +    .dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>> +    .dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>> +    .dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>> +    .dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>> +
>> +    .enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>> +    .enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>> +};
>> diff --git 
>> a/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h 
>> b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..247fb9d7cb632d2e9a1e9832d087cb03ac9b7cf3
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_kaanapali.h
>> @@ -0,0 +1,63 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + */
>> +
>> +#ifndef __IRIS_PLATFORM_KAANAPALI_H__
>> +#define __IRIS_PLATFORM_KAANAPALI_H__
>> +
>> +#define VIDEO_REGION_VM0_SECURE_NP_ID        1
>> +#define VIDEO_REGION_VM0_NONSECURE_NP_ID    5
>> +
>> +static const char *const kaanapali_clk_reset_table[] = {
>> +    "bus0",
>> +    "bus1",
>> +    "core_freerun_reset",
>> +    "vcodec0_core_freerun_reset",
>> +};
>> +
>> +static const char *const kaanapali_pmdomain_table[] = {
>> +    "venus",
>> +    "vcodec0",
>> +    "vpp0",
>> +    "vpp1",
>> +    "apv",
>> +};
>> +
>> +static const struct platform_clk_data kaanapali_clk_table[] = {
>> +    { IRIS_AXI_CLK, "iface" },
>> +    { IRIS_CTRL_CLK, "core" },
>> +    { IRIS_HW_CLK, "vcodec0_core" },
>> +    { IRIS_AXI1_CLK, "iface1" },
>> +    { IRIS_CTRL_FREERUN_CLK, "core_freerun" },
>> +    { IRIS_HW_FREERUN_CLK, "vcodec0_core_freerun" },
>> +    { IRIS_BSE_HW_CLK, "vcodec_bse" },
>> +    { IRIS_VPP0_HW_CLK, "vcodec_vpp0" },
>> +    { IRIS_VPP1_HW_CLK, "vcodec_vpp1" },
>> +    { IRIS_APV_HW_CLK, "vcodec_apv" },
>> +};
>> +
>> +static const char *const kaanapali_opp_clk_table[] = {
>> +    "vcodec0_core",
>> +    "vcodec_apv",
>> +    "vcodec_bse",
>> +    "core",
>> +    NULL,
>> +};
> 
> Why are mxc and mmcx absett from this table ?
> 
> ---
> bod

mxc and mmcx OPP power domains listed in opp_pd_table 
(sm8550_opp_pd_table in iris_platform_gen2.c). This opp_pd_tbl list 
attached with PD_FLAG_DEV_LINK_ON | PD_FLAG_REQUIRED_OPP when calling 
devm_pm_domain_attach_list, while pmdomain_tbl list will be attached 
with PD_FLAG_NO_DEV_LINK flag.

Regards,
Vishnu Reddy

