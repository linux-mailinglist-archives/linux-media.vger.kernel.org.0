Return-Path: <linux-media+bounces-18492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 108EC9840A8
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 10:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39B5A1C225B2
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 08:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3C114F9F8;
	Tue, 24 Sep 2024 08:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TzYKRA/i"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231901FB4;
	Tue, 24 Sep 2024 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727167102; cv=none; b=P+hKQA5NzhzJUu6nf9qoGQDFvEczHOgkMACeOzHAQWvoewX68ytoQUVMpGo4l/CokKq3HAe2U1zEqaTRlS1UhhyOjclpGEdFBd4Gy1quCHfY2un4UYRyZMKCf1u89bc9YDksT5IYQh2K5PkLwsYVWzbwV6mIGJabJ/RtHVQS2zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727167102; c=relaxed/simple;
	bh=KdF4miuMOP96cZef+4A2B6GsSjvQPpZpQDzissTl+H4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Rth50DBHfE0wFlxNkJ6BRm3YdvulnHuDre1qfCmRzHh/DcLWlOAZ3d+b86facpAKcAPbzfhxa34I3B55G1gNizKD2hv99uZwj26RgWD0N4iMNXu+rUR4qpexgljP1n2uYIfmvnIybKeYHfSZpDmzTsmBXJZ6rg4dCi2eg4jY47k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TzYKRA/i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48NLoiCT029701;
	Tue, 24 Sep 2024 08:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tfDIqcDYClZ03DaMU1Bi8tcgtILZzBujMgKB1scSD9M=; b=TzYKRA/iv/dAAvXo
	1JBNSYq0DxSTe50thEvTUVWC+Bc5HPdq2dDC/7SCSLI0JtiPj5oaTGJDYM7AP/Ul
	wCnetY7lWVvS5uDoDwm7ynrJYCjQKKJYBJ7paYvlxKtTju2/KbliBu3jhNAgiEfY
	x6fjLuAIvNfEfdQrxmM2huTh9IZH6rvCn2BJGNPIijLKmftfPRK9ZYODKIZ+ZA16
	+gk9f6exyCDnid6BOGHXKJI6SAk65vjCx/kyoFW/GNDUnxBqXfKyOMowQu/GXZUI
	a71Y4gysVveQkiLBUHKaaaVPnyayVk2WtsZbeDnHw9KWtJlgAREwPKWwINRe0WTb
	1H1Yyw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skgn85kq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 08:38:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48O8cCR1008101
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 08:38:12 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Sep
 2024 01:38:08 -0700
Message-ID: <779ec517-9d3f-bc3d-83aa-72cb01e44106@quicinc.com>
Date: Tue, 24 Sep 2024 14:08:05 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 10/29] media: iris: implement power management
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-10-c5fdbbe65e70@quicinc.com>
 <d3679f2f-f177-494e-b68d-2a67b423d0cb@linaro.org>
 <c3ad5248-fe47-4622-a53b-386e556a0add@kernel.org>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <c3ad5248-fe47-4622-a53b-386e556a0add@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 08rwxKid3TUqIa6qwDCUEoZR1RP0Pxot
X-Proofpoint-GUID: 08rwxKid3TUqIa6qwDCUEoZR1RP0Pxot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxlogscore=743 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240059



On 9/5/2024 7:16 PM, Krzysztof Kozlowski wrote:
> On 05/09/2024 15:23, Bryan O'Donoghue wrote:
>> On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
>>> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>>
>>> Implement runtime power management for iris including
>>> platform specific power on/off sequence.
>>>
>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>
>>> +int iris_hfi_pm_suspend(struct iris_core *core)
>>> +{
>>> +	int ret;
>>> +
>>> +	if (!mutex_is_locked(&core->lock))
>>> +		return -EINVAL;
>>> +
>>> +	if (core->state != IRIS_CORE_INIT)
>>> +		return -EINVAL;
>>
>> Reiterating a previous point
>>
>> Are these checks realistic or defensive coding ?
> 
> Well, this one:
> 
> if (!mutex_is_locked(&core->lock))
> 
> is clear bug or someone is reinventing lockdep.
> 
Sure, will remove this check.
>>> +
>>> +	if (!core->power_enabled) {
>>> +		dev_err(core->dev, "power not enabled\n");
>>> +		return 0;
>>> +	}
>>
>> Similarly is this a real check an error that can happen and if so how ?
> 
> And here re-inventing runtime PM.
> 
I understand the concern, will remove this check as well.
> Best regards,
> Krzysztof
> 
> 

