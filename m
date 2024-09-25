Return-Path: <linux-media+bounces-18558-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BE29863D1
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 17:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30E9F28A754
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 15:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF1C17557;
	Wed, 25 Sep 2024 15:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o/bWVpAB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C28DDC5;
	Wed, 25 Sep 2024 15:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727278829; cv=none; b=XZf1V6iP99HI9P4zqFqLFPT5Y9MXl91YWffHjKFrgqzcVVfNtk7iyxs0MdsoG/WAoO3zyFMVt95VDUF1m1UCbIP8T2zi6/Zk9HVytff7CGeG+Pnj6Wl0L7wR+wu83ov+ecBsvN2D5jiyVPsw7wB6J9a0teyyEfOvXBXl7oGMWmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727278829; c=relaxed/simple;
	bh=986SlRrlycEw9SEZ7YlGWIbuS0GUP+bBf/BOWdsi/cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NvXSlbn5URxNUwSxmXWXlsk2rGhCmI+zLlsIOutf5PUYmled4IKXmT0dW2C9n7wo6J/Vw1SHK7dX+xrgP7jQsr2F4DPyVFlh4H9u7bVy6jX6JgXC2jQXfUkEkGpGru+EWMlCz7CfzfWACXJr+UPZhXss2fyuEmrdLjjU+vyNs8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o/bWVpAB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48P7TBAx002097;
	Wed, 25 Sep 2024 15:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eu5BTfN7gGDmJfFLzwg37VwuJ3b5VZixko81Swn6aOw=; b=o/bWVpABz4/j08O8
	InPMwtLHG2uvu/JWp/aQYvHM6s295xronx4XcgfZROWxjkOEtkk9k1uTi2A7B9b9
	DJ3Y/tJm7PmkpvTywUKQqc572TSKqjbtVPav67OPxsZAXcyCtPcOj1KO/wPSUzjk
	Iv4AwU48P8SdN8FoEK4K0Uul2bF8B97zX7UvFq9f6ofUeufX8ZlLQQj1CWVyebwu
	mSEsnyN1fJhskV5ohPicI7bqYyzhr5YKsNzaIKrO4bEywwOLctCuWuEHoZCy7HtB
	4Cow7GaseO2cTKWZyEddhtz/SUKU6S+yBLZAvdtKk+lw2XiHY4vx8NWVGbE9OriW
	LmFntw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41spwevfmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 15:40:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48PFeMpw008110
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 15:40:22 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Sep
 2024 08:40:16 -0700
Message-ID: <a0f66292-fb97-40ae-9fb1-d79160e70bb3@quicinc.com>
Date: Wed, 25 Sep 2024 23:40:14 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
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
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <b779182f-a963-400a-8fc1-2468710082d2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CCd-aqsO0QRZw8MMe7MBcT94d3Vl79kg
X-Proofpoint-ORIG-GUID: CCd-aqsO0QRZw8MMe7MBcT94d3Vl79kg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250112

Hi Vladimir, Bryan,

On 9/18/2024 7:16 AM, Vladimir Zapolskiy wrote:
> Hi Bryan,
> 
> On 9/18/24 01:40, Bryan O'Donoghue wrote:
>> On 13/09/2024 06:06, Vladimir Zapolskiy wrote:
>>> On 9/13/24 01:41, Bryan O'Donoghue wrote:
>>>> On 12/09/2024 21:57, Vladimir Zapolskiy wrote:
>>>>>> 3. Required not optional in the yaml
>>>>>>
>>>>>>        => You can't use the PHY without its regulators
>>>>>
>>>>> No, the supplies shall be optional, since it's absolutely possible to
>>>>> have
>>>>> such a board, where supplies are merely not connected to the SoC.
>>>>
>>>> For any _used_ PHY both supplies are certainly required.
>>>>
>>>> That's what the yaml/dts check for this should achieve.
>>>
>>> I believe it is technically possible by writing an enormously complex
>>> scheme, when all possible "port" cases and combinations are listed.
>>>
>>> Do you see any simpler way? Do you insist that it is utterly needed?
>>
>> I asked Krzysztof about this offline.
>>
>> He said something like
>>
>> Quote:
>> This is possible, but I think not between child nodes.
>> https://elixir.bootlin.com/linux/v6.11-rc7/source/Documentation/ 
>> devicetree/bindings/example-schema.yaml#L194
>>
>> You could require something in children, but not in parent node. For
>> children something around:
>> https://elixir.bootlin.com/linux/v6.4-rc7/source/Documentation/ 
>> devicetree/bindings/net/qcom,ipa.yaml#L174
>>
>> allOf:
>>     - if:
>>         required:
>>           - something-in-parent
>>       then:
>>         properties:
>>           child-node:
>>             required:
>>               - something-in-child
>>
>> I will see if I can turn that into a workable proposal/patch.
>>
> 
> thank you for pushing my review request forward.
> 
> Overall I believe making supply properties as optional ones is sufficient,
> technically straightforward and merely good enough, thus please let me
> ask you to ponder on this particular variant one more time.
> 

So, we are discussing two things.

1# Use separate supplies for each CSI block, looks like there is no 
doubt about it anymore. So, I will update it just like based on suggestion.

csiphyX-vdda-phy-supply
csiphyX-vdda-pll-supply

Then I will need below items in the required list if they are required.
required:
   - csiphy0-vdda-phy-supply
   - csiphy0-vdda-pll-supply
   - csiphy1-vdda-phy-supply
   - csiphy1-vdda-pll-supply
...
   - csiphy7-vdda-phy-supply
   - csiphy7-vdda-pll-supply

2# Regarding the CSI supplies, if they need to be making as optional?
Looks like there is no conclusion now.

@Bryan, do you agree with this?

Thanks,
Depeng

