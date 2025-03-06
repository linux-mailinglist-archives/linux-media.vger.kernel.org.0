Return-Path: <linux-media+bounces-27700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D23A54A4F
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 13:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 090E316A500
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 12:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A49320B1E6;
	Thu,  6 Mar 2025 12:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pdnC2gUY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB181201022;
	Thu,  6 Mar 2025 12:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741262871; cv=none; b=OygKY6mGti9PVIhzLk7pI1WJGYgjxgUCDSuN1LwQDYP4/YBVY8lIkJLLqtGIaHbx9WlbQogsfZoR8Bvx23W8hxsyHKe+H0tC7ZI1KqwwwvvptkrQ6td/OlICj3uT+2zYp+rhoemQ9gCb8pbVafXYWF+TYStOi+OreyA9msEh3lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741262871; c=relaxed/simple;
	bh=YbLkp92jfWOa6iKpgDCg5V/zlLT8jOLvtH72uk3o9Jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ObA0j6vaQDTgVUnho3ahCEKgMTx9yQlTvPAxJEf0sNCz+SqVN5Aba8QpLRpESZwRt5h2rtVXp2311ygiqkWAJcwngcizvK5RNTuFirLi7/Q2Mm8ifkt2ZLSTcQiBsb2R6AL+qE9B2+So4m2hMH7a1Di+i2CevHZb7cvc7uL3Yy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pdnC2gUY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5268ii3k003607;
	Thu, 6 Mar 2025 12:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nLMPn6sgOpPr//s1n8yFiplRaVRg1E6ACcvY8+uEKqI=; b=pdnC2gUYXOIBhmxC
	TWDVEXt7VQOXO1Uq+SxIOTLc0CxBE17s3taaeCtJoPkpavRhwQb9CsE4Smmoowdv
	12DIiF2ODh2dYhkae4SlXp+rPvEGehwIFyy5paS6xM7jvo04svp5jwPFNQP7pnY9
	cmlWQXjBAvv2VIpbmAwmIxrXLXg+flVjwthF3D+jfvx0Ee0C3GmISxmDnmy6sqAS
	7A3TDKLarLvP7+uwMaECX0CnEeGKzhZXVetyYBqu7wzDWc0dMXDN3tqvkcm7iAix
	p63yvTMQv73t0YDLu+BF83quCQdDliru/eC10hsyaG6jHKM4yDPl49Miqhe5rg1u
	10pmHw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 456wrja7n0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 12:07:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526C7igQ032231
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 12:07:44 GMT
Received: from [10.50.63.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 04:07:41 -0800
Message-ID: <892eb8ef-d954-aab5-5755-c33e804efad0@quicinc.com>
Date: Thu, 6 Mar 2025 17:37:38 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 02/12] media: iris: Add platform capabilities for HEVC
 and VP9 decoders
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, <quic_vgarodia@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <mchehab@kernel.org>
CC: <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
 <20250305104335.3629945-3-quic_dikshita@quicinc.com>
 <f4354a08-46e2-4bf5-9395-f9b861a9d7c8@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <f4354a08-46e2-4bf5-9395-f9b861a9d7c8@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: R7F4B-payTECp-hv5loAiMJ2twv0WLpz
X-Authority-Analysis: v=2.4 cv=FYDNxI+6 c=1 sm=1 tr=0 ts=67c99010 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=IGXroYBQe6CBykfo8BwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: R7F4B-payTECp-hv5loAiMJ2twv0WLpz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060092



On 3/6/2025 5:58 AM, Bryan O'Donoghue wrote:
> On 05/03/2025 10:43, Dikshita Agarwal wrote:
>> Add platform capabilities for HEVC and VP9 codecs in decoder driver
>> with related hooks.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_ctrls.c | 28 ++++++-
>>   .../qcom/iris/iris_hfi_gen2_command.c         | 30 ++++++-
>>   .../qcom/iris/iris_hfi_gen2_defines.h         |  1 +
>>   .../qcom/iris/iris_hfi_gen2_response.c        | 36 ++++++++-
>>   .../platform/qcom/iris/iris_platform_common.h |  9 ++-
>>   .../platform/qcom/iris/iris_platform_sm8550.c | 80 ++++++++++++++++++-
>>   6 files changed, 170 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c
>> b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> index b690578256d5..fb2b818c7c5c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
>> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> @@ -20,9 +20,19 @@ static enum platform_inst_fw_cap_type
>> iris_get_cap_id(u32 id)
>>       case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
>>           return DEBLOCK;
>>       case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
>> -        return PROFILE;
>> +        return PROFILE_H264;
>> +    case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
>> +        return PROFILE_HEVC;
>> +    case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
>> +        return PROFILE_VP9;
>>       case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
>> -        return LEVEL;
>> +        return LEVEL_H264;
>> +    case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
>> +        return LEVEL_HEVC;
>> +    case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
>> +        return LEVEL_VP9;
>> +    case V4L2_CID_MPEG_VIDEO_HEVC_TIER:
>> +        return TIER;
>>       default:
>>           return INST_FW_CAP_MAX;
>>       }
>> @@ -36,10 +46,20 @@ static u32 iris_get_v4l2_id(enum
>> platform_inst_fw_cap_type cap_id)
>>       switch (cap_id) {
>>       case DEBLOCK:
>>           return V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER;
>> -    case PROFILE:
>> +    case PROFILE_H264:
>>           return V4L2_CID_MPEG_VIDEO_H264_PROFILE;
>> -    case LEVEL:
>> +    case PROFILE_HEVC:
>> +        return V4L2_CID_MPEG_VIDEO_HEVC_PROFILE;
>> +    case PROFILE_VP9:
>> +        return V4L2_CID_MPEG_VIDEO_VP9_PROFILE;
>> +    case LEVEL_H264:
>>           return V4L2_CID_MPEG_VIDEO_H264_LEVEL;
>> +    case LEVEL_HEVC:
>> +        return V4L2_CID_MPEG_VIDEO_HEVC_LEVEL;
>> +    case LEVEL_VP9:
>> +        return V4L2_CID_MPEG_VIDEO_VP9_LEVEL;
>> +    case TIER:
>> +        return V4L2_CID_MPEG_VIDEO_HEVC_TIER;
>>       default:
>>           return 0;
>>       }
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> index beaf3a051d7c..a3ebcda9a2ba 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> @@ -309,7 +309,20 @@ static int iris_hfi_gen2_set_profile(struct
>> iris_inst *inst)
>>   {
>>       struct iris_inst_hfi_gen2 *inst_hfi_gen2 =
>> to_iris_inst_hfi_gen2(inst);
>>       u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> -    u32 profile = inst->fw_caps[PROFILE].value;
>> +    u32 profile;
>> +
>> +    switch (inst->codec) {
>> +    case V4L2_PIX_FMT_HEVC:
>> +        profile = inst->fw_caps[PROFILE_HEVC].value;
>> +        break;
>> +    case V4L2_PIX_FMT_VP9:
>> +        profile = inst->fw_caps[PROFILE_VP9].value;
>> +        break;
>> +    case V4L2_PIX_FMT_H264:
>> +    default:
>> +        profile = inst->fw_caps[PROFILE_H264].value;
>> +        break;
> 
> Following up on my previous comment about returning a 0 default and running
> with it instead of erroring it - you then treat default == 0 @ inst->codec
> assigned in iris_hfi_gen[1|2]_sys_init as H264.
> 
> In fact why have a default by the time you get this this point in the code
> anyway ?
> 
> Just chuck out parameters which aren't expected as errors and then don't
> bother with these defaults.
> 
Ack, as mentioned in previous comment, will remove the default case.
>> +    }
>>         inst_hfi_gen2->src_subcr_params.profile = profile;
>>   @@ -326,7 +339,20 @@ static int iris_hfi_gen2_set_level(struct
>> iris_inst *inst)
>>   {
>>       struct iris_inst_hfi_gen2 *inst_hfi_gen2 =
>> to_iris_inst_hfi_gen2(inst);
>>       u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> -    u32 level = inst->fw_caps[LEVEL].value;
>> +    u32 level;
>> +
>> +    switch (inst->codec) {
>> +    case V4L2_PIX_FMT_HEVC:
>> +        level = inst->fw_caps[LEVEL_HEVC].value;
>> +        break;
>> +    case V4L2_PIX_FMT_VP9:
>> +        level = inst->fw_caps[LEVEL_VP9].value;
>> +        break;
>> +    case V4L2_PIX_FMT_H264:
>> +    default:
>> +        level = inst->fw_caps[LEVEL_H264].value;
>> +        break;
>> +    }
>>         inst_hfi_gen2->src_subcr_params.level = level;
>>   diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> index 2fcf7914b70f..48c507a1ec27 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> @@ -46,6 +46,7 @@
>>   #define HFI_PROP_CROP_OFFSETS            0x03000105
>>   #define HFI_PROP_PROFILE            0x03000107
>>   #define HFI_PROP_LEVEL                0x03000108
>> +#define HFI_PROP_TIER                0x03000109
>>   #define HFI_PROP_STAGE                0x0300010a
>>   #define HFI_PROP_PIPE                0x0300010b
>>   #define HFI_PROP_LUMA_CHROMA_BIT_DEPTH        0x0300010f
> 
> These seem like - probably bitfields ?
> 
> Could we get the bits in a follow on patch/series ?
> 
I didn't understand this comment.
These are not bit fields, but HFI macros, which we use to communicate with
firmware.
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> index b75a01641d5d..809bf0f238bd 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> @@ -563,8 +563,22 @@ static void
>> iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>>       inst->crop.width = pixmp_ip->width -
>>           ((subsc_params.crop_offsets[1] >> 16) & 0xFFFF) - inst->crop.left;
>>   -    inst->fw_caps[PROFILE].value = subsc_params.profile;
>> -    inst->fw_caps[LEVEL].value = subsc_params.level;
>> +    switch (inst->codec) {
>> +    case V4L2_PIX_FMT_HEVC:
>> +        inst->fw_caps[PROFILE_HEVC].value = subsc_params.profile;
>> +        inst->fw_caps[LEVEL_HEVC].value = subsc_params.level;
>> +        break;
>> +    case V4L2_PIX_FMT_VP9:
>> +        inst->fw_caps[PROFILE_VP9].value = subsc_params.profile;
>> +        inst->fw_caps[LEVEL_VP9].value = subsc_params.level;
>> +        break;
>> +    case V4L2_PIX_FMT_H264:
>> +    default:
>> +        inst->fw_caps[PROFILE_H264].value = subsc_params.profile;
>> +        inst->fw_caps[LEVEL_H264].value = subsc_params.level;
>> +        break;
>> +    }
>> +
>>       inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
>>         if (subsc_params.bit_depth != BIT_DEPTH_8 ||
>> @@ -791,8 +805,22 @@ static void
>> iris_hfi_gen2_init_src_change_param(struct iris_inst *inst)
>>                            full_range, video_format,
>>                            video_signal_type_present_flag);
>>   -    subsc_params->profile = inst->fw_caps[PROFILE].value;
>> -    subsc_params->level = inst->fw_caps[LEVEL].value;
>> +    switch (inst->codec) {
>> +    case V4L2_PIX_FMT_HEVC:
>> +        subsc_params->profile = inst->fw_caps[PROFILE_HEVC].value;
>> +        subsc_params->level = inst->fw_caps[LEVEL_HEVC].value;
>> +        break;
>> +    case V4L2_PIX_FMT_VP9:
>> +        subsc_params->profile = inst->fw_caps[PROFILE_VP9].value;
>> +        subsc_params->level = inst->fw_caps[LEVEL_VP9].value;
>> +        break;
>> +    case V4L2_PIX_FMT_H264:
>> +    default:
>> +        subsc_params->profile = inst->fw_caps[PROFILE_H264].value;
>> +        subsc_params->level = inst->fw_caps[LEVEL_H264].value;
>> +        break;
>> +    }
>> +
>>       subsc_params->pic_order_cnt = inst->fw_caps[POC].value;
>>       subsc_params->bit_depth = inst->fw_caps[BIT_DEPTH].value;
>>       if (inst->fw_caps[CODED_FRAMES].value ==
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index f6b15d2805fb..67204cddd44a 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -78,8 +78,12 @@ struct platform_inst_caps {
>>   };
>>     enum platform_inst_fw_cap_type {
>> -    PROFILE = 1,
>> -    LEVEL,
>> +    PROFILE_H264 = 1,
>> +    PROFILE_HEVC,
>> +    PROFILE_VP9,
>> +    LEVEL_H264,
>> +    LEVEL_HEVC,
>> +    LEVEL_VP9,
>>       INPUT_BUF_HOST_MAX_COUNT,
>>       STAGE,
>>       PIPE,
>> @@ -88,6 +92,7 @@ enum platform_inst_fw_cap_type {
>>       BIT_DEPTH,
>>       RAP_FRAME,
>>       DEBLOCK,
>> +    TIER,
>>       INST_FW_CAP_MAX,
>>   };
>>   diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> index 35d278996c43..29bc50785da5 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> @@ -14,7 +14,7 @@
>>     static struct platform_inst_fw_cap inst_fw_cap_sm8550[] = {
>>       {
>> -        .cap_id = PROFILE,
>> +        .cap_id = PROFILE_H264,
>>           .min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
>>           .max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
>>           .step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
>> @@ -28,7 +28,29 @@ static struct platform_inst_fw_cap
>> inst_fw_cap_sm8550[] = {
>>           .set = iris_set_u32_enum,
>>       },
>>       {
>> -        .cap_id = LEVEL,
>> +        .cap_id = PROFILE_HEVC,
>> +        .min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>> +        .max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>> +        .step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
>> +                BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
>> +        .value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>> +        .hfi_id = HFI_PROP_PROFILE,
>> +        .flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>> +        .set = iris_set_u32_enum,
>> +    },
>> +    {
>> +        .cap_id = PROFILE_VP9,
>> +        .min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
>> +        .max = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
>> +        .step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_0) |
>> +                BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_2),
>> +        .value = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
>> +        .hfi_id = HFI_PROP_PROFILE,
>> +        .flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>> +        .set = iris_set_u32_enum,
>> +    },
>> +    {
>> +        .cap_id = LEVEL_H264,
>>           .min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
>>           .max = V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
>>           .step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
>> @@ -56,6 +78,60 @@ static struct platform_inst_fw_cap
>> inst_fw_cap_sm8550[] = {
>>           .flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>           .set = iris_set_u32_enum,
>>       },
>> +    {
>> +        .cap_id = LEVEL_HEVC,
>> +        .min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
>> +        .max = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
>> +        .step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
>> +                BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
>> +                BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
>> +                BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
>> +                BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
>> +                BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
>> +                BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
>> +                BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5) |
>> +                BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1) |
>> +                BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2) |
>> +                BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6) |
>> +                BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1) |
>> +                BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2),
>> +        .value = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1,
>> +        .hfi_id = HFI_PROP_LEVEL,
>> +        .flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>> +        .set = iris_set_u32_enum,
>> +    },
>> +    {
>> +        .cap_id = LEVEL_VP9,
>> +        .min = V4L2_MPEG_VIDEO_VP9_LEVEL_1_0,
>> +        .max = V4L2_MPEG_VIDEO_VP9_LEVEL_6_0,
>> +        .step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_0) |
>> +                BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_1) |
>> +                BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_0) |
>> +                BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_1) |
>> +                BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_0) |
>> +                BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_1) |
>> +                BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_0) |
>> +                BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_1) |
>> +                BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_0) |
>> +                BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_1) |
>> +                BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_2) |
>> +                BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_6_0),
>> +        .value = V4L2_MPEG_VIDEO_VP9_LEVEL_6_0,
>> +        .hfi_id = HFI_PROP_LEVEL,
>> +        .flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>> +        .set = iris_set_u32_enum,
>> +    },
>> +    {
>> +        .cap_id = TIER,
>> +        .min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
>> +        .max = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
>> +        .step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_TIER_MAIN) |
>> +                BIT(V4L2_MPEG_VIDEO_HEVC_TIER_HIGH),
>> +        .value = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
>> +        .hfi_id = HFI_PROP_TIER,
>> +        .flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>> +        .set = iris_set_u32_enum,
>> +    },
>>       {
>>           .cap_id = INPUT_BUF_HOST_MAX_COUNT,
>>           .min = DEFAULT_MAX_HOST_BUF_COUNT,
> 
> Other than those nits
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Thanks,
Dikshita

