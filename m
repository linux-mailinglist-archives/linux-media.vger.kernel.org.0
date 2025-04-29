Return-Path: <linux-media+bounces-31300-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0B6AA093D
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 13:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82A2B5A7739
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 11:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2812C1787;
	Tue, 29 Apr 2025 11:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OuS0i1R4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2EA1E231E;
	Tue, 29 Apr 2025 11:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745924864; cv=none; b=MwPK61S7BVKW+u1J0Itci4a/i3WzDSvScQf77PtHaSkhyOfKZf68dxz2uBDZOnTsEVPFtTOln4/KSKRr/Tevgcvn3X6dSdqeJwzCaPdU5bJxTvIwhAdLsxmldTiT9/p4zcwG0uYxoqaz7a2PAqUXX09ibLzsL87iGJF3uh5xtAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745924864; c=relaxed/simple;
	bh=edHPaodqaP1a0IvfwmrYg8uPUJIzGTLRmXIzXH47auI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LnS+CaHtH1wh+An9BqiBu8Lh6Wj8CcAk7MZa6r6Es4OYLBca7VmzuvSqnXqmoKphthJRvZncZjQF30Iul6j5RQKbc5JIV0v1wfgCgIQAb+irR7y2Gh9lfNa4nUGWEdvG6mE1UQ2JOPuX240GVrr/4Tc7rEuAcs6nW24cPYirqq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OuS0i1R4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9ahVV025060;
	Tue, 29 Apr 2025 11:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NDzZtGf6FWvrEA7CuuRfqNvYUMS4s9rSAmG3RPXAHfo=; b=OuS0i1R4BWeIGYyj
	SlJdYfsD+MKsiJ9hEtsFkyM0q/x3ijXQb5sOgvwy4SUvM7/jejZvUWQY2Ezs/thR
	/c1Y+xazEOIiWXwqSWCQMT5o/ftaDvoPEXWf/yHbGrFjLlYI60vM020QDeksXc0H
	JZVLXE5CkiaDOnmQKJyGejVHGzw1hQY6D5rAtXSFWRSjLrbsHbf7KG+bM6iIOfku
	1RkzF3GOxxzQtTElO3u8xZ6xNIDdQNkmNRICb3od/wjJudoPGpyejtmLoD9Wg97T
	gQ0w1ZY51Uum/L4C2VihqUm+yL64kMHFYUudjH//Zs5URDHP+yxe8R9m8dDKWWg/
	9FKtSg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqmg6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 11:07:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53TB7aPl026468
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 11:07:36 GMT
Received: from [10.50.5.200] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 04:07:28 -0700
Message-ID: <fdd9d24e-8125-c826-07c8-2054257cd167@quicinc.com>
Date: Tue, 29 Apr 2025 16:37:25 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 01/23] media: iris: Skip destroying internal buffer if
 not dequeued
Content-Language: en-US
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil
	<hverkuil@xs4all.nl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-1-3a6013ecb8a5@quicinc.com>
 <feb6f710-899c-4a10-3224-d4ad16151b9d@quicinc.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <feb6f710-899c-4a10-3224-d4ad16151b9d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA4MiBTYWx0ZWRfX4caekDd3FQCk YVrGOwDbztD124DtYdTzQCWx34uS8Ml1kTGxJiRR5D3zDiCB5Y7JQADKbsKkhaVdwgH0VKjyVYe Dk3eN2e02CADscRyFCz4t6/IuiiQ6Vv5TzF594PhRXBMpmMN4ZOv8KyV5MrC5AI96zXfqinwC1K
 WMY8/WQm+fVwZo3q09qJ8MYQU6pa5wjypCHki/9BAiOS9bp8a+FkeFEEMMQZ6YBUab93l/WnWjQ RS2uH1MebtNWLocQDb7IkR02viahtYzOaPuKQX70fOQNE8KZzHMjRfavRenKXeCm1pttfmYr2yH lknWluYEpjiL2V0AdCvv9iKg45hhJQdbbtbtE9FLAjuVXnnmra1gqIXfP3+YRAy4N20Td4X541w
 tszIr+dRvc/77Ai/bjMEjtWqFKzYxpErps/Ow3gXGo1u9JWSwg5ybxdeQzr63AAcfFd7ZrUr
X-Proofpoint-GUID: CxJpQxu2v9UwZzrvM0O8qdHI1fg2bmoS
X-Proofpoint-ORIG-GUID: CxJpQxu2v9UwZzrvM0O8qdHI1fg2bmoS
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=6810b2f9 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Lm4sJm2uzP7NxcDb3WwA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290082



On 4/29/2025 2:54 PM, Vikash Garodia wrote:
> 
> On 4/28/2025 2:58 PM, Dikshita Agarwal wrote:
>> Firmware might hold the DPB buffers for reference in case of sequence
>> change, so skip destroying buffers for which QUEUED flag is not removed.
>> Also, make sure that all buffers are released during streamoff.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_buffer.c | 37 +++++++++++++++++++++++++-
>>  drivers/media/platform/qcom/iris/iris_buffer.h |  3 ++-
>>  drivers/media/platform/qcom/iris/iris_vdec.c   |  4 +--
>>  drivers/media/platform/qcom/iris/iris_vidc.c   |  6 +++--
>>  4 files changed, 44 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index e5c5a564fcb8..606d76b10be2 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -376,7 +376,7 @@ int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buf
>>  	return 0;
>>  }
>>  
>> -int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
>> +int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool force)
>>  {
>>  	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
>>  	struct iris_buffer *buf, *next;
>> @@ -396,6 +396,14 @@ int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
>>  	for (i = 0; i < len; i++) {
>>  		buffers = &inst->buffers[internal_buf_type[i]];
>>  		list_for_each_entry_safe(buf, next, &buffers->list, list) {
>> +			/*
>> +			 * during stream on, skip destroying internal(DPB) buffer
>> +			 * if firmware did not return it.
>> +			 * during close, destroy all buffers irrespectively.
>> +			 */
>> +			if (!force && buf->attr & BUF_ATTR_QUEUED)
>> +				continue;
>> +
>>  			ret = iris_destroy_internal_buffer(inst, buf);
>>  			if (ret)
>>  				return ret;
>> @@ -446,6 +454,33 @@ static int iris_release_input_internal_buffers(struct iris_inst *inst)
>>  	return 0;
>>  }
>>  
>> +void iris_get_num_queued_internal_buffers(struct iris_inst *inst, u32 plane)
> name this iris_check_num_queued_internal_buffers..
> 
Ack.

Thanks,
Dikshita
>> +{
>> +	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
>> +	struct iris_buffer *buf, *next;
>> +	struct iris_buffers *buffers;
>> +	const u32 *internal_buf_type;
>> +	u32 internal_buffer_count, i;
>> +	u32 count = 0;
>> +
>> +	if (V4L2_TYPE_IS_OUTPUT(plane)) {
>> +		internal_buf_type = platform_data->dec_ip_int_buf_tbl;
>> +		internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
>> +	} else {
>> +		internal_buf_type = platform_data->dec_op_int_buf_tbl;
>> +		internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
>> +	}
>> +
>> +	for (i = 0; i < internal_buffer_count; i++) {
>> +		buffers = &inst->buffers[internal_buf_type[i]];
>> +		list_for_each_entry_safe(buf, next, &buffers->list, list)
>> +			count++;
>> +		if (count)
>> +			dev_err(inst->core->dev, "%d buffer of type %d not released",
>> +				count, internal_buf_type[i]);
>> +	}
>> +}
>> +
>>  int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst)
>>  {
>>  	struct iris_buffers *buffers = &inst->buffers[BUF_PERSIST];
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
>> index c36b6347b077..03a32b91cf21 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
>> @@ -106,7 +106,8 @@ void iris_get_internal_buffers(struct iris_inst *inst, u32 plane);
>>  int iris_create_internal_buffers(struct iris_inst *inst, u32 plane);
>>  int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane);
>>  int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer);
>> -int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane);
>> +int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool force);
>> +void iris_get_num_queued_internal_buffers(struct iris_inst *inst, u32 plane);
> make this static
> 
> Regards,
> Vikash
>>  int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst);
>>  int iris_alloc_and_queue_input_int_bufs(struct iris_inst *inst);
>>  int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index 4143acedfc57..2c1a7162d2da 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -408,7 +408,7 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
>>  
>>  	iris_get_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>>  
>> -	ret = iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> +	ret = iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE, false);
>>  	if (ret)
>>  		return ret;
>>  
>> @@ -496,7 +496,7 @@ int iris_vdec_streamon_output(struct iris_inst *inst)
>>  
>>  	iris_get_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>>  
>> -	ret = iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +	ret = iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, false);
>>  	if (ret)
>>  		return ret;
>>  
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index ca0f4e310f77..56531a7f0dfe 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -233,8 +233,10 @@ int iris_close(struct file *filp)
>>  	iris_session_close(inst);
>>  	iris_inst_change_state(inst, IRIS_INST_DEINIT);
>>  	iris_v4l2_fh_deinit(inst);
>> -	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> -	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE, true);
>> +	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, true);
>> +	iris_get_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> +	iris_get_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>>  	iris_remove_session(inst);
>>  	mutex_unlock(&inst->lock);
>>  	mutex_destroy(&inst->ctx_q_lock);
>>

