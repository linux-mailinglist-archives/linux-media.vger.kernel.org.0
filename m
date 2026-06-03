Return-Path: <linux-media+bounces-63494-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iEsGMu7PH2riqAAAu9opvQ
	(envelope-from <linux-media+bounces-63494-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 08:55:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24977634DA5
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 08:55:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=bbbub2i+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63494-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63494-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BA6F302633C
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 06:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334603955E3;
	Wed,  3 Jun 2026 06:48:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF4F39526B
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 06:48:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469295; cv=none; b=a35opg0OK83FQPO/X6AXzEpy9c8MQLGhif8tVgACSBeKudC+Rs/NICt1ohJ1mhAbvwTWann/h9ccEdWYNtafWZpdsofD2T9Gx5tRL8gGgh4LwC/hfL8nxLfIei6RKmkP4cNf3SCDSv7Cag3SmKYlXZDRbHAHSSYAOnLjae4a290=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469295; c=relaxed/simple;
	bh=JSuhPbj76Yw9/KLytYKe6rpR1rkx4pzHYcjFUZSK3Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LCCbOQyGqBnrK4HazVYlaIj9BSGLdDVYzXrurbW3sl/oQnSC9DL5LV4zpi+mVN855/x9GfqMO6qVC+1ChlUigHFzDWZtZwzIroFTSoPh6gNXAq/JAwJFyYOmXMt+M52L73iHyWp7ILk8vY7ER3pB0jxnDwHMn+U6PhDkBkeUv6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bbbub2i+; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780469291;
	bh=JSuhPbj76Yw9/KLytYKe6rpR1rkx4pzHYcjFUZSK3Mw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bbbub2i+Dr9RKVNMaSLHWvtFmZP2SnByNYccxAGvvUsscq/qx/d4nDgJzHof5HZBL
	 OgxalGx9bs1+EUbaH+I0ixD+qE/ZMgqtgYvz/N6nd0foKnWduNabNByVft9JzPYgDu
	 tLmNS40pawT7N+ZChgifl1Vl89OPn3S9GhMVRZ91hq5jfMdxHdKOipNGQmV794v/qR
	 zsoswoPA7H5rUxtFNz63oLyPGfRDmdTs0ejgn3cXlOWQCUy7d0df1coQNbynfXZy/7
	 uhpGOlKnv3cuM9QS9g1apGR/T+wjSIT0cY5JU8D74j76EC9MydxhbWUKAqrf2gGq3w
	 75A19l5gnlLCA==
Received: from fedora-2.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 82F6317E0086;
	Wed,  3 Jun 2026 08:48:11 +0200 (CEST)
Date: Wed, 3 Jun 2026 08:48:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Alice Ryhl <aliceryhl@google.com>,
 sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org,
 ojeda@kernel.org, Danilo Krummrich <dakr@kernel.org>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Gary Guo	
 <gary@garyguo.net>, Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
Message-ID: <20260603084805.5e0e23ea@fedora-2.home>
In-Reply-To: <3c7e4db139df7cea18bc683d6dd33da2d00f0358.camel@mailbox.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:phasta@mailbox.org,m:phasta@kernel.org,m:aliceryhl@google.com,m:sashiko-reviews@lists.linux.dev,m:linux-media@vger.kernel.org,m:ojeda@kernel.org,m:dakr@kernel.org,m:christian.koenig@amd.com,m:gary@garyguo.net,m:daniel.almeida@collabora.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,linux-media@vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-63494-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:url,mailbox.org:email,collabora.com:from_mime,collabora.com:dkim,gitlab.freedesktop.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24977634DA5

On Wed, 03 Jun 2026 08:10:51 +0200
Philipp Stanner <phasta@mailbox.org> wrote:

> +Cc Danilo, Gary, Daniel, Christian
> (who seem to have been lost because Sashiko dropped them and this thread =
is a reply to that tool)
>=20
>=20
> On Tue, 2026-06-02 at 15:25 +0000, Alice Ryhl wrote:
> > On Tue, Jun 02, 2026 at 02:06:43PM +0200, Philipp Stanner wrote: =20
> > > On Tue, 2026-06-02 at 11:59 +0000, Alice Ryhl wrote: =20
> > > > On  =20
> > >=20
> > > [=E2=80=A6]
> > >  =20
> > > > > >=20
> > > > > > If you don't implement Sync, then DriverFence cannot be stored =
in an
> > > > > > Arc. I wouldn't take away that ability unless you have to, and =
I don't
> > > > > > see anything in the DriverFence API that would mean you can't d=
o that. =20
> > > > >=20
> > > > > Nope. We explicitly agreed on this design.
> > > > >=20
> > > > > Just 1 DriverFence. Just 1 party that can signal it.
> > > > > Note that we also agreed upon the Driverfence disappearing with
> > > > > .signal(), which certainly prevents several from existing, unless=
 you
> > > > > do an Option.take() =20
> > > >=20
> > > > I would like to clarify that I'm not suggesting any changes to the
> > > > design. Implementing Sync is not the same as having multiple driver
> > > > fences. =20
> > >=20
> > > I mean, I guess one can do that. But it's up to the driver then to se=
e how it can signal its fence. =20
> >=20
> > I don't believe Sync changes anything with that regard. The signal
> > method takes 'self', but the Sync trait only affects how '&self' methods
> > can be called.
> >  =20
> > > > > > > > > > =C2=A0so even though
> > > > > > > > > > the fence context may be valid for another grace period=
, the *pointer*
> > > > > > > > > > to the fence context is not. The pointer could have bee=
n zeroed by the
> > > > > > > > > > destructor. =20
> > > > > > > > >=20
> > > > > > > > > That particular pointer to the DriverFenceData could have=
 been zeroed.
> > > > > > > > > But potential other accessors have already crafted themse=
lves a new
> > > > > > > > > pointer to the, by the power of RCU, still valid data. Th=
at new pointer
> > > > > > > > > is container-of-ed from struct dma_fence *f. =20
> > > > > > > >=20
> > > > > > > > I'm not talking about the pointer to DriverFenceData, I'm t=
alking about
> > > > > > > > the pointer to the FenceCtx, or the pointer to the data (if=
 F is
> > > > > > > > RcuBox). =20
> > > > > > >=20
> > > > > > > Yeah, but the backing memory is still alive. And new pointers=
 to that
> > > > > > > memory get crafted by the accessors. If a callback accesses t=
he data
> > > > > > > through `container_of(Fence)`, it gets a new pointer.
> > > > > > >=20
> > > > > > > So what's the problem?
> > > > > > >=20
> > > > > > > Where is the invalid pointer that someone is accessing?
> > > > > > >  =20
> > > > > > > >=20
> > > > > > > > The Arc type is not a type that opts-out of &mut =3D=3D exc=
lusive, so the
> > > > > > > > second drop_in_place() above is assumed exclusive access to=
 the
> > > > > > > > Arc<FenceCtx<F,C>> field. =20
> > > > > > >=20
> > > > > > > OK, so I think I see the problem. So the invalid pointer is
> > > > > > > Arc<FenceCtx=E2=80=A6>? And potentially the <F> pointer (alth=
ough we don't have
> > > > > > > a picture yet as to how that would be accessed through other =
callbacks.
> > > > > > >  =20
> > > > > > > > =C2=A0If another thread obtains a pointer to the
> > > > > > > > FenceCtx via reading the fctx field of the DriverFence in p=
arallel with
> > > > > > > > this, then that's not allowed because the drop_in_place() c=
all has
> > > > > > > > exclusive access to that field. =20
> > > > > > >=20
> > > > > > > I think I have been asking in several of our meetings in the =
past
> > > > > > > whether it is actually a problem to access data that has been=
 dropped()
> > > > > > > IF we know that drop does not cause UAF and the answer was ki=
nd of like
> > > > > > > a "well if it does not actually get freed=E2=80=A6" =20
> > > > > >=20
> > > > > > Ok, well, IMO the simplest approach is to say you can't. There =
may be
> > > > > > roundabout ways to do it, but I would suggest that we just ... =
don't. =20
> > > > >=20
> > > > > Ack.
> > > > >  =20
> > > > > >  =20
> > > > > > > Anyways.
> > > > > > >=20
> > > > > > > It would seem the way to get this right is then
> > > > > > >=20
> > > > > > > synchronize_rcu();
> > > > > > > drop_in_palace(data);
> > > > > > >=20
> > > > > > >=20
> > > > > > > Agreed?
> > > > > > >=20
> > > > > > > This would then mean, however, that every time a fence drops,=
 you have
> > > > > > > to wait a grace period.
> > > > > > >=20
> > > > > > > Or maybe stuff DriverFenceData into an RcuBox, too, and defer=
 its
> > > > > > > dropping. =20
> > > > > >=20
> > > > > > That would work, but I think we can do better and avoid the
> > > > > > synchronize_rcu() along these lines:
> > > > > >=20
> > > > > > unsafe trait RcuRevocable {
> > > > > > =C2=A0=C2=A0=C2=A0 unsafe fn rcu_revoke_in_place(ptr: *mut Self=
);
> > > > > > }
> > > > > >=20
> > > > > > This trait provides a method that's like drop_in_place(), excep=
t that
> > > > > > when you use this destructor, the value remains usable for one =
grace
> > > > > > period. You could implement it for RcuBox, and for any Copy typ=
e, and
> > > > > > for ARef<T> when T is cleaned up with rcu, and probably also ot=
her
> > > > > > stuff. =20
> > > > >=20
> > > > > I mean, this cannot be magic. It also boils down to executing one=
 RCU
> > > > > callback per DriverFence dropping.
> > > > >=20
> > > > > Is there a significant difference to stuffing DriverFenceData int=
o an
> > > > > RcuBox? =20
> > > >=20
> > > > Do you mean hard-coding that the user-data of a driver fence is alw=
ays
> > > > stored in an RcuBox? =20
> > >=20
> > >=20
> > > I'm talking about this:
> > >=20
> > >=20
> > >=20
> > > impl<F: Send + Sync + DriverFenceAllowedData, C: Send + Sync> DriverF=
enceAllocation<F, C> {
> > > =C2=A0=C2=A0=C2=A0 /// Create a new allocation slot that can later be=
 used to create a fully
> > > =C2=A0=C2=A0=C2=A0 /// initialized [`DriverFence`] without the need t=
o allocate.
> > > =C2=A0=C2=A0=C2=A0 pub fn new(fctx: Arc<FenceCtx<F, C>>, data: F) -> =
Result<Self> {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data =3D DriverF=
enceData {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=
 `inner` remains uninitialized until a [`DriverFence`] takes over.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in=
ner: Fence {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 inner: Opaque::uninit(),
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fc=
tx,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 da=
ta,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // In order to support the=
 C dma_fence callbacks, it is necessary for
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // a `Fence` and a `Driver=
Fence` to live in the same allocation,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // because the C backend p=
asses a dma_fence, from which the driver most
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // likely wants to be able=
 to access its `data` in `DriverFence`.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Hence, we need the mana=
ge the memory manually. It will be freed by the
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // C backend automatically=
 once the refcount within `Fence` drops to 0.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let data =3D RcuBox::new(f=
ence_data, GFP_KERNEL | __GFP_ZERO)?;
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(Self { data })
> > > =C2=A0=C2=A0=C2=A0 }
> > >=20
> > >=20
> > > This way, the entire DriverFenceData will remain valid for an
> > > additional grace period. I suppose this would solve your pointer-
> > > invalid concern.
> > >=20
> > > However, it appears like overkill to me because the refcounting + C
> > > backend already ensure that nothing drops too soon, and the backend
> > > frees with kfree_rcu(), so=E2=80=A6 =20
> >=20
> > I agree that it doesn't sound like we want RcuBox here.
> >=20
> > What kind of metadata are we actually planning to store in the
> > DriverFence in practice? =20
>=20
> I suppose it might be GPUVM payloads. IIRC in Tyr it's currently just
> empty structs as some sort of identifier. I guess copies of the actual
> command buffers will also reside in their associated fences.
>=20
> But Boris, Daniel and Danilo probably have something smart to say about
> that.

In Tyr we don't need any, because we're using SW signalling: we get an
interrupt, look at our HW fence seqno, and walk the set of pending
fences to signal them with the ::signal() method (that's an
over-simplified view of it, but functionally that's how it works).

Now, the question is more, what drivers planning to support HW
signaling want attached to the DriverFence. My gut feeling is that now
that we have a way to get back to the FenceCtx, and given that FenceCtx
also has driver-specific data attached to it, most common use cases
where the fence contains a backpointer to its timeline/creator are
covered. If I look at nouveau_fence [1] (I intentionally looked at the
most likely next user of this) for instance:

struct nouveau_fence {
	struct dma_fence base;

	struct list_head head;

	struct nouveau_channel __rcu *channel;
	unsigned long timeout;
};

- channel is basically the FenceCtx in your new design
- head is used to insert the fence in the fence context list. Not too
  sure how it translates in rust (insertion in an XArray instead?).
  Anyway, that's just stuff you need to make your fence part of the
  context timeline, so it's again related to how you link a fence to
  its context and let the context walk back pending fences when it
  needs to. Feels like my original FenceTimeline abstract proposal [2]
  could help make this thing generic, but let's reconsider this once
  we've got the basics sorted out, please
- timeout is probably the only thing of interest here, assuming things
  can be signaled out of order (if they are signaled in order, like is
  the case in Tyr, the timeout can just be on the FenceCtxData and
  represent the timeout of the first fence in the set). Anyway, that's a
  scalar, so no fancy ::drop() needed if that's what you're worried
  about


[1]https://elixir.bootlin.com/linux/v7.1-rc5/source/drivers/gpu/drm/nouveau=
/nouveau_fence.h#L11
[2]https://gitlab.freedesktop.org/bbrezillon/linux/-/blob/8bec931a3a222873b=
f93cd8111d88c2f79df30cd/rust/kernel/sync/dma_fence.rs#L836

