Return-Path: <linux-media+bounces-22865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 805669E8ECE
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 10:32:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 691B61639AA
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 09:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3629215F62;
	Mon,  9 Dec 2024 09:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Vfmu9Ydg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A061BA4B;
	Mon,  9 Dec 2024 09:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733736766; cv=none; b=YMluufP/edDy4XK3ZNmwicR6N1ZRSg5yqsSDtkGSuGCzK9AB+2/q9dK6eqoo2q50jmKR+kM+8VHu6bb1O3RjfSkCwZo516olFdEpDZFynvUf4bNgnhCY7cYqKJb+/qzVU+RyN/yZY/Dd66P0n3D0V6CeLmfBVNGajNyWZzTkhas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733736766; c=relaxed/simple;
	bh=wEKI60o7LGMYTShJ7WbUE2E6UpJrYbpii9QXYHJN930=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=u169Cf3o8MMFhJSEmeKEEnX54Yo8+QIfUxFuiDX6FvW3PpK0XIdy27WeycbtdLYTP/Xv/HlGfvmsahoRRRE8o0YFsYVmFSTMnbfGIhbym1JbF14CihAc/t9HIlOmZMw1vKvmuSrW3ztjXlq56ezsUiiEF/Gx3NwpQj4k/1g/kzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Vfmu9Ydg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8MqHDM032434;
	Mon, 9 Dec 2024 09:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sLV5o1x+DhqN4aXvtPspd+mdnxbdjlX4iwEp00J9UaM=; b=Vfmu9YdghNsfcUPM
	lQnN+1CMLeT58MTeY55Rd2QBsLl8+kNEL76Xw9YRc5no5q+YJa7LL6Z+yjxaiq1g
	trrnyQfgszmS9Av/OEDvQakpyU/ISq+ydtpRQ6gIccYZY3EKcq5Zjqq4p7x+yGrG
	zH452x1ePZ0lExofR336UDAwjj6juGzfqXoRuU/JBwSlm1xnIrmQHKwEMzgxp5st
	eabr/HLS5wI8UTdPKIsxQJSX4MfevnstfE3KV8QzCtOJ5j1HXUQ7fk1OXrJVVbEo
	ASig5rpzwlW14VdgpsGgHfDV+Kzylk+kXVe9naUG162Keo12B+oMSqlZ2cOMo0Xg
	7ZRACA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cbqn49x7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 09:32:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B99WEnx031865
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 09:32:14 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 01:32:08 -0800
Message-ID: <db2bba63-c960-7d3e-1a38-79beaf3e0b9b@quicinc.com>
Date: Mon, 9 Dec 2024 15:02:05 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 10/28] media: iris: implement s_fmt, g_fmt and try_fmt
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
References: <20241120-qcom-video-iris-v6-0-a8cf6704e992@quicinc.com>
 <20241120-qcom-video-iris-v6-10-a8cf6704e992@quicinc.com>
 <92f9c7ba-90a5-4f02-b547-62a00af128e1@xs4all.nl>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <92f9c7ba-90a5-4f02-b547-62a00af128e1@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OyK80vgRj_ObPDoDfeNr7Li8_hrEV8rM
X-Proofpoint-GUID: OyK80vgRj_ObPDoDfeNr7Li8_hrEV8rM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090074



On 11/29/2024 2:31 PM, Hans Verkuil wrote:
> Hi Dikshita,
> 
> Some comments below...
> 
> On 20/11/2024 15:46, Dikshita Agarwal wrote:
>> From: Vedang Nagar <quic_vnagar@quicinc.com>
>>
>> Implement s_fmt, g_fmt and try_fmt ioctl ops with necessary hooks.
>>
>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_vdec.c | 122 +++++++++++++++++++++++++++
>>  drivers/media/platform/qcom/iris/iris_vdec.h |   2 +
>>  drivers/media/platform/qcom/iris/iris_vidc.c |  48 +++++++++++
>>  3 files changed, 172 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index 2ed50ad5d58b..11a2507fc35f 100644
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
>> @@ -54,3 +57,122 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
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
> 
> I'm missing a vb2_is_busy() check here (and a return -EBUSY).
> 
> Changing the format while busy (i.e. while buffers are allocated)
> is generally a no-go since the format and the buffer sizes are linked.
> 
Sure, will add the check.
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
>> +		inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
>> +		inst->buffers[BUF_OUTPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
>> +
>> +		if (!q->streaming) {
> 
> Use vb2_is_streaming(), don't refer to q->streaming directly.
> 
> Please check if this is done anywhere else as well in the driver and
> use the helper function instead.
> 
>> +			inst->crop.top = 0;
>> +			inst->crop.left = 0;
>> +			inst->crop.width = f->fmt.pix_mp.width;
>> +			inst->crop.height = f->fmt.pix_mp.height;
> 
> A bigger question is why you do this? See the question about vb2_is_busy above:
> you shouldn't be able to get here at all if you are streaming since the vb2_is_busy
> check will catch that.
> 
That's right, this should not be needed when we add the vb2_is_busy() check.

Thanks,
Dikshita
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
>> index 353b73b76230..85e93f33e9e7 100644
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
> Use: *f = *inst->fmt_src
> 
>> +	else if (V4L2_TYPE_IS_CAPTURE(f->type))
>> +		memcpy(f, inst->fmt_dst, sizeof(*f));
> 
> Ditto for fmt_dst
> 
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

