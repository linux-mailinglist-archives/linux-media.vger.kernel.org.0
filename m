Return-Path: <linux-media+bounces-20294-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A72F9AFA9A
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 09:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A53D31F22EE1
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 07:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50FD1B2EEB;
	Fri, 25 Oct 2024 07:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P4LubVhT"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89BD1AD3F5;
	Fri, 25 Oct 2024 07:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729839992; cv=none; b=as75fhQGGvjI4HRu3Rj5QM+QEoDMXFaKqv3ORU+E/R2WKsgXDNx8mS+YOajm0oR3YbABMEu0+GTUw/jeUKhXwMp8RzwIE6rIuUV6UCvuEYc1ypER5awX7nD/64czIIMOAe+cWm/3DS4OgmUMKeiUUR2bftz7BtCBo5DatjcaIjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729839992; c=relaxed/simple;
	bh=aW6nF5nbjqnDf2gKWctXLmLzglSWAjiTYtjxNmcssBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QLWbZ17H3LAuwPgIicba+NQNM7gr5X5X+ipbGmqG23KvjxEwIaNwpwet/dYzLgohmxgj5zdMHlLOAeTvEcDd2Uef0G5T9zageV2aspTEwst4MAHhgW8fNQlSp1NMZJjpxQt6vHH/L8zWk/cJLJzal4PkD4uTlk/yyWM+CO0Jq60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P4LubVhT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OM8nZl032117;
	Fri, 25 Oct 2024 07:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PeZfDPLYmvD7Ho29OCzvQoO+HEgqYvKkcRET85OGnL4=; b=P4LubVhThHQEIvSI
	q50pL4EL+aDGlFJ+q1ZcHoQ7QozXnNWT2AqMNUSJAW43eJ2ACApJISteU6JAykJT
	1uc/QRqSRqWw6QYJEF1Vv+hjqwSCUFXD8Qid0nW8q+i+DmMJ+Cggpf7jnaNcjqJQ
	o+7RTZ6EUHVtTEXPn/U8Xvdy2X8D5G/ShD2Kidj9x2/n3Vny5VQpzEa4FBHvh6CB
	y7lxi14JYAW8qGPm8p31N9COZ2Gjy0kNT4Jag9oUynFcWIG1mPh+ixEVCwDvygwY
	q+/wzeavstDH8VdA8Cg5mXXXcIX41acTGwf1vM6yp96Wj+AtCLFsA/tWo9K/vwtf
	rBb/PA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w04nd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 07:06:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P76KmA024448
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 07:06:20 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Oct
 2024 00:06:16 -0700
Message-ID: <5352bc86-61d2-cf69-f608-6f6de3cfe8f5@quicinc.com>
Date: Fri, 25 Oct 2024 12:36:13 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 16/28] media: iris: implement vb2 streaming ops
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
 <20241014-qcom-video-iris-v4-v4-16-c5eaa4e9ab9e@quicinc.com>
 <59047df4-1e5f-488f-a134-f8bad7cf655c@xs4all.nl>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <59047df4-1e5f-488f-a134-f8bad7cf655c@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: d2pajItHgeRvqZLm08k-63NOAg-5nyPz
X-Proofpoint-ORIG-GUID: d2pajItHgeRvqZLm08k-63NOAg-5nyPz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250054



On 10/23/2024 4:43 PM, Hans Verkuil wrote:
> On 14/10/2024 11:07, Dikshita Agarwal wrote:
>> In stream on, send HFI_CMD_START on capture and
>> output planes to start the processing on respective planes.
>>
>> During stream off, send HFI_CMD_STOP to firmware which is
>> a synchronous command. After the response is received from
>> firmware, the session is closed on firmware.
>>
>> Introduce different states for instance and state transitions.
>>
>> IRIS_INST_INIT - video instance is opened.
>> IRIS_INST_INPUT_STREAMING - stream on is completed on output plane.
>> IRIS_INST_OUTPUT_STREAMING - stream on is completed on capture
>> plane.
>> IRIS_INST_STREAMING - stream on is completed on both output and
>> capture planes.
>> IRIS_INST_DEINIT - video instance is closed.
>> IRIS_INST_ERROR - error state.
>>
>>                    |
>>                    v
>>             -------------
>>   +---------|   INIT    |---------  +
>>   |         -------------           |
>>   |            ^    ^               |
>>   |           /      \              |
>>   |          /        \             |
>>   |         v          v            |
>>   |    -----------    -----------   |
>>   |   |   INPUT         OUTPUT  |   |
>>   |---| STREAMING     STREAMING |---|
>>   |    -----------    -----------   |
>>   |        ^            ^           |
>>   |         \          /            |
>>   |          \        /             |
>>   |           v      v              |
>>   |         -------------           |
>>   |--------|  STREAMING |-----------|
>>   |         -------------           |
>>   |               |                 |
>>   |               |                 |
>>   |               v                 |
>>   |          -----------            |
>>   +-------->|  DEINIT   |<----------+
>>   |          -----------            |
>>   |               |                 |
>>   |               |                 |
>>   |               v                 |
>>   |          ----------             |
>>   +-------->|   ERROR  |<-----------+
>>              ----------.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/iris/Makefile          |   1 +
>>  drivers/media/platform/qcom/iris/iris_hfi_common.h |   2 +
>>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  82 +++++++++++++++-
>>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  24 +++++
>>  .../platform/qcom/iris/iris_hfi_gen1_response.c    |  39 +++++++-
>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |  61 ++++++++++++
>>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   2 +
>>  .../platform/qcom/iris/iris_hfi_gen2_response.c    |  32 ++++++-
>>  drivers/media/platform/qcom/iris/iris_instance.h   |   4 +
>>  drivers/media/platform/qcom/iris/iris_state.c      | 104 +++++++++++++++++++++
>>  drivers/media/platform/qcom/iris/iris_state.h      |  58 ++++++++++++
>>  drivers/media/platform/qcom/iris/iris_utils.c      |  11 ++-
>>  drivers/media/platform/qcom/iris/iris_utils.h      |   2 +-
>>  drivers/media/platform/qcom/iris/iris_vb2.c        |  70 ++++++++++++++
>>  drivers/media/platform/qcom/iris/iris_vb2.h        |   3 +
>>  drivers/media/platform/qcom/iris/iris_vdec.c       |  75 +++++++++++++++
>>  drivers/media/platform/qcom/iris/iris_vdec.h       |   3 +
>>  drivers/media/platform/qcom/iris/iris_vidc.c       |  32 ++++++-
>>  18 files changed, 593 insertions(+), 12 deletions(-)
>>
> 
> <snip>
> 
>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
>> index f89891e52fde..75c1364709d1 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
>> @@ -6,6 +6,7 @@
>>  #include "iris_buffer.h"
>>  #include "iris_instance.h"
>>  #include "iris_vb2.h"
>> +#include "iris_vdec.h"
>>  #include "iris_vpu_buffer.h"
>>  
>>  int iris_vb2_queue_setup(struct vb2_queue *q,
>> @@ -22,6 +23,10 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
>>  	inst = vb2_get_drv_priv(q);
>>  
>>  	mutex_lock(&inst->lock);
>> +	if (inst->state == IRIS_INST_ERROR) {
>> +		ret = -EBUSY;
>> +		goto unlock;
>> +	}
>>  
>>  	core = inst->core;
>>  	f = V4L2_TYPE_IS_OUTPUT(q->type) ? inst->fmt_src : inst->fmt_dst;
>> @@ -49,6 +54,10 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
>>  			dev_err(core->dev, "session open failed\n");
>>  			goto unlock;
>>  		}
>> +
>> +		ret = iris_inst_change_state(inst, IRIS_INST_INIT);
>> +		if (ret)
>> +			goto unlock;
>>  	}
>>  
>>  	buffers = &inst->buffers[buffer_type];
>> @@ -75,3 +84,64 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
>>  
>>  	return ret;
>>  }
>> +
>> +int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
>> +{
>> +	struct iris_inst *inst;
>> +	int ret = 0;
>> +
>> +	inst = vb2_get_drv_priv(q);
>> +
>> +	if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->state == IRIS_INST_INIT)
>> +		return 0;
>> +
>> +	mutex_lock(&inst->lock);
>> +	if (inst->state == IRIS_INST_ERROR) {
>> +		ret = -EBUSY;
> 
> If an error occurs during start_streaming, then all queued buffers must be
> returned to vb2 in state VB2_BUF_STATE_QUEUED.
> 
>> +		goto error;
>> +	}
>> +
>> +	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
>> +	    !V4L2_TYPE_IS_CAPTURE(q->type)) {
>> +		ret = -EINVAL;
>> +		goto error;
>> +	}
>> +
>> +	if (V4L2_TYPE_IS_OUTPUT(q->type))
>> +		ret = iris_vdec_streamon_input(inst);
>> +	else if (V4L2_TYPE_IS_CAPTURE(q->type))
>> +		ret = iris_vdec_streamon_output(inst);
>> +	if (ret)
>> +		goto error;
>> +
>> +	mutex_unlock(&inst->lock);
>> +
>> +	return ret;
>> +
>> +error:
>> +	iris_inst_change_state(inst, IRIS_INST_ERROR);
>> +	mutex_unlock(&inst->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +void iris_vb2_stop_streaming(struct vb2_queue *q)
>> +{
>> +	struct iris_inst *inst;
>> +
>> +	inst = vb2_get_drv_priv(q);
>> +
>> +	if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->state == IRIS_INST_INIT)
>> +		return;
>> +
>> +	mutex_lock(&inst->lock);
>> +
>> +	if (!V4L2_TYPE_IS_OUTPUT(q->type) &&
>> +	    !V4L2_TYPE_IS_CAPTURE(q->type))
>> +		goto exit;
>> +
>> +	iris_vdec_session_streamoff(inst, q->type);
>> +
>> +exit:
> 
> stop_streaming must return all queued buffers to vb2 in state VB2_BUF_STATE_ERROR.
> 
>> +	mutex_unlock(&inst->lock);
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.h b/drivers/media/platform/qcom/iris/iris_vb2.h
>> index 78157a97b86e..bc3bb830c2ba 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vb2.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vb2.h
>> @@ -9,4 +9,7 @@
>>  int iris_vb2_queue_setup(struct vb2_queue *q,
>>  			 unsigned int *num_buffers, unsigned int *num_planes,
>>  			 unsigned int sizes[], struct device *alloc_devs[]);
>> +int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count);
>> +void iris_vb2_stop_streaming(struct vb2_queue *q);
>> +
>>  #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index 66a54771b9e8..44372e2811c3 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -241,3 +241,78 @@ int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_su
>>  
>>  	return ret;
>>  }
>> +
>> +static void iris_vdec_kill_session(struct iris_inst *inst)
>> +{
>> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>> +
>> +	if (!inst->session_id)
>> +		return;
>> +
>> +	hfi_ops->session_close(inst);
>> +	iris_inst_change_state(inst, IRIS_INST_ERROR);
>> +}
>> +
>> +void iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane)
>> +{
>> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>> +	int ret;
>> +
>> +	ret = hfi_ops->session_stop(inst, plane);
>> +	if (ret)
>> +		goto error;
>> +
>> +	ret = iris_inst_state_change_streamoff(inst, plane);
>> +	if (ret)
>> +		goto error;
>> +
>> +	return;
>> +
>> +error:
>> +	iris_vdec_kill_session(inst);
>> +}
>> +
>> +static int iris_vdec_process_streamon_input(struct iris_inst *inst)
>> +{
>> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>> +	int ret;
>> +
>> +	ret = hfi_ops->session_start(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return iris_inst_state_change_streamon(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> +}
>> +
>> +int iris_vdec_streamon_input(struct iris_inst *inst)
>> +{
>> +	return iris_vdec_process_streamon_input(inst);
>> +}
>> +
>> +static int iris_vdec_process_streamon_output(struct iris_inst *inst)
>> +{
>> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>> +	int ret;
>> +
>> +	ret = hfi_ops->session_start(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return iris_inst_state_change_streamon(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +}
>> +
>> +int iris_vdec_streamon_output(struct iris_inst *inst)
>> +{
>> +	int ret;
>> +
>> +	ret = iris_vdec_process_streamon_output(inst);
>> +	if (ret)
>> +		goto error;
>> +
>> +	return ret;
>> +
>> +error:
>> +	iris_vdec_session_streamoff(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +
>> +	return ret;
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
>> index d7b8a0ad6fa8..b3299164f823 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.h
>> @@ -14,5 +14,8 @@ int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
>>  int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
>>  int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
>>  int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
>> +int iris_vdec_streamon_input(struct iris_inst *inst);
>> +int iris_vdec_streamon_output(struct iris_inst *inst);
>> +void iris_vdec_session_streamoff(struct iris_inst *inst, u32 plane);
>>  
>>  #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index 60ee05b67f86..615f57bfaddc 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -142,10 +142,12 @@ int iris_open(struct file *filp)
>>  
>>  	inst->core = core;
>>  	inst->session_id = hash32_ptr(inst);
>> +	inst->state = IRIS_INST_DEINIT;
>>  
>>  	mutex_init(&inst->lock);
>>  	mutex_init(&inst->ctx_q_lock);
>>  	init_completion(&inst->completion);
>> +	init_completion(&inst->flush_completion);
>>  
>>  	iris_v4l2_fh_init(inst);
>>  
>> @@ -191,6 +193,9 @@ static void iris_session_close(struct iris_inst *inst)
>>  	bool wait_for_response = true;
>>  	int ret;
>>  
>> +	if (inst->state == IRIS_INST_DEINIT)
>> +		return;
>> +
>>  	reinit_completion(&inst->completion);
>>  
>>  	ret = hfi_ops->session_close(inst);
>> @@ -198,7 +203,7 @@ static void iris_session_close(struct iris_inst *inst)
>>  		wait_for_response = false;
>>  
>>  	if (wait_for_response)
>> -		iris_wait_for_session_response(inst);
>> +		iris_wait_for_session_response(inst, false);
>>  }
>>  
>>  int iris_close(struct file *filp)
>> @@ -211,6 +216,7 @@ int iris_close(struct file *filp)
>>  	mutex_lock(&inst->lock);
>>  	iris_vdec_inst_deinit(inst);
>>  	iris_session_close(inst);
>> +	iris_inst_change_state(inst, IRIS_INST_DEINIT);
>>  	iris_v4l2_fh_deinit(inst);
>>  	iris_remove_session(inst);
>>  	mutex_unlock(&inst->lock);
>> @@ -238,7 +244,14 @@ static int iris_try_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_form
>>  	int ret;
>>  
>>  	mutex_lock(&inst->lock);
>> +	if (inst->state == IRIS_INST_ERROR) {
>> +		ret = -EBUSY;
>> +		goto unlock;
>> +	}
> 
> Why this check? You should be able to try a format at any time.
> 
That's correct, will remove the state check from here.
>> +
>>  	ret = iris_vdec_try_fmt(inst, f);
>> +
>> +unlock:
>>  	mutex_unlock(&inst->lock);
>>  
>>  	return ret;
>> @@ -250,7 +263,14 @@ static int iris_s_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
>>  	int ret;
>>  
>>  	mutex_lock(&inst->lock);
>> +	if (inst->state == IRIS_INST_ERROR) {
>> +		ret = -EBUSY;
>> +		goto unlock;
>> +	}
I think it should be ok to remove check from s_fmt as well.
>> +
>>  	ret = iris_vdec_s_fmt(inst, f);
>> +
>> +unlock:
>>  	mutex_unlock(&inst->lock);
>>  
>>  	return ret;
>> @@ -262,6 +282,11 @@ static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
>>  	int ret = 0;
>>  
>>  	mutex_lock(&inst->lock);
>> +	if (inst->state == IRIS_INST_ERROR) {
>> +		ret = -EBUSY;
>> +		goto unlock;
>> +	}
> 
> Same question, this should be fine at any time.
> 
Sure, will remove

Thanks,
Dikshita
>> +
>>  	if (V4L2_TYPE_IS_OUTPUT(f->type))
>>  		memcpy(f, inst->fmt_src, sizeof(*f));
>>  	else if (V4L2_TYPE_IS_CAPTURE(f->type))
>> @@ -269,6 +294,7 @@ static int iris_g_fmt_vid_mplane(struct file *filp, void *fh, struct v4l2_format
>>  	else
>>  		ret = -EINVAL;
>>  
>> +unlock:
>>  	mutex_unlock(&inst->lock);
>>  
>>  	return ret;
>> @@ -402,6 +428,8 @@ static struct v4l2_file_operations iris_v4l2_file_ops = {
>>  
>>  static const struct vb2_ops iris_vb2_ops = {
>>  	.queue_setup                    = iris_vb2_queue_setup,
>> +	.start_streaming                = iris_vb2_start_streaming,
>> +	.stop_streaming                 = iris_vb2_stop_streaming,
>>  };
>>  
>>  static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
>> @@ -421,6 +449,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
>>  	.vidioc_g_selection             = iris_g_selection,
>>  	.vidioc_subscribe_event         = iris_subscribe_event,
>>  	.vidioc_unsubscribe_event       = iris_unsubscribe_event,
>> +	.vidioc_streamon                = v4l2_m2m_ioctl_streamon,
>> +	.vidioc_streamoff               = v4l2_m2m_ioctl_streamoff,
>>  };
>>  
>>  void iris_init_ops(struct iris_core *core)
>>
> 

