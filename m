Return-Path: <linux-media+bounces-16267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B49C951387
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 06:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE23A1C22E22
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 04:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4275E4D8AF;
	Wed, 14 Aug 2024 04:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QjRwiBYY"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE10422309
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 04:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723610324; cv=none; b=bhZl8xmCyZV4aXoZQgE30077yY6sTs8lR+y0VcexPNL9kCL184xaUHi9pSSEoRSYuU/vaxQtItFAj64QIceBsAoHji7OxBfhoqLbwsPezr4T++iBJvOHQPv70CUCWb/mkZfkjBlTpbakbxTOFehWQWSWb0uI7SG2cum3be/MRQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723610324; c=relaxed/simple;
	bh=R4JEl1PkgnWMF/mXJUuQ15lWVW/YvqaJyq9G1oZBV/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dmTKkbfWMwjVrPi85SP98LkAoqaAQSVDoCOF50eyk6afboxOh3i4o0yl9Cir7W5QbXWjqWj4XH7YrbuMsLfu9zOPVDoV76PM/LNWx5eLGmcTDEwFeY8AD74AncL3r0WjOWklOe97M6oIX7wMeCxyk3n5181gaLiiL0MG6M8kOMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QjRwiBYY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DNAuW2026876;
	Wed, 14 Aug 2024 04:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YS/n0rjiwSBYOabjsbgMuIPtMtspJA9tGzGyEWMsB9A=; b=QjRwiBYYJ0SzqjTv
	8YUCHUjGKte4H/EcmXPdu7kOltKgXEKAM3uAzToxgwqkHios9/HZDcSLp81T8DzB
	IUupnODySjGCRE5Z0diBtrcOoKwGHA6aYNy3iHhloyzmQCs4n000BjgKJcHYaGbI
	tPUekaZTC1i/oFpAfCQxfl3NeosfNqDx+9QResRIKLvY/dwEQU1M/7yaCSkEkHBA
	A3TgUtCB8KeP/4EgyLoKUEg5kpf/uo86naCnLFjV60CjKRjJ4YH3xc78P8FUeKlv
	n8+2e0t3z8LoFWaVPke9eCD7FZFYLvKZ3wl7px1GWgfjkRDEPLCSHG529ffpwAFP
	RUttVA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x18y20f1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 04:38:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47E4cNFW025654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 04:38:23 GMT
Received: from [10.216.59.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 Aug
 2024 21:38:21 -0700
Message-ID: <75c4f50f-2cc0-1893-3765-68e5a479684c@quicinc.com>
Date: Wed, 14 Aug 2024 10:08:18 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/3] media: venus: Reorder encoder property setting
Content-Language: en-US
To: Fritz Koenig <frkoenig@chromium.org>, <linux-media@vger.kernel.org>
CC: <mchehab@kernel.org>, <stanimir.k.varbanov@gmail.com>,
        <quic_vgarodia@quicinc.com>, <bryan.odonoghue@linaro.org>
References: <20240729193219.1260463-1-frkoenig@chromium.org>
 <20240729193219.1260463-2-frkoenig@chromium.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20240729193219.1260463-2-frkoenig@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2LBphh-y_J3AGk8YHfXqws5I54mY_AW0
X-Proofpoint-ORIG-GUID: 2LBphh-y_J3AGk8YHfXqws5I54mY_AW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_03,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=847
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140029



On 7/30/2024 12:49 AM, Fritz Koenig wrote:
> Configure the generic controls before the codec specific ones.
> Some codec specific controls can override the generic ones.
> 
> Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
> ---
> v2:
> - requested testing methodology added to cover letter
> 
>  drivers/media/platform/qcom/venus/venc.c | 183 +++++++++++------------
>  1 file changed, 91 insertions(+), 92 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 3ec2fb8d9fab..ae24de125c56 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -688,98 +688,6 @@ static int venc_set_properties(struct venus_inst *inst)
>  	if (ret)
>  		return ret;
>  
> -	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264) {
> -		struct hfi_h264_vui_timing_info info;
> -		struct hfi_h264_entropy_control entropy;
> -		struct hfi_h264_db_control deblock;
> -		struct hfi_h264_8x8_transform h264_transform;
> -
> -		ptype = HFI_PROPERTY_PARAM_VENC_H264_VUI_TIMING_INFO;
> -		info.enable = 1;
> -		info.fixed_framerate = 1;
> -		info.time_scale = NSEC_PER_SEC;
> -
> -		ret = hfi_session_set_property(inst, ptype, &info);
> -		if (ret)
> -			return ret;
> -
> -		ptype = HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL;
> -		entropy.entropy_mode = venc_v4l2_to_hfi(
> -					  V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE,
> -					  ctr->h264_entropy_mode);
> -		entropy.cabac_model = HFI_H264_CABAC_MODEL_0;
> -
> -		ret = hfi_session_set_property(inst, ptype, &entropy);
> -		if (ret)
> -			return ret;
> -
> -		ptype = HFI_PROPERTY_PARAM_VENC_H264_DEBLOCK_CONTROL;
> -		deblock.mode = venc_v4l2_to_hfi(
> -				      V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE,
> -				      ctr->h264_loop_filter_mode);
> -		deblock.slice_alpha_offset = ctr->h264_loop_filter_alpha;
> -		deblock.slice_beta_offset = ctr->h264_loop_filter_beta;
> -
> -		ret = hfi_session_set_property(inst, ptype, &deblock);
> -		if (ret)
> -			return ret;
> -
> -		ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
> -		h264_transform.enable_type = 0;
> -		if (ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
> -		    ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
> -			h264_transform.enable_type = ctr->h264_8x8_transform;
> -
> -		ret = hfi_session_set_property(inst, ptype, &h264_transform);
> -		if (ret)
> -			return ret;
> -
> -	}
> -
> -	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
> -	    inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
> -		/* IDR periodicity, n:
> -		 * n = 0 - only the first I-frame is IDR frame
> -		 * n = 1 - all I-frames will be IDR frames
> -		 * n > 1 - every n-th I-frame will be IDR frame
> -		 */
> -		ptype = HFI_PROPERTY_CONFIG_VENC_IDR_PERIOD;
> -		idrp.idr_period = 0;
> -		ret = hfi_session_set_property(inst, ptype, &idrp);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC &&
> -	    ctr->profile.hevc == V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10) {
> -		struct hfi_hdr10_pq_sei hdr10;
> -		unsigned int c;
> -
> -		ptype = HFI_PROPERTY_PARAM_VENC_HDR10_PQ_SEI;
> -
> -		for (c = 0; c < 3; c++) {
> -			hdr10.mastering.display_primaries_x[c] =
> -				ctr->mastering.display_primaries_x[c];
> -			hdr10.mastering.display_primaries_y[c] =
> -				ctr->mastering.display_primaries_y[c];
> -		}
> -
> -		hdr10.mastering.white_point_x = ctr->mastering.white_point_x;
> -		hdr10.mastering.white_point_y = ctr->mastering.white_point_y;
> -		hdr10.mastering.max_display_mastering_luminance =
> -			ctr->mastering.max_display_mastering_luminance;
> -		hdr10.mastering.min_display_mastering_luminance =
> -			ctr->mastering.min_display_mastering_luminance;
> -
> -		hdr10.cll.max_content_light = ctr->cll.max_content_light_level;
> -		hdr10.cll.max_pic_average_light =
> -			ctr->cll.max_pic_average_light_level;
> -
> -		ret = hfi_session_set_property(inst, ptype, &hdr10);
> -		if (ret)
> -			return ret;
> -	}
> -
>  	if (ctr->num_b_frames) {
>  		u32 max_num_b_frames = NUM_B_FRAMES_MAX;
>  
> @@ -922,6 +830,97 @@ static int venc_set_properties(struct venus_inst *inst)
>  	if (ret)
>  		return ret;
>  
> +	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264) {
> +		struct hfi_h264_vui_timing_info info;
> +		struct hfi_h264_entropy_control entropy;
> +		struct hfi_h264_db_control deblock;
> +		struct hfi_h264_8x8_transform h264_transform;
> +
> +		ptype = HFI_PROPERTY_PARAM_VENC_H264_VUI_TIMING_INFO;
> +		info.enable = 1;
> +		info.fixed_framerate = 1;
> +		info.time_scale = NSEC_PER_SEC;
> +
> +		ret = hfi_session_set_property(inst, ptype, &info);
> +		if (ret)
> +			return ret;
> +
> +		ptype = HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL;
> +		entropy.entropy_mode = venc_v4l2_to_hfi(
> +					  V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE,
> +					  ctr->h264_entropy_mode);
> +		entropy.cabac_model = HFI_H264_CABAC_MODEL_0;
> +
> +		ret = hfi_session_set_property(inst, ptype, &entropy);
> +		if (ret)
> +			return ret;
> +
> +		ptype = HFI_PROPERTY_PARAM_VENC_H264_DEBLOCK_CONTROL;
> +		deblock.mode = venc_v4l2_to_hfi(
> +				      V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE,
> +				      ctr->h264_loop_filter_mode);
> +		deblock.slice_alpha_offset = ctr->h264_loop_filter_alpha;
> +		deblock.slice_beta_offset = ctr->h264_loop_filter_beta;
> +
> +		ret = hfi_session_set_property(inst, ptype, &deblock);
> +		if (ret)
> +			return ret;
> +
> +		ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
> +		h264_transform.enable_type = 0;
> +		if (ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
> +		    ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
> +			h264_transform.enable_type = ctr->h264_8x8_transform;
> +
> +		ret = hfi_session_set_property(inst, ptype, &h264_transform);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
> +	    inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
> +		/* IDR periodicity, n:
> +		 * n = 0 - only the first I-frame is IDR frame
> +		 * n = 1 - all I-frames will be IDR frames
> +		 * n > 1 - every n-th I-frame will be IDR frame
> +		 */
> +		ptype = HFI_PROPERTY_CONFIG_VENC_IDR_PERIOD;
> +		idrp.idr_period = 0;
> +		ret = hfi_session_set_property(inst, ptype, &idrp);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC &&
> +	    ctr->profile.hevc == V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10) {
> +		struct hfi_hdr10_pq_sei hdr10;
> +		unsigned int c;
> +
> +		ptype = HFI_PROPERTY_PARAM_VENC_HDR10_PQ_SEI;
> +
> +		for (c = 0; c < 3; c++) {
> +			hdr10.mastering.display_primaries_x[c] =
> +				ctr->mastering.display_primaries_x[c];
> +			hdr10.mastering.display_primaries_y[c] =
> +				ctr->mastering.display_primaries_y[c];
> +		}
> +
> +		hdr10.mastering.white_point_x = ctr->mastering.white_point_x;
> +		hdr10.mastering.white_point_y = ctr->mastering.white_point_y;
> +		hdr10.mastering.max_display_mastering_luminance =
> +			ctr->mastering.max_display_mastering_luminance;
> +		hdr10.mastering.min_display_mastering_luminance =
> +			ctr->mastering.min_display_mastering_luminance;
> +
> +		hdr10.cll.max_content_light = ctr->cll.max_content_light_level;
> +		hdr10.cll.max_pic_average_light =
> +			ctr->cll.max_pic_average_light_level;
> +
> +		ret = hfi_session_set_property(inst, ptype, &hdr10);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	switch (inst->hfi_codec) {
>  	case HFI_VIDEO_CODEC_H264:
>  		profile = ctr->profile.h264;

Changing the order might cause issue for other functionalities.

Also, Client should either set the commutative bitrate or layerwise
bitrate. So, if the motive behind this re-order is to not update the
commutative bitrate, then that is expected and this way there might not be
a need to change current order.

Thanks,
Dikshita

