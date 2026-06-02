Return-Path: <linux-media+bounces-63365-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eralG8jFHmrPUwAAu9opvQ
	(envelope-from <linux-media+bounces-63365-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 14:00:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B4762DC7A
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 14:00:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=agUPZJYz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63365-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63365-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97FF030063BF
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 11:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10BC3911CA;
	Tue,  2 Jun 2026 11:52:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC47930FF2A
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 11:52:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780401163; cv=none; b=CQg5fbgWw1KMI7pirnU9jZPVC8q1o+cD/43HHsSSjw4zLKIKxkV/0+1UcKq3wSPoQlRzc9IqkD54ktsD/Nb+mM/A/zTx3QBw6Flsxg4ZXbjz7+6sdCGhhyArnBiOyyNPpQiFg+6rSUMmevwx5BsaHsXCbWHEmAgci3arVEovzsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780401163; c=relaxed/simple;
	bh=ehBMYSxVavJ4wORXzBVJaLlvMO5tac8MPJYd/wr6cXU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vF9kOtd0Nzd9bkJgt+FWMjc85zqrFqZQjzO+vJU1+1BjKbh0fIRPbnKzDAeGOw/bf7cqOfnDVs1hAirLRc22KxLX5X/RFqBtl6KOC9FfCOcpo4OYbH4RUSDZaWfb0Lz/1drhlZtUCmLglKcpKuWu7JgLLcXiCPvX39NfZ7I6ABY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=agUPZJYz; arc=none smtp.client-ip=80.241.56.152
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gV8Mg4fzLz9vP9;
	Tue,  2 Jun 2026 13:52:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780401151; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ehBMYSxVavJ4wORXzBVJaLlvMO5tac8MPJYd/wr6cXU=;
	b=agUPZJYzE94Qe5zcJx0fOfW82g4qVq8F0k0zpeFHZU2rf7gOe1h/DLO6T+A6cc9bFcSt0I
	QbuDV4ArLu4U9l8+vzZvRAiAI8OvvumGknGFR9EQ0O5nyVEwAvZuvw7e9nwSX/+PUT3Maz
	5cvAiUq+Wupz/fmpNynERnBocnK2gRMIzNKEwPJYRKiKVXKMsd0/O2aOZbbbR7rsIWiQCV
	+8ZIOMktqjN0oweuCUStzX+fAdb5ES08jogjhwkm19GJAPgKUhmNrtODiYUaygz5qv6EYV
	XVK37/k2wZlIhLVb3PpWzPr91h2qQmh5MgWfFqS/YF+wGN5xJfmJ0z5aziumQg==
Message-ID: <7a978596279eca99cd41ca46606c7e5a6a38e801.camel@mailbox.org>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Alice Ryhl <aliceryhl@google.com>, phasta@kernel.org
Cc: sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org, 
	ojeda@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>
Date: Tue, 02 Jun 2026 13:52:29 +0200
In-Reply-To: <ah7CGySkyE7mSM8a@google.com>
References: <20260530143541.229628-5-phasta@kernel.org>
	 <20260530150622.393FC1F00893@smtp.kernel.org> <ah1c3NSU-4UkdUhb@google.com>
	 <a3d09b270e6effb6f2bfb5d7ba8de48e3c2c4081.camel@mailbox.org>
	 <CAH5fLggvxGwJkAp+VqG7pA-e2zM-T8_DR0DeCiZiJyM+o51DuQ@mail.gmail.com>
	 <24ef07ed85d9e7aa7f9d3a96301c4c15bc0f2315.camel@mailbox.org>
	 <ah2M2a_4PneZpjTS@google.com>
	 <16dff07d28fca94749f14e9c91e6f812f605d6e5.camel@mailbox.org>
	 <ah7CGySkyE7mSM8a@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 0813382e04d397ed0c0
X-MBO-RS-META: pzjhtmu31zaixbi6xxhmqoj3y5qx1jx4
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,mailbox.org:from_mime,mailbox.org:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,data.data:url];
	TAGGED_FROM(0.00)[bounces-63365-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:phasta@kernel.org,m:sashiko-reviews@lists.linux.dev,m:linux-media@vger.kernel.org,m:ojeda@kernel.org,m:boris.brezillon@collabora.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0B4762DC7A

On Tue, 2026-06-02 at 11:44 +0000, Alice Ryhl wrote:
> On Tue, Jun 02, 2026 at 01:31:52PM +0200, Philipp Stanner wrote:
> > On Mon, 2026-06-01 at 13:44 +0000, Alice Ryhl wrote:
> > > On Mon, Jun 01, 2026 at 03:14:05PM +0200, Philipp Stanner wrote:
> > > > +Cc Boris
> > > >=20
> > > > On Mon, 2026-06-01 at 14:55 +0200, Alice Ryhl wrote:
> > > > > On Mon, Jun 1, 2026 at 2:34=E2=80=AFPM Philipp Stanner <phasta@ma=
ilbox.org> wrote:
> > > > > >=20
> > > > > > On Mon, 2026-06-01 at 10:20 +0000, Alice Ryhl wrote:
> > > > > > > On Sat, May 30, 2026 at 03:06:21PM +0000, sashiko-bot@kernel.=
org=C2=A0wrote:
> > > > > > > > > +impl<F: Send + Sync, C: Send + Sync> DriverFence<F, C> {
> > > > > > > > > +=C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::dm=
a_fence {
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Va=
lid because `self` is valid.
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_dat=
a =3D unsafe { &mut *self.data.as_ptr() };
> > > > > > > >=20
> > > > > > > > [Severity: High]
> > > > > > > > Does this create an exclusive mutable reference to actively=
 shared memory?
> > > > > > > >=20
> > > > > > > > DriverFenceData can be accessed concurrently by other threa=
ds holding Fence
> > > > > > > > references (for instance, when checking if the fence is sig=
naled). Creating
> > > > > > > > a mutable reference (&mut) in Rust asserts exclusive access=
 and violates
> > > > > > > > aliasing rules, which allows the compiler to make invalid o=
ptimization
> > > > > > > > assumptions.
> > > > > > > >=20
> > > > > > > > Could this use an immutable reference &*self.data.as_ptr() =
instead?
> > > > > > >=20
> > > > > > > Yes, please use an immutable reference here.
> > > > > > >=20
> > > > > > > > > +
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence_data.in=
ner.inner.get()
> > > > > > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > > > >=20
> > > > > > > > [ ... ]
> > > > > > > >=20
> > > > > > > > > +impl<F: Send + Sync, C: Send + Sync> DriverFenceBorrow<F=
, C> {
> > > > > > > > > +=C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::dm=
a_fence {
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Va=
lid because `self` is valid.
> > > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_dat=
a =3D unsafe { &mut *self.data.as_ptr() };
> > > > > > > >=20
> > > > > > > > [Severity: High]
> > > > > > > > Similar to DriverFence::as_raw(), does this also incorrectl=
y create a
> > > > > > > > mutable reference to shared data?
> > > > > > >=20
> > > > > > > Here as well.
> > > > > >=20
> > > > > > `data` is not shared. By design there is only ever one DriverFe=
nce, and
> > > > > > the driver's data (`data.data`) is `Sync`.
> > > > > >=20
> > > > > > But I guess an immutable one should do the trick, too.
> > > > >=20
> > > > > There's only one DriverFence, but I can perform shared access to =
that
> > > > > one DriverFence from two threads in parallel. You made the type S=
ync,
> > > > > and this is what you are allowing when you do so.
> > > >=20
> > > > Nope, DriverFence is just Send, not Sync.
> > > >=20
> > > > data.data is Sync, but `data` in the code above is not the actual u=
ser
> > > > data, but the memory backing it up.
> > >=20
> > > Ok, well, it probably should be Sync. I don't see any &self methods t=
hat
> > > can't be called from multiple threads in parallel.
> >=20
> > No. Why?
> >=20
> > There can only be one owner of DriverFence.
>=20
> Values normally have only one owner, and they are also normally Sync.
>=20
> > Regarding the backend_ops that might access DriverFence::data, we take
> > care to guard that.
> >=20
> > And DriverFence itself can only be owned by one party. That can only be
> > accessed by many threads if the driver stuffs that fence into something
> > that implements Sync.
>=20
> If you don't implement Sync, then DriverFence cannot be stored in an
> Arc. I wouldn't take away that ability unless you have to, and I don't
> see anything in the DriverFence API that would mean you can't do that.

Nope. We explicitly agreed on this design.

Just 1 DriverFence. Just 1 party that can signal it.
Note that we also agreed upon the Driverfence disappearing with
.signal(), which certainly prevents several from existing, unless you
do an Option.take()

>=20
> > > > > =C2=A0so even though
> > > > > the fence context may be valid for another grace period, the *poi=
nter*
> > > > > to the fence context is not. The pointer could have been zeroed b=
y the
> > > > > destructor.
> > > >=20
> > > > That particular pointer to the DriverFenceData could have been zero=
ed.
> > > > But potential other accessors have already crafted themselves a new
> > > > pointer to the, by the power of RCU, still valid data. That new poi=
nter
> > > > is container-of-ed from struct dma_fence *f.
> > >=20
> > > I'm not talking about the pointer to DriverFenceData, I'm talking abo=
ut
> > > the pointer to the FenceCtx, or the pointer to the data (if F is
> > > RcuBox).
> >=20
> > Yeah, but the backing memory is still alive. And new pointers to that
> > memory get crafted by the accessors. If a callback accesses the data
> > through `container_of(Fence)`, it gets a new pointer.
> >=20
> > So what's the problem?
> >=20
> > Where is the invalid pointer that someone is accessing?
> >=20
> > >=20
> > > The Arc type is not a type that opts-out of &mut =3D=3D exclusive, so=
 the
> > > second drop_in_place() above is assumed exclusive access to the
> > > Arc<FenceCtx<F,C>> field.
> >=20
> > OK, so I think I see the problem. So the invalid pointer is
> > Arc<FenceCtx=E2=80=A6>? And potentially the <F> pointer (although we do=
n't have
> > a picture yet as to how that would be accessed through other callbacks.
> >=20
> > > =C2=A0If another thread obtains a pointer to the
> > > FenceCtx via reading the fctx field of the DriverFence in parallel wi=
th
> > > this, then that's not allowed because the drop_in_place() call has
> > > exclusive access to that field.
> >=20
> > I think I have been asking in several of our meetings in the past
> > whether it is actually a problem to access data that has been dropped()
> > IF we know that drop does not cause UAF and the answer was kind of like
> > a "well if it does not actually get freed=E2=80=A6"
>=20
> Ok, well, IMO the simplest approach is to say you can't. There may be
> roundabout ways to do it, but I would suggest that we just ... don't.

Ack.

>=20
> > Anyways.
> >=20
> > It would seem the way to get this right is then
> >=20
> > synchronize_rcu();
> > drop_in_palace(data);
> >=20
> >=20
> > Agreed?
> >=20
> > This would then mean, however, that every time a fence drops, you have
> > to wait a grace period.
> >=20
> > Or maybe stuff DriverFenceData into an RcuBox, too, and defer its
> > dropping.
>=20
> That would work, but I think we can do better and avoid the
> synchronize_rcu() along these lines:
>=20
> unsafe trait RcuRevocable {
> =C2=A0=C2=A0=C2=A0 unsafe fn rcu_revoke_in_place(ptr: *mut Self);
> }
>=20
> This trait provides a method that's like drop_in_place(), except that
> when you use this destructor, the value remains usable for one grace
> period. You could implement it for RcuBox, and for any Copy type, and
> for ARef<T> when T is cleaned up with rcu, and probably also other
> stuff.

I mean, this cannot be magic. It also boils down to executing one RCU
callback per DriverFence dropping.

Is there a significant difference to stuffing DriverFenceData into an
RcuBox?


P.

>=20
> Alice

