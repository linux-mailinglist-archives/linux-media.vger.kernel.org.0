Return-Path: <linux-media+bounces-31363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33452AA4283
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 07:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49BDD7A411E
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 05:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016581E2823;
	Wed, 30 Apr 2025 05:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m0S6Ujh8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818AE801;
	Wed, 30 Apr 2025 05:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745991507; cv=none; b=hnHYPpIVrnoqC/21yxIsxn3ndDsMAuesGn3JPUrsdGL0JHpV/DohO67tsxNgc1MZwgUoBYf4Mne1r8Otbe6jT2WJH2Yb+8GZee8FRrM/DvGRPilha6r/lvRIlFBA0sEjkVA2N6x+lQoMaWncmvHoodopTqCNyc5GjWaCeqD7oJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745991507; c=relaxed/simple;
	bh=B2NidxMu4iRLcef9BLgK8PV62E/VhYEy7e5YDJIc8EA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tMjkXvah4UHWYpHWzbo44GYj6lSywT/ONfwPSf4Hl+QNMTKyLuf1GAnsCL6g+fLww3cXtQmLwJyeg8iFamAbO23VgCOexnLvUmRrsWVsJKl4NmHqKHh43Ysi78YnYNWkuVuJOUEWElc+j4yixGDYYKvJ49B/ydUYEvwbBvy+hJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m0S6Ujh8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLb32e011095;
	Wed, 30 Apr 2025 05:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KESzOejqPulb1TPwlFso+th0l+OLtBke9zOk/N/k4to=; b=m0S6Ujh8QffSOfj2
	W588g10xawwW3TxE0KAnVuavnFN+Xm+VSQ1W5vbmgUYKEyr4ARXYlt4iOMDGkjFp
	uukREeUbSyoIPEaleJh2W96KVHBKbpnRYiZXAlYMkjUHASQcPWTa7+k3BciEcMHd
	HtYMuRxKIVzptmdoKJmQ+SMJXeVUv6YbbLDL0qmUcRR5jblVuO2iPQekSfWsI/Ar
	HAFONZG0jHK+EVw1s441B5e+rKq29rmO0LyxwHKU3CCe3Q2NPlpiGU5lCkIZTuDU
	LUaslJxGOY7xy5db57I6GSCn+KIizW+R3PKO++TpZOdgda8qLUHiroNC/6y1Yf6c
	/x4SAg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uarweb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 05:38:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53U5cA89026083
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 05:38:10 GMT
Received: from [10.50.5.200] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 22:38:03 -0700
Message-ID: <32379a29-ab58-95b3-77f9-d1ada61e5359@quicinc.com>
Date: Wed, 30 Apr 2025 11:08:00 +0530
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
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Stefan Schmidt
	<stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-1-3a6013ecb8a5@quicinc.com>
 <dc9b20aecc8740896b2b3e7352b8e0d73d43fed2.camel@collabora.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <dc9b20aecc8740896b2b3e7352b8e0d73d43fed2.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gziX25vrn4uEgWo7AxBvtamTrqNjscOC
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=6811b743 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=e6OCQq0veDw7Aj3gnXcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: gziX25vrn4uEgWo7AxBvtamTrqNjscOC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDAzNiBTYWx0ZWRfX3fuVyDZ9vfVi anL3EQ41BDYNk4lQq6xNvM3HiCWFG43S0KFQ8Ktk5hsdnAvB8rXnMFO/444+LLxRIUdY7kuU5cH 0fZTJX1ew+RcKG1gQET4eoiXloCbFmBSo+mRlZqgsjS452JIT33ol4FfSFdSkA0gyMx2tCC9XVN
 KudJ5bqpNbKPDVsBllnOgRVtJ5QPMFwawpnWANCBk1SnsXRidG4+fXhkfsICMzd8umyTSd73wUr OPzOAEXE2vqkHN1pGWqX/mlRsBh1yo52EgSOt62A0ov4cScGNiOYVGJs9CRrfB47OYFZWqyGPiT 5wQB3g8mlzBSgRI0BnBcoWP5kTm+L1JLuOdqlmvUoc5Vx1mHMcZiE0PdLXKRaaYjvg0qc1k89u+
 8zDSkGdtgE3O5g0qgng1B5YSI6nVxE3fq9Ig/Uwh68SqwxqTsKm10Pf3SfnpqUdcOqokBuG3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300036



On 4/29/2025 6:17 PM, Nicolas Dufresne wrote:
> Not mine to review, but wanted to highlight some best practices,
> 
> comment below...
> 
> Le lundi 28 avril 2025 à 14:58 +0530, Dikshita Agarwal a écrit :
>> Firmware might hold the DPB buffers for reference in case of sequence
>> change, so skip destroying buffers for which QUEUED flag is not removed.
>> Also, make sure that all buffers are released during streamoff.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_buffer.c | 37 +++++++++++++++++++++++++-
>>  drivers/media/platform/qcom/iris/iris_buffer.h |  3 ++-
>>  drivers/media/platform/qcom/iris/iris_vdec.c   |  4 +--
>>  drivers/media/platform/qcom/iris/iris_vidc.c   |  6 +++--
>>  4 files changed, 44 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index e5c5a564fcb8..606d76b10be2 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -376,7 +376,7 @@ int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buf
>>  	return 0;
>>  }
>>  
>> -int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
>> +int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool force)
> 
> Its always tempting to just glue a boolean at the end of a parameter
> list. But this has huge downside in code readability, see below...
> 
>>  {
>>  	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
>>  	struct iris_buffer *buf, *next;
>> @@ -396,6 +396,14 @@ int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
>>  	for (i = 0; i < len; i++) {
>>  		buffers = &inst->buffers[internal_buf_type[i]];
>>  		list_for_each_entry_safe(buf, next, &buffers->list, list) {
>> +			/*
>> +			 * during stream on, skip destroying internal(DPB) buffer
>> +			 * if firmware did not return it.
>> +			 * during close, destroy all buffers irrespectively.
>> +			 */
>> +			if (!force && buf->attr & BUF_ATTR_QUEUED)
>> +				continue;
>> +
>>  			ret = iris_destroy_internal_buffer(inst, buf);
>>  			if (ret)
>>  				return ret;
>> @@ -446,6 +454,33 @@ static int iris_release_input_internal_buffers(struct iris_inst *inst)
>>  	return 0;
>>  }
>>  
>> +void iris_get_num_queued_internal_buffers(struct iris_inst *inst, u32 plane)
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
>>  int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst)
>>  {
>>  	struct iris_buffers *buffers = &inst->buffers[BUF_PERSIST];
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
>> index c36b6347b077..03a32b91cf21 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
>> @@ -106,7 +106,8 @@ void iris_get_internal_buffers(struct iris_inst *inst, u32 plane);
>>  int iris_create_internal_buffers(struct iris_inst *inst, u32 plane);
>>  int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane);
>>  int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer);
>> -int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane);
>> +int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool force);
>> +void iris_get_num_queued_internal_buffers(struct iris_inst *inst, u32 plane);
>>  int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst);
>>  int iris_alloc_and_queue_input_int_bufs(struct iris_inst *inst);
>>  int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index 4143acedfc57..2c1a7162d2da 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -408,7 +408,7 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
>>  
>>  	iris_get_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>>  
>> -	ret = iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> +	ret = iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE, false);
>>  	if (ret)
>>  		return ret;
>>  
>> @@ -496,7 +496,7 @@ int iris_vdec_streamon_output(struct iris_inst *inst)
>>  
>>  	iris_get_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>>  
>> -	ret = iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +	ret = iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, false);
> 
> If I was reviewing some changes (or even debugging) this specific C
> file, I would not be able to understanding what this "false" means. I
> would have to spend extra time, opening the declaration, going back and
> forth, and breaking the flow.
> 
> An alternative approach is to keep the boolean parameter in a static
> function (c local), and then add two function wrappers that have
> explicit names.
> 
Sure, I can implement the alternative approach, if recommended.

If I understand correctly, you are suggesting to have one static helper and
two wrappers around this. like:

static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane,
bool force)
{
	...
	list_for_each_entry_safe(buf, next, &buffers->list, list) {
       		if (!force && buf->attr & BUF_ATTR_QUEUED)
			continue;
		...
	}
	...
}

//called during stream on
int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane)
{
	return iris_destroy_internal_buffers(inst, plane, false)
}

//called during close
int iris_destroy_all_internal_buffers(struct iris_inst *inst, u32 plane)
{
	return iris_destroy_internal_buffers(inst, plane, true)
}

Thanks,
Dikshita
> regards,
> Nicolas
> 
>>  	if (ret)
>>  		return ret;
>>  
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index ca0f4e310f77..56531a7f0dfe 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -233,8 +233,10 @@ int iris_close(struct file *filp)
>>  	iris_session_close(inst);
>>  	iris_inst_change_state(inst, IRIS_INST_DEINIT);
>>  	iris_v4l2_fh_deinit(inst);
>> -	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> -	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE, true);
>> +	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, true);
>> +	iris_get_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> +	iris_get_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>>  	iris_remove_session(inst);
>>  	mutex_unlock(&inst->lock);
>>  	mutex_destroy(&inst->ctx_q_lock);
> 

