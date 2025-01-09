Return-Path: <linux-media+bounces-24487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5492A0703F
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 09:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87AB23A6EC6
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 08:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432A821507A;
	Thu,  9 Jan 2025 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JTixMjP+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA08E206F3E;
	Thu,  9 Jan 2025 08:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736412254; cv=none; b=gGvYkgglXm8b4v4DfBQzedJk2M0A3lOxR66REcGZ7TqXAWk5NIjrlTwizhikuAniIm6BibvfM+LCrJ/OpLc2xLFPlKJiMY1fDJfkbxH/Rg7xkCOfUdJM7zAWxEwygPwjPB6LYoTh8nVhYW8TbcXn8xUBcp0HhGLJcImGs2YHwUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736412254; c=relaxed/simple;
	bh=ewXbhny6eiKKHTv2aarrIZILBaF/hgDoYW91uCtZ2q8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JDdkGGegwSY7fZMX9eiugHuWxhnQmX45LHX0YwfYZaY2R9bgJhQ81EnoYs71ZHkWY6LB7mQHkxcFI8/LzHco1JNCSAYwWwnK4WX7PhETyQnZF1BLPk19wAyJKVcmFf8p1+GnuTACWPuiM5VYpAT/VzR6YWkEUnhDkDavHU2DEXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JTixMjP+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5094gxb4018515;
	Thu, 9 Jan 2025 08:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iv5z0pQJWra21IMqyADxxRW44BxhYJwKyDguqKTr2hE=; b=JTixMjP+hYLQ+9lx
	UtaS1QYm5qSAMmvS0P79SL7VYGd3olPXQ6IygsRDoCAUS+d4woY7k0kD6X4JfI+C
	CnfSMbGEZvY0XP3ndPb+/ifTSKvMzTEOElEvXXVIAp6i9jG/7hSGF8f0gURzg+aN
	M5EoYJyDEx3Dc1LXguq+z0FDY5Qg6otDPNkihrfCxMUwWVM0ZTq0Xr2FMBrSyVhh
	KGIUYtAWxmiGmaDQSjpUOdkawSzutNB/Ps4EhKXbBxvRYk2iUjRN/ZUfub7zOHjf
	T4EpzRKtXP599m2W6ijmPNhAQ3xWFjP5KZRNbXP7ULGoqoTsdGsBCTMbzlqDuvDX
	/rfj4w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4427nwrgqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 08:44:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5098i0rd028463
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 08:44:00 GMT
Received: from [10.50.21.116] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 00:43:54 -0800
Message-ID: <e2716cd5-4765-d8da-888b-bcdcd86df5c4@quicinc.com>
Date: Thu, 9 Jan 2025 14:13:50 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v9 27/28] media: iris: enable video driver probe of SM8250
 SoC
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne
	<nicolas@ndufresne.ca>,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@baylibre.com>,
        Jianhua Lu
	<lujianhua000@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
 <20241223113027.21b8f7ab@foz.lan>
 <fbe0d935-a3cf-dfa0-aad8-56834a0a002c@quicinc.com>
 <635ce4ed82aaca422b869f467300b0eccf9c8703.camel@ndufresne.ca>
 <c0f59149-713b-45e4-3755-4a52cfaa93f6@quicinc.com>
 <498a99e1-77ca-4acf-8850-cb74417ae88c@xs4all.nl>
 <9fc76dd1-ef49-a9d2-0271-eacb50943b03@quicinc.com>
 <9b33ba28-5aa9-4863-8fde-535841ddbc10@xs4all.nl>
 <6654d78e-d16b-489a-3532-e2fbc788b0ef@quicinc.com>
 <067d0deb-50ea-46bd-9f09-827b0ba61aa3@xs4all.nl>
 <5953bea1-194d-fe2e-251a-d4ef3e7544d3@quicinc.com>
 <20250108155237.5cf0ba10@foz.lan>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <20250108155237.5cf0ba10@foz.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: D99ZFxlbpKwuxK_DTyGHDeuMWfBT3JWL
X-Proofpoint-GUID: D99ZFxlbpKwuxK_DTyGHDeuMWfBT3JWL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090070



On 1/8/2025 8:22 PM, Mauro Carvalho Chehab wrote:
> Em Wed, 8 Jan 2025 16:42:03 +0530
> Dikshita Agarwal <quic_dikshita@quicinc.com> escreveu:
> 
>> On 1/8/2025 4:13 PM, Hans Verkuil wrote:
>>> On 1/8/25 11:21, Dikshita Agarwal wrote:  
>>>>
>>>>
>>>> On 1/8/2025 2:25 PM, Hans Verkuil wrote:  
>>>>> On 08/01/2025 09:51, Dikshita Agarwal wrote:  
>>>>>>
>>>>>>
>>>>>> On 1/8/2025 1:17 PM, Hans Verkuil wrote:  
>>>>>>> On 08/01/2025 08:43, Dikshita Agarwal wrote:  
>>>>>>>>
>>>>>>>>
>>>>>>>> On 1/7/2025 7:27 PM, Nicolas Dufresne wrote:  
>>>>>>>>> Le lundi 23 décembre 2024 à 16:21 +0530, Dikshita Agarwal a écrit :  
>>>>>>>>>>
>>>>>>>>>> On 12/23/2024 4:00 PM, Mauro Carvalho Chehab wrote:  
>>>>>>>>>>> Em Thu, 12 Dec 2024 17:21:49 +0530
>>>>>>>>>>> Dikshita Agarwal <quic_dikshita@quicinc.com> escreveu:
>>>>>>>>>>>  
>>>>>>>>>>>> +	.dma_mask = GENMASK(31, 29) - 1,  
>>>>>>>>>>>
>>>>>>>>>>> Setting a mask to GENMASK() - 1 sounds weird. Is it really what you want?
>>>>>>>>>>> I so, why?
>>>>>>>>>>>  
>>>>>>>>>> Hi Mauro,
>>>>>>>>>>
>>>>>>>>>> the value of this dma mask should be 0xe0000000 -1.
>>>>>>>>>>
>>>>>>>>>> The background for the same is, 0xe0000000 onward memory space is allocated
>>>>>>>>>> for IO register space so we are restricting the driver buffer allocations
>>>>>>>>>> to 0xe0000000 - 1.
>>>>>>>>>>
>>>>>>>>>> Based on the comments received in the past, we are using GENMASK to
>>>>>>>>>> generate 0xe0000000.
>>>>>>>>>>
>>>>>>>>>> Does this answer your query or I missed something?  
>>>>>>>>>
>>>>>>>>> I'm not sure it will do what you want. (0xe0000000 -1) matches ~BIT(29). Perhaps
>>>>>>>>> you wanted to use ~0xe0000000. 
>>>>>>>>>  
>>>>>>>> value of dma mask is coming as expected with GENMASK(31, 29) - 1
>>>>>>>>
>>>>>>>> qcom-iris aa00000.video-codec: dma_mask DFFFFFFF (0xe0000000 -1)  
>>>>>>>
>>>>>>> Isn't this just the equivalent of GENMASK(28, 0)? Can't you use that?  
>>>>>
>>>>> Too early in the morning, this suggestion was clearly wrong.
>>>>>  
>>>>>>>
>>>>>>> It's much easier to understand than GENMASK()-1.  
>>>>>>
>>>>>> Sure, I can use either ~GENMASK(29, 29) or ~BIT(29),  
>>>>>
>>>>> ~BIT(29).
>>>>>
>>>>> It's really weird to just disable a single bit, so I think some comments
>>>>> explaining why this mask is needed would be good (if there aren't comments
>>>>> already).
>>>>>  
>>>> I tested this some more, and seems ~BIT(29) doesn't work, as its still
>>>> conflicting with the register space.  
>>>
>>> Odd, perhaps a 64 vs 32 bit issue?
>>>   
>>>> Correct value would be GENMASK(31,30) + GENMASK(28,0) to set the exact bits
>>>> to get the desired value i.e 0xe0000000 -1  
>>> Honestly, in this case I would prefer to just go with the actual hex value
>>> 0xdfffffff together with an explanatory comment.
>>>   
>> We moved to GENMASK way to address comment on previous version, but sure
>> can directly use 0xdfffffff with a comment.
> 
> If I understood it right, bits 0-31 can be used, but the hardware has some
> issue using bit 29 at the mask. Could you please comment why it can't be
> used?
> 
That would not be a correct statement, We don't have issue with using BIT
29 with mask but upper limit of DMA address available to use is 0xdfffffff.

Thanks,
Dikshita
> Btw, as this is a mask, IMO the better would be to document that all bits
> except for BIT(29) can be used with something like:
> 
> 	/* Bit 29 can't be used because ... */
> 	 .dma_mask = GENMASK(31, 0) - BIT(29)
> 
> Thanks,
> Mauro

