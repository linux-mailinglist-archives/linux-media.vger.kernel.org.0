Return-Path: <linux-media+bounces-63911-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uAiLFg3RImoHeAEAu9opvQ
	(envelope-from <linux-media+bounces-63911-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:37:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6390D64890E
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:37:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RLIzQAOX;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63911-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63911-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A0846300E32F
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 13:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D033195FB;
	Fri,  5 Jun 2026 13:35:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEB92FF144;
	Fri,  5 Jun 2026 13:35:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780666555; cv=none; b=SFxueZVtycVjkJf3taC0n9fkdoeBFf16rXt6Pkx/ILFaR4QtBwzBgeeUXYhtvzICJDeaPMhNJ7N1RlK/B0HCidx07xMueaKDre6Q0zbU8zGB96Q4CW5bzUBMpz/b93A23qErRxX5xz2Bzgorkv0IC5aChVlrBkkT/9CR165D6NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780666555; c=relaxed/simple;
	bh=wlb6NkJIxz4wYIsUfd+v9sn7xOMMQEdTW7zEFBMBkQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Emdo0w19HVoYbnwDqbT4T7yLk3xNjYSHRTBGF/5f3CeC5ZRedg5qh3IZB7p99HUw8vv/0aym3pup4QhzljFsUTdgb5Z2qcK8jcJr2w0sOaPavfC3HLx5QgYt8PyLvNgAnZ1MhgQsGyeVS/txAAEWDlBMVWKQS7O+tKcgxPZY5FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RLIzQAOX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530D91F0089C;
	Fri,  5 Jun 2026 13:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780666551;
	bh=J7xoJI8ZQKXEZmPwD70InQg1kBZths2uP7Ky23DxVzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RLIzQAOXSv4hE7ojVXJugD+1SN+MumAULe7by1699ebbTRp7wPsmhGDLhwNMftGnh
	 LApa/yoXAg9mTheG0LCKlMV0uVBhWUJ1q9wWK2SsbM7L3qt6PUs83WYBlrhikTUnoI
	 JzsJ8fEMtLCKpXqBcaCQ4qGF2gyna2U1mBAT/Pa8TDuA33/C6v6/Ndj/bplsC2TlTP
	 8Nt816jhJh6xdl4W8Ecy/CS+Zc7AhKVOYoxlBy+eVNT7hie5WPDnchWNtHNiCGOGPB
	 aZWtrm/a0PD6sgmsJGgrDRbjMtw7cx+b8iautky6RvMLtJb+dw86emsUacr5A9KpCQ
	 0wAgHmLmL4pAg==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 99776F4006F;
	Fri,  5 Jun 2026 09:35:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 05 Jun 2026 09:35:49 -0400
X-ME-Sender: <xms:tdAiaqMMps2ngAzhNVhv6-mfNnSw0HdnSz0c6En6dAz-SnViC0Nbng>
    <xme:tdAialZU4aJrQiG_ly6ORom1xtzKhWsfY_1xOYe9LX15Pk91PGXFrLi4CKRYz6ipj
    9fJJxUosJZhl4-gKEL8YN1cFgd3PIaRkgtvb7H_0jcjLOeUASnbTQ>
X-ME-Received: <xmr:tdAiaoh33CkpEGCgUbg23_m2V2k_InJIg4reLwTYI260mYvzCz-WJFNlQn4>
X-ME-Proxy-Cause: dmFkZTEiXmK80I+r4b+5zY/r99GUAlO/A1JeBVvrzdPJND7AxnXROcGIdrV5+IW/GIICbk
    HTeSUzo2jG7T3ubuXDYawvMsJmw7SeRzXaVjmYhKpesaWDi/jHlBwDSw7cUJtOL4Zml+HR
    MdH91GjghnCvkbpZdNzjjo1bSZDmeAE+i20ut4ugSeq7SenIcQ9DZOfghRt4xUUc5uh5PM
    SgAN181ZxF1oco7PoJ9ho3wb1kPOXsEzQT5UZv0CFFx1JIqpGEiANmmsdwoALURinC3es0
    +e8I9nc2247wfagtNBtbgyVV8BvBRc03DGsTzzDlNTrxNmxxQ9+IH7k1Xg1Flh6mzaY9dd
    3j2HutalZEtkeyprDlRU9NKhJ58LI3mLCHfCFgQmnG8PQOAMLqGwkAsaebO44mK2vlmnuR
    MYFHdgugU/DvFz/CsV1BMgjxu2YWfHY6dIBjFGFfCo2b6Xjw2QrWJdS8Cbk5cZhEtbfaXp
    at5DrHXdm5HOWa4n7c5BxK7E+OBH3DkzTtugpB2k3UIWu4hVz5MxXmr3BagAdtITLDJQD/
    JSeHg9SfgIo764hoaOP43Tt18sx9L0beNvDwrs016gQNdq0dFaZs0o0pblPddusYiVOxGW
    AUTPP59waZPr0Ka3jmv3nLYXE/JZVbgYPX9x3z4UPuAgW/ns2QILb4zckoVQ
X-ME-Proxy: <xmx:tdAiahMx-MQlrgneUVGetN-OmpQD-AtYPtDnPjLfMyBEUj5uz-TWtw>
    <xmx:tdAiaitcK-XtPoFOg98hqikvF29OIRuH1LlQX2EiFHeXgqXJwnNpvg>
    <xmx:tdAiak3XaCAfJXcmzCfZDCF1Uzit4TpyUnGvQXwjeu1Cb0n_9bSpsQ>
    <xmx:tdAiapzO8BOKQ8qpdN8Ma0GmtFrCvyo1hlGZbEg-S1cXMQlKe-ED1Q>
    <xmx:tdAiag6jwjiJrPUq-nIa5en7kkXiDZa6Wyx0W3dMg1dU_B4Hxh8G8I0L>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jun 2026 09:35:48 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	rcu@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Andrew Ballance <andrewjballance@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,	Zqiang <qiang.zhang@linux.dev>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	maple-tree@lists.infradead.org,	linux-mm@kvack.org,
	linux-media@vger.kernel.org,	dri-devel@lists.freedesktop.org,
	Philipp Stanner <phasta@kernel.org>,	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH 1/3] rust: rcu: add RcuBox type
Date: Fri,  5 Jun 2026 06:35:37 -0700
Message-ID: <20260605133541.22569-2-boqun@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605133541.22569-1-boqun@kernel.org>
References: <20260605133541.22569-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63911-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,infradead.org,gmail.com,nvidia.com,joshtriplett.org,goodmis.org,efficios.com,linux.dev,linaro.org,amd.com,lists.infradead.org,kvack.org,vger.kernel.org,lists.freedesktop.org,redhat.com,collabora.com,onurozkan.dev];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[boqun@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:rcu@vger.kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:liam@infradead.org,m:andrewjballance@gmail.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:maple-tree@lists.infradead.org,m:linux-mm@kvack.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:phasta@kernel.org,m:lyude@redhat.com,m:daniel.almeida@collabora.com,m:work@onurozkan.dev,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boqun@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6390D64890E

From: Alice Ryhl <aliceryhl@google.com>

This adds an RcuBox container, which is like Box except that the value
is freed after waiting for one grace period (via {kvfree_,}call_rcu()).

To allow containers to rely on the RCU properties of RcuBox, an
extension of ForeignOwnable is added.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
[boqun: Make RcuBox generic over Allocator and add tests]
[boqun: Add type alias for Rcu*Box]
Co-developed-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/sync/rcu.rs         |  34 ++++-
 rust/kernel/sync/rcu/rcu_box.rs | 230 ++++++++++++++++++++++++++++++++
 3 files changed, 264 insertions(+), 1 deletion(-)
 create mode 100644 rust/kernel/sync/rcu/rcu_box.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 446dbeaf0866..2011645c7cfb 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -80,6 +80,7 @@
 #include <linux/property.h>
 #include <linux/pwm.h>
 #include <linux/random.h>
+#include <linux/rcupdate.h>
 #include <linux/refcount.h>
 #include <linux/regulator/consumer.h>
 #include <linux/sched.h>
diff --git a/rust/kernel/sync/rcu.rs b/rust/kernel/sync/rcu.rs
index a32bef6e490b..7da6b8d22277 100644
--- a/rust/kernel/sync/rcu.rs
+++ b/rust/kernel/sync/rcu.rs
@@ -4,7 +4,19 @@
 //!
 //! C header: [`include/linux/rcupdate.h`](srctree/include/linux/rcupdate.h)
 
-use crate::{bindings, types::NotThreadSafe};
+use crate::{
+    bindings,
+    types::{
+        ForeignOwnable,
+        NotThreadSafe, //
+    }, //
+};
+
+mod rcu_box;
+pub use self::rcu_box::RcuBox;
+pub use self::rcu_box::RcuKBox;
+pub use self::rcu_box::RcuKVBox;
+pub use self::rcu_box::RcuVBox;
 
 /// Evidence that the RCU read side lock is held on the current thread/CPU.
 ///
@@ -50,3 +62,23 @@ fn drop(&mut self) {
 pub fn read_lock() -> Guard {
     Guard::new()
 }
+
+/// Declares that a pointer type is rcu safe.
+pub trait ForeignOwnableRcu: ForeignOwnable {
+    /// Type used to immutably borrow an rcu-safe value that is currently foreign-owned.
+    type RcuBorrowed<'a>;
+
+    /// Borrows a foreign-owned object immutably for an rcu grace period.
+    ///
+    /// This method provides a way to access a foreign-owned rcu-safe value from Rust immutably.
+    ///
+    /// # Safety
+    ///
+    /// * The provided pointer must have been returned by a previous call to [`into_foreign`].
+    /// * If [`from_foreign`] is called, then `'a` must not end after the call to `from_foreign`
+    ///   plus one rcu grace period.
+    ///
+    /// [`into_foreign`]: ForeignOwnable::into_foreign
+    /// [`from_foreign`]: ForeignOwnable::from_foreign
+    unsafe fn rcu_borrow<'a>(ptr: *mut ffi::c_void) -> Self::RcuBorrowed<'a>;
+}
diff --git a/rust/kernel/sync/rcu/rcu_box.rs b/rust/kernel/sync/rcu/rcu_box.rs
new file mode 100644
index 000000000000..943fe3e8974e
--- /dev/null
+++ b/rust/kernel/sync/rcu/rcu_box.rs
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2026 Google LLC.
+
+//! Provides the `RcuBox` type for Rust allocations that live for a grace period.
+
+use core::{
+    marker::PhantomData,
+    ops::Deref,
+    ptr::NonNull, //
+};
+
+use crate::{
+    alloc::{
+        self,
+        allocator::{
+            KVmalloc,
+            Kmalloc,
+            Vmalloc, //
+        },
+        AllocError,
+        Allocator, //
+    },
+    bindings,
+    ffi::c_void,
+    prelude::*,
+    types::ForeignOwnable,
+};
+
+use super::{
+    ForeignOwnableRcu,
+    Guard, //
+};
+
+/// A box that is freed with rcu.
+///
+/// The value must be `Send`, as rcu may drop it on another thread.
+///
+/// # Invariants
+///
+/// * The pointer is valid and references a pinned `RcuBoxInner<T>` allocated with `A`.
+/// * This `RcuBox` holds exclusive permissions to rcu free the allocation.
+pub struct RcuBox<T: Send, A: Allocator>(NonNull<RcuBoxInner<T>>, PhantomData<A>);
+
+/// Type alias for [`RcuBox`] with a [`Kmalloc`] allocator.
+///
+/// # Examples
+///
+/// ```
+/// # use kernel::sync::rcu::{self, RcuKBox};
+/// let rb = RcuKBox::new(42, GFP_KERNEL)?;
+///
+/// assert_eq!(*rb, 42);
+/// assert_eq!(*rb.with_rcu(&rcu::read_lock()), 42);
+/// # Ok::<(), Error>(())
+/// ```
+pub type RcuKBox<T> = RcuBox<T, Kmalloc>;
+
+/// Type alias for [`RcuBox`] with a [`Vmalloc`] allocator.
+///
+/// # Examples
+///
+/// ```
+/// # use kernel::sync::rcu::{self, RcuVBox};
+/// let rb = RcuVBox::new(42, GFP_KERNEL)?;
+///
+/// assert_eq!(*rb, 42);
+/// assert_eq!(*rb.with_rcu(&rcu::read_lock()), 42);
+/// # Ok::<(), Error>(())
+/// ```
+pub type RcuVBox<T> = RcuBox<T, Vmalloc>;
+
+/// Type alias for [`RcuBox`] with a [`KVmalloc`] allocator.
+///
+/// # Examples
+///
+/// ```
+/// # use kernel::sync::rcu::{self, RcuKVBox};
+/// let rb = RcuKVBox::new(42, GFP_KERNEL)?;
+///
+/// assert_eq!(*rb, 42);
+/// assert_eq!(*rb.with_rcu(&rcu::read_lock()), 42);
+/// # Ok::<(), Error>(())
+/// ```
+pub type RcuKVBox<T> = RcuBox<T, KVmalloc>;
+
+struct RcuBoxInner<T> {
+    rcu_head: bindings::callback_head,
+    value: T,
+}
+
+// Note that `T: Sync` is required since when moving an `RcuBox<T, A>`, the previous owner may
+// still access `&T` for one grace period.
+//
+// SAFETY: Ownership of the `RcuBox<T, A>` allows for `&T` and dropping the `T`, so `T: Send +
+// Sync` implies `RcuBox<T, A>: Send`.
+unsafe impl<T: Send + Sync, A: Allocator> Send for RcuBox<T, A> {}
+
+// SAFETY: `&RcuBox<T, A>` allows for no operations other than those permitted by `&T`, so `T:
+// Sync` implies `RcuBox<T, A>: Sync`.
+unsafe impl<T: Send + Sync, A: Allocator> Sync for RcuBox<T, A> {}
+
+impl<T: Send, A: Allocator> RcuBox<T, A> {
+    /// Create a new `RcuBox`.
+    pub fn new(x: T, flags: alloc::Flags) -> Result<Self, AllocError> {
+        let b = Box::<_, A>::new(
+            RcuBoxInner {
+                value: x,
+                rcu_head: Default::default(),
+            },
+            flags,
+        )?;
+
+        // INVARIANT:
+        // * The pointer contains a valid `RcuBoxInner` allocated with `A`.
+        // * We just allocated it, so we own free permissions.
+        Ok(RcuBox(NonNull::from(Box::leak(b)), PhantomData))
+    }
+
+    /// Access the value for a grace period.
+    pub fn with_rcu<'rcu>(&self, _read_guard: &'rcu Guard) -> &'rcu T {
+        // SAFETY: The `RcuBox` has not been dropped yet, so the value is valid for at least one
+        // grace period.
+        unsafe { &(*self.0.as_ptr()).value }
+    }
+}
+
+impl<T: Send, A: Allocator> Deref for RcuBox<T, A> {
+    type Target = T;
+    fn deref(&self) -> &T {
+        // SAFETY: While the `RcuBox<T>` exists, the value remains valid.
+        unsafe { &(*self.0.as_ptr()).value }
+    }
+}
+
+// SAFETY:
+// * The `RcuBoxInner<T>` was allocated with `A`.
+// * `NonNull::as_ptr` returns a non-null pointer.
+unsafe impl<T: Send + 'static, A: Allocator> ForeignOwnable for RcuBox<T, A> {
+    const FOREIGN_ALIGN: usize = <Box<RcuBoxInner<T>, A> as ForeignOwnable>::FOREIGN_ALIGN;
+
+    type Borrowed<'a> = &'a T;
+    type BorrowedMut<'a> = &'a T;
+
+    fn into_foreign(self) -> *mut c_void {
+        self.0.as_ptr().cast()
+    }
+
+    unsafe fn from_foreign(ptr: *mut c_void) -> Self {
+        // INVARIANT: Pointer returned by `into_foreign, A` carries same invariants as `RcuBox<T>`.
+        // SAFETY: `into_foreign` never returns a null pointer.
+        Self(unsafe { NonNull::new_unchecked(ptr.cast()) }, PhantomData)
+    }
+
+    unsafe fn borrow<'a>(ptr: *mut c_void) -> &'a T {
+        // SAFETY: Caller ensures that `'a` is short enough.
+        unsafe { &(*ptr.cast::<RcuBoxInner<T>>()).value }
+    }
+
+    unsafe fn borrow_mut<'a>(ptr: *mut c_void) -> &'a T {
+        // SAFETY: `borrow_mut` has strictly stronger preconditions than `borrow`.
+        unsafe { Self::borrow(ptr) }
+    }
+}
+
+impl<T: Send + 'static, A: Allocator> ForeignOwnableRcu for RcuBox<T, A> {
+    type RcuBorrowed<'a> = &'a T;
+
+    unsafe fn rcu_borrow<'a>(ptr: *mut c_void) -> &'a T {
+        // SAFETY: `RcuBox::drop` can only run after `from_foreign` is called, and the value is
+        // valid until `RcuBox::drop` plus one grace period.
+        unsafe { &(*ptr.cast::<RcuBoxInner<T>>()).value }
+    }
+}
+
+impl<T: Send, A: Allocator> Drop for RcuBox<T, A> {
+    fn drop(&mut self) {
+        // SAFETY: The `rcu_head` field is in-bounds of a valid allocation.
+        let rcu_head = unsafe { &raw mut (*self.0.as_ptr()).rcu_head };
+        if core::mem::needs_drop::<T>() {
+            // SAFETY: `rcu_head` is the `rcu_head` field of `RcuBoxInner<T>`. All users will be
+            // gone in an rcu grace period. This is the destructor, so we may pass ownership of the
+            // allocation.
+            unsafe { bindings::call_rcu(rcu_head, Some(drop_rcu_box::<T, A>)) };
+        } else {
+            // SAFETY: All users will be gone in an rcu grace period.
+            // TODO: We are luckily since `kvfree_call_rcu()` works on both kmalloc and vmalloc,
+            // maybe a new `Allocator` method is needed.
+            unsafe { bindings::kvfree_call_rcu(rcu_head, self.0.as_ptr().cast()) };
+        }
+    }
+}
+
+/// Free this `RcuBoxInner<T>`.
+///
+/// # Safety
+///
+/// `head` references the `rcu_head` field of an `RcuBoxInner<T>` that has no references to it.
+/// Ownership of the `Box<RcuBoxInner<T>, A>` must be passed.
+unsafe extern "C" fn drop_rcu_box<T, A: Allocator>(head: *mut bindings::callback_head) {
+    // SAFETY: Caller provides a pointer to the `rcu_head` field of a `RcuBoxInner<T>`.
+    let box_inner = unsafe { crate::container_of!(head, RcuBoxInner<T>, rcu_head) };
+
+    // SAFETY: Caller ensures exclusive access and passed ownership.
+    drop(unsafe { Box::<_, A>::from_raw(box_inner) });
+}
+
+#[kunit_tests(rust_rcu_box)]
+mod tests {
+    use super::*;
+
+    #[test]
+    fn rcu_box_basic() -> Result {
+        let rb = RcuBox::<_, alloc::allocator::Kmalloc>::new(42i32, alloc::flags::GFP_KERNEL)?;
+
+        assert_eq!(*rb, 42);
+        assert_eq!(*rb.with_rcu(&Guard::new()), 42);
+
+        drop(rb);
+
+        let rb = RcuBox::<_, alloc::allocator::Vmalloc>::new(42i32, alloc::flags::GFP_KERNEL)?;
+
+        assert_eq!(*rb, 42);
+        assert_eq!(*rb.with_rcu(&Guard::new()), 42);
+
+        drop(rb);
+
+        Ok(())
+    }
+}
-- 
2.51.0


