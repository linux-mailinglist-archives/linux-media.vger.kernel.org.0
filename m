Return-Path: <linux-media+bounces-17668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F7096D6A1
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 13:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB8A81C233E6
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 11:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57DE7199222;
	Thu,  5 Sep 2024 11:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IoY345tm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EA619413B;
	Thu,  5 Sep 2024 11:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725534147; cv=none; b=gTr7RW514gDsxb62w8MrKb2skZjkjXdqTiLRh8E3BTWtS4CK0f9hdICR5WVmUFOgNGLuYCVQifNLkg0Xi+u+hF5dEnqqh0ptH9tlfkhdOtqy9eTjfX/2YI7SWpnKBPmeGNmc0ryadyjxMibafoHk2zWd2KKilFiSU1xDCOIAQAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725534147; c=relaxed/simple;
	bh=ZFdRC4A5sTItvhZXRVNVWQldHrRHtLXiPKSBlhWNfuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZB9CVxCHzwdJvaxuzUpLrGxvGrzaZWmgjwnbXU6IReBj6E1UUIt+4jQRz1YIsEEBh4BHbDy4s1nUTMoXLJ7lQTj5En0BNR8O0OZcdGNxtceYKiJXN6DP+Torez6gpjpUeJqjaTO9P7pSqZ43FMSPa5K9cJHT8Dj3e0R/9kzQ92g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IoY345tm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48597Bh8008901;
	Thu, 5 Sep 2024 11:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BfEiKs1H66nyF+gJ/YpC9LCfTEdm4n3aH2Qb1pf7mnU=; b=IoY345tmVmq5A/Xm
	Cc2dMePLTDrapDlCOfYyxHvkzlslnd2QzI5m5uc9xbv8omTjRYddM/qBHLt/Hmm9
	lUcLtETDw1Gg1TlWrlajGlwSVGZOGXwT5M1UHWKLqMB0PK0ftQmNdgY+/3PMStU9
	yV19S+9YEd51P1AYKjAndhRzboW/UwxWC3WNvWei8m1+acXRGgHKxZ2BirgZdCS8
	y85HFrLtDk/xrsFPrRs7F9YLRp8bvKRwR9nFyE/VwQXw7W7ubVN+Aw4zOC4N6cm4
	gxL6y91d4mLGJxDI0G3AuHr4OziiVZe4hakhP63vaNkTEiEbO7rzbT/a/c85CkiI
	qH4/Qw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41f91r0dhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 11:02:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485B2GAx017214
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 11:02:16 GMT
Received: from [10.216.46.64] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 04:02:11 -0700
Message-ID: <2108cb24-0e1b-c804-eb0d-397cefa0fc32@quicinc.com>
Date: Thu, 5 Sep 2024 16:32:08 +0530
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
From: Dikshita Agarwal <quic_dikshita@quicinc.com>
In-Reply-To: <tdvofocpygklipddgf7gbpttxdnmhe33krziwkzh2czpf4uiao@htiismc4dekz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SDA6edydo67fMzt0DkYyiIndBCStrjj2
X-Proofpoint-GUID: SDA6edydo67fMzt0DkYyiIndBCStrjj2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_06,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409050081



On 9/5/2024 3:40 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 05, 2024 at 11:17:55AM GMT, Dikshita Agarwal wrote:
>>
>>
>> On 8/27/2024 4:12 PM, Krzysztof Kozlowski wrote:
>>> On 27/08/2024 12:05, Dikshita Agarwal via B4 Relay wrote:
>>>> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>>>
>>>> Add an entry for Iris video decoder accelerator driver.
>>>>
>>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>>> ---
>>>>  MAINTAINERS | 11 +++++++++++
>>>>  1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 8766f3e5e87e..105e67fca308 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -18898,6 +18898,17 @@ S:	Maintained
>>>>  F:	Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
>>>>  F:	drivers/regulator/vqmmc-ipq4019-regulator.c
>>>>  
>>>> +QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
>>>> +M:	Vikash Garodia <quic_vgarodia@quicinc.com>
>>>> +M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
>>>> +R:	Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> +L:	linux-media@vger.kernel.org
>>>> +L:	linux-arm-msm@vger.kernel.org
>>>> +S:	Maintained
>>>> +T:	git git://linuxtv.org/media_tree.git
>>>
>>> Drop, you do not maintain that Git tree.
>> Sure, will remove
>>>
>>>> +F:	Documentation/devicetree/bindings/media/qcom,*-iris.yaml
>>>> +F:	drivers/media/platform/qcom/iris/
>>>
>>> Drop, does not exist. Or fix your patch order.
>> Are you suggesting to add this patch as the last patch of the series?
>> or remove just below entry and add one more patch at the end to update
>> MAINTAINERS file with the same?
> 
> Adding it after the patch that adds the driver should be fine. Likewise
> adding it at the end is also fine.
> 
sure, so should I add the whole patch once driver is introduced or have a
separate patch for just below?
>> +F:	drivers/media/platform/qcom/iris/
>>
>> Thanks,
>> Dikshita
>>>
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>>
> 

