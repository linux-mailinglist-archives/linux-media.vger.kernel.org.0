Return-Path: <linux-media+bounces-64240-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YHSVHoILJ2rsqgIAu9opvQ
	(envelope-from <linux-media+bounces-64240-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 20:35:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 67615659C6F
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 20:35:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=fCrbXpxm;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64240-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64240-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2E019303C193
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 18:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019CD3E123F;
	Mon,  8 Jun 2026 18:31:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22D33E0C5D
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 18:31:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780943493; cv=none; b=Klm4Zt6MzZcvSWAACFHWDqWc0EshIRaMqZQlX7ZRDVaWwlUZWaX81ZiC4aJmSWD70Tfaztk4SJeL128zwMRJLRTB2NRt2ONPuujtUNSf+SEAELr0bSwYYERoFU++JAxHrReJ2joaLPenmqDXyq91I5W3IPFFnV3VFL/HhRwIbcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780943493; c=relaxed/simple;
	bh=cvyoqj/Bb539PkmmKCc7MdUeVKTIB3KFkC0mL+VNqUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hPg7yozcUlaxbg0IATZof1FA903kVxc62/Bk9qnWfPnV+dIyd8kkCB4W815dPB7W6MjK0VdSdAW0AgoTqhHJHv3+DvYtJG8CfePYJs8L3cOMXwIgUIPILX/XsQ4pDGEXC0m6xWgD72RWp4hGFRFtpxUWKCcULeauw4ax+x7f/5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fCrbXpxm; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780943490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xNXtOay3gnq7R0jyd1tgp6XVTjzltDEVLqTF84fZSVA=;
	b=fCrbXpxmprBuoOMQW9zzcmjoZcvcKU4EKFcql8CAD9tKUS49G2kmmRGY2AhuI4+vBuMYS6
	KZ3yLvjrv2n+b8xTNk1QKnrkUEXfAWFli13bHDfdAvoTBWUQdEEqDerhbTQj3TKpIzCvLA
	2DleZWrOmCqlSSZIhrV6/d7IYkOpBCM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-656-S61WMudCM16dCpKliXhNvQ-1; Mon,
 08 Jun 2026 14:31:24 -0400
X-MC-Unique: S61WMudCM16dCpKliXhNvQ-1
X-Mimecast-MFC-AGG-ID: S61WMudCM16dCpKliXhNvQ_1780943481
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9A6391830473;
	Mon,  8 Jun 2026 18:31:20 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.147])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F1A9F180058F;
	Mon,  8 Jun 2026 18:31:16 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	driver-core@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Benno Lossin <lossin@kernel.org>,
	linaro-mm-sig@lists.linaro.org,
	Danilo Krummrich <dakr@kernel.org>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Lyude Paul <lyude@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v19 4/4] rust: drm: gem: Introduce shmem::Object::sg_table()
Date: Mon,  8 Jun 2026 14:29:04 -0400
Message-ID: <20260608183057.2001376-5-lyude@redhat.com>
In-Reply-To: <20260608183057.2001376-1-lyude@redhat.com>
References: <20260608183057.2001376-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64240-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[nvidia.com,garyguo.net,amd.com,lists.linux.dev,kernel.org,linux.intel.com,google.com,ffwll.ch,vger.kernel.org,linaro.org,suse.de,gmail.com,lists.linaro.org,asahilina.net,collabora.com,redhat.com,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:nouveau@lists.freedesktop.org,m:acourbot@nvidia.com,m:gary@garyguo.net,m:christian.koenig@amd.com,m:driver-core@lists.linux.dev,m:ojeda@kernel.org,m:maarten.lankhorst@linux.intel.com,m:aliceryhl@google.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:sumit.semwal@linaro.org,m:linux-media@vger.kernel.org,m:rafael@kernel.org,m:tzimmermann@suse.de,m:mripard@kernel.org,m:airlied@gmail.com,m:lossin@kernel.org,m:linaro-mm-sig@lists.linaro.org,m:dakr@kernel.org,m:mkchauras@gmail.com,m:lina+kernel@asahilina.net,m:daniel.almeida@collabora.com,m:lyude@redhat.com,m:gregkh@linuxfoundation.org,m:lina@asahilina.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lyude@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67615659C6F

In order to do this, we need to be careful to ensure that any interface we
expose for scatterlists ensures that any mappings created from one are
destroyed on driver-unbind. To do this, we introduce a Devres resource into
shmem::Object that we use in order to ensure that we release any SGTable
mappings on driver-unbind.

There's some other slightly unfortunate caveats of this:

* Drivers don't have explicit control at the moment over when unmapping
  happens (which is exactly the same as the C side atm, so it might not be
  a problem).
* We can't just return `SGTableMap` to the user through an Arc to attempt
  to fix the last caveat - because that implies the gem object would need
  to hold a reference count to the scatterlist mapping, which just leaves
  us with the same problem.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

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
V12:
* Actually move sgt_res in this patch and not the next one
V13:
* Use DmaResvGuard suggestion from Alexander
* Use Alexander's (much better) solution for get_sg_table()
* Use SetOnce instead of UnsafeCell
* s/SGTableRef/SGTableMap
* Fix typo in SGTableMap documentation
* Create fallible constructor for SGTableMap
* Don't reuse dma_resv lock for protecting Object contents, just use Mutex
  + SetOnce
* Drop use of drm_gem_shmem_get_pages_sgt_locked(), since we don't need to
  hold the dma_resv lock ourselves for anything but this function.
* Check that the device we receive in the bounds for sg_table() and
  owned_sg_table() that said Device is in fact, the correct device.
* Remove redundant docs in owned_sg_table(), just point it back to
  sg_table().
* Implement Deborah's suggestion to fix double-free in
  free_callback()
* Restore original order of Object<T>
* Fix doc typo for SGTableMap
V14:
* Use new InitOnce container over the Mutex/SetOnce horror show we had
  before.
* Start using LazyInit container for storing Devres for sgt unmap
* Add some kunit tests for sg_table (not sure why I didn't do this before)
  using some of the boilerplate code leftover from the vmap bindings
* Get rid of the owned SGTable variant for now, we'll add it back in a
  future patch if people actually need it.
* Use new LazyInit container from me to get rid of the horrid
  Mutex<SetOnce<>> mess.
* Add the best we can do for unit tests w/r/t SGTable at the moment
V16:
* Get rid of LazyInit, go back to SetOnce, use trick that Alice recommended
  that is a lot cleaner.
* Fix horrid rebasing mistake
V17:
* Rebase
* Fix missing safety comment in free_callback() (we forgot to justify why
  &mut is safe in `unsafe { &mut (*this).sgt_res }.reset()`)
V18:
* Use ManuallyDrop instead of SetOnce::reset()
V19:
* Explain that populate() will always return true in sg_table()
* Fix outdated comment in SGTableMap
* Fix invariant comment in SGTableMap

 rust/kernel/drm/gem/shmem.rs | 174 +++++++++++++++++++++++++++++++++--
 1 file changed, 164 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index ffaa00a1af109..91441252482da 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -11,6 +11,11 @@
 
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
@@ -19,14 +24,23 @@
         DeviceContext,
         Registered, //
     },
-    error::to_result,
+    error::{
+        from_err_ptr,
+        to_result, //
+    },
     io::{
         Io,
         IoCapable,
         IoKnownSize, //
     },
     prelude::*,
-    sync::aref::ARef,
+    scatterlist,
+    sync::{
+        aref::ARef,
+        new_mutex,
+        Mutex,
+        SetOnce, //
+    },
     types::{
         NotThreadSafe,
         Opaque, //
@@ -35,7 +49,10 @@
 use core::{
     ffi::c_void,
     marker::PhantomData,
-    mem::MaybeUninit, //
+    mem::{
+        ManuallyDrop,
+        MaybeUninit, //
+    },
     ops::{
         Deref,
         DerefMut, //
@@ -90,6 +107,11 @@ pub struct Object<T: DriverObject, C: DeviceContext = Registered> {
     obj: Opaque<bindings::drm_gem_shmem_object>,
     /// Parent object that owns this object's DMA reservation object.
     parent_resv_obj: Option<ARef<Object<T, C>>>,
+    /// Devres object for unmapping any SGTable on driver-unbind.
+    sgt_res: ManuallyDrop<SetOnce<Devres<SGTableMap<T, C>>>>,
+    #[pin]
+    /// Lock for protecting initialization of `sgt_res`.
+    sgt_lock: Mutex<()>,
     #[pin]
     inner: T,
     _ctx: PhantomData<C>,
@@ -148,6 +170,8 @@ pub fn new(
             try_pin_init!(Self {
                 obj <- Opaque::init_zeroed(),
                 parent_resv_obj: config.parent_resv_obj.map(|p| p.into()),
+                sgt_res: ManuallyDrop::new(SetOnce::new()),
+                sgt_lock <- new_mutex!(()),
                 inner <- T::new(dev, size, args),
                 _ctx: PhantomData::<C>,
             }),
@@ -192,18 +216,26 @@ extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
         // - DRM always passes a valid gem object here
         // - We used drm_gem_shmem_create() in our create_gem_object callback, so we know that
         //   `obj` is contained within a drm_gem_shmem_object
-        let this = unsafe { container_of!(obj, bindings::drm_gem_shmem_object, base) };
-
-        // SAFETY:
-        // - We're in free_callback - so this function is safe to call.
-        // - We won't be using the gem resources on `this` after this call.
-        unsafe { bindings::drm_gem_shmem_release(this) };
+        let base = unsafe { container_of!(obj, bindings::drm_gem_shmem_object, base) };
 
         // SAFETY:
         // - We verified above that `obj` is valid, which makes `this` valid
         // - This function is set in AllocOps, so we know that `this` is contained within a
         //   `Object<T, C>`
-        let this = unsafe { container_of!(Opaque::cast_from(this), Self, obj) }.cast_mut();
+        let this = unsafe { container_of!(Opaque::cast_from(base), Self, obj) }.cast_mut();
+
+        // We need to drop `sgt_res` first, since doing so requires that the GEM object is still
+        // alive.
+        // SAFETY:
+        // - We verified above that `this` is valid.
+        // - We are in free_callback, guaranteeing we have exclusive access to `this` and that
+        //   `sgt_res` will not be used after dropping it here.
+        unsafe { ManuallyDrop::drop(&mut (*this).sgt_res) };
+
+        // SAFETY:
+        // - We're in free_callback - so this function is safe to call.
+        // - We won't be using the gem resources on `this` after this call.
+        unsafe { bindings::drm_gem_shmem_release(base) };
 
         // SAFETY: We're recovering the Kbox<> we created in gem_create_object()
         let _ = unsafe { KBox::from_raw(this) };
@@ -279,6 +311,46 @@ pub fn vmap<const SIZE: usize>(&self) -> Result<VMapRef<'_, T, C, SIZE>> {
     pub fn owned_vmap<const SIZE: usize>(&self) -> Result<VMapOwned<T, C, SIZE>> {
         self.make_vmap()
     }
+
+    /// Creates (if necessary) and returns an immutable reference to a scatter-gather table of DMA
+    /// pages for this object.
+    ///
+    /// This will pin the object in memory. It is expected that `dev` should be a pointer to the
+    /// same [`device::Device`] which `self` belongs to, otherwise this function will return
+    /// `Err(EINVAL)`.
+    pub fn sg_table<'a>(
+        &'a self,
+        dev: &'a device::Device<Bound>,
+    ) -> Result<&'a scatterlist::SGTable> {
+        if dev.as_raw() != self.dev().as_ref().as_raw() {
+            return Err(EINVAL);
+        }
+
+        let sgt_res = 'out: {
+            // Fast path: sgt_res is already initialized
+            if let Some(sgt_res) = self.sgt_res.as_ref() {
+                break 'out sgt_res;
+            }
+
+            // Slow path: Grab the lock and see if we need to initialize sgt_res.
+            let _guard = self.sgt_lock.lock();
+
+            // If someone initialized it while we were waiting, we can exit early.
+            if let Some(sgt_res) = self.sgt_res.as_ref() {
+                break 'out sgt_res;
+            }
+
+            // If not, finish initializing and return. `populate()` cannot return false, as
+            // `sgt_res` must be unpopulated, and we must hold `sgt_lock` to reach this point.
+            self.sgt_res
+                .populate(Devres::new(dev, SGTableMap::new(self))?);
+
+            // SAFETY: We just populated sgt_res above.
+            unsafe { self.sgt_res.as_ref().unwrap_unchecked() }
+        };
+
+        Ok(sgt_res.access(dev)?)
+    }
 }
 
 impl<T: DriverObject, C: DeviceContext> Deref for Object<T, C> {
@@ -477,6 +549,64 @@ unsafe fn io_write(&self, value: $ty, address: usize) {
 #[cfg(CONFIG_64BIT)]
 impl_vmap_io_capable!(u64);
 
+/// A reference to a GEM object that is known to have a mapped [`SGTable`].
+///
+/// This is used by the Rust bindings with [`Devres`] in order to ensure that mappings for SGTables
+/// on GEM shmem objects are revoked on driver-unbind.
+///
+/// # Invariants
+///
+/// - `self.obj` always points to a valid GEM object.
+/// - This object is proof that `self.obj.owner.sgt_res` has an initialized and valid pointer to an
+///   [`SGTable`].
+///
+/// [`SGTable`]: scatterlist::SGTable
+pub struct SGTableMap<T: DriverObject, C: DeviceContext> {
+    obj: NonNull<Object<T, C>>,
+}
+
+impl<T: DriverObject, C: DeviceContext> Deref for SGTableMap<T, C> {
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
+impl<T: DriverObject, C: DeviceContext> Drop for SGTableMap<T, C> {
+    fn drop(&mut self) {
+        // SAFETY: `obj` is always valid via our type invariants
+        let obj = unsafe { self.obj.as_ref() };
+        let _lock = DmaResvGuard::new(obj);
+
+        // SAFETY: We acquired the lock needed for calling this function above
+        unsafe { bindings::__drm_gem_shmem_free_sgt_locked(obj.as_raw_shmem()) };
+    }
+}
+
+impl<T: DriverObject, C: DeviceContext> SGTableMap<T, C> {
+    fn new(obj: &Object<T, C>) -> impl Init<Self, Error> {
+        // INVARIANT:
+        // - We call drm_gem_shmem_get_pages_sgt below and check whether or not it succeeds,
+        //   fulfilling the invariant of SGTableMap that the object's `sgt` field is initialized.
+        // SAFETY:
+        // - `obj` is fully initialized, making this function safe to call.
+        from_err_ptr(unsafe { bindings::drm_gem_shmem_get_pages_sgt(obj.as_raw_shmem()) })?;
+
+        Ok(Self { obj: obj.into() })
+    }
+}
+
+// SAFETY: The NonNull in SGTableMap is guaranteed valid by our type invariants, and the GEM object
+// it points to is guaranteed to be thread-safe.
+unsafe impl<T: DriverObject, C: DeviceContext> Send for SGTableMap<T, C> {}
+// SAFETY: The NonNull in SGTableMap is guaranteed valid by our type invariants, and the GEM object
+// it points to is guaranteed to be thread-safe.
+unsafe impl<T: DriverObject, C: DeviceContext> Sync for SGTableMap<T, C> {}
+
 #[kunit_tests(rust_drm_gem_shmem)]
 mod tests {
     use super::*;
@@ -591,4 +721,28 @@ fn vmap_io() -> Result {
 
         Ok(())
     }
+
+    // TODO: I would love to actually test the success paths of sg_table(), but that would require
+    // also implementing dummy dma_ops so that trying to create a mapping doesn't explode. So, leave
+    // that for someone else.
+
+    // Ensures that passing the wrong device to sg_table() fails as we expect, and also ensure it
+    // skips initializing `sgt_res` since we could otherwise create `sgt_res` with the wrong device
+    // bound to it.
+    #[test]
+    fn fail_sg_table_on_wrong_dev() -> Result {
+        let (_dev, drm) = create_drm_dev()?;
+        let wrong_dev = faux::Registration::new(c"EvilKunit", None)?;
+
+        let obj = Object::<KunitObject, _>::new(&drm, PAGE_SIZE, ObjectConfig::default(), ())?;
+
+        assert_eq!(obj.sg_table(wrong_dev.as_ref()).err().unwrap(), EINVAL);
+
+        // If sgt_res was not initialized mistakenly with the wrong device, this should still fail.
+        assert_eq!(obj.sg_table(wrong_dev.as_ref()).err().unwrap(), EINVAL);
+
+        // TODO: Someday, we should test that creating an sg_table here still succeeds.
+
+        Ok(())
+    }
 }
-- 
2.54.0


