Return-Path: <linux-media+bounces-19652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DA799E2B3
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 11:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6717828326F
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 09:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B5F1DF255;
	Tue, 15 Oct 2024 09:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BMZmDK9Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD091BE854;
	Tue, 15 Oct 2024 09:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728984182; cv=none; b=ieehkgHLmrncYY6wXDv2LZj75pv1OD5t0bOohWF3keA5zCl643zYlejEtUiWUzHJRJh2nEfAMWLX3tQcXZLi8sgzIEB8VmbWuYNJ1aRHrFCZrF8nF0Ak8pSxEHlEy1wG9D4G6VRsIKlPw5gy52/OUCMRcn5XlmvqI3nVyLnHT/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728984182; c=relaxed/simple;
	bh=8/Wat0AXZ4Tmd5k7TUnKT8b5DBXzVYICqJKK1fttoU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DRDyrJJLPe4AOoo65Fes/1XZZ+qvWALPmD/s14tl+8qytn4krFKqD39CDWAgHfDYyRHFlJH3hqJxQAKOwViR7WwQ5K+Yknqh7K5ia0/JyTaKQQBvkpHJWVzpPrqHXFpD+IG1Nn8fVb00feB1vR8vkHvJ3g8Sqk9bJMnYQIhtZYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BMZmDK9Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F1fgJh028587;
	Tue, 15 Oct 2024 09:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zWi+0lylKH9kWhVPcyDH/IDcG6li7yETfPftN2qsCmM=; b=BMZmDK9ZcW2gv8SG
	nqp0WZpplBfKywpdcSMTTbxZ2zG2hP3Tu6pfUf5d2Zik7gkZAC8eJZfaCR4PJRFI
	d4WHaCipNKCV46j/BUWiMeC+uD8akZ1I8ay01+uQV4ObKpeFVHf472CSCkaC3544
	p76ExmphJYFCwfRO6rQGaD4jAVkxMaUgj2Ou0a6SWh9XOJuBcIeXNyGTq8rGM4Bu
	HO8Lf0i1/uHjEnl7iBFkKiAPzT5mJZ5S4DYmIqAlNrRziO0Wex1M+51Y96e6/ffw
	w2GEZSMtz8+s8sto8KiXpTEEBbpQM4wZz97eneCPAid1dhriK1m69K1+fpHAAE8K
	OVg3zA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429exw0yss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 09:22:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49F9MnWs026335
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 09:22:49 GMT
Received: from [10.204.101.50] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 15 Oct
 2024 02:22:44 -0700
Message-ID: <48f0e7a1-f5d4-62ec-ec4b-f5bf2ca9caa5@quicinc.com>
Date: Tue, 15 Oct 2024 14:52:41 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 27/28] media: iris: enable video driver probe of SM8250
 SoC
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jianhua Lu
	<lujianhua000@gmail.com>
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
        "Hans
 Verkuil" <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241014-qcom-video-iris-v4-v4-0-c5eaa4e9ab9e@quicinc.com>
 <20241014-qcom-video-iris-v4-v4-27-c5eaa4e9ab9e@quicinc.com>
 <Zw0j9UeJmC1MZ3Xt@localhost.localdomain>
 <7vmxx5qtbvhyfcdeariqiult27j5rmykxrefl2qmkhqnrw5wi5@6ugxtx643bmq>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <7vmxx5qtbvhyfcdeariqiult27j5rmykxrefl2qmkhqnrw5wi5@6ugxtx643bmq>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: K9oaYEshCCs1zm1gXNyo0JP2y6FX-cAX
X-Proofpoint-GUID: K9oaYEshCCs1zm1gXNyo0JP2y6FX-cAX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 clxscore=1011 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150063



On 10/14/2024 7:38 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 14, 2024 at 10:00:21PM +0800, Jianhua Lu wrote:
>> On Mon, Oct 14, 2024 at 02:37:48PM +0530, Dikshita Agarwal wrote:
>>> Initialize the platform data and enable video driver
>>> probe of SM8250 SoC.
>>>
>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>> ---
>> [..] 
>>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>>> index 86ef2e5c488e..a2aadd48926f 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>>> @@ -325,6 +325,10 @@ static const struct of_device_id iris_dt_match[] = {
>>>  		.compatible = "qcom,sm8550-iris",
>>>  		.data = &sm8550_data,
>>>  	},
>>> +	{
>>> +		.compatible = "qcom,sm8250-venus",
>>> +		.data = &sm8250_data,
>>> +	},
>>>  	{ },
>>>  };
>>>  MODULE_DEVICE_TABLE(of, iris_dt_match);
>>
>> qcom-venus driver has already supported sm8250 soc, I think you should add
>> an extra patch to drop sm8250 releated code from qcom-venus driver if you
>> tend to add support for sm8250 in qcom-iris driver.
> 
> Iris driver did not feature parity with the venus driver, so it is
> expected that two drivers will exist side by side for some time.
> Nevertheless ideally we should have a way to specify which driver should
> be used for sm8250 (and other platforms being migrated).
> 
Agree, we should have a way to specify this. Any suggestions to achieve
this are welcomed.

