Return-Path: <linux-media+bounces-64759-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BlyhL78oLWrbdAQAu9opvQ
	(envelope-from <linux-media+bounces-64759-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 11:54:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2169367E4CD
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 11:54:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LnQwnb0a;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64759-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64759-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCC7730CF8EC
	for <lists+linux-media@lfdr.de>; Sat, 13 Jun 2026 09:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0C23BB105;
	Sat, 13 Jun 2026 09:53:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE29390C88;
	Sat, 13 Jun 2026 09:53:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781344393; cv=none; b=O5Sg2BeApL/4NnXJ1Nf235bJGZFf1Ueo/LwlKkOB6vSwVzPQ89+z7U3OxATuYiVd39lkQwJPK7VL10mNs8mWwo+uvTobDCoyAvmSYdZf4tRQeNmpsuec3ITeOJCADALAMHyYEXEKJfGRqDhp2V5BJQaUYGo1oUT3E9ZC8exWmvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781344393; c=relaxed/simple;
	bh=FdeH2MdOYHfXN4FPyPUpuRC7JVN0qQaRNbHyYfZEOdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tyBooyeIWfHW66qh7jkzJSYCKuOu1+RnGxt3+TjZUWBdIhSOCxxfGJ3G2VsLCbnoD7A7xvVdqJ+sWfbm8X/76Bww2W/mBWAR2FlLF1jwQB8viajT4BrasnruL3kc1Rrj2TLLNwhYHY7skoaTSaWtFbyNl/RP6VU2I6OMkwziDFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LnQwnb0a; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E374A1F000E9;
	Sat, 13 Jun 2026 09:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781344392;
	bh=tjrHX5yuNUw2Ci6XX3BRH2xRtYbM4crPWBVLs2u9i2o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LnQwnb0aXXHQ7BM8Ho+HsjO2+1iG+4wws8PClkz18qwZqNoJh8ahsC6VM+M1PAc8+
	 6K1YXcvtDGqNRQjP+9pyN5IIlSrk62bSg+bewn5n7izaLaP9/3CfPCXuE3Duxp+TMP
	 8ekgFIDOLWFm+DF60APGTl+O1bOsOrb6yG/05wgnnNf2gbHPrLPvVe19E9Fb8Km8nb
	 FaaUwWwCc+Tw647fADjvHoU4D73LcvDBnn5mD5A1E/0h8znmaBFjGH8MCDgL8NwQ1t
	 BF63N1p3SHtU5bt/hm0VUK15vJ5Tw2ory6posUUGZNculBt3Jfeyu4grSD2K+2uTc3
	 8n7VSoN+MafKQ==
Message-ID: <f754c28c-2d0f-4e10-b542-37eca70b091e@kernel.org>
Date: Sat, 13 Jun 2026 10:52:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: sm8550: Add JPEG encoder node
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
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
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
Autocrypt: addr=bod@kernel.org; keydata=
 xsFNBGRJNSgBEADD7Vm2ZFa+v+JGJ2QYTJqQAkqis/uOHkhdFNXqpBarVBd47QU/DMNU5Rxg
 jedMQEmHoeDbJ6UOpjbrUQ63c5sgG1JbroHJJctwsEI75OOlekMuebEbjIJBLfgENGwPBMHv
 piv5TgCWr0VgYaXfp2eh2LINFywzqj823HiDPibQAXDrjzvF1ogksi/6cQZs8d4if8YQkLOr
 YISFouG+eR0nN1I7mUfIddXOWu6lJeTyqbWVurv58k2ekIXKaOC9ixLHFbcfYV0hOgRaTwQC
 B8CYF9nfqZla19iItfsN9QxN+ZdQjcRoYipp6HPCMfJlKH7GfaFcW93LKc4DKJ2lVL+pg/OQ
 lythZbjRPY492NG9kZ65aYstCs90uhMUEVVPuGUw7wBEku+6IEwZfrbMVKeWzLlPyM4Hv9hM
 8ktxSmxWsPTPqpBC8eyeAQLalMELAyVcZlkaCtEcbj7w4l/JkYz+4l37obG8ZD+B34udBUUz
 MsAJ8foDFrBh2MOFA3hxD6G90D23mmWsri7pnKA2tZs92aQX7Ee+FbCyg6g5ln62Sq83ZDbf
 53DdBs55EVpBadeInWmXhzCHPQx06H+CwTEjShTYIaMmBfrewvYUDKvFTC5iKQhAEUgt6i94
 JsbG7NoeqcxkUMcBOEUQ3uCQG1D70ugspgXc0wd3Rimiq6535wARAQABzSFCcnlhbiBPJ0Rv
 bm9naHVlIDxib2RAa2VybmVsLm9yZz7CwZEEEwEIADsWIQTmk/sqq6Nt4Rerb7QicTuzoY3I
 OgUCZ+R+mwIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRAicTuzoY3IOimUD/94
 BwVEJX31JRe2sxbB/e1w2p8x1bxvTw5AeIzpV3ox7coJg1bSU2mnGuj1V4o0Yxf/3zmcJzCN
 VfVjwRF8Ii3GnC7uUXk2t+87piQfKTyJAYQABhZUKgoVJbjJq/S+C3XCKIyBA+EiezoUsgsA
 jTzwU+FzV7zVWIXFPJNtBERLwboE9w9U3KjAExOa1kSY8eLrsg6kOwlOHWy5UsQqYOjrS96M
 mzm2xuc1+RCjrndAyYhCnrOKvJ67HsPnBeJCjw7ImGD/U1GchwYbX8o3DO3JNHm3qfC86ZqX
 2sCouENg4OzgPTtLKUrueM6xsu6KMM7gj17vxsiR3KQEoJnnMB8D1xtBofN3mFZE0wD9M24m
 8yGunZbtntMCUHzIrlJgAPwKWKuGOYtA8UgMTFkccnUJtQrg9KotKtEF/FuftG9zLG9XEkt4
 5ZdNgbSoLWgelu3T47mbOJ8LHhiLaCWP7yrovtVAvLUQ1BsiA42u8ECrFCFvQj9nrejE/ICv
 kP+uqcKtdDvP9HrIGycF1WZyfZLp0RvopKW92FLvI4I1QFWJ+wenk6+LGyJ5bzlrWzevjxmf
 nHcXE6sJBHrE7eijlbbImDAi3uLYN8Nd9Dm11IDAy4GAIQxSiQn0yblDhPiyGtchy80EVkCm
 g9k17Wol+2E2mC4DKgVdCkyUtTRSLgsJCs7BTQRkSTUoARAAuTnmWHBS6izRcEE93ajpzI7h
 dgQO4U3IRvOEsvIKR5NGcNEs0ngGebwsZ/lVULjN4vYU0LleqVhPBidNXUoZCN3A0F0Z2Ov8
 NZdef+2EhQPBVWxFO7JBzhe8Z3ALj+wFtlg8akJjBzU56azW/iJzAobqHVrudzKoO2b1/CMg
 VbiAQ+RXjgfN5kY/HqYDU7mw+hXuUV9PbtX1L8xqQQac95oM9rHzKHHpiVwxTeJnGQsa+THi
 Kze+YET3rCoGHMvOQEJhdrucTv5FpAakKdkOFNel9FFckLRKEuWgCzhpFsjQ7xbirQgFUxG9
 vlk1+q4hMRGNyEqoD6svYEeqbiUSd0oPUJeioiC3rNMRCNHLVrfZ2J6SCPkxfda08uzSdDQU
 1/YPjOh8ZtQDMu7WctZ3XO288Z1gyBR49V7fbFs2w4sQxG+h/enlxqP7fdw1mjUlZjU5huCJ
 ielS0oEaIpmUpkugli7x4WhwLnhK2EbSoz7nLBC0y+ALUOdMlz/Y1l9xRt+bkDhpmf4O4IcI
 MxgZ0QMLq8rHDkGaEbsgZZHQPS58T0XE3IP30Q9SNxsruCMXtd2hYtBssf/wohc6JVsTtMg2
 VYTPDPIFNZFSXupEJB7jlqpDWJ8ooJfJRLBatbjT5+mVQaMYB7Hs/t+zWYWaJKHyc8O6WLEC
 NUV5Tdt5EkkAEQEAAcLBdgQYAQoAIBYhBOaT+yqro23hF6tvtCJxO7Ohjcg6BQJkSTUoAhsM
 AAoJECJxO7Ohjcg6LuIQALnXt36OUuK43wqw6UYt0cnN6EbUqJHApAF5eNFn0jCCB2XELjSz
 JKJwuNAweowBdabiBniJ+501WIW+ewEsz1uby5fUQjZuCEsIkuaIluyfUFPb73qrQyAGuusd
 7teA4WT+/jUku9g7lX5sVoRCrKQPkd16f6Bzfztyqyjcn43/X5yQI+wlboQ6HuKe/3I3yiOx
 OgmCHzOawpC9PvhEcKj79RLM3Zz5Ts5AuHpRX70Jz8Be76LwVFLp5Msx3S24ZTU1lBo2uiJ3
 xSkay2lTpyVWRPx9vgcwzxGguOPJQJwsQeLb7wpoJMPpD3ERoaRii7Q7hvmxklpZjhKYWB3d
 t6nQ497Ek9loCrp3MIjRCSDN5xEGffiHks9yTeGMUQwO4tX8RE04uOJPkUY7uCFzFqN6/qey
 X3oFfPgkULMdiHofPAL1OskZSTzGPSfTYRE46NCJw8yoZBQ/oOyWeqaUQbK0wmW/g81wm8p7
 LKSGEglMpiX07M1AotgvylN5C8fjbouoK+/RAMsXkk8jba6rPfuuXPaDjCyyKn6zSVHETnHW
 3AJbgVY50T8STpnxayBQvWbCvu+6NOEjXCbyaOJig+5l0zlGN9XHjdANXC5HnwmyaGRL9YDq
 Jh2nVXVJDincOdQRdKcJjYLqaOAoWrYWSDi1iZGspHBTDrnOvfMQzzHY
In-Reply-To: <3d4e0147-8e62-4872-b881-1452f5e09e85@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64759-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2169367E4CD

On 13/06/2026 10:24, Atanas Filipov wrote:
> Thank you for the feedback. I understand the reasoning, but I
> respectfully disagree with this approach for the following reasons.
> 
> While it is true that the JPEG encoder shares the same camera NOC and
> power domain infrastructure as CAMSS, that is a hardware topology detail
> — not a sufficient justification for imposing a software dependency. The
> driver is a fully
> self-contained V4L2 mem2mem encoder, implemented like every other JPEG
> encoder driver currently in the kernel (imx-jpeg, s5p-jpeg, mtk-jpeg,
> nxp-jpeg). None of those are sub-nodes of a parent ISP or camera
> subsystem driver.

That's a backwards understanding of the ethos of DT, which is to 
describe hardware architecture, to describe hardware, not to subscribe 
to or proscribe a particular software architecture.

Those jpeg blocks are standalone, whereas the CAMSS jpeg encoder lives 
inside of the CAMSS power-island.
> Making the JPEG encoder a sub-node of camss would introduce an
> unnecessary and artificial coupling: the JPEG encoder cannot be probed,
> built, or used independently of the CAMSS driver, even on platforms
> where CAMSS is disabled. This directly contradicts the kernel's
> principle of independent, single-purpose drivers.

- Probed true
- Built true
- Used untrue

Once probed your current driver can chug along pretty much unperturbed, 
however I don't believe that statement can hold true as more of the 
camera hardware gets enabled.
> The shared hardware resources (clocks, interconnects, IOMMU stream IDs,
> power domain) are already fully described in the device tree node and
> handled by the standard kernel frameworks — there is no functional
> reason to nest the node under camss.

Except that it is a real description of the hardware. "We can model it 
separately != we have modeled it correctly".

And at least one thing you are leaving out here is the cam noc - which 
eventually we will have to start to enable and will almost certainly 
have to be controlled by the core driver which also owns the 
power-collapse and muxes, the thing that will also program CPAs - the 
core CAMSS driver.

Perhaps we choose to model that NOC as a separate driver or perhaps we 
expose an API in CAMSS to vote, either way its an intrinsic part of the 
voltage and clocks in this block.

Either way sure we could model it as a fully separate node but, that is 
not really how/where the block lives. It lives inside of a defined CAMSS 
block, which is its own power-island.

Switching on the JPEG part of it by inference switches on the top-level 
of the island so, its not separate at all.
> For these reasons I would prefer to keep the JPEG encoder as a
> standalone platform device with its own DT node, consistent with how all
> comparable JPEG encoder drivers are structured in the kernel today.
> 
> afilipov
> 
> On 6/13/2026 2:14 AM, Bryan O'Donoghue wrote:
>> On 12/06/2026 20:44, Atanas Filipov wrote:
>>> +        qcom_jpeg_enc: jpeg-encoder@ac4e000 {
>>
>> One key bit of review feedback I gave in the previous leaked version of
>> this driver is that since the jpeg-encoder is part of the CAMSS block it
>> should be a sub-node of camss as OPE, CSIPHY and other blocks will be.
>>
>> Please take that feedback onboard in your v2.
>>
>> ---
>> bod
> 
> 

And please no top posting !

---
bod


