Return-Path: <linux-media+bounces-50456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C67D125A3
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 12:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9CFC23019E1C
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75E1356A1A;
	Mon, 12 Jan 2026 11:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eVkktZvJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OPLn+7ot"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4E1356A1F;
	Mon, 12 Jan 2026 11:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768218199; cv=none; b=Ja5ViMQ4zYkD6vVMNngCGEb3Z078cQYqqcPgwbgEVk7YhmFI6xHm57hVA14oE6+QciOeURPsVIv0S72z6c8uVx9Q+GKa7VaKF2YMtzsEqjJp7VgcuW9dkpTCdcDH3RcW8YjW7YBqjvpfiNHjM6e3OO9NNJdJQ+6qppvzRDb0Peg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768218199; c=relaxed/simple;
	bh=FR2uZsoo66h4Nk5/I2ZK0kwZbKETV3eY+yMO6voVimY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNhuMuaOiEfAew+QO60mxqB8pkGfmJ0/LlcaUF/2wbPlD2U+6pJEGShUqJRUTcnvTtB9zav4u44Na2o6UbaOay4m9jzE2A6OooOO4sMfRTsWSxmGlTtozSVP7D+aqmxq8OLpZXhP1bVcaaBOUVnLD78kPYpAV5z1pQvu0W5BGDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eVkktZvJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OPLn+7ot; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Mon, 12 Jan 2026 12:43:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768218195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rkzi987TcoICfrsQFj2zvBdxgU9Mxrngu2PrpsNfLsQ=;
	b=eVkktZvJ38ZAxJs6ySz/B7kjT4hCOdXD9zbhfB/OEPK0uFSjDqcORnGETjU1GuZZzsoWvz
	/ExxRZH0YZLjwTYccVdT/FprMu2SqE5NtLxYhD8egBw4HxiOMSXeuJhZZhZand3HEhhgFC
	MUUa13DcZnzxN0T5z3MbHGIgOcNXIUg4iTngi7i1JRohitGzqHTgaw3UJ19tFQLIZ2K88i
	fJDJCKvEuqth15UUDz9EjPBtRXC39zQqgQ6QoHa10jzxAuetqC4QscSr/une2YueOOe+xB
	NZgUty5jIQQF6WD97y1O1jq5Px4QyA/pAipNQ2m5MlhwnCsxGD9+fIapJWSvpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768218195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rkzi987TcoICfrsQFj2zvBdxgU9Mxrngu2PrpsNfLsQ=;
	b=OPLn+7otecFzTYhsQpPPinjW30U84YdReV1WEN0Yq9zNA81v7Cd0Y2ul4k2O7DiCRpCiOx
	JV8sd5uPq4lKW2Dw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 3/4] media: dw100: Fix kernel oops with PREEMPT_RT enabled
Message-ID: <20260112114313.woeZoGZP@linutronix.de>
References: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
 <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-3-65af34d04fd8@ideasonboard.com>
 <8a8ec84e5484d7a1a5e6fac9a5238f3cae66abc3.camel@ndufresne.ca>
 <20260105235921.GI10026@pendragon.ideasonboard.com>
 <20260105193933.40485807@gandalf.local.home>
 <20260106004928.GL10026@pendragon.ideasonboard.com>
 <176771948736.12184.11458532023194713133@localhost>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <176771948736.12184.11458532023194713133@localhost>

On 2026-01-06 18:11:27 [+0100], Stefan Klug wrote:
> Hah, if I knew that :-).
> 
> The pieces I have are:
> In the DT the interrupt line is marked as IRQ_TYPE_LEVEL_HIGH. I don't
> know why and couldn't find a reference to that in the reference manual.

It is either a LEVEL interrupt or just marked as such. But it seems to
behave as such.

> Assuming it is a level interrupt, then it makes sense to treat it as ONESHOT,
> otherwise it would fire again immediately after handling the hard
> interrupt...but it was a hard interrupt in first place - huh.

So setting it ONESHOT while it is non-threaded does not seem to make
sense, correct.

> I just realize that I still miss a bit of the puzzle:
> ONESHOT is doumented as:
> 
> "Interrupt is not reenabled after the hardirq handler finished. Used by
> threaded interrupts which need to keep the irq line disabled until the
> threaded handler has been run."
> 
> That makes perfect sense. So ONESHOT disables the irq line until the
> thread_fn has completed (if it was set). Now on preempt_rt inside
> irq_setup_forced_threading() we don't force threading if ONESHOT is
> requested. Why is that?

Because ONESHOT is usually used where there is no primary handler/ the
primary handler does just a wake of thread.

> So I'm left with two questions:
> - Why aren't ONESHOT irq handlers forced to threaded on preempt_rt?

See above. Also PREEMPT_RT just enforces the kernel command line
threadirqs

> - Why was ONESHOT requested in first place as to my current knowledge it
>   really only makes sense if a thread_fn is defined.

I would say it was a mistake and nobody noticed it. There is no visible
difference if there is just the primary handler and the system does not
use threadirqs (or PREEMPT_RT which enforces it).

> Did I just answer my own question? ONESHOT only makes sense if there is
> a thread_fn and it is assumed that the hard handler is necessary. So
> preempt_rt doesn't try to change that?

Yes. ONESHOT is used if the interrupt source within the IRQ chip has to
be masked until after the thread completed. So setting ONESHOT without a
threaded handler is dubious.

> That would mean the ONESHOT in the dw100 was not necessary in first
> place but didn't do any harm until preempt_rt was enabled... And if
> ONSHOT is *not* set preempt_rt would automatically force the irq handler
> to be threaded and set the ONESHOT flag in irq_setup_forced_threading().

correct.

> So everything would be fine except that we'd still hit the timeout issue
> from patch 4/4.
> 
> So if I got that right, the dw100 driver is in the unfortunate
> situation, that the irq handler consists of two parts where the first
> part *must* run in hard interrupt context and the second part *should* run
> in hard interrupt context but it is fine if it becomes threaded due to
> preempt_rt. As we can't model that, the best we can do is to always run
> the second part threaded...

So happens if you avoid the IRQF_ONESHOT? Do you still get these
timeout errors?

> So patch 4/4 seems correct until we get new information about the
> hardware.
> 
> Any thoughts?
> 
> Best regards,
> Stefan

Sebastian

