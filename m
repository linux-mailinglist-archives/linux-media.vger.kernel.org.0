Return-Path: <linux-media+bounces-63141-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CN2vGpb/Gmqn+QgAu9opvQ
	(envelope-from <linux-media+bounces-63141-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 17:17:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC1360DB05
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 17:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB9523037B92
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 15:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C2C3093DB;
	Sat, 30 May 2026 15:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivG9I9Wb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E757272603;
	Sat, 30 May 2026 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780154180; cv=none; b=b3A74s9x7+HISWwK4zIxGxdhEIg4hDmce7pJGl6XPmucYWbDKFh/YZeLkzLuJGI4U/SrkQCIuAXs9CR6qUUzBh2LMDfRy2TWi2tTOlapzQ7slN3OztlP9jPCgwAGOz9AsmoUAcc0mMx/QJ6DMbwd3TufTOfzI7go9jebCCekNHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780154180; c=relaxed/simple;
	bh=f0GdUq+MhlYLfV4RgBdNdh/WhTPQgXHeUjOAGryZXyo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=kDIfXubGhwyFZZA09QqmO+cYLk02zCYO0TuVjGMNj9VPJnkdxxwSYyhvWhKHO0Vf0KMSS+sWpn2zZb3HVUcXwtLCnB2a0n3mP7MI8hfKRIFeZXZTAhSh9Dsyw7n6vw/t8hv2y1rnFC/CIur9VtmzLrxre22sC5D+075egXz+IJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivG9I9Wb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 111F01F00893;
	Sat, 30 May 2026 15:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780154178;
	bh=B3IwrE3HK9xQ/GsYTmA9pt7vQYdzp5OkBKwI6mjM0Ks=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=ivG9I9Wb1Fhio7A/1AlExKrVKTjWm24EHtORlfbrP5Dc4c4bL4JMnbjqDTqUA/GFw
	 2hr7JqaFVsRU72p3y/y0tKVuwPBZ1YqwRmNSTlIn/26d96dkH+Sy9RJ+UCy/TQRG9P
	 FS/IoYmNxEQQnhqdfMEDa4BW6n5TRSFdF/H1ZXEdoBqvT/ZQ3PzfF4VnO2xdJercPK
	 sX1uqzRFCchLdr9KtyGJY5K3Dppkt48lqnyW+qgP4Rh0Y1laLZMrIkSkM2Du8o+XGS
	 mj3MkD12yXLxdzx/mmh7lN93ATCHzyYUyKnkzOqiOKnwCuMuEfsUjYPJRG5tWljvVg
	 Twtc4kpXUkYDA==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 30 May 2026 17:16:10 +0200
Message-Id: <DIW3ZK5NLKU3.1QYMQB0ISHFBG@kernel.org>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 "Frederic Weisbecker" <frederic@kernel.org>, "Neeraj Upadhyay"
 <neeraj.upadhyay@kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Josh Triplett" <josh@joshtriplett.org>, "Uladzislau Rezki"
 <urezki@gmail.com>, "Steven Rostedt" <rostedt@goodmis.org>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>, "Lai Jiangshan"
 <jiangshanlai@gmail.com>, "Zqiang" <qiang.zhang@linux.dev>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Igor Korotin" <igor.korotin@linux.dev>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 "Krishna Ketan Rai" <prafulrai522@gmail.com>, "Shankari Anand"
 <shankari.ak0208@gmail.com>, <manos@pitsidianak.is>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <rcu@vger.kernel.org>
To: "Philipp Stanner" <phasta@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260530143541.229628-2-phasta@kernel.org>
 <20260530143541.229628-5-phasta@kernel.org>
In-Reply-To: <20260530143541.229628-5-phasta@kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63141-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_TWELVE(0.00)[37];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AEC1360DB05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

(Not a full review, but a few drive-by comments.)

On Sat May 30, 2026 at 4:35 PM CEST, Philipp Stanner wrote:
> +#[allow(unused_unsafe)]

What is this needed for?

> +impl<F: Send + Sync + DriverFenceAllowedData, C: Send + Sync> FenceCtx<F=
, C> {

<snip>

> +impl<F: Send + Sync, C: Send + Sync> PinnedDrop for FenceCtx<F, C> {
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY: `rcu_barrier()` is always safe to be called.
> +        unsafe { bindings::rcu_barrier() };

We should probably add a safe function for this.

> +impl<T: FenceCb> FenceCbRegistration<T> {
> +    /// Register a callback on a fence.
> +    ///
> +    /// On success the callback is pinned in place and will fire when th=
e fence
> +    /// signals. On `AlreadySignaled` the callback is returned to the ca=
ller so
> +    /// that owned resources can be reclaimed.
> +    pub fn new<'a>(fence: &'a Fence, callback: T) -> impl PinInit<Self, =
CallbackError<T>> + 'a
> +    where
> +        T: 'a,
> +    {
> +        // Uses `pin_init_from_closure` instead of `try_pin_init!` so th=
at on
> +        // `-ENOENT` (already signaled) the callback can be read back fr=
om the
> +        // partially-initialized slot and returned through the error.

Seems a bit odd that this needs pin_init_from_closure(). You can still use
try_pin_init!() with &this in Self an a _: initializer at the end in the wo=
rst
case. But the fence and callback fields should be fine to initialize "norma=
lly"?

> +        //
> +        // SAFETY: `pin_init_from_closure` requires:
> +        // - On `Ok(())`: the slot is fully initialized and valid for `D=
rop`.
> +        // - On `Err(_)`: the slot is clean, i.e.: no partially-initiali=
zed fields
> +        //   remain, and the slot can be deallocated without dropping.
> +        //
> +        // We uphold this as follows:
> +        // - On success: all three fields are initialized. Ok(()) is ret=
urned.
> +        // - On ENOENT (already signaled): `callback` and `fence` are re=
ad back
> +        //   from the slot via `ptr::read`, leaving the slot clean. `cb`=
 was
> +        //   initialized by `dma_fence_add_callback` (it calls
> +        //   `INIT_LIST_HEAD(&cb->node)` even on error), but `cb` is
> +        //   `Opaque<dma_fence_cb>` which has no `Drop`, so not dropping=
 it is
> +        //   fine. The callback is returned through `AlreadySignaled(T)`=
.
> +        // - On other errors: same cleanup as ENOENT, error returned as
> +        //   `Other(e)`.
> +        unsafe {
> +            pin_init_from_closure(move |slot: *mut Self| {
> +                let slot_callback =3D &raw mut (*slot).callback;
> +                let slot_fence =3D &raw mut (*slot).fence;
> +                let slot_cb =3D &raw mut (*slot).cb;
> +
> +                // Write callback and fence first =E2=80=94 must be visi=
ble before
> +                // dma_fence_add_callback makes the registration live.
> +                core::ptr::write(slot_callback, callback);
> +                core::ptr::write(slot_fence, ARef::from(fence));
> +
> +                let ret =3D to_result(bindings::dma_fence_add_callback(
> +                    fence.inner.get(),
> +                    Opaque::cast_into(slot_cb),
> +                    Some(Self::dma_fence_callback),
> +                ));
> +
> +                match ret {
> +                    Ok(()) =3D> Ok(()),
> +                    Err(e) =3D> {
> +                        // Read back what we wrote to leave the slot cle=
an.
> +                        let cb_back =3D core::ptr::read(slot_callback);
> +                        let _fence_back =3D core::ptr::read(slot_fence);

What's the purpose of _fence_back?

> +
> +                        if e.to_errno() =3D=3D ENOENT.to_errno() {
> +                            Err(CallbackError::AlreadySignaled(cb_back))
> +                        } else {
> +                            Err(CallbackError::Other(e))
> +                        }
> +                    }
> +                }
> +            })
> +        }
> +    }
> +    /// Signal the fence. This will invoke all registered callbacks.
> +    pub fn signal(self, res: Result) {
> +        let fence =3D self.as_raw();
> +        let mut fence_flags: usize =3D 0;
> +        let flag_ptr =3D &raw mut fence_flags;
> +
> +        // SAFETY: Once a `DriverFence` is initialized, the inner `fence=
` is
> +        // valid and initialized. It is valid until the refcount drops
> +        // to 0, which can earliest happen once the `DriverFence` has be=
en dropped.
> +        unsafe {
> +            bindings::dma_fence_lock_irqsave(fence, flag_ptr);
> +            if !bindings::dma_fence_is_signaled_locked(fence) {
> +                if let Err(err) =3D res {
> +                    bindings::dma_fence_set_error(fence, err.to_errno())=
;
> +                }
> +                bindings::dma_fence_signal_locked(fence);
> +            }
> +            bindings::dma_fence_unlock_irqrestore(fence, flag_ptr);
> +        }

Please use a single unsafe block per unsafe function call, here and in a fe=
w
other places.

> +    }
> +}
> +
> +// SAFETY: Fences are literally designed to be shared between threads.
> +unsafe impl<F: Send + Sync, C: Send + Sync> Send for DriverFence<F, C> {=
}
> +
> +impl<F: Send + Sync, C: Send + Sync> Deref for DriverFence<F, C> {
> +    type Target =3D F;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: Thanks to refcounting, `data` is always valid as long=
 as `self` is.
> +        let data =3D unsafe { &*self.data.as_ptr() };
> +
> +        &data.data
> +    }
> +}
> +
> +/// A borrowed [`DriverFence`]. All you can do with it is access your us=
er data
> +/// and obtain a [`Fence`].
> +pub struct DriverFenceBorrow<F: Send + Sync, C: Send + Sync> {

This misses the lifetime bound, which is the purpose of this struct.

> +    /// The actual content of the fence. Lives in a raw pointer so that =
its
> +    /// memory can be managed independently. Valid until both the [`Driv=
erFence`]
> +    /// and all associated [`Fence`]s have disappeared.
> +    data: NonNull<DriverFenceData<F, C>>,

Why not use ManuallyDrop<DriverFence>? This way you would only need a Deref=
 impl
to &'a DriverFence.

This way you basically reimplement the DriverFence type just without the
destructor.

