Return-Path: <linux-media+bounces-29899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A865CA83E4A
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 11:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6618189C9F0
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 09:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5525202981;
	Thu, 10 Apr 2025 09:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="blJmOsJQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0961EB1B7;
	Thu, 10 Apr 2025 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744276398; cv=none; b=RV5mX+EJets5MS1pmJXSaRJ2kE/wnm5Z9JlKMKh3hczwY1vJHNa3olmCCLCZ+5qqSIjCeGp71KPc8Uve5EVArOQurD8TCEkVVmDtVjzlCL9R2VVrMA4nDSzd75GL2KES2WtgG9Xid70dEgqvbGB3MykVZNkuiCykDb6+zVv87dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744276398; c=relaxed/simple;
	bh=eROGiWyyKRA30TXhkeHexreM8yWNVWi8Icf0IEk9t5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Bux3EhVP/cX+kKcwRSUAZjrWyionbY+YU5T6qY0kvJzqT85yaKv8MAwNHzQ4KoXkrbWW8exwsPT3ALyyWEwYmkqcrcO/j9ytXaAHOFMZ+Et2IBE49hRpyMGbYBR6JlR5OsWvSp1FUYDdEC1XCS7zNyqPozz9qu2hPd5R0pRtGX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=blJmOsJQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75Z1b032011;
	Thu, 10 Apr 2025 09:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ph/m1NmZNNVsdJxZ86mMU8owZ40APU8o+/n6XL9o/Z8=; b=blJmOsJQHAPIs0uJ
	S+FB1osXFyauqYd6ZRvHFm6gqSAC6D6mwMw3kFyGhdmAnMLARghw8IDokrc/24Cf
	KbxNMvYer4OzNGemLsWbe2/cd2wrwGKIS6Kss/VjyFohiKKDMvwp/yKL2kEfEtGa
	7XfjMyQ5vulCojwnV1/iTC08unYv7vXZAc9ozrJuKVjH+wUE5eex8s4VP0W2G9Tf
	Yvbn3K1Y5yENfJ8vis3GKQS+VmYwrrBDd6B8HYe1cFDK6S4oGeAiyWBr84rcET3f
	liXFPas3zXj6or3dYtnf/NXNtDNr2KWFrek+4N/XNIjEzktirDbvpppTrJIBBH95
	h4yexA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpme9ck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 09:13:07 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53A9D7gC020924
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 09:13:07 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Apr
 2025 02:13:03 -0700
Message-ID: <8cade183-72ac-eac1-1a57-a9db37657fca@quicinc.com>
Date: Thu, 10 Apr 2025 14:43:00 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 6/6] media: platform: qcom/iris: add sm8650 support
Content-Language: en-US
To: <neil.armstrong@linaro.org>, Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>
References: <20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org>
 <20250409-topic-sm8x50-iris-v10-v4-6-40e411594285@linaro.org>
 <36e25d6e-36de-fec6-e54d-0683503c7a09@quicinc.com>
 <1550c870-188e-4b41-b17c-2009cda41ffc@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <1550c870-188e-4b41-b17c-2009cda41ffc@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZBBEYHDe0TPmlJoVdThTPNxC9Qnj_k6c
X-Proofpoint-ORIG-GUID: ZBBEYHDe0TPmlJoVdThTPNxC9Qnj_k6c
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f78ba4 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=TPletkAchsLoiRCZPXgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100068


On 4/10/2025 2:31 PM, Neil Armstrong wrote:
> On 09/04/2025 18:57, Vikash Garodia wrote:
>> Hi Neil,
>>
>> On 4/9/2025 8:08 PM, Neil Armstrong wrote:
>>> Add support for the SM8650 platform by re-using the SM8550
>>> definitions and using the vpu33 ops.
>>>
>>> The SM8650/vpu33 requires more reset lines, but the H.264
>>> decoder capabilities are identical.
>>>
>>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>>   .../platform/qcom/iris/iris_platform_sm8550.c      | 64 ++++++++++++++++++++++
>>>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
>>>   3 files changed, 69 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> index
>>> fdd40fd80178c4c66b37e392d07a0a62f492f108..6bc3a7975b04d612f6c89206eae95dac678695fc 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>> @@ -35,6 +35,7 @@ enum pipe_type {
>>>     extern struct iris_platform_data sm8250_data;
>>>   extern struct iris_platform_data sm8550_data;
>>> +extern struct iris_platform_data sm8650_data;
>>>     enum platform_clk_type {
>>>       IRIS_AXI_CLK,
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>>> b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>>> index
>>> 35d278996c430f2856d0fe59586930061a271c3e..d0f8fa960d53367023e41bc5807ba3f8beae2efc 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>>> @@ -144,6 +144,10 @@ static const struct icc_info sm8550_icc_table[] = {
>>>     static const char * const sm8550_clk_reset_table[] = { "bus" };
>>>   +static const char * const sm8650_clk_reset_table[] = { "bus", "core" };
>>> +
>>> +static const char * const sm8650_controller_reset_table[] = { "xo" };
>>> +
>>>   static const struct bw_info sm8550_bw_table_dec[] = {
>>>       { ((4096 * 2160) / 256) * 60, 1608000 },
>>>       { ((4096 * 2160) / 256) * 30,  826000 },
>>> @@ -264,3 +268,63 @@ struct iris_platform_data sm8550_data = {
>>>       .dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>>>       .dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>>>   };
>>> +
>>> +/*
>>> + * Shares most of SM8550 data except:
>>> + * - vpu_ops to iris_vpu33_ops
>>> + * - clk_rst_tbl to sm8650_clk_reset_table
>>> + * - controller_rst_tbl to sm8650_controller_reset_table
>>> + * - fwname to "qcom/vpu/vpu33_p4.mbn"
>>> + */
>>> +struct iris_platform_data sm8650_data = {
>>> +    .get_instance = iris_hfi_gen2_get_instance,
>>> +    .init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>>> +    .init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>>> +    .vpu_ops = &iris_vpu33_ops,
>>> +    .set_preset_registers = iris_set_sm8550_preset_registers,
>>> +    .icc_tbl = sm8550_icc_table,
>>> +    .icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>>> +    .clk_rst_tbl = sm8650_clk_reset_table,
>>> +    .clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
>>> +    .controller_rst_tbl = sm8650_controller_reset_table,
>>> +    .controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
>>> +    .bw_tbl_dec = sm8550_bw_table_dec,
>>> +    .bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
>>> +    .pmdomain_tbl = sm8550_pmdomain_table,
>>> +    .pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
>>> +    .opp_pd_tbl = sm8550_opp_pd_table,
>>> +    .opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>>> +    .clk_tbl = sm8550_clk_table,
>>> +    .clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
>>> +    /* Upper bound of DMA address range */
>>> +    .dma_mask = 0xe0000000 - 1,
>>> +    .fwname = "qcom/vpu/vpu33_p4.mbn",
>>> +    .pas_id = IRIS_PAS_ID,
>>> +    .inst_caps = &platform_inst_cap_sm8550,
>>> +    .inst_fw_caps = inst_fw_cap_sm8550,
>>> +    .inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_sm8550),
>>> +    .tz_cp_config_data = &tz_cp_config_sm8550,
>>> +    .core_arch = VIDEO_ARCH_LX,
>>> +    .hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>>> +    .ubwc_config = &ubwc_config_sm8550,
>>> +    .num_vpp_pipe = 4,
>>> +    .max_session_count = 16,
>>> +    .max_core_mbpf = ((8192 * 4352) / 256) * 2,
>>> +    .input_config_params =
>>> +        sm8550_vdec_input_config_params,
>>> +    .input_config_params_size =
>>> +        ARRAY_SIZE(sm8550_vdec_input_config_params),
>>> +    .output_config_params =
>>> +        sm8550_vdec_output_config_params,
>>> +    .output_config_params_size =
>>> +        ARRAY_SIZE(sm8550_vdec_output_config_params),
>>> +    .dec_input_prop = sm8550_vdec_subscribe_input_properties,
>>> +    .dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
>>> +    .dec_output_prop = sm8550_vdec_subscribe_output_properties,
>>> +    .dec_output_prop_size =
>>> ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
>>> +
>>> +    .dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>>> +    .dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>>> +    .dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>>> +    .dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>>> +};
>> While i was extending the data for QCS8300 (one another iris-v3 variant), i
>> realize that this file iris_platform_sm8550.c is getting dumped with all SOC
>> platform data. It would be a good idea at this point to split it into something
>> like this
>> 1. Introduce SOC specific c file and move the respective SOC platform data to
>> it, for ex, in this case sm8650_data
>> 2. Move the common structs from iris_platform_sm8550.c to
>> iris_platform_common.h. This way more SOCs getting added in future, can include
>> the common header to reuse them, otherwise it would end up using 8550.c for all
>> future SOC.
>>
>> Share your comments if you have any better approach to manage/re-use these
>> platform data considering more SOCs getting added.
> 
> Right, yes the architecture is fine, but I don't feel iris_platform_common is
> the right
> place, perhaps we could introduce a platform_catalog.c where we could place all
> the common
> platform data and reuse them from the platform_<soc>.c files ?
Common structs would certainly need to be part of a header which can be
included. Where do you plan to keep common struct to be used across SOC specific
file in your approach ?
> 
> I can design prototype on top of this patchset as an RFC.
I was thinking that the changes are not that big, and can be done in existing
series though.

Thanks,
Vikash
> 
> Neil
> 
>>
>> Regards,
>> Vikash
>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c
>>> b/drivers/media/platform/qcom/iris/iris_probe.c
>>> index
>>> 4f8bce6e2002bffee4c93dcaaf6e52bf4e40992e..7cd8650fbe9c09598670530103e3d5edf32953e7 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>>> @@ -345,6 +345,10 @@ static const struct of_device_id iris_dt_match[] = {
>>>               .data = &sm8250_data,
>>>           },
>>>   #endif
>>> +    {
>>> +        .compatible = "qcom,sm8650-iris",
>>> +        .data = &sm8650_data,
>>> +    },
>>>       { },
>>>   };
>>>   MODULE_DEVICE_TABLE(of, iris_dt_match);
>>>
> 

