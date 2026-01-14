Return-Path: <linux-media+bounces-50714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9EBD2086B
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 18:24:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 469C83048C74
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 17:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5712D8773;
	Wed, 14 Jan 2026 17:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YzenFs2T"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FB62FF643;
	Wed, 14 Jan 2026 17:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768411364; cv=none; b=pX8RdZEUexXwuYRvhPfbo2fu1D1wz3W9AqLr2LgQPH/NCEmHisLqmSEtqzLjDDe1x52Pul0b+/KcsmhJyy+DSGd9o6CJsD5RyLvHdUS+XzZCK3Md1SrdrRmpEbB9zUzzFmOlU3YVay+zjKukUMR/a4ueJIs6bZV1DJsqDQk82uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768411364; c=relaxed/simple;
	bh=4mSho9ntc1U97UdaBzFzP2NPXFg0G4kuUCkpBWD4ffg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Xo9ZI1dSnVEG7r+LE8DdmLeF5ADqWDREYQx2FieiKhsG29wL7LBmv5M0HzHpuSQ7dWvJkH1+KyrBBu9IcrCLzG7XyiEypGIDSO+XEWnhux0pg6amJrGTN4hSZGdr5IwWJ9MHlz4U7lQKa/EnAgCu+/hVSSVeeRY1dEVYa3OvRgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YzenFs2T; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:b781:dff2:957:7831])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 29BC255C;
	Wed, 14 Jan 2026 18:22:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768411330;
	bh=4mSho9ntc1U97UdaBzFzP2NPXFg0G4kuUCkpBWD4ffg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YzenFs2T3Q3EEa9Y4lJHfVd4saGsTHNpqVnOix1bm7KXWNClbus4oeFsfOvRsUgMi
	 Oex4gu3Qm8fjSxAKQ39TmjXvQhZ0G05NLE7ApzDmj1xJiGRUBqZu1wXdh74jGEheW2
	 y9M8TzcjrwiYx6fWLNc7sC/ZsJAqVUV9RgdLVmF4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260112114313.woeZoGZP@linutronix.de>
References: <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com> <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-3-65af34d04fd8@ideasonboard.com> <8a8ec84e5484d7a1a5e6fac9a5238f3cae66abc3.camel@ndufresne.ca> <20260105235921.GI10026@pendragon.ideasonboard.com> <20260105193933.40485807@gandalf.local.home> <20260106004928.GL10026@pendragon.ideasonboard.com> <176771948736.12184.11458532023194713133@localhost> <20260112114313.woeZoGZP@linutronix.de>
Subject: Re: [PATCH 3/4] media: dw100: Fix kernel oops with PREEMPT_RT enabled
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Steven Rostedt <rostedt@goodmis.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, Xavier Roumegue <xavier.roumegue@oss.nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Clark Williams <clrkwllms@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date: Wed, 14 Jan 2026 18:22:34 +0100
Message-ID: <176841135424.20276.2623851494182415213@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602

Hi Sebastian,

Thanks for your support.

Quoting Sebastian Andrzej Siewior (2026-01-12 12:43:13)
> On 2026-01-06 18:11:27 [+0100], Stefan Klug wrote:
> > Hah, if I knew that :-).
> >=20
> > The pieces I have are:
> > In the DT the interrupt line is marked as IRQ_TYPE_LEVEL_HIGH. I don't
> > know why and couldn't find a reference to that in the reference manual.
>=20
> It is either a LEVEL interrupt or just marked as such. But it seems to
> behave as such.
>=20
> > Assuming it is a level interrupt, then it makes sense to treat it as ON=
ESHOT,
> > otherwise it would fire again immediately after handling the hard
> > interrupt...but it was a hard interrupt in first place - huh.
>=20
> So setting it ONESHOT while it is non-threaded does not seem to make
> sense, correct.
>=20
> > I just realize that I still miss a bit of the puzzle:
> > ONESHOT is doumented as:
> >=20
> > "Interrupt is not reenabled after the hardirq handler finished. Used by
> > threaded interrupts which need to keep the irq line disabled until the
> > threaded handler has been run."
> >=20
> > That makes perfect sense. So ONESHOT disables the irq line until the
> > thread_fn has completed (if it was set). Now on preempt_rt inside
> > irq_setup_forced_threading() we don't force threading if ONESHOT is
> > requested. Why is that?
>=20
> Because ONESHOT is usually used where there is no primary handler/ the
> primary handler does just a wake of thread.
>=20
> > So I'm left with two questions:
> > - Why aren't ONESHOT irq handlers forced to threaded on preempt_rt?
>=20
> See above. Also PREEMPT_RT just enforces the kernel command line
> threadirqs
>=20
> > - Why was ONESHOT requested in first place as to my current knowledge it
> >   really only makes sense if a thread_fn is defined.
>=20
> I would say it was a mistake and nobody noticed it. There is no visible
> difference if there is just the primary handler and the system does not
> use threadirqs (or PREEMPT_RT which enforces it).
>=20
> > Did I just answer my own question? ONESHOT only makes sense if there is
> > a thread_fn and it is assumed that the hard handler is necessary. So
> > preempt_rt doesn't try to change that?
>=20
> Yes. ONESHOT is used if the interrupt source within the IRQ chip has to
> be masked until after the thread completed. So setting ONESHOT without a
> threaded handler is dubious.
>=20
> > That would mean the ONESHOT in the dw100 was not necessary in first
> > place but didn't do any harm until preempt_rt was enabled... And if
> > ONSHOT is *not* set preempt_rt would automatically force the irq handler
> > to be threaded and set the ONESHOT flag in irq_setup_forced_threading().
>=20
> correct.
>=20
> > So everything would be fine except that we'd still hit the timeout issue
> > from patch 4/4.
> >=20
> > So if I got that right, the dw100 driver is in the unfortunate
> > situation, that the irq handler consists of two parts where the first
> > part *must* run in hard interrupt context and the second part *should* =
run
> > in hard interrupt context but it is fine if it becomes threaded due to
> > preempt_rt. As we can't model that, the best we can do is to always run
> > the second part threaded...
>=20
> So happens if you avoid the IRQF_ONESHOT? Do you still get these
> timeout errors?

I did a bit more testing and got results that I fail to completely
understand.

If I enable IRQF_ONESHOT and use the threaded_fn, on a non PREEMPT_RT
system I regularly observe the timeout message.

If I pass irqflags=3D0 and use the hard handler on a PREEMPT_RT system I
expected the same behavior (as the hard handler gets changed to be
threaded and implicitely ONESHOT is set). But I don't see the timeout
messages.

Is there anything else that I need to do on PREEMPT_RT to force the
threaded behavior besides enabling the config? Or is the irq thread
running with higher priority and therefore possibly faster?

Running irqflags=3D0 and the hard handler on a non PREEMPT_RT system
didn't have any negative side effects. So maybe that is really the
solution...

I'll ping Xavier if he has more details on the hardware.

Best regards,
Stefan

>=20
> > So patch 4/4 seems correct until we get new information about the
> > hardware.
> >=20
> > Any thoughts?
> >=20
> > Best regards,
> > Stefan
>=20
> Sebastian
>

