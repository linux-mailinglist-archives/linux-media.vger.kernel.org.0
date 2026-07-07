Return-Path: <linux-media+bounces-66833-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zGWPIqDkTGqergEAu9opvQ
	(envelope-from <linux-media+bounces-66833-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 13:36:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCBB71AFE2
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 13:35:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cIUj0nlc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=W4X9ISlB;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66833-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66833-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A3C130847BA
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 11:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A67D3FA5E6;
	Tue,  7 Jul 2026 11:20:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6479F3F58E6
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 11:20:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423232; cv=none; b=SwXibi/VGrS7UVR1FspCUnUYh0UYcivZnveayV2ZcUG0ywlx9vJo7bWuw1mD7LbIPUSSJrGxgNRP2FpW903Jz13q7npagKqvBkMkzKNGow1ugymph3P4OTDsJeVmgDOWzmgKTzc8vTdRDZW1LrTWD3k1BoZ2ENlf4nni7nJlJYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423232; c=relaxed/simple;
	bh=9JF5HwykZ2AmRNb+eHzU8Lff4gCdca3zI5sJWYFn3Gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZQywE4pDoZho5t0XTuFWn1CTmTBdnR9FGBsGca+QwixpEq6ALM5WQYhO2jXGdu+PPJb2mBoNLTMREcRpz2P+0uK781+vPYQKPMvwExrxNWAVFey6+ZUwyRFDNX7ybroSmWKVGCtWearopLkWKI+HDZA1ZC5ZlbNQsPlR+7H/gyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIUj0nlc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4X9ISlB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678EFgV3203500
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 11:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ozhkHGrtbGn2tsUAvP7G2WOvGFBIMdlw1yv9mdDL8IE=; b=cIUj0nlcnv6d9nH1
	AguUkjqucMzGKOaEs8Q0Q9lHHBacaIqkTlDmmt6pPK6ue/fvmmkmm4TLOFV6nz2h
	hbEzRBb/d7tCncrtdMm4I4fZWVDyt1aukWRNjk/4Ap9YCW2jLPP3+z4Og78Vd5cz
	gAFbPoEJ/axOaeJtehRCbGytjm40KEIesbV/4rlXOduJpuXYM+cH1tKv7qPUXrSM
	MCK6ywHH3iOVuid+eHx5ZofJfDbPgQfta8ZQxHPlS256S4n0Hwwv5ZPC+lWPHmSX
	iNldsNKFroo/HK/iCRIhwVG6BeyA4Mu9eGCaA9lP9na44QM3l3f2CIA3wjVMH/2/
	CZZvkQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a962u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 11:20:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0d6a2f4cso45631481cf.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 04:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783423230; x=1784028030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ozhkHGrtbGn2tsUAvP7G2WOvGFBIMdlw1yv9mdDL8IE=;
        b=W4X9ISlBW3HIFAaRyZGvhRKy9eJKiK6sAHhVvzjwE9jHai7G8HCszn6ggX8U38y8zK
         FvaHOEM6iwvHS0UL5Z8REm8hLxVF9rec+1s3s5ZBD1MA286qwE8MgVQ81/tbc3GulzIL
         2EMEr4WtzGl1Je+TrWc9wLMxmaqHkDHRvM+6qhVypuatYo608q/plSLzas8t75Wfw+Kx
         I9zVoE9C7SFJdebooAtCZNKA78mq+K48M+Q4+DxOLleAYl/46o61ILwz1bmDqPctZPaN
         wafH+w1aSX16Z45vzgedk8l/cSIsTyDOw7ipDYtIwH/JAfUb9XsF1i/04dSfmAtXQWQV
         bVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783423230; x=1784028030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ozhkHGrtbGn2tsUAvP7G2WOvGFBIMdlw1yv9mdDL8IE=;
        b=tKfltlNIy/1FHggdTI8d4USDRLeEwBupVsfxbIBgj+ukUoiEg//n2D1QJaHQ94e8ry
         43NJLmNYIqL//JU3iKu1Suf33O30iuwHH4EGmRPk4Kh81nyxFr7DNiKpAUOlRy1e5QNI
         elHafxP2kng2wiB8GxQ6K6bWoO7OL9tSSw2KIERSqp11214ZdwK2XzHmxCNO5biRLXcP
         LaoLzPkjhFKbE5fCxZri+wHj+O4w1xGhY8OInTAaP/LWjg4fktzx/3CnErh6ZAsWBvFx
         7L19LDPJ6D7qsR2yvnQ3uZtlkO5DIuqXvF/h4iHQrFP+1BGc/NcREoR4sIA61VkO6w/p
         pf3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpBsBxuCZk1NTB4WkwYwJ3U7MJCH1uVZQeD5s4TUmCEY1B8m+EWYuXkbLI5WpoSwsz54+C7ZX9Q0rRrNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgcmplN/N61krZz899pB/52pIAyl+QVjPcfUY6rj/UQ709AqOq
	MIxjxCh6uQmlXD9IHQgyRlud3CJyT1kptK5aNpW9cExP8FYRnUKafKOg6DNyiVKPfRU52Rp+1pI
	FALjfpn1Ah4LoWhKg5M7fhPtFrftCHYR/SB2J3VueUZGWPzYDk0Z61zB4vOY+wwT/3+kTPJRTGA
	==
X-Gm-Gg: AfdE7ckg8Fbm7vWYDGB9edyh+7aHCSQUpLYl/agm/PXSYwK6ef1MZkrH6qqDWEq40Vx
	JPicKfXuLn0rwgQ8ZEe4O64/de2BhtquIfxHN5dr/WhMGe6FA8Pcn6Kgh/RCg67e0ZRZxgcaEea
	hH2NbNtYXsrOE3qRddo+hmZsaBtgWfVji3AKMtTFb+gksy7ZfCNbAyssd6dI0AqNOFVf8Tj+XhZ
	fuP/PXqDNluE/10K751GiZAipALrz6b1f5QMJwY5ibJCc89QbHwsVwNVuNZrjJyiU20lEsJ9sKj
	tCWjhbthNQ0hGi3FmDELR9u0+LSA7iToMDnJNjy4da5/9d66UoVvMj2FaCJ/tAakrdLkdJUVpyU
	UUpzr9PzO12i4nCDT0l0GkvVOLn+0Am2nVg5h4u1/ruuuyFpSHOesWE+BSYEfA/o38d1JixT534
	qtv+jy8YI=
X-Received: by 2002:a05:622a:130a:b0:51b:ec34:292 with SMTP id d75a77b69052e-51c748c4b5fmr49468111cf.53.1783423229483;
        Tue, 07 Jul 2026 04:20:29 -0700 (PDT)
X-Received: by 2002:a05:622a:130a:b0:51b:ec34:292 with SMTP id d75a77b69052e-51c748c4b5fmr49467731cf.53.1783423228842;
        Tue, 07 Jul 2026 04:20:28 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada023cesm109077066b.44.2026.07.07.04.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 04:20:28 -0700 (PDT)
Message-ID: <0426b129-5d03-467c-a61f-055e7dcf5654@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 14:20:25 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bod.linux@nxsw.ie>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <bqRcqVTcU8Jl1ClRlFeaaigWdG8pICB20xCQDPVqOB5QHXdtjWu1UYXWqhvyAuj30sim2P91BHvVLHLYgdD7vw==@protonmail.internalid>
 <7e36238b-96ac-4269-a6e5-0a6763e437e7@oss.qualcomm.com>
 <6b5e573a-c13d-418c-af5b-759deb40bfab@nxsw.ie>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <6b5e573a-c13d-418c-af5b-759deb40bfab@nxsw.ie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oxsPatBm9FO7OTZoujiMoodV-B9bo11O
X-Proofpoint-ORIG-GUID: oxsPatBm9FO7OTZoujiMoodV-B9bo11O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEwOSBTYWx0ZWRfX9vOGECZOJAok
 +Nq7i+SkFZAeT0djS1gbfZXK6og49D6CcfRaKkuPxQCWSDR30gReTe604j8EAE7M83J9e7tZekD
 SszaZ2dX1KW3pefb1pnM+RBb+ONo75s=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4ce0fe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=J2XvcvT0q4wf4MKS_j8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEwOSBTYWx0ZWRfXyyap2LHuCw9r
 jkm+X0mE9dIzsdeV3iukCLqxNgY0hKEwUGN2VIf1QaakHSavMlAyaXewfvxoXpPM+dDxYO87IH1
 hmFTGMiodM0+R3rOB2FcqLvU62ZbHEhx25mpz9nd+aqlfMZFLAUvxbuBk4LLSfnaz5SxbYaUoVX
 Lo03dbUbgvIXFIuJCOhsJSAQqXYagwPdG4QmsVFabJW7pnRLWlipZG8npglMVVTsXeAtNteXwIq
 AkbAxJ1PkbijHSnMQgXuFBSJawmmmwDjCFxfwlKIALf/d74AmcqNqZWVM2KDUpwMi+25u6O6/dU
 YSyPiRvxk3zM3ri+vQpL6kLmYBcHX2jiPoza1SiX9mfX4Z+nZqELHS4BxkT4s//QE9HfUvHNFZb
 0W5UEkvLgh2hT405QsvgNmM+LtNAdqgMS2QMgVihBXam78ps60NqnLWjf/fOUxQ9aHhHx7Hhrgp
 DnVc1ENCtPrWFk3T1uQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66833-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod.linux@nxsw.ie,m:vladimir.zapolskiy@linaro.org,m:bryan.odonoghue@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8CCBB71AFE2


On 7/7/2026 2:13 PM, Bryan O'Donoghue wrote:
> On 07/07/2026 11:55, Gjorgji Rosikopulos (Consultant) wrote:
>> Hi Vladimir, Bryan,
>>
>> On 7/6/2026 3:00 PM, Vladimir Zapolskiy wrote:
>>> On 7/6/26 13:12, Bryan O'Donoghue wrote:
>>>> On 06/07/2026 08:11, Atanas Filipov wrote:
>>>>> Note: The handling of shared camera subsystem resources (power 
>>>>> domains,
>>>>> interconnects) for child IP blocks is still an open design question.
>>>>
>>>> Why ?
>>>>
>>>> A device needs to vote on its own interconnect and power-domains on 
>>>> any
>>>> bus. A sub-device of another device may wish to ramp a clock for
>>>> whatever reason.
>>>
>>> Certainly a CAMSS device will vote on all needed to it resources, 
>>> some of
>>> which are shared and got their description under CAMSS device tree 
>>> node.
>>>
>>>> There is no "master" device in this block of devices - save perhaps 
>>>> for
>>>> the CSID mux / wrappers on some of these parts.
>>>>
>>>> We have shared resources like camera noc, system noc and external
>>>> clocks.
>>>>
>>>> Please include power-domains and interconnects.
>>>>
>>>
>>> Why? The common power domain and interconnects have already been
>>> described as resources of the parent CAMSS device, there is no need
>>> to duplicate descriptions in every child device tree node of CAMSS.
>>>
>> The initial patch and work for JPEG was as independent driver. I agree
>> from hw perspective it is
>>
>> part of CAMSS subsystem and maybe from design perspective proper way is
>> to be child node not of the CAMSS.
>>
>> However the resources shared by both can be abstracted in other
>> frameworks, example ICC voting allows to have shared
>>
>> clocks which can have policy to keep the higher rate and satisfy both of
>> the HW's.
>>
>> So maybe it need to be decided:
>>
>> Do we want really additional logic for handling CAMSS resource of the
>> CAMMS sub-devices by the CAMSS driver and create separate CAMSS API,s
>
> No, agreed.
>
>> or we can use existing fw's for that. ICC, clock, OPP which all allow
>> sharing of the resources. Also there are cases where CAMSS and
>>
>> is not needed but JPEG encoder is: Example RTSP streaming or UVC
>> streaming which require jpeg encoder.
>
> Yes.
>
>>
>> Anyways my opinion:
>>
>> 1. CAMSS is not prepared and not ready to handle child devices, only the
>> populate child nodes is not enough. I think it is little bit mess,
>>
>> some of the HW;s CSID, IFE etc are instantiated directly from CAMSS and
>> jpeg and Ope are described as child nodes.
>
> That's not the strategy.
>
> The strategy is gradual transition from monolith to bus.
>
> https://lore.kernel.org/all/d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org/ 
>
Sorry i have missed that. I understand now the direction which has been 
agreed on.
>
>
>> 2. Jpeg on its own currently does not have any dependency with CAMSS
>> driver code. It can use shared resources without issue and leave
>>
>> the ICC, clock and other frameworks to do the job.
>
> Yes as a fully self-described sub-node so that we can do 
> compat="camss-bus" with the minimal amount of additional churn on top.
>
> Make JPEG a distinct standlone node now, and you preclude the bus - 
> you have to make the argument to Krzysztof, Rob and Conor that "the 
> old binding was wrong but let me away with a change to it now"
>
> Not an argument I will be making ;)
>
> We should put the JPEG, OPE, ICP as sub-nodes of compat=camss so that 
> we can make
>
> camera-bus {
>     compat=camss
>     power-domains=<whatever is common>
>     csid {
>         compat=csid;
>     }
>     jpeg {
>         compat=jpeg;
>     }
> }
>
> a reality.
>
> Put jpeg at the same level as camera-bus and you basically preclude 
> that model.

Ok understood, lets wait for more review comments, and move to this 
model for the next patchset. Thanks for the clarification :-)

~Gjorgji


