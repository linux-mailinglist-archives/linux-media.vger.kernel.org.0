Return-Path: <linux-media+bounces-19278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABB09953C2
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 17:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBB191F21BC3
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 15:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119F51E04AD;
	Tue,  8 Oct 2024 15:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="culxwM3z"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B7F1E0B6F;
	Tue,  8 Oct 2024 15:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728402452; cv=none; b=JG2VFuY2zPGByTT4qLmpQTB9F16zFwQnSVYPs5RpTlrL/Uml3KFYK4NIA4NQ2n6eDDb7dg6e0Tiqg4qz2ER4KAbIqF/uTqipd8nAp78sGWH1pKLGILNt8xzBQn+dq/z9cdf6CVeddRK4cAo+eJfMcXTNdrYEX+wktdz6LdT9Wac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728402452; c=relaxed/simple;
	bh=jrGUCCOFgNET5QepnhaGPl/liH/doUk2RMTSUuE+YPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jxvpXxCnAKBI+MAaFl3X4gHa89rbRd6EFGtubFI4v8fM6gK8+Hh9dufk/753Fd+ljlGZts2RFsFMWjpUSNl/mQIj4uyzmNl1APwqu3nTJirvPBicDFihCfJwLTnCp6Gu+vtDSwrHjx8Mpne4nyIYSkuWj9i+NQ6P/iAMHVLo27w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=culxwM3z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4989nd0j007007;
	Tue, 8 Oct 2024 15:47:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XVeSEijPfHz4/1LtiqnJSCYCnP8GhN9ttkns2qfpwRU=; b=culxwM3zFc/5t8BU
	Vy761btLeXc+ALBec92oBs0pnbxdqoV3LafwaG/HlKzzoyr6rmbLqnBu6TplCChh
	rJPN6gbM9duADNo6BkhRjst2rSIDUa39zWKOC2ieggfl+L2D3NXFz88hXfMhAd7g
	1B246NLArjhAq4jf1qjdk2zNFw8i050vTa9+kyNeWdjM+70WfVgDUsywGIqbyn2z
	0SKD2rYEuYwCFgZdMSceGJa+ye5b6wtX6IKRv7HPYadnWQu+3c1obllrp4bGEXMr
	hGuc82YaMIV1EOsF5+4tPtkPF0+6AJ/yowh2MYoRifzYiwemPtuzdQC4bgm/Uys8
	YE9ZOA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424cy7cdtp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 15:47:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 498FlNNR015158
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 15:47:23 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Oct 2024
 08:47:16 -0700
Message-ID: <3cb945b7-4270-4e10-8ff8-020d31726ee3@quicinc.com>
Date: Tue, 8 Oct 2024 23:47:13 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>,
        <krzk+dt@kernel.org>, Neil Armstrong
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
 <53d2b30d-6480-41eb-8dc8-7b3970ad82ef@quicinc.com>
 <2b5f4043-1e23-446a-aba4-96e40fb8d197@linaro.org>
 <7dd6132f-52c2-4f0a-8eec-26791f250111@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <7dd6132f-52c2-4f0a-8eec-26791f250111@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ht3Q_3K6pJu7QKwKdkd0X-5dM6r1J6-m
X-Proofpoint-GUID: Ht3Q_3K6pJu7QKwKdkd0X-5dM6r1J6-m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 clxscore=1011 bulkscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080099

Hi Vladimir,

On 10/8/2024 10:06 PM, Bryan O'Donoghue wrote:
> On 08/10/2024 14:50, Vladimir Zapolskiy wrote:
>> Hi Depeng.
>>
>> On 9/30/24 12:26, Depeng Shao wrote:
>>> Hi Bryan,
>>>
>>> On 9/25/2024 11:40 PM, Depeng Shao wrote:
>>>> Hi Vladimir, Bryan,
>>>>
>>>> On 9/18/2024 7:16 AM, Vladimir Zapolskiy wrote:
>>>>> Hi Bryan,
>>>>>
>>>>> On 9/18/24 01:40, Bryan O'Donoghue wrote:
>>>>>> On 13/09/2024 06:06, Vladimir Zapolskiy wrote:
>>>>>>> On 9/13/24 01:41, Bryan O'Donoghue wrote:
>>>>>>>> On 12/09/2024 21:57, Vladimir Zapolskiy wrote:
>>>>>>>>>> 3. Required not optional in the yaml
>>>>>>>>>>
>>>>>>>>>>         => You can't use the PHY without its regulators
>>>>>>>>>
>>>>>>>>> No, the supplies shall be optional, since it's absolutely 
>>>>>>>>> possible to
>>>>>>>>> have
>>>>>>>>> such a board, where supplies are merely not connected to the SoC.
>>>>>>>>
>>>>>>>> For any _used_ PHY both supplies are certainly required.
>>>>>>>>
>>>>>>>> That's what the yaml/dts check for this should achieve.
>>>>>>>
>>>>>>> I believe it is technically possible by writing an enormously 
>>>>>>> complex
>>>>>>> scheme, when all possible "port" cases and combinations are listed.
>>>>>>>
>>>>>>> Do you see any simpler way? Do you insist that it is utterly needed?
>>>>>>
>>>>>> I asked Krzysztof about this offline.
>>>>>>
>>>>>> He said something like
>>>>>>
>>>>>> Quote:
>>>>>> This is possible, but I think not between child nodes.
>>>>>> https://elixir.bootlin.com/linux/v6.11-rc7/source/Documentation/
>>>>>> devicetree/bindings/example-schema.yaml#L194
>>>>>>
>>>>>> You could require something in children, but not in parent node. For
>>>>>> children something around:
>>>>>> https://elixir.bootlin.com/linux/v6.4-rc7/source/Documentation/
>>>>>> devicetree/bindings/net/qcom,ipa.yaml#L174
>>>>>>
>>>>>> allOf:
>>>>>>      - if:
>>>>>>          required:
>>>>>>            - something-in-parent
>>>>>>        then:
>>>>>>          properties:
>>>>>>            child-node:
>>>>>>              required:
>>>>>>                - something-in-child
>>>>>>
>>>>>> I will see if I can turn that into a workable proposal/patch.
>>>>>>
>>>>>
>>>>> thank you for pushing my review request forward.
>>>>>
>>>>> Overall I believe making supply properties as optional ones is
>>>>> sufficient,
>>>>> technically straightforward and merely good enough, thus please let me
>>>>> ask you to ponder on this particular variant one more time.
>>>>>
>>>>
>>>> So, we are discussing two things.
>>>>
>>>> 1# Use separate supplies for each CSI block, looks like there is no
>>>> doubt about it anymore. So, I will update it just like based on 
>>>> suggestion.
>>>>
>>>> csiphyX-vdda-phy-supply
>>>> csiphyX-vdda-pll-supply
>>>>
>>>> Then I will need below items in the required list if they are required.
>>>> required:
>>>>     - csiphy0-vdda-phy-supply
>>>>     - csiphy0-vdda-pll-supply
>>>>     - csiphy1-vdda-phy-supply
>>>>     - csiphy1-vdda-pll-supply
>>>> ...
>>>>     - csiphy7-vdda-phy-supply
>>>>     - csiphy7-vdda-pll-supply
>>>>
>>>> 2# Regarding the CSI supplies, if they need to be making as optional?
>>>> Looks like there is no conclusion now.
>>>>
>>>> @Bryan, do you agree with this?
>>>>
>>>
>>> I'm preparing the new version patches, and will send out for reviewing
>>> in few days. I will follow Vladimir's comments if you have no response,
>>> it means making supply properties as optional one, so they won't be
>>> added to the required list.
>>>
>>
>> Recently I published the change, which moves regulator supplies from CSID
>> to CSIPHY, I believe it makes sense to base the SM8550 change and 
>> regulators
>> under discussion on top of the series:
>>
>> https://lore.kernel.org/all/20240926211957.4108692-1- 
>> vladimir.zapolskiy@linaro.org/
>>
>> Note, that SM8250 regulators are not changed, however their names are 
>> wrong,
>> the correction shall be a separate change later on...
>>
>> Next, I developed my opinion regarding the supply regulator property 
>> names:
>>
>> 1) voltage supply regulator property names match the pattern "*v*- 
>> supply",
>>     and the most common name is "vdd*-supply", the match to the 
>> pattern shall
>>     be preserved,
>> 2) also it would be much better and it will exclude any confusion, if 
>> SoC pin
>>     names are put into the name, like it is done in a multitude of 
>> similar
>>     cases.
>>
>> So, in my opinion for SM8550 CAMSS a proposed set of voltage supply 
>> regulator
>> names should be this one:
>>
>> - vdda-csi01-0p9-supply
>> - vdda-csi01-1p2-supply
>> - vdda-csi23-0p9-supply
>> - vdda-csi23-1p2-supply
>> - vdda-csi46-0p9-supply
>> - vdda-csi46-1p2-supply
>> - vdda-csi57-0p9-supply
>> - vdda-csi57-1p2-supply
> 
> So I communicated to Depeng to take the patch for the regulators but, I 
> still don't think the above is the right way to do this.
> 
> I will take a pass at constructing something in the schema to capture 
> the case where a regulator is required if and only if it is instantiated.
> 
> May not be possible with our current syntax/tools but is 100% how the 
> hardware works so IMO is the right thing to try to do.
> 


Yes, I have picked your patch and rebased the SM8550 change based on 
your patch. I also verified them and it works good.

But I don't understand why the names are csi01, csi23, csi46, csi57. 
Could you please elaborate more?

I'm using csiphyX-vdda-phy-supply and csiphyX-vdda-pll-supply now.

Thanks,
Depeng


