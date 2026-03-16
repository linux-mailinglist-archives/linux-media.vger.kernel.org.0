Return-Path: <linux-media+bounces-55981-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPD7BHh2uGn5dgEAu9opvQ
	(envelope-from <linux-media+bounces-55981-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 22:30:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CB72A0FB3
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 22:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3F96319CD08
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 21:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5452B372B3C;
	Mon, 16 Mar 2026 21:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J60dBTLI"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84923372B3D
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 21:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773695850; cv=none; b=e7kr3Il9pTpMoXoEy2oiuYul8X3OdLeupTi1ah+ECnzp6JtPO2V4SvBU3AN9gejWSA/M6b9PNK3+CB6nxIa7zcKyJi5iyGncQZn1C+tQ2dNMgJwQlhMD9T4kQDMnnjKDlY0pYvJa8Vj9Hwhp+5AhOCWJKii3vZ9AlI5VmAa/LSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773695850; c=relaxed/simple;
	bh=jxQ8AAnvp0KwSnWmvOl6qDutQ53GjukO0L7o4J/c7w8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rg2+s0a1O2FtQ1v7/touvMjPbVis8DegOQLuon1Hrk1rUCvuQEBQUTYgdX7zsT2DFEn2gejUUUVrwRTD5w4jIaiMebj1LtchuZio6GHjexqiOOGLrLRnJe2ZemRctMzKQql8vyNOqbk9W/gtqvqNTD9DcOVQtTnC+jyXiOQAaFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J60dBTLI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773695846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qIGmariek+LVEQYfWF8x9ShbnIt42zrV5g1MuKxSPMs=;
	b=J60dBTLISLXyAsgPoxQA4AoXHcfVwFqu8YqavxFxqV+ZYf9wL1zNd+emO7vNt6PPSisUFY
	0NdU7QJHx5Z+mMDcyt17/NMk54ah0czilCxVq1Uo3UrHxGjPszLbg7YUK7r9aMUOw4jGy1
	rZrgbKNWdWoDNgBKqK+yyROZa7MNlTc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-662-sOOwAooxNHuAMX4qlQmCPQ-1; Mon,
 16 Mar 2026 17:17:22 -0400
X-MC-Unique: sOOwAooxNHuAMX4qlQmCPQ-1
X-Mimecast-MFC-AGG-ID: sOOwAooxNHuAMX4qlQmCPQ_1773695839
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8D190193533D;
	Mon, 16 Mar 2026 21:17:19 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.88.101])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8D457180035F;
	Mon, 16 Mar 2026 21:17:15 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
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
Subject: [PATCH v9 7/7] rust: drm/gem: Add vmap functions to shmem bindings
Date: Mon, 16 Mar 2026 17:16:15 -0400
Message-ID: <20260316211646.650074-8-lyude@redhat.com>
In-Reply-To: <20260316211646.650074-1-lyude@redhat.com>
References: <20260316211646.650074-1-lyude@redhat.com>
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
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,gmail.com,oracle.com,amd.com,asahilina.net,kernel.org,ffwll.ch,linaro.org,vger.kernel.org,lists.linaro.org,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-55981-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 96CB72A0FB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

One of the more obvious use cases for gem shmem objects is the ability to
create mappings into their contents. So, let's hook this up in our rust
bindings.

Similar to how we handle SGTables, we make sure there's two different types
of mappings: owned mappings (kernel::drm::gem::shmem::VMap) and borrowed
mappings (kernel::drm::gem::shmem::VMapRef).

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V7:
* Switch over to the new iosys map bindings that use the Io trait
V8:
* Get rid of iosys_map bindings for now, only support non-iomem types
* s/as_shmem()/as_raw_shmem()
V9:
* Get rid of some outdated comments I missed
* Add missing SIZE check to raw_vmap()
* Add a proper unit test that ensures that we actually validate SIZE at
  compile-time.
  Turns out it takes only 34 lines to make a boilerplate DRM driver for a
  kunit test :)
* Add unit tests
* Add some missing #[inline]s

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/shmem.rs | 358 ++++++++++++++++++++++++++++++++++-
 1 file changed, 356 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 3fab5d76c197b..5254338bad394 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -2,7 +2,7 @@
 
 //! DRM GEM shmem helper objects
 //!
-//! C header: [`include/linux/drm/drm_gem_shmem_helper.h`](srctree/include/linux/drm/drm_gem_shmem_helper.h)
+//! C header: [`include/linux/drm/drm_gem_shmem_helper.h`](srctree/include/drm/drm_gem_shmem_helper.h)
 
 // TODO:
 // - There are a number of spots here that manually acquire/release the DMA reservation lock using
@@ -21,6 +21,11 @@
         from_err_ptr,
         to_result, //
     },
+    io::{
+        Io,
+        IoCapable,
+        IoKnownSize, //
+    },
     prelude::*,
     scatterlist,
     types::{
@@ -29,13 +34,22 @@
     }, //
 };
 use core::{
+    ffi::c_void,
+    mem::{
+        self,
+        MaybeUninit, //
+    },
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
+    BaseObject,
     BaseObjectPrivate,
     DriverObject,
     IntoGEMObject, //
@@ -217,6 +231,88 @@ pub fn owned_sg_table(&self) -> Result<SGTable<T>> {
             _owner: self.into(),
         })
     }
+
+    /// Attempt to create a vmap from the gem object, and confirm the size of said vmap.
+    fn raw_vmap(&self, min_size: usize) -> Result<*mut c_void> {
+        if self.size() < min_size {
+            return Err(ENOSPC);
+        }
+
+        let mut map: MaybeUninit<bindings::iosys_map> = MaybeUninit::uninit();
+
+        // SAFETY: drm_gem_shmem_vmap can be called with the DMA reservation lock held
+        to_result(unsafe {
+            // TODO: see top of file
+            bindings::dma_resv_lock(self.raw_dma_resv(), ptr::null_mut());
+            let ret = bindings::drm_gem_shmem_vmap_locked(self.as_raw_shmem(), map.as_mut_ptr());
+            bindings::dma_resv_unlock(self.raw_dma_resv());
+            ret
+        })?;
+
+        // SAFETY: The call to drm_gem_shmem_vunmap_locked succeeded above, so we are guaranteed
+        // that map is properly initialized.
+        let map = unsafe { map.assume_init() };
+
+        // XXX: We don't currently support iomem allocations
+        if map.is_iomem {
+            // SAFETY:
+            // - The vmap operation above succeeded, making it safe to call vunmap
+            // - We checked that this is an iomem allocation, making it safe to read vaddr_iomem
+            unsafe { self.raw_vunmap(map.__bindgen_anon_1.vaddr_iomem) };
+
+            Err(ENOTSUPP)
+        } else {
+            // SAFETY: We checked that this is not an iomem allocation, making it safe to read vaddr
+            Ok(unsafe { map.__bindgen_anon_1.vaddr })
+        }
+    }
+
+    /// Unmap a vmap from the gem object.
+    ///
+    /// # Safety
+    ///
+    /// - The caller promises that addr came from a prior call to [`Self::raw_vmap`] on this gem
+    ///   object.
+    /// - The caller promises that the memory pointed to by addr will no longer be accesed through
+    ///   this instance.
+    unsafe fn raw_vunmap(&self, vaddr: *mut c_void) {
+        let resv = self.raw_dma_resv();
+        let mut map = bindings::iosys_map {
+            is_iomem: false,
+            __bindgen_anon_1: bindings::iosys_map__bindgen_ty_1 { vaddr },
+        };
+
+        // SAFETY:
+        // - This function is safe to call with the DMA reservation lock held
+        // - Our `ARef` is proof that the underlying gem object here is initialized and thus safe to
+        //   dereference.
+        unsafe {
+            // TODO: see top of file
+            bindings::dma_resv_lock(resv, ptr::null_mut());
+            bindings::drm_gem_shmem_vunmap_locked(self.as_raw_shmem(), &mut map);
+            bindings::dma_resv_unlock(resv);
+        }
+    }
+
+    /// Creates and returns a virtual kernel memory mapping for this object.
+    #[inline]
+    pub fn vmap<const SIZE: usize>(&self) -> Result<VMapRef<'_, T, SIZE>> {
+        Ok(VMapRef {
+            // INVARIANT: `raw_vmap()` checks that the gem object is at least as large as `SIZE`.
+            addr: self.raw_vmap(SIZE)?,
+            owner: self,
+        })
+    }
+
+    /// Creates and returns an owned reference to a virtual kernel memory mapping for this object.
+    #[inline]
+    pub fn owned_vmap<const SIZE: usize>(&self) -> Result<VMap<T, SIZE>> {
+        Ok(VMap {
+            // INVARIANT: `raw_vmap()` checks that the gem object is at least as large as `SIZE`.
+            addr: self.raw_vmap(SIZE)?,
+            owner: self.into(),
+        })
+    }
 }
 
 impl<T: DriverObject> Deref for Object<T> {
@@ -268,6 +364,147 @@ impl<T: DriverObject> driver::AllocImpl for Object<T> {
     };
 }
 
+macro_rules! impl_vmap_io_capable {
+    ($impl:ident, $ty:ty $(, $lifetime:lifetime )?) => {
+        impl<$( $lifetime ,)? D: DriverObject, const SIZE: usize> IoCapable<$ty>
+            for $impl<$( $lifetime ,)? D, SIZE>
+        {
+            #[inline(always)]
+            unsafe fn io_read(&self, address: usize) -> $ty {
+                let ptr = address as *mut $ty;
+
+                // SAFETY: The safety contract of `io_read` guarantees that address is a valid
+                // address within the bounds of `Self` of at least the size of $ty, and is properly
+                // aligned.
+                unsafe { ptr::read(ptr) }
+            }
+
+            #[inline(always)]
+            unsafe fn io_write(&self, value: $ty, address: usize) {
+                let ptr = address as *mut $ty;
+
+                // SAFETY: The safety contract of `io_write` guarantees that address is a valid
+                // address within the bounds of `Self` of at least the size of $ty, and is properly
+                // aligned.
+                unsafe { ptr::write(ptr, value) }
+            }
+        }
+    };
+}
+
+// Implement various traits common to both VMap types
+macro_rules! impl_vmap_common {
+    ($impl:ident $(, $lifetime:lifetime )?) => {
+        impl<$( $lifetime ,)? D, const SIZE: usize> $impl<$( $lifetime ,)? D, SIZE>
+        where
+            D: DriverObject,
+        {
+            /// Borrows a reference to the object that owns this virtual mapping.
+            #[inline(always)]
+            pub fn owner(&self) -> &Object<D> {
+                &self.owner
+            }
+        }
+
+        impl<$( $lifetime ,)? D, const SIZE: usize> Drop for $impl<$( $lifetime ,)? D, SIZE>
+        where
+            D: DriverObject,
+        {
+            #[inline(always)]
+            fn drop(&mut self) {
+                // SAFETY: Our existence is proof that this map was previously created using
+                // self.owner
+                unsafe { self.owner.raw_vunmap(self.addr) };
+            }
+        }
+
+        impl<$( $lifetime ,)? D, const SIZE: usize> Io for $impl<$( $lifetime ,)? D, SIZE>
+        where
+            D: DriverObject,
+        {
+            #[inline(always)]
+            fn addr(&self) -> usize {
+                self.addr as usize
+            }
+
+            #[inline(always)]
+            fn maxsize(&self) -> usize {
+                self.owner.size()
+            }
+        }
+
+        impl<$( $lifetime ,)? D, const SIZE: usize> IoKnownSize for $impl<$( $lifetime ,)? D, SIZE>
+        where
+            D: DriverObject,
+        {
+            const MIN_SIZE: usize = SIZE;
+        }
+
+        impl_vmap_io_capable!($impl, u8 $( , $lifetime )?);
+        impl_vmap_io_capable!($impl, u16 $( , $lifetime )?);
+        impl_vmap_io_capable!($impl, u32 $( , $lifetime )?);
+        #[cfg(CONFIG_64BIT)]
+        impl_vmap_io_capable!($impl, u64 $( , $lifetime )?);
+    };
+}
+
+/// An owned reference to a virtual mapping for a shmem-based GEM object in kernel address space.
+///
+/// # Invariants
+///
+/// - The size of `owner` is >= SIZE.
+/// - The memory pointed to by addr remains valid at least until this object is dropped.
+pub struct VMap<D: DriverObject, const SIZE: usize = 0> {
+    addr: *mut c_void,
+    owner: ARef<Object<D>>,
+}
+
+impl_vmap_common!(VMap);
+
+impl<D: DriverObject, const SIZE: usize> Clone for VMap<D, SIZE> {
+    #[inline]
+    fn clone(&self) -> Self {
+        // SAFETY: We have a successful vmap already, so this can't fail
+        unsafe { self.owner.owned_vmap().unwrap_unchecked() }
+    }
+}
+
+impl<'a, D: DriverObject, const SIZE: usize> From<VMapRef<'a, D, SIZE>> for VMap<D, SIZE> {
+    #[inline]
+    fn from(value: VMapRef<'a, D, SIZE>) -> Self {
+        let this = Self {
+            addr: value.addr,
+            owner: value.owner.into(),
+        };
+
+        mem::forget(value);
+        this
+    }
+}
+
+// SAFETY: addr is guaranteed to be valid and accessible for the lifetime of VMap, ensuring its
+// safe to send across threads.
+unsafe impl<D: DriverObject, const SIZE: usize> Send for VMap<D, SIZE> {}
+// SAFETY: addr is guaranteed to be valid and accessible for the lifetime of VMap, ensuring its
+// safe to send across threads.
+unsafe impl<D: DriverObject, const SIZE: usize> Sync for VMap<D, SIZE> {}
+
+/// A borrowed reference to a virtual mapping for a shmem-based GEM object in kernel address space.
+pub struct VMapRef<'a, D: DriverObject, const SIZE: usize = 0> {
+    addr: *mut c_void,
+    owner: &'a Object<D>,
+}
+
+impl_vmap_common!(VMapRef, 'a);
+
+impl<'a, D: DriverObject, const SIZE: usize> Clone for VMapRef<'a, D, SIZE> {
+    #[inline]
+    fn clone(&self) -> Self {
+        // SAFETY: We have a successful vmap already, so this can't fail
+        unsafe { self.owner.vmap().unwrap_unchecked() }
+    }
+}
+
 /// An owned reference to a scatter-gather table of DMA address spans for a GEM shmem object.
 ///
 /// This object holds an owned reference to the underlying GEM shmem object, ensuring that the
@@ -298,3 +535,120 @@ fn deref(&self) -> &Self::Target {
         unsafe { self.sgt.as_ref() }
     }
 }
+
+#[kunit_tests(rust_drm_gem_shmem)]
+mod tests {
+    use super::*;
+    use crate::{
+        drm,
+        faux,
+        page::PAGE_SIZE, //
+    };
+
+    // The bare minimum needed to create a fake drm driver for kunit
+
+    #[pin_data]
+    struct KunitData {}
+    struct KunitDriver;
+    struct KunitFile;
+    #[pin_data]
+    struct KunitObject {}
+
+    const INFO: drm::DriverInfo = drm::DriverInfo {
+        major: 0,
+        minor: 0,
+        patchlevel: 0,
+        name: c"kunit",
+        desc: c"Kunit",
+    };
+
+    impl drm::file::DriverFile for KunitFile {
+        type Driver = KunitDriver;
+
+        fn open(_dev: &drm::Device<KunitDriver>) -> Result<Pin<KBox<Self>>> {
+            Ok(KBox::new(Self, GFP_KERNEL)?.into())
+        }
+    }
+
+    impl gem::DriverObject for KunitObject {
+        type Driver = KunitDriver;
+        type Args = ();
+
+        fn new(
+            _dev: &drm::Device<KunitDriver>,
+            _size: usize,
+            _args: Self::Args,
+        ) -> impl PinInit<Self, Error> {
+            try_pin_init!(KunitObject {})
+        }
+    }
+
+    #[vtable]
+    impl drm::Driver for KunitDriver {
+        type Data = KunitData;
+        type File = KunitFile;
+        type Object = Object<KunitObject>;
+
+        const INFO: drm::DriverInfo = INFO;
+        const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor] = &[];
+    }
+
+    fn create_drm_dev() -> Result<(faux::Registration, ARef<drm::Device<KunitDriver>>)> {
+        // Create a faux DRM device so we can test gem object creation.
+        let data = try_pin_init!(KunitData {});
+        let dev = faux::Registration::new(c"Kunit", None)?;
+        let drm = drm::Device::<KunitDriver>::new(dev.as_ref(), data)?;
+
+        Ok((dev, drm))
+    }
+
+    #[test]
+    fn compile_time_vmap_sizes() -> Result {
+        let (_dev, drm) = create_drm_dev()?;
+
+        // Create a gem object to test with
+        let cfg_ = ObjectConfig::<KunitObject> {
+            map_wc: false,
+            parent_resv_obj: None,
+        };
+        let obj = Object::<KunitObject>::new(&drm, PAGE_SIZE, cfg_, ())?;
+
+        // Try creating a normal vmap
+        obj.vmap::<PAGE_SIZE>()?;
+
+        // Try creating a vmap that's smaller then the size we specified
+        obj.vmap::<{ PAGE_SIZE - 100 }>()?;
+
+        // Make sure creating a vmap that's too large fails
+        assert!(obj.vmap::<{ PAGE_SIZE + 200 }>().is_err());
+
+        Ok(())
+    }
+
+    #[test]
+    fn vmap_io() -> Result {
+        let (_dev, drm) = create_drm_dev()?;
+
+        // Create a gem object to test with
+        let cfg_ = ObjectConfig::<KunitObject> {
+            map_wc: false,
+            parent_resv_obj: None,
+        };
+        let obj = Object::<KunitObject>::new(&drm, PAGE_SIZE, cfg_, ())?;
+
+        let vmap = obj.vmap::<PAGE_SIZE>()?;
+
+        vmap.write8(0xDE, 0x0);
+        assert_eq!(vmap.read8(0x0), 0xDE);
+        vmap.write32(0xFFFFFFFF, 0x20);
+
+        assert_eq!(vmap.read32(0x20), 0xFFFFFFFF);
+
+        assert_eq!(vmap.read8(0x20), 0xFF);
+        assert_eq!(vmap.read8(0x21), 0xFF);
+        assert_eq!(vmap.read8(0x22), 0xFF);
+        assert_eq!(vmap.read8(0x23), 0xFF);
+
+        Ok(())
+    }
+}
-- 
2.53.0


