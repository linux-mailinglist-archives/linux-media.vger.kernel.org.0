Return-Path: <linux-media+bounces-36099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2399FAEB905
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 15:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E1E15647B7
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 13:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39DD2D978F;
	Fri, 27 Jun 2025 13:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lLZoxHO0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803BF8460;
	Fri, 27 Jun 2025 13:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751031150; cv=none; b=Nz2TlGaz7VT+9ozgCylEEZ0nxe0BtdRHdYeR9T8bY3qrUGAMQmMxOG7urqSvdEThk35oU/Kr5PSK8miwqrP+TOmwjQEZjjh3qQa6z+sakuXBrvZMJcFE4QPyx57BB+cMGDCSHUvxSU+uiykZHLFocXNtzw3rY+xzkqbYS0OF2cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751031150; c=relaxed/simple;
	bh=HC/DEjM5J8QL4F+2Mvu6EowzG/eEi45fG/y3A7SB7k8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SOmJjY9v00WcKphmGMinbbzQd1Pxiqruzeluj4N8OErRgKgRa5+eY9TQUQYvdNOVdX3j01woVBA94x409Q+rHF01xKpydX1ZO7rZ1NZMoDJRnXH4f2whXsGfyv9g581XpppwHcO4b7J6DvLyRwZkv63eivgru1rFEhCz39d6QNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lLZoxHO0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBNrbf027982;
	Fri, 27 Jun 2025 13:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vMHAyrq+J7uCbHOadEl489HecFO/L6w6oUNe1zAHvLM=; b=lLZoxHO0i5nUx/FO
	CkJAHT0qgk8eGlE0PuQmnse0GimyJHgHhx4J+yrH/ZXaPwZx1sSuiX5flWIarc+S
	KvwEcAZAYI79Ek4fczOwzKITzw1QX5IdWwjEAXAjRiWIyOTjJ0Mt/1I7Wg2rsF/t
	ScM5mQyYnP4wSZjde9GqVG0+ib/XGe3q6i95AHAnB9c0io00cMtzVIMcjqqmoSrL
	ZigqLZQfWmeJM2/esoR27VQK798tN8efUA29W2i9TeyWPjb40ujOV97tbKEyOUgX
	rpMkoaM5p6Ju3AdUUk3rTjJvySAnaDc8hZTjdrzzZXxSRRnqp8ToVmUAJsZSO+8t
	XNRg2Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26hcmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 13:32:24 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RDWNLf021307
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 13:32:23 GMT
Received: from [10.50.47.15] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 27 Jun
 2025 06:32:19 -0700
Message-ID: <bac6a881-90b6-4f33-d9a8-61aa8daea330@quicinc.com>
Date: Fri, 27 Jun 2025 19:02:13 +0530
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
Content-Language: en-US
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, <krzk+dt@kernel.org>,
        <bryan.odonoghue@linaro.org>, <quic_vgarodia@quicinc.com>,
        <mchehab@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <konradybcio@kernel.org>, <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-4-jorge.ramirez@oss.qualcomm.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250626135931.700937-4-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDExMSBTYWx0ZWRfX+khsHtOgx08a
 kGVnc5a7AiHI1EVq2RCuFEWDAVyG2Tlte6oZ8H1Dhi1pkMAJQWH/Iej/J5l2IBcfwAYNB9yCk5d
 N/rl+/cU5eaSa3q2QG/C60aKVNreTYXSGuaKIsIr56iWg5dR2Cz57ZeYT2UV2x0YoLiRsfnRi7L
 KP9rfriLIfDN59YZ60Hb/RTOR8NH89PWBFVD2uGnmGokQgKj+02mFFFA+qNaSgcnDudg20h2jwP
 ajpPitKP7bDBUHwv7x5/PhvCqpCJp/Ve0G7j81GqgBEO9x2MW2pmAuyjWtDYiRYVYSBP1VQ8IO1
 bHjdGgGROXfa0mkLS8R6luw2gAGxGU20jsLaIIgEhgea1z4Rcq5B9KwtiwW4tAGs4hx4ozG68Z6
 DsT8vVIr4CMj7i78hfFPKS5SvnQVmzcUoiYe5UmqGMgAz5yBLJj9m/ovhfA6i8cFv8mAszY8
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685e9d68 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=esnrhbXvP8uubAlYoN8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: QzTeF6xO_IHyaXHvptvafgM8cTPg5Alr
X-Proofpoint-ORIG-GUID: QzTeF6xO_IHyaXHvptvafgM8cTPg5Alr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270111



On 6/26/2025 7:29 PM, Jorge Ramirez-Ortiz wrote:
> Add hfi platform file with decoding capabilities for hfi v6_lite.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/Makefile    |   2 +-
>  .../media/platform/qcom/venus/hfi_platform.c  |   2 +
>  .../media/platform/qcom/venus/hfi_platform.h  |   1 +
>  .../qcom/venus/hfi_platform_v6_lite.c         | 148 ++++++++++++++++++
>  4 files changed, 152 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
> 
> diff --git a/drivers/media/platform/qcom/venus/Makefile b/drivers/media/platform/qcom/venus/Makefile
> index 91ee6be10292..4a6a942db58b 100644
> --- a/drivers/media/platform/qcom/venus/Makefile
> +++ b/drivers/media/platform/qcom/venus/Makefile
> @@ -5,7 +5,7 @@ venus-core-objs += core.o helpers.o firmware.o \
>  		   hfi_venus.o hfi_msgs.o hfi_cmds.o hfi.o \
>  		   hfi_parser.o pm_helpers.o dbgfs.o \
>  		   hfi_platform.o hfi_platform_v4.o \
> -		   hfi_platform_v6.o hfi_plat_bufs_v6.o \
> +		   hfi_platform_v6.o hfi_plat_bufs_v6.o hfi_platform_v6_lite.o \
s/hfi_platform_v6_lite/hfi_platform_v4_lite
>  
>  venus-dec-objs += vdec.o vdec_ctrls.o
>  venus-enc-objs += venc.o venc_ctrls.o
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
> index 643e5aa138f5..f56b8f9946d7 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform.c
> +++ b/drivers/media/platform/qcom/venus/hfi_platform.c
> @@ -13,6 +13,8 @@ const struct hfi_platform *hfi_platform_get(enum hfi_version version)
>  		return &hfi_plat_v4;
>  	case HFI_VERSION_6XX:
>  		return &hfi_plat_v6;
> +	case HFI_VERSION_6XX_LITE:
> +		return &hfi_plat_v6_lite;
update here as well.
>  	default:
>  		break;
>  	}
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
> index ec89a90a8129..6356e4bd0de2 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform.h
> +++ b/drivers/media/platform/qcom/venus/hfi_platform.h
> @@ -58,6 +58,7 @@ struct hfi_platform {
>  
>  extern const struct hfi_platform hfi_plat_v4;
>  extern const struct hfi_platform hfi_plat_v6;
> +extern const struct hfi_platform hfi_plat_v6_lite;
ditto
>  
>  const struct hfi_platform *hfi_platform_get(enum hfi_version version);
>  unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec,
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c b/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
> new file mode 100644
> index 000000000000..41958a3e353b
> --- /dev/null
> +++ b/drivers/media/platform/qcom/venus/hfi_platform_v6_lite.c
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025, The Linux Foundation. All rights reserved.
> + */
> +#include "hfi_platform.h"
> +
> +static const struct hfi_plat_caps caps[] = {
> +{
> +	.codec = HFI_VIDEO_CODEC_H264,
> +	.domain = VIDC_SESSION_TYPE_DEC,
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1080, 1},
> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> +	.num_caps = 7,
> +	.pl[0] = {HFI_H264_PROFILE_BASELINE, HFI_H264_LEVEL_1},
> +	.pl[1] = {HFI_H264_PROFILE_MAIN, HFI_H264_LEVEL_41},
> +	.pl[2] = {HFI_H264_PROFILE_HIGH, HFI_H264_LEVEL_5},
> +	.pl[3] = {HFI_H264_PROFILE_CONSTRAINED_BASE, HFI_H264_LEVEL_41},
> +	.pl[4] = {HFI_H264_PROFILE_CONSTRAINED_HIGH, HFI_H264_LEVEL_41},
what is the reference for these values?
> +	.num_pl = 5,
> +	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
> +	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
> +	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
> +	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
> +	.num_fmts = 4,
> +}, {
> +	.codec = HFI_VIDEO_CODEC_HEVC,
> +	.domain = VIDC_SESSION_TYPE_DEC,
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1080, 1},
> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> +	.num_caps = 7,
> +	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_MAIN},
> +	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_MAIN},
what is the reference for these values?
> +	.num_pl = 2,
> +	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
> +	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
> +	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
> +	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
> +	.num_fmts = 4,
> +}, {
> +	.codec = HFI_VIDEO_CODEC_VP9,
> +	.domain = VIDC_SESSION_TYPE_DEC,
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1080, 1},
> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> +	.num_caps = 7,
> +	.pl[0] = {HFI_VP9_PROFILE_P0, 200},
> +	.pl[1] = {HFI_VP9_PROFILE_P2_10B, 200},
> +	.num_pl = 2,
> +	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
> +	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
> +	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
> +	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
> +	.num_fmts = 4,
> +} };
> +
> +static const struct hfi_plat_caps *get_capabilities(unsigned int *entries)
> +{
> +	*entries = ARRAY_SIZE(caps);
> +	return caps;
> +}
> +
> +static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
> +{
> +	*enc_codecs = 0x0;
> +	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> +		      HFI_VIDEO_CODEC_VP9;
> +	*count = 3;
> +}
> +
> +static const struct hfi_platform_codec_freq_data codec_freq_data[] = {
> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> +	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> +};
> +
> +static const struct hfi_platform_codec_freq_data *
> +get_codec_freq_data(u32 session_type, u32 pixfmt)
> +{
> +	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
> +	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
> +	const struct hfi_platform_codec_freq_data *found = NULL;
> +
> +	for (i = 0; i < data_size; i++) {
> +		if (data[i].pixfmt == pixfmt &&
> +		    data[i].session_type == session_type) {
> +			found = &data[i];
> +			break;
> +		}
> +	}
> +
> +	return found;
> +}
> +
> +static unsigned long codec_vpp_freq(u32 session_type, u32 codec)
> +{
> +	const struct hfi_platform_codec_freq_data *data;
> +
> +	data = get_codec_freq_data(session_type, codec);
> +	if (data)
> +		return data->vpp_freq;
> +
> +	return 0;
> +}
> +
> +static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
> +{
> +	const struct hfi_platform_codec_freq_data *data;
> +
> +	data = get_codec_freq_data(session_type, codec);
> +	if (data)
> +		return data->vsp_freq;
> +
> +	return 0;
> +}
> +
> +static unsigned long codec_lp_freq(u32 session_type, u32 codec)
> +{
> +	const struct hfi_platform_codec_freq_data *data;
> +
> +	data = get_codec_freq_data(session_type, codec);
> +	if (data)
> +		return data->low_power_freq;
> +
> +	return 0;
> +}
> +
> +const struct hfi_platform hfi_plat_v6_lite = {
> +	.codec_vpp_freq = codec_vpp_freq,
> +	.codec_vsp_freq = codec_vsp_freq,
> +	.codec_lp_freq = codec_lp_freq,
> +	.codecs = get_codecs,
> +	.capabilities = get_capabilities,
> +	.bufreq = hfi_plat_bufreq_v6,
buffer requirement should come from firmware, pls drop.
> +};

lot of code duplication here, pls see the possibility to commonize the code.

Thanks,
Dikshita

