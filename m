Return-Path: <linux-media+bounces-45165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D1153BF8E57
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 23:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2E6D34EF50B
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 21:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533EE285C88;
	Tue, 21 Oct 2025 21:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfXkYWgL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E1B25D540
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 21:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761080890; cv=none; b=toPLfP6LFmpwJqJj4bTR0l0b5BPBls7HIiCbpCsE1dx7ZXoa9BfxwiTeP0j3cB2cn02NkIQuqri7tEySzckB4D+Rqn5sih1xlsnWBXAe06dXmwNquWgfuNbRh2s6IOsR/BOrLVn3h+eJm0fOfBKsG1qibhq3eLWlu4iH4p+EiUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761080890; c=relaxed/simple;
	bh=hKP7hv2q/vLR9OB/KNuT7rmHgtOvMGEK2wehJ7tZQGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mdvXWDdmMKtd18XyJ2LoPH6OzQ9ei0XrXceAtFa9OvRbFJYpbUT9riWDyns//NqGPlWNHYCtO3ANZhDKJW39kMwRKjp/MyvrdnzPs0T/dmzyZP78zvKXbcZ/h+8wEZIubDomVxwEV7s9IO7JS2XuJIncHDY6BsFTUsdpINecvIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfXkYWgL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LEYue0029412
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 21:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kUHcX9qshXGQudm9WWiL14vKBawx4q0zuajE6NVvFCA=; b=kfXkYWgLZ9WSmfrm
	+c2+EYRsE8AppJZGlB+pzMgB5LzUyRuzknjgqbeMQsYuAWojcxD05Ffuo4qTreHc
	w5f3GkXtDXuDopf5/Ns2FcItb3TabLiPWANSR9ekBCdJbR7wGhYDS4Ew7Yx84BEm
	OMKvPE2LOzMlD6DnXqvu3+zmTLqDv9AFpRD7j6kY0++X5gQ0kbq1K+hz8A8UYO0D
	pjhnL7znYNbtb1BZAJGMeNPWx/myo+tuWXGUiXLbBxTX0RugG7I2JgB0JCmnD3Ye
	LIw/RCqbcdTy3vp6ZLaKPYs4bXv9/XNVISlWtUMOhOO93+A2aOpp1c4B0KJ0WfdA
	g2gOCA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wswnvkjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 21:08:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b62b7af4fddso3343248a12.2
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 14:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761080887; x=1761685687;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kUHcX9qshXGQudm9WWiL14vKBawx4q0zuajE6NVvFCA=;
        b=HRgx2OaU9QPouJShZCGKDHeIJuW1XcjtRLv6lyl+KjJz7ZosKg1E3HYQqxNGI0FCdt
         QIpkdNnLd+U14NlSvNkyqmTJXt3mbFBuWJvCTuO0oaciENZ1kqv4PrtUlSySe257Ejlb
         tWQm5ACAMpuFdCUnZma66H/JcDXRXH5qg7D5EXhFgDGrlgF6dAsuzTMsFwSRlxE5+MFF
         IEm4YODJe53Vl36vdFBqDxwfimVNo3Zl99cmGzfAp9sDn5uc0JsKVKNMACSkjlYKEk02
         zlM28OrIEa+XcWFti+xMLe4a5R8G9+YPX58D+qQiG+t4fZMU8sOoQQWO+wvwG84/S2o5
         5POg==
X-Forwarded-Encrypted: i=1; AJvYcCU40qJQ7S83ol23j+S+HbjEKyBFPuB9C3hNyCQAmrJ7mtDeX9PvHedWDB40GJ7k6kvGRLPoYvfQQi0vjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy02nl1/oMEkZ20JULCSrWnTJkyw0FmplbR0PgZbBV06tIYli+C
	giNji/tzUI5IXuyaCuX9Z7cYXQ1qllTTkW6MNs95kZ08sWuPbN/iipxuybLcdb5qQu8oaRkESog
	4dw1I4wpVKHvCvBESpqmFbjqtuKx8aNwSclD4CCI+RpgVt7I782Rjey/nY9VRFDDZKQ==
X-Gm-Gg: ASbGncsU6pl/UWYLCloNEiMpPxa87THzeHKEihyBrVkQ5yCoelyuW2gmxalKbUgI3Fj
	cG3JsyUT7lL6np2eP4f/Xk/L+KYzzRvJ+0iDnCnvffVUJ+/pCp7zWMLP7oODpHIFhJZAqwqJbNw
	K0Wl/vSMlY+RKfwRIn9iSlMK4W/QH2MrsyStxveMkl6mLLhwCbbSNxpT3sQ6ko8RoAm5lZsgmKN
	bJejO9CKJBl/4PCeEwF9nJE4UJ0phkLixmKZYk/QT4o1e33v8ONwIQlQ1e3feU4+MyAbn4aNocc
	enGqJz9GyUkaef8tD1Mx4aQ44FG4BpOosCOOhgc8nDwmA0qd28932Dn7eFKKwcsEImnY4FBJdqR
	7zPd59ArZZYCQCrUvMqFh0f6zGPtAq5n0lg==
X-Received: by 2002:a05:6a20:7287:b0:262:82a6:d932 with SMTP id adf61e73a8af0-334a86256f9mr22761793637.48.1761080887348;
        Tue, 21 Oct 2025 14:08:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESdm7op53/MzUS5K7s1gaOrJSGLx+p35WP7TbnHImOwmOCXg89kxayJjZ68H5wLE/Jqdy/hA==
X-Received: by 2002:a05:6a20:7287:b0:262:82a6:d932 with SMTP id adf61e73a8af0-334a86256f9mr22761758637.48.1761080886737;
        Tue, 21 Oct 2025 14:08:06 -0700 (PDT)
Received: from [192.168.0.166] ([49.205.248.205])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cdafadb8dsm607908a12.1.2025.10.21.14.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 14:08:06 -0700 (PDT)
Message-ID: <e1bfadd4-2d53-1953-beef-1350594c5010@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 02:37:59 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
 <20251017-knp_video-v2-1-f568ce1a4be3@oss.qualcomm.com>
 <c9d8f76a-513f-4a09-bba4-cb8f0df1d2fe@kernel.org>
 <034bf6f4-0a49-4973-8536-28526b3409d1@oss.qualcomm.com>
 <d19b1279-3031-43b9-ac73-7e5f990802ed@kernel.org>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <d19b1279-3031-43b9-ac73-7e5f990802ed@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: svhnv79-EwCX68_JcylfzKNAUuz2dGuN
X-Authority-Analysis: v=2.4 cv=Maxhep/f c=1 sm=1 tr=0 ts=68f7f638 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ysf2FyB+yl5xZy2y99iGVQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=mYW7RsAQjGC2aXFlLLIA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: svhnv79-EwCX68_JcylfzKNAUuz2dGuN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfX3dVtyvtoew+S
 lO0vV0v50Ix8KTrBHFFewBDO+XSn6/rOU2ZsSyd/tjgfRYPn1OQASy77F5C8gQ7xiCAmis0RXMS
 vK08DkOWNgXWjlyx9nI80bvPtDZMvm8MuLtNS6kcAxdOxDC42oLnDGSq2k5D6FjdvHfDy4rj783
 g4Nps5Gk7CPKLJJQXilNtVUOoK4922wriF+J9E/pJWrq94bJGoKLYO8hjSLFap650yCiqUEoO5+
 piGq1a/E3g5TqwlL08d8bveUQ/xeklxm17DsNUmd8H777ATB0swUi/YpHh264UNtQ4QK8DojwiR
 CE0+u61R7Sb7Z7F9nP/SwHG+RhgseoXueYGjpjWKXrcrrTI9ca4wuXJh5YG5xYFG0wpeFre5KSw
 rePEPSarquWwqWrpXqFJQk0DiJSPWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148


On 10/22/2025 12:45 AM, Krzysztof Kozlowski wrote:
> On 21/10/2025 20:55, Vikash Garodia wrote:
>>
>> On 10/18/2025 9:28 PM, Krzysztof Kozlowski wrote:
>>> On 17/10/2025 16:16, Vikash Garodia wrote:
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: iface
>>>> +      - const: core
>>>> +      - const: vcodec0_core
>>>> +      - const: iface1
>>>> +      - const: core_freerun
>>>> +      - const: vcodec0_core_freerun
>>>> +      - const: vcodec_bse
>>>> +      - const: vcodec_vpp0
>>>> +      - const: vcodec_vpp1
>>>> +      - const: vcodec_apv
>>>> +
>>>> +  dma-coherent: true
>>>> +
>>>> +  firmware-name:
>>>> +    maxItems: 1
>>>> +
>>>> +  interconnects:
>>>> +    maxItems: 2
>>>> +
>>>> +  interconnect-names:
>>>> +    items:
>>>> +      - const: cpu-cfg
>>>> +      - const: video-mem
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  iommus:
>>>> +    minItems: 3
>>>> +    maxItems: 8
>>>
>>> I don't understand why this is flexible. Make it fixed size and anyway -
>>> list the items.
>>
>> kaanapali vpu generates 8 different stream-ids. Now, boards running kernel in
>> EL2 mode can list all of them, while boards running in EL1 can have only non
>> secure stream IDs. Min have the list of stream ids which can be enabled for all
>> type of boards, while max is for boards which can list all in HLOS given kernel
>> is in EL2 mode.
>>
>> Below crash would be seen if boards running kernel in EL1 mode lists the secure
>> ones.
> 
> 
> That has to be explained somewhere, e.g. comment, 

Sure, will add a description for iommus property explaining the same.

and still we need then
> EL2 DTS in the kernel. I did not see such so far, but maybe I missed it
> - can you link it?
> 

EL2 DTS for kaanapali is not yet posted to handle secure SIDs. While it is in
development, describing the secure stream-ids would ensure to cover all the
hardware generated IDs.

>>
>> [    1.361157] pc : qcom_smmu_write_s2cr+0x64/0xa4
>> [    1.361165] lr : arm_smmu_write_s2cr+0x2c/0xbc
>> [    1.361168] sp : ffff80008005b8f0
>> [    1.361169] x29: ffff80008005b8f0 x28: 0000000000000000 x27: ffffc7f252f45320
>> ....
>> [    1.361195] x2 : ffff800081200c48 x1 : 0000000000000048 x0 : ffff800081200000
>> [    1.361198] Call trace:
>> [    1.361199]  qcom_smmu_write_s2cr+0x64/0xa4 (P)
>> [    1.361203]  arm_smmu_master_install_s2crs+0x7c/0xac
>> [    1.361207]  arm_smmu_attach_dev+0xb0/0x1d4
>>
>> Could you please suggest on listing the iommu items ? I did not find the
>> relevant references in other bindings where flexible iommus is being listed.
> 
> 
> Just like every other list property - clocks, resets, power-domains.
> 
something like

iommu-names:
  items:
    - const: 0x1943
    - const: 0x1940
...

given that one of vpu sub hardware generates multiple SIDs, if we go with sub
hardware name in the list, the names would be repeated.

>>
>>>
>>> I already asked this.
>>>
>>>> +
>>>> +  memory-region:
>>>> +    minItems: 1
>>>> +    maxItems: 2
>>>
>>> Same comment. I already asked this about iommus.
>>
>> Same here, there aren't any bindings which lists for flexible memory-region.
>> Please suggest if there are any such references.
> 
> Because they do not matter for all other bindings, but it turned out
> recently it might matter for this device.

memory-region:
  minItems: 1
  maxItems: 2

memory-region-names:
  items:
    - const video_mem
    - const iris_resv

Regards,
Vikash

> 
> 
> Best regards,
> Krzysztof

