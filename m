Return-Path: <linux-media+bounces-19817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 299EC9A3407
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 07:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7EF61F240E7
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 05:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F73817B506;
	Fri, 18 Oct 2024 05:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TURpn72Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035121514C9;
	Fri, 18 Oct 2024 05:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729227712; cv=none; b=jfCc2STP3tnQPKIW6/GtAk1l02Pn5HeE0ZlR8CMjShZI7cjexe05DZVFOfSeZ2JJhZ0NgLKtv67nISHrPcs/sqksT21qEqbFlczr1U22WA/AGtIRUjXCuiEHxwH4X0MVQvV4xME4fbf0uoBTAwX8Py+1SPst/8Y/dr97ZoaESBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729227712; c=relaxed/simple;
	bh=BuJRpIo7LUfBnZMAtHdOtjML6ZsRipaOt5FmQ9Zj+Tk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rq94Td28qdce0qN69osuvBEJoQ0yoFZFyH68qK/b1Umi4u042Tsm7RCShP5lc4iH+o7bvYPAq7RRKm55XuVXM0lvzecIdGgiz5EAc4jCWgvt6GF9ud+y74IhFvH9B+kV973NdMj9wUQLixDExj9fd37E8WBB6teuu44IMr6PRCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TURpn72Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HG43vW002507;
	Fri, 18 Oct 2024 05:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UAhmzqRXlOJqZj77T6+bdRgyl2iGY4gtigC61eRZbkc=; b=TURpn72YCr/wAj93
	bQKBWADUeyG7HPNKHtlXb+Py+99zTUAcZtuggeRXN5soXjGl/vZ2ffoXChLncEnT
	yoA46XWwifZeezjjwZ22KLJzcy3NvqVEfHVmnWvN+oYGPYjz8bb6+H52MfacuzG8
	3NqjWFu8ngr+zcQ37kLSuFUCBoDGj1wayY6GIxbahsmhbPW4K1GPeF+bfokvfof9
	320YYE651alvl3KiEzKvyuvs9rjvfYzlV2MBHKZ7hI8iiEQwex/Cq7jmPNcuW/rV
	By8pyqpAraJ3DpU3c/JssOf0a/OmNy7qrMcgP6aK/+UfAMP7bHFB6KJmMV1BGcuL
	6Gpjgg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a5xyqc1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 05:01:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49I51h3m019411
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 05:01:43 GMT
Received: from [10.216.18.242] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 22:01:40 -0700
Message-ID: <a3726c78-a231-db51-9898-af64a5def68a@quicinc.com>
Date: Fri, 18 Oct 2024 10:31:37 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/2] media: venus: Enable h.264 hierarchical coding
Content-Language: en-US
To: Fritz Koenig <frkoenig@chromium.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Nathan Hebert <nhebert@chromium.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241017-submit-v4-0-d852bc7f7fdc@chromium.org>
 <20241017-submit-v4-2-d852bc7f7fdc@chromium.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20241017-submit-v4-2-d852bc7f7fdc@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7eK8PK8GQbD_r5-G4ndeeH7bsqMTWdC2
X-Proofpoint-ORIG-GUID: 7eK8PK8GQbD_r5-G4ndeeH7bsqMTWdC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180028



On 10/18/2024 1:34 AM, Fritz Koenig wrote:
> HFI supports hierarchical P encoding and the ability to specify the
> bitrate for the different layers.
> 
> Connect the controls that V4L2 provides and HFI supports.
> 
> Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/core.h       |  4 ++
>  drivers/media/platform/qcom/venus/venc.c       | 73 +++++++++++++-------
>  drivers/media/platform/qcom/venus/venc_ctrls.c | 92 ++++++++++++++++++++++++++
>  3 files changed, 145 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 55202b89e1b9..fd46a7778d8c 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -26,6 +26,7 @@
>  #define VIDC_CLKS_NUM_MAX		4
>  #define VIDC_VCODEC_CLKS_NUM_MAX	2
>  #define VIDC_RESETS_NUM_MAX		2
> +#define VIDC_MAX_HIER_CODING_LAYER 6
>  
>  extern int venus_fw_debug;
>  
> @@ -255,6 +256,7 @@ struct venc_controls {
>  	u32 rc_enable;
>  	u32 const_quality;
>  	u32 frame_skip_mode;
> +	u32 layer_bitrate;
>  
>  	u32 h264_i_period;
>  	u32 h264_entropy_mode;
> @@ -273,6 +275,8 @@ struct venc_controls {
>  	s32 h264_loop_filter_alpha;
>  	s32 h264_loop_filter_beta;
>  	u32 h264_8x8_transform;
> +	u32 h264_hier_layers;
> +	u32 h264_hier_layer_bitrate[VIDC_MAX_HIER_CODING_LAYER];
>  
>  	u32 hevc_i_qp;
>  	u32 hevc_p_qp;
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 3ec2fb8d9fab..d717e5dd6a39 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -734,6 +734,29 @@ static int venc_set_properties(struct venus_inst *inst)
>  		if (ret)
>  			return ret;
>  
> +		if (ctr->layer_bitrate) {
> +			unsigned int i;
> +
> +			ptype = HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER;
> +			ret = hfi_session_set_property(inst, ptype, &ctr->h264_hier_layers);
> +			if (ret)
> +				return ret;
> +
> +			ptype = HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER;
> +			ret = hfi_session_set_property(inst, ptype, &ctr->layer_bitrate);
> +			if (ret)
> +				return ret;
> +
> +			for (i = 0; i < ctr->h264_hier_layers; ++i) {
> +				ptype = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE;
> +				brate.bitrate = ctr->h264_hier_layer_bitrate[i];
> +				brate.layer_id = i;
> +
> +				ret = hfi_session_set_property(inst, ptype, &brate);
> +				if (ret)
> +					return ret;
> +			}
> +		}
>  	}
>  
>  	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
> @@ -823,21 +846,36 @@ static int venc_set_properties(struct venus_inst *inst)
>  			return ret;
>  	}
>  
> -	if (!ctr->bitrate)
> -		bitrate = 64000;
> -	else
> -		bitrate = ctr->bitrate;
> +	if (!ctr->layer_bitrate) {
> +		if (!ctr->bitrate)
> +			bitrate = 64000;
> +		else
> +			bitrate = ctr->bitrate;
>  
> -	ptype = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE;
> -	brate.bitrate = bitrate;
> -	brate.layer_id = 0;
> +		ptype = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE;
> +		brate.bitrate = bitrate;
> +		brate.layer_id = 0;
>  
> -	ret = hfi_session_set_property(inst, ptype, &brate);
> -	if (ret)
> -		return ret;
> +		ret = hfi_session_set_property(inst, ptype, &brate);
> +		if (ret)
> +			return ret;
> +
> +		if (!ctr->bitrate_peak)
> +			bitrate *= 2;
> +		else
> +			bitrate = ctr->bitrate_peak;
> +
> +		ptype = HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE;
> +		brate.bitrate = bitrate;
> +		brate.layer_id = 0;
> +
> +		ret = hfi_session_set_property(inst, ptype, &brate);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
> -	    inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
> +			inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
This is not needed, pls fix.
with above taken care.

Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

>  		ptype = HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER;
>  		if (ctr->header_mode == V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE)
>  			en.enable = 0;
> @@ -849,19 +887,6 @@ static int venc_set_properties(struct venus_inst *inst)
>  			return ret;
>  	}
>  
> -	if (!ctr->bitrate_peak)
> -		bitrate *= 2;
> -	else
> -		bitrate = ctr->bitrate_peak;
> -
> -	ptype = HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE;
> -	brate.bitrate = bitrate;
> -	brate.layer_id = 0;
> -
> -	ret = hfi_session_set_property(inst, ptype, &brate);
> -	if (ret)
> -		return ret;
> -
>  	ptype = HFI_PROPERTY_PARAM_VENC_SESSION_QP;
>  	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
>  		quant.qp_i = ctr->hevc_i_qp;
> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
> index 3e1f6f26eddf..e340783a4ef2 100644
> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> @@ -346,6 +346,55 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
>  
>  		ctr->h264_8x8_transform = ctrl->val;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE:
> +		if (ctrl->val != V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P)
> +			return -EINVAL;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING:
> +		ctr->layer_bitrate = ctrl->val;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER:
> +		if (ctrl->val > VIDC_MAX_HIER_CODING_LAYER)
> +			return -EINVAL;
> +		ctr->h264_hier_layers = ctrl->val;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR:
> +		ctr->h264_hier_layer_bitrate[0] = ctrl->val;
> +		ret = dynamic_bitrate_update(inst, ctr->h264_hier_layer_bitrate[0], 0);
> +		if (ret)
> +			return ret;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR:
> +		ctr->h264_hier_layer_bitrate[1] = ctrl->val;
> +		ret = dynamic_bitrate_update(inst, ctr->h264_hier_layer_bitrate[1], 1);
> +		if (ret)
> +			return ret;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR:
> +		ctr->h264_hier_layer_bitrate[2] = ctrl->val;
> +		ret = dynamic_bitrate_update(inst, ctr->h264_hier_layer_bitrate[2], 2);
> +		if (ret)
> +			return ret;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR:
> +		ctr->h264_hier_layer_bitrate[3] = ctrl->val;
> +		ret = dynamic_bitrate_update(inst, ctr->h264_hier_layer_bitrate[3], 3);
> +		if (ret)
> +			return ret;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR:
> +		ctr->h264_hier_layer_bitrate[4] = ctrl->val;
> +		ret = dynamic_bitrate_update(inst, ctr->h264_hier_layer_bitrate[4], 4);
> +		if (ret)
> +			return ret;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR:
> +		ctr->h264_hier_layer_bitrate[5] = ctrl->val;
> +		ret = dynamic_bitrate_update(inst, ctr->h264_hier_layer_bitrate[5], 5);
> +		if (ret)
> +			return ret;
> +		break;
> +
>  	default:
>  		return -EINVAL;
>  	}
> @@ -628,6 +677,49 @@ int venc_ctrl_init(struct venus_inst *inst)
>  			  V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD, 0,
>  			  ((4096 * 2304) >> 8), 1, 0);
>  
> +	if (IS_V4(inst->core) || IS_V6(inst->core)) {
> +		v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
> +				       V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE,
> +				       V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
> +				       1, V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P);
> +
> +		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> +				  V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING, 0, 1, 1, 0);
> +
> +		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> +				  V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER, 0,
> +				  VIDC_MAX_HIER_CODING_LAYER, 1, 0);
> +
> +		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> +				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR,
> +				  BITRATE_MIN, BITRATE_MAX, BITRATE_STEP, BITRATE_DEFAULT);
> +
> +		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> +				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR,
> +				  BITRATE_MIN, BITRATE_MAX,
> +				  BITRATE_STEP, BITRATE_DEFAULT);
> +
> +		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> +				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR,
> +				  BITRATE_MIN, BITRATE_MAX,
> +				  BITRATE_STEP, BITRATE_DEFAULT);
> +
> +		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> +				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR,
> +				  BITRATE_MIN, BITRATE_MAX,
> +				  BITRATE_STEP, BITRATE_DEFAULT);
> +
> +		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> +				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR,
> +				  BITRATE_MIN, BITRATE_MAX,
> +				  BITRATE_STEP, BITRATE_DEFAULT);
> +
> +		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> +				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR,
> +				  BITRATE_MIN, BITRATE_MAX,
> +				  BITRATE_STEP, BITRATE_DEFAULT);
> +	}
> +
>  	ret = inst->ctrl_handler.error;
>  	if (ret)
>  		goto err;
> 

