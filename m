Return-Path: <linux-media+bounces-18620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2B8987206
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 12:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D4A41C213E5
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 10:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E461AD9EB;
	Thu, 26 Sep 2024 10:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UEDMHKnz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D943C1F95C;
	Thu, 26 Sep 2024 10:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727347863; cv=none; b=C/7QfwoNJuKhT3f6t/mZDNXx7i+yC3hRB+5UmWhU+LTG5Mp+NBCOLFjvErvWA2+69apKZfHvVzvFm6b6fwncZGzd3b/mHVN4iUDZOmOjJwyQfYhGu9X8576QxCHHsO9DuSGAAvPhtcZ3oUD2q7CDmKmIrudDKfZWUmiueBjeX8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727347863; c=relaxed/simple;
	bh=TwVIWKlnR/D250Uc5Gkp40af/BcL9AuX/yo1Px/eupk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ExVD4ERKkt3+2FQ5/NY0PKCCEeTNYSPuQ2EGlJm/H2jRHP+YrDGD0eQWvYqkMkKU59oKAINYhe/14/h1v2ro8awg5xdMB6LIkp+j+GNDm7KEigssfGOsgnbQQ8ioxkUThhavbZVV6fxClLLpqSaZAc5XhcEH3beoEim1cI/JgTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UEDMHKnz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48Q75CLW010586;
	Thu, 26 Sep 2024 10:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+1ytVElgYRHqGy80fSqI+IlhZMgIedGWEiG7ffAc04=; b=UEDMHKnzMWGUW5ml
	HSrpuyFQURqWYv7IP+RxEXZi4PDEHhiQTLktx+abIspdtwFAtauwGezU2q5MyoIS
	MoglHXZwh392D0nKMqewdN6kZVgOnVB1OO+6j/PcpTQVU/05FgREV0oRA1lS1ia4
	KgWcITYXYrdhOsmoqRa09YCTHrvAEGhQ8x7GRK7pAmgpuqG9Pp+0OHwgTi1XV32U
	22Qo/R4cQ/rK6RrF/t5PJNp4njrAiLFCOBzGuDKqZWRuBSu9iuXRSQoAVkXZ1pNv
	+vXQHi2scI5ZpM+oSjGmcjB9vjcmrG2HHeP8tbLGL/A0bCTlxZMTY0U7N2Kvm0ee
	EAovgg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sph6ye0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 10:50:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48QAosSl013267
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 10:50:54 GMT
Received: from [10.216.19.58] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 26 Sep
 2024 03:50:50 -0700
Message-ID: <a4f01eaa-bfb2-a5a4-87b2-2960aa61d29e@quicinc.com>
Date: Thu, 26 Sep 2024 16:20:47 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 17/29] media: iris: implement query_cap, query_ctrl and
 query_menu ioctls
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vedang Nagar
	<quic_vnagar@quicinc.com>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-17-c5fdbbe65e70@quicinc.com>
 <8f156cc8-d8f8-4caf-8431-4a549f41ac0f@linaro.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <8f156cc8-d8f8-4caf-8431-4a549f41ac0f@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Y2VbOA2zeFw4jLdllrYWmxzu309IXcqA
X-Proofpoint-ORIG-GUID: Y2VbOA2zeFw4jLdllrYWmxzu309IXcqA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260072



On 9/24/2024 8:19 PM, Bryan O'Donoghue wrote:
> On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
>> From: Vedang Nagar <quic_vnagar@quicinc.com>
>>
>> Implement query_cap, query_ctrl and query_menu ioctls in the
>> driver with necessary hooks.
>>
>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vidc.c | 89
>> ++++++++++++++++++++++++++++
>>   1 file changed, 89 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c
>> b/drivers/media/platform/qcom/iris/iris_vidc.c
>> index 7d5da30cb1d1..1dd612b7cec5 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
>> @@ -362,6 +362,92 @@ static int iris_enum_framesizes(struct file *filp,
>> void *fh,
>>       return ret;
>>   }
>>   +static int iris_querycap(struct file *filp, void *fh, struct
>> v4l2_capability *cap)
>> +{
>> +    struct iris_inst *inst;
>> +    int ret = 0;
>> +
>> +    inst = iris_get_inst(filp, fh);
>> +    if (!inst)
>> +        return -EINVAL;
>> +
>> +    mutex_lock(&inst->lock);
>> +    strscpy(cap->driver, IRIS_DRV_NAME, sizeof(cap->driver));
>> +    strscpy(cap->bus_info, IRIS_BUS_NAME, sizeof(cap->bus_info));
>> +    memset(cap->reserved, 0, sizeof(cap->reserved));
>> +    strscpy(cap->card, "iris_decoder", sizeof(cap->card));
>> +    mutex_unlock(&inst->lock);
> 
> Locking is a good thing but, this seems very rote.
> 
> What's being protected here ?
> 
> Please take a critical - no pun intended - look at your locking strategy here.
> 
> I mentioned previously taking a core lock and releasing it with a level of
> granularity that didn't make a ton of sense to me, here's another example
> of locking for locking's sake.
> 
> Please go through your code, look at your locks with a critical eye and say
> "what's this for, why are doing this, what is the lock supposed to
> guarantee here".
> 
> I appreciate that can be difficult with a progressive patchset so recommend
> jumping in at the end and doing that analysis.
> 
sure, will revisit the usage of inst->lock and improve as needed.
> ---
> bod

