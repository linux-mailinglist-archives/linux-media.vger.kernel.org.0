Return-Path: <linux-media+bounces-49462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 345FCCDBFDC
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 11:30:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97C07301C3F1
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 10:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA85314D16;
	Wed, 24 Dec 2025 10:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UnPhX05j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N4iMmD6N"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD5C30F937
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 10:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766572195; cv=none; b=KLQjaaQS6D3JQjIplg6uCBC1TOVkBQcJnH6Mr40Ojmx79+sGV47oGD3/gTgIhG9GS1xFyae3Kg++4//70aebF7UGrqC7ogkihkkHwni6KAlqqiTtD7us5zHPwu2FYX+1nqUWym8dnQGJcBpMXzbCG2OMaFCMr7stz2VnC3Ju0F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766572195; c=relaxed/simple;
	bh=/+k13JGaSOlrhmQP0Hn+99RygXxIUW0fKZ7CtedcWc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aMokU7owYrbvunuGgINe86ilfE1IgLMkDaMSaVDWNFHAFpAIm8sgZBXveJlpz1Ah9CykOW5784F26+QvpJCBBIJ4gUIdVJ8X3gvD11cvE/jA/w+xyjBX9VxkZvKmJ0Q4/M3dvEAjvvZStwVocrcSbTO/bBSsBrybJIKdDcInT3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UnPhX05j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N4iMmD6N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3w5OR4134186
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 10:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QdORHh+wUdROvVzmLcNZ/cLeGcoVHWevvBzr5xForwI=; b=UnPhX05jPfsLQzm+
	lKDrs89n1+MDZV1F/VC4H7WcHH+6W/iQCm7P0wra0e4A28C7uAq7M//QpBijaChy
	vaF1jZVHiUT+t3np77frb1pQEZDGe+FWDsHu2TnBSFV6HXgyr/qzxuV7+0oQkCAk
	3JqHXQda0cq9/3E+TtAXS334/MkLQFeagz057OjTX4SKsyS0NI4LpS3DlbOUd0ek
	x/glCRURjaYyfZWSZ17UPWqzlHl+CGhS7NseckSr9Wo5toFExryQrDfK5MbXxaaN
	SwU46qdhaFEK7+kg5Cqx7pb/ypNd7ebp2L7oiwPKzKxMRLCzxtulEn4UEvlyO6A6
	Q/ZLoA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46tsbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 10:29:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b22d590227so715026085a.1
        for <linux-media@vger.kernel.org>; Wed, 24 Dec 2025 02:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766572192; x=1767176992; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QdORHh+wUdROvVzmLcNZ/cLeGcoVHWevvBzr5xForwI=;
        b=N4iMmD6NT6Eagycld8MM7MDkJk6UQgfTu/eXNddHiiYHxaDJLxgyIoJzXFbiTjQIu5
         iicg8cuqENscfi8SvuKjOd3Ff4GK6W+WmPlch5k+nlAP0uNAyvQkyM6VdDxoPhK5QqiT
         l9TdmY4wlr+fXFtHM/y7JhQUDMRcFafSVzkGXJeNnkDE5PhtDyPKC1dWvzZVAdgOWoN3
         8Jry3uGDcu0ZHPhqwiP9XoAXMXnhlQLxTF1o7lDBdx14Ya5+gP3uYjVqFPxrroZvMVOZ
         TJMg4zAL0wTu6oZoRnvAw1W9CpF/WD+ec5QuMF9ogUNa6apbXFnXwkw17dWDKWPiaC4R
         B5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766572192; x=1767176992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QdORHh+wUdROvVzmLcNZ/cLeGcoVHWevvBzr5xForwI=;
        b=EZ+eQthonHaiMsrSuZiAWS6ZrU9GRwOkrmt3cgoYUUhB6hpx6LLfm7uT9rOM4gL1Ur
         rU7rxC2D9clKhltvezCUDB8P+0v71L2qcv1OtAAoXQiyIbzWH5bgI8BFIT/WjPaKaFvq
         njQ34sLKXaxZEFajpPMvLzVAiA4wsFKxLSGO93ACQnDzXsD7Byr9N27VSmirtbegk4vv
         /DQ4jOs4bRK/hWtHYa+lSF36qpayFV4IdompTuna6grAdLNOcVUmlXtU65bH5kunpZTY
         UT6t8IIvVcQCQi8KvwHsdq15tGpWdVRq/HCKOb3nW8olz0aRDNgcWS1clBJUjByHBP3+
         XrSA==
X-Forwarded-Encrypted: i=1; AJvYcCXhJ6SHbno94pDejAsyEvxaQKsVfXcR9NInYLvIIxbNtwKtdYl3aiLhfn2eEPQLVqHr0WTz5Crbb+aYTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy65SkFNKx/dHWXyO5dSUGPIn56Cu79sqBy0HW2Sh4z6P4i4SvA
	eScqi/wqQhraoe+G5TO8h/YMafCigh8oXJ+9EP8EK2epRo7oY+sDmfcaTXGhQNWJnbeZYf6tmhI
	hCZOVPEDv6pstNigM6dM1WJ0kxK92lhl4CfZC2Pr16SVFRwWDT5zfq+hf0tSsuTab4A==
X-Gm-Gg: AY/fxX4/ezqX6pZaKNRHutE4EAfLrbKcIwgBywunaS/bs12d3nYYKkuD65ne4QaxhRg
	S0CGJUMDNNDOSh5aZQf9ITWnf19TL7npA4Jloh8FbeYAwbsKvPkT4w6wBOewl4K901hFVue26nU
	vLZ0WShgrcy+fxPhs8wWY6LifI/N436TkerSQrR6teEAIChlovj/sBdc14NdIh51FOwkzlkEaWX
	N0xZQz/nZvYLOiY4VWRgWH5vJViYu2WFDOvTAqWfTzdRmg20Nj3lklFFsjD+HuVhiIuYjETT3AL
	ZT1j01aDmQ9fVmIwdvWP9uMKOy9EB1tQVn7IqD4AYnRbEblLSZv4g/oQM10fr9vAYjgzUgPgntH
	lNdkR8doQXEfqeKHlJrAeNM8dKM7I5Z6/w8IcA6L7ZSCjp0Qof6VDFIYpxG5rFqgXm3QFAK4GZQ
	==
X-Received: by 2002:a05:620a:44ca:b0:8b2:6606:edaf with SMTP id af79cd13be357-8c08fbf7f2dmr2855547085a.37.1766572192414;
        Wed, 24 Dec 2025 02:29:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEW+h21Zk7sUDpprNUnHCEjqXSluWJX2J/e0882MWNU2L6qw2LGYFE7e4/gozjPINDiczEISg==
X-Received: by 2002:a05:620a:44ca:b0:8b2:6606:edaf with SMTP id af79cd13be357-8c08fbf7f2dmr2855543985a.37.1766572191921;
        Wed, 24 Dec 2025 02:29:51 -0800 (PST)
Received: from [10.111.161.169] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9a44e314sm123903666d6.49.2025.12.24.02.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 02:29:51 -0800 (PST)
Message-ID: <9edc9c94-762a-4688-b2ca-95900149bad9@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 18:29:43 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: dt-bindings: Add qcom,sm6150-camss
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com>
 <20251222-sm6150-camss-v2-1-df8469a8343a@oss.qualcomm.com>
 <20251223-pompous-inescapable-sponge-3fc9f0@quoll>
 <c6174a0a-9a76-4284-8675-bb5ca78a7b35@oss.qualcomm.com>
 <eklzmnlnkanrper7lt46vap54u5giprsmwhwpr4am5ytwyohov@kjqvls5vjani>
 <6b52d19e-8ff1-4bd6-b854-bcabccc7cd74@oss.qualcomm.com>
 <3342fv43qdkmm66jgc63hho2kd3xn65p2fv3tyk3573izlxf7i@hgjsp2kwqyuh>
 <26536725-19fe-4aa6-8a33-8e2e39261cd4@oss.qualcomm.com>
 <03a398f2-6108-49c6-aae0-77701fb066ea@kernel.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <03a398f2-6108-49c6-aae0-77701fb066ea@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pC4bJQ5HL8RgFq8RNhRgliz0L-X2M8RL
X-Proofpoint-GUID: pC4bJQ5HL8RgFq8RNhRgliz0L-X2M8RL
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694bc0a1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Drdvf8unfrF7i_Y29A0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5MCBTYWx0ZWRfX8TUK9h9w13EH
 tNc9dFJRLCC8dCC7gMl2NhE4D62H+UTDLv6YZFFUEIlU07OUNkhBM4tjUZk/Nub2W6d2Q+pqI05
 Q3Itn82BWlwOyFGyt0B5ABXNNvD6zZ7U9qxjUqbMMCl2mLnhpqocYta2dkyYuVlREWY/1YNJQEE
 Pyq4y/7mSq+SqBwZ1n8IJ0KNc3g8jL3B391C904Qu3sg6XQdnIuKsJ9iVGoOdkf2vNBOv2qcLkS
 OM22cHsR86/rAja09HQToVjF7VE9HfpIPHBoJIFuBe8Y8ykBkkamKC32tgXW/IFuIVUS5Ggz2xu
 cJq0oeLW/zzjIdsIapQH5mLWA+si+vjsLNqDfN2aLFFGK+nODXEgqsXCfJLg227glNJxaKSZTIU
 mXKrKRTKOtpcP73TcoM9/PQvsC+iWB0wjiaT9TGXfqGFj5fWYfmqk5KQ8TtoZ5gW8MtqjC/b5Q4
 g9uDoAeOcXJD1BmVtqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240090



On 12/24/2025 5:46 PM, Krzysztof Kozlowski wrote:
> On 24/12/2025 06:36, Wenmeng Liu wrote:
>>
>>
>> On 12/24/2025 1:03 PM, Dmitry Baryshkov wrote:
>>> On Wed, Dec 24, 2025 at 12:31:33PM +0800, Wenmeng Liu wrote:
>>>>
>>>>
>>>> On 12/24/2025 12:21 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, Dec 24, 2025 at 11:18:02AM +0800, Wenmeng Liu wrote:
>>>>>>
>>>>>>
>>>>>> On 12/23/2025 9:38 PM, Krzysztof Kozlowski wrote:
>>>>>>> On Mon, Dec 22, 2025 at 04:28:39PM +0800, Wenmeng Liu wrote:
>>>>>>>> +  interconnects:
>>>>>>>> +    maxItems: 4
>>>>>>>> +
>>>>>>>> +  interconnect-names:
>>>>>>>> +    items:
>>>>>>>> +      - const: ahb
>>>>>>>> +      - const: hf0_mnoc
>>>>>>>> +      - const: hf1_mnoc
>>>>>>>
>>>>>>> Same comments as before, do not invent names.
>>>>>>
>>>>>> <&mmss_noc MASTER_CAMNOC_HF0 QCOM_ICC_TAG_ALWAYS
>>>>>> &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>>>>> <&mmss_noc MASTER_CAMNOC_HF1 QCOM_ICC_TAG_ALWAYS
>>>>>> &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>>>>>
>>>>>> This platform(qcs615) is different from others. It has two types of sf,
>>>>>> namely sf0 and sf1.
>>>>>> The same as it is:
>>>>>> sc7180 sc8180x sdm670 sdm845 sm8150
>>>>>> Do you have any suggestions about this?
>>>>>
>>>>> Which _names_ are used on other platforms? This question is quite clear
>>>>> from Krzysztof's comment.
>>>>
>>>> The platform mentioned above either has no camss ICC node or no support for
>>>> CAMSS on the upstream, so this is a new one.
>>>
>>> I did a quick look for you.
>>>
>>> kodiak, lemans, monaco: ahb, hf_0
>>>
>>> x1e80100: ahb, hf_mnoc, sf_mnoc, sf_icp_mnoc
>>> sm8650: ahb, hf_mnoc
>>> agatti: ahb, hf_mnoc, sf_mnoc
>>> sm8550: ahb, hf_0_mnoc
>>>
>>> sc8280xp: cam_ahb, cam_hf_mnoc, cam_sf_mnoc, cam_sf_icp_mnoc
>>> sm8250: cam_ahb, cam_hf_0_mnoc, cam_sf_0_mnoc, cam_sf_icp_mnoc
>>> sdm660: vfe-mem
>>>
>>> I'd obviously hope for some unification here. Other than that, we have
>>> two clean winners: KLM and X Elite+SM8650+Agatti. Yours proposal is
>>> different from either of the options. In fact, none of the platforms
>>> have the same _approach_ as yours. Why?
>>>
>>
>> Yes, you're right.
>> But none of the above cases involved having two hf_mnoc simultaneously,
>> so do you have any good suggestions for handling such a situation?
> 
> And this is your answer to use completely different style? This makes no
> sense.
> 
> This is your logic:
> 1. If there is one HF, I will add underscore.
> 2. If there is more than one HF, I will remove underscore.
> 
> This makes absolutely NO SENSE.
> 

Would it make sense to use hf_0_mnoc and hf_1_mnoc to differentiate the 
two paths?

Thanks,
Wenmeng



