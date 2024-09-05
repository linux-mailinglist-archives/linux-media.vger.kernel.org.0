Return-Path: <linux-media+bounces-17672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B875396D6D1
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 13:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 462B01F2623C
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 11:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B895B199389;
	Thu,  5 Sep 2024 11:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X+L2wY/+"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7115194A61;
	Thu,  5 Sep 2024 11:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725534836; cv=none; b=ZQyNxRr1lNAKqCMru7e4Fn7RXre+HoZi123uPoedJiffvAUWiBfS+uUnALRHy1bbRvH0A80NixMiS6xoPUR204qQIvkmVEKC6Smbtd8sqRuzWmU0KLKluJzPmpBGoOO9k/Xj74nUbIvJ3ZD7IcPSvik5vvTkyVR9s0ZCCACs3NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725534836; c=relaxed/simple;
	bh=q3odayBUC48ttl67f9rTJzHtF510j1fax/cMiY7xTgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pnH8B1xe8ujYf3yA16H8D9sFdH86DBTvCPMVhSDdSwqbs7znZWq5jKWDqwvhr4ZvdK3Af0zaE+dq3uqYPjsUi7rmp18SHBf/7OVwKX4nogsbBAEciSWcHScV0gRbTM1JMJABxQ4h9HG5BPElu92cRageW4oNMujBt77ZAd14LrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X+L2wY/+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48597NT5002154;
	Thu, 5 Sep 2024 11:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QbNe/FgErEC3RvJy4xyFPEI0Um7dNobSWdkWZqmBj2U=; b=X+L2wY/+QvpdOSr2
	Zl/1yqf57j6dQFsB8UbTePiOJg3PxzTGuOW0+OJjZjxGG8c1TnoIB4vCeqHRJ+Df
	ZLOwbgPhXNi+c+1aNXYQWNDidZfZNvu7RqBHQR5MAmmZd00fkbdp92wLHjdF8jkV
	Cq2dOca+AvbEk0BL0wX12AJj8WJUwbBNJGCFYPtM0GwiuImfy8kDieVznOZS3Dpy
	zvnT1A6Rq1tlD8xvMsAcVB2+yWT9JQhZo5zK6fhgpaTZiOLi8ol5BuAuGxXaYcCA
	Lk8ir/6QyAl2typY6APWTTOqrteRONRsj5IWVqUA8Ne+ddFRQDz0Kw1U9tXfEcFS
	9QboGw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bt675tw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 11:13:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485BDjs9024056
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 11:13:45 GMT
Received: from [10.216.46.64] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 04:13:40 -0700
Message-ID: <2ba270bf-5995-b152-0def-a900aac836fa@quicinc.com>
Date: Thu, 5 Sep 2024 16:43:37 +0530
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
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Dmitry Baryshkov <dbaryshkov@gmail.com>,
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
 <bcfdeaf6-58c7-1c53-035b-07ae4bfa37f0@quicinc.com>
 <CAA8EJpp75N0OHZZ+dLnKXXDk7AksJjYkKP0uwJ+da3zA+60KgA@mail.gmail.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <CAA8EJpp75N0OHZZ+dLnKXXDk7AksJjYkKP0uwJ+da3zA+60KgA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9-YzNrzt0sRPbrpoy9rR55bjbrZ1Cd_X
X-Proofpoint-GUID: 9-YzNrzt0sRPbrpoy9rR55bjbrZ1Cd_X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_06,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050082



On 9/5/2024 4:37 PM, Dmitry Baryshkov wrote:
> On Thu, 5 Sept 2024 at 13:59, Dikshita Agarwal
> <quic_dikshita@quicinc.com> wrote:
>>
>>
>>
>> On 9/5/2024 3:41 PM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 05, 2024 at 11:45:25AM GMT, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 9/5/2024 11:42 AM, Dikshita Agarwal wrote:
>>>>>
>>>>>
>>>>> On 8/29/2024 2:43 PM, Dmitry Baryshkov wrote:
>>>>>> On Tue, Aug 27, 2024 at 03:08:03PM GMT, Bryan O'Donoghue wrote:
>>>>>>> On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
>>>>>>>> +static const struct of_device_id iris_dt_match[] = {
>>>>>>>> +        { .compatible = "qcom,sm8550-iris", },
>>>>>>>> +        { .compatible = "qcom,sm8250-venus", },
>>>>>>>> +        { },
>>>>>>>> +};
>>>>>>>> +MODULE_DEVICE_TABLE(of, iris_dt_match);
>>>>>>>
>>>>>>> The enabling patch for the compat strings should come last - if its first
>>>>>>> then the time between the compat add and the last patch is a dead zone where
>>>>>>> things are bound to break on a booting board.
>>>>>>
>>>>>> But then it's impossible to test the driver in the interim state.
>>>>>> Moreover enabling it at the end only makes it hard to follow platform
>>>>>> data changes. What about adding sm8550 at this point and adding sm8250
>>>>>> at the end? Or enabling qcom,sm8550-iris and the fake qcom,sm8250-iris
>>>>>> now (and clearly documenting it as fake) and as the last patch change it
>>>>>> to qcom,sm8250-venus.
>>>>>
>>>>> Sure, we will add qcom,sm8250-iris at this point so that it enables the
>>>>> testing of the driver, and will add one patch at the last to add
>>>>> qcom,sm8250-venus.
>>>> Sorry fixing the typos. what I meant was,
>>>> we will add qcom,sm8550-iris at this point so that it enables the
>>>> testing of the driver, and will add one patch at the last to add
>>>> qcom,sm8250-venus.
>>>
>>> I hope you meant 'to change qcom,sm8250-iris to qcom,sm8250-venus'. Also
>>> please clearly document that qcom,sm8250-iris is a temporary thing just
>>> to facilitate documentation and testing of the driver to be removed as a
>>> last patch.
>>>
>> I was agreeing to follow this suggestion of yours
>> "What about adding sm8550 at this point and adding sm8250
>> at the end?"
>> Where we will add sm8550(qcom,sm8550-iris) first so driver can be tested on
>> sm8550 and add sm8250(qcom,sm8250-venus) in the last patch.
>> I think Bryan also agreed to the same.
> 
> To point out, qcom,sm8250-iris can not stay.
yes, we are not using it currently as well.
> 
>>>>>
>>>>> Thanks,
>>>>> Dikshita
>>>>>>
>>>>>
>>>
> 
> 
> 

