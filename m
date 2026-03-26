Return-Path: <linux-media+bounces-57128-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAD/L3TjxGnz4gQAu9opvQ
	(envelope-from <linux-media+bounces-57128-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 08:42:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA783308E6
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 08:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C09763034495
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 07:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3423E340A4D;
	Thu, 26 Mar 2026 07:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tc72uVcc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7D812E1E9;
	Thu, 26 Mar 2026 07:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774510916; cv=none; b=AkOJA2AhgA5cUbQbUS7qdejec4Qzld0krI7xzR/wI62/Vul+3yyaugvKxCeUbJvTO4xqMG++o3t5exAPo5484xFaTGKp0zCipfjxhoAVWtu/UC9IcFWQMb9D12RlcPcJCqOCud3it+S7kEdQQB/3ThnHfgdM6rL1VRJTyefjzeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774510916; c=relaxed/simple;
	bh=Y5tYgAnwdEqgkjptdXEG2g8oayoTWgwP3jV32pI7j1M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=erkyebkQjOOhBGLKa3MJhfP6ccx3w/DFYgsd/ATz/s0Cju6itayBuu/a/jNRCdxOBYeUtGzqul5UEA8beTlHvfVy7ZwlxoKP/rk0wtIp6o6GvwEVTijz2BZAUDX/kF+D+1CnOjVxlyP7himZguUsncIPaSoXGsYV0bJKzQ+G9ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tc72uVcc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A39EC116C6;
	Thu, 26 Mar 2026 07:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774510916;
	bh=Y5tYgAnwdEqgkjptdXEG2g8oayoTWgwP3jV32pI7j1M=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Tc72uVccAw+aWzLpr3M0oDEbjzzyCH//5BERL6l3KWVJfSNMGdH3kx4sohE+Dt0Hh
	 aMUA2C37UpjrMsYq1+k1fzlYZVQgsr6yGmCp2gemOskNT0fhmkZBbK4lmYiZp3o0/j
	 qdI/4gZesMm+5CeDMUjt86f2Ab/Sz/oYlmLE2jEWQEnLLqOOyv9ZNiQl538fsCbsPU
	 gBweqSgfMGWt/Ufa8qUtZAmbyYZjDzUeEy/V5WZ5H1BD/gQV+xRYO1bMDOCwXmnmgY
	 fipA0g32H3GC9x14csuDR0+sC8Uw7eRKHvESRf4okhWOTeNd5yASgZGZ4XZ9kgSrhH
	 1/q/plEyUti2A==
Message-ID: <2a4ad91a-90c9-4bdb-92e0-98b95b420f2d@kernel.org>
Date: Thu, 26 Mar 2026 08:41:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v12] media: Add t4ka3 camera sensor driver
To: Kate Hsuan <hpa@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>
References: <20260323071647.38086-1-hpa@redhat.com>
 <0532e7b1-b3c5-4bb3-80e4-76db00c385ea@kernel.org>
 <acKREpGPr1J_1Oaj@kekkonen.localdomain>
 <63e50918-60d3-4a01-b28d-77c8580f1260@kernel.org>
 <CAEth8oF=qr4KAOSRU29n5DOhaAAo=VH9gfp7r25n0vwkuhfduA@mail.gmail.com>
 <CAEth8oHNX3da01oxOP3xuHKQc1qUYfBnGSpFifuaUMkKcgzvVQ@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CAEth8oHNX3da01oxOP3xuHKQc1qUYfBnGSpFifuaUMkKcgzvVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57128-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9CA783308E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/03/2026 06:21, Kate Hsuan wrote:
> Hi Sakari,
> 
> On Wed, Mar 25, 2026 at 11:01 AM Kate Hsuan <hpa@redhat.com> wrote:
>>
>> Hi Hans,
>>
>> On Tue, Mar 24, 2026 at 9:48 PM Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>>>
>>> On 24/03/2026 14:26, Sakari Ailus wrote:
>>>> Hi Hans,
>>>>
>>>> On Tue, Mar 24, 2026 at 02:17:38PM +0100, Hans Verkuil wrote:
>>>>> I'm missing an entry for the MAINTAINERS file.
>>>>
>>>> Thanks for noticing. I already picked this and it's in a PR... there are a
>>>> few other (minor) remaining matters, too, which I asked Kate to address on
>>>> a follow-up patch. Would it be ok to address these at the same time, after
>>>> the driver is merged?
>>>>
>>>
>>> I prefer to have the MAINTAINERS entry before I merge this driver. Other
>>> minor matters are fine for a follow-up patch, but a new driver shouldn't
>>> be merged without the corresponding MAINTAINERS entry.
>>>
>>> If Kate can post a patch for that entry tomorrow, and you Ack it, then I can just
>>> add it to the PR.
>>
>> I'll try to propose a new revision of the patch today to include the MAINTAINER.
>>
>> Thank you :)
> 
> The v13 patch included all the fixes and the MAINTAINER update in one commit.
> Do you want a revision with separate commits against your comments in
> the v12 patch?
> If you want, I can propose a new revision.

No need, v13 is fine.

Regards,

	Hans

> 
> Thank you :)
> 
>>
>>>
>>> Regards,
>>>
>>>         Hans
>>>
>>
>>
>> --
>> BR,
>> Kate
> 
> 
> 


