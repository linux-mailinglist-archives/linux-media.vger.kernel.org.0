Return-Path: <linux-media+bounces-18780-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 250F8989E24
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 11:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63ADCB25B49
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 09:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E8118B470;
	Mon, 30 Sep 2024 09:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mysHxrrQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1380E18A6AF;
	Mon, 30 Sep 2024 09:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727688377; cv=none; b=UXCwgzHdzHkTiUEcYtxrOeXtXxjp7CQv/GdTEgldh3xBKX5p/Js5/bLuJBD0ZFFrTbpnb9pRvy7Fs30Gkeb7LSJR87Im+/XFrvyU9seqpmWTIkCMUxZcjQ2wF+ot2yuaWSoPXtkl+g2gd0aWmIHqLtju48TrpLEoRYk0aBI22CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727688377; c=relaxed/simple;
	bh=rCEUlI4599pZcSQ6FVgW4m8VFw0tr91OA8OBXpB9SLY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=LMhD7HaRgvaOMFE+Z8WPDTAEZFtq5AUmbRmQQvkN8iM6K4HJ8/SxSM2ICD03+uOpmDZKE0XFW6yjw7RfdjtPvVjMQiBQZbK1/+wpIPDtBSeUSDxBUUV0n1qpbEoCJF1tU+5WRlz33d1cR7C6fVIUigJdAj6eHYU2ILodE4KJA64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mysHxrrQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48TMrck6028154;
	Mon, 30 Sep 2024 09:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eSWFRVoTgob4hShoZcNm2EGj/sJnDLjD7nWz/haCgk8=; b=mysHxrrQvQ8TL4I1
	XKfVbErAFgZ0MKwfhgpBdzj4PFme1X+UUw473a+Ec/9bkXGVVIAimjZ1+rGOptDE
	dhbe3WWUd7NcUgPoZQmkvKwQlyFWh8cEiAaOc624jWsNeCqBonAWzIXvvnHQxwW3
	dNyg/PWwiGkX8gmtFYRwpJRjhAGJJrQizXmMt5/SctfF7OMeZXoYzXRJItjf63el
	m0cfhQVjtcnJLdYfaviVq3LWY1OdEuGEWEFDj06ORx7C7B/Q6yFanU9Guzo2p359
	eIIjJR13aBGZk4IiJux7cTn3SAvwtw9//Diz9Rl8WMmKdI5nzUiJIhDq/npZjHur
	2AjpJA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xb38v7fh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 09:26:11 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48U9QAvh019310
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 09:26:10 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Sep
 2024 02:26:04 -0700
Message-ID: <53d2b30d-6480-41eb-8dc8-7b3970ad82ef@quicinc.com>
Date: Mon, 30 Sep 2024 17:26:01 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
From: Depeng Shao <quic_depengs@quicinc.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>, <krzk+dt@kernel.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>,
        <mchehab@kernel.org>, <robh@kernel.org>, <todor.too@gmail.com>,
        <rfoss@kernel.org>, <conor+dt@kernel.org>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-8-quic_depengs@quicinc.com>
 <b1b4a866-fa64-4844-a49b-dfdcfca536df@linaro.org>
 <82dd61ab-83c0-4f9c-a2ee-e00473f4ff23@linaro.org>
 <da60cf71-13a4-465d-a0ee-ca2ad3775262@linaro.org>
 <97e4f888-1ed7-4d82-b972-3e0b95610198@linaro.org>
 <6eadc285-f413-4bf0-8795-59ff19c734da@linaro.org>
 <6562a958-47e9-4a49-b235-fe8deba3c051@linaro.org>
 <cab95caa-9ffb-446a-858b-342939e80811@mleia.com>
 <4e94106d-5ca9-485b-8c51-c18dcd4e64b0@linaro.org>
 <b779182f-a963-400a-8fc1-2468710082d2@linaro.org>
 <a0f66292-fb97-40ae-9fb1-d79160e70bb3@quicinc.com>
Content-Language: en-US
In-Reply-To: <a0f66292-fb97-40ae-9fb1-d79160e70bb3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CNx7MQM2Cn4XxQMWeWJtt1A60mduxX3X
X-Proofpoint-ORIG-GUID: CNx7MQM2Cn4XxQMWeWJtt1A60mduxX3X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409300067

Hi Bryan,

On 9/25/2024 11:40 PM, Depeng Shao wrote:
> Hi Vladimir, Bryan,
> 
> On 9/18/2024 7:16 AM, Vladimir Zapolskiy wrote:
>> Hi Bryan,
>>
>> On 9/18/24 01:40, Bryan O'Donoghue wrote:
>>> On 13/09/2024 06:06, Vladimir Zapolskiy wrote:
>>>> On 9/13/24 01:41, Bryan O'Donoghue wrote:
>>>>> On 12/09/2024 21:57, Vladimir Zapolskiy wrote:
>>>>>>> 3. Required not optional in the yaml
>>>>>>>
>>>>>>>        => You can't use the PHY without its regulators
>>>>>>
>>>>>> No, the supplies shall be optional, since it's absolutely possible to
>>>>>> have
>>>>>> such a board, where supplies are merely not connected to the SoC.
>>>>>
>>>>> For any _used_ PHY both supplies are certainly required.
>>>>>
>>>>> That's what the yaml/dts check for this should achieve.
>>>>
>>>> I believe it is technically possible by writing an enormously complex
>>>> scheme, when all possible "port" cases and combinations are listed.
>>>>
>>>> Do you see any simpler way? Do you insist that it is utterly needed?
>>>
>>> I asked Krzysztof about this offline.
>>>
>>> He said something like
>>>
>>> Quote:
>>> This is possible, but I think not between child nodes.
>>> https://elixir.bootlin.com/linux/v6.11-rc7/source/Documentation/ 
>>> devicetree/bindings/example-schema.yaml#L194
>>>
>>> You could require something in children, but not in parent node. For
>>> children something around:
>>> https://elixir.bootlin.com/linux/v6.4-rc7/source/Documentation/ 
>>> devicetree/bindings/net/qcom,ipa.yaml#L174
>>>
>>> allOf:
>>>     - if:
>>>         required:
>>>           - something-in-parent
>>>       then:
>>>         properties:
>>>           child-node:
>>>             required:
>>>               - something-in-child
>>>
>>> I will see if I can turn that into a workable proposal/patch.
>>>
>>
>> thank you for pushing my review request forward.
>>
>> Overall I believe making supply properties as optional ones is 
>> sufficient,
>> technically straightforward and merely good enough, thus please let me
>> ask you to ponder on this particular variant one more time.
>>
> 
> So, we are discussing two things.
> 
> 1# Use separate supplies for each CSI block, looks like there is no 
> doubt about it anymore. So, I will update it just like based on suggestion.
> 
> csiphyX-vdda-phy-supply
> csiphyX-vdda-pll-supply
> 
> Then I will need below items in the required list if they are required.
> required:
>    - csiphy0-vdda-phy-supply
>    - csiphy0-vdda-pll-supply
>    - csiphy1-vdda-phy-supply
>    - csiphy1-vdda-pll-supply
> ...
>    - csiphy7-vdda-phy-supply
>    - csiphy7-vdda-pll-supply
> 
> 2# Regarding the CSI supplies, if they need to be making as optional?
> Looks like there is no conclusion now.
> 
> @Bryan, do you agree with this?
> 

I'm preparing the new version patches, and will send out for reviewing 
in few days. I will follow Vladimir's comments if you have no response, 
it means making supply properties as optional one, so they won't be 
added to the required list.

Thanks,
Depeng

