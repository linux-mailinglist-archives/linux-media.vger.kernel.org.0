Return-Path: <linux-media+bounces-63242-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGVVEAt9HWrEbAkAu9opvQ
	(envelope-from <linux-media+bounces-63242-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 14:37:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A8D61F5C0
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 14:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 439EC3024C85
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 12:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433D0377ED4;
	Mon,  1 Jun 2026 12:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="stI48f5M"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C011E157A5A;
	Mon,  1 Jun 2026 12:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780316801; cv=none; b=WjXsvwie/SN3VCJEOVH3dAKpIl0r09Gb6ZfB9B26DN0kAMxf44LWfb88YFaNUW5DWaQdorTPbJW2WeAkSPLqi5e3oV1BvRYbj8NSrL4PtqOgZF1/JiyZX0D7XnS8AeWAuta3DpPAmNenVmXWxYAWl76FTFnLJ9VU7rUYPXtVhqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780316801; c=relaxed/simple;
	bh=LS+slmgO5HZ0Y3DTP8mjTOSFx/DFx25e5GzMD3WZ44I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YMcoxElLWgIZLxslGzaHnOkz6sEJtnCSUcG9hJ8ENvQC18e8YH45nyHy/cs7Bm+OgNa6X3oC8GOMtamAr6WRSDLHGkgOPLjruQrxAllAASwJ3U9cwluMXxmMaWXpFflTZQ0kcQuwTOKi5OcM7GHQxcEZjQkjcQ12W4dmKNDSXYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=stI48f5M; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gTY9Q1x1Cz9vGh;
	Mon,  1 Jun 2026 14:26:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780316794; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=avIxQUvlEWX3JSCUpU9paY49lx8qTyAL3uSCpzVZXao=;
	b=stI48f5M72U6Ji4QPECnByaBhxMM7+0lrb+jI8biRiUq7aN3KB26UhqC/L02WfTqDqS7CJ
	2AAbZnydrRhSAzF6IqWHSXl/bm6e2tDzFkz/QBvcSuVK9JuYbl2g4opU7ylVL/tShgx8lT
	R4Y4WGf9ILdA4UR3cwnueUWWHVAwMzh/QVv53a+OUea5DbBS0irAuDZhsTG5PFKyfjzqoF
	cIkGtiAPm9m2LNEm5LAQV+iJkUrPKoMC4OJ52M7lrmUUd9/OF5bpfUtRdrIHuVE7wL/wOt
	f8dHMwawcz89ybjcvZ2avef2s4XbcNP/zZotTgv/afjRFlsZhpWMSilpn5W5Sw==
Message-ID: <0ea6b6fdd1e3f1e07445f17c0bf672524938dc85.camel@mailbox.org>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Alice Ryhl <aliceryhl@google.com>, Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
	 <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich	 <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, "Paul E.
 McKenney" <paulmck@kernel.org>,  Frederic Weisbecker	
 <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>,
 Uladzislau Rezki	 <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers	 <mathieu.desnoyers@efficios.com>, Lai Jiangshan
 <jiangshanlai@gmail.com>,  Zqiang <qiang.zhang@linux.dev>, Daniel Almeida
 <daniel.almeida@collabora.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Igor Korotin <igor.korotin@linux.dev>,
 Lorenzo Stoakes	 <ljs@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 FUJITA Tomonori	 <fujita.tomonori@gmail.com>, Krishna Ketan Rai
 <prafulrai522@gmail.com>,  Shankari Anand <shankari.ak0208@gmail.com>,
 manos@pitsidianak.is, Boris Brezillon <boris.brezillon@collabora.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, rcu@vger.kernel.org
Date: Mon, 01 Jun 2026 14:26:17 +0200
In-Reply-To: <ah1glmXDM-OAKa5h@google.com>
References: <20260530143541.229628-2-phasta@kernel.org>
	 <20260530143541.229628-5-phasta@kernel.org> <ah1glmXDM-OAKa5h@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: qrmakmejsetibj5wsyabmf9ktj44dn6u
X-MBO-RS-ID: d412ede241c30a33045
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63242-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Queue-Id: 78A8D61F5C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 2026-06-01 at 10:36 +0000, Alice Ryhl wrote:
> On Sat, May 30, 2026 at 04:35:11PM +0200, Philipp Stanner wrote:
> >=20

[=E2=80=A6]

> > +use pin_init::pin_init_from_closure;
> > +
> > +use core::{
> > +=C2=A0=C2=A0=C2=A0 marker::PhantomData, //
> > +=C2=A0=C2=A0=C2=A0 ops::Deref,
> > +=C2=A0=C2=A0=C2=A0 ptr,
> > +=C2=A0=C2=A0=C2=A0 ptr::{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drop_in_place,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NonNull, //
> > +=C2=A0=C2=A0=C2=A0 },
> > +=C2=A0=C2=A0=C2=A0 sync::atomic::{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AtomicU64,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ordering, //
> > +=C2=A0=C2=A0=C2=A0 },
>=20
> Use atomics from the kernel crate instead.

OK.

>=20
> > +};
> > +
> > +use bindings::ECANCELED;
> > +
> > +use kernel::str::CString;
> > +use kernel::sync::{
> > +=C2=A0=C2=A0=C2=A0 aref::{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARef,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AlwaysRefCounted, //
> > +=C2=A0=C2=A0=C2=A0 },
> > +=C2=A0=C2=A0=C2=A0 Arc,
> > +=C2=A0=C2=A0=C2=A0 ArcBorrow, //
> > +};
> > +
> > +/// VTable for dma_fence backend_ops callbacks.
> > +//
> > +// Mandatory dma_fence backend_ops are implemented implicitly through
> > +// [`FenceCtx`]. Additional ones shall get implemented on this trait, =
which then
> > +// shall be demanded for the fence context data.
> > +pub trait FenceCtxOps {}
>=20
> This empty trait is unused.

(discussed in the other thread with Boris)

>=20
> > +/// A dma-fence context. A fence context takes care of associating rel=
ated fences with each other,
> > +/// providing each with raising sequence numbers and a common identifi=
er.
> > +#[pin_data(PinnedDrop)]
> > +pub struct FenceCtx<F: Send + Sync, C: Send + Sync> {
>=20
> No need to list any trait bounds here. You can list them on `impl`
> blocks only.

ACK.

>=20
> >=20

[=E2=80=A6]

> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Uses `pin_init_from_clos=
ure` instead of `try_pin_init!` so that on
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // `-ENOENT` (already signa=
led) the callback can be read back from the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // partially-initialized sl=
ot and returned through the error.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `pin_init_from_c=
losure` requires:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - On `Ok(())`: the slot =
is fully initialized and valid for `Drop`.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - On `Err(_)`: the slot =
is clean, i.e.: no partially-initialized fields
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 remain, and =
the slot can be deallocated without dropping.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // We uphold this as follow=
s:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - On success: all three =
fields are initialized. Ok(()) is returned.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - On ENOENT (already sig=
naled): `callback` and `fence` are read back
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 from the slo=
t via `ptr::read`, leaving the slot clean. `cb` was
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 initialized =
by `dma_fence_add_callback` (it calls
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 `INIT_LIST_H=
EAD(&cb->node)` even on error), but `cb` is
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 `Opaque<dma_=
fence_cb>` which has no `Drop`, so not dropping it is
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 fine. The ca=
llback is returned through `AlreadySignaled(T)`.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - On other errors: same =
cleanup as ENOENT, error returned as
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 `Other(e)`.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pin=
_init_from_closure(move |slot: *mut Self| {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 let slot_callback =3D &raw mut (*slot).callback;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 let slot_fence =3D &raw mut (*slot).fence;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 let slot_cb =3D &raw mut (*slot).cb;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 // Write callback and fence first =E2=80=94 must be v=
isible before
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 // dma_fence_add_callback makes the registration live=
.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 core::ptr::write(slot_callback, callback);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 core::ptr::write(slot_fence, ARef::from(fence));
>=20
> Here you are incrementing the fence refcount. It's better to change the
> function argument to ARef<Fence> so that the user can avoid this
> increment if they happen to own a refcount they're willing to give up.

Agreed, will do

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 let ret =3D to_result(bindings::dma_fence_add_callbac=
k(
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence.inner.get(),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Opaque::cast_into(slot_cb),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Some(Self::dma_fence_callback=
),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ));
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 match ret {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(()) =3D> Ok(()),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Err(e) =3D> {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Re=
ad back what we wrote to leave the slot clean.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let c=
b_back =3D core::ptr::read(slot_callback);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let _=
fence_back =3D core::ptr::read(slot_fence);
>=20
> This can be drop_in_place().
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if e.=
to_errno() =3D=3D ENOENT.to_errno() {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Err(CallbackError::AlreadySignaled(cb_back))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } els=
e {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Err(CallbackError::Other(e))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 })
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Raw dma fence callback that is called by the C =
code.
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// # Safety
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// This is only called by the dma_fence subsystem =
with valid pointers.
> > +=C2=A0=C2=A0=C2=A0 unsafe extern "C" fn dma_fence_callback(
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _fence: *mut bindings::dma_=
fence,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cb: *mut bindings::dma_fenc=
e_cb,
> > +=C2=A0=C2=A0=C2=A0 ) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let ptr =3D Opaque::cast_fr=
om(cb).cast_mut();
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: All `cb` we can =
receive here have been created in such a way
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // that they are embedded i=
nto a `FenceCbRegistration`. The backend
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ensures synchronisation =
so whoever holds the registration object
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // cannot drop it while thi=
s code is running. See `FenceCbRegistration::drop`.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let=
 reg: *mut Self =3D container_of!(ptr, Self, cb);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (*r=
eg).callback.called();
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Returns a reference to the fence this callback =
is registered on.
> > +=C2=A0=C2=A0=C2=A0 pub fn fence(self: Pin<&Self>) -> &Fence {
>=20
> Can be simplified to `fn fence(&self) -> &Fence`.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &self.get_ref().fence
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +#[pinned_drop]
> > +impl<T: FenceCb> PinnedDrop for FenceCbRegistration<T> {
> > +=C2=A0=C2=A0=C2=A0 fn drop(self: Pin<&mut Self>) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Always call dma_fence_re=
move_callback, even if `callback` has already
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // been taken by `dma_fence=
_callback`.=C2=A0 This is necessary for
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // synchronization: `dma_fe=
nce_remove_callback` acquires `fence->lock`,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // which ensures that any i=
n-flight `dma_fence_signal` (which calls our
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // callback while holding t=
he same lock) has completed before we free
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // the struct.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Without this, Drop can r=
ace with a concurrent signal:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 CPU0 (signal=
, lock held): take() -> signaled(fence_ref) (in progress)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 CPU1 (drop):=
 sees is_some()=3D=3Dfalse -> skips lock -> frees struct
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 CPU0: access=
es fence_ref -> use-after-free
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // When the callback has al=
ready fired, the signal path detached the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // list node via INIT_LIST_=
HEAD, so dma_fence_remove_callback just sees
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // an empty node and return=
s false =E2=80=94 the lock acquisition is the only
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // thing that matters.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: The fence pointe=
r is valid and the cb was initialized by
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // dma_fence_add_callback d=
uring construction.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin=
dings::dma_fence_remove_callback(self.fence.as_raw(), self.cb.get());
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> Formatting nit: Usually the ; goes outside the unsafe block.

I could have sworn that it was rustfmt who did that? Maybe because the
; was inside to begin with.

>=20
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +// SAFETY: FenceCbRegistration can be sent between threads
> > +unsafe impl<T: FenceCb> Send for FenceCbRegistration<T> {}
> > +
> > +// SAFETY: &FenceCbRegistration can be shared between threads if &T ca=
n.
> > +unsafe impl<T: FenceCb> Sync for FenceCbRegistration<T> where T: Sync =
{}
>=20
> There's no &FenceCbRegistration<T> -> &T accessor, so I don't think this
> bound is required.
>=20
> 	unsafe impl<T: FenceCb> Sync for FenceCbRegistration<T> {}
>=20
> There also can't be such an accessor in the future because the closure
> takes a &mut T.

Hm, very correct. The entire design only allows serial access.

>=20
> > +/// The receiving counterpart of a [`DriverFence`], designed to regist=
er callbacks
> > +/// on, check the signalled state etc. A [`Fence`] cannot be signalled=
.
> > +/// A [`Fence`] is always refcounted.
> > +pub struct Fence {
> > +=C2=A0=C2=A0=C2=A0 /// The actual dma_fence passed to C.
> > +=C2=A0=C2=A0=C2=A0 inner: Opaque<bindings::dma_fence>,
> > +}
> > +
> > +// SAFETY: Fences are literally designed to be shared between threads.
> > +unsafe impl Send for Fence {}
> > +// SAFETY: Fences are literally designed to be shared between threads.
> > +unsafe impl Sync for Fence {}
> > +
> > +impl Fence {
> > +=C2=A0=C2=A0=C2=A0 /// Check whether the fence was signalled at the mo=
ment of the function call.
> > +=C2=A0=C2=A0=C2=A0 pub fn is_signaled(&self) -> bool {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: self is by defin=
ition still valid. The backend ensures proper
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // locking.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::dma_fenc=
e_is_signaled(self.as_raw()) }
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::dma_fence {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.inner.get()
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Create a [`Fence`] from a raw C [`bindings::dma=
_fence`].
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// # Safety
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// `ptr` must point to an initialized fence that i=
s embedded into a [`Fence`].
> > +=C2=A0=C2=A0=C2=A0 pub unsafe fn from_raw<'a>(ptr: *mut bindings::dma_=
fence) -> &'a Self {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Safe as per the =
function's overall safety requirements.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { &*ptr.cast() }
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +// SAFETY: These implement the C backends refcounting methods which ar=
e proven to work correctly.
> > +unsafe impl AlwaysRefCounted for Fence {
> > +=C2=A0=C2=A0=C2=A0 fn inc_ref(&self) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self.as_raw()` =
is a pointer to a valid `struct dma_fence`.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::dma_fenc=
e_get(self.as_raw()) }
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// # Safety
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// `ptr`must be a valid pointer to a [`DriverFence=
`].
> > +=C2=A0=C2=A0=C2=A0 unsafe fn dec_ref(ptr: NonNull<Self>) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `ptr` is never a=
 NULL pointer; and when `dec_ref()` is called
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // the fence is by definiti=
on still valid.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence =3D unsafe { (*pt=
r.as_ptr()).inner.get() };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Valid because `f=
ence` was created validly above.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::dma_fenc=
e_put(fence) }
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +#[repr(C)] // Necessary to guarantee that `inner` always comes first s=
o that we can cast.
> > +#[pin_data]
> > +struct DriverFenceData<F: Send + Sync, C: Send + Sync> {
>=20
> Ditto here about trait bounds. (And everywhere else.)
>=20
> > +=C2=A0=C2=A0=C2=A0 #[pin]
> > +=C2=A0=C2=A0=C2=A0 /// The inner fence.
> > +=C2=A0=C2=A0=C2=A0 inner: Fence,
> > +=C2=A0=C2=A0=C2=A0 /// Pointer to access the FenceCtx. Useful for obta=
ining name parameters.
> > +=C2=A0=C2=A0=C2=A0 // The FenceCtx lives as long as at least all its f=
ences, hence this is safe.
> > +=C2=A0=C2=A0=C2=A0 fctx: Arc<FenceCtx<F, C>>,
> > +=C2=A0=C2=A0=C2=A0 /// The API user's data. As required by [`DriverFen=
ceAllowedData`], this either
> > +=C2=A0=C2=A0=C2=A0 /// does not need drop, or must live in a [`rcu::Rc=
uBox`]. It is essential
> > +=C2=A0=C2=A0=C2=A0 /// that the data only performs operations legal in=
 atomic context in its
> > +=C2=A0=C2=A0=C2=A0 /// [`Drop`] implementation.
> > +=C2=A0=C2=A0=C2=A0 #[pin]
> > +=C2=A0=C2=A0=C2=A0 data: F,
> > +}
> > +
> > +/// A trait to enforce that all data in a [`DriverFence`] either does =
not need
> > +/// drop, or lives in a [`RcuBox`].
> > +pub trait DriverFenceAllowedData: private::Sealed {}
> > +
> > +mod private {
> > +=C2=A0=C2=A0=C2=A0 pub trait Sealed {}
> > +}
> > +
> > +impl<F: Copy> DriverFenceAllowedData for F {}
> > +impl<F: Send> DriverFenceAllowedData for RcuBox<F> {}
> > +
> > +impl<F: Copy> private::Sealed for F {}
> > +impl<F: Send> private::Sealed for RcuBox<F> {}
>=20
> Why sealed? Just make the trait unsafe and require the things you
> require from the user.

This is far better. We definitely only allow the user to pass A or B,
and only then it compiles.

The unsafe implementation could be messed up.

I thought that's what Sealed is for. Or isn't it?

>=20
> > +/// A synchronization primitive mainly for GPU drivers.
> > +///
> > +/// Fences are always reference counted. The typical use case is that =
one side registers
> > +/// callbacks on the fence which will perform a certain action (such a=
s queueing work) once the
> > +/// other side signals the fence.
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// use kernel::dma_buf::{DriverFence, FenceCtx, FenceCb, FenceCbRegis=
tration};
> > +/// use kernel::str::CString;
> > +/// use kernel::sync::{
> > +///=C2=A0=C2=A0=C2=A0=C2=A0 aref::ARef,
> > +///=C2=A0=C2=A0=C2=A0=C2=A0 rcu::RcuBox, //
> > +/// };
> > +/// use core::ops::Deref;
> > +/// use core::fmt::Display;
>=20
> Use fmt traits from kernel instead. (Actually, I don't think you use
> Display at all here?)

I tried, see a few lines below:

>=20
> > +/// struct CallbackData { }
> > +///
> > +/// impl FenceCb for CallbackData {
> > +///=C2=A0=C2=A0=C2=A0=C2=A0 fn called(&mut self) {
> > +///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_info!("DmaFence=
 callback executed.\n");
> > +///=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +/// }
> > +///
> > +/// let driver_name =3D CString::try_from_fmt(fmt!("dummy_driver"))?;
> > +/// let timeline_name =3D CString::try_from_fmt(fmt!("dummy_timeline")=
)?;
> > +///
> > +/// let fctx =3D FenceCtx::new(driver_name, timeline_name, ())?;
> > +///
> > +/// let fence_data =3D CString::try_from_fmt(fmt!("dummy_data"))?;
> > +/// // DriverFence::data must either not need drop, or live in an RcuB=
ox.
> > +/// let fence_data =3D RcuBox::new(fence_data, GFP_KERNEL)?;
> > +///
> > +/// let fence_alloc =3D fctx.as_arc_borrow().new_fence_allocation(fenc=
e_data)?;
> > +/// let mut fence =3D fctx.new_fence(fence_alloc);
> > +///
> > +/// let cb_data =3D CallbackData { };
> > +/// let waiting_fence =3D ARef::from(fence.as_fence());
> > +/// let cb_reg =3D FenceCbRegistration::new(&waiting_fence, cb_data);
> > +/// let cb_reg =3D KBox::pin_init(cb_reg, GFP_KERNEL)?;
> > +///
> > +/// // DriverFence implements Deref.
> > +/// // FIXME: unit test claims that CString does not implement Display=
. Why?
> > +/// // pr_info!("Fence's inner data is: {}", fence.deref().deref());

Lazily, I was hoping that someone here will tell me how that is
supposed to be done correctly 8-)

> > +///
> > +/// // TODO begin_signalling
> > +/// fence.signal(Ok(()));
> > +/// assert_eq!(waiting_fence.is_signaled(), true);
> > +///
> > +/// Ok::<(), Error>(())
> > +/// ```
> > +pub struct DriverFence<F: Send + Sync, C: Send + Sync> {
> > +=C2=A0=C2=A0=C2=A0 /// The actual content of the fence. Lives in a raw=
 pointer so that its
> > +=C2=A0=C2=A0=C2=A0 /// memory can be managed independently. Valid unti=
l both the [`DriverFence`]
> > +=C2=A0=C2=A0=C2=A0 /// and all associated [`Fence`]s have disappeared.
> > +=C2=A0=C2=A0=C2=A0 data: NonNull<DriverFenceData<F, C>>,
> > +}
> > +
> > +/// A pre-prepared DMA fence, carrying the user's data and the memory =
it and the
> > +/// fence reside in. Only useful for creating a [`DriverFence`]. Split=
ting
> > +/// allocation and full initialization is necessary because fences can=
not be
> > +/// allocated dynamically in some circumstances (deadlock).
> > +pub struct DriverFenceAllocation<F: Send + Sync, C: Send + Sync> {
> > +=C2=A0=C2=A0=C2=A0 /// The memory for the actual content of the fence.
> > +=C2=A0=C2=A0=C2=A0 /// Handed over to a [`DriverFence`], or deallocate=
d once the
> > +=C2=A0=C2=A0=C2=A0 /// [`DriverFenceAllocation`] drops.
> > +=C2=A0=C2=A0=C2=A0 data: KBox<DriverFenceData<F, C>>,
> > +}
> > +
> > +impl<F: Send + Sync + DriverFenceAllowedData, C: Send + Sync> DriverFe=
nceAllocation<F, C> {
> > +=C2=A0=C2=A0=C2=A0 /// Create a new allocation slot that can later be =
used to create a fully
> > +=C2=A0=C2=A0=C2=A0 /// initialized [`DriverFence`] without the need to=
 allocate.
> > +=C2=A0=C2=A0=C2=A0 pub fn new(fctx: Arc<FenceCtx<F, C>>, data: F) -> R=
esult<Self> {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data =3D DriverFe=
nceData {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // =
`inner` remains uninitialized until a [`DriverFence`] takes over.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inn=
er: Fence {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 inner: Opaque::uninit(),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fct=
x,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dat=
a,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // In order to support the =
C dma_fence callbacks, it is necessary for
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // a `Fence` and a `DriverF=
ence` to live in the same allocation,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // because the C backend pa=
sses a dma_fence, from which the driver most
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // likely wants to be able =
to access its `data` in `DriverFence`.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Hence, we need the manag=
e the memory manually. It will be freed by the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // C backend automatically =
once the refcount within `Fence` drops to 0.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let data =3D KBox::new(fenc=
e_data, GFP_KERNEL | __GFP_ZERO)?;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(Self { data })
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::dma_fence {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.data.inner.inner.get()
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +impl<F: Send + Sync, C: Send + Sync> DriverFence<F, C> {
> > +=C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::dma_fence {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Valid because `s=
elf` is valid.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data =3D unsafe {=
 &mut *self.data.as_ptr() };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence_data.inner.inner.get(=
)
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Create a [`DriverFence`] from a raw pointer to =
a [`bindings::dma_fence`].
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// # Safety
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// `ptr` must be a valid pointer to a `dma_fence` =
that was obtained through
> > +=C2=A0=C2=A0=C2=A0 /// a [`DriverFence`] with matching generic data fo=
r both fence and associated
> > +=C2=A0=C2=A0=C2=A0 /// [`FenceCtx`].
> > +=C2=A0=C2=A0=C2=A0 unsafe fn from_raw(ptr: *mut bindings::dma_fence) -=
> Self {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let opaque_fence =3D Opaque=
::cast_from(ptr);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Safe due to the =
function's overall safety requirements.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_ptr =3D unsafe { =
container_of!(opaque_fence, Fence, inner) };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // DriverFenceData is repr(=
C) and a Fence is its first member.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data_ptr =3D fenc=
e_ptr as *mut DriverFenceData<F, C>;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `fence_data_ptr`=
 was created validly above.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let data =3D unsafe { NonNu=
ll::new_unchecked(fence_data_ptr) };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self { data }
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Return the underlying [`Fence`].
> > +=C2=A0=C2=A0=C2=A0 pub fn as_fence(&self) -> &Fence {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self` is by def=
inition still valid, and it cannot drop until
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // this new reference is go=
ne.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { Fence::from_raw(se=
lf.as_raw()) }
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Signal the fence. This will invoke all register=
ed callbacks.
> > +=C2=A0=C2=A0=C2=A0 pub fn signal(self, res: Result) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence =3D self.as_raw()=
;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let mut fence_flags: usize =
=3D 0;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let flag_ptr =3D &raw mut f=
ence_flags;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Once a `DriverFe=
nce` is initialized, the inner `fence` is
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // valid and initialized. I=
t is valid until the refcount drops
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // to 0, which can earliest=
 happen once the `DriverFence` has been dropped.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin=
dings::dma_fence_lock_irqsave(fence, flag_ptr);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
!bindings::dma_fence_is_signaled_locked(fence) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if let Err(err) =3D res {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bindings::dma_fence_set_error=
(fence, err.to_errno());
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 bindings::dma_fence_signal_locked(fence);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin=
dings::dma_fence_unlock_irqrestore(fence, flag_ptr);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> This single unsafe blocks spans five different unsafe operations.

Same discussion with Danilo. I'd prefer it this way, but I guess
separate blocks also have some advantages.

>=20
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +// SAFETY: Fences are literally designed to be shared between threads.
> > +unsafe impl<F: Send + Sync, C: Send + Sync> Send for DriverFence<F, C>=
 {}
> > +
> > +impl<F: Send + Sync, C: Send + Sync> Deref for DriverFence<F, C> {
> > +=C2=A0=C2=A0=C2=A0 type Target =3D F;
> > +
> > +=C2=A0=C2=A0=C2=A0 fn deref(&self) -> &Self::Target {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Thanks to refcou=
nting, `data` is always valid as long as `self` is.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let data =3D unsafe { &*sel=
f.data.as_ptr() };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &data.data
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +/// A borrowed [`DriverFence`]. All you can do with it is access your =
user data
> > +/// and obtain a [`Fence`].
> > +pub struct DriverFenceBorrow<F: Send + Sync, C: Send + Sync> {
> > +=C2=A0=C2=A0=C2=A0 /// The actual content of the fence. Lives in a raw=
 pointer so that its
> > +=C2=A0=C2=A0=C2=A0 /// memory can be managed independently. Valid unti=
l both the [`DriverFence`]
> > +=C2=A0=C2=A0=C2=A0 /// and all associated [`Fence`]s have disappeared.
> > +=C2=A0=C2=A0=C2=A0 data: NonNull<DriverFenceData<F, C>>,
> > +}
> > +
> > +impl<F: Send + Sync, C: Send + Sync> Deref for DriverFenceBorrow<F, C>=
 {
> > +=C2=A0=C2=A0=C2=A0 type Target =3D F;
> > +
> > +=C2=A0=C2=A0=C2=A0 fn deref(&self) -> &Self::Target {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Thanks to refcou=
nting, `data` is always valid as long as `self` is.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let data =3D unsafe { &*sel=
f.data.as_ptr() };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &data.data
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +impl<F: Send + Sync, C: Send + Sync> DriverFenceBorrow<F, C> {
> > +=C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::dma_fence {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Valid because `s=
elf` is valid.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data =3D unsafe {=
 &mut *self.data.as_ptr() };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence_data.inner.inner.get(=
)
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Return the underlying [`Fence`].
> > +=C2=A0=C2=A0=C2=A0 pub fn as_fence(&self) -> &Fence {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self` is by def=
inition still valid, and it cannot drop until
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // this new reference is go=
ne.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { Fence::from_raw(se=
lf.as_raw()) }
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Get a [`DriverFenceBorrow`] from a raw pointer.
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// # Safety
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// `ptr` must point to a raw dma_fence within a [`=
Fence`] within a [`DriverFenceData`].
> > +=C2=A0=C2=A0=C2=A0 unsafe fn from_raw(ptr: *mut bindings::dma_fence) -=
> Self {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let opaque_fence =3D Opaque=
::cast_from(ptr);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: Safe due to the =
function's overall safety requirements.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_ptr =3D unsafe { =
container_of!(opaque_fence, Fence, inner) };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // DriverFenceData is repr(=
C) and a Fence is its first member.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data_ptr =3D fenc=
e_ptr as *mut DriverFenceData<F, C>;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `fence_data_ptr`=
 was created validly above.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let data =3D unsafe { NonNu=
ll::new_unchecked(fence_data_ptr) };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self { data }
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +// SAFETY: The Rust dma_fence abstractions are already designed around=
 the inner
> > +// C `dma_fence`, which can serve safely as the identification point w=
hen being
> > +// owned by C. Moreover, safety is ensured by not dropping `DriverFenc=
e` and by
> > +// only allowing operations without side effects on the Borrowed type.
> > +unsafe impl<F: Send + Sync + 'static, C: Send + Sync + 'static> Foreig=
nOwnable
> > +=C2=A0=C2=A0=C2=A0 for DriverFence<F, C>
> > +{
> > +=C2=A0=C2=A0=C2=A0 // `DriverFence` is merely a wrapper around a raw p=
ointer. Thus, we can just
> > +=C2=A0=C2=A0=C2=A0 // use it directly.
> > +=C2=A0=C2=A0=C2=A0 type Borrowed<'a> =3D DriverFenceBorrow<F, C>;
> > +=C2=A0=C2=A0=C2=A0 type BorrowedMut<'a> =3D DriverFenceBorrow<F, C>;
> > +
> > +=C2=A0=C2=A0=C2=A0 const FOREIGN_ALIGN: usize =3D core::mem::align_of:=
:<bindings::dma_fence>();
> > +
> > +=C2=A0=C2=A0=C2=A0 fn into_foreign(self) -> *mut c_void {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence =3D self;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let ptr =3D fence.as_raw();
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // DriverFence must not dro=
p.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 core::mem::forget(fence);
>=20
> Nit: Modern Rust uses ManuallyDrop instead of forget().

You mean still take `self` here, then stuff it into ManuallyDrop and
let it go out of scope, aye?



Thx for the review,
P.

