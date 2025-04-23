Return-Path: <linux-media+bounces-30874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC77BA998AC
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 21:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 869553A863D
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 19:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83B729347D;
	Wed, 23 Apr 2025 19:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LsUiu1Ez"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8817C28F930;
	Wed, 23 Apr 2025 19:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745437042; cv=none; b=JeQO6bYl3yRKPjRpdtwjniIxE9sUMtOTBSeoJWAovj8OmkSFhRZY5G2CLeBUnGrSz/DAHXwRovReoSRqNpJXknduCqx9fZwSAYmC6sOlg4a/FKcvdiKM2VXLtOp9PPC3QSSEzkZR9St4OO++jr9JjLm8D3K+M6E+oLkJ/OStFiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745437042; c=relaxed/simple;
	bh=S1f44MWaWUUS1vp3aiLoLBfXjnH4A8QGNtVF8uyll18=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XH7jgnVGOKZghr8F9fJj5CAJ9QLqi7R/Ma9N0iEDMSyaInpik6XZ9wZYeyV4CWTcQOAkgUbk2k0nU9z4PEMkhQeqOYAd1/C1C1L90nZ43MnyCtnofiGVjHLTM5oInMjxYb4BjE3KEFkiah5u9DGcYvWvnrigilIjlKkustrx9gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LsUiu1Ez; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAw8Np021522;
	Wed, 23 Apr 2025 19:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P+C365WypAAc2annmVY5lfrxPcUXNCh6onV6iFDz6UM=; b=LsUiu1Ez9RWNo4jE
	3dZuKtqdEghoWX0nbG2Am1DyPbxkAFJDFyWuoKS+0Ho/aGa9c3VeGYLZXadyRHII
	uAQ/PPkoQ9QPhk171LRjcuaL5Q0s+2cz82RyJ2X21TuBaJ8K8A+u158o5MOD3MEa
	r2WZ+H2xruNn1demL4cVhpYvp4sJhqJOnEJ9Qv+8OyBG5QOHRkR4nfEfZTh3WTxK
	cJH+q6n6UoS8qg/iq2aCmNKCaNtqOBfFsK/6xFmlCGMBFkzf6yIdRZy8zmToP3+z
	+qH56GdPxs9ANlzbdgPczwqRs0ntgKbH0glyYJXe05YvKro03aCQKQDPTDKBcosK
	ah2N6A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh237yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 19:37:15 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53NJbEWt018751
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 19:37:14 GMT
Received: from [10.216.62.207] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Apr
 2025 12:37:10 -0700
Message-ID: <05f48eba-bbcb-814d-44b5-cb4d302828d2@quicinc.com>
Date: Thu, 24 Apr 2025 01:07:06 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/4] media: iris: add qcs8300 platform data
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal
	<quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250423-qcs8300_iris-v3-0-d7e90606e458@quicinc.com>
 <20250423-qcs8300_iris-v3-2-d7e90606e458@quicinc.com>
 <43f08fc9-6287-4df0-8d09-6572241621e8@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <43f08fc9-6287-4df0-8d09-6572241621e8@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=6809416b cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=W6ytlbDq_6f7t7Mh7GMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: b5MfrRHhoca1H0dvf7jS88e04azQ9dnm
X-Proofpoint-ORIG-GUID: b5MfrRHhoca1H0dvf7jS88e04azQ9dnm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEzNSBTYWx0ZWRfXwxW948fTMWU5 77aDSbP0JrbTbyQw64Z0TzJVDypP4EJPo5XMiC7oPQK+cEAA2Pqyqn/FYwV67o2GTWevfynAASk xZSGLk/lqT90ydeUL8IWMSQy3iJ3E9EfiRIpNJNbJQxZSOorpVe9JQW7k5y1hbVxFu+4M1IoWKZ
 IUunV78lxqAUruiZ+gSG9T6W4aUS51zE/QwVihQX6QE0ynio70OuLpPnP1bO1WjTJQZOgDujuuZ nXqBMTQuHww6vEknhI69GwFFV4ZcYa+SueHDhnqocOAcrqzmAHkvlVQq3cs2YxgcrlvcDxuzbIN L80hkF+X+dseUHZJ+5wkGS5wPLB8jDfOvI637ZhHjmGqzN2K/PPcx2p5w/8yEpD3V0+ommel/P4
 hIa93yNmNskLWDvArPQwUhiSSgCjDaXaFnwgdS1xAu6AzOpF4GG4uLlsaLdwBQEzeESLbt65
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230135


On 4/23/2025 9:16 PM, Bryan O'Donoghue wrote:
> On 23/04/2025 16:39, Vikash Garodia wrote:
>> Add platform data for QCS8300, which has different capabilities compared
>> to SM8550. Introduce a QCS8300 header that defines these capabilities
>> and fix the order of compat strings.
>>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>   .../platform/qcom/iris/iris_platform_common.h      |   1 +
>>   .../media/platform/qcom/iris/iris_platform_gen2.c  |  57 ++++++++++
>>   .../platform/qcom/iris/iris_platform_qcs8300.h     | 124 +++++++++++++++++++++
>>   drivers/media/platform/qcom/iris/iris_probe.c      |  16 ++-
>>   4 files changed, 192 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index
>> 6bc3a7975b04d612f6c89206eae95dac678695fc..3191a910653ce4bd71de9a0b4465fd583602adf6 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -36,6 +36,7 @@ enum pipe_type {
>>   extern struct iris_platform_data sm8250_data;
>>   extern struct iris_platform_data sm8550_data;
>>   extern struct iris_platform_data sm8650_data;
>> +extern struct iris_platform_data qcs8300_data;
>>     enum platform_clk_type {
>>       IRIS_AXI_CLK,
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> index
>> 5ff82296ee8ea5ad3954bd2254594048adcb8404..723e9f4cef42408168aca22b34ccd0a674a4fd25 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> @@ -11,6 +11,7 @@
>>   #include "iris_vpu_common.h"
>>     #include "iris_platform_sm8650.h"
>> +#include "iris_platform_qcs8300.h"
> 
> This is out of order, reviewing the header I don't believe there's any
> dependency in qcs8300.h on sm8650.h that justifies.
> 
> qcs8300.h
> sm8650.h
No dependency, fixed in v4.
> 
> 
>>     #define VIDEO_ARCH_LX 1
>>   @@ -326,3 +327,59 @@ struct iris_platform_data sm8650_data = {
>>       .dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>>       .dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>>   };
>> +
>> +/*
>> + * Shares most of SM8550 data except:
>> + * - inst_caps to platform_inst_cap_qcs8300
>> + * - inst_fw_caps to inst_fw_cap_qcs8300
>> + */
>> +struct iris_platform_data qcs8300_data = {
>> +    .get_instance = iris_hfi_gen2_get_instance,
>> +    .init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>> +    .init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>> +    .vpu_ops = &iris_vpu3_ops,
>> +    .set_preset_registers = iris_set_sm8550_preset_registers,
>> +    .icc_tbl = sm8550_icc_table,
>> +    .icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>> +    .clk_rst_tbl = sm8550_clk_reset_table,
>> +    .clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
>> +    .bw_tbl_dec = sm8550_bw_table_dec,
>> +    .bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
>> +    .pmdomain_tbl = sm8550_pmdomain_table,
>> +    .pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
>> +    .opp_pd_tbl = sm8550_opp_pd_table,
>> +    .opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>> +    .clk_tbl = sm8550_clk_table,
>> +    .clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
>> +    /* Upper bound of DMA address range */
>> +    .dma_mask = 0xe0000000 - 1,
>> +    .fwname = "qcom/vpu/vpu30_p4_s6.mbn",
>> +    .pas_id = IRIS_PAS_ID,
>> +    .inst_caps = &platform_inst_cap_qcs8300,
>> +    .inst_fw_caps = inst_fw_cap_qcs8300,
>> +    .inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_qcs8300),
>> +    .tz_cp_config_data = &tz_cp_config_sm8550,
>> +    .core_arch = VIDEO_ARCH_LX,
>> +    .hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>> +    .ubwc_config = &ubwc_config_sm8550,
>> +    .num_vpp_pipe = 2,
>> +    .max_session_count = 16,
>> +    .max_core_mbpf = ((4096 * 2176) / 256) * 4,
>> +    .input_config_params =
>> +        sm8550_vdec_input_config_params,
>> +    .input_config_params_size =
>> +        ARRAY_SIZE(sm8550_vdec_input_config_params),
>> +    .output_config_params =
>> +        sm8550_vdec_output_config_params,
>> +    .output_config_params_size =
>> +        ARRAY_SIZE(sm8550_vdec_output_config_params),
>> +    .dec_input_prop = sm8550_vdec_subscribe_input_properties,
>> +    .dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
>> +    .dec_output_prop = sm8550_vdec_subscribe_output_properties,
>> +    .dec_output_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
>> +
>> +    .dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>> +    .dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>> +    .dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>> +    .dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>> +};
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
>> b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
>> new file mode 100644
>> index
>> 0000000000000000000000000000000000000000..f82355d72fcffe7e361bd30877cccb83fe9b549f
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
>> @@ -0,0 +1,124 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +static struct platform_inst_fw_cap inst_fw_cap_qcs8300[] = {
>> +    {
>> +        .cap_id = PROFILE,
>> +        .min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
>> +        .max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
>> +        .step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
>> +            BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
>> +            BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
>> +            BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
>> +            BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
>> +        .value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>> +        .hfi_id = HFI_PROP_PROFILE,
>> +        .flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>> +        .set = iris_set_u32_enum,
>> +    },
>> +    {
>> +        .cap_id = LEVEL,
>> +        .min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
>> +        .max = V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
>> +        .step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
>> +            BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B)  |
>> +            BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
>> +            BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
>> +            BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
>> +            BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
>> +            BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
>> +            BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
>> +            BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
>> +            BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
>> +            BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
>> +            BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
>> +            BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
>> +            BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
>> +            BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
>> +            BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
>> +            BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
>> +            BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0) |
>> +            BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_1) |
>> +            BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_2),
>> +        .value = V4L2_MPEG_VIDEO_H264_LEVEL_6_1,
>> +        .hfi_id = HFI_PROP_LEVEL,
>> +        .flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>> +        .set = iris_set_u32_enum,
>> +    },
>> +    {
>> +        .cap_id = INPUT_BUF_HOST_MAX_COUNT,
>> +        .min = DEFAULT_MAX_HOST_BUF_COUNT,
>> +        .max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
>> +        .step_or_mask = 1,
>> +        .value = DEFAULT_MAX_HOST_BUF_COUNT,
>> +        .hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
>> +        .flags = CAP_FLAG_INPUT_PORT,
>> +        .set = iris_set_u32,
>> +    },
>> +    {
>> +        .cap_id = STAGE,
>> +        .min = STAGE_1,
>> +        .max = STAGE_2,
>> +        .step_or_mask = 1,
>> +        .value = STAGE_2,
>> +        .hfi_id = HFI_PROP_STAGE,
>> +        .set = iris_set_stage,
>> +    },
>> +    {
>> +        .cap_id = PIPE,
>> +        .min = PIPE_1,
>> +        .max = PIPE_2,
>> +        .step_or_mask = 1,
>> +        .value = PIPE_2,
>> +        .hfi_id = HFI_PROP_PIPE,
>> +        .set = iris_set_pipe,
>> +    },
>> +    {
>> +        .cap_id = POC,
>> +        .min = 0,
>> +        .max = 2,
>> +        .step_or_mask = 1,
>> +        .value = 1,
>> +        .hfi_id = HFI_PROP_PIC_ORDER_CNT_TYPE,
>> +    },
>> +    {
>> +        .cap_id = CODED_FRAMES,
>> +        .min = CODED_FRAMES_PROGRESSIVE,
>> +        .max = CODED_FRAMES_PROGRESSIVE,
>> +        .step_or_mask = 0,
>> +        .value = CODED_FRAMES_PROGRESSIVE,
>> +        .hfi_id = HFI_PROP_CODED_FRAMES,
>> +    },
>> +    {
>> +        .cap_id = BIT_DEPTH,
>> +        .min = BIT_DEPTH_8,
>> +        .max = BIT_DEPTH_8,
>> +        .step_or_mask = 1,
>> +        .value = BIT_DEPTH_8,
>> +        .hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
>> +    },
>> +    {
>> +        .cap_id = RAP_FRAME,
>> +        .min = 0,
>> +        .max = 1,
>> +        .step_or_mask = 1,
>> +        .value = 1,
>> +        .hfi_id = HFI_PROP_DEC_START_FROM_RAP_FRAME,
>> +        .flags = CAP_FLAG_INPUT_PORT,
>> +        .set = iris_set_u32,
>> +    },
>> +};
>> +
>> +static struct platform_inst_caps platform_inst_cap_qcs8300 = {
>> +    .min_frame_width = 96,
>> +    .max_frame_width = 4096,
>> +    .min_frame_height = 96,
>> +    .max_frame_height = 4096,
>> +    .max_mbpf = (4096 * 2176) / 256,
>> +    .mb_cycles_vpp = 200,
>> +    .mb_cycles_fw = 326389,
>> +    .mb_cycles_fw_vpp = 44156,
>> +    .num_comv = 0,
>> +};
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c
>> b/drivers/media/platform/qcom/iris/iris_probe.c
>> index
>> 7cd8650fbe9c09598670530103e3d5edf32953e7..6bc072c573e85b6d348e7d31509e8551ee0d1f16 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -335,16 +335,20 @@ static const struct dev_pm_ops iris_pm_ops = {
>>   };
>>     static const struct of_device_id iris_dt_match[] = {
>> +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
>> +    {
>> +        .compatible = "qcom,sm8250-venus",
>> +        .data = &sm8250_data,
>> +    },
>> +#endif
>> +    {
>> +        .compatible = "qcom,qcs8300-iris",
>> +        .data = &qcs8300_data,
>> +    },
> 
> same comment q should come before s in our ordered lists.
fixed in v4.
> 
>>       {
>>           .compatible = "qcom,sm8550-iris",
>>           .data = &sm8550_data,
>>       },
>> -#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
>> -        {
>> -            .compatible = "qcom,sm8250-venus",
>> -            .data = &sm8250_data,
>> -        },
>> -#endif
> 
> This part is right but should probably be a separate patch fixing the existing
> ordering.
Ok, added as a new patch to fix existing order in v4.

Regards,
Vikash
> 
>>       {
>>           .compatible = "qcom,sm8650-iris",
>>           .data = &sm8650_data,
>>
> ---bod

