Return-Path: <linux-media+bounces-64225-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o65FCbTsJmobnQIAu9opvQ
	(envelope-from <linux-media+bounces-64225-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 18:24:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4B7658AAA
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 18:24:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b="GQfwQ9/3";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64225-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64225-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9965730AA12F
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 16:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0638433A70F;
	Mon,  8 Jun 2026 16:16:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E316330B3F;
	Mon,  8 Jun 2026 16:16:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935399; cv=none; b=StmSrOJ9P6WY/Wn69n7ZQyblxVBQNOX36lFETITyyXVGY2Y9WDrrXNC+jNT+0iWFIw86XNawQwj4Md6f1uFQ81VzXWb768oOtN4PoDmg9NKK9eX2dvOk2ORXuTzF8k3ZqGPtSojFPKMIKXHH9qRaDDQcxUn6hfQpEnpgZ48fFp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935399; c=relaxed/simple;
	bh=xGGWdFLEngPDMXFB2PFmBpS6BJSHuwn10nktdwKZ0R8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TVP9M1wKFqUq++QDPRdgSnPCrrZ/iy75Iqvp4OYPOivhdFb7PYgYn/dERmt+Sh6n8bpr3xRXaauKoCddG2e7IEt4rXfszTxCzNQuQsfCN95jscdpcLfz4yb1v9oZ/SN4QWZKHfkKHvv6T9TqcBfo4QGxZzJ5yMVsD6C3rkLCVGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GQfwQ9/3; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780935396;
	bh=xGGWdFLEngPDMXFB2PFmBpS6BJSHuwn10nktdwKZ0R8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GQfwQ9/3qb1vkjn6+So3RU7ndSWdedP0nXu2OGh6mS4xaGNYDlGTtcYkA9mz3rLxI
	 vTsZZYMLOpjwwl+/qNO1Ja6r+wVYK82CYJaOWigjgReqcNpFSPVoFUQCBh7NMzmhzR
	 biASTZtd3l9gzRI+6keIxCRPat1Vgjn0riTs4LRzAYQN3zsS0DTo3pCNKjmsHxbtdU
	 N/HL1Fui8m8MYxljwhPeujev+0GqdrJMdOy0N6dDy+iPTRBc6v3brDbJFubyjKLlHH
	 JuEHZt+blaz8RW0o/NsESyKiITLp5VI+JZ9lB2BtrCY1qGnE7kjJbtgOKpjkM6hHvB
	 0IUslWtm8JH+A==
Received: from fedora-2.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B16D617E0416;
	Mon,  8 Jun 2026 18:16:35 +0200 (CEST)
Date: Mon, 8 Jun 2026 18:16:30 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Alice Ryhl <aliceryhl@google.com>, Daniel
 Almeida <dwlsalmeida@gmail.com>, Gary Guo <gary@garyguo.net>, Tvrtko
 Ursulin <tvrtko.ursulin@igalia.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
Message-ID: <20260608181630.20145d1c@fedora-2.home>
In-Reply-To: <256dc5ae3529e2548c4151af34a540476ac928c1.camel@mailbox.org>
References: <20260608142436.265820-2-phasta@kernel.org>
	<20260608170112.24fd92df@fedora-2.home>
	<6bdbdb6541392c6ea58e0035f0b20ac3c8f3e54e.camel@mailbox.org>
	<DJ3RRRX6JY4M.LCRKJ074W9DQ@kernel.org>
	<256dc5ae3529e2548c4151af34a540476ac928c1.camel@mailbox.org>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64225-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@mailbox.org,m:phasta@kernel.org,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,amd.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C4B7658AAA

On Mon, 08 Jun 2026 17:30:58 +0200
Philipp Stanner <phasta@mailbox.org> wrote:

> On Mon, 2026-06-08 at 17:23 +0200, Danilo Krummrich wrote:
> > On Mon Jun 8, 2026 at 5:17 PM CEST, Philipp Stanner wrote: =20
> > > On Mon, 2026-06-08 at 17:01 +0200, Boris Brezillon wrote: =20
> > > > On Mon,=C2=A0 8 Jun 2026 16:24:37 +0200
> > > > Philipp Stanner <phasta@kernel.org> wrote:
> > > >  =20
> > > > > @@ -1020,11 +1024,20 @@ EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> > > > > =C2=A0void dma_fence_set_deadline(struct dma_fence *fence, ktime_=
t deadline)
> > > > > =C2=A0{
> > > > > =C2=A0	const struct dma_fence_ops *ops;
> > > > > +	unsigned long flags;
> > > > > =C2=A0
> > > > > =C2=A0	rcu_read_lock();
> > > > > =C2=A0	ops =3D rcu_dereference(fence->ops);
> > > > > -	if (ops && ops->set_deadline && !dma_fence_is_signaled(fence))
> > > > > +	if (!ops || !ops->set_deadline) {
> > > > > +		rcu_read_unlock();
> > > > > +		return;
> > > > > +	}
> > > > > +
> > > > > +	dma_fence_lock_irqsave(fence, flags);
> > > > > +	if (!dma_fence_is_signaled_locked(fence))
> > > > > =C2=A0		ops->set_deadline(fence, deadline); =20
> > > >=20
> > > > You can't take the fence lock around ->set_deadline(), otherwise yo=
u'll
> > > > deadlock here [1] or here [2].
> > > >  =20
> > > > > +
> > > > > +	dma_fence_unlock_irqrestore(fence, flags);
> > > > > =C2=A0	rcu_read_unlock();
> > > > > =C2=A0} =20
> > > >=20
> > > >=20
> > > > [1]https://elixir.bootlin.com/linux/v7.0.11/source/drivers/dma-buf/=
sw_sync.c#L182
> > > > [2]https://elixir.bootlin.com/linux/v7.0.11/source/drivers/gpu/drm/=
msm/msm_fence.c#L139 =20
>=20
> Oh, MSM actually doesn't btw, that's a false positive. That's a
> distinct spinlock on their fence context object.

It's not, it's the same lock they attach to all their fences coming
from this context. It's just that this lock appears to be per-context,
like is the case for basically every driver, since the inline lock was
introduced only in this release cycle.

Anyway, this is all stuff we can fix if people think it's okay to
protect dma_fence_ops calls with the fence lock. But my point remains:
each op has its own locking-rules, some are called with the fence lock
held (enable_signaling(), signaled()), others are not (set_deadline(),
get_xxx_name()), so we need to carefully audit each of those to make
sure:

- calling with the lock held in the new places is not causing a
  deadlock
- the returned data, if not a scalar, is protected by the RCU read lock
- any driver implementing ops that can be called without the lock held
  need to hold on the device data for an RCU grace period

The last bullet is probably the one I'm the most worried about, because
instead of a single rule that applies to all ops, we have various cases
based on whether some ops are implemented or not, but that's already
the case with deprecated ops like .release() or .wait(), so maybe
that's okay with the proper doc.

If I were to choose, I'd probably go for a dedicated rwlock_t to
protect dma_fence_ops, so we can:

- protect all dma_buf_ops::xx() consistently no matter the kind of op
- protect returned data (get_xxx_name()) with this lock instead of the
  RCU read lock

But the overhead of this extra lock might not be acceptable, dunno.

>=20
>=20
> But yes, before we could upstream this, we would go through all the
> implementors like Danilo did, to find all the others.

There's the two I pointed out, plus the array/chain containers I
mentioned, which are not problematic.

