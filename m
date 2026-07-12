Return-Path: <linux-media+bounces-67404-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WRl1NWSJU2rMbgMAu9opvQ
	(envelope-from <linux-media+bounces-67404-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 14:32:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40126744A78
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 14:32:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=radxa.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67404-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67404-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91ADE302BB8A
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 12:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29F23ACEF4;
	Sun, 12 Jul 2026 12:32:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A373F371860;
	Sun, 12 Jul 2026 12:32:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783859535; cv=none; b=evBJ+FCmY4Z11Zr/6TLakcLGD47H+IQlMBl3A/qpwIZELLID17Ve1CJcehK8ptRodGLnmw9fcR2gCqCDuReCUCAP4yUUG8Q8evymaMekwBwRTLWSBuvg1ObGzsF7WRAk9ipAVUqDbAJ6XAiGiSpA7fmnhgOHbaUrPNsF9CS/jYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783859535; c=relaxed/simple;
	bh=3UEBW838tt3Ism/wYKILco2zPC66IKrRADwcS8w2mW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bNagGKatqegJ29dulHjiGEcBgc3VhTITkqHv4E4fxUFG5ucgQook0xK5IKqG6Zjkp3mtko/ksmi9vmEICMiKptM0CwyYnSl2GWE2LvyVy6n7FCP4AQZV8k3x2YSaYQPSdLAYqsvPXNOJrqdHpt2l0f09dqnka19XxRblS1P7NGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=52.59.177.22
X-QQ-mid: zesmtpip2t1783859495t6c5687e4
X-QQ-Originating-IP: S5JS7u2C81s1KUtxoBHUNrmiFrBBT+I8RRgvri9o4Rk=
Received: from [127.0.0.1] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 12 Jul 2026 20:31:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3583264987114645874
Message-ID: <345F7FA4A9ED01C0+4ece59b4-afa8-4375-917a-4de9f89fa04a@radxa.com>
Date: Sun, 12 Jul 2026 20:31:25 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: Reserve low IOVA range for
 Iris
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Val Packett <val@packett.cool>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Daniel J Blueman <daniel@quora.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Bryan O'Donoghue <bod@kernel.org>
References: <20260601041336.9497-1-daniel@quora.org>
 <ecavEnqJTDXvfFykc9uJb5No7ioighpjrCdw2CFZ4c8Izr5DxpTs-606Bg7K0RtHTaOqksWivHxWQLzMBP6qow==@protonmail.internalid>
 <20260601041336.9497-2-daniel@quora.org>
 <ec7c564e-745a-4998-af9a-e9632fe063f7@kernel.org>
 <CAMVG2ssnyH=KUKrdfnUOtPYU7p17inyzcYWcKhT4EAZxDzDjfg@mail.gmail.com>
 <cb37e7cc-4fb0-4c24-8f89-f6f9eb08a107@oss.qualcomm.com>
 <ff3748ef-cf75-42b3-850c-b8742a814920@packett.cool>
 <519CAAC5BE344EB7+e6d7f90a-e481-468c-a987-dac3c69d7362@radxa.com>
 <zaigjwjpldnsrzsfbyolnlvblteav5esfstoib4m3eusc67a26@jotedakvvo7m>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <zaigjwjpldnsrzsfbyolnlvblteav5esfstoib4m3eusc67a26@jotedakvvo7m>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Nsb+SUszp5Eku/oQs5CDltHlUEt/wMmpGkvv3+vN1HGu4Aa6uUYnLOkv
	p07dnrq2nRWjR+mxRuT2mg8wYZRfp3/PqT9X9E3Dda+yc9wLA2dPwaS5s3A74MJWirjScTW
	l/XElJRTNa1r1ZB7bgkX6xoXEygNc3DMZhNf+GIw37l9JKPGDlnA5qdKzpQrZLaJ6KycS6F
	ZgqgjLEGlUCfd/fhdoBfCHe94VDJ2NUPMQB6fqxjpyEOHwwVGKdTmIzqj6vaMV6EwwVhH/p
	AQr/+Jzy98HdSEEybSoZtUTsGRnZTN0qYxJTW4BwkA91A5qblsw9riF+dDC3t36MVU5xBm7
	YSnlskON2LBxBQtIy+CsSkGMy4UmzIinbblaqdqmWKFdAoSvvIS+0fAPoL5M8SawEdmPa7N
	s2gCnNeHYx4+YtgKyfsWvuzs+EhHBeYyBo4/EwAIiJqYEJuaFVvYcP+lvz6uzvBHHaXsOw1
	J+i6bzwWHAka2uk4H97dk/iioq5UiRDRKWafbsyWDlTeopn3KHPwph/9/oe74pfkvofoB6H
	cSyBXG3BjXRWL1hmOCLv2M6oRZxo8N4UCtoWNi3gyYdDs/BBkZk/0PtW3lDXlRkY8kf0v+H
	HN7LRkWX4tye1hia+kceCJrJL4zIQCL2LgDLQlkln/PSSH236I3VDESVb/JJToPywRr7z+a
	qS+peuMWay9FJ+T/cu9/9fIQQEAgCyAnQToR4egpwqeNZf+NFxOyVDn4fhBJJJPGSVMylFo
	yVujR4AX1ZpeGMGn+HKwKs+beOhcqiYrSolTCaMhNHOTZpt2igomlIf52TIICX3A50q2/3X
	D7+5aWq9ALz6LBeQE2xk9En/aD5YsJ7Mt0K+vSRXhPB64YPMISK7KHtDKzLj8fVdoQ2c+kG
	5q4Mhk6Zi0xReO178M27l0qHv/ljydLdpLCE4aVX//Fz+//O2B5HJNFOJNWjGdmPhk+5mM/
	yX2F4FZSQRNMDK5UeAOn0+yf3zbFDQt+Qh4drgR68m2I11ohtzcpxb0/O5mVPGWqyom98kC
	gQJ1mYZi2xIXtfvgBiGs2smHqBIKaQSj74KsOhnrryfwZNFE1Vps4rhxf7zT4b5WlQAl8Mk
	+1CbeFJOAqjT3jTl2uQ1v70J3K1er9UR1NTKFMFG/o+
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:val@packett.cool,m:vikash.garodia@oss.qualcomm.com,m:daniel@quora.org,m:quic_vgarodia@quicinc.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:bod@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[sophon@radxa.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67404-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-media@vger.kernel.org];
	FORGED_MUA_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,radxa.com:from_mime,radxa.com:email,radxa.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 40126744A78

On 7/12/2026 8:14 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 08, 2026 at 12:17:57PM +0800, Xilin Wu wrote:
>> On 6/8/2026 11:48 AM, Val Packett wrote:
>>>
>>> On 6/4/26 3:38 AM, Vikash Garodia wrote:
>>>>
>>>>
>>>> On 6/2/2026 9:05 PM, Daniel J Blueman wrote:
>>>>> On Tue, 2 Jun 2026 at 18:27, Bryan O'Donoghue <bod@kernel.org> wrote:
>>>>>>
>>>>>> On 01/06/2026 05:13, Daniel J Blueman wrote:
>>>>>>> On X1-family hamoa platforms, Iris DMA below IOVA 0x25800000 (600MB)
>>>>>>> triggers unhandled SMMU page faults
>>>>>>
>>>>>> How do we know that is a correct address - does it come from qcom
>>>>>> documentation or trial and error ?
>>>>>
>>>>> @Vikash, beyond your comment I linked in the patch [1] kindly cite a
>>>>> source for the different stream-ID <600MB behaviour, and share
>>>>> specifics, eg if silicon, firmware, or driver and constraint, defect
>>>>> or otherwise, so I can include a definitive description.
>>>>>
>>>>> Also good to know if my workaround is good for long-term, or on the
>>>>> other hand handling streams <600MB is important/useful.
>>>>>
>>>>
>>>> Thanks Daniel for raising this patch. Did you also try the memory
>>>> fix i mentioned in the bug [1] discussion ?
>>>>
>>>> Coming to 600MB, this have been the VPU hardware restriction all the
>>>> while since venus days, and since address could not go deeper all
>>>> the way lower than 600MB, the issue never popped up earlier.
>>>>
>>>> Consider the memory layout split as below (Iris device range is
>>>> capped to 0xe0000000)
>>>>
>>>> |-----600MB-----|-----(0xe0000000 - 600MB)-----|----IO reg--|
>>>>
>>>> 0-600MB range, VPU hardware would reserve this to generate different
>>>> stream-IDs primarily for internal (non-pixel) buffers.
>>>>
>>>> 0-600 --> VPU would generate *secure* stream ID for non-pixel buffers
>>>> 601 - 0xe0000000 --> VPU would generate non-secure stream ID for
>>>> non- pixel buffers.
>>>>
>>>> When many concurrent sessions were tried, non-pixel buffers were
>>>> mapped into 0-600MB range, and VPU generated secure ID for those.
>>>> Since those were not associated with the iommus configured for iris
>>>> node, it led to USF (un-identified stream fault) and device would
>>>> crash.
>>>
>>> Umm.. is anything *actually* preventing us from adding the "secure" SID
>>> to the iommu node?
>>>
>>> I just saw a patch for sc8280xp that did just add an "extra" SID for iris:
>>>
>>> https://github.com/strongtz/linux-radxa-qcom/commit/
>>> e92850f792498c3a72d72d667503a29bf6bb0a31
>>>
>>> and I'm wondering if that's about the same exact issue.. (Adding sophon@
>>> to Cc: here)
>>>
>>
>> I'm not sure if we're having the same issue. Without adding that SID on
>> sc8280xp (HFI Gen2 FW), it fails to decode anything and crashes instantly.
>>  From the trustzone log inside the crashdump, I can see that the buffer isn't
>> actually in the 0-600MB range.
> 
> Hmm. The decoding is working on Lenovo X13s ([1]). It says 6.18, but it
> was the Iris driver patched to support SM8350 / SC8280XP, which I posted
> some time ago. For the reference, the firmware reports the version to
> be: video-firmware.1.1-b158087140355883dc40b004032856a8feb5d565.
> 
> [1] https://github.com/lumag/fluster-tests/blob/trunk/iris-sc8280xp.md
> 

Yeah, HFI Gen1 FW should work on SC8280XP. But what I'm using is HFI 
Gen2 FW, it reports: 
video-firmware.2.4.2-39cc47c1d64195c749014787e6ab938cc34a4071


-- 
Best regards,
Xilin Wu <sophon@radxa.com>

