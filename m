Return-Path: <linux-media+bounces-43907-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C02BC3793
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 08:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B7A33A7775
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 06:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36D92E9EB8;
	Wed,  8 Oct 2025 06:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="azS+FmN6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181BA25C818;
	Wed,  8 Oct 2025 06:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759904850; cv=none; b=e9SZgfcqfLdLt1cPVeXnm/4+0NatduZflWlWcCXgpD/4RinOD1ma0hqYo7fLpqg0zIcC61vWBTqLbVZR/oc0EjEdpE6XWV2l/kUtm6dVTP7xE+OezY5XivsGVGjAoB6Qalrf1MTnVgraZCDJDaGlPBLgeCQD7tDVt9mZy8yHPsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759904850; c=relaxed/simple;
	bh=Qs1mNKauEw169pWFmjRqxX8J2h7bFNuvRtn6dhC3lr4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nhtbC9dtaRHEtEtFnba1tUQ5BNm7MSPgG7suy18ZRdDc23nqLLLYLzfUr5AaZCrVim2o5NfRM5YfQMv3RARKC76fFBe9fS2KVYHD8o+h1/d+HsrDBsgtnjIyu9FfTEaoUtht/F7kwBpPE6J18Vr4PQoymCtBScKu06E0+SJCil0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azS+FmN6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E225BC4CEF4;
	Wed,  8 Oct 2025 06:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759904849;
	bh=Qs1mNKauEw169pWFmjRqxX8J2h7bFNuvRtn6dhC3lr4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=azS+FmN6dIyzD1eIVCxubWtazWLtaoDUeK3PqV5cZV7w9EyJLXmyzaceBLK3e3jcQ
	 z5e+RtAeJ3UoEMDALYdMxfrnFVOMZZzywYqSgRXnTyXWqs4RR1i95NePCTkNSosYFu
	 fnPCU9AcVFc7knxgFmexMs2CLks9TCmxjI2vxtPsm+niYTyf3yMMzu5Gstg+GDxsXb
	 gTJ1ZbLsllbur8fMDeME7aKDrRKVH+kNUYzoSYgA2WlkoirPhXDtbDC4NY97x3MVCK
	 XllIHN7zwV2O0z+haCBYfR6B01oZftRpxnRaXvxQeEKaKLYasGVFIrpWmoNwRxb9Bk
	 RVdF4Xb0ZLqVA==
Message-ID: <f3e5b44f-9944-474c-9850-39e91b0ae7ea@kernel.org>
Date: Wed, 8 Oct 2025 08:27:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 0/3] module: Add compile-time check for embedded NUL
 characters
To: Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>
Cc: Malcolm Priestley <tvboxspy@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Rusty Russell <rusty@rustcorp.com.au>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20251008033844.work.801-kees@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251008033844.work.801-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/10/2025 05:59, Kees Cook wrote:
> Hi,
> 
> A long time ago we had an issue with embedded NUL bytes in MODULE_INFO
> strings[1]. While this stands out pretty strongly when you look at the
> code, and we can't do anything about a binary module that just plain lies,
> we never actually implemented the trivial compile-time check needed to
> detect it.
> 
> Add this check (and fix 2 instances of needless trailing semicolons that
> this change exposed).
> 
> Note that these patches were produced as part of another LLM exercise.
> This time I wanted to try "what happens if I ask an LLM to go read
> a specific LWN article and write a patch based on a discussion?" It
> pretty effortlessly chose and implemented a suggested solution, tested
> the change, and fixed new build warnings in the process.
> 
> Since this was a relatively short session, here's an overview of the
> prompts involved as I guided it through a clean change and tried to see
> how it would reason about static_assert vs _Static_assert. (It wanted
> to use what was most common, not what was the current style -- we may
> want to update the comment above the static_assert macro to suggest
> using _Static_assert directly these days...)
> 
>   I want to fix a weakness in the module info strings. Read about it
>   here: https://lwn.net/Articles/82305/
> 
>   Since it's only "info" that we need to check, can you reduce the checks
>   to just that instead of all the other stuff?
> 
>   I think the change to the comment is redundent, and that should be
>   in a commit log instead. Let's just keep the change to the static assert.
> 
>   Is "static_assert" the idiomatic way to use a static assert in this
>   code base? I've seen _Static_assert used sometimes.
> 
>   What's the difference between the two?
> 
>   Does Linux use C11 by default now?
> 
>   Then let's not use the wrapper any more.
> 
>   Do an "allmodconfig all -s" build to verify this works for all modules
>   in the kernel.
> 
> 
> Thanks!
> 
> -Kees
> 
> [1] https://lwn.net/Articles/82305/
> 
> Kees Cook (3):
>   media: dvb-usb-v2: lmedm04: Fix firmware macro definitions
>   media: radio: si470x: Fix DRIVER_AUTHOR macro definition
>   module: Add compile-time check for embedded NUL characters

I reviewed the two media patches. Feel free to take this series.
If you prefer that I take the two media patches, then let me know
but it makes more sense in this case that you take all three.

Regards,

	Hans

> 
>  include/linux/moduleparam.h                   |  3 +++
>  drivers/media/radio/si470x/radio-si470x-i2c.c |  2 +-
>  drivers/media/usb/dvb-usb-v2/lmedm04.c        | 12 ++++++------
>  3 files changed, 10 insertions(+), 7 deletions(-)
> 


