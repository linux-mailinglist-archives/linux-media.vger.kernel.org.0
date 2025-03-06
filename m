Return-Path: <linux-media+bounces-27704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13785A54AAC
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 13:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F68A3A7014
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 12:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5362F20B800;
	Thu,  6 Mar 2025 12:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Jp4VmcTl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0D6207DEA;
	Thu,  6 Mar 2025 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741264022; cv=none; b=iyFZV07M8l1MczgyMY/2kA0CoKKsS/WHTCq6zLR/TsB7g1TKy2YsCA5oXIOnBlUmVZwdaxcduxLWzRPwS4cUWjvm24PkCCMVWJHIGsZjmiPvqBdTlIKJiK1AFR8UWrR8sNg7Yi537uiwWIgzZHFCdMy+eg/UDoYdOCqfefzRdic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741264022; c=relaxed/simple;
	bh=LCU8L/Fgn/BFfY0DNgRgG+dUgbfkRwM0DLp5MOpz+lM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=u2QG199kWx00qmzSQj6iM14G5Go5kvXoxc579d+1lbEmvOojKMb2Rfkcr76uofAgUykIsUqr2z38W5xstczMW3JPTXWxibx2vEyDhQtgSLRxWEQAljCqvo+nGQXt61Ii15tK6CzgCLOLtgBJ9g1VrVuqfPmxNnTh5x733AqxRSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Jp4VmcTl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526B3j1b032037;
	Thu, 6 Mar 2025 12:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gZVJaNldivt0biQ0ocG3nUN29LhxElOEUuXU5arASFk=; b=Jp4VmcTl1gt+AEpK
	c4d58KIN3LplG44FiL2q0hcN5Yru3zariYE3yKf/LiDBRKS9vP2UxVgEQl+AmhZm
	MTmUIfbFfzv/xiGQuWsMTkGAKhVgFjYEkJABmV0uVBHsLsJksjrTqAZv/j3VZmMz
	oa0tnCX4visy59l74ELl4lTzX4qZOGWMDJfwqJAlW5z6xQ2ieAmacOSFVnV0fB5M
	PN5VZH4oNRVl9BrgXKOSQPzODURxEQVkCJp2g8OpqOOE9GHfXlIJICpbR/NtEiGd
	s7ioJMH95BCbR7m6DloMDNP3aMvT1AZp+kxbeqviKLaBcRj7jp+4rZrCx0nIb7A4
	SNDaTQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 457aghg8tf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 12:26:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526CQunV015893
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 12:26:56 GMT
Received: from [10.50.63.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 04:26:53 -0800
Message-ID: <2cfb75ab-2cb4-475f-b8ae-22f6e1acb93b@quicinc.com>
Date: Thu, 6 Mar 2025 17:56:51 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 05/12] media: iris: Skip destroying internal buffer if
 not dequeued
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <quic_vgarodia@quicinc.com>, <quic_abhinavk@quicinc.com>,
        <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
 <20250305104335.3629945-6-quic_dikshita@quicinc.com>
 <aevtzaqo3pqi5kwufdwciocybibuketxlfy6revxc6r6bzxdai@njgt56fev2vq>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <aevtzaqo3pqi5kwufdwciocybibuketxlfy6revxc6r6bzxdai@njgt56fev2vq>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _5aaohHP4yu83ws5PjFJfZAS9mhpoKQy
X-Authority-Analysis: v=2.4 cv=R5D5GcRX c=1 sm=1 tr=0 ts=67c99491 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=kHoMVEl2FJXKzsyEVt8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _5aaohHP4yu83ws5PjFJfZAS9mhpoKQy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060094



On 3/6/2025 2:14 AM, Dmitry Baryshkov wrote:
> On Wed, Mar 05, 2025 at 04:13:28PM +0530, Dikshita Agarwal wrote:
>> Firmware might hold the DPB buffers for reference in case of sequence
>> change, so skip destroying buffers for which QUEUED flag is not removed.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> 
> Please add FIxes tag and move closer to the top.
> 
Noted.
>> ---
>>  drivers/media/platform/qcom/iris/iris_buffer.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index 8c9d5b7fe75c..305b630ca269 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -399,6 +399,13 @@ int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
>>  	for (i = 0; i < len; i++) {
>>  		buffers = &inst->buffers[internal_buf_type[i]];
>>  		list_for_each_entry_safe(buf, next, &buffers->list, list) {
>> +			/*
>> +			 * skip destroying internal(DPB) buffer if firmware
>> +			 * did not return it.
>> +			 */
>> +			if (buf->attr & BUF_ATTR_QUEUED)
>> +				continue;
>> +
>>  			ret = iris_destroy_internal_buffer(inst, buf);
>>  			if (ret)
>>  				return ret;
>> -- 
>> 2.34.1
>>
> 

