Return-Path: <linux-media+bounces-17673-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 756BA96D6DA
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 13:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED8BA1F215E0
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 11:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750C519415D;
	Thu,  5 Sep 2024 11:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OLUIcOJj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621DE199247;
	Thu,  5 Sep 2024 11:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725534869; cv=none; b=piggBMXvKlyQuEgtFbCAq/LHnlaimB1tsT6XOwRwaNLbF0AIlOFKeQ40IN/hASciFf7by0sl2R108Bd+xrFVakE7ToQh9Ve8at399jmxzueWuvLiA1SJjIbn7JyRGMK7FfClIi2IvnzBFrp5fbBXJw26zHKzIrmX+5EtCf99cb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725534869; c=relaxed/simple;
	bh=/Hki5a1bsehYW9KnV/KZCdaEfDYBT+eF2SQREZTYE4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=phf84z6dYeiRu2vU7/xVhN+mVWLtZw2egLzVk4mbEBnOwZaD7BHebG/D4MY5RjEwczQQlljZhUHGB1HyAssKwuCHiw2W5anZQKxESGKH6lpv3xCThh6II3VuS9kv8B9x8bB+RUm3QDalTWXBBchp8xo01bBfo4qMvzFR6Gz+7HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OLUIcOJj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48597206025917;
	Thu, 5 Sep 2024 11:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H/onZTNapTZoV/5wqwqOKg44uzr8+SRWVEiUw2X6/ak=; b=OLUIcOJjAqsdcCE4
	x2eoWKZv08AsDGyCxrW2LeptCw4crLpayv91BjwYF92+1yx8EXruduqQUQ+VJKVG
	O3UIuGBvmFpGSdpcqQnw20nxjMHq0SwzVkvjF84L3xi82hqCNsLHGKnN90fTgTk3
	d/Flydwn2AiVTftRqUxfqiL6ave8f3wF2QjbdIG+iCtRSfgWqX7iuMXyQF/nEcpJ
	z7llA/clxpgrCDvOkK4vbK52Lw6UEWpM/KqOhDKY7cSH4TBwS7rFgbXqybx830na
	JXP1+/FvZdE5y9YMnKwS2a8VwL/MM6IDc2W50idw7spfiVuN9wrkbjS8EJUtkZ/M
	4gdV/w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41drqe81tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 11:14:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485BEKuM032089
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 11:14:20 GMT
Received: from [10.216.46.64] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 04:14:16 -0700
Message-ID: <2a7ab8f7-44af-c994-953b-813b7aaa68e7@quicinc.com>
Date: Thu, 5 Sep 2024 16:44:13 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 02/29] media: MAINTAINERS: Add Qualcomm Iris video
 accelerator driver
Content-Language: en-US
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-2-c5fdbbe65e70@quicinc.com>
 <afba364d-8299-49b6-9848-ed1660f86327@kernel.org>
 <809c359f-6c24-f2d4-3c4b-83e543d8c120@quicinc.com>
 <tdvofocpygklipddgf7gbpttxdnmhe33krziwkzh2czpf4uiao@htiismc4dekz>
 <2108cb24-0e1b-c804-eb0d-397cefa0fc32@quicinc.com>
 <CALT56yMni-p3XSj=pa4yU7GtgKqXW2wXVfAvwAXjAjxRdQdJRA@mail.gmail.com>
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <CALT56yMni-p3XSj=pa4yU7GtgKqXW2wXVfAvwAXjAjxRdQdJRA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7oZflV2TwLMC0JM_-EOjsUvrt1RQMRmd
X-Proofpoint-ORIG-GUID: 7oZflV2TwLMC0JM_-EOjsUvrt1RQMRmd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_06,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409050082



On 9/5/2024 4:32 PM, Dmitry Baryshkov wrote:
> On Thu, 5 Sept 2024 at 14:02, Dikshita Agarwal
> <quic_dikshita@quicinc.com> wrote:
>>
>>
>>
>> On 9/5/2024 3:40 PM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 05, 2024 at 11:17:55AM GMT, Dikshita Agarwal wrote:
>>>>
>>>>
>>>> On 8/27/2024 4:12 PM, Krzysztof Kozlowski wrote:
>>>>> On 27/08/2024 12:05, Dikshita Agarwal via B4 Relay wrote:
>>>>>> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>>>>>
>>>>>> Add an entry for Iris video decoder accelerator driver.
>>>>>>
>>>>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>>>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>>>>> ---
>>>>>>  MAINTAINERS | 11 +++++++++++
>>>>>>  1 file changed, 11 insertions(+)
>>>>>>
>>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>>> index 8766f3e5e87e..105e67fca308 100644
>>>>>> --- a/MAINTAINERS
>>>>>> +++ b/MAINTAINERS
>>>>>> @@ -18898,6 +18898,17 @@ S:        Maintained
>>>>>>  F:        Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
>>>>>>  F:        drivers/regulator/vqmmc-ipq4019-regulator.c
>>>>>>
>>>>>> +QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
>>>>>> +M:        Vikash Garodia <quic_vgarodia@quicinc.com>
>>>>>> +M:        Dikshita Agarwal <quic_dikshita@quicinc.com>
>>>>>> +R:        Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>> +L:        linux-media@vger.kernel.org
>>>>>> +L:        linux-arm-msm@vger.kernel.org
>>>>>> +S:        Maintained
>>>>>> +T:        git git://linuxtv.org/media_tree.git
>>>>>
>>>>> Drop, you do not maintain that Git tree.
>>>> Sure, will remove
>>>>>
>>>>>> +F:        Documentation/devicetree/bindings/media/qcom,*-iris.yaml
>>>>>> +F:        drivers/media/platform/qcom/iris/
>>>>>
>>>>> Drop, does not exist. Or fix your patch order.
>>>> Are you suggesting to add this patch as the last patch of the series?
>>>> or remove just below entry and add one more patch at the end to update
>>>> MAINTAINERS file with the same?
>>>
>>> Adding it after the patch that adds the driver should be fine. Likewise
>>> adding it at the end is also fine.
>>>
>> sure, so should I add the whole patch once driver is introduced or have a
>> separate patch for just below?
> 
> I'd say a single patch is better.
Noted.
> 
>>>> +F:  drivers/media/platform/qcom/iris/
>>>>
>>>> Thanks,
>>>> Dikshita
>>>>>
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>>
>>>>>
>>>
> 
> 
> 

