Return-Path: <linux-media+bounces-62202-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIV3E7pQDWqgvwUAu9opvQ
	(envelope-from <linux-media+bounces-62202-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 08:12:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C7E588091
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 08:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1ACE430421C1
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 06:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962DB372662;
	Wed, 20 May 2026 06:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jn0fIquY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022EC2D0602;
	Wed, 20 May 2026 06:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779257416; cv=none; b=SfpMtVghMpxBAPwVV+GA0qawihU0p+rZL/sEIPlseDqbrfFOvTgb5Rtc7ffr3neq5IZhJEk3VyWAaWOOUKb6YYp0QnFfjtl5kY36cL5GHJsBFggTtAxs2Cym1ct+o6LN5Km4LDPx7K4SBSMfuKA5THSxpu4p5dJDaFmv8TLuQQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779257416; c=relaxed/simple;
	bh=cuMrcKbzbwix1T5U9uLdV/h9zVOglPybTk0MrThkk5s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=s9B1ma2Pd5RHMcqC5HjLvFywiMJVpNjZ9GXcfGj2QoOePkJ+B7biFU6JXm/hP4urduvAr92FNmeAengs+rzRuhH86F3sxV8r9gwfm1sGTCbMw1pf0uqZC4CM+lmoIwxN2dmlpjgRaqukfbwjUztEN0taoJgL/Dm15Ea3JlkCc7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jn0fIquY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB97C1F000E9;
	Wed, 20 May 2026 06:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779257414;
	bh=LLLF1rgDpHFXd7l/ckvK/WI2vDTlLcaG63F9pJPnrpE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=jn0fIquYDazCLoAFaEmuLO1v+EQw4Rm8K84ZH5RqpngFKpi3G/2wbfTtrjo4pQ4PN
	 6062+5O95JGYk04U2WaoUmxqHGe45ibSQJshRYYekQupxh/KVuMadQS8IKjyjFPdZn
	 PpI414FT0EwxRJsJFlNCzxSJso21Gu4bOvF+bVf2PiupFP3vN2FWtlq3v2YV6riHXZ
	 70YNi+3ziVTk58BCqW2JNxDcRs2D4T1LpRgDDR1oW6FctTtXgM/xJJk6T9+gisbIM/
	 UmXEJW2nm9GX1d0sgTksJU6CcZmFae3l5rOzVJYVFhCU4nGIKFT9Xm2J07LBMM6kft
	 nber5Alq/iVoA==
Message-ID: <28fac01c-2b52-47a7-9fb2-3b0f27d7e855@kernel.org>
Date: Wed, 20 May 2026 08:10:09 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: venus: venc: avoid double free on video register
 failure
To: Guangshuo Li <lgs201920130244@gmail.com>,
 Bryan O'Donoghue <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <xMdPPQAJ2BbtNwnxmf1CN7FGbdhSJM7NIXkRCxzFvXv0g01tuvNPvAacsFJaDyBc3cIkIAEfi44ewZ3OGGAcDg==@protonmail.internalid>
 <20260519090819.1041314-1-lgs201920130244@gmail.com>
 <8787ea87-aa75-4fb5-a729-cd2b54d2ff8a@kernel.org>
 <ihn1XgQJPFsYvuTtWPxpZWwaQBVXHDmJ6Kp6i4DmDowTcRQITZXJlaVsbtkW-bpWydiYGAyyh6c9QLs4Nsn6lA==@protonmail.internalid>
 <CANUHTR9g6vRkKfPeHBQ4_9YR-sZQ_UZBX3+8CiKPYp-XPcp1CQ@mail.gmail.com>
 <d7082ea8-3b3d-468d-ba27-4d3ba5103a3a@kernel.org>
 <ZdheLnLujnIRGAGLFiz1lwSwxaUCArec6sbk_VkixDGjsuPYnMT4_YCSMTbwBWI5-b62G90Qia9lQ90pyFvjBA==@protonmail.internalid>
 <CANUHTR99NHPRP3ooEXEBHf4Fksy0B96vdoV3=mzoMBawVgek+w@mail.gmail.com>
 <cfb76181-4d59-43b3-a45b-a344a71fdfbf@kernel.org>
 <CANUHTR9OX4KC6djn=wdkwAhiB0zqFEHFu3jtJ-+LdixgbB-OUw@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CANUHTR9OX4KC6djn=wdkwAhiB0zqFEHFu3jtJ-+LdixgbB-OUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62202-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 85C7E588091
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20/05/2026 04:31, Guangshuo Li wrote:
> On Wed, 20 May 2026 at 00:34, Bryan O'Donoghue <bod@kernel.org> wrote:
>>
>> On 19/05/2026 15:58, Guangshuo Li wrote:
>>> Hi Bryan,
>>>
>>> On Tue, 19 May 2026 at 21:20, Bryan O'Donoghue <bod@kernel.org> wrote:
>>>>
>>>> Yes I take your point.
>>>>
>>>> So what you are describing is an error in the software contract from
>>>> video_register_device() - if we look throughout the usage of that
>>>> function we see either the pattern we already have - not checking for
>>>> NULL or checking for NULL - not the double free case you are addressing.
>>>>
>>>> So really the fix - the place to litigate this is not in Venus or Iris
>>>> but in video_register_device's cleanup path.
>>>>
>>>> ---
>>>> bod
>>>
>>> Thanks, I agree.
>>>
>>> This should probably be handled in the video_register_device() failure
>>> path rather than in each individual driver.
>>>
>>> I do not have a good idea yet for how to fix that cleanly in the v4l2
>>> core. Do you have any suggestion?
>>
>> So if we look at how video_register_device() is used by drivers we have
>> two different behaviours.
>>
>> 1. Trap the error and release the device
>> 2. Trip the error - check for NULL and release the device
>>
>> Either way the _users_ of video_register_device() right now expect to
>> have to call video_device_release().
>>
>> So... it seems to me video_register_device() also calling
>> video_release() on some but not all of its error path is not the
>> expected software contract.
>>
>> So I suggest two things.
>>
>> 1. Audit all users of video_register_device() and confirm the hypothesis
>>     That is callers expect to own vdev and currently everybody tries
>>     to clean it up.

That's what drivers expect, since that's also how it is documented in
Documentation/driver-api/media/v4l2-dev.rst

This is old code, it's been like that for ages. There may well be drivers
that do not do this, but then it is a driver bug.

>> 2. If 1 is true then fix video_register_device() to not call
>>     video_device_release()

That's the right approach.

>>
>> It either needs to be that or fully delegate ownership of vdev to
>> video_device_register() _and_ update all of the callers.
>>
>> It may be that < 100% of callers if that is low single digits then
>> worthwhile updating those drivers to match the new semantic.
>>
>> €0.02
>>
>> ---
>> bod
> 
> Thanks, I agree with your suggestion.
> 
> I initially considered that some callers might not follow this ownership
> semantic, so I tried to fix the issues reported by my static analysis tool
> driver by driver first.
> 
> I will audit the users of video_register_device() to check the common
> caller expectation, and then look into fixing the core error path if that
> is the right direction.

In patchwork I'm rejecting all your patches that change drivers to 'fix' this.

I'm looking forward to a patch fixing it properly in v4l2-dev.c.

It's a real issue, but this shouldn't be done in drivers.

Regards,

	Hans

> 
> Thanks,
> Guangshuo
> 


