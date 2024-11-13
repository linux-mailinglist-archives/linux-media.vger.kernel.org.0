Return-Path: <linux-media+bounces-21349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A29FC9C68B3
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 06:27:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A1091F23F57
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 05:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E848D17624D;
	Wed, 13 Nov 2024 05:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cmuYTTP9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62D1230984;
	Wed, 13 Nov 2024 05:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731475651; cv=none; b=BTA5Irz3EFkWZrm3iGRvod01PSNjhcZZQV+EwtxAn16TxbGVuhbvc7uVLI1qHEXfjuHJp9bdWddthpojkxfTdRAHcyx4+94be4iT8eR3M+euutEry8gM6OCHB8OuHPE7SuO9QdJ0LheDA8D85uPbXyXRnNr0zk6+6Ty5DLSxMfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731475651; c=relaxed/simple;
	bh=yYfwbJx2csXYIDKRUf5MiyuUMWWth2Lkki4mABQrFwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JUSaG3Z84B/YRiWAMB7St/dlx4/eNExwYE1nYmGweliNaMrTGYPzejy8XtwnqO3DB9xU5LmrQMoGHPsG+xLWlMhpRog6MSbgvZRg7INlL5HPuw+x6yeAw889UwXZv1viApujs6jHW3PbWa0zGTc5raSXKgfi//4iuvtJt0qGra0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cmuYTTP9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMRqIx003799;
	Wed, 13 Nov 2024 05:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L7diDm3l1y4B4Bi3YvQdF3ovz5Rtn2aagLPOTX51xho=; b=cmuYTTP9kELjC3i0
	vSC21O8UZ1PAia9uBUspCRaSELhuj3zxq8it3Y6f+f3eT97XdZD8y7moe2vOGWWN
	M+2CijNw9o4PMzfZnikFIAPbqlEcN8bY2JYVuNQyIPMciObfP00QTnEmfpuemgXu
	RWuspNQwIKpAPZeH4ccZfejJLOoVn5U+APDgIMDQrmFPbFJOyixrU+2tGgwun6+e
	R9qGTHg7ba8/8mjx4P6T0Nu28Ho1zS/S6m4l+eoWiy4IkDs2d7AT/BLxwMkiWGpD
	r8N1vsY2t7oBu5uxBtFLfITPEnFG9zw8ytNOXq3yIbYkhdk17yVGxNRGEEOfvJUI
	dC4wHg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0gm1jkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 05:27:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD5RJ20015848
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 05:27:19 GMT
Received: from [10.50.46.32] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 21:27:12 -0800
Message-ID: <c8cb4441-66d5-c625-1b78-ffb251dc0a82@quicinc.com>
Date: Wed, 13 Nov 2024 10:57:08 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 12/28] media: iris: implement enum_fmt and
 enum_frameintervals ioctls
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: Sebastian Fricke <sebastian.fricke@collabora.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas@ndufresne.ca>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
	<u.kleine-koenig@baylibre.com>,
        Jianhua Lu <lujianhua000@gmail.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Vedang Nagar
	<quic_vnagar@quicinc.com>
References: <20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com>
 <20241105-qcom-video-iris-v5-12-a88e7c220f78@quicinc.com>
 <7dcf9ca0-4707-4641-905e-c5e1b0a8b7fd@xs4all.nl>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <7dcf9ca0-4707-4641-905e-c5e1b0a8b7fd@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JA6_-it67UIMhhiTOghJSEYNpLSVhZ9O
X-Proofpoint-GUID: JA6_-it67UIMhhiTOghJSEYNpLSVhZ9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130047



On 11/12/2024 3:53 PM, Hans Verkuil wrote:
> On 05/11/2024 07:55, Dikshita Agarwal wrote:
>> From: Vedang Nagar <quic_vnagar@quicinc.com>
>>
>> Implement enum_fmt and enum_frameintervals ioctls with necessary hooks.
> 
> There is a typo in this commit log and in the Subject: you implement framesizes,
> not frameintervals.
> 
> Please fix, since this is confusing.
> 
Oh, it was a miss.
Will fix in next version.

Thanks,
Dikshita
> Regards,
> 
> 	Hans
> 
>>
>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  .../platform/qcom/iris/iris_platform_common.h      |  4 +++
>>  .../platform/qcom/iris/iris_platform_sm8550.c      |  4 +++
>>  drivers/media/platform/qcom/iris/iris_vdec.c       | 17 ++++++++++
>>  drivers/media/platform/qcom/iris/iris_vdec.h       |  1 +
>>  drivers/media/platform/qcom/iris/iris_vidc.c       | 39 ++++++++++++++++++++++
>>  5 files changed, 65 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index e345667dfbf2..54a2d723797b 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -43,6 +43,10 @@ struct ubwc_config_data {
>>  };
>>  
>>  struct platform_inst_caps {
>> +	u32 min_frame_width;
>> +	u32 max_frame_width;
>> +	u32 min_frame_height;
>> +	u32 max_frame_height;
>>  	u32 max_mbpf;
>>  };
>>  struct iris_core_power {
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> index bc4769732aad..37c0130d7059 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>> @@ -11,6 +11,10 @@
>>  #define VIDEO_ARCH_LX 1
>>  
>>  static struct platform_inst_caps platform_inst_cap_sm8550 = {
>> +	.min_frame_width = 96,
>> +	.max_frame_width = 8192,
>> +	.min_frame_height = 96,
>> +	.max_frame_height = 8192,
>>  	.max_mbpf = (8192 * 4352) / 256,
>>  };
>>  
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index e807decdda2b..b2858c96e859 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -60,6 +60,23 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
>>  	kfree(inst->fmt_src);
>>  }
>>  
>> +int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
>> +{
>> +	switch (f->type) {
>> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> +		f->pixelformat = V4L2_PIX_FMT_H264;
>> +		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_DYN_RESOLUTION;
>> +		break;
>> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> +		f->pixelformat = V4L2_PIX_FMT_NV12;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
>>  {
>>  	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
>> index 4f2557d15ca2..eb8a1121ae92 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.h
>> @@ -10,6 +10,7 @@ struct iris_inst;
>>  
>>  void iris_vdec_inst_init(struct iris_inst *inst);
>>  void iris_vdec_inst_deinit(struct iris_inst *inst);
>> +int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
>>  int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
>>  int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
>>  
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index 6a32fd8d6123..bc77dfc2ba67 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -217,6 +217,16 @@ int iris_close(struct file *filp)
>>  	return 0;
>>  }
>>  
>> +static int iris_enum_fmt(struct file *filp, void *fh, struct v4l2_fmtdesc *f)
>> +{
>> +	struct iris_inst *inst = iris_get_inst(filp, NULL);
>> +
>> +	if (f->index)
>> +		return -EINVAL;
>> +
>> +	return iris_vdec_enum_fmt(inst, f);
>> +}
>> +
>>  static int iris_try_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format *f)
>>  {
>>  	struct iris_inst *inst = iris_get_inst(filp, NULL);
>> @@ -259,6 +269,32 @@ static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
>>  	return ret;
>>  }
>>  
>> +static int iris_enum_framesizes(struct file *filp, void *fh,
>> +				struct v4l2_frmsizeenum *fsize)
>> +{
>> +	struct iris_inst *inst = iris_get_inst(filp, NULL);
>> +	struct platform_inst_caps *caps;
>> +
>> +	if (fsize->index)
>> +		return -EINVAL;
>> +
>> +	if (fsize->pixel_format != V4L2_PIX_FMT_H264 &&
>> +	    fsize->pixel_format != V4L2_PIX_FMT_NV12)
>> +		return -EINVAL;
>> +
>> +	caps = inst->core->iris_platform_data->inst_caps;
>> +
>> +	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
>> +	fsize->stepwise.min_width = caps->min_frame_width;
>> +	fsize->stepwise.max_width = caps->max_frame_width;
>> +	fsize->stepwise.step_width = STEP_WIDTH;
>> +	fsize->stepwise.min_height = caps->min_frame_height;
>> +	fsize->stepwise.max_height = caps->max_frame_height;
>> +	fsize->stepwise.step_height = STEP_HEIGHT;
>> +
>> +	return 0;
>> +}
>> +
>>  static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *s)
>>  {
>>  	struct iris_inst *inst = iris_get_inst(filp, NULL);
>> @@ -300,12 +336,15 @@ static const struct vb2_ops iris_vb2_ops = {
>>  };
>>  
>>  static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
>> +	.vidioc_enum_fmt_vid_cap        = iris_enum_fmt,
>> +	.vidioc_enum_fmt_vid_out        = iris_enum_fmt,
>>  	.vidioc_try_fmt_vid_cap_mplane  = iris_try_fmt_vid_mplane,
>>  	.vidioc_try_fmt_vid_out_mplane  = iris_try_fmt_vid_mplane,
>>  	.vidioc_s_fmt_vid_cap_mplane    = iris_s_fmt_vid_mplane,
>>  	.vidioc_s_fmt_vid_out_mplane    = iris_s_fmt_vid_mplane,
>>  	.vidioc_g_fmt_vid_cap_mplane    = iris_g_fmt_vid_mplane,
>>  	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
>> +	.vidioc_enum_framesizes         = iris_enum_framesizes,
>>  	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
>>  	.vidioc_g_selection             = iris_g_selection,
>>  };
>>
> 

