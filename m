Return-Path: <linux-media+bounces-32352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF42AB4C69
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 09:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 088837A0F7C
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 07:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14FB31EFFA2;
	Tue, 13 May 2025 07:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lYAV4OTJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B768D1E9B06;
	Tue, 13 May 2025 07:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747119803; cv=none; b=JyUvGYD2M4jef5WkrLqWa7sjznjlddRDlMIyRjy8SIb0clsj/GxM4Tw2rzEeE1PZBMOVczfcqDu7B+Wa4YXuqiVzB7zBhlS2kwTgv03lzZmxYfh2E9tEDn346aEAfMAlQlqO2haKb9IT7oLAHI5Why3cwK/ZOsD8qYuV2I6KcXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747119803; c=relaxed/simple;
	bh=lmt3+WfOxDH98tdCH5d1AJxZ/W6YhFWUNQketqH0NZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qWZlaMYDxS28ol3U9bUk9S8Inft25YuqQNCMymWSiy0wtKh/xst+2tiZB/88TEnG0qG36GW1WrAEj01bnCGlOz6pypUHGJdob+EBFc/EKLkpjV069D6GPIoLQW277ptCihjQOmwl1YFaazLT8NsuppufjCMOQVcqSD9XqkEOv1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lYAV4OTJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D6cgPQ015340;
	Tue, 13 May 2025 07:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q9p0omokZ2YahADYaFBdyYRAcygeShdpSGEeoqaghfU=; b=lYAV4OTJ3nzkqKqm
	W7DRVTLYA7Ao4THI8NRCsk81mmi0zGeIg7UcAhB535Kurf9YrtaI4n2GXEO1lgt8
	jnECUujneIJrgF8t/fNG8flzYsfbSMO/710XIz4MfXDEABEYvrIwzKMkHKzoIX/Z
	S3VpK3jK43KiuRijnUttPMvWdOVGPYCQJ5z2c4O/7zFYOAFeL+BJLdjwc2NVWazu
	bjb4J9h6H5DblFeJXg6W5Cfr+5wyc5FdyKPKKo7MCIhYNvJKPYJ/5zX7AW8Gd4dL
	sBw0foIzFjMHPEEqFxqSXmZ2lLgm2xJBCsn674jYrZKCG2BokEsK+ZF3X3KLmCHp
	ApS+ig==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46j03bes63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 07:03:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54D73Ch7011149
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 07:03:13 GMT
Received: from [10.50.52.254] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 May
 2025 00:03:09 -0700
Message-ID: <4c32e675-e352-0af2-fe58-70ca7e28d56d@quicinc.com>
Date: Tue, 13 May 2025 12:32:40 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] media: venus: fix OOB access issue while reading
 sequence changed events
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vedang Nagar
	<quic_vnagar@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250215-venus-security-fixes-v2-0-cfc7e4b87168@quicinc.com>
 <20250215-venus-security-fixes-v2-2-cfc7e4b87168@quicinc.com>
 <664809e5-c027-4d0e-a604-d9fdf4b1f2da@linaro.org>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <664809e5-c027-4d0e-a604-d9fdf4b1f2da@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CUf2cx3BHkQwpZZa8fS79pmFiSY3S5kC
X-Authority-Analysis: v=2.4 cv=DOuP4zNb c=1 sm=1 tr=0 ts=6822eeb1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=cJ6X7pDOamNDxTYa5t0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: CUf2cx3BHkQwpZZa8fS79pmFiSY3S5kC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDA2NSBTYWx0ZWRfX7BibS6WGvGQV
 zSmXAmvnjTqSOxRuVbJ7JAQziKOnaUxRSO/9R6VA5SrsUImsSCiT6TyjQ0TrVtdh+Yav/mlgzIM
 qJusvispDfGzdp+ZGWcvZ22jhrhhS0TRve2/tzs+letkS5KG9EOLHsyU3x9rQhLx0k8sSPLX+CU
 P3p34FKVvuFpJJ8FzPhJ4TZD+/M+YwwOjt7uWcf/2sBofd4nLTAWVMTxjMoCKGyHDoHxjR6SNPg
 xNaKRPc9FX2ABkF+UkS0fUjdwA5i6DPOxmyzqSJ7oE09wlCpQIAv+0NaxHFkoQ41Tkj2lFvvBsi
 DiRL5MhKucqrm9Rd7jqeMi0fuYFQn1lmpMZm3SD9M5zdR7B3tYNQqEVwutm0UVfzDbJ4NbyQ/Z9
 qA+aNxPS7sGN9urP5bSlY5hlZMEDRBtpFyTzPoKeeT34dvUBK0pIwb2rMYRKpQLi3psekWEH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505130065



On 3/4/2025 7:05 PM, Bryan O'Donoghue wrote:
> On 15/02/2025 17:19, Vedang Nagar wrote:
>> num_properties_changed is being read from the message queue but is
>> not validated. Value can be corrupted from the firmware leading to
>> OOB read access issues. Add fix to read the size of the packets as
>> well and crosscheck before reading from the packet.
>>
>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/venus/hfi_msgs.c | 72
>> ++++++++++++++++++++++++----
>>   1 file changed, 62 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c
>> b/drivers/media/platform/qcom/venus/hfi_msgs.c
>> index
>> 0a041b4db9efc549621de07dd13b4a3a37a70d11..2ad60a3fbfe0286de09a44664fc3b30259aa0368 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_msgs.c
>> +++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
>> @@ -19,6 +19,16 @@
>>   #define VER_STR_SZ        128
>>   #define SMEM_IMG_OFFSET_VENUS    (14 * 128)
>>   +static inline int increment_data_ptr(u8 *data_ptr, u32 *rem_bytes)
>> +{
>> +    if (*rem_bytes < sizeof(u32))
>> +        return -EINVAL;
>> +    data_ptr += sizeof(u32);
>> +    *rem_bytes -= sizeof(u32);
>> +
>> +    return 0;
>> +}
>> +
>>   static void event_seq_changed(struct venus_core *core, struct
>> venus_inst *inst,
>>                     struct hfi_msg_event_notify_pkt *pkt)
>>   {
>> @@ -33,8 +43,8 @@ static void event_seq_changed(struct venus_core *core,
>> struct venus_inst *inst,
>>       struct hfi_buffer_requirements *bufreq;
>>       struct hfi_extradata_input_crop *crop;
>>       struct hfi_dpb_counts *dpb_count;
>> +    u32 ptype, rem_bytes;
>>       u8 *data_ptr;
>> -    u32 ptype;
>>         inst->error = HFI_ERR_NONE;
>>   @@ -56,66 +66,108 @@ static void event_seq_changed(struct venus_core
>> *core, struct venus_inst *inst,
>>       }
>>         data_ptr = (u8 *)&pkt->ext_event_data[0];
>> +    rem_bytes = pkt->shdr.hdr.size - sizeof(*pkt);
>> +    if (rem_bytes - 4 < 0) {
>> +        inst->error = HFI_ERR_SESSION_INSUFFICIENT_RESOURCES;
>> +        goto done;
>> +    }
> 
> This doesn't make sense.
> 
> u32 rem_bytes;
> 
> if (rem_bytes - 4 < 0)
> 
Would be better to replace it with
if (rem_bytes < sizeof(u32))

this make sure that rem_bytes contain some valid packet.
> 
>> +
>>       do {
>>           ptype = *((u32 *)data_ptr);
>>           switch (ptype) {
>>           case HFI_PROPERTY_PARAM_FRAME_SIZE:
>> -            data_ptr += sizeof(u32);
>> +            if (increment_data_ptr(data_ptr, &rem_bytes))
>> +                break;
>> +            if (rem_bytes < sizeof(struct hfi_framesize))
>> +                break;
> 
> In every case you are return -EINVAL but not setting
> 
> inst->error = HFI_ERR_SESSION_INSUFFICIENT_RESOURCES;
> 
> surely that is a natural and logical outcome of running out of buffer and a
> fact you'd want to communicate outside of the driver, rather than silent
> failing in this switch ?
> 
Make sense.
we should set the inst->error instead of silently breaking from loop.
Will handle this in next revision.

Thanks,
Dikshita
> ---
> bod
> 

