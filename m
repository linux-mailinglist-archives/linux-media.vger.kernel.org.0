Return-Path: <linux-media+bounces-63584-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w3HsKdAUIGpTvgAAu9opvQ
	(envelope-from <linux-media+bounces-63584-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 13:49:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EF8637375
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 13:49:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=wTxtGxUz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63584-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63584-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C06323020FE6
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 11:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2813D0C04;
	Wed,  3 Jun 2026 11:49:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EC0225397
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 11:49:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487370; cv=none; b=miRJnJi+hC6Gi4f4LJUIxpTnstn/FKe5wjPLLLUnreQpY8o0KDr2mAlGgoj0Zmxe2gqt+9mYGqWzR8ZTipoXSjk6bMAvk1Lp4gCCYcCxE/E6zbCwj+T3El9TTN1JWAPuratesl9e43uZqYNPQ2VzBOuqxOZWxASu72FVRTVyQLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487370; c=relaxed/simple;
	bh=+0837MDE/tnW1iM7AEgyrltbSPfqxmU0TaHL2LAQKDs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uf67vPEjfvP2pGqV2QahijuP/XLxq6ENEsmfwGpKp2Xu0myAksO3E6rhn4omvOVStYCzcNbiC9Z2DX6ni2TdJcw0jhZK6fFqqqEIqGuxqflpzlh3uhSfKop2HfBRRDodABARXFLqh51yXOsGxz0qbgw1P5UKXLQQWD9eY4uUovI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wTxtGxUz; arc=none smtp.client-ip=80.241.56.171
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gVmFb3f3qz9sTh;
	Wed,  3 Jun 2026 13:49:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780487363; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9n16+odR0Rvupk6K/BFKAl6CnTMidWci5OPasLiPb8U=;
	b=wTxtGxUzajxBxYVZEX4O0AbjUQteDTmLL5YzeCI87DkOCxvxUNeyAdbAUzNbDdBl0Pszj/
	03BJ2+q7EZLfL7KLiLnZG2vZR4YttwOuldirNppAiG+tpm8sdYP2/clq9R9PwskZQWunh9
	zbJGxUa/v7fw7mZC8zEMwWSJ+XUgoWe95GNbOz/YPzRz6Wzg0q9b17CyXkPSLDfDg3xrfv
	RAbMsFpnHKSz8pWH4+2+uPJYHOsZziVxGtUND1Tci7ASiNDJ6fQHgIaTQSy+3EwwNwK2dm
	t5nkPB94mY9Rov9rNMLkdbGNc57kLspdf4jxh443E2Gj9A76ttd2fCdlpYBuZA==
Message-ID: <6df53a0ee6b205de7aff34c2901f51b1a1f0a34e.camel@mailbox.org>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: phasta@kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org,
 ojeda@kernel.org,  Danilo Krummrich	 <dakr@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,  Gary Guo
 <gary@garyguo.net>, Daniel Almeida <daniel.almeida@collabora.com>
Date: Wed, 03 Jun 2026 13:49:19 +0200
In-Reply-To: <20260603132259.42184da0@fedora-2.home>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: yhawrsamaqzsgj73xnjzuxic67dorjrh
X-MBO-RS-ID: 58e2b9a377378af10b3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63584-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:aliceryhl@google.com,m:sashiko-reviews@lists.linux.dev,m:linux-media@vger.kernel.org,m:ojeda@kernel.org,m:dakr@kernel.org,m:christian.koenig@amd.com,m:gary@garyguo.net,m:daniel.almeida@collabora.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,mailbox.org:from_mime,mailbox.org:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0EF8637375

On Wed, 2026-06-03 at 13:22 +0200, Boris Brezillon wrote:
> On Wed, 03 Jun 2026 12:07:42 +0200
> Philipp Stanner <phasta@mailbox.org> wrote:
>=20
> > On Wed, 2026-06-03 at 11:58 +0200, Boris Brezillon wrote:
> > > On Wed, 3 Jun 2026 11:52:47 +0200
> > > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > > =C2=A0=20
> > > > On Wed, 03 Jun 2026 09:43:55 +0200
> > > > Philipp Stanner <phasta@mailbox.org> wrote:
> > > > =C2=A0=20
> > > > > On Wed, 2026-06-03 at 08:48 +0200, Boris Brezillon wrote:=C2=A0=
=C2=A0=C2=A0=20
> > > > > > On Wed, 03 Jun 2026 08:10:51 +0200
> > > > > > Philipp Stanner <phasta@mailbox.org> wrote:
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > > > > +Cc Danilo, Gary, Daniel, Christian
> > > > > > > (who seem to have been lost because Sashiko dropped them and =
this thread is a reply to that tool)
> > > > > > >=20
> > > > > > >=20
> > > > > > > On Tue, 2026-06-02 at 15:25 +0000, Alice Ryhl wrote:=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
> > > > > > > > On Tue, Jun 02, 2026 at 02:06:43PM +0200, Philipp Stanner w=
rote:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > > > > > > On Tue, 2026-06-02 at 11:59 +0000, Alice Ryhl wrote:=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > > > > > > > On=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > > > > > >=20
> > > > > > > > > [=E2=80=A6]
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > > > > > > > > >=20
> > > > > > > > > > > > If you don't implement Sync, then DriverFence canno=
t be stored in an
> > > > > > > > > > > > Arc. I wouldn't take away that ability unless you h=
ave to, and I don't
> > > > > > > > > > > > see anything in the DriverFence API that would mean=
 you can't do that.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > > > > > > > >=20
> > > > > > > > > > > Nope. We explicitly agreed on this design.
> > > > > > > > > > >=20
> > > > > > > > > > > Just 1 DriverFence. Just 1 party that can signal it.
> > > > > > > > > > > Note that we also agreed upon the Driverfence disappe=
aring with
> > > > > > > > > > > .signal(), which certainly prevents several from exis=
ting, unless you
> > > > > > > > > > > do an Option.take()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=20
> > > > > > > > > >=20
> > > > > > > > > > I would like to clarify that I'm not suggesting any cha=
nges to the
> > > > > > > > > > design. Implementing Sync is not the same as having mul=
tiple driver
> > > > > > > > > > fences.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > > > > > >=20
> > > > > > > > > I mean, I guess one can do that. But it's up to the drive=
r then to see how it can signal its fence.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=20
> > > > > > > >=20
> > > > > > > > I don't believe Sync changes anything with that regard. The=
 signal
> > > > > > > > method takes 'self', but the Sync trait only affects how '&=
self' methods
> > > > > > > > can be called.
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > > > > > > > > > > > > > =C2=A0so even though
> > > > > > > > > > > > > > > > the fence context may be valid for another =
grace period, the *pointer*
> > > > > > > > > > > > > > > > to the fence context is not. The pointer co=
uld have been zeroed by the
> > > > > > > > > > > > > > > > destructor.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=20
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > That particular pointer to the DriverFenceDat=
a could have been zeroed.
> > > > > > > > > > > > > > > But potential other accessors have already cr=
afted themselves a new
> > > > > > > > > > > > > > > pointer to the, by the power of RCU, still va=
lid data. That new pointer
> > > > > > > > > > > > > > > is container-of-ed from struct dma_fence *f.=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > I'm not talking about the pointer to DriverFenc=
eData, I'm talking about
> > > > > > > > > > > > > > the pointer to the FenceCtx, or the pointer to =
the data (if F is
> > > > > > > > > > > > > > RcuBox).=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=20
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Yeah, but the backing memory is still alive. And =
new pointers to that
> > > > > > > > > > > > > memory get crafted by the accessors. If a callbac=
k accesses the data
> > > > > > > > > > > > > through `container_of(Fence)`, it gets a new poin=
ter.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > So what's the problem?
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Where is the invalid pointer that someone is acce=
ssing?
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > The Arc type is not a type that opts-out of &mu=
t =3D=3D exclusive, so the
> > > > > > > > > > > > > > second drop_in_place() above is assumed exclusi=
ve access to the
> > > > > > > > > > > > > > Arc<FenceCtx<F,C>> field.=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=20
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > OK, so I think I see the problem. So the invalid =
pointer is
> > > > > > > > > > > > > Arc<FenceCtx=E2=80=A6>? And potentially the <F> p=
ointer (although we don't have
> > > > > > > > > > > > > a picture yet as to how that would be accessed th=
rough other callbacks.
> > > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > > > > > > > > > > > =C2=A0If another thread obtains a pointer to th=
e
> > > > > > > > > > > > > > FenceCtx via reading the fctx field of the Driv=
erFence in parallel with
> > > > > > > > > > > > > > this, then that's not allowed because the drop_=
in_place() call has
> > > > > > > > > > > > > > exclusive access to that field.=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > I think I have been asking in several of our meet=
ings in the past
> > > > > > > > > > > > > whether it is actually a problem to access data t=
hat has been dropped()
> > > > > > > > > > > > > IF we know that drop does not cause UAF and the a=
nswer was kind of like
> > > > > > > > > > > > > a "well if it does not actually get freed=E2=80=
=A6"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > > > > > > > > >=20
> > > > > > > > > > > > Ok, well, IMO the simplest approach is to say you c=
an't. There may be
> > > > > > > > > > > > roundabout ways to do it, but I would suggest that =
we just ... don't.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > > > > > > > >=20
> > > > > > > > > > > Ack.
> > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > > > > > > > > > > Anyways.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > It would seem the way to get this right is then
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > synchronize_rcu();
> > > > > > > > > > > > > drop_in_palace(data);
> > > > > > > > > > > > >=20
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Agreed?
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > This would then mean, however, that every time a =
fence drops, you have
> > > > > > > > > > > > > to wait a grace period.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Or maybe stuff DriverFenceData into an RcuBox, to=
o, and defer its
> > > > > > > > > > > > > dropping.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=20
> > > > > > > > > > > >=20
> > > > > > > > > > > > That would work, but I think we can do better and a=
void the
> > > > > > > > > > > > synchronize_rcu() along these lines:
> > > > > > > > > > > >=20
> > > > > > > > > > > > unsafe trait RcuRevocable {
> > > > > > > > > > > > =C2=A0=C2=A0=C2=A0 unsafe fn rcu_revoke_in_place(pt=
r: *mut Self);
> > > > > > > > > > > > }
> > > > > > > > > > > >=20
> > > > > > > > > > > > This trait provides a method that's like drop_in_pl=
ace(), except that
> > > > > > > > > > > > when you use this destructor, the value remains usa=
ble for one grace
> > > > > > > > > > > > period. You could implement it for RcuBox, and for =
any Copy type, and
> > > > > > > > > > > > for ARef<T> when T is cleaned up with rcu, and prob=
ably also other
> > > > > > > > > > > > stuff.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=20
> > > > > > > > > > >=20
> > > > > > > > > > > I mean, this cannot be magic. It also boils down to e=
xecuting one RCU
> > > > > > > > > > > callback per DriverFence dropping.
> > > > > > > > > > >=20
> > > > > > > > > > > Is there a significant difference to stuffing DriverF=
enceData into an
> > > > > > > > > > > RcuBox?=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > > > > > > >=20
> > > > > > > > > > Do you mean hard-coding that the user-data of a driver =
fence is always
> > > > > > > > > > stored in an RcuBox?=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=20
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > I'm talking about this:
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > impl<F: Send + Sync + DriverFenceAllowedData, C: Send + S=
ync> DriverFenceAllocation<F, C> {
> > > > > > > > > =C2=A0=C2=A0=C2=A0 /// Create a new allocation slot that =
can later be used to create a fully
> > > > > > > > > =C2=A0=C2=A0=C2=A0 /// initialized [`DriverFence`] withou=
t the need to allocate.
> > > > > > > > > =C2=A0=C2=A0=C2=A0 pub fn new(fctx: Arc<FenceCtx<F, C>>, =
data: F) -> Result<Self> {
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data=
 =3D DriverFenceData {
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 // `inner` remains uninitialized until a [`DriverFence`] takes ov=
er.
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 inner: Fence {
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inner: Opaque::uninit(),
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 },
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 fctx,
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 data,
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > > > > > > > >=20
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // In order to=
 support the C dma_fence callbacks, it is necessary for
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // a `Fence` a=
nd a `DriverFence` to live in the same allocation,
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // because the=
 C backend passes a dma_fence, from which the driver most
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // likely want=
s to be able to access its `data` in `DriverFence`.
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Hence, we n=
eed the manage the memory manually. It will be freed by the
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // C backend a=
utomatically once the refcount within `Fence` drops to 0.
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let data =3D R=
cuBox::new(fence_data, GFP_KERNEL | __GFP_ZERO)?;
> > > > > > > > >=20
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(Self { data=
 })
> > > > > > > > > =C2=A0=C2=A0=C2=A0 }
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > This way, the entire DriverFenceData will remain valid fo=
r an
> > > > > > > > > additional grace period. I suppose this would solve your =
pointer-
> > > > > > > > > invalid concern.
> > > > > > > > >=20
> > > > > > > > > However, it appears like overkill to me because the refco=
unting + C
> > > > > > > > > backend already ensure that nothing drops too soon, and t=
he backend
> > > > > > > > > frees with kfree_rcu(), so=E2=80=A6=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=20
> > > > > > > >=20
> > > > > > > > I agree that it doesn't sound like we want RcuBox here.
> > > > > > > >=20
> > > > > > > > What kind of metadata are we actually planning to store in =
the
> > > > > > > > DriverFence in practice?=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=20
> > > > > > >=20
> > > > > > > I suppose it might be GPUVM payloads. IIRC in Tyr it's curren=
tly just
> > > > > > > empty structs as some sort of identifier. I guess copies of t=
he actual
> > > > > > > command buffers will also reside in their associated fences.
> > > > > > >=20
> > > > > > > But Boris, Daniel and Danilo probably have something smart to=
 say about
> > > > > > > that.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > > >=20
> > > > > > In Tyr we don't need any, because we're using SW signalling: we=
 get an
> > > > > > interrupt, look at our HW fence seqno, and walk the set of pend=
ing
> > > > > > fences to signal them with the ::signal() method (that's an
> > > > > > over-simplified view of it, but functionally that's how it work=
s).
> > > > > >=20
> > > > > > Now, the question is more, what drivers planning to support HW
> > > > > > signaling want attached to the DriverFence. My gut feeling is t=
hat now
> > > > > > that we have a way to get back to the FenceCtx, and given that =
FenceCtx
> > > > > > also has driver-specific data attached to it, most common use c=
ases
> > > > > > where the fence contains a backpointer to its timeline/creator =
are
> > > > > > covered. If I look at nouveau_fence [1] (I intentionally looked=
 at the
> > > > > > most likely next user of this) for instance:
> > > > > >=20
> > > > > > struct nouveau_fence {
> > > > > > 	struct dma_fence base;
> > > > > >=20
> > > > > > 	struct list_head head;
> > > > > >=20
> > > > > > 	struct nouveau_channel __rcu *channel;
> > > > > > 	unsigned long timeout;
> > > > > > };=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > >=20
> > > > > Thx for the explanation
> > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > >=20
> > > > > > - channel is basically the FenceCtx in your new design
> > > > > > - head is used to insert the fence in the fence context list. N=
ot too
> > > > > > =C2=A0 sure how it translates in rust (insertion in an XArray i=
nstead?).
> > > > > > =C2=A0 Anyway, that's just stuff you need to make your fence pa=
rt of the
> > > > > > =C2=A0 context timeline, so it's again related to how you link =
a fence to
> > > > > > =C2=A0 its context and let the context walk back pending fences=
 when it
> > > > > > =C2=A0 needs to. Feels like my original FenceTimeline abstract =
proposal [2]
> > > > > > =C2=A0 could help make this thing generic, but let's reconsider=
 this once
> > > > > > =C2=A0 we've got the basics sorted out, please
> > > > > > - timeout is probably the only thing of interest here, assuming=
 things
> > > > > > =C2=A0 can be signaled out of order (if they are signaled in or=
der, like is
> > > > > > =C2=A0 the case in Tyr, the timeout can just be on the FenceCtx=
Data and
> > > > > > =C2=A0 represent the timeout of the first fence in the set). An=
yway, that's a
> > > > > > =C2=A0 scalar, so no fancy ::drop() needed if that's what you'r=
e worried
> > > > > > =C2=A0 about=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > >=20
> > > > > What we / Alice are worried about is multiple things.
> > > > >=20
> > > > > One issue is that Alice believes that=20
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self.data`=
 is owned by the DriverFence, but could be accessed
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // through some dma_fe=
nce callbacks right now. Access is being revoked
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // above by signalling=
 the fence. The DriverFenceSafeToDrop trait
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ensures that the da=
ta either does not need drop, or if it does it
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // lives in a RcuBox w=
hich will delay dropping by one grace period, hence
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ensuring that all r=
eaders have disappeared.
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { drop_in_place=
(self.data.as_ptr()) };
> > > > >=20
> > > > >=20
> > > > > from DriverFence::drop() invalidates the pointers that thread A
> > > > > accesses, even if DriverFence::data.data's drop is delayed with R=
CU.
> > > > >=20
> > > > > Now if thread B drops DriverFence, thread A could use invalid poi=
nters,
> > > > > but while still operating on non-deallocated memory (because our
> > > > > refcounting guards against that).=C2=A0=C2=A0=C2=A0=20
> > > >=20
> > > > This is where I think our very permissive dma_fence callback design=
 is
> > > > hitting us in the face. There are callbacks that are called with th=
e
> > > > fence lock held (::enable_signalling(), ::signaled()), and because =
we
> > > > forcibly signal on DriverFence::drop() (which requires locking as w=
ell)
> > > > and then drop the DriverFenceData::data (I'd expect
> > > > DriverFenceData::fctx to be manually dropped too, but I don't see
> > > > that done in the current version), the problem you're describing do=
esn't
> > > > exist, I think.=C2=A0=20
> >=20
> > The problem of *nominally* those Rust pointers / references in
> > DriverFenceData becoming invalid does exist.
> >=20
> > But I tend to believe that this is a syntactic theoretical problem. All
> > the memory is still valid.
>=20
> But accessing an Arc<Xx> that has been dropped is invalid. You just
> basically rely on the implementation leaving the memory as is after it
> dropped the ref it had, but there's nothing preventing it from zero-ing
> the Arc<>, at which point this becomes a NULL deref. Also, when you
> drop DriverFenceData::fctx, you might very well be the last FenceCtx
> owner, so FenceCtx can go away at this point, meaning your in-flight
> dma_fence_ops::{driver,timeline}_name() callbacks might now point to
> memory that has been returned to the system and lead to a UAF.

Nope.
The Arc<fctx> can earliest disappear once the DriverFence dropped. The
Arc<fctx> has been allocated with DriverFenceAllocation. That memory
only does become re-usable once dma_fence_put() in DriverFence::drop()
releases the memory.

A consuming / reading Fence also holds a refcount.

The FenceCtx on the other hand delays its drop() by an RCU grace
period. So until all accessors are gone.

Where is the problem?

>=20
> >=20
> > The FenceCtx cannot disappear because its drop is delayed with
> > synchronize_rcu() (previously rcu_barrier()).
>=20
> Okay, so that protects against the UAF I was mentioning, but fact the
> Arc implementation doesn't give any guarantee about what happens to the
> dropped Arc is still problematic.

Well yes, that's the "what does drop() really do" issue I was
mentioning.

Anyways.
Can you think of a solution?

>=20
> >=20
> > It's really just about the question whether
> >=20
> > rcu_read_lock()
> > let ptr =3D something_valid_for_a_grace_period;
> > drop(something_valid_for_a_grace_period); // delayed by a GP
> > do_stuff_with_(ptr);
> > rcu_read_unlock()
> >=20
> > is dangerous or not.
>=20
> It's more:
>=20
> thread A						| thread B			| thread C
> 							|				|
> rcu_read_lock()						|				|
> =C2=A0let ptr =3D something_valid_for_a_grace_period;		|				|
> 							| rcu_defer(drop(ptr))		|
> =C2=A0do_stuff_with_(ptr);					|				|
> rcu_read_unlock()					|				|
> 							|				| drop(ptr)
>=20

Yep, that's what I meant, but was too lazy to draw it properly <.<

> And yes, as long as the drop is always deferred I don't see an
> issue. But IIUC, you were trying to not defer the drop unless
> the F on DriverFenceData needs a drop. The fact DriverFenceData::fctx
> is also impacted by that immediate ::drop() means you have to defer
> the drop() unconditionally now.

I have to defer the drop() *of the FenceCtx* unconditionally. Which is
fine, because how often does that happen?

>=20
> >=20
> > Alice doesn't like it =E2=80=93 but I do point out that the memory cann=
ot go
> > away. So in C this is perfectly safe.
>=20
> It might work, but it's very very fragile, to say the least. Honestly,
> the more I think about it, the more I believe we should defer the drop
> unconditionally and call it a day. Yes, it's a potential overhead,
> but it's, IMHO, way better than relying on some Arc implementation
> details that might change at some point.

That or perhaps Revocable. But since Revocable also just defers
unconditionally AFAICT=E2=80=A6

That said, is it legal to always wait a grace period?

>=20
> >=20
> > About Rust, I don't know.
> >=20
> > > >=20
> > > > That leaves those that are not called with the lock held, and for
> > > > which we rely on the RCU lock:
> > > >=20
> > > > - ::get_{driver,timeline}_name() get back to the FenceCtx to get th=
ose
> > > > =C2=A0 names, and if the Arc<FenceCtx> inside the DriverFenceData i=
s dropped,
> > > > =C2=A0 I guess it can't be trusted
> > > > - ::set_deadline() is problematic as well
> > > > - ::wait() and ::release() are deprecated
> > > > =C2=A0=20
> > > > >=20
> > > > > The only way I can see to make that bullet proof would be to do
> > > > > synchronize_rcu() before the drop_in_place() above =E2=80=93 but =
that would
> > > > > mean that we delay each fence drop by one grace period.=C2=A0=C2=
=A0=C2=A0=20
> > > >=20
> > > > synchronize_rcu() in the DriverFence::drop() path is indeed not a g=
reat
> > > > idea. Not only because it adds an heavy synchronization point in a
> > > > potentially hot-path, but also because you're back to a situation w=
here
> > > > DriverFence users need to be very careful about the context they ar=
e
> > > > when they drop these objects, and because drop() is an implicit
> > > > operation most of the time, it becomes super fragile.=C2=A0=20
> >=20
> > We declared it illegal to drop a fence without signalling it. So it's
> > not thaaat implicit.
>=20
> What's implicit is that ::drop() is implicitly called when the object
> goes out of scope.

Ack.

>=20
> >=20
> > Moreover, the current suggestion for v2 is that we force the user to
> > obey to our safety requirements:
> >=20
> >=20
> > /// Trait to ensure that the fence implementation can safely drop the u=
ser data
> > /// passed in [`FenceCtx::new_fence_allocation()`].
>=20
> So, if your fence is the last owner of FenceCtx, it drops the last ref,
> and FenceCtx::drop() is called. In there, I guess the first thing you
> do in FenceCtx::drop() which waits for a grace period to expire
> which might force an unexpected blocking operation in the otherwise
> super trivial atomic-safe FenceData::drop() path.
>=20

IF the driver has already dropped its separate reference to FenceCtx,
which it must have around somewhere, no?

So that could only happen if a FenceCtx gets dropped *before* the last
fence. That would only happen if the driver is tearing down, typically.

But to be safe we could also demand the trait on FenceCtx::data.

>  Plus, then you have
> to drop FenceCtx::data, which might or might not be SafeToDrop.
>=20
> This is exactly the sort of complications I wanted to avoid initially,
> and this is why I still think letting the user tell when it's
> DriverFenceSafeToDrop is just calling for more pain.

The trait is at the very least useful for documenting what the driver
must not do in its data::drop().

>=20
> > ///
> > /// # Safety
> > ///
> > /// You must only implement this trait for your type if the following r=
ules are
> > /// obeyed to:
> > ///
> > /// 1. Your type either does not need [`Drop`] at all, OR drops only af=
ter 1 RCU
> > ///=C2=A0=C2=A0=C2=A0 grace period has passed.
> > /// 2. If present, your [`Drop`] implementation performs no operations =
illegal in
> > ///=C2=A0=C2=A0=C2=A0 atomic context, such as allocating with GFP_KERNE=
L.
> > pub unsafe trait DriverFenceSafeToDrop {}
> >=20
> > https://gitlab.freedesktop.org/pstanner/linux-drm-work/-/blob/jobqueue-=
dma-fence-v2/rust/kernel/dma_buf/dma_fence.rs?ref_type=3Dheads#L512
> >=20
> >=20
> > That way we hit several birds with one stone. We get our delayed-by-a-
> > grace-period drop, *and* we can very explicitly document: "you must not
> > do atomic-hostile stuff in drop()".
> >=20
> > Pretty cool, right? :]
>=20
> Except you don't know. Now you have to carefully audit
>=20
> - FenceCtx::drop()
> - FenceCtx::data::drop()

Not our responsibility. Whoever implements the trait needs to audit
that.

The alternative is to stuff the data into an RcuBox unconditionally, if
it does implement a drop().

>=20
> to guarantee that this is safe. Because with this API, there's no
> guarantee that the FenceCtx outlives the fences it emitted. BTW,
> maybe we should enforce that with lifetimes instead of having an Arc<Fenc=
eCtx>
> in DriverFenceData.

What. How is that not enforced?

Each DriverFence refcounts the FenceCtx. It is impossible for the
FenceCtx to disappear before a DriverFence.

>=20
> >=20
> > > >=20
> > > > If we're going to force this synchronize_rcu(), I think it should b=
e
> > > > done when the FenceCtx is dropped, meaning we're back to a situatio=
n
> > > > where DriverFenceData::data is also RCU-deferred with an rcu_call()=
,
> > > > which, IIRC, was the original idea.=C2=A0=20
> >=20
> > See the trait, yes.
> >=20
> > > > =C2=A0=20
> > > > >=20
> > > > > I'm still not sure how real the problem really is, though. Becaus=
e
> > > > > refcounting guards, and drop() doesn't actually *do* something to=
 the
> > > > > pointers, or does it?=C2=A0=C2=A0=C2=A0=20
> > > >=20
> > > > It doesn't do anything to the dma_fence part of the DriverFenceData=
,
> > > > but it can touch the driver-specific part, and most importantly, it
> > > > might leave it with stale information that are then re-interpreted =
by
> > > > the dma_fence_ops callback that's still in-flight.=C2=A0=20
> >=20
> > Hmm no, I think this is all safe.
>=20
> Well, this might be safe (baring the Arc invalidation I mentioned), but a=
lso
> super convoluted design that's hard to audit and maintain overtime. I'm
> very skeptical that this is what we want to start with just to make
> sure we optimize the case where no drop on fence data is needed.

It is super convoluted.

Please remember that we started out with a far simpler design, but the
demand was made that we must already prepare for future support of
is_signaled() callback & partner.

Without the hw_signalling callbacks, we simply had

Fence
  |
  | refcounts
  V=20
DriverFence

both of which lived in their own allocations. Was super simple, well
maintainable.


I think we are approaching the point where we simply have "to die one
[of many possible] deaths" (a german saying)

>=20
> >=20
> > It's really about the question whether you are allowed to access a
> > pointer in Rust that has been dropped, even if you can guarantee that
> > it is still valid after dropping (for a grace period).
>=20
> An Arc, I don't think so.

I don't know. See further above. The Arc's memory cannot be touched by
anyone, cannot be reused.


P.

