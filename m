Return-Path: <linux-media+bounces-66978-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ue/dCx5BTmrxJgIAu9opvQ
	(envelope-from <linux-media+bounces-66978-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 14:22:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E330726443
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 14:22:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Uvw/lvtv";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gaUEnlwA;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66978-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66978-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92089309632E
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 12:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F7643DA54;
	Wed,  8 Jul 2026 12:19:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0261243D510
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 12:19:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513153; cv=none; b=ULot1bHgXVepLfEqR7JCdp2ml7BpDzamqRr2it/csmDsYDnnjuEIcJooHUO8gqIqP7rrRI2eHT5BjAfTP0DORGQKcqAlKSBpODnWn0GXSmkUdMFTeqGLop1unXe6CW+0xtdDdAO1GivSXUBUrQBkSdGb3S471c4JJyVn+ewoqTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513153; c=relaxed/simple;
	bh=gPGpInfCJ6WsoYHEKSt3twT3UDTC58WmSefrK7jcPEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/ZfjIyOJLI34nIHuFTAuPVkTrxFEPeFZFSOaWGar4cY/CKAfBPSUUVtirUVnQnTtqPAX4TcOG2oj5ZgGpVEYvboqqAWq2knXn9od8cYrupMWx2eSYu2CY9H8WtFEkt17vVjt9M5toV8TS58HtEAtjVeq57XVTCpxG4PqhEblaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uvw/lvtv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gaUEnlwA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3PYd2579556
	for <linux-media@vger.kernel.org>; Wed, 8 Jul 2026 12:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xYyYDdXJv+fn3EtUAfji3Cg1cIl6VuLBfm4wbAfjhTM=; b=Uvw/lvtv45LRcvCN
	zECuZeMWRuOYeUqqkDaKNBLJRSf83grZmWr8jYCWYSWiuK9bZKffmBxGDc1y/4pR
	1p2H63PXKjpXnx4Ym72/AG8+ugpzLnceYYWhWBqHmWZiSowV8zHaiC/VTNlpWP4i
	LAngysYymtFcRHghxSDPrsZZ5cqJaxsiyyUKg/9zpdT1v0zNAoWOKbESoPhQOU8B
	xDDT1j3zJN9d2E2Lvokqq8JPKuUPOrgDDi/AaM54wH11Ki8wQxlkZgjxbyDfAXeY
	YvWQ2TLtWokIk5Bt0m3yFQ2laLQMPbUAMPT2WezczOjHF+APH5lfyjmPVctgOI32
	+zOGBA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5ganda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 12:19:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21be5bb4so4074121cf.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 05:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783513150; x=1784117950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xYyYDdXJv+fn3EtUAfji3Cg1cIl6VuLBfm4wbAfjhTM=;
        b=gaUEnlwAkUO1DevYYF+y4UAj65fWqr/a7oHahkQwqks9mJecl/Exz/zEYv1R2pgKpv
         UQZbMJUAld63ySqEgl7ue77oLjoEHCFFXjc6tZOiLYbCThYhL2B43PMhh1z7g0osD08i
         II4litcwBtCP02h1GoqO0YUi3YzZRWLuRII9mdPDTT20kc/dWSkNHiWD82s56EcvYzRR
         8pKV9we7QVhDozSfn3MXsnZemNYpfooWTJKv87S3BxqMPfGR/qq0EfyQi++M85tuECLx
         9GxBqqUY6GvoULSVkGpLNJ1ukaR/bLCoJfbdTG9Ygg7dojEf7o2rU67n3YyRJ/AdFz7N
         TfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513150; x=1784117950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xYyYDdXJv+fn3EtUAfji3Cg1cIl6VuLBfm4wbAfjhTM=;
        b=VqwY0gIpuqe8QNkAwP4imeIH7dl09efN99EccS4/HpKAdBY/GnHHCIeAfqJwTyRZb9
         sl7jSG1KhlZaip5f48Wue/WXE5WQ4cL9r2j8T9kcbqjjIWmd4+tCt/q3bhQjtVxkeKk0
         QsiawDIDMW975bSNb+QOY2R+E1m2vnQ8VVzX3pw2sGFJ9RlN8BKdXzSrAhwzInFjiPie
         xvQKgysBymMM28Nn9F4XgNOm848/5oS1QHRJMisFwqxO+otIw6T+94YXPAb+2pH4UGTQ
         UcKuhyTSAr3nEc90Ul1RDjrliEOD6Fkai/DULYKRcgqyZk0GIOXj9O9EynbnV2HK1iqH
         5g2A==
X-Forwarded-Encrypted: i=1; AHgh+RqZmy/qimWdWmvB1eCFrC1p026R5zHMsV5bqpXlDWNunnIGStWpIMoqR6JmbNDnrG6CsrKIIDEfg9KFvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwO3IVU+VIYeQXU+lMOD5R+B2M3rcVz2Kim2rgRjjbc93tMtkiG
	vBqOAoOSXvR/4sJSDIT77IZmdISSdUfp9a6Za3zxvxT9CpXJZ1GjPtVGMN4qHGL/TxN/UJofSKy
	OYnC39QCCODqmGHQYzitbeX9BIxQbFiSV84nL79oZDfGhR4gZnU2nd72e/pHVaRFLbK07QLBSEQ
	==
X-Gm-Gg: AfdE7cly7lNF8AkJfbnxRsgpvP+s2K4SCNLspiVjPTQHHhVKWJbr8Oktz0cyIcccvOd
	UVmo0jsgjZW7KAHCy1NOvpGCqvgbhvngCMrO6MFrWG3C7eYwQOx0U+BCobCnfKDdtkbzRxraTrM
	hudw/Asz77T0CMOsMRY4mbpJ7BqrCtPNuTgVlGMM5SujrtbV7a4sft8MeOOH41rJ1zeUWPZKpmT
	ubjzdAO6tJVzLBq9L1JwiGAlv3cw1isfaO264DUiuIiBa/HrpQYcrorRqgFprdN4M1LebEz7imJ
	uq34x5NA36xJh/YG4yWfDx7YvxM+OpOI/P5FwcgLkwoIk0q38T9yckAtbS2MKndba5Vg6vXWu7F
	wlNKgLu6FWMepL/n4ySKPrfBzf8FDDxGLkbM=
X-Received: by 2002:ac8:5dcb:0:b0:51c:2324:666 with SMTP id d75a77b69052e-51c8b4333b7mr17388391cf.3.1783513150198;
        Wed, 08 Jul 2026 05:19:10 -0700 (PDT)
X-Received: by 2002:ac8:5dcb:0:b0:51c:2324:666 with SMTP id d75a77b69052e-51c8b4333b7mr17388031cf.3.1783513149617;
        Wed, 08 Jul 2026 05:19:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c1470325sm160963866b.14.2026.07.08.05.19.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 05:19:08 -0700 (PDT)
Message-ID: <8fc1ddfd-0f77-4b67-b9bd-33fbd60e2046@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 14:19:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bod@kernel.org>,
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
 <d0768c15-453f-4d3f-8110-886a5c697b02@oss.qualcomm.com>
 <d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyMCBTYWx0ZWRfX2AK7MWwg2V1t
 Zsnk+a/1/FRWeWMR4hZhZP2nYXVlwSrL5TGNAIinw5Bokz+q2xRvTERYwHwvmOHzZ2FJ/c+wLLE
 hs/RYOD/1FwdxSEZUq0LKS7qgJ16B9I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyMCBTYWx0ZWRfXzyvE/U6z4iWv
 OI8HKif6NQmTWPwTmseVXPrJ1QXawI3nUyQCAOha0cT4rjwBjhXEwEHmkjpVYjuPY8mYqWWzPln
 hJTsPa9FB7gitFas9u3d6vI5+1jq6kN3CyDeaZYogppR2hjCPh4QsQY20nZOiVji2gLsoEwcNrm
 Ih1wRqk29Gt1/DJ9SeLqWt88V4iXhGJa3ikU9kL+cKi3NIIVuAyCoHdEeoQSxoxXp0jYIDFcw69
 rBkFiPGj7FLN4nf5G82yxy51HTR/tj/wuZDOY87awcNatmcuQPhE77wLleO1osyZG+IHQVmm48T
 mHIGhpEU5P0XduUqVxa+ch60L2eJ632kgacFobYQMCFQDPR49CL3QOU5XnCvMRlLW4anAbuj2Cq
 Ej+Y8sxlWCDOZyhyqLGX/FNfEMhKymim0qbBctdl1mx2cD3BxNqLorJw4w4KwNQCBkmtY2GCEWo
 l0zCmQTaPKfChInZw2A==
X-Proofpoint-ORIG-GUID: n_6krzdI_g4E6SL4kY1jiALHSGWUNJsf
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e403e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=y1t4v1gd98P_d2K2kl0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: n_6krzdI_g4E6SL4kY1jiALHSGWUNJsf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-66978-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E330726443

On 7/7/26 12:41 PM, Bryan O'Donoghue wrote:
> On 07/07/2026 11:11, Konrad Dybcio wrote:
>> On 7/7/26 12:00 PM, Bryan O'Donoghue wrote:
>>> On 07/07/2026 10:24, Konrad Dybcio wrote:
>>>> On 7/6/26 3:37 PM, Bryan O'Donoghue wrote:
>>>>> On 06/07/2026 14:02, Vladimir Zapolskiy wrote:

[...]

> OK, I can see how this thread is confusing.
> 
> The idea is to start to declare sub-nodes "on the road" to making camss into a bus. The legacy binding we have is really for the IFE domain - that is CSIPHY, CSID, IFE.
> 
> Right now the camss binding describes those things - so linking say OPE or JPEG back to the thing that describes those isn't right.
> 
> OTOH we _want_ to make the top-level binding into a bus, we've discussed that several times.
> 
> To transition from monolith IFE-domain only, to camss-bus, we should have the sub-nodes fully describe themselves as "camss-bus" doesn't exist yet.
> 
> Once we have compat="camss-bus" then fine, make that linkage, I fully support that.
> 
> That roadmap BTW is why I'm asking Antanas and Loic to make JPEG and OPE sub-nodes of camss - but make them complete sub-nodes - power-domains, clocks, nocs, including the TOP_GDSC.

I think this needlessly increases the amount of combinations we'll
have to keep supporting down the line (with a ton of compatibility
boilerplate code)

Konrad

> It means we can work on splitting apart the existing camss node in isolation to make CSID, IFE as peer sub-nodes.
> 
> We definitely shouldn't be making those sub-nodes dependent on compat="camss" but they definitely will be dependent once we finish making compat="camss-bus".
> 
> When that is done I fully agree TOP_GDSC belongs in the bus node, like MDSS.
> 
> I hope that makes sense.

