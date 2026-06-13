Return-Path: <linux-media+bounces-64761-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1MOcMwY8LWrIeAQAu9opvQ
	(envelope-from <linux-media+bounces-64761-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 13:16:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3D867E700
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 13:16:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=c0r3M2Jo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RbmjSA9S;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64761-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64761-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0E453076F00
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 11:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F49A3DD873;
	Sat, 13 Jun 2026 11:16:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B283835E950
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 11:16:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781349369; cv=none; b=kZ/WOBoJDSkSyoDHt/HMheyeDU4z7B2COG3bDAKBudylzhFow54EIPAq/PrNmcTm0sZir3ZWAQXM3J5L9WeIYHbOOvgh2xSYcos3F8nKCWmdno28YzhxpWqZqttf65I9TX9OJCaaBmX//zXthj7MgrdMAxRpzzG4cmVZzG6M4fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781349369; c=relaxed/simple;
	bh=YoKsP5jyQNp2ZucctxAXbiSQWgYelgFgXvNPt7Y3Qn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aFgmfLGY89yGkQhOtCxebYWsV893KxemB7UCXdxpFtu8JIDqk9ayDjQVbZXnuTw7V5qhCXXi9Hopp29qqj1p9gUw3XYEel5onVHxUhavITYAsQJ2dWgv1EbX/vmYwIUu5mn/X4JU9i73FgkNS6NOB6m9CA6suO1XFU7d7dh3uP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c0r3M2Jo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RbmjSA9S; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DAxPTs2715534
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 11:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5OmjQdfNxH9BcCMT+yXKYbW4+8NRoGCiNzl/yysDUKI=; b=c0r3M2Jo8P6Jb2YP
	Gwe926apPB70ZPiTFw/XNm72qXx3dGhZTK8SuobIPhYrVEOWY0Ceeeb7VznX906R
	DRgkN5HJWKSaSfHYVBePnVUBissJSdIzMsA0TqUwP4NUQ9ztbtahYRSz9saznkDR
	+4S8eiefw0bjFv6YDAgmq+1tleiOeLcPbkHIFFdHsDZ+GTUFfx4+tXFIN4XwqVCF
	0C0M0AtVM7ixUZmjOrLIcn5snP5KVkjrNlYrMf/Q8KHve2VkOhqUvVSeB4HzPZGg
	N3G6DkM8NZC2h4Nt6d/ZeiGTT4UZTwc2l6Ea3Rctu4lruaVZRkaj2KzPTi0/uo8D
	+mqcuQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7u0ux9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 11:16:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9159bc52211so56506085a.2
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 04:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781349366; x=1781954166; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5OmjQdfNxH9BcCMT+yXKYbW4+8NRoGCiNzl/yysDUKI=;
        b=RbmjSA9SSjzRQ6eL0+yG35CCBk8LQ6bcN6/t1TxBbMDWJu8JrK1axXxaytO9vL4ctO
         PtxCjq8u4xCqhr4C/81TGA9VC0j+v44SsauhNuPDfWi/u0FFlx3UiuKmKfCL7zOfs2gI
         cMnU8FtuBhMCz6TGbLaP6QroqPOC57/+R3i/+HBN8UY+ygLhhcK7Ey7YI03WqtAQuKqG
         PKNhijiTLxNnmvPGlwlTNHC6IbWSQneQf0vrXqTpLEY3na7lvjhP0uz23lzB9MWHp7JZ
         KQHOnRO2e+RapUX0lto/VYhdixAx1wc1oVX0UpHjcynMcTEj7egLvHOcHHHhpjh3YqzT
         5z4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781349366; x=1781954166;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OmjQdfNxH9BcCMT+yXKYbW4+8NRoGCiNzl/yysDUKI=;
        b=ngLT+HMplmxmJQty9JvI6XVdLsUy/OoRZl1mzZL+EeBcayHDwRtLolUlUS6OauWEmG
         LzZpQCdd/4ZBkyUO8XplXgzCaQax11SwxMB9Ht8XM2VQC+3Dn7P5G2cSZAXjmIVHjPwz
         XB7+FOogy66Z5KhoDILwwUHuF2hPdEW5MHDVZTxq4XsUdo5aMhC1FgJqdvFatm+aCytI
         GNT4e4B3o2D+a4i5Hs0ar8H3bZFJXDvPbfI9IJux6MYYfxmeysxHOcgV1EwKbDAle8vu
         fsWzU4ky0gmF4E4nXMwYMLbwdqnZKESAvGLH7CEsPNfU+x/6lh1f4NE4rwCONyGFVA+9
         Psmw==
X-Forwarded-Encrypted: i=1; AFNElJ89HfEqScVbwshOwr+FatZyewp2DUL9dUex4cSmFKQwEoAJL41UShwebd8g7At2H5v2ADJN9klBCWD0nA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO7xcRmQY2cK0wgKz/sCekK//MXDSLbWGckR4KyDmBBO0TRiPw
	q1gEbnAiGIRDO1yRv+8f4Sx7GwWwaOMJpWDCHd/HLexdHBy5HiXQO6EjdZl101MiHK3CLKhxRff
	bUkeVRXCn2Jd3dRHkL7CcjBpyG0Lec9y4BqYJFo+LiztFe8LovkPriD9KefruZTQtxg==
X-Gm-Gg: Acq92OEmdq0zmxggnhIFEiHDRsHuxtTLn7v745wW6zxd+Uo14704Qki5EPy+NayO9DJ
	qYKdZyK2LwWrSfEouD9Al9H8PL7ZQxTbmLfWtQaDa5icVqJnAfyfcUkeyh+I9beRK661xV4l+CM
	vgWo68ScOik5DiEvDn13+rTMcGB8iLb03ICxj79ZPfnO0YRQktPUFiT3cVgpw0WcHj6L4pp16wq
	H03G6d4HrFSoFeUbY6b3RBdUonorLflbXyr1d3OeXmjlNEmnzCw4p84YzUXYYD73xsFlrr3YqE1
	mSiTLvXEX4rcquF6GSIPt1qYtM4MwBzTKMSUtDykZl2dgkhqSlbwxRqbylQhcrttXBTl3Pvmt/I
	Z0SMN6dK4Tfit/vvfCOSI8/62yyweYSRZ5g7aw2sSBZwNwVn4I28kHA==
X-Received: by 2002:a05:620a:f01:b0:915:29cd:306f with SMTP id af79cd13be357-917f1c55af3mr560612585a.55.1781349365796;
        Sat, 13 Jun 2026 04:16:05 -0700 (PDT)
X-Received: by 2002:a05:620a:f01:b0:915:29cd:306f with SMTP id af79cd13be357-917f1c55af3mr560606585a.55.1781349365239;
        Sat, 13 Jun 2026 04:16:05 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb44208f8sm214433666b.10.2026.06.13.04.16.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 04:16:04 -0700 (PDT)
Message-ID: <9fab1877-976b-4495-86de-a8c853b9ba24@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 14:16:02 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: sm8550: Add JPEG encoder node
To: Bryan O'Donoghue <bod@kernel.org>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
 <n0iPW9ltP_HyfKgagM8MIvaGg_NF7KvUV834b6MPuE3llz9v6B1jdn6wEvXMkIHS_zLRsjnb7pXY3dURUOSs9g==@protonmail.internalid>
 <20260612194417.1737009-3-atanas.filipov@oss.qualcomm.com>
 <8d230cca-2023-4a13-876f-d5db8eb200a1@kernel.org>
 <Y69RNi5x51R9xs6wvf1lRTwKww7gu_-s3WDlGvLpDuZ4YEhg4lrXnuwn4V2p9bSGUQRM5x-vVsDTNt29kOst3w==@protonmail.internalid>
 <3d4e0147-8e62-4872-b881-1452f5e09e85@oss.qualcomm.com>
 <f754c28c-2d0f-4e10-b542-37eca70b091e@kernel.org>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <f754c28c-2d0f-4e10-b542-37eca70b091e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=F8BnsKhN c=1 sm=1 tr=0 ts=6a2d3bf6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=CIwv6HcgfBTlmMJXo-UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 7dJ3ZBx7F1VqTjT9sos4ns7Y2Ejdw-Em
X-Proofpoint-ORIG-GUID: 7dJ3ZBx7F1VqTjT9sos4ns7Y2Ejdw-Em
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDExNCBTYWx0ZWRfXwQ/VUWG1n6Ok
 wLeRunMHO1lEQZcXFuXligtsIpXJEcAUK+qYFZrOoHQCzkRXqnN1yd2xS0zzIjOJS/C9/4F+URk
 Okn04nam6iNYtgcN1stdeHElhmx6mHMYkI2e+/ZLFuQTUve1YkxJMe8PHcoTHXjVDFpwtYCrR0m
 JJnr4XC2kwaCtphjMRGbMcI8kmYRQ3C/s8ECcnpzUqwKF4lm8ds9kQNf0aFVgRVvRPJD4TceuRy
 L3xh3WkWc3p7ByFcTFjDl3ysWEmS6K/5h3NIPmVU26WscFmnnHYiy5yR9GvkuFM7Izm3iNwAPgA
 wtwVf0lomZSDdf0CvKFzwX89GMTVvdd5BtRrK6cCoJLzW6mAJbm4anpZ84YNLUFWJSJ+zvMtDET
 MRfZjFuo1Q7QFGo2/4QcC7UrBz2kkabKkjN9Z8d0oUouAiKHPZmSPb21hbtaEzSs/Un0pdo+JSt
 2OnvJQYfHuhhtqezq8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDExNCBTYWx0ZWRfXyhlpqWbJ2aqV
 UwILb5xtZVHBH61OrhzVytXVR04hhGd0dqn4mHcAU+bCst6yBYY30IevhR1dDnrkp39suFvChWg
 csvHUqNbL8FBt8PsgmNfbAavHlX5yT0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64761-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D3D867E700

Thank you for the detailed explanation. Let me share my understanding of 
the shared upper-level blocks. They are exactly the reason we have 
frameworks like ICC with aggregate bandwidth voting, reference counting 
in the clock framework, and so on — the same applies to power domains. I 
do not think using shared resources is a problem when the drivers are 
correctly designed.

We have actually validated this: we got CAMSS working alongside the 
Qualcomm downstream camera stack after fixing the shared resource 
management — something everyone considered nearly impossible at the time.

On the CAMNOC and CPAS concern: if that coordination becomes necessary, 
the right fix is to address the resource management in both drivers 
independently, using the aggregate capabilities of the existing 
frameworks — not to introduce a
hierarchical dependency between them. Moving JPEG under CAMSS does not 
solve the CAMNOC, clock and power domain coordination problems, it just 
papers over them.

IMO the problem you are pointing at is more general than just CAMNOC — I 
would add priorities, QoS and other shared resources to the list as 
well. The answer to all of them is the same: correct use of the existing 
frameworks, not driver
merging.

On the idea of putting JPEG inside CAMSS with an external API: CAMSS has 
no engine or pipeline that produces YUV output, which is what the JPEG 
encoder needs as input. If JPEG moves into CAMSS without an external 
API, it becomes
inaccessible to userspace. If it does expose one, we end up with a 
standalone interface anyway, just with an extra layer of indirection on top.

afilipov

On 6/13/2026 12:52 PM, Bryan O'Donoghue wrote:
> On 13/06/2026 10:24, Atanas Filipov wrote:
>> Thank you for the feedback. I understand the reasoning, but I
>> respectfully disagree with this approach for the following reasons.
>>
>> While it is true that the JPEG encoder shares the same camera NOC and
>> power domain infrastructure as CAMSS, that is a hardware topology detail
>> — not a sufficient justification for imposing a software dependency. The
>> driver is a fully
>> self-contained V4L2 mem2mem encoder, implemented like every other JPEG
>> encoder driver currently in the kernel (imx-jpeg, s5p-jpeg, mtk-jpeg,
>> nxp-jpeg). None of those are sub-nodes of a parent ISP or camera
>> subsystem driver.
> 
> That's a backwards understanding of the ethos of DT, which is to 
> describe hardware architecture, to describe hardware, not to subscribe 
> to or proscribe a particular software architecture.
> 
> Those jpeg blocks are standalone, whereas the CAMSS jpeg encoder lives 
> inside of the CAMSS power-island.
>> Making the JPEG encoder a sub-node of camss would introduce an
>> unnecessary and artificial coupling: the JPEG encoder cannot be probed,
>> built, or used independently of the CAMSS driver, even on platforms
>> where CAMSS is disabled. This directly contradicts the kernel's
>> principle of independent, single-purpose drivers.
> 
> - Probed true
> - Built true
> - Used untrue
> 
> Once probed your current driver can chug along pretty much unperturbed, 
> however I don't believe that statement can hold true as more of the 
> camera hardware gets enabled.
>> The shared hardware resources (clocks, interconnects, IOMMU stream IDs,
>> power domain) are already fully described in the device tree node and
>> handled by the standard kernel frameworks — there is no functional
>> reason to nest the node under camss.
> 
> Except that it is a real description of the hardware. "We can model it 
> separately != we have modeled it correctly".
> 
> And at least one thing you are leaving out here is the cam noc - which 
> eventually we will have to start to enable and will almost certainly 
> have to be controlled by the core driver which also owns the power- 
> collapse and muxes, the thing that will also program CPAs - the core 
> CAMSS driver.
> 
> Perhaps we choose to model that NOC as a separate driver or perhaps we 
> expose an API in CAMSS to vote, either way its an intrinsic part of the 
> voltage and clocks in this block.
> 
> Either way sure we could model it as a fully separate node but, that is 
> not really how/where the block lives. It lives inside of a defined CAMSS 
> block, which is its own power-island.
> 
> Switching on the JPEG part of it by inference switches on the top-level 
> of the island so, its not separate at all.
>> For these reasons I would prefer to keep the JPEG encoder as a
>> standalone platform device with its own DT node, consistent with how all
>> comparable JPEG encoder drivers are structured in the kernel today.
>>
>> afilipov
>>
>> On 6/13/2026 2:14 AM, Bryan O'Donoghue wrote:
>>> On 12/06/2026 20:44, Atanas Filipov wrote:
>>>> +        qcom_jpeg_enc: jpeg-encoder@ac4e000 {
>>>
>>> One key bit of review feedback I gave in the previous leaked version of
>>> this driver is that since the jpeg-encoder is part of the CAMSS block it
>>> should be a sub-node of camss as OPE, CSIPHY and other blocks will be.
>>>
>>> Please take that feedback onboard in your v2.
>>>
>>> ---
>>> bod
>>
>>
> 
> And please no top posting !
> 
> ---
> bod
> 


