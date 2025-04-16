Return-Path: <linux-media+bounces-30324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9834CA8B83D
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 14:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA9D4445E2D
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 12:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9AB238C21;
	Wed, 16 Apr 2025 12:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hStAe5+b"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB94223D2AD;
	Wed, 16 Apr 2025 12:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805054; cv=none; b=g8UjXSuXJiCVaHMvldP9USsC7ougajQsgH1YlT/mBhRtf402iuyP8eNCYToP/UE2ikMAGL4/vwLCL/RvW6WO/dlSeNREzLxPwjVU6z/Wod/JkobRQ4RO7QxXaRrT10t8MgaFIPKA0KKmsXAYhOWtACa3v5a6LNu2iI3ZsURJ5/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805054; c=relaxed/simple;
	bh=pRy/yf3rb2f/5vary4SI2XiqiIspzuR69I8MYwOtfLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XJvQB9zJdrT5L+pUiSNoUmwnDesqTy4SU6m6IA8pfiBbIKZPHa/nYwXw/n8fIiip58hS/lYX7X6EUq42aGl/w/8/LJz5G8T5akgozKodAndPluBTX2QUaXrB7gi6tY8eqMFAd7PDi+qQnI4z+rnIJSNT0S2VKKC/uwihfDYwU+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hStAe5+b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mFjt007022;
	Wed, 16 Apr 2025 12:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R4agLGYVcIwurlDn1M6IVPranaN65EgP6yHwFxXfH6c=; b=hStAe5+bc0jGhpI/
	YhnYlZTSQGDqz07cdDnI0IvCmZSKDhvrj+K+CM86THPWtBXaGPFHjlSedX4ll3TN
	20sLuFzYH0fqRNl+fl3Mht1qWfbcv2jzF8o+K3BGsB9oX2eyFOor3EINxio8YXqZ
	TXGl9WfUp1mlHV0dWmkhkBsm88tyei/baE4QHoMa9ofmx2KiHGRoRq3MHEfozT+x
	4dEcdPeHsHg0gMCRYIe33O9JMg8/+vAxxO3+2rEl+cHN5J/GmBwrRbBhAZ0Ilu/O
	qkiW7jglfv8HLAgWWwgNqMjdyANqqWcvdjyOwCDPH15ObgX7ooLHHSSvFhEIugeo
	b1UBow==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjkc33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 12:04:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53GC43x8018224
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 12:04:03 GMT
Received: from [10.206.107.210] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Apr
 2025 05:03:59 -0700
Message-ID: <38f41c8b-1795-dc84-afce-dd222b7f3be1@quicinc.com>
Date: Wed, 16 Apr 2025 17:33:56 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 7/7] media: platform: qcom/iris: add sm8650 support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250415-topic-sm8x50-iris-v10-v6-0-8ad319094055@linaro.org>
 <20250415-topic-sm8x50-iris-v10-v6-7-8ad319094055@linaro.org>
 <085acdab-87b0-3a94-72fd-881d517d95cb@quicinc.com>
 <opy25iocdw5i2go5male5rzwoxl2hd4jxxjqj77qjiyxz7vens@wmrnrfuakhjs>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <opy25iocdw5i2go5male5rzwoxl2hd4jxxjqj77qjiyxz7vens@wmrnrfuakhjs>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5ZnS_a2uM5yrUDiGIWCD9EkmqMXUqe17
X-Proofpoint-ORIG-GUID: 5ZnS_a2uM5yrUDiGIWCD9EkmqMXUqe17
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67ff9cb5 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=2r83TW8UEMx5wHHBcaUA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160098



On 4/16/2025 4:53 PM, Dmitry Baryshkov wrote:
> On Wed, Apr 16, 2025 at 03:55:35PM +0530, Dikshita Agarwal wrote:
>>
>>
>> On 4/15/2025 7:17 PM, Neil Armstrong wrote:
>>> Add support for the SM8650 platform by re-using the SM8550
>>> definitions and using the vpu33 ops.
>>>
>>> Move the reset tables that diffes in a per-SoC platform
>>> header, that will contain mode SoC specific data when
>>> more codecs are introduced.
>>>
>>> The SM8650/vpu33 requires more reset lines, but the H.264
>>> decoder capabilities are identical.
>>>
>>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 65 +++++++++++++++++++++-
>>>  .../platform/qcom/iris/iris_platform_sm8550.h      | 11 ++++
>>>  .../platform/qcom/iris/iris_platform_sm8650.h      | 13 +++++
>>>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
>>>  5 files changed, 92 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> index fdd40fd80178c4c66b37e392d07a0a62f492f108..6bc3a7975b04d612f6c89206eae95dac678695fc 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> @@ -35,6 +35,7 @@ enum pipe_type {
>>>  
>>>  extern struct iris_platform_data sm8250_data;
>>>  extern struct iris_platform_data sm8550_data;
>>> +extern struct iris_platform_data sm8650_data;
>>>  
>>>  enum platform_clk_type {
>>>  	IRIS_AXI_CLK,
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>> index 35d278996c430f2856d0fe59586930061a271c3e..6d1771bd68689d96b5b9087b0ad32b934f7295ee 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>>> @@ -10,6 +10,9 @@
>>>  #include "iris_platform_common.h"
>>>  #include "iris_vpu_common.h"
>>>  
>>> +#include "iris_platform_sm8550.h"
>>> +#include "iris_platform_sm8650.h"
>>> +
>>>  #define VIDEO_ARCH_LX 1
>>>  
>>>  static struct platform_inst_fw_cap inst_fw_cap_sm8550[] = {
>>> @@ -142,8 +145,6 @@ static const struct icc_info sm8550_icc_table[] = {
>>>  	{ "video-mem",  1000, 15000000 },
>>>  };
>>>  
>>> -static const char * const sm8550_clk_reset_table[] = { "bus" };
>>> -
>>>  static const struct bw_info sm8550_bw_table_dec[] = {
>>>  	{ ((4096 * 2160) / 256) * 60, 1608000 },
>>>  	{ ((4096 * 2160) / 256) * 30,  826000 },
>>> @@ -264,3 +265,63 @@ struct iris_platform_data sm8550_data = {
>>>  	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>>>  	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>>>  };
>>> +
>>> +/*
>>> + * Shares most of SM8550 data except:
>>> + * - vpu_ops to iris_vpu33_ops
>>> + * - clk_rst_tbl to sm8650_clk_reset_table
>>> + * - controller_rst_tbl to sm8650_controller_reset_table
>>> + * - fwname to "qcom/vpu/vpu33_p4.mbn"
>>> + */
>>> +struct iris_platform_data sm8650_data = {
>>> +	.get_instance = iris_hfi_gen2_get_instance,
>>> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>>> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>>> +	.vpu_ops = &iris_vpu33_ops,
>>> +	.set_preset_registers = iris_set_sm8550_preset_registers,
>>> +	.icc_tbl = sm8550_icc_table,
>>> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>>> +	.clk_rst_tbl = sm8650_clk_reset_table,
>>> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
>>> +	.controller_rst_tbl = sm8650_controller_reset_table,
>>> +	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
>>> +	.bw_tbl_dec = sm8550_bw_table_dec,
>>> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
>>> +	.pmdomain_tbl = sm8550_pmdomain_table,
>>> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
>>> +	.opp_pd_tbl = sm8550_opp_pd_table,
>>> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>>> +	.clk_tbl = sm8550_clk_table,
>>> +	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
>>> +	/* Upper bound of DMA address range */
>>> +	.dma_mask = 0xe0000000 - 1,
>>> +	.fwname = "qcom/vpu/vpu33_p4.mbn",
>>> +	.pas_id = IRIS_PAS_ID,
>>> +	.inst_caps = &platform_inst_cap_sm8550,
>>> +	.inst_fw_caps = inst_fw_cap_sm8550,
>>> +	.inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_sm8550),
>>> +	.tz_cp_config_data = &tz_cp_config_sm8550,
>>> +	.core_arch = VIDEO_ARCH_LX,
>>> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>>> +	.ubwc_config = &ubwc_config_sm8550,
>>> +	.num_vpp_pipe = 4,
>>> +	.max_session_count = 16,
>>> +	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
>>> +	.input_config_params =
>>> +		sm8550_vdec_input_config_params,
>>> +	.input_config_params_size =
>>> +		ARRAY_SIZE(sm8550_vdec_input_config_params),
>>> +	.output_config_params =
>>> +		sm8550_vdec_output_config_params,
>>> +	.output_config_params_size =
>>> +		ARRAY_SIZE(sm8550_vdec_output_config_params),
>>> +	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
>>> +	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
>>> +	.dec_output_prop = sm8550_vdec_subscribe_output_properties,
>>> +	.dec_output_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
>>> +
>>> +	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>>> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>>> +	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>>> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>>> +};
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.h b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..ac8847edb585e4a9ce6b669a3a5988e7809972af
>>> --- /dev/null
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.h
>>> @@ -0,0 +1,11 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>> + */
>>> +
>>> +#ifndef __IRIS_PLATFORM_SM8550_H__
>>> +#define __IRIS_PLATFORM_SM8550_H__
>>> +
>>> +static const char * const sm8550_clk_reset_table[] = { "bus" };
>>> +
>>> +#endif
>> There is no need of iris_platform_sm8550.h, you can keep this entry in
>> gen2.c file itself. As we are making that our base.
> 
> That would make it unsymmetrical. I think having a separate header is a
> better option.
> 
It can never by symmetrical anyways.
As we add new SOCs, Some other platform data might differ for that SOC. And
then SOC specific file will have that entry only. We won't be taking out
that table from common and have it in all SOC platform files to make it
symmetrical again.

Thanks,
Dikshita
>> You can just have iris_platform_sm8650.h which overrides this entry with
>> SOC specific reset requirements for SM8650.
>>
>> Thanks,
>> Dikshita
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8650.h b/drivers/media/platform/qcom/iris/iris_platform_sm8650.h
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..75e9d572e788de043a56cf85a4cb634bd02226b9
>>> --- /dev/null
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8650.h
>>> @@ -0,0 +1,13 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>> + */
>>> +
>>> +#ifndef __IRIS_PLATFORM_SM8650_H__
>>> +#define __IRIS_PLATFORM_SM8650_H__
>>> +
>>> +static const char * const sm8650_clk_reset_table[] = { "bus", "core" };
>>> +
>>> +static const char * const sm8650_controller_reset_table[] = { "xo" };
>>> +
>>> +#endif
>>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>>> index 4f8bce6e2002bffee4c93dcaaf6e52bf4e40992e..7cd8650fbe9c09598670530103e3d5edf32953e7 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>>> @@ -345,6 +345,10 @@ static const struct of_device_id iris_dt_match[] = {
>>>  			.data = &sm8250_data,
>>>  		},
>>>  #endif
>>> +	{
>>> +		.compatible = "qcom,sm8650-iris",
>>> +		.data = &sm8650_data,
>>> +	},
>>>  	{ },
>>>  };
>>>  MODULE_DEVICE_TABLE(of, iris_dt_match);
>>>
> 

