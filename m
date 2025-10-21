Return-Path: <linux-media+bounces-45156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAC9BF83A3
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 21:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E269C4E7B1D
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 19:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56B234A3DF;
	Tue, 21 Oct 2025 19:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQPmCT2J"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908B61F936
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 19:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761074404; cv=none; b=awpSrKl3vHH/Yv7JeCQ2zzSOwQMbB1j4FseMsdKH3bAFnrd4e+Z6KIMo6OyyF2vox4MS44kr641Z4Zwd8YF6Z0QhUHBaFdWgBEE0LLVkQgPRQcmxAAoWwL2d9KcZJujMiHhe3pjd0NnfCpcU3uW8LuGxJPwCUtWlNI0cawB1Yfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761074404; c=relaxed/simple;
	bh=icdfz+0C3epGfwWHPEjvmyz6WsUsB5GdRxqjMmyOUg4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ssw6zmd6CjJCfNpBqaJSuwKkPGP93yaON2FmtfLslBbjuRSszuHn3MshNQlexzzm7/mThGZpdtQTGUD4WXmeQtSplA92MwobftwOHhopinrosQ+PwSo9G1Yz3FjVAaqowZng3mKs1NpJdJYDKsk6ambzXi84VobeD3IGGNu2vC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lQPmCT2J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LEmiwm032407
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 19:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tb17VQBk2tdCoY70urDMdkOeUUuDTnyLp9/IV4Atljk=; b=lQPmCT2JsChx0D3u
	+rzdRCFgNfQ9fvw1QwwRrLSGUbtkSzbFxPu+XQyJeYem2azGxjJr1pDfMkH8uCpj
	d1BcmvL0xlY25FJW1WXYZS8Hp+ombTpwQg5Mot1UrcCxNHL2WFvUM/2uIOH/uL9x
	R5AdcVYrOoJ4SGCk18sz9rQ3ezlwqJbUP0lY3B5PZ6VpD2pJdKK5V51AZwQBnL/I
	0KNMcD0cH2sPWBxCk3gQ2sZsQHUsuWInVfSBCB3CrMrK7wjtszcNLOhwZffUHA+w
	MEIiLkfokYNEwmG0WwI7lJ7dD4Asisvl8yuMde5QIQLYii9vDafjBW3YoWa+J/vC
	ZNdcqw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42k9tb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 19:20:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28c58e009d1so133082915ad.3
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 12:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761074401; x=1761679201;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tb17VQBk2tdCoY70urDMdkOeUUuDTnyLp9/IV4Atljk=;
        b=NJA6S2iAVTYfHO9WigNovLEuDegR8DKqny2GNGhEsb2KLkWwvEgWAqoPwGDj6F9aF+
         ofCS0D1NKgGrrCPEs7XIo6NS4Yw9zFLQmBPtqOJ+noosRcltEOHpnMKVxb6ObY7FjgZq
         Vfphqy+bYRGRWQO6lDm6pid5oGX6/z7VPquQVxLKGlKinGEL6q8WJhIXOfduaURf7Fxb
         jy58nx09S0HXhqPs3/PIyqI6wkR6VSzSpwTlLgQvHr5JI9iFMvToqqChzc4cfcUYfThM
         BmA6xA2TX4UJAn5YC29WbjhP6YotJg7QT34NJbN/q4Bytp7uvqVufwwq+ZeQ+puN8Z00
         nnpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8m6iR3DcZ8GV8YGgCD4JDQbpomrnXUcBNzxMbA5UqpgOZqaHjYJAPDfB0TA8Bep1opcCxJM81OhMy7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaS1qXzMrhlfyk00tyQ2QYeZIaew9vHxnvCx4lHGrvWfNjV8UQ
	Z8KWylQewMiU9Gtdz9uRshxVbUP8HQW5tKKMlAofq1tNT0vRGb/JknKL5FmUo83FOEzBwAwkVW7
	Mz7JtrqgOE7wzzX5sC0aG67Rt23nbYwMskooz/uttz+bBGcZLTJQzU62uj07Ctg3vJg==
X-Gm-Gg: ASbGnctDNkARPH2RNN6yfbsk0ijmd4XU7e8i9bBr0ytf2XSWQ51vCXDY3fRpysD8oqc
	5n6QXVueIVHMYxIZBPn74mMsYmb8ivbOtD5EEd/IEEtlJCmCp66DbJnPsblnnH/Kh3doE+KfkT/
	9oGlP4+p+p9KgJt+TaLRCfTw/+2rN6p/qKFcyaLiEoIsM5jGvyC7yWpFzScoGIfCZ52UKaR95VC
	9uXmZi5s6BGV8MqsmJQNO5OhM+6xsJ/kWhF2C57kTM3u2GY/ZePyTTgfwK8b7dkiPARajhKidoO
	KZ3Y9ZMzE8+51zPKy0sZ9X1LT2bB3Vg3QbjqYxUJmAsHwYYdHAnOrcXxmsn25IswbEoAt/ekfIB
	4Pfrm4e6pgmtN60A3apaBkPyRLXJEhzpINivtrRz2tTaYe8d/EafCbA==
X-Received: by 2002:a17:903:1212:b0:290:c5c8:941c with SMTP id d9443c01a7336-290cb9477a3mr243681045ad.29.1761074400771;
        Tue, 21 Oct 2025 12:20:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5FuKV5UWNZi1AF0AqP4B0g+2U1MpHnnZaZ9py0QpSNnOIDjRJ9J1f99apbxEL2gYYXrIhcQ==
X-Received: by 2002:a17:903:1212:b0:290:c5c8:941c with SMTP id d9443c01a7336-290cb9477a3mr243680395ad.29.1761074400065;
        Tue, 21 Oct 2025 12:20:00 -0700 (PDT)
Received: from [10.62.37.19] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ec20a4sm116942875ad.7.2025.10.21.12.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 12:19:59 -0700 (PDT)
Message-ID: <6efe686a-fdd5-4f17-a0dd-d44a16a67a36@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 12:19:58 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Enable setting the rate to
 camnoc_rt_axi clock
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Bryan O'Donoghue <bod@kernel.org>
References: <20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com>
 <9984bc23-05ef-4d46-aeb8-feb0a18e5762@kernel.org>
 <bc0caeb8-c99b-4bef-a69e-5ce433e6b890@oss.qualcomm.com>
 <c4fd6bfc-cc9a-4f37-99b3-f36466691a1e@linaro.org>
 <CAFEp6-2=GJL-gc+PSyAL4=prp_sXdZJS=Ewg5nP2kcp_Gu85Fw@mail.gmail.com>
 <33513b43-f6d1-4c76-887b-39611a75e1f4@kernel.org>
 <WnfCknsSyJK68PQZkE2q7COZHRpsLOFlr3dcbwiVR6SBWtF9iRQ4MGzp_9q31O0kyhZwoncQWfHjJQvpz7nyfw==@protonmail.internalid>
 <ab43c5c9-edc5-459e-8ef7-2aa8bec559c0@oss.qualcomm.com>
 <0e6e1b8a-d9ae-42d1-b1ad-4314e0d76ab7@kernel.org>
 <2c0011d3-a692-457c-9ac0-a445fc82df37@oss.qualcomm.com>
 <48bede40-584a-409a-9bca-7ae3cc420667@linaro.org>
 <124be1cd-1cc8-4c04-8aca-eede808e736c@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <124be1cd-1cc8-4c04-8aca-eede808e736c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d8lYm7x7bnEAsmmRMV3eH0Tr82gQ5Tst
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX9JH+gUV5SHwX
 CgCSWANDb2mUgAGTmxUio0u4aWqnkwdwixOvErc0nTFWQI0mEc3HYwSTmgC3yhx9715XwZTXGI3
 8AsrFVxHamYy+24fhWTdjP9RcxDoWwTqZgvDH3Y8RTvqPr+9qXajVvCZ2AEXtS5LlDm1Dl4OQpN
 VJN/7WvhLercyY/a7h6/hrD+XCZHG+sVl7dW16lP0D4X3mVnvGfnSdCkTOmkxcQIA2gTb0XLTJf
 eWTtxGZRxbmqLjoRD/ZM57kb2dnoUiejwQmED/KBcWPkl0oEQxBqr+PfGSPQmtuAfVwBWBpnf5/
 /u4THOPSPHYqLWS1UIbxw4yl5o4XC4seXBcZpfALvce8cBw28g8/qz3b9QPlLs60t8VJeK7ksne
 DLw1tsuimmqiMdVZh8XtCEii2dGWWw==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f7dce1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=nXZdPX8rIRQHg8fUIg0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: d8lYm7x7bnEAsmmRMV3eH0Tr82gQ5Tst
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031


On 10/20/2025 6:46 AM, Vijay Kumar Tumati wrote:
>
> On 10/20/2025 6:35 AM, Vladimir Zapolskiy wrote:
>> Hi Hangxiang.
>>
>> On 10/20/25 06:23, Hangxiang Ma wrote:
>>> On 10/17/2025 7:41 PM, Bryan O'Donoghue wrote:
>>>> On 16/10/2025 21:53, Vijay Kumar Tumati wrote:
>>>>>
>>>>> On 10/16/2025 8:31 AM, Bryan O'Donoghue wrote:
>>>>>> On 16/10/2025 13:22, Loic Poulain wrote:
>>>>>>>> I'm - perhaps naively - assuming this clock really is required 
>>>>>>>> ... and
>>>>>>>> that both will be needed concurrently.
>>>>>>> AFAIU, the NRT clock is not in use for the capture part, and only
>>>>>>> required for the offline processing engine (IPE, OPE), which will
>>>>>>> likely be described as a separated node.
>>>>>>
>>>>>> Maybe yeah though we already have bindings.
>>>>>>
>>>>>> @Hangxiang I thought we had discussed this clock was required for 
>>>>>> your
>>>>>> setup.
>>>>>>
>>>>>> Can you confirm with a test and then
>>>>>>
>>>>>> 1. Repost with my RB - I assume you included this on purpose
>>>>>> 2. Respond that you can live without it.
>>>>>>
>>>>>> ---
>>>>>> bod
>>>>>>
>>>>> @Bryan and others, sorry, I am just trying to understand the exact 
>>>>> ask
>>>>> here. Just to add a bit more detail here, On certain architectures,
>>>>> there is one CAMNOC module that connects all of the camera modules 
>>>>> (RT
>>>>> and NRT) to MMNOC. In these, there is one 'camnoc_axi' clock that 
>>>>> needs
>>>>> to be enabled for it's operation. However, on the newer 
>>>>> architectures,
>>>>> this single CAMNOC is split into two, one for RT modules (TFEs and 
>>>>> IFE
>>>>> Lites) and the other for NRT (IPE and OFE). So, on a given 
>>>>> architecture,
>>>>> we either require 'camnoc_axi' or 'camnoc_rt_axi' for RT 
>>>>> operation, not
>>>>> both. And yes, one of them is a must. As you know, adding the support
>>>>> for the newer clock in "vfe_match_clock_names" will only enable the
>>>>> newer chip sets to define this in it's resource information and 
>>>>> set the
>>>>> rate to it based on the pixel clock. In kaanapali vfe resources, 
>>>>> we do
>>>>> not give the 'camnoc_axi_clk'. Hopefully we are all on the same page
>>>>> now, is it the suggestion to use 'camnoc_axi_clk' name for
>>>>> CAM_CC_CAMNOC_RT_AXI_CLK ? We thought it would be clearer to use the
>>>>> name the matches the exact clock. Please advise and thank you.
>>>>
>>>> The ask is to make sure this clock is needed @ the same time as the
>>>> other camnoc clock.
>>>>
>>>> If so then update the commit log on v2 to address the concerns given
>>>> that it may not be necessary.
>>>>
>>>> If not then just pining back to this patch "we checked and its not
>>>> needed" will do.
>>>>
>>>> ---
>>>> bod
>>>
>>> @Bryan, I test two scenarios individually that also consider 
>>> @Vladimir's
>>> concern. I confirm this clock rate setting is necessary.
>>> 1. Remove 'camnoc_rt_axi' from the vfe clock matching function.
>>> 2. Remove 'camnoc_nrt_axi' from the vfe clock resources in camss.c.
>>> Both of them block the image buffer write operation. More clearly, we
>>> will stuck at the stage when all buffers acquired but CAMSS takes no 
>>> action.
>>>
>>> I agree with @Vijay to keep 'camnoc_rt_axi' to distinguish between the
>>> new one and 'camnoc_axi'. The disagreement concerns how to standardize
>>> the camnoc clock name or how to differentiate between RT and NRT clock
>>> names if a new RT clock name is introduced. Other chips like sm8550,
>>> sm8775p depend on 'camnoc_axi'. Meanwhile, 'camnoc_rt_axi' and
>>> 'camnoc_nrt_axi' are both necessary for QCM2290 and X1E80100. But chips
>>> like QCM2290 and X1E80100 may not need to set the clock rate but
>>> Kaanapali needs. @Vladimir
>>
>> Thank you so much for performing the tests.
>>
>> I would want to add that I've made right the same tests for SM8650 
>> CAMSS,
>> which also has two 'camnoc_rt_axi' and 'camnoc_nrt_axi' clocks, and due
>> to my tests the latter one is not needed for the raw image producing, 
>> you
>> may notice that I've excluded it from the v3 series sent for review:
> I agree. The NRT AXI clock shouldn't be required even for Kaanapali 
> for RT blocks. @Hangxiang, can we please try to understand this 
> better? Either way, I think the NRT clock part is not connected to 
> this patch series I guess? Just as Bryan advised, we confirm that the 
> 'camnoc_axi_clk' is not required for Kaanapali to close out the 
> comments on this series. Perhaps, we can continue the discussion on 
> the NRT AXI clock in the Kaanapali patch series? Please advise.

Some more clarification on this . Starting Kaanapali, we have PDX NOC 
after RT / NRT CAMNOCs and before MMNOC for domain crossing. Our HW team 
has confirmed that, for the PDX NOC to ensure that there is no traffic 
from either RT or NRT at the beginning of a session (it's called 
qchannel handshake) and start functioning, we need both the RT AXI and 
NRT AXI clocks. So two things,

1. Like I said, this patch is required regardless as it is about RT_AXI 
clock, which is required for Kaanapali.

2. In the other Kaanapali patch series, we will keep the NRT AXI clock 
in the VFE resources.

Hope this clarifies. Please let us know if you have any further 
questions. Thank you very much.

>>
>> https://lore.kernel.org/linux-media/20251017031131.2232687-2-vladimir.zapolskiy@linaro.org 
>>
>>
>>> We now prefer to add 'camnoc_rt_axi' (Right?). Maybe its better to add
>>> comment lines to remove the ambiguity whether 'camnoc_axi' denotes 
>>> to RT
>>> or NRT. Please advise and correct me. Willing to receive feedback and
>>> suggestions. Thanks you for all.
>>

