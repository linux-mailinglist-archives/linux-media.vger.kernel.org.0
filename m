Return-Path: <linux-media+bounces-67294-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9RS5NOHnUGr68AIAu9opvQ
	(envelope-from <linux-media+bounces-67294-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 14:38:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B84973AD87
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 14:38:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KRImbWqE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CCHwbI5P;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67294-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67294-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2DB530584BE
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 12:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED11428480;
	Fri, 10 Jul 2026 12:34:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572343F823A
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 12:34:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783686843; cv=none; b=doYCtsW7AofY6rx2yOYwTkFPMc387q3n4r+2HS4lksLwIBIEn5ajpyKIxyc3gJ1ZWi/GgC2U5ZuKmpSazlcYikBrE602DYztgRjKmLPRxhM8qZFrliLF/l1aSWQB2SwOwp/HDTk81THHhfXLxl/FxCA2nfADzvh9PZV+IEeU/d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783686843; c=relaxed/simple;
	bh=gmNJ4oLCqisfWMQ2xkv1odn445Wq7mkxpGEegNDrq9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SOEVzHjgHRDTJHo/8gxVUsW3oO7pjMQAfjGm4AnqunMOctuLTgKNsBZ4JK8dWAjFg11wtm7iSyJoPWlKadyOiPGSUsasByHIUV58p9WTyPNRx6svl5687tClXCYKi426DgrVAsur73J2ErXtOdY4nksznrbF+pxGWeSa4ufLHfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KRImbWqE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CCHwbI5P; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAn7qU619496
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 12:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rrOo+UhzctHRE8y7sYY3z4m/BCBdD+Ep7OuN8Y4dfps=; b=KRImbWqEJCCBH65E
	35JRXVLMJd7Epy4gVzPxnoEBD4tgtOiLjrGgc7VFqdk9yVX01lX7M5Ot3QGEE035
	eUXk4jd4clXRrrsIelZy++ymfQyUK9N5Jzf2Rzom4EeTvDUmSqngsq8SaE8CmNMJ
	9sL9tVcon5H0RoRxLdfl7r+NX/vwoJLpVny3Fwfo+dUlODNuTOea6KmLJ8693BTG
	M+ICDBoRenJ0ziLRec+cJjVOlhKj5nqS6dWp7yYHPHhunZgkBKgkxY06sd5wy/5t
	Rkt1FWf6EPeUMX8O/qiBXNO+4Ao1H+Q8RGar45jy+jpHySEM1ikcgQ5+gxkWa3ZP
	qUBYAA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fay3e0chg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 12:33:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f21e4e8b66so4240716d6.3
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 05:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783686839; x=1784291639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rrOo+UhzctHRE8y7sYY3z4m/BCBdD+Ep7OuN8Y4dfps=;
        b=CCHwbI5PQ9zTh+vE+92XlwgSXRby8GA+jmEYEOs6V7cPJ72xQon0KwXgXbXWe0lvPp
         VOGIYIrS0QPDNlyo8koE8R5jrDO20zkVOO8JwOMFUDJxdU8YRGXYNgVsDHGaDUX88jhJ
         5FJNdeXm4+Nd4x668gPmvuUL1Gu+oclvuRlQBo9F2H8q4lDmS5fTFq6+C1xCJOfNAxcY
         xGsspz7jBuulZDCLytxoi5XG8Es2bM1ZQjuiHbMs/A5VIC+P3i/lf4zZi1L6XZsh7VNk
         1CLppcSsYy17McMjgP6h2lgItB3zpSa8Fw5PUV5co/MplyQIlsx+jnJ+Upv/qce9lcGT
         2LpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783686839; x=1784291639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rrOo+UhzctHRE8y7sYY3z4m/BCBdD+Ep7OuN8Y4dfps=;
        b=cHONI6UxclWA7XQjbTo7HkUsVbLmtIL3laxbwj+haI++01CrDcI52+kPxMKBzmWiog
         hs+m9bWlJc8IEnWc4zht6hWUJYrU3UNTiUJR+bD3wbcuVyFWq9CqrBF68MJpZv1gKkJq
         SnfnpVZPUOB1omJYMd8gbKnShSIWLP7Zscu9Q04I4WTzFHl9fLVboKkRckGcksces+1Q
         7ZSEvHSaD6edMvnGUMGoGHzkRTpA6d09/N1LyUSYhuX5S3tJkOFzwDnEsayuK5JpSexI
         2QwtWZCPtxCxgQKf0CWG40HbxktTamGA7DP0BDjH4UKg0lU4zAGXz/k+8cbHvbw4Lz/j
         0sRw==
X-Forwarded-Encrypted: i=1; AHgh+Rpprse6vpzZR1MVs4a9+QLFDDKW0M3e4mKJIgaATyjNzLzKx4on9T7f5cd1HpkmVeJ3o0JJ+hpZMe+vbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1mePKKkleScIVfiGqV2keAgihnSyKgTo8+GXw+NHkxQrlmExf
	aXfeGBj8G7FNSbzohGzSTSMpdrMrd96MEeIvS74mRCoRotmBZYd3ynbffKdYQ/vgCngsO17cPD2
	FfppDP0yWOHl25v9SJG97Mrilnsy9xpfpybckRTxZrN/AZjGLAGPBmRnUkyteKVoGRg==
X-Gm-Gg: AfdE7cm+V6Lt1QxJPhuyxuDwAfS9NSe4ztkzjr3sXsl/+B9lcJfTmFAMkOethMa5JQo
	iwEXXuKV/IuKEJiAuug/bGH0hqiQKXMEiqEEep2uBHIUi/GDfpgv6p9yOm2L6pDf/A8Hj5lWwHQ
	5FiAevO99VFd6KxJy68bj1nc+D7wzL3NA0acTYb4P5EZjQ1aMima2TxRUZMBCWvHZUH6E/flcv9
	OTFSOJU/dXhj91YDBf7Yckbe1FEZTUv1k58LPu94i5L9GkkXKXCqMUJ13XoXFiYkSU4iBxYtQmp
	wF/1BNTHjecelviMj6+8Bw1+976/vqN2HS8svxW+O1XCgYmdHZvmeQiGilO1TTDAaoBrdX8am54
	i3SsZAjWPSjgyBKMo6PpDwLV3jqVus1gktyk=
X-Received: by 2002:a05:6214:4907:b0:8ef:4749:b1c9 with SMTP id 6a1803df08f44-8ff957351eamr82841066d6.5.1783686838737;
        Fri, 10 Jul 2026 05:33:58 -0700 (PDT)
X-Received: by 2002:a05:6214:4907:b0:8ef:4749:b1c9 with SMTP id 6a1803df08f44-8ff957351eamr82840646d6.5.1783686838278;
        Fri, 10 Jul 2026 05:33:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4b4fsm10705561a12.10.2026.07.10.05.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:33:56 -0700 (PDT)
Message-ID: <1921023f-da03-4f3d-8489-bfa2c5fe4f3b@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 14:33:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <8a09875d-af5f-438b-b947-bc2b61219b70@oss.qualcomm.com>
 <c8c38ec6-4422-4c91-a249-20bc20260e73@linaro.org>
 <d0768c15-453f-4d3f-8110-886a5c697b02@oss.qualcomm.com>
 <d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org>
 <VoXmpDKdgY_XxAvO5tkDze4jpmMzSuKTmIISTejJsbIO_FIO1JFfUBlaPkNdb14E95zf_qwtDB6myQ2wdRCh1Q==@protonmail.internalid>
 <8fc1ddfd-0f77-4b67-b9bd-33fbd60e2046@oss.qualcomm.com>
 <54ad9b8a-7596-4bc7-a1c3-7230cca21360@kernel.org>
 <wbjec4qhzkpvdfnrvffk7tjmlvli5q2jiuzdp2iqt2cbf2uat7@usg2mizurxpp>
 <29bbcc9d-a0b5-4966-a195-1702ed514a4a@oss.qualcomm.com>
 <l5fz64drffgrep57hj7kwc7v2drbg6kdkw4f7wxrmxf2kjjhsv@pcyyjtzi7jlc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <l5fz64drffgrep57hj7kwc7v2drbg6kdkw4f7wxrmxf2kjjhsv@pcyyjtzi7jlc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyNSBTYWx0ZWRfX4N1FN5N0YMZf
 ljTe+b33zXn+q0jZBT2K0+Nh7cA3UzsjUddaGq/+sKpH6vV8ffJo1N73nI82dKg8iUy7Sn51vL+
 ZhF3ZnjwIA9i4VdkeYATFHZiQhIioKI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyNSBTYWx0ZWRfXyggx+aBVnf6k
 TTkUhAPW94GbEt/zL3UhskDLKsa8mYK9DXw5SpRYyiBSMScENyj05Zcokzsvsd6du+LFWeWbtOs
 R6K0auAc3DXTKkY9Y86CsuUw7aANkH4IyWQvj5s1pWo7Z+9W52xRKH/OkQu8Tdgs7/XWRy3Wh6w
 +fInknyGW5KNvn86et88XeqPC21r//7TKu9H49G5DnSnhMMkx7G9Z+tY7YED8+2CQVfR/LWP1Ez
 kVnt6H1oAZxcuYa/e60BfN2URFdqOiY1jzdMaTcNpjGA37cqh2WWnnTuo33UOJ2ZZzHli1bPi6R
 RQNZOGC7jo6jLWx77Pm3lAMyEP8jl/rurJtXevw4ESS4ohj/f21CMHrV7h6XXBs5zmMlqAzD/+E
 F6NiYhIFnUJ7Ck0HGs3a2Kti+ZkgUHll4mueKVj5tZH+THT+Fh+JbxoA1JncxTsK6V3YQ2KjKmf
 0AF8xxveXEj0YXcvAmQ==
X-Proofpoint-GUID: vmhQ7vCHNaOxphBRvPlU711sX1VmoeMd
X-Authority-Analysis: v=2.4 cv=HqpG3UTS c=1 sm=1 tr=0 ts=6a50e6b7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=dFzIMAVjCySLt-5DOyQA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: vmhQ7vCHNaOxphBRvPlU711sX1VmoeMd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67294-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 4B84973AD87

On 7/10/26 2:28 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 09, 2026 at 08:16:21PM +0200, Konrad Dybcio wrote:
>> On 7/9/26 9:33 AM, Dmitry Baryshkov wrote:
>>> On Wed, Jul 08, 2026 at 10:21:43PM +0100, Bryan O'Donoghue wrote:
>>>> On 08/07/2026 13:19, Konrad Dybcio wrote:
>>>>> On 7/7/26 12:41 PM, Bryan O'Donoghue wrote:
>>>>>> On 07/07/2026 11:11, Konrad Dybcio wrote:
>>>>>>> On 7/7/26 12:00 PM, Bryan O'Donoghue wrote:
>>>>>>>> On 07/07/2026 10:24, Konrad Dybcio wrote:
>>>>>>>>> On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
>>>>>>>>>> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:

[...]

>>> Which way of representing device nodes makes it easier to migrate
>>> existing platform to the CSI PHY driver, while keeping compatibility
>>> with old DTs (yeah, ABI, old DTs must continue to work)?
>>
>> Quite frankly, I don't consider the existing (meganode) description
>> any valid, and would vote to rip it the second a replacement is
>> available. But once, not N times.
> 
> Rip without providing backwards compatibility?

Because the existing bindings make ensuring the required performance
state of power domains impossible, yes

> One of the options would be to follow the 'venus/iris' approach: land
> new set of component drivers, which target new platforms and provide
> minimal support for one old platform (maybe via autoapplied DT overlay
> or other similar techniques). Then continue migrating and phasing out
> camss driver for old platforms, while adding support for new blocks in
> the new set of drivers and ripping support from the camss driver after
> some migration time.
> 
>> This is not to blame any of the original implementers, this might
>> have seemed like the right idea for the tiny subsystem on msm8916.
> 
> Maybe...

Interestingly, there's a number more peirpherals inside the 8916
CAMSS too, I suppose some enthusiasts may poke at that one day,
there was quite a sizeable developer base for that SoC at one
point.

$ rg @ arch/arm64/boot/dts/qcom/msm8916-camera.dtsi
15:     qcom,msm-cam@1800000{
19:     qcom,csiphy@1b0ac00 {
41:     qcom,csiphy@1b0b000 {
63:     qcom,csid@1b08000  {
87:     qcom,csid@1b08400 {
111:    qcom,ispif@1b0a000 {
155:    qcom,vfe@1b10000 {
212:    qcom,jpeg@1b1c000 {
232:    qcom,irqrouter@1b00000 {
239:    qcom,cpp@1b04000 {
273:    cci: qcom,cci@1b0c000 {

(there's probably more hidden in magic reg accesses)

Konrad

