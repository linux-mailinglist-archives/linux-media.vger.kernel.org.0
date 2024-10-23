Return-Path: <linux-media+bounces-20097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D049AC796
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 12:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55FCA1F24338
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 10:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64DD1A073A;
	Wed, 23 Oct 2024 10:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Skgao9RW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4671509A0;
	Wed, 23 Oct 2024 10:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729678650; cv=none; b=p8cBYjzVPo6kuak2BtyGzydqr2Q7lnfS500Omr22KUtjI5EZbtE9W5AQBY/RnAAIErNw9vhw3aZvAhke1djrdXbqMqjcEmSk2lHs5/3bTDHOBah0Ahmq+VOwt6KZIJe3WlWmj2I0LCSXkyRS8S1Goe8aTCnBgNgoFeGvqQA03jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729678650; c=relaxed/simple;
	bh=DVkQvQoYmKklxf9uPW3QFxdyCJ/AEy5m56PWqBQngCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lJv1vXxeXTx9bKZevrUJxIsSzqybX6augNC9PcKYmMwBPuC42BU3xa+I3Q+oQhpC78+utiPAB/kzJX4JpD2ArFJCFSmmTjXhDpH0MbHooehVt1sJnRfhacSeJ3eCdPPX5SongfcAbiWfuyb2THc1g/LURNHLOz9IRkHEYXVWjmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Skgao9RW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9HS72026325;
	Wed, 23 Oct 2024 10:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HjgiKLXqmTTm5FFgJ1viYQDqr4dFjgaR6elaz3mPlXA=; b=Skgao9RWiYvTDK84
	0KUGHB3qJieemIY2NSTU5lFZswwFWdilmXlCCD7MILN5Ip8ObBc27HnBG/LRMuh4
	WbjH9MDMR/NBHtljfTL9OZr/PD/17m2S6ZOR6qf9+PCGCQG3m71pydTzrjMLkrFC
	4HzoXjuw4PGO18nGWW8av6/UC2iiluStfjZH1TyLViqXzC5kWt6WXiJe9UjERE29
	LtgtzLuokViQLSVshvWcuXlI/JZaxVlmV5wCzLsfgfBuemxuMyao9Ja0QeK+CW5F
	vsmmCyDwqjUpl+zl1SYcyCXC84pUVxSnXBT3kqlK3qZqdqKta+wmSZQoAmVLpL5w
	rzrnVg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em409tn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 10:17:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NAHIZE002796
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 10:17:18 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 03:17:13 -0700
Message-ID: <b372c330-e9fb-3b23-d628-cc7add7dc425@quicinc.com>
Date: Wed, 23 Oct 2024 15:47:11 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 09/28] media: iris: implement reqbuf ioctl with
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
        <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
 <20241014-qcom-video-iris-v4-v4-9-c5eaa4e9ab9e@quicinc.com>
 <72a21b67-2c2e-4106-a13d-690cd8c21156@xs4all.nl>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <72a21b67-2c2e-4106-a13d-690cd8c21156@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: L7NVV_Qf99sa-uG8ORoZlcTC8S8TO4gv
X-Proofpoint-GUID: L7NVV_Qf99sa-uG8ORoZlcTC8S8TO4gv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230063



On 10/23/2024 3:29 PM, Hans Verkuil wrote:
> On 14/10/2024 11:07, Dikshita Agarwal wrote:
>> Implement reqbuf IOCTL op and vb2_queue_setup vb2 op
>> in the driver with necessary hooks.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/iris/Makefile          |   7 +-
>>  drivers/media/platform/qcom/iris/iris_buffer.c     | 119 +++++++++++++++++++++
>>  drivers/media/platform/qcom/iris/iris_buffer.h     | 107 ++++++++++++++++++
>>  drivers/media/platform/qcom/iris/iris_core.h       |   6 ++
>>  drivers/media/platform/qcom/iris/iris_hfi_common.h |   3 +
>>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  40 +++++++
>>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  47 +++++++-
>>  .../platform/qcom/iris/iris_hfi_gen1_response.c    |  79 +++++++++++++-
>>  drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   5 +
>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 105 ++++++++++++++++++
>>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  34 ++++++
>>  .../platform/qcom/iris/iris_hfi_gen2_packet.c      |  39 +++++++
>>  .../platform/qcom/iris/iris_hfi_gen2_packet.h      |   7 ++
>>  .../platform/qcom/iris/iris_hfi_gen2_response.c    | 108 ++++++++++++++++++-
>>  drivers/media/platform/qcom/iris/iris_instance.h   |  22 ++++
>>  .../platform/qcom/iris/iris_platform_common.h      |   5 +
>>  .../platform/qcom/iris/iris_platform_sm8550.c      |   6 ++
>>  drivers/media/platform/qcom/iris/iris_probe.c      |   2 +
>>  drivers/media/platform/qcom/iris/iris_utils.c      |  51 +++++++++
>>  drivers/media/platform/qcom/iris/iris_utils.h      |  38 +++++++
>>  drivers/media/platform/qcom/iris/iris_vb2.c        |  77 +++++++++++++
>>  drivers/media/platform/qcom/iris/iris_vb2.h        |  12 +++
>>  drivers/media/platform/qcom/iris/iris_vdec.c       |  58 ++++++++++
>>  drivers/media/platform/qcom/iris/iris_vdec.h       |  14 +++
>>  drivers/media/platform/qcom/iris/iris_vidc.c       |  78 ++++++++++++++
>>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  19 ++++
>>  drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  15 +++
>>  27 files changed, 1095 insertions(+), 8 deletions(-)
>>
> 
> <snip>
> 
>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
>> new file mode 100644
>> index 000000000000..f89891e52fde
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
>> @@ -0,0 +1,77 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include "iris_buffer.h"
>> +#include "iris_instance.h"
>> +#include "iris_vb2.h"
>> +#include "iris_vpu_buffer.h"
>> +
>> +int iris_vb2_queue_setup(struct vb2_queue *q,
>> +			 unsigned int *num_buffers, unsigned int *num_planes,
>> +			 unsigned int sizes[], struct device *alloc_devs[])
>> +{
>> +	enum iris_buffer_type buffer_type = 0;
>> +	struct iris_buffers *buffers;
>> +	struct iris_inst *inst;
>> +	struct iris_core *core;
>> +	struct v4l2_format *f;
>> +	int ret = 0;
>> +
>> +	inst = vb2_get_drv_priv(q);
>> +
>> +	mutex_lock(&inst->lock);
>> +
>> +	core = inst->core;
>> +	f = V4L2_TYPE_IS_OUTPUT(q->type) ? inst->fmt_src : inst->fmt_dst;
>> +
>> +	if (*num_planes) {
>> +		if (*num_planes != f->fmt.pix_mp.num_planes ||
>> +		    sizes[0] < f->fmt.pix_mp.plane_fmt[0].sizeimage) {
>> +			ret = -EINVAL;
>> +			goto unlock;
>> +		}
> 
> If *num_planes is set, then there are already buffers allocated and you are
> called from VIDIOC_CREATE_BUFS. That should just do a goto unlock here, since
> it is always OK to add more buffers as long as they are sufficiently large.
> 
Got it.
But In that case, size check should still be there right? to return error
if buffer size if not sufficient.
>> +	}
>> +
>> +	buffer_type = iris_v4l2_type_to_driver(q->type);
>> +	if (buffer_type == -EINVAL) {
>> +		ret = -EINVAL;
>> +		goto unlock;
>> +	}
>> +
>> +	if (!inst->once_per_session_set) {
>> +		inst->once_per_session_set = true;
>> +
>> +		ret = core->hfi_ops->session_open(inst);
>> +		if (ret) {
>> +			ret = -EINVAL;
>> +			dev_err(core->dev, "session open failed\n");
>> +			goto unlock;
>> +		}
>> +	}
>> +
>> +	buffers = &inst->buffers[buffer_type];
>> +	if (!buffers) {
>> +		ret = -EINVAL;
>> +		goto unlock;
>> +	}
>> +
>> +	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
>> +	if (*num_buffers < buffers->min_count)
>> +		*num_buffers = buffers->min_count;
> 
> This doesn't look right. Typically you would set the min_reqbufs_allocation
> field in vb2_queue before calling vb2_queue_init.
> 
We are not setting this field currently in queue_init, will set this field
with minimum buffer requirement and remove this check from here.

>> +	buffers->actual_count = *num_buffers;
>> +	*num_planes = 1;
>> +
>> +	buffers->size = iris_get_buffer_size(inst, buffer_type);
>> +
>> +	if (sizes[0] < buffers->size) {
>> +		f->fmt.pix_mp.plane_fmt[0].sizeimage = buffers->size;
>> +		sizes[0] = f->fmt.pix_mp.plane_fmt[0].sizeimage;
>> +	}
>> +
>> +unlock:
>> +	mutex_unlock(&inst->lock);
>> +
>> +	return ret;
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.h b/drivers/media/platform/qcom/iris/iris_vb2.h
>> new file mode 100644
>> index 000000000000..78157a97b86e
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.h
>> @@ -0,0 +1,12 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef _IRIS_VB2_H_
>> +#define _IRIS_VB2_H_
>> +
>> +int iris_vb2_queue_setup(struct vb2_queue *q,
>> +			 unsigned int *num_buffers, unsigned int *num_planes,
>> +			 unsigned int sizes[], struct device *alloc_devs[]);
>> +#endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
>> new file mode 100644
>> index 000000000000..7d1ef31c7c44
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -0,0 +1,58 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include "iris_buffer.h"
>> +#include "iris_instance.h"
>> +#include "iris_vdec.h"
>> +#include "iris_vpu_buffer.h"
>> +
>> +#define DEFAULT_WIDTH 320
>> +#define DEFAULT_HEIGHT 240
>> +
>> +void iris_vdec_inst_init(struct iris_inst *inst)
>> +{
>> +	struct v4l2_format *f;
>> +
>> +	inst->fmt_src  = kzalloc(sizeof(*inst->fmt_src), GFP_KERNEL);
>> +	inst->fmt_dst  = kzalloc(sizeof(*inst->fmt_dst), GFP_KERNEL);
>> +
>> +	inst->fw_min_count = MIN_BUFFERS;
>> +
>> +	f = inst->fmt_src;
>> +	f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>> +	f->fmt.pix_mp.width = DEFAULT_WIDTH;
>> +	f->fmt.pix_mp.height = DEFAULT_HEIGHT;
>> +	f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_H264;
>> +	f->fmt.pix_mp.num_planes = 1;
>> +	f->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
>> +	f->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_INPUT);
>> +	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
>> +	inst->buffers[BUF_INPUT].min_count = iris_vpu_buf_count(inst, BUF_INPUT);
>> +	inst->buffers[BUF_INPUT].actual_count = inst->buffers[BUF_INPUT].min_count;
>> +	inst->buffers[BUF_INPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
>> +
>> +	f = inst->fmt_dst;
>> +	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>> +	f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_NV12;
>> +	f->fmt.pix_mp.width = ALIGN(DEFAULT_WIDTH, 128);
>> +	f->fmt.pix_mp.height = ALIGN(DEFAULT_HEIGHT, 32);
>> +	f->fmt.pix_mp.num_planes = 1;
>> +	f->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(DEFAULT_WIDTH, 128);
>> +	f->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
>> +	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
>> +	f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_DEFAULT;
>> +	f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
>> +	f->fmt.pix_mp.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>> +	f->fmt.pix_mp.quantization = V4L2_QUANTIZATION_DEFAULT;
>> +	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
>> +	inst->buffers[BUF_OUTPUT].actual_count = inst->buffers[BUF_OUTPUT].min_count;
>> +	inst->buffers[BUF_OUTPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
>> +}
>> +
>> +void iris_vdec_inst_deinit(struct iris_inst *inst)
>> +{
>> +	kfree(inst->fmt_dst);
>> +	kfree(inst->fmt_src);
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
>> new file mode 100644
>> index 000000000000..0324d7f796dd
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef _IRIS_VDEC_H_
>> +#define _IRIS_VDEC_H_
>> +
>> +struct iris_inst;
>> +
>> +void iris_vdec_inst_init(struct iris_inst *inst);
>> +void iris_vdec_inst_deinit(struct iris_inst *inst);
>> +
>> +#endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index b8654e73f516..b1a9f0b5380d 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -9,6 +9,8 @@
>>  
>>  #include "iris_vidc.h"
>>  #include "iris_instance.h"
>> +#include "iris_vdec.h"
>> +#include "iris_vb2.h"
>>  #include "iris_platform_common.h"
>>  
>>  #define IRIS_DRV_NAME "iris_driver"
>> @@ -28,6 +30,38 @@ static void iris_v4l2_fh_deinit(struct iris_inst *inst)
>>  	v4l2_fh_exit(&inst->fh);
>>  }
>>  
>> +static void iris_add_session(struct iris_inst *inst)
>> +{
>> +	struct iris_core *core = inst->core;
>> +	struct iris_inst *iter;
>> +	u32 count = 0;
>> +
>> +	mutex_lock(&core->lock);
>> +
>> +	list_for_each_entry(iter, &core->instances, list)
>> +		count++;
>> +
>> +	if (count < core->iris_platform_data->max_session_count)
>> +		list_add_tail(&inst->list, &core->instances);
>> +
>> +	mutex_unlock(&core->lock);
>> +}
>> +
>> +static void iris_remove_session(struct iris_inst *inst)
>> +{
>> +	struct iris_core *core = inst->core;
>> +	struct iris_inst *iter, *temp;
>> +
>> +	mutex_lock(&core->lock);
>> +	list_for_each_entry_safe(iter, temp, &core->instances, list) {
>> +		if (iter->session_id == inst->session_id) {
>> +			list_del_init(&iter->list);
>> +			break;
>> +		}
>> +	}
>> +	mutex_unlock(&core->lock);
>> +}
>> +
>>  static inline struct iris_inst *iris_get_inst(struct file *filp, void *fh)
>>  {
>>  	return container_of(filp->private_data, struct iris_inst, fh);
>> @@ -59,7 +93,9 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
>>  	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
>>  	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>>  	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>> +	src_vq->ops = inst->core->iris_vb2_ops;
>>  	src_vq->drv_priv = inst;
>> +	src_vq->buf_struct_size = sizeof(struct iris_buffer);
>>  	src_vq->dev = inst->core->dev;
>>  	src_vq->lock = &inst->ctx_q_lock;
>>  	ret = vb2_queue_init(src_vq);
>> @@ -69,7 +105,9 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
>>  	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>>  	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>>  	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>> +	dst_vq->ops = inst->core->iris_vb2_ops;
>>  	dst_vq->drv_priv = inst;
>> +	dst_vq->buf_struct_size = sizeof(struct iris_buffer);
>>  	dst_vq->dev = inst->core->dev;
>>  	dst_vq->lock = &inst->ctx_q_lock;
>>  
>> @@ -100,8 +138,11 @@ int iris_open(struct file *filp)
>>  		return -ENOMEM;
>>  
>>  	inst->core = core;
>> +	inst->session_id = hash32_ptr(inst);
>>  
>> +	mutex_init(&inst->lock);
>>  	mutex_init(&inst->ctx_q_lock);
>> +	init_completion(&inst->completion);
>>  
>>  	iris_v4l2_fh_init(inst);
>>  
>> @@ -117,6 +158,10 @@ int iris_open(struct file *filp)
>>  		goto fail_m2m_release;
>>  	}
>>  
>> +	iris_vdec_inst_init(inst);
>> +
>> +	iris_add_session(inst);
>> +
>>  	inst->fh.m2m_ctx = inst->m2m_ctx;
>>  	filp->private_data = &inst->fh;
>>  
>> @@ -127,19 +172,42 @@ int iris_open(struct file *filp)
>>  fail_v4l2_fh_deinit:
>>  	iris_v4l2_fh_deinit(inst);
>>  	mutex_destroy(&inst->ctx_q_lock);
>> +	mutex_destroy(&inst->lock);
>>  	kfree(inst);
>>  
>>  	return ret;
>>  }
>>  
>> +static void iris_session_close(struct iris_inst *inst)
>> +{
>> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>> +	bool wait_for_response = true;
>> +	int ret;
>> +
>> +	reinit_completion(&inst->completion);
>> +
>> +	ret = hfi_ops->session_close(inst);
>> +	if (ret)
>> +		wait_for_response = false;
>> +
>> +	if (wait_for_response)
>> +		iris_wait_for_session_response(inst);
>> +}
>> +
>>  int iris_close(struct file *filp)
>>  {
>>  	struct iris_inst *inst = iris_get_inst(filp, NULL);
>>  
>>  	v4l2_m2m_ctx_release(inst->m2m_ctx);
>>  	v4l2_m2m_release(inst->m2m_dev);
>> +	mutex_lock(&inst->lock);
>> +	iris_vdec_inst_deinit(inst);
>> +	iris_session_close(inst);
>>  	iris_v4l2_fh_deinit(inst);
>> +	iris_remove_session(inst);
>> +	mutex_unlock(&inst->lock);
>>  	mutex_destroy(&inst->ctx_q_lock);
>> +	mutex_destroy(&inst->lock);
>>  	kfree(inst);
>>  	filp->private_data = NULL;
>>  
>> @@ -155,7 +223,17 @@ static struct v4l2_file_operations iris_v4l2_file_ops = {
>>  	.mmap                           = v4l2_m2m_fop_mmap,
>>  };
>>  
>> +static const struct vb2_ops iris_vb2_ops = {
>> +	.queue_setup                    = iris_vb2_queue_setup,
>> +};
>> +
>> +static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
>> +	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
> 
> Add create_bufs here as well. And you might also consider adding support for remove_bufs.
> 
> (but perhaps this is done in later patches).
> 
Right, we are implementing vidioc_create_bufs in later patches, but do we
need remove_bufs as well?

>> +};
>> +
>>  void iris_init_ops(struct iris_core *core)
>>  {
>>  	core->iris_v4l2_file_ops = &iris_v4l2_file_ops;
>> +	core->iris_vb2_ops = &iris_vb2_ops;
>> +	core->iris_v4l2_ioctl_ops = &iris_v4l2_ioctl_ops;
>>  }
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> new file mode 100644
>> index 000000000000..2402a33723ab
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> @@ -0,0 +1,19 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include "iris_instance.h"
>> +#include "iris_vpu_buffer.h"
>> +
>> +int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type)
>> +{
>> +	switch (buffer_type) {
>> +	case BUF_INPUT:
>> +		return MIN_BUFFERS;
>> +	case BUF_OUTPUT:
>> +		return inst->fw_min_count;
>> +	default:
>> +		return 0;
>> +	}
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> new file mode 100644
>> index 000000000000..f0f974cebd8a
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef _IRIS_VPU_BUFFER_H_
>> +#define _IRIS_VPU_BUFFER_H_
>> +
>> +struct iris_inst;
>> +
>> +#define MIN_BUFFERS			4
>> +
>> +int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>> +
>> +#endif
>>
> 
> Regards,
> 
> 	Hans
Thanks,
Dikshita

