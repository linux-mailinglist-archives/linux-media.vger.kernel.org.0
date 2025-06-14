Return-Path: <linux-media+bounces-34807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39638AD9F76
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 21:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B26DD3B8BE1
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 19:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5E92E763F;
	Sat, 14 Jun 2025 19:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCr5qJjF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BC4156C6F
	for <linux-media@vger.kernel.org>; Sat, 14 Jun 2025 19:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749929350; cv=none; b=ToE2LXbrXYxQfEChsAlwZMoHouFH9kxcbvsGR84CS7AR0goHN3fOeBflkwlQNwYpZWlta454eWDVMRYoQvJaDfpACnyghjCLC55fySR7ZMUIWNR6xz07Vavib5JwffNcRb/Op8yZrAM06NkGkH+eFyNs+AtnVChMdkIPYc8bcHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749929350; c=relaxed/simple;
	bh=xBWb4Vx+9iYeEzK+u1HVql964u9ityny0CkbK7SzumI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MyXDIhwFT08nV1hyx41i/JWwKAUy35ILiO6IWF3BHgrvCh9cmpVi2SJ7KFleHOt5Mv3adBtmQCceCv12A1mq1KI+zWcwBbofSiLe/2nI+4/Rx1K2GmvCQ8nP7XHXlv6K1bHGqZU00q3S8Trn3Z2KLPxiAKuesW3bK0t7x8mhQoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCr5qJjF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EHwe1p030098
	for <linux-media@vger.kernel.org>; Sat, 14 Jun 2025 19:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RmDl5XdrxtUmGgttdm0D/Ht8p5oObZ7nQYXHWGILly0=; b=bCr5qJjF0J6SsMvA
	HrPmlNzCZPo38Rcw4jd6fDI6nxDYgrzxRr4e2QW4WYtQr/L3ia8XK+WYzQEY6vjb
	7FMzydgwrJitDQOv9xFBhzE+jADVnN5nhaiE080pxEY1jyeP1T8Zhr4yzvT4iH1S
	OdWE5Rr+Dzy5UdXHyqTCkyTHmn7hrhQNX1Aok3JUdkrXqineR34JZxr86goV2qpq
	Jgvab2eAZIrifMrjAqkNOywqzDXVdmuVyTDF87Z29DQMm0NcCB80pfGUFPAd7Omv
	UE7O8Sc6jizSFa5waEJePPxR34lY7lu6IlL0ZxTwcOzdYrYyzVPCRKd9nnsJP7q0
	WjzgbA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crgx45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 14 Jun 2025 19:29:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a517ff0ebdso7532291cf.3
        for <linux-media@vger.kernel.org>; Sat, 14 Jun 2025 12:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749929347; x=1750534147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RmDl5XdrxtUmGgttdm0D/Ht8p5oObZ7nQYXHWGILly0=;
        b=eE+jgsjbdzy6T6+nAu4Ccp1Vz3pzlLnH11wFHtvycz0UNpWC7LOyHFTmOws2B7Wv68
         BYLbX94X3eAg9mceQTQTEVQa/J/7ECe2Lb3MkoUjBFRq0UGC0Tq5SQUmXOpgUhWUN7Xc
         AM8ZV5cP/SaziemeHLGbgsHLgdZgCXcZg2ImOiUyKk6tptde4sRBJ3hRMWt5+FNAcnew
         s+HOh1USOJzgGg/wP3H8LW8TJGJP4SgG1UYYpWIMCW2LkZ9axCTtpChMmdUltJN9alAf
         +BfpLUhZAc5utNTD2kDF2d0v00+VkpfDtsClAdN2tpVac5cxa77ZgKogZUeLi8VWG7Xd
         ZE+w==
X-Forwarded-Encrypted: i=1; AJvYcCVk1dXsAQM3I8GmF01KmgPDIr7bN67lBBWVlnW+wwKqDw+JXWlmaPao3vZ8FxdJfpzScTbLicxW8oyF1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwO46tzJ85RcA/iIuytn4MpWrBhlCk+Zt9drHMWwBtymE9qE4tv
	qPOImv8c51+ew2OwZDiqt13/J2cQIpEbISC3mEFa5GWliggZ0kPyBuIFGBchHhJeWqzYHiPA7F6
	xfXveHbWnmrbEUXOGzPMQyVkuUgi6bCfWvMaGDQH81bGi4scTIONrlCo3WPR7IWBkLA==
X-Gm-Gg: ASbGncvRDr7ju+bccUkEjGaZXnghaeqFsSFMBHYNhMrncll8ETaKf4VuufCtKmvJjUi
	16flH68Gk+hDRBc7PQzu0jsclp4FIG5UMLMAIB327lNzYCTHwdoX27hmouYXp6R3k64edQEXg3w
	FLfWopJuud6XOC2EzAkzJv5d3HmqdiBgrfbRGCOUG640ADAhRckWY3RfTypPfLkVlC9yiQs+FWD
	P78cC7hmpKm+4DLITqoqlRn8N6WApousFrSNOnL7/wRA+PXLiBemMiEj5VP9C2wte5zIdWSd1kq
	vU5fGFwz7V4wDvQnMkuIF0SSNGvs6s6j6d3ec0xrw5UcVnpRnN2u2c3/jQFqJgz1n8dEVPdWug/
	bc68=
X-Received: by 2002:a05:622a:1903:b0:494:5984:1022 with SMTP id d75a77b69052e-4a73c5a4600mr22418491cf.11.1749929347179;
        Sat, 14 Jun 2025 12:29:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGsVKnNQLpvRnu1ZQSmUOek/Q9FOFzcJQZRaWYRHRFg0qSnSfgW4C3Go5265XFYUDWcy5Q2w==
X-Received: by 2002:a05:622a:1903:b0:494:5984:1022 with SMTP id d75a77b69052e-4a73c5a4600mr22418361cf.11.1749929346692;
        Sat, 14 Jun 2025 12:29:06 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88fee81sm354561566b.91.2025.06.14.12.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 12:29:06 -0700 (PDT)
Message-ID: <d22f7815-c76c-4bed-85e1-bdd43df6a79c@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 21:29:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] dt-bindings: media: qcom: Add Qualcomm MIPI
 C-/D-PHY schema for CSIPHY IPs
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-9-vladimir.zapolskiy@linaro.org>
 <6e411e89-ce1e-4d6a-8d48-b800554f830e@kernel.org>
 <e02cead0-665d-443a-a884-c3a307409c66@kernel.org>
 <9e38a09b-1521-4196-b179-d29c62e143bc@linaro.org>
 <4848f13b-3b2c-4210-933c-b4f28d7c6ae7@oss.qualcomm.com>
 <9bd4ff5d-7c51-4e21-91e8-17c6bcab7f67@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9bd4ff5d-7c51-4e21-91e8-17c6bcab7f67@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2IVVM9CrELSUhtriQwgtafceWFqOmv2s
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=684dcd84 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=b0AXgi5J3pU-1zpc9bAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2IVVM9CrELSUhtriQwgtafceWFqOmv2s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2MiBTYWx0ZWRfXxvMViS1kG5dY
 Lz3qjDNh+vKLbvJJ6Er9+gqFhwlpFWTjGCHXgzR5yWIL45WOOw9Nxh0+hVX4TRoFu2htr6KS4Kg
 kS5zLLHDMuSrZeNmYRmkI5L3zajDpT84gREaAkCW7j0Ra7wmm6bCz+BeD+X2QF4Qk8AhfUft+4M
 V3/uNzvqo6vmo8/55Y5DNYMaZP6Anip7BeEzSQ6qzsKcpmVEUnKMlaEqx3K4EzJWuTJyT2O62wg
 yFaqxbdCxanuUSD/dl9keKkliu1pePlc3j8iIKtbf777wjc2TzydzfB9TjcxqVYX2DFk3XjO7zb
 wSpO7wMl8NpdJINW1kqfTztPUSmmWh+wC/1lEl2q/VM9gnKW/iOG4rrqbdEwoWtm9uT/9cghBnB
 JoUFck+WBnFpmRgXvHfliIF67EvHh1yKxIX7Vb9eAVRDMunTcOcJx1ja8VDNnfk3JhiCOxOA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506140162

On 6/12/25 6:44 PM, Vladimir Zapolskiy wrote:
> On 6/12/25 19:17, Konrad Dybcio wrote:
>> On 6/12/25 9:57 AM, Vladimir Zapolskiy wrote:
>>> On 6/12/25 10:39, Krzysztof Kozlowski wrote:
>>>> On 12/06/2025 09:38, Krzysztof Kozlowski wrote:
>>>>> On 12/06/2025 03:15, Vladimir Zapolskiy wrote:
>>>>>> Add dt-binding schema for Qualcomm CAMSS CSIPHY IP, which provides
>>>>>> MIPI C-PHY/D-PHY interfaces on Qualcomm SoCs.
>>>>>>
>>>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>>>> ---
>>>>>> RFC verion of the change:
>>>>>> * https://lore.kernel.org/all/20250513143918.2572689-1-vladimir.zapolskiy@linaro.org/
>>>>>>
>>>>>> Changes from RFC to v1:
>>>>>> * moved from phy/qcom,csiphy.yaml to media/qcom,csiphy.yaml,
>>>>>> * added 'clock-names' property,
>>>>>> * removed SM8250 CSIPHY specifics, a generic binding is good enough for now,
>>>>
>>>>
>>>> Now I noticed this... weird change and clearly a no-go.
>>>>
>>>> Device binding cannot be generic, so it is not good enough for now.
>>>> Please write specific bindings for specific hardware.
>>>>
>>>
>>> Can I add platform specific changes on top of the displayed generic one
>>> like in Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>>> etc?
>>>
>>> The generic compatible is sufficienlty good for adding the enhanced
>>> CSIPHY support to any currently present in the upstream platform CAMSS.
>>>
>>> Obviously I can rename it to something SoC-specific, but then a question
>>> arises, if a selected platform has to be a totally new one in the upstream,
>>> or it could be among any of platforms with a ready CAMSS, and a backward
>>> compatibility is preserved by these series and the new CSIPHY dt bindings.
>>
>> A YAML file hosting common properties will probably be very welcome, but
>> the compatibles must be specific to avoid having to redo this dance in
>> a couple years..
> 
> Right, that's a good way for sure, and I keep this option in my mind.
> 
> My concern is that it might be not a perfect fit particularly for CAMSS
> CSIPHY IPs, because likely at least all currently supported in the upstream
> CAMSS IPs will get one in one equal hardware descriptions, despite CSIPHY
> IPs are obviously different. In other words I anticipate that there will
> be just one platform prefixed YAML file with a long list of various platform
> specific CSIPHYs, and therefore it's just one potential $ref user of this
> hypothetical YAML file containing common device tree properties of CSIPHYs.

One big YAML file may be okay too.. think:

compatible:
	enum:
		- qcom,csiphy-v1.0.0
		- qcom,csiphy-v1.2.0
		- qcom,csiphy-v2.0.0

clocks:
	// if oneOf then that many clocks, else that many

etc. etc.

> 
>> Then, the camera ip is well-versioned, so you can use that as the 'specific'
>> part. It'll also make it easier to resolve the unlikely case of a SoC using
>> a mix of different PHY versions.
>>
> 
> Many thanks for input and reviews, regression test results of the given
> CAMSS driver changes will be also very much appreciated, it may be helpful
> for Bryan.

I'm afraid I don't have any board which would be both unique and
with working camera..

Konrad

