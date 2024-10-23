Return-Path: <linux-media+bounces-20111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 301879AC934
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 13:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B27971F2209C
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 11:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 850621AC88B;
	Wed, 23 Oct 2024 11:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kOJARlK5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B64D1AB505;
	Wed, 23 Oct 2024 11:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729683530; cv=none; b=qRfY91ut6cN1WPvNwcLALjZrUGP3JUCHIiz+hWLGVKPDk7NJjfzADdYjHW1iTVRvovUhiHIczCrtIEJ7PeI/GLrZy3HGP615kujJbTZEFn4EAobeZwOQHE8ydg0+1HXn9ad8hQgw6O1LfMwbkfkTJBWJoRYYTFWaFb0tIpD/ovw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729683530; c=relaxed/simple;
	bh=/+WFEnvDjivJX4Au126VwACdaOw4qcV7VLLYvjLfqVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hQ3mWtTBhpfekgJmDT1SaAxzG8+eCLT/G+gF3r2x6CyuvQhsCQlOX8W7KY70+0IXDy49HMEHvGwWHeMjsocE7mkHGuOE2Ip1/JWCe2e0wAOxyisJyThIhldglS3fX2Ua8FKvpy4YmSwY23Hek7rY6EJ+EWgfzH9t1yWf6NpP3yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kOJARlK5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9V37f005091;
	Wed, 23 Oct 2024 11:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5dBF+Sk+S4kNDoPW+metDIn5VFDJ/fiEgaWVi9mtMqc=; b=kOJARlK5OIhU6ALl
	nC0zhOPse5pS4zVdy3TPM4ldIqveRiGpFxOzOrZgtHfFb2hOP+Q2AD1W0CkNDki+
	V0jlympX7MgyA8Dy2G51lzdgtPN788+zyfV2K9h9FJa22x5YboQLGM/QAt9pIHxz
	mQ8QwiVgNwb0H78vgwjulKDLbAMgGsNr2XkYv+7c4/pFtZzWRmbP+TP8pCUP6nXR
	gyqrt1f9zWLhrEFE83bIshHdVrsnP9EZmo1ijqrs+jm2nWK60rR+vYNjUoTSbobC
	EyyXuY4osSj2MdPtSqzkuniBI/5vODNTcPgE51TXqasm5DNww938tGZpWlsA3pvL
	29qaAw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em681yq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 11:38:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NBceOS019198
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 11:38:40 GMT
Received: from [10.216.48.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 04:38:36 -0700
Message-ID: <48307b08-dbf5-bec5-ac0e-41ad64d0bad4@quicinc.com>
Date: Wed, 23 Oct 2024 17:08:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 12/28] media: iris: implement enum_fmt and
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
        <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vedang Nagar
	<quic_vnagar@quicinc.com>
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
 <20241014-qcom-video-iris-v4-v4-12-c5eaa4e9ab9e@quicinc.com>
 <5a1f5d57-341c-47c3-b478-7d6a7842ae70@xs4all.nl>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <5a1f5d57-341c-47c3-b478-7d6a7842ae70@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZG01fZ-F0M06Vpy-em9D4xVQWoBABabO
X-Proofpoint-GUID: ZG01fZ-F0M06Vpy-em9D4xVQWoBABabO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230068



On 10/23/2024 4:19 PM, Hans Verkuil wrote:
> On 14/10/2024 11:07, Dikshita Agarwal wrote:
>> From: Vedang Nagar <quic_vnagar@quicinc.com>
>>
>> Implement enum_fmt and enum_frameintervals ioctls with
>> necessary hooks.
>>
>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  .../platform/qcom/iris/iris_platform_common.h      |  4 +++
>>  .../platform/qcom/iris/iris_platform_sm8550.c      |  4 +++
>>  drivers/media/platform/qcom/iris/iris_vdec.c       | 21 ++++++++++++
>>  drivers/media/platform/qcom/iris/iris_vdec.h       |  1 +
>>  drivers/media/platform/qcom/iris/iris_vidc.c       | 39 ++++++++++++++++++++++
>>  5 files changed, 69 insertions(+)
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
>> index e807decdda2b..fd0f1ebc33e8 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -60,6 +60,27 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
>>  	kfree(inst->fmt_src);
>>  }
>>  
>> +int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
>> +{
>> +	switch (f->type) {
>> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> +		f->pixelformat = V4L2_PIX_FMT_H264;
>> +		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_DYN_RESOLUTION;
>> +		strscpy(f->description, "codec", sizeof(f->description));
> 
> Don't set description, it's handled in v4l_fill_fmtdesc in v4l2-ioctl.c.
> 
>> +		break;
>> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> +		f->pixelformat = V4L2_PIX_FMT_NV12;
>> +		strscpy(f->description, "colorformat", sizeof(f->description));
> 
> Ditto.
> 
> Hmm, v4l2-compliance should warn about this. Is this changed in a later patch perhaps?
> 
Oh, we didn't see such warning.
Will make the change.
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	memset(f->reserved, 0, sizeof(f->reserved));
> 
> No need to do this, it's already zeroed by v4l_enum_fmt.
> 
Sure, Noted.
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
>> index 481fa0a7b7f3..1d6c5e8fafb4 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -214,6 +214,16 @@ int iris_close(struct file *filp)
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
>> @@ -256,6 +266,32 @@ static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
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
>> @@ -298,12 +334,15 @@ static const struct vb2_ops iris_vb2_ops = {
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

