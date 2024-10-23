Return-Path: <linux-media+bounces-20114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4669AC9A0
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 14:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E1AC1C21296
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 12:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34C71ABEA6;
	Wed, 23 Oct 2024 12:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XVjgGrXj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75501136331;
	Wed, 23 Oct 2024 12:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729685006; cv=none; b=fg1GIqxb+Uy+eMhPHzVI3vHGdraz0GANz6HAx0aSr3mJluPrQhj0zhMlmixO1Y5UpRfXWjXG++V9oZ21bI9NslusLuxduP5XdmvOuB0F0WlWgHHdJtXM/ePLCdtzT/yBCMfwTJ5APSgfLw087O1FkHupcd27nww8bsCko2gagss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729685006; c=relaxed/simple;
	bh=eele/57XKY9bv00R4K4r1mo5QL7zPd3G0vCQcvof9yA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tG53RwyC84avHKARoNWBPlmhCVir47XH/6n0puZ9XkwWnG7LeIfiMejuSyUkhE8vaM0kxHrxJyVQ+SABQTqW0CiZ37qKAwMc7ReAWhDRRsxQH+RwgJ2qkv/LiVJKY1oGbwKTahVZO+mFwuE91NrSkHDHb/vm+4sWrw/HLlnCf4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XVjgGrXj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9c5Oj025865;
	Wed, 23 Oct 2024 12:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FhpdeXtFYgey3o8AnFXZDdGucTpvXx8nGhlJuK27hOk=; b=XVjgGrXja1T4CxQa
	J4HB5UI2crA6CXxIPrtD/Xg5ZD5/Hp+8l0BRdSlo7cNw2kVeNusqPXHszTsWzw1+
	nQHCM7WT7W+xnS6wnY2zg3meSZl6mrO3ZdCTMItpZHElu50IwrwapNwgr8flpjfy
	6sXuzf5QEw0tmdFzP+DECTZS/2klNj0cnRq1C9eGePgd/vBbn0wXOQy9Zku5q5ZG
	N9d4HZSM4q5ApGwHCtItB7vAWkhNCXKbQLo+tnNzswFCp3F1u4Zd6Z1qpiGpwvR/
	9sVPki/ZZ78PfMl10VkzmywvJh65z9R+igl06PtHVKJ0EwcbPAlnpelpldYvhZqQ
	rXOHPw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3wj1y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 12:03:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NC3D8G027985
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 12:03:13 GMT
Received: from [10.216.48.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 05:03:09 -0700
Message-ID: <c14da815-b033-1de7-f56d-86cf92103eb9@quicinc.com>
Date: Wed, 23 Oct 2024 17:33:06 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 13/28] media: iris: implement subscribe_event and
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
        <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vedang Nagar
	<quic_vnagar@quicinc.com>
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
 <20241014-qcom-video-iris-v4-v4-13-c5eaa4e9ab9e@quicinc.com>
 <990813bb-05b8-48e7-af00-e07de6836a17@xs4all.nl>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <990813bb-05b8-48e7-af00-e07de6836a17@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jWHqx0papxzt4RdZru4VR-VsrNMcUe4f
X-Proofpoint-ORIG-GUID: jWHqx0papxzt4RdZru4VR-VsrNMcUe4f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230071



On 10/23/2024 4:23 PM, Hans Verkuil wrote:
> On 14/10/2024 11:07, Dikshita Agarwal wrote:
>> From: Vedang Nagar <quic_vnagar@quicinc.com>
>>
>> Implement subscribe_event and unsubscribe_event iocts
>> with necessary hooks.
>>
>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_instance.h |  2 ++
>>  drivers/media/platform/qcom/iris/iris_vdec.c     | 26 ++++++++++++++++++++++++
>>  drivers/media/platform/qcom/iris/iris_vdec.h     |  1 +
>>  drivers/media/platform/qcom/iris/iris_vidc.c     | 17 ++++++++++++++++
>>  4 files changed, 46 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
>> index bb43119af352..d28b8fd7ec2f 100644
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
>> index fd0f1ebc33e8..c4eeba5ed6da 100644
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
>> @@ -13,6 +14,7 @@
>>  #define DEFAULT_WIDTH 320
>>  #define DEFAULT_HEIGHT 240
>>  #define DEFAULT_CODEC_ALIGNMENT 16
>> +#define MAX_EVENTS 30
>>  
>>  void iris_vdec_inst_init(struct iris_inst *inst)
>>  {
>> @@ -208,3 +210,27 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
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
>> +		ret = v4l2_event_subscribe(&inst->fh, sub, MAX_EVENTS, NULL);
> 
> Why 30 events? EOS needs has to store just 1 event. I'd just drop MAX_EVENTS and
> fill in 0 or 1 here.
> 
Okay, will update it with 0.
>> +		inst->subscriptions |= V4L2_EVENT_EOS;
>> +		break;
>> +	case V4L2_EVENT_SOURCE_CHANGE:
>> +		ret = v4l2_src_change_event_subscribe(&inst->fh, sub);
>> +		inst->subscriptions |= V4L2_EVENT_SOURCE_CHANGE;
>> +		break;
>> +	case V4L2_EVENT_CTRL:
>> +		ret = v4l2_ctrl_subscribe_event(&inst->fh, sub);
>> +		inst->subscriptions |= V4L2_EVENT_CTRL;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return ret;
>> +}
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
>> index eb8a1121ae92..707fff34bf4d 100644
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
>> index 1d6c5e8fafb4..8068c06c1f11 100644
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
>> @@ -320,6 +321,20 @@ static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *
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
>> +static int iris_unsubscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subscription *sub)
>> +{
>> +	struct iris_inst *inst = container_of(fh, struct iris_inst, fh);
>> +
>> +	return v4l2_event_unsubscribe(&inst->fh, sub);
>> +}
>> +
>>  static struct v4l2_file_operations iris_v4l2_file_ops = {
>>  	.owner                          = THIS_MODULE,
>>  	.open                           = iris_open,
>> @@ -345,6 +360,8 @@ static const struct v4l2_ioctl_ops iris_v4l2_ioctl_ops = {
>>  	.vidioc_enum_framesizes         = iris_enum_framesizes,
>>  	.vidioc_reqbufs                 = v4l2_m2m_ioctl_reqbufs,
>>  	.vidioc_g_selection             = iris_g_selection,
>> +	.vidioc_subscribe_event         = iris_subscribe_event,
>> +	.vidioc_unsubscribe_event       = iris_unsubscribe_event,
> 
> Just set this op to v4l2_event_unsubscribe directly. You should not need a
> driver specific override function.
> 
Ah, you're right, will update.
>>  };
>>  
>>  void iris_init_ops(struct iris_core *core)
>>
> 

