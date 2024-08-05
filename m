Return-Path: <linux-media+bounces-15772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 017729479A1
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 12:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 249F51C20ED8
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 10:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA321537DE;
	Mon,  5 Aug 2024 10:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oivEDud9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32D21448D9
	for <linux-media@vger.kernel.org>; Mon,  5 Aug 2024 10:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722853389; cv=none; b=ja/R/3Cc+wJzJeaQ3gVBnm9sxlgnmKoj4RtLi7tYNPUPgE5cCWs1ZPk85zaf/yIadV6jnjqNNDkjwvnB5tEkCHaLBnmVmXFJLPe6FWhgUjLv/Vg6jWl56WTDT+jw5TUV6CaOqHlfJJzIEoiIctI8luEuAHqlu2OXwdT7DouVtuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722853389; c=relaxed/simple;
	bh=44BXCNvgbHRdvbyP54kjzWxc7gxCsS/s2+ShLcLJAtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iWRpvUquXvHOdnEgr866E9w2alArkwZuxEy7mueWSpockd3tZr0rF7YoteQi4aqCtI3JDWdPvBeRnJbb2hT1b32mFW7FZpop5h3UY9Ndh3KqXtPWX4GNiGftavSwcd29MmsCuE3SULqwt6Tu4HSFPo9K+84puWqfHkAqly1RGxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oivEDud9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4752VYU2000460;
	Mon, 5 Aug 2024 10:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Af9DtuEYX5mvtugODBqkJvvkrWe4FA3CYqPV9JmLMc=; b=oivEDud9LY9Xu/zf
	k0pefdTtffDTeOVolJT0Tx+LZYXF4UTz+b1be9Er4Bq6ea751l6gaBUdkxXh/+0B
	ZdlNIbsYNNVuK6XLnD/XZ6sk39DC5wCLU7m/QN4drnG2yKV733VpUme83KOqWJyH
	hbqrMUHLmJPZh/g235mGq32VcKZyQ6wGDu1ttR5Dlj1Mc9zdPEC8tIgoKzqMS6px
	FAozdHGs9gJhQkUQv+A5kSY3749AvT/bqQatj1OZV5XfaXzTswuNhAimM2+astgi
	SUhfYE7QeZNg/dlrSnHbq+M05ihuSja+v5oPbKNOfiYtG7MjRDTVmq6n2R7iX+Zp
	jJ7TsA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sbvgbm6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Aug 2024 10:23:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 475AN1SG016833
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 Aug 2024 10:23:01 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 Aug 2024
 03:22:58 -0700
Message-ID: <ac5cf884-adf6-0c39-f375-469964fa1b0e@quicinc.com>
Date: Mon, 5 Aug 2024 15:52:48 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/3] media: venus: Enable h.264 hierarchical coding
To: Fritz Koenig <frkoenig@chromium.org>, <linux-media@vger.kernel.org>
CC: <mchehab@kernel.org>, <stanimir.k.varbanov@gmail.com>,
        <quic_vgarodia@quicinc.com>, <bryan.odonoghue@linaro.org>
References: <20240729193219.1260463-1-frkoenig@chromium.org>
 <20240729193219.1260463-4-frkoenig@chromium.org>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20240729193219.1260463-4-frkoenig@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZtltPhOccMe2RFcs6SglW-LoYMfPE3p_
X-Proofpoint-ORIG-GUID: ZtltPhOccMe2RFcs6SglW-LoYMfPE3p_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-04_14,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=938 adultscore=0 malwarescore=0 clxscore=1011
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408050074



On 7/30/2024 12:49 AM, Fritz Koenig wrote:
> The series of V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING* controls
> provides the functionality for temporal layering. These controls allow
> for different framerates in a single stream.
> 
> HFI supports hierarchical P encoding and the ability to specify the
> bitrate for the different layers.
> 
> Connect the controls that V4L2 provides and HFI supports.
> 
> Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
> ---
> v2:
> - update commit message
> 
>  drivers/media/platform/qcom/venus/core.h      |  4 +
>  drivers/media/platform/qcom/venus/venc.c      | 24 ++++++
>  .../media/platform/qcom/venus/venc_ctrls.c    | 84 +++++++++++++++++++
>  3 files changed, 112 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 55202b89e1b9..fc9552311a71 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -274,6 +274,10 @@ struct venc_controls {
>  	s32 h264_loop_filter_beta;
>  	u32 h264_8x8_transform;
>  
> +	u32 h264_hier_enabled;
> +	u32 h264_hier_p_layers;
> +	u32 h264_hier_p_bitrate[6];
> +
>  	u32 hevc_i_qp;
>  	u32 hevc_p_qp;
>  	u32 hevc_b_qp;
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index ae24de125c56..301b0015b356 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -875,6 +875,30 @@ static int venc_set_properties(struct venus_inst *inst)
>  		ret = hfi_session_set_property(inst, ptype, &h264_transform);
>  		if (ret)
>  			return ret;
> +
> +		if (ctr->h264_hier_enabled) {
> +			unsigned int i;
> +
> +			ptype = HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER;
> +			ret = hfi_session_set_property(inst, ptype, &ctr->h264_hier_p_layers);
> +			if (ret)
> +				return ret;
> +
> +			ptype = HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER;
> +			ret = hfi_session_set_property(inst, ptype, &ctr->h264_hier_p_layers);
> +			if (ret)
> +				return ret;
> +
> +			for (i = 0; i < ctr->h264_hier_p_layers; ++i) {
> +				ptype = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE;
> +				brate.bitrate = ctr->h264_hier_p_bitrate[i];
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
> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
> index 6304cc97d37f..4cad8058339a 100644
> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> @@ -345,6 +345,52 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
>  
>  		ctr->h264_8x8_transform = ctrl->val;
>  		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE:
> +		if (ctrl->val != V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P)
> +			return -EINVAL;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING:
> +		ctr->h264_hier_enabled = ctrl->val;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER:
> +		ctr->h264_hier_p_layers = ctrl->val;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR:
> +		ctr->h264_hier_p_bitrate[0] = ctrl->val;
> +		ret = dynamic_bitrate_update(inst, ctr->h264_hier_p_bitrate[0], 0);
> +		if (ret)
> +			return ret;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR:
> +		ctr->h264_hier_p_bitrate[1] = ctrl->val;
> +		ret = dynamic_bitrate_update(inst, ctr->h264_hier_p_bitrate[1], 1);
> +		if (ret)
> +			return ret;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR:
> +		ctr->h264_hier_p_bitrate[2] = ctrl->val;
> +		ret = dynamic_bitrate_update(inst, ctr->h264_hier_p_bitrate[2], 2);
> +		if (ret)
> +			return ret;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR:
> +		ctr->h264_hier_p_bitrate[3] = ctrl->val;
> +		ret = dynamic_bitrate_update(inst, ctr->h264_hier_p_bitrate[3], 3);
> +		if (ret)
> +			return ret;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR:
> +		ctr->h264_hier_p_bitrate[4] = ctrl->val;
> +		ret = dynamic_bitrate_update(inst, ctr->h264_hier_p_bitrate[4], 4);
> +		if (ret)
> +			return ret;
> +		break;
> +	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR:
> +		ctr->h264_hier_p_bitrate[5] = ctrl->val;
> +		ret = dynamic_bitrate_update(inst, ctr->h264_hier_p_bitrate[5], 5);
> +		if (ret)
> +			return ret;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -627,6 +673,44 @@ int venc_ctrl_init(struct venus_inst *inst)
>  			  V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD, 0,
>  			  ((4096 * 2304) >> 8), 1, 0);
>  
> +	if (IS_V4(inst->core) || IS_V6(inst->core)) {
Hi Fritz,
is this change tested on any V6 device?

Thanks,
Dikshita
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
> +				  6, 1, 0);
> +
> +		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> +				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR, BITRATE_MIN, BITRATE_MAX,
> +				  BITRATE_STEP, BITRATE_DEFAULT);
> +
> +		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> +				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR, BITRATE_MIN, BITRATE_MAX,
> +				  BITRATE_STEP, BITRATE_DEFAULT);
> +
> +		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> +				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR, BITRATE_MIN, BITRATE_MAX,
> +				  BITRATE_STEP, BITRATE_DEFAULT);
> +
> +		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> +				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR, BITRATE_MIN, BITRATE_MAX,
> +				  BITRATE_STEP, BITRATE_DEFAULT);
> +
> +		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> +				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR, BITRATE_MIN, BITRATE_MAX,
> +				  BITRATE_STEP, BITRATE_DEFAULT);
> +
> +		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
> +				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR, BITRATE_MIN, BITRATE_MAX,
> +				  BITRATE_STEP, BITRATE_DEFAULT);
> +	}
> +
>  	ret = inst->ctrl_handler.error;
>  	if (ret)
>  		goto err;

