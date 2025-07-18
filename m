Return-Path: <linux-media+bounces-38052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B556B0A04A
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 12:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A42AE4E3E62
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 10:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F3E29E114;
	Fri, 18 Jul 2025 10:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U92lZ4sZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C910B29E110
	for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 10:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752832938; cv=none; b=B4s+ty7bPUqlX7PYhbCUTWDHjirkq9JdSjsKBGzefYXWRHAJ3zm/kCdx9xlOM+JWbCClH5pzCckNZZfEkK2j45haIgb2hDvVe2wdpTiGMwO0RSLOeszmoecmZ0DLZ+0huezz7TjjKhLG2z4iT5TeEutlqyUSTtpbf5fvKvIS218=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752832938; c=relaxed/simple;
	bh=lnhb0ySI0088PB1lUpBys7KbTBrrcl0YpbsujVo0JNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pCzxBLkNjHJ1HTx1Gydi8Py+FqOHOmmTKxRxhFqxE6Q0M/IYh2gk8rRf/d6uvSyG7P8iqjfrINkKU4CqDAHVnhYCYzVZUmOjuzRHP9Yba2mad2wOmkkwMRayD1VrfpR2BHusM5QNKh6OyTx57XxEAOdhx6dhQRCDDuEc/OnV4eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U92lZ4sZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I89ONB020662
	for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 10:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0qM9SPLbl25oSm/rdxT6kzqYyAlEqCsAFiFbYNCk/KI=; b=U92lZ4sZq1sYxuqF
	RMRWx0LbXsEPxrsK63e7P9jHiaiGMuiM8zmv2SGGQczFxgvayYUwoPoSN/UldWba
	I8zOQlmGOnkmyfIGgQDyAP8JSBixPYQ/OqtJg29ZQbMhVaVAuHoJ7RZm3TvnqRJA
	0T1WworjelPkAphBeVHtPoQWCvMElXXm30wK6o5JiHr1UqgWlbGL/wMbZdX3fvuB
	gmAq7QnzFJ7E5OkgaN1ux6Y2cvkaM5kh8HG16l5he1cWtE7vM6E7w2QpUHjjhmcV
	07wLsmpPaxqXqBpyonWdlo65A6nMMpOlgjLmKQS45nvUOitT4T8+AHoiGxtJR+Zy
	WRza7g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpp5b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 10:02:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab65611676so4117281cf.0
        for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 03:02:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752832935; x=1753437735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0qM9SPLbl25oSm/rdxT6kzqYyAlEqCsAFiFbYNCk/KI=;
        b=GsKvqcbJeUUnFo4wpZqp26bl1texYyKKxuKvXJJWMhu4t7VmxW68nug/femkBxax2y
         eh6EiqXfVOlUGzvdocTYMhiXqtO27ilJn/WFvWsjq0awwtUg+l6+WoMKoqLIq/PMz5MG
         f+Ts8E/ZGVYAnC9+xjo71pcgOB7DZ0mzpys1B8FAA8kOgzAWSGFQ77CdnOmhGHngY/aE
         GQ1c+NMd8uF2DIi8RIdD2OauMAeHSRrOuCu2UhZz+Sxs39f1GGuICLaTaTfCGL78SA5D
         f/fA6ipg+V0+s4yLlf1B8jjkfb1fZocgPuuMOs2ainTqmDdB1MkGIAGdledWKRZ/LKZ3
         WOPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXJBNfqIvhBf7yQxZEOVPsa7lslnRRBTMnxRBKwZXyeH26nhoeiO1JZAAw4hONnRyOBIWA+gD79BxAMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNj6JQlUX6Wd/D3ljqqXYolS1h7xIwK3poef4N3L/BRzQf0Df4
	TefRK7XuXxoUi4lRpmh2bVkMRaKjBMBcn6/TplxB/MzdUQwx7rTpG7bZAdKB9KVTa6Pmd438tcx
	VuawYz5h1KU0JcaXle5coVxj9yUlbRPv3L3xVasySZVN743iNefUyUnhqzjhXvQf6bg==
X-Gm-Gg: ASbGnctsOe1V3l5Ck71RNdG3vaGM0SO/2R0kOn+DOcOl1/JDhd10Mw+d/r5Bf/nnZfy
	c/kXCGCaQ2CvjLnymbRKVW61KGFfJx4a0j21IZpeiHV350HgGeLNvOIBE9ItgZ9cHQLSeNOY/sL
	I7WoggJQmAECoahjF0NZJ/t3+MdJunuqxW1Le8f/kjNZjsthY4gCP9KryYnVhO+qUlOqvwy9nS/
	EnbkVf6TZ+XaC5k/IDx0+XJ8sNUAhQeESH8ulvrd79w1HB5ekHsIULpAZYZviR9pxiS63o3j8Io
	GEyHiCx1i/AzVRs17VASRUqzp9XdoNL0HUDoh0w86p5U8llwCzRSGYvdF0FUsedhyWOE+udo5yn
	Fm8uC6t7hJ2xctKRwDt0C
X-Received: by 2002:ac8:5955:0:b0:4a9:94ab:cc77 with SMTP id d75a77b69052e-4ab90cef17amr66370121cf.14.1752832934091;
        Fri, 18 Jul 2025 03:02:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC/G+2G5cRghesDAgaxo+7QhMzxQEA27REFMfb98JnxzDJ1nx/GPwKROpl7j1hP9p6gXtFyA==
X-Received: by 2002:ac8:5955:0:b0:4a9:94ab:cc77 with SMTP id d75a77b69052e-4ab90cef17amr66368111cf.14.1752832928839;
        Fri, 18 Jul 2025 03:02:08 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c907759bsm734954a12.54.2025.07.18.03.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 03:02:07 -0700 (PDT)
Message-ID: <18d013e5-352e-457b-ba96-3dd19f1cbaed@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 12:02:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] media: dt-bindings: venus: Add qcm2290 dt schema
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, krzk+dt@kernel.org, konradybcio@kernel.org,
        mchehab@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-2-jorge.ramirez@oss.qualcomm.com>
 <8a63f517-a443-48e4-9b9c-0c4b362f59f8@linaro.org> <aHiZpnFhhR5O0h97@trex>
 <0bb2867a-393b-46f9-ad6f-1aeee5a3a9d4@kernel.org> <aHjbjw8Z79Xcd/ZJ@trex>
 <aHksJum91s4ZmI56@trex> <5afbaf46-bbb1-47d8-84aa-29b18987564f@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5afbaf46-bbb1-47d8-84aa-29b18987564f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3OCBTYWx0ZWRfXzXY5ycbXqe7p
 w/6pcr+UBroLob7KALQVCAW+rnYhcxXthxCCRr4hMaFRL6wyrLTH4zSKEYrmLfik8C7Tc+6Vhbg
 0r8Z2EEZmq8o02V49OzzP359TMDFbPUxwarTw3Pt0VswVbXKllkJsbUIUo4QBGv28Ut9hqftcoG
 huPqewo7wsFNLqLLNzsiZYFfUJrRtMnnKSVxLULYqKDVmuzAguZk8F2ylWlU9aqLIZO5ipMIRgr
 kLnPdVRs6B1fFmw0mYhIC5BkyJlVgyUf5Q25BOv2Y90bw1LUKbSodpScAZrw1yLguR9WLv9k5iC
 +fKXDZyTX7qftairZOpwxgy1lrDsdN37fjY3OF6ZJYj2q+Pz2FNQEjOgibdkeW+3sVPvf3cBl5+
 tEpPKKZZsj/6mW9U1swSLIrd8aErBDflPwiTA7u/D069EYXNUfFS/MmRlzLIWHBAG2fMJBE9
X-Proofpoint-GUID: DYxEfzh1eEH3l1cyX_8niaKrzch978Nj
X-Proofpoint-ORIG-GUID: DYxEfzh1eEH3l1cyX_8niaKrzch978Nj
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=687a1ba8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=wioUFQZao2dT8TSE7RkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180078

On 7/18/25 8:27 AM, Krzysztof Kozlowski wrote:
> On 17/07/2025 19:00, Jorge Ramirez wrote:
>> On 17/07/25 13:16:31, Jorge Ramirez wrote:
>>> On 17/07/25 08:45:17, Krzysztof Kozlowski wrote:
>>>> On 17/07/2025 08:35, Jorge Ramirez wrote:
>>>>> On 17/07/25 00:22:53, Bryan O'Donoghue wrote:
>>>>>> On 15/07/2025 21:47, Jorge Ramirez-Ortiz wrote:
>>>>>>> Add a schema for the venus video encoder/decoder on the qcm2290.
>>>>>>>
>>>>>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>>>> ---
>>>>>>>   .../bindings/media/qcom,qcm2290-venus.yaml    | 127 ++++++++++++++++++
>>>>>>>   1 file changed, 127 insertions(+)
>>>>>>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..0371f8dd91a3
>>>>>>> --- /dev/null
>>>>>>> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
>>>>>>> @@ -0,0 +1,127 @@
>>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>>>> +%YAML 1.2
>>>>>>> +---
>>>>>>> +$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>> +
>>>>>>> +title: Qualcomm QCM2290 Venus video encode and decode accelerators
>>>>>>> +
>>>>>>> +maintainers:
>>>>>>> +  - Vikash Garodia <quic_vgarodia@quicinc.com>
>>>>>>
>>>>>> Shouldn't you be on this list ? If you upstream a file I think you should
>>>>>> list yourself as responsible for its glory or its mess.
>>>>>
>>>>> happy to do it. The MAINTAINER's file covered all the files named
>>>>
>>>> This should be the person(s) interested and caring about this hardware,
>>>> which means:
>>>> 1. Subsystem maintainers: no
>>>> 2. Driver maintainers: usually yes
>>>> 3. Author(s) of new hardware support: usually yes
>>>
>>> perfect, will do 
>>>
>>>>
>>>>> schemas/media/*venus* so my understanding was that I shouldn't.
>>>>
>>>> I cannot comment why people decided to go one way or another in other
>>>> code, but it as well could be just incorrect choice thinking only people
>>>> in MAINTAINERS care about hardware.
>>>>
>>>> ...
>>>>
>>>>>>> +
>>>>>>> +        memory-region = <&pil_video_mem>;
>>>>>>> +        iommus = <&apps_smmu 0x860 0x0>,
>>>>>>> +                 <&apps_smmu 0x880 0x0>,
>>>>>>> +                 <&apps_smmu 0x861 0x04>,
>>>>>>> +                 <&apps_smmu 0x863 0x0>,
>>>>>>> +                 <&apps_smmu 0x804 0xe0>;
>>>>>>
>>>>>> You're listing five iommus.
>>>>>>
>>>>>> I understand there's some disagreement about whether or not to list all of
>>>>>> the potential use-cases but, TBH I don't think those are good arguments.
>>>>>>
>>>>>> Unless there's some technical prohibition I can't think of listing all five
>>>>>> maxItems:5 .. let's just do that.
>>>>>
>>>>> since the device tree should describe hardware and not policy, and the
>>>>> driver seems to be able to ignore the unused SIDs I think this is the
>>>>> right thing to do.
>>>>
>>>>
>>>> It was never about the driver but about whether you should describe in
>>>> DTS for non-secure world the entries which are secure world. The answer
>>>> in general is that you can and there will be benefits (e.g. sharing DTS
>>>> with secure world implementations).
>>>
>>> all right, sounds good then, thanks
>>
>> Not sure if I’ve shared this before, but following an internal
>> discussion, I think it’s worth highlighting a functional dependency in
>> the current kernel:
>>
>>  - the driver only works if the first two IOMMUs in the list — the
>> non-secure ones — are placed at the beginning. Reordering them breaks
>> functionality, which introduces unexpected fragility.
>>
>> Regardless, this seems like a valid concern to me — a driver shouldn't
>> rely on the order of phandles — and I just wanted to make sure you're
>> aware of it before I post a v8 (likely sometime next week or the
>> following, as I’ll be taking a short break soon).
> 
> 
> Hm? Order of lists is strictly defined. That's actually an overlook that
> we never do it for iommus, but the core rule stays.

(FWIW "items:" is an ordered list, "enum:" is unordered)

Konrad

