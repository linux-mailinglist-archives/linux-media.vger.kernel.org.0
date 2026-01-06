Return-Path: <linux-media+bounces-50052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB60BCF990C
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 18:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F03DF3029805
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 17:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9E329D273;
	Tue,  6 Jan 2026 17:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L+1o1nDS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C94F340283;
	Tue,  6 Jan 2026 17:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767719493; cv=none; b=BRGRi6u79rWdIv7SDmjz0zYdvp4y5DlWlONrmPfQjE+stMPyXptTU/zLJrY2CnWJmveNHWg40M0GC7eW5bXsNEt5WFailu/K3fMaIf1GLT2yrpXdRZA3IxxeihaB+89X/t2Ez7HxR9/Rj4Jm+edZEEzuc13bij/SotAB7liKuec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767719493; c=relaxed/simple;
	bh=rk8wYmSTmpV9eyE5i+/fQzwLidr/XrTLsAR6/Dd1ZbQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=SUxNA4bz4ZB6nQ2AoAeBRrpt07Z3hmHWj7nudnO/6l2ci1nrSzFp8lBy8I/y2fOjcUZzn1XcLRhlrNbxqAr5UW1z74fuhfSuokLucx2bTL3V3BDN2V7g8CtEBX/bJxUYJOk5SZ6q/EY6BKcAm8pjz3HVTlGye3665GZIUIZsxTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L+1o1nDS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:8c3f:64f1:feb8:928b])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 60D5F78E;
	Tue,  6 Jan 2026 18:11:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767719469;
	bh=rk8wYmSTmpV9eyE5i+/fQzwLidr/XrTLsAR6/Dd1ZbQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=L+1o1nDS6RXtYejgSIZuTWlQOt6QcVaJwKfdi+BIQauW313F/x8q+osGyKF7eBG8G
	 WQyEO1QfHEfEUymqRvCauKfprkrl6d8daRUZkRlKjBrQ9NcQJLkD1AHH/m9tk+L8v6
	 UQNSsv+0EZPK9xDZ51BjWP6H05RP4RiRGOFzakrE=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260106004928.GL10026@pendragon.ideasonboard.com>
References: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com> <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-3-65af34d04fd8@ideasonboard.com> <8a8ec84e5484d7a1a5e6fac9a5238f3cae66abc3.camel@ndufresne.ca> <20260105235921.GI10026@pendragon.ideasonboard.com> <20260105193933.40485807@gandalf.local.home> <20260106004928.GL10026@pendragon.ideasonboard.com>
Subject: Re: [PATCH 3/4] media: dw100: Fix kernel oops with PREEMPT_RT enabled
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, Xavier Roumegue <xavier.roumegue@oss.nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Steven Rostedt <rostedt@goodmis.org>
Date: Tue, 06 Jan 2026 18:11:27 +0100
Message-ID: <176771948736.12184.11458532023194713133@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602

Quoting Laurent Pinchart (2026-01-06 01:49:28)
> On Mon, Jan 05, 2026 at 07:39:33PM -0500, Steven Rostedt wrote:
> > On Tue, 6 Jan 2026 01:59:21 +0200 Laurent Pinchart wrote:
> >=20
> > > > That's interesting, do you plan to update more drivers ? There is a=
 lot of m2m
> > > > using hard IRQ to minimize the idle time (save a context switch), b=
ut RT support
> > > > might be more worth then that. =20
> > >=20
> > > This is a part of PREEMPT_RT that puzzles me. By turning regular
> > > spinlocks into mutexes, RT seems to break drivers that use those
> > > spinlocks in hard IRQ handlers. That's a very large number of drivers
> > > given how widespread regular spinlock usage is. Do drivers need to be
> > > manually converted to either raw spinlocks or threaded IRQ handlers ?
> >=20
> > No. Pretty much all interrupts are converted into threaded interrupt
> > handlers unless IRQF_NO_THREAD, IRQF_PERCPU, or IRQF_ONESHOT are specif=
ied.
> >=20
> > The interrupt line is disabled until the thread handler is called.
> >=20
> > > What about non-RT kernels, how can a driver avoid the thread scheduli=
ng
> > > penalty in those cases, do they need to manually select between
> > > request_irq() and request_threaded_irq() based on if RT is enabled ?
> > > This puzzles me, it feels like I must be missing something.
> >=20
> > The issue here is that the interrupt handler specifies ONESHOT which ca=
uses
> > the handler to be executed in hard interrupt context.
>=20
> Gotcha.
>=20
> Stefan, please explain in the commit message why the ONESHOT flag is
> set by the driver.

Hah, if I knew that :-).

The pieces I have are:
In the DT the interrupt line is marked as IRQ_TYPE_LEVEL_HIGH. I don't
know why and couldn't find a reference to that in the reference manual.
Assuming it is a level interrupt, then it makes sense to treat it as ONESHO=
T,
otherwise it would fire again immediately after handling the hard
interrupt...but it was a hard interrupt in first place - huh.

I just realize that I still miss a bit of the puzzle:
ONESHOT is doumented as:

"Interrupt is not reenabled after the hardirq handler finished. Used by
threaded interrupts which need to keep the irq line disabled until the
threaded handler has been run."

That makes perfect sense. So ONESHOT disables the irq line until the
thread_fn has completed (if it was set). Now on preempt_rt inside
irq_setup_forced_threading() we don't force threading if ONESHOT is
requested. Why is that?

So I'm left with two questions:
- Why aren't ONESHOT irq handlers forced to threaded on preempt_rt?
- Why was ONESHOT requested in first place as to my current knowledge it
  really only makes sense if a thread_fn is defined.

Did I just answer my own question? ONESHOT only makes sense if there is
a thread_fn and it is assumed that the hard handler is necessary. So
preempt_rt doesn't try to change that?

That would mean the ONESHOT in the dw100 was not necessary in first
place but didn't do any harm until preempt_rt was enabled... And if
ONSHOT is *not* set preempt_rt would automatically force the irq handler
to be threaded and set the ONESHOT flag in irq_setup_forced_threading().

So everything would be fine except that we'd still hit the timeout issue
from patch 4/4.

So if I got that right, the dw100 driver is in the unfortunate
situation, that the irq handler consists of two parts where the first
part *must* run in hard interrupt context and the second part *should* run
in hard interrupt context but it is fine if it becomes threaded due to
preempt_rt. As we can't model that, the best we can do is to always run
the second part threaded...

So patch 4/4 seems correct until we get new information about the
hardware.

Any thoughts?

Best regards,
Stefan

>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

