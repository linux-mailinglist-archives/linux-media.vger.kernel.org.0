Return-Path: <linux-media+bounces-19815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F4D9A33F3
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 06:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F25F1C23252
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 04:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2781178378;
	Fri, 18 Oct 2024 04:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Jw+UKwcX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8522F20E318;
	Fri, 18 Oct 2024 04:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729227043; cv=none; b=nR6h3qstvuLPL0OGKoi4sKwkZaX4Mbfa9AAmwsTq5WyrgOWVCIurphmpvRQqARv7e01RK6KlmywuNO/gV7jukK7TwCzikQQFc/MlV+t9ErZVAH/hPOBo+D4sgDtQtNpTl0rE4DMM+vlHS3CJp/lf4B+MWGmWLWyG7hAb7hVTRKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729227043; c=relaxed/simple;
	bh=eaHPbI7g4aSBSRQ96cqeeHKuGoBXDnyJ5apGPHc+RgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VYXF7WaK+0hoxaxDdZfJFPsh2fFyZWR7qENmUbhThrrMo0ivelbyrZeMIWkJThm4f8StOeX+YuSn24F8Ph5wM6jb+n+dovvhzJLjF1QEwsafgb3azgExMBvXYtRGBf6nvQOBW1PugJ+vPwdyBcRbDM8bu+UjB/TeifmTjMHLsv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Jw+UKwcX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HJRY8v005824;
	Fri, 18 Oct 2024 04:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	we7y11+QixY85jSvNljU0jBgiVHuLh5lKVReazvSvPY=; b=Jw+UKwcXtQL5HfCB
	115oifT8Ze809BGro+wptLLNkoTpI4u8FqR83nurhI+GhlhVDi7na+acDS84CmVH
	Nks2bk7dkoxBUsEJzEZunes9FE8jTFmgDUPrmbaedA6GzvtR6UN4orCFndjLOm5A
	Zg6pskeFlBsBemNICMabxJfWMD6rbINTM65W3KhvH4oYK/jyuq8CZijY1HUI4c+H
	4T0899sjFc6WWG4mQfdlRKTBH7eCDIqI0qhGpYtglIH4mh/khNL1IlVs4c8FvPc9
	psDTUkTS8+nDbHKo1iZBLJNmLpUat1HySzrFgpDF1pJ6BPWPqXyRR9Ek6USOpvll
	7VseZQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b8rr12dy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 04:50:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49I4oZFD031676
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 04:50:35 GMT
Received: from [10.216.18.242] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 21:50:31 -0700
Message-ID: <4df51974-54b4-27a4-d2d7-7fcc0621a264@quicinc.com>
Date: Fri, 18 Oct 2024 10:20:28 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/2] media: venus: Helper function for dynamically
 updating bitrate
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
 <20241017-submit-v4-1-d852bc7f7fdc@chromium.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20241017-submit-v4-1-d852bc7f7fdc@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IX57Ds2ztVfzKa_aYWG45kVodtBeTy8q
X-Proofpoint-ORIG-GUID: IX57Ds2ztVfzKa_aYWG45kVodtBeTy8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=885 clxscore=1011
 mlxscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180027



On 10/18/2024 1:34 AM, Fritz Koenig wrote:
> Move the dynamic bitrate updating functionality to a separate function
> so that it can be shared.
> 
> No functionality changes.
> 
> Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/venc_ctrls.c | 34 +++++++++++++++-----------
>  1 file changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
> index d9d2a293f3ef..3e1f6f26eddf 100644
> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> @@ -67,12 +67,28 @@ static int venc_calc_bpframes(u32 gop_size, u32 conseq_b, u32 *bf, u32 *pf)
>  	return 0;
>  }
>  
> +static int dynamic_bitrate_update(struct venus_inst *inst, u32 bitrate,
> +				  u32 layer_id)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&inst->lock);
> +	if (inst->streamon_out && inst->streamon_cap) {
> +		u32 ptype = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE;
> +		struct hfi_bitrate brate = { .bitrate = bitrate, .layer_id = layer_id };
> +
> +		ret = hfi_session_set_property(inst, ptype, &brate);
> +	}
> +	mutex_unlock(&inst->lock);
> +
> +	return ret;
> +}
> +
>  static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct venus_inst *inst = ctrl_to_inst(ctrl);
>  	struct venc_controls *ctr = &inst->controls.enc;
>  	struct hfi_enable en = { .enable = 1 };
> -	struct hfi_bitrate brate;
>  	struct hfi_ltr_use ltr_use;
>  	struct hfi_ltr_mark ltr_mark;
>  	u32 bframes;
> @@ -85,19 +101,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	case V4L2_CID_MPEG_VIDEO_BITRATE:
>  		ctr->bitrate = ctrl->val;
> -		mutex_lock(&inst->lock);
> -		if (inst->streamon_out && inst->streamon_cap) {
> -			ptype = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE;
> -			brate.bitrate = ctr->bitrate;
> -			brate.layer_id = 0;
> -
> -			ret = hfi_session_set_property(inst, ptype, &brate);
> -			if (ret) {
> -				mutex_unlock(&inst->lock);
> -				return ret;
> -			}
> -		}
> -		mutex_unlock(&inst->lock);
> +		ret = dynamic_bitrate_update(inst, ctr->bitrate, 0);
> +		if (ret)
> +			return ret;
>  		break;
>  	case V4L2_CID_MPEG_VIDEO_BITRATE_PEAK:
>  		ctr->bitrate_peak = ctrl->val;
> 
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

