Return-Path: <linux-media+bounces-23686-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3BC9F5E81
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 07:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CA1C18912B7
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 06:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD1015625A;
	Wed, 18 Dec 2024 06:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A1Zou1gm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A80F1531E2;
	Wed, 18 Dec 2024 06:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734502430; cv=none; b=pFGRQXBt+xqnxIV69FEy9d3SdBZ0JQZILYyBjLtLwXcfDq9Ns0wifBTVlt5KUZ+Cy2ECQFOXTY5B3yqQpVcJehSvM74VdUOhOLaNmfI+mwRTsN7ffsqn2lX1v92AiOdmMyRZQsKQxjE6MDRE69uWfu6Q/sn85ms1kAf40DZxniM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734502430; c=relaxed/simple;
	bh=ULkiHeIxcroL4aoO9mR4+tZrDDXJ2n1DMknkr780nd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CR4wgDVg6uSto1nU8N+8RplRDIv4fjswtyKQPEVMVc6zxukon2lg51CDPlNVFKkgb3eSa5Oai+Phaq80YTuUSb4qWcPnovhYRtO76Zs39MIoCS1oPgcSq1Yp76sKIatVHGHk7HD00+eYJEY67HkOrDa1ZbmVOV8+AUMyktP9FPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A1Zou1gm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHKdkjj001491;
	Wed, 18 Dec 2024 06:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5lMwlVK/itx/MCZ41tA0FzSerZgJb//wRujeNinjcTg=; b=A1Zou1gmLIJ8cMHx
	siSywPMGRnjl1Wb7Tsuddzob18trZGOnjuVSt/D3rRsgtz6SZBOmQhLOGPNPRzd5
	JQq+db8gAAdOpPGkeSDyGPSNj2b9wp+6r3w0fDjLQBSKX7114buoZEXgz4gIuDph
	c6+35OE3KbgDcWFnty4p03VMJ0hoXtkEfbJ36hEwaQ2RaVj0uOXf+Jey95nNQ6H0
	W7wZV+yPrTerbKGNc4jZGYjO/B0XTUy/upmc2qfLXYz1jhC9/2dYOEVwDjUOhg7q
	0tNLEYN+9NevDMATKU2Sdp96vc3vH/KM1P2V5Gw3IhXcUwVxH78Nbd6HBKuozIdd
	caR8BQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kghk132g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 06:13:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI6DhM4025835
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 06:13:43 GMT
Received: from [10.231.216.103] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Dec
 2024 22:13:38 -0800
Message-ID: <de1eeaf9-4cd5-4c11-be83-c7cf1b52ef1a@quicinc.com>
Date: Wed, 18 Dec 2024 14:13:36 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: qcs615: add venus node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Stanimir Varbanov
	<stanimir.varbanov@linaro.org>
References: <20241217-add-venus-for-qcs615-v5-0-747395d9e630@quicinc.com>
 <20241217-add-venus-for-qcs615-v5-3-747395d9e630@quicinc.com>
 <83fcb683-d610-4e47-bcce-128453a0afef@linaro.org>
 <3cb0d715-3756-4cef-bcc0-3bb550811c73@quicinc.com>
 <hu5nkn34gkx5x4wdtpvstf5atrgl533vynlgvjec4z3jdo4rac@yt6t5mmfcwtm>
Content-Language: en-US
From: Renjiang Han <quic_renjiang@quicinc.com>
In-Reply-To: <hu5nkn34gkx5x4wdtpvstf5atrgl533vynlgvjec4z3jdo4rac@yt6t5mmfcwtm>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ddm7Ox8b3bEhuxBOHGbtMDnjbdP_nZ65
X-Proofpoint-ORIG-GUID: ddm7Ox8b3bEhuxBOHGbtMDnjbdP_nZ65
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180048


On 12/17/2024 8:09 PM, Dmitry Baryshkov wrote:
> On Tue, Dec 17, 2024 at 05:54:57PM +0800, Renjiang Han wrote:
>> On 12/17/2024 5:38 PM, Bryan O'Donoghue wrote:
>>> On 17/12/2024 09:17, Renjiang Han wrote:
>>>> +
>>>> +            video-decoder {
>>>> +                compatible = "venus-decoder";
>>>> +            };
>>>> +
>>>> +            video-encoder {
>>>> +                compatible = "venus-encoder";
>>>> +            };
>>> I gave you feedback on this in v4.
>>>
>>> Could you please provide some commentary on why you're persisting with
>>> this ?
>>>
>>> - Driver configuration should not live in dts
>>> - A patchset exists to mitigate this
>>> - If you don't want to use that series, what do you propose
>>>    to resolve this ?
>>>
>>> Please don't just ignore feedback, either act on it or add to your
>>> commit log _why_ you didn't act on it.
>>>
>>> ---
>>> bod
>>   Thanks for your review. You pointed it out correctly. As replied in v4,
>>
>>   I also think your change is a good change, but your change involves many
>>
>>   platforms.
> You can help it by reviewing it and then providing a Tested-by tag for
> it.
OK. I'll try it.
>
> P.S. Something is wrong with your emails, I see a lot of lines separated
> by empty lines. It makes it harder to read.
>
Thanks for your reminder. I'll check my environment.

-- 
Best Regards,
Renjiang


