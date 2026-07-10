Return-Path: <linux-media+bounces-67303-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dIM2OnX3UGqs9AIAu9opvQ
	(envelope-from <linux-media+bounces-67303-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 15:45:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A96C73B60F
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 15:45:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=csMH9YL1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=efotPJET;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67303-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67303-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5F29301D60C
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3477241686;
	Fri, 10 Jul 2026 13:45:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A607E0FF
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 13:45:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691120; cv=none; b=SndSVfLbuqiiyWzXxsBnWlZuS7cWauUNOQAdioFf4zRx1QOEPJJpLd5Q68FMo+R3Un1u4SzbQ92NGFuANTco5BaNPuphn85Hv1f1LoborYz26XLruZu3pqUEXvjjql1A9KTP7QfBspdmBVMEzWL55exgPLXLDdrBo7Sn1SYzGbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691120; c=relaxed/simple;
	bh=1VuQw9WouRZL3IiouA1QDkIQ+D+qcZ0FPME4Q/xFy7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gpBLY684uxeC5V2hegGTjmRpNf9L4YNAq8O5CsCS9ZdvkrQdcyYpWkC39cHOBeV+TL79CgeH6rxFAqRUq2lRyaryp3KaIBcD8lGIJLX/aVi6LkggMx0IbTPWf8Fnm+uIxGUaJW+k5ZtfJ7TthWznis8ECKHA1aLI4YP2HHHcp+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=csMH9YL1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=efotPJET; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD5vnK919856
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 13:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xVl/Jh7gTfBZtZj4Op6JOZlxfJk6HcU/wOB6FOt5iGU=; b=csMH9YL1xPyXclnY
	035rjMDTpelcKS+IdC1NgoMML9yhFxPXmGge1+IAltGr3MEOCI4PSLxSnk5MUPlq
	SrYT0gKNHf6PbNZL5pjsaGghZTBGBMkwkmFGhYxqa/5Sb3UX6MjomR8MYALkv8xC
	gfWMS8vyf+hdPhoeJ2AITV2Kt1bnNWmWdLpZBVxZNgHRihXrjlhxpTnKKYABwgby
	kgXRZJQ7vfBDnHT6HRsQmfJ153Tm8IbiG154Ms82oHGfysdeYKegjARPjuHymDHr
	USC7s9f9OLDwN0N8/yRrEa61s3oua8RV8Esu8gRzBYCKKacoHEUmySeSihqjQWlA
	uw4/uA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte3b7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 13:45:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0199faafso9397941cf.3
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 06:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691117; x=1784295917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVl/Jh7gTfBZtZj4Op6JOZlxfJk6HcU/wOB6FOt5iGU=;
        b=efotPJETnaP7BLsH3ZOhFBe3wq5fcKYWAqbpqGT0UK4jLrC/WJ7dsRjvDeVzbXebIz
         2LWU46A+r3RhZfLhMaIFmB7tpkMJNJKjDP2tVlvX7Jwmkc7PZS13MEcBb7nLl8uGuO9L
         ufTQdGEauiJRYYn+2kZmxgMHzqvPXlQ+SGlPssW2kw96Rg2vEAFgAlly3lTgJSQuIpQl
         zy3kqBMlhoT4y2FxwTRr2TdxILiUFfBtP6UVGafheyT1Rw8uT7qiJJ6BgKUOErkonPot
         FrMXzz/jes6Uul2a+s17WhsKa764TS1eAXee+QqSSGSBiZ6CIx+J74z5aE9altcLmPEO
         dIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691117; x=1784295917;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVl/Jh7gTfBZtZj4Op6JOZlxfJk6HcU/wOB6FOt5iGU=;
        b=mZH4tsOMUd0XMOjqr0p0d6ZQ6qu+EF3SuDnqr8MJ9/9xphr1MCotk77CsRM05v99LV
         iDFzEdaj7vRt03zruS/EN7J07mieJ+BkVbAsW+o/HEuCV6HceCD+00DYt5AdsjallRnP
         ZVjQmnkojq1h3Xldi1EuIpoM2rPmNYG2e5pI4SqpqOPTX8KlYuaKrXk+0awiHac45Gf4
         52iksXyIGf8IoojgloLg+vOBf88jrrMjUqva1oGCE9ZT049snH5jynb+qkXk16ig+peU
         nue6pYbYcNe3BHX2X9sBrvM/ZptZeklANGlLjHuMl03JqTZjrConripTyhPTa2oGAj9y
         WWBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpipp9lJ5KQFQnylDbgGSWKMdb77EZZHYSX64eydoZIC03Aucm0lYu4Rdv2dUATp4cDF27uIPb9UppeOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTuquhqguAvsgytKFxNbuNfNmKvBsje4TLK2qvCdqXxveitoW4
	UZDHiFvmAFhEBbM04w1G9jlaPpzmTOhs4zfDt7xtu4EvyHvlbG90IA+pt/+JUmqXCQ5rDvcfhpU
	tHOnuKLR3NMTDjCKWain4nTfZ3zeccRj8f2Uu/813o3DrzPdwll39nUmdGy/z07/l0w==
X-Gm-Gg: AfdE7ckz5ZHp/qhHN+P22YU5OzUNCnA7fRLjPJisBhp7Qsz+dD9CCsX1oD4de0sjeBy
	/cBnvsGKLDp2TIMY6QTjL8SJx+WERe2ZMf3JzX3Z4t4Z1GfHioJB5b/J3s+L2u5FHVtUHYPqZmD
	TLAReOUdmbDpP40LNZjWLdoNwXHf3G0m8hwWOe8N3C/CWVvfODena/S65d1+90K0p23jwb1iHA9
	1XpktGt5chlRV6ZpGVGDVk2D+1osvWc3FbaGaCyD+Las6Z03YO9S+SEhG6VZcTJxJmAN6FSXEpK
	BvkAAU+IAl5qIKDWwoF97bNbvN6p444QHFaVqfoXFhMxGY9wJc0Ik81XD0Kb4fiPdckCxunXElt
	1qdPHGtsTpwIrL5YpPxxoHGT1eTsqAWMhAtccnS5dARo=
X-Received: by 2002:a05:622a:410d:b0:51c:135a:5b49 with SMTP id d75a77b69052e-51c8b2ae5aamr123570401cf.4.1783691117146;
        Fri, 10 Jul 2026 06:45:17 -0700 (PDT)
X-Received: by 2002:a05:622a:410d:b0:51c:135a:5b49 with SMTP id d75a77b69052e-51c8b2ae5aamr123569891cf.4.1783691116554;
        Fri, 10 Jul 2026 06:45:16 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada023acsm617631166b.54.2026.07.10.06.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:45:15 -0700 (PDT)
Message-ID: <56a7da52-8190-491f-bef2-f9c95bfc551d@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 16:45:14 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
 <d5r3arZtREpnddaOGPStdRSGdwUSHDS3j61ersC0nD69JffwlclsJISjUblw4n6UwjjCVh1YKGOZhMLJCC9fWw==@protonmail.internalid>
 <l5fz64drffgrep57hj7kwc7v2drbg6kdkw4f7wxrmxf2kjjhsv@pcyyjtzi7jlc>
 <4d533d52-4de2-4a6e-af54-ac9052ff4506@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <4d533d52-4de2-4a6e-af54-ac9052ff4506@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Pr05ZG1lu_8RX_dKHBy3yrb-VGpqzdSZ
X-Proofpoint-ORIG-GUID: Pr05ZG1lu_8RX_dKHBy3yrb-VGpqzdSZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX5la/SO+BCHtS
 KL270D7sfG25ba3MWVjKajj9d/FNAbGftGgRj/S/Z6SAaLcaSWydrZbpi3aR7yxmnFmjt1GN0kk
 MO+ZDGwlgc1J1eikISa4lG+THtymYMx1j5YNGHtxl12ZbvrQyicydkL77dF1L2E9JjHtognZHqJ
 Tr3xOJ+lES0jLPFTRV4+BMpsdey26PVBT65LRGlrcB1qKz3BD7iAFKX1RGsH6iFS88omNoNfwfl
 FArQ0woktqi8FpaW3/2+PK4lnK+gJWHljiRfI4uXM9UsPROjNUNTuENQmjgTbvM8A4gtY0CKnr4
 MsaWqy3ssSbtdAIYFB8FOUdAIouth4yFPOM4GphGEZAFCgrJl/9SklbmZdpRBgDHuwXHiFDFF29
 VtG88iQ79UwLRENaXsVzrIliuxbaHanD5ZQ9Da6hvAYODFNY2ICjoHleG6lUAJzkSJ3p1rmBK5r
 va0Kbe3D+gtgx/Pz2gA==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a50f76e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=hP-s5Dj4EI8GOsY46QcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX1ro0KlfLqUkP
 GSv5qsbiiqqBJ1HhZYhmeeCJjkYVuimoa8eF4NWb+m5Zsw9FuPMmdRuLldSZnAYR7GVZkrbd8CA
 Q25+wQrZSl7ejXdfHIYtOgUpCxYFNY8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67303-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A96C73B60F

On 7/10/2026 4:28 PM, Bryan O'Donoghue wrote:
> On 10/07/2026 13:28, Dmitry Baryshkov wrote:
>>> Quite frankly, I don't consider the existing (meganode) description
>>> any valid, and would vote to rip it the second a replacement is
>>> available. But once, not N times.
>> Rip without providing backwards compatibility?
>>
>> One of the options would be to follow the 'venus/iris' approach: land
>> new set of component drivers, which target new platforms and provide
>> minimal support for one old platform (maybe via autoapplied DT overlay
>> or other similar techniques). Then continue migrating and phasing out
>> camss driver for old platforms, while adding support for new blocks in
>> the new set of drivers and ripping support from the camss driver after
>> some migration time.
> 
> If you want to fund it - I accept BTC, ETH, $, € and upstream bragging 
> rights as valid forms of payment.
> 
> ;)
> 
> ---
> bod
I can give it a try (I've done this before), but I'd appreciate slightly 
friendlier comments. :)

