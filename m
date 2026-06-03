Return-Path: <linux-media+bounces-63597-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0n/ZDa0vIGpMyQAAu9opvQ
	(envelope-from <linux-media+bounces-63597-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 15:44:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C27D9638311
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 15:44:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=limSewty;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63597-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63597-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BEEC0307F16F
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 13:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BDE30FC1E;
	Wed,  3 Jun 2026 13:35:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FE13126B1
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 13:35:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493735; cv=none; b=oCb1bUqH8ZYjbRaZcgHEVdyGToqERNepkuRe+lkILVswL7pe9CHUcSTzvLo/sazF8hSxPSRHHHZqKpcv94Ksm4vt/aRLctJoiongTwHAVTMg0rDceoVHCcnzirCKFGKAzgo/lfiQJmMpOiFfcBqTQ8kFmoI87L7A1cVInd0rth0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493735; c=relaxed/simple;
	bh=mfaLwpU3il0WiTL9Au6+UX/HHKMnh9/DiXmakCBIUgk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tcSVwK/508HZpjYCMQeRIGWd5/gEl2QzMKH+34Y8l1DyrTwXbtPDJ98CcxrS+i0OEr6TDNBlzZ8L8qafxp8l9THpmud5VCWGFBJUtcoINKFURHcdcwAGuAeIkNeXS3MWFaVNfmEpKffBTJggBjjOnZ3wNpHTVMKT4wJ/YDmD8jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=limSewty; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780493731;
	bh=mfaLwpU3il0WiTL9Au6+UX/HHKMnh9/DiXmakCBIUgk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=limSewtydPKzgebIjLPNes6ZghD/JsrwXDIuHR3yYJ5p03aEJidbvWl30ZSd/dGX9
	 bZ6FPJF0WaaOYuI67/vkUiHCcSEgnhXyHkoCeoIl6B45dgaIA4y9mhXvtFuQp4+pVa
	 l+c31PVdSLneaLo0GBMbMyM9ioGBKk/oxjFOr5AYQkO/BWkOQ34wqnPsybKKV3rUV5
	 WO4bypXnN9aau9o17vuDZyqZsZHBaoCb5LOoofQL/B+tvvZkSuAphSpfvbpamiCsvp
	 MVAHXWdF/YqoKqY1CMk3hbRl8QiUcdUej4KbW1IBJjhag9SknhX+obawhChL4cgFqc
	 P1aSq/CoBuwng==
Received: from fedora-2.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DF53717E0432;
	Wed,  3 Jun 2026 15:35:30 +0200 (CEST)
Date: Wed, 3 Jun 2026 15:35:26 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Alice Ryhl <aliceryhl@google.com>,
 sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org,
 ojeda@kernel.org, Danilo Krummrich	 <dakr@kernel.org>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Gary Guo
 <gary@garyguo.net>, Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
Message-ID: <20260603153526.7b3dd6b9@fedora-2.home>
In-Reply-To: <6df53a0ee6b205de7aff34c2901f51b1a1f0a34e.camel@mailbox.org>
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
	<20260603115247.21ee5d1d@fedora-2.home>
	<20260603115804.29eb8f7d@fedora-2.home>
	<5e710e0bffd21eded77f060ae34e641449325c73.camel@mailbox.org>
	<20260603132259.42184da0@fedora-2.home>
	<6df53a0ee6b205de7aff34c2901f51b1a1f0a34e.camel@mailbox.org>
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
	TAGGED_FROM(0.00)[bounces-63597-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mailbox.org:email,fence.data:url,gitlab.freedesktop.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C27D9638311

On Wed, 03 Jun 2026 13:49:19 +0200
Philipp Stanner <phasta@mailbox.org> wrote:

> > > > > > >=20
> > > > > > > - channel is basically the FenceCtx in your new design
> > > > > > > - head is used to insert the fence in the fence context list.=
 Not too
> > > > > > > =C2=A0 sure how it translates in rust (insertion in an XArray=
 instead?).
> > > > > > > =C2=A0 Anyway, that's just stuff you need to make your fence =
part of the
> > > > > > > =C2=A0 context timeline, so it's again related to how you lin=
k a fence to
> > > > > > > =C2=A0 its context and let the context walk back pending fenc=
es when it
> > > > > > > =C2=A0 needs to. Feels like my original FenceTimeline abstrac=
t proposal [2]
> > > > > > > =C2=A0 could help make this thing generic, but let's reconsid=
er this once
> > > > > > > =C2=A0 we've got the basics sorted out, please
> > > > > > > - timeout is probably the only thing of interest here, assumi=
ng things
> > > > > > > =C2=A0 can be signaled out of order (if they are signaled in =
order, like is
> > > > > > > =C2=A0 the case in Tyr, the timeout can just be on the FenceC=
txData and
> > > > > > > =C2=A0 represent the timeout of the first fence in the set). =
Anyway, that's a
> > > > > > > =C2=A0 scalar, so no fancy ::drop() needed if that's what you=
're worried
> > > > > > > =C2=A0 about=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > >=20
> > > > > > What we / Alice are worried about is multiple things.
> > > > > >=20
> > > > > > One issue is that Alice believes that=20
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self.dat=
a` is owned by the DriverFence, but could be accessed
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // through some dma_=
fence callbacks right now. Access is being revoked
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // above by signalli=
ng the fence. The DriverFenceSafeToDrop trait
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ensures that the =
data either does not need drop, or if it does it
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // lives in a RcuBox=
 which will delay dropping by one grace period, hence
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ensuring that all=
 readers have disappeared.
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { drop_in_pla=
ce(self.data.as_ptr()) };
> > > > > >=20
> > > > > >=20
> > > > > > from DriverFence::drop() invalidates the pointers that thread A
> > > > > > accesses, even if DriverFence::data.data's drop is delayed with=
 RCU.
> > > > > >=20
> > > > > > Now if thread B drops DriverFence, thread A could use invalid p=
ointers,
> > > > > > but while still operating on non-deallocated memory (because our
> > > > > > refcounting guards against that).=C2=A0=C2=A0=C2=A0  =20
> > > > >=20
> > > > > This is where I think our very permissive dma_fence callback desi=
gn is
> > > > > hitting us in the face. There are callbacks that are called with =
the
> > > > > fence lock held (::enable_signalling(), ::signaled()), and becaus=
e we
> > > > > forcibly signal on DriverFence::drop() (which requires locking as=
 well)
> > > > > and then drop the DriverFenceData::data (I'd expect
> > > > > DriverFenceData::fctx to be manually dropped too, but I don't see
> > > > > that done in the current version), the problem you're describing =
doesn't
> > > > > exist, I think.=C2=A0  =20
> > >=20
> > > The problem of *nominally* those Rust pointers / references in
> > > DriverFenceData becoming invalid does exist.
> > >=20
> > > But I tend to believe that this is a syntactic theoretical problem. A=
ll
> > > the memory is still valid. =20
> >=20
> > But accessing an Arc<Xx> that has been dropped is invalid. You just
> > basically rely on the implementation leaving the memory as is after it
> > dropped the ref it had, but there's nothing preventing it from zero-ing
> > the Arc<>, at which point this becomes a NULL deref. Also, when you
> > drop DriverFenceData::fctx, you might very well be the last FenceCtx
> > owner, so FenceCtx can go away at this point, meaning your in-flight
> > dma_fence_ops::{driver,timeline}_name() callbacks might now point to
> > memory that has been returned to the system and lead to a UAF. =20
>=20
> Nope.
> The Arc<fctx> can earliest disappear once the DriverFence dropped.

Yes, and there's nothing retaining DriverFence if some dma_fence_ops
are in-flight, because DriverFence is not in charge of this aspect.

> The
> Arc<fctx> has been allocated with DriverFenceAllocation. That memory
> only does become re-usable once dma_fence_put() in DriverFence::drop()
> releases the memory.

You're talking about the memory backing DriverFenceData, and I'm
talking about what happens when drop_in_place(fence.data) is called. In
that case, the DriverFenceData object is called. Because there's no
explicit Drop implementation for DriverFenceData, the compiler will
drop each field in the order they are defined:

1. inner: Fence =3D> NOP since that type just Opaque<dma_fence>
2. fctx: Arc<FenceCtx<F, C>> =3D> so basically calling [1]. Yes the
   memory behind this Arc object remains accessible/valid, but
   doesn't change the fact drop() has been called on this Arc, and
   you're basically relying on the fact Arc::drop() leaves things
   intact such that further accesses to this Arc instance work
   properly.
3. data: F =3D> what happens depends on the type itself

So let's assume data is safe to be dropped immediately, fctx is not, or
rather it might be, but it's basically relying on current
implementation details, which we shouldn't do, IMO.

>=20
> A consuming / reading Fence also holds a refcount.

It hold a ref on the Fence object, which doesn't include ftcx (memory
for fctx is there, but the field is not accessible).

>=20
> The FenceCtx on the other hand delays its drop() by an RCU grace
> period. So until all accessors are gone.
>=20
> Where is the problem?

The problem is, you're making assumptions about the Arc implementation
that shouldn't be done, so you're basically violating the layering that
exists between the API exposed by the Arc module and its internal
implementation, which might evolve at any point.

>=20
> >  =20
> > >=20
> > > The FenceCtx cannot disappear because its drop is delayed with
> > > synchronize_rcu() (previously rcu_barrier()). =20
> >=20
> > Okay, so that protects against the UAF I was mentioning, but fact the
> > Arc implementation doesn't give any guarantee about what happens to the
> > dropped Arc is still problematic. =20
>=20
> Well yes, that's the "what does drop() really do" issue I was
> mentioning.
>=20
> Anyways.
> Can you think of a solution?

There's two options, I think:

1. We always defer the drop on DriverFenceData through an rcu_call (I
guess that's RcuBox in rust)

2. We use rust lifetime specifiers to ensure FenceCtx can't outlive the
DriverFence it emitted, and we define fctx as fctx: &FenceCtx in the
DriverFenceData object.

>=20
> >  =20
> > >=20
> > > It's really just about the question whether
> > >=20
> > > rcu_read_lock()
> > > let ptr =3D something_valid_for_a_grace_period;
> > > drop(something_valid_for_a_grace_period); // delayed by a GP
> > > do_stuff_with_(ptr);
> > > rcu_read_unlock()
> > >=20
> > > is dangerous or not. =20
> >=20
> > It's more:
> >=20
> > thread A						| thread B			| thread C
> > 							|				|
> > rcu_read_lock()						|				|
> > =C2=A0let ptr =3D something_valid_for_a_grace_period;		|				|
> > 							| rcu_defer(drop(ptr))		|
> > =C2=A0do_stuff_with_(ptr);					|				|
> > rcu_read_unlock()					|				|
> > 							|				| drop(ptr)
> >  =20
>=20
> Yep, that's what I meant, but was too lazy to draw it properly <.<
>=20
> > And yes, as long as the drop is always deferred I don't see an
> > issue. But IIUC, you were trying to not defer the drop unless
> > the F on DriverFenceData needs a drop. The fact DriverFenceData::fctx
> > is also impacted by that immediate ::drop() means you have to defer
> > the drop() unconditionally now. =20
>=20
> I have to defer the drop() *of the FenceCtx* unconditionally. Which is
> fine, because how often does that happen?

I'm talking about the drop() of DriverFenceData here. You have to defer
it if you want to keep DriverFenceData::fctx valid until all callbacks
have returned.

>=20
> >  =20
> > >=20
> > > Alice doesn't like it =E2=80=93 but I do point out that the memory ca=
nnot go
> > > away. So in C this is perfectly safe. =20
> >=20
> > It might work, but it's very very fragile, to say the least. Honestly,
> > the more I think about it, the more I believe we should defer the drop
> > unconditionally and call it a day. Yes, it's a potential overhead,
> > but it's, IMHO, way better than relying on some Arc implementation
> > details that might change at some point. =20
>=20
> That or perhaps Revocable. But since Revocable also just defers
> unconditionally AFAICT=E2=80=A6
>=20
> That said, is it legal to always wait a grace period?

To clean things up? I don't see why not. The main concern was that it
would be overkill if DriverFenceData::data doesn't need to drop() or is
proven to be safe against immediate drop()s. What I'm seeing here is
that DriverFenceData::fctx is problematic too...

> >  =20
> > >=20
> > > Moreover, the current suggestion for v2 is that we force the user to
> > > obey to our safety requirements:
> > >=20
> > >=20
> > > /// Trait to ensure that the fence implementation can safely drop the=
 user data
> > > /// passed in [`FenceCtx::new_fence_allocation()`]. =20
> >=20
> > So, if your fence is the last owner of FenceCtx, it drops the last ref,
> > and FenceCtx::drop() is called. In there, I guess the first thing you
> > do in FenceCtx::drop() which waits for a grace period to expire
> > which might force an unexpected blocking operation in the otherwise
> > super trivial atomic-safe FenceData::drop() path.
> >  =20
>=20
> IF the driver has already dropped its separate reference to FenceCtx,
> which it must have around somewhere, no?

But there's nothing like that enforced at the API level, so there's
potentially a case where the driver drop things in invalid order and
FenceCtx gets dropped through one of its driver fences' ::drop() call.

>=20
> So that could only happen if a FenceCtx gets dropped *before* the last
> fence.

FenceCtx can't be dropped before the last fence it emitted, but it can
be dropped as part of the drop on the last fence that remains. That is,
driver drops the FenceCtx, and only then drops the fences that were
coming from this context.

> That would only happen if the driver is tearing down, typically.

Yes, and that's exactly the sort of mistake I'm hoping rust can help
with. I'd like drivers to not be able to drop their FenceCtx before
they gave up on all the fences that were emitted by this context,
because otherwise it can lead to various tricky bugs.

>=20
> But to be safe we could also demand the trait on FenceCtx::data.

Nope, DriverFenceData::ftcx is also problematic.

>=20
> >  Plus, then you have
> > to drop FenceCtx::data, which might or might not be SafeToDrop.
> >=20
> > This is exactly the sort of complications I wanted to avoid initially,
> > and this is why I still think letting the user tell when it's
> > DriverFenceSafeToDrop is just calling for more pain. =20
>=20
> The trait is at the very least useful for documenting what the driver
> must not do in its data::drop().

Yeah, but if you have to defer DriverFenceData for the fctx anyway, is
there point forcing more complexity to users...

>=20
> >  =20
> > > ///
> > > /// # Safety
> > > ///
> > > /// You must only implement this trait for your type if the following=
 rules are
> > > /// obeyed to:
> > > ///
> > > /// 1. Your type either does not need [`Drop`] at all, OR drops only =
after 1 RCU
> > > ///=C2=A0=C2=A0=C2=A0 grace period has passed.
> > > /// 2. If present, your [`Drop`] implementation performs no operation=
s illegal in
> > > ///=C2=A0=C2=A0=C2=A0 atomic context, such as allocating with GFP_KER=
NEL.
> > > pub unsafe trait DriverFenceSafeToDrop {}
> > >=20
> > > https://gitlab.freedesktop.org/pstanner/linux-drm-work/-/blob/jobqueu=
e-dma-fence-v2/rust/kernel/dma_buf/dma_fence.rs?ref_type=3Dheads#L512
> > >=20
> > >=20
> > > That way we hit several birds with one stone. We get our delayed-by-a-
> > > grace-period drop, *and* we can very explicitly document: "you must n=
ot
> > > do atomic-hostile stuff in drop()".
> > >=20
> > > Pretty cool, right? :] =20
> >=20
> > Except you don't know. Now you have to carefully audit
> >=20
> > - FenceCtx::drop()
> > - FenceCtx::data::drop() =20
>=20
> Not our responsibility. Whoever implements the trait needs to audit
> that.

How can you say what happens in FenceCtx::drop() is not your
responsibility. Or even that DriverFenceSafeToDrop must account for
both FenceCtx::data::drop() and DriverFenceData::drop() without making
this a nightmare for every user and/or maintainer that's going to audit
user's code.

Come on, if we can't make this at least a tiny bit user-friendly we're
just going to face the same mistakes that exist on the C side.

>=20
> The alternative is to stuff the data into an RcuBox unconditionally, if
> it does implement a drop().

Yes, and I'd rather have that at first, because it's easier to add
complexity to optimize a case we really know we need to optimize than
go for the most optimal solution and then realize it generates a lot of
problems.

>=20
> >=20
> > to guarantee that this is safe. Because with this API, there's no
> > guarantee that the FenceCtx outlives the fences it emitted. BTW,
> > maybe we should enforce that with lifetimes instead of having an Arc<Fe=
nceCtx>
> > in DriverFenceData. =20
>=20
> What. How is that not enforced?



>=20
> Each DriverFence refcounts the FenceCtx. It is impossible for the
> FenceCtx to disappear before a DriverFence.

It's possible for a partially dropped DriverFenceData to be used
because of dma_buf_ops callbacks.

thread A                                                      |   thread B
                                                              |
DriverFence::drop()                                           |
  DriverFenceData::drop()                                     |
    DriverFenceData::fctx::drop() <- last ref on fctx         |
      FenceCtx::drop()                                        |
                                                              | rcu_lock()
         synchronize_rcu()                                    |
                                                              |   dma_fence=
_ops::xxx()
                                                              |     drv_fen=
ce =3D DriverFenceData from dma_fence
                                                              |     fctx =
=3D drv_fence.fctx =3D> Invalid access to a dropped Arc
                                                              |     fctx.do=
_xxx() =3D> call to a FenceCtx that's being dropped

I don't think I can be clearer than that.

And yes, the memory backing the FenceCtx is still there,
but doesn't change the fact the object itself is going
away, which is not great to have.

As for the argument that driver should hold on its FenceCtx
until all the fences this FenceCtx emitted are dropped, I
agree, but this should be enforced at the API level rather
than just be a written rule somewhere, and rust lifetimes
allows that...

>=20
> >  =20
> > >  =20
> > > > >=20
> > > > > If we're going to force this synchronize_rcu(), I think it should=
 be
> > > > > done when the FenceCtx is dropped, meaning we're back to a situat=
ion
> > > > > where DriverFenceData::data is also RCU-deferred with an rcu_call=
(),
> > > > > which, IIRC, was the original idea.=C2=A0  =20
> > >=20
> > > See the trait, yes.
> > >  =20
> > > > > =C2=A0  =20
> > > > > >=20
> > > > > > I'm still not sure how real the problem really is, though. Beca=
use
> > > > > > refcounting guards, and drop() doesn't actually *do* something =
to the
> > > > > > pointers, or does it?=C2=A0=C2=A0=C2=A0  =20
> > > > >=20
> > > > > It doesn't do anything to the dma_fence part of the DriverFenceDa=
ta,
> > > > > but it can touch the driver-specific part, and most importantly, =
it
> > > > > might leave it with stale information that are then re-interprete=
d by
> > > > > the dma_fence_ops callback that's still in-flight.=C2=A0  =20
> > >=20
> > > Hmm no, I think this is all safe. =20
> >=20
> > Well, this might be safe (baring the Arc invalidation I mentioned), but=
 also
> > super convoluted design that's hard to audit and maintain overtime. I'm
> > very skeptical that this is what we want to start with just to make
> > sure we optimize the case where no drop on fence data is needed. =20
>=20
> It is super convoluted.
>=20
> Please remember that we started out with a far simpler design, but the
> demand was made that we must already prepare for future support of
> is_signaled() callback & partner.
>=20
> Without the hw_signalling callbacks, we simply had
>=20
> Fence
>   |
>   | refcounts
>   V=20
> DriverFence
>=20
> both of which lived in their own allocations. Was super simple, well
> maintainable.
>=20
>=20
> I think we are approaching the point where we simply have "to die one
> [of many possible] deaths" (a german saying)

I don't think so. You seem to completely dismiss the two solutions
I'm suggesting:

1/ leave with all DriverFenceData::drop() being deferred with RcuBox

or

2/ define lifetimes at the FenceCtx/DriverFence level, have a simple
   ref (rather than an Arc) to the context, and let the compiler check
   that FenceCtx always outlives the fences it emitted

>=20
> >  =20
> > >=20
> > > It's really about the question whether you are allowed to access a
> > > pointer in Rust that has been dropped, even if you can guarantee that
> > > it is still valid after dropping (for a grace period). =20
> >=20
> > An Arc, I don't think so. =20
>=20
> I don't know. See further above. The Arc's memory cannot be touched by
> anyone, cannot be reused.

I think I gave enough explanation on that issue above, if that's still uncl=
ear,
let's discuss it on Zulip or over a call.

