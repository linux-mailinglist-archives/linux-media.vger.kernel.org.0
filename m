Return-Path: <linux-media+bounces-65294-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G2ZPN99UNWrvtAYAu9opvQ
	(envelope-from <linux-media+bounces-65294-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 16:40:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEF06A6764
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 16:40:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V9hjm0+N;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AeUiTn4i;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65294-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65294-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C935A303CE3C
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 14:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E5A28980F;
	Fri, 19 Jun 2026 14:38:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA86D275AF5
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 14:38:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781879929; cv=none; b=nsj4qt4TxiOY6Sj3bOGvxIqJGq/Zi766Gr3gMSTD7UZK4S/2X3K+4JBzycTEkSzUv7w73ns9qAipLCF2j6EXgHWsbyERAfsg87Llor4DT2FpRSn0NVctmkYW+MV38Jva2s5VDhPXDQmpavGv0adINoafo2gNV3NmzEwohk+7G1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781879929; c=relaxed/simple;
	bh=7WNkuLU2jAqmKjI9Dp9aEobZPigX424u//KaDG2RG0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AsZ9i44BfO7MEOLCF5DjxZmKJE3jooyXhLOXzpLPdZYn7lA/TMzf3gbWdQHbnbXnSqvBYab5yr8h9uH+AD1sHYMqQ8WO58vkujMLgFiBnHZzLrmjuzMgzPtz/YAVyhDXiXT2KwlEAwBAf4DuYZE2qV7IPTrHDlD0303V3H65Y9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V9hjm0+N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AeUiTn4i; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JDC0Vm556566
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 14:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FE0PbmaaIwD3McTQ/ANcym99Ski3EPUCXszv8MIpDmQ=; b=V9hjm0+N784VlmU2
	Bzu28+2dDrzslJsaIB2tgkDZcUVhAcOdegsJuyir1JI+9oyAvD1fk3DA5eOC05Kf
	9XjKiDS4MCICv967gBJ58jt8OFxA05wVXAsQNymjs5RCkt6pKTgz4EWwjJfZcUR/
	XVBJdGHDvsVUY6wSipqBEFJjTKA/rjKh0HKVMPnb5sN+DQU7UlLcldxc6mx5OIYm
	uvA89xYT2P40JbKaxvbKw3Av8CR6FVXSPzRITwKNaWb0ZKL6RZ0jSMw+UcKCA3tH
	3hO3+dlhpW0jP//ZfTxPDadsG0g8AdAo0aDRVHFdyBpW0/lNZxmCQ2O3YZMeRUMW
	yAkXfQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evpyuua6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 14:38:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517647fbff1so5630921cf.2
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 07:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781879926; x=1782484726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FE0PbmaaIwD3McTQ/ANcym99Ski3EPUCXszv8MIpDmQ=;
        b=AeUiTn4ilKSveHOfy3rIX5w4pUKDWyOC6FudChxFMmsSRYaO6sO185dcUJWj8yegef
         UmLhSx7UfaSmG6NV0ZA2POVbGx8E0YahH1s2PSXlT++7bN5D2CJOdig6iaQP+DioWApA
         NXtcWYcGlZRwZuMkc9sgSDbm3hD5SjWlj/rPYvBn8IRU3bmUBvxDIuGLqRb0ZWOW+TBh
         UyrZs46GenuOwa53Sb0cBcg249ZTgnX2Yk8R3SA7HZW2vrKX6z1RSlLI2PjSqGnV6DIB
         +IV8f87eK+zy5nE+ZI1c2/F29mVmotV/Rg/4u6XfVztPUr2PE8KQ4rlsp3iMiFYbG+p5
         tEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781879926; x=1782484726;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FE0PbmaaIwD3McTQ/ANcym99Ski3EPUCXszv8MIpDmQ=;
        b=AFbDk3mZefJ/VVDO8OsBIjIV/ev6mEHYxppetHrla7E2czkpzjR5siSh/DumYbMaRl
         oMYs/cItTvxuoscHQz+4wY797B0mfILrtlsfSNdQhqufTP6uESvH7GgxZ2wvejyxEzzE
         3bOXS9BM1JzO5E3ZWfNBJm2AMGkWJpnbKscFQfvidivsILwlue522ksJi5S0x/vX0CET
         CdXpGaW1ai/RQsqzBoV8LBJucaUyWGSbtKnqmyERq7nTqKt7bgyVu+uGkaBlYJpi1rd6
         s5S2DcqC1bdwe4eVjDa5Z9m6a80zhFicDBiiRqHncSSjnP2BH7/GJ6rh8OPIgitG6Kwl
         f9VA==
X-Forwarded-Encrypted: i=1; AFNElJ9n3XFo2h+gs9ICAwZgD4sXh1/ZMogV/V/xb9xh5jPmUBN9/LAg1imMNjYh9aLmCGFrhSASBi+qFbZ7Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6h2iA8dt0LzhYZAbn+6a8800MmNjeSQHVfNg833seH1XRFDg5
	/8t6z1jPiAgQgz1Y4v1HGICRn6BHWuOVzAxe7npASpidu7u6cDHXcqw9kRxeGYJJHl24Hsu3gIw
	ecNY0pE2p1pHqrW5a5DqabKFESlXdgqGYGMDu/jK+X5T+hm0ZFOq4fefKr3Owk/nirg==
X-Gm-Gg: AfdE7cmxTrsQlaJnOc8SwY/GPGrfKxTgAvvBO5tPuApeIGcpgOjbDGU5ePeStDtTl/2
	ejw03rEiTAIRo+xpAALXrFDm5BwhnE9hVM3dwx6OkMTXoazaglAIHJ4jUVZtBoERyp6E7/rDyHN
	UbV7jbi70FqErZpXQZVWGHrvXBVeVqTEj4g6cKmP5cr+AMhK43vqXUukfflmZDD8+CgK4Sz2okA
	NAsFUWsKHIiXq6/r2DJIwC+O/x3mKt/lDT1AVlgKKnpnppT+ZfEbpFHV8HEL8Y3JgN41noOlkA4
	PnB71oc2L//Ow3U7wkvQ9t7xE/jiM6D20pyEHQ12O9VjCvoVywcc6uQ7QSqxJVHM3yzikLgoYPB
	xzc6xcOeY/ZiHMz2Z6JjPrYsaR60pI6cGsCw=
X-Received: by 2002:ac8:5f11:0:b0:517:6d82:9d7b with SMTP id d75a77b69052e-519e4c06f53mr34688731cf.4.1781879925876;
        Fri, 19 Jun 2026 07:38:45 -0700 (PDT)
X-Received: by 2002:ac8:5f11:0:b0:517:6d82:9d7b with SMTP id d75a77b69052e-519e4c06f53mr34688221cf.4.1781879925265;
        Fri, 19 Jun 2026 07:38:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a9aa27319sm89814766b.59.2026.06.19.07.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 07:38:44 -0700 (PDT)
Message-ID: <c0017e02-ff6d-42bc-b02b-d51eec65736a@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 16:38:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: sm8550: Add JPEG encoder node
To: Bryan O'Donoghue <bod@kernel.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org
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
 <ehUvd-M9IX-H_rtmYz4jHzPTzKqm9thaBhx9C145BsCT6P_YaSRD1L2jC_B2EWH_2m4WZ_Zoms_7Yx106I6kMg==@protonmail.internalid>
 <9fab1877-976b-4495-86de-a8c853b9ba24@oss.qualcomm.com>
 <f862ff70-c42d-4be5-a7aa-3d0470106aef@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f862ff70-c42d-4be5-a7aa-3d0470106aef@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDEzOSBTYWx0ZWRfX5SDzk3lddef0
 +8yGdtzAxF3wlwlQb+XrJPTHHSaSScPnRxQ1Rqy3fH9Ac/tsWKet67+B38fJzyrX1rxlGswqRHF
 94T+D8zGV7ShrIxwtdaeFJbNuBAwJGs=
X-Proofpoint-GUID: UphXYKDeCyvGSl1fiFyIwZN8z0cowU9e
X-Proofpoint-ORIG-GUID: UphXYKDeCyvGSl1fiFyIwZN8z0cowU9e
X-Authority-Analysis: v=2.4 cv=cY3iaHDM c=1 sm=1 tr=0 ts=6a355476 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=5YxtafxWi65fj7d2G88A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDEzOSBTYWx0ZWRfX1rSgw2/A3s34
 ckvVL+2XWJngx8f61pOPmaEmGIgsaO24mhOe0/1Dd3Ps4RzTvIa+Sawnu9MiIYPGFgxKQHy4l90
 zsnYpkaV5odzjQurrFik9xLxxGbNJIOlgKKAvb7vdv7zYfddDwY7XTkuHVrLF72fj3as0uQ8WNq
 8T/0qdvhcrfOx2wg3BB6i2fovcXhWMMuNLCb1fmEzjNOup470kttOCCxnL+X/vCXJJc/DBBN7kv
 sDVVaSeyqbD4gWY/nwZmH2UFpHuwmzstmRQVfl6+DuDt+3R2jqAdRvT8MthWvHNMdg+9MBTvKqI
 wVmOIdnR+j2D2hNqGA8nxilnOEkF78jDCLoGTLB1C50ThLI9HA59oZ4co5BA7ffuGFhR5aRiA/Y
 CusSQZlrZo7iL7dMUUGoG7wnMCk3uvewLFwE4Uk67ju6BJbeW8jTzxQLt/zJ9C2dk4lRIwikKwj
 cYu3gtyAAvPpk6dbEOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65294-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3DEF06A6764

On 6/14/26 3:13 AM, Bryan O'Donoghue wrote:
> On 13/06/2026 12:16, Atanas Filipov wrote:
>> Thank you for the detailed explanation. Let me share my understanding of
>> the shared upper-level blocks. They are exactly the reason we have
>> frameworks like ICC with aggregate bandwidth voting, reference counting
>> in the clock framework, and so on — the same applies to power domains. I
>> do not think using shared resources is a problem when the drivers are
>> correctly designed.
>>
>> We have actually validated this: we got CAMSS working alongside the
>> Qualcomm downstream camera stack after fixing the shared resource
>> management — something everyone considered nearly impossible at the time.
>>
>> On the CAMNOC and CPAS concern: if that coordination becomes necessary,
>> the right fix is to address the resource management in both drivers
>> independently, using the aggregate capabilities of the existing
>> frameworks — not to introduce a
>> hierarchical dependency between them. Moving JPEG under CAMSS does not
>> solve the CAMNOC, clock and power domain coordination problems, it just
>> papers over them.
>>
>> IMO the problem you are pointing at is more general than just CAMNOC — I
>> would add priorities, QoS and other shared resources to the list as
>> well. The answer to all of them is the same: correct use of the existing
>> frameworks, not driver
>> merging.
>>
>> On the idea of putting JPEG inside CAMSS with an external API: 
> 
> I haven't remotely suggested that.
> 
>> no engine or pipeline that produces YUV output, which is what the JPEG
>> encoder needs as input. If JPEG moves into CAMSS without an external
>> API, it becomes
>> inaccessible to userspace. If it does expose one, we end up with a
>> standalone interface anyway, just with an extra layer of indirection on top.
> 
> This is a very long winded way of saying no without acknowledging the core point that the DT should scribe the hardware the way it really is, as opposed to following software architecture preference.
> 
> It is the case JPEG lives inside of CAMSS. This is a fact of the hardware, the DT should express those facts not software preferences.

That's also precisely what the "Tree" part is about - CAMSS is essentially
a bus (as evidenced by the existence of a set of resources, like the
AHB/CPAS clocks, the TITAN_TOP GDSC and the interconnect paths that gate
access to everything on it), just like MDSS essentially is a bus. The JPEG
encoder, just like all the other blocks are then devices on that bus,
logically belonging to the CAMSS node

Konrad

