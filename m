Return-Path: <linux-media+bounces-21185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BCD9C2246
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 17:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1A34B23A32
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 16:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB07E1991D3;
	Fri,  8 Nov 2024 16:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="cZ7ifg6U"
X-Original-To: linux-media@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDA6192B71;
	Fri,  8 Nov 2024 16:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731084051; cv=none; b=beaDfX7Z0HfYfCZ3lNo6ojU1Tii2Nxhfv1KRLCzW/fdHYuyjXN3yw6Daqq9Mr9rXxL/HNASqJDPK92tS0QmhLH7UfGbDdv9RkqojhF4tz6wSE5+dKZv51ONwgc/fHDaPFNHAH0e/GKDnTGL8XuEQLentn5+Pz8x7YFh47RtGKq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731084051; c=relaxed/simple;
	bh=sFLDH2l4Koq2m3fdj1cHechzpW8ROQuPZQUInJ3DuKU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q+mqtXmawKrROYCiW45ZeAbRFDY70QSKtP4U0KvdJUYhmkjm/1eQRMhx6+jyNrUHiO2uo5MdrVxOH5JeU1oW+XX6ax37Ynu1dP0oSatZ3GiwMoRT8YQRN5BRttvac2LtJmtbPfvjj2kqwZlSZmyPR8A4VKiFyCCWYP6M3TNkwQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cZ7ifg6U; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 59E1442C17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1731084048; bh=hFaZzjAtq1siX2fucQlExiIONnxQ6s/0W735xx5RO9g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cZ7ifg6UUzcIqOHlRLnlEAnSf0cvIiz/POcpWlV03vc9zVytI8xvb6ZeEM+6lGOsc
	 rBq1Z6bBaGnlon/lm5L31Saf4ntsvlZURWanCwAdceBtqpZrUXR7YKFg+4aQg5lujI
	 PqvfBxMoS3gbnPBbMCB0ipzlCg/DEyAZyks/25mAjSO/uMRjQ1+ZcKHscrwlpIdbrA
	 2QW40a6JUDO4dAz4Gu4jykg5ihWbEZUrHJDv+Ot/sq513xlgdK2omPssWs2zhDK4re
	 DnqNYdOFtYB6a8S0+V6rSu8roAuZQfmnTqETih9z5/VHnyeY7ZZr06SAsfZDH8T5TS
	 ZXDahd5SY8AAA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 59E1442C17;
	Fri,  8 Nov 2024 16:40:48 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: bagasdotme@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
 mauro.chehab@linux.intel.com, kernel@collabora.com,
 bob.beckett@collabora.com, nicolas.dufresne@collabora.com
Subject: Re: [PATCH 1/2] docs: Add guides section for debugging
In-Reply-To: <20241108081315.ln5ltvw3ssldonui@basti-XPS-13-9310>
References: <20241028-media_docs_improve_v3-v1-0-2b1b486c223e@collabora.com>
 <20241028-media_docs_improve_v3-v1-1-2b1b486c223e@collabora.com>
 <87ldxu235z.fsf@trenco.lwn.net>
 <20241108081315.ln5ltvw3ssldonui@basti-XPS-13-9310>
Date: Fri, 08 Nov 2024 09:40:47 -0700
Message-ID: <87o72py8z4.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sebastian Fricke <sebastian.fricke@collabora.com> writes:

> Hey Jonathan,
>
> On 07.11.2024 13:35, Jonathan Corbet wrote:
>>Please, let's not add this to the top-level page.  I've been through a
>>multi-year struggle trying to trim that page down to the point where it
>>is possible to actually find something of interest there.  Everybody
>>wants their stuff up front, but please link this from the process guide
>>instead.
>
> Hmmm ... we are talking about a page for newbies here, when it is under
> process the person will have to figure out first that one has to click
> on All development-process docs and then find that document under the
> abundance of others. Could we atleast generate a top level page called
> Beginner intro or something similar, where you are guided through the
> documentation tree from the perspective of a beginner?

By the time somebody needs this document, they should be at least
wrist-deep in kernel development and should be able to find it.

Now, as per the discussion with Randy, if we decide we want to separate
"how to work on kernel code" from "how to work with the kernel
community", we can do that.  We're talking about a bigger organizational
issue at this point, though.

Meanwhile, more introductory documentation is always a good thing :)

>>When referencing the function, say printk() - that's the convention we
>>use.
>
> Ah even in the title? Can do. (Even though it makes the titles look less
> uniform..)

That would be my preference, yes.

>>That is anything but full documentation of lockdep; it's really only
>>about RCU.  I wish (hint :) that we had proper documentation for lockdep
>>that we could link here.  For the purposes of a reader who needs this
>>level of guide, though, linking deep into RCU is not likely to be
>>helpful.
>
> Yep I struggled finiding something useful for this topic in the docs.
> I'd say I skip adding a link for now and we can create another MR later
> to add a proper documentation + link in the documentation.

Sounds like a good plan to me.

>>> diff --git a/Documentation/process/debugging/index.rst b/Documentation/process/debugging/index.rst
>>> new file mode 100644
>>> index 000000000000..c200ede7c955
>>> --- /dev/null
>>> +++ b/Documentation/process/debugging/index.rst
>>> @@ -0,0 +1,21 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +
>>> +============================================
>>> +Debugging advice for Linux Kernel developers
>>> +============================================
>>> +
>>
>>This file needs an introductory paragraph (at least) saying what it is
>>about.  A simple directory listing is not hugely useful.
>>
>>An alternative might be to turn your "general advice" document into the
>>index.rst file.
>
> Well that is what I had in the previous iteration and Bagas Sanjaya told me:
>>Please split general debugging advice into its own doc (e.g. at
>>general-advice.rst). Most other docs have index.rst only for toctree
>>listing.
>
> So, shall I revert that or should I add a intro sentence to the index
> file?

Bagas is fond of giving bad but authoritative-sounding advice to
documentation contributors despite repeated requests to stop.
Unfortunately, I don't have the time to chase him around all the time
and set things straight.

My preference would be to go back to what you had, but if you prefer to
just add an intro paragraph at this point we can certainly live with it. 

>>> +  $ alias ddcmd='echo $* > /proc/dynamic_debug/control'
>>> +  $ ddcmd '-p; file v4l2-h264.c +p'
>>
>>It seems to me that the alias just obfuscates things, why bother?
>
> Well because the Linux Kernel documentation suggests that :P
> https://docs.kernel.org/admin-guide/dynamic-debug-howto.html#controlling-dynamic-debug-behaviour
>
> If you don't like that, then I think I should send a MR for that file as
> well.

Up to you, this is just something that caught my eye as I was going by. 

>>> +  To analyse the crash dump please use `Kdump` & `Kexec`.
>>
>>Those will not *analyze* a crash dump.
>
> Well yes they will capture the crash dump, which can then be used to
> analyse the crash. Maybe a better wording is:
>
> To capture the crash dump please use `Kdump` & `Kexec`. Below you can
> find some advice for analysing the data.
>
> better?

Yes, thanks.

jon

