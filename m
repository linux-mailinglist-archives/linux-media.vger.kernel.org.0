Return-Path: <linux-media+bounces-65013-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Zz1vImFGMWqTfwUAu9opvQ
	(envelope-from <linux-media+bounces-65013-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 14:49:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AC268F93C
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 14:49:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=onurozkan.dev header.s=protonmail header.b=VcYq4MB2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65013-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65013-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=onurozkan.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 07BD0301EFC4
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 12:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D513346FAE;
	Tue, 16 Jun 2026 12:48:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E8130C35E;
	Tue, 16 Jun 2026 12:48:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781614090; cv=none; b=YtZAkmhmgJ2ibVptWditjg4V7ZUvLszUh7CV/jgYzCS7DjRgIDyfieuL4Hz28hFjKp+A5u1oA7Sn/eFygtMvZNhUr6zxKWIysboZYy06LqiBM+XZd0n6e1XsmlIa6TmSIeTWpiBF+ATJPDs9+sMhvsADUpmD2CZIfHkiSCGSmZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781614090; c=relaxed/simple;
	bh=FJOtJXdeZoGHDPmxQjYMAK6EB0PyyhBoCgBd4/9jbQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RTGYzUfDovNZ+ZRDM48n6pdgfS7akkw5PWERjuF2M6uILotaIC4/NawzOMIicszUf4x8CRAUQAI4R604Sx2aoaL9hdMgpV05oGQk5PDh2W0vEjh6iI86A+WUzgKf9Ckwam8we4x+1lLCVSnHKVCxD/99eg9ukCZTD/AcfLnSY3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=VcYq4MB2; arc=none smtp.client-ip=79.135.106.112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1781614083; x=1781873283;
	bh=e2mqDZnHAlhEUqDuOBlwfuMwJ6ubbqKIeKqblcFDODY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=VcYq4MB233T/xbbh28z8ao2yPZ51aioxY64Pj/dT9VMc8LU/4DW0Zm3t24BAjVjQr
	 ERUZj/fDi8frrUUU+GXBJb6XF9K1cris2dnyoGn/V1KxEUc2BIyjohx8zTCHyINw1M
	 RP9L/KprRMZnPA41rHiEE5pCAEepTr7By8FJ0BOr5NfxQdQRjHtVDQLOFLBo+WALMZ
	 4DSnjmBBwO823tGdWCvkVzjZRyTdFQXeaetHu8sSiTmkItINcapHd3F07jLsiz6HqI
	 D+dTJAl6KQ9BlE2GMlE4JJHpi+w9zIHH2WhlCPCFAAjuxGdvMjswra0fDZITGd1+91
	 4MZSugxxR+ynA==
X-Pm-Submission-Id: 4gfmx90Nhnz1DFGV
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Igor Korotin <igor.korotin@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	manos@pitsidianak.is,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rcu@vger.kernel.org
Subject: Re: [PATCH v2 5/6] rust: Add dma_fence abstractions
Date: Tue, 16 Jun 2026 15:47:33 +0300
Message-ID: <20260616124755.460550-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260616082819.2943886-7-phasta@kernel.org>
References: <20260616082819.2943886-2-phasta@kernel.org> <20260616082819.2943886-7-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[onurozkan.dev,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[onurozkan.dev:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65013-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:igor.korotin@linux.dev,m:ljs@kernel.org,m:acourbot@nvidia.com,m:fujita.tomonori@gmail.com,m:prafulrai522@gmail.com,m:shankari.ak0208@gmail.com,m:manos@pitsidianak.is,m:boris.brezillon@collabora.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:rcu@vger.kernel.org,m:fujitatomonori@gmail.com,m:shankariak0208@gmail.com,s:li
 sts@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[work@onurozkan.dev,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[work@onurozkan.dev,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DKIM_TRACE(0.00)[onurozkan.dev:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 89AC268F93C

On Tue, 16 Jun 2026 10:28:17 +0200=0D
Philipp Stanner <phasta@kernel.org> wrote:=0D
=0D
> C's dma_fence's are synchronisation primitives that will be needed by all=
=0D
> Rust GPU drivers.=0D
> =0D
> The dma_fence framework sets a number of rules, notably:=0D
>   - fences must only be signalled once=0D
>   - all fences must be signalled at some point=0D
>   - fence error codes must only be set before signalling=0D
>   - every pointer to a fence must be backed by a reference=0D
> =0D
> All those rules are being addressed by these abstractions.=0D
> =0D
> To cleanly decouple fence issuers and consumers, two types are provided:=
=0D
>   - DriverFence: the only fence type that can be signalled and that=0D
>     carries driver-specific data.=0D
>   - Fence: the fence type to be shared with other drivers and / or=0D
>     userspace. The only type callbacks can be registered on.=0D
>     Cannot be signalled.=0D
> =0D
> Hereby, a Fence lives in the same chunk of memory as a DriverFence. Both=
=0D
> share the refcount of the underlying C dma_fence. Since this=0D
> implementation does not provide a custom dma_fence_backend_ops.release()=
=0D
> function, the memory is freed by the dma_fence backend once the refcount=
=0D
> drops to 0.=0D
> =0D
> To create a DriverFence, the user must first allocate a=0D
> DriverFenceAllocation, so that the creation of the DriverFence later on=0D
> can always succeed. Otherwise, deadlocks could occur if fences need to=0D
> be created in a GPU job submission path.=0D
> =0D
> Synchronization is ensured by the dma_fence backend.=0D
> =0D
> All DriverFence's created through this abstraction must be signalled by=0D
> the creator with an error code. In case a DriverFence drops without=0D
> being signalled beforehand, it is signalled with -ECANCELLED as its=0D
> error and a warning is printed. This allows the Rust abstraction to very=
=0D
> cleanly decouple fence issuer and consumer by relying on the decoupling=0D
> mechanisms in the C backend, which ensures through RCU and the=0D
> 'signalled' fence-flag that dma_fence_backend_ops functions cannot=0D
> access the potentially unloaded driver code anymore.=0D
> =0D
> Signalling fences on drop thus grants many advantages. Not signalling=0D
> fences on drop would risk deadlock and does not grant real advantages:=0D
> By definition only the drivers can ensure that a fence always represents=
=0D
> the hardware's state correctly.=0D
> =0D
> This implementation models a DmaFenceCtx (fence context) object on which=
=0D
> fences are to be created, thereby ensuring correct sequence numbering=0D
> according to the timeline.=0D
> =0D
> dma_fence supports a variety of callbacks. The mandatory callbacks=0D
> (get_timeline_name() and get_driver_name()) are implemented in this=0D
> patch. For convenience, they store those name parameters in the fence=0D
> context, saving the driver from implementing these two callbacks.=0D
> =0D
> Support for other callbacks (like for hardware signalling) is prepared=0D
> for through the fact that both DriverFence and Fence live in the same=0D
> allocation, allowing for usage of container_of from the callback to=0D
> access the driver-specific data.=0D
> =0D
> Synchronization for backend_ops callbacks is ensured by only running the=
=0D
> Rust deconstructor delayed with call_rcu(), which prevents UAF-bugs=0D
> should a DriverFence drop while a Fence callback is currently operating=0D
> on the associated driver data.=0D
> =0D
> Add abstractions for dma_fence in Rust.=0D
> =0D
> Signed-off-by: Philipp Stanner <phasta@kernel.org>=0D
> ---=0D
>  rust/bindings/bindings_helper.h  |   1 +=0D
>  rust/helpers/dma_fence.c         |  48 ++=0D
>  rust/helpers/helpers.c           |   1 +=0D
>  rust/kernel/dma_buf/dma_fence.rs | 884 +++++++++++++++++++++++++++++++=0D
>  rust/kernel/dma_buf/mod.rs       |  14 +=0D
>  rust/kernel/lib.rs               |   1 +=0D
>  6 files changed, 949 insertions(+)=0D
>  create mode 100644 rust/helpers/dma_fence.c=0D
>  create mode 100644 rust/kernel/dma_buf/dma_fence.rs=0D
>  create mode 100644 rust/kernel/dma_buf/mod.rs=0D
> =0D
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h=0D
> index 446dbeaf0866..814d7740e686 100644=0D
> --- a/rust/bindings/bindings_helper.h=0D
> +++ b/rust/bindings/bindings_helper.h=0D
> @@ -52,6 +52,7 @@=0D
>  #include <linux/debugfs.h>=0D
>  #include <linux/device/faux.h>=0D
>  #include <linux/dma-direction.h>=0D
> +#include <linux/dma-fence.h>=0D
>  #include <linux/dma-mapping.h>=0D
>  #include <linux/dma-resv.h>=0D
>  #include <linux/errname.h>=0D
> diff --git a/rust/helpers/dma_fence.c b/rust/helpers/dma_fence.c=0D
> new file mode 100644=0D
> index 000000000000..0e08411098fa=0D
> --- /dev/null=0D
> +++ b/rust/helpers/dma_fence.c=0D
> @@ -0,0 +1,48 @@=0D
> +// SPDX-License-Identifier: GPL-2.0=0D
> +=0D
> +#include <linux/dma-fence.h>=0D
> +=0D
> +__rust_helper void rust_helper_dma_fence_get(struct dma_fence *f)=0D
> +{=0D
> +	dma_fence_get(f);=0D
> +}=0D
> +=0D
> +__rust_helper void rust_helper_dma_fence_put(struct dma_fence *f)=0D
> +{=0D
> +	dma_fence_put(f);=0D
> +}=0D
=0D
[...]=0D
=0D
> +=0D
> +    /// Create a [`FenceCtx`] from an associated [`bindings::dma_fence`]=
.=0D
> +    ///=0D
> +    /// # Safety=0D
> +    ///=0D
> +    /// `ptr` must be a valid pointer to a dma_fence which resides withi=
n a [`Fence`],=0D
> +    /// which in turn resides in a [`DriverFenceData`].=0D
> +    unsafe fn from_raw_fence<'a>(ptr: *mut bindings::dma_fence) -> &'a S=
elf {=0D
> +        let opaque_fence =3D Opaque::cast_from(ptr);=0D
> +=0D
> +        // SAFETY: Safe due to the function's overall safety requirement=
s.=0D
> +        let fence_ptr =3D unsafe { container_of!(opaque_fence, Fence, in=
ner) };=0D
> +=0D
> +        // DriverFenceData is repr(C) and a Fence is its first member.=0D
> +        let fence_data_ptr =3D fence_ptr as *mut DriverFenceData<T>;=0D
=0D
Either the field ordering on the type or this code is wrong because the fir=
st=0D
member of DriverFenceData is `rcu_head`.=0D
=0D
> +=0D
> +        // SAFETY: Safe because of the safety comment directly above.=0D
> +        let fence_data =3D unsafe { &*fence_data_ptr };=0D
> +=0D
> +        &fence_data.fctx=0D
> +    }=0D
> +}=0D
> +=0D
> +/// Error type for fence callback registration.=0D
> +///=0D
> +/// Generic over `T` so that `AlreadySignaled` can return the callback t=
o the=0D
> +/// caller, allowing it to reclaim any resources owned by the callback (=
e.g.,=0D
> +/// a fence handle that needs to be signaled).=0D
> +#[derive(Debug)]=0D
> +pub enum CallbackError<T =3D ()> {=0D
> +    /// The fence was already signaled. The callback is returned so the =
caller=0D
> +    /// can extract owned resources without losing them.=0D
=0D
[...]=0D
=0D
> +        //=0D
> +        // Without this, Drop can race with a concurrent signal:=0D
> +        //   CPU0 (signal, lock held): take() -> signaled(fence_ref) (in=
 progress)=0D
> +        //   CPU1 (drop): sees is_some()=3D=3Dfalse -> skips lock -> fre=
es struct=0D
> +        //   CPU0: accesses fence_ref -> use-after-free=0D
> +        //=0D
> +        // When the callback has already fired, the signal path detached=
 the=0D
> +        // list node via INIT_LIST_HEAD, so dma_fence_remove_callback ju=
st sees=0D
> +        // an empty node and returns false =E2=80=94 the lock acquisitio=
n is the only=0D
> +        // thing that matters.=0D
> +        //=0D
> +        // SAFETY: The fence pointer is valid and the cb was initialized=
 by=0D
> +        // dma_fence_add_callback during construction.=0D
> +        unsafe {=0D
> +            bindings::dma_fence_remove_callback(self.fence.as_raw(), sel=
f.cb.get());=0D
> +        }=0D
> +    }=0D
> +}=0D
> +=0D
> +// SAFETY: FenceCbRegistration can be sent between threads=0D
> +unsafe impl<T: FenceCb> Send for FenceCbRegistration<T> {}=0D
> +=0D
> +// SAFETY: &FenceCbRegistration can be shared between threads if &T can.=
=0D
> +unsafe impl<T: FenceCb> Sync for FenceCbRegistration<T> where T: Sync {}=
=0D
> +=0D
> +/// The receiving counterpart of a [`DriverFence`], designed to register=
 callbacks=0D
> +/// on, check the signalled state etc. A [`Fence`] cannot be signalled.=
=0D
> +/// A [`Fence`] is always refcounted.=0D
> +pub struct Fence {=0D
> +    /// The actual dma_fence passed to C.=0D
> +    inner: Opaque<bindings::dma_fence>,=0D
> +}=0D
=0D
I am unsure whether it is safe to cast the pointer in Fence::from_raw witho=
ut=0D
Fence being #[repr(transparent)] as the layout compatibility is not guarant=
eed=0D
explicitly.=0D
=0D
Regards,=0D
Onur=0D
=0D
> +=0D
> +// SAFETY: Fences are literally designed to be shared between threads.=0D
> +unsafe impl Send for Fence {}=0D
> +// SAFETY: Fences are literally designed to be shared between threads.=0D
> +unsafe impl Sync for Fence {}=0D
> +=0D
> +impl Fence {=0D
> +    /// Check whether the fence was signalled at the moment of the funct=
ion call.=0D
> +    ///=0D
> +    /// Note that this can return `true` for a [`Fence`] whose [`DriverF=
ence`]=0D
> +    /// has not yet been dropped. The reason is that the fence ops callb=
acks can=0D
> +    /// cause the fence to get signaled by the C backend.=0D
> +    pub fn is_signaled(&self) -> bool {=0D
> +        let fence =3D self.as_raw();=0D
> +        let mut fence_flags: usize =3D 0;=0D
> +        let flag_ptr =3D &raw mut fence_flags;=0D
> +=0D
> +        // We shouuld not use `dma_fence_is_signaled_locked()` here, bec=
ause=0D
> +        // according to the C backend's recommendations, that function i=
s problematic=0D
> +        // and we should avoid calling that function with a lock held.=0D
> +=0D
> +        // SAFETY: `self` is valid by definition. We take the spinlock a=
bove.=0D
> +        let ret =3D unsafe { bindings::dma_fence_is_signaled(fence) };=0D
> +=0D
> +        // To guarantee that an API caller can 100% rely on the signalli=
ng being=0D
=0D
[...]=0D
=0D
> +    unsafe { bindings::dma_fence_put(fence) };=0D
> +=0D
> +    // The actual memory the data associated with a `DriverFence` lives =
in=0D
> +    // gets freed by the C dma_fence backend once the fence's refcount r=
eaches 0.=0D
> +}=0D
> diff --git a/rust/kernel/dma_buf/mod.rs b/rust/kernel/dma_buf/mod.rs=0D
> new file mode 100644=0D
> index 000000000000..fb353ce042ce=0D
> --- /dev/null=0D
> +++ b/rust/kernel/dma_buf/mod.rs=0D
> @@ -0,0 +1,14 @@=0D
> +// SPDX-License-Identifier: GPL-2.0 OR MIT=0D
> +=0D
> +//! DMA-buf subsystem abstractions.=0D
> +=0D
> +pub mod dma_fence;=0D
> +=0D
> +pub use self::dma_fence::{=0D
> +    DriverFence,=0D
> +    Fence,=0D
> +    FenceCb,=0D
> +    FenceCbRegistration,=0D
> +    FenceCtx,=0D
> +    FenceCtxOps, //=0D
> +};=0D
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs=0D
> index b72b2fbe046d..a05ccaa7598c 100644=0D
> --- a/rust/kernel/lib.rs=0D
> +++ b/rust/kernel/lib.rs=0D
> @@ -63,6 +63,7 @@=0D
>  pub mod device_id;=0D
>  pub mod devres;=0D
>  pub mod dma;=0D
> +pub mod dma_buf;=0D
>  pub mod driver;=0D
>  #[cfg(CONFIG_DRM =3D "y")]=0D
>  pub mod drm;=0D
> -- =0D
> 2.54.0=0D
> =0D

