Return-Path: <linux-media+bounces-31292-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA67AA0885
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 12:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D2003BF771
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 10:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C142C1085;
	Tue, 29 Apr 2025 10:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DIxwAfzA"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5E5219301;
	Tue, 29 Apr 2025 10:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745922412; cv=none; b=ePstIFLsKSGGT9kAJ0CIb4RP3sqB+eO1pnInzwEQLoWkNJjs0g4jw7quiS7wrl+4PpyribCqRw7bEpd2hbAFSe3UqvjrnvuOHlN1khlTYnNB1P4agGkJMsbeswiKWIEROxHevhA6uPQmKHo9SKTf1kZqrJphEEPKKPZ6ruE7S3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745922412; c=relaxed/simple;
	bh=yf+OaSgwIrJjCmB4db3coW6/iMpxQhV0LO2Ob2KJgcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Pm1Bl8xdzQjhE23Lb8L3ugWo34GpvZHvBxF4UNd/HTTpKkWfq6UIpqhH+YtQaDIfBYogO8CfMeeD/i3gHP5faPGAWoGTWn3HTzA64RBdrkUgTjgYZkyJdx16FtgxFYRtD+Ybt9s3lsO7P2I6g+jWrZ9W2STlj5kMbD/9l2u78UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DIxwAfzA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA1BBP006805;
	Tue, 29 Apr 2025 10:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cNfumHFumLypetlqzFXTQrH7N79Mufs2sjk7brxRYNs=; b=DIxwAfzAjtkpW/3Q
	2HdmWOoPc5EJ4jhUgigcAF1dWzf7FWolPm6jNmSqA2kDhwoCOTsg3BShAq6oX74I
	L+6zwp7r3WK+sKPzJeNlqJV7lyOw0eFm1WGsC9ER8LyK3Ivkq/oNkIVcWFYjHNVP
	fcjDU1ZK7u8C6adRQvgZsHsijulI1PcmdYIYC3J+hyW+PEkM+hhKarnbR3HQtI3B
	4SUl3NOhehx1WAQzFMjDp1G5ufy8euIPld/oJikHc2rAcB1COms2v6v/zT8cTKgH
	aB11zFamBABUCgH9GfHtmYuvoeHWVRH+F3ym5xr75QnySlXL2nwjupUNphhZxaae
	kH8OTw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468ptmm64t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:26:45 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53TAQiP7005195
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 10:26:44 GMT
Received: from [10.50.27.172] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 03:26:38 -0700
Message-ID: <0d9a46fc-febf-f64a-20cd-b91e2e70ebcf@quicinc.com>
Date: Tue, 29 Apr 2025 15:56:35 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 12/23] media: iris: Remove deprecated property setting
 to firmware
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-12-3a6013ecb8a5@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-12-3a6013ecb8a5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0HQ2wtIe67GqCzlgEDjNmjMhBpwntqsz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA3NyBTYWx0ZWRfX9Ke5cpN1yVkh A9czum5FcshNGh9q1ICq1gTccUBpWUsszjw5tTJWTzmBA4KcjCfe8E8LgAQJHf1LHfOGwVBbjuX jeuwatdvO8x0fSH35jNfqMk0xmALhX/uYCrZ0T6J2J5yZ6g1KhKzLAgr53cJBMqGOjs/M04K8+u
 wztBSlgwSFLxgdX4embgnuXclrFPVRByMIB7pO/12WAldeF0LyopYKQv+KBC6+W78UPsEslxsWS zLuc4858t61pC27hdEpLknUUj3UyvlWZKjPO/JW9jojG7k6tyI+RFdGFdhtGyvXEiJJzeKmcAmr kDA+2zKVb5qdD7kN/LKqrDXjhrcBZgfh5uJ8vLbeUVIHONv3TqO4EbOqPoMXpXG6E6YvfxmyaT9
 N9a1czCabd6270OAR6FrD+9cmaapKuFvSmfwV7/SrebKo2+Lh9FzCY1Zq7lGU2f6ZJJXLrzj
X-Proofpoint-GUID: 0HQ2wtIe67GqCzlgEDjNmjMhBpwntqsz
X-Authority-Analysis: v=2.4 cv=DKWP4zNb c=1 sm=1 tr=0 ts=6810a965 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=A9mHuVzRXomcFk2rf74A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290077



On 4/28/2025 2:59 PM, Dikshita Agarwal wrote:
> HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER is deprecated and no longer
> supported on current firmware, remove setting the same to firmware.
> 
> At the same time, remove the check for non-zero number of v4l2 controls
> as some SOC might not expose any capability which requires v4l2 control.
> 
> Cc: stable@vger.kernel.org
> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c            | 6 ------
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 8 --------
>  drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h | 1 -
>  drivers/media/platform/qcom/iris/iris_platform_common.h  | 2 +-
>  drivers/media/platform/qcom/iris/iris_platform_sm8250.c  | 9 ---------
>  5 files changed, 1 insertion(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index b690578256d5..915de101fcba 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -17,8 +17,6 @@ static inline bool iris_valid_cap_id(enum platform_inst_fw_cap_type cap_id)
>  static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  {
>  	switch (id) {
> -	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
> -		return DEBLOCK;
>  	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
>  		return PROFILE;
>  	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
> @@ -34,8 +32,6 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>  		return 0;
>  
>  	switch (cap_id) {
> -	case DEBLOCK:
> -		return V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER;
>  	case PROFILE:
>  		return V4L2_CID_MPEG_VIDEO_H264_PROFILE;
>  	case LEVEL:
> @@ -84,8 +80,6 @@ int iris_ctrls_init(struct iris_inst *inst)
>  		if (iris_get_v4l2_id(cap[idx].cap_id))
>  			num_ctrls++;
>  	}
> -	if (!num_ctrls)
> -		return -EINVAL;
>  
>  	/* Adding 1 to num_ctrls to include V4L2_CID_MIN_BUFFERS_FOR_CAPTURE */
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 2239708d2d7e..f9f3e2d2ce29 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -490,14 +490,6 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
>  		packet->shdr.hdr.size += sizeof(u32) + sizeof(*wm);
>  		break;
>  	}
> -	case HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER: {
> -		struct hfi_enable *en = prop_data;
> -		u32 *in = pdata;
> -
> -		en->enable = *in;
> -		packet->shdr.hdr.size += sizeof(u32) + sizeof(*en);
> -		break;
> -	}
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> index 93b5f838c290..adffcead58ea 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
> @@ -65,7 +65,6 @@
>  
>  #define HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS		0x202001
>  
> -#define HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER	0x1200001
>  #define HFI_PROPERTY_PARAM_VDEC_DPB_COUNTS		0x120300e
>  #define HFI_PROPERTY_CONFIG_VDEC_ENTROPY		0x1204004
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index ac76d9e1ef9c..1dab276431c7 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -89,7 +89,7 @@ enum platform_inst_fw_cap_type {
>  	CODED_FRAMES,
>  	BIT_DEPTH,
>  	RAP_FRAME,
> -	DEBLOCK,
> +	TIER,
>  	INST_FW_CAP_MAX,
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 5c86fd7b7b6f..543fa2661539 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -30,15 +30,6 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250[] = {
>  		.hfi_id = HFI_PROPERTY_PARAM_WORK_MODE,
>  		.set = iris_set_stage,
>  	},
> -	{
> -		.cap_id = DEBLOCK,
> -		.min = 0,
> -		.max = 1,
> -		.step_or_mask = 1,
> -		.value = 0,
> -		.hfi_id = HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER,
> -		.set = iris_set_u32,
> -	},
>  };
>  
>  static struct platform_inst_caps platform_inst_cap_sm8250 = {
> 
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>

