Return-Path: <linux-media+bounces-63229-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EACcMFJQHWooYwkAu9opvQ
	(envelope-from <linux-media+bounces-63229-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 11:26:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E1961C663
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 11:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 499A13067AC2
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 09:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3968F3905EC;
	Mon,  1 Jun 2026 09:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bkAZlkaD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B363539021B
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 09:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780305604; cv=none; b=ZzOYx46TSrYyvp3lXhGU1oATVzBGrJIG2Ql7KeodMDd9wFVv7w1LxVrjEDpQLqlNDrY+TZW7Ee1Ibcbfvm7Px0ik/XeBb7uMxKi5rmdLT6mHKxefrxXArhqgjEvxy/DyiWEUMjMjeHg9ENTv97MR3UPdudb0m2Wi8Wn2gchX+Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780305604; c=relaxed/simple;
	bh=2LkuKaJomgCV549AW9szbWuvCIwNTgMUu0k0QYg7k0g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fe3sXk/1ip2RqRzI2WZKZcaFlJKdodVzSdoIbBxc4WMXG/pSEGG2AlOSPWP5sPo98L/BNheIjEW/IUvw2yhgc/m+ZCtUjSgxUYvCZRcTDsP9rL4xTbyWdoo07+pnWYeUaK2qkSFpv0teSiFkWFQvlqXw+Eca4CDoA42sT+ouubI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bkAZlkaD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394621F00893;
	Mon,  1 Jun 2026 09:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780305603;
	bh=L7EwAcluIDwZCYjn9YIIHDsqdXkOmtNJKkzaIhPSJyk=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=bkAZlkaDj/bqPy3qtV6hgxJmUBwCYTg29RYHCEriy4l6rh9GsskydzNSoKB+j7axd
	 Yc1XhCFiFdqnQZo521TYJZNNCYFo4lAO07ml2Gl84oGWnBXt2gTHLJTO/ccwQZTNEm
	 7S+5n8Qi4qvpnP+gpV0wfzcD06RshqiLz2KQwLKbz9+5txMHtpXh2+o4Rfx4P8QU47
	 3ktmgXNP9KjVq13xndr1LwaZgKH6f4eOqpEqh0Tz/ePLEJBGl9suaQrTAerIw/Pxhv
	 1Cj3Zafaoi8io43rptyymfj6S1Lo59KRTFbk4e9ItunsjCXqujTcFzm3hoH4FF/BzH
	 JNO2locIDie1w==
Message-ID: <3ba10f5b-063d-42db-87ec-243e88af815c@kernel.org>
Date: Mon, 1 Jun 2026 11:20:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: media-comitters next vs fixes trees
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-media@vger.kernel.org, media-committers@linuxtv.org,
 Bryan O'Donoghue <bod@kernel.org>
References: <CAO9ioeW5mv9bQjKbd3KOx6V4GB2xKgmDcLrbLowc=j0agwWMag@mail.gmail.com>
 <2d1e7167-2cf4-4998-9005-5d18a45c0144@kernel.org>
 <20260601102127.625ed568@foz.lan>
 <CAO9ioeVPX_KWh4Pgh94o3P+tuwBsBsbBNxds3ERVQo3r5iMVQA@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CAO9ioeVPX_KWh4Pgh94o3P+tuwBsBsbBNxds3ERVQo3r5iMVQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63229-lists,linux-media=lfdr.de,cisco];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 38E1961C663
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/06/2026 10:51, Dmitry Baryshkov wrote:
> On Mon, 1 Jun 2026 at 10:21, Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
>>
>> On Sun, 31 May 2026 15:24:48 +0200
>> Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>>
>>> Hi Dmitry,
>>>
>>> On 31/05/2026 11:13, Dmitry Baryshkov wrote:
>>>> Hi,
>>>>
>>>> Is there any current rule or plan about submerging the fixes branch of
>>>> media-comitters to the enxt branch? For example, I have several
>>>> patchsets which apply perfectly to the linux-next, but fail to apply
>>>> (and function correctly) on top of media-comitters/next because it
>>>> depends on the commits which are only a part of -fixes.
>>>>
>>>
>>> By default we (and with 'we' I mean Mauro and myself as media maintainers) do
>>> not merge the patches in the fixes branch into the next branch, unless we are
>>> asked to.
>>>
>>> Most of the time the fixes are independent of work in the -next branch, so we
>>> do this only if there is a good reason for it.
>>
>> Please also notice that we only merge upstream tags into "next" branch (e.g.,
>> currently we only merge from a 7.x-rc? tag).
> 
> I'd be happy if this was actually happening. Should this become a rule
> for media-committers/next, to merge -rc tags? Or to merge -rc tags
> after there was a medai-related fix merged into Linus's tree?

No, Linus doesn't like backmerging of -rcX tags, unless there is a good reason for
it that is also listed in the commit log of the merge. So this isn't something
you can automate, you actually need to write a proper commit log when doing this.

It's no fun having Linus yell at you :-)

Our experience is that this is actually quite rare, perhaps once a year, and if it
is needed, then just ask.

> 
>>> It's a bit late in the cycle to do something like that, though. In the meantime,
>>> just mention in your cover letter that the series depends on patches in the
>>> -fixes branch.
>>
>> A "good reason" means that you need to submit a patch that will be merged
>> in time for the next merge window which depends on a fix already merged
>> upstream.

That's one reason, yes.

>>
>> Just to give you a concrete example: we're now at 7.1-rc6, which is a
>> late -rc, as this is the last week where media subsystem is opened for
>> non-critical merges. We usually don't expect big/complex patches anymore
>> on a late -rc kernel cycle. Most of patches on this time are supposed to
>> be fixing issues.
>>
>> So, on this specific case, a "good reason" means that you have a fix that
>> must go to 7.2-rc, but depends on merging fixes from 7.1-rc6.
>>
>> If this is not the case, better to just wait for 7.2-rc1.
> 
> Yes, I agree. At this point it is really late. A part of the problem
> was that there were no patches picked for drivers/platform/media/qcom
> to media-committers/next between February and May 9th, with several
> patches being picked to -fixes also around end of April. I can only
> hope that it will work better during the next release.
> 

Regards,

	Hans

