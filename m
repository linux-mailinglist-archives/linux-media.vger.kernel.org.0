Return-Path: <linux-media+bounces-67271-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 491iIDnQUGqo5QIAu9opvQ
	(envelope-from <linux-media+bounces-67271-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 12:58:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04317739E75
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 12:58:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=L22NAzx0;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67271-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67271-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAEDB3021E4B
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 10:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50A841226D;
	Fri, 10 Jul 2026 10:52:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CBF410D37;
	Fri, 10 Jul 2026 10:52:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783680724; cv=none; b=c6MWI3iwuiTwWIBAFsMjHK8CmUSjtXYr0d63iZRhMoHKLDS+phbWoB25R6UqaWYCsvf9t8k0roymzWAxuXeKlB34EJgRBBGbl+YarEl6W7+rDy8JZMDL+2gJsNkg5uHUSvPtPHDAxZW3pXM6B1uTeyqUdTgY2PcYTZOsMZ+k5VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783680724; c=relaxed/simple;
	bh=Eh8Jr/bt1zOt2HZr7M1nIEJDT7mOtZL5uRRxBHnXp08=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CiHp7HzCgtgLcb991B66mRvwLR5IGpW7x87oxbqvV803aXKiQNOtzmWAgAhl1QTQ3UUequBvPgdQG92YZraarVIbKwVsqc/9I6mICUIiznXh6JdBQlOrsQd2ADALOCwA9pENBfjWSOj1EvbdWzXYbwmhrtvwZAxLrdz1R9ZW4ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L22NAzx0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1FA51F000E9;
	Fri, 10 Jul 2026 10:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783680722;
	bh=BaH7g5yuPZ2RiR84qm+ckDuciPNtOqn5l+saj85/HzM=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=L22NAzx0fKerAZ8K4VJbMUiT9bJM/fAygqwS/NbAzL+lB4nTb98q4lLfzUMFhyTGr
	 4KC7UXtt+XPDQHusE5JJXmUrqAkiSpTjghelEaoTMvkFprk5lgc+PY+dVl4271OltU
	 0kyY+X6KWUl9PTOcb+8XMLBSlbveJfMFlzJZkGV4G+psc1RPxOoJq2TIVoK/rkzDHg
	 GVgXul98+yXn4EUZtmN0FhDQPW2JP7qg08PFsXJ9Odld72akvsjWQW4IH2S5yryckn
	 mJaG/q7+7lIXISN+bigGlz6v8gP+fiJ5ZyyJ762CgZERnipv/AARB+4MYHKKkx/Ggw
	 WZvduL/35S+Jg==
Message-ID: <66d59de8-7fe8-4e8b-834c-9f0ed51ca5e0@kernel.org>
Date: Fri, 10 Jul 2026 11:51:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: Reserve low IOVA range for
 Iris
From: Bryan O'Donoghue <bod@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Daniel J Blueman <daniel@quora.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260601041336.9497-1-daniel@quora.org>
 <ecavEnqJTDXvfFykc9uJb5No7ioighpjrCdw2CFZ4c8Izr5DxpTs-606Bg7K0RtHTaOqksWivHxWQLzMBP6qow==@protonmail.internalid>
 <20260601041336.9497-2-daniel@quora.org>
 <ec7c564e-745a-4998-af9a-e9632fe063f7@kernel.org>
 <CAMVG2ssnyH=KUKrdfnUOtPYU7p17inyzcYWcKhT4EAZxDzDjfg@mail.gmail.com>
 <h8UvMzNq5TseF22NyjmyrC5yZkO_5JsVGMVaIdLfdpMyfxxemlp0xulRAiylGHWdrq5D4NM1oUk9Jzyhj_UAsw==@protonmail.internalid>
 <cb37e7cc-4fb0-4c24-8f89-f6f9eb08a107@oss.qualcomm.com>
 <ccf4d126-c523-4ae4-8b17-a4cafab79b33@kernel.org>
Content-Language: en-US
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <ccf4d126-c523-4ae4-8b17-a4cafab79b33@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67271-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:daniel@quora.org,m:quic_vgarodia@quicinc.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04317739E75

On 09/06/2026 14:01, Bryan O'Donoghue wrote:
> On 04/06/2026 07:38, Vikash Garodia wrote:
>>
>>
>> On 6/2/2026 9:05 PM, Daniel J Blueman wrote:
>>> On Tue, 2 Jun 2026 at 18:27, Bryan O'Donoghue <bod@kernel.org> wrote:
>>>>
>>>> On 01/06/2026 05:13, Daniel J Blueman wrote:
>>>>> On X1-family hamoa platforms, Iris DMA below IOVA 0x25800000 (600MB)
>>>>> triggers unhandled SMMU page faults
>>>>
>>>> How do we know that is a correct address - does it come from qcom
>>>> documentation or trial and error ?
>>>
>>> @Vikash, beyond your comment I linked in the patch [1] kindly cite a
>>> source for the different stream-ID <600MB behaviour, and share
>>> specifics, eg if silicon, firmware, or driver and constraint, defect
>>> or otherwise, so I can include a definitive description.
>>>
>>> Also good to know if my workaround is good for long-term, or on the
>>> other hand handling streams <600MB is important/useful.
>>>
>>
>> Thanks Daniel for raising this patch. Did you also try the memory fix i
>> mentioned in the bug [1] discussion ?
>>
>> Coming to 600MB, this have been the VPU hardware restriction all the
>> while since venus days, and since address could not go deeper all the
>> way lower than 600MB, the issue never popped up earlier.
>>
>> Consider the memory layout split as below (Iris device range is capped
>> to 0xe0000000)
>>
>> |-----600MB-----|-----(0xe0000000 - 600MB)-----|----IO reg--|
>>
>> 0-600MB range, VPU hardware would reserve this to generate different
>> stream-IDs primarily for internal (non-pixel) buffers.
>>
>> 0-600 --> VPU would generate *secure* stream ID for non-pixel buffers
>> 601 - 0xe0000000 --> VPU would generate non-secure stream ID for
>> non-pixel buffers.
>>
>> When many concurrent sessions were tried, non-pixel buffers were mapped
>> into 0-600MB range, and VPU generated secure ID for those. Since those
>> were not associated with the iommus configured for iris node, it led to
>> USF (un-identified stream fault) and device would crash.
>>
>> Keeping the region reserved, makes the non-pixel buffer always in the
>> non secure range (601-..) and avoids the crash.
>>
>> Downside of this design - It would eventually reserve 0-600MB un-map
>> 'able for all buffer types, like pixel as well which do not have any
>> such restriction.
>>
>> Forward looking design - create devices dynamically and set reserve
>> regions for those specific device using the api [1], instead of applying
>> one reserve for all.
>>
>> [1]
>> https://lore.kernel.org/all/20260119054936.3350128-1- 
>> busanna.reddy@oss.qualcomm.com/
> The problem here is in the reponse to the email you linked:
> 
> https://lore.kernel.org/all/cfd23f75-8952-4463-abd5-815b995031b0@arm.com/
> 
> - Inheriting the parent's properties is wrong
> - We should just have a bus
> 
> But that leads us to churning DT and we'd have to figure out how/why to 
> do it purely for the purpose of differentiating SIDs within Iris. There 
> is no separate hardware - its one VPU which needs to figure out its IOVA 
> for different SIDs.
> 
> Krzysztof would rightly say no - again - to putting collateral into DT 
> to differentiate pixel streams based on SID, because that's not a 
> hardware property.
> 
> - You have pixel and non-pixel SIDs that have to hit Linux
> - You have to keep non-pixel allocations >= 600 MB
> - You can allow pixel < 600mb =>
>    Daniel's patch is too restrictive
> 
> But what we can do is add information to the iris platform descriptors 
> to enumerate what are the valid IOVA ranges for pixel and non-pixel data 
> and then change the allocation code to operate from those platform-code 
> described IOVAs.
> 
> No new iommu properties, not arguing about plonking SID/pixel-path data 
> into DT.
> 
> Just teach the driver what the valid ranges are and allocate IOVAs based 
> on those ranges.
> 
> I think Daniel's patch should be taken as it fixes a real bug for users 
> right now but, I equally think its a NAK for any new SoC.
> 
> This IOVA allocation needs to be tackled correctly and IMO that needs to 
> be and should be done via platform descriptors for valid ranges of IOVA.
> 
> No mad stuff about SIDs in DT, no lengthy arguments about adding strange 
> iommu properties.
> 
> ---
> bod

Please pause merging this patch until this thread bottoms out

https://lore.kernel.org/all/20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com

---
bod

