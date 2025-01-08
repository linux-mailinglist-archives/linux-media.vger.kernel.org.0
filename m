Return-Path: <linux-media+bounces-24392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E856A05952
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 12:12:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 838A13A5BE3
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 11:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4051F892F;
	Wed,  8 Jan 2025 11:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AAHULk68"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2501D19D090;
	Wed,  8 Jan 2025 11:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736334746; cv=none; b=SjeNQhNpoSDngo8oQYoov70XaHNd7MJAsRh9iX1Sqo252cYBpE92G/mtdN4q511EMHjLTY7B084jyb4pDSswWXlF5W2tEnHZHfO4a+Tk6V7qqJ+Urrj1l5RnDOKeVmR/P0yhgv3rxcBO52yoRPrKlP7TuPmRf9CZvrYpQRvek2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736334746; c=relaxed/simple;
	bh=dEldfHW90ZhVsld/rEzXya6NixDsyXxn8WQJ9ua8eIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SK0kZD+/MdVnPxTQIDVjlsh2FLOuliD7F4VvYBccCr74UwxJhXCjkt3LYyqA43iB4400IJAybjyz/hjDCU9+n54WnQT8YeHtLWkqjL4qHFxSpG0cRHWE0IkKslkdXQYtyL3eW/RaYqvW1tPoulvDzbmjbr2AdG95WWPho6+/mdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AAHULk68; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508AdkDJ011449;
	Wed, 8 Jan 2025 11:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kfZCtz7Q9C5sAfmn6EtdHKleBcX5vhYfsfi24yR0vzg=; b=AAHULk68eHsXWA4Y
	Yl6ypCKk6TkvVsLNoWbOnA/oH9P+a+bJd/0ECAO9QIgj6yNImPkGW1HgbnWVg3O8
	dDF+izO9PJ8mpgiz/WpHZQz89J10fWxHzdz6juiQx8D8kP6SM7jtlOkpbzZ2nJ3C
	FGUnR51kkv+ePN07aFLwWf1NZ2qzTGBdVa42bR2zISZSSL/vDV0tHHAV5mbUAaas
	ENG3BvEYetdoy4NPzmxMe27QD0Y9hFF2qcbeS09vAjj717YthDyjqdYlOwg5HhBr
	RTTthn8Vdi6UDuSdxttL9erk8Bk1ACgVYlWFO9LeqACIDDOLjQkF+f6aVoI4JrXC
	QCV6gA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441nj2ggyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 11:12:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508BCDV5010351
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 11:12:13 GMT
Received: from [10.50.21.116] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 03:12:06 -0800
Message-ID: <5953bea1-194d-fe2e-251a-d4ef3e7544d3@quicinc.com>
Date: Wed, 8 Jan 2025 16:42:03 +0530
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
To: Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne
	<nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sebastian Fricke <sebastian.fricke@collabora.com>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>,
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
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <067d0deb-50ea-46bd-9f09-827b0ba61aa3@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rebeuzv89PKqycubTI12B6G-iSHlgzJg
X-Proofpoint-ORIG-GUID: rebeuzv89PKqycubTI12B6G-iSHlgzJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080091



On 1/8/2025 4:13 PM, Hans Verkuil wrote:
> On 1/8/25 11:21, Dikshita Agarwal wrote:
>>
>>
>> On 1/8/2025 2:25 PM, Hans Verkuil wrote:
>>> On 08/01/2025 09:51, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 1/8/2025 1:17 PM, Hans Verkuil wrote:
>>>>> On 08/01/2025 08:43, Dikshita Agarwal wrote:
>>>>>>
>>>>>>
>>>>>> On 1/7/2025 7:27 PM, Nicolas Dufresne wrote:
>>>>>>> Le lundi 23 décembre 2024 à 16:21 +0530, Dikshita Agarwal a écrit :
>>>>>>>>
>>>>>>>> On 12/23/2024 4:00 PM, Mauro Carvalho Chehab wrote:
>>>>>>>>> Em Thu, 12 Dec 2024 17:21:49 +0530
>>>>>>>>> Dikshita Agarwal <quic_dikshita@quicinc.com> escreveu:
>>>>>>>>>
>>>>>>>>>> +	.dma_mask = GENMASK(31, 29) - 1,
>>>>>>>>>
>>>>>>>>> Setting a mask to GENMASK() - 1 sounds weird. Is it really what you want?
>>>>>>>>> I so, why?
>>>>>>>>>
>>>>>>>> Hi Mauro,
>>>>>>>>
>>>>>>>> the value of this dma mask should be 0xe0000000 -1.
>>>>>>>>
>>>>>>>> The background for the same is, 0xe0000000 onward memory space is allocated
>>>>>>>> for IO register space so we are restricting the driver buffer allocations
>>>>>>>> to 0xe0000000 - 1.
>>>>>>>>
>>>>>>>> Based on the comments received in the past, we are using GENMASK to
>>>>>>>> generate 0xe0000000.
>>>>>>>>
>>>>>>>> Does this answer your query or I missed something?
>>>>>>>
>>>>>>> I'm not sure it will do what you want. (0xe0000000 -1) matches ~BIT(29). Perhaps
>>>>>>> you wanted to use ~0xe0000000. 
>>>>>>>
>>>>>> value of dma mask is coming as expected with GENMASK(31, 29) - 1
>>>>>>
>>>>>> qcom-iris aa00000.video-codec: dma_mask DFFFFFFF (0xe0000000 -1)
>>>>>
>>>>> Isn't this just the equivalent of GENMASK(28, 0)? Can't you use that?
>>>
>>> Too early in the morning, this suggestion was clearly wrong.
>>>
>>>>>
>>>>> It's much easier to understand than GENMASK()-1.
>>>>
>>>> Sure, I can use either ~GENMASK(29, 29) or ~BIT(29),
>>>
>>> ~BIT(29).
>>>
>>> It's really weird to just disable a single bit, so I think some comments
>>> explaining why this mask is needed would be good (if there aren't comments
>>> already).
>>>
>> I tested this some more, and seems ~BIT(29) doesn't work, as its still
>> conflicting with the register space.
> 
> Odd, perhaps a 64 vs 32 bit issue?
> 
>> Correct value would be GENMASK(31,30) + GENMASK(28,0) to set the exact bits
>> to get the desired value i.e 0xe0000000 -1
> 
> Honestly, in this case I would prefer to just go with the actual hex value
> 0xdfffffff together with an explanatory comment.
> 
We moved to GENMASK way to address comment on previous version, but sure
can directly use 0xdfffffff with a comment.

Thanks,
Dikshita
> Regards,
> 
> 	Hans
> 
>>> Regards,
>>>
>>> 	Hans
>>>
>>>> Please let me know which would be better?
>>>>
>>>> Thanks,
>>>> Dikshita
>>>>
>>>>>
>>>>> Regards,
>>>>>
>>>>> 	Hans
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> Dikshita
>>>>>>> Nicolas
>>>>>>>
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Dikshita
>>>>>>>>> Thanks,
>>>>>>>>> Mauro
>>>>>>>
>>>>>
>>>>>
>>>
> 

