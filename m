Return-Path: <linux-media+bounces-41377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C40A3B3CC5B
	for <lists+linux-media@lfdr.de>; Sat, 30 Aug 2025 17:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2AE0562E53
	for <lists+linux-media@lfdr.de>; Sat, 30 Aug 2025 15:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48EC258ED1;
	Sat, 30 Aug 2025 15:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tsFdWAuT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AF11F0991;
	Sat, 30 Aug 2025 15:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756569239; cv=none; b=igylYjRpp2EXv6t+DlCvKWejhlqUDev5HX1VmMvnAasc1Ev6I28kgZpdjzjpbBVkWjzaLlLIuoaJ2XMU9Q8qXFb6az8QUJ6D3b+uH7GnXpX0Ou8H/2OFiNOP57kdflv1gEjWz1i8xdisrrkcEHWwAFAdDw7MYS55OfOb51V/Urg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756569239; c=relaxed/simple;
	bh=4MDhPuf1ZsI1vue3P2tc13voRuTqerWAsAKdRtpdq+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bRIaY30UapbskSF4BHAru8aF+rf/hglkMa77YzjI8W4MNBOebb4C7KPUez1Dtf76nPciwKP7gB/KZ/uQU54FnaB/AHqxDp44dpu0AruSmuaMcuQc6ozO52mqEUUUGOAHtA/30A5t9pVVENUdemT4rm0P6TjcnFqrQw6CUgoiyCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tsFdWAuT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47C9BC4CEEB;
	Sat, 30 Aug 2025 15:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756569238;
	bh=4MDhPuf1ZsI1vue3P2tc13voRuTqerWAsAKdRtpdq+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tsFdWAuTjA7JfA/80vnTwuFhOy1Egc46U7ExIqvMwFto4RLabhwlxev/C2ghLsfw2
	 pXT6I9qYnikftQbEj3DzRDY/Uwta0p0X6vJwTQvvRrlwOOrz+/m1zW4E2PMXoQYj1e
	 Cx+1qRWkygijpQeq8w0u05Iwmhfjj4/gNPCAa+u8=
Date: Sat, 30 Aug 2025 11:53:57 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, conor+dt@kernel.org, hverkuil@xs4all.nl, 
	jacopo.mondi@ideasonboard.com, krzk+dt@kernel.org, mchehab@kernel.org, robh@kernel.org, 
	devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: Pinefeat cef168 lens control board
Message-ID: <20250830-radiant-pigeon-of-foundation-fed0ae@lemur>
References: <20250830111500.53169-1-asmirnou@pinefeat.co.uk>
 <20250830111500.53169-2-asmirnou@pinefeat.co.uk>
 <4eee57c0-a2fb-4fa7-bafe-e3a41c8954bd@kernel.org>
 <175656387714.501865.14707361524569628815@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175656387714.501865.14707361524569628815@ping.linuxembedded.co.uk>

On Sat, Aug 30, 2025 at 03:24:37PM +0100, Kieran Bingham wrote:
> > b4 diff '<20250830111500.53169-2-asmirnou@pinefeat.co.uk>'
> > Grabbing thread from
> > lore.kernel.org/all/20250830111500.53169-2-asmirnou@pinefeat.co.uk/t.mbox.gz
> > Checking for older revisions
> > Grabbing search results from lore.kernel.org
> > ---
> > Analyzing 9 messages in the thread
> > Could not find lower series to compare against.
> > 
> > You are not making it easier for us.
> 
> Could you explain what's required to tell b4 to know about earlier
> versions please? (Or point to the documentation?)

Oh, it's an interesting case, glad I looked into it. For one, there was a bug
in b4 that limited the lookups by wrong author (mea culpa!). However, there is
a complication here. This identical series was sent several times, with a
different From address:

    https://lore.kernel.org/all/20250830111500.53169-1-asmirnou@pinefeat.co.uk/
    https://lore.kernel.org/all/20250822171041.7340-1-support@pinefeat.co.uk/

Since this series wasn't prepared with b4, it doesn't have a change-id, and
therefore when looking for previous revisions we limit by subject and same
author. Depending on which v4 you pick from the two above, you will either
find v3 or not find a v3. :)

This command succeeds with the latest master and stable-0.14.y:

    b4 diff 20250822171041.7340-1-support@pinefeat.co.uk

> I don't know ... so I don't think a first time contributor would
> implicitly know either.

I know it's an easy thing to mess up, but in general sending the same series
twice with a different From address will result in confusion.

-K

