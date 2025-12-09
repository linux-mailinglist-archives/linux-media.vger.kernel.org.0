Return-Path: <linux-media+bounces-48453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 833DACAF438
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 09:18:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAB983029D03
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 08:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1EB2367BA;
	Tue,  9 Dec 2025 08:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1QCJCBi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4553B8D64;
	Tue,  9 Dec 2025 08:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765268290; cv=none; b=HKQ6vpKap++Npj3YZKKiHN6qbd7ZDVqAICi29DhWUJz+VQxOf6wiNr1AdXUCldqy6PiSX8Hzrgo92S1BqQnPIs3S+NnV0hk0HHpVfo7BlOgRpY3g0kjlyXv6Pg37vsoD8Cf3PS9gT0c6Gc/1anK9DWTFoTteSVWIZtc19scjgtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765268290; c=relaxed/simple;
	bh=YYRkFbNBvY+E+VoDEW6wqCwcGJed8jDsdLj4NyqhSiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qw5KC4Ed1WmGYiQYbB0vJjLUqP2K3RypZGSheyghXlMzGmSmeFn1TAEvDphKTpaLAuVJAsHGMpY9ysnFHK2o1BgBvTL1LTthSggK0gCSv2G3J9RmyWBEZM/pvL1OLOuJg0EGyny0PUS8Cj6W7i2MifLNTM7qRYiZouIQJpn9Dvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1QCJCBi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83ACFC4CEF5;
	Tue,  9 Dec 2025 08:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765268289;
	bh=YYRkFbNBvY+E+VoDEW6wqCwcGJed8jDsdLj4NyqhSiE=;
	h=Date:Reply-To:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i1QCJCBiftvnxRtLR0gIEZAUzmwhlP/85Pz1AWR+QM9cixDYu0OrGxGvZqsn6L26y
	 qUKYnJgZelRcVJRUZ5yLguakMH7p1ME6pJ08g/6yxIx45BZWjOO4WLtYhbImD2CS9u
	 X5OQIe/Q53TEU8zAklGKdz8I/3U3H3x4kZzMo/4V3ZcFQhE/E6Byz/G4FJqS+Q71Qu
	 7n44/nHnKM3PaXc1HR9h/Tz+KTTCpabFdpjSwnonqy8Slrn4bJgow4z3lR+DVLDYIz
	 84Ahk83dPGYriGtE9CtjPsEtKZYKczhPyUE6ZbMdvek8kaFSpclTIqfZ0C5q0nP9wU
	 nQFD1t/KqjUGw==
Message-ID: <d3dd8fc8-ab46-4cf1-87a9-0324685ba2e0@kernel.org>
Date: Tue, 9 Dec 2025 17:18:03 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Daniel Gomez <da.gomez@kernel.org>
Subject: Re: [PATCH 3/3] module: Add compile-time check for embedded NUL
 characters
To: Eric Biggers <ebiggers@kernel.org>, "Luck, Tony" <tony.luck@intel.com>
Cc: Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Rusty Russell <rusty@rustcorp.com.au>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, linux-modules@vger.kernel.org,
 Malcolm Priestley <tvboxspy@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20251008033844.work.801-kees@kernel.org>
 <20251008035938.838263-3-kees@kernel.org> <aTc9s210am0YqMV4@agluck-desk3>
 <20251209001139.GA7982@quark>
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
Organization: kernel.org
In-Reply-To: <20251209001139.GA7982@quark>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09/12/2025 09.11, Eric Biggers wrote:
> On Mon, Dec 08, 2025 at 01:05:55PM -0800, Luck, Tony wrote:
>> On Tue, Oct 07, 2025 at 08:59:35PM -0700, Kees Cook wrote:
>>> Long ago, the kernel module license checks were bypassed by embedding a
>>> NUL character in the MODULE_LICENSE() string[1]. By using a string like
>>> "GPL\0proprietary text", the kernel would only read "GPL" due to C string
>>> termination at the NUL byte, allowing proprietary modules to avoid kernel
>>> tainting and access GPL-only symbols.
>>>
>>> The MODULE_INFO() macro stores these strings in the .modinfo ELF
>>> section, and get_next_modinfo() uses strcmp()-family functions
>>> which stop at the first NUL. This split the embedded string into two
>>> separate .modinfo entries, with only the first part being processed by
>>> license_is_gpl_compatible().
>>>
>>> Add a compile-time check using _Static_assert that compares the full
>>> string length (sizeof - 1) against __builtin_strlen(), which stops at
>>> the first NUL. If they differ, compilation fails with a clear error
>>> message.
>>>
>>> While this check can still be circumvented by modifying the ELF binary
>>> post-compilation, it prevents accidental embedded NULs and forces
>>> intentional abuse to require deliberate binary manipulation rather than
>>> simple source-level tricks.
>>>
>>> Build tested with test modules containing both valid and invalid license
>>> strings. The check correctly rejects:
>>>
>>>     MODULE_LICENSE("GPL\0proprietary")
>>>
>>> while accepting normal declarations:
>>>
>>>     MODULE_LICENSE("GPL")
>>
>>  
>> I did a "make W=1 C=1" and found that sparse is now unhappy with all MODULE_LICENSE(),
>> MODULE_PARM_DESC(), MODULE_DESCRIPTION(), MODULE_AUTHOR() defintions (with no NUL byte).
>>
>> I see:
>>
>> error: bad integer constant expression
>> error: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
>>
>> for every use.
> 
> Likewise, I just got the following kernel test robot report sent to me,
> where it's warning about MODULE_LICENSE("GPL"):
> https://lore.kernel.org/all/202512090359.7BkUaiC9-lkp@intel.com/

Can you both confirm which version of sparse are you using?

My understanding was that this patch fixed that problem:
https://lore.kernel.org/linux-sparse/CACePvbVG2KrGQq4cNKV=wbO5h=jp3M0RO1SdfX8kV4OukjPG8A@mail.gmail.com/T/#mf838b3e2e3245d88c30a801ea7473d5a5c0eb121

The patch is already merged into the sparse tree, and I was not able to
reproduce the issue.

