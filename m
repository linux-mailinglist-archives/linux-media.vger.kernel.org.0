Return-Path: <linux-media+bounces-63140-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLZCF8T9GmpX+QgAu9opvQ
	(envelope-from <linux-media+bounces-63140-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 17:09:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB5B60DAC0
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 17:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2ACF0302F380
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2026 15:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319A3317153;
	Sat, 30 May 2026 15:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NtS4TnJU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713493002AB
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 15:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780153735; cv=none; b=Sj/1XDyrjISijxaZzBWyzt2DVLZfN8IZbhdVDzxXOwkWKpJ+UFIcJ/0oydc0c8AHj3vhcL9SRMESvjAIUN9asbb6+k+WPSVyftEb71/i1i7CYaCYqO5cXdF5qs7BuKsqYeFW9GuXRADlaugzWxzWyEboQO8Nk+DxcmeWeIYqFRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780153735; c=relaxed/simple;
	bh=1mD29jKnTTDGyoUZqUXAm1pDS2l4d8VkGHiUcew3hcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uoqNW86McNmjBv1nNPgl7V1LUrEs8rtj4w85X3dvZWHuRKtwCjDONbUFEuES9xp2+lkfI00JrUj8yI9nE67ee5h1QqT9uarERuI+2RLH9dH3B+1aAfrnm7MmQbjWBV7kW4znbPlqg6NKKN1W2fG9AoMS5REpsRzXojFPHIxobeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NtS4TnJU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 848441F00893;
	Sat, 30 May 2026 15:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780153734;
	bh=Iw0FhbtvjuV1urcZGjkx/qt7+8pTDgXeuj/fbCEH8Z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NtS4TnJUEx6ZBROs3IAYPPCv502M1JnfN+ZrT1IVXgXQBIT1MebRwxZ7OG+kK9q3l
	 whB86kXoIGtoH56GI+7fMrLY6PpiUbm3qBJ/6Fu6qdCXGE6fq5mSmehxcPUCozo1lp
	 HX68MFFGke0ealMF4PiFG/3dYrPqhcymN8rD6CX2iO2IHqUwQMrjIYsfhzhy25CYq2
	 UmjxB1YKYrptHEfUXhxRGxSZFaJjbTgXIA1tA2moG1Ah0KoB2wefl+m1mOZ19p1fM6
	 tRjj4J+1UL6AJ9GSYrKilHZY+7C6WGjlsahqoF/Ia4LKCqkk7MjZJlsHdn4cicz+jx
	 mMv8j6twHzsvQ==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9E94EF40084;
	Sat, 30 May 2026 11:08:52 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sat, 30 May 2026 11:08:52 -0400
X-ME-Sender: <xms:hP0aarPnZ7pO4nV8lbLWTk3kGQb64n7UaQk2gvHB6b4Y8BoICFQvMg>
    <xme:hP0aaiuj0Snqh-vSrhA6u5S0ex0twv7DHuTTMmEOnUzTWXAdtsxHjXiuiv6-17fqb
    oWgYzlZ4WY3PZ1ufErk7bZVH42e8LPM_nW19Na8g-alhIeF6HERCA>
X-ME-Received: <xmr:hP0aap3loKQEj0kGc-01-PYXV6TRGxzwj7Iyzh0YyBJDw84mGyXTXV2UFyy16jrWUVEqxtPBOBngEUnv2j-X0Aj32AvnqT9T>
X-ME-Proxy-Cause: dmFkZTGQOkMpaaZDC0BephxAIuGa+jUd9e2JeV56FDIbuJEAWrj+VoXDzFdKUU1lXoKRsW
    eA93QvoUnLxh6FA5WO25QYu1EOQlA3G3Zi6hzUOFeKjtFdHUG2UbiVP5zvd5SbILAs5gnm
    9tAHe3/r5AVsTwU1g3J/RqUIL1wuE2GPUnVUXYf0jdwNh3Ndnb1cRmGWTnjwk3JYi1huuy
    fRaUt7vQS3ZvhWWMg4bQm372n0OcODf7UBrL3xqg8ateiBTPkCe8aTtchAFZKoHLaS5n1a
    DJ+bPhozh7nEqV0LXPj0f0wDx8XxYux8+3KzRoPNUZQclpSIe966E7Vt5Mq+wkwaaF5CQO
    iVX5Tc6DtyBDaCoELDj/LFgplQomGJ4soFWpGvTkdhdpS87/OG/KCLHTKnPE5CVBu1EG/S
    CqWxyZh04AcncdY5ojIoZc6vD6rW+0yFUpsySbge+xtl3gNr69hgM4G1Y98wagmA4ugxkx
    22O4D/yNZ9QnxweYMY03dtgmhgMOYJeYyu6z71hbyK888RHhEtknh7iejtvD5FfqPvjbua
    Yiu4KtUWy4BpGZB5E2iOJ11TvGp624vG7dGx7a0+NatE/I7KUIi/fN7hc+bJCp2ArZofJb
    wf+6GSB0QxOoHsdtLs3F6N1LjAGcJPsSdwvmYcxbH0ruTBjpUqtaRn8+aC2A
X-ME-Proxy: <xmx:hP0aaoUs7UzN6maBl3NTD0UNHNFNzPaJclYo3I7zVaE4kYadV66WaA>
    <xmx:hP0aanvVAb8_M9iHndCV1hXvfLnogF-KT1oqqN_hgbeOsxFCS8Kn7Q>
    <xmx:hP0aaryr0cW5k6xeXI-1d5oIQzCxU3MzOEWxf5tPyT23NqFLLmcZxQ>
    <xmx:hP0aamn1cuq7ShwlzqJv7jRGGA08folHN9bONN45s16r2dQKh1nL4w>
    <xmx:hP0aapZ9cnRQ1GXiwc75dcux2jnLGaUjRG-nrintqMzf42SJTTVX7BTl>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 30 May 2026 11:08:51 -0400 (EDT)
Date: Sat, 30 May 2026 08:08:50 -0700
From: Boqun Feng <boqun@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,	Zqiang <qiang.zhang@linux.dev>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Igor Korotin <igor.korotin@linux.dev>,	Lorenzo Stoakes <ljs@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	Shankari Anand <shankari.ak0208@gmail.com>, manos@pitsidianak.is,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, rcu@vger.kernel.org
Subject: Re: [PATCH 2/4] rust: rcu: add RcuBox type
Message-ID: <ahr9gtzQLSbPeBx_@tardis.local>
References: <20260530143541.229628-2-phasta@kernel.org>
 <20260530143541.229628-4-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530143541.229628-4-phasta@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63140-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org,lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boqun@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BCB5B60DAC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 30, 2026 at 04:35:10PM +0200, Philipp Stanner wrote:
> From: Alice Ryhl <aliceryhl@google.com>
> 
> This adds an RcuBox container, which is like KBox except that the value
> is freed with kfree_rcu.
> 
> To allow containers to rely on the rcu properties of RcuBox, an
> extension of ForeignOwnable is added.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

I have the following on top of Alice's patch. @Alice, @Danilo, thoughts?

Then we can have:

type RcuKBox<T> = RcuBox<T, Kmalloc>;
type RcuVBox<T> = RcuBox<T, Vmalloc>;

and Philipp can use the `RcuKBox` in this patchset. We also need to impl
InPlaceInit for RcuBox, but that can be added later.

Regards,
Boqun

------------->8
Subject: [PATCH] rust: rcu: Make RcuBox generic over Allocator

To support RCU-protected vmalloc allocation, we need to make `RcuBox`
generic over `Allocator`. Currently this works since all `Allocator`s
are either kmalloc() or vmalloc(), and kvfree_call_rcu() works with both
allocations.

While we are at it, add some basic test cases.

Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 rust/kernel/sync/rcu/rcu_box.rs | 96 +++++++++++++++++++++++----------
 1 file changed, 67 insertions(+), 29 deletions(-)

diff --git a/rust/kernel/sync/rcu/rcu_box.rs b/rust/kernel/sync/rcu/rcu_box.rs
index 2508fdb609ec..5c344d82c0d9 100644
--- a/rust/kernel/sync/rcu/rcu_box.rs
+++ b/rust/kernel/sync/rcu/rcu_box.rs
@@ -4,47 +4,59 @@
 
 //! Provides the `RcuBox` type for Rust allocations that live for a grace period.
 
-use core::{ops::Deref, ptr::NonNull};
+use core::{
+    marker::PhantomData,
+    ops::Deref,
+    ptr::NonNull, //
+};
 
 use kernel::{
-    alloc::{self, AllocError},
+    alloc::{
+        self,
+        AllocError,
+        Allocator, //
+    },
     bindings,
     ffi::c_void,
     prelude::*,
-    sync::rcu::{ForeignOwnableRcu, Guard},
     types::ForeignOwnable,
 };
 
+use super::{
+    ForeignOwnableRcu,
+    Guard, //
+};
+
 /// A box that is freed with rcu.
 ///
 /// The value must be `Send`, as rcu may drop it on another thread.
 ///
 /// # Invariants
 ///
-/// * The pointer is valid and references a pinned `RcuBoxInner<T>` allocated with `kmalloc`.
+/// * The pointer is valid and references a pinned `RcuBoxInner<T>` allocated with `A`.
 /// * This `RcuBox` holds exclusive permissions to rcu free the allocation.
-pub struct RcuBox<T: Send>(NonNull<RcuBoxInner<T>>);
+pub struct RcuBox<T: Send, A: Allocator>(NonNull<RcuBoxInner<T>>, PhantomData<A>);
 
 struct RcuBoxInner<T> {
     value: T,
     rcu_head: bindings::callback_head,
 }
 
-// Note that `T: Sync` is required since when moving an `RcuBox<T>`, the previous owner may still
-// access `&T` for one grace period.
+// Note that `T: Sync` is required since when moving an `RcuBox<T, A>`, the previous owner may
+// still access `&T` for one grace period.
 //
-// SAFETY: Ownership of the `RcuBox<T>` allows for `&T` and dropping the `T`, so `T: Send + Sync`
-// implies `RcuBox<T>: Send`.
-unsafe impl<T: Send + Sync> Send for RcuBox<T> {}
+// SAFETY: Ownership of the `RcuBox<T, A>` allows for `&T` and dropping the `T`, so `T: Send +
+// Sync` implies `RcuBox<T, A>: Send`.
+unsafe impl<T: Send + Sync, A: Allocator> Send for RcuBox<T, A> {}
 
-// SAFETY: `&RcuBox<T>` allows for no operations other than those permitted by `&T`, so `T: Sync`
-// implies `RcuBox<T>: Sync`.
-unsafe impl<T: Send + Sync> Sync for RcuBox<T> {}
+// SAFETY: `&RcuBox<T, A>` allows for no operations other than those permitted by `&T`, so `T:
+// Sync` implies `RcuBox<T, A>: Sync`.
+unsafe impl<T: Send + Sync, A: Allocator> Sync for RcuBox<T, A> {}
 
-impl<T: Send> RcuBox<T> {
+impl<T: Send, A: Allocator> RcuBox<T, A> {
     /// Create a new `RcuBox`.
     pub fn new(x: T, flags: alloc::Flags) -> Result<Self, AllocError> {
-        let b = KBox::new(
+        let b = Box::<_, A>::new(
             RcuBoxInner {
                 value: x,
                 rcu_head: Default::default(),
@@ -53,9 +65,9 @@ pub fn new(x: T, flags: alloc::Flags) -> Result<Self, AllocError> {
         )?;
 
         // INVARIANT:
-        // * The pointer contains a valid `RcuBoxInner` allocated with `kmalloc`.
+        // * The pointer contains a valid `RcuBoxInner` allocated with `A`.
         // * We just allocated it, so we own free permissions.
-        Ok(RcuBox(NonNull::from(KBox::leak(b))))
+        Ok(RcuBox(NonNull::from(Box::leak(b)), PhantomData))
     }
 
     /// Access the value for a grace period.
@@ -66,7 +78,7 @@ pub fn with_rcu<'rcu>(&self, _read_guard: &'rcu Guard) -> &'rcu T {
     }
 }
 
-impl<T: Send> Deref for RcuBox<T> {
+impl<T: Send, A: Allocator> Deref for RcuBox<T, A> {
     type Target = T;
     fn deref(&self) -> &T {
         // SAFETY: While the `RcuBox<T>` exists, the value remains valid.
@@ -75,10 +87,10 @@ fn deref(&self) -> &T {
 }
 
 // SAFETY:
-// * The `RcuBoxInner<T>` was allocated with `kmalloc`.
+// * The `RcuBoxInner<T>` was allocated with `A`.
 // * `NonNull::as_ptr` returns a non-null pointer.
-unsafe impl<T: Send + 'static> ForeignOwnable for RcuBox<T> {
-    const FOREIGN_ALIGN: usize = <KBox<RcuBoxInner<T>> as ForeignOwnable>::FOREIGN_ALIGN;
+unsafe impl<T: Send + 'static, A: Allocator> ForeignOwnable for RcuBox<T, A> {
+    const FOREIGN_ALIGN: usize = <Box<RcuBoxInner<T>, A> as ForeignOwnable>::FOREIGN_ALIGN;
 
     type Borrowed<'a> = &'a T;
     type BorrowedMut<'a> = &'a T;
@@ -88,9 +100,9 @@ fn into_foreign(self) -> *mut c_void {
     }
 
     unsafe fn from_foreign(ptr: *mut c_void) -> Self {
-        // INVARIANT: Pointer returned by `into_foreign` carries same invariants as `RcuBox<T>`.
+        // INVARIANT: Pointer returned by `into_foreign, A` carries same invariants as `RcuBox<T>`.
         // SAFETY: `into_foreign` never returns a null pointer.
-        Self(unsafe { NonNull::new_unchecked(ptr.cast()) })
+        Self(unsafe { NonNull::new_unchecked(ptr.cast()) }, PhantomData)
     }
 
     unsafe fn borrow<'a>(ptr: *mut c_void) -> &'a T {
@@ -104,7 +116,7 @@ unsafe fn borrow_mut<'a>(ptr: *mut c_void) -> &'a T {
     }
 }
 
-impl<T: Send + 'static> ForeignOwnableRcu for RcuBox<T> {
+impl<T: Send + 'static, A: Allocator> ForeignOwnableRcu for RcuBox<T, A> {
     type RcuBorrowed<'a> = &'a T;
 
     unsafe fn rcu_borrow<'a>(ptr: *mut c_void) -> &'a T {
@@ -114,7 +126,7 @@ unsafe fn rcu_borrow<'a>(ptr: *mut c_void) -> &'a T {
     }
 }
 
-impl<T: Send> Drop for RcuBox<T> {
+impl<T: Send, A: Allocator> Drop for RcuBox<T, A> {
     fn drop(&mut self) {
         // SAFETY: The `rcu_head` field is in-bounds of a valid allocation.
         let rcu_head = unsafe { &raw mut (*self.0.as_ptr()).rcu_head };
@@ -122,9 +134,11 @@ fn drop(&mut self) {
             // SAFETY: `rcu_head` is the `rcu_head` field of `RcuBoxInner<T>`. All users will be
             // gone in an rcu grace period. This is the destructor, so we may pass ownership of the
             // allocation.
-            unsafe { bindings::call_rcu(rcu_head, Some(drop_rcu_box::<T>)) };
+            unsafe { bindings::call_rcu(rcu_head, Some(drop_rcu_box::<T, A>)) };
         } else {
             // SAFETY: All users will be gone in an rcu grace period.
+            // TODO: We are luckily since `kvfree_call_rcu()` works on both kmalloc and vmalloc,
+            // maybe a new `Allocator` method is needed.
             unsafe { bindings::kvfree_call_rcu(rcu_head, self.0.as_ptr().cast()) };
         }
     }
@@ -135,11 +149,35 @@ fn drop(&mut self) {
 /// # Safety
 ///
 /// `head` references the `rcu_head` field of an `RcuBoxInner<T>` that has no references to it.
-/// Ownership of the `KBox<RcuBoxInner<T>>` must be passed.
-unsafe extern "C" fn drop_rcu_box<T>(head: *mut bindings::callback_head) {
+/// Ownership of the `Box<RcuBoxInner<T>, A>` must be passed.
+unsafe extern "C" fn drop_rcu_box<T, A: Allocator>(head: *mut bindings::callback_head) {
     // SAFETY: Caller provides a pointer to the `rcu_head` field of a `RcuBoxInner<T>`.
     let box_inner = unsafe { crate::container_of!(head, RcuBoxInner<T>, rcu_head) };
 
     // SAFETY: Caller ensures exclusive access and passed ownership.
-    drop(unsafe { KBox::from_raw(box_inner) });
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
 }
-- 
2.50.1 (Apple Git-155)


