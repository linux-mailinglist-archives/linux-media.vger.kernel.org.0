Return-Path: <linux-media+bounces-66828-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n2z3BevQTGrAqAEAu9opvQ
	(envelope-from <linux-media+bounces-66828-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 12:11:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9CB71A26F
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 12:11:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KtLPpa06;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YrtXcaqB;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66828-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66828-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8CDE303CD14
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 10:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415DD3DB309;
	Tue,  7 Jul 2026 10:11:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435AB26FA60
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 10:11:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419095; cv=none; b=OwrxSUaAN4v6lbXWkg62Af7PNV0D3E97zQ5Y5k5f/AfN/OZ3OVJcCCxsMl/FudO2SsNt0EGoInDbMx6txhakgeQyqrp7wmNZjLdUd21xLBo7LUN0itKHo3N1ZHBoONi8iMJknC85IPyo53DPJtbLbyhR599NPmso2WxkOrUxXSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419095; c=relaxed/simple;
	bh=6JL0HqvAqJn5maYjK3rA8vUw308VmjsNmU3ovua3Tc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ULpNxARXJT4oi1PAGK2am9L5UDEuUZpfOIhfiHzEhuOeZogk/+WOC9sV3igsuEZBIScS++XMz2b48wq69ocvXESAbGn612vZ35j0GbgVFv1jMofYx9i3QPcleYc+XPKscgKBFV16xEa3kp5KakFHBf6lUeS1ua1CZCfYZTd2O+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KtLPpa06; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YrtXcaqB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667A7BtM3471645
	for <linux-media@vger.kernel.org>; Tue, 7 Jul 2026 10:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SuuTWbnslk2/iT7IgwctDLxx0OexGzzGiaPtPGBGzo0=; b=KtLPpa06A5oo1t+L
	eIxFsHCf32opPqLCXZ3MLd5TpCSXBESUAPmbNluLiTU4CMxqbcJGrN6bAEKcGdmn
	GjOAcKt9lw7SNU5ZOUXAoal7+6epI/zKB3oMle6sdVJa1tb8AEsHoDy0wd1QNFYK
	35vwY5MD+AOIjHaP7LCrWoOVqtuFPrZ2R/kFUnjn2iA7vWmju94VCIjfm/Ago+dc
	M92fqp3S1SLaiUKma26iXOkhdQIP5TYZDqWDy9fzgiQ1qE15QnbBu4xcRxRHZw4S
	axlMOExk19kn68ctfOjN7OSa782NNQ/ipjAeies8cuYGur9Knk8CMT4iNYU2RepB
	0NMZjg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0g0kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 10:11:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c2d2dd52eso3382111cf.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 03:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419092; x=1784023892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SuuTWbnslk2/iT7IgwctDLxx0OexGzzGiaPtPGBGzo0=;
        b=YrtXcaqBeHxMYgHS32mLXya4P0mnmPInJeyTq5sLdnBAbYw16iKG48xYMi4e4g2kVq
         FHcHEKnYz6sdK6rg0x9p1mqeefca9bUrap32OyywKsCmonVpNUvcrXxHWSJBBbOHGiI1
         I0FLq+fz81EW30mo0SvzymqV9SB4g2w4p9VzevcelwdMWahhlEXYfupigkXMjaKKSu3/
         +muN54mUgMBraKIr0nuutLF+23WCq4JpfQBsvDk9U0JLWk1pLZrwFHvZ75Zh0Xa5XE8m
         xoJeq6xClisjh3CudLc954aGdkVM/2ReVOsyWCcxgI51nOW5CrUeYN/CH76IE5UJg9ez
         m7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419092; x=1784023892;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SuuTWbnslk2/iT7IgwctDLxx0OexGzzGiaPtPGBGzo0=;
        b=PdmQHJoifjShWaex1Badj4Aiap7Ck5ZbnpPkKktB7D4xitmTWMLuJ5c1Qq3MeDPCiv
         iasjlkSoWJsU+Igw8tHEwrIcFBgi3x+7/4OFNLqUTN+OB4HSj4KfMQfQLOkLLhNUm4Is
         Z/yWRFYQkM+vL+COJkCegNTyCr7Dff0kMV5BoFKfDxuE9TpA+TlocO/4Q1t/03v8rMHR
         Laq07gP4Y11TJSMd0Y8qjlddSfn0759iEAmxDAJw4dikvaHba4+1c7gahMX5T8oq3qlU
         cL6r7/3IZ8yLzwjko5bzIJYfmEPJYHqJFJ1LnpWGQP/ArlNwTE7l5kGekskhvW/9pRX6
         CdpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp3XXsX24u4qt5sbWydVz1F7aDCQ9r2tJQSaVnmB7jDQpq8o2QxarN/u8L88SL97g4F2Flk1RZgRajbyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgMJJZsGjjLE7dHtJ6MPWcZseymVpul0w48QiL76VFsk1sV4ei
	MCCnbV9wm+S3k4KsNnufl5kdcOxlzD2gX8x2v65XWSK39FkRymclxXBF50GgphCg0ZI/+iozJRN
	bpGyQD3AiCAUc/licd4XjD1CAbLFjI/e5jeZYJlsW28bOauUn9ZXEfoQeaSp18jq/dA==
X-Gm-Gg: AfdE7cnAqTu3W8e7uWmcNScBolUL0tx+FlcFMuaaukMwk8IVRc3kZMHXFC6Y9qvSyP3
	wT8TqbZIL5J3v8nolQBNELGvSC6Kw/pzo4gTY8FDVZW3xPRE2oYyqIQ8/jlcGi6GzyupfO5MiX9
	jW0VdeT3ab3dengcwhhllpCpjP8AdBiqPpM7wpo0OpRHGfrQjSSrYjmctBReEjBJGVf/mR1t+7v
	ZgnGEx+5U5N1zkfB1pj7KOovHJqp+s+uCJK6xMuAyYM3fSwPOo0OxRhq3xRL5uHsUWyKulthDkn
	GSUyAAYLHX4HD31TDjShRjYud86Pj28qNAGk6PsEiIscgGPnk5+ixRW6+C8hZkulvAIPaw1lVSf
	P2Ubbqf5FseWmmGguCKftF1O0kkAnzZVVZ9k=
X-Received: by 2002:a05:622a:347:b0:51c:2101:f0 with SMTP id d75a77b69052e-51c4bda6c05mr134668971cf.2.1783419092387;
        Tue, 07 Jul 2026 03:11:32 -0700 (PDT)
X-Received: by 2002:a05:622a:347:b0:51c:2101:f0 with SMTP id d75a77b69052e-51c4bda6c05mr134668681cf.2.1783419091715;
        Tue, 07 Jul 2026 03:11:31 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad84bc3dsm101215766b.21.2026.07.07.03.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:11:30 -0700 (PDT)
Message-ID: <d0768c15-453f-4d3f-8110-886a5c697b02@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:11:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
 <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0hlY8592TywgDy0hhdKdSlLKgu-QlkkT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5NyBTYWx0ZWRfX43UOtiyySQUH
 +oVY6K/ZX/QLqPKK4KorJM/4xO2BntPLhrZGw0VZXER2AdwI0euxVAYlDqPDV3Q2eeI0vVmsP7T
 6FruKRfB0Yv7mGz+NZEJdwXbLJUNRuA=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4cd0d5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=lEcDftd587Omc_cSSeQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 0hlY8592TywgDy0hhdKdSlLKgu-QlkkT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5NyBTYWx0ZWRfXxlKKAyEZ4qaW
 GyRwoCZ1+LQFw1lbmCujpduxAfC0/hCjajVSHmpxb8GCJwnIJxnjkGw8E1MTiChd0aZ17Nu2nUK
 bb7bWaMOqx8mB/tKtPejhU218hSMVb0znp2GmMEvCjSpeLEgt8FDOUrL1lYfvPWoE42OUSiVNwB
 5pvG1A65rIZUs1b0UbMWG3fU50B9N5jMrKAoZwRrHL7PBScAF45lKveEW8rT4t7g2cV53JrrkQ/
 FbjvuGzaJEdHCrrepC1ag78NEiAP50k0Em5nn/cnliCVRscr/jGnNFN1DqFYOxS5gD3oZcSArNS
 C8iRRaxNcvyfRbLi6HSfi0raytIeQbNHu+EOuALne/lKraVC+eTy1m+ebL3ITzcQtqZebmfDdWn
 JcQXjxLAISIpPeq6EuveunSPBy83NydnE7EaZmwBC/SSDQ/2na66eW/1cOyrOAGuuXZNrR+pLHk
 4JqugnIAgb/6y6j+Gkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66828-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E9CB71A26F

On 7/7/26 12:00 PM, Bryan O'Donoghue wrote:
> On 07/07/2026 10:24, Konrad Dybcio wrote:
>> On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
>>> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:
> 
>>>>>
>>>>> The idea is to make all of these peers, eventually. Not particular block
>>>>> owns the TITAN_TOP_GDSC - the entire CAMSS block is a collapsible block.
>>>>>
>>>>
>>>> The statement provides the same information as before, e.g. it's found here:
>>>>
>>>> https://lore.kernel.org/linux-media/fbc018f5- c025-4747-85f2-53b45b0f0496@nxsw.ie/
>>>>
>>>>       There's no functional linkage between CAMSS/IFE and JPEG - they are
>>>>       peers within the CAMSS power-island.
>>>>
>>>> Thus "the CAMSS power-island" exists, and it got its hardware description
>>>> as the CAMSS top device tree node, and TITAN_TOP_GDSC power domain is
>>>> a natural resource of all devices on "CAMSS power-island",
>>>
>>> Vlad honestly, TITAN_TOP_GDSC is provided to the CAMSS island - all of the nodes within it depend on that and it is _external_ to the block.
>>>
>>> There is a CSID MUX on some SOC other than that I'll restate it again, I'm not sure why you won't accept it.
>>>
>>> There is no dependency between JPEG and IFE, one is _not_ subordinate to the other and trying to find ways to invalidate that statement runs counter to the facts.
>>
>> They are all subordinate to CAMSS_TOP - Vlad indeed said they are
>> peers (i.e. there's no co-dependence between them specifically, but
>> their parent is shared).
>>
>> You can't use any of these IP blocks if you don't first power up
>> TOP because of the physical layout.
> 
> Yes and I'm asking for TOP to be listed in each of the subordinate nodes for reasons given below.
> 
> But unlike MDSS - OPE for example doesn't require IFE or CSID to do its job.

MDSS also contains a number of unrelated peers - e.g. DP and DSI
controllers.

> Over time we can move the bindings to a model where the only thing in CAMSS is a top-level bus like declaration but _right_now_ what you would do is create an artificial dependency on say CSIPHY for JPEG.

I don't see where such a dependency is created.

>> This is exactly identical to the MDSS case.
>> I was hoping this was clear after N other similar threads.
> When we split IFE, CSID etc up into their own individual nodes it would be possible to model as for argument sake
> 
> compat = "camss-bus";
> power-domains = <TITAN_TOP_GDSC>;
> 
> jpeg@x {
>     power-domains = <JPEG_GDSC>, <MMCX>, <MXC>;
> };
> 
> What I'm saying here is do this
> 
> compat = "camss";
> regs = ife, csid; // exisiting bindings for the last ~ 11 years
> power-domains = <TITAN_TOP_GDSC>;
> 
> jpeg@x {
>     power-domains = <TITAN_TOP_GDSC>, <JPEG_GDSC>, <MMCX>, <MXC>;
> };
> 
> Otherwise you create entirely artificial dependencies between IFE, CSIPHY and JPEG, OPE et al.
> 
> And BTW if/when we get to the camss-bus stage of things having TITAN_TOP_GDSC listed in OPE and JPEG is a very small price to pay.

Patch 1 (+ devm_of_platform_populate(dev);) makes camss-bus a reality
today


> We've already agreed to gradually transition the bindings instead of go for a big-band integration several times.

JPEG isn't a block that's described today so I see no blockers here

Konrad

