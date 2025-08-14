Return-Path: <linux-media+bounces-39930-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BCFB26A5F
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 17:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98C235865AB
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 14:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D3921B9D8;
	Thu, 14 Aug 2025 14:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k9kGeDTd"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4BD2040A8;
	Thu, 14 Aug 2025 14:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755183291; cv=none; b=ukipaxrEi+caFQLOFwLR4CNFSvxFctb63H1T2m4UnTaE80ruZ+gkfNhf4jQVYNEvSs11/1w7VCqaPqkcYTvAYb3gPRu4fUqh9CPJv4uK+X8Emnhqq56OgJ9rySy2nvN5NmH+xdME64sJVrbx+jVr92/y54JPzcJ9s79M/S9GCgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755183291; c=relaxed/simple;
	bh=T1MIb+QFNfrqBlkuPi1ds1bFf8B8Yu6cDArngytnzYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RgSTK5tuKh1xg1MD3kTiuzLm3cT/ab3hraELD20be2chOrjid8gNHrr+hbq00a+LWSHJL7iLVU9o18IBEzj8NJY9YOY63LDKQs9lJaskEFbjcPAW726Nk1gn44aI2k/ZSRmv4SykWlnpG8d99Ui9tssfvaXT1kMvYSa+eoep+UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k9kGeDTd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9RBHd011072;
	Thu, 14 Aug 2025 14:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zaix1i0VdpwvKc2SzWpdkY+gpspd6gDqgtySPVUXzxE=; b=k9kGeDTdJ7VUHo9M
	RMoMkAw/rsaauOd/svtvuayLnDLepp17DmF1zubCc61Ya3iVSMLxUaG9nbGjiMpk
	KsmInAvJi810XsbKmMr4rdFTSFmX5XHooAXPVjUWAxXiBKNd0JYk0uTvx4T1cEQC
	fz3Fc8m9Zcv0jaF43Q8tjin5s7yWJ4on/X9pxE5t5iTGF4Ue45VzZsHeAa8F4wcV
	7Pjv/gWmy91JMfRWKnrOlnbRZWwCn9QH2+q6GYARh93nUnoOQf3GCRbIuZwKup5a
	Q2ALP25cicql7EunTX84FHEA298JWLB7dXoVbit7agWE3+zHQFKdfy2c0uMVUnZo
	tZ3TGg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbk87a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 14:54:43 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57EEsg31003033
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 14:54:42 GMT
Received: from [10.216.25.245] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 14 Aug
 2025 07:54:38 -0700
Message-ID: <35023387-c0f3-8c55-c6e5-8e3faad31c34@quicinc.com>
Date: Thu, 14 Aug 2025 20:24:34 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 17/24] media: iris: Add support for G/S_SELECTION for
 encoder video device
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
 <20250813-iris-video-encoder-v2-17-c725ff673078@quicinc.com>
From: Vikash Garodia <quic_vgarodia@quicinc.com>
In-Reply-To: <20250813-iris-video-encoder-v2-17-c725ff673078@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689df8b3 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=_y5WQDK20XwvR4L1WIkA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfXx4MEok46U6YZ
 IqcdXVi3L60nCjzPcionYv1TW6svaWDmbTwbrqgIdhyvElVUlxFItLo4cpxrHzfbjbmvXOvMUkS
 wdcdEsLaRpdDDU1Emn08QSXyFlPUIeTYc2WPxHvWR5k5aiITjQsUt8O7fGzs2O1IXAVXw779AKB
 5gzrzhEEY+tCAq1N9vmAl/Acvdz6tSfsV2p5LEkjS33R8o3bsHdmoqiq/vcsR0hCmXmP7hHyYfx
 Rf0VV519tuzUGbFxd2yN2keBSkflJJhaMnth085n3C4YK4bCIl8ClD5eMQuQQo1X3t/gsyfMI7r
 Fx8mNXlM+pKRQ6C7Lx9Vi4LobP1OCSMUXXKzIw7VqftUkTZg1SdQte9VAwlE7eYPif/bWdWhdPZ
 bit60tRF
X-Proofpoint-ORIG-GUID: sXh5zGDFbsmqp3BYb_6bqj2lZQwKmqno
X-Proofpoint-GUID: sXh5zGDFbsmqp3BYb_6bqj2lZQwKmqno
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097



On 8/13/2025 3:08 PM, Dikshita Agarwal wrote:
> Add support for G/S_SELECTION V4L2 ioctls for the encoder video
> device with necessary hooks. This allows userspace to query and
> configure rectangular selection areas such as crop.
> 
> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_venc.c | 28 ++++++++++++
>  drivers/media/platform/qcom/iris/iris_venc.h |  1 +
>  drivers/media/platform/qcom/iris/iris_vidc.c | 65 ++++++++++++++++++++++------
>  3 files changed, 80 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 3dbcce23cbe94cf0edc4421694a3ba11faa5eb96..930f5afe9489d01be193f1dbe429d33f5401b468 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -297,3 +297,31 @@ int iris_venc_subscribe_event(struct iris_inst *inst,
>  		return -EINVAL;
>  	}
>  }
> +
> +int iris_venc_s_selection(struct iris_inst *inst, struct v4l2_selection *s)
> +{
> +	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
> +		return -EINVAL;
> +
> +	switch (s->target) {
> +	case V4L2_SEL_TGT_CROP:
> +		s->r.left = 0;
> +		s->r.top = 0;
> +
> +		if (s->r.width > inst->fmt_src->fmt.pix_mp.width ||
> +		    s->r.height > inst->fmt_src->fmt.pix_mp.height)
> +			return -EINVAL;
> +
> +		inst->crop.left = s->r.left;
> +		inst->crop.top = s->r.top;
> +		inst->crop.width = s->r.width;
> +		inst->crop.height = s->r.height;
> +		inst->fmt_dst->fmt.pix_mp.width = inst->crop.width;
> +		inst->fmt_dst->fmt.pix_mp.height = inst->crop.height;
> +		return iris_venc_s_fmt_output(inst, inst->fmt_dst);
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;

Why do you need a return here ?

> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
> index 2d9614ae18e8a2318df6673fbeae5ee33c99b596..72c6e25d87113baa6d2219ae478b7d7df1aed7bf 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.h
> +++ b/drivers/media/platform/qcom/iris/iris_venc.h
> @@ -15,5 +15,6 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
>  int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
>  int iris_venc_validate_format(struct iris_inst *inst, u32 pixelformat);
>  int iris_venc_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
> +int iris_venc_s_selection(struct iris_inst *inst, struct v4l2_selection *s);
>  
>  #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index d8c94074153e9b1ceac4f911210ddbf89bbe3533..2074682a35fd1c4c9f5d29fdaee3392d98bf8923 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -462,29 +462,64 @@ static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *
>  {
>  	struct iris_inst *inst = iris_get_inst(filp, NULL);
>  
> -	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
> +	    inst->domain == DECODER)
>  		return -EINVAL;
>  
> -	switch (s->target) {
> -	case V4L2_SEL_TGT_CROP_BOUNDS:
> -	case V4L2_SEL_TGT_CROP_DEFAULT:
> -	case V4L2_SEL_TGT_CROP:
> -	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> -	case V4L2_SEL_TGT_COMPOSE_PADDED:
> -	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> -	case V4L2_SEL_TGT_COMPOSE:
> +	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
> +	    inst->domain == ENCODER)
> +		return -EINVAL;
> +
> +	if (inst->domain == DECODER) {
> +		switch (s->target) {
> +		case V4L2_SEL_TGT_CROP_BOUNDS:
> +		case V4L2_SEL_TGT_CROP_DEFAULT:
> +		case V4L2_SEL_TGT_CROP:
> +		case V4L2_SEL_TGT_COMPOSE_BOUNDS:
> +		case V4L2_SEL_TGT_COMPOSE_PADDED:
> +		case V4L2_SEL_TGT_COMPOSE_DEFAULT:
> +		case V4L2_SEL_TGT_COMPOSE:
> +			s->r.left = inst->crop.left;
> +			s->r.top = inst->crop.top;
> +			s->r.width = inst->crop.width;
> +			s->r.height = inst->crop.height;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	} else if (inst->domain == ENCODER) {
> +		switch (s->target) {
> +		case V4L2_SEL_TGT_CROP_BOUNDS:
> +		case V4L2_SEL_TGT_CROP_DEFAULT:
> +			s->r.width = inst->fmt_src->fmt.pix_mp.width;
> +			s->r.height = inst->fmt_src->fmt.pix_mp.height;
> +			break;
> +		case V4L2_SEL_TGT_CROP:
> +			s->r.width = inst->crop.width;
> +			s->r.height = inst->crop.height;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
>  		s->r.left = inst->crop.left;
>  		s->r.top = inst->crop.top;
> -		s->r.width = inst->crop.width;
> -		s->r.height = inst->crop.height;
> -		break;
> -	default:
> -		return -EINVAL;
>  	}
>  
>  	return 0;
>  }
>  
> +static int iris_s_selection(struct file *filp, void *fh, struct v4l2_selection *s)
> +{
> +	struct iris_inst *inst = iris_get_inst(filp, NULL);

s->r.left and s->r.top are signed and can be negative. Need to range bound
within 0 to src dimension ?

> +
> +	if (inst->domain == DECODER)
> +		return -EINVAL;
> +	else if (inst->domain == ENCODER)
> +		return iris_venc_s_selection(inst, s);
> +
> +	return -EINVAL;
> +}
> +
>  static int iris_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subscription *sub)
>  {
>  	struct iris_inst *inst = container_of(fh, struct iris_inst, fh);
> @@ -591,6 +626,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_enc = {
>  	.vidioc_querycap                = iris_querycap,
>  	.vidioc_subscribe_event         = iris_subscribe_event,
>  	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
> +	.vidioc_g_selection             = iris_g_selection,
> +	.vidioc_s_selection             = iris_s_selection,
>  };
>  
>  void iris_init_ops(struct iris_core *core)
> 

