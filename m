Return-Path: <linux-media+bounces-63135-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEM5HcP2Gmp4+AgAu9opvQ
	(envelope-from <linux-media+bounces-63135-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 16:40:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADC760D889
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 16:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7C47E30437FA
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 14:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593752E03E4;
	Sat, 30 May 2026 14:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQRAnw2H"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8859F1940B0;
	Sat, 30 May 2026 14:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780151813; cv=none; b=K7pExYC8AtCOnGJJrT9PdfkhD6jpmVvbXtsCbL3yoFb2nwvbG44gM6jmYi/2AqOVNmwgDQ2IUNy8IEdLCjigHuAwX7Yuidk4etMyr3Zoe1ZxlnnTxeXXbtv271zHG9U9IIjgINfVrswj/jo7Mpy/wLRUqfka+1154UrLdCNAXzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780151813; c=relaxed/simple;
	bh=fDY8f3wuXZdFOUbnMN9sKg1SD+kkBURaOd5YEtl1liU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AnMTRgZp1BjBUWm5TjU25EQcWA5Vm92728LejU3rTKW37ht+EWSqzsY13kN46zw5CvxwT6qg3Q1jiz8Okd/+YcvJ1wRXB2VJfSJsCbVeRp6NIG7OAQHEkTk9WQhSAxWC8/ZKl1Rv3n7XMJUBjrKOowb1hdj1Q+Ql9vCdlFVxj2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQRAnw2H; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A6A1F00893;
	Sat, 30 May 2026 14:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780151811;
	bh=qkuj8OhFHXyqgQPKbUxCfeYfitjkYWllEG/4ZUUkFOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WQRAnw2HQgIsqSKDXzcLZipXjK0V/obgzPs8erOmYqRkteeJMMIMVLevcaiekpCv3
	 JYcZiBX1bKv+H6/WBk/DAa1JzsM6cooRBBFIOukcAEdhLiSodttKIivVh6zObyN7h0
	 Di73YjxOmnxdTWuS6I2qhvk6BHNzD/O1HBtEyMWdDYmthznlLGCliIbJ8GQqpluycE
	 /tEBC7frXxcf3yNJ8krBoAzRRNdo689R0Df5D1ANvgBvodffkW0gvuTRg3b0EYkO0/
	 eVrTk5IAQiSviR/Y5RUu6i+3cNzz2NQZXI1QDo8/3jZkOdaP+SuM3GpkevlsPXoKUd
	 eGF4oNtXyvsHg==
From: Philipp Stanner <phasta@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
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
	Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	rcu@vger.kernel.org
Subject: [PATCH 3/4] rust: Add dma_fence abstractions
Date: Sat, 30 May 2026 16:35:11 +0200
Message-ID: <20260530143541.229628-5-phasta@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530143541.229628-2-phasta@kernel.org>
References: <20260530143541.229628-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63135-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[38];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,memory.data:url]
X-Rspamd-Queue-Id: 0ADC760D889
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

C's dma_fence's are synchronisation primitives that will be needed by all
Rust GPU drivers.

The dma_fence framework sets a number of rules, notably:
  - fences must only be signalled once
  - all fences must be signalled at some point
  - fence error codes must only be set before signalling
  - every pointer to a fence must be backed by a reference

All those rules are being addressed by these abstractions.

To cleanly decouple fence issuers and consumers, two types are provided:
  - DriverFence: the only fence type that can be signalled and that
    carries driver-specific data.
  - Fence: the fence type to be shared with other drivers and / or
    userspace. The only type callbacks can be registered on.
    Cannot be signalled.

Hereby, a Fence lives in the same chunk of memory as a DriverFence. Both
share the refcount of the underlying C dma_fence. Since this
implementation does not provide a custom dma_fence_backend_ops.release()
function, the memory is freed by the dma_fence backend once the refcount
drops to 0.

To create a DriverFence, the user must first allocate a
DriverFenceAllocation, so that the creation of the DriverFence later on
can always succeed. Otherwise, deadlocks could occur if fences need to
be created in a GPU job submission path.

Synchronization is ensured by the dma_fence backend.

All DriverFence's created through this abstraction must be signalled by
the creator with an error code. In case a DriverFence drops without
being signalled beforehand, it is signalled with -ECANCELLED as its
error and a warning is printed. This allows the Rust abstraction to very
cleanly decouple fence issuer and consumer by relying on the decoupling
mechanisms in the C backend, which ensures through RCU and the
'signalled' fence-flag that dma_fence_backend_ops functions cannot
access the potentially unloaded driver code anymore.

Signalling fences on drop thus grants many advantages. Not signalling
fences on drop would risk deadlock and does not grant real advantages:
By definition only the drivers can ensure that a fence always represents
the hardware's state correctly.

This implementation models a DmaFenceCtx (fence context) object on which
fences are to be created, thereby ensuring correct sequence numbering
according to the timeline.

dma_fence supports a variety of callbacks. The mandatory callbacks
(get_timeline_name() and get_driver_name()) are implemented in this
patch. For convenience, they store those name parameters in the fence
context, saving the driver from implementing these two callbacks.

Support for other callbacks (like for hardware signalling) is prepared
for through the fact that both DriverFence and Fence live in the same
allocation, allowing for usage of container_of from the callback to
access the driver-specific data.

Synchronization for backend_ops callbacks is ensured through RCU which
prevents UAF-bugs should a DriverFence drop while a Fence callback
is currently operating on the associated driver data.

Add abstractions for dma_fence in Rust.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/bindings/bindings_helper.h  |   1 +
 rust/helpers/dma_fence.c         |  48 ++
 rust/helpers/helpers.c           |   1 +
 rust/kernel/dma_buf/dma_fence.rs | 821 +++++++++++++++++++++++++++++++
 rust/kernel/dma_buf/mod.rs       |  13 +
 rust/kernel/lib.rs               |   1 +
 6 files changed, 885 insertions(+)
 create mode 100644 rust/helpers/dma_fence.c
 create mode 100644 rust/kernel/dma_buf/dma_fence.rs
 create mode 100644 rust/kernel/dma_buf/mod.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 2011645c7cfb..69daeb790f77 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -52,6 +52,7 @@
 #include <linux/debugfs.h>
 #include <linux/device/faux.h>
 #include <linux/dma-direction.h>
+#include <linux/dma-fence.h>
 #include <linux/dma-mapping.h>
 #include <linux/dma-resv.h>
 #include <linux/errname.h>
diff --git a/rust/helpers/dma_fence.c b/rust/helpers/dma_fence.c
new file mode 100644
index 000000000000..6244a5a61038
--- /dev/null
+++ b/rust/helpers/dma_fence.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/dma-fence.h>
+
+__rust_helper void rust_helper_dma_fence_get(struct dma_fence *f)
+{
+	dma_fence_get(f);
+}
+
+__rust_helper void rust_helper_dma_fence_put(struct dma_fence *f)
+{
+	dma_fence_put(f);
+}
+
+__rust_helper bool rust_helper_dma_fence_begin_signalling(void)
+{
+	return dma_fence_begin_signalling();
+}
+
+__rust_helper void rust_helper_dma_fence_end_signalling(bool cookie)
+{
+	dma_fence_end_signalling(cookie);
+}
+
+__rust_helper bool rust_helper_dma_fence_is_signaled(struct dma_fence *f)
+{
+	return dma_fence_is_signaled(f);
+}
+
+__rust_helper bool rust_helper_dma_fence_is_signaled_locked(struct dma_fence *f)
+{
+	return dma_fence_is_signaled_locked(f);
+}
+
+__rust_helper void rust_helper_dma_fence_lock_irqsave(struct dma_fence *f, unsigned long *flags)
+{
+	dma_fence_lock_irqsave(f, *flags);
+}
+
+__rust_helper void rust_helper_dma_fence_unlock_irqrestore(struct dma_fence *f, unsigned long *flags)
+{
+	dma_fence_unlock_irqrestore(f, *flags);
+}
+
+__rust_helper void rust_helper_dma_fence_set_error(struct dma_fence *f, int error)
+{
+	dma_fence_set_error(f, error);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 625921e27dfb..d9114d0b3c8f 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -57,6 +57,7 @@
 #include "cred.c"
 #include "device.c"
 #include "dma.c"
+#include "dma_fence.c"
 #include "dma-resv.c"
 #include "drm.c"
 #include "err.c"
diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_fence.rs
new file mode 100644
index 000000000000..7dc1f5c16b02
--- /dev/null
+++ b/rust/kernel/dma_buf/dma_fence.rs
@@ -0,0 +1,821 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (C) 2025, 2026 Red Hat Inc.:
+//   - Philipp Stanner <pstanner@redhat.com>
+
+//! DriverFence support.
+//!
+//! Reference: <https://docs.kernel.org/driver-api/dma-buf.html#c.dma_fence>
+//!
+//! C header: [`include/linux/dma-fence.h`](srctree/include/linux/dma-fence.h)
+
+use crate::{
+    alloc::AllocError,
+    bindings,
+    container_of,
+    error::to_result,
+    prelude::*,
+    sync::rcu::RcuBox,
+    types::ForeignOwnable,
+    types::Opaque,
+    warn_on, //
+};
+
+use pin_init::pin_init_from_closure;
+
+use core::{
+    marker::PhantomData, //
+    ops::Deref,
+    ptr,
+    ptr::{
+        drop_in_place,
+        NonNull, //
+    },
+    sync::atomic::{
+        AtomicU64,
+        Ordering, //
+    },
+};
+
+use bindings::ECANCELED;
+
+use kernel::str::CString;
+use kernel::sync::{
+    aref::{
+        ARef,
+        AlwaysRefCounted, //
+    },
+    Arc,
+    ArcBorrow, //
+};
+
+/// VTable for dma_fence backend_ops callbacks.
+//
+// Mandatory dma_fence backend_ops are implemented implicitly through
+// [`FenceCtx`]. Additional ones shall get implemented on this trait, which then
+// shall be demanded for the fence context data.
+pub trait FenceCtxOps {}
+
+/// A dma-fence context. A fence context takes care of associating related fences with each other,
+/// providing each with raising sequence numbers and a common identifier.
+#[pin_data(PinnedDrop)]
+pub struct FenceCtx<F: Send + Sync, C: Send + Sync> {
+    /// The fence context number.
+    nr: u64,
+    /// The sequence number for the next fence created.
+    seqno: AtomicU64,
+    // The name parameters live in RcuBox because they can be accessed by the
+    // dma_fence backend_ops. Those accesses are guarded by the rcu_read_lock(),
+    // so dropping them must be delayed by a grace period.
+    /// The name of the driver this FenceCtx's fences belong to.
+    driver_name: CString,
+    /// The name of the timeline this FenceCtx's fences belong to.
+    timeline_name: CString,
+    #[pin]
+    data: C,
+    fence_type: PhantomData<F>,
+}
+
+#[allow(unused_unsafe)]
+impl<F: Send + Sync + DriverFenceAllowedData, C: Send + Sync> FenceCtx<F, C> {
+    // This can later be extended as a vtable in case other parties need support
+    // for the more "exotic" callbacks.
+    const OPS: bindings::dma_fence_ops = bindings::dma_fence_ops {
+        get_driver_name: Some(Self::get_driver_name),
+        get_timeline_name: Some(Self::get_timeline_name),
+        enable_signaling: None,
+        signaled: None,
+        wait: None,
+        release: None,
+        set_deadline: None,
+    };
+
+    /// Create a new `FenceCtx`.
+    pub fn new(
+        driver_name: CString,
+        timeline_name: CString,
+        data: impl PinInit<C>,
+    ) -> Result<Arc<Self>> {
+        let ctx = pin_init!(Self {
+            // SAFETY: `dma_fence_context_alloc()` merely works on a global atomic. Parameter `1`
+            // is the number of contexts we want to allocate.
+            nr: unsafe { bindings::dma_fence_context_alloc(1) },
+            seqno: AtomicU64::new(0),
+            driver_name,
+            timeline_name,
+            data <- data,
+            fence_type: PhantomData,
+        });
+
+        Arc::pin_init(ctx, GFP_KERNEL)
+    }
+
+    fn get_next_fence_seqno(&self) -> u64 {
+        self.seqno.fetch_add(1, Ordering::Relaxed)
+    }
+
+    /// Allocate the memory for a [`DriverFence`] and already store `data` inside.
+    ///
+    /// This is needed because many times, creation of a [`DriverFence`] must not
+    /// fail, and allocating might deadlock in some situations.
+    ///
+    /// The `data` you pass here must not perform any operations that are illegal
+    /// in atomic context in its [`Drop`] implementation.
+    pub fn new_fence_allocation(
+        self: ArcBorrow<'_, Self>,
+        data: F,
+    ) -> Result<DriverFenceAllocation<F, C>> {
+        let fctx = Arc::<Self>::from(self);
+
+        DriverFenceAllocation::new(fctx, data)
+    }
+
+    /// Create a new fence, consuming `data`.
+    ///
+    /// The fence will increment the refcount of the fence context associated with this
+    /// [`FenceCtx`].
+    pub fn new_fence(&self, memory: DriverFenceAllocation<F, C>) -> DriverFence<F, C> {
+        let seqno: u64 = self.get_next_fence_seqno();
+
+        // We feed the C dma_fence backend a NULL for the spinlock so that it
+        // uses per-fence locks automatically.
+        let null_ptr: *mut bindings::spinlock = ptr::null_mut();
+        let fence_ptr = memory.as_raw();
+        // SAFETY: `fence_ptr` has been created directly above. It will live
+        // at least as long as `Self`. The same applies to `&Self::OPS`.
+        unsafe { bindings::dma_fence_init(fence_ptr, &Self::OPS, null_ptr, self.nr, seqno) };
+
+        // A `DriverFenceAllocation`'s purpose is to carry allocated memory, so that
+        // `DriverFence`s can always be created without allocating. In this
+        // method, ownership over that memory is transferred to the new
+        // `DriverFence` and managed through refcounting. The C dma_fence
+        // backend will ultimately free the memory once the refcount reaches 0.
+        let ptr = KBox::into_raw(memory.data);
+        // SAFETY: `ptr` was just created validly directly above.
+        let ptr = unsafe { NonNull::new_unchecked(ptr) };
+
+        DriverFence { data: ptr }
+    }
+
+    extern "C" fn get_driver_name(ptr: *mut bindings::dma_fence) -> *const c_char {
+        // SAFETY: The C backend only invokes this callback with `ptr` pointing
+        // to a valid, unsignaled `bindings::dma_fence`. All fences created
+        // in this module always reside within `Fence` which always resides in
+        // a `DriverFenceData`, thus satisfying the function's safety requirements.
+        let fctx = unsafe { Self::from_raw_fence(ptr) };
+
+        fctx.driver_name.as_char_ptr()
+    }
+
+    extern "C" fn get_timeline_name(ptr: *mut bindings::dma_fence) -> *const c_char {
+        // SAFETY: The C backend only invokes this callback with `ptr` pointing
+        // to a valid, unsignaled `bindings::dma_fence`. All fences created
+        // in this module always reside within `Fence` which always resides in
+        // a `DriverFenceData`, thus satisfying the function's safety requirements.
+        let fctx = unsafe { Self::from_raw_fence(ptr) };
+
+        fctx.timeline_name.as_char_ptr()
+    }
+
+    /// Create a [`FenceCtx`] from an associated [`bindings::dma_fence`].
+    ///
+    /// # Safety
+    ///
+    /// `ptr` must be a valid pointer to a dma_fence which resides within a [`Fence`],
+    /// which in turn resides in a [`DriverFenceData`].
+    unsafe fn from_raw_fence<'a>(ptr: *mut bindings::dma_fence) -> &'a Self {
+        let opaque_fence = Opaque::cast_from(ptr);
+
+        // SAFETY: Safe due to the function's overall safety requirements.
+        let fence_ptr = unsafe { container_of!(opaque_fence, Fence, inner) };
+
+        // DriverFenceData is repr(C) and a Fence is its first member.
+        let fence_data_ptr = fence_ptr as *mut DriverFenceData<F, C>;
+
+        // SAFETY: Safe because of the safety comment directly above.
+        let fence_data = unsafe { &*fence_data_ptr };
+
+        &fence_data.fctx
+    }
+}
+
+// FenceCtx's drop() ensures that the driver cannot unload while there are still
+// dma_fence callbacks running. This also prevents UAF problems with fctx.driver_name
+// and fctx.timeline_name.
+//
+// DriverFence data gets dropped through call_rcu() in DriverFence::drop.
+// This `rcu_barrier()` also serves to wait for their completion.
+#[pinned_drop]
+impl<F: Send + Sync, C: Send + Sync> PinnedDrop for FenceCtx<F, C> {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: `rcu_barrier()` is always safe to be called.
+        unsafe { bindings::rcu_barrier() };
+    }
+}
+
+/// Error type for fence callback registration.
+///
+/// Generic over `T` so that `AlreadySignaled` can return the callback to the
+/// caller, allowing it to reclaim any resources owned by the callback (e.g.,
+/// a fence handle that needs to be signaled).
+#[derive(Debug)]
+pub enum CallbackError<T = ()> {
+    /// The fence was already signaled. The callback is returned so the caller
+    /// can extract owned resources without losing them.
+    AlreadySignaled(T),
+    /// Some other error occurred during registration.
+    Other(Error),
+}
+
+impl<T> From<CallbackError<T>> for Error {
+    fn from(err: CallbackError<T>) -> Self {
+        match err {
+            CallbackError::AlreadySignaled(_) => ENOENT,
+            CallbackError::Other(e) => e,
+        }
+    }
+}
+
+impl<T> From<AllocError> for CallbackError<T> {
+    fn from(e: AllocError) -> Self {
+        CallbackError::Other(Error::from(e))
+    }
+}
+
+/// Trait for callbacks that can be registered on fences.
+///
+/// When the fence signals, the callback will be invoked.
+///
+/// # Example
+///
+/// ```rust
+/// use kernel::dma_buf::FenceCb;
+///
+/// struct MyCallback {
+///     // Your callback state here
+/// }
+///
+/// impl FenceCb for MyCallback {
+///     fn called(&mut self) {
+///         pr_info!("Fence signaled!");
+///         // Handle fence completion
+///     }
+/// }
+/// ```
+pub trait FenceCb: Send + 'static {
+    /// Called when the fence is signaled.
+    ///
+    /// This is called from the fence signaling path, which may be in interrupt
+    /// context or with locks held, which is why `self` is only borrowed, so that
+    /// it cannot drop. Implementations must not sleep or perform
+    /// long-running operations.
+    ///
+    /// An implementation likely wants to inform itself (e.g., through a work item)
+    /// within this callback that the associated [`FenceCbRegistration`] can now be
+    /// dropped.
+    fn called(&mut self);
+}
+
+/// A callback registration on a fence.
+///
+/// When this object is dropped, the callback is automatically removed if it
+/// hasn't been called yet.
+///
+/// # Invariants
+///
+/// If `callback` is `Some`, then `cb` is registered with the fence and the
+/// callback hasn't been invoked yet. If `None`, the callback has been invoked
+/// or the fence was already signaled when we tried to register.
+#[pin_data(PinnedDrop)]
+pub struct FenceCbRegistration<T: FenceCb + 'static> {
+    #[pin]
+    cb: Opaque<bindings::dma_fence_cb>,
+    callback: T,
+    fence: ARef<Fence>,
+}
+
+impl<T: FenceCb> FenceCbRegistration<T> {
+    /// Register a callback on a fence.
+    ///
+    /// On success the callback is pinned in place and will fire when the fence
+    /// signals. On `AlreadySignaled` the callback is returned to the caller so
+    /// that owned resources can be reclaimed.
+    pub fn new<'a>(fence: &'a Fence, callback: T) -> impl PinInit<Self, CallbackError<T>> + 'a
+    where
+        T: 'a,
+    {
+        // Uses `pin_init_from_closure` instead of `try_pin_init!` so that on
+        // `-ENOENT` (already signaled) the callback can be read back from the
+        // partially-initialized slot and returned through the error.
+        //
+        // SAFETY: `pin_init_from_closure` requires:
+        // - On `Ok(())`: the slot is fully initialized and valid for `Drop`.
+        // - On `Err(_)`: the slot is clean, i.e.: no partially-initialized fields
+        //   remain, and the slot can be deallocated without dropping.
+        //
+        // We uphold this as follows:
+        // - On success: all three fields are initialized. Ok(()) is returned.
+        // - On ENOENT (already signaled): `callback` and `fence` are read back
+        //   from the slot via `ptr::read`, leaving the slot clean. `cb` was
+        //   initialized by `dma_fence_add_callback` (it calls
+        //   `INIT_LIST_HEAD(&cb->node)` even on error), but `cb` is
+        //   `Opaque<dma_fence_cb>` which has no `Drop`, so not dropping it is
+        //   fine. The callback is returned through `AlreadySignaled(T)`.
+        // - On other errors: same cleanup as ENOENT, error returned as
+        //   `Other(e)`.
+        unsafe {
+            pin_init_from_closure(move |slot: *mut Self| {
+                let slot_callback = &raw mut (*slot).callback;
+                let slot_fence = &raw mut (*slot).fence;
+                let slot_cb = &raw mut (*slot).cb;
+
+                // Write callback and fence first — must be visible before
+                // dma_fence_add_callback makes the registration live.
+                core::ptr::write(slot_callback, callback);
+                core::ptr::write(slot_fence, ARef::from(fence));
+
+                let ret = to_result(bindings::dma_fence_add_callback(
+                    fence.inner.get(),
+                    Opaque::cast_into(slot_cb),
+                    Some(Self::dma_fence_callback),
+                ));
+
+                match ret {
+                    Ok(()) => Ok(()),
+                    Err(e) => {
+                        // Read back what we wrote to leave the slot clean.
+                        let cb_back = core::ptr::read(slot_callback);
+                        let _fence_back = core::ptr::read(slot_fence);
+
+                        if e.to_errno() == ENOENT.to_errno() {
+                            Err(CallbackError::AlreadySignaled(cb_back))
+                        } else {
+                            Err(CallbackError::Other(e))
+                        }
+                    }
+                }
+            })
+        }
+    }
+
+    /// Raw dma fence callback that is called by the C code.
+    ///
+    /// # Safety
+    ///
+    /// This is only called by the dma_fence subsystem with valid pointers.
+    unsafe extern "C" fn dma_fence_callback(
+        _fence: *mut bindings::dma_fence,
+        cb: *mut bindings::dma_fence_cb,
+    ) {
+        let ptr = Opaque::cast_from(cb).cast_mut();
+
+        // SAFETY: All `cb` we can receive here have been created in such a way
+        // that they are embedded into a `FenceCbRegistration`. The backend
+        // ensures synchronisation so whoever holds the registration object
+        // cannot drop it while this code is running. See `FenceCbRegistration::drop`.
+        unsafe {
+            let reg: *mut Self = container_of!(ptr, Self, cb);
+
+            (*reg).callback.called();
+        }
+    }
+
+    /// Returns a reference to the fence this callback is registered on.
+    pub fn fence(self: Pin<&Self>) -> &Fence {
+        &self.get_ref().fence
+    }
+}
+
+#[pinned_drop]
+impl<T: FenceCb> PinnedDrop for FenceCbRegistration<T> {
+    fn drop(self: Pin<&mut Self>) {
+        // Always call dma_fence_remove_callback, even if `callback` has already
+        // been taken by `dma_fence_callback`.  This is necessary for
+        // synchronization: `dma_fence_remove_callback` acquires `fence->lock`,
+        // which ensures that any in-flight `dma_fence_signal` (which calls our
+        // callback while holding the same lock) has completed before we free
+        // the struct.
+        //
+        // Without this, Drop can race with a concurrent signal:
+        //   CPU0 (signal, lock held): take() -> signaled(fence_ref) (in progress)
+        //   CPU1 (drop): sees is_some()==false -> skips lock -> frees struct
+        //   CPU0: accesses fence_ref -> use-after-free
+        //
+        // When the callback has already fired, the signal path detached the
+        // list node via INIT_LIST_HEAD, so dma_fence_remove_callback just sees
+        // an empty node and returns false — the lock acquisition is the only
+        // thing that matters.
+        //
+        // SAFETY: The fence pointer is valid and the cb was initialized by
+        // dma_fence_add_callback during construction.
+        unsafe {
+            bindings::dma_fence_remove_callback(self.fence.as_raw(), self.cb.get());
+        }
+    }
+}
+
+// SAFETY: FenceCbRegistration can be sent between threads
+unsafe impl<T: FenceCb> Send for FenceCbRegistration<T> {}
+
+// SAFETY: &FenceCbRegistration can be shared between threads if &T can.
+unsafe impl<T: FenceCb> Sync for FenceCbRegistration<T> where T: Sync {}
+
+/// The receiving counterpart of a [`DriverFence`], designed to register callbacks
+/// on, check the signalled state etc. A [`Fence`] cannot be signalled.
+/// A [`Fence`] is always refcounted.
+pub struct Fence {
+    /// The actual dma_fence passed to C.
+    inner: Opaque<bindings::dma_fence>,
+}
+
+// SAFETY: Fences are literally designed to be shared between threads.
+unsafe impl Send for Fence {}
+// SAFETY: Fences are literally designed to be shared between threads.
+unsafe impl Sync for Fence {}
+
+impl Fence {
+    /// Check whether the fence was signalled at the moment of the function call.
+    pub fn is_signaled(&self) -> bool {
+        // SAFETY: self is by definition still valid. The backend ensures proper
+        // locking.
+        unsafe { bindings::dma_fence_is_signaled(self.as_raw()) }
+    }
+
+    fn as_raw(&self) -> *mut bindings::dma_fence {
+        self.inner.get()
+    }
+
+    /// Create a [`Fence`] from a raw C [`bindings::dma_fence`].
+    ///
+    /// # Safety
+    ///
+    /// `ptr` must point to an initialized fence that is embedded into a [`Fence`].
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::dma_fence) -> &'a Self {
+        // SAFETY: Safe as per the function's overall safety requirements.
+        unsafe { &*ptr.cast() }
+    }
+}
+
+// SAFETY: These implement the C backends refcounting methods which are proven to work correctly.
+unsafe impl AlwaysRefCounted for Fence {
+    fn inc_ref(&self) {
+        // SAFETY: `self.as_raw()` is a pointer to a valid `struct dma_fence`.
+        unsafe { bindings::dma_fence_get(self.as_raw()) }
+    }
+
+    /// # Safety
+    ///
+    /// `ptr`must be a valid pointer to a [`DriverFence`].
+    unsafe fn dec_ref(ptr: NonNull<Self>) {
+        // SAFETY: `ptr` is never a NULL pointer; and when `dec_ref()` is called
+        // the fence is by definition still valid.
+        let fence = unsafe { (*ptr.as_ptr()).inner.get() };
+
+        // SAFETY: Valid because `fence` was created validly above.
+        unsafe { bindings::dma_fence_put(fence) }
+    }
+}
+
+#[repr(C)] // Necessary to guarantee that `inner` always comes first so that we can cast.
+#[pin_data]
+struct DriverFenceData<F: Send + Sync, C: Send + Sync> {
+    #[pin]
+    /// The inner fence.
+    inner: Fence,
+    /// Pointer to access the FenceCtx. Useful for obtaining name parameters.
+    // The FenceCtx lives as long as at least all its fences, hence this is safe.
+    fctx: Arc<FenceCtx<F, C>>,
+    /// The API user's data. As required by [`DriverFenceAllowedData`], this either
+    /// does not need drop, or must live in a [`rcu::RcuBox`]. It is essential
+    /// that the data only performs operations legal in atomic context in its
+    /// [`Drop`] implementation.
+    #[pin]
+    data: F,
+}
+
+/// A trait to enforce that all data in a [`DriverFence`] either does not need
+/// drop, or lives in a [`RcuBox`].
+pub trait DriverFenceAllowedData: private::Sealed {}
+
+mod private {
+    pub trait Sealed {}
+}
+
+impl<F: Copy> DriverFenceAllowedData for F {}
+impl<F: Send> DriverFenceAllowedData for RcuBox<F> {}
+
+impl<F: Copy> private::Sealed for F {}
+impl<F: Send> private::Sealed for RcuBox<F> {}
+
+/// A synchronization primitive mainly for GPU drivers.
+///
+/// Fences are always reference counted. The typical use case is that one side registers
+/// callbacks on the fence which will perform a certain action (such as queueing work) once the
+/// other side signals the fence.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::dma_buf::{DriverFence, FenceCtx, FenceCb, FenceCbRegistration};
+/// use kernel::str::CString;
+/// use kernel::sync::{
+///     aref::ARef,
+///     rcu::RcuBox, //
+/// };
+/// use core::ops::Deref;
+/// use core::fmt::Display;
+///
+/// struct CallbackData { }
+///
+/// impl FenceCb for CallbackData {
+///     fn called(&mut self) {
+///         pr_info!("DmaFence callback executed.\n");
+///     }
+/// }
+///
+/// let driver_name = CString::try_from_fmt(fmt!("dummy_driver"))?;
+/// let timeline_name = CString::try_from_fmt(fmt!("dummy_timeline"))?;
+///
+/// let fctx = FenceCtx::new(driver_name, timeline_name, ())?;
+///
+/// let fence_data = CString::try_from_fmt(fmt!("dummy_data"))?;
+/// // DriverFence::data must either not need drop, or live in an RcuBox.
+/// let fence_data = RcuBox::new(fence_data, GFP_KERNEL)?;
+///
+/// let fence_alloc = fctx.as_arc_borrow().new_fence_allocation(fence_data)?;
+/// let mut fence = fctx.new_fence(fence_alloc);
+///
+/// let cb_data = CallbackData { };
+/// let waiting_fence = ARef::from(fence.as_fence());
+/// let cb_reg = FenceCbRegistration::new(&waiting_fence, cb_data);
+/// let cb_reg = KBox::pin_init(cb_reg, GFP_KERNEL)?;
+///
+/// // DriverFence implements Deref.
+/// // FIXME: unit test claims that CString does not implement Display. Why?
+/// // pr_info!("Fence's inner data is: {}", fence.deref().deref());
+///
+/// // TODO begin_signalling
+/// fence.signal(Ok(()));
+/// assert_eq!(waiting_fence.is_signaled(), true);
+///
+/// Ok::<(), Error>(())
+/// ```
+pub struct DriverFence<F: Send + Sync, C: Send + Sync> {
+    /// The actual content of the fence. Lives in a raw pointer so that its
+    /// memory can be managed independently. Valid until both the [`DriverFence`]
+    /// and all associated [`Fence`]s have disappeared.
+    data: NonNull<DriverFenceData<F, C>>,
+}
+
+/// A pre-prepared DMA fence, carrying the user's data and the memory it and the
+/// fence reside in. Only useful for creating a [`DriverFence`]. Splitting
+/// allocation and full initialization is necessary because fences cannot be
+/// allocated dynamically in some circumstances (deadlock).
+pub struct DriverFenceAllocation<F: Send + Sync, C: Send + Sync> {
+    /// The memory for the actual content of the fence.
+    /// Handed over to a [`DriverFence`], or deallocated once the
+    /// [`DriverFenceAllocation`] drops.
+    data: KBox<DriverFenceData<F, C>>,
+}
+
+impl<F: Send + Sync + DriverFenceAllowedData, C: Send + Sync> DriverFenceAllocation<F, C> {
+    /// Create a new allocation slot that can later be used to create a fully
+    /// initialized [`DriverFence`] without the need to allocate.
+    pub fn new(fctx: Arc<FenceCtx<F, C>>, data: F) -> Result<Self> {
+        let fence_data = DriverFenceData {
+            // `inner` remains uninitialized until a [`DriverFence`] takes over.
+            inner: Fence {
+                inner: Opaque::uninit(),
+            },
+            fctx,
+            data,
+        };
+
+        // In order to support the C dma_fence callbacks, it is necessary for
+        // a `Fence` and a `DriverFence` to live in the same allocation,
+        // because the C backend passes a dma_fence, from which the driver most
+        // likely wants to be able to access its `data` in `DriverFence`.
+        //
+        // Hence, we need the manage the memory manually. It will be freed by the
+        // C backend automatically once the refcount within `Fence` drops to 0.
+        let data = KBox::new(fence_data, GFP_KERNEL | __GFP_ZERO)?;
+
+        Ok(Self { data })
+    }
+
+    fn as_raw(&self) -> *mut bindings::dma_fence {
+        self.data.inner.inner.get()
+    }
+}
+
+impl<F: Send + Sync, C: Send + Sync> DriverFence<F, C> {
+    fn as_raw(&self) -> *mut bindings::dma_fence {
+        // SAFETY: Valid because `self` is valid.
+        let fence_data = unsafe { &mut *self.data.as_ptr() };
+
+        fence_data.inner.inner.get()
+    }
+
+    /// Create a [`DriverFence`] from a raw pointer to a [`bindings::dma_fence`].
+    ///
+    /// # Safety
+    ///
+    /// `ptr` must be a valid pointer to a `dma_fence` that was obtained through
+    /// a [`DriverFence`] with matching generic data for both fence and associated
+    /// [`FenceCtx`].
+    unsafe fn from_raw(ptr: *mut bindings::dma_fence) -> Self {
+        let opaque_fence = Opaque::cast_from(ptr);
+
+        // SAFETY: Safe due to the function's overall safety requirements.
+        let fence_ptr = unsafe { container_of!(opaque_fence, Fence, inner) };
+
+        // DriverFenceData is repr(C) and a Fence is its first member.
+        let fence_data_ptr = fence_ptr as *mut DriverFenceData<F, C>;
+
+        // SAFETY: `fence_data_ptr` was created validly above.
+        let data = unsafe { NonNull::new_unchecked(fence_data_ptr) };
+
+        Self { data }
+    }
+
+    /// Return the underlying [`Fence`].
+    pub fn as_fence(&self) -> &Fence {
+        // SAFETY: `self` is by definition still valid, and it cannot drop until
+        // this new reference is gone.
+        unsafe { Fence::from_raw(self.as_raw()) }
+    }
+
+    /// Signal the fence. This will invoke all registered callbacks.
+    pub fn signal(self, res: Result) {
+        let fence = self.as_raw();
+        let mut fence_flags: usize = 0;
+        let flag_ptr = &raw mut fence_flags;
+
+        // SAFETY: Once a `DriverFence` is initialized, the inner `fence` is
+        // valid and initialized. It is valid until the refcount drops
+        // to 0, which can earliest happen once the `DriverFence` has been dropped.
+        unsafe {
+            bindings::dma_fence_lock_irqsave(fence, flag_ptr);
+            if !bindings::dma_fence_is_signaled_locked(fence) {
+                if let Err(err) = res {
+                    bindings::dma_fence_set_error(fence, err.to_errno());
+                }
+                bindings::dma_fence_signal_locked(fence);
+            }
+            bindings::dma_fence_unlock_irqrestore(fence, flag_ptr);
+        }
+    }
+}
+
+// SAFETY: Fences are literally designed to be shared between threads.
+unsafe impl<F: Send + Sync, C: Send + Sync> Send for DriverFence<F, C> {}
+
+impl<F: Send + Sync, C: Send + Sync> Deref for DriverFence<F, C> {
+    type Target = F;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: Thanks to refcounting, `data` is always valid as long as `self` is.
+        let data = unsafe { &*self.data.as_ptr() };
+
+        &data.data
+    }
+}
+
+/// A borrowed [`DriverFence`]. All you can do with it is access your user data
+/// and obtain a [`Fence`].
+pub struct DriverFenceBorrow<F: Send + Sync, C: Send + Sync> {
+    /// The actual content of the fence. Lives in a raw pointer so that its
+    /// memory can be managed independently. Valid until both the [`DriverFence`]
+    /// and all associated [`Fence`]s have disappeared.
+    data: NonNull<DriverFenceData<F, C>>,
+}
+
+impl<F: Send + Sync, C: Send + Sync> Deref for DriverFenceBorrow<F, C> {
+    type Target = F;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: Thanks to refcounting, `data` is always valid as long as `self` is.
+        let data = unsafe { &*self.data.as_ptr() };
+
+        &data.data
+    }
+}
+
+impl<F: Send + Sync, C: Send + Sync> DriverFenceBorrow<F, C> {
+    fn as_raw(&self) -> *mut bindings::dma_fence {
+        // SAFETY: Valid because `self` is valid.
+        let fence_data = unsafe { &mut *self.data.as_ptr() };
+
+        fence_data.inner.inner.get()
+    }
+
+    /// Return the underlying [`Fence`].
+    pub fn as_fence(&self) -> &Fence {
+        // SAFETY: `self` is by definition still valid, and it cannot drop until
+        // this new reference is gone.
+        unsafe { Fence::from_raw(self.as_raw()) }
+    }
+
+    /// Get a [`DriverFenceBorrow`] from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// `ptr` must point to a raw dma_fence within a [`Fence`] within a [`DriverFenceData`].
+    unsafe fn from_raw(ptr: *mut bindings::dma_fence) -> Self {
+        let opaque_fence = Opaque::cast_from(ptr);
+
+        // SAFETY: Safe due to the function's overall safety requirements.
+        let fence_ptr = unsafe { container_of!(opaque_fence, Fence, inner) };
+
+        // DriverFenceData is repr(C) and a Fence is its first member.
+        let fence_data_ptr = fence_ptr as *mut DriverFenceData<F, C>;
+
+        // SAFETY: `fence_data_ptr` was created validly above.
+        let data = unsafe { NonNull::new_unchecked(fence_data_ptr) };
+
+        Self { data }
+    }
+}
+
+// SAFETY: The Rust dma_fence abstractions are already designed around the inner
+// C `dma_fence`, which can serve safely as the identification point when being
+// owned by C. Moreover, safety is ensured by not dropping `DriverFence` and by
+// only allowing operations without side effects on the Borrowed type.
+unsafe impl<F: Send + Sync + 'static, C: Send + Sync + 'static> ForeignOwnable
+    for DriverFence<F, C>
+{
+    // `DriverFence` is merely a wrapper around a raw pointer. Thus, we can just
+    // use it directly.
+    type Borrowed<'a> = DriverFenceBorrow<F, C>;
+    type BorrowedMut<'a> = DriverFenceBorrow<F, C>;
+
+    const FOREIGN_ALIGN: usize = core::mem::align_of::<bindings::dma_fence>();
+
+    fn into_foreign(self) -> *mut c_void {
+        let fence = self;
+
+        let ptr = fence.as_raw();
+
+        // DriverFence must not drop.
+        core::mem::forget(fence);
+
+        ptr.cast()
+    }
+
+    unsafe fn from_foreign(ptr: *mut c_void) -> Self {
+        // SAFETY: Safe because the trait implementation only invokes this with
+        // a valid `ptr`, associated to a `DriverFence` with matching generic data.
+        unsafe { Self::from_raw(ptr.cast()) }
+    }
+
+    unsafe fn borrow<'a>(ptr: *mut c_void) -> Self::Borrowed<'a> {
+        // SAFETY: The trait implementation ensures that `ptr` always resides
+        // within a [`Fence`] within a [`DriverFenceData`].
+        unsafe { DriverFenceBorrow::from_raw(ptr.cast()) }
+    }
+
+    unsafe fn borrow_mut<'a>(ptr: *mut c_void) -> Self::BorrowedMut<'a> {
+        // SAFETY: The trait implementation ensures that `ptr` always resides
+        // within a [`Fence`] within a [`DriverFenceData`].
+        unsafe { DriverFenceBorrow::from_raw(ptr.cast()) }
+    }
+}
+
+impl<F: Send + Sync, C: Send + Sync> Drop for DriverFence<F, C> {
+    fn drop(&mut self) {
+        let fence = self.as_raw();
+        let mut fence_flags: usize = 0;
+        let flag_ptr = &raw mut fence_flags;
+
+        // SAFETY: Once a `DriverFence` is initialized, the inner `fence` is
+        // valid and initialized. It is valid until the refcount drops
+        // to 0, which can earliest happen once the `DriverFence` has been dropped.
+        unsafe {
+            bindings::dma_fence_lock_irqsave(fence, flag_ptr);
+            #[allow(unused_unsafe)]
+            if warn_on!(!bindings::dma_fence_is_signaled_locked(fence)) {
+                bindings::dma_fence_set_error(fence, ECANCELED as i32);
+                bindings::dma_fence_signal_locked(fence);
+            }
+            bindings::dma_fence_unlock_irqrestore(fence, flag_ptr);
+        }
+
+        // SAFETY: `self.data` is owned by the DriverFence, but could be accessed
+        // through some dma_fence callbacks right now. Access is being revoked
+        // above by signalling the fence. The DriverFenceAllowedData trait
+        // ensures that the data either does not need drop, or if it does it
+        // lives in a RcuBox which will delay dropping by one grace period, hence
+        // ensuring that all readers have disappeared.
+        unsafe { drop_in_place(self.data.as_ptr()) };
+
+        // SAFETY: Once a `DriverFence` is initialized, the inner `fence` is
+        // valid and initialized. It is valid until the refcount drops
+        // to 0, which can earliest happen once the `DriverFence` has been dropped.
+        unsafe {
+            bindings::dma_fence_put(fence);
+        }
+
+        // The actual memory the data associated with a `DriverFence` lives in
+        // gets freed by the C dma_fence backend once the fence's refcount reaches 0.
+    }
+}
diff --git a/rust/kernel/dma_buf/mod.rs b/rust/kernel/dma_buf/mod.rs
new file mode 100644
index 000000000000..d9da3dc57fce
--- /dev/null
+++ b/rust/kernel/dma_buf/mod.rs
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DMA-buf subsystem abstractions.
+
+pub mod dma_fence;
+
+pub use self::dma_fence::{
+    DriverFence,
+    Fence,
+    FenceCb,
+    FenceCbRegistration,
+    FenceCtx, //
+};
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index b72b2fbe046d..a05ccaa7598c 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -63,6 +63,7 @@
 pub mod device_id;
 pub mod devres;
 pub mod dma;
+pub mod dma_buf;
 pub mod driver;
 #[cfg(CONFIG_DRM = "y")]
 pub mod drm;
-- 
2.54.0


