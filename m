Return-Path: <linux-media+bounces-45529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4B7C06AA9
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 16:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C222E3BF429
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 14:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8781EFF8B;
	Fri, 24 Oct 2025 14:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pL0WT0KQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E58A1E1E00;
	Fri, 24 Oct 2025 14:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761315454; cv=none; b=DrhH6vtL1oDFZPkocOSilWpgNj1PqT5lGTENj8+SXq+h3X3B17EaToV4g06X+ctlSrUbTdX7AITaG1PGMoTWc9U6cMi+9Ch6iSVvKA/nqWCXqdVqtovcEYEhyDdqXoHU7cijOejDIbIt26jykoFtLGefOsNtpqAmRWxdrQkuGA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761315454; c=relaxed/simple;
	bh=Ydi1aT2dMr4B5BaKBUc3yFTYNIR0YpQPCQqOfvnwZZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pyFQOcC/WSxB38ZW44i5LW/MekZS93fetTL2pofbylpEpPb03YaGvyrOlad8ffz7wxVdT9ecuzogWSrKMTbcWLJCuq352Da3s7hKwtflfyrs3SdnRAfgive9yqLjokXjLEprMu0juAIk0TusFAsqm1ZGerDtx65nNOPXfJvC5OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pL0WT0KQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD95EC4CEF1;
	Fri, 24 Oct 2025 14:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761315454;
	bh=Ydi1aT2dMr4B5BaKBUc3yFTYNIR0YpQPCQqOfvnwZZg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pL0WT0KQo50WPj8SmgBn6sUVWhguKk2oWlfuNRLomYbA47LmbgyLEx8eom9k/xRKp
	 19sET7pT3zwwAE6067SZ404DXcO9JKgRqw5oUpj2h4kzj4zzNZs7K9ECaP6+1h1hNI
	 dfBymU2ODF9fRw1hxmNh7kXUyHnC736BCTOFjGsxcCaDvnU9JhR4z8huHtUGYf/ePo
	 qJD5dotMsgwc7ytv9Z7q2438AnsB5LDd9L56QinK1e1T6zVJWVXYkgJv0RNOJr5ac+
	 a9zY7mBB6Cu8Q+4dZFrYrLalbVWx9VDg6q79l8GKyfSC1+sCMwX5ZRKkMzbLMef9Qk
	 1JBMdwq4LeRtw==
Message-ID: <b21ba8b4-a31f-44e5-a2da-ba585a93d3a6@kernel.org>
Date: Fri, 24 Oct 2025 16:17:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Correct return of dma_fence_driver_name()
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251024075019.162351-2-phasta@kernel.org>
 <11b7a8a5-170f-4815-a8ac-5dba2d8e67a1@igalia.com>
 <5de88e79575e06c053f2d61f7bb58bf9cf5b556e.camel@mailbox.org>
 <1d0bbdcf-f4d6-49c0-bbdf-364c2af80868@igalia.com>
 <89812f66-25a6-4f9e-aa4f-74adbf116db8@kernel.org>
 <5640fbf1-7b8d-4537-9f1a-b401a7a4934b@igalia.com>
 <8cba66d2-9608-4a5c-a2af-6cc91f46a49f@kernel.org>
 <cefe8f07-68a3-4c93-ae46-ebb01ff6fa2c@igalia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <cefe8f07-68a3-4c93-ae46-ebb01ff6fa2c@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/25 3:37 PM, Tvrtko Ursulin wrote:
> Good to know. I am coming from the angle that netiquette, at least in the olden
> days, used to be that when you join an established thread you don't trim too
> much of the context. For the benefit of people joining the thread at that very
> point, especially when re-raising an argument which has already been discussed.

I see it the opposite way, leaving too much context wastes people's time
searching for the actual reply, see also [1].

If someone wants the full context, previously sent mails are always available.

[1] https://subspace.kernel.org/etiquette.html#trim-your-quotes-when-replying

>> Now, you can argue that you mean "driver has been detached from the fence",
>> which means something along the lines of "the driver has no business with the
>> fence anymore", but this is not what people think of when they read
>> "detached-driver".Okay people. :)

Not a big deal, but for you to note: Quite some of your replies I've received
recently add text to the quoted parts, in this case the "Okay people. :)".

> How about "unknown-driver", would that satisfy you?

Honestly, the most accurate thing to say would be "fence-signaled", because
that's the actual condition which causes the change.

