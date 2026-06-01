Return-Path: <linux-media+bounces-63256-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH7FAN6FHWq5bQkAu9opvQ
	(envelope-from <linux-media+bounces-63256-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:15:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 539B361FDDB
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:15:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51EC9300EAAA
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 13:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8EA2374E47;
	Mon,  1 Jun 2026 13:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="W3Rs9bQd"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BF336F434
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 13:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780319654; cv=none; b=OHUXKwzsKSuhNRQmdzftQCJ4ktcpwhSmB+mApLegudumE+XT1sClVVhGQepxQUHlEwkvVSVw++B5XEIb1wMbmYLtK8H6YMt2Uld+FPidn36QCuOZmLPvn0uL2WVUL7TDr1arIQA5raNYKMIPNMi3Et2Ng1rOUypmKwE+/mpyy8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780319654; c=relaxed/simple;
	bh=kWYr/sGOlkYaP/IlGre85FljeKIYxmCT+ALZVyn3QeA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PAxCQT+U2qyfUh//k55GkJTMccDA12mo23SGyav0htBv//Vc2FFgH/UzeNrKkMCEJjHZGhaV3Rb3ilt1AFKg9c0yBG4UyrFYRYImkdyWwdguKCM/7N95x+sGQ+BMsS/NHs7v0XgFYIiREMgtVKaKYIcEQiZFGNp6z9a0jITji0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=W3Rs9bQd; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gTZDK2kNZz9v4J;
	Mon,  1 Jun 2026 15:14:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780319649; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vjq3QYgmmGW0ARK3lBSeF5oGty5b95jocBxlOKmuats=;
	b=W3Rs9bQd/XTXflkXGpzTyAkCMyvpu0cygl35d5gsPDoLZ0kPMW20/I+Fw+CGoMAxv2MZlO
	vIj4bJJKT4MB8gPs8D7aVfSkGdZgQkualRnBkCoxOUjn5VR+B7t8GUN1Q2taNea1CuK2Vi
	i6NB5HFq41ZBGk1vv45SCaKScOq8v8u0wip8jmPt1xyfAI3FcK9ZZrTbHB6jMsFJP2CSjd
	71/tM/EvZyj5w6JXD6ZGkzbP6wXvda9q9DQnsk+PI/Drkxx6iOsWjeePiRf+2l+ueVDqyW
	tcQny9hztsXLWJn1tofa3O+IBhZWRYkqgpJSYm4Hgk9hUwm+jyRiRtpXzD+1gw==
Message-ID: <24ef07ed85d9e7aa7f9d3a96301c4c15bc0f2315.camel@mailbox.org>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Alice Ryhl <aliceryhl@google.com>, phasta@kernel.org
Cc: sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org, 
	ojeda@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>
Date: Mon, 01 Jun 2026 15:14:05 +0200
In-Reply-To: <CAH5fLggvxGwJkAp+VqG7pA-e2zM-T8_DR0DeCiZiJyM+o51DuQ@mail.gmail.com>
References: <20260530143541.229628-5-phasta@kernel.org>
	 <20260530150622.393FC1F00893@smtp.kernel.org> <ah1c3NSU-4UkdUhb@google.com>
	 <a3d09b270e6effb6f2bfb5d7ba8de48e3c2c4081.camel@mailbox.org>
	 <CAH5fLggvxGwJkAp+VqG7pA-e2zM-T8_DR0DeCiZiJyM+o51DuQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 8hdtzsz1s1i1ubgfi9hbuz1octpwn1co
X-MBO-RS-ID: a47d8c8860d6ee95f43
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim];
	TAGGED_FROM(0.00)[bounces-63256-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Queue-Id: 539B361FDDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

+Cc Boris

On Mon, 2026-06-01 at 14:55 +0200, Alice Ryhl wrote:
> On Mon, Jun 1, 2026 at 2:34=E2=80=AFPM Philipp Stanner <phasta@mailbox.or=
g> wrote:
> >=20
> > On Mon, 2026-06-01 at 10:20 +0000, Alice Ryhl wrote:
> > > On Sat, May 30, 2026 at 03:06:21PM +0000, sashiko-bot@kernel.org=C2=
=A0wrote:
> > > > > +impl<F: Send + Sync, C: Send + Sync> DriverFence<F, C> {
> > > > > +=C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::dma_fence =
{
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Valid beca=
use `self` is valid.
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data =3D un=
safe { &mut *self.data.as_ptr() };
> > > >=20
> > > > [Severity: High]
> > > > Does this create an exclusive mutable reference to actively shared =
memory?
> > > >=20
> > > > DriverFenceData can be accessed concurrently by other threads holdi=
ng Fence
> > > > references (for instance, when checking if the fence is signaled). =
Creating
> > > > a mutable reference (&mut) in Rust asserts exclusive access and vio=
lates
> > > > aliasing rules, which allows the compiler to make invalid optimizat=
ion
> > > > assumptions.
> > > >=20
> > > > Could this use an immutable reference &*self.data.as_ptr() instead?
> > >=20
> > > Yes, please use an immutable reference here.
> > >=20
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence_data.inner.inne=
r.get()
> > > > > +=C2=A0=C2=A0=C2=A0 }
> > > >=20
> > > > [ ... ]
> > > >=20
> > > > > +impl<F: Send + Sync, C: Send + Sync> DriverFenceBorrow<F, C> {
> > > > > +=C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::dma_fence =
{
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Valid beca=
use `self` is valid.
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data =3D un=
safe { &mut *self.data.as_ptr() };
> > > >=20
> > > > [Severity: High]
> > > > Similar to DriverFence::as_raw(), does this also incorrectly create=
 a
> > > > mutable reference to shared data?
> > >=20
> > > Here as well.
> >=20
> > `data` is not shared. By design there is only ever one DriverFence, and
> > the driver's data (`data.data`) is `Sync`.
> >=20
> > But I guess an immutable one should do the trick, too.
>=20
> There's only one DriverFence, but I can perform shared access to that
> one DriverFence from two threads in parallel. You made the type Sync,
> and this is what you are allowing when you do so.

Nope, DriverFence is just Send, not Sync.

data.data is Sync, but `data` in the code above is not the actual user
data, but the memory backing it up.

>=20
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 bindings::dma_fence_signal_locked(fence);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 bindings::dma_fence_unlock_irqrestore(fence, flag_ptr);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self.data=
` is owned by the DriverFence, but could be accessed
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // through some dma_f=
ence callbacks right now. Access is being revoked
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // above by signallin=
g the fence. The DriverFenceAllowedData trait
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ensures that the d=
ata either does not need drop, or if it does it
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // lives in a RcuBox =
which will delay dropping by one grace period, hence
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ensuring that all =
readers have disappeared.
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { drop_in_plac=
e(self.data.as_ptr()) };
> > > >=20
> > > > [Severity: Critical]
> > > > Could this eagerly drop FenceCtx and user data before the C dma_fen=
ce
> > > > refcount reaches 0?
> > > >=20
> > > > The C dma_fence object can remain alive as long as consumers (like =
sync_file
> > > > or the GPU scheduler) hold references to it. If the backend later i=
nvokes
> > > > callbacks like ops->get_driver_name(), FenceCtx::get_driver_name() =
would
> > > > attempt to read fctx.driver_name from the already-dropped FenceCtx:
> > > >=20
> > > > FenceCtx::get_driver_name() {
> > > > =C2=A0=C2=A0=C2=A0 ...
> > > > =C2=A0=C2=A0=C2=A0 fctx.driver_name.as_char_ptr()
> > > > }
> > > >=20
> > > > Can this result in a use-after-free?
> > >=20
> > > Hmm, I don't know about what sahisko said, but I don't think this is =
the
> > > right way to do rcu freeing. I think the type's destructor should be
> > > reserved for cases where the value becomes immediately unusable.
> >=20
> > We could guard the strings with RcuBox, but we could not then guard the
> > FenceCtx code against code UAF if we don't have the rcu_barrier().
> >=20
> > Or could we?
> >=20
> > If a rust module unloads, module::remove() should contain an
> > rcu_barrier() (right??). Would that be enough to guard against the
> > FenceCtx code being unloaded?
> >=20
> > >=20
> > > For example, let's say I'm using RcuBox<_> here. Yes, the data you ge=
t
> > > from dereferencing the RcuBox will stay alive for a grace period, but
> > > IMO once you run the destructor of the box itself, the *pointer* beco=
mes
> > > immediately unusable.
> >=20
> > I don't know why you're stressing the pointer?
> >=20
> > The trick above is simply that drop / dealloc *and* code unloading is
> > delayed by a grace period.
>=20
> Sorry let me try to rephrase. I'm not worried about the stuff behind
> the pointer. After all, you're using RcuBox to protect that stuff.
> What I'm worried about is the pointer itself. You invoked
> drop_in_place() on the pointer to the fence context,
>=20

on the pointer to DriverFenceData, which contains a refcount to the
FenceCtx, which might then want to drop.

>  so even though
> the fence context may be valid for another grace period, the *pointer*
> to the fence context is not. The pointer could have been zeroed by the
> destructor.

That particular pointer to the DriverFenceData could have been zeroed.
But potential other accessors have already crafted themselves a new
pointer to the, by the power of RCU, still valid data. That new pointer
is container-of-ed from struct dma_fence *f.

>=20
> Actually maybe I am worried about the strings too. Let's say that one
> thread does:
>=20
> rcu_read_lock()
> get_driver_name()
> // .. read the driver name
> rcu_read_unlock()
>=20
> and another thread signals the fence. If there are no queued
> call_rcu() callbacks right now, then the rcu_barrier() could be a
> no-op and the rcu reader will UAF on the driver name. It looks like
> you need synchronize_rcu() rather than rcu_barrier() here?

It would seem to me that you are right.

Boris, do you have an opinion on that?


P.

>=20
> Alice

