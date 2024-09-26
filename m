Return-Path: <linux-media+bounces-18624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C98698721A
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 12:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FB962821F0
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 10:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56AFC1AD9F1;
	Thu, 26 Sep 2024 10:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oeKB6cYQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386C315A4AF;
	Thu, 26 Sep 2024 10:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727348169; cv=none; b=RNf3Wy9vMDLsClsO8UVaiJf1ffanz6WSq3zq1Y25Xx1FWWZpgOKjkeMBQz3tLplgpoGm/JNI+he2N9x++VejBB4R5SiUGA/KQIQDJwvwCYrwZ+j3L3HJpqXAmAduGEqkHPDJE4M/3n3FLZblxwlpoNcejmmJGKX0ldkPzBJckck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727348169; c=relaxed/simple;
	bh=qTRkRemlYBcgSh0/Nkoi3/uReReE34+1ByAPeKgnblY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BO9VRBK1uHxH9iXr18peaGzBvyvFQEgNJ1+s2LRBHkSqyU4vq8sZ89bEtyP+otbGWhENpcivKURbWq76qDR2RKXShiLfluiqCibCpx96F3fUbUwm0HAwB2ptAO+xMkBv1NpYbslz9HbkdNqV2NzjpsAl4wU/8t0wEURg9ObmTTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oeKB6cYQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48Q7bPK6003273;
	Thu, 26 Sep 2024 10:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IBwVa7e4K9hvRIbnvmlG+l1h8zml2X9ZLRbV1k7628Y=; b=oeKB6cYQlkQZznZI
	y/y1fnlTGyP28EYo3yFcYxaQU28+Fa1m9TjQAPhVyzBgjTREouTTrxGu//R1ozjG
	d436Yof0LU0riKd2C5eN7WUSnt1yDx44MUYTri9Z50HuG0TXtM+ieHeGcxxiEv+C
	5l5s2C9V7xTGKF5nG279+/HtpZoRr0b2nMlwofiC5zd436DRnEQ5GYFs+FkWOfOv
	GdygBMuRjHNpWaIFb7b9+5DDhhbwH9ZXkKRGNIJLaQUDANR/+LrrWN9MHq0nywQx
	Td/qVkKBWlTLaNjp2QqunXbxjgssVyfJFLXei5Ed44oGnAYGLOTLF/SKnJ+tlyh/
	wZKXOg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sn5byb9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 10:56:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48QAu0U3014930
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 10:56:00 GMT
Received: from [10.216.19.58] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 26 Sep
 2024 03:55:55 -0700
Message-ID: <ca3cd653-9ab1-93e6-7862-bca8a45e34d0@quicinc.com>
Date: Thu, 26 Sep 2024 16:25:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 20/29] media: iris: subscribe parameters and properties
 to firmware for hfi_gen2
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vedang Nagar
	<quic_vnagar@quicinc.com>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-20-c5fdbbe65e70@quicinc.com>
 <b259f304-77a2-4b0e-a8b3-c8d0fb8f9750@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <b259f304-77a2-4b0e-a8b3-c8d0fb8f9750@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TSfwPIFQgIhyv5XemYiS3fU5Rd7-0Rjd
X-Proofpoint-GUID: TSfwPIFQgIhyv5XemYiS3fU5Rd7-0Rjd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260073



On 9/24/2024 8:46 PM, Bryan O'Donoghue wrote:
> On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
>> From: Vedang Nagar <quic_vnagar@quicinc.com>
>>
>> For hfi_gen2, subscribe for different bitstream parameters to
>> firmware to get notified for change in any of the subscribed
>> parameters.
>>
>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   6 +
>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 179
>> +++++++++++++++++++++
>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   9 ++
>>   .../platform/qcom/iris/iris_platform_common.h      |   4 +
>>   .../platform/qcom/iris/iris_platform_sm8550.c      |  13 ++
>>   5 files changed, 211 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
>> index 8170c1fef569..5fbbab844025 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.h
>> @@ -18,12 +18,18 @@ struct iris_core;
>>    *
>>    * @inst: pointer to iris_instance structure
>>    * @packet: HFI packet
>> + * @ipsc_properties_set: boolean to set ipsc properties to fw
>> + * @opsc_properties_set: boolean to set opsc properties to fw
>>    * @src_subcr_params: subscription params to fw on input port
>> + * @dst_subcr_params: subscription params to fw on output port
>>    */
>>   struct iris_inst_hfi_gen2 {
>>       struct iris_inst        inst;
>>       struct iris_hfi_header        *packet;
>> +    bool                ipsc_properties_set;
>> +    bool                opsc_properties_set;
>>       struct hfi_subscription_params    src_subcr_params;
>> +    struct hfi_subscription_params    dst_subcr_params;
>>   };
>>     void iris_hfi_gen2_command_ops_init(struct iris_core *core);
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> index e50f00021f6d..791b535a3584 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> @@ -472,6 +472,9 @@ static int iris_hfi_gen2_session_open(struct
>> iris_inst *inst)
>>       if (inst->state != IRIS_INST_DEINIT)
>>           return -EALREADY;
>>   +    inst_hfi_gen2->ipsc_properties_set = false;
>> +    inst_hfi_gen2->opsc_properties_set = false;
>> +
>>       inst_hfi_gen2->packet = kzalloc(4096, GFP_KERNEL);
>>       if (!inst_hfi_gen2->packet)
>>           return -ENOMEM;
>> @@ -536,9 +539,185 @@ static int iris_hfi_gen2_session_close(struct
>> iris_inst *inst)
>>       return ret;
>>   }
>>   +static int iris_hfi_gen2_session_subscribe_mode(struct iris_inst *inst,
>> +                        u32 cmd, u32 plane, u32 payload_type,
>> +                        void *payload, u32 payload_size)
>> +{
>> +    struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>> +
>> +    iris_hfi_gen2_packet_session_command(inst,
>> +                         cmd,
>> +                         (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
>> +                         HFI_HOST_FLAGS_INTR_REQUIRED),
>> +                         iris_hfi_gen2_get_port(plane),
>> +                         inst->session_id,
>> +                         payload_type,
>> +                         payload,
>> +                         payload_size);
>> +
>> +    return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
>> +                    inst_hfi_gen2->packet->size);
>> +}
>> +
>> +static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst,
>> u32 plane)
>> +{
>> +    struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>> +    struct hfi_subscription_params subsc_params;
>> +    u32 prop_type, payload_size, payload_type;
>> +    struct iris_core *core = inst->core;
>> +    const u32 *change_param = NULL;
>> +    u32 change_param_size = 0;
>> +    u32 payload[32] = {0};
>> +    u32 hfi_port = 0;
>> +    int ret;
>> +    u32 i;
>> +
>> +    if ((V4L2_TYPE_IS_OUTPUT(plane) &&
>> inst_hfi_gen2->ipsc_properties_set) ||
>> +        (V4L2_TYPE_IS_CAPTURE(plane) &&
>> inst_hfi_gen2->opsc_properties_set)) {
>> +        dev_err(core->dev, "invalid plane\n");
>> +        return 0;
>> +    }
>> +
>> +    change_param = core->iris_platform_data->input_config_params;
>> +    change_param_size = core->iris_platform_data->input_config_params_size;
>> +
>> +    if (!change_param || !change_param_size)
>> +        return -EINVAL;
> 
> That's an odd one, checking for zero but _not_ bounds checking
> chanage_param_size < (sizeof(payload)/sizeof(u32)) - 1
> 
> I'm not sure where inpug_config_param_size gets populated but I'd rather
> check that type of parameter - for exactly that reason - than the defensive
> coding done on your inputs elsewhere.
> 
> TL;DR why do you trust change_param_size < your array size but not
> change_param_size >= 1 ?
> 
These NULL checks here are actually not needed as we will make sure this is
filled in platform data. Will remove these checks in next version and will
see if bound check is required.
> ---
> bod

