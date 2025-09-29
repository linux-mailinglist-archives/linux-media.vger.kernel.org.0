Return-Path: <linux-media+bounces-43309-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C7BBA805C
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 07:45:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A39ED3AC95F
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 05:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8170634BA42;
	Mon, 29 Sep 2025 05:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MzY01tBk"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048421CAA7D;
	Mon, 29 Sep 2025 05:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759124728; cv=none; b=u/Ahls9xvhPWwa1PLMV+ryhYo2PrqMky/J2WvlbTyxqb281BMc54L+zmYcO+baYMoSwo2J5Dd3mD+yb/Q/vHRRLmyojWUhMF2cgTHykvcm/du2sTjYrM2H3PmuQg0C7Fxxli2p8ghOnwoT8Zdzn6BLjf203JZg+pM4Qksh0fuQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759124728; c=relaxed/simple;
	bh=X0ec6FTA5fvg5dSeNGVPM+3YedML6KZQ4OLX0jTM3kE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=IYkCWQlCniXODss/EN74WA8hzQmNGjE+P1vNsHhgeydB86uEzwxvY5PnD8nNPDRHab9SH6wp2YznoRk7Rj6eYf2yLA3sTcHFlc4Qcki0hvWM0R/C7woBndKYupDgZhz8usBBCs5dB48/PuM/IX0kDLcHH0eP2XNhtM1H8nfXr20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MzY01tBk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SMaK23012802;
	Mon, 29 Sep 2025 05:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AuvWdeoIjGYeknq1aq1lk3egaQOR7cYtEjFD1I3Mo74=; b=MzY01tBkxOF5u4j6
	KtVYSrSq5LM1xwk3SyHiGewEDCZpq/1Z+D8CTu36r0TMtMAzuEfe8OeRym4Pq5+J
	EeNYG9h+2rIfrOV45Xn8tZG4PAqXUSyR+ladadBqMiHmX87gFkMZqoLoHtfoKRGJ
	iBDMm7sRx9pRMBNWHbm0VwnXa8sG45aV4O0KbAe0BMVb7H+hiRwAiMPE04nl3Rjs
	np4lXmoNLed0Ef/8FSRb1AV+TPktugdU33Wk+/yria5sTZ3I1NzWW3XvCYdlzeDP
	bmXfKMnG5eC999DncUvTlhbIkS9BS0luznSU3pAevG6gKlhqr4Gb64to2x14h5AA
	hLJphg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tkypk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 05:45:19 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58T5jIT6004595
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 05:45:18 GMT
Received: from [10.206.105.120] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Sun, 28 Sep
 2025 22:45:13 -0700
Message-ID: <0f107e9f-e69a-64de-6770-f7078a4347cc@quicinc.com>
Date: Mon, 29 Sep 2025 11:15:09 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <quic_bvisredd@quicinc.com>
Subject: Re: [PATCH 3/8] media: iris: Add support for multiple TZ CP configs
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
 <jOycHYu8RfViyDZ9QdoBZIXrVPRt3LaNZ6_PpUCRVJuili4LnunkJDQOHNYRkyfxk-ke96ex7GDxgOlue4hPUA==@protonmail.internalid>
 <20250925-knp_video-v1-3-e323c0b3c0cd@oss.qualcomm.com>
 <e30e9106-b566-4405-aa92-fcdf6c6bcfad@kernel.org>
Content-Language: en-US
In-Reply-To: <e30e9106-b566-4405-aa92-fcdf6c6bcfad@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX0nayppew9Y5Z
 IveXwv7Teq6ezxMlyg9c8a0nnaAfOxOrSy/XPfU77l+SYMmKv5/Nar9N7u/in/fFpjNS3Z3VNci
 kJ512jwc6Cc8TH5Cq2QD0ULBnAsFUnCbeiDvVt3ZOJwqs5+pbBrOOMg1ZgrPZ/9716qeQefsVjl
 ovR9/SaLTaGKCpSlv7zGZA2fbDoc7BeKd9yJOQj98nTYY7S7+Df8Qtc15wCWXRwe/pcmnBBBpEx
 LU/hjK73fhaGP80WgdjsmHQQtcmdpWG/Vz0KVqoQLY7gIYOcN8RAcGikGsZLD+ldYQ1mm9gw7n4
 kbRGGL6LSg8aKmffpCUFzFG/kPK4UyiaUDTGurTnzcfCM8+Kal3ETxaGjrk5nmigB3I1t3m9kUX
 SLCCT69k3hgZ+lVDajHOqMGaX0KU8A==
X-Proofpoint-GUID: tY9X6temVO0JGRA7nMQe6Wyn2uJCIJW9
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68da1cef cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=rnZllD62p2m1z0w3cp0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: tY9X6temVO0JGRA7nMQe6Wyn2uJCIJW9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029



On 9/26/2025 6:00 AM, Bryan O'Donoghue wrote:
> On 25/09/2025 00:14, Vikash Garodia wrote:
>> vpu4 needs an additional configuration w.r.t CP regions. Make the CP
> 
> "with-respect-to" and please define CP once and then use the 
> abbreviation liberally.
>> configuration as array such that the multiple configuration can be
>> managed per platform.
>>
>> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_firmware.c   | 23 
>> ++++++++++++---------
>>   .../platform/qcom/iris/iris_platform_common.h      |  3 ++-
>>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 24 
>> ++++++++++++++--------
>>   .../platform/qcom/iris/iris_platform_sm8250.c      | 15 ++++++++------
>>   4 files changed, 39 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c 
>> b/drivers/media/platform/qcom/iris/iris_firmware.c
>> index 
>> 9ab499fad946446a87036720f49c9c8d311f3060..ad65c419e4416d0531d4c3deb04c22d44b29e500 100644
>> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
>> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
>> @@ -70,9 +70,9 @@ static int iris_load_fw_to_memory(struct iris_core 
>> *core, const char *fw_name)
>>
>>   int iris_fw_load(struct iris_core *core)
>>   {
>> -    struct tz_cp_config *cp_config = 
>> core->iris_platform_data->tz_cp_config_data;
>> +    const struct tz_cp_config *cp_config;
>>       const char *fwpath = NULL;
>> -    int ret;
>> +    int i, ret;
>>
>>       ret = of_property_read_string_index(core->dev->of_node, 
>> "firmware-name", 0,
>>                           &fwpath);
>> @@ -91,14 +91,17 @@ int iris_fw_load(struct iris_core *core)
>>           return ret;
>>       }
>>
>> -    ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
>> -                        cp_config->cp_size,
>> -                        cp_config->cp_nonpixel_start,
>> -                        cp_config->cp_nonpixel_size);
>> -    if (ret) {
>> -        dev_err(core->dev, "protect memory failed\n");
>> -        qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
>> -        return ret;
>> +    for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; 
>> i++) {
>> +        cp_config = &core->iris_platform_data->tz_cp_config_data[i];
>> +        ret = qcom_scm_mem_protect_video_var(cp_config->cp_start,
>> +                             cp_config->cp_size,
>> +                             cp_config->cp_nonpixel_start,
>> +                             cp_config->cp_nonpixel_size);
>> +        if (ret) {
>> +            dev_err(core->dev, "protect memory failed\n");
> 
> I think this error message could be better -> 
> "qcom_scm_mem_protect_video_var()=%d" or err string.
> 
> Its not super-important just an observation.
> 

  ACK.

>> +            qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
>> +            return ret;
>> +        }
>>       }
>>
>>       return ret;
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h 
>> b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 
>> df03de08c44839c1b6c137874eb7273c638d5f2c..ae49e95ba2252fc1442f7c81d8010dbfd86da0da 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -220,7 +220,8 @@ struct iris_platform_data {
>>       u32 inst_fw_caps_dec_size;
>>       struct platform_inst_fw_cap *inst_fw_caps_enc;
>>       u32 inst_fw_caps_enc_size;
>> -    struct tz_cp_config *tz_cp_config_data;
>> +    const struct tz_cp_config *tz_cp_config_data;
>> +    u32 tz_cp_config_data_size;
>>       u32 core_arch;
>>       u32 hw_response_timeout;
>>       struct ubwc_config_data *ubwc_config;
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c 
>> b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> index 
>> fea800811a389a58388175c733ad31c4d9c636b0..00c6b9021b98aac80612b1bb9734c8dac8146bd9 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> @@ -648,11 +648,13 @@ static struct ubwc_config_data 
>> ubwc_config_sm8550 = {
>>       .bank_spreading = 1,
>>   };
>>
>> -static struct tz_cp_config tz_cp_config_sm8550 = {
>> -    .cp_start = 0,
>> -    .cp_size = 0x25800000,
>> -    .cp_nonpixel_start = 0x01000000,
>> -    .cp_nonpixel_size = 0x24800000,
>> +static const struct tz_cp_config tz_cp_config_sm8550[] = {
>> +    {
>> +        .cp_start = 0,
>> +        .cp_size = 0x25800000,
>> +        .cp_nonpixel_start = 0x01000000,
>> +        .cp_nonpixel_size = 0x24800000,
>> +    },
>>   };
>>
>>   static const u32 sm8550_vdec_input_config_params_default[] = {
>> @@ -771,7 +773,8 @@ struct iris_platform_data sm8550_data = {
>>       .inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
>>       .inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
>>       .inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
>> -    .tz_cp_config_data = &tz_cp_config_sm8550,
>> +    .tz_cp_config_data = tz_cp_config_sm8550,
>> +    .tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
>>       .core_arch = VIDEO_ARCH_LX,
>>       .hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>>       .ubwc_config = &ubwc_config_sm8550,
>> @@ -864,7 +867,8 @@ struct iris_platform_data sm8650_data = {
>>       .inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
>>       .inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
>>       .inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
>> -    .tz_cp_config_data = &tz_cp_config_sm8550,
>> +    .tz_cp_config_data = tz_cp_config_sm8550,
>> +    .tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
>>       .core_arch = VIDEO_ARCH_LX,
>>       .hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>>       .ubwc_config = &ubwc_config_sm8550,
>> @@ -947,7 +951,8 @@ struct iris_platform_data sm8750_data = {
>>       .inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
>>       .inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
>>       .inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
>> -    .tz_cp_config_data = &tz_cp_config_sm8550,
>> +    .tz_cp_config_data = tz_cp_config_sm8550,
>> +    .tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
>>       .core_arch = VIDEO_ARCH_LX,
>>       .hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>>       .ubwc_config = &ubwc_config_sm8550,
>> @@ -1035,7 +1040,8 @@ struct iris_platform_data qcs8300_data = {
>>       .inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_qcs8300_dec),
>>       .inst_fw_caps_enc = inst_fw_cap_qcs8300_enc,
>>       .inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_qcs8300_enc),
>> -    .tz_cp_config_data = &tz_cp_config_sm8550,
>> +    .tz_cp_config_data = tz_cp_config_sm8550,
>> +    .tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
>>       .core_arch = VIDEO_ARCH_LX,
>>       .hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>>       .ubwc_config = &ubwc_config_sm8550,
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c 
>> b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> index 
>> 1b1b6aa751106ee0b0bc71bb0df2e78340190e66..8927c3ff59dab59c7d2cbcd92550f9ee3a2b5c1e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> @@ -278,11 +278,13 @@ static const char * const sm8250_opp_clk_table[] 
>> = {
>>       NULL,
>>   };
>>
>> -static struct tz_cp_config tz_cp_config_sm8250 = {
>> -    .cp_start = 0,
>> -    .cp_size = 0x25800000,
>> -    .cp_nonpixel_start = 0x01000000,
>> -    .cp_nonpixel_size = 0x24800000,
>> +static const struct tz_cp_config tz_cp_config_sm8250[] = {
>> +    {
>> +        .cp_start = 0,
>> +        .cp_size = 0x25800000,
>> +        .cp_nonpixel_start = 0x01000000,
>> +        .cp_nonpixel_size = 0x24800000,
>> +    },
>>   };
>>
>>   static const u32 sm8250_vdec_input_config_param_default[] = {
>> @@ -348,7 +350,8 @@ struct iris_platform_data sm8250_data = {
>>       .inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8250_dec),
>>       .inst_fw_caps_enc = inst_fw_cap_sm8250_enc,
>>       .inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8250_enc),
>> -    .tz_cp_config_data = &tz_cp_config_sm8250,
>> +    .tz_cp_config_data = tz_cp_config_sm8250,
>> +    .tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8250),
>>       .hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>>       .num_vpp_pipe = 4,
>>       .max_session_count = 16,
>>
>> -- 
>> 2.34.1
>>
>>
> 
> Please tidy up the commit log.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

  ACK.

  Regards,
  Vishnu Reddy

