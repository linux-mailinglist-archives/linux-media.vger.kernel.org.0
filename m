Return-Path: <linux-media+bounces-61720-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGlLJFwfB2rnrgIAu9opvQ
	(envelope-from <linux-media+bounces-61720-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 15:27:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A5C55071D
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 15:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3912F301682E
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 13:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CBF349B16;
	Fri, 15 May 2026 13:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gitn2cfk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6D334D3B0;
	Fri, 15 May 2026 13:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778851194; cv=none; b=clfj9JgrHJQI6jd0tPGUevtZUlwdyxuXdRUb9n2WmlNJ1bNKu1TklaJDk1l0KZykL4gW//CzwGm2c5+WECV09T/5MsYDviZAi24M35VjQYdFv/kdGOLh1eCGHbD2ndxKQlh8mvklQ0HvHJwUl0rjtXELzIv3J1YGSh/bStaYDi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778851194; c=relaxed/simple;
	bh=NAL0j2Nk4NXnczA7nRtyy8MrE4SQUlmNxVPJQIMWuRU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lpdlPsCjQNxXYzb0F4lURjgwogLC332tXIG073K2NIeyzbO40xkUieJlPjxb8eMLA5WaYD+/T25WTbGOrYicAuMrw/EarQ2ipDNkwdTE5wecscHy6iwbYX+77BdcAK+ol88M3O+P7P5IrMeQwXi+zPX+SvDpG8NgiRTVx50YO+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gitn2cfk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0086CC2BCB0;
	Fri, 15 May 2026 13:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778851193;
	bh=NAL0j2Nk4NXnczA7nRtyy8MrE4SQUlmNxVPJQIMWuRU=;
	h=From:To:Cc:Subject:Date:From;
	b=Gitn2cfkICEG03ETmxN6uikStXGlbfhAO20mjyB/gi7ZBUQDCtDhrh5RMS7Mkbhy+
	 nt4Y1cjCIZdLBrFLHV8L4vqHU5HF3SbAY3VJrOCfCpEGWESZEavoHKRj1kHEgJMoDs
	 i8/t7G7YUDreOZJfWjDsAkCqkOUt+B5qwbXxqHmi9/QqeBa6WZ6/dYJk4Xg9UmlVsZ
	 ZKMFCEZsKjgD2XeLj7iIprUpKdpMH3Bs8GSRXyapCROL3b4mz40hBj/cXya47xf4jr
	 lxNZX8T2H1gmDNRqgbpYMNxe2la3uDjuY0WwPwA/V5lDMST3zVxoqmTW1c+olElGNo
	 EePUpJ3SdVOyQ==
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
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Matthew Maurer <mmaurer@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Philipp Stanner <phasta@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3] rust: dma_buf: Add dma_fence abstractions
Date: Fri, 15 May 2026 15:18:33 +0200
Message-ID: <20260515131836.273509-3-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 08A5C55071D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61720-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,collabora.com,linuxfoundation.org,gmail.com,asahilina.net,nvidia.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[self.data:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,memory.data:url]
X-Rspamd-Action: no action

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

Synchronization for backend_ops callbacks will be ensured through RCU
(TODO) which will prevent UAF-bugs should a DriverFence drop while a
Fence callback is currently operating on the associated driver data.

Add abstractions for dma_fence in Rust.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Hi guys,

(I try to make the naming more consistent and count this as v3, v1 being
the WIP RFC and v2 the previous RFC [1])

Changes in v3:
  - Omit JobQueue patches for now
  - Completely redesign the memory layout: Instead of a Fence
    refcounting a DriverFence, both now live in the same allocation to
    allow for future support the dma_fence backend_ops callbacks which
    need to do container_of. (mostly Boris's feedback)
  - Allow for pre-allocating fences to avoid deadlocks when submitting
    jobs to a GPU. (Boris)
  - Simultaneously, allow for pre-preparing fence callback objects, so
    the driver can allocate them when it sees fit. (code largely stolen
    and inspired by Daniel).
  - Signal fences on drop, ensure synchronization.
  - Force users to set an error code when signalling.
  - Write more documentation
  - A ton of minor other changes.

So, this is the spiritual successor of the first / second RFC [1]. v2
also contained code for drm::JobQueue, but mostly to show how the fence
code would be used. JobQueue is under heavy rework right now, so I don't
want to bother your eyes with it. The docstring examples should show how
Rust fences are supposed to be used, though.

This v3 contains a huge amount of highly valuable feedback from a
variety of people, notably Boris, but also from Alice, Gary and Danilo.

There are some TODOs open (a better trait for fence backend_ops and RCU
support), but my hope is that this effort is now finally approaching its
end.

I would greatly appreciate feedback and especially more information
about what might be missing to make this usable, which is obviously
where Daniel's and Boris's feedback will be valuable once more.

Please regard this patch just as what it's titled: an RFC, to discuss a
bit more and to inform a broader community about what the current state
is and where this is heading at.

Many regards,
Philipp

[1] https://lore.kernel.org/rust-for-linux/20260203081403.68733-2-phasta@kernel.org/

---
 rust/bindings/bindings_helper.h  |   1 +
 rust/helpers/dma_fence.c         |  48 +++
 rust/helpers/helpers.c           |   1 +
 rust/kernel/dma_buf/dma_fence.rs | 626 +++++++++++++++++++++++++++++++
 rust/kernel/dma_buf/mod.rs       |   7 +
 rust/kernel/lib.rs               |   1 +
 6 files changed, 684 insertions(+)
 create mode 100644 rust/helpers/dma_fence.c
 create mode 100644 rust/kernel/dma_buf/dma_fence.rs
 create mode 100644 rust/kernel/dma_buf/mod.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 083cc44aa952..69a5f50e7159 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -51,6 +51,7 @@
 #include <linux/device/faux.h>
 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma-fence.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
 #include <linux/fdtable.h>
diff --git a/rust/helpers/dma_fence.c b/rust/helpers/dma_fence.c
new file mode 100644
index 000000000000..d046515465fe
--- /dev/null
+++ b/rust/helpers/dma_fence.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/dma-fence.h>
+
+void rust_helper_dma_fence_get(struct dma_fence *f)
+{
+	dma_fence_get(f);
+}
+
+void rust_helper_dma_fence_put(struct dma_fence *f)
+{
+	dma_fence_put(f);
+}
+
+bool rust_helper_dma_fence_begin_signalling(void)
+{
+	return dma_fence_begin_signalling();
+}
+
+void rust_helper_dma_fence_end_signalling(bool cookie)
+{
+	dma_fence_end_signalling(cookie);
+}
+
+bool rust_helper_dma_fence_is_signaled(struct dma_fence *f)
+{
+	return dma_fence_is_signaled(f);
+}
+
+bool rust_helper_dma_fence_is_signaled_locked(struct dma_fence *f)
+{
+	return dma_fence_is_signaled_locked(f);
+}
+
+void rust_helper_dma_fence_lock_irqsave(struct dma_fence *f, unsigned long *flags)
+{
+	dma_fence_lock_irqsave(f, *flags);
+}
+
+void rust_helper_dma_fence_unlock_irqrestore(struct dma_fence *f, unsigned long *flags)
+{
+	dma_fence_unlock_irqrestore(f, *flags);
+}
+
+void rust_helper_dma_fence_set_error(struct dma_fence *f, int error)
+{
+	dma_fence_set_error(f, error);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index a3c42e51f00a..d1cd0c13ad07 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -28,6 +28,7 @@
 #include "cred.c"
 #include "device.c"
 #include "dma.c"
+#include "dma_fence.c"
 #include "drm.c"
 #include "err.c"
 #include "irq.c"
diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_fence.rs
new file mode 100644
index 000000000000..374ff4833678
--- /dev/null
+++ b/rust/kernel/dma_buf/dma_fence.rs
@@ -0,0 +1,626 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (C) 2025, 2026 Red Hat Inc.:
+//   - Philipp Stanner <pstanner@redhat.com>
+
+//! dma_fence abstractions for Rust.
+//!
+//! Reference: <https://docs.kernel.org/driver-api/dma-buf.html#c.dma_fence>
+//!
+//! C header: [`include/linux/dma-fence.h`](srctree/include/linux/dma-fence.h)
+
+use crate::{
+    bindings,
+    prelude::*,
+    types::ForeignOwnable,
+    types::{ARef, AlwaysRefCounted, Opaque},
+    alloc::AllocError,
+    error::to_result,
+};
+
+use pin_init::pin_init_from_closure;
+
+use core::{
+    ptr,
+    ptr::{drop_in_place, NonNull},
+    sync::atomic::{AtomicU64, Ordering},
+    ops::Deref,
+    marker::PhantomData,
+};
+
+use bindings::ECANCELED;
+
+use kernel::sync::{Arc, ArcBorrow};
+use kernel::str::CString;
+
+
+/// A dma-fence context. A fence context takes care of associating related fences with each other,
+/// providing each with raising sequence numbers and a common identifier.
+#[pin_data(PinnedDrop)]
+pub struct FenceCtx<F: Send + Sync, C: Send + Sync> {
+    /// The fence context number.
+    nr: u64,
+    /// The sequence number for the next fence created.
+    seqno: AtomicU64,
+    /// The name of the driver this FenceCtx's fences belong to.
+    driver_name: CString,
+    /// The name of the timeline this FenceCtx's fences belong to.
+    timeline_name: CString,
+    #[pin]
+    data: C,
+    fence_type: PhantomData<F>,
+}
+
+impl<F: Send + Sync, C: Send + Sync> FenceCtx<F, C> {
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
+    pub fn new(driver_name: CString, timeline_name: CString, data: impl PinInit<C>) -> Result<Arc<Self>> {
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
+        // SAFETY: `fence_data` has been created directly above. It will live
+        // at least as long as `Self`. The same applies to `&Self::OPS`.
+        unsafe { bindings::dma_fence_init(fence_ptr, &Self::OPS, null_ptr, self.nr, seqno) };
+
+        // A [`DriverFenceAllocation`]'s purpose is to carry allocated memory, so that
+        // [`DriverFence`]s can always be created without allocating. In this
+        // method, ownership over that memory is transferred to the new
+        // [`DriverFence`] and managed through refcounting. The C dma_fence
+        // backend will ultimately free the memory once the refcount reaches 0.
+        let ptr = KBox::into_raw(memory.data);
+        // SAFETY: `ptr` was just created validly directly above.
+        let ptr = unsafe { NonNull::new_unchecked(ptr) };
+        let driver_fence = DriverFence { data: ptr };
+
+        driver_fence
+    }
+
+    extern "C" fn get_driver_name(ptr: *mut bindings::dma_fence) -> *const c_char {
+        // SAFETY: The C backend only invokes this callback with `ptr` pointing
+        // to a valid, unsignaled [`bindings::dma_fence`]. All fences created
+        // in this module always reside within [`Fence`] which always resides in
+        // a [`DriverFenceData`], thus satisfying the function's safety requirements.
+        let fctx = unsafe { Self::from_raw_fence(ptr) };
+
+        fctx.driver_name.as_char_ptr()
+    }
+
+    extern "C" fn get_timeline_name(ptr: *mut bindings::dma_fence) -> *const c_char {
+        // SAFETY: The C backend only invokes this callback with `ptr` pointing
+        // to a valid, unsignaled [`bindings::dma_fence`]. All fences created
+        // in this module always reside within [`Fence`] which always resides in
+        // a [`DriverFenceData`], thus satisfying the function's safety requirements.
+        let fctx = unsafe { Self::from_raw_fence(ptr) };
+
+        fctx.timeline_name.as_char_ptr()
+    }
+
+    // Create a [`FenceCtx`] from an associated [`bindings::dma_fence`].
+    //
+    // # Safety
+    // `ptr` must be a valid pointer to a dma_fence which resides within a [`Fence`],
+    // which in turn resides in a [`DriverFenceData`].
+    unsafe fn from_raw_fence<'a>(ptr: *mut bindings::dma_fence) -> &'a Self {
+        let opaque_fence = Opaque::cast_from(ptr);
+
+        // SAFETY: Safe due to the function's overall safety requirements.
+        let fence_ptr = unsafe { crate::container_of!(opaque_fence, Fence, inner) };
+
+        // SAFETY: Safe because of the safety comment directly above.
+        let fence_data_ptr = unsafe { crate::container_of!(fence_ptr, DriverFenceData<F, C>, inner) };
+
+        // SAFETY: Safe because of the safety comment directly above.
+        let fence_data = unsafe { & *fence_data_ptr };
+
+        let fctx = & *fence_data.fctx;
+
+        fctx
+    }
+}
+
+#[pinned_drop]
+impl<F: Send + Sync, C: Send + Sync> PinnedDrop for FenceCtx<F, C> {
+    fn drop(self: Pin<&mut Self>) {
+        // TODO: rcu_barrier() once the call_rcu() in DriverFence::drop() is in place
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
+/// use kernel::dma_buf::{Fence, FenceCb, FenceCbRegistration};
+/// use kernel::types::ARef;
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
+    pub fn new<'a>(
+        fence: &'a Fence,
+        callback: T,
+    ) -> impl PinInit<Self, CallbackError<T>> + 'a
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
+        // SAFETY: All `cb` we can receive here have been created in such a way
+        // that they are embedded into a [`FenceCbRegistration`]. The backend
+        // ensures synchronisation so whoever holds the registration object
+        // cannot drop it while this code is running. See [`FenceCbRegistration::drop`].
+        unsafe {
+            let ptr = Opaque::cast_from(cb).cast_mut();
+            let reg: *mut Self = crate::container_of!(ptr, Self, cb);
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
+    inner: Fence,
+    // Pointer to access the FenceCtx. Useful for obtaining name parameters.
+    // The FenceCtx lives as long as at least all its fences, hence this is safe.
+    fctx: Arc<FenceCtx<F, C>>,
+    #[pin]
+    data: F,
+}
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
+/// use kernel::types::ARef;
+/// use kernel::str::CString;
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
+/// let fence_alloc = fctx.as_arc_borrow().new_fence_allocation(())?;
+/// let mut fence = fctx.new_fence(fence_alloc);
+///
+/// let cb_data = CallbackData { };
+/// let waiting_fence = ARef::from(fence.as_fence());
+/// let cb_reg = FenceCbRegistration::new(&waiting_fence, cb_data);
+/// let cb_reg = KBox::pin_init(cb_reg, GFP_KERNEL)?;
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
+impl<F: Send + Sync, C: Send + Sync> DriverFenceAllocation<F, C> {
+    /// Create a new allocation slot that can later be used to create a fully
+    /// initialized [`DriverFence`] without the need to allocate.
+    pub fn new(fctx: Arc<FenceCtx<F, C>>, data: F) -> Result<Self> {
+        let fence_data = DriverFenceData {
+            // `inner` remains uninitialized until a [`DriverFence`] takes over.
+            inner: Fence { inner: Opaque::uninit() },
+            fctx,
+            data,
+        };
+
+        // In order to support the C dma_fence callbacks, it is necessary for
+        // a [`Fence`] and a [`DriverFence`] to live in the same allocation,
+        // because the C backend passes a dma_fence, from which the driver most
+        // likely wants to be able to access its `data` in [`DriverFence`].
+        //
+        // Hence, we need the manage the memory manually. It will be freed by the
+        // C backend automatically once the refcount within [`Fence`] drops to 0.
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
+// SAFETY: Fences are literally designed to be shared between threads.
+unsafe impl<F: Send + Sync, C: Send + Sync> Send for DriverFence<F, C> {}
+
+/*
+impl<T> Deref for DriverFence<T> {
+    type Target = DriverFenceData<T>;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: The raw pointer is valid until the last reference to the
+        // inner [`Fence`] drops. So as long as there is a [`DriverFence`]
+        // the pointer is by definition still valid.
+        unsafe { &* self.data }
+    }
+}
+*/
+
+impl<F: Send + Sync, C: Send + Sync> DriverFence<F, C> {
+    fn as_raw(&self) -> *mut bindings::dma_fence {
+        // SAFETY: Valid because `self` is valid.
+        let fence_data = unsafe { &mut *self.data.as_ptr() };
+
+        fence_data.inner.inner.get()
+    }
+
+    /// Return the underlying [`Fence`].
+    pub fn as_fence(&self) -> &Fence {
+        unsafe { Fence::from_raw(self.as_raw()) }
+    }
+
+    /// Signal the fence. This will invoke all registered callbacks.
+    pub fn signal(self, res: Result) {
+        let fence = self.as_raw();
+        let mut fence_flags: usize = 0;
+        let flag_ptr = &raw mut fence_flags;
+
+        // SAFETY: Once a [`DriverFence`] is initialized, the inner `fence` is
+        // valid and initialized. It is valid until the refcount drops
+        // to 0, which can earliest happen once the [`DriverFence`] has been dropped.
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
+impl<F: Send + Sync, C: Send + Sync> Drop for DriverFence<F, C> {
+    fn drop(&mut self) {
+        let fence = self.as_raw();
+        let mut fence_flags: usize = 0;
+        let flag_ptr = &raw mut fence_flags;
+
+        // SAFETY: Once a [`DriverFence`] is initialized, the inner `fence` is
+        // valid and initialized. It is valid until the refcount drops
+        // to 0, which can earliest happen once the [`DriverFence`] has been dropped.
+        unsafe {
+            bindings::dma_fence_lock_irqsave(fence, flag_ptr);
+            if !bindings::dma_fence_is_signaled_locked(fence) {
+                pr_warn!("Dropping unsignaled DriverFence!\n");
+                bindings::dma_fence_set_error(fence, ECANCELED as i32);
+                bindings::dma_fence_signal_locked(fence);
+            }
+            bindings::dma_fence_unlock_irqrestore(fence, flag_ptr);
+        }
+
+        // TODO: call_rcu() to ensure that fence callbacks are done with using `data`
+
+        // SAFETY: `self.data` is owned by the DriverFence. The API user can only
+        // access this data through Deref. Hence, the data can only drop once and
+        // drops simultaneously with its accessor.
+        unsafe { drop_in_place(self.data.as_ptr()) };
+
+        // SAFETY: Once a [`DriverFence`] is initialized, the inner `fence` is
+        // valid and initialized. It is valid until the refcount drops
+        // to 0, which can earliest happen once the [`DriverFence`] has been dropped.
+        unsafe { bindings::dma_fence_put(fence); }
+
+        // The actual memory the data associated with a [`DriverFence`] lives in
+        // gets freed by the C dma_fence backend once the fence's refcount reaches 0.
+    }
+}
diff --git a/rust/kernel/dma_buf/mod.rs b/rust/kernel/dma_buf/mod.rs
new file mode 100644
index 000000000000..95d624c6f911
--- /dev/null
+++ b/rust/kernel/dma_buf/mod.rs
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DMA-buf subsystem abstractions.
+
+pub mod dma_fence;
+
+pub use self::dma_fence::{Fence, DriverFence, FenceCtx, FenceCbRegistration, FenceCb};
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index d93292d47420..6f9f290c7919 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -92,6 +92,7 @@
 pub mod device_id;
 pub mod devres;
 pub mod dma;
+pub mod dma_buf;
 pub mod driver;
 #[cfg(CONFIG_DRM = "y")]
 pub mod drm;
-- 
2.49.0


