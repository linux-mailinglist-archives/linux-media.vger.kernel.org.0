Return-Path: <linux-media+bounces-27239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C8DA49AFA
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 14:52:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 246F118985C3
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 13:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CF126D5D3;
	Fri, 28 Feb 2025 13:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ooKOCByi"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE511B960;
	Fri, 28 Feb 2025 13:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740750746; cv=none; b=garq6xxb23UC4CF4AIPMBs3dC9ghGVz3oE/4UigdSsDTdLNM/2iOd7u6M+cOFas8VEe0fJxkd0JKRrCuRT1MSCBFVvEzhHJhVaQ0sF0oDqXo/EGAj7Xn+jGVkqTZbx3KqocFy/kYnLxGAZwz1gNb5QxAzuuv+M7dTVzUAyftRNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740750746; c=relaxed/simple;
	bh=5viMviXtPKEWSwxs8q72Gi1UAcJBJpyzp3SC0shsG6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DGGxtsKyIMYrNWQfGkL3ynsA+0J8ubnJ5z0E/wgMoBBcWRwFEUG+IVLvqdBCD4DIgwiClkKRj9VSx2gkmPHVWehLfxW+p+dmvSoPnqlqGHz3/SoiRfN5bWRFd+Uiw/dotu6YAYAdGHkNNHqZpLIF9My75nUwKMv/NScEqiSix4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ooKOCByi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXGPm018756;
	Fri, 28 Feb 2025 13:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DArfpgeqgGuXx+weVogGxqLdz9xb3cqlYw0xi2dxFgQ=; b=ooKOCByi9N2XfjtR
	ht7J6CgvpaKi2zu/U5/IfIQObx5FW/oZLmmdMQrRxe964ADlaJMP85fLOnecLso/
	DaeRp9yRS4E5xJ8w5VyQ0Mc5FfaxmaHUruneRc4kzbSYZnVF3Kv19i8HbczeSF0H
	gOcq8fsWgT86I50UNCWSmHOpgewXQWQDIG1SEL1jRinKq6hgmpqBRM4ccJhFgrW8
	A17oHdquL/veGpZ62P8EW0k8d5MWjF+PZ1euwxxfpjxfm4P0vLxlZu/UQjIVeOCA
	C12BMYhq7O9cTggUhci0PQb2HTd16NKvRo0B1cFYoVPzTApPAs2k0RSR3KyXC1Uc
	esRlMw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prn9fy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 13:52:15 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51SDqECQ000314
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 13:52:14 GMT
Received: from [10.206.101.41] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Feb
 2025 05:52:10 -0800
Message-ID: <d32fdaf8-fb34-7b68-134f-30d791420f8d@quicinc.com>
Date: Fri, 28 Feb 2025 19:22:07 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/4] media: platform: qcom/iris: add sm8650 support
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
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org>
 <20250225-topic-sm8x50-iris-v10-v1-4-128ef05d9665@linaro.org>
 <10f54cb9-8939-b8ce-22c2-b633732f8879@quicinc.com>
 <40b185dc-4d89-44ba-ad58-0b89339d5d11@linaro.org>
 <c734f628-b439-45f0-d8de-931151327f10@quicinc.com>
 <5089b69f-1f56-4a57-9c9a-37fc4357611b@linaro.org>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <5089b69f-1f56-4a57-9c9a-37fc4357611b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ps-r8pnVJ-XYLwq1IGbtqa3o4xUybOFd
X-Proofpoint-GUID: ps-r8pnVJ-XYLwq1IGbtqa3o4xUybOFd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_03,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280100


On 2/28/2025 7:10 PM, neil.armstrong@linaro.org wrote:
> On 28/02/2025 14:35, Vikash Garodia wrote:
>>
>>
>> On 2/28/2025 6:05 PM, Neil Armstrong wrote:
>>> On 28/02/2025 13:15, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 2/25/2025 2:35 PM, Neil Armstrong wrote:
>>>>> Add support for the SM8650 platform by re-using the SM8550
>>>>> definitions and using the vpu33 ops.
>>>>>
>>>>> The SM8650/vpu33 requires more reset lines, but the H.284
>>>>> decoder capabilities are identical.
>>>>>
>>>> As you also noted, only delta between SM8550 and SM8650 is reset lines,
>>>> rest all configurations are same. Could you think of a better way to reuse
>>>> SM8550 platform data for SM8650.
>>>
>>> It depends on how you plan to keep compat in long term, while it's very
>>> similar for H.264 decoding, it differs for other codecs.
>>>
>>> So we would indeed have common stuff for now, but when introducing
>>> now codecs we would need separate definitions.
>> SM8550 and SM8650 have same capabilities for other video codecs as well.
> 
> Ok it's not obvious when looking at downstream, so
> I guess we can share the same platform file for both platforms ?
> or add a common code with only the iris_platform_data in each soc code ?
We can use the same sm8550_data for SM8650 as well, but how do we just override
the "different" reset configuration for SM8650 ? If you have a better way here,
you can propose, otherwise repeating the whole data does not look good at the
moment.

Regards,
Vikash
> 
> Neil
>>
>> Regards,
>> Vikash
>>>
>>> Neil
>>>
>>>>
>>>> Thanks,
>>>> Dikshita
>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> ---
>>>>>    drivers/media/platform/qcom/iris/Makefile          |   1 +
>>>>>    .../platform/qcom/iris/iris_platform_common.h      |   1 +
>>>>>    .../platform/qcom/iris/iris_platform_sm8650.c      | 266
>>>>> +++++++++++++++++++++
>>>>>    drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>>>>>    4 files changed, 272 insertions(+)
>>>>>
>>>>> diff --git a/drivers/media/platform/qcom/iris/Makefile
>>>>> b/drivers/media/platform/qcom/iris/Makefile
>>>>> index
>>>>> 6b64c9988505afd9707c704449d60bb53209229f..4caba81a95b806b9fa4937d9c7973031dea43d0e 100644
>>>>> --- a/drivers/media/platform/qcom/iris/Makefile
>>>>> +++ b/drivers/media/platform/qcom/iris/Makefile
>>>>> @@ -11,6 +11,7 @@ qcom-iris-objs += \
>>>>>                 iris_hfi_gen2_response.o \
>>>>>                 iris_hfi_queue.o \
>>>>>                 iris_platform_sm8550.o \
>>>>> +             iris_platform_sm8650.o \
>>>>>                 iris_power.o \
>>>>>                 iris_probe.o \
>>>>>                 iris_resources.o \
>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>>> b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>>> index
>>>>> f6b15d2805fb2004699709bb12cd7ce9b052180c..75e266a6b718acb8518079c2125dfb30435cbf2b 100644
>>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>>> @@ -35,6 +35,7 @@ enum pipe_type {
>>>>>      extern struct iris_platform_data sm8250_data;
>>>>>    extern struct iris_platform_data sm8550_data;
>>>>> +extern struct iris_platform_data sm8650_data;
>>>>>      enum platform_clk_type {
>>>>>        IRIS_AXI_CLK,
>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8650.c
>>>>> b/drivers/media/platform/qcom/iris/iris_platform_sm8650.c
>>>>> new file mode 100644
>>>>> index
>>>>> 0000000000000000000000000000000000000000..823e349dead2606129e52d6d2d674cb2550eaf17
>>>>> --- /dev/null
>>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8650.c
>>>>> @@ -0,0 +1,266 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>> +/*
>>>>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights
>>>>> reserved.
>>>>> + */
>>>>> +
>>>>> +#include "iris_core.h"
>>>>> +#include "iris_ctrls.h"
>>>>> +#include "iris_hfi_gen2.h"
>>>>> +#include "iris_hfi_gen2_defines.h"
>>>>> +#include "iris_platform_common.h"
>>>>> +#include "iris_vpu_common.h"
>>>>> +
>>>>> +#define VIDEO_ARCH_LX 1
>>>>> +
>>>>> +static struct platform_inst_fw_cap inst_fw_cap_sm8650[] = {
>>>>> +    {
>>>>> +        .cap_id = PROFILE,
>>>>> +        .min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
>>>>> +        .max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
>>>>> +        .step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH),
>>>>> +        .value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>>>>> +        .hfi_id = HFI_PROP_PROFILE,
>>>>> +        .flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>>>> +        .set = iris_set_u32_enum,
>>>>> +    },
>>>>> +    {
>>>>> +        .cap_id = LEVEL,
>>>>> +        .min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
>>>>> +        .max = V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
>>>>> +        .step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_1) |
>>>>> +                BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_2),
>>>>> +        .value = V4L2_MPEG_VIDEO_H264_LEVEL_6_1,
>>>>> +        .hfi_id = HFI_PROP_LEVEL,
>>>>> +        .flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
>>>>> +        .set = iris_set_u32_enum,
>>>>> +    },
>>>>> +    {
>>>>> +        .cap_id = INPUT_BUF_HOST_MAX_COUNT,
>>>>> +        .min = DEFAULT_MAX_HOST_BUF_COUNT,
>>>>> +        .max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
>>>>> +        .step_or_mask = 1,
>>>>> +        .value = DEFAULT_MAX_HOST_BUF_COUNT,
>>>>> +        .hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
>>>>> +        .flags = CAP_FLAG_INPUT_PORT,
>>>>> +        .set = iris_set_u32,
>>>>> +    },
>>>>> +    {
>>>>> +        .cap_id = STAGE,
>>>>> +        .min = STAGE_1,
>>>>> +        .max = STAGE_2,
>>>>> +        .step_or_mask = 1,
>>>>> +        .value = STAGE_2,
>>>>> +        .hfi_id = HFI_PROP_STAGE,
>>>>> +        .set = iris_set_stage,
>>>>> +    },
>>>>> +    {
>>>>> +        .cap_id = PIPE,
>>>>> +        .min = PIPE_1,
>>>>> +        .max = PIPE_4,
>>>>> +        .step_or_mask = 1,
>>>>> +        .value = PIPE_4,
>>>>> +        .hfi_id = HFI_PROP_PIPE,
>>>>> +        .set = iris_set_pipe,
>>>>> +    },
>>>>> +    {
>>>>> +        .cap_id = POC,
>>>>> +        .min = 0,
>>>>> +        .max = 2,
>>>>> +        .step_or_mask = 1,
>>>>> +        .value = 1,
>>>>> +        .hfi_id = HFI_PROP_PIC_ORDER_CNT_TYPE,
>>>>> +    },
>>>>> +    {
>>>>> +        .cap_id = CODED_FRAMES,
>>>>> +        .min = CODED_FRAMES_PROGRESSIVE,
>>>>> +        .max = CODED_FRAMES_PROGRESSIVE,
>>>>> +        .step_or_mask = 0,
>>>>> +        .value = CODED_FRAMES_PROGRESSIVE,
>>>>> +        .hfi_id = HFI_PROP_CODED_FRAMES,
>>>>> +    },
>>>>> +    {
>>>>> +        .cap_id = BIT_DEPTH,
>>>>> +        .min = BIT_DEPTH_8,
>>>>> +        .max = BIT_DEPTH_8,
>>>>> +        .step_or_mask = 1,
>>>>> +        .value = BIT_DEPTH_8,
>>>>> +        .hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
>>>>> +    },
>>>>> +    {
>>>>> +        .cap_id = RAP_FRAME,
>>>>> +        .min = 0,
>>>>> +        .max = 1,
>>>>> +        .step_or_mask = 1,
>>>>> +        .value = 1,
>>>>> +        .hfi_id = HFI_PROP_DEC_START_FROM_RAP_FRAME,
>>>>> +        .flags = CAP_FLAG_INPUT_PORT,
>>>>> +        .set = iris_set_u32,
>>>>> +    },
>>>>> +};
>>>>> +
>>>>> +static struct platform_inst_caps platform_inst_cap_sm8650 = {
>>>>> +    .min_frame_width = 96,
>>>>> +    .max_frame_width = 8192,
>>>>> +    .min_frame_height = 96,
>>>>> +    .max_frame_height = 8192,
>>>>> +    .max_mbpf = (8192 * 4352) / 256,
>>>>> +    .mb_cycles_vpp = 200,
>>>>> +    .mb_cycles_fw = 489583,
>>>>> +    .mb_cycles_fw_vpp = 66234,
>>>>> +    .num_comv = 0,
>>>>> +};
>>>>> +
>>>>> +static void iris_set_sm8650_preset_registers(struct iris_core *core)
>>>>> +{
>>>>> +    writel(0x0, core->reg_base + 0xB0088);
>>>>> +}
>>>>> +
>>>>> +static const struct icc_info sm8650_icc_table[] = {
>>>>> +    { "cpu-cfg",    1000, 1000     },
>>>>> +    { "video-mem",  1000, 15000000 },
>>>>> +};
>>>>> +
>>>>> +static const char * const sm8650_clk_reset_table[] = { "bus", "xo", "core" };
>>>>> +
>>>>> +static const struct bw_info sm8650_bw_table_dec[] = {
>>>>> +    { ((4096 * 2160) / 256) * 60, 1608000 },
>>>>> +    { ((4096 * 2160) / 256) * 30,  826000 },
>>>>> +    { ((1920 * 1080) / 256) * 60,  567000 },
>>>>> +    { ((1920 * 1080) / 256) * 30,  294000 },
>>>>> +};
>>>>> +
>>>>> +static const char * const sm8650_pmdomain_table[] = { "venus", "vcodec0" };
>>>>> +
>>>>> +static const char * const sm8650_opp_pd_table[] = { "mxc", "mmcx" };
>>>>> +
>>>>> +static const struct platform_clk_data sm8650_clk_table[] = {
>>>>> +    {IRIS_AXI_CLK,  "iface"        },
>>>>> +    {IRIS_CTRL_CLK, "core"         },
>>>>> +    {IRIS_HW_CLK,   "vcodec0_core" },
>>>>> +};
>>>>> +
>>>>> +static struct ubwc_config_data ubwc_config_sm8650 = {
>>>>> +    .max_channels = 8,
>>>>> +    .mal_length = 32,
>>>>> +    .highest_bank_bit = 16,
>>>>> +    .bank_swzl_level = 0,
>>>>> +    .bank_swz2_level = 1,
>>>>> +    .bank_swz3_level = 1,
>>>>> +    .bank_spreading = 1,
>>>>> +};
>>>>> +
>>>>> +static struct tz_cp_config tz_cp_config_sm8650 = {
>>>>> +    .cp_start = 0,
>>>>> +    .cp_size = 0x25800000,
>>>>> +    .cp_nonpixel_start = 0x01000000,
>>>>> +    .cp_nonpixel_size = 0x24800000,
>>>>> +};
>>>>> +
>>>>> +static const u32 sm8650_vdec_input_config_params[] = {
>>>>> +    HFI_PROP_BITSTREAM_RESOLUTION,
>>>>> +    HFI_PROP_CROP_OFFSETS,
>>>>> +    HFI_PROP_CODED_FRAMES,
>>>>> +    HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
>>>>> +    HFI_PROP_PIC_ORDER_CNT_TYPE,
>>>>> +    HFI_PROP_PROFILE,
>>>>> +    HFI_PROP_LEVEL,
>>>>> +    HFI_PROP_SIGNAL_COLOR_INFO,
>>>>> +};
>>>>> +
>>>>> +static const u32 sm8650_vdec_output_config_params[] = {
>>>>> +    HFI_PROP_COLOR_FORMAT,
>>>>> +    HFI_PROP_LINEAR_STRIDE_SCANLINE,
>>>>> +};
>>>>> +
>>>>> +static const u32 sm8650_vdec_subscribe_input_properties[] = {
>>>>> +    HFI_PROP_NO_OUTPUT,
>>>>> +};
>>>>> +
>>>>> +static const u32 sm8650_vdec_subscribe_output_properties[] = {
>>>>> +    HFI_PROP_PICTURE_TYPE,
>>>>> +    HFI_PROP_CABAC_SESSION,
>>>>> +};
>>>>> +
>>>>> +static const u32 sm8650_dec_ip_int_buf_tbl[] = {
>>>>> +    BUF_BIN,
>>>>> +    BUF_COMV,
>>>>> +    BUF_NON_COMV,
>>>>> +    BUF_LINE,
>>>>> +};
>>>>> +
>>>>> +static const u32 sm8650_dec_op_int_buf_tbl[] = {
>>>>> +    BUF_DPB,
>>>>> +};
>>>>> +
>>>>> +struct iris_platform_data sm8650_data = {
>>>>> +    .get_instance = iris_hfi_gen2_get_instance,
>>>>> +    .init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>>>>> +    .init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>>>>> +    .vpu_ops = &iris_vpu33_ops,
>>>>> +    .set_preset_registers = iris_set_sm8650_preset_registers,
>>>>> +    .icc_tbl = sm8650_icc_table,
>>>>> +    .icc_tbl_size = ARRAY_SIZE(sm8650_icc_table),
>>>>> +    .clk_rst_tbl = sm8650_clk_reset_table,
>>>>> +    .clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
>>>>> +    .bw_tbl_dec = sm8650_bw_table_dec,
>>>>> +    .bw_tbl_dec_size = ARRAY_SIZE(sm8650_bw_table_dec),
>>>>> +    .pmdomain_tbl = sm8650_pmdomain_table,
>>>>> +    .pmdomain_tbl_size = ARRAY_SIZE(sm8650_pmdomain_table),
>>>>> +    .opp_pd_tbl = sm8650_opp_pd_table,
>>>>> +    .opp_pd_tbl_size = ARRAY_SIZE(sm8650_opp_pd_table),
>>>>> +    .clk_tbl = sm8650_clk_table,
>>>>> +    .clk_tbl_size = ARRAY_SIZE(sm8650_clk_table),
>>>>> +    /* Upper bound of DMA address range */
>>>>> +    .dma_mask = 0xe0000000 - 1,
>>>>> +    .fwname = "qcom/vpu/vpu33_p4.mbn",
>>>>> +    .pas_id = IRIS_PAS_ID,
>>>>> +    .inst_caps = &platform_inst_cap_sm8650,
>>>>> +    .inst_fw_caps = inst_fw_cap_sm8650,
>>>>> +    .inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_sm8650),
>>>>> +    .tz_cp_config_data = &tz_cp_config_sm8650,
>>>>> +    .core_arch = VIDEO_ARCH_LX,
>>>>> +    .hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>>>>> +    .ubwc_config = &ubwc_config_sm8650,
>>>>> +    .num_vpp_pipe = 4,
>>>>> +    .max_session_count = 16,
>>>>> +    .max_core_mbpf = ((8192 * 4352) / 256) * 2,
>>>>> +    .input_config_params =
>>>>> +        sm8650_vdec_input_config_params,
>>>>> +    .input_config_params_size =
>>>>> +        ARRAY_SIZE(sm8650_vdec_input_config_params),
>>>>> +    .output_config_params =
>>>>> +        sm8650_vdec_output_config_params,
>>>>> +    .output_config_params_size =
>>>>> +        ARRAY_SIZE(sm8650_vdec_output_config_params),
>>>>> +    .dec_input_prop = sm8650_vdec_subscribe_input_properties,
>>>>> +    .dec_input_prop_size =
>>>>> ARRAY_SIZE(sm8650_vdec_subscribe_input_properties),
>>>>> +    .dec_output_prop = sm8650_vdec_subscribe_output_properties,
>>>>> +    .dec_output_prop_size =
>>>>> ARRAY_SIZE(sm8650_vdec_subscribe_output_properties),
>>>>> +
>>>>> +    .dec_ip_int_buf_tbl = sm8650_dec_ip_int_buf_tbl,
>>>>> +    .dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8650_dec_ip_int_buf_tbl),
>>>>> +    .dec_op_int_buf_tbl = sm8650_dec_op_int_buf_tbl,
>>>>> +    .dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8650_dec_op_int_buf_tbl),
>>>>> +};
>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c
>>>>> b/drivers/media/platform/qcom/iris/iris_probe.c
>>>>> index
>>>>> aca442dcc153830e6252d1dca87afb38c0b9eb8f..8e6cc1dc529608696e81f2764e90ea3864030125 100644
>>>>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>>>>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>>>>> @@ -330,6 +330,10 @@ static const struct of_device_id iris_dt_match[] = {
>>>>>                .data = &sm8250_data,
>>>>>            },
>>>>>    #endif
>>>>> +    {
>>>>> +        .compatible = "qcom,sm8650-iris",
>>>>> +        .data = &sm8650_data,
>>>>> +    },
>>>>>        { },
>>>>>    };
>>>>>    MODULE_DEVICE_TABLE(of, iris_dt_match);
>>>>>
>>>
> 

