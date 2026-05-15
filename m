Return-Path: <linux-media+bounces-61723-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFugMqQnB2ppsQIAu9opvQ
	(envelope-from <linux-media+bounces-61723-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 16:03:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 389FA550F38
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 16:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 79023301414C
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACCF12DEA6B;
	Fri, 15 May 2026 13:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="XFrf0pQ3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752A3481667
	for <linux-media@vger.kernel.org>; Fri, 15 May 2026 13:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778853107; cv=none; b=rJvYmdlldglsU4oPJVgcjGbXahBRNfRI9Q/1gnp4B6GU3hBXBWvBQssDmqbXYnavSq3v/NX1Na7fzMraC8eYw/xVRRW2yuCaxrQuxCG+DCUoYEOZCHyRGxbk5XwcujvXEQ9NPtzCKaYZuZicK59u08eZ3f2YTxPmJQEmGgfOHog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778853107; c=relaxed/simple;
	bh=Rj/Yk12PUjvyF5KpAsG6J5YWsgFX6rcDROHIieo3fIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iy1dljOTamLB6pgVSnPw+5WlYfK4QSeq2Vo0gEEAX3YnXX/giXHzcqJvE4JPRNfkOJv/N5+5yY/pGwYuKPpv6qtH54+ra/1tcVg+deUuFS4ML3lXg3K6TVTTapIpp7bWd43Bj6rGmLMey/m5G5NeXoB7ks84zSqerlUdWeBkNK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=XFrf0pQ3; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1778853092; x=1779112292;
	bh=eM9mWpWvkGzS1thYPbnUk0v2R2qppB+757boh5uu7M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=XFrf0pQ3NDUyjIH6eCg1U/Wbf01NRbOSHeq3iTqNXcJqmLBiy3mDTk3CvuA1WkUHA
	 xCWVj9tsXKRdSEWoA2WPD1uoXZ7aXVk9cfNQKYNwv2wXRQ/NRTu6lfZqUWV+YvXDMh
	 /n9Y0UVVoV7hut2BElFqLLNehd+hH73bDVo8XPfFajM0Y3SNv1SbsgsOP9u4bgShSr
	 +Pl3kYBDSqy7DI5oPbXcsvKnmd+Yypav2oAIE8d0MUm1Tg1fk3keSFaGHur0Wh5QH9
	 VsTa/u2wb+1VSINzPRhEDOpEATpBwLF5gwZ51b8GpgNSI6OUiR4RGly9MnIYpud5vQ
	 /OCUvqECuTzvg==
X-Pm-Submission-Id: 4gH7s95ThGz2ScpZ
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
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Matthew Maurer <mmaurer@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Asahi Lina <lina+kernel@asahilina.net>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH v3] rust: dma_buf: Add dma_fence abstractions
Date: Fri, 15 May 2026 16:51:19 +0300
Message-ID: <20260515135124.15118-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260515131836.273509-3-phasta@kernel.org>
References: <20260515131836.273509-3-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 389FA550F38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[onurozkan.dev,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[onurozkan.dev:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61723-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[onurozkan.dev:+];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[work@onurozkan.dev,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,collabora.com,linuxfoundation.org,gmail.com,asahilina.net,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[self.data:url,onurozkan.dev:mid,onurozkan.dev:dkim,memory.data:url]
X-Rspamd-Action: no action

On Fri, 15 May 2026 15:18:33 +0200=0D
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
> Synchronization for backend_ops callbacks will be ensured through RCU=0D
> (TODO) which will prevent UAF-bugs should a DriverFence drop while a=0D
> Fence callback is currently operating on the associated driver data.=0D
> =0D
> Add abstractions for dma_fence in Rust.=0D
> =0D
> Signed-off-by: Philipp Stanner <phasta@kernel.org>=0D
> ---=0D
> Hi guys,=0D
> =0D
> (I try to make the naming more consistent and count this as v3, v1 being=
=0D
> the WIP RFC and v2 the previous RFC [1])=0D
> =0D
> Changes in v3:=0D
>   - Omit JobQueue patches for now=0D
>   - Completely redesign the memory layout: Instead of a Fence=0D
>     refcounting a DriverFence, both now live in the same allocation to=0D
>     allow for future support the dma_fence backend_ops callbacks which=0D
>     need to do container_of. (mostly Boris's feedback)=0D
>   - Allow for pre-allocating fences to avoid deadlocks when submitting=0D
>     jobs to a GPU. (Boris)=0D
>   - Simultaneously, allow for pre-preparing fence callback objects, so=0D
>     the driver can allocate them when it sees fit. (code largely stolen=0D
>     and inspired by Daniel).=0D
>   - Signal fences on drop, ensure synchronization.=0D
>   - Force users to set an error code when signalling.=0D
>   - Write more documentation=0D
>   - A ton of minor other changes.=0D
> =0D
> So, this is the spiritual successor of the first / second RFC [1]. v2=0D
> also contained code for drm::JobQueue, but mostly to show how the fence=0D
> code would be used. JobQueue is under heavy rework right now, so I don't=
=0D
> want to bother your eyes with it. The docstring examples should show how=
=0D
> Rust fences are supposed to be used, though.=0D
> =0D
> This v3 contains a huge amount of highly valuable feedback from a=0D
> variety of people, notably Boris, but also from Alice, Gary and Danilo.=0D
> =0D
> There are some TODOs open (a better trait for fence backend_ops and RCU=0D
> support), but my hope is that this effort is now finally approaching its=
=0D
> end.=0D
> =0D
> I would greatly appreciate feedback and especially more information=0D
> about what might be missing to make this usable, which is obviously=0D
> where Daniel's and Boris's feedback will be valuable once more.=0D
> =0D
> Please regard this patch just as what it's titled: an RFC, to discuss a=0D
> bit more and to inform a broader community about what the current state=0D
> is and where this is heading at.=0D
> =0D
> Many regards,=0D
> Philipp=0D
> =0D
> [1] https://lore.kernel.org/rust-for-linux/20260203081403.68733-2-phasta@=
kernel.org/=0D
> =0D
> ---=0D
>  rust/bindings/bindings_helper.h  |   1 +=0D
>  rust/helpers/dma_fence.c         |  48 +++=0D
>  rust/helpers/helpers.c           |   1 +=0D
>  rust/kernel/dma_buf/dma_fence.rs | 626 +++++++++++++++++++++++++++++++=0D
>  rust/kernel/dma_buf/mod.rs       |   7 +=0D
>  rust/kernel/lib.rs               |   1 +=0D
>  6 files changed, 684 insertions(+)=0D
>  create mode 100644 rust/helpers/dma_fence.c=0D
>  create mode 100644 rust/kernel/dma_buf/dma_fence.rs=0D
>  create mode 100644 rust/kernel/dma_buf/mod.rs=0D
> =0D
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h=0D
> index 083cc44aa952..69a5f50e7159 100644=0D
> --- a/rust/bindings/bindings_helper.h=0D
> +++ b/rust/bindings/bindings_helper.h=0D
> @@ -51,6 +51,7 @@=0D
>  #include <linux/device/faux.h>=0D
>  #include <linux/dma-direction.h>=0D
>  #include <linux/dma-mapping.h>=0D
> +#include <linux/dma-fence.h>=0D
>  #include <linux/errname.h>=0D
>  #include <linux/ethtool.h>=0D
>  #include <linux/fdtable.h>=0D
> diff --git a/rust/helpers/dma_fence.c b/rust/helpers/dma_fence.c=0D
> new file mode 100644=0D
> index 000000000000..d046515465fe=0D
> --- /dev/null=0D
> +++ b/rust/helpers/dma_fence.c=0D
> @@ -0,0 +1,48 @@=0D
> +// SPDX-License-Identifier: GPL-2.0=0D
> +=0D
> +#include <linux/dma-fence.h>=0D
> +=0D
> +void rust_helper_dma_fence_get(struct dma_fence *f)=0D
> +{=0D
> +	dma_fence_get(f);=0D
> +}=0D
> +=0D
> +void rust_helper_dma_fence_put(struct dma_fence *f)=0D
> +{=0D
> +	dma_fence_put(f);=0D
> +}=0D
> +=0D
> +bool rust_helper_dma_fence_begin_signalling(void)=0D
> +{=0D
> +	return dma_fence_begin_signalling();=0D
> +}=0D
> +=0D
> +void rust_helper_dma_fence_end_signalling(bool cookie)=0D
> +{=0D
> +	dma_fence_end_signalling(cookie);=0D
> +}=0D
> +=0D
> +bool rust_helper_dma_fence_is_signaled(struct dma_fence *f)=0D
> +{=0D
> +	return dma_fence_is_signaled(f);=0D
> +}=0D
> +=0D
> +bool rust_helper_dma_fence_is_signaled_locked(struct dma_fence *f)=0D
> +{=0D
> +	return dma_fence_is_signaled_locked(f);=0D
> +}=0D
> +=0D
> +void rust_helper_dma_fence_lock_irqsave(struct dma_fence *f, unsigned lo=
ng *flags)=0D
> +{=0D
> +	dma_fence_lock_irqsave(f, *flags);=0D
> +}=0D
> +=0D
> +void rust_helper_dma_fence_unlock_irqrestore(struct dma_fence *f, unsign=
ed long *flags)=0D
> +{=0D
> +	dma_fence_unlock_irqrestore(f, *flags);=0D
> +}=0D
> +=0D
> +void rust_helper_dma_fence_set_error(struct dma_fence *f, int error)=0D
> +{=0D
> +	dma_fence_set_error(f, error);=0D
> +}=0D
=0D
You should add __rust_helper prefixes to helper functions.=0D
=0D
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c=0D
> index a3c42e51f00a..d1cd0c13ad07 100644=0D
> --- a/rust/helpers/helpers.c=0D
> +++ b/rust/helpers/helpers.c=0D
> @@ -28,6 +28,7 @@=0D
>  #include "cred.c"=0D
>  #include "device.c"=0D
>  #include "dma.c"=0D
> +#include "dma_fence.c"=0D
>  #include "drm.c"=0D
>  #include "err.c"=0D
>  #include "irq.c"=0D
> diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_f=
ence.rs=0D
> new file mode 100644=0D
> index 000000000000..374ff4833678=0D
> --- /dev/null=0D
> +++ b/rust/kernel/dma_buf/dma_fence.rs=0D
> @@ -0,0 +1,626 @@=0D
> +// SPDX-License-Identifier: GPL-2.0=0D
> +//=0D
> +// Copyright (C) 2025, 2026 Red Hat Inc.:=0D
> +//   - Philipp Stanner <pstanner@redhat.com>=0D
> +=0D
> +//! dma_fence abstractions for Rust.=0D
> +//!=0D
> +//! Reference: <https://docs.kernel.org/driver-api/dma-buf.html#c.dma_fe=
nce>=0D
> +//!=0D
> +//! C header: [`include/linux/dma-fence.h`](srctree/include/linux/dma-fe=
nce.h)=0D
> +=0D
> +use crate::{=0D
> +    bindings,=0D
> +    prelude::*,=0D
> +    types::ForeignOwnable,=0D
> +    types::{ARef, AlwaysRefCounted, Opaque},=0D
> +    alloc::AllocError,=0D
> +    error::to_result,=0D
> +};=0D
> +=0D
> +use pin_init::pin_init_from_closure;=0D
> +=0D
> +use core::{=0D
> +    ptr,=0D
> +    ptr::{drop_in_place, NonNull},=0D
> +    sync::atomic::{AtomicU64, Ordering},=0D
> +    ops::Deref,=0D
> +    marker::PhantomData,=0D
> +};=0D
> +=0D
> +use bindings::ECANCELED;=0D
> +=0D
> +use kernel::sync::{Arc, ArcBorrow};=0D
> +use kernel::str::CString;=0D
> +=0D
=0D
These imports needs the vertical format.=0D
=0D
> +=0D
> +/// A dma-fence context. A fence context takes care of associating relat=
ed fences with each other,=0D
> +/// providing each with raising sequence numbers and a common identifier=
.=0D
> +#[pin_data(PinnedDrop)]=0D
> +pub struct FenceCtx<F: Send + Sync, C: Send + Sync> {=0D
> +    /// The fence context number.=0D
> +    nr: u64,=0D
> +    /// The sequence number for the next fence created.=0D
> +    seqno: AtomicU64,=0D
> +    /// The name of the driver this FenceCtx's fences belong to.=0D
> +    driver_name: CString,=0D
> +    /// The name of the timeline this FenceCtx's fences belong to.=0D
> +    timeline_name: CString,=0D
> +    #[pin]=0D
> +    data: C,=0D
> +    fence_type: PhantomData<F>,=0D
> +}=0D
> +=0D
> +impl<F: Send + Sync, C: Send + Sync> FenceCtx<F, C> {=0D
> +    // This can later be extended as a vtable in case other parties need=
 support=0D
> +    // for the more "exotic" callbacks.=0D
> +    const OPS: bindings::dma_fence_ops =3D bindings::dma_fence_ops {=0D
> +        get_driver_name: Some(Self::get_driver_name),=0D
> +        get_timeline_name: Some(Self::get_timeline_name),=0D
> +        enable_signaling: None,=0D
> +        signaled: None,=0D
> +        wait: None,=0D
> +        release: None,=0D
> +        set_deadline: None,=0D
> +    };=0D
> +=0D
> +    /// Create a new `FenceCtx`.=0D
> +    pub fn new(driver_name: CString, timeline_name: CString, data: impl =
PinInit<C>) -> Result<Arc<Self>> {=0D
> +        let ctx =3D pin_init!(Self {=0D
> +            // SAFETY: `dma_fence_context_alloc()` merely works on a glo=
bal atomic. Parameter `1`=0D
> +            // is the number of contexts we want to allocate.=0D
> +            nr: unsafe { bindings::dma_fence_context_alloc(1) },=0D
> +            seqno: AtomicU64::new(0),=0D
> +            driver_name,=0D
> +            timeline_name,=0D
> +            data <- data,=0D
> +            fence_type: PhantomData,=0D
> +        });=0D
> +=0D
> +        Arc::pin_init(ctx, GFP_KERNEL)=0D
> +    }=0D
> +=0D
> +    fn get_next_fence_seqno(&self) -> u64 {=0D
> +        self.seqno.fetch_add(1, Ordering::Relaxed)=0D
> +    }=0D
> +=0D
> +    /// Allocate the memory for a [`DriverFence`] and already store `dat=
a` inside.=0D
> +    ///=0D
> +    /// This is needed because many times, creation of a [`DriverFence`]=
 must not=0D
> +    /// fail, and allocating might deadlock in some situations.=0D
> +    pub fn new_fence_allocation(=0D
> +        self: ArcBorrow<'_, Self>,=0D
> +        data: F,=0D
> +    ) -> Result<DriverFenceAllocation<F, C>> {=0D
> +        let fctx =3D Arc::<Self>::from(self);=0D
> +=0D
> +        DriverFenceAllocation::new(fctx, data)=0D
> +    }=0D
> +=0D
> +    /// Create a new fence, consuming `data`.=0D
> +    ///=0D
> +    /// The fence will increment the refcount of the fence context assoc=
iated with this=0D
> +    /// [`FenceCtx`].=0D
> +    pub fn new_fence(&self, memory: DriverFenceAllocation<F, C>) -> Driv=
erFence<F, C> {=0D
> +        let seqno: u64 =3D self.get_next_fence_seqno();=0D
> +=0D
> +        // We feed the C dma_fence backend a NULL for the spinlock so th=
at it=0D
> +        // uses per-fence locks automatically.=0D
> +        let null_ptr: *mut bindings::spinlock =3D ptr::null_mut();=0D
> +        let fence_ptr =3D memory.as_raw();=0D
> +        // SAFETY: `fence_data` has been created directly above. It will=
 live=0D
> +        // at least as long as `Self`. The same applies to `&Self::OPS`.=
=0D
=0D
There is no `fence_data` in this function.=0D
=0D
> +        unsafe { bindings::dma_fence_init(fence_ptr, &Self::OPS, null_pt=
r, self.nr, seqno) };=0D
> +=0D
> +        // A [`DriverFenceAllocation`]'s purpose is to carry allocated m=
emory, so that=0D
> +        // [`DriverFence`]s can always be created without allocating. In=
 this=0D
> +        // method, ownership over that memory is transferred to the new=
=0D
> +        // [`DriverFence`] and managed through refcounting. The C dma_fe=
nce=0D
> +        // backend will ultimately free the memory once the refcount rea=
ches 0.=0D
=0D
I don't think these [`$name`] intra-docs work in regular comments, do they?=
=0D
=0D
> +        let ptr =3D KBox::into_raw(memory.data);=0D
> +        // SAFETY: `ptr` was just created validly directly above.=0D
> +        let ptr =3D unsafe { NonNull::new_unchecked(ptr) };=0D
> +        let driver_fence =3D DriverFence { data: ptr };=0D
> +=0D
> +        driver_fence=0D
> +    }=0D
> +=0D
> +    extern "C" fn get_driver_name(ptr: *mut bindings::dma_fence) -> *con=
st c_char {=0D
> +        // SAFETY: The C backend only invokes this callback with `ptr` p=
ointing=0D
> +        // to a valid, unsignaled [`bindings::dma_fence`]. All fences cr=
eated=0D
> +        // in this module always reside within [`Fence`] which always re=
sides in=0D
> +        // a [`DriverFenceData`], thus satisfying the function's safety =
requirements.=0D
> +        let fctx =3D unsafe { Self::from_raw_fence(ptr) };=0D
> +=0D
> +        fctx.driver_name.as_char_ptr()=0D
> +    }=0D
> +=0D
> +    extern "C" fn get_timeline_name(ptr: *mut bindings::dma_fence) -> *c=
onst c_char {=0D
> +        // SAFETY: The C backend only invokes this callback with `ptr` p=
ointing=0D
> +        // to a valid, unsignaled [`bindings::dma_fence`]. All fences cr=
eated=0D
> +        // in this module always reside within [`Fence`] which always re=
sides in=0D
> +        // a [`DriverFenceData`], thus satisfying the function's safety =
requirements.=0D
> +        let fctx =3D unsafe { Self::from_raw_fence(ptr) };=0D
> +=0D
> +        fctx.timeline_name.as_char_ptr()=0D
> +    }=0D
> +=0D
> +    // Create a [`FenceCtx`] from an associated [`bindings::dma_fence`].=
=0D
> +    //=0D
> +    // # Safety=0D
> +    // `ptr` must be a valid pointer to a dma_fence which resides within=
 a [`Fence`],=0D
> +    // which in turn resides in a [`DriverFenceData`].=0D
=0D
These are missing extra '/'.=0D
=0D
> +    unsafe fn from_raw_fence<'a>(ptr: *mut bindings::dma_fence) -> &'a S=
elf {=0D
> +        let opaque_fence =3D Opaque::cast_from(ptr);=0D
> +=0D
> +        // SAFETY: Safe due to the function's overall safety requirement=
s.=0D
> +        let fence_ptr =3D unsafe { crate::container_of!(opaque_fence, Fe=
nce, inner) };=0D
> +=0D
> +        // SAFETY: Safe because of the safety comment directly above.=0D
> +        let fence_data_ptr =3D unsafe { crate::container_of!(fence_ptr, =
DriverFenceData<F, C>, inner) };=0D
> +=0D
> +        // SAFETY: Safe because of the safety comment directly above.=0D
> +        let fence_data =3D unsafe { & *fence_data_ptr };=0D
> +=0D
> +        let fctx =3D & *fence_data.fctx;=0D
> +=0D
> +        fctx=0D
> +    }=0D
> +}=0D
> +=0D
> +#[pinned_drop]=0D
> +impl<F: Send + Sync, C: Send + Sync> PinnedDrop for FenceCtx<F, C> {=0D
> +    fn drop(self: Pin<&mut Self>) {=0D
> +        // TODO: rcu_barrier() once the call_rcu() in DriverFence::drop(=
) is in place=0D
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
> +    AlreadySignaled(T),=0D
> +    /// Some other error occurred during registration.=0D
> +    Other(Error),=0D
> +}=0D
> +=0D
> +impl<T> From<CallbackError<T>> for Error {=0D
> +    fn from(err: CallbackError<T>) -> Self {=0D
> +        match err {=0D
> +            CallbackError::AlreadySignaled(_) =3D> ENOENT,=0D
> +            CallbackError::Other(e) =3D> e,=0D
> +        }=0D
> +    }=0D
> +}=0D
> +=0D
> +impl<T> From<AllocError> for CallbackError<T> {=0D
> +    fn from(e: AllocError) -> Self {=0D
> +        CallbackError::Other(Error::from(e))=0D
> +    }=0D
> +}=0D
> +=0D
> +/// Trait for callbacks that can be registered on fences.=0D
> +///=0D
> +/// When the fence signals, the callback will be invoked.=0D
> +///=0D
> +/// # Example=0D
> +///=0D
> +/// ```rust=0D
> +/// use kernel::dma_buf::{Fence, FenceCb, FenceCbRegistration};=0D
> +/// use kernel::types::ARef;=0D
> +///=0D
> +/// struct MyCallback {=0D
> +///     // Your callback state here=0D
> +/// }=0D
> +///=0D
> +/// impl FenceCb for MyCallback {=0D
> +///     fn called(&mut self) {=0D
> +///         pr_info!("Fence signaled!");=0D
> +///         // Handle fence completion=0D
> +///     }=0D
> +/// }=0D
> +/// ```=0D
> +pub trait FenceCb: Send + 'static {=0D
> +    /// Called when the fence is signaled.=0D
> +    ///=0D
> +    /// This is called from the fence signaling path, which may be in in=
terrupt=0D
> +    /// context or with locks held, which is why `self` is only borrowed=
, so that=0D
> +    /// it cannot drop. Implementations must not sleep or perform=0D
> +    /// long-running operations.=0D
> +    ///=0D
> +    /// An implementation likely wants to inform itself (e.g., through a=
 work item)=0D
> +    /// within this callback that the associated [`FenceCbRegistration`]=
 can now be=0D
> +    /// dropped.=0D
> +    fn called(&mut self);=0D
> +}=0D
> +=0D
> +/// A callback registration on a fence.=0D
> +///=0D
> +/// When this object is dropped, the callback is automatically removed i=
f it=0D
> +/// hasn't been called yet.=0D
> +///=0D
> +/// # Invariants=0D
> +///=0D
> +/// If `callback` is `Some`, then `cb` is registered with the fence and =
the=0D
> +/// callback hasn't been invoked yet. If `None`, the callback has been i=
nvoked=0D
> +/// or the fence was already signaled when we tried to register.=0D
> +#[pin_data(PinnedDrop)]=0D
> +pub struct FenceCbRegistration<T: FenceCb + 'static> {=0D
> +    #[pin]=0D
> +    cb: Opaque<bindings::dma_fence_cb>,=0D
> +    callback: T,=0D
> +    fence: ARef<Fence>,=0D
> +}=0D
> +=0D
> +impl<T: FenceCb> FenceCbRegistration<T> {=0D
> +    /// Register a callback on a fence.=0D
> +    ///=0D
> +    /// On success the callback is pinned in place and will fire when th=
e fence=0D
> +    /// signals. On `AlreadySignaled` the callback is returned to the ca=
ller so=0D
> +    /// that owned resources can be reclaimed.=0D
> +    pub fn new<'a>(=0D
> +        fence: &'a Fence,=0D
> +        callback: T,=0D
> +    ) -> impl PinInit<Self, CallbackError<T>> + 'a=0D
> +    where=0D
> +        T: 'a,=0D
> +    {=0D
> +        // Uses `pin_init_from_closure` instead of `try_pin_init!` so th=
at on=0D
> +        // `-ENOENT` (already signaled) the callback can be read back fr=
om the=0D
> +        // partially-initialized slot and returned through the error.=0D
> +        //=0D
> +        // SAFETY: `pin_init_from_closure` requires:=0D
> +        // - On `Ok(())`: the slot is fully initialized and valid for `D=
rop`.=0D
> +        // - On `Err(_)`: the slot is clean, i.e.: no partially-initiali=
zed fields=0D
> +        //   remain, and the slot can be deallocated without dropping.=0D
> +        //=0D
> +        // We uphold this as follows:=0D
> +        // - On success: all three fields are initialized. Ok(()) is ret=
urned.=0D
> +        // - On ENOENT (already signaled): `callback` and `fence` are re=
ad back=0D
> +        //   from the slot via `ptr::read`, leaving the slot clean. `cb`=
 was=0D
> +        //   initialized by `dma_fence_add_callback` (it calls=0D
> +        //   `INIT_LIST_HEAD(&cb->node)` even on error), but `cb` is=0D
> +        //   `Opaque<dma_fence_cb>` which has no `Drop`, so not dropping=
 it is=0D
> +        //   fine. The callback is returned through `AlreadySignaled(T)`=
.=0D
> +        // - On other errors: same cleanup as ENOENT, error returned as=
=0D
> +        //   `Other(e)`.=0D
> +        unsafe {=0D
=0D
I think we should have single unsafe call for per unsafe block. Some of the=
 code=0D
in this block also considered safe, so they shouldn't be there as well.=0D
=0D
> +            pin_init_from_closure(move |slot: *mut Self| {=0D
> +                let slot_callback =3D &raw mut (*slot).callback;=0D
> +                let slot_fence =3D &raw mut (*slot).fence;=0D
> +                let slot_cb =3D &raw mut (*slot).cb;=0D
> +=0D
> +                // Write callback and fence first =E2=80=94 must be visi=
ble before=0D
> +                // dma_fence_add_callback makes the registration live.=0D
> +                core::ptr::write(slot_callback, callback);=0D
> +                core::ptr::write(slot_fence, ARef::from(fence));=0D
> +=0D
> +                let ret =3D to_result(bindings::dma_fence_add_callback(=
=0D
> +                    fence.inner.get(),=0D
> +                    Opaque::cast_into(slot_cb),=0D
> +                    Some(Self::dma_fence_callback),=0D
> +                ));=0D
> +=0D
> +                match ret {=0D
> +                    Ok(()) =3D> Ok(()),=0D
> +                    Err(e) =3D> {=0D
> +                        // Read back what we wrote to leave the slot cle=
an.=0D
> +                        let cb_back =3D core::ptr::read(slot_callback);=
=0D
> +                        let _fence_back =3D core::ptr::read(slot_fence);=
=0D
> +=0D
> +                        if e.to_errno() =3D=3D ENOENT.to_errno() {=0D
> +                            Err(CallbackError::AlreadySignaled(cb_back))=
=0D
> +                        } else {=0D
> +                            Err(CallbackError::Other(e))=0D
> +                        }=0D
> +                    }=0D
> +                }=0D
> +            })=0D
> +        }=0D
> +    }=0D
> +=0D
> +    /// Raw dma fence callback that is called by the C code.=0D
> +    ///=0D
> +    /// # Safety=0D
> +    ///=0D
> +    /// This is only called by the dma_fence subsystem with valid pointe=
rs.=0D
> +    unsafe extern "C" fn dma_fence_callback(=0D
> +        _fence: *mut bindings::dma_fence,=0D
> +        cb: *mut bindings::dma_fence_cb,=0D
> +    ) {=0D
> +        // SAFETY: All `cb` we can receive here have been created in suc=
h a way=0D
> +        // that they are embedded into a [`FenceCbRegistration`]. The ba=
ckend=0D
> +        // ensures synchronisation so whoever holds the registration obj=
ect=0D
> +        // cannot drop it while this code is running. See [`FenceCbRegis=
tration::drop`].=0D
> +        unsafe {=0D
=0D
Same as above.=0D
=0D
> +            let ptr =3D Opaque::cast_from(cb).cast_mut();=0D
> +            let reg: *mut Self =3D crate::container_of!(ptr, Self, cb);=
=0D
> +=0D
> +            (*reg).callback.called();=0D
> +        }=0D
> +    }=0D
> +=0D
> +    /// Returns a reference to the fence this callback is registered on.=
=0D
> +    pub fn fence(self: Pin<&Self>) -> &Fence {=0D
> +        &self.get_ref().fence=0D
> +    }=0D
> +}=0D
> +=0D
> +#[pinned_drop]=0D
> +impl<T: FenceCb> PinnedDrop for FenceCbRegistration<T> {=0D
> +    fn drop(self: Pin<&mut Self>) {=0D
> +        // Always call dma_fence_remove_callback, even if `callback` has=
 already=0D
> +        // been taken by `dma_fence_callback`.  This is necessary for=0D
> +        // synchronization: `dma_fence_remove_callback` acquires `fence-=
>lock`,=0D
> +        // which ensures that any in-flight `dma_fence_signal` (which ca=
lls our=0D
> +        // callback while holding the same lock) has completed before we=
 free=0D
> +        // the struct.=0D
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
> +=0D
> +// SAFETY: Fences are literally designed to be shared between threads.=0D
> +unsafe impl Send for Fence {}=0D
> +// SAFETY: Fences are literally designed to be shared between threads.=0D
> +unsafe impl Sync for Fence {}=0D
> +=0D
> +impl Fence {=0D
> +    /// Check whether the fence was signalled at the moment of the funct=
ion call.=0D
> +    pub fn is_signaled(&self) -> bool {=0D
> +        // SAFETY: self is by definition still valid. The backend ensure=
s proper=0D
> +        // locking.=0D
> +        unsafe { bindings::dma_fence_is_signaled(self.as_raw()) }=0D
> +    }=0D
> +=0D
> +    fn as_raw(&self) -> *mut bindings::dma_fence {=0D
> +        self.inner.get()=0D
> +    }=0D
> +=0D
> +    /// Create a [`Fence`] from a raw C [`bindings::dma_fence`].=0D
> +    ///=0D
> +    /// # Safety=0D
> +    /// `ptr` must point to an initialized fence that is embedded into a=
 [`Fence`].=0D
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::dma_fence) -> &'a Sel=
f {=0D
> +        // SAFETY: Safe as per the function's overall safety requirement=
s.=0D
> +        unsafe { &*ptr.cast() }=0D
> +    }=0D
> +}=0D
> +=0D
> +// SAFETY: These implement the C backends refcounting methods which are =
proven to work correctly.=0D
> +unsafe impl AlwaysRefCounted for Fence {=0D
> +    fn inc_ref(&self) {=0D
> +        // SAFETY: `self.as_raw()` is a pointer to a valid `struct dma_f=
ence`.=0D
> +        unsafe { bindings::dma_fence_get(self.as_raw()) }=0D
> +    }=0D
> +=0D
> +    /// # Safety=0D
> +    ///=0D
> +    /// `ptr`must be a valid pointer to a [`DriverFence`].=0D
> +    unsafe fn dec_ref(ptr: NonNull<Self>) {=0D
> +        // SAFETY: `ptr` is never a NULL pointer; and when `dec_ref()` i=
s called=0D
> +        // the fence is by definition still valid.=0D
> +        let fence =3D unsafe { (*ptr.as_ptr()).inner.get() };=0D
> +=0D
> +        // SAFETY: Valid because `fence` was created validly above.=0D
> +        unsafe { bindings::dma_fence_put(fence) }=0D
> +    }=0D
> +}=0D
> +=0D
> +#[repr(C)] // Necessary to guarantee that `inner` always comes first so =
that we can cast.=0D
> +#[pin_data]=0D
> +struct DriverFenceData<F: Send + Sync, C: Send + Sync> {=0D
> +    #[pin]=0D
> +    inner: Fence,=0D
> +    // Pointer to access the FenceCtx. Useful for obtaining name paramet=
ers.=0D
> +    // The FenceCtx lives as long as at least all its fences, hence this=
 is safe.=0D
> +    fctx: Arc<FenceCtx<F, C>>,=0D
> +    #[pin]=0D
> +    data: F,=0D
> +}=0D
> +=0D
> +/// A synchronization primitive mainly for GPU drivers.=0D
> +///=0D
> +/// Fences are always reference counted. The typical use case is that on=
e side registers=0D
> +/// callbacks on the fence which will perform a certain action (such as =
queueing work) once the=0D
> +/// other side signals the fence.=0D
> +///=0D
> +/// # Examples=0D
> +///=0D
> +/// ```=0D
> +/// use kernel::dma_buf::{DriverFence, FenceCtx, FenceCb, FenceCbRegistr=
ation};=0D
> +/// use kernel::types::ARef;=0D
> +/// use kernel::str::CString;=0D
> +///=0D
> +/// struct CallbackData { }=0D
> +///=0D
> +/// impl FenceCb for CallbackData {=0D
> +///     fn called(&mut self) {=0D
> +///         pr_info!("DmaFence callback executed.\n");=0D
> +///     }=0D
> +/// }=0D
> +///=0D
> +/// let driver_name =3D CString::try_from_fmt(fmt!("dummy_driver"))?;=0D
> +/// let timeline_name =3D CString::try_from_fmt(fmt!("dummy_timeline"))?=
;=0D
> +///=0D
> +/// let fctx =3D FenceCtx::new(driver_name, timeline_name, ())?;=0D
> +///=0D
> +/// let fence_alloc =3D fctx.as_arc_borrow().new_fence_allocation(())?;=
=0D
> +/// let mut fence =3D fctx.new_fence(fence_alloc);=0D
> +///=0D
> +/// let cb_data =3D CallbackData { };=0D
> +/// let waiting_fence =3D ARef::from(fence.as_fence());=0D
> +/// let cb_reg =3D FenceCbRegistration::new(&waiting_fence, cb_data);=0D
> +/// let cb_reg =3D KBox::pin_init(cb_reg, GFP_KERNEL)?;=0D
> +///=0D
> +/// // TODO begin_signalling=0D
> +/// fence.signal(Ok(()));=0D
> +/// assert_eq!(waiting_fence.is_signaled(), true);=0D
> +///=0D
> +/// Ok::<(), Error>(())=0D
> +/// ```=0D
> +pub struct DriverFence<F: Send + Sync, C: Send + Sync> {=0D
> +    /// The actual content of the fence. Lives in a raw pointer so that =
its=0D
> +    /// memory can be managed independently. Valid until both the [`Driv=
erFence`]=0D
> +    /// and all associated [`Fence`]s have disappeared.=0D
> +    data: NonNull<DriverFenceData<F, C>>,=0D
> +}=0D
> +=0D
> +/// A pre-prepared DMA fence, carrying the user's data and the memory it=
 and the=0D
> +/// fence reside in. Only useful for creating a [`DriverFence`]. Splitti=
ng=0D
> +/// allocation and full initialization is necessary because fences canno=
t be=0D
> +/// allocated dynamically in some circumstances (deadlock).=0D
> +pub struct DriverFenceAllocation<F: Send + Sync, C: Send + Sync> {=0D
> +    /// The memory for the actual content of the fence.=0D
> +    /// Handed over to a [`DriverFence`], or deallocated once the=0D
> +    /// [`DriverFenceAllocation`] drops.=0D
> +    data: KBox<DriverFenceData<F, C>>,=0D
> +}=0D
> +=0D
> +impl<F: Send + Sync, C: Send + Sync> DriverFenceAllocation<F, C> {=0D
> +    /// Create a new allocation slot that can later be used to create a =
fully=0D
> +    /// initialized [`DriverFence`] without the need to allocate.=0D
> +    pub fn new(fctx: Arc<FenceCtx<F, C>>, data: F) -> Result<Self> {=0D
> +        let fence_data =3D DriverFenceData {=0D
> +            // `inner` remains uninitialized until a [`DriverFence`] tak=
es over.=0D
> +            inner: Fence { inner: Opaque::uninit() },=0D
> +            fctx,=0D
> +            data,=0D
> +        };=0D
> +=0D
> +        // In order to support the C dma_fence callbacks, it is necessar=
y for=0D
> +        // a [`Fence`] and a [`DriverFence`] to live in the same allocat=
ion,=0D
> +        // because the C backend passes a dma_fence, from which the driv=
er most=0D
> +        // likely wants to be able to access its `data` in [`DriverFence=
`].=0D
> +        //=0D
> +        // Hence, we need the manage the memory manually. It will be fre=
ed by the=0D
> +        // C backend automatically once the refcount within [`Fence`] dr=
ops to 0.=0D
> +        let data =3D KBox::new(fence_data, GFP_KERNEL | __GFP_ZERO)?;=0D
> +=0D
> +        Ok(Self { data })=0D
> +    }=0D
> +=0D
> +    fn as_raw(&self) -> *mut bindings::dma_fence {=0D
> +        self.data.inner.inner.get()=0D
> +    }=0D
> +}=0D
> +=0D
> +// SAFETY: Fences are literally designed to be shared between threads.=0D
> +unsafe impl<F: Send + Sync, C: Send + Sync> Send for DriverFence<F, C> {=
}=0D
> +=0D
> +/*=0D
> +impl<T> Deref for DriverFence<T> {=0D
> +    type Target =3D DriverFenceData<T>;=0D
> +=0D
> +    fn deref(&self) -> &Self::Target {=0D
> +        // SAFETY: The raw pointer is valid until the last reference to =
the=0D
> +        // inner [`Fence`] drops. So as long as there is a [`DriverFence=
`]=0D
> +        // the pointer is by definition still valid.=0D
> +        unsafe { &* self.data }=0D
> +    }=0D
> +}=0D
> +*/=0D
> +=0D
> +impl<F: Send + Sync, C: Send + Sync> DriverFence<F, C> {=0D
> +    fn as_raw(&self) -> *mut bindings::dma_fence {=0D
> +        // SAFETY: Valid because `self` is valid.=0D
> +        let fence_data =3D unsafe { &mut *self.data.as_ptr() };=0D
> +=0D
> +        fence_data.inner.inner.get()=0D
> +    }=0D
> +=0D
> +    /// Return the underlying [`Fence`].=0D
> +    pub fn as_fence(&self) -> &Fence {=0D
> +        unsafe { Fence::from_raw(self.as_raw()) }=0D
> +    }=0D
> +=0D
> +    /// Signal the fence. This will invoke all registered callbacks.=0D
> +    pub fn signal(self, res: Result) {=0D
> +        let fence =3D self.as_raw();=0D
> +        let mut fence_flags: usize =3D 0;=0D
> +        let flag_ptr =3D &raw mut fence_flags;=0D
> +=0D
> +        // SAFETY: Once a [`DriverFence`] is initialized, the inner `fen=
ce` is=0D
> +        // valid and initialized. It is valid until the refcount drops=0D
> +        // to 0, which can earliest happen once the [`DriverFence`] has =
been dropped.=0D
> +        unsafe {=0D
> +            bindings::dma_fence_lock_irqsave(fence, flag_ptr);=0D
> +            if !bindings::dma_fence_is_signaled_locked(fence) {=0D
> +                if let Err(err) =3D res {=0D
> +                    bindings::dma_fence_set_error(fence, err.to_errno())=
;=0D
> +                }=0D
> +                bindings::dma_fence_signal_locked(fence);=0D
> +            }=0D
> +            bindings::dma_fence_unlock_irqrestore(fence, flag_ptr);=0D
> +        }=0D
> +    }=0D
> +}=0D
> +=0D
> +impl<F: Send + Sync, C: Send + Sync> Drop for DriverFence<F, C> {=0D
> +    fn drop(&mut self) {=0D
> +        let fence =3D self.as_raw();=0D
> +        let mut fence_flags: usize =3D 0;=0D
> +        let flag_ptr =3D &raw mut fence_flags;=0D
> +=0D
> +        // SAFETY: Once a [`DriverFence`] is initialized, the inner `fen=
ce` is=0D
> +        // valid and initialized. It is valid until the refcount drops=0D
> +        // to 0, which can earliest happen once the [`DriverFence`] has =
been dropped.=0D
> +        unsafe {=0D
> +            bindings::dma_fence_lock_irqsave(fence, flag_ptr);=0D
> +            if !bindings::dma_fence_is_signaled_locked(fence) {=0D
> +                pr_warn!("Dropping unsignaled DriverFence!\n");=0D
> +                bindings::dma_fence_set_error(fence, ECANCELED as i32);=
=0D
> +                bindings::dma_fence_signal_locked(fence);=0D
> +            }=0D
> +            bindings::dma_fence_unlock_irqrestore(fence, flag_ptr);=0D
> +        }=0D
> +=0D
> +        // TODO: call_rcu() to ensure that fence callbacks are done with=
 using `data`=0D
> +=0D
> +        // SAFETY: `self.data` is owned by the DriverFence. The API user=
 can only=0D
> +        // access this data through Deref. Hence, the data can only drop=
 once and=0D
> +        // drops simultaneously with its accessor.=0D
> +        unsafe { drop_in_place(self.data.as_ptr()) };=0D
> +=0D
> +        // SAFETY: Once a [`DriverFence`] is initialized, the inner `fen=
ce` is=0D
> +        // valid and initialized. It is valid until the refcount drops=0D
> +        // to 0, which can earliest happen once the [`DriverFence`] has =
been dropped.=0D
> +        unsafe { bindings::dma_fence_put(fence); }=0D
> +=0D
> +        // The actual memory the data associated with a [`DriverFence`] =
lives in=0D
> +        // gets freed by the C dma_fence backend once the fence's refcou=
nt reaches 0.=0D
> +    }=0D
> +}=0D
> diff --git a/rust/kernel/dma_buf/mod.rs b/rust/kernel/dma_buf/mod.rs=0D
> new file mode 100644=0D
> index 000000000000..95d624c6f911=0D
> --- /dev/null=0D
> +++ b/rust/kernel/dma_buf/mod.rs=0D
> @@ -0,0 +1,7 @@=0D
> +// SPDX-License-Identifier: GPL-2.0 OR MIT=0D
> +=0D
> +//! DMA-buf subsystem abstractions.=0D
> +=0D
> +pub mod dma_fence;=0D
> +=0D
> +pub use self::dma_fence::{Fence, DriverFence, FenceCtx, FenceCbRegistrat=
ion, FenceCb};=0D
=0D
This also should be in the vertical format.=0D
=0D
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs=0D
> index d93292d47420..6f9f290c7919 100644=0D
> --- a/rust/kernel/lib.rs=0D
> +++ b/rust/kernel/lib.rs=0D
> @@ -92,6 +92,7 @@=0D
>  pub mod device_id;=0D
>  pub mod devres;=0D
>  pub mod dma;=0D
> +pub mod dma_buf;=0D
>  pub mod driver;=0D
>  #[cfg(CONFIG_DRM =3D "y")]=0D
>  pub mod drm;=0D
> -- =0D
> 2.49.0=0D
> =0D
=0D
Regards,=0D
Onur=0D

