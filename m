Return-Path: <linux-media+bounces-45067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B319ABF2F76
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 20:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C7F734F7318
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 18:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69762C0280;
	Mon, 20 Oct 2025 18:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5a5tW1P"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1151F3BA4
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 18:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760985545; cv=none; b=oidt3utsGdAfNKQAQ5OSNRpmq4ibo7mb3GSyy0RGtCvqT6y/5no3B1MDbG7sIcU8nurD09j7cjBw+Nh/H75EEpeQ+bvAGVoNz5V9hmlrfxATaGiG3ksG50hMLB7yXZoE/VWdyQj6JMbiGARyRFH5irvJmnVp45cyVRBS03JA+W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760985545; c=relaxed/simple;
	bh=yulSoibBDiWX6jmpP3Ns1uXrdkIcA9BOI6Zi04OhpfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gf4n7kXZbVMLrnbgE3lni9jIXg+57nsYP1X2wHPIEwVdbbKewLDDrTT0qxB5LmJLtl/NTHO76Q6F19w8usCtILv+mbyJCea4X2Z/UNtqp/GrfII8hBrVEiiwEFUre3vdTPvdwHrgs/ILklfUUIB9rvT79tCVahhF39tRcTVBWsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5a5tW1P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KHukZq009985
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 18:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fcmR2kO0kprkS+hm2HYcnN1OE+DeFwRjnQPZTNVK23s=; b=L5a5tW1PBrgMDnbQ
	86ykVpx576xBLHDMIL1J2G1cas1zjehYpfvjWU0c5sbhTqajZXcaFfopgW4KqmM8
	A/Q7gf228qOx0umNVcSmWhaxW/golnCh69NgO5mlEIW8LpSPz+vLI6G/B9sOXTYE
	oPAWDEAw2wNHJzJW1i2X7h4FIsfXfT61oKTn15naaxjGQnI2AUPosw6hpag+2f+O
	nBoNHODh7MnLVM0R1Yq0dKqAY1hXCSkVbX3Q3i3Jyf4DMszQg07tIfVBW+3p2nlA
	dMKoqqwC02rAvFzRnzD/f88bSCEmjx3rRR9XrftMyBuTreLelMfHHwY+89o19reb
	HjXKkw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wswnr3p1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 18:39:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-780f9cc532bso4384246b3a.0
        for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 11:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760985542; x=1761590342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fcmR2kO0kprkS+hm2HYcnN1OE+DeFwRjnQPZTNVK23s=;
        b=U7+UyKLW+AzHwk/WRD3ZKeaooGUMFRtNsJJPRyJYpX9bRZ/hELT9WoErHBL9oqf7yZ
         texJSYTc+yMsxoaXBiChpNub1jfOhryJ8MYThmUNvMlbcgoiOMg+/IvniQBd5EnidgEC
         QrmcippNXhlY/PE0h9qPpGSjRLEdr2sZ8rKCu1QT7+TcRiaahaB56xCQQ5S0HaylLQEI
         pB8ruVCASeqspTIVWJLfuNLxEYAQlfRe+I688Od966HynpTbw0cTRdgc094riKiKw/Zl
         v42EpLYpqrzBEr8TaRsqAfig0GWJ14t7/NP2er0zu8rCH2GVrTABXHP+NAesLvVZ3p1o
         LasA==
X-Forwarded-Encrypted: i=1; AJvYcCX2e4jEE2zPAPuOp3PYnYOJAdX25ZbrMlTeLojhLfNtHxVt2DrUdxBeWzyge+O93domUE3ox5sxYUKPOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbrh20bv8emZxYiWvcubJfXOMOFvvt6h001z0WyWKU7BqyTKxa
	aWCgqG/Q1WGiSJIzNlDG865TgFM/+cWyZCNkGrJ2UkVifRGqNDS8aYAnPxUDtCajSyY0ULZCKjL
	58yfK2BgsFuIrud7AKwz66q4GWigmn3oP23s/WKb1+ooIhM2ns9sbJYAmF/kj+ROZfg==
X-Gm-Gg: ASbGnctxtBoPlx814eisAT8Thfr7TuFXeNR53ClthlS4M2DGRHgRpZ1cV1EPcYq4M4o
	UPqG9+SqX6Z8toN0raUsy0iXPto1OzObC9TtA3jxlEGceiLv1dUrh3Lh6AnU4rOBksxdEj6p9sW
	oeNymfkxVl6Pv3cprPywcTuhsMsYrgY/oCCl5pCWA35bJqBQgob5ZVH3+vl/HgqZtL6yf7fyGXY
	jnmlZyrToupT4YPsm9eyBjesG5wruzgfVJASgcirofG+S18Z9v8f37fYda+9bXYHBZfP/3SaSYq
	75S/pbeEcqm6yzY366gdGOZ5AmrOVOvLfBZ9gK+oX57i58knNI301DPbK8SdkYK6hbh45UFm9Jt
	rjPQ936tneuoYvhntXBStqnxFlt+l5UHI3o9NuQPGT/IZl1CfGne91A==
X-Received: by 2002:a05:6a00:1ad1:b0:783:44b9:cbc9 with SMTP id d2e1a72fcca58-7a210f59a7dmr21228049b3a.9.1760985541778;
        Mon, 20 Oct 2025 11:39:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd531l029AZFQSWcfW9dfoCX2M4tkX+bVgsI6Qgj1PP+Mt6uKXHJbY5qWihEk2UM8XaRvFog==
X-Received: by 2002:a05:6a00:1ad1:b0:783:44b9:cbc9 with SMTP id d2e1a72fcca58-7a210f59a7dmr21228013b3a.9.1760985541129;
        Mon, 20 Oct 2025 11:39:01 -0700 (PDT)
Received: from [10.62.37.19] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff1599dsm9006920b3a.4.2025.10.20.11.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 11:39:00 -0700 (PDT)
Message-ID: <9d6b7e9d-1656-408d-ae8b-4b3dc95ba905@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 11:38:58 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-1-f5745ba2dff9@oss.qualcomm.com>
 <e2c43a8c-a9cc-46a1-9ddd-5d6dfc7e917b@linaro.org>
 <49eaf7ec-ac71-4bf3-9a4e-25fa633d815e@oss.qualcomm.com>
 <abc9d825-1e98-4838-9e9c-ca18ba191e11@oss.qualcomm.com>
 <22d47da0-4912-4880-8a42-f6d4e61e094c@oss.qualcomm.com>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <22d47da0-4912-4880-8a42-f6d4e61e094c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3WsMM5Uf9m5KI4JG72UwZ8A5_kXyBW_m
X-Authority-Analysis: v=2.4 cv=Maxhep/f c=1 sm=1 tr=0 ts=68f681c6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xzpADP0L3AAWVpYwfikA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 3WsMM5Uf9m5KI4JG72UwZ8A5_kXyBW_m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfX6wYxysoNclM9
 +30+9+YKTjdUGdz9/kwX6QJq12/Ysx6i5vmc72AYEdK3fgcCk1GDMi2yU/cvY2A3HS/IpNF/tnG
 GEYlCFfDow7m3ai8A9PrlcAzBgp+SMk9RwJkrbBNYG0L6R2+2h772t5jfvzkcEp8nyEUI087jD7
 in6rClij+qWM+lr3RQgLXGvvsHwYI0aUtJ6CrXjzM1zIYJ0v9inod8GsqRmD0L/LqjvzwfdW2X2
 Mp7uuZyb6/ll7bGdcIx1P32JeXUEvnO8xzUw+WrgLDk42ZKTkgfnUMm5NPxP5ZLmIOBZC2DSqqZ
 uoCWs6wMsP9cKb9KlLEESspQmSDrc4B/aHleT6ZIRjlmB+yRmdKagAIO8QNYjRPLqoSojQekCfC
 Z2ymDdTG+6CZ/ULs23KkgoAaZIt2Ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148


On 10/19/2025 9:13 PM, Hangxiang Ma wrote:
> On 10/16/2025 3:56 PM, Konrad Dybcio wrote:
>> On 10/16/25 3:56 AM, Hangxiang Ma wrote:
>>> On 10/16/2025 3:30 AM, Vladimir Zapolskiy wrote:
>>>
>>>> On 10/15/25 05:56, Hangxiang Ma wrote:
>>>>> Add Kaanapali compatible consistent with CAMSS CCI interfaces. The 
>>>>> list
>>>>> of clocks for Kaanapali requires its own compat string 'cam_top_ahb',
>>>>> aggregated into 'qcom,qcm2290-cci' node.
>>>>>
>>>>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>>>> ---
>>>>>    Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 6 +++++-
>>>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git 
>>>>> a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml 
>>>>> b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>>> index 9bc99d736343..0140c423f6f4 100644
>>>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>>>> @@ -25,6 +25,7 @@ properties:
>>>>>          - items:
>>>>>              - enum:
>>>>> +              - qcom,kaanapali-cci
>>>>>                  - qcom,qcm2290-cci
>>>>>                  - qcom,sa8775p-cci
>>>>>                  - qcom,sc7280-cci
>>>>> @@ -128,6 +129,7 @@ allOf:
>>>>>            compatible:
>>>>>              contains:
>>>>>                enum:
>>>>> +              - qcom,kaanapali-cci
>>>>>                  - qcom,qcm2290-cci
>>>>>        then:
>>>>>          properties:
>>>>> @@ -136,7 +138,9 @@ allOf:
>>>>>              maxItems: 2
>>>>>            clock-names:
>>>>>              items:
>>>>> -            - const: ahb
>>>>> +            - enum:
>>>>> +                - ahb
>>>>> +                - cam_top_ahb
>>>>
>>>> Why is not to give the clock "ahb" name like on QCM2290?
>>>>
>>>> On QCM2290 the macro in front of the vlaue is GCC_CAMSS_TOP_AHB_CLK,
>>>> and name "ahb" is good for both, I believe.
>>>>
>>>>>                - const: cci
>>>>>      - if:
>>>>>
>>>>
>>>
>>> On Kaanapali the macro has been changed to CAM_CC_CAM_TOP_AHB_CLK. 
>>> GCC clock domain doesn't manage the AHB clock but CAMCC does. I 
>>> think it's better to create a new and more complete clock name to 
>>> denote the differences between them.
>>
>> Are there any other "AHB" clocks going to this block?
>>
>> If not, then this is more confusing instead
>>
>> Konrad
>
> On 10/16/2025 6:40 PM, Krzysztof Kozlowski wrote:
>> On 16/10/2025 03:56, Hangxiang Ma wrote:
>>>>
>>>> On QCM2290 the macro in front of the vlaue is GCC_CAMSS_TOP_AHB_CLK,
>>>> and name "ahb" is good for both, I believe.
>>>>
>>>>>                - const: cci
>>>>>      - if:
>>>>>
>>>>
>>>
>>> On Kaanapali the macro has been changed to CAM_CC_CAM_TOP_AHB_CLK. GCC
>>
>>
>> It seems you do not see the difference between GCC output clock and
>> actual clock input so some other block.
>>
>>
>>
>> Best regards,
>> Krzysztof
>
> No more clocks will be added, at least for KNP. And I acknowledge the 
> substance of AHB clock doesn't change. I will update and keep AHB 
> clock name the same as QCM2290. Thanks for both of you. @Konrad 
> @Krzysztof
>
> ---
> Hangxiang
There are several AHB clocks into the Titan subsystem, TOP AHB, core 
(TFE, OFE, IPE, IFE Lit etc.)level AHBs and fast and / or slow AHB 
variants of some of those, AHBs to the firmwares etc. It should be 
similar for any architecture, if I am not wrong. So should we consider 
using "cam_top_ahb" for it to be clear commonly for both Kaanapali and 
2290? Thanks.
>
>

