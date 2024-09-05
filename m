Return-Path: <linux-media+bounces-17667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7943A96D693
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 13:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E02C1C23113
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 11:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492401991D5;
	Thu,  5 Sep 2024 10:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KIvnwBWC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3A21990CE;
	Thu,  5 Sep 2024 10:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725533997; cv=none; b=RUvaUd87nmmLw7g9X0AW0QKjU2Y4W4O2+r0BwsCZS33Fvj3qlFpdGvcaN7/zqcPu1aMZIGApLBweca6PCTLvK5pce640aod4KA2akvkqpXUn3aqNW06XqsPXdSSE2nmJJiwxQZfn7uIq5RBTaatg6ketVOcJpswHANnFyykR0ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725533997; c=relaxed/simple;
	bh=G8vIAqhBoCUmW3PYj1YRTTXzOEypuOjhZ2S4WZOUKEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PrS8lRKm/XXvj8cF/v1BvOeEk/zMZFtQImRE7ZOfkktIlzb2h220SyQqfYfnJv60N5YvNX+Larr8kiS/C+F131rwa1n+dS/kSouXHUpjJobdDbJrlUaiGBIUsISPZo3wGBo5l3EHnWMBqUNBGD2C6+H/gS7FZxDrYmXVpjKT2/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KIvnwBWC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48597lfR004502;
	Thu, 5 Sep 2024 10:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/hRnIwW1i7chXnFLofgXR//0tKVfnDVwkMWp0okmFq8=; b=KIvnwBWCsCyS8wN4
	LB3h4jjajGTyUlBk3rb8J7I/JzcOCtWKLfnS1Ndqt9LAaWUOcoYmUKK7UNg4Bye/
	pXyvj+CbfDL64DbStSTex8qhc7OSrI4s9Nfn2aFn8n/Q19IvGr2wwxWWlJ2UHuLm
	CXvdJ+QSjpU0cYUEiZtntZR+0/GFB/JigDktXdrfrkKDKEryBzlCQ9OgQlJnVO7s
	H/rR+eBKDi9YHbWyg8deBaQedTXM8KNrx2zYu/pN9lFlr6ujD/j76cX1e/2WJo4B
	EaJGKTaADWZCK+3efxaz58apXYcTs5Z2P87fWaHgw1k+XuOm94fglKt/g85WSyP3
	ITrBAQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bt675svf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 10:59:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485AxlJo008601
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 10:59:47 GMT
Received: from [10.216.46.64] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 03:59:42 -0700
Message-ID: <bcfdeaf6-58c7-1c53-035b-07ae4bfa37f0@quicinc.com>
Date: Thu, 5 Sep 2024 16:29:39 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 03/29] media: iris: add platform driver for iris video
 device
Content-Language: en-US
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
	<p.zabel@pengutronix.de>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-3-c5fdbbe65e70@quicinc.com>
 <74126160-57f9-4abf-a26c-3491c8f3dd78@linaro.org>
 <zfltcl5x4hol2foftyvr4oigxus4hnequd74zi7bdd7tsdv56q@3nphukr4zgmm>
 <fa674301-9c4e-c4de-361a-1d1abf413ffc@quicinc.com>
 <adb2eed8-8d5e-a052-81b3-cde705c3503b@quicinc.com>
 <ydah7lm6ov26fy5odqc6u6vlfu2w5gzqxquplimhbdamw3gdpj@dmgdr52pvm5g>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <ydah7lm6ov26fy5odqc6u6vlfu2w5gzqxquplimhbdamw3gdpj@dmgdr52pvm5g>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5r8qYnlRL7_Ea-fKWD5EzJ5GEkpV1K_L
X-Proofpoint-GUID: 5r8qYnlRL7_Ea-fKWD5EzJ5GEkpV1K_L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_06,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050080



On 9/5/2024 3:41 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 05, 2024 at 11:45:25AM GMT, Dikshita Agarwal wrote:
>>
>>
>> On 9/5/2024 11:42 AM, Dikshita Agarwal wrote:
>>>
>>>
>>> On 8/29/2024 2:43 PM, Dmitry Baryshkov wrote:
>>>> On Tue, Aug 27, 2024 at 03:08:03PM GMT, Bryan O'Donoghue wrote:
>>>>> On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
>>>>>> +static const struct of_device_id iris_dt_match[] = {
>>>>>> +	{ .compatible = "qcom,sm8550-iris", },
>>>>>> +	{ .compatible = "qcom,sm8250-venus", },
>>>>>> +	{ },
>>>>>> +};
>>>>>> +MODULE_DEVICE_TABLE(of, iris_dt_match);
>>>>>
>>>>> The enabling patch for the compat strings should come last - if its first
>>>>> then the time between the compat add and the last patch is a dead zone where
>>>>> things are bound to break on a booting board.
>>>>
>>>> But then it's impossible to test the driver in the interim state.
>>>> Moreover enabling it at the end only makes it hard to follow platform
>>>> data changes. What about adding sm8550 at this point and adding sm8250
>>>> at the end? Or enabling qcom,sm8550-iris and the fake qcom,sm8250-iris
>>>> now (and clearly documenting it as fake) and as the last patch change it
>>>> to qcom,sm8250-venus.
>>>
>>> Sure, we will add qcom,sm8250-iris at this point so that it enables the
>>> testing of the driver, and will add one patch at the last to add
>>> qcom,sm8250-venus.
>> Sorry fixing the typos. what I meant was,
>> we will add qcom,sm8550-iris at this point so that it enables the
>> testing of the driver, and will add one patch at the last to add
>> qcom,sm8250-venus.
> 
> I hope you meant 'to change qcom,sm8250-iris to qcom,sm8250-venus'. Also
> please clearly document that qcom,sm8250-iris is a temporary thing just
> to facilitate documentation and testing of the driver to be removed as a
> last patch.
> 
I was agreeing to follow this suggestion of yours
"What about adding sm8550 at this point and adding sm8250
at the end?"
Where we will add sm8550(qcom,sm8550-iris) first so driver can be tested on
sm8550 and add sm8250(qcom,sm8250-venus) in the last patch.
I think Bryan also agreed to the same.
>>>
>>> Thanks,
>>> Dikshita
>>>>
>>>
> 

