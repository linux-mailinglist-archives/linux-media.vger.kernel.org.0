Return-Path: <linux-media+bounces-63565-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N3y4AL33H2qMtQAAu9opvQ
	(envelope-from <linux-media+bounces-63565-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:45:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 517A7636468
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:45:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=OzE5oL9t;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63565-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63565-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4BA730528B2
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 09:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7EA39D3D3;
	Wed,  3 Jun 2026 09:37:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B03D374E60
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 09:36:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780479421; cv=none; b=SbU/D2YJzjwDfvj5s3rSVIY7W1fstJGL5eK3K+Yvme5Yv0kv9n7FaDxH3URmf6j1jr+crnGd6RCi1XzWDkZQtCLfLqw0AVqm0GRAyLpbNvKOjBvkCbcfRpxAiCm3uvh6zYjmmyx5yQ3f+uX/912Bez/5W7q9ok25LZvKVqOACd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780479421; c=relaxed/simple;
	bh=h8djJ8nOonrKrb47UsNgATKFIiMF4T+HjyMVYMHxJ6w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WKZzDMUGk3f1khpoCu3xhGo0SQbip2xDugex/OKcjitCC1I9DGYuk0YUxRTrlgjSCWUKWPZQmdez58kUX87ASaozgiROqbF+1DCmVzzQ7yE21jFO5CGGPj6r3Bh1KFFq59nNnABtW/ZZBTcOKoNfB0dkzhxzt+NPkHfrXGURsbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OzE5oL9t; arc=none smtp.client-ip=80.241.56.161
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gVjJl6Y9jz9v01;
	Wed,  3 Jun 2026 11:36:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780479416; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h8djJ8nOonrKrb47UsNgATKFIiMF4T+HjyMVYMHxJ6w=;
	b=OzE5oL9tkicd111wF8q/XjrzMcD+7UDhNIszNZg99VAAObs3+jcezsVftNyouCKQS73gYZ
	ZL22UFaefH2Lz6sifS+3qk0BbVk0s4QEXDgkna4YiMiQdZ+wthMrTGLU8iJY4mmjlDzF1Z
	fz3jUEYfzzRNBdggcEt/BnguaHDgBReUwybiyCAEpRB3lRGAY5tW0fXHQGEp3MVjChzW7R
	ebl82n1P5rK3vMgK8BRKH8m8adBoNCr+oqliO/saDy36/U5dkMdJpouNIP7Plit3GKkANJ
	+gpugm8OT7L+cz0RyankJ25f8NV2KyHuy4Dtv1u5CL7kA4u2dUuPCkuz9I+hYg==
Message-ID: <978051d39afd2d1455fffedd8b5f057743a96d2b.camel@mailbox.org>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Alice Ryhl <aliceryhl@google.com>, phasta@kernel.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org,
 ojeda@kernel.org,  Danilo Krummrich	 <dakr@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,  Gary Guo
 <gary@garyguo.net>, Daniel Almeida <daniel.almeida@collabora.com>
Date: Wed, 03 Jun 2026 11:36:53 +0200
In-Reply-To: <CAH5fLgjHwJtxBN=RJazkPWEMEp0P_S2f6YMByTi1CAmvGA4jOQ@mail.gmail.com>
References: <ah1c3NSU-4UkdUhb@google.com>
	 <a3d09b270e6effb6f2bfb5d7ba8de48e3c2c4081.camel@mailbox.org>
	 <CAH5fLggvxGwJkAp+VqG7pA-e2zM-T8_DR0DeCiZiJyM+o51DuQ@mail.gmail.com>
	 <24ef07ed85d9e7aa7f9d3a96301c4c15bc0f2315.camel@mailbox.org>
	 <ah2M2a_4PneZpjTS@google.com>
	 <16dff07d28fca94749f14e9c91e6f812f605d6e5.camel@mailbox.org>
	 <ah7CGySkyE7mSM8a@google.com>
	 <7a978596279eca99cd41ca46606c7e5a6a38e801.camel@mailbox.org>
	 <ah7FjDdU6zt65qId@google.com>
	 <4bf6e916efe54bab66defda6fffea8c41358b3cc.camel@mailbox.org>
	 <ah72Bi2Q5Wpgo2kE@google.com>
	 <3c7e4db139df7cea18bc683d6dd33da2d00f0358.camel@mailbox.org>
	 <20260603084805.5e0e23ea@fedora-2.home>
	 <aa11e74f419b02c0e4fe417face43e7d05e62783.camel@mailbox.org>
	 <13dd6698fc812508abe40164b14d16efe2ed53d2.camel@mailbox.org>
	 <CAH5fLgjHwJtxBN=RJazkPWEMEp0P_S2f6YMByTi1CAmvGA4jOQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: db23a4a21cc6c22120b
X-MBO-RS-META: cryqwuwdzjkqixd3za3tm5pcdpxizt7f
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63565-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:phasta@kernel.org,m:boris.brezillon@collabora.com,m:sashiko-reviews@lists.linux.dev,m:linux-media@vger.kernel.org,m:ojeda@kernel.org,m:dakr@kernel.org,m:christian.koenig@amd.com,m:gary@garyguo.net,m:daniel.almeida@collabora.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mailbox.org:mid,mailbox.org:dkim,mailbox.org:from_mime,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 517A7636468

On Wed, 2026-06-03 at 11:26 +0200, Alice Ryhl wrote:
> On Wed, Jun 3, 2026 at 11:07=E2=80=AFAM Philipp Stanner <phasta@mailbox.o=
rg> wrote:
> >=20
> > On Wed, 2026-06-03 at 09:43 +0200, Philipp Stanner wrote:
> > > On Wed, 2026-06-03 at 08:48 +0200, Boris Brezillon wrote:
> > > > On Wed, 03 Jun 2026 08:10:51 +0200
> > > > Philipp Stanner <phasta@mailbox.org> wrote:
> > > >=20
> > > > > +Cc Danilo, Gary, Daniel, Christian
> > > > > (who seem to have been lost because Sashiko dropped them and this=
 thread is a reply to that tool)
> > > > >=20
> > > > >=20
> > > > > On Tue, 2026-06-02 at 15:25 +0000, Alice Ryhl wrote:
> > > > > > On Tue, Jun 02, 2026 at 02:06:43PM +0200, Philipp Stanner wrote=
:
> > > > > > > On Tue, 2026-06-02 at 11:59 +0000, Alice Ryhl wrote:
> > > > > > > > On
> > > > > > >=20
> > > > > > > [=E2=80=A6]
> > > > > > >=20
> > > > > > > > > >=20
> > > > > > > > > > If you don't implement Sync, then DriverFence cannot be=
 stored in an
> > > > > > > > > > Arc. I wouldn't take away that ability unless you have =
to, and I don't
> > > > > > > > > > see anything in the DriverFence API that would mean you=
 can't do that.
> > > > > > > > >=20
> > > > > > > > > Nope. We explicitly agreed on this design.
> > > > > > > > >=20
> > > > > > > > > Just 1 DriverFence. Just 1 party that can signal it.
> > > > > > > > > Note that we also agreed upon the Driverfence disappearin=
g with
> > > > > > > > > .signal(), which certainly prevents several from existing=
, unless you
> > > > > > > > > do an Option.take()
> > > > > > > >=20
> > > > > > > > I would like to clarify that I'm not suggesting any changes=
 to the
> > > > > > > > design. Implementing Sync is not the same as having multipl=
e driver
> > > > > > > > fences.
> > > > > > >=20
> > > > > > > I mean, I guess one can do that. But it's up to the driver th=
en to see how it can signal its fence.
> > > > > >=20
> > > > > > I don't believe Sync changes anything with that regard. The sig=
nal
> > > > > > method takes 'self', but the Sync trait only affects how '&self=
' methods
> > > > > > can be called.
> > > > > >=20
> > > > > > > > > > > > > > =C2=A0so even though
> > > > > > > > > > > > > > the fence context may be valid for another grac=
e period, the *pointer*
> > > > > > > > > > > > > > to the fence context is not. The pointer could =
have been zeroed by the
> > > > > > > > > > > > > > destructor.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > That particular pointer to the DriverFenceData co=
uld have been zeroed.
> > > > > > > > > > > > > But potential other accessors have already crafte=
d themselves a new
> > > > > > > > > > > > > pointer to the, by the power of RCU, still valid =
data. That new pointer
> > > > > > > > > > > > > is container-of-ed from struct dma_fence *f.
> > > > > > > > > > > >=20
> > > > > > > > > > > > I'm not talking about the pointer to DriverFenceDat=
a, I'm talking about
> > > > > > > > > > > > the pointer to the FenceCtx, or the pointer to the =
data (if F is
> > > > > > > > > > > > RcuBox).
> > > > > > > > > > >=20
> > > > > > > > > > > Yeah, but the backing memory is still alive. And new =
pointers to that
> > > > > > > > > > > memory get crafted by the accessors. If a callback ac=
cesses the data
> > > > > > > > > > > through `container_of(Fence)`, it gets a new pointer.
> > > > > > > > > > >=20
> > > > > > > > > > > So what's the problem?
> > > > > > > > > > >=20
> > > > > > > > > > > Where is the invalid pointer that someone is accessin=
g?
> > > > > > > > > > >=20
> > > > > > > > > > > >=20
> > > > > > > > > > > > The Arc type is not a type that opts-out of &mut =
=3D=3D exclusive, so the
> > > > > > > > > > > > second drop_in_place() above is assumed exclusive a=
ccess to the
> > > > > > > > > > > > Arc<FenceCtx<F,C>> field.
> > > > > > > > > > >=20
> > > > > > > > > > > OK, so I think I see the problem. So the invalid poin=
ter is
> > > > > > > > > > > Arc<FenceCtx=E2=80=A6>? And potentially the <F> point=
er (although we don't have
> > > > > > > > > > > a picture yet as to how that would be accessed throug=
h other callbacks.
> > > > > > > > > > >=20
> > > > > > > > > > > > =C2=A0If another thread obtains a pointer to the
> > > > > > > > > > > > FenceCtx via reading the fctx field of the DriverFe=
nce in parallel with
> > > > > > > > > > > > this, then that's not allowed because the drop_in_p=
lace() call has
> > > > > > > > > > > > exclusive access to that field.
> > > > > > > > > > >=20
> > > > > > > > > > > I think I have been asking in several of our meetings=
 in the past
> > > > > > > > > > > whether it is actually a problem to access data that =
has been dropped()
> > > > > > > > > > > IF we know that drop does not cause UAF and the answe=
r was kind of like
> > > > > > > > > > > a "well if it does not actually get freed=E2=80=A6"
> > > > > > > > > >=20
> > > > > > > > > > Ok, well, IMO the simplest approach is to say you can't=
. There may be
> > > > > > > > > > roundabout ways to do it, but I would suggest that we j=
ust ... don't.
> > > > > > > > >=20
> > > > > > > > > Ack.
> > > > > > > > >=20
> > > > > > > > > >=20
> > > > > > > > > > > Anyways.
> > > > > > > > > > >=20
> > > > > > > > > > > It would seem the way to get this right is then
> > > > > > > > > > >=20
> > > > > > > > > > > synchronize_rcu();
> > > > > > > > > > > drop_in_palace(data);
> > > > > > > > > > >=20
> > > > > > > > > > >=20
> > > > > > > > > > > Agreed?
> > > > > > > > > > >=20
> > > > > > > > > > > This would then mean, however, that every time a fenc=
e drops, you have
> > > > > > > > > > > to wait a grace period.
> > > > > > > > > > >=20
> > > > > > > > > > > Or maybe stuff DriverFenceData into an RcuBox, too, a=
nd defer its
> > > > > > > > > > > dropping.
> > > > > > > > > >=20
> > > > > > > > > > That would work, but I think we can do better and avoid=
 the
> > > > > > > > > > synchronize_rcu() along these lines:
> > > > > > > > > >=20
> > > > > > > > > > unsafe trait RcuRevocable {
> > > > > > > > > > =C2=A0=C2=A0=C2=A0 unsafe fn rcu_revoke_in_place(ptr: *=
mut Self);
> > > > > > > > > > }
> > > > > > > > > >=20
> > > > > > > > > > This trait provides a method that's like drop_in_place(=
), except that
> > > > > > > > > > when you use this destructor, the value remains usable =
for one grace
> > > > > > > > > > period. You could implement it for RcuBox, and for any =
Copy type, and
> > > > > > > > > > for ARef<T> when T is cleaned up with rcu, and probably=
 also other
> > > > > > > > > > stuff.
> > > > > > > > >=20
> > > > > > > > > I mean, this cannot be magic. It also boils down to execu=
ting one RCU
> > > > > > > > > callback per DriverFence dropping.
> > > > > > > > >=20
> > > > > > > > > Is there a significant difference to stuffing DriverFence=
Data into an
> > > > > > > > > RcuBox?
> > > > > > > >=20
> > > > > > > > Do you mean hard-coding that the user-data of a driver fenc=
e is always
> > > > > > > > stored in an RcuBox?
> > > > > > >=20
> > > > > > >=20
> > > > > > > I'm talking about this:
> > > > > > >=20
> > > > > > >=20
> > > > > > >=20
> > > > > > > impl<F: Send + Sync + DriverFenceAllowedData, C: Send + Sync>=
 DriverFenceAllocation<F, C> {
> > > > > > > =C2=A0=C2=A0=C2=A0 /// Create a new allocation slot that can =
later be used to create a fully
> > > > > > > =C2=A0=C2=A0=C2=A0 /// initialized [`DriverFence`] without th=
e need to allocate.
> > > > > > > =C2=A0=C2=A0=C2=A0 pub fn new(fctx: Arc<FenceCtx<F, C>>, data=
: F) -> Result<Self> {
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data =3D=
 DriverFenceData {
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 // `inner` remains uninitialized until a [`DriverFence`] takes over.
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 inner: Fence {
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inner: Opaque::uninit(),
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 },
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 fctx,
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 data,
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > > > >=20
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // In order to sup=
port the C dma_fence callbacks, it is necessary for
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // a `Fence` and a=
 `DriverFence` to live in the same allocation,
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // because the C b=
ackend passes a dma_fence, from which the driver most
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // likely wants to=
 be able to access its `data` in `DriverFence`.
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Hence, we need =
the manage the memory manually. It will be freed by the
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // C backend autom=
atically once the refcount within `Fence` drops to 0.
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let data =3D RcuBo=
x::new(fence_data, GFP_KERNEL | __GFP_ZERO)?;
> > > > > > >=20
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(Self { data })
> > > > > > > =C2=A0=C2=A0=C2=A0 }
> > > > > > >=20
> > > > > > >=20
> > > > > > > This way, the entire DriverFenceData will remain valid for an
> > > > > > > additional grace period. I suppose this would solve your poin=
ter-
> > > > > > > invalid concern.
> > > > > > >=20
> > > > > > > However, it appears like overkill to me because the refcounti=
ng + C
> > > > > > > backend already ensure that nothing drops too soon, and the b=
ackend
> > > > > > > frees with kfree_rcu(), so=E2=80=A6
> > > > > >=20
> > > > > > I agree that it doesn't sound like we want RcuBox here.
> > > > > >=20
> > > > > > What kind of metadata are we actually planning to store in the
> > > > > > DriverFence in practice?
> > > > >=20
> > > > > I suppose it might be GPUVM payloads. IIRC in Tyr it's currently =
just
> > > > > empty structs as some sort of identifier. I guess copies of the a=
ctual
> > > > > command buffers will also reside in their associated fences.
> > > > >=20
> > > > > But Boris, Daniel and Danilo probably have something smart to say=
 about
> > > > > that.
> > > >=20
> > > > In Tyr we don't need any, because we're using SW signalling: we get=
 an
> > > > interrupt, look at our HW fence seqno, and walk the set of pending
> > > > fences to signal them with the ::signal() method (that's an
> > > > over-simplified view of it, but functionally that's how it works).
> > > >=20
> > > > Now, the question is more, what drivers planning to support HW
> > > > signaling want attached to the DriverFence. My gut feeling is that =
now
> > > > that we have a way to get back to the FenceCtx, and given that Fenc=
eCtx
> > > > also has driver-specific data attached to it, most common use cases
> > > > where the fence contains a backpointer to its timeline/creator are
> > > > covered. If I look at nouveau_fence [1] (I intentionally looked at =
the
> > > > most likely next user of this) for instance:
> > > >=20
> > > > struct nouveau_fence {
> > > > =C2=A0=C2=A0=C2=A0 struct dma_fence base;
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0 struct list_head head;
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0 struct nouveau_channel __rcu *channel;
> > > > =C2=A0=C2=A0=C2=A0 unsigned long timeout;
> > > > };
> > >=20
> > > Thx for the explanation
> > >=20
> > > >=20
> > > > - channel is basically the FenceCtx in your new design
> > > > - head is used to insert the fence in the fence context list. Not t=
oo
> > > > =C2=A0 sure how it translates in rust (insertion in an XArray inste=
ad?).
> > > > =C2=A0 Anyway, that's just stuff you need to make your fence part o=
f the
> > > > =C2=A0 context timeline, so it's again related to how you link a fe=
nce to
> > > > =C2=A0 its context and let the context walk back pending fences whe=
n it
> > > > =C2=A0 needs to. Feels like my original FenceTimeline abstract prop=
osal [2]
> > > > =C2=A0 could help make this thing generic, but let's reconsider thi=
s once
> > > > =C2=A0 we've got the basics sorted out, please
> > > > - timeout is probably the only thing of interest here, assuming thi=
ngs
> > > > =C2=A0 can be signaled out of order (if they are signaled in order,=
 like is
> > > > =C2=A0 the case in Tyr, the timeout can just be on the FenceCtxData=
 and
> > > > =C2=A0 represent the timeout of the first fence in the set). Anyway=
, that's a
> > > > =C2=A0 scalar, so no fancy ::drop() needed if that's what you're wo=
rried
> > > > =C2=A0 about
> > >=20
> > > What we / Alice are worried about is multiple things.
> > >=20
> > > One issue is that Alice believes that
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self.data` is =
owned by the DriverFence, but could be accessed
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // through some dma_fence =
callbacks right now. Access is being revoked
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // above by signalling the=
 fence. The DriverFenceSafeToDrop trait
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ensures that the data e=
ither does not need drop, or if it does it
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // lives in a RcuBox which=
 will delay dropping by one grace period, hence
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ensuring that all reade=
rs have disappeared.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { drop_in_place(sel=
f.data.as_ptr()) };
> > >=20
> > >=20
> > > from DriverFence::drop() invalidates the pointers that thread A
> > > accesses, even if DriverFence::data.data's drop is delayed with RCU.
> > >=20
> > > Now if thread B drops DriverFence, thread A could use invalid pointer=
s,
> > > but while still operating on non-deallocated memory (because our
> > > refcounting guards against that).
> > >=20
> > > The only way I can see to make that bullet proof would be to do
> > > synchronize_rcu() before the drop_in_place() above =E2=80=93 but that=
 would
> > > mean that we delay each fence drop by one grace period.
> > >=20
> > > I'm still not sure how real the problem really is, though. Because
> > > refcounting guards, and drop() doesn't actually *do* something to the
> > > pointers, or does it?
> >=20
> >=20
> > Re: this, brainstorming a bit:
> >=20
> > An idea that has been floating in my head for a while is whether
> > Revocable might be a good choice for a job like this.
> >=20
> > The reason against it is that we already *have* a Revocable: the
> > dma_fence. It guards with an atomic boolean (signaled bit) + RCU, just
> > like Revocable.
> >=20
> > I think it might give the formal protection that Alice desires, but
> > then we'd have the same mechanism twice.
>=20
> We could also just start with only supporting types that are Copy.
> That'd be really simple because no drop is required.

Didn't you just point out that it's explicitly the fctx: Arc<FenceCtx>
pointer that is becoming invalid?

That will remain the case, no matter what kind of payload generic data
the user passes. These are layered, related but distinct issues. See
get_timeline_name().


P.

>=20
> Alice

