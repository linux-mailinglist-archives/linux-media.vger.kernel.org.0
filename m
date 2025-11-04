Return-Path: <linux-media+bounces-46277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 227B1C3088C
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 11:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F97D4E8090
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 10:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187442D63F6;
	Tue,  4 Nov 2025 10:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7VV9D/Z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5806F2153D4;
	Tue,  4 Nov 2025 10:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762252527; cv=none; b=AjimzsHp0embUWJY4ReRyI5rvQfkJwWUBxfhIYFHNKyNYX0NlyOZUqLJm8kJ1RYPxSuASDPeVi2UyG+MiuGrERQjpVb3Lx8blyeSWd5VXfthMZhxUKP/YCaUCGZj08GHYQWvZB5EROZ0Yead3k9VZA/a9+5C8tFHyREHP8Cizgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762252527; c=relaxed/simple;
	bh=5JTfHhTl299yXPDNgoTz1UFbmN7ZPUVsarzUoCgYop8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FWy2cAs4AWJRt1R4T22xgpwziPorFXwHmQj0cMGKdg+ycGHmbsOO4S+A21dX/JHZ+lmIYi3w9KqIU82uVpYCOZR7t4NMCl0MRiy1izC82rOwydNYx9ti74TZeL80q7TBWBGWX8geT+84kknAcLVPMGqgg/3Ulv7gYAJmzm3qVSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7VV9D/Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09943C116B1;
	Tue,  4 Nov 2025 10:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762252526;
	bh=5JTfHhTl299yXPDNgoTz1UFbmN7ZPUVsarzUoCgYop8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=G7VV9D/Z65r/Adn5kJTqDka2gpZ22DFQiA3tWd6VMtPqeP94G2ss8wDSJHQM1Z86K
	 QpRn9ep4/tuMai3l0vC2puG9DAVqvozAZCHtxstVlhFay38GT5tW55pYkFUpm2VPaK
	 GZo7S62t+5pMgEAQTH3fEuK6rGTWrXry14Nh+r+WhzGaaL+yprrX6eRl60lGrjJVKN
	 ezSLvqxD8QHLl3HRXzGaO9M/zSLCdp2Gqt1RuoRuzB3HRUbvVIIO4eP0uZuDKDjSwZ
	 pZN4nn9iBXFWMDtJPRQDV7TD14jk+XqSpBW9/TjrW6WBNwtwAf3OGu8KBulC2zbZIB
	 pLW7+XWvEDnVw==
Message-ID: <5dba319f-56bc-40bf-9137-acb90f3cc754@kernel.org>
Date: Tue, 4 Nov 2025 11:35:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 0/3] module: Add compile-time check for embedded NUL
 characters
To: Daniel Gomez <da.gomez@kernel.org>, Kees Cook <kees@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Malcolm Priestley <tvboxspy@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Rusty Russell <rusty@rustcorp.com.au>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20251010030348.it.784-kees@kernel.org>
 <176219902728.2668573.8447418880394997824.b4-ty@kernel.org>
 <202511031612.8A05E2FD1C@keescook>
 <ab56339a-8736-4d68-bf11-d27c8d591597@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <ab56339a-8736-4d68-bf11-d27c8d591597@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/11/2025 07:35, Daniel Gomez wrote:
> 
> 
> On 04/11/2025 01.13, Kees Cook wrote:
>> On Mon, Nov 03, 2025 at 08:49:43PM +0100, Daniel Gomez wrote:
>>>
>>> On Thu, 09 Oct 2025 20:06:06 -0700, Kees Cook wrote:
>>>>  v2:
>>>>  - use static_assert instead of _Static_assert
>>>>  - add Hans's Reviewed-by's
>>>>  v1: https://lore.kernel.org/lkml/20251008033844.work.801-kees@kernel.org/
>>>>
>>>> Hi!
>>>>
>>>> [...]
>>>
>>> Applied patch 3, thanks!
>>>
>>> [3/3] module: Add compile-time check for embedded NUL characters
>>>       commit: 913359754ea821c4d6f6a77e0449b29984099663
>>
>> I'm nervous about this going in alone -- it breaks allmodconfig builds
>> without the media fixes. My intention was to have the media fixes land
>> first...
>>
>> Should I send the media fixes to linus right away?
>>
>> -Kees
>>
> 
> I can take both patches. But I think it'd make sense to drop patch 3 first and
> then, apply all 3.
> 
> Please, Kees, Hans and Mauro, let me know if this is okay with you.

I'm fine. If you take it, then I'll drop the media patches from our tree (I merged the
media patches yesterday).

Let me know if you take them.

Regards,

	Hans

