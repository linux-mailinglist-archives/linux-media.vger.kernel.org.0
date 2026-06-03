Return-Path: <linux-media+bounces-63490-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aW14IZrFH2rtpgAAu9opvQ
	(envelope-from <linux-media+bounces-63490-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 08:11:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E7A6348FA
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 08:11:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=lN9uIBKh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63490-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63490-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE23A303E4EE
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 06:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807393F58F6;
	Wed,  3 Jun 2026 06:11:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E1638B7B1
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 06:11:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780467064; cv=none; b=a6IJSV0vrnPWTMFA3joQ19J5m3+Q8xR09VLWPYyUwcIKsRJr/RU5C7h/AzegvlV+hJ3YSCvyEFCxwZ3NWFOafuHz7g4LpQyKrwI/mpsu9Grq9vEyGxQZ+MTJTn8GN2MDk9gGHIOCs+6A301ywIy86QwvrUHTJG30zc9YC2jRd0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780467064; c=relaxed/simple;
	bh=MgFGoieA09VC7boxOE12n2Ui/MDrXsUJ6s84z7JMIkI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nvWJZxGaObdks6sxH3KKlQ38rf1BalfWOlzzQdGtfIXPW7T99Yeo0wB5C7JCbGEVk/TOWhrgMbxz5STN2SZAod4fJtOS7YUcKDdxhoz/gMaGyQH8sLcbfK04zqLL3ZjIAdDPEVBXfBa5IUNDjsDpzzUFQaQyEHcoa1NVygBdAx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lN9uIBKh; arc=none smtp.client-ip=80.241.56.151
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gVcl74BpLz9v2x;
	Wed,  3 Jun 2026 08:10:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780467059; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MgFGoieA09VC7boxOE12n2Ui/MDrXsUJ6s84z7JMIkI=;
	b=lN9uIBKhIb3dqJ/N69cPZ6Rqm3k5czCdXd/VjTz72tn8qn2iXbIbrPFFIuxz3KSjHWbFbp
	gtADfahT3nMdrQZaEpDcM51974Kuc5I/B9bAsQgwmDMGklHdU5BJ+0KuGIFM7Ap707YNe9
	eOMgBkR2n9MzS34WI3gwiOZe3Ap8wFfjMzYbBArRL5OVREpYEbH1v6P7X2OVk3gCIA73dl
	zFlAH69lA4Lr1ZPPhBboWIzO05cRgRyrso6Jq2UWNth1+5fvEQVeAKE1hclbOz/rnebfzg
	6U5+sQZJYQaw7mujUexqOMJpYCWd7ctv6ZARtYxSQ9QIHuT/ew/4dKi0Ho2wdQ==
Message-ID: <3c7e4db139df7cea18bc683d6dd33da2d00f0358.camel@mailbox.org>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Alice Ryhl <aliceryhl@google.com>, phasta@kernel.org
Cc: sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org, 
	ojeda@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>, Danilo
 Krummrich <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Gary Guo	 <gary@garyguo.net>, Daniel Almeida
 <daniel.almeida@collabora.com>
Date: Wed, 03 Jun 2026 08:10:51 +0200
In-Reply-To: <ah72Bi2Q5Wpgo2kE@google.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 6a1e69e9dd4ca6c585e
X-MBO-RS-META: a4i8sc36uy15x9hmj8adidc6hobdrj3h
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
	TAGGED_FROM(0.00)[bounces-63490-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:phasta@kernel.org,m:sashiko-reviews@lists.linux.dev,m:linux-media@vger.kernel.org,m:ojeda@kernel.org,m:boris.brezillon@collabora.com,m:dakr@kernel.org,m:christian.koenig@amd.com,m:gary@garyguo.net,m:daniel.almeida@collabora.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:mid,mailbox.org:from_mime,mailbox.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1E7A6348FA

+Cc Danilo, Gary, Daniel, Christian
(who seem to have been lost because Sashiko dropped them and this thread is=
 a reply to that tool)


On Tue, 2026-06-02 at 15:25 +0000, Alice Ryhl wrote:
> On Tue, Jun 02, 2026 at 02:06:43PM +0200, Philipp Stanner wrote:
> > On Tue, 2026-06-02 at 11:59 +0000, Alice Ryhl wrote:
> > > On=20
> >=20
> > [=E2=80=A6]
> >=20
> > > > >=20
> > > > > If you don't implement Sync, then DriverFence cannot be stored in=
 an
> > > > > Arc. I wouldn't take away that ability unless you have to, and I =
don't
> > > > > see anything in the DriverFence API that would mean you can't do =
that.
> > > >=20
> > > > Nope. We explicitly agreed on this design.
> > > >=20
> > > > Just 1 DriverFence. Just 1 party that can signal it.
> > > > Note that we also agreed upon the Driverfence disappearing with
> > > > .signal(), which certainly prevents several from existing, unless y=
ou
> > > > do an Option.take()
> > >=20
> > > I would like to clarify that I'm not suggesting any changes to the
> > > design. Implementing Sync is not the same as having multiple driver
> > > fences.
> >=20
> > I mean, I guess one can do that. But it's up to the driver then to see =
how it can signal its fence.
>=20
> I don't believe Sync changes anything with that regard. The signal
> method takes 'self', but the Sync trait only affects how '&self' methods
> can be called.
>=20
> > > > > > > > > =C2=A0so even though
> > > > > > > > > the fence context may be valid for another grace period, =
the *pointer*
> > > > > > > > > to the fence context is not. The pointer could have been =
zeroed by the
> > > > > > > > > destructor.
> > > > > > > >=20
> > > > > > > > That particular pointer to the DriverFenceData could have b=
een zeroed.
> > > > > > > > But potential other accessors have already crafted themselv=
es a new
> > > > > > > > pointer to the, by the power of RCU, still valid data. That=
 new pointer
> > > > > > > > is container-of-ed from struct dma_fence *f.
> > > > > > >=20
> > > > > > > I'm not talking about the pointer to DriverFenceData, I'm tal=
king about
> > > > > > > the pointer to the FenceCtx, or the pointer to the data (if F=
 is
> > > > > > > RcuBox).
> > > > > >=20
> > > > > > Yeah, but the backing memory is still alive. And new pointers t=
o that
> > > > > > memory get crafted by the accessors. If a callback accesses the=
 data
> > > > > > through `container_of(Fence)`, it gets a new pointer.
> > > > > >=20
> > > > > > So what's the problem?
> > > > > >=20
> > > > > > Where is the invalid pointer that someone is accessing?
> > > > > >=20
> > > > > > >=20
> > > > > > > The Arc type is not a type that opts-out of &mut =3D=3D exclu=
sive, so the
> > > > > > > second drop_in_place() above is assumed exclusive access to t=
he
> > > > > > > Arc<FenceCtx<F,C>> field.
> > > > > >=20
> > > > > > OK, so I think I see the problem. So the invalid pointer is
> > > > > > Arc<FenceCtx=E2=80=A6>? And potentially the <F> pointer (althou=
gh we don't have
> > > > > > a picture yet as to how that would be accessed through other ca=
llbacks.
> > > > > >=20
> > > > > > > =C2=A0If another thread obtains a pointer to the
> > > > > > > FenceCtx via reading the fctx field of the DriverFence in par=
allel with
> > > > > > > this, then that's not allowed because the drop_in_place() cal=
l has
> > > > > > > exclusive access to that field.
> > > > > >=20
> > > > > > I think I have been asking in several of our meetings in the pa=
st
> > > > > > whether it is actually a problem to access data that has been d=
ropped()
> > > > > > IF we know that drop does not cause UAF and the answer was kind=
 of like
> > > > > > a "well if it does not actually get freed=E2=80=A6"
> > > > >=20
> > > > > Ok, well, IMO the simplest approach is to say you can't. There ma=
y be
> > > > > roundabout ways to do it, but I would suggest that we just ... do=
n't.
> > > >=20
> > > > Ack.
> > > >=20
> > > > >=20
> > > > > > Anyways.
> > > > > >=20
> > > > > > It would seem the way to get this right is then
> > > > > >=20
> > > > > > synchronize_rcu();
> > > > > > drop_in_palace(data);
> > > > > >=20
> > > > > >=20
> > > > > > Agreed?
> > > > > >=20
> > > > > > This would then mean, however, that every time a fence drops, y=
ou have
> > > > > > to wait a grace period.
> > > > > >=20
> > > > > > Or maybe stuff DriverFenceData into an RcuBox, too, and defer i=
ts
> > > > > > dropping.
> > > > >=20
> > > > > That would work, but I think we can do better and avoid the
> > > > > synchronize_rcu() along these lines:
> > > > >=20
> > > > > unsafe trait RcuRevocable {
> > > > > =C2=A0=C2=A0=C2=A0 unsafe fn rcu_revoke_in_place(ptr: *mut Self);
> > > > > }
> > > > >=20
> > > > > This trait provides a method that's like drop_in_place(), except =
that
> > > > > when you use this destructor, the value remains usable for one gr=
ace
> > > > > period. You could implement it for RcuBox, and for any Copy type,=
 and
> > > > > for ARef<T> when T is cleaned up with rcu, and probably also othe=
r
> > > > > stuff.
> > > >=20
> > > > I mean, this cannot be magic. It also boils down to executing one R=
CU
> > > > callback per DriverFence dropping.
> > > >=20
> > > > Is there a significant difference to stuffing DriverFenceData into =
an
> > > > RcuBox?
> > >=20
> > > Do you mean hard-coding that the user-data of a driver fence is alway=
s
> > > stored in an RcuBox?
> >=20
> >=20
> > I'm talking about this:
> >=20
> >=20
> >=20
> > impl<F: Send + Sync + DriverFenceAllowedData, C: Send + Sync> DriverFen=
ceAllocation<F, C> {
> > =C2=A0=C2=A0=C2=A0 /// Create a new allocation slot that can later be u=
sed to create a fully
> > =C2=A0=C2=A0=C2=A0 /// initialized [`DriverFence`] without the need to =
allocate.
> > =C2=A0=C2=A0=C2=A0 pub fn new(fctx: Arc<FenceCtx<F, C>>, data: F) -> Re=
sult<Self> {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data =3D DriverFen=
ceData {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // `=
inner` remains uninitialized until a [`DriverFence`] takes over.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inne=
r: Fence {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 inner: Opaque::uninit(),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fctx=
,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data=
,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // In order to support the C=
 dma_fence callbacks, it is necessary for
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // a `Fence` and a `DriverFe=
nce` to live in the same allocation,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // because the C backend pas=
ses a dma_fence, from which the driver most
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // likely wants to be able t=
o access its `data` in `DriverFence`.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Hence, we need the manage=
 the memory manually. It will be freed by the
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // C backend automatically o=
nce the refcount within `Fence` drops to 0.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let data =3D RcuBox::new(fen=
ce_data, GFP_KERNEL | __GFP_ZERO)?;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(Self { data })
> > =C2=A0=C2=A0=C2=A0 }
> >=20
> >=20
> > This way, the entire DriverFenceData will remain valid for an
> > additional grace period. I suppose this would solve your pointer-
> > invalid concern.
> >=20
> > However, it appears like overkill to me because the refcounting + C
> > backend already ensure that nothing drops too soon, and the backend
> > frees with kfree_rcu(), so=E2=80=A6
>=20
> I agree that it doesn't sound like we want RcuBox here.
>=20
> What kind of metadata are we actually planning to store in the
> DriverFence in practice?

I suppose it might be GPUVM payloads. IIRC in Tyr it's currently just
empty structs as some sort of identifier. I guess copies of the actual
command buffers will also reside in their associated fences.

But Boris, Daniel and Danilo probably have something smart to say about
that.


P.



>=20
> Alice

