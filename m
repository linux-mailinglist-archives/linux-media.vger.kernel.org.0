Return-Path: <linux-media+bounces-59840-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPCXHqCm8GlAWgEAu9opvQ
	(envelope-from <linux-media+bounces-59840-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 14:22:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5B5484C73
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 14:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB43B301CCCA
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 12:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00BAD40F8DB;
	Tue, 28 Apr 2026 12:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QlJqfC/V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eIoCy/JW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D0240FD9B
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 12:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777378637; cv=none; b=TSUrjjlJOD7vN2AXHHDUn0pFVJSEQt2IhSbkP52gxRIadELPDCikpaJfu3yfRBdePNOZ4F0xpJPKfKyTsF00OeFDHS/WAGyViIsVjJ7WiMRw8XUk7NqHVCT/ZWV6nokdwEotsL2B+XcAIVzRCpWHDErrLgyIx8FR9aFmdT3Hdas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777378637; c=relaxed/simple;
	bh=kM56ejo5gQ6HGoBQsJpChux9jZ3rBKCnxv23GmTAmSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R2rE+D+9es2PHm6vU4jkWP9mzUJ9FslRlafTsf1Oa70eX878us+qE6ALNglV7ReLCbsml1MfzMSM6XtUoYu9yuyZEIf9qu4PqLhZCZQirnUFPD88Kl3gaZz3iYx7UlBFPvCvoT9BOd0mTViWE2wWar5OGFNdFRlKR3kokPdC3Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QlJqfC/V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eIoCy/JW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7vql31744980
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 12:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kM56ejo5gQ6HGoBQsJpChux9jZ3rBKCnxv23GmTAmSo=; b=QlJqfC/V5tchW8uC
	Cs2apDV9Yk9hxjrYUvsr29xsmR7A1r3znXY0ozNeCbeY7t9VB2IwJAJBTq9CmuiG
	LMRglGB5hcP0pdXdJsNmMmn2Mky77MGfAdLq5YS/oF1fe1cCAOx1wxVaPWYdCyXe
	IZHm4WDmSaKlcgG2QDtCwcaS2GOJvkp1PTHCvJT7L7nTY71ZzVco7kY9P8HC8Kh4
	mQ5bEWq3jKObZDwSL/aU4yZT7PClPSzmWfPucPAHOfMGnf3fwAgRw99xvO+z2Jdp
	P2slcM8THAeZJdzcNKxmHbIn1hdE26cRPo2hHg7qjinOUmuXirwTXQ8084W5NuYV
	EGBLsA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtryd90xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 12:17:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24308165dso159969885ad.1
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 05:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777378625; x=1777983425; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kM56ejo5gQ6HGoBQsJpChux9jZ3rBKCnxv23GmTAmSo=;
        b=eIoCy/JWYA22Tofa52QUDSg13tq8N3EU+mNELLqzJ22MESgvJnj1Ao6ownrTgGD0hL
         DyXWAEQdHZ842jK28Xh/I/neVUMoHNQ6hKX2CbYZ/58pMktb6oTRf7YFQvU+vwvI7cd8
         SM97ITe8ZxwTuFx+ppFXepfaFDbIGErG0d0c6cnpbEDmo0cKWVYK2Mp05Llnc/oZzULn
         /y/5t6bUt4LBM6BDXbWvCbE/OaCruQESWbE18zS0g2sKHT5xvwv8VS16jko451AQw16S
         rbDOMz8r7jABIgkaOlx65l1umwnnf7nSM8YVf3yGdT/k+ZYYRjxWB4BM1WeXSmSEw7L/
         OEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777378625; x=1777983425;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kM56ejo5gQ6HGoBQsJpChux9jZ3rBKCnxv23GmTAmSo=;
        b=cp8yHvop5nKJWtg9DbNmxAubirP0zdBgg0sOg3o0LNiZ+TEg688Yn5UOVLpBcf7SF4
         d9txKrFW8FE/5g7ryeoY+hZO3Q55QBYGZBiFRXYwn8AfVyoibCc6t8GaZSkon5uwn+7U
         gzQYr0hTUXKwAemSbi97T6xDJffFbii8moPuN6Azlf+Q9jzPcI0wgloyUKZ8cUsCSGHK
         ycr/xCQvjZaSlH3evvaG/HpEfB//NvIua4+GaETmGLd4NtanC54GbDl4zfUfytla/GEG
         dW3peGI92DR0xEWSoBvGNjJcZ8dI8iabxsKTtFUqKPndR5gfL4it225DRMJHIK1SZg+L
         Lznw==
X-Forwarded-Encrypted: i=1; AFNElJ8oBUMlTnkh/JQ6SJTraVwqAF7QZ6fWZRwj3yPWArUorSpWoIXEGpVz/AjDw3oD55sIKTnfi96Odtb8TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG+vwzQHBRoD1nKRmKCuR/K52OkJrKt57u39YESAFQCQviYziQ
	ERGVAwC2m6HVB7XjupbKji+SFS3p+1o8Oi5t9beLncd+AGM7n93ctJ6/s59G9G5d2B2iG+emlSk
	zROHKzR3d432DJiZ1C0iVuEGRA14xtPqzWz0+IytjXqxkguG9myn3iOIzy6mt8UNHUQ==
X-Gm-Gg: AeBDieu26/UTKjkW661zr2gjy+TDnZWWh8+ElF3MGxOT4KVTo4/RQVwxHbHywiwocfW
	UceVBWRn5sOFpdOdD5X9wQFVdV7G7HP05iTTo0/tbV0gIN12UtSE0IjBiMq/4QecxAvyUdbhWaE
	ohaXvuSlu08cuxcJuM2UrmAF4ZCY6mw8WvvxFuQYQN7Jw/HTPiu0sUEXslN47RIDk69Zf0h7a86
	yxMWUFa5RkOwvVoLP9GCxENuXkfgk5oA5Q89ICIm1LUm35bGIypAGaXdKrACNO6xGHLoTCAfUee
	S4rxoi5TbzHtc8ZGTYsgduUoQQpxu3dK4rBLiaDCI/DaamPieI8CmCkW4wvgsnDl+WkjS6MByoJ
	NZXGwSj1Du5hPA83mrHoGyc04az5VrqviBYJwUteuW8yR9zSE7NAcqyyXR135NO++
X-Received: by 2002:a17:903:388f:b0:2b2:4a9a:b168 with SMTP id d9443c01a7336-2b97c3febaamr28330865ad.11.1777378624751;
        Tue, 28 Apr 2026 05:17:04 -0700 (PDT)
X-Received: by 2002:a17:903:388f:b0:2b2:4a9a:b168 with SMTP id d9443c01a7336-2b97c3febaamr28330335ad.11.1777378624142;
        Tue, 28 Apr 2026 05:17:04 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aaaf65fsm25666705ad.31.2026.04.28.05.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 05:17:03 -0700 (PDT)
Message-ID: <e39df722-3868-60d4-07f3-768d11762e12@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 17:46:55 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 02/12] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, iommu@lists.linux.dev
References: <20260428-glymur-v3-0-8f28930f47d3@oss.qualcomm.com>
 <20260428-glymur-v3-2-8f28930f47d3@oss.qualcomm.com>
 <20260428-nifty-quaint-hoatzin-6de65d@quoll>
 <97aa5f18-d1d5-f082-9075-a385255f2e97@oss.qualcomm.com>
 <7d775357-c7b1-4cf5-af90-012d1364e773@kernel.org>
 <6ebe28dc-b8a3-db92-0e66-3f0541e23e13@oss.qualcomm.com>
 <1f88a8eb-1725-4e6a-b4f3-287ec538ee7d@kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <1f88a8eb-1725-4e6a-b4f3-287ec538ee7d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: c7dtI8Js5Iqk1BifSqbstvzwLMl6abhm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExMiBTYWx0ZWRfX9JnOt3xbX62L
 JAZqbVlyDruTtJ/IGMEcMZjJPdKLvkhSdqwhmH0O9QFBXJKOtn1rQePaDngg8gZPATrI3f/bCgr
 HIXPgldyu+cl89/bD7L+Y4TWJzlvZIAuZkXfWWVNQ9K3ZH7LiVlSqw6vL52h3gUawqnLfJZT57s
 ei33QM4Uz4nL7Ho+RikFy91BlrtSr641BCLGyX+fRv03ntkxidIiQP+r1Fb8Qi3QsEEQkf6RLii
 gnAuz6lhCbg6UCgLlIJ3ycCrU4qBawPTgsmnKMVFG/60lNHS9kIqIKxGduWtgNVLEhxY4HAgUOs
 g65CVFFbxD/V9mmo3P+X1NHDzDQ2L8A+pYWOOrUykNDfw8JhW6W4HirsXrFoWvDN50zhkdDL8vd
 Wj/WHZBjoMOKzkrjov38A0WY/82ZCTsX0FjBuPXZ97PNubQ2kXWOL4yAMK5I/XtuOtZD/uXl4Td
 jktAAgEHTFH3tgmKV6Q==
X-Proofpoint-ORIG-GUID: c7dtI8Js5Iqk1BifSqbstvzwLMl6abhm
X-Authority-Analysis: v=2.4 cv=cMnQdFeN c=1 sm=1 tr=0 ts=69f0a541 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=IkJjYso2sozc4OUn8SEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280112
X-Rspamd-Queue-Id: 0F5B5484C73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-59840-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On 4/28/2026 2:48 PM, Krzysztof Kozlowski wrote:
> On 28/04/2026 11:12, Vishnu Reddy wrote:
>> On 4/28/2026 1:58 PM, Krzysztof Kozlowski wrote:
>>> On 28/04/2026 10:08, Vishnu Reddy wrote:
>>>> On 4/28/2026 11:44 AM, Krzysztof Kozlowski wrote:
>>>>> On Tue, Apr 28, 2026 at 09:24:08AM +0530, Vishnu Reddy wrote:
>>>>>> Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
>>>>>> is a new generation of video IP that introduces a dual-core architecture.
>>>>>> The second core brings its own power domain, clocks, and reset lines,
>>>>>> requiring additional power domains and clocks in the power sequence.
>>>>>>
>>>>>> To accommodate glymur clock and power resources requirement, the maxItems
>>>>>> constraints in qcom,venus-common.yaml are relaxed. This allows the glymur
>>>>> This is a very confusing part of commit msg. You cannot relax the
>>>>> constraints. Each device MUST have a specific, fixed constraint. It is
>>>>> your task to be sure they are not relaxed.
>>>>>
>>>>>
>>>>>> binding to inherit from the common venus schema without duplicating shared
>>>>>> properties.
>>>>> That's obvious. Why would new iris device schema not use common venus
>>>>> schema? What is different here then that such possibility exists?
>>>> Glymur platform has a dual-core video codec architecture (vcodec0 + vcodec1),
>>>> requiring 9 clocks and 5 power domains. The stricter maxItems from the
>>>> qcom,venus-common.yaml takes precedence, making it impossible to accommodate
>>>> glymur requirements without updating the common schema.
>>> But so does every other device, no? So what is different here?
>> The difference is in the resource count relative to what qcom,venus-common.yaml
>> permits. Existing platforms like SM8750 have 6 clocks and 4 power domains,
> So it is EXACTLY the same?
>
> Again, what is different between devices that it should not use common
> schema?
>
>> which fall within the maxItems limits defined in the common schema (clocks: 7,
>> power domains: 4). So for those platforms, referencing qcom,venus-common.yaml
>> via allOf works fine, their resource counts are within range.
>>
>> Glymur dual core architecture (vcodec0 + vcodec1) requires 9 clocks and 5 power
>> domains, both of which exceed the common schema maxItems. Even if
>> qcom,glymur-iris.yaml explicitly defines maxItems: 9 for clocks and maxItems: 5
>> for power domains, the stricter limit from qcom,venus-common.yaml takes the
>> precedence, causing schema validation to fail.
>>
>> Glymur is the first platform where the common schema limits become a hard
>> blocker, unlike all prior platforms that happened to stay within those limits.
> Hard blocker? What? How? you are imagining some problems here which do
> not exist in any other devices, any other IP blocks.
>
> Why is this special and GPU is not? Or display is not? Or anything else?
> Why standard rules of writing bindings do not apply here? What is
> exactly different? Write like this:

The intent is not to treat Glymur as “special” in the sense of resource
count alone. The key difference is architectural:

The existing qcom,venus-common.yaml was originally written with single
Venus/Iris video core and its maxItems for clocks and power domains were
defined accordingly. All existing platforms fit within that assumption,
even if their exact counts differ slightly.

Glymur is a multiple vcodec cores platform, each core requiring its own
set clocks and power domains. This breaks the implicit single-core assumption
encoded in the common schema, which is why the existing maxItems become
insufficient.

I agree that simply relaxing common constraints to fit a single outlier is
might not be ideal and not scalable.

So one another approach to handle this requirement could be to remove the
maxItems entries for clocks and power domains from qcom,venus-common.yaml,
and let each platform specific binding declare its own maxItems. This keeps
the common schema reusable across both single core and multi core platforms.

> "The standard rule of <foo bar> from writing bindings does not apply,
> because <baz fab>.".
>
> Best regards,
> Krzysztof

