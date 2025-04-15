Return-Path: <linux-media+bounces-30211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DC0A89337
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 07:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31C643B66B2
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 05:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837B1274678;
	Tue, 15 Apr 2025 04:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JDhbaWGl"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E4F2741AF;
	Tue, 15 Apr 2025 04:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744693139; cv=none; b=doO1dtG6cvqd33MtZIJ2K7XaeHZvNpT1aJ/VCv2oe3XkIX9Opw15uioJFXLjsh+yHBTu/Lmh89vtTRTLcdkWPjDFZXQxdH2nSMfI+v34avvt8JNy0hvt+4zkM+9E2Pook3pdrp4R8tyRF3285mqzyrZlzR7wyaayeRdP7103YFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744693139; c=relaxed/simple;
	bh=9lGod6WqYYl/rO9s0C3ikCS4fm+rF6VO8qe2Pg1E0qI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=B9Xn97NqOuCI2QBHeGVe+zSrjH1mOeajynGUtsqVY4k2HoYLLi6ALIviLzQibjemqou4hYyOTIpP4QHbrv6qImXnVtz/Ml8x0cEa3jCZ6CrjS8ir6Uj3agEZKhfYLByaVjN108iV3kQBY708aNXcHj1sAQSbeNa5ZDt8lUfAyy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JDhbaWGl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F15Nbc005441;
	Tue, 15 Apr 2025 04:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWezN7uFN+RzaL3qpsgmIaG5ICwn+G0ehLPVglPL+r0=; b=JDhbaWGl6+vvgC/E
	7XyYtygurCecCzCJw/EqlnDpg4gSUVHP3Z1DVGnLYqDMAb7Yr1h0v989K9+Ccj8R
	hSVUFIeyO9kg3nuVUNtuwzsj28yAhCENlnw+gPzVMy2UL1s3EdQ4ZNh9cxejB5q2
	VaQZpCYxIuKK4h/qGZDVILimuoK2E2/F934z8ackR2VUAjBB0q9KABHmAwu292/i
	en2eAu/jKp25zrqR5yauRPibpabosW0J1Ezghzo+7oM1ZYwAe0F8MyfzHhGCyJXY
	8aq+1exz7Iqi5Qo5I8NChMABvxWjNyu6ZWTxgt4h15pY68SasLDLh5eSX2m55wif
	RDm16A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhq6wys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 04:58:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53F4wpN0027101
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 04:58:51 GMT
Received: from [10.50.52.225] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Apr
 2025 21:58:45 -0700
Message-ID: <96bd9ffa-94f6-0d1f-d050-5bec13b3328f@quicinc.com>
Date: Tue, 15 Apr 2025 10:28:42 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 01/20] media: iris: Skip destroying internal buffer if not
 dequeued
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
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <20250408-iris-dec-hevc-vp9-v1-1-acd258778bd6@quicinc.com>
 <811cd70e-dc27-4ce0-b7da-296fa5926f90@linaro.org>
 <137c68d5-36c5-4977-921b-e4b07b22113c@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <137c68d5-36c5-4977-921b-e4b07b22113c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QlRzTnvec0eQYNpsNvi7_FdVOlfD84PS
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=67fde78c cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=z6aZsptlrjkmvRdYYoYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: QlRzTnvec0eQYNpsNvi7_FdVOlfD84PS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150031



On 4/14/2025 3:56 PM, Bryan O'Donoghue wrote:
> On 11/04/2025 13:10, Bryan O'Donoghue wrote:
>> On 08/04/2025 16:54, Dikshita Agarwal wrote:
>>> Firmware might hold the DPB buffers for reference in case of sequence
>>> change, so skip destroying buffers for which QUEUED flag is not removed.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue
>>> internal buffers")
>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>> ---
>>>   drivers/media/platform/qcom/iris/iris_buffer.c | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/
>>> media/platform/qcom/iris/iris_buffer.c
>>> index e5c5a564fcb8..75fe63cc2327 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>>> @@ -396,6 +396,13 @@ int iris_destroy_internal_buffers(struct iris_inst
>>> *inst, u32 plane)
>>>       for (i = 0; i < len; i++) {
>>>           buffers = &inst->buffers[internal_buf_type[i]];
>>>           list_for_each_entry_safe(buf, next, &buffers->list, list) {
>>> +            /*
>>> +             * skip destroying internal(DPB) buffer if firmware
>>> +             * did not return it.
>>> +             */
>>> +            if (buf->attr & BUF_ATTR_QUEUED)
>>> +                continue;
>>> +
>>>               ret = iris_destroy_internal_buffer(inst, buf);
>>>               if (ret)
>>>                   return ret;
>>>
>>
>> iris_destroy_internal_buffers() is called from
>>
>> - iris_vdec_streamon_output
>> - iris_venc_streamon_output
>> - iris_close
>>
>> So if we skip releasing the buffer here, when will the memory be released ?
>>
>> Particularly the kfree() in iris_destroy_internal_buffer() ?
>>
>> iris_close -> iris_destroy_internal_buffers ! -> iris_destroy_buffer
>>
>> Is a leak right ?
Good catch, Thanks!
>>
>> ---
>> bod
> 
> Thinking about this some more, I believe we should have some sort of
> reaping routine.
> 
> - The firmware fails to release a buffer, it is up to APSS/Linux
>   to run some kind of reaping routine.
>   We can debate when is the right time to reset.
>   Perhaps instead of ignoring the buffer as you have done here
>   we schedule work with a timeout and if the timeout expires then
>   this triggers a reset/reap routine.
> 
> - Since Linux allocates a buffer on the APSS side, you can't have a
>   situation where firmware can indefinitely hold memory.
> 
> - APSS is in effect the bus master here since it can assert/deassert
>   RESET lines to the firmware, can control regulators and clocks.
> 
> So we should have some kind of watchdog logic here.
> 
> As alluded to above, what exactly do you do if firmware never returns a
> buffer ? Accept memory leak on the APSS side ?
> 
> Rather we should agree when it is appropriate to run a watchdog routine to
> 
> 1. Timeout firmware not returning a buffer
> 2. Put the iris/venus hardware into reset
> 3. Reap leaked memory
> 4. Restart
> 
> I see we have IRQ based watchdog logic but, I don't see that it reaps memory.
> 
> In any case we should have the ability to reset iris and reclaim/reap
> memory in this type of situation.
> 
> Perhaps I'm off on a rant here but, this seems like a problem we should
> address with a more comprehensive solution.
> 
That's right, but we don't need to over complicate this.

We need to skip destroying these buffers for a running session so that the
DPB buffers which are still being referenced by firmware are not lost.
But these should be freed during session close which is missing in current
code.
Although firmware makes sure that during session close, all buffers are
returned to driver and driver will release them but still we shouldn't rely
for this on firmware and should handle in driver.
Will fix this in next patch set.

Thanks,
Dikshita
> ---
> bod

