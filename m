Return-Path: <linux-media+bounces-21367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E179F9C6CEB
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 11:33:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08F2FB273DF
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 10:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5817C1FE0F1;
	Wed, 13 Nov 2024 10:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="p4vRe8aE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AD21FB899;
	Wed, 13 Nov 2024 10:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731493959; cv=none; b=nKse2saRSkAfhGqkRivy5D/3xIWrZKA8m5EDnSGueLjPycic/vjulGBhK4UnTf483WiHWbxT9MTkocURPEQe7X4T2zoegd0Q9O68/32jA03WuI22L1iGch9UE+5CwG3bBHmc/H28kD9OFO+LowcaX2uEHEZx2/6e7KhvJgkJY9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731493959; c=relaxed/simple;
	bh=Y6Y7k+8PSQNkbhIeFTn/mJ1j9qFyrOZesTr5CscDGYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nSWP2Ac00jKKk8gqfYWJ+skhtAGWlofUKkA9I7TbTiazdijQwk2yQwYqNmPBMXId28lXKIy+aHpOwP7hLlC7ICjnGEm9/df9xOmz8EkJYYYfZZPd/GhZPjXPTdJApMHY3NWKTxA5+T/721Z1uPnAXxKI5H9BFs8OgvEVt30tcCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=p4vRe8aE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADAEQ16018327;
	Wed, 13 Nov 2024 10:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wzt1nGX3x3E0HVSk5Tr16pTwqwUO14ycg6chKqWwS8Q=; b=p4vRe8aEmbW7VNZd
	3VJJawlw3Qae01lvwY/tgWUaS7E1t7FWgGydiNeU2QXUE1XhqNhEFyqKKKGUhWEu
	GRuZFVCgi+fFcoKSE9z3icIUPPNfOmCnqlehlWHD7UkEErDVQ+gU+nmPQcU3knL/
	IrTH9De6WQGLlzYDu4XxVlFt3q4jijEWrLLCluMCJg6zZ67tXzvWd0pYK7R684X+
	0li+3RAqJZ1DGXhbpecKswW2z5VIg50JWNv4NGKeLNi7I6FK3tcmqeo5rD3EivD8
	dtl2sYNPfeLaHVYaESMU/UxjFNSVIue3IzhG/NKdjAaeP753yOAFR69FIABqxnvW
	cyJMTg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v4kqun25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 10:32:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ADAWOVb016276
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 10:32:24 GMT
Received: from [10.50.46.32] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 02:32:18 -0800
Message-ID: <98696180-a40f-deca-13f3-e3636a0d9d16@quicinc.com>
Date: Wed, 13 Nov 2024 16:02:15 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 09/28] media: iris: implement reqbuf ioctl with
 vb2_queue_setup
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
        <linux-kernel@vger.kernel.org>
References: <20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com>
 <20241105-qcom-video-iris-v5-9-a88e7c220f78@quicinc.com>
 <96966b66-a93a-4675-8d28-6fe9152644b8@xs4all.nl>
 <0fb27983-e253-3375-1c01-bfad7d05485c@quicinc.com>
 <d4fb8e3e-d19e-4af5-8a16-8b8b53c3530e@xs4all.nl>
 <1360d885-52f1-9dbc-7beb-23ac58ec8ff0@quicinc.com>
 <0afd368a-36ed-4415-977b-abf6d245b754@xs4all.nl>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <0afd368a-36ed-4415-977b-abf6d245b754@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lQ7cFY64eMljbs-R0awsidWznKTFEWX9
X-Proofpoint-GUID: lQ7cFY64eMljbs-R0awsidWznKTFEWX9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130092



On 11/13/2024 2:52 PM, Hans Verkuil wrote:
> On 13/11/2024 10:00, Dikshita Agarwal wrote:
>>
>>
>> On 11/13/2024 1:18 PM, Hans Verkuil wrote:
>>> On 13/11/2024 07:19, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 11/12/2024 3:20 PM, Hans Verkuil wrote:
>>>>> On 05/11/2024 07:55, Dikshita Agarwal wrote:
>>>>>> Implement reqbuf IOCTL op and vb2_queue_setup vb2 op in the driver with
>>>>>> necessary hooks.
>>>>>>
>>>>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>>>>> ---
>>>
>>> <snip>
>>>
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..61033f95cdba
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
>>>>>> @@ -0,0 +1,74 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>>> +/*
>>>>>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>> + */
>>>>>> +
>>>>>> +#include "iris_buffer.h"
>>>>>> +#include "iris_instance.h"
>>>>>> +#include "iris_vb2.h"
>>>>>> +#include "iris_vpu_buffer.h"
>>>>>> +
>>>>>> +int iris_vb2_queue_setup(struct vb2_queue *q,
>>>>>> +			 unsigned int *num_buffers, unsigned int *num_planes,
>>>>>> +			 unsigned int sizes[], struct device *alloc_devs[])
>>>>>> +{
>>>>>> +	enum iris_buffer_type buffer_type = 0;
>>>>>> +	struct iris_buffers *buffers;
>>>>>> +	struct iris_inst *inst;
>>>>>> +	struct iris_core *core;
>>>>>> +	struct v4l2_format *f;
>>>>>> +	int ret = 0;
>>>>>> +
>>>>>> +	inst = vb2_get_drv_priv(q);
>>>>>> +
>>>>>> +	mutex_lock(&inst->lock);
>>>>>> +
>>>>>> +	core = inst->core;
>>>>>> +	f = V4L2_TYPE_IS_OUTPUT(q->type) ? inst->fmt_src : inst->fmt_dst;
>>>>>> +
>>>>>> +	if (*num_planes) {
>>>>>> +		if (*num_planes != f->fmt.pix_mp.num_planes ||
>>>>>> +			sizes[0] < f->fmt.pix_mp.plane_fmt[0].sizeimage)
>>>>>> +			ret = -EINVAL;
>>>>>> +		goto unlock;
>>>>>> +	}
>>>>>> +
>>>>>> +	buffer_type = iris_v4l2_type_to_driver(q->type);
>>>>>> +	if (buffer_type == -EINVAL) {
>>>>>
>>>>> Can this ever fail?
>>>>>
>>>> If the q->type passed is not supported by driver then it can fail.
>>>
>>> But it is the driver that sets q->type when the vb2_queue is initialized.
>>> So it makes no sense to test it here, it would be a driver bug if this fails.
>>>
>> Ok, Will remove this check.
>>>>>> +		ret = -EINVAL;
>>>>>> +		goto unlock;
>>>>>> +	}
>>>>>> +
>>>>>> +	if (!inst->once_per_session_set) {
>>>>>> +		inst->once_per_session_set = true;
>>>>>> +
>>>>>> +		ret = core->hfi_ops->session_open(inst);
>>>>>> +		if (ret) {
>>>>>> +			ret = -EINVAL;
>>>>>> +			dev_err(core->dev, "session open failed\n");
>>>>>> +			goto unlock;
>>>>>> +		}
>>>>>> +	}
>>>>>> +
>>>>>> +	buffers = &inst->buffers[buffer_type];
>>>>>> +	if (!buffers) {
>>>>>
>>>>> This definitely can never fail.
>>>>>
>>>> Right, will remove the check.
>>>>>> +		ret = -EINVAL;
>>>>>> +		goto unlock;
>>>>>> +	}
>>>>>> +
>>>>>> +	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
>>>>>> +	buffers->actual_count = *num_buffers;
>>>>>
>>>>> Don't mirror the number of buffers in actual_count, instead just always
>>>>> ask for the number of buffers using vb2_get_num_buffers().
>>>>>
>>>>> This code is wrong anyway, since actual_count isn't updated if more
>>>>> buffers are added using VIDIOC_CREATEBUFS.
>>>>>
>>>> Ok, so below would fix the VIDIOC_CREATEBUFS as well, right?
>>>> - buffers->actual_count = *num_buffers;
>>>> + buffers->actual_count = vb2_get_num_buffers();
>> Does this look good?
> 
> No. You shouldn't have the actual_count field at all, especially since I see that
> you set it in several places. vb2_get_num_buffers() reports the current number of
> buffers, which can change if userspace calls VIDIOC_CREATE_BUFS or REMOVE_BUFS.
> 
> You shouldn't try to mirror that value yourself. If you need that information,
> then call vb2_get_num_buffers().
> 
> There are weird things going on in your driver w.r.t. actual_count and also min_count
> (and I saw a count_actual as well, very confusing).
> 
> I'm not sure what you are trying to achieve, but it doesn't look right.
> 
We need to set the value of actual buffers being queued to firmware via a
property, for that we are caching the value in actual_count so that we can
set it to fw when needed.

count_actual is the variable of the hfi struture being filled to set the
property to fw,
---
u32 ptype = HFI_PROPERTY_PARAM_BUFFER_COUNT_ACTUAL;
struct hfi_buffer_count_actual buf_count;
int ret;

buf_count.type = HFI_BUFFER_INPUT;
buf_count.count_actual = inst->buffers[BUF_INPUT].actual_count;
---

Calling vb2_get_num_buffers from HFI layer will violate the current design
of driver so will need to cache this info in upper layer, best place to do
that seems to be queue_setup which is called from both VIDIOC_REQBUFS and
VIDIOC_CREATE_BUFS.
Any other suggestions for the same?

To avoid the confusion, I can rename the actual_count to count_actual to
match with hfi structure.
Also, I can cleanup some part of driver where this variable is being
updated un-necessarily.
This is only needed to set the property to firmware as explained above.

min_count holds the min numbers of buffer needed by firmware for the
particluar session, it can be changed by firmware if source changes.

Thanks,
Dikshita
> Regards,
> 
> 	Hans
> 
>>
>> Thanks,
>> Dikshita
>>>>>> +	*num_planes = 1;
>>>>>> +
>>>>>> +	buffers->size = iris_get_buffer_size(inst, buffer_type);
>>>>>> +
>>>>>> +	if (sizes[0] < buffers->size) {
>>>>>> +		f->fmt.pix_mp.plane_fmt[0].sizeimage = buffers->size;
>>>>>
>>>>> Isn't this something that is set in VIDIOC_S_FMT? Can what iris_get_buffer_size
>>>>> returns here be different from what VIDIOC_S_FMT does?
>>>>>
>>>>> This is weird code, I don't think it belong in queue_setup. If iris_get_buffer_size
>>>>> can really give a different result, then it needs to be explained carefully, since
>>>>> that would be unexpected and possibly non-compliant.
>>>>>
>>>> I remember adding this particular change to fix a compliance issue.
>>>> But when I checked again without this change, compliance is passing now, so
>>>> will remove this in next version.
>>>
>>> Ah, good!
>>>
>>> Regards,
>>>
>>> 	Hans
>>>
>>>>
>>>>
>>>> Thanks,
>>>> Dikshita
>>>>>> +		sizes[0] = f->fmt.pix_mp.plane_fmt[0].sizeimage;
>>>>>> +	}
>>>>>> +
>>>>>> +unlock:
>>>>>> +	mutex_unlock(&inst->lock);
>>>>>> +
>>>>>> +	return ret;
>>>>>> +}
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.h b/drivers/media/platform/qcom/iris/iris_vb2.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..78157a97b86e
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.h
>>>>>> @@ -0,0 +1,12 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>>> +/*
>>>>>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef _IRIS_VB2_H_
>>>>>> +#define _IRIS_VB2_H_
>>>>>> +
>>>>>> +int iris_vb2_queue_setup(struct vb2_queue *q,
>>>>>> +			 unsigned int *num_buffers, unsigned int *num_planes,
>>>>>> +			 unsigned int sizes[], struct device *alloc_devs[]);
>>>>>> +#endif
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..7d1ef31c7c44
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>>>>>> @@ -0,0 +1,58 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>>> +/*
>>>>>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>> + */
>>>>>> +
>>>>>> +#include "iris_buffer.h"
>>>>>> +#include "iris_instance.h"
>>>>>> +#include "iris_vdec.h"
>>>>>> +#include "iris_vpu_buffer.h"
>>>>>> +
>>>>>> +#define DEFAULT_WIDTH 320
>>>>>> +#define DEFAULT_HEIGHT 240
>>>>>> +
>>>>>> +void iris_vdec_inst_init(struct iris_inst *inst)
>>>>>> +{
>>>>>> +	struct v4l2_format *f;
>>>>>> +
>>>>>> +	inst->fmt_src  = kzalloc(sizeof(*inst->fmt_src), GFP_KERNEL);
>>>>>> +	inst->fmt_dst  = kzalloc(sizeof(*inst->fmt_dst), GFP_KERNEL);
>>>>>> +
>>>>>> +	inst->fw_min_count = MIN_BUFFERS;
>>>>>> +
>>>>>> +	f = inst->fmt_src;
>>>>>> +	f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>>>>>> +	f->fmt.pix_mp.width = DEFAULT_WIDTH;
>>>>>> +	f->fmt.pix_mp.height = DEFAULT_HEIGHT;
>>>>>> +	f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_H264;
>>>>>> +	f->fmt.pix_mp.num_planes = 1;
>>>>>> +	f->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
>>>>>> +	f->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_INPUT);
>>>>>> +	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
>>>>>> +	inst->buffers[BUF_INPUT].min_count = iris_vpu_buf_count(inst, BUF_INPUT);
>>>>>> +	inst->buffers[BUF_INPUT].actual_count = inst->buffers[BUF_INPUT].min_count;
>>>>>> +	inst->buffers[BUF_INPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
>>>>>> +
>>>>>> +	f = inst->fmt_dst;
>>>>>> +	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>>>>>> +	f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_NV12;
>>>>>> +	f->fmt.pix_mp.width = ALIGN(DEFAULT_WIDTH, 128);
>>>>>> +	f->fmt.pix_mp.height = ALIGN(DEFAULT_HEIGHT, 32);
>>>>>> +	f->fmt.pix_mp.num_planes = 1;
>>>>>> +	f->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(DEFAULT_WIDTH, 128);
>>>>>> +	f->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
>>>>>> +	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
>>>>>> +	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_DEFAULT;
>>>>>> +	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
>>>>>> +	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>>>>>> +	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
>>>>>> +	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
>>>>>> +	inst->buffers[BUF_OUTPUT].actual_count = inst->buffers[BUF_OUTPUT].min_count;
>>>>>> +	inst->buffers[BUF_OUTPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
>>>>>> +}
>>>>>> +
>>>>>> +void iris_vdec_inst_deinit(struct iris_inst *inst)
>>>>>> +{
>>>>>> +	kfree(inst->fmt_dst);
>>>>>> +	kfree(inst->fmt_src);
>>>>>> +}
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..0324d7f796dd
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.h
>>>>>> @@ -0,0 +1,14 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>>> +/*
>>>>>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef _IRIS_VDEC_H_
>>>>>> +#define _IRIS_VDEC_H_
>>>>>> +
>>>>>> +struct iris_inst;
>>>>>> +
>>>>>> +void iris_vdec_inst_init(struct iris_inst *inst);
>>>>>> +void iris_vdec_inst_deinit(struct iris_inst *inst);
>>>>>> +
>>>>>> +#endif
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>>>>>> index b8654e73f516..ab3b63171c1d 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>>>>>> @@ -9,6 +9,9 @@
>>>>>>  
>>>>>>  #include "iris_vidc.h"
>>>>>>  #include "iris_instance.h"
>>>>>> +#include "iris_vdec.h"
>>>>>> +#include "iris_vb2.h"
>>>>>> +#include "iris_vpu_buffer.h"
>>>>>>  #include "iris_platform_common.h"
>>>>>>  
>>>>>>  #define IRIS_DRV_NAME "iris_driver"
>>>>>> @@ -28,6 +31,38 @@ static void iris_v4l2_fh_deinit(struct iris_inst *inst)
>>>>>>  	v4l2_fh_exit(&inst->fh);
>>>>>>  }
>>>>>>  
>>>>>> +static void iris_add_session(struct iris_inst *inst)
>>>>>> +{
>>>>>> +	struct iris_core *core = inst->core;
>>>>>> +	struct iris_inst *iter;
>>>>>> +	u32 count = 0;
>>>>>> +
>>>>>> +	mutex_lock(&core->lock);
>>>>>> +
>>>>>> +	list_for_each_entry(iter, &core->instances, list)
>>>>>> +		count++;
>>>>>> +
>>>>>> +	if (count < core->iris_platform_data->max_session_count)
>>>>>> +		list_add_tail(&inst->list, &core->instances);
>>>>>> +
>>>>>> +	mutex_unlock(&core->lock);
>>>>>> +}
>>>>>> +
>>>>>> +static void iris_remove_session(struct iris_inst *inst)
>>>>>> +{
>>>>>> +	struct iris_core *core = inst->core;
>>>>>> +	struct iris_inst *iter, *temp;
>>>>>> +
>>>>>> +	mutex_lock(&core->lock);
>>>>>> +	list_for_each_entry_safe(iter, temp, &core->instances, list) {
>>>>>> +		if (iter->session_id == inst->session_id) {
>>>>>> +			list_del_init(&iter->list);
>>>>>> +			break;
>>>>>> +		}
>>>>>> +	}
>>>>>> +	mutex_unlock(&core->lock);
>>>>>> +}
>>>>>> +
>>>>>>  static inline struct iris_inst *iris_get_inst(struct file *filp, void *fh)
>>>>>>  {
>>>>>>  	return container_of(filp->private_data, struct iris_inst, fh);
>>>>>> @@ -59,7 +94,10 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
>>>>>>  	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>>>>>>  	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>>>>>>  	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>>>>>> +	src_vq->ops = inst->core->iris_vb2_ops;
>>>>>>  	src_vq->drv_priv = inst;
>>>>>> +	src_vq->buf_struct_size = sizeof(struct iris_buffer);
>>>>>> +	src_vq->min_reqbufs_allocation = MIN_BUFFERS;
>>>>>>  	src_vq->dev = inst->core->dev;
>>>>>>  	src_vq->lock = &inst->ctx_q_lock;
>>>>>>  	ret = vb2_queue_init(src_vq);
>>>>>> @@ -69,7 +107,10 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
>>>>>>  	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>>>>>>  	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>>>>>>  	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>>>>>> +	dst_vq->ops = inst->core->iris_vb2_ops;
>>>>>>  	dst_vq->drv_priv = inst;
>>>>>> +	dst_vq->buf_struct_size = sizeof(struct iris_buffer);
>>>>>> +	dst_vq->min_reqbufs_allocation = MIN_BUFFERS;
>>>>>>  	dst_vq->dev = inst->core->dev;
>>>>>>  	dst_vq->lock = &inst->ctx_q_lock;
>>>>>>  
>>>>>> @@ -100,8 +141,11 @@ int iris_open(struct file *filp)
>>>>>>  		return -ENOMEM;
>>>>>>  
>>>>>>  	inst->core = core;
>>>>>> +	inst->session_id = hash32_ptr(inst);
>>>>>>  
>>>>>> +	mutex_init(&inst->lock);
>>>>>>  	mutex_init(&inst->ctx_q_lock);
>>>>>> +	init_completion(&inst->completion);
>>>>>>  
>>>>>>  	iris_v4l2_fh_init(inst);
>>>>>>  
>>>>>> @@ -117,6 +161,10 @@ int iris_open(struct file *filp)
>>>>>>  		goto fail_m2m_release;
>>>>>>  	}
>>>>>>  
>>>>>> +	iris_vdec_inst_init(inst);
>>>>>> +
>>>>>> +	iris_add_session(inst);
>>>>>> +
>>>>>>  	inst->fh.m2m_ctx = inst->m2m_ctx;
>>>>>>  	filp->private_data = &inst->fh;
>>>>>>  
>>>>>> @@ -127,19 +175,42 @@ int iris_open(struct file *filp)
>>>>>>  fail_v4l2_fh_deinit:
>>>>>>  	iris_v4l2_fh_deinit(inst);
>>>>>>  	mutex_destroy(&inst->ctx_q_lock);
>>>>>> +	mutex_destroy(&inst->lock);
>>>>>>  	kfree(inst);
>>>>>>  
>>>>>>  	return ret;
>>>>>>  }
>>>>>>  
>>>>>> +static void iris_session_close(struct iris_inst *inst)
>>>>>> +{
>>>>>> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>>>>>> +	bool wait_for_response = true;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	reinit_completion(&inst->completion);
>>>>>> +
>>>>>> +	ret = hfi_ops->session_close(inst);
>>>>>> +	if (ret)
>>>>>> +		wait_for_response = false;
>>>>>> +
>>>>>> +	if (wait_for_response)
>>>>>> +		iris_wait_for_session_response(inst);
>>>>>> +}
>>>>>> +
>>>>>>  int iris_close(struct file *filp)
>>>>>>  {
>>>>>>  	struct iris_inst *inst = iris_get_inst(filp, NULL);
>>>>>>  
>>>>>>  	v4l2_m2m_ctx_release(inst->m2m_ctx);
>>>>>>  	v4l2_m2m_release(inst->m2m_dev);
>>>>>> +	mutex_lock(&inst->lock);
>>>>>> +	iris_vdec_inst_deinit(inst);
>>>>>> +	iris_session_close(inst);
>>>>>>  	iris_v4l2_fh_deinit(inst);
>>>>>> +	iris_remove_session(inst);
>>>>>> +	mutex_unlock(&inst->lock);
>>>>>>  	mutex_destroy(&inst->ctx_q_lock);
>>>>>> +	mutex_destroy(&inst->lock);
>>>>>>  	kfree(inst);
>>>>>>  	filp->private_data = NULL;
>>>>>>  
>>>>>> @@ -155,7 +226,17 @@ static struct v4l2_file_operations iris_v4l2_file_ops = {
>>>>>>  	.mmap                           = v4l2_m2m_fop_mmap,
>>>>>>  };
>>>>>>  
>>>>>> +static const struct vb2_ops iris_vb2_ops = {
>>>>>> +	.queue_setup                    = iris_vb2_queue_setup,
>>>>>> +};
>>>>>> +
>>>>>> +static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
>>>>>> +	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
>>>>>> +};
>>>>>> +
>>>>>>  void iris_init_ops(struct iris_core *core)
>>>>>>  {
>>>>>>  	core->iris_v4l2_file_ops = &iris_v4l2_file_ops;
>>>>>> +	core->iris_vb2_ops = &iris_vb2_ops;
>>>>>> +	core->iris_v4l2_ioctl_ops = &iris_v4l2_ioctl_ops;
>>>>>>  }
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..2402a33723ab
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>>>>>> @@ -0,0 +1,19 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>>> +/*
>>>>>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>> + */
>>>>>> +
>>>>>> +#include "iris_instance.h"
>>>>>> +#include "iris_vpu_buffer.h"
>>>>>> +
>>>>>> +int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type)
>>>>>> +{
>>>>>> +	switch (buffer_type) {
>>>>>> +	case BUF_INPUT:
>>>>>> +		return MIN_BUFFERS;
>>>>>> +	case BUF_OUTPUT:
>>>>>> +		return inst->fw_min_count;
>>>>>> +	default:
>>>>>> +		return 0;
>>>>>> +	}
>>>>>> +}
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..f0f974cebd8a
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>>>>>> @@ -0,0 +1,15 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>>>> +/*
>>>>>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef _IRIS_VPU_BUFFER_H_
>>>>>> +#define _IRIS_VPU_BUFFER_H_
>>>>>> +
>>>>>> +struct iris_inst;
>>>>>> +
>>>>>> +#define MIN_BUFFERS			4
>>>>>> +
>>>>>> +int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>>>>>> +
>>>>>> +#endif
>>>>>>
>>>>>
>>>>> Regards,
>>>>>
>>>>> 	Hans
>>>
> 

