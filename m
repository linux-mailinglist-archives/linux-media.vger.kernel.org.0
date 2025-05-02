Return-Path: <linux-media+bounces-31589-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABEEAA73ED
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3A3F17B5F0
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 13:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05504255F3F;
	Fri,  2 May 2025 13:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N55g9obV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ECC254AF4;
	Fri,  2 May 2025 13:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746193040; cv=none; b=YyY3XS5QJW9UOe6PxE8hD8pMtn+ghXc/DG43UtOa9AsmzsSOdA2o2LtYMHZeK3MM1SLQ2RZ6J8E5LuXlz2pM0N3KkaauwvD1TrfSEZOfpiwwcYaLevrRx2Ylh/fHi3p8iIE2sJ4hIKLoeDqaul/CjG3w/CWDiFPoUzBU0zzyESI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746193040; c=relaxed/simple;
	bh=8cHTAisa6S2kXSPSeGYGnxErvNZZRxvfZ/hmzj7yeXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TsMwqcYHKKdOeqOoaN5DIO2jq6KT5lL9T9gQQRtSget3kRyh1CYVT+35355nL8cZeAwUidZxegUHMiIU9bdri8q7IZ4aB7WchfFC0SwVRustg9eY7pjxkfZaqBzQEmdfX89hcZmhGwwrdWu+C7qVFaHTTS7BGBOPXgTEXoYADZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N55g9obV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421NeCH011273;
	Fri, 2 May 2025 13:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E0hihidKCYoK8t6esarJrRR9f1KzNX8WPOvdrVjuUVI=; b=N55g9obVt6ycMx3U
	B3zaJFdkl3RiEcnsFTJSasGpTPm9Gz209la+BE1Sn4v3M0XTpBUCLcbOtbYAMuGe
	QeldOrNRkqZHBuwiAxDY8J1raqDh2naflspCURNTiss3C0RqCol9u0kWGxF4L6Si
	RYoSITiNaVzG6AOCJa+O0xm55ICA1lsxTs+z1unR7lUB2fCj9na2U6TIXii0PGVs
	rJRt4P35vBzEJMr7AdsFPplh2gxk2ti0W1cRyAJ9Ty/qPSMS/g7rsbMMjxuv9/jF
	nY60iMbibvQn1fvsP0i4pudJmWGDByfLfoAszaiADrPqATYom6IdhDOpeqebKCHm
	4dYbPw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ua0c32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 13:37:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 542DbBfn019590
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 May 2025 13:37:11 GMT
Received: from [10.50.25.148] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 2 May 2025
 06:37:05 -0700
Message-ID: <29eec5e4-8dad-1447-b358-37e37744a69c@quicinc.com>
Date: Fri, 2 May 2025 19:07:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 01/23] media: iris: Skip destroying internal buffer if
 not dequeued
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
CC: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org>,
        <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>,
        <stable@vger.kernel.org>
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-1-552158a10a7d@quicinc.com>
 <8e0bc60a-35fe-4a78-a710-3642842fa5f5@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <8e0bc60a-35fe-4a78-a710-3642842fa5f5@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PhEydmvSdR-mWNRewX--_f3VGp3SPeX1
X-Proofpoint-ORIG-GUID: PhEydmvSdR-mWNRewX--_f3VGp3SPeX1
X-Authority-Analysis: v=2.4 cv=UZZRSLSN c=1 sm=1 tr=0 ts=6814ca88 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=Xy3is2DKBPmOEoYzUlwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEwOCBTYWx0ZWRfXwgWVrf0ILecj /+60CGeCASZfovIjU/AN9lJPercPEZHlU9eqde17GCg3T7konlNgVNf/H/5cnehEqJXsmhQYOmf XzDA821KjYm+F3sP7wD3VO9amy4uKYl7uQLw2S8eG9Z7G+IaiNldsngNDgnZs2vQpum5yPtS3S2
 oJYI7VXgpf5kOLARJ69uORFqHdSakW/WYpcLrDgkNl91suxe9UGWAhoJOMZl1gQ9anOeb0z0/Ff 2CJtLUePyHHG8xWbWoB+6wo1VP12gYc+8YivbooXrx/YWW3uU1TRpL8UZN/kud9DjypOSaF6Tri 51/+kpZXrHqZeOwPRG1Ef79wEYSpkXUOd9l1eZl9O/vZngZcbrX+MIk1+SRtOw6jgWX0k8B8UhM
 q0c/URu5MqHFWwuKUb2UKYcICVU6koV4GzQRa8SrVV37X3p6bBDCyzNB4SAMZVJpbTKvUjsA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020108



On 5/2/2025 5:44 PM, Bryan O'Donoghue wrote:
> On 01/05/2025 20:13, Dikshita Agarwal wrote:
>> Firmware might hold the DPB buffers for reference in case of sequence
>> change, so skip destroying buffers for which QUEUED flag is not removed.
>> Also, make sure that all buffers are released during streamoff.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue
>> internal buffers")
>> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_buffer.c | 20 +++++++++++++++-
>>   drivers/media/platform/qcom/iris/iris_buffer.h |  3 ++-
>>   drivers/media/platform/qcom/iris/iris_vdec.c   |  4 ++--
>>   drivers/media/platform/qcom/iris/iris_vidc.c   | 33
>> ++++++++++++++++++++++++--
>>   4 files changed, 54 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c
>> b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index e5c5a564fcb8..981fedb000ed 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -376,7 +376,7 @@ int iris_destroy_internal_buffer(struct iris_inst
>> *inst, struct iris_buffer *buf
>>       return 0;
>>   }
>>   -int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
>> +static int iris_destroy_internal_buffers(struct iris_inst *inst, u32
>> plane, bool force)
>>   {
>>       const struct iris_platform_data *platform_data =
>> inst->core->iris_platform_data;
>>       struct iris_buffer *buf, *next;
>> @@ -396,6 +396,14 @@ int iris_destroy_internal_buffers(struct iris_inst
>> *inst, u32 plane)
>>       for (i = 0; i < len; i++) {
>>           buffers = &inst->buffers[internal_buf_type[i]];
>>           list_for_each_entry_safe(buf, next, &buffers->list, list) {
>> +            /*
>> +             * during stream on, skip destroying internal(DPB) buffer
>> +             * if firmware did not return it.
>> +             * during close, destroy all buffers irrespectively.
>> +             */
>> +            if (!force && buf->attr & BUF_ATTR_QUEUED)
>> +                continue;
>> +
>>               ret = iris_destroy_internal_buffer(inst, buf);
>>               if (ret)
>>                   return ret;
>> @@ -405,6 +413,16 @@ int iris_destroy_internal_buffers(struct iris_inst
>> *inst, u32 plane)
>>       return 0;
>>   }
>>   +int iris_destroy_all_internal_buffers(struct iris_inst *inst, u32 plane)
>> +{
>> +    return iris_destroy_internal_buffers(inst, plane, true);
>> +}
>> +
>> +int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32
>> plane)
>> +{
>> +    return iris_destroy_internal_buffers(inst, plane, false);
>> +}
>> +
>>   static int iris_release_internal_buffers(struct iris_inst *inst,
>>                        enum iris_buffer_type buffer_type)
>>   {
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h
>> b/drivers/media/platform/qcom/iris/iris_buffer.h
>> index c36b6347b077..00825ad2dc3a 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
>> @@ -106,7 +106,8 @@ void iris_get_internal_buffers(struct iris_inst
>> *inst, u32 plane);
>>   int iris_create_internal_buffers(struct iris_inst *inst, u32 plane);
>>   int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane);
>>   int iris_destroy_internal_buffer(struct iris_inst *inst, struct
>> iris_buffer *buffer);
>> -int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane);
>> +int iris_destroy_all_internal_buffers(struct iris_inst *inst, u32 plane);
>> +int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32
>> plane);
>>   int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst);
>>   int iris_alloc_and_queue_input_int_bufs(struct iris_inst *inst);
>>   int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c
>> b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index 4143acedfc57..9c049b9671cc 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -408,7 +408,7 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
>>         iris_get_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>>   -    ret = iris_destroy_internal_buffers(inst,
>> V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> +    ret = iris_destroy_dequeued_internal_buffers(inst,
>> V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>>       if (ret)
>>           return ret;
>>   @@ -496,7 +496,7 @@ int iris_vdec_streamon_output(struct iris_inst *inst)
>>         iris_get_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>>   -    ret = iris_destroy_internal_buffers(inst,
>> V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +    ret = iris_destroy_dequeued_internal_buffers(inst,
>> V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>>       if (ret)
>>           return ret;
>>   diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c
>> b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index ca0f4e310f77..a8144595cc78 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -221,6 +221,33 @@ static void iris_session_close(struct iris_inst *inst)
>>           iris_wait_for_session_response(inst, false);
>>   }
>>   +static void iris_check_num_queued_internal_buffers(struct iris_inst
>> *inst, u32 plane)
>> +{
>> +    const struct iris_platform_data *platform_data =
>> inst->core->iris_platform_data;
>> +    struct iris_buffer *buf, *next;
>> +    struct iris_buffers *buffers;
>> +    const u32 *internal_buf_type;
>> +    u32 internal_buffer_count, i;
>> +    u32 count = 0;
>> +
>> +    if (V4L2_TYPE_IS_OUTPUT(plane)) {
>> +        internal_buf_type = platform_data->dec_ip_int_buf_tbl;
>> +        internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
>> +    } else {
>> +        internal_buf_type = platform_data->dec_op_int_buf_tbl;
>> +        internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
>> +    }
>> +
>> +    for (i = 0; i < internal_buffer_count; i++) {
>> +        buffers = &inst->buffers[internal_buf_type[i]];
>> +        list_for_each_entry_safe(buf, next, &buffers->list, list)
>> +            count++;
>> +        if (count)
>> +            dev_err(inst->core->dev, "%d buffer of type %d not released",
>> +                count, internal_buf_type[i]);
>> +    }
>> +}
>> +
>>   int iris_close(struct file *filp)
>>   {
>>       struct iris_inst *inst = iris_get_inst(filp, NULL);
>> @@ -233,8 +260,10 @@ int iris_close(struct file *filp)
>>       iris_session_close(inst);
>>       iris_inst_change_state(inst, IRIS_INST_DEINIT);
>>       iris_v4l2_fh_deinit(inst);
>> -    iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> -    iris_destroy_internal_buffers(inst,
>> V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +    iris_destroy_all_internal_buffers(inst,
>> V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> +    iris_destroy_all_internal_buffers(inst,
>> V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +    iris_check_num_queued_internal_buffers(inst,
>> V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>> +    iris_check_num_queued_internal_buffers(inst,
>> V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>>       iris_remove_session(inst);
>>       mutex_unlock(&inst->lock);
>>       mutex_destroy(&inst->ctx_q_lock);
>>
> 
> I left some comments in the previous cycle
> 
> https://lore.kernel.org/linux-arm-msm/a056266e-612d-4abf-916f-3db49b00dbde@linaro.org
> 
> I don't see those addressed in this cycle. Can you give some feedback from
> your POV.
> 
I responded to your comments, pls check here
https://lore.kernel.org/linux-arm-msm/2c431232-e0d6-1e6c-cd22-a912b5f08f7a@quicinc.com/

Thanks,
Dikshita
> ---
> bod

