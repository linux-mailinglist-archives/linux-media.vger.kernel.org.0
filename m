Return-Path: <linux-media+bounces-36969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0250CAFAFB3
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 11:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCE7E7A6702
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 09:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F70290BC4;
	Mon,  7 Jul 2025 09:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QBMYEj9X"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5C428F94E;
	Mon,  7 Jul 2025 09:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751880600; cv=none; b=OWyPf0M1VXMAfiCS0nT9R+fr+wy2EKSxMPkIPNz7U60b8j/sw7u/MH/RBH41QthDYeWYGhu52hp3nvIslk9rvWdAkqHkzHpCIWcIos9twNdf6e9566HwyAeo9CaQegwN3d6lXOPvJKpqz75eYty7GBrCHhxs7T5ArjT/cTdCxpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751880600; c=relaxed/simple;
	bh=cUJkHRlPU3dD0Kkj2ZVPP5tJvDBnfXGcTn0wZIquuws=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZQsAsiyKIQDeKG+rdZIloeil3XD6mXdkTc9+9Hn9HG7458sul0VxDmix9PtbhXLW/cbfYDXOf6DKHg3EpU1cRxPA9snOgRfx+Q16+SGANDY0ATwAAJYMLiRb+yWiZzjkpQAUMBIdOetiq7zUahVdhPIYOuHPyS9XHh9HL/qYUdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QBMYEj9X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56794slE018246;
	Mon, 7 Jul 2025 09:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	baq6KL++M3MprFl78c1tCIhzfanJerfYZfqtXVk74q0=; b=QBMYEj9XVrBEFaMf
	7Z2WfHwxoRZdqYxoV3lcV+aX4Omfu+R47NkrnW19gis37CO65DDCyejOZyMLIPzC
	YlH8SdTjMc4YZ3C+Q4vOyubK5hUY252+ChCJGVrvy3S/FZD3TNe8TbhancoMeNsx
	lL1wnuayseDllY8QXINb/iqhyNmWOcJpFQkIp4d78U0iAJ+HWXUR92+RaIyLkYbt
	dukdi6RgQJXh0LGnZ4MScCysglYV2CGfgURbOimjlgqKVtm+fnGzEq6CIFRjdSKT
	LlQ0GehDY+FCL8fMskYdO0SY2nEGq1ftrC0yW2Z+FbjMeKWZkoJnBFifsB/nEsuy
	/t132A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4xm6xt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 09:29:53 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5679TqOt019010
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Jul 2025 09:29:52 GMT
Received: from [10.204.100.197] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 7 Jul
 2025 02:29:49 -0700
Message-ID: <db7fbfb8-b0fe-58e2-4564-f24d6a551232@quicinc.com>
Date: Mon, 7 Jul 2025 14:59:05 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 3/5] media: venus: hfi_plat_v6_lite: Populate decode
 capabilities
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
CC: <krzk+dt@kernel.org>, <bryan.odonoghue@linaro.org>,
        <quic_vgarodia@quicinc.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <conor+dt@kernel.org>, <konradybcio@kernel.org>,
        <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-4-jorge.ramirez@oss.qualcomm.com>
 <bac6a881-90b6-4f33-d9a8-61aa8daea330@quicinc.com> <aGuPpzU0VCg45Plg@trex>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <aGuPpzU0VCg45Plg@trex>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1NCBTYWx0ZWRfX24CRgfaFmKDY
 HZIEkszEPVBNiCTE34VvPdTglRACkYDFF5NVHooxKg4G37TgjzIjVckXXki6JKRI2or9MBsy/Xy
 lzfrXxAzOj0C+Um44zRhDxoNNSU/HMMxZsEvPu4lhJkf6Pk6Fe1J0JgnwNheqWAELABJaEabpRi
 mDyiTMSF9mo9WRe+ozWkrpQsh4/AEqM8kIP9HF+b2Qa1+66iGjgTRG3s0aJvKsrPCqKBhmsfR+T
 c0K/4rIW14c8UCiBS6s5oLRO6YlPiQRKGqFrUFoMcR4fAwHrKZI+DUxFlWkptHGBUKOt0iqky7/
 9m8dsSvuwh1GgAfPcHGXIX7oAjQJ562kl2NRTRtnrcV2MpS70XbCnnkgltLXwxj9zi9BYT30rt6
 58+fJ+j9VgO+mfxtDuEfhI87JUClAYkOCI5JNk9WU0PcHptnApdsmw15E2mZxlTiPzpdWX+S
X-Proofpoint-ORIG-GUID: Jk5ZkcFZ0xsgkSM4CGmtcBHLYD02OTqR
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=686b9392 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=BhxOyAfbP4nqgobld3cA:9 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: Jk5ZkcFZ0xsgkSM4CGmtcBHLYD02OTqR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070054



On 7/7/2025 2:43 PM, Jorge Ramirez wrote:
> On 27/06/25 19:02:13, Dikshita Agarwal wrote:
>>
>>
>> On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
>>> Add hfi platform file with decoding capabilities for hfi v6_lite.
>>>
>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/venus/Makefile    |   2 +-
>>>  .../media/platform/qcom/venus/hfi_platform.c  |   2 +
>>>  .../media/platform/qcom/venus/hfi_platform.h  |   1 +
>>>  .../qcom/venus/hfi_platform_v6_lite.c         | 148 ++++++++++++++++++
>>>  4 files changed, 152 insertions(+), 1 deletion(-)
>>>  create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/Makefile b/drivers/media/platform/qcom/venus/Makefile
>>> index 91ee6be10292..4a6a942db58b 100644
>>> --- a/drivers/media/platform/qcom/venus/Makefile
>>> +++ b/drivers/media/platform/qcom/venus/Makefile
>>> @@ -5,7 +5,7 @@ venus-core-objs += core.o helpers.o firmware.o \
>>>  		   hfi_venus.o hfi_msgs.o hfi_cmds.o hfi.o \
>>>  		   hfi_parser.o pm_helpers.o dbgfs.o \
>>>  		   hfi_platform.o hfi_platform_v4.o \
>>> -		   hfi_platform_v6.o hfi_plat_bufs_v6.o \
>>> +		   hfi_platform_v6.o hfi_plat_bufs_v6.o hfi_platform_v6_lite.o \
>> s/hfi_platform_v6_lite/hfi_platform_v4_lite
> 
> will remove, will use platform_v4 instead
> 
>>>  
>>>  venus-dec-objs += vdec.o vdec_ctrls.o
>>>  venus-enc-objs += venc.o venc_ctrls.o
>>> diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
>>> index 643e5aa138f5..f56b8f9946d7 100644
>>> --- a/drivers/media/platform/qcom/venus/hfi_platform.c
>>> +++ b/drivers/media/platform/qcom/venus/hfi_platform.c
>>> @@ -13,6 +13,8 @@ const struct hfi_platform *hfi_platform_get(enum hfi_version version)
>>>  		return &hfi_plat_v4;
>>>  	case HFI_VERSION_6XX:
>>>  		return &hfi_plat_v6;
>>> +	case HFI_VERSION_6XX_LITE:
>>> +		return &hfi_plat_v6_lite;
>> update here as well.
> 
> yes, this function wont get changed
> 
>>>  	default:
>>>  		break;
>>>  	}
>>> diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
>>> index ec89a90a8129..6356e4bd0de2 100644
>>> --- a/drivers/media/platform/qcom/venus/hfi_platform.h
>>> +++ b/drivers/media/platform/qcom/venus/hfi_platform.h
>>> @@ -58,6 +58,7 @@ struct hfi_platform {
>>>  
>>>  extern const struct hfi_platform hfi_plat_v4;
>>>  extern const struct hfi_platform hfi_plat_v6;
>>> +extern const struct hfi_platform hfi_plat_v6_lite;
>> ditto
> 
> neither this one
> 
>>>  
>>>  const struct hfi_platform *hfi_platform_get(enum hfi_version version);
>>>  unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec,
>>> diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c b/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
>>> new file mode 100644
>>> index 000000000000..41958a3e353b
>>> --- /dev/null
>>> +++ b/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
>>> @@ -0,0 +1,148 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2025, The Linux Foundation. All rights reserved.
>>> + */
>>> +#include "hfi_platform.h"
>>> +
>>> +static const struct hfi_plat_caps caps[] = {
>>> +{
>>> +	.codec = HFI_VIDEO_CODEC_H264,
>>> +	.domain = VIDC_SESSION_TYPE_DEC,
>>> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
>>> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1080, 1},
>>> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
>>> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
>>> +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
>>> +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
>>> +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
>>> +	.num_caps = 7,
>>> +	.pl[0] = {HFI_H264_PROFILE_BASELINE, HFI_H264_LEVEL_1},
>>> +	.pl[1] = {HFI_H264_PROFILE_MAIN, HFI_H264_LEVEL_41},
>>> +	.pl[2] = {HFI_H264_PROFILE_HIGH, HFI_H264_LEVEL_5},
>>> +	.pl[3] = {HFI_H264_PROFILE_CONSTRAINED_BASE, HFI_H264_LEVEL_41},
>>> +	.pl[4] = {HFI_H264_PROFILE_CONSTRAINED_HIGH, HFI_H264_LEVEL_41},
>> what is the reference for these values?
> 
> what do you mean? what should be the reference? I didnt see a downstream
> equivalente to base on so based on the 4XX settings these seem
> consistent.
> 
My question was regarding the profile and level mapping.
The profiles added are consistent with 4xx, I agree. But the value of
levels mapped with each profile is not matching with [1], hence the
question about the reference used for this mapping.

[1]
https://elixir.bootlin.com/linux/v6.16-rc4/source/drivers/media/platform/qcom/venus/hfi_platform_v4.c#L23

Thanks,
Dikshita
> IS there any internal document that you can point me to please?
> 
> 
>>> +	.num_pl = 5,
>>> +	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
>>> +	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
>>> +	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
>>> +	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
>>> +	.num_fmts = 4,
>>> +}, {
>>> +	.codec = HFI_VIDEO_CODEC_HEVC,
>>> +	.domain = VIDC_SESSION_TYPE_DEC,
>>> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
>>> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1080, 1},
>>> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
>>> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
>>> +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
>>> +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
>>> +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
>>> +	.num_caps = 7,
>>> +	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_MAIN},
>>> +	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_MAIN},
>> what is the reference for these values?
> 
> same as above.
> 
> what internal documents do you typically reference to? Havent seen these
> references in previous commits.
> 
> could you clarify please?
> 
> 
>>> +	.num_pl = 2,
>>> +	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
>>> +	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
>>> +	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
>>> +	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
>>> +	.num_fmts = 4,
>>> +}, {
>>> +	.codec = HFI_VIDEO_CODEC_VP9,
>>> +	.domain = VIDC_SESSION_TYPE_DEC,
>>> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
>>> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1080, 1},
>>> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
>>> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
>>> +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
>>> +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
>>> +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
>>> +	.num_caps = 7,
>>> +	.pl[0] = {HFI_VP9_PROFILE_P0, 200},
>>> +	.pl[1] = {HFI_VP9_PROFILE_P2_10B, 200},
>>> +	.num_pl = 2,
>>> +	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
>>> +	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
>>> +	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
>>> +	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
>>> +	.num_fmts = 4,
>>> +} };
>>> +
>>> +static const struct hfi_plat_caps *get_capabilities(unsigned int *entries)
>>> +{
>>> +	*entries = ARRAY_SIZE(caps);
>>> +	return caps;
>>> +}
>>> +
>>> +static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
>>> +{
>>> +	*enc_codecs = 0x0;
>>> +	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
>>> +		      HFI_VIDEO_CODEC_VP9;
>>> +	*count = 3;
>>> +}
>>> +
>>> +static const struct hfi_platform_codec_freq_data codec_freq_data[] = {
>>> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
>>> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
>>> +	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
>>> +};
>>> +
>>> +static const struct hfi_platform_codec_freq_data *
>>> +get_codec_freq_data(u32 session_type, u32 pixfmt)
>>> +{
>>> +	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
>>> +	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
>>> +	const struct hfi_platform_codec_freq_data *found = NULL;
>>> +
>>> +	for (i = 0; i < data_size; i++) {
>>> +		if (data[i].pixfmt == pixfmt &&
>>> +		    data[i].session_type == session_type) {
>>> +			found = &data[i];
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>> +	return found;
>>> +}
>>> +
>>> +static unsigned long codec_vpp_freq(u32 session_type, u32 codec)
>>> +{
>>> +	const struct hfi_platform_codec_freq_data *data;
>>> +
>>> +	data = get_codec_freq_data(session_type, codec);
>>> +	if (data)
>>> +		return data->vpp_freq;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
>>> +{
>>> +	const struct hfi_platform_codec_freq_data *data;
>>> +
>>> +	data = get_codec_freq_data(session_type, codec);
>>> +	if (data)
>>> +		return data->vsp_freq;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static unsigned long codec_lp_freq(u32 session_type, u32 codec)
>>> +{
>>> +	const struct hfi_platform_codec_freq_data *data;
>>> +
>>> +	data = get_codec_freq_data(session_type, codec);
>>> +	if (data)
>>> +		return data->low_power_freq;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +const struct hfi_platform hfi_plat_v6_lite = {
>>> +	.codec_vpp_freq = codec_vpp_freq,
>>> +	.codec_vsp_freq = codec_vsp_freq,
>>> +	.codec_lp_freq = codec_lp_freq,
>>> +	.codecs = get_codecs,
>>> +	.capabilities = get_capabilities,
>>> +	.bufreq = hfi_plat_bufreq_v6,
>> buffer requirement should come from firmware, pls drop.
> 
> yes, this will be hfi_plat_v4 only
> 
>>> +};
>>
>> lot of code duplication here, pls see the possibility to commonize the
>>> code.
> 
> this file is no longer needed
> 
>>
>> Thanks,
>> Dikshita

