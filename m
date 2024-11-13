Return-Path: <linux-media+bounces-21348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC749C68AF
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 06:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AFA81F24213
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 05:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31CE0176237;
	Wed, 13 Nov 2024 05:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YGkD/Ys9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9D6230984;
	Wed, 13 Nov 2024 05:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731475567; cv=none; b=IOpRz0EiLtz5wtrx+YDvxjkOBwii/HN16KEARCd0iu0bEqpC4ad2uVWJXzR77CRSknpoxVRXuyUYswlAP3T0AKKYtDDDO9EmjJGn1j1r47I73bs9KqahpmFiTIEDvC7uH4O7ysliIuQYh8JVvktH1pB2KeWR7XkRhrc4Ce66I8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731475567; c=relaxed/simple;
	bh=QWw0JZJPcHI2B9JrXLOLOkRSNvkHMTdC/08dA1WjmdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ehdV1ocizgxqIkmhNQjhdtwEyGazYvc401I1DYRJkwuRo5lx1RpG6OkzcMexf9LN1YQtZGW5TcOHo/4Vkxjh49reLYzx+cUYh1ANDLMGS1xiCZMNd0tZ+fjOlSzlymgYsaVtxUEC7/QUilflLkFEzE7nP3f0IVy/qVR2gFtUBIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YGkD/Ys9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMRbS6019664;
	Wed, 13 Nov 2024 05:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PyGEuoMOvD30K3Q822bS2iAESr/4utZmIPSPKaIQM3Y=; b=YGkD/Ys9PgpXCeA1
	CUFXP9vEVm7zvY91m0xQ7ShCnlQA4VlZoyqncibOWbghRM4hru/tpyt0LJe2///H
	mr4F/HmQug6jnrPn2f4aXTE098ZNNYD9xlXAIEv8gfhs8GWjooY5oEmlt4FB/wvS
	vsxK9qzv1wPZEUa6sNm7RqIullwAF10FKfleLjXpMIJ9wWHS81NdcvE7w1CFjIZH
	yxZTyAlkvLo4ZqaEtQKw/DEy5fKpwshMR6Fnt6XKQ90NkemnIr5nrWnzKAFx2r7H
	EVTUoZR8POFyZmqpccTC0fOknXwAMMMzbebIHhfy2Z5mc23lk0zmdmwG44TZxWW7
	XqILoA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v1h6kc82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 05:25:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD5Pt8t026987
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 05:25:55 GMT
Received: from [10.50.46.32] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 21:25:48 -0800
Message-ID: <25bd2b16-35ef-99ee-5b32-7c949cbcaf81@quicinc.com>
Date: Wed, 13 Nov 2024 10:55:44 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 10/28] media: iris: implement s_fmt, g_fmt and try_fmt
 ioctls
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
 <20241105-qcom-video-iris-v5-10-a88e7c220f78@quicinc.com>
 <8f941640-c2c3-4dc5-bb90-ccf8a6db98b2@xs4all.nl>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <8f941640-c2c3-4dc5-bb90-ccf8a6db98b2@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: R3cTE2okyxpAeiVERbDwUHKNFVTJ0NEU
X-Proofpoint-GUID: R3cTE2okyxpAeiVERbDwUHKNFVTJ0NEU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130046



On 11/12/2024 3:48 PM, Hans Verkuil wrote:
> On 05/11/2024 07:55, Dikshita Agarwal wrote:
>> From: Vedang Nagar <quic_vnagar@quicinc.com>
>>
>> Implement s_fmt, g_fmt and try_fmt ioctl ops with necessary hooks.
>>
>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_vdec.c | 131 +++++++++++++++++++++++++++
>>  drivers/media/platform/qcom/iris/iris_vdec.h |   2 +
>>  drivers/media/platform/qcom/iris/iris_vidc.c |  48 ++++++++++
>>  3 files changed, 181 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index 7d1ef31c7c44..e807decdda2b 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -3,6 +3,8 @@
>>   * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>   */
>>  
>> +#include <media/v4l2-mem2mem.h>
>> +
>>  #include "iris_buffer.h"
>>  #include "iris_instance.h"
>>  #include "iris_vdec.h"
>> @@ -10,6 +12,7 @@
>>  
>>  #define DEFAULT_WIDTH 320
>>  #define DEFAULT_HEIGHT 240
>> +#define DEFAULT_CODEC_ALIGNMENT 16
>>  
>>  void iris_vdec_inst_init(struct iris_inst *inst)
>>  {
>> @@ -56,3 +59,131 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
>>  	kfree(inst->fmt_dst);
>>  	kfree(inst->fmt_src);
>>  }
>> +
>> +int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
>> +{
>> +	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
>> +	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
>> +	struct v4l2_format *f_inst;
>> +	struct vb2_queue *src_q;
>> +
>> +	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
>> +	switch (f->type) {
>> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> +		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_H264) {
>> +			f_inst = inst->fmt_src;
>> +			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
>> +			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
>> +			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
>> +		}
>> +		break;
>> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> +		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12) {
>> +			f_inst = inst->fmt_dst;
>> +			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
>> +			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
>> +			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
>> +		}
>> +
>> +		src_q = v4l2_m2m_get_src_vq(m2m_ctx);
>> +		if (vb2_is_streaming(src_q)) {
>> +			f_inst = inst->fmt_src;
>> +			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
>> +			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
>> +		}
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (pixmp->field == V4L2_FIELD_ANY)
>> +		pixmp->field = V4L2_FIELD_NONE;
>> +
>> +	pixmp->num_planes = 1;
>> +
>> +	return 0;
>> +}
>> +
>> +int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>> +{
>> +	struct v4l2_format *fmt, *output_fmt;
>> +	struct vb2_queue *q;
>> +	u32 codec_align;
>> +
>> +	iris_vdec_try_fmt(inst, f);
>> +
>> +	switch (f->type) {
>> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> +		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_H264)
>> +			return -EINVAL;
>> +
>> +		fmt = inst->fmt_src;
>> +		fmt->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>> +
>> +		codec_align = DEFAULT_CODEC_ALIGNMENT;
>> +		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
>> +		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
>> +		fmt->fmt.pix_mp.num_planes = 1;
>> +		fmt->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
>> +		fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_INPUT);
>> +		inst->buffers[BUF_INPUT].min_count = iris_vpu_buf_count(inst, BUF_INPUT);
>> +		if (inst->buffers[BUF_INPUT].actual_count < inst->buffers[BUF_INPUT].min_count)
>> +			inst->buffers[BUF_INPUT].actual_count = inst->buffers[BUF_INPUT].min_count;
>> +
>> +		inst->buffers[BUF_INPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
>> +
>> +		fmt->fmt.pix_mp.colorspace = f->fmt.pix_mp.colorspace;
>> +		fmt->fmt.pix_mp.xfer_func = f->fmt.pix_mp.xfer_func;
>> +		fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
>> +		fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
>> +
>> +		output_fmt = inst->fmt_dst;
>> +		output_fmt->fmt.pix_mp.colorspace = f->fmt.pix_mp.colorspace;
>> +		output_fmt->fmt.pix_mp.xfer_func = f->fmt.pix_mp.xfer_func;
>> +		output_fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
>> +		output_fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
>> +
>> +		inst->crop.left = 0;
>> +		inst->crop.top = 0;
>> +		inst->crop.width = f->fmt.pix_mp.width;
>> +		inst->crop.height = f->fmt.pix_mp.height;
>> +		break;
>> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> +		fmt = inst->fmt_dst;
>> +		fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>> +		q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
>> +		if (q->streaming) {
>> +			f->fmt.pix_mp.height = inst->fmt_src->fmt.pix_mp.height;
>> +			f->fmt.pix_mp.width = inst->fmt_src->fmt.pix_mp.width;
>> +		}
>> +		if (fmt->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12)
>> +			return -EINVAL;
>> +		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
>> +		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
>> +		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
>> +		fmt->fmt.pix_mp.num_planes = 1;
>> +		fmt->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(f->fmt.pix_mp.width, 128);
>> +		fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
>> +
>> +		if (!q->streaming)
>> +			inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_INPUT);
>> +		if (inst->buffers[BUF_OUTPUT].actual_count < inst->buffers[BUF_OUTPUT].min_count)
>> +			inst->buffers[BUF_OUTPUT].actual_count =
>> +				inst->buffers[BUF_OUTPUT].min_count;
>> +
>> +		inst->buffers[BUF_OUTPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
>> +
>> +		if (!q->streaming) {
>> +			inst->crop.top = 0;
>> +			inst->crop.left = 0;
>> +			inst->crop.width = f->fmt.pix_mp.width;
>> +			inst->crop.height = f->fmt.pix_mp.height;
>> +		}
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +	memcpy(f, fmt, sizeof(*fmt));
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
>> index 0324d7f796dd..4f2557d15ca2 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.h
>> @@ -10,5 +10,7 @@ struct iris_inst;
>>  
>>  void iris_vdec_inst_init(struct iris_inst *inst);
>>  void iris_vdec_inst_deinit(struct iris_inst *inst);
>> +int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
>> +int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
>>  
>>  #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index ab3b63171c1d..6707eb9917fe 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -217,6 +217,48 @@ int iris_close(struct file *filp)
>>  	return 0;
>>  }
>>  
>> +static int iris_try_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format *f)
>> +{
>> +	struct iris_inst *inst = iris_get_inst(filp, NULL);
>> +	int ret;
>> +
>> +	mutex_lock(&inst->lock);
> 
> This is a bit weird. Normally the ioctls are serialized through the
> lock specified in struct video_device. Only queuing related ioctls
> can use a different lock (and they do in this driver).
> 
> So I would expect that vdev->lock is set to &inst->lock in the probe
> function, and that these wrapper functions for these ioctls would
> disappear, since there is no longer a need for them.
> 
> Drivers should not, in principle, serialize ioctls themselves, and
> instead they should set the lock in video_device. Unless there are
> very good reasons for doing otherwise.
> 
The intention behind using inst->lock is not to serialize the ioctls, but
to serialize the forward (driver) and reverse (firmware) threads.
We are taking the lock here, bcoz reverse thread can also update the
memebers of inst struture.

Thanks,
Dikshita
>> +	ret = iris_vdec_try_fmt(inst, f);
>> +	mutex_unlock(&inst->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int iris_s_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format *f)
>> +{
>> +	struct iris_inst *inst = iris_get_inst(filp, NULL);
>> +	int ret;
>> +
>> +	mutex_lock(&inst->lock);
>> +	ret = iris_vdec_s_fmt(inst, f);
>> +	mutex_unlock(&inst->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format *f)
>> +{
>> +	struct iris_inst *inst = iris_get_inst(filp, NULL);
>> +	int ret = 0;
>> +
>> +	mutex_lock(&inst->lock);
>> +	if (V4L2_TYPE_IS_OUTPUT(f->type))
>> +		memcpy(f, inst->fmt_src, sizeof(*f));
> 
> Just do: *f = inst->fmt_src, and do the same below.
> 
>> +	else if (V4L2_TYPE_IS_CAPTURE(f->type))
>> +		memcpy(f, inst->fmt_dst, sizeof(*f));
>> +	else
>> +		ret = -EINVAL;
>> +
>> +	mutex_unlock(&inst->lock);
>> +
>> +	return ret;
>> +}
>> +
>>  static struct v4l2_file_operations iris_v4l2_file_ops = {
>>  	.owner                          = THIS_MODULE,
>>  	.open                           = iris_open,
>> @@ -231,6 +273,12 @@ static const struct vb2_ops iris_vb2_ops = {
>>  };
>>  
>>  static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
>> +	.vidioc_try_fmt_vid_cap_mplane  = iris_try_fmt_vid_mplane,
>> +	.vidioc_try_fmt_vid_out_mplane  = iris_try_fmt_vid_mplane,
>> +	.vidioc_s_fmt_vid_cap_mplane    = iris_s_fmt_vid_mplane,
>> +	.vidioc_s_fmt_vid_out_mplane    = iris_s_fmt_vid_mplane,
>> +	.vidioc_g_fmt_vid_cap_mplane    = iris_g_fmt_vid_mplane,
>> +	.vidioc_g_fmt_vid_out_mplane    = iris_g_fmt_vid_mplane,
>>  	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
>>  };
>>  
>>
> 
> Regards,
> 
> 	Hans

