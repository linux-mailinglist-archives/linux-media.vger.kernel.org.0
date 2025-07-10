Return-Path: <linux-media+bounces-37274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0926AFFDEE
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 11:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEFBB188A864
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 09:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371C5292B49;
	Thu, 10 Jul 2025 09:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ESnPQ138"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC57121B9E7;
	Thu, 10 Jul 2025 09:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752139283; cv=none; b=sjn3ADviXFOjRtIrUpJGBh8YM1+0s8hcOvHt+LMleRmY2+9/GjQ0fRhA+2Ci6XfM7we0Z0VQaeWBDegfPlmgbbZ8tfxZp7xIv+1b1zg+191iEC325iO6i/Pe/Xxpy3STpgfymTKeMZdaPeZxNQ3TcjgU0i3DjCmL1l8HEYo4dKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752139283; c=relaxed/simple;
	bh=nDO4FCjIcpvN2V+UNsSZi+nZmpl//HrngwdQf7fGnqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZCuUMo/WSkNxqbrjjBSNN4cl80Ng+IMIMGlED5fB7zwUM0O7AwGGBr9BFvfuSBxWP2XPQajfXRsIyNeJFMvqH39xgOKAap5JuL9WfwSSqvQmEZNs9uIDqUWVwKLvy2gsDiuCzHTAMt+S4vBncvyDI6qCY+0v572bBInZpN8sSj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ESnPQ138; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A1QXr0031076;
	Thu, 10 Jul 2025 09:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QbwxA+Zbt6DBDA5wCJwhTDJ7c20lDYAcBdDw52mlG98=; b=ESnPQ138J0A6FKNo
	Vohg9FIG+Vb9xaGcrj0ZG0x2yGmxGSpX1XRYip41OcoKJH75PkRD0PJFgD7kBBM4
	tZifHlfrYnzu83UR0sK0YAIS7DbjSG5KO2Nl8Qp0wdHpRMv0irpuddrUGYHJFMf5
	88rXPwg0qwtstD4jJHDhXaHukWV0XNieYc5O1XSD3DL1aaWORK6e5m1SPvRlZxnT
	q8D5YvJl/rVSxX/nj6V5ouf9odqd7UexfzGofJUSAkPAKi89HD4LrjxnCJTJsrPz
	FqkMk2BBpuhTD5XKF200kmDu64Hp88ehJL64lB4N+yjlOif9k+nMoVhuXDsHlx+5
	IJdY7g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg4bh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 09:21:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56A9LH0x002983
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 09:21:17 GMT
Received: from [10.204.100.36] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 10 Jul
 2025 02:21:13 -0700
Message-ID: <7d50318e-1189-15aa-8c26-9c522c3194c4@quicinc.com>
Date: Thu, 10 Jul 2025 14:51:08 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 4/7] media: venus: hfi_plat_v4: Add capabilities for
 the 4XX lite core
Content-Language: en-US
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        <bryan.odonoghue@linaro.org>, <quic_vgarodia@quicinc.com>,
        <krzk+dt@kernel.org>, <konradybcio@kernel.org>, <mchehab@kernel.org>,
        <robh@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <amit.kucheria@oss.qualcomm.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250708180530.1384330-1-jorge.ramirez@oss.qualcomm.com>
 <20250708180530.1384330-5-jorge.ramirez@oss.qualcomm.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250708180530.1384330-5-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=686f860e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8
 a=8_8YVVxbfvZV4YOWEbQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: vexuhuUL-H5dpGBA0l4Ei3HPb4EizI9-
X-Proofpoint-GUID: vexuhuUL-H5dpGBA0l4Ei3HPb4EizI9-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfXzR1ug89XCMSu
 hpLAgBmOvLSVCbRaPko1pCuTbzkuhBaen2pIahc7VO/SSMEBS6cWprGAq0L67aMGsZwabf5JclU
 iMQcdIlvAUqX19+BDjU1cM6wQrXRjwmPsnns0UoQjk9W/p7i9QOFWI1snXZkNTnSMg6e4BK/QKL
 NlXCf0IkeMqaiTbxPmj6oHDsiEXJbcXqVYzuEOHVqIN1+j78vaAMgh6sp34lPTLxKz8Ew6hko++
 tbFfVgmLndwuvr1NeswmeONwixE0uP72oxSeEgMVC1LRhsUHdiq3JZfYzihPW8/wH05J2L4v115
 nt6+WpYrozX+KMa4QBeoiDqsvNQWuixDFLHHLnlG+NzmG00j+FuhrBVaNu6A3+tVCHhTrRPH4rB
 XblNqjvObXKFz2DHGkkj1yLnZnCJs1r+tLwvWX6zV0kyxEWL1lyGwyS0N4T3KU92tD5jiMPV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100079



On 7/8/2025 11:35 PM, Jorge Ramirez-Ortiz wrote:
> Populate the HFI v4 lite capability set used by the AR50_LITE video
> core.
> 
> These capabilities define the supported codec formats and operational
> limits specific to this streamlined VPU variant.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>  .../platform/qcom/venus/hfi_platform_v4.c     | 165 +++++++++++++++---
>  1 file changed, 145 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v4.c b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> index c8e0f8040649..4b7271468ec4 100644
> --- a/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> +++ b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
> @@ -245,25 +245,149 @@ static const struct hfi_plat_caps caps[] = {
>  	.num_fmts = 4,
>  } };
>  
> +static const struct hfi_plat_caps caps_lite[] = {
> +{
> +	.codec = HFI_VIDEO_CODEC_H264,
> +	.domain = VIDC_SESSION_TYPE_DEC,
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> +	.num_caps = 7,
> +	.pl[0] = { HFI_H264_PROFILE_BASELINE, HFI_H264_LEVEL_5},
> +	.pl[1] = {HFI_H264_PROFILE_MAIN, HFI_H264_LEVEL_5},
> +	.pl[2] = {HFI_H264_PROFILE_HIGH, HFI_H264_LEVEL_5},
> +	.pl[3] = {HFI_H264_PROFILE_CONSTRAINED_BASE, HFI_H264_LEVEL_5},
> +	.pl[4] = {HFI_H264_PROFILE_CONSTRAINED_HIGH, HFI_H264_LEVEL_5},
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
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> +	.num_caps = 7,
> +	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_HIGH0 << 28 },
> +	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_HIGH0 << 28 },
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
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
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
> +}, {
> +	.codec = HFI_VIDEO_CODEC_H264,
> +	.domain = VIDC_SESSION_TYPE_ENC,
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> +	.caps[7] = {HFI_CAPABILITY_HIER_P_NUM_ENH_LAYERS, 0, 6, 1},
> +	.caps[8] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 4, 1},
> +	.caps[9] = {HFI_CAPABILITY_MBS_PER_SECOND_POWERSAVE, 0, 244800, 1},
> +	.caps[10] = {HFI_CAPABILITY_I_FRAME_QP, 0, 51, 1},
> +	.caps[11] = {HFI_CAPABILITY_P_FRAME_QP, 0, 51, 1},
> +	.caps[12] = {HFI_CAPABILITY_B_FRAME_QP, 0, 51, 1},
> +	.caps[13] = {HFI_CAPABILITY_SLICE_BYTE, 1, 10, 1},
> +	.caps[14] = {HFI_CAPABILITY_SLICE_MB, 1, 10, 1},
> +	.num_caps = 15,
> +	.pl[0] = {HFI_H264_PROFILE_BASELINE, HFI_H264_LEVEL_5},
> +	.pl[1] = {HFI_H264_PROFILE_MAIN, HFI_H264_LEVEL_5},
> +	.pl[2] = {HFI_H264_PROFILE_HIGH, HFI_H264_LEVEL_5},
> +	.pl[3] = {HFI_H264_PROFILE_CONSTRAINED_BASE, HFI_H264_LEVEL_5},
> +	.pl[4] = {HFI_H264_PROFILE_CONSTRAINED_HIGH, HFI_H264_LEVEL_5},
> +	.num_pl = 5,
> +	.fmts[0] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12},
> +	.fmts[1] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12_UBWC},
> +	.fmts[2] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_YUV420_TP10_UBWC},
> +	.fmts[3] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_P010},
10 bit encoder is not supported on AR50 LITE.
> +	.num_fmts = 4,
> +}, {
> +	.codec = HFI_VIDEO_CODEC_HEVC,
> +	.domain = VIDC_SESSION_TYPE_ENC,
> +	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
> +	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
> +	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
> +	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 60000000, 1 },
> +	.caps[4] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 244800, 1},
> +	.caps[5] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
> +	.caps[6] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
> +	.caps[7] = {HFI_CAPABILITY_HIER_P_NUM_ENH_LAYERS, 0, 6, 1},
> +	.caps[8] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 4, 1},
> +	.caps[9] = {HFI_CAPABILITY_MBS_PER_SECOND_POWERSAVE, 0, 244800, 1},
> +	.caps[10] = {HFI_CAPABILITY_I_FRAME_QP, 0, 51, 1},
> +	.caps[11] = {HFI_CAPABILITY_P_FRAME_QP, 0, 51, 1},
> +	.caps[12] = {HFI_CAPABILITY_B_FRAME_QP, 0, 51, 1},
> +	.caps[13] = {HFI_CAPABILITY_SLICE_BYTE, 1, 10, 1},
> +	.caps[14] = {HFI_CAPABILITY_SLICE_MB, 1, 10, 1},
> +	.num_caps = 15,
> +	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_HIGH0},
> +	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_5 | HFI_HEVC_TIER_HIGH0},
> +	.num_pl = 2,
> +	.fmts[0] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12},
> +	.fmts[1] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12_UBWC},
> +	.fmts[2] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_YUV420_TP10_UBWC},
> +	.fmts[3] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_P010},
10 bit encoder is not supported on AR50 LITE.

Thanks,
Dikshita
> +	.num_fmts = 4,
> +} };
> +
>  static const struct hfi_plat_caps *get_capabilities(unsigned int *entries,
>  						    bool lite)
>  {
> -	WARN_ON(lite);
> +	*entries = lite ? ARRAY_SIZE(caps_lite) : ARRAY_SIZE(caps);
>  
> -	*entries = ARRAY_SIZE(caps);
> -	return caps;
> +	return lite ? caps_lite : caps;
>  }
>  
>  static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count, bool lite)
>  {
> -	WARN_ON(lite);
> -
> -	*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> -		      HFI_VIDEO_CODEC_VP8;
> -	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> -		      HFI_VIDEO_CODEC_VP8 | HFI_VIDEO_CODEC_VP9 |
> -		      HFI_VIDEO_CODEC_MPEG2;
> -	*count = 8;
> +	if (lite) {
> +		*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC;
> +		*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> +			      HFI_VIDEO_CODEC_VP9;
> +		*count = 5;
> +	} else {
> +		*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> +			      HFI_VIDEO_CODEC_VP8;
> +		*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
> +			      HFI_VIDEO_CODEC_VP8 | HFI_VIDEO_CODEC_VP9 |
> +			      HFI_VIDEO_CODEC_MPEG2;
> +		*count = 8;
> +	}
>  }
>  
>  static const struct hfi_platform_codec_freq_data codec_freq_data[] =  {
> @@ -277,14 +401,21 @@ static const struct hfi_platform_codec_freq_data codec_freq_data[] =  {
>  	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200, 10, 200 },
>  };
>  
> +static const struct hfi_platform_codec_freq_data codec_freq_data_lite[] = {
> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> +	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 440, 0, 440 },
> +	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 0, 675 },
> +	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 0, 675 },
> +};
> +
>  static const struct hfi_platform_codec_freq_data *
>  get_codec_freq_data(u32 session_type, u32 pixfmt, bool lite)
>  {
>  	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
>  	const struct hfi_platform_codec_freq_data *found = NULL;
> -	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
> -
> -	WARN_ON(lite);
> +	const struct hfi_platform_codec_freq_data *data = lite ?
> +					codec_freq_data_lite : codec_freq_data;
>  
>  	for (i = 0; i < data_size; i++) {
>  		if (data[i].pixfmt == pixfmt && data[i].session_type == session_type) {
> @@ -300,8 +431,6 @@ static unsigned long codec_vpp_freq(u32 session_type, u32 codec, bool lite)
>  {
>  	const struct hfi_platform_codec_freq_data *data;
>  
> -	WARN_ON(lite);
> -
>  	data = get_codec_freq_data(session_type, codec, lite);
>  	if (data)
>  		return data->vpp_freq;
> @@ -313,8 +442,6 @@ static unsigned long codec_vsp_freq(u32 session_type, u32 codec, bool lite)
>  {
>  	const struct hfi_platform_codec_freq_data *data;
>  
> -	WARN_ON(lite);
> -
>  	data = get_codec_freq_data(session_type, codec, lite);
>  	if (data)
>  		return data->vsp_freq;
> @@ -326,8 +453,6 @@ static unsigned long codec_lp_freq(u32 session_type, u32 codec, bool lite)
>  {
>  	const struct hfi_platform_codec_freq_data *data;
>  
> -	WARN_ON(lite);
> -
>  	data = get_codec_freq_data(session_type, codec, lite);
>  	if (data)
>  		return data->low_power_freq;

