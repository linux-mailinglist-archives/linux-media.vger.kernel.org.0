Return-Path: <linux-media+bounces-15938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7097194AB4A
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 17:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2483A282CA4
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 15:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CF712E1E0;
	Wed,  7 Aug 2024 15:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aP9NnCxR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C2878C67;
	Wed,  7 Aug 2024 15:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723043051; cv=none; b=a0zya9PrABJMKsFKM7xJMrgkUop2gapVxDeVNWhxP+izJHsiVOjRBtn04C3FVXtdD0yjv8gxI7Twe3eLkdpt8bYk/Ys+PNgh5ZfWtqDRzAUPR3F4b4Vngw71g+d4eBeSNz/ZVuckPDDCAEg2pM4tGn/AiIVu9kbCr/UTYu+nY8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723043051; c=relaxed/simple;
	bh=AW4oJxgDMSIGfvbiUjJMohsaTkK3nVI+Ow/6ORgTGqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EqhGNsP1FgnyZ2yDv0LjwKGVIX0riX53LjDbfIYgN9rs4fMihg33EzOf76FKzfSUPFbtSQxu4LiqgucABJ7L5MN5WQYGKctiJqNjfer3AHIx0aG3NIWQhQbfeN3spghfWP3FcLjnm1c1CIAs4S59OPbpdKi2Lf/vjqZF97dwBXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aP9NnCxR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4778DxN5002857;
	Wed, 7 Aug 2024 15:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ROn9BmIOv923LfjYstHIrvLocxc6Z7XaPrBDmX4KWWQ=; b=aP9NnCxRmnimuSqK
	c0Dgvt3hIyWLhjtqRkNOKaqr86QKIMvnAger9CEfpSxukWwWcq9AJpm2JX72g74x
	su4GtRuHRmD87Hs2XnLyDuZWaSlq3SFNrcExvyTkorgbw9ar6ICa6jvYTe+Au8T8
	he/4kBO8fAGYcC4BrDfHB96C2CV6xSYH7bjLX6OCxEMvLSwImS0M4iBmV8pWHjJR
	2Lm/Ganss4A6/l5lxf2/o/Q+Vn5OTcJGg0GLyAgPQ97Ot4XwVkA3phLF9yegFM1v
	1kP6C4Holt/31sag5KJ4CyU4UHJ1p8p0Q+B/BrJochut+hhnFi+CQowiWgr6bZdZ
	/xhqdA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sdu9axea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 15:04:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 477F42Kt010601
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Aug 2024 15:04:02 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 Aug 2024
 08:03:57 -0700
Message-ID: <7c03280f-908d-435d-acef-b6bf4f865029@quicinc.com>
Date: Wed, 7 Aug 2024 23:03:55 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] media: qcom: camss: csiphy: Add an init callback to
 CSI PHY devices
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        <rfoss@kernel.org>, <todor.too@gmail.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_eberman@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-5-quic_depengs@quicinc.com>
 <6dfc2c79-fc6d-4eed-bf3f-94396130cb4f@linaro.org>
 <fafda7d5-3853-428a-b0eb-9993fc2d4f56@linaro.org>
 <4426c0e0-f877-409c-b2d2-a5aac5e8c645@linaro.org>
 <1226d080-d1fc-4e06-ac81-84e93cb314e0@quicinc.com>
 <8f935a7d-87b5-479c-a98e-c95671dbe259@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <8f935a7d-87b5-479c-a98e-c95671dbe259@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NE36SZdm1nl2VGnKMJk62g9sNeGw72lo
X-Proofpoint-GUID: NE36SZdm1nl2VGnKMJk62g9sNeGw72lo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_11,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=709 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408070106

Hi Bryan,

On 8/7/2024 10:04 PM, Bryan O'Donoghue wrote:
> On 07/08/2024 14:08, Depeng Shao wrote:
>> Hi Vladimir,
>>
>> On 8/5/2024 5:26 AM, Vladimir Zapolskiy wrote:
>>> Hi Bryan,
>>>
>>> On 8/1/24 11:16, Bryan O'Donoghue wrote:
>>>> On 01/08/2024 00:43, Vladimir Zapolskiy wrote:
>>>>>> +    ret = csiphy->res->hw_ops->init(csiphy);
>>>>>
>>>>> Here.
>>>>
>>>> What name would make more sense to you ?
>>>
>>> according to the implementation the .init() call just fills some data in
>>> memory, so I believe this could be handled at build time, if it's done
>>> carefully enough...
>>>
>>
>> This camss-csiphy-3ph-1-0.c is reused by many platforms, the old 
>> platforms have same CSI_COMMON_CTR register offset, their offset are 
>> 0x800, but some new platforms may have different CSI_COMMON_CTR 
>> register offset, for example, the CSI_COMMON_CTR register offset is 
>> 0x1000 in sm8550, then we need to add new file to support the new 
>> csiphy HW, e.g., camss-csiphy-3ph-2-0.c, so Bryan asked me to develop 
>> the CSIPHY driver based on his changes, then we just need few code to 
>> enable new CSIPHY.
>>
>> Regarding the hw_ops->init interface, since it fills HW register 
>> configurations and HW register offset, then maybe, it also can be 
>> called as HW operation.
>>
>> And looks like we can't move it to camss-csiphy.c since it does 
>> platform specific operation and it is related to the registers.
>>
>> Please feel free to share other comments if you don't agree with it. 
>> Thanks.
>>
>>
>> Thanks,
>> Depeng
> 
> So, I agree the phy init data could be obtained via resource structs 
> but, rather than add yet more patches to this series, I'd say we can 
> make the move to a separate resource struct pointer at a later date.
> 
> Lets drop this patch and @Depeng we can then do
> 

> +    regs->offset = 0x800;
> 
> media: qcom: camss: csiphy-3ph: Use an offset variable to find common 
> control regs
>


Do you mean only drop "[PATCH 04/13] media: qcom: camss: csiphy: Add an 
init callback to CSI PHY devices"?


[PATCH 05/13] media: qcom: camss: csiphy-3ph: Move CSIPHY variables to 
data field inside csiphy struct
Do you mean this is still needed? Just don't move the code from 
csiphy_gen2_config_lanes to csiphy_init, right?


[PATCH 06/13] media: qcom: camss: csiphy-3ph: Use an offset variable to 
find common control regs
The offset change is also needed, just need to add the offset for 
different platform in csiphy_gen2_config_lanes .

Please correct me if my understanding is wrong. Thanks.

> As a bonus that's one less patch for this series which @ 13 patches is 
> already large.
> 
> ---
> bod

Thanks,
Depeng


