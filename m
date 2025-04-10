Return-Path: <linux-media+bounces-29875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CECA83B0E
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 09:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35ADC4A2B47
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 07:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A758620E00C;
	Thu, 10 Apr 2025 07:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aTe27cm5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E50F20ADF9;
	Thu, 10 Apr 2025 07:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269854; cv=none; b=de3i+05A78LmDoYfWo0DtQDbvs8m3pIxOo2kiqxEfvieshvEuy3liRKD23/IRGeKck/lMfSxrEN8nyksEstOMVfxXEP7IPLG2L50pCtw7TW35B9FhGlcpWCPJF816BsgH6x724iSk57Hl+9e1GkSADV0YyrvO9VqtBFAszhoKiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269854; c=relaxed/simple;
	bh=+wJGrK6NXdSk81uWZS20SyBE9yN56hTNRcUj/7WArkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Mb/lEx9EkwWbEOpWCU1Br3JwmUhM/Op1jaAlrj3+A3PG3kng5eqxryihSySp09NFzqmKV8w64GfU1TI/wiWM7/3VzYlC/OCEDwaLfC+BmczghO+kibX044hnOtJbWv/fppXlqA0b1V8Ba0YeoWioBUTcIJssej1eit+mtljcObk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aTe27cm5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75dc0000661;
	Thu, 10 Apr 2025 07:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDfq3qDRcS+Eo9w8R8o23lc6Bwi0JEgHsmKUT1oZAFI=; b=aTe27cm5n6Od1hly
	59X/Rwv9t402uY60UUhJ1iVtA0+r46975VcjiWaaxPDMPyrpwtSgc5/cRT7xlfS0
	gyu//mMNdUR3pW3jkZ5JdeCKAvBiyRXeECqIHB+X1zh8xk/TpBqJ8u+laonD5Ic6
	ban1tIY57whg7YMzfEYwzyNFd4uUt4YHxoyxkbVpnYcXLtv1horL/8Qcx8aelpmd
	L5464HkvI4yQdYJO8GUlMJFPLPt2lTKNLd3GHCAZdw3NbYyVLbGuuT3q46yA/+9v
	5zXw1dbcRrQIT53UWmZi0fRjDWZKhj+MI8MMU3vibyFKYTRAh579igMhnpk1q8l6
	zEd2mg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2wy04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 07:24:06 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53A7O5P5023823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 07:24:05 GMT
Received: from [10.204.100.69] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Apr
 2025 00:24:00 -0700
Message-ID: <144f5707-9b17-9a62-3ede-9c79f9625a08@quicinc.com>
Date: Thu, 10 Apr 2025 12:53:57 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 00/20] Add support for HEVC and VP9 codecs in decoder
Content-Language: en-US
To: <neil.armstrong@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Hans
 Verkuil" <hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <stable@vger.kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <801511ac-78db-476b-8f1d-a478b0b64bcb@linaro.org>
 <72a5b302-5c99-4457-86c8-5fa994c93c4a@linaro.org>
 <054c3ee4-78d3-68b2-0dca-8fc339cbea80@quicinc.com>
 <d43d0b56-83e0-4567-a99a-6611a146954e@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <d43d0b56-83e0-4567-a99a-6611a146954e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BDDpdu7oqvvSBUQBZ91BFPl5xbGI0UeZ
X-Proofpoint-GUID: BDDpdu7oqvvSBUQBZ91BFPl5xbGI0UeZ
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f77216 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=qC_FGOx9AAAA:8
 a=KKAkSRfTAAAA:8 a=EGgesTezXlpRaHjclHMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=fsdK_YakeE02zTmptMdW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100053


On 4/10/2025 12:50 PM, neil.armstrong@linaro.org wrote:
> On 09/04/2025 19:59, Vikash Garodia wrote:
>>
>>
>> On 4/9/2025 9:56 PM, Neil Armstrong wrote:
>>> On 09/04/2025 16:29, Bryan O'Donoghue wrote:
>>>> On 08/04/2025 16:54, Dikshita Agarwal wrote:
>>>>> Hi All,
>>>>>
>>>>> This patch series adds initial support for the HEVC(H.265) and VP9
>>>>> codecs in iris decoder. The objective of this work is to extend the
>>>>> decoder's capabilities to handle HEVC and VP9 codec streams,
>>>>> including necessary format handling and buffer management.
>>>>> In addition, the series also includes a set of fixes to address issues
>>>>> identified during testing of these additional codecs.
>>>>>
>>>>> These patches also address the comments and feedback received from the
>>>>> RFC patches previously sent. I have made the necessary improvements
>>>>> based on the community's suggestions.
>>>>>
>>>>> Changes sinces RFC:
>>>>> - Added additional fixes to address issues identified during further
>>>>> testing.
>>>>> - Moved typo fix to a seperate patch [Neil]
>>>>> - Reordered the patches for better logical flow and clarity [Neil,
>>>>> Dmitry]
>>>>> - Added fixes tag wherever applicable [Neil, Dmitry]
>>>>> - Removed the default case in the switch statement for codecs [Bryan]
>>>>> - Replaced if-else statements with switch-case [Bryan]
>>>>> - Added comments for mbpf [Bryan]
>>>>> - RFC:
>>>>> https://lore.kernel.org/linux-media/20250305104335.3629945-1-quic_dikshita@quicinc.com/
>>>>>
>>>>> These patches are tested on SM8250 and SM8550 with v4l2-ctl and
>>>>> Gstreamer for HEVC and VP9 decoders, at the same time ensured that
>>>>> the existing H264 decoder functionality remains uneffected.
>>>>>
>>>>> Note: 1 of the fluster compliance test is fixed with firmware [1]
>>>>> [1]:
>>>>> https://lore.kernel.org/linux-firmware/1a511921-446d-cdc4-0203-084c88a5dc1e@quicinc.com/T/#u
>>>>>
>>>
>>> <snip>
>>>
>>>>> ---
>>>>> Dikshita Agarwal (20):
>>>>>         media: iris: Skip destroying internal buffer if not dequeued
>>>>>         media: iris: Update CAPTURE format info based on OUTPUT format
>>>>>         media: iris: Add handling for corrupt and drop frames
>>>>>         media: iris: Avoid updating frame size to firmware during reconfig
>>>>>         media: iris: Send V4L2_BUF_FLAG_ERROR for buffers with 0 filled length
>>>>>         media: iris: Add handling for no show frames
>>>>>         media: iris: Improve last flag handling
>>>>>         media: iris: Skip flush on first sequence change
>>>>>         media: iris: Prevent HFI queue writes when core is in deinit state
>>>>>         media: iris: Remove redundant buffer count check in stream off
>>>>>         media: iris: Remove deprecated property setting to firmware
>>>>>         media: iris: Fix missing function pointer initialization
>>>>>         media: iris: Fix NULL pointer dereference
>>>>>         media: iris: Fix typo in depth variable
>>>>>         media: iris: Add a comment to explain usage of MBPS
>>>>>         media: iris: Add HEVC and VP9 formats for decoder
>>>>>         media: iris: Add platform capabilities for HEVC and VP9 decoders
>>>>>         media: iris: Set mandatory properties for HEVC and VP9 decoders.
>>>>>         media: iris: Add internal buffer calculation for HEVC and VP9 decoders
>>>>>         media: iris: Add codec specific check for VP9 decoder drain handling
>>>>>
>>>>>    drivers/media/platform/qcom/iris/iris_buffer.c     |  22 +-
>>>>>    drivers/media/platform/qcom/iris/iris_ctrls.c      |  35 +-
>>>>>    drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
>>>>>    .../platform/qcom/iris/iris_hfi_gen1_command.c     |  44 ++-
>>>>>    .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   5 +-
>>>>>    .../platform/qcom/iris/iris_hfi_gen1_response.c    |  22 +-
>>>>>    .../platform/qcom/iris/iris_hfi_gen2_command.c     | 143 +++++++-
>>>>>    .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   5 +
>>>>>    .../platform/qcom/iris/iris_hfi_gen2_response.c    |  57 ++-
>>>>>    drivers/media/platform/qcom/iris/iris_hfi_queue.c  |   2 +-
>>>>>    drivers/media/platform/qcom/iris/iris_instance.h   |   6 +
>>>>>    .../platform/qcom/iris/iris_platform_common.h      |  28 +-
>>>>>    .../platform/qcom/iris/iris_platform_sm8250.c      |  15 +-
>>>>>    .../platform/qcom/iris/iris_platform_sm8550.c      | 143 +++++++-
>>>>>    drivers/media/platform/qcom/iris/iris_vb2.c        |   3 +-
>>>>>    drivers/media/platform/qcom/iris/iris_vdec.c       | 113 +++---
>>>>>    drivers/media/platform/qcom/iris/iris_vdec.h       |  11 +
>>>>>    drivers/media/platform/qcom/iris/iris_vidc.c       |   3 -
>>>>>    drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 397
>>>>> ++++++++++++++++++++-
>>>>>    drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  46 ++-
>>>>>    20 files changed, 948 insertions(+), 153 deletions(-)
>>>>> ---
>>>>> base-commit: 7824b91d23e9f255f0e9d2acaa74265c9cac2e9c
>>>>> change-id: 20250402-iris-dec-hevc-vp9-2654a1fc4d0d
>>>>>
>>>>> Best regards,
>>>>
>>>> Assuming we merge Neils sm8650 stuff first, which I think we should merge
>>>> first, you'll have a subsequent build error to fix [1]
>>>
>>> I agree, it would be simpler, I prepared a fix to apply on top of this patchset.
>> Lets sort out the platform data handling. More so, when i see that the patch you
>> are adding more of 8650 specific data into 8550 file.
> 
> Not really, I only add iris_set_sm8650_preset_registers()
You might have added iris_set_sm8650_preset_registers in this patch, but the
list have already grown enough which demand for separate SOC specific platform
data file. Better done now than keeping it for later.

Thanks,
Vikash
> 
>>>
>>>>
>>>> https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linaro/arm-laptop/wip/x1e80100-6.15-rc1-dell-inspiron14-camss-ov02c10-ov02e10-audio-iris?ref_type=heads
>>>>
>>>> Testing your series in isolation. I can confirm vp9 decodes also getting some
>>>> strange prinouts which we need to follow up to see if they exist with the
>>>> baseline driver [2].
>>>>
>>>> https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linaro/arm-laptop/wip/x1e80100-6.15-rc1-dell-inspiron14-camss-ov02c10-ov02e10-audio-iris-20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com?ref_type=heads
>>>>
>>>
>>> <snip>
>>>
>>>> [  126.582170] qcom-iris aa00000.video-codec: session error received
>>>> 0x1000006: unknown
>>>> [  126.582177] qcom-iris aa00000.video-codec: session error received
>>>> 0x4000004: invalid operation for current state
>>>
>>> With the following on top of the last SM8650 patchet + this patchset, I have the
>>> same HEVC errors on SM8650, but VP9 works fine:
>>> [  115.185745] qcom-iris aa00000.video-codec: session error received 0x4000004:
>>> invalid operation for current state
>>> [  115.221058] qcom-iris aa00000.video-codec: session error received 0x1000006:
>>> unknown
>>>
>>> ==========================================><==============================================
>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>>> b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>>> index 65f3accc2fb2..7d5116528fca 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>>> @@ -213,6 +213,22 @@ static void iris_set_sm8550_preset_registers(struct
>>> iris_core *core)
>>>       writel(0x0, core->reg_base + 0xB0088);
>>>   }
>>>
>>> +static void iris_set_sm8650_preset_registers(struct iris_core *core)
>>> +{
>>> +    writel(0x0, core->reg_base + 0xB0088);
>>> +    writel(0x33332222, core->reg_base + 0x13030);
>>> +    writel(0x44444444, core->reg_base + 0x13034);
>>> +    writel(0x1022, core->reg_base + 0x13038);
>>> +    writel(0x0, core->reg_base + 0x13040);
>>> +    writel(0xFFFF, core->reg_base + 0x13048);
>>> +    writel(0x33332222, core->reg_base + 0x13430);
>>> +    writel(0x44444444, core->reg_base + 0x13434);
>>> +    writel(0x1022, core->reg_base + 0x13438);
>>> +    writel(0x0, core->reg_base + 0x13440);
>>> +    writel(0xFFFF, core->reg_base + 0x13448);
>>> +    writel(0x99, core->reg_base + 0xA013C);
>>> +}
>> This is strange, h264 decoder does not need any of those while VP9 needed it to
>> work. I could see the same set of registers in downstream code, but cannot
>> recollect now on the need to add those.
> 
> Yes this is why I added it only to enable support for HEVC and VP9, before we were
> using the iris_set_sm8550_preset_registers().
> 
>>
>> Regards,
>> Vikash
>>> +
>>>   static const struct icc_info sm8550_icc_table[] = {
>>>       { "cpu-cfg",    1000, 1000     },
>>>       { "video-mem",  1000, 15000000 },
>>> @@ -390,6 +406,7 @@ struct iris_platform_data sm8550_data = {
>>>
>>>   /*
>>>    * Shares most of SM8550 data except:
>>> + * - set_preset_registers to iris_set_sm8650_preset_registers
>>>    * - vpu_ops to iris_vpu33_ops
>>>    * - clk_rst_tbl to sm8650_clk_reset_table
>>>    * - controller_rst_tbl to sm8650_controller_reset_table
>>> @@ -400,7 +417,7 @@ struct iris_platform_data sm8650_data = {
>>>       .init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>>>       .init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>>>       .vpu_ops = &iris_vpu33_ops,
>>> -    .set_preset_registers = iris_set_sm8550_preset_registers,
>>> +    .set_preset_registers = iris_set_sm8650_preset_registers,
>>>       .icc_tbl = sm8550_icc_table,
>>>       .icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>>>       .clk_rst_tbl = sm8650_clk_reset_table,
>>> @@ -428,20 +445,34 @@ struct iris_platform_data sm8650_data = {
>>>       .ubwc_config = &ubwc_config_sm8550,
>>>       .num_vpp_pipe = 4,
>>>       .max_session_count = 16,
>>> -    .max_core_mbpf = ((8192 * 4352) / 256) * 2,
>>> -    .input_config_params =
>>> -        sm8550_vdec_input_config_params,
>>> -    .input_config_params_size =
>>> -        ARRAY_SIZE(sm8550_vdec_input_config_params),
>>> +    .max_core_mbpf = NUM_MBS_8K * 2,
>>> +    .input_config_params_default =
>>> +        sm8550_vdec_input_config_params_default,
>>> +    .input_config_params_default_size =
>>> +        ARRAY_SIZE(sm8550_vdec_input_config_params_default),
>>> +    .input_config_params_hevc =
>>> +        sm8550_vdec_input_config_param_hevc,
>>> +    .input_config_params_hevc_size =
>>> +        ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
>>> +    .input_config_params_vp9 =
>>> +        sm8550_vdec_input_config_param_vp9,
>>> +    .input_config_params_vp9_size =
>>> +        ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
>>>       .output_config_params =
>>>           sm8550_vdec_output_config_params,
>>>       .output_config_params_size =
>>>           ARRAY_SIZE(sm8550_vdec_output_config_params),
>>>       .dec_input_prop = sm8550_vdec_subscribe_input_properties,
>>>       .dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
>>> -    .dec_output_prop = sm8550_vdec_subscribe_output_properties,
>>> -    .dec_output_prop_size =
>>> ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
>>> -
>>> +    .dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
>>> +    .dec_output_prop_avc_size =
>>> +        ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
>>> +    .dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
>>> +    .dec_output_prop_hevc_size =
>>> +        ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
>>> +    .dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
>>> +    .dec_output_prop_vp9_size =
>>> +        ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
>>>       .dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>>>       .dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>>>       .dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>>> ==========================================><==============================================
>>>
>>> Thanks,
>>> Neil
> 

