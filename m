Return-Path: <linux-media+bounces-64974-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vEzVJJkJMWq7agUAu9opvQ
	(envelope-from <linux-media+bounces-64974-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 10:30:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CA068D2CF
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 10:30:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=A89FWadh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64974-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64974-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D87B3041686
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 08:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D7D413D6F;
	Tue, 16 Jun 2026 08:29:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34F340E8D7;
	Tue, 16 Jun 2026 08:29:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781598567; cv=none; b=hVogyByF8KV9yQOdZ+57aXrE6VuVElOJVoBgdtLF3g54oblfKwms9vMYEO7ni+XtHRtjlb5JBa0I8hOxO4Gvl5ShNjZ9WAbCzEHQbk+n5mKANq9jrb3+PyM0EoNUhAAbJcW/6zH2Jl8YarV3cdXbUmR25NHYU0fjPeLG7VLokE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781598567; c=relaxed/simple;
	bh=yXNDi6TGuEQiC00sRolstjqlqjgbPsZwC6FbMxQ852Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KxYgBwUYvLZQ1zQu+ailWKotqCJFlT5TYeIGE35sgczn8c4/gk30M48Ag6nDzjT/+8AzrKRHM4S1oGxIdJw9L9274oKGsLv46TxJUtuYaOqbyGoYgn3EwTlfC2/6b0EnHt21MnaLuWqEgQGqt0WtFHH5pAjcEhmTkM4v6NfI//o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A89FWadh; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B9F1F000E9;
	Tue, 16 Jun 2026 08:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781598564;
	bh=Xh7osufTMFNfItX2Gt2tP8pHceTipZuyuc4h7Hby/ck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A89FWadhs61vUKOCYqtlPEV3yXyu79JiqIRo4IXg7TqrOMPpiYGfUTs8p9+05goC1
	 5bwz3KT1wiVPVgw4dq/doLG9cUm3xrH0tEH492u8u98Hr0d8OQLCPskH2FSUjGUs+C
	 W0AVe6QL62HHpnjXdLGE0iGiBAkyWKcLeprYstiWdcercZi2nom3tAlZOAHpJMDTFx
	 XXmaTBLKQ0OXqCePNSJLwCn88nxF2EizoDGaonW8Vmbp8MblXCcJZAyboR/iP1mqFa
	 oxUTZAn+OWSH5vSCbGjOZp6sQaU644XgFKLamtnHji0jrWzisZCfhzwjsXh26R0NoE
	 4A3VRTpjAXxHA==
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
	rcu@vger.kernel.org
Subject: [PATCH v2 5/6] rust: Add dma_fence abstractions
Date: Tue, 16 Jun 2026 10:28:17 +0200
Message-ID: <20260616082819.2943886-7-phasta@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616082819.2943886-2-phasta@kernel.org>
References: <20260616082819.2943886-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:phasta@kernel.org,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:igor.korotin@linux.dev,m:ljs@kernel.org,m:acourbot@nvidia.com,m:fujita.tomonori@gmail.com,m:prafulrai522@gmail.com,m:shankari.ak0208@gmail.com,m:manos@pitsidianak.is,m:boris.brezillon@collabora.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:rcu@vger.kernel.org,m:fujitatomonori@gmail.com,m:shankariak0208@gmail.com,s:li
 sts@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[phasta@kernel.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64974-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,memory.data:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5CA068D2CF

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

Synchronization for backend_ops callbacks is ensured by only running the
Rust deconstructor delayed with call_rcu(), which prevents UAF-bugs
should a DriverFence drop while a Fence callback is currently operating
on the associated driver data.

Add abstractions for dma_fence in Rust.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/bindings/bindings_helper.h  |   1 +
 rust/helpers/dma_fence.c         |  48 ++
 rust/helpers/helpers.c           |   1 +
 rust/kernel/dma_buf/dma_fence.rs | 884 +++++++++++++++++++++++++++++++
 rust/kernel/dma_buf/mod.rs       |  14 +
 rust/kernel/lib.rs               |   1 +
 6 files changed, 949 insertions(+)
 create mode 100644 rust/helpers/dma_fence.c
 create mode 100644 rust/kernel/dma_buf/dma_fence.rs
 create mode 100644 rust/kernel/dma_buf/mod.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 446dbeaf0866..814d7740e686 100644
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
index 000000000000..0e08411098fa
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
+__rust_helper bool rust_helper_dma_fence_test_signaled_flag(struct dma_fence *f)
+{
+	return dma_fence_test_signaled_flag(f);
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
index 000000000000..3af2dee58e13
--- /dev/null
+++ b/rust/kernel/dma_buf/dma_fence.rs
@@ -0,0 +1,884 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (T) 2025, 2026 Red Hat Inc.:
+//   - Philipp Stanner <pstanner@redhat.com>
+
+//! DriverFence support.
+//!
+//! Reference: <https://docs.kernel.org/driver-api/dma-buf.html#c.dma_fence>
+//!
+//! T header: [`include/linux/dma-fence.h`](srctree/include/linux/dma-fence.h)
+
+use crate::{
+    alloc::AllocError,
+    bindings,
+    container_of,
+    error::to_result,
+    prelude::*,
+    types::ForeignOwnable,
+    types::Opaque,
+    warn_on, //
+};
+
+use pin_init::pin_init_from_closure;
+
+use core::{
+    mem::ManuallyDrop,
+    ops::Deref,
+    ptr,
+    ptr::{
+        drop_in_place,
+        NonNull, //
+    },
+    sync::atomic::{
+        AtomicU64,
+        Ordering, //
+    }, //
+};
+
+use kernel::{
+    str::CString,
+    sync::{
+        aref::{
+            ARef,
+            AlwaysRefCounted, //
+        },
+        Arc,
+        ArcBorrow, //
+    }, //
+};
+
+/// VTable for dma_fence backend_ops callbacks.
+//
+// Mandatory dma_fence backend_ops are implemented implicitly through
+// [`FenceCtx`]. Additional ones shall get implemented on this trait, which then
+// shall be demanded for the fence context data.
+pub trait FenceCtxOps {
+    /// The generic payload data for [`DriverFence`]s created on this fctx.
+    type FenceDataType: Send + Sync;
+}
+
+/// A dma-fence context. A fence context takes care of associating related fences with each other,
+/// providing each with raising sequence numbers and a common identifier.
+#[pin_data]
+pub struct FenceCtx<T: Send + Sync> {
+    /// The fence context number.
+    nr: u64,
+    /// The sequence number for the next fence created.
+    seqno: AtomicU64,
+    // The name parameters can be accessed by the dma_fence backend_ops. UAF
+    // errors are prevented by the `call_rcu()` in `drop_driver_fence_data()`.
+    /// The name of the driver this FenceCtx's fences belong to.
+    driver_name: CString,
+    /// The name of the timeline this FenceCtx's fences belong to.
+    timeline_name: CString,
+    #[pin]
+    data: T,
+}
+
+#[allow(unused_unsafe)]
+impl<T: Send + Sync + FenceCtxOps> FenceCtx<T> {
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
+        data: impl PinInit<T>,
+    ) -> Result<Arc<Self>> {
+        let ctx = pin_init!(Self {
+            // SAFETY: `dma_fence_context_alloc()` merely works on a global atomic. Parameter `1`
+            // is the number of contexts we want to allocate.
+            nr: unsafe { bindings::dma_fence_context_alloc(1) },
+            seqno: AtomicU64::new(0),
+            driver_name,
+            timeline_name,
+            data <- data,
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
+        data: T::FenceDataType,
+    ) -> Result<DriverFenceAllocation<T>> {
+        let fctx = Arc::<Self>::from(self);
+        let fence_data = DriverFenceData {
+            rcu_head: Default::default(),
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
+        Ok(DriverFenceAllocation { data })
+    }
+
+    /// Create a new fence, consuming `data`.
+    ///
+    /// The fence will increment the refcount of the fence context associated with this
+    /// [`FenceCtx`].
+    pub fn new_fence(&self, memory: DriverFenceAllocation<T>) -> DriverFence<T> {
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
+        let fence_data_ptr = fence_ptr as *mut DriverFenceData<T>;
+
+        // SAFETY: Safe because of the safety comment directly above.
+        let fence_data = unsafe { &*fence_data_ptr };
+
+        &fence_data.fctx
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
+    ///
+    /// Note that this can return `true` for a [`Fence`] whose [`DriverFence`]
+    /// has not yet been dropped. The reason is that the fence ops callbacks can
+    /// cause the fence to get signaled by the C backend.
+    pub fn is_signaled(&self) -> bool {
+        let fence = self.as_raw();
+        let mut fence_flags: usize = 0;
+        let flag_ptr = &raw mut fence_flags;
+
+        // We shouuld not use `dma_fence_is_signaled_locked()` here, because
+        // according to the C backend's recommendations, that function is problematic
+        // and we should avoid calling that function with a lock held.
+
+        // SAFETY: `self` is valid by definition. We take the spinlock above.
+        let ret = unsafe { bindings::dma_fence_is_signaled(fence) };
+
+        // To guarantee that an API caller can 100% rely on the signalling being
+        // completed (i.e., all fence callbacks ran), we have to take the lock.
+        //
+        // The reason is that the C dma_fence backend currently does not carefully
+        // synchronize the `dma_fence_is_signaled()` function with the proper
+        // spinlock. This can lead to the function returning `true` while fence
+        // callbacks are still being executed. This can be mitigated by guarding
+        // the entire function with the spinlock.
+        //
+        // See commit c8a5d5ea3ba6a.
+
+        // SAFETY: `fence` is valid because `self` is valid. `flag_ptr` is
+        // merely a pointer to an integer, which lives as long as this function.
+        unsafe { bindings::dma_fence_lock_irqsave(fence, flag_ptr) };
+        // SAFETY: `fence` is valid because `self` is valid. `flag_ptr` is
+        // merely a pointer to an integer, which lives as long as this function.
+        // The lock was taken above.
+        unsafe { bindings::dma_fence_unlock_irqrestore(fence, flag_ptr) };
+
+        ret
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
+        // SAFETY: `fence` was created validly above. When `dec_ref()` is called,
+        // there is by definition still a reference alive that can be put.
+        unsafe { bindings::dma_fence_put(fence) }
+    }
+}
+
+#[repr(C)] // Necessary to guarantee that `inner` always comes first so that we can cast.
+#[pin_data]
+struct DriverFenceData<T: Send + Sync + FenceCtxOps> {
+    /// Callback head for dropping this in a deferred manner through RCU.
+    rcu_head: bindings::callback_head,
+    #[pin]
+    /// The inner fence.
+    inner: Fence,
+    /// Pointer to access the FenceCtx. Useful for obtaining name parameters.
+    fctx: Arc<FenceCtx<T>>,
+    /// The API user's data. This must either not need drop, or must delay its
+    /// drop by a grace period. It is essential that the data only performs
+    /// operations legal in atomic context in its [`Drop`] implementation.
+    #[pin]
+    data: T::FenceDataType,
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
+/// use kernel::dma_buf::{
+///     DriverFence,
+///     FenceCtx,
+///     FenceCtxOps,
+///     FenceCb,
+///     FenceCbRegistration, //
+/// };
+/// use kernel::str::CString;
+/// use kernel::sync::aref::ARef;
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
+/// struct FenceCtxData {}
+///
+/// impl FenceCtxOps for FenceCtxData {
+///     type FenceDataType = FenceData;
+/// }
+///
+/// let fctx_data = FenceCtxData {};
+///
+/// let driver_name = CString::try_from_fmt(fmt!("dummy_driver"))?;
+/// let timeline_name = CString::try_from_fmt(fmt!("dummy_timeline"))?;
+///
+/// let fctx = FenceCtx::new(driver_name, timeline_name, fctx_data)?;
+///
+/// struct FenceData {
+///     data: CString,
+/// }
+///
+/// let fence_data = CString::try_from_fmt(fmt!("dummy_data"))?;
+/// let fence_data = FenceData { data: fence_data };
+///
+/// let fence_alloc = fctx.as_arc_borrow().new_fence_allocation(fence_data)?;
+/// let mut fence = fctx.new_fence(fence_alloc);
+///
+/// let cb_data = CallbackData { };
+/// let waiting_fence = ARef::from(fence.as_fence());
+/// let cb_reg = FenceCbRegistration::new(&waiting_fence, cb_data);
+/// let cb_reg = KBox::pin_init(cb_reg, GFP_KERNEL)?;
+///
+/// // TODO signalling guards
+/// fence.signal(Ok(()));
+/// assert_eq!(waiting_fence.is_signaled(), true);
+///
+/// Ok::<(), Error>(())
+/// ```
+pub struct DriverFence<T: Send + Sync + FenceCtxOps> {
+    /// The actual content of the fence. Lives in a raw pointer so that its
+    /// memory can be managed independently. Valid until both the [`DriverFence`]
+    /// and all associated [`Fence`]s have disappeared.
+    data: NonNull<DriverFenceData<T>>,
+}
+
+/// A pre-prepared DMA fence, carrying the user's data and the memory it and the
+/// fence reside in. Only useful for creating a [`DriverFence`]. Splitting
+/// allocation and full initialization is necessary because fences cannot be
+/// allocated dynamically in some circumstances (deadlock).
+pub struct DriverFenceAllocation<T: Send + Sync + FenceCtxOps> {
+    /// The memory for the actual content of the fence.
+    /// Handed over to a [`DriverFence`], or deallocated once the
+    /// [`DriverFenceAllocation`] drops.
+    data: KBox<DriverFenceData<T>>,
+}
+
+impl<T: Send + Sync + FenceCtxOps> DriverFenceAllocation<T> {
+    fn as_raw(&self) -> *mut bindings::dma_fence {
+        self.data.inner.inner.get()
+    }
+}
+
+impl<T: Send + Sync + FenceCtxOps> DriverFence<T> {
+    fn as_raw(&self) -> *mut bindings::dma_fence {
+        // SAFETY: Valid because `self` is valid.
+        let fence_data = unsafe { &*self.data.as_ptr() };
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
+        let fence_data_ptr = fence_ptr as *mut DriverFenceData<T>;
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
+        // SAFETY: `fence` is valid because `self` is valid. `flag_ptr` is
+        // merely a pointer to an integer, which lives as long as this function.
+        unsafe { bindings::dma_fence_lock_irqsave(fence, flag_ptr) };
+        // SAFETY: `fence` is valid because `self` is valid. The lock must be
+        // held, which we acquired directly above.
+        if !unsafe { bindings::dma_fence_test_signaled_flag(fence) } {
+            if let Err(err) = res {
+                // SAFETY: `fence` is valid because `self` is valid. The fence
+                // must not have been signaled yet, which we check directly above.
+                unsafe { bindings::dma_fence_set_error(fence, err.to_errno()) };
+            }
+            // SAFETY: `fence` is valid because `self` is valid. The lock must
+            // be held, which we acquired above.
+            unsafe { bindings::dma_fence_signal_locked(fence) };
+        }
+        // SAFETY: `fence` is valid because `self` is valid. `flag_ptr` is
+        // merely a pointer to an integer, which lives as long as this function.
+        // The lock must be held, which we acquired above.
+        unsafe { bindings::dma_fence_unlock_irqrestore(fence, flag_ptr) };
+    }
+}
+
+// SAFETY: Fences are literally designed to be shared between threads.
+unsafe impl<T: Send + Sync + FenceCtxOps> Send for DriverFence<T> {}
+
+impl<T: Send + Sync + FenceCtxOps> Deref for DriverFence<T> {
+    type Target = T::FenceDataType;
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
+pub struct DriverFenceBorrow<T: Send + Sync + FenceCtxOps> {
+    /// The actual content of the fence. Lives in a raw pointer so that its
+    /// memory can be managed independently. Valid until both the [`DriverFence`]
+    /// and all associated [`Fence`]s have disappeared.
+    data: NonNull<DriverFenceData<T>>,
+}
+
+impl<T: Send + Sync + FenceCtxOps> Deref for DriverFenceBorrow<T> {
+    type Target = T::FenceDataType;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: Thanks to refcounting, `data` is always valid as long as `self` is.
+        let data = unsafe { &*self.data.as_ptr() };
+
+        &data.data
+    }
+}
+
+impl<T: Send + Sync + FenceCtxOps> DriverFenceBorrow<T> {
+    fn as_raw(&self) -> *mut bindings::dma_fence {
+        // SAFETY: Valid because `self` is valid.
+        let fence_data = unsafe { &*self.data.as_ptr() };
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
+        let fence_data_ptr = fence_ptr as *mut DriverFenceData<T>;
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
+unsafe impl<T: Send + Sync + FenceCtxOps + 'static> ForeignOwnable for DriverFence<T> {
+    // `DriverFence` is merely a wrapper around a raw pointer. Thus, we can just
+    // use it directly.
+    type Borrowed<'a> = DriverFenceBorrow<T>;
+    type BorrowedMut<'a> = DriverFenceBorrow<T>;
+
+    const FOREIGN_ALIGN: usize = core::mem::align_of::<bindings::dma_fence>();
+
+    fn into_foreign(self) -> *mut c_void {
+        let fence = self;
+
+        let ptr = fence.as_raw();
+
+        // DriverFence must not drop.
+        let _ = ManuallyDrop::new(fence);
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
+impl<T: Send + Sync + FenceCtxOps> Drop for DriverFence<T> {
+    fn drop(&mut self) {
+        let fence = self.as_raw();
+        let mut fence_flags: usize = 0;
+        let flag_ptr = &raw mut fence_flags;
+
+        // SAFETY: `fence` is valid until the `call_rcu()` below. `flag_ptr` is
+        // merely a pointer to an integer, which lives as long as this function.
+        unsafe { bindings::dma_fence_lock_irqsave(fence, flag_ptr) };
+
+        // Use dma_fence_test_signaled_flag() instead of dma_fence_is_signaled_locked()
+        // because the C backend wants to get rid of the latter.
+
+        // SAFETY: `fence` is valid until the `call_rcu()` below.
+        let signaled: bool = unsafe { bindings::dma_fence_test_signaled_flag(fence) };
+        if warn_on!(!signaled) {
+            // SAFETY: `fence` is valid until the `call_rcu()` below. The fence
+            // must not have been signaled yet, which we check directly above.
+            unsafe { bindings::dma_fence_set_error(fence, ECANCELED.to_errno()) };
+            // SAFETY: `fence` is valid until the `call_rcu()` below. The lock must
+            // be held, which we acquired above.
+            unsafe { bindings::dma_fence_signal_locked(fence) };
+        }
+        // SAFETY: `fence` is valid until the `call_rcu()` below. `flag_ptr` is
+        // merely a pointer to an integer, which lives as long as this function.
+        // The lock must be held, which we acquired above.
+        unsafe { bindings::dma_fence_unlock_irqrestore(fence, flag_ptr) };
+
+        // SAFETY: Valid because `self` is valid.
+        let rcu_head_ptr = unsafe { &raw mut (*self.data.as_ptr()).rcu_head };
+
+        // `DriverFenceData` but could be accessed through some dma_fence callbacks
+        // right now. Access is being revoked in principle above by signalling
+        // the fence, but since the C backend does not guarantee perfect full
+        // synchronization, we have to wait for one grace period to ensure that
+        // all accessors of `DriverFenceData` (through the dma_fence_ops accessible
+        // through a `Fence`) are gone.
+
+        // SAFETY: `call_rcu()` is always safe to be called. `rcu_head_ptr` was created
+        // validly above. The module must perform a `synchronize_rcu()` or
+        // `rcu_barrier()` call to guard against module unload.
+        unsafe { bindings::call_rcu(rcu_head_ptr, Some(drop_driver_fence_data::<T>)) };
+    }
+}
+
+// TODO:
+// The entire call_rcu() mechanism in the drop above and the code below would be
+// unnecessary if C's dma_fence_signal() could be reworked in a way that after it
+// ran, the caller knows that no fence_ops callbacks can be running anymore.
+// In other words, if the dma_fence backend would use its spinlock for full
+// synchronization.
+//
+// Then we could move the drop_in_place() and dma_fence_put() upwards into the
+// drop() implementation and call it a day.
+
+/// Finally really drop this `DriverFence<T>`
+///
+/// # Safety
+///
+/// `head` references the `rcu_head` field of an `DriverFenceData<T>`. All
+/// accessors to that `DriverFenceData<T>` must be gone by now. This must be
+/// ensured by signalling the associated `DriverFence<T>` and then waiting
+/// for a grace period until calling this function here.
+unsafe extern "C" fn drop_driver_fence_data<T: Send + Sync + FenceCtxOps>(
+    head: *mut bindings::callback_head,
+) {
+    // SAFETY: Caller provides a pointer to the `rcu_head` field of a `DriverFenceData<C>`.
+    let fence_data = unsafe { container_of!(head, DriverFenceData<T>, rcu_head) };
+
+    // SAFETY: `fence_data` was created validly above. All the fence's data will
+    // only drop below, but the raw pointer to the raw C `dma_fence` remains
+    // valid because the reference count is only decremented at the end of the
+    // function.
+    let fence = unsafe { (*fence_data).inner.inner.get() };
+
+    // SAFETY: A grace period has passed. All accessors to that `DriverFenceData`
+    // are gone now. We have exclusive access and can now drop it.
+    unsafe { drop_in_place(fence_data) };
+
+    // The `drop_in_place()` above might drop the `FenceCtx` by putting the last
+    // reference.
+
+    // SAFETY: Once a `DriverFence` is initialized, the inner `fence` is
+    // valid and initialized. It is valid until the refcount drops
+    // to 0, which can earliest happen once we drop the `DriverFence`'s reference
+    // here.
+    unsafe { bindings::dma_fence_put(fence) };
+
+    // The actual memory the data associated with a `DriverFence` lives in
+    // gets freed by the C dma_fence backend once the fence's refcount reaches 0.
+}
diff --git a/rust/kernel/dma_buf/mod.rs b/rust/kernel/dma_buf/mod.rs
new file mode 100644
index 000000000000..fb353ce042ce
--- /dev/null
+++ b/rust/kernel/dma_buf/mod.rs
@@ -0,0 +1,14 @@
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
+    FenceCtx,
+    FenceCtxOps, //
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


