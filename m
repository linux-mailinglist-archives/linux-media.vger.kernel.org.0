Return-Path: <linux-media+bounces-22866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A6C9E8EDB
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 10:37:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58C3A188430B
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 09:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4437216391;
	Mon,  9 Dec 2024 09:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gB2CjFIq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82506215043;
	Mon,  9 Dec 2024 09:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733737055; cv=none; b=DATVPRTxnJ8BDCv0W2XEzikOxmgIS4Bb1g7DNWNy4Zc/wEniDszW4AjmKrZ5S/fVYtT13NgwH220S9pwXHkAKgb5g9rzdr6crXBZezRw9g5m70EkKY4g3cBPydiDVsO+oC0q2VybpYUCO53Pa4Vl7OhCV5wMRjD0blabm9eAPVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733737055; c=relaxed/simple;
	bh=RxRYBLw+WWgYQmSch/46WqGOUDRCWArKJMBsXiWOQO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AkIdo6uYHo8RHxfEfxKJcLKX0n8WkoxIx0ZX7KPIS8Ag+7aX/VLWp9ROZ+SjrDgC4RAeQF4ioirsO4IQwTRVFexxk3cSKSED3Hh4uzjbOq3q7kb0ro/PkkUenyzDe7QW8vt32eGiWb8XxYPZCUUYUVozdKD/k77apStFHE7zLwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gB2CjFIq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8MEiDY029735;
	Mon, 9 Dec 2024 09:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RxW8/76/P1EEJrSeXhAOpajkRfvw7QIqIdReTGQV3/I=; b=gB2CjFIqFT19xcWF
	MJoKhXP1LX69+2TruZ4bdQSZOzoD/Wb1UjmR7kfXSLhzWXFoSx3uc0gfSlMtlEVy
	4QnnwDD18tkAWfgd3FXB1AoAOyU9TZjmYhizny78j6jvg7NKcoKZ/s0+H/rAPGmf
	C8NjJVvbhUA/0UxjWBDmiVITR1uSfahx+X64V9aetaMJdVQxSMEd+p7Q+yBbdJ6A
	QhkSeeLwUQGO0ciVFym6S4pt/CWQbrEIvOsnjTjz+KVNhlFUPiv0bJEQy+ocVKBT
	GHThqqA2DnTjGIh5bAhVpEqW5HX5Ptt+e8WODsLuinKi8YeyDireLPajEd/RS5yw
	DAEo/w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ceetm3gh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 09:37:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B99bKvA011615
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 09:37:20 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 01:37:14 -0800
Message-ID: <2a113de9-3442-8868-190c-3b361c073a26@quicinc.com>
Date: Mon, 9 Dec 2024 15:07:11 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 13/28] media: iris: implement subscribe_event and
 unsubscribe_event ioctls
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
 <20241120-qcom-video-iris-v6-13-a8cf6704e992@quicinc.com>
 <280982a6-8e62-44f8-962b-a126b966a9d1@xs4all.nl>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <280982a6-8e62-44f8-962b-a126b966a9d1@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fj8QFKNtw43bCly9cTNDcSJkUehu7O66
X-Proofpoint-ORIG-GUID: fj8QFKNtw43bCly9cTNDcSJkUehu7O66
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090075



On 12/6/2024 3:24 PM, Hans Verkuil wrote:
> On 20/11/2024 15:46, Dikshita Agarwal wrote:
>> From: Vedang Nagar <quic_vnagar@quicinc.com>
>>
>> Implement subscribe_event and unsubscribe_event iocts with necessary
>> hooks.
>>
>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_instance.h |  2 ++
>>  drivers/media/platform/qcom/iris/iris_vdec.c     | 25 ++++++++++++++++++++++++
>>  drivers/media/platform/qcom/iris/iris_vdec.h     |  1 +
>>  drivers/media/platform/qcom/iris/iris_vidc.c     | 10 ++++++++++
>>  4 files changed, 38 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
>> index 1e9a6075357f..ef4515d2086c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>> @@ -30,6 +30,7 @@
>>   * @once_per_session_set: boolean to set once per session property
>>   * @m2m_dev:	a reference to m2m device structure
>>   * @m2m_ctx:	a reference to m2m context structure
>> + * @subscriptions: variable to hold current events subscriptions
>>   */
>>  
>>  struct iris_inst {
>> @@ -48,6 +49,7 @@ struct iris_inst {
>>  	bool				once_per_session_set;
>>  	struct v4l2_m2m_dev		*m2m_dev;
>>  	struct v4l2_m2m_ctx		*m2m_ctx;
>> +	unsigned int			subscriptions;
>>  };
>>  
>>  #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index 742b45432481..9afeb681b7a7 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -3,6 +3,7 @@
>>   * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>   */
>>  
>> +#include <media/v4l2-event.h>
>>  #include <media/v4l2-mem2mem.h>
>>  
>>  #include "iris_buffer.h"
>> @@ -193,3 +194,27 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>>  
>>  	return 0;
>>  }
>> +
>> +int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub)
>> +{
>> +	int ret = 0;
>> +
>> +	switch (sub->type) {
>> +	case V4L2_EVENT_EOS:
>> +		ret = v4l2_event_subscribe(&inst->fh, sub, 0, NULL);
>> +		inst->subscriptions |= V4L2_EVENT_EOS;
>> +		break;
>> +	case V4L2_EVENT_SOURCE_CHANGE:
>> +		ret = v4l2_src_change_event_subscribe(&inst->fh, sub);
>> +		inst->subscriptions |= V4L2_EVENT_SOURCE_CHANGE;
>> +		break;
>> +	case V4L2_EVENT_CTRL:
>> +		ret = v4l2_ctrl_subscribe_event(&inst->fh, sub);
>> +		inst->subscriptions |= V4L2_EVENT_CTRL;
> 
> No need to keep track of which events are subscribed to. Leave that to the event
> framework.
> 
Noted, will remove.

Thanks,
Dikshita
> See also my comment to patch 20/28.
> 
> Regards,
> 
> 	Hans
> 
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return ret;
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
>> index ae456676e578..f64ce3234e6a 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.h
>> @@ -13,5 +13,6 @@ void iris_vdec_inst_deinit(struct iris_inst *inst);
>>  int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
>>  int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f);
>>  int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f);
>> +int iris_vdec_subscribe_event(struct iris_inst *inst, const struct v4l2_event_subscription *sub);
>>  
>>  #endif
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index bc77dfc2ba67..3a138172e674 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -4,6 +4,7 @@
>>   */
>>  
>>  #include <linux/pm_runtime.h>
>> +#include <media/v4l2-event.h>
>>  #include <media/v4l2-ioctl.h>
>>  #include <media/v4l2-mem2mem.h>
>>  
>> @@ -322,6 +323,13 @@ static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *
>>  	return 0;
>>  }
>>  
>> +static int iris_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subscription *sub)
>> +{
>> +	struct iris_inst *inst = container_of(fh, struct iris_inst, fh);
>> +
>> +	return iris_vdec_subscribe_event(inst, sub);
>> +}
>> +
>>  static struct v4l2_file_operations iris_v4l2_file_ops = {
>>  	.owner                          = THIS_MODULE,
>>  	.open                           = iris_open,
>> @@ -347,6 +355,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
>>  	.vidioc_enum_framesizes         = iris_enum_framesizes,
>>  	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
>>  	.vidioc_g_selection             = iris_g_selection,
>> +	.vidioc_subscribe_event         = iris_subscribe_event,
>> +	.vidioc_unsubscribe_event       = v4l2_event_unsubscribe,
>>  };
>>  
>>  void iris_init_ops(struct iris_core *core)
>>
> 

