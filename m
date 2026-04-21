Return-Path: <linux-media+bounces-59261-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FeRJKgL6GkgEgIAu9opvQ
	(envelope-from <linux-media+bounces-59261-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 01:43:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD1E440AC8
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 01:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C5323017A1A
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 23:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E313A640A;
	Tue, 21 Apr 2026 23:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N/I7lJ9o"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7708D3A0B13
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 23:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776814992; cv=none; b=BgZ4r9xiMReY1J+44Q9bpeO1bw2NP9qJQS14vMaJKconkqOGiXS2WEQcym8u7RTkoNBqwJ1bzGR8+5rbS+bxw6FiPrrEfG49XEAUul3BqJdEHtrmp77IGPYij1qmMuTXrC+vFt8JMYfwBE9dA3xR5K+tcd1EQpzk3HwADL/f9rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776814992; c=relaxed/simple;
	bh=hlbsmLEat//TvQ5g0WEIKFuOYH9GFWkUPMIv9QGoUZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZizRPr418j8BVVtnHI1PDznxBzJHJzsOJJiZrKv2c3SQaLUK39XxgIGQAg/c+V2nmG9div2LwuKVeC3ss2UWVIk3w+RhMLlDiwLjy94wiqsBpvMpN1hGH3zX3Jw3w2q3qZ+naGMV+GpHEp1sdk2AM6+3nrQkir/ZIr16PcTLOLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N/I7lJ9o; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776814989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbF9krt16odOiEDlXPUybCqvT/Suic4UTEO0mD2+h4c=;
	b=N/I7lJ9oeQFq0mPrNdZJ0kePzPlrdn01jZigBhlCNhQqdDMqB+zBdfLkwJ8ZOUnzY7meio
	tlt/pwrq2vcMYBKWH0kWIPTs4ZgfAl/1hqsntN1kpIHJCx6dOZchnePlPDcAEH6G5gpeMb
	jxYrIz580HO90inyy/XFc5JTwHgHi78=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-262-6l3qxahBNsOrPwb8jMB3-A-1; Tue,
 21 Apr 2026 19:43:03 -0400
X-MC-Unique: 6l3qxahBNsOrPwb8jMB3-A-1
X-Mimecast-MFC-AGG-ID: 6l3qxahBNsOrPwb8jMB3-A_1776814980
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 384751956080;
	Tue, 21 Apr 2026 23:43:00 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.80.14])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9F2B4180045E;
	Tue, 21 Apr 2026 23:42:56 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org
Cc: Matthew Maurer <mmaurer@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	christian.koenig@amd.com,
	Asahi Lina <lina@asahilina.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Alice Ryhl <aliceryhl@google.com>,
	Boqun Feng <boqun@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	linux-media@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linaro-mm-sig@lists.linaro.org,
	Asahi Lina <lina+kernel@asahilina.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel@vger.kernel.org
Subject: [PATCH v11 4/5] rust: drm: gem: Introduce shmem::SGTable
Date: Tue, 21 Apr 2026 19:40:40 -0400
Message-ID: <20260421234234.638503-5-lyude@redhat.com>
In-Reply-To: <20260421234234.638503-1-lyude@redhat.com>
References: <20260421234234.638503-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,gmail.com,oracle.com,amd.com,asahilina.net,kernel.org,ffwll.ch,linaro.org,vger.kernel.org,lists.linaro.org,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59261-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9AD1E440AC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In order to do this, we need to be careful to ensure that any interface we
expose for scatterlists ensures that any mappings created from one are
destroyed on driver-unbind. To do this, we introduce a Devres resource into
shmem::Object that we use in order to ensure that we release any SGTable
mappings on driver-unbind. We store this in an UnsafeCell and protect
access to it using the dma_resv lock that we already have from the shmem
gem object, which is the same lock that currently protects
drm_gem_object_shmem->sgt.

We also provide two different methods for acquiring an sg table:
self.sg_table(), and self.owned_sg_table(). The first function is for
short-term uses of mapped SGTables, the second is for callers that need to
hold onto the mapped SGTable for an extended period of time. The second
variant uses Devres of course, whereas the first simply relies on rust's
borrow checker to prevent driver-unbind when using the mapped SGTable.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V3:
* Rename OwnedSGTable to shmem::SGTable. Since the current version of the
  SGTable abstractions now has a `Owned` and `Borrowed` variant, I think
  renaming this to shmem::SGTable makes things less confusing.
  We do however, keep the name of owned_sg_table() as-is.
V4:
* Clarify safety comments for SGTable to explain why the object is
  thread-safe.
* Rename from SGTableRef to SGTable
V10:
* Use Devres in order to ensure that SGTables are revocable, and are
  unmapped on driver-unbind.
V11:
* s/create_sg_table()/get_sg_table()
* Get rid of extraneous `ret = ` in shmem::Object::get_sg_table()

 rust/kernel/drm/gem/shmem.rs | 191 ++++++++++++++++++++++++++++++++++-
 1 file changed, 189 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 11749c36e8695..ca9d66900f8ac 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -11,25 +11,38 @@
 
 use crate::{
     container_of,
+    device::{
+        self,
+        Bound, //
+    },
+    devres::*,
     drm::{
         driver,
         gem,
         private::Sealed,
         Device, //
     },
-    error::to_result,
+    error::{
+        from_err_ptr,
+        to_result, //
+    },
     prelude::*,
+    scatterlist,
     types::{
         ARef,
         Opaque, //
     }, //
 };
 use core::{
+    cell::UnsafeCell,
     ops::{
         Deref,
         DerefMut, //
     },
-    ptr::NonNull,
+    ptr::{
+        self,
+        NonNull, //
+    },
 };
 use gem::{
     BaseObjectPrivate,
@@ -65,6 +78,10 @@ pub struct Object<T: DriverObject> {
     obj: Opaque<bindings::drm_gem_shmem_object>,
     /// Parent object that owns this object's DMA reservation object.
     parent_resv_obj: Option<ARef<Object<T>>>,
+    /// Devres object for unmapping any SGTable on driver-unbind.
+    ///
+    /// This is protected by the object's dma_resv lock.
+    sgt_res: UnsafeCell<Option<Devres<SGTableMap<T>>>>,
     #[pin]
     inner: T,
 }
@@ -117,6 +134,7 @@ pub fn new(
             try_pin_init!(Self {
                 obj <- Opaque::init_zeroed(),
                 parent_resv_obj: config.parent_resv_obj.map(|p| p.into()),
+                sgt_res: UnsafeCell::new(None),
                 inner <- T::new(dev, size, args),
             }),
             GFP_KERNEL,
@@ -176,6 +194,100 @@ extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
         // SAFETY: We're recovering the Kbox<> we created in gem_create_object()
         let _ = unsafe { KBox::from_raw(this) };
     }
+
+    // If necessary, create an SGTable for the gem object and register a Devres for it to ensure
+    // that it is unmapped on driver unbind.
+    fn get_sg_table<'a>(
+        &'a self,
+        dev: &'a device::Device<Bound>,
+    ) -> Result<&'a Devres<SGTableMap<T>>> {
+        let sgt_res_ptr = self.sgt_res.get();
+
+        // SAFETY: This lock is initialized throughout the lifetime of the gem object
+        unsafe { bindings::dma_resv_lock(self.raw_dma_resv(), ptr::null_mut()) };
+
+        // SAFETY: We just grabbed the lock required for reading this data above.
+        let sgt_res = unsafe { (*sgt_res_ptr).as_ref() };
+
+        let ret = if let Some(sgt_res) = sgt_res {
+            // We already have a Devres object for this sg table, return it
+            Ok(sgt_res)
+        } else {
+            // SAFETY: We grabbed the lock required for calling this function above */
+            let sgt = from_err_ptr(unsafe {
+                bindings::drm_gem_shmem_get_pages_sgt_locked(self.as_raw_shmem())
+            });
+
+            if let Err(e) = sgt {
+                Err(e)
+            } else {
+                // INVARIANT:
+                // - We called drm_gem_shmem_get_pages_sgt_locked above and checked that it
+                //   succeeded, fulfilling the invariant of SGTableRef that the object's `sgt` field
+                //   is initialized.
+                // - We store this Devres in the object itself and don't move it, ensuring that the
+                //   object it points to remains valid for the lifetime of the SGTableRef.
+                let devres = Devres::new(dev, init!(SGTableMap { obj: self.into() }));
+                match devres {
+                    Ok(devres) => {
+                        // SAFETY: We acquired the lock protecting this data above, making it safe
+                        // to write into here
+                        unsafe { (*sgt_res_ptr) = Some(devres) };
+
+                        // SAFETY: We just write Some() into *sgt_res_ptr above
+                        Ok(unsafe { (&*sgt_res_ptr).as_ref().unwrap_unchecked() })
+                    }
+                    Err(e) => {
+                        // We can't make sure that the pages for this object are unmapped on
+                        // driver-unbind, so we need to release the sgt
+                        // SAFETY:
+                        // - We grabbed the lock required for calling this function above
+                        // - We checked above that get_pages_sgt_locked() was successful
+                        unsafe { bindings::__drm_gem_shmem_free_sgt_locked(self.as_raw_shmem()) };
+
+                        Err(e)
+                    }
+                }
+            }
+        };
+
+        // SAFETY: We're releasing the lock that we grabbed above.
+        unsafe { bindings::dma_resv_unlock(self.raw_dma_resv()) };
+
+        ret
+    }
+
+    /// Creates (if necessary) and returns an immutable reference to a scatter-gather table of DMA
+    /// pages for this object.
+    ///
+    /// This will pin the object in memory.
+    #[inline]
+    pub fn sg_table<'a>(
+        &'a self,
+        dev: &'a device::Device<Bound>,
+    ) -> Result<&'a scatterlist::SGTable> {
+        let sgt = self.get_sg_table(dev)?;
+
+        Ok(sgt.access(dev)?.deref())
+    }
+
+    /// Creates (if necessary) and returns an owned reference to a scatter-gather table of DMA pages
+    /// for this object.
+    ///
+    /// This is the same as [`sg_table`](Self::sg_table), except that it instead returns an
+    /// [`shmem::SGTable`] which holds a reference to the associated gem object, instead of a
+    /// reference to an [`scatterlist::SGTable`].
+    ///
+    /// This will pin the object in memory.
+    ///
+    /// [`shmem::SGTable`]: SGTable
+    pub fn owned_sg_table(&self, dev: &device::Device<Bound>) -> Result<SGTable<T>> {
+        self.get_sg_table(dev)?;
+
+        // INVARIANT: We just ensured above that `self.sgt_res` is initialized with
+        // `Some(Devres<SGTableMap<T>>)`.
+        Ok(SGTable(self.into()))
+    }
 }
 
 impl<T: DriverObject> Deref for Object<T> {
@@ -226,3 +338,78 @@ impl<T: DriverObject> driver::AllocImpl for Object<T> {
         dumb_map_offset: None,
     };
 }
+
+/// A reference to a GEM object that is known to have a mapped [`SGTable`].
+///
+/// This is used by the Rust bindings with [`Devres`] in order to ensure that mappings for SGTables
+/// on GEM shmem objects are revoked on driver-unbind.
+///
+/// # Invariants
+///
+/// - `self.obj` always points to a valid GEM object.
+/// - This object is proof that `self.0.owner.sgt` has an initialized and valid SGTable.
+pub struct SGTableMap<T: DriverObject> {
+    obj: NonNull<Object<T>>,
+}
+
+impl<T: DriverObject> Deref for SGTableMap<T> {
+    type Target = scatterlist::SGTable;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY:
+        // - The NonNull is guaranteed to be valid via our type invariants.
+        // - The sgt field is guaranteed to be initialized and valid via our type invariants.
+        unsafe { scatterlist::SGTable::from_raw((*self.obj.as_ref().as_raw_shmem()).sgt) }
+    }
+}
+
+impl<T: DriverObject> Drop for SGTableMap<T> {
+    fn drop(&mut self) {
+        // SAFETY: `obj` is always valid via our type invariants
+        let obj = unsafe { self.obj.as_ref() };
+
+        // SAFETY: The dma_resv for GEM objects is initialized throughout its lifetime
+        unsafe { bindings::dma_resv_lock(obj.raw_dma_resv(), ptr::null_mut()) };
+
+        // SAFETY: We acquired the lock needed for calling this function above
+        unsafe { bindings::__drm_gem_shmem_free_sgt_locked(obj.as_raw_shmem()) };
+
+        // SAFETY: We are releasing the lock we acquired above.
+        unsafe { bindings::dma_resv_unlock(obj.raw_dma_resv()) };
+    }
+}
+
+// SAFETY: The NonNull in SGTableRef is guaranteed valid by our type invariants, and the GEM object
+// it points to is guaranteed to be thread-safe.
+unsafe impl<T: DriverObject> Send for SGTableMap<T> {}
+// SAFETY: The NonNull in SGTableRef is guaranteed valid by our type invariants, and the GEM object
+// it points to is guaranteed to be thread-safe.
+unsafe impl<T: DriverObject> Sync for SGTableMap<T> {}
+
+/// An owned reference to a scatter-gather table of DMA address spans for a GEM shmem object.
+///
+/// This object holds an owned reference to the underlying GEM shmem object, ensuring that the
+/// [`scatterlist::SGTable`] referenced by this type remains valid for the lifetime of this object.
+///
+/// # Invariants
+///
+/// - This type is proof that `self.0.sgt_res` is initialized with a `Some(Devres<SGTableMap<T>>)`.
+/// - This object is only exposed in situations where we know the underlying `SGTable` will not be
+///   modified for the lifetime of this object. Thus, it is safe to send/access this type across
+///   threads.
+pub struct SGTable<T: DriverObject>(ARef<Object<T>>);
+
+// SAFETY: This object is thread-safe via our type invariants.
+unsafe impl<T: DriverObject> Send for SGTable<T> {}
+// SAFETY: This object is thread-safe via our type invariants.
+unsafe impl<T: DriverObject> Sync for SGTable<T> {}
+
+impl<T: DriverObject> Deref for SGTable<T> {
+    type Target = Devres<SGTableMap<T>>;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: `self.owner.sgt_res` is guaranteed to be initialized with
+        // `Some(Devres<SGTableMap<T>>)` via our type invariants
+        unsafe { (*self.0.sgt_res.get()).as_ref().unwrap_unchecked() }
+    }
+}
-- 
2.53.0


