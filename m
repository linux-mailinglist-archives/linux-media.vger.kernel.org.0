Return-Path: <linux-media+bounces-58459-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLScAfAu2GmwZQgAu9opvQ
	(envelope-from <linux-media+bounces-58459-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 00:57:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 739B03D0659
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 00:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA1E03013AB6
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 22:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50ED39A80E;
	Thu,  9 Apr 2026 22:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="IiBOlxF7"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8815739A079;
	Thu,  9 Apr 2026 22:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775775460; cv=pass; b=koYtYDygmJT4M/VmxXfLnkf1TI4K93l5DiP0Mv/f5AU+UvZJNYOGMD3msj81v7STM59Zn68loRORfZ8xComKKThMsQoFPQQRmjSUZ+xJpCbNNRBez9TaPp3QlsaJeO3Cq7hD3ZigvCQKvkSViHRRntbme/y2a40U49gADY+JoSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775775460; c=relaxed/simple;
	bh=EXgjer7TJ6ww2mN5jKcL3CsXHUu8pWeatvs7XaZoXMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RNC6RoIx5VaQ5pyelrbxbO3OP7+55cEaTs3qnLm2wPqeRCVviAL1KTS81Q8HLFtFF+fi28zIOMPK2nKn9sDVROXR7jJYIidSTGfNzkAwDlPMTKc55qugz8s1c8bgcRFzBriZvxXIN+qMmhLnF/EEec10WlVaxbpXNcnWWkJB+uM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=IiBOlxF7; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1775775427; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m4HMpydMUiKIypEQgW6lE0uc9Durc0jVzFb/kzdmqnnznlX2Ixpm+FkCIVVQ98qrsFEqrnvkrvimFZmpCLYmLlGGLIzDCJfnnjCRF2Mw1ysWFCKsKwwRfmBpdz84Jh7eP2STnJiR3tmF3SESeqgJzhEdNCUrYr0TrSwWiF/gpHs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775775427; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mglfHDbQCdy4UxiAawklgqLRry8FY4Gua9B8jPjXuow=; 
	b=C9DX0pvd94VEeXNdz66O5D5Z3yzcRGfY/HtGsXcMYcScTMZ16Jx+f3QFbcDOTT4pGhzAjVwSuJN4yyvGcfWE5K9FrMEXBncN1mjWdcNmrrEFIZ39Pya99XFAsoyEIWQqDhzJeYa1oyK/xzfXWVuhS/ldnLmxEOv/n4pf7DXlfnQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775775426;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=mglfHDbQCdy4UxiAawklgqLRry8FY4Gua9B8jPjXuow=;
	b=IiBOlxF7Bp5ihDohymYF03yGGNlWo9IPoN7KuA8VYBzOm5Et+C8w68RGS/gK4wDD
	xj5PR7Ru35KRCmAaA9nz4A+s+2sDB0RoznCzRciIpC7M1JAfG4pVVox/pzYjTgcdvVe
	pCJXqHX2ljR5wqUAWJ03nAyAWTkQ2XfJvGUE3HpI=
Received: by mx.zohomail.com with SMTPS id 1775775425845803.217885107667;
	Thu, 9 Apr 2026 15:57:05 -0700 (PDT)
Date: Thu, 9 Apr 2026 15:57:04 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Matthew Maurer <mmaurer@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	christian.koenig@amd.com, Asahi Lina <lina@asahilina.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Simona Vetter <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>,
	Boqun Feng <boqun@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	linux-media@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>,
	David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linaro-mm-sig@lists.linaro.org,
	Asahi Lina <lina+kernel@asahilina.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel@vger.kernel.org
Subject: Re: [PATCH v10 4/5] rust: drm: gem: Introduce shmem::SGTable
Message-ID: <adguwHf8NpFPqWkV@um790>
References: <20260409001559.622026-1-lyude@redhat.com>
 <20260409001559.622026-5-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260409001559.622026-5-lyude@redhat.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58459-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,garyguo.net,collabora.com,vger.kernel.org,kernel.org,google.com,gmail.com,oracle.com,amd.com,asahilina.net,ffwll.ch,linaro.org,lists.linaro.org,linuxfoundation.org];
	TAGGED_RCPT(0.00)[linux-media,kernel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:dkim]
X-Rspamd-Queue-Id: 739B03D0659
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 08:12:50PM -0400, Lyude Paul wrote:
> In order to do this, we need to be careful to ensure that any interface we
> expose for scatterlists ensures that any mappings created from one are
> destroyed on driver-unbind. To do this, we introduce a Devres resource into
> shmem::Object that we use in order to ensure that we release any SGTable
> mappings on driver-unbind. We store this in an UnsafeCell and protect
> access to it using the dma_resv lock that we already have from the shmem
> gem object, which is the same lock that currently protects
> drm_gem_object_shmem->sgt.
> 
> We also provide two different methods for acquiring an sg table:
> self.sg_table(), and self.owned_sg_table(). The first function is for
> short-term uses of mapped SGTables, the second is for callers that need to
> hold onto the mapped SGTable for an extended period of time. The second
> variant uses Devres of course, whereas the first simply relies on rust's
> borrow checker to prevent driver-unbind when using the mapped SGTable.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> 
> ---
> V3:
> * Rename OwnedSGTable to shmem::SGTable. Since the current version of the
>   SGTable abstractions now has a `Owned` and `Borrowed` variant, I think
>   renaming this to shmem::SGTable makes things less confusing.
>   We do however, keep the name of owned_sg_table() as-is.
> V4:
> * Clarify safety comments for SGTable to explain why the object is
>   thread-safe.
> * Rename from SGTableRef to SGTable
> V10:
> * Use Devres in order to ensure that SGTables are revocable, and are
>   unmapped on driver-unbind.
> 
>  rust/kernel/drm/gem/shmem.rs | 191 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 189 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
> index c643f18b20838..111be446213df 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -11,25 +11,38 @@
>  
>  use crate::{
>      container_of,
> +    device::{
> +        self,
> +        Bound, //
> +    },
> +    devres::*,
>      drm::{
>          driver,
>          gem,
>          private::Sealed, //
>          Device,
>      },
> -    error::to_result,
> +    error::{
> +        from_err_ptr, //
> +        to_result,
> +    },
>      prelude::*,
> +    scatterlist,
>      types::{
>          ARef,
>          Opaque, //
>      }, //
>  };
>  use core::{
> +    cell::UnsafeCell,
>      ops::{
>          Deref,
>          DerefMut, //
>      },
> -    ptr::NonNull,
> +    ptr::{
> +        self,
> +        NonNull, //
> +    },
>  };
>  use gem::{
>      BaseObjectPrivate,
> @@ -65,6 +78,10 @@ pub struct Object<T: DriverObject> {
>      obj: Opaque<bindings::drm_gem_shmem_object>,
>      /// Parent object that owns this object's DMA reservation object.
>      parent_resv_obj: Option<ARef<Object<T>>>,
> +    /// Devres object for unmapping any SGTable on driver-unbind.
> +    ///
> +    /// This is protected by the object's dma_resv lock.
> +    sgt_res: UnsafeCell<Option<Devres<SGTableMap<T>>>>,
>      #[pin]
>      inner: T,
>  }
> @@ -117,6 +134,7 @@ pub fn new(
>              try_pin_init!(Self {
>                  obj <- Opaque::init_zeroed(),
>                  parent_resv_obj: config.parent_resv_obj.map(|p| p.into()),
> +                sgt_res: UnsafeCell::new(None),
>                  inner <- T::new(dev, size, args),
>              }),
>              GFP_KERNEL,
> @@ -176,6 +194,100 @@ extern "C" fn free_callback(obj: *mut bindings::drm_gem_object) {
>          // SAFETY: We're recovering the Kbox<> we created in gem_create_object()
>          let _ = unsafe { KBox::from_raw(this) };
>      }
> +
> +    // If necessary, create an SGTable for the gem object and register a Devres for it to ensure
> +    // that it is unmapped on driver unbind.
> +    fn create_sg_table<'a>(
> +        &'a self,
> +        dev: &'a device::Device<Bound>,
> +    ) -> Result<&'a Devres<SGTableMap<T>>> {
> +        let ret;
> +        let sgt_res_ptr = self.sgt_res.get();
> +
> +        // SAFETY: This lock is initialized throughout the lifetime of the gem object
> +        unsafe { bindings::dma_resv_lock(self.raw_dma_resv(), ptr::null_mut()) };
> +
> +        // SAFETY: We just grabbed the lock required for reading this data above.
> +        let sgt_res = unsafe { (*sgt_res_ptr).as_ref() };
> +        if let Some(sgt_res) = sgt_res {
> +            // We already have a Devres object for this sg table, return it
> +            ret = Ok(sgt_res);
> +        } else {
> +            // SAFETY: We grabbed the lock required for calling this function above */
> +            let sgt = from_err_ptr(unsafe {
> +                bindings::drm_gem_shmem_get_pages_sgt_locked(self.as_raw_shmem())
> +            });
> +
> +            if let Err(e) = sgt {
> +                ret = Err(e);
> +            } else {
> +                // INVARIANT:
> +                // - We called drm_gem_shmem_get_pages_sgt_locked above and checked that it
> +                //   succeeded, fulfilling the invariant of SGTableRef that the object's `sgt` field
> +                //   is initialized.
> +                // - We store this Devres in the object itself and don't move it, ensuring that the
> +                //   object it points to remains valid for the lifetime of the SGTableRef.
> +                let devres = Devres::new(dev, init!(SGTableMap { obj: self.into() }));
> +                match devres {
> +                    Ok(devres) => {
> +                        // SAFETY: We acquired the lock protecting this data above, making it safe
> +                        // to write into here
> +                        unsafe { (*sgt_res_ptr) = Some(devres) };
> +
> +                        // SAFETY: We just write Some() into *sgt_res_ptr above
> +                        ret = Ok(unsafe { (&*sgt_res_ptr).as_ref().unwrap_unchecked() });
> +                    }
> +                    Err(e) => {
> +                        // We can't make sure that the pages for this object are unmapped on
> +                        // driver-unbind, so we need to release the sgt
> +                        // SAFETY:
> +                        // - We grabbed the lock required for calling this function above
> +                        // - We checked above that get_pages_sgt_locked() was successful
> +                        unsafe { bindings::__drm_gem_shmem_free_sgt_locked(self.as_raw_shmem()) };
> +
> +                        ret = Err(e);
> +                    }
> +                }
> +            }
> +        }
> +
> +        // SAFETY: We're releasing the lock that we grabbed above.
> +        unsafe { bindings::dma_resv_unlock(self.raw_dma_resv()) };
> +
> +        ret
> +    }
> +
> +    /// Creates (if necessary) and returns an immutable reference to a scatter-gather table of DMA
> +    /// pages for this object.
> +    ///
> +    /// This will pin the object in memory.
> +    #[inline]
> +    pub fn sg_table<'a>(
> +        &'a self,
> +        dev: &'a device::Device<Bound>,
> +    ) -> Result<&'a scatterlist::SGTable> {
> +        let sgt = self.create_sg_table(dev)?;
> +
> +        Ok(sgt.access(dev)?.deref())
> +    }
> +
> +    /// Creates (if necessary) and returns an owned reference to a scatter-gather table of DMA pages
> +    /// for this object.
> +    ///
> +    /// This is the same as [`sg_table`](Self::sg_table), except that it instead returns an
> +    /// [`shmem::SGTable`] which holds a reference to the associated gem object, instead of a
> +    /// reference to an [`scatterlist::SGTable`].
> +    ///
> +    /// This will pin the object in memory.
> +    ///
> +    /// [`shmem::SGTable`]: SGTable
> +    pub fn owned_sg_table(&self, dev: &device::Device<Bound>) -> Result<SGTable<T>> {
> +        self.create_sg_table(dev)?;
> +
> +        // INVARIANT: We just ensured above that `self.sgt_res` is initialized with
> +        // `Some(Devres<SGTableMap<T>>)`.
> +        Ok(SGTable(self.into()))
> +    }
>  }
>  
>  impl<T: DriverObject> Deref for Object<T> {
> @@ -226,3 +338,78 @@ impl<T: DriverObject> driver::AllocImpl for Object<T> {
>          dumb_map_offset: None,
>      };
>  }
> +
> +/// A reference to a GEM object that is known to have a mapped [`SGTable`].
> +///
> +/// This is used by the Rust bindings with [`Devres`] in order to ensure that mappings for SGTables
> +/// on GEM shmem objects are revoked on driver-unbind.
> +///
> +/// # Invariants
> +///
> +/// - `self.obj` always points to a valid GEM object.
> +/// - This object is proof that `self.0.owner.sgt` has an initialized and valid SGTable.
> +pub struct SGTableMap<T: DriverObject> {
> +    obj: NonNull<Object<T>>,
> +}
> +
> +impl<T: DriverObject> Deref for SGTableMap<T> {
> +    type Target = scatterlist::SGTable;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY:
> +        // - The NonNull is guaranteed to be valid via our type invariants.
> +        // - The sgt field is guaranteed to be initialized and valid via our type invariants.
> +        unsafe { scatterlist::SGTable::from_raw((*self.obj.as_ref().as_raw_shmem()).sgt) }
> +    }
> +}
> +
> +impl<T: DriverObject> Drop for SGTableMap<T> {
> +    fn drop(&mut self) {
> +        // SAFETY: `obj` is always valid via our type invariants
> +        let obj = unsafe { self.obj.as_ref() };
> +
> +        // SAFETY: The dma_resv for GEM objects is initialized throughout its lifetime
> +        unsafe { bindings::dma_resv_lock(obj.raw_dma_resv(), ptr::null_mut()) };
> +
> +        // SAFETY: We acquired the lock needed for calling this function above
> +        unsafe { bindings::__drm_gem_shmem_free_sgt_locked(obj.as_raw_shmem()) };

When i was testing this with tyr I got a double free here when I unloaded the module.

When our drm::Device (drm::Device<TyrDrmDriver, Ctx>) was released, its device data
(TyrDrmDeviceData) was dropped. In our device data we are indirectly holding several gem
Objects through the firmware (Firmware → sections → KernelBo → bo)

When those objects are destroyed, shmem::Object::free_callback() runs. This calls
drm_gem_shmem_release() which, on the C side frees shmem→sgt if it exists
via __drm_gem_shmem_free_sgt_locked(shmem).

But the Rust Object<T> still has the sgt_res. So, at the end of free_callback(), KBox::from_raw(this) triggers
SGTableMap::drop(), and that calls __drm_gem_shmem_free_sgt_locked() again for the same shmem object.

So the same sgt ends up being freed once from drm_gem_shmem_release() and again later from SGTableMap::drop().

For now my fix is just to clear sgt_res in free_callback() before drm_gem_shmem_release() which
prevents the sgt from being freed by the C side.

I plan to post our latest tyr series soon including this abstraction, and I hope you can have a look,
perhaps how we’ve set up the device data is unexpected.

> +
> +        // SAFETY: We are releasing the lock we acquired above.
> +        unsafe { bindings::dma_resv_unlock(obj.raw_dma_resv()) };
> +    }
> +}
> +
> +// SAFETY: The NonNull in SGTableRef is guaranteed valid by our type invariants, and the GEM object
> +// it points to is guaranteed to be thread-safe.
> +unsafe impl<T: DriverObject> Send for SGTableMap<T> {}
> +// SAFETY: The NonNull in SGTableRef is guaranteed valid by our type invariants, and the GEM object
> +// it points to is guaranteed to be thread-safe.
> +unsafe impl<T: DriverObject> Sync for SGTableMap<T> {}
> +
> +/// An owned reference to a scatter-gather table of DMA address spans for a GEM shmem object.
> +///
> +/// This object holds an owned reference to the underlying GEM shmem object, ensuring that the
> +/// [`scatterlist::SGTable`] referenced by this type remains valid for the lifetime of this object.
> +///
> +/// # Invariants
> +///
> +/// - This type is proof that `self.0.sgt_res` is initialized with a `Some(Devres<SGTableMap<T>>)`.
> +/// - This object is only exposed in situations where we know the underlying `SGTable` will not be
> +///   modified for the lifetime of this object. Thus, it is safe to send/access this type across
> +///   threads.
> +pub struct SGTable<T: DriverObject>(ARef<Object<T>>);
> +
> +// SAFETY: This object is thread-safe via our type invariants.
> +unsafe impl<T: DriverObject> Send for SGTable<T> {}
> +// SAFETY: This object is thread-safe via our type invariants.
> +unsafe impl<T: DriverObject> Sync for SGTable<T> {}
> +
> +impl<T: DriverObject> Deref for SGTable<T> {
> +    type Target = Devres<SGTableMap<T>>;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: `self.owner.sgt_res` is guaranteed to be initialized with
> +        // `Some(Devres<SGTableMap<T>>)` via our type invariants
> +        unsafe { (*self.0.sgt_res.get()).as_ref().unwrap_unchecked() }
> +    }
> +}
> -- 
> 2.53.0
> 

