Return-Path: <linux-media+bounces-40058-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E68AB29759
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 05:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C62CD189FE88
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 03:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98C625DD0B;
	Mon, 18 Aug 2025 03:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EqeF3Cj0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5865182B7;
	Mon, 18 Aug 2025 03:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755487569; cv=none; b=ZCaoQxKrAum/6db4YDn1kjklN7Tm2gluv7yE0J0PGS7DlIdAbzZPZ8nS3U27x6gX8W7lrtO7ZpYmLBfykG9VMDuMiY5L2JK/iuZV/SgaF+liYUgIQ8TyDEHov+bFKnGcInQq3gx92whKlLSu/W3CAUy3F/9fjwwXd1pdqt4rOrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755487569; c=relaxed/simple;
	bh=5+W173JhCbTXNL4lT9piF65qH6vnzMPj8+3jI10UZOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Bki0vRa8L6D6yAf1cyIkNvoadZdHfFY60ysbSXWoIbhUEKRKeNO5QzwYvoKSa1ZRxNMEwaT+Ylr9YRcM2KnaEDs8ORvspY6Chn6UN1seIJCi1pz0Ztf2EzL2u0C3mFasQrrJnb4q3l7cVqabW3SJm4x21gYa6WPbHQKgeB8Beo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EqeF3Cj0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HLnfqY031569;
	Mon, 18 Aug 2025 03:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ewcjEAhRytkBrTtY6UfpqHo9fyQGFXHE10ZWWVuzZTA=; b=EqeF3Cj09rBrgqQ6
	0YT5048zGs7x/v44cjEogt/IGLcCv3gBGpwsv4Jn9xEyU8OeP4lezIbC6eSmnf18
	O3Em/tPeXAM3mv5Fz64P1jUyxJPe7eJ65ItBCo3KqGEs73a5buIM6qhFoCB7JFhe
	a3qovvJE1BYbEw3fb11uR4sPHFyNi6BLBmC+k/2Jlo2443fk7a57aW/f76nfU4zD
	LHB68oehyhOc/pt5GVz+ihwVueQnGAHTq5r0hW5/SaiDmqq663AU6hZ3Ylv0hlfo
	M1IUAf2lSJLsmeb0CxImrZG1HhtHIiNvFt6/rvSUajcpEmIKuz86A3+sAKh+8I/0
	TeH/tg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5mb0uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 03:25:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57I3PtJ9020684
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 03:25:55 GMT
Received: from [10.50.13.61] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 17 Aug
 2025 20:25:50 -0700
Message-ID: <95ccec65-585b-bfa8-f568-30d18fc2d65f@quicinc.com>
Date: Mon, 18 Aug 2025 08:55:47 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 17/24] media: iris: Add support for G/S_SELECTION for
 encoder video device
Content-Language: en-US
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
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
 <35023387-c0f3-8c55-c6e5-8e3faad31c34@quicinc.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <35023387-c0f3-8c55-c6e5-8e3faad31c34@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a29d44 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=-WteZIhAH-_igiXbhuoA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: JuzX1xpfg4eL206OqqLKvDVFyqGudyyB
X-Proofpoint-GUID: JuzX1xpfg4eL206OqqLKvDVFyqGudyyB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfX8zbXpkEHizcA
 4pCtX/gEngav7KV79kKU2K/4DR3/Rb0BRxaD+ctkcNc2/Z3UAIYI4BaPfqTGeORfkPdqOsNAj9p
 fa9+RV7qG990jhPGF7fQ/8UOi4XU2gLMwJ2/6y8EHU4w0DDoR7WoVAQLBUH3oJKqO5R0xc2cOVH
 uvr+uEv3FnMNwGdkS+6quWJGFUvsybHVlPnj8zXLGBsb0NZRzeqG4fu00LRKwRVbUdlv8d61Idm
 /US0HTnjzP6jxM/XfVAZ/H2BKHC/EYA4oD4KiQJxrY1GCQ1o0fWNdKpdKTlaHDftylyZFRTD57Z
 4Q/3BHodiuq5Lg6Cxx2+i1w/yvdqNAa/9MhohZOPTVBlvn9LgEbeSrAyYOEhcTuJAAS2AdSz6rz
 D75Y3plX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042



On 8/14/2025 8:24 PM, Vikash Garodia wrote:
> 
> 
> On 8/13/2025 3:08 PM, Dikshita Agarwal wrote:
>> Add support for G/S_SELECTION V4L2 ioctls for the encoder video
>> device with necessary hooks. This allows userspace to query and
>> configure rectangular selection areas such as crop.
>>
>> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_venc.c | 28 ++++++++++++
>>  drivers/media/platform/qcom/iris/iris_venc.h |  1 +
>>  drivers/media/platform/qcom/iris/iris_vidc.c | 65 ++++++++++++++++++++++------
>>  3 files changed, 80 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
>> index 3dbcce23cbe94cf0edc4421694a3ba11faa5eb96..930f5afe9489d01be193f1dbe429d33f5401b468 100644
>> --- a/drivers/media/platform/qcom/iris/iris_venc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
>> @@ -297,3 +297,31 @@ int iris_venc_subscribe_event(struct iris_inst *inst,
>>  		return -EINVAL;
>>  	}
>>  }
>> +
>> +int iris_venc_s_selection(struct iris_inst *inst, struct v4l2_selection *s)
>> +{
>> +	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
>> +		return -EINVAL;
>> +
>> +	switch (s->target) {
>> +	case V4L2_SEL_TGT_CROP:
>> +		s->r.left = 0;
>> +		s->r.top = 0;
>> +
>> +		if (s->r.width > inst->fmt_src->fmt.pix_mp.width ||
>> +		    s->r.height > inst->fmt_src->fmt.pix_mp.height)
>> +			return -EINVAL;
>> +
>> +		inst->crop.left = s->r.left;
>> +		inst->crop.top = s->r.top;
>> +		inst->crop.width = s->r.width;
>> +		inst->crop.height = s->r.height;
>> +		inst->fmt_dst->fmt.pix_mp.width = inst->crop.width;
>> +		inst->fmt_dst->fmt.pix_mp.height = inst->crop.height;
>> +		return iris_venc_s_fmt_output(inst, inst->fmt_dst);
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
> 
> Why do you need a return here ?

We actually don't, it should be safe to remove this, will fix.

Thanks,
Dikshita
> 
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
>> index 2d9614ae18e8a2318df6673fbeae5ee33c99b596..72c6e25d87113baa6d2219ae478b7d7df1aed7bf 100644
>> --- a/drivers/media/platform/qcom/iris/iris_venc.h
>> +++ b/drivers/media/platform/qcom/iris/iris_venc.h
>> @@ -15,5 +15,6 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
>>  int iris_venc_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
>>  int iris_venc_validate_format(struct iris_inst *inst, u32 pixelformat);
>>  int iris_venc_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
>> +int iris_venc_s_selection(struct iris_inst *inst, struct v4l2_selection *s);
>>  
>>  #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index d8c94074153e9b1ceac4f911210ddbf89bbe3533..2074682a35fd1c4c9f5d29fdaee3392d98bf8923 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -462,29 +462,64 @@ static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *
>>  {
>>  	struct iris_inst *inst = iris_get_inst(filp, NULL);
>>  
>> -	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>> +	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
>> +	    inst->domain == DECODER)
>>  		return -EINVAL;
>>  
>> -	switch (s->target) {
>> -	case V4L2_SEL_TGT_CROP_BOUNDS:
>> -	case V4L2_SEL_TGT_CROP_DEFAULT:
>> -	case V4L2_SEL_TGT_CROP:
>> -	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
>> -	case V4L2_SEL_TGT_COMPOSE_PADDED:
>> -	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
>> -	case V4L2_SEL_TGT_COMPOSE:
>> +	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
>> +	    inst->domain == ENCODER)
>> +		return -EINVAL;
>> +
>> +	if (inst->domain == DECODER) {
>> +		switch (s->target) {
>> +		case V4L2_SEL_TGT_CROP_BOUNDS:
>> +		case V4L2_SEL_TGT_CROP_DEFAULT:
>> +		case V4L2_SEL_TGT_CROP:
>> +		case V4L2_SEL_TGT_COMPOSE_BOUNDS:
>> +		case V4L2_SEL_TGT_COMPOSE_PADDED:
>> +		case V4L2_SEL_TGT_COMPOSE_DEFAULT:
>> +		case V4L2_SEL_TGT_COMPOSE:
>> +			s->r.left = inst->crop.left;
>> +			s->r.top = inst->crop.top;
>> +			s->r.width = inst->crop.width;
>> +			s->r.height = inst->crop.height;
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +	} else if (inst->domain == ENCODER) {
>> +		switch (s->target) {
>> +		case V4L2_SEL_TGT_CROP_BOUNDS:
>> +		case V4L2_SEL_TGT_CROP_DEFAULT:
>> +			s->r.width = inst->fmt_src->fmt.pix_mp.width;
>> +			s->r.height = inst->fmt_src->fmt.pix_mp.height;
>> +			break;
>> +		case V4L2_SEL_TGT_CROP:
>> +			s->r.width = inst->crop.width;
>> +			s->r.height = inst->crop.height;
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>>  		s->r.left = inst->crop.left;
>>  		s->r.top = inst->crop.top;
>> -		s->r.width = inst->crop.width;
>> -		s->r.height = inst->crop.height;
>> -		break;
>> -	default:
>> -		return -EINVAL;
>>  	}
>>  
>>  	return 0;
>>  }
>>  
>> +static int iris_s_selection(struct file *filp, void *fh, struct v4l2_selection *s)
>> +{
>> +	struct iris_inst *inst = iris_get_inst(filp, NULL);
> 
> s->r.left and s->r.top are signed and can be negative. Need to range bound
> within 0 to src dimension ?
> 
>> +
>> +	if (inst->domain == DECODER)
>> +		return -EINVAL;
>> +	else if (inst->domain == ENCODER)
>> +		return iris_venc_s_selection(inst, s);
>> +
>> +	return -EINVAL;
>> +}
>> +
>>  static int iris_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subscription *sub)
>>  {
>>  	struct iris_inst *inst = container_of(fh, struct iris_inst, fh);
>> @@ -591,6 +626,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops_enc = {
>>  	.vidioc_querycap                = iris_querycap,
>>  	.vidioc_subscribe_event         = iris_subscribe_event,
>>  	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
>> +	.vidioc_g_selection             = iris_g_selection,
>> +	.vidioc_s_selection             = iris_s_selection,
>>  };
>>  
>>  void iris_init_ops(struct iris_core *core)
>>

