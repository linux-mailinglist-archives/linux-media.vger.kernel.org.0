Return-Path: <linux-media+bounces-63580-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xZJdKGoPIGoLvQAAu9opvQ
	(envelope-from <linux-media+bounces-63580-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 13:26:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ED3637060
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 13:26:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=pSm8dwrQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63580-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63580-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD3C030F9D47
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 11:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BBE3CF664;
	Wed,  3 Jun 2026 11:23:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C665D3C13EE
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 11:23:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485789; cv=none; b=VYbtMdG4uWX0iKIsEHho6cyx7wcIaiyPN6DyJuz3xlGn5fS2kVwg/OSYdD7lNEKS31c+KNBsNCUTk4JgvlL0Ny/AAYliNjh7LQzwkqVlFbkST1Ki0pdBDqTukMbKEwdubSLChJB3eZDttMkDr3QHGr33ng7XN74fuz1emFk6/sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485789; c=relaxed/simple;
	bh=HPI8kUca+qorSIzdfSqWUy1MuWfLkEHWk8tfmdmcUng=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tpvieiFFTiRhVXj2f9LqvdsqSgBGB2btlOHqHyvBCc+IFITqzfbJIHoiWSxJzaTwVvWbir4aUTJdZsyMmonD9eIAuOtFmXQlY+voCZCwrSGg2pCg3B2/onDU0fG6HsNtghqnFilhWAYlHGH7okN1acSFMe4getavJ2tsjF/sZVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pSm8dwrQ; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780485785;
	bh=HPI8kUca+qorSIzdfSqWUy1MuWfLkEHWk8tfmdmcUng=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pSm8dwrQ6K/trVixXnb+K965bk976NdWtWxdo/H7QsCb6jXpndhLHMxAUNwAhtwZ9
	 MOCErmnMlR1f5p3RZPWj7QE6h7cyyHzgL9cEC0Wf6HJG6GBJudZg5JNKutwhZv4XTs
	 tvwkeM/N9dqn3eqR3RuU2meMkKvtJkFOzPJfT3c29WhaH1EZo6bBLNn29/ki1OX0yT
	 sg7rKWoTViNzPtWm3xDEiZ4ScA/LaEJ4LmTNy7a/Mos0KlaTmI0h1f5nZlCa2Bo6nj
	 /XoSduhSR0iPl3uM5FeWD0q1a4cjwG+VLl9nZeTafEd2kLCYaWbn2i81Zzf0uzeool
	 jL0DiOefZ3MRg==
Received: from fedora-2.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B446117E0566;
	Wed,  3 Jun 2026 13:23:04 +0200 (CEST)
Date: Wed, 3 Jun 2026 13:22:59 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@mailbox.org>
Cc: phasta@kernel.org, Alice Ryhl <aliceryhl@google.com>,
 sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org,
 ojeda@kernel.org, Danilo Krummrich	 <dakr@kernel.org>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Gary Guo
 <gary@garyguo.net>, Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
Message-ID: <20260603132259.42184da0@fedora-2.home>
In-Reply-To: <5e710e0bffd21eded77f060ae34e641449325c73.camel@mailbox.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
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
	TAGGED_FROM(0.00)[bounces-63580-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mailbox.org:email,gitlab.freedesktop.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11ED3637060

On Wed, 03 Jun 2026 12:07:42 +0200
Philipp Stanner <phasta@mailbox.org> wrote:

> On Wed, 2026-06-03 at 11:58 +0200, Boris Brezillon wrote:
> > On Wed, 3 Jun 2026 11:52:47 +0200
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >  =20
> > > On Wed, 03 Jun 2026 09:43:55 +0200
> > > Philipp Stanner <phasta@mailbox.org> wrote:
> > >  =20
> > > > On Wed, 2026-06-03 at 08:48 +0200, Boris Brezillon wrote:=C2=A0  =20
> > > > > On Wed, 03 Jun 2026 08:10:51 +0200
> > > > > Philipp Stanner <phasta@mailbox.org> wrote:
> > > > > =C2=A0=C2=A0=C2=A0  =20
> > > > > > +Cc Danilo, Gary, Daniel, Christian
> > > > > > (who seem to have been lost because Sashiko dropped them and th=
is thread is a reply to that tool)
> > > > > >=20
> > > > > >=20
> > > > > > On Tue, 2026-06-02 at 15:25 +0000, Alice Ryhl wrote:=C2=A0=C2=
=A0=C2=A0  =20
> > > > > > > On Tue, Jun 02, 2026 at 02:06:43PM +0200, Philipp Stanner wro=
te:=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > > > > On Tue, 2026-06-02 at 11:59 +0000, Alice Ryhl wrote:=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =20
> > > > > > > > > On=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > > > >=20
> > > > > > > > [=E2=80=A6]
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > > > > > > >=20
> > > > > > > > > > > If you don't implement Sync, then DriverFence cannot =
be stored in an
> > > > > > > > > > > Arc. I wouldn't take away that ability unless you hav=
e to, and I don't
> > > > > > > > > > > see anything in the DriverFence API that would mean y=
ou can't do that.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > > > > > >=20
> > > > > > > > > > Nope. We explicitly agreed on this design.
> > > > > > > > > >=20
> > > > > > > > > > Just 1 DriverFence. Just 1 party that can signal it.
> > > > > > > > > > Note that we also agreed upon the Driverfence disappear=
ing with
> > > > > > > > > > .signal(), which certainly prevents several from existi=
ng, unless you
> > > > > > > > > > do an Option.take()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > > > > >=20
> > > > > > > > > I would like to clarify that I'm not suggesting any chang=
es to the
> > > > > > > > > design. Implementing Sync is not the same as having multi=
ple driver
> > > > > > > > > fences.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > > > >=20
> > > > > > > > I mean, I guess one can do that. But it's up to the driver =
then to see how it can signal its fence.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > > >=20
> > > > > > > I don't believe Sync changes anything with that regard. The s=
ignal
> > > > > > > method takes 'self', but the Sync trait only affects how '&se=
lf' methods
> > > > > > > can be called.
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > > > > > > > > > > > =C2=A0so even though
> > > > > > > > > > > > > > > the fence context may be valid for another gr=
ace period, the *pointer*
> > > > > > > > > > > > > > > to the fence context is not. The pointer coul=
d have been zeroed by the
> > > > > > > > > > > > > > > destructor.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > That particular pointer to the DriverFenceData =
could have been zeroed.
> > > > > > > > > > > > > > But potential other accessors have already craf=
ted themselves a new
> > > > > > > > > > > > > > pointer to the, by the power of RCU, still vali=
d data. That new pointer
> > > > > > > > > > > > > > is container-of-ed from struct dma_fence *f.=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > I'm not talking about the pointer to DriverFenceD=
ata, I'm talking about
> > > > > > > > > > > > > the pointer to the FenceCtx, or the pointer to th=
e data (if F is
> > > > > > > > > > > > > RcuBox).=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > > > > > > > >=20
> > > > > > > > > > > > Yeah, but the backing memory is still alive. And ne=
w pointers to that
> > > > > > > > > > > > memory get crafted by the accessors. If a callback =
accesses the data
> > > > > > > > > > > > through `container_of(Fence)`, it gets a new pointe=
r.
> > > > > > > > > > > >=20
> > > > > > > > > > > > So what's the problem?
> > > > > > > > > > > >=20
> > > > > > > > > > > > Where is the invalid pointer that someone is access=
ing?
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > The Arc type is not a type that opts-out of &mut =
=3D=3D exclusive, so the
> > > > > > > > > > > > > second drop_in_place() above is assumed exclusive=
 access to the
> > > > > > > > > > > > > Arc<FenceCtx<F,C>> field.=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0  =20
> > > > > > > > > > > >=20
> > > > > > > > > > > > OK, so I think I see the problem. So the invalid po=
inter is
> > > > > > > > > > > > Arc<FenceCtx=E2=80=A6>? And potentially the <F> poi=
nter (although we don't have
> > > > > > > > > > > > a picture yet as to how that would be accessed thro=
ugh other callbacks.
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > > > > > > > > > =C2=A0If another thread obtains a pointer to the
> > > > > > > > > > > > > FenceCtx via reading the fctx field of the Driver=
Fence in parallel with
> > > > > > > > > > > > > this, then that's not allowed because the drop_in=
_place() call has
> > > > > > > > > > > > > exclusive access to that field.=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0  =20
> > > > > > > > > > > >=20
> > > > > > > > > > > > I think I have been asking in several of our meetin=
gs in the past
> > > > > > > > > > > > whether it is actually a problem to access data tha=
t has been dropped()
> > > > > > > > > > > > IF we know that drop does not cause UAF and the ans=
wer was kind of like
> > > > > > > > > > > > a "well if it does not actually get freed=E2=80=A6"=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > > > > > > >=20
> > > > > > > > > > > Ok, well, IMO the simplest approach is to say you can=
't. There may be
> > > > > > > > > > > roundabout ways to do it, but I would suggest that we=
 just ... don't.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > > > > > >=20
> > > > > > > > > > Ack.
> > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > > > > > > > > Anyways.
> > > > > > > > > > > >=20
> > > > > > > > > > > > It would seem the way to get this right is then
> > > > > > > > > > > >=20
> > > > > > > > > > > > synchronize_rcu();
> > > > > > > > > > > > drop_in_palace(data);
> > > > > > > > > > > >=20
> > > > > > > > > > > >=20
> > > > > > > > > > > > Agreed?
> > > > > > > > > > > >=20
> > > > > > > > > > > > This would then mean, however, that every time a fe=
nce drops, you have
> > > > > > > > > > > > to wait a grace period.
> > > > > > > > > > > >=20
> > > > > > > > > > > > Or maybe stuff DriverFenceData into an RcuBox, too,=
 and defer its
> > > > > > > > > > > > dropping.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > > > > > > >=20
> > > > > > > > > > > That would work, but I think we can do better and avo=
id the
> > > > > > > > > > > synchronize_rcu() along these lines:
> > > > > > > > > > >=20
> > > > > > > > > > > unsafe trait RcuRevocable {
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0 unsafe fn rcu_revoke_in_place(ptr:=
 *mut Self);
> > > > > > > > > > > }
> > > > > > > > > > >=20
> > > > > > > > > > > This trait provides a method that's like drop_in_plac=
e(), except that
> > > > > > > > > > > when you use this destructor, the value remains usabl=
e for one grace
> > > > > > > > > > > period. You could implement it for RcuBox, and for an=
y Copy type, and
> > > > > > > > > > > for ARef<T> when T is cleaned up with rcu, and probab=
ly also other
> > > > > > > > > > > stuff.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > > > > > >=20
> > > > > > > > > > I mean, this cannot be magic. It also boils down to exe=
cuting one RCU
> > > > > > > > > > callback per DriverFence dropping.
> > > > > > > > > >=20
> > > > > > > > > > Is there a significant difference to stuffing DriverFen=
ceData into an
> > > > > > > > > > RcuBox?=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > > > > >=20
> > > > > > > > > Do you mean hard-coding that the user-data of a driver fe=
nce is always
> > > > > > > > > stored in an RcuBox?=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > > I'm talking about this:
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > > impl<F: Send + Sync + DriverFenceAllowedData, C: Send + Syn=
c> DriverFenceAllocation<F, C> {
> > > > > > > > =C2=A0=C2=A0=C2=A0 /// Create a new allocation slot that ca=
n later be used to create a fully
> > > > > > > > =C2=A0=C2=A0=C2=A0 /// initialized [`DriverFence`] without =
the need to allocate.
> > > > > > > > =C2=A0=C2=A0=C2=A0 pub fn new(fctx: Arc<FenceCtx<F, C>>, da=
ta: F) -> Result<Self> {
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data =
=3D DriverFenceData {
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 // `inner` remains uninitialized until a [`DriverFence`] takes ov=
er.
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 inner: Fence {
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inner: Opaque::uninit(),
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 },
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 fctx,
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 data,
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > > > > >=20
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // In order to s=
upport the C dma_fence callbacks, it is necessary for
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // a `Fence` and=
 a `DriverFence` to live in the same allocation,
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // because the C=
 backend passes a dma_fence, from which the driver most
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // likely wants =
to be able to access its `data` in `DriverFence`.
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Hence, we nee=
d the manage the memory manually. It will be freed by the
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // C backend aut=
omatically once the refcount within `Fence` drops to 0.
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let data =3D Rcu=
Box::new(fence_data, GFP_KERNEL | __GFP_ZERO)?;
> > > > > > > >=20
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(Self { data })
> > > > > > > > =C2=A0=C2=A0=C2=A0 }
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > > This way, the entire DriverFenceData will remain valid for =
an
> > > > > > > > additional grace period. I suppose this would solve your po=
inter-
> > > > > > > > invalid concern.
> > > > > > > >=20
> > > > > > > > However, it appears like overkill to me because the refcoun=
ting + C
> > > > > > > > backend already ensure that nothing drops too soon, and the=
 backend
> > > > > > > > frees with kfree_rcu(), so=E2=80=A6=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0  =20
> > > > > > >=20
> > > > > > > I agree that it doesn't sound like we want RcuBox here.
> > > > > > >=20
> > > > > > > What kind of metadata are we actually planning to store in the
> > > > > > > DriverFence in practice?=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0  =20
> > > > > >=20
> > > > > > I suppose it might be GPUVM payloads. IIRC in Tyr it's currentl=
y just
> > > > > > empty structs as some sort of identifier. I guess copies of the=
 actual
> > > > > > command buffers will also reside in their associated fences.
> > > > > >=20
> > > > > > But Boris, Daniel and Danilo probably have something smart to s=
ay about
> > > > > > that.=C2=A0=C2=A0=C2=A0  =20
> > > > >=20
> > > > > In Tyr we don't need any, because we're using SW signalling: we g=
et an
> > > > > interrupt, look at our HW fence seqno, and walk the set of pending
> > > > > fences to signal them with the ::signal() method (that's an
> > > > > over-simplified view of it, but functionally that's how it works).
> > > > >=20
> > > > > Now, the question is more, what drivers planning to support HW
> > > > > signaling want attached to the DriverFence. My gut feeling is tha=
t now
> > > > > that we have a way to get back to the FenceCtx, and given that Fe=
nceCtx
> > > > > also has driver-specific data attached to it, most common use cas=
es
> > > > > where the fence contains a backpointer to its timeline/creator are
> > > > > covered. If I look at nouveau_fence [1] (I intentionally looked a=
t the
> > > > > most likely next user of this) for instance:
> > > > >=20
> > > > > struct nouveau_fence {
> > > > > 	struct dma_fence base;
> > > > >=20
> > > > > 	struct list_head head;
> > > > >=20
> > > > > 	struct nouveau_channel __rcu *channel;
> > > > > 	unsigned long timeout;
> > > > > };=C2=A0=C2=A0=C2=A0  =20
> > > >=20
> > > > Thx for the explanation
> > > > =C2=A0  =20
> > > > >=20
> > > > > - channel is basically the FenceCtx in your new design
> > > > > - head is used to insert the fence in the fence context list. Not=
 too
> > > > > =C2=A0 sure how it translates in rust (insertion in an XArray ins=
tead?).
> > > > > =C2=A0 Anyway, that's just stuff you need to make your fence part=
 of the
> > > > > =C2=A0 context timeline, so it's again related to how you link a =
fence to
> > > > > =C2=A0 its context and let the context walk back pending fences w=
hen it
> > > > > =C2=A0 needs to. Feels like my original FenceTimeline abstract pr=
oposal [2]
> > > > > =C2=A0 could help make this thing generic, but let's reconsider t=
his once
> > > > > =C2=A0 we've got the basics sorted out, please
> > > > > - timeout is probably the only thing of interest here, assuming t=
hings
> > > > > =C2=A0 can be signaled out of order (if they are signaled in orde=
r, like is
> > > > > =C2=A0 the case in Tyr, the timeout can just be on the FenceCtxDa=
ta and
> > > > > =C2=A0 represent the timeout of the first fence in the set). Anyw=
ay, that's a
> > > > > =C2=A0 scalar, so no fancy ::drop() needed if that's what you're =
worried
> > > > > =C2=A0 about=C2=A0=C2=A0=C2=A0  =20
> > > >=20
> > > > What we / Alice are worried about is multiple things.
> > > >=20
> > > > One issue is that Alice believes that=20
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self.data` i=
s owned by the DriverFence, but could be accessed
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // through some dma_fenc=
e callbacks right now. Access is being revoked
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // above by signalling t=
he fence. The DriverFenceSafeToDrop trait
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ensures that the data=
 either does not need drop, or if it does it
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // lives in a RcuBox whi=
ch will delay dropping by one grace period, hence
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ensuring that all rea=
ders have disappeared.
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { drop_in_place(s=
elf.data.as_ptr()) };
> > > >=20
> > > >=20
> > > > from DriverFence::drop() invalidates the pointers that thread A
> > > > accesses, even if DriverFence::data.data's drop is delayed with RCU.
> > > >=20
> > > > Now if thread B drops DriverFence, thread A could use invalid point=
ers,
> > > > but while still operating on non-deallocated memory (because our
> > > > refcounting guards against that).=C2=A0  =20
> > >=20
> > > This is where I think our very permissive dma_fence callback design is
> > > hitting us in the face. There are callbacks that are called with the
> > > fence lock held (::enable_signalling(), ::signaled()), and because we
> > > forcibly signal on DriverFence::drop() (which requires locking as wel=
l)
> > > and then drop the DriverFenceData::data (I'd expect
> > > DriverFenceData::fctx to be manually dropped too, but I don't see
> > > that done in the current version), the problem you're describing does=
n't
> > > exist, I think. =20
>=20
> The problem of *nominally* those Rust pointers / references in
> DriverFenceData becoming invalid does exist.
>=20
> But I tend to believe that this is a syntactic theoretical problem. All
> the memory is still valid.

But accessing an Arc<Xx> that has been dropped is invalid. You just
basically rely on the implementation leaving the memory as is after it
dropped the ref it had, but there's nothing preventing it from zero-ing
the Arc<>, at which point this becomes a NULL deref. Also, when you
drop DriverFenceData::fctx, you might very well be the last FenceCtx
owner, so FenceCtx can go away at this point, meaning your in-flight
dma_fence_ops::{driver,timeline}_name() callbacks might now point to
memory that has been returned to the system and lead to a UAF.

>=20
> The FenceCtx cannot disappear because its drop is delayed with
> synchronize_rcu() (previously rcu_barrier()).

Okay, so that protects against the UAF I was mentioning, but fact the
Arc implementation doesn't give any guarantee about what happens to the
dropped Arc is still problematic.

>=20
> It's really just about the question whether
>=20
> rcu_read_lock()
> let ptr =3D something_valid_for_a_grace_period;
> drop(something_valid_for_a_grace_period); // delayed by a GP
> do_stuff_with_(ptr);
> rcu_read_unlock()
>=20
> is dangerous or not.

It's more:

thread A						| thread B			| thread C
							|				|
rcu_read_lock()						|				|
 let ptr =3D something_valid_for_a_grace_period;		|				|
							| rcu_defer(drop(ptr))		|
 do_stuff_with_(ptr);					|				|
rcu_read_unlock()					|				|
							|				| drop(ptr)

And yes, as long as the drop is always deferred I don't see an
issue. But IIUC, you were trying to not defer the drop unless
the F on DriverFenceData needs a drop. The fact DriverFenceData::fctx
is also impacted by that immediate ::drop() means you have to defer
the drop() unconditionally now.

>=20
> Alice doesn't like it =E2=80=93 but I do point out that the memory cannot=
 go
> away. So in C this is perfectly safe.

It might work, but it's very very fragile, to say the least. Honestly,
the more I think about it, the more I believe we should defer the drop
unconditionally and call it a day. Yes, it's a potential overhead,
but it's, IMHO, way better than relying on some Arc implementation
details that might change at some point.

>=20
> About Rust, I don't know.
>=20
> > >=20
> > > That leaves those that are not called with the lock held, and for
> > > which we rely on the RCU lock:
> > >=20
> > > - ::get_{driver,timeline}_name() get back to the FenceCtx to get those
> > > =C2=A0 names, and if the Arc<FenceCtx> inside the DriverFenceData is =
dropped,
> > > =C2=A0 I guess it can't be trusted
> > > - ::set_deadline() is problematic as well
> > > - ::wait() and ::release() are deprecated
> > >  =20
> > > >=20
> > > > The only way I can see to make that bullet proof would be to do
> > > > synchronize_rcu() before the drop_in_place() above =E2=80=93 but th=
at would
> > > > mean that we delay each fence drop by one grace period.=C2=A0  =20
> > >=20
> > > synchronize_rcu() in the DriverFence::drop() path is indeed not a gre=
at
> > > idea. Not only because it adds an heavy synchronization point in a
> > > potentially hot-path, but also because you're back to a situation whe=
re
> > > DriverFence users need to be very careful about the context they are
> > > when they drop these objects, and because drop() is an implicit
> > > operation most of the time, it becomes super fragile. =20
>=20
> We declared it illegal to drop a fence without signalling it. So it's
> not thaaat implicit.

What's implicit is that ::drop() is implicitly called when the object
goes out of scope.

>=20
> Moreover, the current suggestion for v2 is that we force the user to
> obey to our safety requirements:
>=20
>=20
> /// Trait to ensure that the fence implementation can safely drop the use=
r data
> /// passed in [`FenceCtx::new_fence_allocation()`].

So, if your fence is the last owner of FenceCtx, it drops the last ref,
and FenceCtx::drop() is called. In there, I guess the first thing you
do in FenceCtx::drop() which waits for a grace period to expire
which might force an unexpected blocking operation in the otherwise
super trivial atomic-safe FenceData::drop() path. Plus, then you have
to drop FenceCtx::data, which might or might not be SafeToDrop.

This is exactly the sort of complications I wanted to avoid initially,
and this is why I still think letting the user tell when it's
DriverFenceSafeToDrop is just calling for more pain.

> ///
> /// # Safety
> ///
> /// You must only implement this trait for your type if the following rul=
es are
> /// obeyed to:
> ///
> /// 1. Your type either does not need [`Drop`] at all, OR drops only afte=
r 1 RCU
> ///    grace period has passed.
> /// 2. If present, your [`Drop`] implementation performs no operations il=
legal in
> ///    atomic context, such as allocating with GFP_KERNEL.
> pub unsafe trait DriverFenceSafeToDrop {}
>=20
> https://gitlab.freedesktop.org/pstanner/linux-drm-work/-/blob/jobqueue-dm=
a-fence-v2/rust/kernel/dma_buf/dma_fence.rs?ref_type=3Dheads#L512
>=20
>=20
> That way we hit several birds with one stone. We get our delayed-by-a-
> grace-period drop, *and* we can very explicitly document: "you must not
> do atomic-hostile stuff in drop()".
>=20
> Pretty cool, right? :]

Except you don't know. Now you have to carefully audit

- FenceCtx::drop()
- FenceCtx::data::drop()

to guarantee that this is safe. Because with this API, there's no
guarantee that the FenceCtx outlives the fences it emitted. BTW,
maybe we should enforce that with lifetimes instead of having an Arc<FenceC=
tx>
in DriverFenceData.

>=20
> > >=20
> > > If we're going to force this synchronize_rcu(), I think it should be
> > > done when the FenceCtx is dropped, meaning we're back to a situation
> > > where DriverFenceData::data is also RCU-deferred with an rcu_call(),
> > > which, IIRC, was the original idea. =20
>=20
> See the trait, yes.
>=20
> > >  =20
> > > >=20
> > > > I'm still not sure how real the problem really is, though. Because
> > > > refcounting guards, and drop() doesn't actually *do* something to t=
he
> > > > pointers, or does it?=C2=A0  =20
> > >=20
> > > It doesn't do anything to the dma_fence part of the DriverFenceData,
> > > but it can touch the driver-specific part, and most importantly, it
> > > might leave it with stale information that are then re-interpreted by
> > > the dma_fence_ops callback that's still in-flight. =20
>=20
> Hmm no, I think this is all safe.

Well, this might be safe (baring the Arc invalidation I mentioned), but also
super convoluted design that's hard to audit and maintain overtime. I'm
very skeptical that this is what we want to start with just to make
sure we optimize the case where no drop on fence data is needed.

>=20
> It's really about the question whether you are allowed to access a
> pointer in Rust that has been dropped, even if you can guarantee that
> it is still valid after dropping (for a grace period).

An Arc, I don't think so.

