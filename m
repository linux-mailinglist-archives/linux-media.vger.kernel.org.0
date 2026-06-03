Return-Path: <linux-media+bounces-63568-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3MI2Ldj5H2oHtgAAu9opvQ
	(envelope-from <linux-media+bounces-63568-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:54:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F09636570
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:54:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b="p/tHQGA9";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63568-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63568-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 586E6305B540
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 09:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7426C449EB1;
	Wed,  3 Jun 2026 09:53:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6854543E9FD
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 09:52:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780480379; cv=none; b=RLhtTDE6Bopg8zNJIIY1NkadEhII9ci278CdznNtWmxGaK1nSJWDaM2sSxa4H88nKfy1xb6UGyWauob3v9j5ku2fkIcMLL0vuk6+yzhQQl8sISvJ+yQDiVzT2OL/tL1VYsvaYf6tSZjxt5X4FdmDOQfMQdtMd1sOe4ciJvkHI8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780480379; c=relaxed/simple;
	bh=hsaNx7nKtNZKqi62InoYE6OCRy0g/xMUXPZU8Xg8SbI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MXR9Ywq95y4tlBoqXD761Ga4nJWmR1lZC8BN85D6a6DolLCYzZXZsjGqEpFoLZg9aQGHLBdMeJqn/7Xg4tMTcJgYUDPmmEuUdytrW6N7I+a0S57w6FFgpBf9qzLCD/I5HB2PjsXEcJRolUIhDLUVnVfMvrVCL8P4GSJzrc0m2jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=p/tHQGA9; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780480372;
	bh=hsaNx7nKtNZKqi62InoYE6OCRy0g/xMUXPZU8Xg8SbI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=p/tHQGA9OOGpBiyRS0QysTKQjljJbFhOmKbLLFMg/H3aD5tLXc1Q78Cfa8LCbAb8q
	 UoBfvwJLJlyKNhcBC+UCkXTu4m4SQvj5qlfqSVSrt/1bTRPrHA8iA1A3tBxYrCdj8D
	 YYlJay5U7NoPStuxWK2ZIWg7sx6uR7ENKbY31RG3s7FaYnxwxRTofrtw+QyC6UYBgB
	 G7V3f1QY//uXEiUWxhLoLJK804BxRWvM7oZnuCR0dBUzAtWc6f7H3cwJ+n659SOxxz
	 ZwnTr0gXT1tz8VLSudNqpooTV34yR76QFKG/NyxVAp8QOdIhCCBee47icBXkfsptNX
	 ZAi4cd98rdy5g==
Received: from fedora-2.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CBF8417E05FC;
	Wed,  3 Jun 2026 11:52:51 +0200 (CEST)
Date: Wed, 3 Jun 2026 11:52:47 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Alice Ryhl <aliceryhl@google.com>,
 sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org,
 ojeda@kernel.org, Danilo Krummrich	 <dakr@kernel.org>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Gary Guo
 <gary@garyguo.net>, Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
Message-ID: <20260603115247.21ee5d1d@fedora-2.home>
In-Reply-To: <aa11e74f419b02c0e4fe417face43e7d05e62783.camel@mailbox.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@mailbox.org,m:phasta@kernel.org,m:aliceryhl@google.com,m:sashiko-reviews@lists.linux.dev,m:linux-media@vger.kernel.org,m:ojeda@kernel.org,m:dakr@kernel.org,m:christian.koenig@amd.com,m:gary@garyguo.net,m:daniel.almeida@collabora.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-63568-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,vger.kernel.org:from_smtp,collabora.com:from_mime,collabora.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51F09636570

On Wed, 03 Jun 2026 09:43:55 +0200
Philipp Stanner <phasta@mailbox.org> wrote:

> On Wed, 2026-06-03 at 08:48 +0200, Boris Brezillon wrote:
> > On Wed, 03 Jun 2026 08:10:51 +0200
> > Philipp Stanner <phasta@mailbox.org> wrote:
> >  =20
> > > +Cc Danilo, Gary, Daniel, Christian
> > > (who seem to have been lost because Sashiko dropped them and this thr=
ead is a reply to that tool)
> > >=20
> > >=20
> > > On Tue, 2026-06-02 at 15:25 +0000, Alice Ryhl wrote: =20
> > > > On Tue, Jun 02, 2026 at 02:06:43PM +0200, Philipp Stanner wrote:=C2=
=A0 =20
> > > > > On Tue, 2026-06-02 at 11:59 +0000, Alice Ryhl wrote:=C2=A0  =20
> > > > > > On=C2=A0=C2=A0  =20
> > > > >=20
> > > > > [=E2=80=A6]
> > > > > =C2=A0  =20
> > > > > > > >=20
> > > > > > > > If you don't implement Sync, then DriverFence cannot be sto=
red in an
> > > > > > > > Arc. I wouldn't take away that ability unless you have to, =
and I don't
> > > > > > > > see anything in the DriverFence API that would mean you can=
't do that.=C2=A0  =20
> > > > > > >=20
> > > > > > > Nope. We explicitly agreed on this design.
> > > > > > >=20
> > > > > > > Just 1 DriverFence. Just 1 party that can signal it.
> > > > > > > Note that we also agreed upon the Driverfence disappearing wi=
th
> > > > > > > .signal(), which certainly prevents several from existing, un=
less you
> > > > > > > do an Option.take()=C2=A0  =20
> > > > > >=20
> > > > > > I would like to clarify that I'm not suggesting any changes to =
the
> > > > > > design. Implementing Sync is not the same as having multiple dr=
iver
> > > > > > fences.=C2=A0  =20
> > > > >=20
> > > > > I mean, I guess one can do that. But it's up to the driver then t=
o see how it can signal its fence.=C2=A0  =20
> > > >=20
> > > > I don't believe Sync changes anything with that regard. The signal
> > > > method takes 'self', but the Sync trait only affects how '&self' me=
thods
> > > > can be called.
> > > > =C2=A0  =20
> > > > > > > > > > > > =C2=A0so even though
> > > > > > > > > > > > the fence context may be valid for another grace pe=
riod, the *pointer*
> > > > > > > > > > > > to the fence context is not. The pointer could have=
 been zeroed by the
> > > > > > > > > > > > destructor.=C2=A0  =20
> > > > > > > > > > >=20
> > > > > > > > > > > That particular pointer to the DriverFenceData could =
have been zeroed.
> > > > > > > > > > > But potential other accessors have already crafted th=
emselves a new
> > > > > > > > > > > pointer to the, by the power of RCU, still valid data=
. That new pointer
> > > > > > > > > > > is container-of-ed from struct dma_fence *f.=C2=A0  =
=20
> > > > > > > > > >=20
> > > > > > > > > > I'm not talking about the pointer to DriverFenceData, I=
'm talking about
> > > > > > > > > > the pointer to the FenceCtx, or the pointer to the data=
 (if F is
> > > > > > > > > > RcuBox).=C2=A0  =20
> > > > > > > > >=20
> > > > > > > > > Yeah, but the backing memory is still alive. And new poin=
ters to that
> > > > > > > > > memory get crafted by the accessors. If a callback access=
es the data
> > > > > > > > > through `container_of(Fence)`, it gets a new pointer.
> > > > > > > > >=20
> > > > > > > > > So what's the problem?
> > > > > > > > >=20
> > > > > > > > > Where is the invalid pointer that someone is accessing?
> > > > > > > > > =C2=A0  =20
> > > > > > > > > >=20
> > > > > > > > > > The Arc type is not a type that opts-out of &mut =3D=3D=
 exclusive, so the
> > > > > > > > > > second drop_in_place() above is assumed exclusive acces=
s to the
> > > > > > > > > > Arc<FenceCtx<F,C>> field.=C2=A0  =20
> > > > > > > > >=20
> > > > > > > > > OK, so I think I see the problem. So the invalid pointer =
is
> > > > > > > > > Arc<FenceCtx=E2=80=A6>? And potentially the <F> pointer (=
although we don't have
> > > > > > > > > a picture yet as to how that would be accessed through ot=
her callbacks.
> > > > > > > > > =C2=A0  =20
> > > > > > > > > > =C2=A0If another thread obtains a pointer to the
> > > > > > > > > > FenceCtx via reading the fctx field of the DriverFence =
in parallel with
> > > > > > > > > > this, then that's not allowed because the drop_in_place=
() call has
> > > > > > > > > > exclusive access to that field.=C2=A0  =20
> > > > > > > > >=20
> > > > > > > > > I think I have been asking in several of our meetings in =
the past
> > > > > > > > > whether it is actually a problem to access data that has =
been dropped()
> > > > > > > > > IF we know that drop does not cause UAF and the answer wa=
s kind of like
> > > > > > > > > a "well if it does not actually get freed=E2=80=A6"=C2=A0=
  =20
> > > > > > > >=20
> > > > > > > > Ok, well, IMO the simplest approach is to say you can't. Th=
ere may be
> > > > > > > > roundabout ways to do it, but I would suggest that we just =
... don't.=C2=A0  =20
> > > > > > >=20
> > > > > > > Ack.
> > > > > > > =C2=A0  =20
> > > > > > > > =C2=A0  =20
> > > > > > > > > Anyways.
> > > > > > > > >=20
> > > > > > > > > It would seem the way to get this right is then
> > > > > > > > >=20
> > > > > > > > > synchronize_rcu();
> > > > > > > > > drop_in_palace(data);
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > Agreed?
> > > > > > > > >=20
> > > > > > > > > This would then mean, however, that every time a fence dr=
ops, you have
> > > > > > > > > to wait a grace period.
> > > > > > > > >=20
> > > > > > > > > Or maybe stuff DriverFenceData into an RcuBox, too, and d=
efer its
> > > > > > > > > dropping.=C2=A0  =20
> > > > > > > >=20
> > > > > > > > That would work, but I think we can do better and avoid the
> > > > > > > > synchronize_rcu() along these lines:
> > > > > > > >=20
> > > > > > > > unsafe trait RcuRevocable {
> > > > > > > > =C2=A0=C2=A0=C2=A0 unsafe fn rcu_revoke_in_place(ptr: *mut =
Self);
> > > > > > > > }
> > > > > > > >=20
> > > > > > > > This trait provides a method that's like drop_in_place(), e=
xcept that
> > > > > > > > when you use this destructor, the value remains usable for =
one grace
> > > > > > > > period. You could implement it for RcuBox, and for any Copy=
 type, and
> > > > > > > > for ARef<T> when T is cleaned up with rcu, and probably als=
o other
> > > > > > > > stuff.=C2=A0  =20
> > > > > > >=20
> > > > > > > I mean, this cannot be magic. It also boils down to executing=
 one RCU
> > > > > > > callback per DriverFence dropping.
> > > > > > >=20
> > > > > > > Is there a significant difference to stuffing DriverFenceData=
 into an
> > > > > > > RcuBox?=C2=A0  =20
> > > > > >=20
> > > > > > Do you mean hard-coding that the user-data of a driver fence is=
 always
> > > > > > stored in an RcuBox?=C2=A0  =20
> > > > >=20
> > > > >=20
> > > > > I'm talking about this:
> > > > >=20
> > > > >=20
> > > > >=20
> > > > > impl<F: Send + Sync + DriverFenceAllowedData, C: Send + Sync> Dri=
verFenceAllocation<F, C> {
> > > > > =C2=A0=C2=A0=C2=A0 /// Create a new allocation slot that can late=
r be used to create a fully
> > > > > =C2=A0=C2=A0=C2=A0 /// initialized [`DriverFence`] without the ne=
ed to allocate.
> > > > > =C2=A0=C2=A0=C2=A0 pub fn new(fctx: Arc<FenceCtx<F, C>>, data: F)=
 -> Result<Self> {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data =3D Dri=
verFenceData {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 // `inner` remains uninitialized until a [`DriverFence`] takes over.
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 inner: Fence {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 inner: Opaque::uninit(),
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 },
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 fctx,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 data,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // In order to support=
 the C dma_fence callbacks, it is necessary for
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // a `Fence` and a `Dr=
iverFence` to live in the same allocation,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // because the C backe=
nd passes a dma_fence, from which the driver most
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // likely wants to be =
able to access its `data` in `DriverFence`.
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Hence, we need the =
manage the memory manually. It will be freed by the
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // C backend automatic=
ally once the refcount within `Fence` drops to 0.
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let data =3D RcuBox::n=
ew(fence_data, GFP_KERNEL | __GFP_ZERO)?;
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(Self { data })
> > > > > =C2=A0=C2=A0=C2=A0 }
> > > > >=20
> > > > >=20
> > > > > This way, the entire DriverFenceData will remain valid for an
> > > > > additional grace period. I suppose this would solve your pointer-
> > > > > invalid concern.
> > > > >=20
> > > > > However, it appears like overkill to me because the refcounting +=
 C
> > > > > backend already ensure that nothing drops too soon, and the backe=
nd
> > > > > frees with kfree_rcu(), so=E2=80=A6=C2=A0  =20
> > > >=20
> > > > I agree that it doesn't sound like we want RcuBox here.
> > > >=20
> > > > What kind of metadata are we actually planning to store in the
> > > > DriverFence in practice?=C2=A0  =20
> > >=20
> > > I suppose it might be GPUVM payloads. IIRC in Tyr it's currently just
> > > empty structs as some sort of identifier. I guess copies of the actual
> > > command buffers will also reside in their associated fences.
> > >=20
> > > But Boris, Daniel and Danilo probably have something smart to say abo=
ut
> > > that. =20
> >=20
> > In Tyr we don't need any, because we're using SW signalling: we get an
> > interrupt, look at our HW fence seqno, and walk the set of pending
> > fences to signal them with the ::signal() method (that's an
> > over-simplified view of it, but functionally that's how it works).
> >=20
> > Now, the question is more, what drivers planning to support HW
> > signaling want attached to the DriverFence. My gut feeling is that now
> > that we have a way to get back to the FenceCtx, and given that FenceCtx
> > also has driver-specific data attached to it, most common use cases
> > where the fence contains a backpointer to its timeline/creator are
> > covered. If I look at nouveau_fence [1] (I intentionally looked at the
> > most likely next user of this) for instance:
> >=20
> > struct nouveau_fence {
> > 	struct dma_fence base;
> >=20
> > 	struct list_head head;
> >=20
> > 	struct nouveau_channel __rcu *channel;
> > 	unsigned long timeout;
> > }; =20
>=20
> Thx for the explanation
>=20
> >=20
> > - channel is basically the FenceCtx in your new design
> > - head is used to insert the fence in the fence context list. Not too
> > =C2=A0 sure how it translates in rust (insertion in an XArray instead?).
> > =C2=A0 Anyway, that's just stuff you need to make your fence part of the
> > =C2=A0 context timeline, so it's again related to how you link a fence =
to
> > =C2=A0 its context and let the context walk back pending fences when it
> > =C2=A0 needs to. Feels like my original FenceTimeline abstract proposal=
 [2]
> > =C2=A0 could help make this thing generic, but let's reconsider this on=
ce
> > =C2=A0 we've got the basics sorted out, please
> > - timeout is probably the only thing of interest here, assuming things
> > =C2=A0 can be signaled out of order (if they are signaled in order, lik=
e is
> > =C2=A0 the case in Tyr, the timeout can just be on the FenceCtxData and
> > =C2=A0 represent the timeout of the first fence in the set). Anyway, th=
at's a
> > =C2=A0 scalar, so no fancy ::drop() needed if that's what you're worried
> > =C2=A0 about =20
>=20
> What we / Alice are worried about is multiple things.
>=20
> One issue is that Alice believes that=20
>=20
>         // SAFETY: `self.data` is owned by the DriverFence, but could be =
accessed
>         // through some dma_fence callbacks right now. Access is being re=
voked
>         // above by signalling the fence. The DriverFenceSafeToDrop trait
>         // ensures that the data either does not need drop, or if it does=
 it
>         // lives in a RcuBox which will delay dropping by one grace perio=
d, hence
>         // ensuring that all readers have disappeared.
>         unsafe { drop_in_place(self.data.as_ptr()) };
>=20
>=20
> from DriverFence::drop() invalidates the pointers that thread A
> accesses, even if DriverFence::data.data's drop is delayed with RCU.
>=20
> Now if thread B drops DriverFence, thread A could use invalid pointers,
> but while still operating on non-deallocated memory (because our
> refcounting guards against that).

This is where I think our very permissive dma_fence callback design is
hitting us in the face. There are callbacks that are called with the
fence lock held (::enable_signalling(), ::signaled()), and because we
forcibly signal on DriverFence::drop() (which requires locking as well)
and then drop the DriverFenceData::data (I'd expect
DriverFenceData::fctx to be manually dropped too, but I don't see
that done in the current version), the problem you're describing doesn't
exist, I think.

That leaves those that are not called with the lock held, and for
which we rely on the RCU lock:

- ::get_{driver,timeline}_name() get back to the FenceCtx to get those
  names, and if the Arc<FenceCtx> inside the DriverFenceData is dropped,
  I guess it can't be trusted
- ::set_deadline() is problematic as well
- ::wait() and ::release() are deprecated

>=20
> The only way I can see to make that bullet proof would be to do
> synchronize_rcu() before the drop_in_place() above =E2=80=93 but that wou=
ld
> mean that we delay each fence drop by one grace period.

synchronize_rcu() in the DriverFence::drop() path is indeed not a great
idea. Not only because it adds an heavy synchronization point in a
potentially hot-path, but also because you're back to a situation where
DriverFence users need to be very careful about the context they are
when they drop these objects, and because drop() is an implicit
operation most of the time, it becomes super fragile.

If we're going to force this synchronize_rcu(), I think it should be
done when the FenceCtx is dropped, meaning we're back to a situation
where DriverFenceData::data is also RCU-deferred with an rcu_call(),
which, IIRC, was the original idea.

>=20
> I'm still not sure how real the problem really is, though. Because
> refcounting guards, and drop() doesn't actually *do* something to the
> pointers, or does it?

It doesn't do anything to the dma_fence part of the DriverFenceData,
but it can touch the driver-specific part, and most importantly, it
might leave it with stale information that are then re-interpreted by
the dma_fence_ops callback that's still in-flight.

>=20
>=20
> --
>=20
> Another, related issue would be
> - thread A accesses DriverFence::data through a backend_ops
> - thread B drops DriverFence
> - there are no RCU callbacks (call_rcu()) pending
> - thus, the rcu_barrier() in FenceCtx::drop() takes no effect. We would
> actually need synchronize_rcu() there.
>=20
>=20
> So would seem we still didn't get fence and fence_ctx teardown
> completely right.

Nope, indeed. The driver_name/timeline_name retrieval is already
problematic. You probably get away with it because you're leaking the
context (no drop on DriverFenceData::fctx AFAICT).

