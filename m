Return-Path: <linux-media+bounces-63561-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HbKpKwL2H2ootQAAu9opvQ
	(envelope-from <linux-media+bounces-63561-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:38:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9B3636396
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 11:38:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=rXa3OMm6;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63561-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63561-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05AE1305D10A
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 09:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFA443D508;
	Wed,  3 Jun 2026 09:33:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3077D43CECD;
	Wed,  3 Jun 2026 09:33:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780479229; cv=none; b=AbBfxlAlcxIEDdoWz9IZan7Sxmkh1fLiQA+KuTviLHtS9jThoKt300PrKU7u2xcy3eXU2h8CfqmXfNEm8hhxqr5hpovL3xbkXjJ33KOekYsGCtFBQ9cJ97jK4yoLsYjL57/OIxmoTr5qdvLvzy6LBh0ENa5uKQ3CIL2JjmFDcac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780479229; c=relaxed/simple;
	bh=uxlvNgzFhuUMFy3AJQAJ/mexbnuvDP26gexhGmIyYvU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rBrqaD9yf9WfZZcgcu4elLG+3cEubLxGfYf2+w50Tr0L8EIXXkaoec2EkQ13AdmvavL0T47EDlZlorfZv9EqBg7XPL4vmbTryjfVMPA5hXBbpeNNktklgWi2iRwaaerlELPTLCPkDo8acbse6YKjNRL5NyVDJqUc7aue66cHAgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rXa3OMm6; arc=none smtp.client-ip=80.241.56.161
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gVjDz3Ydbz9typ;
	Wed,  3 Jun 2026 11:33:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780479219; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uxlvNgzFhuUMFy3AJQAJ/mexbnuvDP26gexhGmIyYvU=;
	b=rXa3OMm69ylL0XEsry/z6aRsOURXk8Xj2riKqb4JOiuuHN+oLPpAZiNogTMnOVLWV10kpc
	9znbIUj1gQVgnt8l3X+1AhLKxhI5G7wU9VfPd5TKi2UvZetCiBTCCqBH+7klFZipO/0j8c
	0aErQSElVtS5HEqiwxm8h5SYpMts7M0hQm1DxjWE1y+yw50LiODJyhii/TzGA4n6VHL5kj
	liLRiC7Kj83tGFmryDFiZK5DnaPOTiFJx7ZVUVWZN679Gpzz89xMeatn25Kl8mqGp5kASq
	OSsPfUT0Euzqy9MW3fUaVpN8TVpuwog+dT3SMibUX9g96SwvlVyWGSolMdmd8w==
Message-ID: <441fccce521857ab82b84bb8e5ab539ee3810a36.camel@mailbox.org>
Subject: Re: [PATCH 2/4] rust: rcu: add RcuBox type
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Boqun Feng <boqun@kernel.org>, phasta@kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Andreas Hindborg	 <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Sumit Semwal	
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker	 <frederic@kernel.org>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Uladzislau Rezki	 <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers	
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Zqiang <qiang.zhang@linux.dev>, Daniel Almeida
 <daniel.almeida@collabora.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Igor Korotin <igor.korotin@linux.dev>,
 Lorenzo Stoakes	 <ljs@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 FUJITA Tomonori	 <fujita.tomonori@gmail.com>, Krishna Ketan Rai
 <prafulrai522@gmail.com>,  Shankari Anand <shankari.ak0208@gmail.com>,
 manos@pitsidianak.is, Boris Brezillon <boris.brezillon@collabora.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, rcu@vger.kernel.org
Date: Wed, 03 Jun 2026 11:33:27 +0200
In-Reply-To: <ah2L-TMT5UHSd_Hs@tardis-2.local>
References: <20260530143541.229628-2-phasta@kernel.org>
	 <20260530143541.229628-4-phasta@kernel.org> <ahr9gtzQLSbPeBx_@tardis.local>
	 <e8b16f3b40d42f3b0a8814180fa9b06f82c9d901.camel@mailbox.org>
	 <ah2L-TMT5UHSd_Hs@tardis-2.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 761970c1ee4b5674507
X-MBO-RS-META: f3jc7cwj7qd9k4gjs764r7kez9kkqwib
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boqun@kernel.org,m:phasta@kernel.org,m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:igor.korotin@linux.dev,m:ljs@kernel.org,m:acourbot@nvidia.com,m:fujita.tomonori@gmail.com,m:prafulrai522@gmail.com,m:shankari.ak0208@gmail.com,m:manos@pitsidianak.is,m:boris.brezillon@collabora.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:rcu@vger.kernel.org,m:fujitatomonori@gmail.co
 m,m:shankariak0208@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-63561-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:mid,mailbox.org:from_mime,mailbox.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E9B3636396

On Mon, 2026-06-01 at 06:41 -0700, Boqun Feng wrote:
> On Mon, Jun 01, 2026 at 09:56:23AM +0200, Philipp Stanner wrote:
> > On Sat, 2026-05-30 at 08:08 -0700, Boqun Feng wrote:
> > > On Sat, May 30, 2026 at 04:35:10PM +0200, Philipp Stanner wrote:
> > > > From: Alice Ryhl <aliceryhl@google.com>
> > > >=20
> > > > This adds an RcuBox container, which is like KBox except that the v=
alue
> > > > is freed with kfree_rcu.
> > > >=20
> > > > To allow containers to rely on the rcu properties of RcuBox, an
> > > > extension of ForeignOwnable is added.
> > > >=20
> > > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > > ---
> > >=20
> > > I have the following on top of Alice's patch. @Alice, @Danilo, though=
ts?
> > >=20
> > > Then we can have:
> > >=20
> > > type RcuKBox<T> =3D RcuBox<T, Kmalloc>;
> > > type RcuVBox<T> =3D RcuBox<T, Vmalloc>;
> >=20
> > No objections by me.
> >=20
> > I just think we have to decide how the treat the namespaces, though.
> > Probably Alice wrote it like that so that it's very apparent that this
> > is not a normal box. It still breaks the naming convention in my
> > opinion.
> >=20
> > rcu::Box vs rcu::RcuBox
> >=20
> > With all other subsystems, naming like that seems not allowed.
> >=20
> > dma::Fence vs dma::DmaFence
> >=20
> >=20
> > I probably would allow the user to decide whether he wants to just use
> > it as `rcu::Box` in all his code.
> >=20
> > But no hard feelings.
> >=20
>=20
> For this I think that rcu::RcuBox is a bit different than dma::Fence,
> because Box has its widely-accepted meaning through all Rust code,
> while `Fence` doesn't. Hence my current thought is rcu::RcuBox and
> dma::Fence. My personal preference is using namespace as much as we
> could until there might be some misleading.

Yoah, probably better we're safer rather than hyper-consistent.

>=20
> >=20
> >=20
> > >=20
> > > and Philipp can use the `RcuKBox` in this patchset. We also need to i=
mpl
> > > InPlaceInit for RcuBox, but that can be added later.
> >=20
> > So shall we merge my series with Alice's patch, and later we add your
> > patch and other features, or would you prefer to have the additional
> > boxes from your patch from the get-go?
> >=20
>=20
> I would like to have it from the get-go mainly because of RcuBox vs
> RcuKBox naming. Thank you!

Fine by me. Just process-wise: how should we do it?

I could include your patch on top of Alice's. Would be a bit more
consistent regarding the git-workflow if we'd squash the two patches,
but then you two would have to agree on authorship.

All is fine by me, but I wanted to ask instead of just do A or B.


P.

>=20
> Regards,
> Boqun
>=20
> >=20
> > P.
> >=20
> > >=20
> > > Regards,
> > > Boqun
> > >=20
> > > ------------->8
> > > Subject: [PATCH] rust: rcu: Make RcuBox generic over Allocator
> > >=20
> > > To support RCU-protected vmalloc allocation, we need to make `RcuBox`
> > > generic over `Allocator`. Currently this works since all `Allocator`s
> > > are either kmalloc() or vmalloc(), and kvfree_call_rcu() works with b=
oth
> > > allocations.
> > >=20
> > > While we are at it, add some basic test cases.
> > >=20
> > > Signed-off-by: Boqun Feng <boqun@kernel.org>
> > > ---
> > > =C2=A0rust/kernel/sync/rcu/rcu_box.rs | 96 +++++++++++++++++++++++---=
-------
> > > =C2=A01 file changed, 67 insertions(+), 29 deletions(-)
> > >=20
> > > diff --git a/rust/kernel/sync/rcu/rcu_box.rs b/rust/kernel/sync/rcu/r=
cu_box.rs
> > > index 2508fdb609ec..5c344d82c0d9 100644
> > > --- a/rust/kernel/sync/rcu/rcu_box.rs
> > > +++ b/rust/kernel/sync/rcu/rcu_box.rs
> > > @@ -4,47 +4,59 @@
> > > =C2=A0
> > > =C2=A0//! Provides the `RcuBox` type for Rust allocations that live f=
or a grace period.
> > > =C2=A0
> > > -use core::{ops::Deref, ptr::NonNull};
> > > +use core::{
> > > +=C2=A0=C2=A0=C2=A0 marker::PhantomData,
> > > +=C2=A0=C2=A0=C2=A0 ops::Deref,
> > > +=C2=A0=C2=A0=C2=A0 ptr::NonNull, //
> > > +};
> > > =C2=A0
> > > =C2=A0use kernel::{
> > > -=C2=A0=C2=A0=C2=A0 alloc::{self, AllocError},
> > > +=C2=A0=C2=A0=C2=A0 alloc::{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AllocError,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Allocator, //
> > > +=C2=A0=C2=A0=C2=A0 },
> > > =C2=A0=C2=A0=C2=A0=C2=A0 bindings,
> > > =C2=A0=C2=A0=C2=A0=C2=A0 ffi::c_void,
> > > =C2=A0=C2=A0=C2=A0=C2=A0 prelude::*,
> > > -=C2=A0=C2=A0=C2=A0 sync::rcu::{ForeignOwnableRcu, Guard},
> > > =C2=A0=C2=A0=C2=A0=C2=A0 types::ForeignOwnable,
> > > =C2=A0};
> > > =C2=A0
> > > +use super::{
> > > +=C2=A0=C2=A0=C2=A0 ForeignOwnableRcu,
> > > +=C2=A0=C2=A0=C2=A0 Guard, //
> > > +};
> > > +
> > > =C2=A0/// A box that is freed with rcu.
> > > =C2=A0///
> > > =C2=A0/// The value must be `Send`, as rcu may drop it on another thr=
ead.
> > > =C2=A0///
> > > =C2=A0/// # Invariants
> > > =C2=A0///
> > > -/// * The pointer is valid and references a pinned `RcuBoxInner<T>` =
allocated with `kmalloc`.
> > > +/// * The pointer is valid and references a pinned `RcuBoxInner<T>` =
allocated with `A`.
> > > =C2=A0/// * This `RcuBox` holds exclusive permissions to rcu free the=
 allocation.
> > > -pub struct RcuBox<T: Send>(NonNull<RcuBoxInner<T>>);
> > > +pub struct RcuBox<T: Send, A: Allocator>(NonNull<RcuBoxInner<T>>, Ph=
antomData<A>);
> > > =C2=A0
> > > =C2=A0struct RcuBoxInner<T> {
> > > =C2=A0=C2=A0=C2=A0=C2=A0 value: T,
> > > =C2=A0=C2=A0=C2=A0=C2=A0 rcu_head: bindings::callback_head,
> > > =C2=A0}
> > > =C2=A0
> > > -// Note that `T: Sync` is required since when moving an `RcuBox<T>`,=
 the previous owner may still
> > > -// access `&T` for one grace period.
> > > +// Note that `T: Sync` is required since when moving an `RcuBox<T, A=
>`, the previous owner may
> > > +// still access `&T` for one grace period.
> > > =C2=A0//
> > > -// SAFETY: Ownership of the `RcuBox<T>` allows for `&T` and dropping=
 the `T`, so `T: Send + Sync`
> > > -// implies `RcuBox<T>: Send`.
> > > -unsafe impl<T: Send + Sync> Send for RcuBox<T> {}
> > > +// SAFETY: Ownership of the `RcuBox<T, A>` allows for `&T` and dropp=
ing the `T`, so `T: Send +
> > > +// Sync` implies `RcuBox<T, A>: Send`.
> > > +unsafe impl<T: Send + Sync, A: Allocator> Send for RcuBox<T, A> {}
> > > =C2=A0
> > > -// SAFETY: `&RcuBox<T>` allows for no operations other than those pe=
rmitted by `&T`, so `T: Sync`
> > > -// implies `RcuBox<T>: Sync`.
> > > -unsafe impl<T: Send + Sync> Sync for RcuBox<T> {}
> > > +// SAFETY: `&RcuBox<T, A>` allows for no operations other than those=
 permitted by `&T`, so `T:
> > > +// Sync` implies `RcuBox<T, A>: Sync`.
> > > +unsafe impl<T: Send + Sync, A: Allocator> Sync for RcuBox<T, A> {}
> > > =C2=A0
> > > -impl<T: Send> RcuBox<T> {
> > > +impl<T: Send, A: Allocator> RcuBox<T, A> {
> > > =C2=A0=C2=A0=C2=A0=C2=A0 /// Create a new `RcuBox`.
> > > =C2=A0=C2=A0=C2=A0=C2=A0 pub fn new(x: T, flags: alloc::Flags) -> Res=
ult<Self, AllocError> {
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let b =3D KBox::new(
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let b =3D Box::<_, A>::ne=
w(
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 RcuBoxInner {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 value: x,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 rcu_head: Default::default(),
> > > @@ -53,9 +65,9 @@ pub fn new(x: T, flags: alloc::Flags) -> Result<Sel=
f, AllocError> {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )?;
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // INVARIANT:
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // * The pointer contains=
 a valid `RcuBoxInner` allocated with `kmalloc`.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // * The pointer contains=
 a valid `RcuBoxInner` allocated with `A`.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // * We just allocat=
ed it, so we own free permissions.
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(RcuBox(NonNull::from(K=
Box::leak(b))))
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(RcuBox(NonNull::from(B=
ox::leak(b)), PhantomData))
> > > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0 /// Access the value for a grace period.
> > > @@ -66,7 +78,7 @@ pub fn with_rcu<'rcu>(&self, _read_guard: &'rcu Gua=
rd) -> &'rcu T {
> > > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0}
> > > =C2=A0
> > > -impl<T: Send> Deref for RcuBox<T> {
> > > +impl<T: Send, A: Allocator> Deref for RcuBox<T, A> {
> > > =C2=A0=C2=A0=C2=A0=C2=A0 type Target =3D T;
> > > =C2=A0=C2=A0=C2=A0=C2=A0 fn deref(&self) -> &T {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: While the=
 `RcuBox<T>` exists, the value remains valid.
> > > @@ -75,10 +87,10 @@ fn deref(&self) -> &T {
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0// SAFETY:
> > > -// * The `RcuBoxInner<T>` was allocated with `kmalloc`.
> > > +// * The `RcuBoxInner<T>` was allocated with `A`.
> > > =C2=A0// * `NonNull::as_ptr` returns a non-null pointer.
> > > -unsafe impl<T: Send + 'static> ForeignOwnable for RcuBox<T> {
> > > -=C2=A0=C2=A0=C2=A0 const FOREIGN_ALIGN: usize =3D <KBox<RcuBoxInner<=
T>> as ForeignOwnable>::FOREIGN_ALIGN;
> > > +unsafe impl<T: Send + 'static, A: Allocator> ForeignOwnable for RcuB=
ox<T, A> {
> > > +=C2=A0=C2=A0=C2=A0 const FOREIGN_ALIGN: usize =3D <Box<RcuBoxInner<T=
>, A> as ForeignOwnable>::FOREIGN_ALIGN;
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0 type Borrowed<'a> =3D &'a T;
> > > =C2=A0=C2=A0=C2=A0=C2=A0 type BorrowedMut<'a> =3D &'a T;
> > > @@ -88,9 +100,9 @@ fn into_foreign(self) -> *mut c_void {
> > > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0 unsafe fn from_foreign(ptr: *mut c_void) -> =
Self {
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // INVARIANT: Pointer ret=
urned by `into_foreign` carries same invariants as `RcuBox<T>`.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // INVARIANT: Pointer ret=
urned by `into_foreign, A` carries same invariants as `RcuBox<T>`.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `into_for=
eign` never returns a null pointer.
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self(unsafe { NonNull::ne=
w_unchecked(ptr.cast()) })
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self(unsafe { NonNull::ne=
w_unchecked(ptr.cast()) }, PhantomData)
> > > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0 unsafe fn borrow<'a>(ptr: *mut c_void) -> &'=
a T {
> > > @@ -104,7 +116,7 @@ unsafe fn borrow_mut<'a>(ptr: *mut c_void) -> &'a=
 T {
> > > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0}
> > > =C2=A0
> > > -impl<T: Send + 'static> ForeignOwnableRcu for RcuBox<T> {
> > > +impl<T: Send + 'static, A: Allocator> ForeignOwnableRcu for RcuBox<T=
, A> {
> > > =C2=A0=C2=A0=C2=A0=C2=A0 type RcuBorrowed<'a> =3D &'a T;
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0 unsafe fn rcu_borrow<'a>(ptr: *mut c_void) -=
> &'a T {
> > > @@ -114,7 +126,7 @@ unsafe fn rcu_borrow<'a>(ptr: *mut c_void) -> &'a=
 T {
> > > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0}
> > > =C2=A0
> > > -impl<T: Send> Drop for RcuBox<T> {
> > > +impl<T: Send, A: Allocator> Drop for RcuBox<T, A> {
> > > =C2=A0=C2=A0=C2=A0=C2=A0 fn drop(&mut self) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: The `rcu_=
head` field is in-bounds of a valid allocation.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let rcu_head =3D uns=
afe { &raw mut (*self.0.as_ptr()).rcu_head };
> > > @@ -122,9 +134,11 @@ fn drop(&mut self) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 // SAFETY: `rcu_head` is the `rcu_head` field of `RcuBoxInner<T>`. All =
users will be
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 // gone in an rcu grace period. This is the destructor, so we may pass =
ownership of the
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 // allocation.
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u=
nsafe { bindings::call_rcu(rcu_head, Some(drop_rcu_box::<T>)) };
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u=
nsafe { bindings::call_rcu(rcu_head, Some(drop_rcu_box::<T, A>)) };
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 // SAFETY: All users will be gone in an rcu grace period.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /=
/ TODO: We are luckily since `kvfree_call_rcu()` works on both kmalloc and =
vmalloc,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /=
/ maybe a new `Allocator` method is needed.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 unsafe { bindings::kvfree_call_rcu(rcu_head, self.0.as_ptr().cast()) };
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > > @@ -135,11 +149,35 @@ fn drop(&mut self) {
> > > =C2=A0/// # Safety
> > > =C2=A0///
> > > =C2=A0/// `head` references the `rcu_head` field of an `RcuBoxInner<T=
>` that has no references to it.
> > > -/// Ownership of the `KBox<RcuBoxInner<T>>` must be passed.
> > > -unsafe extern "C" fn drop_rcu_box<T>(head: *mut bindings::callback_h=
ead) {
> > > +/// Ownership of the `Box<RcuBoxInner<T>, A>` must be passed.
> > > +unsafe extern "C" fn drop_rcu_box<T, A: Allocator>(head: *mut bindin=
gs::callback_head) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Caller provides a pointer to the =
`rcu_head` field of a `RcuBoxInner<T>`.
> > > =C2=A0=C2=A0=C2=A0=C2=A0 let box_inner =3D unsafe { crate::container_=
of!(head, RcuBoxInner<T>, rcu_head) };
> > > =C2=A0
> > > =C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Caller ensures exclusive access a=
nd passed ownership.
> > > -=C2=A0=C2=A0=C2=A0 drop(unsafe { KBox::from_raw(box_inner) });
> > > +=C2=A0=C2=A0=C2=A0 drop(unsafe { Box::<_, A>::from_raw(box_inner) })=
;
> > > +}
> > > +
> > > +#[kunit_tests(rust_rcu_box)]
> > > +mod tests {
> > > +=C2=A0=C2=A0=C2=A0 use super::*;
> > > +
> > > +=C2=A0=C2=A0=C2=A0 #[test]
> > > +=C2=A0=C2=A0=C2=A0 fn rcu_box_basic() -> Result {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let rb =3D RcuBox::<_, al=
loc::allocator::Kmalloc>::new(42i32, alloc::flags::GFP_KERNEL)?;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert_eq!(*rb, 42);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert_eq!(*rb.with_rcu(&=
Guard::new()), 42);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drop(rb);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let rb =3D RcuBox::<_, al=
loc::allocator::Vmalloc>::new(42i32, alloc::flags::GFP_KERNEL)?;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert_eq!(*rb, 42);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assert_eq!(*rb.with_rcu(&=
Guard::new()), 42);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drop(rb);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(())
> > > +=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0}

