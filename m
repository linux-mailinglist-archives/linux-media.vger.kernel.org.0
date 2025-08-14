Return-Path: <linux-media+bounces-39929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A14B26A10
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 16:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85D3C1C240D6
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 14:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8A7202C46;
	Thu, 14 Aug 2025 14:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Npoa2phO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D2B1E7C34;
	Thu, 14 Aug 2025 14:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755182899; cv=none; b=gZiBsH7OE7L2HxbKZNAJqFFDxhl0N9ZDjjXZ+SQ2wH/UwuqCusNpk4ATr//nn0Otw5qnLd5P+W98T1lfBNkxO0MNrSJGRJ3GlKadQM878UO0R60rSxgiz4GdXutGH6hgRag9oD7wsewp3ScDdyO6Mumll+rHoA3UmZVd8v4D0aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755182899; c=relaxed/simple;
	bh=fSLYqDrhybADUWOe8jN5vk/IpeDkZ42ZBPCrB2xI9jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DcLg/A+/ORHaoCdcRJbb6/EJ3Tj7m0sV5Jdit7MhTOJV1Nb0JoBFAcFMSpKC9Yz8bzksu/V1HMl/2nJC7Chs+wcGBA/JqcFwVdKR0t5nsWdA3jigI2TQ1OGe4V974yxkCWhBJhk2zMSTZsGLIbkFllMHMvB4CW19A0VQpMQHuz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Npoa2phO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E8xFQj020600;
	Thu, 14 Aug 2025 14:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Ny+AWPUKduzjCmpwnerRHIkgglqnNVxjkNXEiMQJB0=; b=Npoa2phOg4OeNW/l
	pEIZ0po9Q5yNF++QuhtY835PRe1I0cAQ6vxaVrBm2mx0hxNSZAJabbrK7xrdgzAl
	NwkSHIvjXF7DEny/+p1t7PexGUDXicLYHut6Oul0D21Lk4HnUidMHFj9AjYSpkVV
	jXwnNCQKa8SEqyX9Ct6NHj4X0tNLIxAHLiIh8fEUIW1mOoNA64DBbK2MfORIeFsN
	gkemL8qLWx2g3dR1I7uwM6xf4Avz2NCOtP55Ot4pvn6gR0ocWfP11Y2JqbdICxYu
	27Ia8Q5XIFqrdYqV7dMo+fvOKdGUo12VNGBwzccJrdT5dUhovXPLPOIB+wpXpJtg
	p0xJ+A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmg1j1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 14:48:10 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57EEm9Hl020136
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 14:48:09 GMT
Received: from [10.216.25.245] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 14 Aug
 2025 07:48:04 -0700
Message-ID: <e6487752-ad63-d6f7-d84f-76ef71ebe5f4@quicinc.com>
Date: Thu, 14 Aug 2025 20:18:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 16/24] media: iris: Add encoder support for V4L2 event
 subscription
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar
	<abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        "Vedang
 Nagar" <quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-16-c725ff673078@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250813-iris-video-encoder-v2-16-c725ff673078@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX6v0N5ykacYAx
 nqLj1Sj+A5Au3p3xNDZvW09XrENRiJcO9CtwDR1PPohExkiiYJlolb8XBio46M//NMMxixHnaF7
 qraHPnhKhMFQa7eGxzm/guGhymfAXAMdrN7Aku0+uWQV6GWj/pKhXiziuX5l3bFO3Bh6r+LsYoA
 5hMBuF7NwVtP31nViReMEwFOqClNkiVlY+eqEsCANnL0rv+XIJfC4XIgrit/6UKcCLu9M+FHVmu
 ixQA+ybtfHseqt9UiQNqyRB9lbN2tpjDtJe2aDNHyXNAfAbF4ayv3bcHSv5bXzEC4EghmYkhILK
 rVduF8TXoCDAXyufo+CkiFTJfAuBnZH1lTSsQ/ng19MxOMWSuMDK8fpjLyWsAQ18mtY+ManvB0Z
 UHehXLVv
X-Proofpoint-GUID: Uoi8HvhmVW_qJqUhN7TYDRdxA3CcJt0W
X-Proofpoint-ORIG-GUID: Uoi8HvhmVW_qJqUhN7TYDRdxA3CcJt0W
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689df72a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=7j80RUsS20YXm4lI7JYA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119


On 8/13/2025 3:08 PM, Dikshita Agarwal wrote:
> Implement support for V4L2 event subscription on the encoder device by
> handling the SUBSCRIBE_EVENT and UNSUBSCRIBE_EVENT ioctls with the
> necessary hooks.
> 
> This enables userspace applications to subscribe to V4L2 events,
> allowing asynchronous notification mechanisms.
> 
> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_venc.c | 14 ++++++++++++++
>  drivers/media/platform/qcom/iris/iris_venc.h |  1 +
>  drivers/media/platform/qcom/iris/iris_vidc.c |  9 ++++++++-
>  3 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 301206253090962abbb4e4eac8ee88e7b359c98d..3dbcce23cbe94cf0edc4421694a3ba11faa5eb96 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <media/v4l2-event.h>
>  #include <media/v4l2-mem2mem.h>
>  
>  #include "iris_buffer.h"
> @@ -283,3 +284,16 @@ int iris_venc_validate_format(struct iris_inst *inst, u32 pixelformat)
>  
>  	return 0;
>  }
> +
> +int iris_venc_subscribe_event(struct iris_inst *inst,
> +			      const struct v4l2_event_subscription *sub)
> +{
> +	switch (sub->type) {
> +	case V4L2_EVENT_EOS:
> +		return v4l2_event_subscribe(&inst->fh, sub, 0, NULL);
> +	case V4L2_EVENT_CTRL:
> +		return v4l2_ctrl_subscribe_event(&inst->fh, sub);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
> index 04fd41275547c40c359c6ea04dfe4ee31d2d0df6..2d9614ae18e8a2318df6673fbeae5ee33c99b596 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.h
> +++ b/drivers/media/platform/qcom/iris/iris_venc.h
> @@ -14,5 +14,6 @@ int iris_venc_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
>  int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
>  int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
>  int iris_venc_validate_format(struct iris_inst *inst, u32 pixelformat);
> +int iris_venc_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 458773a2ed7f5e16d5bd5e79dba2f5c029036505..d8c94074153e9b1ceac4f911210ddbf89bbe3533 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -489,7 +489,12 @@ static int iris_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subs
>  {
>  	struct iris_inst *inst = container_of(fh, struct iris_inst, fh);
>  
> -	return iris_vdec_subscribe_event(inst, sub);
> +	if (inst->domain == DECODER)
> +		return iris_vdec_subscribe_event(inst, sub);
> +	else if (inst->domain == ENCODER)
> +		return iris_venc_subscribe_event(inst, sub);
> +
> +	return -EINVAL;
>  }
>  
>  static int iris_dec_cmd(struct file *filp, void *fh,
> @@ -584,6 +589,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_enc = {
>  	.vidioc_enum_framesizes         = iris_enum_framesizes,
>  	.vidioc_enum_frameintervals     = iris_enum_frameintervals,
>  	.vidioc_querycap                = iris_querycap,
> +	.vidioc_subscribe_event         = iris_subscribe_event,
> +	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
>  };
>  
>  void iris_init_ops(struct iris_core *core)
> 

Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>

