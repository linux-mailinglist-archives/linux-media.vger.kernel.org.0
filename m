Return-Path: <linux-media+bounces-40055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0236B2973B
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 05:11:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61EFD189FF60
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 03:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C72125DAF0;
	Mon, 18 Aug 2025 03:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cKGXilFZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010FA25CC70;
	Mon, 18 Aug 2025 03:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755486683; cv=none; b=CV8vGU/R0Yt06Jn2Gr/x9cmzSKYlxFanNAvEZt1/nqUly79RmNR/BJ5OPBYEUaykytoJ1zqIkrdpOXJBmivu5hmXgr+dv8H4nOm26FPb4MsQ5MwhD8J38U1GVxJAi/FHvqN8ZfL2r7dHHrwuDonsBI8UKNUWyhSMOSbjE/r24RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755486683; c=relaxed/simple;
	bh=CQC/mgtKrMDVuJScx8pWua4SwmSaremcyHWgxpLsKmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ePnou5bOa4yOMCxmFNZMj2QW31U0Bm7t96Kn1GLz5gElgmxR8/1JH4aJsPiN2zD9EowCc2yL5DvAKfOJx/0ZX63yOPaHx8oUsQv9RocJZIGuT8zfEgwPFRVZDd6jCEgvLjMlMdbz9YWvyzHIRJMhuzFUDNqbaScnneS7MjY8+gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cKGXilFZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HNCvII011921;
	Mon, 18 Aug 2025 03:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xfXs8z59fFvR3wwGqlMhjgvljWhG0hZItKe/IEqNtZ8=; b=cKGXilFZyGjJLviW
	nnGSXS5eaYnNuCTE1FcDxf31g1eUxSueKqgVNOKZitu9PMaECz3gvooqBAhg5WAm
	+Mu5Mam4HVl2Wm/P6++VzRDczx/3M270hs8VERjGG17xMMIT1T6jzT1e5o0HTbvs
	/RAyjUgKXrmmksbmb0zYs+YvGiIzW9ONt9OtsehRGPhTxi68MDduPnIKxxkKvHLA
	vFjvhew3JFs/5Ry/htPNGYuQxwZmrqAIxUdiaBhn5vH8l7M0FYPrD/iWqKx2n0Ns
	Z9RxogZj/u9XDrD0FIqJEybkm+gBsXj1XDMx2FSLEQBlO5s6azwIY0hlWx0t91mj
	1GZAww==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjyb3jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 03:11:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57I3B8EE016133
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 03:11:08 GMT
Received: from [10.50.13.61] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 17 Aug
 2025 20:11:03 -0700
Message-ID: <a7c67628-072d-8e31-5f5f-2b322f40dbd4@quicinc.com>
Date: Mon, 18 Aug 2025 08:40:54 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 03/24] media: iris: Fix memory leak by freeing
 untracked persist buffer
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Mauro
 Carvalho Chehab" <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar
	<quic_vnagar@quicinc.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-3-c725ff673078@quicinc.com>
 <956110cf-d309-430c-b30f-a9c442e015cf@linaro.org>
Content-Language: en-US
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <956110cf-d309-430c-b30f-a9c442e015cf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GEYqP97KxSvImjmOsYjHlTA6WWTl6WWS
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a299cd cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=lJgc3GM52zlrTCvxpeAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: GEYqP97KxSvImjmOsYjHlTA6WWTl6WWS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfX1xXg7eh//SWR
 dXNykFlWpsCnbpfm6QQTxLIApuB0NbHUXcWY8Zci5SN8L1oNPWcKqJRYbFSMTPmR4avhGhbQ2tc
 hjQG+tHbZchhRo25MR/8eUTb+yEEG+mFyTrlkiQWPRzA1DQNfczre6b4WzdvNALTGGkaMqeeiT+
 ejJZbQUv3EBNfrVmGYmHr9PZrLpau5P0UXjDInrYYogtzyskRWgLblZ60dvkGP9hZ8V5fznJgep
 8EREJIMeP/oQAoQdPTK94pI+nxfAgBZ7oVbzGG1jdgP4Qxa+w7jHuYBRHWOi2NR3n1UqcUt3HS2
 VlnCUrP1DvLp/CWuKlUyAdBt5nUHJ5lgl8JAHWD4h8sS3dBFzruJ1NTmZqmJ086jymct7wSKPTk
 Oamdza6K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028



On 8/16/2025 3:45 PM, Bryan O'Donoghue wrote:
> On 13/08/2025 10:37, Dikshita Agarwal wrote:
>> One internal buffer which is allocated only once per session was not
>> being freed during session close because it was not being tracked as
>> part of internal buffer list which resulted in a memory leak.
>>
>> Add the necessary logic to explicitly free the untracked internal buffer
>> during session close to ensure all allocated memory is released
>> properly.
>>
>> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue
>> internal buffers")
>> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_buffer.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c
>> b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index
>> 6425e4919e3b0b849ba801ca9e01921c114144cd..9f664c241149362d44d3a8fa65e2266f9c2e80e0 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -413,6 +413,16 @@ static int iris_destroy_internal_buffers(struct
>> iris_inst *inst, u32 plane, bool
>>           }
>>       }
>>   +    if (force) {
>> +        buffers = &inst->buffers[BUF_PERSIST];
>> +
>> +        list_for_each_entry_safe(buf, next, &buffers->list, list) {
>> +            ret = iris_destroy_internal_buffer(inst, buf);
>> +            if (ret)
>> +                return ret;
>> +        }
>> +    }
>> +
>>       return 0;
>>   }
>>  
> 
> Why is the logic here not to simply release every index of the enum
> iris_buffer_type ?

All buffers indicated with enum iris_buffer_type are not related to both
encoder and decoder, some are specific for encoder and some are for
decoder. Hence while freeing we read the internal buffer list maintained in
platform data to get the exact buffer list applicable.

> 
> If I'm reading the code right here, len indicates the list of linked lists
> to free, adding BUF_PERSIST appends to the list that may be freed if force
> is true but, then what about the remaining entries BUF_SCRATCH_1 ?
> 

the buffer list here is the list of buffers of a specific kind eg: BUF_PERSIST.

BUF_PERSIST is not part of list maintained in platform data because it has
a different lifecycle than other internal buffers. that's why this specific
routine is needed to free BUF_PERSIST when destroying all buffers.


> Is it valid to leave this routine with force = true but BUF_SCRATCH_1 not
> specifically indexed, if so why ?

Other internal buffers are freed in another routine in the same API which
is not part of this particular code snippet.

Thanks,
Dikshita

> 

> ---
> bod

